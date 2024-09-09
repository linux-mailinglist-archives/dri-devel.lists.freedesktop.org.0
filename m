Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5C7970ED3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB8010E2E6;
	Mon,  9 Sep 2024 07:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KY+f3qSl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322B310E2E6;
 Mon,  9 Sep 2024 07:08:31 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-374c1963cb6so2402968f8f.3; 
 Mon, 09 Sep 2024 00:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725865709; x=1726470509; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tns6DEsLLFvzNa6897gvKPOeII1INdIqfTx8WlLIAvw=;
 b=KY+f3qSlRGvZ7tuJChYeDs19aqeSe8rj7O8bYAgjyk8Qh3tZsJeaNsxBc8EqdOyYlq
 3JGxu4uGk0tqKPImLX33TI6q47oACyOjEP2dXdyBg05CWHt9qydVKI37r5VK5eLYmOxz
 PGfz/vSjMd12iBE17WiQqGg6vnidtV3MGwF8cVHIMxD/15e6IfCrlf+rkKPFvD3Sjpmd
 BP00xbCmpiFHi4vyXVG/V2CWG6oqCRrs3ZNhrzlKnYQqXrbq/hjQ15fQdh3kLmSd9mkT
 YiQJWFC8ElDCH7p8U/ULfuAXe4Q4TWRy6MiUF/RX3Le3lL687BuvQOYM4Xk9MC4kwXeG
 blVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725865709; x=1726470509;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tns6DEsLLFvzNa6897gvKPOeII1INdIqfTx8WlLIAvw=;
 b=osmhUA6SUyBNCt8iO9vEVCnJX8/i/jg1NzONneJQQ4Qfv52rTbNdNbSqKzNmnHmA/C
 rX8e7hRSvJxhapZP1CIA9GAf4ISlWC6URaIAQ3mY0ueK9efIj/X2NMpflW0tnPiyZn3/
 gvQPDM8WvefVu+kf3F4faJ5y49ppXZdVLdwnHELH4vevxU3fmE4XjwbJv7c7GbJ4O3B8
 VWpGSomRkscaYWWEYobrQdFM5K4NNjx/W+xSxAgiPwC2ewcEKRJLUmnHx/7tXenVuxr0
 BRniggelGmv1P24sTgWNmWbHZCRUtzNNeefH4wWaey1hBMzlulw+ufxlE+o0asc6RqJw
 seLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV70wVjNywx/P8+DUXCY0ppF0lgt1m6zXLAeVBDCOLgcQGoHd1u7ThPLzWmcoJawWNfwWbN9jfFBlM=@lists.freedesktop.org,
 AJvYcCVdp3g660gvsnCPH0f/wyVTuosPeZ/koyBSae7nIrU2D9z0X4cua30oZEQc1o5rHAU66Yp3yXd/1hKI@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQ2hO7UPQTAXO7mwGb9hLy8pNlICR4IkJsrmjAxL5HkbSt/fkD
 FhUyU0cLwivqttTRj4MKCU4YHBItd26huGoxLCTIEShggr+oi/hS
X-Google-Smtp-Source: AGHT+IE4gYqw+4rBd+cHrezcNoH0ZCL4/TV7eTgB/uDbDVBwGdbv1e6X9shSKYPEa98NPjsJYgGg4g==
X-Received: by 2002:adf:e544:0:b0:368:445e:91cc with SMTP id
 ffacd0b85a97d-378895c9deemr7165822f8f.21.1725865709459; 
 Mon, 09 Sep 2024 00:08:29 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:08:28 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Cc: Uros Bizjak <ubizjak@gmail.com>, Hannes Reinecke <hare@suse.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH v2 08/19] scsi: libfcoe: Include <linux/prandom.h> instead of
 <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:22 +0200
Message-ID: <20240909070742.75425-9-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Substitute the inclusion of <linux/random.h> header with
<linux/prandom.h> to allow the removal of legacy inclusion
of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Hannes Reinecke <hare@suse.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
---
 include/scsi/libfcoe.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/scsi/libfcoe.h b/include/scsi/libfcoe.h
index 3c5899290aed..6616348e59b9 100644
--- a/include/scsi/libfcoe.h
+++ b/include/scsi/libfcoe.h
@@ -15,7 +15,7 @@
 #include <linux/skbuff.h>
 #include <linux/workqueue.h>
 #include <linux/local_lock.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <scsi/fc/fc_fcoe.h>
 #include <scsi/libfc.h>
 #include <scsi/fcoe_sysfs.h>
-- 
2.46.0

