Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 978AE47756E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 16:12:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB3C10E90F;
	Thu, 16 Dec 2021 15:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B477E10E917
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 15:12:38 +0000 (UTC)
Received: from fraeml715-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JFFtb1m2gz67DWp;
 Thu, 16 Dec 2021 23:11:03 +0800 (CST)
Received: from fraeml714-chm.china.huawei.com (10.206.15.33) by
 fraeml715-chm.china.huawei.com (10.206.15.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 16:12:35 +0100
Received: from fraeml714-chm.china.huawei.com ([10.206.15.33]) by
 fraeml714-chm.china.huawei.com ([10.206.15.33]) with mapi id 15.01.2308.020;
 Thu, 16 Dec 2021 16:12:35 +0100
From: Roberto Sassu <roberto.sassu@huawei.com>
To: "airlied@linux.ie" <airlied@linux.ie>, "kraxel@redhat.com"
 <kraxel@redhat.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: RE: [PATCH] drm/virtio: Ensure that objs is not NULL in
 virtio_gpu_array_put_free()
Thread-Topic: [PATCH] drm/virtio: Ensure that objs is not NULL in
 virtio_gpu_array_put_free()
Thread-Index: AQHX8E+19jelqmPilEqoid7n1sYbcaw1Pc8Q
Date: Thu, 16 Dec 2021 15:12:35 +0000
Message-ID: <4b0d93611e8740afbf25870e8b54a8e9@huawei.com>
References: <20211213183122.838119-1-roberto.sassu@huawei.com>
In-Reply-To: <20211213183122.838119-1-roberto.sassu@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.204.63.33]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
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
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "syzbot+e9072e90624a31dfa85f@syzkaller.appspotmail.com"
 <syzbot+e9072e90624a31dfa85f@syzkaller.appspotmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Roberto Sassu
> Sent: Monday, December 13, 2021 7:31 PM
> If virtio_gpu_object_shmem_init() fails (e.g. due to fault injection, as =
it
> happened in the bug report by syzbot), virtio_gpu_array_put_free() could =
be
> called with objs equal to NULL.
>=20
> Ensure that objs is not NULL in virtio_gpu_array_put_free(), or otherwise
> return from the function.

Hello

did you have the chance to look at this patch?

Thanks

Roberto

HUAWEI TECHNOLOGIES Duesseldorf GmbH, HRB 56063
Managing Director: Li Peng, Zhong Ronghua

> Cc: stable@vger.kernel.org # 5.13.x
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> Reported-by: syzbot+e9072e90624a31dfa85f@syzkaller.appspotmail.com
> Fixes: 377f8331d0565 ("drm/virtio: fix possible leak/unlock
> virtio_gpu_object_array")
> ---
>  drivers/gpu/drm/virtio/virtgpu_gem.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c
> b/drivers/gpu/drm/virtio/virtgpu_gem.c
> index 2de61b63ef91..48d3c9955f0d 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> @@ -248,6 +248,9 @@ void virtio_gpu_array_put_free(struct
> virtio_gpu_object_array *objs)
>  {
>  	u32 i;
>=20
> +	if (!objs)
> +		return;
> +
>  	for (i =3D 0; i < objs->nents; i++)
>  		drm_gem_object_put(objs->objs[i]);
>  	virtio_gpu_array_free(objs);
> --
> 2.32.0

