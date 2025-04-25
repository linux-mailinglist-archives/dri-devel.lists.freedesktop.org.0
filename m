Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D757A9C203
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 10:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C16A10E8D5;
	Fri, 25 Apr 2025 08:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=xs4all.nl header.i=@xs4all.nl header.b="C05ahXwG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808E410E8D4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 08:51:11 +0000 (UTC)
X-KPN-MessageId: 93f16712-21b2-11f0-b9a0-005056abbe64
Received: from smtp.kpnmail.nl (unknown [10.31.155.38])
 by ewsoutbound.so.kpn.org (Halon) with ESMTPS
 id 93f16712-21b2-11f0-b9a0-005056abbe64;
 Fri, 25 Apr 2025 10:52:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=xs4all01;
 h=content-type:from:to:subject:mime-version:date:message-id;
 bh=ZUUJHctHfNsWNu1EuQFACb2hrUYidSMtniMgESDbRMU=;
 b=C05ahXwGA4fFgl5pI9IJHaOIC76m8R/+Es89bI5CvWoa6HqeHuMK1mldeMHIPdQDi2kLlgzYGuFDe
 D6MuwZeTwD9wDa1XBMVKPiXUdLXcq+GTqnyBHWJmMljRXk48AhzZTUw4w3JcILCX9BZqxzGIjcGt45
 rVpMjojPveoEKJh8q2SHsNUin5NrH2hHy2UM/ToU41fRmD9iRhfZFZVHgj6RTwNoFsLryLF3BsJztF
 gaTSBezUZK3uueMs3FZ29rF3MDkksrwOCGH4rjzRi2+4egWucO06G46ulnDHCSBicLhtJMzaffZPP7
 sV5V8wKP1no2OVYkOrkoy9/F8HuD5EA==
X-KPN-MID: 33|AF0t4UVO0ldgi6YmnFhYJXqAPxHkuBjosJGcKGQA7S6P7Abi1YftYhe8yCepFKM
 Um9AVCIhpwBzaPi+MzlrzvCTD1SHpo9+IS4F4rFr5JFU=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|nqQMCrwmB3CHOeiz1JE1vwIQX38ApX4EwzMJX9cEX5ZmT/5GDgIxRdtlrbvDrcJ
 3U9+ukECS2iUUeZHN8Kv+nQ==
X-Originating-IP: 80.60.128.215
Received: from [192.168.1.10] (80-60-128-215.fixed.kpn.net [80.60.128.215])
 by smtp.xs4all.nl (Halon) with ESMTPSA
 id 6c670738-21b2-11f0-95a4-005056abf0db;
 Fri, 25 Apr 2025 10:51:06 +0200 (CEST)
Message-ID: <7d0096ad-a290-4fbc-8c06-dba49e8db8af@xs4all.nl>
Date: Fri, 25 Apr 2025 10:51:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/13] media: pci: cx18-av-vbi: Replace open-coded
 parity calculation with parity_odd()
To: Kuan-Wei Chiu <visitorckw@gmail.com>,
 Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, johannes@sipsolutions.net,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, yury.norov@gmail.com,
 akpm@linux-foundation.org, jdelvare@suse.com, linux@roeck-us.net,
 alexandre.belloni@bootlin.com, pgaj@cadence.com, hpa@zytor.com,
 alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Frank.Li@nxp.com, linux-hwmon@vger.kernel.org,
 linux-i3c@lists.infradead.org, david.laight.linux@gmail.com,
 andrew.cooper3@citrix.com, Yu-Chun Lin <eleanor15x@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-4-visitorckw@gmail.com>
 <25b7888d-f704-493b-a2d7-c5e8fff9cfb4@broadcom.com>
 <Z/bDnLzcajzIxey3@visitorckw-System-Product-Name>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <Z/bDnLzcajzIxey3@visitorckw-System-Product-Name>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/04/2025 20:59, Kuan-Wei Chiu wrote:
> On Wed, Apr 09, 2025 at 08:43:09PM +0200, Arend van Spriel wrote:
>> On 4/9/2025 5:43 PM, Kuan-Wei Chiu wrote:
>>> Refactor parity calculations to use the standard parity_odd() helper.
>>> This change eliminates redundant implementations.
>>>
>>> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
>>> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
>>> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
>>> ---
>>>   drivers/media/pci/cx18/cx18-av-vbi.c | 12 ++----------
>>>   1 file changed, 2 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/media/pci/cx18/cx18-av-vbi.c b/drivers/media/pci/cx18/cx18-av-vbi.c
>>> index 65281d40c681..15b515b95956 100644
>>> --- a/drivers/media/pci/cx18/cx18-av-vbi.c
>>> +++ b/drivers/media/pci/cx18/cx18-av-vbi.c
>>
>> [...]
>>
>>> @@ -278,7 +270,7 @@ int cx18_av_decode_vbi_line(struct v4l2_subdev *sd,
>>>   		break;
>>>   	case 6:
>>>   		sdid = V4L2_SLICED_CAPTION_525;
>>> -		err = !odd_parity(p[0]) || !odd_parity(p[1]);
>>> +		err = !parity_odd(p[0]) || !parity_odd(p[1]);
>>
>> No need to call parity_odd() twice here. Instead you could do:
>>
>> 		err = !parity_odd(p[0] ^ p[1]);

I prefer the original approach, it is easier to understand. Performance
is not an issue here, clarity of the code is more important.

So for this patch (i.e. this v4 version):

Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>

>>
>> This is orthogonal to the change to parity_odd() though. More specific to
>> the new parity_odd() you can now do following as parity_odd() argument is
>> u64:
>>
>> 		err = !parity_odd(*(u16 *)p);
>>
>>
> Thanks for the feedback!
> Would you prefer this change to be part of the parity() conversion
> patch, or in a separate one?

Just leave it as-is, as mentioned above.

Regards,

	Hans

> 
> Regards,
> Kuan-Wei

