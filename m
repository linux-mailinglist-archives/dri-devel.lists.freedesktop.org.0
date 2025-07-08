Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D09AAFD574
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 19:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D754E10E010;
	Tue,  8 Jul 2025 17:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="Fn6XetXe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6499310E010
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 17:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=9oWcLDoMCvEUhMjZGQXzq2GF59iQ6vNkEPntVHdOxp0=; b=Fn6XetXezplB/+ZprpRXlEgAQZ
 nU11Mdm+85LKQ8BPMBLxR7FCz5e6J0ZQzyqgV/rMzR37kVeZhp60UoKISwtDFQDOETctFYomjW9Gj
 qq1tGPXq7uhOxsWa8cKz6qLFLZzEtU1Yr69OVebDLdzvj6jG0arArRVwprsC4MDUebdrmfwVUfM4d
 mZQ4cqmxjamPmPmK8yEAtjF6RpDu/wWcNzVMuEWi66Und3UBG9y5ebiBiWTdOiAhHMuEugrxWJe4k
 /nilHLwDGmm9zkJh4f6adFhb43ANEspLMRXp6txQ+qLW456qseWnN/fRRSKvgtDwcRqbxg4z5rPBS
 GPQR5VJQ==;
Received: from i53875a8d.versanet.de ([83.135.90.141]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uZCE4-0005cC-TX; Tue, 08 Jul 2025 19:35:28 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 derek.foreman@collabora.com, daniel@fooishbar.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] drm/rockchip: vop2: Fix the update of LAYER/PORT select
 registers when there are multi display output on rk3588/rk3568
Date: Tue,  8 Jul 2025 19:35:12 +0200
Message-ID: <175199006061.1731917.645367019907326857.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250421102156.424480-1-andyshrk@163.com>
References: <20250421102156.424480-1-andyshrk@163.com>
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


On Mon, 21 Apr 2025 18:21:54 +0800, Andy Yan wrote:
> The all video ports of rk3568/rk3588 share the same OVL_LAYER_SEL
> and OVL_PORT_SEL registers, and the configuration of these two registers
> can be set to take effect when the vsync signal arrives at a certain Video
> Port.
> 
> If two threads for two display output choose to update these two registers
> simultaneously to meet their own plane adjustment requirements(change plane
> zpos or switch plane from one crtc to another), then no matter which Video
> Port'svsync signal we choose to follow for these two registers, the display
> output of the other Video Port will be abnormal.
> This is because the configuration of this Video Port does not take
> effect at the right time (its configuration should take effect when its
> VSYNC signal arrives).
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: vop2: Fix the update of LAYER/PORT select registers when there are multi display output on rk3588/rk3568
      commit: 3e89a8c6835476aa782da80585dee9ddae651eea

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
