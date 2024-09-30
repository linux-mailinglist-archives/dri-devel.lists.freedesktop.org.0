Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F74998ACFC
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A111E10E2F3;
	Mon, 30 Sep 2024 19:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HcIp7DTm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6309110E2F3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727725039; x=1759261039;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=c4k75cUjVXg16d/kZfsvffIcMon3SIFCXKvOaT6WFRY=;
 b=HcIp7DTm7s0HfqNba0TKTQovICEtc6TE8b0kD0A8hzZfFgRyCZchNDrV
 UqwTQT5jMzqIqAerxy3ZFhXdppsq4OsyGM7uK2Nh7oIk24Pc4H+/3RDpq
 8b6YlcPuurG3s3YXHhqA1dTNBsas37XRd/q9CAvVw8UTOgJOKOoI30hx7
 Ko90waEo7XRsv7dBDN5R2HW2Xrj9mC0keRpsXQz4jukOmQkifruKNMprE
 eiraZRG1tPRzz7fikN74Rec9w90pUfUd/eKzN4ctW8qoYpgme2NCClJTX
 TavDjnRco33SiehtOJItftQpwtekNOLJ0bBJccupPspG7nB/wZzD6jYux w==;
X-CSE-ConnectionGUID: eryjsAWeT+ecGm14hD23EQ==
X-CSE-MsgGUID: J6kqJLtBSn6TMsA/U/sDQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="38189951"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="38189951"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:37:19 -0700
X-CSE-ConnectionGUID: /Tm1s6zETayhGd2gaqynUA==
X-CSE-MsgGUID: Tn53+qdZS4imUKpYbZtenQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="96753337"
Received: from jpdavis-mobl1.ger.corp.intel.com (HELO [10.246.18.68])
 ([10.246.18.68])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:37:17 -0700
Message-ID: <80671632-8cd4-46d7-a1e4-49703914356b@linux.intel.com>
Date: Mon, 30 Sep 2024 21:37:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/29] accel/ivpu: Add auto selection logic for job
 scheduler
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, Karol Wachowski <karol.wachowski@intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
 <20240924081754.209728-15-jacek.lawrynowicz@linux.intel.com>
 <efd75ade-c451-6b11-0d2e-a8afae985091@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <efd75ade-c451-6b11-0d2e-a8afae985091@quicinc.com>
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

On 9/27/2024 11:21 PM, Jeffrey Hugo wrote:
> On 9/24/2024 2:17 AM, Jacek Lawrynowicz wrote:
>> --- a/drivers/accel/ivpu/ivpu_sysfs.c
>> +++ b/drivers/accel/ivpu/ivpu_sysfs.c
>> @@ -6,6 +6,8 @@
>>   #include <linux/device.h>
>>   #include <linux/err.h>
>>   +#include "ivpu_drv.h"
>> +#include "ivpu_fw.h"
>>   #include "ivpu_hw.h"
>>   #include "ivpu_sysfs.h"
>>   @@ -39,8 +41,20 @@ npu_busy_time_us_show(struct device *dev, struct device_attribute *attr, char *b
>>     static DEVICE_ATTR_RO(npu_busy_time_us);
>>   +static ssize_t
>> +sched_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
>> +{
>> +    struct drm_device *drm = dev_get_drvdata(dev);
>> +    struct ivpu_device *vdev = to_ivpu_device(drm);
>> +
>> +    return sysfs_emit(buf, "%s\n", vdev->fw->sched_mode ? "HW" : "OS");
>> +}
>> +
>> +static DEVICE_ATTR_RO(sched_mode);
>> +
>>   static struct attribute *ivpu_dev_attrs[] = {
>>       &dev_attr_npu_busy_time_us.attr,
>> +    &dev_attr_sched_mode.attr,
>>       NULL,
>>   };
>>   
> 
> No Documentation/ABI entry?

I will add a DOC comment.
