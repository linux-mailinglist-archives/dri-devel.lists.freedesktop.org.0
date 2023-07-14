Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F73753D3E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 16:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A74A10E89C;
	Fri, 14 Jul 2023 14:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1D110E8A1;
 Fri, 14 Jul 2023 14:26:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AADA51F747;
 Fri, 14 Jul 2023 14:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1689344804; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rbJwmhXfhN5rIPoLj6fIJpy/+DMnwxG+UHYLi25rZdQ=;
 b=2eZEKNybuxBZ5dM4elpTXk5fybRAWCqEWxv5TWQSsbZwocHXqr6P/pCn+HDpCp7VOHFySU
 wrN5RdAayt0lobndDZx78GkWfzBqXslCQdTLHDIT0+rhfSaqa1zkl5RfWg4pf19se7xDGz
 2877+IHCgDJe1hKZRpKwl3nJ14+KI4E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1689344804;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rbJwmhXfhN5rIPoLj6fIJpy/+DMnwxG+UHYLi25rZdQ=;
 b=cDg/jNJAsxU+WNbuvHmDt9VhdDeknW42QogvvhHtOg5owP1dFsCJop+teLMjTToesPOSkW
 QA4DQyFxXD8lQGCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7A75413A15;
 Fri, 14 Jul 2023 14:26:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2440HSRbsWRTHQAAMHmgww
 (envelope-from <vbabka@suse.cz>); Fri, 14 Jul 2023 14:26:44 +0000
Message-ID: <d11b6c3c-cbf8-a7dc-3cf9-e4e4dcf81fbc@suse.cz>
Date: Fri, 14 Jul 2023 16:26:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/5] drm/amdkfd: use vma_is_stack() and vma_is_heap()
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>,
 Christoph Hellwig <hch@infradead.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>
References: <20230712143831.120701-1-wangkefeng.wang@huawei.com>
 <20230712143831.120701-4-wangkefeng.wang@huawei.com>
 <ZK671bHU1QLYagj8@infradead.org>
 <83f11260-cd26-5b46-e9d4-1ca97565a1d0@amd.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <83f11260-cd26-5b46-e9d4-1ca97565a1d0@amd.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: selinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-perf-users@vger.kernel.org,
 linux-mm@kvack.org, amd-gfx@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/12/23 18:24, Felix Kuehling wrote:
> Allocations in the heap and stack tend to be small, with several 
> allocations sharing the same page. Sharing the same page for different 
> allocations with different access patterns leads to thrashing when we 
> migrate data back and forth on GPU and CPU access. To avoid this we 
> disable HMM migrations for head and stack VMAs.

Wonder how well does it really work in practice? AFAIK "heaps" (malloc())
today uses various arenas obtained by mmap() and not a single brk() managed
space anymore? And programs might be multithreaded, thus have multiple
stacks, while vma_is_stack() will recognize only the initial one...

Vlastimil

> Regards,
>    Felix
> 
> 
> Am 2023-07-12 um 10:42 schrieb Christoph Hellwig:
>> On Wed, Jul 12, 2023 at 10:38:29PM +0800, Kefeng Wang wrote:
>>> Use the helpers to simplify code.
>> Nothing against your addition of a helper, but a GPU driver really
>> should have no business even looking at this information..
>>
>>
> 

