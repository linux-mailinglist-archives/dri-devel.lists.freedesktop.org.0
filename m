Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A5FB57FB2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 16:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A28610E4DA;
	Mon, 15 Sep 2025 14:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="YMrFLEo0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DA110E4DB
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 14:57:44 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-772481b2329so4597299b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 07:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757948264; x=1758553064;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bWnOZJSewnsdDRnB5iGIXYYv++Gnu1xZmA3g/PLQf9k=;
 b=YMrFLEo0NEqJwMAl/x/A6WffhoX/kTtdZ99yH3CdITCz7YES5yc0r1M++BJIDzjwOh
 bl9PbN9dmKRZ6z2o4NULoFGdzyIJRKhHs5ytrYLyBn2sVjWX7lj5jf+BoPCEGmv1WAgm
 dsq640iCFuKQmp3QS7SUiTKU9P2TqUBLl5XDATKm3CE1u1hig4aLAuv9EhvXVxvZgcOD
 LnZT3HcOGuSTqsDRc/t10pe0VNYJiXaJzLvdRdD4HDNXRP19z8x5/QPfGANhEZuwhDDv
 FkwMV2NRHrnksBnx0ISMr1bxNjgkw5fMSUqeBwJQ4ISLS9rbh3hxqSE4DmWDazuYKhmP
 wvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757948264; x=1758553064;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bWnOZJSewnsdDRnB5iGIXYYv++Gnu1xZmA3g/PLQf9k=;
 b=lAzb8e3om/nIEuSLeNN76z64Ss9aHD3EP+a1Hx1uC4SH7vfwdcEFXjZwa+66nk14ai
 L5jfWs8Cm54R6LChnQcxg0y4hERlbS4luBl2zwm++CC835PEGqGsl1wtitfdP5mOhQlp
 pAqNHQqrUt83XY760sYGmHG9QkH4Q1s3Lb+uybAnS9u4wBBdmfvmBI1XPnHw3AW1OzkF
 xns/HtVdhoOceHXAs6n4CyZoDOckTqornn+G+Y03aL4oI/whezUeYYhtCLZpZ2Yl2PYm
 Nt6mimI8PkRdONMXHwKD6Gh0cGy5gRLp7CufOjebOuQFneA7Q3H2uaKtStPpgeImoeMZ
 RUxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXub69m5ZfmuaiqWOH8YASz1MgscJPpEjx4HZYcEZu4i9TaQrOq0/NKaLP6oxiFnjq5M+yjJb+VTb0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2YiqYB2UHInC5PvRD6ksn8bRu6ctf1Ys/WJK1jaefFq0FLs6C
 FXUXhI6MR3ryTC4rTl4LTgegEelJKBCa4VPP67BerXomPdLcGT4j2MCepU040SS14GnqUDPw8Ks
 KK9/sVjTFNZ10J496KQwfo76ydqzUV68q94XnDvNs
X-Gm-Gg: ASbGncuqiS9nMACmXvR3qlgxcjm2AaWj7hsGoRRRpKyhKBqh/qt/1cYoTIpqqyo5EAF
 beCwhDgUtoP/+pc3XTnhCLIm0/6EBEqBL3qaEiidlnbpfgqhcv7y5DNl7/temCsdm/WtLaYtKAN
 Ds/bExh/SC+qaAMq5G4QCHwBFLk51j3doNva+yQDADCMacQFs61EGCRoqxkRazka0AVqa1SoDGM
 PGoSOyl7+uajlhIUtRliBslCn13nIzh2yEmY++mnJs=
X-Google-Smtp-Source: AGHT+IHnj6/TLndLwM8EyXwEuk/YJ9EdWGwOpk4CWXv+kwz1bKWJkqFmdEGI1fqwhaJAaM5FG2Rg3VduvcabMBwKZmE=
X-Received: by 2002:a17:903:478d:b0:264:8a8d:92dd with SMTP id
 d9443c01a7336-2648a8da428mr77672995ad.20.1757948263212; Mon, 15 Sep 2025
 07:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250915064715.662312-1-yanzhijian@huaqin.corp-partner.google.com>
In-Reply-To: <20250915064715.662312-1-yanzhijian@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Mon, 15 Sep 2025 07:57:30 -0700
X-Gm-Features: Ac12FXxQXW-Con-zpsPtv_VMeeXMu-aegpq7H-CjBeLPv29-bp9mRKCGUG3xxe0
Message-ID: <CAD=FV=W8HGEa6FJ_NApH7V-NiJhiiaA3czXPJTbff6vWKBoy=Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: Add support for KD116N3730A07
To: Zhijian Yan <yanzhijian@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 hsinyi@google.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

Hi,

On Sun, Sep 14, 2025 at 11:48=E2=80=AFPM Zhijian Yan
<yanzhijian@huaqin.corp-partner.google.com> wrote:
>
> Add panel driver support for the KD116N3730A07 11.6" eDP panel.
> This includes initialization sequence and compatible string, the
> enable timimg required 50ms.
>
> KD116N3730A07:
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 2c 83 10 01 00 00 00 00
> 02 23 01 04 95 1a 0e 78 03 3a 75 9b 5d 5b 96 28
> 19 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 09 1e 56 dc 50 00 28 30 30 20
> 36 00 00 90 10 00 00 1a 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fe
> 00 4b 44 31 31 36 4e 33 37 33 30 41 30 37 00 2e
>
> Signed-off-by: Zhijian Yan <yanzhijian@huaqin.corp-partner.google.com>
> ---
> Change since V1:
>
> -Add edid in commit message.
>
> V1:https://lore.kernel.org/all/20250912131104.1726775-1-yanzhijian@huaqin=
.corp-partner.google.com/
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/panel: Add support for KD116N3730A07
      commit: 65afe8b647a7c2e5c508eb28c93baddaa40812f4

-Doug
