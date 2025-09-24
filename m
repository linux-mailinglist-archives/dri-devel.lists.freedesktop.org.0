Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F23B9B145
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 19:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041A410E799;
	Wed, 24 Sep 2025 17:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="L4R56xbp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012003.outbound.protection.outlook.com
 [40.93.195.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E92B10E799
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 17:36:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dj/bOkRmWCS9xJPVtfMZ90xVVOQv+a6j1OLV6Wy4f3q3Bv9lgM8/4rIm73QRKZ+dXMG70wPUlOdSGQ2ZiSWzxk3WPh1rb0Gp64imCfKnXW6Xs00EEA1ZO9oATLBN1jtHyxSebQEjEw8L29p1nRTZCYZ8C9tdPaO/5SNbVd9uYP+a/kiZ8cKASO1mnXLsitqawNzfKRuAns9szqoWD7xPAjLceEu8QRvUEL7coQiEPL58IqnYzRXxp4qyMlB8gXaxnl93anNxuWkP47VlZcG7ulVkCHax1oJ3KVrU0uN1nt/B1ENOqePx1oABJyx63XBeHpJwAFNM0smKHGmVDYtbHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTwg63tr9ogrNFnsA+CY5rqkhxzVZ9dhfn0eq+qrLOs=;
 b=LWBxlqSwqZRA3tzXLBJUWaECtRQ+gnOKTpM6BQHGVcJ9RlCImPW3CHh0VQ8lJjopRJse+gULW+koJIS0/beIh2pJdOsfBzaqOBLelTyDe14WakYmNJa4VxzVA7xqgUOe7FUJl91XSgU1kEvoVXpV06tHWnTjwPs1DmvRkL7BI8MQEvLWseSke3t/uzUB9bU8Re5rvtOI3f+hY+TodtIxvYRnOb/NjpevyaK8K2QHT817Kjl+rACpD46kddRpV7xBHORCCYR+FAHW4fdKnmqgtVCQPnQGl5UYkGkqZf36dwjZY8sYDvDpE0my3Q2rRQe4877WIZvc39IR6HeW0btUwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTwg63tr9ogrNFnsA+CY5rqkhxzVZ9dhfn0eq+qrLOs=;
 b=L4R56xbpE/MXbPGIiHVvi+OCkNwI+DAMXEj/ZudP2lZnsp3iiMoaztt/krrLGVj8RU3cG7HpoC9EMfNC+LAkDHJdOiCKOfwD5T03XV6nkR5vefFi495ZpC3c9T06tm7jIvrSnSKo91NaNafu3X8JAvJbPn24zujhTBE1n/SvNgg71SkvFProGiKAjOfFq5x46B3wdaD85D9W9CDeJTWzzIny1cV9u7rw7B6tv4EaRLKA8lmSIOVo7hhihT77XISxCgFisgwBxHXKtbDOz4tIBRW/y5lRpT7lAEt22m4DsaMP10ZPmCtgAA0i8hyurnspVqgUmyv051I+BsUz22T3KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MN0PR12MB6320.namprd12.prod.outlook.com (2603:10b6:208:3d3::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.10; Wed, 24 Sep 2025 17:36:43 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 17:36:43 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Balbir Singh <balbirs@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, damon@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?utf-8?q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [v6 01/15] mm/zone_device: support large zone device private
 folios
Date: Wed, 24 Sep 2025 13:36:36 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <66A59A5C-B54E-484F-9EB8-E12F6BD1CD03@nvidia.com>
In-Reply-To: <9c263334-c0f3-4af0-88a8-8ed19ef6b83d@redhat.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-2-balbirs@nvidia.com>
 <882D81FA-DA40-4FF9-8192-166DBE1709AF@nvidia.com>
 <9c263334-c0f3-4af0-88a8-8ed19ef6b83d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN9PR03CA0434.namprd03.prod.outlook.com
 (2603:10b6:408:113::19) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MN0PR12MB6320:EE_
X-MS-Office365-Filtering-Correlation-Id: 0087bba7-bc66-4d22-f4dc-08ddfb90ed8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTJDdjh0RUg4ZkU4T0FoNkhnOUN1cmZzSVlLdFhkMG9VS0J1ZEtYTTllWDh4?=
 =?utf-8?B?MXN4NmhZSnhJSkROUVF4UW14UWVSb2x2RmFPS0RWYlVpUE1keTBxcWxNRUJR?=
 =?utf-8?B?MG12OEpDYTZsQytHaDBmVUVKODlEMkVxd0h3Mm5XZWl0UndLeXQvZXRlTzJN?=
 =?utf-8?B?dmtyWm0vT2R6QVZDaHNxRzlZbm1vOFVsL3FkQkE0OWVKbUwxOVJoTUh3Vklm?=
 =?utf-8?B?dkEvQUZLUFhId0NkbGR1d2ozeUtLR0ZWeFlBb3NuLzZFdFFuNElzUXI0eG5B?=
 =?utf-8?B?bzFiWVRmWS9WV1ZNQnVqZEZxMlBWWGFGNEtJcEpmRWt2a2Z1RTU4b1Rzd1hC?=
 =?utf-8?B?dHh3NkNEYkplTXZFazdJbDhOYlRyeEhIdUtlWENNYjVjTmQxb2tLSnFiZjRH?=
 =?utf-8?B?eldQQzhWQkxXQWI2K1NiM3hCcXB0UlQrbjB3QVhUdTk2NWVnQ0NqenpqVHRN?=
 =?utf-8?B?cHN6c2lWUnpvRlQxa1JhV1dVeEg1cmxVM2tYNjFKblhVUy9EZ1kzRHRsV1Vr?=
 =?utf-8?B?cFRlRWlHRVR3QlNlUVdOUzN6Wm5rbTFDMXZJdnVaZDE3VVROSE9lbldiTzFZ?=
 =?utf-8?B?YTNuVFp4VzlEMndtZFhLV1VydHFTemJJL1hXeWtncUtPUnFoYkhjazAybEQz?=
 =?utf-8?B?bEdEdlVsN0xzTEVndWo5RTRCK1JIMEVvck92ajh1MU5SZ1JLbEFlL3JNbWFh?=
 =?utf-8?B?UmF0blRRNjZqbmk0dWNQaHVqRW1RVytEdEt6ZWdBNkViUndvTGtkc1JHU3E4?=
 =?utf-8?B?YXhISjNwWGE0MHU3ZlhweURLWTlSM3dQNXNUMmdyMDZCa3NVQ1pmTGZVblE3?=
 =?utf-8?B?TXZsbGdZK2hMNkM3aS9xNktrY09WWkZCQy9IaUlPZEswdjRLdlFUSXYzeE5k?=
 =?utf-8?B?cDRtK2s0R2lZR1QxRTc5d1Y5ZU1TcS9LMVg1a05xSEpxTFBiN2o4RWwrSi80?=
 =?utf-8?B?OCtsODcrcU8rWGtjbEt6dnRRYldIQmcwNUNjTFEybVRoTUtJSmdhdDM0MVNJ?=
 =?utf-8?B?UEdGNUR2MjRCa1hMSWRMS3phQ2tKcUt4WUh1WTdBWlM5QnlPOUNOVUIxWGk4?=
 =?utf-8?B?eTFDWXZCUmN4RS9VUm9ReUtvWklPY3B3ejIxYUVFVlZIdGJMUjU4TUg5SmVF?=
 =?utf-8?B?YW5Gd0hiTkdQSzByZkRkbHFhSVlsS0p3eTlkMmFNaGluM0FjK0taY0YreVd3?=
 =?utf-8?B?cHNyMi9lRnlMMGx3a3RWU0QyQkRYOGlFYklpOWE3OVR6WHo5SWo4eWR1dnd4?=
 =?utf-8?B?WmJTSTFtUzB1cTcrL0tMOGNMdFBFNDRSTmo5QWUrMm9kWmtRZThDS0xTSUUy?=
 =?utf-8?B?R1U4NkZ6QUN0SCthak9OQkNJRm54ZTIrV25saHJLZFRnZW9sajRkc3RyMXZ3?=
 =?utf-8?B?TVd5cGpYblRTSnJqZzVEZ0ROa2k2RzNkUEgySldTMTV5Vmh4dlgrdjA1RzJ3?=
 =?utf-8?B?MU1iVlBaS2dyZlVYbVpCK1lCMWJ1NWRGbVpNczhQMFBRSEoyUndWbGlzSWk2?=
 =?utf-8?B?UUxCb3IyRXdiWU95TXBtZi9NbGNWbndjbUo4V3VUa3NDOVhpaDg4SFhOUkJO?=
 =?utf-8?B?bEVOVVVXbzJWNHhjQi9FMFhDV1RINndGbXpNOTJYZ09mOEVTN1VKRG9IZE1R?=
 =?utf-8?B?ZG8wVzNiTjNmN3F4OWZCOUsxbEFJUTdxdlFQT3IzY2dXdEE4MkFmdkllcFVC?=
 =?utf-8?B?cEVpWHlNTCtGaGVTcU9hTkRNb2ZxK2kzbDkydVFkdHV5UzdjYk1qUDJzalor?=
 =?utf-8?B?M0ZOdHhPcThLSmNOOTNMM0VWcFk1WnlrK2ppL3pWTkF4Z3JkYkZYK2RpMGZu?=
 =?utf-8?B?dm8wUWFWT1NCK0k4VnFaWVJ6cVpyMW1JVEFjTnpaMzRBUDhZOURTWTZ3enZR?=
 =?utf-8?B?bVRyWXUvNFI1YVRDU1ZQclhVZXFvNElQR0tvY0JLcXBRa2NtR1d6Smp4ekdL?=
 =?utf-8?Q?1rQMzMKUNCg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkJCK3E0N1VPV3ZLTGYwdEZvTHpDMmo5aE1SR0VENnNEZjBqL3NLMnpZVnhi?=
 =?utf-8?B?R0N1Wk42Zm5lQVZwV0FKVkhvM3NaNGZacDF3cEQwaCtRVlIwWks1K01vMG9W?=
 =?utf-8?B?emIrdmtjOUxPTEkyNFJoWCt0TEVCeWF2UHZKbXAzRXRDT3p5WUp4WTh3cWxD?=
 =?utf-8?B?QzdWM3gzOHJtYzFtbjc1QlYrRU81S3ZPZ1pNR1FNN0E3OHJWRUxRcTNkUm4w?=
 =?utf-8?B?enlRTU5wRDJ3akQvYm9aTzlPeWg0WUNtNG5WNm16Rll2N3lHZGY0YTM5RlhM?=
 =?utf-8?B?T2YwS1ptWTZXTWRJWW1TYUtDZTN3elU2Wk9mcFZxSDhha2JxMG9zZkR6WHli?=
 =?utf-8?B?TGJJbDV1T01xMmlyYUNobitlRVE2ZmdRdkhBVzBIL1ZjQWt1dWFSM2w5TEQx?=
 =?utf-8?B?RXVzZ0lmclNFdG5Mbk1Da3FHYnNKRTJ4WXl4c2VzNmF2anNmN1g1dHF5MTJo?=
 =?utf-8?B?SStXQlZabmRWT2tXU2xyTnBWNm15NGZ1UXNXNXdYemsvVExBbHhpTDB0cm9l?=
 =?utf-8?B?Tk4wNUJ0T095WjFKa1dTSEtqZmY0d0pxakltTUwzSndqcTF5UGRKMTA2cDlC?=
 =?utf-8?B?OTVSK21vMFIxUHhYUFBTdzhuTzUrbkk4ZnFscG91SHM0WTNZenFNanUrRGVz?=
 =?utf-8?B?NkMyY1UwczVlMEwyb2pYKzFJblV5SlQ5V0ZGWnpUOVJDYTBNTVI2MUJZZGU5?=
 =?utf-8?B?ZlpGVmh5cWg3Q3hwb1IrWVRLbzVaS0RLQ1JySzBZOUZISGxBc0treHFUWENj?=
 =?utf-8?B?V2dwRENKNkVBK0tTODZNVWsrdkYvc2lZWWZEWWIvbGRDRktuSnVEM0dkcC9x?=
 =?utf-8?B?dTV6TU80b3NTQVVNelFXYXdpZWlpYkZPVCtqQ0s4NTh6Q2lnbEtyTExmUXVE?=
 =?utf-8?B?YjBkMER0NVkvMTlNNGM1M1BpTVB4RTN1Qy9XV1REbTliRzVFWEQreWFSdGdK?=
 =?utf-8?B?Y0pJQmQyS25POGs3ZHpCYTBQZ2dJcHZyMFl1YnhzTnRhdWsrQkFLVXJwMzhN?=
 =?utf-8?B?djNtNTljU2ZhMnhnZ25mcGVZSnZ3NWlFSWJReHVucVJUZjdPOUNuM1NTcEFB?=
 =?utf-8?B?WklLL0QrUE05Z0lXcDZsOXdsRzRiVTZxTzg5enRrdW95byszaVdCUHRTT01R?=
 =?utf-8?B?dEEvSE14ODVPaW1hTjYyTDZvanp4NzhsN3paTm1Rc05GOWhydTZ0VG1lcU8v?=
 =?utf-8?B?eVdQTnY2V1BpeWwwbXBtbTVKU1NQbm4rc2l0OU4vdjNFdTdkUS9WQnYxMUlJ?=
 =?utf-8?B?SE5ZcVVkZUdzVkJzeWx5Qk5nbndmamdqTHhDd2pQeitJYTZTdGNJaUVBSkJp?=
 =?utf-8?B?ZjhyRTN6YnFQdHNRWVhrZnQ2SFFyUkxVSDlvR0l4NHlVa2t2MDZTVjNUTlBL?=
 =?utf-8?B?OE02RGtDeGN0Wmg1MlA3WktjZS9vZnRWblkrbzRpZlRxYmxvV29WV3hUdEhF?=
 =?utf-8?B?TlkwSEhIMU51OEltV2tCQ09MNGJjc01lTWtMayszMU5aQ0ZGWERxaml4dlpq?=
 =?utf-8?B?M3Jkd01raGhaY1ZnZG9yV3pTYTF2eUdZSEIrODVIUU13UnJwRzJMdm4vMWpj?=
 =?utf-8?B?eWVoTzA1MXhzQ3h2S3ZRSG1QTkZVd3BXYmlNM1hDQTNqdHNiRDF3U2Jrc2tU?=
 =?utf-8?B?a3pKVG1qNjVNeXVIS3l4Nks5ZE1JNVIvdGpEbjliS04vR0NkVEZVZzFSd1hM?=
 =?utf-8?B?U21uYjFob0g3T0lGRmc1WnFqaWd3YmFBeTJxZU5RL2NhSzc1MHFKNFloVSs5?=
 =?utf-8?B?S1Z1ZGlXMXlVYkhPN2Z5K3BOdFNXdm5JWk5Ubmc0Yk9Db2JJUTlYWXdoZTV1?=
 =?utf-8?B?YUtsVllSMU9ZZWlhYUZ6b200TExFZHViMDlwNUZscmw1TWJ4ZmFNR0dNOE9i?=
 =?utf-8?B?RkxkV0V3ZzRhMlF6M1NNUkNJUVlMd0ZCeFlDZFcyM0xRd3hhYVFSSVNuR09W?=
 =?utf-8?B?VjNLVlFrSW1YbWhURThxZVpzaGZRVTkxQTIvZkdGMkFtUDd1Q2RDQjVGMFpr?=
 =?utf-8?B?WXU5dnlSbExJV0w4aStDbklRQ1VWVjcvRmVlZXAySXBvRC82ZTRGSVB5T3kz?=
 =?utf-8?B?VmFhcmtPTXRHYXRBZ0VFSVFMdnN2SU5hck43cE5oMmF5ZTZDSTMreGg2SzN4?=
 =?utf-8?Q?Aeapk6WmHwjCFbonePKy/Ksay?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0087bba7-bc66-4d22-f4dc-08ddfb90ed8a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 17:36:43.7120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oA/u6XvhyyY1TtKmjJLbVdSWPEYBewR/TLNSAbRzDxCydE5n4miDzqLNE9lS6eS0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6320
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

On 24 Sep 2025, at 6:55, David Hildenbrand wrote:

> On 18.09.25 04:49, Zi Yan wrote:
>> On 16 Sep 2025, at 8:21, Balbir Singh wrote:
>>
>>> Add routines to support allocation of large order zone device folios
>>> and helper functions for zone device folios, to check if a folio is
>>> device private and helpers for setting zone device data.
>>>
>>> When large folios are used, the existing page_free() callback in
>>> pgmap is called when the folio is freed, this is true for both
>>> PAGE_SIZE and higher order pages.
>>>
>>> Zone device private large folios do not support deferred split and
>>> scan like normal THP folios.
>>>
>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>> Cc: David Hildenbrand <david@redhat.com>
>>> Cc: Zi Yan <ziy@nvidia.com>
>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>>> Cc: Rakie Kim <rakie.kim@sk.com>
>>> Cc: Byungchul Park <byungchul@sk.com>
>>> Cc: Gregory Price <gourry@gourry.net>
>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>>> Cc: Alistair Popple <apopple@nvidia.com>
>>> Cc: Oscar Salvador <osalvador@suse.de>
>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>>> Cc: Nico Pache <npache@redhat.com>
>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>> Cc: Dev Jain <dev.jain@arm.com>
>>> Cc: Barry Song <baohua@kernel.org>
>>> Cc: Lyude Paul <lyude@redhat.com>
>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Simona Vetter <simona@ffwll.ch>
>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>>> Cc: Mika Penttil=C3=A4 <mpenttil@redhat.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>> ---
>>>   include/linux/memremap.h | 10 +++++++++-
>>>   mm/memremap.c            | 34 +++++++++++++++++++++-------------
>>>   mm/rmap.c                |  6 +++++-
>>>   3 files changed, 35 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>>> index e5951ba12a28..9c20327c2be5 100644
>>> --- a/include/linux/memremap.h
>>> +++ b/include/linux/memremap.h
>>> @@ -206,7 +206,7 @@ static inline bool is_fsdax_page(const struct page =
*page)
>>>   }
>>>
>>>   #ifdef CONFIG_ZONE_DEVICE
>>> -void zone_device_page_init(struct page *page);
>>> +void zone_device_folio_init(struct folio *folio, unsigned int order);
>>>   void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>>>   void memunmap_pages(struct dev_pagemap *pgmap);
>>>   void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgm=
ap);
>>> @@ -215,6 +215,14 @@ struct dev_pagemap *get_dev_pagemap(unsigned long =
pfn);
>>>   bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
>>>
>>>   unsigned long memremap_compat_align(void);
>>> +
>>> +static inline void zone_device_page_init(struct page *page)
>>> +{
>>> +	struct folio *folio =3D page_folio(page);
>>> +
>>> +	zone_device_folio_init(folio, 0);
>>
>> I assume it is for legacy code, where only non-compound page exists?
>>
>> It seems that you assume @page is always order-0, but there is no check
>> for it. Adding VM_WARN_ON_ONCE_FOLIO(folio_order(folio) !=3D 0, folio)
>> above it would be useful to detect misuse.
>>
>>> +}
>>> +
>>>   #else
>>>   static inline void *devm_memremap_pages(struct device *dev,
>>>   		struct dev_pagemap *pgmap)
>>> diff --git a/mm/memremap.c b/mm/memremap.c
>>> index 46cb1b0b6f72..a8481ebf94cc 100644
>>> --- a/mm/memremap.c
>>> +++ b/mm/memremap.c
>>> @@ -416,20 +416,19 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
>>>   void free_zone_device_folio(struct folio *folio)
>>>   {
>>>   	struct dev_pagemap *pgmap =3D folio->pgmap;
>>> +	unsigned long nr =3D folio_nr_pages(folio);
>>> +	int i;
>>>
>>>   	if (WARN_ON_ONCE(!pgmap))
>>>   		return;
>>>
>>>   	mem_cgroup_uncharge(folio);
>>>
>>> -	/*
>>> -	 * Note: we don't expect anonymous compound pages yet. Once supported
>>> -	 * and we could PTE-map them similar to THP, we'd have to clear
>>> -	 * PG_anon_exclusive on all tail pages.
>>> -	 */
>>>   	if (folio_test_anon(folio)) {
>>> -		VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
>>> -		__ClearPageAnonExclusive(folio_page(folio, 0));
>>> +		for (i =3D 0; i < nr; i++)
>>> +			__ClearPageAnonExclusive(folio_page(folio, i));
>>> +	} else {
>>> +		VM_WARN_ON_ONCE(folio_test_large(folio));
>>>   	}
>>>
>>>   	/*
>>> @@ -456,8 +455,8 @@ void free_zone_device_folio(struct folio *folio)
>>>   	case MEMORY_DEVICE_COHERENT:
>>>   		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
>>>   			break;
>>> -		pgmap->ops->page_free(folio_page(folio, 0));
>>> -		put_dev_pagemap(pgmap);
>>> +		pgmap->ops->page_free(&folio->page);
>>> +		percpu_ref_put_many(&folio->pgmap->ref, nr);
>>>   		break;
>>>
>>>   	case MEMORY_DEVICE_GENERIC:
>>> @@ -480,14 +479,23 @@ void free_zone_device_folio(struct folio *folio)
>>>   	}
>>>   }
>>>
>>> -void zone_device_page_init(struct page *page)
>>> +void zone_device_folio_init(struct folio *folio, unsigned int order)
>>>   {
>>> +	struct page *page =3D folio_page(folio, 0);
>>
>> It is strange to see a folio is converted back to page in
>> a function called zone_device_folio_init().
>>
>>> +
>>> +	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
>>> +
>>>   	/*
>>>   	 * Drivers shouldn't be allocating pages after calling
>>>   	 * memunmap_pages().
>>>   	 */
>>> -	WARN_ON_ONCE(!percpu_ref_tryget_live(&page_pgmap(page)->ref));
>>> -	set_page_count(page, 1);
>>> +	WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << ord=
er));
>>> +	folio_set_count(folio, 1);
>>>   	lock_page(page);
>>> +
>>> +	if (order > 1) {
>>> +		prep_compound_page(page, order);
>>> +		folio_set_large_rmappable(folio);
>>> +	}
>>
>> OK, so basically, @folio is not a compound page yet when zone_device_fol=
io_init()
>> is called.
>>
>> I feel that your zone_device_page_init() and zone_device_folio_init()
>> implementations are inverse. They should follow the same pattern
>> as __alloc_pages_noprof() and __folio_alloc_noprof(), where
>> zone_device_page_init() does the actual initialization and
>> zone_device_folio_init() just convert a page to folio.
>>
>> Something like:
>>
>> void zone_device_page_init(struct page *page, unsigned int order)
>> {
>> 	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
>>
>> 	/*
>> 	 * Drivers shouldn't be allocating pages after calling
>> 	 * memunmap_pages().
>> 	 */
>>
>>      WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << o=
rder));
>> =09
>> 	/*
>> 	 * anonymous folio does not support order-1, high order file-backed fol=
io
>> 	 * is not supported at all.
>> 	 */
>> 	VM_WARN_ON_ONCE(order =3D=3D 1);
>>
>> 	if (order > 1)
>> 		prep_compound_page(page, order);
>>
>> 	/* page has to be compound head here */
>> 	set_page_count(page, 1);
>> 	lock_page(page);
>> }
>>
>> void zone_device_folio_init(struct folio *folio, unsigned int order)
>> {
>> 	struct page *page =3D folio_page(folio, 0);
>>
>> 	zone_device_page_init(page, order);
>> 	page_rmappable_folio(page);
>> }
>>
>> Or
>>
>> struct folio *zone_device_folio_init(struct page *page, unsigned int ord=
er)
>> {
>> 	zone_device_page_init(page, order);
>> 	return page_rmappable_folio(page);
>> }
>
> I think the problem is that it will all be weird once we dynamically allo=
cate "struct folio".
>
> I have not yet a clear understanding on how that would really work.
>
> For example, should it be pgmap->ops->page_folio() ?
>
> Who allocates the folio? Do we allocate all order-0 folios initially, to =
then merge them when constructing large folios? How do we manage the "struc=
t folio" during such merging splitting?

Right. Either we would waste memory by simply concatenating all =E2=80=9Cst=
ruct folio=E2=80=9D
and putting paddings at the end, or we would free tail =E2=80=9Cstruct foli=
o=E2=80=9D first,
then allocate tail =E2=80=9Cstruct page=E2=80=9D. Both are painful and do n=
ot match core mm=E2=80=99s
memdesc pattern, where =E2=80=9Cstruct folio=E2=80=9D is allocated when cal=
ler is asking
for a folio. If =E2=80=9Cstruct folio=E2=80=9D is always allocated, there i=
s no difference
between =E2=80=9Cstruct folio=E2=80=9D and =E2=80=9Cstruct page=E2=80=9D.

>
> With that in mind, I don't really know what the proper interface should b=
e today.
>
>
> zone_device_folio_init(struct page *page, unsigned int order)
>
> looks cleaner, agreed.
>
>>
>>
>> Then, it comes to free_zone_device_folio() above,
>> I feel that pgmap->ops->page_free() should take an additional order
>> parameter to free a compound page like free_frozen_pages().
>>
>
> IIRC free_frozen_pages() does not operate on compound pages. If we know t=
hat we are operating on a compound page (or single page) then passing in th=
e page (or better the folio) should work.

free_pages_prepare() in __free_frozen_pages(), called by free_frozen_pages(=
),
checks if compound_order(page) matches the given order, in case folio field
corrupts. I suppose it is useful. But I do not have a strong opinion about
this one.



Best Regards,
Yan, Zi
