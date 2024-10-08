Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 188D4993F2E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 09:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9783810E47A;
	Tue,  8 Oct 2024 07:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="OnAU2YKv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0C110E47A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 07:17:45 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5389917ef34so6037104e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2024 00:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1728371864; x=1728976664;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iF+C/VS/RV7lpIbJDSd0LEsAmluU6E4geD/jADMASpk=;
 b=OnAU2YKvaJdvyy0CBz4C9qAuU7Ot+YAoO83OWVLFOzTr2FH+DH2GxRCFw6iC4gjzNb
 i4P4UoD+G9dsZBqm9L87frNlQtUqPNaWfYOzzujKCS3uyGl/XsiymVtMj8ShpCKn61Kc
 T5epwxJ2fOQLkeqYViM+GZFx/bZZsWK5qzKPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728371864; x=1728976664;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iF+C/VS/RV7lpIbJDSd0LEsAmluU6E4geD/jADMASpk=;
 b=FfxQ3RMd7R+3bzRwuCa6qVS7VB6dET4gNaEN8ZVdm/DquHXFehw9g/wW5Wl5hFLn2i
 4r5M2/gETmBKV069GaawDvg2ULVoMhLwBMFsielCdzcuWqun7Qm0KrdwGTJt8QmEC+ZT
 T7LztRfTFQp9jDK5K3uWzh9KwqMK1f13jZd+/OfD/A4ogchG9QeC6KduWzJI5a+kP147
 vrFqnGgsMRGbgrMfrZ7iBobJjdDxv/AkJb5U9dsGDK53rhnwOhcM3VhoH+cfkTgSvy0k
 Tr7hQ/2LjPMeeCPsMCVxeO9YCxBg+LQYoQ4T8AIRPlwk6IK3Qa/oom9QpSzaWw5pv3wW
 gchg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjzrOKf9dkpTTsaZA9gc2rJizdOBDrKmXGlbcHoFTidBRF7u+Tg17CyrMVSORVg8gr4GVwukOELlQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWVIcpgKaiQgQT8bogDelIXGygumE44puDajb86B3eSEfeMKWw
 Brgg0n+k2PXuqJR9XKLpwefEkq84QvATjIaYdmp8h6wEMGLOfOJPocYINyBfst9L7kJIVwqLrNk
 CVZJFO3uMvPvox1vrQaoUTqEcAnWpC0YHSMVd
X-Google-Smtp-Source: AGHT+IGJdYFdMr2wNoGuz1+xxfBC2TiAmu1OrSreQ10rgif0gERGJQsWqZVudZnKhPo9WSkHp9cPdJ5LNcY3ltFTmbI=
X-Received: by 2002:a05:6512:104b:b0:530:aa3e:f3c with SMTP id
 2adb3069b0e04-539ab87476dmr7294478e87.14.1728371863854; Tue, 08 Oct 2024
 00:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <20241008064716.14670-1-jason-jh.lin@mediatek.com>
 <CAGb2v67qnJ=ZNYziKe_4WU9KeMUpWLsOn2uoze1FLq4mH8m7Rw@mail.gmail.com>
 <6d5e9a84a3b91c82a8f16965872f7485236cd3f2.camel@mediatek.com>
In-Reply-To: <6d5e9a84a3b91c82a8f16965872f7485236cd3f2.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 8 Oct 2024 15:17:32 +0800
Message-ID: <CAGXv+5EAoNdwsma_5C0q1gXs2B4Zcz8nAuwYFcvtDPPBs6tFow@mail.gmail.com>
Subject: Re: [PATCH v10 0/5] Fix degradation problem of alpha blending series
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Cc: "wens@kernel.org" <wens@kernel.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "alpernebiyasak@gmail.com" <alpernebiyasak@gmail.com>, 
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>, 
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "yassine.oudjana@gmail.com" <yassine.oudjana@gmail.com>,
 "me@adamthiede.com" <me@adamthiede.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On Tue, Oct 8, 2024 at 3:07=E2=80=AFPM Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=
=A5=A5)
<Jason-JH.Lin@mediatek.com> wrote:
>
> On Tue, 2024-10-08 at 14:52 +0800, Chen-Yu Tsai wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  On Tue, Oct 8, 2024 at 2:47=E2=80=AFPM Jason-JH.Lin <
> > jason-jh.lin@mediatek.com> wrote:
> > >
> > > Some SoCs do not support the ignore_pixl_alpha flag, which breaks
> > the
> > > XRGB8888 format. Some SoCs do not support pre-multiplied pixel
> > formats
> > > and extending configuration of OVL pre-multiplied color formats,
> > > such as MT8173.
> > >
> > > Fix the SoC degradation problem by this sreies.
> >
> > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> >
> > > ---
> > >
> > > Change in v10:
> > > 1. Fix the commit message and comment for OVL_CON_AEN
> >
> > Please carry tested-by tags from people for cosmetic changes such as
> > this.
> >
> OK, I'm sorry about that.
>
> I thought the cover letter won't exist when the whole series go into
> the Linux mainline tree.
>
> But it still can be seen on the patchwork.

Yes. It's simply because people are lazy and don't want to reply to every
patch. Then I guess the tools were changed to support this behavior. :D

> So I'll remember to do this next time. Thanks again!
>
> Regards,
> Jason-JH.Lin
>
> ************* MEDIATEK Confidentiality Notice ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including it=
s
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or beli=
eve
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!
