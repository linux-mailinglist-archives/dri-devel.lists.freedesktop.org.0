Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF175AB370F
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 14:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A813A10E3EA;
	Mon, 12 May 2025 12:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HpxbKmxe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FCB10E3E7
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 12:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747053288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=damHjxLzdKBqIDkI5LPVSGeFU6dth6KBhucvp/6hc2Y=;
 b=HpxbKmxeSFOrHzJHCSbsenCFmp/qQxYP1BqOZVUD9ZhtPXgIKeLJ20pV5fk9CTxnWrXxOz
 OiVYGmsa3kHhcpQbWXT0FbYqChFLLVIaAZLfiXOBq3BmlUgYItRDbWeZswpP70X2oiFFnX
 qtBsACAw+rwRDpKNjNLmZ4aYU+fdbp0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-opxHZx-rNDKXpAtk39b6tg-1; Mon, 12 May 2025 08:34:46 -0400
X-MC-Unique: opxHZx-rNDKXpAtk39b6tg-1
X-Mimecast-MFC-AGG-ID: opxHZx-rNDKXpAtk39b6tg_1747053286
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a0b5d18cb7so1579016f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 05:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747053285; x=1747658085;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=damHjxLzdKBqIDkI5LPVSGeFU6dth6KBhucvp/6hc2Y=;
 b=tvVnSApIAbbmWYofKa/jAQ23y/8TmKE5OIygZSHN/GEE0S+s8ja93xLjrejxzXinXa
 4RrHfF6rMvkSl/7QUX1bZ8tOxqB/gbriaG5wyP3s/C/uSfFEYayWjjZkdToJ0f2SKanB
 QrPdziD6ArWYMoJhgQf5/QRxmobDdGN8+8tE8j+oXPrjmlfzupjJpliLcQ2GA1jhBu1C
 to3TOxkh3C0juKcYLPCgp//JVyfAi6DmbULU7GblzIxW2ApIa/nMrQBh3eu4qKsq3Bm/
 OTyKYxIEZf7oo2R2MyseT31WhbgkSK36uO7bpBeBmw1ADnW6oo5vw0P0A32QQRVIMSCH
 Z0Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlCgxKCyQ3+v02nQfzX7sMCNQmCzM+v2s5UBBi6BiMPVIhSHly8zolM2sPPhDTDcQ6AhfAPapnEXs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzy2GnztnITxMEymqUBjNcUuScQBmeuOWfDHdUoXSr/NVkI6r6l
 sNPdcKZDMPT9vwQ4dELflD2acpE2spdHNSByACl1X1XYHgyfBSuOwWiEzRvcSQ57kN7ECFAd/3C
 aOBNbG+8LzL344qvKi0EjWbWVIKfxqJ1GuWGyHhO6DINwXV1FzXNVIKBRvsnXPdHonQ==
X-Gm-Gg: ASbGncug332UVapqC9edEgUK5S/MfO9XN+vu6nZ/LQVWvLxrXQqamSSfTOUiB+m8jN1
 QX5mGr3oAtMsDJ9FG9sbilamgJHQO2i6fzY56/ZmfxwGJSqwLmEbsds063J/ieU2ch0o6bu2cJF
 hhWgVst1laD9EV/MmApMZJDFz0oRodXM1eP9D3Yy3gcRPUFH1q6E7zW61KnMr7g3E3CzbsFebkU
 1XAThqHLqHpHUbyo+l14hSDHwUdU8ExUG+k4cXJOHsEhdH4oSW+IddTylkSVqNxdhXVCbVFxdjX
 j1zs0DaD7FkClDmtbglGfqDsBBp8iW8wCN2f7vNAAohDZzQ7476WlvnIIi7aD9vZSA/N8iRa
X-Received: by 2002:a05:6000:2011:b0:3a0:b455:a1fd with SMTP id
 ffacd0b85a97d-3a1f643d7f2mr9690525f8f.32.1747053285101; 
 Mon, 12 May 2025 05:34:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnmU3EtVrQ/jxHU8AUaqqw41jpYBGCmzwmgCEh+gCBZD+u2TEH9U2eBlpYNMTeAuFBo11Jgg==
X-Received: by 2002:a05:6000:2011:b0:3a0:b455:a1fd with SMTP id
 ffacd0b85a97d-3a1f643d7f2mr9690506f8f.32.1747053284744; 
 Mon, 12 May 2025 05:34:44 -0700 (PDT)
Received: from localhost
 (p200300d82f4a5800f1ae8e20d7f451b0.dip0.t-ipconnect.de.
 [2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-442cd32f238sm164887305e9.11.2025.05.12.05.34.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 05:34:44 -0700 (PDT)
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
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>,
 Ingo Molnar <mingo@kernel.org>
Subject: [PATCH v2 07/11] x86/mm/pat: remove strict_prot parameter from
 reserve_pfn_range()
Date: Mon, 12 May 2025 14:34:20 +0200
Message-ID: <20250512123424.637989-8-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512123424.637989-1-david@redhat.com>
References: <20250512123424.637989-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uVvBqS5HMRIrcSNmKRkdXAnwvjPo8ieL68G_AAHZVsw_1747053286
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

Always set to 0, so let's remove it.

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/mm/pat/memtype.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index c88d1cbdc1de1..ccc55c00b4c8b 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -858,8 +858,7 @@ int memtype_kernel_map_sync(u64 base, unsigned long size,
  * Reserved non RAM regions only and after successful memtype_reserve,
  * this func also keeps identity mapping (if any) in sync with this new prot.
  */
-static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot,
-				int strict_prot)
+static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot)
 {
 	int is_ram = 0;
 	int ret;
@@ -895,8 +894,7 @@ static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot,
 		return ret;
 
 	if (pcm != want_pcm) {
-		if (strict_prot ||
-		    !is_new_memtype_allowed(paddr, size, want_pcm, pcm)) {
+		if (!is_new_memtype_allowed(paddr, size, want_pcm, pcm)) {
 			memtype_free(paddr, paddr + size);
 			pr_err("x86/PAT: %s:%d map pfn expected mapping type %s for [mem %#010Lx-%#010Lx], got %s\n",
 			       current->comm, current->pid,
@@ -906,10 +904,6 @@ static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot,
 			       cattr_name(pcm));
 			return -EINVAL;
 		}
-		/*
-		 * We allow returning different type than the one requested in
-		 * non strict case.
-		 */
 		pgprot_set_cachemode(vma_prot, pcm);
 	}
 
@@ -959,7 +953,7 @@ int pfnmap_track(unsigned long pfn, unsigned long size, pgprot_t *prot)
 {
 	const resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
 
-	return reserve_pfn_range(paddr, size, prot, 0);
+	return reserve_pfn_range(paddr, size, prot);
 }
 
 void pfnmap_untrack(unsigned long pfn, unsigned long size)
-- 
2.49.0

