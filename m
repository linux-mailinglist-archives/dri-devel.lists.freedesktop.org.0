Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DC142DE16
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 17:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5609B6EB3C;
	Thu, 14 Oct 2021 15:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E508B6EB4E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 15:26:17 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id m22so20866993wrb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 08:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xJdt9xqgEepFbtbB1UkquFZ4VDLNOq6El+raZeZWSOM=;
 b=pt34RyPq6TeilQMWvaHMCBd0p6iBB5mQ8zyO7bsO0z01t93qtPnfhTtxhynXcJCNZI
 iejhkLmblTXq7J0R4WWX12xrJSxTJW0L0GLzhdteU9CAgzcrwsJlco9WizJRgcsgkMlf
 5SSeCrL3ajGsL5O2s7oUzFOnkoSIkFyX4d5TNYLMjAG3Obr8FEN2lK+YUXNF9NydQi1L
 P39e94inxhD6MtuCe4rImRHiIoHLnIIucIf205t/kkHURxK51E89grzki14Vr/RhGiA5
 p+Y1BsN/CDaqCfhOWBrF0dJNqtR+7ZDFhXLL1nhfz0eac2nIjIR7sxin3uJohE6T1QLY
 x/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xJdt9xqgEepFbtbB1UkquFZ4VDLNOq6El+raZeZWSOM=;
 b=rGHjIDTlweszAlYabGScrrqJbr4zxmII5Gy69Pja/nrA20M0Ge1GaT0yaDvMxV5vU4
 NJT7HixS9hdE2jiCagbOrnjtPiw4fXilcYNQ0gcy+dB/7xNoWcS6NB5tYi+Lz7c0+p0A
 5vZUdKkT+pls/RzOepTOxGSkG8DyxdkEMQle4JXZ6l7qUaiIfDiSniov9jAjWqNDfjEy
 d8LG2qToKBBbgbCvFH8Bp3pQhxSxozxGaokZRwXNU7nYjQknJuZOi3Av/8QXWZrI5ptz
 VFsnf2b9pdttgGKc3CD+It2flDwSDCf/7Eg5+rGSmYdCqZkJ9BudfyivdHWYcj5EPeQm
 WhSw==
X-Gm-Message-State: AOAM531z0pd8YYbF/RhSkjSrJWL3/T7zPT8Knh0r8VlesFPSR7liHWzl
 ehDH3WHwfYmwrHzb9ykxGJeXBQ==
X-Google-Smtp-Source: ABdhPJwK/ywxZ2fw2tMZOvBzRr4/yRNBMI1ZBNntxWcjpPuqQLTvL/JRBJL2y5JNH7j8BDDkiWNjnA==
X-Received: by 2002:adf:aa92:: with SMTP id h18mr7277007wrc.372.1634225176290; 
 Thu, 14 Oct 2021 08:26:16 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:209b:8400:2b80:b4ae])
 by smtp.gmail.com with ESMTPSA id k22sm2626790wrd.59.2021.10.14.08.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 08:26:15 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com, robert.foss@linaro.org,
 jonas@kwiboo.se, jernej.skrabec@gmail.com
Cc: martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 4/7] drm/bridge: synopsys: dw-hdmi: also allow interlace on
 bridge
Date: Thu, 14 Oct 2021 17:26:03 +0200
Message-Id: <20211014152606.2289528-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014152606.2289528-1-narmstrong@baylibre.com>
References: <20211014152606.2289528-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=884; h=from:subject;
 bh=VqFA57uYRVnBWiC14bz6QM29bBtN5sRjm8xb2MmDNeU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhaEuAk+fmsK54XgR9Ufj2kk92eYhEp32GG1J/nqjJ
 orc3ih6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYWhLgAAKCRB33NvayMhJ0VXbD/
 sHJAJpjVaCD1jpnUNddl/tWvU1cQ93DRTHgJCZ4Vr+G+868TYNoXo/scludQSH488DVMDjgGBIJy3M
 6jK35EeZgBAUAuD1qmSVEe+aawSSejSlM2Lsfem+TqSWohfPnegZ0q1E66Hm3VUWoaECFyJRPW8i/d
 24vn91yOmynCdVKzNMndB5roqofG/5fPGZ1aDi74uySqBv4Cn7ZZ7Hg93KLAHVmcF/NvWr8TquzgCW
 zq5WoxWT+SIHWoqHLW8LAQTzTLzlNlGkAy15eFAE5PK4cSJebUxX9M+Fn8CEzedh8OsnRffzrydbh8
 Bk3deAPoxjBKasnYv0xs1/zGc7Ya6Dic/085flzUlDSUjqz8HounBW3Nttrn7+w+wSvl8kgRm2/a+c
 bEG+nDgyUN/TGEBO45quuzXh7rTcK8aYsjixdqxkrQC3cbI5dXEs/5j8YWIPVFVfujGPCV+8rHy2Oj
 H1nPVMzDhd1JPMQ/rx+gZXzQ2U8L2DfxgxG5SUNpX+LJfs7yYLrtVG9aYoEj+goPNPU4txlZK9JaFZ
 Z1I8clZ/y5FdnnYlBF8iv/R5iCw+CGoZJuNCc7uriMIM0hfwTGGxD/RuQDMSlh+WMj8ULonwqM8rHz
 w6y1ruDofp+/TouykxmSWQSPPjwQvBgpLLPoa3VnSsUV55ANFAqA23zsLhOA==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Since we allow interlace on the encoder, also allow it on the bridge
so we can allow interlaced modes when using DRM_BRIDGE_ATTACH_NO_CONNECTOR.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index f08d0fded61f..62ae63565d3a 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3413,6 +3413,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 	hdmi->bridge.funcs = &dw_hdmi_bridge_funcs;
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
 			 | DRM_BRIDGE_OP_HPD;
+	hdmi->bridge.interlace_allowed = true;
 #ifdef CONFIG_OF
 	hdmi->bridge.of_node = pdev->dev.of_node;
 #endif
-- 
2.25.1

