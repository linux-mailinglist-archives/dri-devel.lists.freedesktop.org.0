Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3520D5700B8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 13:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E591611AABB;
	Mon, 11 Jul 2022 11:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343E110F10C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 11:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657539209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C+eRpdrxBgQt0p6K0v1wmxFNTfVvVH/tFOB6mgp15MI=;
 b=HroZbq1QyZqpHBInLeeg7Mwu8BJBfiTZdU8ZVCHrN61KTHzhflE6vFGWBEZNHNKzTMSGFm
 enDq3ZM9LIZx6yCBj+9h/8ixHXD58D9de3HqYMGIHP6sEueu7pa66tMXagYgTh0bxsN5nS
 KldMr+vOlk3H0QgH4TxtHGK/FNbl/YI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-PUbguGvMNyC3z5U4M2DCVw-1; Mon, 11 Jul 2022 07:33:28 -0400
X-MC-Unique: PUbguGvMNyC3z5U4M2DCVw-1
Received: by mail-wm1-f71.google.com with SMTP id
 h10-20020a1c210a000000b003a2cf5b5aaaso736727wmh.8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 04:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C+eRpdrxBgQt0p6K0v1wmxFNTfVvVH/tFOB6mgp15MI=;
 b=L6xRwa82e6QSWk0HaxiViPsY4lQrgzWxn+yChZzR/fOREEIppjB2otlu4a3Ju7EIYw
 D7jrmbldEq8oU1SYu5/dlQGtp7+wWDR2qm7gDUtBnLIGgPP3eCvMgBKEiJkg7G9QDSru
 GxVTZKOylzdTHns4ON/fOC7ccM9+Urs425BQ0G6L67Hasg8TIfNZygfGYSE8kUYDS057
 Svtt3MlbrfYJFoehphdYwtjc6p7gFywlGbJXZH0l8d6uQHgO7/c1iM6aeFjYyA0/Uks3
 4fv2FKnJBkpQvj4MmbpMCRzWw8zL+xxsDJsOV6h5Doi18Eu/jP2K9BlBopWVCdo19AXx
 OVAg==
X-Gm-Message-State: AJIora8cQeDKGk4DFdMNvPydzIE0lIwzrEe3dSrnxMgfIvyQ2ovlbkO8
 8YkYGq0mgf8ZqloXheL5ztreEj5ulo4xgW7uLJqa/E4q0qUyZKAwqxAh5CGIaPZmAEFnrtC9C6S
 Xfc0Iwsd2igwyqeBrysSHAQX6zPB5
X-Received: by 2002:a05:6000:1846:b0:21d:90e9:eb38 with SMTP id
 c6-20020a056000184600b0021d90e9eb38mr15874531wri.264.1657539206839; 
 Mon, 11 Jul 2022 04:33:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ukVj1igcMMa9SefXsYyz4JKT4jyMTF7lkAOL7ByBHf0PskNwLBAgeRnDAzuL41/lTsk2X9tQ==
X-Received: by 2002:a05:6000:1846:b0:21d:90e9:eb38 with SMTP id
 c6-20020a056000184600b0021d90e9eb38mr15874520wri.264.1657539206675; 
 Mon, 11 Jul 2022 04:33:26 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q6-20020a1cf306000000b003a033177655sm9811923wmq.29.2022.07.11.04.33.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 04:33:26 -0700 (PDT)
Message-ID: <93fd9fd9-eb43-49b2-4322-95952626895b@redhat.com>
Date: Mon, 11 Jul 2022 13:33:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 11/11] fbdev: Remove conflict-handling code
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, maxime@cerno.tech
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-12-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220707153952.32264-12-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/7/22 17:39, Thomas Zimmermann wrote:
> Remove the call to do_remove_conflicting_framebuffers() from the
> framebuffer registration. Aperture helpers take care of removing
> conflicting devices. With all ownership information stored in the
> aperture datastrcutures, remove remove_conflicting_framebuffers()

data structures.

> entirely.
> 
> This change also rectifies DRM generic-framebuffer registration, which
> tried to unregister conflicting framebuffers, even though it's entirely
> build on top of DRM.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Amazing patch! The whole series really. Thanks a lot for working on this.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

