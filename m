Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C365E590A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 05:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F279410E025;
	Thu, 22 Sep 2022 03:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E790110E025
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 03:10:28 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id u132so7952518pfc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 20:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=8ihjvmU6X32IA3g0n6Ob0CbMhk1X+mcnfaE/5Wfmhd8=;
 b=YKrPYMNBSJFFHg571lPm5+W8CN7DnIcMIRdXREqQlAZ+eLEk9A8maJxy/vrjrQP/eu
 TYffJ29H5vDdp6sidFBvQbhMXABopPXRk6i9GT1lOsVVh5dTUpn3JKlyT+VRKM4PpYM3
 aDSZJo/bWB/q00QaHXbLQBN7xuQW5YNdYkiuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8ihjvmU6X32IA3g0n6Ob0CbMhk1X+mcnfaE/5Wfmhd8=;
 b=ZeaFo4kRbpxUbz8jKcoDj1dJmOl8c+9LDOEKN2zpVNIqXy5gVvheIMRiAUBdWAE1ZL
 8n7NGZktdUvvYBeteTXZauceaMAGIeldfqkqi3/GyHDaCzqq6GaRzZw+jPv5tibQ9yDa
 AHx0C5Nvd60/DdC6qJWzLQ+oWgjU+193WMMquI4TzFuhDUcxFuzdDeSKu/FXaNNRDMlP
 yO+UvWh1RBQ86P6Z3ltbnkl1X8jepnmQKWbPSsea7meNRHdwolrFsZIy5D4ZxAkKulni
 WrcN6LLc2kswgc4u3XrLgROdIpq1fGd0R4Tq81qhngINxQ3DsYYZZztX9J64Rog2FjGd
 tOfQ==
X-Gm-Message-State: ACrzQf2Py/HW1LmM1h/BQE8OCs06q5e/WBdjAQnXiIJCX83KV/RYWjeu
 e+hw/QMmyd8BAROOMNmtxLcfzQ==
X-Google-Smtp-Source: AMsMyM76eF8+VNznj7IzekXG0QSV+my0aV1DgaIJkS6htzHMwsh1R3Wrb+39lk5TYLYW7ESUsWFZBQ==
X-Received: by 2002:a63:e305:0:b0:439:6e0c:f81e with SMTP id
 f5-20020a63e305000000b004396e0cf81emr1277721pgh.50.1663816228246; 
 Wed, 21 Sep 2022 20:10:28 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 i62-20020a17090a3dc400b001facf455c91sm2649631pjc.21.2022.09.21.20.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 20:10:26 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH 06/12] coredump: Proactively round up to kmalloc bucket size
Date: Wed, 21 Sep 2022 20:10:07 -0700
Message-Id: <20220922031013.2150682-7-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922031013.2150682-1-keescook@chromium.org>
References: <20220922031013.2150682-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167; h=from:subject;
 bh=pDNvsGLyQA8RpBfkkqJxHruRXSdA8gdZalovRqbX85w=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjK9IT/n4E1MQAIRbO7TQnliesxT9vRRUjnB997VqU
 NfNmMx2JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYyvSEwAKCRCJcvTf3G3AJv1uD/
 0UeTRzC7PYbrNFpo0erBLhfyq0OXI7KWJPUznMmMf+cAop1hoIyAS6RCvOy3P43EFrYY2LvmcGU3Aj
 SICc7baXEFvYdMhDJ8d101AolLKruLzinzUGntwccPS2dZe2w/x8T733W5uMnEOoDIW14/zr4IUtRh
 Vlx7PoTaeYeaEQPZwbWSdxU7qtxeqxD9LsQu+HlBYfR1k5rQ/OwJUa0VLmxQS3VuLxNzcqUFIRrz3E
 N9wSWjXJ1fpBM5rUyeWWd8dLef4aKwvQUrxvsQ2VWqLB5t57NofX/QpwkS3ypabCJnUg2eUl37eba5
 OV6vc8FtBSMSsXXhnZ0qRfqcqAOpIlqc5fvFIq+bl3f4xCiJNeEM7atqS3LN6ZEK9rF9EWiIyjfIU1
 rFgqaXZ47QKcNt6D+tThDEVTDgBDzW+/xD6gFm/gAUYLMU55Xrc41oHohWX310hGuJ4uQfMnkpzfJD
 l7QDNBoaF6Eo/aHjjnO/L/2LHxrNen15gNgss8f3Pbl5cYUEIwKYQTUHz4t+WuflfhJ72ydBaVxPhi
 nvK5XI8oXLZUTCjvvJ0NvdCQbKmYhFiTddotTbfTvs9VyXcsa4oRA58e65OY4nlgV9+2HJHYaTy3u4
 CX+OyRwkHX1tSGbw74SSBv0sSXX5LiEItWNDNN9XJyygxijXQxQ7uWbdLfNg==
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

Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/coredump.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/coredump.c b/fs/coredump.c
index 9f4aae202109..0894b2c35d98 100644
--- a/fs/coredump.c
+++ b/fs/coredump.c
@@ -68,7 +68,10 @@ struct core_name {
 
 static int expand_corename(struct core_name *cn, int size)
 {
-	char *corename = krealloc(cn->corename, size, GFP_KERNEL);
+	char *corename;
+
+	size = kmalloc_size_roundup(size);
+	corename = krealloc(cn->corename, size, GFP_KERNEL);
 
 	if (!corename)
 		return -ENOMEM;
@@ -76,7 +79,7 @@ static int expand_corename(struct core_name *cn, int size)
 	if (size > core_name_size) /* racy but harmless */
 		core_name_size = size;
 
-	cn->size = ksize(corename);
+	cn->size = size;
 	cn->corename = corename;
 	return 0;
 }
-- 
2.34.1

