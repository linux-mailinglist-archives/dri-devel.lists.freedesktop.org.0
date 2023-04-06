Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3F16D923D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 11:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC6F310EB40;
	Thu,  6 Apr 2023 09:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C214810EB3F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 09:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680771947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2ykhPQtv509Jd5lq9iZLBJbGhGg0HZUUvY7XmspuQb0=;
 b=RqKO6mAXh8hymYRmk2JNy/UsAppzzPA//MphVr+C4vRUo4ml4O4bjDDPrXE1ki7Dr19SWX
 buFCL3FLNZU3McJVZRbc0B2ky6q/psV0cLs+r99tnCPu8XeGQb6K2AjSlYDE83ti8Z6kw7
 ylztjLykXMOzhIB2TalD7HwGosPjMOU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-Y_61IOySMU6WSamlh8m1Qw-1; Thu, 06 Apr 2023 05:05:46 -0400
X-MC-Unique: Y_61IOySMU6WSamlh8m1Qw-1
Received: by mail-wr1-f71.google.com with SMTP id
 m4-20020adfa3c4000000b002e75158e632so2113015wrb.17
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 02:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680771945;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2ykhPQtv509Jd5lq9iZLBJbGhGg0HZUUvY7XmspuQb0=;
 b=gKCOXYac/34kRxcQYw8aHRyxA4jvHfmw1pk/ad+BKV1oBQ5fLQHaDoKBmdibxmnWzk
 vU1ZfOQxMug7MRJTNDCPKXRyfTr8yjqdt279OA1RKubCipUpsd5/NcPn7ODisTO5qqBU
 My8pye1G+v/ZiFB9ELw48JvVkgzEtElZqNTzrxJlG2rcLh+z7STkmCOGzCmBmtzVWrpq
 Vv01ofINRvpByHcVGCDaGoNKasKhMkiFafN92hW7xloEA1izjgffgEWjsOyVC38TzNJz
 vkij7cvf0mpqeyNIb3o19yXVMG4IPSXd0/oRUeRRE+9yVaWD4AHg5LNG/hNLznjywGnR
 OQCw==
X-Gm-Message-State: AAQBX9e+0l/Fu42uOuY1SniwEOk7ES10sq03/t31PAFXSoQ/3oIJ+xNu
 zuoosHoYQcDQo8Hao8sZYb+SpBTZrtodSFKCcZRd2PpD6A4S2SsOQQjy0feJCR8YAv8wElsakft
 1+J5ZDWZIDHXszDFQNyCnnH6pnjd7g6mtB4ID
X-Received: by 2002:a05:600c:2183:b0:3f0:3d45:9aec with SMTP id
 e3-20020a05600c218300b003f03d459aecmr6518421wme.4.1680771945724; 
 Thu, 06 Apr 2023 02:05:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZrvGmFgJCSlceaf+ANiMJN21tX2PikZ0ugl5e+iKVyQwx4n6bhGi4e4RDjBd8NE1G43zH8AA==
X-Received: by 2002:a05:600c:2183:b0:3f0:3d45:9aec with SMTP id
 e3-20020a05600c218300b003f03d459aecmr6518405wme.4.1680771945447; 
 Thu, 06 Apr 2023 02:05:45 -0700 (PDT)
Received: from localhost ([84.78.248.32]) by smtp.gmail.com with ESMTPSA id
 q31-20020a05600c331f00b003ee610d1ce9sm4621096wmp.34.2023.04.06.02.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 02:05:45 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/8] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
In-Reply-To: <f5f9fe8e-9df2-e201-b7f3-be717fa4bdb8@suse.de>
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <66f9196e-df2b-19ce-e2ec-15f7a81d63c7@suse.de>
 <87ttxt8kxr.fsf@minerva.mail-host-address-is-not-set>
 <f5f9fe8e-9df2-e201-b7f3-be717fa4bdb8@suse.de>
Date: Thu, 06 Apr 2023 11:05:44 +0200
Message-ID: <87jzyp8jo7.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

[...]

>>> +EXPORT_SYMBOL(__aperture_remove_legacy_vga_devices);
>> 
>> I would just call this symbol aperture_remove_legacy_vga_devices() as
>> mentioned, the fact that aperture_remove_conflicting_pci_devices() use it
>> internally is an implementation detail IMO. But it's an exported symbol so
>> the naming should be consistent.
>
> That prefix __ is supposed to indicate that it's not a all-in-one 
> solution. Most of all, it doesn't do sysfb_disable(). The helper is 
> meant to be used as part of a larger function. I tried to outline this 
> in the comment, where I say that drivers should first aquire framebuffer 
> ownership and then call this helper. If naming isn't a showstopper, I'd 
> like to keep the underscores.
>

Sure, I see that we have other symbols exported in DRM that have a __
prefix in their name. So maybe I am the one who was confused on the
meaning of it.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

