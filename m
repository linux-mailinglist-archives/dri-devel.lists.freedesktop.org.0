Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5D1788BA2
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 16:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8560510E6BE;
	Fri, 25 Aug 2023 14:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B212210E6B3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 14:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692973511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iLe7Hz9hIvArCvNjGaVsDlE5GwrR7kyLDrkGz589rRg=;
 b=M7yS+KIPZyDDiEfwt7R5+qxCsNQi2A2FjXirw82yo739nI187jZRo1F/a0CdZIrkU/0FEJ
 a4psVim0tKVNmwMYAIC3h0Cpm6qVzWSxFjbBlAO2efRTx+052+OuhrjeV8dMhy2Bw/fs2O
 SrGrgvur6cckku8w+u87M/MHY0Dc0eI=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-PlTizo4qPGq_UWjq947WDA-1; Fri, 25 Aug 2023 10:25:10 -0400
X-MC-Unique: PlTizo4qPGq_UWjq947WDA-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-1ad17b9fcd8so974322fac.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 07:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692973509; x=1693578309;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iLe7Hz9hIvArCvNjGaVsDlE5GwrR7kyLDrkGz589rRg=;
 b=QzH1W2qRyL8W7STRA3XuvMFLMrrguDRBEH7/fv/iY85K+eMxlqu1+YUAlb1Vg4/1mt
 Cg+ZMESxLAHBQY7CMXM+1NXFi3AKxStxHS5XiMtb+EY1JciTSWLZkT/jJGyQW2+TNq37
 avlm+bN7OWoODjpdLRsXM9KDX6rJDaJdIn+8f9EZZY+aWBrLumpdYNsEDkQVyKDrA1zG
 Xj1QttpVzi7XbBCuxI6k06+y30w+tJcfkAxBMnotly83ZULPiqdlZw8y56YBMw9MXle2
 OPOgsWVtwexwS+mVFXC+0zq6mQb4+ZE6O46KoankzH/mH4AcWlImVu0mBLICu0CGi85d
 Hbxw==
X-Gm-Message-State: AOJu0YxUCncaetvlKO4fGC8a2BQgxfHa+A0IpBJCD0Ng5ZcjHs7C610R
 ailqu3Jdxe+0Fk5SSDzfynND5zWChz6fS7YZsG5THctt3d+qg3aXbxsJ05+AfUzyZCLL7MiDCN+
 aYy7uK8ldCeVM1X/lHVF1eUH6QdS8
X-Received: by 2002:a05:6871:71f:b0:1b3:d39a:9684 with SMTP id
 f31-20020a056871071f00b001b3d39a9684mr3141852oap.47.1692973509716; 
 Fri, 25 Aug 2023 07:25:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFCZ3cOiyh3rqxLUmSkbdvU4HLHH2P6U6gbTQ218akkzaXDKY5j8LTayP4XO/pP/qOpjq0Mw==
X-Received: by 2002:a05:6871:71f:b0:1b3:d39a:9684 with SMTP id
 f31-20020a056871071f00b001b3d39a9684mr3141831oap.47.1692973509489; 
 Fri, 25 Aug 2023 07:25:09 -0700 (PDT)
Received: from localhost ([181.120.144.238]) by smtp.gmail.com with ESMTPSA id
 p62-20020a4a4841000000b00569478f2d83sm989700ooa.23.2023.08.25.07.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 07:25:09 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, tzimmermann@suse.de,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, ppaalanen@gmail.com, contact@emersion.fr
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
In-Reply-To: <20230825140434.182664-1-jfalempe@redhat.com>
References: <20230825140434.182664-1-jfalempe@redhat.com>
Date: Fri, 25 Aug 2023 16:25:05 +0200
Message-ID: <87v8d3urlq.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jocelyn Falempe <jfalempe@redhat.com> writes:

Hello Jocelyn,

> After discussions on IRC, the consensus is that the DRM drivers should
> avoid software color conversion, and only advertise the formats supported
> by hardware.
> Update the doc accordingly so that the rule and exceptions are clear for
> everyone.
>
> Acked-by: Simon Ser <contact@emersion.fr>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---

Thanks a lot for writing this!

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

