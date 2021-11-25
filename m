Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EC345DF93
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 18:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3BD6E41D;
	Thu, 25 Nov 2021 17:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7AF6E41D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 17:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u8aXYOsL/gv9/ysyGSMs9eRZRUpowRI2RZmsAFCisIM=; b=VxxtE7uY/kk8ES7pmV5EynZ0OZ
 ZncaP0rsa7gmcUNcSO/DSx707Bo1JOIJRPgpvxpoqR5cK8CtlLMxQE4ZQOUonA/WV/URGilwK7OM6
 41bwu0AhkqkeLDfKIXDbH/AFSwJ2R8UuH1qEiWi1Ndc/QKHqc1aJq+Ja4NgecQSKKF5Z6NSmFN+4Q
 ZeeKwuwFqf9cSw5i+9rWHXfY49I1QBeziE7fCSm6iuPXBgHFrcg1c6EuWKIewAASLVv+bbiHyJwUm
 5zAl/e6JB3Iyx8B83fZ2WfZ6hC5i7hV1YIQd/XB90ijgur/Jw5Kt6a1OM47d0Q8Sqfvn3NOfijbEn
 pT4uA5sA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:49492
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1mqIRb-00018B-7K; Thu, 25 Nov 2021 18:21:59 +0100
Message-ID: <7fb7cb73-40b1-9408-5c19-fe420bd0ee5f@tronnes.org>
Date: Thu, 25 Nov 2021 18:21:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 0/6] drm/tiny/st7735r: Match up with staging/fbtft driver
To: David Lechner <david@lechnology.com>, robh+dt@kernel.org
References: <20211124150757.17929-1-noralf@tronnes.org>
 <eba23198-5c52-6520-079b-d2d41f71dc25@lechnology.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <eba23198-5c52-6520-079b-d2d41f71dc25@lechnology.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dave.stevenson@raspberrypi.com, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 24.11.2021 23.03, skrev David Lechner:
> On 11/24/21 9:07 AM, Noralf Trønnes wrote:
>> Hi,
>>
>> This patchset adds a missing piece for decommissioning the
>> staging/fbtft/fb_st7735r.c driver namely a way to configure the
>> controller from Device Tree.
>>
>> All fbtft drivers have builtin support for one display panel and all
>> other panels using that controller are configured using the Device Tree
>> 'init' property. This property is supported by all fbtft drivers and
>> provides a generic way to set register values or issue commands
>> (depending on the type of controller).
>>
>> It is common for these types of displays to have a datasheet listing the
>> necessary controller settings/commands or some example code doing the
>> same.
>>
>> This is how the panel directly supported by the fb_st7735r staging
>> driver is described using Device Tree with that driver:
>>
>>      width = <160>;
>>      height = <128>;
>>
>>      init = <0x1000001
>>              0x2000096
>>              0x1000011
>>              0x20000ff
>>              0x10000B1 0x01 0x2C 0x2D
>>              0x10000B4 0x07
>>              0x10000C0 0xA2 0x02 0x84
>>              0x10000C1 0xC5
>>              0x10000C2 0x0A 0x00
>>              0x10000C5 0x0E
>>              0x100003a 0x55
>>              0x1000036 0x60
>>              0x10000E0 0x0F 0x1A 0x0F 0x18 0x2F 0x28 0x20 0x22
>>                        0x1F 0x1B 0x23 0x37 0x00 0x07 0x02 0x10
>>              0x10000E1 0x0F 0x1B 0x0F 0x17 0x33 0x2C 0x29 0x2E
>>                        0x30 0x30 0x39 0x3F 0x00 0x07 0x03 0x10
>>              0x1000029
>>              0x2000064>;
>>
>>
>> This is how the same panel is described using the st7735r drm driver and
>> this patchset:
>>
>>      width = <160>;
>>      height = <128>;
>>
>>      frmctr1 = [ 01 2C 2D ];
>>      invctr = [ 07 ];
>>      pwctr1 = [ A2 02 84 ];
>>      pwctr2 = [ C5 ];
>>      pwctr3 = [ 0A 00 ];
>>      vmctr1 = [ 0E ];
>>      madctl = [ 60 ];
>>      gamctrp1 = [ 0F 1A 0F 18 2F 28 20 22 1F 1B 23 37 00 07 02 10 ];
>>      gamctrn1 = [ 0F 1B 0F 17 33 2C 29 2E 30 30 39 3F 00 07 03 10 ];
> 
> Do these setting correspond to actual physical properties of the display?
> 

Apart from width, height, porches, freq and gamma, no not directly, they
configure voltage levels, op-amps (charge pumps?), dividers and such.

> What is the advantage of this compared to just adding a new compatible
> string if a new display requires different settings? (Other than being
> able to use a new display without compiling a new kernel/module.)
> 

There is no other reason, the purpose is simplicity for the end user,
which is one of the reasons for fbtft's success.

> It is nice for the driver implementation to be able to use the byte
> arrays from the binding directly, but it doesn't really make sense from
> a "device tree describes the hardware" point of view.
> 
> For example, looking at the data sheet, frmctr1 looks like it is actually
> multiple properties, the 1-line period, front porch and back porch.
> 

Yes, one command can have several 8-bit parameters and often configures
multiple things even within one parameter.

>>
>>
>> Back when the fbtft drivers were added to staging I asked on the DT
>> mailinglist if it was OK to use the 'init' property but it was turned
>> down. In this patchset I'm trying the same approach used by the
>> solomon,ssd1307fb.yaml binding in describing the attached panel. That
>> binding prefixes the properties with the vendor name, not sure why that
>> is and I think it looks strange so I try without it.
> 
> Because [1] says so?
> 
> "DO use a vendor prefix on device-specific property names. Consider if
> properties could be common among devices of the same class. Check other
> existing bindings for similar devices."
> 

That's a good reason :)

> Do all displays have "frmctr1" or only sitronix displays?
> 

ILI9341 also has that command but with only 2 parameters.
ST7789V calls it FRCTRL2 but has only one parameter.
The FPA and BPA fields from "frmctr1" looks like they're set using other
commands on ILI9341 and ST7789v.

I looked at several datasheets some years back to see if I could see
some kind of pattern, but I couldn't back then at least. Someone with
initimate hw knowledge of these controllers could probably describe a
controller using more generic properties.
This would defeat the purpose of this exercise which is to make it easy
to use any panel. Generic properties would require a set of formulas in
order to go from the init sequence provided by the display manufcaturer
to the generic properties.

The whole point of this patchset is to see if something like the ssd1307
binding can still be done in mainline making it easy for users.

If this doesn't work out, we can start removing drivers from
staging/fbtft since some of them haven't been removed even if the native
panel is supported in drm because they can support any panel through the
init property.

Noralf.

> 
> [1]:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/writing-bindings.html
> 
> 
>>
>> Noralf.
>>
>>
>> Noralf Trønnes (6):
>>    dt-bindings: display: sitronix,st7735r: Fix backlight in example
>>    dt-bindings: display: sitronix,st7735r: Make reset-gpios optional
>>    dt-bindings: display: sitronix,st7735r: Remove spi-max-frequency limit
>>    dt-bindings: display: sitronix,st7735r: Add initialization properties
>>    drm/mipi-dbi: Add device property functions
>>    drm: tiny: st7735r: Support DT initialization of controller
>>
>>   .../bindings/display/sitronix,st7735r.yaml    | 122 ++++++++++++++-
>>   drivers/gpu/drm/drm_mipi_dbi.c                | 139 ++++++++++++++++++
>>   drivers/gpu/drm/tiny/st7735r.c                |  87 +++++++++--
>>   include/drm/drm_mipi_dbi.h                    |   3 +
>>   4 files changed, 334 insertions(+), 17 deletions(-)
>>
> 
