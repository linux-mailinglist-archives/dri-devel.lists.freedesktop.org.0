Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEF874A461
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 21:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A120210E4A5;
	Thu,  6 Jul 2023 19:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA36410E4A5
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 19:26:14 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b700e85950so16015001fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 12:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1688671570; x=1691263570;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QwiJDSaQJG4lpB+RWHzg/aQo8bzBN6e2ZdzlXuST6zU=;
 b=I46+KFW7OEboHnlAREa6XAM6C6bxDJFGnR4lUtJu6MoMpPhcMUaYLNeVdNfKlSqHnX
 0aKT8S3D0y7ysuZQeuoQSAA6Yxvo2AG7gWr1baGFzhNY5/tACO2vjFe8nw6vA2juV7lR
 MBx0kabtFf7WuM41nFQE+ZQhTTQXwylRoQ/24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688671570; x=1691263570;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QwiJDSaQJG4lpB+RWHzg/aQo8bzBN6e2ZdzlXuST6zU=;
 b=JpHQgsKNLUmXu/S7vo1/3KiPZgn7CFV9zvoAa8rOUu/JWOnUv3FeL1IrBHiqzWvkWn
 8WTNS5/hxfwgSG5oIv1kjaAd3GR3JZW9Vm52SfsxujBo2xlpM6nAL8OGuXr0qyxMn+BI
 MD5W1ZE4vO5ouLMGzeu/r79gGDxXTA85d2dTV0W4Uctz2Hw2nlgWFaRopASOO3LZWoRw
 AfDZtKhJRTb1gaoHr/q9pG0saLCT7SzIRkNkdlO5975/A4B6wxqnNd0aSv5rI4LC4IAV
 Gma3RXzBPX1/PC6/u6pHxErtirI1Zbna2n8EV0EeDcmDYbKOWQq9MMfCqYNqTIsc/nbT
 qg/g==
X-Gm-Message-State: ABy/qLY1O+u88IeNVQcnmv2iQ1nOhszl5eVES8/OXIe7U8nPlFAJ5LPh
 yMQTUrXv03eogBlH6Jv0etbtEL9Y3t9AYCDKITguNFG0
X-Google-Smtp-Source: APBJJlGAvclyd586dVvg3AM8vlDmfzPdg4EnLQkaK4KlMpZ0VjoSC9rjUE8gKRBJHZGUlI3WRFYdyA==
X-Received: by 2002:a2e:880a:0:b0:2b6:df5d:8e05 with SMTP id
 x10-20020a2e880a000000b002b6df5d8e05mr2156728ljh.33.1688671570124; 
 Thu, 06 Jul 2023 12:26:10 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com.
 [209.85.208.49]) by smtp.gmail.com with ESMTPSA id
 lg7-20020a170906f88700b0098d93142ce1sm1161245ejb.109.2023.07.06.12.26.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 12:26:09 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-51ddbf83ff9so2119a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 12:26:09 -0700 (PDT)
X-Received: by 2002:a50:d0d2:0:b0:51a:1d77:e69d with SMTP id
 g18-20020a50d0d2000000b0051a1d77e69dmr11060edf.3.1688671569035; Thu, 06 Jul
 2023 12:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230627050148.2045691-1-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=WR=fnhCxC37Eo3hinh2MV=eTNuXG+GrwgR6K_pV4Rbaw@mail.gmail.com>
 <CAD=FV=UcFn7Wq_Ock6RCT0mPhgjpJwF7dJjcbwcoESW9nni62Q@mail.gmail.com>
 <CACRpkdb_6n+CKUHYu5nAtCEKK_VwO2hGUUCHny56oSYt_vTfLw@mail.gmail.com>
In-Reply-To: <CACRpkdb_6n+CKUHYu5nAtCEKK_VwO2hGUUCHny56oSYt_vTfLw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Jul 2023 12:25:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WwRiAzfV0Unk8ipnWJkTiDYraJHAwH+Oq5Q0=4TJ6ESA@mail.gmail.com>
Message-ID: <CAD=FV=WwRiAzfV0Unk8ipnWJkTiDYraJHAwH+Oq5Q0=4TJ6ESA@mail.gmail.com>
Subject: Re: [v2] drm/panel: Fine tune Starry-ili9882t panel HFP and HBP
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hsinyi@google.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jul 4, 2023 at 12:39=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Fri, Jun 30, 2023 at 2:42=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
>
> > ...this means that it lands in drm-misc-next-fixes, so I've pushed it t=
here.
> >
> > 59bba51ec2a5 drm/panel: Fine tune Starry-ili9882t panel HFP and HBP
>
> I guess that means we need to merge drm-misc-next-fixes back to the
> drm-misc-next branch so that I can rebase my series breaking out the
> ili9882t driver to its own file?

It looks like this fix is on its way to the main DRM tree:

https://lore.kernel.org/r/20230706112203.GA30555@linux-uq9g

Presumably if we wait a few days things will sort themselves out. If
something needs to happen sooner then we'll have to get the drm-misc
maintainers involved. Probably at this point it makes sense to wait?

-Doug
