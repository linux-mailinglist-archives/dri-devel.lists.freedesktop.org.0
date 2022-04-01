Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 331764EFBDD
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 22:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A728010E0F3;
	Fri,  1 Apr 2022 20:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FC110E0F3
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 20:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1648846385;
 bh=XBQN4Y8cY6863locdXVbzi2Vq6V+H1v2SxPMFzNkCPo=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=OYTqi2prkndGI/ORGpjS+vnKtXl+OmGYiTqwelq0yTAS7/Jjgk+SIjpx0vY3eX+9Y
 Cpen5R+JveUaI3t44wRlqs9rF/FH7IYYmVz6t8wgx6jcmUYu6Szv5crjYh3cWyJ0hM
 M6arbyu7Bz3DghRqe/joNvt2qfAYXTtuqBFjO6yo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.191.12]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtOGa-1nsbwV1DuI-00uupR; Fri, 01
 Apr 2022 22:53:05 +0200
Message-ID: <f6802e83-0fc6-ffe6-cea1-d2a39d768514@gmx.de>
Date: Fri, 1 Apr 2022 22:53:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] video: fbdev: sis: fix potential NULL dereference in
 sisfb_post_sis300()
Content-Language: en-US
To: Haowen Bai <baihaowen@meizu.com>,
 Thomas Winischhofer <thomas@winischhofer.net>
References: <1648784476-20803-1-git-send-email-baihaowen@meizu.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <1648784476-20803-1-git-send-email-baihaowen@meizu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jqSUrZEkWBRjiAbZGSBMpExq4v+hgcH4biJGJErpd8gmlIXCNtj
 HSBeMgO224TpGgAVQdXvF2pmAs9LVA+J89TQNBpsezoHFqUgLMPEPevYjjkn8JlDQbPZ36b
 lQ8n0RY3EDclGiYEIetK31BqjjXu6e82as1P3vma4VwQb8B3MAsqxOWmPaC47ilbSCyrwYL
 RGFONn2o0MSQv+kZTN1Cg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8KFcAgyHg6o=:11aIfxQ0Zlsyeanjppqz0z
 OLNfjn00nnTIgmKHvnUhJ8klyMyGa7czYWsXDdBhiUv2dMESFbBa+ll/lAv4kMnfaXxLzoDxP
 DSaMrtArtBVxzE9vFHMzopDwDrYxEiqXkGU4me+SEnCmI//LZKBeRoBSTnW3rlj4vyK5d06P6
 EVyvtQcRuQEGRR2erhzUoGzg02RHdBz34oMC3zHJ0Nvod/3iL3t6pztdgM4zg+02TQv7K6tKt
 LXXmVS+0RYDMWo0/fx54WcxjboICJCT4al+Rh13ieDpmC5SVSbYo9t3B+kFg2e1ZSbc08mEWK
 isJ9ZoArTrwabqfz8zjazBwtECiHkwb1VW9eUm+AQCbQYOAIlDcAcrtyvzNvVUiMUQRX3vLIs
 0gIdEcX3IXY4S1HPo0Gp94qhq0Z5XTsHK3yncfLIP4j2N3j/yu7S2ZbtCXS7xMvgRlZdmGCxK
 0Vpwf4coxclXBqM7O1tRdPFwBc7ucZH1RHymZO0aP7vRnv53IqO5tlRIPMO5C5jmpcWvWejzr
 TwWFZNKsp+jq6yNkPxMK2q4DB0I7IEFcDl4N6/AyDV8zPF3Krjob+6pXtUUIOEKrc09BNx+kY
 feTd7dZMlO9VWDNw9lk01o69ss0PxuDK4X5CztukKXpsaJ33XPD1xdpt8MdeJNnJmtGbsNVGs
 DAiIfGDxB+LzLkCue+oids+pGAKEA5CoMkzHbReqGd8PZLLrl+NZzVdJOQrIQ2tDjIFkMiwPM
 CyvmIPQBZyFvvRckE0qGS1ELL0jzhIcohc/h6PJjCKVNsCCdJWZoQltfy/9gyZKKIeQwwdT2W
 /PydMo6n/qsr/crSmzyRdMAymNOt6qV6G1RSF5eNq2zThoKuGWP78FPNZRZh3OhJHmIT6YGvA
 BT6zcofyzQyisXI3VR1Znh2OposN+zUqRVYwzBytr6rY6y3dbURQ/jB4n1q7819ii8+O1DG+m
 22QgFmNy5/gpqCo1B38asxfFlBLd5eTg1J/UtuIUFMPEBRCdkBcmzGdbt2WcYynIiFGu6VD5s
 ablP2n2qanFtPOKQpleUWMT6CDFeB4i0H96Q6D9qozBQ4eewJOFr57PC/V2A9OiOq8QIY9BAh
 i3RPaaAulys7Rw=
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/1/22 05:41, Haowen Bai wrote:
> bios could be null without checking null and return in this function,
> but still dereference bios[0xf5].
>
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>

applied.
Thanks!
Helge

> ---
>  drivers/video/fbdev/sis/sis_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/si=
s/sis_main.c
> index 742f629..24a0299 100644
> --- a/drivers/video/fbdev/sis/sis_main.c
> +++ b/drivers/video/fbdev/sis/sis_main.c
> @@ -4463,7 +4463,7 @@ static void sisfb_post_sis300(struct pci_dev *pdev=
)
>  		SiS_SetReg(SISCR, 0x37, 0x02);
>  		SiS_SetReg(SISPART2, 0x00, 0x1c);
>  		v4 =3D 0x00; v5 =3D 0x00; v6 =3D 0x10;
> -		if(ivideo->SiS_Pr.UseROM) {
> +		if (ivideo->SiS_Pr.UseROM && bios) {
>  			v4 =3D bios[0xf5];
>  			v5 =3D bios[0xf6];
>  			v6 =3D bios[0xf7];

