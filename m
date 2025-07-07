Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 279A5AFB7C5
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 17:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D182310E0F0;
	Mon,  7 Jul 2025 15:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=asem.it header.i=@asem.it header.b="TARbKrY9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2050.outbound.protection.outlook.com [40.107.236.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9535F10E4D4
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 15:44:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pdh1jGBosDLv6IUOnwFkEv6YAs2ZY6dSQD4wN8182VosA9swbibIzeWNCy/YXcKmkPtqjNyXHLOmEKLvingwEW5TkXXH8TkvI3j6dDf3yQCkfDuYRfqJKrXYU/lRXnoyO5LV8hXnYgAVS0+iz5ehoCuIt+DoLH6Cr7MxHtVp+CXEakQ4rlk2ChhPjNT7p35T78YG6eRZ+BuMzWu4NSQPaFmlrEKk/ay3Cnocp9iDHZNM5DriTSVbhkOowuT6perz6SeFhU2wihuUE9ituxvgVZBrp0TT7+wnx50pzsA6u7vp7VKDdKjQiQeFDWjnvSnJlu3wUouBqZqnasRDvmX6gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hoMl9+f243xvGdQkQPns8SK7rgkQATWXhgMuO4r2Qu4=;
 b=s0LEHh4HXjkSY7LOYNJrsAGemHBUHlaJoIp3y2UA6WGMH86o0DlNhw5hOiTU097ynmuDhYwx2nI/xdEe+nyidSK7grXz7M3D5sm3dNwr9P4m/4v5cHV4ox74bmlkCcCi6zUmKTDl4Skkft5q2TCCRFmHhdU4FjnxCEB/cHe2099wUaFJnCra0BPp8qt7ORdr2CFlY4BDsoJi0MGfV2oUEkSIsBbLN0wJP/0QqmQl04sAPNtSo1m78meGzByOh4imViHHT5lz42j3jda5jjJ2jMVjIPnzG06W/EL/n2zjtY3j4un55Z8RQTLj1bXhc4l4BbIbNoctMFZ+oq6kAQJFxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoMl9+f243xvGdQkQPns8SK7rgkQATWXhgMuO4r2Qu4=;
 b=TARbKrY99RnCBTXdFRf/C+DZjQ5/Vrn9F0+bCaGzkXmo1+Dfmk/dqrZ4PG1+lj4NLG0wjctPcmPUMJW6MoY++xpBFC4re4kJFgG86XkuhpmyDJiTgIUv/WC3QuFd1avkGxe+w1mfbBwrEtFaUsDe7prcBVBLcQFmHM/JXBdLUXwP03OEqEpuv0oyDiBmCJNFi/G0cvQIcQGlR3l4m2lGpdWKON2LvBk4yTxwghE0A65Lz1kP5yNI3+Doa9WrOr7fUwDyKCUBOm0urK5iiqSF4N38k9WxHQCV7f5KhQnQl2EtaY91ACTM1kyL+O+qvyrQfRg8qAAWUIxnNy/IiGa1xA==
Received: from PH0PR22MB3789.namprd22.prod.outlook.com (2603:10b6:510:29c::11)
 by DS4PPF7C31BD26B.namprd22.prod.outlook.com (2603:10b6:f:fc00::b30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Mon, 7 Jul
 2025 15:44:26 +0000
Received: from PH0PR22MB3789.namprd22.prod.outlook.com
 ([fe80::e21a:e0c7:aff:b839]) by PH0PR22MB3789.namprd22.prod.outlook.com
 ([fe80::e21a:e0c7:aff:b839%5]) with mapi id 15.20.8901.023; Mon, 7 Jul 2025
 15:44:25 +0000
From: FLAVIO SULIGOI <f.suligoi@asem.it>
To: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@baylibre.com>, Lee
 Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, Jingoo Han
 <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
CC: Daniel Thompson <daniel.thompson@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>
Subject: RE: EXTERNAL: [PATCH 0/2] backlight: mp3309c: Drop pwm_apply_args()
Thread-Topic: EXTERNAL: [PATCH 0/2] backlight: mp3309c: Drop pwm_apply_args()
Thread-Index: AQHb6mm3vhTL/BlCmEG8osSQTtQtN7Qm1vLg
Date: Mon, 7 Jul 2025 15:44:25 +0000
Message-ID: <PH0PR22MB37899F7A6262C599400AF912FA4FA@PH0PR22MB3789.namprd22.prod.outlook.com>
References: <cover.1751361465.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <cover.1751361465.git.u.kleine-koenig@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_e14c1950-b3a8-4278-88f1-6df69d73b9d5_ActionId=400c4944-5946-45a4-93ca-6bdad0535ff7;
 MSIP_Label_e14c1950-b3a8-4278-88f1-6df69d73b9d5_ContentBits=0;
 MSIP_Label_e14c1950-b3a8-4278-88f1-6df69d73b9d5_Enabled=true;
 MSIP_Label_e14c1950-b3a8-4278-88f1-6df69d73b9d5_Method=Standard;
 MSIP_Label_e14c1950-b3a8-4278-88f1-6df69d73b9d5_Name=e14c1950-b3a8-4278-88f1-6df69d73b9d5;
 MSIP_Label_e14c1950-b3a8-4278-88f1-6df69d73b9d5_SetDate=2025-07-07T15:43:29Z;
 MSIP_Label_e14c1950-b3a8-4278-88f1-6df69d73b9d5_SiteId=855b093e-7340-45c7-9f0c-96150415893e;
 MSIP_Label_e14c1950-b3a8-4278-88f1-6df69d73b9d5_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR22MB3789:EE_|DS4PPF7C31BD26B:EE_
x-ms-office365-filtering-correlation-id: bf71732f-8149-4589-041c-08ddbd6d26ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VkRkeVNGRVZSbzZNSmVkWWs2dlQzZzFoYkNQL042a253THZKbXBndU5PNlc3?=
 =?utf-8?B?ZEQrZTFFN1ZkT2tGa3lCOTNBNVlkNWdhU25qUmVjRCs5VDhIY0JRL1pGMTBo?=
 =?utf-8?B?eGx6RUdMeEZkZlcxTVRqdFBoYk1WWjJpSjRsOHZ0amx4V2NWcHh3SG5rUmFY?=
 =?utf-8?B?dFFIT3I1UjVLRmtnYjgraGpJUDUwWDA1R2MzL2w1OTE3MkVqUWJaWDlhaVhZ?=
 =?utf-8?B?d1J3UHowc2pWay8vaG02T2xWQlpNeWFhaG1XazB2SU5SNkFtZlVqcFZqY2VY?=
 =?utf-8?B?TFYvVHBOMEtHQUhTMjErMDBYOVp0dHAweDNvS296ZXhHZ0pBK2plUkpSOUpZ?=
 =?utf-8?B?bzY1OFUrb09HTGNjUHlCc3pYdEN2NGtuTHM2UjVTb2FYc3czYU9qUVRab1h0?=
 =?utf-8?B?N0drRFZqekZaZEpLK3VPUjJYbEhPVk1JTEI2Y2l0enYvMFJqcjJqTFROV2xw?=
 =?utf-8?B?Qk1DdU94T0FFb0ltR0ZQa3hTT0dmT0xaRFloVERPRzdHL2R0Y1NwdG9IczUz?=
 =?utf-8?B?bWM4UjEwMzhaL0hmWlh3NjJhZmc4bS80d2loSWNEQ3p1d1VzaEIyU2RYVkVr?=
 =?utf-8?B?V1BnOGVxQngwZ0JBVFR5TGFqVDlGeVZDSkxUV0ZKUlMwd2M3N1BuMDZqekhs?=
 =?utf-8?B?c3g4MFg2YU52UUdmUkZTaUMwa2oyY3dMQlgvMzNUalkzVklDQ2hYUExXRHZU?=
 =?utf-8?B?eko0UjFFU2ZZTTZTczRNMjBoR3AwcHEzc3RxSTViS3h6a0JGcm0zaEd3a2sv?=
 =?utf-8?B?ZTBrZkdiQm4wcEVVTGhqNFRqdFM4L2hLNHJ3MDB6VG9nQWRqQXZaSmFKU2VI?=
 =?utf-8?B?TXl1Q0RPVFo4SVU2elVWdUI0aExNcUh5VWN4WVhnMStFaWpsTGoyRFhtQjNj?=
 =?utf-8?B?Q1FqS0s1aHR3ZHowWnJMS3VWYlh4MUhOMml4OVVoSWlpOWJkUFYxSVRuNmxT?=
 =?utf-8?B?ck9PTFM0dWZVM2l6amZVTFZVQmloK0FmdlhBTUl3dXpkeER0Z1VJTDRoM3Zk?=
 =?utf-8?B?NGJkejlHcS9ycWFBSC95bmVvT2w4MTdybmdxUXpOTkdwMHMyc2lrbnRlOHBI?=
 =?utf-8?B?cVkxY1J6QkE0cnVnY3luNldBSnVxdTNQSGd0RmNSMkptbG5ud0VJSldHSHR2?=
 =?utf-8?B?K28rMUFtRitURWoza0NOOXFZUzhtelQ2WUlycStacitNZzN0OGh5YnNrZHkr?=
 =?utf-8?B?b3ZGMXR3UllsUU53aXpDd1ZjbmdHYmxmZnRicFl2YUtQUmRMeG9nQUJxWUdj?=
 =?utf-8?B?czZjUi9sVmduYTBTTGNaYS9tTXovLzI1aHp1eUN3aUVwK2wxRVlPWUh5RXgy?=
 =?utf-8?B?VEVuWElxY0xsRXlzMnRWWUQzU3dpM0NHL2JQZTl3aGlPSHZkN240djB6Qklm?=
 =?utf-8?B?VmFXanZBdXN4US9kNURnVXZZb2p2VlVmcHNoYzBUdFRGVHRiZUIrc2ExMVVS?=
 =?utf-8?B?b2t2ZVU3Ti9UYmpTbTVNeXBHRDF2T21zSG9ETG9EWkxqTG1ybVdXN3VBQkVh?=
 =?utf-8?B?SUZtVHNyWmdwN09jVENoOGIzTDNWRU1wbUY4dkJYUzBCWkV3eFVaRWJoREpE?=
 =?utf-8?B?cGplb3FVMXU5U29veXpxZUdEQnNuRkhkVzlyRjdYeFkzOHp3ZUZsVzFEa0RP?=
 =?utf-8?B?N0VjRHg0TzhBNDhuZlNWUWhnMFN0QndBL1B0WHhDUUJFTWd4dU9TMmVUT0hO?=
 =?utf-8?B?UkVqTzY2MkRpenZ1M2RuSXNxdGF0Z2RvalU2N21YbWkzaHhPa3FFK2pzZTRK?=
 =?utf-8?B?dlVSRHNBSUZXUTJPT3psNHZYVEhKZ2U1aWYxUW42aGR0UnA2cjBhd0hRRVMw?=
 =?utf-8?B?dHVFV0cySmh5dXBZUEdKUnZZOGwzOFZ3blo2L3JRQVNrZ0ExK2p6NkxValJD?=
 =?utf-8?B?NXA3OXg4b1k4Q2pCZkJYQWovT00yU0VMRXRxSUg2WGZ5bll1eUtMYTJtZnJt?=
 =?utf-8?B?dTZDT0o3UFUra290Mi9oa3Z2RytHbXZIVXkxMkluYkJzWEdXSWFDUHFSVHgw?=
 =?utf-8?B?YXI4Uk50WVF3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR22MB3789.namprd22.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SGEzUUNMTU1WNno0UTd0UkdmT05vQ2VCMVJsYm9OUlJnYVpXb3pqQU1SODBW?=
 =?utf-8?B?WlE1ZGMvUHQ4elpqanpDZkZCamIraWhuZEV4cU9Wb2RnMHZQbGxqcnZoSDhU?=
 =?utf-8?B?MzkyTnV2NFFZQmRxVzd1WXlpSG11L3BYSHdtNjQ3VmJvQmZENnRaekx3TWV2?=
 =?utf-8?B?UUtkRVFLcUcvbmNNQ3lLUnJZN1oxak9wa2ZZall0cmxIb1FETmgrTnJ1UmV3?=
 =?utf-8?B?OWtvQ3hOUWliL2h0VC9OZDhXellZeDl5bk9DaWpOR0ZYbXk3NVUxUCtQR0k2?=
 =?utf-8?B?cGZsaGl0NUpCbjkvUjZORzBDbnpWZEU1ck04dURPQlNrMks5RExFUmsxUXN3?=
 =?utf-8?B?Y1k3Y2t5ek5SaW1lajNFejdGK2xqUkIxY0RTN0ZyZCt1bzV3ZUhFWU1RVzk2?=
 =?utf-8?B?aDVORjJEYTFJRDM3T2RWSE13cWpObW1hanlLSFc3VzZlRWlKNFFVdDNYWVJD?=
 =?utf-8?B?VnBEc3JFSVhURXBJaU9HMHBJTUorY2J5VDhhejhKbEIyQ3dXSUxTT3I1akg1?=
 =?utf-8?B?SkpkRzNrdDhCMDlQb3pYMjgrUzVTTUtoN05GV0I0WFhQU3EySmdQLzQ2Rzdi?=
 =?utf-8?B?V29pMEh2WFhmc3ZKTmxlS05XQkdNNno3cllGaVh3a3BEbnJzZDVXR2ZhOGl4?=
 =?utf-8?B?WHlBb1hxVlZRREtITEZwYklrR2p0V1F5WVlaNXNEV0pIb2NIeTJWOGd6NHFZ?=
 =?utf-8?B?RG5LaTJDbjBQZUJqVHF1N1ZwUUI5cW9uYmxwODRKTitNRWpPNS8vbTN5THNL?=
 =?utf-8?B?OEF0eHA3cTYvdUpsSjZFQ1VUaUJKd2o4a3RLYktwUFVEbU15OWtKWC81RWRI?=
 =?utf-8?B?K3d3cm5PVDIyVzkxaFJxNkl2YnNudFVJeExWN05WNG90SWhJc1RsRDZQWkpi?=
 =?utf-8?B?enJ3ai9IUlo0T244YUdvdTY2QXFVbnZGVGVORnN4aWozdW5uMmVpU01pZmhT?=
 =?utf-8?B?UU5oNzNOUlhJaCsySWE5N2FNUUVUaGNWVVJNaWdIMzh1c2h5ZUlxai8yd2h2?=
 =?utf-8?B?aVRnanJIMlBQdkdnTHhXcjRUWUlLN1BKZ1l5YjRXallHMmxQSWtWc29EOWVo?=
 =?utf-8?B?MnFsakdxWXNvL1BudjFQVnJHcWEwOWQ3M2ZMb3lUa1dkYlg4N2hjR0ZPL3Jk?=
 =?utf-8?B?Z1V0UVFlVmJRL0JlZlRBVXA2c0V3ZUtRblRsMi9TUVRNR1NyWWFncVZHYnRr?=
 =?utf-8?B?VEx6YnBmcWRXS3lNUlN1b0ZabGVsWktBYy9TNGhjR1UwQU5wR0NrL0JYK3dr?=
 =?utf-8?B?OFN1QTIzTXZkdjJZSitEYUNKcHdoZ213N1IzSEhLdHIrbTRhdXdML1BORFFI?=
 =?utf-8?B?cldBdGxCNU1OUUQvaXJNL3luTGh0Q3FQcHUxcmVMcmVqZ0liSlVVc3V0VDY0?=
 =?utf-8?B?bjRVYTduM2puTk1lZzlhRjRGMnBHbGZEUnB0V3RjUWNKcWM3MUl1RFVhK0gw?=
 =?utf-8?B?Ny91TnhpblAvdTlMTndNTGN6b294NVlnak1nOXQ1Mkh4TmdJd2xXU2NuUTlY?=
 =?utf-8?B?VnNDT0pyNjhaTkVRWTZtMStJcUMvSEZxOXlTVTBITENFd2M5SVM0WjYyUzFU?=
 =?utf-8?B?dFgvK1NMaGZ0VnpFQlJWWXRQaUkxNFlBMmlvNDE5NkJNaFZOOTMweUtMZUFS?=
 =?utf-8?B?a010enJTZGVuK2szbDNaYWhieFducDUyZVpxeW4ybHFndzlYandhckkvcUNE?=
 =?utf-8?B?cTIrNTVXSUM5aDFkZlpYcmdIODZnclJnWEJ4QW00QnFDVVdHYlRTUFVMQk0y?=
 =?utf-8?B?RDBQRUZVV2NGeERDZnRjc1luTjROSG5EcVZmOW1CSGhHdkxubDVBQ1pDbGZD?=
 =?utf-8?B?ZFVPeHdMTndtdVNweXR5d1dlSnRXZE1scUs4MTA2OVpmMzd0MlIxSmI4OGph?=
 =?utf-8?B?bmhvQjlZeWVreHozRkxyYWNUN3NHMW44VDJYc21OZGt2dmtWZWkyZXlaQ3Iz?=
 =?utf-8?B?NzlqK2FILzN4NnFnNjBCZEkyZnUwRDNmQlEzc2Q0MFhmak9rU3pFTnpQcTA5?=
 =?utf-8?B?UTNoZ24yaDV5WGx4bWl5eHdZN1YzRlZLRHR1S2xpRkhyaTh4VERYbm5VZzZZ?=
 =?utf-8?B?dnBLZUdHU0IxOTcweEpISGRTK3FTWGE5VWkzYUNOendGamVCSm5ORUtRdjhI?=
 =?utf-8?B?dDM2eHQ1QVUrZVBXc0xXZGh2RHgxSU83U3F3OXd6U0xiMWtHUjBZR3VYbllw?=
 =?utf-8?Q?7HICBG3tBSnQYa7/dkNR9FY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR22MB3789.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf71732f-8149-4589-041c-08ddbd6d26ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 15:44:25.8408 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 855b093e-7340-45c7-9f0c-96150415893e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ciubfqRNkTAEr2MPTrOna9M6OMoBbnGAyCTee6VlfQGGSXrUPwOnReZ9FNSVQoHPNK4qJEx9nCfjeCfxyXLEyxHs4JlhQbIdlcVTJDLlB0yJRQxCDbimJOXQV05m3sc+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7C31BD26B
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

SGkgVXdlLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFV3ZSBLbGVp
bmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPg0KPiBTZW50OiBtYXJ0ZWTD
rCAxIGx1Z2xpbyAyMDI1IDExOjIzDQo+IFRvOiBGTEFWSU8gU1VMSUdPSSA8Zi5zdWxpZ29pQGFz
ZW0uaXQ+OyBMZWUgSm9uZXMgPGxlZUBrZXJuZWwub3JnPjsNCj4gRGFuaWVsIFRob21wc29uIDxk
YW5pZWx0QGtlcm5lbC5vcmc+OyBKaW5nb28gSGFuIDxqaW5nb29oYW4xQGdtYWlsLmNvbT47DQo+
IEhlbGdlIERlbGxlciA8ZGVsbGVyQGdteC5kZT4NCj4gQ2M6IERhbmllbCBUaG9tcHNvbiA8ZGFu
aWVsLnRob21wc29uQGxpbmFyby5vcmc+OyBkcmktDQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZzsgbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gcHdtQHZnZXIua2Vy
bmVsLm9yZw0KPiBTdWJqZWN0OiBFWFRFUk5BTDogW1BBVENIIDAvMl0gYmFja2xpZ2h0OiBtcDMz
MDljOiBEcm9wIHB3bV9hcHBseV9hcmdzKCkNCj4gDQo+IFtVc2UgY2F1dGlvbiB3aXRoIGxpbmtz
ICYgYXR0YWNobWVudHNdDQo+IA0KPiANCj4gDQo+IEhlbGxvLA0KPiANCj4gdGhlIGZpcnN0IHBh
dGNoIG9mIHRoaXMgc2VyaWVzIGlzIHdoYXQgSSByZWFsbHkgY2FyZSBhYm91dDogVGhlcmUgYXJl
DQo+IGhhcmRseSBhbnkgZHJpdmVycyBsZWZ0IHRoYXQgdXNlIHB3bV9hcHBseV9hcmdzKCkuIFdo
ZW4gYWxsIG9mIHRoZW0gYXJlDQo+IGNvbnZlcnRlZCB0byBub3QgdXNlIGl0IGFueSBtb3JlLCBJ
IGludGVuZCB0byBkcm9wIHRoYXQgZnVuY3Rpb24uDQo+IA0KPiBUaGUgMm5kIHBhdGNoIGlzIGp1
c3QgYSBjaGFuZ2UgdGhhdCBJIG5vdGljZWQgd2hpbGUgZWRpdGluZyB0aGUgZHJpdmVyDQo+IHRo
YXQgaXMgSU1ITyBuaWNlLiBJZiB5b3UgZG9uJ3QgYWdyZWUgYW5kIG9ubHkgYXBwbHkgdGhlIGZp
cnN0IHBhdGNoLCBJDQo+IHdvbid0IGFyZ3VlLiBJdCdzIGFuIGFsdGVybmF0aXZlIGFwcHJvYWNo
IHRvIHdoYXQgRGFuaWVsIFRob21wc29uIGRpZCBpbg0KPiBjb21taXQgN2VlNjQ3OGQ1YWE5ICgi
YmFja2xpZ2h0OiBtcDMzMDljOiBGdWxseSBpbml0aWFsaXplDQo+IGJhY2tsaWdodF9wcm9wZXJ0
aWVzIGR1cmluZyBwcm9iZSIpLg0KDQpJJ3ZlIHRlc3RlZCB5b3VyIHBhdGNoZXMgb24gbXkgYm9h
cmQgYW5kIGFsbCBpcyBvay4NClRoYW5rcyENCg0KPiANCj4gQmVzdCByZWdhcmRzDQo+IFV3ZQ0K
PiANCj4gVXdlIEtsZWluZS1Lw7ZuaWcgKDIpOg0KPiAgIGJhY2tsaWdodDogbXAzMzA5YzogRHJv
cCBwd21fYXBwbHlfYXJncygpDQo+ICAgYmFja2xpZ2h0OiBtcDMzMDljOiBJbml0aWFsaXplIGJh
Y2tsaWdodCBwcm9wZXJ0aWVzIHdpdGhvdXQgbWVtc2V0DQo+IA0KPiAgZHJpdmVycy92aWRlby9i
YWNrbGlnaHQvbXAzMzA5Yy5jIHwgMTQgKysrKysrKy0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IA0KPiANCj4gYmFzZS1jb21taXQ6
IDEzNDM0MzNlZDM4OTIzYTIxNDI1YzYwMmU5MjEyMGExZjFkYjVmN2ENCj4gLS0NCj4gMi40OS4w
DQoNCg0KRmxhdmlvDQo=
