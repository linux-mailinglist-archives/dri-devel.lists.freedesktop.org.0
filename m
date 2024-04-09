Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B5989D644
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 12:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5170112C52;
	Tue,  9 Apr 2024 10:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7C3112C50
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 10:06:36 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ru8N6-0001RS-RO; Tue, 09 Apr 2024 12:06:32 +0200
Message-ID: <6ca9f9361fc04a285326a9e2e4b67c24b03b79b5.camel@pengutronix.de>
Subject: Re: [PATCH] drm/atomic-helper: fix parameter order in
 drm_format_conv_state_copy() call
From: Lucas Stach <l.stach@pengutronix.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>, 
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de, 
 patchwork-lst@pengutronix.de
Date: Tue, 09 Apr 2024 12:06:32 +0200
In-Reply-To: <20240404081756.2714424-1-l.stach@pengutronix.de>
References: <20240404081756.2714424-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Am Donnerstag, dem 04.04.2024 um 10:17 +0200 schrieb Lucas Stach:
> Old and new state parameters are swapped, so the old state was cleared
> instead of the new duplicated state.
>=20
To be clear, as the commit message may do a poor job at conveying the
consequences: this fixes a major memory leak when a temporary buffer is
used for the format conversion, as clearing the wrong state lets us
forget about the existence of the temporary buffer on each atomic
commit. So each commit allocates a new temp buffer while the old one is
never freed.

As such I would appreciate if this commit is added to the next round of
-fixes.

Regards,
Lucas

> Fixes: 903674588a48 ("drm/atomic-helper: Add format-conversion state to s=
hadow-plane state")
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Tested-by: Leonard G=C3=B6hrs <l.goehrs@pengutronix.de>
> ---
>  drivers/gpu/drm/drm_gem_atomic_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/dr=
m_gem_atomic_helper.c
> index e440f458b663..93337543aac3 100644
> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
> @@ -224,8 +224,8 @@ __drm_gem_duplicate_shadow_plane_state(struct drm_pla=
ne *plane,
> =20
>  	__drm_atomic_helper_plane_duplicate_state(plane, &new_shadow_plane_stat=
e->base);
> =20
> -	drm_format_conv_state_copy(&shadow_plane_state->fmtcnv_state,
> -				   &new_shadow_plane_state->fmtcnv_state);
> +	drm_format_conv_state_copy(&new_shadow_plane_state->fmtcnv_state,
> +				   &shadow_plane_state->fmtcnv_state);
>  }
>  EXPORT_SYMBOL(__drm_gem_duplicate_shadow_plane_state);
> =20

