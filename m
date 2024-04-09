Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 474B689E213
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 20:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4344E112E95;
	Tue,  9 Apr 2024 18:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ydjX0WMS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3E0112E94
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 18:04:47 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-516b6e75dc3so7501948e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 11:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712685886; x=1713290686; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mt7HVPjAilY3mwr17H22AEx0sDoVw4kMEURX0lXTtic=;
 b=ydjX0WMSpUnKvUTIzyNqnLm0qxglChiymqdYucCp/EFGwnnZYEF+EVPL0PvU3Hh0Wv
 9aqunttcsq1PoBs3mZdVu/TwoCvJ7K1TjmSlHJra6NlqA3JYSdbhGylqgueXa6tNDOZ1
 m/WHY2OOCNhyeuBQYMTP1dZ3RnoM1xPYhqu9vFOyxYxMyDjdYNjS8IwvJFhDbIQHDWbj
 Pp17rtbXL7dRARJe1ephn54UD1ZA05iEJ8h1iM08hcr7ffSjMcexn+LdlN+upFdnxW1m
 8xasePGxM+OGyBWW9TYP7KzCmKaoE0A2ynAzHlV1NSsnRaHsQDNdNdC8GxHKVh0UCJ8u
 B3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712685886; x=1713290686;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mt7HVPjAilY3mwr17H22AEx0sDoVw4kMEURX0lXTtic=;
 b=BYNLtdBBIsgi7hP1xUABsoG/HF9mU0PlBhPUA6xBxzQbmoMq9y0w9eZqkNB1XHlaS5
 MZqUGqYMZMYI9HyK2wCAamYFthC7/3zh0/kz/Aax8wbf65IFA3V2IBmysS1GxZWdjxD8
 RNHeVSqtZZnXk6GCJ3FZkGh34rTL+kI1XYxCBQ6qig1tQdv3PFKEmUdUU0fJP3fDc+LY
 WDkNg86bmitQ17sIo2vvyUULfQG9l0TIxHzsyAsQJu/JykFRAac8q4WxPYrRCPhAntnB
 u8/96zLCixbzfiIjXwaDsP468spQl0YabVQA42dkMvVZo/u76qmNe5FnjLc0vqVRQPrj
 Hdmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvUT3bX+s7m6Oe5Wqu7tGhts2eAQPdLtutSJfuiQ3GpBO99x2sfXeNySieVVlVlul1vmHaSIhRMHvpRM52ITy2h7nNnZe1Noc6e8RmDrmy
X-Gm-Message-State: AOJu0Yw04zwTZpgpVmEMQLlzh9tJl9/JO7AMYEEX7UlT246lw3lKOMGW
 B587OeLttIV+ItSXFaMKSq06hp8FZIogn7JzHEBzIilcyF3oRvI111wlnfslkxI=
X-Google-Smtp-Source: AGHT+IGdK7leJ3QXhD6uZ/35F5XaLJqlEevFkNwPNitSZjtNpi/nk0armGKfZL2bzGGgnmj2Q9OGzg==
X-Received: by 2002:a05:6512:455:b0:517:5f99:5a9f with SMTP id
 y21-20020a056512045500b005175f995a9fmr106766lfk.29.1712685885930; 
 Tue, 09 Apr 2024 11:04:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 w20-20020a05651234d400b00516cdd2183asm1619918lfr.15.2024.04.09.11.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 11:04:45 -0700 (PDT)
Date: Tue, 9 Apr 2024 21:04:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/6] drm/msm/adreno: Allow specifying default speedbin
 value
Message-ID: <quil2y6tbilihgont2xekay4joxgnsanu3khgo77omtwkolslp@ozuaajpv5uon>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-3-ce2b864251b1@linaro.org>
 <pncr7ecf4eir36skul3iwt2nf5bpuwd5zjfzzfwwnxjwe4hoes@6z2xe54crijp>
 <d8a2ef87-f29e-4bdb-a9b8-591b8bd5d2b2@linaro.org>
 <tkcbl2iwcy3feoggbk737gx32qsxe5p4ad6lfrujy2pazccrhm@kif3guuzay6h>
 <CAF6AEGsg2xCCC27t_Gqu=MMQ6tckVw=Zj90p4x7EuOm+VKA=ig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGsg2xCCC27t_Gqu=MMQ6tckVw=Zj90p4x7EuOm+VKA=ig@mail.gmail.com>
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

On Tue, Apr 09, 2024 at 10:12:00AM -0700, Rob Clark wrote:
> On Tue, Apr 9, 2024 at 8:23 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Tue, Apr 09, 2024 at 05:12:46PM +0200, Konrad Dybcio wrote:
> > >
> > >
> > > On 4/6/24 04:56, Dmitry Baryshkov wrote:
> > > > On Fri, Apr 05, 2024 at 10:41:31AM +0200, Konrad Dybcio wrote:
> > > > > From: Neil Armstrong <neil.armstrong@linaro.org>
> > > > >
> > > > > Usually, speedbin 0 is the "super SKU", a.k.a the one which can clock
> > > > > the highest. Falling back to it when things go wrong is largely
> > > > > suboptimal, as more often than not, the top frequencies are not
> > > > > supposed to work on other bins.
> > > >
> > > > Isn't it better to just return an error here instead of trying to guess
> > > > which speedbin to use?
> > >
> > > Not sure. I'd rather better compatibility for e.g. booting up a new
> > > laptop with just dt.
> >
> > New speedbin can have lower max speed, so by attempting to run it at
> > higher freq you might be breaking it.
> 
> Usually there are some OPPs in common to all speedbins, so picking a
> freq from that set would seem like the safe thing to do

Well, the issue is about an uknown speed bin. So in theory we know
nothing about the set of speeds itsupports. My point is that we should
simplfy fail in such case.

> 
> BR,
> -R
> 
> >
> > >
> > > >
> > > > If that's not the case, I think the commit should be expanded with
> > > > actually setting default_speedbin for the existing GPUs.
> > >
> > > I think that should be addressed, although separately.
> >
> > I'd prefer to have it as a part of this patch, but I'd not NAK it just
> > for this reason.
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
