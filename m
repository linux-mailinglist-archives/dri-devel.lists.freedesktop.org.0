Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 100721ED44E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 18:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA1289D4A;
	Wed,  3 Jun 2020 16:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D44889D4A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 16:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591201579;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dMqwWWzHo3fy38RH5JowEjmFezZIYfiA+LiXUUe2ODM=;
 b=ie3KETdh9nSDh4/d9MpxL0EnozePPXFXtCnQbQjeLnw1eMBNoBrucbd92Wv7EnKBU6l440
 QsItpl7R5nu9ZaIUP82hVqy4yW42CE/sebS1OEtOwcEP0E/Vc49+Yopd0ZNvECX5ML5NZ+
 BvbIZXXVj1uygyXoNazBcjE7gdeunBY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-KtABxM4tNTuQDvY-5XirXQ-1; Wed, 03 Jun 2020 12:26:16 -0400
X-MC-Unique: KtABxM4tNTuQDvY-5XirXQ-1
Received: by mail-qt1-f199.google.com with SMTP id h49so2326785qtk.10
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jun 2020 09:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=dMqwWWzHo3fy38RH5JowEjmFezZIYfiA+LiXUUe2ODM=;
 b=f2+ExjmWDxvNKSYKh90xnNbxhZqgSQe5QYpmeJ0q0M9agvTbzgxVqIMP9SRq+GiatX
 P725JrXL2iwj3lWBWzOVvkd1x3DTj83rZkDMHE/m8DnLQMFgr9BLPz7pHgQjIfwX5Dik
 O+nlXhqenJSsL0ReI8I+2or2x4/tsfPDTfaAUSN78ztqycx1Jp32KSHzCtEwyd5fL1Wp
 rxy53vOGsS//UO0l1W20HeectzANTw31l27F0SIJGZHJ9U1jQonuyAMYVulsaybQ/MCR
 Lt53SrF56+XeLj8bU/MzdJfq4JsKY7DZcXe1Ooiry0FlsHEsuKzb00kP7YLaiARc+TwP
 dv3Q==
X-Gm-Message-State: AOAM532CCaWlhEVuj9BcEGYCnowfWdYYE6OQKsh/C0UdvCLqVLCDI265
 exelDE2LEH9frFKrI8URlL418RkuhH1JFwb0aZRnOREdlVCi3lfk+i64tce8zRBESZoQgBTiBia
 Mwb+gsjou1gUtaQCSE/ikpzFCayPY
X-Received: by 2002:a37:8302:: with SMTP id f2mr459422qkd.220.1591201576106;
 Wed, 03 Jun 2020 09:26:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKqhMLHPZcgjFr9XB7c/kNuGHGvZZ0lp+ttkkbotvsK/G4TlijsRIMnW9BziRubgOsnvwXrQ==
X-Received: by 2002:a37:8302:: with SMTP id f2mr459396qkd.220.1591201575825;
 Wed, 03 Jun 2020 09:26:15 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (static-173-76-190-23.bstnma.ftas.verizon.net. [173.76.190.23])
 by smtp.gmail.com with ESMTPSA id a38sm2632175qtb.37.2020.06.03.09.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 09:26:15 -0700 (PDT)
Message-ID: <4c6a9fba546fc9a8c63d9669cfd4876efc903786.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/dispnv50: fix runtime pm imbalance on error
From: Lyude Paul <lyude@redhat.com>
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
Date: Wed, 03 Jun 2020 12:26:14 -0400
In-Reply-To: <20200520104750.21335-1-dinghao.liu@zju.edu.cn>
References: <20200520104750.21335-1-dinghao.liu@zju.edu.cn>
Organization: Red Hat
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi! Was going through my email and found this from last month, it's a bit late
and someone might have reviewed/pushed this already but just in case:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Wed, 2020-05-20 at 18:47 +0800, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> the call returns an error code. Thus a pairing decrement is needed
> on the error handling path to keep the counter balanced.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 6be9df1820c5..e670756664ff 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1123,8 +1123,10 @@ nv50_mstc_detect(struct drm_connector *connector,
>  		return connector_status_disconnected;
>  
>  	ret = pm_runtime_get_sync(connector->dev->dev);
> -	if (ret < 0 && ret != -EACCES)
> +	if (ret < 0 && ret != -EACCES) {
> +		pm_runtime_put_autosuspend(connector->dev->dev);
>  		return connector_status_disconnected;
> +	}
>  
>  	ret = drm_dp_mst_detect_port(connector, ctx, mstc->port->mgr,
>  				     mstc->port);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
