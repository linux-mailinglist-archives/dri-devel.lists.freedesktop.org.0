Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 095E36A7C4E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 09:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B0610E3DD;
	Thu,  2 Mar 2023 08:12:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C5710E220
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 09:53:16 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id k37so8170501wms.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Mar 2023 01:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1677664395;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vVm2ijZ3wY3vwKPabNU+PBrwbUTBJBfFnL9ZZ4aBrfk=;
 b=4Fu+yqsl6ks1J0Fa92PUm/F/nDyDK9SWtP1VAUdZUy16GTC0Ap4+Lo4bksw5qTFdp/
 XsNyAQmjAl8OLy/XCzbzMGljtzJA5RtohMxMQbVwEHdOo6+DFLEe9dlfHUNM71Ex/476
 /CSZJ4bwXA6nhA+7i+fKCSxQFIJ9286JI0RWsHzb1KceA2OtY7h8MFa2v5g2xZhem/H1
 9QgNF/SXXxd3XgGRvGy+31KiyGPPaRyQ+yZZeNEDl/nqPYodHrmu1C34T0/Qnkg5yN0N
 DJ1KI1d6YUGaeQNTKcaGnfu59z9aqHlg0CKtgvHK8CjciShYLbXxTcuZeT7AjGXwzwLh
 +3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677664395;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vVm2ijZ3wY3vwKPabNU+PBrwbUTBJBfFnL9ZZ4aBrfk=;
 b=TSlQOa0Z/JH67MCmmYHgPVvcH2GdOuULdlKayla03iry6mLgwRApZmmAzcO6KWPDqd
 zgaTPt8bJKOmMBHrOm812aUT4NhfBmLH7JqT2NTSNv5UIVreJ5dkSWwF4CiO0KMes6ZE
 ISFa3W/8vt63jeXwK5dzQ2ApaoS1mZKp/fUWTrRhXxLXGwe4uF96CEDzlm7wYvFZKNeS
 JhOY6KARYuauEpr20KDsK8hS1k6EkRRRXY5GgGBxQAYNjDvjqLLvFx5XL4MhEtK/zjvK
 Uw9hfJDOvgQ0Z2tTxUoU7IDulqFNkx/U+WaQHatlvXlwSRFcwEv2EK6pDXShKKNDKL4y
 vbCA==
X-Gm-Message-State: AO0yUKXd2h+uOm/b9OgnyZ8eKjZyklJDIL8eraLwVzDF6iTypSrKRllW
 XvXwdjM9vsGjqXSut7n6fW46EA==
X-Google-Smtp-Source: AK7set8CPzlU6u3WbrG+eMk2du/oZA+z3qcruE13b+PzUec0tOqk2HfBYdpjeyzDGptxwgKfIZvhuA==
X-Received: by 2002:a05:600c:3495:b0:3de:a525:1d05 with SMTP id
 a21-20020a05600c349500b003dea5251d05mr4728331wmq.8.1677664395119; 
 Wed, 01 Mar 2023 01:53:15 -0800 (PST)
Received: from localhost ([2a01:cb19:85e6:1900:2bf7:7388:731d:c4e1])
 by smtp.gmail.com with ESMTPSA id
 13-20020a05600c020d00b003dc1d668866sm18765830wmi.10.2023.03.01.01.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 01:53:14 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dan Carpenter <error27@gmail.com>, Julien STEPHAN <jstephan@baylibre.com>
Subject: Re: [PATCH] drm/mediatek: dsi: fix error codes in
 mtk_dsi_host_transfer()
In-Reply-To: <Y/yBC4yxTs+Po0TG@kili>
References: <Y/yBC4yxTs+Po0TG@kili>
Date: Wed, 01 Mar 2023 10:53:13 +0100
Message-ID: <87r0u83iie.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 02 Mar 2023 08:12:47 +0000
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
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Dan,

Thank you for your patch.

On lun., f=C3=A9vr. 27, 2023 at 13:08, Dan Carpenter <error27@gmail.com> wr=
ote:

> There is a type bug because the return statement:
>
> 	return ret < 0 ? ret : recv_cnt;
>
> will not return negatives on 64bit systems.  The problem is that the
> function returns ssize_t types, while "ret" is int and "recv_cnt" is a
> u32.  The negative values are type promoted to u32 and returned as
> positive values instead of negative error codes.
>
> Fixes: 81cc7e51c4f1 ("drm/mediatek: Allow commands to be sent during vide=
o mode")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 7d5250351193..8e99981ca0e1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1016,12 +1016,12 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_=
dsi_host *host,
>  				     const struct mipi_dsi_msg *msg)
>  {
>  	struct mtk_dsi *dsi =3D host_to_dsi(host);
> -	u32 recv_cnt, i;
> +	ssize_t recv_cnt;
>  	u8 read_data[16];
>  	void *src_addr;
>  	u8 irq_flag =3D CMD_DONE_INT_FLAG;
>  	u32 dsi_mode;
> -	int ret;
> +	int ret, i;
>=20=20
>  	dsi_mode =3D readl(dsi->regs + DSI_MODE_CTRL);
>  	if (dsi_mode & MODE) {
> @@ -1070,7 +1070,7 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_ds=
i_host *host,
>  	if (recv_cnt)
>  		memcpy(msg->rx_buf, src_addr, recv_cnt);
>=20=20
> -	DRM_INFO("dsi get %d byte data from the panel address(0x%x)\n",
> +	DRM_INFO("dsi get %zd byte data from the panel address(0x%x)\n",
>  		 recv_cnt, *((u8 *)(msg->tx_buf)));
>=20=20
>  restore_dsi_mode:
> --=20
> 2.39.1
