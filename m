Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C0A539BBE
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 05:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196AC112B1B;
	Wed,  1 Jun 2022 03:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3EAF112B1C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 03:39:56 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id z17so762860pff.7
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 20:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NAOtSJQ0e7lMXAVSUZPZ1qHrCN9pnSWlg6iMnewBSfg=;
 b=I7Rwzn599nYSXO0ehdauIMZ913hZwSg4hgdHDi4NFjycN3mkFHslQfzGP5zMCMJhTw
 ZY2WxucR6T2h6FsWNtPsI+jPqEoMN47gW8e61OElRxQgKXqx3TIKQmYq6PR8lQoSH2Gc
 swltfB8cc+I7C5uI3Vnj5qIR8ImmocRWCNiBmmb2YI+E0F0IBalWIZxWH18tHjneVFuI
 bK0s9Zwy2llZfvWj4W35wOZywZ0mnDqhFYdDQqNPc2PmFWMR9DYnqznYEpYgquej7kBX
 5Nntt+BmHjK2A6gqupFV4Tl/IW4m6W8WNyDc3JGafp9DcNENPxWPSX4WRZO7Ynm1K7km
 J6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NAOtSJQ0e7lMXAVSUZPZ1qHrCN9pnSWlg6iMnewBSfg=;
 b=eDNv/4i18/7aGocsv0OXSMbTO7muyyF0Xrl0Dm3SKxTQ3LQIz+tMsmsaibnWlv5T0G
 vLSCgIu/Aodnifnua9mUKpnzKzazjwdD+2hERAMrazqcBe2nweMcHsk3jLhe1i75TKIN
 bM2qWKlGtju5CLtuZcLNqZaAY7Vb7Uslvz26olihSUSPcf8OKTZDSgjREUQF/VfiX8R5
 Ef4xLSvDlW9bopH3AkzfQTUmO7qjHX1RZAnXlGiCIVrSSrYXNeWkzmdj/vSOocXg2lSW
 lJRWiLSkOq2OJa02If8SogN6Ri28fJmf+gELLTG+o2Gs0yz0IAnDfuvKmdnWRPV8FmFU
 Vs0w==
X-Gm-Message-State: AOAM533guY9KqH2jC6ckig+AYiOArHvz4a595ZexNveV0pCSpOlwC+n5
 XKxJmhBYCv9nHrxLD0tHeF8=
X-Google-Smtp-Source: ABdhPJw7vYFqNAuZ0ZS77DemhLpZ6cPkQti7TbLMdDwMmA1GStvhzPaixJeC7e2jd+/eSbyBBi8jlg==
X-Received: by 2002:a05:6a00:1946:b0:4fe:309f:d612 with SMTP id
 s6-20020a056a00194600b004fe309fd612mr65087189pfk.10.1654054796300; 
 Tue, 31 May 2022 20:39:56 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 dw15-20020a17090b094f00b001e0b971196csm2732415pjb.57.2022.05.31.20.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 20:39:56 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/meson: encoder_cvbs: Fix refcount leak in
 meson_encoder_cvbs_init
Date: Wed,  1 Jun 2022 07:39:26 +0400
Message-Id: <20220601033927.47814-2-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220601033927.47814-1-linmq006@gmail.com>
References: <20220601033927.47814-1-linmq006@gmail.com>
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
Cc: Miaoqian Lin <linmq006@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

of_graph_get_remote_node() returns remote device nodepointer with
refcount incremented, we should use of_node_put() on it when done.
Add missing of_node_put() to avoid refcount leak.

Fixes: 318ba02cd8a8 ("drm/meson: encoder_cvbs: switch to bridge with ATTACH_NO_CONNECTOR")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index fd8db97ba8ba..8110a6e39320 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -238,6 +238,7 @@ int meson_encoder_cvbs_init(struct meson_drm *priv)
 	}
 
 	meson_encoder_cvbs->next_bridge = of_drm_find_bridge(remote);
+	of_node_put(remote);
 	if (!meson_encoder_cvbs->next_bridge) {
 		dev_err(priv->dev, "Failed to find CVBS Connector bridge\n");
 		return -EPROBE_DEFER;
-- 
2.25.1

