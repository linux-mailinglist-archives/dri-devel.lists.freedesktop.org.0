Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C091F19ECC3
	for <lists+dri-devel@lfdr.de>; Sun,  5 Apr 2020 18:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8A989CB3;
	Sun,  5 Apr 2020 16:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2A689CB3
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Apr 2020 16:52:58 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id 11so7376655ybj.11
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Apr 2020 09:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Y476tFGQ+gkHx/allicxA4ntNHH1dKZsul/Xx2aMnlI=;
 b=ABbc2c69wBO1ak64sMrQErhHP7l8DK8Wty8S1P/LUUWJ3a3qrbmBeM6A0oTmJRYN7w
 ee6ARMP36bEct3DuarnL7NrtGMJN+ww0X1EvnrJ1MEudJj6aWW4TDIDkInf3prb/Pk2w
 0SeGCdsrW48ASSZkd9RvPc1w3DoQsFuAo92C1BD0NxFe9iiRQLmnAusvD/egXswu2G9p
 g3BGPvhXPpgZOKvByoqFjFECAZsFgvW8tFtY0VKHSMtjSUwsri7yNTLf9/lhaukDA6LT
 bnrNmUScf2uVVWhKmi3AfvexhcSTnAreSy3L976pqG/4qrCP3cTW+41YtbCgLL808Oy0
 1QtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Y476tFGQ+gkHx/allicxA4ntNHH1dKZsul/Xx2aMnlI=;
 b=ZspjIa2k5i5cGNWnedunz15m/w3YK5V1xktCk6Svit/6LngRUI2ngnMfJqg8ZvrmOO
 9E2RL2gHaOoOeYGxHBidaKkm1M5RzQlAlAZPaLv8fldE9xqAxcIAwhZ/rlM2uY9C2k2L
 3raX6Lv/OYsOIDmGUnd84LdiGAZyvEIO172XTcp8/3m6vH5LiPMnwRJ+9aq98quUtEFZ
 YUpuKaWWrtQqAaCC1FOPzQ/fNMSUic5Si9vII9kgItIs4cAEbFRNZjHxVNBsSD7wLpAj
 aZFl1uQs3H19RKTOB0hKdhbFUM2BANxF3EbcMuKMJ1RS/r6M+D+z+AdpSo9eFY7VFyRU
 BAUg==
X-Gm-Message-State: AGi0PuaVZyqbDINs4KK+w+lvknD/2naFjicdW3rEMkSn/ESGiFqRousR
 Vz+Adc/A8XqLZcjkHDR5WYTsC0qk1RlHs2FBDGW1dJnBYOk=
X-Google-Smtp-Source: APiQypKrmfP2lvc8K2QnvmpmxAZDguhP7kPGGdrq26yNsAygXbKijNMByLineBXvd46LSz6gz7XgE6rW8+kymiCJNVY=
X-Received: by 2002:a25:4251:: with SMTP id p78mr29633539yba.201.1586105577117; 
 Sun, 05 Apr 2020 09:52:57 -0700 (PDT)
MIME-Version: 1.0
From: Sandeep <sandy.8925@gmail.com>
Date: Sun, 5 Apr 2020 22:22:50 +0530
Message-ID: <CAGPDPzCHs0ty0rxs=QN7xmHhuDfftdO17P81-s=L=J5e_14vNw@mail.gmail.com>
Subject: [PATCH] AMDGPU: Correctly initialize thermal controller for GPUs with
 Powerplay table v0 (e.g Hawaii)
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is required for the AMDGPU driver to report fan speed for Hawaii
GPUs (otherwise the fan speed is just reported as 0)
---
 .../drm/amd/powerplay/hwmgr/processpptables.c | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
b/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
index 77c14671866c..bb58cfab1033 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/processpptables.c
@@ -984,6 +984,34 @@ static int init_thermal_controller(
  struct pp_hwmgr *hwmgr,
  const ATOM_PPLIB_POWERPLAYTABLE *powerplay_table)
 {
+ hwmgr->thermal_controller.ucType =
+ powerplay_table->sThermalController.ucType;
+ hwmgr->thermal_controller.ucI2cLine =
+ powerplay_table->sThermalController.ucI2cLine;
+ hwmgr->thermal_controller.ucI2cAddress =
+ powerplay_table->sThermalController.ucI2cAddress;
+
+ hwmgr->thermal_controller.fanInfo.bNoFan =
+ (0 != (powerplay_table->sThermalController.ucFanParameters &
+ ATOM_PP_FANPARAMETERS_NOFAN));
+
+ hwmgr->thermal_controller.fanInfo.ucTachometerPulsesPerRevolution =
+ powerplay_table->sThermalController.ucFanParameters &
+ ATOM_PP_FANPARAMETERS_TACHOMETER_PULSES_PER_REVOLUTION_MASK;
+
+ hwmgr->thermal_controller.fanInfo.ulMinRPM
+ = powerplay_table->sThermalController.ucFanMinRPM * 100UL;
+ hwmgr->thermal_controller.fanInfo.ulMaxRPM
+ = powerplay_table->sThermalController.ucFanMaxRPM * 100UL;
+
+ set_hw_cap(
+ hwmgr,
+ ATOM_PP_THERMALCONTROLLER_NONE != hwmgr->thermal_controller.ucType,
+ PHM_PlatformCaps_ThermalController
+   );
+
+ hwmgr->thermal_controller.use_hw_fan_control = 1;
+
  return 0;
 }

--
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
