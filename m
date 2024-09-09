Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 363B7970EC9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD38B10E2E0;
	Mon,  9 Sep 2024 07:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FZf7/w3J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649BE10E2E0;
 Mon,  9 Sep 2024 07:08:21 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-42bbffe38e6so28868775e9.0; 
 Mon, 09 Sep 2024 00:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725865700; x=1726470500; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NRfmK9XiELkgvke2KZ1pLgHNaRcKS5bA/Qy7jNwAfDM=;
 b=FZf7/w3J3ypy/N/u+J6bwbgIUnr1dAKUMBbNErnBWILCc6J47dnlLDD83SD31eWXmJ
 CWlFPUE2D9HI+TaRsp43EdKbM1fG/caC1+cfZft04IUGxrmvEsEiPwPhCupUy3xL9A9f
 3vOrB4hz8pcAkhlHwRdy8gbAgdW9ZcC8g6xC3Mp5wdHo+JhpHAvro0THubgYjil95R66
 OU7Z0T5H2WCvt7LindJe49cmwCJ3vKqE4qAqIJlc/PQY1ra/Mbier5NnYSvCjomkDZN8
 MicNpVFDWs6v7e/sM7pLRxcjzYOP/gFIqRHWbehPKN3aHHEoGQyzoOSRuXlwDhtXLJNw
 ErNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725865700; x=1726470500;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NRfmK9XiELkgvke2KZ1pLgHNaRcKS5bA/Qy7jNwAfDM=;
 b=kjW+GYwWG08CN9TR6zUjXRTQ3ZR0+aCSyPwi0GOPwxYn3w0RqHJNmylY2Zxh3MKC4t
 QkGWmGQWmMs0lAuwXWrs+1ugyftTjXW+f8Uk28a+BX3d7HspzqT0Qj93gXLWkf3M+87G
 xJRrDvm/reh8lgEs3Cmw0i8QD3c4sBjQbwj3ryZnD5TZRqtmHHeGqY6m2pkt9aFDS42E
 idu+jsLReneC+y8OVzjzie558/QzvdByZ41WZ+q3iCI0+V736i6/674Gj1I5g5a/JD41
 HnI5quoYdiHsKx6Cj48ILGCO91MiRzGwYXpfEv8dwEdUhu9jsI1hZrXgWwuHTqxKnVM5
 p/Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGkdvExi6g2DeKBvW8nAF0diaqqkpxESxp6jT2AgP187ncx0TxqLxX7qrApMN3fPx3Qv0/C5N6jEox@lists.freedesktop.org,
 AJvYcCUht//mqJMJgW6BTEyd6LrrK17rINhoHKFLdKPYDf8w7JTFGkOA93KPMSckswDOydlFcFhkWT9KWX4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhqmjQNsmzRSdHci/EO3AdgaxBiqCpQ+Sj0EZCkXsVtxR2xVUe
 dK6y9+0aD+/Bn7q5zS6Df5Dj1Zd5acq7e263WtGrPUo4CSLTrUFv
X-Google-Smtp-Source: AGHT+IEQzX2PbRsNpI7OC/KJTEmDR4766NrwIckhKr3JcIgfhLZTDniK2o3Elu8rKu52YDTKEqoecQ==
X-Received: by 2002:a05:6000:1566:b0:374:c8d3:5f2f with SMTP id
 ffacd0b85a97d-3789269e55bmr3943369f8f.31.1725865698964; 
 Mon, 09 Sep 2024 00:08:18 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:08:17 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Cc: Uros Bizjak <ubizjak@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH v2 02/19] crypto: testmgr: Include <linux/prandom.h> instead
 of <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:16 +0200
Message-ID: <20240909070742.75425-3-ubizjak@gmail.com>
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
---
 crypto/testmgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index f02cb075bd68..eeb7edd99a93 100644
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
2.46.0

