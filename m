Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A3692EFBF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 21:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC92410EADA;
	Thu, 11 Jul 2024 19:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="S+5C90W1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3881010EADA
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 19:36:51 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-79f16c85da0so81610685a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 12:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1720726610; x=1721331410;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nYCTn4/p66mHlGbWx9vmwvaVwx5YCoUoX/9c7g8wN78=;
 b=S+5C90W1vH0RzI3iaynEZSZQfiCOzlS5O3ZqML+ll/h8Tb1K5LrTVzA9/XJvLs82UJ
 uRMmNpzQcdLckuyAk82jhnOpb91IXqbtjbWRc8OlzPzq/CAvRjIAbgCYrnsnq0YiKBYt
 6C6JcOs96kOzKo48W3DuErq/JlMs1ky8ZOWyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720726610; x=1721331410;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nYCTn4/p66mHlGbWx9vmwvaVwx5YCoUoX/9c7g8wN78=;
 b=jiri5cISRVwP9i44T9IqOTS9YuX4dgzHW6ooRVBBc4/EcDw0oW2bKzQfisNu+p27O4
 xRdtNhJ0SNFH4leRi82xGNjiuF4jGLtFyh5MHiKMpoaUg7LuzgLcBzwDHs9aig37bjXd
 vmtDE9uvqVW0M3Hl2XPM3MpkqCZ5O53T42SlSHrZ8iHnabhjqTRi1PFv+AMnVdMKkQLp
 4NjDgAGoRPSZ5fpq4pmXrTm88ZIFCyEkKUy3TjfbceKbhS2pQkAXEk/Qr/jCMujUWyUs
 KCEVqsRAGyxfV09KVo+tfBBMsoj3KQQnAkUhyOO0kR/ai1/ggrrdoQ3akwdaglwsAder
 Ftnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeZXEKKVlyiESAuAxrOiR8O6q/5MAJ1fqsbrXxEis/bA4QQrQ/rHr6/7lyCMjhJ6cIAQc4wge4wh3rw58VGPDapAXDIIHnb1IrtdB/ykA/
X-Gm-Message-State: AOJu0YwSvrZoM2m6K1QUG9mzbnp1g1VnCs2/Uc3hsNZX0o57UpVfz/of
 ZwDAy3oN5UMLJM8bqnuvt40NpqVP3O9Q7aMIxf7Kl8uHYP3t5Rd4vbxU59v+RSaTvLYaGvdsh6k
 =
X-Google-Smtp-Source: AGHT+IHFcxMVEs5ky2EW6WBQzMPd87ckpr+sCsv6lxk3Eviy9A9EK15PFjEvlTPUulsZXu6cDFoqKQ==
X-Received: by 2002:a05:620a:494a:b0:79d:7506:f194 with SMTP id
 af79cd13be357-79f19bf214fmr984712385a.48.1720726609556; 
 Thu, 11 Jul 2024 12:36:49 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com.
 [209.85.160.180]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79f190872d7sm322970085a.93.2024.07.11.12.36.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 12:36:48 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-447df43324fso60591cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 12:36:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWkpMkPBsB4Dtrl0hwciXh7JKOPtjXNL6aZRNNDV2XG5K9ZT4lmkqdoHKHEu1tsz3mHxdWf9NeOZ7BfhPsETRys+S1F7uBQUqxv+I89k3/W
X-Received: by 2002:a05:622a:1808:b0:447:e04d:51b1 with SMTP id
 d75a77b69052e-44e793e5b1fmr549761cf.11.1720726608407; Thu, 11 Jul 2024
 12:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240710084715.1119935-1-yangcong5@huaqin.corp-partner.google.com>
 <20240710084715.1119935-5-yangcong5@huaqin.corp-partner.google.com>
 <D2LQJROQYIY3.2Q88EXS8HUDLQ@kernel.org>
 <CAD=FV=WAosZPSKdpwR6pjOmiy4hih=jXaMg2guuVgmc+qj-Csw@mail.gmail.com>
 <D2M42ODWQPAU.I0BMEOLKUP29@kernel.org>
 <CAHwB_NJ+YEMoL18Sr9HFmTVH_ErDztyF7vxxPFAE0Y2ta3dO0A@mail.gmail.com>
In-Reply-To: <CAHwB_NJ+YEMoL18Sr9HFmTVH_ErDztyF7vxxPFAE0Y2ta3dO0A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 11 Jul 2024 12:36:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VNx5qEyWDvVz6AVDryqvw09tkYRYMjbFuUQS4Wvyok6Q@mail.gmail.com>
Message-ID: <CAD=FV=VNx5qEyWDvVz6AVDryqvw09tkYRYMjbFuUQS4Wvyok6Q@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] drm/panel: ili9806e: Break some CMDS into helper
 functions
To: cong yang <yangcong5@huaqin.corp-partner.google.com>
Cc: Michael Walle <mwalle@kernel.org>, quic_jesszhan@quicinc.com,
 neil.armstrong@linaro.org, 
 linus.walleij@linaro.org, airlied@gmail.com, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
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

On Wed, Jul 10, 2024 at 6:09=E2=80=AFPM cong yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Hi,
>
> Michael Walle <mwalle@kernel.org> =E4=BA=8E2024=E5=B9=B47=E6=9C=8811=E6=
=97=A5=E5=91=A8=E5=9B=9B 03:38=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Wed Jul 10, 2024 at 9:12 PM CEST, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Wed, Jul 10, 2024 at 2:02=E2=80=AFAM Michael Walle <mwalle@kernel.=
org> wrote:
> > > >
> > > > On Wed Jul 10, 2024 at 10:47 AM CEST, Cong Yang wrote:
> > > > > Break select page cmds into helper function.
> > > >
> > > > Why though? I don't find that anything easier to read. In fact, I
> > > > deliberately chose not to factor that out into a function. It's jus=
t
> > > > a sequence of magic commands, taken straight from the datasheet. So=
,
> > > > I'd like to keep it that way.
> > >
> > > The consensus of previous discussion on the lists was that folks
> > > agreed that we should, where possible, make it more obvious what thes=
e
> > > magic sequences of commands were doing. IMO separating out the page
> > > switch command helps. Certainly I'm always happy to hear other
> > > opinions, though.
> >
> > Fair enough, but in that case, one should take the datasheet (which
> > you can find online) and replace all the magic numbers with the
> > correct command names from it. E.g. 0xff is the ENEXTC register. To
> > be clear, I'm not just talking about the "switch page command".
> >
> > As patch stands, I don't see much value, TBH. On the contrary, you
> > make it harder to compare it with the Ortustech panel datasheet.
> >
> > just my 2c,
> > -michael
>
> If all drivers replace all the magic numbers with the correct command nam=
es,
> it will be a huge amount of work (assuming that the datasheet can be foun=
d).
>  I am afraid I don't have enough time to complete it.  Thanks.

Makes sense. I'd be interested in hearing the opinion of others in the
DRM community about whether they'd prefer to land something long this
patch as-is or drop it.

-Doug
