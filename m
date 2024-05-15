Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C25018C6007
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 07:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6477810E04A;
	Wed, 15 May 2024 05:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="BwNgg371";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CB110E04A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 05:07:08 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44F56qja124834;
 Wed, 15 May 2024 00:06:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1715749613;
 bh=lr7ZZX9mxqPIcMui9i6bdbeAkLlgyW616D+DtDq0tQ8=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=BwNgg371V+3EN4fDtVfg0pehr5vy/SAAa99UL634VYHudr7nMcX8e/2xkUL+AiE+7
 jH8SX99G7N8n3+CBJcpS+xoeOcjx/wgzaIADMH86ulty0kp9NAsg/kwBDUTDL9Kk0v
 xFp1f4YL1nm8ipvRDzLVJYupmTTSNhjifSf5CxUY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44F56q9K084315
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 15 May 2024 00:06:52 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 15
 May 2024 00:06:52 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 15 May 2024 00:06:52 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be
 forged))
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44F56ijO048285;
 Wed, 15 May 2024 00:06:45 -0500
Message-ID: <d8df8023-daac-380a-0591-59c920d6eacd@ti.com>
Date: Wed, 15 May 2024 10:36:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v7 7/8] media: imagination: Round to closest multiple for
 cropping region
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
CC: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
 <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>,
 <dri-devel@lists.freedesktop.org>, <laurent.pinchart@ideasonboard.com>,
 <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>,
 <j-luthra@ti.com>, <b-brnich@ti.com>, <detheridge@ti.com>,
 <p-mantena@ti.com>, <vijayp@ti.com>, <andrzej.p@collabora.com>,
 <p.zabel@pengutronix.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <akpm@linux-foundation.org>, <gregkh@linuxfoundation.org>,
 <adobriyan@gmail.com>, <jani.nikula@intel.com>
References: <20240509184001.4064820-1-devarsht@ti.com>
 <Zj447ePSnccbj76v@smile.fi.intel.com>
 <7e3ad816-6a2a-4e02-9b41-03a8562812ad@ti.com>
 <432f336e6d4b0666cfbb431591624d0e1fefd773.camel@ndufresne.ca>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <432f336e6d4b0666cfbb431591624d0e1fefd773.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

Hi Nicolas,

Thanks for the review.

On 15/05/24 01:52, Nicolas Dufresne wrote:
> Le samedi 11 mai 2024 à 22:38 +0530, Devarsh Thakkar a écrit :
>> Hi Andy,
>>
>> Thanks for the quick review.
>> On 10/05/24 20:40, Andy Shevchenko wrote:
>>> On Fri, May 10, 2024 at 12:10:01AM +0530, Devarsh Thakkar wrote:
>>>> If neither of the flags to round down (V4L2_SEL_FLAG_LE) or round up
>>>> (V4L2_SEL_FLAG_GE) are specified by the user, then round to nearest
>>>> multiple of requested value while updating the crop rectangle coordinates.
>>>>
>>>> Use the rounding macro which gives preference to rounding down in case two
>>>> nearest values (high and low) are possible to raise the probability of
>>>> cropping rectangle falling inside the bound region.
>>>
>>> This is arguable. How do we know that the bigger range is supported?
>>> The safest side is to go smaller than bigger.
>>>
>>
>> Yes and that's what the driver does when do when application passes
>>  while doing the selection. If application does not
>> specify explicitly whether to round down or round up the cropping
>> parameters requested by it (i.e app is neither passing V4L2_SEL_FLAG_LE
>> nor V4L2_SEL_FLAG_GE flags), then it is preferred by driver to round the
>> cropping parameters to nearest possible value by either rounding down or
>> rounding up to align with hardware requirements.
>>
>> For e.g. If requested width for cropping region is 127 and HW requires
>> width to be multiple of 64 then we would prefer to round it up to 128
>> rather than rounding down to a more distant value (i.e. 64), but if
>> requested cropping width is 129 then we would prefer to instead round it
>> down to 128. But if requested cropping width is 160 then there are two
>> nearest possible values 160 - 32 = 128 and 160 + 32 = 192 and in which
>> case we prefer the smaller value as you suggested and that's why the
>> driver uses round_closest_down.
>>
>> For any reason, if still the cropping rectangle falls beyond the bound
>> region, then driver will return out of range error (-ERANGE) to
>> application.
> 
> I would appreciate if this change was based on specification text, meaning
> improving the next if that behaviour is undefined. We might not be able to fix
> it everywhere, but we can recommend something.
> 

Yes, this change is based on specification text. This complies with the
VIDIOC_G_SELECTION, VIDIOC_S_SELECTION ioctl description as documented in
v4l uapi [1] which means driver should choose crop rectangle as close as
possible if no flags are passed by user-space, as quoted below :

"``0`` - The driver can adjust the rectangle size freely and shall
 choose a crop/compose rectangle as close as possible to the requested
 one."

If the user-space has specific requirement to either round down, round up or
honor exact values, it should pass V4L2_SEL_FLAG_LE, V4L2_SEL_FLAG_GE or
V4L2_SEL_FLAG_LE | V4L2_SEL_FLAG_GE flags respectively.

[1]
https://www.kernel.org/doc/Documentation/userspace-api/media/v4l/vidioc-g-selection.rst#:~:text=compose%20rectangle%20as-,close,-as%20possible%20to

Regards
Devarsh
