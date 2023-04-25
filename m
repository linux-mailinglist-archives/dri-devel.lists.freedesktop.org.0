Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C75226EE5EA
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 18:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C7910E4D6;
	Tue, 25 Apr 2023 16:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987C410E4D6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 16:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682440804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aQSLc7zBWM0xayJpXB/UQ+q0RauQF+XOpc5CopilIa4=;
 b=UJtOEpPs3TRcCVGcAvqfGSm03B5WUReaMVUsCwOl4lJRz9H5vL6Ms7YLt+7GRYHrjmhuTZ
 YmOY0M9OlpFn+aeitFtYZnRhlmbGv/JaPAnPCEvKh7Qq5Um4rj87FtC6rGqU+XXlmXsEWm
 RYKLS9TMqXDc1mVOpafIzXukpiIzBvM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-4CPgcDQ5N1SpKnRh6sE0jQ-1; Tue, 25 Apr 2023 12:39:51 -0400
X-MC-Unique: 4CPgcDQ5N1SpKnRh6sE0jQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-304991654ceso9482f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 09:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682440790; x=1685032790;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aQSLc7zBWM0xayJpXB/UQ+q0RauQF+XOpc5CopilIa4=;
 b=IOMFa2kdl9eLsWEH4b9DIK9WRr9YWmWplHiA7deuHyDNYxHfilZDO7go1wD/VJBE9n
 Vs5eCstpI7wAaDAp5290DR5JUBbKBjRn5wqP7fHOEaRE8eTHmAJ9Ti0dskSr4fPphcXF
 yUZOYk/Mr96PkvpXJRsBQrlIsvgyq43tOyZMoWWPu+5fhbbMSrNiTO5IY8qJzUpEOyQM
 5NiwM/w0hXQSHxbv0sJb0+dsHI2Bf17esMTOIwP8ovj3W/bMHzMGBy5jVTKzU87YWKjo
 P0T/Kmd9jTsYqZz5h0oJuGSsIcQ1YVx4xpSpX40SZXNQeodjDwqhHMrfrEaaXqBzhIBJ
 2vFA==
X-Gm-Message-State: AAQBX9foCEqmT4jpH0huOX/yiumSpZprM3lj/N6d4oPAXJ8v1G3vCK1J
 DL/SED+ICfsFNR0Hgb1ywYD8AGlBPZFLUrX213gmvHC1PmXBITkNjG525O3IstCSzfwTwnapX3D
 Nxmjg+Hw0TmtOmRL5/RQDtqjqa+8M
X-Received: by 2002:a5d:62c3:0:b0:301:81f8:765f with SMTP id
 o3-20020a5d62c3000000b0030181f8765fmr12742611wrv.38.1682440790637; 
 Tue, 25 Apr 2023 09:39:50 -0700 (PDT)
X-Google-Smtp-Source: AKy350ayoBeId+nwPqxZP/k4nmmKYESyexlvpxVG1csM3TSUzvaMhsq/0BUDHIZjBYsDwov+L8b1ug==
X-Received: by 2002:a5d:62c3:0:b0:301:81f8:765f with SMTP id
 o3-20020a5d62c3000000b0030181f8765fmr12742594wrv.38.1682440790330; 
 Tue, 25 Apr 2023 09:39:50 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z3-20020adff1c3000000b002fb9e73d5e5sm13471416wro.60.2023.04.25.09.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 09:39:50 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: Re: [PATCH 4/6] fbdev: Validate info->screen_{base,buffer} in
 fb_ops implementations
In-Reply-To: <20230425142846.730-5-tzimmermann@suse.de>
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-5-tzimmermann@suse.de>
Date: Tue, 25 Apr 2023 18:39:48 +0200
Message-ID: <874jp3j4q3.fsf@minerva.mail-host-address-is-not-set>
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

> Push the test for info->screen_base from fb_read() and fb_write() into
> the implementations of struct fb_ops.{fb_read,fb_write}. In cases where
> the driver operates on info->screen_buffer, test this field instead.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

