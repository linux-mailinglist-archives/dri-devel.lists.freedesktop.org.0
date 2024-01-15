Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C5F82D4FF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 09:24:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DB110E16A;
	Mon, 15 Jan 2024 08:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC72910E16A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 08:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705307052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WdHL5Nw4L0E7LviK69bDEOS/TGajAce1+kECtONWdOQ=;
 b=UUMqzTNzA8YwpfeQNOTcFeDejrxF1OHzZTHWnzmfjEDWEqQrdsCpa/3xsHB3dWzD4mcle3
 SwQTtgqerLJsAPRy2iDsifopLt7UW6eV/9MpOl4LH2oC5CpvgDLIexoRG74kjNHYt7h1c0
 /eKecx7THtQHjGUqAtmSaHnxCwdlFEA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-uu7UqcLbNk6HYI5ZVdxlIQ-1; Mon, 15 Jan 2024 03:24:10 -0500
X-MC-Unique: uu7UqcLbNk6HYI5ZVdxlIQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-33689c90957so5338182f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 00:24:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705307049; x=1705911849;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WdHL5Nw4L0E7LviK69bDEOS/TGajAce1+kECtONWdOQ=;
 b=vjfcpZiRjqeLact2cWOv6KDCtE6TelzZ4/P6JEgMd9tNcdkiWmeXOZJ7chLE1pZAxL
 n7kwDBcTnQSUs+btHDtiLCRtktM+OOmdBMXpQGNEUNsRotRWN3RcfDZRJUcOQ50mH8eW
 Ey2xEi3e8ff+VoaB3UZa0xkFUAtvvSwOZNA+dqxhyW+AGrPpvIyzGQLaHGqm5O1K5vge
 neiztiip1Yls+9iBqu+Rw1uzRNiBxwm0TmQPFPgKkUJYATRcylLUvIXZue6mi3gJ1/nG
 qGzrvC5Y46McEAyjoH7JR0f5F5juCgQKuc4zEllO8zedskI+bHDnrlOdTwqaIu0njH6L
 jKww==
X-Gm-Message-State: AOJu0YwQhBCZ3bIwVnGBIybDoLDRbvAzks3BWNmAo3qkUgPOHDM13MMK
 aRv2K+eoSdjiI6uQLXBjgl+PK5qIenURdpKyCnM6p6kL4motLMUGZXZRfyMIw4ahBQHF2dmXMDp
 aRfvI86SwzUIRZnoj9ywMN3wy+PJp98AjqYsA
X-Received: by 2002:a7b:ce89:0:b0:40e:616b:50f with SMTP id
 q9-20020a7bce89000000b0040e616b050fmr2463778wmj.141.1705307049670; 
 Mon, 15 Jan 2024 00:24:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBEbtq4O+FopQ6pQyQO1trt0NUo5+q0+USaIZPNgscLYIqA4FgDvQ2PPDGSn+Q3oE/+3Jcxg==
X-Received: by 2002:a7b:ce89:0:b0:40e:616b:50f with SMTP id
 q9-20020a7bce89000000b0040e616b050fmr2463771wmj.141.1705307049365; 
 Mon, 15 Jan 2024 00:24:09 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g21-20020a05600c311500b0040d30af488asm18874042wmo.40.2024.01.15.00.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 00:24:09 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/4] backlight: hx8357: Make use of dev_err_probe()
In-Reply-To: <20240114152759.1040563-4-andriy.shevchenko@linux.intel.com>
References: <20240114152759.1040563-1-andriy.shevchenko@linux.intel.com>
 <20240114152759.1040563-4-andriy.shevchenko@linux.intel.com>
Date: Mon, 15 Jan 2024 09:24:08 +0100
Message-ID: <875xzvovh3.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee@kernel.org>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

> Simplify the error handling in probe function by switching from
> dev_err() to dev_err_probe().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

