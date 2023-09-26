Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4680C7AEAE1
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 12:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82DCA10E3A0;
	Tue, 26 Sep 2023 10:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CF310E39D
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 10:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695725814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ztsEuAgPuapaTM08P0SEgj/D/uEMY0v9vX8pBVttsrE=;
 b=Vj6EzDGyY7JnGM8SqVFqmCuXPTcnV5wL+E3mx4rdP6/YhW/M5x+OGLHH+PiAuPnrqwfClu
 cYAIyQkUOKYLoTSJxaRCNH6ZzUrHtPvG2zbAakuP3963KiofhGyefzswNmcDVgzYpjWyVV
 9zHQvD368EVqu7RfQKgqpYuRqPfKCzg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-nrE08XS9Ni67BLir57zwWw-1; Tue, 26 Sep 2023 06:56:52 -0400
X-MC-Unique: nrE08XS9Ni67BLir57zwWw-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-993eeb3a950so715644866b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 03:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695725811; x=1696330611;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ztsEuAgPuapaTM08P0SEgj/D/uEMY0v9vX8pBVttsrE=;
 b=u31oQDS0gILlqImb4GC6LHqE7UpNTgGjtlcpPpZXVKhMu6zZR6RswDf0J23NJkEea4
 T8rrBoNZM+wHddHqISeR+n/ZQ5J0lyd1YPiG8J6BzlX7njUgPBMDTQtAqX03vR+ND2IS
 pmAdDZKpugfNm9oHH9cbq6seCP2DtHEO8J4tXoQA+t72GCRbvgDOJHvHZkn8nsMTesjN
 zfdRzb0QkC3r4J4eYIWyMy7QkVLrNKKHKtQTyxL8AfdkpokOh1V5AVzi1yxJ1U2pwysh
 FKnjjQhgznxuDkW90by4edNEK5GC9nFim27GGx6u/meR1udUP7bbTGnOI03rncyRC+kS
 sYtQ==
X-Gm-Message-State: AOJu0YwNNilAFsIo8nW74E5TuBKl9aZTBrpemVaAoPWuuaOrrpU6xLJ3
 OsQWGHoC0/dkMYJKQaN3HxShsMAT5lW3u11Xf3zthiZutt1GMFTSDe+Cmu3kEMfLbzOGKJIal8b
 7XFu4K2MR/JmJJB12ZvKV14IVegyB
X-Received: by 2002:a17:906:8a48:b0:9a2:225a:8d01 with SMTP id
 gx8-20020a1709068a4800b009a2225a8d01mr8584480ejc.7.1695725810983; 
 Tue, 26 Sep 2023 03:56:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8Lokqy4lv4QzddH9koVW2cAZSwao+adaW7JEPfbJWs1+K0DKVx3+AGJPCG9KvFElCfknlIg==
X-Received: by 2002:a17:906:8a48:b0:9a2:225a:8d01 with SMTP id
 gx8-20020a1709068a4800b009a2225a8d01mr8584471ejc.7.1695725810692; 
 Tue, 26 Sep 2023 03:56:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 jt24-20020a170906ca1800b009929d998abcsm7575268ejb.209.2023.09.26.03.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 03:56:50 -0700 (PDT)
Message-ID: <3a093a6d-3f7f-fd5d-923c-ef80840316f2@redhat.com>
Date: Tue, 26 Sep 2023 12:56:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: linux-next: build warning after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
References: <20230926150725.4cca5fc5@canb.auug.org.au>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230926150725.4cca5fc5@canb.auug.org.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/26/23 07:07, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Error: Cannot open file /home/sfr/next/next/drivers/gpu/drm/drm_gpuva_mgr.c
> Error: Cannot open file /home/sfr/next/next/include/drm/drm_gpuva_mgr.h
> 
> Introduced by commit
> 
>    f72c2db47080 ("drm/gpuvm: rename struct drm_gpuva_manager to struct drm_gpuvm")
> 

Thanks for reporting this, fix available here:

https://lore.kernel.org/dri-devel/20230926105146.10808-1-dakr@redhat.com/

- Danilo

