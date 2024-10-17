Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFEC9A17F1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 03:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988B510E2E2;
	Thu, 17 Oct 2024 01:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174BC10E2E2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 01:33:13 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4XTVgG1rxYz1SCpK;
 Thu, 17 Oct 2024 09:31:54 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id CE4B7140157;
 Thu, 17 Oct 2024 09:33:09 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 17 Oct 2024 09:33:08 +0800
Message-ID: <8ddc72c9-8662-59d0-c3b6-904f2688cb29@huawei.com>
Date: Thu, 17 Oct 2024 09:33:07 +0800
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
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20241016-poised-athletic-adder-ef2998@houat>
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



On 2024/10/16 17:35, Maxime Ripard wrote:
> On Mon, Oct 14, 2024 at 08:52:01PM GMT, Jinjie Ruan wrote:
>> As Maxime suggested, add a new helper
>> drm_kunit_helper_display_mode_from_cea_vic(), it can replace
>> the direct call of drm_display_mode_from_cea_vic(), and it will
>> help solving the `mode` memory leaks.
>>
>> Suggested-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  drivers/gpu/drm/tests/drm_kunit_helpers.c | 40 +++++++++++++++++++++++
>>  include/drm/drm_kunit_helpers.h           |  6 ++++
>>  2 files changed, 46 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
>> index aa62719dab0e..dc70bafcd394 100644
>> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
>> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
>> @@ -311,6 +311,46 @@ drm_kunit_helper_create_crtc(struct kunit *test,
>>  }
>>  EXPORT_SYMBOL_GPL(drm_kunit_helper_create_crtc);
>>  
>> +static void kunit_action_drm_mode_destroy(void *ptr)
>> +{
>> +	struct drm_display_mode *mode = ptr;
>> +
>> +	drm_mode_destroy(NULL, mode);
>> +}
>> +
>> +/**
>> + * drm_kunit_helper_display_mode_from_cea_vic() - return a mode for CEA VIC
>> +						  for a KUnit test
>> + * @test: The test context object
>> + * @dev: DRM device
>> + * @video_code: CEA VIC of the mode
>> + *
>> + * Creates a new mode matching the specified CEA VIC for a KUnit test.
>> + *
>> + * Resources will be cleaned up automatically.
>> + *
>> + * Returns: A new drm_display_mode on success or NULL on failure
>> + */
>> +struct drm_display_mode *
>> +drm_kunit_helper_display_mode_from_cea_vic(struct kunit *test,
>> +					   struct drm_device *dev,
>> +					   u8 video_code)
>> +{
>> +	struct drm_display_mode *mode;
>> +	int ret;
>> +
>> +	mode = drm_display_mode_from_cea_vic(dev, video_code);
>> +
>> +	ret = kunit_add_action_or_reset(test,
>> +					kunit_action_drm_mode_destroy,
>> +					mode);
>> +	if (ret)
>> +		return NULL;
>> +
>> +	return mode;
>> +}
>> +EXPORT_SYMBOL_GPL(drm_kunit_helper_display_mode_from_cea_vic);
>> +
> 
> I think you can drop the "helper" name there, it's usually reserved for
> blanket implementation of DRM hooks. This one isn't a hook, so just
> calling it drm_kunit_display_mode_from_cea_vic makes a bit more sense to
> me.
> 
>>  MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
>>  MODULE_DESCRIPTION("KUnit test suite helper functions");
>>  MODULE_LICENSE("GPL");
>> diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_helpers.h
>> index e7cc17ee4934..1e7fd4be550c 100644
>> --- a/include/drm/drm_kunit_helpers.h
>> +++ b/include/drm/drm_kunit_helpers.h
>> @@ -4,6 +4,7 @@
>>  #define DRM_KUNIT_HELPERS_H_
>>  
>>  #include <drm/drm_drv.h>
>> +#include <drm/drm_edid.h>
>>
>>  #include <linux/device.h>
>>  
>> @@ -120,4 +121,9 @@ drm_kunit_helper_create_crtc(struct kunit *test,
>>  			     const struct drm_crtc_funcs *funcs,
>>  			     const struct drm_crtc_helper_funcs *helper_funcs);
>>  
>> +struct drm_display_mode *
>> +drm_kunit_helper_display_mode_from_cea_vic(struct kunit *test,
>> +					   struct drm_device *dev,
>> +					   u8 video_code);
> 
> It's not clear to me what you need the drm_edid header, you just return
> a drm_display_mode pointer so you can just forward declare the structure


There is a compile error without the header，because there is no
"drm_display_mode_from_cea_vic()" declare.

drivers/gpu/drm/tests/drm_kunit_helpers.c:341:16: error: implicit
declaration of function ‘drm_display_mode_from_cea_vic’; did you mean
‘drm_kunit_display_mode_from_cea_vic’?
[-Werror=implicit-function-declaration]
  341 |         mode = drm_display_mode_from_cea_vic(dev, video_code);
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                drm_kunit_display_mode_from_cea_vic
drivers/gpu/drm/tests/drm_kunit_helpers.c:341:14: warning: assignment to
‘struct drm_display_mode *’ from ‘int’ makes pointer from integer
without a cast [-Wint-conversion]
  341 |         mode = drm_display_mode_from_cea_vic(dev, video_code);
      |              ^


> 
> Once fixed
> Acked-by: Maxime Ripard <mripard@kernel.org>
> 
> Maxime
