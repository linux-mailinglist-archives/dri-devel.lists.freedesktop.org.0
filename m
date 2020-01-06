Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB5D13168B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 18:12:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B72F6E4B0;
	Mon,  6 Jan 2020 17:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3886E4B0
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 17:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gd1okxm5mNyxuAUIvuHeiOrruEoAV61d7/a5N+284jc=; b=qLgX2AGskDf+/YeIbS8utXjQ6s
 Gs3XXQkuzcfq9uwT4s5myPh/61JxR3YRaY6q0UqtfNvzc4MfVY87U1U4YbNMUG9jYOtxoXdSKVygR
 Ezygo8MGVoEZ7jKVzh9Hu0rdSwDnhMzOdjUBtEOMuvscbUAKUjAH1ONjDIurZhwikGP+WMNTy86Do
 /imjNqDQV/6/bK75hj3QkYxyqpWpsBjz82WGDAWrLLQuP989IHP9KUlHAb1wk4F0c0TbKkVyiVZCj
 iev4LeOmVDe9l465Gvu625HAu21K+Fry3ZDTJtTYvkHH1EZTRF63U0U9Y43UKVlKhC31eN+W9a4Hb
 EVh78ASg==;
Received: from [2600:1700:4830:165f::fb2] (port=55314)
 by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <david@lechnology.com>)
 id 1ioVvP-00063C-3R; Mon, 06 Jan 2020 12:12:19 -0500
Subject: Re: [PATCH 3/3] drm: tiny: st7735r: Add support for Okaya RH128128T
To: Geert Uytterhoeven <geert@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>
References: <20200102141246.370-1-geert+renesas@glider.be>
 <20200102141246.370-4-geert+renesas@glider.be>
 <20200105091303.GB29102@ravnborg.org>
 <CAMuHMdUL3tCZzCDyJkmqYT5n+-t+Z-Ubo4=+NJpHpZU1w5C07g@mail.gmail.com>
From: David Lechner <david@lechnology.com>
Message-ID: <893b059c-fd7d-3c21-384c-da33af595ffb@lechnology.com>
Date: Mon, 6 Jan 2020 11:12:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUL3tCZzCDyJkmqYT5n+-t+Z-Ubo4=+NJpHpZU1w5C07g@mail.gmail.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Chris Brandt <chris.brandt@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/6/20 3:28 AM, Geert Uytterhoeven wrote:
> Hi Sam,
> 
> On Sun, Jan 5, 2020 at 10:13 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>> Good to see we add more functionality to the smallest driver in DRM.
>> The patch triggered a few comments - see below.
>> Some comments relates to the original driver - and not your changes.
> 
> Thanks for your comments!
> 
>> On Thu, Jan 02, 2020 at 03:12:46PM +0100, Geert Uytterhoeven wrote:
>>> Add support for the Okaya RH128128T display to the st7735r driver.
>>>
>>> The RH128128T is a 128x128 1.44" TFT display driven by a Sitronix
>>> ST7715R TFT Controller/Driver.  The latter is very similar to the
>>> ST7735R, and can be handled by the existing st7735r driver.
>>
>> As a general comment - it would have eased review if this was split
>> in two patches.
>> One patch to introduce the infrastructure to deal with another set of
>> controller/display and one patch introducing the new combination.
> 
> I had thought about that, but didn't pursue as the new combination is
> just 7 added lines.  If you prefer a split, I can do that.
> 
>>> --- a/drivers/gpu/drm/tiny/st7735r.c
>>> +++ b/drivers/gpu/drm/tiny/st7735r.c
>>> @@ -1,8 +1,9 @@
>>>   // SPDX-License-Identifier: GPL-2.0+
>>>   /*
>>> - * DRM driver for Sitronix ST7735R panels
>>> + * DRM driver for Sitronix ST7715R/ST7735R panels
>>
>> This comment could describe the situation a little better.
>> This is a sitronix st7735r controller with a jianda jd-t18003-t01
>> display.
>> Or a sitronix st7715r controller with a okaya rh128128t display.
> 
> Indeed. It is currently limited to two controller/display combos.
> But I expect more combos to be added over time.
> Hence does it make sense to describe all of that in the top comments?
> 
>>> @@ -37,12 +39,28 @@
>>>   #define ST7735R_MY   BIT(7)
>>>   #define ST7735R_MX   BIT(6)
>>>   #define ST7735R_MV   BIT(5)
>>> +#define ST7735R_RGB  BIT(3)
>>> +
>>> +struct st7735r_cfg {
>>> +     const struct drm_display_mode mode;
>>> +     unsigned int left_offset;
>>> +     unsigned int top_offset;
>>> +     unsigned int write_only:1;
>>> +     unsigned int rgb:1;             /* RGB (vs. BGR) */
>>> +};
>>> +
>>> +struct st7735r_priv {
>>> +     struct mipi_dbi_dev dbidev;     /* Must be first for .release() */
>>> +     unsigned int rgb:1;
>>> +};
>>
>> The structs here uses "st7735r" as the generic prefix.
>> But the rest of this file uses "jd_t18003_t01" as the generic prefix.
>>
>> It would help readability if the same prefix is used for the common
>> stuff everywhere.
> 
> Agreed.
> So I think it makes most sense to rename jd_t18003_t01_pipe_{enable,funcs}
> to sh7735r_pipe_{enable,funcs}?
> If needed, the display-specific parts (e.g. gamma parameters) could be
> factored out in st7735r_cfg later, if neeeded.

IIRC, the original intention here is that functions/structs with the
jd_t18003_t01_ prefix are specific to the panel, not the controller.
E.g. things like power settings and gamma curves.

The idea is that it is much easier to write and understand the init sequence
as a function rather than trying to make a generic function that can parse
a any possible init sequence from a data structure.

This new panel really has all of the same settings as the existing one?

Having a separate pipe enable function for the new panel would also eliminate
the need for the extra private rgb data.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
