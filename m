Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2443A4D299A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 08:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8EB910E3AA;
	Wed,  9 Mar 2022 07:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m121144.qiye.163.com (mail-m121144.qiye.163.com
 [115.236.121.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F80610E3AA
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 07:37:51 +0000 (UTC)
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m121144.qiye.163.com (Hmail) with ESMTPA id 41C10AC0283;
 Wed,  9 Mar 2022 15:37:49 +0800 (CST)
Message-ID: <30f195d6-e9d7-3da6-89fa-4a064a1f6bf9@rock-chips.com>
Date: Wed, 9 Mar 2022 15:37:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 22/24] drm: rockchip: Add VOP2 driver
Content-Language: en-US
From: Andy Yan <andy.yan@rock-chips.com>
To: Daniel Stone <daniel@fooishbar.org>
References: <20220225075150.2729401-1-s.hauer@pengutronix.de>
 <20220225075150.2729401-23-s.hauer@pengutronix.de>
 <bb077f34-333e-a07a-1fcb-702a6807f941@rock-chips.com>
 <CAPj87rO2sztocJrE-CeSQWry9j_cSe2uv9F1Yf81pGnBXdu2Ag@mail.gmail.com>
 <ae4314db-09c0-049b-ccc9-f6b1c3003dcb@rock-chips.com>
 <CAPj87rOanNE1wca3ijJx1zXYZkKX1ta9F145GCXM15Nv=POicA@mail.gmail.com>
 <f3af0286-fc64-f011-bc90-6797e26e3640@rock-chips.com>
In-Reply-To: <f3af0286-fc64-f011-bc90-6797e26e3640@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUlKS0tKN1dZLVlBSVdZDwkaFQgSH1lBWRlDGhpWSk5JSEJOGh
 1OSRoeVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktITUpVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PjY6Qyo4Cz5IMzAYFSwLUU8N
 PQsKFBhVSlVKTU9NQ0pKT01CQktKVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBT0hMSTcG
X-HM-Tid: 0a7f6d9cd74ab039kuuu41c10ac0283
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

On 3/9/22 10:03, Andy Yan wrote:
> Hi Daniel:
>
> On 3/8/22 22:04, Daniel Stone wrote:
>> On Tue, 8 Mar 2022 at 08:42, Andy Yan <andy.yan@rock-chips.com> wrote:
>>> On 3/7/22 21:09, Daniel Stone wrote:
>>>> On Mon, 7 Mar 2022 at 12:18, Andy Yan <andy.yan@rock-chips.com> wrote:
>>>>> When run a weston 10.0.0:
>>>>>
>>>>>     # export XDG_RUNTIME_DIR=/tmp
>>>>>     # weston --backend=drm-backend.so --use-pixma --tty=2
>>>>> --continue=without-input
>>>>>
>>>>> I got the following error:
>>>>>
>>>>> drm_atomic_check_only [PLANE:31:Smart0-win0] CRTC set but no FB
>>>> Can you please start Weston with --logger-scopes=log,drm-backend and
>>>> attach the output?
>>> Please see the weston ouput here[0]
>> Are you running with musl perhaps?
> Do you mean the C library? I chose uClib-ng in buildroot, not use musl.
>> Either way, please make sure your
>> libdrm build includes commit 79fa377c8bdc84fde99c6a6ac17e554971c617be.
>
>
> The upstream buildroot use libdrm2.4.109, this commit[0] if from 
> libdrm2.4.110
>
> I cherry-pick this patch to my local libdrm, but has no effect, still 
> has "atomic: couldn't commit new state" error.
>
> I have do a search in libdrm and weston, but find no one call 
> drmModeAtomicMerge, is that right?
>
> [0]https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/167
>

With your patch applied from libdrm2.4.110, I do a make clean for 
buidlroot, than build it again,  That's take effect.

I can see only the second value (non-zero FB) of plane 31 commit to the 
kernel. So this is works.

Maybe the buidroot should update libdrm package.

Thank you.

>>
>> Cheers,
>> Daniel
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
