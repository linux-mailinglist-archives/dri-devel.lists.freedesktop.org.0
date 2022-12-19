Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF0B650907
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 10:05:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABAF10E218;
	Mon, 19 Dec 2022 09:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A8D10E1F9
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 09:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671440672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DC5qp3KFfxCSfnnWXmFRK++Jv+jn7DfxM77u58ySiaM=;
 b=hrFYPAr5p+uM08q8RNkdXuefMNNRsFo93UP4fncLJqMJmAkI04lWEIkJTcz0Hf+8OJ+hB7
 LGqPWWESOHFYTc1E8JT5y3Rb8ovhRrq7a6jFOfcPzhtaqYFIiVbnirR4mLsMZhBxV+NTak
 lHI60F5kpdsooIg/gf1coqH+oKdyFvE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-301-HkY3vYlVPK6_J2HvLcmLLQ-1; Mon, 19 Dec 2022 04:04:23 -0500
X-MC-Unique: HkY3vYlVPK6_J2HvLcmLLQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 9-20020a1c0209000000b003d1c0a147f6so6344310wmc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 01:04:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DC5qp3KFfxCSfnnWXmFRK++Jv+jn7DfxM77u58ySiaM=;
 b=GFXxdvjp4+hGUrD0Yg0yFSFTryowFse9NWCh6OcrQFj5cNSt/BVjQzzcx/krVJ841d
 G4ef8hVspnENjke1FSs3vrFDp3z0OBmKVym93pQR/qHZwDzue7KN3IomV/apuFBViw34
 G++TqbzhcG0XgxpfwKjyt3tN83Xn0ksX9nD5/NRFFVZCIg+VtEqrhyblOuaR+rb8du5n
 UexZWfq/AEaSs+K57JGXxuQmKrWTYcj12ju9SyKohDQnE75UfaLnbIK/nhEHDJ0GXFXy
 QphtuEKdz2AveOsIUmf4SDnmm3V2H+b+uE40sG/w3MX9EdHvkiDom0rYn5YsLTiFfKy3
 bHaw==
X-Gm-Message-State: ANoB5pk2/gtp+/zzFVBME+xN3ezDbQuDoq73X1O4UQzPUNgNxCFiXYNc
 Y7BO6pW5wi2dKpsAVYLYj1MkO72Ig4PoamH6z7908g23ZSumcm+Ggjf4P4aLfU53TMHaC34DR6G
 nreu3EBPZHycYgHpva/4ecoL5Ln9w
X-Received: by 2002:a05:600c:1c23:b0:3d2:2f48:9443 with SMTP id
 j35-20020a05600c1c2300b003d22f489443mr18383190wms.15.1671440662799; 
 Mon, 19 Dec 2022 01:04:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6FltpxB/mqC3eOH3XWnp+aUXWelDtT5WnRyACCePbI1+blyqbzmgMVZXtVTErj3ZDzPTw4rA==
X-Received: by 2002:a05:600c:1c23:b0:3d2:2f48:9443 with SMTP id
 j35-20020a05600c1c2300b003d22f489443mr18383179wms.15.1671440662634; 
 Mon, 19 Dec 2022 01:04:22 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h5-20020a05600c2ca500b003d1e1f421bfsm19552246wmc.10.2022.12.19.01.04.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 01:04:22 -0800 (PST)
Message-ID: <cae61b9d-9751-c385-6d73-da22f0a44f0e@redhat.com>
Date: Mon, 19 Dec 2022 10:04:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] MAINTAINERS: drm/hisilicon: Drop Chen Feng
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 John Stultz <jstultz@google.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>
References: <20221219085307.1403247-1-u.kleine-koenig@pengutronix.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221219085307.1403247-1-u.kleine-koenig@pengutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/19/22 09:53, Uwe Kleine-König wrote:
> The listed address doesn't work any more:
> 
>   puck.chen@hisilicon.com
>     host mx5.hisilicon.com [124.71.93.234]
>     SMTP error from remote mail server after RCPT TO:<puck.chen@hisilicon.com>:
>     551 5.1.1 <puck.chen@hisilicon.com>: Recipient address rejected:
>     Failed recipient validation check.: host 127.0.0.1[127.0.0.1] said:
>     554 5.7.1 recipient verify from ldap failed (in reply to RCPT TO command)
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

