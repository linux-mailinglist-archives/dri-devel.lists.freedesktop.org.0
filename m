Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C7C253E71
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 08:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9E76EB5E;
	Thu, 27 Aug 2020 06:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C188289DDD
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 17:00:48 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id e11so2371738ils.10
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 10:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=26QxbXjs0m3B0fkeAQyxS9wdKxVZQIc+uM+Gzg+WrxE=;
 b=lebqEwzMhnmkswoxV6vONuwriIJ3JbLyvJdUMvGSkvk4rWMzuvlc611vQT6UXue4kb
 wuvGPZeBJwakM8I+RxywGmWpCfcM1xTEyQ69vOl82tWVJTod2B3ns3KNvKkqCrpgFY0l
 eiy0e08N3NHS0uzIhvheHSOD5J5U4Y3SrC/Xd+VWhXW4VYZ7Nx+YHN8ue885Go737b5S
 J9/7dQKzUKx6X5CmRhetUxkGMx2GuQpeLCzw3P9S7xWkqAUoLbFRkmIegcs6bMSm+bcq
 DmgxmVlJbAyb9mGkZXT9lfX/0VEwS2S8sIPEldJiY43Zcb0JeubJsLM8DZoGErATcX8M
 aK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=26QxbXjs0m3B0fkeAQyxS9wdKxVZQIc+uM+Gzg+WrxE=;
 b=n24kH3OFdtQRJBRNfFExracqiH0oPZx031cIK4xUdm8XJgW0T3syBW9gCLwcv86+j6
 VnBKS95uQisAxw8c1QtL4uAWQ48XTxiLP77x23BRq2GFn+Ivt72eZxLelpiy9n94OMHx
 ldZx6Lpt+MlleeAOXL2s1A/GhT3GvgYW8IqtxZiXTpx+MaulTsOYe09H0Va3pn25nNWs
 i0d2OcOrlRKEJclU60TS9cxk9Vwv4ETAoeIOGH90Mfu7fpLaW64liDyfrbMhbss0RnXS
 Bf1h1XH9FHwvhukHG2UPB2PELzP1Znq0vv9KL928OpOUQS2q/z8YWnBS5XFaNdJ+3RPr
 KxRw==
X-Gm-Message-State: AOAM531aAPNrTL9pER1IhXt7p7NEnVM79MKyWc+Mk+vIBKilk4fsHqIJ
 jHq6capWq2QFZq7OaEMqBIYrSElQA5PZaQ==
X-Google-Smtp-Source: ABdhPJzXNx08f0nZ6xcJw6hnAsHg+EfmelTxJ3ljsr5xDxklbhFCTqfDudRRdcHUuI/h2miSh0PL+w==
X-Received: by 2002:a92:c74e:: with SMTP id y14mr14195110ilp.251.1598461248027; 
 Wed, 26 Aug 2020 10:00:48 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8203:5970::c4c])
 by smtp.googlemail.com with ESMTPSA id p78sm1479606iod.0.2020.08.26.10.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 10:00:47 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jbaron@akamai.com
Subject: [PATCH 0/4] dyndbg: POC use dynamic_debug_exec_queries in DRM
Date: Wed, 26 Aug 2020 11:00:37 -0600
Message-Id: <20200826170041.2497546-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Aug 2020 06:57:36 +0000
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
Cc: Jim Cromie <jim.cromie@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset tests/demonstrates using dynamic_debug_exec_queries() to
alter 2 drivers' pr_debugs without a user directly using >control.

For drm.core, I copied drm.debug module parameter model, adding
drm.debug2 as a POC user interface to control 2 pr_debug additions to
drm_printk:drm_dbg,dev_dbg, allowing both category and >control to
work in parallel.  This patch makes no attempt to integrate drm's
category mechanism with the "format=^class" callsite selection; thats
the "theory", but it needs testing.

For i915/gvt, I repeated the pattern.  I focussed on gvt only, because
it had the most compelling use of format strings as pr_debug classes;
~120 pr_debugs in 9 classes.  These are mapped onto bits of the param.

bash-5.0# echo 0x0 > /sys/module/i915/parameters/debug_dyn 
[ 3137.044185] set_dyndbg: result:0x0 from 0x0
[ 3137.044185] 
[ 3137.047370] dyndbg: query 0: "format='^gvt: cmd: ' -p"
[ 3137.050302] dyndbg: entry, buf:'format='^gvt: cmd: ' -p'
[ 3137.053331] dyndbg: start-of-word:0 'format='^gvt: cmd: ' -p'

These patches were the test/use case for-59 fixes:
https://lore.kernel.org/lkml/20200825173339.2082585-1-jim.cromie@gmail.com/


Jim Cromie (4):
  drm-printk: POC caller of dynamic-debug-exec-queries
  drm-printk: call pr_debug() from drm_dev_dbg, __drm_dbg
  i915: add -DDYNAMIC_DEBUG_MODULE to i915/gvt/Makefile
  i915: POC use dynamic_debug_exec_queries to control pr_debugs in gvt

 drivers/gpu/drm/drm_print.c        | 54 ++++++++++++++++++---
 drivers/gpu/drm/i915/gvt/Makefile  |  5 +-
 drivers/gpu/drm/i915/i915_params.c | 76 ++++++++++++++++++++++++++++++
 3 files changed, 127 insertions(+), 8 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
