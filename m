Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0993EA6CDB0
	for <lists+dri-devel@lfdr.de>; Sun, 23 Mar 2025 03:30:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0694F10E1C7;
	Sun, 23 Mar 2025 02:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8241B10E176;
 Sun, 23 Mar 2025 02:30:21 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZL0Qp2sy0z1g2Cb;
 Sun, 23 Mar 2025 10:25:38 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
 by mail.maildlp.com (Postfix) with ESMTPS id 6120D1A0188;
 Sun, 23 Mar 2025 10:30:13 +0800 (CST)
Received: from [10.174.179.113] (10.174.179.113) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sun, 23 Mar 2025 10:30:12 +0800
Message-ID: <8370ea3f-38c5-4dd2-82fd-e89d53d88b8a@huawei.com>
Date: Sun, 23 Mar 2025 10:30:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] drm/xe: Fix unmet direct dependencies warning
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20250322095521.4153684-1-yuehaibing@huawei.com>
 <2p7zbqflqj4khxmwofotnn5no5vo54yq5wq7z3j6etntkg3b4v@wym3efsfrx4o>
Content-Language: en-US
From: Yue Haibing <yuehaibing@huawei.com>
In-Reply-To: <2p7zbqflqj4khxmwofotnn5no5vo54yq5wq7z3j6etntkg3b4v@wym3efsfrx4o>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.113]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemf500002.china.huawei.com (7.185.36.57)
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

On 2025/3/22 20:51, Lucas De Marchi wrote:
> On Sat, Mar 22, 2025 at 05:55:21PM +0800, Yue Haibing wrote:
>> WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
>>  Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
>>  Selected by [m]:
>>  - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=m] && DRM_XE [=m] && DRM_XE [=m]=m [=m] && HAS_IOPORT [=y]
>>
>> FB_IOMEM_HELPERS depends on FB_CORE, Select it before FB_IOMEM_HELPERS.
>>
>> Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
>> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
>> ---
>> drivers/gpu/drm/xe/Kconfig | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>> index 7d7995196702..fcf324f37d2d 100644
>> --- a/drivers/gpu/drm/xe/Kconfig
>> +++ b/drivers/gpu/drm/xe/Kconfig
>> @@ -53,6 +53,7 @@ config DRM_XE
>> config DRM_XE_DISPLAY
>>     bool "Enable display support"
>>     depends on DRM_XE && DRM_XE=m && HAS_IOPORT
>> +    select FB_CORE
> 
> other places in drm, including i915 where this is coming from, use:
> 
>     select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
> 
> ... and don't explicitly select FB_CORE. I think that is sufficient
> following the chain of selects which ends up with DRM_CLIENT_LIB
> selecting FB_CORE when DRM_FBDEV_EMULATION is set. Does that fixes it
> for you?

Thanks, it works for this, will send v2 soon.
> 
> Lucas De Marchi
> 
