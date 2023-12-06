Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092B4806DE0
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 12:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1EC610E6E4;
	Wed,  6 Dec 2023 11:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m127213.xmail.ntesmail.com
 (mail-m127213.xmail.ntesmail.com [115.236.127.213])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C4110E6E3
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 11:27:37 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=CGNhd4sjVn5tsHiRRxZ+t3cUlpsvFLcZiVcSSq+FAgX0kIHfaDkoFGroR1A9sALxte2BSIjPb01MqW/ghoKP/q2t2kg5dVxhU4wvHT3dsdr/j0//cydNaZzdKQEgrgL3zl7HqGgdjUL8YLlSZAUurhwuceBCx0aVcGSIw1MTPO4=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
 bh=mIp43tx+cz3waI2qLXLmWvwYJEbJny5dp/W8y+Cp4Dk=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m12779.qiye.163.com (Hmail) with ESMTPA id B6404780300;
 Wed,  6 Dec 2023 19:27:31 +0800 (CST)
Message-ID: <8140e2f4-2081-4492-af17-ce742eef4404@rock-chips.com>
Date: Wed, 6 Dec 2023 19:27:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/14] drm/rockchip: vop2: Add debugfs support
Content-Language: en-US
To: Sascha Hauer <sha@pengutronix.de>
References: <20231130122001.12474-1-andyshrk@163.com>
 <20231130122449.13432-1-andyshrk@163.com>
 <20231205091541.GV1057032@pengutronix.de>
 <593f1092-3f5b-42ab-bc6e-dbd0fc8fb8ba@rock-chips.com>
 <20231206112053.GA1318922@pengutronix.de>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20231206112053.GA1318922@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0hOSVZPGEgdHUNMQkkfHxhVEwETFh
 oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk1PSU5JVUpLS1VKQl
 kG
X-HM-Tid: 0a8c3ee210d1b24fkuuub6404780300
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MTY6Cxw5ODwrElEyPQ8yPBES
 KiMwCjVVSlVKTEtKQ01JS05JTk9OVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSEpMTjcG
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
Cc: devicetree@vger.kernel.org, chris.obbard@collabora.com, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sascha:

On 12/6/23 19:20, Sascha Hauer wrote:
> On Wed, Dec 06, 2023 at 06:20:58PM +0800, Andy Yan wrote:
>> Hi Sascha:
>>
>>>> +	unsigned int n = vop2->data->regs_dump_size;
>>>
>>> 'n' is used only once, it might be clearer just to use the value where
>>> needed and drop the extra variable.
>>
>> Okay, will do.
>>>
>>>> +	unsigned int i;
>>>> +
>>>> +	drm_modeset_lock_all(drm_dev);
>>>> +
>>>> +	if (vop2->enable_count) {
>>>> +		for (i = 0; i < n; i++) {
>>>> +			dump = &vop2->data->regs_dump[i];
>>>> +			vop2_regs_print(vop2, s, dump, false);
>>>> +		}
>>>> +	} else {
>>>> +		seq_printf(s, "VOP disabled:\n");
>>>
>>> There's nothing following after the ':', right? Then this should be
>>> "VOP: disabled\n" or without the colon at all.
>>
>> the colon will be droped in next versin.
>>
>>>
>>>> +	}
>>>> +	drm_modeset_unlock_all(drm_dev);
>>>
>>> This code is repeated in vop2_active_regs_show() below. Maybe factor
>>> this out to a common function?
>>>
>>
>>
>> Do you mean all the code between drm_modeset_lock_all and drm_modeset_unlock_all ?
> 
> Including drm_modeset_lock_all() and drm_modeset_unlock_all(), yes.
> 

Okay, will try in v4.


> Sascha
> 
