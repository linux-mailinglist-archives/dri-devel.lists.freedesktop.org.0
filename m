Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2905C63C8E8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 21:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F96910E223;
	Tue, 29 Nov 2022 20:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6665110E223
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 20:02:55 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id jn7so14495446plb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 12:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CfKH+xyksi0xqE5TmQ4tvVhOd3hsiKDk8OYhqlbjSB8=;
 b=G9+zn2FEpPhCOSPiRVwfFep3yaKrUlO9qHtLjX/mOFCCuvawco5S9WV228oZfGoYyo
 ovMkz5fdB3P6gSd1cV+HLfPn04TdA4/5w3uh3uSSM7F7jelQyAgegkX363bILmNKybJM
 5phgB8+85AUMnWiK124E1Sln0/WJ8HN46QYpSH7uDqaR9CRrf4oOvfhDQjMzjJuFnzp3
 21nlcWUXn1mT37PyWgiqJMcmC7zjK7A9DyML9GA3KX+Bwun8UDF/VGKu5tTO3KunIQhT
 tPwGUm+hS8zZ6DrD2POO1iaTOHcop3kG9A5Y7vD2VWvb06sQGrxeH+nfgBOQJSrQBDcV
 1A6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CfKH+xyksi0xqE5TmQ4tvVhOd3hsiKDk8OYhqlbjSB8=;
 b=m2WB0s3mt4MMPqOYfe5YywHwmj3FGaewK9OVFAkHOr/zdYjgQctMlxFLr1RWtSMwMS
 h7YTsRrzTahE4XqqiIi3iakQYdq1CCovz4FK6bvvBe9wMhYCMw5V/o5sI6jpfscsUK3J
 oSRkIVJgCaAiFG0hmeanKfkzHQ+ZgZ8EkAK/d1ZBzFJwDJNPKXmumaF1uTtGWrqtLB8N
 JPBc8381V43LRBEgXaqcW90072EDCI4bM2rmhz9hpaEBsvXkdL1u1VmzJz1bjBTmaj9D
 o6W7DOzmN+jLeu8IJZFoXzLIbDxpLuZwAFKyff1Fq/zmJOji8bpB5rKoOzlGIrRUJWT5
 2wYA==
X-Gm-Message-State: ANoB5plnU7BESe9Fi5cUcAsuG6+aBW4WtUjlQnMHlss1gJUy8dBXNnfI
 fj36iTG5ewtasdAsmcQFlETH1a+Ivjs=
X-Google-Smtp-Source: AA0mqf7Eh/KR1N7IVrXofAqsiaZC6asEN4rgWB6PMDEyDZWNbVTALIlvC19PK6Ng5TuwGqFxoExAeQ==
X-Received: by 2002:a17:902:dac6:b0:189:7105:59e8 with SMTP id
 q6-20020a170902dac600b00189710559e8mr19845751plx.50.1669752174436; 
 Tue, 29 Nov 2022 12:02:54 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 d13-20020a170902cecd00b00177f25f8ab3sm11370262plg.89.2022.11.29.12.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 12:02:53 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/shmem-helper: Fix a couple of error path bugs
Date: Tue, 29 Nov 2022 12:02:40 -0800
Message-Id: <20221129200242.298120-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

A couple fixes for error paths that userspace could manage to trigger.

Rob Clark (2):
  drm/shmem-helper: Remove errant put in error path
  drm/shmem-helper: Avoid vm_open error paths

 drivers/gpu/drm/drm_gem_shmem_helper.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

-- 
2.38.1

