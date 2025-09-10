Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F149B51B83
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 17:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F98110E2F6;
	Wed, 10 Sep 2025 15:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="iLzCekdq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazolkn19011059.outbound.protection.outlook.com
 [52.103.14.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB6710E2F6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 15:25:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTEfKU5+exLkxpn/+1/VO6cCb45yD19DLUbi9XrT6Epb0fR2Ij8axnJyNQ9I7CVgyu/3gscIt8OghbjsTx/o46A2E1q6ZwqB5k1IAWBkP9qWYyWyXF4NQ+ns/U7r8WGGdkCJcF6nDTkcS5xbp2eqdAZB72uKiN8ePJby4E63MAofTmXoFqmnZP7W8VrpQjGJc8p6+++WxbKR0c4nJdYVnA+pC3gAPPe9IAY5OJPRvIZK5SoXr8AtypQHUWakL2en5+2GTMleZaFqE13n+8iRcOaZf4Qk0ZaQkXDYUFzzudm7lHMeoGoyxLyabat4qAy10UF1bA6ErYdtG5yCQbHBpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQhl7iPgOUZiR7VjL6oK7rHIO6xMgO+gJ2Xi82X6umQ=;
 b=wte2f8reP4lp2f3bq71oTGAyiHDT/ECpTy88XoIP80na7iLe4edRMx9YjtjokVuoSeXkPqnQdykal3y/YdbJkY0gncTemLgxAwI9dKtXuA4gS8IK3qNBIeIihHxS08uL7N8/gM4dfPHxXFxZ1wCsdA+fM767wLiv1l6oE5fX2wYS4hjW+JowVtGZakPfDZD1X+Ay/8J0QuE9ZSV2Ws/MvaR/xfwcJk5xL8N1sSr+pmMeXMwjIVl+tVHvJDM3OndZXXfbG5Q/MEqaZptQbYOTKaRslv06eBjyPyRlCAz2KOdYcryqfDiyfJ/+fb+gxcBpOQYeGxwLp0Aql6jCFhLVaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQhl7iPgOUZiR7VjL6oK7rHIO6xMgO+gJ2Xi82X6umQ=;
 b=iLzCekdqwPQY5AvEwW+Oih0xzKgZv6S3O/EDz8TjWQeM2yjI0+8m5rvoaiJhoyk5xkqzHAFq1ZA2uKPUX+jtvecNkVAExiU0/vACjE4DQiPV++cEs4d7bYmMZqtGCiEYkbDpvu610ipeOf6BMv8MHR2qtBGdrU/D7fp8dLPMygpkzUrDsKXTX03AslGJfQHg93ygi/e0J+Bcbbs7pooaMHXXcWqvqOVgSMhdk0DfhFgQmouCdgby8LhB8oQmB/K1dilj++fU5Fio+grcOHPJObax+xwwAWofn84bq8lkcn5laqWtiP8Z9jm6GPx6S2tlGXkV1WFi5R/XenDL3pcKrQ==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by CY8PR02MB9154.namprd02.prod.outlook.com (2603:10b6:930:96::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 15:25:20 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%3]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 15:25:19 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Prasanna Kumar T S M
 <ptsm@linux.microsoft.com>, "deller@gmx.de" <deller@gmx.de>, "arnd@arndb.de"
 <arnd@arndb.de>, "soci@c64.rulez.org" <soci@c64.rulez.org>,
 "gonzalo.silvalde@gmail.com" <gonzalo.silvalde@gmail.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, "ssengar@linux.microsoft.com"
 <ssengar@linux.microsoft.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [RFC 1/3] fbdev: hyperv_fb: Remove hyperv_fb driver
Thread-Topic: [RFC 1/3] fbdev: hyperv_fb: Remove hyperv_fb driver
Thread-Index: AQHcIasCn50A4HP2yUGHdjWciNX7b7SMKV0AgABbISA=
Date: Wed, 10 Sep 2025 15:25:19 +0000
Message-ID: <SN6PR02MB415755A10BD2C9D0E7F847FCD40EA@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <E2D7F2119CB4>
 <1757437112-2509-1-git-send-email-ptsm@linux.microsoft.com>
 <8a958fe8-fbba-4bd6-a79d-fd310f08f8d7@suse.de>
In-Reply-To: <8a958fe8-fbba-4bd6-a79d-fd310f08f8d7@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|CY8PR02MB9154:EE_
x-ms-office365-filtering-correlation-id: aa544281-e56f-4bab-6e95-08ddf07e4060
x-ms-exchange-slblob-mailprops: YfhX3sd/0TVWrg+fxRScxfg9v9HXnUFliY5CL1PUSlSP4JOveej6uHlIFMOthK7FWGTj0V24kCwEWAexG39L1SSG49kK0X50e6GW1JkN8xf9yBONANI/Ymxgs6hPjv7pA1Tx1F9T+2Cqnoqeoj0bo156Th+MRMqsMlma4sPpj0k5Qll1r2kMwIpSmp7N1SNMX4LMFKDxuAsIB9psNCQ+u0DeYZYHv6/aTRbZRBFv1NDldX58UKCqDwS9e4gZJoyhfSlP1LVOAPKgGF0s5eZj7lwXwvLkWPFdzRgLMGtSQg6o3ZA1XeBDjtQvb71XiLtr3fId0MilPgdq6eMNEgTwO1YYNVK22qhnDGhXrK+35bTOuyNdOlMXAUUCb2/6Geq7P+2/A0dys6IpA7r6QWkKtoan88tcnEppCKexLoJYDI9RwB793v+9PfxUjBBOFNDa8JNeNEtlCUZR1u6wjJfdCrB1EgfEK0AZFXw5A+x+wU5yr3kEhDuGk1foqSAhsQ6VqiBiQWTYoC1jQxmSxuAU+TFkd3dHlKKCcDohuagn4u5H62HHIiePqwSIE9I9oCLmAMMDjnnuy4csfUR2d+GIBm0UyMvExtuZoBvgZrNul1wiSWAcVY5W+JEf4v0w5ct8ox/vVQe/yNfWJtfFXFCVmbj9zgrGN+oW5ch5APwXPb/4Bwguxi/Zz1oOEGz5SyrJMW/UoH7ilZY0WGkLVEacxRzgximYkLGVqq6GlL0SlXy7fSwD+rhCibw8I6hzUI6hn/UsrTRxGfLv+dHw41l2hHpfHhRUWuoFiDR5mm6iwvk=
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799012|8060799015|8062599012|461199028|13091999003|31061999003|41001999006|15080799012|10035399007|52005399003|4302099013|40105399003|440099028|3412199025|102099032|1602099012;
x-microsoft-antispam-message-info: =?us-ascii?Q?OXzLIooxr6OXiQwZqXxA9Nfib6T3P8apR/p1m+ik88KG7eDh2tqdZ0nEfNTp?=
 =?us-ascii?Q?yiCgmbmwIlzpxNVPpHwrhy/6uVw/ij8oTvPGVy58B9xvFjLdh374LFLYWNCe?=
 =?us-ascii?Q?erK0lXS197dUuZVz1xKrezA7S0feABH3Yf5KDvEV00Nb2Ac+ZTk5Ufgf4/o0?=
 =?us-ascii?Q?ddGW79pVLBs+bbXEkwYp+1kynGKb3H0s0UhWHVfyaiI3RSd3LRp0xp/WkcTS?=
 =?us-ascii?Q?0+QtlQwMGgdcL/1UsfGBfVK3rGRlej3Y0X9sLi53KQE8ZdI7uKOCIg3X+X95?=
 =?us-ascii?Q?fzI9E+ox66YPnJ1ObUoJPaGbIuNKN6egkKsx0cHFFKpbSndJ+bw18hrUVxqu?=
 =?us-ascii?Q?+FFgAMcL57bpK2InwaRzn0CFnaGQBLn3C/LKAxw5C3wPFI/aK7pl+h8iyiwC?=
 =?us-ascii?Q?FErYlD3lUYC4nu8HjRVUqDYLUSm6m+9PklFTrbzwDSOe38jHBtVbtKLtl21r?=
 =?us-ascii?Q?+jKDJDRwvBXeja07eV5/e2t/kNXdhHPtPwrAey1+daPx270xXhaYZ8u6Intn?=
 =?us-ascii?Q?3+HR0TeGMYDO8PGPA+5zj4LT1FpCZEC4WsuF8L52KCnt8dIsqkW9KTC6rdQb?=
 =?us-ascii?Q?j3btpPF5s3/nPxls2RrqU2DywUYlaMbIj/jjbD+4/8HO3R2PCXOf28cGbUBJ?=
 =?us-ascii?Q?o+ik+qa4dk+I5jbKp6GUwCoiZbpxKZikFO4Dpo/NVfsgTgGq1fqlwC3RGQoF?=
 =?us-ascii?Q?uGtpc3YffdTW1GKjHHLiKLPEFVG7WYif3pT0k0ixrGjDDhk1fCVf3GreQ/NP?=
 =?us-ascii?Q?KsS6F8Qyc98x/IPjBoHXjxLVRLwI9Sz8qMq8UNQeTUHFMtqq6H1S+XPC+/pT?=
 =?us-ascii?Q?8Slg7keKImSwJM+j9aD2FGXAdbreXGIeYbAHabeDbfIAY+PwbIHddB2WqANy?=
 =?us-ascii?Q?gaJUMfS98MsXtwEuUp133eUMAcdWn9aHDsMaXzl/3Q5oOpDchtmgR/6pd1Nq?=
 =?us-ascii?Q?ul6un6TWHcF2qPgX/pX2fQPc7iphyc9lyPczbUbF2N+WO1qSj0VbzQaGrylA?=
 =?us-ascii?Q?WXmGmoW0hCtRnCgSSHEqhNMgPdo0LCv5AeunICihmg5EWqXuh9sKFAzPAMgD?=
 =?us-ascii?Q?KZScKhSKci5ZrWUFKFf37LBBJjnUrg0L7qZdJgnNBSu2i2dgjDBY4ELJO5md?=
 =?us-ascii?Q?IGhC2t1Ra8TP1EKrTnswKIPrMEB3dDFqTXzZMKm6h8x00yOOerunXQL0Uafr?=
 =?us-ascii?Q?/iNY2BSFcEylc3KjibaKLYRwblWwdPcCsF7uJJqBpPWStXlddTAJM+Q/R6xh?=
 =?us-ascii?Q?gxVKYcrh8KVXCK/GTAXQSiwOmCQtyYvtBB55ge011zcUIkHBQBkfmbdrQYcV?=
 =?us-ascii?Q?g9xvKYx75pxgZBdl0PG+iMke6j/1c07/oeJUJJidIRm/e5mc2tTa8f9mkgOo?=
 =?us-ascii?Q?7Klxrsj5gS7j+nr02XVyhTn7E7vs?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OL11NHEsXKT1s3F0Qlkxuv0IJEWrF6cE16avkHSh9Ycgw0T42PFH8tbGkOds?=
 =?us-ascii?Q?0z5n0ghtQA8e+qdFDNQ6Ca8TU8Y41mme4D9Ry1ORip6u+9GieRmUf8SnRtxR?=
 =?us-ascii?Q?fua0rhIQggR5f7g3cVnyk9WVQQeWCOsK5NgBk5yDrLzUTfL9H1DuSA1t2a3d?=
 =?us-ascii?Q?h3BZ13G+gtZG5HAn3H63CYx8XEBsdmo9ZmT14QyJLqlUtP5xg1jazKu6CpQ/?=
 =?us-ascii?Q?pM2DBf44zSkp8e1IKNcqzXHVnqDLomUNPmNQv1hx35fHdlG2eWKL2iUZsgY9?=
 =?us-ascii?Q?FpCAB45FRywQQeAAiKijpFCxWg4gW9j9G3vKeyvZ6NbxxGcQvEse+D/5MSD9?=
 =?us-ascii?Q?dhPGBB0wbkfLNvtBqKPjP+bML0UcGOVFa0sHOsrTSlh9CUxLMGo+6vcInRuC?=
 =?us-ascii?Q?mVMXQcv/yJHHUFqXfnmP+ecYvLSY7d5ob7Z7vMhrmatPi2wiBm8DLSxBUl9L?=
 =?us-ascii?Q?yECYkYRVyIcSceBC+AzX+8ICwBBer4YQgS9DjKBrdbA01IF4PHZON2/2UVNd?=
 =?us-ascii?Q?ef8QlrCUZjzzJZobp8MdzhQO27Wh25zbJwRMxMTnud3mwrgxHcVXBejaMXgh?=
 =?us-ascii?Q?kFg+uz5nIHhXOGHU9MFzAu76N1B+p6DrAi5wJmEZQzBXB4N3z6K3+8th2aC5?=
 =?us-ascii?Q?ST0rwktZJJHD3EkPoRk+uAv01XXNHB11mvXtii9h184reC4A90qcwCqn0EfK?=
 =?us-ascii?Q?VLb/wUNBS5DBEFueuXoZHDCIQ5eyfMe7t1vmzqWABJuJ/gg4QWXaDH2cz9Hl?=
 =?us-ascii?Q?GAwYkyUmuE+K+qgiyJBEtNcb3VhRUfy2CYI3SuXRwJdySOa7mhFYRLC93zFc?=
 =?us-ascii?Q?+hk4gsI9/N/A5k+34DcjrE88zi/OqG1j7CK76ZIEwzZWtUXqhmYrXZkb0GJc?=
 =?us-ascii?Q?uWhDL0IQZRXBxAIu/T6fU3QvUI3itjedlsPc2B8qajqwxKsVCK46qEaND6kd?=
 =?us-ascii?Q?cHwGTwIwGQ3k95GCo2e83Hf+BZdY+BwSbdVJScYnYnbXPxEeF3fJsp5jcSkK?=
 =?us-ascii?Q?wUWHwFFwaxxLDdmIt3SQYbQ3YqfzI5xZE2SDZQpYg40XwzEYXaNkW/wnNksq?=
 =?us-ascii?Q?RTcp3qzDsR3S1ApNQnWpR65SVIBb+e2bFH/owLwu8xzHwa9S3TI5EiNv+WS3?=
 =?us-ascii?Q?nxaKeNYDRTGWD13OMw4ImhEZ2sapSSjvu049WQBkaMj1FYsoOD6u8H+6TVVX?=
 =?us-ascii?Q?nP/oSkZbqVujvnnyeXZ5IDlRiw1oP7x1p0VGVmOp+U/mKaXdSXaWjTRiMv0?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: aa544281-e56f-4bab-6e95-08ddf07e4060
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 15:25:19.2835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR02MB9154
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

From: Thomas Zimmermann <tzimmermann@suse.de> Sent: Wednesday, September 10=
, 2025 2:36 AM
>=20
> Hi
>=20
> Am 09.09.25 um 18:58 schrieb Prasanna Kumar T S M:
> > The Hyper-V DRM driver is available since kernel version 5.14 and
> > provides full KMS support along with fbdev emulation via the DRM fbdev
> > helpers. This makes the hyperv_fb driver redundant, remove it.
>=20
> I'm all for removing obsolete drivers. But hyperv_drm likely first needs
> to merge the patch at
> https://lore.kernel.org/dri-devel/20250904145806.430568-5-tzimmermann@sus=
e.de/
> It's been tested and works well. If maintainers from Microsoft have a
> look at the patch first, we could possibly land it fairly soon.

Thomas --

My testing of your v3 patch series for vblank timers ended up getting a
WARN_ON after about 3 days of usage. See [1]. So I don't think it's 100%
ready yet.

But I agree we need your synthetic vblank timer support to address the
Hyper-V DRM driver performance issue, before removing the Hyper-V
fbdev driver. (See [2] for a description of the performance issue.)

Second, isn't it customary to mark a driver as deprecated for a period
of time, before removing it entirely? I don't see any documentation
on the deprecation process, but I've seen it done in other cases. If you
grep through all the kernel Kconfig files, you'll see entries tagged with
DEPRECATED. Also the driver should be updated to output a deprecated
message when it loads.

Michael

[1] https://lore.kernel.org/dri-devel/BN7PR02MB4148E80C13605F6EAD2B0A03D40F=
A@BN7PR02MB4148.namprd02.prod.outlook.com/
[2] https://lore.kernel.org/dri-devel/SN6PR02MB415702B00D6D52B0EE962C98D46C=
A@SN6PR02MB4157.namprd02.prod.outlook.com/

>=20
> Best regards
> Thomas
>=20
> >
> > Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> > ---
> >   MAINTAINERS                     |    1 -
> >   drivers/video/fbdev/Kconfig     |    8 -
> >   drivers/video/fbdev/Makefile    |    1 -
> >   drivers/video/fbdev/hyperv_fb.c | 1386 ------------------------------=
-
> >   4 files changed, 1396 deletions(-)
> >   delete mode 100644 drivers/video/fbdev/hyperv_fb.c
> >
