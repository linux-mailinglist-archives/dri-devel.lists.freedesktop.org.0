Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA90BF175F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 15:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1810410E435;
	Mon, 20 Oct 2025 13:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="EWwl2h77";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3191F10E435
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 13:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=3mHByNihfSRthfdKXgW/k3djIGjdFxSRNPij5yH2vSo=; b=EWwl2h77RdeGkAho1stb7lLTUh
 VhZtvDeoqB8JU04yKzLQXsoUO827UDc20GlJLfJYAlExEE/yHLN+Ns8csFquPI9ZHdPep16A4084n
 3sScqXCMfAFMlQXvgGyzZFRz92/TxHovmM0uEtOPygxtNC1uNcwIPtnDfcb2OVbQQqFgW1WGy37iR
 5sIp4iuCr/XpxgA76sssl0rPDViOvDxGo1zX4zdqK4bKQ/Pt/EZHkky/kRTQmqL7ysK85gXBYc4Qk
 NsUau7+9VsTMFnl9TruHSjS1XUiS9Bozyxqn4CjyGHA/5eP/zhq3aHNMWNdI2e4/FV7LqrayJJUuX
 gg/ht7zA==;
Received: from [141.76.253.240] (helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vApei-0001NM-7t; Mon, 20 Oct 2025 15:10:32 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>
Cc: andy.yan@rock-chips.com, hjc@rock-chips.com,
 cristian.ciocaltea@collabora.com, kernel@collabora.com
Subject: Re: [PATCH 06/13] drm/rockchip: Switch impossible format conditional
 to WARN_ON
Date: Mon, 20 Oct 2025 15:10:31 +0200
Message-ID: <26943126.6Emhk5qWAg@phil>
In-Reply-To: <20251015110042.41273-7-daniels@collabora.com>
References: <20251015110042.41273-1-daniels@collabora.com>
 <20251015110042.41273-7-daniels@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Hi Daniel,

Am Mittwoch, 15. Oktober 2025, 13:00:35 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Daniel Stone:
> We should never be able to create a framebuffer with an unsupported
> format, so throw a warning if this ever happens, instead of attempting
> to stagger on.
>=20
> Signed-off-by: Daniel Stone <daniels@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> index 284c8a048034..8c5042fb2e7e 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1029,8 +1029,8 @@ static int vop2_plane_atomic_check(struct drm_plane=
 *plane,
>  		return 0;
> =20
>  	format =3D vop2_convert_format(fb->format->format);
> -	if (format < 0)
> -		return format;
> +	/* We shouldn't be able to create a fb for an unsupported format */
> +	WARN_ON(format < 0);

What happened to Greg's
"But don't add new WARN() calls please, just properly clean up and handle
the error." [0]

Also, switching to WARN_ON would then continue the atomic_check function
where it currently does exit with a real error code?


Heiko


[0] https://lwn.net/ml/linux-kernel/2024041544-fester-undead-7949@gregkh/


