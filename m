Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6925E5924
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 05:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DF410EA42;
	Thu, 22 Sep 2022 03:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1331510E025
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 03:10:26 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id w2so8007736pfb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 20:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=9y2lxcjKWi6kM02eOSoQVeQPXSl5vobQ22c95G6mEc4=;
 b=agBKCvV0iC7GQIcf8sz7UOH3dVItREZG7jPdBvtdPy2YLOE0+XAy2KLGvZyzWCldr+
 eBmNfNQZyJ71RW93/RqEBJpErudlrwRKiB3G8SDyrXVW40aMl2oo1k6YG1lfeIUUjh9P
 GUamhTzL1Eje9pLqolXG4/wF2iRxonrtVdIpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9y2lxcjKWi6kM02eOSoQVeQPXSl5vobQ22c95G6mEc4=;
 b=5hAvSE48xcb86KpIMgLK20PZYpR34gfKfVNb5Zp260xnwiBBNgSXk+zB3Q4vV3/YHQ
 uUbPFuwVXQ0omR/q5Y5kyiOWIuRKqPNzpYyoWyJ7XJIl94crBrJ81L+pyqTZEAyk5sEt
 qMW2LID8K45gVE8/ej0vLzE3bgea+1KDywtEV/C0R2D+bgjOkSHEqmt6dcbA5elmGvN/
 knrr/MU4TUBvr6OmUQFrxJo189U0vRPNbcKy/0buUAyC/6DkXGZCGvUH6I0jq0HL006w
 p1R6UDo9PtYfAqin4rw2U2yalYG+GZVJp4cumhb2KB0hYiy72jOXBQmz1dibThkwSliv
 lMgA==
X-Gm-Message-State: ACrzQf34aQDzQgsgGkjQ1WbkYrXE5qzkMYzORuXw+qF7uaZDFyLyFzeu
 UpisDv2ao3bzmbeVXreBmsgEng==
X-Google-Smtp-Source: AMsMyM7fmjxAfGTycH9CaoCA2DJAnd13bu5HArBXnwB99jjW/VrHSPoTFEUdZfu+ReZxNaNi1nSSsA==
X-Received: by 2002:a05:6a00:14d3:b0:546:e93c:4768 with SMTP id
 w19-20020a056a0014d300b00546e93c4768mr1278425pfu.36.1663816226130; 
 Wed, 21 Sep 2022 20:10:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a63d30f000000b004393cb720afsm2684116pgg.38.2022.09.21.20.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 20:10:22 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH 03/12] net: ipa: Proactively round up to kmalloc bucket size
Date: Wed, 21 Sep 2022 20:10:04 -0700
Message-Id: <20220922031013.2150682-4-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922031013.2150682-1-keescook@chromium.org>
References: <20220922031013.2150682-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1741; h=from:subject;
 bh=N6cTYse7nKSOYOPwHuuyZ39Ee5FBmcRJBaahsbeuoYs=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjK9ISVSHfuaLwQgHhIfT+G4+ZNlvTp+tw3ysmjP49
 mcPajiqJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYyvSEgAKCRCJcvTf3G3AJoHDD/
 9MEz1x/p8W1mV4RgWnzrofQu8Rnt8S3z6RAn+Qe1cSDrxAzlEofmKXpYWiJ+/LrW8d+DMyEPH/qhiv
 Z0a3iYatcr1nh3CMNcUGNtMmB0uLZf4MMZQ184oh/sUT8PfviA8YvnEqJsU39RxjaNFpvevCU+UIhE
 ampATmMNn3x9mz3MinyvwRAeCqjlprv9qGhZP19uivXAzi7A5LdGcnY9/yU4NERLhAyGSQzZMoevL5
 foxanGNGMhF7lJpEQx7SiHJ5/UGNfHDmQUAWnnIkH/iu4aw6z8wFCMrDe26riTARf1OhVgycx3C53y
 RsfcyayukdwLx9qBoxlSnrXwcUJmn8ly2s9mOX2jMHadZIKMM3erpLkcz5K5LzoAcHlMME0ZTa6H4I
 r+U57Oid2/dp01vdDgMvdb84JzOixL5JoQHu938RHKYP30IYQwkmhzBuFTkeMJzZsGS4WER47knxxd
 45A6nI1zHNqipyFcbwqyCP0c9FHuUWJex4p1UkuPhpfl9BEy2OV28T7pqLJh6gYsDDqnVtz/7bvacg
 zQ8eV1paLCDfmSbshlpEBTxLnGWlSfPt0cPNLOqHf+Rw64Ee8lJY4M1B9xEIc9508QU/bABpMn7ngE
 vWtwJ0BkH0HMufph7v+73fhgqm8PD3cLFKaT53fQXDIr4zxoPqlAoJbGBvtQ==
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
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Pekka Enberg <penberg@kernel.org>,
 Daniel Micay <danielmicay@gmail.com>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of discovering the kmalloc bucket size _after_ allocation, round
up proactively so the allocation is explicitly made for the full size,
allowing the compiler to correctly reason about the resulting size of
the buffer through the existing __alloc_size() hint.

Cc: Alex Elder <elder@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/ipa/gsi_trans.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ipa/gsi_trans.c b/drivers/net/ipa/gsi_trans.c
index 18e7e8c405be..cec968854dcf 100644
--- a/drivers/net/ipa/gsi_trans.c
+++ b/drivers/net/ipa/gsi_trans.c
@@ -89,6 +89,7 @@ int gsi_trans_pool_init(struct gsi_trans_pool *pool, size_t size, u32 count,
 			u32 max_alloc)
 {
 	void *virt;
+	size_t allocate;
 
 	if (!size)
 		return -EINVAL;
@@ -104,13 +105,15 @@ int gsi_trans_pool_init(struct gsi_trans_pool *pool, size_t size, u32 count,
 	 * If there aren't enough entries starting at the free index,
 	 * we just allocate free entries from the beginning of the pool.
 	 */
-	virt = kcalloc(count + max_alloc - 1, size, GFP_KERNEL);
+	allocate = size_mul(count + max_alloc - 1, size);
+	allocate = kmalloc_size_roundup(allocate);
+	virt = kzalloc(allocate, GFP_KERNEL);
 	if (!virt)
 		return -ENOMEM;
 
 	pool->base = virt;
 	/* If the allocator gave us any extra memory, use it */
-	pool->count = ksize(pool->base) / size;
+	pool->count = allocate / size;
 	pool->free = 0;
 	pool->max_alloc = max_alloc;
 	pool->size = size;
-- 
2.34.1

