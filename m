Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BC45E83A6
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 22:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF71710E95B;
	Fri, 23 Sep 2022 20:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F7610E5DF
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 20:28:29 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 q35-20020a17090a752600b002038d8a68fbso6984995pjk.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 13:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=EL9n9wbZi9fyT3aGiQZS2LpEJMU3d55TaSniCttQvBQ=;
 b=KSB0ryauelIrE7oREtJPxrYTfb46QmB7O8hzK0+cy+92LZCq5Nz63nwaqh+78ACaPs
 Olaj8m72mRzC/PVKFU0FisO8X9DWDdQZNFNkYIUifwiQsMgCUkFHt+ReTq+9Up6aPWOW
 bZkQ8bZsmvsZxcYJ3ShxN6tlH5c8ZEFyuIKz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=EL9n9wbZi9fyT3aGiQZS2LpEJMU3d55TaSniCttQvBQ=;
 b=N2boOwW6g10cbSZzPMq3hV9f3iHfgSYVCcO074FNfLvcyBcasO3qgav3cIE4kRowZu
 jkXyWpU0PWaCy9n0A1MVvKjJB4M8UFzHHAOKYh2YGeWMCYgPTeko+FkEyXae91dG+jKw
 v5MyPPbiCs3xXhX1zM8CHiVMW+3OOhTaigzd/2neFZe+34nOi6FZj1I8TtRhi+1leq48
 Xyx30S1z5B8RnLiLt2xP75UxOuQLdbQYuNB+YWB08cny0MYN2rfHbBNEFawHF55eFUyH
 ouS08+HAbPqbuL+/h6D0lgevliClq0kTkq4Re/KUIH8DV1MiNGF3h+LuyoMcdfc/jTn3
 K3nQ==
X-Gm-Message-State: ACrzQf3VztLX0D9L9VvSlgIckev0EzJvOTE/7yLA6DOcBSlVPd2mXQ1k
 Mykgars1yUmywHfi1/1NOG4J9Q==
X-Google-Smtp-Source: AMsMyM7eoJHZKH3YSKsY5YkDiy457iONKP31BWBrEV5/G3nKELCTwmbb5LPc9LXMuh274JI0xAYzRw==
X-Received: by 2002:a17:90b:5096:b0:202:df4f:89a with SMTP id
 rt22-20020a17090b509600b00202df4f089amr11673659pjb.25.1663964908260; 
 Fri, 23 Sep 2022 13:28:28 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a17090a2f8d00b002005114fbf5sm1954043pjd.22.2022.09.23.13.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 13:28:25 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH v2 04/16] skbuff: Phase out ksize() fallback for frag_size
Date: Fri, 23 Sep 2022 13:28:10 -0700
Message-Id: <20220923202822.2667581-5-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923202822.2667581-1-keescook@chromium.org>
References: <20220923202822.2667581-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3087; h=from:subject;
 bh=G1YS7lvbIYUjmUGwno5SYLunWPBrx5E5JtrQIsKL8KI=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjLhbk7fSVXcqHZwwHnEeVt5B6a48oJZB6JZP86UHM
 ZPzL6leJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYy4W5AAKCRCJcvTf3G3AJgnSD/
 9W8qNAP6Zy5DglrKDnwHBrzpsDiEdH/wfMvohIguBt7D/fftewFQ4tqvtjrxneIk1J3RM14QXLiprH
 MUqZq5kdW9AT1gvmup3TGoweA6Yx2DkGWfJS/v54NRzjRIE4dACjOblKj7iXYFfF8t8R+Eq4nBKII9
 TtYqLSNdRoXH3/bTtnUl7LTmAdi/LlTAD5DefO14HYsKFvyt4sCVHmhAxt18rY+VU63ZvvyAm75jOE
 ZR2xW54lIyrI0P7sO/seLIt5lpZoTOmLb/2IuExPeQiVWZFeDBI6TgHBjXJ5TOb6BsMRqG8sI9zSyc
 6MhJzTpE707Aaq04PeuqtOYkHPiet/lPnkzL7Jf3YqGCLil4ZfuartpWRK5sXfMjIprr+a8J/H57il
 rl0UdHycAw6+EZw2Ra62Z127chdyksyXQQxNCS8S2c1TeagVM0kidDWKmLOnnDdNUnMbfbAVlHUTHR
 rF5BX3KXr4Ue1fmCW5vyKzPqxV9i4JLKOP4MtwhcXHPRjwtzQFVVUnUTb599qTIHj79TLsip/gadnE
 1mfwmisADtH54xLJA8r6vchWr5+CdtzvV8R+im9byluK6q2JHt8Z0ggZ0ffFpYPDovV1P8s8oO7xSv
 C3cPN3vqpfjit9qEKLh+sCGFKp0EMfSwbJWaKupNHO2K/+ug5RCFyPYhfwhw==
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, "Ruhl,
 Michael J" <michael.j.ruhl@intel.com>, Eric Dumazet <edumazet@google.com>,
 linux-hardening@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Christoph Lameter <cl@linux.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Josef Bacik <josef@toxicpanda.com>, linaro-mm-sig@lists.linaro.org,
 Yonghong Song <yhs@fb.com>, David Sterba <dsterba@suse.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Alex Elder <elder@kernel.org>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Pekka Enberg <penberg@kernel.org>,
 Daniel Micay <danielmicay@gmail.com>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All callers of APIs that allowed a 0-sized frag_size appear to be
passing actual size information already, so this use of ksize() can
be removed. However, just in case there is something still depending
on this behavior, issue a WARN and fall back to as before to ksize()
which means we'll also potentially get KASAN warnings.

Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 net/core/skbuff.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 0b30fbdbd0d0..84ca89c781cd 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -195,7 +195,11 @@ static void __build_skb_around(struct sk_buff *skb, void *data,
 			       unsigned int frag_size)
 {
 	struct skb_shared_info *shinfo;
-	unsigned int size = frag_size ? : ksize(data);
+	unsigned int size = frag_size;
+
+	/* All callers should be setting frag size now? */
+	if (WARN_ON_ONCE(size == 0))
+		size = ksize(data);
 
 	size -= SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
 
@@ -220,12 +224,10 @@ static void __build_skb_around(struct sk_buff *skb, void *data,
 /**
  * __build_skb - build a network buffer
  * @data: data buffer provided by caller
- * @frag_size: size of data, or 0 if head was kmalloced
+ * @frag_size: size of data
  *
  * Allocate a new &sk_buff. Caller provides space holding head and
- * skb_shared_info. @data must have been allocated by kmalloc() only if
- * @frag_size is 0, otherwise data should come from the page allocator
- *  or vmalloc()
+ * skb_shared_info.
  * The return is the new skb buffer.
  * On a failure the return is %NULL, and @data is not freed.
  * Notes :
@@ -272,7 +274,7 @@ EXPORT_SYMBOL(build_skb);
  * build_skb_around - build a network buffer around provided skb
  * @skb: sk_buff provide by caller, must be memset cleared
  * @data: data buffer provided by caller
- * @frag_size: size of data, or 0 if head was kmalloced
+ * @frag_size: size of data
  */
 struct sk_buff *build_skb_around(struct sk_buff *skb,
 				 void *data, unsigned int frag_size)
@@ -294,7 +296,7 @@ EXPORT_SYMBOL(build_skb_around);
 /**
  * __napi_build_skb - build a network buffer
  * @data: data buffer provided by caller
- * @frag_size: size of data, or 0 if head was kmalloced
+ * @frag_size: size of data
  *
  * Version of __build_skb() that uses NAPI percpu caches to obtain
  * skbuff_head instead of inplace allocation.
@@ -318,7 +320,7 @@ static struct sk_buff *__napi_build_skb(void *data, unsigned int frag_size)
 /**
  * napi_build_skb - build a network buffer
  * @data: data buffer provided by caller
- * @frag_size: size of data, or 0 if head was kmalloced
+ * @frag_size: size of data
  *
  * Version of __napi_build_skb() that takes care of skb->head_frag
  * and skb->pfmemalloc when the data is a page or page fragment.
-- 
2.34.1

