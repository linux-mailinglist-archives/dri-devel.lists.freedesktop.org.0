Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D589060E648
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 19:17:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D3C10E3E5;
	Wed, 26 Oct 2022 17:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53AD910E3E5;
 Wed, 26 Oct 2022 17:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666804666; x=1698340666;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Q0oMqbVbj+c2QA7VPczp+ioHHMtRw7vkzl7K0sPjr4g=;
 b=fbdkgwq9BKLQ8jZZF5ct5oc+eMQJpV2e1rRuctb16lbccddqsH8/YhPG
 soDPG4Z+RYI1mKg3FCwwlxxv8RY0I7lePyjqoS7OooKG9XT7emeD0KLRO
 n+s8C1XGre+imX7zvyUfStYoh84yLV51Yd1yDrLCNCdEAQQauWKCH9AIo
 DqR+qq5XtDJZjcDu1OMDLpgVNZW+AuU2OsW7O6GU8Km3rcvRHagaEozBx
 qqeuQwLBq+FRWYpWHQi+zgrv7l9JS1nOVk+6j78xoV6JSIo9EGroz7GU0
 E0WUk9vE9V3qo+VB/ejyQ7iLTN4v6+H3yklUJK4IAcykWMR70QRDg9OpB Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="287725437"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="287725437"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 10:17:16 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="807142688"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="807142688"
Received: from tfigx-mobl1.ger.corp.intel.com (HELO [10.252.29.204])
 ([10.252.29.204])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 10:17:12 -0700
Message-ID: <8f223faf-6ebe-6688-e1a4-d106bc0b803e@intel.com>
Date: Wed, 26 Oct 2022 18:17:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.0
Subject: Re: [PATCH v5 16/19] drm/i915/vm_bind: userptr dma-resv changes
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20221025065905.13325-1-niranjana.vishwanathapura@intel.com>
 <20221025065905.13325-17-niranjana.vishwanathapura@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20221025065905.13325-17-niranjana.vishwanathapura@intel.com>
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

On 25/10/2022 07:59, Niranjana Vishwanathapura wrote:
> For persistent (vm_bind) vmas of userptr BOs, handle the user
> page pinning by using the i915_gem_object_userptr_submit_init()
> /done() functions
> 
> v2: Do not double add vma to vm->userptr_invalidated_list
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
