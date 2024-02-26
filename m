Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0126867AE8
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 16:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C415C10E799;
	Mon, 26 Feb 2024 15:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jJPx5ERP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF9F10E799
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 15:56:32 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-563c403719cso3980968a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 07:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708962988; x=1709567788;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wTNfxtjjEuUsYp1JNTlYg2x2iUW0rS+mI/kNL5uqq8k=;
 b=jJPx5ERP5GZ2+efbAY9fflcK5Gaa45Ae2m3t6v8FX2Musq4K1n64KenBjDi8dxdbDs
 DRLauxpHh/Uy7nw/sbWzUb0huOKRB2GUJ6T97nL7+QVHmSH/lY7BO4Rgpt10aKcTPy2+
 vgb6kY2V9Jae4VSKaGHtltdzV6/JjoA3pSwKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708962988; x=1709567788;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wTNfxtjjEuUsYp1JNTlYg2x2iUW0rS+mI/kNL5uqq8k=;
 b=V2sOuefLV5rJSP/+WpTxLfxmTA3blNydpS1qkIV8ZsXR5DWxn8AFzfTMhBd0jvJl1G
 EBB+sMB8DrifDB1G/4rOYsjPbXgGa2dFdVUnAvy9nwmNOAkQsN44sZ3kAxyOmM7jjo1p
 it+3wFGjPE4Y7UfwQbTaurRcS8jQCGlYGNeCShKpFpS/pwDHPRzefjPGlTFa0lwEEBUB
 p/LpSbm043486Cbwx8yZ+chQZV8aeDQnGby/d9sDIlAb9MqEyyckkiU/vsZKh5rhEC1V
 wYyupj382t0Dtmmt9Za2LDEEtv1crlddzHMq34ooY08AqoqZDFERwjTQ0BK/vp4jt8rc
 eboA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd374LDf2yimRrgaforNuT/eWhx/z9l+OGX2oznQBpqiC8vfa6Pf2YuFm/IiusDdOKQ2F5acHf0Yn9yWOt8B95PbDRKRW53wwAtmMthL6A
X-Gm-Message-State: AOJu0YxULKUkcyOJ/bRkaPom3cv7z2nYImHRzxEqKojSZSznuGcgiG0K
 zLF8vmM1nEJkRm7a9UbSJg2jBZBapCCa3T91QXBWM2bYpFzcs1YudioYSjWhF1Zw8fUMpphGdsg
 u4w==
X-Google-Smtp-Source: AGHT+IGMuhdSTcVYJK8VpFtdqblctY4N2RiHqn93+MPlD5vjDtd8c2FDhdXHpLUz0bIR+OPVKM6K7A==
X-Received: by 2002:a05:6402:b33:b0:565:47d0:1ea with SMTP id
 bo19-20020a0564020b3300b0056547d001eamr6017856edb.12.1708962988439; 
 Mon, 26 Feb 2024 07:56:28 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
 [209.85.208.46]) by smtp.gmail.com with ESMTPSA id
 z18-20020aa7c652000000b005657eefa8e9sm2417560edr.4.2024.02.26.07.56.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 07:56:27 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-56619428c41so5898a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 07:56:26 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUSXQpPUN9l+fEAXx0CbvurQXXjQZUeayFipn/C3ymd4x6CBpjSg44XXqDuc1DKlaNAfQH+9E22fxmtQm0pXvlN3IocLtFwd1UulBGnw4Ee
X-Received: by 2002:a50:9f28:0:b0:562:9d2:8857 with SMTP id
 b37-20020a509f28000000b0056209d28857mr330238edf.6.1708962985791; Mon, 26 Feb
 2024 07:56:25 -0800 (PST)
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-3-dc0964ef7d96@quicinc.com>
 <CAA8EJpo=9vhM+5YzaFxUoYRuEWQyrMS8wLNPSF3K=bN5JwWyDw@mail.gmail.com>
 <8313a7c3-3ace-4dee-ad27-8f51a06cd58c@linaro.org>
 <CAA8EJpqFj5nf8d_=Uoup7qg+nQrxqQU-DHbL3uSP138m9AcXLw@mail.gmail.com>
 <8fcb5816-2d59-4e27-ba68-8e0ed6e7d839@linaro.org>
 <CAA8EJporaUuddHHqpyYHiYSu=toHmrDxSHf9msZUJoym4Nz72g@mail.gmail.com>
 <20240222150423.GI2936378@hu-bjorande-lv.qualcomm.com>
 <CAA8EJpqd=1KV_dN8AURQDcFDDyO+YtbC59gM7ftt+HohGM93hg@mail.gmail.com>
In-Reply-To: <CAA8EJpqd=1KV_dN8AURQDcFDDyO+YtbC59gM7ftt+HohGM93hg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 26 Feb 2024 07:56:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XJVFX-GkL-wiAoi=r6tdiDHkJ_aFSpx6FE6+gFT5xJjA@mail.gmail.com>
Message-ID: <CAD=FV=XJVFX-GkL-wiAoi=r6tdiDHkJ_aFSpx6FE6+gFT5xJjA@mail.gmail.com>
Subject: Re: [PATCH 3/9] arm64: dts: qcom: sc7280: Enable MDP turbo mode
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
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

On Thu, Feb 22, 2024 at 9:32=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 22 Feb 2024 at 17:04, Bjorn Andersson <quic_bjorande@quicinc.com>=
 wrote:
> >
> > On Thu, Feb 22, 2024 at 11:46:26AM +0200, Dmitry Baryshkov wrote:
> > > On Thu, 22 Feb 2024 at 11:28, Konrad Dybcio <konrad.dybcio@linaro.org=
> wrote:
> > > >
> > > >
> > > >
> > > > On 2/22/24 10:04, Dmitry Baryshkov wrote:
> > > > > On Thu, 22 Feb 2024 at 10:56, Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
> > > > >>
> > > > >>
> > > > >>
> > > > >> On 2/22/24 00:41, Dmitry Baryshkov wrote:
> > > > >>> On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@qu=
icinc.com> wrote:
> > > > >>>>
> > > > >>>> The max frequency listed in the DPU opp-table is 506MHz, this =
is not
> > > > >>>> sufficient to drive a 4k@60 display, resulting in constant und=
errun.
> > > > >>>>
> > > > >>>> Add the missing MDP_CLK turbo frequency of 608MHz to the opp-t=
able to
> > > > >>>> fix this.
> > > > >>>
> > > > >>> I think we might want to keep this disabled for ChromeOS device=
s. Doug?
> > > > >>
> > > > >> ChromeOS devices don't get a special SoC
> > > > >
> > > > > But they have the sc7280-chrome-common.dtsi, which might contain =
a
> > > > > corresponding /delete-node/ .
> > > >
> > > > What does that change? The clock rates are bound to the
> > > > SoC and the effective values are limited by link-frequencies
> > > > or the panel driver.
> > >
> > > Preventing the DPU from overheating? Or spending too much power?
> > >
> >
> > Perhaps I'm misunderstanding the implementation then, are we always
> > running at the max opp? I thought the opp was selected based on the
> > current need for performance?
>
> Yes. My concern was whether the Chrome people purposely skipped this
> top/turbo freq for any reason. In such a case, surprising them by
> adding it to all platforms might be not the best idea. I hope Doug can
> comment here.

Thanks for thinking of us! In this case, I think the only users left
of the sc7280 Chrome devices are folks like Rob and then a few folks
on Qualcomm's display team (like Abhinav), so if they're happy with
the change then I have no objections.

In any case, I'm not aware of any reason why this would have been
skipped for Chrome. The Chrome devices were always intended to support
4K so I assume this was an oversight and nothing more. ...of course,
as Abhinav points out Chrome devices are currently limited to HBR2 + 2
lanes DP so they can't go 4K60 anyway.

In any case, in case it matters, feel free to have:

Acked-by: Douglas Anderson <dianders@chromium.org>
