Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D240C757468
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 08:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D0E10E2D4;
	Tue, 18 Jul 2023 06:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39B510E2D4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 06:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689662347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uGWZGJs7iJ0bHkmNYO8V4KcHUQKd/vxJD2N3uDsccto=;
 b=ZuJAJ03Aj/fuw3xOsSNe3JNbS8PgII33FmcISQ6GJZgsycnnrj4+xED3sqi9+7yKHPxSvd
 JbzObVey2c0DY67oEu8RL8D449xd+Y1YerzVGae5xn1aC/QpSWYbzYN0W+Sr4HVVeesaKx
 eXRZbLhv6juivM2lkZCpSTk8jaJxgLc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-fsskmEEmP_uCMaBuIlY-EQ-1; Tue, 18 Jul 2023 02:39:05 -0400
X-MC-Unique: fsskmEEmP_uCMaBuIlY-EQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-31400956ce8so2921265f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 23:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689662344; x=1692254344;
 h=mime-version:message-id:date:references:in-reply-to:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uGWZGJs7iJ0bHkmNYO8V4KcHUQKd/vxJD2N3uDsccto=;
 b=jKlkQbk8kDAv4Tz01WpFOiYf/GazAcZdGo8ygivzTCaZxr6TCpdF5d6By5jOf4zc+M
 KOfcSqoo3OFn6YhQ7iTEn0mMhLZatsgeXapGMqIvpJH/1AcyaiBGBNlErqYKvw+D+fY7
 ZBn0499DIrpVuHzSoYRzvsi0iXeuWkSY+2aPpieWrN8aM9SNM80UOWhYagV7Lds1OkUj
 VtDBsokZ5L9jKDp0wHZSlZ00vxQvt1ap6RKTCRjer6Q9Ta1C3FzNcByqKKoRpcXOaIpn
 SG1Kz5flGUfMlo5a013ssm25HliBaD4kRe09bFvJBdtqPNpgkJURfw3O+DnwGUQ68DG7
 Li6g==
X-Gm-Message-State: ABy/qLZnd0IpetJMJ0FY3wuNYGrJ3wBKzELWITgzrFTnQvvEBOpuZ3CL
 ImTk+EYnyIwIo8ZH36XPwPABYFKKUwR8R1VwW61Roru6+jdVYhRmE15I79qLDZZEXL0HhuWwtsK
 H/YeZGt++xTNzbHBQiTHZ1MgVKWUL
X-Received: by 2002:adf:d4c7:0:b0:314:268b:21f1 with SMTP id
 w7-20020adfd4c7000000b00314268b21f1mr11320610wrk.18.1689662344258; 
 Mon, 17 Jul 2023 23:39:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHv18uaI93wFrqmmHeM+/M9p05Ssvf+TiET1HDtjWoK2EEJHqu10sNXHiTb6Zw0EgXCaxftWA==
X-Received: by 2002:adf:d4c7:0:b0:314:268b:21f1 with SMTP id
 w7-20020adfd4c7000000b00314268b21f1mr11320599wrk.18.1689662343997; 
 Mon, 17 Jul 2023 23:39:03 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c7-20020adfe747000000b003143c9beeaesm1393087wrn.44.2023.07.17.23.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 23:39:03 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Luc Ma <onion0709@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, onion0709@gmail.com
Subject: Re: [PATCH] dma-buf: remove unintended hyphen in the sysfs path
In-Reply-To: <64b5dc93.170a0220.243d5.1d63@mx.google.com>
References: <64b5dc93.170a0220.243d5.1d63@mx.google.com>
Date: Tue, 18 Jul 2023 08:39:03 +0200
Message-ID: <87zg3tiv08.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Luc Ma <onion0709@gmail.com> writes:

> From: Luc Ma <luc@sietium.com>
>
> Signed-off-by: Luc Ma <luc@sietium.com>
> ---

Even when is a trivial change I would add something as commit message, i.e:

"The kernel-doc mentions /sys/kernel/dma-buf/buffers but the correct path
is /sys/kernel/dmabuf/buffers instead. Fix the typo in the documentation".

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

