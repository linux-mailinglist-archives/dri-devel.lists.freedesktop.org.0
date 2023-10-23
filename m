Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DE77D41AE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 23:29:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6D210E269;
	Mon, 23 Oct 2023 21:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743CC10E269
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 21:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698096592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F1k2Vg92RJrxv+gYLNepXp/tJyAR04nx8wa9wG6p0is=;
 b=B2WAG1t+GQssOURjysi6JIHkDM6hr7G/a3udQYvVdrp8vwUY2hAJ+q6d2DpMSmFrqxlwG7
 KK0XJlzaQ/Z99SIz7uL9PJGZ3su0ghcZoRZEfZqM0pNK+2SDzthecWp22+VckhNdql6EU2
 Wp2tp9rPqpYUZRQh+kHKO3BAxoB83u0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-SSUtWwKDNL2RvUFF9szpcQ-1; Mon, 23 Oct 2023 17:29:41 -0400
X-MC-Unique: SSUtWwKDNL2RvUFF9szpcQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f5df65f9f4so23179585e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 14:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698096580; x=1698701380;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F1k2Vg92RJrxv+gYLNepXp/tJyAR04nx8wa9wG6p0is=;
 b=wrqenRi990ozk1mFevxR43bsqY0Hmem8kijgoqRmRqZZoRvsDx5avpht4GHKyX8SN/
 lW6fldPj7wWMCTZtLemW+tZp6b8wFGd3y3yhjHh4V0AmHeeTXwTHs5ujCFYL2mNyjkCz
 wR1qIfd4RG4hP3NZ0IfI5drwaU3spXB8BrSwGFooXdK0Ts/zwTIDn93hQHc0NFA+7c+/
 1IKUo6F+afuf4zi+KEXryX5JvUVdRPygbO0YgZBesWQbckWW9inX8mqz/fWQpg5uwZjE
 Tr95ZjtoXC2hT1eCMtJBWsbOUQs4e7ipmNEqWK3ZfbkPXK6zhNrC7YJP6BHut7hazCoJ
 R53w==
X-Gm-Message-State: AOJu0Yw81TKOjZbIzkY5hBV+IY2Xwih5OOIQ514n5NmfL8uxFcQqtxU5
 2iqTIXI1VL2NLQ5fSGWY67ZYdSeVEJuEUT938PrdsEfnOjjAQ759cDNUkmgwypPuLIH5USuFfaV
 fr6H8r2+KEhI/I/Gkew6OPND6ohng
X-Received: by 2002:a05:600c:45ca:b0:408:575e:f24f with SMTP id
 s10-20020a05600c45ca00b00408575ef24fmr5647872wmo.28.1698096580661; 
 Mon, 23 Oct 2023 14:29:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwIqmyWxHtLCEV9sJcM7Mm48Qpb+Y1PSoNkRJSeRh4CaGlNviwDWwltxau6u5GNETKD69b9g==
X-Received: by 2002:a05:600c:45ca:b0:408:575e:f24f with SMTP id
 s10-20020a05600c45ca00b00408575ef24fmr5647840wmo.28.1698096580275; 
 Mon, 23 Oct 2023 14:29:40 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e7-20020a05600c218700b00407efbc4361sm14963606wme.9.2023.10.23.14.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 14:29:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Albert Esteve <aesteve@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 9/9] drm: Introduce documentation for hotspot properties
In-Reply-To: <20231023074613.41327-10-aesteve@redhat.com>
References: <20231023074613.41327-1-aesteve@redhat.com>
 <20231023074613.41327-10-aesteve@redhat.com>
Date: Mon, 23 Oct 2023 23:29:39 +0200
Message-ID: <87h6mh10zg.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-doc@vger.kernel.org, banackm@vmware.com,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 mombasawalam@vmware.com, iforbes@vmware.com, Jonathan Corbet <corbet@lwn.net>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 David Airlie <airlied@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Matt Roper <matthew.d.roper@intel.com>, linux-kernel@vger.kernel.org,
 krastevm@vmware.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Albert Esteve <aesteve@redhat.com> writes:

> From: Michael Banack <banackm@vmware.com>
>
> To clarify the intent and reasoning behind the hotspot properties
> introduce userspace documentation that goes over cursor handling
> in para-virtualized environments.
>
> The documentation is generic enough to not special case for any
> specific hypervisor and should apply equally to all.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>

The author is Michael Banack but it's missing a SoB from them.
I don't think there's a need to resend for this, can be added
when applying. But either Michael or Zack should confirm that
is the correct thing to do for this patch.

The doc itself looks great to me and it clarifies a lot about
cursor hotspots.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

