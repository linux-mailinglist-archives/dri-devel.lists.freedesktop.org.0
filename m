Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A2F74E538
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 05:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667ED10E2ED;
	Tue, 11 Jul 2023 03:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B13810E2ED
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 03:21:15 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R0R3X4dJfzBJBfn
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 11:21:12 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689045672; x=1691637673; bh=dYPuDHl1tnfdtcIN5hTzLA5ou8I
 V58S6FNhlV5nglao=; b=BeGelFb5flgxR5VQBr/OwmCaYNoFpnRcg3wd6g7nEjz
 1jZ3lq7v//Y+BeKqzLzUXcT8gbcqkq+fGyUgyM68sQAL6X2r3dj7U2bGdlXFywZI
 F+yoXB7itv7hk7jmZPFjvRY0wwuvs+Y/UFIZFoVovHFBEIXaKNky+gaXkUSkPrzY
 oC4BNBrk8uvae9ECNuO9cPJ79KQmFKRY1p9dbRTMuPyLBQQFFDB/INR7SXLYulig
 jGR3CXZ7bfxptYlp6vj0DX44zpoLJ4fGX5+Sujygg4T5U8MJC+HepHgCWwxBV9FC
 4HYRL2CKSCJFP+RjJHFs4ymhuEx0qsDIOJ0IkZZdToQ==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id J6Gal8c3YOZJ for <dri-devel@lists.freedesktop.org>;
 Tue, 11 Jul 2023 11:21:12 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R0R3X23NzzBJ8kq;
 Tue, 11 Jul 2023 11:21:12 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 11 Jul 2023 11:21:12 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/nouveau/clk: Move assignment outside if condition
In-Reply-To: <20230711032005.78965-1-xujianghui@cdjrlc.com>
References: <20230711032005.78965-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <2b80ed17d5c46a133887eb1f88691641@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following checkpatch errors:

ERROR: do not use assignment in if condition

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.c 
b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.c
index f85d6a08c61a..77465bfa71ea 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.c
@@ -414,7 +414,8 @@ mcp77_clk_new(struct nvkm_device *device, enum 
nvkm_subdev_type type, int inst,
  {
      struct mcp77_clk *clk;

-    if (!(clk = kzalloc(sizeof(*clk), GFP_KERNEL)))
+    clk = kzalloc(sizeof(*clk), GFP_KERNEL);
+    if (!clk)
          return -ENOMEM;
      *pclk = &clk->base;
