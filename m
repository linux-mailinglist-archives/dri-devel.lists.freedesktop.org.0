Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6295BAECE15
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD49B10E356;
	Sun, 29 Jun 2025 14:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TDubuIuz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A735110E356
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751208563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FMo4hXlw+x8qKQedb4fDzGU6UZAlnq0HY+9C+6mhqr4=;
 b=TDubuIuz8AyGxcUtwXXVDp9obA0QPkOv57cViwkdeiVA/JffILnNlFJg/769pKl/IK2pnB
 AVXgf58SJsY8JAN4rBwQpCYtKFscywnxpdIeX05pOvI9LdzH4T/2vvJRV6HXNs5bNo0An9
 +irO09ElTxvpzVhdpLM72HhUzSP7AlM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-3cgOXBByOLGDsukWvx2bOw-1; Sun, 29 Jun 2025 10:49:22 -0400
X-MC-Unique: 3cgOXBByOLGDsukWvx2bOw-1
X-Mimecast-MFC-AGG-ID: 3cgOXBByOLGDsukWvx2bOw_1751208561
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4539fc176c2so1169595e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751208561; x=1751813361;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FMo4hXlw+x8qKQedb4fDzGU6UZAlnq0HY+9C+6mhqr4=;
 b=tzqr2VE17FmRlXHr8bwXx7ov85BfdnqLFVd0TPjdz5ARVXeSNh2tXkkSXyE2k5rClO
 /+LSwlPK/CRjEuv30ETsT4TDx4STqpxtI+hsJpxm7KuQJIYHTBkUYAAVoD3uy6M/Rzdr
 10tIBRWUHKcfZfyx3IP1+0AyRY4CMtgXpp5tb7MyI4Bber6EAN/ZqULZprBacV9mvARY
 yHQOU/THasJv5bbnxbQQQvL9pT+jVf2/4rJtnMbWk+huRa9HlZc1C2MKddq/1In04P9E
 6wXeQylD61OrI6tRMXaWy0CVF8MFdRpKk2w9vPYn2+qmdxuM5CHfBNGZHDVGNUQL8Utq
 jxxw==
X-Gm-Message-State: AOJu0YyocSrXKUP+QuDWGSNc+T7QgoaEekj+62bYezV3pyFhY7d61+G7
 MvXAcwyoIxKR0Y0N/C2bv4ttGKGBTKkkPGyw93wlGfpNt4pmgNOgZcGQvbxe/hwMdiv6Q+pmVxD
 RmmSXaFBt/LQphiDTGH1AR5+OK7A8lj02rhG4ydbhzxGcqW3u3kpopzEbZl44pLmsPIDELA==
X-Gm-Gg: ASbGnctRv5mBa2r6pEuEt/5XVJ4635UvY4i++gSufeF3Mt//LA3wfspOHSSOaiZDWTI
 PMQ7SJKIZKgF40Hljkgc8Bw9CsAEUV4qL4AcJ8EETRDGWOOzQ4KZ30q9HU3UPRfWsQrewbyRT+z
 Td8O1lVDCITr5hHF2XOdkSQIVnYesEJAebWRnO89mQ8P3PgrFYHSF+IZU9tlkJFoCVOONFWT3yz
 Pe7YclT9aphR/mtcYvGJqv7cIHyj4kfDOZnT+aPDbjQ4V0gq5NqFE3fpZ3wjg7h0Sr127NLD2dT
 X5f/x1eLE06tph6vas601R5tBROmXFJia5SpmncpNrQ1yAgkc5H/wP8w2vQ10Q==
X-Received: by 2002:a05:6000:40c6:b0:3a5:527b:64c6 with SMTP id
 ffacd0b85a97d-3a90d0d6ce1mr10106123f8f.1.1751208560864; 
 Sun, 29 Jun 2025 07:49:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEglecXEkF/z7cvyPDkLXht+rIkJ5l7TX//baZlvQGm4Pvn+sfnI3+HYTKX4a47o/g4mXZXLQ==
X-Received: by 2002:a05:6000:40c6:b0:3a5:527b:64c6 with SMTP id
 ffacd0b85a97d-3a90d0d6ce1mr10106102f8f.1.1751208560423; 
 Sun, 29 Jun 2025 07:49:20 -0700 (PDT)
Received: from ?IPV6:2a00:79c0:638:3500:abf:b8ff:feee:998b?
 ([2a00:79c0:638:3500:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7fa8aasm7826048f8f.27.2025.06.29.07.49.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Jun 2025 07:49:19 -0700 (PDT)
Message-ID: <b7fafea0-2a0d-43fd-a3a9-847d61273cee@redhat.com>
Date: Sun, 29 Jun 2025 16:49:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/42] drm/gpuvm: Add locking helpers
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
 <20250629140537.30850-3-robin.clark@oss.qualcomm.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20250629140537.30850-3-robin.clark@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oHuOtpIIwg3ZWuFsm9J3EsVghnNbqPP2fPFeGoI1UrY_1751208561
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

On 6/29/25 4:03 PM, Rob Clark wrote:
> For UNMAP/REMAP steps we could be needing to lock objects that are not
> explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
> VAs.  These helpers handle locking/preparing the needed objects.
> 
> Note that these functions do not strictly require the VM changes to be
> applied before the next drm_gpuvm_sm_map_lock()/_unmap_lock() call.  In
> the case that VM changes from an earlier drm_gpuvm_sm_map()/_unmap()
> call result in a differing sequence of steps when the VM changes are
> actually applied, it will be the same set of GEM objects involved, so
> the locking is still correct.
> 
> v2: Rename to drm_gpuvm_sm_*_exec_locked() [Danilo]
> v3: Expand comments to show expected usage, and explain how the usage
>      is safe in the case of overlapping driver VM_BIND ops.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> Tested-by: Antonino Maniscalco <antomani103@gmail.com>
> Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>

