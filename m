Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B467651E16
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 10:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E7E10E370;
	Tue, 20 Dec 2022 09:53:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1978F10E370
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 09:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671529981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=peb/cvmcArFz0VNGNKDmsg2+BzbJdGM2v+ntzIRyXgI=;
 b=Ae0rdWuc3MqU7dLPWq2PzZgmDBy5YEMRCH5fNOTXterNbKffGX3je7FN9S7u/POG05WacV
 LA92zKwz6qiJ8B3OxzuLoTZ7tbtCBj57rnqyaTpNKr6ORwzpeeKR1MZNi7b/H9NfRqmeYW
 7UGNEyyV4Q+73d3pOszb8WW50wTKTKs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-664-Vny6QZY0NOS67wTpGWXtuQ-1; Tue, 20 Dec 2022 04:52:52 -0500
X-MC-Unique: Vny6QZY0NOS67wTpGWXtuQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 r10-20020adfa14a000000b0025ba73dff40so1944588wrr.12
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 01:52:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=peb/cvmcArFz0VNGNKDmsg2+BzbJdGM2v+ntzIRyXgI=;
 b=6fQhJONGfDWFn1yo9B14FmYn+M+lSKLunaQlp6ej8IqKfYbd6nqgczVXzbQqviTFpE
 xYJ6LL4H61LJ9qqbDQhBR21WmNnmBOEG1SQj5qj3bdZNvvt9oRV13b1MwF8G3r788jDS
 TjNSWtpRIkuOVtxWaA/5AWX7smn2D3qQvrckVyrrjjq6MSJe67KRd8Lmr7qdu2ggLTx6
 qAzzkR0RzlR2u119yWw1YbrDD96J1RBkXbC/ExYBznIm0ZsM46NvkZwUL+vUnEGBOCIx
 KXw1e3FPJcrUDWatP6O3o6vn5LPbiLdGqGVEHldRWgoGssQLBmv6xrtaoASv3v5XihwD
 clEw==
X-Gm-Message-State: AFqh2kozEB1gBFOVX0MFx9fF1Kx6Q/sLkN+GYdSrUfIrxKOQQkbn/I2F
 N9cwK1miaULHYwgQOez6ZV3yuj2hybI+Gm4MSLEwXBi7HBajXR4D0oIPmQ7rZyP4kyIO1bdrl6+
 ReeCJbc0eHp+FqYdi96RW4Unm6UmM
X-Received: by 2002:a5d:5752:0:b0:244:48b3:d13f with SMTP id
 q18-20020a5d5752000000b0024448b3d13fmr885271wrw.41.1671529971461; 
 Tue, 20 Dec 2022 01:52:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvKoZa/uhHLQyBomu3k7mdpaKOE1hQIbYJw/x2IQ85DXKXu5kOtjcns/1IKHjm8l4vqFcRdlQ==
X-Received: by 2002:a5d:5752:0:b0:244:48b3:d13f with SMTP id
 q18-20020a5d5752000000b0024448b3d13fmr885265wrw.41.1671529971293; 
 Tue, 20 Dec 2022 01:52:51 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 ba12-20020a0560001c0c00b002549b649b62sm12363874wrb.50.2022.12.20.01.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 01:52:51 -0800 (PST)
Message-ID: <bdf39c34-2d98-8d9f-5600-13167d049ce1@redhat.com>
Date: Tue, 20 Dec 2022 10:52:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/2] fbdev/hgafb: Remove trailing whitespaces
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 airlied@gmail.com
References: <20221216174633.1971-1-tzimmermann@suse.de>
 <20221216174633.1971-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221216174633.1971-2-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/16/22 18:46, Thomas Zimmermann wrote:
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

