Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C64338E115
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 08:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735636E0E8;
	Mon, 24 May 2021 06:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829246E0E8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 06:37:34 +0000 (UTC)
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FpS900Rf7zQsCC;
 Mon, 24 May 2021 14:33:56 +0800 (CST)
Received: from dggemi762-chm.china.huawei.com (10.1.198.148) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 24 May 2021 14:37:31 +0800
Received: from [10.174.178.208] (10.174.178.208) by
 dggemi762-chm.china.huawei.com (10.1.198.148) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 24 May 2021 14:37:30 +0800
Subject: Re: [PATCH -next] drm: Fix PM reference leak
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <robert.foss@linaro.org>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>, <airlied@linux.ie>,
 <emma@anholt.net>, <mripard@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <1621602186-74786-1-git-send-email-zou_wei@huawei.com>
 <YKfSeS1vvqKNSRSH@phenom.ffwll.local>
From: Samuel Zou <zou_wei@huawei.com>
Message-ID: <6a7716c5-212c-58e6-0d84-7656e18fddc6@huawei.com>
Date: Mon, 24 May 2021 14:37:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <YKfSeS1vvqKNSRSH@phenom.ffwll.local>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.208]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggemi762-chm.china.huawei.com (10.1.198.148)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Daniel,

Thanks for your review, I will split the patch and resend.

On 2021/5/21 23:32, Daniel Vetter wrote:
> On Fri, May 21, 2021 at 09:03:06PM +0800, Zou Wei wrote:
>> pm_runtime_get_sync will increment pm usage counter even it failed.
>> Forgetting to putting operation will result in reference leak here.
>> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
>> counter balanced.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> 
> Looks good, but can you pls split this up into a patch per driver (vc and
> bridge/cdns-dsi here)?
> 
> Thanks, Daniel
> 
>> ---
>>   drivers/gpu/drm/bridge/cdns-dsi.c | 2 +-
>>   drivers/gpu/drm/vc4/vc4_hdmi.c    | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c
>> index 76373e3..b31281f 100644
>> --- a/drivers/gpu/drm/bridge/cdns-dsi.c
>> +++ b/drivers/gpu/drm/bridge/cdns-dsi.c
>> @@ -1028,7 +1028,7 @@ static ssize_t cdns_dsi_transfer(struct mipi_dsi_host *host,
>>   	struct mipi_dsi_packet packet;
>>   	int ret, i, tx_len, rx_len;
>>   
>> -	ret = pm_runtime_get_sync(host->dev);
>> +	ret = pm_runtime_resume_and_get(host->dev);
>>   	if (ret < 0)
>>   		return ret;
>>   
>> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
>> index c27b287..f20a65b 100644
>> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
>> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
>> @@ -798,7 +798,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
>>   	unsigned long pixel_rate, hsm_rate;
>>   	int ret;
>>   
>> -	ret = pm_runtime_get_sync(&vc4_hdmi->pdev->dev);
>> +	ret = pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev);
>>   	if (ret < 0) {
>>   		DRM_ERROR("Failed to retain power domain: %d\n", ret);
>>   		return;
>> -- 
>> 2.6.2
>>
> 
