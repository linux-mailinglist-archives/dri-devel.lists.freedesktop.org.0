Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFE5969B47
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E41010E47C;
	Tue,  3 Sep 2024 11:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YpgCCYut";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F1210E47C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 11:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725361993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eNaLJCzc8McH6yKUfj3b0fV3lUF+xcAOFhE3bUUfh6Y=;
 b=YpgCCYut7DrJpuTEA/VQVrNVu5cw3suN0TSt9dEsKm2lVjV6ecuMEPA+zgoShhzeufkXpT
 UHeZnoZ2xEtJp/8zgLFtfG6nIgZExvuc1jpqskm+NDc76h8PCmNxDEcAd5NdY0A3x41Q5J
 TM1VOLLkOr+2eUCJssBSGK+ClSzQLOU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-YSKWGIxuOguCt4VeQFMYng-1; Tue, 03 Sep 2024 07:13:12 -0400
X-MC-Unique: YSKWGIxuOguCt4VeQFMYng-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42bbf928882so34065745e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 04:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725361991; x=1725966791;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eNaLJCzc8McH6yKUfj3b0fV3lUF+xcAOFhE3bUUfh6Y=;
 b=AIZ9m4k516UIcDO6XWa3yOMbr0h9wXnwhJGJ3l15i7m+h4CX9ejT+g4WISRGVDUEtK
 x7H3PS97iHp/09g5Pxu1lQoZNQnb3dDPAux+j2St0U7f78onSTODVXyN3v9rxddxg41V
 BYAaItzKvarmJUE1sWL+O9+E5RL2KzKtrnLMucLac+q0Raw6sXnuj70J6cvM5GkL553C
 HDdXS8Dt4pdkX8ZqWlqEpydNKPZqT+DBIQOpBQXDwpz6ZRLQiHwQS6JzV0xjG9gqe8MS
 gLlnfXXEoWOQC/tJL0KSvvTQrZv4lAvB4+u/scv0Sui46VFi9PPgGnW5yajbB2qExkIA
 ZuIQ==
X-Gm-Message-State: AOJu0YxS0hpGuvo/DIf4iPaGlb7Ie35+58Dk4XxANIFtm7zwn+lUzq7F
 sROS1CvxiWzXC6fzpW2eQwzlUPL7fyCnqQHGW8ty0j35LBJjeeuTy0K9AbZ69h9eENL97l9wSRs
 W+RziNG/7CRHjZlb+uX40BM3x5bhHRzsEMqwEEj17UbToT7stDmEdGAu9AlU3tev1nYM6J9EPgw
 ==
X-Received: by 2002:adf:e042:0:b0:374:c8a0:ca8c with SMTP id
 ffacd0b85a97d-376dea47175mr310995f8f.43.1725361990981; 
 Tue, 03 Sep 2024 04:13:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErKuUaZwDVmhsR7doTbtSmBnmM7k053hpSErI0ylM4sAqourCJsbqDohSz+3dvc+wiabrelQ==
X-Received: by 2002:adf:e042:0:b0:374:c8a0:ca8c with SMTP id
 ffacd0b85a97d-376dea47175mr310977f8f.43.1725361990502; 
 Tue, 03 Sep 2024 04:13:10 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df1066sm167087945e9.18.2024.09.03.04.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:13:10 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alexey Brodkin <abrodkin@synopsys.com>
Subject: Re: [PATCH v3 06/81] drm/arcgpu: Run DRM default client setup
In-Reply-To: <20240830084456.77630-7-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-7-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:13:09 +0200
Message-ID: <87ed61gfcq.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Call drm_client_setup_with_fourcc() to run the kernel's default client
> setup for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> v2:
> - use drm_client_setup_with_fourcc()
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

