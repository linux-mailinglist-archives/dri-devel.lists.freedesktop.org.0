Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AA35EF6E9
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 15:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD07E10EA8A;
	Thu, 29 Sep 2022 13:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C564210EA8A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 13:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664459377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eDj3vCjNY/GXTAjSEdDIheCN/STb1Ji3Xk3z3fdjZsA=;
 b=hIzzH+DGYW31lZf9heyQU2Qp0Rm6EmZZ8+7AM4vfj/d6Z8/44edlOnVSpy5Zsvvr1SoVkp
 buDOPoCfpgNqMMk0rrG8veB9OmfuD8QCx8WsMR4ZLlk57YI2vC/lknXopou+iU9p6vS7gy
 cWVmWJNzXZKKrxZN97zgHtUE1kL7zW8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-440-U0ZqFkFIOkyce_IrSisOfg-1; Thu, 29 Sep 2022 09:49:37 -0400
X-MC-Unique: U0ZqFkFIOkyce_IrSisOfg-1
Received: by mail-wr1-f71.google.com with SMTP id
 v22-20020adf8b56000000b0022af189148bso561320wra.22
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 06:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=eDj3vCjNY/GXTAjSEdDIheCN/STb1Ji3Xk3z3fdjZsA=;
 b=KwkOyzlIgKI/6z8b/c8jPVHvjnLMdfFnO0UfX7w9p41aw98GYmfZ/4qysk7wNXfXRn
 gg2YuJezqRjjCgGM09qYPSlWYLvaC5PSh9nBIM07OysbPfD3nIAIXDQ40YP/qhr4HsJI
 vsKzWEU/kmpL2ynZ9AgXy6Jb4wJrchiCEHWhR5iihD3xdUTb2/PAlwilXQo6h7ZAP2V6
 XiqYPK6MEgUP2I/DvTcI3OjKIs5Z0KrqKBosbcwSqOm+2qO8uylTv0q5tX9VhKKGbwxH
 NkPjc/U3nTUNpXz5GZ6sEnL0SiI3EQXH2pTRLipTKg0/0vjOO2Y3U1Lef1DTExjegh2X
 Sg/A==
X-Gm-Message-State: ACrzQf3k378eq+vmgaYoJPhHTFCIqY0Qudf5Bd9KiN5b5ERNvRnYcAN2
 +LYpCIpmmj694HSvlsaseTMF85boMYaRA3Xd2qxJqYI9gs5OnUzJNQpslwtY7UBSfbiApkGGL0F
 ejCQZs6nczhhAWPNWxtizEJzJ9DZO
X-Received: by 2002:a5d:5407:0:b0:228:a79b:4432 with SMTP id
 g7-20020a5d5407000000b00228a79b4432mr2444454wrv.96.1664459375783; 
 Thu, 29 Sep 2022 06:49:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM58KHC7u08wqsH6BkQ5MAF2UPxE8SUXPMIr0HjbIW/O9Te52P7PRb6yiPQYR/4WdKJC2F7xQg==
X-Received: by 2002:a5d:5407:0:b0:228:a79b:4432 with SMTP id
 g7-20020a5d5407000000b00228a79b4432mr2444440wrv.96.1664459375567; 
 Thu, 29 Sep 2022 06:49:35 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e6-20020a05600c4b8600b003b482fbd93bsm4171021wmp.24.2022.09.29.06.49.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 06:49:35 -0700 (PDT)
Message-ID: <d80fe6a8-979e-bb78-866a-a9cfe3d037a5@redhat.com>
Date: Thu, 29 Sep 2022 15:49:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 06/16] drm/udl: Remove udl_simple_display_pipe_mode_valid()
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch
References: <20220919130408.21486-1-tzimmermann@suse.de>
 <20220919130408.21486-7-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220919130408.21486-7-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/19/22 15:03, Thomas Zimmermann wrote:
> Remove the empty function udl_simple_display_pipe_mode_valid() and
> let simple-KMS helpers accept the modes. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

