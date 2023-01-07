Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C03A66119B
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 21:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D245910E1D0;
	Sat,  7 Jan 2023 20:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:404::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A1810E1D0
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 20:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=zNjKwUpl4MAZri6WkLaSE7g3L6zmbqPHmA9ZJ9Bzi1w=;
 b=P4J8i7CuwvpmkbZ5a1nsowUUAbTvKNu9VrELvmrf8z8IsVdysY8xVbHJcPji5OUGYY0mKyPRUJK0L
 q2eAqJpoU0YYTBa+th94PE+xy0++ga2HdaVh1ETK7UcQU+lelpnPe9vI5PsUX0L1//kAhIyQHinC1y
 CIpouzk/o+Uu5lUG4zv0OgJ9In2MISZimMN4WtAyzVdlh6I29vgHEk/FEU7v3IXCnCDW0OwDKy07JV
 bdbQfulVL4QbiZLfT+5Ypo7a2fe2AESQ5FwLqCvfmudujtG5DLxVUmkPjNrfNke8tGVTvbMqgCHaGJ
 kxnWoTN7fVeIHS+iOkJR9R/v1IL3LEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=zNjKwUpl4MAZri6WkLaSE7g3L6zmbqPHmA9ZJ9Bzi1w=;
 b=/5wL/FcJR0pGFXvug0CaJFWWqZOoKGhwrv3hW6ZqandXERIJZ+x5mtwNcs7aE5hZJwKV/R70kMOUB
 nLj6Px/CA==
X-HalOne-ID: 328201d2-8eca-11ed-857d-7703b0afff57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5 (Halon) with ESMTPSA
 id 328201d2-8eca-11ed-857d-7703b0afff57;
 Sat, 07 Jan 2023 20:31:02 +0000 (UTC)
Date: Sat, 7 Jan 2023 21:31:01 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: xinlei.lee@mediatek.com
Subject: Re: [PATCH 2/2] drm/panel: boe-tv101wum-nl6: Reduce lcm_reset to
 send initial code time
Message-ID: <Y7nWhciY7cru78lQ@ravnborg.org>
References: <1672974321-18947-1-git-send-email-xinlei.lee@mediatek.com>
 <1672974321-18947-3-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1672974321-18947-3-git-send-email-xinlei.lee@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, thierry.reding@gmail.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 11:05:21AM +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Since the panel spec stipulates that the time from lcm_reset to DSI to
> send the initial code should be greater than 6ms and less than 40ms,
> so reduce the delay before sending the initial code and avoid panel
> exceptions.

The changelog says "reduce the delay", but the patch removes the delay.
Are there other delays that make sure the "greater than 6 ms" is OK?

	Sam

> 
> Fixes: a869b9db7adf ("drm/panel: support for boe tv101wum-nl6 wuxga dsi video mode panel")
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index 857a2f0420d7..f0093035f1ff 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -780,7 +780,6 @@ static const struct panel_init_cmd inx_hj110iz_init_cmd[] = {
>  };
>  
>  static const struct panel_init_cmd boe_init_cmd[] = {
> -	_INIT_DELAY_CMD(24),
>  	_INIT_DCS_CMD(0xB0, 0x05),
>  	_INIT_DCS_CMD(0xB1, 0xE5),
>  	_INIT_DCS_CMD(0xB3, 0x52),
> -- 
> 2.18.0
