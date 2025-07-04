Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CCAAF8936
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538A310E939;
	Fri,  4 Jul 2025 07:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DazL03ji";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9658310E939
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 07:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751613894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t3pqzuEU6lUelyChR2FMIfflTZdeMGcMf4whExnv6QE=;
 b=DazL03jinUVbULnxVLZPyhZTlvEFzU01z4hpIWhaGH4jppL6eTYSmR6MVGQougu6qCKqaK
 a54kL1hVCSZy7zvwegVHq+oGs4X1nU8Xu5d8on7cxamhlQp3VPDlgt5/jKOpLla4yuwmTl
 pfv78s3mzDQc4d9rBmx0wRU4lW9+hT4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-feGqQEopMsur1tApFUO9wA-1; Fri, 04 Jul 2025 03:24:52 -0400
X-MC-Unique: feGqQEopMsur1tApFUO9wA-1
X-Mimecast-MFC-AGG-ID: feGqQEopMsur1tApFUO9wA_1751613892
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4537f56ab74so3409455e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 00:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751613891; x=1752218691;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t3pqzuEU6lUelyChR2FMIfflTZdeMGcMf4whExnv6QE=;
 b=Q43f+4DqGRzBpfpFzS0yKRvmXmVqjwMPp9LpxEscS73WRxTVAHfSyw71Rk49MbrmbZ
 LuD7Yh1DHThXeedLqlYkrnlWUtKltgNvszUXOeFeLjrjny42JZ2tzWPOd1dhcK69HpFn
 9rGtY18mtY7LwMKx/NOFOO3fTMYI4lMqhMK85Ymj6JLRq6WdQFMF1EtGUOzUxeovBFes
 eVVSeo/Hd8Z7ZZXu4uRN0wq4Igo7dGFlrF3SmMgwDNGZDmkwcPwyKT7QNeLYDs5Wx68g
 QEpLx6/zWXlqWBhaTGyli7QrgnwCZME42cM3GbxwoSwUJU59bVjyhny32bPwuvVZE8qg
 ETNQ==
X-Gm-Message-State: AOJu0YzTmHW6Pcti8m/beit3vTsiUHm1YduBlzrll6AxN/Mzi12uGCZn
 Xuzf/1kHbytb6Juq6Sh9BPJmr0ATUXYVYpnHGxM9Q+Qs+LRJvmB2iB6KjoQ84f+DzNrcdzGQJdq
 ySHWYk09HyI+TjCKK1kQleF1DnHZcS8AgtpjJMmP/qhwtQTgcitPWFiWP2Hlth8qrU+tPCQ==
X-Gm-Gg: ASbGncvSN1xeVwt30huOa+mtUEx4YE76KtL2ZlxjrihBtVZUsV+z+VFTD6I0WUR/HYY
 w7owuyymr/27x4mfJWO2qIthpip74ZQPoxnXQLvEZOllY6FCEaoCm9+USYqcMCwOd+06wDuzM7y
 MZqnllGFEXwBmOPiNPo1mgwasEPXOYXbT37+mAai/kKJ0TJJQaly1N4it3l2GuFgP2EjqONUPpV
 E1IAgO8AmAqG+2r0DQxKkwBe/Zvb0GkF3fNFy31sYTjFLWF7BqUmjdDgsXTwjaNW1J+5A7CwFHL
 kyH5pmsxfPohzYc3fPQIYb1TMdMTcG6NF0Vdo9sWOzlgSR09RdWNq1BB/H2imn3FfAIti7ywYw0
 FtYjh
X-Received: by 2002:a05:600c:6819:b0:43b:ce36:7574 with SMTP id
 5b1f17b1804b1-454b3116294mr11787325e9.11.1751613891307; 
 Fri, 04 Jul 2025 00:24:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFawS16UWK8Cei2oxJozQ2xoL7ukg0sVAQfQL7XriXZDXrLUvcPvBSiszYsy2Vr1Z8y0Jkzg==
X-Received: by 2002:a05:600c:6819:b0:43b:ce36:7574 with SMTP id
 5b1f17b1804b1-454b3116294mr11787045e9.11.1751613890789; 
 Fri, 04 Jul 2025 00:24:50 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9bea4a9sm46322055e9.37.2025.07.04.00.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 00:24:50 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/simpledrm: Use of_reserved_mem_region_to_resource()
 for "memory-region"
In-Reply-To: <20250703183447.2073902-1-robh@kernel.org>
References: <20250703183447.2073902-1-robh@kernel.org>
Date: Fri, 04 Jul 2025 08:24:49 +0100
Message-ID: <87plegju4e.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5j7kiYtWa-33HPtYNEnppqlAfyARZzpYtFr_topdbdA_1751613892
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

"Rob Herring (Arm)" <robh@kernel.org> writes:

Hello Rob,

> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

