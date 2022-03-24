Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C284E4E69AD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 21:11:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92C010E2C6;
	Thu, 24 Mar 2022 20:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E4410E268
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 20:11:30 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 o20-20020a9d7194000000b005cb20cf4f1bso4077870otj.7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 13:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Nwl7eXrzEg6HjQ0pYoms0bj2n7ydxw/0219nabhE8y4=;
 b=Wz0LWT+bpc8idvDVCgb6SFc2Qi2G93X+M2YY2fmhP9lnDZhmtWQOdp4XIrYFnWJ+Xu
 1OjtvVD0C/QQP7xsv+SWY+cmKVJxaXRGRdCXufF7zTSjf3c/r4bHTemM7ZPM68WTenoz
 +jo3wpYPoEeOGQv5SN5A6G6nEfuoLns2S94Bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Nwl7eXrzEg6HjQ0pYoms0bj2n7ydxw/0219nabhE8y4=;
 b=4zrVTvf9zIMV2pc4cUPIm/zR3RwtK5XF9DDrWx1ItKC1uLYg52i382LmQSGuTVR1Nw
 LuKRKtrup1FbBycoBrXhDtDQxrl/+LbMocG52V/hzIZC6oITyD/aOdrf25/WK9xc76wL
 fTW3a5FA3y4+O+VtCLyOqqcsLDmehuG9bb96oao8eqdMooSRza943YPbS439Jls2ku4g
 DeBKNECA8HnSy0+xJEYlfbtYItVjEpCXDoiQqN+2g3R3dGzuvF5kBz9+bG7zDHWJ2yBj
 yZzQ/L7JuglRvXpZQTtCELKzhqw4N6Py/j70/DTzU1X2XG2wiw1FskIEuSz5ZDwDCn5Z
 hkNQ==
X-Gm-Message-State: AOAM530Ekfya2HKuuob8CG6CI060cbWO7pKa2DegBoYQ0OkG6YkWSHLl
 92Jsqu5yA09RODmfntLuUy/lnKWnI1lsMzN3E2OTvg==
X-Google-Smtp-Source: ABdhPJyKdYuuvj+Pf/ReQ7CF0NIUyrpos1BaPLUZKxrc3wD7UER0DcKnAzcQcQ6rpt99A3PFhj4W1tAkEzuQMc1hO74=
X-Received: by 2002:a05:6830:61b:b0:5cc:e44:7dc3 with SMTP id
 w27-20020a056830061b00b005cc0e447dc3mr2866148oti.159.1648152690112; Thu, 24
 Mar 2022 13:11:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Mar 2022 15:11:29 -0500
MIME-Version: 1.0
In-Reply-To: <20220323103546.1772673-3-dmitry.baryshkov@linaro.org>
References: <20220323103546.1772673-1-dmitry.baryshkov@linaro.org>
 <20220323103546.1772673-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 24 Mar 2022 15:11:29 -0500
Message-ID: <CAE-0n53namcRm+kYBbt+ytF5iQQKNpLDq7u+Nzsf4gyk_e+emg@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/dp: simplify dp_connector_get_modes()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, 
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
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-03-23 03:35:45)
> Since dp_panel_get_modes() handling for dp_mode was removed,
> dp_display_get_modes also doesn't change the passed dp_mode, drop the
> unused dp_mode variable being allocated unused and then freed.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
