Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F5C9623C3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 11:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590DA10E176;
	Wed, 28 Aug 2024 09:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="nTxyeH76";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C2110E176
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 09:41:41 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id
 ada2fe7eead31-498d587c13bso2036431137.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 02:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724838100; x=1725442900;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MDXXPoP3Ql2ed4Kq1NPFVHjXHxrCWpZsHv/VA9HbH3U=;
 b=nTxyeH768Ep20Dt35uDeNcU0yMFvKvxIWuOejLXSlZwya038Rmqmbp1Z/Yq1FSEuir
 emDn0k00xCODLtkgPY/dztpZ0C+3VHySIeN3KLUcoag0TqJzs+ahEEW18F7SDu9iDSRx
 4QhFXWuguXuEm/LBr5CoYKMtC29ibd8L3yszo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724838100; x=1725442900;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MDXXPoP3Ql2ed4Kq1NPFVHjXHxrCWpZsHv/VA9HbH3U=;
 b=TrvybVYmqDKCpOm8jnXBDB2uDXgzJLtYFaypVSztElsQ9q/B/EM6BO+SsojJO+NCbD
 dfvl6gTgyHsOjXKJf8VHqOb7bPemEehgK5iILGjaBQ2Bhw6c6XY6ufSEZzCeIItlLQ3F
 uzWiw10u77g0y/Wyry8Lbz2az6CrES7UevXxSDyRzHVg/ai+QlUdna8RJ1aQ/OYc8kzj
 cYvSnJDIvG2sSNDQQfrfqMvmbrLv65y9qmfXRbU/FTyPpUOmqw4QBZCyRhl9VXs6FtNW
 tZeUGRE6cfCD0ppJ3wGlZxFkVsDpDgcFaNpchJHqIG6E8EK7cMYlXUOvYRJXSNlqrYx+
 B5Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjRTiqGXsxexTt+aFuzu8Liuc1va8+d1Zo4tc6iV+pzMIq6zxubbtbgdbJ3YpLdO8/1q/yd9QS3D8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzU1tDaJuoRv/q6vz/Q1oWNlv4loMoa7m+rU3UjwvMdRPYc6RII
 H8zyu1062TM+oZnN3awQ7wDtZB1wf1e4LaquP+wSHWIG3BHiLwt3SGsAt3kafdC5DpsDxsdWtHk
 =
X-Google-Smtp-Source: AGHT+IG6pA7qhHGiyd84eFp3R55OqatHKxHY1QQw73z3nk22csAmXOx25L25p2UKND/78J8lsV4igQ==
X-Received: by 2002:a05:6102:3051:b0:498:ca87:ba49 with SMTP id
 ada2fe7eead31-498f47008ecmr13446957137.19.1724838099613; 
 Wed, 28 Aug 2024 02:41:39 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com.
 [209.85.217.54]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-844ce500bd2sm1513455241.19.2024.08.28.02.41.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 02:41:38 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id
 ada2fe7eead31-498eb25d247so1883460137.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 02:41:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUY+DygbYJ4J9VzbD3gVCsgo/gPi+TBGrLPpWW4ArmFWOPyUuuY2FhoCyMBl2/2JZScM3irGPQ4l/w=@lists.freedesktop.org
X-Received: by 2002:a05:6102:50a9:b0:493:c81c:3148 with SMTP id
 ada2fe7eead31-498f41cdb2fmr15317053137.0.1724838098095; Wed, 28 Aug 2024
 02:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240827-drm-fixup-0819-v3-0-4761005211ec@mediatek.com>
 <20240827-drm-fixup-0819-v3-2-4761005211ec@mediatek.com>
In-Reply-To: <20240827-drm-fixup-0819-v3-2-4761005211ec@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 28 Aug 2024 17:41:00 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngpXtsLUF=A-MxVnmWY7YgwvxHKSe0NuN_n=G+7-kpG7Q@mail.gmail.com>
Message-ID: <CAC=S1ngpXtsLUF=A-MxVnmWY7YgwvxHKSe0NuN_n=G+7-kpG7Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/mediatek: change config_lock from spin_lock to
 spin_lock_irqsave
To: jason-jh.lin@mediatek.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Singo Chang <singo.chang@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Hi Jason,

On Tue, Aug 27, 2024 at 10:58=E2=80=AFPM Jason-JH.Lin via B4 Relay
<devnull+jason-jh.lin.mediatek.com@kernel.org> wrote:
>
> From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
>
> Operations within spin_locks are limited to fast memory access and
> confirmation of minimum lock duration.
>
> Although using spin_lock with config_lock seems to ensure shorter hold
> times, it is safer to use spin_lock_irqsave due to potential deadlocks
> and nested interrupt scenarios in interrupt contexts.
>
> So change config_lock from spin_lock to spin_lock_irqsave.
>
> Fixes: 7f82d9c43879 ("drm/mediatek: Clear pending flag when cmdq packet i=
s done")

The appropriate fix tag should be:
Fixes: 1bbb2be61bbb ("drm/mediatek: Fix missing configuration flags in
mtk_crtc_ddp_config()")

I don't know if it's worth resending though.
I guess it's up to CK if he's willing to replace it when picking up the pat=
ch.

But the change itself is valid, so after fixing that:
Reviewed-by: Fei Shao <fshao@chromium.org>

Regards,
Fei

> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
