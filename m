Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 035BD82D50B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 09:27:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8E510E038;
	Mon, 15 Jan 2024 08:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB61E10E038
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 08:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705307248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pehUlh5mpGQ5TGIbBN/xVKuXzozmXoCM9xJyPY4GLE0=;
 b=GYzKJjCB6Ub9oM6AtPeKHLpid/ui1SptJbxTTFAtSQ3M1VeiwdaNT57zqRK+c1Fsu87sgJ
 ljsdxlwWWkTum+hmOyHsNyP9VunlMBEOIafr8IXaoyuTjUOBb++uUH8KxHth1xr7n3MnJy
 ABBpGtF3jEJpwzRORyFYMDWxyOdzW/A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-aeQK2TUMOiKFizwFpqXwCA-1; Mon, 15 Jan 2024 03:27:27 -0500
X-MC-Unique: aeQK2TUMOiKFizwFpqXwCA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40e6d2dbd63so14638895e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 00:27:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705307246; x=1705912046;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pehUlh5mpGQ5TGIbBN/xVKuXzozmXoCM9xJyPY4GLE0=;
 b=ZKspUH+TBv7WSEigFEIrS2xqsCKp/hw9feZf0oD1Hs8iIGy40w3xkdqj8W1JimDU4s
 67ng0You7b0wO0kdNdhfOaGTJjJsney31ZrzQDc29POf4yv+ZF5feVFhj1Q01Bw3Q4Dn
 6yt3uFB6yiILCHeoGlhWUCAuRlZjbN9IzcGlRFtXT0bCz1stUjRxbXUvat+rAZkN9Ml7
 qsxbertO8uQfNnUSQpkHn3Bj8XJvGJMvtUUjmR4wmtlgFLk6STjFFe2SAtwsD+W8sWB/
 0TS/mDUVDP2l8hSn2ZEVxVqw4N7WFrVe/L7ACSRhYCHXN7FILoubPtwNaAHT13O9yB3R
 C6xQ==
X-Gm-Message-State: AOJu0YxuZar00gLnbGJmyMQCMt2hHoXW3Gn+fSNt4tiLR90d9KpIK4Ds
 VCxp8/NSJKU8bm1FGDtW6Jn9hFDo7EExbkNLdFjFcBUTqZKH6OsU5ZhhwFgguJVS+V6YqqoR00E
 LGKIA3cg+Zy8aaYmWD6esvem4IfPsHuHYie07
X-Received: by 2002:a7b:cb93:0:b0:40e:6792:ac08 with SMTP id
 m19-20020a7bcb93000000b0040e6792ac08mr2081305wmi.14.1705307246015; 
 Mon, 15 Jan 2024 00:27:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2x/nlsctM6zk5v7GGg1IXQBdJ9MByR0vhFREzXeFeH6SHdHa07Hl7vvvScqLoCtW0k+RoYA==
X-Received: by 2002:a7b:cb93:0:b0:40e:6792:ac08 with SMTP id
 m19-20020a7bcb93000000b0040e6792ac08mr2081301wmi.14.1705307245688; 
 Mon, 15 Jan 2024 00:27:25 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g7-20020adfa487000000b00336e69fbc32sm11277592wrb.102.2024.01.15.00.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 00:27:25 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/4] backlight: hx8357: Utilise temporary variable
 for struct device
In-Reply-To: <20240114152759.1040563-5-andriy.shevchenko@linux.intel.com>
References: <20240114152759.1040563-1-andriy.shevchenko@linux.intel.com>
 <20240114152759.1040563-5-andriy.shevchenko@linux.intel.com>
Date: Mon, 15 Jan 2024 09:27:24 +0100
Message-ID: <8734uzovbn.fsf@minerva.mail-host-address-is-not-set>
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

> We have a temporary variable to keep pointer to struct device.
> Utilise it inside the ->probe() implementation.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

