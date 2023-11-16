Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0AA7EDE27
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:05:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0877010E2E4;
	Thu, 16 Nov 2023 10:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D383B10E2E4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700129096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OaK1NuSdknOBZMR/nRsin3NxTgJL6ccp/7aJ3A6xaVo=;
 b=f6YNp3acU4Voqig3eMPRbJAYeXWl3VRsPr7CbXUaNNcK2bvtZmcgg0eCTN1dUdUM5wAe9S
 /x0KLOSdoXa9UriQk/FIn+iCa5ZtLx2VXIP0AF/FqpxKfJPLk6yjzFXlJ8PRHvvuw2jMvn
 uBcWcFGvK99e4YDQwc3BBp6FEXN8PLg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-odPnH94yOH6WBFMMKnZ8FQ-1; Thu, 16 Nov 2023 05:04:54 -0500
X-MC-Unique: odPnH94yOH6WBFMMKnZ8FQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-32fa25668acso340979f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 02:04:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700129093; x=1700733893;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OaK1NuSdknOBZMR/nRsin3NxTgJL6ccp/7aJ3A6xaVo=;
 b=Migfz9FYGN51i1vIJX+Eb5bBG39m9Ors0pXaZI/T3r/PQs7Jr7zp70Oe21+512qxxU
 gPqvOHEisABTuWkWbZ3zG5DbC/2YfFSnHdDpOuqHf6eBbDxVWA7rGdsIDdmdaBsRGYmy
 bBoqs0LSyNJ3MJxgYyINHeVBa9XXp+DW1iU52G6dNYvR4TkZxvzdGVM6NMObDFZjsXwV
 GlJtUrM4NzAKJex5P88h+I3dpvqOIKUK5klxxVYpqJgiVoa0lrRvRCzIjZxv3B0AgRFI
 NczY+Za6p1ng/hlBzYNRspubFveMp6O3F4vGeJ3egeoAJAfLNWXM2dHejUqS3470DFLj
 jTWw==
X-Gm-Message-State: AOJu0Yxf9Pg/uHSfPp9Ibr+jLUECgJ8Jq7Cvy640B7L8EHYoN2aPP6o8
 /NgHA0w3TmqSTcN7kMX1LkSDapBuCOzMD53bjrIG+TMg17zC3oAokQzR/pevIw4t2PCK5/dhGyH
 9ZJosIr9TQylJGQc30AKSnrss9Ewv
X-Received: by 2002:a5d:614d:0:b0:32f:b419:6ec2 with SMTP id
 y13-20020a5d614d000000b0032fb4196ec2mr8423789wrt.34.1700129093461; 
 Thu, 16 Nov 2023 02:04:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBdR/Qf20htP1IxZiF8zAwtCN0pAwhyRvoicluUpG8NwQk97ZggETQDD6qYQMOKadayZ4f5w==
X-Received: by 2002:a5d:614d:0:b0:32f:b419:6ec2 with SMTP id
 y13-20020a5d614d000000b0032fb4196ec2mr8423774wrt.34.1700129093112; 
 Thu, 16 Nov 2023 02:04:53 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n7-20020a5d4847000000b0032d88e370basm13050490wrs.34.2023.11.16.02.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 02:04:52 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 04/32] fbdev/vfb: Initialize fb_ops with fbdev macros
In-Reply-To: <20231115102954.7102-5-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-5-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 11:04:52 +0100
Message-ID: <878r6y57zv.fsf@minerva.mail-host-address-is-not-set>
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

> Initialize the instance of struct fb_ops with fbdev initializer
> macros for framebuffers in virtual address space. Set the read/write,
> draw and mmap callbacks to the correct implementation and avoid
> implicit defaults. Also select the necessary helpers in Kconfig.
>
> Fbdev drivers sometimes rely on the callbacks being NULL for a
> default I/O-memory-based implementation to be invoked; hence
> requiring the I/O helpers to be built in any case. Setting all
> callbacks in all drivers explicitly will allow to make the I/O
> helpers optional. This benefits systems that do not use these
> functions.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

