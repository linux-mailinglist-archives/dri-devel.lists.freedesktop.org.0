Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A42653C127
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 00:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6361E113072;
	Thu,  2 Jun 2022 22:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22425113072
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 22:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654210611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AR9SMdcMDUd1n5J8KIgwt5SyKjRipu7kR5XFiqc2xKU=;
 b=gQCktvfPp5g0HaoM/DEqqx7zmYt2qhFes5OSqZFirU9LKDQuf0bVKWmDWOXMNgADMDChWZ
 raW+aZh/kaWI5tPx2Y7IT49y5GXGwa0VK22jrD8lAcmuGYfxXmNixkc68svrHmen2C7fQC
 oY/iqO0jN1s9ozkTs6h8AS0AnOQXc0E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-DZht5MH6MJm-bv9a_K3gRg-1; Thu, 02 Jun 2022 18:56:50 -0400
X-MC-Unique: DZht5MH6MJm-bv9a_K3gRg-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg40-20020a05600c3ca800b00394779649b1so5823930wmb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 15:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AR9SMdcMDUd1n5J8KIgwt5SyKjRipu7kR5XFiqc2xKU=;
 b=7a6kLrqxVaM2l1GNRw0HEvjGtKtjqN6Fe4uJ6+Ghcjq9WstiN+WzMiNUQE9QJ+z0NW
 44B8HRGEF8QRHB/LPCiQ5mCl6HVMWhvVTpb4EjKAPGWqR+zUKgM0Abo4ojq7js7itCpL
 5yQuReydTeVWKDCaRdVpFe0G2CE7tECZfQDPsS5smKVT6BF6XOO+2GFXp2p2LRl1ovDi
 1NZPNWBdfZXzqS+N3M5HxcdwtTWl2PNWl71U3IJ5NqFAhug9p+f0LDK0Or+fg3XbEKLv
 C7QCaptj1uz/MBgVmKtVAHQYwnVmO3dmizXXVO0INeIEVFMGUZzqpENODh1/s1CuKyhw
 XRiw==
X-Gm-Message-State: AOAM5314zRYDwMU76cleAd+ZTXkJRbgywynz0IFU7XOXfRPbXm9ptFbF
 aDEks1FU++JoDjJICFZtKKuDVWC/NhZk/66BqHsUWuiUd3aQ2XcVWUfjc37yZd4iggAkWAU/Pym
 H/Ga3O+6VqnqObDwOtIMu1N2zANJM
X-Received: by 2002:adf:e19e:0:b0:211:7169:dfa6 with SMTP id
 az30-20020adfe19e000000b002117169dfa6mr5499554wrb.654.1654210609758; 
 Thu, 02 Jun 2022 15:56:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZWV8zk+ILUpdg/oTcVIqrtQc9+EAsiqEAnLJaGY7v3qdGxO1+UG7rTBnoRuEDL10V/hcluw==
X-Received: by 2002:adf:e19e:0:b0:211:7169:dfa6 with SMTP id
 az30-20020adfe19e000000b002117169dfa6mr5499530wrb.654.1654210609546; 
 Thu, 02 Jun 2022 15:56:49 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c16-20020a056000105000b002100aa69469sm5600188wrx.2.2022.06.02.15.56.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 15:56:49 -0700 (PDT)
Message-ID: <add515d2-77b0-546a-3fd1-242d9f2e8ac0@redhat.com>
Date: Fri, 3 Jun 2022 00:56:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 1/6] dt-bindings: gpu: v3d: Add BCM2711's compatible
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
 <20220601110249.569540-2-pbrobinson@gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220601110249.569540-2-pbrobinson@gmail.com>
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

Hello Peter,

On 6/1/22 13:02, Peter Robinson wrote:
> BCM2711, Raspberry Pi 4's SoC, contains a V3D core. So add its specific
> compatible to the bindings.
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

