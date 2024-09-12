Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 202B3977281
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 21:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB4A10EC2A;
	Thu, 12 Sep 2024 19:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tronnes.org header.i=@tronnes.org header.b="Mpq5RWnq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301A210EC2A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 19:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202312;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:
 Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mFbBHMIBpxuF533CBpYE6bXelN5+li1CrLJDcAhkMzE=; b=M
 pq5RWnq9tc44iGtAy+QSrXOHckKMzX4BBaJbM5I9d09dlAgapKYzkh4iQVbncYMLv1+syjkmOVCeH
 E0UKQDacFA2ZqqKhB82ajL+ADy0IfJDW8Lgpfb+xfRwZ2YQoA2/NLjsw5UiipmcMLmGEwGDTtfCAg
 p/xuAyxyDTsuLfaEkTWpMufB0fQuKz58Wh0N7lGkWDBhuMBj2klJFKrXNqiVWfpjkYOW5tGasH5At
 Iq6lbOfa3YfKTG1UEWggr1O36O9Gi4zhFGqHYxm0dZzuEXfTW3d50fKLI+1EgQB08E7BYB0m2qwKt
 y2GRB7tCS9LhOCCUDToma6QG1gYM3QQUA==;
Received: from [2a01:799:967:5000:f018:451c:38b1:f937] (port=35014)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1sopwW-0009jh-1Q;
 Thu, 12 Sep 2024 21:57:28 +0200
Message-ID: <2c4f5c05-f9da-4487-8211-954c0dfcf338@tronnes.org>
Date: Thu, 12 Sep 2024 21:57:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/gud: use devm_add_action_or_reset() helper
To: He Lugang <helugang@uniontech.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, noralf@tronnes.org
References: <FD5792B37EAB593D+20240907070010.1661756-1-helugang@uniontech.com>
Content-Language: en-US
From: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
In-Reply-To: <FD5792B37EAB593D+20240907070010.1661756-1-helugang@uniontech.com>
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



On 07.09.2024 09:00, He Lugang wrote:
> Use devm_add_action_or_reset() to release resources in case of failure,
> because the cleanup function will be automatically called.
> 
> Signed-off-by: He Lugang <helugang@uniontech.com>
> ---
>  drivers/gpu/drm/gud/gud_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
> index ac6bbf920c72..f121f6deb268 100644
> --- a/drivers/gpu/drm/gud/gud_drv.c
> +++ b/drivers/gpu/drm/gud/gud_drv.c
> @@ -473,7 +473,7 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>  	INIT_WORK(&gdrm->work, gud_flush_work);
>  	gud_clear_damage(gdrm);
>  
> -	ret = devm_add_action(dev, gud_free_buffers_and_mutex, gdrm);
> +	ret = devm_add_action_or_reset(dev, gud_free_buffers_and_mutex, gdrm);

I don't think this is necessary. If this call fails we're left with an
inititalized mutex but that doesn't matter since probing ends here and
the mutex can't be accidentally used anywhere. And the buffers are
allocated later.

A change that would be useful is switching to the managed mutex_init
versions, devm_mutex_init() for ctrl_lock and drmm_mutex_init() for
damage_lock (can be accessed after the device is gone) ;-)

Noralf.

>  	if (ret)
>  		return ret;
>  
