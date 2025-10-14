Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ABEBD7F44
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 09:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE1E10E567;
	Tue, 14 Oct 2025 07:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aqYgx6DC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33CB210E567
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 07:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760427361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rp2yi8Bcjq1dxm5BHjQD+Bw0UYm59cbcglHsDw8XOKA=;
 b=aqYgx6DCDAcNonMQd1UK7RYR/eAMr7Ah7I8GzNEqTjwsCnC4Wp+JMlcXL8BMAxhQkeFXYt
 aUETWkOfpq3O+CNN5iZVtDJX5qfsJS7vOn7/f/6DiC9go1dl6Cht4xdR3CJ3yTSlznTvh+
 WjOQaA3vn/p5jDacDtM+WEcdIfUYrwo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-YGAwc9SDOkCIiDH4w4oy1A-1; Tue, 14 Oct 2025 03:35:59 -0400
X-MC-Unique: YGAwc9SDOkCIiDH4w4oy1A-1
X-Mimecast-MFC-AGG-ID: YGAwc9SDOkCIiDH4w4oy1A_1760427358
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-46e3a049abaso36183645e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 00:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760427358; x=1761032158;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rp2yi8Bcjq1dxm5BHjQD+Bw0UYm59cbcglHsDw8XOKA=;
 b=uO6EplxUl8JBqykeAgwtuSNNcEP5FEncYrT7/2C9At2WeQiNVV32DRZKVj8msMkDfC
 PYqaeR5a791a6RS/OXLcGL1oiQxWbrsdOARGqJt9RTMhV29hcl7mVD3O5Q30tzpsePbp
 Qt9Jue4bmNHzxLDVjfHw0N/YSIEStzH4WEtXrXeOVH6iB/AjqjxZszJK+pDCp3ySZlJF
 vrf/OGQ+xBimbt37Z4A/A3ASqGHEHvYtdXATrbuIjYRQ0xiphc2Xwf3vzjKz25gbVCvz
 XSKl2CLTTO9eak+Qv7oNUYtyqORYTrE5UCN26z8BBCFJJb6k0SSgN0x9Iao3DpQ6I7Om
 BDDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCViXdnZ/TFLz/Kk0Qv/N8luK0eXN+FKmWd2eDqaEhbFo62VE3slIan/fGuM0pvoCyTF8QY9U37XcuY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiYekxzsKHKhdP+yO7QVHHOF++kWCFaBYJJkQpbPhKO3ErDN4B
 TQaIHWO9R82t1GVSSroRvXcZ8kEajGIM0p9GHKTHZdyU/EO9tX8eMvj74Yy6a7TI4gGJm3eVESA
 2pE0H8gDLA01zo3n4rL+5/gX/evZPjdHkENQUApFEranl+PDVsfoAj4MDeYonujnCLDi+sA==
X-Gm-Gg: ASbGncvGo0cSFew5NqmWtrCBr4vmmPS/R10KX9g4qg07I4Af7/j11omOaTOM9TrE8ep
 TaXv2oWeP+uqNGW6pmTE7Q03Im0GleHWesg6zFQo7EODA/RlSRDr/vX5OroyvtX6MCoVVxN+5nR
 Lt1F8bpGpnUNZUiyBhyYZBMJR1o3Skq5bhNI83CCYkEKwrtuWRgcU3yHdLbuYeI76XWJ0qy27YT
 K0tb3R1OiGHUAh0k1suRlU959HRfa7eAW6u3TSyjZAcxZYMo6qpL0ux5Nsi2dWBduzw7i9o8KGL
 1mA+UmkPYS6UZGB31wKWyac/Q8jXCWRQoNgXEhemnMUJBJy5A0gCqfHNUEZOTG6lgbJdgl/fwFG
 c3eaZOf7ouJVnvoqLOlSuN2w=
X-Received: by 2002:a05:600c:198f:b0:46e:38cc:d3e2 with SMTP id
 5b1f17b1804b1-46fa9af3125mr171576545e9.22.1760427358269; 
 Tue, 14 Oct 2025 00:35:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWYlHv6WiUrgd9vj3CbYtPVGZ9RfLX5CoNkDJzKegevpgk8U/J3XAJpcTsFc+GvZf4Vvir4A==
X-Received: by 2002:a05:600c:198f:b0:46e:38cc:d3e2 with SMTP id
 5b1f17b1804b1-46fa9af3125mr171576295e9.22.1760427357923; 
 Tue, 14 Oct 2025 00:35:57 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb479c171sm224366945e9.0.2025.10.14.00.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 00:35:57 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org
Subject: Re: [PATCH 4/6] drm/panic: Fix kmsg text drawing rectangle
In-Reply-To: <20251009122955.562888-5-jfalempe@redhat.com>
References: <20251009122955.562888-1-jfalempe@redhat.com>
 <20251009122955.562888-5-jfalempe@redhat.com>
Date: Tue, 14 Oct 2025 09:35:56 +0200
Message-ID: <87a51uq6jn.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VYqJxUh9Om2l6zlDZnZ93cgeuQJqP9go5eW1QlqyW94_1760427358
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

Jocelyn Falempe <jfalempe@redhat.com> writes:

> The rectangle height was larger than the screen size. This has no
> real impact.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

