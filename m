Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F048A9C24B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 10:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9DF10E8D9;
	Fri, 25 Apr 2025 08:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Yq49QPNm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0916310E8D9;
 Fri, 25 Apr 2025 08:54:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 501615C64A0;
 Fri, 25 Apr 2025 08:52:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 993C5C4CEE4;
 Fri, 25 Apr 2025 08:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745571284;
 bh=byos0KBTq/TSuKpnONmQSZ/S7MqfhwZ6bkrEWjklef8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yq49QPNm8JISyJIWA2gTjzx9WngHH+jHBnH+w++QZ4pLMPSVcKMh0Ut10d2/xzj7u
 DHBPjAgGLWsLqEba9tvqZ60cDvalmVmpUC0shPA/dfsmSMelBP/17e4an3ddQJxLZJ
 9PVdU9hqvVyqjF91HUSMPadBgv/Yy/GhiJNOEpJpM3Mg6f52UlfpguAqQzY1o/b7FV
 yESvey9PKaic4QrnwGUnY/tD+pTwnEQluFLVZqjr3akxgz2J33cQ+0+zVzRf3kNL6S
 G6eKTst6v2EoKA75j2SpeC2gRocKxR7Ua0Um4vA9GT+1140PqAUvt/5qTml+9HmhFO
 Rt5+CrLgQldkA==
Date: Fri, 25 Apr 2025 10:54:35 +0200
From: Ingo Molnar <mingo@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1 00/11] mm: rewrite pfnmap tracking and remove VM_PAT
Message-ID: <aAtNy6VjUvOrOC7r@gmail.com>
References: <20250425081715.1341199-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425081715.1341199-1-david@redhat.com>
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


* David Hildenbrand <david@redhat.com> wrote:

> On top of mm-unstable.
> 
> VM_PAT annoyed me too much and wasted too much of my time, let's clean
> PAT handling up and remove VM_PAT.
> 
> This should sort out various issues with VM_PAT we discovered recently,
> and will hopefully make the whole code more stable and easier to maintain.
> 
> In essence: we stop letting PAT mode mess with VMAs and instead lift
> what to track/untrack to the MM core. We remember per VMA which pfn range
> we tracked in a new struct we attach to a VMA (we have space without
> exceeding 192 bytes), use a kref to share it among VMAs during
> split/mremap/fork, and automatically untrack once the kref drops to 0.

Yay!

The extra pointer in vm_area_struct is a small price to pay IMHO.

> This implies that we'll keep tracking a full pfn range even after partially
> unmapping it, until fully unmapping it; but as that case was mostly broken
> before, this at least makes it work in a way that is least intrusive to
> VMA handling.
> 
> Shrinking with mremap() used to work in a hacky way, now we'll similarly
> keep the original pfn range tacked even after this form of partial unmap.
> Does anybody care about that? Unlikely. If we run into issues, we could
> likely handled that (adjust the tracking) when our kref drops to 1 while
> freeing a VMA. But it adds more complexity, so avoid that for now.
> 
> Briefly tested
> 
> There will be some clash with [1], but nothing that cannot be sorted out
> easily by moving the functions added to kernel/fork.c to wherever the vma
> bits will live.
> 
> Briefly tested with some basic /dev/mem test I crafted. I want to convert
> them to selftests, but that might or might not require a bit of
> more work (e.g., /dev/mem accessibility).

So for the x86 bits, once it passes review by the fine MM folks:

  Acked-by: Ingo Molnar <mingo@kernel.org>

And I suppose this rewrite will be carried in -mm?

Thanks,

	Ingo
