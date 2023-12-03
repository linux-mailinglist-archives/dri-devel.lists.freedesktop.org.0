Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 041BE8022C3
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 12:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1121010E275;
	Sun,  3 Dec 2023 11:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1366710E13C
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 11:26:36 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c9c18e7990so46850051fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Dec 2023 03:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701602794; x=1702207594; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8vrRnlK++TVk2VT6FeBO/PnYsSt3drwvKoWii9XeVnc=;
 b=cSgnCHK1jRNbuPFXK0fZ9RpHL+SN2UIu/OKYA+TvS9pt2+vw/rn3hFqmDWEwfi4Spt
 YyphwnFdefMh7wgxC+nCdwE3zd2+q2DtgdWK2mgTGmzsEd1EZJf4SvbVaZzFEUt4cmSw
 WxG/r8b/xRRc1y2hpEInJkWeQCfScCCIjsMpgnc21kRuIRoQePDhsD4v1yexkdzdE+F2
 soMic5Rre/Vc0OfLQEMkjg9GedhBShZ6JV6ZIweUMoPiMAe3nKbAfckNHsNX0OwYmENU
 d+OGO/ROL52H96lpFIJdsCZSbSqKGi64I4aJyCpFpE378wHFhbDEeD4wFJMhpiwPPm/X
 X0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701602794; x=1702207594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8vrRnlK++TVk2VT6FeBO/PnYsSt3drwvKoWii9XeVnc=;
 b=Jxp3cwbkJUrqte9DK8sz+xToc69GPCRoZAQ5b/kVU3RJL5yTyXAYuzazvBH7Dda9Lb
 uEZAqf9yu02F69ZKiAL9QjxAQNiE+Yh4+QMp2bmuiSgxHSr3Eh8dk07kpGkacr/XbIo9
 xRAkqjye5CQieHtsqStHHtIZw+G8578Hrxmvpc3l4RVOg1e63tnD6y6FKM+l2GiZ/moK
 6t5u8jJp/wRWh7YvXTOykv7pEOjL2OScA1qg+MJ1TS9xYyx7kfdLYilFU1R0S2s15u3S
 7xlQltMHYpNTDcz/SEaPmWjkRiMHkrWG7iobGQrG4XzcY31B/1tDrPuj8gTqkUGNnZ7X
 JUXA==
X-Gm-Message-State: AOJu0YzzewqdcjFF1WrjQwaMDUSNvWBKeYawXsMgiADt0WoUuYnw7VJn
 T7IA/axJfaxDob4d/EUPZv3XKQ==
X-Google-Smtp-Source: AGHT+IF8VFE8yHqpdA0lL2rONweKN2YoaaNJYPbP1H/4L8xmGbnzoQjpJq+kMoolwog2wQ5Wm5dbeg==
X-Received: by 2002:a05:6512:6cb:b0:50b:e427:a530 with SMTP id
 u11-20020a05651206cb00b0050be427a530mr1343544lff.34.1701602793929; 
 Sun, 03 Dec 2023 03:26:33 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 03:26:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 00/17] drm/msm/mdp[45]: use managed memory allocations
Date: Sun,  3 Dec 2023 14:26:18 +0300
Message-Id: <170160265545.1305159.2501271853192928734.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sat, 08 Jul 2023 04:03:50 +0300, Dmitry Baryshkov wrote:
> Follow the DPU patchset ([1]) and use devm_ and drmm_ functions to
> allocate long-living data structures in mdp4 and mdp5 drivers.
> 
> [1] https://patchwork.freedesktop.org/series/120366/
> 
> Dmitry Baryshkov (17):
>   drm/msm: add arrays listing formats supported by MDP4/MDP5 hardware
>   drm/msm/mdp5: use devres-managed allocation for configuration data
>   drm/msm/mdp5: use devres-managed allocation for CTL manager data
>   drm/msm/mdp5: use devres-managed allocation for mixer data
>   drm/msm/mdp5: use devres-managed allocation for pipe data
>   drm/msm/mdp5: use devres-managed allocation for SMP data
>   drm/msm/mdp5: use devres-managed allocation for INTF data
>   drm/msm/mdp5: use drmm-managed allocation for mdp5_crtc
>   drm/msm/mdp5: use drmm-managed allocation for mdp5_encoder
>   drm/msm/mdp5: use drmm-managed allocation for mdp5_plane
>   drm/msm/mdp4: use bulk regulators API for LCDC encoder
>   drm/msm/mdp4: use drmm-managed allocation for mdp4_crtc
>   drm/msm/mdp4: use drmm-managed allocation for mdp4_dsi_encoder
>   drm/msm/mdp4: use drmm-managed allocation for mdp4_dtv_encoder
>   drm/msm/mdp4: use drmm-managed allocation for mdp4_lcdc_encoder
>   drm/msm/mdp4: use drmm-managed allocation for mdp4_plane
>   drm/msm: drop mdp_get_formats()
> 
> [...]

Applied, thanks!

[02/17] drm/msm/mdp5: use devres-managed allocation for configuration data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/062aeadeba1d
[03/17] drm/msm/mdp5: use devres-managed allocation for CTL manager data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/4c1f4c1f1b43
[04/17] drm/msm/mdp5: use devres-managed allocation for mixer data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1ad175c2c884
[05/17] drm/msm/mdp5: use devres-managed allocation for pipe data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/323e9a18d6e1
[06/17] drm/msm/mdp5: use devres-managed allocation for SMP data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/531d5313d934
[07/17] drm/msm/mdp5: use devres-managed allocation for INTF data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/6de8288bf668
[08/17] drm/msm/mdp5: use drmm-managed allocation for mdp5_crtc
        https://gitlab.freedesktop.org/lumag/msm/-/commit/6f235e3d6b18
[09/17] drm/msm/mdp5: use drmm-managed allocation for mdp5_encoder
        https://gitlab.freedesktop.org/lumag/msm/-/commit/669afee4a17e
[11/17] drm/msm/mdp4: use bulk regulators API for LCDC encoder
        https://gitlab.freedesktop.org/lumag/msm/-/commit/54f1fbcb47d4
[12/17] drm/msm/mdp4: use drmm-managed allocation for mdp4_crtc
        https://gitlab.freedesktop.org/lumag/msm/-/commit/783ad6e6312f
[13/17] drm/msm/mdp4: use drmm-managed allocation for mdp4_dsi_encoder
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e79571e8708b
[14/17] drm/msm/mdp4: use drmm-managed allocation for mdp4_dtv_encoder
        https://gitlab.freedesktop.org/lumag/msm/-/commit/93d6e1b82b93
[15/17] drm/msm/mdp4: use drmm-managed allocation for mdp4_lcdc_encoder
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2c24668cc068

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
