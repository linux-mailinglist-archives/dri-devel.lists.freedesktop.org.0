Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2D385A343
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 13:31:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2CB10E39C;
	Mon, 19 Feb 2024 12:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DdIoeY2U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D817F10E393
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 12:30:48 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-512bce554a5so477978e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 04:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708345847; x=1708950647; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nvrkezDo1rHjICZL2s/PVn57PqWpvp8fU/617NnrWFE=;
 b=DdIoeY2UAgY23G0zsfZRcy6UZ2sgFGjqNl45wNQyxOWu/aSP3QSi6RrwTEFsoukqI9
 lucP8HXS42KjP0gu/U+vfSJyY2AepudcWBnKzqAt4EsRDPpdQXfQtbR/UWh2EsiQ85iS
 makK5XScabwHdMk+bG0IG+tuROhCIud85zb+mIPlVPXydgF0rsBNhfH7Nji1FzfSC8jZ
 Gy9fQebjUzkHx71PG1BzRqfaydtoV2SYqGD93SVUoj+UbXZxVR1lQYO5R54PbQpIT5eZ
 0q4b2b5WeYPnfTjN7sKn9tF3jFL44iplly18vx04judTBZdwdLClDsfQZxaHRUALI0gA
 /D1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708345847; x=1708950647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nvrkezDo1rHjICZL2s/PVn57PqWpvp8fU/617NnrWFE=;
 b=q67BkdpZ9c88Mz0E8LCUFsLKddqLbcgdZtZkRqVx5bv+Hzddx+6tQ/zDjrRPHSIbzf
 XF7JcibdNhaA4q2a9fwKeTN6jjOFaA3FNwWxTk8G0UJ7g0zXv+urKBbC87wEFODEXQUG
 YbWi3JODeSZvSblAFIf/T9vIirpyQBSt7O7zs/TY/fTMlF7H39a2Pu66H48JJxbsBXjR
 TFz28fLBaL6gFcB/jTNjx4R/AvagPt5KaIl/Dph2cOt2NCpurX3+rXbRLBN506RgpY5h
 /umj64Gij/V/cAtzaxUlOe8c7GZKE8j+YpVfDhZl2S0buy4Q5qg9xB7vs7cL5RpLWoO3
 THmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCULrHZL/8dPAT/wXdLAa+ss6BpxzFQC24q3O8qm831oQKcaUXbU7ZUTW3eYP8UnI+7/WoBA074tKmljokbq0K7V0iwCKUfDzQpLttqD/Kpe
X-Gm-Message-State: AOJu0Yy3rZZ1EYdlRrwUHAfp61QJHEkqPc7OYec+ra/m70GgpDTbGNap
 YIxeKJnlBhsqOFxBxWcl5nye/5YxAvWoezFuqfac3Nm3c2BHS7EX707VQAoQZ6k=
X-Google-Smtp-Source: AGHT+IFDU3sQwKWrHgyZRrzoOm3yG95OWAiaYRW2V2ZKFFmF/CCC8Nh72finlmtQYDZPlBB5ipFAfQ==
X-Received: by 2002:a05:6512:3ba5:b0:511:2e7c:768f with SMTP id
 g37-20020a0565123ba500b005112e7c768fmr10094521lfv.46.1708345846969; 
 Mon, 19 Feb 2024 04:30:46 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 04:30:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND 0/5] drm/msm: cleanup private obj handling
Date: Mon, 19 Feb 2024 14:30:33 +0200
Message-Id: <170834569500.2610898.14807948698250442590.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
References: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sun, 03 Dec 2023 03:05:27 +0300, Dmitry Baryshkov wrote:
> Note: I'm resending this patch series as I haven't got any feedback from
> the drm core maintainers to the first patch.
> 
> While debugging one of the features in DRM/MSM I noticed that MSM
> subdrivers still wrap private object access with manual modeset locking.
> Since commit b962a12050a3 ("drm/atomic: integrate modeset lock with
> private objects") this is no longer required, as the DRM framework
> handles private objects internally. Drop these custom locks, while also
> cleaning up the surrounding code.
> 
> [...]

Applied, thanks!

[2/5] drm/msm/dpu: finalise global state object
      https://gitlab.freedesktop.org/lumag/msm/-/commit/49e27d3c9cd6
[3/5] drm/msm/dpu: drop global_state_lock
      https://gitlab.freedesktop.org/lumag/msm/-/commit/abbf3108bc63
[4/5] drm/msm/mdp5: migrate SMP dumping to using atomic_print_state
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f9c27e649a0d
[5/5] drm/msm/mdp5: drop global_state_lock
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ffa0c87f172b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
