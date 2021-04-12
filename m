Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCC135B79C
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 02:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC58789F4F;
	Mon, 12 Apr 2021 00:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F96889F55
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 00:09:59 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id w8so9994156lfr.0
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Apr 2021 17:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2oMyNmdOBQN3Shr+asOuK5lZYp7QDtf0TjwjEv7kY0I=;
 b=OmvDZii4vmb8/0sBD0CQQgLdaycbFPDwbuVJZBq8ACYRKsOn2rsvZXw7kT/7GOFCL+
 USb7IO6es5ortDKX2IC4NXxIMo55eFrPgkYsZ3s4hbXhnU05v5HFruUC2/WONkiBmgEA
 Q97ctTW6Hs6dGtJ16jGNq23ChfGFEeTdRPP3RoR9RGfzlHcYaVanPriZNJ1KaRvR92wa
 plQPmjw0wlj5ZfAonnLQqoqV+VoPgS6fayZ2epVmbaBHPwobgkMvk2TiZtgXIukKkh8P
 ktwKbB3DU1D9Y3jWVeu0bK/NlNrzIp72xDDHj6wScVkW7K/4yn0tj6kpuWhQx6b5+fMn
 7LeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2oMyNmdOBQN3Shr+asOuK5lZYp7QDtf0TjwjEv7kY0I=;
 b=gfXMjV3ECbG1/ggeGBYSDTHo4YTdCsGNVDke3YDYYvtw1qZuCpiKvwy0SfVmWKOxPH
 yHVnkzw6oyNBtGitMZLzqOsPFvN64X60KTuUYx2qx56E9jvB/+YxmhzSHNr7xSRGf1k3
 K1bxv2bQMHU5iMXvrq9FTb+HWWAH0H2gHnlVghWI0frWqkYKhggKFYULmhxak/7uzMUl
 fgUVnT44FxX7uaORxkadjUSNES4mWD0rkL+LddqsSzvEGhql9s3EvUjovaD6T6A6JjFX
 GoHXRj0n4VOkIAnbxaPt2HkYt87qm1Xn26HHJj4pdiHgj9+0t1XtD7MxFNIKt62M+Pn8
 G1Jg==
X-Gm-Message-State: AOAM532pPaI3xdJw9RHJoI0DiWpxyXlP+DpHnvrXyFgb7v1HgIjK378E
 8H+STQRUelBoKzcGykCYNvfE1Q==
X-Google-Smtp-Source: ABdhPJw64o0fsIyMT6VMVTXR1CJsgkeTVjv86+/qNb+VMX3cHR/nBKnLZ54ICd7ERmwyotwdOcQWhw==
X-Received: by 2002:ac2:52b9:: with SMTP id r25mr17758694lfm.25.1618186197646; 
 Sun, 11 Apr 2021 17:09:57 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s22sm2307212ljd.28.2021.04.11.17.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 17:09:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v1 0/3] drm/msm/dpu: rework irq handling
Date: Mon, 12 Apr 2021 03:09:51 +0300
Message-Id: <20210412000954.2049141-1-dmitry.baryshkov@linaro.org>
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplify IRQ handling. dpu_irq_map is a huge table consisting of all
possible IRQ entries (including a plenty of 'reserved' = not existing
IRQs). It is always used to lookup the interrupt index (in the table)
and then to use this index to lookup related interrupt register and
mask. For the long period of time these indices had 1:1 correspondence
to register/mask pairs. SC7280 introduced 'additional' IRQs removing
this correpondence.

Replace all IRQ lookup with stable irq indices, which correponds
directly to the register/bit pair. The dpu_irq_map table is used only
for the lookup of the irq index.

Changes since RFC:
 - rebase on top of msm/msm-next to include SC7280 changes.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
