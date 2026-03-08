Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LpSAXtHrWkk0wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 10:55:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDF922F407
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 10:55:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F227110E0F9;
	Sun,  8 Mar 2026 09:55:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="HvJAOaXM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC9810E0EC;
 Sun,  8 Mar 2026 09:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=pX6nFaZQSPaXClUE5yxfEf/l17lRCF6vPh+70+1IPdA=; b=HvJAOaXMT59gprC770vHnagKq5
 QWTEaeqig7yBBbaIyURkfnSzSyW2SNa3zxyEOcwnmmj34bJf2aAnp1M9MlQPwPrSqz/hXJGKBvfF1
 99HySvmuds8pCBWXzBGE0YAJuGmxfwTQSJ2qVNnBXeX0QIBrKhTVqcJ8MGm9xXCqaCCqBj7ntW5Rd
 WCuGAPRa/htAgVFJw47tzTAzM1OMcvw33o1H6ir0d7GZq9o7joyuw4aEOEIkLzxPSk8VoMGnKqZMB
 KxA3JRYluHU0WOvPTArRxIFYBtW4hkE0G3Jyvht3jTszN3vsFzcXWSgSomQ26RL6AXQgx5T1yTKKm
 fvYunsUg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vzAqT-0000000AnoE-1yjl; Sun, 08 Mar 2026 09:54:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id F09CB300385; Sun, 08 Mar 2026 10:54:43 +0100 (CET)
Date: Sun, 8 Mar 2026 10:54:43 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Jason Baron <jbaron@akamai.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Steven Rostedt <rostedt@goodmis.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Alexandre Chartre <alexandre.chartre@oracle.com>,
 Juergen Gross <jgross@suse.com>, Andy Lutomirski <luto@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [RFC PATCH 1/7] jump_label: expose queueing API for batched
 static key updates
Message-ID: <20260308095443.GY606826@noisy.programming.kicks-ass.net>
References: <20260306015022.1940986-1-jim.cromie@gmail.com>
 <20260306015022.1940986-2-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306015022.1940986-2-jim.cromie@gmail.com>
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
X-Rspamd-Queue-Id: ABDF922F407
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[infradead.org:s=desiato.20200630];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_SPAM(0.00)[0.468];
	DBL_BLOCKED_OPENRESOLVER(0.00)[noisy.programming.kicks-ass.net:mid]
X-Rspamd-Action: no action


First strike for not Cc'ing me on all patches in the series :/

On Thu, Mar 05, 2026 at 06:50:04PM -0700, Jim Cromie wrote:
> Currently, `HAVE_JUMP_LABEL_BATCH` provides an architecture-level
> mechanism to defer instruction synchronization (`text_poke_sync()`)
> when patching a sequence of static keys. However, this deferred
> batching capability is not exposed as a public kernel API. Subsystems
> that need to toggle a large number of static keys (e.g.,
> dynamic_debug) currently suffer from O(N) overhead due to repeated
> machine-wide synchronizations (stop_machine).
> 
> This patch introduces a public queueing API to expose this deferred
> synchronization mechanism to the rest of the kernel. This allows
> multiple static keys to be enabled/disabled by queueing their
> architecture-level updates, before applying a single machine-wide
> synchronization barrier after all instructions are modified.
> 
> The new API consists of:
> - static_key_enable_queued(key)
> - static_key_disable_queued(key)
> - static_key_apply_queued() (the global barrier/flush)
> - static_branch_enable_queued(x) / static_branch_disable_queued(x) macros
> 
> NOTES:
> 
> The '_queued' API suffix was chosen to match the underlying
> 'arch_jump_label_transform_queue' and to avoid confusion with the
> existing rate-limited 'static_key_deferred' API.
> 
> Also unify the names under the 'static_key_*' prefix, renaming
> jump_label_apply_queued to static_key_apply_queued (with a
> compatibility macro) for consistency.
> 
> A pr_debug() is added to show the poked addresses, this exposed the
> semi-random ordering coming from dynamic-debug, despite its ordered
> descriptors.
> 
> So x86/kernel/alternatives gets new code to do an insert-sort, by
> memcpy & memmove after appending.  This sorting yields a dramatic IPI
> reduction; a following patch to dynamic-debug uses the API, and
> includes the numbers.
> 

Second strike for doing *WAAAY* to many things in one patch.

> +EXPORT_SYMBOL_GPL(static_key_enable_queued);
> +EXPORT_SYMBOL_GPL(static_key_disable_queued);
> +EXPORT_SYMBOL_GPL(static_key_apply_queued);

Third strike for exposing this to modules; flipping a ton of keys is
*not* something sensible.

> +	pr_debug("incoming addr=%px, current_qlen=%d\n",
> +		 addr, text_poke_array.nr_entries);
> +

And seriously, what?!
