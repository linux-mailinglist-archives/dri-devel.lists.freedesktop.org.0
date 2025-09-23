Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C7DB93D8A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 03:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D61110E1EA;
	Tue, 23 Sep 2025 01:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CBVOjYnf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5CE10E1EA
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 01:29:37 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-3306d93e562so4370252a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 18:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758590977; x=1759195777; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UGIEsRlxQ6SB/60aNk9YuezwzaWruzT6GSumf3z2VMQ=;
 b=CBVOjYnfcDruHMdptF6haUUMcyvkIS70kvjBhv4DPtcXYUQnpqX2gyMDtOjHSzGgRX
 jGLK7nSEpSvore5m4qmzZW+qfdJKjhY1PCi41hqYhDD2Hbros0Qmya0/hyn6GEagbf59
 WHavKaGKBShA6605X3FWmBv6DkqsBIEB5D+iP2eplLD6l3HvONhMh5SoeAwhTzade3mp
 58HoZWJdsKXQ90mESaQGqXoHSGhVb+AzshQwYv6U4ey9yrEsx7fYNii/kt0yZ7bFdWJ5
 S9dvm/h7jTh96zzkncoOy3ilAH0MiCZtA1bT/sm/fuH4ze+gtIi5dQ/9qObJQFr8o6s5
 SvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758590977; x=1759195777;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UGIEsRlxQ6SB/60aNk9YuezwzaWruzT6GSumf3z2VMQ=;
 b=EJAvRblS0hDbDa7c1nqfSW7nEGVYwSJJemqK3VsxCd4HSeEeTNWNk+NCk8JWs1p4mX
 i203lXeBmpGL3/QZhL34mP0I4blTQdkw5H3t33KhzrlUf9VWTZ3MmAU3pYIHqJ9KNTa1
 XHjSepUeOz69SA1Sg6O1311WWhqV7Nv/WMnYtrCh05dZjZOHyLF+8kHWLeJDi8+PrCaE
 /lRyMMRzKclvfvFqRZ+bT2vfNOJTzuQH6ogvP1UqxdpygLD3P92tllIw8mzxxwUtnHUm
 DNSvZ79JD6fYbp7rq/HzYRfpeUX9ysk76f5Py4OudGfUEfLDr7CBYWdzwdr9GorKMXJc
 vUMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjIA+bpIOdZrqz1bDZ+MRr6HrawecN+CzyK/IqN2NeOsC6v+yhJ+u31AHbRZp+zsn0Xdsv5hm8o08=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwVaaz8jXXyHIHJs4SZ5AHx1Ru0SrCKrnPrpPg7rXCNi6wMsEb
 YTxnM6VPN6ok8BbH6+OR2h6w5QhG4vF9ihFWJybkRQhWt6/6ej95tMx4JGMDYsbdmMCDV6S0fA8
 kzmTDvOHT4CHPLe9kvCUF/xTcZZZOtLw=
X-Gm-Gg: ASbGncv5hBKsZCCbP2q4oP3cM2ZwQikDzQ05BgJ5CZetXc3tB1df+0+xUrRDjEu3S0u
 M4y3+ZJ8+POAiVbdjU8/iliuk3QBzLflrJjkzPsRN6j7y1yvvirBhcMKgTKlTliIFi/65lsHgIL
 Izayf/EKjb3eAQ4zvz+659usv/J5U9MEqFjFPQ3ammczpC/gvbrvQ6SBsRhuY4/CHTdufGpvcS4
 QOazOQ=
X-Google-Smtp-Source: AGHT+IGBT9LTfm84q4DXIRoJSFR8hZ2WWRU49SsvtumqUnLfaKU5tnx1duKBXoUog0HE+Dc5+BSde4IFSplat+4nyaY=
X-Received: by 2002:a17:90b:33c8:b0:32d:f4cb:7486 with SMTP id
 98e67ed59e1d1-332a95e8e19mr1041351a91.19.1758590976762; Mon, 22 Sep 2025
 18:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
 <20250821073131.2550798-5-shengjiu.wang@nxp.com>
 <20250901185208.394cd162@booty>
 <CAA+D8AOCTqb5jLeRapYk4wRGZrsrPiuAR=ow3OA1B0+M9X4k7w@mail.gmail.com>
 <20250909-omniscient-honeybee-of-development-adca8a@houat>
 <CAA+D8AM=aRU-0QcgtxZ+=YBZ2+kMrP2uzSE3e+NJs3Z3zkrSVg@mail.gmail.com>
 <97288c51-954a-48a9-92b9-e165ce480707@nxp.com>
In-Reply-To: <97288c51-954a-48a9-92b9-e165ce480707@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 23 Sep 2025 09:29:23 +0800
X-Gm-Features: AS18NWBhgiBnQW_QrjL4oCw3YUyblBEb719xz-MBTlZAVwouH205ucQ6fmr_z54
Message-ID: <CAA+D8APA85PhWVkW7c=d_qWF7L1ERxe7cS3Gg00SV-3TSyLwQw@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] drm/bridge: dw-hdmi: Add API
 dw_hdmi_set_sample_iec958() for iec958 format
To: Liu Ying <victor.liu@nxp.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, 
 dianders@chromium.org, cristian.ciocaltea@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de, 
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org
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

On Mon, Sep 22, 2025 at 11:01=E2=80=AFAM Liu Ying <victor.liu@nxp.com> wrot=
e:
>
> On 09/10/2025, Shengjiu Wang wrote:
> > Hi
> >
> > On Tue, Sep 9, 2025 at 2:39=E2=80=AFPM Maxime Ripard <mripard@kernel.or=
g> wrote:
> >>
> >> Hi,
> >>
> >> On Wed, Sep 03, 2025 at 06:41:05PM +0800, Shengjiu Wang wrote:
> >>> On Tue, Sep 2, 2025 at 12:52=E2=80=AFAM Luca Ceresoli <luca.ceresoli@=
bootlin.com> wrote:
> >>>>
> >>>> Hello Shengjiu,
> >>>>
> >>>> On Thu, 21 Aug 2025 15:31:28 +0800
> >>>> Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> >>>>
> >>>>> Add API dw_hdmi_set_sample_iec958() for IEC958 format because audio=
 device
> >>>>> driver needs IEC958 information to configure this specific setting.
> >>>>>
> >>>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>>>> Acked-by: Liu Ying <victor.liu@nxp.com>
> >>>>
> >>>> [...]
> >>>>
> >>>>> +void dw_hdmi_set_sample_iec958(struct dw_hdmi *hdmi, unsigned int =
iec958)
> >>>>> +{
> >>>>> +     mutex_lock(&hdmi->audio_mutex);
> >>>>> +     hdmi->sample_iec958 =3D iec958;
> >>>>> +     mutex_unlock(&hdmi->audio_mutex);
> >>>>> +}
> >>>>
> >>>> Apologies for jumping in the discussion as late as in v5, but I noti=
ced
> >>>> this patch and I was wondering whether this mutex_lock/unlock() is
> >>>> really needed, as you're copying an int.
> >>>
> >>> Thanks for your comments.
> >>>
> >>> Seems it is not necessary to add mutex here. I just follow the code a=
s
> >>> other similar functions.  I will send a new version to update it.
> >>
> >> Let's not be smart about it. Next thing you know, someone will add
> >> another field in there that would absolutely require a mutex and now
> >> you're not race free anymore.
> >>
> >> Unless there's a real concern, the mutex must stay.
> >>
> >
> > Ok, thanks for comments.  Then Patch v6 need to be dropped.
>
> To properly track the changelog with patchwork, can you send v7 to add
> the mutex?

Yes, will send it.

Best regards

Shengjiu wang

>
> >
> > Is there any other comments for this Patch v5?
> > If no, can this series be accepted?
> >
> > Best regards
> > Shengjiu Wang
>
>
> --
> Regards,
> Liu Ying
