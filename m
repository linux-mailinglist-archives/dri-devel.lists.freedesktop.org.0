Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7443A26546
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 22:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198F610E570;
	Mon,  3 Feb 2025 21:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="a4JOxh4V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazolkn19010000.outbound.protection.outlook.com [52.103.11.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B84E10E570
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 21:08:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifIudDrNePMYK0/XMZwv6GqzQGUDLu0ygpOxYlDUy7xSGOaO/NNjJNLt5BHOW8RZwk+2OVKOMOmqSH7PysD4gy3ZReamDuHm0eeGGBJXxfFiCXvvO+GPcOOd9dIF+63ix8yU5tDswxXLg0xg/KNjbYd+3ZoDLyDnRTmklVZsba1dPsMk4NMBnHQEpbqh+aTA31WE5gA/vXYjGx5bPHwts1StH7ASRO8i7KjDgIRuIv/nZIz8lLh/xfudfnsjNZw3ycBEphdx7IPJyjiWksodjtRNpSPsEPiCZ0yd1PFNLO9IpS1wdBOoL6uuKbEtT8/4Kfcd280gkqzOQJ675pRqVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaTSkavKU6kgGX8If6zQ1RoB09357SLRHQ0nq5qhORs=;
 b=n2P6KZA6OHlrfm3f2QIgdj7YeTaiNv32pd8LrlbzAVECyLyhSLhykHw+fWcgUfjmHxleBGTdMmIyNCJQHPtZBWPrqcK5tEIFgCujAvKZGn3pYS1Fjjqz/KKmM3HT3y4azOscj4DLylFnuPLk+mkzQFSRl6t7GrbWbWMjBEbmQgPYNtBXynui0T0RrvX0h4A6LvkHrdsnVuzXSNr0vsz5CTS13ybC+XOeVdoghb255Iff5hO9bUgXnxHhZvmjQv901lKX58V+qtFr+8BFlUJqaW45tAvE5i7Np0yFuB7csHx4ApS9aINeKDsGbD+DubfsHfqFEBJEatMGdlC2KQVo+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaTSkavKU6kgGX8If6zQ1RoB09357SLRHQ0nq5qhORs=;
 b=a4JOxh4VNAw0mF7aghRFSoi8HDtiWeN6HzvViA9rIrjaikrnrtzeNYQbQf4Sj+oFuhR8JnAoIXesnYFYGamYr4udBzZjzDeBNCQZE85iZrW89yIERZefDJSoAtNo+6+cuutiTrV+/Sy8vlCWx1tTupBXO6SpkESXHp7bKfQUvy4QNmfm2atWaGixkSLTioBLlWhhTpkN0SE+7uXnRQBsDsAEPAM2ViDDiC9NrdX4mMd2NovXxZ6D/MP3vhFVCbv7VDe5rTL+6OqihDNkvrpkiAh3lx09Igw6S3qww58DWqsgYBElo342F5nOEdXTLMN+D/hvMkc0a0lbxLMuAbXWPg==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by LV3PR02MB10125.namprd02.prod.outlook.com (2603:10b6:408:1a6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 21:08:04 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 21:08:04 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Thomas Tai <thomas.tai@oracle.com>, "mhkelley58@gmail.com"
 <mhkelley58@gmail.com>, "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, "decui@microsoft.com"
 <decui@microsoft.com>, "drawat.floss@gmail.com" <drawat.floss@gmail.com>,
 "javierm@redhat.com" <javierm@redhat.com>, Helge Deller <deller@gmx.de>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>, 
 "tzimmermann@suse.de" <tzimmermann@suse.de>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
Subject: RE: hyper_bf soft lockup on Azure Gen2 VM when taking kdump or
 executing kexec
Thread-Topic: hyper_bf soft lockup on Azure Gen2 VM when taking kdump or
 executing kexec
Thread-Index: AdtzQ0vu6eNj8snBS+OSvfShEIJEjQABFnwAAALyBRAAANwVQADJ+eeA
Date: Mon, 3 Feb 2025 21:08:04 +0000
Message-ID: <SN6PR02MB415777C53A930259A54E213ED4F52@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <BLAPR10MB521793485093FDB448F7B2E5FDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
 <BLAPR10MB521780F7C93DC013E2E031BDFDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
 <SN6PR02MB415732CABA59155898531226D4E92@SN6PR02MB4157.namprd02.prod.outlook.com>
 <BLAPR10MB521743AC3C146116D8F6BCACFDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
In-Reply-To: <BLAPR10MB521743AC3C146116D8F6BCACFDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|LV3PR02MB10125:EE_
x-ms-office365-filtering-correlation-id: 2b42be25-1c7a-45e6-f0b9-08dd4496d976
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|15080799006|8062599003|8060799006|19110799003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?gvPph19mAAEkwcUpKNCMjpjRQNyjoTN/w/AxEGzdFEBmqZXY5bXnCIHMmJuv?=
 =?us-ascii?Q?tGidY/D/K/lRpemCpqpQmWga3xrQalneqZpHvWvobzcE8Oae6tRwICdcYR8g?=
 =?us-ascii?Q?/aLX9IqnAFWTrm8a/1PikGtXMu+9xJv79UbG3vWQjgz2Wmk9Zh5YmCIgEQbp?=
 =?us-ascii?Q?GkGiCcKiOp/SnyRNdcOSe09im38e55mfzkOOF13iqB5YZBC3O//XhtXGX6V2?=
 =?us-ascii?Q?GSQSlKPY2XAaxcFwjNr+LfrJbSZ8tGKQyYDF1CXtDVtjT/VnxvCq8n7BJvgo?=
 =?us-ascii?Q?yRkJTmY+Okm//CsAvIv8M4CPb8PlhNqDoI6JRvEnDP9Go57yOEsLJ+B1mNc2?=
 =?us-ascii?Q?ppr4/zHUkTT8VjRunLbRnpFSAtXhimAKpFPy0596VNNcr+X8osPOv0s6rJAx?=
 =?us-ascii?Q?uXNK05qvIVdryMFDIjvwr/GRcTVLSjS1r5kVd9X81XtCnkCvGx/3H72KZEq6?=
 =?us-ascii?Q?FG33T44jQAX34sVtiir6Q2SlXLJcVYk88lHTrftKljiZDWTPXEZ0to07R4Pc?=
 =?us-ascii?Q?7e/S7UChayRR21ZWIO3VxkLghJCsZxVODNy0xq7cLWE74+6dEdaJrkGVbleL?=
 =?us-ascii?Q?cKqpxx+1EV1yJIeS4/eRkdGVjIz1qAeDu0oIj0hFD7G3fzWm0PcdVYwZ94O1?=
 =?us-ascii?Q?envXuGX8pqdwi7vWyq2kGKBRvQXRg240GQYcyXr8AOgmMZJOZh7rr2hqVoGN?=
 =?us-ascii?Q?4t83GB6bCaICiZ2ouDc9F2bkg+LFa5xH3as8sAN1NcuqIrBtpUjhFZshB6F8?=
 =?us-ascii?Q?TbHkhW0FwlE2PWfXA6f+SD1yQmBIn7dkM1vPO1WsTP3KD5o7SGvCMMy830pe?=
 =?us-ascii?Q?Eb+bKbOS216t7KIWSKb0qxfErYPWonddjor/lmnDkFjgmFOEWnc5sgmyTYgt?=
 =?us-ascii?Q?NLghTQ8FaueUaSHfI2TC7Y4HcgKjD9//WYhqoskbvLAELfpxETDqzPc5Idn7?=
 =?us-ascii?Q?qbAgRlSoaug9nfm0vWw92suRugb/WY3cJhkSig8Epiasv3caczvlX9WpbY/F?=
 =?us-ascii?Q?V6cqZI/U5FcH7eGRJc+A6S8MtMSTSOsDFWMH7r1iSd9doU4=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zE6ESDGkpGma96hoJ0sprkf7VXK5nPi3vAkewht/GfF5S5TXaLA9MN9KCoC+?=
 =?us-ascii?Q?tmmM321B2BJefYRO3Q0+H3zwAGuk3WMWxj1UzJmDVEufTXMcjbFlEQE4IX3e?=
 =?us-ascii?Q?wrHxYk45fPMfD7Wk7f9zOOfhMeBK8+5lj8LuCk/QSBdRxxJbGwEa7L29Vwf6?=
 =?us-ascii?Q?JkdcjpnQrPK8WJGaXuY7J2SN67YWywVYV4BTEJRJGpQ0XMljN47hgStPouCH?=
 =?us-ascii?Q?q6MsvIDzK4O7Uc5H9yU2zNN4rDlJOWlWqYphch28/KQSd/7xfdzJ9+iXETNS?=
 =?us-ascii?Q?Z27aEeKSXWrJR6sO9wn+2+tz6WUg+0ARL0Uki2BgUVFwKmhBFR2kwo0KnUvo?=
 =?us-ascii?Q?nzAkbNSL1nPT3eIaZ7TNAdv6qaeF2vp+0qBhuPzdKYe7hC21glGAFvqukllY?=
 =?us-ascii?Q?cvCANDYqK0LD9L9fY3lhdtbxFemZdt6EByxltbaUO4uJg/3T9GGNlyVlhSau?=
 =?us-ascii?Q?6oj1eGmWeFC/YHAotM5MLAz+qDMtER2NIvz6bx4D93O+kiigY5DNfn6RSafn?=
 =?us-ascii?Q?79glbXIC/9R5xgVDJx7C5LyoRA9ijNRUdgiBwj/obAkEPUbBMfaJWA7tM4Nn?=
 =?us-ascii?Q?MUkDLetDsXi90yrZjCZt+EHtUsfGyF+/dTsMDGWkUNPUq8QJ0oF9gkoe0kkw?=
 =?us-ascii?Q?78+P3G9q1LIG4REyGnUWsXPuYd08sOMw1KK2FJUpwoCcowa7MbTsrW67Zfbh?=
 =?us-ascii?Q?PqURnC7OeemOuoie9N9EaptGrlZBzAZ8gOonDO/k4WAeOY0Og/kWetYt1we0?=
 =?us-ascii?Q?RvZyOGUcr0KFKkbXAI4H/aLlGtA317q3u+IeoYNQz8Rt7eKlndLdIJZIzvo/?=
 =?us-ascii?Q?xB8uKZemqcd00IUz6sCWBoAgoFatSbctpDkoRDZB+i6G7xroNTOa+vVq1Hy4?=
 =?us-ascii?Q?JRsSuqqq+jSmo5Ig3RL4q6sgvq4pUyS+esXyujmmqhVt41cb9lEpXg/GFy+B?=
 =?us-ascii?Q?/GW5c9b7FwcZ3N+wq/7AKMQMd+TSB4K7d9l0G6E4DLo0IJ+sQcSXZJUfwPA/?=
 =?us-ascii?Q?Kf4mmvsQKlp94zbGuWGEiyqiq+JNuqKzNKetgPyQtVkO5dlfYJHv5NkePUBK?=
 =?us-ascii?Q?p6jDpQsgBdAuQYlj8+10iTSifRmERP8q8L33V3L/OkG+Ff2hb4tEfXVPv1GV?=
 =?us-ascii?Q?LW2gdaTtv1wY+4ovzXMJTtfRtpjsAYTpaxjg9uMQPCZwrBJO4S7qCScSTWiu?=
 =?us-ascii?Q?P2xDiTCEudzZM+5Dpdq2MjftdaX1/osDt/lGHVq7A4Zya5qnh9fNCiWkqIM?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b42be25-1c7a-45e6-f0b9-08dd4496d976
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 21:08:04.0691 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR02MB10125
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

From: Thomas Tai <thomas.tai@oracle.com> Sent: Thursday, January 30, 2025 1=
2:44 PM
>=20
> > -----Original Message-----
> > From: Michael Kelley <mhklinux@outlook.com>
> > Sent: Thursday, January 30, 2025 3:20 PM
> > To: Thomas Tai <thomas.tai@oracle.com>; mhkelley58@gmail.com;
> > haiyangz@microsoft.com; wei.liu@kernel.org; decui@microsoft.com;
> > drawat.floss@gmail.com; javierm@redhat.com; Helge Deller
> > <deller@gmx.de>; daniel@ffwll.ch; airlied@gmail.com;
> > tzimmermann@suse.de
> > Cc: dri-devel@lists.freedesktop.org; linux-fbdev@vger.kernel.org; linux=
-
> > kernel@vger.kernel.org; linux-hyperv@vger.kernel.org
> > Subject: RE: hyper_bf soft lockup on Azure Gen2 VM when taking kdump or
> > executing kexec
> >
> > From: Thomas Tai <thomas.tai@oracle.com> Sent: Thursday, January 30,
> > 2025 10:50 AM
> > >
> > > Sorry for the typo in the subject title. It should have been 'hyperv_=
fb soft lockup on
> > > Azure Gen2 VM when taking kdump or executing kexec'
> > >
> > > Thomas
> > >
> > > >
> > > > Hi Michael,
> > > >
> > > > We see an issue with the mainline kernel on the Azure Gen 2 VM when
> > > > trying to induce a kernel panic with sysrq commands. The VM would h=
ang
> > > > with soft lockup. A similar issue happens when executing kexec on t=
he VM.
> > > > This issue is seen only with Gen2 VMs(with UEFI boot). Gen1 VMs wit=
h bios
> > > > boot are fine.
> > > >
> > > > git bisect identifies the issue is cased by the commit 20ee2ae8c589=
9
> > > > ("fbdev/hyperv_fb: Fix logic error for Gen2 VMs in hvfb_getmem()" )=
.
> > > > However, reverting the commit would cause the frame buffer not to w=
ork
> > > > on the Gen2 VM.
> > > >
> > > > Do you have any hints on what caused this issue?
> > > >
> > > > To reproduce the issue with kdump:
> > > > - Install mainline kernel on an Azure Gen 2 VM and trigger a kdump
> > > > - echo 1 > /proc/sys/kernel/sysrq
> > > > - echo c > /proc/sysrq-trigger
> > > >
> > > > To reproduce the issue with executing kexec:
> > > > - Install mainline kernel on Azure Gen 2 VM and use kexec
> > > > - sudo kexec -l /boot/vmlinuz --initrd=3D/boot/initramfs.img --comm=
and-
> > > > line=3D"$( cat /proc/cmdline )"
> > > > - sudo kexec -e
> > > >
> > > > Thank you,
> > > > Thomas
> >
> > I will take a look, but it might be early next week before I can do so.
> >
>=20
> Thank you, Michael for your help!
>=20
> > It looks like your soft lockup log below is from the kdump kernel (or t=
he newly
> > kexec'ed kernel). Can you confirm? Also, this looks like a subset of th=
e full log.
>=20
> Yes, the soft lockup log below is from the kdump kernel.
>=20
> > Do you have the full serial console log that you could email to me?  Se=
eing
> > everything might be helpful. Of course, I'll try to repro the problem m=
yself
> > as well.
>=20
> I have attached the complete bootup and kdump kernel log.
>=20
> File: bootup_and_kdump.log
> Line 1 ... 984 (bootup log)
> Line 990       (kdump kernel booting up)
> Line 1351      (soft lockup)
>=20
> Thank you,
> Thomas
>=20

I have reproduced the problem in an Azure VM running Oracle Linux
9.4 with the 6.13.0 kernel. Interestingly, the problem does not occur
in a VM running on a locally installed Hyper-V with Ubuntu 20.04 and
the 6.13.0 kernel. There are several differences in the two
environments:  the version of Hyper-V, the VM configuration, the Linux
distro, and the .config file used to build the 6.13.0 kernel. I'll try to
figure out what make the difference, and then the root cause.

Michael
