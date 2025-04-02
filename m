Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFC8A78C9D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 12:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A1710E747;
	Wed,  2 Apr 2025 10:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 307 seconds by postgrey-1.36 at gabe;
 Wed, 02 Apr 2025 10:46:05 UTC
Received: from irl.hu (irl.hu [95.85.9.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6DD10E747
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 10:46:05 +0000 (UTC)
Received: from [192.168.2.19] (51b692a2.dsl.pool.telekom.hu
 [::ffff:81.182.146.162]) (AUTH: CRAM-MD5 soyer@irl.hu, )
 by irl.hu with ESMTPSA
 id 0000000000080C4C.0000000067ED1436.00082B78; Wed, 02 Apr 2025 12:40:54 +0200
Message-ID: <ed09edb167e74167a694f4854102a3de6d2f1433.camel@irl.hu>
Subject: amdgpu_dm_connector_mode_valid regression
From: Gergo Koteles <soyer@irl.hu>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>
Date: Wed, 02 Apr 2025 12:40:53 +0200
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

Hi,

While playing with
https://lore.kernel.org/all/61c3df83ab73aba0bc7a941a443cd7faf4cf7fb0.174319=
5250.git.soyer@irl.hu/

I found a regression that prevented some EDID DTDs from being selected
in some specific cases.

This is the first bad commit:
b255ce4 ("drm/amdgpu: don't change mode in
amdgpu_dm_connector_mode_valid()")

I think the problem is that decide_crtc_timing_for_drm_display_mode()
function tries to copy the crtc information from the preferred mode,
but that's not filled yet if the first one is the preferred one and
it's not the one with the maximum refresh rate.

amdgpu_dm_connector_mode_valid()
create_validate_stream_for_sink()
create_stream_for_sink()
decide_crtc_timing_for_drm_display_mode(&mode, preferred_mode, scale)

It works if I call
drm_mode_set_crtcinfo((struct drm_display_mode *)mode, 0) before=20
create_validate_stream_for_sink()
in amdgpu_dm_connector_mode_valid()

or=20

if I comment out the decide_crtc_timing_for_drm_display_mode() in
create_stream_for_sink()

but a better fix than these can be imagined :)

more information:
https://gitlab.freedesktop.org/drm/amd/-/issues/4085

Regards,
Gergo

