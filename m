Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8185E5935
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 05:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F115D10EA4B;
	Thu, 22 Sep 2022 03:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA1810E025
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 03:10:24 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id d82so7924329pfd.10
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 20:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=kaPCbEUam/i/QzM3EsiD/q7EbxvCz2hqpx3qsHkAHe4=;
 b=n3JitkeKKUUxbz6yn64Uwj1L8NZF8ivw+xHJGwLWPTznbBHC9NKX5oIDtTPO2BaSLc
 93ZTFQf3icolOuiYEksXgK7g/tzg0rkadZNBpMtyblAayJyXz59n3d2igSogXrXOJeEu
 gpFsv/wtpmyI2nisZWM6BTAhUm+uMJ0L5a/t4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=kaPCbEUam/i/QzM3EsiD/q7EbxvCz2hqpx3qsHkAHe4=;
 b=L6u95xQQ09WervNU1aoLCDz3Sut9RSrq/iOucot0JYkBfF3QvGI/sSm0YQVEDWnuXz
 MlSN5rFiqkwkHCFtcZA5cU7RGRK0Sab7wMwHTPM7a8+lw/35qqKvjwgO7711ur45edin
 PPxHol5BuOZPvaaaOpAsKLZxJPRN+7jnP3z86lGWaAX5gYvimLoaPCFbhKJaLVjRTpGP
 isoryrwqJ0SjQDZk1hpi9GUiaIjZD32M1jfTXvQPI8iH/gnIkfBSvI2DHhwmgOBu2Xdw
 h2ND7DT+/MqEkIn+p17ovCh4BKILaCW/a6xf9NdQ7sqfTR310GYaLsvnMN8tF75dVTcM
 EsLw==
X-Gm-Message-State: ACrzQf0ZcTqLErYNEbNpzPOQ86pvrloru+OikPv/65PDA8ZmIA0HFWqa
 j2TWzQx0awv3VWIc3iIm9Cd9fQ==
X-Google-Smtp-Source: AMsMyM6cFS7tDGVCwJ0vHG2t9zSWZS1Eoi8Welusn2TdzO1FITGlKW23X2CzrnylSu9gzNhY4M5M0Q==
X-Received: by 2002:a05:6a00:c91:b0:540:f165:b049 with SMTP id
 a17-20020a056a000c9100b00540f165b049mr1383264pfv.76.1663816224094; 
 Wed, 21 Sep 2022 20:10:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 69-20020a621748000000b0053725e331a1sm2959597pfx.82.2022.09.21.20.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 20:10:22 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH 04/12] btrfs: send: Proactively round up to kmalloc bucket size
Date: Wed, 21 Sep 2022 20:10:05 -0700
Message-Id: <20220922031013.2150682-5-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922031013.2150682-1-keescook@chromium.org>
References: <20220922031013.2150682-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1342; h=from:subject;
 bh=PATxOgKCtfzCXQKH17glgfixgYzE1x2L+YHf7rSxpvE=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjK9ITJpSDjmxsaSk36KMYUjIvxLLAk9hi4Gv/fvEs
 tw4mn0yJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYyvSEwAKCRCJcvTf3G3AJh3FD/
 9lgh/1XHl0SkyqPlMmPB17u7DDgE4q/VJ/Qa3GzTJ+egqjXOgy56TZhDHA57JAbNFH368V7dUHPLKC
 QXVOMAIaBG86hiTbSG2GFtspKIl5m4mQliPhYXo+9i2ctGvX67kQtgkloJBBOBTzM1Va+l8n8oDiM7
 1keZZzJh1/Ke/X48PR3xg7Nx1uYbX9+ergUrLAPxTg/zdXdpoqFOJHqJQ3KTDdZ/Ei4EYr7MM+zZd1
 B+a+f4KPaYbr0rUNv/eRElOKPdR3IRmKr00cn3bz0YQJFHMIHIfiUC7c02Q5mRGArZMpC6TDBu3Tkb
 nuAA6r64037k3F4P3KgpNrjYdXUKHgrLD5MS0HV/wt0Jl9wh6vCNnbY9hyrP1HoFV59EkKwXqy05Vl
 7L7CE/IjCudzIhmSQJ5qMWxuufWw0aOCT98jEVLKn5HNir4xbt3Nk5GB3h8odtKKt5aij2g+sglk0N
 VozOjrkQEETzGVX7M0zWbpzsD61ZTOIY4ZAn6Zzztl/0Napt96blNs9J1EbovYn8uMQ2+XR6pZAwD1
 TALlt7LDxwlItLIQQBK7XhEI2TYqOric6v3Z1icQjPqGGv16cy/WXfeY/MEtdwAcxELgoSF7ClvUlL
 BHriLuCX3SJCTRPP98sRsMm0ReDlyAlIib9iPFvDtr+pDztAlOw51wwNqgZQ==
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
Cc: linux-wireless@vger.kernel.org, Jacob Shin <jacob.shin@amd.com>,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Yonghong Song <yhs@fb.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Josef Bacik <josef@toxicpanda.com>, linaro-mm-sig@lists.linaro.org,
 Jakub Kicinski <kuba@kernel.org>, David Sterba <dsterba@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Pekka Enberg <penberg@kernel.org>,
 Daniel Micay <danielmicay@gmail.com>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of discovering the kmalloc bucket size _after_ allocation, round
up proactively so the allocation is explicitly made for the full size,
allowing the compiler to correctly reason about the resulting size of
the buffer through the existing __alloc_size() hint.

Cc: linux-btrfs@vger.kernel.org
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

