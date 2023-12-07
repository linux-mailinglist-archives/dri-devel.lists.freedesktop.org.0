Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6030880853C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 11:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5193310E84C;
	Thu,  7 Dec 2023 10:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B5910E84C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 10:12:00 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5d33574f64eso5194237b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 02:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701943919; x=1702548719; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=va9Ov+xZZo4FTpSbgcFlYqVF2pKEVacBeRo98NAmV0w=;
 b=At0E5wPTrSBFtY6BFFa7PfgHhA9OO6kq6NQkqzpuctub/iPK/NRgFIGs8TgfUCrooi
 oikDT5WQmE/8Yn1tEUb5ddsxnyOue47DeaMirJA2LXD08sEdcREvvuZOtt/uUPX1yM2d
 yUftA6/CMT8Agfxa0RECGMF3xGNPnVP6acynVIoxIQJYYOYqye8OBVbA2OFVTKFRqpY6
 TedoCFb236MmvuAAe9arl09szO/ht+kZmMVlg4pU73hYaW7mNYZOX2DIMoJIXDkxFu+A
 E+YVM209HwWe8WZi2FhK/0mRCDHFRXVUavbvCdkzxivQXXnc1tgGAG3VSauN4npsshlD
 VYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701943919; x=1702548719;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=va9Ov+xZZo4FTpSbgcFlYqVF2pKEVacBeRo98NAmV0w=;
 b=JoL3p2m462QNzz7cIec5qh7slXyKCvZ4Y2njJujdAP0Q/mHTSN33h3l9UdaQ2SKEYS
 R7CBnaUHAeA0okLfBtu3m3U8jSZ2YYJGz0XMIZP6nRD9FrNFgHVq4TqQ1ItfIhIKzPHz
 E46Iv+siz14XOm48m6phvMBepPLByp0PfGM7HFWqBXsMX9ZAqaQNPaZ0Jsbn+eNDKhlG
 y+w9ELX0t3Sn2V0a2/F2u7yF7z2+VWXaSs/r2ixKGXi0G8GTFKdcOsG7CRbZ4Pzat89/
 mO8WBN9TbnWuMXwhThFMwl9O3PKg25qmKRU0Cdeo0zNaB7efGakYlZgA0Hs242GGM/f4
 IXEA==
X-Gm-Message-State: AOJu0Yz/t7/ptXHD4s3IaZw7NB1j238w9XES9t4sQUt2cppe7cUawlSa
 Jir7+6/uvOr8mVUtQn/MYjqoUo1AjmfmSEuVqlMhHg==
X-Google-Smtp-Source: AGHT+IHehvisWIu1aIG4/Lr/qRlSahSr5Kz9wMP/CVse/JpuRZ7NTXAMxNyM//UNHIIwgo0u+3vqlFTdn07fKhZsDHQ=
X-Received: by 2002:a81:ae24:0:b0:5d7:1940:b36d with SMTP id
 m36-20020a81ae24000000b005d71940b36dmr1931975ywh.57.1701943919517; Thu, 07
 Dec 2023 02:11:59 -0800 (PST)
MIME-Version: 1.0
References: <PA6PR08MB107665920BE9A96658CDA04CE8884A@PA6PR08MB10766.eurprd08.prod.outlook.com>
In-Reply-To: <PA6PR08MB107665920BE9A96658CDA04CE8884A@PA6PR08MB10766.eurprd08.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Dec 2023 11:12:10 +0100
Message-ID: <CACRpkdbPoDGrxCsuwmz-ep7V38Gi5P74jkfMBX+XJMPXFb=SJg@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix FD ownership check in drm_master_check_perm()
To: Lingkai Dong <Lingkai.Dong@arm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: nd <nd@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 6, 2023 at 2:52=E2=80=AFPM Lingkai Dong <Lingkai.Dong@arm.com> =
wrote:

> The DRM subsystem keeps a record of the owner of a DRM device file
> descriptor using thread group ID (TGID) instead of process ID (PID), to
> ensures all threads within the same userspace process are considered the
> owner. However, the DRM master ownership check compares the current
> thread's PID against the record, so the thread is incorrectly considered =
to
> be not the FD owner if the PID is not equal to the TGID. This causes DRM
> ioctls to be denied master privileges, even if the same thread that opene=
d
> the FD performs an ioctl. Fix this by checking TGID.
>
> Fixes: 4230cea89cafb ("drm: Track clients by tgid and not tid")
> Signed-off-by: Lingkai Dong <lingkai.dong@arm.com>

Paging the patch author (Tvrko) and committer (Christian).
Here is the patch if you don't have it in your mailbox:
https://lore.kernel.org/dri-devel/PA6PR08MB107665920BE9A96658CDA04CE8884A@P=
A6PR08MB10766.eurprd08.prod.outlook.com/

I'm seeing this as well (on Android).

Tvrko, Christian: can you look at this?

Will you apply it to the AMD tree for fixes if it looks OK
or does it go elsewhere?

Yours,
Linus Walleij
