Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 985715BFD1A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 13:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774B610E933;
	Wed, 21 Sep 2022 11:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29A410E930;
 Wed, 21 Sep 2022 11:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663760647; x=1695296647;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jr8iny0hYLPrh53XacmwMPeZ8fjFNGJ5WaPcRdW1ZRs=;
 b=Qp5xUu2fHcXi407nbHbL1x4k6dNP0FJlRfQmJG+d+Rybl0+XctE6/Ku6
 WjcExCIYC5e7CXjGK+o43Un2zO1Il7DN/PmqQQx44rZBRTrkh4qTUYFr3
 3AhZXt/ksrCTfC2pTp18K5/JOqEBVueeotrvtQIsdkbnKOK50Ehx8cXv8
 UpqdMRw0+EWnpJjFwOXBsX5rKd28FfCajdRJYgHn7y8Jz+VftNwLJKb/o
 jYLe8q1TgGn4JGLcH9r8RagbnDIz3k4TDu+zas70KAdqsuX6U6A48/A+x
 2C7kQHWivy3kgItsUWY6+xsajpP4Bx1J9arZcFa/3EtvBUjZ7WOZ2nVRu A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="299964897"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="299964897"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 04:44:07 -0700
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="570502643"
Received: from jrcarrol-mobl.ger.corp.intel.com (HELO [10.213.205.22])
 ([10.213.205.22])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 04:44:05 -0700
Message-ID: <dbbd27bd-da76-c835-2122-89d9e4807a4d@linux.intel.com>
Date: Wed, 21 Sep 2022 12:44:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [Intel-gfx] [PATCH 3/7] drm/i915/hwmon: Power PL1 limit and TDP
 setting
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
References: <20220916150054.807590-1-badal.nilawar@intel.com>
 <20220916150054.807590-4-badal.nilawar@intel.com>
 <87h711d27s.wl-ashutosh.dixit@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <87h711d27s.wl-ashutosh.dixit@intel.com>
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
Cc: linux-hwmon@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/09/2022 01:02, Dixit, Ashutosh wrote:
> On Fri, 16 Sep 2022 08:00:50 -0700, Badal Nilawar wrote:
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
>> index e2974f928e58..bc061238e35c 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
>> @@ -5,3 +5,23 @@ Contact:	dri-devel@lists.freedesktop.org
>>   Description:	RO. Current Voltage in millivolt.
>>
>> 		Only supported for particular Intel i915 graphics platforms.
>> +
>> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max
>> +Date:		September 2022
>> +KernelVersion:	6
> 
> Maybe we should ask someone but even if we merge this today to drm-tip this
> will appear in kernel.org Linus' version only in 6.2. So I think we should
> set this as 6.2 on all patches.

Correct, if merged today it will appear in 6.2 so please change to that 
before merging.

As for the date that's harder to predict and I am not really sure how 
best to handle it. Crystal ball predicts February 2023 fwiw so maybe go 
with that for now. Seems less important than the release for me anyway.

Regards,

Tvrtko

> Except for this, thanks for making the changes, this is:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
