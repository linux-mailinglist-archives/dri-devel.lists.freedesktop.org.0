Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E1A9C0BE7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 17:44:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878D610E0E2;
	Thu,  7 Nov 2024 16:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7E16410E0E2
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 16:44:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF8FA497;
 Thu,  7 Nov 2024 08:45:15 -0800 (PST)
Received: from [10.57.89.183] (unknown [10.57.89.183])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 030C93F528;
 Thu,  7 Nov 2024 08:44:44 -0800 (PST)
Message-ID: <422f3c5a-4c69-413f-af2a-f016124d3c91@arm.com>
Date: Thu, 7 Nov 2024 16:44:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Be stricter about IO mapping flags
To: Jann Horn <jannh@google.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241105-panthor-flush-page-fixes-v1-1-829aaf37db93@google.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241105-panthor-flush-page-fixes-v1-1-829aaf37db93@google.com>
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

On 04/11/2024 23:17, Jann Horn wrote:
> The current panthor_device_mmap_io() implementation has two issues:
> 
> 1. For mapping DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET,
>    panthor_device_mmap_io() bails if VM_WRITE is set, but does not clear
>    VM_MAYWRITE. That means userspace can use mprotect() to make the mapping
>    writable later on. This is a classic Linux driver gotcha.
>    I don't think this actually has any impact in practice:
>    When the GPU is powered, writes to the FLUSH_ID seem to be ignored; and
>    when the GPU is not powered, the dummy_latest_flush page provided by the
>    driver is deliberately designed to not do any flushes, so the only thing
>    writing to the dummy_latest_flush could achieve would be to make *more*
>    flushes happen.
> 
> 2. panthor_device_mmap_io() does not block MAP_PRIVATE mappings (which are
>    mappings without the VM_SHARED flag).
>    MAP_PRIVATE in combination with VM_MAYWRITE indicates that the VMA has
>    copy-on-write semantics, which for VM_PFNMAP are semi-supported but
>    fairly cursed.
>    In particular, in such a mapping, the driver can only install PTEs
>    during mmap() by calling remap_pfn_range() (because remap_pfn_range()
>    wants to **store the physical address of the mapped physical memory into
>    the vm_pgoff of the VMA**); installing PTEs later on with a fault
>    handler (as panthor does) is not supported in private mappings, and so
>    if you try to fault in such a mapping, vmf_insert_pfn_prot() splats when
>    it hits a BUG() check.
> 
> Fix it by clearing the VM_MAYWRITE flag (userspace writing to the FLUSH_ID
> doesn't make sense) and requiring VM_SHARED (copy-on-write semantics for
> the FLUSH_ID don't make sense).
> 
> Reproducers for both scenarios are in the notes of my patch on the mailing
> list; I tested that these bugs exist on a Rock 5B machine.
> 
> Note that I only compile-tested the patch, I haven't tested it; I don't
> have a working kernel build setup for the test machine yet. Please test it
> before applying it.
> 
> Cc: stable@vger.kernel.org
> Fixes: 5fe909cae118 ("drm/panthor: Add the device logical block")
> Signed-off-by: Jann Horn <jannh@google.com>

Pushed to drm-misc-fixes.

Thanks,
Steve


