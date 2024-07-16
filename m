Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE07393222E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 10:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8FE10E5D5;
	Tue, 16 Jul 2024 08:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Tue, 16 Jul 2024 08:47:23 UTC
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9A910E5D5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 08:47:23 +0000 (UTC)
X-UUID: 4dc2ebf8434f11ef93f4611109254879-20240716
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:b0a96405-bd71-4eb7-91c7-f9adbea33fd2, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:0c9d032ef2420045319e43128f573d74,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,URL:1
 ,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 4dc2ebf8434f11ef93f4611109254879-20240716
Received: from node2.com.cn [(10.44.16.197)] by mailgw.kylinos.cn
 (envelope-from <oushixiong@kylinos.cn>) (Generic MTA)
 with ESMTP id 1259294220; Tue, 16 Jul 2024 16:42:15 +0800
Received: from node2.com.cn (localhost [127.0.0.1])
 by node2.com.cn (NSMail) with SMTP id 94397B8075B2;
 Tue, 16 Jul 2024 16:42:15 +0800 (CST)
X-ns-mid: postfix-66963267-3778932
Received: from [10.42.20.83] (unknown [10.42.20.83])
 by node2.com.cn (NSMail) with ESMTPA id 2F181B8075B2;
 Tue, 16 Jul 2024 08:42:12 +0000 (UTC)
Message-ID: <6c02e6b7-75c8-7f9a-2d00-1627345f40ae@kylinos.cn>
Date: Tue, 16 Jul 2024 16:42:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 5/7] drm/ast: Support ASTDP and VGA at the same time
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 airlied@redhat.com, daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20240715093936.793552-1-tzimmermann@suse.de>
 <20240715093936.793552-6-tzimmermann@suse.de>
Content-Language: en-US
From: oushixiong <oushixiong@kylinos.cn>
In-Reply-To: <20240715093936.793552-6-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Tested-by: Shixiong Ou <oushixiong@kylinos.cn>

=E5=9C=A8 2024/7/15 17:39, Thomas Zimmermann =E5=86=99=E9=81=93:
> AST2600 can host VGA and DisplayPort outputs. Support both on the
> same device. As userspace can often only support a single output per
> CRTC, connectors are prioritized against each other by the probe
> helpers.
>
> Reported-by: Shixiong Ou <oushixiong@kylinos.cn>
> Closes: https://lore.kernel.org/dri-devel/20240711090102.352213-1-oushi=
xiong1025@163.com/
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_main.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_m=
ain.c
> index 0637abb70361..d43aedaa8dd0 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -115,7 +115,7 @@ static void ast_detect_tx_chip(struct ast_device *a=
st, bool need_post)
>   	} else if (IS_AST_GEN7(ast)) {
>   		if (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD1, TX_TYPE_MASK) =
=3D=3D
>   		    ASTDP_DPMCU_TX) {
> -			ast->tx_chip_types =3D AST_TX_ASTDP_BIT;
> +			ast->tx_chip_types |=3D AST_TX_ASTDP_BIT;
>   			ast_dp_launch(&ast->base);
>   		}
>   	}
