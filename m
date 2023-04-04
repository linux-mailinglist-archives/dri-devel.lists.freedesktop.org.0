Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBA06D603D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 14:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA26A10E1EF;
	Tue,  4 Apr 2023 12:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF9210E1EF
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 12:25:56 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id cn12so129874554edb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 05:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680611154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lvEiamQupS534VfqUXbSuDpINFZftut0QS92LpEg7X4=;
 b=ITg0zr2umq6uJE5uWt38EKHKISLid7v1/LtdB0gMGwoJ7m76yE9AukVpmJ3D4ucMK0
 4VD5e/vOPPzmfkG6ioZCZQedRavVzn8oskNNDk9df6YjFG+SwOxecL3O0UuRX18nkZNo
 6DztwhTa8v0zPMYpinELW76yH9Ts58g0M5SRUCpfsjGZuLlnA6C+wXd1yqeN2gaTNXD6
 4bQKj3FygSn3gx6iGOtSY5yHfg9TtTA2eTBQkJTBLvJXUY3bwF+Q/rQIn/xGfInX+3dR
 aHbKnNxhhUv6UAfLSKnLu9t/mYRqlZwfxWeHYPwXicNp56Ua77Cux1GUemRhHdNRC4ug
 bSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680611154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lvEiamQupS534VfqUXbSuDpINFZftut0QS92LpEg7X4=;
 b=BNRVO6nSCM6WCutG7UOT/pGvmZTbbLs3xnYxtkPtikG/ixbNpS29vmAqWKxl6152SG
 l5nzwzezMy0NBSwAIGoaEh8xOdfJS4WHcyAbQXEHQjTaNaxL+Fg6RinNtSVXjVqs0/Oj
 UkywBcarMeUoqCaSIoR1gOq5LsDi0ZvKVJ45lDsMBut/WRkHBzosRa5fDyCIFkedmJCR
 k5RZ8s+R9PefA1Egnm0d+u7D98Ts16FeBiILQsxxh8Lxs6D5loEjoVT1by4JRBFTC8y8
 mtdcOP1HLHQHpBL8xAk2qa5hy+4bPNBiKaSIwQzt827S4+/UZGOJj3cdYXogbihJFAOu
 gZ2w==
X-Gm-Message-State: AAQBX9fGzKSmgc+p3JD56reYMCRrQ8Ymem2zydKd59cnRWKeKLK8exNX
 rSTcFl7YRJOSSBN827JP//r8pvAqrB0=
X-Google-Smtp-Source: AKy350ZtNIoX7YZQDjBWRvM/+GxlQgoOVYwVgBRI52Y/EHxaIjTiEupUcppEDvzfUr8QQ+yo7CRhGg==
X-Received: by 2002:a17:907:16a6:b0:947:f4e2:aa2c with SMTP id
 hc38-20020a17090716a600b00947f4e2aa2cmr13829357ejc.29.1680611154246; 
 Tue, 04 Apr 2023 05:25:54 -0700 (PDT)
Received: from localhost
 (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 bu7-20020a170906a14700b0093348be32cfsm5988062ejb.90.2023.04.04.05.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 05:25:53 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>, Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH] gpu: host1x: Don't rely on dma_fence_wait_timeout return
 value
Date: Tue,  4 Apr 2023 14:25:50 +0200
Message-Id: <168061111512.2057226.3790183208967549717.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230301135107.999976-1-cyndis@kapsi.fi>
References: <20230301135107.999976-1-cyndis@kapsi.fi>
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

On Wed, 1 Mar 2023 15:51:06 +0200, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> dma_fence_wait_timeout (along with a host of other jiffies-based
> timeouting functions) returns zero both in case of timeout and when
> the wait completes during the last jiffy before timeout. As such,
> we can't rely on it to distinguish between success and timeout.
> 
> [...]

Applied, thanks!

[1/1] gpu: host1x: Don't rely on dma_fence_wait_timeout return value
      commit: c1aaee94380874fd40f7bb8417c597aba3f72c75

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
