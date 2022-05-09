Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FE751FFEE
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 16:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB36910EB50;
	Mon,  9 May 2022 14:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76CF10EB50
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 14:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652107017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n4x1JmNs0lN7zeQuuaFUFxxo45axmawzrmuIq6d0Zls=;
 b=Y8GC2aE34nB9QMFbXvKJgzGbfSglK4HTXmetBWBQr7wLwPodTK37NZxGxcPMe53N0ShLiM
 7QhPrERXGIYg6ISCxTuWRlExOEDDKjUbCFITFDIt5E8iH5PdX6E/igyZj9cBQB8ga8jV74
 1zQOrbSOmdpbvv/GrhUMPayt3lJoI1w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-fHMljM3ZPGCzytz-6ePd4Q-1; Mon, 09 May 2022 10:36:57 -0400
X-MC-Unique: fHMljM3ZPGCzytz-6ePd4Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 g14-20020a1c4e0e000000b0039425ef54d6so3938930wmh.9
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 07:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n4x1JmNs0lN7zeQuuaFUFxxo45axmawzrmuIq6d0Zls=;
 b=BRio6dMtQC3WwuSg2PtOE+oJ1UYj4JHLIC6IYDeCUZs71ZdgXOB3H08gdP0aM5GMiL
 i1aJYyvhPtKequ+zf+hk8DZTfp8vC9vACBeQj1h7v3JU3rlFY2bJW1aW8y9YN7JXxF6u
 VS7AGGxkujC7H8+pZk7YgYVPOkoxUMtBDNWqRy1MiPer97YlqtIiwfjD+RBnfbS4Ml3o
 NvlEqsHiN3ngumHYO6COFFrFu5rt6btxzyxWfGaYRpKfZraZn2XlqSnzS3dc3SZ2loGA
 Q7z+4I3f90f44f3VCeY8BgK9BAtCTtndr51Fhvzt/iTi8KjXGCJ+tJcL3CiGv2PIbDTe
 skCA==
X-Gm-Message-State: AOAM531MA1pTa1Uu/FsWhqz3z9ZsLQS1xygs2pyC46WehGIoHh244oQH
 3Y3N1iH0YdrX/brq0cqHc72urcFFNpVNImbQUeM00n4lQr9XYccapRLOoyqgfWBlu5MwQzQHyp8
 GmcjF1BuS4bj+QDvxdbWBeTdS8qAz
X-Received: by 2002:a1c:cc08:0:b0:393:e7d2:e580 with SMTP id
 h8-20020a1ccc08000000b00393e7d2e580mr16812235wmb.145.1652107015561; 
 Mon, 09 May 2022 07:36:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGrLL/VVSw/WOa5yPynAZPNzHztUeFn+CzxclQK7K/jvA6IsiCIdA26rF3Brew3Axf9EMHww==
X-Received: by 2002:a1c:cc08:0:b0:393:e7d2:e580 with SMTP id
 h8-20020a1ccc08000000b00393e7d2e580mr16812218wmb.145.1652107015350; 
 Mon, 09 May 2022 07:36:55 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j14-20020adfe50e000000b0020c6a524fd5sm12998987wrm.99.2022.05.09.07.36.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 07:36:54 -0700 (PDT)
Message-ID: <d0c7f668-e7db-f835-b410-6a6af516ceed@redhat.com>
Date: Mon, 9 May 2022 16:36:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] Revert "fbdev: Make fb_release() return -ENODEV if
 fbdev was unregistered"
To: public@timruffing.de
References: <642f515e-aa71-7c90-a715-e49dcf12baee@redhat.com>
 <20220509140149.34734-1-public@timruffing.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220509140149.34734-1-public@timruffing.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Tim,

On 5/9/22 16:01, public@timruffing.de wrote:
> Thanks for this patch. Do you think this can be backported to LTS 5.17.y and

You are welcome.

> 5.15.y, which are still buggy? It's not a big deal for me but others might
> profit.
>
> Background:
> The patch solves a regression from 5.17.1 to 5.17.2 or 5.15.32 and
> 5.15.33 I was about to report. On my Thinkpad T570, I got random "BUG", "Oops"
> or even panics when during booting with efifb and plymouthd (and then sometimes
> also problems when shutting down because). I had bisected the issue to commit
> 27599aacbaef. I could provide more info but I don't think it's necessary given
> that either aafa025c76dcc7d1a8c8f0bdefcbe4eb480b2f6a or your better patch now
> fixes the issue (I tested both, both work for me).
>

The patches to fix the fbdev hot-unplug regression will get merged in mainline
soon and since all have a Fixes tag, they should get picked for stable as well.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

