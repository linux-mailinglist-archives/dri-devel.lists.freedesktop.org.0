Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E72E7EE11E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 14:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD10C10E113;
	Thu, 16 Nov 2023 13:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A3A10E113
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 13:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700140382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xleHXMOYndgy/0SzjJt8wqPeBlWoOdp4DyJVoMu5fsw=;
 b=fWYYCUH8whwPp4sSm9hklgVr5ge0VKV0HBHBmu4d6gFcEHztMPfZ1C6zBDC8JU1A5oQkMx
 U96V0pbEvhKbP3uZ6/9vLTEqIGafA6Purw27nX2niGpFI62mGjgXIX4IIvv8DdiGUNlIpD
 xM+y67zjKRb22pK3kSZP0BOGJfXGszE=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-lFt-dbCdPAuF_F9KCSdUZA-1; Thu, 16 Nov 2023 08:13:01 -0500
X-MC-Unique: lFt-dbCdPAuF_F9KCSdUZA-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2c59a4dcdd0so6737901fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 05:13:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700140380; x=1700745180;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xleHXMOYndgy/0SzjJt8wqPeBlWoOdp4DyJVoMu5fsw=;
 b=dY3PQLBWLDJjk4N9K5scC21J/AfslwL5X9NSIb9t9LiZhNnSHNOYCXslaX2VIUtdPb
 G/iNNEKam9f+hwkDnJlTzNok9PYZxiXhFFxsdwGdxHY+X+TLdtZTSCYonv+NgPwrp05G
 rX5yopRCHZB0MxSLST7fdUuzqtgSLr9Dn69tuzMS2rhVKo//Q5yy6bxZKcrdWo7QdPrV
 GWYJlZCeWmACSgreg4vBfMcTfFKhbDHu7XNfxU/vOYPFzm7EFUAM37r2eOMWKs2/WwWO
 HSB41SrPwabVcf3iu0jhibHgzqR3wNkjOebwJjpb8uUb0oiToj4yPNMj1pucm48l9A7j
 mbJg==
X-Gm-Message-State: AOJu0YxlwDdf6l0qB4IqWZA4Yz9mGhc75Chj/br9zrGCN4BkQm2XHJuK
 fNnDEg92n4DKPiSNlS1AuRD422tbqlm1c11Cj0gJJYmMHPottWpALEdptVbxmtT081oOYB12U6l
 qEERJUKjoEJOZUOnqhZ1TRCvWNvKXtH2nXFPp
X-Received: by 2002:a2e:8018:0:b0:2c5:70f:614a with SMTP id
 j24-20020a2e8018000000b002c5070f614amr5915549ljg.17.1700140379861; 
 Thu, 16 Nov 2023 05:12:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZq8VMxo51xXvQF1h4C7TgM5Rtss1R7wyZzjAWJgcFAJspMD3HirntEI6zKgyIlaPaGVn0jQ==
X-Received: by 2002:a2e:8018:0:b0:2c5:70f:614a with SMTP id
 j24-20020a2e8018000000b002c5070f614amr5915535ljg.17.1700140379560; 
 Thu, 16 Nov 2023 05:12:59 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n20-20020a05600c4f9400b004060f0a0fd5sm3657213wmq.13.2023.11.16.05.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 05:12:59 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 31/32] fbdev: Warn on incorrect framebuffer access
In-Reply-To: <20231115102954.7102-32-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-32-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 14:12:57 +0100
Message-ID: <8734x53kpy.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Test in framebuffer read, write and drawing helpers if FBINFO_VIRTFB
> has been set correctly. Framebuffers in I/O memory should only be
> accessed with the architecture's respective helpers. Framebuffers
> in system memory should be accessed with the regular load and
> store operations. Presumably not all drivers get this right, so we
> now warn about it.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

