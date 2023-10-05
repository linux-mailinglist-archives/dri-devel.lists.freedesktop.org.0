Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8A77B9D5C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 15:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B34610E405;
	Thu,  5 Oct 2023 13:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D5D10E405
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 13:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696512965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=luOK7OlRFRa5WKkRAJ2DOUD3oZGSdEtZJkER2TW3CIc=;
 b=AezDwEGth4uiFi/1WJSCCdvdY+cBxhPtbvIPOnmOXwpJTvWW/e9pTvrW9O8VZhkME+H/He
 7/wAnjjdyUNL4y2NDx+bTlcYRTumJXEzFaGpxdSGPmZeAQY7/ZKbQkRPAT4ZNktFhXqrcC
 9qeBxc7ZNEjtq//X8uBduCZ0jrOn3OA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-NPYpJViaO7CrB-d2m-4_FA-1; Thu, 05 Oct 2023 09:36:01 -0400
X-MC-Unique: NPYpJViaO7CrB-d2m-4_FA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4063dd6729bso6686675e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 06:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696512961; x=1697117761;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=luOK7OlRFRa5WKkRAJ2DOUD3oZGSdEtZJkER2TW3CIc=;
 b=D7ElGTP/qCvQqWRQcu8p/cZ1W7SduTDoRCCnQB9twPBEi1PttGuHGc4F8KQ+Z6CXLo
 M0GrOeE2g4GpnBTX+An3dYbBjXGD+IFQtHKIJYHRDH+jEdY4KI45axgUNqmB+FoAOn9K
 Hmpx+Z+Rn/OksxlCWXHXHho7266QkzkOYX6p/0d+zV6J2Rjxw5DKJnCnqR446jBi0bTz
 E/GX6zHCmjAp+XLwhQOYPyDSmbQScAQHqjEOc2Fvkwd9GPAaIu/0WFOSxNxbT9Tpy0DU
 Ym1zqzkEsVrdyuJLJM66jIhY9S7YVn1sNW+4pLQUolp9/mNpCvK/vnVL+kyTHlcrgr1U
 O2Ug==
X-Gm-Message-State: AOJu0YzQUsKo10FnkW0w/GiD/APccuAsuDlLb9LEE1iXyGitn7Vwzfmc
 aQ8UF84o+9ZcsbxZF1c/7IDmcBizxMM+66MWsn0lgDSZV4BwLh1UpuZbCKAErROFJZFy+xejoe9
 xZzrYKFkcUqvhCL+Suyw2ZCMUaMDI
X-Received: by 2002:a05:600c:2218:b0:406:535a:f558 with SMTP id
 z24-20020a05600c221800b00406535af558mr5207460wml.10.1696512960859; 
 Thu, 05 Oct 2023 06:36:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHAOP5qzrDlT+R38RojxQD38IBYtXE3MO8yKdroTrsv7XJ0e0xbHS/5ekExH6lFtK8KCVs+A==
X-Received: by 2002:a05:600c:2218:b0:406:535a:f558 with SMTP id
 z24-20020a05600c221800b00406535af558mr5207452wml.10.1696512960577; 
 Thu, 05 Oct 2023 06:36:00 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z7-20020a5d4d07000000b003231a0ca5ebsm1810177wrt.49.2023.10.05.06.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 06:36:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: Re: [PATCH v4 4/7] drm/ofdrm: Preallocate format-conversion buffer
 in atomic_check
In-Reply-To: <20231005090520.16511-5-tzimmermann@suse.de>
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <20231005090520.16511-5-tzimmermann@suse.de>
Date: Thu, 05 Oct 2023 15:35:59 +0200
Message-ID: <874jj519a8.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Preallocate the format-conversion state's storage in the plane's
> atomic_check function if a format conversion is necessary. Allows
> the update to fail if no memory is available. Avoids the same
> allocation within atomic_update, which may not fail.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

