Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8815C7EB620
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 19:06:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6CA10E498;
	Tue, 14 Nov 2023 18:06:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C380610E498
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 18:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699985210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g+Ea5F9/sxF9OVzOjdMf3/GKiJbULr6v8M/iO5If8mA=;
 b=I4Es8kcNkqSyfOZ53+KWpC96nH34GvcpZ0IQUDNt+iG0Yhfn6jnEPBU3vpAjkfPH9k6e/d
 ptj9cd/SrSEeI678Zq3068f2VpDxf4XHuYMLmnk+bQ0PJANS5dYxIag0DSp+fTZ3Gb9rZJ
 WuYwThRZg/Q+XPz2ZMUklwEAx2e/l5U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-ClZ6zbqjO7m4iFENFDC7Mw-1; Tue, 14 Nov 2023 13:06:49 -0500
X-MC-Unique: ClZ6zbqjO7m4iFENFDC7Mw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4093a561f7eso38374295e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 10:06:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699985208; x=1700590008;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g+Ea5F9/sxF9OVzOjdMf3/GKiJbULr6v8M/iO5If8mA=;
 b=F0EOhdtIMJMACfbMNod7vKz3KnSObnFfTrQCzJv+mQoqfCk8u4ZHDXD9+9ZWbIz4JQ
 ut+g7MyUrtpgMdFL4DCINo2T9HIcLaQnI6TWmUznqL4ZDFGt37eS0suiFa34E+ucdT6z
 aRIqNTLoICUc1ODBNLh8/R1k6vsubon7BA2hqbBZwECUqEpM/D0mdlGBpqOLR9G0lZUN
 8iuPy+/BMRwgai9GIKjGs62kUByMReT5muzI8QreFuzY6+T9oJR69CQIr+RCgrHJMox7
 79TYsIgVlRMIhyv4M5gIXnVb/Vmq5WGhWWdCLG0IGoLR5u56wcFd1g9yXCi8ETjNM4o2
 m0yQ==
X-Gm-Message-State: AOJu0YxC97mHyc62XGV3EbAQmVuc9lKv3Qec/YfCYu+s4XSIsboMbmI4
 o9etKr5lowdtLWvTyDWeLTBxPJtH8A4Gde65KrK6qOp09ORhbWb+Mb6RmwK5+6deQyFGM4PIDgX
 +32l4Qo+In4i7oAmI8/8o4VWtXduI
X-Received: by 2002:a05:600c:5247:b0:405:39c1:a98b with SMTP id
 fc7-20020a05600c524700b0040539c1a98bmr8106099wmb.20.1699985208346; 
 Tue, 14 Nov 2023 10:06:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENiVmHUzsZj8Er9uv42BdyJgrcXyOCc16SNziUSzQjnDVU3jq0kl5Cj3OWEcuy37bKRTjH0g==
X-Received: by 2002:a05:600c:5247:b0:405:39c1:a98b with SMTP id
 fc7-20020a05600c524700b0040539c1a98bmr8106082wmb.20.1699985207946; 
 Tue, 14 Nov 2023 10:06:47 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v18-20020a05600c4d9200b004068495910csm17570724wmp.23.2023.11.14.10.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 10:06:47 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] drm: Allow the damage helpers to handle buffer damage
In-Reply-To: <c28b6e4a-aea0-4de4-a194-aa1024a93476@suse.de>
References: <20231109172449.1599262-1-javierm@redhat.com>
 <9296c184-22c1-4d71-8b11-2d26f49a5790@suse.de>
 <87wmuk5mfj.fsf@minerva.mail-host-address-is-not-set>
 <c28b6e4a-aea0-4de4-a194-aa1024a93476@suse.de>
Date: Tue, 14 Nov 2023 19:06:47 +0100
Message-ID: <87ttpo5hvs.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Erico Nunes <nunes.erico@gmail.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, linux-doc@vger.kernel.org,
 Sima Vetter <daniel.vetter@ffwll.ch>, Bilal Elmoussaoui <belmouss@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hi

[...]

>>> And why does it flicker? Is there old data stored somewhere?
>>>
>> 
>> It flickers because the framebuffer changed and so the damage tracking
>> is not used correctly to flush the damaged areas to the backing storage.
>
> I think I got it from the links in patch 5.  In out other drivers, 
> there's a single backing storage for each plane (for example in the 
> video memory). Here, there's a backing storage for each buffer. On page

Correct, that's what I understood too.

> flips, the plane changes its backing storage.  Our GEM buffer is up to 
> date, but the respective backing storage is missing all the intermediate 
> changes.
>
> If I'm not mistaken, an entirely different solution would be to 
> implement a per-plane back storage in these drivers.
>

I believe so but I'm not sure if that's possible since the virtio-gpu spec
defines that the VM should send a VIRTIO_GPU_CMD_RESOURCE_FLUSH to the VMM
in the host to do an update and the granularity for that is a framebuffer.

For that reason the only solution (other than forcing a full plane update
like this patch-set does) is to implement tracking suppor for buffer damage.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

