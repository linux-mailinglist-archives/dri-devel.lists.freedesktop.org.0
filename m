Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F070671F7B0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 03:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A78510E062;
	Fri,  2 Jun 2023 01:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A1D10E062
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 01:20:34 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20230602012031epoutp017270d32ece11fa0c80c12d28a8e81d1c~kst7_FAMf1184111841epoutp01g
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 01:20:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20230602012031epoutp017270d32ece11fa0c80c12d28a8e81d1c~kst7_FAMf1184111841epoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1685668831;
 bh=oi/HXprnvpWdq4YONcP4X19Y2L2mjcH2LWUovvdZo+w=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=WuuQoYYhFtiX6AjKfOhKAqsWDsqa8oaX9Vw+Eg71GaAVFy59M64vGcO8zN8hvmM5l
 ilyTxbG368SqpYHoTGx0YxQflklcYiQ2E71Aa7VbxsIev9iLT12W85daoTGrdAbYiB
 VBt8pHFMvHx5EJ8SbigLqNNFRTFf/jnjrSTwONd4=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230602012030epcas1p1f48cc8bd1248ac12dcc2daa83c46e219~kst7bbT_o1782017820epcas1p1E;
 Fri,  2 Jun 2023 01:20:30 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.36.136]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4QXQDF5Pjhz4x9QH; Fri,  2 Jun
 2023 01:20:29 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 96.A7.48553.DD349746; Fri,  2 Jun 2023 10:20:29 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230602012029epcas1p2fc2451aa4869c66b7b548bd5661815a9~kst6E3AWe2147821478epcas1p2s;
 Fri,  2 Jun 2023 01:20:29 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230602012029epsmtrp28da01313b6f7539b25ff4d2298dfd4d7~kst6DiL8E1303413034epsmtrp2b;
 Fri,  2 Jun 2023 01:20:29 +0000 (GMT)
X-AuditID: b6c32a39-d8d1ea800001bda9-ac-647943ddd2c1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 7A.61.27706.DD349746; Fri,  2 Jun 2023 10:20:29 +0900 (KST)
Received: from inkidae001 (unknown [10.113.221.213]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20230602012029epsmtip23c4872b301c969d0519c27c918bdb34a~kst5zdaLq1260012600epsmtip2b;
 Fri,  2 Jun 2023 01:20:29 +0000 (GMT)
From: =?ks_c_5601-1987?B?tOvAzrHiL1RpemVuIFBsYXRmb3JtIExhYihTUikvu++8usD8wNo=?=
 <inki.dae@samsung.com>
To: "'Andi Shyti'" <andi.shyti@kernel.org>
In-Reply-To: <20230601082928.4mk7hfi5hunaxm4y@intel.intel>
Subject: RE: [PATCH] drm/exynos: fix race condition UAF in
 exynos_g2d_exec_ioctl
Date: Fri, 2 Jun 2023 10:20:28 +0900
Message-ID: <004e01d994f0$6af0fb20$40d2f160$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGTj1Ryyv7UvGCwDbo/bVuHx7F6MwGboBvXA23aa5ECFYZTkQHsjiyBAkvDF18C1e4e+AKZUix2AY4xbwKvcBbQwA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPJsWRmVeSWpSXmKPExsWy7bCmnu5d58oUg/bVmhYnri9isngwbxub
 xf2vHYwW/7dNZLa48vU9m8Xe11vZLc42vWG32PT4GqvF5V1z2CxmnN/HZHF8egOTxYzJL9kc
 eDz2flvA4rFz1l12j02rOtk87lzbw+Zxv/s4k8fmJfUefVtWMXp83iQXwBGVbZORmpiSWqSQ
 mpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6DrlpkDdK2SQlliTilQKCCxuFhJ
 386mKL+0JFUhI7+4xFYptSAlp8C0QK84Mbe4NC9dLy+1xMrQwMDIFKgwITvj0rqfTAVt/hUN
 vbuZGxhf+HQxcnJICJhIfD9xi62LkYtDSGAHo8TWheeZQRJCAp8YJdbdU4OwvzFKLP/M1cXI
 AdbwYooYRP1eRonuzqusEM5LRomNC5YxgjSwCWRI3G1fzApiiwhoSVy8chysiFngJpPElw8z
 GUEmcQpYSfz6UQBiCgsESXR+cAQpZxFQkdja8xBsDK+ApcT56xehbEGJkzOfsIDYzAJGEktW
 z2eCsLUlli18zQzxjILEz6fLoNZmSdx+/J8ZokZEYnZnGzPICRICZzgk5s/7yAjR4CLRvaGX
 CcIWlnh1fAs7hC0l8fndXjaIhsmMEneur2CBcGYwShz+eR2q21hi/9LJUN2KEjt/z2WEWMcn
 8e5rDyskuHglOtqEIEqUJI5dvAHVKiFxYclEtgmMSrOQPDcLyXOzkDw3C8kTCxhZVjGKpRYU
 56anFhsWmMJjOzk/dxMjOCVrWe5gnP72g94hRiYOxkOMEhzMSiK8QmHlKUK8KYmVValF+fFF
 pTmpxYcYTYHhPZFZSjQ5H5gV8kriDU0sDUzMjIxNLAzNDJXEeb881U4REkhPLEnNTk0tSC2C
 6WPi4JRqYMr2Ud39S7Cv/vxWK9GYTQ1/v/1NebnxTNTM6Gsqf75riUSe4ajS/fP068Lziurf
 217fm3CLi+NjZ/CWKZO+RIdNXJqmMltWqqxW8blFaMQEK8Xv7A/Se8ITWJY7dDbvkpqyKoR5
 Z0XzHZHPe7a9WfG88OWaS7M6v+2awur669Ek7r5PjCyhwZH3nb6aPKzetlQube+fwAvreLfd
 XXOx1XAqW+qrNiOl/773n3MpxoSkq8kVnuJ0+jSdg+Vh1M2t+8+dPGukpHAs7fz8lug9ZY+E
 9orvTv1stq3WYo2ExdQbhvalkqf/O2uZHs9keLvVIF9ZXWdy4d9JK4QMd+SF7vSb5La6vd/f
 ov+512nnL7lKLMUZiYZazEXFiQBkuy34UgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsWy7bCSvO5d58oUg39H+CxOXF/EZPFg3jY2
 i/tfOxgt/m+byGxx5et7Nou9r7eyW5xtesNusenxNVaLy7vmsFnMOL+PyeL49AYmixmTX7I5
 8Hjs/baAxWPnrLvsHptWdbJ53Lm2h83jfvdxJo/NS+o9+rasYvT4vEkugCOKyyYlNSezLLVI
 3y6BK2Pn2X6mgtvGFa1XJ7I1MHaqdzFycEgImEi8mCLWxcjFISSwm1Hizb3JzBBxCYktWzkg
 TGGJw4eLIUqeM0pcPr6drYuRk4NNIE1i0tz9rCC2iICWxMUrx8FsZoGnTBIzLmeA2EICv5kl
 PuwxB5nDKWAl8etHAUhYWCBA4uqtx2BjWARUJLb2PGQEsXkFLCXOX78IZQtKnJz5hAVipIlE
 4+FuKFtbYtnC18wgtoSAgsTPp8ugTsiSuP34PzNEjYjE7M425gmMwrOQjJqFZNQsJKNmIWlZ
 wMiyilEytaA4Nz232LDAMC+1XK84Mbe4NC9dLzk/dxMjOCq1NHcwbl/1Qe8QIxMH4yFGCQ5m
 JRFeobDyFCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8F7pOxgsJpCeWpGanphakFsFkmTg4pRqY
 uGUWsWRZXuxVLxC4O72u6nv6De8Zex/Krpm9aVKw5JtHJz9X310h3OVyNGHTw1eK8orKF+uL
 A3KMPzsFvdW9x7pPYoZF+pT/yjLHXgXc/W/2WKYxZ0JG7EOnt1s/Pjix0lF4f2B+xkUlqzcr
 mn4XyTIpn63fI73uS+GV7U5q5zy9hQpn6+5t2tKxR5/V/Otdx0XaGvYegTXbrxX2BfKf99Bl
 MTGXOKnSHONp3P5b+O+N26+P+Xj0sS6rjCls2PPrh32z/vrObbpzMzv+c1zal9tcG/FqHsOm
 x5rnA7rnHDbnaHJsORRvs8qZlXn55UTr/73L+bJOB90q7/yxWZXZcKnxxz0bL8p5hhzdVblP
 iaU4I9FQi7moOBEAigJH6jkDAAA=
X-CMS-MailID: 20230602012029epcas1p2fc2451aa4869c66b7b548bd5661815a9
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230531120656epcas1p1df61dae784f4b6833b39c43da697be08
References: <20230526130131.16521-1-lm0963hack@gmail.com>
 <20230530222150.24oogloda6wtvpvm@intel.intel>
 <CAAgLYK7FNrAYFRp7C3LDtqevFENQLw8YYAFR2Pk9wdfQ5RKVeg@mail.gmail.com>
 <20230531081917.grx3qqqm7usaqoa5@intel.intel>
 <CAAgLYK4KzuKMTkBwzCJj4wa+W+=9fR+A1J=XR-n1E-W7EjexuA@mail.gmail.com>
 <CGME20230531120656epcas1p1df61dae784f4b6833b39c43da697be08@epcas1p1.samsung.com>
 <20230531120531.dynd3iyggauucly7@intel.intel>
 <007001d99413$0f08ba60$2d1a2f20$@samsung.com>
 <20230601082928.4mk7hfi5hunaxm4y@intel.intel>
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
Cc: linux-samsung-soc@vger.kernel.org, 'lm0963' <lm0963hack@gmail.com>,
 sw0312.kim@samsung.com, krzysztof.kozlowski@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kyungmin.park@samsung.com, alim.akhtar@samsung.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Andi=7E :)

> -----Original Message-----
> From: Andi Shyti <andi.shyti=40kernel.org>
> Sent: Thursday, June 1, 2023 5:29 PM
> To: =B4=EB=C0=CE=B1=E2/Tizen=20Platform=20Lab(SR)/=BB=EF=BC=BA=C0=FC=C0=
=DA=20<inki.dae=40samsung.com>=0D=0A>=20Cc:=20'lm0963'=20<lm0963hack=40gmai=
l.com>;=20sw0312.kim=40samsung.com;=0D=0A>=20kyungmin.park=40samsung.com;=
=20airlied=40gmail.com;=20daniel=40ffwll.ch;=0D=0A>=20krzysztof.kozlowski=
=40linaro.org;=20alim.akhtar=40samsung.com;=20dri-=0D=0A>=20devel=40lists.f=
reedesktop.org;=20linux-arm-kernel=40lists.infradead.org;=20linux-=0D=0A>=
=20samsung-soc=40vger.kernel.org;=20linux-kernel=40vger.kernel.org=0D=0A>=
=20Subject:=20Re:=20=5BPATCH=5D=20drm/exynos:=20fix=20race=20condition=20UA=
F=20in=0D=0A>=20exynos_g2d_exec_ioctl=0D=0A>=20=0D=0A>=20Hi=20Inki,=0D=0A>=
=20=0D=0A>=20>=20>=20>=20>=20>=20>=20>=20If=20it=20is=20async,=20runqueue_n=
ode=20is=20freed=20in=0D=0A>=20g2d_runqueue_worker=20on=0D=0A>=20>=20>=20an=
other=0D=0A>=20>=20>=20>=20>=20>=20>=20>=20worker=20thread.=20So=20in=20ext=
reme=20cases,=20if=20g2d_runqueue_worker=0D=0A>=20runs=0D=0A>=20>=20>=20fir=
st,=20and=0D=0A>=20>=20>=20>=20>=20>=20>=20>=20then=20executes=20the=20foll=
owing=20if=20statement,=20there=20will=20be=20use-=0D=0A>=20>=20>=20after-f=
ree.=0D=0A>=20>=20>=20>=20>=20>=20>=20>=0D=0A>=20>=20>=20>=20>=20>=20>=20>=
=20Signed-off-by:=20Min=20Li=20<lm0963hack=40gmail.com>=0D=0A>=20>=20>=20>=
=20>=20>=20>=20>=20---=0D=0A>=20>=20>=20>=20>=20>=20>=20>=20=20drivers/gpu/=
drm/exynos/exynos_drm_g2d.c=20=7C=202=20+-=0D=0A>=20>=20>=20>=20>=20>=20>=
=20>=20=201=20file=20changed,=201=20insertion(+),=201=20deletion(-)=0D=0A>=
=20>=20>=20>=20>=20>=20>=20>=0D=0A>=20>=20>=20>=20>=20>=20>=20>=20diff=20--=
git=20a/drivers/gpu/drm/exynos/exynos_drm_g2d.c=0D=0A>=20>=20>=20b/drivers/=
gpu/drm/exynos/exynos_drm_g2d.c=0D=0A>=20>=20>=20>=20>=20>=20>=20>=20index=
=20ec784e58da5c..414e585ec7dd=20100644=0D=0A>=20>=20>=20>=20>=20>=20>=20>=
=20---=20a/drivers/gpu/drm/exynos/exynos_drm_g2d.c=0D=0A>=20>=20>=20>=20>=
=20>=20>=20>=20+++=20b/drivers/gpu/drm/exynos/exynos_drm_g2d.c=0D=0A>=20>=
=20>=20>=20>=20>=20>=20>=20=40=40=20-1335,7=20+1335,7=20=40=40=20int=20exyn=
os_g2d_exec_ioctl(struct=0D=0A>=20>=20>=20drm_device=20*drm_dev,=20void=20*=
data,=0D=0A>=20>=20>=20>=20>=20>=20>=20>=20=20=20=20=20=20=20/*=20Let=20the=
=20runqueue=20know=20that=20there=20is=20work=20to=20do.=20*/=0D=0A>=20>=20=
>=20>=20>=20>=20>=20>=20=20=20=20=20=20=20queue_work(g2d->g2d_workq,=20&g2d=
->runqueue_work);=0D=0A>=20>=20>=20>=20>=20>=20>=20>=0D=0A>=20>=20>=20>=20>=
=20>=20>=20>=20-=20=20=20=20=20if=20(runqueue_node->async)=0D=0A>=20>=20>=
=20>=20>=20>=20>=20>=20+=20=20=20=20=20if=20(req->async)=0D=0A>=20>=20>=20>=
=20>=20>=20>=0D=0A>=20>=20>=20>=20>=20>=20>=20did=20you=20actually=20hit=20=
this?=20If=20you=20did,=20then=20the=20fix=20is=20not=20OK.=0D=0A>=20>=20>=
=20>=20>=20>=0D=0A>=20>=20>=20>=20>=20>=20No,=20I=20didn't=20actually=20hit=
=20this.=20I=20found=20it=20through=20code=20review.=0D=0A>=20This=0D=0A>=
=20>=20>=20>=20>=20>=20is=20only=20a=20theoretical=20issue=20that=20can=20o=
nly=20be=20triggered=20in=0D=0A>=20extreme=0D=0A>=20>=20>=20>=20>=20>=20cas=
es.=0D=0A>=20>=20>=20>=20>=0D=0A>=20>=20>=20>=20>=20first=20of=20all=20runq=
ueue=20is=20used=20again=20two=20lines=20below=20this,=20which=0D=0A>=20>=
=20>=20>=20>=20means=20that=20if=20you=20don't=20hit=20the=20uaf=20here=20y=
ou=20will=20hit=20it=0D=0A>=20>=20>=20>=20>=20immediately=20after.=0D=0A>=
=20>=20>=20>=0D=0A>=20>=20>=20>=20No,=20if=20async=20is=20true,=20then=20it=
=20will=20goto=20out,=20which=20will=20directly=0D=0A>=20return.=0D=0A>=20>=
=20>=20>=0D=0A>=20>=20>=20>=20if=20(runqueue_node->async)=0D=0A>=20>=20>=20=
>=20=20=20=20=20goto=20out;=20=20=20//=20here,=20go=20to=20out,=20will=20di=
rectly=20return=0D=0A>=20>=20>=20>=0D=0A>=20>=20>=20>=20wait_for_completion=
(&runqueue_node->complete);=20=20=20=20=20=20//=20not=20hit=0D=0A>=20>=20>=
=20>=20g2d_free_runqueue_node(g2d,=20runqueue_node);=0D=0A>=20>=20>=20>=0D=
=0A>=20>=20>=20>=20out:=0D=0A>=20>=20>=20>=20return=200;=0D=0A>=20>=20>=0D=
=0A>=20>=20>=20that's=20right,=20sorry,=20I=20misread=20it.=0D=0A>=20>=20>=
=0D=0A>=20>=20>=20>=20>=20Second,=20if=20runqueue=20is=20freed,=20than=20we=
=20need=20to=20remove=20the=20part=0D=0A>=20>=20>=20>=20>=20where=20it's=20=
freed=20because=20it=20doesn't=20make=20sense=20to=20free=20runqueue=0D=0A>=
=20>=20>=20>=20>=20at=20this=20stage.=0D=0A>=20>=20>=20>=0D=0A>=20>=20>=20>=
=20It=20is=20freed=20by=20g2d_free_runqueue_node=20in=20g2d_runqueue_worker=
=0D=0A>=20>=20>=20>=0D=0A>=20>=20>=20>=20static=20void=20g2d_runqueue_worke=
r(struct=20work_struct=20*work)=0D=0A>=20>=20>=20>=20=7B=0D=0A>=20>=20>=20>=
=20=20=20=20=20......=0D=0A>=20>=20>=20>=20=20=20=20=20if=20(runqueue_node)=
=20=7B=0D=0A>=20>=20>=20>=20=20=20=20=20=20=20=20=20pm_runtime_mark_last_bu=
sy(g2d->dev);=0D=0A>=20>=20>=20>=20=20=20=20=20=20=20=20=20pm_runtime_put_a=
utosuspend(g2d->dev);=0D=0A>=20>=20>=20>=0D=0A>=20>=20>=20>=20=20=20=20=20=
=20=20=20=20complete(&runqueue_node->complete);=0D=0A>=20>=20>=20>=20=20=20=
=20=20=20=20=20=20if=20(runqueue_node->async)=0D=0A>=20>=20>=20>=20=20=20=
=20=20=20=20=20=20=20=20=20=20g2d_free_runqueue_node(g2d,=20runqueue_node);=
=20=20=20=20=20=20=20=20//=0D=0Afreed=0D=0A>=20here=0D=0A>=20>=20>=0D=0A>=
=20>=20>=20this=20is=20what=20I'm=20wondering:=20is=20it=20correct=20to=20f=
ree=20a=20resource=0D=0A>=20>=20>=20here?=20The=20design=20looks=20to=20me=
=20a=20bit=20fragile=20and=20prone=20to=20mistakes.=0D=0A>=20>=0D=0A>=20>=
=20This=20question=20seems=20to=20deviate=20from=20the=20purpose=20of=20thi=
s=20patch.=20If=20you=0D=0A>=20are=20providing=20additional=20opinions=20fo=
r=20code=20quality=20improvement=20unrelated=0D=0A>=20to=20this=20patch,=20=
it=20would=20be=20more=20appropriate=20for=20me=20to=20answer=20instead=20o=
f=0D=0A>=20him.=0D=0A>=20=0D=0A>=20It's=20not=20deviating=20as=20the=20ques=
tion=20was=20already=20made=20in=20my=20first=0D=0A>=20review.=20It=20just=
=20looks=20strange=20to=20me=20that=20a=20piece=20of=20data=20shared=0D=0A>=
=20amongst=20processes=20can=20be=20freed=20up=20without=20sinchronizing.=
=20A=20bunch=0D=0A=0D=0AI=20believe=20that=20if=20we=20overlook=20any=20dou=
bts=20or=20concerns=20about=20worrisome=0D=0Aaspects=20without=20completely=
=20resolving=20them,=20it=20wouldn't=20be=20helpful=20to=20the=0D=0Acommuni=
ty.=0D=0ATherefore,=20I=20would=20like=20to=20clarify=20more=20explicitly=
=20in=20order=20to=20ensure=20a=0D=0Abetter=20understanding.=0D=0A=0D=0AAFA=
IK,=20the=20data=20you=20mentioned=20isn't=20shared=20between=20processes.=
=20This=20data=20is=0D=0Agenerated=20driver-internally=20when=20the=20user=
=20makes=20a=20rendering=20request=20and=0D=0Awill=20be=20removed=20once=20=
the=202D=20GPU=20finishes=20rendering.=0D=0A=0D=0A=0D=0AHowever,=20there=20=
may=20be=20another=20issue=20that=20I'm=20not=20aware=20of,=20so=20if=20the=
re=20is=0D=0Aany,=20give=20me=20it=20more=20specifically=20as=20it=20would=
=20help=20improve=20driver=20stability.=0D=0A=0D=0AThanks=20again,=0D=0AInk=
i=20Dae=0D=0A=0D=0A>=20of=20if's=20do=20not=20make=20it=20robust=20enough.=
=0D=0A>=20=0D=0A>=20The=20patch=20itself,=20in=20my=20point=20of=20view,=20=
is=20not=20really=20fixing=20much=0D=0A>=20and=20won't=20make=20any=20diffe=
rence,=20it's=20just=20exposing=20the=20weakness=20I=0D=0A>=20mentioned.=0D=
=0A>=20=0D=0A>=20However,=20honestly=20speaking,=20I=20don't=20know=20the=
=20driver=20well=20enough=0D=0A>=20to=20suggest=20architectural=20changes=
=20and=20that's=20why=20I=20r-b'ed=20this=0D=0A>=20one.=20But=20the=20first=
=20thing=20that=20comes=20to=20my=20mind,=20without=20looking=0D=0A>=20much=
=20at=20the=20code,=20is=20using=20kref's=20as=20a=20way=20to=20make=20sure=
=20that=20a=0D=0A>=20resource=20doesn't=20magically=20disappear=20under=20y=
our=20nose.=0D=0A>=20=0D=0A>=20But,=20of=20course,=20this=20is=20up=20to=20=
you=20and=20if=20in=20your=20opinion=20this=20is=0D=0A>=20OK=20and=20it=20f=
ixes=20it...=20then=20you=20definitely=20know=20better=20:)=0D=0A>=20=0D=0A=
>=20Thanks=20for=20this=20discussion,=0D=0A>=20Andi=0D=0A>=20=0D=0A>=20>=20=
The=20runqueue=20node=20-=20which=20contains=20command=20list=20for=20g2d=
=20rendering=20-=20is=0D=0A>=20generated=20when=20the=20user=20calls=20the=
=20ioctl=20system=20call.=20Therefore,=20if=20the=0D=0A>=20user-requested=
=20command=20list=20is=20rendered=20by=20g2d=20device=20then=20there=20is=
=20no=0D=0A>=20longer=20a=20reason=20to=20keep=20it.=20:)=0D=0A>=20>=0D=0A>=
=20>=20>=0D=0A>=20>=20>=20The=20patch=20per=20se=20is=20OK.=20It=20doesn't=
=20make=20much=20difference=20to=20me=0D=0A>=20>=20>=20where=20you=20actual=
ly=20read=20async,=20although=20this=20patch=20looks=20a=20bit=0D=0A>=20>=
=20>=20safer:=0D=0A>=20>=20>=0D=0A>=20>=20>=20Reviewed-by:=20Andi=20Shyti=
=20<andi.shyti=40kernel.org>=0D=0A>=20>=0D=0A>=20>=20Thanks,=0D=0A>=20>=20I=
nki=20Dae=0D=0A>=20>=0D=0A>=20>=20>=0D=0A>=20>=20>=20However=20some=20refac=
toring=20might=20be=20needed=20to=20make=20it=20a=20bit=20more=0D=0A>=20>=
=20>=20robust.=0D=0A>=20>=20>=0D=0A>=20>=20>=20Thanks,=0D=0A>=20>=20>=20And=
i=0D=0A>=20>=20>=0D=0A>=20>=20>=20>=20=20=20=20=20=7D=0D=0A>=20>=20>=20>=0D=
=0A>=20>=20>=20>=20>=0D=0A>=20>=20>=20>=20>=20Finally,=20can=20you=20elabor=
ate=20on=20the=20code=20review=20that=20you=20did=20so=0D=0A>=20>=20>=20>=
=20>=20that=20we=20all=20understand=20it?=0D=0A>=20>=20>=20>=0D=0A>=20>=20>=
=20>=20queue_work(g2d->g2d_workq,=20&g2d->runqueue_work);=0D=0A>=20>=20>=20=
>=20msleep(100);=20=20=20=20=20=20=20=20//=20add=20sleep=20here=20to=20let=
=20g2d_runqueue_worker=20run=0D=0A>=20first=0D=0A>=20>=20>=20>=20if=20(runq=
ueue_node->async)=0D=0A>=20>=20>=20>=20=20=20=20=20goto=20out;=0D=0A>=20>=
=20>=20>=0D=0A>=20>=20>=20>=0D=0A>=20>=20>=20>=20>=0D=0A>=20>=20>=20>=20>=
=20Andi=0D=0A>=20>=20>=20>=0D=0A>=20>=20>=20>=0D=0A>=20>=20>=20>=0D=0A>=20>=
=20>=20>=20--=0D=0A>=20>=20>=20>=20Min=20Li=0D=0A>=20>=0D=0A>=20>=0D=0A=0D=
=0A
