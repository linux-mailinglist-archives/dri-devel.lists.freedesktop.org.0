Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 530ED998256
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 11:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDD610E8AE;
	Thu, 10 Oct 2024 09:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="INirg5Ug";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC7110E8AD;
 Thu, 10 Oct 2024 09:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728552833; x=1760088833;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=re5Q+qO/hHoNx+eKZZ1hEuECNny9DIdvg8+EGAFqVig=;
 b=INirg5Ug+4+Ch0DdJMisIg58FBycSy7vUfj9mDBi9tOuXkxC7hsCt3f2
 oU3Dhgg/6U19j7PSBr70wiGN27jtNr1BOKx3Ps9n02VVofn1mMTn+JGXt
 z8J/FKOfXknV7J3ApkleUFRGFLQi6dFrb3Q/lYEH+NV9v5oALsNn/vCno
 TvbRKvIintG4K9ZGJGzJxWHo5grXJxmADeBT1YU3ddhkxBPfCuHQMwlTk
 pie09uYhx7QGG8PdrI5W3SSZO6nk9fow3WdOkSxwNhYyIoWVOtmzQ5rgU
 GSgZjg8qHxC6SqmmAmuTgzy6q4s85LFPjm3s92cIpCo+mohkpY6OMxIvP A==;
X-CSE-ConnectionGUID: E9m60TyVTHCowHL4K4CnLQ==
X-CSE-MsgGUID: qZ46ZI7mQUS9Bg+6+BUz3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27710356"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="27710356"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 02:33:52 -0700
X-CSE-ConnectionGUID: QgsLcRwqRKuJVaJxSY/Zcw==
X-CSE-MsgGUID: SKqVmDLOQ/maIfi6mzE8lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="76143171"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 10 Oct 2024 02:33:49 -0700
Received: from [10.245.97.255] (unknown [10.245.97.255])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id E7C982876E;
 Thu, 10 Oct 2024 10:33:46 +0100 (IST)
Message-ID: <6f64b79b-391e-4c78-98ac-8741b82201b4@intel.com>
Date: Thu, 10 Oct 2024 11:33:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] drm/xe/guc: Fix dereference before NULL check
To: Dan Carpenter <dan.carpenter@linaro.org>,
 "Everest K.C." <everestkc@everestkc.com.np>
Cc: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 skhan@linuxfoundation.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241010064636.3970-1-everestkc@everestkc.com.np>
 <1a5407c4-3b0f-48a1-940a-cc6b3ff3fb12@stanley.mountain>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <1a5407c4-3b0f-48a1-940a-cc6b3ff3fb12@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10.10.2024 08:54, Dan Carpenter wrote:
> On Thu, Oct 10, 2024 at 12:46:34AM -0600, Everest K.C. wrote:
>> The pointer list->list is dereferenced before the NULL check.
>> Fix this by moving the NULL check outside the for loop, so that
>> the check is performed before the dereferencing.
>> The list->list pointer cannot be NULL so this has no effect on runtime.
>> It's just a correctness issue.
>>
>> This issue was reported by Coverity Scan.
>> https://scan7.scan.coverity.com/#/project-view/51525/11354?selectedIssue=1600335
>>
>> Fixes: a18c696fa5cb ("drm/xe/guc: Fix dereference before Null check")

hmm, this seems wrong, shouldn't this be:

Fixes: 0f1fdf559225 ("drm/xe/guc: Save manual engine capture into
capture list")

>> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
>> ---
> 
> Perfect!  Thanks.
> 
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> regards,
> dan carpenter
> 

