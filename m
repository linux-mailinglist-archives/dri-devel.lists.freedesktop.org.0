Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 378C09C51FD
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 10:29:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197A510E5A0;
	Tue, 12 Nov 2024 09:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AwWZ0dHW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE9FA10E5A0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 09:29:05 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a9ec86a67feso937153566b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 01:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731403744; x=1732008544; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=upVCqRU5o9VJXCHj9o5z/en4Y7HobD9kfp6MRO5BLes=;
 b=AwWZ0dHW5IOfcgaCd7GVeGoGw+Mcdfhe9hg0O5gz+i54HoxWu/ueLyRunlpv/i2yhU
 WGjFVBA7wP7vFotUWV0P+jep63jHkAmCUBClYkWKv5Z43ewHIgTLxo5TB9lZV7u6O84m
 d+MohFdPm0fEUlUBaoCuPbnMj1g5F2xPFK9KfgAvzD0ECjmpH0tZog5Txrm0TVgyGwk2
 r083Pzl67PLThNz4cR4vtdIbg5NyNJ/Ce9RvikFaw4jvgluAtvzFrVL2NfaSOT2oIUFo
 cIKrKHDbtYn0qjGSNXeTRFPRW2Daw3sscI1X0Cu6DL5NsBtNoqq3jHWN/ngr3FmHj38i
 o7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731403744; x=1732008544;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=upVCqRU5o9VJXCHj9o5z/en4Y7HobD9kfp6MRO5BLes=;
 b=LkI+81YKfQuW/iWHO1OT0/BUkCSU4Lngi1iC8iSJzFOx0T9DUan/C5wJU54tmdviaJ
 9DOYAaNnjtKxju0ARLXHG3YyeKU/Ocgl+ZckvmrrfC0ZojYoxmYjwpLqat/eOUgju8zk
 JleoeAmw210T0njgZSgdjXMJDgfah01vc9pPlNw/v3HdPvu79BmRoE7ZHpQBtXVeQ7XY
 9Vbhs6cRTOnQRYs9ONGOJcDkBCPSZExq5y945NDMlXio684bomvuzJPILB8tfeD/M2hx
 QSs9Ps7o5v9i9BdcwK8benpjiiCrgLdQNyhcXrM3vTVHhyjmOBwO62asQacYegrmlaH8
 jObA==
X-Gm-Message-State: AOJu0YwieBLkARx9A/noDtnP9xrCNnuJvP92AHOgVv8RBamdX34xt6PB
 gtu43LgDpkC+eWBD7UdiR4NAVYP5axj/tAMZfGZxcdcEdsAMIrYp4dF4jqx78dKr+QVnz4WhX91
 N
X-Google-Smtp-Source: AGHT+IGxwNn2QLEYLJ5/mxammi4su9l/ZXKYkLron+OnhMVz+hw5afB6jPFE4I5g19PmmwZVKpoEdw==
X-Received: by 2002:a17:907:3f97:b0:a9a:5b4:b19e with SMTP id
 a640c23a62f3a-a9eeff44646mr1549568066b.32.1731403744042; 
 Tue, 12 Nov 2024 01:29:04 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a48b1fsm693743066b.58.2024.11.12.01.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 01:29:03 -0800 (PST)
Date: Tue, 12 Nov 2024 12:29:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [bug report] drm/mediatek: Implement OF graphs support for display
 paths
Message-ID: <633f3c6d-d09f-447c-95f1-dfb4114c50e6@stanley.mountain>
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

Hello AngeloGioacchino Del Regno,

Commit 4c932840db1d ("drm/mediatek: Implement OF graphs support for
display paths") from Oct 17, 2024 (linux-next), leads to the
following Smatch static checker warning:

	drivers/gpu/drm/mediatek/mtk_drm_drv.c:913 mtk_drm_of_ddp_path_build_one()
	error: uninitialized symbol 'next'.

drivers/gpu/drm/mediatek/mtk_drm_drv.c
    899 static int mtk_drm_of_ddp_path_build_one(struct device *dev, enum mtk_crtc_path cpath,
    900                                          const unsigned int **out_path,
    901                                          unsigned int *out_path_len)
    902 {
    903         struct device_node *next, *prev, *vdo = dev->parent->of_node;
    904         unsigned int temp_path[DDP_COMPONENT_DRM_ID_MAX] = { 0 };
    905         unsigned int *final_ddp_path;
    906         unsigned short int idx = 0;
    907         bool ovl_adaptor_comp_added = false;
    908         int ret;
    909 
    910         /* Get the first entry for the temp_path array */
    911         ret = mtk_drm_of_get_ddp_ep_cid(vdo, 0, cpath, &next, &temp_path[idx]);
    912         if (ret) {
--> 913                 if (next && temp_path[idx] == DDP_COMPONENT_DRM_OVL_ADAPTOR) {
                            ^^^^
The first two error paths in mtk_drm_of_get_ddp_ep_cid() don't initialize "next"

    914                         dev_dbg(dev, "Adding OVL Adaptor for %pOF\n", next);
    915                         ovl_adaptor_comp_added = true;
    916                 } else {
    917                         if (next)
    918                                 dev_err(dev, "Invalid component %pOF\n", next);
    919                         else
    920                                 dev_err(dev, "Cannot find first endpoint for path %d\n", cpath);
    921 
    922                         return ret;
    923                 }
    924         }
    925         idx++;
    926 

regards,
dan carpenter
