Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB457BF6760
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 14:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEA010E2F5;
	Tue, 21 Oct 2025 12:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Q5f5FCtJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762E010E2F5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 12:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761049939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=snHXFbUKVcqPgriwKGeD9+p0jAafcLSmWXFrDke0XWU=;
 b=Q5f5FCtJJGGvLTlc5sBqaZpeBhHJfR9TXIEvFTOO9GXaKFCyVkd8bvlR3TTrQmi4TCfI9v
 qe7Cs24QAMvzSefti1RGLNeju19CLSkid8CfRcEnolbXNn1tzpBjm8kX+oNksmpyrOPAEz
 OPG5FrnQGqoOiL43egViHjcM9/WZvMQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-Z1fAMe9GP3KoUfCWIwW7nw-1; Tue, 21 Oct 2025 08:32:18 -0400
X-MC-Unique: Z1fAMe9GP3KoUfCWIwW7nw-1
X-Mimecast-MFC-AGG-ID: Z1fAMe9GP3KoUfCWIwW7nw_1761049937
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-4283bf540ceso2221029f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 05:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761049937; x=1761654737;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=snHXFbUKVcqPgriwKGeD9+p0jAafcLSmWXFrDke0XWU=;
 b=nRkulaviSJyBsMKLdAsW9xj0LiMNpbGKRJanZ+qIXQDx0oUlUpBAgd6pyiagHjzuXG
 HYrzuFvc6cNSyLs75cNuWA5WMCj5Ttm1GfyguKkW4M8KQFCUWDsFB5mi7m3sWYDeb+Df
 HAhMZMXeztX8kyiBN/VeLxXC/JQ4RBUEAiuDIrcexTZ42UOhS1m/uy6uLZHFYrn+rK4T
 W6uiw8J2wiwz25GnguNi/Ci1gVvRmZZgpYfC2yojrSv62KVToZUQp91uhStC5UhgbPDe
 LKy4cl4i4XAh+JyAQqcECZaiFx5LGws4BQV+FDNiQ/6oSUXk4ccAPCH6be40AeyhOqQ/
 KoMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZmhvhxbWA6DRE+MumLUDJ/xXhiOE0TCvqrfDXzO2vc17ZP1Jptuwn8/a5gC6VC0mDeV5nsc/O7KY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQgn4NOuLwDy++THu1RK2BVYnSTfnuPuQkrUpOvqDPI9dkZEYi
 TULUtJV5ty9vhgABkhReOVPGuVjy9mg+JqIcTDq38ZVkkMQshE8s/Q7e+YZMdkkGGCEux630nk7
 foerLzNgJW0n/7eDdnsfzf6K3LLyGTEqWfaCKKsNHNG476uVuvuFSRRziTK8VoTB3mlpbPw==
X-Gm-Gg: ASbGncu7XrurMH/aSSOHERtjjMhFsUxetBkP6BbtHusWH1XPU+Z90HTl5YCBl3weS99
 ip2yY0o/kpeySlcGlzwTdMcqjBQ0DplekLb+jBvd5RDuryDVntZYNUUOjCTwSHV4QHGFb2qz9GO
 OHgGgTW2IA8ZPc0821yM1vGTqKiih54dZw5Oq0zok+60DJ5bINOdZae1DlZm2acKuRZUJWESeVV
 7SOWdIkS3kXIwHn1PUBRCvkwH/vn656SukNnME9JFn9G0rjk1Jym3aJhMprXndRa1/LshctPiJ+
 xXqte3mizHAeTJ96VB6QjQ4TgZSGMI8XSvTGJQRbzXuaGx2FRr4LPun3mpnJ6TkyntW2HgkXl0G
 hTPScOaq1wWkXJIgCQG9UmIe8cj/p+gRwMeQbicU=
X-Received: by 2002:a05:6000:2305:b0:427:928:7888 with SMTP id
 ffacd0b85a97d-42709287b06mr8917165f8f.55.1761049936846; 
 Tue, 21 Oct 2025 05:32:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBU6pyNtgJdNbG8KrDXp4BEjrSCFEszvqCmaWd2PrAFmOwM+9q033VKMpwkTA1TH8Zuz1XMA==
X-Received: by 2002:a05:6000:2305:b0:427:928:7888 with SMTP id
 ffacd0b85a97d-42709287b06mr8917142f8f.55.1761049936420; 
 Tue, 21 Oct 2025 05:32:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00ce586sm20603530f8f.49.2025.10.21.05.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 05:32:16 -0700 (PDT)
Message-ID: <2819877d-610f-42cf-9b3c-ee2d836e2df0@redhat.com>
Date: Tue, 21 Oct 2025 14:32:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] drm/panic: Fixes found with kunit.
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org
References: <20251009122955.562888-1-jfalempe@redhat.com>
 <f8f1e0ec-46fe-4d71-94aa-bdd081ec35fb@redhat.com>
 <13bc66cd-a63b-44b9-92fb-98b5b36ce2dd@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <13bc66cd-a63b-44b9-92fb-98b5b36ce2dd@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4YA98HfmYQITkNbqgXouUBuOI1kTEKV0GL1B_Lbh0jI_1761049937
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/10/2025 13:24, Thomas Zimmermann wrote:
> Hi
> 
> Am 21.10.25 um 11:35 schrieb Jocelyn Falempe:
>> On 09/10/2025 14:24, Jocelyn Falempe wrote:
>>> A few fixes for drm panic, that I found when writing unit tests with 
>>> kunit.
>>
>> Pushed to drm-misc-fixes.
> 
> There are many patches without Fixes tag here. Commits in -fixes should 
> preferably have a Fixes tag to help with backporting. No need to revert, 
> but something to keep in mind for next time.

Ok, sorry for that. I'll add it next time.

Best regards,

-- 

Jocelyn>
> Best regards
> Thomas
> 
>>
>> Thanks Javier for your reviews.
>>
>>>
>>> Jocelyn Falempe (6):
>>>    drm/panic: Fix drawing the logo on a small narrow screen
>>>    drm/panic: Fix overlap between qr code and logo
>>>    drm/panic: Fix qr_code, ensure vmargin is positive
>>>    drm/panic: Fix kmsg text drawing rectangle
>>>    drm/panic: Fix divide by 0 if the screen width < font width
>>>    drm/panic: Fix 24bit pixel crossing page boundaries
>>>
>>>   drivers/gpu/drm/drm_panic.c | 60 +++++++++++++++++++++++++++++++++----
>>>   1 file changed, 54 insertions(+), 6 deletions(-)
>>>
>>>
>>> base-commit: e4bea919584ff292c9156cf7d641a2ab3cbe27b0
>>
> 

