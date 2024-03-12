Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 169D9879665
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 15:34:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334A910F1FB;
	Tue, 12 Mar 2024 14:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L2ZtlRMm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA6510F45F;
 Tue, 12 Mar 2024 14:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710254043; x=1741790043;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JbBuKm6jMRiPBhq30ZlUQnNdW4tko3qPauFBuhDD83E=;
 b=L2ZtlRMmTxE5dAO9nVlXDNgwmEi7Qzeo7VvwHjq+K/v7Xrisnex0RnSL
 xRs3X2NerjIQsoKYWVzRfuJ3pumhMot1wV40qAMHC9PSxOks/iJY320Jp
 A9N9Mqpyrw/UqwiD5OReLrtJntUH5P8Mbz/+VasQKFHlFCLB9Rz1moVDW
 frjKd2SKGi0ou3hTKeJUH/UP/fwG1TKykiGyODt94wQDmRH+9fRPOMhVt
 3Zn9dmFfqCvwp3xVqBoQghG2kw9abArkI+B4UsaLbcpzlLSBf//mO6i85
 M13MknyyCrU254zmfs1hcQx5TaBphBXRHHXJz4uZ/szIzL/zdxuz7U+5O A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="7912641"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="7912641"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:34:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11466250"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.35.214])
 ([10.246.35.214])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:33:59 -0700
Message-ID: <70a177b3-5872-4d85-acad-e0458a0d318e@linux.intel.com>
Date: Tue, 12 Mar 2024 15:33:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/selftests: Pick correct caching mode.
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20240312111815.18083-1-nirmoy.das@intel.com>
 <ZfBmpJE7xKsZMgh5@ashyti-mobl2.lan>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ZfBmpJE7xKsZMgh5@ashyti-mobl2.lan>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/12/2024 3:28 PM, Andi Shyti wrote:
> Hi Nirmoy,
>
> On Tue, Mar 12, 2024 at 12:18:15PM +0100, Nirmoy Das wrote:
>> Caching mode is HW dependent so pick a correct one using
>> intel_gt_coherent_map_type().
>>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10249
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> I think it's a good choice not to have the Fixes tag here either.

Yes,  fixes tag isn't needed for selftests


>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,

Nirmoy

>
> Thanks,
> Andi
