Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E82662E92
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 19:19:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B243910E063;
	Mon,  9 Jan 2023 18:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 964 seconds by postgrey-1.36 at gabe;
 Mon, 09 Jan 2023 10:28:11 UTC
Received: from smtp16.bhosted.nl (smtp16.bhosted.nl [IPv6:2a02:9e0:8000::27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A600310E3CE
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 10:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonic.nl; s=202111;
 h=message-id:references:in-reply-to:reply-to:subject:cc:to:from:date:
 content-transfer-encoding:content-type:mime-version:from;
 bh=DpADeRqnpOK1INfFn7yqaglpmahJbhY8EX582Bmd3SY=;
 b=I1ZQK8QX3QZlT2tEUahNaplPFpvXCyeS9V/mlZDOYwtUI7pmVX0sulujmgh+iZCm0yNHQ1CTJAwCO
 2UD84ZVaPxKibdiTFen6jJJA2ngMcKk/YHCQvNir+vGDtmvCc+hbDtExXjzCYs9bVKLFKyFV1eEJ5e
 H2GU3TJKh5rN41xWmbjpij5cdo5TqQRuuL92xrGuPFof4+3q3YAS+D54SAV1xmAjAY/OoBcZQ1gtVH
 KGf56rbaDfz4I/xH6cWK5TwxYW5NoBO4LWgqyeST3CQWbwwlCFWMjUa04Elb/KRVqS6BfSBrc4Vy70
 Ca3+4vIXUqVfvBYHz0i1DjTMhZyLfmQ==
X-MSG-ID: 0f6a649e-9006-11ed-8e79-0050569d2c73
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 09 Jan 2023 11:12:02 +0100
From: Robin van der Gracht <robin@protonic.nl>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 12/15] auxdisplay: ht16k33: Introduce
 backlight_get_brightness()
Organization: Protonic Holland
Mail-Reply-To: robin@protonic.nl
In-Reply-To: <Y7qM+ZlG5gQiOW4K@ravnborg.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-12-1bd9bafb351f@ravnborg.org>
 <CANiq72mFMJuec+r=T6xYtLpuU+a1rOrAhrHiecy_1Jpj2m4J=g@mail.gmail.com>
 <Y7qM+ZlG5gQiOW4K@ravnborg.org>
Message-ID: <2857575f6ec206f79cc21d423fde7d17@protonic.nl>
X-Sender: robin@protonic.nl
User-Agent: Roundcube Webmail/1.3.1 
X-Mailman-Approved-At: Mon, 09 Jan 2023 18:19:25 +0000
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
Reply-To: robin@protonic.nl
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-staging@lists.linux.dev, Stephen Kitt <steve@sk2.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Miguel Ojeda <ojeda@kernel.org>, Antonino Daplas <adaplas@gmail.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jingoo Han <jingoohan1@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On 2023-01-08 10:29, Sam Ravnborg wrote:
> Hi Robin.
> 
> On Sat, Jan 07, 2023 at 10:02:38PM +0100, Miguel Ojeda wrote:
>> On Sat, Jan 7, 2023 at 7:26 PM Sam Ravnborg via B4 Submission Endpoint
>> <devnull+sam.ravnborg.org@kernel.org> wrote:
>> >
>> > Introduce backlight_get_brightness() to simplify logic
>> > and avoid direct access to backlight properties.
>> 
>> Note: Stephen sent this one too a while ago (with some more details in
>> the commit message, which is always nice); and then he sent yesterday
>> v2 [1] (to mention the functional change with `BL_CORE_SUSPENDED`
>> [2]).
> Thanks for the pointers. I will try to move forward with Stephen's
> patches.
>> 
>> Anyway, if it goes via drm-misc, feel free to have my:
>> 
>>     Acked-by: Miguel Ojeda <ojeda@kernel.org>
>> 
>> Though it would be nice to have Robin test the change.
> 
> Robin - can I get your ack to apply Stephen's original v2 patch to
> drm-misc?

done! see: 
https://lore.kernel.org/lkml/0b16391f997e6ed005a326e4e48f2033@protonic.nl/

- Robin
