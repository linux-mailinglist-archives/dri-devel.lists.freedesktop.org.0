Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CED2B356FA2
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 17:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95FE6E931;
	Wed,  7 Apr 2021 15:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E186E931
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 15:02:03 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id d13so29040218lfg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Apr 2021 08:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/LBtCivT8RjVxvsmi0WxRFn8L0eyOzWjgUYimtMST2k=;
 b=SYjfGs/hCTzsdJPGSZT5lbyFGm+CbUsITCHHvnZz+buGVcvltB/e9AmsHLQc6C+6rt
 i7V7OT2Vy8LXGem+BJHUY5d6WlWH5h4D2Uc6EuoDZ3SspKAX59VQWr+mCU7lDK8AB72w
 IUIs3orUjIyDMNsxjkJMawuPzsciI2ApBJ0nSDzNm6DIPxmO9vZc9h48KjuEMeRVBMvQ
 5JKhyKAFaGrb9UTFxa+lZRCDIK9sU4+k+wbvjJQnKf+GMam18pXsHeUv4YtFiETbSE4E
 8psB3UN9MD05kvQBaE0QxJIM8RG4wLX0w3closJNtrhDgsjFWaYVoSUmCJU2o8ya0Vdl
 0IjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/LBtCivT8RjVxvsmi0WxRFn8L0eyOzWjgUYimtMST2k=;
 b=LEpH3ckhpmZcWbldn8Sr7IiTNkLMjUQo7t25ruuEC2e62k9gV8SNQ6Rn8qeqLXEXTK
 YI+LrLJc00FCCH6B0Tjdhq7aC+6S5VLGTBFQYb+p7vbOOt/aE7qwXxc7Wt+PX4Ex03pl
 7/U76veemRMLvVdiQeoSMqxRfLhouEaeZ8zNgWfFWBG/fZntrtfUORiRft7+569rCpoz
 4pZS/tQXTL5nGqWHziBf3FcS7e1iKK4uN/Q/x625KGjhdsQZN2kk/mGYH5tELIHjQvjC
 r19DW6Q7bZkUZZ3pFaDPuQ6xKTC7ABMZOJiPKWOun8YJugE/dQpQtAFIvOqw7I0BiZ13
 Z6bw==
X-Gm-Message-State: AOAM532VBvBNIEuhjo2je9k2uuhorDrXGvxXW8lEIbk4tpL5ii8EHVAG
 BqYFVtJLJRm59g/+RtOS2XmZyg==
X-Google-Smtp-Source: ABdhPJykHSWWklYcE1eNJZmtmV9MVnhC03A+eepjyV3mrjNDR/ybJhP6m7UIxJqF3QhM4rq7fON97g==
X-Received: by 2002:ac2:599c:: with SMTP id w28mr2652623lfn.381.1617807721313; 
 Wed, 07 Apr 2021 08:02:01 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id o11sm2552142ljg.42.2021.04.07.08.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 08:02:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 0/4] drm/msm/dpu: always use mdp device to scale bandwidth
Date: Wed,  7 Apr 2021 18:01:53 +0300
Message-Id: <20210407150157.801210-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently DPU driver scales bandwidth and core clock for sc7180 only,
while the rest of chips get static bandwidth votes. Make all chipsets
scale bandwidth and clock per composition requirements like sc7180 does.
Drop old voting path completely.

Changes since v1:
 - Add dts changes as requested by Kalyan Thota


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
