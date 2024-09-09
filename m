Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AE4971084
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E18110E317;
	Mon,  9 Sep 2024 07:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TikKAmBs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8580710E317;
 Mon,  9 Sep 2024 07:57:17 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-374c1e5fe79so2605857f8f.1; 
 Mon, 09 Sep 2024 00:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725868636; x=1726473436; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=diK2vfMDlJNUyXW9lcHoHKMejPsgQZ2jk7i/6JqtmLQ=;
 b=TikKAmBsnWYb8T8DaNYKD/Vphb2ixpikpdemxBTkBpo7ouxUwVXJ2uFTfAPZ9Tf39A
 eIS5IVk6xpQoZLmvOgCT/BAMIbR6NKJVorar1gUQq+/HVj+DVJUCadw1JQQS3RZKWlT6
 y30N3iTHs9FvhIw50V9JaNaEiXjreL5y+wE11bLMjdkZWyYBRgJby8waMJOcZi/871Xn
 v2S74mG8uWZ0+1zRU/aJQkUeWreE2j9H9OSzk8MtylY7rE3JneOyNoBizTu1EDtIZhoP
 Rx9uYIjcUoo0ApJZxhu5gK5lRjCcxYYshX5QoCGgSUJjnALTkeTJe25IpBknmovk0m2v
 /llg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725868636; x=1726473436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=diK2vfMDlJNUyXW9lcHoHKMejPsgQZ2jk7i/6JqtmLQ=;
 b=k3ft2YRvD8xFD+gQyrttXTN7LHhtTU3NGOpoU/Ik6Aq1zmW6PvzIzX+uRXAfOPM4IT
 4V24vVXZsm5bQoeUA1LlrkzWiQWBKQGygSsbBEZgcdpsEFXXULuQ3lNmQWvb8dWL7Dd2
 MEWOgCzesT1lXSXZ7eNadBnWMAT1knVHeefF649cYMo8ja2SBHiUNZCvKgjlcHgD9EPC
 VBTtnT0rJr7HaBdZ7dY0YcsWMR92iD8BX7+S210ieHdnh8Af2cwYAyCb2iUDh0KAaQTP
 86m061TAAA3NRDPEjcOBId+yK1+unhP36uRQbUbNZaB+cCswyJeDbINQXh38v4SA5lAL
 jGNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8o4V+L+pcmeL8h3OnIYDJ9nhO+qZcF63U+eph7JO9SK53CwHuKpM3L0M/EAxvJ/FJYh7Ely1seJs=@lists.freedesktop.org,
 AJvYcCUooptVhjFslqd3JoVsBjRFhAWyDMZYRvZG++gFz8o+UnPORSXIXz9madwXBplX4+oH7ZmE8GL6UJMW@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCuFynObTKfSU31GWnxrG4EzmHC1Yv+bmnb+hE0iu1c5iCS/Qo
 IgmjuWh4ZqvE77uQIF2eUoqQz2x6u3gR5RWqcLZ56W9vEn4p2SbY
X-Google-Smtp-Source: AGHT+IFme0X5nXLgn/ucuf8q8ansjRE1zBSf1qUsO6JYCVp2iHcyiqIaQ+1W/AW6ZFOhV/STuqOK5w==
X-Received: by 2002:adf:fe84:0:b0:371:8e3c:59 with SMTP id
 ffacd0b85a97d-378895c2578mr7417099f8f.5.1725868635798; 
 Mon, 09 Sep 2024 00:57:15 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:57:15 -0700 (PDT)
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
Subject: [PATCH RESEND v2 19/19] prandom: Include <linux/percpu.h> in
 <linux/prandom.h>
Date: Mon,  9 Sep 2024 09:54:02 +0200
Message-ID: <20240909075641.258968-20-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
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

The circular dependency was removed in xxxxxxxxxxxx ("random: Do not
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
2.46.0

