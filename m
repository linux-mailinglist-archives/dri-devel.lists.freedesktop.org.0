Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAB3805CDD
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 19:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDEAF10E5E1;
	Tue,  5 Dec 2023 18:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66E210E5E1
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 18:06:09 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-54c7744a93fso4637790a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 10:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701799567; x=1702404367;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yIfHQzLRNk16QqkBZwMJZjQhju2kwUVGG/rCp3aPtx0=;
 b=EVbqwXyxKmQyZqm3fVJLLxe2Add4PjnLkN7Ol8oyV2lQE+8dXmaC+vcGkTQlFS2Ap9
 +piblLTAONdinw+wuzulU5sV17BlgrduzJTLuO3sZ7kNCRoBEE9Kzo6KRbSwgSkc9sNg
 K+o9fXI62H85INuBwDI1DyLc2kyH+VQDffMTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701799567; x=1702404367;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yIfHQzLRNk16QqkBZwMJZjQhju2kwUVGG/rCp3aPtx0=;
 b=Jlq+b1ghCTG3Lu5+2MgQFsuFp/455awlDL/s9/njUcoLM9zugrVljuEQ1HfmaEO4zT
 nCUYXBYFyNXfwR/vW7550lXPDOQZZOS5P2A7eW5Vw3dynVCdsIj/Kso+VVonl6MDrg+E
 9yPjsE9QxdrBYzQa9SWpajIY3sQm9BF1QMscdkR24cH3kJCtEcmuQ6mlM9mu0V0gHtIg
 qprmRBuezKEGFTxhPCA4XMcSr6ls475U+/nZXX/op+ZE+spawdnS37ln3jxHoTYX4TMQ
 0OnHGKh9vJa51xVPGvRePnHWVeWVQyy0vkKie6m0lLFZO/OL9b1Tl1vZu03eL/PQanxZ
 0qVQ==
X-Gm-Message-State: AOJu0Yzuw6q6IyQHDR1LsqA40QKGNAMwPckbPDMMka2+rdun6jsB1SmJ
 +4k8ZMLaUsFSt37+OV1jl5/GRjxQEYYvgHMxwAbYa4bA
X-Google-Smtp-Source: AGHT+IFlXEMhN1IiiG4/nar7nxVeyHPEXGLuhYNTpKmd2gfeC1nocn2DRygYinnMnp8gjGuAqlhRwQ==
X-Received: by 2002:a17:907:924f:b0:a1c:ee79:8481 with SMTP id
 kb15-20020a170907924f00b00a1cee798481mr529420ejb.95.1701799567433; 
 Tue, 05 Dec 2023 10:06:07 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 oy26-20020a170907105a00b00a1d0b15f634sm487920ejb.76.2023.12.05.10.06.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 10:06:07 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-40b422a274dso3095e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 10:06:07 -0800 (PST)
X-Received: by 2002:a7b:cb59:0:b0:40b:4221:4085 with SMTP id
 v25-20020a7bcb59000000b0040b42214085mr551583wmj.1.1701799566754; Tue, 05 Dec
 2023 10:06:06 -0800 (PST)
MIME-Version: 1.0
References: <20231205123630.988663-1-treapking@chromium.org>
 <20231205123630.988663-2-treapking@chromium.org>
In-Reply-To: <20231205123630.988663-2-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Dec 2023 10:05:54 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U_PpD=tsyP7QuXU2p-R24U6JXAWQONPT_ioMr1P7E-aw@mail.gmail.com>
Message-ID: <CAD=FV=U_PpD=tsyP7QuXU2p-R24U6JXAWQONPT_ioMr1P7E-aw@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/panel-edp: Add powered_on_to_enable delay
To: Pin-yen Lin <treapking@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Guenter Roeck <groeck@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Dec 5, 2023 at 4:36=E2=80=AFAM Pin-yen Lin <treapking@chromium.org>=
 wrote:
>
> Add the support of powered_on_to_enable delay as the minimum time that
> needs to have passed between the panel powered on and enable may begin.
>
> This delay is seen in BOE panels as the minimum delay of T3+T4+T5+T6+T8
> in the eDP timing diagrams.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>
>  drivers/gpu/drm/panel/panel-edp.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

This needs to bake a little while on the lists (1-2 weeks) before I
apply it in case others have opinions.
