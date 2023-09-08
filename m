Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB35798698
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 13:51:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9FD10E00F;
	Fri,  8 Sep 2023 11:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E85410E00F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 11:51:40 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-794d98181f0so72960639f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Sep 2023 04:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694173900; x=1694778700;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=etW99NG5BvyY4SuRfU5lZu1cQhINWbdTi13Yac2QPgE=;
 b=VqdeV0AzyYPBri6C0FZ3RCb+RXEwYfXp4+8xRm4oxZ+Eh0Nmh/UHilfs0Uj0QGuhrA
 ioPT3+SQNepHHrFRp10P02QRyfJEI4N7gxZKmz/3ySsQSxSb+9Qt7G7/boEpZGSHLpLB
 N0+vgC/2lEhNw28CCLkmfy58uR/awCnKH/WXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694173900; x=1694778700;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=etW99NG5BvyY4SuRfU5lZu1cQhINWbdTi13Yac2QPgE=;
 b=tRQTX2iEiFKVa0lV40iKEVXKOGQjIaAr7O5TYozGeNN5RmvSKe/r0cTExWStG+LbF+
 n/OZm54DysQg76jmvFmWogFufl/yideJJPYUNhlcEqVDKE92ouo+szS2sMficqthsuf6
 Im8y8sA8DQTn81KZDmHZ6umHVryu4+3zRchKEg7Y3Y7wTfH+i4GVu4ZmLJTACpEG4lqC
 1NjBlnTOSwv3Ne6UJKcn9gQ5joAtsREk2V/Fb7Qj2qXZ53bXQeQCvswCE+XVFQzi85lk
 biYZ6OHqTIv2LYZst1vAuWmn1JUnR0upwt53NVUrKV3Jglfsehf6GAngDgmMSZgGdren
 E3cw==
X-Gm-Message-State: AOJu0YwV77wRAzvUMbHho04eUL8nZTEGJfJ9hBxpKbg0H0CqM3ST1PFD
 fhCPuUrwnuOHfN7TV7/PVUfYsIqDWmp2TA0USjc=
X-Google-Smtp-Source: AGHT+IGcnrh2I7wlesl4pidlTBDtnB0w2A6GrbsVn/Y6bJuriTy77UWSq9vAvqmXQA1md1giPN6aQA==
X-Received: by 2002:a5d:8507:0:b0:791:1739:d525 with SMTP id
 q7-20020a5d8507000000b007911739d525mr2559693ion.20.1694173899712; 
 Fri, 08 Sep 2023 04:51:39 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com.
 [209.85.166.50]) by smtp.gmail.com with ESMTPSA id
 w9-20020a056602034900b007836252a084sm444810iou.48.2023.09.08.04.51.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Sep 2023 04:51:39 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-792975085b2so73784839f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Sep 2023 04:51:38 -0700 (PDT)
X-Received: by 2002:a6b:e60b:0:b0:791:280:839e with SMTP id
 g11-20020a6be60b000000b007910280839emr2660662ioh.16.1694173898001; Fri, 08
 Sep 2023 04:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.5.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
In-Reply-To: <20230901164111.RFT.5.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 8 Sep 2023 19:51:00 +0800
X-Gmail-Original-Message-ID: <CAC=S1niYAC3PFQoAmwVc=1FcK29uu5sC9c1pGo-mku__y7eHcA@mail.gmail.com>
Message-ID: <CAC=S1niYAC3PFQoAmwVc=1FcK29uu5sC9c1pGo-mku__y7eHcA@mail.gmail.com>
Subject: Re: [RFT PATCH 05/15] drm/mediatek: Call drm_atomic_helper_shutdown()
 at shutdown time
To: Douglas Anderson <dianders@chromium.org>
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
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Sep 2, 2023 at 7:42=E2=80=AFAM Douglas Anderson <dianders@chromium.=
org> wrote:
...<snip>
> @@ -952,6 +960,7 @@ static const struct dev_pm_ops mtk_drm_pm_ops =3D {
>  static struct platform_driver mtk_drm_platform_driver =3D {
>         .probe  =3D mtk_drm_probe,
>         .remove =3D mtk_drm_remove,

I think this patch, and perhaps some others in this series, will have
a trivial conflict to Uwe's work about the remove callback conversion
e.g. [1], so you might want to rebase the series onto the latest
linux-next.

On the other hand, I tested this patch on MT8195 and MT8188
Chromebooks and I don't see issues during boot / reboot, so

Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git=
/commit/?h=3Dmediatek-drm-next&id=3Db3af12a0b46888340e024ba8b231605bcf2d0ab=
3



> +       .shutdown =3D mtk_drm_shutdown,
>         .driver =3D {
>                 .name   =3D "mediatek-drm",
>                 .pm     =3D &mtk_drm_pm_ops,
> --
> 2.42.0.283.g2d96d420d3-goog
>
>
