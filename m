Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 852F248BED7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 08:10:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304F410EA45;
	Wed, 12 Jan 2022 07:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2400D10EA45
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 07:09:59 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id i5so5990117edf.9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 23:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e4STGP8nx6rQ3ZHW8wIeGVs8uIWas7TIWKM1+FpYezU=;
 b=ZmTrP16zO40yngw5STTmjokex1CAtMdhbY5IbDWg95ESmBDwfuvdEC5gZIC0XLHbQq
 bfgwrEmfLj0d2IQI54C+C1JAlyj78bMJJummud0FLcJbPrE4Zl6LsbpBMwjyVE6xfuR3
 K6g3L5I6zaIlVB2Ra+IYGW+ZsHGdG81aLKjPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e4STGP8nx6rQ3ZHW8wIeGVs8uIWas7TIWKM1+FpYezU=;
 b=ZfcoDzrpiKs6QE2Q53PXAKD/RuZR1peT8PHASiZEn4qSKWMj68tLsRBUHxUxQYThan
 WWF/c3f1ZBP0bnpl6gn8KTXTu9TjgI40ODwedsrMfOPfALAOhBx3sw4Q7gKTzOuvWM42
 BoJhl5QxY1Vr/qyJRH+oKEx2sloOW7raNSpWHW6VkzyIEIDUy1YtRuDB+lutcchiMYRE
 ZwR2ujvHiBJvMMIvcgS9cVuohwUrTCL3ZAeX/9sVa/8fKYycknf/1Raj/Uca6w0Tb4g4
 CIeeY6bgnfXbyc6tLW57SykNk/hpbHLhZ9tFRmFhMXaCZiyCme0AGhnq3YThxLr0kYy9
 llYg==
X-Gm-Message-State: AOAM530hoNuAXv05LuRF5i2mmKd6bP/HYu7AmC2CTFY5sAZdoWE6UyCc
 EA5m8cBcI5RhibqAl7vuNjHyM7itIQnwgvQsIt00Hw==
X-Google-Smtp-Source: ABdhPJyn8pZbZiDsgDpS9epZmGHtoPwtrHVrQnpxg/IvMYAfsCnSw98pwWo/FbDisciefPKFkzl0TWCxn/Uv0enkwI4=
X-Received: by 2002:a17:907:3d8e:: with SMTP id
 he14mr6365432ejc.167.1641971397535; 
 Tue, 11 Jan 2022 23:09:57 -0800 (PST)
MIME-Version: 1.0
References: <20220104095954.10313-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220104095954.10313-1-angelogioacchino.delregno@collabora.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 12 Jan 2022 12:39:46 +0530
Message-ID: <CAMty3ZAojTyw3H8VprH9aiyTyWjeL8oqPxNNr=J33_5FrcUj9Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: mtk_dsi: Avoid EPROBE_DEFER loop with
 external bridge
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 andrzej.hajda@intel.com, matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 4, 2022 at 3:30 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> DRM bridge drivers are now attaching their DSI device at probe time,
> which requires us to register our DSI host in order to let the bridge
> to probe: this recently started producing an endless -EPROBE_DEFER
> loop on some machines that are using external bridges, like the
> parade-ps8640, found on the ACER Chromebook R13.
>
> Now that the DSI hosts/devices probe sequence is documented, we can
> do adjustments to the mtk_dsi driver as to both fix now and make sure
> to avoid this situation in the future: for this, following what is
> documented in drm_bridge.c, move the mtk_dsi component_add() to the
> mtk_dsi_ops.attach callback and delete it in the detach callback;
> keeping in mind that we are registering a drm_bridge for our DSI,
> which is only used/attached if the DSI Host is bound, it wouldn't
> make sense to keep adding our bridge at probe time (as it would
> be useless to have it if mtk_dsi_ops.attach() fails!), so also move
> that one to the dsi host attach function (and remove it in detach).
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---

Eventually I've observed similar issue on other Component based DSI
controllers, hence

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
