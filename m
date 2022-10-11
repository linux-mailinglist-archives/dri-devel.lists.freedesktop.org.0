Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 809D25FB2E9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 15:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47ED110E3EA;
	Tue, 11 Oct 2022 13:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40D210E33F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 13:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665493807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=thvlIsm/fxiw86jRXsCCSqqflOvpvNicCGXfc4rTb2E=;
 b=F+IpjosCvKUdwibYfziWRNBk42LLDk6KY75ngvmLrB/ucaXn0FzsmSEZYxoLbBSz9SpWfe
 LZby5UpMghyAjZR4ZKjQRda92Tm2dIU52d9lgwShXxy9dzQsg+XNJcItdRIzNDN4UUTUyU
 4CKIQk8O0qzfyt3EY869nfrmjRN5k74=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-333-FSvAVjAOP_SSRcLtyAEf5Q-1; Tue, 11 Oct 2022 09:10:03 -0400
X-MC-Unique: FSvAVjAOP_SSRcLtyAEf5Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 2-20020a05600c268200b003c4290989e1so2193622wmt.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 06:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=thvlIsm/fxiw86jRXsCCSqqflOvpvNicCGXfc4rTb2E=;
 b=4kXjYVMtkcz8ADEwDF5TMViFty2fFjownEvkfYhi23Wa0I323mbsx5lzIXuiu97Bks
 JlitzOZmBwMBkR/IUeNeNJZnK0ZFamqY5vGJOgcCgf7MrVgROstypUd1+CUKQ/RqSgxo
 ltIWnuN4TvukVtcgHd9ivqKT1fHmk2nnlMlgCI5TeKREv7aO2CsQr21MljYr9zcqu+a7
 ys/QHJiK3cpsxBDopEAbW8pV/UCaK1CIOEC/dcLVhPMSnsmhHspJMLBjZPDEFqjIqmJI
 waqwvF5YipCIZuB6/S5lDtew1YNLaGGA9tEt++3tn5x8av8J8Mtu7eB8YEqtIGKb6MlX
 oL+Q==
X-Gm-Message-State: ACrzQf2ulmPZv3wi1xyyTFuQ7HPnx9gY3nJvdOgC4JN8kT/F/b08mx0J
 fIi6k9x4YsAsq8v7euRDAHNw7Xbb/pE//aY+H8n7mfIKlbGkAGMVq/g+S/zTUrqe0fiAuP/Vnkl
 oI04/eD5J9Zu0/ZVU+F9MZxkuM2NK
X-Received: by 2002:a7b:cd14:0:b0:3c6:bf44:770d with SMTP id
 f20-20020a7bcd14000000b003c6bf44770dmr5254546wmj.35.1665493802684; 
 Tue, 11 Oct 2022 06:10:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5gcbU6PwwqP+FAMtJeHKur4l1vlHgqnaIB/vm2BBuL/XqcMa7ClWWTIgdYKUf/nQrS9V/52w==
X-Received: by 2002:a7b:cd14:0:b0:3c6:bf44:770d with SMTP id
 f20-20020a7bcd14000000b003c6bf44770dmr5254528wmj.35.1665493802432; 
 Tue, 11 Oct 2022 06:10:02 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bj4-20020a0560001e0400b0022e0580b7a9sm4302671wrb.17.2022.10.11.06.10.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 06:10:01 -0700 (PDT)
Message-ID: <e3e0b130-03b9-0fcc-a42c-2bd7b035c7e4@redhat.com>
Date: Tue, 11 Oct 2022 15:09:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/3] drm/simpledrm: Do not call
 drm_atomic_add_affected_planes()
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20221010170203.274949-1-javierm@redhat.com>
 <20221010170203.274949-2-javierm@redhat.com>
 <fc9a8b09-4b41-291e-d235-bb71eeb95f3c@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <fc9a8b09-4b41-291e-d235-bb71eeb95f3c@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 10/11/22 15:06, Thomas Zimmermann wrote:
> Hi
> 
> Am 10.10.22 um 19:02 schrieb Javier Martinez Canillas:
>> There's no need to add planes to the atomic state. Remove the call
>> to drm_atomic_add_affected_planes() from simpledrm.
>>
>> On full modesets, the DRM helpers already add a CRTC's planes to the
>> atomic state; see drm_atomic_helper_check_modeset(). There's no reason
>> to call drm_atomic_add_affected_planes() unconditionally in the CRTC's
>> atomic_check() in simpledrm. It's also too late, as the atomic_check()
>> of the added planes will not be called before the commit.
>>
>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>

Thanks.
 
> There's also drm_atomic_add_affected_planes() in mgag200. Since you're 
> at it, I'd appreciate a patch.
>

Sure, I'll include in v2. I noticed that but didn't feel like posting
a patch because I'm not familiar with that device nor have HW to test.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

