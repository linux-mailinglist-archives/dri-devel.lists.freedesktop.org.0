Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6CDBF54CF
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 10:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EEF10E596;
	Tue, 21 Oct 2025 08:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="p3X7nENt";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="i0MUpTrk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6AD10E596
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 08:39:57 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59L7gXZS1115197; Tue, 21 Oct 2025 09:39:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=eUsAXfAgQHfRpKbI9bDxUa3yG
 uT82pcfR+BzKxXnMtU=; b=p3X7nENtSjX+KSI7iwEAXfW32gCAwCPA1wCgsOGNX
 Jlx99Tgzk2uPTc7Y/aCZj+YhbCg/+ku9Z9UVzx10b2br25HqIgMf2FSf3A4ySYeX
 PemYJo9itNBPnTPSHGR3zw/3+vKakBtJMKGMZj4G5GOjL33Fo7vzEDqaHypTt+vO
 bWyzMZdLZRwQGDjz1YN7m2VqickWjeb0karG9xt6m5mLawHunH7C8rscmUt5zS21
 II7rz79AQuV9BAWpKwkwgWcoKhiNe/+aCHy8ybr19ow5ufUftkDIOGhJ3l9Of0Us
 TbWggwJ2+C2QTZf7FX3/Bq1hvPxnr9VjUqkfVZ1wTZJzg==
Received: from lo0p265cu003.outbound.protection.outlook.com
 (mail-uksouthazon11022141.outbound.protection.outlook.com [52.101.96.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 49v2ytjkyb-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 21 Oct 2025 09:39:45 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VXL2CS+E9UkHYrjRSICdVAl0xapZSbPV2w1eYTln5QU1+Uyej6+eWWqc8qbS6Qskx668OrhjeB21AFfhh/JTd4vVT3rufgj5xq5r2/oj8y//LqCiDNm0qVfo7fS88qFqSGVlcpCzRwxed6NQtT9uA5E2J73+ZNciJcAnVp7X9b+l2kyLt9kIQUanCfweZBQcHVLHgiKMtPB1nXb5FM6FnsC4x4GvGiBwRxHQT3q8WxBRXe6sWaaonbbxN+9J4SZ27qNNXSQ9RZGCLmg+EJrgM5fmh8vcdT094J8cywDEwFnakD6AbhuCeMGX4wHNfegSJWD6pE7MSj24l4/TL1xqkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUsAXfAgQHfRpKbI9bDxUa3yGuT82pcfR+BzKxXnMtU=;
 b=pIPezKTdPYOq4YicOmsaN8tWuorXGCxfX2eiDHCodL0XjKN4mQxNvSJLPByiVmjdmDzLxgi4MFZ5FK4OFs1/XLODPu3rgHcTud+oamPu9Kmgi2BAJtIg4HxQDNL6RqXlXCEU8oLaKo92o7yuL5H2rdcdiFjPbC2Gc1K1rt9AhnA+6b17NSZ2bYaW9scFjuYr5XtoLMWnxABJ1C4co6a+6OuO8Cl6vyzfrLNRn8eEcQzl/DzmXXXaSubAl2PlGhSaJ4YtlNa4s/RuyeffhUBQeyQ2+4ZnQ5L2r4ZpaTAuzJMbmgIlrNtXazaV8Ef6FTz6l80qEDrA3f4wdx2nhrG+Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUsAXfAgQHfRpKbI9bDxUa3yGuT82pcfR+BzKxXnMtU=;
 b=i0MUpTrkMzGHdV2zGIFZFwv6jmAZtsL29+ZL3Hb7H46/uRPkWE88+G+GnVQGpFRkuII0BHsHjmeXGvD5igYD+LP8GbcBX/1qpMIbdbVsOanW2Abuo/tgGrfboTqZPTJWsMn295W4d1U5bFqBK2uNT92L5Qsvzi5yOdLUMeB15lI=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWLP265MB2436.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:96::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.17; Tue, 21 Oct 2025 08:39:42 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 08:39:42 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Marek Vasut <marek.vasut@mailbox.org>
CC: Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, David
 Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>, Alessio
 Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm
 <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, Rob Herring
 <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann
 <tzimmermann@suse.de>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: gpu: img, powervr-rogue: Rework the allOf
 section
Thread-Topic: [PATCH 2/2] dt-bindings: gpu: img,powervr-rogue: Rework the
 allOf section
Thread-Index: AQHcQmY+GC/awy8Cl0OSvYXjuIyn6A==
Date: Tue, 21 Oct 2025 08:39:42 +0000
Message-ID: <47a4b178-87cb-4137-ac2f-0c9e9f0ea9db@imgtec.com>
References: <20251018130147.12831-1-marek.vasut+renesas@mailbox.org>
 <20251018130147.12831-2-marek.vasut+renesas@mailbox.org>
 <a6d42c7e-1146-4bda-baf6-be04f3185c5a@imgtec.com>
 <2e12fed7-21c0-48bf-94c4-a3d2850a3f0c@mailbox.org>
In-Reply-To: <2e12fed7-21c0-48bf-94c4-a3d2850a3f0c@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWLP265MB2436:EE_
x-ms-office365-filtering-correlation-id: be6fdb1d-6b27-49cf-ac69-08de107d616d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700021|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?bjFNdUlFZlYveU9hamZjOGZuUldwMEtiMmluODI3cUpoeDlNRnlqUW9CQXdC?=
 =?utf-8?B?ZjRKLzVYTTM2Q0tMdW1DMEdpUzU4bG13elpkNHQwUUFXQ2lid3B5dGZNYXM5?=
 =?utf-8?B?VDlBLzc3cTlLWmZTMkFXcUlvRmZqUFlWdjJydUFWL2FxeG5CTzMyNklQZXNS?=
 =?utf-8?B?SWJ1OFgzdi9vUHJtUTZneFZXeTQzaFh3MytKd0RZN0hXQThHOUtnNjQxcEwz?=
 =?utf-8?B?SUEzSjA5RFlQdkhmRFd5WThXS1QxbTNNRGhyTmpSbDJHQmxtMVBLM1Y0aEl4?=
 =?utf-8?B?MmZKYTRuNFpxWFNWeTFudDFWTDFLb21zV1hjU1lMU1pJY2ttMDdLOEJxZzNU?=
 =?utf-8?B?S1ltUVpNZG9QZ3c1a0hjTWpoWm9JWEtOTjlZRDhabjVOR1lDYlEzcVhmMkNW?=
 =?utf-8?B?T3JwNWRHNjR2RmRaWDMvK2JGK2k3Nk8vbjJaZy9HeXdKMlR6RzVqYmlOS2NW?=
 =?utf-8?B?UTNkWUpFNWczcitJK0JONFdTNDk2Sk5tM3BqTFRpMW1MTGlNcjZURWFhb0RX?=
 =?utf-8?B?K3VQT3QxWFg1c1M5Mnl1N3lnSGJoYnVTWEpSNGw3YTBySmlrQ3UyZWV4STZK?=
 =?utf-8?B?MHByM0FXVzJEaDRKRjEvNWJtQ0xyQ1lzRGkxdG5VM2tFTzNXdXd5YVB4Rk1N?=
 =?utf-8?B?bHBoYm85KzZXd2xUcm44aFUvdmQzcnlYTVh1ZW5ma2FmZjY4eW93dDlMTmNB?=
 =?utf-8?B?NXRlSnQ1MitCeTMvUlQzRHZVNldPemVZNkhkbE5FM3hOclJiR1FOdCsyQmo4?=
 =?utf-8?B?NWMxMk9qY1Z0OVhkOFRUelZmUUpjMlZ4YnZDcVBIVnVOZml3Q24weVB4YU5C?=
 =?utf-8?B?VjJMdHp0VC9JSTdwQWNSQXIvTGpkTi91VHhwbE91OGdveDQ1ZXg3RU1FV0g2?=
 =?utf-8?B?anFEWFVnem04QnJjTVNtOFBxdzd2Q1Z2TEhiWjNRSmwrY2NUQitybnJnTkV3?=
 =?utf-8?B?Nm5pSGRoQXVFUGhtZTMxSExBRnhkeTFMajFWMTVjbU1KYXNlU3ZVRldZRVow?=
 =?utf-8?B?bEFQUnJ5Sm13Q3ArbzhSMW9TaTdPYS92NnpCWXBNSEplbUg3VWdKem9ZTDFa?=
 =?utf-8?B?L0VTVFdJdWRYbXVNVGc0NWNuN0V2Q0syS2xUZGJuR2MzeGtrdE1OMEx6MkN2?=
 =?utf-8?B?RS9wODBHc0wxRXZtNTQxdkFaaGMwd0ptbVZ4VGJPY3RCbXU5MVBETkZRSGdT?=
 =?utf-8?B?eXRzU3pkcHpxd3RUcE1nUDZBVVlrb2UrUkFzcmFqQlpSNkphWXlLVWFJOStp?=
 =?utf-8?B?TWNLN1htVHFjMTc4eHVZZjcyd0xRbDIzdS91cktIOWlOWEhXd1hvM2d5dm1T?=
 =?utf-8?B?dG5vak5KeThQSzR1UDNkRVpNNHhBMmtLTDUvRGtheHY5NzhlbGxJaGIxK09E?=
 =?utf-8?B?bnIwT3h6bk0rQk9hdDZncHlMWmtocGRxTlFqV1RwU2NhQ2dMeHRhcEtQMTE1?=
 =?utf-8?B?ZERUU3I5anlzbjFDN2dVTWhDdEFnQnRqdEMyRjhvU3hVMXo1dURPS2lHQTZQ?=
 =?utf-8?B?YTludm9BYXVIc2V2TUhrK1pGZEdDa1BNaFpXaXRYZlc3OTRIL2htMVJjY1lU?=
 =?utf-8?B?N2JQT3RqUXJDNjVYZ3JGNDNtcTFmM0R3cXhvTlJXZ2hrK1N4aENJSEhMbFly?=
 =?utf-8?B?ZHZEK1hVQkdkMGcvdWx6cmw0UFlDSUV4NU5QTnZDZGdmUmRPa3lhdlZNWHAr?=
 =?utf-8?B?YTJIalV0ZGRXbi94d2Q1MGUvNnArSjhZb3lCM0ljRDhRa0xrMGpxNFI4Wmxy?=
 =?utf-8?B?dzg2RmZNNGowQjNzdndwb2Y4UjJvUlRYMlJ5K1FNRkphSCsrb0tqSGtDM1ZX?=
 =?utf-8?B?elZxTVlFZGFrdUNDS29pa2FqS0ZaTFJzMUxDc1A3U2s3YkF0VVp6Sm9QdlYx?=
 =?utf-8?B?RTAvZVNEaU5LbjhLMkpmL0NZRmtHbEgzcFJPZDR4eUhac3FDQUxMUHNFbkhK?=
 =?utf-8?B?N3B3cDV5eHZabFpMbjVzTkQ4azNnd1B3RlpsZkhXYU9VcnZjTjI1RXVmYTZD?=
 =?utf-8?B?UXpzL0tIRUg5R1NpUURXNjhKQm1Dc1J3NDF4cUluMTUycXpMWk5xZzY2OXZC?=
 =?utf-8?Q?u39y3F?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjlYYlJhSFMyY2loVVFSb005WjVBYTZNTlBvMkZCUHowUWRZZytHblh4WHdZ?=
 =?utf-8?B?T3JmMWNTdmRzWUFFZU5TZlNtbEZSdHZ1dTdxTElZMGE5VXBWYy81NWxkVmxJ?=
 =?utf-8?B?eWFDRk9YcDBQbHRzOXlOUHc1QXBFNGpCSTFxbWhHMmh1Szg2cHFXeUdKQkJC?=
 =?utf-8?B?Mng3dEEvZjNTemZ4RFNDVHltV1dJTTd3MzJHdUhuRWNZTjNPQUduNHE5SUJF?=
 =?utf-8?B?TmUwcVdPZjZIODJXdUNyZHVQN2ZlMXQzS1JIc0tJaFpJaUNaMVptdUFQNG5r?=
 =?utf-8?B?c1BHNHlpUmFpeE5YQ3RJZko1SXlJWHRuSkRWWVZuOC9yVUdzSnVDYjZ6dEFj?=
 =?utf-8?B?Mmd3MWlyMWFpeFR1ZE5qd2t6aHB0Slp5WHZuZ2p4aHFCLzlscnlyREFMbjBp?=
 =?utf-8?B?QTRJcHArYzUxdFZWTHhLQjFzd3Z5dG0xMldYdlpoc2h0eWNhSXh5NzJkMmdD?=
 =?utf-8?B?U2tYK0JONnYyY0ZrQ29oTEJkc04wY3REQUYyeVY0aXJyQzQ3NFdGd2w2dzdq?=
 =?utf-8?B?d2lWbGJ5SU1TTmZEN2cxc25DYlZxRTdMZi9KditYWDZqdzA3ZUE0dkJXU2I2?=
 =?utf-8?B?a29tRmtnZnRwNzZjSzBxbWN0MWJ1dW05S215bkJTclpqYjFkWFVJQUdrYXcv?=
 =?utf-8?B?blEySHNPTnNreUF0RlR6dk5NT0JyWERyRVhKb040eVdzV1BiV3JtZmJYRUNS?=
 =?utf-8?B?bkNQMkNjMXNLN0trS1FMd08vWGNvd25SZU5rWmlWZlNDSWo5REtsK2NRMXpJ?=
 =?utf-8?B?ZUJCVU9ZMWpGY3pIc3JGak9xa3BYVlc5ekpZU1A3YTZDMkZydzE4eDE4Mmhq?=
 =?utf-8?B?M3p5OWN2b1E3ZHJLVy9TaW9pcWZ1b0p1NzNHSGh2WDhZYWtPMEkzaEFWZkFL?=
 =?utf-8?B?cVJ4RERPaWZGU1ZVbGIyN0lYbHBQeHJRUnl3TXRlSnYxbUI5bEdCVGRSamw1?=
 =?utf-8?B?ay9HN1ZoK1pBNHBWeFNyeHdGek1VaHJhT2tBUFBDb3hkNlJ0VlVVYTl2WEZH?=
 =?utf-8?B?aWtwQUQ5NkpRNnYrTXJuUVBWK3lwcmI4VnIyMWwrZ2sySXc3eVJ0TUdrVTky?=
 =?utf-8?B?bERUVU5wS0tDYS9RLzYyREVpd3J6Wkx5OVJWOEIwR3gxMjZsWmtFM2NhTm1E?=
 =?utf-8?B?dmxhTXFJM3JDengyaDhNWFU5WXljRGQwNzVtTEpKVUpBWFdLeU45SHhVWFIr?=
 =?utf-8?B?UXJHSnJpRW5sbmxFRnFoZERna2VJNk44aGI3elZTZjBVWWVKR2IxeVJBTTNt?=
 =?utf-8?B?Y1crUVZPdXAzTTFnUVFkUFlZcTlPTHNBME45ZDFjaE1qUEJ2eWhDSkJTUVFO?=
 =?utf-8?B?SS9NNUZhN2tycGlxMFl5djZWSStsY0xUZzhmV0VFTWwzcGVjV2VBTWZ4MWJj?=
 =?utf-8?B?T2V1bHY5WTJMODkySlZQN0NGTCtNcmlRMlg0cmMrbXZVZzdhQXNaUnlPZFhh?=
 =?utf-8?B?cE9yZGIrMDBYajhUcThxSGRrNU9JNFUwMDMrUm96b203Mno0ZzZDeUo3ck00?=
 =?utf-8?B?Z3RqSjFMNmlXVEtPTk4xS2pnSUtlRWtWSmRackh4ZERFNnVPdEFwQkxlNTNi?=
 =?utf-8?B?elM4RVBpd1Fybjl1b3ZyZHhxWmxLVllKTFRvZE9IV05KdzM0N1o0SFBlNzV6?=
 =?utf-8?B?OFk2UVJrUFJSRG1iSEhSdUNiUTRKeHJBWXdJVmZKU1pNZy9IVUptWE5VNTJn?=
 =?utf-8?B?eERUNUZoMTk0T3VDclRMdUw0SDdHN0lLcHVUKzJJQ256VDZyQkI2SlJEb0J4?=
 =?utf-8?B?ODN4WHA4U011aERKOXlGZjVKdzFKbGtkSGpQaS9aeitFRVZNc3Yxc3VNVHY2?=
 =?utf-8?B?SURRNUlvaVAydjlWVWhxbis3Z2htYmVwUncyRitpbmIvSkk1K0FJNm03TE0y?=
 =?utf-8?B?Y0NZRk05ZERpWlQ1akNCN04vaUJGNEFWYzFJSERBYXE3SHNTVjZ1RnJWcEVy?=
 =?utf-8?B?K2JQMk5qOC9GZTduN3JRUU9SK0piRG9PbGdMRlV4QXMxUmljL09RN0pHdVhr?=
 =?utf-8?B?aWhwa2JJNGFZVSt2M2R0K0RnRDd2cUhiaU1idy8rVUIvWmJDRlZOUEEwdEs2?=
 =?utf-8?B?eENzT0VpanZUNklQaDM2YTk1R0poTE5hcngrRnpOdWllZi9QekdINnlUMjkz?=
 =?utf-8?B?Rk9PZHlKam1UMmh2cmlWN0FYTnZyYnFxOE9VQ1dZb29TeExSbWFEMnFSQ2sy?=
 =?utf-8?B?b2c9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------n5vwdlbg8B5EG0azzUKj3Fsx"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: be6fdb1d-6b27-49cf-ac69-08de107d616d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2025 08:39:42.4095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hA3+jYBzwy2Ep7aD2cbFjXlTkkcJF68WPOQ0vcNlcX6N9Bli9MTJzrR2hNQG1l8DbMrWBaNmczbqtxiW5oUKNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2436
X-Authority-Analysis: v=2.4 cv=VqMuwu2n c=1 sm=1 tr=0 ts=68f746d2 cx=c_pps
 a=DaLHQDDaQ4tSWLhwDYBtgw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8
 a=0GhbHzTvVEL956rQmFMA:9 a=QEXdDO2ut3YA:10 a=vSl2KA40KVJObVzj-78A:9
 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDA2NyBTYWx0ZWRfX5MbThuxTWrh3
 wr2UK0TMoP51/q0dn0T977051fVxCxgLtiNWRCn4S4MoPnimWKgAbvogV4RfRWryRwSk5HgQNgu
 5vumqRCalZwcOlQDFx77gGbABh0VFaCcPQejkjfuvjfG+CVu5WNTMAtm5A1MtYNk8Vi1om3mMR6
 0og9j0K+1eN4VbQmV7bFuMXEBPcBuMu0yafKb9RxLODKUxfyRm6BJb5o98ohflu+gYQCzTgFz4g
 SYnQc3oX8XX/NAXU3XKVNQlmEKZSdAmJ+47T71orhqcY7WQSm2A7Xz+PrFwKmWv93v/UfqPKnKO
 tniIdAcFzFquxIO34Edk0ifELmQbcp7mpxWvUUciSULeB6J/vuIwm43V+OgOTUyjDSPKnhQrX/2
 aWZcrV7tso4lOFIJwk3+xI+IQ6GypA==
X-Proofpoint-GUID: hblesv0E_dMcVbwZ24UBNx2uiLvd2hNV
X-Proofpoint-ORIG-GUID: hblesv0E_dMcVbwZ24UBNx2uiLvd2hNV
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

--------------n5vwdlbg8B5EG0azzUKj3Fsx
Content-Type: multipart/mixed; boundary="------------xm3777FncpVMxMAxL95Xfzyi";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Message-ID: <47a4b178-87cb-4137-ac2f-0c9e9f0ea9db@imgtec.com>
Subject: Re: [PATCH 2/2] dt-bindings: gpu: img,powervr-rogue: Rework the allOf
 section
References: <20251018130147.12831-1-marek.vasut+renesas@mailbox.org>
 <20251018130147.12831-2-marek.vasut+renesas@mailbox.org>
 <a6d42c7e-1146-4bda-baf6-be04f3185c5a@imgtec.com>
 <2e12fed7-21c0-48bf-94c4-a3d2850a3f0c@mailbox.org>
In-Reply-To: <2e12fed7-21c0-48bf-94c4-a3d2850a3f0c@mailbox.org>

--------------xm3777FncpVMxMAxL95Xfzyi
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 20/10/2025 16:25, Marek Vasut wrote:
> On 10/20/25 5:12 PM, Matt Coster wrote:
>=20
> Hello Matt,
>=20
>> On 18/10/2025 14:00, Marek Vasut wrote:
>>> Rework the current allOf: section such that all handling of
>>> clocks/clock-names properties happens first, and all handling
>>> of power-domains/power-domain-names happens second.
>>
>> The original layout of the allOf: section was power-domains first, the=
n
>> clock-domains. The actual ordering really doesn't matter, but I wonder=

>> if it would make for a slightly cleaner patch to do it that way round?=

>=20
> It would, but I also wanted to sort this DT part alphabetically.
>=20
> If you want, I can split this patch in two, one which does this
> splitting, and one which does alphabetical sorting.
>=20
> [...]

That's fair enough, I missed the alphabetical part! It's probably not
worth splitting, the change isn't that large. This one is also:

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

And I'll take these via drm-misc-next later today if there are no
objections.

Cheers,
Matt

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------xm3777FncpVMxMAxL95Xfzyi--

--------------n5vwdlbg8B5EG0azzUKj3Fsx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaPdGzgUDAAAAAAAKCRB5vBnz2d5qsLO0
APwJFbRSi0UO75GGS6vB9NNHNjXiH1e4VABv+MHbaaTCgwD8DnP586WnRpv2W1jI344z0MUgsXp7
hgrWHqfCpqQ6Qg4=
=o9Dh
-----END PGP SIGNATURE-----

--------------n5vwdlbg8B5EG0azzUKj3Fsx--
