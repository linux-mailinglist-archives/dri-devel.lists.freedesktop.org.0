Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B16F53794A7
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 18:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DE089217;
	Mon, 10 May 2021 16:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E483589217
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 16:55:10 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id u16so16391651oiu.7
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 09:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to; bh=sVOf3rnQQoCxErFwACuycQahXXh0Mo2aHzmf0ZUSPko=;
 b=HQy+UmcK03DuKLfDIAryB3qD1Mil6T0UDB98z17huWfwRWDjMSI+T3c85L9CGSPeay
 DU+Evt3AJhioziDQCNcCJSrpcKj5BsrsNIscNv7h4V1kko81oWGTehQmGxZDnyW4CUe5
 yw9wsqE9adjtg4qamSlq2FebUWGdDllpv8PeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to;
 bh=sVOf3rnQQoCxErFwACuycQahXXh0Mo2aHzmf0ZUSPko=;
 b=I9vSRIxe3eqK9BZDL+nUO2tbWJ1NmaWQ4LZfEqx4GDjJwm3OJzRepIJqwFryw3iNDQ
 mno4vFHchraLgtKzYKGrlQNfNIJKm8Mkp8uTki0S2WT4njBnvoz4K+sIWWX3qPCbPEsB
 TMo4qcFCsiyzdg2TnN4yjvlZmL5Q890bGh2vopZI38BVdEgBSVEJlIJ5ZFr+wLQ0nDcp
 AJmLMVrCm/viJJOrPe9C4G8TAH+CBaEiXGzkW+OGQJTuMIUtfNvmdeRbrpD3K9veddwi
 UyqE8UkplIJh8sX4oueuTZcMPntF/4Hb+RzBf1VGTnUdKUe0wmh5U5UKk0AUHsfCQ/xl
 Lv3g==
X-Gm-Message-State: AOAM531lgCMgWZT4ZOqadbG/QwOulowVuuNLOkYhvQPerDW5asQVGl3L
 DLq7wGGspHRS98NivXjgtd9nNJOKWpVKkb5+WhNFYA==
X-Google-Smtp-Source: ABdhPJz5RLoBLot1CVzxTjJkBJp56d5KozQuBoFhRpWF7SSXLzx/nTWQb1uAogO6gMhleLVVnQnOjunOH/YyigS6+KU=
X-Received: by 2002:aca:211a:: with SMTP id 26mr18395539oiz.19.1620665710136; 
 Mon, 10 May 2021 09:55:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 May 2021 09:55:09 -0700
MIME-Version: 1.0
In-Reply-To: <20210510063805.3262-2-thunder.leizhen@huawei.com>
References: <20210510063805.3262-1-thunder.leizhen@huawei.com>
 <20210510063805.3262-2-thunder.leizhen@huawei.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 10 May 2021 09:55:09 -0700
Message-ID: <CAE-0n52a4hAsg0bq-1PeL=gK3uFQ0mkvWngdfA_NqdhgWg6tuQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] drm/msm/dpu: Fix error return code in
 dpu_mdss_init()
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Zhen Lei <thunder.leizhen@huawei.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Zhen Lei (2021-05-09 23:38:05)
> The error code returned by platform_get_irq() is stored in 'irq', it's
> forgotten to be copied to 'ret' before being returned. As a result, the
> value 0 of 'ret' is returned incorrectly.
>
> After the above fix is completed, initializing the local variable 'ret'
> to 0 is no longer needed, remove it.
>
> In addition, when dpu_mdss_init() is successfully returned, the value of
> 'ret' is always 0. Therefore, replace "return ret" with "return 0" to make
> the code clearer.
>
> Fixes: 070e64dc1bbc ("drm/msm/dpu: Convert to a chained irq chip")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
