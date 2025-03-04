Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF6BA4CFAC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 01:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C0B10E3DF;
	Tue,  4 Mar 2025 00:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lYcUrmqf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B8110E3DF
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 00:06:31 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30bb2fdbb09so18604901fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 16:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741046789; x=1741651589; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VKg30KZBI8UiQdlXXrLUMK6Gz3/HQfqbDgR8mQQyzs4=;
 b=lYcUrmqfr4hKPswpOJEX65Mh6UzguEUvfQW+qh4496tqWDzIybGpAmt8QgxGvp75t7
 VigHB3EBZEL41NSgtq8rfOewOSVnvOTE2mlZnjzUQk1oYfH1Ng9T7kXRDMo0vt4pQGuk
 GbD5EEQpzSB1nI5y+FAvZfQ9NpmSdIMpwPPl0iI578zXRJG7RpR+FimpveNiA+lMWql9
 SsRmRn+kPrXOi22Iiuw92Oyer73pWJmdbRdZJ7fBIWbMusbAT7WgYKMAgQkGDuwjJ2Up
 8BdVmnV4wRBQgO6sObFHXKkob9cv2eYm1wlxoDkqa12uF82a+k8e+8cklizX6LJ5uVnv
 ZJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741046789; x=1741651589;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VKg30KZBI8UiQdlXXrLUMK6Gz3/HQfqbDgR8mQQyzs4=;
 b=YfozWdbGdTXaWRq9990W/wEJJxtVJik+J6D1nhjCiMaM1cnMeuG/HgwsRGd3tsoW5n
 tjtdK7tHUHvnm4Ht5J60mNO1RmmqmVnnBKF0CCecyxvowuAtSJTidLYqqhYOolntvyva
 KS13ge2PDpXB1SEigreuOK2vInOcc+PJ8fYmEoN9WpgHz3JHdSmImsWoWmV/VNwB/V8M
 e2+a9OJGlR6ARRXWyDwz/lzGU+ayYCnnzwzURQpzr7vJSIk1XzYlKuHPpy8HThK9dZU1
 JnqkkMsZXWlkqHNN1bqN1WX3WEZ0cvSFwjZJAiYh08/yQTrxy4OPqXDGT6wdLgqWJ8WB
 V+Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3WoGc60Bbax1QdBB42cg4nusQvJdx74f/rBXzgUzQeZZmb1VqHfHCEZ9Pgrp4kweXW7/QJnhTPuw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDLdNvyd7cj1ET2XsdLcbsuCgR89lp0+vY8xHUqQELlIVH5TKW
 +s788uBicD1zfWECY8E8HUmr4WXprDv9jiUdIKXm95+oaFtIQkZ+RVW4y++l5ko=
X-Gm-Gg: ASbGncuiIlwrekYIr4WhZplssjoPWv/dbaRlJVz2R8Z/NFKFvFWKI2yoLnm/t9uQu7A
 yl1qxq/g623Tmm0kptfFqlhVuT1vwipHZDOaKcMQDqUMXmVdmlVgm63D8zUMQ52fY+yTdO6E/KX
 Bty+10kyoEM2K4/onziu/sRpzbvOYZ4e772Mv5kJBmE2dqWzA4gkBFX9kEtpBh9NuMuCcSbDBiX
 7a0d55X8gbyGSpmGxPH+g/CaAelf3dGfen5+BzRRWff8uGY0jWUm6LOri5l/l5bKqfCfv49oCA5
 aLzRe5flkw6WGqjo6lDs1qyTcAkp6QbigoaNGGYlLSOFGgkoDMdmivMh3YP13O2YjDnOePY+++o
 wU9pjcz4v5SIN1nm+vOjcdktD
X-Google-Smtp-Source: AGHT+IGSlqlzuwqVCa0rrjM071WYE9ZyASFIq+8EsX9D9f6afiXzOPp+esDpiRw3UjsklkPpWHb/Tg==
X-Received: by 2002:a05:651c:158a:b0:30b:8f60:cdb7 with SMTP id
 38308e7fff4ca-30b932da780mr63732311fa.24.1741046789286; 
 Mon, 03 Mar 2025 16:06:29 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30bc0ecd4adsm3799761fa.81.2025.03.03.16.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 16:06:28 -0800 (PST)
Date: Tue, 4 Mar 2025 02:06:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 05/16] dt-bindings: display/msm: dp-controller: Add
 SM8750
Message-ID: <cysgc3zxp7qx3gwrqmr6ntvmeyw7sodxjs2a5sil6qw3wk6oav@il6wvs234j5g>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-5-d201dcdda6a4@linaro.org>
 <aqpuik4zitdfuk4pahn4wyzxdvxldy4dcqjs3mhr6fqtxpoxhf@ssfzzbfce2nu>
 <2dfe466c-ad94-4683-a2e9-a49e77a61f4f@linaro.org>
 <h2shpen65r7v4in54avsez7qtlwojbt2cthyomqrsgs5ewprwb@bn53suqrzkac>
 <4e82404a-0ea5-4641-829a-bba666edd352@quicinc.com>
 <CAA8EJpoWEuqKkreUTu1gO-Pr=VFNNP_vBfNZpitJiJH728vjPA@mail.gmail.com>
 <8c0c0935-3a20-4c6a-a6fb-556e14ecedda@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c0c0935-3a20-4c6a-a6fb-556e14ecedda@quicinc.com>
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

On Mon, Mar 03, 2025 at 01:23:11PM -0800, Abhinav Kumar wrote:
> 
> 
> On 2/24/2025 7:14 PM, Dmitry Baryshkov wrote:
> > On Mon, 24 Feb 2025 at 20:59, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 2/19/2025 9:08 AM, Dmitry Baryshkov wrote:
> > > > On Wed, Feb 19, 2025 at 06:02:20PM +0100, Krzysztof Kozlowski wrote:
> > > > > On 17/02/2025 19:58, Dmitry Baryshkov wrote:
> > > > > > On Mon, Feb 17, 2025 at 05:41:26PM +0100, Krzysztof Kozlowski wrote:
> > > > > > > Add DisplayPort controller for Qualcomm SM8750 SoC which so far looks
> > > > > > > fully compatible with earlier SM8650 variant.
> > > > > > 
> > > > > > As that became a question for QCS8300, does SM8750 also support exactly
> > > > > > two MST streams?
> > > > > 
> > > > > v1.5 of DP (starting from SA8775p , then SM8650 and SM8750) support 4x
> > > > > MST for DPTX0 and 2x MST for DPTX1.
> > > > > 
> > > > > The DP in SM8650 and SM8750 are identical, according to datasheet (v1.5.1).
> > > > 
> > > > Hmm. This also means that QCS8300 is compatible with SM8650. I'll let
> > > > Abhinav comment here.
> > > > 
> > > 
> > > DP version by itself is not a good measure of whether the controller can
> > > support 4 streams or not.
> > > 
> > > Firstly, sm8650/sm8750 do not have a DPTX1 so we are only discussing
> > > about DP TX0.
> > > 
> > > Coming to the QCS8300 Vs sm8650/sm8750, even though the DP controller
> > > version is the same, there is no HW support for more than 2 streams on
> > > sm8650/sm8750 because there are no INTF blocks to drive 4 streams.
> > > 
> > > On sm8650/sm8750, only INTF_0 and INTF_3 can be used for DP. Hence 2
> > > streams.
> > > 
> > > Whereas on Monaco, we have INTF_0, INTF_3, INTF_6 and INTF_7 capable of
> > 
> > No idea what Monaco is, most likely it is some platform. Please use
> > SoC names in public.
> > 
> 
> Monaco is indeed QCS8300. I usually do use SoC names, in this instance just
> intuitively ended up using the internal one as I use it often.
> 
> > > driving DP. Hence 4 streams.
> > > 
> > > Let me know if there are more questions.
> > 
> > How many stream clocks are present on those platforms? I'm asking
> > because there is a small, but not non-existing difference between 'DPs
> > are not completely compatible / the same' and 'DPs are fully
> > compatible but different DPU blocks impose different restrictions on
> > the number of MST streams'.
> > 
> 
> I have confirmed this internally. sm8650/sm8750 have only 2 stream clocks
> and not 4.

Ack, thanks.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
