Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 895896EE608
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 18:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18AF810E661;
	Tue, 25 Apr 2023 16:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A8C10E661
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 16:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682441252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CUYVoYgihNiWk8z2Sv79/ruxO339axDQR6J4y/OWdcA=;
 b=jOnHTw591Y+AgwhLHQ8omj5gMh/0F7TekwpqGn0FUts0kfE9Ig01jQREpx257RfkKHCYnB
 NcLr6E0I9JZfUizjhDlLJp31EcS6hQR7m8lczbeRuhABtSlrkS9bzRQQ3YU/qY0eisK0Jo
 XUBxHboyv+XNhUjkaGGBewPaPvtWFx4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-RsUbTurCNnSJmUncziF3ZA-1; Tue, 25 Apr 2023 12:47:29 -0400
X-MC-Unique: RsUbTurCNnSJmUncziF3ZA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f171d201afso36230075e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 09:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682441248; x=1685033248;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CUYVoYgihNiWk8z2Sv79/ruxO339axDQR6J4y/OWdcA=;
 b=GxwuIRm9Fl710XnW2WJIYyDoAwftH6qJGLaWWfhb2OmkGsM/zIKEeFk+tM1XgREU+a
 3/PJrb9/mHVzMoymusZEC+tF5NqamPVlHx4kfv/TqwTe4u89D4UpxVD3nbNBg12EWOs2
 vH6dHE3WnayU6XSM7guw6VdRnMXRPmY4PSJk05v4Chmi6XYJhLKS1HInp9PGbmnvz69h
 OcwPNcSDyWJCeJxfmcAqX9B0tdbjYXSLssKE/gebV77wN6KZFf/7xNsaM/mKg6sx1nVH
 mavANyaKNh4TsMtnP99T6WRYfRz8uzObBS4ShO1XF1Re3OMHLGs6+eiw2Q9H2Jj/IT5A
 owlA==
X-Gm-Message-State: AAQBX9dN0lRXrRLGlPYMSOCAEoB335mU97zHM9Or2j14dmupuflTc96N
 p7CG8sKicacRMGA9w3tAXay68GjEqjgglHKyyAPN0K8zTr99qhEyeFAl6TBuKSzSTapDcYAamtv
 WcK7rNHFgrMZUSCkClMhsvxap1P4P
X-Received: by 2002:a1c:7310:0:b0:3f1:8af9:55ae with SMTP id
 d16-20020a1c7310000000b003f18af955aemr11827250wmb.18.1682441248394; 
 Tue, 25 Apr 2023 09:47:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350ap3hB79kNxuIe8gJOkpVZj6XwdRmtAykbm9wMpx1kLVHGn9VQ09MhidQrGjJ27teef0EJLZQ==
X-Received: by 2002:a1c:7310:0:b0:3f1:8af9:55ae with SMTP id
 d16-20020a1c7310000000b003f18af955aemr11827232wmb.18.1682441248086; 
 Tue, 25 Apr 2023 09:47:28 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t12-20020a5d690c000000b002f74578f494sm13534510wru.41.2023.04.25.09.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 09:47:27 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: Re: [PATCH 5/6] fbdev: Move CFB read and write code into helper
 functions
In-Reply-To: <20230425142846.730-6-tzimmermann@suse.de>
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-6-tzimmermann@suse.de>
Date: Tue, 25 Apr 2023 18:47:27 +0200
Message-ID: <871qk7j4dc.fsf@minerva.mail-host-address-is-not-set>
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

> Move the existing CFB read and write code for I/O memory into
> the new helpers fb_cfb_read() and fb_cfb_write(). Make them the
> default fp_ops. No functional changes.
>

It would be nice to get an explanation here about why moving these
make sense. I guess you are doing this because is going to be used
in DRM but still would be good to explain it in the commit message.

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

