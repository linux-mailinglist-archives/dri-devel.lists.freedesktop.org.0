Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D33679399B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 12:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B799F10E5F0;
	Wed,  6 Sep 2023 10:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9C110E5F0
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 10:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693995220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7P8kh6CIVjrAvpwiqFyzHCIsBPa3I3p11VQyjXy+3Zk=;
 b=QxEAdR37iI40fhyNEu1CCodL3H/R7qsMZq9Fbbbt4HZRYtOc3EBVHydHxBKeGpeU1p4tHY
 rGCtGT1/rvVX2CdjDbDtfGLGKeq/dYrEf92bCZ6m7o1MNwSTok9M9A0dNwscKgGGUmln1H
 Plu4NTRzCh6FTtwRsgcJN6YrzFJc5+E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-lQRgfEOOPU-Z7kizgzwDzg-1; Wed, 06 Sep 2023 06:13:39 -0400
X-MC-Unique: lQRgfEOOPU-Z7kizgzwDzg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-402493d2997so19988785e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 03:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693995218; x=1694600018;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7P8kh6CIVjrAvpwiqFyzHCIsBPa3I3p11VQyjXy+3Zk=;
 b=DQnXwoSMCkwZcYJNRXLrvw3V6PXH6/Am51oXsWE4BLAWouCGSnEA0ad6a7IdieuoGo
 m81nfZKgTD+Y0gWbMM1/CEXGE0fX7EVqONS1FV9P8WX8y4pUAxGXL/cimh0c2RwBiW+N
 ljHrv5hmyYHCyIT61LvGKU5NlFp3rm6ihWXw/XvQNTuGCRwJOU2miK3GZoZxSqls4MGE
 k+c6dZDZJCo8ov4a54nf+z7O7SyNQXXzVqhOJxJMGRNPax3jeIsZBdBpi6EdtfuI80yv
 E5sCsQk3dzWPpNSuEGdYkx0IEuHZD8mrbEFSB/2D3NygjSDKtdOZpiZ3Nx0MgPv3+f2Y
 rzSg==
X-Gm-Message-State: AOJu0Yzn3SlDstQQUuOcGA3FGy2pWtGMO4+wF0H4wrvNQjw4ZjM+mQfP
 niMdK+5Lu/IDlOMwB1y7Y+VEGL3F8eHVJKD4UxXimaUWRyPXmBtkDcwm8omv+/pWYjhUkkWi4VO
 tl8d/UY6G8pTqILA55PlbaXQnAzN/
X-Received: by 2002:a7b:cc8f:0:b0:401:7d3b:ccaf with SMTP id
 p15-20020a7bcc8f000000b004017d3bccafmr1731095wma.4.1693995218314; 
 Wed, 06 Sep 2023 03:13:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGa0rqlpwHCD3ArX4qRxa6wt4EmB6m2UPyb4S2zhNfk6B8JHfjyXVCJwwpoBZ8fsicra3CMQ==
X-Received: by 2002:a7b:cc8f:0:b0:401:7d3b:ccaf with SMTP id
 p15-20020a7bcc8f000000b004017d3bccafmr1731087wma.4.1693995218007; 
 Wed, 06 Sep 2023 03:13:38 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 17-20020a05600c021100b003fefca26c72sm19443756wmi.23.2023.09.06.03.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 03:13:37 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 7/7] fbdev/core: Clean up include statements in fbmem.c
In-Reply-To: <20230829142109.4521-8-tzimmermann@suse.de>
References: <20230829142109.4521-1-tzimmermann@suse.de>
 <20230829142109.4521-8-tzimmermann@suse.de>
Date: Wed, 06 Sep 2023 12:13:37 +0200
Message-ID: <877cp34nji.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Remove all unnecessary include statements from fbmem.c. Most of
> them were for functionality that has meanwhile been moved into
> other files.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

