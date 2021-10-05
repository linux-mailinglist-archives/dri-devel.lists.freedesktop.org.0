Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3800C421B65
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 03:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DED6EAD6;
	Tue,  5 Oct 2021 01:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2741E6EAD9
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 01:04:27 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id a3so24013954oid.6
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 18:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=AD4ntWnk6xy141WJ5eSD3VNPPmOSSryVzLkskjX3TQw=;
 b=BlLMVXco8MKkLfoYVrWtbG6ZlSQ0rP8Pfgi4HI/royWJD9pexjRZi+sAb3wxSsZpjF
 u6uIpVHylQ4GkUNv39I1brHqxTOmYQEg73VySR3ZYzdSob/Svl7gqZUzTRLjkPX2g5tH
 gYxjGuWw6K9diz+BcdE0pqny5ByE+dBggV2Mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=AD4ntWnk6xy141WJ5eSD3VNPPmOSSryVzLkskjX3TQw=;
 b=n8rkvU/XS3/A5jwns/ZHAo1X4o3LsXLdz0iQ3r5PuQIGGNmb8rJlfllJIidWMQba9f
 mkvbU1a6yV9dHztvtl1xJ9/ZLYnxIQdPnSfPfUPw4EH8F2IyC/Gh229KXzh+WKjULwn6
 8W0ACIJN292hnNTTvxlDplCwwklwFvytZ1NQ61CJ5pugk/p8q5bUTjzaV5yd7AbokOKy
 +E5y+jtR2SZ2LP2mDkeOFIiXtxJ6nq1t+U3lEIxLVnhCWjP8oQvVJQizdcwJPDVrzB8F
 PjcQdW04yWFEE08tbJPBhB2451EnfLJxlOoFnIIxHB7azB9y6NcJ8+LTh2Kva99Zf6Ar
 Rslg==
X-Gm-Message-State: AOAM530P+HREEiYeunomKKHecoRsf/6MBFrs729HdvwO3JDIc4E58qLf
 fJY6u9tNKJrtWXQmH8PvEvRcq0SjlEKomeSRhmpfIw==
X-Google-Smtp-Source: ABdhPJxcUdbrGerYfkCTPf/PwoSth3WvU4LBsMpt+DUDQ6/rOPEOVLhYZsKx1xZnQv15BKA9nAwgwS6G5Ye9CrwRt5w=
X-Received: by 2002:aca:3110:: with SMTP id x16mr240108oix.64.1633395864926;
 Mon, 04 Oct 2021 18:04:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 Oct 2021 21:04:24 -0400
MIME-Version: 1.0
In-Reply-To: <20211001174400.981707-4-bjorn.andersson@linaro.org>
References: <20211001174400.981707-1-bjorn.andersson@linaro.org>
 <20211001174400.981707-4-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 4 Oct 2021 21:04:24 -0400
Message-ID: <CAE-0n52bY27rZzarqrgjh37W3SsyvKTH70H++SmqoZOyETZKPw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] drm/msm/dp: Refactor ioremap wrapper
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-10-01 10:43:58)
> In order to deal with multiple memory ranges in the following commit
> change the ioremap wrapper to not poke directly into the dss_io_data
> struct.
>
> While at it, devm_ioremap_resource() already prints useful error
> messages on failure, so omit the unnecessary prints from the caller.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

I realize this will cause some prints when we use old DTs. I suppose
that's OK though because we'll have more incentive to update existing
DT.
