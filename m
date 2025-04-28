Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA61A9E8FD
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 09:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9576310E3B1;
	Mon, 28 Apr 2025 07:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MJAzUdKS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451E810E3AD
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 07:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745824597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=16CNKajqgwGmZ8oI9vbBSydbJPDHhv2hM7VyKx5uLvo=;
 b=MJAzUdKSBAHxjnwy2TNiMSY83ds3SgXG1Q9921QEVAEU3mx8WAglUUS7VQEnrWBV8HxSjE
 PT69oro1uSBwjO1AH4BEQ+CoEge4UVlnP3bnveoNRTG/qI49+TJqTYx/NGyUKvps5M6LjO
 64AENQmNR/XY42YLJp7Jlh6H8xhfhHc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-GnYeaNfGM2651aatvqHDNg-1; Mon, 28 Apr 2025 03:16:35 -0400
X-MC-Unique: GnYeaNfGM2651aatvqHDNg-1
X-Mimecast-MFC-AGG-ID: GnYeaNfGM2651aatvqHDNg_1745824594
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-39135d31ca4so1641299f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 00:16:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745824594; x=1746429394;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=16CNKajqgwGmZ8oI9vbBSydbJPDHhv2hM7VyKx5uLvo=;
 b=C4gGNSF4fHR8u/01188H/CqXZr6qkxUmUtcHkyoJgDyaUYkqzTziVrT6ShWG7gMYqa
 DDIIlfn/Bz3dh0BRz9woPBnj+vjVz9M0LuAwjvOOUTxROJPl1atlywsTPOoRKie1dphb
 lKnbiYpI1ci4tzQDy95moNsFRi+MYvX2NcN1UAf58/O6NwDri/DUjcKlJexHKC2g5PgT
 zOiHFKJkJeatIhu0Uiu05RWHvFVkW+npCz7kqNTpEudeu+lBwPdjpY/WKhnGkijUYggi
 vX+Y4eJ8enn3jQXIWazdnQ54mTO8dVLoVs412ebHlcVNZEtOfSjAkRYhSAYGIZCgURqI
 /VIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNwRI1XpY72sGvpcNTXrn1FXxT0rIdV+ylg8ZR8L6UKRRY+2VBBtWj5fptzzyz1MGeSqgVNw5PHFY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0yiXQt+kMJbbwGqroa7wXPD5hGstg0/OrJ5kqbH6m0YAue/W8
 mwMm+utAX61AehNhLiVJx3uevN8i5MbLxqFYYXfkSVSk1sKrsoJ4M5Sw7CaeC2vEOwSnSJh7HMg
 KV+enHaS44rRwDPhktBnZJByteoedU/TzJ6NFBoOebZGSvDK8khE+raa3+w/vtMoCpQ==
X-Gm-Gg: ASbGnctdyMHtl/9KI7Pi7GSAucgfuokobszM+M1pchejCS0PvxZv+5qUg6yckRLBww/
 nkfIwxorJuR++SS2I0ImHesJFD/DnCZeFkWlXJLUX81j9DQxaEXTcV80mm1v70FHOqBo4e7kCwq
 sebbO0WqzPHeYY/VdFVewRf6tC+Bi+P6T6b54DrXs3aOPGkXXGmaNnjxCjHpZxY3oyJSy4kY/n/
 LY5Hnb6SY2J9YQiUxestUA575Hdn2t6We+SYJmwcsEQP4ylqhfrM5iaFlkjrFp2m96ubcrTAkju
 OhLSIB1g7fzouvXiO7VgKGwN53KdHkJgiow88Fc/kA==
X-Received: by 2002:a05:6000:4285:b0:38d:e0a9:7e5e with SMTP id
 ffacd0b85a97d-3a06d641ee8mr13559953f8f.6.1745824594522; 
 Mon, 28 Apr 2025 00:16:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIrPcunVHLnlQ1AatF9UYAiW856wnW8cOclcw7+LA1ObWz8K2SToJ1c1vlFs6uRPgv8kBJdA==
X-Received: by 2002:a05:6000:4285:b0:38d:e0a9:7e5e with SMTP id
 ffacd0b85a97d-3a06d641ee8mr13559929f8f.6.1745824594178; 
 Mon, 28 Apr 2025 00:16:34 -0700 (PDT)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46257sm10241681f8f.77.2025.04.28.00.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 00:16:33 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, David Lechner <david@lechnology.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Marcus
 Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH] drm/sitronix: move tiny Sitronix drivers to their own
 subdir
In-Reply-To: <20250428-sitronix-v1-1-4e7cc0a8195a@gmail.com>
References: <20250428-sitronix-v1-1-4e7cc0a8195a@gmail.com>
Date: Mon, 28 Apr 2025 09:16:32 +0200
Message-ID: <877c3421tb.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0eb6d4qSNB5jC9ocXznSkIKE8Kuy6jTcYVTD0U2ohGU_1745824594
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

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

Hello Marcus,

> We start to have support many Sitronix displays in the tiny directory,
> and we expect more to come.
>
> Move them to their own subdirectory.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

You can also include the following if you feel like it:

Suggested-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

