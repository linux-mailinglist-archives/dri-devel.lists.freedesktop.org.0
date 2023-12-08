Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADF280A415
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 14:01:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C5210E2BA;
	Fri,  8 Dec 2023 13:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A3310E2BA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 13:01:38 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id
 d9443c01a7336-1d04c097e34so16369035ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 05:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702040497; x=1702645297; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o93zevhqUd2JF8CWwMHkDyi32OU3mdD1DdFmH/9BeoE=;
 b=MdVOymo9vnWLTcA3f0UnaNaO8QhkUkXYGYP4hS8CyL8pz7daToctV9hjdhTvJNWoQ6
 lk5MwRF9vrBfx11PlkcH/LS/WZlaTHFpI/QksY65NecJvfLuTnVpzJMA4JHlJZhThje/
 4bK9oR1xQmqtbQqAeBMGWnZeSqT+NUPnpKqVlj3Yf1AdgAl5bIjr4zKiJAWpEWHB6kWm
 pjCALSB3Wf9HSX1bt+v4qNauOyd+Lj0fDkgDLtKqQnchXWpXHAWjXVirq/kIt0oHG7Cp
 /2+ILtFZAKdblpv7LMAbYTqKCYyebjuZlsHSUVr7+qSuFXm8sr8Um0WwvXCBVqBwye84
 98Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702040497; x=1702645297;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o93zevhqUd2JF8CWwMHkDyi32OU3mdD1DdFmH/9BeoE=;
 b=cCqUWVLU2bN0LIvPZye0EQR7KdsmB+Tx/9osK/ipdjMaKAx0Mo623Y2rZ/VFEXQa5L
 dJ/zzTi3thd0pLbbThP7DqhdAHHaDScQJuoO/kBI2BkU8F/HXZYt2NqdYgm8nXYPS3In
 WlSaFY8Wt71asKDHIp/QkTk4ItxH8aJuFm+F/rI6S6pmYZXDibW4QdBSxtMvSPrghCnx
 HSrvO9juSaKdQBVuNFq9yJGz0+x3ZJ4U7Ov+RWaQQC2Mm2op3JOGgxAQV7DviDXzi+i0
 wxNcVzB9Kj5ma75YWdk6VBFSUb+v4MU8gVI8sQ/ECRsOpOHaq61a5oQJBOs3tDLl8f4F
 CBjQ==
X-Gm-Message-State: AOJu0YzCDwLbiab92uaxc/vHzAns95KkcDUDLulfy/Lx+CO87G2sVI0u
 V5DMeRnmhLTkXOimSXhsYHw=
X-Google-Smtp-Source: AGHT+IEHmcDygb3S3h8g1qEf2GeHm98nNfVs4TVDce5hVPS/82MRrGAefSYyOWZtptM4pm5kfN3F3Q==
X-Received: by 2002:a17:903:41c1:b0:1d0:6ffd:611c with SMTP id
 u1-20020a17090341c100b001d06ffd611cmr67100ple.62.1702040497050; 
 Fri, 08 Dec 2023 05:01:37 -0800 (PST)
Received: from localhost ([113.110.229.223]) by smtp.gmail.com with ESMTPSA id
 n2-20020a170902d2c200b001d04c097d32sm1603899plc.270.2023.12.08.05.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 05:01:36 -0800 (PST)
From: Xingyuan Mo <hdthky0@gmail.com>
To: Oded Gabbay <ogabbay@kernel.org>, Ofir Bitton <obitton@habana.ai>,
 Tomer Tayar <ttayar@habana.ai>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Moti Haimovski <mhaimovski@habana.ai>,
 Dafna Hirschfeld <dhirschfeld@habana.ai>,
 dri-devel@lists.freedesktop.org (open list:HABANALABS PCI DRIVER)
Subject: [PATCH v2] habanalabs: fix information leak in sec_attest_info()
Date: Fri,  8 Dec 2023 21:00:59 +0800
Message-Id: <20231208130059.424735-1-hdthky0@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Xingyuan Mo <hdthky0@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function may copy the pad0 field of struct hl_info_sec_attest to user
mode which has not been initialized, resulting in leakage of kernel heap
data to user mode. To prevent this, use kzalloc() to allocate and zero out
the buffer, which can also eliminate other uninitilized holes, if any.

Fixes: 0c88760f8f5e ("habanalabs/gaudi2: add secured attestation info uapi")
Signed-off-by: Xingyuan Mo <hdthky0@gmail.com>
---
 drivers/accel/habanalabs/common/habanalabs_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs_ioctl.c b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
index 8ef36effb95b..a7cd625d82c0 100644
--- a/drivers/accel/habanalabs/common/habanalabs_ioctl.c
+++ b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
@@ -685,7 +685,7 @@ static int sec_attest_info(struct hl_fpriv *hpriv, struct hl_info_args *args)
 	if (!sec_attest_info)
 		return -ENOMEM;
 
-	info = kmalloc(sizeof(*info), GFP_KERNEL);
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (!info) {
 		rc = -ENOMEM;
 		goto free_sec_attest_info;
-- 
2.34.1

