Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F97518889
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 17:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0696A112086;
	Tue,  3 May 2022 15:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A184F112086
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 15:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651591694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j50Hj8tQeVhAw3UmlHVgCe3j3gT0Gu2X85okQiDa4t8=;
 b=fs8v9yTn2uZSkcbgWigtZL2Z6xXU/ZgOD5GXjisdnpYLPx/nrEBh9B5yHGXtPJu+e9KKMz
 2/+vnslUIb3tq4d7kznTB+XZAQXNOY/l+slv/313o4E41I3CuvKHfUW5yCxA+xazJ/FoXq
 fdTXFcNs+kgSn2ePencH4lUdReAEwyk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-Bv3t-KkDNtCUCFy_QfNsKg-1; Tue, 03 May 2022 11:28:12 -0400
X-MC-Unique: Bv3t-KkDNtCUCFy_QfNsKg-1
Received: by mail-wm1-f72.google.com with SMTP id
 r186-20020a1c44c3000000b00393f52ed5ceso1503904wma.7
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 08:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j50Hj8tQeVhAw3UmlHVgCe3j3gT0Gu2X85okQiDa4t8=;
 b=LsT1XALhFKg9sSZ1ManKuzlPsYFvbKD/hWYopQRPghiNnV/OAwwdrdx0Hnek6p9RbK
 0TTTb1mi04PAqTmD40BY0Wgp2aCrvWgGNRbbVvWikvuqk1zU8ivVXVOB3cV5ne9Id91k
 AkmvdU+QDetcnDuhWM3D575G5N9Lj90w2e8GiRDv1Z28ghEYD+0uzpxXb/A3U4AyFQL/
 e6yJb012udtcCBIfZs0b0zdYohxn51LKrIIC5YuFzQ7tVjT2Hh72TAzgHRjjWSJVg+zw
 Sy1KwNgqdxYkBEDE657oVwWNdCcJI06tZMD6gWbnMoTsa0uDBOFYiRo2YKT8dg5+PWfb
 iFQw==
X-Gm-Message-State: AOAM532JonOccGtgptTHtakK2Lb6btdFz8wiXm1fvx8x1YqbG+qQsVCv
 W3Ab+Joi4+RawDI/j+m7XecA6TyZBn0PSx7tVjtDVRci0dIbllQjvMkZpQgqVpKqrTnAs3guPCf
 k/7uHbazSEckeuY8rLjRrTVw446UR
X-Received: by 2002:a05:600c:3c8d:b0:38e:4bc6:abde with SMTP id
 bg13-20020a05600c3c8d00b0038e4bc6abdemr3770016wmb.13.1651591691251; 
 Tue, 03 May 2022 08:28:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8aKnCRfGAhf0ml55t4COEjHHc51OmLWEBcp/UoDfVA5aOjYQU7dHI4VJyeVwkP7P18G5xAA==
X-Received: by 2002:a05:600c:3c8d:b0:38e:4bc6:abde with SMTP id
 bg13-20020a05600c3c8d00b0038e4bc6abdemr3769995wmb.13.1651591690935; 
 Tue, 03 May 2022 08:28:10 -0700 (PDT)
Received: from [10.201.33.11] ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id
 u21-20020adfa195000000b0020c5253d8c4sm9568792wru.16.2022.05.03.08.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 08:28:10 -0700 (PDT)
Message-ID: <e3ce080c-8ef8-f838-d4a8-b10cd5d5c172@redhat.com>
Date: Tue, 3 May 2022 17:28:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] fbdev: Make fb_release() return -ENODEV if fbdev was
 unregistered
To: linux-kernel@vger.kernel.org
References: <20220502135014.377945-1-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220502135014.377945-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Zhouyi Zhou <zhouzhouyi@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Junxiao Chang <junxiao.chang@intel.com>, Helge Deller <deller@gmx.de>,
 Zheyu Ma <zheyuma97@gmail.com>, Changcheng Deng <deng.changcheng@zte.com.cn>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>, Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/2/22 15:50, Javier Martinez Canillas wrote:
> A reference to the framebuffer device struct fb_info is stored in the file
> private data, but this reference could no longer be valid and must not be
> accessed directly. Instead, the file_fb_info() accessor function must be
> used since it does sanity checking to make sure that the fb_info is valid.
> 
> This can happen for example if the registered framebuffer device is for a
> driver that just uses a framebuffer provided by the system firmware. In
> that case, the fbdev core would unregister the framebuffer device when a
> real video driver is probed and ask to remove conflicting framebuffers.
> 
> The bug has been present for a long time but commit 27599aacbaef ("fbdev:
> Hot-unplug firmware fb devices on forced removal") unmasked it since the
> fbdev core started unregistering the framebuffers' devices associated.
> 
> Fixes: 27599aacbaef ("fbdev: Hot-unplug firmware fb devices on forced removal")
> Reported-by: Maxime Ripard <maxime@cerno.tech>
> Reported-by: Junxiao Chang <junxiao.chang@intel.com>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
Applied to drm-misc (drm-misc-fixes).

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

