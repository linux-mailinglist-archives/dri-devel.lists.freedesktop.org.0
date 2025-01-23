Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42002A19E71
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 07:25:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9800A10E1C6;
	Thu, 23 Jan 2025 06:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="I98djUd4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0961110E1C6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 06:25:19 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-54020b0dcd2so1999128e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 22:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1737613517; x=1738218317;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9bwYMmAg8VWivh0Q28h6rvauGMF0XnNE+msNjrnFeNE=;
 b=I98djUd4aCGtf/pFVbcM9x7hBqLbaoHgFnk3tSTrvtIdahwFJ/vB1nzduZXzfMcXtR
 Y6g8dZCEk7wgoj6EWol1Sw6rXk6r8bMPEO7NszhWNVnIoUi0fwmIT3IujuzLfYW4DrW8
 254rmZk3SBNjs6KYp64rU3p1crI0vQovv2oDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737613517; x=1738218317;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9bwYMmAg8VWivh0Q28h6rvauGMF0XnNE+msNjrnFeNE=;
 b=EhU36rr2nKHphFkopcOZL71a3QjOT9tAsvMnpNVEtPxKejy0/DbHtgP8X/R+7Ce5oq
 FMM7azNUDZ7WPkjWZpQla7y97PtisxC5B0SvVHwdD0ylRULqBzImzzYLfrwyy2xEgV8m
 DeLdkVDNIKQnXWaCFcefuCowio6+0hjgSplVcjBZNZF53ZSlUZCSbg0e8x6P49/opddu
 ynIzeJK/2Vx5W5/dPCEkwdNJBYzlmM8m4wrd1zs6NTaWv+3gAY7wUfES686Fwxjy3OXK
 AMhgXeMfeZOD7vfCO75jpipthDWH6oI6qOgX1SkB+y5cizfzWjUk8gd92/AUZkGhdQxM
 Qmgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRvdlhn5aDx+xLfsgGg+xHBI+BCjWJS9Q1Lt1PpzqrocFmfXZZqHZWG3T3LtA4+0R9aubI1GI0sMM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhAa9xBTKvXBWRVGueZPqluDFUdq2VE3J52eumjvHXYC1xlesr
 thD27Zz8ttsfpxBKI2gKgR8nR/LMM+j90dZ2iMuAF/JX2rWSkkRFrzOCvibDwXiq1JBdHPVpOgO
 sviBD69nHswhgsfWtACmRAFIoKyWc92dkTNd/
X-Gm-Gg: ASbGncs7n9ZsFi/1OoaM10+8+TUqnqM10d6kSJjulxLF3pHZ162LL5cnVRdlUZWVS8i
 gbz5/tqlkSbZQQGYKjrsuFyRbwVkZsj+zcFJDRzSDQcIpGLHrPAMZ+xePfOwcyvaCgao5Q5NX8h
 4A1RXYMCVv3TgJ/qB8Yw==
X-Google-Smtp-Source: AGHT+IFjV1nbatIBQFwYYLMA1abMLSRNx+Lvn+/q0MRJLEjGc9mVSRrS+HUSZbvSas2ijuwobcEMUWdONKDCpspTIUU=
X-Received: by 2002:a05:6512:128f:b0:542:8c7f:cfc1 with SMTP id
 2adb3069b0e04-543c21ff387mr771068e87.3.1737613517221; Wed, 22 Jan 2025
 22:25:17 -0800 (PST)
MIME-Version: 1.0
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
 <20250110123835.2719824-5-paul-pl.chen@mediatek.com>
 <173651725269.2671643.2891127782637834272.robh@kernel.org>
 <SG2PR03MB66367B4A9DBCC971F55DB326BC182@SG2PR03MB6636.apcprd03.prod.outlook.com>
 <d116e180-a056-4595-851c-ed1bb6f24cef@kernel.org>
 <b9405b09da418eb3c65592b53489d7f0dd4093f2.camel@mediatek.com>
In-Reply-To: <b9405b09da418eb3c65592b53489d7f0dd4093f2.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 23 Jan 2025 14:25:05 +0800
X-Gm-Features: AWEUYZkP14TqYWMXYt98_YoyRL5G3Oss74IUQkNsE40hMbKns2HVZ7v-H1NK9Uk
Message-ID: <CAGXv+5EhG+xnJmYj6kYp2hzgkX62HfxRUJZKc4_X-s09aBMvrA@mail.gmail.com>
Subject: Re: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for
 MT8196
To: =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
Cc: "robh@kernel.org" <robh@kernel.org>, "krzk@kernel.org" <krzk@kernel.org>, 
 =?UTF-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>, 
 =?UTF-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>, 
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
 =?UTF-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?= <Xiandong.Wang@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>, 
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "treapking@chromium.org" <treapking@chromium.org>
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

On Thu, Jan 23, 2025 at 2:11=E2=80=AFPM Paul-pl Chen (=E9=99=B3=E6=9F=8F=E9=
=9C=96)
<Paul-pl.Chen@mediatek.com> wrote:
>
> On Sat, 2025-01-18 at 10:22 +0100, Krzysztof Kozlowski wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >
> >
> > On 14/01/2025 06:49, Paul-pl Chen (=E9=99=B3=E6=9F=8F=E9=9C=96) wrote:
> > > Hi Rob
> > > Thanks for the advice.
> > > The root cause of the erroneous log message is due to missing
> > > power/clock dependencies.
> > > Once the MTK clock/power header file is upstreamed,
> > So this cannot be merged.
> >
> > Decouple dependencies or wait with your submission till depenedncy is
> > applied to *LINUS* tree, not even maintainer. Otherwise this breaks
> > maintainer's tree. I really suggest decoupling.
> >
> > Best regards,
> > Krzysztof
> >
>
> Hi Krzysztof
>
> I hope this email finds you well. I have a couple of questions
> regarding the EXDMA commit patch and decoupling:
>
> 1. Would removing the example from the EXDMA commit patch be sufficient
> to achieve decoupling for EXDMA YAML and MTK clock/power header?
>
> 2. If removing the example from the EXDMA YAML is not allowed, what
> alternative changes could we implement to achieve decoupling?

Just replace the macros in the example with the raw numbers, and
drop the inclusion of the header.

ChenYu

> Thank you for your time and expertise. I appreciate any insights you
> can provide.
>
> Best regards,
>
> Paul
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
