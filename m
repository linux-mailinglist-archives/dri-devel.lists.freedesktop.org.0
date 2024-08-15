Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2725952C7C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 12:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B14410E112;
	Thu, 15 Aug 2024 10:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="KnZffoTb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76AAA10E112
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 10:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a9GBbYPkeTfUE5fCEbTb5Vw8tBG93HmtU9gtgrmT2E4=; b=KnZffoTboGeiLJ31fWWRKFDwo8
 gj8Ve/5+yxpOV6um7lLHc8KK4lyjkpPHARerdBEoi1xe4aupb2DWRJZF41FaR/zyzb/maEN6EKJBS
 ozdIBQerQM9CUW5TBcCzcbUWqSf2UpF6/W33zSHPR0wIsVDTJlqrJ49qMipD5oyMhiE/hxr9G95eR
 qVSd0IBduLgAnKu5pqnj69AN3uX3LoaN4Y8qexV1+B9BcNrpZdYzfAP8PGhtqQ9gKLHicaQeSsviZ
 g7UBWPcr6yZqIClmLcrctpZDlu6i2aZySE0DB6T8mGy9aviB36/8Sx+n3BGIqjwM+kcrRCQeInA42
 /Oa88cIg==;
Received: from i53875a9f.versanet.de ([83.135.90.159] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1seXuE-0000nZ-US; Thu, 15 Aug 2024 12:40:35 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Daniel Vetter <daniel@ffwll.ch>, Andy Yan <andy.yan@rock-chips.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 David Airlie <airlied@gmail.com>, Sandy Huang <hjc@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] drm/rockchip: Constify struct drm_encoder_helper_funcs
Date: Thu, 15 Aug 2024 12:40:28 +0200
Message-Id: <172371788341.684432.4454726624748844330.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <128f9941aab3b1367eb7abca4ac26e2e5dd6ad21.1720903899.git.christophe.jaillet@wanadoo.fr>
References: <128f9941aab3b1367eb7abca4ac26e2e5dd6ad21.1720903899.git.christophe.jaillet@wanadoo.fr>
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

On Sat, 13 Jul 2024 22:52:05 +0200, Christophe JAILLET wrote:
> 'struct drm_encoder_helper_funcs' is not modified in these drivers.
> 
> Constifying this structure moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>    7458	    552	      0	   8010	   1f4a	drivers/gpu/drm/rockchip/analogix_dp-rockchip.o
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: Constify struct drm_encoder_helper_funcs
      commit: 7af62003181f8589b3b597ef96b147d4303771c4

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
