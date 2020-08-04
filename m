Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9809123C6C1
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945DA6E524;
	Wed,  5 Aug 2020 07:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFF589E52;
 Tue,  4 Aug 2020 20:07:08 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id w25so9585075ljo.12;
 Tue, 04 Aug 2020 13:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3azTrGP+LhHvSC09M4k8Vw28GxxV8PL/Fmjx/psKnVE=;
 b=KD3U4/FABUKWR1juhGbVRQ1Y/MC22u+FfGKWnvS2okLXEIMhyY8rJYmqIWpChTclgK
 odWpgxAEob6xjlmB8BrGY+z5JzGAt4USWspVBigQLML5OEhzjUpFl/uH8M3gZ1+xE9qE
 HTsT3dAeJMYYrq2dqC4Ucq0DxpwzlZZUhLzp+0L4fmP5RLUjGR+sYsMPwAXiNbFoNK7V
 1jBmby/vCggXOMFr5DilaagPTwqRsvRpQ0M/YhcxaMxRPaxU4qu705/FOo16JVV98CKv
 +Hncxu27XUQ5LRoaAy8NDMQ/73OgqbafNmuXJe8LKUG3QU4bB2p3IE1kqSlbITTpu1fG
 g/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3azTrGP+LhHvSC09M4k8Vw28GxxV8PL/Fmjx/psKnVE=;
 b=DgVuLvWJfjL5AaZKXHE+H0bGAVkSlMN87SMwHiqYj8YfxzwX9wFsIW1Js5HHbT8yFL
 dlfTl4WIaxgnP7+SuSnyqqTThpfoFRm10f91v2CbDIO6dT9DciUHEn/9F/LVQVkMehtW
 OuaiyTPAS8fesuXxhlU9pxMq9/Gv5eCHzpjwqcZV4dHQ6kzn7fop832fuPm9TA9yFy62
 BnoxRwpREWu60UCWAz3Ng7cyaM5gGEcj8DeU9T5X/nt9QIVVpWeG5NgJ9GQTpfDNsLEZ
 splZP2VVyDzwNWw9rzKTVkKvDte1nFdxVWzehz24fYi0jn4OgyA7lfmegRM+VAJ/C4aM
 qnag==
X-Gm-Message-State: AOAM530ZZNLE0WqtlYi7QCIYfddDgUic7eAPaInggmvirlEz3V5mtjLE
 AMIXQPDM/PcgsPwzY/HebvM=
X-Google-Smtp-Source: ABdhPJy3AsPNQaIKiToyk18pBgh3WPFP2MudjbtbKX6Ce/AOCPL8HID0YU1jQ5OnAZqwhLBdXlUuog==
X-Received: by 2002:a2e:8197:: with SMTP id e23mr11882263ljg.406.1596571625718; 
 Tue, 04 Aug 2020 13:07:05 -0700 (PDT)
Received: from localhost.localdomain (h-82-196-111-59.NA.cust.bahnhof.se.
 [82.196.111.59])
 by smtp.gmail.com with ESMTPSA id g21sm3080020ljh.103.2020.08.04.13.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 13:07:05 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Subject: [PATCH 0/3] drm/amd/display: Constify static resource_funcs
Date: Tue,  4 Aug 2020 22:06:52 +0200
Message-Id: <20200804200655.30495-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Aug 2020 07:13:16 +0000
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
Cc: amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Constify a couple of instances of resource_funcs that are never
modified to allow the compiler to put it in read-only memory.

The other drivers in drivers/gpu/drm/amd/display/dc already have
these as const.

Rikard Falkeborn (3):
  drm/amd/display: Constify dcn20_res_pool_funcs
  drm/amd/display: Constify dcn21_res_pool_funcs
  drm/amd/display: Constify dcn30_res_pool_funcs

 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
