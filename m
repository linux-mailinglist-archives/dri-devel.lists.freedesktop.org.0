Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C74A03C3711
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jul 2021 00:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E946EB62;
	Sat, 10 Jul 2021 22:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C201B6EB60
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 22:20:09 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id s18so15234446ljg.7
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 15:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NojbOfPBuAxlnq1atBtX8uKIRmmW3SP0xnu57MhbJwg=;
 b=cOc6Ro8+IZ9NK2jzMEfXuL0RvCQr+YtBZrXCJRrlOd8yeuhqAvDjMeBZmNtIUL94FS
 ZHgu3E93HjkeB2ixitQxYNOm4WskyFPX6cb0FnYAmuqW0AaVwvHhUcwTatbD4I87GYq2
 8S4StzXwPNPqxF+pKYnZayK2zkr49ydEeABBtw6kGYH795lK5o6bdNIVpbYdLXmVM5cm
 ZrXjEDF0wu0gwK+8JJfigTWbLY4MBtJvZ/wc6JqBB3tD+oE7nCmJmzijk6geLZf4QoRk
 0g/oCL9G04b6LQCz81yuO6QcJCkcvFhGiAVHEKqSebVKO0HElq1SdmAPJAI3RXrz0G3a
 lksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NojbOfPBuAxlnq1atBtX8uKIRmmW3SP0xnu57MhbJwg=;
 b=Cy1up4bL0j7mZuDjaOVob7nbsA0dppk53j4QQHkNtbxK4w3Qr1HxfHRJiKGQ/87la/
 Gz/laZUtgmMGr+9xNgLhZBtqg8T58sGytxkPJBMIsINlJKY6rNp1qApsECaF8n0tSTBl
 aKIZpbfNXxEiHxAdsQ+bQRdtyKome+dVJz0S9hrqIWqgAFGEmqj9+G/xXWZpaqeBr9X2
 WQjzN9ASk3uvfvl0MYbHEvUOPvZtRdYlcENVK2ED+RZ7Aitc6xpojColFds/BHJRR80b
 Eq3w+10Zmrt84buTshygpfo0CnTEJ6TB1IGuaAJq8uk8mCGXB73bcWWXEpq0Yc4VTuU9
 T/ng==
X-Gm-Message-State: AOAM530mPwry+1LYcTrzubr2YHFHZnZgdPgjnO+Cnt0rOB/PWICWmus1
 1nvHFYh7JE6orcIgFh3O89lSqA==
X-Google-Smtp-Source: ABdhPJxkyQKAg3ovIJyXsN8xCqX0lw2DojpWbEvMFfSg4GrCOLycySMYHMREuR7o5+RP0Mtrovqy5Q==
X-Received: by 2002:a2e:b54d:: with SMTP id a13mr18914747ljn.14.1625955608208; 
 Sat, 10 Jul 2021 15:20:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s15sm795466lfp.216.2021.07.10.15.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 15:20:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v3 0/7] drm/msm/dpu: add support for independent DSI config
Date: Sun, 11 Jul 2021 01:19:58 +0300
Message-Id: <20210710222005.1334734-1-dmitry.baryshkov@linaro.org>
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

This patchseries adds support for independent DSI config to DPU1 display
subdriver. Also drop one of msm_kms_funcs callbacks, made unnecessary
now.

Tested on RB5 (dpu, dsi). Previous iteration was tested by Alexey
Minnekhanov.

Changes since v2:
 - Removed Reviewed-By tags from changed patches (1, 2)
 - Changed more dual DSI mentions in the patch 1
 - Added msm_dsi_is_master_dsi() helper
 - Rewrote dsi encoder setup function again basing on review by Abhinav

Cahanges since v1:
 - Rewrote dsi encoder setup function by separating common code sequence
   and calling it either for the bonded interface or twice for each of
   the DSI hosts.

Changes since RFC:
 - renamed dual DSI to bonded DSI as suggsted by Abhinav
 - added comments to _dpu_kms_initialize_dsi() regarding encoders usage


