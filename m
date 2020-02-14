Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6CF15D364
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 09:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B45E6E526;
	Fri, 14 Feb 2020 08:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F4E6E441;
 Fri, 14 Feb 2020 06:30:37 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id b18so8455643oie.2;
 Thu, 13 Feb 2020 22:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ntwhmb838HNdG68VgBkMbYUyn9XVt7puNK0dtc2mxiU=;
 b=Bl2+RkZv0uKfnpwqzGIIxsKeThJkZXZ76VITQy9giZ6bgEBu0UV9/krz+5ZD7iRrHd
 /CoK51Nxbh2tquNgg0zTxh2q1hdt3NNU7A/fxgt8EcnYN3MPsTw1HLaPjRxZ7NC16/FH
 IDjt5ByQBiqH3d3tI9HIvlQHf2iQNmUwvG0Wk8JOFBczVwsx7iM6LVAmrWDQH8YZFhTG
 y5I6hGBQwm4WwgQzD6yX85fJO/Es1hEEyQerjlTe40XRO8x4FCsh7VrcBiV9ktIloURp
 MBv8JOvEoD2D+GMtAhl2GSfaWZlJEmc/+Hz1W1zXy6xkyYs/nzU+bRMp6yT/aoN2Luxz
 QWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ntwhmb838HNdG68VgBkMbYUyn9XVt7puNK0dtc2mxiU=;
 b=CgMy7m1nAHMvUuWQHdR5aQvr5b3fMKkbMMc/WnOurXTEb5COIEtfXShsOBXYnm4zxz
 Z47xWha+liazBbK9Bo7WQeaXrZcWZyE9jQ1boLhDjAI6V4T+G9tM0QG31SyK5D6svuiB
 slNLuJ3JgwJeAJ4ndeojPcU3ck4gaIZl5uG7pEWA4l4ZwcNQMDGpiOKATUljqmTvssA8
 6rjstXX/9ve19cHb5hP/sad2jqjfI4q98AHBgJrFphoy3OV1vEsSR1P/Ia1/QZeA+ewq
 Sprdr+NkHP0jvLNF9sx5A5S2+Od+2NT3Tz9hJsOky5LpVreaqoXMJCoEPqXwDA45igKE
 8LfA==
X-Gm-Message-State: APjAAAW6YZfvhRuOz7SpJWcms9sCND2W7Uac0v/WsiXzhdwaWOAxQ4TY
 jLy5/AvBquJRVxG0+SCwQG8=
X-Google-Smtp-Source: APXvYqxxXnIoySUdm4W+GhJ2vz7rNqEhAKOFi0tphwN1shGVUp6HVae+n1bLo3B19UkUchCoRll9/g==
X-Received: by 2002:aca:6542:: with SMTP id j2mr873096oiw.69.1581661836582;
 Thu, 13 Feb 2020 22:30:36 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id c123sm1483599oib.34.2020.02.13.22.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 22:30:36 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>
Subject: [PATCH] drm/amd/display: Don't take the address of
 skip_scdc_overwrite in dc_link_detect_helper
Date: Thu, 13 Feb 2020 23:29:51 -0700
Message-Id: <20200214062950.14151-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Fri, 14 Feb 2020 08:07:58 +0000
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
Cc: clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clang warns:

../drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:980:36:
warning: address of 'sink->edid_caps.panel_patch.skip_scdc_overwrite'
will always evaluate to 'true' [-Wpointer-bool-conversion]
                if (&sink->edid_caps.panel_patch.skip_scdc_overwrite)
                ~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
1 warning generated.

This is probably not what was intended so remove the address of
operator, which matches how skip_scdc_overwrite is handled in the rest
of the driver.

While we're here, drop an extra newline after this if block.

Fixes: a760fc1bff03 ("drm/amd/display: add monitor patch to disable SCDC read/write")
Link: https://github.com/ClangBuiltLinux/linux/issues/879
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

As an aside, I don't see skip_scdc_overwrite assigned a value anywhere,
is this working as intended?

 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index 24d99849be5e..a3bfa05c545e 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -977,10 +977,9 @@ static bool dc_link_detect_helper(struct dc_link *link,
 		if ((prev_sink != NULL) && ((edid_status == EDID_THE_SAME) || (edid_status == EDID_OK)))
 			same_edid = is_same_edid(&prev_sink->dc_edid, &sink->dc_edid);
 
-		if (&sink->edid_caps.panel_patch.skip_scdc_overwrite)
+		if (sink->edid_caps.panel_patch.skip_scdc_overwrite)
 			link->ctx->dc->debug.hdmi20_disable = true;
 
-
 		if (link->connector_signal == SIGNAL_TYPE_DISPLAY_PORT &&
 			sink_caps.transaction_type == DDC_TRANSACTION_TYPE_I2C_OVER_AUX) {
 			/*
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
