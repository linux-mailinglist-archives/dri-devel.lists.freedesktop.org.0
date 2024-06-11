Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9CE9037B7
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 11:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6EB10E06A;
	Tue, 11 Jun 2024 09:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Mg8TMaAo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745DF10E06A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 09:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718097691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K5GTV7BlK2ozuoCoh2H+zCl/e+bH6NP6Jtb2TQbGu10=;
 b=Mg8TMaAoCVL5DuVKTK59KynPizeUUNTVuPuIEJ8+zE+Y9lzStCGosNIiZInqEXhB0kiOxn
 i9BBqZ3saRMPGmWEFW4IpgpQiTc4nk+zt+WTTJDAEahw/x/ItnlEeYlZXqXqDHrZ9uIDtD
 OCLQK2fNWP3rsmgaIInUwqI6ortt/xc=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-sBK5T3qONeiYtalg0f3mCQ-1; Tue, 11 Jun 2024 05:21:28 -0400
X-MC-Unique: sBK5T3qONeiYtalg0f3mCQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-52b99933b68so4311405e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 02:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718097687; x=1718702487;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K5GTV7BlK2ozuoCoh2H+zCl/e+bH6NP6Jtb2TQbGu10=;
 b=P068l5f7t3tX02mcQyFibH45TJ7A6ueYRd9Be2x4TlREBmVkwoOltnmAeWLVxBA42s
 +HuY9FoxKfHwcvlGrIZALHs6cdQRNEHudyk8mtySLmb6binQb03qZUp7tgA4/mU6Hlxh
 rW2gO5fXdEWn61v/ccqTAvrL+UPnypk7ZOnZWukr89ZMzcR63dWIXJcTNKoT5KIUK7/V
 38rTvG2Dw/hliZDMqnqSHF6JOYPHWqKAFoEDksdF2aEazOjlQ+kNgOJaYfrwJ+BxZ11b
 H294oY4vVjLaPUIKLvZBqRDP9Iizr8HK9mfya50m+svcDh87swyPpocA+csKw5nAumMg
 2eJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWUBwjvYIHCjxr//gx/7qDTXfZmKf9E3eYhs8A5SIBpHgUpo6Wk9AMBBh3IPe25hMdIcgJgeNPHJaGM55YDLLoLzXIPYzEd9rKTbxTdJFF
X-Gm-Message-State: AOJu0YwBn1ROCM79jRd0BTh3bnpdfrtcSjYbbLrtpv8mDpVmd8vWiyJ/
 buCQv5+M7aSQoWQ8OFjTN2Srs82DTOngSHg6Qh1fGNJB6cIAQsRpoIu0f4RxQsvBlct/UpnbusF
 nIBJer1xAVwXPHfC+jP50g2icmbSyvtmDU1/UWf4d4ysWG8BfCUhGfl/pVm1BjXHvTQ==
X-Received: by 2002:a05:6512:340a:b0:52c:84bf:d1f9 with SMTP id
 2adb3069b0e04-52c84bfd23cmr5242473e87.8.1718097686891; 
 Tue, 11 Jun 2024 02:21:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYD3DPJz+KB4j2sqIejONHA5b6qTi2UrUqeG/moS07KbvWTTlC7YTTp/OPPM9nzH479IFL0A==
X-Received: by 2002:a05:6512:340a:b0:52c:84bf:d1f9 with SMTP id
 2adb3069b0e04-52c84bfd23cmr5242457e87.8.1718097686390; 
 Tue, 11 Jun 2024 02:21:26 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4218193b0c0sm84382525e9.31.2024.06.11.02.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 02:21:25 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>,
 regkh@linuxfoundation.org, rafael@kernel.org,
 dri-devel@lists.freedesktop.org
Cc: trivial@kernel.org, linux-amarula@amarulasolutions.com,
 andrea.calabrese@amarulasolutions.com
Subject: Re: [PATCH v2] drivers/base/devres.c: refactor using guards
In-Reply-To: <20240611082154.832340-1-andrea.calabrese@amarulasolutions.com>
References: <20240611082154.832340-1-andrea.calabrese@amarulasolutions.com>
Date: Tue, 11 Jun 2024 11:21:24 +0200
Message-ID: <87sexjx2az.fsf@minerva.mail-host-address-is-not-set>
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

Andrea Calabrese <andrea.calabrese@amarulasolutions.com> writes:

Hello Andrea,

> Refactored devres.c using lock guards and scoped locks.
> Changed functions:
> - devres_for_each_res
> - devres_add
> - devres_find
> - devres_get
> - devres_remove
> - release_nodes
> - release_all
> - devres_open_group
> - find_group
> - devres_remove_group
> - devres_release_group
> - devm_krealloc
>
> Signed-off-by: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>
>

A good commit message should not explain what the patch does (for that one
can look at the diff) but why a change is being made.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

