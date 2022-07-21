Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4995457CD9D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 16:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579AE8BFEE;
	Thu, 21 Jul 2022 14:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C65E8BFEE;
 Thu, 21 Jul 2022 14:28:25 +0000 (UTC)
Received: from [192.168.178.53] (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7EEF36601595;
 Thu, 21 Jul 2022 15:28:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658413703;
 bh=NHkoYICeT+Zot/1vHzjZx/BgKacK7AypSNdwHVkeekU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Q36mETRwkzpug/dRe7DjbpquzSqtuKAzg0X8d4IfVO/WJxh11F51wnP+aKZiucibz
 QXa3Rf7KkLM/SCOC/jfdNqPM5sIySfR3fuuQRNCPKQiSYLJI91RoW6/HQc6y3EG+99
 QrFR34U4gYgijIyDFT+gY37hS4nPJQNt06y7xSf1nlxbPmcJ0CTCEyrAuIvy1g39NS
 lFd9ZlthK0Ax09v/UyNmoVg+Q3DtT6sxk56YIO1TNLogaz62HAIfilzEGm/T9iuPdT
 2IoYCfEFDElkLmWQt6b3ZLaLWiTsUA+X2kbTZMUeP6kSuJPaWm5eNFFi/ahpOORss2
 D4snuZY5fWOFQ==
Message-ID: <8ba5a3c1-939d-d5e9-51a1-9458e75b0f34@collabora.com>
Date: Thu, 21 Jul 2022 15:28:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: susetting the remaining swioltb couplin in DRM
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Christoph Hellwig <hch@lst.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20220711082614.GA29487@lst.de> <YsyItfiuccW7iQln@intel.com>
 <20220712050055.GA4727@lst.de>
 <46938a7a-0b89-0bd3-d137-851a037b644f@linux.intel.com>
From: Robert Beckett <bob.beckett@collabora.com>
In-Reply-To: <46938a7a-0b89-0bd3-d137-851a037b644f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Thomas Hellstrom <thomas.hellstrom@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 18/07/2022 12:36, Tvrtko Ursulin wrote:
> 
> Hi,
> 
> On 12/07/2022 06:00, Christoph Hellwig wrote:
>> On Mon, Jul 11, 2022 at 04:31:49PM -0400, Rodrigo Vivi wrote:
>>> On Mon, Jul 11, 2022 at 10:26:14AM +0200, Christoph Hellwig wrote:
>>>> Hi i915 and nouveau maintainers,
>>>>
>>>> any chance I could get some help to remove the remaining direct
>>>> driver calls into swiotlb, namely swiotlb_max_segment and
>>>> is_swiotlb_active.  Either should not matter to a driver as they
>>>> should be written to the DMA API.
>>>
>>> Hi Christoph,
>>>
>>> while we take a look here, could you please share the reasons
>>> behind sunsetting this calls?
>>
>> Because they are a completely broken layering violation.  A driver has
>> absolutely no business knowing the dma-mapping violation.  The DMA
>> API reports what we think is all useful constraints (e.g.
>> dma_max_mapping_size()), and provides useful APIs to (e.g.
>> dma_alloc_noncoherent or dma_alloc_noncontiguous) to allocate pages
>> that can be mapped without bounce buffering and drivers should use
>> the proper API instead of poking into one particular implementation
>> and restrict it from changing.
>>
>> swiotlb_max_segment in particular returns a value that isn't actually
>> correct (a driver can't just use all of swiotlb) AND actually doesn't
>> work as is in various scenarious that are becoming more common,
>> most notably host with memory encryption schemes that always require
>> bounce buffering.
> 
> All these are either in the internal backend or in the old shmem 
> backend. I understand both are soon to be retired or deprecated. I think.
> 
> + Matt & Thomas, and Bob actually as well, as I think authorities in the 
> shmem, TTM and internal backend at the moment. Could you guys please 
> have look if and how the TTM backend needs to handle this and what is 
> the timeline of retirement if relevant?
> 
> Regards,
> 
> Tvrtko

So currently these are used directly in the internal backend and 
indirectly via i915_sg_segment_size() in shmem, ttm and userptr backends.

internal and userptr are being refactored currently (internal is ready 
but lacking review), but the refactoring would just make them use the 
ttm backend which still uses these.

It seems to me like a simple solution would be to just replace 
swiotlb_max_segment() calls with dma_max_mapping_size() as a drop in 
replacement. This follows the same logic as drm_prime_pages_to_sg().
