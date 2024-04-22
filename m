Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5FC8AD668
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 23:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C828310F86C;
	Mon, 22 Apr 2024 21:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="gElv9IYK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18FC310F86C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 21:15:58 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-56c5d05128dso4508936a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 14:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713820554; x=1714425354;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lf9q3FwHh8q66uQSPMgiZSA5CAzBB1McTifkB9D6GfU=;
 b=gElv9IYKkQGM1MMy8of60BwPjlos/NOeH5yGjyHVrff7KAzDcTSH5Te170zsw/j5ej
 4mnR2k4PyDlSUagwqy3bpW8488RP8o3Sdwmqfos2QFz/DtdiJg6B9OGjvo7f+5ifqBRS
 V9r4iu5xEvdaVoLkFtUWzYb4MYxC9yTKTSdMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713820554; x=1714425354;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lf9q3FwHh8q66uQSPMgiZSA5CAzBB1McTifkB9D6GfU=;
 b=M3gpaG/HFxd6pV4UYvU/o0nwXSDem/lZPveymAzVf03ESEVhZAjtclNDmHyA8lHhu2
 pyZiXiCxhqxVJjdnIM2RcDYM/ZcQfuqd95Pz0nZyTB8f7MKNUeJU7lHW84h7BBpT+a6z
 ag8G7yLHsQa9vm1sOPXyDdtqqgbjGz0lO5guCOlH84HNqK+H1O7F+UWGrXYO6OdJpoJO
 oOncBNfV/3QQ8cFGZWGE9DM8TB0N31R+NAKxZ44bjTuxkJXGDI7vuO7BLGUc5bMBZXaK
 aMbLWRxkpX+aOGE6i+6bzhg9FWpfaI/vS9/K6gqmL9Znq0EZB/mDOVRvVL+h3WiSSxam
 aq7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEtSG8riFxxSsm4O1JD/Uzjsyx8M3dQC4LOZlMe/mVTwmS7dpiTC7MDKUFFt6uyU+Aq3iP3ixtxdhvcIDLN3iJDYtFWN/2wyFy/cWOWEPR
X-Gm-Message-State: AOJu0Ywv5YO8ArIwvxhAiPY9FL5Xisp/1uCPsHqnbHCOIHZaRt7+5qpU
 lRxzCEfDkbMZe94fVx/rGFUKfttsvJ3TvbCsbTYuAPGnel1PaMEiTbJBVL9dDFSqEdfU1UKeM34
 ZAQ==
X-Google-Smtp-Source: AGHT+IHzxYdtav9sFLMvEPmFC3+yz4u5lIvF7hjmRCKscNDmXT3bKOeoe8Oco/jRx8MBTyrRBdL4AQ==
X-Received: by 2002:a17:906:da02:b0:a52:66f3:a9ee with SMTP id
 fi2-20020a170906da0200b00a5266f3a9eemr6445668ejb.41.1713820553676; 
 Mon, 22 Apr 2024 14:15:53 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com.
 [209.85.208.51]) by smtp.gmail.com with ESMTPSA id
 bl18-20020a170906c25200b00a52295e014bsm6199158ejb.92.2024.04.22.14.15.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 14:15:52 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-571b5fba660so2160a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 14:15:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXR0y+F0hNhOxX3z+MPCKlvnBPiz33Duig9wZSRPhdFrhiMb1+cJlqsu7CuBn/Mn+x8xf6vnrGzf2UTbGApr8guIvV5hjkSRthtqfmDr15B
X-Received: by 2002:a50:8d5b:0:b0:571:d9eb:a345 with SMTP id
 t27-20020a508d5b000000b00571d9eba345mr57099edt.4.1713820551808; Mon, 22 Apr
 2024 14:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240422090310.3311429-1-yangcong5@huaqin.corp-partner.google.com>
 <20240422090310.3311429-2-yangcong5@huaqin.corp-partner.google.com>
 <20240422151424.GA1273350-robh@kernel.org>
In-Reply-To: <20240422151424.GA1273350-robh@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Apr 2024 14:15:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UCq9FmhFHfczxGAM+P=foz-XmNvO9r79=3=0SXUYQz8Q@mail.gmail.com>
Message-ID: <CAD=FV=UCq9FmhFHfczxGAM+P=foz-XmNvO9r79=3=0SXUYQz8Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: display: panel: Add himax hx83102
 panel bindings
To: Rob Herring <robh@kernel.org>
Cc: Cong Yang <yangcong5@huaqin.corp-partner.google.com>, sam@ravnborg.org, 
 neil.armstrong@linaro.org, daniel@ffwll.ch, linus.walleij@linaro.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com
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

On Mon, Apr 22, 2024 at 8:14=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> > +additionalProperties: false
>
> Perhaps 'unevaluatedProperties' instead. Don't you want to support
> standard properties such as width-mm/height-mm?

For at least those two properties, it looks like the answer is "no".
From reading the Linux driver it appears that physical width/height is
implied by the compatible string. Unless there are other properties we
think we need, maybe it's fine to keep "additionalProperties" ?

-Doug
