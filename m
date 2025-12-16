Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E84CC197E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 09:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020EB10E77F;
	Tue, 16 Dec 2025 08:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IgB3E25D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71BFC10E77F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 08:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765874133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j3yLrcNoJepHFXDHm8iCXLSfgqPyKjEs/VGVHTvzMsM=;
 b=IgB3E25D6LVuxxpPneLh+FnNwVWBhGwPxmWkjJ+FpmsfAaUfKjuK7QjdBVzsBNqUxYxRBB
 +PJviOVVPoMxQfced7pt/oGIvduYvvoiN/RljuphxijP6CjtVY+zsNciLWNoo9hoLEcClW
 78Gh2eT2yiZaPH4MN9sMb0xE7JAUUqE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-i0uZvel1NB6m37kWSw8Eew-1; Tue, 16 Dec 2025 03:35:31 -0500
X-MC-Unique: i0uZvel1NB6m37kWSw8Eew-1
X-Mimecast-MFC-AGG-ID: i0uZvel1NB6m37kWSw8Eew_1765874131
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4792bd2c290so50037685e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 00:35:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765874130; x=1766478930;
 h=mime-version:message-id:date:references:in-reply-to:subject:to:from
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j3yLrcNoJepHFXDHm8iCXLSfgqPyKjEs/VGVHTvzMsM=;
 b=GWz8CjxtI/2hdtNKK5Vp0COCIhXA9XVkBZLRS2sk2aqPYLF+5iEDT34CVEnqkrUBHN
 WEsZrAWXzRMDs4DTVhdfG3O7AnwDF131wOqeMvw/qe8rPtbwnfoGJ3MgGSW+rpkc0293
 VkhCXJCMYFXvfFdRW+kg7+Fh9NJgltKkNIaYWhwrqTh4C7wVtQFmZm3XkjgFXy2TTf0Z
 7lOfc8CYwMd/WA2zc49cbfZB+cJpai8KDK4q5AAvY2Ya/vERb6QZBZcnqHWR+W1UPG5a
 9iZvBU/kHQUFuu/UIWMUWXxOHl7qGdeNSL3N+VUlm+W+svRLqmhntmPiW6HeGa7joTxG
 Srpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaNEEdroTc+n4o5TAnYGH56yyRJMCmMAZh5T3nz0mvNssE3BjdojWymY52en0ApvzNLJ3kcttGqvQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzfc4qFMFwymFo1ETUqLEgoTeRySFrpkt4ryz78BASkKABCJl4X
 Ld4pn/cJRJaQe2Pg7qKIO7HmMjV06kmW5Tgb4iP9Xjd48iJ/ftHs+BU/NjufmNeJgfYCTBimoum
 MmZCd3fgLPCkJlhRDK4fvKyiVIIRHdhq9QyX/RD+ULuYXM0jHcFnS/OlM3RisKviQmnv1oA==
X-Gm-Gg: AY/fxX70OTZh3FqkqDvF9DPv/KXxmarIOI4coCeRdnzxzVBRFOYLL9nVThUcuR1wtkG
 dlu3Pd4tzRqgzln/jEiW+VQxdcff8zyBMFjYZp2fCpHY4SxH0nUengv53OnD0YkmmhGsUc0oGxI
 miLqb45+sjn9YeSQSGE77XoM/Kq2cKI8QM8eZV56y/6GT+K+nKSabgbqjNPOum7k9trVMhsZUNd
 dGEdde4wgqvjPid7YyuWeWTfe8MNO/O63tsO3RFCw0jDEMShI5q4BJTYExDTzHTpDK8T2c4+bGf
 fmrOfW3T6t3DI+vGk2NVG72n/r+sesvjCPRzjD0LhWbpDSZsVOEHVm2qHWmMyuyFig3494BsiqQ
 WKQ72AsJthPFC7KfgspIFVzw+l9FQEb5n2238exeWYqZYf3tpr8kUmxMG15jbo4iF3Tvq
X-Received: by 2002:a05:600c:524a:b0:477:7bca:8b2b with SMTP id
 5b1f17b1804b1-47a8f8cdd7amr154055995e9.15.1765874130595; 
 Tue, 16 Dec 2025 00:35:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGg4DsBBMTjdBs4v5Z9pExfTw83j2yc3D8FN4HEo9n85JrV8+S0/gvUDfs834nqTFADOFUU/Q==
X-Received: by 2002:a05:600c:524a:b0:477:7bca:8b2b with SMTP id
 5b1f17b1804b1-47a8f8cdd7amr154055775e9.15.1765874130232; 
 Tue, 16 Dec 2025 00:35:30 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f8d9a06sm226130025e9.10.2025.12.16.00.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 00:35:29 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 1/2] drm/panic: Rename draw_panic_static_* to
 draw_panic_screen_*
In-Reply-To: <20251216082524.115980-2-jfalempe@redhat.com>
References: <20251216082524.115980-1-jfalempe@redhat.com>
 <20251216082524.115980-2-jfalempe@redhat.com>
Date: Tue, 16 Dec 2025 09:35:28 +0100
Message-ID: <87fr9alt7z.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4h-QbeBz5BMfn9ucyeOIPKY3iNKIR3ELI7weZ9kL2xI_1765874131
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

Hello Jocelyn,

> I called them "static" because the panic screen is drawn only once,
> but this can be confused with the static meaning in C.
> Also remove some unnecessary braces in draw_panic_dispatch().
> No functionnal change.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---

Makes sense.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

