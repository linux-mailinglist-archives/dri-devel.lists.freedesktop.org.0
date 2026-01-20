Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F68D3C153
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 09:04:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B6810E066;
	Tue, 20 Jan 2026 08:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="2VLnWmlV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD37610E066
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 08:04:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5D1734E421A5;
 Tue, 20 Jan 2026 08:04:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 21D41606AB;
 Tue, 20 Jan 2026 08:04:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7431110B6822A; Tue, 20 Jan 2026 09:04:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768896263; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=jQzX/s0Tz80laIdci7lnfrnYjLkdF1cy5tKElWmE3YY=;
 b=2VLnWmlVD4171PDwhgs6K6AYkvjHNpeUorXOGO93bpBR3Efad5SQPkvUCBVJQlOwb5+PxL
 AFyllj5EsOxDaYE3vRDdSnuM+gs+wqr/t5zfvyxMuPzjZw4cIreBUInetK5MlbjAWQCPBy
 fhxAOPN3atT7GE9corFUwDPbKubvX5M+fxWR5fKZ3JEIX5/a+J7TZvXsLBP2Xp65NS/bkF
 dyaBORW7YoUBrAehBoQD7IjAgyGVpLKY4KE/ZLLH3dqeWIt+YbAXOk4H7DoMyuKm4/DjGi
 ZRwEg2aRoqfxsoz9nxcvVlOL8FH57y4SDQQUT1YeyROGvjAa1A+xyqTOl1o+JA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 09:04:17 +0100
Message-Id: <DFT9E29AZMH1.MTEUEMPJJGJB@bootlin.com>
Subject: Re: [PATCH] drm/tests: hdmi: fix build failure
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "kernel test robot" <lkp@intel.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jani
 Nikula" <jani.nikula@linux.intel.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260119-fix-kunit-infoframe-v1-1-5f2f9b066594@oss.qualcomm.com>
In-Reply-To: <20260119-fix-kunit-infoframe-v1-1-5f2f9b066594@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
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

On Mon Jan 19, 2026 at 9:08 PM CET, Dmitry Baryshkov wrote:
> The commit ca59e33f5a1f ("drm/atomic: add max_size check to
> drm_property_replace_blob_from_id()") added a new parameter to
> drm_property_replace_blob_from_id(), however commit 7436a87db99d
> ("drm/tests: hdmi: check the infoframes behaviour") was based on the
> older tree and used the old number of params (with me failing to run
> kunit tests when applying).
>
> Fix the build error by specifying -1 as the max_size (as expected).
>
> Fixes: 7436a87db99d ("drm/tests: hdmi: check the infoframes behaviour")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601200306.dgF5deFm-lkp@i=
ntel.com/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
