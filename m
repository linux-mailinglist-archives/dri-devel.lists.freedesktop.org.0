Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F3D44EDE5
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 21:27:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A5A6EA3A;
	Fri, 12 Nov 2021 20:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2036D6EA3A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 20:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636748819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2hKzFqAYpjnD27jwSRYJVURcWAC9c1KmAhVPUzr+uD0=;
 b=CYo6BxoY/AFZkwfyUrFRyYJCvpYmH5HOWyZpprdpUfxahzWjO7xbQf7sMDYR04UsqnLyLe
 fhKoMs+0nxWTcAvoehX+3MFoDiUu7xvommgNY4PNC69ucAcKNqZbDKXHoRkdNOofqgIg/R
 Zqoqp4aRjt9GKchqQJwUJ1QAq9p9SW0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-Xk0EVzNROBiy-fL9czhFWw-1; Fri, 12 Nov 2021 15:26:55 -0500
X-MC-Unique: Xk0EVzNROBiy-fL9czhFWw-1
Received: by mail-qk1-f199.google.com with SMTP id
 v13-20020a05620a440d00b00468380f4407so827770qkp.17
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 12:26:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=2hKzFqAYpjnD27jwSRYJVURcWAC9c1KmAhVPUzr+uD0=;
 b=ILaO5yJD3Z7b3mejHtScVznii9+UTgXOoyOlz3TnAvP7hv8LNUQiqc0ImcRcNtr4mI
 TdZ7s4VP0IfE2WyUcvId1+5PqCiaICqqrrAO021B1JMa4SKZSMfzx+kNiw9N+2nxuARX
 YS3UKLm1F4ioemS2RcWgKM38JkJ0eDsQR8nWPQNn//UT9wosCXJmqNaax8+iKhjaN9MQ
 iH2/sX1OJ5/OOovbHmwnjtyM2rSn9TPq7hdjVOhybLRTre+2Z6dtSUGWGV+lX6KEhJjB
 znMVCh9ZvsAyL46S7h0WtN0OhJ3h3UIDigHKAhsM6TiQyvCHwolnqe92H6WxXjPdJ7Ig
 kG3Q==
X-Gm-Message-State: AOAM533bbWo2VHMd3hbzETQckWDS7gxHr3uoP56Q150UvAmg2t1uz4pq
 81ODKhJ4fLZBmUqU0AMepTHvVVzFnpOpsYb3YZcAhQVrZf+3V8WumK1aLM4y1OPBdVTqVjq8FBq
 aezyHa7i8UdOqA+8zikNPX4lYjqti
X-Received: by 2002:ad4:4452:: with SMTP id l18mr17371096qvt.8.1636748815206; 
 Fri, 12 Nov 2021 12:26:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCPD/xZBoIMM5Ht3JzQLe4OXeLMU7YK9BDgdA3kBtg895uCJ29aXlgQmKeeSXxnoIE8A5fMA==
X-Received: by 2002:ad4:4452:: with SMTP id l18mr17371052qvt.8.1636748814948; 
 Fri, 12 Nov 2021 12:26:54 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-249-157.bstnma.fios.verizon.net.
 [96.230.249.157])
 by smtp.gmail.com with ESMTPSA id t11sm3167889qkm.96.2021.11.12.12.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 12:26:54 -0800 (PST)
Message-ID: <be1833c5d27e666b760c729fc112d1bbd7b7a269.camel@redhat.com>
Subject: Re: [PATCH v1 2/2] drm/tegra: Use drm_dp_aux_register_ddc/chardev()
 helpers
From: Lyude Paul <lyude@redhat.com>
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>
Date: Fri, 12 Nov 2021 15:26:53 -0500
In-Reply-To: <5ee3f964-39ec-f6e2-5a01-230532a8b17e@gmail.com>
References: <20211107230821.13511-1-digetx@gmail.com>
 <20211107230821.13511-2-digetx@gmail.com>
 <YYk/jfcceun/Qleq@phenom.ffwll.local>
 <0a2c02ae-3fe1-e384-28d3-13e13801d675@gmail.com>
 <YYo9IXjevmstSREu@phenom.ffwll.local>
 <857a48ae-9ff4-89fe-11ce-5f1573763941@gmail.com>
 <efdc184a-5aa3-1141-7d74-23d29da41f2d@gmail.com>
 <71fcbc09-5b60-ee76-49b2-94adc965eda5@gmail.com>
 <49ffd29b-eb64-e0ca-410c-44074673d740@gmail.com>
 <YY5HfUUSmnr6qQSU@orome.fritz.box>
 <5ee3f964-39ec-f6e2-5a01-230532a8b17e@gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>,
 Thomas Graichen <thomas.graichen@gmail.com>, linux-kernel@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2021-11-12 at 17:32 +0300, Dmitry Osipenko wrote:
> 12.11.2021 13:52, Thierry Reding пишет:
> > On Tue, Nov 09, 2021 at 05:39:02PM +0300, Dmitry Osipenko wrote:
> > > 09.11.2021 17:17, Dmitry Osipenko пишет:
> > > > 09.11.2021 17:08, Dmitry Osipenko пишет:
> > > > > > +static void host1x_drm_dev_deinit(struct host1x_device *dev)
> > > > > > +{
> > > > > > +       struct drm_device *drm = dev_get_drvdata(&dev->dev);
> > > > > And platform_unregister_drivers() should be moved here.
> > > > > 
> > > > 
> > > > Nah, that should cause deadlock. This ad-hoc is too lame.
> > > 
> > > Actually, there is no problem here as I see now. The host1x driver
> > > populates DT nodes after host1x_register() [1], meaning that Host1x DRM
> > > will be always inited first.
> > > 
> > > [1]
> > > https://elixir.bootlin.com/linux/v5.15/source/drivers/gpu/host1x/dev.c#L475
> > > 
> > > Still I'm not a fan of the ad-hoc solution.
> > 
> > Could we not fix this by making the panel "hot-pluggable"? I don't think
> > there's anything inherent to the driver that would prevent doing so. The
> > original reason for why things are as intertwined as they are now is
> > because back at the time deferred framebuffer creation didn't exist. In
> > fact I added deferred framebuffer support with Daniel's help precisely
> > to fix a similar issue for things like HDMI and DP.
> 
> I don't understand what do you mean by "hot-pluggable", panel is static.
> Please either clarify more or type the patch.
> 
> Keep in mind that fix should be simple and portable because stable
> kernels are wrecked.
> 
> > With HDMI and DP it's slightly less critical, because a lack of mode
> > support would've created a 1024x768 framebuffer, which most HDMI/DP
> > monitors support. However, with panels we need to ensure that the exact
> > mode from the panel is used to create the framebuffer, so it can only be
> > created when the panel is available.
> > 
> > But, given that deferred framebuffer creation works now (which allows
> > the framebuffer console to show up at the preferred resolution for HDMI
> > and DP), even if a monitor is attached only after the driver has probed
> > already, we should be able to make something like that work with panels
> > as well.
> 
> BTW, I see now that DPAUX I2C transfer helper may access
> aux->drm_device. Hence v1 patch isn't correct anyways.

JFYI - unless I'm misunderstanding you, the aux->drm_dev accesses in the DPAUX
i2c transfer functions are just from the various drm_{dbg,err,etc.} calls,
which means that they all should be able to handle aux->drm_dev being NULL. If
you can set aux->drm_dev before i2c transfers start that's more ideal, since
otherwise you'll see the AUX device name as "(null)" in the kernel log, but
any point before device registration should work.

> 
> For now I'll try to test more the ad-hoc variant with Thomas and send it
> as v2 if we won't have a better solution.
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

