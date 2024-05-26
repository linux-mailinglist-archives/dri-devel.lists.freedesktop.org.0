Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A578CF2DA
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2024 10:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9D710E384;
	Sun, 26 May 2024 08:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=packett.cool header.i=@packett.cool header.b="hI0HwYKw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 515 seconds by postgrey-1.36 at gabe;
 Sun, 26 May 2024 08:36:31 UTC
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com
 [91.218.175.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADA010E384
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 08:36:31 +0000 (UTC)
X-Envelope-To: adrian.larumbe@collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
 s=key1; t=1716712074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ftbCLkqW7AMyjcnNHoKh6QwQpSGftI1ij6SRmtVCgk=;
 b=hI0HwYKwTJUFfDagcVlZ87VmI020G1BxLoXinI44qXQVk5x0mgOgYtc9/pRw/xjuRzO3zP
 qrPKOenSZTCON/ChEHf2CsgJPwxoUKjs47Ch80iABLmJdARtF5ZVbK/2+1O9gaa3Hw+4hW
 WP8Emfgy1TiBTKLBVc00jS0oFlXDUNeZvqdUWdsqCb/Ws0gjbNLLOp5uELnZXk4Onzvs5d
 M+HFyCFw/TAasYAuxmn2jYVr64A7frO/2Gro1xxEm4YjAWuBrWTnS+DdEYoYF/k3Bq36+U
 QvOh8ZonbYkAHQTo8vTPKqObz1uU27R+HqvF1dl1iDOwB/dLuIsE0SimvPHUAg==
X-Envelope-To: boris.brezillon@collabora.com
X-Envelope-To: robh@kernel.org
X-Envelope-To: steven.price@arm.com
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: mripard@kernel.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: sumit.semwal@linaro.org
X-Envelope-To: christian.koenig@amd.com
X-Envelope-To: dmitry.osipenko@collabora.com
X-Envelope-To: zack.rusin@broadcom.com
X-Envelope-To: kernel@collabora.com
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-media@vger.kernel.org
X-Envelope-To: linaro-mm-sig@lists.linaro.org
Date: Sun, 26 May 2024 05:27:29 -0300
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Val Packett <val@packett.cool>
Subject: Re: [PATCH v4 2/3] drm/lima: Fix dma_resv deadlock at drm object pin
 time
To: =?iso-8859-1?q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring
 <robh@kernel.org>, Steven Price <steven.price@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?b?S/ZuaWc=?= <christian.koenig@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, Zack Rusin
 <zack.rusin@broadcom.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Message-Id: <TH33ES.VQFJ1AUXO5N81@packett.cool>
In-Reply-To: <20240523113236.432585-3-adrian.larumbe@collabora.com>
References: <20240523113236.432585-1-adrian.larumbe@collabora.com>
 <20240523113236.432585-3-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT
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



On Thu, May 23 2024 at 12:32:18 +01:00:00, Adri=E1n Larumbe=20
<adrian.larumbe@collabora.com> wrote:
> Commit a78027847226 ("drm/gem: Acquire reservation lock in
> drm_gem_{pin/unpin}()") moved locking the DRM object's dma=20
> reservation to
> drm_gem_pin(), but Lima's pin callback kept calling drm_gem_shmem_pin,
> which also tries to lock the same dma_resv, leading to a double lock
> situation.
>=20
> As was already done for Panfrost in the previous commit, fix it by
> replacing drm_gem_shmem_pin() with its locked variant.

Hi, just found this while dealing with compositor lockups upon=20
launching a GL client on an old Rockchip RK3066 tablet, and it did fix=20
the problem :) Thank you.

Tested-by: Val Packett <val@packett.cool>


