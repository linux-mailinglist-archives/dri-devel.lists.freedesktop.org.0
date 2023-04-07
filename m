Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 524126DAC28
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 13:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32AF10E376;
	Fri,  7 Apr 2023 11:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A61C10E090
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Apr 2023 11:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680866551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hH4U311j/Jsqa/Lz2ki1vR6iZrMlUESpjPBImXUbiAE=;
 b=T+xBEKLxTjkwG/oCA/dgu6oIr1PZzgWEQcWLGN+Q77MgfUXJfeEReIGcEcX9owDrjxurt9
 A3G3/2eLg588EumSeiwjY/gZwabNjjFZn0mw/NQbGfEKVwBtiRtaLSzGe064REx7bbnHIA
 e/mHKMASCqKKhxaDqohgLYN03xXV/yY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-W8xsvEYrP7GmPH5jrII7bw-1; Fri, 07 Apr 2023 07:22:30 -0400
X-MC-Unique: W8xsvEYrP7GmPH5jrII7bw-1
Received: by mail-wm1-f71.google.com with SMTP id
 o37-20020a05600c512500b003edd119ec9eso19105856wms.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Apr 2023 04:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680866549;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hH4U311j/Jsqa/Lz2ki1vR6iZrMlUESpjPBImXUbiAE=;
 b=sXtc3auw//rx6V+/BjEubEDccjl30I7tXPz7U55IzyfBOpbjyKHaHM+rWnINrfcg72
 INSy1WJdc0wKAVCY904Ab+/HLPfGaLblqQWQ5KEMdjieuMjgUfzTDxuAj/t68aRnFn+7
 7712B0rvT7ZTY1pq+nwx68tbnujGsCF86neWZHnjGcUxpotH5XEc2oC36Urv6RkPqJzF
 emRB5Hj6lv+ZSCjS1puMo6DHUqpv7Lh+tl0yQz1JCIDtRbKc8rRPgkhu8cgwE73loxDP
 yVik9Iz9M9REVNEneAQhIrCATglXpJ+PtuCOqp8VfuSeGoyVYDkc897KY3hlNc4DtnxP
 Q/kg==
X-Gm-Message-State: AAQBX9cEfOapnVthi3rKihdxjImEsrIvmc2V6Ucjg/cLQcdEhUlxOO++
 FGrSzWseNtiMNPFS0aDNyJ1bX1/X6kcml+6sGitHmQ4D+Y1fBfcowTTMNJdli6PVC3tzxrRIyLS
 PnQMDwUHuygLk54B27VmfxouNRJ3g
X-Received: by 2002:adf:fb83:0:b0:2c5:5a65:79a0 with SMTP id
 a3-20020adffb83000000b002c55a6579a0mr1266517wrr.53.1680866549695; 
 Fri, 07 Apr 2023 04:22:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZoXdyDFp/08AQ2n3ydTt4/RdllFrwf07aFzR19kGeao0DxT1onEBIG3ePDCokvXC+kvLlMVQ==
X-Received: by 2002:adf:fb83:0:b0:2c5:5a65:79a0 with SMTP id
 a3-20020adffb83000000b002c55a6579a0mr1266495wrr.53.1680866549380; 
 Fri, 07 Apr 2023 04:22:29 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t5-20020a5d6905000000b002efb4f2d240sm258556wru.87.2023.04.07.04.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 04:22:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/vkms: A couple of trivial cleanups
In-Reply-To: <20230406110235.3092055-1-javierm@redhat.com>
References: <20230406110235.3092055-1-javierm@redhat.com>
Date: Fri, 07 Apr 2023 13:22:28 +0200
Message-ID: <87wn2o6iob.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <melissa.srw@gmail.com>,
 Marius Vlad <marius.vlad@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

> Hello,
>
> This series contains two trivial cleanups for the vkms driver.
>
> Patch #1 just gets rid of a wrapper helper that wasn't really adding that
> much value and patch #2 drops the <drm/drm_simple_kms_helper.h> header
> that was only used to call the drm_simple_encoder_init() function helper.
>
> Best regards,
> Javier
>
>
> Javier Martinez Canillas (2):
>   drm/vkms: Drop vkms_connector_destroy() wrapper
>   drm/vkms: Remove <drm/drm_simple_kms_helper.h> include
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

