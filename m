Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CO/ENAAimluFQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 16:44:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE841120EF
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 16:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BBA10E421;
	Mon,  9 Feb 2026 15:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id F299510E421
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 15:44:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40567339;
 Mon,  9 Feb 2026 07:44:05 -0800 (PST)
Received: from [10.57.52.189] (unknown [10.57.52.189])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FF653F740;
 Mon,  9 Feb 2026 07:44:09 -0800 (PST)
Message-ID: <d129d0cd-ac01-40e5-92b7-77518bf32b3b@arm.com>
Date: Mon, 9 Feb 2026 15:44:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] iommu/io-pgtable: Add support for Arm Mali v10+ GPUs
 page table format
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Karunika Choo <karunika.choo@arm.com>, Liviu Dudau <liviu@dudau.co.uk>
References: <20260209112542.194140-1-liviu.dudau@arm.com>
 <0af5b5f3-912a-4f16-a68b-032617576537@arm.com> <aYngwtq_GtBYGjOC@e142607>
 <ac5c3df0-1d94-4a1c-9eec-a359096cfce5@arm.com> <aYn7obNImaI72MhK@e142607>
 <20260209163534.45b0ec7a@fedora>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260209163534.45b0ec7a@fedora>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.51 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:liviu.dudau@arm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robin.clark@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:karunika.choo@arm.com,m:liviu@dudau.co.uk,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[steven.price@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[steven.price@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AAE841120EF
X-Rspamd-Action: no action

On 09/02/2026 15:35, Boris Brezillon wrote:
> On Mon, 9 Feb 2026 15:22:09 +0000
> Liviu Dudau <liviu.dudau@arm.com> wrote:
> 
>>>> Ultimately the role of this RFC is to start a discussion and to figure out a path
>>>> forward for CSF GPUs where we want now to tighen a bit the formats we support and
>>>> add PBHA and in the future we want to add support for v15+ page formats.  
>>>
>>> PBHA is definitely an area for discussion. AIUI there are out-of-tree
>>> patches floating about for CPU support, but it hasn't been upstreamed. I
>>> don't know if any serious attempt has been made to push it upstream, but
>>> it's tricky because the architecture basically just says "IMPLEMENTATION
>>> DEFINED" which means you are no longer coding to the architecture but a
>>> specific implementation - and there's remarkably little documentation
>>> about what PBHA is used for in practice.
>>>
>>> I haven't looked into the GPU situation with PBHA - again it would be
>>> good to have more details on how the bits would be set.  
>>
>> I have a patch series that adds support in Panthor to apply some PBHA bits defined
>> in the DT based on an ID also defined in the DT and passed along as a VM_BIND parameter
>> if you want to play with it. However I have no direct knowledge on which PBHA values
>> would make a difference on the supported platforms (RK3xxx for example).

So we need something better than a DT entry saying e.g. "ID 3 is bit
pattern 0100". We need something that describes the actual behaviour of
a PBHA value. Otherwise user space will end up needing to know the exact
hardware platform it's running on to know what ID values mean.

> I don't know if that's what it's going be used for, but one very
> specific use case I'd like to see this PBHA extension backed by is
> "read-zero/write-discard" behavior that's needed for sparse bindings.
> Unfortunately, I've not heard on any HW-support for that in older
> gens...

*This* is a good example of something useful that could be exposed. If
the DT can describe that the hardware supports a
"read-zero/write-discard" with a specific bit pattern, then we can
advertise that to user space and provide a flag for VM_BIND which gives
that behaviour. And user space can make good use of it.

But from what I've heard the implementations tend to have something more
like a hint-mechanism where it affects the behaviour of the caches but
not the functional effect. This makes it much harder to expose to user
space in a meaningful way because it's highly platform dependant what
"don't allocate in the system level cache" actually means in terms of
performance effects. But it's possible we could describe more of a usage
based flag - i.e. "PBHA bits good for a tiler heap".

Thanks,
Steve

