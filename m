Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA4B7E89D8
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 09:26:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F379210E139;
	Sat, 11 Nov 2023 08:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96CD10E139
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 08:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699691180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=92ui9aGQz7iflvc1jcLMyOxURaRtvKs/xaTeeVmLJXs=;
 b=eMQYvFNjDtwY76mtsAcAXBpEyiSY/wl5rlmcaYpE0AmcT/95+HpHWR5vVt9aChoxWSRifv
 2bjH/s6MDSp2XrDKLoz6WqGYfFIE1OOOmThmXNIuYETyG/CnQsuIwITVM8zS9YAcsZRasY
 g1ZRrFfjlNM7pKvE0oU0gjUCwfSVbdQ=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-_Z9AuNZ1NbWdMotbb7v6MQ-1; Sat, 11 Nov 2023 03:26:15 -0500
X-MC-Unique: _Z9AuNZ1NbWdMotbb7v6MQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2c50dcd377eso28634051fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 00:26:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699691174; x=1700295974;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=92ui9aGQz7iflvc1jcLMyOxURaRtvKs/xaTeeVmLJXs=;
 b=ulERmMwMD5Qmb6+2esHmJ5G0XQZlIEQInQJxXW4pzT9/t8rpZz/eGOEt2nziJPnkka
 x172k/sYSpZjT/UwbEfScb5AvSCmgaeElLAgctf515cW/gek/+jd4nXj5mKuu4uaCUW2
 83BMA8LKRnSo8nGtl2fU0qVqC0F7Zg08TGW36k2LYeMa1CqbpR++iqTL8yWsXwv8e25l
 MemWWxhEV/h6pCEWHQJjOxzF2rWhT2vPrG/v1CbtPIkUwhsr/8Ehk+FuDEyJ9mnklXPk
 UbigIBuM0j8fdJ/VQISd79wWCejEzlTFl59xVfdBUqn4eu9GjhtH7Q+5XH4xwxRavl+M
 TR1w==
X-Gm-Message-State: AOJu0YwMmqtDjYokrw86anTEw8AmiAsSbAacpBjnxTAd9gx1Vxem+yC1
 6yiP4ay0jD7D5LOP+GBzciXsZMZbRnHBR+WMe31tvYnN1QhbxIJ2IpK8qsIu008J2mXMgyinM2I
 0czqWvzR/sTamO1uqH06IYVPU5rfR
X-Received: by 2002:a2e:9c4d:0:b0:2c5:1bd9:f946 with SMTP id
 t13-20020a2e9c4d000000b002c51bd9f946mr1078220ljj.9.1699691173970; 
 Sat, 11 Nov 2023 00:26:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/gQ2RxMPrbb733WVLyeiZTyYaXVA5ObwiIiMVVog0zfVseHB8d0M9CVyq1CWPfnSoRBzdfw==
X-Received: by 2002:a2e:9c4d:0:b0:2c5:1bd9:f946 with SMTP id
 t13-20020a2e9c4d000000b002c51bd9f946mr1078212ljj.9.1699691173690; 
 Sat, 11 Nov 2023 00:26:13 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p6-20020adfe606000000b0032d2f09d991sm996976wrm.33.2023.11.11.00.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Nov 2023 00:26:13 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>, Jani Nikula
 <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] Revert "drm/sched: Define pr_fmt() for DRM using pr_*()"
In-Reply-To: <20231111024130.11464-2-ltuikov89@gmail.com>
References: <20231111024130.11464-2-ltuikov89@gmail.com>
Date: Sat, 11 Nov 2023 09:26:12 +0100
Message-ID: <87leb4ae6z.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>, Luben Tuikov <ltuikov89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Luben Tuikov <ltuikov89@gmail.com> writes:

Hello Luben,

> This reverts commit 36245bd02e88e68ac5955c2958c968879d7b75a9.
>

You should include a commit message explaining why this commit should
be reverted. I noticed that was asked by Jani so I would include what
he mentioned in the other email thread.

> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
> ---

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

