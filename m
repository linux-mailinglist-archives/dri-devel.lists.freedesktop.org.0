Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9BD663E8D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 11:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9ED10E595;
	Tue, 10 Jan 2023 10:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BD610E595
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 10:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673347748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q0dMuYYR3kBwca8vfH0z/yzqxNNj7KYuJ6lU7Rkfh0w=;
 b=am8ozOD1/kmWVUnMepL+yRCkMYwOICmRRQv7A1evXYVW+3YmiURzYCXewBD1MVYhcZjxSA
 5ClojHmSf3ID3b615u12SDYhGTAx+w9nnWpLifyvFwrKBGSzSL0JdHQ1krCdCJc4LFhNha
 6fPknGKOgd7Av4FztFDlviwtqLnGv0Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-92-PhjfJAK-PY6EHB_eU0A-0w-1; Tue, 10 Jan 2023 05:49:07 -0500
X-MC-Unique: PhjfJAK-PY6EHB_eU0A-0w-1
Received: by mail-wm1-f69.google.com with SMTP id
 k20-20020a05600c1c9400b003d9717c8b11so6137741wms.7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 02:49:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q0dMuYYR3kBwca8vfH0z/yzqxNNj7KYuJ6lU7Rkfh0w=;
 b=Zu2D+otoKg7LE6WRoJckjxNKGD6rJWgxExo4Na9v0hkpPewx1VjSsv40KmBVwb6XET
 VWy8Vr2D3p6RwMA1duQwKJ25HJ3qLoIqQWOoJpmJnk/EYT62SUVb50nRcyb65U5Q3mrw
 V+rAuUUojbzML8nPGbRItULdfHylnnfQKftEVmQMJ85tCw4GaZgyTmKOEznAgUw26jES
 wA9IRdf0cDeh/cWpIVYCh3RiEnIAQCFWNJySEzfIiPgAO8COJKTKci8IlgedaHCUJK5l
 CCFBiRzjiM5hZZy7R+Z6DXMFjPOYWLAgMspUNmpnJ3ykrH51ngkNyXMBa3I1WtHqBKQK
 OMoQ==
X-Gm-Message-State: AFqh2kohGk25GVXaCsLwzewxm6BVMnkfoPwG3RRVo69ZuhdvkYJWFS31
 +dNhznRcOMUMxry5jcKOwrBnkGDMrU+bdicVNZ7ubgqBHfVH6naMShZEA4JKWmv50Kx8wK1zUau
 BWIf43YCpb4V3tiWJS4JqeEdfLAcY
X-Received: by 2002:a5d:430e:0:b0:279:53e1:5178 with SMTP id
 h14-20020a5d430e000000b0027953e15178mr34212400wrq.45.1673347746227; 
 Tue, 10 Jan 2023 02:49:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvSgANnzeVYCChqr3MMyEuQiTjOxjiY7ZVN7n854AWHJZx+tsKutXMswvcS8wP3HXl/F8S9Rg==
X-Received: by 2002:a5d:430e:0:b0:279:53e1:5178 with SMTP id
 h14-20020a5d430e000000b0027953e15178mr34212394wrq.45.1673347746048; 
 Tue, 10 Jan 2023 02:49:06 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o17-20020a5d4091000000b0028965dc7c6bsm10756646wrp.73.2023.01.10.02.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 02:49:05 -0800 (PST)
Message-ID: <cff0c5ad-397a-4e7a-b488-9cea7a14bfc5@redhat.com>
Date: Tue, 10 Jan 2023 11:49:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] MAINTAINERS: drm/hisilicon: Drop Chen Feng
From: Javier Martinez Canillas <javierm@redhat.com>
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 John Stultz <jstultz@google.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>
References: <20221219085307.1403247-1-u.kleine-koenig@pengutronix.de>
 <cae61b9d-9751-c385-6d73-da22f0a44f0e@redhat.com>
In-Reply-To: <cae61b9d-9751-c385-6d73-da22f0a44f0e@redhat.com>
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

On 12/19/22 10:04, Javier Martinez Canillas wrote:
> On 12/19/22 09:53, Uwe Kleine-König wrote:
>> The listed address doesn't work any more:
>>
>>   puck.chen@hisilicon.com
>>     host mx5.hisilicon.com [124.71.93.234]
>>     SMTP error from remote mail server after RCPT TO:<puck.chen@hisilicon.com>:
>>     551 5.1.1 <puck.chen@hisilicon.com>: Recipient address rejected:
>>     Failed recipient validation check.: host 127.0.0.1[127.0.0.1] said:
>>     554 5.7.1 recipient verify from ldap failed (in reply to RCPT TO command)
>>
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>> ---
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 

I've pushed this to drm-misc (dri-misc-next) now. Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

