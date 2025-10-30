Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A2AC1EDA1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 08:52:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4C010E033;
	Thu, 30 Oct 2025 07:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Md+i197C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE9E10E033
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 07:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761810739; x=1793346739;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wiWSOOU2LlGl6PrZi3Ov5Fy7kKgdbb0AB0nKJtWpZYI=;
 b=Md+i197CyLnDfC10UOfX+Cu5TBLARbrVkBTaICJVF4hS7XOzb5qBq8Eu
 30zQkkT3QokwGz1wBfrRkVArLka4FOPXDY0o4wcivqO0sr2I/hcrKrm+P
 iXYEmv6RLvRB+K/kRVeqnt8QP3/dmuGcZGjdKCQEbyt9N9PF19ZCeQRv6
 oxkMmdHHxIUXPcgH0AuGIDZRqC6jrOTT9DpqJ1mPd0h8Z0N39YVMPWQj3
 yZHVzEgy7X9hQTqKKPIo/CZX+/NLbrove4W7n80SuXqDsOfUSAeD9VcL/
 b7BT1/RIthk5C+cMTfuXDzxO5u1bCDEZ+P4CY17jjLTQEoiPvxC2nsDVE Q==;
X-CSE-ConnectionGUID: R0/+d5cLTLu0jBfX3uwCfg==
X-CSE-MsgGUID: +ZwpHhiRQs++Z+sK7BgvNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="74543632"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="74543632"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 00:52:19 -0700
X-CSE-ConnectionGUID: sLzgP6F4SD6JSxaCSjPWFw==
X-CSE-MsgGUID: OII2hPjWRciIFfeUMfgeAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="190220598"
Received: from kwachows-mobl.ger.corp.intel.com (HELO [10.246.16.226])
 ([10.246.16.226])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 00:52:18 -0700
Message-ID: <3864852e-c0d5-4d86-bfda-625b572f5278@linux.intel.com>
Date: Thu, 30 Oct 2025 08:52:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/ivpu: Fix race condition when unbinding BOs
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com,
 lizhi.hou@amd.com, Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
References: <20251029071451.184243-1-karol.wachowski@linux.intel.com>
 <8d14408d-6a29-4c2a-a96a-24355bd2130f@oss.qualcomm.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <8d14408d-6a29-4c2a-a96a-24355bd2130f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/29/2025 4:40 PM, Jeff Hugo wrote:
> On 10/29/2025 1:14 AM, Karol Wachowski wrote:
>> From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
>>
>> Fix 'Memory manager not clean during takedown' warning that occurs
>> when ivpu_gem_bo_free() removes the BO from the BOs list before it
>> gets unmapped. Then file_priv_unbind() triggers a warning in
>> drm_mm_takedown() during context teardown.
>>
>> Protect the unmapping sequence with bo_list_lock to ensure the BO is
>> always fully unmapped when removed from the list. This ensures the BO
>> is either fully unmapped at context teardown time or present on the
>> list and unmapped by file_priv_unbind().
>>
>> Fixes: 48aea7f2a2ef ("accel/ivpu: Fix locking in
>> ivpu_bo_remove_all_bos_from_context()")
>> Signed-off-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com> 

Pushed to drm-misc-next.
-Karol

