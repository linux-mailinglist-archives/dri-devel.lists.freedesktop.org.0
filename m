Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5E9486F5A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 02:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3303A10EB4E;
	Fri,  7 Jan 2022 01:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387CA10EB4E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 01:01:19 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id q186so740248oih.8
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 17:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=3aLFLMZ1Dseun6uKJsc+bIv6lNMMhVYnO4Fayb77aRM=;
 b=NxvMKXyNXfvk+rvWfYW0hDKZJBK+pV+TtVJQHw8pxC6E5YX3AZMTgBu6COF2P7QKml
 6FDsuzNJszwb7bxzl5yIg6LlkSUDz1UosIsalGR0Cjn5Kw3T1nq1SoAADDOuA+N1tPHi
 odAFwsmI7e4dr4RoVf5DBNlkKqBMqZ3eNHqkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=3aLFLMZ1Dseun6uKJsc+bIv6lNMMhVYnO4Fayb77aRM=;
 b=LwineQQQt9efLHgHhgzc8UHJ5upw0UBmCTFn/ZQpUJ0etFsVe3+N5YfjgXJwYtl9sN
 1SCrj9CmYJVslHBTpENdAMNXktfcZSv1OmEifGumC7qhIB3+oILwS/uZfU0POFxhDE0z
 aHTliqXuBV22S8kIfwPAYQXe6Y5c+KSzo329+UlzjrKZUMRGkDNS6jL4dDCagVRfXMF8
 0XiDyBhlyTrMtQKhZcKptjQ8HFuxgUhS4vksuVUTpQNSFqgL91vrFzNH1kIMZtiw3bWQ
 haf3+cbX/AMRrCtuBoJ01fjjI2ZP5UaUHlbZtPsofic3KGIaDTVvUfyAmQuMhVlUSBtK
 vISg==
X-Gm-Message-State: AOAM532jCZZ3q+xxR3ywU620hR9L/pAqU47xMkxa+Gmg83QgfqJzVq4E
 4vJdmcxhUPCGQHLDKe+JO5hFNJij86GV+APbUAJK5Q==
X-Google-Smtp-Source: ABdhPJzcj89bg7jDGE1SBDpxPgTR5nriTuyXnwlH6PAIRGs4WgjJmMJh/5xLxeMSC/JOUdGDGYwVEv190lJt48jFdd4=
X-Received: by 2002:aca:4382:: with SMTP id q124mr8123351oia.64.1641517278523; 
 Thu, 06 Jan 2022 17:01:18 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 17:01:18 -0800
MIME-Version: 1.0
In-Reply-To: <20220105231031.436020-4-dmitry.baryshkov@linaro.org>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
 <20220105231031.436020-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 6 Jan 2022 17:01:18 -0800
Message-ID: <CAE-0n50LfC1GqM44rF4qnGP7dJEcXEjs5DQf9Kp1ErmGdJ9C0g@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] drm/msm/dpu: get INTF blocks directly rather than
 through RM
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-01-05 15:10:29)
> INTF blocks are not really handled by resource manager, they are
> assigned at dpu_encoder_setup_display using dpu_encoder_get_intf().
> Then this allocation is passed to RM and then returned to then
> dpu_encoder.
> So allocate them outside of RM and use them directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
