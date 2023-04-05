Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 185706D7750
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 10:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2222510E88A;
	Wed,  5 Apr 2023 08:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3768810E88A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 08:50:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 82D8062306;
 Wed,  5 Apr 2023 08:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26631C4339B;
 Wed,  5 Apr 2023 08:50:39 +0000 (UTC)
Message-ID: <dddd76a7-f882-f1dd-0781-fcc1f9b4e060@xs4all.nl>
Date: Wed, 5 Apr 2023 10:50:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RESEND PATCH v4 03/21] staging: media: tegra-video: fix
 .vidioc_enum_fmt_vid_cap to return all formats
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230309144320.2937553-1-luca.ceresoli@bootlin.com>
 <20230309144320.2937553-4-luca.ceresoli@bootlin.com>
 <85268d69-3d3b-2c0f-ba26-073f09052362@xs4all.nl>
 <20230404161251.272cc78b@booty>
 <20230405023048.GD9915@pendragon.ideasonboard.com>
 <20230405103134.2ae10766@booty>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230405103134.2ae10766@booty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Leitner <richard.leitner@skidata.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/04/2023 10:31, Luca Ceresoli wrote:
> Hi Laurent,
> 
> On Wed, 5 Apr 2023 05:30:48 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> 
>> Hi Luca,
>>
>> On Tue, Apr 04, 2023 at 04:12:51PM +0200, Luca Ceresoli wrote:
>>> On Wed, 29 Mar 2023 13:16:22 +0200 Hans Verkuil wrote:
>>>   
>>>> Hi Luca,
>>>>
>>>> I finally found the time to test this series. It looks OK, except for this patch.  
>>>
>>> Thank you very much for taking the time!
>>>   
>>>> The list of supported formats really has to be the intersection of what the tegra
>>>> supports and what the sensor supports.
>>>>
>>>> Otherwise you would advertise pixelformats that cannot be used, and the application
>>>> would have no way of knowing that.  
>>>
>>> As far as I understand, I think we should rather make this driver fully
>>> behave as an MC-centric device. It is already using MC quite
>>> successfully after all.
>>>
>>> Do you think this is correct?  
>>
>> Given the use cases for this driver, I agree.

I disagree.

This driver doesn't use the media controller for anything at the moment. The
/dev/mediaX device just shows the internal topology (i.e. connected sensors),
but otherwise it does nothing.

While it would be great if we could unlock the ISP on the Tegra, the reality
is that it is entirely closed source and can't be used in a linux driver, and
that's not going to change, sadly.

That leaves us with just a basic CSI capture driver. Rather than trying to
change this driver to a full MC device with no benefits, just drop this change
and get your code in.

Note that this driver will stay in staging since it still fails when I try to
capture from two sensors at the same time: syncpoint errors start appearing
in that case. I think there are locking issues. I think I have someone to take
a look at that, but first I want your series to get merged.

In the very unlikely event that the ISP can be implemented in a linux driver,
it will probably become a new driver.

Regards,

	Hans

> 
> Ok, thanks for the feedback. I will send a v5 with this change.
> 
> Best regards,
> Luca
> 

