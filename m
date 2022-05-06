Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E8751D791
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 14:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF8B11210A;
	Fri,  6 May 2022 12:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A352711210A;
 Fri,  6 May 2022 12:26:13 +0000 (UTC)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KvqXq3chjzhYv2;
 Fri,  6 May 2022 20:25:47 +0800 (CST)
Received: from [10.174.179.215] (10.174.179.215) by
 canpemm500007.china.huawei.com (7.192.104.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 6 May 2022 20:26:10 +0800
Subject: Re: [PATCH -next] drm/msm: Add missing OF dependency for DRM_MSM
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <quic_abhinavk@quicinc.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
References: <20220506020300.20704-1-yuehaibing@huawei.com>
 <dbe452b1-7f6a-141c-5fe3-bd889c62abc7@linaro.org>
From: YueHaibing <yuehaibing@huawei.com>
Message-ID: <f0ac2d9a-1005-b7e9-f263-5f02a37f8e55@huawei.com>
Date: Fri, 6 May 2022 20:26:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <dbe452b1-7f6a-141c-5fe3-bd889c62abc7@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022/5/6 19:36, Dmitry Baryshkov wrote:
> On 06/05/2022 05:03, YueHaibing wrote:
>> WARNING: unmet direct dependencies detected for DRM_DP_AUX_BUS
>>    Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && OF [=n]
>>    Selected by [y]:
>>    - DRM_MSM [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARCH_QCOM || SOC_IMX5 || COMPILE_TEST [=y]) && COMMON_CLK [=y] && IOMMU_SUPPORT [=y] && (QCOM_OCMEM [=n] || QCOM_OCMEM [=n]=n) && (QCOM_LLCC [=y] || QCOM_LLCC [=y]=n) && (QCOM_COMMAND_DB [=n] || QCOM_COMMAND_DB [=n]=n)
>>
>> DRM_DP_AUX_BUS depends on OF, so DRM_MSM also should depends on it.
> 
> I think the proper fix would be to make DRM_DP_AUX_BUS depend on OF || COMPILE_TEST rather than just OF

Make sense, will do this in v2.
> 
>>
>> Fixes: f5d01644921b ("drm/msm: select DRM_DP_AUX_BUS for the AUX bus support")
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>>   drivers/gpu/drm/msm/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
>> index 4e0cbd682725..1d710a20ffdd 100644
>> --- a/drivers/gpu/drm/msm/Kconfig
>> +++ b/drivers/gpu/drm/msm/Kconfig
>> @@ -3,6 +3,7 @@
>>   config DRM_MSM
>>       tristate "MSM DRM"
>>       depends on DRM
>> +    depends on OF
>>       depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
>>       depends on COMMON_CLK
>>       depends on IOMMU_SUPPORT
> 
> 
