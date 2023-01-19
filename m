Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CC7674F16
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 09:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB16510EA7F;
	Fri, 20 Jan 2023 08:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CFB10E099;
 Thu, 19 Jan 2023 22:54:06 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id 18so4739488edw.7;
 Thu, 19 Jan 2023 14:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=khL1Nx5/0J4PkaYH2tde4UnbrwukvlMmrAWH0vjr2bI=;
 b=Ac2OX+39mFVECn4hmmfAWS6rVP1xBX7Wn30/vwGx8/3ZfjypN7OQgYqrpKb07D8Jlx
 j77BkYexw/gJ1baOWzJ0FtaD5JHwFDfB1FuciuirfpHEBa1UPw7h2lKdabbcKpenEhzc
 9psvBAIsSdBOmYKdPZrBkCZy/eP7Ucr/axblCgKlPqt2qnLpfGXeAnZBe2QtTTIygv+e
 E+LDkFrXqBcIqcFz7xbc+f/ax6knJTfluBa7GV7QkMJTeGEXxRWXNaKcoovlCGBVK99J
 14SdtIXYuok20iBvWMOtCrz+/fTV1A1UCFtWmA2HakOb+K6bWmVAIfHTElFx2k+dOqMI
 Yuqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=khL1Nx5/0J4PkaYH2tde4UnbrwukvlMmrAWH0vjr2bI=;
 b=GNpRH7XbM17+X87LYGYuxaZDN+JQdYjsAlHoSr2msO4RzSiduBUo4rplAEYdchrLNl
 Sqe9e8wPqeylMhp7ca0Y9+JY8IQIE8OS5QJo32C2Vqgac/vayvIHQ87rO8bdMVa0GwAn
 S99jdJeK10VSYfxgQlr1aucjHfnpjOi4ReOFKfnUIGX5ZM1CWY6Bhpg4PWebsFQCpa3c
 LIFvYL9VDEEXUxmQ7XuDLmpOMVkmy7Wpa4nPNIF9KRnHyEFERTR29wbPob3Hy+tXnpUn
 qMs5uW8TZG3F77c1ZO44TcMcuoDSblVuGsA42g04XOIgc45awSQcdx4W91adOqAZ2dTw
 E5Yg==
X-Gm-Message-State: AFqh2kpRDOEVMNygkPzTehtzemwuJiDnxmBAku/fHhTSBU3AqOj8kH7E
 /xZsV7GkaYOfGuKZJnIYG/4=
X-Google-Smtp-Source: AMrXdXsUCyTMzdubcmLV/sZTktU8cjOIaxH0ioMYdQNFrdyqzBYrF/7iQaq0jIBMed1wxB8P61zQzA==
X-Received: by 2002:a05:6402:289b:b0:49e:8410:ff1f with SMTP id
 eg27-20020a056402289b00b0049e8410ff1fmr1881349edb.28.1674168844603; 
 Thu, 19 Jan 2023 14:54:04 -0800 (PST)
Received: from Tanmay.. (ip5f5ad407.dynamic.kabel-deutschland.de.
 [95.90.212.7]) by smtp.gmail.com with ESMTPSA id
 d14-20020a170906304e00b0077077c62cadsm16916985ejd.31.2023.01.19.14.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 14:54:04 -0800 (PST)
From: Tanmay Bhushan <007047221b@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau: Fix bug in buffer relocs for Nouveau
Date: Thu, 19 Jan 2023 23:53:51 +0100
Message-Id: <20230119225351.71657-1-007047221b@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 Jan 2023 08:07:34 +0000
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
Cc: Tanmay Bhushan <007047221b@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dma_resv_wait_timeout returns greater than zero on success
as opposed to ttm_bo_wait_ctx. As a result of that relocs
will fail and give failure even when it was a success.

Signed-off-by: Tanmay Bhushan <007047221b@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index f77e44958037..0e3690459144 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -706,9 +706,8 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
 		ret = dma_resv_wait_timeout(nvbo->bo.base.resv,
 					    DMA_RESV_USAGE_BOOKKEEP,
 					    false, 15 * HZ);
-		if (ret == 0)
+		if (ret <= 0) {
 			ret = -EBUSY;
-		if (ret) {
 			NV_PRINTK(err, cli, "reloc wait_idle failed: %ld\n",
 				  ret);
 			break;
-- 
2.34.1

