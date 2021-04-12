Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE55435BCEF
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 10:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594568925A;
	Mon, 12 Apr 2021 08:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 91F6C8925A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 08:46:28 +0000 (UTC)
X-UUID: 2ae803f1d74144b48a69dd20ece44968-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=RweJgmRF+LDjf8Ds2biby3dH1UAHrROV6leebHr8sAA=; 
 b=p479TbB3I8hc2HqD2k+sf8GTw9RuJdpQFbcHLXQIExKdJCJf+UDV+bRvMU1NbnSysQ3EM7+Cf7dkTrr1UFsm3stje5TqbROEkB3biIKhmc8tAzievCr+vrVO9fhKuzo2UDCwZ5bTPEKQsZArZAyPBD+A9pF38J+kYTqgS6Aybz0=;
X-UUID: 2ae803f1d74144b48a69dd20ece44968-20210412
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 846852216; Mon, 12 Apr 2021 16:46:25 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 16:46:23 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 16:46:23 +0800
Message-ID: <1618217183.16010.4.camel@mtksdaap41>
Subject: Re: [PATCH v1] drm/mediatek: adjust rdma fifo threshold calculate
 formula
From: CK Hu <ck.hu@mediatek.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Date: Mon, 12 Apr 2021 16:46:23 +0800
In-Reply-To: <1618212332-3547-2-git-send-email-yongqiang.niu@mediatek.com>
References: <1618212332-3547-1-git-send-email-yongqiang.niu@mediatek.com>
 <1618212332-3547-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B93D2EA023810F2AB99CA9F7808B7137FCA922C9F707457EE34B03921C380BE52000:8
X-MTK: N
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Yongqiang:

On Mon, 2021-04-12 at 15:25 +0800, Yongqiang Niu wrote:
> the orginal formula will caused rdma fifo threshold config overflow
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> index 728aaad..8c9371b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -167,7 +167,7 @@ void mtk_rdma_config(struct device *dev, unsigned int width,
>  	 * output threshold to 6 microseconds with 7/6 overhead to
>  	 * account for blanking, and with a pixel depth of 4 bytes:
>  	 */
> -	threshold = width * height * vrefresh * 4 * 7 / 1000000;
> +	threshold = rdma_fifo_size * 7 / 10;

It's better to set threshold by width and height, but it seems that no
one could come out a solution for all SoC. I could just accept this
solution, but I need some addition comment for this solution. How do you
decide 7/10? In the future, another may need to modify this value and he
need to know why you use 7/10. If you just choose it at random, just
tell us that you just randomly choose it.

Regards,
CK

>  	reg = RDMA_FIFO_UNDERFLOW_EN |
>  	      RDMA_FIFO_PSEUDO_SIZE(rdma_fifo_size) |
>  	      RDMA_OUTPUT_VALID_FIFO_THRESHOLD(threshold);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
