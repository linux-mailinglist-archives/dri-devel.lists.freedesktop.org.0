Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6417F6D1C57
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A1310F175;
	Fri, 31 Mar 2023 09:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED2C10F175
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:29:37 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 50BE66603130;
 Fri, 31 Mar 2023 10:29:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1680254975;
 bh=lMAebDq17jh7DdNz0cBlqr1fwRmhsP03/MJGfkU1R+8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EPBOOuTWx/PQ4Jo1UY5Tr8aSNr+DKcHxRpQT9tov4AyHcg8SvcD7zt/LzzgIoDRtB
 w51cc+rm15Z4WQmg1oZ5iDhLV6/JQf7Um3d7mAmyVkIakqT4ucQLvxqHjnqLIE3h2d
 XFJJA6hV5ldZ4z2dnTzMcsEglkbGJQGnAX4SO/dSguxe6zagccaIPi6AQl0VQGCnPu
 3Io9CUJdL140asZCXYIW1mT8jWKx0wxWMO9bRTtHN4qNomLqqcEBHHfHx4KiQuXJiC
 NC3GzF1JzNdu9/J+B/fbWsgpSad5gfrdDFxvyl1fzvpC1wyWs0OpxEDIui4H87FOKZ
 be8yyv1mbztbQ==
Date: Fri, 31 Mar 2023 11:29:32 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v1 RESEND 2/2] drm/panfrost: Add basic support for speed
 binning
Message-ID: <20230331112932.73b39d5a@collabora.com>
In-Reply-To: <fb19c82b-f2bf-7f22-ba5c-e1a1c98f987f@collabora.com>
References: <20230323090822.61766-1-angelogioacchino.delregno@collabora.com>
 <20230323090822.61766-3-angelogioacchino.delregno@collabora.com>
 <5814d779-0635-43fe-3fe8-31c130f05b3a@collabora.com>
 <20230331104914.708b194e@collabora.com>
 <fb19c82b-f2bf-7f22-ba5c-e1a1c98f987f@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 alyssa.rosenzweig@collabora.com, wenst@chromium.org, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 31 Mar 2023 10:57:46 +0200
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
wrote:

> Il 31/03/23 10:49, Boris Brezillon ha scritto:
> > On Fri, 31 Mar 2023 10:11:07 +0200
> > AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > wrote:
> >   
> >> Il 23/03/23 10:08, AngeloGioacchino Del Regno ha scritto:  
> >>> Some SoCs implementing ARM Mali GPUs are subject to speed binning:
> >>> this means that some versions of the same SoC model may need to be
> >>> limited to a slower frequency compared to the other:
> >>> this is being addressed by reading nvmem (usually, an eFuse array)
> >>> containing a number that identifies the speed binning of the chip,
> >>> which is usually related to silicon quality.
> >>>
> >>> To address such situation, add basic support for reading the
> >>> speed-bin through nvmem, as to make it possible to specify the
> >>> supported hardware in the OPP table for GPUs.
> >>> This commit also keeps compatibility with any platform that does
> >>> not specify (and does not even support) speed-binning.
> >>>
> >>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>  
> >>
> >> Hello maintainers,
> >> I've seen that this got archived in the dri-devel patchwork; because of that and
> >> only that, I'm sending this ping to get this patch reviewed.  
> > 
> > Looks good to me. If you can get a DT maintainer to review the binding
> > (Rob?), I'd be happy to queue the series to drm-misc-next.
> >   
> 
> The binding was acked by Krzysztof already... so, just to be sure:
> 
> Krzysztof, can the binding [1] get picked?

Oops, sorry, I didn't realize Krzysztof is a DT maintainer.
