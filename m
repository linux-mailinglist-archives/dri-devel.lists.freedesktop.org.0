Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 046146E33E3
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 23:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5187B10E1F0;
	Sat, 15 Apr 2023 21:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685A810E1F0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 21:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681595246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rSTPs5F/i9EeB6psBwgy+ByCTgrZZ6wRGOWTzfSp7bw=;
 b=PniL1rB4+/jSyDo5UbHULLrPImpdEtZng/IAdAaC9qtl/RFRyqaZAUeMxy0QCmMF+GZCXp
 MhXd1gC//Kg7RT/u0x0Lu4xN24/gH6uKt6WQwulVJVz51XyNewKeAnju8zuzw9FwR+X7f8
 gJJub8at3uIVtBLnB9s+33P7IjNLHt0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-pMFZpFKFP1i9UZF_DoOgbA-1; Sat, 15 Apr 2023 17:47:25 -0400
X-MC-Unique: pMFZpFKFP1i9UZF_DoOgbA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f0b0c85c4fso8739245e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 14:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681595244; x=1684187244;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rSTPs5F/i9EeB6psBwgy+ByCTgrZZ6wRGOWTzfSp7bw=;
 b=fHay9gRoRFc+Q72hkNdNiqQiKmmiYaPtXxzIgI4wLAGNZuwWV3gaa/AN6OKbgPf9WZ
 iEOntEAb/48hRMHTedEvPtDFJSf1ioK0YHipmSttK3pBXCfN5Di2GJQp6ST02t3SSmKl
 vUeKscnp93zYQlMIb3NLtrWrGyH4NYf6QGr+ptcqgaxb275cmo1PDE59W1FHJxFj53RS
 RKcOkIO1T2zfKB5Ln+fl5iI+hBHvZK8g7sLkYfwJTgfV0rUzkbF2bZNbkyVwQDf2f+Z6
 RnqQSYI03D4WNTojLV4LDd+0R5JtrAKx25cMs1Jst3z+htNgMrKajeY57PDXaa0/Ids7
 ZObA==
X-Gm-Message-State: AAQBX9eFPmpoC5NFt4R3ZauF4Js67JER7sf3bhlO0aw+HY8ELMEvnRWS
 VZ3pWSuFZhP/z+JkWn2mqnyQZYyxzeb2bm4DN1GzL/1zuU4/sbWyLC4W9nfuRK6rZH5eAvgBfyk
 DoxIwhXMY7nWcLeIrkRP3zFNPjg7s
X-Received: by 2002:adf:ce0a:0:b0:2c3:f79a:7319 with SMTP id
 p10-20020adfce0a000000b002c3f79a7319mr2139028wrn.17.1681595243893; 
 Sat, 15 Apr 2023 14:47:23 -0700 (PDT)
X-Google-Smtp-Source: AKy350bo/9FUWdO5bbaAtt+rgUwOp+hFoPtxu0qyYkgRivcMgh5XBxw794lpGQbfPmOpsT9TjjnPCQ==
X-Received: by 2002:adf:ce0a:0:b0:2c3:f79a:7319 with SMTP id
 p10-20020adfce0a000000b002c3f79a7319mr2139014wrn.17.1681595243634; 
 Sat, 15 Apr 2023 14:47:23 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z17-20020adfe551000000b002f7394e7c01sm4240665wrm.104.2023.04.15.14.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Apr 2023 14:47:23 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel
 <p.zabel@pengutronix.de>
Subject: Re: [PATCH] drm/imx/lcdc: Fix compilation with CONFIG_OF=n
In-Reply-To: <87bkjog7jo.fsf@minerva.mail-host-address-is-not-set>
References: <20230318221027.260115-1-u.kleine-koenig@pengutronix.de>
 <20230320092234.knm2nbdcvrmyhbev@pengutronix.de>
 <87bkjog7jo.fsf@minerva.mail-host-address-is-not-set>
Date: Sat, 15 Apr 2023 23:47:22 +0200
Message-ID: <878resg6mt.fsf@minerva.mail-host-address-is-not-set>
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

> Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:
>
> Hello Uwe,
>
>> Hello,
>>
>> On Sat, Mar 18, 2023 at 11:10:27PM +0100, Uwe Kleine-K=C3=B6nig wrote:
>>> The driver needs the include <drm/drm_bridge.h>. WIth CONFIG_OF enabled
>>
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>
>
>> Just noticed: s/WIth/With/. Assuming no further review comments make a
>> v2 necessary: Should I resend for that, or can you fixup when you apply
>> this patch?
>>
>
> No need to resend, I'll fix it when pushing to drm-misc-next.
>

This issue was already fixed by Dave in commit b24343eaceed ("Merge tag
'drm-misc-next-2023-03-16' of git://anongit.freedesktop.org/drm/drm-misc
into drm-next").

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

