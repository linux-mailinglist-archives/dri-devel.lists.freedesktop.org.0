Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 820817E2CB4
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 20:16:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B010010E3E0;
	Mon,  6 Nov 2023 19:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF73E10E3E0
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 19:16:50 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-507a98517f3so6045877e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 11:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699298208; x=1699903008;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a167i54ECzeim7DnHeFDyars4d3VX1If1q/38dtFU50=;
 b=SRQuh8ONUNEgF/vTqe9kZNaBjNEYGlRZqR45KE3SW1Rs1Oz3XA1yltun6F/AT+/vC2
 MBclAQc8iMwbOsfz9r0YtKkSKbaKCALsvUDbjWkPVAYVgnMewss8mq0X/hegIntacTCr
 Uza2J60Y//6Z4RTNk/F51ayzFAdrz+yQJnJNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699298208; x=1699903008;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a167i54ECzeim7DnHeFDyars4d3VX1If1q/38dtFU50=;
 b=pqsl494+Hnzsh9J25t4wyWdFf+e4RNbzohivN0zIYdTfmUi91hZk/CdERsQrsOeshK
 6q6G5SnUH7MtKUAl22Dzd7L8YC4Uke0OIi8vd2pmp4cJxUZaOabxD3PniDTU2N7au/6b
 C6Lg4SAsLcJ7IL6/Otn6dqSpvHeUxLkzRSkudg27MuXB5KdSz3pu3w/JcnSsS92y4E+7
 XBAoPGmZ2YfwJUm9DylqgHbffG7FjNkW0zFyLKSa2KkZvec7+RLI5sD1QT49i18HXdu3
 +GvllAMDe3VarBVkPRrefN6hd1xd8PP7F9eKYXRAWjvKJaK0RM45v0I35/9ZGFZ6NDh4
 kRAw==
X-Gm-Message-State: AOJu0YxvGZEDjxE1feL6pJ+ooiuONSwOpZy90ZwWKpkTF8Hzwba+Kkf8
 JK3WY1JQZKVItBnV7IS06f1a6wVd4F3ZZrlRTf7me5os
X-Google-Smtp-Source: AGHT+IEI3YIjggp2I119bl7niLwMPZkLLSb9TmxenjB/bPr4I5ATDZWaVEN0sgIXyIs47IsFE3Iydg==
X-Received: by 2002:ac2:5e6c:0:b0:500:90d1:90a6 with SMTP id
 a12-20020ac25e6c000000b0050090d190a6mr19626827lfr.63.1699298207827; 
 Mon, 06 Nov 2023 11:16:47 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44]) by smtp.gmail.com with ESMTPSA id
 z19-20020a056512371300b00507b869b068sm61838lfr.302.2023.11.06.11.16.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 11:16:46 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-50931d0bb04so521e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 11:16:46 -0800 (PST)
X-Received: by 2002:a05:6512:3da1:b0:502:a55e:fec0 with SMTP id
 k33-20020a0565123da100b00502a55efec0mr14720lfv.6.1699298205743; Mon, 06 Nov
 2023 11:16:45 -0800 (PST)
MIME-Version: 1.0
References: <DU0PR10MB7076C5C33C4F3E9097E372E7ADDDA@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
 <CAD=FV=XafnQy0Tg_pSvarNmsFX-mkFq0abYipkAm+28wr+byrw@mail.gmail.com>
 <DU0PR10MB707649F0596653D2B16D6AB9ADDCA@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
 <CAD=FV=WF3cU_f8UoUj3gWqnnL8QDy2tBuLqxc=81enCFAKjyUw@mail.gmail.com>
In-Reply-To: <CAD=FV=WF3cU_f8UoUj3gWqnnL8QDy2tBuLqxc=81enCFAKjyUw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Nov 2023 11:16:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XeEGAKNsxLuwzheOn7ieftNC-zoQtxopxJ3NdHJ3k4vw@mail.gmail.com>
Message-ID: <CAD=FV=XeEGAKNsxLuwzheOn7ieftNC-zoQtxopxJ3NdHJ3k4vw@mail.gmail.com>
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

On Fri, Oct 27, 2023 at 7:31=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> I guess, in summary, I'm hoping you'll look again and find that this
> really is a backlight enable. If not, I'd probably advocate for a
> per-panel boolean.

Circling back, I'm curious what ended up happening here. Did you
decide that it actually was a backlight enable GPIO, or are you
planning on sending a patch?

-Doug
