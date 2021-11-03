Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50304443B59
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 03:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B896F581;
	Wed,  3 Nov 2021 02:26:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58826F581
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 02:26:45 +0000 (UTC)
Received: from dggeme756-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HkVw64WdJz1DHkd;
 Wed,  3 Nov 2021 10:24:38 +0800 (CST)
Received: from [10.67.110.136] (10.67.110.136) by
 dggeme756-chm.china.huawei.com (10.3.19.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.15; Wed, 3 Nov 2021 10:26:42 +0800
Subject: Re: [PATCH -V2] drm/sun4i: Grab reference of connector before return
 connector from sun4i_tcon_get_connector
To: Maxime Ripard <maxime@cerno.tech>
References: <33e01d45-c9f9-0e8c-6871-868ecd198368@huawei.com>
 <20211102084628.149070-1-heying24@huawei.com>
 <20211102150331.526nn2e6oqjbf6ur@gilmour>
From: He Ying <heying24@huawei.com>
Message-ID: <a0871590-62b2-bbf2-d6ab-920abdf20fad@huawei.com>
Date: Wed, 3 Nov 2021 10:26:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211102150331.526nn2e6oqjbf6ur@gilmour>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.136]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggeme756-chm.china.huawei.com (10.3.19.102)
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org, jernej.skrabec@gmail.com,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


在 2021/11/2 23:03, Maxime Ripard 写道:
> Hi,
>
> On Tue, Nov 02, 2021 at 04:46:28AM -0400, He Ying wrote:
>>  From the comments of drm_for_each_connector_iter(), we know
>> that "connector is only valid within the list body, if you
>> want to use connector after calling drm_connector_list_iter_end()
>> then you need to grab your own reference first using
>> drm_connector_get()". So fix the wrong use of connector
>> according to the comments and then call drm_connector_put()
>> after using connector finishes.
>>
>> Signed-off-by: He Ying <heying24@huawei.com>
>> ---
>>
>> V2:
>>   Use proper subject prefix
>>
>>   drivers/gpu/drm/sun4i/sun4i_tcon.c | 18 +++++++++++++-----
>>   1 file changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
>> index 9f06dec0fc61..24fa6784ee5f 100644
>> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
>> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
>> @@ -47,12 +47,12 @@ static struct drm_connector *sun4i_tcon_get_connector(const struct drm_encoder *
>>   	drm_connector_list_iter_begin(encoder->dev, &iter);
>>   	drm_for_each_connector_iter(connector, &iter)
>>   		if (connector->encoder == encoder) {
>> -			drm_connector_list_iter_end(&iter);
>> -			return connector;
>> +			drm_connector_get(connector);
>> +			break;
>>   		}
>>   	drm_connector_list_iter_end(&iter);
>>   
>> -	return NULL;
>> +	return connector;
> Connector might be uninitialized if we don't find one here

Connector should be NULL if we don't find one. The code is

#define drm_for_each_connector_iter(connector, iter) \
    while ((connector = drm_connector_list_iter_next(iter)))

So, when we don't break from the while body, connector

can only be NULL.

>
>>   }
>>   
>>   static int sun4i_tcon_get_pixel_depth(const struct drm_encoder *encoder)
>> @@ -65,6 +65,7 @@ static int sun4i_tcon_get_pixel_depth(const struct drm_encoder *encoder)
>>   		return -EINVAL;
>>   
>>   	info = &connector->display_info;
>> +	drm_connector_put(connector);
>>   	if (info->num_bus_formats != 1)
> We're still accessing connector->display_info here, but it might have been
> freed already.
Agree. I'll place it after using 'info' finishes in v3.
>
> Maxime
