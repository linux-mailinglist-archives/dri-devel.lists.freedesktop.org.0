Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFE19B284A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 08:00:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53D410E34E;
	Mon, 28 Oct 2024 07:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="UpFtNQyW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C980410E34E
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 07:00:42 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-539e59dadebso4580614e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 00:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1730098841; x=1730703641;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oXeJH9+dd3cazFRcmOcTf4KQwEKjtruutzeaxtbL0pk=;
 b=UpFtNQyWSSsKzX84QDcwgCUyD0jYxdTFpZmetksUj/fW374STzutnr3/4QFqtUaQCM
 LksVwesluDdBAVj63YnDjkHVwppwt0M2VsvMYMoxj6gD5DikL9gbjkbqMk926bmQdc0C
 bB0Zp9cOmEYxiKRBndTpHyx0CvpcaBZD8CqNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730098841; x=1730703641;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oXeJH9+dd3cazFRcmOcTf4KQwEKjtruutzeaxtbL0pk=;
 b=qp13GiDfGBeppVYlCOAiMgtI65ToBFvOpzyaCrzQTmSkURy0C7pghHkfLRSsqq8nbD
 Gn0IaONOTyQeFVpt/mwx8mTL8QdnFtnLIUzSveWMI9zocNlh0XmuZuguYbW9wu6dTDkm
 8laBGPp5HZLaO5c6LJefI+veMFuhxRjChReMtSBjiT5SvcKy9YEd0cEwnVYtiyDMUSlb
 A5qyPiAQ+PAI2ISXWoM//mkM9iKfkJN9I+AY/7iKleD9ve27Vzy5p827GGN6FOqnui7v
 UKl0E48Uyg+qiCOAB8OyhyDvR+kpAs3sz2cZE4SgJ4GRZQDmuC8uI4fGbExxa8UVR0qm
 osOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1oeqxwtFcBLWzWoHxZvjkEnXtGQsDrABrkwd12TVK/CBg2M2cyzzlwpyHRKthIgGdNdJmx8hGys8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxW1wc+Q1uoHJmwLRAdLYZt/sW5DHg+IBltNHBm+Zzx7e/hEIa
 sCbGLtRofIW94lqtJ25Ky3sHrEUBBQL0ELq/0nbH0aKPSKkhJawITZSjVmWveXwtkkHNobOku6X
 459iSNfI3fKBFsMc3rTixLyBrgUxTv90e90QL
X-Google-Smtp-Source: AGHT+IG0bSkKwUt4vIe/DSFsd27a0aZcM775T78oioXCX/0ert+iimxun6TtbNvBDPU5UOHkKZf2rc0Rt4hi62j6fcI=
X-Received: by 2002:a05:6512:3ba3:b0:539:eb44:7ec3 with SMTP id
 2adb3069b0e04-53b3490fabamr2408370e87.31.1730098840615; Mon, 28 Oct 2024
 00:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20241011-mtk_drm_drv_memleak-v1-0-2b40c74c8d75@gmail.com>
 <20241011-mtk_drm_drv_memleak-v1-1-2b40c74c8d75@gmail.com>
In-Reply-To: <20241011-mtk_drm_drv_memleak-v1-1-2b40c74c8d75@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 28 Oct 2024 15:00:29 +0800
Message-ID: <CAGXv+5Ge_qcXaSBQ9d8QZOWe3x_9-6r9LhDGvAbUHNKYMwevUA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/mediatek: Fix child node refcount handling in
 early exit
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, CK Hu <ck.hu@mediatek.com>, 
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
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

On Sat, Oct 12, 2024 at 3:22=E2=80=AFAM Javier Carrasco
<javier.carrasco.cruz@gmail.com> wrote:
>
> Early exits (goto, break, return) from for_each_child_of_node() required
> an explicit call to of_node_put(), which was not introduced with the
> break if cnt =3D=3D MAX_CRTC.
>
> Add the missing of_node_put() before the break.
>
> Cc: stable@vger.kernel.org
> Fixes: d761b9450e31 ("drm/mediatek: Add cnt checking for coverity issue")
>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
