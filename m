Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 761586A5F5B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 20:11:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA6710E056;
	Tue, 28 Feb 2023 19:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7895210E062
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 19:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677611504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kw3rBiRvARwBpX586ASNbibzu933ritNAVE4xT8Eu1U=;
 b=HrFoH8tyoUoaVY9G4TQ6NBLLCzxZ1BgWAPyTEUlizpE0zCUjiqcYjonrvX5pvZ/pmgL0Ps
 3eONdNXoe7oRsUDsmYX50sd4eI3TDq7XjGkKxM058Q0mxxrr0uKSn80ULlhvZhSsXbQ2fn
 dmUiTW6oTqqBJ7LqhrsTsYMP0Gw5x+k=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-639-1EaYLSxbMuShxdN0mbSmgA-1; Tue, 28 Feb 2023 14:11:42 -0500
X-MC-Unique: 1EaYLSxbMuShxdN0mbSmgA-1
Received: by mail-ed1-f70.google.com with SMTP id
 cz22-20020a0564021cb600b004a245f58006so15588205edb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 11:11:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kw3rBiRvARwBpX586ASNbibzu933ritNAVE4xT8Eu1U=;
 b=chR8CqVrp3vzFL7Foevg92IQH3kXpbKO4uzOBEsJoo7vbxLcQyrdxTm59ko7aEeMii
 U7+72deh28/WyIJpEHVB0UVshS6CpN4YPqXTysrzLMXqoC9NIUZL21hCk6jFKSroZW4t
 69j+VHGPr/wyHxp8nzsVgSOXpUzUbD1ytQsEWkjzH1RB9DnZHsDRfopPeiLrzDOtSLTC
 GkiTDR4hDtjsKxpsHYazj5JLoK0+Evpqt82qJk/jiFQEVxLKxFW7/GbV6Xl3dz8A77q1
 DiPoYYDxiJYNNRLt0eO33kLaIxLmkGbcgtGXXX6eUR8326/QhwBlgALdPhwNShbEjJfA
 Burg==
X-Gm-Message-State: AO0yUKXcFIOUlOciVDgrtHbSOJoQWFYx1+7FXE96qM/vAKrgBKsYHjXC
 bDPJ4wtfBxawpm4k6YFcwziOjecYRgFMmP1MRT9qtnE0qgIoRIfEYmiYO51Ys7UZl7DYLnJvb+j
 Px4WCklmiE1rRb/WpS0uVRoLR0ofi
X-Received: by 2002:aa7:d3cd:0:b0:4ad:7c7c:a70d with SMTP id
 o13-20020aa7d3cd000000b004ad7c7ca70dmr4672339edr.19.1677611501554; 
 Tue, 28 Feb 2023 11:11:41 -0800 (PST)
X-Google-Smtp-Source: AK7set/2s2J8IG7DW6HDV/vn0LK7vpDxbvPNMbEpk1J7E0PWf78W/ZVjRrQIYszfZ+XmFFm7wnj26Q==
X-Received: by 2002:aa7:d3cd:0:b0:4ad:7c7c:a70d with SMTP id
 o13-20020aa7d3cd000000b004ad7c7ca70dmr4672321edr.19.1677611501261; 
 Tue, 28 Feb 2023 11:11:41 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 vs3-20020a170907138300b008c06de45e75sm4832720ejb.107.2023.02.28.11.11.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 11:11:40 -0800 (PST)
Message-ID: <280bfe28-ee00-e765-b00e-0d3294dc6ef3@redhat.com>
Date: Tue, 28 Feb 2023 20:11:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Common DRM execution context v3
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20230228083406.1720795-1-christian.koenig@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230228083406.1720795-1-christian.koenig@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 arunpravin.paneerselvam@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On 2/28/23 09:33, Christian König wrote:
> Hi guys,
> 
> thrid round for those patches. They have been in my queue for nearly a
> year now because I couldn't find much time to push into this.
> 
> Danilo wants to use this for his GPU VAs tracker work and Arun needs it
> for hist secure semaphore work, so we should probably get it reviewed
> now.

Thanks for the follow up on this series - very much appreciated!

- Danilo

> 
> Compared to the last version I've fixed one memory leak found by Danilo
> and removed the support for duplicate tracking. Only radeon really needs
> that and we can trivially handle it differently there.
> 
> Please review and/or comment,
> Christian.
> 
> 

