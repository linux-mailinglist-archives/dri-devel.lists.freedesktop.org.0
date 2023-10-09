Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75047BD5F4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 10:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F98810E237;
	Mon,  9 Oct 2023 08:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F19710E237
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 08:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696841920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R1nusqQP3xNmGWFrmbYEDRYRk+KMjPpQtPXvPoeKfCc=;
 b=bIT+IUfcpcCCcfIXer0cJ84jgOAYWohcX3HEoz3q5jz2wGRQvMFDeQanXgohseqCapkqrv
 83mO0pW/FQUyRWN6qcWktbnR0Id0jqk7p4PLoOs9vZWmbt+TqBD0seqgcjdltSXjIzGH50
 xlkUdHXI9NH88FfTblIXhiJUVvdaggA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-YJXjE3ucPDmjCqB956MRuQ-1; Mon, 09 Oct 2023 04:58:34 -0400
X-MC-Unique: YJXjE3ucPDmjCqB956MRuQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-317d5b38194so1955799f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 01:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696841913; x=1697446713;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R1nusqQP3xNmGWFrmbYEDRYRk+KMjPpQtPXvPoeKfCc=;
 b=qZsmQKKgRoVVsrAjReIYLwpQPAqauRrpyXr74I7Sr2jqP1K70IT7kQOX/k1E3vEazh
 Zkil1k2dlcnT4QGOOcrv02WExz/Lk7bLbds8DnT5BihYM2sUipjIVgAxSApwrz5GtDgF
 GtnM4pgOuzPwf8pBpfK0qFHkcIJWqgkvdrO/a7UQdlOsBW5NmHckHWW2b0cOD7cKeZe6
 qWcXyCZd8pr8h58lmseffkqbuCTcDy2+1hKENTKFGiRVLWPBF50m4dG+W9U06weqFX6i
 D3p2uhJ670vZdjjDE6yynKaDCfoJBN7eU+vt/3Uw1WwfYwyRoQgCojwiL8MloaKlkLc4
 h8mQ==
X-Gm-Message-State: AOJu0Ywp9pZ/p0af5fvtZYAkv1EI9Ne2iBAqIcdNrhXjN+I1xt40ox7g
 1q39jgE25EwUNux8pciGrLDMV6tbvZ0lJ8f0XWury28v+y4i20MfdxRtFYNYT5Oex12okMeE7Ey
 q2fgT1YDg8BMm9u8ZK6mmlt0sa0XF
X-Received: by 2002:a5d:6452:0:b0:31f:f95c:dd7f with SMTP id
 d18-20020a5d6452000000b0031ff95cdd7fmr8521702wrw.12.1696841913064; 
 Mon, 09 Oct 2023 01:58:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeaHGBlxdWYNq0j4ZPU1RBzwUADQ6UKXH/1f+4U0zanjq3k8QDhOI98MPAtMiyKgl5Bjy8ZA==
X-Received: by 2002:a5d:6452:0:b0:31f:f95c:dd7f with SMTP id
 d18-20020a5d6452000000b0031ff95cdd7fmr8521690wrw.12.1696841912768; 
 Mon, 09 Oct 2023 01:58:32 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x3-20020a5d4903000000b0031fa870d4b3sm8901807wrq.60.2023.10.09.01.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 01:58:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: Re: [PATCH v4 5/7] drm/simpledrm: Preallocate format-conversion
 buffer in atomic_check
In-Reply-To: <ae863124-17a9-44a7-9565-f8248e5d4317@suse.de>
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <20231005090520.16511-6-tzimmermann@suse.de>
 <87zg0xyysa.fsf@minerva.mail-host-address-is-not-set>
 <ae863124-17a9-44a7-9565-f8248e5d4317@suse.de>
Date: Mon, 09 Oct 2023 10:58:31 +0200
Message-ID: <874jj0rx3c.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hi Javier
>
> Am 05.10.23 um 15:38 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:

[...]

>>> +static int simpledrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
>>> +						       struct drm_atomic_state *state)
>>> +{
>>> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
>>> +	struct drm_shadow_plane_state *new_shadow_plane_state =
>>> +		to_drm_shadow_plane_state(new_plane_state);
>>> +	struct drm_framebuffer *new_fb = new_plane_state->fb;
>>> +	struct drm_crtc *new_crtc = new_plane_state->crtc;
>>> +	struct drm_crtc_state *new_crtc_state = NULL;
>>> +	struct drm_device *dev = plane->dev;
>>> +	struct simpledrm_device *sdev = simpledrm_device_of_dev(dev);
>>> +	int ret;
>>> +
>>> +	if (new_crtc)
>>> +		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
>>> +
>>> +	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
>>> +						  DRM_PLANE_NO_SCALING,
>>> +						  DRM_PLANE_NO_SCALING,
>>> +						  false, false);
>> 
>> Same comment that with the ssd130x driver. I think that we should use the
>> drm_plane_helper_atomic_check() helper instead of open coding it in each
>
> I'm going to replace the call in simpledrm. 
> drm_plane_helper_atomic_check() is useful to remove the entire 
> atomic_check function from the driver; it does nothing apart from that. 
> I've been called out before for such do-nothing helpers; deservedly so. [1]
>

The argument then is that drivers should open code *exactly* the same code
that the helper function already has just because they implement their own
.atomic_check callback?

And that the helper should only be used when is the .atomic_check callback
but not as a helper function?

I don't understand that rationale to be honest, but if there is one then
it should be very clear in the kernel-doc what functions are supposed to
be used only as callbacks and what functions can also be used as helpers.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

