Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BE0A9C07F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 10:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D5D10E2B5;
	Fri, 25 Apr 2025 08:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QRoxi2lg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC3510E2B5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 08:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745568664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gjAjvw1+Nq9cvAR1/wP3+ixhCxFV+Pu6j8Ft769HCFk=;
 b=QRoxi2lgQGdNsURxP1ECTsPjFI8qg7a3d2qDBRMoQjQylF/CEn1xUqGKJD51P+Z6cegNeH
 b0eIoZdJy/bOncXrMmn8BCdIzOq8Qyb1ltSBUGi/9XAqJ6XmCLRZrIck48Swq6XIV76/el
 SawzwH/BIELqXf7e3c24IEdJDii3LO8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-0EUrUVx3Ob6V6xntPkZInQ-1; Fri, 25 Apr 2025 04:11:02 -0400
X-MC-Unique: 0EUrUVx3Ob6V6xntPkZInQ-1
X-Mimecast-MFC-AGG-ID: 0EUrUVx3Ob6V6xntPkZInQ_1745568661
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43cf3168b87so9158285e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 01:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745568661; x=1746173461;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gjAjvw1+Nq9cvAR1/wP3+ixhCxFV+Pu6j8Ft769HCFk=;
 b=hNDDi1PKFwnhFezohqB9tn93Y+Nr3kRHdLqu313XfmYwvoEtn9J7k8ZojwwispgM45
 ygzZ2hExAp0a5GwO55vFkSGJ4DRT7MhoVTw5cwbfqU0BLwCYP0xGM46k9uus7GfIdKqM
 MV9ISLwu0O1zLMTinw1BH4cesb3bRXCsSUs/nv4lLdAzA4Qel5+9NDedLMPXUAr08ldS
 Bnqc0NI6yploC2xwAdWVG2mS/pqB5L3X8knkkoRErH1xmYbIQnVO0T8Qju+q1eKteIws
 q99Ze+V21bq3deIrJBsXb7Ga5s4ctqOidlWcAcsl6VPx3xqtmltManSqtgUS4gYwWcEq
 w/3Q==
X-Gm-Message-State: AOJu0YxIkoaQk3P2qJ7PXmOZjA7ztBOo0t7vN51eqZ6R1H/BfcVe4tMz
 LUTLaPelarGGMC29kAMAHo944GoFolSt/E+aGfePwofQ/O6o487oFOe6/sX4FJd++RxsN8cDNxc
 P9dS/dd9Osk42vur55wBYlUqu54NMe7ezu0VAcss8NPne8Z6zPv/czjg0B3BXjcfV/Q==
X-Gm-Gg: ASbGncvhrc9KQSWfTlr4qp6xH44XGysYjU83YOtcwHU+gPdPT9kWmBrqQdry06rtF2Y
 ojZbxHjqSvfRXa7TXs8NwAAbPWyYZf+83JW1RWm65TXUNkgvJGf6VjAonEPnwRRZw+vUlgLP7uV
 Jz+/RgcBqsbgwN3sIMBTLSiUoLkb8JS46N9fxMPTxHz8IlnMr6Msaisj3dn+wYYRok1dgYibZza
 V+cSajrqwiy5QyreSm7f+60Oxp5Qt8DetZgcmL5derH3nsNMC/uKPfeChBnDrZOuI00EvaTVjqE
 wOKbTNBG7Qt/yXGbxHhT8yyyPBkuzPL8VE1EtrLg1DAuWwDj6Uxwv7/xJCknYfJdaU+J+A==
X-Received: by 2002:a05:600c:4e16:b0:43b:ca39:6c75 with SMTP id
 5b1f17b1804b1-440a660a95dmr13178825e9.16.1745568661405; 
 Fri, 25 Apr 2025 01:11:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGG1hGUTVFxGvN9ECzuYYQhIeCZ0Z2F7l9cCmcNcuP3tblbnfYMTXGWQxZOBqeYkqqKjjOLIg==
X-Received: by 2002:a05:600c:4e16:b0:43b:ca39:6c75 with SMTP id
 5b1f17b1804b1-440a660a95dmr13178485e9.16.1745568661047; 
 Fri, 25 Apr 2025 01:11:01 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a538f691sm16005575e9.37.2025.04.25.01.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 01:11:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Simona Vetter
 <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Philipp Stanner <phasta@mailbox.org>
Subject: Re: [PATCH] drm/tests: shmem: Fix memleak
In-Reply-To: <20250408140758.1831333-1-mripard@kernel.org>
References: <20250408140758.1831333-1-mripard@kernel.org>
Date: Fri, 25 Apr 2025 10:10:59 +0200
Message-ID: <87tt6cy830.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TBkIbasB-ZwDFi2xvtl92HW878kC3d_Ho9V589Jlh74_1745568661
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

Maxime Ripard <mripard@kernel.org> writes:

Hello Maxime,

> The drm_gem_shmem_test_get_pages_sgt() gets a scatter-gather table using
> the drm_gem_shmem_get_sg_table() function and rightfully calls
> sg_free_table() on it. However, it's also supposed to kfree() the
> returned sg_table, but doesn't.
>
> This leads to a memory leak, reported by kmemleak. Fix it by adding a
> kunit action to kfree the sgt when the test ends.
>
> Reported-by: Philipp Stanner <phasta@mailbox.org>
> Closes: https://lore.kernel.org/dri-devel/a7655158a6367ac46194d57f4b7433ef0772a73e.camel@mailbox.org/
> Fixes: 93032ae634d4 ("drm/test: add a test suite for GEM objects backed by shmem")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

