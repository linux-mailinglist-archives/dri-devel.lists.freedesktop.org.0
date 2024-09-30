Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C5898A2B1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 14:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1846910E432;
	Mon, 30 Sep 2024 12:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dmoFssvk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256E210E40F;
 Mon, 30 Sep 2024 12:37:21 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-42cb9a0c300so33351965e9.0; 
 Mon, 30 Sep 2024 05:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727699839; x=1728304639; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tn+GOzQztHgHcIfRc1gU/LmX7CJxu4Do9s+iY4ufzHw=;
 b=dmoFssvkIkiCWRG0A4I7kLjQpN0Cm3TvSyG/8Q9gmhdPyynGisSainyDTtMh8PYAK8
 1LbaY9kmnFTwXGUfT+JPs3ZgU7BTjLDO6Om51w08lNVD4vL/hlTYPasL2Nf/KTtQB6pU
 tgTxeB6dm5hkcstoUY0915kXPhsI1r5QxXU9p2FsJYdK4rkKvt97U2krOSspdZ08tRYI
 M7GKcMB5iQL9b+XGC1lbGKWu4fLH7twaPKpee0QiZjnol+v5fjBoHWvLjyshT6L/onOB
 5FZ6bA2FpE7zbXyh19A6qJUVEtEC3t0gsBDVjSXAkUI9sg7DKilcAArlw5iy9G6A+t6t
 kjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727699839; x=1728304639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tn+GOzQztHgHcIfRc1gU/LmX7CJxu4Do9s+iY4ufzHw=;
 b=uN1RymshOiDe9jSw4R4+vEb9GL28xd/ZvQOM8u1qS9OLd2l7Y2R0jawLKHSp+U4PgM
 JSlkNATqSaTDFFJrzzrOS0DF39Hwdjr8Ww+Qx5TdeWKG4itzz5XwF/PTCuFRnxkOu7pO
 e+uVRCtConQ7+EsZjG+2zKltyF+roxFsYwMfBF8giYeJUkVo2bJEu0v9su+NREbUI+DS
 RP/oKBS5XzDup2CghmHTo7aHPTeDuH78Ky4CBG7GUl/bpHVZQPz+Imj/RPgcUlyQc32o
 mzBejTCMtGYx3EPvhLWtet184A/IcgZ3TAia/MrFTkr8XnRaL8sdEpGG+aHhs8iiFbHv
 D7Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHE+hzoVYKz0t5AXVZ7u9BpJyP2+b2THAs54UMC1K7WjurAsJ/Ju3fKkZuqD21Pu7n2W8egN9UoyC5@lists.freedesktop.org,
 AJvYcCWnbOT7APXeyVDABahZRFtm8uJHKN+xxHAYiPPpvuboZh/ym5UO8rK6xS+DZ9TaegW5zt/cik3YmMY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6/PzbZwBMERi1BO4QS/Lg0KCZ3/1e6x00a0CRgW2FEgXRDiYj
 AmmTMeVuUX2dNIKb400WdXKdm5xyAznqIhOK6MneO1bCyBi3JpFi
X-Google-Smtp-Source: AGHT+IGvq6NRT6JufQmn6LdLh9JuzzheTPsAQprqBquWz6qQ+pBzTt6Ksdb4rtzF4i0KxoWpmKQ3VA==
X-Received: by 2002:a05:600c:1c26:b0:42c:b950:680a with SMTP id
 5b1f17b1804b1-42f5843a723mr78695175e9.20.1727699839348; 
 Mon, 30 Sep 2024 05:37:19 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 05:37:18 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Bart Van Assche <bvanassche@acm.org>,
 Hannes Reinecke <hare@suse.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH v3 08/19] scsi: libfcoe: Include <linux/prandom.h> instead of
 <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:19 +0200
Message-ID: <20240930123702.803617-9-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
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
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
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
2.46.2

