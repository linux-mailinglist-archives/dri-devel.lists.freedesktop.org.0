Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5889F05B6
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 08:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECB210EF15;
	Fri, 13 Dec 2024 07:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qAWrI0IJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DE710EF15;
 Fri, 13 Dec 2024 07:46:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xxNbLtEEbCX5AOivxA009m7VKbs2zJY2axrlPUCAx+IjyGaazIIhOEuKlPtLtYxJwJ4BOH4kqpQTLoAgFbeO5z8qtMaKWKTseM/Val5XIWbJyrx5Us143rn/QBxeIR2mlQCGHM6E2kkjVIUvXqF+FoYbtYWFAcTrXd8uK+cSjNefl0yi72oVMyN0vkCuDHcl8aITyx8mtBYYHN8XFj8LmUNVNOZJxQ5NBcdfmDZXPLb6b71xZqzoz65B2DrfJJoJEnda1WoFucML/kt1vMvLip1nzohLgQWsmOdVAzwCG8JVfK79e0KFZ0jekGpBLTwVu1DLZGruiEwDq+9fmkyEng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGdWl7Bs7Pf4S+vci1o9qqDfPFP2pnXpUXoEHLpbXVI=;
 b=ePbV9Q4A8SotvRstZI6+rSajEKvOUxJIV6HgeffmzalnUlON1MWZxbMjr7NdtdcjFnh2LvY8VRVuF3fAmVMqc1cyCl6CapppuGlkgNz6LneVFUYWN7fMb00p725BY432Zl5YYEiBymOE1jbXLDzhHjLXZ/v1jzlooi2t/JWkkO1Bslo5NCjKOfUqg7ulVWM7Sr1FySm+F5+ZNMXo/AR3evjpmygDN0yevSnxMwFaQE7dYGC034lZ44Aha1vUyjxLD0J6N1b3YkbxwByOWqbsproHRItQ71VUOh1H7RJnljgIG9dcaeZxxuP7tNTUFi8Uhbh2xBXCUeW3O9azflfVkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGdWl7Bs7Pf4S+vci1o9qqDfPFP2pnXpUXoEHLpbXVI=;
 b=qAWrI0IJ5r9DOJ4S1IcgJAplxU0H+5A74LluTXmAINEVae8suNWKkcKikT+uR7p7NZZ64hrlrug4Zs228FGyAZ3LsudFtsk1J4r4Ky+7HIzRwIUGoToCWq5ZEDAyHlI6mXvnom6QBXGuc63dMD7a5tKR8ZBmCa79zl+xHVYKol4=
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by DM4PR12MB6184.namprd12.prod.outlook.com (2603:10b6:8:a6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.15; Fri, 13 Dec 2024 07:46:00 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::6216:e70a:9c8b:7abb]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::6216:e70a:9c8b:7abb%2]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 07:46:00 +0000
From: "Sharma, Shashank" <Shashank.Sharma@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 =?iso-8859-1?Q?Andr=E9_Almeida?= <andrealmeid@igalia.com>, Raag Jadav
 <raag.jadav@intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "lucas.demarchi@intel.com"
 <lucas.demarchi@intel.com>, "rodrigo.vivi@intel.com"
 <rodrigo.vivi@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>, "lina@asahilina.net"
 <lina@asahilina.net>, "michal.wajdeczko@intel.com"
 <michal.wajdeczko@intel.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "himal.prasad.ghimiray@intel.com" <himal.prasad.ghimiray@intel.com>,
 "aravind.iddamsetty@linux.intel.com" <aravind.iddamsetty@linux.intel.com>,
 "anshuman.gupta@intel.com" <anshuman.gupta@intel.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "kernel-dev@igalia.com"
 <kernel-dev@igalia.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: Use device wedged event
Thread-Topic: [PATCH 1/1] drm/amdgpu: Use device wedged event
Thread-Index: AQHbTMln1jaNGiCVe0y5n6ii2DuogbLjyUMAgAAC7Aw=
Date: Fri, 13 Dec 2024 07:46:00 +0000
Message-ID: <MW4PR12MB56676914CF4E2E8C6CEF6C03F2382@MW4PR12MB5667.namprd12.prod.outlook.com>
References: <20241212190909.28559-1-andrealmeid@igalia.com>
 <20241212190909.28559-2-andrealmeid@igalia.com>
 <d9f2583d-da79-4532-90fc-85028e977ceb@amd.com>
In-Reply-To: <d9f2583d-da79-4532-90fc-85028e977ceb@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-12-13T07:46:00.145Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB5667:EE_|DM4PR12MB6184:EE_
x-ms-office365-filtering-correlation-id: a4d4ef80-403c-46de-895c-08dd1b4a3020
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020|7053199007|8096899003|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?taGWUCXybwyE2sM5+P/D5/ja3e7bHk04/pktfaXDmarJkGwUzd9U7v+SF6?=
 =?iso-8859-1?Q?/8rZB7KAA2HuaVp8jjdevo8gT2U98FGtCZ7qNMrTB/CCmRwC3zTTNy7rl+?=
 =?iso-8859-1?Q?/v2O4wXYwo3l9QPt0lqg7HmbJYxBMNJdZj3OWmOsDVt0iri/8OnEufHYkx?=
 =?iso-8859-1?Q?3YezkG6kUqxSc3v5ZLWNH9Pr/LTKmfnelxElU/AoXk3zhuvGrDQntAL1WJ?=
 =?iso-8859-1?Q?OaLjvA75mqgQSOcKU3h2ntdxWl+iPINnaXm5tAfj1eQHGHW3DwI6xrTgDR?=
 =?iso-8859-1?Q?T0Ui+0LmzZO7+GiTB3rV7gUP/kr719zBRCaoBh48CQvTracW7HWzPHyFmy?=
 =?iso-8859-1?Q?8NSv/23WAznQxee0pAcQdJEKcSHC9UafQBMScG88vEVjpzk7As4rQeVuP6?=
 =?iso-8859-1?Q?N115msBBqTVQw4L+qXs68VoIvS28PwLIr+O+KYqIbcwivVRQuXSsLSc5va?=
 =?iso-8859-1?Q?LlQ32wXOMGILLMpOMCagEEdsmpx5TiLjur31YDLj//WUIUR1k7cDcwGgxc?=
 =?iso-8859-1?Q?TbCH2i+7XiXiyI51NJs99GWvS0CzMHZMkiWCPcnnTWspoMIeQoPUKmiWbG?=
 =?iso-8859-1?Q?2id1DlTvN/5EzPccwbv9CQGW8TWNuZrAh4gMSCuqUrDrdUPRCogj5HIIIG?=
 =?iso-8859-1?Q?pPt9fWabP1SDPQvEXufr08FQV4Dg3Mm4s0ZeSLp5uuh91hJ2GlIbqTfV6F?=
 =?iso-8859-1?Q?PJnmJ/vmyiZgbs85q4D7ebNkt83fZ+wp1tg6ihP5VMc5iYXtSF7BfQa4wB?=
 =?iso-8859-1?Q?FIi5Z7duWbuPUroWp7wza1cRFJaxBsjgRmQHOV2nL8l7Q2B5qKkYbrxERu?=
 =?iso-8859-1?Q?gjBrsPn2jkX12HWWoSPHAuZswyZH6AMtm0Oniz8cUeQ0/cb0XfoyV0TEFv?=
 =?iso-8859-1?Q?31R4aFrJrOhnYqaN1swBSOoeIfqXiOYnsgCPJn8PDuiXtkMVmF+tjU5c1D?=
 =?iso-8859-1?Q?v7Lx7NknObmXT5Wc050kFcV4v1474dwywZXhAwjTGVVEwmlVy+5OC5HwLH?=
 =?iso-8859-1?Q?+Iz43Imuo8ZERVCQjc9TxR4PGiNsPB0JKUUH+mJLggDRYiGV8TzZld0klS?=
 =?iso-8859-1?Q?ujgiw1DZYT6QusxD2dEKw2KmIW++YMTI9HXRyvPQ9m38iuPYIEHd531yip?=
 =?iso-8859-1?Q?e+mZlshV/dbc7X+9vus8PHfHzUatNhSVBSlS/70iN+M6EOvbF3VVJu8yVw?=
 =?iso-8859-1?Q?rLudfJ+8LJ5wCPyakuM+G8AXcMrnWqZaI42ELYQ8C5k76LkduE3Xp0Gyhw?=
 =?iso-8859-1?Q?/KUnjpPDBALELJ5X1ZA0XgtV8C/LRPKqy1PmIp5PZ+/W6bzUhF+5G1NVgy?=
 =?iso-8859-1?Q?t670l3CUmDHgIFdGwz2z/a24GWzhquiDOLnpy2VBXsZdL6L5VrmLjhPKeH?=
 =?iso-8859-1?Q?yeTN5Gi7K0ZJYx3B+CoX2Uj5JVGRDee7gLaQ5A8hK9uqgWUDcMdgxkH0/O?=
 =?iso-8859-1?Q?wcz7oeZcRo7rI/RwyL5/FaC2pGuVz0MrZE+lAATC4qvZobA03KcxqzfV4B?=
 =?iso-8859-1?Q?I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(7053199007)(8096899003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?IBydiNHPYcMmCcvA0izGFQpKOQdJ5/YXJDE/IlJaa24Ega3CwMLQmLRYHy?=
 =?iso-8859-1?Q?AcupLdwRhMw5sOF+zyehx3YYvMTOXKK/m1c3fwQp6btVv5Cra+lU7QARhX?=
 =?iso-8859-1?Q?4FWaYvwj5Eo1+V5wdaPGbv1apl4bVtKVSJBwOQHMAjNyYPrefI6H54KyCT?=
 =?iso-8859-1?Q?QpVZbDvQ3F6cSgWSlYWv3WgBf8QsvGiauawtHAoh750/Sj31Al4Yfagqlc?=
 =?iso-8859-1?Q?Ulufd6Vnod1+FwzKZ54uMq1EfsjFrzsL0K6HtyzEeeY/kz2b/HU1powLgE?=
 =?iso-8859-1?Q?N8B7n6xMKh3AqIGGsx9k1hdIxuxjfxkRWLlSmayLMd1t4ZUMVxPv7HP5hG?=
 =?iso-8859-1?Q?Tm6ykjKFwfTfaeXP5AFTZ5VPcukkJBiwltJ/+Sou7N3sBVDB9+1TcQKjAU?=
 =?iso-8859-1?Q?JXzZRhWLRyi6CBKh7iso2g7qH3EA63amqs5TBsFpD+SpDenLhdJvNlzFtb?=
 =?iso-8859-1?Q?G/U2rHZ/GEvGR87crfKAT4C/SbltZ/qMD00kUQgyc9+qs0B081w7luy8lo?=
 =?iso-8859-1?Q?xFKcD9Cj3zI1Lw3eXhzxlEhBULvwHsvCYO3wkBMXsK5aou+rd4pYnAicQU?=
 =?iso-8859-1?Q?AC/96a/UHjdDsDXmlEG3955IHmMMUPwtl3dvua7AHZbipKFu1l8/2Z5ClX?=
 =?iso-8859-1?Q?HfKl7XaeR3V8R0UloyEx7vFvpTIMjn8wjMtVGDJYys9TArj/aKEAzxfA62?=
 =?iso-8859-1?Q?sMMHMgt/UdHz7vRaHOvRSPWjE6AhauddimWPy3T/ULWNt/0xA4y1mo8gi2?=
 =?iso-8859-1?Q?HugTBjdHEv1y9ScENN2SY8SwPuBuu9xAqDqfALLYA9dajQdH6sutXnTBr/?=
 =?iso-8859-1?Q?pLQrP87Jq0ULuNMnMr/77W2Yr8Izw7xaOu8VVAieTw6Mzil9soABgr3tGf?=
 =?iso-8859-1?Q?0/hcG/cWRohHoYcbnu6e4KgOGVIzWwKu4F5TH3owmTByx5g5fcROa7rFTC?=
 =?iso-8859-1?Q?1wEns/EZ/pCztyBEVH5v2j7BvcZtAfzYtnoL3Q6GXl0Tegr5adZ/LL1SF5?=
 =?iso-8859-1?Q?DLhrE8km1NZGIFCZEPrOudXCsKSV34NHt47AVz6f7A8tQwTyYAnhBg2OjG?=
 =?iso-8859-1?Q?seqMBZqLwR5Jo3Obfa0XZXYSDY2Cad7ChCUGlqEcIpCVft2uThjG3QQwfL?=
 =?iso-8859-1?Q?Z29Hase7kcLHWxGvWUYz5H6LSCrQvdymPbwmC1tzrhc7vXUiJFD7vVUc/X?=
 =?iso-8859-1?Q?n7aF7SEiL8ypiYwgWSUaSic/5VPpHNqK74b0qenFMsbMc+LknVtwOlsnD4?=
 =?iso-8859-1?Q?l4/7WaFIyybGjrScV1k907hxX6BzNe+evXGupQ9YVEuM4dyMDP8+rRNSMf?=
 =?iso-8859-1?Q?+xjwraj1fQNxuscx+ewK+vnGjbULy3MD0hb7VigyV2hpOrT/sdlIggQ81q?=
 =?iso-8859-1?Q?TH69ov3IhXIR1wFZ3LqL7YamyIuHB5/hwtSBkuinPg/v+ScgWx8u14qsNT?=
 =?iso-8859-1?Q?K0wx4jzzcQJo7CPHDyoNDe8iM/go8LWsMcVSDCNfKYbbST7dn/ilDmIqur?=
 =?iso-8859-1?Q?DFISrOryu5dvhbeYU9hYmahuTRde/ojVi711KJnHrUiaRB/o7BXV/8WPnb?=
 =?iso-8859-1?Q?pLGy+J91nzoH3hwnarjOacYyBTeyDi7gs5ZyBhqw8nlyw4uZgm81kggDMc?=
 =?iso-8859-1?Q?Gwgf+Hc6JVg1A=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MW4PR12MB56676914CF4E2E8C6CEF6C03F2382MW4PR12MB5667namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d4ef80-403c-46de-895c-08dd1b4a3020
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 07:46:00.5173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBYV784OkwI6l3HgcQEavD2fXWwqDnN+F+dZcsEoo4FrY28To4vjPiQsmMK2+fZRPluf1GGW/em0rDsmvlKZZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6184
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

--_000_MW4PR12MB56676914CF4E2E8C6CEF6C03F2382MW4PR12MB5667namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Looks good to me as well, With Christian's comment accommodated:
Acked-by: Shashank Sharma <shashank.sharma@amd.com>

Regards
Shashank
________________________________
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Friday, December 13, 2024 8:34 AM
To: Andr=E9 Almeida <andrealmeid@igalia.com>; Raag Jadav <raag.jadav@intel.=
com>; airlied@gmail.com <airlied@gmail.com>; simona@ffwll.ch <simona@ffwll.=
ch>; lucas.demarchi@intel.com <lucas.demarchi@intel.com>; rodrigo.vivi@inte=
l.com <rodrigo.vivi@intel.com>; jani.nikula@linux.intel.com <jani.nikula@li=
nux.intel.com>; andriy.shevchenko@linux.intel.com <andriy.shevchenko@linux.=
intel.com>; lina@asahilina.net <lina@asahilina.net>; michal.wajdeczko@intel=
.com <michal.wajdeczko@intel.com>; Sharma, Shashank <Shashank.Sharma@amd.co=
m>
Cc: intel-gfx@lists.freedesktop.org <intel-gfx@lists.freedesktop.org>; dri-=
devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; himal.prasad=
.ghimiray@intel.com <himal.prasad.ghimiray@intel.com>; aravind.iddamsetty@l=
inux.intel.com <aravind.iddamsetty@linux.intel.com>; anshuman.gupta@intel.c=
om <anshuman.gupta@intel.com>; Deucher, Alexander <Alexander.Deucher@amd.co=
m>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; kernel-d=
ev@igalia.com <kernel-dev@igalia.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: Use device wedged event

Am 12.12.24 um 20:09 schrieb Andr=E9 Almeida:
> Use DRM's device wedged event to notify userspace that a reset had
> happened. For now, only use `none` method meant for telemetry
> capture.
>
> Signed-off-by: Andr=E9 Almeida <andrealmeid@igalia.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index 96316111300a..19e1a5493778 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -6057,6 +6057,9 @@ int amdgpu_device_gpu_recover(struct amdgpu_device =
*adev,
>                dev_info(adev->dev, "GPU reset end with ret =3D %d\n", r);
>
>        atomic_set(&adev->reset_domain->reset_res, r);
> +
> +     drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);

That looks really good in general. I would just make the
DRM_WEDGE_RECOVERY_NONE depend on the value of "r".

@Shashank any objections? IIRC you have worked on the AMD specific event
we never upstreamed.

Regards,
Christian.

> +
>        return r;
>   }
>


--_000_MW4PR12MB56676914CF4E2E8C6CEF6C03F2382MW4PR12MB5667namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Looks good to me as well, With Christian's comment accommodated:&nbsp;</div=
>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Acked-by: Shashank Sharma &lt;shashank.sharma@amd.com&gt;</div>
<div id=3D"appendonsend" style=3D"color: inherit;"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Regards</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Shashank</div>
<hr style=3D"display: inline-block; width: 98%;">
<div dir=3D"ltr" id=3D"divRplyFwdMsg" style=3D"color: inherit;"><span style=
=3D"font-family: Calibri, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
"><b>From:</b>&nbsp;Koenig, Christian &lt;Christian.Koenig@amd.com&gt;<br>
<b>Sent:</b>&nbsp;Friday, December 13, 2024 8:34 AM<br>
<b>To:</b>&nbsp;Andr=E9 Almeida &lt;andrealmeid@igalia.com&gt;; Raag Jadav =
&lt;raag.jadav@intel.com&gt;; airlied@gmail.com &lt;airlied@gmail.com&gt;; =
simona@ffwll.ch &lt;simona@ffwll.ch&gt;; lucas.demarchi@intel.com &lt;lucas=
.demarchi@intel.com&gt;; rodrigo.vivi@intel.com &lt;rodrigo.vivi@intel.com&=
gt;;
 jani.nikula@linux.intel.com &lt;jani.nikula@linux.intel.com&gt;; andriy.sh=
evchenko@linux.intel.com &lt;andriy.shevchenko@linux.intel.com&gt;; lina@as=
ahilina.net &lt;lina@asahilina.net&gt;; michal.wajdeczko@intel.com &lt;mich=
al.wajdeczko@intel.com&gt;; Sharma, Shashank &lt;Shashank.Sharma@amd.com&gt=
;<br>
<b>Cc:</b>&nbsp;intel-gfx@lists.freedesktop.org &lt;intel-gfx@lists.freedes=
ktop.org&gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedeskt=
op.org&gt;; himal.prasad.ghimiray@intel.com &lt;himal.prasad.ghimiray@intel=
.com&gt;; aravind.iddamsetty@linux.intel.com &lt;aravind.iddamsetty@linux.i=
ntel.com&gt;;
 anshuman.gupta@intel.com &lt;anshuman.gupta@intel.com&gt;; Deucher, Alexan=
der &lt;Alexander.Deucher@amd.com&gt;; amd-gfx@lists.freedesktop.org &lt;am=
d-gfx@lists.freedesktop.org&gt;; kernel-dev@igalia.com &lt;kernel-dev@igali=
a.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [PATCH 1/1] drm/amdgpu: Use device wedged event</s=
pan>
<div>&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">Am 12.12.24 um 20:09 schrieb Andr=E9 Almeid=
a:<br>
&gt; Use DRM's device wedged event to notify userspace that a reset had<br>
&gt; happened. For now, only use `none` method meant for telemetry<br>
&gt; capture.<br>
&gt;<br>
&gt; Signed-off-by: Andr=E9 Almeida &lt;andrealmeid@igalia.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 +++<br>
&gt;&nbsp;&nbsp; 1 file changed, 3 insertions(+)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_device.c<br>
&gt; index 96316111300a..19e1a5493778 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt; @@ -6057,6 +6057,9 @@ int amdgpu_device_gpu_recover(struct amdgpu_devi=
ce *adev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; dev_info(adev-&gt;dev, &quot;GPU reset end with ret =3D=
 %d\n&quot;, r);<br>
&gt;&nbsp;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; atomic_set(&amp;adev-&gt;res=
et_domain-&gt;reset_res, r);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; drm_dev_wedged_event(adev_to_drm(adev), DRM_=
WEDGE_RECOVERY_NONE);<br>
<br>
That looks really good in general. I would just make the<br>
DRM_WEDGE_RECOVERY_NONE depend on the value of &quot;r&quot;.<br>
<br>
@Shashank any objections? IIRC you have worked on the AMD specific event<br=
>
we never upstreamed.<br>
<br>
Regards,<br>
Christian.<br>
<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;<br>
<br>
</div>
</div>
</body>
</html>

--_000_MW4PR12MB56676914CF4E2E8C6CEF6C03F2382MW4PR12MB5667namp_--
