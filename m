Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2949B2E2A7
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 18:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23B710E792;
	Wed, 20 Aug 2025 16:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KD0P9HV/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3C910E790
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 16:51:06 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-b4743621044so14131a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755708666; x=1756313466; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hJZ5yF6MT93cQ2eY07VpZtdRSNWFWGaCLBXg7mgNuIg=;
 b=KD0P9HV/ZQOZ7GeW3QKcNDmZ8a6qMb76hb0KaVgYIQMNM91xZwMx76jZCymb1hakhT
 k6uzcM7UewsP1VKWC9/MhL7ygrKpnKyaT5l5iaPu7OjZBDNUmjxbGZv/ryhUrMjO6EyR
 kHpuKR1RWrABtPMOCeRzyPMGGQ16YyV8ufbcoGP6IbCCZFkP91W7vZ2IfdhZROOUy3N5
 zIvmcdrY69sKyPeB8fI0XDdMEWKEje6IenWWedPtODnV48D/zw+9X/ZMy3n7cNwqA0TB
 Tq/gEvJnZxHhlxq5J6ZyZ6nbtfVEPlz2UKHw55SH2ZIO9up3YrQQ2T6xsINMNf8t5WEm
 LhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755708666; x=1756313466;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hJZ5yF6MT93cQ2eY07VpZtdRSNWFWGaCLBXg7mgNuIg=;
 b=uTqAtm60VsP3eC5A3jhz20f1h7W2xHpz4Sv92G1L6CzHWOv9ETExHs59VhyPYFAeu6
 lrlon4UqqEYIxWqHjz4n9mzzwOzLDvygokE2WtQWGcsJc5cn1u5HWUt/nUapnGu83yzc
 rd6V+cwiGHuvY1UeuRh+tqvSS9ppqVJ47cD/fgLT/xmq3mmpnBCHZ0WVzQFp7KhRWD/N
 +4fSN3QqwR8EU3Hok5sdr4JHFypB5xCkIMR1p6MpmO6mYTEXqvey+Lc2lx5Tnj32XQtv
 W6cIhNGtNqOoaZr3zeg9DLmF7BpRVXNINSDtNL/iqUE1AaXDTzR4QYe+7Nz53SBEOZRu
 HKfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjcQEEFVAbD81gk17hcDh9nKurcE5PzNkJrmhdjSmmUfbvN51rNiX3gB1C8bLNAv5F8t15UAwAzxg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8rSpjTwlIDApi9tfyQLUk6H17poZDEXmbmrj3di/XcQcZnLC5
 Sh0dO679keemmdgstrzPf0jeWAcwfvDNq6D1/B3oFxUGFhVrBO6mn3Lw
X-Gm-Gg: ASbGncsl4tUMEBTBwmnQ2Unp3AHNEdOEAGnWJvZO5mPFbOSQx2nB4KVG4ziw9E88gty
 gcXm3Nd2ztaFlKcxoyqckAn6EzrLqVs5aerFNHK7N/ZIvj+xAQDD4dilfgTgTHxg74mx6INUh/m
 l+oDKOT05pG58KIdELPd68Om0nQ3u2Y8fa1ZWQCAdmoqGWUeNKd1xTT/j+yMpyiVbeIytYCrh2m
 iVcb8ApTukhhycg9kr6+F9OYRLZNGy5Yc8cFvuQQwhKq8VqaHb/d91YkWJxRY/nIO++YcQIYXGJ
 yLQJ1IBJjrRf6gaeOex9FbzfEbxqevtzQaApXG5ZrW2rdwIHbaJrTq+0L0y0KhlulAPIED10AWi
 gYbGu6YNRNmo6+CwVfQ==
X-Google-Smtp-Source: AGHT+IGoxAmu4xxfpyv6iOKZvfO5x7LR/lkwmDmB5TsfrMBGncsh2UHwKp/rA7M4iaeIKiv0reOGwg==
X-Received: by 2002:a17:90a:e7cf:b0:321:c81b:29cd with SMTP id
 98e67ed59e1d1-324e12e819dmr4255157a91.1.1755708665593; 
 Wed, 20 Aug 2025 09:51:05 -0700 (PDT)
Received: from Terra ([2001:df0:b240:b5e:abe3:8cfd:3fd8:5d8e])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-324d335c4f1sm2602720a91.11.2025.08.20.09.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 09:51:05 -0700 (PDT)
Date: Wed, 20 Aug 2025 22:20:59 +0530
From: Athul Raj Kollareth <krathul3152@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: airlied@redhat.com, kraxel@redhat.com, gurchetansingh@chromium.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/virtio: clean up minor codestyle issues
Message-ID: <aKX8835xMtatEHcy@Terra>
References: <20250813062109.5326-1-krathul3152@gmail.com>
 <39b17698-a1ce-452d-ada5-5c3741e888b2@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39b17698-a1ce-452d-ada5-5c3741e888b2@collabora.com>
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

Thank you for applying the changes.

Best regards,
Athul

On Wed, Aug 20, 2025 at 01:41:01PM +0300, Dmitry Osipenko wrote:
> On 8/13/25 09:21, Athul Raj Kollareth wrote:
> > Fix codestyle warnings and errors generated by CHECKPATCH in virtio
> > source files.
> > 
> > Signed-off-by: Athul Raj Kollareth <krathul3152@gmail.com>
> > ---
> >  drivers/gpu/drm/virtio/virtgpu_display.c |  3 +--
> >  drivers/gpu/drm/virtio/virtgpu_kms.c     | 20 ++++++++++----------
> >  drivers/gpu/drm/virtio/virtgpu_object.c  |  4 ++--
> >  drivers/gpu/drm/virtio/virtgpu_plane.c   |  2 +-
> >  drivers/gpu/drm/virtio/virtgpu_vq.c      |  2 ++
> >  5 files changed, 16 insertions(+), 15 deletions(-)
> 
> Applied to misc-next, thanks.
> 
> -- 
> Best regards,
> Dmitry
