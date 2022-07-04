Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 652CD56697A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB5210FA77;
	Tue,  5 Jul 2022 11:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE37F10E00B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 02:52:38 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id 145so7702880pga.12
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Jul 2022 19:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BbPSpMez8xnrmoHOdUaXU+ajKB+3TOpV+ohNDV+XsDk=;
 b=BYmceRCcQvSn82mFF/HsQve/AffveQZCTUbJWICcFji0Fx3bbdZ6cdKI5MO2yfUULj
 fJxFMWNyH0/rSQToQnVlFtQFiTQ2t7sjkfEvqg8ap7UzJPgkea/Jv7+Px5ItxGHEAYDv
 j4z+eODnElEWhn7kJHO5kDnkDcB1xFMrtYCRA2i0huJkpKN33wVLw5jOcjxDP17Gabus
 AbBkX0kOdJI5xt4rcW0S9FIDYuDvoI4YWQh3mbGG33TkQRu5o3ch0WNCwnDg8ck5MWnW
 S2k1sxCvskT4kysOf+j5tuFYjZbreYmagPOWxw5bcNwAt3c2VS+e9h3bsMeEy0qOX6z4
 dAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BbPSpMez8xnrmoHOdUaXU+ajKB+3TOpV+ohNDV+XsDk=;
 b=ag6zr10RvKR9C2YJr3aIFfyTqLP+fLkqpR7WWzcJchCbiq5QJTIwhiyBjOsBEz+Jfk
 ghgH5ihlC8+s4t5SrBenbakzX87GSGiPeHzXsgCXOFEKA0jDmfhyv4Tkvjih6XT07nHb
 B7APJT6uA93IN0Q63jnkQzLCUHlkeXXSsqr5hj5FXYk+qfvgihuE/4jjLusQMjHJFbQv
 p6nfI+aplHo2IIB9dm+wul8/HW922PwkW9J1dKU1ulCQSdmLfdY0oUdeVbMaugF5jUci
 9Ah3SpyyL/3yNQ/1K+VL0m72Z035ZH19u6+YNKNUK3YtcuzUDFXTE+C6Bhjg+ZdzgSoC
 0jIQ==
X-Gm-Message-State: AJIora/CbPmxcA2u7XCfVzhtbAZPYcOaAb07Q+7+blLL+yh4Herg9GlC
 xzPlRAHkVErzzoZrnf7r4OSCXffgoaQRhidX
X-Google-Smtp-Source: AGRyM1sqISqDaGGk3Vu/CgGdgUCMHgaePoGFbge3anE6UdgKtisdVwiuAdyE6DVU2fixJ4Lv5bcHrw==
X-Received: by 2002:a63:fd54:0:b0:40d:dfde:857c with SMTP id
 m20-20020a63fd54000000b0040ddfde857cmr23899918pgj.19.1656903157942; 
 Sun, 03 Jul 2022 19:52:37 -0700 (PDT)
Received: from taki-u2.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a634e4b000000b004118fd18476sm8730813pgl.60.2022.07.03.19.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 19:52:37 -0700 (PDT)
From: Takanari Hayama <taki@igel.co.jp>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] media: vsp1: save pixel alpha info in vsp1_rwpf
Date: Mon,  4 Jul 2022 11:52:29 +0900
Message-Id: <20220704025231.3911138-2-taki@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220704025231.3911138-1-taki@igel.co.jp>
References: <20220704025231.3911138-1-taki@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 05 Jul 2022 07:31:09 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham+renesas@ideasonboard.com,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to support DRM blend mode, we need to able to override pixel
alpha flag. When DRM_MODE_BLEND_PIXEL_NONE is desired, we'd like to let
VSP1 to ignore the pixel alpha by overriding the flag.

Signed-off-by: Takanari Hayama <taki@igel.co.jp>
---
 drivers/media/platform/renesas/vsp1/vsp1_drm.c  | 1 +
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c  | 6 +++---
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.h | 2 ++
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index 0c2507dc03d6..9ec3ac835987 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -600,6 +600,7 @@ static int vsp1_du_pipeline_set_rwpf_format(struct vsp1_device *vsp1,
 	rwpf->format.num_planes = fmtinfo->planes;
 	rwpf->format.plane_fmt[0].bytesperline = pitch;
 	rwpf->format.plane_fmt[1].bytesperline = pitch / chroma_hsub;
+	rwpf->pixel_alpha = fmtinfo->alpha;
 
 	return 0;
 }
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
index 75083cb234fe..e6bd813dc68c 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
@@ -152,13 +152,13 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
 	 * In all cases, disable color keying.
 	 */
 	vsp1_rpf_write(rpf, dlb, VI6_RPF_ALPH_SEL, VI6_RPF_ALPH_SEL_AEXT_EXT |
-		       (fmtinfo->alpha ? VI6_RPF_ALPH_SEL_ASEL_PACKED
-				       : VI6_RPF_ALPH_SEL_ASEL_FIXED));
+		       (rpf->pixel_alpha ? VI6_RPF_ALPH_SEL_ASEL_PACKED
+					 : VI6_RPF_ALPH_SEL_ASEL_FIXED));
 
 	if (entity->vsp1->info->gen == 3) {
 		u32 mult;
 
-		if (fmtinfo->alpha) {
+		if (rpf->pixel_alpha) {
 			/*
 			 * When the input contains an alpha channel enable the
 			 * alpha multiplier. If the input is premultiplied we
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
index eac5c04c2239..07ddebb78dfa 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
@@ -43,6 +43,8 @@ struct vsp1_rwpf {
 	const struct vsp1_format_info *fmtinfo;
 	unsigned int brx_input;
 
+	bool pixel_alpha;
+
 	unsigned int alpha;
 
 	u32 mult_alpha;
-- 
2.25.1

