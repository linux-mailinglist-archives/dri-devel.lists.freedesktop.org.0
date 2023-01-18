Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C58D66713B9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 07:16:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C0810E688;
	Wed, 18 Jan 2023 06:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8662310E688
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 06:16:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 30FD2B81B03
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 06:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A91C433F2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 06:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674022599;
 bh=UwDrflLC3FnHhtmPCYNvGd2FW7baUtXIew3FXdZo+uU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iJp7IVhBXD7Qd6VSgAlxZqPEnCsJ6kuEnfgtNG02mGXXEGMXAJGvTHmRyAZ3n41RQ
 JUaQUP2ZN9YtyY2xS2t+op3XAn0m6YJ3mds4Q9auIZW/22rpIiT8oU/nei2aEucRHS
 1n2fnbiB9U+wVH0VIMWkLvf4cBBWsPQoh+CZP9QsoHro7bU3j5H8v7gB9vEFfsaODC
 auSyaG11puHdeLC13YTzWgVZGgQ+6JOTe7TClGp8MU6BVgEzW9Rlmt3iFCJniYjBPX
 rv/hitGxQdO7neLaJt0uVMvzHj1uRjZSz4Aj5HET0vvrz9ktceCagyNV3Fxi8Hc3UK
 iL1fZJs1xedrQ==
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-4d59d518505so285638697b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 22:16:39 -0800 (PST)
X-Gm-Message-State: AFqh2kqHerJjQY8BwRYPrScdNrQ8Y1yikQgCXsYouMlD5WwCtWik7TlZ
 tGNeBKUIppTECI2q9LiR5wlDOxj0dkeyaupUFzw=
X-Google-Smtp-Source: AMrXdXsprXsdmmOoyhcSQ4I5F8JvAF5EchcdIAoScHpU8NW4WM1OYrCyTzCVz3DYpKI6+11iWSXbcKxQcLncdwBI1Ng=
X-Received: by 2002:a81:558e:0:b0:46c:3be1:f0c8 with SMTP id
 j136-20020a81558e000000b0046c3be1f0c8mr963100ywb.135.1674022598887; Tue, 17
 Jan 2023 22:16:38 -0800 (PST)
MIME-Version: 1.0
References: <1673977558-7648-1-git-send-email-quic_jhugo@quicinc.com>
In-Reply-To: <1673977558-7648-1-git-send-email-quic_jhugo@quicinc.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Wed, 18 Jan 2023 08:16:12 +0200
X-Gmail-Original-Message-ID: <CAFCwf10mAFEJNkZCNBuzz1_dAOP2fgEXU2M2okkq77PTa0MWoQ@mail.gmail.com>
Message-ID: <CAFCwf10mAFEJNkZCNBuzz1_dAOP2fgEXU2M2okkq77PTa0MWoQ@mail.gmail.com>
Subject: Re: [PATCH] accel: Add .mmap to DRM_ACCEL_FOPS
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
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
Cc: jacek.lawrynowicz@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 17, 2023 at 7:48 PM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>
> In reviewing the ivpu driver, DEFINE_DRM_ACCEL_FOPS could have been used
> if DRM_ACCEL_FOPS defined .mmap to be drm_gem_mmap.  Lets add that since
> accel drivers are a variant of drm drivers, modern drm drivers are
> expected to use GEM, and mmap() is a common operation that is expected
> to be heavily used in accel drivers thus the common accel driver should
> be able to just use DEFINE_DRM_ACCEL_FOPS() for convenience.
>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  include/drm/drm_accel.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/drm/drm_accel.h b/include/drm/drm_accel.h
> index 65c0affb..d495506 100644
> --- a/include/drm/drm_accel.h
> +++ b/include/drm/drm_accel.h
> @@ -27,7 +27,8 @@
>         .compat_ioctl   = drm_compat_ioctl,\
>         .poll           = drm_poll,\
>         .read           = drm_read,\
> -       .llseek         = noop_llseek
> +       .llseek         = noop_llseek, \
> +       .mmap           = drm_gem_mmap
>
>  /**
>   * DEFINE_DRM_ACCEL_FOPS() - macro to generate file operations for accelerators drivers
> --
> 2.7.4
>

Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
I'll merge it through my tree.
Thanks,
Oded
