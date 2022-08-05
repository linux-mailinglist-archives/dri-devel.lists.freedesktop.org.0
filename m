Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E822B58A8DF
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 11:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22604B2712;
	Fri,  5 Aug 2022 09:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD37DB20C9;
 Fri,  5 Aug 2022 09:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659691593; x=1691227593;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tG8kUD3ji7GDYQSEFarrC17CSyndXtVIb31RNBiVtX4=;
 b=dvErYwbBiTy8WVtIUdE2Kbq300OF8nISVJcLFR89EKQvMlIkT4OigO9P
 /NbX+RDTGa3DJTqTjC8cDQALR27P+AnYylpYBVNk7SLg1W8Orb2+XZ4ak
 PvdrXf29t4I3bsBCOt2fqKExbth68dyenPHzw7At8JbLHtc7kJ+yFUz4C
 wQdgDDAI8n2hyWsgypUavn7Xj0mT52OqCvRRC5KbaN7q2mGOMARnQX2uR
 1kZHJ21Ayem00oHxvq6AribwMeFJL/QCiCY4kXGPiMLmKI7KviWvQul51
 +kpykvmK4efZyNtr2DZ6ARM4I6qFXL1kDyZrUZH5Ip8VkZ8qKPdWzLyOP Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10429"; a="291384807"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="291384807"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 02:24:31 -0700
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="554052121"
Received: from bfglenno-mobl.ger.corp.intel.com (HELO [10.213.238.183])
 ([10.213.238.183])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 02:24:27 -0700
Message-ID: <7156b3bd-69d7-de53-dd2b-96e82a8cf0f7@linux.intel.com>
Date: Fri, 5 Aug 2022 10:24:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 3/3] drm/i915/gt: document TLB cache invalidation
 functions
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>
References: <cover.1659598090.git.mchehab@kernel.org>
 <cc68d62a1979ea859b447b94413e100472331f57.1659598090.git.mchehab@kernel.org>
 <0698c5a5-3bf2-daa4-e10e-2715f9b0d080@infradead.org>
 <Yuzd9Ysc3BDQHuSW@alfio.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Yuzd9Ysc3BDQHuSW@alfio.lan>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris.p.wilson@intel.com>,
 linux-doc@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 05/08/2022 10:08, Andi Shyti wrote:
> Hi Randy,
> 
>>> +/**
>>> + * intel_gt_invalidate_tlb_full - do full TLB cache invalidation
>>> + * @gt: GT structure
>>
>> In multiple places (here and below) it would be nice to know what a
>> GT structure is. I looked thru multiple C and header files yesterday
>> and didn't find any comments about it.
>>
>> Just saying that @gt is a GT structure isn't very helpful, other
>> than making kernel-doc shut up.
> 
> the 'gt' belongs to the drivers/gpu/drm/i915/gt/ subsystem and
> it's widely used a throughout i915.
> 
> I think it's inappropriate to describe it just here. On the other
> hand I agree that a better documentation is required for the GT
> itself where other parts can point to.

Yeah agreed there is no point of copy pasting some explanation all over 
the place. Could we just do s/GT structure/struct intel_gt/, or "pointer 
to struct intel_gt to operate on", would that be good enough?

Regards,

Tvrtko
