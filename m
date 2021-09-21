Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D38AB413091
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 11:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA966E91D;
	Tue, 21 Sep 2021 09:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781C86E91A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 09:07:47 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id w19so18782362pfn.12
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 02:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E4v4DpkeZTnlF0pBjlNWbK8zIyz24Pq1Ia9cRa2Os50=;
 b=Pzip2O5oYFjO9oukYlxgQroPIzZWclkpEr1zLg0nHrIo23mKuo80lQBmDpwWGjaax1
 wy/K24riXfbJTaw3pWSoLCharB6JkB/czLpbF7Sa/QsP2S0JtKrlI2ljiYH5u40Ohtb7
 bkv1BMEg4ITilNL9Ifw3fUAvMYA1fIOnVQ160nbnT0kbk/ER1pI1/0ooGpkdmZ1bOp5x
 FUjgNzmPR3OgDauZOvc9cebxhh0cNU6kT9rJ+IzlJnOwnWGF6q9SE4v4bfxkybV/DuLP
 xeRhT3qRx9S8R4vozhGOfnYTaXG++0Ky8N4nfafdM9diQizUWKm4Mw8Qfzmd2WdV0+f7
 /+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E4v4DpkeZTnlF0pBjlNWbK8zIyz24Pq1Ia9cRa2Os50=;
 b=MBCPp8Mvpl4MQKP/oHDTB18y8WTg9q482b1yrB73lNuJWgF6qAOvaPrlideYebqQLg
 4YAP9gKZABmfAh8n6f7Ahf1ZAsAGn6VelC93QamJSNi/tQIcO0zU5pu6+Kv69rQ5PCgD
 IOAx79lB0Oz680WIlJInAmrgBfWVxQxcJYFrvt1VIkP3/wRoKakl99/X6cT35g9SPLSj
 xWeO1BNQcXU8KwmaiR14l4E4Z/IKx/NkaLg8sz7Kj4RRNxF9t6q13qzEgxNgq3gFLU7o
 SnEGSda0SDSFAFi3cIfPdfGWlje7l04Td0IQjjDTLqHVKh0PI/XuokNBpd/QYaL/VpwS
 0C4w==
X-Gm-Message-State: AOAM533GSbuGHDkVa338NCFc8Btkebcn75aaiIjQASNb6wPqk96tgjX0
 uFYWATnT8qsc0jmJ/vXysxS/P/OzC+0=
X-Google-Smtp-Source: ABdhPJyaHShc3w4+2GgCfNzhm/w914HQvcTRSXUChpavvKGS7Y/WOSbIhF6v4y3xk/gofDUeXbRYug==
X-Received: by 2002:a62:1d4d:0:b0:443:eac2:8a1b with SMTP id
 d74-20020a621d4d000000b00443eac28a1bmr25023696pfd.2.1632215266687; 
 Tue, 21 Sep 2021 02:07:46 -0700 (PDT)
Received: from localhost.localdomain (52.55.96.58.static.exetel.com.au.
 [58.96.55.52])
 by smtp.gmail.com with ESMTPSA id p9sm18965586pgn.36.2021.09.21.02.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 02:07:46 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>,
	Karol Herbst <kherbst@redhat.com>
Subject: [PATCH] drm/nouveau/fifo/ga102: initialise chid on return from
 channel creation
Date: Tue, 21 Sep 2021 19:07:35 +1000
Message-Id: <20210921090735.247236-1-skeggsb@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

Turns out caller isn't zero-initialised after-all.

Fixes: 6b457230bfa1 ("drm/nouveau/ga102-: support ttm buffer moves via copy engine")
Reported-by: Karol Herbst <kherbst@redhat.com>
Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
index f897bef13acf..c630dbd2911a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
@@ -179,6 +179,9 @@ ga102_chan_new(struct nvkm_device *device,
 		return -ENODEV;
 
 	chan->ctrl.chan = nvkm_rd32(device, chan->ctrl.runl + 0x004) & 0xfffffff0;
+
+	args->chid = 0;
+	args->inst = 0;
 	args->token = nvkm_rd32(device, chan->ctrl.runl + 0x008) & 0xffff0000;
 
 	ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, 0x1000, 0x1000, true, &chan->mthd);
-- 
2.31.1

