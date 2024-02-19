Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 676E685A33F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 13:30:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227D110E393;
	Mon, 19 Feb 2024 12:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AN+qG3rm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81FF10E393
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 12:30:49 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2d208be133bso40058581fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 04:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708345848; x=1708950648; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bqUC7cuIQqkJ0gS7eqwu1gxHdis9+l+nkFywUCkY/qk=;
 b=AN+qG3rm8vnWK+i/rS2B3s2Tu2perbiEoClyycWdaBn/QhpW/ZaxbGuplfA9i+Q5bZ
 wv+TFc6L6sRWxA6vgGfcrDnyEpAOHGVpbga1WfMQXy1DcJHN9YMiOWPIpNMwQzQLKuMr
 xl2Q5nCOwIiYN8LwENWFcB3qV0YxKm7YAl7RZLZMlBeOXFifnAWleEgQlutFvSjJZPVn
 xrH6ulx50hyGEyCfOo3oKl4bUqQOrS5Ob29eJvmJmUYqNC1CNLFndOxAOkY+V4RL1SmX
 EUXeJP2RzNaaSGOnJ8+GTQEbrChtq4cM7Tt0naboxT01PfJQg4YOoZT5YBAuPJE6OWyY
 w2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708345848; x=1708950648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bqUC7cuIQqkJ0gS7eqwu1gxHdis9+l+nkFywUCkY/qk=;
 b=iK7M5fs2QUAg0YJ4UbcMut4mq+YMsXmPY2786Z5OcxoHZYdyrbpVJ/sTJnZh8V5eKz
 dnVMSanzCcaPCVEKF5AUCib+DU08aCqw4PBdFXx56nkkeQgThL5GaCGMHCmCln73uOxl
 pAaXVPJbfgR466I89pzEdoRtMK+TvF+YuDDmdoJApkwEIzquyYR/G4ffvQnRFJHNijg1
 OOEbhYI4CZU9Wr/aaTbECyJjPfP/tB46ZLtiFWLwqxYEyIOWbrgUX6lUQcxepdoJ6qEe
 fA/bGqf2NSfeWIfrUgiXZiieLRCogeIlk1YY6bisXbFI1EdCu4gsmjZe9QhEhilal0qQ
 Ioqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDvSoi/pClTN4G3cuF1uy5tl9byw+UcTf2hafXR4kRF5nkBAu7IQu3AOqqXXQc0pxxNiPkbdxBZrUUBCUVhhmLz7ojXbDl8dBWA7l9b6B+
X-Gm-Message-State: AOJu0YySvkhsMcnMru8C9A1ZpW6DBSSqnx+DanybkHBHLuuGHWB7lwa2
 feenxI0KYbxPEK5NyiB1oEyjVVQXU5ANgdRZZy/GyurJNb03qED0wY5hrdu76v8=
X-Google-Smtp-Source: AGHT+IHNdPSE3GczBi9T0DN9rQxAmvZca5C9487Cr1vL/kGDEv0s4gJKgLoYiqB9g73htQAToLy7/Q==
X-Received: by 2002:ac2:5f72:0:b0:512:b051:7b06 with SMTP id
 c18-20020ac25f72000000b00512b0517b06mr1986283lfc.31.1708345847746; 
 Mon, 19 Feb 2024 04:30:47 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 04:30:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH RESEND v3 00/15] drm/msm/dp: clear power and parser
 submodules away
Date: Mon, 19 Feb 2024 14:30:34 +0200
Message-Id: <170834569505.2610898.6936484745958965912.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
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


On Fri, 26 Jan 2024 20:26:19 +0200, Dmitry Baryshkov wrote:
> Reshuffle code in the DP driver, cleaning up clocks and DT parsing and
> dropping the dp_power and dp_parser submodules.
> 
> Initially I started by looking onto stream_pixel clock handling only to
> find several wrapping layers around a single clocks. After inlining
> and/or dropping them (and thus dp_power submodule), it was more or less
> natural to continue cleaning up the dp_parser until it got removed
> completely.
> 
> [...]

Applied, thanks!

[01/15] drm/msm/dp: drop unused parser definitions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/08c5b691ee54
[02/15] drm/msm/dp: drop unused fields from dp_power_private
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9aeb50ea0ea9
[03/15] drm/msm/dp: parse DT from dp_parser_get
        https://gitlab.freedesktop.org/lumag/msm/-/commit/31a01db14b90
[04/15] drm/msm/dp: inline dp_power_(de)init
        https://gitlab.freedesktop.org/lumag/msm/-/commit/47103b582412
[05/15] drm/msm/dp: fold dp_power into dp_ctrl module
        https://gitlab.freedesktop.org/lumag/msm/-/commit/17cb153f81df
[06/15] drm/msm/dp: simplify stream clocks handling
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9bd0946d5ca1
[07/15] drm/msm/dp: stop parsing clock names from DT
        https://gitlab.freedesktop.org/lumag/msm/-/commit/77d0243a3313
[08/15] drm/msm/dp: split dp_ctrl_clk_enable into four functuions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e518c27218c6
[09/15] drm/msm/dp: move phy_configure_opts to dp_ctrl
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b4745f741e79
[10/15] drm/msm/dp: remove PHY handling from dp_catalog.c
        https://gitlab.freedesktop.org/lumag/msm/-/commit/64eba0d63c70
[11/15] drm/msm/dp: handle PHY directly in dp_ctrl
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f304bda5bfda
[12/15] drm/msm/dp: move all IO handling to dp_catalog
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1577814118e7
[13/15] drm/msm/dp: move link property handling to dp_panel
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3ffe15b30a63
[14/15] drm/msm/dp: move next_bridge handling to dp_display
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b3b1d122a80b
[15/15] drm/msm/dp: drop dp_parser
        https://gitlab.freedesktop.org/lumag/msm/-/commit/6215f1558bab

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
