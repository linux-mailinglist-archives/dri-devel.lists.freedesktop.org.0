Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C58BEC910EC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 08:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE45210E755;
	Fri, 28 Nov 2025 07:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U1hC56Z8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58D410E00C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 07:41:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7430440BFD;
 Fri, 28 Nov 2025 07:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D189C4CEF1;
 Fri, 28 Nov 2025 07:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764315660;
 bh=Cvm8VHYmiklHkHLbjGWk9H4wF4lDIswUe+zfGMLAC5w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=U1hC56Z8WBw8QH9tGIQdeGelW13iXtcQtuL4XpwBwmjePCPQhrTCZIVKhN2ciLq3r
 f8GZLBRJBtNo9UGCkcA8iqQXFe6o+v18dbZ8bqh0r0TPSpAq8qLjsLbBnDr2KsXr31
 YL3TpqC9WksHalFF8G4sFNkk8LDWGWifJtIpBKqi1fmicyoUSxAC71X+F90J9EGvEE
 rQoLXnL03j4L93SDlDU414+zNo5p1iNk3ifG32eTPkjKI2FMdsCvaUkxpIsI/tREV6
 BIQ1ZnxT8LVOdT9VUVAdbMLjuXGmeaeLNq9vzUZDexsGe4zSSZqKWjzq+iSBLXxkD9
 r2Kg1RkU7ZkFA==
Message-ID: <301376ee-3439-4d3e-a2c9-8604e7bf49fb@kernel.org>
Date: Fri, 28 Nov 2025 08:40:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/6] Remove device private pages from physical address
 space
To: Jordan Niethe <jniethe@nvidia.com>, linux-mm@kvack.org
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ziy@nvidia.com, apopple@nvidia.com, lorenzo.stoakes@oracle.com,
 lyude@redhat.com, dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 rcampbell@nvidia.com, mpenttil@redhat.com, jgg@nvidia.com,
 willy@infradead.org
References: <20251128044146.80050-1-jniethe@nvidia.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251128044146.80050-1-jniethe@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 11/28/25 05:41, Jordan Niethe wrote:
> Today, when creating these device private struct pages, the first step
> is to use request_free_mem_region() to get a range of physical address
> space large enough to represent the devices memory. This allocated
> physical address range is then remapped as device private memory using
> memremap_pages.

Just a note that as we are finishing the old release and are about to 
start the merge window (+ there is Thanksgiving), expect few replies to 
non-urgent stuff in the next weeks.

Having that said, the proposal is interesting. I recall that Alistair 
and Jason recently discussed removing the need of dealing with PFNs
completely for device-private.

Is that the result of these discussions?

-- 
Cheers

David
