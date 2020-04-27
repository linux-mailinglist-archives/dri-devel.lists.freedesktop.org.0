Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 989FD1BA58E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 15:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3D16E2D8;
	Mon, 27 Apr 2020 13:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2166C6E2D8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 13:58:43 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id 19so18863026ioz.10
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 06:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=31DWhMiN+Q5O8LjX9FMcdqbPtRnIZ8bro6sPXS/U7gw=;
 b=LxE9mN4VwaFVH57j3DYncmgT6q+BaAcbSPQZswe7GpeID08ZumAd+p0uqp6MtY2llf
 B8HP4bFZ1bUIcHZVucZQdFyjcemKxpDDwtAkVsIZ4DXVUdkHAISXUgWEdM/UIjQ9XVd2
 Ap0vnBhtIbKfI8XNL3QQI0WPkHjJzU6+7aboB8spaFwDDAA53eOA1TwKeOlWh34YwbLE
 5wLIUS05PU9Y1K9jxQ7OYBt2b/tCb/qkL095S3oG4ym4KZW0SM5/ROQlnNescBqTaYYa
 C1gG0/OvJOIihTHWTbsKNGvnGx8GVkBjZT2DuaCdci6le78e13ERfMt8XIjWqlFu4W/1
 oiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=31DWhMiN+Q5O8LjX9FMcdqbPtRnIZ8bro6sPXS/U7gw=;
 b=KpYOJ+3Vh5dcHG3UCbIvFlQkAVW/0eezeKPCL8OHu3kSbVTL/sUKDcawNTO3FTgku4
 11pjeXK9CywfFY2b6GvQJup0Cl7LbpAAy50vFtK0gIp/e4P3GKJKrs6TdorO+tGS7na5
 GSC8fd+/eEekJ5hbkPN8KQdfmXVNiuFiIU/4P31EIs61CzLZk7Euc6mUTeR4c3k9hqJV
 e0Z80su1/Fj5cYAFlDRJgL60hKrOCSjLSkqy6FXZPQh+twR5+kueIZBAkIPDnaMEhTAJ
 RSkQ92iFjd1HXP6nwFi8fVnIr6cP5Lej5d3xkGJSrkc7O5RO241P2WbDAQWdgTXCg6ZO
 yAuw==
X-Gm-Message-State: AGi0PuYeA5vlxTAMXNzgtMLuEU4JTeVt0XYL0LMsH8XO6Jp0lV0z7WGe
 5HV96qcnwNbRof7AQ6/2RlqZzeGps0BI/tblbtcU6g==
X-Google-Smtp-Source: APiQypLGCSh1bWm5z1oGONA7AQw+6ZPTuybQVogs7OuT7yfxD7VDOGvpfztvDELSWbpZzsSsX80Vh6llLUrghBS+OOs=
X-Received: by 2002:a05:6602:2e0b:: with SMTP id
 o11mr20489781iow.94.1587995922530; 
 Mon, 27 Apr 2020 06:58:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200424190722.775284-1-lyude@redhat.com>
In-Reply-To: <20200424190722.775284-1-lyude@redhat.com>
From: Sean Paul <sean@poorly.run>
Date: Mon, 27 Apr 2020 09:58:06 -0400
Message-ID: <CAMavQKLDtUjaLYUZka0hwRO4vgR_g+rF3KYvPMyCMY5BL9XsmQ@mail.gmail.com>
Subject: Re: [PATCH] drm/dp_mst: Fix drm_dp_send_dpcd_write() return code
To: Lyude Paul <lyude@redhat.com>
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
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 24, 2020 at 3:07 PM Lyude Paul <lyude@redhat.com> wrote:
>
> drm_dp_mst_wait_tx_reply() returns > 1 if time elapsed in
> wait_event_timeout() before check_txmsg_state(mgr, txmsg) evaluated to
> true. However, we make the mistake of returning this time from
> drm_dp_send_dpcd_write() on success instead of returning the number of
> bytes written - causing spontaneous failures during link probing:
>
> [drm:drm_dp_send_link_address [drm_kms_helper]] *ERROR* GUID check on
> 10:01 failed: 3975
>
> Yikes! So, fix this by returning the number of bytes written on success
> instead.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: cb897542c6d2 ("drm/dp_mst: Fix W=1 warnings")
> Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
> Cc: Sean Paul <sean@poorly.run>

Reviewed-by: Sean Paul <sean@poorly.run>

> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 03a1496f6120..21dc78cb4ba6 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -3436,8 +3436,12 @@ static int drm_dp_send_dpcd_write(struct drm_dp_mst_topology_mgr *mgr,
>         drm_dp_queue_down_tx(mgr, txmsg);
>
>         ret = drm_dp_mst_wait_tx_reply(mstb, txmsg);
> -       if (ret > 0 && txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK)
> -               ret = -EIO;
> +       if (ret > 0) {
> +               if (txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK)
> +                       ret = -EIO;
> +               else
> +                       ret = size;
> +       }
>
>         kfree(txmsg);
>  fail_put:
> --
> 2.25.3
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
