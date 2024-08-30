Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA5D966A72
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 22:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A7E10EAEF;
	Fri, 30 Aug 2024 20:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="KwfFWMSO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4F310EAEF
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 20:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1725049695;
 bh=8LEKb0uhp2A4HJXFfcjVpGZqK+nWvJvHYkdGnpkaJOc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KwfFWMSOXxuZ9aQ9w61rWlD/lHDZzxwvD4veZnVI0BehMjsAqB5424MhJRQ9mE4xs
 kDE57UTl1ZFYFx3vvY6jNbGzXZOy3/FHTE17aoxt989ZCaduHorM3k7SSFjyVWgyO7
 MdmVxXs4qQCdpbESe+pxGX+lzDlOxbaVa6cgREDQiLzP7p4z3H8i9vhlAYfIq35cr4
 qBNNAf7TnQ1RHuD0gHHPzWj0leVhlleFVRCkGV0xPssf23VXA3p8FA7BERON01iGDC
 xzucCuayX67jkvL1X6bYM4icXNI+wixHfTY+stS6lSyysYurF+NTDey2lzMaAwAksm
 uD1JJGDwCoLbA==
Received: from notapiano (pool-100-2-116-133.nycmny.fios.verizon.net
 [100.2.116.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 84F4C17E121B;
 Fri, 30 Aug 2024 22:28:14 +0200 (CEST)
Date: Fri, 30 Aug 2024 16:28:12 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 4/5] media: platform: mtk-mdp3: Use cmdq_pkt_create()
 and cmdq_pkt_destroy()
Message-ID: <2b03eacb-4cb6-451a-9b45-5c636ae5052f@notapiano>
References: <20240810090918.7457-1-chunkuang.hu@kernel.org>
 <20240810090918.7457-5-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240810090918.7457-5-chunkuang.hu@kernel.org>
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

On Sat, Aug 10, 2024 at 09:09:17AM +0000, Chun-Kuang Hu wrote:
> Use cmdq_pkt_create() and cmdq_pkt_destroy() common function
> instead of implementing mdp3 version.
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>  .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 45 ++-----------------
>  1 file changed, 4 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> index 0cddafedbecc..48432d60b49a 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
[..]
> @@ -538,7 +501,7 @@ static void mdp_auto_release_work(struct work_struct *work)
>  		wake_up(&mdp->callback_wq);
>  	}
>  
> -	mdp_cmdq_pkt_destroy(&cmd->pkt);
> +	cmdq_pkt_destroy(mdp->cmdq_clt, &cmd->pkt);

Hi,
this doesn't build:

drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c: In function ‘mdp_auto_release_work’:
drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:504:29: error: passing argument 1 of ‘cmdq_pkt_destroy’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  504 |         cmdq_pkt_destroy(mdp->cmdq_clt, &cmd->pkt);
      |                          ~~~^~~~~~~~~~
      |                             |
      |                             struct cmdq_client **
In file included from drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h:12,
                 from drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:10:
./include/linux/soc/mediatek/mtk-cmdq.h:111:43: note: expected ‘struct cmdq_client *’ but argument is of type ‘struct cmdq_client **’
  111 | void cmdq_pkt_destroy(struct cmdq_client *client, struct cmdq_pkt *pkt);
      |                       ~~~~~~~~~~~~~~~~~~~~^~~~~~

Same in other instances in this patch and in other patches in the series.

Thanks,
Nícolas
