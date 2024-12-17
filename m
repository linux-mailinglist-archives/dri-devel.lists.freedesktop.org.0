Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 520EF9F59FB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 00:00:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB5210E27C;
	Tue, 17 Dec 2024 23:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bk+A/hDr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACD410E27C;
 Tue, 17 Dec 2024 23:00:43 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aa69077b93fso873125566b.0; 
 Tue, 17 Dec 2024 15:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734476442; x=1735081242; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4XEz6rhnsFVB96wbkpW+lhU7b364boMylDpIEeHqrE4=;
 b=Bk+A/hDr2BTE6XRhtutSMEv+cqgYWqeK+q7j2ZYJ1GBjWC5O6uYKLze8DfmLpoiW1K
 hKQB4W3B9WYU71jKdFVisdmNUQTpedLYklO+8yQMjoGt8bxka2UunaiZR0DrU3+Ofwre
 3CFNXIbW68tOAU8c00BPNDuGDRAuD/MSORqSs8L75E06iGJ81aLLbNzNAz7yNZVgEjQT
 uUE/haRVg70NeEYvLbCpn0aZxsORxIk07yrPsaBoEEgkeyGkMOGYeNZ3fqm98CNl9lOM
 rCYwm5y3LTL7SRwZWbJI1uQns9uCWr4Krxmnn+sNSmV12yMX9SEyL0dycGpDadArAPlS
 cPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734476442; x=1735081242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4XEz6rhnsFVB96wbkpW+lhU7b364boMylDpIEeHqrE4=;
 b=IgbY4D89AIVcRAKbCNK2EnBQBEw0p4lSPTPmrk5X/ZnaFUQmnbt7iP0SBztYhAnwHP
 GXAdGUFIpzHeGfJantMTApyaEBD/TTgecVXex0OpokFFTuq/jjiEgloRz3suLz56/jiJ
 GlJmHwrPmw5n3p/kr3BnF8El9xqIZ9w9fXvEVV3q0/inKvpg82ZR93cT4Y06rBcMbNZQ
 lURe49PM/nS8MpwJ0XmRrxsz0EAWjQe/+GsVi6Y1RBQNPUuX56tIzAZ7oK7yg0lkfn1e
 otTNu9sqJCZ87Mwo0HdIBg8uYbjWevpyn7IRtWUZnjY4QO3vCED8cnPn0QYIRUuycCe7
 u0kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4HdYyb7ov17siqopXuBTHQmNH9vGXU8nDTEZSU5jPppY9WfoUPN0R6zX4FusynJ5jUYe1CXjA@lists.freedesktop.org,
 AJvYcCXZKPmzFq425NHs4z/qVJE710YaLk0IwmjBcY7LCesCjvvMlPXfTFdRfbX4yfCDms0GtpJ1y74Hq7Z0@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoSnhWJI3P5cUcWF0JKLigDqzMLAA6tTPpKulNGRsYSIgzRzOZ
 E+uHxLEJuIjs4zkanQQ/uDW4C3z8uqpUwrGvxgN3dMk52ng+Bh5J
X-Gm-Gg: ASbGncuDL6grs4GsmkJwqT5WnfMiIw5OqW4MEI06Y2UMwTOfTkkLe2IeQeu+e5/VD3g
 FpMCtJc0VNTNACgBJ0wrpdWhh9m6hlSPcOE2muKOeObU1hJji9d19fvAmx3sCV5U+dJl/E2mjWH
 kTZdRbzDBiQaanJEkNHjSZl5M9nf7sPhQPb6xMTv7tnnLZ5be2ks7NuWlL6Qp05dVQk4DF5AEuw
 c6MlyNPGwC21zY5xuOMchcVOGfT15zmcDchX2QnPZby3WZrDWwRIsLY6tdbFTZqSG19ew9m
X-Google-Smtp-Source: AGHT+IFQX77wgpGspEiR873ojumfcvZFoep/771Bg+U3/cA+lXsvCwJn7F5mSufydfw/ldrxkhTLGg==
X-Received: by 2002:a17:907:da8:b0:aa6:a228:afa9 with SMTP id
 a640c23a62f3a-aabf46fbf1emr45475166b.3.1734476441886; 
 Tue, 17 Dec 2024 15:00:41 -0800 (PST)
Received: from localhost (dh207-43-57.xnet.hr. [88.207.43.57])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab9c3eb5e0sm468944766b.44.2024.12.17.15.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 15:00:41 -0800 (PST)
From: Mirsad Todorovac <mtodorovac69@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Victor Skvortsov <victor.skvortsov@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Mirsad Todorovac <mtodorovac69@gmail.com>,
 Carlos Maiolino <cem@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>,
 Chandan Babu R <chandanbabu@kernel.org>,
 Dave Chinner <dchinner@redhat.com>, linux-xfs@vger.kernel.org
Subject: [PATCH v1 2/3] xfs/libxfs: replace kmalloc() and memcpy() with
 kmemdup()
Date: Tue, 17 Dec 2024 23:58:12 +0100
Message-ID: <20241217225811.2437150-4-mtodorovac69@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217225811.2437150-2-mtodorovac69@gmail.com>
References: <20241217225811.2437150-2-mtodorovac69@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The source static analysis tool gave the following advice:

./fs/xfs/libxfs/xfs_dir2.c:382:15-22: WARNING opportunity for kmemdup

 → 382         args->value = kmalloc(len,
   383                          GFP_KERNEL | __GFP_NOLOCKDEP | __GFP_RETRY_MAYFAIL);
   384         if (!args->value)
   385                 return -ENOMEM;
   386
 → 387         memcpy(args->value, name, len);
   388         args->valuelen = len;
   389         return -EEXIST;

Replacing kmalloc() + memcpy() with kmemdump() doesn't change semantics.
Original code works without fault, so this is not a bug fix but proposed improvement.

Link: https://lwn.net/Articles/198928/
Fixes: 94a69db2367ef ("xfs: use __GFP_NOLOCKDEP instead of GFP_NOFS")
Fixes: 384f3ced07efd ("[XFS] Return case-insensitive match for dentry cache")
Fixes: 2451337dd0439 ("xfs: global error sign conversion")
Cc: Carlos Maiolino <cem@kernel.org>
Cc: "Darrick J. Wong" <djwong@kernel.org>
Cc: Chandan Babu R <chandanbabu@kernel.org>
Cc: Dave Chinner <dchinner@redhat.com>
Cc: linux-xfs@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Mirsad Todorovac <mtodorovac69@gmail.com>
---
 v1:
	initial version.

 fs/xfs/libxfs/xfs_dir2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_dir2.c b/fs/xfs/libxfs/xfs_dir2.c
index 202468223bf9..24251e42bdeb 100644
--- a/fs/xfs/libxfs/xfs_dir2.c
+++ b/fs/xfs/libxfs/xfs_dir2.c
@@ -379,12 +379,11 @@ xfs_dir_cilookup_result(
 					!(args->op_flags & XFS_DA_OP_CILOOKUP))
 		return -EEXIST;
 
-	args->value = kmalloc(len,
+	args->value = kmemdup(name, len,
 			GFP_KERNEL | __GFP_NOLOCKDEP | __GFP_RETRY_MAYFAIL);
 	if (!args->value)
 		return -ENOMEM;
 
-	memcpy(args->value, name, len);
 	args->valuelen = len;
 	return -EEXIST;
 }
-- 
2.43.0

