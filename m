Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57AF356C45
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 14:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187D36E0E3;
	Wed,  7 Apr 2021 12:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB02F6E0B6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 11:37:38 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id o5so18338486qkb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Apr 2021 04:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IW3oRRx99M57CpJG31OJ6s9cRTtaL0D26Vt6HdVUzpk=;
 b=oopYu+YQ42DBdZzN3yOYVkLE34+WNijKBfVjcKw6QPwW/mRKOs2n2G4L1YfBrga8cx
 220R9uTBCCRVSD1cy6bDEd7gA1lnF9TD+T4FpdSH5e6pDE7WFLCti3vaDYFyC2SgaM9z
 dzLQKaRLpCgPt311J8OYBUcFJAbeRxPMkE31g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IW3oRRx99M57CpJG31OJ6s9cRTtaL0D26Vt6HdVUzpk=;
 b=pdmgZMAxrS/8f3a3y2bS9eQWCL+UpcpS4sPFSnbyJHnF5ZQIr9kKyUaLpcvEyLRku8
 mtLYx+Ok2Fr6DlC30uce19ZNbxdBnKaXBPODlgK/2ljQWrtG8Sn3ZPQy4AjKRz3v8SXV
 SofG7hiFScK/xde5zjmOjTVxhwrXm/mjSh/sFb9pvR/aT9E2KjRvMQAr2NgHeuINIZj5
 FAbhAB2RkLDJMRa5yq7PuIlm1rn2BrtQdKvSefe9nvAm76moF/q2Q0Sl/3mvO/7zJyAa
 vt6zOF2H0zEIDo0ZAZjo13TFdFbD+fUhsryDMPGNnTAM7N4foKbKBaTHtHLKdVWUTxOu
 nSSQ==
X-Gm-Message-State: AOAM533g/zrz6p/N6kyCb/rTel81j1UshGX4qk4pXuTujbi+0XV73I3y
 TjA2iDL1oaF9A6zNk699LHPF9oKjhGbPmgZhO1SbZw==
X-Google-Smtp-Source: ABdhPJyA5Hg5hcZK/lrBzsOg/7n5zpjnXNILiWuDcgO2g8kFHFN6fUKV9nWalWac9N9CBudJ/zH0+3dvbyRGFrd6m4Q=
X-Received: by 2002:ae9:f70a:: with SMTP id s10mr2714172qkg.468.1617795457907; 
 Wed, 07 Apr 2021 04:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 7 Apr 2021 20:38:56 +0900
Message-ID: <CAFr9PXm9oStJ4oKNaGCGi9sXBTc-6iDZJZTWvumWHiFwwcRPnQ@mail.gmail.com>
Subject: Re: [PATCH] clk: fixed: fix double free in resource managed
 fixed-factor clock
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailman-Approved-At: Wed, 07 Apr 2021 12:38:30 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>, freedreno@lists.freedesktop.org,
 linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Wed, 7 Apr 2021 at 08:06, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> devm_clk_hw_register_fixed_factor_release(), the release function for
> the devm_clk_hw_register_fixed_factor(), calls
> clk_hw_unregister_fixed_factor(), which will kfree() the clock. However
> after that the devres functions will also kfree the allocated data,
> resulting in double free/memory corruption. Just call
> clk_hw_unregister() instead, leaving kfree() to devres code.

Doh.
Sorry for not spotting this when I wrote the patch.
Thank you for cleaning up after me.

Cheers,

Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
