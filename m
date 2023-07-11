Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E2E74EA78
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 11:28:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE6E10E34C;
	Tue, 11 Jul 2023 09:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D2610E34C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 09:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689067726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ElB96/B5cF3SirD9nOg8hph9QYwwBNtS7UKQZC5Rq/I=;
 b=TT0esI0RrQC/jU72+UuT/ufp96pCgfQeRfoiuCZAKc+cesV0uFgq4FgCGi3GS+pFhHL9hS
 jsVUCcDpcxumiL6gmYCH2p2DOpRSjRE55cuHDNiocJL+pMA94W2cjAWmcIFnVWbCj3vouB
 Vg66sb/YMzVxiWK5iaYWMRIXBDzrRlQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-CtW9sV1jMJGss97IZUM-9g-1; Tue, 11 Jul 2023 05:28:44 -0400
X-MC-Unique: CtW9sV1jMJGss97IZUM-9g-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3fbdf34184eso34559725e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 02:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689067724; x=1691659724;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ElB96/B5cF3SirD9nOg8hph9QYwwBNtS7UKQZC5Rq/I=;
 b=ANTvXNDfWopxHTGM6QB27RPJlD+exSFyQE7RIaC8fs/dGgzOJXxTVyyz+QjxUjexbv
 hI5oX5N+GW9rFAzfo1g61dynORndCJyUmEMiR5UGYakkD7hdhMQlcMXHM/kUt2Y4yh7f
 FzjryV0E7Qvkr/V+jOTnbrSJK5VL+ANWsR6tOxosXsxAKOG1416G3E/IAT5vznEBR6RK
 EiLZJkz6NrPUin8ojwNgW8BRshpv2tIKDDblnRdE3JrXood9FmUfZVucF1vLtA2GTBPz
 4KESjN11fMvhpbGZfjtokikQKv+LgF8CJKi4u+w81mqyB7CeVD1uWol/eJc7p8f0uNr5
 EjWw==
X-Gm-Message-State: ABy/qLZ4ffPE2npR4rxyzr29j4ucBjt0S76FuxB8FdRNMqWxID7NdIU7
 0nCueDatnrlVWrj6mXpPak+VXR8zYc7P3i86X58F5sFqAEU0ebiQac/g5IQXgbBEuVF+1orQzpr
 FtAbpFmaTou0s/dfl22v5t0hLygcM
X-Received: by 2002:a1c:770c:0:b0:3fc:e7d:ca57 with SMTP id
 t12-20020a1c770c000000b003fc0e7dca57mr5867893wmi.2.1689067723900; 
 Tue, 11 Jul 2023 02:28:43 -0700 (PDT)
X-Google-Smtp-Source: APBJJlErR0pfbKYYTEqqfjV/R8pmlUAtY5LKpmt2vZVYMiehafSoIpETSiV+tOoHig0IhHmT5DXRsw==
X-Received: by 2002:a1c:770c:0:b0:3fc:e7d:ca57 with SMTP id
 t12-20020a1c770c000000b003fc0e7dca57mr5867870wmi.2.1689067723572; 
 Tue, 11 Jul 2023 02:28:43 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u13-20020a7bcb0d000000b003fbc9b9699dsm1963148wmj.45.2023.07.11.02.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 02:28:43 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, tzimmermann@suse.de,
 airlied@redhat.com, yizhan@redhat.com
Subject: Re: [PATCH 1/2] drm/client: Fix memory leak in
 drm_client_target_cloned
In-Reply-To: <20230711092203.68157-2-jfalempe@redhat.com>
References: <20230711092203.68157-1-jfalempe@redhat.com>
 <20230711092203.68157-2-jfalempe@redhat.com>
Date: Tue, 11 Jul 2023 11:28:42 +0200
Message-ID: <875y6qiyph.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jocelyn Falempe <jfalempe@redhat.com> writes:

Hello Jocelyn,

> dmt_mode is allocated and never freed in this function.
> It was found with the ast driver, but most drivers using generic fbdev
> setup are probably affected.
>
> This fixes the following kmemleak report:
>   backtrace:
>     [<00000000b391296d>] drm_mode_duplicate+0x45/0x220 [drm]
>     [<00000000e45bb5b3>] drm_client_target_cloned.constprop.0+0x27b/0x480 [drm]
>     [<00000000ed2d3a37>] drm_client_modeset_probe+0x6bd/0xf50 [drm]
>     [<0000000010e5cc9d>] __drm_fb_helper_initial_config_and_unlock+0xb4/0x2c0 [drm_kms_helper]
>     [<00000000909f82ca>] drm_fbdev_client_hotplug+0x2bc/0x4d0 [drm_kms_helper]
>     [<00000000063a69aa>] drm_client_register+0x169/0x240 [drm]
>     [<00000000a8c61525>] ast_pci_probe+0x142/0x190 [ast]
>     [<00000000987f19bb>] local_pci_probe+0xdc/0x180
>     [<000000004fca231b>] work_for_cpu_fn+0x4e/0xa0
>     [<0000000000b85301>] process_one_work+0x8b7/0x1540
>     [<000000003375b17c>] worker_thread+0x70a/0xed0
>     [<00000000b0d43cd9>] kthread+0x29f/0x340
>     [<000000008d770833>] ret_from_fork+0x1f/0x30
> unreferenced object 0xff11000333089a00 (size 128):
>
> cc: <stable@vger.kernel.org>
> Fixes: 1d42bbc8f7f9 ("drm/fbdev: fix cloning on fbcon")
> Reported-by: Zhang Yi <yizhan@redhat.com>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---

The patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

