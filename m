Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EC05E5923
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 05:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDAF910EA45;
	Thu, 22 Sep 2022 03:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABE910E025
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 03:10:29 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id go6so8445246pjb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 20:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=nllmYacJVnWYWyMDuOWg+UhFJID/1u9fgEUSXV9a/I0=;
 b=ObVBgj10USdxX2qau03B/fvKSrj9pfzNX++HX3pR1Ku6Ct/c+Mn8B6TC2gGByEksOv
 ftM/dSMzexkJk0pSadbJzyromjdrIDks1988E0vt92N7zZIkoEa3uLvIJsqtFfZmvRDx
 8dl5wBNFG6y2ajB8JRxgoslRMstHrNUREimgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nllmYacJVnWYWyMDuOWg+UhFJID/1u9fgEUSXV9a/I0=;
 b=QITqW1Pz6CjHW/BsijNpc68F4p+56+C3rBB6q/7iusz13yoZfkoacU+PvEo6VMrjER
 PGDqb4+fcr4bqkGnLO1No+kPaXScJ4lvdI1VR3IL+C83KJT+Ju9TKrNii6HGBO9+yHEY
 1Cegd4ty55pgGv2mrd9Us/okM5wTNXWf+FVQ3SHNLndI4nRPN5H1U9c/nI2FBKuqfNvf
 /Vf9H9MwqgGXCsDXf9n91wdk92MrX6IMcn4qKF3z47D6nUC8yBbyjjPh7XGOHDHMpKkT
 DrTGrcg/+T2Asaw9N9Pt3G+1A+PYasAN0t+1rxvVKcDgnwCKGrPdbfSpxPCDgIdvukX7
 29Fg==
X-Gm-Message-State: ACrzQf0VzAGsyiU4bAs45Tg+8BFx0fQBRhk7qhjbn5IEaNwzH50lGWJd
 0DDt/Ad2wZGVqszUO1VfaJ1WYw==
X-Google-Smtp-Source: AMsMyM49XhohtYBkjYXAytE2XFYLdWSstHIvAKOydHl9P7CLdwWaHlEa/nts1aXdGwMJ6p2JjPZrLw==
X-Received: by 2002:a17:90b:180a:b0:202:ae1f:328a with SMTP id
 lw10-20020a17090b180a00b00202ae1f328amr13239578pjb.78.1663816228865; 
 Wed, 21 Sep 2022 20:10:28 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a170902ced200b001783f964fe3sm2766723plg.113.2022.09.21.20.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 20:10:26 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH 09/12] x86/microcode/AMD: Track patch allocation size
 explicitly
Date: Wed, 21 Sep 2022 20:10:10 -0700
Message-Id: <20220922031013.2150682-10-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922031013.2150682-1-keescook@chromium.org>
References: <20220922031013.2150682-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2149; h=from:subject;
 bh=LRLPHeutQvsvCqROzEs3/rr/P6uPQnPuMyr/7IE9r2g=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjK9IUgfEF5Q67qoI3XgFPEX8J4smU+peBuyPzdpCc
 nIEpFpaJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYyvSFAAKCRCJcvTf3G3AJsUGD/
 4jiZQIVRjbRNvUVUl7QhNkO/5LbO1QHELDOu9VeAlksbBy6XuO+qlBw7CoqEHO44r9YLdeZFAssNud
 wYDnzHSwrmpVT9VOZKujYIXUu4jVQeSmpRL+/zi2WAX5dpAscIDYzhoFkFQuW/aQn9nvVlwwWv2G5A
 GfumYAURZ8BP94NLhlaTRLKHc10AEhWJ08FZCbBy/NXE7LT5VZa1H9zYppFy1ulRzYa4xiX1Weubkg
 o7PsRtqxx2jPKi9ywlm4JL33MLhQ7Hl1dObUN2bhp8DRTalPx6Bc6SUbteYJPbwKYEr7+5pD3iT+ek
 78esKD6WsOGfBLAZ8pf8lCldD0XPYRApJVGasz+zBeg9LCqumUaDwNzE9GNpHfaorgWXNBuXeuKFif
 5rYMN95t+ygRdOvQdNJlCJ0JlPfMcJajLzKyYKCvSlICPcTlaGpjjCGXtVFMSUZgvkbvhOZnwoRTfP
 LCMqYLu+xX8m1YKOnipcqlhorAe+A8u41dR2tlI0HUW4UYrUIZQ5O+CQqG80Ge713Eg5bk43crrhKD
 YsmBHTsJ/g7EuL/mG/+BltzwRQSF9KUT12J1eO+hSib+I+7XiE4mW8dN4M4JLJmSxvAa5G/pJSmhKH
 6ZKIBAfSeBqo6VbAeV28Lkl0KnRiBwVDbQ08NwltR1YuONRBkYjOqYRx4S+w==
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
 Borislav Petkov <bp@alien8.de>, Jakub Kicinski <kuba@kernel.org>,
 David Sterba <dsterba@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Pekka Enberg <penberg@kernel.org>,
 Daniel Micay <danielmicay@gmail.com>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for reducing the use of ksize(), record the actual
allocation size for later memcpy(). This avoids copying extra
(uninitialized!) bytes into the patch buffer when the requested allocation
size isn't exactly the size of a kmalloc bucket. Additionally fixes
potential future issues where runtime bounds checking will notice that
the buffer was allocated to a smaller value than returned by ksize().

Suggested-by: Daniel Micay <danielmicay@gmail.com>
Link: https://lore.kernel.org/lkml/CA+DvKQ+bp7Y7gmaVhacjv9uF6Ar-o4tet872h4Q8RPYPJjcJQA@mail.gmail.com/
Fixes: 757885e94a22 ("x86, microcode, amd: Early microcode patch loading support for AMD")
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/include/asm/microcode.h    | 1 +
 arch/x86/kernel/cpu/microcode/amd.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/microcode.h b/arch/x86/include/asm/microcode.h
index 0c3d3440fe27..aa675783412f 100644
--- a/arch/x86/include/asm/microcode.h
+++ b/arch/x86/include/asm/microcode.h
@@ -9,6 +9,7 @@
 struct ucode_patch {
 	struct list_head plist;
 	void *data;		/* Intel uses only this one */
+	unsigned int size;
 	u32 patch_id;
 	u16 equiv_cpu;
 };
diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/microcode/amd.c
index 8b2fcdfa6d31..615bc6efa1dd 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -788,6 +788,7 @@ static int verify_and_add_patch(u8 family, u8 *fw, unsigned int leftover,
 		kfree(patch);
 		return -EINVAL;
 	}
+	patch->size = *patch_size;
 
 	mc_hdr      = (struct microcode_header_amd *)(fw + SECTION_HDR_SIZE);
 	proc_id     = mc_hdr->processor_rev_id;
@@ -869,7 +870,7 @@ load_microcode_amd(bool save, u8 family, const u8 *data, size_t size)
 		return ret;
 
 	memset(amd_ucode_patch, 0, PATCH_MAX_SIZE);
-	memcpy(amd_ucode_patch, p->data, min_t(u32, ksize(p->data), PATCH_MAX_SIZE));
+	memcpy(amd_ucode_patch, p->data, min_t(u32, p->size, PATCH_MAX_SIZE));
 
 	return ret;
 }
-- 
2.34.1

