Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8414BEBDBB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 23:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC0610E1B8;
	Fri, 17 Oct 2025 21:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="HottCExb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C70910E1B9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 21:54:34 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20251017215432euoutp01592d9a4fb3a4eba56622309bc7f2558c~vZfK5oPQL2432424324euoutp01B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 21:54:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20251017215432euoutp01592d9a4fb3a4eba56622309bc7f2558c~vZfK5oPQL2432424324euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1760738072;
 bh=jzEO/zPLg7NCIuCZzzVK31d4JnKeturuamPvGa+Aw8M=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=HottCExb7WH/k3NuUr32KvIr/0FKgE4W1EbAp4ht0FiPEOJu5zN+ROJYKsG5iaTqW
 cZgzLz9ylYTQYeNr9WvrRw5SrGdrrosIThVTizTGrjVFB9eCPoGUdLHQneibyhlFFe
 CzX/86+owYWqnbArulMwNmjCGz45kNQW/e6Scuqw=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20251017215431eucas1p1b2ace58bb3692056b3e04ff381e03405~vZfJnfVOr1307813078eucas1p1K;
 Fri, 17 Oct 2025 21:54:31 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20251017215430eusmtip165b2f3a99d3141ec3b598b5b325d1826~vZfIlYaL30972209722eusmtip1u;
 Fri, 17 Oct 2025 21:54:29 +0000 (GMT)
Message-ID: <a2b72d27-9207-42e9-835a-5d55c419d96e@samsung.com>
Date: Fri, 17 Oct 2025 23:54:29 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 0/3] drm/display: bridge_connector: get/put the
 stored bridges: fix NULL pointer regression
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Naresh Kamboju
 <naresh.kamboju@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251017215431eucas1p1b2ace58bb3692056b3e04ff381e03405
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251017162527eucas1p164f6590949b2149a16c670b7991051cf
X-EPHeader: CA
X-CMS-RootMailID: 20251017162527eucas1p164f6590949b2149a16c670b7991051cf
References: <CGME20251017162527eucas1p164f6590949b2149a16c670b7991051cf@eucas1p1.samsung.com>
 <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com>
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

On 17.10.2025 18:15, Luca Ceresoli wrote:
> A patch of mine recently merged in drm-misc-next [1] has a NULL pointer
> deref regression (reported here [2] and here [3]). Being in lack of a quick
> fix, I sent a revert proposal [4].
>
> The revert proposal has no answers currenty, and in the meanwhile I have a
> patch that implements the original idea but without the same bug. So here's
> a v2 series with:
>
>   - the same revert patch
>   - the original patch but rewritten without the same bug (and even simpler)
>
> Also the re-written patch is now split in two for clarity because it was
> doing two somewhat different things.
>
> [1] https://lore.kernel.org/all/20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com/
> [2] https://lore.kernel.org/lkml/336fbfdd-c424-490e-b5d1-8ee84043dc80@samsung.com/
> [3] https://lore.kernel.org/lkml/CA+G9fYuKHp3QgPKjgFY3TfkDdh5Vf=Ae5pCW+eU41Bu=D7th2g@mail.gmail.com/
> [4] https://lore.kernel.org/lkml/20251016-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v1-1-81d6984c5361@bootlin.com/
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Works fine on all boards in my test lab.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
> Changes in v2:
> - No changes to the revert patch
> - Added the (corrected) patch introducing the same feature as the original
>    buggy patch, and also split it in two fir clarity
> - Link to v1: https://lore.kernel.org/r/20251016-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v1-1-81d6984c5361@bootlin.com
>
> ---
> Luca Ceresoli (3):
>        Revert "drm/display: bridge_connector: get/put the stored bridges"
>        drm/display: bridge_connector: get/put the stored bridges
>        drm/display: bridge_connector: get/put the panel_bridge
>
>   drivers/gpu/drm/display/drm_bridge_connector.c | 92 +++++++++++---------------
>   1 file changed, 39 insertions(+), 53 deletions(-)
> ---
> base-commit: 84a0a3f014cda68ff10b8517d09e9f0c1cd942a2
> change-id: 20251016-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-9a429ddb48e2
>
> Best regards,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

