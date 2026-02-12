Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMqnFsyWjWkG5AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:01:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F37E112BA02
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6844810E6FC;
	Thu, 12 Feb 2026 09:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="j8XDcN/v";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="Ecr//5wT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1F410E6FC
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 09:00:50 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61C87glM2450728; Thu, 12 Feb 2026 09:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=k+xLuKyD8K5Ho8BKGVkL3FR4L
 hNjirHi8d/f2GP7/tM=; b=j8XDcN/vlOSDzUZw+u0SLN94FqVetSS6yWpr6vmeM
 foVWMs0WERZPo2gNhtyEdaE10BeW7Ab4/PdRx5x6A/dEujeDihnkCnQpoygxZOmG
 rpMch18bOKs8YdRVfBd69K0CgnuzM4gkAhWaDrlmrjthQJ3E3uoQ/74t0hgg105w
 tlP0H2OqRCLZ9/CrDXy757TAjeLcFH6T5nGgI7Lv21g/hhnTKUAjLpQUSMmLFCCd
 QslmnmgylHhdtdfkcNLgFX089sYaqpU6Ghp1+WdyYRxebweRk59OwclNfuu27ynl
 jJr8/iB0xqogL2xY871vnS8sM0JxQAhjUQ0bSwD4SakIg==
Received: from lo3p265cu004.outbound.protection.outlook.com
 (mail-uksouthazon11020075.outbound.protection.outlook.com [52.101.196.75])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4c5xbvv0u6-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 12 Feb 2026 09:00:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=prV7ojNhH2lBMwTQ0VRk8cwHabN/mNnqaEfwgsuCeI0G5MZYKyd562IQ6D70EICWhMgvg6c8fGCGQun76zS1A6wWUVH4Qpi4/oe+4+V5Gm303nRSWHeEM9Iuxr6dVdD8q+TsXGOVYK99NCRn/JkTb7Bv6OpTMX9AVMGoe+j9gV8AtOfCx0S66T18KKbx4n+oaFqZ8seEvs37iqW+fdPtVrG6BVsa+DPbluzinmZXrnKgnRtOdy4UyeRkseC97q72eqPshgjRoTX2DC66ww26Y+I3jivGTAVfKfb00NGkMtYQ8/Zp3BXn7EW/flQlQfzDV25ndzK7mIWEm9Fl96F4Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+xLuKyD8K5Ho8BKGVkL3FR4LhNjirHi8d/f2GP7/tM=;
 b=ANp3FPg/aeXPA3soMhYdmXEIhtC9CPq6HFrCupAB7zwn0cly/AetMCtm/SrjGSTZxScxaTSIp98iMplHkPdVBDwJW4ii6mAUFgEoAecXKtB++Vv6lbWCRsbDZmSfvefXxwfyqb3vllygu/koqfAuc9Kam6tPXTNnJXs1DmJvjVO2/TCL8TixdXVgw1g9SDER9+BhtSh4mSqPl+o5KhjrpGhmiCq23AGhCtjhK8y+gs08xiCyyK3A2IbJboKW8hqDYdPLnExxF3f0AUK2XPBfkttL5rmIfKiq8xTKNRR15OSRdv+ia9XWBQg/XHhjJdjKqA1aOvu4Frf+NRq/w47AVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+xLuKyD8K5Ho8BKGVkL3FR4LhNjirHi8d/f2GP7/tM=;
 b=Ecr//5wTSXjqSm9zjYkqh/9raTjLd6tkQzVB3JnQmFhR6W8erVmrNXAZypK0I+5VKTHAshzRaHhGFVEasjtlWHWA86WCRezFOaS2Avn/VyB/185WvlYkrVij8Ceups5yp4pOUkejntqMJedf3MJc7t+wSNkRe7FeJ0wGUmjqyOk=
Received: from CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e2::14)
 by LO0P265MB6852.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 09:00:13 +0000
Received: from CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f32f:ed34:4f98:6cd6]) by CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f32f:ed34:4f98:6cd6%6]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 09:00:13 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Marek Vasut <marek.vasut@mailbox.org>
CC: Geert Uytterhoeven <geert@linux-m68k.org>, Thorsten Leemhuis
 <regressions@leemhuis.info>, Frank Binns <Frank.Binns@imgtec.com>, Brajesh
 Gupta <Brajesh.Gupta@imgtec.com>, Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [PATCH] drm/imagination: Convert to
 dev_pm_domain_{at,de}tach_list()
Thread-Topic: [PATCH] drm/imagination: Convert to
 dev_pm_domain_{at,de}tach_list()
Thread-Index: AQHcm/3/gqoLgMzoLUC73ePajgjZ6w==
Date: Thu, 12 Feb 2026 09:00:13 +0000
Message-ID: <3e0def93-2f6c-4bcf-8ee5-bf607f2ca382@imgtec.com>
References: <194465eda54d1f852a9226cf691ddc5aa208e0a3.1769097977.git.geert+renesas@glider.be>
 <ffdf3982-e22c-4d01-afa6-5449ed381000@imgtec.com>
 <CAMuHMdWMh_oJFg-KtapcTDGvYWZ-hg_ZEJ2=E5Tp1apOEc8tnQ@mail.gmail.com>
 <b3b4f10e-1222-44f7-b308-db7199c67147@mailbox.org>
In-Reply-To: <b3b4f10e-1222-44f7-b308-db7199c67147@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB3393:EE_|LO0P265MB6852:EE_
x-ms-office365-filtering-correlation-id: 1abddedd-190a-42b3-3e65-08de6a152223
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|6049299003|4053099003|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?NVEvaUc1ejVZM0YyUDVlQks0QzZqME5WdUV1QVpYZGFXbHpESVNqRk1mVnVZ?=
 =?utf-8?B?RUE2R2dpQm5yNFJEUk5vVFFLUUdCTE01b3A4NWtob3Q3ZWx0enYxdG9YK2dv?=
 =?utf-8?B?bVhaVkYvRFgvVUt5aFp0RGs3MGRlVk5sNWh2a3hoSGdUR3Z1Y1d6bnVvbmRs?=
 =?utf-8?B?SmtoUkZHTE90NXRyd3NDREJKUEJwQ2NiT01lcW5QMlZrVWZKSXArMEpOTzls?=
 =?utf-8?B?WnNtbEtvZXFmSHNsVmFVQ0Q5ODFTaTlidzZ4eFk0S3RMd1NwUlYwZVBKSjB3?=
 =?utf-8?B?Rm5GeFZOQms0M3NodkcvYzVrM0FnU3FvT3A0eHljUE51eFVsOTN3VXNGdWo5?=
 =?utf-8?B?Mm1jdFZHbW0yZTBrV2ZJSTJWOXpLOHJoRWtNVEtlQjMzMDB0STYycnJiWk1m?=
 =?utf-8?B?YnBmai9WVjUrQUp0UWFsWkpzcnRpV09ERTg4WWVFYlZSWDUycGhPNUl3WUR0?=
 =?utf-8?B?YkJjSDlBUXVxZ0lJQ1JnMWRiQk5rZFppQndWblFPaURIRHlVVGhlV2h5MUI3?=
 =?utf-8?B?QzJZeTBPbm5YdTZ0bEplNkY5UG9ZYjR2bFJMOEN3RkVrbHR5UlVHTVczVFhh?=
 =?utf-8?B?eC9XSkNBd0MzYzc2VHNSNVdta1pMQnN6SnZmekdRSnFleDBIajFUSHNlY1RR?=
 =?utf-8?B?dk8vRTVMSUN1R2p3d2w4clBKN1BzWnBjeDlOQ1pXWG8vVEx2cnRaWDlMNU5i?=
 =?utf-8?B?NEtsWWpIcjMwOVNZRkpPd3ZtOWt2YnkwQWxNa1hOTkw1ekxnVm1aUFFTOE5s?=
 =?utf-8?B?R2NGeVJ0SWJiU2szM05aMUM3UWd5VzRtRUpxQVhYOFd4b1E0a0xlUHdvT3ls?=
 =?utf-8?B?RzEvcStyQ25ZaHJXcHk3NFo0UmZ4VEJzRVpQYTd4UTVNZmw2NnF2VEZZcFJ1?=
 =?utf-8?B?ZWkzT2ppKy9zb2c2d24rUHhmOENaSVVlVTd4OGx3Nlh2OUpNZktQbW5SVkJU?=
 =?utf-8?B?b3hkZjNwdjRmVkZZMjNCMDJTL1pMbGdHZVlwcXhhd3RjTFgyMFpseUdxWldW?=
 =?utf-8?B?TlNWQThQMUFhbWRKRUxJKzkzbXFOb1lpZGl6Qjd6cmtuVVdmNThLWnhXbTZu?=
 =?utf-8?B?d29abGRKZHg3QUN0OUpjSjQ5aXJaM3B6NXZWb1RVZWh4bVpvak1EMC9XSmZK?=
 =?utf-8?B?bUw0TUNRbU41RGUxS1RWRUs1V3IrNVIwMFhZUGlpejFKSXpsbzJtcnF3UGpS?=
 =?utf-8?B?TjFSTnVoMjE3UTM3UXFPSWRTNmFrWTREUWdQeXZldmMxa0hCMmZ1R0lWSTIv?=
 =?utf-8?B?TStxMTRaVDYxdm4vUHd1UENGSHFTM2NKKyt3VmUvVldlSnpkWmFmbWltQjdJ?=
 =?utf-8?B?RWN2T3FjUU4yc3h6M1NDMzNDQWFSQTdlS2EwSU8wbnZTaUYvU3V0dmpXZ0Q3?=
 =?utf-8?B?QWtCNUFJZEUwbmpkQ2M5ZW5Pa2NJWUY1Y2VzN2Y3ODY2blVHOGVqNkFweVlQ?=
 =?utf-8?B?ekJQYnZBQjRIWkNTbUc5ZFhqLzE2NTlaZnIvWllTUkc5alE0Z2F1TWI2ZzVi?=
 =?utf-8?B?elJBYlNRbnJFcmpOQ2FuL2VtbUNRN1FDMGQvQ3ZUT2VYSElKZG9oS2dTdzdY?=
 =?utf-8?B?Qk1TVjRoL0lwQ0ZZVmJFNk9vMFZ5dktnaVFycE8wNzR4aGJsVkhHZXN1UHB2?=
 =?utf-8?B?RnBWNU9QTnh4VmFwNHdCVHpkTTYyanIrcjZiSUd1Q2dZZDFUM0VnaEFhdDM2?=
 =?utf-8?B?UHdEQ29xNFRwdm9nL24vWWxUTEcvdHNkNGUzdlRhL2ZVK3JKaUcwMWdjR2Z4?=
 =?utf-8?B?dkRyTmdWWjNuZFp3LzloeUJRc0lMUVZSWjdjd1ZNQzU4cG8xNmpnK1JsN2FZ?=
 =?utf-8?B?eDZYa0JvU3RMb2lpL0ZWazF4SEJVK2NEclk1KzVxZU95amxxV0ZseVV6Yzh1?=
 =?utf-8?B?c0pKenNpaWloUWp2a0dKZUc1V0ZlZFpMTlNuWmlEa21WZG40bldCS2JaU2VD?=
 =?utf-8?B?Y3dUUVMvVUM4d3dRdGlaamUrSGt3TXVsRDNZaHlIT0dOby9vVncvcGlpUjhL?=
 =?utf-8?B?TDZuQWw5dUFDTHlVMTFsQVZudFZxWU1say9TUFp0djV1b2lJUXdyQlpvNWdI?=
 =?utf-8?B?NlBuNXZwZGt0UVRWdFpJZ3ZPMlRhWktibzZGWDIzR1p3SitlL1QrdXk5c08w?=
 =?utf-8?Q?LE++6C4NNMgVzdyzBvKXNisDg?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(6049299003)(4053099003)(38070700021);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEVSZklVQ2lkRnVWUUl0T3dkWElhV3M5V24wb0ovU0JlcXRpSHhPRjdoTWtR?=
 =?utf-8?B?eUpuTk1WZWdpNVJHVUlEWEwxdW9Ob2lNaCtxempvUFJwMWJvYjJnRStBYStP?=
 =?utf-8?B?Q21FVFRvV1ZaUkJKUEpZd3Z2TG9NeElQRkdCVkp2TFZ4ZTEzeDExdlhPOXcz?=
 =?utf-8?B?dk9mMHhKMjJNWDF1S2RaVnhnRGZyT1dWclFXalV2am94d1RyWDJUVzBXUkZF?=
 =?utf-8?B?MzU1dElNMUk3VnBXa1VZOGJOM296dXhNWm9lRFluaFRTeGRMdDBsUkFlWjNB?=
 =?utf-8?B?eXBzSWd2U0hkRDVaZm9YT29FcHVEaHdtVmpzTkU1Vm9RUExzU0lobFltMFJk?=
 =?utf-8?B?QTg0VlppeU9RdStCWUZBT3IyZkV2dnNmWHJzVC9QOW1BZzJ6MWFndUxPeTVH?=
 =?utf-8?B?MmkzL1o4THZYbHhxZ3hReEpKWk9LcU9idC9LaTZIU3JBbDNncWtwZC9BeVdr?=
 =?utf-8?B?WFpyUjJLaldYMkoxL1FZTTlJWU5xa003dUZXZTQ2QnNhYVJrNDYvN3F5QWVM?=
 =?utf-8?B?Nmt3a0ZkWWIwVmVnVDNSc3dISTZFRytnTk91OW1zK1g2Z2c5RU90WVFPcEpN?=
 =?utf-8?B?L0N0dzJoa2FQc3FkbUMrR2dkM0hyZTdBNDZQZUVvTlcrNllyRGR4RXI5NzV6?=
 =?utf-8?B?RGlVTktKY1RRU0ZQSFZlejMzVTFpUlRSNVRiQlpjT012ckFheEx5Y0Rsd2JZ?=
 =?utf-8?B?UVZHS0llRitDdHpDQ2M2RGkza2xzeG41ZTRHSHl0ZXF1WHJuaUt1akRkelRw?=
 =?utf-8?B?d29Bcnl6aHc2bHNWNkZVSjJCTUxkQlBrSFhoM3JSOVlmbkE3eDFmOW5lVTNm?=
 =?utf-8?B?SzRMODhPNy9Ccm5VTEplem9PRHJVZzRSZ2J0VEUwZ0NoUWJ4RVRRTlpXV1Vr?=
 =?utf-8?B?elFKNFZ3aXdaeEFpUjFXcnpEdmxBNDFhMDRpYWhXNkNHUWh6K2dJbWY1Z1ox?=
 =?utf-8?B?c1dDSlowSnd4NGdtbDA2YStyTUVDWlZSekhncjQ5WjdySXlVdmVXVFk1WEw3?=
 =?utf-8?B?UjdvY0lSbWh4SCtkbG9laEQzRzN3aWc1WGJRSTFuWDhxM0N0VmJrZjJMRitV?=
 =?utf-8?B?dEtlSDd6dFJvSG1WVkp3Vlh0YUVTUUxnMlVxRnFEUStMdk1rakUyV3VhZ1JS?=
 =?utf-8?B?dlFITkFRSHNGRTNsYzVKcU9IaE1iQnNha1QvbGRwS1VkYXBxaktKa3ZTOUd6?=
 =?utf-8?B?QXRVTUJudFJadmZHRGNXbUhFaEErb3lTSi82alRsUmUwRGdCNUwrY2ZvRXJL?=
 =?utf-8?B?bC9LRk5nNEM1S3hGT2g5Sm40dG1tSEUzanNvVXl0ckVjbzUvVjFtUWl0Qzlw?=
 =?utf-8?B?RVJMV2orb3lEUkpoT0pMYVFOak51c1l2Q1Jic1dFUU8yZ3VuY1MyNU80eGUz?=
 =?utf-8?B?ckY4LzNENk5qNU9YOVNjeE4rZ3ZjL1RkZjJOUTJ4Z2YwQXZJRkNBY2lHQXJE?=
 =?utf-8?B?N28wdmdrZTdiMHNRNkxxaWFtZUJRSGw5a015SW12VmZZaFRCWnJLa3oyUHJN?=
 =?utf-8?B?Wko4Y1ZBaWtjVnMrcDA1WUlSeGo1b2dTNjJpdHIyR3FkUWtlYWk5djlCVWNy?=
 =?utf-8?B?QXU4KzBJNWU3TS9jcXQrcWlYZDhtcDB5dE9GblNYa3hDb1NYOGZqbExSbHJB?=
 =?utf-8?B?ajg4dFpwS0lyTHZUQWsyaWMvMjB3Q25IS04xR1BOWFpTU2tFSWQwU2Y0cTh0?=
 =?utf-8?B?SlFuYWZoSHZDMTRGV1JTVlRXSDlrY09DbnJQaVdqZFlacUM3QUZkK1RpOTRq?=
 =?utf-8?B?b3Z5dU5nSm9EeTlVaDlMaExtWnJyK0pJbTVJQWJpTjNvaGxUMDl4ZmhLalo3?=
 =?utf-8?B?em55VUpPS0tZeStRK3l6K3l4VnlZSmljSG1vTjlmcEhFZWlJdHdzbkNOT0s3?=
 =?utf-8?B?dnNSOHBTNDhWelcxdUV3ek5yemlEcXpYdldPeHp0b1YvSjk4dHNBWU5EaGhS?=
 =?utf-8?B?cURTOW1nKzBHc0hDSWYvOEk0SVkwbnNia09taUhoZDNHSTRtOUxRSHBMWlVT?=
 =?utf-8?B?UFppdFd3TkEzOW5MbE9Jcld0dkFoMndLTDBaS1VkOG9lbzZzMUNyWlB5c09W?=
 =?utf-8?B?K3FSTXpSUFB0UzdCZmxGeVlIcnAwRlVRSGtLaW5DTnVlU0hPYWV4L0Q1akhX?=
 =?utf-8?B?c2ozb2NibnIrUmRIdzVsUlZ3aXNTd3dwS3FvOE0vc1phblphK1dETStWMi9t?=
 =?utf-8?B?UGRpcERpWXcxQ2k5M1dsdm1haFB2c1pXcVpOT0wrUFdZT1dtcG5WYkVNa0tn?=
 =?utf-8?B?MERvU2M5eTlzaTVSd3FiVUFYVE9DSWY3Wk9UdG9PTFVqNGQ4aGZHWDZqcTd2?=
 =?utf-8?B?Q2hkbkZxa3VDcXkzVDVaR2UrYmpDUnZ6bkliMkV0WW5aeHIrclk1SEh5TmRq?=
 =?utf-8?Q?IZ16h7QyCuWqMb2c=3D?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EksJh1TDy0tjEIvQmcjtf5Sg"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1abddedd-190a-42b3-3e65-08de6a152223
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2026 09:00:13.2662 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xWr5C97pZodoyu28SE+tWA3AbEQ3TQMuewRM8mkPsFzo4DIQ5eseEr8lsCpgGvIOwQk6wfkwycsiAgo7CqnEfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6852
X-Proofpoint-GUID: LjfiNpkzvobFJqZz3o3nISKhSXFBkZAH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA2NiBTYWx0ZWRfXz2nREHlNjIHz
 RzgsW6N/wLUL9IBIZnMS0AqHyI0xAALfG54pjeYY3fSTggyund2w7bgTdBg8IDBQEhw+cptOBU/
 +KHZoJd/aSnWi7NTQ/40Qxt1VYnEE8dIJJDEh8mmNOhZsvQZoxuK7YP1hdO7vtquTLdGwJp3VOL
 iREu9xLz2F+049GGVy/D8FyP75b0Qf7jDMBdRFU9Qe25ej+f7bEmOcEvlKb74wngwLifP0JdibE
 hqzIJRwfKsFfHwD/eCjt4OwS3jOJGAGKgidfgJp7GrwLCSZhlimQMZcIyXb1Iuuw2GoZnu8LJ8o
 7vOkKiivshE97AhFO4sde9M/EWgEuAJ2nT/CDlXMUHlIrBxXcb25wy29WH5jmd21936Q/+lFok3
 uFt8Ovyb0EF7dLv0sADT30jxNzPvYsC1bjCCy8sU5FGmKAuc3JzAOu60tn5NXVEMSoU8hKsYvXx
 8rupjZkcd6z95jx1XCw==
X-Proofpoint-ORIG-GUID: LjfiNpkzvobFJqZz3o3nISKhSXFBkZAH
X-Authority-Analysis: v=2.4 cv=PbzyRyhd c=1 sm=1 tr=0 ts=698d96a4 cx=c_pps
 a=vmQjI8VvDBZ713WXavw2+A==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=r_1tXGB3AAAA:8
 a=mv4TviRTgonZbiyJGFcA:9 a=QEXdDO2ut3YA:10 a=UUDIWePPIW8dn_A_HTQA:9
 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812,IMGTecCRM.onmicrosoft.com:s=selector2-IMGTecCRM-onmicrosoft-com];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut@mailbox.org,m:geert@linux-m68k.org,m:regressions@leemhuis.info,m:Frank.Binns@imgtec.com,m:Brajesh.Gupta@imgtec.com,m:Alessio.Belle@imgtec.com,m:Alexandru.Dadu@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:regressions@lists.linux.dev,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux-m68k.org,leemhuis.info,imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	RCPT_COUNT_TWELVE(0.00)[17];
	RSPAMD_URIBL_FAIL(0.00)[IMGTecCRM.onmicrosoft.com:query timed out,imgtec.com:query timed out];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[Matt.Coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[matt.coster.imgtec.com:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Matt.Coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[imgtec.com:+,IMGTecCRM.onmicrosoft.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F37E112BA02
X-Rspamd-Action: no action

--------------EksJh1TDy0tjEIvQmcjtf5Sg
Content-Type: multipart/mixed; boundary="------------x7AFdojGLG2TMCnRyZcn0ZmK";
 protected-headers="v1"
Message-ID: <3e0def93-2f6c-4bcf-8ee5-bf607f2ca382@imgtec.com>
Date: Thu, 12 Feb 2026 09:00:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/imagination: Convert to
 dev_pm_domain_{at,de}tach_list()
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Frank Binns <Frank.Binns@imgtec.com>,
 Brajesh Gupta <Brajesh.Gupta@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <194465eda54d1f852a9226cf691ddc5aa208e0a3.1769097977.git.geert+renesas@glider.be>
 <ffdf3982-e22c-4d01-afa6-5449ed381000@imgtec.com>
 <CAMuHMdWMh_oJFg-KtapcTDGvYWZ-hg_ZEJ2=E5Tp1apOEc8tnQ@mail.gmail.com>
 <b3b4f10e-1222-44f7-b308-db7199c67147@mailbox.org>
Content-Language: en-GB
From: Matt Coster <matt.coster@imgtec.com>
Autocrypt: addr=matt.coster@imgtec.com; keydata=
 xjMEYl2lchYJKwYBBAHaRw8BAQdAOYlooFfHTXzAQ9aGoSnT9JS9wq8xprG+KVLbkxJDF5DN
 JE1hdHQgQ29zdGVyIDxtYXR0LmNvc3RlckBpbWd0ZWMuY29tPsKWBBMWCAA+AhsDBQsJCAcC
 BhUKCQgLAgQWAgMBAh4BAheAFiEEBaQM/OcmnWHZcQChdH8KkDb5DfoFAmgHpowFCQlsaBoA
 CgkQdH8KkDb5DfqxDgEA81pbVLJDmpFyFZLRhAGig9rgoDY6l774yhTzRVm/SvkBAJLzpSlm
 wyQaQuB668TKOX9XvRLKFGjSq5kkdQcxqjkCzjgEYl2lchIKKwYBBAGXVQEFAQEHQCaVC8X5
 7NOv2jNbeXqjP9ekY7rzy7auiEZ5PxaDWUQVAwEIB8J+BBgWCAAmAhsMFiEEBaQM/OcmnWHZ
 cQChdH8KkDb5DfoFAmgHpowFCQlsaBoACgkQdH8KkDb5DfoK+AD/Q4aN/zUvP72RRE4cNWpM
 MXeRXg+LTN+OJ24U10LltxIA/2w3kDqMC/0t1oqO8TM+c2LMWO/x2IBkG7oRZ/hVw1QI
In-Reply-To: <b3b4f10e-1222-44f7-b308-db7199c67147@mailbox.org>

--------------x7AFdojGLG2TMCnRyZcn0ZmK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/02/2026 19:17, Marek Vasut wrote:
> On 1/23/26 2:50 PM, Geert Uytterhoeven wrote:
>=20
> Hello everyone,
>=20
>> On Fri, 23 Jan 2026 at 14:36, Matt Coster <Matt.Coster@imgtec.com> wro=
te:
>>> On 22/01/2026 16:08, Geert Uytterhoeven wrote:
>>>> Call the dev_pm_domain_attach_list() and dev_pm_domain_detach_list()=

>>>> helpers instead of open-coding multi PM Domain handling.
>>>>
>>>> This changes behavior slightly:
>>>>    - The new handling is also applied in case of a single PM Domain,=

>>>>    - PM Domains are now referred to by index instead of by name, but=

>>>>      "make dtbs_check" enforces the actual naming and ordering anywa=
y,
>>>>    - There are no longer device links created between virtual domain=

>>>>      devices, only between virtual devices and the parent device.
>>>
>>> We still need this guarantee, both at start and end of day. In the
>>> current implementation dev_pm_domain_attach_list() iterates forwards,=

>>> but so does dev_pm_domain_detach_list(). Even if we changed that, I'd=

>>> prefer not to rely on the implementation details when we can declare =
the
>>> dependencies explicitly.
>>
>> Note that on R-Car, the PM Domains are nested (see e.g. r8a7795_areas[=
]),
>> so they are always (un)powered in the correct order.  But that may not=

>> be the case in the integration on other SoCs.
>>
>>> We had/have a patch (attached) kicking around internally to use the
>>> *_list() functions but keep the inter-domain links in place; it got h=
eld
>>> up by discussions as to whether we actually need those dependencies f=
or
>>> the hardware to behave correctly. Your patch spurred me to run around=

>>> the office and nag people a bit, and it seems we really do need to ca=
re
>>> about the ordering.
>>
>> OK.
>>
>>> Can you add the links back in for a V2 or I can properly send the
>>> attached patch instead, I don't mind either way.
>>
>> Please move forward with your patch, you are the expert.
>> I prefer not to be blamed for any breakage ;-)
>=20
> Has there been any progress on fixing this kernel crash ?
>=20
> There are already two proposed solutions, but no fix is upstream.
>=20

Yes and no. Our patch to use dev_pm_domain_attach_list() has landed in
drm-misc-next as commit e19cc5ab347e3 ("drm/imagination: Use
dev_pm_domain_attach_list()"), but this does not fix the underlying
issue of missing synchronization in the PM core[1] is still unresolved
as far as I'm aware.

Cheers,
Matt

[1]: https://lore.kernel.org/r/CAMuHMdVOUzanEufhWqOL0nv81xCYh4YNAX_waG6y9=
PyUZ030tg@mail.gmail.com/

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------x7AFdojGLG2TMCnRyZcn0ZmK--

--------------EksJh1TDy0tjEIvQmcjtf5Sg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaY2WnAUDAAAAAAAKCRB5vBnz2d5qsIGi
AQDEKKtMx7sMKboXha+H4xuoWPSd3jP6H329Chm+nxaViwEA5QMupP8a7VNUARn+wc1CluSDGQV5
5bGrhT8R5lK0ygY=
=cwXH
-----END PGP SIGNATURE-----

--------------EksJh1TDy0tjEIvQmcjtf5Sg--
