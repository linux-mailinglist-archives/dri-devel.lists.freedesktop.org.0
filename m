Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C0179717D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 12:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC8F210E1CC;
	Thu,  7 Sep 2023 10:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3599210E22B;
 Thu,  7 Sep 2023 10:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694082769; x=1725618769;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=q1dlgGPN4+/z/wN2BzNGKBcLOIZYk4NvcSLpZefL8nA=;
 b=lYcKZDRcVVMfN6OYyAESIOYFvYbA6CM4HuLl9totqY9MbYT0kranfC16
 gua1OqKIfADoqEhpK2xNfc+/nNDKT5dgkqqMb48FMJYIVw0555VhgDJto
 C721xmt2t3XnZFo7EfriiERP7M7AIzZ/Olk5mak7nwjOijPINkyjSrj6I
 LQ+KtrnmdirqNHxBa7NorY2y5MIjAAYn6iPigz/zcUdfW0tP5WUgRcXPU
 8WJimyVBF3zH7zDxumerZ5RVzKZjb6fW7fZIaeet5jf6k3t6jJqlddWDa
 +Lcvr2M08U98YhQRFEZsM5dj3OnX9xiMpNx267ee9MktzyRm5Z13PwnH9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="362344215"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="362344215"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 03:32:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="988717446"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="988717446"
Received: from lsilistr-mobl.ger.corp.intel.com (HELO [10.249.254.23])
 ([10.249.254.23])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 03:32:45 -0700
Message-ID: <eae696e7-ed34-3e3a-368e-5149f7be72ba@linux.intel.com>
Date: Thu, 7 Sep 2023 12:32:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Intel-xe] [PATCH 1/3] drm/kunit: Avoid a driver uaf
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
References: <20230905085832.2103-1-thomas.hellstrom@linux.intel.com>
 <20230905085832.2103-2-thomas.hellstrom@linux.intel.com>
 <efarj6smmvuqlredgy5aelgvm43xovnqo5fywsindq3bhggvul@3rqq27vmatcm>
 <0cb8a51c-a1a8-ba03-03b1-8cdabade0353@linux.intel.com>
 <eljwhc5pcztl3r3hvhosicyvkslt3ywfjjaksp3dik4ueb56wd@gnwsivkhjtob>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <eljwhc5pcztl3r3hvhosicyvkslt3ywfjjaksp3dik4ueb56wd@gnwsivkhjtob>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Maxime,

On 9/6/23 12:08, Maxime Ripard wrote:
> On Tue, Sep 05, 2023 at 02:43:00PM +0200, Thomas Hellström wrote:
>> Hi maxime,
>>
>> On 9/5/23 14:06, Maxime Ripard wrote:
>>> On Tue, Sep 05, 2023 at 10:58:30AM +0200, Thomas Hellström wrote:
>>>> when using __drm_kunit_helper_alloc_drm_device() the driver may be
>>>> dereferenced by device-managed resources up until the device is
>>>> freed, which is typically later than the kunit-managed resource code
>>>> frees it.
>>> I'd like to have a bit more context on how a driver can end up in that
>>> situation?
>> I interpret the attached traces as follows.
>>
>> INIT:
>>
>> Code allocates a struct device as a kunit-managed resource.
>> Code allocates a drm driver as a kunit-managed resource.
>> Code allocates a drm device as a device-managed resource.
>>
>> EXIT:
>>
>> Kunit resource cleanup frees the drm driver
>> Kunit resource cleanup frees the struct device, which starts a
>> device-managed resource cleanup
>> device-managed cleanup calls drm_dev_put()
>> drm_dev_put() dereferences the (now freed) drm driver -> Boom.
>>
>> It should be sufficient to enable KASAN and run the drm_exec_test kunit test
>> to trigger this.
> Ack. Can you put this into your commit log?
>
> Thanks!
> Maxime

Thanks for reviewing. I'll update this and the other patch with your 
comments.

Thanks,

Thomas


