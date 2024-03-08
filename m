Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F30875B62
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 01:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4207810EA9D;
	Fri,  8 Mar 2024 00:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jGbskCRo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9EC10EA9D
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 00:04:35 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-42ee33b2d58so9997601cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 16:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709856272; x=1710461072;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K6zr9T8K6LSYxoWWjQTrp1KLLoOTIIRDfeq7Eu5cxkE=;
 b=jGbskCRoqPCmOn44H97KtO3QAbzugFMecmVhcXgQuFihOd7ayF70+EwGul8sVLUwAq
 zRoPaEqO+DTZTBZgtTYDLLIe5sfXK3X42RCP2mizEadBRZGBSr7Z97X/bxuSZVQulVJ8
 9rHUYriY9hEyGeU2E1U/bYW4i48qpIc51B/Wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709856272; x=1710461072;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K6zr9T8K6LSYxoWWjQTrp1KLLoOTIIRDfeq7Eu5cxkE=;
 b=Vgum2oLMGZRQPDZYpwmzTyx6hh/0P/mHGEoYfg/n9EbM7XzI3xx3EC5toHNFw0kM6C
 SGi/v30zjl+KO8b3ero2+p3O/Um5sfWTx0Jam/+gaQM72NP3T7UmdKV+aUzEKAltaCJi
 63yansjJFkQS2rj4ybHIr/HvIldTuyjFLQ1GfPQ29azOSvbcGubPNQDSW9RoZVoXK0ge
 IUMI+3lfSpnoJJsjaz0UGInFwYGSGHE7iuontnvGG/L8I18h3mLuPkuwh6OQHvqge6gV
 bCWXU9+iZlzFw1JVtK2Xqcvuh6lyo2NFHlhm0Yf/8eoSvHuz9pY+RLW6MqhlWz2RerqV
 9NaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULS7HwMhGZJTuB1NEsCC3OIwIk2nrS5WOTfbHDjOEJoKS/SXTCWKv+sSwHVseLKhAkdmZbcNz2+xGc6EivXZfUmSu1NvqE09beGnbKmGpx
X-Gm-Message-State: AOJu0Yy0oTxJeBQtnwEqbgL+AQXM9AKmz9z2iW7c1J419jSW6ZnltXxo
 FnknqlXUB+kWyUHyGOHyy5VA7sLGLiSUQBZkDpNtBVWs4hO7nCEVs669zdxhwFpNWDs8wA4qzHw
 =
X-Google-Smtp-Source: AGHT+IFsP3EzPyDHarAuPg+n+LILCydC9n0iiqP9MRgUIZfNvP0yVXxxB47M6JQaKsxJ1J41yIf1+w==
X-Received: by 2002:ac8:7d81:0:b0:42f:10f5:1f9f with SMTP id
 c1-20020ac87d81000000b0042f10f51f9fmr6262820qtd.42.1709856272197; 
 Thu, 07 Mar 2024 16:04:32 -0800 (PST)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com.
 [209.85.160.171]) by smtp.gmail.com with ESMTPSA id
 c26-20020ac84e1a000000b0042f26bc3457sm286723qtw.52.2024.03.07.16.04.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 16:04:31 -0800 (PST)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-42ef8193ae6so62321cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 16:04:31 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV+fAGoMqOwJBboJPy7El7DyLCW4YZq6cKilM7C/bXLJC2ckFFIfbk5dauD/wtfJCYHIEewttos7ic567/DGH2B8uZtRDwLwt2mg2Jt+BIV
X-Received: by 2002:a05:622a:148a:b0:42e:f45c:6761 with SMTP id
 t10-20020a05622a148a00b0042ef45c6761mr466501qtx.22.1709856270686; Thu, 07 Mar
 2024 16:04:30 -0800 (PST)
MIME-Version: 1.0
References: <20240307230653.1807557-1-hsinyi@chromium.org>
 <20240307230653.1807557-3-hsinyi@chromium.org>
In-Reply-To: <20240307230653.1807557-3-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 7 Mar 2024 16:04:14 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UXUpf3H=fnQTZhUq5aDXFeVGW9OJuA5BmnRRvWQz6qaA@mail.gmail.com>
Message-ID: <CAD=FV=UXUpf3H=fnQTZhUq5aDXFeVGW9OJuA5BmnRRvWQz6qaA@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] drm/edid: Add a function to match EDID with
 identity
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, Mar 7, 2024 at 3:07=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> w=
rote:
>
> Create a type drm_edid_ident as the identity of an EDID. Currently it
> contains panel id and monitor name.
>
> Create a function that can match a given EDID and an identity:
> 1. Reject if the panel id doesn't match.
> 2. If name is not null in identity, try to match it in the detailed timin=
g
>    blocks. Note that some panel vendors put the monitor name after
>    EDID_DETAIL_MONITOR_STRING.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v5->v6: finalize the trailing white space and/or NUL decision:
> Allow only white space before \n.
> ---
>  drivers/gpu/drm/drm_edid.c | 65 ++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_edid.h     |  9 ++++++
>  2 files changed, 74 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
