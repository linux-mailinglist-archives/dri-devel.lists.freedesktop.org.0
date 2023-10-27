Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 183027D9B76
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 16:32:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342E910E9BA;
	Fri, 27 Oct 2023 14:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D101E10E9BA
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 14:32:17 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9c41e95efcbso301849766b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 07:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1698417134; x=1699021934;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2gQTtqzNRoXz07xIE+fua09uP1zOMidlpPD02FaqvCo=;
 b=c/DDIRbyJjorSCzR9n4SAXJc6/Fzdc7+VGSYFnHwTX7oHV1xpmtcoyEqDBBY9CEEPX
 wz21LzREIXVQ6V5181ibf6bIg1QFUHxUyjaPSo4W1ML3qJbqs/4TSYBPOw2i3FtNF63X
 6S9ql/cFxmHGUm926UdvtGI3B1LBvHlcfaYqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698417134; x=1699021934;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2gQTtqzNRoXz07xIE+fua09uP1zOMidlpPD02FaqvCo=;
 b=t22HnP6XaXan7WKuUJmMGGuIb4tjYsRGgTZGJmJgZI+0D3iyNPj6MXRF74Ktg8lEp7
 pvf89c4UqJMHg47hn22Ad4PiZBNrrdXBoszWYWT1LKw8E/bi3gWzSW7Oeg3xFE6pWOY4
 K+Y0Xn8sbkwOf/GqLvOO3jFlc3XF20eTTpW6bfEoHLnYki5yVGWBj+CP8vXEiJqyAMM0
 /n6oDBDOOb/y4XMp5mEnrVN2Dn1NI2tnIOeYDOIjeBQS/lTteA/1JRtBN7mQy+WVLej4
 6A4IxWaApTScGHY9sB2h2hVpiu2JW1rZ99c0SONKyrEGQJGbWcdt9cQy+T8KjW0IzY3X
 tC6Q==
X-Gm-Message-State: AOJu0YyAiLvDKCdc/fOr8fcG+X5SwQrPGq3FFyx9MDl6kayidFCq1Xrh
 wlB+pKIoT9hKPqWmGaf9NixQJ5lbeQLeqbdZP3w/ZQ==
X-Google-Smtp-Source: AGHT+IG8FJRCZ/p3zV1sqdK64fmsQyM65eYMDflitH1aCgasgRd/1E7OPRCVhG9DrCmIGOBZtOIYBQ==
X-Received: by 2002:a17:906:fe08:b0:9ca:e7ce:8e68 with SMTP id
 wy8-20020a170906fe0800b009cae7ce8e68mr2121387ejb.44.1698417133840; 
 Fri, 27 Oct 2023 07:32:13 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50]) by smtp.gmail.com with ESMTPSA id
 kj26-20020a170907765a00b00982a352f078sm1274514ejc.124.2023.10.27.07.32.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 07:32:13 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-408c6ec1fd1so63335e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 07:32:13 -0700 (PDT)
X-Received: by 2002:a05:600c:6009:b0:3f4:fb7:48d4 with SMTP id
 az9-20020a05600c600900b003f40fb748d4mr72004wmb.3.1698417132998; Fri, 27 Oct
 2023 07:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <DU0PR10MB7076C5C33C4F3E9097E372E7ADDDA@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
 <CAD=FV=XafnQy0Tg_pSvarNmsFX-mkFq0abYipkAm+28wr+byrw@mail.gmail.com>
 <DU0PR10MB707649F0596653D2B16D6AB9ADDCA@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DU0PR10MB707649F0596653D2B16D6AB9ADDCA@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 27 Oct 2023 07:31:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WF3cU_f8UoUj3gWqnnL8QDy2tBuLqxc=81enCFAKjyUw@mail.gmail.com>
Message-ID: <CAD=FV=WF3cU_f8UoUj3gWqnnL8QDy2tBuLqxc=81enCFAKjyUw@mail.gmail.com>
Subject: Re: drm/panel: panel-simple power-off sequencing
To: "Jonas Mark (BT-FS/ENG1-GRB)" <Mark.Jonas@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, Mark Jonas <toertel@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "Simoes Ricardo \(BT-FS/ENG1.1-Ovr\)" <Ricardo.Simoes@pt.bosch.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Oct 27, 2023 at 5:30=E2=80=AFAM Jonas Mark (BT-FS/ENG1-GRB)
<Mark.Jonas@de.bosch.com> wrote:
>
> > I think I've looked at this exact case before and then realized that
> > there's a better solution. At least in all cases I looked at the
> > "enable-gpio" you're talking about was actually better modeled as a
> > _backlight_ enable GPIO. The "backlight" is turned off before panel-
> > simple's disable() function is called (see drm_panel_disable().
> > So if you move the GPIO to the backlight and add a "disable" delay
> > then you're all set.
> >
> > Does that work for you? Does it make sense for this GPIO to be modeled
> > as a backlight GPIO?
>
> In combination with setting the "disable" delay this works *. Yet, it
> feels wrong.
>
> *: backlight-pwm only accepts one GPIO but that can be easily resolved.
>
> It feels wrong that the backlight driver takes over part of the panel
> control. On top, it still needs cooperation of the panel driver for the
> proper timing.

I would first ask you to take another look before saying that it's
wrong to put the enable pin in the backlight driver. At least on most
displays I've seen (though I've spent most time looking at eDP), the
backlight and panel are really not separable entities.

Take a look at the ASCII art timing diagram in
Documentation/devicetree/bindings/display/panel/panel-edp.yaml, for
instance. This is typical of eDP panel diagrams and it includes _both_
the backlight and the display timings. In general, it's always made
sense for me to think of the "LED_EN" line in that diagram as the
backlight enable.


> Lastly, it relies on the current behavior of drm-panel
> that the panel driver is prepared/ enabled first and then the backlight
> is switched on; and the other way around at power off.

That current behavior is not random and I don't think it would be
possible for it to change. Too many things rely on the current order.


> We think that actually more panels in products are affected: We have
> three panels from three different vendors (Sharp, Powertip, and Tianma)
> and only one is visually affected. Yet, all of them specify a number of
> vsyncs after de-asserting the enable GPIO.

If you're certain that your enable GPIO really shouldn't be modeled
with the backlight, then IMO you should submit a patch to panel-simple
that allows an "enable" GPIO to be controlled in the "enable"
function. We'd have to have a discussion about how to best do this.
The fact that the existing "enable" GPIO is considered a "power
enable" predates my involvement in the driver. In other words I think
it's always been in the "prepare/unprepare" functions. It always felt
wrong to me, too. ;-)

I guess the "easiest" (though a bit ugly) solution is to either add a
per-panel boolean flag that says whether that panel wants the enable
GPIO controlled in enable/disable or prepare/enable.

Another solution might be to introduce a 2nd GPIO, though you'd have
to think about what to call it since the existing one is kinda stuck
as "enable" given the DT bindings.

I guess a 3rd solution would be to audit users and see if anyone
actually needs the current "enable" GPIO as it is and whether those
cases would be better modeled as a GPIO-controlled regulator. Of
course, if you have to change how boards model this, then you start
getting into the argument about DT backward compatibility.


I guess, in summary, I'm hoping you'll look again and find that this
really is a backlight enable. If not, I'd probably advocate for a
per-panel boolean.


FWIW, looking a bit at the history and going back to 2014 in commit
f673c37ec453 ("drm/panel: simple: Support delays in panel functions"):

* The backlight calls used to be made directly from panel-simple

* The "unprepare" delay was documented as "the time (in milliseconds)
that it takes for the panel to power itself down completely" and makes
me believe that, even originally, it was about not turning the panel
back on before it fully turns off (T12 in the eDP timing diagram I
pointed at earlier).

* The "enable" GPIO has been controlled from prepare/unprepare since
those functions were introduced in commit 613a633e7a56 ("drm/panel:
simple: Add proper definition for prepare and unprepare"). It kinda
feels like the problem originated here...


-Doug
