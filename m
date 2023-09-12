Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E6C79C7C5
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 09:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E135910E360;
	Tue, 12 Sep 2023 07:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Tue, 12 Sep 2023 07:12:08 UTC
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6045C10E360;
 Tue, 12 Sep 2023 07:12:08 +0000 (UTC)
X-UUID: 4c5f962676df41fd88c33b35345abea5-20230912
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:99d3588d-76c7-47f3-8d5b-9077c3b64bd4, IP:5,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-4
X-CID-INFO: VERSION:1.1.31, REQID:99d3588d-76c7-47f3-8d5b-9077c3b64bd4, IP:5,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:-4
X-CID-META: VersionHash:0ad78a4, CLOUDID:17ad98ef-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:2309121506533HBDAXDZ,BulkQuantity:0,Recheck:0,SF:19|43|64|38|24|17|1
 02,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
 L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS
X-UUID: 4c5f962676df41fd88c33b35345abea5-20230912
X-User: zhouzongmin@kylinos.cn
Received: from [172.20.12.156] [(111.48.58.12)] by mailgw
 (envelope-from <zhouzongmin@kylinos.cn>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1882865759; Tue, 12 Sep 2023 15:06:52 +0800
Message-ID: <0fce832b81d676da8bde28bc7acf4d56932f244d.camel@kylinos.cn>
Subject: Re: [RESEND PATCH] drm/qxl: prevent memory leak
From: zongmin zhou <zhouzongmin@kylinos.cn>
To: airlied@redhat.com, kraxel@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Date: Tue, 12 Sep 2023 15:06:35 +0800
In-Reply-To: <20230801025309.4049813-1-zhouzongmin@kylinos.cn>
References: <20230425014543.3448839-1-zhouzongmin@kylinos.cn>
 <20230801025309.4049813-1-zhouzongmin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
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
Cc: spice-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2023-08-01 at 10:53 +0800, Zongmin Zhou wrote:
> The allocated memory for qdev->dumb_heads should be released
> in qxl_destroy_monitors_object before qxl suspend.
> otherwise,qxl_create_monitors_object will be called to
> reallocate memory for qdev->dumb_heads after qxl resume,
> it will cause memory leak.
>=20
> Signed-off-by: Zongmin Zhou<zhouzongmin@kylinos.cn>
> ---
> =C2=A0drivers/gpu/drm/qxl/qxl_display.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c
> b/drivers/gpu/drm/qxl/qxl_display.c
> index 6492a70e3c39..404b0483bb7c 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -1229,6 +1229,9 @@ int qxl_destroy_monitors_object(struct
> qxl_device *qdev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!qdev->monitors_confi=
g_bo)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kfree(qdev->dumb_heads);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qdev->dumb_heads =3D NULL;
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qdev->monitors_config =3D=
 NULL;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qdev->ram_header->monitor=
s_config =3D 0;
> =C2=A0
Friendly ping...

Hello, I sent this patch a few months ago.
Could you please help me review it as well and see if there are any
issues?

I'm looking forward to your reply.
Thanks
