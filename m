Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAE819BFCE
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 13:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D816EA4F;
	Thu,  2 Apr 2020 11:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6FF6EA4F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 11:04:46 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t128so2950591wma.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Apr 2020 04:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rx0Eu0iRyYfg2uvkBLQi2y72YA08curvclFfq6pOht0=;
 b=X9rTXj6wbjaRHbgRBzsfG4EoVaNvnhFDANQlZN95tOdfwv0qAWyBrb17LfhD4AG4Xq
 sA50IyhMPxnsvu+0ZIOoaeyIeAIeFEqJaPIN/80lXHzgQFe4oMIEMi1qvrQwmWVrZaVn
 F/AYTw7WrueRNIdSd0sn3PCL0CMlhpPCMpEfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rx0Eu0iRyYfg2uvkBLQi2y72YA08curvclFfq6pOht0=;
 b=LIMHwqrH7xuGrPcydJpKHAE+jyBSVgwlQWAw6FwD//fAxRdQW5CmVBK7lqSphmGl8o
 3RFlEvEAGAv9H220dXt17Ac5VEguyo65W6m6x5QuJZMByoMPmcJfh+ebpw3KdmvyE5Ww
 3AMzYtgkiDZfEceKIu65/Gr0ZXIyyjDT+lb90cYC/hHMSY47XtsVynIwydyAeBuoxihi
 Ilo0qu/WZKsLYYw8QFXNDTw3XN6jS3LDWH+qC59JjPSgTsFtZ8H9lrd6oECN1pcjQnQu
 48wFqnPPhWbAZ89nSbsDfBAHUJ3ObXd+Ra4R72pBvoNsZv+Yhdjuz2JCeUPLvmip7t7z
 n7SQ==
X-Gm-Message-State: AGi0PublDFUO8Z2AevILDVdWGUNNvbJFLi8qis8w4EgawWZshhazB1J5
 SSe+dT4PfFXDITefyJiFeIJYig==
X-Google-Smtp-Source: APiQypKilRa4ELew+HwUY7JVsWY5Zgf9ieOed7+HI5mjFjYkqai/9nmS7YR94mbFdri9Oq6nWhSjAg==
X-Received: by 2002:a1c:3943:: with SMTP id g64mr2926900wma.9.1585825484780;
 Thu, 02 Apr 2020 04:04:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a186sm6645925wmh.33.2020.04.02.04.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 04:04:44 -0700 (PDT)
Date: Thu, 2 Apr 2020 13:04:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm: Fix wrong kfree() in managed resource usage example
Message-ID: <20200402110442.GS2363188@phenom.ffwll.local>
References: <20200402095325.5266-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200402095325.5266-1-laurent.pinchart+renesas@ideasonboard.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 02, 2020 at 12:53:25PM +0300, Laurent Pinchart wrote:
> The example code showing how to use the managed resource API calls
> kfree() on the wrong pointer. Fix it.
> 
> Fixes: d33b58d0115e ("drm: Garbage collect drm_dev_fini")

Actually goes back to the original doc patch adding these, so I deleted
this line.

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch, applied to drm-misc-next.
-Daniel

> ---
>  drivers/gpu/drm/drm_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 7dad7813fca1..c15c9b4540e1 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -305,7 +305,7 @@ void drm_minor_release(struct drm_minor *minor)
>   *
>   *		ret = devm_drm_dev_init(&pdev->dev, drm, &driver_drm_driver);
>   *		if (ret) {
> - *			kfree(drm);
> + *			kfree(priv);
>   *			return ret;
>   *		}
>   *		drmm_add_final_kfree(drm, priv);
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
