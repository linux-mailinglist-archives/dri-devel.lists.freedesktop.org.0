Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F53B431C8
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 07:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB5FD10E972;
	Thu,  4 Sep 2025 05:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="jSe9z1Tz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F01B10E972
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 05:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756965008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qggW7KTjlU6ejI6l4Tlv5hPrvn0I0l0hfP1BwcalHUY=;
 b=jSe9z1Tz6OmrdePgMHzuvhkotdRiVXy/ujblK0GHkkdf8VQM4z43+LMiNLy5kBaWL4ym1X
 kIRQfeWt10GH5c0w3W7zpGAQJr5jvVHHw9QRoW7E/qCNFLFjLSsh8zGA6k26GjGtf7KwmD
 Oktn50t83CzUOr13F2rt/pCgtjkWSIk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-NvWHpVa4NjeTy_DuaR8GRg-1; Thu, 04 Sep 2025 01:50:06 -0400
X-MC-Unique: NvWHpVa4NjeTy_DuaR8GRg-1
X-Mimecast-MFC-AGG-ID: NvWHpVa4NjeTy_DuaR8GRg_1756965005
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45b9c1b74e1so3084835e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 22:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756965005; x=1757569805;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qggW7KTjlU6ejI6l4Tlv5hPrvn0I0l0hfP1BwcalHUY=;
 b=eKrDeV78rbXdppPTy3usMQfDC06BlFhFvO5NWL5mfUDEe/LsG2yPvt3j/0TzxdhSxW
 xuBIVzfkwpTRTPRDAtMumMjnSgpPOPfxzfJ/8yBOTSC5Gz98BD4953yqowTQ8FG28UZ6
 /9GFJsm8NlcTdvR1ft3yFgD5LwBWGcFR88CJkm5t88lhChK5hzvlXY/WvzX9agAq5ws4
 j8biOyLFx2heocBJTLyw5ks1Pmci1F6iSf93WsIFGTYsxnfh+lTr8uRL17i0OYK5PB4M
 C/jqD9wt41twdjfn7Epi+fS0D4pCSUbxyOp5ckMhrt89YETYQ18L5mqbrlzAeja/Ds7r
 DDeg==
X-Gm-Message-State: AOJu0YxwUHEVRGECrbVzNW2LYEvQ21i7rHx0ywvmVvKPetPgFFMUp53Q
 6FKKqTG9FKHYPXf5H5AF0jwxlTI/BU8LCr2+biUaC+Vb0obNbsGcVhbPYlFRmYHXxHj4bJF5MPy
 nzRZUgoVAKgCdtVn+vB7CkuTQhSwoh0B8lZMQKhhvcHi9kX//p63Y63OkwMoqtMuJFelVEg==
X-Gm-Gg: ASbGnct9S6g0Y3sLW5v0oHs2rrRwwsCoRgz8tTR1B1sEPK2YMIzvQ3/2EO3aywzAyLt
 hDxzI36vxi6POyNpKwJn9UAlWB0darl5dql5Uzme685EKiY5FX9TZIDvVp0dWv8QR55pif153Du
 IUAN0jx4bVaB3NXXzb3RGigxgVEIqCuijPZkpff6CK3ZxyY/rFls4fC3HU+TFZErZ7xAe2ks4dX
 5xosUFWNwZEFIBBliEuOgTvCZC2m1E+XSbIZcwUIRZKw5FainpZgYnrkHujhDtmNA2KLHAcj+RJ
 awsL//7s2LjAmSP/tH+Usiqa2ZxI6/2ezlGbwKVyODJ/HL53d2ZxkTq1F9aGoryrFQ==
X-Received: by 2002:a05:600c:1c87:b0:45b:8b34:3489 with SMTP id
 5b1f17b1804b1-45b9861e89dmr68782215e9.4.1756965005115; 
 Wed, 03 Sep 2025 22:50:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGljutTKAncoAqAVhV+oQMlYYaXul/AlVZTtBGh6Ygzxqtw2Kk9jxwPI/ddWWTqfmuy5XKM2w==
X-Received: by 2002:a05:600c:1c87:b0:45b:8b34:3489 with SMTP id
 5b1f17b1804b1-45b9861e89dmr68782055e9.4.1756965004601; 
 Wed, 03 Sep 2025 22:50:04 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f306c93sm354419545e9.14.2025.09.03.22.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 22:50:03 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Michael Kelley <mhklinux@outlook.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>, "drawat.floss@gmail.com"
 <drawat.floss@gmail.com>, "hamohammed.sa@gmail.com"
 <hamohammed.sa@gmail.com>, "melissa.srw@gmail.com"
 <melissa.srw@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
Subject: RE: [PATCH v2 4/4] drm/hypervdrm: Use vblank timer
In-Reply-To: <SN6PR02MB4157EFAA19227FAFD21E1466D400A@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20250901111241.233875-1-tzimmermann@suse.de>
 <20250901111241.233875-5-tzimmermann@suse.de>
 <87a53dfe87.fsf@minerva.mail-host-address-is-not-set>
 <5cd7f22d-e39a-4d37-8286-0194d6c9a818@suse.de>
 <877bygg8vb.fsf@minerva.mail-host-address-is-not-set>
 <SN6PR02MB4157EFAA19227FAFD21E1466D400A@SN6PR02MB4157.namprd02.prod.outlook.com>
Date: Thu, 04 Sep 2025 07:50:01 +0200
Message-ID: <87ldmuzrzq.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: C0FdW7Uaoa6jwOxfG8_7iDn1PGL57erAlLQ6hh1qS9E_1756965005
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Michael Kelley <mhklinux@outlook.com> writes:

Hello Michael,

> From: Javier Martinez Canillas <javierm@redhat.com> Sent: Tuesday, September 2, 2025 8:41 AM
>> 
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>> 
>> [...]
>> 
>> >>
>> >> I'm not familiar with hyperv to know whether is a problem or not for the
>> >> host to not be notified that the guest display is disabled. But I thought
>> >> that should raise this question for the folks familiar with it.
>> >
>> > The feedback I got at
>> > https://lore.kernel.org/dri-devel/SN6PR02MB4157F630284939E084486AFED46FA@SN6PR02MB4157.namprd02.prod.outlook.com/ 
>> > is that the vblank timer solves the problem of excessive CPU consumption
>> > on hypervdrm. Ans that's also the observation I had with other drivers.
>> > I guess, telling the host about the disabled display would still make sense.
>> >
>> 
>> Yes, I read the other thread you referenced and that's why I said that
>> your patch is correct to solve the issue.
>> 
>> I just wanted to point out, since it could be that as a follow-up the
>> driver could need its own .atomic_disable instead of using the default
>> drm_crtc_vblank_atomic_disable(). Something like the following maybe:
>> 
>> +static void hyperv_crtc_helper_atomic_disable(struct drm_crtc *crtc,
>> +                                             struct drm_atomic_state *state)
>> +{
>> +       struct hyperv_drm_device *hv = to_hv(crtc->dev);
>> +       struct drm_plane *plane = &hv->plane;
>> +       struct drm_plane_state *plane_state = plane->state;
>> +       struct drm_crtc_state *crtc_state = crtc->state;
>> +
>> +       hyperv_hide_hw_ptr(hv->hdev);
>> +       /* Notify the host that the guest display is disabled */
>> +       hyperv_update_situation(hv->hdev, 0,  hv->screen_depth,
>> +                               crtc_state->mode.hdisplay,
>> +                               crtc_state->mode.vdisplay,
>> +                               plane_state->fb->pitches[0]);
>> +
>> +       drm_crtc_vblank_off(crtc);
>> +}
>> +
>>  static const struct drm_crtc_helper_funcs hyperv_crtc_helper_funcs = {
>>         .atomic_check = drm_crtc_helper_atomic_check,
>>         .atomic_flush = drm_crtc_vblank_atomic_flush,
>>         .atomic_enable = hyperv_crtc_helper_atomic_enable,
>> -       .atomic_disable = drm_crtc_vblank_atomic_disable,
>> +       .atomic_disable = hyperv_crtc_helper_atomic_disable,
>>  };
>
> I have some historical expertise in the Hyper-V fbdev driver from
> back when I was a Microsoft employee (I'm now retired). The fbdev
> driver is similar to the DRM driver in that it tells the Hyper-V host
> that the device is "active" during initial setup, but there's never a
> time when the driver tells Hyper-V that the device is "not active".
>
> I agree that symmetry suggests having disable function that sets
> "active" to 0, but I don't know what the effect would be. I don't know
> if Hyper-V anticipates any circumstances when the driver should tell
> Hyper-V the device is not active. My chances are not good in finding
> someone on the Hyper-V team who could give a definitive answer,
> as it's probably an area that is not under active development. The
> Hyper-V VMBus frame buffer device functionality is what it is, and
> isn't likely to be getting enhancements.
>
> I suggest that we assume it's not necessary to add a "disable"
> function, and proceed with Thomas' proposed changes to the Hyper-V
> DRM driver. Adding "disable" now risks breaking something due
> to effects we're unaware of. If in the future the need arises to mark
> the device not active, the "disable" function can be added after
> a clarifying conversation with the Hyper-V team.
>
> If anyone at Microsoft wants to chime in, please do so. :-)
>

Thanks a lot for the insight. I agree that probably is not worth the risk
to notify of a display disable, since is unclear what the effect would be.

> Michael
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

