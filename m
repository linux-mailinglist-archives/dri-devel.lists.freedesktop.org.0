Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8348BB01CA6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 15:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B9510E3A0;
	Fri, 11 Jul 2025 13:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RTYNwfvU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7BD10E3A0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 13:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752238867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tp845R0CyQQcxR0ubt08EbZiVZBHABfHQk6gZmjC0gM=;
 b=RTYNwfvU/+lGNkQYz0wfYHXP04Cg/hw186WAqLWVtuCD0A4GNPXwMO2luQMElouudFuDKh
 vGNxuNzf8xUaWGdip6ds1FdzFnbYANrxyEzFXStX/I4QLZXYJG1d9PYm4KqjS35OBakfNW
 v+sRnWZk1XltoGESCm38YzDAQ5kZ/Lk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-tJkGsqynNe2ewpY9jn6SUQ-1; Fri, 11 Jul 2025 09:01:06 -0400
X-MC-Unique: tJkGsqynNe2ewpY9jn6SUQ-1
X-Mimecast-MFC-AGG-ID: tJkGsqynNe2ewpY9jn6SUQ_1752238865
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a4eee2398bso1093611f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 06:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752238865; x=1752843665;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tp845R0CyQQcxR0ubt08EbZiVZBHABfHQk6gZmjC0gM=;
 b=vGCG9O25+Dhwq6Hto2Mw5nLy+gTrNmT9+h/Bj/M+zoSvG+y8IjLxGJoANQkqW7OSTv
 6EbdBXsfkmszSCdLdI+KXcE65adaELRLW34QkxCcbgoqT+gnEWzztQ5C4G1T8tXYwtux
 htZUwvdGK94FZiZgJAtIg/S+bkFeEiccOvQaU0u4NUH3/ICUyCgiAV82AbEoXwnI3Xmq
 Moq7W4OzbJaUecRZ711WlQ+H4xxXJfSjUqkuKO1JYjKXcNQnMBQEXP765Va2tmUc7K2C
 gLJo4colvU5XFIAP10vGacHNLEVaMgqcPzCzeAPws3J080bu1QvKbgV7GhQVQiLqsHZ6
 b3pw==
X-Gm-Message-State: AOJu0YzqiNOb65wNGCmpGYpJrIC49jWyJLhf+ocS1327yXOH00PDk85h
 ZnYaecn4kDRRTp+Dybd5nmu362KiGmdwc4Um9ArcUyDR7OSuLE+dnHRZUnSkuxdM8VfFFsGQrNS
 9t+589iI3eKTXRP4RvhWJe05IrDPfAg0w/Z3u682DOlRiuIXJ/fMYlmupRVPlfUFeZ+1U2w==
X-Gm-Gg: ASbGncvNITubWHooPvJwD86MRZ32KH6gqANh96oZiHkNUhSDQTLtInmgS7QFanrI4rW
 kDE5vlPHq3kUChWjBmpuN2wGV+thlRCZ6xNsKWcdt8WoT0P+zxD+rMLM3DUQl77C2zYxfSXptb4
 C/24hHLYV6N0WSPMdsTapk7GEw2ghfXBrqcGROgrm1LaAjspmlX1v9i24D5pFkgrpSxzGQcJxa0
 PeGOkgzg/L6nGnM5P60CT5f/8u2FPVyCy5NrQHEXv+RtoKC5Lmyv1AfDJk4B02Yk6g0klosR4YO
 tAo/E3x/DJ8qlqOdQy7KiAE7qPjJPEFWug4Mr/l8b/1uHlh/8sygp5YSeh0l4xIG8z8LxW+kunZ
 jbU+mjq/LSpRyYDGUzidflQ==
X-Received: by 2002:a05:6000:25c1:b0:3a4:e4ee:4ca9 with SMTP id
 ffacd0b85a97d-3b5f35416b9mr1922874f8f.23.1752238863230; 
 Fri, 11 Jul 2025 06:01:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3GQ/1x0Ncjt7fBy435F3Cz5w9qegcORL5DccNMUVl3Tf/y2AdzdLrCJXiGTNLyhRuFR630g==
X-Received: by 2002:a05:6000:25c1:b0:3a4:e4ee:4ca9 with SMTP id
 ffacd0b85a97d-3b5f35416b9mr1922593f8f.23.1752238860631; 
 Fri, 11 Jul 2025 06:01:00 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc1f70sm4380369f8f.27.2025.07.11.06.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 06:00:59 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lanzano.alex@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/repaper: Do not access GEM-DMA vaddr directly
In-Reply-To: <20250627152422.8399-1-tzimmermann@suse.de>
References: <20250627152422.8399-1-tzimmermann@suse.de>
Date: Fri, 11 Jul 2025 15:00:58 +0200
Message-ID: <87bjpqevat.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oM1IX88BjwF_YPqhdnXut6FBut64qZxrwcaBSK5_YL4_1752238865
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use DRM's shadow-plane helper to map and access the GEM object's buffer
> within kernel address space. Encasulates the vmap logic in the GEM-DMA
> helpers.
>
> The repaper driver currently reads the vaddr field from the GME buffer
> object directly. This only works because GEM code 'automagically' sets
> vaddr.
>
> Shadow-plane helpers perform the same steps, but with correct abstraction
> behind drm_gem_vmap(). The shadow-plane state provides the buffer address
> in kernel address space and the format-conversion state.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

