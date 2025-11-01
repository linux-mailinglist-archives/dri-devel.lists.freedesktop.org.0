Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE13BC2810E
	for <lists+dri-devel@lfdr.de>; Sat, 01 Nov 2025 15:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF9310E113;
	Sat,  1 Nov 2025 14:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="URjaxQwj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB5D10E113
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Nov 2025 14:38:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 58C65601F8
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Nov 2025 14:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8DEFC19424
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Nov 2025 14:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762007883;
 bh=HkYm+o5ZrKQsoVDIa7Xk6T9MOu2JC8WhA3qTTbVvthE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=URjaxQwj38MV9iQGYaolqDOCkpTUlKnSVuIzesiOnQhIW/2s3vUvTor5VZ2NOXl3r
 2cOYuzMs8TvXSCJ8GkZqcH1oQUmWVTrWNSWXi5IhOXmiLHJe3uxdq0rLgVBfTJ8bJG
 6LeOHDmU0rtBOaVQaj1TNa2WXeEM3ho0pa/OQLjuZfsNHTCHabjju0Kyu31tPVK2+R
 upnREDJ2Wk7qeLcnJwWXYXB5vxHv5n6TDRSW9lWW4rBw1dSZrsjB5LHmnGCe46CWu3
 iOtj3nJ7kghS2LWUPH5bO8f84VUPwjXtNBOiXUg+y1giOhYJ1aa0x3sJiuPs8K9+ra
 C2SbXRfQTUa+Q==
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-b67ae7e76abso2345393a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Nov 2025 07:38:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUghzPbsEmwYB3MtDHK//8yL8JEEZ3eq4iv0GkXuE4Y749GM48NY1sA+5Cm70b21Y7ufsAPDVwKq4M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7oMozxCesIhb/RTc4xzjqopABX7+7wwP97OxLYHOk/J8tG2+0
 J+0AwKSzF4LV+7RiktRhG0tpyoPaND4yLMPfZZ3kZ9WirDmhTwND/oqKuqjHivKFSIS8ICCj575
 qRWt+DotD8R89HWXY8IHAjC0cYQjecA==
X-Google-Smtp-Source: AGHT+IGVMak7HVgm2Kw7YYyD00KFk0fyKjURT+jhVGcUMpmtFlXzH6MEO5oeGDTKYtxCg8XT42xXcp+sjl4UzEP3ki0=
X-Received: by 2002:a17:903:1ce:b0:27e:ec72:f62 with SMTP id
 d9443c01a7336-2951a35eb36mr108901805ad.6.1762007883402; Sat, 01 Nov 2025
 07:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250829091727.3745415-1-jason-jh.lin@mediatek.com>
 <20250829091727.3745415-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20250829091727.3745415-3-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 1 Nov 2025 14:37:51 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8inC0s+md84zyjqyrfvsd4Aruy=oVCVsZfhqkv6WPk4g@mail.gmail.com>
X-Gm-Features: AWmQ_bnMutOthr5nfHuj9QF2tM6tPBJ9JUU0hnLlgQDkMeGZ7OwmHz0IXIzXIxk
Message-ID: <CAAOTY_8inC0s+md84zyjqyrfvsd4Aruy=oVCVsZfhqkv6WPk4g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/mediatek: Add pm_runtime support for GCE power
 control
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Zhenxing Qin <zhenxing.qin@mediatek.com>, 
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, 
 Xavier Chang <xavier.chang@mediatek.com>,
 Jarried Lin <jarried.lin@mediatek.com>, 
 Fei Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org
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

Jason-JH Lin <jason-jh.lin@mediatek.com> =E6=96=BC 2025=E5=B9=B48=E6=9C=882=
9=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=889:17=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Call pm_runtime_resume_and_get() before accessing GCE hardware in
> mbox_send_message(), and invoke pm_runtime_put_autosuspend() in the
> cmdq callback to release the PM reference and start autosuspend for
> GCE. This ensures correct power management for the GCE device.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 8afe816b0c99 ("mailbox: mtk-cmdq-mailbox: Implement Runtime PM wit=
h autosuspend")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
