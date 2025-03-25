Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6721CA70A01
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 20:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28CF10E5DA;
	Tue, 25 Mar 2025 19:12:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.b="btHe2myF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7CE10E5DA
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 19:12:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hy8CN+b/NUV6toKxiWxHLih1TX1Qc2tIh8nADdZRjAZkMdi8Wd9ToquF7NX2dw9Hj38ikNQgl9peHJvNipqR1YFDATQ/J6ygzK3dG4onSpls9PiXDn7RUPB0C03qJ6uE383h2PWpO1y2iSnxdnb33lhfbEs+GOthoajFnygoqj/zpp0sUWY/2ZY6KAPfWWc3AwnPDRJ2cIW42aqGurCLkdRsXAwQbsd8bGWxvRzPkTH7LvCeOcvpRh1IOALcPYLHZZcIpqn8/66jeyzyvtNwgK8qzaUXPilEUlNvMxX7QvFTxdZ4XDCS5iSpP8UQSS4dSoDR3SJnMQ+NzDr9rb0YFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5f6dgwDX5Ya1VsWcb2S4kVffevPoA0B/DNW+nadS8k=;
 b=s6zcDzs5q/OGQMVPBbhvU15odRp6mina2Yi3Hw8xtaWeiLJxt6KNbPrHdnD21vWhO6m/M/zsvkALjBVbbeThajgEzgb0+2lM90yt0UUI3CEUXdLZJl7oyJ46Zf0JEN1xskDn07g0NuT1k41InwG0zjxPaHqQMAe3r7/bANSWC8xuxEjse/DkAvUykAI0JDHVwiCF5rZ7JUPwdh8s/9a7KSnu1F5jYJWwCnKGw4AQmvh462bcFBI6uO3qbU2aqSxDbmDogHyps4eD5br84h7FdWfT6y9Q76pu0UDNdoMypagAfmA8BXjbArdOPwiZ1Wq/l9HUBl8pg8+KdBwL9aIixQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5f6dgwDX5Ya1VsWcb2S4kVffevPoA0B/DNW+nadS8k=;
 b=btHe2myFy/7GO7ix/j+eWI5KvXMwYghJZXvaNw3e0H5rEiaUH8hn12RGZgYUNEEUYNArR684grByCZtpZSnyP7IZXqzdLHenRELq/BKFAYyvGOFPTqh/FAW5/BGNdq2ZXzFFJv4Pp3YxQu2AIc8WJipv/uUsM+pQuiYTGxlvQkqAmOLM60fvDnyZh0EWuIykXQT7HEAvIaDxg2MyjysHf9001Eh/qZQ/7jq40tbh/ijd/ZWSK2xmvqSuhES+HfORcQo7azSYtfbEiPTkoY1BldMr4Jf1VnXh/8oCL8+zNhpwcM1mjUiuz0tDSidrM/OnBgjgnGAdm6wrLpwbr3WOKg==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by GVXPR10MB8828.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1e8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 19:12:37 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 19:12:36 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "rfoss@kernel.org" <rfoss@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "aradhya.bhatia@linux.dev" <aradhya.bhatia@linux.dev>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
CC: "j-choudhary@ti.com" <j-choudhary@ti.com>, "u-kumar1@ti.com"
 <u-kumar1@ti.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devarsht@ti.com" <devarsht@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "nm@ti.com"
 <nm@ti.com>, "vigneshr@ti.com" <vigneshr@ti.com>, "praneeth@ti.com"
 <praneeth@ti.com>
Subject: Re: [PATCH v10 12/13] drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable
Thread-Topic: [PATCH v10 12/13] drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable
Thread-Index: AQHbmedU8RLo4aYKZEe+J3RXkj2ptrOEP+yA
Date: Tue, 25 Mar 2025 19:12:36 +0000
Message-ID: <3fa79b755e9c6b4bfeeb38f981c4e030844f8539.camel@siemens.com>
References: <20250226155228.564289-1-aradhya.bhatia@linux.dev>
 <20250226155737.565931-1-aradhya.bhatia@linux.dev>
 <20250226155737.565931-5-aradhya.bhatia@linux.dev>
In-Reply-To: <20250226155737.565931-5-aradhya.bhatia@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.4 (3.52.4-2.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
user-agent: Evolution 3.52.4 (3.52.4-2.fc40) 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|GVXPR10MB8828:EE_
x-ms-office365-filtering-correlation-id: a4cec542-5a4d-4598-8fba-08dd6bd1010a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RGJnUnFoYTJKeC9nZ3p4U1lJVW5XZEFjeGtKcE1oQzUvaUdaSC9iUUozYkQ0?=
 =?utf-8?B?QlNxKzNXYUdtS2ZoRnNTSjZ0WWZqcWpWekR4S2k3Y0lZMklMN0JHQ0gvU2pl?=
 =?utf-8?B?R0dLSlVWTW1BSGlTQ3J0S2QzK1FlWVg3cjdaUWpiN25CcE9IMmhCcFU5SjVL?=
 =?utf-8?B?SW92am14NjE1Zjg0MDM2TjIxdEpiU1Qxd2tNcks2R0RVdWUvRmMrZFMyTkNB?=
 =?utf-8?B?SEpTK2JUS3YrbjFiWEdXMjdJNEw1cXJUbkxZemh1TEZtRTcxT0wxTTRjYnhP?=
 =?utf-8?B?QTRzdTBKOER1TTdtemdZWU5VdTJ4dmg3NHpsU3M0Sm9iU3lsampEb3AzbzJv?=
 =?utf-8?B?ZE94cEZYeHFKT21VYTNHZkFGMXFhcmgvSUJYWHc0dHRVdnp0akVNaGRLc3F5?=
 =?utf-8?B?L1NVd0c0cUpqYmVWcUNWdXdZeGNMOEFCb2NjamJJdUZDNG5LbGhBUnFodTNm?=
 =?utf-8?B?SG5pSU5GU1ZPMkxsSUpmZjZ5V3Q2NU96MzIrd0VsYnB4WWQwZEFJUmw1c2NO?=
 =?utf-8?B?bm9UMkNBeGZpVU9zRWRHRDNvclFzNzdlZU9sTG1mWEtsc3pyVzlRdGcxeFYr?=
 =?utf-8?B?UUJnakIrU1htN2dSNmt5SVRMRnJlTHNsR3dFd0piQzN6czFHbHZOZ2VuQWdt?=
 =?utf-8?B?ajZGamZiMGYvU0x5VTF1MXF5Ni9HNW1JUTRSRWVabGdhRjlSTjc1R1lieVVi?=
 =?utf-8?B?NmdVUnp4N3VQczNOa1R2OWJGRWMxM3BjNmdjV3VZRTZJZXlMTWt0RlRneEVo?=
 =?utf-8?B?UkY4cVdINElwNFp4M0lYdDVrS2U1Y3VSeVNjQVhaOXlFNmVMQTcvK2ZwYUx0?=
 =?utf-8?B?aDBBSS9jZUE2K3dVaHpUZEpWYnliSnowdzIxSTVXRWg2QTYzMU05U3hSWFZV?=
 =?utf-8?B?aGZvSXNPZTA5cGxheXB3NHh3Y08wejFaOWdLWUdQNFUxWldzV0pNNnp2c1R2?=
 =?utf-8?B?LytGVXU1R2U3S2pFSENTNFhTaS8wM2IyTmZRL3RVMjFLajd6WEFHOWhDOWNK?=
 =?utf-8?B?MGpEd3UyZTFud2QxQ292Mnp5clRwb0oyODJoRmJkNUNQYlN3Ti8yQTJ4bGZB?=
 =?utf-8?B?SmtUMUdQU2paYkpoc1ZwejNlclZzUktuTkcyUXdTaFM4R0lQQXI4U2ViTVhQ?=
 =?utf-8?B?eDE2aDhvcXJVYzhESUUxQ1ZZbVNHK2s3cUlFRkhVMytBck5ra3pXTU4xS21V?=
 =?utf-8?B?UTJ0Q3JJcU1nSGxpeUVGNXI5bE4vQlR5ZmdZQWIrcXduajhSOWFxVlp0MnF4?=
 =?utf-8?B?MUhrMzRqRFozN1BxcDUrTHFLdVNmcXE4VjlRQnRjMWR4b21FcjNJam9VbW5F?=
 =?utf-8?B?UVpCSmRieTV3akdCMklRbHM0OFJURGFMTmxzczV1clpWZ1Rmc1docUh0V1U5?=
 =?utf-8?B?K3E1ZHN3WU15UmhBSkdsQWoyWmFIdUVGL0hiS1lubGRJRWNvYVo5YjdEQ0ZZ?=
 =?utf-8?B?UnJUSnJyNjNTMmY2cTVrMFBmNy9iZkFBYlQyYzRxbVFLd2V1dkQ0VDZ2aFlI?=
 =?utf-8?B?UUZXT0dwcWFoZzFRZGlqY1lvcXZKbm5HVjVRcjBVNytqOXpDT3E0Y0pCQlY2?=
 =?utf-8?B?a0FqeWY3N2drYzdZb3YyNjhjR2tCZlMwQWhhK3JEZTJwdXBUaUUrUjdGZlQv?=
 =?utf-8?B?Zitibkg4WDlHdjZEOGZpc2NZMElLemdmYzdHQi80NjdxN2hhQThYZWgvN3lx?=
 =?utf-8?B?UldpRVdpckVPYWtKd0hmbStwTWxsWWpoYndQYkQ1T29VWTYvdHhoRzlhMWFs?=
 =?utf-8?B?R3JzeENZTTBtMVM4UEtpOEVzVlhUdkZXNVBUU1o4NGkzMDFTdG1RMmQxQmNa?=
 =?utf-8?B?dWRxUDFRSU1LQzAwZlFwSmJyczFzSHE1ZHRsZkNwUEh5a285eUNrcUxQQ2hW?=
 =?utf-8?B?RUp2NGdzM2hiVDZUS2ZueTNrSDRBdEJrbEZmWEVic0xMV3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnQzNFdaQnhwTnJOQXVFdDBPQWMwUDQwTWloaUJNb1o0S2dqK0JER0JEK1dj?=
 =?utf-8?B?MHhJRlJOYXJDL0lHKzR4UnJIaGdaYVAyakNMQnB6WVp3bEswRnVsQ1pwMXNt?=
 =?utf-8?B?QkNyYXdLeTZhNWtiVWJkYlNnU0dLRzNNNVI4MlZpUmVPZjdnQUdFZC9QQ25j?=
 =?utf-8?B?MTI4dm1lYi93c2w3WGxFSGU1TXRPc1pDQ0szTFVmN09RUXZPRTV3MjFEdXZD?=
 =?utf-8?B?bGF5aTcyN1d1VVRFOEdQYlhYcVM4UUxsK3lnaVpESHlLeEQ2aFJKQzhiZWVm?=
 =?utf-8?B?SVp0dkE0UDN2N2lMUjNDcXBOdDRCOFhvTUwwOXU2KzlibktQSi9QWHphRkxQ?=
 =?utf-8?B?UklhWFRjeVJGZDEwS2hhWTN1bFF4dzdCbGZmaFVkMGFLWWhLdWx5d1B6bVRE?=
 =?utf-8?B?eTBXaUlnQVBTdGdnYTFzVW9sbXduYjhWV0MzcEd2NHFRQURSc1huZUZ3S2sy?=
 =?utf-8?B?THRRazNwdytwL0hZbmdYeVhZbk5sUDFsQ0ZLYkxYMkMrTGpWY3lSRFlGMlVC?=
 =?utf-8?B?V2RrWHN4RUl5cS9yK24vVmN6VktQVTdaVEo1SmlDVlVWdjJIYXEwMjBjODU3?=
 =?utf-8?B?eURqQ0NPblZDekNtL1RsVGcwNThBOVVIRDQ1ZVRjMFBEajVmcmdkY0ZXVXQv?=
 =?utf-8?B?bWoybjJwdVlYUWx2YlNoS1pKaTJkM0xVaWFhSDRuQXFPSk5McFkvV3c4UGZp?=
 =?utf-8?B?b0I3YW51UmllcXU2WVBxUFgxVmpiNWs4TTJCV29oakhnQmJnSVl2M0V3NWI4?=
 =?utf-8?B?YlRLNmM3eTE5MCs4OUxXYVgwL3VnNzJ4NXByUWgwckRkbUZPbHpvNTk2dG5z?=
 =?utf-8?B?M3NqbXhTT0NhdE1Vc3pEWms3b3dQSE5PRjZFT05SRGlUcWM5UkpQeEt3Z3FD?=
 =?utf-8?B?dE9JYXZERjB4MG9lUVJ5dStpL1htZFF5M3dGdU9JNzd2Ynh6VG84TG5wMloz?=
 =?utf-8?B?dThXcjlWY1VyeHAyeWNnb3duQXNTWFBkdG9Xb1EwNFN3c1BpdnRVUnNIVDBY?=
 =?utf-8?B?UVFocFVlODVJQ3dRWXRaMnFEMzVtd2ZoM3VlOUJwYktKNlV4V2J1MklCSS9q?=
 =?utf-8?B?cEIyNWdSUVBKN2tlV2c0ZDhnYlFPMS8yMVhIZVFyZE52T0cwVHBvNUF5MFVV?=
 =?utf-8?B?d2pLbXBlaVphdkpyWWtRY09LV0hpUGVGTFQyeGRpeUdZUFcwNEVCV1pvNWVV?=
 =?utf-8?B?akcvVXd5YlVIazE1ZDBqYWc3dWcvU0RCQmYzNTVlWUUremk4WU9VSlFLQ0N4?=
 =?utf-8?B?RFZ3VDZxcEowUDBHSkZqY1dubWtKRTQydWNnMklPQWhvdG5pMGxwSmFjemwx?=
 =?utf-8?B?Ni84UHBCSWYyZ3Y1ZUV0bHdsczExNWpYV3A1d25rLzIxbXZoOXp4TmNZMEJz?=
 =?utf-8?B?ZTVRbW1QTzhwSHRXRU5QeW9ENjE4aC9iRTJNZlR6VzFERTJGc3QvTXBSck9X?=
 =?utf-8?B?RWF5N3Fidkp2THduT3R3Yjk2MXdmUHVPNGFqZDI0aEUwREpTajdtT3ZIYjdD?=
 =?utf-8?B?K0R1dDE0WUFHcnVBcWR5cEVHQ3Z0czhseDhpVnFpbnBoenJtLzdmMStGdm9E?=
 =?utf-8?B?bithVldFanEwa0pHc2RuNlkySm5uaVdTOE1Ob2JVUVhlZDlLcXVZR0N4QWxO?=
 =?utf-8?B?dHpxdXhDT3drZVNQZkt5akZQNFZqeUF0NC9XMjBKcTUxeW9lc2FQbllkdElw?=
 =?utf-8?B?ZlM0NSs0VmZJN01uYUpBMHIwckhMS2g1U0dPVmlWdFZOYXk3aEVUWTU5dmJF?=
 =?utf-8?B?TFoyMTc4NUNmanNOREJQOFY2aGE1MGxZQVIxOWRlOXhLQVR4UzR5cWdiU3Ju?=
 =?utf-8?B?Zy9QLzUxRXBCMG5CNFN5WVcyOE5WcWZIU3ZjQ1dYUmh5Zjc5ZlAveXQ0Ymdj?=
 =?utf-8?B?RlBHZktvczNxeCtCdEZ6dURhWHMwbU9zNFZQd09FNHlVNjRBVnYxb1h5bHFy?=
 =?utf-8?B?cUc4aE5XdmR1Q2FVYmRJbVJFMTBtQkoweFRTaXo2SVhESkRYQzZtYmN2V3ht?=
 =?utf-8?B?N1cyZm0xd1cwQ1FrSjBPT1d6dEUxZk5Fd3NKNk8yKzhDWEkwZTZjSzJnTjNR?=
 =?utf-8?B?MTNtRTRIZ0xQa3NQN1BRejFka2Rsak1WeWd2dHhhd3JEQzJTSlkxZm1SMTRV?=
 =?utf-8?B?M0dIUk95RlAvUlh0dzBVRGtMWTRaaEI3QXZEZzI1NlRPQ0lGL2phSlk3Q3Bk?=
 =?utf-8?Q?VhlCks0wsL2oSAg2vaR7nJY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC9749D253CA2941BC8D7E857B2C69BD@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a4cec542-5a4d-4598-8fba-08dd6bd1010a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 19:12:36.6172 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jKLPR/d97uTPnSylxglVita26dhvUsV3o/8is4ibqab+xrvD1PZ4M/yPGLJjIaApfPdtdH7zdQbLdwpTKxrNlmJE1pFYLOw03kMOtp6unwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8828
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

T24gV2VkLCAyMDI1LTAyLTI2IGF0IDIxOjI3ICswNTMwLCBBcmFkaHlhIEJoYXRpYSB3cm90ZToN
Cj4gTW92ZSB0aGUgYnJpZGdlIHByZV9lbmFibGUgY2FsbCBiZWZvcmUgY3J0YyBlbmFibGUsIGFu
ZCB0aGUgYnJpZGdlDQo+IHBvc3RfZGlzYWJsZSBjYWxsIGFmdGVyIHRoZSBjcnRjIGRpc2FibGUu
DQo+IA0KPiBUaGUgc2VxdWVuY2Ugb2YgZW5hYmxlIGFmdGVyIHRoaXMgcGF0Y2ggd2lsbCBsb29r
IGxpa2U6DQo+IA0KPiAJYnJpZGdlW25dX3ByZV9lbmFibGUNCj4gCS4uLg0KPiAJYnJpZGdlWzFd
X3ByZV9lbmFibGUNCj4gDQo+IAljcnRjX2VuYWJsZQ0KPiAJZW5jb2Rlcl9lbmFibGUNCj4gDQo+
IAlicmlkZ2VbMV1fZW5hYmxlDQo+IAkuLi4NCj4gCWJyaWRnZVtuXV9lbmFibGUNCj4gDQo+IEFu
ZCwgdGhlIGRpc2FibGUgc2VxdWVuY2UgZm9yIHRoZSBkaXNwbGF5IHBpcGVsaW5lIHdpbGwgbG9v
ayBsaWtlOg0KPiANCj4gCWJyaWRnZVtuXV9kaXNhYmxlDQo+IAkuLi4NCj4gCWJyaWRnZVsxXV9k
aXNhYmxlDQo+IA0KPiAJZW5jb2Rlcl9kaXNhYmxlDQo+IAljcnRjX2Rpc2FibGUNCj4gDQo+IAli
cmlkZ2VbMV1fcG9zdF9kaXNhYmxlDQo+IAkuLi4NCj4gCWJyaWRnZVtuXV9wb3N0X2Rpc2FibGUN
Cj4gDQo+IFRoZSBkZWZpbml0aW9uIG9mIGJyaWRnZSBwcmVfZW5hYmxlIGhvb2sgc2F5cyB0aGF0
LA0KPiAiVGhlIGRpc3BsYXkgcGlwZSAoaS5lLiBjbG9ja3MgYW5kIHRpbWluZyBzaWduYWxzKSBm
ZWVkaW5nIHRoaXMgYnJpZGdlDQo+IHdpbGwgbm90IHlldCBiZSBydW5uaW5nIHdoZW4gdGhpcyBj
YWxsYmFjayBpcyBjYWxsZWQiLg0KPiANCj4gU2luY2UgQ1JUQyBpcyBhbHNvIGEgc291cmNlIGZl
ZWRpbmcgdGhlIGJyaWRnZSwgaXQgc2hvdWxkIG5vdCBiZSBlbmFibGVkDQo+IGJlZm9yZSB0aGUg
YnJpZGdlcyBpbiB0aGUgcGlwZWxpbmUgYXJlIHByZV9lbmFibGVkLiBGaXggdGhhdCBieQ0KPiBy
ZS1vcmRlcmluZyB0aGUgc2VxdWVuY2Ugb2YgYnJpZGdlIHByZV9lbmFibGUgYW5kIGJyaWRnZSBw
b3N0X2Rpc2FibGUuDQo+IA0KPiBBY2tlZC1ieTogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJh
cnlzaGtvdkBsaW5hcm8ub3JnPg0KPiBSZXZpZXdlZC1ieTogVG9taSBWYWxrZWluZW4gPHRvbWku
dmFsa2VpbmVuQGlkZWFzb25ib2FyZC5jb20+DQo+IFRlc3RlZC1ieTogVG9taSBWYWxrZWluZW4g
PHRvbWkudmFsa2VpbmVuQGlkZWFzb25ib2FyZC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFyYWRo
eWEgQmhhdGlhIDxhLWJoYXRpYTFAdGkuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBcmFkaHlhIEJo
YXRpYSA8YXJhZGh5YS5iaGF0aWFAbGludXguZGV2Pg0KDQpUZXN0ZWQgd2l0aCBBTTYyIE9MREkg
c2VyaWVzIFsxXSBvbiBBTTYyNSB3aXRoIHNpbmdsZSBjaGFubmVsIEFVTyA4MDB4NDgwDQpMVkRT
IHBhbmVsLiBObyBpc3N1ZXMgd2l0aCB0aGUgcGF0Y2ghDQoNClRlc3RlZC1ieTogQWxleGFuZGVy
IFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5Ac2llbWVucy5jb20+DQoNClsxXSBMaW5rOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTAyMjYxODEzMDAuNzU2NjEwLTEtYXJhZGh5
YS5iaGF0aWFAbGludXguZGV2Lw0KDQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRv
bWljX2hlbHBlci5jIHwgOCArKysrLS0tLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pDQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJkbGluDQpTaWVtZW5z
IEFHDQp3d3cuc2llbWVucy5jb20NCg==
