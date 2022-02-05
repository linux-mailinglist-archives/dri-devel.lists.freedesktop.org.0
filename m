Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F694AA990
	for <lists+dri-devel@lfdr.de>; Sat,  5 Feb 2022 16:00:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387AB10F572;
	Sat,  5 Feb 2022 15:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747E610F56E
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Feb 2022 15:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644073222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=713HQL5x//o/KghlUsgMrDORBx+gP5N718ebtgS9CfI=;
 b=QUwCn2vDJxHTuHCYF3EfeHSmJy0/7goqkTxCwr8FKiCTkulJikmN6S2Za12hewRdwVO/n/
 +fbMWc5ixYLfvl7nNaMfidbREigGIMEZkUzUencuwjdyBxZl/XaWMZfFneEHFZpdmoryGj
 3crbNmdSi8kbWLNeziUw3WxRzxzdZQ4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-FneUOLgiMQOtj52AAKKQlA-1; Sat, 05 Feb 2022 10:00:19 -0500
X-MC-Unique: FneUOLgiMQOtj52AAKKQlA-1
Received: by mail-qt1-f197.google.com with SMTP id
 e14-20020ac84b4e000000b002cfbbdf8206so7209680qts.10
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Feb 2022 07:00:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=713HQL5x//o/KghlUsgMrDORBx+gP5N718ebtgS9CfI=;
 b=kuPWPphcbXq37+33C4+ln8auG4l4ayJi1a9oUcKK5tEZ6uEQ75VYI9WNlF5iCSTk22
 C9/BmPPmKQcqS+rr4Ad6HXIjOWVC5Ls7mnVnnNilqBZPrjnJ38C56MMaKRld/5mgYYme
 92SpTRUTrNlBgxotF3V7YVwsBWBi0AJCEZ+cZUwJACycdE1OWE+QgVnmieE8qOGD8Hx0
 jsLesjgdLcUBQfkMVQD4i1o/E35Wgbwev1+yeo8trtu/3vcC+Sbq04lgdD0ebpl3So6v
 0wNKM18D1HkYF5Lpty6e2cL/wv0gdiB3gmJJlkmwgFtR8yIARlp39LlRJxMUxB+dHYxS
 LCdw==
X-Gm-Message-State: AOAM531nRkqp7twoBaNSfAkoCqJYzjQq/FdrXKuxNGKfessKH1hz3zul
 WJx6z30oGvtAmbRlW4WqkLf4yOunQIXcJg9gw5vvT2H7RKAJNzQUkmrxZoluq7KwB7ovhHHElpJ
 HbB2avQ6z+lzZ0Mi01OtbNJnF914V
X-Received: by 2002:a05:620a:371d:: with SMTP id
 de29mr2218860qkb.300.1644073219099; 
 Sat, 05 Feb 2022 07:00:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQMqxJhjsehYnlrGdRYlEx/4uzDQf3AvY1i5RUhxDDhxx+wOwMtIaQmWd3GyZr4OF2gUxNaQ==
X-Received: by 2002:a05:620a:371d:: with SMTP id
 de29mr2218834qkb.300.1644073218865; 
 Sat, 05 Feb 2022 07:00:18 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113])
 by smtp.gmail.com with ESMTPSA id d22sm2657159qkn.112.2022.02.05.07.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 07:00:17 -0800 (PST)
From: trix@redhat.com
To: evan.quan@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch, nathan@kernel.org,
 ndesaulniers@google.com, lijo.lazar@amd.com, darren.powell@amd.com,
 guchun.chen@amd.com, andrey.grodzovsky@amd.com
Subject: [PATCH] drm/amd/pm: fix error handling
Date: Sat,  5 Feb 2022 07:00:08 -0800
Message-Id: <20220205150008.1968218-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

clang static analysis reports this error
amdgpu_smu.c:2289:9: warning: Called function pointer
  is null (null dereference)
        return smu->ppt_funcs->emit_clk_levels(
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

There is a logic error in the earlier check of
emit_clk_levels.  The error value is set to
the ret variable but ret is never used.  Return
directly and remove the unneeded ret variable.

Fixes: 5d64f9bbb628 ("amdgpu/pm: Implement new API function "emit" that accepts buffer base and write offset")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index af368aa1fd0ae..5f3b3745a9b7a 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -2274,7 +2274,6 @@ static int smu_emit_ppclk_levels(void *handle, enum pp_clock_type type, char *bu
 {
 	struct smu_context *smu = handle;
 	enum smu_clk_type clk_type;
-	int ret = 0;
 
 	clk_type = smu_convert_to_smuclk(type);
 	if (clk_type == SMU_CLK_COUNT)
@@ -2284,7 +2283,7 @@ static int smu_emit_ppclk_levels(void *handle, enum pp_clock_type type, char *bu
 		return -EOPNOTSUPP;
 
 	if (!smu->ppt_funcs->emit_clk_levels)
-		ret = -ENOENT;
+		return -ENOENT;
 
 	return smu->ppt_funcs->emit_clk_levels(smu, clk_type, buf, offset);
 
-- 
2.26.3

