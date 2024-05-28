Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC028D21A0
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 18:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2296A10E3A1;
	Tue, 28 May 2024 16:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="XK1WuSga";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC50D10E3A1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 16:28:03 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-3c9cc681ee4so499201b6e.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 09:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716913682; x=1717518482;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t74W54+/Ll0YLi8c76pQC7uwzEIjWDtBfp3CisuTzmI=;
 b=XK1WuSgaoMYI23bjZ5cVoakUwjH5tG6W2tskJV6+w/7B0cBbc12UrjUUGHS2e1AtjG
 yJhnz7ExVt+OQRLxEtiRjUO1dC7MYtZ3icDOt7lPAHonvyFUJ1lm70AoUMLH487AiZjK
 4+kBWHd7PWGnKrUm+zRyLnHcZ/Kis6acu4MqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716913682; x=1717518482;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t74W54+/Ll0YLi8c76pQC7uwzEIjWDtBfp3CisuTzmI=;
 b=LKQAjOtFRgkrc/7dSjmdQM4KrwZRpRKc/m6SPmp1qUuB03mYs3ns7tmJfCpTrNFoIs
 xHia5QrtwK4SOqEMDnAFmEaPZryFp83rMCPeYJvf3OSqAr4Fr6WleLIVbf6ADyVY5sol
 fNa8HMyvD7TubQDQfPf5dJEs6H6kX9cB592SvdS/FJ/TVEpfLcHaiuHOBGWrHJQBdLsb
 H1KIRzIYottZm6/c0Mt3TQGq9jtlfKZSSdHTvhr61YfQUY4OP7uUffy8lnOUxN4Kw0Gh
 HR0MQv4s0K2IXUKH4nq7hLqjgl1VuyY0yT51HuCv64JMOnBEdzFatMtqy8/D+oKrJRJr
 YY2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMmzh02FBe844kZeg9noWf0qBr3HeXwxDiLuL65lPUtJ9zDS6/HD6oZA40TZlTLmsZZ3kpT6/t2a3WyxmdGe4BxrYyWQ/dJeVuFu3HEfBc
X-Gm-Message-State: AOJu0YyuK81B7hSADwL/jQuaCx96lWAaeXV5SWNfYC98AlkIzSSW5yBD
 /qsdAGYHu56hQCG/OWnUZe9ncDjnfyBVuax90FCXYbABHgnKQPWj0dvCAj68b3TMQj5/1vSwNBw
 =
X-Google-Smtp-Source: AGHT+IEnc7KG/Gc3a8mPS72Tmcekd2RoS1lwM+9fZQE9UwkC3L8AqueJKKo2m6wrNWfeP1Ov0maT2w==
X-Received: by 2002:aca:2407:0:b0:3d1:d217:91f9 with SMTP id
 5614622812f47-3d1d2179259mr1560302b6e.13.1716913681874; 
 Tue, 28 May 2024 09:28:01 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com.
 [209.85.160.169]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ad79daf087sm25947826d6.135.2024.05.28.09.28.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 09:28:01 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-43e14f0bd75so857351cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 09:28:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW3KHip/kVGYq+kJ6wVRjo2hBlnZBtHlShjrtt0WfuGLINibEfO8K2hiiTUuYib5YluhnSJZqDYOG2UHvBnUYlcZKVRNnk+Ad83NbWMjCRP
X-Received: by 2002:a05:622a:1ccb:b0:43d:85ae:bee with SMTP id
 d75a77b69052e-43fbb0588e9mr7721931cf.7.1716913679727; Tue, 28 May 2024
 09:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240422060811.670693-1-xuxinxiong@huaqin.corp-partner.google.com>
 <CAD=FV=WRLLuOkCJeM6RdAb6xLN-cPH+hfWbOv9-LujB-WMGEFw@mail.gmail.com>
 <CAGoogDB-mj8_xu04w3V2ZxOBTWoXcPKrVR1NRt6BFcpjHX3-7Q@mail.gmail.com>
 <CAD=FV=WwsR9e-ZXJRY11FvdUZ66YPy9vqmY_=sGDw5Wqk1eV3w@mail.gmail.com>
 <CAGoogDBCzfKwkAA-VAs3_Cdw_4oFO94mt7yjy47Sp2RAtqtPxA@mail.gmail.com>
 <CAD=FV=WYiD-BUpksBnZrkWvORepZqtaAvm5645X-_oJPea0s0w@mail.gmail.com>
In-Reply-To: <CAD=FV=WYiD-BUpksBnZrkWvORepZqtaAvm5645X-_oJPea0s0w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 28 May 2024 09:27:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WMC0XZBc3UKP+Qzb5aeiWBnXrYDf31PNP5cGeAT-8XcA@mail.gmail.com>
Message-ID: <CAD=FV=WMC0XZBc3UKP+Qzb5aeiWBnXrYDf31PNP5cGeAT-8XcA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add panel CSOT MNB601LS1-1
To: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 hsinyi@google.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, May 6, 2024 at 8:54=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Tue, Apr 23, 2024 at 6:55=E2=80=AFPM Xuxin Xiong
> <xuxinxiong@huaqin.corp-partner.google.com> wrote:
> >
> > Hi Doug, thank you!
> > We had reported this info to the CSOT to correct the vendor id.
> > If they confirm to fix this with the same product ID, we will submit a
> > patch to fix this.
>
> FYI, "top posting" like this is generally frowned upon on kernel
> mailing lists. One such reference about this is [1]. Some folks are
> very passionate about this topic, so please keep it in mind to avoid
> upsetting people in the community.
>
> In any case: did you get any response from CSOT about the improper EDID?

Just following up here. Was there any response from CSOT?

-Doug
