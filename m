Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C99C580119
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 17:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F90BF12F;
	Mon, 25 Jul 2022 15:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA85BF12F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 15:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658761356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vHZGGE+UaT0lsujpHFYRwMapEZrOG0uqXxvqP8vp3jo=;
 b=F5KaVJZEY73JeqT73YTM0l/EPqs7PFJBEFOBrXDmGTP4ilJCDaRcW9kEIpi7d284meB/Ou
 U1RKOH0NfAODySBiwDR/Jli/Q8+/y49EoHOjTjtpVeBovn8Bp0SSQ9wewUQq66vgu2VnxZ
 aUMZ4UgVT4qVlQ7Bxie6lGXaKEOCVSA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-krZ8lZ5MNUqx10Qrwq532A-1; Mon, 25 Jul 2022 11:02:35 -0400
X-MC-Unique: krZ8lZ5MNUqx10Qrwq532A-1
Received: by mail-wr1-f71.google.com with SMTP id
 t13-20020adfe10d000000b0021bae3def1eso1645115wrz.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 08:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vHZGGE+UaT0lsujpHFYRwMapEZrOG0uqXxvqP8vp3jo=;
 b=jvmm4hcJX8USAnxhD1LNXEUQSSrQaCs++Wpa/pxww++rqmq+yj/VBHxcPL93x7Aewt
 Ee+jvLcZHB5Q9vJZ6W0fIkX7/QVDtMaqJwzbQI9WtswxY90sFUHiJ8XIxwoHFR8dcNVX
 O7xC5LphezLT+riM1d5NoguW2ZyJLRgjTLdQewSNDVejcqb17n6B+qLpa4iR8VW0BWwm
 wWSZqbCVNvBxsw+ODuth/cdBNjzYrEtpAcX1HFCYSXzMtlwtdaPGN9GlJaZ0wcYS0CY5
 XocmMujpEfUp/ArIviYW7wVKyMfypVvk6UIAaFmTxfz1Pqn1BKQAVogZB8Na+Mo0FLz9
 rQsA==
X-Gm-Message-State: AJIora8PdJRZvPB8+G/88QnQqw0EVoMSFZAVxJWG2Yj6jVxsuECvDWiB
 B8467tVb0Z1kpRKPdfcpDGr35vftj0yIQhid+yRWM9TX+dqRm1k1n9K5R+fNpbWvMeqT0vgnzWP
 tm+9cFriTE96n/K43dtORLHQNQIka
X-Received: by 2002:adf:fd42:0:b0:21e:4357:3f38 with SMTP id
 h2-20020adffd42000000b0021e43573f38mr7802996wrs.620.1658761354387; 
 Mon, 25 Jul 2022 08:02:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1up2wqjTlCDkbuerUzqw3y4Lua29GD9rdcA18jLXX1pQ9fCVhFmF2mw6dWG6b5ahUovhc3P7w==
X-Received: by 2002:adf:fd42:0:b0:21e:4357:3f38 with SMTP id
 h2-20020adffd42000000b0021e43573f38mr7802975wrs.620.1658761354219; 
 Mon, 25 Jul 2022 08:02:34 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o27-20020a5d58db000000b0021d80f53324sm11992170wrf.7.2022.07.25.08.02.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 08:02:33 -0700 (PDT)
Message-ID: <307f7551-aa47-ea36-ea58-ab4c552dca38@redhat.com>
Date: Mon, 25 Jul 2022 17:02:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 03/10] drm/simpledrm: Remove pdev field from device
 structure
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220720142732.32041-4-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/20/22 16:27, Thomas Zimmermann wrote:
> Replace the remaining uses of the field pdev by upcasts from the Linux
> device and remove the field.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Much better indeed.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

