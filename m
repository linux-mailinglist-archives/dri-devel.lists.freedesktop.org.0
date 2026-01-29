Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFxbEZd0fGkmNAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 10:06:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1B0B8BA8
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 10:06:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21A910E974;
	Fri, 30 Jan 2026 09:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="vhwc1iYu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Thu, 29 Jan 2026 13:54:52 UTC
Received: from out30-110.freemail.mail.aliyun.com
 (out30-110.freemail.mail.aliyun.com [115.124.30.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8864310E30A;
 Thu, 29 Jan 2026 13:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1769694889; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 bh=L2m3MJadzQ92FjJDvV6pbq0LnAGzP5Bc/Tadk16iraY=;
 b=vhwc1iYu2V0ciXuhdZpI/KSPiMGsCja/3InqBRRH9LzbnDxTwfyV0ee1Kx3m8QBJeijEpUO7Qru8VCqvokD4KADEoYsMFX4NVxCPD3fGk+tBbk5ZB1EURnXorW4HyYTj5lzk7Ak+oExLGNLNgIaNiYXcAf2Iibn5WGZj7IWHYTs=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com
 fp:SMTPD_---0Wy7d5tv_1769694581 cluster:ay36) by smtp.aliyun-inc.com;
 Thu, 29 Jan 2026 21:49:42 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Jordan Niethe <jniethe@nvidia.com>
Cc: linux-mm@kvack.org,  balbirs@nvidia.com,  matthew.brost@intel.com,
 akpm@linux-foundation.org,  linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  david@redhat.com,  ziy@nvidia.com,
 apopple@nvidia.com,  lorenzo.stoakes@oracle.com,  lyude@redhat.com,
 dakr@kernel.org,  airlied@gmail.com,  simona@ffwll.ch,
 rcampbell@nvidia.com,  mpenttil@redhat.com,  jgg@nvidia.com,
 willy@infradead.org,  linuxppc-dev@lists.ozlabs.org,
 intel-xe@lists.freedesktop.org,  jgg@ziepe.ca,  Felix.Kuehling@amd.com,
 jhubbard@nvidia.com
Subject: Re: [PATCH v3 00/13] Remove device private pages from physical
 address space
In-Reply-To: <20260123062309.23090-1-jniethe@nvidia.com> (Jordan Niethe's
 message of "Fri, 23 Jan 2026 17:22:56 +1100")
References: <20260123062309.23090-1-jniethe@nvidia.com>
Date: Thu, 29 Jan 2026 21:49:40 +0800
Message-ID: <875x8kbkaz.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
X-Mailman-Approved-At: Fri, 30 Jan 2026 09:06:10 +0000
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
X-Spamd-Result: default: False [-7.81 / 15.00];
	WHITELIST_DMARC(-7.00)[alibaba.com:D:+];
	DMARC_POLICY_ALLOW(-0.50)[linux.alibaba.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linux.alibaba.com:s=default];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linux.alibaba.com:+];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ying.huang@linux.alibaba.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kvack.org,nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: AE1B0B8BA8
X-Rspamd-Action: no action

Hi, Jordan,

Jordan Niethe <jniethe@nvidia.com> writes:

> Introduction
> ------------
>
> The existing design of device private memory imposes limitations which
> render it non functional for certain systems and configurations - this
> series removes those limitations. These issues are:
>
>   1) Limited available physical address space 
>   2) Conflicts with arch64 mm implementation
>
> Limited available address space
> -------------------------------
>
> Device private memory is implemented by first reserving a region of the
> physical address space. This is a problem. The physical address space is
> not a resource that is directly under the kernel's control. Availability
> of suitable physical address space is constrained by the underlying
> hardware and firmware and may not always be available. 
>
> Device private memory assumes that it will be able to reserve a device
> memory sized chunk of physical address space. However, there is nothing
> guaranteeing that this will succeed, and there a number of factors that
> increase the likelihood of failure. We need to consider what else may
> exist in the physical address space. It is observed that certain VM
> configurations place very large PCI windows immediately after RAM. Large
> enough that there is no physical address space available at all for
> device private memory. This is more likely to occur on 43 bit physical
> width systems which have less physical address space.
>
> The fundamental issue is the physical address space is not a resource
> the kernel can rely on being to allocate from at will.  
>
> aarch64 issues
> --------------
>
> The current device private memory implementation has further issues on
> aarch64. On aarch64, vmemmap is sized to cover the ram only. Adding
> device private pages to the linear map then means that for device
> private page, pfn_to_page() will read beyond the end of vmemmap region
> leading to potential memory corruption. This means that device private
> memory does not work reliably on aarch64 [0].  
>
> New implementation
> ------------------
>
> This series changes device private memory so that it does not require
> allocation of physical address space and these problems are avoided.
> Instead of using the physical address space, we introduce a "device
> private address space" and allocate from there.
>
> A consequence of placing the device private pages outside of the
> physical address space is that they no longer have a PFN. However, it is
> still necessary to be able to look up a corresponding device private
> page from a device private PTE entry, which means that we still require
> some way to index into this device private address space. Instead of a
> PFN, device private pages use an offset into this device private address
> space to look up device private struct pages.
>
> The problem that then needs to be addressed is how to avoid confusing
> these device private offsets with PFNs. It is the limited usage
> of the device private pages themselves which make this possible. A
> device private page is only used for userspace mappings, we do not need
> to be concerned with them being used within the mm more broadly. This
> means that the only way that the core kernel looks up these pages is via
> the page table, where their PTE already indicates if they refer to a
> device private page via their swap type, e.g.  SWP_DEVICE_WRITE. We can
> use this information to determine if the PTE contains a PFN which should
> be looked up in the page map, or a device private offset which should be
> looked up elsewhere.
>
> This applies when we are creating PTE entries for device private pages -
> because they have their own type there are already must be handled
> separately, so it is a small step to convert them to a device private
> PFN now too.
>
> The first part of the series updates callers where device private
> offsets might now be encountered to track this extra state.
>
> The last patch contains the bulk of the work where we change how we
> convert between device private pages to device private offsets and then
> use a new interface for allocating device private pages without the need
> for reserving physical address space.
>
> By removing the device private pages from the physical address space,
> this series also opens up the possibility to moving away from tracking
> device private memory using struct pages in the future. This is
> desirable as on systems with large amounts of memory these device
> private struct pages use a signifiant amount of memory and take a
> significant amount of time to initialize.

Now device private pages are quite different from other pages, even in a
separate address pace.  IMHO, it may be better to make that as explicit
as possible.  For example, is it a good idea to put them in its own
zone, like ZONE_DEVICE_PRIVATE?  It appears not natural to put pages
from different address spaces into one zone.  And, this may make them
easier to be distinguished from other pages.

[snip]

---
Best Regards,
Huang, Ying
