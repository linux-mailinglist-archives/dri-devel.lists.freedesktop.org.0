Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A519A2EAD1
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 12:14:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE96010E4FA;
	Mon, 10 Feb 2025 11:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="U+fF5Mrc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D346410E1A2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 11:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739186078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G/KMdZICnl582Io+/HgvG4CL9bgg3ycPLDrs0NWni5g=;
 b=U+fF5MrcD9/057KOFhdSRTZnIGHDSIY0VWTXMLYgKAruD4qnU2GBJMpAGVK8qm62GKA6IK
 pYIKoj4FuiPV76CyOB7LO3n+b1mHuWvF/qoElWRPjSXkH18TTKS1mS/QSTVZ7ZxrLTK3TW
 Pvp0JaoMSYQkictpT8j1oLoXKNfq6/w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-fsclYMXkN2-G7VpQzUvVjw-1; Mon, 10 Feb 2025 06:14:37 -0500
X-MC-Unique: fsclYMXkN2-G7VpQzUvVjw-1
X-Mimecast-MFC-AGG-ID: fsclYMXkN2-G7VpQzUvVjw
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38dc88ed7caso1776577f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 03:14:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739186076; x=1739790876;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G/KMdZICnl582Io+/HgvG4CL9bgg3ycPLDrs0NWni5g=;
 b=J8KN9/FBIzkbLI9jtxrvAjk1xysppLneTN9P9KbNPZIM3wHFVEGGZVgVDD9NdLz/w8
 BEDiw/mo60a8Q507H/g1/49JHa0Pe0rOYniLcJLqMrTREweh3MiYDT06vUOwmV1dnojY
 8nuBqu0Snu/yhA/DBWXrJW30LMZbGxDp7N1j1Lv5xiExHSF26ADFIiiN6O/CXBqYSFta
 JplEJ5fcEaYI0j5UB6u3kMeEjOlbaihdMFrRxmy2w2rGEdoNLvOGlsTjynro8ZXGPe8o
 frm7IPL/QrpBIzmCIi4NfuB7kiSVYmiEOoy3oaRZnURY0G69ajcU/GnBl+qAJxYgV2y6
 8C1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVs8lhxDOR6r2+0JW2ADxMPUe0NCxxFLKNYPWfrbkfnjtG6hVzrOUOKFbZpD0O+RMY+F6WXFRYuvhM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnWXYArJgkyM+Q07I3mWCDi2I+TftdHOZGEcB1/D4zy1UBfNtD
 h38bh4XNzDXtaVxEhXDQP7yukXfvzXbfglfAW2cOpdHt0oGPRD/qFqw7yVl6XP7fcBi5n9YXKUt
 nJsyhKsg5sAotw+ELzXdAB0EHw+A54OWFnKorrMgGwXeZUHDuwGk69McfDpt1AKfYDA==
X-Gm-Gg: ASbGncsmWaDnCnH5w9/mAswmkW1McVTCii1JXiluADBsMGwJxQoMFbXTYqbn+FXaJVG
 gqukHvPLd2EkJb0VMNWVGHT8wmnVDziAPfE2sl4uuGWJLIuHBZ1mjQv7O42lQMgWb6rHwJV5ZSS
 tKqmRB9gUOPK5tel0dJU7SWaDAWNA9NB6KK3wx9i38gpAlf/x/9xa6bfdOaWba08MzZq3l9CJvA
 PdsiNGf2t7EBFQzdFT9isBT4wyJLGxuroGsFfpuDOKTn4NJKnGgnVabys8Zspf4RyOhNH2Ojzgz
 4FudDzJbYlsZnlh7qD2nlj2ZO6kFbPAUCEZAtoQtwJrf
X-Received: by 2002:a05:6000:1448:b0:38d:af2e:d5c3 with SMTP id
 ffacd0b85a97d-38dc8dd1864mr9217939f8f.17.1739186076218; 
 Mon, 10 Feb 2025 03:14:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGo6CfURy22Wovwne0UJ4k3nKGVnkr/wgeTUUI2em35sZPS2GM9P0+LoW8IoS7CA0xajZHCog==
X-Received: by 2002:a05:6000:1448:b0:38d:af2e:d5c3 with SMTP id
 ffacd0b85a97d-38dc8dd1864mr9217915f8f.17.1739186075845; 
 Mon, 10 Feb 2025 03:14:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43935c4f4aasm70175115e9.22.2025.02.10.03.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 03:14:35 -0800 (PST)
Message-ID: <3c0e06d4-b5b7-45cf-bc42-8f12b293b7da@redhat.com>
Date: Mon, 10 Feb 2025 12:14:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] drm/virtio: Add drm_panic support
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Ryosuke Yasuoka <ryasuoka@redhat.com>, airlied@redhat.com,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 daniel@ffwll.ch
Cc: virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250206104300.416014-1-ryasuoka@redhat.com>
 <d8a453e9-c8ce-4a7d-8fb9-08a13c44d7f3@collabora.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <d8a453e9-c8ce-4a7d-8fb9-08a13c44d7f3@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QpOV2nvFhpbBiwys2MURZZxZNFhScpsJXN55xROfkYg_1739186076
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

On 09/02/2025 18:45, Dmitry Osipenko wrote:
> On 2/6/25 13:42, Ryosuke Yasuoka wrote:
>> Virtio gpu supports the drm_panic module, which displays a message to
>> the screen when a kernel panic occurs. It is supported where it has
>> vmapped shmem BO.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
>> ---
> 
> Applied to misc-next, thanks!
> 
> I've tested v7 with a different capsets, works well. For a non-VT FB the
> vmap indeed will be needed. Looking forward to the atomic vmap support.
> The rough idea of the atomic vmap helper is to make vmap code paths fail
> whenever hitting path that needs to sleep. Likely will be easy to implement.
> 

Thanks for your support.

I will see if we can do something for atomic vmap support for shmem.

Best regards,

-- 

Jocelyn

