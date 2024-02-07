Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8056B84C5EA
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 09:06:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B915910EE22;
	Wed,  7 Feb 2024 08:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1E64110EF4D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 02:29:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B68BD1FB;
 Tue,  6 Feb 2024 18:30:08 -0800 (PST)
Received: from [10.162.40.23] (a077893.blr.arm.com [10.162.40.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 709133F762;
 Tue,  6 Feb 2024 18:29:24 -0800 (PST)
Message-ID: <8fff4340-368f-4e66-8839-1d54eea301f9@arm.com>
Date: Wed, 7 Feb 2024 07:59:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/cma: Drop cma_get_name()
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
References: <20240206041518.438801-1-anshuman.khandual@arm.com>
 <20240206142550.62bed7715692ddc0071da7d0@linux-foundation.org>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20240206142550.62bed7715692ddc0071da7d0@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 07 Feb 2024 08:06:20 +0000
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



On 2/7/24 03:55, Andrew Morton wrote:
> On Tue,  6 Feb 2024 09:45:18 +0530 Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> 
>> cma_get_name() just returns cma->name without any additional transformation
>> unlike other helpers such as cma_get_base() and cma_get_size(). This helper
>> is not worth the additional indirection, and can be dropped after replacing
>> directly with cma->name in the sole caller __add_cma_heap().
> 
> drivers/dma-buf/heaps/cma_heap.c: In function '__add_cma_heap':
> drivers/dma-buf/heaps/cma_heap.c:379:28: error: invalid use of undefined type 'struct cma'
>   379 |         exp_info.name = cma->name;
>       |                            ^~
> 
> Fixing this would require moving the `struct cma' definition into
> cma.h.  I don't think that's worthwhile.

Existing forward declaration e.g 'struct cma' inside include/linux/cma.h does
not seem to sufficient for cma->name to be de-referenced. Agreed - moving the
definition for 'struct cma' into include/linux/cma.h is not worthwhile. Hence
please drop this patch.
