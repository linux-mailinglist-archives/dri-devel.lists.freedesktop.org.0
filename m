Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE99ACDCBC
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 13:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66E710E0FC;
	Wed,  4 Jun 2025 11:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="daq2ym1s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDEBA10E0FC
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 11:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749037011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C8a5MQW08d15nKShazDfS7QPFXLU7R+rb+4mnDBz0bw=;
 b=daq2ym1sCnl9TeWNBLRMZl0ybHSWy06A9d+F8ghKJncuKAHadFFuam9VIQH792g/HKwTs3
 VrBhXoOdvT7WXzolt6cK4eU5KzX5YYv/MzwM2oC+3kjPZwNTJxGxwmZG55Tzc9CLNqbqKT
 VqPzAjJy9T7RwfWZ+lN/1NFaiG8hDdc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-5t1ZKvfxPsio85_3lT6_pg-1; Wed, 04 Jun 2025 07:36:49 -0400
X-MC-Unique: 5t1ZKvfxPsio85_3lT6_pg-1
X-Mimecast-MFC-AGG-ID: 5t1ZKvfxPsio85_3lT6_pg_1749037009
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-451ecc3be97so6771545e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 04:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749037008; x=1749641808;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C8a5MQW08d15nKShazDfS7QPFXLU7R+rb+4mnDBz0bw=;
 b=pknHPj1qlh83zV5oLLoHvUvCoYt9ouDRfHD0qdLDhJsxZdLLOb+JE93G5qz78g45ak
 AAcMoqckA3++S35zRRXfCoW6d9omZHwBWQw7tdL1HFzMFZdwLuuCVoMHhbSseNkuHolA
 m0xVp22QsPsQfrObPLgWuKg/FSY9gobYGdIlTcAQm/qbvACcxjZbFOwUW+j72XzlEoQL
 LDScqRe66BM7Cudqhu5rUY9tgHiVtXBjhfj+LmsmnGy0EwPCW/Mb0EXDsi61dJP86TAV
 PN4gvpel8f4yjucRvukml30HyP63LgvJvVcV8YzDnKeQWdi85mVYT3KZw0RUP5NtXgEJ
 EtNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRmsRw9sKTbGY7xkoV7MYT9p+9FJTIfakeaMxXuS6j5IafW1j4u2hEQ17fjuUhVaAczBMprqLh5k8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx46joyTLF4c2f04j7cAjzhj9etVENcB21HPJfA6e8en1njGwOl
 5JCUcm9lW6K0bvn1i7/FMrnMeTO0Z+3rpRBfspNbaASa44jFKjhBytfLgLkQjoDEZbHD0/qhIo9
 ++5pbNrFHB9cSi72iCxLCxTMP3dkl7hqEhtdCRYqIvNRUP7HDn5mEtRz0j3xnbYcyY0mwLA==
X-Gm-Gg: ASbGncuYMf+13SmD0tKaMYm9nVOiBibNTvStEeBcu1phkbkpzjpvw/y520o2pxWGlpC
 qiiABAxjjASj97gwMUXsNF/XgjRhGRZg/oWcByKbDPikwwZ0T6WkWuA4MR1jZnuXWFmT7MdK2Tw
 d0bKPdxh7ksfR7yqf7U4JENilIe8og4FTfFVt6amvqY78k4oGXIhsciZWyNmmVRLs+zcuw60Dcf
 gCwzYO7RJbI1lU1FxpiyWHtTrnLCMBDTc2dPIddGGwvmqxnpmYWVxlDodF0d4AxtJcwKQjJfijG
 FRlaDjVG1x/h865NecokZzj6dNLxpALoTtYedKszWhqmLvt4n+vcLbpTxwP6N/H1K80yyg==
X-Received: by 2002:a05:600c:348c:b0:450:cac5:45e7 with SMTP id
 5b1f17b1804b1-451f0f00596mr20628185e9.1.1749037008616; 
 Wed, 04 Jun 2025 04:36:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9aGn1JqRF4v9GdB7S5N+Iv4QLVcuOxMVMUOmJ0PIBUt0HXZfcX/tKKMNX89n1OdgImFWvrQ==
X-Received: by 2002:a05:600c:348c:b0:450:cac5:45e7 with SMTP id
 5b1f17b1804b1-451f0f00596mr20627935e9.1.1749037008186; 
 Wed, 04 Jun 2025 04:36:48 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7f8edf9sm194938895e9.3.2025.06.04.04.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 04:36:47 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 sebastian.reichel@collabora.com, heiko@sntech.de, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, tzimmermann@suse.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, quic_jesszhan@quicinc.com, neil.armstrong@linaro.org,
 megi@xff.cz, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 3/4] drm/panel: himax-hx8394: Add Support for Huiling
 hl055fhav028c
In-Reply-To: <20250603193930.323607-4-macroalpha82@gmail.com>
References: <20250603193930.323607-1-macroalpha82@gmail.com>
 <20250603193930.323607-4-macroalpha82@gmail.com>
Date: Wed, 04 Jun 2025 13:36:46 +0200
Message-ID: <878qm7agc1.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fCfbTRBlZKPk0naAwsnx52VvVaPlYXn04zkGGOk5OrY_1749037009
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

Chris Morgan <macroalpha82@gmail.com> writes:

> From: Chris Morgan <macromorgan@hotmail.com>
>
> Add support for the Huiling hl055fhav028c panel as used on the
> Gameforce Ace handheld gaming console. This panel uses a Himax HX8399C
> display controller and requires a sparsely documented vendor provided
> init sequence. The display resolution is 1080x1920 and is 70mm by 127mm
> as stated in the manufacturer's documentation.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

