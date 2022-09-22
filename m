Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B665E593C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 05:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185B410EA48;
	Thu, 22 Sep 2022 03:11:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F55010E025
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 03:10:30 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id x1so7544873plv.5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 20:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=TDASAml4kCnGP6A0dhCkNjKPm18x/T6dZyC75aPZacc=;
 b=WPgEF+jupR4SGB4DLno2k2bBCbZ8b8f+ZrlxKcIQeEbCtj5WBgsCFhiT+NIX1Fpq8q
 RVzdxz0WZY9Xy+TjHVDvowfkPuPW/OFy/IlUhIW+WjLJlx/oYe632OrUVLWT43o6LOap
 J1uHENSlV+a7neJtjBRovZ5eH4VN/4Sv8DcCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=TDASAml4kCnGP6A0dhCkNjKPm18x/T6dZyC75aPZacc=;
 b=MosxuX6EFpyJomKiJMvUWQCc/0m6ToXxKOH0T4GJMD9w6noERiTQpygzsRmb5ExnzJ
 VQLPZxVU945r7YVhX27HVKC3AdtAYEaP9hfPEBTYduHMRv0ltGkfCEyP9jDm4SuE886U
 hsq/3B/ZtY2ptdz8e09GhaMy8+WrfpiBJT+mWeYlw8BWekRYdInuwMGSVSUhI4rMhLdt
 dujKn+f855jopUfrZk/LwpH2o2LbHWFELQ3LUXt3cHhCsG0haZCuTSsOGToFgHbI/tw8
 6PfpYWRzDUYRGA5tIqziYFG4d4yKd+BUuBxE3KtHOwnIyg41Mgfrp9LA0PQiwbvDg49E
 UrQQ==
X-Gm-Message-State: ACrzQf0zEJKpJ7g8AeRIuMdsDUp9op7yRYjjfY3Z1oNYXAvv0mMXieUz
 WIs7jAuPYzoJMxknczVupFbVMw==
X-Google-Smtp-Source: AMsMyM6FwJ0f+Bofi6cEtpiWEB7NdUhtmrkt85vC8m03N7qUc6HActCoKwZbZiJ520VUx/+qozuRZA==
X-Received: by 2002:a17:902:ec85:b0:178:8a69:45fb with SMTP id
 x5-20020a170902ec8500b001788a6945fbmr1346743plg.130.1663816229473; 
 Wed, 21 Sep 2022 20:10:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a170902e84b00b001782a6fbcacsm2768353plg.101.2022.09.21.20.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 20:10:26 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH 08/12] openvswitch: Proactively round up to kmalloc bucket size
Date: Wed, 21 Sep 2022 20:10:09 -0700
Message-Id: <20220922031013.2150682-9-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922031013.2150682-1-keescook@chromium.org>
References: <20220922031013.2150682-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1419; h=from:subject;
 bh=BnVOhrGnWnn0qmsrneuatz5VZroW3iZYMrlDdw6WzZA=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjK9ITSglsXN14oMtyaHSvyKAfYqb/jU+ua3WQ3QDI
 +BCEy4WJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYyvSEwAKCRCJcvTf3G3AJuckD/
 0fC2DD7jgGoKpFD7s52Imf5skay/p4qVmK0rvZNjkGAmNGvUFsTnir5GI3TMV3p/FWB9oxlzjn3lRJ
 YbQuqElrhpv1aHtZF5nq2pNe2WeidRtExDsumfRW/9rwf58N/wfxbElAY9GHoqVRc3lUIV9oQYeOhK
 1kJwstuo1zV2TYN4g0iYTTSXNQhbPXQ513gM0PP9l/YiITmzLOgjZgDFaN+QjDNsRclDp6Yt0t3KK0
 u44yaM81Tj4s/G/cazw7Jsf6TLb2WBPqCt8tdGe27UEsHIqsFjpRY7nmsAAp8iG8Xem8x+/oYI/Wbk
 HgMgUuw1m5UkfchSrwCJfeis+j1yNloKfOqqnWkCkG+hSthHxri16TT3gYtEK81SyX7qdZEi0YzWC1
 HzPQNdrH6o3PN6vMQOI+fCDeICkvey7UrPwFg21Eqq5d0i1Q/IjdJkPIS5rxpe10rGou2R7M83TPCj
 g7LmoCyTxmRqFzEzRuBHtLLGVMHa5PjJy+FD8ubMoYHOzgg+Mw1qV+65O4LUccNAhythMxiYUkwGsA
 5/JlFokXB6JtqWVHa5OTlymJF5c70uDllOyQsXSHJV/6Th+1UpurayKJIgQFsm/OxxbzV0XgUK3Dam
 UhsIlzfHslsALppIqri1WH09qAL4uxlG1Se3WTFKlmYiDtPENjS7L1iOMWDg==
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
 Pravin B Shelar <pshelar@ovn.org>, intel-wired-lan@lists.osuosl.org,
 David Rientjes <rientjes@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Yonghong Song <yhs@fb.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, Marco Elver <elver@google.com>,
 Kees Cook <keescook@chromium.org>, Josef Bacik <josef@toxicpanda.com>,
 linaro-mm-sig@lists.linaro.org, Jakub Kicinski <kuba@kernel.org>,
 David Sterba <dsterba@suse.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Pekka Enberg <penberg@kernel.org>,
 Daniel Micay <danielmicay@gmail.com>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of having a mismatch between the requested allocation size and
the actual kmalloc bucket size, which is examined later via ksize(),
round up proactively so the allocation is explicitly made for the full
size, allowing the compiler to correctly reason about the resulting size
of the buffer through the existing __alloc_size() hint.

Cc: Pravin B Shelar <pshelar@ovn.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org
Cc: dev@openvswitch.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 net/openvswitch/flow_netlink.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/openvswitch/flow_netlink.c b/net/openvswitch/flow_netlink.c
index 4c09cf8a0ab2..11b2e2c94c7e 100644
--- a/net/openvswitch/flow_netlink.c
+++ b/net/openvswitch/flow_netlink.c
@@ -2306,10 +2306,12 @@ int ovs_nla_put_mask(const struct sw_flow *flow, struct sk_buff *skb)
 static struct sw_flow_actions *nla_alloc_flow_actions(int size)
 {
 	struct sw_flow_actions *sfa;
+	int alloc_size;
 
 	WARN_ON_ONCE(size > MAX_ACTIONS_BUFSIZE);
 
-	sfa = kmalloc(sizeof(*sfa) + size, GFP_KERNEL);
+	alloc_size = kmalloc_size_roundup(sizeof(*sfa) + size);
+	sfa = kmalloc(alloc_size, GFP_KERNEL);
 	if (!sfa)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.34.1

