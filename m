Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2E660DF7D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 13:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7292210E4BA;
	Wed, 26 Oct 2022 11:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B348E10E4BA
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 11:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666783576; x=1698319576;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=P0DI/UKgLm1/hOCRL+pjhM1qeSyuAP8dFpSgEqZBioY=;
 b=JQ4J/CcEJk+j7y+IusgkF1UwQhNycrPlfKdEoZ99NL9RVqrW75a3vqMe
 dR7a9e6rXABHnOXelL/uHgWiePYnJACqpeQ3/8N7kiw9l3aktabGRVqBX
 AEzkJKPa1/Sv6UUU2Y56etdDRkJYlmEObzkd2uslY+kBVzJwYZEQOs3K8
 PO6Q54l/xfX9J0Z91shUsp4KXt0hTqXBZpx/M+oZKFKQIJW6MyWe7dD6Z
 Oac1upiiAEsgZlzD6cFqWeMsO3Qse1Rl9dF+fSfe08jn6EVIvbtPKloF2
 1klopZOXnq1A9r2jTqx63DT7zkHuizyE8eqZoMD/8UTlxqZxYDxYm6PSj w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="309014333"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; d="scan'208";a="309014333"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 04:26:16 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="961174808"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; d="scan'208";a="961174808"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.140.135])
 ([10.249.140.135])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 04:26:14 -0700
Message-ID: <9a7d0dc3-67ce-e947-81c0-78c7ae40ded1@linux.intel.com>
Date: Wed, 26 Oct 2022 13:26:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 3/7] drm/ivpu: Add GEM buffer object management
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@gmail.com, daniel@ffwll.ch
References: <20220924151149.323622-1-jacek.lawrynowicz@linux.intel.com>
 <20220924151149.323622-4-jacek.lawrynowicz@linux.intel.com>
 <c2ca1915-a4e7-d72f-c753-a6a63180f560@suse.de>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <c2ca1915-a4e7-d72f-c753-a6a63180f560@suse.de>
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
Cc: andrzej.kacprowski@linux.intel.com, stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/25/2022 2:41 PM, Thomas Zimmermann wrote:
> Hi
> 
> Am 24.09.22 um 17:11 schrieb Jacek Lawrynowicz:
>> Adds four types of GEM-based BOs for the VPU:
>>    - shmem
>>    - userptr
>>    - internal
>>    - prime
>>
>> All types are implemented as struct ivpu_bo, based on
>> struct drm_gem_object. VPU address is allocated when buffer is created
>> except for imported prime buffers that allocate it in BO_INFO IOCTL due
>> to missing file_priv arg in gem_prime_import callback.
>> Internal buffers are pinned on creation, the rest of buffers types
>> can be pinned on demand (in SUBMIT IOCTL).
>> Buffer VPU address, allocated pages and mappings are relased when the
>> buffer is destroyed.
>> Eviction mechism is planned for future versions.
>>
>> Add three new IOCTLs: BO_CREATE, BO_INFO, BO_USERPTR
> 
> I feels like TTM already does all you need. (?) Why not build upon TTM?

Would TTM make sense for a device without dedicated memory?
It looks like struct drm_gem_shmem_object could be a better fit for us but it doesn't support userptr or internal buffers.

Regards,
Jacek
