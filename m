Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7682084212C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:23:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0DF112EFD;
	Tue, 30 Jan 2024 10:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70A310F887;
 Tue, 30 Jan 2024 10:23:09 +0000 (UTC)
Received: from 91-155-255-116.elisa-laajakaista.fi ([91.155.255.116]
 helo=RAVPPB-CIM.amr.corp.intel.com)
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97-RC1) (envelope-from <luca@coelho.fi>)
 id 1rUlGk-00000001Y0B-3RqD; Tue, 30 Jan 2024 12:23:08 +0200
Message-ID: <f745df73a1361b028965dae97e7163c48aca82fc.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Date: Tue, 30 Jan 2024 12:23:05 +0200
In-Reply-To: <56f6f3e8e045206706d7a292968b6b2f4fc19c27.1705410327.git.jani.nikula@intel.com>
References: <cover.1705410327.git.jani.nikula@intel.com>
 <56f6f3e8e045206706d7a292968b6b2f4fc19c27.1705410327.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on farmhouse.coelho.fi
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 TVD_RCVD_IP autolearn=ham autolearn_force=no version=4.0.0
Subject: Re: [PATCH 05/10] drm/mode: switch from drm_debug_printer() to
 device specific drm_dbg_printer()
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
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2024-01-16 at 15:07 +0200, Jani Nikula wrote:
> Prefer the device specific debug printer.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_mode_config.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode=
_config.c
> index 8525ef851540..48fd2d67f352 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -544,7 +544,7 @@ void drm_mode_config_cleanup(struct drm_device *dev)
>  	 */
>  	WARN_ON(!list_empty(&dev->mode_config.fb_list));
>  	list_for_each_entry_safe(fb, fbt, &dev->mode_config.fb_list, head) {
> -		struct drm_printer p =3D drm_debug_printer("[leaked fb]");
> +		struct drm_printer p =3D drm_dbg_printer(dev, DRM_UT_KMS, "[leaked fb]=
");
> =20
>  		drm_printf(&p, "framebuffer[%u]:\n", fb->base.id);
>  		drm_framebuffer_print_info(&p, 1, fb);

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
