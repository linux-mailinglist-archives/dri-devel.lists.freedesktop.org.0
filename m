Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C39E651D91
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 10:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB1D10E35D;
	Tue, 20 Dec 2022 09:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3467C10E35D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 09:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671529059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4bHxLfE6qRmbmJ9vfsWvWUlnwpkYhHXJKMmhBNnZCVw=;
 b=P9LpXFjn4FCJw5KQ0DNRgGszhCp+iwzssYmeMbWYVl95uLwnpgkHvbrMSRAHPoZJzpP7Yv
 3uPSP6dKOhc2a1c4pOGFGdHGzLWc2ioKqMH8l1vD1DBegNah4zMWYCt0UqPG+4InDyW9tC
 eIVoAAiBTvLaMLHIRgpGV81Ufd51dU8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-5DSTbqcwN-y-qeO320OXCQ-1; Tue, 20 Dec 2022 04:37:36 -0500
X-MC-Unique: 5DSTbqcwN-y-qeO320OXCQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 21-20020a05600c021500b003d227b209e1so2407384wmi.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 01:37:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4bHxLfE6qRmbmJ9vfsWvWUlnwpkYhHXJKMmhBNnZCVw=;
 b=2NqXZ1ce5f7WJ3sRCsRafxjBXqrZXZ82q1CchJi3ps0zS+H66PG2+ETw5H7duTc6ZG
 Bl1ylW/8aOUyhxKsSXaUXODT9Or2uUFskb064eaO+w41H3kZ9IAfOeqagQLGHKj6dDcF
 9g4wWdirnjr+IzPM90MLz4yQD5fhmniUymOZmpQq3NEBMv+xFSMuUpZ9iS1NfWJOGeA8
 vM6WI1BpbbXJSsULNCQFY2YNPOkeSLSiirwUt7DnZp+gV+RhdYwPnYApum3yeFQ4QPWW
 J0phFppe97SJ1kkm8gC5jh0qUCgbGrioD2p1PGP2I+1nVhlWzEoB8KMSlOZQU9DFlML5
 VGcQ==
X-Gm-Message-State: ANoB5pln25euudkmicjrmOAhpIzccrH/atpMs3UIazg7rcOAZJ5Q+xKW
 Gh9r61+IRR834lNP8WeULDW/oLQznOPsAktKbro/cDyMHRyVa6OqxdRYD7LDXyXSmwC+Em67znh
 uOmKi79b7JNRFcMbS7e96oXvYcpIi
X-Received: by 2002:a5d:6f11:0:b0:242:70f0:9196 with SMTP id
 ay17-20020a5d6f11000000b0024270f09196mr33065568wrb.45.1671529055091; 
 Tue, 20 Dec 2022 01:37:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5A94U6u6cGzamMmT1GgT+wuXQtFEvsTtiTSWk5LQnUafJiCwGKhccUzi3oD1XqGmcmR4z97A==
X-Received: by 2002:a5d:6f11:0:b0:242:70f0:9196 with SMTP id
 ay17-20020a5d6f11000000b0024270f09196mr33065558wrb.45.1671529054902; 
 Tue, 20 Dec 2022 01:37:34 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 az17-20020adfe191000000b00241bd7a7165sm12231930wrb.82.2022.12.20.01.37.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 01:37:34 -0800 (PST)
Message-ID: <6a6e3bfb-d320-8ccf-f047-55999552c8fc@redhat.com>
Date: Tue, 20 Dec 2022 10:37:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 12/18] fbdev/offb: Allocate struct offb_par with
 framebuffer_alloc()
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de
References: <20221219160516.23436-1-tzimmermann@suse.de>
 <20221219160516.23436-13-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221219160516.23436-13-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/19/22 17:05, Thomas Zimmermann wrote:
> Move the palette array into struct offb_par and allocate both via
> framebuffer_alloc(), as intended by fbdev. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

