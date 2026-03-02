Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKQwNGYdpmmeKQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 00:29:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 818B41E6A7B
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 00:29:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C571D10E5EC;
	Mon,  2 Mar 2026 23:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TSxh7FtX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0899410E5E0;
 Mon,  2 Mar 2026 23:29:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3E62141AB1;
 Mon,  2 Mar 2026 23:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67948C2BC86;
 Mon,  2 Mar 2026 23:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1772494178;
 bh=cGbDhS0SYNM7ywiKo18nxPHughICS0VYorf2j+DgiJI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TSxh7FtXeAjmq+kHAoxRq7blbJce7OjcAyo5efUABhyEIDg5ECsbidW5Mcj6tsYRQ
 DzsG6rRpbWkeoTG5vogARAaO0jUDloWcC8I+5NMkdmsuNVjw9kdp+VtHQVYC7rwOhD
 vT8qcareSz2ZYaJdXKgw++Ul/6kRr6+5kG6+y49U=
Date: Mon, 2 Mar 2026 15:29:34 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, "linux-mm @ kvack . org"
 <linux-mm@kvack.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn
 <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Rientjes
 <rientjes@google.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Alice Ryhl
 <aliceryhl@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio
 Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Arve =?ISO-8859-1?Q?Hj=F8nnev?=
 =?ISO-8859-1?Q?=E5g?= <arve@android.com>, Todd Kjos <tkjos@android.com>,
 Christian Brauner <brauner@kernel.org>, Carlos Llamas
 <cmllamas@google.com>, Ian Abbott <abbotti@mev.co.uk>, H Hartley Sweeten
 <hsweeten@visionengravers.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jason
 Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Dimitri
 Sivanich <dimitri.sivanich@hpe.com>, Arnd Bergmann <arnd@arndb.de>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim
 <namhyung@kernel.org>, Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Eric Dumazet <edumazet@google.com>, Neal
 Cardwell <ncardwell@google.com>, "David S. Miller" <davem@davemloft.net>,
 David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-sgx@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, bpf@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v1 00/16] mm: cleanups around unmapping / zapping
Message-Id: <20260302152934.eba1cfede1c9b8cebdf45b09@linux-foundation.org>
In-Reply-To: <20260227200848.114019-1-david@kernel.org>
References: <20260227200848.114019-1-david@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Queue-Id: 818B41E6A7B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[linux-foundation.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,oracle.com,kernel.org,google.com,suse.com,suse.de,linux.dev,infradead.org,linux.ibm.com,ellerman.id.au,redhat.com,alien8.de,linuxfoundation.org,android.com,mev.co.uk,visionengravers.com,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,ziepe.ca,hpe.com,arndb.de,iogearbox.net,arm.com,davemloft.net,lists.ozlabs.org,lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_GT_50(0.00)[73];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,linux-foundation.org:dkim,linux-foundation.org:mid]
X-Rspamd-Action: no action

On Fri, 27 Feb 2026 21:08:31 +0100 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> A bunch of cleanups around unmapping and zapping. Mostly simplifications,
> code movements, documentation and renaming of zapping functions.

Thanks, I added this (and the below) to mm.git

I suppressed the dded-to-mm emails to protect the innocent.

--- a/rust/kernel/mm/virt.rs~mm-memory-remove-zap_details-parameter-from-zap_page_range_single-fix
+++ a/rust/kernel/mm/virt.rs
@@ -123,9 +123,7 @@ impl VmaRef {
         // SAFETY: By the type invariants, the caller has read access to this VMA, which is
         // sufficient for this method call. This method has no requirements on the vma flags. The
         // address range is checked to be within the vma.
-        unsafe {
-            bindings::zap_page_range_single(self.as_ptr(), address, size)
-        };
+        unsafe { bindings::zap_page_range_single(self.as_ptr(), address, size) };
     }
 
     /// If the [`VM_MIXEDMAP`] flag is set, returns a [`VmaMixedMap`] to this VMA, otherwise
_

