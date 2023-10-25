Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 832D67D61B7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 08:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B4A10E554;
	Wed, 25 Oct 2023 06:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745B110E554
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 06:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698215764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3QCkYDGehxxNqzt09gBv9p4n2vFS1oLTgsSq6IkVxVA=;
 b=dsYwNf6M7WcSA53ZGzkRMeh4A0kzl9ETfZzNY2Vg52/aFz49wuJ5l0SDK6NaklQ8xcsSvV
 5hMEuhwQa/MKTpbdh+3c5UMf02PuxHtu+QqtZLAhBjaujOL3d/qFW24hGi/gv4B+ln+NXe
 kA7PCfr+thDnqxN3Vf/9lAxtWVzgeHI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-rt27q5MaMqGlV-asklQxCw-1; Wed, 25 Oct 2023 02:36:03 -0400
X-MC-Unique: rt27q5MaMqGlV-asklQxCw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30e3ee8a42eso2348759f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 23:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698215761; x=1698820561;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3QCkYDGehxxNqzt09gBv9p4n2vFS1oLTgsSq6IkVxVA=;
 b=ILPA0oXJCUy1hQxqca1HNTnJpNrSVJLmFS9rJeKrBcVab4YZ7neoFUbCaUjJkOg4zd
 uZi4kkAHXTLYG8q06qg2Xpx9idd57eaL0drYd4Du8WvVTJgkugP9ldJmWuzKnII64jQi
 3TV/2FgTsGZsy41rAxmncYXW2G5rzhMsePMGEQ8CGzsf73lKYvchF7Pp/+NnJK9+zjaE
 8V3SAVMdcUwi5+Q6V1DY907E+HcPP6wP5jNfeUlBCN6NxF78oLMXDmlcn6pT53muSnkH
 P1FeV0sb08v/KJIcnyEjWq4QyxxhoktS4vIW9lBGgTY0yo3SyznX7Q6+blHR7zfT2/Va
 YaLQ==
X-Gm-Message-State: AOJu0YxjicAh3elr8BWs+X4oKGliCUMI4KvUNsAK7dbbGwzqODHDUdcc
 iPxJUiSSs9iJuXafY+vmNBdgW7Ye0/0u301FgtjONz5t4bI3S1D4kx/3nDfC6INrAgZ/6QA2Va/
 1RpPTYhARD6t8dTSDhv67qF/nl9GBuZWYBwMK
X-Received: by 2002:adf:f64a:0:b0:32d:a49c:dfd0 with SMTP id
 x10-20020adff64a000000b0032da49cdfd0mr9244569wrp.64.1698215761743; 
 Tue, 24 Oct 2023 23:36:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5pjp6+UGcNGf+pR7eCaZquF6TdQK9ic+pGsGfXKq7QOOQ0Jp5pQG5o2Uq/SY5UVuq/3Y74g==
X-Received: by 2002:adf:f64a:0:b0:32d:a49c:dfd0 with SMTP id
 x10-20020adff64a000000b0032da49cdfd0mr9244562wrp.64.1698215761437; 
 Tue, 24 Oct 2023 23:36:01 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d534e000000b0032710f5584fsm11318664wrv.25.2023.10.24.23.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 23:36:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Michael Banack <banackm@vmware.com>, Albert Esteve <aesteve@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v6 9/9] drm: Introduce documentation for hotspot properties
In-Reply-To: <1bbee4ad-79fe-4968-0edc-3eee34ad5972@vmware.com>
References: <20231023074613.41327-1-aesteve@redhat.com>
 <20231023074613.41327-10-aesteve@redhat.com>
 <87h6mh10zg.fsf@minerva.mail-host-address-is-not-set>
 <1bbee4ad-79fe-4968-0edc-3eee34ad5972@vmware.com>
Date: Wed, 25 Oct 2023 08:36:00 +0200
Message-ID: <87a5s79pkf.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, krastevm@vmware.com,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Hans de Goede <hdegoede@redhat.com>,
 ppaalanen@gmail.com,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 spice-devel@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 iforbes@vmware.com, Matt Roper <matthew.d.roper@intel.com>,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Michael Banack <banackm@vmware.com> writes:

Hello Michael,

> Yes, that patch should be:
>
> Signed-off-by: Michael Banack <banackm@vmware.com>
>

Great, thanks for the confirmation.

> --Michael Banack
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

