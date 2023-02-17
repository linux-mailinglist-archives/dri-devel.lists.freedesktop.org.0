Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FF069A743
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 09:45:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C0010EF26;
	Fri, 17 Feb 2023 08:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0121B10EF4D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 08:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676623508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OWPvyQo5Di8DnoAQZc3ZeTCHhUwyb2tH6aRDiwDRUPc=;
 b=d3yjfmsfxeaJjCzIVuAVh8ucPyosf80C8ecBSHjEGkVU8/feH2pVYuMqAfsMp28dQqCWaw
 SIgz2KHNMykxddBxAHM5HdudVldGmibbiQMl4vEOeSKHFgjL20ecAhHWmTkH744uWxQpNW
 xYK1gnbBh1/Ps4wbKLX/JBQYbIVYiug=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-IWh9-dLiOhOMkHZuGcqy7w-1; Fri, 17 Feb 2023 03:45:07 -0500
X-MC-Unique: IWh9-dLiOhOMkHZuGcqy7w-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay20-20020a05600c1e1400b003e1f2de4b2bso375828wmb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 00:45:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OWPvyQo5Di8DnoAQZc3ZeTCHhUwyb2tH6aRDiwDRUPc=;
 b=00Wfd2UTKh/fOfIi3MHr1oFT/NcjKXVgY1B5f5oPg9WrGkNmwAnyCnpbfsfZDExH55
 1xlPG+bwBnetSJaKDMDeOBJ26UcR3yJ5z9sOFNj+5yQ4m3nY35XdtlOtphnadwqujgyX
 9Ypn3M1EX81Z/MHa7FZY4B6zfm2uqjpjmAQ7Y8bNHsW8PtsNZ2QJCfDE0v5RxKN4P9Z9
 mcwef8vYmgK/lUF3JHvwhQ9PiIN8NEAGltSs29Nv9F+BJqq35hyXAY47kCX6owp5kaED
 7a5L0SIE+dFPt5y7gDyCqjHMFlxvKNhoNrBHcOC/gienxLDCNAJ5ZkMIcLVEtV932d+z
 nxeA==
X-Gm-Message-State: AO0yUKWDuCmkVC/K2YOs/eTdFRrnkbVYqzL/bSzyDF+JNHDLIcgE0PKW
 Wzcc+AxKTDwRb+VJft0JebLjKTyCVG53WsayhDCtm7TNWRaOPuQhzngzdexEQTB+j5fsWeOI/RE
 zS3eohTa1Nva8QrxRTTnSsxgkmj1S
X-Received: by 2002:adf:f78c:0:b0:2c5:48b9:72ff with SMTP id
 q12-20020adff78c000000b002c548b972ffmr6450619wrp.27.1676623506496; 
 Fri, 17 Feb 2023 00:45:06 -0800 (PST)
X-Google-Smtp-Source: AK7set+ur2aLbFCoXfxBM8gyiXnFXtYx7YTDiuItlpgrcu7ssIQYB1jqId9yQOYwAKFhH5jVOwxbag==
X-Received: by 2002:adf:f78c:0:b0:2c5:48b9:72ff with SMTP id
 q12-20020adff78c000000b002c548b972ffmr6450601wrp.27.1676623506241; 
 Fri, 17 Feb 2023 00:45:06 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v6-20020adfedc6000000b002c5544b3a69sm3552710wro.89.2023.02.17.00.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 00:45:05 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 03/11] fbdev: Support NULL for name in option-string lookup
In-Reply-To: <20230209135509.7786-4-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-4-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 09:45:05 +0100
Message-ID: <874jrky92m.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Ignore the per-driver video options if no driver name has been
> specified to fb_get_option(). Return the global options in this
> case.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

I think you need to update the kernel-doc as well to mention that
@name could be NULL ?

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

