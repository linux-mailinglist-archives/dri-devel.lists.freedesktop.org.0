Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 835BF26AB33
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 19:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C17889F6E;
	Tue, 15 Sep 2020 17:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8602E8932E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 17:29:52 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id l17so3815933edq.12
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 10:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SlyX5qFvMN3KiboyllxLciToK2Eq4o7JzV2O6OwBIsw=;
 b=jndKH7zPjuT+Yy8CprIBxo1iTRcTUheSW1BJZMKuVBjDMhYq0L3y4DaJALchKU0bWV
 /DG6HGyrAEcz92/BEzogfoheUq2NoOqWgUDoFeeALWTSjU7t6cmDtPMvcMOFw3IakuWp
 gTraMfBlRb4r8fMQ5MmQhdTGA8v2635Dv7yTHmUW7c4FifhvFkeow+fmjxnyULOz9cNa
 h1HY7N4mglhjyAyOCRnfI4Cdt1T65RO98WM5J4PiOI3ffCzhLE0AI3h6weRFWLf3hKMm
 EKJFo5+5hvJXNo5Y4rFLV8xJX6gMUJcVSH99V+Jsd8X0JKE85PLJ2LMkkl1g2xhe0pJp
 aGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SlyX5qFvMN3KiboyllxLciToK2Eq4o7JzV2O6OwBIsw=;
 b=GHcCbPOvzos+lv9givzJAH7GrNTPkd06b6GQdUuHUGwMeakfnrF39UUNI/70Gi7m+j
 92PYaM771OgX0KoIXj4eo1g95Yb0uGHfQ5INe8tPmfmoxvAK4EDe7u8dhn0D1s0jdOnl
 16zVe7BDGzk0IWowLQ+ngpK/2/b4dk0dz354i/wnntChZ6F/OTtlzxNE2lkPstfrCoDG
 tQXnukRkb0T8mCfgMrHCn7IqBE+J3MefTMkZT2oTyCezzrsDHJ/c123tfen10eu6Mlhr
 SNsrBXQ+aBLAAQAJcOpOxGSJaDSk4Tj42MHlT2ih/lhbGVoYEGs0amyrmzuVuMnumtdi
 J34Q==
X-Gm-Message-State: AOAM531JK0kgOaWNomtKUOJ5g15GonNlOTcwioX77Trj/Y/Y25p2FV+F
 VUsOsjr4sz8LILFm1WSB46WePacta/HTvJCCLSW6jw==
X-Google-Smtp-Source: ABdhPJyTXQP46Cu/TV0meUS7Ki8Jvai2uP0B7f5/avU/VxUKH5b+mSAJAXEN/96XuLNIG/fdWfb7f8IfAIdjG+sZPvs=
X-Received: by 2002:a50:e78f:: with SMTP id b15mr23870682edn.104.1600190989874; 
 Tue, 15 Sep 2020 10:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200915162049.36434-1-colin.king@canonical.com>
In-Reply-To: <20200915162049.36434-1-colin.king@canonical.com>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 15 Sep 2020 10:29:39 -0700
Message-ID: <CABXOdTcnAzFh81GuJ0Niqu6t2pF5AmwgFoXHf766XcXct_F+5g@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: cdn-dp: fix sign extension on an int
 multiply for a u64 result
To: Colin King <colin.king@canonical.com>
X-Mailman-Approved-At: Tue, 15 Sep 2020 17:54:30 +0000
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
Cc: "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Sandy Huang <hjc@rock-chips.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Chris Zhong <zyw@rock-chips.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 15, 2020 at 9:20 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable bit_per_pix is a u8 and is promoted in the multiplication
> to an int type and then sign extended to a u64. If the result of the
> int multiplication is greater than 0x7fffffff then the upper 32 bits will
> be set to 1 as a result of the sign extension. Avoid this by casting
> tu_size_reg to u64 to avoid sign extension and also a potential overflow.
>
> Addresses-Coverity: ("Unintended sign extension")
> Fixes: 1a0f7ed3abe2 ("drm/rockchip: cdn-dp: add cdn DP support for rk3399")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/gpu/drm/rockchip/cdn-dp-reg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-reg.c b/drivers/gpu/drm/rockchip/cdn-dp-reg.c
> index 9d2163ef4d6e..33fb4d05c506 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-reg.c
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-reg.c
> @@ -658,7 +658,7 @@ int cdn_dp_config_video(struct cdn_dp_device *dp)
>          */
>         do {
>                 tu_size_reg += 2;
> -               symbol = tu_size_reg * mode->clock * bit_per_pix;
> +               symbol = (u64)tu_size_reg * mode->clock * bit_per_pix;
>                 do_div(symbol, dp->max_lanes * link_rate * 8);
>                 rem = do_div(symbol, 1000);
>                 if (tu_size_reg > 64) {
> --
> 2.27.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
