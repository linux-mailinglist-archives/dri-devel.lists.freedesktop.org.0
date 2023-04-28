Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5179D6F1B37
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 17:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C4110E3CE;
	Fri, 28 Apr 2023 15:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9953710E3CE
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 15:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682694788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T6nMtf6Gzq3uJ6hYj+VP/gNrA7S63KDC0HhAUOQNVRE=;
 b=ea2r46un4+f9taKv8oVNBdRC1HDvV4QB04t02iJhTy4mE+kzlEfCdFKMzkRM1en8b3R4cM
 v2JM/Q5mvoW69oL7Lzy9LIUl0+Oytw9N8QgBCjJFKALjjgjDDUpnp4u9dI6HDpFY9Jq3RU
 aqAmcp+42HLLKiPw3dPQNZAItSdScLo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-hW_EVH2nPbCEUUtFHQ3vqw-1; Fri, 28 Apr 2023 11:12:31 -0400
X-MC-Unique: hW_EVH2nPbCEUUtFHQ3vqw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-2f69e5def13so3709737f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 08:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682694729; x=1685286729;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T6nMtf6Gzq3uJ6hYj+VP/gNrA7S63KDC0HhAUOQNVRE=;
 b=PZGnOrr+OCNMbprpuGLkKcS/CRY1jUDSyedzXRwCDnpyYu2CW0ILm6kSOFBuXxb0pU
 DWBqnIeGNYnIG4nDFXRzxeBawiTyRDfxIpu+U7ZcLXusCgtZiUk/hiygP1MeApVHYyi8
 LoQXjEqsCOVVWdURZI3u3wGg4zg/lOT9MQqx+O6X4ityXjB6gwnZkFbX3zOxicvSUYvI
 8FvVWSDvMsTTUZS1uZWIIFHGPPsugIbgETi0tcQQvUw6WD3z2l9Fop6bg7uR0wx7EAek
 KFyJzzncNAZwDsLZ9jcr07BaIS6AkpMB1CseEYGlfFYs85Cu/y1srvy8pnVlpfTArf1M
 ugMw==
X-Gm-Message-State: AC+VfDz+31sCeVpc8H6u4NJHDqeyWg84zlgOK58gGBoLHHLhRWyIkOGl
 p4VLRFFsmF9FR7mIKWRv4rW75odpNLn84rIpo+EvqLyXg3S2txn4glIhTcSxQMF0wkPL52JMdMs
 57HZ7VE/+c3N2KzfivYt7ez+bpZ1O
X-Received: by 2002:adf:e689:0:b0:304:760c:6474 with SMTP id
 r9-20020adfe689000000b00304760c6474mr4572624wrm.10.1682694728863; 
 Fri, 28 Apr 2023 08:12:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ44bsNLFtYJtMnmm9jFzKFRATuTWPXEJOmr7ScTjElY9MxGn1aNvKFBPBprMOJgW6uVbp7bQw==
X-Received: by 2002:adf:e689:0:b0:304:760c:6474 with SMTP id
 r9-20020adfe689000000b00304760c6474mr4572608wrm.10.1682694728534; 
 Fri, 28 Apr 2023 08:12:08 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c351300b003f1958eeadcsm20815145wmq.17.2023.04.28.08.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 08:12:08 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: Re: [PATCH v2 11/19] fbdev/udlfb: Use struct fb_info.screen_buffer
In-Reply-To: <20230428122452.4856-12-tzimmermann@suse.de>
References: <20230428122452.4856-1-tzimmermann@suse.de>
 <20230428122452.4856-12-tzimmermann@suse.de>
Date: Fri, 28 Apr 2023 17:12:07 +0200
Message-ID: <87o7n8f3co.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use info->screen_buffer when reading and writing framebuffers in
> system memory. It's the correct pointer for this address space.
>
> The struct fb_info has a union to store the framebuffer memory. This can
> either be info->screen_base if the framebuffer is stored in I/O memory,
> or info->screen_buffer if the framebuffer is stored in system memory.
>
> As the driver operates on the latter address space, it is wrong to use
> .screen_base and .screen_buffer must be used instead. This also gets
> rid of casting needed due to not using the correct data type.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

