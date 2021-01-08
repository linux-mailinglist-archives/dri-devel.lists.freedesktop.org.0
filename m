Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC692EFF3C
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jan 2021 12:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CBC6E93E;
	Sat,  9 Jan 2021 11:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 442 seconds by postgrey-1.36 at gabe;
 Fri, 08 Jan 2021 09:40:14 UTC
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by gabe.freedesktop.org (Postfix) with ESMTP id 90B4589AFF
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 09:40:13 +0000 (UTC)
Received: from [192.168.1.184] ([79.10.42.7])
 by smtpcmd14.ad.aruba.it with bizsmtp
 id E9Yh2401P09GTh3019YikK; Fri, 08 Jan 2021 10:32:48 +0100
Subject: Re: [PATCH v2 2/2] drm/sun4i: tcon: improve DCLK polarity handling
To: Maxime Ripard <maxime@cerno.tech>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <3685133.SLcexNTYsu@kista>
 <20210107023032.560182-1-giulio.benetti@benettiengineering.com>
 <20210107023032.560182-3-giulio.benetti@benettiengineering.com>
 <20210108092355.7p5uakxt7lpdu3bn@gilmour>
From: Marjan Pascolo <marjan.pascolo@trexom.it>
Message-ID: <00f21d15-7a88-2d01-dd48-dc49e9295e34@trexom.it>
Date: Fri, 8 Jan 2021 10:32:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108092355.7p5uakxt7lpdu3bn@gilmour>
Content-Language: it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aruba.it; s=a1;
 t=1610098368; bh=82Qc25F+H7L7x6BQiya/5DYe4FRvGIQzgn+J3cPAVI4=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=XxQFr7fPj/C6NGziLxeXeFURB7//y5vM0eekwda4hs4vE7fnrcf4NhDMtk+p8PGk2
 ZlIiydmvxBiEcKyMhuQn+uWcyBEXQI2tT1ysQSuwMUyeA6/vfHvli2qesm6N6QO8/Q
 dXV+9UqSW5LEC1nM61Y4ZAwPXwthMjaiocSCeI2qDMf08WXP9AlBnRgA37XKezE1Wc
 ucz0wOK19osO4s/Jh09sYSWkJVC8ABrZZUbTtaCMyw7eTLCLDUxIiJ60gedOz18cV6
 MxAQSU/Dl/BtGNmaPhjlel3dNeOLhU4a2C3blMF9SvlAHpc0Ft95brcAGQtdLueeU1
 68h6VCNr4Pshw==
X-Mailman-Approved-At: Sat, 09 Jan 2021 11:46:48 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 treding@nvidia.com, Giulio Benetti <giulio.benetti@micronovasrl.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0031886520=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0031886520==
Content-Type: multipart/alternative;
 boundary="------------780A4B0A61B9A3D2C635F582"
Content-Language: it

This is a multi-part message in MIME format.
--------------780A4B0A61B9A3D2C635F582
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Quote "

I'm not really sure why we need the first patch of this series here?
That patch only seem to undo what you did in patch 1

"

And another question (probably could be a stupid one):

in "/[PATCH v2 2/2] drm/sun4i: tcon: improve DCLK polarity handling/" I 
see you deleted:

-		clk_set_phase(tcon->dclk, 0);

Is safe to assume that phase register will be always set to 0?

Or maybe will be safer manually set it to 0 in every condition to avoid 
surprises (dirt values due to previous condition)?


Marjan

Il 08/01/2021 10:23, Maxime Ripard ha scritto:
> Hi,
>
> Thanks for those patches
>
> On Thu, Jan 07, 2021 at 03:30:32AM +0100, Giulio Benetti wrote:
>> From: Giulio Benetti <giulio.benetti@micronovasrl.com>
>>
>> It turned out(Maxime suggestion) that bit 26 of SUN4I_TCON0_IO_POL_REG is
>> dedicated to invert DCLK polarity and this makes thing really easier than
>> before. So let's handle DCLK polarity by adding
>> SUN4I_TCON0_IO_POL_DCLK_POSITIVE as bit 26 and activating according to
>> bus_flags the same way is done for all the other signals.
>>
>> Cc: Maxime Ripard <maxime@cerno.tech>
> Suggested-by would be nice here :)
>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> ---
>>   drivers/gpu/drm/sun4i/sun4i_tcon.c | 20 +-------------------
>>   drivers/gpu/drm/sun4i/sun4i_tcon.h |  1 +
>>   2 files changed, 2 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
>> index 52598bb0fb0b..30171ccd87e5 100644
>> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
>> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
>> @@ -569,26 +569,8 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon *tcon,
>>   	if (info->bus_flags & DRM_BUS_FLAG_DE_LOW)
>>   		val |= SUN4I_TCON0_IO_POL_DE_NEGATIVE;
>>   
>> -	/*
>> -	 * On A20 and similar SoCs, the only way to achieve Positive Edge
>> -	 * (Rising Edge), is setting dclk clock phase to 2/3(240°).
>> -	 * By default TCON works in Negative Edge(Falling Edge),
>> -	 * this is why phase is set to 0 in that case.
>> -	 * Unfortunately there's no way to logically invert dclk through
>> -	 * IO_POL register.
>> -	 * The only acceptable way to work, triple checked with scope,
>> -	 * is using clock phase set to 0° for Negative Edge and set to 240°
>> -	 * for Positive Edge.
>> -	 * On A33 and similar SoCs there would be a 90° phase option,
>> -	 * but it divides also dclk by 2.
>> -	 * Following code is a way to avoid quirks all around TCON
>> -	 * and DOTCLOCK drivers.
>> -	 */
>>   	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
>> -		clk_set_phase(tcon->dclk, 0);
>> -
>> -	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
>> -		clk_set_phase(tcon->dclk, 240);
>> +		val |= SUN4I_TCON0_IO_POL_DCLK_POSITIVE;
> I'm not really sure why we need the first patch of this series here?
> That patch only seem to undo what you did in patch 1
>
> Maxime

--------------780A4B0A61B9A3D2C635F582
Content-Type: text/html; charset=iso-8859-15
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=ISO-8859-15">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <p>Quote "<br>
    </p>
    <pre class="moz-quote-pre" wrap="">I'm not really sure why we need the first patch of this series here?
That patch only seem to undo what you did in patch 1
</pre>
    <p>
      "</p>
    <p>And another question (probably could be a stupid one):</p>
    <p>in "<i>[PATCH v2 2/2] drm/sun4i: tcon: improve DCLK polarity
        handling</i>" I see you deleted:</p>
    <pre class="moz-quote-pre" wrap="">-		clk_set_phase(tcon-&gt;dclk, 0);

</pre>
    <p>Is safe to assume that phase register will be always set to 0?</p>
    <p>Or maybe will be safer manually set it to 0 in every condition to
      avoid surprises (dirt values due to previous condition)?</p>
    <p><br>
    </p>
    <p>Marjan<br>
    </p>
    <pre class="moz-quote-pre" wrap="">
</pre>
    <div class="moz-cite-prefix">Il 08/01/2021 10:23, Maxime Ripard ha
      scritto:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210108092355.7p5uakxt7lpdu3bn@gilmour">
      <pre class="moz-quote-pre" wrap="">Hi,

Thanks for those patches

On Thu, Jan 07, 2021 at 03:30:32AM +0100, Giulio Benetti wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Giulio Benetti <a class="moz-txt-link-rfc2396E" href="mailto:giulio.benetti@micronovasrl.com">&lt;giulio.benetti@micronovasrl.com&gt;</a>

It turned out(Maxime suggestion) that bit 26 of SUN4I_TCON0_IO_POL_REG is
dedicated to invert DCLK polarity and this makes thing really easier than
before. So let's handle DCLK polarity by adding
SUN4I_TCON0_IO_POL_DCLK_POSITIVE as bit 26 and activating according to
bus_flags the same way is done for all the other signals.

Cc: Maxime Ripard <a class="moz-txt-link-rfc2396E" href="mailto:maxime@cerno.tech">&lt;maxime@cerno.tech&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Suggested-by would be nice here :)

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Giulio Benetti <a class="moz-txt-link-rfc2396E" href="mailto:giulio.benetti@micronovasrl.com">&lt;giulio.benetti@micronovasrl.com&gt;</a>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 20 +-------------------
 drivers/gpu/drm/sun4i/sun4i_tcon.h |  1 +
 2 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 52598bb0fb0b..30171ccd87e5 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -569,26 +569,8 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon *tcon,
 	if (info-&gt;bus_flags &amp; DRM_BUS_FLAG_DE_LOW)
 		val |= SUN4I_TCON0_IO_POL_DE_NEGATIVE;
 
-	/*
-	 * On A20 and similar SoCs, the only way to achieve Positive Edge
-	 * (Rising Edge), is setting dclk clock phase to 2/3(240°).
-	 * By default TCON works in Negative Edge(Falling Edge),
-	 * this is why phase is set to 0 in that case.
-	 * Unfortunately there's no way to logically invert dclk through
-	 * IO_POL register.
-	 * The only acceptable way to work, triple checked with scope,
-	 * is using clock phase set to 0° for Negative Edge and set to 240°
-	 * for Positive Edge.
-	 * On A33 and similar SoCs there would be a 90° phase option,
-	 * but it divides also dclk by 2.
-	 * Following code is a way to avoid quirks all around TCON
-	 * and DOTCLOCK drivers.
-	 */
 	if (info-&gt;bus_flags &amp; DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
-		clk_set_phase(tcon-&gt;dclk, 0);
-
-	if (info-&gt;bus_flags &amp; DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
-		clk_set_phase(tcon-&gt;dclk, 240);
+		val |= SUN4I_TCON0_IO_POL_DCLK_POSITIVE;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'm not really sure why we need the first patch of this series here?
That patch only seem to undo what you did in patch 1

Maxime
</pre>
    </blockquote>
  </body>
</html>

--------------780A4B0A61B9A3D2C635F582--

--===============0031886520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0031886520==--
