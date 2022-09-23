Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B13925E8390
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 22:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3308D10E926;
	Fri, 23 Sep 2022 20:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E6010E5DF
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 20:28:30 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id 78so1226980pgb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 13:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=lIp3Rau3XN5DhulJvqmP3ROLBDtGBYLacs8yQVXUsIc=;
 b=ayrELvkz6RCr+VJ5YTbdaI+C+7T6BGsJEAguxUgCPIN9LMOSG1cQ+4QSxLfuYecJ7g
 rEkt3pKt8Q3IXycqxre3TSAUHzDDJJG0qs2FtZn9cMqz4CShi0DQb1RnbrzDmC1TGFDB
 UCnS6y6zB4oIa+C342OBOENRxbAzNtGyV/eDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=lIp3Rau3XN5DhulJvqmP3ROLBDtGBYLacs8yQVXUsIc=;
 b=1Lp+4AquWwAwYzhWTwmJtbUVAfZKvafxLuyduJr3H4lTDjwtW+4qMAo8SxQhAXimYN
 wQV6X+M4qysCgO7TAa9iag8mmUlWIxc7G3zZO7Lw6yGWdr7Gd6uR39dl7QDzDoXG5GHm
 l/Up8C16EJSsOBEZ5zM1Cjy2WJk24N0l3pt3wKsmWjvscAFreAZrSJm7xEkwTqBRnPew
 oyUbsFoKHBV9TpLKAF6c6Qc2qJIJMZpq96JdSI1NOBv9qItq3XrppbRLrtwh8peS61bl
 /neVC+Iicv7mKO4OgRuFktqSXi5VfncwhmaELj9xTdehzTmjaFp8egbj4N1W09QYp0d+
 CJbw==
X-Gm-Message-State: ACrzQf2DdhPwpjjwJ+78m71RpP9VnG12IJgFTOLgYTgrnMyX7S9fJSWs
 mseEwzgwmB6PlbP1x/azs6JyYw==
X-Google-Smtp-Source: AMsMyM6/T55zDNr2wZmPqXofdZ9R/U3i46Zn4bR+d3pjEfZ773lmSd+dIb1qk1eRO6CnC5XeCBBzng==
X-Received: by 2002:a63:2221:0:b0:43b:f4a3:80cc with SMTP id
 i33-20020a632221000000b0043bf4a380ccmr9160031pgi.367.1663964909744; 
 Fri, 23 Sep 2022 13:28:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 a5-20020aa795a5000000b0054095e1b2e5sm6854521pfk.215.2022.09.23.13.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 13:28:28 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH v2 07/16] btrfs: send: Proactively round up to kmalloc bucket
 size
Date: Fri, 23 Sep 2022 13:28:13 -0700
Message-Id: <20220923202822.2667581-8-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923202822.2667581-1-keescook@chromium.org>
References: <20220923202822.2667581-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522; h=from:subject;
 bh=B3w/yPcNxrDzZTqNaOBRmqqUYMKjQkfGlvei/e1+oVk=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjLhbkv/6yf2iFhq9YdN0Aj+2wDjdTaVU6RYLE7C1a
 mKAEuIiJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYy4W5AAKCRCJcvTf3G3AJuZJEA
 CsVm4vzR8guJhS9ev8gPlqvsMaYX7r8aLG4A2NyUhHtbSYNZT7nhbnknnZom1pWNwXgl8qpCTbd6+f
 vjFzrrIjZtd4D+mSEQPZbx+7rT8VpT3Gtb3/D2nYYDaxLdL/DH99n2c2cbhe8zTWcTnyynJYvES2KC
 EyHjGO9+9QBzmAOfL6UqxFPxgSN6Mwe3il8Jqb4M5is1whaTpYWBL5PS8pHVDzWbA0hBRdEd/F7aPw
 o3KlBtzCSp4XR1hHtVT8NWbMPwch83XMmXdi0o6/GubfCfksfBTpaXo7dIG+SMZZQWfgCIvRni8oUC
 qF3eZ2rfkK2BLw1wcdknu/z43jqhoPV5OtU9fgboiNn0cRbYZC7GmCUWAST/dEfoMQx73mUpyFKCbB
 QKgl1tbq34QTMFjDcV6u59zyZLRrnP18YpxwCaUglLSod93wDcCin1+C5OXvXtCxNg3CAAlxDJHTVx
 0pTds4BRbXQj2/4i4Hb/jcctaZnAs0UoMTTcW+BrbOixx0+CrzBJ0vNQMZh5Hs2WYucbihNX7w0sum
 2KnTPVVPKpteClxy32zMqoJRvgjzvqik9+nj4bHX5wgV6aVi+dbQdRPezJyGYxH+GkBtsj0h3BjaPk
 k/mBMntGy8FlUD9pzWHKmr5gF7fYzXCDe75VLz+YEUGvOyBawRkvwMlkpY3w==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Christoph Lameter <cl@linux.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Josef Bacik <josef@toxicpanda.com>, linaro-mm-sig@lists.linaro.org,
 Yonghong Song <yhs@fb.com>, David Sterba <dsterba@suse.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Alex Elder <elder@kernel.org>,
 Chris Mason <clm@fb.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pekka Enberg <penberg@kernel.org>, Daniel Micay <danielmicay@gmail.com>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of discovering the kmalloc bucket size _after_ allocation, round
up proactively so the allocation is explicitly made for the full size,
allowing the compiler to correctly reason about the resulting size of
the buffer through the existing __alloc_size() hint.

Cc: Chris Mason <clm@fb.com>
Cc: Josef Bacik <josef@toxicpanda.com>
Cc: linux-btrfs@vger.kernel.org
Acked-by: David Sterba <dsterba@suse.com>
Link: https://lore.kernel.org/lkml/20220922133014.GI32411@suse.cz
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/btrfs/send.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/btrfs/send.c b/fs/btrfs/send.c
index e7671afcee4f..d40d65598e8f 100644
--- a/fs/btrfs/send.c
+++ b/fs/btrfs/send.c
@@ -435,6 +435,11 @@ static int fs_path_ensure_buf(struct fs_path *p, int len)
 	path_len = p->end - p->start;
 	old_buf_len = p->buf_len;
 
+	/*
+	 * Allocate to the next largest kmalloc bucket size, to let
+	 * the fast path happen most of the time.
+	 */
+	len = kmalloc_size_roundup(len);
 	/*
 	 * First time the inline_buf does not suffice
 	 */
@@ -448,11 +453,7 @@ static int fs_path_ensure_buf(struct fs_path *p, int len)
 	if (!tmp_buf)
 		return -ENOMEM;
 	p->buf = tmp_buf;
-	/*
-	 * The real size of the buffer is bigger, this will let the fast path
-	 * happen most of the time
-	 */
-	p->buf_len = ksize(p->buf);
+	p->buf_len = len;
 
 	if (p->reversed) {
 		tmp_buf = p->buf + old_buf_len - path_len - 1;
-- 
2.34.1

