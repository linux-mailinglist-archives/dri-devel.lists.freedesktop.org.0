Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC3266E647
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 19:42:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F14EC10E5BD;
	Tue, 17 Jan 2023 18:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2135.outbound.protection.outlook.com [40.107.96.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2C210E5BD;
 Tue, 17 Jan 2023 18:42:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9RHnND0cKuNcCcnIpAAFO/GE+ouUVqTgXMLbXlw9JILw8eZSJMHJ/0TvFA39nzWpHEmsp6D0mB0dyN4BSg0VYi1AGlcr0v4B9HtMh3cx1lexaEYAD4PXcF4yBIahSRMWjRgU2YWAy2NbhOr8LjJ/guWHZG4COaNUUQvKbYZqXhLCbcmHs6sBt8NZUI70L1hBJPg65yeDdabNScnmvMpJTt8ebk+iZBZZ8s4DF3Okay3vQ58cZjtOOmTo4oTatkNKPwDnblARBoUEAx7VrQL4A5yJjvNrFmmPubvABIg9CGFGme204tMdVtMWlgjUKP85venPAZS2sTQeabe/LlXAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9kVMQMG1zu3nd5gff2GWBp+3IeKd1XYMfQ6wu9RT3w=;
 b=enL450koOtHH/N+aBIbPtBlasmfDvOJ2C1ozuFT3Ymls22Rr4cIT8+9Bbt/5Fc8hOiN6StKo/i0z1oiUAGA71wZ0DYn1Cl6mMN0djB0gLfVXVYybE0o8vMnvJ6wORXd5pUlsAmmZCzQU++hz2Blmm6b6sieIE21eYDzY4B4epk9Irxa0NNcMuY0nOGIGC72MrZ3+Cbc4aiq+iix1Ie8HWsJKjivcPz++B3EM+I8bdAxLtk0M/4BjzlBGiUPhrD72EGpWuZlkFaLh4SIp6wvdliI8MaVZ5nu2/NU0/NqjI93utsx0ZMexO5Jofdcd+9xm4gRRgcbwK91kP207VuxWGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9kVMQMG1zu3nd5gff2GWBp+3IeKd1XYMfQ6wu9RT3w=;
 b=UJmiKo9xP8L8g/NbIbtQuld1ZJYJ23/tbCZ8QcEdXobrX0dhBAU8qXZaLu9Ax5mSLMZr8GbPWSPh1+kfL9yEZad3sMDlSDz9/4SsOLHyPWl8+uU6oWZ0m4RqLoMqf1c6EiGv3hg8KDg3Ber1eyOII3MoKtXZjE8xFT7y+spYCCU=
Received: from SA1PR21MB1335.namprd21.prod.outlook.com (2603:10b6:806:1f2::11)
 by MW4PR21MB1940.namprd21.prod.outlook.com (2603:10b6:303:72::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.1; Tue, 17 Jan
 2023 18:42:51 +0000
Received: from SA1PR21MB1335.namprd21.prod.outlook.com
 ([fe80::c14e:c8f3:c27a:af3d]) by SA1PR21MB1335.namprd21.prod.outlook.com
 ([fe80::c14e:c8f3:c27a:af3d%6]) with mapi id 15.20.6043.001; Tue, 17 Jan 2023
 18:42:51 +0000
From: Dexuan Cui <decui@microsoft.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 08/11] fbdev/hyperv: use pci aperture helpers
Thread-Topic: [PATCH 08/11] fbdev/hyperv: use pci aperture helpers
Thread-Index: AQHZKqOAaFMkGqyk/kqf5eHKMVIb8A==
Date: Tue, 17 Jan 2023 18:42:51 +0000
Message-ID: <SA1PR21MB133555CDACA639F0029CE200BFC69@SA1PR21MB1335.namprd21.prod.outlook.com>
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
 <20230111154112.90575-8-daniel.vetter@ffwll.ch>
In-Reply-To: <20230111154112.90575-8-daniel.vetter@ffwll.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=a3232ce7-3f38-4bda-897e-18db645f349a;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2023-01-17T18:38:24Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR21MB1335:EE_|MW4PR21MB1940:EE_
x-ms-office365-filtering-correlation-id: 74e9a4d1-d893-4974-495e-08daf8baa37f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eYqGIIwZQmzNvzaNTUDdl8FeLKaqBcQ6cWQXaiXQYiaT77H2hcFFPg3ckNa5/yaujh+DwrS/NIaMeeO+VexnuVm7DgQiTyOqhlUaI67x1Lkm8tQqHrxP6mJlq/zCu6E5SfgPKIg/OS2/1RdofMailyzgIZ0LiYEz5WEVjwSgs11JEomhNUfIXyeWEkrk0X0WZVFzXZpcdCxW2RajFzY9I3BX+GvoT/cs2lY6o2H+HLYJ4CYsuFc11forDaLzhvImhiSH6iapclRvluDbXaBf6Iqubhm+1YQeDLIcB1VkUSytZKOagYpUpoy/7FBxBUXYMZtbm9+pP106dSDvFJcICzKtQYwCNJqPkcVRE3m0AlUJIJEZ/TQjLV7CLca18Q31vM8ZOADAv8gMyzsmtjSy3c+N5TTlzk3EfA6nkY00F2zlKsITHsMuqXitLuanNZzDclgcwcayDioGk9m8TzR8Ajllhqu7lCT/MXSZZH0KHycZ5mmYiU5wF9byNo/MG20OzxRqls+zKsyTL0D7Icavu086KaISorvsLxSiSNTFma9qjShlMW92/l9Zq0Uymn7dEGhuqVnhzN4IIupBBszfuQdz9l6FOLt6UKvma4DXFsR7RM1OtEyjnnJeS6ohCRxVDvrjKRhgYEDSVtRMnRve4OeqV0GAfASuNpQBiPR2/G1NtdsJ+DkBrIq+aMoLeiebHxFmw8o3i/i7RqSRi9AEKUjVH7pNHncBneg1EHXerOMhI7prLll3xdMHf0DiuJkS6p6VHAMEHsCcdWybLimRiOOW4kdSh86HjNtOgRdhcAQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR21MB1335.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199015)(82960400001)(82950400001)(38100700002)(33656002)(122000001)(66476007)(2906002)(66946007)(86362001)(38070700005)(76116006)(8676002)(5660300002)(55016003)(66556008)(64756008)(8936002)(66446008)(52536014)(4326008)(41300700001)(8990500004)(186003)(6506007)(26005)(9686003)(110136005)(54906003)(966005)(316002)(10290500003)(7696005)(478600001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5DDrP4K3NGCYdOSDWmioZ2Mx21jk6nzrZVK/aDt1HUp72BtUR4stj0cB1k39?=
 =?us-ascii?Q?CQuOsJBLM4upwcEWs22AtrrX1KPMOUvFrSdl1jZOeEmxdX6yQj4r17JmZyPs?=
 =?us-ascii?Q?HTrF53PUbBgEDlPIptUuOGXv6lrSZkPoXgi7CijNVklbOKr/IN2ebGMOwQkX?=
 =?us-ascii?Q?E2Mi+V3+3CL8D74ZbhZkXEPBI3+dhfQBzWL3torm1QXF+rAydz308obdHyPy?=
 =?us-ascii?Q?c+7mM4B8SFTeLtIALIhZnD9K1TmQMBmYWdDfxogMGc+TyIhezm7u8EzmAh2W?=
 =?us-ascii?Q?dU3WpTMDTr0GRQg2b+/UNPxTgpYEXoEzki1vwt2+SGv2cbHqIAha2o0KIdcb?=
 =?us-ascii?Q?5iJ93hB1ZGeM1NP/2hnGXi18ezqbYJN2xPnACiTIJ8KGZc3K7m34xlmven8j?=
 =?us-ascii?Q?JkD7BKNLi6TqAnXN/gh/ddDfALkDU6y7MvofnKDUrhOqVqpHgYigcdteMNGC?=
 =?us-ascii?Q?l1jv8hUgn0xTFpJc3S5pD8mZ6jCokTBgUzc7KUemppSsrIV4LVlsbeFUZhWg?=
 =?us-ascii?Q?5Ejn5tSt3nXTmbabPS2q99nZ0U6s5A9JD5pSy5e1gqLDNW2ZUe73BPiOzYFn?=
 =?us-ascii?Q?uAOImQE5WUECQg6UjOc+6QAmN9pYMnZoEt/VD+J5PCzKLgiAuGbM/S3Khb7Y?=
 =?us-ascii?Q?AaFX7BkJfFJqUVIm+HTYYMc5RtIIeau2+qn9gx/8XnaMzHl2i7H/IeeFPp1/?=
 =?us-ascii?Q?cvzpvA/Q75updkwm8tl1E8ESljOzPY/iEb6VfU38uNa8UCFjtStdN+OUpRPN?=
 =?us-ascii?Q?5UVkEhNoLypM68IkTqfQt34lnUJbz60PMUeUEoJbYAjmtdmYylYjgk2e88YY?=
 =?us-ascii?Q?PXwSMaXrNZtc4Flve69AV3vhVUT9IJhyvUznNKRP5zG6yg1l5ZTD3xnOWalx?=
 =?us-ascii?Q?1etWw8YfsIScr1YPi9zpz6lQAacwBniPIbgGhOUlWLew4+xaXQMTCfDaXcpS?=
 =?us-ascii?Q?209eg0Yu8ZC/x/Xk2iggx3NTCnnt/DyxIRnrsEhy3F7ZLrOuh9OrhDNVIwKJ?=
 =?us-ascii?Q?b6m8sKwJJr2ECtvzGO8ENy1KHasLnQqCa06T54tDPEG4ofKT4YnU27FiVBeK?=
 =?us-ascii?Q?DqitMjFVQvaPLN1qA2fiZpOQoESvGl14Y0st+lIKlRO+QeNkCuo90faREhzI?=
 =?us-ascii?Q?dRuMa5ZnbezAyaPD6KdtTgRRVB19hkCAZGI2Hi9vyk3XAejq7FeAtF5GBLz/?=
 =?us-ascii?Q?MOFNXfjyoV3awKp3z5aUmxub5YXTkZHz5/KQ1vpMdp0LfH9EaOFz0ECvUXlw?=
 =?us-ascii?Q?o+KJbqnIhdxUotl5ZivspCDnKkgAk/IMyOPmBNzkCgbzBjgMa8IClViHcgbJ?=
 =?us-ascii?Q?grl+ru/VPpIMUD5ihnPAokaDdSgVX0zFlQ30QjgTe9rQ7I7ljo1NE9tyl9DZ?=
 =?us-ascii?Q?zY+ZoygQ9zU1uJ+muIvw+Pl93paXbofXlqYXrWaPqtUq6iTAOhrHmC2EBi2k?=
 =?us-ascii?Q?+u75mjeUk5WKQOonLl92rkolXtRPb3OVbbdUS69nF+NEnMeUarCMo+hX0rYE?=
 =?us-ascii?Q?xn+953j3ScN8ZOsFhYw2+v7uoTrFNPXfRzxlL9wIFqz32o/0cbXPlKVOMgv2?=
 =?us-ascii?Q?knSMLZa1PN4vrzv6I45fv1kYOJ2D7uv3SY+5fNib?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR21MB1335.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e9a4d1-d893-4974-495e-08daf8baa37f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 18:42:51.6667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2F0E6Wcvl+7GM9CTRa7PxM07tKXAFunPsQ6hEDg/FJOb7sbJAUYp0UsWRaXDV+lLobYOz1THYwA1sDhwzoFazg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR21MB1940
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
Cc: Wei Liu <wei.liu@kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>,
 KY Srinivasan <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Daniel Vetter <daniel.vetter@ffwll.ch>
> Sent: Wednesday, January 11, 2023 7:41 AM
> [...]
> diff --git a/drivers/video/fbdev/hyperv_fb.c
> b/drivers/video/fbdev/hyperv_fb.c
> @@ -1076,9 +1076,7 @@ static int hvfb_getmem(struct hv_device *hdev,
> struct fb_info *info)
>         info->screen_size =3D dio_fb_size;
>=20
>  getmem_done:
> -
> aperture_remove_conflicting_devices(info->apertures->ranges[0].base,
> -
> info->apertures->ranges[0].size,
> -                                           false,
> KBUILD_MODNAME);
> +       aperture_remove_conflicting_pci_devices(pdev,
> KBUILD_MODNAME);

NACK. I think the patch breaks Gen-2 VMs, because 'pdev' is NULL in a
Gen-2 VM.

A VM running on Hyper-V can be Gen-1 or Gen-2: see
https://learn.microsoft.com/en-us/windows-server/virtualization/hyper-v/pla=
n/should-i-create-a-generation-1-or-2-virtual-machine-in-hyper-v

A Gen-2 VM doesn't have the legacy PCI Bus, and doesn't have a legacy
PCI VGA adapter device, so the 'pdev' is NULL here.

>=20
>         if (gen2vm) {
>                 /* framebuffer is reallocated, clear screen_info to avoid
> misuse from kexec */



