Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EAE5105E0
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 19:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E2410E3BC;
	Tue, 26 Apr 2022 17:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E091510E03E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 17:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650995200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UyHFMRMYec8pKum11uE5p2KKdtxqjNqZDXrySSGMmcw=;
 b=hU3O0TjXEQjdQiMl/o2xHQmnnHBOe9QpR/sppPIGZ1Sf0hUdCQiYw+2M5BjksnaLPEzP/r
 wKk/CuLQEFmDYcbeRXSeperEmRBS1aE8bz4A1fe4Eo+QE7VLpIQXMG8LFw9SBukfI3nf0j
 k1UH2osGspCJ2ln0fraq25QRmRko07s=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-M77oKCdUOfubbHJG24BC_g-1; Tue, 26 Apr 2022 13:46:39 -0400
X-MC-Unique: M77oKCdUOfubbHJG24BC_g-1
Received: by mail-qk1-f197.google.com with SMTP id
 u6-20020a05620a430600b0069c0f5ad4e2so12227691qko.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 10:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=UyHFMRMYec8pKum11uE5p2KKdtxqjNqZDXrySSGMmcw=;
 b=p/CH3G2njVN6LjFnSMZntJKu0L9cwqemHcrlA82nC4XuO1BtdMhkYFQiaVgvgNiN43
 vMdfrl8IjzEJreB7AFuhGKmL5vtLorLtJkIj24a5ArBynP+kNp9wwgfdgrh7vrXzOWga
 e2IRA9CoejexbitIAwJLbQtkc6lc10i7woqHk2AqLpcZxBgmlGzswGA2ake/jgIuJyGx
 VShqwOETDkyq+wTOjnHmEWatshDe1bovvXWRfMebVGR9E3bszPByeDCmUAnTfBn7wbuv
 o0pm1qwCaf2eyJG1HBQqbnKRrRmpR8ybxpToA1a5CkybitSQvLXxi583M3QHmAGAKyXW
 3E4w==
X-Gm-Message-State: AOAM5310y9BoBrP1UNN1saTgSEY6QRCfgFbVPbMERZVnmPVVpsLOgkzG
 kf4ie7imFt+9j3I6a75qH3Xgd4foha7aUM0oMY9vBM1/EAbxxmPL9z09RCQA1LxDyJ7NQ0dx3rg
 8lXwCVse0qFSxPoR9CbtlbIfXdOOI
X-Received: by 2002:a05:6214:c4d:b0:449:7011:56d0 with SMTP id
 r13-20020a0562140c4d00b00449701156d0mr17055887qvj.70.1650995199259; 
 Tue, 26 Apr 2022 10:46:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytQo4guo50H9GZxl1ELWFz7ma3vpp9ula5MxUUZOqiIR/U1tsZlJzmD9Gpb2jw0WaPhaKbqg==
X-Received: by 2002:a05:6214:c4d:b0:449:7011:56d0 with SMTP id
 r13-20020a0562140c4d00b00449701156d0mr17055867qvj.70.1650995199030; 
 Tue, 26 Apr 2022 10:46:39 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 v7-20020a379307000000b0069c0a2afc55sm6966783qkd.123.2022.04.26.10.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 10:46:38 -0700 (PDT)
Message-ID: <1c11c3b9647829e197fb262c4afb66739fc7eca4.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/disp/gv100: make gv100_disp_wimm static
From: Lyude Paul <lyude@redhat.com>
To: Tom Rix <trix@redhat.com>, bskeggs@redhat.com, kherbst@redhat.com, 
 airlied@linux.ie, daniel@ffwll.ch
Date: Tue, 26 Apr 2022 13:46:37 -0400
In-Reply-To: <20220425130050.1643103-1-trix@redhat.com>
References: <20220425130050.1643103-1-trix@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push upstream in a moment

On Mon, 2022-04-25 at 09:00 -0400, Tom Rix wrote:
> Sparse reports this issue
> wimmgv100.c:39:1: warning: symbol 'gv100_disp_wimm' was not declared. Should
> it be static?
> 
> This variable is only used in wimmgv100.c.  Single file variables should be
> static.
> So use static as its storage-class specifier.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c
> index 89d783368b4f..bb4db6351ddf 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c
> @@ -35,7 +35,7 @@ gv100_disp_wimm_intr(struct nv50_disp_chan *chan, bool en)
>         nvkm_mask(device, 0x611da8, mask, data);
>  }
>  
> -const struct nv50_disp_chan_func
> +static const struct nv50_disp_chan_func
>  gv100_disp_wimm = {
>         .init = gv100_disp_dmac_init,
>         .fini = gv100_disp_dmac_fini,

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

