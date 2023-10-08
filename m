Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E72CB7BCEBB
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 16:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B482010E17D;
	Sun,  8 Oct 2023 14:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7953810E179
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Oct 2023 14:01:26 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50307acd445so4656884e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Oct 2023 07:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696773684; x=1697378484; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zrbe2OEAhJijEGyQK+85gEV7qQdJqrY99QKDYQ+rxHc=;
 b=HbJABJtLkyiPx9BL8jA12OjsAwofdcBK9Erel6/FFz2svhl+5H7i2JKdGCWyt1aCQX
 weKkh3KIeN98SblyVbJI0QPci0As+VdrobKCs/ctLnRDanWWf8KnQiVfOVrPDz29ufVi
 XUxhySKNkA+3tDIgGQgy2nc75LV4qWuFNgcUETnmUkfV3BSQE22yu05RbxUnR373NoMJ
 707VmI5Uk5Jlu3AC2cLSdNFj28E3gxgtDcJVR6z3GLRZbcJZxPh9PrjxGJXkGMvVlT5h
 T2kYrbjEWyQVUXY61C1a4APj/rdEH2DdKaKD7PIZ6bOoQm3D6qPn3CGiu/iWLNLLp2K5
 889A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696773684; x=1697378484;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zrbe2OEAhJijEGyQK+85gEV7qQdJqrY99QKDYQ+rxHc=;
 b=IkoAp/7rlEkAGtECqTHC9TvepwdL5H73ViW74/yvN177M2Exj3/xMKOp68rMBaoth5
 BbtGYcmY9JACgZF1szOWMnWk5fbU2H1LZQjWRwuAGCAc/Zm8CVT6sA8K+qB8pIRusbTl
 1g9m7Hc8tbC3AmEMBQgTLPwylgngnIuTraFxRNO+SAtLJseRt0VAYVYo8+XVXCOAjazm
 vq3EXwzpxGisoRh0Q/NCT1MD08lefdrIBzeYxrn2au2zjSjQGnXSr5GCifHLs538abAo
 PhSiQSZs4u3nqWvHBFMoIv2bbSRXk04YA5wqrc15I2FFPlIA1W+f0O2BfWyKMWEFq2uE
 s+tg==
X-Gm-Message-State: AOJu0YzMRMugYSosqa2hsK/EuA0xiKj7jj0DG63faKgO1hLrt5UqOOMu
 dGuA8gWUz7PIdARHAW9CXbX5o7x30gXRgyeagS6fYA==
X-Google-Smtp-Source: AGHT+IGhX63ME4hP/QjxMFDzFKLGVSIH9lhaSoXMWQNHOUIpoqTqxSJVWPkVFp9aDX3v7yMASthgLQ==
X-Received: by 2002:a05:6512:2082:b0:503:2561:adbc with SMTP id
 t2-20020a056512208200b005032561adbcmr9582392lfr.64.1696773684439; 
 Sun, 08 Oct 2023 07:01:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q14-20020ac24a6e000000b00504211d2a73sm1080455lfp.230.2023.10.08.07.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 07:01:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/msm/dp: skip validity check for DP CTS EDID checksum
Date: Sun,  8 Oct 2023 17:01:15 +0300
Message-Id: <169677306905.2570646.10307218692711830426.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230901142034.580802-1-jani.nikula@intel.com>
References: <20230901142034.580802-1-jani.nikula@intel.com>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 01 Sep 2023 17:20:34 +0300, Jani Nikula wrote:
> The DP CTS test for EDID last block checksum expects the checksum for
> the last block, invalid or not. Skip the validity check.
> 
> For the most part (*), the EDIDs returned by drm_get_edid() will be
> valid anyway, and there's the CTS workaround to get the checksum for
> completely invalid EDIDs. See commit 7948fe12d47a ("drm/msm/dp: return
> correct edid checksum after corrupted edid checksum read").
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dp: skip validity check for DP CTS EDID checksum
      https://gitlab.freedesktop.org/lumag/msm/-/commit/22e96e73182c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
