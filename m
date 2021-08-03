Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 467EB3DEAAF
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 12:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C47A89F97;
	Tue,  3 Aug 2021 10:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29D889F97
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 10:17:00 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id n6so27504755ljp.9
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Aug 2021 03:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iqd7quPL1WYvjaIscp231slV4CSuWpyxNWeRMDXfDYg=;
 b=hAw6QdSzz7ht2/95djyPnaSN1wPcm03tQEHPZQOhjkZZ06m0qLZQ44+PP6R246pz5V
 bh3TQU9CXAP/ndO+GRcOKItNNlFhNQd7ce1tHN+8S1CwQ16FXRlaCVXVKyw642eryo+y
 znsLS7rHYmSH1iJIkz9L5/LGSUHUaN3gqLuky/msFbV90u7uWMHDN7y3fuI5bWBEipiJ
 /cb4yxqU6EFglSuCPVXwmaXpHS76eMCIigJmzc1axzpFvM7ql93yXhgZEXRC7/nOQVcr
 ule8g+oCvCFPDCYgTnuivtNOaRBumY6ZCTt6n7MZ914wNIQB7MtScFYXK6Or/0gPINSo
 Kupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iqd7quPL1WYvjaIscp231slV4CSuWpyxNWeRMDXfDYg=;
 b=XNOYuyWofbvLMqejEORNeU37TgwsXOVzmz+WkSPAuFvxdCvnZNAQD3UgfeBUhjrI1X
 XlVMR6mzQ9CnFqkWhjeVOylUS5Cmw6WEzq8K43bhwW6bydO1K43iy758Xivmxr1QWGAo
 OU062a/LIxXWImRzaeY68JWFtLogA5H9U9s9Qp57hS2Nfe8dIby8hmIjgM1kktT9kC6f
 SsEAbmOVub5xJFIWLIKrIaDcoHopunqZ4gLnJIScZKVgFFT6ejuma6xwD75E8IzFE9Cu
 7mI+IUrPBwW5zx4kQDk3p/28YnPp6z5Hvqhxk2tM4tC0NoT2kDRsQZVkVafmmbJk4NR7
 jIZg==
X-Gm-Message-State: AOAM53172v9nH5sIVXP9ZGRiX7oH4Lvwxl3uqpo6c49HtqFz3uBlUlMo
 T1i19EqtfiJ+2f06wcF0rnfxAA==
X-Google-Smtp-Source: ABdhPJz+HsxrfCrKNjb3P8l6jxnieC81OoQVe1N7Ze95vFfOKAy8ODChxM+W81OweuRIvqqNwpPHxQ==
X-Received: by 2002:a2e:7c19:: with SMTP id x25mr2700834ljc.169.1627985819081; 
 Tue, 03 Aug 2021 03:16:59 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id y10sm1056692ljj.10.2021.08.03.03.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 03:16:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <abhinavk@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v3 0/4] drm/msm/dpu: always use mdp device to scale bandwidth
Date: Tue,  3 Aug 2021 13:16:55 +0300
Message-Id: <20210803101657.1072358-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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

In 5.13 the DPU driver was changed to vote on the bus bandwidth for all
the soc families, however suggested [1] dts changes were for some reason
not merged at that time. Let's merge them now.

If the bootloader does not setup the bus vote, clock might not be
enabled before the driver votes on the MDP bus bandwidth. Originally bus
votes were static and happened in MDSS hadling code, while now they are
dynamic and are moved to the MDP handling code, thus bus clocks also
should belong to the MDP device.

[1] https://lore.kernel.org/linux-arm-msm/04b4612dfd3f651ead068725409211a0@codeaurora.org/

Changes since v2:
 - Dropped merged patches
 - Rephrased commit message for sm8250.

Changes since v1:
 - Add dts changes as requested by Kalyan Thota

----------------------------------------------------------------
Dmitry Baryshkov (2):
      arm64: dts: sdm845: move bus clock to mdp node for sdm845 target
      arm64: dts: sm8250: remove bus clock from the mdss node for sm8250 target

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++----
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 +--
 2 files changed, 5 insertions(+), 6 deletions(-)

