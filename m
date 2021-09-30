Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD7141DBC5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 16:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E041E6EB9E;
	Thu, 30 Sep 2021 14:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3B46E406
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 14:00:28 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id g41so25745541lfv.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 07:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CEEjR1bGgkvoMjAM+j1fmPm8gGFZpeKZvM7Zf9RxxRQ=;
 b=ZgPehbikJwO1ZUB59sLHg5iNekNUb7c5T56/59wkDXEBS9TzPgz3qb6rJ7OHtSukNK
 H39PNaQdLGDMri07VB2/l81zrVtBft37JINSkwrzUXXAFV6F9MzVoxAkMrvAC7MPaf/g
 zFHGjTkNOkJoioA7AmO7G3lTzF0aKflLvqIwN5PQ/z6aOPHegxGUHCRq9cVS6iV3S1b7
 QPmxriudM2DJIQ4hwf+b0q2cTem9zzyERZgMcRR2bq5Oi1dZJVBP655dB6JAtLhC7D/M
 Y5e+8StlfNJQRbHhovArdbMcCvZLYn6bdcaCP/7Kc4roItnncrxFTBHvnWzxzNUK99rX
 Ay2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CEEjR1bGgkvoMjAM+j1fmPm8gGFZpeKZvM7Zf9RxxRQ=;
 b=6aeSVHZCPYkET1G40n2y/7U23ooSnCkLHIFq8Zja6D7WV+1enpVHmPUu9vbLq+p+/N
 m6/Zriq8/d5y2AHQGrQunrsociNyFs1ZEhI6nXMrTIPWfcLBa0LSLbPe8/4xkFe+w0rQ
 xwUzwsKe48ogxGGnw58o69IVltsgYKHM6a/UJaPZ2tdCAaSAr2UFNg+FC7TXjQ6An/5J
 puEW+ygoDTyiyeWLJ9rFv15aJGxhhvUD/Q2LNmcfixyT7Tn0dr884BqgeJdoCSMqaMDq
 d0eaGbwEPsp9rkGjvmqJs1YEpwzGGNbehIWc8unySq/OS6CZr/jt2YL+k2EUsonLbASc
 5m+A==
X-Gm-Message-State: AOAM530J+zj+hvqZa8dcUyEcf2988daWbPMguXjj6lyiFBo6oQ/D01Df
 yfFIDqePks/hTbx9ifVUSNcA6g==
X-Google-Smtp-Source: ABdhPJx0rvQC/RiXJ/67ZLP3GcS4vwesSN2ts19blA5Y7BHQOoTuqKGnyPA9b2cv7fH6+udokM5NPg==
X-Received: by 2002:ac2:5c11:: with SMTP id r17mr5988459lfp.191.1633010419615; 
 Thu, 30 Sep 2021 07:00:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id o7sm380481lfr.216.2021.09.30.07.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 07:00:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH 00/11] drm/msm/dpu: cleanup plane state
Date: Thu, 30 Sep 2021 16:59:51 +0300
Message-Id: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
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

This is a cleanup part of the DPU multirect patchset [1], split away to
ease review and merging per Abhinav's request.

Currently significant part of atomic plane state is stored in the
drm_plane's subclass rather than drm_plane_state's subclass. Move it
either to the drm_plane_state or even to the on-stack allocation.

[1] https://lore.kernel.org/linux-arm-msm/20210705012115.4179824-1-dmitry.baryshkov@linaro.org/


