Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F68FAF6E19
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 11:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7CF10E7F1;
	Thu,  3 Jul 2025 09:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=robert.mader@collabora.com header.b="PrU+cmDV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BCD10E7F1
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 09:04:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1751533456; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=k6XLeC09z489kSHWmXuDY8JrYHc+SRUelEu9narlWFaVztCic19ubfACB6TQVNF1wljTWo/GBCylowceSXRRiRFaDGozjHNXdUxIuEwFCRw0osoQlXNZ2WhOQte11hSUgmfcZ62lpcOEZOLNzA/EIaxqf4xD2sNigv+/Le//2kM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1751533456;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=frWO6zL0TAZQVYmSaNhnFA4PGDjy6fBzVAXIH4An7nY=; 
 b=DsqXMxQFeK+GYArQnIasNs48Uq3ViGp61xmkRDuHPnH9mPbXR28CTXQRlBWmBmpmcZh19BdyhNmSozMgedEKsIir0xhHQCkQYt0d+kAtDfw5tTFv7yAReV07GnwZh/uA7YXWPtLoHPW7fef6sBRVeqtor3ZhiZZSI+YV8/+Safo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=robert.mader@collabora.com;
 dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751533456; 
 s=zohomail; d=collabora.com; i=robert.mader@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=frWO6zL0TAZQVYmSaNhnFA4PGDjy6fBzVAXIH4An7nY=;
 b=PrU+cmDVzfLckAIGOghDlRyCAie2Wb1m8UOw15+Ltz0SVL/uusV1MRWJlKSdvl8/
 1VH3hlgKpmzbkej3Ti5tkLb7Z4kkzk4Ui3+P4dsrBJ5UEQvHhbwl/BExHeWqJYhdxLQ
 chdKeh/7MSvRn5wBdB4aEJlirnY38cN6A3LS/L6M=
Received: by mx.zohomail.com with SMTPS id 1751533453325969.1471666245575;
 Thu, 3 Jul 2025 02:04:13 -0700 (PDT)
From: Robert Mader <robert.mader@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Robert Mader <robert.mader@collabora.com>
Subject: [PATCH v1] drm/vkms: Add writeback encoders as possible clones
Date: Thu,  3 Jul 2025 11:03:35 +0200
Message-ID: <20250703090335.23595-1-robert.mader@collabora.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Since commit 41b4b11da0215 ("drm: Add valid clones check") setting
the `possible_clones` values is a hard requirement for cloning.
`vkms` supports cloning for writeback connectors in order to capture
CRTC content, however that broke with said commit.

Writeback connectors are created on a per-CRTC basis, thus mark
every non-writeback connector that is compatible with a given CRTC
as possible clone - and vice-versa.

Using a default configuration, the corresponding `drm_info` output
changes from:

├───Encoders
│   ├───Encoder 0
│   │   ├───Object ID: 40
│   │   ├───Type: virtual
│   │   ├───CRTCS: {0}
│   │   └───Clones: {0}
│   └───Encoder 1
│       ├───Object ID: 41
│       ├───Type: virtual
│       ├───CRTCS: {0}
│       └───Clones: {1}

to:

├───Encoders
│   ├───Encoder 0
│   │   ├───Object ID: 44
│   │   ├───Type: virtual
│   │   ├───CRTCS: {0}
│   │   └───Clones: {0, 1}
│   └───Encoder 1
│       ├───Object ID: 50
│       ├───Type: virtual
│       ├───CRTCS: {0}
│       └───Clones: {0, 1}

Signed-off-by: Robert Mader <robert.mader@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_output.c    | 12 ++++++++++++
 drivers/gpu/drm/vkms/vkms_writeback.c |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 8d7ca0cdd79f..21935eb88198 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -77,9 +77,21 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 			return ret;
 		}
 
+		encoder_cfg->encoder->possible_clones |= BIT(drm_encoder_index(encoder_cfg->encoder));
+
 		vkms_config_encoder_for_each_possible_crtc(encoder_cfg, idx, possible_crtc) {
 			encoder_cfg->encoder->possible_crtcs |=
 				drm_crtc_mask(&possible_crtc->crtc->crtc);
+
+			if (vkms_config_crtc_get_writeback(possible_crtc)) {
+				struct drm_encoder *wb_encoder =
+					&possible_crtc->crtc->wb_encoder;
+
+				encoder_cfg->encoder->possible_clones |=
+					BIT(drm_encoder_index(wb_encoder));
+				wb_encoder->possible_clones |=
+					BIT(drm_encoder_index(encoder_cfg->encoder));
+			}
 		}
 	}
 
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index fe163271d5b5..12b60fb97c68 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -174,6 +174,8 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
 	if (ret)
 		return ret;
 	vkms_output->wb_encoder.possible_crtcs |= drm_crtc_mask(&vkms_output->crtc);
+	vkms_output->wb_encoder.possible_clones |=
+		BIT(drm_encoder_index(&vkms_output->wb_encoder));
 
 	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
 
-- 
2.50.0

