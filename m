Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F07F4D131E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 10:13:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5947810EC21;
	Tue,  8 Mar 2022 09:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52AD10EC21
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 09:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646730829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zlzDZFRzgx9xVyZXX5HJhFOJlKtod0cn2NQcAWeFY8k=;
 b=YWzd6kTXZvfCBjF87N5Gwfhc2gZJ7mSnTRs156wNuQy4Gfp+pJdzTpao0V7kAujn8dZjrk
 wQMzUNt4hftNFkh4GvJN/Nhetw29Qcyz2gwg/0NTqbfgk/YYNQDieb/dBUZGWE6TPuv36Q
 nT+0cySnyQZb+U3CI2/0H7Y8fPPneNk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-PBV6S208MCu1gdCuzkk2tQ-1; Tue, 08 Mar 2022 04:13:48 -0500
X-MC-Unique: PBV6S208MCu1gdCuzkk2tQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 i83-20020a1c3b56000000b00389a203e5adso1668079wma.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 01:13:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zlzDZFRzgx9xVyZXX5HJhFOJlKtod0cn2NQcAWeFY8k=;
 b=FaAnJ7VP9+hDSsBoKkdaUIaeYsjZDkEjpYQoab4C7eru0Gb5C5j6g4gBV8JmJaxoHV
 4J5NTUz5xYZJy4WrdAiFc0alSHk7lW3Wf7RNKKRPQw+r594SiuwC5mUgMuzWwM5WIQAT
 HKgd5s5fQaTftTdsMCdumayFanzOgyXiZjGnsUILO8W84PaKk8bxMvlYOyFMrKrbFjRk
 VgpAOJrOQCsswGNy7WFVnr0ePPfoz9PWy5e/2vSk9lq+0xsvkdhXBezgadN9GxiwhxWt
 XO/BUTqV4gusQNkGJqk5rzAPL566MP7KWN/xY1pqB67BKKvp1oAWteN/OBkSnwbZO/rL
 GOOA==
X-Gm-Message-State: AOAM5320njDYaj4GzAUfo+JmFd2n/DhE9RxmJxrcqTDQpP/Frxho1J1d
 CmO+vJJQmxXayC1br/R4bN1l37VzNS8ko+Eb2wQJa+6CgZ33kglQ68b3acL3KhG8OqOik1/6c1M
 XW7Q00nmU0qn2sfjaRsHLWh6OFqxm
X-Received: by 2002:adf:d238:0:b0:1f0:6105:520a with SMTP id
 k24-20020adfd238000000b001f06105520amr11116406wrh.531.1646730826134; 
 Tue, 08 Mar 2022 01:13:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKmkKxbfIdrIWp45PAltn78uV3fLKVuKMdJnj7tC85n4cuoVSGoh1IyCePxKQaBsiWu+Zm5A==
X-Received: by 2002:adf:d238:0:b0:1f0:6105:520a with SMTP id
 k24-20020adfd238000000b001f06105520amr11116389wrh.531.1646730825812; 
 Tue, 08 Mar 2022 01:13:45 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a1c7503000000b0038100e2a1adsm1554517wmc.47.2022.03.08.01.13.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 01:13:45 -0800 (PST)
Message-ID: <9ccf6f00-6611-7bbb-0ea8-ccf4f0a2920f@redhat.com>
Date: Tue, 8 Mar 2022 10:13:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/9] drm: Support GEM SHMEM fbdev without shadow FB
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 deller@gmx.de
References: <20220303205839.28484-1-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220303205839.28484-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 3/3/22 21:58, Thomas Zimmermann wrote:
> Rework the fbdev deferred-I/O to not interfere with fields of struct
> page. Make the code more flexible and implement GEM SHMEM mmap on top
> of it.
> 
> This patchset removes the need for a special shadow framebuffer for
> fbdev mmap when using GEM SHMEM. SHMEM pages are now mmap'ed from
> /dev/fb directly.
>

Interesting. I wonder if you have any performance improvements after
dropping the shadow buffer.

> Patches 2 and 3 rework the fbdev deferred I/O code. It now allows
> drivers to have better control of the mmap operations. All references
> to fields in struct page are gone. The rsp state is help in a 
> separate pageref structure.
>

That's a very nice cleanup. This really was a huge layering violation.
 
> Patches 4 to 7 provide callbacks an helpers to implement deferred I/O
> with DRM drivers. Specifically, patch 6 introduces a callback to create
> a dumb buffer for fbdev. This will be useful for many drivers that
> currently cannot use generic fbdev emulation because of special placement
> needs of the BO, such as amdgpu or radeon. The drivers can handle the
> differences to regular dumb buffers in their new callback implementation.
> 
> Patch 8 extends the GEM SHMEM memory manager with a new helper for fbdev
> dumb-buffer creation. The returned BO has it's mmap set up to implement
> deferred I/O with SHMEM pages. No additional shadow buffer is requires
> any longer. Many drivers can immediatelly benefit from this change.
> 
> Patch 9 extends virtgpu to support fbdev dumb buffers. It's build on
> top of GEM SHMEM, but has some modifications that need to be implemented
> for fbdev as well.
> 
> There's no immediate fbdev performance improvement from this patchset.
> Most of all, it removes unnecessary shadow framebuffers and rsp memcpys.
> A shadow fb for a FullHD display is ~8 MiB, which we now save. The patches
> do reduce latency between drawing to the fbdev buffer to displaying
> on the screen. Watching a video on the fbdev console felt smoother and
> had less flickering.
>

Awesome. And you also answered here the question I had above.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

