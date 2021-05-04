Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B81837251E
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 06:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B776E1B1;
	Tue,  4 May 2021 04:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025396E1B1
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 04:32:39 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id k25so7622778oic.4
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 21:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=a37uZcs6HgM1/vP3znI4pHBE2+32UeBTKsWjif6oY20=;
 b=bMJ1UxfO8SLLcF5VTUyHFMK6yyvLdYtQ0+rOu6/p/CMzJ3IUKOip7iTYuaSfoB9zTt
 Le4Vxr9JFqv/14dflPJkUPSE3NC4BwMvFEMvRrOOC5Aiid0aUh0DhEOQquSbuD0SELUz
 J+EjSurLkZGwqtJHC/vk9B7NvTv13FibmmtdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=a37uZcs6HgM1/vP3znI4pHBE2+32UeBTKsWjif6oY20=;
 b=E+V6VyfvMsvV/3dFL00OvMvTEieLgcWRRYoGhwH/pcYYOLeezbM4iQdYlw6bjmyo4H
 pBE8KkUT5SKl8xu9JX9/+G/5Z85HFpI7UIOfb262zpCn5cN/VtydcXiPbizQAIYM6vKf
 be4Iu0K3xsFsbFkCzxgvcgt5Qr35pECeduVCMua6fXFuNP0v4aYLwy9uATJBuwz4749T
 l8xzr5LR7t9WAmE+ILTsjE6OHm4TkWauE+2Ni3wmQIEVBYTssmpKqMgoYW4YLtsjpCa/
 4nuBPhzeFqcpMHxg1oQwWKqCYiaS5b30pVGdpjtlWQSkPgzlsTZ+YF2rmj1W3cgO5AM0
 ++1Q==
X-Gm-Message-State: AOAM531zf4q3rN0wjyHvJRkk1M1kZe24hEvTYcKEHAtNQyHNpUy2VWTW
 XEdQyhSKZ2AKb1HOHkEbLUpd19EoHGMEJ3XbZjEZ3g==
X-Google-Smtp-Source: ABdhPJwxC4sqafnYqb5HJOdhvJmLXHvqL+OU/If/hOekFCKccr6eGMJfx7S38QhGYX+BQMD+ABjT7LsntzFbiFW0+Kc=
X-Received: by 2002:aca:2311:: with SMTP id e17mr4215692oie.160.1620102759239; 
 Mon, 03 May 2021 21:32:39 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 3 May 2021 21:32:38 -0700
MIME-Version: 1.0
In-Reply-To: <1619048258-8717-3-git-send-email-khsieh@codeaurora.org>
References: <1619048258-8717-1-git-send-email-khsieh@codeaurora.org>
 <1619048258-8717-3-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 3 May 2021 21:32:38 -0700
Message-ID: <CAE-0n53Qb6+Epzf=1MfbqphApos+bMpi+OSDYfdVXPbyfMCMQg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] drm/msm/dp: initialize audio_comp when audio starts
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 abhinavk@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-04-21 16:37:36)
> Initialize audio_comp when audio starts and wait for audio_comp at
> dp_display_disable(). This will take care of both dongle unplugged
> and display off (suspend) cases.
>
> Changes in v2:
> -- add dp_display_signal_audio_start()
>
> Changes in v3:
> -- restore dp_display_handle_plugged_change() at dp_hpd_unplug_handle().
>
> Changes in v4:
> -- none
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
Fixes: c703d5789590 ("drm/msm/dp: trigger unplug event in
msm_dp_display_disable")
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
