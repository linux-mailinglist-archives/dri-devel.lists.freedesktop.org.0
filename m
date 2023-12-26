Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 269B281E6F0
	for <lists+dri-devel@lfdr.de>; Tue, 26 Dec 2023 11:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF7D10E07E;
	Tue, 26 Dec 2023 10:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D0510E07E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Dec 2023 10:46:57 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id
 ada2fe7eead31-4672008b2c7so66734137.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Dec 2023 02:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1703587616; x=1704192416;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9XQX9ADRpW0fV0acmqNA3+e/T+xSUGBzzTRQ8O4YnQM=;
 b=WcIlBNkzzIY98BgpvY4zscQfd296MmbQ8GPSkqgLx2LTpdJZtJK3OroYuSGEH7iZvj
 1EKG4zRd9058i9Y6rgMpA74UAGt+Kn6qb6JV28ipiIYUssXfS/Sa/vI1DwfO0gehuYSz
 16m2+7SFxV+gqcnVSTWo+JK6HoWhbK/KvKcF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703587616; x=1704192416;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9XQX9ADRpW0fV0acmqNA3+e/T+xSUGBzzTRQ8O4YnQM=;
 b=ixa+LLTHHbbMO4VhbREUGZsYyHicftkDoWN2ssu55jJmft+EMCpgI9z4pbSD2O2szD
 n7gi9sKKmX8L3U7ATczLLETmHwuhY2OcpuRmpgMzOxGD1bbm/pCDjAi/8VRJnQu0y2n1
 sDc9iwIbKdWoXgWXUwhHvQo6jM5Pi/FzkFiVentCLx72KyGxx1plkvj0BsSyxj45NrNW
 /jpWGLUfFLa9LtqtVHbjCpBhw48E9+5YB/zQ0ux4rGAIjvEOyT0QK4UERi2qir3L5iLO
 cPuaCX1Y1qXM5seFyDc3PB5K9ja0CJg4lxZ61hUlErRDuz2ikCzmdGqNAspf9SuI17A2
 wcEQ==
X-Gm-Message-State: AOJu0YweEQh+5vS1+y0fyQ60HLW90PmSYBUK8MHjdL8C3LCMeqwwi+/k
 s6Rth4kIDDCgy4SJjFmNlvvNTX6eIVwVEZ2XUwmqDkx28Q==
X-Google-Smtp-Source: AGHT+IFAuAzbRQP7VQ6bKBh18V2M8T1fTbH+ouTD3wQvWahGLMjP+yd2YADJv5pFsqpysRntQRilWw==
X-Received: by 2002:a05:6102:48b:b0:466:f50b:69ae with SMTP id
 n11-20020a056102048b00b00466f50b69aemr1941890vsa.26.1703587616433; 
 Tue, 26 Dec 2023 02:46:56 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com.
 [209.85.217.51]) by smtp.gmail.com with ESMTPSA id
 d22-20020ab03796000000b007cc9525263asm186704uav.1.2023.12.26.02.46.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Dec 2023 02:46:55 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id
 ada2fe7eead31-4672008b2c7so66724137.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Dec 2023 02:46:55 -0800 (PST)
X-Received: by 2002:a05:6102:5593:b0:464:77f1:f34a with SMTP id
 dc19-20020a056102559300b0046477f1f34amr3642595vsb.24.1703587614863; Tue, 26
 Dec 2023 02:46:54 -0800 (PST)
MIME-Version: 1.0
References: <20231220135722.192080-1-angelogioacchino.delregno@collabora.com>
 <20231220135722.192080-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231220135722.192080-2-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 26 Dec 2023 18:46:18 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng+kkJS-g3FHe4SC-r1a6hegj3=Any07TCdvTU_apvZNg@mail.gmail.com>
Message-ID: <CAC=S1ng+kkJS-g3FHe4SC-r1a6hegj3=Any07TCdvTU_apvZNg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/mediatek: dsi: Use GENMASK() for register mask
 definitions
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
 matthias.bgg@gmail.com, kernel@collabora.com, airlied@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo,

On Wed, Dec 20, 2023 at 9:57=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Change magic numerical masks with usage of the GENMASK() macro
> to improve readability.
>
> This commit brings no functional changes.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 46 ++++++++++++++++--------------
>  1 file changed, 24 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index a2fdfc8ddb15..23d2c5be8dbb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -58,18 +58,18 @@
>
>  #define DSI_TXRX_CTRL          0x18
>  #define VC_NUM                         BIT(1)
> -#define LANE_NUM                       (0xf << 2)
> +#define LANE_NUM                       GENMASK(5, 2)
>  #define DIS_EOT                                BIT(6)
>  #define NULL_EN                                BIT(7)
>  #define TE_FREERUN                     BIT(8)
>  #define EXT_TE_EN                      BIT(9)
>  #define EXT_TE_EDGE                    BIT(10)
> -#define MAX_RTN_SIZE                   (0xf << 12)
> +#define MAX_RTN_SIZE                   GENMASK(15, 12)
>  #define HSTX_CKLP_EN                   BIT(16)
>
>  #define DSI_PSCTRL             0x1c
> -#define DSI_PS_WC                      0x3fff
> -#define DSI_PS_SEL                     (3 << 16)
> +#define DSI_PS_WC                      GENMASK(14, 0)
> +#define DSI_PS_SEL                     GENMASK(19, 16)

GENMASK(17, 16)
>
>  #define PACKED_PS_16BIT_RGB565         (0 << 16)
>  #define LOOSELY_PS_18BIT_RGB666                (1 << 16)
>  #define PACKED_PS_18BIT_RGB666         (2 << 16)
> @@ -109,26 +109,27 @@
>  #define LD0_WAKEUP_EN                  BIT(2)
>
>  #define DSI_PHY_TIMECON0       0x110
> -#define LPX                            (0xff << 0)
> -#define HS_PREP                                (0xff << 8)
> -#define HS_ZERO                                (0xff << 16)
> -#define HS_TRAIL                       (0xff << 24)
> +#define LPX                            GENMASK(7, 0)
> +#define HS_PREP                                GENMASK(15, 8)
> +#define HS_ZERO                                GENMASK(23, 16)
> +#define HS_TRAIL                       GENMASK(31, 24)
>
>  #define DSI_PHY_TIMECON1       0x114
> -#define TA_GO                          (0xff << 0)
> -#define TA_SURE                                (0xff << 8)
> -#define TA_GET                         (0xff << 16)
> -#define DA_HS_EXIT                     (0xff << 24)
> +#define TA_GO                          GENMASK(7, 0)
> +#define TA_SURE                                GENMASK(15, 8)
> +#define TA_GET                         GENMASK(23, 16)
> +#define DA_HS_EXIT                     GENMASK(31, 24)
>
>  #define DSI_PHY_TIMECON2       0x118
> -#define CONT_DET                       (0xff << 0)
> -#define CLK_ZERO                       (0xff << 16)
> -#define CLK_TRAIL                      (0xff << 24)
> +#define CONT_DET                       GENMASK(7, 0)
> +#define DA_HS_SYNC                     GENMASK(15, 8)

This is new, so please introduce it in a separate patch if intended.

The rest looks good to me.

Regards,
Fei


>
> +#define CLK_ZERO                       GENMASK(23, 16)
> +#define CLK_TRAIL                      GENMASK(31, 24)
>
>  #define DSI_PHY_TIMECON3       0x11c
> -#define CLK_HS_PREP                    (0xff << 0)
> -#define CLK_HS_POST                    (0xff << 8)
> -#define CLK_HS_EXIT                    (0xff << 16)
> +#define CLK_HS_PREP                    GENMASK(7, 0)
> +#define CLK_HS_POST                    GENMASK(15, 8)
> +#define CLK_HS_EXIT                    GENMASK(23, 16)
>
>  #define DSI_VM_CMD_CON         0x130
>  #define VM_CMD_EN                      BIT(0)
> @@ -138,13 +139,14 @@
>  #define FORCE_COMMIT                   BIT(0)
>  #define BYPASS_SHADOW                  BIT(1)
>
> -#define CONFIG                         (0xff << 0)
> +/* CMDQ related bits */
> +#define CONFIG                         GENMASK(7, 0)
>  #define SHORT_PACKET                   0
>  #define LONG_PACKET                    2
>  #define BTA                            BIT(2)
> -#define DATA_ID                                (0xff << 8)
> -#define DATA_0                         (0xff << 16)
> -#define DATA_1                         (0xff << 24)
> +#define DATA_ID                                GENMASK(15, 8)
> +#define DATA_0                         GENMASK(23, 16)
> +#define DATA_1                         GENMASK(31, 24)
>
>  #define NS_TO_CYCLE(n, c)    ((n) / (c) + (((n) % (c)) ? 1 : 0))
>
> --
> 2.43.0
>
>
