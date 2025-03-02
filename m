Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 751B9A4B439
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 19:58:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE9D10E1A7;
	Sun,  2 Mar 2025 18:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="zgr8VpMs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC0610E1A7
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 18:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pPjgLLKWy2wvQvaiR+uGJguXDw1skCmohUdLq/bT13M=; b=zgr8VpMs2oAvmtSCdLZNlyiimz
 8LpNFXehoTksa2gEf3aQkohP09ro+0qaqjvYXaQu+KxZB+sIKlyUbvUikUssDkhX7/7AP7k3KfEaz
 CAyKltObROv4gAMOa6xExAlm0l0aEKhoX+c9Pu1qTiFRRCfGJmEIJqtREfcq73tx7Ws1YbwXRGKdw
 WnzTTKVSCtKDSdIL8G1CshPaA0/1AhvPCLPnbygN/m2VtmmRPHGF/nWchoU07/hqyZW/BJqwtS6iH
 00V1WJLr3B0KvowzlMahZEFATeTzBlelY/WUcLfEdDewwy1pfGP6nsBKk3XlXNJTeRn5QvR3q8al7
 Q/n2u9kw==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tooVb-0004sB-28; Sun, 02 Mar 2025 19:57:51 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 derek.foreman@collabora.com, detlev.casanova@collabora.com,
 daniel@fooishbar.org, robh@kernel.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v15 07/13] drm/rockchip: vop2: Register the primary plane
 and overlay plane separately
Date: Sun, 02 Mar 2025 19:57:50 +0100
Message-ID: <2759797.BddDVKsqQX@diego>
In-Reply-To: <20250218112744.34433-8-andyshrk@163.com>
References: <20250218112744.34433-1-andyshrk@163.com>
 <20250218112744.34433-8-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
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

Hi Andy,

Am Dienstag, 18. Februar 2025, 12:27:34 MEZ schrieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> In the upcoming VOP of rk3576, a Window cannot attach to all Video Ports,
> so make sure all VP find it's suitable primary plane, then register the
> remain windows as overlay plane will make code easier.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Tested-by: Michael Riesch <michael.riesch@wolfvision.net> # on RK3568
> Tested-by: Detlev Casanova <detlev.casanova@collabora.com>
> 
> ---

patches 7-9 look good to go, but ...

this needs a rebase to adapt to
"drm/rockchip: vop2: Consistently use dev_err_probe()" [0]

[0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b06d1ef3355571383cdb463cf0195b7a02efdfbf


> -		if (win->type == DRM_PLANE_TYPE_PRIMARY) {
> -			vp = find_vp_without_primary(vop2);
> -			if (vp) {
> +			if (vop2_is_mirror_win(win))
> +				continue;
> +
> +			if (win->type == DRM_PLANE_TYPE_PRIMARY) {
>  				possible_crtcs = BIT(nvp);
>  				vp->primary_plane = win;
> +				ret = vop2_plane_init(vop2, win, possible_crtcs);
> +				if (ret) {
> +					drm_err(vop2->drm, "failed to init primary plane %s: %d\n",
> +						win->data->name, ret);

should also use dev_err_probe


Heiko


