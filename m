Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 215664C5541
	for <lists+dri-devel@lfdr.de>; Sat, 26 Feb 2022 11:48:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2714510EB12;
	Sat, 26 Feb 2022 10:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E32110EAF2
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Feb 2022 10:48:48 +0000 (UTC)
Received: from g550jk.localnet (ip-213-127-118-180.ip.prioritytelecom.net
 [213.127.118.180])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id 37606C8605;
 Sat, 26 Feb 2022 10:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
 t=1645872526; bh=9e0zUHAtpcm6p+onT65QRQtjl2auPw0iVuGvjSiv8aI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=VQLDBrl3kARN6PYZKg9xYlq+rxV9ReqaEywy7CvNxzow9aF51kRIz8nJse/iJ9Y4X
 Eayrjv/87/94l1ymZBA01kPYdRWY7vHfJ6w5B7Ea58kHnVN05EDZ5TMNY2L15doIml
 IH3XDWpU03rw/C9JcIqtFLgDtI7OVrWOAwzSEhA0=
From: Luca Weiss <luca@z3ntu.xyz>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: add missing dependency to DRM_PANEL_EDP
Date: Sat, 26 Feb 2022 11:48:45 +0100
Message-ID: <4384381.iIbC2pHGDl@g550jk>
In-Reply-To: <20220123204322.345725-1-luca@z3ntu.xyz>
References: <20220123204322.345725-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, any feedback on this patch?

On Sonntag, 23. J=E4nner 2022 21:43:23 CET Luca Weiss wrote:
> With CONFIG_DRM_PANEL_EDP=3Dy and CONFIG_DRM_KMS_HELPER=3Dm the compilati=
on
> fails:
>=20
>   drivers/gpu/drm/panel/panel-edp.c:843: undefined reference to
> `drm_panel_dp_aux_backlight'
>=20
> Add a dependency on DRM_KMS_HELPER to fix this.
>=20
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> I briefly tried "select DRM_KMS_HELPER" but that causes a circular
> dependency.
> If someone has a better idea how to solve this, feel free correct me.
>=20
>  drivers/gpu/drm/panel/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 434c2861bb40..fda97837ecb3 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -102,6 +102,7 @@ config DRM_PANEL_SIMPLE
>  config DRM_PANEL_EDP
>  	tristate "support for simple Embedded DisplayPort panels"
>  	depends on OF
> +	depends on DRM_KMS_HELPER
>  	depends on BACKLIGHT_CLASS_DEVICE
>  	depends on PM
>  	select VIDEOMODE_HELPERS




