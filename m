Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAAD63EDD4
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 11:31:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BE010E5B0;
	Thu,  1 Dec 2022 10:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E7E10E129;
 Thu,  1 Dec 2022 10:31:03 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id vv4so3148815ejc.2;
 Thu, 01 Dec 2022 02:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NbApf1anPXhkyL1eMhU3x4CauZkX++vBii8PykYLja0=;
 b=a5RWL8PSQEK0iO8D8xGt8NT2AQ4OV/qzxmaspNDbxZCSpoxCIuJ8vexkpLEXothzvJ
 nA46USR5g+fZ8RmhwNme1mUk4fTwlPRvZ2Vr7Fo0BIC8HQU3oBI/FlZ0rNvwDOQCd7Zg
 ILeFDzoCJG6yn45os/rNOFjn5OgcOcNC5aX3frAWSqtE5f9UDhvVajhtcQx3dm4I0x1l
 zUMnMfHWHhYshJ2WSdzjW031qTsDlclT4TP7Ujld7X1y9znWkqpND/WFjphv37tki6qf
 npw9YXacBh/EakMCf80tDIHdhe2tBdzdrvOBJjQN4RC7Tp9EH3iYeRyN/NbDlPEsq8Yh
 eG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NbApf1anPXhkyL1eMhU3x4CauZkX++vBii8PykYLja0=;
 b=YSR+MLUNgUHXgcDZ0PjQVHcVjDqcUCVpL93l3sN4mVPCvU2SqV1XONwQLkvnycENcx
 +u2hEXALRuaRUsF0yglwMTCE4Dd+7hLyTeVZ0M37Ipfk0WFD4LDrdwn72UxSGovO6dds
 ANBhC0lEd1Fh5Gqh0zIxlrt5QUUPLO1ajGKin/Jq4TO7GIvcjcTbCitsX7LECCJ8mr79
 LyzdWbJEZZmHRfIpsjH4AznJN6sPzJtL8otOQDVVXv8BeZOPRTI+CFocWQl9LFr6TU3c
 1bfIX53g5DPWpHo/AXlT38Go9sme1mFtbYYq6oXn852C+AY+RxkpgL43R3An6z6AkV3J
 m/YQ==
X-Gm-Message-State: ANoB5pkuzny5IMeDwoGeX7BDeSPE1Qc1m2g3Qe9SOINJzefMXbXZurOB
 Sg0G2ROllYrMxVwAEo1Qc1I=
X-Google-Smtp-Source: AA0mqf792BH1dkxj+elKYFKEKcD4i+q0VwaieVCNwc2KlVuSsd9a8B002/dcWUBiKX1TDLbx9Qr5UA==
X-Received: by 2002:a17:906:c18c:b0:7b2:8a6e:c569 with SMTP id
 g12-20020a170906c18c00b007b28a6ec569mr56271431ejz.582.1669890662588; 
 Thu, 01 Dec 2022 02:31:02 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a17090604c100b007c07b23a79bsm1592400eja.213.2022.12.01.02.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 02:31:02 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Subject: [PATCH v5 6/7] drm/etnaviv: Warn when probing on NPUs
Date: Thu,  1 Dec 2022 11:30:22 +0100
Message-Id: <20221201103026.53234-7-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201103026.53234-1-tomeu.vizoso@collabora.com>
References: <20221201103026.53234-1-tomeu.vizoso@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, italonicola@collabora.com,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR VIVANTE GPU IP" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Userspace is still not making full use of the hardware, so we don't know
yet if changes to the UAPI won't be needed. Warn about it.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 37018bc55810..3cbc82bbf8d4 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -765,6 +765,10 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 		goto fail;
 	}
 
+	if (gpu->identity.nn_core_count > 0)
+		dev_warn(gpu->dev, "etnaviv has been instantiated on a NPU, "
+                                   "for which the UAPI is still experimental\n");
+
 	/* Exclude VG cores with FE2.0 */
 	if (gpu->identity.features & chipFeatures_PIPE_VG &&
 	    gpu->identity.features & chipFeatures_FE20) {
-- 
2.38.1

