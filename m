Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD38978849B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 12:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2324189B33;
	Fri, 25 Aug 2023 10:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C756989B33
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 10:18:48 +0000 (UTC)
Received: from mail.ispras.ru (unknown [83.149.199.84])
 by mail.ispras.ru (Postfix) with ESMTPSA id 2A66340737DA;
 Fri, 25 Aug 2023 10:18:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 2A66340737DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1692958726;
 bh=uryXDS4nqyFR9SOXfKBV4jwGs2+MiiKOcdfzM+yQBHU=;
 h=Date:From:To:Subject:From;
 b=fXucNdLeXndyUqCDYugj424bpQr3cuRMDdbS8ufn/BaTq8IiBXHuwj3UE+ZMDfWhX
 NWRToZ0JCpB2+AXgORxsFUu9cIhEt2+9n0n25UvguWQ/xGsmCAuPv3QVdC9ZTubY/u
 7EJWYVAtF/mEC6RGK2fNNhGrD2he4mnfr+6YM0zk=
MIME-Version: 1.0
Date: Fri, 25 Aug 2023 13:18:46 +0300
From: e.orlova@ispras.ru
To: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 lvc-project@linuxtesting.org
Subject: [QUESTION] drm/crtc: precondition for drm_crtc_init_with_planes()
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <a830685d8b10a00cfe0a86db1ee9fb13@ispras.ru>
X-Sender: e.orlova@ispras.ru
Content-Type: text/plain; charset=UTF-8;
 format=flowed
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

Documentation for drm_crtc_init_with_planes() in
drivers/gpu/drm/drm_crtc.c states: «The crtc structure should not be
allocated with devm_kzalloc()».

However, in drivers/gpu/drm/stm/ltdc.c
the 2nd argument of the function drm_crtc_init_with_planes()
is a structure allocated with devm_kzalloc()

Also, in
drivers/gpu/drm/mediatek/mtk_drm_crtc.c
drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
drivers/gpu/drm/logicvc/logicvc_crtc.c
drivers/gpu/drm/meson/meson_crtc.c
drivers/gpu/drm/mxsfb/lcdif_kms.c
drivers/gpu/drm/mxsfb/mxsfb_kms.c
drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
drivers/gpu/drm/rockchip/rockchip_drm_vop.c
drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
drivers/gpu/drm/sun4i/sun4i_crtc.c
drivers/gpu/drm/tegra/dc.c
drivers/gpu/drm/tilcdc/tilcdc_crtc.c
the 2nd argument of the function drm_crtc_init_with_planes()
is a field of the structure allocated with devm_kzalloc()

Is it correct or can it lead to any problems?

--
Ekaterina Orlova
Linux Verification Center, ISPRAS
