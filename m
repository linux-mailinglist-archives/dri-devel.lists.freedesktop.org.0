Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB79F66359C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 00:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD6210E51B;
	Mon,  9 Jan 2023 23:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013BA10E0CF
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 23:44:04 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bt23so15577854lfb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 15:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U/freu+ZgmiBA4hrBK8o79X6HX9HTTyxAvA2ufrSoK0=;
 b=ei8MTQp7vxUDhE4iKnFq1/ntIVOdVd6tuXdIpOwfrtvx6atVRVyyPKbWmpP1rvFscm
 L/HdGhjbrE+c7TQb0HLPWkDmPusmKnPG+9MOnxpN3/Kf7+ZcxOf74CrMNZKh4weg2gn0
 VAa2vJLjrJdKTjoZlopffsHF0cON4Oosur23OYVwDAeP7QV/D66IEuheo8TXkNSBuSiE
 t4YdtaaGJMd7+GqNvB+m3/veyYEY64bKKMEoZMJ3L5/uN5rWfRg1YOdEMCW7OruZol2/
 PzAjdWAqIKpW2myPiH8sn1TYfz6YIweA2qsyX9r1VZODVzIvPbIuiP31Ckl4nw1fgCr2
 cXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U/freu+ZgmiBA4hrBK8o79X6HX9HTTyxAvA2ufrSoK0=;
 b=Op09LnBVtltsUADOvAM472lsQxkAtn5taDiBOEhmtzLH8PlmrLZmLZsgRgkFHRsFrg
 igMQGEbAt8tqtPNeTwQz9YT/+m6E6yl0l3IprMa7EOZ0prMEZJs/5OtJHsJFalsDprqh
 naFdZo58vOrthx095/VRzub9U6okdEtpU5ZK0ixmotKn3IdEUrsWzdl9O+nJD2skDBfT
 czH0MssulMruurfkW13r+r8ms5Z3aLUeoAFgBUXcp3/DwxXqSItWGTq2K4O5QmiMqA8q
 HCzRvnpp2NQoso7Gvf8Ei8SXXO0JyHkdFFbIv51pRM8J/K6FWJ4IdHyjs0V81BRKU9bS
 fRrg==
X-Gm-Message-State: AFqh2kp7HqesCHiSRGEUpcvTF6tl2mRLyi9jhe/UCkSIZRPtFyx0+T97
 LaIRzVLqg5BMDr4dyXCoRnEPQA==
X-Google-Smtp-Source: AMrXdXvTqLgwZKbMxDEd7mTBv9Kz2IZ//DCx8MFrgLL57L7EaiB/j8/l1Pzsuay0XCa3nvGoVipSxg==
X-Received: by 2002:ac2:5231:0:b0:4a6:c596:6ff7 with SMTP id
 i17-20020ac25231000000b004a6c5966ff7mr16944972lfl.2.1673307843575; 
 Mon, 09 Jan 2023 15:44:03 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:44:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 0/4] drm/msm: convet to drm_crtc_handle_vblank()
Date: Tue, 10 Jan 2023 01:43:47 +0200
Message-Id: <167330408779.609993.9427004517463466813.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
References: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sat, 18 Jun 2022 02:33:24 +0300, Dmitry Baryshkov wrote:
> This patchseries replaces drm_handle_vblank() with
> drm_crtc_handle_vblank(). As a bonus result of this conversion it is
> possible to drop the stored array of allocated CRTCs and use the core
> CRTC iterators.
> 
> Changes since v5:
>  - Clean up the event_thread->worker in case of an error to fix possible
>    oops in msm_drm_uninit().
> 
> [...]

Applied, thanks!

[1/4] drm/msm: clean event_thread->worker in case of an error
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c79bb6b92def
[2/4] drm/msm/mdp4: convert to drm_crtc_handle_vblank()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6606a96ab1ce
[3/4] drm/msm/mdp5: convert to drm_crtc_handle_vblank()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e96c08e91726

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
