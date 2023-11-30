Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1167FE9AF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 08:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722DE10E6C0;
	Thu, 30 Nov 2023 07:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E901610E6C0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 07:27:06 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-333229dcebdso192663f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 23:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701329225; x=1701934025; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=x09g6G18OJ4KcEcTHhYJRdvLAtb4UmkCF9sOQ3/Txus=;
 b=Nq2XqC5+euHKPtWeY40+WG5LSddBzd8Qgzxu/r4YuBKAoxbnMrraXysWnRzYaLSVWu
 HpmWPYkn6Xq3Rx7u0gi32BP22WMrtXrRz8DYHA8aN9AKiU2exEOtkS3XRYusW27dNY+z
 uAjifNt7WyTS8EX/9m65VsnaaFR7zIedqLSmeY76vjQXz0FbHRM3K84q1Ns2NrfwfjRg
 oxjfQsBqOfPG20ss/xi+9oUZiOC7JRbN8zsBRPcZVcGkLKZjljHc2QJg+6YmvCGKW7F6
 zkbL0bStzvMkttp9WejuzXO+BVhq4YPIDsDvWCrdpUQoEHRz8kX04xeR29s43ICqEXea
 L0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701329225; x=1701934025;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x09g6G18OJ4KcEcTHhYJRdvLAtb4UmkCF9sOQ3/Txus=;
 b=OuMLG2SuZyCUebYGJavBDOTsR5NJFxhBelPa1MgUhplSJzNY7Ftnk0VCmowmorwSGM
 cnSdcgY9pTD87nE61THt0rP3Fejwafj8zqEGzgjvD++49DVj9bTRCuL53OAv4CyQG2oR
 fFP6YUDEjb1X2iZqAIKSX4xmOOJuoYxKTxwiyGnn0QFp9eXdQppLWS2fuuyTh1b8adpd
 hNIfr+huv5JsUo51G/o0tVKsxrH46seWVAaHduJT2wSde0eU64eTfxN1paSZDEC2xr5G
 HpWqyRV76Hc5osuCbBqtL3/2BJpuNMT3YnBMOqbXABbbYwYVvcA7yKoi22PNr5L/sSbr
 rzXg==
X-Gm-Message-State: AOJu0YynHghw9+5BEDKOfKK6xJB2JHn2JQUMEUFkdheyWfsjXXINQOeZ
 cKbdBA+wpSWo/vzbPBHLEueQ0A==
X-Google-Smtp-Source: AGHT+IEPpmMxWY7kuPeVsp/4wZTQWAaoK7shEBxCxTgQhdfynB/VG26OKEMXa8H2xecLoUqmGYdG9A==
X-Received: by 2002:a5d:5987:0:b0:333:145c:ac01 with SMTP id
 n7-20020a5d5987000000b00333145cac01mr4260949wri.44.1701329225311; 
 Wed, 29 Nov 2023 23:27:05 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 w18-20020a5d6092000000b003142e438e8csm693983wrt.26.2023.11.29.23.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 23:27:04 -0800 (PST)
Date: Thu, 30 Nov 2023 10:27:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sarah Walker <sarah.walker@imgtec.com>
Subject: [PATCH 2/2] drm/imagination: Fix IS_ERR() vs NULL bug in
 pvr_request_firmware()
Message-ID: <384288de-a779-46c7-869d-b3c63462e12b@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649c66b-3eea-40d2-9687-592124f968cf@moroto.mountain>
X-Mailer: git-send-email haha only kidding
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
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Matt Coster <matt.coster@imgtec.com>, Donald Robson <donald.robson@imgtec.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pvr_build_firmware_filename() function returns NULL on error.  It
doesn't return error pointers.

Fixes: f99f5f3ea7ef ("drm/imagination: Add GPU ID parsing and firmware loading")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/imagination/pvr_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index e1dcc4e42087..5389aea7ff21 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -286,8 +286,8 @@ pvr_request_firmware(struct pvr_device *pvr_dev)
 
 	filename = pvr_build_firmware_filename(pvr_dev, "powervr/rogue",
 					       PVR_FW_VERSION_MAJOR);
-	if (IS_ERR(filename))
-		return PTR_ERR(filename);
+	if (!filename)
+		return -ENOMEM;
 
 	/*
 	 * This function takes a copy of &filename, meaning we can free our
-- 
2.42.0

