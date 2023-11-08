Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C45DE7E57E4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 14:20:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2945510E751;
	Wed,  8 Nov 2023 13:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 62D0510E751
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 13:20:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 658121477;
 Wed,  8 Nov 2023 05:20:49 -0800 (PST)
Received: from [10.1.36.36] (e122027.cambridge.arm.com [10.1.36.36])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 587E83F703;
 Wed,  8 Nov 2023 05:20:02 -0800 (PST)
Message-ID: <7928524a-b581-483b-b1a1-6ffd719ce650@arm.com>
Date: Wed, 8 Nov 2023 13:20:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: Really power off GPU cores in
 panfrost_gpu_power_off()
Content-Language: en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 boris.brezillon@collabora.com
References: <20231102141507.73481-1-angelogioacchino.delregno@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20231102141507.73481-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, wenst@chromium.org, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/11/2023 14:15, AngeloGioacchino Del Regno wrote:
> The layout of the registers {TILER,SHADER,L2}_PWROFF_LO, used to request
> powering off cores, is the same as the {TILER,SHADER,L2}_PWRON_LO ones:
> this means that in order to request poweroff of cores, we are supposed
> to write a bitmask of cores that should be powered off!
> This means that the panfrost_gpu_power_off() function has always been
> doing nothing.
> 
> Fix powering off the GPU by writing a bitmask of the cores to poweroff
> to the relevant PWROFF_LO registers and then check that the transition
> (from ON to OFF) has finished by polling the relevant PWRTRANS_LO
> registers.
> 
> While at it, in order to avoid code duplication, move the core mask
> logic from panfrost_gpu_power_on() to a new panfrost_get_core_mask()
> function, used in both poweron and poweroff.
> 
> Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,

Steve

