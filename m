Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC23B9B23ED
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 05:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0364110E328;
	Mon, 28 Oct 2024 04:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NlqKoJ8c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5491410E32B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 04:46:26 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-20ceb8bd22fso30117435ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2024 21:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1730090786; x=1730695586;
 darn=lists.freedesktop.org; 
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ru6TZnJsC9elzyNrY/cvzQ4CwnpZ6FeXob1OQjHoMmg=;
 b=NlqKoJ8cInz8YF5ByTnTlz5AaL8Rr+yCKMjBfrO3XLuOuhQ5wyVOkmtANK/Tt9tjwc
 B5Ww1QaqxqyvBc3QPt4aSIHx4uH0z4XsqYXMIpfqeyIDdhIYWzlMZtvbyJDvFuWjQb8j
 U0x/waMKdza6Ez8I3mBhO5PJkd5Tvk/iwLkt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730090786; x=1730695586;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ru6TZnJsC9elzyNrY/cvzQ4CwnpZ6FeXob1OQjHoMmg=;
 b=rcjZtJL45Z1Tcpe7wa43iKSJQimH5lBt8W00TGaWqS4h/FGIT4MNu53ToVxZp/eoDn
 MzsB/g8gVtqxP87TyNWDH3CScsDl0KAcT7vo3eyllgkOzRZ/GnJSnTldWvmruDa9bQBP
 tr/BItebUL+cfKhxYlaRXVqrji/ttwJ3eN5a4MQkhmMm7m+jPqRbXIGtDaejq8/k8mdV
 ZOiju2x/Ft84uqdFhm78Kt4FoS0xsmA4BL9pYkIN7FQequUXY7Uad6nzqghFE+jX5CUt
 dcJ/34nCgJyMAe2tZzDdscPDQ2b1y6XDV8ktbMh9BRGqls8tgSlRLKHrUXxmoBgnV3J3
 6sLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWlLShNA+/N1156Am5KEYxPeRAdsGiSYDeX+EtzXcCTyMfHVLSBTBnA2Y0oNBgPtAowdiT7i2vwrY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzyo0+4j9UrpmgpLiCTTG7Bq1lkew2OQJr8ux7g68xcPGdP6Lao
 jX4QDdF+cTnqBJypENzjWfmDWDJ4rlRMr5YTy9Le7OnKpyNzitELH0GY2R/fVQ==
X-Google-Smtp-Source: AGHT+IG4o8SyC/xd2sK4623mdcAb/BEs5cFjcwjBL9FvVlKtFVsTbOeeecs/bZqY7tko4MXRQ5EkAA==
X-Received: by 2002:a17:902:e883:b0:20c:7d75:bd5b with SMTP id
 d9443c01a7336-210c6c75ae4mr88521365ad.42.1730090785735; 
 Sun, 27 Oct 2024 21:46:25 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:33df:d367:fdc8:47a0])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bbf464ecsm43014535ad.28.2024.10.27.21.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 21:46:25 -0700 (PDT)
Date: Mon, 28 Oct 2024 13:46:21 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: i915: intel_gt_reset() deadlock
Message-ID: <20241028044621.GS1279924@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi,

I'm currently looking at i915 deadlock report, the report
is for 5.15, but I don't see any significant difference in
linux-next code, so it looks relevant to current upstream
code.

Basically, intel_gt_reset() grabs gt->reset.mutex and then sleeps
in flush_work().  Worker, meanwhile, cannot make progress because
it sleeps on gt->reset.mutex in intel_gt_set_wedged().

INFO: task kworker/2:1:68 blocked for more than 122 seconds.
Tainted: G U W 5.15.135-lockdep-20721-gd26c0f5bff55 #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/2:1 state:D stack:26184 pid: 68 ppid: 2 flags:0x00004000
Workqueue: events intel_wedge_me
Call Trace:
<TASK>
__schedule+0xe1b/0x3bae
schedule+0xc8/0x247
schedule_preempt_disabled+0x18/0x28
__mutex_lock_common+0x99f/0x1532
mutex_lock_nested+0x20/0x2a
intel_gt_set_wedged+0xbf/0x122
process_one_work+0x8f0/0x157c
worker_thread+0x4c2/0xa4a
kthread+0x32b/0x442
ret_from_fork+0x1f/0x30
</TASK>

INFO: task kworker/2:1H:156 blocked for more than 122 seconds.
Tainted: G U W 5.15.135-lockdep-20721-gd26c0f5bff55 #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/2:1H state:D stack:27112 pid: 156 ppid: 2 flags:0x00004000
Workqueue: events_highpri heartbeat
Call Trace:
<TASK>
__schedule+0xe1b/0x3bae
schedule+0xc8/0x247
schedule_timeout+0x15e/0x215
do_wait_for_common+0x2d3/0x3f9
wait_for_completion+0x51/0x5d
__flush_work+0xd9/0x131
__cancel_work_timer+0x247/0x544
intel_guc_submission_reset_prepare+0xbf/0xb01
intel_uc_reset_prepare+0x11c/0x1e0
reset_prepare+0x35/0x20d
intel_gt_reset+0x3c3/0xa3d
intel_gt_handle_error+0xb4b/0xf24
heartbeat+0xaa7/0xce5
process_one_work+0x8f0/0x157c
worker_thread+0x4c2/0xa4a
kthread+0x32b/0x442
ret_from_fork+0x1f/0x30
</TASK>
