Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C2A326ABF
	for <lists+dri-devel@lfdr.de>; Sat, 27 Feb 2021 01:26:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082446E14F;
	Sat, 27 Feb 2021 00:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9BE6E14F
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Feb 2021 00:26:24 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id f8so6156308plg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 16:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zPMHMPCXzSuxLIFTtD345UsCc5XGfr7wNzeChZhcfKY=;
 b=TWAjXFo23zzD0FdqXg37IGKQSx/NBwMUeTqxWkF5wKx1nhJxg1Yc3Yr3djNYtNXHMB
 rv6zxLRP681F6KAjl6dZiqQAqsFhgcxoOyed6YqhE1Yc0S419y2h+0YU90GdDpryLVqW
 Qe8xrKW7HpvwGCM4oA153EPld0kv7keo4NOVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zPMHMPCXzSuxLIFTtD345UsCc5XGfr7wNzeChZhcfKY=;
 b=MGsxTx/vy+gzMvaTfErGwndRrGW1YVOWg1GUOr50WPqq6sUhlK9ET3IgirDQZB6F0h
 opUBN8fglnHXUODUFcYQh5mWn5+IOunyaMrFQgxFjRcec1lk3YuSvL8WN9RL8412zANp
 jdmpLiZt45NO/S68nQKxTIAhDEqWes9XVqqkkblh6C7MUKiJBe8hjVwi/FlIAm7ZRgYC
 Hjz0GS8edFDImobbAoG7Ty/T4Xw/DxLM247qJSEm+3CCZupUln9I/U5SzN3D3W6APlgO
 8OfmUqJjas1G3NBBgFBqRJicXgcrerHIQ0QF9jWP6dD1uY8Ras/LwkiRnnquN9/GO0sx
 HxmQ==
X-Gm-Message-State: AOAM5323/WchDCVuqmStkjazY/E+d2hjjX8jEjnFPFtLY7UUf+XGqM+j
 HQ1n1cf0H+LWgXfwRoyvD8xYKQ==
X-Google-Smtp-Source: ABdhPJx7A9Qm+a3u9y2rVrEMPrI01HocE65ALEkSTBLCuLvDAyquykOSg94ZkF0WArrG5JilcgWQoA==
X-Received: by 2002:a17:902:e8d2:b029:e3:c3e5:98ae with SMTP id
 v18-20020a170902e8d2b02900e3c3e598aemr5586251plg.78.1614385584353; 
 Fri, 26 Feb 2021 16:26:24 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:7525:b50:4b48:1a6d])
 by smtp.gmail.com with ESMTPSA id t6sm9793744pgp.57.2021.02.26.16.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 16:26:23 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>,
	Jordan Crouse <jcrouse@codeaurora.org>
Subject: [PATCH 0/3] nvmem: Bring a tiny bit of sanity to reading 16/32/64
 bits from nvmem
Date: Fri, 26 Feb 2021 16:26:00 -0800
Message-Id: <20210227002603.3260599-1-dianders@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
MIME-Version: 1.0
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
Cc: freedreno@lists.freedesktop.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Niklas Cassel <niklas.cassel@linaro.org>,
 Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series was inspried by a KASAN warning that I got at bootup caused
by the GPU driver on my system interfacing with the nvmem API incorrectly.

I have posted a fix for the GPU driver but looking at this nvmem entry
made me question how the nvmem API was supposed to work. I've proposed
some improvements and these seem better (to me) than any of:
- Open coding logic like that in "cpr.c" in the GPU driver.
- Ignoring the problem and just forcing everyone in the future to
  always specify a length of "2" for the GPU speed bin cells.
- Ignoring the problem and specifying a length of "4" for the GPU
  speed bin cells.

About applying the patches.
- GPU patch can land on its own.  No need for the nvmem patches.
- nvmem patches can land on their own too.
- If the second nvmem patch lands without the first, however, it will
  break the GPU patch.


Douglas Anderson (3):
  drm/msm: Fix speed-bin support not to access outside valid memory
  nvmem: core: Allow nvmem_cell_read_u16/32/64 to read smaller cells
  nvmem: core: nvmem_cell_read() should return the true size

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 31 +++++++--------------------
 drivers/nvmem/core.c                  | 30 ++++++++++++++++++++++----
 2 files changed, 34 insertions(+), 27 deletions(-)

-- 
2.30.1.766.gb4fecdf3b7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
