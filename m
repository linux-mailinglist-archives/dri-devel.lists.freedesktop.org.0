Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 229AC58AFCE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 20:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA18914A6;
	Fri,  5 Aug 2022 18:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-cusazon11020021.outbound.protection.outlook.com [52.101.61.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3AD8B5DC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 18:35:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9Em5BbH64ZNXKaIFbw/61dO8/9eE3vEA8+fGqYuH/eFoSNqupJtoQLJht5Ch1CPQqTDXGk+zcAE2pch7YWi9Eb5GvoBBoLdui3Fsy4ZvTe8yINdwJ7KhMDImoZdwhVkN7nyOnWmQxjNns6F5qQZMSycDCDEbtGRHSRMijPDhSZdz/4zhR8BaVllNwamHcl6mMQiJVYScNT68BZqG2JnX4LdJvCUtyue8SKE9Xg9WWfUTf6+3mQDINvxrXEL68DVd6651b7EmcoKhQTKZr5oOVhbT/518LSD8YRrJoi1+PLTk66xi3i9fqc0EFq9Uq1L81eEKTx8Py6BUL0zkxY0VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYP8DjgNImKn3Sumv0DM+z5UnJhXqDJL7y/sHXX3kiY=;
 b=arKCUgojMaX2bdKvYL09QzDFaoW/eQf4jWDly1wj+2BmTIn1PZxWpWwjgWS1XvpuLKNWu4jr0IffF7/mCLFSNtw3zeMqiZhFZEE+I5bI+48bLkNsRwnsDHtutrdEkjKClKLfK9EgWrcbttLbU00Ntit9+FpW4R2lnB3Vlth8k1E9NvCjzVcrMMaWYyiWHSohH8shwG9MOYWKTQ2Ih7mlYinw+Fn2leqp/p1VFtJ0oT4CNJpuativNWPoC1OLOc2grr5siltXqDR+KMOL8h1/ugqUy5R59qP3irGJ6C03mXmEsqWaXdNLgdOmQZnyoVuFblMWib6kyWqhBQ4DtP11KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYP8DjgNImKn3Sumv0DM+z5UnJhXqDJL7y/sHXX3kiY=;
 b=O9eDccU5XWattU0UI4OiH7+DMBlIvl0l+0TfuLH8aN0qak6LExK/W7dhMyggKEad8+10Jibd2MmB0vJBABfI/x4lgRU2k2vKVqpepxkoPRbF2BHSky+XRiLrt5OQrd8xM88dHu5rO/+b9VC1IuYle0e6AEWcGHTa8djfuhA+soI=
Received: from PH0PR21MB3025.namprd21.prod.outlook.com (2603:10b6:510:d2::21)
 by CH2PR21MB1431.namprd21.prod.outlook.com (2603:10b6:610:5d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 5 Aug
 2022 18:35:02 +0000
Received: from PH0PR21MB3025.namprd21.prod.outlook.com
 ([fe80::29af:3ad1:b654:63b8]) by PH0PR21MB3025.namprd21.prod.outlook.com
 ([fe80::29af:3ad1:b654:63b8%6]) with mapi id 15.20.5525.005; Fri, 5 Aug 2022
 18:35:01 +0000
From: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Deepak Rawat
 <drawat.floss@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: RE: [PATCH] drm/hyperv: Fix an error handling path in
 hyperv_vmbus_probe()
Thread-Topic: [PATCH] drm/hyperv: Fix an error handling path in
 hyperv_vmbus_probe()
Thread-Index: AQHYpRhoWdKqZI1ivUaFNPBsm/0vva2gp4OA
Date: Fri, 5 Aug 2022 18:35:01 +0000
Message-ID: <PH0PR21MB3025D61C85CD6E724919A9D8D79E9@PH0PR21MB3025.namprd21.prod.outlook.com>
References: <7dfa372af3e35fbb1d6f157183dfef2e4512d3be.1659297696.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <7dfa372af3e35fbb1d6f157183dfef2e4512d3be.1659297696.git.christophe.jaillet@wanadoo.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=fe3841fb-4099-4e82-98b0-b322b10f7934;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-08-05T18:26:17Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d09bf18-c340-4f59-bc20-08da7711354b
x-ms-traffictypediagnostic: CH2PR21MB1431:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rvmo36Kvlxkw08YxnOcQyRTS/WXwtsua2J5U+tQMz6gqoTMXlAAaS18lGIeCOAdbcALB/Tud63nFdzUmKC3tu0cE5yBBfgDVGgworFAhYQsALrdB6UnLK5Tr+qgs2lIryLRsSPRDRWlu4tj2Cbbdl8ntMJP0wiA8l0mHUGXhMp1PuV29DvndssTtIhTf/HWpyuoVd56anCtMpYUaf/7CTjkPT/OyXICv1A2VAYtexNZWt0pYhdGVZkZMaj9IxRkWYa8cb0EEUw2u7nLkjCGjZAIjQth52W4+R600QuNtEv5f/SRUKymFoLNNAk7rbA1kjH3I1xCxHnYrp5NzmIWjeIEaJO9r3b+356Gq1aTJCZjWABs7wyAA0uIGuoZg6MVmXHhUMAALSlgaC1N+ck/p+QsS4tYspPyRVziq7y0QsDXLD9hWaiLe6EX6h65aavEEIslvpDaj0aUmcAoM1kR33SCfG2MPSeV0j4LlPT46Od7H7lJrBHd8m8ojvTha7z4xfo/CnuFTb78RQkIkcvhiAT5Q26r9VXe12o7cyGEqlQJ4YLTRF+e9iY6V2PLPjZuVzzs5upoDJkxbqqi/nlbp9531bJjm3G7zxP5+8ALSTjmI3ROdqiRMxdD1GGtXVRbTGQko2ZSMRVmTB2NbiUxkwTbXr4aVEdPU5hCDAqs9h53liX1QkaYRwoAb/pvStglyGaGxCBU1H2ZwnMPG/LfvnOEB9/7KjAUKmKYIDeBKmj0KFeICcdCuhBu88hID483eD4knMnIFSyOJI6wHEJ6hXwm4Of/K0U/C89MZLt2UuLLRh5vy1gGbDsSiFVhFYMiYdluWO80kTkBUmvAxar3fh6/tme812118gb6UMn5OTnA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR21MB3025.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199009)(110136005)(5660300002)(52536014)(8990500004)(8936002)(33656002)(316002)(66476007)(66946007)(54906003)(64756008)(76116006)(66446008)(4326008)(8676002)(55016003)(66556008)(71200400001)(478600001)(10290500003)(7696005)(122000001)(38100700002)(38070700005)(6506007)(41300700001)(86362001)(9686003)(26005)(82950400001)(186003)(82960400001)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lNipHprEqhPu0jlqATcy5bqSyLj/kYseTT6u41n5ZeKb76ySpVdeNiJsc0Oq?=
 =?us-ascii?Q?lcXtUMI9hQ506boccLjrYfhtFq3d7Rtrc24j0WpI00QRhLqQwUJsd4D92xLX?=
 =?us-ascii?Q?p9YDrT5knC+XIW/Z72hn9U8KcRfe8LayOlLbocS9xPHzQKDgkmthzJnV9YtK?=
 =?us-ascii?Q?yVJO1TmkYQfjyhQmWRBKofSljjjfpx+8y0EF8UZAHtQ1aJSQOsExJ2GPEUjo?=
 =?us-ascii?Q?M86Wc1NhGQ2A0bGv5gvO7QoGpxrBFm5qTnKaZ0VnkrhTv/2BQIfx0foZbTKH?=
 =?us-ascii?Q?wtaj84Gf0qItN269NzE8TNO8dKkxQomPih1cqO47UcyLjkzytAFB1X5de9d7?=
 =?us-ascii?Q?czBJ6AWdPA5HznITfXENhRaNJe5vaX1Y/w8iS7CvxKdINOcfEsJfJB55AHq4?=
 =?us-ascii?Q?fy6WV714UonucGcysY6sO9k/lStU+Su6iXvyr9IqyugxFD2pPpOyhaCwEgWB?=
 =?us-ascii?Q?RL7+948F05InS8G7sSG1qyCLeM6lJKS1kK5sVRoF0mxJiZMGKjqgj3UPmMLZ?=
 =?us-ascii?Q?LhCbxgdIyhufzZG9BnikKx+VrCnF3Ab7/31XgNAA8FmO01FE7HySiOeEoOEr?=
 =?us-ascii?Q?DpycPFl8P5KR+1In85DQ80VY2IOMk/f/u/TExwg5obyiSNMEwhUWEqy/yOb3?=
 =?us-ascii?Q?ja23UYQ5drY3pDCZBCOZTOAbA1r+I9PTjpW/rlp1Cky+4ZbYCXRg317flC20?=
 =?us-ascii?Q?oSQXL/oWSYtGIPeGGFWJRsiIdAy1dx+NyQ4AMWmVoPLrunnSy9vv59vRMBXR?=
 =?us-ascii?Q?NL6NFmlP77a2fYE7HygNbrV1G3qRneT4V14ls+5QEs9A69vmevVoBRhickB3?=
 =?us-ascii?Q?QrNCU03eGbid9a93VHqSj/sd5eaIp6KWWBbikoUcd/tediUL/O1uw8fqNCg6?=
 =?us-ascii?Q?8/NTSYEry4lk3XGXZx6IZTpwauZXVF7fBxxI2UjDUw87nbUDY249dOYejYnO?=
 =?us-ascii?Q?aLDHB0BoAig68C9drlAhjypijMENfjiBKREvX9exGUNckR5HGj/gb0tEiDOj?=
 =?us-ascii?Q?gvxacfmhusvnM/LoxARBscRRWxBRMMwnJSzRQB/62QNRr/oZSm7FpbXBquTX?=
 =?us-ascii?Q?u9LrQj9TLzS03L5P8s7cgaWxtDCtcicetYvP0vGMlEhGZJ/zOtQsW1uZOuzf?=
 =?us-ascii?Q?dBwEICq4ZFo0jkB4it1TjI6dhD0jMOId58EDYBLATfUA72wRwXhA9OLMpckP?=
 =?us-ascii?Q?Bv/ZqsLv9ddE/vzPqRryT2utTXr/YrURZDHfBN6WK+7veH9SGG999T0KIfib?=
 =?us-ascii?Q?uyXExTuMU2wbeUlk0K/b84suvC3sX1wGMJ4c2vFgUYclqDSXKsNCcOF3gtck?=
 =?us-ascii?Q?6ImQZ1KlZzenBcBuI4M9ng5dWmEYmwFelLOTW2rCNX7plA23Fm4NIT09Lnsz?=
 =?us-ascii?Q?4ve5BorvsJqrimIOXMBRV3vGgMYHcMrmfPBzzJYTeVV5gNQYEcZN3d6hjjPa?=
 =?us-ascii?Q?VSnsrO8Jh79O2kYRITd8yDLQT7m3S1lrkg7doVMiMe0aUpizc6MNHlfAJItj?=
 =?us-ascii?Q?n+IOY/dx88btuMmX+jjhhxbwWlJU6km1BSPMmbWmOzP1Ix5ZFqdZ10gtCWD3?=
 =?us-ascii?Q?hnEY6+qnKxsjuAHJmO+Ex+JDk1pg6DpJDeyOHMJT1fRgVWZpl0MMFMKemPAP?=
 =?us-ascii?Q?mw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR21MB1431
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
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr> Sent: Sunday, July=
 31, 2022 1:02 PM
>=20
> hyperv_setup_vram() calls vmbus_allocate_mmio().
> This must be undone in the error handling path of the probe, as already
> done in the remove function.
>=20
> This patch depends on commit a0ab5abced55 ("drm/hyperv : Removing the
> restruction of VRAM allocation with PCI bar size").
> Without it, something like what is done in commit e048834c209a
> ("drm/hyperv: Fix device removal on Gen1 VMs") should be done.

Should the above paragraph be below the '---' as a comment, rather than
part of the commit message?  It's more about staging instructions than a
long-term record of the actual functional/code change.

>=20
> Fixes: 76c56a5affeb ("drm/hyperv: Add DRM driver for hyperv synthetic vid=
eo device")

I wonder if the Fixes: dependency should be on a0ab5abced55.  As you noted,
this patch won't apply cleanly on stable kernel versions that lack that com=
mit,
so we'll need a separate patch for stable if we want to make the fix there.

> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

All that said, the fix looks good, so

Reviewed-by: Michael Kelley <mikelley@microsoft.com>

> ---
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> index 6d11e7938c83..fc8b4e045f5d 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> @@ -133,7 +133,6 @@ static int hyperv_vmbus_probe(struct hv_device *hdev,
>  	}
>=20
>  	ret =3D hyperv_setup_vram(hv, hdev);
> -
>  	if (ret)
>  		goto err_vmbus_close;
>=20
> @@ -150,18 +149,20 @@ static int hyperv_vmbus_probe(struct hv_device *hde=
v,
>=20
>  	ret =3D hyperv_mode_config_init(hv);
>  	if (ret)
> -		goto err_vmbus_close;
> +		goto err_free_mmio;
>=20
>  	ret =3D drm_dev_register(dev, 0);
>  	if (ret) {
>  		drm_err(dev, "Failed to register drm driver.\n");
> -		goto err_vmbus_close;
> +		goto err_free_mmio;
>  	}
>=20
>  	drm_fbdev_generic_setup(dev, 0);
>=20
>  	return 0;
>=20
> +err_free_mmio:
> +	vmbus_free_mmio(hv->mem->start, hv->fb_size);
>  err_vmbus_close:
>  	vmbus_close(hdev->channel);
>  err_hv_set_drv_data:
> --
> 2.34.1

