Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA333ECF8D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 09:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21AA89CA2;
	Mon, 16 Aug 2021 07:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6C189CA2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 07:42:48 +0000 (UTC)
Subject: Re: [PATCH] drm/fb: Fix randconfig builds
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1629099766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CBPbvbO8jMkNdtM0Jgwi68KHAmvkiVFmnKhgdYN2A30=;
 b=XJLGOJ2J1nGW6rslCizdvgJQxTjQ3UKh69REq6RhTJFcMDZxB0VPe7U7pyeFM4WabvvMbm
 U41trbVejgnWO7ajE6WafJNttc871TsJiv5fDXLkjpQJzsm06a9Um9JhUgULIUQQ05DtLE
 rgOsDNBRs5aUNdR7VZFHovHMeKzc3cA=
To: Jani Nikula <jani.nikula@linux.intel.com>, daniel@ffwll.ch,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, liuyun01@kylinos.cn
References: <20210816064835.332785-1-liu.yun@linux.dev>
 <87y291kh4c.fsf@intel.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Jackie Liu <liu.yun@linux.dev>
Message-ID: <bd79d67c-137d-6c24-f192-c6fc33218228@linux.dev>
Date: Mon, 16 Aug 2021 15:42:40 +0800
MIME-Version: 1.0
In-Reply-To: <87y291kh4c.fsf@intel.com>
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

After commit f611b1e7624c, we change select FB
to depends on FB.

How about this��

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 7ff89690a976..cd129d96e649 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -98,7 +98,7 @@ config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
  config DRM_FBDEV_EMULATION
         bool "Enable legacy fbdev support for your modesetting driver"
         depends on DRM
-       depends on FB
+       depends on FB && FB != m
         select DRM_KMS_HELPER
         select FB_CFB_FILLRECT
         select FB_CFB_COPYAREA

--
Jackie Liu

�� 2021/8/16 ����3:01, Jani Nikula д��:
> On Mon, 16 Aug 2021, Jackie Liu <liu.yun@linux.dev> wrote:
>> From: Jackie Liu <liuyun01@kylinos.cn>
>>
>> When CONFIG_DRM_FBDEV_EMULATION is compiled to y and CONFIG_FB is m, the
>> compilation will fail. we need make that dependency explicit.
> 
> What's the failure mode? Using select here is a bad idea.
> 
> BR,
> Jani.
> 
>>
>> Reported-by: k2ci <kernel-bot@kylinos.cn>
>> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
>> ---
>>   drivers/gpu/drm/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 7ff89690a976..346a518b5119 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -98,7 +98,7 @@ config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>>   config DRM_FBDEV_EMULATION
>>   	bool "Enable legacy fbdev support for your modesetting driver"
>>   	depends on DRM
>> -	depends on FB
>> +	select FB
>>   	select DRM_KMS_HELPER
>>   	select FB_CFB_FILLRECT
>>   	select FB_CFB_COPYAREA
> 
