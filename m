Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 990E79FB36D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 18:06:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DF010E586;
	Mon, 23 Dec 2024 17:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D4B0910E586
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 17:06:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A06CB1424;
 Mon, 23 Dec 2024 09:06:34 -0800 (PST)
Received: from [10.57.73.219] (unknown [10.57.73.219])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09C653F694;
 Mon, 23 Dec 2024 09:06:03 -0800 (PST)
Message-ID: <74c43172-b55e-4c50-8a6d-061f616748d7@arm.com>
Date: Mon, 23 Dec 2024 17:06:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/4] drm/panthor: Add 64-bit register accessors
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20241219170521.64879-1-karunika.choo@arm.com>
 <20241219170521.64879-2-karunika.choo@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241219170521.64879-2-karunika.choo@arm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/12/2024 17:05, Karunika Choo wrote:
> This patch adds 64-bit register accessors to simplify register access in
> Panthor. It also adds 64-bit variants for read_poll_timeout and replaces
> all 64-bit and poll register accesses with these new functions.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>

(Minor NIT: This might be easier to review as two patches - one which
adds the new functions and a second which switching the code over to use
them).

[...]

> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
> index b7b3b3add166..269c2c68dde2 100644
> --- a/drivers/gpu/drm/panthor/panthor_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> @@ -10,6 +10,9 @@
>  #ifndef __PANTHOR_REGS_H__
>  #define __PANTHOR_REGS_H__
>  
> +#include <linux/iopoll.h>
> +
> +/* GX10 registers */

NIT: Please don't include unrelated changes like this comment.

Other than those minor issues, this looks like a nice improvement.

Steve


