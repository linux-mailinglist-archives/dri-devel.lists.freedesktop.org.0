Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91806ACE2C3
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 19:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0622F10E724;
	Wed,  4 Jun 2025 17:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="gb45xPOa";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="YoOGYGdb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1084 seconds by postgrey-1.36 at gabe;
 Wed, 04 Jun 2025 17:06:22 UTC
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831AD10E724
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 17:06:22 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554GhuCH031919;
 Wed, 4 Jun 2025 17:47:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=9nqqi1jx4wmNiwWMZ84d1DIH5
 Yd13jhUmXG6SiBBMgo=; b=gb45xPOaibs5JsrZ5/O9LgFm3ThtHchsnmQ/oxRgV
 v1HUx1rFCjgFRlqAmtNKVesxK/OSAerx6rJ6pOek28mposEs/44q6ryHNpWBAKiJ
 m4hsCjgWdjvdmOZu8OeoFCbDAjvwIOe2SyURZL+5v7Om7MzzuQvBT1ZfZhduvTjj
 wUtYA+uidUK5NB889yhypZ8EmAqdPiEO4UbkmTaJfEiM1gppymr+1hfES/+vVWUC
 ZkWoZp8MA5BWXSqySrs2xv1YN89TQa8QtgrDjZ7SHO72FpiqrOKAdshvo0bZgBqe
 Ppw45Za6UFCo0eBKJ6F4IKCOxf35xZ8QcFjJKR80O76Kg==
Received: from lo3p265cu004.outbound.protection.outlook.com
 (mail-uksouthazon11020114.outbound.protection.outlook.com [52.101.196.114])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 46yr1s49kn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Jun 2025 17:47:56 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQrJtQHTRr6L/LOTPwE9Q+sCeZzok9KcDSMzalJF6tUZCpAO1wZlj1wLJIRxLtd3fx7E1axg/Ro96Ef42CxwStC5OwdN9Cj4DDxCXN+nS2lF6xYzyBjZ6cX3EXIsoA64yqfpAUhzsgMeD7IUVXLD+0ZCeDWk0XLCtB3eI/pTtFYk1dhzC+iqU6B0qRmqG+YHeDGUXSJZwVZDl2rO3ahpBW9z+JNRKSCBYsJ9oXJtKVFZxNnmEo08R+HrfcdJyjW8ZKSl7jcIz632WY/5ETYPzANSmDQdijWtEvRz0tgKzn/JfVYGCXCQHr3T09GUbpvQScLBTrC41Q+P7mENKPTYOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nqqi1jx4wmNiwWMZ84d1DIH5Yd13jhUmXG6SiBBMgo=;
 b=odR+KTUbbSTs6FhxdLC4Ma6tj5GRpZjqk3xby+VP7kvuZXbs44ivIttFChjkLCIL3meiCrKgGJn+SvKOeZndlB2A3W/B1x/zVp2nRGBnVRNMLCDt8nakKF9Hbspve9hN8p6bmZLGQFpglkE7kyDLWqN3o8R6Q/PTLUOR6Q8K8mimo2n9qrYFyAd8TZ6+CjkR/bO0pynZe7ca8k+QFW+6PhOzVnSk0ppOTWMXMlDABcBAEI2L51/RMSW2oJFC23U/+Ee+sy5HqpMeZZxNOAn5agYttF7zl8uF2tI+rN+gaAsoG2/7Htl+pYUvJgKiiLlsu7Gtdt79Ck1jbqoDLrMh5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nqqi1jx4wmNiwWMZ84d1DIH5Yd13jhUmXG6SiBBMgo=;
 b=YoOGYGdb1HGBBGPtjin2LgUSgMCCGXWxFIpMEmg+xRMVb1hppHeoqJE/G6gXXMqhYV93dX1VPu8Sa6OPUFvoR3GC5XJ1f341Rzhzu+vw4izMGdoqo9pVLoiH8UicFy7DQHN3wxOWFXWNdBkXFE1Rd0NiSjL8ng9nzyipfBDx7pc=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWLP265MB1794.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:5b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.19; Wed, 4 Jun 2025 16:47:53 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 16:47:53 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Michal Wilczynski
 <m.wilczynski@samsung.com>
CC: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 7/8] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU
 node
Thread-Topic: [PATCH v3 7/8] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU
 node
Thread-Index: AQHb1XBqRHesCZ2fGEShg2Dpl2yN/g==
Date: Wed, 4 Jun 2025 16:47:52 +0000
Message-ID: <e39c6748-59aa-4c4a-98f3-263751a120c1@imgtec.com>
References: <CGME20250529222410eucas1p2e1d41a2fc717caef1aed51367a7db944@eucas1p2.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <20250530-apr_14_for_sending-v3-7-83d5744d997c@samsung.com>
 <CAPDyKFpYfZNthdRN=pCv4FEdFCzrKEH4aFBy4ew-xLKtpbJ5Tg@mail.gmail.com>
In-Reply-To: <CAPDyKFpYfZNthdRN=pCv4FEdFCzrKEH4aFBy4ew-xLKtpbJ5Tg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWLP265MB1794:EE_
x-ms-office365-filtering-correlation-id: 7f92d714-b6b7-4e9b-0c8f-08dda3878c85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|38070700018|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?QklzMmlIZGVZQjhZemp0Z1hlUXAyNjNXaHNHUHYvSTdGMjQvZjBSRXdyNjhr?=
 =?utf-8?B?djBGT1dDOWdpRjVNTEhLZlNENW1iQ1J4ZElTR1pTSExBMHFBM0ZVWDJQVFpF?=
 =?utf-8?B?clZwZWlsTXorVFYrdXZSYnBRMFdESzRHUThyQzB2T2dueWVsWWVMT1kwazFt?=
 =?utf-8?B?d2hDbnpFdDNWYnE2ajVGdDY3bno0amw5MVlpZElySDBLVW5iY3dpSDloQ3JU?=
 =?utf-8?B?K21ZTWpKOEZMbmhHdUwyY2IvUEVVMkQ1ZTU5TTNFbUV3cXMvV1pvQW5YamtL?=
 =?utf-8?B?K25KdWNjUTltaUZxTmN6WEVXVDZNUDBjNjFJVmwwL29LcUlNWVpsUHRRMnJs?=
 =?utf-8?B?a2hBdEN3WVQ4Zlh3VnNNbVlKT3ZyL3JVMUFab2Fpb0xTVi9TYWZ1SDZ4UW9t?=
 =?utf-8?B?aDQxYmMzU00rUzFBQnlvRDNNSVMyOFFWRWtGRXhoTmJxS3BHZ0tiNjVuMSsw?=
 =?utf-8?B?ZGlHYll6N3NwL2lqZ1hoVUVSZWN6SlZvazgyOTZoaGdvWE5CQldqZG1leGo3?=
 =?utf-8?B?Z0Q5dFUrZ2FYOEVuSnJ4UEprZ0ZpeThZSmdvSzdiSDVzcEdkNHIzcHJveWVY?=
 =?utf-8?B?bUl1TzdLMkFHVjEzU3hzMWRPZGJtaUtyTVNxSVhVdWo4NmNpc21EWXhsVVYy?=
 =?utf-8?B?Y05icTZ2ckxBVzN0cDl1Y0lFYkh6RkMvNTZiZWs2TWhuakNVYzZlUVFncjI1?=
 =?utf-8?B?ak5VTFdka1FFcjA5SDZmcVFFUlJEY2E1QkdvajhHTXVaaEZTOG1mN3phcE0v?=
 =?utf-8?B?Z2tlbkRXWDlSNUt2WjJEYkpqdnJ3N0FBbzlJV0ttS2MxSDl0SjA0dVROM2hv?=
 =?utf-8?B?Qm43MXgyRklrQlFWS2c0MnNubkh1RDNMM1RNZld4dHBtTnU4ODBiM3B3MTNF?=
 =?utf-8?B?YkFVdzlGNGFWM3ZMYTEvZHY4ZUtMaEFxaVRBeHV0ZUp6a3dTU2JiSXJuVUVH?=
 =?utf-8?B?NFE2Wk5paG84TDUvdU5UVXprc1ZJMVdmemFPRGxSMzNMaE5oMkRoZ291WXQw?=
 =?utf-8?B?eFQ3NW1lMzhJNmh0T0tNbldHVGhaMjZneFNId3pWdk40OWxMTzFHMkM0VjNh?=
 =?utf-8?B?N2V4ZnNxeHY4MTRYS3NtQU5MeENpNllHcXJGWmw3dmtGby9PbnpVbVVqWXhB?=
 =?utf-8?B?M0RSY0FuQzYvcFlJaVJzT1JvWnJEUTZrZTRXS21SOTVSbHVWR0pBYkQ5Q0dL?=
 =?utf-8?B?UUU2WDFpakxYTGNoeTFPZjRXNzgxdytBQ0thdEFZTHJkOSt1bFpaYnZFQlFs?=
 =?utf-8?B?QklVaUlsb25OZENxWkw4TEdoOWw0RDYxN1VESllUd0grYWxOOEZTSU55YnQ3?=
 =?utf-8?B?dGpsV1I1cW9oVjkxWUxQQ20wYXlnRDEvU3NGVC9HUnl6b056aGNQNG82QTNM?=
 =?utf-8?B?aittZHJqN0pEdTlPQ1pDKzhGNjltaWxNejh4b0RBakxXRTRiOHl4aXZrd1E2?=
 =?utf-8?B?TjluZ1d5VXp0R0xUWXRVVWlDS09mTUZzYytreGRtN1FkR0t6U1haWnlEQ2Jn?=
 =?utf-8?B?eWFndVlPTWQxVm54S2V6cHg1SG1DcU9JeWxrWnNaS0tOUkRsanVPdnJsNTRF?=
 =?utf-8?B?Yi81d1hvbUFhRlYxbkJLWnhoVi9NdU9UUEt2U3QxN3lYNUpsMkVYWlBvZHNF?=
 =?utf-8?B?T2lYMFlTb05xelBNbVg4M3R5Rkl0b01TY2VyY0M0L0haaGlIcVV1UnJyRGZx?=
 =?utf-8?B?dURhWklnNFFqWXFBenk1OG5VUFBzWWhwYnRFNXF5alViR1lUUXJpR0pRbFY0?=
 =?utf-8?B?Q2JGNUdWNVBSODFaTHhEZklOUFZuS2hVbG5zTzZxckJnd3RQclFtZ1lYSnQ0?=
 =?utf-8?B?ZEQyOEQwN2xMUm9lSjE0Mmw3K29UN0hPT05SZHRodnpaK2xOalRucnhkT2hx?=
 =?utf-8?B?YXJVdEVGRWdlR2Z0L21aL0VvSXhFd3phTXE0Z0l5Z29WMzY0Nk1wa2dCYmdH?=
 =?utf-8?B?dEplSVY4MVY1WjZsY1RNSCtneXdzdjhtR0pLVHV4VmRSdmtuWEtmTlUxdldR?=
 =?utf-8?Q?m09FPfSw4ac+vrdKZHhxTdM71XW+qQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700018)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWkrZU5hQm9jdXVpNjk0REtPTFhIb3k3d0ZWajNweTZCQVJ2eHBnb0dhalJ0?=
 =?utf-8?B?TC9KRVE5Ujdzb0R5RHlkdS9hZE9WaDVscXMzUnBjbko2K0lTSzVpdXBhaE1r?=
 =?utf-8?B?VVl1YjR3L00yWGlyaDlhdDlmZWlhZUFuQ1RZM29DT2tlOHhhUUg3UkVVc2dC?=
 =?utf-8?B?cHphUjcwaHdTR3VTYnhWNDgrRXE4NmhNak43RHFTakcrblFIalp2OThJWmtp?=
 =?utf-8?B?M0Vac2RZQW9kUmNHRWhYTGlXNEVzNG91cFpiRzhPSEl1cGJVS0YzNVZkNUtL?=
 =?utf-8?B?eS8wbHVNQXBoUFp5dlVVMlpSZWVZaEJHa1ZabkdhZ09nMGpJODZMM1hPajUw?=
 =?utf-8?B?RXlXZHlFZW1BaWNsc3ArUXdSSSsyVGJRei9YSzZrM0hHK2dOMTBrZ0ZyTjZQ?=
 =?utf-8?B?N0QrV280R3JhVlJkQ0dBZnBxRmVrWDBtT0E5MGJ1V3g2Ti9CWGk0NEI3ZUww?=
 =?utf-8?B?UlBCbFdMMnE3YU51bW5sbVF0MmRTSHB6SVFhYnZJckhhSEg3T25HRHVSU0dW?=
 =?utf-8?B?bDB6QXRZTzRySkRZb2h4V1h5TG51MVNVNFBJZU5oc2tubEhQaVBrZm52UUVK?=
 =?utf-8?B?a29oQ24yTkJIcytwYTczTzRtR0pWL21PRnk3SnhJY3BqRFk1R1dMNkU4eGxB?=
 =?utf-8?B?c244QWwwKzZYaXNhalF2SHhzQ0pUYXl5ODZMU2FLZFZuZFdnenFMMzdUa08w?=
 =?utf-8?B?V2MrY0IzV3NHUEdiaElYa2hCeFRxbnFmL1BNOWVVYmFTNlZlK3JQUUdseTdN?=
 =?utf-8?B?aURIbGVNVzNtdjB3VGQ3dk9DbDJoNTREaGtUM2tjNllhYzdOVVdxN3ErV2JL?=
 =?utf-8?B?RnhPSkU1WDhHdkdJOEI2L1hwb0hjTkpndnUwd01ZdUtnZ2NPVHgxdThIVDRO?=
 =?utf-8?B?K1NCMkJCK0k5d2Iza0EvTkhNb21JWFA5eWRWSmhMeTBYSjgxR3h1bm5ycHRw?=
 =?utf-8?B?emdydmVYUDVsck1vSHRQalZza256dlA2NkxDQ2N0T0VOUzFNR0NMd0dkU0M2?=
 =?utf-8?B?Y09ROXJnV0I1NFAwUms1SUQxSE5mdVlUR01YVTlSQlRkdENWMllseW9IZ3hB?=
 =?utf-8?B?ckQzY3djOUdlUUlBa21ZOEV5SlVnZ254djh3TlVqOG5TTEE0TXdocGx5bkJy?=
 =?utf-8?B?YkpkNWFrK2MzZ0VVUjN3TDRZQmd2bEtydFdIWVVnV0RNbHd3ZTh4UXZtUmZm?=
 =?utf-8?B?R0RaMlpjaWtoUk9MYmFRMWk1dlBTSGJma1p5NTJlNTUvelJrS0ozSU5LMXND?=
 =?utf-8?B?SzBVdjdqbDZ4UW9vTXE4M20rbm5yZFdFRFJBUjN4UGltQ1JPV3R1d3VYYXZj?=
 =?utf-8?B?eUk3VWs4MnpIenEwMWV6bElqNTRkNWRaZWM4TE4vcUJPWTIxY3JNNDErQXph?=
 =?utf-8?B?cTFaWHpVTEZta0tGenVTLzBJUWx1VWRPeGFkZlRwK3RnRGx6SkRsZkRaZWph?=
 =?utf-8?B?V3ZiTEt5angyMkxrYmRZZmhsK2grNDI5czNoUVN0OGQ3RmphY0dnUkE0RW55?=
 =?utf-8?B?YWRubUlqSHZWY1FEcVZxUC9tbmpGeFRaRDRqMFlqTkUrUUpGc0JsK2ovc3ZB?=
 =?utf-8?B?VVdlVVhaM0RoU0hpZExwckNJOTVwYU1QUE1NODJ0UXNFM010bmNORUUzcVQ3?=
 =?utf-8?B?UUtFUjc0RW11MXlHVStNV1Y5VEx1OUYvYllibzRsaXFCMGhuU0hsWkxhSjZ3?=
 =?utf-8?B?eEhnTk5FQWQzMFl1K0VsSm9ZOFl4elU1aUFpOEpLUllSbnptL0tsc2QxZTBu?=
 =?utf-8?B?cVZXWTNmWDNNbjVCSjdicUdXZVR0elZHYUJ1Wm8yek53UkpiOU1IZXI5RGJR?=
 =?utf-8?B?UGlPV3FuR2MxMk1XM3Fid0NsdDJNa1cvenNWTnN3azZabnRFNnY3bXFDeFZR?=
 =?utf-8?B?eFRPQzd1QXZyRlpkeW54WW94RDhwcXBrclNZSW10c2d6alRyekNkSDl2Y2la?=
 =?utf-8?B?c2tFVmo3bXdUSlBjbmVCK2dOandpOFVEcHZFazdyVFhJVjNLNFI5NXhHT2Nh?=
 =?utf-8?B?NVh2ejZ2WG9YOERUOCtuVnBHQ2dEN1hGTTBvVXE3SjIvTzFuVS9vcFJkdTlI?=
 =?utf-8?B?cE5BQ2dvVnc2cG5nSm5CSU9qYjhsSVZMK1NyOGhmNnNsbURHdDlRSTNYVktE?=
 =?utf-8?B?U3gyc3VxM3NlTDlITnoya2xZZTE5MXQ1UlRFcUszOG9McVVCZlR1dUVZMUUz?=
 =?utf-8?B?RlE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------exTRLs9Cek9O8APVswKEMWcT"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f92d714-b6b7-4e9b-0c8f-08dda3878c85
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 16:47:52.9357 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A88zxH7j4F1c9cjIKIpj0Wudvzexo9Aw7smWNG5j5/DvhwBy5Eb3PGX6Pw5FjNYNqieadxebf2LKSmqPeholSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB1794
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEyOCBTYWx0ZWRfX/PFfBKkVcsWq
 nwMEWN2hg2ICk3mdC3v+AHT8y1cD6Y1JfmsfyqfMzMNCKWF+YZKky8RgFSyn0Rh7X44E8/j2MH/
 HZzSn/FIkZ5qpGVx+Z04eNu+nRqdniuRYJxtdWucMC92vu6HTjPxkrW1Wq9Uwvo5fLBW1jWSlJp
 WxH2h++Y9vShWhn5+cu7Y3L6PAFLbq7XD22KaT8/BJC8aeVZa1PQRxX/m5zrGGv7WP3fTvHZmKi
 JpdCEnh+7PYVb+lujVbrrUrt+rqpUt900GCwguzr8ZloYsd35bV9Ts3SdC4nyA4aBLQOVMykczf
 Y9cMTkSgZDPt9l+rWunf+jTs4wI4p53KKg0auTqbrGLs+wlGNFAX+HzfR+Qe7Oxc2rLfLszPdg0
 RgnwSQEgMTaSjZB0yphkrJFgDF6S1QYQ7O/bfvh2SV35AvQJ/BqM+90tENKKfn/eXeNiopJ7
X-Proofpoint-GUID: e_1YUH3p9QYAwFdylkjhfdCir3ZH3ybt
X-Proofpoint-ORIG-GUID: e_1YUH3p9QYAwFdylkjhfdCir3ZH3ybt
X-Authority-Analysis: v=2.4 cv=ENAG00ZC c=1 sm=1 tr=0 ts=684078bd cx=c_pps
 a=CHxeKWPuyM/8WOKZB4mBQA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=NgoYpvdbvlAA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=hD80L64hAAAA:8
 a=tmvp2RcnOXokmnWo3QEA:9 a=QEXdDO2ut3YA:10 a=baHJk7X-Z76wR6_dnLYA:9
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

--------------exTRLs9Cek9O8APVswKEMWcT
Content-Type: multipart/mixed; boundary="------------uNH0PIMu3PbikIDBZOzmuitr";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski
 <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <e39c6748-59aa-4c4a-98f3-263751a120c1@imgtec.com>
Subject: Re: [PATCH v3 7/8] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU
 node
References: <CGME20250529222410eucas1p2e1d41a2fc717caef1aed51367a7db944@eucas1p2.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <20250530-apr_14_for_sending-v3-7-83d5744d997c@samsung.com>
 <CAPDyKFpYfZNthdRN=pCv4FEdFCzrKEH4aFBy4ew-xLKtpbJ5Tg@mail.gmail.com>
In-Reply-To: <CAPDyKFpYfZNthdRN=pCv4FEdFCzrKEH4aFBy4ew-xLKtpbJ5Tg@mail.gmail.com>

--------------uNH0PIMu3PbikIDBZOzmuitr
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 03/06/2025 13:27, Ulf Hansson wrote:
> On Fri, 30 May 2025 at 00:24, Michal Wilczynski
> <m.wilczynski@samsung.com> wrote:
>>
>> Add a device tree node for the IMG BXM-4-64 GPU present in the T-HEAD
>> TH1520 SoC used by the Lichee Pi 4A board. This node enables support f=
or
>> the GPU using the drm/imagination driver.
>>
>> By adding this node, the kernel can recognize and initialize the GPU,
>> providing graphics acceleration capabilities on the Lichee Pi 4A and
>> other boards based on the TH1520 SoC.
>>
>> Add fixed clock gpu_mem_clk, as the MEM clock on the T-HEAD SoC can't =
be
>> controlled programatically.
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  arch/riscv/boot/dts/thead/th1520.dtsi | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/d=
ts/thead/th1520.dtsi
>> index 6170eec79e919b606a2046ac8f52db07e47ef441..ee937bbdb7c08439a70306=
f035b1cc82ddb4bae2 100644
>> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
>> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
>> @@ -225,6 +225,13 @@ aonsys_clk: clock-73728000 {
>>                 #clock-cells =3D <0>;
>>         };
>>
>> +       gpu_mem_clk: mem-clk {
>> +               compatible =3D "fixed-clock";
>> +               clock-frequency =3D <0>;
>> +               clock-output-names =3D "gpu_mem_clk";
>> +               #clock-cells =3D <0>;
>> +       };
>> +
>>         stmmac_axi_config: stmmac-axi-config {
>>                 snps,wr_osr_lmt =3D <15>;
>>                 snps,rd_osr_lmt =3D <15>;
>> @@ -504,6 +511,21 @@ clk: clock-controller@ffef010000 {
>>                         #clock-cells =3D <1>;
>>                 };
>>
>> +               gpu: gpu@ffef400000 {
>> +                       compatible =3D "thead,th1520-gpu", "img,img-bx=
m-4-64",
>> +                                    "img,img-rogue";
>> +                       reg =3D <0xff 0xef400000 0x0 0x100000>;
>> +                       interrupt-parent =3D <&plic>;
>> +                       interrupts =3D <102 IRQ_TYPE_LEVEL_HIGH>;
>> +                       clocks =3D <&clk_vo CLK_GPU_CORE>,
>> +                                <&gpu_mem_clk>,
>> +                                <&clk_vo CLK_GPU_CFG_ACLK>;
>> +                       clock-names =3D "core", "mem", "sys";
>> +                       power-domains =3D <&aon TH1520_GPU_PD>;
>> +                       power-domain-names =3D "a";
>=20
> If the power-domain-names are really needed, please pick a
> useful/descriptive name.

This isn't the first time our unfortunate power domain names have come
up [1][2]. Sadly, we're stuck with them for Rogue.

Matt

[1]: https://lore.kernel.org/r/ff4e96e4-ebc2-4c50-9715-82ba3d7b8612@imgte=
c.com/
[2]: https://lore.kernel.org/r/cc6a19b3-ba35-465c-9fa6-a764df7c01c1@imgte=
c.com/

>=20
> [...]
>=20
> Kind regards
> Uffe


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------uNH0PIMu3PbikIDBZOzmuitr--

--------------exTRLs9Cek9O8APVswKEMWcT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaEB4uAUDAAAAAAAKCRB5vBnz2d5qsGV3
AQC/7N/zmcYvgZrABEuCu3uACvSLqpDrSEIs2JyCNo6s9wD/WKK5Mts6A0DGwlzdbLq4m26L3u/0
iOYcPioWwhyQ+Q4=
=M/Kr
-----END PGP SIGNATURE-----

--------------exTRLs9Cek9O8APVswKEMWcT--
