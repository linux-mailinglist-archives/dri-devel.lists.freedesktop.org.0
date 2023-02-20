Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B75669C6E0
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 09:39:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE98010E602;
	Mon, 20 Feb 2023 08:39:19 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738B610E602;
 Mon, 20 Feb 2023 08:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676882357; x=1708418357;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9IXP+XFabQzHOD20B+FIU39rW4y7pK+ccbQg35ljD2Y=;
 b=DLiqXb4eMjVcQ8N8Q64wjSXameOUBxcn+cJvA4Nekmu0B+9EBB+K5pXP
 jEWBO3F125tZL0hFYpZ0crqTT6fFveDwpJJznoj+4oBYFHFuKa91vs/eI
 IaGD0f37FOuKsNMumMufcGUyT4X21ThZQ1gLUCishJMPEp1Hz0yGha1uB
 NBfZUgOw+/FOfpk1bMeC6h15195PMXTKXL73AmzZrKvUtEU5ltcHvDr03
 5Sh828jIdAZJqZzT4LV3v8iNB/28CRvOyqN3dDo9a9c3RKlrpDjQZBas/
 ImjWZiO7JSFoUn5ITKexq008/Hc05Rtl8O5/gUauf2MDGwWa1NAz4HKji A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="332356485"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; d="scan'208";a="332356485"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 00:39:11 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="760085739"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; d="scan'208";a="760085739"
Received: from mochoamo-mobl.ger.corp.intel.com (HELO [10.213.211.126])
 ([10.213.211.126])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 00:39:02 -0800
Message-ID: <05e66d0e-3af1-83c9-f52a-5b5be722e573@linux.intel.com>
Date: Mon, 20 Feb 2023 08:39:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 0/2] Don't use stolen memory or BAR mappings for ring
 buffers
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20230216011101.1909009-1-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230216011101.1909009-1-John.C.Harrison@Intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 16/02/2023 01:10, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Instruction from hardware arch is that stolen memory and BAR mappings
> are unsafe for use as ring buffers. There can be issues with cache
> aliasing due to the CPU access going to memory via the BAR. So, don't
> do it.
> 
> v2: Dont use BAR mappings either.
> Make conditional on LLC so as not to change platforms that don't need
> to change (Daniele).
> Add 'Fixes' tags (Tvrtko).
> v3: Fix dumb typo.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> 
> 
> John Harrison (2):
>    drm/i915: Don't use stolen memory for ring buffers with LLC
>    drm/i915: Don't use BAR mappings for ring buffers with LLC
> 
>   drivers/gpu/drm/i915/gt/intel_ring.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

It is doing what it laid out as the problem statement so series looks 
good to me.

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko


