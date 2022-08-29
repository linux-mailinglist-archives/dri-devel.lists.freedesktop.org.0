Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 804085A548C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 21:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADB710E19E;
	Mon, 29 Aug 2022 19:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E75D10E10D
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 19:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661801366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NAZKF9lRFNNcMrII+/b/0ru4RwayBGArEpvrWgZLTtY=;
 b=GWLkWDlQPO3fHGFXoOAQhNz4fWgRuL99X3E3O4MUeeG5Ojn2vw2Nc7J7uDJYIo7/zhO4eu
 aAgyeT4OsxKC4xa0z0Xj12apT/S7hAi2cFTu3E6YRTRFAjZcM19KdPMgYyIZO1cYu6wA1F
 M6zA+S3KsOfHN9UmwEOsqPOP6PNcDWs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-467-aFAXcxWbNiaM6ZH3pW1g2g-1; Mon, 29 Aug 2022 15:29:24 -0400
X-MC-Unique: aFAXcxWbNiaM6ZH3pW1g2g-1
Received: by mail-qt1-f199.google.com with SMTP id
 ci6-20020a05622a260600b0034370b6f5d6so7162422qtb.14
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 12:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc;
 bh=NAZKF9lRFNNcMrII+/b/0ru4RwayBGArEpvrWgZLTtY=;
 b=biAvrWkitG51LKn3M1lJwgemejTLWLZtXSdkZz823nPYLRalYyFxYVBwYiKM+Tn063
 PVmVDftS3nrdKmEFXVEOkJNKbGRhTYL0MMHCooFSZHFlzy4U2h9UuIwyz3HKtecVbTrt
 /Y6VJzEzj03MQPypph2AkY8Feoumimb5HWUU3tC8/s3LKE8RElfEd4PFY035Y/dpVzJ6
 8b154j4LC8jX+bJblZ1VthOKpVEy5kthym6a+It3VE35HixlsLwdx3RsaFyAEoJ9gqOP
 4AVL+S8EKSjH1v+YXPixRW6HZkeEhYEqcvEU2ePvnKKAaH1BJ3pbYyZg4YfNax5eLqyH
 7lsw==
X-Gm-Message-State: ACgBeo1EYdikiQqcWBAcnVKa+n1L411g4cXrw4VqTLkMftyO1OJPQJO4
 VHPQm+R/wivNCaW7nPr1YQR24aMpnCNd3mDPJnfKMjRNpzSn3hla8Dw/dVJ6Z8YlguNlhB4Exp+
 tJcV800B/rQGoFTwsQqYNWau7FL+G
X-Received: by 2002:a05:622a:1998:b0:343:6452:dbd9 with SMTP id
 u24-20020a05622a199800b003436452dbd9mr11693579qtc.423.1661801364312; 
 Mon, 29 Aug 2022 12:29:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7+GHOS/YfR8FcgwHS7TK7EPgZo+4FuxJBHAlWiiX+pqkpOMQm1MetO1dRBHjQE0m9pcXFNag==
X-Received: by 2002:a05:622a:1998:b0:343:6452:dbd9 with SMTP id
 u24-20020a05622a199800b003436452dbd9mr11693564qtc.423.1661801364088; 
 Mon, 29 Aug 2022 12:29:24 -0700 (PDT)
Received: from [192.168.8.139] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 bs31-20020a05620a471f00b006bb83c2be40sm6788483qkb.59.2022.08.29.12.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 12:29:22 -0700 (PDT)
Message-ID: <99877e918d2154f1322cdecbbea1a5f2cd36c5d3.camel@redhat.com>
Subject: Re: [PATCH v2 1/3] drm/atomic-helper: print message on driver
 connector check failure
From: Lyude Paul <lyude@redhat.com>
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
Date: Mon, 29 Aug 2022 15:29:22 -0400
In-Reply-To: <20220829151451.152114-1-contact@emersion.fr>
References: <20220829151451.152114-1-contact@emersion.fr>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for this! We definitely need more logging like this in DRM. for patches
1 and 2:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2022-08-29 at 15:14 +0000, Simon Ser wrote:
> Sometimes drivers are missing logs when they return EINVAL.
> Printing the failure here in common code can help understand where
> EINVAL is coming from.
> 
> All other atomic_check() calls in this file already have similar
> logging.
> 
> v2: add missing newlines
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index c6abfd3d4b62..4aa05b626b57 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -702,8 +702,12 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  
>  		if (funcs->atomic_check)
>  			ret = funcs->atomic_check(connector, state);
> -		if (ret)
> +		if (ret) {
> +			drm_dbg_atomic(dev,
> +				       "[CONNECTOR:%d:%s] driver check failed\n",
> +				       connector->base.id, connector->name);
>  			return ret;
> +		}
>  
>  		connectors_mask |= BIT(i);
>  	}
> @@ -745,8 +749,12 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  
>  		if (funcs->atomic_check)
>  			ret = funcs->atomic_check(connector, state);
> -		if (ret)
> +		if (ret) {
> +			drm_dbg_atomic(dev,
> +				       "[CONNECTOR:%d:%s] driver check failed\n",
> +				       connector->base.id, connector->name);
>  			return ret;
> +		}
>  	}
>  
>  	/*

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

