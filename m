Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A59B9826ACC
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 10:35:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9602810E1C0;
	Mon,  8 Jan 2024 09:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDFD610E1BC
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 09:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704706536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8FqI91Plpg4t0tN2+40oiwSiAXoVjsNtxVtGTkjkFNk=;
 b=gS1kVwlA6GKErMRMpaP/Ki61MvKzMoUAICK++EBaaWBJ2rp47T8RDRJjUHUsuvUbRyOrv6
 5jjL/aDp4/A4K18P7zUDPw22/mlIBaqc2Kq8n5oSRdbBJ2DtwgE2Adg6IwCs469KvItej6
 1K3lO3YGIkRI0Zx/ZBjUh7IkfD8bHfg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-vgxveJ2ZMlGtPbZOlPCZzw-1; Mon, 08 Jan 2024 04:35:34 -0500
X-MC-Unique: vgxveJ2ZMlGtPbZOlPCZzw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40e49c3c124so1252425e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 01:35:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704706533; x=1705311333;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8FqI91Plpg4t0tN2+40oiwSiAXoVjsNtxVtGTkjkFNk=;
 b=liGS4/6XhTBhWn01Pf5EmmcS7LefV8iM7hLqk7a48YBqP4tzPhhKGddlbs7AVBoRXz
 tquDoVthnq8yAEmpJ4p9BJd/rwptGScqMcEY8L40AdSUBRCMGEZiHP0neB85tgw9RZQE
 6t+/La2EoCLxsfGkJs/qq0lYvZay7alk2GdA/KAhLSx/GNRuiYCdn906CyG89b4D9oDq
 ylTRDjqi6I1jv7GylgsPtP9VeouOYQRLhTJ92nXHD59R9u1Xbet1/DGFzzoF+Qo+6iYf
 KYJr+/oCzIBb9BcCiBhNBwaHKu8DOSqQmf20SZxYYO3jCG7ZQXNjy/JBZXZHGmFyWpsX
 TYew==
X-Gm-Message-State: AOJu0YzWSDUX8fFHPmeOVANVlbLaPwQ9911jsbAi5NcL+teeS9pn1qwb
 huBZki2N+r82PPK6gN400SNsZJrG1axfttlwlHipQrVg0LTLN95deuUs2lBIeMs6mH8LHHBdMTg
 1V41ALvhYOGUkBjstv/6889ckujULPUysfmb+
X-Received: by 2002:a05:600c:470a:b0:40d:8964:7eb4 with SMTP id
 v10-20020a05600c470a00b0040d89647eb4mr1648557wmo.35.1704706533648; 
 Mon, 08 Jan 2024 01:35:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9LrFAdz2c0oUKOXqiCz9V6sA9/SRyB+6xOvPQWIK9QOb6WfX0qmqi60bY3HX68Bx+qm7YvA==
X-Received: by 2002:a05:600c:470a:b0:40d:8964:7eb4 with SMTP id
 v10-20020a05600c470a00b0040d89647eb4mr1648548wmo.35.1704706533379; 
 Mon, 08 Jan 2024 01:35:33 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r14-20020a05600c35ce00b0040e48abec33sm1470139wmq.45.2024.01.08.01.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 01:35:33 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, drawat.floss@gmail.com,
 deller@gmx.de, decui@microsoft.com, wei.liu@kernel.org,
 haiyangz@microsoft.com, kys@microsoft.com, daniel@ffwll.ch,
 airlied@gmail.com
Subject: Re: [PATCH 3/4] firmware/sysfb: Clear screen_info state after
 consuming it
In-Reply-To: <20240103102640.31751-4-tzimmermann@suse.de>
References: <20240103102640.31751-1-tzimmermann@suse.de>
 <20240103102640.31751-4-tzimmermann@suse.de>
Date: Mon, 08 Jan 2024 10:35:32 +0100
Message-ID: <874jfodv6j.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> After consuming the global screen_info_state in sysfb_init(), the
> created platform device maintains the firmware framebuffer. Clear
> screen_info to avoid conflicting access. Subsequent kexec reboots
> now ignore the firmware framebuffer.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

