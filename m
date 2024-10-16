Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3149A1520
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 23:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D3910E0B7;
	Wed, 16 Oct 2024 21:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="OvDz8zTI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6AE810E0B7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 21:52:21 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-716ab0c7873so116372a34.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 14:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1729115541; x=1729720341;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a5DTUB5GnpyaeFBfW4aLHPqs9cBt4Whkge9o9U0fQHI=;
 b=OvDz8zTIzOrt9KyIIAYyNg+v4pqRvyrnL2VGAKz77Yf+hmpTjZq0lcZf+W4xv4k+AA
 XXvSR52cyS6b2sTYqHnl903lDQUA82ohtoefb2jOOnc6LIKS5G2SrczM4ifIGc6R7Da+
 FdyXA8fY7tQYCqV+NXA6RZ47/kE71GT+ZH5z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729115541; x=1729720341;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a5DTUB5GnpyaeFBfW4aLHPqs9cBt4Whkge9o9U0fQHI=;
 b=JC3IrfCHKgYRoKtYJaP46E14KyLN+pDWPa0nMveBZ8LuX3ppLZW+tovWxlfoVa0ySk
 16SU+9o5tLrAvgZI+zbMD0bmdjKqODxiRcA/qS4dKWoShroQqkuo25vzctyfPui1Bj7+
 HiJ2yo6sU3fI7HNmCXM+i/116tc9E5U7EGvmrj07itKEFpTSohmk9k7uRxN5ik5WOFUv
 BeJhEUkouKGO0R5sIXYKPxFOyvB+eTgiFPxVsNk74qxXJ5Y9woaKGcWgj1lvRCP0ALUw
 YM94fcOIRzJhXWta+4n4QrGu+WVc9RvuwZCIUQPfJB+4v9FQgdWXyMa8nPJhO+IL+zs5
 +fKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJwmcfUIaKtLntN/Nk/LxlzwrsqZ6D/DiDkMnbcyVKRaWmjoKU6DC4sdSPT1ynGL5xpIMfKFSyhAQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoKb7z6ZV+rA4VKgSqe28NR3AsQ6PXX41YGiZHpsNjSgIyFOGI
 gSSNEkdUqtfDk+QJkYclVmxhhAL7Vfo+VDsKIMwdMawCaM4juQgY+qJgolPKD8t1uagYmaZUgqs
 iWBgQ9IOyX8ndf3FU+lhobdFUDnc3ShsIde01
X-Google-Smtp-Source: AGHT+IE7RS2K0RmzSXETL5iGnY3q7rCF1rjKdi3zRgyFiH16uN5b1c6ruvNbCcnCiAsBXO8EUw8a76+9j/5br4+3Y6E=
X-Received: by 2002:a05:6830:6013:b0:718:678:56e6 with SMTP id
 46e09a7af769-718067858a3mr3325173a34.3.1729115540911; Wed, 16 Oct 2024
 14:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20241016-upstream-v6-v6-0-4d93a0c46de1@ite.com.tw>
In-Reply-To: <20241016-upstream-v6-v6-0-4d93a0c46de1@ite.com.tw>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 16 Oct 2024 17:52:10 -0400
Message-ID: <CAEXTbpfSJJF7W6ga9R5ns5naHgK0r=smCierau5fbLAztkjVwA@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] drm/bridge: it6505: fix HDCP CTS fail items and
 add MCCS support
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Kenneth Hung <Kenneth.hung@ite.com.tw>, 
 Pet Weng <Pet.Weng@ite.com.tw>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hermes,

On Wed, Oct 16, 2024 at 3:54=E2=80=AFAM Hermes Wu via B4 Relay
<devnull+Hermes.wu.ite.com.tw@kernel.org> wrote:
>
> This is a v6 patch-set.
>
> There are lots of failure items while running HDCP CTS using UNIGRAF DPR-=
100.
> In Order to fix those failures, HDCP flow needs to be changed.
>
> The DisplayPort AUX protocol supports I2C transport.
> In Order to support MCCS via the aux channel, the aux-i2c operation is ad=
ded.
>
> v5->v6:
>         -keep the commit message wrapped at 72-75 chars.
>         -[10/10] fix return variable being used without being initialized
>
> v4->v5:
>         -add more messages for changes.
>         -[2/10] modified AUX transfer data size judgment.
>                 change for-loop to do-while.
>         -[7/10] change for-loop to do-while.
>         -[9/10] change wait timer with timer_after()
>
>         links:
>         https://lore.kernel.org/all/20240926074755.22176-4-Hermes.Wu@ite.=
com.tw/
>         https://lore.kernel.org/all/20240926075134.22394-1-Hermes.Wu@ite.=
com.tw/
>
> v3->v4:
>         -split changes  into patches.
>
> v2->v3:
>         -split aux read  KSV function to a patch.
>         -[1/3] new in v3
>         -[2/3] add description of patch
>
> v1->v2:
>         - ignored.
>
> Hermes Wu (10):
>   drm/bridge: it6505: Change definition of AUX_FIFO_MAX_SIZE
>   drm/bridge: it6505: improve AUX operation for edid read
>   drm/bridge: it6505: add AUX operation for HDCP KSV list read
>   drm/bridge: it6505: Change definition MAX_HDCP_DOWN_STREAM_COUNT
>   drm/bridge: it6505: fix HDCP Bstatus check
>   drm/bridge: it6505: fix HDCP encryption when R0 ready
>   drm/bridge: it6505: fix HDCP CTS KSV list read with UNIGRAF DPR-100.
>   drm/bridge: it6505: fix HDCP CTS compare V matching
>   drm/bridge: it6505: fix HDCP CTS KSV list wait timer
>   drm/bridge: it6505: add I2C functionality on AUX
>
> Change-Id: Iad0c056d72abf2655081357cf40c3b0d3df916b5
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
> Hermes Wu (10):
>       drm/bridge: it6505: Change definition of AUX_FIFO_MAX_SIZE
>       drm/bridge: it6505: improve AUX operation for edid read
>       drm/bridge: it6505: add AUX operation for HDCP KSV list read
>       drm/bridge: it6505: Change definition MAX_HDCP_DOWN_STREAM_COUNT
>       drm/bridge: it6505: fix HDCP Bstatus check
>       drm/bridge: it6505: fix HDCP encryption when R0 ready
>       drm/bridge: it6505: fix HDCP CTS KSV list read with UNIGRAF DPR-100=
.
>       drm/bridge: it6505: fix HDCP CTS compare V matching
>       drm/bridge: it6505: fix HDCP CTS KSV list wait timer
>       drm/bridge: it6505: add I2C functionality on AUX
>
>  drivers/gpu/drm/bridge/ite-it6505.c | 334 ++++++++++++++++++++++++++++++=
------
>  1 file changed, 277 insertions(+), 57 deletions(-)
> ---
> base-commit: b8128f7815ff135f0333c1b46dcdf1543c41b860
> change-id: 20241015-upstream-v6-9f4b015fecf7
>
> Best regards,
> --
> Hermes Wu <Hermes.wu@ite.com.tw>
>
>

I'm not sure if this requires a re-spin, but you are supposed to
collect the reviewed-by tags you received when you send out a new
version. i.e., put the "Reviewed-by:" lines you received before your
"Signed-off-by:" line.

Regards,
Pin-yen
