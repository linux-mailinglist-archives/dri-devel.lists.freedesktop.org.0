Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A972C40E0A4
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 18:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D366EE34;
	Thu, 16 Sep 2021 16:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3C86EE34;
 Thu, 16 Sep 2021 16:24:38 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id b18so19234358lfb.1;
 Thu, 16 Sep 2021 09:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uCbvTsHrDfqrbHo7IDUZ1BawMYMw+OHW2eckD6leFrw=;
 b=SKdjY5FEaQ0GqG9e7SUgo3EJSdJ9cBYQfxQTaKIHYZlyV4GZikhSGj/4oOjIDWk5Wb
 Edk0aD9yZxW1Ze/5veona7v7EhD0rk69CslNznNbGzx61hz2Pnu82abABw8+gqdSHsoT
 geqFzAv+UZ+DCqHZE2jBeRQkVdl1JC5M9HYZ73S/dwMHkj8W+elzP9reXkaAQm5L8aRK
 woMVia+kvmYjfmJnGUoYgxOT+SNPICULOARPEM3WmqSK5XZdr0ZwtEFcT64NtSoGNBYc
 LS/a03kc0rRbDgV+YeV/gf6C3oBkmriTLlTZzXCedGAMrtxGX30oMRzS90xOUopFT6P/
 M5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uCbvTsHrDfqrbHo7IDUZ1BawMYMw+OHW2eckD6leFrw=;
 b=LGO0F7fOzA9UqZOCRv40u1UV02qqVDodLNR1hLLluwoHIh8dCXgC0BnyYOt85Q3fQx
 vSr2Hel6jtst04A7uObDiDwh7HKBzUDi7HPPCJ4MI3Z/esQ48D6x2yG0eBExcv31M/3r
 ZcNrnDx3pw9cfRtOEVQjL6X5BcIDLzOKsqo7Lp/Zvnonw14tS7APPX3gbXMD5p1zISCu
 prYEZiReFdJ42gAApqJcFE/FJqWKXRQPZWGcgdvfGlUp2eljZPNVlG51eHRnOGjuBxOd
 HV6mYxI8eL4NUGE/6c8s9juUhZJtlVcDMB1MQ5Dg/K+RHRIOQ84blmoaMG35gm2FJDOm
 E+wg==
X-Gm-Message-State: AOAM531BVl3vyQPhBMuIw6yovZY+r4Y1eXDRKm1D+S6s7Id5jTOXXbY0
 6zN9VYLYIHPQ0e8o6/P4twMHmxeEVPioxp0tq2Q=
X-Google-Smtp-Source: ABdhPJytnDVsosxCMngJE5yp0mRR8F94qT0u4e2mWXWm3g/0VWW/3nL+Ga0NESVIvac7i3Nkv2XPSJi9VgDnP2OqOq4=
X-Received: by 2002:ac2:5d49:: with SMTP id w9mr4596739lfd.450.1631809476327; 
 Thu, 16 Sep 2021 09:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210914174831.2044420-1-festevam@gmail.com>
 <96038e06b1141ad3348611a25544356e@codeaurora.org>
 <CAOMZO5BzU3_x7nb8sEF_NDeDOxYM0bQLEpbRzv39jayX=fudYg@mail.gmail.com>
 <5409ccef7ee4359d070eed3acd955590@codeaurora.org>
In-Reply-To: <5409ccef7ee4359d070eed3acd955590@codeaurora.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 16 Sep 2021 13:24:25 -0300
Message-ID: <CAOMZO5CgFFmKmKF0C_1okmu7N24=udevT3LE=0bRoZqUeDQSWg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: Do not run snapshot on non-DPU
 devices
To: abhinavk@codeaurora.org
Cc: Rob Clark <robdclark@gmail.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, stable <stable@vger.kernel.org>
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

Hi Abhinav,

On Thu, Sep 16, 2021 at 1:15 PM <abhinavk@codeaurora.org> wrote:
>
> Hi Fabio
>
> Thanks for confirming.
>
> Although I have no issues with your change, I am curious why even msm is
> probing and/or binding.
> Your device tree should not be having any mdp/dpu nodes then.

The i.MX53 does have the following GPU node:

compatible = "amd,imageon-200.0", "amd,imageon";

That's why it probes the msm driver.

However, i.MX53 does not have any of the Qualcomm display controllers.

It uses the i.MX IPU display controller instead.

Hope that clarifies.

Please reply with a Reviewed-by if you are happy with my fix.

Thanks
