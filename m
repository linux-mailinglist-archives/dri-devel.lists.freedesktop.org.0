Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E97F537A2B
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 13:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF75410E101;
	Mon, 30 May 2022 11:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542F610E101
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 11:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8VyoAg5ZFlu79SSDc3rfKS4ICjJpwoRquD3CfBZ6TtM=; b=iUk611ByWZqTdPUMZrYWfZb8Va
 yCKWmjQPiSoGFX/9hdU0bf2t4fclJClpBzs5B9Ar3AwQni7XpfViyY3BoITnQq6c66X03i2eRI/Ss
 04tSiTsXxTZfwee4HRl5qS7jlUml452YTtqrXEzAEcep0vvcuqTu0q+b/ZqdMhUN8ChIi+ohMldXj
 Cunxlfh1x0hb2nrZtNHjUyftWq70pm8ZCYGt79dhqK2lJupLbzYwFvOm6UqgHGfE8FDxaIfEkEsBN
 +IZR5hjoM0ID3Ie5SdHBdAW5LqByQfPKiaTswkG07rUNAC4NF0tFp8ea9D3e9pKrlY6mk/9BYbi9r
 PVaQBYlg==;
Received: from [2a01:799:961:d200:140a:b605:56ea:1c6d] (port=50308)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1nvdvM-0005i1-2S; Mon, 30 May 2022 13:51:04 +0200
Message-ID: <4fca264e-6c07-a68d-f8a1-52db555a2b2c@tronnes.org>
Date: Mon, 30 May 2022 13:51:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] drm/mipi-dbi: align max_chunk to 2 in spi_transfer
To: Yunhao Tian <t123yh.xyz@gmail.com>
References: <20220510030219.2486687-1-t123yh.xyz@gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220510030219.2486687-1-t123yh.xyz@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: David Lechner <david@lechnology.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 10.05.2022 05.02, skrev Yunhao Tian:
> In __spi_validate, there's a validation that no partial transfers
> are accepted (xfer->len % w_size must be zero). When
> max_chunk is not a multiple of bpw (e.g. max_chunk = 65535,
> bpw = 16), the transfer will be rejected.
> 
> This patch aligns max_chunk to 2 bytes (the maximum value of bpw is 16),
> so that no partial transfer will occur.
> 
> Fixes: d23d4d4dac01 ("drm/tinydrm: Move tinydrm_spi_transfer()")
> 
> Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>
> ---

Thanks, applied to drm-misc-next.

Noralf.

>  drivers/gpu/drm/drm_mipi_dbi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index 71b646c4131f..00d470ff071d 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -1183,6 +1183,13 @@ int mipi_dbi_spi_transfer(struct spi_device *spi, u32 speed_hz,
>  	size_t chunk;
>  	int ret;
>  
> +	/* In __spi_validate, there's a validation that no partial transfers
> +	 * are accepted (xfer->len % w_size must be zero).
> +	 * Here we align max_chunk to multiple of 2 (16bits),
> +	 * to prevent transfers from being rejected.
> +	 */
> +	max_chunk = ALIGN_DOWN(max_chunk, 2);
> +
>  	spi_message_init_with_transfers(&m, &tr, 1);
>  
>  	while (len) {
