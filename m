Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6095F9664
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 02:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689EF10E1CE;
	Mon, 10 Oct 2022 00:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930C710E3FF
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 00:47:57 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id 129so9105804pgc.5
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Oct 2022 17:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:from:to:cc:subject:date:message-id:reply-to;
 bh=b1IdFMAsFWWE5DfX4XR7dO8m7CmzOg+cTazbFUsdzyk=;
 b=YAXXSlZVKrpp5s11IEofCgqjlOxzLKiNl6J7yBu1bJ/lJVj6EpEmSp9+FdAVhg+4Bs
 rwLmW4YQ87dKk4gTf+IrBRVMhSiPKfypEacE2Fn+gWDtFSldhSgY3W6qfQqYV/eFqBVu
 HrFL7z9S3Is8oW5T3Z7C2+2Yd9AGnfsa2pBYLdap8ozcsOXFERUpUJDXVh/0QQ9Z8RBd
 Q+vV4Hyn/ODK03LWv0FLbdgzakp1v7tHvEi1Uxhzd6mf7uq9zvkucblYqoPbU3cIa46p
 GLeaWxAKotbwG6jM6OJZ4C+aVeKSJOGE2t/M+RxogTaa2FMXK18MXRJuzi/JyaZvXK3x
 /yfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b1IdFMAsFWWE5DfX4XR7dO8m7CmzOg+cTazbFUsdzyk=;
 b=tdgtE2xuCdBB7Z+MfwY/Gi306m5JpOLco6f1l2zTnD2BBUlS2soJJADCc/aOS4qrW6
 to6ySycd4zsoiyy2LIuH+zGL/lSOYCxNWwMcLr8rJx3TFiudGvpwPpsCFlauX8ReuQHV
 BODtZlI2EGmqd5faflztynP5k/UaYlAZRS+wWKkLaPBGR/IceuVSN/aSz3oLEC8muTWq
 CZ/O1EnokOBd9VkorK22thzxLMp36LMpG/sX/HaqrY2ElC9VCrLlbayP9i8oargEESwW
 6m20oTDEit5q3OcLpzspW1yqPY3aQGbbANULvs/th8MpejSuCAb1oKWqanUSkcr0Kh8O
 BDIw==
X-Gm-Message-State: ACrzQf2Uv15UCPzdwzzZMXqPhx3RMchpQrfpDTkznDUUwv5hk4JZnQ/V
 qKoa/lMlubR1G6jDz+5E87/k3Q==
X-Google-Smtp-Source: AMsMyM6Idd60TBNk5F6K9oYeBS+wWXBfmwdsPd3JoJfR9ZOG7HWoK+tcxai8X3nWCbuJTLdbbQMUHg==
X-Received: by 2002:a63:441b:0:b0:439:103b:25a4 with SMTP id
 r27-20020a63441b000000b00439103b25a4mr14169869pga.487.1665362876908; 
 Sun, 09 Oct 2022 17:47:56 -0700 (PDT)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 y13-20020aa78f2d000000b00561e46ebf7dsm5498804pfr.216.2022.10.09.17.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 17:47:56 -0700 (PDT)
Subject: [PATCH] drm/amd/display: fix another array-bounds error in
 dc_stream_remove_writeback()
Date: Sun,  9 Oct 2022 17:47:36 -0700
Message-Id: <20221010004736.17170-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@rivosinc.com>
To: alexander.deucher@amd.com
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
Cc: amd-gfx@lists.freedesktop.org, linux@rivosinc.com, sunpeng.li@amd.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 hersenwu@amd.com, alex.hung@amd.com, aurabindo.pillai@amd.com,
 paul.hsieh@amd.com, Alvin.Lee2@amd.com, hanghong.ma@amd.com,
 Jimmy.Kizito@amd.com, christian.koenig@amd.com, Pavle.Kotarac@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Palmer Dabbelt <palmer@rivosinc.com>

Without this I get some warnings.  I get the following with GCC 11:

drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function ‘dc_stream_remove_writeback’:
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:83: warning: array subscript 1 is above array bounds of ‘struct dc_writeback_info[1]’ [-Warray-bounds]
  527 |                                 stream->writeback_info[j] = stream->writeback_info[i];
      |                                                             ~~~~~~~~~~~~~~~~~~~~~~^~~
In file included from ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:1269,
                 from ./drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29,
                 from ./drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dc_common.h:29,
                 from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:27:
./drivers/gpu/drm/amd/amdgpu/../display/dc/dc_stream.h:241:34: note: while referencing ‘writeback_info’
  241 |         struct dc_writeback_info writeback_info[MAX_DWB_PIPES];
      |                                  ^~~~~~~~~~~~~~

and something slightly different with GCC 12:

drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function 'dc_stream_remove_writeback':
rivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:83: error: array subscript [0, 0] is outside array bounds of 'struct dc_writeback_info[1]' [-Werror=array-bounds]
  527 |                                 stream->writeback_info[j] = stream->writeback_info[i];
      |                                                             ~~~~~~~~~~~~~~~~~~~~~~^~~
In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:1269,
                 from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29,
                 from drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dc_common.h:29,
                 from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:27:
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_stream.h:241:34: note: while referencing 'writeback_info'
  241 |         struct dc_writeback_info writeback_info[MAX_DWB_PIPES];
      |                                  ^~~~~~~~~~~~~~

This fixes both warnings for me.

I'm not sure how sane it is, as MAX_DWB_PIPES is 1 so the loop now
doesn't do anything: i and j are both 0, so they're always equal, so no
trimming is ever done.  IIUC that was the case before, though, as the
only way this could trigger would result in an out of bounds array
access.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index ae13887756bf..b64cef17afba 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -520,7 +520,7 @@ bool dc_stream_remove_writeback(struct dc *dc,
 	}
 
 	/* remove writeback info for disabled writeback pipes from stream */
-	for (i = 0, j = 0; i < stream->num_wb_info && j < MAX_DWB_PIPES; i++) {
+	for (i = 0, j = 0; i < stream->num_wb_info && i < MAX_DWB_PIPES && j < MAX_DWB_PIPES; i++) {
 		if (stream->writeback_info[i].wb_enabled) {
 			if (i != j)
 				/* trim the array */
-- 
2.34.1

