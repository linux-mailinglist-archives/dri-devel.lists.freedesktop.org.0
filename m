Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE11E4B0935
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 10:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C514010E7A1;
	Thu, 10 Feb 2022 09:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007B810E7A1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 09:11:54 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4CBCB815D1;
 Thu, 10 Feb 2022 10:11:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1644484313;
 bh=CRnX4uqVb40YYEa04jJVtdzOTBsvwyrHFVDn1nJppRc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GjQ6em9Wj5B6hcc80NHpNJe48LCGmrCT7Ov88TukC3opzRy5G3jmKieG5v7W91Wyx
 bkVtiwprmbsYQ5qL3GpoXLkZhJ8pTd3mnP22mS/UhJ1b1NfwrFPGPens5xBcEzEqV6
 G0aUKtEt2wFHkbw88l+3FeFjcaZON4SFA/mNFOp7bFOH1WFIPIE7LmLlgEq8fLPJB6
 uBPEfBEZQNBRSg38JMWotitCMWaGSbr5+Z/rZfsH9fuq/tFGL/5cmGLYfA5cfgwSrL
 DZgv6Cf2S1Ti6gQnc402Vwyya10QF4jV8BQzfct726hzG2bI+eK++ukJPKEZMMkuHD
 40OXqqvgFj+7Q==
Message-ID: <6f7cdef3-851d-a371-9de4-dc7c019b80ae@denx.de>
Date: Thu, 10 Feb 2022 10:11:51 +0100
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
 <024db28a-491e-3252-48f7-79f0e2cc2d12@denx.de>
 <695e387cf1cbe12060a394095322ea9bcf824678.camel@oss.nxp.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <695e387cf1cbe12060a394095322ea9bcf824678.camel@oss.nxp.com>
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
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robert Chiras <robert.chiras@nxp.com>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/10/22 06:22, Liu Ying wrote:

Hi,

[...]

>>>>>> There are many blank areas which are undocumented, this LCDIF
>>>>>> CRC32
>>>>>> feature, i.MX8M Mini Arteris NOC at 0x32700000 , the ARM GPV
>>>>>> NIC-
>>>>>> 301
>>>>>> at
>>>>>> 0x32{0,1,2,3,4,5,6,8}00000 and their master/slave port
>>>>>> mapping.
>>>>>> The
>>>>>> NOC
>>>>>> and NICs were documented at least up to i.MX6QP and then that
>>>>>> information disappeared from NXP datasheets. I think
>>>>>> reconfiguring
>>>>>> the
>>>>>> NOC/NIC QoS would help mitigate this shift issue described
>>>>>> below
>>>>>> (*).
>>>>>
>>>>> I also think the QoS would help if it is configureable.
>>>>
>>>> It is programmable, it's just the port mapping which is
>>>> undocumented.
>>>>
>>>>>> Do you know if there is some additional NOC/NIC documentation
>>>>>> for
>>>>>> i.MX8M
>>>>>> Mini available ?
>>>>>
>>>>> No.
>>>>
>>>> Can you ask someone internally in NXP maybe ?
>>>
>>> Maybe, you may try community.nxp.com, like the i.MXRT case.
>>
>> The community.nxp.com is unhelpful, the i.MXRT case it a good example
>> -- 
>> the solution to the problem has been found by the person who asked
>> the
>> question on their own, and elsewhere too.
> 
> AFAIK, there are questions answered by internal support team and RnD
> team at that community.  I personally take it as a resource to use.

Sure, here is a list of links to similar problem triggered by various 
people using the NXP BSP, neither of them in answered:

https://community.nxp.com/t5/i-MX-Processors/Image-shift-right-for-LVDS/td-p/969581
https://community.nxp.com/t5/i-MX-Processors/iMX8M-display-shifted-after-playing-decoded-video-with-gstreamer/td-p/928269
https://community.nxp.com/t5/i-MX-Processors/Display-Wrap-Around-Issue/td-p/1084052
https://community.nxp.com/t5/i-MX-Processors/Display-Vertically-shifted-IMX8mq-evk-board-in-dual-display-use/m-p/965726
https://community.nxp.com/t5/i-MX-RT/iMXRT1052-LCD-Screen-shifted/td-p/1069978

>> But note that the i.MXRT interconnect documentation is available in
>> the
>> i.MXRT datasheet, which made that possible in the first place. On
>> i.MX,
>> all that information has been removed from the datasheet in i.MX7
>> and
>> i.MX8M, so I cannot even help myself, even if I wanted to. This is
>> very bad.
> 
> I'm not familiar with the documention in that area, so I personally
> will not be helpful at the documention topic.  The main purpose I
> jumped in this thread is to review the patch and share the idea to use
> the existing drm debugfs crc support instead of creating a sysfs
> attribute.

Can you maybe ask someone inside NXP about this problem ?
