Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF16645BA8
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 14:59:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D4910E3B2;
	Wed,  7 Dec 2022 13:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B638E10E3B2
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 13:59:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C86523A;
 Wed,  7 Dec 2022 05:59:16 -0800 (PST)
Received: from [10.57.74.110] (unknown [10.57.74.110])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFB793F73D;
 Wed,  7 Dec 2022 05:59:08 -0800 (PST)
Message-ID: <17efaae0-9b6c-86ea-5fec-568d024d229f@arm.com>
Date: Wed, 7 Dec 2022 13:59:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm: mali-dp: Add check for kzalloc
Content-Language: en-GB
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, liviu.dudau@arm.com,
 brian.starkey@arm.com, airlied@gmail.com, daniel@ffwll.ch
References: <20221207092118.20603-1-jiasheng@iscas.ac.cn>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20221207092118.20603-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-12-07 09:21, Jiasheng Jiang wrote:
> As kzalloc may fail and return NULL pointer, it should be better to check
> the return value in order to avoid the NULL pointer dereference in
> __drm_atomic_helper_connector_reset.

This commit message is nonsense; if 
__drm_atomic_helper_connector_reset() would dereference the NULL implied 
by &mw_state->base, it would equally still dereference the explicit NULL 
pointer passed after this patch.

The current code works out OK because "base" is the first member of 
struct malidp_mw_connector_state, thus if mw_state is NULL then 
&mw_state->base == NULL + 0 == NULL. Now you *could* argue that this 
isn't robust if the layout of struct malidp_mw_connector_state ever 
changes, and that could be a valid justification for making this change, 
but the reason given certainly isn't.

Arithmetic on a (potentially) NULL pointer may well be a sign that it's 
worth a closer look to check whether it really is what the code intended 
to do, but don't automatically assume it has to be a bug. Otherwise, 
good luck with "fixing" every user of container_of() throughout the 
entire kernel.

Thanks,
Robin.

> Fixes: 8cbc5caf36ef ("drm: mali-dp: Add writeback connector")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>   drivers/gpu/drm/arm/malidp_mw.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
> index ef76d0e6ee2f..fe4474c2ddcf 100644
> --- a/drivers/gpu/drm/arm/malidp_mw.c
> +++ b/drivers/gpu/drm/arm/malidp_mw.c
> @@ -72,7 +72,11 @@ static void malidp_mw_connector_reset(struct drm_connector *connector)
>   		__drm_atomic_helper_connector_destroy_state(connector->state);
>   
>   	kfree(connector->state);
> -	__drm_atomic_helper_connector_reset(connector, &mw_state->base);
> +
> +	if (mw_state)
> +		__drm_atomic_helper_connector_reset(connector, &mw_state->base);
> +	else
> +		__drm_atomic_helper_connector_reset(connector, NULL);
>   }
>   
>   static enum drm_connector_status
