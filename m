Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BDE7FB381
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 09:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E7410E0CE;
	Tue, 28 Nov 2023 08:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49217.qiye.163.com (mail-m49217.qiye.163.com
 [45.254.49.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE7810E0CE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 08:03:51 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=HAm8BYCe9hC7NPROBosIMFj9wasb0u+eJOzr6lpMGIMOAg26fKmaMpCkzi9ZRHDPSYlqMJvaTT0l8bHr4NV2vppOqf5wngABHhxCx8bC3YkshxgK479gp0RBsaUgHQ6aqsz+LfRiAV5V6VoiaJzWKoWbOx+VPmz9kwlUAH9AHD0=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
 bh=l5YDICzpqBFa88znUPxe1seE4a0/hNlDkTMuGOSDKdU=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m12762.qiye.163.com (Hmail) with ESMTPA id 01F355C0371;
 Tue, 28 Nov 2023 16:03:46 +0800 (CST)
Message-ID: <ebe46d19-954d-4dbb-82ba-a443058e9f4e@rock-chips.com>
Date: Tue, 28 Nov 2023 16:03:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] drm/rockchip: vop2: clear afbc en and transform
 bit for cluster window at linear mode
Content-Language: en-US
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andyshrk@163.com>
References: <20231122125316.3454268-1-andyshrk@163.com>
 <20231122125425.3454549-1-andyshrk@163.com> <3927498.QCnGb9OGeP@diego>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <3927498.QCnGb9OGeP@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxhCT1ZCSEkYTU1PSR9ISktVEwETFh
 oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk1PSU5JVUpLS1VKQl
 kG
X-HM-Tid: 0a8c14f4a803b229kuuu01f355c0371
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Myo6Lww5Qzw9Sx5MEBY3Ej8I
 AzcKCQ5VSlVKTEtKSk5DTUlDS0tPVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSEtKTTcG
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
Cc: devicetree@vger.kernel.org, s.hauer@pengutronix.de,
 chris.obbard@collabora.com, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Heiko:

On 11/27/23 23:02, Heiko Stübner wrote:
> Am Mittwoch, 22. November 2023, 13:54:25 CET schrieb Andy Yan:
>> From: Andy Yan <andy.yan@rock-chips.com>
>>
>> The enable bit and transform offset of cluster windows should be
>> cleared when it work at linear mode, or we may have a iommu fault
>> issue.
>>
>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> I guess same here?
>
> Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")


I'm not sure if we need a Fixes tag here,  in fact this issue never happens on

rk3566/8 , because the cluster windows of rk356x only support afbc format,

they don't have a chance to switch between afbc and linear mode.

Of course, the lack support of linear mode of rk356x cluster windows is a thoughtless

of IC design, if it really support both afbc and linear format, we indeed need this fix.

The situation is the same as patch 03/12.

So I hope follow your advice, if it need a Fixes tag here.

>
>
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
