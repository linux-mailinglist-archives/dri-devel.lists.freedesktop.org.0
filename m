Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2907C6611B5
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 21:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42ED610E083;
	Sat,  7 Jan 2023 20:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:404::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9866A10E083
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 20:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=RV+O7cB5l+vaR5SO6XJa6RTpRYVy6GA4qJE6OAXy7jM=;
 b=uqBjqGUZaw40K9daezgVaSHVAazfEdhdq+JcI2yeGkxOlNFTZpIFrUFk9XABsNvhmL+1pP+c2lsty
 Fi/30HkWP0cfz+KFCzbqIr/KGrCdW/29/A9qOOGzewzeaFTff3HpRc47oTq/JDYLJUfS8ZZUXFOmTY
 azBMO9ivKekwR/UiON6K6kWi1Gj4cbXkrtyGZ9T7dDTTn0DBgbLsLGNS6OYSpriPvzh8GbhHLaUpyB
 dHvxIRmsvOwDoOIvd4kGkpON115b5GxtLYJB/0xlLJ0U9QY+ALENfS6ycYcvcoAx/L+IU1v7E1TCXg
 U5p0JjIWM8blmp8UFnPHVXSsbDCeFJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=RV+O7cB5l+vaR5SO6XJa6RTpRYVy6GA4qJE6OAXy7jM=;
 b=AadjSAWAhsd9s/NuxYyFEDx/hhJmkRh8x7bTEGYiRhB+J+8BsiLl49CfqGKNFHOtMHHLkdtDsLSml
 eZo40lsBw==
X-HalOne-ID: 602b5661-8ecd-11ed-85e1-7703b0afff57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5 (Halon) with ESMTPSA
 id 602b5661-8ecd-11ed-85e1-7703b0afff57;
 Sat, 07 Jan 2023 20:53:47 +0000 (UTC)
Date: Sat, 7 Jan 2023 21:53:46 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH 01/15] video: fbdev: atmel_lcdfb: Rework backlight handling
Message-ID: <Y7nb2q6SDota/rTU@ravnborg.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-1-1bd9bafb351f@ravnborg.org>
 <553AE999-CAF1-4E59-9F3F-68591ED192DE@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <553AE999-CAF1-4E59-9F3F-68591ED192DE@sk2.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-staging@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Sam Ravnborg via B4 Submission Endpoint <devnull+sam.ravnborg.org@kernel.org>,
 Antonino Daplas <adaplas@gmail.com>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Robin van der Gracht <robin@protonic.nl>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Jingoo Han <jingoohan1@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen.

On Sat, Jan 07, 2023 at 09:36:47PM +0100, Stephen Kitt wrote:
> On 7 January 2023 19:26:15 CET, Sam Ravnborg via B4 Submission Endpoint <devnull+sam.ravnborg.org@kernel.org> wrote:
> >From: Sam Ravnborg <sam@ravnborg.org>
> >
> >The atmel_lcdfb had code to save/restore power state.
> >This is not needed so drop it.
> >
> >Introduce backlight_is_brightness() to make logic simpler.
> >
> >Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> >Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> >Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> >Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> >Cc: linux-fbdev@vger.kernel.org
> >Cc: linux-arm-kernel@lists.infradead.org
> >---
> > drivers/video/fbdev/atmel_lcdfb.c | 24 +++---------------------
> > 1 file changed, 3 insertions(+), 21 deletions(-)
...
> 
> Hi Sam,
> 
> I’d submitted quite a few more of these previously (and you’d reviewed them), see e.g. the thread starting at https://lkml.org/lkml/2022/6/7/4365, and yesterday, https://lkml.org/lkml/2023/1/6/520, https://lkml.org/lkml/2023/1/6/656, https://lkml.org/lkml/2023/1/6/970, https://lkml.org/lkml/2023/1/6/643, and https://lkml.org/lkml/2023/1/6/680. There are a few more, I can find them if it’s any use.

The patches from yesterday was what triggered me to resurrect an old
branch of mine where I had done something similar. I had lost all
memory of reviewing similar patches from you.


Helge - could you pick the reviewed patches from:
https://lore.kernel.org/all/20220607192335.1137249-1-steve@sk2.org/
[This is the same mail as Stephen refer to above - looked up via lore].

Stephen - I expect Daniel/Lee to take care of the patches from yesterday.
If you can look up other pending patches from you please do so, so we
can have them applied.
Preferably with links to lore - as this makes it easier to apply them.

Review of what is unique in this set would be appreciated.

	Sam
