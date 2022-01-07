Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 747ED486F04
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 01:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1518F10EAE4;
	Fri,  7 Jan 2022 00:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5DB10EAE5
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 00:42:56 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 a23-20020a9d4717000000b0056c15d6d0caso4922922otf.12
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 16:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=atmy/2mmGjhretVeVMp74eCFRlSY7eexCas291LMZiw=;
 b=NEiXtpzIJuq+ddFpchl0oDBsQdYqF3ZwrJ1Z9bI2KF6RhAXtf6kT/kQNI47at2IwP/
 l1m12sBm7I0PKdUb5mYnnhmwyC/yCkoFP8A4OgzXriBvskbv8Uy2OiVBEPyWKA0koY7v
 SQaIXX0x9DVrDMiBFkxxPKgqP4rLOELY+yjos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=atmy/2mmGjhretVeVMp74eCFRlSY7eexCas291LMZiw=;
 b=jLH5rF0kDaQ0iiinXy5mAO0V7o+4aZpZAEuqxoR+RduDCrNb4xILsSBm6Xy+94YPOP
 tc3yxs4k0AUXO6C8FbQSKo2uQynM6RGen13+Y8l+jQDeepljImCtUbgVvwpG2yLRhZU3
 4hGSN/Bnj/DxO3zLk9fA5ESZg45qGTySeaA5S79dEjPTu+IbjnoGPjDPFTh3McO6syTY
 Jnn6FU+cBmzX+LMyCHjnc0lD5KmmWX69rVOgTedUVSKcLtvlAaOPqvk8ptahRNXzNOGb
 PLJ//bJYkOF0lNiBrQLXkvJEqQSZ0CcmQC3pbIhea9DRc6HSArivfcksOJf34IHOHfyh
 TQeg==
X-Gm-Message-State: AOAM532zUBusY2J1jCOXoP8VNTZo+XMDP25Ffl0m9JlyNAZGIpl6tCwb
 ijDZoQZR1d+/eZzzgVKTZ8OOU0sgd03+sy44GFesaw==
X-Google-Smtp-Source: ABdhPJwJhNLwPLZG+/uY/kFkbWi+NrpEY3Hn0S30RIpjujh1b5HQTqu0pBhZNq2rsXfzvl4xM6DSc5QrtZqfeMjP2ts=
X-Received: by 2002:a9d:1a6:: with SMTP id e35mr3893260ote.77.1641516176125;
 Thu, 06 Jan 2022 16:42:56 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 16:42:55 -0800
MIME-Version: 1.0
In-Reply-To: <20220106070656.482882-1-dmitry.baryshkov@linaro.org>
References: <20220106070656.482882-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 6 Jan 2022 16:42:55 -0800
Message-ID: <CAE-0n50d3WFYW1eRtpOF77j9vF89Dku4WyBj1xT9OP90x4wihA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: reduce usage of round_pixclk callback
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-01-05 23:06:56)
> The round_pixclk() callback returns different rate only on MDP4 in HDMI
> (DTV) case. Stop using this callback in other cases to simplify
> mode_valid callbacks.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
