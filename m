Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F2F7CA47C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 11:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D607A10E188;
	Mon, 16 Oct 2023 09:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F8910E177;
 Mon, 16 Oct 2023 09:47:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 081EB60DF5;
 Mon, 16 Oct 2023 09:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47337C433C7;
 Mon, 16 Oct 2023 09:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697449649;
 bh=G4zxpVoIMd4Dnto6BtVe4r6qfQl1/1fiHD54t0GVFU4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hVAkS7u8Fc5baxMKgoXIQdQb5R/sdJcjx1QHfKbjdKFLXlqMoIzgTGaY/nb/i0hcr
 9R2cDxdFjF3fUcIbuxxv37SWswJwQqo9dyFz5A52VT/wiMZlfZagU3YkvHrZMyTE8z
 kUIceh+GveaonVkHMUh9FzwBVKDxiWw+KPEdtIKHxFF+FVnem2jvOFLjZO4BEycbCV
 LR5l6NKf+NOLS9Wj9rgcxjzy7RXOeqT1X7RdHBAgwmOtUP9BDFpi66ug8PRQTkmlju
 9xcitjY7+Oxq2qAV20oZ6tGY0Y+Zg62Q7ekpKwao0AV871HVeIxRs7Mno8vigbThZn
 lNk+FxWJ5ILsA==
From: Robert Foss <rfoss@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: lt9611uxc: fix the race in the error path
Date: Mon, 16 Oct 2023 11:47:23 +0200
Message-ID: <169744963234.583969.6401171307334981045.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011220002.382422-1-dmitry.baryshkov@linaro.org>
References: <20231011220002.382422-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: freedreno@lists.freedesktop.org, Robert Foss <rfoss@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 12 Oct 2023 01:00:02 +0300, Dmitry Baryshkov wrote:
> If DSI host attachment fails, the LT9611UXC driver will remove the
> bridge without ensuring that there is no outstanding HPD work being
> done. In rare cases this can result in the warnings regarding the mutex
> being incorrect. Fix this by forcebly freing IRQ and flushing the work.
> 
> DEBUG_LOCKS_WARN_ON(lock->magic != lock)
> WARNING: CPU: 0 PID: 10 at kernel/locking/mutex.c:582 __mutex_lock+0x468/0x77c
> Modules linked in:
> CPU: 0 PID: 10 Comm: kworker/0:1 Tainted: G     U             6.6.0-rc5-next-20231011-gd81f81c2b682-dirty #1206
> Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
> Workqueue: events lt9611uxc_hpd_work
> pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : __mutex_lock+0x468/0x77c
> lr : __mutex_lock+0x468/0x77c
> sp : ffff8000800a3c70
> x29: ffff8000800a3c70 x28: 0000000000000000 x27: ffffd595fe333000
> x26: ffff7c2f0002c005 x25: ffffd595ff1b3000 x24: ffffd595fccda5a0
> x23: 0000000000000000 x22: 0000000000000002 x21: ffff7c2f056d91c8
> x20: 0000000000000000 x19: ffff7c2f056d91c8 x18: fffffffffffe8db0
> x17: 000000040044ffff x16: 005000f2b5503510 x15: 0000000000000000
> x14: 000000000006efb8 x13: 0000000000000000 x12: 0000000000000037
> x11: 0000000000000001 x10: 0000000000001470 x9 : ffff8000800a3ae0
> x8 : ffff7c2f0027f8d0 x7 : ffff7c2f0027e400 x6 : ffffd595fc702b54
> x5 : 0000000000000000 x4 : ffff8000800a0000 x3 : 0000000000000000
> x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff7c2f0027e400
> Call trace:
>  __mutex_lock+0x468/0x77c
>  mutex_lock_nested+0x24/0x30
>  drm_bridge_hpd_notify+0x2c/0x5c
>  lt9611uxc_hpd_work+0x6c/0x80
>  process_one_work+0x1ec/0x51c
>  worker_thread+0x1ec/0x3e4
>  kthread+0x120/0x124
>  ret_from_fork+0x10/0x20
> irq event stamp: 15799
> hardirqs last  enabled at (15799): [<ffffd595fc702ba4>] finish_task_switch.isra.0+0xa8/0x278
> hardirqs last disabled at (15798): [<ffffd595fd5a1580>] __schedule+0x7b8/0xbd8
> softirqs last  enabled at (15794): [<ffffd595fc690698>] __do_softirq+0x498/0x4e0
> softirqs last disabled at (15771): [<ffffd595fc69615c>] ____do_softirq+0x10/0x1c
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: lt9611uxc: fix the race in the error path
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=15fe53be46ea



Rob

