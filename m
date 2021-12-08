Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D33346EDFC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:54:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439A110E596;
	Thu,  9 Dec 2021 16:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B8E10E116
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 06:17:21 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t9so7853382wrx.7
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Dec 2021 22:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BO9nbrCqEDiSGWCUM5cTLwYHN/IOtl/sVUgALANPl0E=;
 b=qeCe964S7RjGD6PpPajxIZxCX8xfhqHb0es4v1b0LkIlutlBu8RTJp/9mhxjCjqGxv
 BKqdLrcezudsgERmC5Em3S7GPcq74AlNVf8ryeuhR8Q/dnTfuWnii+5DqxdWYMO6kcbo
 WYNYfEGox6PAZ/Ronf8geqC7zniIfXi6fWbMPV78fvvpQe6Ru14nfqpFPTX6OH6+OiTB
 K5zEoLkJ4GBoTc8Ez7jceGnHSohYuZJKE+uiFF5HdOSAQruwFZ8PG07TIG1UXEJS0vub
 IxxOTf+gRtjjC60i9u5Tf9OT9t9kfUHbS7EN7zVAConFDLwD7377JVlb+E6pKDsE2pqz
 8uNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BO9nbrCqEDiSGWCUM5cTLwYHN/IOtl/sVUgALANPl0E=;
 b=fqju8qnwvY9TWfSZjyK5wLuMgdbuE4SHK4GgNitxxCxpx9awmWH4SMdawE6RBcCc8I
 8un4jVIrDwNxFGGG2we7pgjDWmfA5apAANMMVB78xlFhCmNtDQt4yo8FR1n/ZUOmDfQL
 R+X04g6PQHa6vCeAMGqZjXcHatJvm33JhczE7YWZ5PwZoTZicY43V/tlsJ2lQkhe+S9e
 M826HA5JKEgoQVkOD/ADW90j7cBL9+gLuiM4qkWzvV9I+d7iafJIIhST3Y1v9gZr01+p
 Jj+mZuJxc9Y4fcRFMcACrWVx60ihjCF632uHFD1lswydVaAqbN9xnyax1kXaQ07rxLHn
 L4BQ==
X-Gm-Message-State: AOAM532az0Eq5sDaSsFkTqsRFy+dty+zWJNn9KB4gxkVzkJyts3WXTHu
 jadWRw3yCxr0ureAL7XN1G9ltOkwbtcktg==
X-Google-Smtp-Source: ABdhPJy69Ek9fK5A5upGrRrqH5buKwRKgOq1FazUbo/B+CY9FooPqU8wpL0dBIvx0DgttEKtUlj5Cw==
X-Received: by 2002:adf:f151:: with SMTP id y17mr1910804wro.153.1639004565485; 
 Wed, 08 Dec 2021 15:02:45 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id j8sm3733795wrh.16.2021.12.08.15.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 15:02:45 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: airlied@linux.ie
Subject: [PATCH] drm/selftests/test-drm_dp_mst_helper: Fix memory leak in
 sideband_msg_req_encode_decode
Date: Thu,  9 Dec 2021 00:02:38 +0100
Message-Id: <20211208230238.24541-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 lee.jones@linaro.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes: 09234b88ef55 ("drm/selftests/test-drm_dp_mst_helper: Move 'sideband_msg_req_encode_decode' onto the heap")
Addresses-Coverity-ID: 1475685 ("Resource leak")
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
index 6b4759ed6bfd..c491429f1a02 100644
--- a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
+++ b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
@@ -131,8 +131,10 @@ sideband_msg_req_encode_decode(struct drm_dp_sideband_msg_req_body *in)
 		return false;
 
 	txmsg = kzalloc(sizeof(*txmsg), GFP_KERNEL);
-	if (!txmsg)
+	if (!txmsg) {
+		kfree(out);
 		return false;
+	}
 
 	drm_dp_encode_sideband_req(in, txmsg);
 	ret = drm_dp_decode_sideband_req(txmsg, out);
-- 
2.25.1

