Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1D17B1AEA
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 13:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E3B10E612;
	Thu, 28 Sep 2023 11:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0562A10E60D;
 Thu, 28 Sep 2023 11:24:54 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B1C106607337;
 Thu, 28 Sep 2023 12:24:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695900292;
 bh=CppPHmkoLt+zjmY2qAg60/g1MggRcPf5o7BrilZYcSM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NsftOWZCWUP2/39arzsyP0pYJZPB9p7utGw2Z/2IiqZb7hZM5lDxEd/KLlSOzY2pn
 mKVHuopcahUsicUAE8y4EPA/gRHwbvPuCY1bKnnyJOHaSH+QFYqsJwWncfIy/oCnR3
 ceoMqcG3ODtVkGg8GCuKkcub4N4h4+OtWzhYkdnovbGRkdeED+uBISZJEtMat3zYuW
 OMO4Oi17EDMX2cS0ULtKlm3zO2t6W7T+T7rXD74kAhWeXWb4eFDiVnky9+6GkHnxTa
 jSDCcozJyMNUeuhUBk3imaFOGo04EH/V/LsisDbHBDFvQ8aFjn4Xko+cZNgwl1IIDT
 zgIt+K/jVXYBA==
Message-ID: <df035e27-b19e-fd4c-d31c-316d526afc4f@collabora.com>
Date: Thu, 28 Sep 2023 13:24:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v7 4/5] drm/drm_file: Add DRM obj's RSS reporting function
 for fdinfo
Content-Language: en-US
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, robh@kernel.org, steven.price@arm.com
References: <20230927213133.1651169-1-adrian.larumbe@collabora.com>
 <20230927213133.1651169-5-adrian.larumbe@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230927213133.1651169-5-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: tvrtko.ursulin@linux.intel.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 healych@amazon.com, boris.brezillon@collabora.com, kernel@collabora.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 27/09/23 23:29, Adrián Larumbe ha scritto:
> Some BO's might be mapped onto physical memory chunkwise and on demand,
> like Panfrost's tiler heap. In this case, even though the
> drm_gem_shmem_object page array might already be allocated, only a very
> small fraction of the BO is currently backed by system memory, but
> drm_show_memory_stats will then proceed to add its entire virtual size to
> the file's total resident size regardless.
> 
> This led to very unrealistic RSS sizes being reckoned for Panfrost, where
> said tiler heap buffer is initially allocated with a virtual size of 128
> MiB, but only a small part of it will eventually be backed by system memory
> after successive GPU page faults.
> 
> Provide a new DRM object generic function that would allow drivers to
> return a more accurate RSS and purgeable sizes for their BOs.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

