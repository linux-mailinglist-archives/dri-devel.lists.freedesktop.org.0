Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A6329CCAC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 00:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B3F6E23B;
	Tue, 27 Oct 2020 23:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC586E23B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 23:25:11 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id a6so3225090edx.6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 16:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZbJE1Rfqqra6q/0mcXCQi1RO+TgZUkhMRqKErVO3WH8=;
 b=swkDY5jUzrddATWd/jPkcERWh6Kb7gfcdfc2YLx08wkTRzug6Ormmo8wLEkGL1+hDB
 x2yqVdXzsYCG/Pvma8BkTvXDcVm86oun2r+QzXxxTjsIW20tf1HT/D4b+GKex6hmdekd
 5q44zh1yLS63j87OUTAZIdSbMRRg043zt5ZSGX2yzPE6SmaLOPPwx7NkblWpQmU2BQcM
 ElMjVygXN1xR9VMSkKZspxIoXToBgH44Tz04Gfd1J6zr9Dl0MSyWV4/3DFhYHTtngLQu
 /9zSzeHUHceyd8wF0n4jlCUXmF8rw6Iov0JE7bwQGrLPV1Cv7stMFJqkhVkI1OH/vCFZ
 KOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZbJE1Rfqqra6q/0mcXCQi1RO+TgZUkhMRqKErVO3WH8=;
 b=TuZDEXVveQG0+VvLR8P+sWpqR9n8HoMjSoew4BLv61M+lXvLhELeRRmgLe3mlfvP/c
 gu22jI6kYPY7HsVJf0LFgs23bTS1ORO6TpuTV1k9WgcqlMl1Z8YmUzZJZ41Wv60MDRlg
 PqbDnwauKj8Z72z9BHrqefqOAlk8l9GW9sUCv4dYP/UiUn5cu/t3CcLq/T47V1jeCS6S
 rR3Kr0NXs6UY/s+9CmQK+byz5LzWsAJiVChFpNJL9uCRyl8KLE8l+rrv/bevK7iv3Drs
 CVisx07l/u+t22vz9wypuYB5LxhvHBO3ATGz2+JqhzzOvWyvybpEoNV2XRkPL6As0pdb
 X5PQ==
X-Gm-Message-State: AOAM531FmpJ/rbMXxJn91XOYejoJ6jS4Hand5B65VQz1zUuPyclt7syu
 MHFevzhGiZvEGexH/Fglx74KX1NoUuASCBlnY6Y5HUtBvyg=
X-Google-Smtp-Source: ABdhPJzaupiR60nWotpW8EgU7b2sfsEMHdx/cvr3xGv/JSjK5XfDQVvoAIUQgKiGqxBkDYqhYIjOlss+ErCHZD20A4I=
X-Received: by 2002:aa7:ca4d:: with SMTP id j13mr4715053edt.119.1603841109553; 
 Tue, 27 Oct 2020 16:25:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201026131120.1068959-1-pgofman@codeweavers.com>
In-Reply-To: <20201026131120.1068959-1-pgofman@codeweavers.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 28 Oct 2020 09:24:57 +1000
Message-ID: <CAPM=9txv40=T4VACjfpWR=ut3L41aOkAuctxTzXOcfv_ODiHhw@mail.gmail.com>
Subject: Re: [PATCH libdrm] xf86drm.c: Use integer logarithm.
To: Paul Gofman <pgofman@codeweavers.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've applied this to libdrm master.

Thanks,
Dave.

On Mon, 26 Oct 2020 at 23:27, Paul Gofman <pgofman@codeweavers.com> wrote:
>
> log() is affected by FP control word and can provide inaccurate result.
>
> Fixes Killer Instinct under Wine not being able to find AMD vulkan
> device.
>
> Signed-off-by: Paul Gofman <pgofman@codeweavers.com>
> ---
>     With the rounding mode the application sets (unsigned int)log2(4) is 1.
>     The log2_int() implemetation is copied from radeon/radeon_surface.c.
>
>  xf86drm.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/xf86drm.c b/xf86drm.c
> index 50a6f092..dbb7c14b 100644
> --- a/xf86drm.c
> +++ b/xf86drm.c
> @@ -124,6 +124,22 @@ static drmServerInfoPtr drm_server_info;
>  static bool drmNodeIsDRM(int maj, int min);
>  static char *drmGetMinorNameForFD(int fd, int type);
>
> +static unsigned log2_int(unsigned x)
> +{
> +    unsigned l;
> +
> +    if (x < 2) {
> +        return 0;
> +    }
> +    for (l = 2; ; l++) {
> +        if ((unsigned)(1 << l) > x) {
> +            return l - 1;
> +        }
> +    }
> +    return 0;
> +}
> +
> +
>  drm_public void drmSetServerInfo(drmServerInfoPtr info)
>  {
>      drm_server_info = info;
> @@ -4001,7 +4017,7 @@ static void drmFoldDuplicatedDevices(drmDevicePtr local_devices[], int count)
>          for (j = i + 1; j < count; j++) {
>              if (drmDevicesEqual(local_devices[i], local_devices[j])) {
>                  local_devices[i]->available_nodes |= local_devices[j]->available_nodes;
> -                node_type = log2(local_devices[j]->available_nodes);
> +                node_type = log2_int(local_devices[j]->available_nodes);
>                  memcpy(local_devices[i]->nodes[node_type],
>                         local_devices[j]->nodes[node_type], drmGetMaxNodeName());
>                  drmFreeDevice(&local_devices[j]);
> --
> 2.26.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
