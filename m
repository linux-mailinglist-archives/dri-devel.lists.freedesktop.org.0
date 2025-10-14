Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE366BD7EF0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 09:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073F910E560;
	Tue, 14 Oct 2025 07:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fDdWtspi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336D110E561
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 07:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760427172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I+mNHQsLdfiv7vvTT3E1UI4YOke0x16loHcS0d4AOZ4=;
 b=fDdWtspinjyL8VRI3YDKaeFfpUA5muFoC5SkIEJRwtl9wD0YyjT3zChzlR8nGn4VDrQ4DK
 dRMzSyxT5z2lWCYr84SkGRgCH7tFVyUr6lx49r0q5RNYSCVscnMhyoMP56iijh5Om2w9tW
 xPZ0k76kV/8OxF/Q8/hz6Vw7h+z9teg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-KgQRPTmeNAKp1_6xqLdoUw-1; Tue, 14 Oct 2025 03:32:50 -0400
X-MC-Unique: KgQRPTmeNAKp1_6xqLdoUw-1
X-Mimecast-MFC-AGG-ID: KgQRPTmeNAKp1_6xqLdoUw_1760427169
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3ef9218daf5so4207798f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 00:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760427169; x=1761031969;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I+mNHQsLdfiv7vvTT3E1UI4YOke0x16loHcS0d4AOZ4=;
 b=Hmb4/QtcltJv0Ac4Y/6QCApcASULcQcBWKYYJUnvmGdTuAg45RDQt0KdjShz+dxCEk
 SK+x2OCifVmmz9R0f+s8k9AMI9MbS+tk3DU8FrE9JductPNE4NgTwPjiO5p0vC5d367C
 3UArNXfV9hi9hBjonBmam0vJDK4+mm+WQ+3nY/+7jJehcHW8sFrq/G60474B+U2L+s8l
 yetJ5RKQ4Z1yTsQha1KiFrYAK30IIf5WoRk47ZCzYaFDzFkU6D/imwAg2heB5CDBGgqI
 lrf1uCFFWxxqxjayLHomYh1Ym8Zr13Cs39Yphmu1uipUQNq9sZHYAxoSqeJXCGWYY9gU
 QjOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5tA1dCQ3DtEHCQhsQ4M/m7VGz1MQzFni9gJ9MnfAo8LBUY4e5MZbfQzwdc8G+QNPLEmjEkbbImIc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlJpD1xcZIUsB/kBH49VWB3IVoLFMUnly5jybh49h4X2GVU/Ji
 l1bZnQEhxgPmCQj3gmTvmaCRzfq0eeBZr2YmxluTISWEx66yQmedvr5RoFUcCer7cNSSwUDFti+
 7zWvj2ZZal6PjAGx8QctigZhrCbs4ToADA0igqZCwLRyzefySGP+OdrPtm7r5arWQKcoEbA==
X-Gm-Gg: ASbGnctRGy14zRpv8ajgf0JRZUTozOJZlG2odZKZgSzdPz/37k8cq2BowKKVQn/Jxai
 7ONxahM+rhva/K8CsQaRQkbx6X1k2eFMNJUDJW671CDeyXqzmBM+sPUarr125JgU9KgMYzrMvzm
 zGbFyTjK1haOGWratmSAKBicNWlJXtVH4tN2Fvi8Q6pf74WTjQaG6OClo+Jhtf93BACg4h17PHF
 3HXz2TAi3y8TaJ2fEGfG8vrnvbv8lIt0L+nMO85xf5CInRAT58uXV8OK8gGVv+JS9AM9tWyOpg8
 7BEvrhwAUcHKoPZcaqFGcqBUxH+TYl1xuybb+EUkxDtGTL8gWbJEnNw+7eTillEuauvlj2ChCh6
 JTpEAa/SQ9tKNRxEdJal62VY=
X-Received: by 2002:a05:6000:4023:b0:3ec:e277:288c with SMTP id
 ffacd0b85a97d-4266e7d90e2mr15348993f8f.31.1760427169484; 
 Tue, 14 Oct 2025 00:32:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpkrFos/JoFF/exw8H13iEBsM6KPGAsZOyXjflOcvr7yhgSOkA9HU+kH6Zn/mcbepjNdm+gQ==
X-Received: by 2002:a05:6000:4023:b0:3ec:e277:288c with SMTP id
 ffacd0b85a97d-4266e7d90e2mr15348979f8f.31.1760427169091; 
 Tue, 14 Oct 2025 00:32:49 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5833dcsm22073162f8f.19.2025.10.14.00.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 00:32:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org
Subject: Re: [PATCH 2/6] drm/panic: Fix overlap between qr code and logo
In-Reply-To: <20251009122955.562888-3-jfalempe@redhat.com>
References: <20251009122955.562888-1-jfalempe@redhat.com>
 <20251009122955.562888-3-jfalempe@redhat.com>
Date: Tue, 14 Oct 2025 09:32:47 +0200
Message-ID: <87frbmq6ow.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rm8rADzMupbnIoXkW1Sbw36NtXUK60KZjdWFhTAlCXo_1760427169
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

> The borders of the qr code was not taken into account to check if it
> overlap with the logo, leading to the logo being partially covered.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

