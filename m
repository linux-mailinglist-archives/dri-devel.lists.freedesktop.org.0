Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KrlLM0dk2mM1gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 14:38:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D25143E6A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 14:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5769D10E398;
	Mon, 16 Feb 2026 13:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="AV+Yu0au";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="TZ/GSSGd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B0B10E398
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 13:38:17 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61G6SIed4011941; Mon, 16 Feb 2026 13:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=Jth3YX+jtSNJA9uMXsKFcFJ4s
 4ePKcwZ1pPKu8kVIyU=; b=AV+Yu0au2DlQpY1dT+HDcKRu3zrb2J63OxdjkDFEM
 QxR0S5oMfHJ0goy1ufnBMM0RcRzl4xH+vxom4/wXdPJ5QaPpwEzVwDvw6t0ftdTM
 qqZ+tB1bT3MnPVAShhnN/eq78Ny6D5PRy/LRjeLDHRUqp6hRtlCWn6BpdPPbKBvl
 JZILOlpERxegipGRJk7IEEy34sFL1Ild60UKL1DHPISJ79m+NADGmuBcOdUHawj5
 DGMfPkuUrSxsPLVAGvT+49TMT/blbA36LM8zt5Ugb3BcN28NU9Wj547AfRRaX74e
 lQPaBPap27WI8DUozQWxk84jtXOX7/3JzC+St7nlnRfXQ==
Received: from lo0p265cu003.outbound.protection.outlook.com
 (mail-uksouthazon11022099.outbound.protection.outlook.com [52.101.96.99])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4caj0w9gqg-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 16 Feb 2026 13:37:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDgC4jsubNInvQBwXWT1AJ0daLX33Vlwk/qykW9QC3x5JRHwQvfoHfNkpr/rnN55GTyP47Epli9X45G2A9x6z88k3KdzQl4cZqVdhCOUTSNT2STDbaqXeJ3OF1AYqIhYVFSgvCvPiStxlc7g891yrLi7hdrc4joaT+EW4og9lQ9qtE1bqBzuiHqTPfh1TAkto+XFdossts/vz8NBBCCik8qPaA7EDwFxLQuvGRrPK9lA+0bIrER7uqf34LDRTriWAjkFu1eqnnW7fbhuagX9eTX8Ll62bmxYlMOv57cvkuq4EwN2w6T3Xkie0M13ccO1X798zbpw8wZ0b4P2wM3WCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jth3YX+jtSNJA9uMXsKFcFJ4s4ePKcwZ1pPKu8kVIyU=;
 b=qUh2hLR7EhVydbsFosOVrrzg+a2P/TAcwnKPMt2Ue9GnM+RKq8woEA22b9tpy+PjB9CLxVkHarkfIrbVN63SPudbubM9/MYFVppcil8EipgzCXch4hOt/E3TuZKN5XaTDsjEJgjU3xpErU5VoLwKmaLiGBDcbX7ZTKUJqRvHH8uIpZGdJTnWKVrdsVa/8Edv9imEsXIM/SLMRKxdW/KYcCgLwXJ8IDdNTQdbPdGvrkx3nC/AA2fMVEa9SjChZ8brIWqpKjwV83ir8CnX6fHShkOwiLxGfj/EGrM1a7hmMDDPEfP194SqJrtFLASpq8n972yw/e+Y15MRnrGkNTpTXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jth3YX+jtSNJA9uMXsKFcFJ4s4ePKcwZ1pPKu8kVIyU=;
 b=TZ/GSSGdoOEU1ki+doTwA3fTfhrV6x4i0zk87xFLbwZsHkXCESX9bVsEHJ4wuRkFVttIKlL7nnBuBapN2kfPA6UcY4ENjsk25B8O/e4gFHgluE6tcwSktObH8qqg7a63rWIsUUKn3OZIjslmVoZc/S/JkTyzldpa6rDY9piCZYg=
Received: from CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e2::14)
 by LO0P265MB3066.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:174::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 13:37:55 +0000
Received: from CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f32f:ed34:4f98:6cd6]) by CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f32f:ed34:4f98:6cd6%6]) with mapi id 15.20.9611.012; Mon, 16 Feb 2026
 13:37:54 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>, Geert Uytterhoeven
 <geert@linux-m68k.org>
CC: Marek Vasut <marek.vasut@mailbox.org>, Frank Binns
 <Frank.Binns@imgtec.com>, Brajesh Gupta <Brajesh.Gupta@imgtec.com>, Alessio
 Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [PATCH] drm/imagination: Convert to
 dev_pm_domain_{at,de}tach_list()
Thread-Topic: [PATCH] drm/imagination: Convert to
 dev_pm_domain_{at,de}tach_list()
Thread-Index: AQHcn0l0aKMV6TR82km8aUPdofu+Ow==
Date: Mon, 16 Feb 2026 13:37:54 +0000
Message-ID: <86e23062-e439-41f3-9750-d87fa5b85447@imgtec.com>
References: <194465eda54d1f852a9226cf691ddc5aa208e0a3.1769097977.git.geert+renesas@glider.be>
 <ffdf3982-e22c-4d01-afa6-5449ed381000@imgtec.com>
 <CAMuHMdWMh_oJFg-KtapcTDGvYWZ-hg_ZEJ2=E5Tp1apOEc8tnQ@mail.gmail.com>
 <b3b4f10e-1222-44f7-b308-db7199c67147@mailbox.org>
 <3e0def93-2f6c-4bcf-8ee5-bf607f2ca382@imgtec.com>
 <f5d3dde6-edec-42f4-93cb-459c8677245a@mailbox.org>
 <f82b7734-6ddc-4029-b38d-147e9a1de021@leemhuis.info>
 <fcf5ab75-029e-469e-8b2a-51fa5c2a2374@mailbox.org>
 <95fd3f52-c3ed-40c5-920f-11e8767f701d@leemhuis.info>
 <CAMuHMdV-g+3kTaG6Ost4iHo1Tdi_H=qscLBkBRWuR+6DG5c=SA@mail.gmail.com>
 <1e8e416e-e474-4288-9686-1ba2b88e4946@leemhuis.info>
 <21b1fd77-252e-4fb3-aa65-1c26043c5412@imgtec.com>
 <9c1b2671-3374-4d84-ad14-07dd499bb934@leemhuis.info>
In-Reply-To: <9c1b2671-3374-4d84-ad14-07dd499bb934@leemhuis.info>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB3393:EE_|LO0P265MB3066:EE_
x-ms-office365-filtering-correlation-id: 3ae79029-3665-4e97-0db3-08de6d6096bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|6049299003|38070700021|4053099003|13003099007;
x-microsoft-antispam-message-info: =?utf-8?B?eTBGYWdrWWVIZzNCVkJSNVBxWU05RzVHeGVRNVo0NjJWUnNFZWNOcXlBMEd1?=
 =?utf-8?B?TC9HMndwSnk4Sm1COVdsYzgyaWFzUlNha2xvUE1vcDhCSWlwSy9ud25XZXho?=
 =?utf-8?B?OUQrRVlCc20rNXBRcTA1REkrbVVrdDFwZWFMVTZ0aFIvNVVIQzJOZjg0Tk85?=
 =?utf-8?B?a05neUpTNHNURkliWHdSR21qUEpJS3dkbFNNczRTT2tISTFLRGVZVWpXZFcz?=
 =?utf-8?B?a0NTUC9wVDlYbWFIbnl2Mm5Ja0pkOXk3djFtaDNMbXFzdmVoaitlNWVHMy8w?=
 =?utf-8?B?TittWTBTZkZld09DSld3L216QU1YM2dyVDhoelAyaU1hN1dUVVhrNHJZWHdh?=
 =?utf-8?B?MjdnR21lWVl5MHA5SEFOSmVZOTEvNDdmaThRZG1nYTBHVHZzRlNZZmNWZGtC?=
 =?utf-8?B?ZGxicXVQNFB5WU9TSThBSDFmR2ZFbEg5MElrU2swdldpT0hsejZDKzlmV3J5?=
 =?utf-8?B?TzJucm9HLzdUNldZRUlLcmc2aXZXYXRVMlhPYUlrUC9FNVVNdDlLN3hhelpa?=
 =?utf-8?B?dDlNM1VXZm9rdEpUYUFTVHNoN2FWN2VTc0xXbmVMUi9yRElyYnh0azVpSVNL?=
 =?utf-8?B?MXBXNFE1R2hyWXlqSFVLemgwZlhUaVJGSkVEcEE0UUtXK0puV3RtL1BsZ2M0?=
 =?utf-8?B?WG5ON3ovYnRtT0w2bzZ0aWtVYjVoNWNFT05uWTRPdFR3bnkrZlE5aXZteWlF?=
 =?utf-8?B?UWJmeFZ0WEpLRUt1RnBOcEdGcXQ1b2hNdmw3b2RTbkd5cUVkaUR2ZVh6cGIr?=
 =?utf-8?B?TDFRbk5iRVlSU1V5andqNVpPY3dVb2tuNC9mSUhWV3p0UDlJWmptb3JMekxR?=
 =?utf-8?B?Uk1hdXA4RjlOZEdIbktqa05RanpNamJlczFqT0owMjZiWVd1VUMxUUFkUmNH?=
 =?utf-8?B?OEZlcWUyUmxHT0syNnRhcnI1Qk1xS1FUelAvT0pYZHZKTHlNRjdmYWJzNTRk?=
 =?utf-8?B?bmNwT2xJVUFsaUp6ZWZETDU4aXU3b0tHbllMR2FDcGJqWWhRUmtOZGNvWk9q?=
 =?utf-8?B?TU9Sc0ovamEzbW5EL0d5TS9QN2lRazQrT3FFYTl0UUxCWnhGMW1pQ0t2YUU4?=
 =?utf-8?B?cTNwR21DeTdlb3VlcHhibWl0UU5mMVR6YjJDcVpCUnZGRUErVXh2V1RQRWJ2?=
 =?utf-8?B?Rk1KKzJDS3JjYy9xampzNFdGakpYYSt6UjAzaU1meDNnQnR0bEtwUTkvODRp?=
 =?utf-8?B?V3gySEtDT0hNZm43bUhvb0JZakNqWnIrUHlYMUJuQS9rRE9TakQ4OFkyWjVR?=
 =?utf-8?B?OEZKMmtwdE5XZndzc3RkQitFUjBWcXFCWnVlMmJlKzFXMzRhWmtUVko1VTcx?=
 =?utf-8?B?OHYxUHZiVi91Z1NLb1ByN3N2dm1MdGh4aUMwK0dwbEozaFRBTzRSNUcrWjg4?=
 =?utf-8?B?ZDRTd3JmNENkZzBadW0xL1BjbmpjRVlSSjlUV280NWpLWWdCYnNhMmxjUUc2?=
 =?utf-8?B?V25MT1NTS3RRK054SHBqSlAvQnJOQUdIZFlpK3RLM1RiblpUYUQ5M1Izc3JX?=
 =?utf-8?B?MDNzaVA0aEdjNEttZ0c5N09KR09PZk51R2hPRVp6Zng5VDV3MXpsQUJFd2V5?=
 =?utf-8?B?QmlZS2o2eU9NU29vdXhDdHBMODRmMHh1K3hRbjg1ZkxQb0xCQ252WjZaWWwy?=
 =?utf-8?B?eFFPSFBUU2h0UjViT2xFM3B5VkxuZ3hoTGhYbE0xblQ4cER3SFZMbDMrTFF3?=
 =?utf-8?B?N0FDRjFGNEFjVjVTMHdXaVd6c1dzbVprSmtnWWVXR0x0REIyN2ZCbUJqZ3Mx?=
 =?utf-8?B?YUZlVGlja3ZqWFJ5bkdlemVFMG9sNkMyTjNNK0NPS2RLYXd3VjJuejI5QkJC?=
 =?utf-8?B?WnFwTGVzcU1KNmU0OHRHakJ6cm5JRDIweUlIa3U0Z0ExOVBPWDcxSlBuandP?=
 =?utf-8?B?YlVMMVY1Z3J3S1d6Tm1zQjRwNG5ncUVNYmNNSjU2bTJBNUE3K2JaU0phRWl0?=
 =?utf-8?B?L2ViaFQyMDRSSXBlVWRPNkY4Q3F2UTZqc1BiWWhJeWNxaElkYUVUeHZlb3ZM?=
 =?utf-8?B?cjRad21XeUhtdGxEeFBadU8zUFBUYjR4MUtVOE9JNmluZDMrT3k5WCs3ZFRu?=
 =?utf-8?B?VE9LaHBvUzQ1MnNtTXZsYTBOajY3MS9EcW1XcVAxTUtsMlVhSWRGOWlzVFgx?=
 =?utf-8?Q?aOzrwOKI+SUMKDMfahmobif0A?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(6049299003)(38070700021)(4053099003)(13003099007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHJ1M2I3a01nNVNUNHl2Ri9TUTdtUGpnUTJoTC9teDhpcjZ4TjJDK0tFQVZ6?=
 =?utf-8?B?UCt0Tm02NzBpeW05NmdESnlRZVNESnAycnBxTUozMWEzQzh4R1hUWGJSUUlx?=
 =?utf-8?B?ZnljbThKakoyZGRZZG5aN3JnNVhDZzJVZnBKY2M5cTc0ZU0wMWpHMWZ0Rzl0?=
 =?utf-8?B?TU8xL00zWFhsY3VSNlhuS1NTb3d3YlM2dDQzdU1oNGlnZG92RDBJa3lTaXBv?=
 =?utf-8?B?bzN1bUxUbEZUdnY1OE9veWRzZTBIczBoZnd6eHdjS20xeklzY3RlVnY1Mko2?=
 =?utf-8?B?dy92QVV0QXh3Y1Q5cldNeFlNbUJKRzBtUlowaHJZMHRENWlPMlp5QWh5SXNl?=
 =?utf-8?B?Nkg1cXI5VG1Pd3J6d0ExTTVmcVZXUVlMbGNqMjAzMlZjcHZ0WTYzQ1dsSnBQ?=
 =?utf-8?B?cHU3ZlRDbE9Gb0h3d2NIazJ3R21jR2F1ZkxFR1BEZFJaN05PN2djZ0F4Ty9j?=
 =?utf-8?B?WVJzdXVXK3djK2RDbHdReXVRZkZ5OEJlRWptMCtkT00vNDBmcWZTSXNhTm04?=
 =?utf-8?B?dzI5WkJpZklrUCsyYk5ncmdmWWxreFhaYUt5ei9mVlJSOFhNKzQ1b0ZvN1BU?=
 =?utf-8?B?NjRnd1NyVFViSTZUcUlWM0ppVU1tU054d0lXY295eEZGN3hsUHJQZ1hjcktm?=
 =?utf-8?B?cVdPbmQ0RVRuMWpWc1ZKVkFxYmQ2b0ZrRzBhRzI2N2ZhUGVzd0NOaWs5TXNr?=
 =?utf-8?B?UlhaOWRkQVgxekVLRE1PSUIyWlB2bWxITUxGSmoyVXN6NTVyTXhHVUdrOTNC?=
 =?utf-8?B?ODl1c2RHTDlBSSt0d2Y0cE5YS045bEt0TWpWZDlMRTM2c1JsYStXQnh0NFEx?=
 =?utf-8?B?eEViazNrdnhEYnE3WHZVVTNlTkxSbkE3M0k4L3AvbWxpZjVmUjdDbVdpbWp1?=
 =?utf-8?B?NUhMTkdXVzdsYjErWHI2cTlUZlU5SVd3WHZzZndOdEJJeDlCV0drQ2ljUFYr?=
 =?utf-8?B?WnZjZ3hXbXVBUm5QWWFGOGdnV3cvc01OWk80czJpeTNnU1crOURmSlZVbDZG?=
 =?utf-8?B?NjBaNFFpOTN4L3hyTmI2Ym1NUkVnTzEvNWcrd3JzVVAvcUFnbTlCVnEwSlAy?=
 =?utf-8?B?QTJDZ0FTYkNrM1g4M2pUbkVtK1VyekVMLzRDK3cwcE5BUVk4NFc0cG1YQ0Q5?=
 =?utf-8?B?Wkk0eE1mazRTVFZEcWtJOUFNckV5R2UwQUZuaGZ1U1Bzc3pjdlVTQUwwL2hm?=
 =?utf-8?B?YUIwLzNoZzliQ3ozQkNPYmdUTlY1MzZqNkVNTkE2V0h6RTZUdm1EMlltVmxO?=
 =?utf-8?B?WFFGdG80Y2dST2RPdldpQkd2ZHo2Y1pYSjdqUk5abHc3RzhSRnZxcGIwdk5M?=
 =?utf-8?B?bjFZczdPVndkWXNRZFlhRkQrZGt3K1Vnc3hGZFRpT2R6ODdHWk5TUVoydytl?=
 =?utf-8?B?OEorS2tiRmIzTERJMHVMWWgyVTlORGRYS2J2VU5qZnVQTjZCbzdwR0dSRlVV?=
 =?utf-8?B?bzZBOUhIekhrNWh5MEhYOExyT0xPT3A4SXNyVVFWTGh3cFRJQ25UVnNETEZx?=
 =?utf-8?B?eU03aGpLZ1hVcEV2b1l4NzdRcEt4ZVpiODdqbEdhS0RkS0lIS2FZSEFUSkNE?=
 =?utf-8?B?Z1o1dE54N3Y1MURkNlh0aTU4TFFoR3R4Q2xNMFBVZ0QrK28wNnVuS2tEbERy?=
 =?utf-8?B?VXFPOXhLeS9xQjY3RDkzY1BLOWorOUR6eDdmbXRuZ25keDlSb0Rad2dFVWh3?=
 =?utf-8?B?b2JQb3MyTjl2dHNPSEZrNjdwZDNERElya1BJemZ1Q0dITFRLZnZFUmdwaDNF?=
 =?utf-8?B?RkdoUkNkcjlhN0J2QUtqOEorcDBHbE8xK1hkdVhUMy9wRlRtVWF6UmFqb1gy?=
 =?utf-8?B?Mm1sQ1EzUExabFYwVmE2ZkEvZVNoa1BMVlB5TUtsU2ZHeUo2OXFobHNWaWdq?=
 =?utf-8?B?UXQybVByRHhieGFsMFBteFBRMDZFdFdUVTd1WVl4dzRZbWIvZmNXMmQ2ZlZE?=
 =?utf-8?B?MkpiV3ZNWk9tcGpKQVJYQlZOazhpV0gyRzl2ZStSenVxNU5hWU1qRi9vNlk1?=
 =?utf-8?B?eDZvZnlySzAyQkV5Q0toclhxTCtHcXQxTDNob05XN2lGZXIxUzdiVnpLOVpR?=
 =?utf-8?B?MWx1QTkzcVp4OXRuUXZoamNJMnFCY1I1RTNFNEV3Q0toZUdQYURwYUhFZDJL?=
 =?utf-8?B?eTdrV01yVUZOV04yNmtmckRZaWVSUHNLczhYamFxZmdoV3B6RDNpTmZzN3l6?=
 =?utf-8?B?R2ZPNExNYnBrUFYybFFLN3dCeHlsM0g0RlVpekZEQVlEa2R4a2hXNk50NGF1?=
 =?utf-8?B?Z3VmWUpKMlZBd29kS05PNjNZT0R2TTRPamxWZnNzbE1YR0VFSUxiZzVSVmEv?=
 =?utf-8?B?ZGJUZVlISEVpaVJMNmthdTJvRHdxM3JLMnJYM2ZaQnZubjJBaENEMEhCV3pi?=
 =?utf-8?Q?vJr+egg+KoVbiwP8=3D?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2zGBjfqNHKQO5Tt6wCaaYggw"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae79029-3665-4e97-0db3-08de6d6096bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2026 13:37:54.6208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y5qfw/Hp8VSV3bJV+EHFdFLtQkJOs+Ifsq6nfPrFd0TP7+KlBQNyMJinFedSka8pmDpfHsatMM3vREcN0kPB4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB3066
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDExNiBTYWx0ZWRfXxVfGb2xg5HtY
 bNPqfMw6csyQRNmlQsQ/mfhxW9jI4psnqckfb54BcOqaE49ndVxtXva2IJ+kDue1zjGCo0ql6O3
 26FbsIkAZRAkVRiEMZWw6xw0tcIQ+vySxcmeyms6nQcO5sMOqnWWpZzSQRArlgk4YWD2eZ+R5BX
 4e7N0BXBPhwWgXLjEUDqDYNpTns6U65qxik1eh+vM2hOny9IyZbfdeidy+X1Pf4x0CSd6g/3uds
 gkVoHClxnytkC2pz/xuA6IFdhUnEqX1L2kph8lY3i2k5mJiXldLj913pB9u7ucvhIOaSc8OKSmd
 GSo3UX/8e+u6NbScp4Y6op6IgI0MOs4R4IapVqJP1M7fH+QltirZJJ9Igllm/PY+pvS2EhtfMQl
 tY6c2w19qKs1D6LBGYwBErk//F/MNkiTL4IJHU18X1OqviYE/GR8/vVpDdQXwBtkQuzt9cLNRIh
 L7rR29/4smbBcGNT1WA==
X-Proofpoint-ORIG-GUID: DPZPLGJnUPJyqF-PPobuL6OrDZ9szudi
X-Authority-Analysis: v=2.4 cv=S/rUAYsP c=1 sm=1 tr=0 ts=69931db5 cx=c_pps
 a=2Ko8lJ8n80rQhDUbKm7FCg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=r_1tXGB3AAAA:8
 a=U0GKiOAZ6DAnRr0auJkA:9 a=QEXdDO2ut3YA:10 a=fgSp1glFwSKjkWOo9pIA:9
 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: DPZPLGJnUPJyqF-PPobuL6OrDZ9szudi
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812,IMGTecCRM.onmicrosoft.com:s=selector2-IMGTecCRM-onmicrosoft-com];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:regressions@leemhuis.info,m:geert@linux-m68k.org,m:marek.vasut@mailbox.org,m:Frank.Binns@imgtec.com,m:Brajesh.Gupta@imgtec.com,m:Alessio.Belle@imgtec.com,m:Alexandru.Dadu@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:regressions@lists.linux.dev,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Matt.Coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[mailbox.org,imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	HAS_ATTACHMENT(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[Matt.Coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[imgtec.com:+,IMGTecCRM.onmicrosoft.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imgtec.com:mid,imgtec.com:dkim,imgtec.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 08D25143E6A
X-Rspamd-Action: no action

--------------2zGBjfqNHKQO5Tt6wCaaYggw
Content-Type: multipart/mixed; boundary="------------yEM0hQ2juY0WBZixlmhkvG8m";
 protected-headers="v1"
Message-ID: <86e23062-e439-41f3-9750-d87fa5b85447@imgtec.com>
Date: Mon, 16 Feb 2026 13:37:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/imagination: Convert to
 dev_pm_domain_{at,de}tach_list()
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>,
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
 <3e0def93-2f6c-4bcf-8ee5-bf607f2ca382@imgtec.com>
 <f5d3dde6-edec-42f4-93cb-459c8677245a@mailbox.org>
 <f82b7734-6ddc-4029-b38d-147e9a1de021@leemhuis.info>
 <fcf5ab75-029e-469e-8b2a-51fa5c2a2374@mailbox.org>
 <95fd3f52-c3ed-40c5-920f-11e8767f701d@leemhuis.info>
 <CAMuHMdV-g+3kTaG6Ost4iHo1Tdi_H=qscLBkBRWuR+6DG5c=SA@mail.gmail.com>
 <1e8e416e-e474-4288-9686-1ba2b88e4946@leemhuis.info>
 <21b1fd77-252e-4fb3-aa65-1c26043c5412@imgtec.com>
 <9c1b2671-3374-4d84-ad14-07dd499bb934@leemhuis.info>
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
In-Reply-To: <9c1b2671-3374-4d84-ad14-07dd499bb934@leemhuis.info>

--------------yEM0hQ2juY0WBZixlmhkvG8m
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 16/02/2026 11:38, Thorsten Leemhuis wrote:
> On 2/16/26 11:58, Matt Coster wrote:
>> On 16/02/2026 10:11, Thorsten Leemhuis wrote:
>>
>> We're currently trying to force this issue to reproduce on hardware we=

>> have on hand; we'd like to see it fixed properly as much as anyone.
>=20
> Yeah, no worries, I never doubted that. But getting things properly fix=
ed
> can mean "revert, fix, reapply" when it comes to regressions in Linux -=
-
> which is something that should not be seen as something bad, as Linus s=
aid
> himself (see below)!
>=20
>> From our side at least, I don't believe this is a regression at all.
> In the end what matters is: some change afaics caused systems to not wo=
rk
> anymore that used to be working -- that makes it a regression my the Li=
nux
> kernels standards. And those by the same standards must be fixed, ideal=
ly
> quickly. Find a few quotes on that from Linus below that explains this
> better.=20

I feel like I should reiterate that the commit we're talking about
reverting is fundamental to support for one of the only two platforms
currently supported. And that the changes to add "support" (just
bindings and DT) for the affected Renesas platforms came several months
*after* this.

The "regression" here is that we allowed DTS changes to land for
unsupported platforms in the interest of allowing further development to
happen incrementally upstream. There has been no further progress on
that front beyond the DTS patches, however. We have never declared that
these platforms should be functional and error-free, and have taken
measures to ensure this is clear to users[1].

There are currently two platforms on which this has been reproduced:

 - Renesas Gray Hawk Single (R-Car V4M) -- this was the original report
   from Geert, and it should be noted that there are no bindings or DTS
   support for the GPU in this platform in tree at this time.
 - Renesas Salvator-X (R-Car M3-W) -- this was Geert's follow-up
   reproduction case, and the upstream bindings and DTS do contain the
   GPU, but it required adding delays to PM core code to trigger the
   race condition(?) that causes the crash.

As far as we know, there are no other situations where this crash
occurs.

Would you consider a suitable "revert" to be fully gating support for
these platforms (or even the entire group of Renesas platforms added in
this "experimental" manner just to be safe) behind the exp_hw_support
paramater until they can be properly tested? Specifically, I'm talking
about masking them off at the of_match level so that no hardware
interaction is even attempted without explicit user opt-in to
experimental hardware.

Cheers,
Matt

[1]: commit 1c21f240fbc1 ("drm/imagination: Warn or error on unsupported =
hardware")

>=20
> Ciao, Thorsten
> ---
>=20
>=20
> On how quickly regressions should be fixed
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> * From `2026-01-22 <https://lore.kernel.org/all/CAHk-=3DwheQNiW_WtHGO7b=
KkT7Uib-p+ai2JP9M+z+FYcZ6CAxYA@mail.gmail.com/ >`_::
>=20
>     But a user complaining should basically result in an immediate fix =
-
>     possibly a "revert and rethink".
>=20
>   With a later clarification on `2026-01-28 <https://lore.kernel.org/al=
l/CAHk-%3Dwi86AosXs66-yi54%2BmpQjPu0upxB8ZAfG%2BLsMyJmcuMSA@mail.gmail.co=
m/ >`_::
>=20
>     It's also worth noting that "immediate" obviously doesn't mean "rig=
ht
>     this *second* when the problem has been reported".
>=20
>     But if it's a regression with a known commit that caused it, I thin=
k
>     the rule of thumb should generally be "within a week", preferably
>     before the next rc.
>=20
> * From `2023-04-21 <https://lore.kernel.org/all/CAHk-=3DwgD98pmSK3ZyHk_=
d9kZ2bhgN6DuNZMAJaV0WTtbkf=3DRDw@mail.gmail.com/ >`_::
>=20
>     Known-broken commits either
>      (a) get a timely fix that doesn't have other questions
>     or
>      (b) get reverted
>=20
> * From `2021-09-20(2) <https://lore.kernel.org/all/CAHk-=3DwgOvmtRw1TNb=
MC1rn5YqyTKyn0hz+sc4k0DGNn++u9aYw@mail.gmail.com/ >`_::
>=20
>     [...] review shouldn't hold up reported regressions of existing cod=
e. That's
>     just basic _testing_ - either the fix should be applied, or - if th=
e fix is
>     too invasive or too ugly - the problematic source of the regression=
 should
>     be reverted.
>=20
>     Review should be about new code, it shouldn't be holding up "there'=
s a
>     bug report, here's the obvious fix".
>=20
> * From `2023-05-08 <https://lore.kernel.org/all/CAHk-=3DwgzU8_dGn0Yg+Dy=
X7ammTkDUCyEJ4C=3DNvnHRhxKWC7Wpw@mail.gmail.com/ >`_::
>=20
>     If something doesn't even build, it should damn well be fixed ASAP.=

>=20
>=20
> On how fixing regressions with reverts can help prevent maintainer burn=
out
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
>=20
> * From `2026-01-28 <https://lore.kernel.org/all/CAHk-%3Dwi86AosXs66-yi5=
4%2BmpQjPu0upxB8ZAfG%2BLsMyJmcuMSA@mail.gmail.com/ >`_::
>=20
>     > So how can I/we make "immediate fixes" happen more often without
>     > contributing to maintainer burnout?
>=20
>     [...] the "revert and rethink" model [...] often a good idea in gen=
eral
>     unless there's just an obvious fix for an obvious bug [...]
>=20
>     Exactly so that maintainers don't get stressed out over having a pe=
nding
>     problem report that people keep pestering them about.
>=20
>     I think people are sometimes a bit too bought into whatever changes=

>     they made, and reverting is seen as "too drastic", but I think it's=

>     often the quick and easy solution for when there isn't some obvious=

>     response to a regression report.
>=20
>=20
> On why the "no regressions" rule exists
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> * From `2026-01-22 <https://lore.kernel.org/all/CAHk-=3DwheQNiW_WtHGO7b=
KkT7Uib-p+ai2JP9M+z+FYcZ6CAxYA@mail.gmail.com/ >`_::
>=20
>     But the basic rule is: be so good about backwards compatibility tha=
t
>     users never have to worry about upgrading. They should absolutely f=
eel
>     confident that any kernel-reported problem will either be solved, o=
r
>     have an easy solution that is appropriate for *them* (ie a
>     non-technical user shouldn't be expected to be able to do a lot).
>=20
>     Because the last thing we want is people holding back from trying n=
ew
>     kernels.
>=20
> * From `2024-05-28 <https://lore.kernel.org/all/CAHk-=3Dwgtb7y-bEh7tPDv=
DWru7ZKQ8-KMjZ53Tsk37zsPPdwXbA@mail.gmail.com/ >`_::
>=20
>     I introduced that "no regressions" rule something like two decades
>     ago, because people need to be able to update their kernel without
>     fear of something they relied on suddenly stopping to work.
>=20
> * From `2018-08-03 <https://lore.kernel.org/all/CA+55aFwWZX=3DCXmWDTkDG=
b36kf12XmTehmQjbiMPCqCRG2hi9kw@mail.gmail.com/ >`_::
>=20
>     The whole point of "we do not regress" is so that people can upgrad=
e
>     the kernel and never have to worry about it.
>=20
>     [...]
>=20
>     Because the only thing that matters IS THE USER.
>=20
> * From `2017-10-26(1) <https://lore.kernel.org/lkml/CA+55aFxW7NMAMvYhkv=
z1UPbUTUJewRt6Yb51QAx5RtrWOwjebg@mail.gmail.com/ >`_::
>=20
>     If the kernel used to work for you, the rule is that it continues t=
o work
>     for you.
>=20
>     [...]
>=20
>     People should basically always feel like they can update their kern=
el
>     and simply not have to worry about it.
>=20
>     I refuse to introduce "you can only update the kernel if you also
>     update that other program" kind of limitations. If the kernel used =
to
>     work for you, the rule is that it continues to work for you.
>=20
>=20
> On exceptions to the "no regressions" rule
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> * From `2026-01-22 <https://lore.kernel.org/all/CAHk-=3DwheQNiW_WtHGO7b=
KkT7Uib-p+ai2JP9M+z+FYcZ6CAxYA@mail.gmail.com/ >`_::
>=20
>     There are _very_ few exceptions to that rule, the main one being "t=
he
>     problem was a fundamental huge and gaping security issue and we *ha=
d* to
>     make that change, and we couldn't even make your limited use-case j=
ust
>     continue to work".
>=20
>     The other exception is "the problem was reported years after it was=

>     introduced, and now most people rely on the new behavior".
>=20
>     [...]
>=20
>     Now, if it's one or two users and you can just get them to recompil=
e,
>     that's one thing. Niche hardware and odd use-cases can sometimes be=

>     solved that way, and regressions can sometimes be fixed by handhold=
ing
>     every single reporter if the reporter is willing and able to change=

>     his or her workflow.
>=20
> * From `2023-04-20 <https://lore.kernel.org/all/CAHk-=3Dwis_qQy4oDNynNK=
i5b7Qhosmxtoj1jxo5wmB6SRUwQUBQ@mail.gmail.com/ >`_::
>=20
>     And yes, I do consider "regression in an earlier release" to be a
>     regression that needs fixing.
>=20
>     There's obviously a time limit: if that "regression in an earlier
>     release" was a year or more ago, and just took forever for people t=
o
>     notice, and it had semantic changes that now mean that fixing the
>     regression could cause a _new_ regression, then that can cause me t=
o
>     go "Oh, now the new semantics are what we have to live with".
>=20
> * From `2021-09-20(3) <https://lore.kernel.org/all/CAHk-=3Dwi7DB2SJ-wng=
VvsJ7Ak2cM556Q8437sOXo4EJt2BWPdEg@mail.gmail.com/ >`_::
>=20
>     Yes, we have situations where even regressions don't matter - like
>     major security issues that simply cannot be fixed other ways, becau=
se
>     the regression _was_ the security hole.
>=20
> * From `2017-10-26(2) <https://lore.kernel.org/lkml/CA+55aFxW7NMAMvYhkv=
z1UPbUTUJewRt6Yb51QAx5RtrWOwjebg@mail.gmail.com/ >`_::
>=20
>     There have been exceptions, but they are few and far between, and t=
hey
>     generally have some major and fundamental reasons for having happen=
ed,
>     that were basically entirely unavoidable, and people _tried_hard_ t=
o
>     avoid them. Maybe we can't practically support the hardware any mor=
e
>     after it is decades old and nobody uses it with modern kernels any
>     more. Maybe there's a serious security issue with how we did things=
,
>     and people actually depended on that fundamentally broken model. Ma=
ybe
>     there was some fundamental other breakage that just _had_ to have a=

>     flag day for very core and fundamental reasons.
>=20
>=20
> On accepting when a regression occurred
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> * From `2026-01-22 <https://lore.kernel.org/all/CAHk-=3DwheQNiW_WtHGO7b=
KkT7Uib-p+ai2JP9M+z+FYcZ6CAxYA@mail.gmail.com/ >`_::
>=20
>     But starting to argue about users reporting breaking changes is
>     basically the final line for me. I have a couple of people that I h=
ave
>     in my spam block-list and refuse to have anything to do with, and t=
hey
>     have generally been about exactly that.
>=20
>     Note how it's not about making mistakes and _causing_ the regressio=
n.
>     That's normal. That's development. But then arguing about it is a
>     no-no.
>=20
> * From `2024-06-23 <https://lore.kernel.org/all/CAHk-=3Dwi_KMO_rJ6OCr8m=
AWBRg-irziM=3DT9wxGC+J1VVoQb39gw@mail.gmail.com/ >`_::
>=20
>     We don't introduce regressions and then blame others.
>=20
>     There's a very clear rule in kernel development: things that break
>     other things ARE NOT FIXES.
>=20
>     EVER.
>=20
>     They get reverted, or the thing they broke gets fixed.
>=20
> * From `2021-06-05 <https://lore.kernel.org/all/CAHk-=3DwiUVqHN76YUwhkj=
ZzwTdjMMJf_zN4+u7vEJjmEGh3recw@mail.gmail.com/ >`_::
>=20
>     THERE ARE NO VALID ARGUMENTS FOR REGRESSIONS.
>=20
>     Honestly, security people need to understand that "not working" is =
not
>     a success case of security. It's a failure case.
>=20
>     Yes, "not working" may be secure. But security in that case is *poi=
ntless*.
>=20
> * From `2017-10-26(5) <https://lore.kernel.org/lkml/CA+55aFwiiQYJ+YoLKC=
XjN_beDVfu38mg=3DGgg5LFOcqHE8Qi7Zw@mail.gmail.com/ >`_::
>=20
>     [...] when regressions *do* occur, we admit to them and fix them, i=
nstead of
>     blaming user space.
>=20
>     The fact that you have apparently been denying the regression now f=
or
>     three weeks means that I will revert, and I will stop pulling appar=
mor
>     requests until the people involved understand how kernel developmen=
t
>     is done.
>=20
>=20
> On back-and-forth
> ~~~~~~~~~~~~~~~~~
>=20
> * From `2024-05-28 <https://lore.kernel.org/all/CAHk-=3Dwgtb7y-bEh7tPDv=
DWru7ZKQ8-KMjZ53Tsk37zsPPdwXbA@mail.gmail.com/ >`_::
>=20
>     The "no regressions" rule is that we do not introduce NEW bugs.
>=20
>     It *literally* came about because we had an endless dance of "fix t=
wo
>     bugs, introduce one new one", and that then resulted in a system th=
at
>     you cannot TRUST.
>=20
> * From `2021-09-20(1) <https://lore.kernel.org/all/CAHk-=3Dwi7DB2SJ-wng=
VvsJ7Ak2cM556Q8437sOXo4EJt2BWPdEg@mail.gmail.com/ >`_::
>=20
>=20
>     And the thing that makes regressions special is that back when I
>     wasn't so strict about these things, we'd end up in endless "seesaw=

>     situations" where somebody would fix something, it would break
>     something else, then that something else would break, and it would
>     never actually converge on anything reliable at all.
>=20
> * From `2015-08-13 <https://lore.kernel.org/all/CA+55aFxk8-BsiKwr_S-c+4=
G6wihKPQVMLE34H9wOZpeua6W9+Q@mail.gmail.com/ >`_::
>=20
>     The strict policy of no regressions actually originally started mai=
nly wrt
>     suspend/resume issues, where the "fix one machine, break another" k=
ind of
>     back-and-forth caused endless problems, and meant that we didn't ac=
tually
>     necessarily make any forward progress, just moving a problem around=
=2E
>=20
>=20
> On regressions caused by bugfixes
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> * From `2018-08-03 <https://lore.kernel.org/all/CA+55aFwWZX=3DCXmWDTkDG=
b36kf12XmTehmQjbiMPCqCRG2hi9kw@mail.gmail.com/ >`_::
>=20
>     > Kernel had a bug which has been fixed
>=20
>     That is *ENTIRELY* immaterial.
>=20
>     Guys, whether something was buggy or not DOES NOT MATTER.
>=20
>     [...]
>=20
>     It's basically saying "I took something that worked, and I broke it=
,
>     but now it's better". Do you not see how f*cking insane that statem=
ent
>     is?


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------yEM0hQ2juY0WBZixlmhkvG8m--

--------------2zGBjfqNHKQO5Tt6wCaaYggw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaZMdsgUDAAAAAAAKCRB5vBnz2d5qsEOR
AQCHr9KyuJI4ObNEUg8t1TlJo4JPWbDphujtmtECQ5oLdwD9EMNZaICDjvEOiO3d8LaS6FI6XOmn
D2Hp+Y4OojoNOAE=
=qbo0
-----END PGP SIGNATURE-----

--------------2zGBjfqNHKQO5Tt6wCaaYggw--
