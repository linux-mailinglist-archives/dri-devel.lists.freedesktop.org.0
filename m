Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 379ECA42242
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 15:03:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B312610E3DC;
	Mon, 24 Feb 2025 14:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8775710E3DC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 14:03:29 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Z1j6q187Lz21p5G;
 Mon, 24 Feb 2025 22:00:19 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id EDBBD140120;
 Mon, 24 Feb 2025 22:03:22 +0800 (CST)
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 24 Feb 2025 22:03:21 +0800
Message-ID: <6634386b-afc1-4e31-a2f4-9c1afed2d1d8@huawei.com>
Date: Mon, 24 Feb 2025 22:03:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 drm-dp 7/8] drm/hisilicon/hibmc: Enable this hot plug
 detect of irq feature
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
 <chenjianmin@huawei.com>, <lidongming5@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <shiyongbang@huawei.com>
References: <20250222025102.1519798-1-shiyongbang@huawei.com>
 <20250222025102.1519798-8-shiyongbang@huawei.com>
 <reqpxlbvlz5qssgy6gbjuou33h4zevo4xeztqbsr4keehplyhx@utv22a5ihohx>
 <eef68fc7-30f4-4246-a82e-4f90cd6a665d@huawei.com>
 <6jx5ldpidy2ycrqognfiv5ttqr5ia4dtbryta3kc2mkndrvvgo@qzuakucz765k>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <6jx5ldpidy2ycrqognfiv5ttqr5ia4dtbryta3kc2mkndrvvgo@qzuakucz765k>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd500013.china.huawei.com (7.221.188.12)
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

> On Sat, Feb 22, 2025 at 06:35:48PM +0800, Yongbang Shi wrote:
>>>> +static int hibmc_dp_hpd_event(struct drm_client_dev *client)
>>>> +{
>>>> +	struct hibmc_dp *dp = container_of(client, struct hibmc_dp, client);
>>>> +	struct hibmc_drm_private *priv = to_hibmc_drm_private(dp->drm_dev);
>>>> +	struct drm_display_mode *mode = &priv->crtc.state->adjusted_mode;
>>>> +	int ret;
>>>> +
>>>> +	if (dp->hpd_status) {
>>>> +		hibmc_dp_hpd_cfg(&priv->dp);
>>>> +		ret = hibmc_dp_prepare(dp, mode);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +
>>>> +		hibmc_dp_display_en(dp, true);
>>>> +	} else {
>>>> +		hibmc_dp_display_en(dp, false);
>>>> +		hibmc_dp_reset_link(&priv->dp);
>>>> +	}
>>> If I understand this correctly, you are using a separate drm_client to
>>> enable and disable the link & display. Why is it necessary? Existing
>>> drm_clients and userspace compositors use drm framework, they should be
>>> able to turn the display on and off as required.
>>>
>> Thanks for your asking, there are cfg/reset process when the connector 's pluging in/out.
>> We want to cfg DP registers again when the connector changes. Not only dp link training, but also cfg
>> the different video modes into DP registers.
> Why? The link training and mode programming should happen during
> pre_enable / enable stage (legacy or atomic).

Hi Dmitry,

Right, that's what I'm curious about. It won't call encoder enble/disable functions when I triggered HPD.
And I'm sure the drm_connector_helper_hpd_irq_event() is called. So I add a drm_client for it.


>>
