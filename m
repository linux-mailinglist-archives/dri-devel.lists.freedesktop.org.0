Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A02A6E3A6C
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 19:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E4F510E274;
	Sun, 16 Apr 2023 17:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9A110E274
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 17:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681664794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q3eQf+nuXagapZ6RA847Q7+/qAh8XS3Ba3lNQm6cHPQ=;
 b=cDllEfxm2weO/MRYJsRAJfjZ5zGjPLA8M8UkE66TilBMvRdQ87SjX9eCo1w107J09N7E2x
 SjtWW8gEFYJsIHQZAdfr1Upg1CBYfU7UK5Vsm3ALQJuQq1YKNyYXtE3Za5FqLTnV+/PFnU
 GZmbS+BNgn1NSw5eyQUBFYHywNJofQk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-u11TF9z1PkKcJi0luLvnTQ-1; Sun, 16 Apr 2023 13:06:33 -0400
X-MC-Unique: u11TF9z1PkKcJi0luLvnTQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 c20-20020a05600c171400b003f173d94427so93576wmn.1
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 10:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681664793; x=1684256793;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q3eQf+nuXagapZ6RA847Q7+/qAh8XS3Ba3lNQm6cHPQ=;
 b=ai2QtImxSUjHjKbBD2SGMAJkhG/7E9opaKQm7EzU48I9i9PAsNGCaMI8waAF9y3WDT
 oYVg9flIQ48U0Cvn00N7bikvAMM8qk2TayzCj6L5SW9BsEBp94yBT6LbkenIICr0FRql
 cswUGh7Sc4Fut1szwwZg5WZrOXUz+JluGGHEr4H+jm0Sxy4JQqv0ThpOY56YXYsd2s4/
 6EI3mf1uQLU4ZQ0kS62ZZzYzm7AsmIXa53DYK3XRw4t6sfZKdeEHHUd4gPdMOAKhqjtY
 LReu9tRajWJ0kavOLmPNKlZqYKgahoMx3eDvbrOfzKdfL7MWRuHn2d2EYcwgNDb5rsTE
 xF3A==
X-Gm-Message-State: AAQBX9cvVM80gvgbb0wqctfE15LDFGbUU8BeCnohfq8oRGgfR7lmSaUK
 fpbNBjQGPqU1ckQ4r4v5CQJsUa5sbfenuT5n7CK0GWYaZh/KWpNDOkVNoDP/TA7QoK0sFmimrqA
 0WDXp10JSIuAZ3JqvAV9N0zdT3Lc0
X-Received: by 2002:a7b:c4da:0:b0:3ea:f73e:9d8a with SMTP id
 g26-20020a7bc4da000000b003eaf73e9d8amr9165632wmk.30.1681664792797; 
 Sun, 16 Apr 2023 10:06:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350auvwiqWlbS+k2oB0Z32sOD06nxicw4EyynB/yvnT8wFnZYSrSjyacM44dFmCfVQcvOsiuPfQ==
X-Received: by 2002:a7b:c4da:0:b0:3ea:f73e:9d8a with SMTP id
 g26-20020a7bc4da000000b003eaf73e9d8amr9165621wmk.30.1681664792539; 
 Sun, 16 Apr 2023 10:06:32 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c10-20020a7bc2aa000000b003f0ad8d1c69sm8525297wmk.25.2023.04.16.10.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 10:06:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] drm/imx/lcdc: Fix compilation with CONFIG_OF=n
In-Reply-To: <20230416165526.ql7vcz3nos76du3o@pengutronix.de>
References: <20230318221027.260115-1-u.kleine-koenig@pengutronix.de>
 <20230320092234.knm2nbdcvrmyhbev@pengutronix.de>
 <87bkjog7jo.fsf@minerva.mail-host-address-is-not-set>
 <878resg6mt.fsf@minerva.mail-host-address-is-not-set>
 <20230416165526.ql7vcz3nos76du3o@pengutronix.de>
Date: Sun, 16 Apr 2023 19:06:31 +0200
Message-ID: <87354zg3jc.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Shawn Guo <shawnguo@kernel.org>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:

[...]

>>=20
>> This issue was already fixed by Dave in commit b24343eaceed ("Merge tag
>> 'drm-misc-next-2023-03-16' of git://anongit.freedesktop.org/drm/drm-misc
>> into drm-next").
>
> FTR: s/b24343eaceed/c6265f5c2f50/
>

Ups indeed. I pasted the wrong commit :)

> Thanks for looking into this, and also the other patch for imx-lcdc!
>

You are welcome!

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

