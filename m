Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 775A3513F47
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 01:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA0E10E1E3;
	Thu, 28 Apr 2022 23:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5F810E4A9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 23:59:31 +0000 (UTC)
Received: from apollo.. (unknown [IPv6:2a02:810b:4340:43bf:4685:ff:fe12:5967])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 02E5722238;
 Fri, 29 Apr 2022 01:59:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1651190367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5+ookkYoRvSYJlv3MLXoEnad8QTltTpUU8LXR63oCiM=;
 b=kMftywZQ8uoL7xrVY4AFZBywzWYY5z3HraaywHO9jqmOovu/2V91XSdbL3TD161AZaHWTX
 ygvYHVz1bjc2BOvTiHMGNp0BQ6aKXiLidDQI8IPZ0SsiXlgO7jI8KpPbo8vZtKqSPHgJsh
 jGOsGNmMEzD7LDCzgllNVok55IVVkRY=
From: Michael Walle <michael@walle.cc>
To: daniel.vetter@ffwll.ch
Subject: Re: [PATCH 1/4] drm/etnaviv: Use scheduler dependency handling
Date: Fri, 29 Apr 2022 01:59:16 +0200
Message-Id: <20220428235916.331490-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220331204651.2699107-2-daniel.vetter@ffwll.ch>
References: <20220331204651.2699107-2-daniel.vetter@ffwll.ch>
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 Michael Walle <michael@walle.cc>, linux+etnaviv@armlinux.org.uk,
 daniel.vetter@intel.com, linux-media@vger.kernel.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> We need to pull the drm_sched_job_init much earlier, but that's very
> minor surgery.

This patch breaks the GC7000 on the LS1028A:

[   35.671102] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000078
[   35.680925] Mem abort info:
[   35.685127]   ESR = 0x96000004
[   35.689583]   EC = 0x25: DABT (current EL), IL = 32 bits
[   35.696312]   SET = 0, FnV = 0
[   35.700766]   EA = 0, S1PTW = 0
[   35.705315]   FSC = 0x04: level 0 translation fault
[   35.711616] Data abort info:
[   35.715916]   ISV = 0, ISS = 0x00000004
[   35.721170]   CM = 0, WnR = 0
[   35.725552] user pgtable: 4k pages, 48-bit VAs, pgdp=0000002083f59000
[   35.733420] [0000000000000078] pgd=0000000000000000, p4d=0000000000000000
[   35.741627] Internal error: Oops: 96000004 [#1] SMP
[   35.747902] Modules linked in:
[   35.750963] CPU: 0 PID: 44 Comm: f0c0000.gpu Not tainted 5.18.0-rc2-00894-gde6a1d7294f5 #24
[   35.759345] Hardware name: Kontron KBox A-230-LS (DT)
[   35.764409] pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   35.771394] pc : drm_sched_entity_select_rq+0x314/0x380
[   35.776645] lr : drm_sched_entity_pop_job+0x4c/0x480
[   35.781625] sp : ffff80000949bdb0
[   35.784943] x29: ffff80000949bdb0 x28: 0000000000000000 x27: 0000000000000000
[   35.792107] x26: ffff002003f09008 x25: ffff00200231d130 x24: ffff800008c13008
[   35.799270] x23: ffff8000086af900 x22: ffff800008c13008 x21: ffff002003fb6e00
[   35.806432] x20: 0000000000000040 x19: ffff002003f09008 x18: ffffffffffffffff
[   35.813594] x17: 0000000000000000 x16: 0000000000000000 x15: ffff800009ee3d48
[   35.820756] x14: 0000000000000000 x13: 0000000000000000 x12: ffffffff00000008
[   35.827918] x11: 0000aaaadb063d30 x10: 0000000000000960 x9 : ffff8000086afedc
[   35.835080] x8 : ffff00200186a900 x7 : 0000000000000000 x6 : 0000000000000000
[   35.842242] x5 : ffff00200231d2b0 x4 : 0000000000000000 x3 : 0000000000000000
[   35.849403] x2 : 0000000000000000 x1 : 0000000000000078 x0 : 0000000000000078
[   35.856565] Call trace:
[   35.859013]  drm_sched_entity_select_rq+0x314/0x380
[   35.863906]  drm_sched_main+0x1b0/0x49c
[   35.867752]  kthread+0xe4/0xf0
[   35.870814]  ret_from_fork+0x10/0x20
[   35.874401] Code: 8805fc24 35ffffa5 17fffef9 f9800031 (885f7c22) 
[   35.880513] ---[ end trace 0000000000000000 ]---

# glmark2-es2-drm
=======================================================
    glmark2 2021.02
=======================================================
    OpenGL Information
    GL_VENDOR:     etnaviv
    GL_RENDERER:   Vivante GC7000 rev 6202
    GL_VERSION:    OpenGL ES 2.0 Mesa 22.1.0-devel

Mesa is Lucas latest MR branch: lynxeye/etnaviv-gc7000-r6204.

Reverting this patch on drm-next will make the oops go away. Any idea
what's going wrong here?

-michael
