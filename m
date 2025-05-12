Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1479AAB3713
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 14:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1FFC10E3EE;
	Mon, 12 May 2025 12:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="djUkDbye";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981FB10E3DB
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 12:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747053291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2DrqxmiOL3McpG/dCHwH1I+FCiwsh4PlvLiMszfDdMo=;
 b=djUkDbyeDBBo9lu9zGXyjmFhhdvkytJChR+kZAG+dopSGwWeSEvt6Qu6lGmX8m7IQR67g3
 OEdAMF46zMfXJkyGfD2r6WePSQbC+8UHS0RcG1XfXSfKKMSx1XATtf9B4R0smVsLN+aSIy
 R077AtUrZIrekL5u/XQLluN26NLsPfE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-25-z36RgOoOdzAKND7l-5Q-1; Mon, 12 May 2025 08:34:50 -0400
X-MC-Unique: 25-z36RgOoOdzAKND7l-5Q-1
X-Mimecast-MFC-AGG-ID: 25-z36RgOoOdzAKND7l-5Q_1747053289
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a1f7204d72so1680886f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 05:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747053289; x=1747658089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2DrqxmiOL3McpG/dCHwH1I+FCiwsh4PlvLiMszfDdMo=;
 b=XMW5/h0uFRGeitrtMYv0XzIeLDlVCNumKOMw3fxkO/fpiQ4GtzcSS00iuaX/ZMsT2q
 aH97CahVsqXtJFjuY9NudGgYS6R2LzROjAY5Slm5S9jPn9IDHXy1Xu+LqXRXY5ZrCAPY
 a+JGKoTDtjm0PgIyeXxxl3QuQ6P3mBdNVfoVFefmR3eSoGiWs3YROUxfjOPuruV1wfCK
 7A87YnczvYcFbgGwQRJuDX7hXU+/+BiOQ8dcxBZ2r1edS7U6p4sAwd3LDx17nXB0o0WD
 4+mHro3sHUjynE//NmBp1YNX3dVdLya/9Wf2tKr8I1aV/KOaau9LgO6uLZojJFlJEkZL
 5zQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfp/fbyiduuSvrI9s5nVn9qE3eBDXWuA7k3wS6UFixsOAS9OPXXAFnEaRQRIRCT9Xrd6pZVlWS2Ag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywu0zM6QpFo8gSh0FQmSapfIaBLLhprDvEPlCYMTPxnOSVPMu5G
 HcMf/ADatKWlyDVz2o8exSKtehkOTVIxVoOus6dkN+DeTJcIlFcupB1o+mLI97MwovtgkipZbuq
 UAvhTV6Iv+1IvQL3Qmk+5II7cP42VpXOmqgKGTArwH87tiFqSN2BMgzoer3b2mS3hKA==
X-Gm-Gg: ASbGncss6gm58RFnS2ywiRt6FCDao+u1oZg/SweBqsXLm5zT/aUBtnL6VfI8bQn0hjZ
 ocPNi1Nzv9pdFciJ8RXryKLWwgTTMSLmMTEbVDP3njJhSlQ3BoDyd7PafGD3oeKqx/Ykx0FqWsl
 15hpNi5sv9gk0CH86FfqcZs126Godb9eS4nrCMYRYgF6tSgXGCwzL0NgGvOBF9oATrxAadkA2hs
 zV6MsGv1Hcz3eOV/2JG0xaCm0gvcQnQZnrn0JwcM428AVqWVkybovaq66hIVZcyqFdZBIRAh+Ae
 cjhMRqi+jL9NeScQx+32KKvEZ9A3pXkfl8his2R7iE2zjG/qlMZ7eFQFReudI+1u+gIkOQLN
X-Received: by 2002:a05:6000:186e:b0:3a0:830d:ec58 with SMTP id
 ffacd0b85a97d-3a1f6446e78mr9882909f8f.28.1747053289236; 
 Mon, 12 May 2025 05:34:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0s3h7inHrYSooQ8NhTVln7D4g+9j4TOqzMH9jwIQneuWGNhcfmrI3NwJv0snFOVP2u3wuBw==
X-Received: by 2002:a05:6000:186e:b0:3a0:830d:ec58 with SMTP id
 ffacd0b85a97d-3a1f6446e78mr9882884f8f.28.1747053288844; 
 Mon, 12 May 2025 05:34:48 -0700 (PDT)
Received: from localhost
 (p200300d82f4a5800f1ae8e20d7f451b0.dip0.t-ipconnect.de.
 [2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a1f5a4c583sm12120673f8f.84.2025.05.12.05.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 05:34:48 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, x86@kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>
Subject: [PATCH v2 09/11] x86/mm/pat: inline memtype_match() into
 memtype_erase()
Date: Mon, 12 May 2025 14:34:22 +0200
Message-ID: <20250512123424.637989-10-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512123424.637989-1-david@redhat.com>
References: <20250512123424.637989-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OzljWrivJS_cgPGpnXQjLTy-CJwDdLCl8uAax3ywPYc_1747053289
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

Let's just have it in a single function. The resulting function is
certainly small enough and readable.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/mm/pat/memtype_interval.c | 33 +++++++++---------------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/arch/x86/mm/pat/memtype_interval.c b/arch/x86/mm/pat/memtype_interval.c
index 9d03f0dbc4715..e5844ed1311ed 100644
--- a/arch/x86/mm/pat/memtype_interval.c
+++ b/arch/x86/mm/pat/memtype_interval.c
@@ -49,21 +49,6 @@ INTERVAL_TREE_DEFINE(struct memtype, rb, u64, subtree_max_end,
 
 static struct rb_root_cached memtype_rbroot = RB_ROOT_CACHED;
 
-static struct memtype *memtype_match(u64 start, u64 end)
-{
-	struct memtype *entry_match;
-
-	entry_match = interval_iter_first(&memtype_rbroot, start, end-1);
-
-	while (entry_match != NULL && entry_match->start < end) {
-		if (entry_match->start == start && entry_match->end == end)
-			return entry_match;
-		entry_match = interval_iter_next(entry_match, start, end-1);
-	}
-
-	return NULL; /* Returns NULL if there is no match */
-}
-
 static int memtype_check_conflict(u64 start, u64 end,
 				  enum page_cache_mode reqtype,
 				  enum page_cache_mode *newtype)
@@ -119,14 +104,16 @@ int memtype_check_insert(struct memtype *entry_new, enum page_cache_mode *ret_ty
 
 struct memtype *memtype_erase(u64 start, u64 end)
 {
-	struct memtype *entry_old;
-
-	entry_old = memtype_match(start, end);
-	if (!entry_old)
-		return ERR_PTR(-EINVAL);
-
-	interval_remove(entry_old, &memtype_rbroot);
-	return entry_old;
+	struct memtype *entry = interval_iter_first(&memtype_rbroot, start, end - 1);
+
+	while (entry && entry->start < end) {
+		if (entry->start == start && entry->end == end) {
+			interval_remove(entry, &memtype_rbroot);
+			return entry;
+		}
+		entry = interval_iter_next(entry, start, end - 1);
+	}
+	return ERR_PTR(-EINVAL);
 }
 
 struct memtype *memtype_lookup(u64 addr)
-- 
2.49.0

