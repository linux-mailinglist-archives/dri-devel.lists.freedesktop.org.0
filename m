Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08555A7EFB2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 23:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1430810E57C;
	Mon,  7 Apr 2025 21:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3ZCzqvVH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2081.outbound.protection.outlook.com [40.107.96.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007F810E3E4;
 Mon,  7 Apr 2025 21:17:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZm0KUq+DH1dBH6c1vPHz0XQOkKehMATdTaDlV0MqbsYxHdwq4VTtptWwlsdGI8EHZUg7BNawEIBOtKpoOfz3MDMkBlR1Euvssb1OX1e1d3TcBNpHDPSftgV3WIS6b0D1TIbumILuosOwfE5Kzddv9Jlu2rQLSKKkvak4H7Piy9BTrVwdvz7jUry04FH6nU+wKsV814/Ak6FJDHFWhEDjXsZPS453ojbd7SfRhplFRxKBXi1YKcUL4w2Lt0V7bKe1KcF+IqOFZui/kQsDwZUIAuqQ+/FQfPiT63cjKayF/HRouUAff3McFc3qMKWYczaglyhWVtl5VUOoPQBxFwVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bt0kY3B9cBaLOg2P5DWFxYuKr5eNH9yDyKTrge+bUgI=;
 b=ezXhyk8cNcSD82MAIS6HHT3tSiIuFs83A3QUt7MRd0sEKdcH5kK/LZAPdEfa4+Rvr6Kvy5Miu0F9wVLr/uqZBke+eZQ8/NKQ3qiNgptv0U9WLLoYTs0SA0Od9sHFFXvrY8/Sd9Kt9yPdCT46LH5H00bQ4NKNuY8FTYEVDFR1CqSBzDErt2lOB7MeJvyUNJTAHK5wYukcjNz36xe/FPAhhyK7eB48Y4J7DheS/IPkWQuDM1t8cmFycQLB8nYCainibjZR2F0GuGblfG68Pxf9Q1/JtiC4CJdTF7MvOVPJ2T5+ilaYbfvIjp6Yf2Qi7g0noK90K8NbFZ+tFkzr3bbKrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bt0kY3B9cBaLOg2P5DWFxYuKr5eNH9yDyKTrge+bUgI=;
 b=3ZCzqvVH2wvd8Bf+pJ6itzmTAEADuNVN/pvHM/4Z4Rb/7hfFaRfhbPDAyC3Zaj01WQ0V0tmVsb15b1FQ6vgrxTUbaxXMhHPhEncmvQIrveOyTAid82bw2pY//qzsqk/F3WyGR4VTIfgqAGOZaDu8cWA4tmQCURiH0GHGgFWOUlo=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by SN7PR12MB6716.namprd12.prod.outlook.com (2603:10b6:806:270::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 21:17:15 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%6]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 21:17:15 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
CC: Arnd Bergmann <arnd@arndb.de>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, Dave Airlie <airlied@redhat.com>, Jocelyn Falempe
 <jfalempe@redhat.com>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, John Stultz
 <jstultz@google.com>, Sui Jingfeng <suijingfeng@loongson.cn>, Lyude Paul
 <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, Gerd Hoffmann
 <kraxel@redhat.com>, Zack Rusin <zack.rusin@broadcom.com>, Broadcom internal
 kernel review list <bcm-kernel-feedback-list@broadcom.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?iso-8859-1?Q?Thomas_Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Saurav Kashyap <skashyap@marvell.com>, Javed Hasan
 <jhasan@marvell.com>, "GR-QLogic-Storage-Upstream@marvell.com"
 <GR-QLogic-Storage-Upstream@marvell.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Nilesh Javali <njavali@marvell.com>, Manish
 Rangankar <mrangankar@marvell.com>, Alex Williamson
 <alex.williamson@redhat.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Javier Martinez Canillas <javierm@redhat.com>, Jani Nikula
 <jani.nikula@intel.com>, "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 =?iso-8859-1?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>, "Lazar, Lijo"
 <Lijo.Lazar@amd.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Dmitry
 Baryshkov <lumag@kernel.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux1394-devel@lists.sourceforge.net"
 <linux1394-devel@lists.sourceforge.net>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "virtualization@lists.linux.dev"
 <virtualization@lists.linux.dev>, "spice-devel@lists.freedesktop.org"
 <spice-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Subject: RE: [RFC] PCI: add CONFIG_MMU dependency
Thread-Topic: [RFC] PCI: add CONFIG_MMU dependency
Thread-Index: AQHbp6mM3qqF8PZF602CPtcSaq/ibbOYtUcQ
Date: Mon, 7 Apr 2025 21:17:14 +0000
Message-ID: <BL1PR12MB51448EAE34D063B661C0F358F7AA2@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20250407104025.3421624-1-arnd@kernel.org>
In-Reply-To: <20250407104025.3421624-1-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=459762ed-1276-486d-90ea-afa6f1c890d5;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-04-07T21:16:26Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10, 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|SN7PR12MB6716:EE_
x-ms-office365-filtering-correlation-id: 99af99be-3453-4c98-3efb-08dd761991e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?MUA1S1EcKfudEbiHpAoV4FL8x36v4yY5Jf2syoI8/N+ywDR1yDhIyOF1Oi?=
 =?iso-8859-1?Q?H777sXJ5+SQYLYKgPey89wvbDdeEsF5SPKB74tI0pLvZRhC2p9hPifCqsW?=
 =?iso-8859-1?Q?QOl785yhMlmJyO5uT653yPtqRRd+jH0uuljseif2G1ODUaYzTH1KJHbg68?=
 =?iso-8859-1?Q?ADdbF1MN2tte6VCJYB83qTjFLaMXu1ZjHth9dUAB7wqw1oSzmnZ/GdBmzi?=
 =?iso-8859-1?Q?++8xswZM5oIUxAYWoaAZicHrtJeWPP4jEh0TOzFca+2cOILVCR2XdpsGpN?=
 =?iso-8859-1?Q?EksaYILg3GOETrgidyMWyUwaHsG5+cXSb/iuQuygvDxKegfclyIYzqf9lc?=
 =?iso-8859-1?Q?sgG9SZVEVNcXEfK3LZhFF433GY3fbUtoYVsqiOIL7Vk9TNBaOtW1U8FfDo?=
 =?iso-8859-1?Q?LBMKkN+T3pQ/BxRNE1twZrdsfTyv0bTbPuY2eOB3n0KqMZgHGM3001OMgg?=
 =?iso-8859-1?Q?i/vIo46UPu172AVBI2sqVcjC30iiK+wPbQRuqyGncqEPboJ1VGYlVzW/gO?=
 =?iso-8859-1?Q?0HlJoTH8NfF1weZ6xKZYk0at2jTeVFOXGevQSadfB7EL9+uSE+tzvdJrIM?=
 =?iso-8859-1?Q?vwF5qo8K6r4r4RGCxC51UFmHBsWMkOdIul5ce4Eb3KflWHCLIQ1bhGeB0h?=
 =?iso-8859-1?Q?nWnjfeAjIon9/7T7mcJWVZA9TvGJehnkDfv9EdmaP5lpEptBmjgHZUkS14?=
 =?iso-8859-1?Q?d7JtBUbLmavArh41/uhtTQfiJF8bVXDCnkmHQZEHDxruvJYXkptmNq8FuK?=
 =?iso-8859-1?Q?0wkJRSSnPGK9jb7cMsxiqAEWe9FEYlJSGm0wEBFvGU74R1Jg3ISTtBefpc?=
 =?iso-8859-1?Q?WDQCc5NObnvUWQN7VpryJZFtpOZqWd+B/Pin+LotWgyRsWX0f0UcOAGYi6?=
 =?iso-8859-1?Q?vPaiF3BYChPxqg+0VUPpOt5jyPj5ekGKqJTkS4QcN3OB4UEfMqGvofYOK7?=
 =?iso-8859-1?Q?NMJwnbbWrw957zPdcajMrD6OcL//RgxkTVnRERafQjflN0wLTs1dh4OFp8?=
 =?iso-8859-1?Q?r619IdyjzJ1LOa3LvYwqZmsrjIm0ZLM7NpqrvW/87zyhf0+oyAcKSqi74e?=
 =?iso-8859-1?Q?MYtbWUhgcUGdqjUqE5ziYwT1RWikojYXiWgNBuDxrtHLFD7X2EhtTeyKGV?=
 =?iso-8859-1?Q?GQ6WArPYWi5x7vQbtMWftc2JIEwQycSf8zZdzK49kIuKph7erYhKmmo3EL?=
 =?iso-8859-1?Q?rA+CJnHUakD561PDZrYHgLXKNBjn+8JhZnhyVPNlztCtR2Bh7YCT3RzmnC?=
 =?iso-8859-1?Q?O6O9XPrPyouqGa7qh/vHcxUyomAsKcY1LmXu0UvLvAykVb6XOPPmzQGRVg?=
 =?iso-8859-1?Q?uiwgzrwmiSyjV5RUdnEB8aAtiQfE3ehFR1lSM4TIAAoUPtt7TWsj08NEEI?=
 =?iso-8859-1?Q?KSZzLSOtbLljQozo/BblHSn/bzhEizCeIY0qs91oIeKDJb0oHygRqgERcb?=
 =?iso-8859-1?Q?zHruO3ypdrgEN5wCcgPdwS6WjCby2XADWhyevC/Rs1ysDnuZgbQBakjasb?=
 =?iso-8859-1?Q?QWoKeIqhDr/ZSHUuJZBZoB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?zV+YYkWlCLIpbTYox196BrUAW1aJi9foVZPe+ZwXQHCvn38sssIXpi/zP8?=
 =?iso-8859-1?Q?QkAc9oHAKVKxzm0jmktakaozzlGJCZ6mHeoV/ijKFG9xCvmj974F37OETr?=
 =?iso-8859-1?Q?ScbFvttBXxZr08+KAjvV5aOZhM/ADw7CNwmi9SoGx9BUzwXBFUriASyDje?=
 =?iso-8859-1?Q?Wpi1Qlifz3j5h46kBwcReytmu3iEaf94ZRAeWipx/DSNR3Qt1pIhvKndax?=
 =?iso-8859-1?Q?oUTYDpLucnj9RyL6KA+PmtDtnV0NwrZptattapPMxOXe7tbBbcoR+Bqr+8?=
 =?iso-8859-1?Q?THRy40IVJPzmmJaKxCTE/fVTLiIx0hXLL7IJQTXzu/ggDP2k23/OAlIJeT?=
 =?iso-8859-1?Q?HTwMaQ9VtF9st7cBUUT0cf2oLHUy7hmIl/aTrthn4b95Go6zNaqKS0hS9l?=
 =?iso-8859-1?Q?PwLFAlLFOq4gj2tIF2ixTBQrpQNGzwXxraNoUirZrHMyFe29ecxTd9+zc6?=
 =?iso-8859-1?Q?1GhfzAQCcq8rRascC9iQJ0vFBrtbnmmtTjFPwMnmcq9KG5CfCXBDfOfTFJ?=
 =?iso-8859-1?Q?HPXfgeuUdR+AcgUls9RqyF9+uoKl7TMUNTwistIjdJstATRcrmEAwNm+PC?=
 =?iso-8859-1?Q?hXiA4q+RXsizI1w1Q+jpKN5hMUoouOevLnqS5T7FC2wyjrcpDYuDaE8Uli?=
 =?iso-8859-1?Q?rJi+zsrQkX48jU/DxU1cZS0e/qJzJ+2WREppauTX60hcAroFZ1P5boS4be?=
 =?iso-8859-1?Q?GK4N8YRxbOiX+5GBDl0mrESrnNLYpJbIesrFilJNUtv0FO2u3OCAr8fdyq?=
 =?iso-8859-1?Q?QJTyGL83qVsnKdKA+QQLau4IBTmRcspA1ws9iXveTTgBf5u2JBDwAzf2AT?=
 =?iso-8859-1?Q?rHK3tav72GOj6s36BCJvOT9Xr7w0IJ2rOXmdcpSvtzQJoYAWjjfk2FlV0i?=
 =?iso-8859-1?Q?5FPuofYgNobrnIbZJ72+9P333BZhV+B6Sbhoo0tezRUytEWpNXxLeUUEHp?=
 =?iso-8859-1?Q?zyZXAt2AB4/VERl9ZaFf5k8x6iGu9hqhSKb5qsl8IRR4iV0rVBeE4HBYU4?=
 =?iso-8859-1?Q?jBsEPC0fE3nqsvAMSJq87IeOHfB4AwnLMBFrbx0o8pkA8aJ3qE3yfbmIS6?=
 =?iso-8859-1?Q?/GywMzYrlpf2JxrYNlx1qFmK6NKs1PA8L1BhQOZrZEMGCWjs/413UI8mNm?=
 =?iso-8859-1?Q?C7GKvfhePAv3+0iKjXADRLP+tUP4kRlDYB4bW4jKMPPMRzmFdwlf9BENGA?=
 =?iso-8859-1?Q?ULgil4O8oa+gUias6ktVNwXo+FMqwcJzk6hDarwGhCjA6hxtaynkahYjDl?=
 =?iso-8859-1?Q?MfubPR1aEGOmFv98mWau10NgIggm5Kct9wZy8WYSDwvEPjxd5EpwiKCaBT?=
 =?iso-8859-1?Q?OHiVAjMl7UMexe2MxE1NKFNIXNomHepC9zCBFekLv/zNlQjtQrNU92CoU5?=
 =?iso-8859-1?Q?Cx9dLfGAUSeayqz5hTh+n5y90QjcfroEVd7ddDsRhw5f+IgsyIQu51KHxQ?=
 =?iso-8859-1?Q?vfmMAB8WEb3AA/K9sowGrsTTy6QF3HKWJOdG33kOHk8GVLnMbQxfABD5XJ?=
 =?iso-8859-1?Q?2ddtpLlAPXhr/Nz2U2tWIqUASsDBKMinARFcMYXc5svrHqlwDBGkezXbu+?=
 =?iso-8859-1?Q?6X272fVn9TUmcQe1WPatYrG8qeDoXH2oVeHzvb7kmklyvBLe4dbMZgitII?=
 =?iso-8859-1?Q?tusnPH3+0+zj4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99af99be-3453-4c98-3efb-08dd761991e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 21:17:15.0125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4jyfTHcGD4AB7gMfQWphHL9Me7aBApmlp6OwMNzuIWcto+ebeCgrL9GfTTq1+TbWyvZ9IUkPz2Qb+Q2SQc5Leg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6716
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

[Public]

> -----Original Message-----
> From: Arnd Bergmann <arnd@kernel.org>
> Sent: Monday, April 7, 2025 6:38 AM
> To: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Arnd Bergmann <arnd@arndb.de>; Jeff Hugo
> <jeff.hugo@oss.qualcomm.com>; Carl Vanderlip <quic_carlv@quicinc.com>; Od=
ed
> Gabbay <ogabbay@kernel.org>; Takashi Sakamoto <o-takashi@sakamocchi.jp>;
> Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; David
> Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Deucher, Ale=
xander
> <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Dave Airlie <airlied@redhat.com>; Jocelyn
> Falempe <jfalempe@redhat.com>; Patrik Jakobsson
> <patrik.r.jakobsson@gmail.com>; Xinliang Liu <xinliang.liu@linaro.org>; T=
ian Tao
> <tiantao6@hisilicon.com>; Xinwei Kong <kong.kongxinwei@hisilicon.com>; Su=
mit
> Semwal <sumit.semwal@linaro.org>; Yongqin Liu <yongqin.liu@linaro.org>; J=
ohn
> Stultz <jstultz@google.com>; Sui Jingfeng <suijingfeng@loongson.cn>; Lyud=
e Paul
> <lyude@redhat.com>; Danilo Krummrich <dakr@kernel.org>; Gerd Hoffmann
> <kraxel@redhat.com>; Zack Rusin <zack.rusin@broadcom.com>; Broadcom
> internal kernel review list <bcm-kernel-feedback-list@broadcom.com>; Luca=
s De
> Marchi <lucas.demarchi@intel.com>; Thomas Hellstr=F6m
> <thomas.hellstrom@linux.intel.com>; Rodrigo Vivi <rodrigo.vivi@intel.com>=
;
> Andrew Lunn <andrew+netdev@lunn.ch>; David S. Miller
> <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jakub Kicinski
> <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; Saurav Kashyap
> <skashyap@marvell.com>; Javed Hasan <jhasan@marvell.com>; GR-QLogic-
> Storage-Upstream@marvell.com; James E.J. Bottomley
> <James.Bottomley@HansenPartnership.com>; Martin K. Petersen
> <martin.petersen@oracle.com>; Nilesh Javali <njavali@marvell.com>; Manish
> Rangankar <mrangankar@marvell.com>; Alex Williamson
> <alex.williamson@redhat.com>; Geert Uytterhoeven <geert+renesas@glider.be=
>;
> Javier Martinez Canillas <javierm@redhat.com>; Jani Nikula
> <jani.nikula@intel.com>; Limonciello, Mario <Mario.Limonciello@amd.com>;
> Thomas Wei=DFschuh <linux@weissschuh.net>; Lazar, Lijo <Lijo.Lazar@amd.co=
m>;
> Niklas Schnelle <schnelle@linux.ibm.com>; Dmitry Baryshkov
> <lumag@kernel.org>; linux-arm-msm@vger.kernel.org; dri-
> devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; linux1394-
> devel@lists.sourceforge.net; amd-gfx@lists.freedesktop.org;
> nouveau@lists.freedesktop.org; virtualization@lists.linux.dev; spice-
> devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org;
> netdev@vger.kernel.org; linux-pci@vger.kernel.org; linux-scsi@vger.kernel=
.org;
> kvm@vger.kernel.org
> Subject: [RFC] PCI: add CONFIG_MMU dependency
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> It turns out that there are no platforms that have PCI but don't have an =
MMU, so
> adding a Kconfig dependency on CONFIG_PCI simplifies build testing kernel=
s for
> those platforms a lot, and avoids a lot of inadvertent build regressions.
>
> Add a dependency for CONFIG_PCI and remove all the ones for PCI specific
> device drivers that are currently marked not having it.
>
> Link: https://lore.kernel.org/lkml/a41f1b20-a76c-43d8-8c36-
> f12744327a54@app.fastmail.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

For radeon, amdgpu:
Acked-by: Alex Deucher <alexander.deucher@amd.com>



> ---
>  drivers/accel/qaic/Kconfig              | 1 -
>  drivers/firewire/Kconfig                | 2 +-
>  drivers/gpu/drm/Kconfig                 | 2 +-
>  drivers/gpu/drm/amd/amdgpu/Kconfig      | 3 +--
>  drivers/gpu/drm/ast/Kconfig             | 2 +-
>  drivers/gpu/drm/gma500/Kconfig          | 2 +-
>  drivers/gpu/drm/hisilicon/hibmc/Kconfig | 1 -
>  drivers/gpu/drm/loongson/Kconfig        | 2 +-
>  drivers/gpu/drm/mgag200/Kconfig         | 2 +-
>  drivers/gpu/drm/nouveau/Kconfig         | 3 +--
>  drivers/gpu/drm/qxl/Kconfig             | 2 +-
>  drivers/gpu/drm/radeon/Kconfig          | 2 +-
>  drivers/gpu/drm/tiny/Kconfig            | 2 +-
>  drivers/gpu/drm/vmwgfx/Kconfig          | 2 +-
>  drivers/gpu/drm/xe/Kconfig              | 2 +-
>  drivers/net/ethernet/broadcom/Kconfig   | 1 -
>  drivers/pci/Kconfig                     | 1 +
>  drivers/pci/pci.c                       | 4 ++--
>  drivers/scsi/bnx2fc/Kconfig             | 1 -
>  drivers/scsi/bnx2i/Kconfig              | 1 -
>  drivers/vfio/pci/Kconfig                | 2 +-
>  21 files changed, 17 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/accel/qaic/Kconfig b/drivers/accel/qaic/Kconfig inde=
x
> a9f866230058..5e405a19c157 100644
> --- a/drivers/accel/qaic/Kconfig
> +++ b/drivers/accel/qaic/Kconfig
> @@ -8,7 +8,6 @@ config DRM_ACCEL_QAIC
>       depends on DRM_ACCEL
>       depends on PCI && HAS_IOMEM
>       depends on MHI_BUS
> -     depends on MMU
>       select CRC32
>       help
>         Enables driver for Qualcomm's Cloud AI accelerator PCIe cards tha=
t are
> diff --git a/drivers/firewire/Kconfig b/drivers/firewire/Kconfig index
> 905c82e26ce7..a5f5e250223a 100644
> --- a/drivers/firewire/Kconfig
> +++ b/drivers/firewire/Kconfig
> @@ -83,7 +83,7 @@ config
> FIREWIRE_KUNIT_SELF_ID_SEQUENCE_HELPER_TEST
>
>  config FIREWIRE_OHCI
>       tristate "OHCI-1394 controllers"
> -     depends on PCI && FIREWIRE && MMU
> +     depends on PCI && FIREWIRE
>       help
>         Enable this driver if you have a FireWire controller based
>         on the OHCI specification.  For all practical purposes, this diff=
 --git
> a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig index
> 2cba2b6ebe1c..6e95d204597e 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -462,7 +462,7 @@ source "drivers/gpu/drm/imagination/Kconfig"
>
>  config DRM_HYPERV
>       tristate "DRM Support for Hyper-V synthetic video device"
> -     depends on DRM && PCI && MMU && HYPERV
> +     depends on DRM && PCI && HYPERV
>       select DRM_CLIENT_SELECTION
>       select DRM_KMS_HELPER
>       select DRM_GEM_SHMEM_HELPER
> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig
> b/drivers/gpu/drm/amd/amdgpu/Kconfig
> index 1a11cab741ac..058e3b3ad520 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
> @@ -2,7 +2,7 @@
>
>  config DRM_AMDGPU
>       tristate "AMD GPU"
> -     depends on DRM && PCI && MMU
> +     depends on DRM && PCI
>       depends on !UML
>       select FW_LOADER
>       select DRM_CLIENT
> @@ -68,7 +68,6 @@ config DRM_AMDGPU_CIK
>  config DRM_AMDGPU_USERPTR
>       bool "Always enable userptr write support"
>       depends on DRM_AMDGPU
> -     depends on MMU
>       select HMM_MIRROR
>       select MMU_NOTIFIER
>       help
> diff --git a/drivers/gpu/drm/ast/Kconfig b/drivers/gpu/drm/ast/Kconfig in=
dex
> da0663542e8a..242fbccdf844 100644
> --- a/drivers/gpu/drm/ast/Kconfig
> +++ b/drivers/gpu/drm/ast/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only  config DRM_AST
>       tristate "AST server chips"
> -     depends on DRM && PCI && MMU
> +     depends on DRM && PCI
>       select DRM_CLIENT_SELECTION
>       select DRM_GEM_SHMEM_HELPER
>       select DRM_KMS_HELPER
> diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kcon=
fig index
> aa2ea128aa2f..a2acaa699dd5 100644
> --- a/drivers/gpu/drm/gma500/Kconfig
> +++ b/drivers/gpu/drm/gma500/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only  config DRM_GMA500
>       tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
> -     depends on DRM && PCI && X86 && MMU && HAS_IOPORT
> +     depends on DRM && PCI && X86 && HAS_IOPORT
>       select DRM_CLIENT_SELECTION
>       select DRM_KMS_HELPER
>       select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION diff --git
> a/drivers/gpu/drm/hisilicon/hibmc/Kconfig b/drivers/gpu/drm/hisilicon/hib=
mc/Kconfig
> index 98d77d74999d..d1f3f5793f34 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/Kconfig
> +++ b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
> @@ -2,7 +2,6 @@
>  config DRM_HISI_HIBMC
>       tristate "DRM Support for Hisilicon Hibmc"
>       depends on DRM && PCI
> -     depends on MMU
>       select DRM_CLIENT_SELECTION
>       select DRM_DISPLAY_HELPER
>       select DRM_DISPLAY_DP_HELPER
> diff --git a/drivers/gpu/drm/loongson/Kconfig b/drivers/gpu/drm/loongson/=
Kconfig
> index 552edfec7afb..d739d51cf54c 100644
> --- a/drivers/gpu/drm/loongson/Kconfig
> +++ b/drivers/gpu/drm/loongson/Kconfig
> @@ -2,7 +2,7 @@
>
>  config DRM_LOONGSON
>       tristate "DRM support for Loongson Graphics"
> -     depends on DRM && PCI && MMU
> +     depends on DRM && PCI
>       depends on LOONGARCH || MIPS || COMPILE_TEST
>       select DRM_CLIENT_SELECTION
>       select DRM_KMS_HELPER
> diff --git a/drivers/gpu/drm/mgag200/Kconfig b/drivers/gpu/drm/mgag200/Kc=
onfig
> index 412dcbea0e2d..a962ae564a75 100644
> --- a/drivers/gpu/drm/mgag200/Kconfig
> +++ b/drivers/gpu/drm/mgag200/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only  config DRM_MGAG200
>       tristate "Matrox G200"
> -     depends on DRM && PCI && MMU
> +     depends on DRM && PCI
>       select DRM_CLIENT_SELECTION
>       select DRM_GEM_SHMEM_HELPER
>       select DRM_KMS_HELPER
> diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kc=
onfig
> index 7b3e979c51ec..d1587639ebb0 100644
> --- a/drivers/gpu/drm/nouveau/Kconfig
> +++ b/drivers/gpu/drm/nouveau/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only  config DRM_NOUVEAU
>       tristate "Nouveau (NVIDIA) cards"
> -     depends on DRM && PCI && MMU
> +     depends on DRM && PCI
>       select IOMMU_API
>       select FW_LOADER
>       select FW_CACHE if PM_SLEEP
> @@ -94,7 +94,6 @@ config DRM_NOUVEAU_SVM
>       bool "(EXPERIMENTAL) Enable SVM (Shared Virtual Memory) support"
>       depends on DEVICE_PRIVATE
>       depends on DRM_NOUVEAU
> -     depends on MMU
>       depends on STAGING
>       select HMM_MIRROR
>       select MMU_NOTIFIER
> diff --git a/drivers/gpu/drm/qxl/Kconfig b/drivers/gpu/drm/qxl/Kconfig in=
dex
> 69427eb8bed2..d8f24bcae34b 100644
> --- a/drivers/gpu/drm/qxl/Kconfig
> +++ b/drivers/gpu/drm/qxl/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only  config DRM_QXL
>       tristate "QXL virtual GPU"
> -     depends on DRM && PCI && MMU && HAS_IOPORT
> +     depends on DRM && PCI && HAS_IOPORT
>       select DRM_CLIENT_SELECTION
>       select DRM_KMS_HELPER
>       select DRM_TTM
> diff --git a/drivers/gpu/drm/radeon/Kconfig b/drivers/gpu/drm/radeon/Kcon=
fig index
> f51bace9555d..c479f0c0dd5c 100644
> --- a/drivers/gpu/drm/radeon/Kconfig
> +++ b/drivers/gpu/drm/radeon/Kconfig
> @@ -2,7 +2,7 @@
>
>  config DRM_RADEON
>       tristate "ATI Radeon"
> -     depends on DRM && PCI && MMU
> +     depends on DRM && PCI
>       depends on AGP || !AGP
>       select FW_LOADER
>       select DRM_CLIENT_SELECTION
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig =
index
> 54c84c9801c1..6ca12fe7f57a 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -37,7 +37,7 @@ config DRM_BOCHS
>
>  config DRM_CIRRUS_QEMU
>       tristate "Cirrus driver for QEMU emulated device"
> -     depends on DRM && PCI && MMU
> +     depends on DRM && PCI
>       select DRM_CLIENT_SELECTION
>       select DRM_KMS_HELPER
>       select DRM_GEM_SHMEM_HELPER
> diff --git a/drivers/gpu/drm/vmwgfx/Kconfig b/drivers/gpu/drm/vmwgfx/Kcon=
fig index
> 6c3c2922ae8b..aab646b91ca9 100644
> --- a/drivers/gpu/drm/vmwgfx/Kconfig
> +++ b/drivers/gpu/drm/vmwgfx/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  config DRM_VMWGFX
>       tristate "DRM driver for VMware Virtual GPU"
> -     depends on DRM && PCI && MMU
> +     depends on DRM && PCI
>       depends on (X86 && HYPERVISOR_GUEST) || ARM64
>       select DRM_CLIENT_SELECTION
>       select DRM_TTM
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig inde=
x
> 5c2f459a2925..2dec62737ff6 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only  config DRM_XE
>       tristate "Intel Xe Graphics"
> -     depends on DRM && PCI && MMU && (m || (y && KUNIT=3Dy))
> +     depends on DRM && PCI && (m || (y && KUNIT=3Dy))
>       select INTERVAL_TREE
>       # we need shmfs for the swappable backing store, and in particular
>       # the shmem_readpage() which depends upon tmpfs diff --git
> a/drivers/net/ethernet/broadcom/Kconfig b/drivers/net/ethernet/broadcom/K=
config
> index eeec8bf17cf4..aa43984a05cf 100644
> --- a/drivers/net/ethernet/broadcom/Kconfig
> +++ b/drivers/net/ethernet/broadcom/Kconfig
> @@ -96,7 +96,6 @@ config BNX2
>  config CNIC
>       tristate "QLogic CNIC support"
>       depends on PCI && (IPV6 || IPV6=3Dn)
> -     depends on MMU
>       select BNX2
>       select UIO
>       help
> diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig index
> da28295b4aac..9c0e4aaf4e8c 100644
> --- a/drivers/pci/Kconfig
> +++ b/drivers/pci/Kconfig
> @@ -21,6 +21,7 @@ config GENERIC_PCI_IOMAP  menuconfig PCI
>       bool "PCI support"
>       depends on HAVE_PCI
> +     depends on MMU
>       help
>         This option enables support for the PCI local bus, including
>         support for PCI-X and the foundations for PCI Express support.
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c index 4d7c9f64ea24..60=
a20a0ac41f
> 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -4257,7 +4257,7 @@ unsigned long __weak pci_address_to_pio(phys_addr_t
> address)  #ifndef pci_remap_iospace  int pci_remap_iospace(const struct r=
esource
> *res, phys_addr_t phys_addr)  { -#if defined(PCI_IOBASE) &&
> defined(CONFIG_MMU)
> +#if defined(PCI_IOBASE)
>       unsigned long vaddr =3D (unsigned long)PCI_IOBASE + res->start;
>
>       if (!(res->flags & IORESOURCE_IO))
> @@ -4290,7 +4290,7 @@ EXPORT_SYMBOL(pci_remap_iospace);
>   */
>  void pci_unmap_iospace(struct resource *res)  { -#if defined(PCI_IOBASE)=
 &&
> defined(CONFIG_MMU)
> +#if defined(PCI_IOBASE)
>       unsigned long vaddr =3D (unsigned long)PCI_IOBASE + res->start;
>
>       vunmap_range(vaddr, vaddr + resource_size(res)); diff --git
> a/drivers/scsi/bnx2fc/Kconfig b/drivers/scsi/bnx2fc/Kconfig index
> ecdc0f0f4f4e..3cf7e08df809 100644
> --- a/drivers/scsi/bnx2fc/Kconfig
> +++ b/drivers/scsi/bnx2fc/Kconfig
> @@ -5,7 +5,6 @@ config SCSI_BNX2X_FCOE
>       depends on (IPV6 || IPV6=3Dn)
>       depends on LIBFC
>       depends on LIBFCOE
> -     depends on MMU
>       select NETDEVICES
>       select ETHERNET
>       select NET_VENDOR_BROADCOM
> diff --git a/drivers/scsi/bnx2i/Kconfig b/drivers/scsi/bnx2i/Kconfig inde=
x
> 0cc06c2ce0b8..75ace2302fed 100644
> --- a/drivers/scsi/bnx2i/Kconfig
> +++ b/drivers/scsi/bnx2i/Kconfig
> @@ -4,7 +4,6 @@ config SCSI_BNX2_ISCSI
>       depends on NET
>       depends on PCI
>       depends on (IPV6 || IPV6=3Dn)
> -     depends on MMU
>       select SCSI_ISCSI_ATTRS
>       select NETDEVICES
>       select ETHERNET
> diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig index
> c3bcb6911c53..2b0172f54665 100644
> --- a/drivers/vfio/pci/Kconfig
> +++ b/drivers/vfio/pci/Kconfig
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only  menu "VFIO support for PCI devi=
ces"
> -     depends on PCI && MMU
> +     depends on PCI
>
>  config VFIO_PCI_CORE
>       tristate
> --
> 2.39.5

