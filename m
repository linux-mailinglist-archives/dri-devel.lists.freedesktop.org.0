Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C89394983
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 02:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E95F6E833;
	Sat, 29 May 2021 00:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9340A6E833
 for <dri-devel@lists.freedesktop.org>; Sat, 29 May 2021 00:25:17 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id w7so7347562lji.6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 17:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BODLqdEHCra9qUlSEftQ4xsxlh1+FODYRdHQRB86f28=;
 b=uGbtAPxEvoyvx74MWS2o9kIhLaCxR9NZQ6OmOv9oc9hu1TLxHNNAPYn3gzlIIJmx3h
 XQgbiB6FlZeDbiJJbKaKLSedqzztcCnXFEcc95yl3p1abMg+6eJOXmw/L6h4R+IV9o6C
 XQesOeUmZMXHiEWXCfniwHipBZ8c/7VZhLxfplhdeg+Gi+VCzAEeSV70U2Whz/KT/gff
 aP+9LDkHVzzE7Ssm6TA3El5AQEnaKCe0sgboENoAm609RhU7dziYGl8A8KtOC88joMS1
 7iUtAC0eLTUnqx0D7SRsf+FnZbjq25dNJ4X4UWLyV/5j5iaNw7aaITt6uCukQEazBtei
 OTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BODLqdEHCra9qUlSEftQ4xsxlh1+FODYRdHQRB86f28=;
 b=LU0+LT3t2+rvEd7iwTC5bauEmNDdLlGQjMBRDNeY7+WhxvjiBNslmd7wNxBKYk1GsB
 AHkVKMufhqTLUzmRqxKczn4FZEBM32r9SRh9KLyIsXPNvgmqrXkUs5Q6b7MQZJoJJsq0
 blTPUwI0KTUy9rA+fq8CaAHsx7OG1DlVcgbgYjAhbBZXcHVmjbZ8RW4ez37krSU4VRyR
 iF3HqgeRqhExyL34nTCKoTeHUGzXHR4AszAPbqgcBMRnbu/ylFbQtGJ2G6So1dW85k05
 +NpabhKh2Rf+pjTgqGrC6q8b4Io2gaY0I0UekSzSry1vmmQURMiDBrtsYBiMrCdhGIDt
 /azw==
X-Gm-Message-State: AOAM5317EOFUERfst0l+kTNlPaA2Fkggft/XZeBN6oKBa7thIJVQL2kz
 BVKfx+C5SBDns7zkV6SHf5k3UA==
X-Google-Smtp-Source: ABdhPJwjvewfZRMsnIYRlASELtzoZFUlolzG/MKKgogWsG4jMl6ZWBKnxfp4ESok53GK3bD6sdVxMA==
X-Received: by 2002:a2e:7a17:: with SMTP id v23mr8274083ljc.99.1622247915928; 
 Fri, 28 May 2021 17:25:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c8sm701078ljd.82.2021.05.28.17.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 17:25:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [RFC 0/8] drm/msm: split DSI PHY to generic PHY subsystem
Date: Sat, 29 May 2021 03:25:00 +0300
Message-Id: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchseries is an RFC for splitting Qualcomm DSI PHY from drm/msm
driver to generic PHY subsystem.

Dependencies:
 - msm_disp_snapshot fix at https://lore.kernel.org/linux-arm-msm/20210527220330.3364716-1-dmitry.baryshkov@linaro.org/
 - Patches 1-7 from https://lore.kernel.org/linux-arm-msm/20210515131217.1540412-1-dmitry.baryshkov@linaro.org/

PATCH 8 from this series is quite big, it might be split further if
required.


