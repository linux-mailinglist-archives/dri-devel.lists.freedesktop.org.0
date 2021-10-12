Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 538AB42AAE3
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 19:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A5E6E99A;
	Tue, 12 Oct 2021 17:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6866E901
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 17:36:31 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 g62-20020a9d2dc4000000b0054752cfbc59so321351otb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 10:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=2BypScO76h55G7PPwXnggV0DBtGQ8bEd9vyWr6bUXKE=;
 b=Wk+QXyGeOJld76njFrWWdXYkW3GKfTQ/CyXWZkUGzuyWPJX+Pi+MoN3lO8gWfd27YA
 XEPw4irp+IJnOtcZz29Vo+/QPkJ65ex8DejKLsHs3fsas3yab01i91K14MykMq+BJyb+
 qrZxf95YrZgFCXZtjSdsJwzrWfJKTTJPnuGOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=2BypScO76h55G7PPwXnggV0DBtGQ8bEd9vyWr6bUXKE=;
 b=8A/vv+o20361JZE7WhTfHuoNcsPlNOdCtTkuKTJemlOMgCLDWompQgEcQ/ccF6ZgZa
 E/HeJ5mzCYuBeUMYqdxNq3WVTwrRuinOgCGZmA/+MZVaA7iL/5xQC2hemlX27lt3d6zy
 n6vzHd5naizWBn4ZIz5EHmimoqFVU608QghhXPgAtoe0vqXfk9tJ1dA0gvbWwm6ztGhC
 5Ggphv6pqebLRrUyBrvCQFdnWkrmv/JN0XQJiP25yqNKufcIv1dcZStnXfi1tifm5DyD
 zTC1BTGB9oRRkZ4qdi51EX1Cyts40IStfzSB9gVQO+g5oBzbqXgAhgyHAdhWTmB8akxJ
 Xkjg==
X-Gm-Message-State: AOAM530cbyAtaz+PT7vz+F/+dMetcJINfkHlxdIHYWMhXBrp1/AW2tAW
 B9x/lCN/dVZLqPHJyMQjpWlHl5T0Ng8UgOlXvMUmHw==
X-Google-Smtp-Source: ABdhPJxNOhgeqTAMjp5PAp6NyMFEPhaSaElT5ghTzkghPyWvKz0oqRQxrlR4ntBvFAX5KBLIMoaGbJbsJGSY5ELjd44=
X-Received: by 2002:a05:6830:2317:: with SMTP id
 u23mr12874222ote.126.1634060190606; 
 Tue, 12 Oct 2021 10:36:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Oct 2021 10:36:30 -0700
MIME-Version: 1.0
In-Reply-To: <20211010030435.4000642-1-bjorn.andersson@linaro.org>
References: <20211010030435.4000642-1-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 12 Oct 2021 10:36:30 -0700
Message-ID: <CAE-0n51CoX131DsDWZUxWoCu6c+HEm4HbK=SrKraqhDqFkc6ww@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Use the connector passed to dp_debug_get()
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Quoting Bjorn Andersson (2021-10-09 20:04:35)
> The debugfs code is provided an array of a single drm_connector. Then to
> access the connector, the list of all connectors of the DRM device is
> traversed and all non-DisplayPort connectors are skipped, to find the
> one and only DisplayPort connector.
>
> But as we move to support multiple DisplayPort controllers this will now
> find multiple connectors and has no way to distinguish them.
>
> Pass the single connector to dp_debug_get() and use this in the debugfs
> functions instead, both to simplify the code and the support the

s/the support the/to support the/

> multiple instances.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
