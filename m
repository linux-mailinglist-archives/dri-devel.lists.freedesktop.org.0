Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F283347C86
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:25:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F38A6EA19;
	Wed, 24 Mar 2021 15:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E48D6EA19;
 Wed, 24 Mar 2021 15:25:00 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id g8so12469073qvx.1;
 Wed, 24 Mar 2021 08:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gpwB87oXfUvvM3L/4eO7uX0wNV0sT7lY6bOYHzfO2n4=;
 b=R5UxW0tK0sl9s5TGZ0VQUdfnb804cYFTBUA51drGuEFHw+QA7e8YV0eJtw6sxOIET+
 4OOq8Krj8L0iUzzukdJns5VUQlUdGBWwxzVjHtDIsmqmmLdPgkGP/vRVdUY/uXol9ptM
 JINZh9H+hpH4SBFwIy5PZNXpm0oVE3EVVVsFJv3tWqwlJTXQw8Nkkz0YHQvnMf+tf8hc
 xBMG9YwyTnVwW13GqF+3/cQ8XTirXZ7gDNBeKjKkdrfNd5aQD62XJ40a1G6qwJ/e8RcD
 7xWjfek+rdbPBUbuKwIKr8XiEkCTsJjsh9oyqJbeY5nnNxiZyGFi1wbpq7McuHAyO4cM
 5ZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gpwB87oXfUvvM3L/4eO7uX0wNV0sT7lY6bOYHzfO2n4=;
 b=k6Py/ESqKmxxCIfNG40mIK+i1y6wjAOGkrcJEA7DWGHSI3IuI9siNbjWPpR5XY3Et/
 85mCLb3HM6sR+K1V02lf1o0ZwHDfTu44bLarUJRWAO+MujunVaA2GcY48rOvhXRYlAFJ
 kI4rX+gsVzZCUlV3CjcwZ/rwGrxhBTf5og68LAj1POqxt1acpRzaC6h99tnIA6Z+R6Y3
 c7dGRtCBDD0GSxxs5256YZMPKtxBngxcVPY0enhZVDvQwTyV/9QZYDCVFDb+uLOKzXFo
 1RAvWQUvT2nzpYpWYpqolR+IrHzgsCr525VwtED2N6oJHKnAc3tsFSiUd7T7Wsoe2Q4h
 hh4Q==
X-Gm-Message-State: AOAM5312Ftg6pUG7ONfVN83TS8QhP0vvlTOf65fPdfv1QtFpr4D5WtgB
 S+XVnvpzinehw0a6HV/xc0Y9e6yJ/osnmQPfExc=
X-Google-Smtp-Source: ABdhPJx+Hfeqoouh4ojr9he2/mfMzBc/CcNXlShgBIT/ivPgE3F4H34dTFmidvQLcTGIYUT4qMJqfrMul5t0O5Oe7dI=
X-Received: by 2002:ad4:4421:: with SMTP id e1mr3717208qvt.48.1616599499244;
 Wed, 24 Mar 2021 08:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210324121335.2307063-1-tvrtko.ursulin@linux.intel.com>
 <20210324121335.2307063-3-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210324121335.2307063-3-tvrtko.ursulin@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 24 Mar 2021 15:24:33 +0000
Message-ID: <CAM0jSHM+LNqejx_UimXsA8+eEgd7qTpfTN7VzxdQcu53i+DCBg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 2/7] drm/i915: Individual request cancellation
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
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 24 Mar 2021 at 12:13, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Chris Wilson <chris@chris-wilson.co.uk>
>
> Currently, we cancel outstanding requests within a context when the
> context is closed. We may also want to cancel individual requests using
> the same graceful preemption mechanism.
>
> v2 (Tvrtko):
>  * Cancel waiters carefully considering no timeline lock and RCU.
>  * Fixed selftests.
>
> v3 (Tvrtko):
>  * Remove error propagation to waiters for now.
>
> v4 (Tvrtko):
>  * Rebase for extracted i915_request_active_engine. (Matt)
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com> # v3
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
