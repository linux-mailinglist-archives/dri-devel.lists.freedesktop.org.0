Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 995F27BCEC9
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 16:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDF410E1A3;
	Sun,  8 Oct 2023 14:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38C510E179
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Oct 2023 14:01:30 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5033918c09eso4659869e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Oct 2023 07:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696773689; x=1697378489; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zFEz00dZt8b8WAE9A9YPgyljR1B8wQKrMenQPX4nHKw=;
 b=YRuzrK4Djd7bBYlQmgCQyGSyam61UGAyUNjSs8V/Sf4Fas2p8SlVy9Nbzn30bcbMIA
 GTKbF+zVj0SfIWdDtjuWLTUkTZRlQuT/cmDDLuFNngy7Ukr9OTK7/6dQRce14SUTC81Z
 JGkeyhaX1QXw1ihLTyL44fBTbQVigY1WSNbfR3yafjG9usqA4ChzztVLewlTg6d05pC+
 GgIjRMpRgEfVWKLpxQ95u7OORz736kFKai7dd8gMRujULTg3e+tc9QDZUaPFVZsZrMOi
 9OcV/HJbAj3AODFZdoBNK30U1LkSkG9OkBCpyOw/HHQDa+Hso6y/ypP5w2YQ6Xg1hHaF
 Jx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696773689; x=1697378489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zFEz00dZt8b8WAE9A9YPgyljR1B8wQKrMenQPX4nHKw=;
 b=Z+6JSDE/ACF3ALTNPFBUN34vbvn+UhCrC6mUD+WUzX3A9kmZKsbum5UAsZyGXAURPO
 qH49vh9AQIslMcvnyVZWul84W4cJaSprX7V66lxRdNg74LoCto8HpOuM9vEUbOfWmLNd
 4yfLCA9eO87Lp+Lfp4YYOM8+ER1aINUQvOn0R1Yo/emhXKAI+179iC68H1nSi4p8PYJo
 isMblcPCjP8HvvK09FHFs6yWj88gONk6DLPplhSwtxTAuwico7AZXvgsBcdg6ckVS19A
 yDztUFHnH9uKoUW4NR/a93gEcLsmtQYyk3iv7IU9Er3Q4lYctfcnzDcGpVzIU+xvI7jK
 xaKA==
X-Gm-Message-State: AOJu0YxTRVpwEJk5IYuk5JlAe4HV1yQJoI1HG5bh2q5Ot9883lncEgkf
 fthJ3u2pqk+uvoGTY7IZoK6Bbg==
X-Google-Smtp-Source: AGHT+IFOU5uXWmhXrIYbhgEpr4JZ8+yZty98yxpFi9UjGcKnTHEbTZyEkAOOOPx1Erbruxp2wwdBBQ==
X-Received: by 2002:a05:6512:68a:b0:503:26bc:b08f with SMTP id
 t10-20020a056512068a00b0050326bcb08fmr13838821lfe.24.1696773688970; 
 Sun, 08 Oct 2023 07:01:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q14-20020ac24a6e000000b00504211d2a73sm1080455lfp.230.2023.10.08.07.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 07:01:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 0/7] drm/msm/dp: Simplify DPCD related code with helpers
Date: Sun,  8 Oct 2023 17:01:20 +0300
Message-Id: <169677306906.2570646.11717295539692431609.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230829184735.2841739-1-swboyd@chromium.org>
References: <20230829184735.2841739-1-swboyd@chromium.org>
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 patches@lists.linux.dev, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 29 Aug 2023 11:47:25 -0700, Stephen Boyd wrote:
> This driver open-codes a few of the DPCD register reads when it can be
> simplified by using the helpers instead. This series reworks the MSM DP
> driver to use the DPCD helpers and removes some dead code along the way.
> There's the potential for even more code reduction around the test
> registers, but I haven't tried to do that yet.
> 
> Stephen Boyd (7):
>   drm/msm/dp: Replace open-coded drm_dp_read_dpcd_caps()
>   drm/msm/dp: Use drm_dp_read_sink_count() helper
>   drm/msm/dp: Remove dead code related to downstream cap info
>   drm/msm/dp: Remove aux_cfg_update_done and related code
>   drm/msm/dp: Simplify with drm_dp_{max_link_rate,max_lane_count}()
>   drm/msm/dp: Inline dp_link_parse_sink_count()
>   drm/msm/dp: Remove dp_display_is_ds_bridge()
> 
> [...]

Applied, thanks!

[1/7] drm/msm/dp: Replace open-coded drm_dp_read_dpcd_caps()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f906b95755f7
[2/7] drm/msm/dp: Use drm_dp_read_sink_count() helper
      https://gitlab.freedesktop.org/lumag/msm/-/commit/284a245d8bdc
[3/7] drm/msm/dp: Remove dead code related to downstream cap info
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8bddc2d12e9c
[4/7] drm/msm/dp: Remove aux_cfg_update_done and related code
      https://gitlab.freedesktop.org/lumag/msm/-/commit/62ebb19fb32d
[5/7] drm/msm/dp: Simplify with drm_dp_{max_link_rate,max_lane_count}()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a9905b469931
[6/7] drm/msm/dp: Inline dp_link_parse_sink_count()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d89ce4cdb7a6
[7/7] drm/msm/dp: Remove dp_display_is_ds_bridge()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b41c5ca70684

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
