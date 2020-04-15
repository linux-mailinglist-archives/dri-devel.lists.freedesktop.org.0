Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA521A9C8B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 13:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB406E986;
	Wed, 15 Apr 2020 11:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A08C6E986
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 11:36:34 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id f14so8961154ybr.13
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 04:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=TUXSYZ7hMkNWDoyRg7MzYt+A9LdW4iQ72kZBND5bJeI=;
 b=XFiBVjUYMUb+E2YHh4tyOBG4uU+NMyL0U0iLIm27/qyNNg2SfC7+4+tjOWZm/7+rUc
 7vFtvuOvKb3/+KhJx9BObz5PMWkpwEG1RpThm0FvlOkiinYc4eXkbbMWZjhYLo/ThfBx
 knBY48hXkyIf6aUxYmIAdRS0hUPh8WQvoJDRoco8aroccH9DnZw3OgnrpH9efzPxizlU
 /CWbxlhnP0LhgpJ/bEdd20ObmaxL5XcoSxaTfDnzp79viYc9V/sgyuKBF584Phg4hv/a
 yph7Q964kEdxjTE8rDkC8oEPnM/Hd9EKHFS3NnYxQpfk3cs1JBPvVkYo9brS3CJ1aA0I
 OscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=TUXSYZ7hMkNWDoyRg7MzYt+A9LdW4iQ72kZBND5bJeI=;
 b=maStf7gBcEQMF1ZTlseim82wiakrpC0ENb4MSIBV6RaHKXJrChBZPmAcwSwt/Fl/wZ
 XXnQNvNmZuMBf7vuloGv8cLbF2IGbAXFBgCDZ6qlfEBwx++xPsbVBDky+oY3N0XQ9aey
 LpKVQQEucIy7n0YkjyWbOp0Uc1Kj0DQCgv6bHho3pyvLJvkH1wNE8tbhBCQUiP8hyoc6
 US3EpUlP51+/dGAZ/soXwqsMzBjKB4q6vctUU+K8i8vV+9c7UzSDO1wd9iHiCidg59Kt
 4/+QeKLbjbe3o/wYJv/FX8SnXUoPOpi91tptPYUvNZDvq/q/DAW4hXcdonKLXS43kv4C
 Fqpw==
X-Gm-Message-State: AGi0PuaFsFVxS5jvtB3Qpv8awgGfKsPkF1D9A9YHsSyJL7uaKAWoyswJ
 PT/hPpZGI71yzam6Dpw0NdgJnLFbjFQAHT3/AbCQMVcgkD4=
X-Google-Smtp-Source: APiQypLL3gnOSN3755AOU3znqoS0fzA6REWBYXOWhTdp2CmQ5xFGu8pKKh22+dOsKgLdEl4FLqDF5z4Uhu1xbNf6+7s=
X-Received: by 2002:a25:d482:: with SMTP id m124mr7792442ybf.103.1586950593334; 
 Wed, 15 Apr 2020 04:36:33 -0700 (PDT)
MIME-Version: 1.0
From: Sandeep <sandy.8925@gmail.com>
Date: Wed, 15 Apr 2020 17:06:28 +0530
Message-ID: <CAGPDPzCSaiXdL6ocFtL1VoFtiQLHDE5YQhw-ikWkFVjpaW9GAg@mail.gmail.com>
Subject: [PATCH 1/1] AMDGPU: Correctly initialize thermal controller for GPUs
 with Powerplay table v0 (e.g Hawaii)
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 alexander.deucher@amd.com
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

Initialize thermal controller fields in the PowerPlay table for Hawaii
GPUs, so that fan speeds are reported.
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
