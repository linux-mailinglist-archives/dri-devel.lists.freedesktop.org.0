Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11447377DA3
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 10:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F926E40A;
	Mon, 10 May 2021 08:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741F389E57;
 Sat,  8 May 2021 19:33:43 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 t2-20020a17090a0242b0290155433387beso6409586pje.1; 
 Sat, 08 May 2021 12:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d/khha5gcYxKTZWPmu0C7r4Hm8Jar/yv7FF0/xWX35k=;
 b=uI91Yh9jX1UMCjFADa3Spki/qYd86s1jH1IXJeVXg0xDdfHIWNmw/OWsWKnzYTbxU6
 j7shvhqLZUS6QMOe5UTBxuNvgg52URS+foOlMw5v4q7j+4uC1YfvIdaPkAMOPIbq87pX
 VPLwr1HFXJTC5tRm1kca4bHOVoBZu0j4c80N5IiQrJCPSH4Zhw8lht58vlchvoRMi5py
 hFCcfGGPMyZ7/QTwFcKCnBLhYgfUOZeBMTT2iCrF8MQKnoD6mgmG4t6xE5lhmFTkRdcq
 OboaVhSKMROSi8nuBGRapLrhNmg4df3JgEep4lKG7TbwSWbwd5t6uzp4Myst7bce+8xQ
 qW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d/khha5gcYxKTZWPmu0C7r4Hm8Jar/yv7FF0/xWX35k=;
 b=f/NU0y86OHLYExsFBa6pA54Y3dcH2frW1SX5X+VU/RqebcRqlRZ/L4nnyQDwWEmkeO
 P2WlJoszrQsN1W4YvCluHYU1LuBmV60LSvO5ejt/UJMajin7uizPO5UdBeUEtfSl3sHx
 CHP5vjlFD602eTOwLBMU7RxCbX3P+uqPL1PCH73iOvsUv+WqRlXNAspCFwEpSNasmTj6
 bcm9pp23xqUkV0TuHrYNZ77YhLzOSFjHOO+rD5enXvUAil8hu3yGpsD9vNraBkpsxFzD
 NuUaLJX3nbuLKnJUFKjFA2UV7TJWoTiq4Zg/YZKUXjq+OXqb/Y1Mxmu8AL44IkfcSxWN
 e60Q==
X-Gm-Message-State: AOAM531DVGCGyTyStX4D4VZ5GFI1B7u1gdhWHGHXycFzXIL7yRTA629J
 47HcUSBkcST2+3Rp3rwxocY=
X-Google-Smtp-Source: ABdhPJyKdz0WlRg+E/80oP8OGNuEsW15TK5hHRQeI76SL3SHeka1FSYJ0wzNqPjZLkqR8w7Y6MwI/Q==
X-Received: by 2002:a17:902:6841:b029:ee:e239:18bf with SMTP id
 f1-20020a1709026841b02900eee23918bfmr16802089pln.56.1620502422986; 
 Sat, 08 May 2021 12:33:42 -0700 (PDT)
Received: from localhost.localdomain ([104.200.131.246])
 by smtp.gmail.com with ESMTPSA id b2sm15333631pji.28.2021.05.08.12.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 May 2021 12:33:42 -0700 (PDT)
From: youling257 <youling257@gmail.com>
To: hch@lst.de
Subject: Re: [Intel-gfx] [PATCH 4/4] i915: fix remap_io_sg to verify the pgprot
Date: Sun,  9 May 2021 03:33:29 +0800
Message-Id: <20210508193329.28394-1-youling257@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210326055505.1424432-5-hch@lst.de>
References: <20210326055505.1424432-5-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 10 May 2021 08:04:24 +0000
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
Cc: peterz@infradead.org, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, chris@chris-wilson.co.uk, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch cause "x86/PAT : surfaceflinger:1440 map pfn RAM range req write-combining for [mem 0x064a2000-0x064a2fff], got write-back" problem.
my 2GB ram Bay trail z3735f tablet runing on android-x86, "i915: fix remap_io_sg to verify the pgprot" cause this problem.

05-09 02:59:25.099     0     0 W x86/PAT : surfaceflinger:1440 map pfn RAM range req write-combining for [mem 0x0640a000-0x0640dfff], got write-back
05-09 02:59:25.106  1440  1440 W hwc-gl-worker: EGL_ANDROID_native_fence_sync extension not supported
05-09 02:59:25.111     0     0 W x86/PAT : surfaceflinger:1440 map pfn RAM range req write-combining for [mem 0x064a2000-0x064a2fff], got write-back
05-09 02:59:25.118     0     0 W x86/PAT : surfaceflinger:1440 map pfn RAM range req write-combining for [mem 0x06400000-0x06404fff], got write-back
05-09 02:59:25.125     0     0 W x86/PAT : surfaceflinger:1440 map pfn RAM range req write-combining for [mem 0x06405000-0x06408fff], got write-back
05-09 02:59:25.148  1440  1440 W hwc-gl-worker: EGL_ANDROID_native_fence_sync extension not supported
05-09 02:59:25.158     0     0 W x86/PAT : surfaceflinger:1440 map pfn RAM range req write-combining for [mem 0x06542000-0x06542fff], got write-back
05-09 02:59:25.165     0     0 W x86/PAT : surfaceflinger:1440 map pfn RAM range req write-combining for [mem 0x06499000-0x0649dfff], got write-back
05-09 02:59:25.171     0     0 W x86/PAT : surfaceflinger:1440 map pfn RAM range req write-combining for [mem 0x0649e000-0x064a1fff], got write-back
05-09 02:59:25.177  1440  1440 W hwc-gl-worker: EGL_ANDROID_native_fence_sync extension not supported
05-09 02:59:25.183     0     0 W x86/PAT : surfaceflinger:1440 map pfn RAM range req write-combining for [mem 0x065fa000-0x065fafff], got write-back
05-09 02:59:25.192     0     0 W x86/PAT : surfaceflinger:1440 map pfn RAM range req write-combining for [mem 0x06539000-0x0653dfff], got write-back
05-09 02:59:25.199     0     0 W x86/PAT : surfaceflinger:1440 map pfn RAM range req write-combining for [mem 0x0653e000-0x06541fff], got write-back
05-09 02:59:25.204  1440  1440 W hwc-gl-worker: EGL_ANDROID_native_fence_sync extension not supported
05-09 02:59:25.212     0     0 W x86/PAT : surfaceflinger:1440 map pfn RAM range req write-combining for [mem 0x066a2000-0x066a2fff], got write-back
05-09 02:59:25.218     0     0 W x86/PAT : surfaceflinger:1440 map pfn RAM range req write-combining for [mem 0x065f1000-0x065f5fff], got write-back
05-09 02:59:25.226     0     0 W x86/PAT : surfaceflinger:1440 map pfn RAM range req write-combining for [mem 0x065f6000-0x065f9fff], got write-back


05-09 02:59:27.101     0     0 W x86/PAT : BootAnimation:1665 map pfn RAM range req write-combining for [mem 0x08a76000-0x08a76fff], got write-back
05-09 02:59:27.225     0     0 W x86/PAT : BootAnimation:1665 map pfn RAM range req write-combining for [mem 0x08a77000-0x08a7afff], got write-back
05-09 02:59:27.242     0     0 W x86/PAT : BootAnimation:1665 map pfn RAM range req write-combining for [mem 0x08bd0000-0x08bd0fff], got write-back
05-09 02:59:27.254     0     0 W x86/PAT : BootAnimation:1665 map pfn RAM range req write-combining for [mem 0x08bd1000-0x08bf0fff], got write-back
05-09 02:59:27.310  1440  1440 E drm-fb  : Failed to get handle from prime fd: 25
05-09 02:59:27.322     0     0 W x86/PAT : BootAnimation:1665 map pfn RAM range req write-combining for [mem 0x080d5000-0x080d9fff], got write-back
05-09 02:59:27.322     0     0 W x86/PAT : BootAnimation:1665 map pfn RAM range req write-combining for [mem 0x080da000-0x080ddfff], got write-back
05-09 02:59:27.338     0     0 W x86/PAT : BootAnimation:1665 map pfn RAM range req write-combining for [mem 0x1b830000-0x1b83ffff], got write-back
05-09 02:59:27.338     0     0 W x86/PAT : BootAnimation:1665 map pfn RAM range req write-combining for [mem 0x1b76a000-0x1b76efff], got write-back
05-09 02:59:27.344     0     0 W x86/PAT : surfaceflinger:1440 map pfn RAM range req write-combining for [mem 0x07e87000-0x07e8bfff], got write-back
05-09 02:59:27.349     0     0 W x86/PAT : surfaceflinger:1440 map pfn RAM range req write-combining for [mem 0x07e8c000-0x07e90fff], got write-back
05-09 02:59:27.347  1440  1440 E drm-fb  : Failed to get handle from prime fd: 25
05-09 02:59:27.361     0     0 W x86/PAT : surfaceflinger:1440 map pfn RAM range req write-combining for [mem 0x1c123000-0x1c126fff], got write-back
05-09 02:59:27.361     0     0 W x86/PAT : surfaceflinger:1440 map pfn RAM range req write-combining for [mem 0x1c127000-0x1c12afff], got write-back
05-09 02:59:27.362     0     0 W x86/PAT : surfaceflinger:1440 map pfn RAM range req write-combining for [mem 0x1c12f000-0x1c13efff], got write-back
05-09 02:59:27.362     0     0 W x86/PAT : surfaceflinger:1440 map pfn RAM range req write-combining for [mem 0x1c12b000-0x1c12efff], got write-back
05-09 02:59:27.364  1440  1440 E drm-fb  : Failed to get handle from prime fd: 25
05-09 02:59:27.377     0     0 W x86/PAT : surfaceflinger:1440 map pfn RAM range req write-combining for [mem 0x1c140000-0x1c144fff], got write-back
05-09 02:59:27.377     0     0 W x86/PAT : surfaceflinger:1440 map pfn RAM range req write-combining for [mem 0x1c145000-0x1c148fff], got write-back
05-09 02:59:27.378     0     0 W x86/PAT : surfaceflinger:1440 map pfn RAM range req write-combining for [mem 0x1c14b000-0x1c14ffff], got write-back
05-09 02:59:27.379     0     0 W x86/PAT : surfaceflinger:1440 map pfn RAM range req write-combining for [mem 0x1c151000-0x1c155fff], got write-back
05-09 02:59:27.377  1440  1440 E drm-fb  : Failed to get handle from prime fd: 25
05-09 02:59:27.393     0     0 W x86/PAT : surfaceflinger:1440 map pfn RAM range req write-combining for [mem 0x1c157000-0x1c15bfff], got write-back
