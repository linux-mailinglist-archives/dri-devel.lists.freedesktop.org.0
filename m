Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD3F92CDD1
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 11:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51EAC10E13B;
	Wed, 10 Jul 2024 09:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CDB10E13B
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 09:02:08 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a02:810b:4340:4ee9:4685:ff:fe12:5967])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 54D733BC4;
 Wed, 10 Jul 2024 11:02:04 +0200 (CEST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jul 2024 11:02:03 +0200
Message-Id: <D2LQJROQYIY3.2Q88EXS8HUDLQ@kernel.org>
Subject: Re: [PATCH v1 4/4] drm/panel: ili9806e: Break some CMDS into helper
 functions
Cc: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Cong Yang" <yangcong5@huaqin.corp-partner.google.com>,
 <quic_jesszhan@quicinc.com>, <neil.armstrong@linaro.org>,
 <dianders@chromium.org>, <linus.walleij@linaro.org>, <airlied@gmail.com>,
 <dmitry.baryshkov@linaro.org>
X-Mailer: aerc 0.16.0
References: <20240710084715.1119935-1-yangcong5@huaqin.corp-partner.google.com>
 <20240710084715.1119935-5-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240710084715.1119935-5-yangcong5@huaqin.corp-partner.google.com>
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

On Wed Jul 10, 2024 at 10:47 AM CEST, Cong Yang wrote:
> Break select page cmds into helper function.

Why though? I don't find that anything easier to read. In fact, I
deliberately chose not to factor that out into a function. It's just
a sequence of magic commands, taken straight from the datasheet. So,
I'd like to keep it that way.

-michael

> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9806e.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c b/drivers/gpu/=
drm/panel/panel-ilitek-ili9806e.c
> index e4a44cd26c4d..68fb9a1a4d80 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
> @@ -35,6 +35,12 @@ struct ili9806e_panel {
>  	enum drm_panel_orientation orientation;
>  };
> =20
> +#define ILI9806E_DCS_SWITCH_PAGE	0xff
> +
> +#define ili9806e_switch_page(ctx, page) \
> +	mipi_dsi_dcs_write_seq_multi(ctx, ILI9806E_DCS_SWITCH_PAGE, \
> +				     0xff, 0x98, 0x06, 0x04, (page))
> +
>  static const char * const regulator_names[] =3D {
>  	"vdd",
>  	"vccio",
> @@ -227,7 +233,7 @@ static void ili9806e_dsi_remove(struct mipi_dsi_devic=
e *dsi)
>  static void com35h3p70ulc_init(struct mipi_dsi_multi_context *ctx)
>  {
>  	/* Switch to page 1 */
> -	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x04, 0x01);
> +	ili9806e_switch_page(ctx, 0x01);
>  	/* Interface Settings */
>  	mipi_dsi_dcs_write_seq_multi(ctx, 0x08, 0x18);
>  	mipi_dsi_dcs_write_seq_multi(ctx, 0x21, 0x01);
> @@ -285,14 +291,14 @@ static void com35h3p70ulc_init(struct mipi_dsi_mult=
i_context *ctx)
>  	mipi_dsi_dcs_write_seq_multi(ctx, 0xcf, 0x0a);
> =20
>  	/* Switch to page 7 */
> -	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x04, 0x07);
> +	ili9806e_switch_page(ctx, 0x07);
>  	/* Power Control */
>  	mipi_dsi_dcs_write_seq_multi(ctx, 0x06, 0x00);
>  	mipi_dsi_dcs_write_seq_multi(ctx, 0x18, 0x1d);
>  	mipi_dsi_dcs_write_seq_multi(ctx, 0x17, 0x32);
> =20
>  	/* Switch to page 6 */
> -	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x04, 0x06);
> +	ili9806e_switch_page(ctx, 0x06);
>  	/* GIP settings */
>  	mipi_dsi_dcs_write_seq_multi(ctx, 0x00, 0x20);
>  	mipi_dsi_dcs_write_seq_multi(ctx, 0x01, 0x02);
> @@ -352,7 +358,7 @@ static void com35h3p70ulc_init(struct mipi_dsi_multi_=
context *ctx)
>  	mipi_dsi_dcs_write_seq_multi(ctx, 0x53, 0x12);
> =20
>  	/* Switch to page 0 */
> -	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x04, 0x00);
> +	ili9806e_switch_page(ctx, 0x00);
>  	/* Interface Pixel format */
>  	mipi_dsi_dcs_write_seq_multi(ctx, 0x3a, 0x60);
>  };

