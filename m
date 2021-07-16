Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC913CBC59
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 21:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E245E6E9CE;
	Fri, 16 Jul 2021 19:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5D86E9CC;
 Fri, 16 Jul 2021 19:20:16 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id r125so9774339qkf.1;
 Fri, 16 Jul 2021 12:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dkhs2tEFMJ6j7r6WGC72CuW7H3CxJIWmCvSObfjCTVc=;
 b=sB9f9B1LtPhRNWsAKbvmzwdNhmoJdULJgvvLL9x8IJV2PuZbb0qkhzEIvWcGRfOZ2b
 9KF6KVGk+aWfOvQ/X87RdDwF37Dv5nkHm0K8dtqdep4MuyBBFITOQpC5XTb5MM4rcGsE
 oHWpuPn8wEQ9FYATmbm7DSwvq3CNh66O4M4ULXPADbLV2cqYaeIYy0oiENxL4Kr7fhGY
 7THMb2VtzPv+w1r8LfpkM6C2/Ibd2RFpHNPlnMP6ZZv2qeyyIWxAGVnJC+UIA5rYuOWO
 4G4edz1D7eiYNrPMFoXLGKlK8gYul/XcnYhZw+U+NXp+GHC4M3RqMsUjpaEANtlhFYzx
 ElwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dkhs2tEFMJ6j7r6WGC72CuW7H3CxJIWmCvSObfjCTVc=;
 b=QcHRVreCQQIJv6QG+Dk2czqzXeuB1L9EZWb0By2ZGMgwVUWK55ZMgGBPGzkW7WjckQ
 uPEoWNqi8E1hCn2dS2/Oh9MRSwIJ/lDsIxoZV/IW3iuO62AgrAUTwnL8Qg1s/8wnuY8i
 rRUCrwFjwiQa6vI/q3Ix0JbBOWy1qk21+oUvX2qXsB1mBKrOyghNp9hOH1JC6kqbhNkh
 Q5XFK0Xe+cgHmiKwD8WsCGu0Rv95O06XFa6NRlTbKSEwTnJKSPBDGBgbc8oFUI3+jLCl
 y33jkJM2BcofsrWFjMUU4A/VgZq/gEQMKasOhK/fCZCj5SJSpe6CRvIlsTQEQIatjeP/
 oryA==
X-Gm-Message-State: AOAM53276Im3YWNDzyXHyCckqd0q/Ua9N3LyebO5sbr1SWaluhuSImB6
 FD3FHdhr6MysHaCgMtbYZ53zzH4zke80o/j+jJUyOqZNSmE=
X-Google-Smtp-Source: ABdhPJz6XuRvwVsBKFYo+gtv8r6cA0VDA127p/rzFKGM6BVV/RZ1DV+JV21vw9Slbu/GVFVGhxV/inw4fp8zvOkL1w4=
X-Received: by 2002:a37:5d5:: with SMTP id 204mr11449888qkf.17.1626463215923; 
 Fri, 16 Jul 2021 12:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210716141426.1904528-1-jason@jlekstrand.net>
 <20210716141426.1904528-4-jason@jlekstrand.net>
In-Reply-To: <20210716141426.1904528-4-jason@jlekstrand.net>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 16 Jul 2021 20:19:50 +0100
Message-ID: <CAM0jSHObDORrPX58c-Cn2axnze3=4hnnpSoFrbE78J7KMC_v_w@mail.gmail.com>
Subject: Re: [PATCH 3/7] drm/i915/gem: Call i915_gem_flush_free_objects() in
 i915_gem_dumb_create()
To: Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 16 Jul 2021 at 15:14, Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> This doesn't really fix anything serious since the chances of a client
> creating and destroying a mass of dumb BOs is pretty low.  However, it
> is called by the other two create IOCTLs to garbage collect old objects.
> Call it here too for consistency.
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
