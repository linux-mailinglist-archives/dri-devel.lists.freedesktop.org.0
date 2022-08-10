Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 748EB58E8E7
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 10:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C50F2608;
	Wed, 10 Aug 2022 08:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C559F2603
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 08:37:26 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id w14so13625393plp.9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 01:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=jZE/fMa3whjYdRXk0oQ0myv5N7zyZKLStFntjy3bwEI=;
 b=7izV4xzqPBcm+fkGJWQIWEYXXyBl2KJE72/4VWAYy62YD15G97Ha+FQ7JAASfztKKX
 2XbzwrixQzYP67EER7qP3Uch8n7LGJ3tilyLpiibbUMrlq1wpOX3aCLqQus00U00Vs5U
 XkjIGhmt0gdTU29kmMhJZeayU27DKxFc+0lz4mbQ1MxIVcEv0Lz0pzgbn2SJ79cqPgtM
 pKL74U+gySXOOWjI2QN+nKFRdBkYYtDQgWilsQT1qP6SY4JuoFEqvjyIXycc4QASNwE4
 DwtushkKw3ADZQZkEhwi3gQZU29mugL4ocadBfdmNJRqNjU86DU7SB66Zz6U26+kOs8C
 TuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=jZE/fMa3whjYdRXk0oQ0myv5N7zyZKLStFntjy3bwEI=;
 b=MB8QOG7OQ65wtx6C85NKEHOj0Xe0ROlq2hhn23StRFzTA44eMhXbbwAjQCuDZBnp1p
 h9OvGayMD0Mqrf2yZYFUwCnhQe7CDvXLdNmAlZFnNRWZlZceSJjBLMeWEJhokx3LzX0d
 TbyvIX/tCMLuhELxbRI6yds0RCAfh1T2VBBE2u7g6Oe+d9St0TxuYKISMPbMXDIfQrWk
 mYqVUkTTXHYg4Zd8fS+ueUctDkVp9eVFpOIXP+H1WjIHkeDPyZgt5GROkQDo1Hc5mt7L
 7KU7pnV4yrX0glyXJ0xIlCF+HsYt/8ivMG+Mc+wZDORkg5XkWnDBaMbL1A9EODpyu7Wl
 WU9A==
X-Gm-Message-State: ACgBeo2cl2lbxmWHrd4a3klEd90LRAQFNQa1/4oJAagWazQQpzRIH7dz
 Gca+2C9lLHT5xR1H2zTldFfz8d6O6zdtLw==
X-Google-Smtp-Source: AA6agR6fRL4zAL56XiuF0fIRADvxgqbnar/ch8938KFYKoyIOFDHiYvHp5/BaQbSepd5w8c4gsQUww==
X-Received: by 2002:a17:902:d503:b0:16f:1503:4815 with SMTP id
 b3-20020a170902d50300b0016f15034815mr26788702plg.17.1660120645661; 
 Wed, 10 Aug 2022 01:37:25 -0700 (PDT)
Received: from taki-u2.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 f1-20020aa79681000000b0052d63fb109asm1323607pfk.20.2022.08.10.01.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 01:37:25 -0700 (PDT)
From: Takanari Hayama <taki@igel.co.jp>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/3] drm: rcar-du: Add DRM_MODE_BLEND_PREMULTI support
Date: Wed, 10 Aug 2022 17:37:10 +0900
Message-Id: <20220810083711.219642-3-taki@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220810083711.219642-1-taki@igel.co.jp>
References: <20220810083711.219642-1-taki@igel.co.jp>
MIME-Version: 1.0
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
Cc: Takanari Hayama <taki@igel.co.jp>, airlied@linux.ie,
 kieran.bingham+renesas@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 mchehab@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

R-Car DU driver implicitly supports DRM_MODE_BLEND_COVERAGE only.
This adds a support for DRM_MODE_BLEND_PREMULTI. As a consequence,
DRM_MODE_BLEND_PREMULTI becomes the default. If DRM_MODE_BLEND_COVERAGE
is desired, it should be set explicitly.

This behavior comes from how DRM blend mode is supported.
drm_plane_create_blend_mode_property() creates the blend mode property
with the default value of DRM_MODE_BLEND_PREMULTI. This default value
cannot be modified from the atomic driver.

Signed-off-by: Takanari Hayama <taki@igel.co.jp>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 8eb9b2b097ae..b9580fcfec7a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -167,6 +167,8 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
 		cfg.mem[i] = sg_dma_address(state->sg_tables[i].sgl)
 			   + fb->offsets[i];
 
+	cfg.premult = (state->state.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI);
+
 	format = rcar_du_format_info(state->format->fourcc);
 	cfg.pixelformat = format->v4l2;
 
@@ -444,6 +446,10 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 						       num_planes - 1);
 		}
 
+		drm_plane_create_blend_mode_property(&plane->plane,
+					BIT(DRM_MODE_BLEND_PREMULTI) |
+					BIT(DRM_MODE_BLEND_COVERAGE));
+
 		vsp->num_planes++;
 	}
 
-- 
2.25.1

