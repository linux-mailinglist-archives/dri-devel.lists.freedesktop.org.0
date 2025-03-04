Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23026A4EF76
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 22:39:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF5F10E6B8;
	Tue,  4 Mar 2025 21:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hz7mp0lT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C9A10E6B8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 21:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741124344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XPWOo20A/TNlKmMNu2g+KBDtR4C82uP2s4+Ztzk3PJo=;
 b=hz7mp0lT0hqePR6yJ/+oOErX+GhRImAa2r1M49i3ZeyePINI/RnKi7hpvwQNES8f4Ay5zd
 9E/mqdoIaEKDnjfoNRT9TY9MmuIGTonUI980f0ImaH9D1Hwowx19/2dq/KGV8kKc9fIwqz
 Hq6UcPcG90jGtvxVEnROY4EFnpaVVJQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-7vkX-lqpM02UmQLBTja55g-1; Tue, 04 Mar 2025 16:38:58 -0500
X-MC-Unique: 7vkX-lqpM02UmQLBTja55g-1
X-Mimecast-MFC-AGG-ID: 7vkX-lqpM02UmQLBTja55g_1741124337
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3910afe5769so1186339f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Mar 2025 13:38:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741124337; x=1741729137;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XPWOo20A/TNlKmMNu2g+KBDtR4C82uP2s4+Ztzk3PJo=;
 b=m651/2Ukc8XV29xPVcX4NxZbq4M4vVGpK9+EDTLpzDZCrDcDJCwL5rfy5jxA+shYgz
 n3wo/MhYJ2UR+xi0FcVdQQ3sQQcVKMRSjDnEd6V6L7tqPB3wmJ9kOLIG/Tc446TTT5Ae
 sA9FNQkpimKkCgGguWyi1mX6nE+tx55S0nzXrMk5M/Oc5+nf+u5bYjEz24+MoAxb9Ysg
 l5f2gUfA+hLLmIonOM1IZpKwfmj2hehonELi3ffxP1S1Fx+/BxxaUldmhQTxlATKlK7x
 pACI2lGlFwiA8ayHx7gEg/VTShleHGMdFbxJThQotrHbx1M9vfCF1s9xuEOs/v8O7xN4
 iI/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ1T6UKqcDW2Wrkjw+kznOFOGLZRQBNjXQo0qfEGqcAWxwXltNlYRMrP/VwkqtNe1b46XugeCOUdg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzZLLsfSiAzLZXxN/fO1dHrtlVlPXrEvkOdVsF3g27F4zqMBFq
 sMZETo4PbDA5WnHfJfQ+XM+ZLKwdQ8xfheMBkwGcguPEMoiiAFYbvgOkwbOUNSWxhPCXAJ/dXsw
 KlE9iku6XDiB1CjlVlQfi2CZaS29vlvgkdeW/hFAJSLuvmeT3/ydQeCK/dS3JqV4t1g==
X-Gm-Gg: ASbGncvbP0hLbsdgJXyPJtI2eh8IrBDbhWBqH+5mq06JRLxwkRhhzRHTrBOIXg/VoMe
 SOjCFycAKcc7i4M1iNqdfPh2uFw+kJOtvFdBQ2QYE1fUKGCEh+HRM9EPFbvQAumZWW0OWTHtJa+
 TNq5Db4pLtIfeOEKNMqgywg88ThHWjBGtiay6jkyMV8iUIykgU/eB8bMvUhNdXJRWtDxE3qoGlE
 uek7OD3IT4NUmOmMJf+Gte1Wq8Yxf9g8HQYgPsaGOXa0wGzF2KBMAB+yStDRk2GWspd+drJqnDF
 WTJgZ/xMHIHYIj3APzWTf6yNnhhpn6gRe1gAOjMh476Yzh2cut2a2TU=
X-Received: by 2002:a05:600c:3b17:b0:439:8a62:db42 with SMTP id
 5b1f17b1804b1-43bd29404eemr3185425e9.8.1741124337355; 
 Tue, 04 Mar 2025 13:38:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErZIgNQ7dxy87GX5JZluyg2tAe6QV0DeyMYaH13GUGrIhPllBBZ3ZaKJ2S30irYIqGcbgztw==
X-Received: by 2002:a05:600c:3b17:b0:439:8a62:db42 with SMTP id
 5b1f17b1804b1-43bd29404eemr3185365e9.8.1741124336980; 
 Tue, 04 Mar 2025 13:38:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bc9c0fb1esm52916565e9.20.2025.03.04.13.38.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Mar 2025 13:38:56 -0800 (PST)
Message-ID: <6cfb66cb-fe2a-4934-9cac-982315583382@redhat.com>
Date: Tue, 4 Mar 2025 22:38:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] drm/{i915,xe}: Convert to DRM client setup
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, javierm@redhat.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20241212170913.185939-1-tzimmermann@suse.de>
 <de8325a9-49b2-48ec-ba56-4349140564b1@suse.de>
 <7ca7be00-f6d9-43b7-b3d0-0984306ac302@linux.intel.com>
 <084ab2f7-240c-45c5-8bde-7c551546d1ca@suse.de>
 <d85b9017-bf18-444e-8d94-8ff66a0d06d2@linux.intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <d85b9017-bf18-444e-8d94-8ff66a0d06d2@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ud3R69Mom8xdXV2VmuE2tPNcGFK2iBWIUX6yIOhd_d0_1741124337
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

On 04/03/2025 20:40, Maarten Lankhorst wrote:
> Hey,
> 
> On 2025-02-28 09:49, Thomas Zimmermann wrote:
>> Hi Maarten
>>
>> Am 12.02.25 um 08:28 schrieb Maarten Lankhorst:
>>> Hey,
>>>
>>> I'll give it a spin on xe today. It seems someone already tried on i915,
>>> so I expect no issues.
>>
>> Did you get to test the series?
>> Sorry, should have gotten back to you sooner. Xe was working with the 
> series applied. :)

Hi,

Is it possible to also review and merge i915 vmap support?
https://patchwork.freedesktop.org/series/135554/

This is required to have drm_log working on i915

Best regards,

-- 

Jocelyn


> 
> Cheers,
> ~Maarten
> 

