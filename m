Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 440FAB2ADC0
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 18:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CAE10E49C;
	Mon, 18 Aug 2025 16:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="AilMNkNq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C4F310E49C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 16:07:30 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-435de764e08so2724842b6e.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 09:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1755533249; x=1756138049; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=D6ek7I0iyYbZpN/v0UC5zzd0o0Ftoqgt1vFlNzowpm0=;
 b=AilMNkNq0aPn34oJfcEmiPA8Xao3JUirV/Xr6W3ZYemNL4hVojiWPYAw06sYiE2J09
 kMxgqzbSGFgLRHb2nNvbqbjqQ6rsyE+pEcYIFGFneGTP0SiJgnRROYh31wtPy78Wg/Lw
 alyC55S68f5Dm953s4WzIG7EZ4Lz7eR/uMVvOJr/1Du9v+G9nSZjWSCmwekC1XRTr0XL
 24f+aRqEK3LPelijGMh40Jv4k/JfhoKlEQ+JzGONbct/siAr9wMuFZXW6e+OsMsGN5zl
 ya8c7I4Sl1wR6GXreEzVMEF3xqg4QMU0SItuqWCyAxvgvJJGervyjQkQ3i/f6Ebxqey8
 Z7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755533249; x=1756138049;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D6ek7I0iyYbZpN/v0UC5zzd0o0Ftoqgt1vFlNzowpm0=;
 b=QQOkXWIXC8q+6/b5YGN3q3llvQIFydFHM18cISN9c+G08C79mjJpqD4Nn+epEs2/LU
 rxWt8BaEwK5V7Xpj8UaaCI3svJZRSAtf4fz9SuVV7Vn27m2wt6WucZhgeutgnPMN/875
 GoHPJj15K7yvORLTpYlvK4I3U0RWRnGFSKL55tC6h8NRi+ZqFUk9Ft0w40XTkMv4OX6L
 T+J7LzWsOjVOs0qvo2vypL4aPvHyyzVzCHqnQWVv3MoKJuZAkqaDiQPW4MirBZF8ou8x
 mJnqiKY8ml6cJtcSbyhq9qK1FVFpttaM1ilF8rd+rz4KSi92XVWoW3FrIO7HUjmHpB3m
 rb8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPxWHJdQafAZlYk6S6Nq5o5OFb427dLdi8RkQBLfFn+FuHQEYA9rNYxWTSIGiRVTOdEdSgTHIvSo0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWYUsZ2l45TcTcJ0vkcQ68A0UEMD0La8ImnXbNEbfQQ5MIxtO4
 lUqGb1LpSgUholroMIwTPmSQCu9P1FNXJO5DSkTabMrfsVOqBJzZyRBLYfSirz+GX+s=
X-Gm-Gg: ASbGncvUOoOxa62/llHt1jUy7i6sbdBiWW8zVuhEdinsmFGEoa5hDJX+vJPfCi788U2
 YDa9AZ437s2aogtgszQWkALPGLSBfig60CHWkrfNrvW7LswsM+u42I10H7OUEppsGcUVjPSv3Tt
 p5Zg7v4qmHIWup0KOOr9mafiX66TUbhtyPDPl3omMdFFg4DAN1CiA8V6pZvTP1z3TU/YBypeOoK
 TP8KqtE1keUXhiWN3jicHXSlrkESsEuL52cujhr7U46p962SihAIGzNuEpYwA/Mneoog9B5zAdp
 iuApdfPFb9Ifg7tj/ZpVTuaSzGGx5gMj4PkW/cIU4zmril8ZCltPgiairneIne01QT2u+Njj
X-Google-Smtp-Source: AGHT+IHkRfCegHArKlwGfaPyx0kzz53A2FyhdpjpMnPcsXRnYC7i/30cf6RRe0zz3Qa6ICjSFo5brQ==
X-Received: by 2002:a05:6808:3a07:b0:435:8506:2263 with SMTP id
 5614622812f47-435ec487ee3mr6478173b6e.24.1755533249123; 
 Mon, 18 Aug 2025 09:07:29 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-435ed1b10bfsm1783361b6e.18.2025.08.18.09.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 09:07:27 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1uo2OM-00000004Orw-2igd;
 Mon, 18 Aug 2025 13:07:26 -0300
Date: Mon, 18 Aug 2025 13:07:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [RFC PATCH 1/6] mm/mmu_notifier: Allow multiple struct
 mmu_interval_notifier passes
Message-ID: <20250818160726.GH599331@ziepe.ca>
References: <20250809135137.259427-1-thomas.hellstrom@linux.intel.com>
 <20250809135137.259427-2-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250809135137.259427-2-thomas.hellstrom@linux.intel.com>
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

On Sat, Aug 09, 2025 at 03:51:32PM +0200, Thomas Hellström wrote:
> GPU use-cases for mmu_interval_notifiers with hmm often involve
> starting a gpu operation and then waiting for it to complete.
> These operations are typically context preemption or TLB flushing.
> 
> With single-pass notifiers per GPU this doesn't scale in
> multi-gpu scenarios. In those scenarios we'd want to first start
> preemption- or TLB flushing on all GPUs and as a second pass wait
> for them to complete on all gpus.

The idea seems reasonable but I'm not sure I like the naming of
'multipass' or necessarily the complexity.

This is sort of a co-operative multithreading thing.

Do you really need a linked list here? At least justify the design
choices in the commit message..

> +struct mmu_interval_notifier_pass {
> +	struct list_head link;
> +	/**
> +	 * @pass: Driver callback for additionall pass.
> +	 * @additional_pass: Pointer to the mmu_interval_notifier_pass structure.
> +	 * @range: The mmu_notifier_range.
> +	 * @cur_seq: The current sequence set by the first pass.
> +	 *
> +	 * Return: Either a pointer to a valid mmu_interval_notifier_pass for
> +	 * another pass to be called, or %NULL if processing is complete for this
> +	 * notifier. There is no error reporting mechanism for additional passes.
> +	 */
> +	struct mmu_interval_notifier_pass *
> +	(*pass) (struct mmu_interval_notifier_pass *additional_pass,
> +		 const struct mmu_notifier_range *range,
> +		 unsigned long cur_seq);
> +};
> +
>  /**
>   * struct mmu_interval_notifier_ops
>   * @invalidate: Upon return the caller must stop using any SPTEs within this
> @@ -243,6 +269,10 @@ struct mmu_interval_notifier_ops {
>  	bool (*invalidate)(struct mmu_interval_notifier *interval_sub,
>  			   const struct mmu_notifier_range *range,
>  			   unsigned long cur_seq);
> +	bool (*invalidate_multipass)(struct mmu_interval_notifier *interval_sub,
> +				     const struct mmu_notifier_range *range,
> +				     unsigned long cur_seq,
> +				     struct mmu_interval_notifier_pass **pass);

Couldn't this just have a pass number counter and some return code to
indicate this notifier is done?

Or do you really need more than 2 passes? Start/finish make sense
too. Otherwise you may have issues overlapping the backgroundable
operations between different driver types?

> +static void mn_itree_additional_passes(struct list_head *additional_passes,
> +				       const struct mmu_notifier_range *range,
> +				       unsigned long cur_seq)
> +{
> +	struct mmu_interval_notifier_pass *p, *next;
> +
> +	while (!list_empty(additional_passes)) {
> +		list_for_each_entry_safe(p, next, additional_passes, link) {
> +			list_del_init(&p->link);
> +			p = p->pass(p, range, cur_seq);
> +			if (p)
> +				list_add_tail(&p->link, additional_passes);
> +		}
> +	}

Like this is very naive, if one driver has only 'prepare' and 'wait
for device ack' passes, then it will immediately stop being concurrent
while another device may be still working on its 3rd pass.

So either this should be more complicated to properly support
different numbers of passes per registration or we should just support
two passes and be done with it?

Jason
