Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C6E913886
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 09:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959B010E0E3;
	Sun, 23 Jun 2024 07:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nFMSECDN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB6110E0E3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 07:14:15 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ec4eefbaf1so20130851fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 00:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719126853; x=1719731653; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NdK+Z57kLe+iVSXD6oAbe65mu24X+W08m/s2wPEPRiY=;
 b=nFMSECDNy7DkyzQee/gNtesUMJBz2aAu5G3NoXSJvx9TcyI5ikVW6RGsu7j+os/FeV
 Rc4jtk45O4tDdIzyo+2p7RExpB5Ooql8zMImF5uEmvy8BSrpEfOQ2Rz2az3qdNdSB4q1
 3P1pvlgs/mAWJRm0M8NOLQShDf3225XlGUd7D/CRL5ODrg5sQk5oWwcMc13EF8TRpEIs
 RHAcsorVVKgjuWekHdv7EGLRIObliDaNL7+/4a7g/t/HbRsgiAnY5g2S5u3z2vZhPL96
 u12ell97l1/qFJsMc+wX7mazEuPdroMTAaKw5lhgIfZw8DK6TrR6oaaMfGh9oDkTPcWx
 DSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719126853; x=1719731653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NdK+Z57kLe+iVSXD6oAbe65mu24X+W08m/s2wPEPRiY=;
 b=EXFFT1JYi6CT4C4GaeZl5Kx9xlisIoy8Yya5yJC0elL8nOrmPz6kJKGjd4ffBBXquc
 VlHoLSFgXBi+Dy5IsXCq3mSCmG5PMT3+QopntMUSRLM3rGub7mRDF0RMRVy2f3H/sm/X
 PIiAp1wfm7oB9FrtdkrKLiuI13Cxw2r0QbBkwXu0WZHhVKiO9FeaPNbamAIVREvSO8Ua
 B7HClgslACzIXJcL4Hu6pkRfLk9DwQMkslFuaCVDjtBqtpIPEG1ACIb1QAqKbb/t9goc
 LHaYGxRNzb95d5ujyepynxZN3uXfaEF1j7zLxPKxpZK1QSLPH4Y9DhejCobM0k6TyWPx
 v8tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+jh2IefV4m1S/SMPjWFCkLQyFrLJ9nyyuV5r1+yfKyhjZlYTh+p+omgjOHM/dl/wGRY2GTDjvVpbFj/E09FLT4tjTrkJJxXwKo5sKV9EC
X-Gm-Message-State: AOJu0Yw9EkWi3Wy06fWmi4gqFkTAIeoEdYdtKzK0EFfNl1Rc0Nc9pnrP
 iosd+iy/aGLB+6zAfGv0qw8uEz2M2Xb2rH/2Gs29cFPCH7g38VIp3aM4bGM6hrk=
X-Google-Smtp-Source: AGHT+IEKqxbvtWfQPSdbxyZOKoTKzOfta9UYAGWkjh4gPijepxo+y2Odys4DRzztDMFEyCfQKNkPDQ==
X-Received: by 2002:a05:651c:152:b0:2ec:5603:41a with SMTP id
 38308e7fff4ca-2ec5b36b266mr7424131fa.2.1719126852954; 
 Sun, 23 Jun 2024 00:14:12 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec5b031208sm1886861fa.26.2024.06.23.00.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 00:14:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_rmccann@quicinc.com, konrad.dybcio@linaro.org,
 neil.armstrong@linaro.org, jonathan@marek.ca, swboyd@chromium.org,
 quic_khsieh@quicinc.com, quic_jesszhan@quicinc.com,
 Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Add MDSS and DPU support for QCOM SM7150 SoC
Date: Sun, 23 Jun 2024 10:14:04 +0300
Message-Id: <171912674297.840248.14141240302342567945.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240614215855.82093-1-danila@jiaxyga.com>
References: <20240614215855.82093-1-danila@jiaxyga.com>
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


On Sat, 15 Jun 2024 00:58:51 +0300, Danila Tikhonov wrote:
> This series adds MDSS and DPU support for SM7150.
> 
> Changes in v3:
> - Swap DPU and MDSS patches (Krzysztof)
> - Add an explanation of the abbreviation DPU in patch 1 (Krzysztof)
> - Switch qseed3_1_4 on qseed3_2_4 in patch 2 (Dmitry)
> - Drop LM_4 and LM_5 in patch 2 (Dmitry)
> - Add Krzysztof's R-b tag to patch 1 and patch 3
> - Add Dmitry's R-b tag to patch 4
> - Link to v2:
> https://lore.kernel.org/all/20240612184336.11794-1-danila@jiaxyga.com/
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: display/msm: Add SM7150 DPU
      https://gitlab.freedesktop.org/lumag/msm/-/commit/64e2f4cb27e7
[2/4] drm/msm/dpu: Add SM7150 support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/75079df919ef
[3/4] dt-bindings: display/msm: Add SM7150 MDSS
      https://gitlab.freedesktop.org/lumag/msm/-/commit/726eded12dd7
[4/4] drm/msm: mdss: Add SM7150 support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0f4786881281

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
