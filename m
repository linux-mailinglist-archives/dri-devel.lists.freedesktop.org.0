Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4374DA747
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 02:14:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8CD89F6B;
	Wed, 16 Mar 2022 01:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m121144.qiye.163.com (mail-m121144.qiye.163.com
 [115.236.121.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4449D89FD4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 01:14:38 +0000 (UTC)
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m121144.qiye.163.com (Hmail) with ESMTPA id 20987AC02AF;
 Wed, 16 Mar 2022 09:14:35 +0800 (CST)
Message-ID: <baaf0a2e-72ee-1e6a-a99f-a68e8371d844@rock-chips.com>
Date: Wed, 16 Mar 2022 09:14:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v8 22/24] drm: rockchip: Add VOP2 driver
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>
References: <20220311083323.887372-1-s.hauer@pengutronix.de>
 <20220311083323.887372-23-s.hauer@pengutronix.de>
 <9ec29d9b-8197-98fb-c612-5c842e4212c4@rock-chips.com>
 <CAPj87rM4StzGMqPfK=j5p0-mY2=ENZnZWx9QDL_jo8SzNTXWTQ@mail.gmail.com>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <CAPj87rM4StzGMqPfK=j5p0-mY2=ENZnZWx9QDL_jo8SzNTXWTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUlKS0tKN1dZLVlBSVdZDwkaFQgSH1lBWUJOHxpWGR4eGkMZGU
 waQh5CVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktDSUNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NyI6Lio5Nj5RTi41DRhNNBM3
 OhVPCjpVSlVKTU9MSEJISUxOTEtLVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBT05ISDcG
X-HM-Tid: 0a7f904a7e25b039kuuu20987ac02af
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel:

On 3/15/22 20:43, Daniel Stone wrote:
> Hi Andy,
>
> On Tue, 15 Mar 2022 at 06:46, Andy Yan <andy.yan@rock-chips.com> wrote:
>> On 3/11/22 16:33, Sascha Hauer wrote:
>>> The driver is tested with HDMI and MIPI-DSI display on a RK3568-EVB
>>> board. Overlay support is tested with the modetest utility. AFBC support
>>> on the cluster windows is tested with weston-simple-dmabuf-egl on
>>> weston using the (yet to be upstreamed) panfrost driver support.
>> Do we need some modification to test AFBC by weston-simple-dma-egl ?
>>
>> I have a buildroot system with weston-10.0.9 and mesa 21.3.5.
>>
>> After launch weston, I run weston-simple-dmabuf-egl, but from the output
>>
>> of sys/kernel/debug/dri/0/state, the weston is still use Smart0-win0,
>> which is
>>
>> a non-AFBC window.
>>
>> Do i need to modify the vop2 driver to set one Cluster window as primary
>> plane?
> Are you using the open-source Panfrost driver, or the proprietary Arm
> DDK? The DDK was previously using some non-standard modifier tokens
> which have since been corrected upstream.


I use mesa 21.3.5 with open-source Panfrost driver enabled.

When I modify Sascha's vop2 driver, set a Cluster windows as primary plane,

Then launch weston,  vop2 report POST_BUF_EMPTY irq err.

 From the log I can see many "panfrost fde60000.gpu: js fault, js=0, 
status=DATA_INVALID_FAULT" [0]

I check the register configuration of Cluster window, there is no 
obvious error.

I event run a ovltest[1] written by myself feed a AFBC RGB data to 
Cluster0.  it can display ok.

It seems that the basic afbc configuration of vop2 is right, but 
something is wrong with Panfrost?

[0]https://pastebin.com/ydZkSz1f

[1]https://gitee.com/andyshrk/drm/tree/master/tests/ovltest

>
> You can see from running `weston-debug drm-backend` (if you start
> Weston with `--debug`) the output as it tries to put client surfaces
> on to overlay planes, and why it can or cannot.
>
> For Weston's own composited output (used when it cannot place client
> surfaces on to planes), it will just use whatever the KMS driver
> declares as the primary plane. Weston does not have any logic to say
> 'oh, this plane is AFBC and AFBC is better, so I will use this as my
> primary plane': we just follow what the kernel tells us.
>
> Cheers,
> Daniel
