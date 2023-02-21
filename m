Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1A369DDB1
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 11:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2471510E17F;
	Tue, 21 Feb 2023 10:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FB610E159;
 Tue, 21 Feb 2023 10:16:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E7F5860FBE;
 Tue, 21 Feb 2023 10:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5799BC4339C;
 Tue, 21 Feb 2023 10:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676974605;
 bh=LUsoC6iSVQT5Y3MM/3YfkP1p/LvHRVSyJ+N/makA+N8=;
 h=From:To:Cc:Subject:Date:From;
 b=rcXnBgvhaj6iNKopEWQjVQr3aV4U3Ca/n+r22TxKwIJyrYcLABchJSvyK9nBAxfbh
 DT6GvN7i1hDH4Cc70yAAUXa1+Taa5/TYX6qjZiahdTllrZP10/EtnE0k4FtOTxBFPz
 Ghh1zezU4xyboYI4ZUFnPT2DS610X3SRE5NeqUUpdt3WdD5HTjnDO59YAEmybpZNxE
 4mjUudbWBy1BTeN0v6GSsiN9bIFAPlNhzKjOj62RtwjbS9TioWGvSKZ6iaQ9pc9CRW
 G6q6etakyCVKw4RXU6XcrJfZ2bgC2Dtq8ur+JnI9q6KsgywauRm7YpdnVmW6caiNSj
 eTrgbD87u43gg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1pUPhX-0003oD-5w; Tue, 21 Feb 2023 11:16:47 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/4] drm/msm/adreno: fix runtime PM imbalance at unbind
Date: Tue, 21 Feb 2023 11:14:26 +0100
Message-Id: <20230221101430.14546-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As reported by Bjorn, we can end up with an unbalanced runtime PM
disable count if unbind() is called before the drm device is opened
(e.g. if component bind fails due to the panel driver not having been
loaded yet).

As runtime PM must currently stay disabled until the firmware has been
loaded, fix this by making the runtime PM disable call at unbind()
conditional.

The rest of the series removes a bogus pm_runtime_set_active() call and
drops the redundant pm_runtime_disable() from adreno_gpu_cleanup().
Included is also a related indentation cleanup.

Johan


Johan Hovold (4):
  drm/msm/adreno: fix runtime PM imbalance at unbind
  drm/msm/adreno: drop bogus pm_runtime_set_active()
  drm/msm/adreno: drop redundant pm_runtime_disable()
  drm/msm/adreno: clean up component ops indentation

 drivers/gpu/drm/msm/adreno/adreno_device.c | 10 ++++------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  5 -----
 2 files changed, 4 insertions(+), 11 deletions(-)

-- 
2.39.2

