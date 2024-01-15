Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C3182D92F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 13:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFFED10E2B2;
	Mon, 15 Jan 2024 12:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6018310E2B2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 12:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705323300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OdOY5TfnFDP96uyidwJURkq+KNPlInJLGTZ9BVgWgNg=;
 b=S1kxOL9phfPMqkKNPWiasezZiIYkTJuL1l6n4Dd92FU+gCDCVQrdAZnl7c2Vi4KxYxSOfW
 Bq/cY1eP+mc+kGVkIEMskzK4hQOJ5qBVsmJ46lD3UV2I4DKzXpEcb526D0kW7HNKzBzTfk
 QGjDy8A1j9zNeJzkrnZBM5UzjYhrixI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-222Z0Y_UPc2FFyqdoYhRsA-1; Mon, 15 Jan 2024 07:54:59 -0500
X-MC-Unique: 222Z0Y_UPc2FFyqdoYhRsA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40e53200380so47058175e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 04:54:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705323298; x=1705928098;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OdOY5TfnFDP96uyidwJURkq+KNPlInJLGTZ9BVgWgNg=;
 b=KZSY6B3oJgS3JMEJPn8CNSDpE1at/7MSn7ZRGd724py3unn1NEkFaUjIo6gGto8IHU
 uUS9OIzzG2NTup/LWWsy3nVEWj39CL8Ak3BcuDTclyFGpDLKeMzMB4sWJ+kqIPmnQSEk
 78ZMtqwyFTYFHETJsBU78N/krUHghy04MiaD63PdHjn4dPTiD79oICFSN5CYGZBdFlNP
 IRskJME0ipev91JJNWZKUlH3YjhWSaJDVMid7rDj4D7j5KeVgYcYDe9wsEAp8bMiS2TA
 wjQia21Yh+giE/x1TNKrb0Y8kbD3ouye95zppjUb3cuNqotPvJN2oSreWnlRhY8ykKp2
 29kA==
X-Gm-Message-State: AOJu0Yxhwu0pLIQaJ3L6ZVfw0ojunkP8emlaxJZ4TZMQqj7ofLi2PPni
 7y21n4pwi+9zueBphCZATpsAtQAGjk56tiy7BIXRhk6Wt9a0Ff13PLjDZypXApLIMFsOgPVxllu
 comGmuRvXDK1ujrmPkND8wcZAWDZJ+YAWtP25
X-Received: by 2002:a05:600c:211a:b0:40e:6ba4:e052 with SMTP id
 u26-20020a05600c211a00b0040e6ba4e052mr1896485wml.25.1705323298087; 
 Mon, 15 Jan 2024 04:54:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzg0bntWWAcXtuHZuGROwZXvYdlmFhuKVULfmHMeQ1PrfepcSckBb2THm+UeIHVJ5SngMEHg==
X-Received: by 2002:a05:600c:211a:b0:40e:6ba4:e052 with SMTP id
 u26-20020a05600c211a00b0040e6ba4e052mr1896482wml.25.1705323297800; 
 Mon, 15 Jan 2024 04:54:57 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b0040e6b0a1bc1sm9160488wmq.12.2024.01.15.04.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 04:54:57 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, corbet@lwn.net
Subject: Re: [PATCH] Documentation/gpu: Reference articles on Linux graphics
 stack
In-Reply-To: <20240115113908.25897-1-tzimmermann@suse.de>
References: <20240115113908.25897-1-tzimmermann@suse.de>
Date: Mon, 15 Jan 2024 13:54:56 +0100
Message-ID: <87zfx6oixr.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Add two articles on LWN about the Linux graphics stack to DRM's
> list of external references. The articles document the graphics
> output as a whole, including the kernel side.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

