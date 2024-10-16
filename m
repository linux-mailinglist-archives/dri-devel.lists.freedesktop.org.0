Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D629A0C37
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 16:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E30710E71B;
	Wed, 16 Oct 2024 14:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3D1F110E71B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 14:02:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56310FEC;
 Wed, 16 Oct 2024 07:02:34 -0700 (PDT)
Received: from [10.57.87.74] (unknown [10.57.87.74])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 29C0F3F71E;
 Wed, 16 Oct 2024 07:02:03 -0700 (PDT)
Message-ID: <abded30f-3333-49e5-aac2-8da6ac64903b@arm.com>
Date: Wed, 16 Oct 2024 15:02:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/14] drm/panthor: Add uAPI
To: Erik Faye-Lund <erik.faye-lund@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: Daniel Stone <daniels@collabora.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>, kernel@collabora.com,
 Chris Diamand <chris.diamand@foss.arm.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>
References: <20240229162230.2634044-1-boris.brezillon@collabora.com>
 <20240229162230.2634044-2-boris.brezillon@collabora.com>
 <64ff75ddede7623c16ed0272eef5e950ae34e7d5.camel@collabora.com>
 <1bd37b18455607b709529c8def963c4561e2ff1e.camel@collabora.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <1bd37b18455607b709529c8def963c4561e2ff1e.camel@collabora.com>
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

On 2024-10-16 2:50 pm, Erik Faye-Lund wrote:
> On Wed, 2024-10-16 at 15:16 +0200, Erik Faye-Lund wrote:
>> On Thu, 2024-02-29 at 17:22 +0100, Boris Brezillon wrote:
>>> +/**
>>> + * enum drm_panthor_sync_op_flags - Synchronization operation
>>> flags.
>>> + */
>>> +enum drm_panthor_sync_op_flags {
>>> +	/** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK: Synchronization
>>> handle type mask. */
>>> +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK = 0xff,
>>> +
>>> +	/** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ:
>>> Synchronization object type. */
>>> +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ = 0,
>>> +
>>> +	/**
>>> +	 * @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ:
>>> Timeline synchronization
>>> +	 * object type.
>>> +	 */
>>> +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ = 1,
>>> +
>>> +	/** @DRM_PANTHOR_SYNC_OP_WAIT: Wait operation. */
>>> +	DRM_PANTHOR_SYNC_OP_WAIT = 0 << 31,
>>> +
>>> +	/** @DRM_PANTHOR_SYNC_OP_SIGNAL: Signal operation. */
>>> +	DRM_PANTHOR_SYNC_OP_SIGNAL = (int)(1u << 31),
>>
>> Why do we cast to int here? 1u << 31 doesn't fit in a 32-bit signed
>> integer, so isn't this undefined behavior in C?
>>
> 
> Seems this was proposed here:
> https://lore.kernel.org/dri-devel/89be8f8f-7c4e-4efd-0b7b-c30bcfbf1d23@arm.com/
> 
> ...that kinda sounds like bad advice to me.
> 
> Also, it's been pointed out to me elsewhere that this isn't
> *technically speaking* undefined, it's "implementation defined". But as
> far as kernel interfaces goes, that's pretty much the same; we can't
> guarantee that the kernel and the user-space is using the same
> implementation.
> 
> Here's the quote from the C99 spec, section 6.3.1.3 "Signed and
> unsigned integers":
> 
> """
> Otherwise, the new type is signed and the value cannot be represented
> in it; either the result is implementation-defined or an
> implementation-defined signal is raised
> """"
> 
> I think a better approach be to use -1 << 31, which is well-defined.
> But the problem then becomes assigning it into
> drm_panthor_sync_op::flags in a well-defined way... Could we make the
> field signed? That seems a bit bad as well...

Is that a problem? Signed->unsigned conversion is always well-defined 
(6.3.1.3 again), since it doesn't depend on how the signed type 
represents negatives.

Robin.
