Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D712098A2C1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 14:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2053F10E43D;
	Mon, 30 Sep 2024 12:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CTPqtJLK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D951510E43B;
 Mon, 30 Sep 2024 12:37:36 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-42cbb08a1a5so39878575e9.3; 
 Mon, 30 Sep 2024 05:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727699855; x=1728304655; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b0+j8HZP1cVf+QQUDZOhjhaodRPqf5Kzd1FP1uUxc6s=;
 b=CTPqtJLKmoUaXb6RdXRD2fY4KczLfpOEaXjR5YqITuIM3biyqmQ1qxUGeluRVptwSY
 Ttf8mWQWxSWUnjmAezol1hV6f7ZVqQw1csPx6tOCz20zALoYVnnesderPAujATw75Tzm
 Ut54eXbxyTLsLV7Cp5+ZV5WhfjA/uPw5/C5+5yFMPMyBnqYYNfLUFSCUo2XEo/F5N5ML
 QLSbKaIL4b4/kQ14R6IvQUHFCW3WDl7qWQ/RGNdvQLoar8VTo7VVzZ9B0aOTOFTUpR0f
 YrJHDDtMSdUaFHxzNvmU/oBu2d5gjr0T33WlKV3m6GKfUKGEe1ue2bqnGmsf3WdjxSkt
 OegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727699855; x=1728304655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b0+j8HZP1cVf+QQUDZOhjhaodRPqf5Kzd1FP1uUxc6s=;
 b=ubYKzQVFZk/QO0+vvroJmXuqYbsuVkLuUM9tz0jxiOABB5XKxOEURH1H4NJL8efFkF
 bNrjaxosKrhgaYGCA45N0Kf0c+oGNFptWEMc7UikEgB3RJFhixYn0KaxwECJuMZgYm43
 W9rfb59muS3DlZ9LOtb0uJfwXQWBz89rr+gFcIVzhcbXB6/o2WLYCkxdp0vFzxO+gEbL
 IuRRjEl5vmns5a3Huvkaa1H6PjJPMqRDsV4/898lG7rDbpp32V8jKbQ3y0PD83N3XKYd
 Dz6WZrRsFmpxRUTivXpbPVwThHDVoWl2zIejSWkuDfiFCDDEPyrOWzq1J88wyweQh6IL
 /SVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW26tu6FtaQry/YTMIyUgjamRzbvooh6EWSxFiwYw6kKSW+oMZQimIvdZ6ed4RoU36Iby4xxo8lyZZS@lists.freedesktop.org,
 AJvYcCXFRtAUDqI7/PwOSGYht2C5wq9XWfQT++vHMQG7kmpWdr5nc7pIGrv4hw+I9DzOchM6fXVIli7XOdk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQKBoNZ8wsYXDlfYcFTTShEvk2PtXlMVUMDZrVarVANsmio+6y
 pAo1vn46FGc06lRJ8/WXDCXYYuWwOEGwV3ibpcp/Wg2s+WNUSG8Z
X-Google-Smtp-Source: AGHT+IHdC1cyaWvS05r5143QqcQIcUYzzrxVQfsNi8sq552bi8Bx4Z/Dm3LJ5ZgNcGYz44ssbU9Czw==
X-Received: by 2002:a05:600c:1da6:b0:42c:b187:bde9 with SMTP id
 5b1f17b1804b1-42f584a2dd7mr90988995e9.30.1727699855019; 
 Mon, 30 Sep 2024 05:37:35 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 05:37:34 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, "Theodore Ts'o" <tytso@mit.edu>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Kent Overstreet <kent.overstreet@linux.dev>
Subject: [PATCH v3 19/19] prandom: Include <linux/percpu.h> in
 <linux/prandom.h>
Date: Mon, 30 Sep 2024 14:33:30 +0200
Message-ID: <20240930123702.803617-20-ubizjak@gmail.com>
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

<linux/percpu.h> include was removed from <linux/prandom.h>
in d9f29deb7fe8 ("prandom: Remove unused include") because
this inclusion broke arm64 due to a circular dependency
on include files.

__percpu tag is defined in include/linux/compiler_types.h, so there
is currently no direct need for the inclusion of <linux/percpu.h>.
However, in [1] we would like to repurpose __percpu tag as a named
address space qualifier, where __percpu macro uses defines from
<linux/percpu.h>.

The circular dependency was removed in ddd8e37ebaa1 ("random: Do not
include <linux/prandom.h> in <linux/random.h>") and it cleared
the path for the inclusion of <linux/percpu.h> in <linux/prandom.h>.

This patch is basically a revert of d9f29deb7fe8
("prandom: Remove unused include").

[1] https://lore.kernel.org/lkml/20240812115945.484051-4-ubizjak@gmail.com/

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>
---
 include/linux/prandom.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/prandom.h b/include/linux/prandom.h
index f7f1e5251c67..f2ed5b72b3d6 100644
--- a/include/linux/prandom.h
+++ b/include/linux/prandom.h
@@ -10,6 +10,7 @@
 
 #include <linux/types.h>
 #include <linux/once.h>
+#include <linux/percpu.h>
 #include <linux/random.h>
 
 struct rnd_state {
-- 
2.46.2

