Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB48ACC5DDD
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 04:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63CCB10E1CC;
	Wed, 17 Dec 2025 03:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="ApUr7K7j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 602 seconds by postgrey-1.36 at gabe;
 Wed, 17 Dec 2025 03:08:41 UTC
Received: from mail-m15580.qiye.163.com (mail-m15580.qiye.163.com
 [101.71.155.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B5E10E1CC
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 03:08:41 +0000 (UTC)
Received: from [172.16.12.43] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2d82b3408;
 Wed, 17 Dec 2025 10:53:29 +0800 (GMT+08:00)
Message-ID: <49580dcf-28ec-47e1-83a0-65e16e3d7cdc@rock-chips.com>
Date: Wed, 17 Dec 2025 10:53:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/18] drm/display: bridge_connector: Ensure last
 bridge determines EDID/modes detection capabilities
To: Heiko Stuebner <heiko@sntech.de>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 dianders@chromium.org, m.szyprowski@samsung.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20251021023130.1523707-1-damon.ding@rock-chips.com>
 <DDNXIYL494D2.2N8L1J7XTBT4S@bootlin.com>
 <ff65f453-68a9-41fc-b9e3-02733bba96e3@rock-chips.com>
 <3351986.usQuhbGJ8B@phil>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <3351986.usQuhbGJ8B@phil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b2a3a18bd03a3kunmcb0179dc4d924
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0pCT1ZPT0NLHkMZQ01IGkxWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=ApUr7K7j4T/yGlwwgAFrpOxVUqFD/a1yndvUn+XdRj6uUCvdFSb+qUOyjtg4AxNbCr3sfJ5FIcABvkAm3hUXM4VBCtxaeaMuzferaCWkxK+C8uF5Q6QTdk7/uHHjULqNPliiS7WICt3+vT3RMmm0GoRA4TxExa+pe8xL8JlwV0o=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=ORkOGU2sYY0sjXmEYnHmp1Vc7q0DwAfMuZhejaTUoas=;
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

Hi Heiko,

On 12/16/2025 9:48 PM, Heiko Stuebner wrote:
> Am Mittwoch, 22. Oktober 2025, 03:15:52 Mitteleuropäische Normalzeit schrieb Damon Ding:
>> Hi Luca,
>>
>> On 10/21/2025 6:31 PM, Luca Ceresoli wrote:
>>> Hello Damon,
>>>
>>> On Tue Oct 21, 2025 at 4:31 AM CEST, Damon Ding wrote:
> 
>>>
>>> This does not apply on current drm-misc-next, due to the patch I mentioned
>>> in a previous iteration, now applied as commit 2be300f9a0b6 ("drm/display:
>>> bridge_connector: get/put the stored bridges").
>>>
>>> However I'm sorry I have to mention that patch turned out being buggy, so
>>> I've sent a series to apply a corrected version [0]. I suggest watching the
>>> disucssion about the fix series, and if that gets approved rebase on top of
>>> that and adapt your changes.
>>>
>>> Sorry about the mess. :(
>>>
>>> [0] https://lore.kernel.org/r/20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com
>>>
>>>
>>
>> I saw your fix patches before sending this series. I think your patches
>> will likely be merged relatively quickly, so I plan to wait until the
>> other patches in my patch series are confirmed to be fine, then submit
>> v8 version based on the latest bridge_connector driver. :-)
> 
> I think with 6.19-rc1 out, now is a great time for v8? :-)
> 

Agreed! Luca's patches have been merged. I will reconfirm these commits 
on the latest branch and update v8 in a few day. :-)

Best regards,
Damon

