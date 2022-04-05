Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B904F5727
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 10:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E1810E4D4;
	Wed,  6 Apr 2022 08:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4D310E703;
 Tue,  5 Apr 2022 18:31:10 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id t25so24776328lfg.7;
 Tue, 05 Apr 2022 11:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yax7P8EHkvsWnyvnaOpe3ZP8r2G7HKN+i3pXtBsfClM=;
 b=AlOylQ0jQKVcFM1G55vgGfIw3N7jIKcPb8Fyyp/oULoQtqlhNXFckkFd9+WqoIycaG
 j3uSXFSnN9MUKlSNkyQuzzYQaqjV8XGOAV98W2dX0/cu0rYAgesS6ZgugsjdK/H/2jkk
 fnbt8Gy5iVlTh1oKRiKygkFT2D7usXujbRj9wtNhFNlx0xb1yHFF5nZCSug2Yffskd6k
 SQbOTL8qdWillxUg7Hfyk1Z4yt900US5/buZ6HSUAnvFJUJzW3ZTTDpX+yeyxCzbWSFK
 f/y1ax+r51kD23D/27l7CsWDA8dkGaWmjrSo4eFHKK9DHWERyMZIp7K7VdiMTWXaCd66
 t7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yax7P8EHkvsWnyvnaOpe3ZP8r2G7HKN+i3pXtBsfClM=;
 b=Oh/hlCfOaSPHUUhA881NvKhFN864Vt6SCRwwTSBxbT/rQ0jdWNKbXS5nN4scMpmzNT
 QXVuhKkMmMHeQc5XOgfHLjmMvN7iSNFdRcqq0NDXkQOCkT/WSVJAVJbKaEyKPXC0hYFW
 P9cwmxepsTLR+U5vpTnBrqfvAxGj1udb/cLcyDeCK9oHvfSqruLSbt4QWhdOfW9q876J
 xXuW7iOkDrkLyqGGGUO9xRsSbWl7NDs1gVK+GNXL4zfmvMHv6gbCGSMEIMMxUccWTKrs
 c0lFAom+efHl6JJPHOS8M0UaTq5QDeoKN/jwfITjnAYN5h4ncgZu3fr2m3fscXe7sANd
 U3Zw==
X-Gm-Message-State: AOAM5331B01EVX4Llkq7KDpyRWKXOihTOcmS5qHZEiyC/ANaZWg+c6zv
 ZaKuUtjaJlB5PidNvCBoVbI=
X-Google-Smtp-Source: ABdhPJyytKONlFFPhM6uOSKsPqQ+53tg6aHeIXEVboaJV0vQ5E/W25OXeJQjKEHyzo/lHMBfI33Qlw==
X-Received: by 2002:a05:6512:2347:b0:44a:6e3f:74f7 with SMTP id
 p7-20020a056512234700b0044a6e3f74f7mr3457813lfu.660.1649183468960; 
 Tue, 05 Apr 2022 11:31:08 -0700 (PDT)
Received: from noname.. ([2a02:2698:8c2a:226e:6d9:f5ff:fecb:a8ab])
 by smtp.googlemail.com with ESMTPSA id
 c5-20020a2e9d85000000b0024b1571209csm800133ljj.0.2022.04.05.11.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 11:31:08 -0700 (PDT)
From: Grigory Vasilyev <h0tc0d3@gmail.com>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH] drm/amdgpu: Accessing to a null pointer
Date: Tue,  5 Apr 2022 21:30:19 +0300
Message-Id: <20220405183020.9422-1-h0tc0d3@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 06 Apr 2022 08:00:38 +0000
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
Cc: Jani Nikula <jani.nikula@intel.com>, Jiawei Gu <Jiawei.Gu@amd.com>,
 Grigory Vasilyev <h0tc0d3@gmail.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A typo in the code. It was assumed that it was
possible to shift the pointer to sizeof(BIOS_ATOM_PREFIX) - 1.

Signed-off-by: Grigory Vasilyev <h0tc0d3@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/atom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
index e729973af3c9..be9d61bcb8ae 100644
--- a/drivers/gpu/drm/amd/amdgpu/atom.c
+++ b/drivers/gpu/drm/amd/amdgpu/atom.c
@@ -1426,7 +1426,7 @@ static void atom_get_vbios_pn(struct atom_context *ctx)
 
 	if (*vbios_str == 0) {
 		vbios_str = atom_find_str_in_rom(ctx, BIOS_ATOM_PREFIX, 3, 1024, 64);
-		if (vbios_str == NULL)
+		if (vbios_str != NULL)
 			vbios_str += sizeof(BIOS_ATOM_PREFIX) - 1;
 	}
 	if (vbios_str != NULL && *vbios_str == 0)
-- 
2.35.1

