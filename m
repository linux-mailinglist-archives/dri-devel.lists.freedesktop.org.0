Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E393C9B9BCF
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2024 02:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3AB10E22F;
	Sat,  2 Nov 2024 01:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wVV9coUt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B04A10E226
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2024 01:08:17 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-539eb97f26aso312339e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2024 18:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730509695; x=1731114495; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fQ73LcOfKQHGeSfhVnzEL1HHx0W3Qb8KYGmPSTFzc30=;
 b=wVV9coUt0swv8+7ienz3SE8VKAGj1sO2/q1qXgCUyxtk4z8lFrDNVWR2oQrZ4khB2h
 lhJYcFd3DPbF3a8X4lLdkoSo3zXoD9VUVjZUIcY06QYLfOZHc1P3Je3OWbmvTR7M7O1s
 OvdQeu/kVh1ulUJsyNprsnqjEg1oSzP1dcuXIfF0KPaONSaVY6cfNdowfqLZy5M4fX6+
 DZzyen/pGRtMWcCqxFPQtoEQUwk5A5DDyEsrfT4MCiVYwYUSCtEaIxSp86ocawDvGy2N
 ArYS8bSlhxoJINKRXzwPAkdi1Atl3nc75RbS089Vvnreiv4eCSKfQzBcJBPMSF+yQxGk
 Dn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730509695; x=1731114495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fQ73LcOfKQHGeSfhVnzEL1HHx0W3Qb8KYGmPSTFzc30=;
 b=K6bIc7o5N7ocDZ3yqjjhd9cHAgJcmrSqnXuWR6UMfQllqKEvm0gElMOavy0AGXYEwI
 q0gn5lqxZCH3mRZwvUvW+vTe3fHXwjQvfr0QD76JK9P45J88UbEbXT19zczhRU4953Mi
 JrIeb4OvkrrAkZ1HY/1c9+3w4xajVlgpnNJibsthVyn/3QYh6YiVGF4et8gN86lMmqpe
 SFEgn0Mfg1jQAXKr+2BQ31LjXQ4aNuYhoWtaC04oW3AkUGmSifyw4EfrGvp9v8QTMxMg
 v90r8W50K1JybRhx5j5C0Oor6RtB/DlH+ML+xqgV5xFpnYk1tWDFOXveUrTAjk81y5e/
 BMSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqbATUUI1t+sgj4lSRwzvFtntgVcSdUdgCtlg420fu3ARAqR1UqLHk+9nRfuODgGnvs9tMu1TMEd4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxWn4PXLhJ9UwHOcizsHafABRxZk22r7VRZsH2E3HE8uG1UX3W
 67lFXnAAna6+5yOZ/h0gJa/dcE8A+vB+tDIIAYDZHpEDjeLPojY5d4Vx060yeCM=
X-Google-Smtp-Source: AGHT+IHgtubYy+4UJyb+Qi1jP+QjT2/Oa51KR/0SwdWfoTIIE/48Rgn4AUpWinMbyqlRwrE/EnDG7w==
X-Received: by 2002:a19:7404:0:b0:53d:6b77:4fc6 with SMTP id
 2adb3069b0e04-53d6b775575mr59549e87.43.1730509695326; 
 Fri, 01 Nov 2024 18:08:15 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bcce6b5sm718678e87.122.2024.11.01.18.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 18:08:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/9] drm/msm/dpu: support virtual wide planes
Date: Sat,  2 Nov 2024 03:08:10 +0200
Message-Id: <173050960724.2285086.13738775113532570270.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
References: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
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


On Fri, 25 Oct 2024 03:20:07 +0300, Dmitry Baryshkov wrote:
> As promised in the basic wide planes support ([1]) here comes a series
> supporting 2*max_linewidth for all the planes.
> 
> Note: Unlike v1 and v2 this series finally includes support for
> additional planes - having more planes than the number of SSPP blocks.
> 
> Note: this iteration features handling of rotation and reflection of the
> wide plane. However rot90 is still not tested: it is enabled on sc7280
> and it only supports UBWC (tiled) framebuffers, it was quite low on my
> priority list.
> 
> [...]

Applied, thanks!

After additional consideration, apply only basic patches, leaving the virtual
planes enablement into the 6.14 material in order to be able to get more
testing for those patches.

[1/9] drm/msm/dpu: use drm_rect_fp_to_int()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/50024444c44c
[2/9] drm/msm/dpu: move pstate->pipe initialization to dpu_plane_atomic_check
      https://gitlab.freedesktop.org/lumag/msm/-/commit/31f7148fd370
[3/9] drm/msm/dpu: drop virt_formats from SSPP subblock configuration
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b96ca23fdd03
[4/9] drm/msm/dpu: move scaling limitations out of the hw_catalog
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8f15005783b8
[5/9] drm/msm/dpu: split dpu_plane_atomic_check()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/dbbf57dfd04e
[6/9] drm/msm/dpu: move rot90 checking to dpu_plane_atomic_check_sspp()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ab52d2717ac0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
