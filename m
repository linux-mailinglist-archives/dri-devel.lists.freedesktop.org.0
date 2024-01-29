Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E31A2840489
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 13:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94AB110F041;
	Mon, 29 Jan 2024 12:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51AB10F041
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 12:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706529799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bYShEolk94igkROb5mUh7N+Ee2KYt4Kx5nTD8/LiOIw=;
 b=B1DTLtLjC202ppEIaj49NsPvumS8Zx3jWdewMrFSEn8OWcQ/rcUEI/GLfOa6+mBUXpXHfm
 hSBiHZp5Z/g3EtKv4X1sZpXfe04w2XHKAasLEW8ZNThPLcXZKMetIq7OLpgjxlPIb1qmSk
 tBEjyObu4BtV8JAJroerF8/dKmBrOOc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-aLTTzwCZM-etydQc1jAINQ-1; Mon, 29 Jan 2024 07:03:18 -0500
X-MC-Unique: aLTTzwCZM-etydQc1jAINQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40ef9f4ef41so2961375e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 04:03:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706529797; x=1707134597;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bYShEolk94igkROb5mUh7N+Ee2KYt4Kx5nTD8/LiOIw=;
 b=DRks0TyMs4XGmn5UUYorfKr5CRBPx8y1fVn/eec6wpMzCMgtkPveeECJxyIpjIrXez
 G822VdsrO6zyWgD/i3bwxO2tV2j9Qu68Gcua93m/TZAv8yz82rmHgk1ETqcnJzfQhDz7
 XNSjaPmQ04/MTsCZ91yYp3IUkAn+cIj2XMNUrYmXSy2OV5drzN/DlNPECABtWA3LPDU6
 Vc2kaGqkt/ahCzpa+dp2dBZkWss77LvWkT5eoCzauIXeL8srU+W0IkhX24vGBgb34tfE
 CkqkWTaT1znLkyIY8BdoBswGrxf4MjHay2T85S0bvOxUyE/x55/D2QWYHBFp8tYF7IhH
 Bt+Q==
X-Gm-Message-State: AOJu0YzbRHXwAkDoZKAeO6m7rrxrK5+gzpIx4BpmZQB1awZzjGx1u07s
 i1UQDus3I421GsR/diCl9v+CO5WFs4ZZVL8NgbK6pSk6IdepoIY5EX6AE80LYdTiFJSWuObbdPi
 4mZrkberSZLRlhMLtPcYkoJd5Yj9/mg1pC9PgHHaPmmPaEMmmq4VJ/BUC1EKhr7x1bA==
X-Received: by 2002:a05:600c:a082:b0:40e:e4a0:540d with SMTP id
 jh2-20020a05600ca08200b0040ee4a0540dmr5017808wmb.36.1706529797371; 
 Mon, 29 Jan 2024 04:03:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8RY/iib+itekAvsHvhfv+zPnjQBL0cSACylF/MdWpnV56rS9jUyme+8q8/EQp236KgXVzCw==
X-Received: by 2002:a05:600c:a082:b0:40e:e4a0:540d with SMTP id
 jh2-20020a05600ca08200b0040ee4a0540dmr5017782wmb.36.1706529796973; 
 Mon, 29 Jan 2024 04:03:16 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 gw6-20020a05600c850600b0040e813f1f31sm9971683wmb.25.2024.01.29.04.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 04:03:16 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, pjones@redhat.com,
 deller@gmx.de, ardb@kernel.org
Subject: Re: [PATCH 7/8] firmware/sysfb: Update screen_info for relocated
 EFI framebuffers
In-Reply-To: <87fryguzjy.fsf@minerva.mail-host-address-is-not-set>
References: <20240117125527.23324-1-tzimmermann@suse.de>
 <20240117125527.23324-8-tzimmermann@suse.de>
 <87fryguzjy.fsf@minerva.mail-host-address-is-not-set>
Date: Mon, 29 Jan 2024 13:03:15 +0100
Message-ID: <875xzc73ek.fsf@minerva.mail-host-address-is-not-set>
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

Javier Martinez Canillas <javierm@redhat.com> writes:

> Thomas Zimmermann <tzimmermann@suse.de> writes:
>
>> On ARM PCI systems, the PCI hierarchy might be reconfigured during
>> boot and the firmware framebuffer might move as a result of that.
>> The values in screen_info will then be invalid.
>>
>> Work around this problem by tracking the framebuffer's initial
>> location before it get relocated; then fix the screen_info state
>> between reloaction and creating the firmware framebuffer's device.
>>
>> This functionality has been lifted from efifb. See the commit message
>> of commit 55d728a40d36 ("efi/fb: Avoid reconfiguration of BAR that
>> covers the framebuffer") for more information.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>
> [...]
>
>>  #if defined(CONFIG_PCI)
>
> Shouldn't this be && !defined(CONFIG_X86) ? Or maybe &&
> defined(CONFIG_ARM64), although I don't know if the same
> also applies to other EFI platforms (e.g: CONFIG_RISCV).
>

Answering my own question, the !defined(CONFIG_X86) was dropped in the commit
dcf8f5ce3165 ("drivers/fbdev/efifb: Allow BAR to be moved instead of claiming
it"). The rationale is explained in that commit message:

    While this is less likely to occur on x86, given that the firmware's
    PCI resource allocation is more likely to be preserved, this is a
    worthwhile sanity check to have in place, and so let's remove the
    preprocessor conditional that makes it !X86 only.

So it is OK to just guard with #if defined(CONFIG_PCI).

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

