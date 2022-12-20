Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7E8651CE5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 10:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026E210E339;
	Tue, 20 Dec 2022 09:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C8810E339
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 09:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671527437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nkva43Ev6FmONs/91WyhlWJwflJzPv43uZcJFYvlalU=;
 b=JzBWdQOszQ7DlHvTb0wSn8Tf1GCTLLK10xId6uF2YQIQ914Kxxi9ub5Cam8pK0D55BVThL
 g4zTUdGjkSvhx77Fjh4k3+fkswYcSzF01TsVZK4g2GIY/ATw8im/zjRR7F5EGAVOeyEOTs
 ncE15wSmZIKhfZaj7UBYA8UJCr4TU/c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-422-2aRaKWr-MXyhm9LA2gRzWA-1; Tue, 20 Dec 2022 04:10:36 -0500
X-MC-Unique: 2aRaKWr-MXyhm9LA2gRzWA-1
Received: by mail-wr1-f70.google.com with SMTP id
 h5-20020adfa4c5000000b0026755f9b55eso158360wrb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 01:10:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nkva43Ev6FmONs/91WyhlWJwflJzPv43uZcJFYvlalU=;
 b=ijACwjwbfDoup+9duGM2yK/QaisO2scC/w7kDZHHNBkpH/8fMhndE8gjfimdh0wcrv
 XJ/K0exjigh2DDwk4/a6/l8+OKUwQzdISiw+xBi1LdtwWctQlx/lU0oCwGt23y3cSdzQ
 R6ynk05iMWFMAnMLR79cN2iBdCLQSU/29IluO3pkF8JfA3/eBr+piL6kpIED4xnhk9rc
 tipLooutkgGNPyIqfK46htKHKNd2uAPGltfCg//ieZpqHkaEd5o9GslE+wkYlGqBBGdo
 xX5Ojwj+UVuJRou+GCpBw6vU6AC6lPUraHkGF87ZN+BmUxiLCKacUr/cWHp4iKdljxIf
 x13w==
X-Gm-Message-State: AFqh2krVp44misjoqtVAZWn5khCUUHZOC4/zVee5EKgw0KZIhrEcRQxA
 BkUEhpXtguXwCbv1tUKzlSMCz1mQVuQPDBksJJk1Bwl645xDoe3If/B581UVg7qtYH8oxGwXyqi
 ldJOo5R6/LMb0adPNOXmaLTde33yO
X-Received: by 2002:a5d:624a:0:b0:242:19b3:67 with SMTP id
 m10-20020a5d624a000000b0024219b30067mr748875wrv.37.1671527435422; 
 Tue, 20 Dec 2022 01:10:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvZ4T3pjgbBye4AD0pnUB9As/CnLPdlMjMDQrxm4f9mLfnMBPQihgpuK1r6jSAdZ8wsH7ZV9g==
X-Received: by 2002:a5d:624a:0:b0:242:19b3:67 with SMTP id
 m10-20020a5d624a000000b0024219b30067mr748861wrv.37.1671527435215; 
 Tue, 20 Dec 2022 01:10:35 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v5-20020a5d59c5000000b00241fea203b6sm12177113wry.87.2022.12.20.01.10.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 01:10:34 -0800 (PST)
Message-ID: <1ba311d8-efe5-c3f0-761e-1b5695dd5ba2@redhat.com>
Date: Tue, 20 Dec 2022 10:10:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 01/18] fbcon: Remove trailing whitespaces
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de
References: <20221219160516.23436-1-tzimmermann@suse.de>
 <20221219160516.23436-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221219160516.23436-2-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/19/22 17:04, Thomas Zimmermann wrote:
> Fix coding style. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

