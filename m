Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2E9CF6F0B
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 07:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F8210E254;
	Tue,  6 Jan 2026 06:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="trNhY+P0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010041.outbound.protection.outlook.com [52.101.46.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD3A10E254;
 Tue,  6 Jan 2026 06:57:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qAa0S8w8h8IwW64tTPQB9FgsBqwua87KIsnxb5qBNd7H8pJZPLcgdWYVN4YvEoDchcVUDSa0J/+N0ds9vf3wIQqz8uLNZF87SFnDrv//KkPQe4m6aBHvz0xzvK1Yi28GQ+2NwsQb9IoaheIhygoaxfrfZ2jBNfuzl6UE3NMWexK+etABlRhdt+pmema+7KJYpoTinesWH8JTZOfNF9Jiuwr0fcryJ1L4u4aT3LOl5YBUylBWbQnVaqpLWw59BuKBZJ8sempXPUNIbP8lUXQSeVWZGxjpRn7+kr1cua+LmgvIkolmGh504yAL/i1KlRvFQlP+cfKk/G74Q0VOvX71Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmtzBHroMV7QrhShhD8kjar7b+l7bDx7ueVO0J2TcN0=;
 b=wV8GqKywaEVl4Y3xUKrbYDXy1qI7EJ0Ch6Cqwu3lpeZyL+kQgoDP/U9vc6nUFOibZBUhIF0M+mMam3/n/y9pkHbj+Q2am46vJiDnpomRDP20hS2DSBK1PG/3oO5Ubh26HDGjTYOpr3hRz4WuhobmdPonS2aSpfNmnmo3MQr/Uw3ki/NugsEEjTMqXf/2ykcIfRf+ofxcP23n4cx2xndh00hWi+lsJIM+lkPMkA7ykT8U3nuAcHKtRpwBMnDVcrQi21PW4Mzng2l/jijOPLRCQxiQBA6WxDBWD5HHmdgwjtbwaaapOkEQ6jd/s3H/K3Ka4B/uC9asSsmLyAcx0hNMTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmtzBHroMV7QrhShhD8kjar7b+l7bDx7ueVO0J2TcN0=;
 b=trNhY+P0Vau4Z0KN7adfTKgYJbsareN5Xi8xKJZvAFHJEmw/S7WuRZ9QUbC47CsFgiOdAfZZKtXvjVV1qEJmYIZ8+i4mtUDboqzh7oSS1QZFTYF3o7IbVMbJUBrIgp+ZeKAHIIeLp3ezAI+Fjcb53alcM3acs8N6ndZdmSbGLCo=
Received: from SJ2PR12MB7798.namprd12.prod.outlook.com (2603:10b6:a03:4c0::21)
 by CY5PR12MB6180.namprd12.prod.outlook.com (2603:10b6:930:23::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Tue, 6 Jan
 2026 06:57:41 +0000
Received: from SJ2PR12MB7798.namprd12.prod.outlook.com
 ([fe80::95a5:4454:6ffb:ca65]) by SJ2PR12MB7798.namprd12.prod.outlook.com
 ([fe80::95a5:4454:6ffb:ca65%5]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 06:57:41 +0000
From: "Yao, Chengjun" <Chengjun.Yao@amd.com>
To: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
Subject: RE: [PATCH] drm/fb-helper: Fix vblank timeout during suspend/reset
Thread-Topic: [PATCH] drm/fb-helper: Fix vblank timeout during suspend/reset
Thread-Index: AQHcbZtqH0qIa9QnuUuuJxuGInCNcrUlhPDAgB8RnBA=
Date: Tue, 6 Jan 2026 06:57:41 +0000
Message-ID: <SJ2PR12MB7798881187B2D2298F09987A9287A@SJ2PR12MB7798.namprd12.prod.outlook.com>
References: <20251215081822.432005-1-Chengjun.Yao@amd.com>
 <SJ2PR12MB77985EE047EE14673B955D6292ABA@SJ2PR12MB7798.namprd12.prod.outlook.com>
In-Reply-To: <SJ2PR12MB77985EE047EE14673B955D6292ABA@SJ2PR12MB7798.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-12-17T08:35:19.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7798:EE_|CY5PR12MB6180:EE_
x-ms-office365-filtering-correlation-id: ec18c800-f6b6-4d44-ff17-08de4cf0e2dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?S8DPe6Co/k7cHPYzAXcx4SzVb8q1rrWGuPEm2VkJIC8A6yBOCtiQAC/HhAS2?=
 =?us-ascii?Q?mG2Z9VDdPy28WZJdEctcTBk1GAf2HPhnwxByygjVxdnIhgPvdKQvz+/BfWyk?=
 =?us-ascii?Q?DFIqs413mUdNf35msDDz4/qpjL75kMnzUr9vI/igdvmMkAOVWmwXTStFx6um?=
 =?us-ascii?Q?S06wY/+l05nWvMUIClkKmqSXm2k2RPdwWEJjPWLA/m8flsudIpNOxSuM8lsc?=
 =?us-ascii?Q?66DzYJwvUr0iNSoOSXZY3T7utN0UyNbyE2wpjYGUDmwzFkY2x9loDuLpsYfk?=
 =?us-ascii?Q?d61RCfhCPv7Z8xTlHlcIAqUsaN6XX6p7vI5nzxb5/qeig/gsnES5uJogVYGX?=
 =?us-ascii?Q?Splgr1mgyiLDySc8YPE6fv/T+OlUn52bqTPXwnIJrA6RxyctePvVIrPPslqc?=
 =?us-ascii?Q?EHWB8SiTgBuLWuP7SthIzTqdCPd7ngviES9JIQGztwVY7nATSnsQogt10o6x?=
 =?us-ascii?Q?U0klMGxtEZ4We7w4VkW1uEnggGeqlw6ZUwtaX15Qo11JxOLmd9dVT2DAHx8q?=
 =?us-ascii?Q?ktMwlZH8ow5jVWRfXSSmC0nAkJ+p83UEBTs4x6mCIWWxv2WcCjpuWZk2NVc4?=
 =?us-ascii?Q?xB8m6vg820uoP9HnUbMstfzqx0grRguDYBFsNvlk3+WKR0mQj0fBwVHFOpBX?=
 =?us-ascii?Q?UCFdAaxc8pkg5IZvH4ZpIh5eMaGTIz5sOorebDuis4XS2oEJliI2inRqWk+Z?=
 =?us-ascii?Q?S3Sb/0FWBswcnbOJB/RwZoaY2gCzG0Vof9y3fkECYzVFhM2u7k9xACKJq7I6?=
 =?us-ascii?Q?n93laCeMX+CE7oOhxtl2Be9bYy08sCp50bcplT5wSdovEIhmA1ez3ZKEyzN2?=
 =?us-ascii?Q?bSXqNG7sLhPlsAcm+0gepzR4ZxIqA8QkEH7qob092UaWoewmF1ktN+RyS4A9?=
 =?us-ascii?Q?swqJouaNvBsNa9WD6Ft+BZGFAyrCzbbYAV+0106A6JnY3C4RCIGVUx7OHtgL?=
 =?us-ascii?Q?SW1frHun/VBBOc9p24C3sQhpSWeCNqEyaaoMdLUQ7Qa2snnlD4ChIVgB0ZG7?=
 =?us-ascii?Q?bCXKFybciQXVxB4Y87V7NcMMgUo6+OyN4LhrC9duEFaF1z+o7stWW9rhio/m?=
 =?us-ascii?Q?0mw2KTntUeftwiiX/3sGElsKFXaVd2jFMcj7qdFqdnGK0n2wkSuzzrQYKcbQ?=
 =?us-ascii?Q?aBlUmLUDG9kVN2NvphOK45sil0OcDdtqnsiuZR8tYVskVo0h+5uV9uaeompm?=
 =?us-ascii?Q?5sNoxwUSNEch4T5alWkysoqLBZgttjeGgibIy8nM15blbKcDBhljosvm3+gT?=
 =?us-ascii?Q?tfQLuHH4UXDpYaKylSm7gAvuVpiTHK1iJtiQUEbX8uJ1h4Fudgx7FGU0BJDY?=
 =?us-ascii?Q?e9OidfOzj6B0Q+/SIGytBu3/VQ8kK6H7nmTQrhldJ+OzT+02clbxJMwIropd?=
 =?us-ascii?Q?QuHra9UA1mHcTjVIhvykC3gRkK5u4twK+fzGUFdAxyAufQaLUuCeY5OWh9RX?=
 =?us-ascii?Q?kE/wGOxjRpmBqMis/9rwMmXeMSaCR3hesLWlLbhcmAxBZ2yxNsTP5Av+kJey?=
 =?us-ascii?Q?i7DSZTm9j1bZPAW+tX8nNCkN9TMovaNbNlbP?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7798.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sAz4k1xYx57iIaCxo1fb0eaLcDyfN2uJzWLo0QliDSmv9KvuKJMR7T1uXlTD?=
 =?us-ascii?Q?erR7pOyFbYPZSPRUukAvAd5XVgQBm/Y3wJcyhuvgN0WqfdiCbBKS2jO5j6ti?=
 =?us-ascii?Q?rfavUJsGTVXCzL/J3cHLu4WRCxz+iMxXpsEkQ+CWoVb42BerXddprWWmbEb7?=
 =?us-ascii?Q?cVS8vvWIvuv70RcJSwO97ICkQaeHNvnUb8pyOr3ATvRmajh5FuX7eMCRix0p?=
 =?us-ascii?Q?H2z5wCTqmTtDeUDUljGzjad77L1srgkWIaThJdIER4efnjkbfPnhwxc5RQxz?=
 =?us-ascii?Q?T5UKqGCkJBSQemKG3am9EF0XoskLYS95sy7Bc8yq0/4EQz1+fjxIXgxRX+xi?=
 =?us-ascii?Q?h6egUaVcN9ZGY0mQ6sek6moCahnMRoDgqdWfUe0pSsv9jwehOSBEGhSaExem?=
 =?us-ascii?Q?HLn6lWauGoVmrEHbCvjc0t0ITERr2vz4XBCLFYmvS3m/yGWdQNd0E4IMC3+9?=
 =?us-ascii?Q?h/3Bi8/ygArLrbOaSryd3h2woP7CC4+t+ces1Myt+tzAdMYWFS8dJ6fatClr?=
 =?us-ascii?Q?djrvF8LN9yB79irtfTM6Yn3WMGbpAdNuT9ik8lHWYiz6tbN4WzOp9Yy7dGUE?=
 =?us-ascii?Q?0s6jhcZ4u64mwlMl8hctmU5fgkZf61DiZ1cYOfUP6I6ZhkWtwxyhg3hkYIdm?=
 =?us-ascii?Q?azTl5GurB3hY/jia8RUJ81FhmRzMd7E+rugNX/X49MKL6meWf7qQ/XbMz/EL?=
 =?us-ascii?Q?sqQWCX0u1q4+Nqmi9JtYRwUKlBBrwKrTe9jyq6Q4qnJqqo9EavVdVwopqrgn?=
 =?us-ascii?Q?ICPd73tTyhPOlNf89+Uv57MCFvtwT+l331bGUcppIfHbErGla6UxdHp19qtM?=
 =?us-ascii?Q?ZVeyg/2R0uu9VvoFKLAb6q3lx51y/AwpZ7cdW02nERI/50GksZv54vjBES4j?=
 =?us-ascii?Q?bIstCmhJRpkqrW2K6FcL6wJKDppgT8YmtlEtMSqisA3Q9LUG6twEnxKy/LIf?=
 =?us-ascii?Q?ToXhb+xlEHtnDmBSjitHnUo6JaeJgskwhNLQTf/iQv3GuoijXLAg7/ikhrfr?=
 =?us-ascii?Q?5yMEDdRbtldNDxb5VuL6R9Ni46u4tAp7qQB8p5d4G2Zo4WZSV1WRU3948bF8?=
 =?us-ascii?Q?XTRZxju3oleOiHt17oBdGZo0BWhKaVEREJYywxSiDf55sJc+vyi0OcDw2GMY?=
 =?us-ascii?Q?xT94pEgSxyDSOhjcQMhxI1+lPUjt2FXFhSjUYO6471F6kBwZSfEk81Oca3Ex?=
 =?us-ascii?Q?Z7DjyS/pVxnRWPqvL4iRY78MyVhwNz43KNmTeXCJbhu4H5dMTX68FLe4uE/7?=
 =?us-ascii?Q?eeZ3RbU40jWlHpSauQEBWDc2HdELfo3IZR0B8qE/W90wKzeXVt48fgdudyrD?=
 =?us-ascii?Q?xKP4YeZdgdju4mAe+E3MM8Z5ClSgHwE71AI75G4kDnjF0j1XZRdO5bBShFiv?=
 =?us-ascii?Q?ZCsveCFA2ljXS44IlUJMjIQONYY8MKCuFC7yp4Zakwc+Tg1Y6fPpR9FxmbeY?=
 =?us-ascii?Q?rE2XZjn/S3/DF8VgJmnezaAiOb66LiLLoc/qSnINLQaTCunMmjAJMx06bn2i?=
 =?us-ascii?Q?A3YuQVyNoLScbTLn1JT9U0ebt+oB7wfqe5CS31yB38GVd7V+TETiRE+qxx2O?=
 =?us-ascii?Q?2SP7HTo6cSFguOZmJn1tmySUEuhTrMrqsVTHY3EXd92hDRpZcONShpeUZCc/?=
 =?us-ascii?Q?ZBjpUpxbSV9wrNeLpWOCg51K7I7sU+ZxWZzJ5R2E9XdJM7QlRXtl6dzZkHac?=
 =?us-ascii?Q?GiafGnb/fp/vRC+2pkyIdwm1dGTL1OUDVTt3fSqnmfWNq38U?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7798.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec18c800-f6b6-4d44-ff17-08de4cf0e2dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 06:57:41.4690 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NQR/u/if5BJu9reg0poljEfcHM/zcn80dPy3X0CWn4ZJkequLostJq4HId/V4Rjloy8snNdiAQmxlQrqJ0mEkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6180
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

[AMD Official Use Only - AMD Internal Distribution Only]

Ping...

-----Original Message-----
From: Yao, Chengjun <Chengjun.Yao@amd.com>
Sent: Wednesday, December 17, 2025 4:36 PM
To: Yao, Chengjun <Chengjun.Yao@amd.com>; Pillai, Aurabindo <Aurabindo.Pill=
ai@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; tzimmermann@su=
se.de; amd-gfx@lists.freedesktop.org
Cc: Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; dri-devel@lists.freedeskt=
op.org
Subject: RE: [PATCH] drm/fb-helper: Fix vblank timeout during suspend/reset

[AMD Official Use Only - AMD Internal Distribution Only]

ping

-----Original Message-----
From: Chengjun Yao <Chengjun.Yao@amd.com>
Sent: Monday, December 15, 2025 4:18 PM
To: Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; Deucher, Alexander <Alexa=
nder.Deucher@amd.com>; tzimmermann@suse.de; amd-gfx@lists.freedesktop.org
Cc: Yao, Chengjun <Chengjun.Yao@amd.com>; Pillai, Aurabindo <Aurabindo.Pill=
ai@amd.com>
Subject: [PATCH] drm/fb-helper: Fix vblank timeout during suspend/reset

During GPU reset, VBlank interrupts are disabled which causes
drm_fb_helper_fb_dirty() to wait for VBlank timeout. This will create call =
traces like (seen on an RX7900 series dGPU):

[  101.313646] ------------[ cut here ]------------ [  101.313648] amdgpu 0=
000:03:00.0: [drm] vblank wait timed out on crtc 0 [  101.313657] WARNING: =
CPU: 0 PID: 461 at drivers/gpu/drm/drm_vblank.c:1320 drm_wait_one_vblank+0x=
176/0x220 [  101.313663] Modules linked in: amdgpu amdxcp drm_panel_backlig=
ht_quirks gpu_sched drm_buddy drm_ttm_helper ttm drm_exec drm_suballoc_help=
er drm_display_helper cec rc_core i2c_algo_bit nf_conntrack_netlink xt_nat =
xt_tcpudp veth xt_conntrack xt_MASQUERADE bridge stp llc xfrm_user xfrm_alg=
o xt_set ip_set nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_=
ipv4 xt_addrtype nft_compat x_tables nf_tables overlay qrtr sunrpc snd_hda_=
codec_alc882 snd_hda_codec_realtek_lib snd_hda_codec_generic snd_hda_codec_=
atihdmi snd_hda_codec_hdmi snd_hda_intel snd_hda_codec snd_hda_core snd_int=
el_dspcfg snd_intel_sdw_acpi snd_hwdep snd_pcm amd_atl intel_rapl_msr snd_s=
eq_midi intel_rapl_common asus_ec_sensors snd_seq_midi_event snd_rawmidi sn=
d_seq eeepc_wmi snd_seq_device edac_mce_amd asus_wmi polyval_clmulni ghash_=
clmulni_intel snd_timer platform_profile aesni_intel wmi_bmof sparse_keymap=
 joydev snd rapl input_leds i2c_piix4 soundcore ccp k10temp i2c_smbus gpio_=
amdpt mac_hid binfmt_misc sch_fq_codel msr parport_pc ppdev lp parport [  1=
01.313745]  efi_pstore nfnetlink dmi_sysfs autofs4 hid_generic usbhid hid r=
8169 realtek ahci libahci video wmi [  101.313760] CPU: 0 UID: 0 PID: 461 C=
omm: kworker/0:2 Not tainted 6.18.0-rc6-174403b3b920 #1 PREEMPT(voluntary) =
[  101.313763] Hardware name: ASUS System Product Name/TUF GAMING X670E-PLU=
S, BIOS 0821 11/15/2022 [  101.313765] Workqueue: events drm_fb_helper_dama=
ge_work [  101.313769] RIP: 0010:drm_wait_one_vblank+0x176/0x220
[  101.313772] Code: 7c 24 08 4c 8b 77 50 4d 85 f6 0f 84 a1 00 00 00 e8 2f =
11 03 00 44 89 e9 4c 89 f2 48 c7 c7 d0 ad 0d a8 48 89 c6 e8 2a e0 4a ff <0f=
> 0b e9 f2 fe ff ff 48 85 ff 74 04 4c 8b 67 08 4d 8b 6c 24 50 4d [  101.313=
774] RSP: 0018:ffffc99c00d47d68 EFLAGS: 00010246 [  101.313777] RAX: 000000=
0000000000 RBX: 000000000200038a RCX: 0000000000000000 [  101.313778] RDX: =
0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000 [  101.313779]=
 RBP: ffffc99c00d47dc0 R08: 0000000000000000 R09: 0000000000000000 [  101.3=
13781] R10: 0000000000000000 R11: 0000000000000000 R12: ffff8948c4280010 [ =
 101.313782] R13: 0000000000000000 R14: ffff894883263a50 R15: ffff89488c384=
830 [  101.313784] FS:  0000000000000000(0000) GS:ffff895424692000(0000) kn=
lGS:0000000000000000 [  101.313785] CS:  0010 DS: 0000 ES: 0000 CR0: 000000=
0080050033 [  101.313787] CR2: 00007773650ee200 CR3: 0000000588e40000 CR4: =
0000000000f50ef0 [  101.313788] PKRU: 55555554 [  101.313790] Call Trace:
[  101.313791]  <TASK>
[  101.313795]  ? __pfx_autoremove_wake_function+0x10/0x10
[  101.313800]  drm_crtc_wait_one_vblank+0x17/0x30
[  101.313802]  drm_client_modeset_wait_for_vblank+0x61/0x80
[  101.313805]  drm_fb_helper_damage_work+0x46/0x1a0
[  101.313808]  process_one_work+0x1a1/0x3f0 [  101.313812]  worker_thread+=
0x2ba/0x3d0 [  101.313816]  kthread+0x107/0x220 [  101.313818]  ? __pfx_wor=
ker_thread+0x10/0x10 [  101.313821]  ? __pfx_kthread+0x10/0x10 [  101.31382=
3]  ret_from_fork+0x202/0x230 [  101.313826]  ? __pfx_kthread+0x10/0x10 [  =
101.313828]  ret_from_fork_asm+0x1a/0x30 [  101.313834]  </TASK> [  101.313=
835] ---[ end trace 0000000000000000 ]---

Cancel pending damage work synchronously before console_lock() to ensure an=
y in-flight framebuffer damage operations complete before suspension.

Also check for FBINFO_STATE_RUNNING in drm_fb_helper_damage_work() to avoid=
 executing damage work if it is rescheduled while the device is suspended.

Fixes: d8c4bddcd8bc ("drm/fb-helper: Synchronize dirty worker with vblank")
Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Chengjun Yao <Chengjun.Yao@amd.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helpe=
r.c index c0343ec16a57..199cca1b5bdd 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -402,6 +402,9 @@ static void drm_fb_helper_damage_work(struct work_struc=
t *work)  {
        struct drm_fb_helper *helper =3D container_of(work, struct drm_fb_h=
elper, damage_work);

+       if (helper->info->state !=3D FBINFO_STATE_RUNNING)
+               return;
+
        drm_fb_helper_fb_dirty(helper);
 }

@@ -794,6 +797,13 @@ void drm_fb_helper_set_suspend_unlocked(struct drm_fb_=
helper *fb_helper,
                if (fb_helper->info->state !=3D FBINFO_STATE_RUNNING)
                        return;

+               /*
+                * Cancel pending damage work. During GPU reset, VBlank
+                * interrupts are disabled and drm_fb_helper_fb_dirty()
+                * would wait for VBlank timeout otherwise.
+                */
+               cancel_work_sync(&fb_helper->damage_work);
+
                console_lock();

        } else {
--
2.43.0


