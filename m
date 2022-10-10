Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A314C5F9812
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 08:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236E210E455;
	Mon, 10 Oct 2022 06:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2390610E042;
 Mon, 10 Oct 2022 06:05:24 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id q1so1176541pgl.11;
 Sun, 09 Oct 2022 23:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=nm7YKL49tk7wRZ/a00qBsDIN6e5MXIummpQ4woA5c14=;
 b=aQKkENST6CPEq0eO3HKe4qKzPkPrnjeUPOrb5SdGU2Ra0Gvhw4P3PWtN5kaLi8/TqI
 L8+PLC5sVLeEJwdGUwQvvYZHN+rzSdvK8Vjg22Kmn2Xrur8aE9yia3RWe3+y8O/4d/Z+
 rGaUijoc659F133JvbySVKEufaxvBy2rEbQoSwq6IRxPRW0D/cr9s5ZraJ1m2F695Bye
 Cphlv/J5fGJY+jpfT/DoVJeZ0jEg1EkRccyf1PVnqhsUxvmxpjoVjaW4mKftnN452UIv
 gVZcQmUVBffXXlZOX96tF23slqg+TSF3StTblLue5arE0WPYfAFy35sJDgwUx+xRNhoR
 ZXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nm7YKL49tk7wRZ/a00qBsDIN6e5MXIummpQ4woA5c14=;
 b=A4S9K6EwRlnWTuYV/3Pjble5BVhwV2dkm0nF+SEBOxoNZ9K6Q/8UUNoB3Y0k0+cRkR
 /yPAbEUFFRcyxF+v+QoMZ0iFcAYkUqrAM46xPqlgULKuWO4h6MD0zQOy7r4+sVzAB9P9
 hovnmMkEKLkztsKwhwXL1oqprlpkRnW+iDnmSe17+qACig87CWAjYJYTtVFxb3DN2yNf
 ixWtRQctw+JLFSyDMTnwHrp97LueZn0RbnZNTAcwBChlceion+o3sZgxQzljz0WuiUzO
 bsQHOcGiK/+3u1EKTqMDUMjy6EbqoEQedct1aXf96TlV2ROVnQPNoXvf+U0n4Mv2+Sz/
 NrJw==
X-Gm-Message-State: ACrzQf1Jh79EKzg/99WFbI1ZNo52UE58ifP9ST618FLLHcaIACGnGLKr
 qYM8PvrYane7fd8MhB3UNzga4V9MEC0QLQ==
X-Google-Smtp-Source: AMsMyM5eqpRu3hcShDlRN0xT43nRbWeP6tnG5AhlUAtINev9Y4zNBPEifY6RuMia1cixXaChZEvSnQ==
X-Received: by 2002:a05:6a00:10cf:b0:563:34ce:4138 with SMTP id
 d15-20020a056a0010cf00b0056334ce4138mr6542532pfu.6.1665381923244; 
 Sun, 09 Oct 2022 23:05:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 a5-20020a63e405000000b00462ae17a1c4sm803759pgi.33.2022.10.09.23.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 23:05:22 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: fix array-bounds error in
 dc_stream_remove_writeback() [take 2]
Date: Sun,  9 Oct 2022 23:05:12 -0700
Message-Id: <20221010060512.3064524-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.36.2
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
Cc: regressions@lists.linux.dev, Leo Li <sunpeng.li@amd.com>,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 5d8c3e836fc2 ("drm/amd/display: fix array-bounds error in
dc_stream_remove_writeback()") tried to fix an array bounds error seen
with gcc 12.0. Unfortunately, that results in another array bounds error,
seen with older versions of gcc.

Building csky:allmodconfig ... failed
--------------
Error log:
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:
	In function 'dc_stream_remove_writeback':
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:83:
	error: array subscript 1 is above array bounds of 'struct dc_writeback_info[1]' [-Werror=array-bounds]
  527 |                                 stream->writeback_info[j] = stream->writeback_info[i];
      |                                                             ~~~~~~~~~~~~~~~~~~~~~~^~~
In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:1269,
                 from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29,
                 from drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dc_common.h:29,
                 from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:27:
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_stream.h:241:34: note: while referencing 'writeback_info'
  241 |         struct dc_writeback_info writeback_info[MAX_DWB_PIPES];

We could check both i and j for overflow to fix the problem. That would,
however, be not make much sense since it is known and provable that j <= i.
Also, the check introduced with commit 5d8c3e836fc2 does not really add
value since it checks if j < MAX_DWB_PIPES. Since it is known that j <= i,
it would make more sense to check if i < MAX_DWB_PIPES. Unfortunately, that
does not help to solve the problem observed here: gcc still complains.

To solve the problem, replace the subsequent check for 'i != j' with
'j < i'. This is identical to the original check since we know that j <= i,
and it makes all versions of gcc happy. Drop the check introduced with
commit 5d8c3e836fc2 since it is not really useful and does not solve the
problem.

Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
Fixes: 5d8c3e836fc2 ("drm/amd/display: fix array-bounds error in dc_stream_remove_writeback()")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index ae13887756bf..9f568d618cd0 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -520,9 +520,9 @@ bool dc_stream_remove_writeback(struct dc *dc,
 	}
 
 	/* remove writeback info for disabled writeback pipes from stream */
-	for (i = 0, j = 0; i < stream->num_wb_info && j < MAX_DWB_PIPES; i++) {
+	for (i = 0, j = 0; i < stream->num_wb_info; i++) {
 		if (stream->writeback_info[i].wb_enabled) {
-			if (i != j)
+			if (j < i)
 				/* trim the array */
 				stream->writeback_info[j] = stream->writeback_info[i];
 			j++;
-- 
2.36.2

