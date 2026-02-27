Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILArBNRwoWm6swQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:24:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622EE1B5F5B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:24:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E785B10EAEF;
	Fri, 27 Feb 2026 10:24:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="YJbxIZZF";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="mca3jIrh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A777010E136
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 10:24:13 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61R6rVab3628823; Fri, 27 Feb 2026 10:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=Ltl/ExPlSS6zMHXL97idmKZdQ
 ZQeI5qCMZziX1ljLCA=; b=YJbxIZZF8v0YkzLQRNYmMouBUmrP0rp+vC1CxSoos
 TYl0YM1wQLF0QZRcMBhchOCnzMeNWbAfZh6ocGtOu0FqIVCX/1roBJ0eN1FwCjNf
 bSXo6zgujugKl/py7GKKK4W8i1aGUFaHuHtZoGdnn+lDWNxntCqhyDjxmOC73sc2
 EhrSJHrPyxBnf4ZKLhOohA9deejouqyB4xFf/Xw0GPh4uHzGMB3KPWVtU2mCQm5z
 2LZzxK9ZRMzamk+vKggs/UGo5KIilf/HsFrH9jLQwimIcctmnRJ+QUU8xk3+JQ0U
 eepjbrmWeLLa+UTWVYCV7pS/t15qHJRi/raAb1B0je9sA==
Received: from cwxp265cu010.outbound.protection.outlook.com
 (mail-ukwestazon11022137.outbound.protection.outlook.com [52.101.101.137])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4cjdvv977r-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 27 Feb 2026 10:23:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQ0PlXSNSFjp8gna4A6BSa1KqO1+H8BRsPYNiUVWM9knTrX/yAGcEa5ZNGSy0z/J21ytX5sL8dhuOWHKgRcC4BPfrmWqxCm9gzFT/g5UEHLDmji3I47uMMsyqMczkguVtjZVTG4y42/J9djBhMYV2SVMldlk3VdoKxPZwwxQ3prcK57/BAN6Jj1i+5gHm2n3C9ZNfrBgCrZBgdEQYo99vwdJ21h1vXXie2jEiF1pADF6yjqiEDgdsYzaD4MrL942M5yjkwXKl1CkXbTFzmmi2xrpPlKXdz4v538UCM53SckHBqa0F787Famc+SHYwOKAKq0FLIp4RKq+ETYYUj64+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ltl/ExPlSS6zMHXL97idmKZdQZQeI5qCMZziX1ljLCA=;
 b=mLz4tCNCCQh7LPCxH6h4nPrSFQF/w8XiCukmLnOBrTZcZE+9Wn70rtM3JEvKQI91JUrz1GrISx65rswREqI4qUg7ZRSpz0cUaV3F7RtMSEbmXNF+PYI1tXfpKIzZ1QZapql1dEukfWm/IT2k7GGavbzhVkxjqmhYJhFAaqy6a4QnJk8ertuSFZeag4evc8p186EnSwpmKj0AjGqnurFYW+WvrM6WYrAGAKFrBcylAVpjpFVc+yphT3vYPQ/W+ugat1E7g9vmXCtmPZM29BYe1yxPCVd06xUrc1pX9JLMlIFXcGkT0JksTldmIgNLcnbR+1OyCJk/JPH+TJqAlyDQoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ltl/ExPlSS6zMHXL97idmKZdQZQeI5qCMZziX1ljLCA=;
 b=mca3jIrh1xUtktl+RFgrfU9Et2iAav7ztbrdY9Y7EtqN0L5Y3xglP/7VH8PaBzycaI7mMIT9emo4Gc6GDgTkHorozbO77cqLQWKAYKt11IR5MYmno2a9CMtT452+fFSz//pciK5uBLe2uvzX3T7dp01uJ6GNjLrnX/4J96r7c6E=
Received: from CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e2::14)
 by LO4P265MB6042.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:29c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 10:23:54 +0000
Received: from CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f32f:ed34:4f98:6cd6]) by CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f32f:ed34:4f98:6cd6%6]) with mapi id 15.20.9654.015; Fri, 27 Feb 2026
 10:23:53 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Mark Brown <broonie@kernel.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Frank Binns
 <Frank.Binns@imgtec.com>, Brajesh Gupta <Brajesh.Gupta@imgtec.com>, Alessio
 Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] drm/imagination: Use dev_pm_domain_attach_list()
Thread-Topic: [PATCH] drm/imagination: Use dev_pm_domain_attach_list()
Thread-Index: AQHcp9MsRG5jqtFTgUu8/QJCcxHP5w==
Date: Fri, 27 Feb 2026 10:23:53 +0000
Message-ID: <6854b1ff-d22d-44c2-a4a1-e0718ff4f199@imgtec.com>
References: <20260123-pm-domain-attach-list-v1-1-d51dd7e43253@imgtec.com>
 <c353fdef-9ccd-4a11-a527-ab4a792d8e70@sirena.org.uk>
 <CAMuHMdU5aNzuK2a05y+hPsQubc5EEL4-HWuogwPk4PKJZUm9kQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU5aNzuK2a05y+hPsQubc5EEL4-HWuogwPk4PKJZUm9kQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB3393:EE_|LO4P265MB6042:EE_
x-ms-office365-filtering-correlation-id: 4ca93574-6d07-4dec-a198-08de75ea4ec6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|6049299003|1800799024|38070700021|4053099003;
x-microsoft-antispam-message-info: uFmaJ6Qtp7WJw/ESORC3T/MECStRJ3dGKV/rSqn+Jz9LzoGf8ZTXSFgQ6/Up8XFG/4miUGIScnG6eIr/sBp0L3a2ubg1mSSH2IK7qGgc5E4bG7k21oVJosILkqGZsuCvUtbrs3UOWB5D6VGUoKDy9fTqSHhmXFuV1cH7S8VfhKUJGtwXIzKd1wEJivcwf6W6vmzn7rMyGCwPMgLgD/QABOAH2kNviuLGJ3I8DkadgyBoFwtAGQPXPFgmYCeh/7ER5duURT+o3hQeF84l1a/oOjuvGKif5fYlhz/7IhM0b8QOhEP1XnPiR9H+H964fWPRqcNFDKnuNkW6fFLOTyD3hIbcTukUsJiloXK38m3PD3UH01Qv7p1CuKG8H9lTW+69CCSGro4+0Ytgh1owfNr1F/9kBJcGUnZzTo1RmjeuQoDl829rA5q8ANboo7Oz06IEaVUSaw/Jn9Zj+9WfzbWtfZ6ionStg4Q0ZGribIIBOSn9B9wPeT1FqW9Lr19gtL/69tO70fugrSiT/QzOSUSnxwP+E7aiF8ledTsi4SgvJFBPOiT1Idhhkbdoi+/IGsV5MFmqdZHR+l294wguUeeGzULuQ/KBHLHgx1R/F+J7y1rtlnF2HZOwcpfK+2Xgh8XKRh92T/B1XHeoVVRGQupHMZMnAQLtQn1U/xolQUWzAqlBmEGl0pEeOGT9eADCpvHnILcjBJ4m2eGsV2W6fAzAKhS8/QgeUQsX1r58a5ZX3DI/cjXOPMR2lPxVjEAqZWVj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(6049299003)(1800799024)(38070700021)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFBnUzQwdU1JNUVyZUpOTmQ4bWk1NFlvaEZ2T3JxWXZad243a1JmVGZ0WDFo?=
 =?utf-8?B?eTlMWmRjTGJxMk1iT3l0bDRUL1MxeERmQW1jUFFqcERPTDA5WThTN3Q1NDcw?=
 =?utf-8?B?cHIyOGJRSHV2c2xCckh2aDdwc0k5Rk9qd1ArUmI1QzNJOVgyRFZqT243djNP?=
 =?utf-8?B?WnNlNnJzS3dkRzJvTEVGYStQSFBHaHpReHFqMVA3b2VTUXJyQmN2MEFqU0F5?=
 =?utf-8?B?Mzd6ZWM4MWlCRlFoamNUa0MrZEdrNHl5b0FlZmRTM1g2Y3RkN2NWdjIrTlpB?=
 =?utf-8?B?SkhOc2MxMk9kTXRYQkR4NmVid3Noc2R4OU9aelVxdVFDeWFiNGUvck85U0FE?=
 =?utf-8?B?SGpPazZVbEhsZU9PT285WTg0aVBodzVTL3Q2TnRyZ0hrS3FyL2lTWjBFTCtR?=
 =?utf-8?B?TVpTQ3hSYXFtWmVDNEM1MGtPZ0xKY01CL1ExY0tmakJYYVlaZ0pSeXVUUXlP?=
 =?utf-8?B?QVpvRFFQaUJvWG9pTTkvc0d2NGQyQU1hMklKS0tTa1ZOOVpJdVFPOTVBY21u?=
 =?utf-8?B?RjkrMjdOdHFUM2Y4VjBlVlRkeHhlZlQ5Z01Ta1M4ZENvRzRSNGVYSnFLOURQ?=
 =?utf-8?B?YThUeTlKdG1xRFhVNkgvdHltNlJJbFlidW1iME9HT2Ivc2QxTk1iNVJNN3pE?=
 =?utf-8?B?bXZlZWRpOXRqdlowYUh2bjVsNDF0R1RkWUVrZXhiOEFjQW9HeFZyK2UrcUhD?=
 =?utf-8?B?bktBODQ1YUFkRTZnN3AzR1BHQ1F4VmdMWUc2cWNJS1YrVU15dm1jMWFFS2lG?=
 =?utf-8?B?K2dQaS9yeGV2TjJmdWRDMkFiVkNBMCtVeTFHMk1Od0g5NmRVU1Z3US9mT3NV?=
 =?utf-8?B?dHVJSHUySzYzMUR0MXNhNjBPd1hZY1hyL0s0bVhIbmpGNXVUc3VaQ0kzRFlG?=
 =?utf-8?B?QnBxN0h3ajkxdVdoY2tMM3pTS2FGUlhMcy9LZ0pDWFFTWU1MWVVPZnJWQWI3?=
 =?utf-8?B?UG9mTGVxby9TbWQxYSt5UWMrMjljS284cm1jb2dRL1lPelVRS3hrZzFLZENH?=
 =?utf-8?B?NTJvaCtaQkJIZmx1dm90NlBsZHJXdk42OGxMTG5RSE1pNDdPTWd3NmxWUytO?=
 =?utf-8?B?U1FaZVkxNitWeVd2bXA5K1FsQ2p4S2Iyc1dzVmMvN1duditTOUJEMmk3WkhO?=
 =?utf-8?B?bCtMLysvNWtCNis5b0ZoSTlxVVVkaXRYR0FsU1B4R2JJSTUyaHhtbUpqYnY2?=
 =?utf-8?B?NDV1eVdncnhDc3FXZEtvZHdFbGZoRzErYk1oWG4xc0NWeUVKTjZXSEkrUkhS?=
 =?utf-8?B?bzBKemFhN1k2RjZpdUFGVjE1eGxWdUt1QUg3ZU9QY1RodTl0LzhMTitWWTYr?=
 =?utf-8?B?QTdSeUpNYzZsQmlsWDE5b0tzODJRMlR2YnpXY0h6MzQxSnRjSTdYeHdGNm1m?=
 =?utf-8?B?MjZsSVpGVnZlek4zTGhjQlFCb0R6RUlKY1ZKNEVubkpZd0FMRlZUaG5ZekZz?=
 =?utf-8?B?QWNjeHVQZS9tclhudzRwTE5ySVNFK2ZnbXVYNVJUcnQySStWWE1MZEFudXR4?=
 =?utf-8?B?RHZzcFFsN0FxcWJTUmV5S1J6ZXFHQTFxN2UrSmlpbHIyUmpNMTZWMjJIcDh0?=
 =?utf-8?B?Y1hnS0xkS3E2RDZ5UmtSQ2syRXZZVjBsbU5rTlk0eE5mM3VFUXlZVGZhT2d4?=
 =?utf-8?B?LzFiNTNDdEtnMElGOFdMMm8vN0RTTk1hTldYWTBRUUIrUTkwWDl5Y2R4NWJJ?=
 =?utf-8?B?M01aeFFvQXlBRHRGdUhvZGhscGVkVHlVRlVnbVBvWEIycTVNZ0EzcGJFWGFk?=
 =?utf-8?B?RWtRTjczTVZ2Z2RyRGtxR2xZUzh5cmNTamZiK0RRblhyejQxY2I5UGltN0ZX?=
 =?utf-8?B?NFJmcWtJYjFwTDBSNkNWNVp2aVdHK1VpeThsNWd0REpoeVVlUDZDMHM4RXZl?=
 =?utf-8?B?aDI4YUl4WGdmS3ROSnpwZHR2TDZ3YmIxaytlUStDQnhlTFNJbUpQT3NRNjZU?=
 =?utf-8?B?ZFFkTklPOXlZbWdHWitHeEVxOU9BazZwSU5JZHRTYUpkVUIwRWJKZnRBaFFw?=
 =?utf-8?B?TGRralY1QjV4NFRsUW1oZUViKy9TeC9LbXdJblRySGxXbkVWU3VpVWdyZ1Jm?=
 =?utf-8?B?RG05L0k3cFh0VTEva2tld05SaFI4b3MzR3NDL2w3anhMVDNjclUvQUR4RTk5?=
 =?utf-8?B?dURDeW9kekRLSnFINm50ZHZLWVNXdk0xaXBNVC92OWtBVHZ2Ukx6QVhheWlC?=
 =?utf-8?B?dlFNVjl1UkttMElmZjJ5ODRFeGNWOXcvK2tkNTN5U0E4ZmxJZmh2ejcwemFD?=
 =?utf-8?B?d200bkJxZEg5Um9jRUZnOTNDc29pSVRubm5weS80SEk2UCt1K3cvTTdZQTIx?=
 =?utf-8?B?NHBUU2tOMlNpRE5YQkNDR0dIcXIxNW5ESlBzdGI0VGNWbnVjNEQxKzdiOHhE?=
 =?utf-8?Q?OdD+ZwYVDLJeHkaM=3D?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8KdVXx6mNI15ooIEu60bZdGV"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca93574-6d07-4dec-a198-08de75ea4ec6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 10:23:53.7144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7GJii3x1mK0r+Mp1HXUGNwYPYWFisGQAXQpocV4jmYpe0Eqn5EHkBzAaTS+uo0nKWR2H3Z1o3U81nUXNdMsDXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6042
X-Authority-Analysis: v=2.4 cv=CL0nnBrD c=1 sm=1 tr=0 ts=69a170bc cx=c_pps
 a=CjTcOEdfvbRZRYZIcjvNWA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22
 a=7RYWX5rxfSByPNLylY2M:22 a=qNABUOcEAAAA:8 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8
 a=e_DIcZzCEQYWNHLnFT4A:9 a=QEXdDO2ut3YA:10 a=VOB5tmRHFxP-raRre6IA:9
 a=FfaGCDsud1wA:10 a=Ytm653ucTKQjCvbzLygB:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: fCHhmyhZRCrE3AYgOt6D5rt5pCEuEjoG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA4OSBTYWx0ZWRfX8S4snAt6f5v4
 sqWlVswSJAYNfJNY+eGzrXqHpnZZtv4HdAcv8Lu0wqeqFLMo1UZNSPa76vUnx0bHtlOHGm7u3w2
 mhToWseD+vj+CxZ8Osq2GbsZebz9CHBpY5sHbyzmUI53dJjzeun7zr+EHyWGDURxTUKmTrNx942
 3jc1nrveuXrzcWcsbrn7tUw49tBzcXe0hGFDCPiR2SRVQvISfIRlX5HeBnMui4CJe/gRcyA8T1p
 2/lwyfmAOlvuTh1y6L9RgYRvozjnUSyxBN9euv1Gpx/YuHC3PdJlQPtGixXMghpdi3bc0dTCBab
 9c5PkgBgdM9ifAMpAu8usuZ3FGeJKPM2V+bkCGo41jPYPMgHytnwv8wNsZQy2Xo5tZf5nrAuLHt
 3zaVXq4kA6A2guMnziO7+//JSCqSFfArWl9UbbHTQZPDi+FAo2VTJq8pD48XiEZE0w/IeKXu2na
 qAly3H06vxDI9rqyoMw==
X-Proofpoint-ORIG-GUID: fCHhmyhZRCrE3AYgOt6D5rt5pCEuEjoG
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
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812,IMGTecCRM.onmicrosoft.com:s=selector2-IMGTecCRM-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,imgtec.com,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:broonie@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:Frank.Binns@imgtec.com,m:Brajesh.Gupta@imgtec.com,m:Alessio.Belle@imgtec.com,m:Alexandru.Dadu@imgtec.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Matt.Coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	HAS_ATTACHMENT(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[imgtec.com:+,IMGTecCRM.onmicrosoft.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[Matt.Coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:url,imgtec.com:mid,imgtec.com:dkim,imgtec.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 622EE1B5F5B
X-Rspamd-Action: no action

--------------8KdVXx6mNI15ooIEu60bZdGV
Content-Type: multipart/mixed; boundary="------------uym5rM9BnzYibFOydG0TbcCV";
 protected-headers="v1"
Message-ID: <6854b1ff-d22d-44c2-a4a1-e0718ff4f199@imgtec.com>
Date: Fri, 27 Feb 2026 10:23:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/imagination: Use dev_pm_domain_attach_list()
To: Geert Uytterhoeven <geert@linux-m68k.org>, Mark Brown <broonie@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Binns <frank.binns@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260123-pm-domain-attach-list-v1-1-d51dd7e43253@imgtec.com>
 <c353fdef-9ccd-4a11-a527-ab4a792d8e70@sirena.org.uk>
 <CAMuHMdU5aNzuK2a05y+hPsQubc5EEL4-HWuogwPk4PKJZUm9kQ@mail.gmail.com>
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
In-Reply-To: <CAMuHMdU5aNzuK2a05y+hPsQubc5EEL4-HWuogwPk4PKJZUm9kQ@mail.gmail.com>

--------------uym5rM9BnzYibFOydG0TbcCV
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 27/02/2026 08:10, Geert Uytterhoeven wrote:
> Hi Mark,
>=20
> On Thu, 26 Feb 2026 at 18:24, Mark Brown <broonie@kernel.org> wrote:
>> On Fri, Jan 23, 2026 at 02:44:50PM +0000, Matt Coster wrote:
>>> This helper handles the attaching and linking of the entire list of p=
ower
>>> domains. Besides making pvr_power_domains_init() simpler, this also l=
ays
>>> the groundwork to simplify supporting the varied power domain names u=
sed in
>>> Volcanic GPU cores.
>>
>> I'm seeing oopses in -next on at least k3-am625-verdin-wifi-mallow whi=
ch
>> bisect to this patch.  We get:
>>
>> [   10.820056] powervr fd00000.gpu: Direct firmware load for powervr/r=
ogue_33.15.11.3_v1.fw failed with error -2
>> [   10.831903] powervr fd00000.gpu: [drm] *ERROR* failed to load firmw=
are powervr/rogue_33.15.11.3_v1.fw (err=3D-2)
>> ...
>> [   10.844023] Unable to handle kernel NULL pointer dereference at vir=
tual address 0000000000000018
>> ...
>> [   11.090162] Call trace:
>> [   11.092600]  pvr_power_domains_fini+0x18/0xa0 [powervr] (P)
>> [   11.098218]  pvr_probe+0x100/0x14c [powervr]
>> [   11.102505]  platform_probe+0x5c/0xa4
>>
>> which does seem relevant to the changed code.
>>
>> Full log:
>>
>>    https://lava.sirena.org.uk/scheduler/job/2499326*L865
>>
>> bisect log (with links to additional runtime logs):
>=20
>> # first bad commit: [e19cc5ab347e3cdcc21c97ea5d11af8da7f1358d] drm/ima=
gination: Use dev_pm_domain_attach_list()
>=20
> Thanks for your report!

+1 from us :)

>=20
> I can confirm this crash on e.g. R-Car H3 ES2.0 (after adding a
> GPU node).  Actually I had seen it earlier this week, but didn't pay
> enough attention.  Hence  I just assumed it was the known race conditio=
n
> when removing multiple PM Domains, and thus missed it is a new bug.
>=20
> The issue is that pvr_power->domains is a NULL pointer, thus causing
> a crash when dereferencing that pointer:
>=20
>     int i =3D (int)pvr_power->domains->num_pds - 1;

We've confirmed the same on AM625; there's patches coming today for this
fix and another possible foot-gun we spotted in the process.

Cheers,
Matt

>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------uym5rM9BnzYibFOydG0TbcCV--

--------------8KdVXx6mNI15ooIEu60bZdGV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaaFwuQUDAAAAAAAKCRB5vBnz2d5qsLba
AP9svfpFK2MthOMRZAx1XPGepij6qv0vaSJJ/H3oqLpYRgD+KTaOOa9S07tBF8SRD4IQhVcYY6CH
/Vqza765WqwBqwE=
=Hzy3
-----END PGP SIGNATURE-----

--------------8KdVXx6mNI15ooIEu60bZdGV--
