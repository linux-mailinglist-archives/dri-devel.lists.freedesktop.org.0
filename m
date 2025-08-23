Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBBCB3299B
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 17:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B60D10E0D9;
	Sat, 23 Aug 2025 15:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fFWJB8rU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C147A10E0D9
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 15:34:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B28B360007
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 15:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A0F1C4CEE7
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 15:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755963250;
 bh=kTALLSkXGcreCjIk5ouErmIww5GXzdh4sJZ7jSXzRQo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fFWJB8rUZTR7k1mJNnrOp0U9u6ycN8+Jk8coMcewCtLpogIycNkCI8WXsKET7qRB3
 pltxGuwxlWfyUyFzOT0Y6UANrSTTY7h+e7Tt0uYdoSK+vN5376+mmga3ro7rt8AcKd
 xQeJ4b0D11X7cokEVT6D+Z06sQ8efpan8xGj9KS3eAJDbUK1HzkS7xhEKduqugylqf
 1arOlaqD4Uxogfzbl2IJUvMpwbuKakn+ZvTkXngEoExybeS67OA8uzF4u11pZkOjbu
 gabqZmJULI6gjywr73jsXKqhTv55m20yYbXP/ZS7VRp5XfoQGy+1vh8OUMFiyHFlSG
 plEWMicPJ/Srg==
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b49d98691faso68922a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 08:34:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVV5izAXBYwk9Ftzi76aWEHa9cmbuQ6cmroVdNMzzYby7TSV50z8k+wUW9pL6nbBF2pwfGgFEEzIqk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/cPmfCQ2R37MCBlRuMoybBNvuQp4G7JP+eLSKWbzGie5zZDJ6
 u/JBMaM6wK/UexW+6I1C3eA8qxdkJn1kSSwE8i0PPLDxqeTNa7QQXqWpfuw/SbMRb42uiZltjaO
 tNdOKiy1FSiNMJyKm+EYfZoHv3iyCVw==
X-Google-Smtp-Source: AGHT+IH4plAM5KbETmxDDjvC+xXEie7PQ9eZg3ukysPt7y/ninQ9lLmP959MYy/IC7jqNGnL7Y1cqkNrWOy3mIJtmoY=
X-Received: by 2002:a17:903:2012:b0:240:2145:e51d with SMTP id
 d9443c01a7336-2462ef440e3mr63417535ad.31.1755963250030; Sat, 23 Aug 2025
 08:34:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250818-mt8173-fix-hdmi-issue-v1-1-55aff9b0295d@collabora.com>
In-Reply-To: <20250818-mt8173-fix-hdmi-issue-v1-1-55aff9b0295d@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 23 Aug 2025 23:35:19 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9mS+VRu9T45xawO-jdT0Zk+JR3XMbj7So3LuiUfO8_0w@mail.gmail.com>
X-Gm-Features: Ac12FXw07uZw-AZ_HWLRa8XVVMEzzj7o_IkjPil9tjxcN8KsqqRfui-EkO3JR-w
Message-ID: <CAAOTY_9mS+VRu9T45xawO-jdT0Zk+JR3XMbj7So3LuiUfO8_0w@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_hdmi: fix inverted parameters in some
 regmap_update_bits calls
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, 
 Guillaume Ranquet <granquet@baylibre.com>, kernel@collabora.com, 
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

Hi, Louis:

Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> =E6=96=BC 2025=E5=B9=
=B48=E6=9C=8818=E6=97=A5 =E9=80=B1=E4=B8=80
=E4=B8=8B=E5=8D=8810:18=E5=AF=AB=E9=81=93=EF=BC=9A
>
> In mtk_hdmi driver, a recent change replaced custom register access
> function calls by regmap ones, but two replacements by regmap_update_bits
> were done incorrectly, because original offset and mask parameters were
> inverted, so fix them.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: d6e25b3590a0 ("drm/mediatek: hdmi: Use regmap instead of iomem for=
 main registers")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index 845fd8aa43c3c91659808d9e6bb78758d1f9b857..b766dd5e6c8de6d16bff50972=
b45c3c1a083b985 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -182,8 +182,8 @@ static inline struct mtk_hdmi *hdmi_ctx_from_bridge(s=
truct drm_bridge *b)
>
>  static void mtk_hdmi_hw_vid_black(struct mtk_hdmi *hdmi, bool black)
>  {
> -       regmap_update_bits(hdmi->regs, VIDEO_SOURCE_SEL,
> -                          VIDEO_CFG_4, black ? GEN_RGB : NORMAL_PATH);
> +       regmap_update_bits(hdmi->regs, VIDEO_CFG_4,
> +                          VIDEO_SOURCE_SEL, black ? GEN_RGB : NORMAL_PAT=
H);
>  }
>
>  static void mtk_hdmi_hw_make_reg_writable(struct mtk_hdmi *hdmi, bool en=
able)
> @@ -310,8 +310,8 @@ static void mtk_hdmi_hw_send_info_frame(struct mtk_hd=
mi *hdmi, u8 *buffer,
>
>  static void mtk_hdmi_hw_send_aud_packet(struct mtk_hdmi *hdmi, bool enab=
le)
>  {
> -       regmap_update_bits(hdmi->regs, AUDIO_PACKET_OFF,
> -                          GRL_SHIFT_R2, enable ? 0 : AUDIO_PACKET_OFF);
> +       regmap_update_bits(hdmi->regs, GRL_SHIFT_R2,
> +                          AUDIO_PACKET_OFF, enable ? 0 : AUDIO_PACKET_OF=
F);
>  }
>
>  static void mtk_hdmi_hw_config_sys(struct mtk_hdmi *hdmi)
>
> ---
> base-commit: afb39542bbf14acf910012eee2d4159add05d384
> change-id: 20250818-mt8173-fix-hdmi-issue-287cf353b077
>
> Best regards,
> --
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>
