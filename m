Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA23796F946
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 18:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D769510E088;
	Fri,  6 Sep 2024 16:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BJOADixo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B845810E088
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 16:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725640158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NTF/nKjKqx3JSmZJNOkT6LhQPRYiMBga9bgFVidxPTg=;
 b=BJOADixo8v4yRlf/rbFYDri9kkRtG+04fP5F+FiMaeZuy6xhLAjzyIguh/dpTF74rMU82t
 9ad16RjvbnHiybq5ZjxaesHJcNKaF+mroU2R/fDK3+nCPkrpNL3okq9jXFupvMlXptvHlq
 j+LZhQfyaC6tYGwhCfK6skthxmF+T3U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-HOEpImywORaeiPMoVD8_xw-1; Fri, 06 Sep 2024 12:29:17 -0400
X-MC-Unique: HOEpImywORaeiPMoVD8_xw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42c80412dc1so18075555e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 09:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725640156; x=1726244956;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NTF/nKjKqx3JSmZJNOkT6LhQPRYiMBga9bgFVidxPTg=;
 b=XIsxMpdte5belUz++emMKYt174ksXiersgoTOlEelSUFYPTeaqm6/TW2ZvUimfCaO5
 VisHtP7hFU0nTnI2Jdl1M50ovQutWYgtz9+U3xoPNVSWU6G867ddOfknhvyiLfuhIcO5
 W2yxIrIcJzDcK59faqlU7fujVaeOaTrOXEElU+7VUQFqgxgZuDis0LLqhj9jg9TSMLtR
 MHGOl7o+tiOccKKU+0+2lxYsVhBR4YQNrypJzlYGDbuzvQfg7HvskG7M4fNA9g7sor/a
 JbDlNnChun8caO8g1yITYX5wrpdFAP4KzeyJrgsIub31on6RRMQZZqxvOeRk+tMXsGtS
 Zspg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtQRePg1RaI8SO/+/DbUDCHhSqAhN0NW5S5/6YL0kvFSIW9QkUH37MrZpxOjNI1VYTpWg5PyMHVv0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFitCpSQOiEVwhCKeWUzmbgYlTgEOryi6SXAgN9XdHosQj4D6a
 GRoarykfyw9eCKfq/e2QF3cyzODAoeiLLh1m+bdNr749Q6VtZpbqYiul+BqzVOd34Kyaic6SaJv
 j4eCZT1nrrWCfEAxzPWTo6x0C7o+BjFhaE7diF+84l1gXxH/htWtl1pBXFYb8AJC7dw==
X-Received: by 2002:a05:600c:45d1:b0:426:5e91:391e with SMTP id
 5b1f17b1804b1-42c9f9d6d1cmr24597945e9.26.1725640156049; 
 Fri, 06 Sep 2024 09:29:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE01F8H/WdLhuKvK4CLUhFcSQZEx27sCPQ1eZjRPgcGIGX7GfL6OJuouynXnk+joG/+G2USSA==
X-Received: by 2002:a05:600c:45d1:b0:426:5e91:391e with SMTP id
 5b1f17b1804b1-42c9f9d6d1cmr24597655e9.26.1725640155569; 
 Fri, 06 Sep 2024 09:29:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42cac8543dbsm3587525e9.42.2024.09.06.09.29.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2024 09:29:15 -0700 (PDT)
Message-ID: <c02de5fb-1daa-4afd-9887-96087ee4eb43@redhat.com>
Date: Fri, 6 Sep 2024 18:29:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
To: John Ogness <john.ogness@linutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Petr Mladek <pmladek@suse.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240801100640.462606-1-jfalempe@redhat.com>
 <20240801100640.462606-4-jfalempe@redhat.com>
 <87o76czfb2.fsf@jogness.linutronix.de>
 <d4412d54-41b1-4671-9733-34ba1423404c@redhat.com>
 <87zfpwxqpc.fsf@jogness.linutronix.de> <87a5gm2khw.fsf@jogness.linutronix.de>
 <a421b31b-53ad-4f56-88be-66a7d4c3bb61@redhat.com>
 <87seudchlu.fsf@jogness.linutronix.de> <87plphcgo2.fsf@jogness.linutronix.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <87plphcgo2.fsf@jogness.linutronix.de>
X-Mimecast-Spam-Score: 0
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

On 06/09/2024 10:47, John Ogness wrote:
> On 2024-09-06, John Ogness <john.ogness@linutronix.de> wrote:
>> Your device_lock()/device_unlock() callbacks probably just need to
>> lock/unlock your mutex @drm_log_lock.
> 
> Sorry, forgot to mention that the device_lock() callback must also
> disable migration. Since you are using a mutex, you will need to
> manually do that as well...
> 
> mutex_lock(&drm_log_lock);
> migrate_disable();

Thanks a lot, I've done most of the conversion, and it's already working 
great. I will send a new series next week.

Best regards,

-- 

Jocelyn


> 
> John
> 

