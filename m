Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E390A16AD4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 11:34:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E5C10E394;
	Mon, 20 Jan 2025 10:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dtrw5dOO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41EF10E394
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 10:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737369289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uvx0syevJMw2l/8JzAN/gEYx7J/jR696/veETOgWlEU=;
 b=dtrw5dOO4WLHN63Pd+LpA9n+8d4ZdLG5DDh+RU5FE6y79A48vy0CXN2NQYVSBlvZcxtm9/
 k2LyBJgfVlV/uokrhuI2mpPTclTmW0xkHPQhJv+FerZP2lFo1Bvz9wnwQgKoh7vAop6Jw1
 d1M+wmlignNIvxLXscBoyH/0x95N54Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-3Z1Io_mdPOOk3H8xL-h1vw-1; Mon, 20 Jan 2025 05:34:47 -0500
X-MC-Unique: 3Z1Io_mdPOOk3H8xL-h1vw-1
X-Mimecast-MFC-AGG-ID: 3Z1Io_mdPOOk3H8xL-h1vw
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4361a8fc3bdso22242125e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 02:34:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737369286; x=1737974086;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Uvx0syevJMw2l/8JzAN/gEYx7J/jR696/veETOgWlEU=;
 b=V19zRkh3HHFCIT8C7ru4BQt/l6yg1KX39aB87hjcUy/S41EE0Zcx5s1IheWIgeLVnv
 S7eThNWw9TODoBmzPKXaadUfn82AzuTFmz9qERndUj/xHUuCS6UXd8bYWT01A6GlaoqW
 XOxjic7PHxMBQZBDr1LiaoGjhJYTcOvktamiQ35S0dQoP1aUt7Kd71fF0TJMDMFAQ4py
 Dxyr/+nWL2BLmAjV+Va9NNu+WAHLzESogxvV2buY9n2Hypy4SW9M31/H7Dv5kBTnJLdi
 1F5q9trusGOrF37klwuEXtfzHTxwEEOxH525FlkCKo79rw2qkpWcPZW+4yLFjkW6fTs7
 0HlQ==
X-Gm-Message-State: AOJu0Yw15EDNS1l2zDNW2LQz6X/a6DSZTXwS6GUxBIOqMawcDQRWOADu
 vbwhQsNNLJGbUaw1ytpPKfXPJ9TZKy14+AVxUxzbwl95/MX8UGPrq2QWOL7lFief2j153VG/Vt3
 dEf0nrT0Go1tbSlqFMn+f9lRwl2cPIv/S12H5rCO/XECvvsvt2urYGysHw5A+UK3ZdA==
X-Gm-Gg: ASbGncv/jZC1vT6N/hoiviRUAR7SbEA/+GLplGmHVxCNetJ8FTpUkNe+tpR/De8b5/V
 CAIgnsPOAAUE7vEas1PjSv1LeqQeqT6Le8iyHNzDMvcAjWRHjjoHiAeMFDNoshwvNSfaBS9HlNB
 eNDyVjaaE98MYAkdusIXUCEqglyP6gtZJ6wKTzZIu+d/6yyLqdktf2ESdfNshyI9uBaoGBc3inz
 wPclePZ9gnVFmm3Wx/Hy+tJlK/dKCHrBnms703Q3f+e0/XgreuPdqnfILDF/GFkcQDa7L3LuEB8
 WfvOcPulazZy7MmdLrizVyXJ2HauIfJVWg==
X-Received: by 2002:a05:600c:1d19:b0:434:f623:9ff3 with SMTP id
 5b1f17b1804b1-438913e0303mr129150645e9.15.1737369286108; 
 Mon, 20 Jan 2025 02:34:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEb4XyR75QtO8MTt0HvQZuhm5Le4rpfAmd0cJDgcuTcJJ2v1oaeSKgGvn6wEvPvfvdnb1hlZw==
X-Received: by 2002:a05:600c:1d19:b0:434:f623:9ff3 with SMTP id
 5b1f17b1804b1-438913e0303mr129150315e9.15.1737369285729; 
 Mon, 20 Jan 2025 02:34:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3221db2sm9833568f8f.29.2025.01.20.02.34.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2025 02:34:45 -0800 (PST)
Message-ID: <00ea5e84-f80d-4efd-aa44-fee0237120a1@redhat.com>
Date: Mon, 20 Jan 2025 11:34:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] drm/ast: Detect wide-screen support before creating
 modeset pipeline
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250117103450.28692-1-tzimmermann@suse.de>
 <20250117103450.28692-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250117103450.28692-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m6VgfQ2lxOc7gFDfejsKJ3bSI4_ozV8Ih0Jrj9_dg6s_1737369286
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

On 17/01/2025 11:29, Thomas Zimmermann wrote:
> Wide-screen support is relevant for mode validation. Do not detect it
> before setting up the mode-setting pipeline. Gets the function call out
> of the way of other initialization code.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_main.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index bc37c65305d48..037d389ab630d 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -290,7 +290,6 @@ struct drm_device *ast_device_create(struct pci_dev *pdev,
>   	ast->regs = regs;
>   	ast->ioregs = ioregs;
>   
> -	ast_detect_widescreen(ast);
>   	ast_detect_tx_chip(ast, need_post);
>   
>   	ret = ast_get_dram_info(ast);
> @@ -315,6 +314,8 @@ struct drm_device *ast_device_create(struct pci_dev *pdev,
>   			drm_info(dev, "failed to map reserved buffer!\n");
>   	}
>   
> +	ast_detect_widescreen(ast);
> +
>   	ret = ast_mode_config_init(ast);
>   	if (ret)
>   		return ERR_PTR(ret);

