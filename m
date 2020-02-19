Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E54821652B7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 23:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B9C6E889;
	Wed, 19 Feb 2020 22:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A2B6E889
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 22:51:49 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id d10so2117194ljl.9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 14:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qF+TpbZHrOUGgQZVKOV7JZekNV17t91t70D78UaeuV8=;
 b=qE0lGCYEV/tXSremxFtO+b+1kn4LhCpKcL0pKd+sbzRFgl9GsEEDGGR2mBR7igtDgm
 8hVsj9f55arrsH3V4lKT7BeGkN2EPQrMlGnp+oqflal0Nx2+apHfIwyohwS/RWfEAZyR
 pYDsC2a0X2pJCRiiAOZPpnhbP8VG/bnBMxeVJOOZFHg3yUo1PKkkKAcOxfi5j5cslOk5
 AU75vS7GFewOBoyz1/NNBPlXp2seG/oVoDbDJDWC2eduZ8U4MD3T4ptt/32u/p3gvk2+
 fPemF52qrudx4/VNDAtZ9jDG8kYF5mlxjy7ySceAV0NUlXxM5WdvpTlDVlkM5yppHAeA
 NT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qF+TpbZHrOUGgQZVKOV7JZekNV17t91t70D78UaeuV8=;
 b=En8k10gBdilxUiPmaCwHnCgPOBmrpPHwdEK4O543wvsq8to+LMQKjgXz5WFjkA989S
 psKdwgCTjPVS7Tyc7WLkKIDxxPj8w81Ix1LyHMySP3vhBxvYdI18+p+AXiCxi2hiyHhX
 QWbVESnzdIFl5wbz67zlc4ZdJHlQeyd+j8qMkYzNzhmwTHAcufkL9zQuvUymaY4/xXLX
 SjypShVvX/SHcyA09bR3RMlS99jJIrasw9gg8Ju6fw4Nm4yb+FIY6aNkMPWq8jzscft0
 7LYg4ZHNC7OHQB0yQ2XlxhVBjKp2CqnRFcQtZMImUgLbvJti5gtQ8AAaE92FDgOYtCNu
 +iNw==
X-Gm-Message-State: APjAAAWh4yj67sDe5/+g4WEF4SFpWAABD7cymTgLc3Khx5xaiOxOOQv5
 cQfLIuijkZ4dwk7aA0ni934G8VTbBR8tf9ByXrAG4OHrpzaqtA==
X-Google-Smtp-Source: APXvYqxzBylDBrYSY6Fo3SoinIImzJQsM7dJ2yDo7/RG1hZiJWszXYIePRhb84fn6Fc+TKHWfSqdrs8ymxAOohv4gaQ=
X-Received: by 2002:a2e:9a51:: with SMTP id k17mr16119136ljj.206.1582152708042; 
 Wed, 19 Feb 2020 14:51:48 -0800 (PST)
MIME-Version: 1.0
References: <20200217153145.13780-1-james.hughes@raspberrypi.com>
In-Reply-To: <20200217153145.13780-1-james.hughes@raspberrypi.com>
From: Eric Anholt <eric@anholt.net>
Date: Wed, 19 Feb 2020 14:51:37 -0800
Message-ID: <CADaigPXfS4o-QQVPsp1axNz+hAATJqA-vzupC0VRWceJNEZNEg@mail.gmail.com>
Subject: Re: [PATCH] GPU: DRM: VC4/V3D Replace wait_for macros in to remove
 use of msleep
To: James Hughes <james.hughes@raspberrypi.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 17, 2020 at 7:41 AM James Hughes
<james.hughes@raspberrypi.com> wrote:
>
> The wait_for macro's for Broadcom VC4 and V3D drivers used msleep
> which is inappropriate due to its inaccuracy at low values (minimum
> wait time is about 30ms on the Raspberry Pi).
>
> This patch replaces the macro with the one from the Intel i915 version
> which uses usleep_range to provide more accurate waits.
>
> Signed-off-by: James Hughes <james.hughes@raspberrypi.com>

To apply this, we're going to want to split the patch up between v3d
(with a fixes tag to the introduction of the driver, since it's a
pretty critical fix) and vc4 (where it's used in KMS, and we're pretty
sure we want it but changing timing like this in KMS paths is risky so
we don't want to backport to stable).  And adjust the commit messages
to have consistent prefixes to the rest of the commits to those
drivers.

I've been fighting with the drm maintainer tools today to try to apply
the patch, with no luck.   I'll keep trying, and if I succeed, I'll
push it.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
