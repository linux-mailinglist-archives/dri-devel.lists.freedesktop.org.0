Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6913A99E25
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 03:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA8110E1DC;
	Thu, 24 Apr 2025 01:25:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="X/HfGn57";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DF510E046;
 Thu, 24 Apr 2025 01:25:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A8+laCPrxebvauW1hgPd2sVRA+TX1XTwwJFhA58Q4dDavE9SWe97Ct6OwSXMRCB00F8geQ56r6q2iDctF6v7KvaVv5LTpWinqhotJwfOX5J3CgDcShnjx3TTkr10s50zSBctx9CK+AWsuQitnQBvHSHkpl05jUOvK9quGbebv93fMeUWKyjizUPyLX47f1EoKn2ct74y1ZOpbEp1Pdo3Mnr1anQWI3AOO2VYbcISAdNeykJFkflC+IlGDYsLe010cR0dWgGCeBGN8II+qBqeKzbYkuSHWtUBd9NBJR8rV4m3gdBDdVRsg16M3+25XvP4eyTFNbuX5LyUKvkm9s15BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jp/AXWR7+6Kbsl8rmA6Qc4wARwenM+O6diujhQctC08=;
 b=Ghr4j18fvTfc1vwLa9AsbbgQYQhcfXnKL6xo1Gm/kaVOdEcqYlTS31xgzilw6nObXSrESWdQRLTwAanZDknVeg1cudGOSRrbJszwDJ+lL0+6HclxiYmxNrB2Z0nlqiCI8XJHKu7S+aQobLuSaBe7DXyaGcbeIIgcaJyfHvbGcZRQTGWBwLeB9pJsPYyBMmMu9d4KYwioAPjE1Gxvw/zca+Cv7AovrqtEopNCRB5/V3x/tuMf5Cj+rMv5/Wvg09LMW/M45SLwYmGN2IkqcMT/R6TtNcmij87YCI1T+R0beF7lBy63vp0YjMryK9GZMaKwyXqSK4o0Thj1xJg4GFXAzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jp/AXWR7+6Kbsl8rmA6Qc4wARwenM+O6diujhQctC08=;
 b=X/HfGn57jKzlaBG0zY5K2UXDDFhhS/FidqRuHsOhA5UHKd4LnYccW+tO4MkLYg43iXYbvZeMpH0XxjlP0EpCRgSuO67bxO+z2oxy0nCHD0OBO+cfbpjPPQn/bHZSqJn02vNVkmnCdsqNRGyLivruJzxn1chQB2fv1o3HAovSHxv4NpjU6HThrC8719gyVUIw0i5JJ/InGR6rJf/1dIKwliW9E0CLY16j1s3u6O2xVRNtfvt8HlZMrKsE0wepB5bcvwvMA1SNnAleJ+Dg+ewImvGI53PwLfg0ArXJmqyNzvfF3tHRgys0vC3yrF/ZOCk9HrFohozPjfw9XmJ9a9l4EA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB9115.namprd12.prod.outlook.com (2603:10b6:a03:55c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Thu, 24 Apr
 2025 01:25:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8655.033; Thu, 24 Apr 2025
 01:25:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Apr 2025 10:25:42 +0900
Message-Id: <D9EH7958IAJZ.1R6EJXUR5H3NB@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "John
 Hubbard" <jhubbard@nvidia.com>, "Shirish Baskaran" <sbaskaran@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Ben Skeggs" <bskeggs@nvidia.com>
Subject: Re: [PATCH 0/6] Additional documentation for nova-core
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250423225405.139613-1-joelagnelf@nvidia.com>
In-Reply-To: <20250423225405.139613-1-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP286CA0250.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB9115:EE_
X-MS-Office365-Filtering-Correlation-Id: d6733ceb-dc67-47a0-f90c-08dd82ceef84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTZzSGFJaHNndzg1SWM2cVp1Z3hFajQ2Q0VxRHpFMDJyZ2NqYnJJVEFlUHJG?=
 =?utf-8?B?VkZUU29WOEVvdzcxdWVvWHBGV2x4cDZITU1lb1VVVlE0MlNLTTg2VTVOTFJB?=
 =?utf-8?B?RWdHUUlOVkcyL05Ndm4yajJpVnk0TDZUdUdLV2dBVUxUb1ZZUWJ6WTRNMDIx?=
 =?utf-8?B?WEJBMkpZSE1BZHlsem9UQjNjMlJEL0MrYXBCQXlHVm41Vi9IaXg1S0hqY01G?=
 =?utf-8?B?Nk1aL0l1R3NQbXk3SzZjOFRXWDJERytCTERVa2pFWDNZVzFhWWNNcjlmaFp4?=
 =?utf-8?B?d2tmNDJhSE9EQ1lVdDdjanAydW9oaE5OQTlESm5VNWtpT1ZVUGk2c25RUG9R?=
 =?utf-8?B?amdySWM3UjdzcjBRV1BoR1NJSnRRVkh4bzZaLzNBZ0NPUTFFTXBWR1czOUg4?=
 =?utf-8?B?MGhDTjNJbkxvemI1SzFZeVdwc3ZwcEZFMmordUMzSnhKTTNacFZzK1hGZ1VL?=
 =?utf-8?B?NGp2b1BnZzR5RkZaclVKbkoxTE9aZzJDSTJxTU54YlFVWW9tY2RaUUp5T1Z6?=
 =?utf-8?B?VDZreXhvQWM1Z25xMTVGTG5NcTdFVlpTK0NKR05nK29FckV2ckd4SGUwc2lR?=
 =?utf-8?B?U3BsWEZtRVlKNitab2RFZDQ3M2RzUktmbC9TVHhIZmpZSUZMK1B4S3ZBVjVv?=
 =?utf-8?B?clFsOFY5ZWhOLzdjSXo2ZkNUa0tlbDFpL3JhSzdtbktqV2kvNVkwRExqUndY?=
 =?utf-8?B?allBWmYvOUdCV2xiZE5CM1llSkhrYllPWCsvaGFZajYxbjByNnBHNk5PdUp3?=
 =?utf-8?B?OGdCYythZmtHcXc4SFRQdFFoSm1TMG0zNWtNS1RFdHpKclZGVlpteGIzNEw4?=
 =?utf-8?B?TFNTamZ0V1AxKzJ2U3Njcm9pdkwyZlZndVI4WC9ybnlSUTl1eHdhazB1NVZS?=
 =?utf-8?B?aG43cTBJby9rTkErVXN2ekdGTC9USXF3R2hjSFdHT3hHZXFwWmkyblNXai94?=
 =?utf-8?B?YnJ6UHIxR09FbGxQdWY5c2RFSFVJZm92N3ljMlg0SEJERnhPS0Zlam5abE1P?=
 =?utf-8?B?dEdUN1FEWGRVTW5hZ0laUnhzRVoyNjU5ZCtCMEt3R0JhemxoWGJrNzEwN2sy?=
 =?utf-8?B?cGpGbmZHRXpiWGZYa01aNWVnVjNuWDFMa1JGbFBkN0QrZG1vRGpZaVhoRTho?=
 =?utf-8?B?OEFJR3ZwOFI1a0NCaHlaNnVCVEt6ZHI3MmJ4M2MyOE4rNXM3czNrS3hYVm9m?=
 =?utf-8?B?bWwwNTdaZDhYTUVFSVVMZlVOUDVmQVV4ajZQTjFPU3BWaHRwbm55VjF1UGNM?=
 =?utf-8?B?bVNvZG94V0V5U0Erd2NVSUdoU0RYVWJvbEpkbUc5YVo3b3M2WDNLRUlNOU13?=
 =?utf-8?B?VHFQcFhEMnI3aVRzUGJwVkVBb3RrRlN6S0paTnIxMHpSUy8xMzZoN0pCcUxx?=
 =?utf-8?B?K2Yyci9jTU5PZS9QeWgwWUNxZzJhbXVRYXFRNnFxYVZaeTh2ZkpVSDBoRUp6?=
 =?utf-8?B?L2tqemJVZWZjTEo2L3lzRm0ycW9zME5VR3U3ZlM1VDF3LzlJMmg2Y3lqdEZj?=
 =?utf-8?B?NDZ2aG5tL2Y5SFo4MldEdnVubUFrYTJtc1VaVTZDNjUxTHZyWGhHTm5tRDRJ?=
 =?utf-8?B?dHhtOWlFbngySVB3MUxFb0wybDVSTU5La09LUnJPcENkL04vYjJlYTRWUWRR?=
 =?utf-8?B?MU42RHp3a2VUakdoU21GODVZTXRDOWUxOEFoUDIzY21vWnVRQjZYRnd3SGVU?=
 =?utf-8?B?TmdaZkQ2enNnNkdHMkRIMUVQdFI3RUhkdXJlT0RCREpsVGdHUE91SWdtUHY3?=
 =?utf-8?B?RU5Nb2JNaFBzZnd2ckptWTBuWjQvT2Z6L2hhL21WM09USElReGRycVpZRk1a?=
 =?utf-8?B?aDVib1JLTlpvUndqZ3p3dm5wdFZqWjBZejdnY2FFdU4ydFYxcmp3K2paNk9X?=
 =?utf-8?B?TGNKS2ZKL0tMMUFHMWk5Rkk1VzM0ZnRUUTd6dHVjVld4THlIRzU4WlhMYTRw?=
 =?utf-8?Q?UnRE79zcuXM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVdYeW9BSlVObkFGS3pUS29KZGdIZjNVTEpEd1B3Ni9hK2szWTBwT2I5ZUlO?=
 =?utf-8?B?ODNBZW1ybCtuSjVKV0hDd2NlWkhldFN5dSsyQ0tiTVAwdytudzEwbEVkNE9X?=
 =?utf-8?B?T1JTaDRQdVBTYkE0ZHNWTVZ0NVRRbW5EYVUzeEgxWVdZT0FkNGozZEZNaEFO?=
 =?utf-8?B?ZUdFd1ovaFV0YXFjUyt6Mk1DTUdEenNBT1BTYmZSdWFTUjhnalI3aVpBZEFB?=
 =?utf-8?B?RmhVRGNZZFhHaEtkTDNrL3BONnZRdTJpY09GTS9TLzU5dCtxL3NMZGV0RC9u?=
 =?utf-8?B?YWFlZkx1QnN4ZVJ6SUkvWWc0THBRTDErd012NVFZU0gzSWg2YXlEWHh2SWVE?=
 =?utf-8?B?SHdmbUsxNUZ3NXR2TTVqSmxmQmtWTDc2aDE2RXd1M04rV2QwM2Z1aksyNUxx?=
 =?utf-8?B?MGcrYXFtK2VBV2ZMZ1gzTXZ1K0ZKNjNUbUxjZzZ0K25vWUNBVjVOKytZVDdr?=
 =?utf-8?B?VHZlN3VHV2VGWkVhSjNkVzBuZFBzUjBXM3NmQVF1dEpxcmlQK0Q4Qk8rcUQz?=
 =?utf-8?B?cDc2K09DYjYzQitiM0NLUGRlUCtzcldUQVpmMnRSQnVNeEM4S1ZTQ1p3Z2Vm?=
 =?utf-8?B?eGwydE05NzhRMytwNmxscjVzVjcvK3lyTTlJMFdCcmZCZk1FeHhBOElBYmtK?=
 =?utf-8?B?US9zOVVHSmEzdTBJWTF0ZFZLeWVQenhxZE9pYVRJeFlzTnMzekQ3WnF5bjYy?=
 =?utf-8?B?UWJxZVlIc3RJSlZJZzhvSm8wSnRYOW9QRktKYnhLckcrSTVzcUwrOW5IU09Q?=
 =?utf-8?B?ME40aVFKK0p0WXJnc3FETGJVdnpWWkpUc081UmpuYXdoMzZkZTFWNDJVZUxG?=
 =?utf-8?B?aFVPcEphRkdUQkRJRW0yQXJUOVJEV2pJRHdXa0l1VlF5b2JVMUpveXl1bWMw?=
 =?utf-8?B?WXBEa1lRWnQ3eWY3MkJjOVBHdEsyd1p4VWM3U1Y1NmduNGhwc0YxYzIwcHBF?=
 =?utf-8?B?UFJ6VWJ6OG9SdHVMY2t6eHRpaWtLa2loeXFrT3pLWk8wSUJ2R3VMMXVJQ1Vx?=
 =?utf-8?B?b2hES0ZSV2VGdHlxeEdXZWpWeXBOMUYvL0YrYlBFdis1alJSM1haV3RvTXRi?=
 =?utf-8?B?dTdVbm5TVlNGd2xJSEh1NE9LdGhkQ0VmbDJHSGFvaEdEZ3Z4aUlpQjhjSmlN?=
 =?utf-8?B?UkpWMXVxWW5QVE1CSkIyUmg0bzdsaXo2WERVbzB0YUZNc3N3QzJwSGtTRlhx?=
 =?utf-8?B?MnNtUmtkMnJXYm8ram1PUWR0czEzRThwQkRYd3lwYmFCdEwwMC9iNWFKbmtm?=
 =?utf-8?B?Mm9Nd3p4UDkzc2phTnhRcDBJWU11R21mYzNqV1IxOXVENFAwZnk4bmVXcWla?=
 =?utf-8?B?R2VWWWgwR1d0MkRwVlVPRE0rVWlRVDNqRStVUUpycWtnREFJNzhGN3REaC9v?=
 =?utf-8?B?NEsvbGh6MDZmZ1FmY050NVV3RWcvcm5yNjlibndUS2YvUmxUaE1WdDYycEFS?=
 =?utf-8?B?LzZxRnJPSDhJVDRrM1RLS1NPRUgyOWhqMS9pUmtnNlI1YWRhMHFSbGFqUjQ5?=
 =?utf-8?B?SmlWYjNsRDFUU1ZkZXFUV3FaLzFPendkdEJrVVZLTHVKMXEvdnVZWkhtcWd5?=
 =?utf-8?B?VzkwOXIrc3U3QjlIaUNpVXJSV1p5ZEN4ejdYNXdid2llMlNLZHQvZEoyV0Nq?=
 =?utf-8?B?djRpVzVuWXpVYjNHVnBKN3Q5YjFSdU11am1mVnpZdGg1aFlPd2Y2S1ZaUFlE?=
 =?utf-8?B?TTA5RDA4Nkl0R2RDNm9ZRjVkZHVENVlIcjNXQzh3Qlc1Zk44ZUN0bGhrYTFj?=
 =?utf-8?B?Z0ZsekRZd2laanV2OFNxcXFXb085ekdidkh6WFZEQnNyYi8za09IRytMcm0v?=
 =?utf-8?B?aGlCeTBPcXdmOWRKZSs3SDR3NGdBUW1RNVhrbUhBb1hnQlNnUTRnRFJtUklv?=
 =?utf-8?B?QjVEZHVBUlFaUVNXY1ZVU3NJTEpIMFUwMnNVSnh4RWxNanhybVpmYlBSTnhw?=
 =?utf-8?B?bmV4aE05T3BOaGFaNTY5TFlZbVdlTUlSeE1HVEZKdElSNkxrazNoVzZvZ3lS?=
 =?utf-8?B?WC9Tb3RhbnJxREJyeUoxWjFzZGtZcStka2Y1YjM1d0ZIYXhMNWxuKzJsLzFC?=
 =?utf-8?B?dHBQSEU2UkZVN0FzTmxNckJKR2lNK3pqVW56MEVpQjFGK0UvOHF6Nk12Wkov?=
 =?utf-8?B?RWpVMHlOa25YVTFSVGRpV0ZrY09mdUNaUkJMaUYwdmltSUZNeGlrNEN3cmd5?=
 =?utf-8?Q?TU3artGrp86xp6YYr8EMMkit4ui6LHfsSbpXf3tfFsSz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6733ceb-dc67-47a0-f90c-08dd82ceef84
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 01:25:45.1426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F1Y5XMt49bOGTqx4Mj5e0rtAzZrjBDyykwu6qFJpYO86qApcRUeAd2e4pqnpDCh0uLelr8Xx1J3HwkOr4HUzCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9115
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

Thanks a lot for doing this, this was severely missing from the
WPR2 patchset.

Due to the strong focus on documentation, and in order to ease merging,
I think it makes sense to keep this separate from the WPR2 patchset and
merge it on top of it. Danilo, would that work for you?

On Thu Apr 24, 2025 at 7:53 AM JST, Joel Fernandes wrote:
> Hello,
> Please find in this series, several clarifications, diagrams and code com=
ments
> for various things in the nova-core driver. These are essential to develo=
p an
> understanding how nova-core's boot initialization works and aid in develo=
pment.
>
> These patches are on top of Alex's last posting for GSP WPR2 [1]
>
> [1] https://lore.kernel.org/all/20250420-nova-frts-v1-0-ecd1cca23963@nvid=
ia.com/
>
> Joel Fernandes (6):
>   nova-core: doc: Add code comments related to devinit
>   nova-core: doc: Clarify sysmembar operations
>   nova-core: docs: Document vbios layout
>   nova-core: docs: Document fwsec operation and layout
>   gpu: nova-core: Clarify fields in FalconAppifHdrV1
>   nova-core: docs: Document devinit process
>
>  Documentation/gpu/nova/core/devinit.rst |  54 ++++++++
>  Documentation/gpu/nova/core/fwsec.rst   | 173 ++++++++++++++++++++++++
>  Documentation/gpu/nova/core/vbios.rst   | 155 +++++++++++++++++++++
>  Documentation/gpu/nova/index.rst        |   2 +
>  drivers/gpu/nova-core/devinit.rs        |  36 ++++-
>  drivers/gpu/nova-core/firmware/fwsec.rs |  17 ++-
>  drivers/gpu/nova-core/gpu.rs            |  11 +-
>  drivers/gpu/nova-core/regs.rs           |  17 ++-
>  8 files changed, 452 insertions(+), 13 deletions(-)
>  create mode 100644 Documentation/gpu/nova/core/devinit.rst
>  create mode 100644 Documentation/gpu/nova/core/fwsec.rst
>  create mode 100644 Documentation/gpu/nova/core/vbios.rst

