Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7919152C8C6
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 02:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D8E10E5E5;
	Thu, 19 May 2022 00:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A938113DDE
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 00:40:04 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-f16a3e0529so4903337fac.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 17:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=E9klG2UgqGoR+B4vfVoEYPmVWhZp8MKNBr28kykx1i4=;
 b=P4QbUzoNL4SuGojYBX4E1vcV57VoJT9qywb2Q7UPlZNLvEIxlOhEt8vkjcws7DXjKL
 0FBq4wA9likuzpAyIWirug8bmegBZeaE/h+yPyiB/U9zyDE3Ymvrg0sKinMECQ6P+uoG
 1bO0kQiG2p1hTzHqGJC+vpxNP4W5FjTz8+OYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=E9klG2UgqGoR+B4vfVoEYPmVWhZp8MKNBr28kykx1i4=;
 b=MqIUaSLV+PaIuYLSFdSuqGf9ZeDEcPDRKjmWReXv9HOAeJ2GYDDeEe/gwCNuWO1pxL
 zYKOlpVlwRTTAYBRvTqxoOtxDeom2dCp718eM+k3OLlpiPzYe157IIHuQV7HSs4pPIwB
 ltU8xg7R0Mw+mCU2aYASPNammLc4W8GStcJvSN39LmLuBA0+HSs+9OadstpyP+m/FFq7
 idEZsiIT0oAU5SfB3k1fdbb3ydPgxlxHrtE6LWMrpm6Xrm4KKPLZh3bC1A+GSQcF18MH
 /mkYtY9mWyPsSGgfa/r56JgXOXiABfi+LKpJjFPLWBgfTm3VXJK/iRRUxdSAh6xTFS2c
 bf7w==
X-Gm-Message-State: AOAM53187YrVz2mKUae/dPS5C2fqw+8m6r4Yz8UggSfCDrFAVNWF6wdX
 WRAES5Ihw39pNrB3DuvP8SKNPCTrJ5K7VPcgUCEOeQ==
X-Google-Smtp-Source: ABdhPJzonSJru6ZO3LeUWkbogtQydycvpfK3n/Yt5M2jS4+yt8uszcyLUMiADmES7++8Jw8dyPzqutdkAzE7g31L054=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr1318300oao.63.1652920803484; Wed, 18
 May 2022 17:40:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 May 2022 17:40:03 -0700
MIME-Version: 1.0
In-Reply-To: <20220518223407.26147-1-quic_abhinavk@quicinc.com>
References: <20220518223407.26147-1-quic_abhinavk@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 18 May 2022 17:40:03 -0700
Message-ID: <CAE-0n53Cffs82nQC3_2QADbvQm0f_7tX+NPac8rvJULYE10GvA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: handle pm_runtime_get_sync() errors in
 bind path
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
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
Cc: dri-devel@lists.freedesktop.org, quic_khsieh@quicinc.com,
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2022-05-18 15:34:07)
> If there are errors while trying to enable the pm in the
> bind path, it will lead to unclocked access of hw revision
> register thereby crashing the device.
>
> This will not address why the pm_runtime_get_sync() fails
> but at the very least we should be able to prevent the
> crash by handling the error and bailing out earlier.
>
> changes in v2:
>         - use pm_runtime_resume_and_get() instead of
>           pm_runtime_get_sync()
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---

Any Fixes tag? When did pm errors start happening in the bind path?

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
