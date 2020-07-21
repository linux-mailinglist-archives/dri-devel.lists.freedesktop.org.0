Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E90D228434
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 17:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027976E2B8;
	Tue, 21 Jul 2020 15:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6ED36E1C4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 15:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595346627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T1eqkdT+65WSXffQEgvHX8BA45HzVx3nhgyMOFl0KCM=;
 b=UP7zCLnnpowVd6qJFEsLetQAX3K9eAXa2xNxOktoGGz4vv9a5TKhepCADUcl2fy3UIp3lp
 P8Dr3wfQst4Vh5DpmCAjzxAbWGIn0TZn6ZBJSYTgUA3MCci96srkwom2LIXzfqDifh1/pL
 QMfZ2UTEQtyEgqB6ynjpg6FQBXIUN/s=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-k_fTXSZ8MBya_p6JknmMjA-1; Tue, 21 Jul 2020 11:50:23 -0400
X-MC-Unique: k_fTXSZ8MBya_p6JknmMjA-1
Received: by mail-qv1-f71.google.com with SMTP id j18so12646165qvk.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 08:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=T1eqkdT+65WSXffQEgvHX8BA45HzVx3nhgyMOFl0KCM=;
 b=fCtoXmd/mDgGrx8gxD5xmFEyQRU5xZUS1iN+v/5JS6M4jGrTzTDLuArK6YcHF/4Gdu
 PEeob6G6zcLUnZ8gRz2SiAXOWiu4aJFSKYId1g1xIbxvVpsINPwKXItCLAlm46q5L4qv
 1M2qxSdKfMXsSZjMxjmGfXN0xta8MM5HxcdHuo90qAHHLDssfWapSmDHK4a3Qqs61sRr
 t73AoVJ47gNatOUW8DfPxO9LMvkqzTQNFVUpT3nDv+x3sSH1+RRpI5iWwZafBrHNp3zK
 jiqOz+2och/bKDjsxXJQdcpjtsyNazADZndUXrBlus5arh1IuVuh7OzYofFOVEMjPKU2
 i0+w==
X-Gm-Message-State: AOAM531a7cjvTc0B8q7mRFVezge2AxmY/a0irU4pD5WX+bVkAZVD48oa
 rQik1iEGGol7ubxyw0kIOUWCvH0AOyq11zu3P/AOkVldSb4PvO2qPwE45kWMUJ6J90XLkz9C1QQ
 Wkzk1dF+8uteT7ayUC/uJuLdQjEFs
X-Received: by 2002:aed:2f46:: with SMTP id l64mr29601845qtd.1.1595346622843; 
 Tue, 21 Jul 2020 08:50:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRfxmS1vh9brmkhzM4t8kBfNgHEn/slIPecHCsCE4ib2gN5E/VVud9VW0vl+hQQ4YSUuRZ2Q==
X-Received: by 2002:aed:2f46:: with SMTP id l64mr29601827qtd.1.1595346622609; 
 Tue, 21 Jul 2020 08:50:22 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id m17sm202763qtm.92.2020.07.21.08.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 08:50:21 -0700 (PDT)
Message-ID: <4e90a54c61e3ecb19802d7ea811c58a51ac457ed.camel@redhat.com>
Subject: Re: [PATCH -next] drm/nouveau/kms/nvd9-: Fix file release memory leak
From: Lyude Paul <lyude@redhat.com>
To: Wei Yongjun <weiyongjun1@huawei.com>, Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Dave
 Airlie <airlied@gmail.com>
Date: Tue, 21 Jul 2020 11:50:20 -0400
In-Reply-To: <20200721151701.51412-1-weiyongjun1@huawei.com>
References: <20200721151701.51412-1-weiyongjun1@huawei.com>
Organization: Red Hat
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
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
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Thanks!

On Tue, 2020-07-21 at 15:17 +0000, Wei Yongjun wrote:
> When using single_open() for opening, single_release() should be
> used instead of seq_release(), otherwise there is a memory leak.
> 
> Fixes: 12885ecbfe62 ("drm/nouveau/kms/nvd9-: Add CRC support")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/crc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c
> b/drivers/gpu/drm/nouveau/dispnv50/crc.c
> index f17fb6d56757..4971a1042415 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
> @@ -706,6 +706,7 @@ static const struct file_operations
> nv50_crc_flip_threshold_fops = {
>  	.open = nv50_crc_debugfs_flip_threshold_open,
>  	.read = seq_read,
>  	.write = nv50_crc_debugfs_flip_threshold_set,
> +	.release = single_release,
>  };
>  
>  int nv50_head_crc_late_register(struct nv50_head *head)
> 
> 
> 
-- 
Cheers,
	Lyude Paul (she/her)
	Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
