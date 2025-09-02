Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF62B4093E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 17:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0775B10E797;
	Tue,  2 Sep 2025 15:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VVF+wvKB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B46610E797
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 15:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756827680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=echO+HV+RoGgUzEJvYwbm1BGQwTumJtaUPpghadBhaY=;
 b=VVF+wvKBiDrvARTNuedS6lu++X1S9cYj3yKDFZO/wdXGM4ygyDTaW0IvX0ce+YOGAsd2ZC
 prjkJEuD7WVoNjg5bfqQnObbKP35/MNzcdY8zDG4btX8RiFOztM2yZ2as8y2es74dbWDwv
 6bSsk52o5PRRcidko6Skqv7EBgAtw1c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-IPFytFBLOGeFoCPHhPp2Qg-1; Tue, 02 Sep 2025 11:41:16 -0400
X-MC-Unique: IPFytFBLOGeFoCPHhPp2Qg-1
X-Mimecast-MFC-AGG-ID: IPFytFBLOGeFoCPHhPp2Qg_1756827675
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3cef6debe96so2925683f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 08:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756827675; x=1757432475;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=echO+HV+RoGgUzEJvYwbm1BGQwTumJtaUPpghadBhaY=;
 b=hqWyZuf6WfKUeHOqNxuzWfF8hfChxH7jB/+Qf0TKI9nkYZqDS0H22O0ovULrozgc6a
 voUA/vMdh75B0cwYlCVOyQBB1Vgylv2NtJDH0wfjMhLNC81SIfoTq2r8rGAbqXgLINCB
 uiinmkX3qugekk5zyQzwat+B0mZv9BYL++VUK+BEa1iz0CPVUl/W82IeAORmxIbW+Om7
 BdIXLKq/nZPIPrY1M3Y4kh7SJtucfbpEq458yPy9ug4rOQqF0zgQ/eBqtQ13panmSHEG
 GOFYcWgEXzZtw0pFtnxQ9Cl61gHuRoZwsc3pZhjeZE00UjS0A9D6IjCXPGS2gHkuJKdM
 eNqA==
X-Gm-Message-State: AOJu0YxdaYFcivg8m1bi35mRktp97Z4WZBwkGSkljwkftzoIoEx5LrK8
 S2uhhCSgRzc1RyRXqn9Upv2+wW7BeQChG4Vg3CwvnRPsn6z2hgXBbab6Qd0lujYpLtxP1EysiZE
 3Zt1uJOn0TrqpYdbz8q7LDjwwuUSyDE20JVT/oSuA1q15ompsF7dC+GeO2QViUTlBaO9pYw==
X-Gm-Gg: ASbGncvKm0NHvss7kd7rTETBRCm6OHLH29alim1lwAn7uJdMth75NiM8xYYbQO+YTnW
 qEQp7KTDrrXXPWNFU+UDRUPrpZ5t0I6PaSX2US/vd68yY9/K6Sr9Aq2K5JD4yJ2Bx2bvA3O31Dm
 haB3rS8RRpTCwXEheiw+oNYTeRPA2wYzlIdTQgr54mEXjTFO9Sy6jIZJFIxnDN2utXDM7xtwBXJ
 n/aw2TEgTAqB8yW00RYqTLq/g9D2PWGW6qYSRA6FCIs2tm9KQ2NHC0Zry2Ctf0bdIbRC16X88Qc
 nDiXlhy0K4rrWTO/knUJ+MWulgMdxHxiNShmLu+6iAu7P+rYrXnKqSroY+1pJigQ1w==
X-Received: by 2002:a05:6000:4282:b0:3cf:cb1a:c698 with SMTP id
 ffacd0b85a97d-3d1dfb11359mr8429001f8f.30.1756827675379; 
 Tue, 02 Sep 2025 08:41:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgJhPGDWOK1avxYgWFCOEVvVTXVILBzYi6KjL76UC34Zomae+j073wyFWpMlXlr7dmrpap6Q==
X-Received: by 2002:a05:6000:4282:b0:3cf:cb1a:c698 with SMTP id
 ffacd0b85a97d-3d1dfb11359mr8428977f8f.30.1756827674944; 
 Tue, 02 Sep 2025 08:41:14 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d60cf93cb2sm11223450f8f.12.2025.09.02.08.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 08:41:14 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, louis.chauvet@bootlin.com,
 drawat.floss@gmail.com, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 mhklinux@outlook.com, simona@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/hypervdrm: Use vblank timer
In-Reply-To: <5cd7f22d-e39a-4d37-8286-0194d6c9a818@suse.de>
References: <20250901111241.233875-1-tzimmermann@suse.de>
 <20250901111241.233875-5-tzimmermann@suse.de>
 <87a53dfe87.fsf@minerva.mail-host-address-is-not-set>
 <5cd7f22d-e39a-4d37-8286-0194d6c9a818@suse.de>
Date: Tue, 02 Sep 2025 17:41:12 +0200
Message-ID: <877bygg8vb.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QO66WZJFJHNuc_bzNmzIFRxGNwN9DP9z1oFYNO_tLbU_1756827675
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

[...]

>>
>> I'm not familiar with hyperv to know whether is a problem or not for the
>> host to not be notified that the guest display is disabled. But I thought
>> that should raise this question for the folks familiar with it.
>
> The feedback I got at 
> https://lore.kernel.org/dri-devel/SN6PR02MB4157F630284939E084486AFED46FA@SN6PR02MB4157.namprd02.prod.outlook.com/ 
> is that the vblank timer solves the problem of excessive CPU consumption 
> on hypervdrm. Ans that's also the observation I had with other drivers. 
> I guess, telling the host about the disabled display would still make sense.
>

Yes, I read the other thread you referenced and that's why I said that
your patch is correct to solve the issue.

I just wanted to point out, since it could be that as a follow-up the
driver could need its own .atomic_disable instead of using the default
drm_crtc_vblank_atomic_disable(). Something like the following maybe:

+static void hyperv_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+                                             struct drm_atomic_state *state)
+{
+       struct hyperv_drm_device *hv = to_hv(crtc->dev);
+       struct drm_plane *plane = &hv->plane;
+       struct drm_plane_state *plane_state = plane->state;
+       struct drm_crtc_state *crtc_state = crtc->state;
+
+       hyperv_hide_hw_ptr(hv->hdev);
+       /* Notify the host that the guest display is disabled */
+       hyperv_update_situation(hv->hdev, 0,  hv->screen_depth,
+                               crtc_state->mode.hdisplay,
+                               crtc_state->mode.vdisplay,
+                               plane_state->fb->pitches[0]);
+
+       drm_crtc_vblank_off(crtc);
+}
+
 static const struct drm_crtc_helper_funcs hyperv_crtc_helper_funcs = {
        .atomic_check = drm_crtc_helper_atomic_check,
        .atomic_flush = drm_crtc_vblank_atomic_flush,
        .atomic_enable = hyperv_crtc_helper_atomic_enable,
-       .atomic_disable = drm_crtc_vblank_atomic_disable,
+       .atomic_disable = hyperv_crtc_helper_atomic_disable,
 };

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

