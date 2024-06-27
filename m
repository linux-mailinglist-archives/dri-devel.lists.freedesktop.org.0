Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D6191A2EF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 11:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA9EB10E1F6;
	Thu, 27 Jun 2024 09:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GFvd9Bci";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4D810E1F6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 09:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719481619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/aRbMqnFPqElcujOpfk6cQ/iT5TUsEaniaGLjqKo9qI=;
 b=GFvd9BciqDCHULI7D8SwGh6bXjk7xFK2NBLU3+rsVa/jTNOapb3j3xygq3YdFKJMGP1Ahs
 sH/klWQxOTLypsJ+pLBbRsB5HyJ2iAQ2ZCqsByLKEJHtukhhz/Hd9h9pa57cK/cdkUZCQj
 ppP5UtsLVgksoWEx2/veKtdvnof4SME=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-9ibFcHT9N3e43avzB0Vyyg-1; Thu, 27 Jun 2024 05:46:55 -0400
X-MC-Unique: 9ibFcHT9N3e43avzB0Vyyg-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-52cdbeaafcdso4445474e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 02:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719481614; x=1720086414;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/aRbMqnFPqElcujOpfk6cQ/iT5TUsEaniaGLjqKo9qI=;
 b=SJ6zzlqMw/aQMoc127QKbG/HkfjZcGXLRz7JXAq/incnYVg6l9ZcA278RICr/mTqJM
 nEe7bpsjVCBQ3OWnu02yWJ3w9cnida1QpG141UIoQeZmAmysndluDYgeBhyyPjrv7X45
 nUo9VB/Rx4JInY2ZjuEb47I2q0USWT135gxQkqZpJ+S30wExo45vd0Or5zXqgCtm9Dnd
 xW1TUEs5OuwxTzj/w9XUlCCZVHnFU2Ua3WbVLk6dx0TJYYW87Jc5OpNQcjTh15nFu1zH
 sb0rt2NEoztPjgQednc686M1RqIle4c7/PBoyXtM61H7e91Eij4XBUI7zEZfZZOC3cnC
 WcwA==
X-Gm-Message-State: AOJu0YwlpojPPJxXCvjoHOP65m7BoKuknClIxBXvk5HTEfp+EciVPAKG
 QS5/MNNoQ0kt3qppiX/AfhL0C5kR3sYHA4DzZFowwJqd8vTlZ0v2sGqKQ1zFcUMJb7LDB5AeBVb
 x6tiE7a8MC8uhpUvPSLS+fWacmC32KwDnzEEwGjFZaiPsx2cf3SHZItrgWsniG+BETA==
X-Received: by 2002:a05:6512:324a:b0:52c:9e25:978d with SMTP id
 2adb3069b0e04-52ce185e46amr6953681e87.45.1719481614268; 
 Thu, 27 Jun 2024 02:46:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNBRY4osLL4QYw4x+YKt8+rUQooLZRv8TYqrLSEg+HIfJ8udA+56TenAyL15Sctcq9KkjLag==
X-Received: by 2002:a05:6512:324a:b0:52c:9e25:978d with SMTP id
 2adb3069b0e04-52ce185e46amr6953664e87.45.1719481613904; 
 Thu, 27 Jun 2024 02:46:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42564b66fcfsm18056315e9.18.2024.06.27.02.46.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jun 2024 02:46:53 -0700 (PDT)
Message-ID: <f85405ee-12ce-49a7-8c44-c4c4915d999d@redhat.com>
Date: Thu, 27 Jun 2024 11:46:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/panic: Miscellaneous fixes
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <cover.1719391132.git.geert+renesas@glider.be>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <cover.1719391132.git.geert+renesas@glider.be>
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


On 26/06/2024 10:41, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> Here are two more fixes for the DRM panic code.
> 
> Thanks for your comments!

Thanks for your fixes, they are now in drm-misc-next.

Best regards,

-- 

Jocelyn

> 
> Geert Uytterhoeven (2):
>    drm/panic: Do not select DRM_KMS_HELPER
>    drm/panic: Restrict graphical logo handling to built-in
> 
>   drivers/gpu/drm/Kconfig     | 1 -
>   drivers/gpu/drm/drm_panic.c | 3 +--
>   2 files changed, 1 insertion(+), 3 deletions(-)
> 

