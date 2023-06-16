Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E35A7330F6
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 14:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4727810E60C;
	Fri, 16 Jun 2023 12:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E13D10E60B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 12:16:41 +0000 (UTC)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 189D13F33C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 12:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1686917800;
 bh=9khctnS3KGbhQfn/AhXw2BywtkyBNp99eLHZVmIExRI=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=j9WX8ngBKzxgqvog7gCOfDs0/xjxvE3/xqvK/Gx8pE2yz5Ou4qqZtHQm3H+O+4S1Z
 H2A/9237Mx9VOVjLcKujtFc5o47mQoUKs4han0Vsryk8Acqsqyn6TRUsefyqceP0kV
 ZPvo5aKP5aLCVANt4kTe3RcmKe03TbXzTwzvUfG3jAiqRz2Lmpn78J7sFu7SRrFN7I
 WUOzX82zXoZtTOYSVDMAa7N2s6ddpg24WQZqDwkmRoioCOaZjhK98TYsgtF5F17Z3G
 u02jHXhhrgfhwOtRz/9DxSX7EE68gXREHqpBq2QXvQj533Zfyndv0Wk26l8cAXXVKF
 bL7NNhnRajJ9w==
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2b1b1693338so4862641fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 05:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686917799; x=1689509799;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9khctnS3KGbhQfn/AhXw2BywtkyBNp99eLHZVmIExRI=;
 b=kug1YclC64BEKZifZRI47XtgGnm8ulpkFLtPPlu9hbvKclkcwHAsMx7FBFXrN5S96m
 aExh5xCdacuDEL+SA30GqMsXNTdIMlYjWvfF/dUofiJ3cXgDLtixFv8ca8graWrGU6yF
 9PV1N2GnmntQF7T/n42ahtROqgihwgzZVpi9nxXe97H1O5GKV7mSyzgBK6zXYGJA6bgk
 2J6Q9is08iTne+f6l+FvX/a+FAFfR3hmu+XjiClsU0J1heL9b63oa9TLL65n4pmwT5Mx
 DJpGZC4GofSUdHH8dn7F9X3AxwlTGo0pzP3FbOVtK+mjnpPVP+awIPHGRYkwHdh82Ca0
 xEcQ==
X-Gm-Message-State: AC+VfDwuHLPp5eiQ6oQ68jO2H8ug1S4Q8RwgeZaZhPMZ2OxOhTSXbmNH
 po38TrQLlTDQI4ohC6G95Q/kcXUwUhAwUdVblpRPNYVF4P9JWQ4kLLso6x/VPU8RBOftjr+Y/jj
 gr2io7qyjNUr2V7I5dCNzo0pTsvJzSBydAAM2jfnz7A3BXA==
X-Received: by 2002:a2e:90c5:0:b0:2af:23c0:ffe2 with SMTP id
 o5-20020a2e90c5000000b002af23c0ffe2mr1600557ljg.48.1686917799486; 
 Fri, 16 Jun 2023 05:16:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7A8o+IbZxCv/2DBlnwbGp11X9xuYSeDQtkg8plvKTfF7GfPMv6+pbOIWOLSRri7mw46WYb4w==
X-Received: by 2002:a2e:90c5:0:b0:2af:23c0:ffe2 with SMTP id
 o5-20020a2e90c5000000b002af23c0ffe2mr1600543ljg.48.1686917799207; 
 Fri, 16 Jun 2023 05:16:39 -0700 (PDT)
Received: from localhost ([194.191.244.86]) by smtp.gmail.com with ESMTPSA id
 f20-20020a7bcc14000000b003f8044b3436sm2033492wmh.23.2023.06.16.05.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 05:16:38 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: ogabbay@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] habanalabs/gaudi: Add MODULE_FIRMWARE macros
Date: Fri, 16 Jun 2023 14:16:37 +0200
Message-Id: <20230616121637.1033074-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.37.2
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
Cc: osharabi@habana.ai, dliberman@habana.ai, linux-kernel@vger.kernel.org,
 dhirschfeld@habana.ai, Juerg Haefliger <juerg.haefliger@canonical.com>,
 talcohen@habana.ai
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The module loads firmware so add MODULE_FIRMWARE macros to provide that
information via modinfo.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 drivers/accel/habanalabs/gaudi/gaudi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/accel/habanalabs/gaudi/gaudi.c b/drivers/accel/habanalabs/gaudi/gaudi.c
index a29aa8f7b6f3..cd034e98128a 100644
--- a/drivers/accel/habanalabs/gaudi/gaudi.c
+++ b/drivers/accel/habanalabs/gaudi/gaudi.c
@@ -63,6 +63,10 @@
 #define GAUDI_LINUX_FW_FILE	"habanalabs/gaudi/gaudi-fit.itb"
 #define GAUDI_TPC_FW_FILE	"habanalabs/gaudi/gaudi_tpc.bin"
 
+MODULE_FIRMWARE(GAUDI_BOOT_FIT_FILE);
+MODULE_FIRMWARE(GAUDI_LINUX_FW_FILE);
+MODULE_FIRMWARE(GAUDI_TPC_FW_FILE);
+
 #define GAUDI_DMA_POOL_BLK_SIZE		0x100 /* 256 bytes */
 
 #define GAUDI_RESET_TIMEOUT_MSEC	2000		/* 2000ms */
-- 
2.37.2

