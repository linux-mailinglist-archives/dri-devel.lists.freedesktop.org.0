Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B4E7D70AA
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 17:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CBC10E01F;
	Wed, 25 Oct 2023 15:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF6A10E01F;
 Wed, 25 Oct 2023 15:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698247182; x=1729783182;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7tGiM54O6L5JekDJ+E1ZH6lvT8M1Dz27WG2NkEa10w4=;
 b=gOlvjfsg+HJIiLbwOZ00jgvV2pKAnxm2NDFA5x1daCixV7XWENLKIo3w
 rI1qPohjbSFHGfLmsu5ljxfpTNt6KWajEUDCtAqiW6nG9ogu0yDWqf6Xb
 wcIBCyVuVQiM7TLvwTqlGteqPf97tIZKwgklEdPakCiHxg3fJVFnN/iSi
 s3IlmISa6vjKEhG+NP+dER11QM4p/VOnSjyQCTPbGS1uY/6UmDGdfLGTh
 ZqY0SLM3J17WSlrW5N3y7+f9M8GI50BCsyZewYNQPVTOPxpxKMbgrMTCR
 xu5Mrb/RUzwUNaocHZIB09fIjQ6GngftrDRDlsmgc+T/jKWjlJsc+Xbnk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="390183707"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="390183707"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 08:19:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="752359575"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="752359575"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.32.60])
 ([10.252.32.60])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 08:19:40 -0700
Message-ID: <682964d5-3c16-a535-9eea-10d6499aa061@linux.intel.com>
Date: Wed, 25 Oct 2023 17:19:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH v2 1/5] drm/i915/guc: Create the guc_to_i915()
 wrapper
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20231025143515.254468-1-andi.shyti@linux.intel.com>
 <20231025143515.254468-2-andi.shyti@linux.intel.com>
 <35cd748f-1944-cc0f-bbd2-b1cd04ca44f0@linux.intel.com>
 <ZTksAJBWT191vAEX@ashyti-mobl2.lan>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ZTksAJBWT191vAEX@ashyti-mobl2.lan>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/25/2023 4:53 PM, Andi Shyti wrote:
> Hi Nirmoy,
>
>>> +static inline struct drm_i915_private *guc_to_i915(struct intel_guc *guc)
>>> +{
>>> +	return guc_to_gt(guc)->i915;
>>> +}
>>> +
>> We don't want inline functions in headers files[1]. Otherwise the series
>> looks fine to me:
> the reason for that patch is that we were including the
> i915_drv.h just for that inline function and we were doing it
> inside the gt/.
>
> In this patch I am not changing any header dependency.

Sounds fair, thanks,

Nirmoy

>
> I guess the original idea from Matt was to have a generic network
> of intel_gt_needs_wa_xxx(), but it didn't develop further.
>
>> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> Thanks,
> Andi
