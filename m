Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F32BB3F986D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 13:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B6926E923;
	Fri, 27 Aug 2021 11:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455C06E923;
 Fri, 27 Aug 2021 11:26:50 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9FC7C1FEEF;
 Fri, 27 Aug 2021 11:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630063608; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=osw1/L3jC/bJi7Ne7bqRTQrD2wzLGX9q4SiZmi3c+5Q=;
 b=Oa5xd/Zm/qU2C1OGCyxqqfHFsWnr34ncOzeFSpN7OAEcyh/oBDc25De5Ypu97mk92Fc0l5
 WfKmOa7dYLRYIZcYtnPhoEpaBPGwEnyMECO4HLqPo3i9W5b6PgbW9SBvsap3cevHLoRH1S
 jI8R3lkYIFOL81JF5BIkcCoNehS8f/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630063608;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=osw1/L3jC/bJi7Ne7bqRTQrD2wzLGX9q4SiZmi3c+5Q=;
 b=FzDxaGDhy6qR/uZBhWz+4OmgNkcW1LFyB3SdMaSBkkoTAxuFt+y/OHOgFdQl5mJ/+3AY5j
 7vgGLDCeGDUJFmCA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 770A213892;
 Fri, 27 Aug 2021 11:26:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id B3tiHPjLKGEqRAAAGKfGzw
 (envelope-from <vbabka@suse.cz>); Fri, 27 Aug 2021 11:26:48 +0000
Message-ID: <6a2513ac-1ea1-ba54-9d57-487504c6c86d@suse.cz>
Date: Fri, 27 Aug 2021 13:26:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.2
Subject: Re: [PATCH v1 02/14] mm: remove extra ZONE_DEVICE struct page refcount
Content-Language: en-US
To: Ralph Campbell <rcampbell@nvidia.com>, Alex Sierra <alex.sierra@amd.com>, 
 akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 hch@lst.de, jgg@nvidia.com, jglisse@redhat.com
References: <20210825034828.12927-1-alex.sierra@amd.com>
 <20210825034828.12927-3-alex.sierra@amd.com>
 <dbd0f54a-ad6c-97a2-17d7-826247424c97@suse.cz>
 <505e4fe4-241a-8205-d2ef-f603e9cc46c6@nvidia.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <505e4fe4-241a-8205-d2ef-f603e9cc46c6@nvidia.com>
Content-Type: text/plain; charset=UTF-8
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

On 8/25/21 19:49, Ralph Campbell wrote:
> 
> On 8/25/21 4:15 AM, Vlastimil Babka wrote:
>> On 8/25/21 05:48, Alex Sierra wrote:
>>> From: Ralph Campbell <rcampbell@nvidia.com>
>>>
>>> ZONE_DEVICE struct pages have an extra reference count that complicates the
>>> code for put_page() and several places in the kernel that need to check the
>>> reference count to see that a page is not being used (gup, compaction,
>>> migration, etc.). Clean up the code so the reference count doesn't need to
>>> be treated specially for ZONE_DEVICE.
>> That's certainly welcome. I just wonder what was the reason to use 1 in the
>> first place and why it's no longer necessary?
> 
> I'm sure this is a long story that I don't know most of the history.
> I'm guessing that ZONE_DEVICE started out with a reference count of
> one since that is what most "normal" struct page pages start with.
> Then put_page() is used to free newly initialized struct pages to the
> slab/slob/slub page allocator.
> This made it easy to call get_page()/put_page() on ZONE_DEVICE pages
> since get_page() asserts that the caller has a reference.
> However, most drivers that create ZONE_DEVICE struct pages just insert
> a PTE into the user page tables and don't increment/decrement the
> reference count. MEMORY_DEVICE_FS_DAX used the >1 to 1 reference count
> transition to signal that a page was idle so that made put_page() a
> bit more complex. Then MEMORY_DEVICE_PRIVATE pages were added and this
> special casing of what "idle" meant got more complicated and more parts
> of mm had to check for is_device_private_page().
> My goal was to make ZONE_DEVICE struct pages reference counts be zero
> based and allocated/freed similar to the page allocator so that more
> of the mm code could be used, like THP ZONE_DEVICE pages, without special
> casing ZONE_DEVICE.

Thanks for the explanation. I was afraid there was something more fundamental
that required to catch the 2->1 refcount transition, seems like it's not. I
agree with the simplification!

