Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEckLFZ5c2kfwAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 14:36:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F7C76531
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 14:36:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C930310EAD0;
	Fri, 23 Jan 2026 13:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="uVbNw+lW";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="ad4S9T7e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D0310E2C1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 13:36:17 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60N5QhDE192158; Fri, 23 Jan 2026 13:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=KRlipWtMNyGsHgJzUsXzBJH2k
 GRcsMfMJ6bVJsYA2f4=; b=uVbNw+lWS9sSyNdfEymWXPWQKe1/iNcv6qX2z6PGH
 7/IkT7TEH7vGS02f9O6Ojmqs8hkon1JbMxAFAF+w0+tDCClCfGpfqZoGiVYL4whE
 KBxVMQgHoZlp9NGTXjPPyN6+EaXBfqugQxOJhcEkSkQFA6SS+mUn192pVLqX3on/
 9vhUuI82S0Y20Io9C8x2Mm6wcInT1d6BezreaIy154/7Wecd3rGZQs9mEQOWW8tv
 Xnel0eVncZkAWS2DsX/Bg6VaiP1O57T5Eadno1QM82pQVkqIri57R6Bmn5ht9WX5
 0cW6u4F2lFpTUm8Szs8KTuN5FTnT8mpS0DXygOTn3QPPA==
Received: from cwxp265cu010.outbound.protection.outlook.com
 (mail-ukwestazon11022118.outbound.protection.outlook.com [52.101.101.118])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4btnawhvtp-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 23 Jan 2026 13:35:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NfNMED79Ee6gKOQ6OgIPlxQMvG0xeySNswkpWxbq+RJuP3rLbj2qClwgrbMC54ANVy6CeNOrmHM90aFqdNb62qFBlll/FMu5I4KhS1dsjik2PN/5yFWAPMLBzxx7kDvq/9i54UPimYAPrk19dNBOEe/dh83Gvg6V3qLAA/JgK9FbQFeB+4IcLVEEpgPbfBY4CsiU++SbqRItCr011pV3ZgYTI4TD5pyL3j0cLE4V9Q/y3FkQ3qSo4lPxkyFprToHubaM35/j6IY9CU7fP8z1Od0yOnaPdlp2a3yCmSySjnZa1NfBFAkEOtTqL+O2qq/l/lEuNFYS62dEPqRR/JpivA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRlipWtMNyGsHgJzUsXzBJH2kGRcsMfMJ6bVJsYA2f4=;
 b=oxuDirSe9sIYJw4xZgehmRMs57LRab3VwUvQECO/6HR4Ecz9V5g2lvflHbq8oPBgCZuJEXmW0OAmLlbcmQGfvMkIC1O6U4Tt984y7G0tILBMYuxG89vM4MIBPeR9BftfGcjmjOWxZsJe86vE4LKDk7BnFzXrc7co8WoLxqDWX8HXpHsxQ1+FCppA+KuZati+9e/FrtlBZaZaDYH12CoAxxvhiJqr+TMB2bEi9auhUdeAcGoCYrsjx+gcqmE2C9fMOfYEE+aHLEHrt89AX3WoDgY2TKIc3t2DHjWsACiPK7y5ZCVefRFr9qk25d8QZ1Fn/mYuQJautDnuNn86aIeP3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRlipWtMNyGsHgJzUsXzBJH2kGRcsMfMJ6bVJsYA2f4=;
 b=ad4S9T7e/v4vIRmipM723VlvVrGf+PJUHyPMqGDJk+7XwCYcSR45aSm/JKO1omvXexjJNm/8foSUfrb4UjAhdNSct2P7SmsjCBUu3Ipl1flmR68v1KZ8Q5o/ptUeZwFW5IY4cIw2Qv9Iw7XgVpYyfRfGNK7x8keOKcC2olTu828=
Received: from LO4P265MB3823.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1c9::10)
 by CWLP265MB7054.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1fb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Fri, 23 Jan
 2026 13:35:56 +0000
Received: from LO4P265MB3823.GBRP265.PROD.OUTLOOK.COM
 ([fe80::fc84:1ac:e5be:2ea4]) by LO4P265MB3823.GBRP265.PROD.OUTLOOK.COM
 ([fe80::fc84:1ac:e5be:2ea4%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 13:35:56 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Frank Binns <Frank.Binns@imgtec.com>, Brajesh Gupta
 <Brajesh.Gupta@imgtec.com>, Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>, Marek Vasut
 <marek.vasut@mailbox.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/imagination: Convert to
 dev_pm_domain_{at,de}tach_list()
Thread-Topic: [PATCH] drm/imagination: Convert to
 dev_pm_domain_{at,de}tach_list()
Thread-Index: AQHci7likUKSsHFV8Eeo3s36N9ay8LVfwvIA
Date: Fri, 23 Jan 2026 13:35:56 +0000
Message-ID: <ffdf3982-e22c-4d01-afa6-5449ed381000@imgtec.com>
References: <194465eda54d1f852a9226cf691ddc5aa208e0a3.1769097977.git.geert+renesas@glider.be>
In-Reply-To: <194465eda54d1f852a9226cf691ddc5aa208e0a3.1769097977.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO4P265MB3823:EE_|CWLP265MB7054:EE_
x-ms-office365-filtering-correlation-id: 76956f94-fd84-488b-9f47-08de5a845654
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?WExQZU1zdmZHcHdOaUxxZGswWnVUaGpUdDRyb2hOYXlIU1l5NW9QenhCQm1j?=
 =?utf-8?B?dVpBVlRpQWtyeGRqL2VKVFQ3VmtQMldOV0cxWTdPazRFMnRuQ1FxUm90Tm95?=
 =?utf-8?B?MkIrUi9CUW9ITWZoMytQUmN2UUV2WlMrMzBRTEdUbXk4a1dxdW9ZTHZ1aFcw?=
 =?utf-8?B?bFRyUnNZeEJrRVUxRDRhc0l2VnNSZ1lMSHFZZnlISWUzVWNMVzI5M0xHV1ZQ?=
 =?utf-8?B?VldIUXM1VldwZzdEc2g3b2wxN0labjM0S2Q1Z3NHUkR6NTVwSitmTXVQYjVX?=
 =?utf-8?B?R0tqY24zblBuMSsxazdWaXNiNmlqYmVzbXpFSGFmTDFJU2FPMVZBQVRha3Iv?=
 =?utf-8?B?SG1ZTVIycytZZjZ1TnBLVFFDTG9hRzFtRHordDBjU2tZdWJQNS9pQzlOSzM3?=
 =?utf-8?B?VHNzbkRIZVB6bUFnd0VlYnN2dTV2WnFZbDQwOVltekQ3d2R5a2oxSDJRTjZq?=
 =?utf-8?B?VWQwVmljVThqOWtCTmEwSXFjNjdlQUovRWR5L0hKRHdnNGo4NHppZjZUVUZR?=
 =?utf-8?B?QXN4eDY0TUU3Rk9lMmxlbWRpalVYUGpybnhGTU5oT1NHcGVkdmFxUXkwRmlS?=
 =?utf-8?B?ZlZVOGcwT0w3T09uWGNYVklkNFlRbTJvSEI5MXRNUHhDbWx1b05ycHB3TTZ1?=
 =?utf-8?B?R21wK1lMdFdJWXhyQUpRT0pmWFpUUTYzK1pmZXBUdmJUV09aT0hHSTR4MUtH?=
 =?utf-8?B?VDRGcFNYalU2ZFhtYncxNHMzR2ZzZC9DRGlndWIzekV6bFdBVnpjd3BQdlNh?=
 =?utf-8?B?aDhFRW84VlZDMElpYnJyUzBsSXNHTEwzdWFWSGlRQng2dWhTaG9OcUhaeHJn?=
 =?utf-8?B?ZjZySXIrUDdWUkRGN0p4T3lKYzJXUzFmK3hYSjhNSExIb3BxN3ZHY1RKM3RZ?=
 =?utf-8?B?RmxWM0VoelY5MHFscFhrQWxkUG1YOEJHK3pXRnNSSWVhaDRJQ0Nob3QzZEZ5?=
 =?utf-8?B?RGt5cmhpSGVFY052VGt0NHc1L1RzUVlub2RkcFVIb1crWGJYTk1wb0ZJbG9O?=
 =?utf-8?B?TjJjdHNVWTVhSHp1YWRyZDZ3ckZ2bmJDOWozVkhkM1BWUlNFL1pmVGQ5eDR5?=
 =?utf-8?B?djdaVkxrWEVWekUyQTNBQUc5RXoyK2ZLamxzV2ZLSWtSZFEzZTlpM3dYV0Rn?=
 =?utf-8?B?UkRWUGh5blZhVlNtUHR1Q3hROGRXSENGaysxdnlCY1ZrZkhjT29aSHlNVWFW?=
 =?utf-8?B?enh3ZTdxVGowTWJiT1FYd1lTanEwT0kxaUFlMno4UGROT0xadGovWkVkL2Yv?=
 =?utf-8?B?dnRJQmwxUXRLeHhzYncwWkY1VHlzU0VUK0tpRUM1MmY4ZnVKMmtudzBZcGQz?=
 =?utf-8?B?aGZ2b3hjbXp5NEhtZGhmcUlPSWpYdXdpMWVKU2MxMWN5NkxTUjRpUHN3b2Qy?=
 =?utf-8?B?K0g4OVFNSktTQUhVYjQvUGhSazArYTg5MVBQdHlkbittcGFrZzEyMlc0SElM?=
 =?utf-8?B?a3pzTXR3MUJCVmF6ZnVwT3hSNDlpcGhGMmdHVURMaHQ3REw0U25MR0IrT0s1?=
 =?utf-8?B?TXNRSSs3Z01kM3RNUStCSmd5TVdnU2xUWUZLUGxBS2cydXFKUnltU3Y1Vm5k?=
 =?utf-8?B?RFdLQWo1OURMUzlNZWpmZExaeHNPZXVMblJaNWtWVXY4d095UERXZFlnWmMx?=
 =?utf-8?B?VDJFaDhBbk9LUTk1dEZxRUpNZmppNSt4THpnTWMydEsybHBvUXdudHVwT1VN?=
 =?utf-8?B?akRXVTVveExYUmxwaEc3aUR1NW5iQSs1Y3JFTFRCQjZ6NDdXTUpsdDNsTjZz?=
 =?utf-8?B?Z25ydWhHVDdRYWhOZk9RU0tBVS8vdWlsTSttYng2WWJhME1kYStLODM3aGJy?=
 =?utf-8?B?RDA5U2xUM1lWMEdzQWprZGp1NEVMcWFvSnQxUitzTU5mQlMzRlYrV2RDSzZT?=
 =?utf-8?B?VnFTc0c2RUFyTFFPc1NoRmhGSzQweXAzN0U4NnZ3Z3lKUHE5MjQ3cmZnekRt?=
 =?utf-8?B?R3ZERVdZWmplT1JnWjdQMTVhZEZpS0RJQmxhRDBJWTNaQjE5UUJEYUFzakI2?=
 =?utf-8?B?d29FYlpSY2hOK21zQjdxSm5TeG51VlBtZTZwRi82K25zNVpYclhJTG4yRUMv?=
 =?utf-8?B?azR4cTk5b29XSytycWxSYVptbjVrRmNGcG9NVGxLUlcxUmNTd3FjZEhMVW9W?=
 =?utf-8?B?WnczeGJRcGtpQVJxR2xodk9kSnY1QkZYYzBldEllMFJWM0xEVlZiMHBkdWR4?=
 =?utf-8?Q?Ya36hPjjmJGsrd5oBmA0iAs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO4P265MB3823.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkR1dDZEaURzb080TUVEV293S095ZEVUWHhrM0lNQlkra2VFYzd0WVRzSWJL?=
 =?utf-8?B?SlFKSVg3MzllSmlhQVdBOWM1WVcwSEltUk11QXRNQm1CN2dJY2pDVUVGL2RY?=
 =?utf-8?B?Y01vUXJjSE5NZ3VLVk51a0xSWUhqd0NvRTBIZFdNcGp4YzFiTVBtVGJ6ajVx?=
 =?utf-8?B?NXNYMStiNjF1dDRPOFBjMGhqUmZjVVdZVmF2UnVSRDROYjgwcEJxMjdsb1px?=
 =?utf-8?B?WWx2SFZmM3FIQzNOV2pxWDh0SFRFMnlCT2pYM1REenNoSUVqMVhBWDVtM1Ev?=
 =?utf-8?B?WGFVYUdkUFU5TTVSREtwUGpMeVNYYmhBbGJaZ0pwUXVUcEYrZzByZ2U1cW1O?=
 =?utf-8?B?Yk8rMXpVTEF1eW5KbStucXJCalZHL3ZOd2Q1SlEwaWF6WUwxK3R6L043cjc2?=
 =?utf-8?B?a1JYb1d4OG5yUE0rUTdGbXg5RS9VTlJxaE1qQVVXVGUvVTdtTXNuaitTNWlr?=
 =?utf-8?B?czNBU29WMmlJOU5HVFFQQlNmVzlqMTFvaGxpYmkwZGc1Z1FoR1BvczRqYS9Q?=
 =?utf-8?B?cWlSbGFXd0xqU01uM2FXN0dMUElXL2w0UVZBSjhpWlJERThwV1FvQ0UvUmlY?=
 =?utf-8?B?R3dnZFphWFRVYTZ5QUFOMzdtRlZLVTlFUmFyS2trR3p5c3JwL3M3YkxIQzRN?=
 =?utf-8?B?ekRUblQ1KzkrMk1TSnFNYXhidS9TTlVLRlZXSC9mMUM0cDYwZ0VFT0J6VG93?=
 =?utf-8?B?b3hQTjdqeW14dnN6ZUtBdFhUSzVITis0WWl6TlkvNGIyZUFXWVRxUG5mMkpp?=
 =?utf-8?B?Z29QV3UzaWl5akg1NHRUN0VMVzF3QnRvend0aGJmTWdrallWOUZ6ci91ZG1N?=
 =?utf-8?B?UzVtZml6emp5ZFExYXFEMHNFRkFNL25Za1NHWkJoWWNQN1Q3N2RIemIzZTQ3?=
 =?utf-8?B?c2ZROTBtdk9Gb2ZHc2tTajZIdGZFekt2dUtrNjFwUEFWa09XcEx6RVpxZnVh?=
 =?utf-8?B?Y29mV1pwRDc2OFBqVW16TTBIVjNydFpnZ0hGY01PZjVHaGI0Rm9MR2pyU1dJ?=
 =?utf-8?B?Mm8xYVZrV3ZJcS93TXNHQXUrSy9ablMvQXhtRXZWT3ZUUzdNb1k1Yks0K3gv?=
 =?utf-8?B?ZWQrRFFUWmJVVk5PK2lDSHEwV0pMdDZ4SFEvRU1KKzNSak1Wc1hIaWFBVUJM?=
 =?utf-8?B?cmMrdVR3eVJ1VDdqOC9UL2wrSW9ienhGVDdFSkxZNkh0TFUrZ0x3aXFBdjcy?=
 =?utf-8?B?YTJsdit6SHEvaHkxUk9MNUU2Mkh5MXBXdjZ5cW9aeWZsVUh5TjNIYmgrUVdI?=
 =?utf-8?B?dlgvbFp3aTRMMDBIQXZ2S3FOb2NsOEJLdk96MWIyaGF1VHB5L0w4K1E2ekth?=
 =?utf-8?B?T0Z4cjE5TUtjMHk1Unp1a2pVMHhQVFhRamk0c0NKSXFmc1ZMK1ZCb0tXZ3kx?=
 =?utf-8?B?U09CR2ZTMWpabWcvWThLRUhKOWZVaERaS1greTZub2dVbU8zcWtoZUJzeGlv?=
 =?utf-8?B?dThSbTZsd0k2MVA4OCtNbHQxTzdzWm1aRm1BeTdNbE12WWthUDlJQ1F5RWE1?=
 =?utf-8?B?bGRzaitjS1RZSWRYWmZyK0loa1cySk5WZFh4cHZIY21QMGhtOFFaUlRoOGUz?=
 =?utf-8?B?RXVMbjZtSVNlMWVJdGp1c2RlSlE5TEpqRzRoei9BZll3dWhSWXdRN3ZnK3FL?=
 =?utf-8?B?MHJid09MdzYyZUpTK2JnclZlb0FMYzh2VUJOK1oydXRDWHlMeHk1TGE5NWlq?=
 =?utf-8?B?RXYwaEFVdDNlcVVrbEI0dXA3cmlaeGlKVkNPVlNkcHRwOGJEY2tJbnFncW54?=
 =?utf-8?B?aDJxa1ZpbCtIVGJLU3dxSWtDNHUzOHhGOWQ5QWhWbVBJSHZJZWloMGExQVc2?=
 =?utf-8?B?Wnlac3cyVlJjQlE0TXBYVkNwem9mNDcwcmhoQ21laC80bW5pdllFd0JDb1RL?=
 =?utf-8?B?K3JSQitSR051TUdVcFkrYTRGOU95K1ZTY2NyeVhwQjV5RElYVzVRQmhJK2U5?=
 =?utf-8?B?WS9ybVVnRW1jcXVXcm52eUhBS2JjVnMzZDdtNU4zaU9pZUg5ZmlJUitSNEZJ?=
 =?utf-8?B?d1lnZEFpbVVpYnBQWlRGdk4ycE01TUVoTUlMQWN2ckY5ZTN1YzVvNWJYNkU4?=
 =?utf-8?B?TDFNNmxkekZCdGNORXZocU0vVHhZMjFEaU45U2ljSnZWbDNoMkF2cC8wUFM3?=
 =?utf-8?B?STY1QXFFVm92dHMrY3BtN0REQlNvY2MrWXpNeE50V0VjMUNqQ2I2QXRiQ1gr?=
 =?utf-8?B?MHBLaFJabEJjU2pIT3dqZ2hBR1RGNmJRSEp2YTFZZkR1aG9pZUZWNjJQSWdU?=
 =?utf-8?B?VDd1enV2QWI2ejhsV3BvQ2JYZFFPbTNlaEVaVE15RENzRXY5VHQyR1RGVG83?=
 =?utf-8?B?RFkwMlVScExodjNXbU1XMHBqVngxQ2Q0b2pkUEE0cGo3dHYzblFvRmx5cEo3?=
 =?utf-8?Q?5EYICue0ilcnmPEQ=3D?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0i0qzADuYKdGx02KAhIFWzcm"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO4P265MB3823.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 76956f94-fd84-488b-9f47-08de5a845654
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2026 13:35:56.3672 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p+GYsvEfv+s+eE8AOhvpXAQnNZ37zfQ2ebXxI309iOXJ9pYIyzpW/P8ekUriIp8GsaAzcYZOX3kdgZdqsaNobw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7054
X-Authority-Analysis: v=2.4 cv=bYRmkePB c=1 sm=1 tr=0 ts=69737940 cx=c_pps
 a=Ne4q00Umayr7WHBmjXJRLQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8
 a=2VBT7UiHl1W02eOqdMEA:9 a=QEXdDO2ut3YA:10 a=Fup5yievyHQzm8ezEZcA:9
 a=B2y7HmGcmWMA:10 a=Wek2-ypA81ARH1XNXbAA:9 a=FfaGCDsud1wA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: 9WK-qzGrIRuZlQZ5ufw9thbX_DVT_Gqj
X-Proofpoint-GUID: 9WK-qzGrIRuZlQZ5ufw9thbX_DVT_Gqj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDExMSBTYWx0ZWRfX1mfTY/VrOmgz
 qODLKCHlf/iw4/mVrhiLep8/xrNY4XORCNY1oXeYPnCh60ZRDpUQP8RufBTQEzyCaeTSJzSH3HD
 Y4JoE2atH7BsenygARBOW5pilc20i6mNXO3LBK+v9UeKNB1el8uPjzEGWaCt1ZmBqtDAjLFzljZ
 zD6Q17bbA620n+fNzfOuZ+78w5UhGc5IIHFuWCbTDTZA9x2qk4e8GJtgceVSyp3a4UaRRanO9UM
 3C2mYMiBea+pAd4vb1Zw/5I7E0ev7zK1o9Kv5oOWYLEcS/TyhOxJDB6tFRVYq7XZ2Afs1EzZNlb
 6dYxfHOr0fKQoP3dINr90LkoNeiKchl3JjhRPg7TL030VLbXXcQP5kXC+V9q7XMRIZqC13rQ1Gx
 qDvktK8/YODuzr5HcUEcJ4JPn4NZhsXq8wLQl80ZG9k/dXuBEpLe4ZpKIWrZW8Kl7QGnJgAY9WC
 US1fyWyPjEyGg0sRYVQ==
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
X-Spamd-Result: default: False [-1.81 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812,IMGTecCRM.onmicrosoft.com:s=selector2-IMGTecCRM-onmicrosoft-com];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:Frank.Binns@imgtec.com,m:Brajesh.Gupta@imgtec.com,m:Alessio.Belle@imgtec.com,m:Alexandru.Dadu@imgtec.com,m:marek.vasut@mailbox.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[Matt.Coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:+,5:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[imgtec.com,mailbox.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Matt.Coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[imgtec.com:+,IMGTecCRM.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.985];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,IMGTecCRM.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 16F7C76531
X-Rspamd-Action: no action

--------------0i0qzADuYKdGx02KAhIFWzcm
Content-Type: multipart/mixed; boundary="------------iUwl4xwW5ri11RgyLoEjULDL";
 protected-headers="v1"
Message-ID: <ffdf3982-e22c-4d01-afa6-5449ed381000@imgtec.com>
Date: Fri, 23 Jan 2026 13:35:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Matt Coster <matt.coster@imgtec.com>
Subject: Re: [PATCH] drm/imagination: Convert to
 dev_pm_domain_{at,de}tach_list()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Frank Binns <frank.binns@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Marek Vasut <marek.vasut@mailbox.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <194465eda54d1f852a9226cf691ddc5aa208e0a3.1769097977.git.geert+renesas@glider.be>
Content-Language: en-GB
In-Reply-To: <194465eda54d1f852a9226cf691ddc5aa208e0a3.1769097977.git.geert+renesas@glider.be>
Autocrypt: addr=matt.coster@imgtec.com; keydata=
 xjMEYl2lchYJKwYBBAHaRw8BAQdAOYlooFfHTXzAQ9aGoSnT9JS9wq8xprG+KVLbkxJDF5DN
 JE1hdHQgQ29zdGVyIDxtYXR0LmNvc3RlckBpbWd0ZWMuY29tPsKWBBMWCAA+AhsDBQsJCAcC
 BhUKCQgLAgQWAgMBAh4BAheAFiEEBaQM/OcmnWHZcQChdH8KkDb5DfoFAmgHpowFCQlsaBoA
 CgkQdH8KkDb5DfqxDgEA81pbVLJDmpFyFZLRhAGig9rgoDY6l774yhTzRVm/SvkBAJLzpSlm
 wyQaQuB668TKOX9XvRLKFGjSq5kkdQcxqjkCzjgEYl2lchIKKwYBBAGXVQEFAQEHQCaVC8X5
 7NOv2jNbeXqjP9ekY7rzy7auiEZ5PxaDWUQVAwEIB8J+BBgWCAAmAhsMFiEEBaQM/OcmnWHZ
 cQChdH8KkDb5DfoFAmgHpowFCQlsaBoACgkQdH8KkDb5DfoK+AD/Q4aN/zUvP72RRE4cNWpM
 MXeRXg+LTN+OJ24U10LltxIA/2w3kDqMC/0t1oqO8TM+c2LMWO/x2IBkG7oRZ/hVw1QI

--------------iUwl4xwW5ri11RgyLoEjULDL
Content-Type: multipart/mixed; boundary="------------GPvLoXX7nTYlskGRwm0SBPEi"

--------------GPvLoXX7nTYlskGRwm0SBPEi
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 22/01/2026 16:08, Geert Uytterhoeven wrote:
> Call the dev_pm_domain_attach_list() and dev_pm_domain_detach_list()
> helpers instead of open-coding multi PM Domain handling.
>=20
> This changes behavior slightly:
>   - The new handling is also applied in case of a single PM Domain,
>   - PM Domains are now referred to by index instead of by name, but
>     "make dtbs_check" enforces the actual naming and ordering anyway,
>   - There are no longer device links created between virtual domain
>     devices, only between virtual devices and the parent device.

We still need this guarantee, both at start and end of day. In the
current implementation dev_pm_domain_attach_list() iterates forwards,
but so does dev_pm_domain_detach_list(). Even if we changed that, I'd
prefer not to rely on the implementation details when we can declare the
dependencies explicitly.

We had/have a patch (attached) kicking around internally to use the
*_list() functions but keep the inter-domain links in place; it got held
up by discussions as to whether we actually need those dependencies for
the hardware to behave correctly. Your patch spurred me to run around
the office and nag people a bit, and it seems we really do need to care
about the ordering.

Can you add the links back in for a V2 or I can properly send the
attached patch instead, I don't mind either way.

Cheers,
Matt

> None of this should have an actual impact on functionality.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Tested lightly on R-Car M3-W: driver probes and firmware is loaded.
> ---
>  drivers/gpu/drm/imagination/pvr_device.h |  13 +--
>  drivers/gpu/drm/imagination/pvr_power.c  | 105 ++---------------------=

>  2 files changed, 9 insertions(+), 109 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm=
/imagination/pvr_device.h
> index 491718fb87a1b608..a823f6f7e0b659c6 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.h
> +++ b/drivers/gpu/drm/imagination/pvr_device.h
> @@ -148,19 +148,12 @@ struct pvr_device {
>  	struct clk *mem_clk;
> =20
>  	/**
> -	 * @power: Optional power domain devices.
> +	 * @pds: Optional power domain devices.
>  	 *
>  	 * On platforms with more than one power domain for the GPU, they are=

> -	 * stored here in @domain_devs, along with links between them in
> -	 * @domain_links. The size of @domain_devs is given by @domain_count,=

> -	 * while the size of @domain_links is (2 * @domain_count) - 1.
> +	 * stored here, along with links between them.
>  	 */
> -	struct pvr_device_power {
> -		struct device **domain_devs;
> -		struct device_link **domain_links;
> -
> -		u32 domain_count;
> -	} power;
> +	struct dev_pm_domain_list *pds;
> =20
>  	/**
>  	 * @reset: Optional reset line.
> diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/=
imagination/pvr_power.c
> index b9f801c63260cb81..cc6efab3c8b015ce 100644
> --- a/drivers/gpu/drm/imagination/pvr_power.c
> +++ b/drivers/gpu/drm/imagination/pvr_power.c
> @@ -594,110 +594,17 @@ pvr_watchdog_fini(struct pvr_device *pvr_dev)
>  int pvr_power_domains_init(struct pvr_device *pvr_dev)
>  {
>  	struct device *dev =3D from_pvr_device(pvr_dev)->dev;
> +	int ret;
> =20
> -	struct device_link **domain_links __free(kfree) =3D NULL;
> -	struct device **domain_devs __free(kfree) =3D NULL;
> -	int domain_count;
> -	int link_count;
> -
> -	char dev_name[2] =3D "a";
> -	int err;
> -	int i;
> -
> -	domain_count =3D of_count_phandle_with_args(dev->of_node, "power-doma=
ins",
> -						  "#power-domain-cells");
> -	if (domain_count < 0)
> -		return domain_count;
> -
> -	if (domain_count <=3D 1)
> -		return 0;
> -
> -	link_count =3D domain_count + (domain_count - 1);
> -
> -	domain_devs =3D kcalloc(domain_count, sizeof(*domain_devs), GFP_KERNE=
L);
> -	if (!domain_devs)
> -		return -ENOMEM;
> -
> -	domain_links =3D kcalloc(link_count, sizeof(*domain_links), GFP_KERNE=
L);
> -	if (!domain_links)
> -		return -ENOMEM;
> -
> -	for (i =3D 0; i < domain_count; i++) {
> -		struct device *domain_dev;
> -
> -		dev_name[0] =3D 'a' + i;
> -		domain_dev =3D dev_pm_domain_attach_by_name(dev, dev_name);
> -		if (IS_ERR_OR_NULL(domain_dev)) {
> -			err =3D domain_dev ? PTR_ERR(domain_dev) : -ENODEV;
> -			goto err_detach;
> -		}
> -
> -		domain_devs[i] =3D domain_dev;
> -	}
> -
> -	for (i =3D 0; i < domain_count; i++) {
> -		struct device_link *link;
> -
> -		link =3D device_link_add(dev, domain_devs[i], DL_FLAG_STATELESS | DL=
_FLAG_PM_RUNTIME);
> -		if (!link) {
> -			err =3D -ENODEV;
> -			goto err_unlink;
> -		}
> -
> -		domain_links[i] =3D link;
> -	}
> -
> -	for (i =3D domain_count; i < link_count; i++) {
> -		struct device_link *link;
> -
> -		link =3D device_link_add(domain_devs[i - domain_count + 1],
> -				       domain_devs[i - domain_count],
> -				       DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
> -		if (!link) {
> -			err =3D -ENODEV;
> -			goto err_unlink;
> -		}
> -
> -		domain_links[i] =3D link;
> -	}
> -
> -	pvr_dev->power =3D (struct pvr_device_power){
> -		.domain_devs =3D no_free_ptr(domain_devs),
> -		.domain_links =3D no_free_ptr(domain_links),
> -		.domain_count =3D domain_count,
> -	};
> +	ret =3D dev_pm_domain_attach_list(dev, NULL, &pvr_dev->pds);
> +	if (ret < 0)
> +		return ret;
> =20
>  	return 0;
> -
> -err_unlink:
> -	while (--i >=3D 0)
> -		device_link_del(domain_links[i]);
> -
> -	i =3D domain_count;
> -
> -err_detach:
> -	while (--i >=3D 0)
> -		dev_pm_domain_detach(domain_devs[i], true);
> -
> -	return err;
>  }
> =20
>  void pvr_power_domains_fini(struct pvr_device *pvr_dev)
>  {
> -	const int domain_count =3D pvr_dev->power.domain_count;
> -
> -	int i =3D domain_count + (domain_count - 1);
> -
> -	while (--i >=3D 0)
> -		device_link_del(pvr_dev->power.domain_links[i]);
> -
> -	i =3D domain_count;
> -
> -	while (--i >=3D 0)
> -		dev_pm_domain_detach(pvr_dev->power.domain_devs[i], true);
> -
> -	kfree(pvr_dev->power.domain_links);
> -	kfree(pvr_dev->power.domain_devs);
> -
> -	pvr_dev->power =3D (struct pvr_device_power){ 0 };
> +	dev_pm_domain_detach_list(pvr_dev->pds);
> +	pvr_dev->pds =3D NULL;
>  }


--=20
Matt Coster
E: matt.coster@imgtec.com
--------------GPvLoXX7nTYlskGRwm0SBPEi
Content-Type: text/plain; charset=UTF-8;
 name="0001-drm-imagination-Use-dev_pm_domain_attach_list.patch"
Content-Disposition: attachment;
 filename="0001-drm-imagination-Use-dev_pm_domain_attach_list.patch"
Content-Transfer-Encoding: base64

RnJvbSAwZmYzZGMzYThjODM2NDU3NGU2YmRiZWViMzA2N2U3MGJkMGU4YzBhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBNYXR0IENvc3RlciA8bWF0dC5jb3N0ZXJAaW1ndGVj
LmNvbT4KRGF0ZTogVHVlLCAyNSBOb3YgMjAyNSAwOTo1MTo1MSArMDAwMApTdWJqZWN0OiBb
UEFUQ0hdIGRybS9pbWFnaW5hdGlvbjogVXNlIGRldl9wbV9kb21haW5fYXR0YWNoX2xpc3Qo
KQoKVGhpcyBoZWxwZXIgaGFuZGxlcyB0aGUgYXR0YWNoaW5nIGFuZCBsaW5raW5nIG9mIHRo
ZSBlbnRpcmUgbGlzdCBvZiBwb3dlcgpkb21haW5zLiBCZXNpZGVzIG1ha2luZyBwdnJfcG93
ZXJfZG9tYWluc19pbml0KCkgc2ltcGxlciwgdGhpcyBhbHNvIGxheXMKdGhlIGdyb3VuZHdv
cmsgdG8gc2ltcGxpZnkgc3VwcG9ydGluZyB0aGUgdmFyaWVkIHBvd2VyIGRvbWFpbiBuYW1l
cyB1c2VkIGluClZvbGNhbmljIEdQVSBjb3Jlcy4KCk5vdGUgdGhhdCB3ZSBzdGlsbCBuZWVk
IHRvIGNyZWF0ZSB0aGUgbGlua3MgYmV0d2VlbiBwb3dlciBkb21haW5zIHRvIGVuc3VyZQp0
aGV5J3JlIGJyb3VnaHQgdXAgaW4gYSB2YWxpZCBzZXF1ZW5jZS4KClNpZ25lZC1vZmYtYnk6
IE1hdHQgQ29zdGVyIDxtYXR0LmNvc3RlckBpbWd0ZWMuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9pbWFnaW5hdGlvbi9wdnJfZGV2aWNlLmggfCAxMCArKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9pbWFnaW5hdGlvbi9wdnJfcG93ZXIuYyAgfCA4MCArKysrKysrKystLS0tLS0tLS0tLS0t
LS0KIDIgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgNTcgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9kZXZpY2Uu
aCBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfZGV2aWNlLmgKaW5kZXggZWM1
M2ZmMjc1NTQxOC4uNzU5YzYzOWFhZmEyZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2ltYWdpbmF0aW9uL3B2cl9kZXZpY2UuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vaW1hZ2lu
YXRpb24vcHZyX2RldmljZS5oCkBAIC0xNTAsMTUgKzE1MCwxMyBAQCBzdHJ1Y3QgcHZyX2Rl
dmljZSB7CiAJICogQHBvd2VyOiBPcHRpb25hbCBwb3dlciBkb21haW4gZGV2aWNlcy4KIAkg
KgogCSAqIE9uIHBsYXRmb3JtcyB3aXRoIG1vcmUgdGhhbiBvbmUgcG93ZXIgZG9tYWluIGZv
ciB0aGUgR1BVLCB0aGV5IGFyZQotCSAqIHN0b3JlZCBoZXJlIGluIEBkb21haW5fZGV2cywg
YWxvbmcgd2l0aCBsaW5rcyBiZXR3ZWVuIHRoZW0gaW4KLQkgKiBAZG9tYWluX2xpbmtzLiBU
aGUgc2l6ZSBvZiBAZG9tYWluX2RldnMgaXMgZ2l2ZW4gYnkgQGRvbWFpbl9jb3VudCwKLQkg
KiB3aGlsZSB0aGUgc2l6ZSBvZiBAZG9tYWluX2xpbmtzIGlzICgyICogQGRvbWFpbl9jb3Vu
dCkgLSAxLgorCSAqIHN0b3JlZCBoZXJlIGluIEBkb21haW5zLCBhbG9uZyB3aXRoIGxpbmtz
IGJldHdlZW4gdGhlbSBpbgorCSAqIEBkb21haW5fbGlua3MuIFRoZSBzaXplIG9mIEBkb21h
aW5fbGlua3MgaXMgb25lIGxlc3MgdGhhbgorCSAqIHN0cnVjdCBkZXZfcG1fZG9tYWluX2xp
c3QtPm51bV9wZHMgaW4gQGRvbWFpbnMuCiAJICovCiAJc3RydWN0IHB2cl9kZXZpY2VfcG93
ZXIgewotCQlzdHJ1Y3QgZGV2aWNlICoqZG9tYWluX2RldnM7CisJCXN0cnVjdCBkZXZfcG1f
ZG9tYWluX2xpc3QgKmRvbWFpbnM7CiAJCXN0cnVjdCBkZXZpY2VfbGluayAqKmRvbWFpbl9s
aW5rczsKLQotCQl1MzIgZG9tYWluX2NvdW50OwogCX0gcG93ZXI7CiAKIAkvKioKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfcG93ZXIuYyBiL2RyaXZl
cnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfcG93ZXIuYwppbmRleCBiOWY4MDFjNjMyNjBj
Li5hMDgzNGM1NTBhODUyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRp
b24vcHZyX3Bvd2VyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9w
b3dlci5jCkBAIC01OTMsMTQgKzU5MywxNiBAQCBwdnJfd2F0Y2hkb2dfZmluaShzdHJ1Y3Qg
cHZyX2RldmljZSAqcHZyX2RldikKIAogaW50IHB2cl9wb3dlcl9kb21haW5zX2luaXQoc3Ry
dWN0IHB2cl9kZXZpY2UgKnB2cl9kZXYpCiB7Ci0Jc3RydWN0IGRldmljZSAqZGV2ID0gZnJv
bV9wdnJfZGV2aWNlKHB2cl9kZXYpLT5kZXY7CisJc3RhdGljIGNvbnN0IGNoYXIgKmNvbnN0
IFJPR1VFX1BEX05BTUVTW10gPSB7ICJhIiwgImIiLCAiYyIsICJkIiwgImUiIH07CisKKwlz
dHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IGZyb21fcHZyX2RldmljZShwdnJfZGV2KTsK
KwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBkcm1fZGV2LT5kZXY7CiAKIAlzdHJ1Y3QgZGV2aWNl
X2xpbmsgKipkb21haW5fbGlua3MgX19mcmVlKGtmcmVlKSA9IE5VTEw7Ci0Jc3RydWN0IGRl
dmljZSAqKmRvbWFpbl9kZXZzIF9fZnJlZShrZnJlZSkgPSBOVUxMOworCXN0cnVjdCBkZXZf
cG1fZG9tYWluX2xpc3QgKmRvbWFpbnMgPSBOVUxMOwogCWludCBkb21haW5fY291bnQ7CiAJ
aW50IGxpbmtfY291bnQ7CiAKLQljaGFyIGRldl9uYW1lWzJdID0gImEiOwogCWludCBlcnI7
CiAJaW50IGk7CiAKQEAgLTYxMiw0NiArNjE0LDMzIEBAIGludCBwdnJfcG93ZXJfZG9tYWlu
c19pbml0KHN0cnVjdCBwdnJfZGV2aWNlICpwdnJfZGV2KQogCWlmIChkb21haW5fY291bnQg
PD0gMSkKIAkJcmV0dXJuIDA7CiAKLQlsaW5rX2NvdW50ID0gZG9tYWluX2NvdW50ICsgKGRv
bWFpbl9jb3VudCAtIDEpOworCWlmIChkb21haW5fY291bnQgPiBBUlJBWV9TSVpFKFJPR1VF
X1BEX05BTUVTKSkgeworCQlkcm1fZXJyKGRybV9kZXYsICIlcygpIG9ubHkgc3VwcG9ydHMg
JXp1IGRvbWFpbnMgb24gUm9ndWUiLAorCQkJX19mdW5jX18sIEFSUkFZX1NJWkUoUk9HVUVf
UERfTkFNRVMpKTsKKwkJcmV0dXJuIC1FT1BOT1RTVVBQOworCX0KIAotCWRvbWFpbl9kZXZz
ID0ga2NhbGxvYyhkb21haW5fY291bnQsIHNpemVvZigqZG9tYWluX2RldnMpLCBHRlBfS0VS
TkVMKTsKLQlpZiAoIWRvbWFpbl9kZXZzKQotCQlyZXR1cm4gLUVOT01FTTsKKwlsaW5rX2Nv
dW50ID0gZG9tYWluX2NvdW50IC0gMTsKIAogCWRvbWFpbl9saW5rcyA9IGtjYWxsb2MobGlu
a19jb3VudCwgc2l6ZW9mKCpkb21haW5fbGlua3MpLCBHRlBfS0VSTkVMKTsKIAlpZiAoIWRv
bWFpbl9saW5rcykKIAkJcmV0dXJuIC1FTk9NRU07CiAKLQlmb3IgKGkgPSAwOyBpIDwgZG9t
YWluX2NvdW50OyBpKyspIHsKLQkJc3RydWN0IGRldmljZSAqZG9tYWluX2RldjsKLQotCQlk
ZXZfbmFtZVswXSA9ICdhJyArIGk7Ci0JCWRvbWFpbl9kZXYgPSBkZXZfcG1fZG9tYWluX2F0
dGFjaF9ieV9uYW1lKGRldiwgZGV2X25hbWUpOwotCQlpZiAoSVNfRVJSX09SX05VTEwoZG9t
YWluX2RldikpIHsKLQkJCWVyciA9IGRvbWFpbl9kZXYgPyBQVFJfRVJSKGRvbWFpbl9kZXYp
IDogLUVOT0RFVjsKLQkJCWdvdG8gZXJyX2RldGFjaDsKLQkJfQotCi0JCWRvbWFpbl9kZXZz
W2ldID0gZG9tYWluX2RldjsKLQl9Ci0KLQlmb3IgKGkgPSAwOyBpIDwgZG9tYWluX2NvdW50
OyBpKyspIHsKLQkJc3RydWN0IGRldmljZV9saW5rICpsaW5rOwotCi0JCWxpbmsgPSBkZXZp
Y2VfbGlua19hZGQoZGV2LCBkb21haW5fZGV2c1tpXSwgRExfRkxBR19TVEFURUxFU1MgfCBE
TF9GTEFHX1BNX1JVTlRJTUUpOwotCQlpZiAoIWxpbmspIHsKLQkJCWVyciA9IC1FTk9ERVY7
Ci0JCQlnb3RvIGVycl91bmxpbms7Ci0JCX0KKwljb25zdCBzdHJ1Y3QgZGV2X3BtX2RvbWFp
bl9hdHRhY2hfZGF0YSBwZF9hdHRhY2hfZGF0YSA9IHsKKwkJLnBkX25hbWVzID0gUk9HVUVf
UERfTkFNRVMsCisJCS5udW1fcGRfbmFtZXMgPSBkb21haW5fY291bnQsCisJCS5wZF9mbGFn
cyA9IDAsCisJfTsKIAotCQlkb21haW5fbGlua3NbaV0gPSBsaW5rOwotCX0KKwllcnIgPSBk
ZXZfcG1fZG9tYWluX2F0dGFjaF9saXN0KGRldiwgJnBkX2F0dGFjaF9kYXRhLCAmZG9tYWlu
cyk7CisJaWYgKGVyciA8IDApCisJCXJldHVybiBlcnI7CiAKLQlmb3IgKGkgPSBkb21haW5f
Y291bnQ7IGkgPCBsaW5rX2NvdW50OyBpKyspIHsKKwlmb3IgKGkgPSAwOyBpIDwgbGlua19j
b3VudDsgaSsrKSB7CiAJCXN0cnVjdCBkZXZpY2VfbGluayAqbGluazsKIAotCQlsaW5rID0g
ZGV2aWNlX2xpbmtfYWRkKGRvbWFpbl9kZXZzW2kgLSBkb21haW5fY291bnQgKyAxXSwKLQkJ
CQkgICAgICAgZG9tYWluX2RldnNbaSAtIGRvbWFpbl9jb3VudF0sCisJCWxpbmsgPSBkZXZp
Y2VfbGlua19hZGQoZG9tYWlucy0+cGRfZGV2c1tpICsgMV0sCisJCQkJICAgICAgIGRvbWFp
bnMtPnBkX2RldnNbaV0sCiAJCQkJICAgICAgIERMX0ZMQUdfU1RBVEVMRVNTIHwgRExfRkxB
R19QTV9SVU5USU1FKTsKIAkJaWYgKCFsaW5rKSB7CiAJCQllcnIgPSAtRU5PREVWOwpAQCAt
NjYyLDkgKzY1MSw4IEBAIGludCBwdnJfcG93ZXJfZG9tYWluc19pbml0KHN0cnVjdCBwdnJf
ZGV2aWNlICpwdnJfZGV2KQogCX0KIAogCXB2cl9kZXYtPnBvd2VyID0gKHN0cnVjdCBwdnJf
ZGV2aWNlX3Bvd2VyKXsKLQkJLmRvbWFpbl9kZXZzID0gbm9fZnJlZV9wdHIoZG9tYWluX2Rl
dnMpLAorCQkuZG9tYWlucyA9IGRvbWFpbnMsCiAJCS5kb21haW5fbGlua3MgPSBub19mcmVl
X3B0cihkb21haW5fbGlua3MpLAotCQkuZG9tYWluX2NvdW50ID0gZG9tYWluX2NvdW50LAog
CX07CiAKIAlyZXR1cm4gMDsKQEAgLTY3MywzMSArNjYxLDIxIEBAIGludCBwdnJfcG93ZXJf
ZG9tYWluc19pbml0KHN0cnVjdCBwdnJfZGV2aWNlICpwdnJfZGV2KQogCXdoaWxlICgtLWkg
Pj0gMCkKIAkJZGV2aWNlX2xpbmtfZGVsKGRvbWFpbl9saW5rc1tpXSk7CiAKLQlpID0gZG9t
YWluX2NvdW50OwotCi1lcnJfZGV0YWNoOgotCXdoaWxlICgtLWkgPj0gMCkKLQkJZGV2X3Bt
X2RvbWFpbl9kZXRhY2goZG9tYWluX2RldnNbaV0sIHRydWUpOwotCiAJcmV0dXJuIGVycjsK
IH0KIAogdm9pZCBwdnJfcG93ZXJfZG9tYWluc19maW5pKHN0cnVjdCBwdnJfZGV2aWNlICpw
dnJfZGV2KQogewotCWNvbnN0IGludCBkb21haW5fY291bnQgPSBwdnJfZGV2LT5wb3dlci5k
b21haW5fY291bnQ7CisJc3RydWN0IHB2cl9kZXZpY2VfcG93ZXIgKnB2cl9wb3dlciA9ICZw
dnJfZGV2LT5wb3dlcjsKIAotCWludCBpID0gZG9tYWluX2NvdW50ICsgKGRvbWFpbl9jb3Vu
dCAtIDEpOworCWludCBpID0gKGludClwdnJfcG93ZXItPmRvbWFpbnMtPm51bV9wZHMgLSAx
OwogCiAJd2hpbGUgKC0taSA+PSAwKQotCQlkZXZpY2VfbGlua19kZWwocHZyX2Rldi0+cG93
ZXIuZG9tYWluX2xpbmtzW2ldKTsKLQotCWkgPSBkb21haW5fY291bnQ7CisJCWRldmljZV9s
aW5rX2RlbChwdnJfcG93ZXItPmRvbWFpbl9saW5rc1tpXSk7CiAKLQl3aGlsZSAoLS1pID49
IDApCi0JCWRldl9wbV9kb21haW5fZGV0YWNoKHB2cl9kZXYtPnBvd2VyLmRvbWFpbl9kZXZz
W2ldLCB0cnVlKTsKKwlkZXZfcG1fZG9tYWluX2RldGFjaF9saXN0KHB2cl9wb3dlci0+ZG9t
YWlucyk7CiAKLQlrZnJlZShwdnJfZGV2LT5wb3dlci5kb21haW5fbGlua3MpOwotCWtmcmVl
KHB2cl9kZXYtPnBvd2VyLmRvbWFpbl9kZXZzKTsKKwlrZnJlZShwdnJfcG93ZXItPmRvbWFp
bl9saW5rcyk7CiAKLQlwdnJfZGV2LT5wb3dlciA9IChzdHJ1Y3QgcHZyX2RldmljZV9wb3dl
cil7IDAgfTsKKwkqcHZyX3Bvd2VyID0gKHN0cnVjdCBwdnJfZGV2aWNlX3Bvd2VyKXsgMCB9
OwogfQotLSAKMi41Mi4wCgo=

--------------GPvLoXX7nTYlskGRwm0SBPEi--

--------------iUwl4xwW5ri11RgyLoEjULDL--

--------------0i0qzADuYKdGx02KAhIFWzcm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaXN5OgUDAAAAAAAKCRB5vBnz2d5qsChb
AP4tt986oI6Af8sG1XEppZCehMrxEmOIMHxdiFwTV1kZZwD/R1TVbTXO4j9+aAoZxsqvDQncHAAL
cwDP5sUd8bLvAQQ=
=yvAa
-----END PGP SIGNATURE-----

--------------0i0qzADuYKdGx02KAhIFWzcm--
