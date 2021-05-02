Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB483711AE
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 08:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8FF6E876;
	Mon,  3 May 2021 06:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F1F6E5A3
 for <dri-devel@lists.freedesktop.org>; Sun,  2 May 2021 23:04:21 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id gx5so5163447ejb.11
 for <dri-devel@lists.freedesktop.org>; Sun, 02 May 2021 16:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=groRywuNlEF2UBp2F0MI+2GBRzz6sWwtdyxWNmpmmRY=;
 b=XlDPMzJXgrzyFIiIUejSgpr8siSc/rwclMr+de4rxvXJsRPZL9PIM7tbmtGascXm2n
 oVfjQqFS/OXhX1J3QXgr8i/yhufjyXvVrdlGN/vjcVPguwxgyCBBbiUitB6idSZy7RtX
 UUXg0ed+ZJF8e0VHN6v5VswddIAOVhHQn5wmXllUoRvnme867D4/+F/pvUAvxN6p+oZh
 tq/H/SyQO6ZaY0wWpnbjLEpfnIy2KdmNZtDaTv/+Sh26sVrQ1xjVoYBhV/Fi8xumHqZd
 TNEsfCmh9XyXZjF/bh8TWZaMAuEEu5P3oDFfhoy9rjHjMSM2abTsLsgPcQoDmxS7IqGR
 DjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=groRywuNlEF2UBp2F0MI+2GBRzz6sWwtdyxWNmpmmRY=;
 b=sh/DQL13Rk51EuAEv9GuqoZL73u9MsJyPqoBQ/CfA5kzHrMZzcKoqNkfv4tL2hsJdy
 3W4OkwLoBqsQs6juWA6W2sMVCiJHkU0EvR5mV533qMoL+VIRmv8Vikm7pqi6WecTbluP
 RULmkxrSU4mioKJMWJ2M6ZGY/QJLxF4eCnO438m223e/1q16IwlzY88d/HRjBiuCzFjx
 zjk1OxKQhA8beNraLoBtHnLIqNmOoLay/9/z0dBnd05L8sLU+m8jNxKbhLlUw7V+wNE2
 SP6l4RDhdRp5ufMjzGdBvPt9EKQmx31vVD4BBwFTVdKDxe6GI8mtWfdq3tBoW51P3+/A
 vDow==
X-Gm-Message-State: AOAM532GR6tia3rHuYgeEEQpJsnjX4Vd6d3bKYDWpRcqRdPWKhf/M+xZ
 hJLhbFuGkgkN0Go3HR2Qtiq7R8Mn5SQnpAwNNts=
X-Google-Smtp-Source: ABdhPJx+3/RZteOj6iiJHEdVbJAzXt75ZO0LERj7jXAZI+xt67C1ubzHFuEe4f2afzlwisHDLxFMnwvdAptTlOq+hZc=
X-Received: by 2002:a17:906:57c3:: with SMTP id
 u3mr3607793ejr.162.1619996660335; 
 Sun, 02 May 2021 16:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210430082744.3638743-1-narmstrong@baylibre.com>
In-Reply-To: <20210430082744.3638743-1-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 3 May 2021 01:04:09 +0200
Message-ID: <CAFBinCC5piZDgyxezJp8Yi3Ny5B6WRD-XdWN7s2gm8_aqza=fg@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: fix shutdown crash when component not probed
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailman-Approved-At: Mon, 03 May 2021 06:40:10 +0000
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 30, 2021 at 10:28 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> When main component is not probed, by example when the dw-hdmi module is
> not loaded yet or in probe defer, the following crash appears on shutdown:
>
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000038
> ...
> pc : meson_drv_shutdown+0x24/0x50
> lr : platform_drv_shutdown+0x20/0x30
> ...
> Call trace:
> meson_drv_shutdown+0x24/0x50
> platform_drv_shutdown+0x20/0x30
> device_shutdown+0x158/0x360
> kernel_restart_prepare+0x38/0x48
> kernel_restart+0x18/0x68
> __do_sys_reboot+0x224/0x250
> __arm64_sys_reboot+0x24/0x30
> ...
>
> Simply check if the priv struct has been allocated before using it.
>
> Fixes: fa0c16caf3d7 ("drm: meson_drv add shutdown function")
> Reported-by: Stefan Agner <stefan@agner.ch>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
