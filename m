Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7594A85CE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 15:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615D310F735;
	Thu,  3 Feb 2022 14:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A1610F649;
 Thu,  3 Feb 2022 14:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643897374; x=1675433374;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=O2QtWXCQqDdcv3UrVaFtiIJjas6IRdbGnIVRJcUZgv0=;
 b=QdSlY8moAsr/RSt4RFosuCuqcRcrDCnR8was+xVTm/DkLi5OhE0tTLPq
 GxdJFgfplkPG6L9XnE0MG6fy3p16Ec6aRvlowFZCYI3ZL1UoJKgsU9QV1
 TPN24IEw13UphW6nFavf/Fk/vX6rig31DMVXu7/usHtikmbW04FhzhGIb
 mBdnwrQi7p5bUeeJi0vCXOB/Qu4UdXIBODTzxfKytC6T/GwXt+Z0cLwkx
 OKHCnbTZVGMekftb30stGrlbZGlcV6fKknQYWL8FdkUv6Dc3KsfTgdkO4
 IMCqpj/3gYL6CTwuFjClF/MZZlJDEb2x+hZfSVsvU2qrZJvVWQ807VzrS g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="334508893"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="334508893"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 06:09:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="627444377"
Received: from blovejoy-mobl.ger.corp.intel.com (HELO [10.252.16.183])
 ([10.252.16.183])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 06:09:33 -0800
Message-ID: <c7d5a7e2-615c-f7ec-2a35-41a45ef279a5@intel.com>
Date: Thu, 3 Feb 2022 14:09:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 19/20] drm/i915/lmem: don't treat small BAR as an error
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220126152155.3070602-1-matthew.auld@intel.com>
 <20220126152155.3070602-20-matthew.auld@intel.com>
 <a537f361-ae72-c62c-062f-4e96a9e48682@linux.intel.com>
 <addd2b3d-95b1-f824-c7dc-c7b05b4497ba@intel.com>
 <170468f918b202f540133e80032290424ff70936.camel@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <170468f918b202f540133e80032290424ff70936.camel@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/02/2022 13:56, Thomas Hellström wrote:
> On Thu, 2022-02-03 at 11:18 +0000, Matthew Auld wrote:
>> On 03/02/2022 09:48, Thomas Hellström wrote:
>>>
>>> On 1/26/22 16:21, Matthew Auld wrote:
>>>> Just pass along the probed io_size. The backend should be able to
>>>> utilize the entire range here, even if some of it is non-
>>>> mappable.
>>> Changes here LGTM.
>>>>
>>>> It does leave open with what to do with stolen local-memory.
>>>
>>> Are objects in stolen local required to be mappable?
>>
>>   From a quick look I don't really see such users on discrete, outside
>> of
>> maybe intelfb_create(), where I guess the initial fb might be located
>> in
>> stolen on DG1. But from DG2+ it looks like it will just be located in
>> normal LMEM. For that I was thinking we add something like
>> i915_gem_object_create_region_at(), and somehow wire that up to the
>> {fpfn, lpfn}...
> 
> So we could then skip STOLEN completely on DG2+? Could we then also do
> the same on DG1, at least assuming that creating and pinning an object
> for that initial fb would be done before any other pinning into LMEM?

It looks like fbc is the main user on discrete, AFAICT, but that doesn't 
seem to use the gem object interface, and instead just plugs into the 
underlying drm_mm directly. So AFAIK we still want stolen on DG2/DG1 for 
that.

> 
> /Thomas
> 
> 
