Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF26B3F5EA
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 08:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DAAF10E18C;
	Tue,  2 Sep 2025 06:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WHCRJdHX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4977110E18C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 06:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756795948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HqFz/b1D2ZkTGGjH0REC0Wiu8GqG713bP1DilygVybY=;
 b=WHCRJdHXWzV0kB3Z+O9Q8YHEgi2Aa4fV/vX0xXgXXgg+f6qmrukrJZP0Aw7T398HN5s6s3
 WfVrFPRoEzBmZhIiZ99EvL/ElZbBqBIMciaqlF7g1rkPlM1Stm4S7qwCTu6RoI4EJ60IT7
 Oismi5S18Lv2TKbvrs6WhL3Y23gRboY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-8JSbDQ6kMq-RtGjTtwmMfQ-1; Tue, 02 Sep 2025 02:52:25 -0400
X-MC-Unique: 8JSbDQ6kMq-RtGjTtwmMfQ-1
X-Mimecast-MFC-AGG-ID: 8JSbDQ6kMq-RtGjTtwmMfQ_1756795944
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45b8a2b9fcaso15175265e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 23:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756795944; x=1757400744;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HqFz/b1D2ZkTGGjH0REC0Wiu8GqG713bP1DilygVybY=;
 b=SBiVwC8zq+w1Mb0uxv46ykMKcF85LOuKN97rbCWdGxG1tTfxoTF6xmxU51oXFXixDJ
 T+jNjJzRaFjMPaE3VWKZDdTZG+xOngiJpygVvVmQvJNR6/3p9wkH4So3lVHBf5r36DPQ
 FLZzo4bzsOoSKFdOzYjrjVqWinBGzShlpJI1xktC9QsYIPkCejBhS9qskoifMAUJsv3d
 V4PBgXtDsTpDkdFka+wM01pdkJ5aIcUceCnOSbehunOenNdmzLrM/O4v2YuDwCmPZEoX
 id8zGBrV2zN3pPbo5BHVjif/dG4IkD+HtTaLoKVksSFY3kg82MGhzPQ5pGpKpl9OLduf
 EYcQ==
X-Gm-Message-State: AOJu0Yw+yob01BXbTwTlQpYykWIOSF4L8Zhv9pu3ctF5fZ6a8FlIQs1e
 CrIAYhc9HmTZB5LVAoHSAJeagWMCVaHxjnjGPdJfa1xVkhmvDu1qPUX1wqcv015tKZ2t2/CyV/P
 wmFDr4VyB6iL8yFuccR+hDL2TfbaJgi2pYIRsTn3OllrhOhkbGdIzkEw0rjqDHF6wF8kmaw==
X-Gm-Gg: ASbGnctF44gPQfFsgiQtrJsW0SKaB6934ELnmGTVKuLQsamHaRvSd75zWYOv+ScDZ3h
 q9Usff+I9Hl39rcyZi8RCvzxi2CY0Sfp+IBYlwMW+t3Uw2NGzZbj9weZzh4yYykBZwHSmz0ANHm
 N3/12bJ0fciz0LMW1mK0SzPmu+7jcLqKCJY9o6YjhPa0Py1lZ0tHCwein/8wdBdjeuF/mTr2ye4
 hx4Bv4IFCCZq3cpW7vu70ZcAGAOHLRRfSUm1kmVacRQ1O/JtOAMsp+WOAYjRErOdKcZ+Cicu2HU
 N80nBiD/O56YytNLoHjSTpo8JL7XFWd6MqPxhfc4VPZHD75miby0JBodQkt6hCnBBRP3YxYjW2b
 jUXc=
X-Received: by 2002:a05:600c:4512:b0:45b:4282:7b60 with SMTP id
 5b1f17b1804b1-45b8558beb7mr82459855e9.34.1756795943809; 
 Mon, 01 Sep 2025 23:52:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6ufs0KOtvRPVClgRB0a0vAKJqJ0ZI6xH455NneDzjC+jyLIdW1/nHbiqp+FU7NVH7Rdyy/g==
X-Received: by 2002:a05:600c:4512:b0:45b:4282:7b60 with SMTP id
 5b1f17b1804b1-45b8558beb7mr82459635e9.34.1756795943326; 
 Mon, 01 Sep 2025 23:52:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf33fb9d37sm18500404f8f.49.2025.09.01.23.52.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 23:52:22 -0700 (PDT)
Message-ID: <5119f7d8-77f5-409f-a83e-fae385e721ea@redhat.com>
Date: Tue, 2 Sep 2025 08:52:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] drm/ast: Do not print DRAM info
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20250826065032.344412-1-tzimmermann@suse.de>
 <20250826065032.344412-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250826065032.344412-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xKUm72qBf3tBsRUL0hCnGBQDT48QCUwYiw_CUEdMKUo_1756795944
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/08/2025 08:49, Thomas Zimmermann wrote:
> Most of the information in the DRAM status output is irrelevant; some
> is even wrong. Only the DRAM type is used on some older models. Drop
> the output entirely.
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_main.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index 44b9b5f659fc..830f1c5fe893 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -355,8 +355,6 @@ struct drm_device *ast_device_create(struct pci_dev *pdev,
>   	ret = ast_get_dram_info(ast);
>   	if (ret)
>   		return ERR_PTR(ret);
> -	drm_info(dev, "dram MCLK=%u Mhz type=%d bus_width=%d\n",
> -		 ast->mclk, ast->dram_type, ast->dram_bus_width);
>   
>   	ast_detect_tx_chip(ast, need_post);
>   	switch (ast->tx_chip) {

