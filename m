Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E08D5FB9C8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 19:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5196210E98B;
	Tue, 11 Oct 2022 17:38:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE4610E981;
 Tue, 11 Oct 2022 17:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665509883; x=1697045883;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MaU3Bu8hSTcFnGzBEkuJYq0eZM21aJ0gR0JTTUcRV6w=;
 b=PcngavylvnUqfbeLI6x1UOkLUcY9U80NYHyx24L2ifBCqf0D94oP5O8B
 a1sP/yPCDW5hA5jtmnnN85D6Y/eTDS6AD80oMWhuoW2ZSywTQ6WCF8NO/
 Ktdsk2m05fIaI+YxtBiFf8Hh/Fq0JjKZVybT4u49a8TQOWnGrwjuixZ17
 2Y3E1iUB2nZlLxyp7wYvOv9riPpFiIzoBXf1nSOezCIlqN7XQwstbPKgv
 c9O85Muc8PVP170S6TBZsI2nBtSjnWlmRFmvLwgO53qJ3IfCBye4Rrbfg
 oXgUfG555dqkbbdHayN7rYW04S9ylgavfYUyq7xipY4+j6EHFrJolSZZE A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="331064917"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="331064917"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 10:38:03 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="659622141"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="659622141"
Received: from korubohx-mobl.ger.corp.intel.com (HELO [10.252.10.79])
 ([10.252.10.79])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 10:37:59 -0700
Message-ID: <6c6a89ef-9056-4673-9f37-61eff94b2f26@intel.com>
Date: Tue, 11 Oct 2022 18:37:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.1
Subject: Re: [PATCH v3 05/17] drm/i915/vm_bind: Implement bind and unbind of
 object
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20221010065826.32037-1-niranjana.vishwanathapura@intel.com>
 <20221010065826.32037-6-niranjana.vishwanathapura@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20221010065826.32037-6-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, jason@jlekstrand.net, andi.shyti@linux.intel.com,
 daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/10/2022 07:58, Niranjana Vishwanathapura wrote:
> Add uapi and implement support for bind and unbind of an
> object at the specified GPU virtual addresses.
> 
> The vm_bind mode is not supported in legacy execbuf2 ioctl.
> It will be supported only in the newer execbuf3 ioctl.
> 
> v2: On older platforms ctx->vm is not set, check for it.
>      In vm_bind call, add vma to vm_bind_list.
>      Add more input validity checks.
>      Update some documentation.
> v3: In vm_bind call, add vma to vm_bound_list as user can
>      request a fence and pass to execbuf3 as input fence.
>      Remove short term pinning with PIN_VALIDATE flag.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
