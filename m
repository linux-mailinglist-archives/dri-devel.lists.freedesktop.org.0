Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DB23D6789
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 21:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1988C6EC07;
	Mon, 26 Jul 2021 19:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187DB6EC07
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 19:35:21 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id c16so2546616wrp.13
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 12:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=op7xO4EU54mwd/b+ed3FAvXclVjdfq5hrae9dtZ7NeY=;
 b=KtkilO0zYT+y7KGCKkHHirTcHxiBKzHDSBwmoQo4cBPVCeTo3SMyq7SvgZYAMvfa7m
 QQEtHyeaWToYHQpVtnBQn098SlipsMxJ/H8T0tmhb8u4AONA9vZApB/pRgCrj1JF0FYs
 7/oQEI1az3N1CCpItpgEyIomt8UrbH4fhFTaC2wE7RtKLDcrZpCgL/nQlTNhLBPPwn8F
 LUI1Veakiy6RDR6zGDZuNes8HNAXOxrLhkyvxU+d8JMpfirP3NxYlYl3IILeeQw3yVCT
 3D3ptOcew94Ga07mN2KrgtQ32e+2tY3eCiC+aNtwcO5HqWN313YYMu4iLaEdUFSZnZ9S
 F9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=op7xO4EU54mwd/b+ed3FAvXclVjdfq5hrae9dtZ7NeY=;
 b=AzHyATATzrta8gtndXLNn7E9N/29O39HwTqKibm4lpbEhCado608V77Q9LQyfpE6fY
 LfMOwSsF23ErsCcSlNM5zZ4m9xGB9DRzXGA2kuEcIGHXbku0dOOps+kJKo6oAZ+w2038
 ixMKkBydeMCu6C+1u0HBVPaZXmh3UKM0WpjyFSm3OSDFKsTkKyEl3m0yicfe6onud6Wu
 P4mzw0NSc4T2xsyLnYs2/5I6OqwKMRzr2Jm6FMAGLVHnTX9ahYzNiIpPD2G55pg/DY9D
 JwpM8oT69uED67XKAeCdqQ0/dpQRTejFH3zV1yCRlZYte1Eb+twCNQ+dlr+RhNbXwE4L
 JY1Q==
X-Gm-Message-State: AOAM531LMIsknadcyL2edtu6bJ498Kyobyqzi2k4WcDhxtT2hA8JujMc
 kSD2lqd2JpLbNTXOyXp1RGl4XvzbngA=
X-Google-Smtp-Source: ABdhPJwJpOSatRZgWHQmla8hyHfsNHsXqRsV62WFXXCVWW7HuA6QASBLCWQH/HxxNBAtWprW8CUMtA==
X-Received: by 2002:a5d:4b42:: with SMTP id w2mr20613787wrs.47.1627328119614; 
 Mon, 26 Jul 2021 12:35:19 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:1f65:ed09:cb48:124e?
 ([2a02:908:1252:fb60:1f65:ed09:cb48:124e])
 by smtp.gmail.com with ESMTPSA id a207sm442788wme.27.2021.07.26.12.35.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 12:35:19 -0700 (PDT)
Subject: Re: [PATCH 1/5] drm/vmwgfx: unbind in vmw_ttm_unpopulate
To: Dave Airlie <airlied@gmail.com>
References: <20210722124127.17901-1-christian.koenig@amd.com>
 <YPqCBUDiibBWUs2/@phenom.ffwll.local>
 <c83ebc42-567c-4f4c-d6da-53ff21739222@gmail.com>
 <CAKMK7uGVPnsw2o=9E295CobiY_qYdCg5fZQN4Q8Bu22r9E3WUw@mail.gmail.com>
 <4c30a961-0a73-3f69-7733-2491549a8743@gmail.com>
 <CAPM=9txffDPERe_iZ2obsekJcbjfph32bca-18ROCJqEPByQWg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1dd69d33-4b58-e3dd-5598-ed78f2a18ef5@gmail.com>
Date: Mon, 26 Jul 2021 21:35:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPM=9txffDPERe_iZ2obsekJcbjfph32bca-18ROCJqEPByQWg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: Dave Airlie <airlied@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.07.21 um 02:03 schrieb Dave Airlie:
> [SNIP]
>> But you know, normal human: Only equipped with one head and two hands
>> and not cloneable.
> I'm the same, but I'm not seeing where this problem happens at all, do
> we have any backtraces or demos for this?

I've stumbled over this while working on some patches which accidentally 
broke delayed delete and caused random memory corruption and was 
wondering how that even happened in the first place.

Having stale PTEs in the GART isn't a problem unless you break other 
things. Which is also the reason why I haven't added a CC stable yet.

> I split bind/unbind into the driver, but the driver should still
> always be moving things to unbound states before an unpopulate is
> called, is there a driver doing something unexpected here?

Possible, I was only testing with amdgpu and the GART handling is rather 
special there (which was one of the reasons why we did that in the first 
place).

> at worst I'd like to see a WARN_ON put in first and a test in igt that
> triggers it, because right now I'm not see that path through the
> drivers/ttm that leads to unpopulated pages ending up happening while
> bound.
>
>  From 5.14-rc3 unpopulate is called from ttm_bo_pipeline_gutting in
> non-ghost path and there is no unbind,
> pipeline gutting is called from evict/validate, when there is no
> placement suggested for the object, is this case getting hit somewhere
> without the driver having previously unbound things?

Yes, that will hit absolutely. Most likely with VM page tables for 
amdgpu which uses this.

> ttm_tt_destroy_common: calls unpopulate, everyone calls this directly
> after unbinding
> ttm_tt_swapout: calls unpopulate, we don't swapout objects from TT
> directly, we should always unbind first, this used to have an assert
> against that,
> ttm_tt_populate: call unpopulate in failure path

unbinding was moved into the driver, so ttm_tt_swapout() won't unbind 
anything before calling unpopulate as far as I can see.

> So any place I can see unpopulate getting called with a bound TT
> should be a bug, and fixed, we could protect against it better but I'm
> not seeing the need for this series to outright revert things back as
> helping.

I'm not reverting this because it is offhand wrong, but making sure the 
GART is clear before unpopulating the TT object sounds like the much 
more natural thing to do and the state machine is something I certainly 
don't see in the backend.

Regards,
Christian.

>
> Dave.

