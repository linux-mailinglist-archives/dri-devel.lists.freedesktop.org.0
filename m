Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4807AA01C10
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jan 2025 22:50:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056AB10E120;
	Sun,  5 Jan 2025 21:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="mXrKcV8o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A5010E120
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jan 2025 21:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YkgO0Dr/gEnE1tJuIVv4smNd7nOA51NAoW/XISsoUGw=; b=mXrKcV8owCiOtvFBiI4pPz2Nh1
 /eM5ykWCKZmGI8dy+UlMz5TMhsRpbSBSlkBUxbCyY4rOwUKEhGaz3g+TGNnQlhuG9UADtZRvKONnU
 xpWTVV44elCH/8lLHCHw93ukS6sev/rbBEDIExlDMHju9+Kz5t8/kZTLOKckKCe3LyZviU9r3PH6c
 32Z2XZpPKJyqlhVR1W/QyJQkEV+lA/r1B7reEXxrhckCTYqBoiBdjrFckMGoKxu0fxGrNhyqOUFlk
 jMXA09loWL8C3VevO031p4m0jWV7MMrYooNxdWsTYk2ZdEFyGEH8mWjPtNiw9bUaE1Zg2OkCIanJW
 h1DOYhrQ==;
Received: from i53875aad.versanet.de ([83.135.90.173] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tUYVz-0002Fg-Pz; Sun, 05 Jan 2025 22:50:31 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 derek.foreman@collabora.com, detlev.casanova@collabora.com,
 daniel@fooishbar.org, Andy Yan <andy.yan@rock-chips.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v8 2/9] drm/rockchip: vop2: Add platform specific callback
Date: Sun, 05 Jan 2025 22:50:30 +0100
Message-ID: <17026630.geO5KgaWL5@diego>
In-Reply-To: <20241231090802.251787-3-andyshrk@163.com>
References: <20241231090802.251787-1-andyshrk@163.com>
 <20241231090802.251787-3-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Am Dienstag, 31. Dezember 2024, 10:07:45 CET schrieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The VOP interface mux, overlay, background delay cycle configuration
> of different SOC are much different. Add platform specific callback
> ops to let the core driver look cleaner and more refined.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Tested-by: Michael Riesch <michael.riesch@wolfvision.net> # on RK3568
> Tested-by: Detlev Casanova <detlev.casanova@collabora.com>

>  static int vop2_cluster_init(struct vop2_win *win)
>  {
>  	struct vop2 *vop2 = win->vop2;
>  	struct reg_field *cluster_regs;
>  	int ret, i;
>  
> -	cluster_regs = kmemdup(vop2_cluster_regs, sizeof(vop2_cluster_regs),
> +	cluster_regs = kmemdup(vop2->data->cluster_reg,
> +			       sizeof(struct reg_field) * vop2->data->nr_cluster_regs,
>  			       GFP_KERNEL);
>  	if (!cluster_regs)
>  		return -ENOMEM;
>  
> -	for (i = 0; i < ARRAY_SIZE(vop2_cluster_regs); i++)
> +	for (i = 0; i < vop2->data->nr_cluster_regs; i++)
>  		if (cluster_regs[i].reg != 0xffffffff)
>  			cluster_regs[i].reg += win->offset;
>  
>  	ret = devm_regmap_field_bulk_alloc(vop2->dev, vop2->map, win->reg,
>  					   cluster_regs,
> -					   ARRAY_SIZE(vop2_cluster_regs));
> -
> +					   vop2->data->nr_cluster_regs);
>  	kfree(cluster_regs);
>  
>  	return ret;
>  };

Even the original code, makes checkpatch really unhappy nowadays :-( .

As per
https://lore.kernel.org/all/20240706-regmap-const-structs-v1-1-d08c776da787@weissschuh.net/
reg_field should be considered const, so copying the original struct and
then modifying it causes checkpatch warnings now.

I've tried to adapt the function as in the patch below. This should
contain the same functionality as before, just with keeping the reg_field
const.

As it's the weekend, I didn't have time to test that change, so it's more
meant as an idea on how to proceed.


> +	/* afbc regs */
> +	[VOP2_WIN_AFBC_FORMAT] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_CTRL, 2, 6),
> +	[VOP2_WIN_AFBC_RB_SWAP] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_CTRL, 9, 9),
> +	[VOP2_WIN_AFBC_UV_SWAP] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_CTRL, 10, 10),
> +	[VOP2_WIN_AFBC_AUTO_GATING_EN] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_OUTPUT_CTRL, 4, 4),
> +	[VOP2_WIN_AFBC_HALF_BLOCK_EN] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_CTRL, 7, 7),
> +	[VOP2_WIN_AFBC_BLOCK_SPLIT_EN] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_CTRL, 8, 8),
> +	[VOP2_WIN_AFBC_HDR_PTR] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_HDR_PTR, 0, 31),
> +	[VOP2_WIN_AFBC_PIC_SIZE] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_PIC_SIZE, 0, 31),
> +	[VOP2_WIN_AFBC_PIC_VIR_WIDTH] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_VIR_WIDTH, 0, 15),
> +	[VOP2_WIN_AFBC_TILE_NUM] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_VIR_WIDTH, 16, 31),
> +	[VOP2_WIN_AFBC_PIC_OFFSET] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_PIC_OFFSET, 0, 31),
> +	[VOP2_WIN_AFBC_DSP_OFFSET] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_DSP_OFFSET, 0, 31),
> +	[VOP2_WIN_AFBC_TRANSFORM_OFFSET] = REG_FIELD(RK3568_CLUSTER_WIN_AFBCD_TRANSFORM_OFFSET, 0, 31),

exceeds the 100 char line length, so I think we should have a line break
after RK3568_CLUSTER_WIN_AFBCD_TRANSFORM_OFFSET


Thanks
Heiko

---------------- 8< ---------------
From: Heiko Stuebner <heiko@sntech.de>
Date: Sun, 5 Jan 2025 17:38:31 +0100
Subject: [PATCH] drm/rockchip: vop2: use devm_regmap_field_alloc for cluster-regs

Right now vop2_cluster_init() copies the base vop2_cluster_regs and adapts
the reg value with the current window's offset before adding the fields to
the regmap.

This conflicts with the notion of reg_fields being const, see
https://lore.kernel.org/all/20240706-regmap-const-structs-v1-1-d08c776da787@weissschuh.net/
for reference, which now causes checkpatch to actually warn about that.

So instead of creating one big copy and changing it afterwards, add the
reg_fields individually using devm_regmap_field_alloc().

Functional it is the same, just that the reg_field we're handling
can stay const.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 30 +++++++++-----------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 17a98845fd31..c8da1ebb6013 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -3443,25 +3443,23 @@ static struct reg_field vop2_cluster_regs[VOP2_WIN_MAX_REG] = {
 static int vop2_cluster_init(struct vop2_win *win)
 {
 	struct vop2 *vop2 = win->vop2;
-	struct reg_field *cluster_regs;
-	int ret, i;
-
-	cluster_regs = kmemdup(vop2_cluster_regs, sizeof(vop2_cluster_regs),
-			       GFP_KERNEL);
-	if (!cluster_regs)
-		return -ENOMEM;
+	int i;
 
-	for (i = 0; i < ARRAY_SIZE(vop2_cluster_regs); i++)
-		if (cluster_regs[i].reg != 0xffffffff)
-			cluster_regs[i].reg += win->offset;
+	for (i = 0; i < ARRAY_SIZE(vop2_cluster_regs); i++) {
+		const struct reg_field field = {
+			.reg = (vop2_cluster_regs[i].reg != 0xffffffff) ?
+					vop2_cluster_regs[i].reg + win->offset :
+					vop2_cluster_regs[i].reg,
+			.lsb = vop2_cluster_regs[i].lsb,
+			.msb = vop2_cluster_regs[i].msb
+		};
 
-	ret = devm_regmap_field_bulk_alloc(vop2->dev, vop2->map, win->reg,
-					   cluster_regs,
-					   ARRAY_SIZE(vop2_cluster_regs));
-
-	kfree(cluster_regs);
+		win->reg[i] = devm_regmap_field_alloc(vop2->dev, vop2->map, field);
+		if (IS_ERR(win->reg[i]))
+			return PTR_ERR(win->reg[i]);
+	}
 
-	return ret;
+	return 0;
 };
 
 static struct reg_field vop2_esmart_regs[VOP2_WIN_MAX_REG] = {
-- 
2.45.2





