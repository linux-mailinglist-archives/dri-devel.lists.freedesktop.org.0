Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62859A2C481
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 15:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E1810EB09;
	Fri,  7 Feb 2025 14:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=microsoft.com header.i=@microsoft.com header.b="O4tR3eMg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from HK3PR03CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11021079.outbound.protection.outlook.com [52.101.129.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD6710EB0E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 14:06:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMHhpFnWqYpiw2zLosAA4IxO2g9CUbP9Ca50AzyQXl0H3W0jB0nqreFZmgvAS+MUF69PQboDlVSi81wPebHE+g9jpjEpHMLWoi1rcHLfTmamM6NXTE4aJyZKoa9lHw6KOSX85Y5Y3aV+6OdFa2e+8MKcdhXk4V4R8AZ1m2kYJ4v01JeL4k8QPfTAdr14dO0n695jp/3afxxhi0pWP4XW6ypG4mPDZQltWToTZC6PY32fOeNsSoca4QYUCgtdX7KzjsjQo+Ia3JuoPfy3FP2RXeEgz6r0ULTZHgv01Erk/kkakCWwYCeZxkocmXKohlfd8tfxCKTFywG8d4a4XdfNZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6U7iBKmP8Saqqb0wHRa+a+6KgVOmuiQ6TNIM+MWZyqE=;
 b=S31TeJ1pNfSBt0Y+vbtWRSPXPTjoIFEcvCC5fBsY58shMEQnv1iexVf8mi5JbhB20Ymcuik16PRYVgoEnj3XclJ6i47au/D4lPKXho30N45l1r9RJPT6Tp7ZvFYBzTBxIPXoLLIrahcErKZh7tBWhCyM6zuWtPvEnnA3PelT91GtAUZDy1/XJ5pk8rumTGGp9VPg1pA7LsCaIGdqS4qa4igPoXyMydpVTwqkt3A+xjsupzy/wLX1gEVbQVgF/omZu19FZ84705b+1l+z8J7NK2nn6cLfgoccCdOsuZdwLiabIQUiXxQ9Nx2zgOZYxlWkpYEAY3NZsQWVyTxmnNmbnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6U7iBKmP8Saqqb0wHRa+a+6KgVOmuiQ6TNIM+MWZyqE=;
 b=O4tR3eMgYWBTIC5I+nqcCvc42RMAeGDlz41xUfIMUAjkwowvYAhsG5VAbkDQTwhEOW6Mj96E2P2JwvIwq703aLlbZbpy0hpsnZFdi0Rey3ANmnmx0ozNu//fV2O7m7pLo44JQ5UO6zaJqXiqkSbZ1kmmOuqvpoxpdnqNSETi7pM=
Received: from TYZP153MB0796.APCP153.PROD.OUTLOOK.COM (2603:1096:400:28d::11)
 by KUYP153MB1119.APCP153.PROD.OUTLOOK.COM (2603:1096:d10:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.5; Fri, 7 Feb
 2025 14:06:20 +0000
Received: from TYZP153MB0796.APCP153.PROD.OUTLOOK.COM
 ([fe80::a481:ba0d:8985:aa6f]) by TYZP153MB0796.APCP153.PROD.OUTLOOK.COM
 ([fe80::a481:ba0d:8985:aa6f%5]) with mapi id 15.20.8445.007; Fri, 7 Feb 2025
 14:06:20 +0000
From: Saurabh Singh Sengar <ssengar@microsoft.com>
To: Michael Kelley <mhklinux@outlook.com>, Thomas Tai <thomas.tai@oracle.com>, 
 "mhkelley58@gmail.com" <mhkelley58@gmail.com>, Haiyang Zhang
 <haiyangz@microsoft.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>, Dexuan
 Cui <decui@microsoft.com>, "drawat.floss@gmail.com" <drawat.floss@gmail.com>, 
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
Thread-Index: AdtzQ0vu6eNj8snBS+OSvfShEIJEjQABFnwAAALyBRAAANwVQADJ+eeAAJV+q6AAJLKdwA==
Date: Fri, 7 Feb 2025 14:06:19 +0000
Message-ID: <TYZP153MB079619B42859CAD4CAEB8771BEF12@TYZP153MB0796.APCP153.PROD.OUTLOOK.COM>
References: <BLAPR10MB521793485093FDB448F7B2E5FDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
 <BLAPR10MB521780F7C93DC013E2E031BDFDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
 <SN6PR02MB415732CABA59155898531226D4E92@SN6PR02MB4157.namprd02.prod.outlook.com>
 <BLAPR10MB521743AC3C146116D8F6BCACFDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
 <SN6PR02MB415777C53A930259A54E213ED4F52@SN6PR02MB4157.namprd02.prod.outlook.com>
 <SN6PR02MB41578AC54B7C0B7386B8ED00D4F62@SN6PR02MB4157.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB41578AC54B7C0B7386B8ED00D4F62@SN6PR02MB4157.namprd02.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=c2f405a4-4cb7-4a3f-88d0-a72b07b69b33;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2025-02-07T13:52:35Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZP153MB0796:EE_|KUYP153MB1119:EE_
x-ms-office365-filtering-correlation-id: 5e3c2e7a-2625-4e8e-3964-08dd47809899
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|10070799003|921020|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?h6wbc+J+xN7fv7xX6m6XJcaVyYVTgM12G53EzT9HEVmNdI03BWP12x1bpEZw?=
 =?us-ascii?Q?zNuEpROCA+KLdju2b5U4TiPP1VI8o6T7gRU0WlcD7D5y67cqYbyuvNxj7EH5?=
 =?us-ascii?Q?83BwzituL1oW8OBoGUATk0gPVFD4H7EWx9AmTt7tHVt1tQKEAPqnflsXWNxz?=
 =?us-ascii?Q?bRhjl59sS4OK0l1umxKZyT2oaWB9AVpGcDvVKTkhTeTq4CftxzSXq0VC9Aaq?=
 =?us-ascii?Q?K41967KnPWesrthsdd3y6j8QHP8zKUYhtDe0FFthW2qqrHD2pORjn+OfGMQp?=
 =?us-ascii?Q?xLKxKqsyZxVEbGYh7Zgx49oMGHX/qn4W+zb3a4tJLUEoPuGLwfDG0YYNekQm?=
 =?us-ascii?Q?Rg/uG041kOwsxg+axtyETA24+wvo34xnQPth5TMh8qr5tNNCCsmS2VRJaxJi?=
 =?us-ascii?Q?Ia/pJ7Hb9wwRmVEXGBAt7Osz68WO8aZwOEd0n+NWyNkn5PK+YGGOo5hrEnR6?=
 =?us-ascii?Q?TqjTkIiFUfjcEW/hTKjC5qg7kY/y2VVMx/mqA3nBAdB9mZG2sZmFr+/7bpbs?=
 =?us-ascii?Q?Tea5gl2Q2n78Y2I/vWoiOWO304I6rlMxTNc/Dyf1pcgnk5yHaAekyOqldUnM?=
 =?us-ascii?Q?B1STnAUKT5YdUIRHIU0qQMmqaXWq+I07BBLn2HheUVTXS97S5dnU9KmxYGjV?=
 =?us-ascii?Q?WVEeDGYC8yDnQcDXCkcMOeykyP0qNphQJ5hXDzImHpMo/gaJHFrwptjajC7P?=
 =?us-ascii?Q?b/qGMtCAEL1IeUSzpOXoIL4Mj6S6uA35eQuhsEwwtUCN4kwT6Olu0oLIyjH8?=
 =?us-ascii?Q?TB8DA5p08iBpLk5asI1N9J/zWPJSkua4wI2V2Ti57FASenZoIa1wjgOA3g73?=
 =?us-ascii?Q?C6x79nzhrsZ7IY/9wa+dSiD55n7ivOmRGuBhIRP5BweGlcYMaFy244n4WTxb?=
 =?us-ascii?Q?b5JDReUZzMWRq7HxULzfAoyPMdVABk5Z2siQRk6vZgEIyBX4rveeuwogqUy7?=
 =?us-ascii?Q?4lNcUCvdXr6TM1lBsMtaHfAPD1kr6eVyWFBbmgzrcCbkKFL+RPBpmWehxPaV?=
 =?us-ascii?Q?XvyNSzOcDW+2CCy67Sc+I8Zh+t5/bVRrr3/NqKRZTFyimHqCaPp8YaSemIlk?=
 =?us-ascii?Q?Zf9sWHKTogzaURXXlzHzv7P6SQJbcpL+pNxHJ/5xhGmUDK70I5qGqgvtu9ms?=
 =?us-ascii?Q?qluBMTQXbDqrTk0ij95Bw0HwCgtH5zVEWZiivyNTJbU0xLQTjhQrNVxdnysr?=
 =?us-ascii?Q?70K9BeIpy5KBFjC/TY4fl0NIdSNQHbimjVIJRGt50BAG+z/7158NKKvdCZos?=
 =?us-ascii?Q?K1y2OINzl1suoRzy6QRNls9uSjyNsZD9H6N5db5iRidYVTaSQ+SSbcL0a/13?=
 =?us-ascii?Q?N/R0xQOEz6VsnHq2AIiPcOdebjQmqLthEQW22wjxzUb+IeTgJcTJysK8E3h6?=
 =?us-ascii?Q?/4FFf7obpYTutbtXI1rlonROXiEBKfhr39E5iV6AjRoMTdVWWS/WAUjzqvMn?=
 =?us-ascii?Q?0TMLwP6BXBaSFoxyzWsWEQOx0WkYIfU6VqY28+QdQhtb0s+OnlTptg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZP153MB0796.APCP153.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(921020)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bT+9W4ly/JfVq2C7TGhBQOcoByK0qndJCT0jNtDgLP4mcJiiXXBStGrk6FfD?=
 =?us-ascii?Q?AeJ0MmUbg9GizIsgn9E9SqOzKgjNgWLUaPZTnh+CIWpIZ7v941CM3xKgnQ6K?=
 =?us-ascii?Q?lr3toqeNRF7Q7etZXJPJ+V/Ze5bI5zUlEU58kUDZ/AkcBtIGkFKBFrGi5iEd?=
 =?us-ascii?Q?V9MhDix3TEqYinLG7vokeszq8Pb1gkL7fweXiWtcefioPtPzlfuwkz3AAvCM?=
 =?us-ascii?Q?wHejoSXiRiP8rNd9zjNyRy8GFe1Sv83YzrtnvoKat88sWDYkf7oW8PTTpAEG?=
 =?us-ascii?Q?WNszHEx/39d2zgR8sTjJ0MMptxvbvoTdZe3nEMKTyUCZX/sdTmWGpY+Qo4SI?=
 =?us-ascii?Q?gK1Oapp/X/W+axe8gW6XOlQV13FABPoqsJSZCIQYcb96pdRhRXg2hkelaczI?=
 =?us-ascii?Q?bHlep0Gq4bdB9ajWUP/fwPKEglVSjq2E4m/0UmPW/UTmXp5z64MlSGWPQR9P?=
 =?us-ascii?Q?sGrbgJ6ep907eBA2Dc93O+SkZXmgHAuA2WCtl5vHhwRuKYCXzx34OhxXzMPS?=
 =?us-ascii?Q?QELu6QddQV3rePci5D+bc+JQ5pRtfbrQVYGSdO6ODjhxxQf/RQydNZhv8H+b?=
 =?us-ascii?Q?rlCh4+eboqSkmKSFfP5i9c++iYOqg6ySrGOLXFHXOR6Z1iqRW3PonQDNalaq?=
 =?us-ascii?Q?IIofKY8vHWjh0d+srNdBEZV1MdzhSzZ1iTg7WGFUQuAnZOWrmEmTB5mktaN9?=
 =?us-ascii?Q?ItRlgw+HW+Aro9hdMXdSmZdoG39anoMAicHM5/MtDEXaXYeK6xiTDCsxFefK?=
 =?us-ascii?Q?SP8+c5CT/jN1CFgnsXKjdDs3jIlhMjl9VPyGFigRkVK3ya9M5+zT88mhqDJO?=
 =?us-ascii?Q?M6DG2rGI/Lc4ZwkMl3Ax0iCE/tnAFvDvkB8t8gZK2OTeDdr4air1r9uK48Nb?=
 =?us-ascii?Q?LqTvL+v0qcAagVKeHIsxXxDU3kTqtM8JwXQXhXmHqNDAu1yqUbL/dkbULBOv?=
 =?us-ascii?Q?q+fwfcvSvPIhk1FyCS/gAgCbUPYN1opAGmGqXBi0Zj1YkLS5URH3cGWp1okr?=
 =?us-ascii?Q?xcUDwm7g/5BCGyVMsTo9EZ+bH+RtaBd0ACmhM4SAGnPhLnEUR2+2DoibPT8i?=
 =?us-ascii?Q?7LAvQtBdUbtQLjbviysn5unu5JLGKqzxON6zswnDCGNq1ba9tl4TIgAlsnJR?=
 =?us-ascii?Q?IZtKY74BfYiOMBUq/B5cT1FA/+aofIJvPhYxwVsI+jDKiLp2rnlHJ9J5i7nB?=
 =?us-ascii?Q?YmZTyKsXaQf+DFeQuc/SPuEzSmrtDVuld958AFhejmdFbLWio1FDHKcvCTfl?=
 =?us-ascii?Q?UWy+DkI131dv789BgkwEnWROxbI48XdslhURoT2jGJirnpvpa8+3EgoJIUJU?=
 =?us-ascii?Q?LcEMvmKvsbou7gi0wSxdIfEW1NVwV+tiYlx4g68N5fwxwjbRiks5EeIgGi5P?=
 =?us-ascii?Q?VGLte5ipNkQNAG3S9PMZfyKn2HovTVPCJvnsPIoRavsRace+9KYwZ34uhWfz?=
 =?us-ascii?Q?MZh0WEgPVwSCANbf+LH/BMcnSG/UZMnaifS/eVVfRcSZIzKlMQujtx8AJe9y?=
 =?us-ascii?Q?idSNJKKeM+lJ4wX2C1XW9/lKAat51c/FVhGvBZZcA65JXA3hefqio+jkK5jY?=
 =?us-ascii?Q?HgP0FjrgR5wKpUKGe/1T1xdUrn2HObqNGZOPzZaz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZP153MB0796.APCP153.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e3c2e7a-2625-4e8e-3964-08dd47809899
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 14:06:19.7816 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tAxgigQd5e8LPhBHNST4jDF5CdpMv0EN30lVt1nbAZhE5o3bBKM+oWEXMbsXKrcC6xGdd6rQZsoUxlKVEZvC9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYP153MB1119
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

Thanks Michael, for the analysis.=20

I have tried the kdump steps on Oracle 9.4, 6.13.0 kernel as well. Although=
 I couldn't see
the soft lockup issue I see some other VMBus failures. But I agree the boot=
up is extremely
slow, which should be due to same reason.

My system is having newer UEFI version, wondering if the latest UEFI versio=
n
(UEFI Release v4.1 08/23/2024) causing this difference in behaviour.

Relevant part of the logs:
---------------------------------------------------------
echo 1 > /proc/sys/kernel/sysrq
echo c > /proc/sysrq-trigger
[  982.948352] sysrq: Trigger a crash
[  982.949553] Kernel panic - not syncing: sysrq triggered crash
[  982.951515] CPU: 31 UID: 0 PID: 6938 Comm: bash Kdump: loaded Not tainte=
d 6.13.0 #1
[  982.954115] Hardware name: Microsoft Corporation Virtual Machine/Virtual=
 Machine, BIOS Hyper-V UEFI Release v4.1 08/23/2024
[  982.957641] Call Trace:
[  982.958508]  <TASK>
[  982.959251]  panic+0x37e/0x3b0
[  982.960373]  ? _printk+0x64/0x90
[  982.961452]  sysrq_handle_crash+0x1a/0x20
[  982.962840]  __handle_sysrq+0x9b/0x190
[  982.964145]  write_sysrq_trigger+0x5f/0x80
[  982.965578]  proc_reg_write+0x59/0xb0
[  982.966905]  vfs_write+0x111/0x470
[  982.968004]  ? __count_memcg_events+0xbf/0x150
[  982.969432]  ? count_memcg_events.constprop.0+0x26/0x50
[  982.971190]  ksys_write+0x6e/0xf0
[  982.972307]  do_syscall_64+0x62/0x180
[  982.973438]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  982.975102] RIP: 0033:0x7f3d570fdbd7
[  982.976421] Code: 0f 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f =
00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48=
> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
[  982.982893] RSP: 002b:00007fff6d613c48 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000001
[  982.985424] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007f3d570=
fdbd7
[  982.987613] RDX: 0000000000000002 RSI: 000056362a928470 RDI: 00000000000=
00001
[  982.989774] RBP: 000056362a928470 R08: 0000000000000000 R09: 00007f3d571=
b0d40
[  982.992109] R10: 00007f3d571b0c40 R11: 0000000000000246 R12: 00000000000=
00002
[  982.994321] R13: 00007f3d571fa780 R14: 0000000000000002 R15: 00007f3d571=
f59e0
[  982.996461]  </TASK>
[  982.998317] Kernel Offset: 0x10c00000 from 0xffffffff81000000 (relocatio=
n range: 0xffffffff80000000-0xffffffffbfffffff)
[    0.000000] Linux version 6.13.0 (lisatest@lisa--505-e0-n0) (gcc (GCC) 1=
1.5.0 20240719 (Red Hat 11.5.0-2.0.1), GNU ld version 2.35.2-54.0.1.el9) #1=
 SMP PREEMPT_DYNAMIC Thu Feb  6 10:05:27 UTC 2025
[    0.000000] Command line: elfcorehdr=3D0xd000000 BOOT_IMAGE=3D(hd0,gpt1)=
/vmlinuz-6.13.0 ro console=3Dtty0 console=3DttyS0,115200n8 rd.lvm.vg=3Droot=
vg irqpoll nr_cpus=3D1 reset_devices cgroup_disable=3Dmemory mce=3Doff numa=
=3Doff udev.children-max=3D2 panic=3D10 acpi_no_memhotplug transparent_huge=
page=3Dnever nokaslr hest_disable novmcoredd cma=3D0 hugetlb_cma=3D0 iommu=
=3Doff disable_cpu_apicid=3D0
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x0000000000000fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000001000-0x000000000009ffff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x00000000000c0000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000000d0e00b0-0x000000002cffffff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x000000003eead000-0x000000003eeb3fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000003ff41000-0x000000003ffc8fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000003ffc9000-0x000000003fffafff] ACPI =
data
[    0.000000] BIOS-e820: [mem 0x000000003fffb000-0x000000003fffefff] ACPI =
NVS
[    0.000000] random: crng init done

<snip>

[    0.928063] Console: switching to colour frame buffer device 128x48
[   13.391297] fb0: EFI VGA frame buffer device

<snip>

[  590.199511] hv_netvsc 7c1e527c-2980-7c1e-527c-29807c1e527c (unnamed net_=
device) (uninitialized): VF slot 1 added
[  595.120270] Console: switching to colour dummy device 80x25
[  605.203700] hyperv_fb: Time out on waiting vram location ack
[  605.206161] iounmap: bad address 0000000005f4dac5
[  605.207740] CPU: 0 UID: 0 PID: 30 Comm: kworker/u4:2 Not tainted 6.13.0 =
#1
[  605.209984] Hardware name: Microsoft Corporation Virtual Machine/Virtual=
 Machine, BIOS Hyper-V UEFI Release v4.1 08/23/2024
[  605.213869] Workqueue: async async_run_entry_fn
[  605.215601] Call Trace:
[  605.216382]  <TASK>
[  605.217123]  dump_stack_lvl+0x66/0x90
[  605.218184]  hvfb_putmem+0x32/0x110 [hyperv_fb]
[  605.219646]  hvfb_probe+0x27f/0x360 [hyperv_fb]
[  605.221120]  vmbus_probe+0x3d/0xa0 [hv_vmbus]
[  605.222623]  really_probe+0xd9/0x390
[  605.223779]  __driver_probe_device+0x78/0x160
[  605.225213]  driver_probe_device+0x1e/0xa0
[  605.226591]  __driver_attach_async_helper+0x5e/0xe0
[  605.228166]  async_run_entry_fn+0x34/0x130
[  605.229681]  process_one_work+0x187/0x3b0
[  605.231075]  worker_thread+0x24e/0x360
[  605.232376]  ? __pfx_worker_thread+0x10/0x10
[  605.233758]  kthread+0xd3/0x100
[  605.234805]  ? __pfx_kthread+0x10/0x10
[  605.236053]  ret_from_fork+0x34/0x50
[  605.237251]  ? __pfx_kthread+0x10/0x10
[  605.238519]  ret_from_fork_asm+0x1a/0x30
[  605.239833]  </TASK>
[  605.240855] hv_vmbus: probe failed for device 5620e0c7-8062-4dce-aeb7-52=
0c7ef76171 (-110)
[  605.243404] hyperv_fb 5620e0c7-8062-4dce-aeb7-520c7ef76171: probe with d=
river hyperv_fb failed with error -110
[  605.254672] hv_vmbus: registering driver hv_pci




- Saurabh

> -----Original Message-----
> From: Michael Kelley <mhklinux@outlook.com>
> Sent: 07 February 2025 02:30
> To: Michael Kelley <mhklinux@outlook.com>; Thomas Tai
> <thomas.tai@oracle.com>; mhkelley58@gmail.com; Haiyang Zhang
> <haiyangz@microsoft.com>; wei.liu@kernel.org; Dexuan Cui
> <decui@microsoft.com>; drawat.floss@gmail.com; javierm@redhat.com;
> Helge Deller <deller@gmx.de>; daniel@ffwll.ch; airlied@gmail.com;
> tzimmermann@suse.de
> Cc: dri-devel@lists.freedesktop.org; linux-fbdev@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-hyperv@vger.kernel.org
> Subject: [EXTERNAL] RE: hyper_bf soft lockup on Azure Gen2 VM when taking
> kdump or executing kexec
>=20
> From: Michael Kelley <mhklinux@outlook.com>
> >
> > From: Thomas Tai <thomas.tai@oracle.com> Sent: Thursday, January 30,
> > 2025 12:44 PM
> > >
> > > > -----Original Message-----
> > > > From: Michael Kelley <mhklinux@outlook.com> Sent: Thursday,
> > > > January 30, 2025 3:20 PM
> > > >
> > > > From: Thomas Tai <thomas.tai@oracle.com> Sent: Thursday, January
> > > > 30,
> > > > 2025 10:50 AM
> > > > >
> > > > > Sorry for the typo in the subject title. It should have been
> > > > > 'hyperv_fb soft lockup on Azure Gen2 VM when taking kdump or
> executing kexec'
> > > > >
> > > > > Thomas
> > > > >
> > > > > >
> > > > > > Hi Michael,
> > > > > >
> > > > > > We see an issue with the mainline kernel on the Azure Gen 2 VM
> > > > > > when trying to induce a kernel panic with sysrq commands. The
> > > > > > VM would hang with soft lockup. A similar issue happens when
> executing kexec on the VM.
> > > > > > This issue is seen only with Gen2 VMs(with UEFI boot). Gen1
> > > > > > VMs with bios boot are fine.
> > > > > >
> > > > > > git bisect identifies the issue is cased by the commit
> > > > > > 20ee2ae8c5899
> > > > > > ("fbdev/hyperv_fb: Fix logic error for Gen2 VMs in hvfb_getmem(=
)" ).
> > > > > > However, reverting the commit would cause the frame buffer not
> > > > > > to work on the Gen2 VM.
> > > > > >
> > > > > > Do you have any hints on what caused this issue?
> > > > > >
> > > > > > To reproduce the issue with kdump:
> > > > > > - Install mainline kernel on an Azure Gen 2 VM and trigger a
> > > > > > kdump
> > > > > > - echo 1 > /proc/sys/kernel/sysrq
> > > > > > - echo c > /proc/sysrq-trigger
> > > > > >
> > > > > > To reproduce the issue with executing kexec:
> > > > > > - Install mainline kernel on Azure Gen 2 VM and use kexec
> > > > > > - sudo kexec -l /boot/vmlinuz --initrd=3D/boot/initramfs.img
> > > > > > --command- line=3D"$( cat /proc/cmdline )"
> > > > > > - sudo kexec -e
> > > > > >
> > > > > > Thank you,
> > > > > > Thomas
> > > >
> > > > I will take a look, but it might be early next week before I can do=
 so.
> > > >
> > >
> > > Thank you, Michael for your help!
> > >
> > > > It looks like your soft lockup log below is from the kdump kernel
> > > > (or the newly kexec'ed kernel). Can you confirm? Also, this looks l=
ike a
> subset of the full log.
> > >
> > > Yes, the soft lockup log below is from the kdump kernel.
> > >
> > > > Do you have the full serial console log that you could email to
> > > > me?  Seeing everything might be helpful. Of course, I'll try to
> > > > repro the problem myself as well.
> > >
> > > I have attached the complete bootup and kdump kernel log.
> > >
> > > File: bootup_and_kdump.log
> > > Line 1 ... 984 (bootup log)
> > > Line 990       (kdump kernel booting up)
> > > Line 1351      (soft lockup)
> > >
> > > Thank you,
> > > Thomas
> > >
> >
> > I have reproduced the problem in an Azure VM running Oracle Linux
> > 9.4 with the 6.13.0 kernel. Interestingly, the problem does not occur
> > in a VM running on a locally installed Hyper-V with Ubuntu 20.04 and
> > the 6.13.0 kernel. There are several differences in the two
> > environments:  the version of Hyper-V, the VM configuration, the Linux
> > distro, and the .config file used to build the 6.13.0 kernel. I'll try
> > to figure out what make the difference, and then the root cause.
> >
>=20
> This has been a real bear to investigate. :-(  The key observation is tha=
t with
> older kernel versions, the efifb driver does *not* try to load when runni=
ng in
> the kdump kernel, and everything works.
> In newer kernels, the efifb driver *does* try to load, and it appears to =
hang.
> (Actually, it is causing the VM to run very slowly. More on that in a min=
ute.)
>=20
> I've bisected the kernel again, compensating for the fact that commit
> 20ee2ae8c5899 is needed to make the Hyper-V frame buffer work. With that
> compensation, the actual problematic commit is 2bebc3cd4870 (Revert
> "firmware/sysfb: Clear screen_info state after consuming it").
> Doing the revert causes screen_info.orig_video_isVGA to retain its value =
of
> 0x70 (VIDEO_TYPE_EFI), which the kdump kernel picks up, causing it to loa=
d
> the efifb driver.
>=20
> Then the question is why the efifb driver doesn't work in the kdump kerne=
l.
> Actually, it *does* work in many cases. I built the 6.13.0 kernel on the =
Oracle
> Linux 9.4 system, and transferred the kernel image binary and module
> binaries to an Ubuntu 20.04 VM in Azure. In that VM, the efifb driver is
> loaded as part of the kdump kernel, and it doesn't cause any problems. Bu=
t
> there's an interesting difference. In the Oracle Linux
> 9.4 VM, the efifb driver finds the framebuffer at 0x40000000, while on th=
e
> Ubuntu 20.04 VM, it finds the framebuffer at 0x40900000. This difference =
is
> due to differences in how the screen_info variable gets setup in the two =
VMs.
>=20
> When the normal kernel starts in a freshly booted VM, Hyper-V provides th=
e
> EFI framebuffer at 0x40000000, and it works. But after the Hyper-V FB dri=
ver
> or Hyper-V DRM driver has initialized, Linux has picked a different MMIO
> address range and told Hyper-V to use the new address range (which often
> starts at 0x40900000). A kexec does *not* reset Hyper-V's transition to t=
he
> new range, so when the efifb driver tries to use the framebuffer at
> 0x40000000, the accesses trap to Hyper-V and probably fail or timeout (I'=
m
> not sure of the details). After the guest does some number of these bad
> references, Hyper-V considers itself to be under attack from an ill-behav=
ing
> guest, and throttles the guest so that it doesn't run for a few seconds. =
The
> throttling repeats, and results in extremely slow running in the kdump ke=
rnel.
>=20
> Somehow in the Ubuntu 20.04 VM, the location of the frame buffer as store=
d
> in screen_info.lfb_base gets updated to be 0x40900000. I haven't fully
> debugged how that happens. But with that update, the efifb driver is usin=
g
> the updated framebuffer address and it works. On the Oracle Linux 9.4
> system, that update doesn't appear to happen, and the problem occurs.
>=20
> This in an interim update on the problem. I'm still investigating how
> screen_info.lfb_base is set in the kdump kernel, and why it is different =
in the
> Ubuntu 20.04 VM vs. in the Oracle Linux 9.4 VM. Once that is well
> understood, we can contemplate how to fix the problem. Undoing the revert
> that is commit 2bebc3cd4870 doesn't seem like the solution since the orig=
inal
> code there was reported to cause many other issues.
> The solution focus will likely be on how to ensure the kdump kernel gets =
the
> correct framebuffer address so the efifb driver works, since the framebuf=
fer
> address changing is a quirk of Hyper-V behavior.
>=20
> If anyone else has insight into what's going on here, please chime in.
> What I've learned so far is still somewhat tentative.
>=20
> Michael

