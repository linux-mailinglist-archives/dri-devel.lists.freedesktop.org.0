Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD40AC8E6BC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 14:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18A210E08E;
	Thu, 27 Nov 2025 13:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JwNpLTrB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0660310E08E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 13:19:22 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5957753e0efso949694e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 05:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764249561; x=1764854361;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Qa5rSgxsMBgNnzr8BR11LLdhDyhOIcF98vMIluiI9sA=;
 b=JwNpLTrBXIKHgMaPfM4vIPsOJJarR829w7UKiNObkiL1AQ5jRBG7n2icTJOTmIpvRU
 tRtoAFxayKYwQPTRisVk2F0PoyMsdrMTze8+BsLynj3hJ5hGuwtXA6w3tfh3mupuHYaa
 ZP1ll796kYKjBD0IZFVmeWNCGV+QTSPUT4NpTgCDinyz2BoFxbWiIm6m+R2Rh+t1ZB7K
 lYUrq7ed3A00q3IVp0eGSWNAj1LUCEL/H6yrcR0RJ8AYgsjzpFOrgd1hA7gqj5O+liF9
 g3psCxHilpvEIy9bwQJqkrQDcSuAtySs55eGg2pqB6bXIZTX/OECXMeHI3Gz5YxBqBRI
 j/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764249561; x=1764854361;
 h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qa5rSgxsMBgNnzr8BR11LLdhDyhOIcF98vMIluiI9sA=;
 b=ep0PVi1U/hPt+7w1oYkWcCNeBMnsVcFwe4UZktyp/op0llg051VrQb8iwBEJudSqXi
 a1cLwGZpwuwFfzknR5gU0db0ECXFg+qBalwUSDaGG+QrXA8BMJ5diaoXaekkrrgzf9Lp
 zXrIM4X5B8SE6Xze3ebbQa85TtutZUhgkLp1rYSqp7hkej9tG6ou4MyczlU2TqiWIH4i
 nq32/icLjsW9KOy4WBrBu+Hi/FPs36EwuO+Dco+YzoM4FPITxTVCYUhF3+eiaHrkzVlF
 ZfFOVglItcJWZy1Y056qxnWy4DRLxhLzP7qI+/ZGTNqdnoHHfAQzXq9f6XQ1Rme2Bo4a
 x0OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVf3/NrNdDzQ7CPwit6XV7IXdEb2EfaV0CODdlUHnsdu0WRewerDGSzK1fcHTBdXwspHsQfuFoayLI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoKiHNoPwCQT472qHoorWENHudc95SLvhEF3RNEqsFfjzpxqYN
 Gvu4fL8A1CBnAqOip/jabwAh86nty56zCM5FTICfreGJzwqw9goBU3Jx4I8RJJ8Ua/tnG7mQ9f2
 c/PL500ImKOsma+acROnp+ESZcd5UtoCqYsFdJOEAbA==
X-Gm-Gg: ASbGncshn+M812VlmLoU6upvkkEUZ8Znlqz/GbQ67G3HgN3adK24SUUNpNMAp0Pj9cd
 lqFocXjcZFNyIHUlN87fzSuyEwZ52Koq1E+HqNRdLKL/gMRzVMjwqcDXfZ84RSkBpbznUEhQUft
 DaHhMJ/Bm5/OLrdiEbaeCTQcxDAhMYRnAAUR4cWkQNrbrmi4nAgUf7ttxXGyTccNQIvuXnDeRO/
 P6AonkR+gayMh+0FRH75WFQ+1VUdupKXCvsvfAlUawA44ddLK/Xi0zXMnO0H8iNeTwNnYGQncCG
 baOn6t8frp7mazmXTygjPCF2XyI=
X-Google-Smtp-Source: AGHT+IFv4GnkzKuW5eP3thzxCRyJsfT/CIvGgglFh+tmFfX0OqQYKRle07uF9vIrb6qOFN7GsZbNvxi1KoK9iGxUlqI=
X-Received: by 2002:a05:6512:238e:b0:595:9dbc:2ed0 with SMTP id
 2adb3069b0e04-596a3ea6664mr9117003e87.4.1764249561056; Thu, 27 Nov 2025
 05:19:21 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Nov 2025 05:19:19 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Nov 2025 05:19:19 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <2025112705-registrar-drivable-2341@gregkh>
MIME-Version: 1.0
References: <20231127051414.3783108-1-victor.liu@nxp.com>
 <20231127051414.3783108-2-victor.liu@nxp.com>
 <v6rthnruba5xaxazsn4jsptn6catso5qwuyf5xxbf4ml25b6eo@snttjo7oqlod>
 <2023112739-willing-sighing-6bdd@gregkh>
 <CAMRc=Mc3T1u1sa0P+78dfhtoyBPc+9zsJ5sGP=ZLR+S=h16vZg@mail.gmail.com>
 <2025112705-registrar-drivable-2341@gregkh>
Date: Thu, 27 Nov 2025 05:19:19 -0800
X-Gm-Features: AWmQ_bnopX1NwnmSAB4rxhi5_XdHwE8aFqWlc4JptCLwfFW0D9DDoUsJLxqpKZ4
Message-ID: <CAMRc=Meb0-Q7UCPhbfQ+pLybS2Jp=QpwxXGXNfQ+Ti64okoqYw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] driver core: Export device_is_dependent() to
 modules
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 rafael@kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-next@vger.kernel.org, sfr@canb.auug.org.au, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
 daniel@ffwll.ch, angelogioacchino.delregno@collabora.com, 
 ulf.hansson@linaro.org, linus.walleij@linaro.org, 
 Liu Ying <victor.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 27 Nov 2025 09:29:03 +0100, Greg KH <gregkh@linuxfoundation.org> said:
> On Wed, Nov 26, 2025 at 02:13:03PM +0100, Bartosz Golaszewski wrote:
>> The logical thing to do would be to use "device_is_dependent()" but
>> this thread makes me think that won't fly.
>>
>> What should I do? What's the "correct" way of checking if two devices
>> are linked? I assume that fiddling with the supplier/consumer lists in
>> struct device is not it.
>
> fiddling with those lists is what device_is_dependent() does, but no,
> you really don't want to be doing that either manually or by calling
> this function.
>
> Who is creating this "link"?  Can't that caller tell the gpio core this
> relationship at the same time as you are wanting to keep track of it
> too?
>

The link would be created in reset core.

Let's consider the following:

GPIO Consumer A ---> reset-gpio ---> |
                                     | GPIO Controller pin X
GPIO Consumer B -------------------> |

The GPIO core will scan the device tree and realize that A and B share the
same pin. The reset-gpio device is not described in firmware, it will be
created only when A requests a reset control. When it, on behalf of consumer A,
requests pin X, GPIO core can not associate the link between consumer A and
pin X with the link between reset-gpio and pin X because there's no such
reference in firmware nodes between consumer A and reset-gpio. To GPIO, these
are two separate references to the same pin. Only reset core knows about A
being the consumer of reset-gpio.

We could add a function in reset like:

  struct device *reset_gpio_to_reset_device(struct device *dev);

which would return the actual consumer of pin X for a device we identified as
reset-gpio (for instance: with device_is_compatible(dev, "reset-gpio")) but
that would be adding a symbol for a corner case and a single user and for
which the relevant information already exists and could easily be retrieved
from existing device links.

I hope that explains it better.

To answer your question: the caller can't tell GPIO about this relationship,
GPIO would have to ask reset about it but having a dedicated symbol for this
doesn't really sound like the best approach.

Bartosz
