Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB42825B81
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 21:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087CC10E67C;
	Fri,  5 Jan 2024 20:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B9110E67C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 20:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704486062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=feGX1dWCZ1Zr4S7jaL2F3HEuMoSwekLDmkBU7V6ngkA=;
 b=f6vKkL/w49+5WrVBB/SXy/AJjN2WBJp5azDe7BFYBvoGGVshpXMU4Enb6LRGwDjcKHv8T2
 Sq5v6gMPzizktPIz6yYSUn3qwO4JTrkLX2QLAmBRzhwHRkM2bAM44ZPErzddhXR9QVV0Yv
 Ia87kw79kWd8SfesHKaK2NuhoeZTp50=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-SVGXwYI1MvqjmtBush1aaA-1; Fri, 05 Jan 2024 15:20:55 -0500
X-MC-Unique: SVGXwYI1MvqjmtBush1aaA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40d8032afffso12987025e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 12:20:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704486054; x=1705090854;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=feGX1dWCZ1Zr4S7jaL2F3HEuMoSwekLDmkBU7V6ngkA=;
 b=owZ+6wGfAnML+X8g7rJtnoHwLVvhbUNg78s/4yoBun0IESJOlZFna76asoDAUENzCC
 haUtXpLXzIh3CThncxObLxflARfZWtD+Z5zSDeut7laMF5YGLHl+3OYxN5N42Q7vW74K
 y5hj7Dm55udJyWqQC8XtbWti5E8vxIwtnuVWpjpBamWBIesEFd/GqdKxrQWHQ63s93+i
 USAciTzuWWTOokGv/dx51VQtMSLgCr6oU0L6wYD2J6Eyxpprxq+mfaafuFTLOqSCa8UJ
 u6fNVDO5ZjuYtmJrqMD2RaYbWOa74zebVvAJM9ND7DqzKVEWzpd5PkYM37gMA8zM1vtJ
 7yFQ==
X-Gm-Message-State: AOJu0YxMF5gh9kQaFkakBVkN4vB2bHiI/KpZTCc37ge5+mzlcNJRiOgj
 ycGuWJCbLS/fu0scmfG9ZuVKpcSXVBQNZkwpNFaoYiBqG7Hv5wBxsVTxZ21g4+/J05QFxWIo8IE
 ySNGN3ffNj6hQ8e8mHsv61V8oa5SOxo6WG6Zt
X-Received: by 2002:a05:600c:230f:b0:40d:5d82:d0f3 with SMTP id
 15-20020a05600c230f00b0040d5d82d0f3mr14872wmo.271.1704486054575; 
 Fri, 05 Jan 2024 12:20:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRXHrQG4uL5h01cAVjuN2b5+39l3eQgycBlTvo7X85CIbjYYmbapqrhHJI5AbnlwHqwNhq7A==
X-Received: by 2002:a05:600c:230f:b0:40d:5d82:d0f3 with SMTP id
 15-20020a05600c230f00b0040d5d82d0f3mr14866wmo.271.1704486054204; 
 Fri, 05 Jan 2024 12:20:54 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bi16-20020a05600c3d9000b0040d5ae2905asm2537402wmb.30.2024.01.05.12.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 12:20:53 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm: Move drm_set_preferred_mode() helper from
 drm_edid to drm_modes
In-Reply-To: <20240102122208.3103597-1-javierm@redhat.com>
References: <20240102122208.3103597-1-javierm@redhat.com>
Date: Fri, 05 Jan 2024 21:20:52 +0100
Message-ID: <87le934jmj.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

> The helper is generic, it doesn't use the opaque EDID type struct drm_edid
> and is also used by drivers that only support non-probeable displays such
> as fixed panels.
>
> These drivers add a list of modes using drm_mode_probed_add() and then set
> a preferred mode using the drm_set_preferred_mode() helper.
>
> It seems more logical to have the helper definition in drm_modes.o instead
> of drm_edid.o, since the former contains modes helper while the latter has
> helpers to manage the EDID information.
>
> Since both drm_edid.o and drm_modes.o object files are built-in the drm.o
> object, there are no functional changes. But besides being a more logical
> place for this helper, it could also allow to eventually make drm_edid.o
> optional and not included in drm.o if only fixed panels must be supported
> in a given system.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> ---

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

