Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4E2B05597
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 10:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2D210E1B6;
	Tue, 15 Jul 2025 08:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="G5fMj7vA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFEFE10E1B6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 08:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752569832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q4S6jLcDw14s0h5C7UNges46jen9fUJCj9Z3x6/+JdE=;
 b=G5fMj7vAdXPFTBjaZNZeq8PuhtLhIHg0YtX3gxVi15O3cbJ0f5VZUE6u/0hfal1GdvtN+1
 TUv1EgLbyCLQSYMUXXpvDABSQohEnvfqaZnw+ItgJJTWe0itP9tM02tkuhy0CjW3OYaznF
 rjdx/4v9AwIbwZQCj7MtcyIhSJaG7fQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-hUE_Qi3uM2aCB86nyFXiCg-1; Tue, 15 Jul 2025 04:57:09 -0400
X-MC-Unique: hUE_Qi3uM2aCB86nyFXiCg-1
X-Mimecast-MFC-AGG-ID: hUE_Qi3uM2aCB86nyFXiCg_1752569828
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a4f65a705dso3414161f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 01:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752569828; x=1753174628;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q4S6jLcDw14s0h5C7UNges46jen9fUJCj9Z3x6/+JdE=;
 b=QIjcgFDpub+pgKJZ9jaNclSWB7wavl0224wTYKwTQKpGp2ESI4lPQu9bKmPhlxiN5F
 lqF3pgrTPJlQbe6WQqt6mQbk+zF5xX1weQYATGybJkno2LyPRHQ/3/1/W8EGthLQ5SMt
 4q8fzlaR+BtzqZGsrkWSTWJaqXkMcc75lSM69Dp61+n3D4iZDqrF6MILbrDwPw+yi0pb
 jSFjx0kOatmRiafFVcMwqnnA8Jo/E/ZPvXCmianT3qdzC37ZhPMzv9lV/BfS1EYJOmv4
 Tyc/ra5D9H1QDMgvyIHa0hxram7lTy/VlTeaSqFXUa4f+S391L0ezA9sT44xzBEvHnvI
 3TAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUb8gjLw3RczywDL5aySwJDMlueB3Xfe5y/Ao2asb7p7AE+HdIN7qZRPkUKcopsO2Iiu8sPg6bk6Qk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywnqsqz3M6iNojo8ihwLG3wC5NbA3JA8iAUdER29yUmFU88j5OC
 a03jzCC37Ljf/KQX79W5+ii994vY5+3BqWBROoqVmUtspqPAi7Qqodb+L+gHbyIztixq6Vynp8v
 tY7oPazO9TDeovwXFVghoeM6hPZ0/Qxy3EjTZuj9xQCgvS3i6Svu8o8D/KHZ3ziUMHtQnTw==
X-Gm-Gg: ASbGncsyjlpcZwZUcCiQeoVKJDXUGGI8GVlSU/Z48+Et7D5ggYCmPq8npxI9LdiiPJl
 vzfZNIpcRDVT7jQIzwc9iHyJdEdaAt7mchHlvRz+66yBlwY5NOFtO2czCBVaefsoLTiYaZ/mIgB
 kPHtMkZ5aPRfmKXAxRN2cbMMB/1yK8hhUW4ZiutY8VRtzrG9HIIc+QhPVAUPDBejtMhTlr+JO5Q
 wPw3foR1mcT60wq06FDzs3t0aH7JxvZyI3N2HdnazeDce8Zq8tCVOML6xmgy8hSsX5cGeiz8ryA
 ivoNg08Oo/JswH/iYXrF0XS51+SJZBW7V2L7KbZsEZnrQcqTQfk9MaLPB7VKZcQP9WZndKe3k6z
 y
X-Received: by 2002:a5d:5d83:0:b0:3a5:541c:b40f with SMTP id
 ffacd0b85a97d-3b5f2dac5a1mr11824731f8f.9.1752569828093; 
 Tue, 15 Jul 2025 01:57:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6Kkel0yuQmQmEmb1zMwEbLFifDV9RypChWcFY6iUumNdJ0EnvBVHg1wUa4OJOhXqqUwTFlA==
X-Received: by 2002:a5d:5d83:0:b0:3a5:541c:b40f with SMTP id
 ffacd0b85a97d-3b5f2dac5a1mr11824702f8f.9.1752569827645; 
 Tue, 15 Jul 2025 01:57:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:5b4d:4594:545c:dd8?
 ([2a01:e0a:c:37e0:5b4d:4594:545c:dd8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d872sm14765473f8f.60.2025.07.15.01.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 01:57:07 -0700 (PDT)
Message-ID: <1961897d-cf42-4495-aec7-f4c20dfe7566@redhat.com>
Date: Tue, 15 Jul 2025 10:57:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-next] drm/bochs: Add support for drm_panic
To: Askar Safin <safinaskar@zohomail.com>, ryasuoka@redhat.com
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
 virtualization@lists.linux.dev
References: <20250613132023.106946-1-ryasuoka@redhat.com>
 <20250714000456.14-1-safinaskar@zohomail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250714000456.14-1-safinaskar@zohomail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: X5gBsb8WQg3PtpuZ_KDCalgdRJVdsCuDk8O8BO9wsD8_1752569828
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

On 14/07/2025 02:04, Askar Safin wrote:
> Are normal panics (i. e. not drm panics) still supposed to work with bochs?

"Normal panics", is just the console logs through fbcon. The problem is 
that this is not designed to work in a panic context, so on some driver 
it can work, but it's not reliable. Also depending on the panic source 
(Like if the panic occurs in IRQ context), you probably won't see anything.
I think the regression is likely because the driver switched to use a 
shadow buffer (ie: fbcon draws to a buffer in system memory, which is 
copied to the "VRAM" in a workqueue, and workqueues are disabled in a 
panic context). So there is no easy fix for the fbcon panic.

This patch series, only take care of DRM panic. You can get the same 
output as fbcon, by selecting CONFIG_DRM_PANIC_SCREEN"kmsg".

-- 

Jocelyn

> 
> If yes, then I want to point out that they, in fact, don't work since 2019.
> I. e. panics are not shown in Qemu if:
> 1) bochs is used
> 2) we use "normal" panics (not drm panics)
> 
> I already reported this here: https://lore.kernel.org/regressions/197f290e30b.eaadc7bc7913.7315623184036672946@zohomail.com/T/#u ,
> but nobody answered.
> 
> --
> Askar Safin
> 

