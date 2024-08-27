Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB9795FE63
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 03:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C8110E013;
	Tue, 27 Aug 2024 01:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959A510E013
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 01:40:12 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Wt9Fm1yyvzyRDc;
 Tue, 27 Aug 2024 09:39:40 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 14645140257;
 Tue, 27 Aug 2024 09:40:09 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 27 Aug 2024 09:40:08 +0800
Message-ID: <5d6debd0-1a02-f631-649e-26fb69e164e2@huawei.com>
Date: Tue, 27 Aug 2024 09:40:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next 1/5] drm/rockchip: Use
 for_each_child_of_node_scoped()
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
CC: <hjc@rock-chips.com>, <heiko@sntech.de>, <andy.yan@rock-chips.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <krzk@kernel.org>, <jic23@kernel.org>
References: <20240823092053.3170445-1-ruanjinjie@huawei.com>
 <20240823092053.3170445-2-ruanjinjie@huawei.com>
 <20240823123203.00002aac@Huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20240823123203.00002aac@Huawei.com>
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



On 2024/8/23 19:32, Jonathan Cameron wrote:
> On Fri, 23 Aug 2024 17:20:49 +0800
> Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> 
>> Avoids the need for manual cleanup of_node_put() in early exits
>> from the loop.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 
> There is more to do here, and looking at the code, I'm far from
> sure it isn't releasing references it never had.
> 
>> ---
>>  drivers/gpu/drm/rockchip/rockchip_lvds.c | 8 +++-----
>>  1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
>> index 9a01aa450741..f5b3f18794dd 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
>> @@ -548,7 +548,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>>  	struct drm_encoder *encoder;
>>  	struct drm_connector *connector;
>>  	struct device_node *remote = NULL;
>> -	struct device_node  *port, *endpoint;
> 
> Odd extra space before *port in original. Clean that up whilst here.
> 
> 
>> +	struct device_node  *port;
> 
> Use __free(device_node) for *port as well.

Yes，that is right.

> 
> So where the current asignment is.
> 	struct device_node *port = of_graph_get_port_by_id(dev->of_node, 1);
> 
>>  	int ret = 0, child_count = 0;
>>  	const char *name;
>>  	u32 endpoint_id = 0;
>> @@ -560,15 +560,13 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>>  			      "can't found port point, please init lvds panel port!\n");
>>  		return -EINVAL;
>>  	}
>> -	for_each_child_of_node(port, endpoint) {
>> +	for_each_child_of_node_scoped(port, endpoint) {
>>  		child_count++;
>>  		of_property_read_u32(endpoint, "reg", &endpoint_id);
>>  		ret = drm_of_find_panel_or_bridge(dev->of_node, 1, endpoint_id,
>>  						  &lvds->panel, &lvds->bridge);
>> -		if (!ret) {
>> -			of_node_put(endpoint);
>> +		if (!ret)
>>  			break;
> 
> This then can simply be
> 			return dev_err_probe(dev, ret,
> 					     "failed to find pannel and bridge node\n");
>> -		}

It seems to me there's no easy way return here, as it will try
drm_of_find_panel_or_bridge() for each child node, only "child_count =
0" or all child node  drm_of_find_panel_or_bridge() fails it will error
and return.

> 
> Various other paths become direct returns as well.
> 
>>  	}
> 
> The later code with remote looks suspect as not obvious who got the reference that
> is being put but assuming that is correct, it's another possible place for __free based
> cleanup.

Yes, the remote looks suspect.

> 
> 
>>  	if (!child_count) {
>>  		DRM_DEV_ERROR(dev, "lvds port does not have any children\n");
> 
