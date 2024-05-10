Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 837748C2C94
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 00:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45D810E074;
	Fri, 10 May 2024 22:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PEaZdnvb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9996D10E074
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 22:25:37 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-51f174e316eso3023833e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 15:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715379935; x=1715984735; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=W6HjquRKOFN+fNdCcBFqV2IKTVODauXieX60eZohwyo=;
 b=PEaZdnvbcFDFkIQkb5FZtlAHBwr1AGQ4OKZ5jU6S+lQBP/d51Xt+BWEC7dRjmx8Zhn
 C7z5imSrIctx0qQfZ+wpaeNe6Qq/uQF+dLmRfO/+IsNziSGv0eE6ZUtI8nmKdkN80ah1
 pJEwlvlOzj3JkBla3HY4Ha3vWyo+BRqO+VsLUXeZjzYJnp6T9jke096CMg3iTSwLH11E
 ZtEdBWA0Kq+lK3ksD+ZaXlhW/uKRuQn+w6o4b4ADOJLtSlkJ1H5Xd1krZnyOG7PR1sxB
 58VKHbqSmaOn3lnySIcgXhIscLhcTZDgeklEUZslBc88GLWwHEtpWq79iQZ3usMuN0v+
 ffIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715379935; x=1715984735;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W6HjquRKOFN+fNdCcBFqV2IKTVODauXieX60eZohwyo=;
 b=TAeVJGDrt5Q25UU1xCAFQFeu0llAHw0dCbI9IAbSydlZY9bKCXkJkq/PtL1qX0OpJS
 49/jk5lGC96cd+GQbvVTVbbmCQAMpDCElrmu93KPWMBLoXfljKdphIxESV1XLoAikLRQ
 L7daiuLtfkJcnZRAuRPSbna9A3aB8ORKXapzDA8dVjSNq07QGSTSX/potZPQiY4oviNv
 K/6j3GUqaao6y3er/KtwwjVwElI9jmX42txAa+ctguBsg+37qykR1gbn/TzgKWviteAw
 0ltcH2JMUvyFrOwPWQDOUJje53vEh5sFTkLS+IB7ErwnS++QAOPTm2lOtDpgMnuBf25S
 VCMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs9uFagkyDDr3j2JJKlollPsdVIGdNkChBWVdbmFHx4iqy8j9UDzt4QyYaWTaBL/S1xoLi1AnHatWz6R7+lKH4mmb8BOBB8xzTomaFrcxV
X-Gm-Message-State: AOJu0YxptBI4Up6eHX0vgIBoK9RN9vsy+uRLLnxej/DB8kOLNB783Nqs
 Hvutwm/jZlb4QxIe3QaCfI8V06dfuVDB98wuxty1y4KhPWy595jRnENiSZAwd94=
X-Google-Smtp-Source: AGHT+IEFoajKWL5Ia66X2EESRVbXuMiDkkxy0S8gKkoH1kR/jrIMoqoUuKrVGiU/0xgAGVyjDlJflg==
X-Received: by 2002:a05:6512:358e:b0:522:2990:7739 with SMTP id
 2adb3069b0e04-522299078a7mr1051254e87.20.1715379935513; 
 Fri, 10 May 2024 15:25:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ad535sm835358e87.28.2024.05.10.15.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 15:25:35 -0700 (PDT)
Date: Sat, 11 May 2024 01:25:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 6/7] drm/panel: lg-sw43408: add missing error handling
Message-ID: <hf7u3rxard7yg2z3fkmntemhnnmwnsgmhmfhpt74modswg7nj4@7kwyba55x6o7>
References: <20240510-dsi-panels-upd-api-v1-0-317c78a0dcc8@linaro.org>
 <20240510-dsi-panels-upd-api-v1-6-317c78a0dcc8@linaro.org>
 <CAD=FV=Uu2=6c_3Q44BK384cgSLX=++_bBbg6=CCqBaXnqcEK=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Uu2=6c_3Q44BK384cgSLX=++_bBbg6=CCqBaXnqcEK=g@mail.gmail.com>
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

On Fri, May 10, 2024 at 02:47:05PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Thu, May 9, 2024 at 3:37 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Add missing error handling for the mipi_dsi_ functions that actually
> > return error code instead of silently ignoring it.
> >
> > Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/panel/panel-lg-sw43408.c | 33 ++++++++++++++++++++++++++------
> >  1 file changed, 27 insertions(+), 6 deletions(-)
> 
> Looks right to me. Only slight nit would be that I'd put this as the
> first patch in the series to make it obvious to anyone backporting it
> to older kernels that it doesn't have any dependencies on the earlier
> patches in the series. It's fairly obvious so this isn't a huge deal,
> but still could be nice.

Yes. I wanted to emphasise the _multi stuff rather than this fix. I'll
reorder patches for v2. Maybe I should also rebase the series on top of
patches by Cong Yang. WDYT?

> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

-- 
With best wishes
Dmitry
