Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E59A9C0B6
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 10:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EB510E8C8;
	Fri, 25 Apr 2025 08:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bQ4LT7Aw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C69F10E8D9
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 08:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745569061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rqCDzyJE3N7q1dfRPTJIKewHsgjJcYj+B7llEZA1rCc=;
 b=bQ4LT7AwLAyp+GymBcgrzB1KEPSTOrTBjzh7//b8kM+1yZyoPtY+WszSunzZvU1IWlKQeT
 fvaU30jLkvdv/3JBRgqx5KEy9qBMA8XBXdKIg8XQ/CAKnjV/Xn1eH7ZRb1EWkL7fCXQGmL
 4whdAxWJEsmoKJzeGo/LVLeEIjTVtKA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-p0-UogfWNzOfQKyhNOzQNQ-1; Fri, 25 Apr 2025 04:17:40 -0400
X-MC-Unique: p0-UogfWNzOfQKyhNOzQNQ-1
X-Mimecast-MFC-AGG-ID: p0-UogfWNzOfQKyhNOzQNQ_1745569059
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43d733063cdso11797095e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 01:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745569059; x=1746173859;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rqCDzyJE3N7q1dfRPTJIKewHsgjJcYj+B7llEZA1rCc=;
 b=oHP3+KDPAmCMQQqGsYR3Y6moCwQ3cnFiH8hLM8SSPwb5eBt4+CMV2oE0KdUVF20RXw
 IN8FXH0F5GSeUJnMnZys5yLKtWwJnksYT6uPBku1kC1IFkq0vcA50/OFV+GgdmH5J3JC
 ZuPhVtgEGJlTfHtFrFh/p/JXJ1wGzCP5Ap3h7TJntY2T+go6AkLBoOw+RWQZfvnWWE0h
 CABGxKdMJ7ry4kaCY51UQlTWW9tOg8VswAa+7nYibKMBAm/UxVCa8UFX5T80Eve0AYxN
 1pD4Q+MO8JNd41lQrTP2L5ZZXYyLgWJubUn+hapoH27fMsrn9husuqrpQUZ4HC68JMYi
 ojhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+ejLEw6u2fRYSwx4mFS8oEf2x9gY2bew6WwwnXmWkNlb7jC/Bs3JdWNYpCziLKBJt1fCArsJstno=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5lCFWifFpPoYCuhl4+wwWtCUKpudz/Q2BFLTn0wMB7StpPsBq
 7u2kU7pFoD9BqjAfnIni0Cmliqg+JmK9jrzhUeg3YERqk8qTvcWS51sdI2bCPVOsG5VqOOUSib8
 7LZfWTQcXlUXMNomlJOvIQ8ly4F9565Q94Ww7Ls4ofycwVXz33lcQq8XgDq8PZNcKDQ==
X-Gm-Gg: ASbGnctd6fxV11GR3eJoxks1+SKs1NPpMFAxKbLrSYqIfOg6j5gkuKNa8a3yK8hfZbB
 mXYPIRFcVC0rY57OfD5fNzS+gskpsjChayftkM9ok2f4CrRgOqluP7xYsKBboOGbZ2pRdHeubA/
 STsDtccIQ23g5Ev8Q7BNlJ47nWR4rS6xdnJ9XkmPeDDFmJ0r/vTjGgcCHEJRQLHJkbtp3r+zXO4
 1Ax2gxq/nhb71zEwPXVAgLaru5Ux0aywFyFnAoJUlY7lnQouwJSsKpwSAK7WEDwXSu5Nkv7Tw8h
 SvF8DeAf6gw6dMhUmz3s8wZKK6mpMIcKnK+FOs5NSYxvcr6gA73epuluL2IYlMTGboa0FG4=
X-Received: by 2002:a05:6000:4026:b0:38d:badf:9df5 with SMTP id
 ffacd0b85a97d-3a074e1e7c1mr893875f8f.17.1745569059280; 
 Fri, 25 Apr 2025 01:17:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeMJVro3CtNN/nAt/kzydgqpqMLMz4QDAdVYj55uYz4S+yOKx9n2ojCFKF9ThYiE7nLuy7NA==
X-Received: by 2002:a05:6000:4026:b0:38d:badf:9df5 with SMTP id
 ffacd0b85a97d-3a074e1e7c1mr893849f8f.17.1745569058900; 
 Fri, 25 Apr 2025 01:17:38 -0700 (PDT)
Received: from localhost
 (p200300cbc70f69006c5680f80c146d2a.dip0.t-ipconnect.de.
 [2003:cb:c70f:6900:6c56:80f8:c14:6d2a])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4408d8d191bsm78695765e9.1.2025.04.25.01.17.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 01:17:38 -0700 (PDT)
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
Subject: [PATCH v1 09/11] x86/mm/pat: remove MEMTYPE_*_MATCH
Date: Fri, 25 Apr 2025 10:17:13 +0200
Message-ID: <20250425081715.1341199-10-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425081715.1341199-1-david@redhat.com>
References: <20250425081715.1341199-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GZACMvCqMJhJJ6fPtTkb_ueWIne6JSzyM6wBLYNPaSw_1745569059
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

The "memramp() shrinking" scenario no longer applies, so let's remove
that now-unnecessary handling.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/mm/pat/memtype_interval.c | 44 ++++--------------------------
 1 file changed, 6 insertions(+), 38 deletions(-)

diff --git a/arch/x86/mm/pat/memtype_interval.c b/arch/x86/mm/pat/memtype_interval.c
index 645613d59942a..9d03f0dbc4715 100644
--- a/arch/x86/mm/pat/memtype_interval.c
+++ b/arch/x86/mm/pat/memtype_interval.c
@@ -49,26 +49,15 @@ INTERVAL_TREE_DEFINE(struct memtype, rb, u64, subtree_max_end,
 
 static struct rb_root_cached memtype_rbroot = RB_ROOT_CACHED;
 
-enum {
-	MEMTYPE_EXACT_MATCH	= 0,
-	MEMTYPE_END_MATCH	= 1
-};
-
-static struct memtype *memtype_match(u64 start, u64 end, int match_type)
+static struct memtype *memtype_match(u64 start, u64 end)
 {
 	struct memtype *entry_match;
 
 	entry_match = interval_iter_first(&memtype_rbroot, start, end-1);
 
 	while (entry_match != NULL && entry_match->start < end) {
-		if ((match_type == MEMTYPE_EXACT_MATCH) &&
-		    (entry_match->start == start) && (entry_match->end == end))
-			return entry_match;
-
-		if ((match_type == MEMTYPE_END_MATCH) &&
-		    (entry_match->start < start) && (entry_match->end == end))
+		if (entry_match->start == start && entry_match->end == end)
 			return entry_match;
-
 		entry_match = interval_iter_next(entry_match, start, end-1);
 	}
 
@@ -132,32 +121,11 @@ struct memtype *memtype_erase(u64 start, u64 end)
 {
 	struct memtype *entry_old;
 
-	/*
-	 * Since the memtype_rbroot tree allows overlapping ranges,
-	 * memtype_erase() checks with EXACT_MATCH first, i.e. free
-	 * a whole node for the munmap case.  If no such entry is found,
-	 * it then checks with END_MATCH, i.e. shrink the size of a node
-	 * from the end for the mremap case.
-	 */
-	entry_old = memtype_match(start, end, MEMTYPE_EXACT_MATCH);
-	if (!entry_old) {
-		entry_old = memtype_match(start, end, MEMTYPE_END_MATCH);
-		if (!entry_old)
-			return ERR_PTR(-EINVAL);
-	}
-
-	if (entry_old->start == start) {
-		/* munmap: erase this node */
-		interval_remove(entry_old, &memtype_rbroot);
-	} else {
-		/* mremap: update the end value of this node */
-		interval_remove(entry_old, &memtype_rbroot);
-		entry_old->end = start;
-		interval_insert(entry_old, &memtype_rbroot);
-
-		return NULL;
-	}
+	entry_old = memtype_match(start, end);
+	if (!entry_old)
+		return ERR_PTR(-EINVAL);
 
+	interval_remove(entry_old, &memtype_rbroot);
 	return entry_old;
 }
 
-- 
2.49.0

