Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A96AA53C142
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 01:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2889113B3E;
	Thu,  2 Jun 2022 23:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CE1113B3D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 23:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654211405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q8rVnLMJbXknZPTgbvr6z2LH9dOMhQu74j3XOdwbfuU=;
 b=a1ID3aofjqSHkkLm5TMbqYfqaaT2tNHnbGbzLaCHfmsh1dVyKhZ+Y59eWI6vxs23s3/k1g
 58H1aFteBvoUBRIFbFsr3hGLmxJit9354Uim+qXjvmfRC0M2S+kmxJ4l2m8/cHrxHLBuYr
 2Qw/Xnl7ELIubmbzsxmb3H7fbmONhZk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-_MqpsYJVMg22uR25raKxXQ-1; Thu, 02 Jun 2022 19:10:04 -0400
X-MC-Unique: _MqpsYJVMg22uR25raKxXQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 o3-20020a05600c4fc300b003946a9764baso5846803wmq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 16:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q8rVnLMJbXknZPTgbvr6z2LH9dOMhQu74j3XOdwbfuU=;
 b=VrkCU9pATEzVJd9HcJTKiaIhkyYyh58Lcf8jBeZL6j+6Dn+PbyO0R2HThu1KqorbKb
 AfleL64igOZHnyivypoKpKd3MnEq+TLTz5NLZvl9Qri0tb79GmyECZPYZzWYY/TVSFk7
 zfBj+bXGpqpYRZ8YR86sWChwBiImRZvKja/EWd1SN1VKQVJHVPpEQbazB7iwZ8R6kZE7
 RL6CpMzA3cmGfH3LQNq3ONJ/lX1SP1K1cKwmw8+MfEADEyZ2OP4LDmghkzgusfCdyclA
 GTYP9O0R2xaS1VOcTvI+Ca3JlQ1R8EUYfb5NUDX+LAIK47D8cujo3dtbTGzclul3WQut
 +LZA==
X-Gm-Message-State: AOAM533s+uAM6npQCZxZgpuBnI4y0evazJ1G+bBHSrC5zBtMBqIindZF
 uYYJOeLsCda0/U7uYN0vPa1OjkfK3rUhnBs81Z3wq6O4UQ/05XXQdMGLB3QwWlBbul1EWc7xUTW
 q3HEGdsFp6Nyt302Vi+/nF0AHCrA9
X-Received: by 2002:a5d:6d08:0:b0:213:baf0:d56 with SMTP id
 e8-20020a5d6d08000000b00213baf00d56mr643647wrq.0.1654211403239; 
 Thu, 02 Jun 2022 16:10:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyj0yaPnM11UBEWQHQ+Io0a9UPXhhUhlPr89wi3+61E/HTXrZubgDmGoZHYzLPMiVQ8PpKYDA==
X-Received: by 2002:a5d:6d08:0:b0:213:baf0:d56 with SMTP id
 e8-20020a5d6d08000000b00213baf00d56mr643625wrq.0.1654211403045; 
 Thu, 02 Jun 2022 16:10:03 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c4f8800b0039c325eaff2sm3183836wmq.26.2022.06.02.16.10.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 16:10:02 -0700 (PDT)
Message-ID: <a469e16b-c62e-e98e-b3f9-2dceecf5ea6a@redhat.com>
Date: Fri, 3 Jun 2022 01:10:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 6/6] arm64: config: Enable DRM_V3D
To: Peter Robinson <pbrobinson@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 bcm-kernel-feedback-list@broadcom.com, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 Florian Fainelli <f.fainelli@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 maxime@cerno.tech, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20220601110249.569540-1-pbrobinson@gmail.com>
 <20220601110249.569540-7-pbrobinson@gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220601110249.569540-7-pbrobinson@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/1/22 13:02, Peter Robinson wrote:
> From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> 
> BCM2711, the SoC used on the Raspberry Pi 4 has a different GPU than its
> predecessors. Enable it.
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

