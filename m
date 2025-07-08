Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E13D6AFD57F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 19:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A80510E1D2;
	Tue,  8 Jul 2025 17:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="wvUWkg3F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5BF10E04C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 17:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=UsrAewYdxCOw7meyNu9Dxfatxc14gQYGLBU0rmsxSXI=; b=wvUWkg3FkW0jkJVolAjco2fGUu
 e2sbQ0rIKJLerF6maTBPwGeip1j6T7f2pvNpS90enolEnhNMCBIHkMjFGj1ZLGKPG67FOBOFGRfOS
 VHnjeAtbkAH0u1KKj//tyRfM+vb2aEov6XExzXwOfeqeEbOJ3v77ajzGvhPCLtoKKi39mxK5+0MPJ
 ayP8CGHSIslNeZUtFZ+q1I01UXdxx34uWs3ETy738UirGof9X323x8y6VcnB1jpDcd89j/9DHoMc+
 sLXRU6N4rO0TtHjL1ve2JLWn0AmxqKMJ0MLZyP0B/RuB9KZz2qx2sB0nz/soxYk0zjhIS3iSbojIy
 RfWQC2Kg==;
Received: from i53875a8d.versanet.de ([83.135.90.141]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uZCE7-0005cC-6g; Tue, 08 Jul 2025 19:35:31 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH v4] drm/rockchip: cdn-dp: Convert to drm bridge
Date: Tue,  8 Jul 2025 19:35:16 +0200
Message-ID: <175199006057.1731917.377817003707865970.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250529071334.441-1-kernel@airkyi.com>
References: <20250529071334.441-1-kernel@airkyi.com>
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


On Thu, 29 May 2025 15:13:34 +0800, Chaoyi Chen wrote:
> Convert it to drm bridge driver, it will be convenient for us to
> migrate the connector part to the display driver later.
> Considering that some code depend on the connector, the following
> changes have been made:
> - Only process edid in &drm_bridge_funcs.edid_read(), so no need to
> store additional edid info.
> - Now cdn_dp_get_sink_capability() only focused on reading DPCD_REV.
> - Update bpc info in cdn_dp_bridge_atomic_enable() instead of
> cdn_dp_encoder_mode_set(). Actually, the bpc data will be used in
> cdn_dp_bridge_atomic_enable().
> - Switch to use DRM_BRIDGE_OP_DP_AUDIO helpers.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: cdn-dp: Convert to drm bridge
      commit: afbbca25d06e2d361016da43dbb90f3a6034913b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
