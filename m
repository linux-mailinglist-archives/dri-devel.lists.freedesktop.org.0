Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3014BABDE47
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 17:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23F910E560;
	Tue, 20 May 2025 15:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TbFnTfZ8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77EF710E4F1;
 Tue, 20 May 2025 15:06:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yWYzgEtzodbFPh2kUrs5tbpPk46j6OrQQaKf2mzL7VSsFzHkVQvXomvSyDb2hdmWg+H7s/WJThMZHpJXp6/66C9489bAZOOSdyGm/hsZg0fpoklPLJdLoksHIEp2Wf4Xb1+Zw8C2snPmd3whBHFIijbIU+EC2J8Mi3mjO6E2il/nIfjRSUSqlTnj4EgzlGEKg1iaf8EFMSASM8O2Gm8uaiuEGSmhxHxgx8rpc8dQKlSK5WWrQyxwhHPTP9pRkQt8CKvA2LvAXJZL/cuktAtfeWwSSdV+iO2yEXSGMyvMvpKCdNt3ALjynGEVFSTCXpsHzBeV2mfrc2tbt3dRhNKNMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ywl8h1f1QymJ7OiRf2fmXMapfWaAVIEF8ev7V+CIqAU=;
 b=ne+ext8obmDJwEtaiDlcZmDTCaagPn8LjxyC2ykD5QS21MGkBuyk58TkxXh7KXPAbD+0PQTu4GjQBLL2MSSna49RHhn3HRtUPDSTYB4YOXhZYpEptI9Q8mSyvRGwWQMzXgTUcdOghLcUnbJ22muaQpvRgFCMnKrcBDEYMw41oYSSolZj7slj+EqjeoIN7j/JGmtqm8zku1HIDsaFGmomOONDwDhasiWaVl2WZ5S9OQqD/0Ci8X3ydiTZT+wNB53dGbqUOKf48AWdu5a9oUEq959cwpiN+I7QmElUuGVIBHcT4fmmxDPzBOQfkOb52Z24SjcQurBPrU2PsnNt/vKpzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ywl8h1f1QymJ7OiRf2fmXMapfWaAVIEF8ev7V+CIqAU=;
 b=TbFnTfZ8tj8kVLhthVPY7JGVKvn52W92PRtwK2s/eH5ZdROAC2ivKMVFSLII/VuRRuW4gkXK2Rzy3Nwiq2LuZF/a3CFt0HySs4TQqyesmZV2qsRs1SnGMr9Qy7/rokMvzStkmUs12bSIDFYLBS6H/Rq7aMOy8mJmkMVGKQyBFAs=
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by MN0PR12MB5715.namprd12.prod.outlook.com (2603:10b6:208:372::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 15:06:49 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51%3]) with mapi id 15.20.8769.019; Tue, 20 May 2025
 15:06:48 +0000
From: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, "Chung, ChiaHsuan (Tom)"
 <ChiaHsuan.Chung@amd.com>, "Wu, Ray" <Ray.Wu@amd.com>, "Wheeler, Daniel"
 <Daniel.Wheeler@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Linux List Kernel Mailing
 <linux-kernel@vger.kernel.org>, Linux regressions mailing list
 <regressions@lists.linux.dev>
Subject: Re: 6.15-rc6/regression/bisected - after commit f1c6be3999d2 error
 appeared: *ERROR* dc_dmub_srv_log_diagnostic_data: DMCUB error
Thread-Topic: 6.15-rc6/regression/bisected - after commit f1c6be3999d2 error
 appeared: *ERROR* dc_dmub_srv_log_diagnostic_data: DMCUB error
Thread-Index: AQHbyWsAkgfutsQ0E0KUJ0vtS3bUP7PbnpGW
Date: Tue, 20 May 2025 15:06:48 +0000
Message-ID: <CH0PR12MB52845B90BB3D7B94473B6FDA8B9FA@CH0PR12MB5284.namprd12.prod.outlook.com>
References: <CABXGCsPLAs+rCktbM_ao3bP3VZuaLqXSMpXZt1m-B9nqf91EQw@mail.gmail.com>
In-Reply-To: <CABXGCsPLAs+rCktbM_ao3bP3VZuaLqXSMpXZt1m-B9nqf91EQw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-20T15:06:47.652Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR12MB5284:EE_|MN0PR12MB5715:EE_
x-ms-office365-filtering-correlation-id: ccba6ab6-aca4-414e-10bc-08dd97aff176
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|921020|38070700018|8096899003|7053199007|13003099007;
x-microsoft-antispam-message-info: =?us-ascii?Q?RL2q2squswiaIGiM4T+UbjjM0Htw+NysoFEWUVLEiLH9vP49oXQ1GG7xvAR7?=
 =?us-ascii?Q?i96XUsYf6qE85rXOi7coTI8ODhUZ7pCNa1l3RLZePk9KUoytSi0HmUywS1bD?=
 =?us-ascii?Q?NCkPrCpbMk44gwOpeoCjY0C1Hp8nszWA8uY7A5Ivitngo9dXzZCD/1bBnKt0?=
 =?us-ascii?Q?3UgKOUktDyg+B4FMUD8tn47bzkkxo/I2aBujVO6F83zX75MRJvbEYhfsKjWm?=
 =?us-ascii?Q?45u5DGyyehRFIVUO2xHyP1rNrLYI1AejExbqg/C7v2GuSfw3Oe53RnmY/DWu?=
 =?us-ascii?Q?YbfEMJOMW51Ds36NNtU45qOgKdv7SDfVaf04568s3XVonHT0Au/Rene2g0tB?=
 =?us-ascii?Q?Ln3/KfC5FW6bGH7ObqjJ8cMtOvL8R1SPyjmvcBCtJriG5TxbpnGMncA5AA2Q?=
 =?us-ascii?Q?3S+3iqRY5X+wSpf5SRLt5/aDd45et+RrU8DSFrzsRC62Ei2U05i1g5T6Bm8w?=
 =?us-ascii?Q?MdM38YZTT65DQUFOpxB9RJ8PnX99qjij7lrHWFMJVVuikPVHJsLvsApmyIb4?=
 =?us-ascii?Q?Eyx9NbD8Vaa9WAXtD4jX8zmLC7XjGrdm4Doc1xgaXmrxfQVDygZGLAKVT8mA?=
 =?us-ascii?Q?pkWtp4BNf2F0MvW6rv+ZtM5ci4NUbHaEGS2mHxY22+zTqxb2Fa+yoM9HUCkV?=
 =?us-ascii?Q?85fW/FV1nOHVTRqkpxh9VP5OjUt3q1teJXvrPSEZQdb84us/KwR+B8VP2IJP?=
 =?us-ascii?Q?O27BJKOxtgJTIJ4w4IixfiYe2bHFeMw3mSARtu6pfvqcqQ5FfZhCloS7kDlI?=
 =?us-ascii?Q?bMvrdMnJtHGJMLVgHGsStaRT21g368gtslandvjVooZLL6Qj7Xm90vj2kP3Y?=
 =?us-ascii?Q?esbUz1DPIrpcWcqxDrwVktZzKiBTvg10TQpYhUcrQ1jpW3JvAzdhY69QLyNx?=
 =?us-ascii?Q?4lyQGA9/ukQLLeOQ6gYm08J7jUkTy/QPFW5nSUqzeorg0lTNxjcLh2Y4UZrF?=
 =?us-ascii?Q?0ZDnFynKg0XknDKjLNr1Z6dwCDm6y4sbzHG3HHfgodKRS4i/1MxtneCYqqrh?=
 =?us-ascii?Q?HWFncqZ7t7xhMGcRQgYjCAvVgp1rfzgfJVkPpWLeha2SdEz3sADeNxr7IEsh?=
 =?us-ascii?Q?EeXszjU37nXV7jF4sRvxQLbQebs6hiEgpbYa5w5vIaeqj3p64qE3uLENvTxY?=
 =?us-ascii?Q?GHYC8FxrICr/oGn7NeoBweLco1NV8pHQLOnVLPhFP2+3KBn1WPpbr6NIK/C5?=
 =?us-ascii?Q?YfnHti/B4ycBJYzUB+JO3a6rTgqSClTsgS0efdKpE4CgGxP9HhH5E/0JNqhl?=
 =?us-ascii?Q?3mTXVgIRVqhZGWxdAwaQXRiNjwJK13KJxy5Hb/BdbmUzTEx3M6X32GQH8cG7?=
 =?us-ascii?Q?qoSJOjz/uKfy0nM8V2n+5413+UfpOMnVPwQWHy54UcBigKuM7h074/D205bo?=
 =?us-ascii?Q?TAqoFjsTnkrtBiW3uIRz86k2iXsr6LyYGPjWnYB7PoeM3G+B8xbDNOaqRegG?=
 =?us-ascii?Q?lNC4TxY3IvU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(921020)(38070700018)(8096899003)(7053199007)(13003099007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qIXEdNbhsgjwpFYHCm4h6O1/ZaiR+aNM1q1OSRcyW2xz5AE7zz1fVNYvVgWl?=
 =?us-ascii?Q?jdRuHvRJ8H251Si19mVtwTVnvKFjnwH0AvmksS7MvLgVDruMQNpT5Tx2nb/Q?=
 =?us-ascii?Q?PxCuvLn0uW6+GJa5v35RWFP7xYWOjWRVENzDICqXp1ImJPGvZXJIU/eEAv1k?=
 =?us-ascii?Q?4gPNmS+oWN2PM9wfOsf/M+OhhwsxILykAOTqtNrcPf/Gg7D7RgsRahlt6iOd?=
 =?us-ascii?Q?qKksJ+ecDEp1S2LLUjzGokL4bHUdADpzO3uSiLcwuKFcS+OsqETF0f6IrUQw?=
 =?us-ascii?Q?/NxMvKPcXbIkMrM22qaImaofnp0O5MDSU3SnCAGRcA7pMaT9JwJWlRlxqYy3?=
 =?us-ascii?Q?aNmWYF5ko3tHpBox9ii4uPHHbVQDXC/GY3toXQO7xSvLPYJ9ZfbngGjmgqIo?=
 =?us-ascii?Q?e6mlhwmWi0Xl4CRSTCx6tJMDpAVssAmf4/nmASRdB7Rqh5CSiibk/vcJrKMT?=
 =?us-ascii?Q?yblTZsIUowBeSKsT4ZKlRJLYyeVLarUBZWRo0OKk/vAQHNBdxtFPyMT33k49?=
 =?us-ascii?Q?HoHiGInZnKH7btXBfTCYqIepX/JFDq7prrpABNcvN4OwethSr3stcsm5Bkfh?=
 =?us-ascii?Q?1EEmVd7dLd+GGmm4uH2rmzvF3JYYJxQdShzPTF+0TxZfftBZRC/IBFHNJF2v?=
 =?us-ascii?Q?UIviRPpv9FGkXO5Gt8NFEY4Lap9VtNB4pt5zKeO2t/TgSKD6TZZZtrHat1jG?=
 =?us-ascii?Q?y+bQpGt5mav15hwUrMU2hV8atfizt8E55uH6T5W1GPp3bVARXwo7Dr6Y50NP?=
 =?us-ascii?Q?QLVtug7gMdLT9MLlNCTGA3pIR6SnzBmm0pU0TB67mrsuLQa/lpjTUEOdhRzq?=
 =?us-ascii?Q?cWJLxU9clByt7I+5/gEfgRyceRMhMBjYmSs8wEaE+XRP4K4vZR82v/3QGTv/?=
 =?us-ascii?Q?dqXEGgjFff2ldsk35f3s8KAE+C+lwSMVQrOeJ6McN0ltfEVcu7jO8Jnc+7p2?=
 =?us-ascii?Q?drpvgDwBDNaNF+a5o5+/VFdiFc4coeKeKFk4XjkMoFDQKUdoQxkFhsmuBX6n?=
 =?us-ascii?Q?Ps3dh+8cwB7mnqdPV3O5eCFMKI0BDhBlnnkF6cjQAqXJrUcBIwocn3+Q57Ik?=
 =?us-ascii?Q?ZuspwUf3GqyhZCftKSfUkZt+GCkXfG4padHRlljRoc8NT8zjSKa2i47b005D?=
 =?us-ascii?Q?q7lxjYy6tXSa7Okw0xaqc3JwVVv0tE9MN1r6B2Ud1quRulaLJmLSY6TPhN8w?=
 =?us-ascii?Q?22VbK17VqRhObNtvaILHbqFD2dxR5UJarzXdGmtoG8dYGX1ORtpyMncF59YQ?=
 =?us-ascii?Q?Og6n6VkAb5Q8uoCdkA/I170k+IA0x3JkOmlT7GGWCYsfIuMmS7cLXjJ2dtS2?=
 =?us-ascii?Q?3IRAZTYsBMUmFF0wuEpDqQ3hcRX2fS0A99JyBLLdUEXo0AHW3yELnIpY58iL?=
 =?us-ascii?Q?VQp+mvQQb5H1Ok72iTN2wU0FnWrzTwnsp9YzqEMKwRClbYk3WBPbNFbGVM1B?=
 =?us-ascii?Q?oMsRhwH2ulDCXTxzxgNsjlG6IW7mCI+tjBk4TVGDilersginnqIFQBD1TSNl?=
 =?us-ascii?Q?liwau9SahzmzWvUEM13XSDlr4uwMGE+aDqsMW/xq0a5OSEWbWdSuGwYebwH9?=
 =?us-ascii?Q?YnK4/0a3SNPQbB4IXag=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR12MB52845B90BB3D7B94473B6FDA8B9FACH0PR12MB5284namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccba6ab6-aca4-414e-10bc-08dd97aff176
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 15:06:48.2131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tZSAffO/x1wep6UsIX2giepE0feyJ5smV6hv5wvfTJUlfQu2mGj6BvYa/WZSbAJ0liWiKHhTu+ryOfy1aFW03w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5715
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

--_000_CH0PR12MB52845B90BB3D7B94473B6FDA8B9FACH0PR12MB5284namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Mike,

Could you more details about your setup, and how you were able to repro it =
?

--

Regards,
Jay
________________________________
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Sent: Tuesday, May 20, 2025 5:33 AM
To: Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; Chung, ChiaHsuan (Tom) <C=
hiaHsuan.Chung@amd.com>; Wu, Ray <Ray.Wu@amd.com>; Wheeler, Daniel <Daniel.=
Wheeler@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; amd-gfx l=
ist <amd-gfx@lists.freedesktop.org>; dri-devel <dri-devel@lists.freedesktop=
.org>; Linux List Kernel Mailing <linux-kernel@vger.kernel.org>; Linux regr=
essions mailing list <regressions@lists.linux.dev>
Subject: 6.15-rc6/regression/bisected - after commit f1c6be3999d2 error app=
eared: *ERROR* dc_dmub_srv_log_diagnostic_data: DMCUB error

Hi,
After commit f1c6be3999d2 error appears:
[ 1421.701677] amdgpu 0000:03:00.0: [drm] *ERROR*
dc_dmub_srv_log_diagnostic_data: DMCUB error - collecting diagnostic
data
[ 1421.896810] amdgpu 0000:03:00.0: [drm] *ERROR*
dc_dmub_srv_log_diagnostic_data: DMCUB error - collecting diagnostic
data
[ 1422.088397] amdgpu 0000:03:00.0: [drm] *ERROR*
dc_dmub_srv_log_diagnostic_data: DMCUB error - collecting diagnostic
data
[ 1426.448674] amdgpu 0000:03:00.0: amdgpu: SMU: I'm not done with
your previous command: SMN_C2PMSG_66:0x00000012
SMN_C2PMSG_82:0x00000005
[ 1426.448804] amdgpu 0000:03:00.0: amdgpu: Failed to export SMU metrics ta=
ble!
[ 1430.149443] amdgpu 0000:03:00.0: amdgpu: SMU: I'm not done with
your previous command: SMN_C2PMSG_66:0x00000012
SMN_C2PMSG_82:0x00000005
[ 1430.149456] amdgpu 0000:03:00.0: amdgpu: Failed to export SMU metrics ta=
ble!
[ 1433.846389] amdgpu 0000:03:00.0: amdgpu: SMU: I'm not done with
your previous command: SMN_C2PMSG_66:0x00000012
SMN_C2PMSG_82:0x00000005
[ 1433.846400] amdgpu 0000:03:00.0: amdgpu: Failed to export SMU metrics ta=
ble!
[ 1437.543718] amdgpu 0000:03:00.0: amdgpu: SMU: I'm not done with
your previous command: SMN_C2PMSG_66:0x00000012
SMN_C2PMSG_82:0x00000005
[ 1437.543727] amdgpu 0000:03:00.0: amdgpu: Failed to export SMU metrics ta=
ble!
[ 1439.966738] watchdog: CPU28: Watchdog detected hard LOCKUP on cpu 28
[ 1439.966742] Modules linked in: uinput rfcomm snd_seq_dummy
snd_hrtimer nft_queue nfnetlink_queue nf_conntrack_netbios_ns
nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib
nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct
nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set
nf_tables qrtr bnep sunrpc binfmt_misc amd_atl intel_rapl_msr
intel_rapl_common mt7921e mt7921_common mt792x_lib mt76_connac_lib
edac_mce_amd mt76 btusb btrtl btintel snd_hda_codec_realtek btbcm
btmtk snd_hda_codec_generic snd_hda_scodec_component kvm_amd
snd_hda_codec_hdmi mac80211 bluetooth vfat snd_hda_intel fat
snd_intel_dspcfg kvm snd_intel_sdw_acpi snd_hda_codec snd_hda_core
spd5118 snd_hwdep libarc4 snd_seq irqbypass snd_seq_device wmi_bmof
cfg80211 r8169 rapl joydev snd_pcm snd_timer i2c_piix4 pcspkr k10temp
i2c_smbus snd realtek rfkill soundcore gpio_amdpt gpio_generic loop
nfnetlink zram lz4hc_compress lz4_compress amdgpu amdxcp i2c_algo_bit
drm_ttm_helper ttm drm_exec polyval_clmulni
[ 1439.966788]  gpu_sched nvme polyval_generic ghash_clmulni_intel
drm_suballoc_helper drm_panel_backlight_quirks ucsi_ccg sha512_ssse3
nvme_core drm_buddy typec_ucsi sha256_ssse3 drm_display_helper
nvme_keyring typec sha1_ssse3 nvme_auth sp5100_tco cec video wmi fuse
[ 1439.966799] irq event stamp: 235192
[ 1439.966800] hardirqs last  enabled at (235191):
[<ffffffffa60012a6>] asm_exc_page_fault+0x26/0x30
[ 1439.966805] hardirqs last disabled at (235192):
[<ffffffffa9ba5277>] irqentry_enter+0x57/0x60
[ 1439.966808] softirqs last  enabled at (234272):
[<ffffffffa660ee39>] handle_softirqs+0x579/0x840
[ 1439.966810] softirqs last disabled at (234263):
[<ffffffffa660f236>] __irq_exit_rcu+0x126/0x240
[ 1439.966813] CPU: 28 UID: 1000 PID: 209499 Comm: cc1 Tainted: G
  W    L      6.15.0-rc5-01-3ce9925823c7d6bb0e6eb951bf2db0e9e182582d+
#1 PREEMPT(lazy)
[ 1439.966817] Tainted: [W]=3DWARN, [L]=3DSOFTLOCKUP
[ 1439.966818] Hardware name: ASRock B650I Lightning WiFi/B650I
Lightning WiFi, BIOS 3.08 09/18/2024
[ 1439.966819] RIP: 0010:delay_halt_mwaitx+0x20/0x50

And then the system hangs after SOFTLOCKUP.

Bisect says that this is commit f1c6be3999d2

Author: Aurabindo Pillai <aurabindo.pillai@amd.com>
Date:   Wed Apr 16 11:26:54 2025 -0400

    drm/amd/display: more liberal vmin/vmax update for freesync

    [Why]
    FAMS2 expects vmin/vmax to be updated in the case when freesync is
    off, but supported. But we only update it when freesync is enabled.

    [How]
    Change the vsync handler such that dc_stream_adjust_vmin_vmax() its cal=
led
    irrespective of whether freesync is enabled. If freesync is supported,
    then there is no harm in updating vmin/vmax registers.

    Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3546
    Reviewed-by: ChiaHsuan Chung <chiahsuan.chung@amd.com>
    Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
    Signed-off-by: Ray Wu <ray.wu@amd.com>
    Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
    (cherry picked from commit cfb2d41831ee5647a4ae0ea7c24971a92d5dfa0d)
    Cc: stable@vger.kernel.org

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)


Of course I checked revert of commit f1c6be3999d2
And I can confirm that without f1c6be3999d2 this issue is gone.

My machine spec: https://linux-hardware.org/?probe=3D4635c5fcb1
And I attached below my build config, bisect log and full kernel log.

Aurabindo, can you look, please, ASAP?

--
Best Regards,
Mike Gavrilov.

--_000_CH0PR12MB52845B90BB3D7B94473B6FDA8B9FACH0PR12MB5284namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - AMD Internal Distribution Only]<br>
</p>
<br>
<div>
<div class=3D"elementToProof">Hi<span style=3D"font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">&nbsp;Mike,</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Could you more details about your setup, and how you were able to repro it =
?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature" style=3D"color: inherit;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
--</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Jay<br>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mikhail Gavrilov &lt;=
mikhail.v.gavrilov@gmail.com&gt;<br>
<b>Sent:</b> Tuesday, May 20, 2025 5:33 AM<br>
<b>To:</b> Pillai, Aurabindo &lt;Aurabindo.Pillai@amd.com&gt;; Chung, ChiaH=
suan (Tom) &lt;ChiaHsuan.Chung@amd.com&gt;; Wu, Ray &lt;Ray.Wu@amd.com&gt;;=
 Wheeler, Daniel &lt;Daniel.Wheeler@amd.com&gt;; Deucher, Alexander &lt;Ale=
xander.Deucher@amd.com&gt;; amd-gfx list &lt;amd-gfx@lists.freedesktop.org&=
gt;;
 dri-devel &lt;dri-devel@lists.freedesktop.org&gt;; Linux List Kernel Maili=
ng &lt;linux-kernel@vger.kernel.org&gt;; Linux regressions mailing list &lt=
;regressions@lists.linux.dev&gt;<br>
<b>Subject:</b> 6.15-rc6/regression/bisected - after commit f1c6be3999d2 er=
ror appeared: *ERROR* dc_dmub_srv_log_diagnostic_data: DMCUB error</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi,<br>
After commit f1c6be3999d2 error appears:<br>
[ 1421.701677] amdgpu 0000:03:00.0: [drm] *ERROR*<br>
dc_dmub_srv_log_diagnostic_data: DMCUB error - collecting diagnostic<br>
data<br>
[ 1421.896810] amdgpu 0000:03:00.0: [drm] *ERROR*<br>
dc_dmub_srv_log_diagnostic_data: DMCUB error - collecting diagnostic<br>
data<br>
[ 1422.088397] amdgpu 0000:03:00.0: [drm] *ERROR*<br>
dc_dmub_srv_log_diagnostic_data: DMCUB error - collecting diagnostic<br>
data<br>
[ 1426.448674] amdgpu 0000:03:00.0: amdgpu: SMU: I'm not done with<br>
your previous command: SMN_C2PMSG_66:0x00000012<br>
SMN_C2PMSG_82:0x00000005<br>
[ 1426.448804] amdgpu 0000:03:00.0: amdgpu: Failed to export SMU metrics ta=
ble!<br>
[ 1430.149443] amdgpu 0000:03:00.0: amdgpu: SMU: I'm not done with<br>
your previous command: SMN_C2PMSG_66:0x00000012<br>
SMN_C2PMSG_82:0x00000005<br>
[ 1430.149456] amdgpu 0000:03:00.0: amdgpu: Failed to export SMU metrics ta=
ble!<br>
[ 1433.846389] amdgpu 0000:03:00.0: amdgpu: SMU: I'm not done with<br>
your previous command: SMN_C2PMSG_66:0x00000012<br>
SMN_C2PMSG_82:0x00000005<br>
[ 1433.846400] amdgpu 0000:03:00.0: amdgpu: Failed to export SMU metrics ta=
ble!<br>
[ 1437.543718] amdgpu 0000:03:00.0: amdgpu: SMU: I'm not done with<br>
your previous command: SMN_C2PMSG_66:0x00000012<br>
SMN_C2PMSG_82:0x00000005<br>
[ 1437.543727] amdgpu 0000:03:00.0: amdgpu: Failed to export SMU metrics ta=
ble!<br>
[ 1439.966738] watchdog: CPU28: Watchdog detected hard LOCKUP on cpu 28<br>
[ 1439.966742] Modules linked in: uinput rfcomm snd_seq_dummy<br>
snd_hrtimer nft_queue nfnetlink_queue nf_conntrack_netbios_ns<br>
nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib<br>
nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct<br>
nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set<br>
nf_tables qrtr bnep sunrpc binfmt_misc amd_atl intel_rapl_msr<br>
intel_rapl_common mt7921e mt7921_common mt792x_lib mt76_connac_lib<br>
edac_mce_amd mt76 btusb btrtl btintel snd_hda_codec_realtek btbcm<br>
btmtk snd_hda_codec_generic snd_hda_scodec_component kvm_amd<br>
snd_hda_codec_hdmi mac80211 bluetooth vfat snd_hda_intel fat<br>
snd_intel_dspcfg kvm snd_intel_sdw_acpi snd_hda_codec snd_hda_core<br>
spd5118 snd_hwdep libarc4 snd_seq irqbypass snd_seq_device wmi_bmof<br>
cfg80211 r8169 rapl joydev snd_pcm snd_timer i2c_piix4 pcspkr k10temp<br>
i2c_smbus snd realtek rfkill soundcore gpio_amdpt gpio_generic loop<br>
nfnetlink zram lz4hc_compress lz4_compress amdgpu amdxcp i2c_algo_bit<br>
drm_ttm_helper ttm drm_exec polyval_clmulni<br>
[ 1439.966788]&nbsp; gpu_sched nvme polyval_generic ghash_clmulni_intel<br>
drm_suballoc_helper drm_panel_backlight_quirks ucsi_ccg sha512_ssse3<br>
nvme_core drm_buddy typec_ucsi sha256_ssse3 drm_display_helper<br>
nvme_keyring typec sha1_ssse3 nvme_auth sp5100_tco cec video wmi fuse<br>
[ 1439.966799] irq event stamp: 235192<br>
[ 1439.966800] hardirqs last&nbsp; enabled at (235191):<br>
[&lt;ffffffffa60012a6&gt;] asm_exc_page_fault+0x26/0x30<br>
[ 1439.966805] hardirqs last disabled at (235192):<br>
[&lt;ffffffffa9ba5277&gt;] irqentry_enter+0x57/0x60<br>
[ 1439.966808] softirqs last&nbsp; enabled at (234272):<br>
[&lt;ffffffffa660ee39&gt;] handle_softirqs+0x579/0x840<br>
[ 1439.966810] softirqs last disabled at (234263):<br>
[&lt;ffffffffa660f236&gt;] __irq_exit_rcu+0x126/0x240<br>
[ 1439.966813] CPU: 28 UID: 1000 PID: 209499 Comm: cc1 Tainted: G<br>
&nbsp; W&nbsp;&nbsp;&nbsp; L&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6.15.0-rc5-01-3c=
e9925823c7d6bb0e6eb951bf2db0e9e182582d+<br>
#1 PREEMPT(lazy)<br>
[ 1439.966817] Tainted: [W]=3DWARN, [L]=3DSOFTLOCKUP<br>
[ 1439.966818] Hardware name: ASRock B650I Lightning WiFi/B650I<br>
Lightning WiFi, BIOS 3.08 09/18/2024<br>
[ 1439.966819] RIP: 0010:delay_halt_mwaitx+0x20/0x50<br>
<br>
And then the system hangs after SOFTLOCKUP.<br>
<br>
Bisect says that this is commit f1c6be3999d2<br>
<br>
Author: Aurabindo Pillai &lt;aurabindo.pillai@amd.com&gt;<br>
Date:&nbsp;&nbsp; Wed Apr 16 11:26:54 2025 -0400<br>
<br>
&nbsp;&nbsp;&nbsp; drm/amd/display: more liberal vmin/vmax update for frees=
ync<br>
<br>
&nbsp;&nbsp;&nbsp; [Why]<br>
&nbsp;&nbsp;&nbsp; FAMS2 expects vmin/vmax to be updated in the case when f=
reesync is<br>
&nbsp;&nbsp;&nbsp; off, but supported. But we only update it when freesync =
is enabled.<br>
<br>
&nbsp;&nbsp;&nbsp; [How]<br>
&nbsp;&nbsp;&nbsp; Change the vsync handler such that dc_stream_adjust_vmin=
_vmax() its called<br>
&nbsp;&nbsp;&nbsp; irrespective of whether freesync is enabled. If freesync=
 is supported,<br>
&nbsp;&nbsp;&nbsp; then there is no harm in updating vmin/vmax registers.<b=
r>
<br>
&nbsp;&nbsp;&nbsp; Closes: <a href=3D"https://gitlab.freedesktop.org/drm/am=
d/-/issues/3546">https://gitlab.freedesktop.org/drm/amd/-/issues/3546</a><b=
r>
&nbsp;&nbsp;&nbsp; Reviewed-by: ChiaHsuan Chung &lt;chiahsuan.chung@amd.com=
&gt;<br>
&nbsp;&nbsp;&nbsp; Signed-off-by: Aurabindo Pillai &lt;aurabindo.pillai@amd=
.com&gt;<br>
&nbsp;&nbsp;&nbsp; Signed-off-by: Ray Wu &lt;ray.wu@amd.com&gt;<br>
&nbsp;&nbsp;&nbsp; Tested-by: Daniel Wheeler &lt;daniel.wheeler@amd.com&gt;=
<br>
&nbsp;&nbsp;&nbsp; Signed-off-by: Alex Deucher &lt;alexander.deucher@amd.co=
m&gt;<br>
&nbsp;&nbsp;&nbsp; (cherry picked from commit cfb2d41831ee5647a4ae0ea7c2497=
1a92d5dfa0d)<br>
&nbsp;&nbsp;&nbsp; Cc: stable@vger.kernel.org<br>
<br>
&nbsp;drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 16 +++++++++++---=
--<br>
&nbsp;1 file changed, 11 insertions(+), 5 deletions(-)<br>
<br>
<br>
Of course I checked revert of commit f1c6be3999d2<br>
And I can confirm that without f1c6be3999d2 this issue is gone.<br>
<br>
My machine spec: <a href=3D"https://linux-hardware.org/?probe=3D4635c5fcb1"=
>https://linux-hardware.org/?probe=3D4635c5fcb1</a><br>
And I attached below my build config, bisect log and full kernel log.<br>
<br>
Aurabindo, can you look, please, ASAP?<br>
<br>
-- <br>
Best Regards,<br>
Mike Gavrilov.<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_CH0PR12MB52845B90BB3D7B94473B6FDA8B9FACH0PR12MB5284namp_--
