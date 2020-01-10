Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0BD137893
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 22:36:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB5E6E0D0;
	Fri, 10 Jan 2020 21:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70BE86E0D0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 21:36:15 +0000 (UTC)
Received: by mail-pg1-x549.google.com with SMTP id x189so2002745pgd.9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 13:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=lklv8FQRp8rzT0qNRNej2/Ey5tQkK5RdPZ9PPNXjJ/o=;
 b=tVwGZYrLHNECzGDBzzpsfHd1j99ze2fBx7zZNOtyFK2nFw6cKUh4LRyrx0Hz6aEnHj
 xjL8M5eiKT9bQ5Svg8gNtSTB7J+J509NP+v5mrcq0KuPW/GxKpcJzMDrDMGzv2fVngew
 KIrgphdjT6oefZw6kPFNWrut2XNbjHeI+h5kmXdl4N8z9UGGhxTmUEWUm3GvWhY6hI9A
 5cOEumsNpnAKH4tPnsHuCbTqBWIN77f3lNkCuLqAiEy1Jcemr/F04p8QldizUhpcs4ji
 b/PdhclpGbYxhLnY0y+jjoHZw0e3Rknli3V6Wi1wWlTmEw8gw/tS0qhSXltohRcpI6CH
 DE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=lklv8FQRp8rzT0qNRNej2/Ey5tQkK5RdPZ9PPNXjJ/o=;
 b=Dhi2ww4bjDvNaS0u5kjmNq/9ZqBZY0CfokbLP9yothh4d5PH99lurNmFWIf+xTwgWD
 Zkwp2sttGkfVTQ5iYFH2gu9TC8NvXt2wUH57+IuQ+V/Kpfz5OgjTuUVabxA+qOdg84Qs
 6H4LgfmjMM4yVCNWTv8ofAObKtmhHhtGlMDfC8YdjE/KsZtSwB9kQ9G6B1vmh0ozE9aF
 U0Lr1neuj1DqJ7/YXlPR5yIc1nByWNf9ep+2gEtJulN0fa9mQDje+rIaahC7J5h6iPD0
 LZf3xKXW6nPqYskNqZTt/yk9EOaL8GDWHFnRKU4RivYJr5UTaqrO3IndBpAgctS135yO
 u86g==
X-Gm-Message-State: APjAAAXr/ZDEWQEq2+C0R6topgm7b94Da84WHMtA4hn+Z+ZFEdZI3Jc0
 higTR4YQvsHGKJdu4qBSY2keS2GQz7PtKg==
X-Google-Smtp-Source: APXvYqz6h9roepz92B1ZH3Sq2/HDz04zhQSLuowxmrGyRazGZhV9zcZ4LdZ5NtGc06jMSBOCB2z0oD/pajdeYg==
X-Received: by 2002:a63:3d8e:: with SMTP id k136mr6811902pga.4.1578692174830; 
 Fri, 10 Jan 2020 13:36:14 -0800 (PST)
Date: Fri, 10 Jan 2020 13:35:51 -0800
Message-Id: <20200110213551.59826-1-frkoenig@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
Subject: [PATCH] drm/msm/dpu: Allow UBWC on NV12
From: Fritz Koenig <frkoenig@google.com>
To: robdclark@gmail.com
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
Cc: linux-arm-msm@vger.kernel.org, Fritz Koenig <frkoenig@google.com>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

NV12 is a valid format for UBWC

Signed-off-by: Fritz Koenig <frkoenig@google.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h
index fbcb3c4bbfee..3766f0fd0bf0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h
@@ -10,6 +10,8 @@ static const uint32_t qcom_compressed_supported_formats[] = {
 	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_BGR565,
+
+	DRM_FORMAT_NV12,
 };
 
 static const uint32_t plane_formats[] = {
-- 
2.25.0.rc1.283.g88dfdc4193-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
