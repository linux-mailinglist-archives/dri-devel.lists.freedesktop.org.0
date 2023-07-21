Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A2A75D798
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jul 2023 00:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9699D10E70C;
	Fri, 21 Jul 2023 22:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579A110E70C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 22:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689979175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=djeVFkwc7o11bqagTdpCOjfKwmcqowaFNZyoMjR9tzs=;
 b=STOtfBz6xAoS1ZwLnT9bsI6Ip9aS1NxHDC5MsOToM3cqyVi1vL541XR51nu/mNUUjRjml0
 3dC+tYwQ8YlwSOpclDwZ/qz35afG+DgLg/hL1fEZMTxmBOoZyr4U27XfNNASv0TFswnFxA
 FdmpHv7wr4OR2q3K5dHoOrRjDQ6R/P4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-Fw8PlUiAOiK3PJjuCnCEpg-1; Fri, 21 Jul 2023 18:39:33 -0400
X-MC-Unique: Fw8PlUiAOiK3PJjuCnCEpg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fbdd5d09b8so14771825e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 15:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689979172; x=1690583972;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=djeVFkwc7o11bqagTdpCOjfKwmcqowaFNZyoMjR9tzs=;
 b=S9d6YvDm+Ajxn+8aXxDokRW6/SF4ErsENJiaqoPmo+A8lqjzo6I1cRyGF7i2puj3N6
 hLt0Y/iEQAE2yTMR6iDLS6aOhjWybln+MO1Y9ISBCHcQ4hWdJfY+qLw1/+QcGwuwquwq
 ucZvc7y7AOH8W2T/IiJpEtcyboEINxq4SK7fTMy+iPBYMF2tdpPhyc1aOdewpGzYnjIp
 UQpbhK5W0ckcSBSA7/aK7fBoWz38PY7E2c+ULbPBW50gDkXtNl7lbbbTbP7OVbAMH/mI
 V2qaSj/B6N2CLUlMSTzO83RzBjtVWj5MbCtbesunurUekraruIR8SAIiXoU8P3zSLdfF
 r/6w==
X-Gm-Message-State: ABy/qLaiUZNEbSIAe0x7uAXfNjp6AW1nO97nnfHCVCSA6KBjGUbdo+Aa
 DsTO8Y9dc+p7bti2h0X4gPSG7s1zt2ztNzilZvJqg/yqmWMNoK3yIgvFsc+1nn31OkugeVM0k0s
 JxTX5Z8+uBCerwhx1JtUbeGQw4WlP
X-Received: by 2002:a5d:688a:0:b0:313:e591:94ec with SMTP id
 h10-20020a5d688a000000b00313e59194ecmr2492209wru.67.1689979172736; 
 Fri, 21 Jul 2023 15:39:32 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFU19gbuGBPfn5GFP+ZJOAcjjr+4pjs4xq8gM4c2hidS9MPYgB6irSpOLn1E2i5bapMMgOciw==
X-Received: by 2002:a5d:688a:0:b0:313:e591:94ec with SMTP id
 h10-20020a5d688a000000b00313e59194ecmr2492200wru.67.1689979172460; 
 Fri, 21 Jul 2023 15:39:32 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q17-20020adff511000000b0031272fced4dsm5316385wro.52.2023.07.21.15.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 15:39:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/8] drm/ssd130x: Fix pitch calculation in
 ssd130x_fb_blit_rect()
In-Reply-To: <874jm69631.fsf@minerva.mail-host-address-is-not-set>
References: <cover.1689252746.git.geert@linux-m68k.org>
 <54deec2ec533e90544faa8c60a0c2518c58f3e9c.1689252746.git.geert@linux-m68k.org>
 <87r0pau99o.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdVAXPqjSNGMrZQ2g8FNNL4f7PbdoUCi17g9YOdoqmjFpQ@mail.gmail.com>
 <874jm69631.fsf@minerva.mail-host-address-is-not-set>
Date: Sat, 22 Jul 2023 00:39:30 +0200
Message-ID: <87v8ecubx9.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

Hello Geert,

> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>

[...]

>>
>> My point is that the 8 as used here is related to the number of bits per pixel,
>> not to the page height.  The page height might also be impacted by the
>> number of bits per pixel, but that is orthogonal.
>>
>
> Ah, I see what you mean. Yes, you are right. We can later add a
> different variable when adding support for controllers using R4.
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>

Pushed to drm-misc (drm-misc-next) since this fix is independent of the
rest of the patches. Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

