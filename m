Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB5FB98B69
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 09:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A8E10E227;
	Wed, 24 Sep 2025 07:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="fPQCPCQ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m155104.qiye.163.com (mail-m155104.qiye.163.com
 [101.71.155.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E78F10E227
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 07:59:01 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 23e428d4b;
 Wed, 24 Sep 2025 15:58:56 +0800 (GMT+08:00)
Message-ID: <8006587a-131a-4e2e-b32b-d7cdfe8716c8@rock-chips.com>
Date: Wed, 24 Sep 2025 15:58:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/17] drm/exynos: exynos_dp: Add legacy bridge to
 parse the display-timings node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dianders@chromium.org, m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-8-damon.ding@rock-chips.com>
 <xwenycscalzdlpuxytorbiyvej3k7pv3lhxwtadilxq65ipwsv@x5rxm53w5e22>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <xwenycscalzdlpuxytorbiyvej3k7pv3lhxwtadilxq65ipwsv@x5rxm53w5e22>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a997abb8e4e03a3kunmd0821eb84bbdd6
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh1LSlZIQ0kfH0xNGE4dS0tWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=fPQCPCQ3uNzh5jXbF1GIeYUySqLOebeBw4w0FhfPw9EI4rdlhRwcE+q9UuYL9BHKzKH6+Ofs557sOKLYLFVqLFbb1+6k+Y5m6vozg6QzLae2vlKXPwIxLQavPC/kAZUbjj/2EbLGyn+8bCkebzPaoC95r0ZAHJUpYdh6ZTU4eFE=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=6dCejOxC2RXZr3efQHfWFC5w8CjvBk/FQ9sP2EuTN7w=;
 h=date:mime-version:subject:message-id:from;
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

Hi Dmitry,

On 9/12/2025 6:51 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 12, 2025 at 04:58:36PM +0800, Damon Ding wrote:
>> If there is neither a panel nor a bridge, the display timing can be
>> parsed from the display-timings node under the dp node.
>>
>> Adding a legacy bridge to parse the display-timings node would get
>> rid of &analogix_dp_plat_data.get_modes() and make the codes more
>> consistent.
> 
> If it's the same as imx-legacy-bridge, it might make sense to pull it
> out of imx/ subdir and use it as is.
> 

Yeah, I will move it to the path drivers/gpu/drm/bridge/ and perform the 
necessary renaming.

>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   drivers/gpu/drm/exynos/exynos_dp.c | 132 ++++++++++++++++++-----------
>>   1 file changed, 82 insertions(+), 50 deletions(-)
>>
> 

Best regards,
Damon

