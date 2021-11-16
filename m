Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16205452B6B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 08:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19326E910;
	Tue, 16 Nov 2021 07:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Tue, 16 Nov 2021 07:15:33 UTC
Received: from mx-lax3-2.ucr.edu (mx-lax3-2.ucr.edu [169.235.156.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C0B6E910
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 07:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1637046933; x=1668582933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VO2ps4lqNewVdq22Zvj/a2S0OmORg6rzuJt+A60klUs=;
 b=q0Aa2HlnxLQ7JzHW7Bb1D7mKP5Fo/rt2aXU+VaoZgiqPFj/kzYeQSROk
 lmeg5b+Fu4XQ7F/tJI2XLEuoOh3+bUoo47Pfg5yPsK7RT2OuougvuIZjW
 j8805uiiS5snEV8cFLTCh68c1Nr+da9d3reJumUpKpMNvHqMr+G3gkK/5
 +o5mpeNJQaDmNAP2H3QFsJ23NjccPTkzkcyM8vH7GUoE5nh/8N9W20hm6
 SwOADv6VP9KMp9auRgrFbxceEp9w8FyFfAGjuApwWWUScuHS2iKOVXjOS
 2xPAUnqdQr79JohiPkD+jnkR168UTsHb6MOImc68i2L7jp9uxZ4p+HLHs g==;
IronPort-SDR: bCsfJEJUV7T5sjG51d7i2sR4GPlVlapTQyZWTXWtHTm2791nJplBBOPNBW9JBa+X6ew/h/Jfr6
 0VITHYuuKYw/uyOIkdpLaZBb+1eILtvmCL4MPtuODqPeYE+buPpaXAXuegODxaR0yWpm4S5ve8
 9KreVN0DpgwV4xflg0I+XPRbbUX6oQ2fyzfFMD52kTvbetOT6Dxaqkp6zOxgWVpDcGyUL75iwH
 6tbD3Gs/gZg5oZ+/yqKd1uGzcgoGsrGMFH3YiP3WRJ78SJQA+7QNJcQStu1aFpckyHrilK9INj
 WhtJibPeB6wPliStGkmygOXX
X-IronPort-AV: E=Sophos;i="5.87,238,1631602800"; d="scan'208";a="83215739"
Received: from mail-qk1-f197.google.com ([209.85.222.197])
 by smtp-lax3-2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Nov 2021 23:08:26 -0800
Received: by mail-qk1-f197.google.com with SMTP id
 de12-20020a05620a370c00b00467697ab8a7so12993367qkb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 23:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucr.edu; s=rmail;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o3HI54mJH/tMRV5CdW0GGK2Uj3sS8rXd01TKP0agSfQ=;
 b=GTwP4sC0lF0Nu4knrINh27vw5wfFRisKOITj8cPSjtfYQq9hjSO2crPj3dJH52NAxD
 Xsk5ANQ7ZKFYCveEzMIh7H+vrcaWGRxnLLueKLPqdXLSgAN66gYOwmPW+LSjmlDv5ehZ
 hv3TXuUyxOaqP1EhLfwrnsl6VhgzuNAC73d7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o3HI54mJH/tMRV5CdW0GGK2Uj3sS8rXd01TKP0agSfQ=;
 b=XptmSFYmH1pgxBfUbnY3IaaTWknwvJYEEcl+deX20Km48W0UDhjcWtSEVeBfKSyBLD
 bSxX3fwfypKF4dq/UVQS/Al3S9GFUoX7jqH+6fEU5TGmuz44MVov16V9AAgOE0qYr7kw
 CM/2hkdZ17oBgK4PrBSYLHRHrMAF6nMNE3hwUdv0HEC6goUKiQiCv/yPihNZ6bilDCuL
 CgDAjimbpxWXVzKF0pxViiSB3NPmpcqCwNB5A+E5xmJH2Lv1ymUQoWkLQe8kDEKGmKhR
 FEqqFZrtT9lPiqvmM7PZD3Cvh8wOfS6yzAXOTWu55/orCLiK3mNdBqaxUVp3pzFxgXEH
 tJiw==
X-Gm-Message-State: AOAM53013e8IFDg6Mh7kjRDcV1jX2FIPCkr3Q64rW5Mt5ipRJr7+jiTX
 vZKbNO3Zme1zq8j5x2ADURZPuX6WUeNNEZoWsyOB+dYaiY3VX+8OOuNM+EGFvxAPXkOXRL322vV
 K8c3f6/PsVbsZMK3FRhBnZf0N2k+zow==
X-Received: by 2002:a37:b5c4:: with SMTP id e187mr4262985qkf.27.1637046505214; 
 Mon, 15 Nov 2021 23:08:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzb3aSuqiN7aOqI9nXkfty0FhMxgFyD4ABCEt+11IBb/1fmKrOrRX6A5Su3hDTXUShP/OaowA==
X-Received: by 2002:a37:b5c4:: with SMTP id e187mr4262967qkf.27.1637046505050; 
 Mon, 15 Nov 2021 23:08:25 -0800 (PST)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
 by smtp.googlemail.com with ESMTPSA id w10sm7205942qtj.37.2021.11.15.23.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 23:08:24 -0800 (PST)
From: Yizhuo Zhai <yzhai003@ucr.edu>
To: 
Subject: [PATCH] In function nvkm_ioctl_map(),
 the variable "type" could be uninitialized if "nvkm_object_map()"
 returns error code, however,
 it does not check the return value and directly use the "type" in the if
 statement, which is potentially unsafe.
Date: Mon, 15 Nov 2021 23:07:05 -0800
Message-Id: <20211116070708.429432-2-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116070708.429432-1-yzhai003@ucr.edu>
References: <20211116070708.429432-1-yzhai003@ucr.edu>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yizhuo Zhai <yzhai003@ucr.edu>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes:01326050391ce("drm/nouveau/core/object: allow arguments to
be passed to map function")
Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
---
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
index 735cb6816f10..4264d9d79783 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
@@ -266,6 +266,8 @@ nvkm_ioctl_map(struct nvkm_client *client,
 		ret = nvkm_object_map(object, data, size, &type,
 				      &args->v0.handle,
 				      &args->v0.length);
+		if (ret)
+			return ret;
 		if (type == NVKM_OBJECT_MAP_IO)
 			args->v0.type = NVIF_IOCTL_MAP_V0_IO;
 		else
-- 
2.25.1

