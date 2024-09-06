Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2102096EC93
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 09:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9467810E8FF;
	Fri,  6 Sep 2024 07:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="V7JGZger";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B10210E8FF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 07:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725609200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EfrBxnrPzLfQTGlaHgnw9vHVUirecSOPfSNaim1PSDQ=;
 b=V7JGZgerA+LmkLAbx+VnygsWnFwHawWnYTG2fudOWW+jz3Bw61tlnFQQ9eefDd/18sPAnu
 vyUOH+fsXvZeTegXYjU1SKyGZ6EpEwVKtgnbRZRcv4nAKxs/q95xdkUEHza9cYdno8IF9f
 9QM07X3jo/kBAkbS/BH5dlSK5uKFYEQ=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-fCr9TL16MVG6wcruvg-B_A-1; Fri, 06 Sep 2024 03:53:19 -0400
X-MC-Unique: fCr9TL16MVG6wcruvg-B_A-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-535699f7a6bso1704759e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 00:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725609198; x=1726213998;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EfrBxnrPzLfQTGlaHgnw9vHVUirecSOPfSNaim1PSDQ=;
 b=huwmGX5gFup/5s/nB9nYwNhWSo2lS8e+tTbYfSw24ppLYTpFcIF7Av9gEloTFAhFl+
 9MInCdnsbI0mY5ft402Jf2XSKSFoLQNqSdXZqDoYpWptFBTc3tSxeZM0hqByxaXK2u04
 9CWVZ8OhsNYohigXPR9PnsWqxTSHtos9OhcyARqncLr1uDJ12CMf0JDp8qNEcmlX3gLj
 chWL90XJQz8Bh+u2+VOOU7FfA+X34u7Yds5Fbcpo109Wh4PurzXQCAhL/lCWMnfcPv1S
 GEZ0YJhZh05sa0D1vtq2gbBYs6U9jzf2yLylUTdFllLURWEAK2Odp59RVyaz0NW0ZO6m
 eiyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn4uH/CycrgD027Ukui6JKhcvov0Bxies15+lMKGKN3lEwZXxFvErxCrmwjFd5cxy7oTzRMq2++/M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywk5IBfU/f/XecjuWKTSyEaqUgzOgZBnIeBZjT/LDofoIqZA3Is
 tkbaPQKxL1r65TwQXgcDcw+RDqJP93YydUWDlKZKlsFE3pIrSnxC+/tOpkHNsRuQPF+lEX468+b
 lbi70Nih2JP5qZIvbOuCQOSuxUfYF4Pj7bMZ1OLa6DLsWISoSbRJ9Uk1yLTp2jzB6lA==
X-Received: by 2002:a05:6512:10cf:b0:535:682a:b6c0 with SMTP id
 2adb3069b0e04-5365881a531mr837727e87.61.1725609197608; 
 Fri, 06 Sep 2024 00:53:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOLErZd8sK7pmLsqp9q/TRsiLkxNVpjYLAzoIT78SU68/uGnRWKBXr6Ut84g/XznDsuc7ZtA==
X-Received: by 2002:a05:6512:10cf:b0:535:682a:b6c0 with SMTP id
 2adb3069b0e04-5365881a531mr837705e87.61.1725609197009; 
 Fri, 06 Sep 2024 00:53:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca2cfc296sm5949135e9.36.2024.09.06.00.53.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2024 00:53:16 -0700 (PDT)
Message-ID: <a421b31b-53ad-4f56-88be-66a7d4c3bb61@redhat.com>
Date: Fri, 6 Sep 2024 09:53:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
To: John Ogness <john.ogness@linutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240801100640.462606-1-jfalempe@redhat.com>
 <20240801100640.462606-4-jfalempe@redhat.com>
 <87o76czfb2.fsf@jogness.linutronix.de>
 <d4412d54-41b1-4671-9733-34ba1423404c@redhat.com>
 <87zfpwxqpc.fsf@jogness.linutronix.de> <87a5gm2khw.fsf@jogness.linutronix.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <87a5gm2khw.fsf@jogness.linutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/09/2024 17:22, John Ogness wrote:
> On 2024-08-01, John Ogness <john.ogness@linutronix.de> wrote:
>> On 2024-08-01, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>> I think I can also register one console for each drm driver, which
>>> will simplify drm_log even further. (currently it would mean having a
>>> circular buffer and work function for each driver which is a bit too
>>> much).
>>
>> Indeed.
>>
>>> Do you know if there is a chance to have write_thread() in 6.12 or
>>> 6.13 ?
> 
> FYI: The full NBCON API (with write_thread()) is now available in
> linux-next.
> 
> It would be great to see a version of drm_log that only implements
> write_thread() and does not do any of its own buffering with workqueue
> and also does not need to track multiple graphic loggers at the same
> time.

Thanks for the head-up.
I will rebase it on top of Linux-next, and adapt to the new 
write_thread() API, it should be much simpler.


I also need to adapt to the drm client rework 
(https://patchwork.freedesktop.org/series/137391/) so that it will be 
possible to choose on kernel command line between drm_log and fbdev 
emulation/fbcon.

Best regards,

-- 

Jocelyn

> 
> John Ogness
> 

