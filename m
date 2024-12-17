Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF989F5A09
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 00:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845EA10E2E9;
	Tue, 17 Dec 2024 23:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AZ6MiMAB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296D210E304;
 Tue, 17 Dec 2024 23:01:07 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-aab6fa3e20eso843877366b.2; 
 Tue, 17 Dec 2024 15:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734476465; x=1735081265; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K2Q+5lZ93c/1180fBGK9dFi80vfh3bKphGjr5C1ObCA=;
 b=AZ6MiMAB751qfA0J7wk+VKzJOJzXdgL0Z4Tq75tbcLLuNxZs3ZvIpSb3KVux7sZoMo
 82O8RpEI7yjHMilv1igCK0NaQnkutWDYxALcGjES8MtzxGxSVbw5obNHDm5SnFuAm3YV
 NqLkh0NBhxRoOB+IIqlmExzOz2kXw4upeXvGTPlDoTL8Z63VyZ9/XZ0CJ9CRA/daHnEY
 rj92OEGuZ4NtoRKgz+fGB1San6/uYnlFcmucDmUl8vVFF0Hm+/cy9esqxus8YvjGMlgi
 3vSXy8kPHYjZOtUKm4qlzsdjuarbIRk3leziZaL/ozBMtGD3ZJJmPwmxqC7qCt4c4MHe
 6e3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734476465; x=1735081265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K2Q+5lZ93c/1180fBGK9dFi80vfh3bKphGjr5C1ObCA=;
 b=LOwj0/DUcI0MnSIE91P09dehHnjAuQoFtQIYNFIoYHgEHmSHoS+z2/oIOhWPfTWJJJ
 dWfx7gXlsHwLX5U93w9Nok3a2yx913LzucxJnCgPxzwNT1v/nlpdoc58Oa5LNgQLFGZ+
 W/eD20cMSfsjJutGvnJANchwRhBdlIqZgMfcq6lTqjkGF0TeJGDxadiXGMUirFqwaGjg
 zAF3jVreKOC0kyBJyPKCJTqd90PyXW6CqK4PTQuqz4kEe9Epf8zqNTY+6NWXsHmfpZUW
 UFe7Ak/PlN607h+ge/Ggu2/5UN6MNlJk7+Cj1biIDv8Psa/bi4s7ZZOQu6UH6COyjRqa
 ylaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjekN9CR7yysym3E829Co4vT9FieOgbROZPBJylpZFEQJ1Qdmwm3DPfznwHgPLwhxGZrm43G21@lists.freedesktop.org,
 AJvYcCXFA4o/UjAvxezhhY4ykDpxs81slh6m/Ol97XQuqIf5nGxUk5dh/FbZ8Zv75vY7r33A9RXQGLt8to2O@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwV02y6i+gteHr6G3AS0PAI6mfXw3tUaZdFKZRtchYFvpCYpR4J
 O7+9K/pFIiIdrWJFFW6YzVfMjvKDeyaFYI0M4gvSsNzJZgfDVjsZ
X-Gm-Gg: ASbGncuxNMTG4RI2929+fqw0qQPAfpCnETY25qy+Z+/hplRaJ3qu3u8r5Kt/J0vXEcH
 O5/GQgJO4YXcQ4wYaAbIzw2tSEveP7nr+nXjiagRc0nmGJw6IQQMC6Ldp/3GK8SY3xbLYkkJUYx
 /fDZsfW0MEcyHoXDkfaIqcM6142f10yfTjFFVL+PrbBFG8RqzjzepXW6vbqevMAFYoAEIp+s9Oc
 BdrDN6b725Tsq0O4DOQk3vrusYmotdzUkJPtTkZWwsi30UBDZu38AEl5PrX1cE3RmY2OegH
X-Google-Smtp-Source: AGHT+IGDgT1XC/54LMv/yuGZqK7CHwcriAKun+hCdwFovWUgDOgR+DiY5cNn7w+69HSV/VlAf9rmcw==
X-Received: by 2002:a17:907:2d12:b0:aa6:8d51:8fe2 with SMTP id
 a640c23a62f3a-aabf48f9900mr33660766b.42.1734476465330; 
 Tue, 17 Dec 2024 15:01:05 -0800 (PST)
Received: from localhost (dh207-43-57.xnet.hr. [88.207.43.57])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab960065f2sm494726366b.29.2024.12.17.15.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 15:01:04 -0800 (PST)
From: Mirsad Todorovac <mtodorovac69@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Victor Skvortsov <victor.skvortsov@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Mirsad Todorovac <mtodorovac69@gmail.com>,
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org
Subject: [PATCH v1 3/3] btrfs: replace kmalloc() and memcpy() with kmemdup()
Date: Tue, 17 Dec 2024 23:58:14 +0100
Message-ID: <20241217225811.2437150-6-mtodorovac69@gmail.com>
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

The static analyser tool gave the following advice:

./fs/btrfs/ioctl.c:4987:9-16: WARNING opportunity for kmemdup

   4986                 if (!iov) {
 → 4987                         iov = kmalloc(sizeof(struct iovec) * args.iovcnt, GFP_NOFS);
   4988                         if (!iov) {
   4989                                 unlock_extent(io_tree, start, lockend, &cached_state);
   4990                                 btrfs_inode_unlock(inode, BTRFS_ILOCK_SHARED);
   4991                                 ret = -ENOMEM;
   4992                                 goto out_acct;
   4993                         }
   4994
 → 4995                         memcpy(iov, iovstack, sizeof(struct iovec) * args.iovcnt);
   4996                 }

Replacing kmalloc() + memcpy() with kmemdump() doesn't change semantics.
Original code works without fault, so this is not a bug fix but proposed improvement.

Link: https://lwn.net/Articles/198928/
Fixes: 34310c442e175 ("btrfs: add io_uring command for encoded reads (ENCODED_READ ioctl)")
Cc: Chris Mason <clm@fb.com>
Cc: Josef Bacik <josef@toxicpanda.com>
Cc: David Sterba <dsterba@suse.com>
Cc: linux-btrfs@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Mirsad Todorovac <mtodorovac69@gmail.com>
---
 v1:
	initial version.

 fs/btrfs/ioctl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
index 3af8bb0c8d75..c2f769334d3c 100644
--- a/fs/btrfs/ioctl.c
+++ b/fs/btrfs/ioctl.c
@@ -4984,15 +4984,13 @@ static int btrfs_uring_encoded_read(struct io_uring_cmd *cmd, unsigned int issue
 		 * undo this.
 		 */
 		if (!iov) {
-			iov = kmalloc(sizeof(struct iovec) * args.iovcnt, GFP_NOFS);
+			iov = kmemdup(iovstack, sizeof(struct iovec) * args.iovcnt, GFP_NOFS);
 			if (!iov) {
 				unlock_extent(io_tree, start, lockend, &cached_state);
 				btrfs_inode_unlock(inode, BTRFS_ILOCK_SHARED);
 				ret = -ENOMEM;
 				goto out_acct;
 			}
-
-			memcpy(iov, iovstack, sizeof(struct iovec) * args.iovcnt);
 		}
 
 		count = min_t(u64, iov_iter_count(&iter), disk_io_size);
-- 
2.43.0

