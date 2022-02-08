Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C65E4AD542
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 11:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900C010E2B1;
	Tue,  8 Feb 2022 10:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8937110E2B1
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 10:02:03 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E350A83055;
 Tue,  8 Feb 2022 11:02:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1644314521;
 bh=dchY/yJYCaXW8flunvaEXOqNrniVC8MRS0wS/ZjgMFI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZmRpBVPMI3286HMXtgLVcbtiSn3mZ1K3XA5lYQFncFTcfK5inDxKTdw59htZwrklt
 pcLUM1upg2M1wPnRuTpxl1s7yJwwJq6nKifpFaeVi/mujPJbMvChhb8Z+mKO54rbDs
 DboywsNpaI3xe9M/QQtHSaxR6g58xiZM+JLSC8RSzXF5UYexNueDEnroWegRibYKs8
 J3hKQh8YPDTEkPkNmEP+9v4q9dE/+f5lrJpZtGuhmNGAUlWOM+lQY3I6t8gxCiCozY
 5KyvFKEGY45v7QfbwrlTxUBxbLxLAHZeA4ReCoOQ66RBcyu/k8Sfab/1bRoPMfOSpg
 0yTp+w0+o4I7w==
Message-ID: <024db28a-491e-3252-48f7-79f0e2cc2d12@denx.de>
Date: Tue, 8 Feb 2022 11:02:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] [RFC] drm: mxsfb: Implement LCDIF scanout CRC32 support
Content-Language: en-US
To: Liu Ying <victor.liu@oss.nxp.com>, dri-devel@lists.freedesktop.org
References: <20220206185643.275811-1-marex@denx.de>
 <d5ac849dc8aae325d98f215d4f92d492abd909c4.camel@oss.nxp.com>
 <9a2cc781-3277-7e09-530b-05c7361cdaa8@denx.de>
 <1020798373f3f54d1dd7df7174afaeb973ec86ff.camel@oss.nxp.com>
 <49519f3a-060d-feb5-891d-adaad10607e2@denx.de>
 <fc56574745fd53dfcc65425aab7547d9341cd308.camel@oss.nxp.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <fc56574745fd53dfcc65425aab7547d9341cd308.camel@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robert Chiras <robert.chiras@nxp.com>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/8/22 03:41, Liu Ying wrote:

Hello everyone,

>>>> There are many blank areas which are undocumented, this LCDIF
>>>> CRC32
>>>> feature, i.MX8M Mini Arteris NOC at 0x32700000 , the ARM GPV NIC-
>>>> 301
>>>> at
>>>> 0x32{0,1,2,3,4,5,6,8}00000 and their master/slave port mapping.
>>>> The
>>>> NOC
>>>> and NICs were documented at least up to i.MX6QP and then that
>>>> information disappeared from NXP datasheets. I think
>>>> reconfiguring
>>>> the
>>>> NOC/NIC QoS would help mitigate this shift issue described below
>>>> (*).
>>>
>>> I also think the QoS would help if it is configureable.
>>
>> It is programmable, it's just the port mapping which is undocumented.
>>
>>>> Do you know if there is some additional NOC/NIC documentation for
>>>> i.MX8M
>>>> Mini available ?
>>>
>>> No.
>>
>> Can you ask someone internally in NXP maybe ?
> 
> Maybe, you may try community.nxp.com, like the i.MXRT case.

The community.nxp.com is unhelpful, the i.MXRT case it a good example -- 
the solution to the problem has been found by the person who asked the 
question on their own, and elsewhere too.

But note that the i.MXRT interconnect documentation is available in the 
i.MXRT datasheet, which made that possible in the first place. On i.MX, 
all that information has been removed from the datasheet in i.MX7 and 
i.MX8M, so I cannot even help myself, even if I wanted to. This is very bad.
