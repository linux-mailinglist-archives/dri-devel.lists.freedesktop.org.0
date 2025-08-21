Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F03EB2F32E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 11:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3F610E8B6;
	Thu, 21 Aug 2025 09:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="uR2T/+LM";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="r9MF8WC2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A471B10E8B6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 09:03:50 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 57L4Kf802738248; Thu, 21 Aug 2025 10:03:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=Vms6r9WElGTlEohm5o2UabADX
 ZmVwb3WxE2VkBd77VM=; b=uR2T/+LMUn3NbCy5l1CDmqAQIGCzECoXcNf8zxI1f
 FVIgGbjRTVG9mJHJ7S/MTf6xQUY2DUO+3poyJYwJMsEAOFmGcLGQrUkxQk8+l3Ns
 SPfy75OgNxjoCK019Mr4/U36yjrPJAJf2dWCyh4K+XeoP0+v3OFPk0yPtM4NLceu
 6bfsluIUV07YHl3/F2s8wSZU8tliprRvQWwMC/2nTX+BIhgtHzjnaycqTnUVWXwo
 RhMCKk3fgdhCysoAhdalsJYWgcQ1T/h0RFSplgLjAc/jSX0f71nqlLua63Vn8K++
 WNq8ghKFjL+RdHvpfrQGh5sN5ASchl3N8XgTUNZDQysPQ==
Received: from lo3p265cu004.outbound.protection.outlook.com
 (mail-uksouthazon11020104.outbound.protection.outlook.com [52.101.196.104])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 48jj2qnaew-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 21 Aug 2025 10:03:33 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GVA5Rsez8QhZnRRFeaecJy0ZwL39O2hP/Aquk4IBjXqozoE3MgbnywJU8bwFIAV8bXeFbfPk4JZNByQJNNErGifo9NRkl+HZzH0vYYxR+nVBmgRQww0T/wAvvU/bHHuxRJPbCT39Nyx80MVJnnl1tW+Y8ZXMNlIyo4R/Rqk+Bzf0G0Y8b1Y2n+cZt9NcZH4i9JwWHTfEkC90AuGZtWwU81JCBRpSKakcEQX6EyRkwjnAUSnYPYZJvb7j+9pLLiNbbj+exqyrYri/8m7c7eEQnAEIjvIdcmLu8L6TCxf/jMfgh5zaUEdLNA+JUR6qo5dwzoJTc4p8mF/6s2RzCCwXaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vms6r9WElGTlEohm5o2UabADXZmVwb3WxE2VkBd77VM=;
 b=sxPw0iTUqHfQzrSZslh/AQuCvkVND2J4XAF/2cuPuNUK3s2jepMmbvhdfLpcR99STnoll+VwnSCHPLzrH7mxFOgfWv0VQ3VVE7fkCb/X5JWyCP+MXGephXCXdOaFuvN2ePPSR4S6G2aYlnp6N34lKkBjafUJk7hQxb65YZY+1IdypMNjMpQCABNPnN2Zg6EvKwPHMvmPc9fLOk63R2BheadGIfOCjTkK5M3QeCHmzQQA2umoJJhRvVF2wYP9O5ikyAPiB6aYwf6CVCX32YC409fEe7+z0Sc41yQ0RM7pcGIK47x9qWbNVh2ZtMuM578Zfy4zt1e6VhuqhO1BQ7kxiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vms6r9WElGTlEohm5o2UabADXZmVwb3WxE2VkBd77VM=;
 b=r9MF8WC2Dt801WvG1KNOrRheYwVJoZzdsvS+AHOIGY5hlFiRWTMKvGw97kN8zokr5CPH+KS14g63ODLKnZriBKF748/vdGyt10YynFhzvmhKcOBgO0ipi0wyduzANrpSklc9mMBlMXlUSvCvPO2cQvRNRJqLvIf7T6NA3g4a1W8=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO4P265MB3712.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1cf::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.15; Thu, 21 Aug 2025 09:03:32 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%7]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 09:03:32 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
CC: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel
 <p.zabel@pengutronix.de>, Frank Binns <Frank.Binns@imgtec.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson
 <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Drew
 Fustini <fustini@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v12 2/4] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU support
Thread-Topic: [PATCH v12 2/4] dt-bindings: gpu: img, powervr-rogue: Add TH1520
 GPU support
Thread-Index: AQHcEnp3CSdBP2TYFEaGWEH3x3wOgw==
Date: Thu, 21 Aug 2025 09:03:31 +0000
Message-ID: <a437f3d0-9da3-44e5-8c98-4aec9aaafa5f@imgtec.com>
References: <20250820-apr_14_for_sending-v12-0-4213ccefbd05@samsung.com>
 <CGME20250820085609eucas1p25d7c6d67318b6c332e3f238705544b19@eucas1p2.samsung.com>
 <20250820-apr_14_for_sending-v12-2-4213ccefbd05@samsung.com>
In-Reply-To: <20250820-apr_14_for_sending-v12-2-4213ccefbd05@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO4P265MB3712:EE_
x-ms-office365-filtering-correlation-id: f366e97a-f9af-42cd-99b8-08dde0919a4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|4053099003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?aDJTbno5MjVSUFU1eWxIVGkwdElsSWpRcC9maS9JR3F5K25XWE9vTjZLMW5V?=
 =?utf-8?B?SVh4SzBIWXV0RUdxREcrUnlTcGtmYTJZNU9pa0NKYXRGLzRoNkJxSEszTDN0?=
 =?utf-8?B?NkRVMk01SEQ2Q0dYUC93Q0FZaWREZUZDUURxdGpZK2RBZm5vTkhVdUFZbW4z?=
 =?utf-8?B?K2hqNDl6d0E2cHRDY3diaVFEV21tNXhocTlzUFMzS3lhc3AvWHlCaDZhc0Qz?=
 =?utf-8?B?OGpwRWRSbEZYbnczV2hrekxnSlpSak96bk1XTTZna1B0emNSVnJSaXF3cVpt?=
 =?utf-8?B?WHVqVDZ3SCt1eDArZi9SN0ZtNk5YS2FlNk9ja0c1T0RudHplU1hFOWZFc3VL?=
 =?utf-8?B?REsxazRsSW1yT0tmUjZIcjFuZldmSWpHb0x2RmlHd2tXRGRmL3p5SGdnUmtO?=
 =?utf-8?B?YTRGSE9iR1RCTjVKWkJzcVdDUUN2dlUxeFNrQi9jbi9ITmpMSkc5MTFOTGxy?=
 =?utf-8?B?ZkNPSXlrYVIxZGU3cTFLMEk3WTB2dHNuWndWSzAxdFVxMmhURW1zTUdPUzZi?=
 =?utf-8?B?cEZvK1R5dUlkTXRza1FHVjJtWXh0cHJrSWNqNXAyTnFKN1pJVCttS0w1Q1Zp?=
 =?utf-8?B?dE9kU0FqRU9hd2x1QzE0ZjNXMVhFK0ZvUjd5NHB0UDlWTDVodXRTSkt4My8v?=
 =?utf-8?B?aWhyTGJ0MlhzQ0hUY1g2VTV5S2I0V1lkVi8rbi9pMjJyUDU2cjdDK05iMVQz?=
 =?utf-8?B?cjVRY0RYZ0d0QjVjZDJMMVRFYktRaThvR1RKT00vTmYraGxHRzcwYjUwa1pG?=
 =?utf-8?B?ZFpJN2NoNzBpR3kzZ0hqb2lHV3htWnNDTFlORk1TTzk3TDlCQVppdVU5UGdH?=
 =?utf-8?B?dC9yb3dzMkJSNmNPb3k4ME9LUGZUQ2J3QW8yU05kcGt5YzVmcE9UZWJMMEQr?=
 =?utf-8?B?eEF1WjkzYVBWRzhiYlV3em03YlZFaXZCRkE1bEl1ZEtEMW93NUJkOW9VVXBv?=
 =?utf-8?B?cDk2TUFIVnpHYWxHNTAwbzk2b3UzWTRJRGQrbEFMd3Q4aFN6MHpXeUJ2VGdZ?=
 =?utf-8?B?WmtENUhmSTZPMmJpd2pOa2J6dnFCU3VPemtHcW0xNjVXL0tsbWZ0MFhRcEFJ?=
 =?utf-8?B?YXN4ancvR2FuV3lubFBBTVQwQ3p5WEpJdlFUWVpXYnkzbmNLODRob2pzRThi?=
 =?utf-8?B?T0habDYzcU5xdmRIejNsZzZrUmUxSTR0L0VXenN6U1pmNDZnZmNvVHNXYlNM?=
 =?utf-8?B?ZjgxU2xsZHlMaHlJd210ZTdrYTVmdW5WQkxLNXNqNkk3YmdWbDhKMmsyUUZM?=
 =?utf-8?B?STFGa0hUUmJrckVzN1dsOGFrRnhDRWdLKzdhVkN2MXd1Y01rbTlOV2tWQUJS?=
 =?utf-8?B?TklMcXEzQitWTGROSjAwL0FEZnh3eklESE1vQjVzcmtTNjR1SU9VV3B2QTZt?=
 =?utf-8?B?bEl5Y2F2SVZ1UXhNUHlNNXRoWW5xR2ttTGdKWHhEUGNualdqNVhFTFNFeXlr?=
 =?utf-8?B?L1ZWeHYzd0h5QTNNdlRhL2dOVmpudlhna2d1SnpRMnBkYWpReE10N0Y0TzNs?=
 =?utf-8?B?b1VMbHZJRkZ2U2x6bDIycGM1WUlaWUM5SUc3UkJZQkVZNjBEVzZxeE4wVnpE?=
 =?utf-8?B?V2c2Y0FoOHJKMWdtOHlMS3lhK2x4ZU1JSmdnUVVzeTlaOUJTQ0YxVHpaRWhx?=
 =?utf-8?B?U09XZDJQMzB0U0xmbjVxdlVEbld0VXlUU2NGMURoSFF5THBJbnF3SUVtMWs2?=
 =?utf-8?B?M255cllocTdiK0svQVdJR0M1K1ozZGJDUzZubm9lU1ZrUUJUdHpMRnBRcFc4?=
 =?utf-8?B?WWQ1SnZDWWthUUF2T0t6ZWR4VXh6ZExzK0FmZVBDWE0xWW52a3A5blFKOUxK?=
 =?utf-8?B?a1hnSnozSjM1dXlPWVgvaEpaN1NSREVmWGgwNFBYeDJVNlQyYVJ3RHJEeWRS?=
 =?utf-8?B?ZTBoYVpSSTEzTDlZdEdnbVFsWjJWMkRMOU1Tems3VDlZYUZhZitEYjZONTB1?=
 =?utf-8?B?Y0lDcWZZUTREUzVPNWpEb2JUV1hHRkFaU2Q0RWQ2NzJyUlI3UE02NTFQK3Z6?=
 =?utf-8?Q?f60PO6RoDFQDum3uXddchDZyFWy1UY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(4053099003)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDg3WDNPdEpHNXdrOC9EMU1YN2ppWVBpUGUzSGJieThzRWtzUEJ3NHlLeS9k?=
 =?utf-8?B?cTJtZks3L1ZNMnNqOEtiS2ZteXRYSTl0V2xHWnFDNVhDdzVLRWNzc0NrMXZa?=
 =?utf-8?B?eTZWdDBIUTRiUDlnVnowaUQ4emR5M2RSVU00eFVMQXAwNmJsT0ZySi9JSFpa?=
 =?utf-8?B?US85Zm0ydUpRNGNRakJKY05KUG1xWnREcGZpUWczZ2RpRUZCSnU3TGVnVndB?=
 =?utf-8?B?cm5Dbm8yS0dHMjhWWURDOGJ2VDR1NzRHN1RRdFhteHR6M0Q4T05mWTNzSHJx?=
 =?utf-8?B?Y3ByK0FtNXdnUkVPRjdzOHJ0OFgwMnNETDNQSmVkeXRZVXBsa3hMbWx1dVdj?=
 =?utf-8?B?SzRRa3J1M25Sdi82SGkvb3E1K1E2WkFOd2Jma2t5bGFoSmRRdXdlVWdNblZi?=
 =?utf-8?B?eGNaSjVYRDhUTk5DblBCMTRaL2h0RWQ5U0NmclQyQkh3SU0weG9xeVZSVW8v?=
 =?utf-8?B?d0NDV1JmMmJmbzRXZldHQXlvdmlWd01IbzhUQVIzeEd5Mk8yMnBtOXBLSEJh?=
 =?utf-8?B?VUwrVmx4U1NOcW41RjQ1bjBhdjh3VjAwOWdzVkVrd2dkU25NVGZvOE9WUGJk?=
 =?utf-8?B?WVBqeE11ZmpDcUVlYUMvQmE3cmxLLzU0UXhLTXZsSmRjZGNqTVFxZDNkd09u?=
 =?utf-8?B?bkVXMmNKQ3RpZnJMS2l0YnpZTFlROGY5NXlzMG54UUVycVlZdzVtMFdKQi8v?=
 =?utf-8?B?S1k5L0Jkc21PeWJoRFEyNk9QWS8yd2ZnN3dkeUIxWWd2THdWKzVaSnNoclJi?=
 =?utf-8?B?dFptQXVGNDFrUWxuRGNTR3QvOWNMYW9GZnc0amw3bmkxQytBZnIxaDBzbXE1?=
 =?utf-8?B?am1FdGVGQXVVYzVxRjQyNUxiK1hwRmVhWG50cXc4ZVNXclppSU5wL0VzYktE?=
 =?utf-8?B?dDR2azh6bkVzQlE1RTNXQnRqQUJFR2Y0YnpsbUxic3FEeVdFa2J5QmQyZVF0?=
 =?utf-8?B?Mm51WklRemVDaU1ncnVMNUxjaFBGb1VzM0JNbEw4TjlxMFVyei9vbVVKVWZW?=
 =?utf-8?B?VjRMU2E4d3lHRDE3WHVVdXdNYUU4MWcwamkyS0lpMWtCMnd4eExnYVU1cmZt?=
 =?utf-8?B?ZUdzTlByYWNPbVJFb0hwQkZUWFFaUXIrazB3YnVxZHNGMjVQZkRsZXdYUEE2?=
 =?utf-8?B?SG9VcEhPWXFsU0hRUVE1YVk0Q1dzVHllbTNZY2c4SzBZd3hVQW9kek5vYVFx?=
 =?utf-8?B?UE05NDJNVk9RcVBmbGJHeUV1SEFxWjM1dGdSZEVqMDNlWFJsdTNnUjlaUlRI?=
 =?utf-8?B?SWNzczhQYXhOOWJ5N2NvbDN3NWFkaS92UGNVWGhyTmlnMGFFeUZ5bFlZT0gr?=
 =?utf-8?B?UGx1OFJubHZDbFo1U1hzenJMMzBIeUdRalRJR2o1NkdrQ2RGNTh0WnE5Z0FC?=
 =?utf-8?B?M0JRTm9qMms4MGxsNzJMelZxaW16NjJtdVVRSGRkMzlTaWs2a2w0SkhuQm9a?=
 =?utf-8?B?Tmw4Z2haaWJqZG9WNmpCWXY1Rlc5Wkp5a1RvbDUrVVlQeWZJWTM1b05TSnM2?=
 =?utf-8?B?SG5zcWZXMUJWK2N4enBYL3dvbm5NbXlzQSt3aUZ3UCtYZjErbzYxbnUrWTJo?=
 =?utf-8?B?KzU5OVYzdzBhZnpxa283SWRzYk1yQW01aFY0WXVSc1U2M1d1K1ZzQlo0UzRC?=
 =?utf-8?B?RmNaVE1wWG0zdnJXYVlrNXhPMlBUZitsL0ZjanFsUit3TEdPcjJvNEdNTEpS?=
 =?utf-8?B?RXpqbkQyVTVxY1ZvcWJ5NGgyVGVyNGNGU2hmYkgzeFozeFVORkp5SEw1WU53?=
 =?utf-8?B?K1lVeEROSDZSZFBmVjloYis4REgyOFRLNGFYTHlGK0NqSFJzV01Xc1BEL0Nv?=
 =?utf-8?B?eklkc2JYQ05JQTFZUUs1Uy9JN0tiVTUydkQ0TjNmUXNhMGZzd1N5U2ZuSG10?=
 =?utf-8?B?Q2xwVzhDRHNWNkdMSU1paUUzaDRxTVZNcFBaM3BLaUNtYUk0RGtHUGhBUlF4?=
 =?utf-8?B?R0NXZDR6OUtBOEJKYXNuRnY0TmlJMEpodFQyOENBZWNLWXZISkIzc2djYTdQ?=
 =?utf-8?B?QzNCVUFrWmM0elhNcEF2M0xFQzhsSyt3cTQzM3FQK3lKUXI4TlZneUdpNGpP?=
 =?utf-8?B?WkRXNi9wbE1TK1QxQXI5enNlYThpVXNCV3VJWStFditac2dnTURzeTFDdUxz?=
 =?utf-8?B?bGhwTE1oeEh2ajlSOGFpUnhqTUFvakllZERSc0xIbVMvUUxpRGxIOGJKWERM?=
 =?utf-8?B?OUE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------naRSQxMTFQXhiy8nPVV5Uqiq"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f366e97a-f9af-42cd-99b8-08dde0919a4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 09:03:31.9668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AM+VLrRrzefCZSOqxE1F6B2OAtWAPF0jaBK+cwZJR56oP9cMcp3gWKlBv4w6FjgWUa/rqEYEX87OK3rlmNzGJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB3712
X-Authority-Analysis: v=2.4 cv=FodcP2rq c=1 sm=1 tr=0 ts=68a6e0e6 cx=c_pps
 a=vhmrVA9xpF0NwcT2SXsBYg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=NgoYpvdbvlAA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=hD80L64hAAAA:8
 a=r_1tXGB3AAAA:8 a=f4pe8lG_Yg_IwD6BSwwA:9 a=QEXdDO2ut3YA:10
 a=BTWr-zJvHxfb9ZeTe7MA:9 a=FfaGCDsud1wA:10 a=cvBusfyB2V15izCimMoJ:22
 a=t8nPyN_e6usw4ciXM-Pk:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-ORIG-GUID: r03L9BCRhMjvxJTVYnZcYH9ffarv6d81
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDA3MCBTYWx0ZWRfX+A64He4QcoxN
 Wh0TqRoL5oazhBGv6412bymajBHtPXz/m9iDP/8MeczwUxEGFMCl+a/+9K6l7/p59b1pKcLrtUP
 LFxhljHetfA4Fa0mRVRatduxJrOTqvylc6xH9DWDlbgK3Vf0+uoF9bTOVbWuSOeDHK8zPiKH0ge
 QqvbSSccynR+JfouksYeiL9pbpgZHtapcZ+I+8tvsJdlgDSVCNBI6Z3W/5WgIegs0fM1t9Wt+yV
 0olNkTGvxBDb5gXzpEfbmUGde6cNYNIFZNLSd7wmzAfm7IliHyLYTonXhOgO9NpWG1EjuPF2ozk
 e2uA9wjzScrR8sR4BxX1isgBqUAwyxzIm9zlNt4rBOJ0x5nVd8z1qrW11B1nx9+ytCIkvbetaY3
 oNiZjUi1c9YMx4Xt7uxxKFYX1UrYtg==
X-Proofpoint-GUID: r03L9BCRhMjvxJTVYnZcYH9ffarv6d81
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

--------------naRSQxMTFQXhiy8nPVV5Uqiq
Content-Type: multipart/mixed; boundary="------------10XRtN3jpYfWmH6Uejs3FgAQ";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Drew Fustini <fustini@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <a437f3d0-9da3-44e5-8c98-4aec9aaafa5f@imgtec.com>
Subject: Re: [PATCH v12 2/4] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU support
References: <20250820-apr_14_for_sending-v12-0-4213ccefbd05@samsung.com>
 <CGME20250820085609eucas1p25d7c6d67318b6c332e3f238705544b19@eucas1p2.samsung.com>
 <20250820-apr_14_for_sending-v12-2-4213ccefbd05@samsung.com>
In-Reply-To: <20250820-apr_14_for_sending-v12-2-4213ccefbd05@samsung.com>

--------------10XRtN3jpYfWmH6Uejs3FgAQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 20/08/2025 09:55, Michal Wilczynski wrote:
> Rework the PowerVR Rogue GPU binding to use an explicit, per variant
> style for defining power domain properties and add support for the
> T-HEAD TH1520 SoC's GPU.
>=20
> To improve clarity and precision, the binding is refactored so that
> power domain items are listed explicitly for each variant [1]. The
> previous method relied on an implicit, positional mapping between the
> `power-domains` and `power-domain-names` properties. This change
> replaces the generic rules with self contained if/then blocks for each
> GPU variant, making the relationship between power domains and their
> names explicit and unambiguous.
>=20
> The generic if block for img,img-rogue, which previously required
> power-domains and power-domain-names for all variants, is removed.
> Instead, each specific GPU variant now defines its own power domain
> requirements within a self-contained if/then block, making the schema
> more explicit.
>=20
> This new structure is then used to add support for the
> `thead,th1520-gpu`. While its BXM-4-64 IP has two conceptual power
> domains, the TH1520 SoC integrates them behind a single power gate. The=

> new binding models this with a specific rule that enforces a single
> `power-domains` entry and disallows the `power-domain-names` property.
>=20
> Link: https://lore.kernel.org/all/4d79c8dd-c5fb-442c-ac65-37e7176b0cdd@=
linaro.org/  [1]
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

Cheers,
Matt

> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 37 ++++++++++++++=
+++-----
>  1 file changed, 29 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 4450e2e73b3ccf74d29f0e31e2e6687d7cbe5d65..c87d7bece0ecd6331fc7d1a=
479bbdaf68bac6e6d 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -21,6 +21,11 @@ properties:
>            # work with newer dts.
>            - const: img,img-axe
>            - const: img,img-rogue
> +      - items:
> +          - enum:
> +              - thead,th1520-gpu
> +          - const: img,img-bxm-4-64
> +          - const: img,img-rogue
>        - items:
>            - enum:
>                - ti,j721s2-gpu
> @@ -77,14 +82,18 @@ required:
>  additionalProperties: false
> =20
>  allOf:
> -  # Constraints added alongside the new compatible strings that would =
otherwise
> -  # create an ABI break.
>    - if:
>        properties:
>          compatible:
>            contains:
> -            const: img,img-rogue
> +            const: img,img-axe-1-16m
>      then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: Power domain A
> +        power-domain-names:
> +          maxItems: 1
>        required:
>          - power-domains
>          - power-domain-names
> @@ -93,13 +102,20 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: img,img-axe-1-16m
> +            const: thead,th1520-gpu
>      then:
>        properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3
>          power-domains:
> -          maxItems: 1
> -        power-domain-names:
> -          maxItems: 1
> +          items:
> +            - description: The single, unified power domain for the GP=
U on the
> +                TH1520 SoC, integrating all internal IP power domains.=

> +        power-domain-names: false
> +      required:
> +        - power-domains
> =20
>    - if:
>        properties:
> @@ -109,9 +125,14 @@ allOf:
>      then:
>        properties:
>          power-domains:
> -          minItems: 2
> +          items:
> +            - description: Power domain A
> +            - description: Power domain B
>          power-domain-names:
>            minItems: 2
> +      required:
> +        - power-domains
> +        - power-domain-names
> =20
>    - if:
>        properties:
>=20


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------10XRtN3jpYfWmH6Uejs3FgAQ--

--------------naRSQxMTFQXhiy8nPVV5Uqiq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaKbg4wUDAAAAAAAKCRB5vBnz2d5qsJH2
AQDtjzB3QifmnhfsCAaUPWivpJDEHRHD+FRcwUCU6nxiAgD+Np+YCUB5sqd/eCYZ+MaDvtvqAOAK
Ax8KM+KKY/PbjAo=
=/z+y
-----END PGP SIGNATURE-----

--------------naRSQxMTFQXhiy8nPVV5Uqiq--
