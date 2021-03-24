Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1E034784E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 13:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BCA6E091;
	Wed, 24 Mar 2021 12:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8814C6E091;
 Wed, 24 Mar 2021 12:22:01 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id v70so17721616qkb.8;
 Wed, 24 Mar 2021 05:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KlnBj1UjWsnvWSWClQIzZk6rJALyTB/aXV5OS4M/98o=;
 b=Il6sd7mval/Dc7R+4oL+fZAq/RY9XRTFj8hJN16ZHXLVs//yMLvj93RVfNufpcUV9c
 6CLQhhEJBCdZDFBbj7qQFfVdJJiUp5TbVQcko+4pL1iXVbXHqnHZVoypQRVGqwGFKtXF
 6xylF5/NIdeuPAICWx40iqhuDvVCD5LeulyvnyFfZf+u6Upt3NF9UtGPbL4ti7khDtPa
 XxQo+i0ISIo/ZF2Gboci4n3Hs/ufUnThTtbYfQcBiUMKJpTtumoJbZ5Jl4kjni2hJYby
 w6u3TZgw7vkYgP29X1/SSHNT4Ol6nXeAuxK6mjxE0HMvwFNPh9fKf+KRXCHJoK3rt0mJ
 V4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KlnBj1UjWsnvWSWClQIzZk6rJALyTB/aXV5OS4M/98o=;
 b=Fgqhl/gb+3OSE+6FisBayPbQc2rxz8WZQpvawSpy/7aanKN2MPjrpmX8FjASUJzVjP
 w1DVzUFDWtfLUAXRBEbRlmLxanOp58iNjQxCsrI39TLvMjJPHdOPcx2BGWOCdIV32DxD
 IBKgZZ+KM+4gOF9cuCtLzWREvGG0Rws4qMSckp/whlT0OHd4AyYV45TC1nL/Que8Nhu7
 oIaYhmCj9ng5pRoeb0KZIAGGgxmbXnniE7h7mkSsV3p/FhyMJ7TqXf22i4j1xlSiiQoK
 v8GdRm26qWit3d8wmA0Gw4GFr4DL7ZwNa/+toqMwo/skWCJab+UVcYcvadtn8pwIaj4o
 4FrA==
X-Gm-Message-State: AOAM5300h8Jk5z8lvQtylI2TwWoeTg2Myvk7qa7CfPpN3Z8yLoU0mjoY
 xPPHecKEiXPXQuK+MO7353avXJXB7QgE2HRz3tAlwDAFfOM=
X-Google-Smtp-Source: ABdhPJyreNv0z3Z6+s1fQbIZlxbfmA7ev6rPYR/Ne2BxHELHW+t1JRKNncdu52dYa1+mrzvR4daOShLBTmMzvIxiEmw=
X-Received: by 2002:a37:a0d1:: with SMTP id j200mr2720732qke.426.1616588520785; 
 Wed, 24 Mar 2021 05:22:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210324121335.2307063-1-tvrtko.ursulin@linux.intel.com>
 <20210324121335.2307063-2-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210324121335.2307063-2-tvrtko.ursulin@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 24 Mar 2021 12:21:34 +0000
Message-ID: <CAM0jSHML_AXOnkbw2UyhmzGHb1-JK=r2YrU+2SMDnuhDZbEs4g@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/7] drm/i915: Extract active lookup engine to
 a helper
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 24 Mar 2021 at 12:13, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Move active engine lookup to exported i915_request_active_engine.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
