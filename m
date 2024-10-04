Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8539899091C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 18:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCC210EA45;
	Fri,  4 Oct 2024 16:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="HaX8nOJm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA6C10EA45
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 16:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+ToU/cCDQxvPZGABEX4zvJeWof5X6I9KDLPxE68DOgg=; b=HaX8nOJmJasudZjLYkR80Ywnvr
 yZsl/Nu7KqjIylQ76RIlIBxbK1HynsAi0zrvbFTqFf+WxBkRlQ3T4x9R9FyPnUFn1KubZZERj1Cwx
 5YKRjt7/QpUCDNjIXOWuBBlnYK3Ny3bhNWFP2yo/xK0ouPXQVsgALPJJQItLmkoQP8cLiobKm/3lX
 OqUBrRWTYhu0x1J8QPYQFxFIDhwdGDKDRtg76MjECRNz/pEoudZt1hCcStJLXV8EkPU8EL7wgyjnN
 GMnfJ3MrTbCQfItBCOKeuxRnkOSbbaqNEr9ErFvGdHOYfd0Xpu8QRxQ42MCNijtIIiXnztnc24+0l
 ZFfvMflw==;
Received: from [139.47.49.49] (helo=[192.168.1.139])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1swl7i-004ucx-Fg; Fri, 04 Oct 2024 18:25:46 +0200
Message-ID: <5d674670c6f43bd501c20f5cc066a3f3a1531e50.camel@igalia.com>
Subject: Re: [PATCH 2/2] drm/vc4: Stop the active perfmon before being
 destroyed
From: "Juan A." =?ISO-8859-1?Q?Su=E1rez?= <jasuarez@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Maxime Ripard
 <mripard@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com, 
 stable@vger.kernel.org, Boris Brezillon <bbrezillon@kernel.org>
Date: Fri, 04 Oct 2024 18:25:45 +0200
In-Reply-To: <20241004123817.890016-2-mcanal@igalia.com>
References: <20241004123817.890016-1-mcanal@igalia.com>
 <20241004123817.890016-2-mcanal@igalia.com>
Autocrypt: addr=jasuarez@igalia.com; prefer-encrypt=mutual;
 keydata=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
 fUePB/i37LpOs4mt4/zIFeWDJxdHzBNHg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
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

Worth to mention we got this issue happened also for v3d (a fix was
already submitted).


Reviewed-by: Juan A. Suarez <jasuarez@igalia.com>


On Fri, 2024-10-04 at 09:36 -0300, Ma=C3=ADra Canal wrote:
> Upon closing the file descriptor, the active performance monitor is
> not
> stopped. Although all perfmons are destroyed in
> `vc4_perfmon_close_file()`,
> the active performance monitor's pointer (`vc4->active_perfmon`) is
> still
> retained.
>=20
> If we open a new file descriptor and submit a few jobs with
> performance
> monitors, the driver will attempt to stop the active performance
> monitor
> using the stale pointer in `vc4->active_perfmon`. However, this
> pointer
> is no longer valid because the previous process has already
> terminated,
> and all performance monitors associated with it have been destroyed
> and
> freed.
>=20
> To fix this, when the active performance monitor belongs to a given
> process, explicitly stop it before destroying and freeing it.
>=20
> Cc: <stable@vger.kernel.org> # v4.17+
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Juan A. Suarez Romero <jasuarez@igalia.com>
> Fixes: 65101d8c9108 ("drm/vc4: Expose performance counters to
> userspace")
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/vc4/vc4_perfmon.c | 7 ++++++-
> =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_perfmon.c
> b/drivers/gpu/drm/vc4/vc4_perfmon.c
> index f2e56d0f6298..f1342f917cf7 100644
> --- a/drivers/gpu/drm/vc4/vc4_perfmon.c
> +++ b/drivers/gpu/drm/vc4/vc4_perfmon.c
> @@ -116,6 +116,11 @@ void vc4_perfmon_open_file(struct vc4_file
> *vc4file)
> =C2=A0static int vc4_perfmon_idr_del(int id, void *elem, void *data)
> =C2=A0{
> =C2=A0	struct vc4_perfmon *perfmon =3D elem;
> +	struct vc4_dev *vc4 =3D (struct vc4_dev *)data;
> +
> +	/* If the active perfmon is being destroyed, stop it first
> */
> +	if (perfmon =3D=3D vc4->active_perfmon)
> +		vc4_perfmon_stop(vc4, perfmon, false);
> =C2=A0
> =C2=A0	vc4_perfmon_put(perfmon);
> =C2=A0
> @@ -130,7 +135,7 @@ void vc4_perfmon_close_file(struct vc4_file
> *vc4file)
> =C2=A0		return;
> =C2=A0
> =C2=A0	mutex_lock(&vc4file->perfmon.lock);
> -	idr_for_each(&vc4file->perfmon.idr, vc4_perfmon_idr_del,
> NULL);
> +	idr_for_each(&vc4file->perfmon.idr, vc4_perfmon_idr_del,
> vc4);
> =C2=A0	idr_destroy(&vc4file->perfmon.idr);
> =C2=A0	mutex_unlock(&vc4file->perfmon.lock);
> =C2=A0	mutex_destroy(&vc4file->perfmon.lock);

