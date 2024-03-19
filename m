Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2B9880665
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 22:00:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A50510E98F;
	Tue, 19 Mar 2024 21:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="StqqiEsN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0868110E98F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 21:00:38 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-56b85146589so492516a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 14:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710882034; x=1711486834;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XJm66ymQj4qZljhVLm+D5W3oaVWUS1R2lKPopMwVbNw=;
 b=StqqiEsNjMpQs2tlO0LmlcIo9dGUPa8N9xl/xSHGFdIw9Lfgfs3ZB9Z17t3nsAqMmr
 OjfM79Y+uhv7VTst+RhFFP5XEZcxPxLYcN+OoPoTC1phJ6gzMjRu/gTFjFi7e/Qp9+Eu
 c6UYyDRuqFsHrj2Hp2VT4Zl/a9DpUax/Hzcnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710882034; x=1711486834;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XJm66ymQj4qZljhVLm+D5W3oaVWUS1R2lKPopMwVbNw=;
 b=peXXHORgXDllD3TxXdcbZ0+XG6wUOYd4i+nmJOmSdmqFbtl6H9LH1NV/2vN7D9xp9n
 4yl9arHtwoJ19MgWw0/vswGiY5nH446RdjCHjVj9hhXqMPGiBzM71AWqIGZdlS9cLCKU
 fdNuzTA+N8Uq3t7VEfLS930nQMcQtUYnKUEPa6WfO8zxC8kTrsMioUgD36GvrJ4c/Ulv
 TUvohjNinrZhjD9+ZrwqFTz2W8sky8K3Anb+BppXcUAFhOEaZQykddVHR7KnyJe0ufjy
 hNUp1UXQ0PZGOCOFZ95B55HYheNyiseQaOrU6WwCnaIGUz9hfuS96zAxWWjY/+eBxVcz
 CBZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6iKiLJRETkDu73VHiOdeCqCtWbbBmsBR6eSmp+iPvOCwlGBufT5hGr6cnlVRH+IHgyjtZ5y/mQ6dQxY8a+EIBiA+ojEl0WpGf06cbxwOE
X-Gm-Message-State: AOJu0Yz3SrUCQaXcOXHk4yJgx35FAUCfgrILV458Jbb/FhFKcrWBDdkm
 xuDEKRKssNZZNeBe9tleirInO75GhqeXj+PxaWNDaRCWf2wCu9aB8DlLKh39hQzdluj+5ahNAJB
 fsg==
X-Google-Smtp-Source: AGHT+IFbbcPoB8sEEZ7oAxX3sKXUIwe3w4lNBByuaRJlMYfnhWgrKnn9WXCzM3fOlw18zaKfA/Y0eg==
X-Received: by 2002:a50:935a:0:b0:568:a226:6685 with SMTP id
 n26-20020a50935a000000b00568a2266685mr3551259eda.8.1710882034332; 
 Tue, 19 Mar 2024 14:00:34 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50]) by smtp.gmail.com with ESMTPSA id
 et5-20020a056402378500b0056ba8b68505sm220955edb.92.2024.03.19.14.00.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 14:00:33 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-41428b378b9so8035e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 14:00:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXMm0p0gLBzJTSmZbCPS7J8m4iV98l4cBewbP5ntPFQyMAOgHucKHOfdYvyjzOZYDJ1aTTNPHfpnQe0hzL6JLbPJ76iolsyhUWEsYgiBjvR
X-Received: by 2002:a7b:cbd0:0:b0:414:da8:76dc with SMTP id
 n16-20020a7bcbd0000000b004140da876dcmr63824wmi.6.1710882032388; Tue, 19 Mar
 2024 14:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240319111432.1.I521dad0693cc24fe4dd14cba0c7048d94f5b6b41@changeid>
 <CAA8EJpq-NjmYkWHAVsuP5jA_Z7Xx0jCiqEDgU-0ni9BCg7Opuw@mail.gmail.com>
 <2fa9a262-de60-2c1e-9ac3-1e478ec65bb8@quicinc.com>
 <CAA8EJpqg+Di7PH2bmQ6uMidD3MhQ+N7w-1MWWEOBrH5DbsWSTA@mail.gmail.com>
 <977f647a-fc30-d9c9-f973-fd8bd9a4020a@quicinc.com>
 <CAA8EJpoAwRKbHxVhi0q9koSUWFPcD4sP=F36r+rYsrtbY0fLkQ@mail.gmail.com>
In-Reply-To: <CAA8EJpoAwRKbHxVhi0q9koSUWFPcD4sP=F36r+rYsrtbY0fLkQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 19 Mar 2024 14:00:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W0k5U0i+Q_X_3HAviY-LXNrAw=PFjWDg+eej-Kq=0Y3w@mail.gmail.com>
Message-ID: <CAD=FV=W0k5U0i+Q_X_3HAviY-LXNrAw=PFjWDg+eej-Kq=0Y3w@mail.gmail.com>
Subject: Re: [PATCH] drm/dp: Clarify that wait_hpd_asserted() is not optional
 for panels
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Imre Deak <imre.deak@intel.com>, 
 Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org
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

On Tue, Mar 19, 2024 at 1:55=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> > >>>> -        * panel to finish powering on. This is an optional functi=
on.
> > >>>> +        * panel to finish powering on. It is optional for DP AUX =
controllers
> > >>>> +        * to implement this function but required for DP AUX endp=
oints (panel
> > >>>> +        * drivers) to call it after powering up but before doing =
AUX transfers.
> > >>>> +        * If a DP AUX controller does not implement this function=
 then it
> > >>>> +        * may still support eDP panels that use the AUX controlle=
r's built-in
> > >>>> +        * HPD signal by implementing a long wait for HPD in the t=
ransfer()
> > >>>> +        * callback, though this is deprecated.
> > >>>
> > >>> It doesn't cover a valid case when the panel driver handles HPD sig=
nal
> > >>> on its own.
> > >>>
> > >>
> > >> This doc is only for wait_for_hpd_asserted(). If panel driver handle=
s
> > >> HPD signal on its own, this will not be called. Do we need a doc for=
 that?
> > >
> > > This comment declares that this callback must be called by the panel
> > > driver: '...but required for DP AUX endpoints [...] to call it after
> > > powering up but before doing AUX transfers.'
> > >
> > > If we were to follow documentation changes from this patch, we'd have
> > > to patch panel-edp to always call wait_for_hpd_asserted, even if HPD
> > > GPIO is used. However this is not correct from my POV.
> > >
> >
> > hmmm I dont mind explicitly saying "unless the panel can independently
> > check the HPD state" but not required in my opinion because if panel wa=
s
> > capable of checking the HPD gpio (its self-capable) why would it even
> > call wait_for_hpd_asserted?
>
> I'm fine with the proposed change. Doug?
>
> >
> > I will let you and Doug discuss this but fwiw, I am fine without this
> > additional clarification. So the R-b stands with or without this
> > additional clause.

Adjusted wording in v2. Kept Abhniav's R-b. PTAL.

https://lore.kernel.org/r/20240319135836.v2.1.I521dad0693cc24fe4dd14cba0c70=
48d94f5b6b41@changeid
