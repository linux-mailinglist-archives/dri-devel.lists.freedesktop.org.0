Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC587592ED
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 12:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AA710E45B;
	Wed, 19 Jul 2023 10:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF4B10E45B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 10:27:13 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7835c92c373so14274339f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 03:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689762432; x=1692354432;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hVbJ90S8n4+Y/GX8BKsAT4na7uO4IaCBjmWUCYyFtgQ=;
 b=I59QS1LNk+IVX82McS9S60HmotZ2bNU4ZrTuByuym64U/8wQ0dQpeUBF+Zk5shnqXt
 L0hCSOrHILHgci2dyU9EC6S7PL4C9ItmdYK0V2cKtu1rrK5lVTHLh96ttZAT6DnNgRpI
 KchcBQpabct50pZ12Few53ttpR4TRccaTk/58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689762432; x=1692354432;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hVbJ90S8n4+Y/GX8BKsAT4na7uO4IaCBjmWUCYyFtgQ=;
 b=PD6Yqy62GhQGw/48eSzdjVwdvL2RO61EFLQILls8mOB3QqMsJv6lmGE2ensH3ll8qK
 VOpXHF7agSadSQeYZ4wHTyB+7mvFIuO3CeO74QG3GSTjUbW6jDPnnJ0wmt1sYBoQVFbH
 sw1i3DOgm6UAoRB5QgZch1hHUBbAMSqhIb8JFNUFrPQcYnmIsZffbYn/tYbcZ8RCujtS
 ABIpt1TaF/MK/ISh9o9oAcBfzYTnVvrSLYxScDSPOwbOIYM5A6bEQyN72ok7FJYmWLox
 oOrtH3ph4cPWcI6rjOzR3uGeelSgGpOPzWIXIlVzPUIl1jeecWUFaa2VSO0tHs8hzwap
 kkkg==
X-Gm-Message-State: ABy/qLY+JbObvV+TXPnJbSjOZ/capMmH9oKfj9HGmT+pLECVss9ANsW/
 hhaZH6yRmYaerbkhQzLD7ZzwhAf1vWn4YRY7fEs=
X-Google-Smtp-Source: APBJJlE+WjDRWmZ3ZqIfpM494roI2mAU2fFQtB/UsClH5BZGQ7IqKjIHYH795XxTg6xSc9CUVvRROQ==
X-Received: by 2002:a6b:4e03:0:b0:783:42bc:cc5f with SMTP id
 c3-20020a6b4e03000000b0078342bccc5fmr1297726iob.8.1689762432743; 
 Wed, 19 Jul 2023 03:27:12 -0700 (PDT)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com.
 [209.85.166.43]) by smtp.gmail.com with ESMTPSA id
 n7-20020a056638120700b0042b030023besm1171721jas.112.2023.07.19.03.27.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jul 2023 03:27:11 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-7835ffc53bfso14911639f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 03:27:10 -0700 (PDT)
X-Received: by 2002:a05:6602:87:b0:787:147b:b54f with SMTP id
 h7-20020a056602008700b00787147bb54fmr1327429iob.3.1689762430227; Wed, 19 Jul
 2023 03:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com>
 <20230719075056.72178-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230719075056.72178-7-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 19 Jul 2023 18:26:34 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngWWeGuXrvsvgLrU7iVjnAm1+o2PwfPOBrQMLzsijnuHQ@mail.gmail.com>
Message-ID: <CAC=S1ngWWeGuXrvsvgLrU7iVjnAm1+o2PwfPOBrQMLzsijnuHQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] drm/mediatek: mtk_dpi: Compress struct
 of_device_id entries
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 3:51=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Reduce line count by compressing the entries of struct of_device_id;
> while at it, also add the usual /* sentinel */ comment to the last
> entry.
>
> This commit brings no functional changes.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>
