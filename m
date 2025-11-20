Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C811C749D5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 15:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9231C10E0B1;
	Thu, 20 Nov 2025 14:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AeFqC8tX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013070.outbound.protection.outlook.com
 [40.93.196.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E891910E0B1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 14:40:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGv6TRmtTozfDonyyOlaFPXg4VWFBEpHbgz/VEuYdOBFy6gJL5+8kQSzL3eFldkuT3LZ8ny9ZlrasldNpMFhJimBF3miKkhD1mHWfOyMPo+WhMP0cL2aPAsJsqErQ505h2ktnpJN19BGiZPBk00/vAhfGStwIBdAZu/ocyRvRWkDJuCEBDyKF0gxJQ6twBarkkOuh7r6FvvdHok7/ykuK9GCl3l7ljNZyEU2H7DqjbuAu2/97HGSbvzvF8pI0oGWra++25iuKHDJhC1WLFre2crJZePTff1Xk/tNp6NU7uQ+oTTYeEHBZj9dZuT6VWJgcgTJ/B9b+lSyJoNpSiS9TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rIOtWzi1ID6nle127ZL/aaXO/k0neO4TIAGFQKlFyU=;
 b=SZI1a4BoJHl5SObeWBgNAmIKBDFi7a4ly7LQigYVPUWekryx7z1SVnCpOa1tYUSNbJ5xy/zmeCrfs4CQrFV74HkA/Xv1mXAq7SR5uPh8LgCWoDr6JPHtOP/UIE2oCAt8aZ7m8+0vy67Wy8eiVbvWTXKQ++Zf7RHj3GnkvuVWwNHrruRNjQUttEFlVefCDtU3R4AfVxgAdxgoMWWGuC2n0xrnsxg+nZ0P7H0RjLhQ7Xs34YA7frhNOa73xtyDkHGQklU64aqBWaoA3gV9nS5hQiDnoKlNqo9v9XynD3YnttQI2S5WoqoUMur3UIw+h1j3vBRGuWZHtsEvsmi5yMz7Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1rIOtWzi1ID6nle127ZL/aaXO/k0neO4TIAGFQKlFyU=;
 b=AeFqC8tXII4WCQpgtNm1fPIYCzcYmFF+doK+SgiNOg97TyYLKOJ3xUIzCuvTckr623CMIyf/xelwM6k4UTzMKvVTo6nez5Jd2qtSKZ9+/yBy0yy5q19movwdGRcRnYB1JQPNxMBrjKvfHnyNinJQ2jEPORR7rH7oGiLb3/QpDO2ABPRta82IMlTFNAmH7mjNWcPPIJQv2V+prZo93yvd4bZHWINXX7qmwHu3v8gghe6HLmyrxkOJOlT3+ILYyoJy9c4MeN1Boo2Nf3zQus+ka/iBGwcQ75SPWxpS+aAW5z1CcaLIujFG6RHNRNlo8Xp22x7O0xRVqPA+GlyYeR738g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH8PR12MB6987.namprd12.prod.outlook.com (2603:10b6:510:1be::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 14:40:36 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 14:40:36 +0000
Message-ID: <6757c538-d08b-4cad-95cc-772dfcabf909@nvidia.com>
Date: Fri, 21 Nov 2025 01:40:29 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fixup: mm/huge_memory.c: introduce folio_split_unmapped
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20251120134232.3588203-1-balbirs@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20251120134232.3588203-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0072.namprd05.prod.outlook.com
 (2603:10b6:a03:74::49) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH8PR12MB6987:EE_
X-MS-Office365-Filtering-Correlation-Id: a13f686a-96e3-40ab-ece0-08de2842c479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUJXeFRjclVYa3ovR3V2bWhCdW5mRXY0Szh5dGszOU1mOHVtdHpLUDdpUE5j?=
 =?utf-8?B?RmFrSkFXODM5RGtFdDFxV0tPUFIxVFlLL2I1S2haM2dEbXc5SnNod2VTdTZv?=
 =?utf-8?B?a3ljOVJ2bnlOMm82TnIzb3lpakw1MVBQR293bTkrb21OSnU1TXNkVlhZY04w?=
 =?utf-8?B?bDBaUFk2NG9YNkpXVzU1SHZxOCtweTMzYjhIcm9MSFpwSGJaZHMvdkxFSGMy?=
 =?utf-8?B?Ykt0V3ZRVW4xRitiWnpqcEI2WkRMVCtXVGdaTkF5MThmWjBTbWNXUkdOQ3dl?=
 =?utf-8?B?OVJFaUNWRTA4alFiWFBHMXVLeHRTRkdvb0I2OW9vbklaOFRlbGIyMUpsakQ5?=
 =?utf-8?B?MHFpWE4zcUdZSjNqeklOemlRckpLcktaYmFBN3NlcnQrTHNlN3FwK2ZMaW9N?=
 =?utf-8?B?VVJ3amtzYWlaR2sxSFFmcFlTbDRTS0VxWlkzUUxqOXAra1JBMk9EUlpCUzVp?=
 =?utf-8?B?WEFFUjJxOHdKbkU5VnVWNExmRXB5aHVKUzlpVEQzcWJyV0J2K0hBTEQ5b0ZW?=
 =?utf-8?B?ZCs2TytxV0lST2I5cXlMb1E2STJsL3lGUG9ybmJ4NTlocjA2VFFqZGltMFhw?=
 =?utf-8?B?M0xCNkhQY2xKdWU5dk9FeFZyMUZtMkVmaDI1SWNEWTlsTDhreEM0NHNXYllJ?=
 =?utf-8?B?emQ4ZjVJZHZHQ2hFRWZhZmMvV3ZhV0QvYXpjZFRaM2RGcUFhT1p1Qkc4c3dZ?=
 =?utf-8?B?VjE5UnhIZmhjZ1JFeHNyZ2NiRTNCZmwzU09ZMkkxM1N4MEZKU1ZkMHFIdndG?=
 =?utf-8?B?RGsrSkhzUUFqbElueEVEYnhsMUM4bEtRYWJsakU4VHBUbDA5Ulk1TlVuZlJD?=
 =?utf-8?B?WkdJRWtpZHIzdHRVVngyOUlzQ3I3a256ZGNuamF3dU9zOTN1Q3VGVWxEVVRE?=
 =?utf-8?B?a0ZoRm95WG5CRy85ZHBQUVltQmg2UHQ2ZDRMUklCSWJWMXJFdTRNeGF1SmY3?=
 =?utf-8?B?N3ZINkxkeTEvQVNFQ0VPM0J1dWpYcGVqSm5WVmlpRFhsUXFob0NwTVVuSXdR?=
 =?utf-8?B?T3o4ZUpPMVc3L1RxYzZYWTB1dmhLK0VlNzJMTllwaWlNbWRTeDJaVnV5TW11?=
 =?utf-8?B?UXdmMUw2RHRqNjZCc3V6cmVQcXBRYWw2b1k1Ukh0ZSt1K25aT3hReFdmemdz?=
 =?utf-8?B?d1pXNTBPcjVqRnB3dUpNZ0Z2MUhLMWs2VjNYTE4veTUra0xlWXpHcEtLMXRh?=
 =?utf-8?B?Znh3NzRVOEprTFVpTDA1eUI5di9LRHMzc3NoYTR5ZWFlT1NZcGZmbStRWkFX?=
 =?utf-8?B?NVlrQmlMeWU1TFVvdjl6Wlo5NjVCRTdtNWlNMC9oZWtDRDcxMU8wN1RFaEFT?=
 =?utf-8?B?QWxHaDgwaW55UDNiTGlZaHpJSVV4TE1CWDNHamNXQWxJYWVvQ0tJTGxZNkpy?=
 =?utf-8?B?S0RKcUM1dW95WXdlQlZtSXFWMVV6RVVKYnRrRW4zVWVXak9ERzJweFRueGlC?=
 =?utf-8?B?S1N1amZQVElBNTBCWG1EKzhxNDFoNHphSWhDdHB0YmRoWkR6VlpwOHQ5Slcy?=
 =?utf-8?B?V0hTTklPWTBKaHVKSkQ5RkdGWjJDUzg1Nm5wWHF1ZUxVQXFpdE5McG50TEN1?=
 =?utf-8?B?dHFZNVlOV3U0Mi9tUlIzaDFKVCtSMXJ4QzlnMkR4RUVWZTJVUWs0UnJ0Rkdl?=
 =?utf-8?B?c1ZqSjQxVGNTU1RXMlR5czJuTnZIR2dIbzAyZ1NpcTk0a0lDeGtvL2VlUEk1?=
 =?utf-8?B?WVp0enNLZ1FmeHZqZFlseUJFc2hsYk8weXhuM2JGbW1oWVgwTWhESjJjMnhu?=
 =?utf-8?B?VGtBTHB5QlBqMDZsRm03VWZPZ2NoMG9IMXc3cTJaRXA5K0xTbjEyR3BhK2hX?=
 =?utf-8?B?V0NGanI3RmdIaXhVUStuL1VrNmNXa3VnWW9VckFGcDFxaTZBcHRMWmtJY2FN?=
 =?utf-8?B?dTVsQlRMeExMdm5kS0hzRTk1SVVLZTA3OHowQm5WNXd1Vm9lTUlUL1VJUWRr?=
 =?utf-8?Q?yWluYxMzZtIN5lc+hgOBoIgK3y6T/hOe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dktHODFsVm54VVpWUm1kRnlhUjM4V0N3MkxVbS9rZWhwNnRaYVZMZVpTT2lK?=
 =?utf-8?B?OTQ1Y1JSRHBoSzhKdFl4UUEyK3p3T2RnRC8zbmRFOWVtWFJUZnVyS3ZpR2JJ?=
 =?utf-8?B?c0JjNjVwVml3VDR4NjA2QlYvYkVsVmxnaVRIRTBiTHpzQkNFdWg3aUVyTFgz?=
 =?utf-8?B?QlI1ZnZ2dWlwYnJia0I1ZzV6Y0pZeU96WjVCM1BEWjRrdFVBSER5TnUwMHIx?=
 =?utf-8?B?OXljL2VKUFkvd2VOS1VqZHlMMC9rb3RnTkpsa3hZTFp1SEp3M0QvTDhnaEho?=
 =?utf-8?B?bUlzMll5L2VpM0psYTBDRnpZKythSENML2oyVEZUODRweHZYZXJLRTFJeWtZ?=
 =?utf-8?B?c29BWnY5VkNDeTFYcXFBa2NnMktENlJwT2VHSlhHUlVPTVRONmJXUWVyNWRW?=
 =?utf-8?B?OCtrSE9GSVpJbUdWbjBWajk1ZG5MRllTVjloQ3JTakxFdUpzc2JHZnR4c2N5?=
 =?utf-8?B?eFVSRmUwWmJuYVlERFdNWTdlMXg0N3V4K044R2dqVWVGYVVObjJOWFFUSVpX?=
 =?utf-8?B?ak1RQkZ4R2NYM1FtMzZHTnhSb3pTaUxWcXBnRlB2NjR5NnlkZE81cFliL1Bh?=
 =?utf-8?B?ZG1UTzFlK1UxSVdtYnF2SjhsL1NBb3BFS3AwWG1qRUNVNHNFSU9oQlJrczNT?=
 =?utf-8?B?WWNoOGxqR0M4RDQxb2tlSnRlN3FEeDRzNllCT2V5MG95RHQ1MzE4L0xWSHpL?=
 =?utf-8?B?UU5DL2d2OXZlWkY5amJRMm9JKzlxVFUxdmkydGNsOEZOL0ZhUitwa0NScXVz?=
 =?utf-8?B?aytiYk1QUHhCemZxTjJWcStTZ3YrN1E4cllYWTFVYWlES3NZWUhNMTVFMWNr?=
 =?utf-8?B?TU9Pb0RaeFMrK1YvRlBraFlNa1V5WTV3WXlZakpmdGw4Nm11TjhFK255eHNv?=
 =?utf-8?B?c2VScEFzYVY4cURZU2tKUFVNS3BNOWpmQjFXY05TRTZzVXBVeENnK0p2NjAv?=
 =?utf-8?B?bVA0ZDhNSDBqVmwyQ3BaRlI4ZEdkTXFBUGIvcE5jMGlGS21yZlBXQWQzM2I2?=
 =?utf-8?B?NUxmWlNSQVl0TVozWlRUQUNMdEJTRjZCSVB5ZXJRbWhsZ2tJRFZXM1M2b01V?=
 =?utf-8?B?U3ZSdDZRWUxFMHQ3ZlIrRkhDb2NpNENUR0tXd21vRlZPV0Z4ZEVxOE9DR2lS?=
 =?utf-8?B?Nk5zenVrZVZua29Xd0daQXBON29GT3hVNW5Tc1hwTS81bnhyaEtheHlZcGx0?=
 =?utf-8?B?L1JHNGFRRjJZNDBrUStXNDBwNUV1UXk0T1dHdXhpYXh1MW1MMFRKejJYRjYx?=
 =?utf-8?B?dXRMTWhpQm5SanVJZ1FuRWlLU0JSMkdTK3BhQ3loV2txQ0g3K0FHR0lVUEs4?=
 =?utf-8?B?S2RqSUVuTWI3UWZFaUE3V1A5SjYrbTN5Vm05eGZWd1NvWVk1UkRPVGh3SHR1?=
 =?utf-8?B?VE5NaEZSdjRvRll2RjQ3VitNbVdsdTJYVnprRkk0OEVuS2dxNFFUMlZTMkRJ?=
 =?utf-8?B?L3RSdXZiT3NLMnZFVUE2elNMZS9xbmJRb0hoelpWRU4rdDZYdEFZcUdyYW9q?=
 =?utf-8?B?bGNtbTRYOGNoYkcwdmUwcWhPRzczOVdDY1d0S0VTQmU2aXJjTVRYaERocStx?=
 =?utf-8?B?U21vMXhuY2RGTlhUaGF2RDlRYXhZakZQVjZVQ0VvVW1oSGFGaktRVkFkbzNq?=
 =?utf-8?B?ZllCUUxmMVdMMy9kOGY2N1VLdzIwS2lOQ1kxL29NSDVqMWNhTkxHVWdoYXd1?=
 =?utf-8?B?c0srdnJ0TURORkxDSUZnUDdoWmoxa3FxRXFWK1IyNnVyd1k1R0lia3NJeTdu?=
 =?utf-8?B?U084V2FnS3BUY21YdThEeGZIQjI3SWZMWGJpSkVHME01c24rSTNOMkxXekpl?=
 =?utf-8?B?c1lzNUM2VXZkK01LT1pYSEhHN1dId0xtdDNDdXU4S2pNck9zNTkwbkczb3px?=
 =?utf-8?B?UmdvdzdWNDhIOGFXam1UUTNHS2MxS3Y2OGhlYjE5MzhiczY0TVB1ZDBWWlZC?=
 =?utf-8?B?cGYxUjJYYkFVcXljclhNUnlEemZhelJvZXRPT3Y4SjZTQytqZFFOZ0R4Slo5?=
 =?utf-8?B?K25oTUlhZWR5RktsWXZUa1FMOW1SZkZzRHBnU25XOEtYekdTV3VmSTBTQXJQ?=
 =?utf-8?B?VGswK1VEbFROcmhQSEU3b1VoaFhGWFF2K0p2TFA2Zm5rZTh6SXo0Uyt3Mlhq?=
 =?utf-8?B?VkVXWFo1SGlqOTNNaS9QUEF6cW5RemViRXJFeW1kR0dwQXpmZnowQ0JFMlc0?=
 =?utf-8?Q?rkQTCkp/0RZ/AGgCt/HbwtUM8RRQisfCDgXWWYbZUjyD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a13f686a-96e3-40ab-ece0-08de2842c479
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 14:40:36.4449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IxIxxcHC/emzk4QOC9dCxL9mvANINZImcR5FILihnY5lpW96YJZUYBTS2FFCw/7rt/DmkZgXBVSBbYEJejjhLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6987
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

On 11/21/25 00:42, Balbir Singh wrote:
> Code refactoring of __folio_split() via helper
> __folio_freeze_and_split_unmapped() caused a regression with clang-20
> with CONFIG_SHMEM=n, the compiler was not able to optimize away the
> call to shmem_uncharge() due to changes in nr_shmem_dropped.
> Fix this by adding a stub function for shmem_uncharge when
> CONFIG_SHMEM is not defined.
> 
> smatch also complained about parameter end being used without
> initialization, which is a false positive, but keep the tool happy
> by sending in initialized parameters. end is initialized to 0.
> smatch still complains about mapping being NULL and nr_shmem_dropped
> may not be 0, but that is not true prior to or after the changes.
> 
> Add detailed documentation comments for folio_split_unmapped()
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> Cc: Rakie Kim <rakie.kim@sk.com>
> Cc: Byungchul Park <byungchul@sk.com>
> Cc: Gregory Price <gourry@gourry.net>
> Cc: Ying Huang <ying.huang@linux.alibaba.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Nico Pache <npache@redhat.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Dev Jain <dev.jain@arm.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Ralph Campbell <rcampbell@nvidia.com>
> Cc: Mika Penttilä <mpenttil@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> ---
> This fixup should be squashed into the patch "mm/huge_memory.c:
> introduce folio_split_unmapped" in mm/mm-unstable
> 
>  include/linux/shmem_fs.h |  6 +++++-
>  mm/huge_memory.c         | 30 +++++++++++++++++++++---------
>  2 files changed, 26 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
> index 5b368f9549d6..7a412dd6eb4f 100644
> --- a/include/linux/shmem_fs.h
> +++ b/include/linux/shmem_fs.h
> @@ -136,11 +136,16 @@ static inline bool shmem_hpage_pmd_enabled(void)
>  
>  #ifdef CONFIG_SHMEM
>  extern unsigned long shmem_swap_usage(struct vm_area_struct *vma);
> +extern void shmem_uncharge(struct inode *inode, long pages);
>  #else
>  static inline unsigned long shmem_swap_usage(struct vm_area_struct *vma)
>  {
>  	return 0;
>  }
> +
> +static void shmem_uncharge(struct inode *inode, long pages)
> +{
> +}
>  #endif

This is missing an inline attribute, my compilation tests did not catch it, 
but I'll do a new version tomorrow

Balbir

Balbir
