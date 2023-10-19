Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5837CF252
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 10:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86D310E0B4;
	Thu, 19 Oct 2023 08:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67F510E0AC
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 08:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697703630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6JocWFvICwQAu51spYQ9UkYkn/vFA+DgKSrhAcOeN84=;
 b=HPqAOsmeq6IymvWkm9YEcOzKvts+k3fgyvU6aGKjgQ1PvOFIGWheWXO0hYVK7xDqzsbx++
 WxHUrmj+NxySPYefvdhav69BQFsvufrJbcAYeZkMQbk1n7CLT1NAHl8Ps2h4Ho1ZJFYQWq
 0yCqG1PMgj/jA2k4EfHIgDzJNTvFHCs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-Oh0ubHBFMk6Kwoni5ZL2Ng-1; Thu, 19 Oct 2023 04:20:28 -0400
X-MC-Unique: Oh0ubHBFMk6Kwoni5ZL2Ng-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9c7558b838aso79559866b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 01:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697703627; x=1698308427;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6JocWFvICwQAu51spYQ9UkYkn/vFA+DgKSrhAcOeN84=;
 b=e20WjEV0Z68FPKApVgmgzykqGi4PBC1snEkI+yY7F4mYEwc1lPyfKkd9ZM02OKZYx2
 5mO9xoDZcOsvi63zhGI6tiwyRernxk4rt3HHjWh4XWPH1aXJaV2oB15QwlI9gI91Uh0V
 XKjbw8htzgYXeevnU97ORnoyBdP8+Og7C95kF7cQ3d3g4di02n/c5VJ8iOUnaLJ1xr2F
 PT2PffHIqEUL967Z4quYrnSBv2VP1WnH7/kTrpK0LKIFdcz0KQeLpupmTZvql6KOdwdz
 inj6zo87OpjQ9SteCovZrbu1LJWH23R04RNqhodRah3VFpVfPWUq/Lmaeo80JMPG/3kk
 BY+g==
X-Gm-Message-State: AOJu0YwCkv5XQBM71Z/g1BmAX+dHgYjhygbF6pO745q0JU+fp9okCcKT
 q8Rze2XuHiS3XS2XnFmmblDCun0peqfmmFJ3wVTaYpGa43H5ydHkTVEdBN7MK1N84VOm8rq/Qrm
 4urRsw4v035MQqSGvOxuYk7qFwWTyQfA4WkZtbCM=
X-Received: by 2002:a17:907:7b89:b0:9c5:844f:a7f4 with SMTP id
 ne9-20020a1709077b8900b009c5844fa7f4mr1416922ejc.35.1697703627224; 
 Thu, 19 Oct 2023 01:20:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTnMKXbHzCyh0CpWl8FqNt59EDAGlNA5Kw8X7mQsKbdb09VixEWWMGkJGLb9zHxDpsNDg2ag==
X-Received: by 2002:a17:907:7b89:b0:9c5:844f:a7f4 with SMTP id
 ne9-20020a1709077b8900b009c5844fa7f4mr1416904ejc.35.1697703626942; 
 Thu, 19 Oct 2023 01:20:26 -0700 (PDT)
Received: from localhost ([193.32.126.216]) by smtp.gmail.com with ESMTPSA id
 rn1-20020a170906d92100b0099d45ed589csm3040281ejb.125.2023.10.19.01.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 01:20:26 -0700 (PDT)
Date: Thu, 19 Oct 2023 10:20:25 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Subject: Re: [PATCH v5 9/9] drm: ci: Update xfails
Message-ID: <clpne3ctm2aptl6whv4nxqsjcrqfggkdckocusxjksjirvflsm@6dppwwlqg4bt>
References: <20231019070650.61159-1-vignesh.raman@collabora.com>
 <20231019070650.61159-10-vignesh.raman@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20231019070650.61159-10-vignesh.raman@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: daniels@collabora.com, emma@anholt.net, gustavo.padovan@collabora.com,
 linux-arm-msm@vger.kernel.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, david.heidelberg@collabora.com,
 helen.koike@collabora.com, linux-mediatek@lists.infradead.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Oct 19, 2023 at 12:36:50PM +0530, Vignesh Raman wrote:
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
> new file mode 100644
> index 000000000000..8b12e97d59f3
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
> @@ -0,0 +1,9 @@
> +# https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1013138
> +# https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1012894
> +# https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1013011
> +# https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1013055
> +kms_cursor_legacy@cursor-vs-flip-atomic-transitions
> +kms_force_connector_basic@force-edid
> +kms_force_connector_basic@prune-stale-modes
> +kms_prop_blob@invalid-set-prop
> +kms_prop_blob@invalid-set-prop-any

We agreed recently to provide more context to flakes going forward, see:
https://lore.kernel.org/dri-devel/ax6tspeffujmk2vpvh6rwclqkkavpezvcubra25vs2ev7f5njs@2rpnycg2rgnj/

I'll send a doc update to make that formal (and discuss it at XDC if needed)

Maxime

