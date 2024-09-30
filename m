Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC40A98A2A6
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 14:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8552410E439;
	Mon, 30 Sep 2024 12:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ct2cArjV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7078A10E432;
 Mon, 30 Sep 2024 12:37:13 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-37cd5016d98so2139682f8f.1; 
 Mon, 30 Sep 2024 05:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727699832; x=1728304632; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z6G4Ex/yEG0PawIZnX5kHSAD3j0oy1BU4Shaq5r1xaw=;
 b=Ct2cArjV5i5XmX6n57HW2JvyEcA2M2zXihzbcBCnvnBRmAmwKuMF6odYzHAzGohh9U
 JRZoVGJVdA/yuDbnI7ECsRpYBKe2hXzGAoTaLkVKH9iq4RaOoH8Vklivz+zSCiceK2iR
 1fmSqqoDwonbfkozvWCl4nhA1MQLP7lXtrcHcN+8671SDK8rtZILmJGSxS6JzG92d665
 wYcKfzFd2vjAKE6nkVbxzjLbyx9G9P/OhWGNYZHRvbgIabxt1JAjPBdSCvwIP42eIyiH
 voyXDEmFGmOBLBlm5m0zSAWWh5zoDZn/bRxiAJ9uCIx1QCCnI6rTIDdmniNqdFnmLBlQ
 oHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727699832; x=1728304632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z6G4Ex/yEG0PawIZnX5kHSAD3j0oy1BU4Shaq5r1xaw=;
 b=C5F5bPhNtIi2MbpxenjJ1rA3grZZpVVR7d9ohEDOvJmXaOXiZgqRRCnHsti3Se2UGD
 +WAkpCQhvEZmzJ65okwAVjGhhFdR0g8CNtod8cnyfPMIz45mELKI3ublFZgTN6ciSAVp
 XBt7lKjrsM1s6NXmetRTwBj6EOgzcvZVmwm7/dV5tnBGfyw19vFoXtAjTwwpDyXuKGw/
 eZeVtBzGFkE2c3gyiFGziBe3e8ndghiHAkR249KRDq6T+A1njATfG4rpCerebWmZ2ZiY
 gXgM/0cPv1LP0EFdqyIW3yiPRWrZKOmgsryxagB0NfQucQswsrwZVBUg+WTxqYbRyVIg
 nQXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpkhxDNHndE3D5poVeT6LOYXqkt7naHeeyGCeuyMA2gVdWGfrqkS3gHVie+sO58evSjBcQF5kOmlg=@lists.freedesktop.org,
 AJvYcCXNzmQomzWgPtST0iFKB/oOyCEnWabObaxCGQ6QdiaKASbEvhb6Hb0/Y7kMMDJUa4SU37m/k94JGMdL@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2t+Cc6ItG+Q2Iu189BKedXYkXLNZ4kix7hrMw5h/GX0tWXkXW
 57GV1mAbgYJrMWxWDsDmtVHSRA+9ce0KhnozrLeNh0w6Q512nDQC
X-Google-Smtp-Source: AGHT+IFB6/hHEmYYfhNOCdbJlS8GC1KGQPWBaBcyFYt3K3bCumyRmpa2UpR9z404TFq/hhpGQgYEVQ==
X-Received: by 2002:adf:cc84:0:b0:37c:ccdf:a2e3 with SMTP id
 ffacd0b85a97d-37cd5ad92e3mr6377920f8f.33.1727699831651; 
 Mon, 30 Sep 2024 05:37:11 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 05:37:11 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH v3 02/19] crypto: testmgr: Include <linux/prandom.h> instead
 of <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:13 +0200
Message-ID: <20240930123702.803617-3-ubizjak@gmail.com>
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
---
 crypto/testmgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index ee8da628e9da..43472e79533c 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -23,7 +23,7 @@
 #include <linux/fips.h>
 #include <linux/module.h>
 #include <linux/once.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/string.h>
-- 
2.46.2

