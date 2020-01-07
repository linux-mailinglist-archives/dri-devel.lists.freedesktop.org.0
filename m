Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F029133CDE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:13:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BFB6E867;
	Wed,  8 Jan 2020 08:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7EC96E839
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 19:26:01 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id a124so454937ybg.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 11:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=digitalocean.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=4DKB6Qc7EQjmBiBL2Egn9+nwj/mOHqlQ9foMEYlIG8s=;
 b=IOJjPyAyvnzuaeYvsM7svksubqWXA8Hoa7vK1bSt+tq7EJBo7VMbZS8S8OZSLwg1pG
 36w/czHJ96ImfadkDxCEjuu2XWNf62lAMDsXNsGFKHjawBMtvJOe2BF5ITEpiN1FAxl9
 5YiirNrNugcI13cQILvJLZwP+M6SsP86e47EU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=4DKB6Qc7EQjmBiBL2Egn9+nwj/mOHqlQ9foMEYlIG8s=;
 b=lMllsclgDR5fT38Djp2nOqudiNPiZdyk70y9m0yvMxggl/SlTtBbgdxuVA9OHT3bnW
 xnugKUK5h0maMBsRxflLT2BgCD/o31iIQ7Xkj0isKvDlYA6m015AibTRam8F5rKkqdtd
 4scBD0TWtwU4asQQQ3E9IX2stxz01ff1nBmDhn05zDdrYkAHKx2e1jhtEQs3qFah8Vkp
 xAt9Ixglf77LntAVELqvBP4U/SSSGeiEK7oDkzLleCf98bRRtcYSx4am+kbbLLO6W7m2
 ZrItG89MQVIBLrSNJkAHVFt1W0fL0p+ObhIYPg6+6pPFPfZ7dZOgvNFfyQwmM02rE/RY
 HuvA==
X-Gm-Message-State: APjAAAUa3x6nFSH1Cc5QUALtI2TQq7jMiIdtjZHOi6Kj1b2JVR2zGi+m
 2VTUC9nl7SEuV+4OQKRVkd5E
X-Google-Smtp-Source: APXvYqy+9ob7vtrukxOuHGC9cxGwvi0VR2CE0/vcLH7EgE5nxS3/p087frpqoeKCnXIBDamwJYeLvQ==
X-Received: by 2002:a25:40c4:: with SMTP id n187mr909330yba.199.1578425160957; 
 Tue, 07 Jan 2020 11:26:00 -0800 (PST)
Received: from tina-kpatch ([162.243.188.76])
 by smtp.gmail.com with ESMTPSA id y9sm252630ywc.19.2020.01.07.11.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 11:26:00 -0800 (PST)
From: Tianlin Li <tli@digitalocean.com>
To: kernel-hardening@lists.openwall.com,
	keescook@chromium.org
Subject: [PATCH 0/2] drm/radeon: have the callers of set_memory_*() check the
 return value
Date: Tue,  7 Jan 2020 13:25:53 -0600
Message-Id: <20200107192555.20606-1-tli@digitalocean.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 08 Jan 2020 08:12:31 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Tianlin Li <tli@digitalocean.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Right now several architectures allow their set_memory_*() family of  
functions to fail, but callers may not be checking the return values.
If set_memory_*() returns with an error, call-site assumptions may be
infact wrong to assume that it would either succeed or not succeed at  
all. Ideally, the failure of set_memory_*() should be passed up the 
call stack, and callers should examine the failure and deal with it. 

Need to fix the callers and add the __must_check attribute. They also 
may not provide any level of atomicity, in the sense that the memory 
protections may be left incomplete on failure. This issue likely has a 
few steps on effects architectures:
1)Have all callers of set_memory_*() helpers check the return value.
2)Add __must_check to all set_memory_*() helpers so that new uses do  
not ignore the return value.
3)Add atomicity to the calls so that the memory protections aren't left 
in a partial state.

This series is part of step 1. Make drm/radeon check the return value of  
set_memory_*().

Tianlin Li (2):
  drm/radeon: have the callers of set_memory_*() check the return value
  drm/radeon: change call sites to handle return value properly.

 drivers/gpu/drm/radeon/r100.c        |  3 ++-
 drivers/gpu/drm/radeon/radeon.h      |  2 +-
 drivers/gpu/drm/radeon/radeon_gart.c | 22 ++++++++++++++++++----
 drivers/gpu/drm/radeon/rs400.c       |  3 ++-
 4 files changed, 23 insertions(+), 7 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
