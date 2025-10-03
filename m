Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE28BB66B0
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 12:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8115C10E1EB;
	Fri,  3 Oct 2025 10:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UroWbv7C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B364E10E1EC
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 10:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759485862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iSGZ7gPwgdEtxj/NHjR//qoE33TcMzmwlPlxRMThCME=;
 b=UroWbv7CalkjOGa7p3bkYTcKffR4Qf7APFywPTneV9Z4ULAZnUH45XlRjedRrEbK0m0HJM
 kW4jBGS5d6P6CYRJHXExFi7DG6H+TdaHRtk4mQsxR8CwwY9Ots3EHKvA2ClJy/J4nwH64F
 i0KFfXYtXHuDKsIBhc2KUOJfJwLItTk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-ihGS_9RNOOe5zj5G4wDnIg-1; Fri, 03 Oct 2025 06:04:21 -0400
X-MC-Unique: ihGS_9RNOOe5zj5G4wDnIg-1
X-Mimecast-MFC-AGG-ID: ihGS_9RNOOe5zj5G4wDnIg_1759485860
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-46e303235e8so28694225e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 03:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759485860; x=1760090660;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iSGZ7gPwgdEtxj/NHjR//qoE33TcMzmwlPlxRMThCME=;
 b=oULezozhv8p6BhsN6i5jvE0rpmDR5Ok0qj4h7BVQtXVcdgVPXQMWvXLCsrmE4S9tS6
 iUYgQWlTYK9Dx45g0pqKN7Cwd5rrGqfyJFmTeyZ4fbZpftm3XgEedY93dyCrt25R//n+
 JY/CAjN4/5XoZusLlyJAebVviVbt5XXbXlmAMPTTWvmCHYmnYsCj7wqZyoO3OlWc+Ngq
 oWGG1+t0NPBpfK5DmcW7ViFb3vGPHYaQqgEdPKIZr4QcDzE7xHrb+7+1Mb9a/qIISfIi
 cNlNhT3Ynm31Ju8HmAxUUZRqeYfFC1YD03lx/F/xMWuPtPDPcPrDSSdpvZAhFYTLVJgd
 HsMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs5nL05CbDP3FazrD4T+fKhkTh+WV4Xjh3E/uwGRYlDMJtNgdxoraUy5LXlhQ+mUfNCIXLBFbdX5w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPpZDVjVNnRlcRAhSmOPfxvh6wHOi8G10Ys4hzekHWFgJ/37GM
 HKj1dM2ESyWv3PstC6ed6IByHSEhCJ3E46SKRnS4TWIZcOz9rS5DQavrDj6e2ilzggCZGnRx9nU
 pQVycMld3X6PSURPqz593gEcKbOXStzNvy29Ex1ZPvPTNxArTNj8DVC4c8CLz51D9KG60GA==
X-Gm-Gg: ASbGnctJfAo+J7aNicnLbyUBI+7/rEHfBfOpgmBEGapOtCvmUYThO8XTUt+NCWZvbtH
 TyZU8xJG+jLOPhf1D4j7sBV3oV8M6kaHJ1vhQbhdX//ksTVbcC828ZqRmKOaJuAnSNLjjgBran3
 GEK44Gl4238tS3C/EEf3HNl709nAku6Oj0Gxs4rA087hI0oba4X85khlmAzCf2nxk54r4yx3DOA
 tQIdm9fLHR8yyi/KAfmv+5NotiQ1CNWsaflV3R8OOUj/pWcpIsDYTzzJvh6PFlKmtmO5558QHVp
 AQCU5q4uRyCrGx5v6Ip+y4N6Huq3KTjExg0RMr8Qvjl3U9IFMvuNIHGmzP0cxKcCH0s4fhYniBy
 KWPfc7AGC1r/BnMLO/dX5K7mLTXWA
X-Received: by 2002:a05:600c:8b22:b0:46e:4937:dd1b with SMTP id
 5b1f17b1804b1-46e7113f670mr20633885e9.17.1759485859845; 
 Fri, 03 Oct 2025 03:04:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9orXhNUEBAdaYwahGtz9hvXNKvvnMSnZWQQcsFvq6YSx1MF8F3MVitfA2oYFkO/QzLz7VwQ==
X-Received: by 2002:a05:600c:8b22:b0:46e:4937:dd1b with SMTP id
 5b1f17b1804b1-46e7113f670mr20633535e9.17.1759485859284; 
 Fri, 03 Oct 2025 03:04:19 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e723431f5sm23697055e9.2.2025.10.03.03.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 03:04:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sitronix/st7571-i2c: reset position before clearing
 display
In-Reply-To: <aN9z4pdh1aBZZLdz@gmail.com>
References: <20250913-st7571-reset-v1-1-ae5f58acdf8d@gmail.com>
 <87o6r9o25m.fsf@minerva.mail-host-address-is-not-set>
 <aMvIyOJkXE39sp8T@gmail.com>
 <87a52saujd.fsf@minerva.mail-host-address-is-not-set>
 <aN9z4pdh1aBZZLdz@gmail.com>
Date: Fri, 03 Oct 2025 12:04:12 +0200
Message-ID: <87wm5c47z7.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j7n6ygTgvcPHx72-9FDYy8d7Y7Mr7fEfDrF9dM98OtE_1759485860
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

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

Hello Marcus,

> Hello Javier,
>
> On Thu, Sep 18, 2025 at 01:07:18PM +0200, Javier Martinez Canillas wrote:
>> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
>> 
>> Hello Marcus,
>> 
>> > Hello Javier,
>> >
>> > On Wed, Sep 17, 2025 at 11:32:05AM +0200, Javier Martinez Canillas wrote:
>> >> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
>> >> 
>> >> > We cannot know where the write pointer is, always reset position to
>> >> > (0,0) before clearing display.
>> >> >
>> >> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>> >> > ---
>> >> 
>> >> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>> >> 
>> >> Marcus, do you already have commit rights in drm-misc or do you want me to
>> >> apply this patch ?
>> >
>> > I sent a request for commit rights yesterday, once it is approved I will
>> > apply this patch myself :-)
>> >
>
> It took longer than expected to get commit rights.
>
> Could you please apply this patch so that I could get it of my TODO-list
> :-)
>

Sure, pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

