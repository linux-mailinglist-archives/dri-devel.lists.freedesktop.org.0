Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54ABCA79144
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 16:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C122210E7ED;
	Wed,  2 Apr 2025 14:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from irl.hu (irl.hu [95.85.9.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82EC10E7D9;
 Wed,  2 Apr 2025 14:35:13 +0000 (UTC)
Received: from [192.168.2.19] (51b692a2.dsl.pool.telekom.hu
 [::ffff:81.182.146.162]) (AUTH: CRAM-MD5 soyer@irl.hu, )
 by irl.hu with ESMTPSA
 id 0000000000080D7C.0000000067ED4B1A.00083746; Wed, 02 Apr 2025 16:35:06 +0200
Message-ID: <e323219b52cda1891a55d12ad77a2b34edc8688b.camel@irl.hu>
Subject: Re: amdgpu_dm_connector_mode_valid regression
From: Gergo Koteles <soyer@irl.hu>
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, regressions@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>
Date: Wed, 02 Apr 2025 16:35:05 +0200
In-Reply-To: <CALT56yPd-xfd=47xRxrCk4F3jib4Ti7kg8pRXy-gVAQpbOc=pw@mail.gmail.com>
References: <ed09edb167e74167a694f4854102a3de6d2f1433.camel@irl.hu>
 <8963a409dd575e040e5f07e4ad5e9c1d26b421f2.camel@irl.hu>
 <CALT56yPd-xfd=47xRxrCk4F3jib4Ti7kg8pRXy-gVAQpbOc=pw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Wed, 2025-04-02 at 16:36 +0300, Dmitry Baryshkov wrote:
> > >=20
> > > It works if I call
> > > drm_mode_set_crtcinfo((struct drm_display_mode *)mode, 0) before
> > > create_validate_stream_for_sink()
> > > in amdgpu_dm_connector_mode_valid()
> > >=20
> > > or
> > >=20
> > > if I comment out the decide_crtc_timing_for_drm_display_mode() in
> > > create_stream_for_sink()
> > >=20
> > > but a better fix than these can be imagined :)
>=20
> Would it help if you force recalculate_timings to be true if
> (drm_mode->crtc_clock =3D=3D 0)
>=20

Yes, it works with that one.

But the code would start to become quite untraceable.
duplicate mode in amdgpu_dm_connector_mode_valid()
call drm_mode_set_crtcinfo() in amdgpu_dm_connector_mode_valid()
duplicate mode in create_stream_for_sink()
overwrite ctrc in decide_crtc_timing_for_drm_display_mode()
if crtc_clock =3D=3D 0 call drm_mode_set_crtcinfo() again in
create_stream_for_sink()=20

saved_mode is never used after this, so I can't add the condition here
        if (recalculate_timing)
                drm_mode_set_crtcinfo(&saved_mode, 0);

This commit is related, I think:
1101185 ("drm/amd/display: fix the ability to use lower resolution
modes on eDP")

Regards,
Gergo

---
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index bae83a129b5f..83c8c81d4015 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6984,6 +6984,9 @@ create_stream_for_sink(struct drm_connector
*connector,
        if (recalculate_timing)
                drm_mode_set_crtcinfo(&saved_mode, 0);
=20
+       if (mode.crtc_clock =3D=3D 0)
+               drm_mode_set_crtcinfo(&mode, 0);
+
        /*
         * If scaling is enabled and refresh rate didn't change
         * we copy the vic and polarities of the old timings
--
