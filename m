Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6069A7E039
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 15:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBFE10E479;
	Mon,  7 Apr 2025 13:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AikOFIAg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE92E10E479
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 13:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744034365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=swDbcea4TipT9nblctrkNfnrLjUIGyAQtn4f7FEMyIM=;
 b=AikOFIAggfwHUw8ZyZl2UG69KtI1IFj/T/BTH6tHm4esgoxnkeWeJkCbmTxZmWzS+5NZ8z
 JJ0IAQQUKkF3Z4CrrnbJ1LKfcVYA/6WkdBtXUYve2PNQpdjs9HRxdpvOvLN0ivU+ApwtP5
 nm54Cv671q9tmFTl8wCyNr5raXomLE8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-1QmCAleMNVmipALd8a4bXA-1; Mon, 07 Apr 2025 09:59:23 -0400
X-MC-Unique: 1QmCAleMNVmipALd8a4bXA-1
X-Mimecast-MFC-AGG-ID: 1QmCAleMNVmipALd8a4bXA_1744034363
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43eea5a5d80so10906845e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 06:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744034362; x=1744639162;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=swDbcea4TipT9nblctrkNfnrLjUIGyAQtn4f7FEMyIM=;
 b=ryxCBaMoJ9OwgRuEWLoJia/1Z3xW3mrFjun2uLDfKArA1wsTDC2a4ocealidw6wfPq
 s2vNBtQjryHiFwS6RdBYn8B+O+E5+NbHRN2Qt8ltN1X1UPcpf0RmknT7fzNFlBn/hMun
 JCpwTGes4BGk3XeWbHEvLBkypgx0Fm15Yf6YwVB3UYcGGFnx1rx80MftKGz8s9e8DLpV
 RjLSnpGxard5w4pq9QTKOw/T2BGZBvpk2IcjhVt8EWbseCfglZeM4L291zTQJ4Dbd3lM
 Tuacqbt3/6FS0FLZ7xYq4GwC1btjKfyV8wTmW1w++lhhOB2CM+VZezZkQZzfyv8O8Xtb
 rpJg==
X-Gm-Message-State: AOJu0Yw8BisJJ0GQp4q3jqnVmlD8A3EGHmVHtgXzyuahWt+biqE45RfJ
 QfK+zi6IRnRud715R8QT/pxO95KfYaaFNpnghk9eGAAHkCquEjknPHPVyFVt3MVfg6/EuuGgQZ0
 sC3yKOgevvepJ4hD9RoN3/SPC0WUR66MOs1oVbSc0sD3/1P2fsGQetxWv73ezZ2ngqIHG9jPcUg
 ==
X-Gm-Gg: ASbGncudsrM0L47TPiVFGBJ+eE6KULqENmMn480jOoUBYbavG6EteRmFmdlpOxUio5H
 60Q9NzzMEZIVhf6a5ZDo6MaGpUv5UKGqgWA6xSOy4p6KU+wDXWfvJhXaVN/HYxDPc2eEpDBdomw
 rKCS8ukPmfGKzD7VgkYatugY5jLTL2jKMwUDRranXXvN5IeB90HRGbm8ZwFKmm5XmFADkUB0utw
 Oygln++gaxi6Q5RHCFNivnMEAdg0+fejrJbDOeWzvO80nOm5FyRNeua5xqkatIfb+RFLgZGf0Q6
 RpVTt5O5vYFjHtnx7ZxgWSon/SzB7YFoSt91qp7p+Rg+oWtFmiq0PjE=
X-Received: by 2002:a05:6000:2489:b0:391:4873:7943 with SMTP id
 ffacd0b85a97d-39cb35aaaeamr10085984f8f.32.1744034362093; 
 Mon, 07 Apr 2025 06:59:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHw2emtkUQsGZRx29I6DAM0QANpQ6u2DCnwRNVRC+w8OR50X1TALVDqwjuf7VIZBgHdswRKsQ==
X-Received: by 2002:a05:6000:2489:b0:391:4873:7943 with SMTP id
 ffacd0b85a97d-39cb35aaaeamr10085951f8f.32.1744034361427; 
 Mon, 07 Apr 2025 06:59:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec3669002sm132582065e9.33.2025.04.07.06.59.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 06:59:20 -0700 (PDT)
Message-ID: <86cfa8ab-8f20-4e29-81c8-358012261270@redhat.com>
Date: Mon, 7 Apr 2025 15:59:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/simpledrm: Do not upcast in release helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org
References: <20250407134753.985925-1-tzimmermann@suse.de>
 <20250407134753.985925-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250407134753.985925-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5hZbOre1QEYSVCF2zgYgiuuRqggf4Tw5tvAQQjFS1y4_1744034363
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

On 07/04/2025 15:47, Thomas Zimmermann wrote:
> The res pointer passed to simpledrm_device_release_clocks() and
> simpledrm_device_release_regulators() points to an instance of
> struct simpledrm_device. No need to upcast from struct drm_device.
> The upcast is harmless, as DRM device is the first field in struct
> simpledrm_device.
> 
Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 11e8f5fd223b ("drm: Add simpledrm driver")
> Cc: <stable@vger.kernel.org> # v5.14+
> ---
>   drivers/gpu/drm/sysfb/simpledrm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
> index cfb1fe07704d7..78672422bcada 100644
> --- a/drivers/gpu/drm/sysfb/simpledrm.c
> +++ b/drivers/gpu/drm/sysfb/simpledrm.c
> @@ -275,7 +275,7 @@ static struct simpledrm_device *simpledrm_device_of_dev(struct drm_device *dev)
>   
>   static void simpledrm_device_release_clocks(void *res)
>   {
> -	struct simpledrm_device *sdev = simpledrm_device_of_dev(res);
> +	struct simpledrm_device *sdev = res;
>   	unsigned int i;
>   
>   	for (i = 0; i < sdev->clk_count; ++i) {
> @@ -373,7 +373,7 @@ static int simpledrm_device_init_clocks(struct simpledrm_device *sdev)
>   
>   static void simpledrm_device_release_regulators(void *res)
>   {
> -	struct simpledrm_device *sdev = simpledrm_device_of_dev(res);
> +	struct simpledrm_device *sdev = res;
>   	unsigned int i;
>   
>   	for (i = 0; i < sdev->regulator_count; ++i) {

