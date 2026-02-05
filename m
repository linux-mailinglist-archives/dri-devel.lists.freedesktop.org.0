Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BqMKulohGlK2wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:54:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D92F10F5
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:54:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6BE10E864;
	Thu,  5 Feb 2026 09:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ru9/v17a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D78010E864
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 09:54:46 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-34ab8e0df53so596518a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 01:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770285286; x=1770890086; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9xBIY0mav+3IAaN2sDOZsKW4O0cnUlRHLSnJJ3/BuhM=;
 b=Ru9/v17agCEA3pU1+skPhXOVBFXwnLuz9chWf/tp2KcVXQ6NO/MIePgMcxAvcFF09k
 0S0zjshciA2ETjE2BG/mEFNDBooiP+7KoOnxQpRQHeIyVJbr+vVG9DE42yleepcsE24l
 r49gZjzgM9+wueQku/dOg+mtPe8aIA9b8M8zwnws2jMhSzld/96VxQUazriOuyEHZ6lI
 yHqsqSUooAFXLAJMveLisvA+3PSeGU+aIbUoQShz9zUVZMes6mWnplVN4gttteprJ7Js
 NU+FXmds1GuMHxKC3QRXuQZZRe7zv4dzFGPp3bmrAc0Ufa81h3dKlikrwlviD6Kveilo
 uMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770285286; x=1770890086;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9xBIY0mav+3IAaN2sDOZsKW4O0cnUlRHLSnJJ3/BuhM=;
 b=FxCisXDnoIFXfHFYOHzah33CdwU8G9gHaEFpLthXsEVOKuF5sd7WXzRRoKGAy4y878
 6tYUzcbsq22WtlCq19P23vP8WwdiPbLbDitJ0gzDxXx3UZRs16HaKAGrmagdeIjjqrqK
 g8741dwz7nzRPo4PefkFKkvCcHR1gG/Uv9oB1siUfQNHqacXOfuKHGFLtqfWtqKXp3wB
 U3Nf7uovijhA75FzUsFT37Kf5H/wAxjEf/Wv8cL3VkxhhUbNo0OnqblsOXuUY6LDOjri
 m7IQK3e7TIukHa5bTBg/av8ztBE+AVBMPdhmhYOOrgMP1vcg0MJer29AoSTRv7wgnksX
 uyaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVynCLVilasyoN4oT6fnqtnGdXGbqaCtz12yeKyyDxLf3/0fZ76w+T8VKXKQXo9+Uzr/ATvP95H33k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrHT5a3/HDyYfjSy0Oi8UIEelqjxU/gM0R8errDIecj3rI8fNy
 CHj1xDxQ3O0SULLYr1bOrifdneg0ucOcIsUX+xAOuDRnzC9AwMowAizDbOTk5akjaug=
X-Gm-Gg: AZuq6aJYF0Lp1MBZhMYg/wfza1i/TbfnIcvlaViVqcZvifTauv+ZkaoL66TRCt8FJy3
 8H/7DaZcS+3y6aM5321MwflgML3YKBSReDzZGg2swqHd3wg58EnXV+kbY8nUv5SgSK2p95RHQnA
 G49Ml9sDkGEevC2J2474AFN+LymoMNST9pnAgNVrD/FAvG25kDMax97tFIOKuQh+8QOptF9TL/X
 7cQpmrYsCrb7QkapUjbpIGJbP/+xKat0fF420rKxxE5oDp2PxNL5ujJKloZKZPW45Ol9soOMkL7
 3MVA23MQiVsFPH3cQ8Kx87crRonEg5+oD2ZZ7LBxK6XYSsnBLOJmPLh6Gb0ZVm7s907PaQ4NiKX
 ss0bWZ7kbMhS/BBXnSaGO6rHnZwhvzagEika69kK2sGMAmQBPDC1IM+4UkQ0NpTjsFLschPSy71
 qSv27Ie+eXRbs=
X-Received: by 2002:a17:90a:c110:b0:354:a05d:9dc2 with SMTP id
 98e67ed59e1d1-354a05da864mr1522955a91.9.1770285285886; 
 Thu, 05 Feb 2026 01:54:45 -0800 (PST)
Received: from localhost ([122.172.80.63]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-354894533dbsm2000361a91.7.2026.02.05.01.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 01:54:45 -0800 (PST)
Date: Thu, 5 Feb 2026 15:24:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, 
 Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, 
 Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Igor Korotin <igor.korotin.linux@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-block@vger.kernel.org, 
 linux-security-module@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
 Oliver Mangold <oliver.mangold@pm.me>
Subject: Re: [PATCH v14 2/9] rust: rename `AlwaysRefCounted` to `RefCounted`.
Message-ID: <xh3iuwlz4wapmgzojg4v3sen4oezfua4vsedskvrqhc7ryyclj@jggikwra6dmj>
References: <20260204-unique-ref-v14-0-17cb29ebacbb@kernel.org>
 <20260204-unique-ref-v14-2-17cb29ebacbb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204-unique-ref-v14-2-17cb29ebacbb@kernel.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[viresh.kumar@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[40];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:a.hindborg@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:paul@paul-moore.com,m:sergeh@kernel.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:igor.korotin.linux@gmail.com,m:daniel.almeida@collabora.com,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vireshk@kernel.org,m:nm@ti.com,m:sboyd@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:oliver.mangold@pm.me,m:boqunfeng@gmail.com,m:igorkorotinlinux@
 gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viresh.kumar@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,intel.com,paul-moore.com,ffwll.ch,zeniv.linux.org.uk,suse.cz,collabora.com,oracle.com,ti.com,vger.kernel.org,lists.freedesktop.org,kvack.org,pm.me];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 14D92F10F5
X-Rspamd-Action: no action

On 04-02-26, 12:56, Andreas Hindborg wrote:
> diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
> index a760fac287655..06fe2ca776a4f 100644
> --- a/rust/kernel/opp.rs
> +++ b/rust/kernel/opp.rs
> @@ -16,8 +16,8 @@
>      ffi::{c_char, c_ulong},
>      prelude::*,
>      str::CString,
> -    sync::aref::{ARef, AlwaysRefCounted},
> -    types::Opaque,
> +    sync::aref::RefCounted,
> +    types::{ARef, AlwaysRefCounted, Opaque},
>  };
>  
>  #[cfg(CONFIG_CPU_FREQ)]
> @@ -1041,7 +1041,7 @@ unsafe impl Send for OPP {}
>  unsafe impl Sync for OPP {}
>  
>  /// SAFETY: The type invariants guarantee that [`OPP`] is always refcounted.
> -unsafe impl AlwaysRefCounted for OPP {
> +unsafe impl RefCounted for OPP {
>      fn inc_ref(&self) {
>          // SAFETY: The existence of a shared reference means that the refcount is nonzero.
>          unsafe { bindings::dev_pm_opp_get(self.0.get()) };
> @@ -1053,6 +1053,10 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
>      }
>  }
>  
> +// SAFETY: We do not implement `Ownable`, thus it is okay to obtain an `ARef<OPP>` from an
> +// `&OPP`.
> +unsafe impl AlwaysRefCounted for OPP {}
> +
>  impl OPP {
>      /// Creates an owned reference to a [`OPP`] from a valid pointer.
>      ///

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
