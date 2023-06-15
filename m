Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7F2731DFA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 18:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86F810E51C;
	Thu, 15 Jun 2023 16:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B327A10E515
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 16:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686847166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=85Cde2lC1B5p+slsHblZ/ywkw9kOFzxqw+4KoOzSvts=;
 b=Nfn1FPr6VMMLcTsXSeB9ZH1x897eWSqZpW1M0234D3yg9P0tZDu0bLo52O+C6ehERCn3Z8
 s1EaWMbnogRbOILBtuCmftXvI5rNadbRV2IWLb/QTMOvI9r04XPmod+gZ4m/CMvtgj0vC5
 oznv7CPPyCK0Gcek64QPef7LaZBukhA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-1juFkcfwMomR9spgp9mcYw-1; Thu, 15 Jun 2023 12:39:23 -0400
X-MC-Unique: 1juFkcfwMomR9spgp9mcYw-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94a34e35f57so177629166b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 09:39:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686847162; x=1689439162;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=85Cde2lC1B5p+slsHblZ/ywkw9kOFzxqw+4KoOzSvts=;
 b=YPU7R+pwHE9A5nj76JVoVLXryeA3ZtxO0qgEQN30NoYh6rDNE+DZy1ZlEn7us0f8aE
 oF1aN5xUMpNy7gRp9GHSWmS2FqKLFHTsNBObvs5GmvBguyewjHirHQTz7GFKiEokkQhI
 J9Y0OAD8Trq9XmcrJuM0rsC4EVqYlm85AJ/x6R2pJtRL/0F8N+svHIabZXA88MgM4EWt
 dZW1hc1OjccXuxd/d8J0LPgosZ4kilwYLl6DHTbhTNb/wAYs5usA65ecRToW5XEuLWsA
 iPlNaU8/H/oEqMba9XBwXOWr1FPCvUeVlqXwMiNxqGVobd3jDWNX47YsoV5m9nfOYasD
 oVqA==
X-Gm-Message-State: AC+VfDzi+k4GvwRXZhvYKusqwh9Btr1uQ5IX1TJE0ZaMO4AtaNJa/7cI
 rljqDHE3fAWng1muJlHp0Nvqnh9z1Scy/GOsbOejfnkAV03lSPbtiFTePTMLGMGxWrrCZ/eT53y
 Cx7tE1RxNLO8N9IupQ6oZw8kbKCAI
X-Received: by 2002:a17:906:478f:b0:96f:aadb:bf81 with SMTP id
 cw15-20020a170906478f00b0096faadbbf81mr20890718ejc.45.1686847162688; 
 Thu, 15 Jun 2023 09:39:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4HFzj8oji+QgifVAS8W5rrkeLVzDVniPUlQYTVJZN7par6lelAUrI2LEXLSV910896GtiXog==
X-Received: by 2002:a17:906:478f:b0:96f:aadb:bf81 with SMTP id
 cw15-20020a170906478f00b0096faadbbf81mr20890694ejc.45.1686847162404; 
 Thu, 15 Jun 2023 09:39:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a170906684d00b0096f7500502csm9582514ejs.199.2023.06.15.09.39.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jun 2023 09:39:22 -0700 (PDT)
Message-ID: <68cd25de-e767-725e-2e7b-703217230bb0@redhat.com>
Date: Thu, 15 Jun 2023 18:39:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH drm-next v4 00/14] [RFC] DRM GPUVA Manager & Nouveau
 VM_BIND UAPI
To: Liam.Howlett@oracle.com
References: <20230606223130.6132-1-dakr@redhat.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230606223130.6132-1-dakr@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, linux-mm@kvack.org, boris.brezillon@collabora.com,
 bskeggs@redhat.com, tzimmermann@suse.de, bagasdotme@gmail.com,
 christian.koenig@amd.com, jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/7/23 00:31, Danilo Krummrich wrote:

>    Maple Tree:
>      - Maple tree uses the 'unsinged long' type for node entries. While this
>        works for 64bit, it's incompatible with the DRM GPUVA Manager on 32bit,
>        since the DRM GPUVA Manager uses the u64 type and so do drivers using it.
>        While it's questionable whether a 32bit kernel and a > 32bit GPU address
>        space make any sense, it creates tons of compiler warnings when compiling
>        for 32bit. Maybe it makes sense to expand the maple tree API to let users
>        decide which size to pick - other ideas / proposals are welcome.

I remember you told me that the filesystem folks had some interest in a 
64-bit maple tree for a 32-bit kernel as well. Are there any news or 
plans for such a feature?

For the short term I'd probably add a feature flag to the GPUVA manager, 
where drivers explicitly need to promise not to pass in addresses 
exceeding 32-bit on a 32-bit kernel, and if they don't refuse to 
initialize the GPUVA manager on 32-bit kernels - or something similar...


