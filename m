Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F1792CD6A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 10:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4228B10E6E7;
	Wed, 10 Jul 2024 08:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="3JyAufpb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F8D10E6E9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 08:47:27 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-3d9e13ef9aaso94956b6e.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 01:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1720601246; x=1721206046; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+4vhb4x+1ngj2cwnEYd7V6NzeKsvkyPmJT2A1p8eqn0=;
 b=3JyAufpb/U0SQdjBZJw1871J/1guf9FU/PE2AMZRbxDfuuSK5iSfI4ag88kHO0oB24
 tz+479wvRUdYPA1ELGUX62OByYzw9M56Wkf3rWE2WYXiM6wYLskPdUmOdvO/3pVl5Plq
 CAEzfdSdE9jh0u4xOsjJsSwAgUdQpaSgZ6WIiroTwb64cGEoSVqhr5W8eoCArjZCbirN
 sMmxzFU6Ds830G0DJOCq6D2LAOQHA2sMvY414ipMm4GswEMBc2RkGwGKt0K+zndm3cmE
 QpMUj/RNU29OXahfh1VFJ+QToQ9IWBZpj8AOYanxjxEk+maAXN2drFDYZJcqXmabRmpn
 25rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720601246; x=1721206046;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+4vhb4x+1ngj2cwnEYd7V6NzeKsvkyPmJT2A1p8eqn0=;
 b=fp1dhwsXEykcayV8A6zBUqN2U0VIPWKTRPDyYbLLaTHd4OouT7zO9sue7GPMbU+Aag
 RNXy/UoFV/GT4ewWR0N6rLpt59+vTbw31TdlFAy3xk+rQM81RjdWL/NwpcNYuKqx/TzN
 7k8+ocHxsubMAcrsy9utQ3pvtjdokOyy592isVecSM+vFTpPX06aKgmV9yC0kWYxjILN
 n6il66d1n1rN04vkKl/B+cqSfByl9aof9zX4pnfwE9CL58iCKQJICvqJOtH8f8BfOkLy
 5YMhbmtAWVk0QbtSa+Lgg4j6jwOr8taVvSw++H8FVNPKoGMEYDsuZhwBwAJ+AYFeDWYX
 WG8g==
X-Gm-Message-State: AOJu0YxoS3Kq6JWIj1Gy8q0sqj/+mSRBnMtg+qCr755twW3L83RDLheX
 c2Ep+1c8C5e/qrkbANZzXeXTAbPoW1j3rIKtU6bni2t8oSdDvSTP517nXMs1HB8=
X-Google-Smtp-Source: AGHT+IGQT0q7ZvCjUcYcC2KSlIBRszB33wvFdbqGu6VxoW8hdCjhAZ3/FBfpHsJvLaKlLcZR5GMGZw==
X-Received: by 2002:a05:6808:30a2:b0:3d9:232b:e275 with SMTP id
 5614622812f47-3d93c0297ffmr5077041b6e.25.1720601246553; 
 Wed, 10 Jul 2024 01:47:26 -0700 (PDT)
Received: from yc.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b438997d4sm3216077b3a.28.2024.07.10.01.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 01:47:25 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, mwalle@kernel.org,
 dianders@chromium.org, linus.walleij@linaro.org, airlied@gmail.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v1 0/4] Break some CMDS into helper functions
Date: Wed, 10 Jul 2024 16:47:11 +0800
Message-Id: <20240710084715.1119935-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
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

This series main purpose is to break some common CMDS into helper 
functions (select page and reload CMDS), refer to the discussion 
between Linus and Doug [1]. It is expected that there will be no 
impact on the functionality, but I don’t have an actual board to
verify it.

[1] https://lore.kernel.org/dri-devel/CAD=FV=VssfZBxwh6i4e_mHhT8vZ_CnXCrUhoeTUeo5xN-FmASg@mail.gmail.com/

Cong Yang (4):
  drm/panel: boe-tv101wum-nl6: Break some CMDS into helper functions
  drm/panel: nt35521: Break some CMDS into helper functions
  drm/panel: nt36672e: Break some CMDS into helper functions
  drm/panel: ili9806e: Break some CMDS into helper functions

 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 190 ++++++------------
 drivers/gpu/drm/panel/panel-ilitek-ili9806e.c |  14 +-
 .../gpu/drm/panel/panel-novatek-nt36672e.c    |  69 ++++---
 .../panel/panel-sony-tulip-truly-nt35521.c    |  29 ++-
 4 files changed, 138 insertions(+), 164 deletions(-)

-- 
2.25.1

