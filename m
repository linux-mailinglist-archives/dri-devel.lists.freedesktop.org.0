Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A33348A6B20
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 14:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFFB2112C38;
	Tue, 16 Apr 2024 12:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JKiqqro5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B77E112C38
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 12:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713270975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4E2yQzFw0tRwPq3m+OASOzA8/elGwcx9OxMy90Dldfc=;
 b=JKiqqro5zZTHyqB/9EnnlLKBpW8tkpfi+W+OIjVKZVS9oILcqc90/NYeb7TAiXlYXetIPV
 zs58qNemEfvejtZ59z2aCa7lZsO8ysBAyPq5LUkLEsZGIZn5VZ+Jp6ItoUIuSPhQc8ixyb
 G1CBqOK9nVWxGlqfn+b9DEoV1x2GDdY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-kEJhbhE7NTSKSX58rQ4m4A-1; Tue, 16 Apr 2024 08:36:11 -0400
X-MC-Unique: kEJhbhE7NTSKSX58rQ4m4A-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-34619c30076so3051780f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 05:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713270970; x=1713875770;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4E2yQzFw0tRwPq3m+OASOzA8/elGwcx9OxMy90Dldfc=;
 b=XzhBDAxZf7mEyLBoOP3aHkmpV4fE+sqGwDUy5jjCqX6LG6sfUegOCgWTH01Q+VYnWi
 so7JaqITbMCRaxZKUU8ldaZlRBtfFq7IfDTRZszn5Zp8g+J6N9wvMMmKP5hBo1lflHVq
 vYREpelI1ge1CYDZS75pD9jinjt+rurYrH5KMv6PmVf6oQyCqjkMnlH+ngOopcxRm20H
 ZPjx8lxPC+YGZxFZWWCPHg/AooSAQzrqKFJ1Guh0AQehLsC9vFcyzld1aTGZ80jaT198
 D42nlNb6OSFgIrSdJpsZJViznBorByI7IYIMJB/Dk3/e+UGzCZylLxBws6sLWtfnUiWH
 RdTg==
X-Gm-Message-State: AOJu0YwxuDK8bbOagIkBL4CprKf0gwp4us5Ot9KWCu2yQQY2Q8eE3+Jg
 /2F9DoR0AlNDl5lRU7TlVgV1PhKMQgxHFl9v45r+dsbVLJBBLfTLpBXajuhk0IteIe6Bo+0DKxs
 dY+fQJ8QYq4MjOVIGb9NIMzib4bvFz5bvUy7jY3VkcoqA4hB4fixiNaqu0WjI/IOCwQ==
X-Received: by 2002:a5d:6483:0:b0:347:9c4d:4e19 with SMTP id
 o3-20020a5d6483000000b003479c4d4e19mr5575583wri.70.1713270970428; 
 Tue, 16 Apr 2024 05:36:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOjnBD9YZr1IuDPEzQiyEvL0p/5MKtQssuqlXB/PTv8G5ulknmrqVK8CVSXBSXhre1om5ezg==
X-Received: by 2002:a5d:6483:0:b0:347:9c4d:4e19 with SMTP id
 o3-20020a5d6483000000b003479c4d4e19mr5575568wri.70.1713270970085; 
 Tue, 16 Apr 2024 05:36:10 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfcc09000000b0034997769ae4sm438219wrh.15.2024.04.16.05.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 05:36:09 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 27/43] drm/panel/panel-ilitek-9341: Use fbdev-dma
In-Reply-To: <20240410130557.31572-28-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-28-tzimmermann@suse.de>
Date: Tue, 16 Apr 2024 14:36:08 +0200
Message-ID: <87mspt5vt3.fsf@minerva.mail-host-address-is-not-set>
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

> Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports
> damage handling, which is required by panel-ilitek-9341. Avoids
> the overhead of fbdev-generic's additional shadow buffering. No
> functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

