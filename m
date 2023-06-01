Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C08B971A378
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 17:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE7210E578;
	Thu,  1 Jun 2023 15:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34C210E577
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 15:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685635135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ol2VrA3MBxjSHCAQgCh55CsBJm+rZHfsDaePIVKvX14=;
 b=X5armU+6MJwDaiwu+8tZ7/sMOTLBz4Pu29CoRDWt/675xAP2WIaWnNbUOI6bXuEz33xwJu
 yXUxM3/BKbjnbzch/dkWTBdywx8zblnkVcx9vxfCiOU/uu99RAsG455cnIgMdNKVLlKkgi
 0O2U1Q6zQk58gsT6ptLN9jxobKVuN+g=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-IcYEpLx4NfmwDYRoujgG8w-1; Thu, 01 Jun 2023 11:58:53 -0400
X-MC-Unique: IcYEpLx4NfmwDYRoujgG8w-1
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-397f122786fso796330b6e.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 08:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685635133; x=1688227133;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ol2VrA3MBxjSHCAQgCh55CsBJm+rZHfsDaePIVKvX14=;
 b=cYGlHMph0W2Cbrjd18KMDEAFjg3MgY7c6KQYSiou2V+RsoAtA5VLwKTaoQ7SXD+qEi
 w5VVSHMWpf/686j2yqJ6OlQ2EufjnFcYaWCmEJ0XXa0WrvPELlh9agFuEensHIo04Jbp
 09br8tQCcefuJvmbcqEat4UoK8LQlir+necaUGbH+LT9Dml7+LM3Mnla2Z/CbPzRhrZo
 7KAAIbhPEnL2WLUGdWfrhMne5BECHNKq3VACQ71oOXet9wajbPE4w/8uCPP5e7MiGsnX
 OQOrW2A4UcG/TXYk9jToBQ8jRKvxiN61+H0h5qFNEYw0+tas0iXtt9+p20sjVTos5v+/
 R8Hg==
X-Gm-Message-State: AC+VfDyjnhadTTE6JeDY6HdDhho6ZwkgR2l51zll4cgyzp+TiPfdGWF5
 lC043b6SNnvv5yrJm4s8BdjVdU76Ifzpqg7CYlY7Aay6qFGHbwIs8MWlHH9TbWPYwz8XaehsHu4
 PczKZhC+BmvM/nH1/PDpZS8K7XYo=
X-Received: by 2002:a05:6808:1526:b0:394:41e7:5719 with SMTP id
 u38-20020a056808152600b0039441e75719mr9088576oiw.40.1685635133011; 
 Thu, 01 Jun 2023 08:58:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4o53SioLIxrQWbrVVF62wXGz1rBcPOl9Niil0Fjck0toG1YH6XCucHTghz0cHYxCDg9CGKLg==
X-Received: by 2002:a05:6808:1526:b0:394:41e7:5719 with SMTP id
 u38-20020a056808152600b0039441e75719mr9088558oiw.40.1685635132757; 
 Thu, 01 Jun 2023 08:58:52 -0700 (PDT)
Received: from [192.168.9.16] (net-2-34-28-169.cust.vodafonedsl.it.
 [2.34.28.169]) by smtp.gmail.com with ESMTPSA id
 v10-20020a0cf90a000000b0062627f71b07sm4446227qvn.125.2023.06.01.08.58.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 08:58:52 -0700 (PDT)
Message-ID: <3475be3b-11d5-96fe-6bc4-26d0e3a270df@redhat.com>
Date: Thu, 1 Jun 2023 17:58:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] accel/ivpu: Use struct_size()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
References: <0ae53be873c27c9a8740c4fe6d8e7cd1b1224994.1685366864.git.christophe.jaillet@wanadoo.fr>
From: Marco Pagani <marpagan@redhat.com>
In-Reply-To: <0ae53be873c27c9a8740c4fe6d8e7cd1b1224994.1685366864.git.christophe.jaillet@wanadoo.fr>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023-05-29 15:28, Christophe JAILLET wrote:
> Use struct_size() instead of hand-writing it. It is less verbose, more
> robust and more informative.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Marco Pagani <marpagan@redhat.com>

> ---
>  drivers/accel/ivpu/ivpu_job.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index 3c6f1e16cf2f..0a09bba8da24 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -289,15 +289,13 @@ ivpu_create_job(struct ivpu_file_priv *file_priv, u32 engine_idx, u32 bo_count)
>  {
>  	struct ivpu_device *vdev = file_priv->vdev;
>  	struct ivpu_job *job;
> -	size_t buf_size;
>  	int ret;
>  
>  	ret = ivpu_rpm_get(vdev);
>  	if (ret < 0)
>  		return NULL;
>  
> -	buf_size = sizeof(*job) + bo_count * sizeof(struct ivpu_bo *);
> -	job = kzalloc(buf_size, GFP_KERNEL);
> +	job = kzalloc(struct_size(job, bos, bo_count), GFP_KERNEL);
>  	if (!job)
>  		goto err_rpm_put;
>  

