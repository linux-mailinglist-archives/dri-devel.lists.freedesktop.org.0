Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4832483A80D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 12:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5B510E9A1;
	Wed, 24 Jan 2024 11:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com
 [91.218.175.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98B610E508
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 11:38:09 +0000 (UTC)
Message-ID: <434aaa97-f263-4dfb-a9fb-4e8fd43290eb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1706096252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ex7zgKFtADiGixCKsWkttt+jPP1re/1SFxeiTQE8kns=;
 b=l6kbQUdAxxsT6LumJ+b+NJhzWj2Jaj0gLK5j0SbN6xX3Fmj2EiTeXKMotX0OhposR19auR
 Wn5d61QIBaFJYrd5KlKQO1vpuYxvqfon0LE73g8q5R+xOZ5TE9hsYBdYjgmgiHcRPwEYY+
 tDdoHHydBkX7wUjBzS7FNug8r6F/5Ko=
Date: Wed, 24 Jan 2024 19:37:19 +0800
MIME-Version: 1.0
Subject: Re: [V2] drm/loongson: Error out if no VRAM detected
To: Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Huacai Chen <chenhuacai@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20240124101607.2910998-1-chenhuacai@loongson.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240124101607.2910998-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Xiaotian Wu <wuxiaotian@loongson.cn>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2024/1/24 18:16, Huacai Chen wrote:
> If there is no VRAM (it can be true if there is a discreted card, this
> is probably a hardware configuration issue in BIOS but it is observed in
> GDC-1401 laptop, L71 laptop and some Loongson-3C5000L based servers), we
> get such an error and Xorg fails to start:
>
> [  136.401131] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
> [  137.444342] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
> [  138.871166] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
> [  140.444078] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
> [  142.403993] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
> [  143.970625] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
> [  145.862013] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) failed
>
> So in lsdc_get_dedicated_vram() we error out if no VRAM (or VRAM is less
> than 1MB which is also an unusable case) detected.
>
> Tested-by: Xiaotian Wu <wuxiaotian@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>


By the way, sending patch should Cc Maxime and Thomas in the future.
Since this patch is small patch, not a big deal, so it probably okay.

This serve as a basic sanity check, hopes this helps to mitigate the pains.


Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>

