Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF1978F951
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 09:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F7610E048;
	Fri,  1 Sep 2023 07:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBFE110E048
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 07:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693554492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T97c3bZ8yb+eC9c+2FRwgNQ1FZhHS3MTO2NaIJuhVao=;
 b=DBQyfMgyumgkg6gqTYjpQpl71LkwdakSYpFzcSET5/Ck70vthPKGAWTqUCDu+okZcvoZOJ
 S7n2PzlEU0hZ2iV5ZAVk5bdOj9f1jrzsNXQa1wA0iygsn1LvDRRupkhaay9Zj1TSfqbPEO
 f0KVBrTdx4lP9j7Bdz7e5dZ9QYWM1Qg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-Q7ncjKh6OmCTj47YCMaGWw-1; Fri, 01 Sep 2023 03:48:11 -0400
X-MC-Unique: Q7ncjKh6OmCTj47YCMaGWw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-31c5adb698aso887841f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 00:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693554490; x=1694159290;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T97c3bZ8yb+eC9c+2FRwgNQ1FZhHS3MTO2NaIJuhVao=;
 b=jPw9M4GDGrWr+UuuXwIdBkHAYiUZmi/sbzAd+/BYCJQPY21w/YyxEClFFd+AdXXXMt
 lgg9Kzx/Pllc/HgVuOjpo229uZPADGUzgVlr9h/RR4+ZP9AnSqUmq6aomp5AqwKrkQF1
 bOCnp/GnGGKsOIvU52z/UsXny3fEUCWm7dSZuNTlhco4K3zpn2t1BPpvUvAKfARr/UQP
 FCSx7ICx2u+1s5iTgS89308YCZvABN2q/Gj/Gvabs5FZ48mm4zFB2zxIY7JCV3xNh3Cp
 6pXQbeLjbvWf6yhT8QsSNKkXG+bx28crowd6g/BV5qPs6FzVrpxnIbVBdobrlXd29RPQ
 Xr3Q==
X-Gm-Message-State: AOJu0YwAuP/OSnBCGJkEgeFHmsBLy7kxh5S4+CkJh8GJWhrXHUh/oXcl
 Q/hqmJykXMEqnVKSX9gRU7Jh25S3hFtrjnLVyewJlcBkNAo+dTubBnZaCo3IdWVu5HulXAEH0KV
 UYI9MYrNgvdiGqV7h4I6IqcCxFkAl
X-Received: by 2002:a5d:4c84:0:b0:317:df82:2868 with SMTP id
 z4-20020a5d4c84000000b00317df822868mr1487329wrs.26.1693554490286; 
 Fri, 01 Sep 2023 00:48:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEW3eqNjK7xkdR2zFqkK1SPACYHfa9Yg5dPyFnPdq2CybRvXzbPspfdjI/oMUXKz80HfDldzA==
X-Received: by 2002:a5d:4c84:0:b0:317:df82:2868 with SMTP id
 z4-20020a5d4c84000000b00317df822868mr1487323wrs.26.1693554490008; 
 Fri, 01 Sep 2023 00:48:10 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f7-20020adffcc7000000b0031c7682607asm4399804wrs.111.2023.09.01.00.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 00:48:09 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] drm/ssd130x: Allocate buffer in the CRTC's
 .atomic_check() callback
In-Reply-To: <6654778d-1f40-1775-c32c-ebf9728bc9a9@suse.de>
References: <20230830062546.720679-1-javierm@redhat.com>
 <6654778d-1f40-1775-c32c-ebf9728bc9a9@suse.de>
Date: Fri, 01 Sep 2023 09:48:09 +0200
Message-ID: <87ledqbah2.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi Javier,
>
> another idea about this patch: why not just keep the allocation in the 
> plane's atomic check, but store the temporary buffers in a plane struct. 
> You'd only grow the arrays length in atomic_check and later fetch the 
> pointers in atomic_update. It needs some locking, but nothing complicated.
>

Yes, that would work too. Another option is to just move the buffers to
struct ssd130x_device as it was before commit 45b58669e532 ("drm/ssd130x:
Allocate buffer in the plane's .atomic_check() callback") but just make
them fixed arrays with the size of the biggest format.

That will be some memory wasted but will prevent the problem of trying to
allocate buffers after drm_atomic_helper_swap_state() has been called.

> Best regards
> Thomas
>
> Am 30.08.23 um 08:25 schrieb Javier Martinez Canillas:

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

