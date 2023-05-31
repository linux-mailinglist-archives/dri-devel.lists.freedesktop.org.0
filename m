Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F1F718ED8
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 00:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B60810E0D6;
	Wed, 31 May 2023 22:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23F810E09A
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 22:56:01 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20230531225558epoutp011d0ed8a8300e7b00382fbd8f399a3d43~kXGcoRNWz0433204332epoutp01O
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 22:55:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20230531225558epoutp011d0ed8a8300e7b00382fbd8f399a3d43~kXGcoRNWz0433204332epoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1685573758;
 bh=CTOpbPdXYysEtpCs4gWVoYgDgVpfgPPrpQs91DbH0iI=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=Y/dJiI+g96vBxZEKw3YQtjcA3sfkV2BOo+MwF6uYoN/oOwNr/vZWrcHf/MdKpkF0G
 1kP0KT+KnZI//BA2s0apGWo6BX4dKECH/6Hq83Trlvpai8XaEW0qEcylizm/ZjKuht
 UVUUKyneJ2MqFOcVSuoy02vMBxD3Ygv/69LqDlQI=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20230531225558epcas1p4155c2c22920769a6f44436a43f260cf9~kXGcHSP3S2641826418epcas1p45;
 Wed, 31 May 2023 22:55:58 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.36.135]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4QWl3x0myBz4x9Pt; Wed, 31 May
 2023 22:55:57 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 35.91.48828.C70D7746; Thu,  1 Jun 2023 07:55:56 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20230531225556epcas1p370c3dcbb880ff8d0f45db79dcfba4a0c~kXGad6TC-1549515495epcas1p3O;
 Wed, 31 May 2023 22:55:56 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230531225556epsmtrp111dc17d7dbad2f42747daab4a04c9bca~kXGacsxdC2798827988epsmtrp1V;
 Wed, 31 May 2023 22:55:56 +0000 (GMT)
X-AuditID: b6c32a35-93bfa7000000bebc-e3-6477d07c59f3
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 45.A9.27706.C70D7746; Thu,  1 Jun 2023 07:55:56 +0900 (KST)
Received: from inkidae001 (unknown [10.113.221.213]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20230531225556epsmtip2ab4998575f6db55d69e76be758c85a2b~kXGaNXWpM1797217972epsmtip2R;
 Wed, 31 May 2023 22:55:56 +0000 (GMT)
From: =?utf-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?=
 <inki.dae@samsung.com>
To: "'Andi Shyti'" <andi.shyti@kernel.org>, "'lm0963'" <lm0963hack@gmail.com>
In-Reply-To: <20230531120531.dynd3iyggauucly7@intel.intel>
Subject: RE: [PATCH] drm/exynos: fix race condition UAF in
 exynos_g2d_exec_ioctl
Date: Thu, 1 Jun 2023 07:55:55 +0900
Message-ID: <007001d99413$0f08ba60$2d1a2f20$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGTj1Ryyv7UvGCwDbo/bVuHx7F6MwGboBvXA23aa5ECFYZTkQHsjiyBAkvDF18C1e4e+K+PmWwQ
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAJsWRmVeSWpSXmKPExsWy7bCmrm7NhfIUg+7tVhYnri9isngwbxub
 xf2vHYwW/7dNZLa48vU9m8Xe11vZLc42vWG32PT4GqvF5V1z2CxmnN/HZHF8egOTxYzJL9kc
 eDz2flvA4rFz1l12j02rOtk87lzbw+Zxv/s4k8fmJfUefVtWMXp83iQXwBGVbZORmpiSWqSQ
 mpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6DrlpkDdK2SQlliTilQKCCxuFhJ
 386mKL+0JFUhI7+4xFYptSAlp8C0QK84Mbe4NC9dLy+1xMrQwMDIFKgwITtj1e9GloI3phVL
 3n1mamB8bNzFyMkhIWAiseLtZ7YuRi4OIYEdjBKTm1axQzifGCUm9K5ngnC+MUpcP3qeEabl
 2qw1zBCJvYwSv/7cY4FwXjJKvLraD1bFJpAu8bLrMguILSLgL3H64j2wDmaBbUwS5w7OZwNJ
 cApYSbz608vaxcjBISwQJNH5wREkzCKgIvH6yWcWkDCvgKXEgr/OIGFeAUGJkzOfgI1kFtCW
 WLbwNTPEQQoSP58uY4VYFSUxoWMHE0SNiMTszjawtRICVzgkGqb2sUA0uEicbXjEDmELS7w6
 vgXKlpJ42d/GDtEwmVHizvUVLBDODEaJwz+vQ/1vLLF/6WQmkOuYBTQl1u/ShwgrSuz8PZcR
 YjOfxLuvPWB/SQjwSnS0CUGUKEkcu3gDaoqExIUlE9kmMCrNQvLbLCS/zULywyyEZQsYWVYx
 iqUWFOempxYbFhjCozs5P3cTIzgpa5nuYJz49oPeIUYmDsZDjBIczEoivEJh5SlCvCmJlVWp
 RfnxRaU5qcWHGE2BgT2RWUo0OR+YF/JK4g1NLA1MzIyMTSwMzQyVxHm/PNVOERJITyxJzU5N
 LUgtgulj4uCUamBaudjVRY8/adY+PmZpHbbpD5P8K4rWP5kYwsbzcetpmaqrZ5bvOSs3gZE3
 J+tpyKak/MTMQy/1bc5cvhfzJrvsX2fMbhebE+uj2HitDzpyXC24tj57Y7FM4boMHpHn/nyl
 D++z/1rFvrPc28UtdJ7o97M7nSey/nTfOO+UmqnV3bhXZ4RW3sy/1rJm/6fCsp92XCEzbxp8
 DduRIrp834QOY53al1c2Tpr+g0Gsm3Xr8VWfuPIL84MCFy4sn8e3tMjrdnu7yNlS/4WzC4/9
 fbok591Dnf3rFItuiphkzW1PltDmvHYniM3Yfz/76Ukzll7/ve/Fn3B+h0nige8yc3LmH7jp
 fdz+oZ5sq6DhiVANJZbijERDLeai4kQAUmRSCVMEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsWy7bCSvG7NhfIUg3nH+C1OXF/EZPFg3jY2
 i/tfOxgt/m+byGxx5et7Nou9r7eyW5xtesNusenxNVaLy7vmsFnMOL+PyeL49AYmixmTX7I5
 8Hjs/baAxWPnrLvsHptWdbJ53Lm2h83jfvdxJo/NS+o9+rasYvT4vEkugCOKyyYlNSezLLVI
 3y6BK+PL7qPMBZ9VKvpermZsYFwn08XIySEhYCJxbdYaZhBbSGA3o8SKE/ldjBxAcQmJLVs5
 IExhicOHi7sYuYAqnjNKfL22lR0kziaQKvF6dR1Ip4iAv8TdT0dZQWqYBQ4wSVxfv5YNomE+
 s0TTyitMIFWcAlYSr/70soLYwgIBEldvPWYDsVkEVCReP/nMAjKUV8BSYsFfZ5Awr4CgxMmZ
 T1hAbGYBbYmnN5/C2csWvmaGOF9B4ufTZawQR0RJTOjYwQRRIyIxu7ONeQKj8Cwko2YhGTUL
 yahZSFoWMLKsYpRMLSjOTc8tNiwwzEst1ytOzC0uzUvXS87P3cQIjkstzR2M21d90DvEyMTB
 eIhRgoNZSYRXKKw8RYg3JbGyKrUoP76oNCe1+BCjNAeLkjjvha6T8UIC6YklqdmpqQWpRTBZ
 Jg5OqQYmFlHfTJu/jWeS6v483awgo2bp96uLXfW+luO9Cbvux0m/j355aunvi01Ps4L5q/9o
 b9poX8IULh969MiJqXGlWd+lTkg032fhXeH7+Wf9OrXWRfOO3Dwu8uKa/jL7aP6KNjGTdTye
 9hKuN869q6l2WakvkF6aXaPQILXo+4Weqbp8PNOMP0ry25t5Z4fx+Sz6Ib2wcfnKK3w779tx
 Pe4MyOlZfM25WuytMo+068rP12rF/igeUxWY3hzy5cDWouLqWVc3h1Y/FPj1e777u4NX42Zm
 WJnMXSncevrKdcf/hadsWLvTb8YoLPy78ElS2YeAaPvbD7naDk1ZUSSYM7fvRIS3/IPP9vV9
 +866OYUqsRRnJBpqMRcVJwIAmiBEOzoDAAA=
X-CMS-MailID: 20230531225556epcas1p370c3dcbb880ff8d0f45db79dcfba4a0c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
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
Cc: linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kyungmin.park@samsung.com,
 alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi,

> -----Original Message-----
> From: Andi Shyti <andi.shyti=40kernel.org>
> Sent: Wednesday, May 31, 2023 9:06 PM
> To: lm0963 <lm0963hack=40gmail.com>
> Cc: inki.dae=40samsung.com; sw0312.kim=40samsung.com;
> kyungmin.park=40samsung.com; airlied=40gmail.com; daniel=40ffwll.ch;
> krzysztof.kozlowski=40linaro.org; alim.akhtar=40samsung.com; dri-
> devel=40lists.freedesktop.org; linux-arm-kernel=40lists.infradead.org; li=
nux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org
> Subject: Re: =5BPATCH=5D drm/exynos: fix race condition UAF in
> exynos_g2d_exec_ioctl
>=20
> Hi Min,
>=20
> On Wed, May 31, 2023 at 06:54:34PM +0800, lm0963 wrote:
> > Hi Andi,
> >
> > On Wed, May 31, 2023 at 4:19=E2=80=AFPM=20Andi=20Shyti=20<andi.shyti=40=
kernel.org>=20wrote:=0D=0A>=20>=20>=0D=0A>=20>=20>=20Hi=20Min,=0D=0A>=20>=
=20>=0D=0A>=20>=20>=20>=20>=20>=20If=20it=20is=20async,=20runqueue_node=20i=
s=20freed=20in=20g2d_runqueue_worker=20on=0D=0A>=20another=0D=0A>=20>=20>=
=20>=20>=20>=20worker=20thread.=20So=20in=20extreme=20cases,=20if=20g2d_run=
queue_worker=20runs=0D=0A>=20first,=20and=0D=0A>=20>=20>=20>=20>=20>=20then=
=20executes=20the=20following=20if=20statement,=20there=20will=20be=20use-=
=0D=0A>=20after-free.=0D=0A>=20>=20>=20>=20>=20>=0D=0A>=20>=20>=20>=20>=20>=
=20Signed-off-by:=20Min=20Li=20<lm0963hack=40gmail.com>=0D=0A>=20>=20>=20>=
=20>=20>=20---=0D=0A>=20>=20>=20>=20>=20>=20=20drivers/gpu/drm/exynos/exyno=
s_drm_g2d.c=20=7C=202=20+-=0D=0A>=20>=20>=20>=20>=20>=20=201=20file=20chang=
ed,=201=20insertion(+),=201=20deletion(-)=0D=0A>=20>=20>=20>=20>=20>=0D=0A>=
=20>=20>=20>=20>=20>=20diff=20--git=20a/drivers/gpu/drm/exynos/exynos_drm_g=
2d.c=0D=0A>=20b/drivers/gpu/drm/exynos/exynos_drm_g2d.c=0D=0A>=20>=20>=20>=
=20>=20>=20index=20ec784e58da5c..414e585ec7dd=20100644=0D=0A>=20>=20>=20>=
=20>=20>=20---=20a/drivers/gpu/drm/exynos/exynos_drm_g2d.c=0D=0A>=20>=20>=
=20>=20>=20>=20+++=20b/drivers/gpu/drm/exynos/exynos_drm_g2d.c=0D=0A>=20>=
=20>=20>=20>=20>=20=40=40=20-1335,7=20+1335,7=20=40=40=20int=20exynos_g2d_e=
xec_ioctl(struct=0D=0A>=20drm_device=20*drm_dev,=20void=20*data,=0D=0A>=20>=
=20>=20>=20>=20>=20=20=20=20=20=20=20/*=20Let=20the=20runqueue=20know=20tha=
t=20there=20is=20work=20to=20do.=20*/=0D=0A>=20>=20>=20>=20>=20>=20=20=20=
=20=20=20=20queue_work(g2d->g2d_workq,=20&g2d->runqueue_work);=0D=0A>=20>=
=20>=20>=20>=20>=0D=0A>=20>=20>=20>=20>=20>=20-=20=20=20=20=20if=20(runqueu=
e_node->async)=0D=0A>=20>=20>=20>=20>=20>=20+=20=20=20=20=20if=20(req->asyn=
c)=0D=0A>=20>=20>=20>=20>=0D=0A>=20>=20>=20>=20>=20did=20you=20actually=20h=
it=20this?=20If=20you=20did,=20then=20the=20fix=20is=20not=20OK.=0D=0A>=20>=
=20>=20>=0D=0A>=20>=20>=20>=20No,=20I=20didn't=20actually=20hit=20this.=20I=
=20found=20it=20through=20code=20review.=20This=0D=0A>=20>=20>=20>=20is=20o=
nly=20a=20theoretical=20issue=20that=20can=20only=20be=20triggered=20in=20e=
xtreme=0D=0A>=20>=20>=20>=20cases.=0D=0A>=20>=20>=0D=0A>=20>=20>=20first=20=
of=20all=20runqueue=20is=20used=20again=20two=20lines=20below=20this,=20whi=
ch=0D=0A>=20>=20>=20means=20that=20if=20you=20don't=20hit=20the=20uaf=20her=
e=20you=20will=20hit=20it=0D=0A>=20>=20>=20immediately=20after.=0D=0A>=20>=
=0D=0A>=20>=20No,=20if=20async=20is=20true,=20then=20it=20will=20goto=20out=
,=20which=20will=20directly=20return.=0D=0A>=20>=0D=0A>=20>=20if=20(runqueu=
e_node->async)=0D=0A>=20>=20=20=20=20=20goto=20out;=20=20=20//=20here,=20go=
=20to=20out,=20will=20directly=20return=0D=0A>=20>=0D=0A>=20>=20wait_for_co=
mpletion(&runqueue_node->complete);=20=20=20=20=20=20//=20not=20hit=0D=0A>=
=20>=20g2d_free_runqueue_node(g2d,=20runqueue_node);=0D=0A>=20>=0D=0A>=20>=
=20out:=0D=0A>=20>=20return=200;=0D=0A>=20=0D=0A>=20that's=20right,=20sorry=
,=20I=20misread=20it.=0D=0A>=20=0D=0A>=20>=20>=20Second,=20if=20runqueue=20=
is=20freed,=20than=20we=20need=20to=20remove=20the=20part=0D=0A>=20>=20>=20=
where=20it's=20freed=20because=20it=20doesn't=20make=20sense=20to=20free=20=
runqueue=0D=0A>=20>=20>=20at=20this=20stage.=0D=0A>=20>=0D=0A>=20>=20It=20i=
s=20freed=20by=20g2d_free_runqueue_node=20in=20g2d_runqueue_worker=0D=0A>=
=20>=0D=0A>=20>=20static=20void=20g2d_runqueue_worker(struct=20work_struct=
=20*work)=0D=0A>=20>=20=7B=0D=0A>=20>=20=20=20=20=20......=0D=0A>=20>=20=20=
=20=20=20if=20(runqueue_node)=20=7B=0D=0A>=20>=20=20=20=20=20=20=20=20=20pm=
_runtime_mark_last_busy(g2d->dev);=0D=0A>=20>=20=20=20=20=20=20=20=20=20pm_=
runtime_put_autosuspend(g2d->dev);=0D=0A>=20>=0D=0A>=20>=20=20=20=20=20=20=
=20=20=20complete(&runqueue_node->complete);=0D=0A>=20>=20=20=20=20=20=20=
=20=20=20if=20(runqueue_node->async)=0D=0A>=20>=20=20=20=20=20=20=20=20=20=
=20=20=20=20g2d_free_runqueue_node(g2d,=20runqueue_node);=20=20=20=20=20=20=
=20=20//=20freed=20here=0D=0A>=20=0D=0A>=20this=20is=20what=20I'm=20wonderi=
ng:=20is=20it=20correct=20to=20free=20a=20resource=0D=0A>=20here?=20The=20d=
esign=20looks=20to=20me=20a=20bit=20fragile=20and=20prone=20to=20mistakes.=
=0D=0A=0D=0AThis=20question=20seems=20to=20deviate=20from=20the=20purpose=
=20of=20this=20patch.=20If=20you=20are=20providing=20additional=20opinions=
=20for=20code=20quality=20improvement=20unrelated=20to=20this=20patch,=20it=
=20would=20be=20more=20appropriate=20for=20me=20to=20answer=20instead=20of=
=20him.=0D=0A=0D=0AThe=20runqueue=20node=20-=20which=20contains=20command=
=20list=20for=20g2d=20rendering=20-=20is=20generated=20when=20the=20user=20=
calls=20the=20ioctl=20system=20call.=20Therefore,=20if=20the=20user-request=
ed=20command=20list=20is=20rendered=20by=20g2d=20device=20then=20there=20is=
=20no=20longer=20a=20reason=20to=20keep=20it.=20:)=0D=0A=0D=0A>=20=0D=0A>=
=20The=20patch=20per=20se=20is=20OK.=20It=20doesn't=20make=20much=20differe=
nce=20to=20me=0D=0A>=20where=20you=20actually=20read=20async,=20although=20=
this=20patch=20looks=20a=20bit=0D=0A>=20safer:=0D=0A>=20=0D=0A>=20Reviewed-=
by:=20Andi=20Shyti=20<andi.shyti=40kernel.org>=0D=0A=0D=0AThanks,=0D=0AInki=
=20Dae=0D=0A=0D=0A>=20=0D=0A>=20However=20some=20refactoring=20might=20be=
=20needed=20to=20make=20it=20a=20bit=20more=0D=0A>=20robust.=0D=0A>=20=0D=
=0A>=20Thanks,=0D=0A>=20Andi=0D=0A>=20=0D=0A>=20>=20=20=20=20=20=7D=0D=0A>=
=20>=0D=0A>=20>=20>=0D=0A>=20>=20>=20Finally,=20can=20you=20elaborate=20on=
=20the=20code=20review=20that=20you=20did=20so=0D=0A>=20>=20>=20that=20we=
=20all=20understand=20it?=0D=0A>=20>=0D=0A>=20>=20queue_work(g2d->g2d_workq=
,=20&g2d->runqueue_work);=0D=0A>=20>=20msleep(100);=20=20=20=20=20=20=20=20=
//=20add=20sleep=20here=20to=20let=20g2d_runqueue_worker=20run=20first=0D=
=0A>=20>=20if=20(runqueue_node->async)=0D=0A>=20>=20=20=20=20=20goto=20out;=
=0D=0A>=20>=0D=0A>=20>=0D=0A>=20>=20>=0D=0A>=20>=20>=20Andi=0D=0A>=20>=0D=
=0A>=20>=0D=0A>=20>=0D=0A>=20>=20--=0D=0A>=20>=20Min=20Li=0D=0A=0D=0A
