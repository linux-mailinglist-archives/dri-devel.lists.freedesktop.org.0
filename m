Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F7D3ED0C7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 11:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EEB28933D;
	Mon, 16 Aug 2021 09:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261C18933D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 09:01:27 +0000 (UTC)
Subject: Re: [PATCH v2] drm/fb: Fix randconfig builds
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1629104485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EjZXAAeTxyCfjMvlJTcqGZYG/S+P3GMujEqR3Q4L1ws=;
 b=BHSUpk/YDErGIN363W12R92uWt6LnvdWACW0vG1RFuiMtm4eENgUD+x6NU4dZcM5tYgDOd
 VeYIeX2gLpxW+Obprquz0QEFcXsxDMtW29pR7YIocKKnyv7ppTInjD+fvdPSEMPMnu3D6E
 ihgcyEdRiLrZRm8/nc54Iq0HaCX2iCQ=
To: Jani Nikula <jani.nikula@linux.intel.com>, keescook@chromium.org,
 daniel@ffwll.ch, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, liuyun01@kylinos.cn
References: <20210816085231.2455369-1-liu.yun@linux.dev>
 <878s11kbpf.fsf@intel.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Jackie Liu <liu.yun@linux.dev>
Message-ID: <7facd428-2792-d491-7af6-33bf5478a492@linux.dev>
Date: Mon, 16 Aug 2021 17:01:20 +0800
MIME-Version: 1.0
In-Reply-To: <878s11kbpf.fsf@intel.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: liu.yun@linux.dev
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



ÔÚ 2021/8/16 ÏÂÎç4:58, Jani Nikula Ð´µÀ:
> On Mon, 16 Aug 2021, Jackie Liu <liu.yun@linux.dev> wrote:
>> From: Jackie Liu <liuyun01@kylinos.cn>
>>
>> When CONFIG_DRM_FBDEV_EMULATION is compiled to y and CONFIG_FB is m, the
>> compilation will fail. we need make that dependency explicit.
>>
>> Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
>> Reported-by: k2ci <kernel-bot@kylinos.cn>
>> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
> 
> Why do you send this while the discussion is still ongoing?
> 
> Now this *requires* FB=y even if it *could* be FB=m when
> DRM_KMS_HELPER=m.

Yes, You are right.

BR, Jackie

> 
> BR,
> Jani.
> 
>> ---
>>   drivers/gpu/drm/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 7ff89690a976..cd129d96e649 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -98,7 +98,7 @@ config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>>   config DRM_FBDEV_EMULATION
>>   	bool "Enable legacy fbdev support for your modesetting driver"
>>   	depends on DRM
>> -	depends on FB
>> +	depends on FB && FB != m
>>   	select DRM_KMS_HELPER
>>   	select FB_CFB_FILLRECT
>>   	select FB_CFB_COPYAREA
> 
