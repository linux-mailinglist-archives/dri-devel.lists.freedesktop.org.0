Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D46A1A1488C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 04:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE5710E283;
	Fri, 17 Jan 2025 03:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yJE4u5OB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8AF10E23E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 03:39:55 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-54025432becso1858319e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 19:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737085193; x=1737689993; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=a0KmIpWhOnmvP2/79nQLTbunQC6aY9KWQAhT4oyikpE=;
 b=yJE4u5OBYSWOu+N7a6MQYk0/JyF0hTUkgSjwmXmo2zb+GGQbPzU+1bIpbw8njmyana
 P0PHTRinmL15ywUr91TH8GTY4MfCIZ1SWbyr7X6tk7Rp+0i8eik8sw49cSG2rQTK6Cj6
 Pr+HUMFrIVGE2aqE7KG+BIvW6Yjuw+eLGg94CR4pwg1W8lzfKa+qaxiFy88/RvRl+YXO
 vuCTAj4RfOJIUvUGW4GlLSZwvJP18F1wakvx2aqaKy8YcdwvtHcEZgD93EyYvgpry6ma
 9h1oJGU/LkEE1Jlt6jb05Xu1eOp4a52i63e7uCynVYZYak8sDgHzsQegB7hW9lB9qyHj
 wWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737085193; x=1737689993;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a0KmIpWhOnmvP2/79nQLTbunQC6aY9KWQAhT4oyikpE=;
 b=jmhN4zNForEt+My92izPHHYyOr2TLZD9GDYWawg8CF2tLT+C0sMw/QjOc0wTjgHojh
 HFOTv6gP4VwAsKdlx9dZbJRt5SxnLKuJQyx9DwhSI+7c4kDCYIc6YQmVUCmLQ5gCDe1D
 +d3BKsCzVEOjrdVAaV7LImxxWnYIeribV3Y04XM6YsWcyKIDyH90y58NO7608Qa/fqc5
 VcKW9LUL9V/X+WRhUfBWiZnQiwRBDX/6Iam5xGc4+dlHS5DUoSzAwzZXRNxA/Dn5GyM5
 WNTGKIiry38+9pdv9O8IoBXjYL4VinWBYTkQYO/OB+e4X/9SqC+dzYysndCxv7xEmVxZ
 n2sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx2iPo9YF/uZVabGoET1Nvx7o7kvImKau0EzJTU9u6Yae+Rueo0p+zR1nTNhbC22YH4PnCGejKvSQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjgjITvTIZlNZH1prwRdyYTLpFH8VLYtB6f80TGYA+snwgC6hz
 x/55Q88pWA4kNTjhGZPfaZe1XKXMH9ZlKyeu/qBoT3VcmkTc7JCvjWTQoiz7BUA=
X-Gm-Gg: ASbGnctvEHpYua1j4UqMqN4phTlQndig1Ms3YI+vqRK2/BvQUAZGlEGnR4Di/l56Ue1
 ghm5KDpobPTe4WPjXSxaDNMURd+N/8G5QgJWJmE/IELCs25TE8xHVgpNlbha2lGEj6c7JPvB8fK
 ghMniAC+uHmZ44PGhGscRZb//uTYv9U1zookwbJmHeUyIGlWseZFqJtRIB9WfiXXwsFkH1Soxwf
 uTaFaXuhbWthGPlTGT+yyHqFUdo+eMmyyK16eEEt91rb+7akrLxBnWdhfsmxo2i0nTIFWTF2/j1
 tPjqC780kETGhNfHtYU7AxttVn8MWCcz+cIP
X-Google-Smtp-Source: AGHT+IG1i+XsSg4L26hUUv4AYoaCV/mK4bj6NtE/PFeG94iR1Z0kvDv6pvax9G0WjZar1+ZiQ+L9PQ==
X-Received: by 2002:ac2:54b5:0:b0:542:249c:215f with SMTP id
 2adb3069b0e04-5439c22a8f6mr186133e87.4.1737085193491; 
 Thu, 16 Jan 2025 19:39:53 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af60992sm191506e87.155.2025.01.16.19.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 19:39:52 -0800 (PST)
Date: Fri, 17 Jan 2025 05:39:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 14/16] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <tae55nwbytxtmskvlelwkldy6tkgurr3mxocpfdhvniuiduxb4@qosnxo2dseu2>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-14-74749c6eba33@linaro.org>
 <kqrea3es5bwyofk3p3l26wj2iswvfqadwehusfpj4mssgawdos@wombtx67llyc>
 <CABymUCPn=u8jr_OTFwB-WBjj2nNgBeTyH5b=PvF5vLrDhCxr3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCPn=u8jr_OTFwB-WBjj2nNgBeTyH5b=PvF5vLrDhCxr3Q@mail.gmail.com>
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

On Thu, Jan 16, 2025 at 10:22:07PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年1月16日周四 16:18写道：
> >
> > On Thu, Jan 16, 2025 at 03:26:03PM +0800, Jun Nie wrote:
> > > Support SSPP assignment for quad-pipe case with unified method.
> > > The first 2 pipes can share a set of mixer config and enable
> > > multi-rect mode if condition is met. It is also the case for
> > > the later 2 pipes.
> >
> > Missing problem description.
> 
> Is this OK?
>     SSPP are assigned for 2 pipes at most with current implementation,
>     while 4 pipes are required in quad-pipe usage case with involving
>     configuration of 2 stages. Assign SSPPs for pipes of a stage in a
>     loop with unified method. The first 2 pipes can shar a set of mixer
>     config and enable multi-rect mode if condition is met. It is also the
>     case for the later 2 pipes.

No. It should be problem / analysys/ solution. So, 'Assign foo' should
become a last phrase.  Also please please perform a grammar / typos check.

> 
> >
> > Also, shouldn't this patch come before the previous one?
> >
> Yeah, it is reasonable to prepare the assignment capability, then
> enable the plane splitting into 4 pipes. It does not hurt actually
> because quad-pipe is not enabled in data structure side.
> Will reverse the sequence in next version anyway.

Thanks!

-- 
With best wishes
Dmitry
