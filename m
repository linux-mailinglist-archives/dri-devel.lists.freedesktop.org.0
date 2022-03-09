Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 163234D261E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 03:03:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5744010E201;
	Wed,  9 Mar 2022 02:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m121144.qiye.163.com (mail-m121144.qiye.163.com
 [115.236.121.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4131C10E269
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 02:03:09 +0000 (UTC)
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m121144.qiye.163.com (Hmail) with ESMTPA id 293B1AC0613;
 Wed,  9 Mar 2022 10:03:06 +0800 (CST)
Message-ID: <f3af0286-fc64-f011-bc90-6797e26e3640@rock-chips.com>
Date: Wed, 9 Mar 2022 10:03:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 22/24] drm: rockchip: Add VOP2 driver
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>
References: <20220225075150.2729401-1-s.hauer@pengutronix.de>
 <20220225075150.2729401-23-s.hauer@pengutronix.de>
 <bb077f34-333e-a07a-1fcb-702a6807f941@rock-chips.com>
 <CAPj87rO2sztocJrE-CeSQWry9j_cSe2uv9F1Yf81pGnBXdu2Ag@mail.gmail.com>
 <ae4314db-09c0-049b-ccc9-f6b1c3003dcb@rock-chips.com>
 <CAPj87rOanNE1wca3ijJx1zXYZkKX1ta9F145GCXM15Nv=POicA@mail.gmail.com>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <CAPj87rOanNE1wca3ijJx1zXYZkKX1ta9F145GCXM15Nv=POicA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUlKS0tKN1dZLVlBSVdZDwkaFQgSH1lBWRlNS0xWSBkdTU8fHR
 oaHRoZVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktITUpVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PRQ6PQw4Ej5ICTEyTjNPFDZD
 LT8KCk5VSlVKTU9NTEJKSENNQ0lJVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSExLQjcG
X-HM-Tid: 0a7f6c6a657bb039kuuu293b1ac0613
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

On 3/8/22 22:04, Daniel Stone wrote:
> On Tue, 8 Mar 2022 at 08:42, Andy Yan <andy.yan@rock-chips.com> wrote:
>> On 3/7/22 21:09, Daniel Stone wrote:
>>> On Mon, 7 Mar 2022 at 12:18, Andy Yan <andy.yan@rock-chips.com> wrote:
>>>> When run a weston 10.0.0:
>>>>
>>>>     # export XDG_RUNTIME_DIR=/tmp
>>>>     # weston --backend=drm-backend.so --use-pixma --tty=2
>>>> --continue=without-input
>>>>
>>>> I got the following error:
>>>>
>>>> drm_atomic_check_only [PLANE:31:Smart0-win0] CRTC set but no FB
>>> Can you please start Weston with --logger-scopes=log,drm-backend and
>>> attach the output?
>> Please see the weston ouput here[0]
> Are you running with musl perhaps?
Do you mean the C library? I chose uClib-ng in buildroot, not use musl.
> Either way, please make sure your
> libdrm build includes commit 79fa377c8bdc84fde99c6a6ac17e554971c617be.


The upstream buildroot use libdrm2.4.109, this commit[0] if from 
libdrm2.4.110

I cherry-pick this patch to my local libdrm, but has no effect, still 
has "atomic: couldn't commit new state" error.

I have do a search in libdrm and weston, but find no one call 
drmModeAtomicMerge, is that right?

[0]https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/167

>
> Cheers,
> Daniel
