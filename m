Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E44C6990C0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 11:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA9310ECE3;
	Thu, 16 Feb 2023 10:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87F610E2BB
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 01:37:43 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id b2so1536178ejz.9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 17:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:user-agent:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=baCgf247aKa2TbgJPaFGuC/xQDQ/fJaWhZ2ZJNR1qUI=;
 b=NVAZhArqamb6Vu5aWK4HGmDcgxpj6Ds4yBBzsiezVZeOz8wvpA+MsvkFLc9bXSVJKB
 ToZFSZlfkrd5ODpUten0X32c+/3L+eY/FpKT/70bns1K1rWF/BwRrazUbL/J0lfQDN3l
 tcL1TvS0d7aHGjQcP2Y+nkt7NeJfujdPfzQEedE6lwSOHK8/AuGEYwWC3VmigAvfZfqK
 uZP27zQNCqDRiw8fsRZelUbTxd6/zzH8B4IvdRchCoVaXR/hWRH5fOim0MNOLXLT9Wv+
 Mix79QsLpLdS+LG7mcOo486cBTJdHsfC7ZKxTYHleWOU+KrdomROEf5WuYIwej3KqU2x
 7XSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=baCgf247aKa2TbgJPaFGuC/xQDQ/fJaWhZ2ZJNR1qUI=;
 b=MnucgF8FECQ4Qai14jyjWbwD76/C+oM/YPoenFxLyNe4gHVSZbve9gG0zY6WCqGpRF
 rqHAI8YYJOiSe9nJLr9PzwgvkmQpFRXB6vZIRLl52kX30va9YxwAVyWXtZVnSx4gfkwG
 aDy9Dap8N8hQB9Ma3Rt4eSkNc41SddadaF6lPpNyCw0KUbv4rLzkU+neZgqm4MZ/5h6b
 8goYJ8sUwuVzF4odkx0BSUwfV5Y7XCM3vIzkJTzuqiJg9RjiQR3h/rgKZOqbKCWYRbbq
 WSqtHc8hHpZt2eHEUFG0J3YlrvMzPt9Rje9ddEWIllVr8EZ0MysOb6smA52Dvml2UhXy
 SDTw==
X-Gm-Message-State: AO0yUKU+5r2dpcrg63WDGxvCh4DAt9QPDYEgYp1d95E+MCsLcO7A+xa+
 EGFpouR+lCcZ/jigjAR+iPc=
X-Google-Smtp-Source: AK7set8eCDLr8j3KGb/GwZNd0CjttI/ZuImTr7X4gxOdiX8Gl2eEzzbYHTgljlxU1SU0IXobKMT5Ag==
X-Received: by 2002:a17:906:f1d4:b0:8aa:c0d5:166d with SMTP id
 gx20-20020a170906f1d400b008aac0d5166dmr5027724ejb.71.1676511462256; 
 Wed, 15 Feb 2023 17:37:42 -0800 (PST)
Received: from smurf (80.71.142.58.ipv4.parknet.dk. [80.71.142.58])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a508ac2000000b004aac44175e7sm152937edk.12.2023.02.15.17.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 17:37:41 -0800 (PST)
Date: Thu, 16 Feb 2023 02:37:15 +0100 (CET)
From: Jesper Juhl <jesperjuhl76@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] Don't test for NULL firmware before releasing
Message-ID: <1af763de-dbb8-a6f8-1a8a-2d76610d8776@gmail.com>
User-Agent: Alpine 2.26 (LNX 649 2022-06-02)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Mailman-Approved-At: Thu, 16 Feb 2023 10:11:15 +0000
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
Cc: dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From 4fe34831e2e7677b1c9616356f0a2e0a36ec092f Mon Sep 17 00:00:00 2001
From: Jesper Juhl <jesperjuhl76@gmail.com>
Date: Thu, 16 Feb 2023 02:33:05 +0100
Subject: [PATCH] Don't test for NULL firmware before releasing

release_firmware() tests for a NULL pointer itself, no need to do it up-front.

Signed-off-by: Jesper Juhl <jesperjuhl76@gmail.com>

---
  drivers/gpu/drm/tegra/falcon.c | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/falcon.c b/drivers/gpu/drm/tegra/falcon.c
index c0d85463eb1a..ae599441f031 100644
--- a/drivers/gpu/drm/tegra/falcon.c
+++ b/drivers/gpu/drm/tegra/falcon.c
@@ -153,8 +153,7 @@ int falcon_init(struct falcon *falcon)

  void falcon_exit(struct falcon *falcon)
  {
-	if (falcon->firmware.firmware)
-		release_firmware(falcon->firmware.firmware);
+       	release_firmware(falcon->firmware.firmware);
  }

  int falcon_boot(struct falcon *falcon)
-- 
2.39.2

