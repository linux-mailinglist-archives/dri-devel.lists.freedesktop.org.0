Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64340B01BF2
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 14:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A43F210EA39;
	Fri, 11 Jul 2025 12:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DO01NO7D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E102510EA39
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 12:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752236815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h6cIyTUlxUKleRxPJZsjU2qOf8sYZaFU5oshRZbrtqw=;
 b=DO01NO7DwkjleJ0Y6/pylY49q2yHCk/sRZNQ4BaSAmCN1bDwBKSK3sMxNhlvjJ+eEfSDZO
 HzfuWUz6t4UmRZrivrC0/CGcWmOxNYDT8Q7MxDwaZ6u/RPInupPYjooL6hcWRn/+oWS3gK
 z2Zo/JvOmMG2vBmfx+fVIy+2SkFIDL0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-W2QxRYsTOPy5akz4okjnSw-1; Fri, 11 Jul 2025 08:26:53 -0400
X-MC-Unique: W2QxRYsTOPy5akz4okjnSw-1
X-Mimecast-MFC-AGG-ID: W2QxRYsTOPy5akz4okjnSw_1752236812
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a4f858bc5eso1548867f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 05:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752236812; x=1752841612;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h6cIyTUlxUKleRxPJZsjU2qOf8sYZaFU5oshRZbrtqw=;
 b=IVnlDWhsthCuZcHvAfJ6XmtUytumKk9fwllNB5D/VaF9Fk86KaKQBLp7pynaSk2ekD
 vEigHGp/vjaht+u7M7vUZfR6jZ8UnefdBVfIjrqXlyK7dxnFrReS99WThmuT7v3u8gDk
 5XhZRy8VAWfIJGF72Yz2tcmK9YJzPduAvZVD4NO9nAaQEIX6uQ+Cyb1Ng1pCbRxVrmyY
 KeqnP27CJDEbsTEH4r/SGnYPUEXql/AB9exV6Xby3bs7qv0kwOod3sHg9Y/9nwPhjdhY
 Ck/llqvn5K4CWLTN155MG02SDK/a4zZD9gmHJl4A1nAu+5vHe2icGWxJwcbAagl3cG7i
 guiA==
X-Gm-Message-State: AOJu0YyLjXBQzduVNNp2Wz4W0HPnB2M/kZZPrHkMp/WjeghdespRyT5f
 d4OR07+h/r/cGntG2mQO7AtAmrM4kpkIJ1kqslJuWTEyAaUUE0zAH/dxpvsB2H5S45MuYJo102t
 Chbz6OIXBBODdAKfyn9q3OLqHvsNkWEBBu4p04Ep7HxnfIYw37FT+rwaUd62VDuhXKIiDgg==
X-Gm-Gg: ASbGncsHsfoWFIhn7EvTD2F16Ab8aqaOZB4wkT2ObVz8Z0BxbrbPfUZH11gVS5y45PD
 xfXXJol71gpk+bnXnfDBaPEA+RHUyPVpdt/HeflNOU55hPnckVZrSKk3DbN5lbl+SoyM05j5irM
 9cBcl6Qhb8FgVTkU3ecXolLqKLT/7bcddlc3i+USPqAXsoaSzI70fiV9gMFbgfJr4Oeh/Pm/fkB
 ikTiWybB3YJiwRpKK2MYxfzNAQh/jzYTHslyUYoE1eP5SirKuoBEKZUKGilmqo7+sl24Z9sL3ux
 mdHe8ZMwiJFBtAWvbzP0Sef9LkIEOOeITt44cZ+DoxkxuBF1xktyNHWGdp6PDuugWVM9xkcUGSx
 tSV7LzoZBseP5zoGtC5G24g==
X-Received: by 2002:a05:6000:2888:b0:3b4:9721:2b1c with SMTP id
 ffacd0b85a97d-3b5f2dac589mr2269481f8f.6.1752236812381; 
 Fri, 11 Jul 2025 05:26:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGL8CSJBE6o5XqYCKEsCXe3CS1eCNKlqQrXAX+tEp6aw4DHjm0r3g16Y2rcp+iwOPbqim0J+A==
X-Received: by 2002:a05:6000:2888:b0:3b4:9721:2b1c with SMTP id
 ffacd0b85a97d-3b5f2dac589mr2269454f8f.6.1752236811874; 
 Fri, 11 Jul 2025 05:26:51 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1890sm4308606f8f.3.2025.07.11.05.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 05:26:51 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 8/9] drm/vesadrm: Prepare color management for
 palette-based framebuffers
In-Reply-To: <20250617143649.143967-9-tzimmermann@suse.de>
References: <20250617143649.143967-1-tzimmermann@suse.de>
 <20250617143649.143967-9-tzimmermann@suse.de>
Date: Fri, 11 Jul 2025 14:26:50 +0200
Message-ID: <87h5ziewvp.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uOF_tLJWnRqpvjAnPncg09Z_eITCcVoV58jwI8oQqe0_1752236812
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

> Distiguish between component-based formats and 'the rest' in vesadrm's
> color management. Scanout buffers with component-based format allow
> for gamma correction. Palette-based formats (i.e., 'the rest') require
> palette setup.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

