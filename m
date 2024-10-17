Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED67D9A21F8
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 14:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B2210E1FB;
	Thu, 17 Oct 2024 12:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8790D10E1FB
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 12:16:35 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4XTmzB2JVpz1ynDc;
 Thu, 17 Oct 2024 20:16:38 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 3584A1400CF;
 Thu, 17 Oct 2024 20:16:32 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 17 Oct 2024 20:16:30 +0800
Message-ID: <2621a412-1ca6-5282-ffba-30b544466076@huawei.com>
Date: Thu, 17 Oct 2024 20:16:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 1/4] drm/tests: helpers: Add helper for
 drm_display_mode_from_cea_vic()
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
CC: <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <christian.koenig@amd.com>,
 <ray.huang@amd.com>, <dmitry.baryshkov@linaro.org>,
 <dave.stevenson@raspberrypi.com>, <mcanal@igalia.com>,
 <quic_jjohnson@quicinc.com>, <skhan@linuxfoundation.org>,
 <davidgow@google.com>, <karolina.stolarek@intel.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <thomas.hellstrom@linux.intel.com>,
 <asomalap@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20241014125204.1294934-1-ruanjinjie@huawei.com>
 <20241014125204.1294934-2-ruanjinjie@huawei.com>
 <20241016-poised-athletic-adder-ef2998@houat>
 <8ddc72c9-8662-59d0-c3b6-904f2688cb29@huawei.com>
 <20241017-fearless-terrier-from-avalon-b9769f@houat>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20241017-fearless-terrier-from-avalon-b9769f@houat>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemh500013.china.huawei.com (7.202.181.146)
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



On 2024/10/17 20:13, Maxime Ripard wrote:
> On Thu, Oct 17, 2024 at 09:33:07AM GMT, Jinjie Ruan wrote:
>>>> diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_helpers.h
>>>> index e7cc17ee4934..1e7fd4be550c 100644
>>>> --- a/include/drm/drm_kunit_helpers.h
>>>> +++ b/include/drm/drm_kunit_helpers.h
>>>> @@ -4,6 +4,7 @@
>>>>  #define DRM_KUNIT_HELPERS_H_
>>>>  
>>>>  #include <drm/drm_drv.h>
>>>> +#include <drm/drm_edid.h>
>>>>
>>>>  #include <linux/device.h>
>>>>  
>>>> @@ -120,4 +121,9 @@ drm_kunit_helper_create_crtc(struct kunit *test,
>>>>  			     const struct drm_crtc_funcs *funcs,
>>>>  			     const struct drm_crtc_helper_funcs *helper_funcs);
>>>>  
>>>> +struct drm_display_mode *
>>>> +drm_kunit_helper_display_mode_from_cea_vic(struct kunit *test,
>>>> +					   struct drm_device *dev,
>>>> +					   u8 video_code);
>>>
>>> It's not clear to me what you need the drm_edid header, you just return
>>> a drm_display_mode pointer so you can just forward declare the structure
>>
>>
>> There is a compile error without the header，because there is no
>> "drm_display_mode_from_cea_vic()" declare.
>>
>> drivers/gpu/drm/tests/drm_kunit_helpers.c:341:16: error: implicit
>> declaration of function ‘drm_display_mode_from_cea_vic’; did you mean
>> ‘drm_kunit_display_mode_from_cea_vic’?
>> [-Werror=implicit-function-declaration]
>>   341 |         mode = drm_display_mode_from_cea_vic(dev, video_code);
>>       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>       |                drm_kunit_display_mode_from_cea_vic
>> drivers/gpu/drm/tests/drm_kunit_helpers.c:341:14: warning: assignment to
>> ‘struct drm_display_mode *’ from ‘int’ makes pointer from integer
>> without a cast [-Wint-conversion]
>>   341 |         mode = drm_display_mode_from_cea_vic(dev, video_code);
>>       |              ^
> > Right, but the error is in the C file, not the header.

Yes, I have updated it to C file in V3, thank you!

> 
> Maxime
