Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC1651A5FD
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 18:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088D110FB2E;
	Wed,  4 May 2022 16:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0068910F7EB
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 16:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651682915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C80PpJdtHsQYh9YgWUU5AwvnusQPkG7yGp50RdkZ4AQ=;
 b=ZkdQrM2uKdR2t6ve3XA9unvh6PRD7HBGgWeriocSatb8F4z8D9Wle45OEcijxGVrZ34hIE
 wbPE8Ocl2uBvGjhZ8sDWZ95rHBe7Te/M53UWCAeTfkcCD+pZFz3HsNo+XCBu0GQ6SKY42X
 1o6vniTv4N8zuZPpnJZjAUDDBAljSrg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-ehw4wTVzOYSiLfajVS3RwA-1; Wed, 04 May 2022 12:48:34 -0400
X-MC-Unique: ehw4wTVzOYSiLfajVS3RwA-1
Received: by mail-wm1-f71.google.com with SMTP id
 m186-20020a1c26c3000000b003943e12185dso887506wmm.7
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 09:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C80PpJdtHsQYh9YgWUU5AwvnusQPkG7yGp50RdkZ4AQ=;
 b=qbOecq37SLJPS6nZ2omtBFgBGraY74lajp/tfP7NCkgxQUG5NYL9ukFnSLWG+/fn50
 f73w+4DoXep2OH/mjwiQ6k4XTZcEl00dmBVxKulx1AxYmTa/2LDmNZsGNzInQkTZpQ4w
 8+dgclLnm8vx1eKSdFqZcNL7hXrhPffXRfuGTOrH60fFOC8qaV0BIy8Gyn4/m/6RMmTP
 2v3dx6P2a2DUf7G+rzGK7b+GoSoCHEZ6VP5agwS0X4yxT1k3xPYSHhsioUk9LElzIdyE
 ciDd3WbwN1xDJvci4+rqZxefhLmDbzMgWCo8jVUFvl5vc2xiAAxvE2FCR1AmAhSqgAFt
 Phbw==
X-Gm-Message-State: AOAM53233DpivEas7k16Rv/iRMwTWgWFL9i7gHEt3XzCsP4cJ30CMiNJ
 Y/BiKMHhK6bU2eNfxmjZJuvRB3wKP26HREc52pYthiUPn9l7S6GlMQvY1ucVYtAlXRWK2sVULX2
 jDw7z9+Ty+AJB4alj+EMjdTR7vIxZ
X-Received: by 2002:a05:600c:2315:b0:394:1f6:f663 with SMTP id
 21-20020a05600c231500b0039401f6f663mr246775wmo.115.1651682912620; 
 Wed, 04 May 2022 09:48:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZK5Pq2mU8Y6HYAf07iPFmDU9QsrrAa709Zmpug1Tah5gE9QRBp5SnHlIO72P1fOlS/u8xMw==
X-Received: by 2002:a05:600c:2315:b0:394:1f6:f663 with SMTP id
 21-20020a05600c231500b0039401f6f663mr246763wmo.115.1651682912419; 
 Wed, 04 May 2022 09:48:32 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n124-20020a1c2782000000b0039447beb28asm293220wmn.23.2022.05.04.09.48.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 09:48:32 -0700 (PDT)
Message-ID: <6bf00fca-20c6-b682-1806-e7ff49568532@redhat.com>
Date: Wed, 4 May 2022 18:48:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] Revert "fbdev: fbmem: add a helper to determine if an
 aperture is used by a fw fb"
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20220504134833.1672728-1-alexander.deucher@amd.com>
 <20220504134833.1672728-2-alexander.deucher@amd.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220504134833.1672728-2-alexander.deucher@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/4/22 15:48, Alex Deucher wrote:
> This reverts commit 9a45ac2320d0a6ae01880a30d4b86025fce4061b.
> 
> This was added a helper for amdgpu to workaround a runtime pm regression
> caused by a runtime pm fix in efifb.  We now have a better workarouund

s/workarouund/workaround

> in amdgpu in
> commit f95af4a9236695 ("drm/amdgpu: don't runtime suspend if there are displays attached (v3)")

Again I would write it as:

commit f95af4a9236695 ("drm/amdgpu: don't runtime suspend if there are
displays attached (v3)")

> so this workaround is no longer necessary.  Since amdgpu was the only
> user of this interface, we can remove it.
> 
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

