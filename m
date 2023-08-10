Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62608776FC4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 07:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4FD210E4B5;
	Thu, 10 Aug 2023 05:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC0D10E4B5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 05:47:36 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3491568afd4so2098375ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 22:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1691646455; x=1692251255;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jPPMg3PRamF1jAKZwUwGlqsGYxlh91mVVXE6o4NQgM0=;
 b=VOeaqLIOrXW4AZMOFlKqd50sl5AxWFJmIPjLZHcSEujtbpb/UzWmaI44ljrVYhbeqD
 eXjNzR3S1zJDIUi0ZL7x12T+RJ+GFZDEijEVop6shez7hcZAH9DurlIjMLY4OfYGgZr1
 RrtqpA9ozZNNBnzBYZ6AYB6/1/TyinKEKHqCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691646455; x=1692251255;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jPPMg3PRamF1jAKZwUwGlqsGYxlh91mVVXE6o4NQgM0=;
 b=APMJTE+3adROURDZ8yv+FV3S5tPJ9CcYg5UANmUQIX5vk5UYeyVqYXOCfbERBiAboB
 Lb2rckNWN+B3cmqSaD0eks4U95l/bxWblVftIMXJkb/uxQWDVnAKw7z7ejhqsFVOu8cG
 IgnVsf5a8c+zB4WmGbab6JY2fVeMNT13u/bfDEcbrV5HLLb7spJv3M4Jdaem4BucHxSq
 MmXEX723sr6SUy8+YigT31DNuRoEJZtQmYGYGruK9AtGrcel7aqI1qvuRmvCktkxehXt
 bYgTVf4U5BxNDuOLjAiOtOEU9IC2CzbSGEL73UH2wtG7aQPqRH3Omj4JW8tiyLxlJmuS
 CAUw==
X-Gm-Message-State: AOJu0YzkfnT7EA6rNAnMDAI16hbN2agwiYDCcGOSU4yzkTayM2AbdgmX
 oduI9Z5Ib7dS9vGRJ2kvCX6itGip0rg8NsYvcgM=
X-Google-Smtp-Source: AGHT+IGMmejxSRFHtxRrXN6DyYQrjXgsBNo+X3oEGHSAPf4zm6L8Bp003q1C3/gZ11JxCqpewky1DA==
X-Received: by 2002:a92:c266:0:b0:348:8b42:47d with SMTP id
 h6-20020a92c266000000b003488b42047dmr2250502ild.28.1691646455692; 
 Wed, 09 Aug 2023 22:47:35 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com.
 [209.85.166.50]) by smtp.gmail.com with ESMTPSA id
 u5-20020a02cbc5000000b0042319c38763sm204449jaq.15.2023.08.09.22.47.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Aug 2023 22:47:35 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-77a62a84855so18160039f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 22:47:35 -0700 (PDT)
X-Received: by 2002:a05:6602:2085:b0:790:bb3e:78e9 with SMTP id
 a5-20020a056602208500b00790bb3e78e9mr2150940ioa.16.1691646455213; Wed, 09 Aug
 2023 22:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230809181525.7561-1-jason-jh.lin@mediatek.com>
 <20230809181525.7561-8-jason-jh.lin@mediatek.com>
In-Reply-To: <20230809181525.7561-8-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 10 Aug 2023 13:46:59 +0800
X-Gmail-Original-Message-ID: <CAC=S1ninuuuD7LEG=ST5bWX=tDYbfA6Xzf0d3o5XGSnFd_v19w@mail.gmail.com>
Message-ID: <CAC=S1ninuuuD7LEG=ST5bWX=tDYbfA6Xzf0d3o5XGSnFd_v19w@mail.gmail.com>
Subject: Re: [PATCH v9 7/7] drm/mediatek: Support DSI on MT8188 VDOSYS0
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, dri-devel@lists.freedesktop.org,
 Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 10, 2023 at 2:15=E2=80=AFAM Jason-JH.Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> Add DSI as a main display output selection on MT8188 VDOSYS0.
>
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>
