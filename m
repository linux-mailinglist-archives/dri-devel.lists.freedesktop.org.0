Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE253ACAC4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 14:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B1E6E9F5;
	Fri, 18 Jun 2021 12:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DD06E9F5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 12:26:01 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id h1so4601858plt.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 05:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FtvRSpK7Pxq8m04Oitu7ZY1AFuH4Tsebb6LT2aC3kXk=;
 b=MMbWdywBw/P4HbxDiNgJhorMDPwOu9wbDxQ5Uxfbg0KoNzvKjyMs8UCelWuPXQi7Tg
 k/n4AgTTVfzb5mzdRIBnMQmSVgoRL2ys88LucvNZSvU/dLT3Bh2DIfiBMBkQ9iWU8vER
 fj/VU2fklavyP+QjqM/Tg8ojzn98NguHsBxR6hdokDfsEnBZp6jBrrVEUm4CWWJHaqHO
 SEn4szK6CxGwY6wc/m1TmAgaKYSDE/YtLenunwh0/MptBc9wkkjEUH67PWtZtrmSzKy+
 c0JuOcpbhfgUt4c3DPoxtfCpH0Hlg7iYMrHAnlLv9qg+aXSYiZ45mKlH9Icqv+IuALpA
 pg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FtvRSpK7Pxq8m04Oitu7ZY1AFuH4Tsebb6LT2aC3kXk=;
 b=Q4/NEM3GV2WxrUfk0QSCc5N5NSYvNKGydftjNsm3EkjZX8stfLBKXM4BqtCoKzXjCC
 jLvxJhxSvWr+VKS6XWTvurozJmwU+cO0z0iPxINW+l/4iFHx1CFSNaKF0ev3gLG4lDlJ
 KaBKPyqKxNAeAWzVoy/b0QwOEa1n+AMQ4KkRwHvpMp37svpzsxmBrhvtpmGxBj6ePYxx
 o0/84M9mxzyn0sOzYEb9hAhfdry8K4W1plV+EHcL/2h2DmWclu0WcxojS3upZ0Pyl0Ed
 TsCncBDkYtkXoAJ04CXRWt79HCsJi1GsC6R3NBPxHm/+43NGbHKEW9sEgHg8lDzCW72g
 L2Lw==
X-Gm-Message-State: AOAM532UvpKcxwU/VXkFyma/Ym6p36Aq+CUoDUbCsTRflqQIoyqfogAc
 1yb+6j+r0VyHjBPcx33Q8iulPBoE3zPo44W8qlss+g==
X-Google-Smtp-Source: ABdhPJxmtC/wiE6zI2cJLpRdGM3FaqouAZvoriEKYQhaiLJ8O/RWEvL+Xx961UWRC3wvThhX2uahmDye4vjmobAhwOo=
X-Received: by 2002:a17:90a:c394:: with SMTP id
 h20mr14178061pjt.222.1624019161098; 
 Fri, 18 Jun 2021 05:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210615032937.2328468-1-pihsun@chromium.org>
 <CA+Px+wXsb69fyQ41aX9T0jXzKFoF+6Y0zO+QJcLkxfTJJNa1hQ@mail.gmail.com>
In-Reply-To: <CA+Px+wXsb69fyQ41aX9T0jXzKFoF+6Y0zO+QJcLkxfTJJNa1hQ@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 18 Jun 2021 14:25:49 +0200
Message-ID: <CAG3jFyvNzgmpNYUi0EWocdn9enjNJAwpdBRZEDbL1afTM=59LQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Make hpd workqueue freezable
To: Tzung-Bi Shih <tzungbi@google.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixed checkpatch --strict issue and pushed to drm-misc-next.

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=f03ab6629c7b410d874151cf1d8570899a65fdda
