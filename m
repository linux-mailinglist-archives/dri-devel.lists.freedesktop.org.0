Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 059777EBB0D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 03:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548A810E34C;
	Wed, 15 Nov 2023 02:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49219.qiye.163.com (mail-m49219.qiye.163.com
 [45.254.49.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A4E10E34C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 02:02:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=cQL6kMnPwtYJPZmko8Td+ZApmq1jNNukWYBHvhKvj8hVAfTk5NonJgjr+fwoA5JD0T9dIkwepsZsXBEzLC9e9SnbD6pZSkoZhzwJUcGaCxwtNtF0Ovhz+S+ha2KfBAdwP/Bc24TNh5mMseFc+yMfg7kvzRquzlnqrOiRSLc3rBw=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
 bh=+0r5sfkCBJ8BY7925qHZXtbfyibcqRxLotDg68tTO/w=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m12779.qiye.163.com (Hmail) with ESMTPA id 9B9917801EF;
 Wed, 15 Nov 2023 10:02:42 +0800 (CST)
Message-ID: <b8605ecb-0244-4ff7-8338-759011dee1b3@rock-chips.com>
Date: Wed, 15 Nov 2023 10:02:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] drm/rockchip: vop2: Add support for rk3588
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andyshrk@163.com>
References: <20231114112534.1770731-1-andyshrk@163.com>
 <20231114112855.1771372-1-andyshrk@163.com> <7034316.0VBMTVartN@diego>
Content-Language: en-US
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <7034316.0VBMTVartN@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxlKQ1YeTU9MHx1PQ0weSU9VEwETFh
 oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk1PSU5JVUpLS1VKQl
 kG
X-HM-Tid: 0a8bd0b76993b24fkuuu9b9917801ef
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PyI6OCo5Fzw2TE4sPgMRN00*
 GRIaCRVVSlVKTEtLS0pITE1ITk5OVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSEpNTjcG
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

On 11/15/23 07:34, Heiko Stübner wrote:
> Hi Andy,
>
> Am Dienstag, 14. November 2023, 12:28:55 CET schrieb Andy Yan:
>> From: Andy Yan <andy.yan@rock-chips.com>
>>
>> VOP2 on rk3588:
>>
>> Four video ports:
>> VP0 Max 4096x2160
>> VP1 Max 4096x2160
>> VP2 Max 4096x2160
>> VP3 Max 2048x1080
>>
>> 4 4K Cluster windows with AFBC/line RGB and AFBC-only YUV support
>> 4 4K Esmart windows with line RGB/YUV support
>>
>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> not a review yet, but when testing and the display sets a mode,
> I always get a bunch of
>
> 	rockchip-drm display-subsystem: [drm] *ERROR* POST_BUF_EMPTY irq err at vp0
>
> messages in the log (initial mode to console, starting glmark2 from console,
> stopping glmark2 to the console).
>
> I'm not sure what is up with that, have you seen these messages as well
> at some point?

Yes, it will raise POST_BUF_EMPTY when set a mode,  it needs some fix 
like [0]:


I still trying to find a appropriate way to do it with the upstream 
code, as it doesn't affect the

real display function(I must admit that the POST_BUF_EMPTY irq is very 
annoying), so l let  it as

it is in the current version.

By the way, can you see the glmark2 rending on your HDMI monitor now?

[0]https://github.com/Fruit-Pi/kernel/commit/29af993b46f024360e6d02c0d26c9fd3057aa918

>
> Thanks
> Heiko
>
>
>
