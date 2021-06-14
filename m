Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 688A03A6E95
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 21:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9567B6E03B;
	Mon, 14 Jun 2021 19:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13366E03B
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 19:09:34 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id k189so4393241vkb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 12:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uMc4URnnV+tfXvNhamKWfB2liJJVFr5aYUr1EsM52gA=;
 b=tiKwMdAaMX3CQD5jTxTChA0MD3dY/jEv8DUJFllkv59ExYYvlbiw3kXxGb7/PN0gkH
 kt0rlzo0k+xB/ol8V+Gwx/CIW1KIEr40B5NxaGGDPQh4QmB8O2zvUCs9sMAOervWV5QU
 jmXeCa7C8zFqEzkESA32yxjXRePmNFbStsAe7yulacEN85HJWKd5/GGfgtdejSHiWgXN
 5Ji4Ia+M2zaVyvO3w7WP9ofssgfOfQ9rDTg+fWZO1BrOLdWwZ1XCScm5dpjTyEIZseI5
 b9yoiIoo7P93rKELTQPxXqQOdeFyVFuCuObfAhnpWHer2MKf5+/gTpJY33q+gpgkkusw
 3nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uMc4URnnV+tfXvNhamKWfB2liJJVFr5aYUr1EsM52gA=;
 b=AYUYrGH/mqa0++8jNXedDZzpp0YXVUXX81aso8F+rWL7IUquRjiXcMCr7JOlJPUNM0
 kx7vS8iTk+pKB1nzXu1/EIp5JpoOzUgu6kHm6CNc1EooULdtB8FtEIQIi6zRfKP18CQv
 hEjD8wn7pNv/oe6/Nfp7Ipms+16+Q/tnIR1wE4CeUTCsxvN0AvyI5UhPV+oZIDBnFazc
 vyxm6tyd1PI+b2A32K2Z6NvKRMsQofrGWZ/wUms1HASpd6sVYdWyWncoA6QfHc8gNLIy
 26TVjuZ3go86aIrNpCtkmOFoEJtOfB+MIxLkVx5HyiO+9q/Tt/QDxGuZ0dNw1Oi0DKGG
 QS0A==
X-Gm-Message-State: AOAM531tDlbTm2wHrMmKYPEMBbOw7HiPq1DiHMBaY5pqXJrcd8XCu1AQ
 1TOJamMspFrHTMz+18SogGeeWjtjUgY3ubh1yO0=
X-Google-Smtp-Source: ABdhPJxNPk2Ta8ZZVvy0EEGmzM9l4SHEbYT66VTYgFz6piDBUXdGTwFY1Ytf6VseBiX971f4q0QCfFpWPyVZyaci6ek=
X-Received: by 2002:a1f:4594:: with SMTP id s142mr542586vka.16.1623697773669; 
 Mon, 14 Jun 2021 12:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210612125426.6451-1-desmondcheongzx@gmail.com>
 <20210612125426.6451-2-desmondcheongzx@gmail.com>
In-Reply-To: <20210612125426.6451-2-desmondcheongzx@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 14 Jun 2021 20:09:22 +0100
Message-ID: <CACvgo50kL=0dz6Jpt5BDLXYq+XTMhMy9=Pu7qeqDmsy_bgKsdw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: Add a locked version of drm_is_current_master
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, skhan@linuxfoundation.org,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 12 Jun 2021 at 13:55, Desmond Cheong Zhi Xi
<desmondcheongzx@gmail.com> wrote:
>
> While checking the master status of the DRM file in
> drm_is_current_master(), the device's master mutex should be
> held. Without the mutex, the pointer fpriv->master may be freed
> concurrently by another process calling drm_setmaster_ioctl(). This
> could lead to use-after-free errors when the pointer is subsequently
> dereferenced in drm_lease_owner().
>
> The callers of drm_is_current_master() from drm_auth.c hold the
> device's master mutex, but external callers do not. Hence, we implement
> drm_is_current_master_locked() to be used within drm_auth.c, and
> modify drm_is_current_master() to grab the device's master mutex
> before checking the master status.
>
> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

-Emil
