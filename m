Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 349C76C0E24
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 11:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3077310E2C6;
	Mon, 20 Mar 2023 10:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A966110E2C6;
 Mon, 20 Mar 2023 10:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679306703; x=1710842703;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oWtMop5+wEmx0CPCEBHSK2pamNEkVG59BblteG6Oe6I=;
 b=A7knr/M5Zyd+a6IUqOj9SQGFhUUO+pStn0bK3ZDeK1vVtcrk1jocytmX
 u1w1A+vkC3v307R4fM0vWo+MnLxeNASHZwoCjsUQPy7lfl6JOyMSVtDmr
 CmM4vYoZpp8VH7EsgF0ymtqknJpx69Kgnj5O3j8Tzky24s3+Meuu56CIQ
 KphHfOTG57T8f2WtNUcODHI6Gnn5bWsne+TPSnrcPidYg+R8WqA/AoFvd
 u1M7ZfapN0CTrVBwZ3CUbgJVxecrn24tX2pYmta/R9n9a3+zwhQ1ulSUy
 6u/ZOv0vM4VFO/onZowQ1gLNF2Ntv7qYkby2uPDnx3uVrvLuUA//hK02O g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="319022331"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="319022331"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 03:04:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="855233399"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="855233399"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.251.222.93])
 ([10.251.222.93])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 03:04:47 -0700
Message-ID: <7c855cce-be3d-c50f-a093-3ebccca17854@linux.intel.com>
Date: Mon, 20 Mar 2023 11:04:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 1/2] drm/i915: Add a function to mmap framebuffer obj
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20230316172220.16068-1-nirmoy.das@intel.com>
 <ZBeq/bqrpeuUMkp0@ashyti-mobl2.lan>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <ZBeq/bqrpeuUMkp0@ashyti-mobl2.lan>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/20/2023 1:38 AM, Andi Shyti wrote:
> Hi Nirmoy,
>
> On Thu, Mar 16, 2023 at 06:22:19PM +0100, Nirmoy Das wrote:
>> Implement i915_gem_fb_mmap() to enable fb_ops.fb_mmap()
>> callback for i915's framebuffer objects.
>>
>> v2: add a comment why i915_gem_object_get() needed(Andi).
>>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: Imre Deak <imre.deak@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> I think you can fire the PATCH here instead of the RFC. Looks
> good to me.
>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>


Thanks, I will do that.

Nirmoy

>
> Andi
