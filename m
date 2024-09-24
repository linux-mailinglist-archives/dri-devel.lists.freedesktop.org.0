Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 219DB9842F2
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 12:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB2410E6AC;
	Tue, 24 Sep 2024 10:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="P7uSiW+v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C2E10E6AC
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 10:04:26 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a8d6d0fe021so880394866b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 03:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1727172265; x=1727777065; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eUivVyZKTaaJUn6Pnhq9NAbJ4kjNXkSV3p5bFwlI0to=;
 b=P7uSiW+vYxvR7HBjcFyHfd01hkEZ+KqgSfWJxyVLzSatvRhvmo0be7An90sSEP5QJu
 d6MI+T4F7HdhuxD+mhXVtNPPUnhLs5u/E8QEjIUB2vf5M1Y8vQrFlbDvJ6bVeeMpflvt
 NwXh6HoCHQqtVn1CrEbPJSq152UGttO4orc00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727172265; x=1727777065;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eUivVyZKTaaJUn6Pnhq9NAbJ4kjNXkSV3p5bFwlI0to=;
 b=cJJWu20bgAqUqtpxO5SX+hlY+wiEab9UeUV7eUsbXZmYe9Mrku9ReoAfz6wjpY22tM
 NGmiziJulYnsAusQpe2jb5p2OmHMUwntKMMbVpt9tp7TjIf9fSNtLGkdqA8ZSdv7oUWQ
 ZvvWB5QkDC7nQVM9L/Y0QGInAqbkvIk97tZqX+MBtDmWVMDPPx+ao3anBdHWXpPzH6YK
 hZ6/mZbWrmfHoba/YKlEDf27VWAiKOCaBdvi823rU2WBVSuDH1qHubS886NARvsF4nga
 OVKsuDQZYCtJPf52XPuF3ytHC6K4VcpedtyPvPLxlEC2Vk3pzSs14e/lcmSL4yImeFkJ
 L0CQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX63AGPAQ2bze4SkOPmLtS3Iys3j5aHI37uF1txNvzsntt64iLla60jQF543pw2i6rWphRiH04eJyU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhNXA/wdNOdLaB8sBNFo7m679+ZY38tntxH8QwIrj9IzVYyCM7
 zUf8SW8SND+oZe4ojOL4qKcM7hPoHXf7V1al3864JHOMCr/y4dSR5bheRNpF6tI=
X-Google-Smtp-Source: AGHT+IHGx88vfVQVcqpR1ObWgLWi9CdrcI1n2u2CcJTbjTgtN7Euar3egiviJ3XbL6qRHsni09WZwQ==
X-Received: by 2002:a17:906:bc1c:b0:a77:e48d:bae with SMTP id
 a640c23a62f3a-a90d501b079mr1233067866b.28.1727172264794; 
 Tue, 24 Sep 2024 03:04:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9393138ac4sm64530966b.216.2024.09.24.03.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 03:04:24 -0700 (PDT)
Date: Tue, 24 Sep 2024 12:04:22 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Philipp Stanner <pstanner@redhat.com>, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Subject: Re: drm: GPU Scheduler maintainership
Message-ID: <ZvKOpjbTZi8z8IVK@phenom.ffwll.local>
References: <23b1d4e3dfdbd05501385cc2b67da8901693bbff.camel@redhat.com>
 <70fdf365-7e65-4b45-9274-abbb1e8a56e2@amd.com>
 <d93f40ae-7812-4b72-8a10-272f8ed0721b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d93f40ae-7812-4b72-8a10-272f8ed0721b@amd.com>
X-Operating-System: Linux phenom 6.10.6-amd64 
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

On Fri, Sep 13, 2024 at 12:58:00PM +0200, Christian König wrote:
> Using Tvrtko's updated mail address.
> 
> Am 13.09.24 um 12:55 schrieb Christian König:
> > Am 13.09.24 um 12:49 schrieb Philipp Stanner:
> > > Hi everyone,
> > > 
> > > it seemed to me in recent weeks that the GPU Scheduler is not that
> > > actively maintained.
> > > 
> > > At least I haven't seen Luben posting that much, and a trivial patch of
> > > mine [1] has been pending for a while now. We also didn't have that
> > > much discussion yet about looking deeper into the scheduler teardown
> > > [2].
> > > 
> > > @Luben, Matthew: How's it going, are you still passionate about the
> > > scheduler? Can one help you with anything?
> > > 
> > > I certainly would be willing to help, but at this point would judge
> > > that I understand it far too badly to do more than reviews.
> > > 
> > > *glances at Christian*
> > > ;)
> > 
> > Yeah, I've already wanted to suggest that you and maybe Tvrtko step up
> > and start to help out as maintainers here.
> > 
> > And I have >1489 mails unread and can't find time to take care of them.
> > I'm happy to help with design questions, but I'm seriously not taking
> > any more maintainer work any my shoulders.

+1

I think just having people to make sure simple doc patches aren't stuck
would be really good, since otherwise we just make it even harder to
better document drm/sched and tackle the various corner cases.
-Sima

> > 
> > Regards,
> > Christian.
> > 
> > > 
> > > 
> > > P.
> > > 
> > > 
> > > [1] https://lore.kernel.org/all/74a7e80ea893c2b7fefbd0ae3b53881ddf789c3f.camel@redhat.com/
> > > [2]
> > > https://lore.kernel.org/all/20240903094446.29797-2-pstanner@redhat.com/
> > > 
> > 
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
