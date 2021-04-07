Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 508BB356772
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 11:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73EF96E8E6;
	Wed,  7 Apr 2021 09:00:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9EE6E8E6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 09:00:23 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id s2so13201157qtx.10
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Apr 2021 02:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ku8OglXxTNGGbHHWxcDhFtMWBJ7gtdpe5IAmLvPb6lg=;
 b=kkQOW1FEjeAuK4pSRWDAdhG6BTn98oaYU5CXLmk5LoQRxwLgIFMtcfz+yNOUKcVezU
 wp5fJQIdGN4hXvwFGYOhgvrc5dNVPvNvgN1fNEnOZoQZwLIqWZ5UOfnnOHYkUeWkej++
 h+HuMRIFphgMWtV6QRs0aBrXTKqZCAPcEBXdxYmjPMruEDSC3P0K6D0eGjsHHmSmW5iT
 3eB0xKzkF0Iu7CWkfeuSj6Imeg9AdH5nW1g/6/voQLnt/FSWuit973ZZw9Q6Q9h9Uvg+
 pmiOFE5J6hAzTc2AguIoltt9XtP/o/ScTdlw9kCgacNjhDWxFf9gQVVgWLqTSPsa4Shb
 x5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ku8OglXxTNGGbHHWxcDhFtMWBJ7gtdpe5IAmLvPb6lg=;
 b=UvAo4Mij3KmlilM3wuhrH8pWxJJLxZ71nJi9YzzTTxLRV6H+zogYluXGyH73tH02Vh
 r/w9+3ZHK48ogx/9vgCMTjbO9pK7OGZKqP4CAeluyRspP/yPAJnrAaPQxkXNWCTFsV5o
 IbIHE5/2iRKGMblBXLdv5gQh6y+HGCjOQCfkJFEhVlIr2/HiR7+igv5uKot6VbkPctxz
 xWITv/q0XYt26rBmieq/ZXpKivRJa3eFmVmj1zv3+N/WVJM+FAMDEj8p3tHkMRx4bkdE
 BEdKT91kBTFjdRtiQTu10wtmz/RX8zDChDOhDVCQxQbKG50yV0wSpCJlcUYbO1/tCjb0
 emFw==
X-Gm-Message-State: AOAM530Hq8KgxykOXd2RaG7Q/PQZWtTIhCpB4pWRpARJx9veE1rSbXLe
 pbEwJJvPOqMI3ht2YKgiDhx3NJRMDbiYrvGFC3HLbA==
X-Google-Smtp-Source: ABdhPJwpVpHl5AgfUWWZ7rFE+fTLLWSBLG47+bo0fY9bos4oOj4bPlOhokymeav3cksyRptLE/cPLlYDQRqm8B0+fp8=
X-Received: by 2002:a05:622a:1716:: with SMTP id
 h22mr1818569qtk.273.1617786022398; 
 Wed, 07 Apr 2021 02:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 7 Apr 2021 12:00:11 +0300
Message-ID: <CAA8EJpr7MazgHfL0qQiqfXvRn8T+ExnGhn-QFa1Np-fBhXn53w@mail.gmail.com>
Subject: Re: [PATCH] clk: fixed: fix double free in resource managed
 fixed-factor clock
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Daniel Palmer <daniel@0x0f.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 7 Apr 2021 at 02:06, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> devm_clk_hw_register_fixed_factor_release(), the release function for
> the devm_clk_hw_register_fixed_factor(), calls
> clk_hw_unregister_fixed_factor(), which will kfree() the clock. However
> after that the devres functions will also kfree the allocated data,
> resulting in double free/memory corruption. Just call
> clk_hw_unregister() instead, leaving kfree() to devres code.
>
> Reported-by: Rob Clark <robdclark@chromium.org>
> Cc: Daniel Palmer <daniel@0x0f.com>

Forgot:

Fixes: 0b9266d295ce ("clk: fixed: add devm helper for
clk_hw_register_fixed_factor()")


> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>
> Stephen, this fix affects the DSI PHY rework. Do we have a chance of
> getting it into 5.12, otherwise there will be a cross-dependency between
> msm-next and clk-next.
>
> ---
>  drivers/clk/clk-fixed-factor.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>


-- 
With best wishes
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
