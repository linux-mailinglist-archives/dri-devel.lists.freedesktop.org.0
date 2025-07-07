Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF37DAFABF8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 08:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F2010E415;
	Mon,  7 Jul 2025 06:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WgDAmbZ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D30610E41C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 06:36:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8BD2D61130;
 Mon,  7 Jul 2025 06:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC70EC4CEE3;
 Mon,  7 Jul 2025 06:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751870172;
 bh=dc209bSSOMZyBL/UHG3HiH6AvU5ec3DCsBGBA0MD8OA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WgDAmbZ3f9Aqqwkljq5jHe8OaKHd8qTEvKsZj/eNsQ/Wl/Bz1ykWcyzsrwomDXV6B
 aYDH/g4K/oBR6eg4WVcYY7gnsb5YQ07RQBK0hxwXAluwwe8DwCCe8FU7bTsY+h1O8+
 P4/NYZFy9Yi8j2zEdiiEIdOiq8SXV3t452Seh+/sOCH8sqJHDy/tcsiPaT6BOoTYh6
 e9yYTtn1Pj5LAy6LvdfgPGv0bvYNhEVwedJSRNJ6+TWBRWWkh++2BatUpmG8zFmmRS
 SYqKsvNHTE4+iwSiC4DGCEJQp7AWLB3pwvsMIE0FJ00gwPJ65nYQubayx5OziXcMeF
 vgMmFHKDEmKaA==
Date: Mon, 7 Jul 2025 08:36:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: display: samsung,exynos7-decon:
 document iommus, memory-region, and ports
Message-ID: <20250707-silent-authentic-trogon-cca34d@krzk-bin>
References: <20250706-exynosdrm-decon-v4-0-735fd215f4b3@disroot.org>
 <20250706-exynosdrm-decon-v4-1-735fd215f4b3@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250706-exynosdrm-decon-v4-1-735fd215f4b3@disroot.org>
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

On Sun, Jul 06, 2025 at 10:59:45PM +0530, Kaustabh Chakraborty wrote:
> Similar to FIMD and Exynos5433's DECON, the Exynos7 DECON hardware:
> - May optionally require an IOMMU to initialize a display region.
> - Outputs image data to another block, say an MIC or a DSI master.
> 
> If an IOMMU is present, it may also require to access the reserved
> framebuffer region.
> 
> Document these bindings in the devicetree schema.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../display/samsung/samsung,exynos7-decon.yaml      | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

