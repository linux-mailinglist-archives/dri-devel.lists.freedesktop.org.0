Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E90194674BB
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 11:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2459773CCB;
	Fri,  3 Dec 2021 10:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B020173CCB
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 10:25:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 522A61435;
 Fri,  3 Dec 2021 02:25:19 -0800 (PST)
Received: from [10.1.38.15] (e122027.cambridge.arm.com [10.1.38.15])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9722B3F5A1;
 Fri,  3 Dec 2021 02:25:18 -0800 (PST)
Subject: Re: [PATCH] drm/komeda: return early if drm_universal_plane_init()
 fails.
To: Liviu Dudau <liviu.dudau@arm.com>
References: <95728378-3af0-2b55-0545-46d5131fa491@arm.com>
 <20211203100946.2706922-1-liviu.dudau@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <15e178b3-a181-ebd6-a372-f621c8e9d2d2@arm.com>
Date: Fri, 3 Dec 2021 10:25:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211203100946.2706922-1-liviu.dudau@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/12/2021 10:09, Liviu Dudau wrote:
> If drm_universal_plane_init() fails early we jump to the common cleanup code
> that calls komeda_plane_destroy() which in turn could access the uninitalised
> drm_plane and crash. Return early if an error is detected without going through
> the common code.
> 
> Reported-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>

Reviewed-by: Steven Price <steven.price@arm.com>

Looks correct, although I note there is a path in
__drm_universal_plane_init() which doesn't clean up properly. I'll send
a patch for that too.

Thanks,

Steve

> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_plane.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
> index aa193c58f4bf6d9..517b94c3bcaf966 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
> @@ -279,8 +279,10 @@ static int komeda_plane_add(struct komeda_kms_dev *kms,
>  
>  	komeda_put_fourcc_list(formats);
>  
> -	if (err)
> -		goto cleanup;
> +	if (err) {
> +		kfree(kplane);
> +		return err;
> +	}
>  
>  	drm_plane_helper_add(plane, &komeda_plane_helper_funcs);
>  
> 

