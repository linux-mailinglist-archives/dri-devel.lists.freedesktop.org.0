Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6114F9C2FD1
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 23:52:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820A810E0EC;
	Sat,  9 Nov 2024 22:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="xPjXkOJt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34D510E0EC
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2024 22:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xKSRMiOUcm6WD8u8BC8dWSf2cMiJUWHKxDSv2viQmW8=; b=xPjXkOJtxqvG76fVuVNp5QubWb
 bQ0iI5yrwfAuEASUpIVWgtuMSVgQyuv66vDW774RBFsdR8ZiDlFVoofuhSxPJtG6jLnSf6ajXzDl9
 xK3xe+vi0ed0tl5t08dmKy5Qfq4HZWHbSJJwndZ9XvMNqBdasvMgnIc83x+4laGZ7jLOuEQDzTGq0
 YERZBfpp4KgNx9TPeyM3Xc+STaPipzugGrjpzwqsoyhJXSwsTawRPDpLKtZirXn3ue8FXpjTHuJE+
 FvNoEtwDkA7Xj+FYKK3kNtc6/PYR/dHvwpXu65IPkXoKoJVKH4Dl6OGRW2PZrO0gaYwYCHz8ySp4b
 J8TJi0hg==;
Received: from i53875b28.versanet.de ([83.135.91.40]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1t9uJO-0000NE-FH; Sat, 09 Nov 2024 23:52:10 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: tzimmermann@suse.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
 mripard@kernel.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 Piotr Zalewski <pZ010001011111@proton.me>, linux-kernel@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>, Diederik de Haas <didi.debian@cknow.org>,
 Daniel Stone <daniel@fooishbar.org>, Dragan Simic <dsimic@manjaro.org>,
 skhan@linuxfoundation.org
Subject: Re: [PATCH v7] rockchip/drm: vop2: add support for gamma LUT
Date: Sat,  9 Nov 2024 23:51:57 +0100
Message-ID: <173119266841.1201296.14807724034242534977.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101185545.559090-3-pZ010001011111@proton.me>
References: <20241101185545.559090-3-pZ010001011111@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 01 Nov 2024 19:01:17 +0000, Piotr Zalewski wrote:
> Add support for gamma LUT in VOP2 driver. The implementation was inspired
> by one found in VOP1 driver. Blue and red channels in gamma LUT register
> write were swapped with respect to how gamma LUT values are written in
> VOP1. Gamma LUT port selection was added before the write of new gamma LUT
> table.
> 
> If the current SoC is rk356x, check if no other CRTC has gamma LUT enabled
> in atomic_check (only one video port can use gamma LUT at a time) and
> disable gamma LUT before the LUT table write.
> 
> [...]

Applied, thanks!

[1/1] rockchip/drm: vop2: add support for gamma LUT
      commit: 4f537776340dab2b680a4d8554567f6884240d0b

I've fixed a number of smaller styling nits that
checkpatch --strict found.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
