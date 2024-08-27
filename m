Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5569614CA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 18:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885B710E3BA;
	Tue, 27 Aug 2024 16:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="DVGJcnUN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5817A10E3BA
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 16:59:02 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4280c55e488so31541185e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 09:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724777941; x=1725382741; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QiU43yQym005njBLxDC7Zb+5pQBObBOBlh3xVF8w+6A=;
 b=DVGJcnUNhu7ADupR0MDi68IiMF8e5qBOzx8NX4kbyff+Y0wjrlG0x1h78r3YFa7LXf
 vyxFDZ8XV1LqEp5pXhrYfcdneIHGMSBeJ/BqkB2RQha1ckF2y5KmKV2QKur2CT4fTpYh
 6FbUUaU2JbaihZP8Fpc6/ye6e/BnGiWizLKF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724777941; x=1725382741;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QiU43yQym005njBLxDC7Zb+5pQBObBOBlh3xVF8w+6A=;
 b=xD+zG6wjVi8rvEUJisj3SvBBZU0e88anP0s0emW5JhDu0dKqljKi6E8trOnLRDnxfq
 7RyMvOD5oCucbEwfl52e1GPrD2zBLH+DVK+nMi/0FUzn7jGoFZhelKvkvvICYcb/8C/P
 Lyons63erFVpFVjKs4lL0YVIpluEWDsacTSB2I7vIQnlIIxZR/N8helGoeacWdRKJSX2
 84/YXTtkb73PXTAue8fGyWQ/W/HBMjG+QwGsk+laS2HG9xAkvpHwvaUasACYTqMpJxOh
 0cuOUcBtuwNTtGX5hnorPJIe8rbbpMun7Y6PAYIXrQhwzFq5GfhhNyBlQRoN89YKsLR2
 /Ndg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUTeoquaLDFUH51uhJfVkPl1CW2phSwL1/ZcEY1NBRb7JMTttxtdB8Svzv0OnAmAlz3HSYnw1e4ug=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5CEOg0Q8yEy0YzYQ+6uanzjXVEW3SYsWHKPPJk/0xv0rQsMaF
 ar1Kv3RVB/7BeaUE1O5m42VWo1RSZxzQ2OdeqbjpJIHtzefpL68u5fHfg3tibiM=
X-Google-Smtp-Source: AGHT+IHm/hnrB6N/I9w/Y/yfD5m9CwkI9mVadtbYKmEtSzTVYRabjw3JD9r2XPrcdd5d3gGAdg+tbQ==
X-Received: by 2002:a05:600c:45d1:b0:426:67fa:f7 with SMTP id
 5b1f17b1804b1-42b9a46d542mr21338915e9.9.1724777940636; 
 Tue, 27 Aug 2024 09:59:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ac5158420sm189603715e9.14.2024.08.27.09.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 09:59:00 -0700 (PDT)
Date: Tue, 27 Aug 2024 18:58:58 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
Message-ID: <Zs4F0gprfLpjaJLf@phenom.ffwll.local>
References: <4d4c532a-ff35-4172-9b71-93f5d130711b@amd.com>
 <bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com>
 <d065806d-1d72-4707-bc5f-4da311809295@amd.com>
 <13a47d22fb6753e20046a983126c6fea675beed2.camel@linux.intel.com>
 <006ba26a-48ed-43e7-8213-72ca0ae553e1@amd.com>
 <fe3a72942e558af26f1b2794f946920a33d316ab.camel@linux.intel.com>
 <e3716526ae9b530adddc815ca12c402b4cf7678b.camel@linux.intel.com>
 <8b479754-ea3f-4eb9-a739-26ee38530a23@amd.com>
 <75bce0097d86896fa70d6dba4c8ddb429a5bc1bc.camel@linux.intel.com>
 <fbb4a84e-aff6-4ac1-8eb8-5b9740b297d8@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbb4a84e-aff6-4ac1-8eb8-5b9740b297d8@amd.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 22, 2024 at 11:29:24AM +0200, Christian König wrote:
> Am 22.08.24 um 10:21 schrieb Thomas Hellström:
> > On Thu, 2024-08-22 at 09:55 +0200, Christian König wrote:
> > > In my opinion device drivers should *never* resume runtime PM in a
> > > shrinker callback in the first place.
> > Runtime PM resume is allowed even from irq context if carefully
> > implemented by the driver and flagged as such to the core.
> > 
> > https://docs.kernel.org/power/runtime_pm.html
> > 
> > Resuming runtime PM from reclaim therefore shouldn't be an issue IMO,
> > and really up to the driver.
> 
> Mhm when it's up to the driver on which level to use runtime PM then that at
> least explains why the framework doesn't have lockdep annotations.

Aside on the lockdep question:

Per-device lockdep annotations would be doable I think (since the rules
really are per-device). But lockdep really doesn't cope too well with too
many dynamic lockdep classes, so that's maybe the reason this was never
done?

It's the same with module reload, eventually you run out of lockdep class
keys :-/

What we perhaps could do is register a driver lockdep key (which is
static), that runtime pm core code could optionally use when set?

Hm, thinking about this some more, if we embed this in struct
device_driver when it's statically created, this could work perhaps
automatically?
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
