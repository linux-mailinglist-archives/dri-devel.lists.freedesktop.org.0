Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB2CB9B1BA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 19:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FCF10E79F;
	Wed, 24 Sep 2025 17:49:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="V31wj4dv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010009.outbound.protection.outlook.com [52.101.61.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725B110E79F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 17:49:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+NwMhORfhbnPc8KKEfZSK29crefxt5TEi0NI/EET98z5cegnod7/BP9bm2iCsQmXhg9uZoE4owUV+10xdTbklJCUwVWnt96YolKNVvHyws+3UU6sRR8Os61jiJVYAuTFEUVvr8uxbiywndtAQTh4TBmVAOKFZYdMwVp8WQbzvaZ8srUno13pmoBqs5WLjX/d4D6R9go2R+MR1AXNzmqBGqs/gJGt8Bke3kWHzG7cA6a5w6sAzo1waFqLeu69pstKKQ11Y4r9cANEzkMTc0ZcojQ2UfVzmsacMVNhLQFPvUKsLUjhMvi91X6Q6SHj4xR4zMZAlw0/mGvgu+O6P9N8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTEoIJ53MSgMs2wbO9MpzzwWOs88vgTi1IFkpu9Mv+k=;
 b=PD+jneHYKR+QhrR72N3cVVRK5LjNT1DUQW1Qsvj5O6uDJZVgLU3EaqKklut23SvWdxKcAXDKu66fHVxuuhC8EI9aWX2IhVn9JX5kbZnkR+vjZP7YDmaHIWz02NowTplxNVTdRhhkOWIW21/T8HhZTwtSl8595kNy8robEerw5gjayoX3+uhymaFZT1sM6OwU/NUulwbvM4UcYnw0lpwZeepLH2J3b5XqBfqP6nFbd4Jn9OzIaI/0rqgll6ocLgjsRGIoE3upuWo7GD9mpAUvTvoXuaKBWRZia5oOrsU/4BTXR2BXSPQTSs+or4BdcqTHAq6ywg28t6WghslSaQnmlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTEoIJ53MSgMs2wbO9MpzzwWOs88vgTi1IFkpu9Mv+k=;
 b=V31wj4dvheaErquEwGDJBpNpTJNSmsERc/wBaTRen2vWwfg7X7ZAfNc+RmZYN8YMLBjida1GWkObqkOk/joYoGyS9CCluU0EtgU7YQvgMqkiFzTB2g8tR2y7wsOJpFPbpIBDNh71mSvS/gG32aJaMm+4pNCOMXKvMgVuVhk0A3BhEE9wMqrnkqZyLYPyJbNHK6dawi+a7s7JfPQ2UXq1jrLlopmsi2ixeNakXsprgyxH37opHR4nnDeOiCa1Qn8bpbwBuYIn1q2b9RPpu1ZUoq6nHDUcVZLcC3PVm0mVbIt76g6vy+hSwBpbnnOdlYDuxlVy1l0hY4Y+aZq98/+KjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM6PR12MB4265.namprd12.prod.outlook.com (2603:10b6:5:211::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9; Wed, 24 Sep 2025 17:49:45 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 17:49:44 +0000
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
Date: Wed, 24 Sep 2025 13:49:41 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <4534DB6E-FF66-4412-B843-FB9BC5E52618@nvidia.com>
In-Reply-To: <c7a2ad6e-68cb-4689-b72e-6e7ebfcf5e64@redhat.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-2-balbirs@nvidia.com>
 <882D81FA-DA40-4FF9-8192-166DBE1709AF@nvidia.com>
 <f026c5a1-ec51-4fa5-bc58-c2d690f9248c@nvidia.com>
 <87F52459-85DC-49C3-9720-819FAA0D1602@nvidia.com>
 <891b7840-3cde-49d0-bdde-8945e9767627@nvidia.com>
 <c7a2ad6e-68cb-4689-b72e-6e7ebfcf5e64@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL0PR02CA0041.namprd02.prod.outlook.com
 (2603:10b6:207:3d::18) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM6PR12MB4265:EE_
X-MS-Office365-Filtering-Correlation-Id: 52878960-03ab-4d4c-aa2d-08ddfb92bf24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjdiNEsrUlBGdHlybjFJQWZIYUZjR0FDWWNsOEVGdllMK0ZIM2kxZ1dTWGpB?=
 =?utf-8?B?OXNrRmJDelF6M1A2dmczOVZQUEtiNlE2Q2RHcy9JSXBQR2I2b0k3OWU2TDA5?=
 =?utf-8?B?YnJzR3FUZjJEdkJTUHBENW1OUENSdTdxcGJrMGE2T000RVJ1aEhBOWVwYTA0?=
 =?utf-8?B?SnlRd3FObERsazBHZlpsT1dSbmR3WDFCZ3IvN0Q4SlREUkNpK1hXUnB6NDZK?=
 =?utf-8?B?ODhWT2VYcVVQOExSNzdkRUZ2QzIraUdqQzRYTUc4TmhxS2VjTHRITlJzK3Zo?=
 =?utf-8?B?YkM3bjFVOWRWUHMxdXB6M1Z3aGRtWVlwaFd4c2xMd3hhb0VidGxpQkZpWHo4?=
 =?utf-8?B?b2x1NHpmakN0Rmp2VWtFNE01c1FMbmxwZVA4a2Yzb0dRbkRXcEtGZ0RhMm1O?=
 =?utf-8?B?c2s2R2pJeTdWVExaaEU2UE5mcDVvOC85ZGw2dFN6VDhrRW9HZTZLRE9iczJo?=
 =?utf-8?B?T0VXOTlhNVJiTWt2cU51bEhkN2pYdm14amY2UzJ5MWJMWHRENUZOZThSeHY4?=
 =?utf-8?B?d1lBRVYwUWR2MHBlRjRWZSs3Q3FBaXYyRmlJUzB4ZW9DNmNpVXBkUWt3cEJ3?=
 =?utf-8?B?N3FaN0hWZ0Fhb1pJMkhQU2M5WVVnMXE2MHU3MkRvSXBKaWtTdmJldGxCZ013?=
 =?utf-8?B?VHBQc3QzWnBYSk03eGZlNUdXVGFFbE9tQ0JMK1VVdkIxQndyeHpDb0JaZEJi?=
 =?utf-8?B?dkUxcm4rNllEWHVONzNKWlRmQ3MrTXNNeEJ0bjlCQUhoUTlOVlRHT002UWth?=
 =?utf-8?B?K1lZZUpoemlkWUpMc1p6QnVlcFZHTG4yZG81QWdJMDNiWDJEa0lNWGVlTExP?=
 =?utf-8?B?NmZ4dVBoYlNidXd4cFUvNXFxNE5rcCtTS3pPMC9QWUdPbDhJUGxkaVJvalpC?=
 =?utf-8?B?bkpMeTNXVkRFYjFodVBlTzJZOTVlU0sreU5FNmRsTS9XaEFWN21JZGt1Skox?=
 =?utf-8?B?dTgzNVVZVEZwS2t4UHViSWxYMDJqRzhxeFRRbGlidlJLRjZsRk9KRjk1VjN2?=
 =?utf-8?B?WGhyR2JBL0s2TUx0OENFZjFzN0JIZTgweURoTURKQzljRUI4bjF0cVVHeHZ3?=
 =?utf-8?B?OUVvTVFnbk5jcWx4WlRaUytNZHVGTWlEUUtkQTI1eUhSb2JhVzR0Y3loQzdi?=
 =?utf-8?B?VUlJSmxFNFJQelVzTk15SkFZV3NheWpGR3lDZ3dsdXVMcU1HSGNLdVZtMjJt?=
 =?utf-8?B?Q1BxeUtNVkhkcDhnVzF0cDVDcDAyRUQ3MXdBUkhTM3ZRblowZ0JrVUpjUnFr?=
 =?utf-8?B?eVdiaG81Z1doakFJT1laSFdRKzV5b2ZDZmMwUmdldHc4bUlKNG1vMVNvN0Fk?=
 =?utf-8?B?dGxpZXhvUWl5cFRqeDJqS3NQSjRXNU5TZGoxZkZKTFkveGYwaVJrcE5UZENL?=
 =?utf-8?B?UFRudEJmNTJUZXRJTUNBbjMrTjIzS0EwWm1wTGNRWFR1UHRKQ1hVVGVRT202?=
 =?utf-8?B?YTU4WUgrYTZadjhnSFR5K1R5Y2JuZlhTL3FZRlMxRDVDMmtZQU1wSmNRTTAy?=
 =?utf-8?B?T3NSU2ZVdEx2ZXpwaFhWZk1uR3phVy9nU3NlUk1Ha0M3TFI3dEw5WXNJVFl3?=
 =?utf-8?B?ZTEvekFHcysrSTRTaUN3dnhqMHV4YmpWeWxvcEJGRmZSd05vbWJDQ2NKR3VR?=
 =?utf-8?B?ZytaWHNJN01nRkpLYmhRaFRudFRnaVVBaG9NMkZISGJmM1ppNmpnQk5GanRQ?=
 =?utf-8?B?RUpUZ3Q4ZHA5Sk5hTHNSd3AwbVRzYkVtTTlmaDNRSElHK3h2cE5vQUlDMnht?=
 =?utf-8?B?VVYwOGdEaHdMNlNXb2JTZFlUcWQvY2lLbnJnbzdRemFqdHA5TnV5aDlLV0Js?=
 =?utf-8?B?aGFOWDhRekNhQ0ZsOGpOVWhwSkxTMmRydkR5SmlnSUdzZCtXUjNINmR5Mk1B?=
 =?utf-8?B?NldZb0tyYmtrYVJCS1JhWFNvV1l2aWNsRmhVVEpPUVhlRURJTElobnY0OCtF?=
 =?utf-8?Q?dCxEIqkC42w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlByOGlFclV2VWdVVDdsWHAwckN3eGRaTkRRVDU0RGExalJDbzNsd3cvc3NM?=
 =?utf-8?B?bEVZOHIvUEI4VTBqNFNIMHZJOS9XWm40aGNFeWY0aloxRDBHcU9NVVBCNitD?=
 =?utf-8?B?Tkg5UHN0ZVRBNmZEcHYxdWlxVGwzRVpLUHVnZkNtYU5abUk5ZWNuWnpmSzFw?=
 =?utf-8?B?b3NpYW42Umd5Mm5iOEpoVkx1V053ZWozd1V4dFpSa0ZBbFEyajJFbDF3SzYw?=
 =?utf-8?B?WUV0cGliVzBuekoycVh0aXVUS0xtSDFkOStYOFRQTTdCQWJmT29VYWJWMTJX?=
 =?utf-8?B?aWZmOFdjL2ZQLzhia1l2SEI5VmVuTG1WaHd0bExvSE9iV2lhV0pCYjA5WDJZ?=
 =?utf-8?B?MC90UytrOVJ1cHhOWEg1OW1uQXdIdHRTYmVKYXExSkJNQ3h2R01mMmtZd0Nn?=
 =?utf-8?B?SDZyZGNPYlpJdFdFT3FXUi9YcVVNUUYxWWZBZkQ0eGk3aG5YZUZLNitXNTJy?=
 =?utf-8?B?R2ZJMGdDTGNQVU1kd1JMckVwWGVjNy9KeXpxK3RNNDl2b1JBb3I0cTN6SU8z?=
 =?utf-8?B?b0M2d3ZNRzlXSkFqSnV2YzBNN3lJN2JNQmNyR1dSMWZRT2Z3R0dZaWd4S1FP?=
 =?utf-8?B?UHc2OGp6cE5EVy9OaGc4WlhRTkx2dUdaWDIxbFF6bXFEQWFON0RhR0ZiTzV0?=
 =?utf-8?B?VCt3eWFBT1ZUSGVVTjdSWW1MTlpZVHpFZnNyQ1VramlHMWsyVlRoeDhDcDNv?=
 =?utf-8?B?QVZwL3NybXNXeVU5Ync1QStPb2R1dWt4MFpGbUUycG1IVHMyd05RUDU0MkJM?=
 =?utf-8?B?NnF0Z2dpVVkzNHhXbmxPd1JRSkU2VDNlS240M1NTbkZNRWJpSUpZeFVmRjRX?=
 =?utf-8?B?R25LMDFDMXJ2SGRhSmhLZ1JpSWdXY1RldmNUTU1lY3RzeXBlclpoUGhXWi8r?=
 =?utf-8?B?em8wU1hMbUdYazBsQm15dGZYWm45WFhQcDVuL0NrUWNtVk9sdUkvV2wya2FE?=
 =?utf-8?B?ZnBPZWd2SmF2QmYwZHppclpnNVUxall6RnM0SEovcTd4Y1Jlem5taVVIc25z?=
 =?utf-8?B?NFhzK2o3M0hHblJiRGpYTXdoYVhRbThkS3E5UTBsak1ObWk2cjFpMkYvTndh?=
 =?utf-8?B?dzJyUW1XbGNjTXNSUnpEWUZ2RnF0SlZmVzVvWTZaQkl5b1hPbmtwSUZzZENK?=
 =?utf-8?B?M2NNR3g5dVRQRC9lZHNGWFVMQmh6eEQyZ2wvMkdoYzVtVFR3bjg2NWdDSDda?=
 =?utf-8?B?MnBBZUpPKzhUQ1NFaCtLQ0swalBRNmk5YkVycHMvVndKTEtWbGg4bWhrdFNI?=
 =?utf-8?B?RGtCcS9GVGI4ZjRrRUdoeFp6Sm5RKzl1cEhaSXdyMmVBZXVMblQyM1Z5RHVw?=
 =?utf-8?B?NXh5QU13RVBjdHd4djVKMnNtaUJlc3h3TU1GclkrNG9nRGVxT2tjYnQ0QkpL?=
 =?utf-8?B?NkRGUnlNNzRpNjdnQ2dQU3BOMWg5UHlOV1ZSM1RsbWtaWXFlM1hBUzhqaHg1?=
 =?utf-8?B?aEd5UCt1TDZCS0ZaVGlwMi9IVVhYMitYcFI4U1JKbGRkSFN4Q3FlRXBKZHlO?=
 =?utf-8?B?TDU2SWtXU3lleU9TOTllUDBseXdWa3BhY3hwVkxsWGlsSnpGQmdzalBQTUxL?=
 =?utf-8?B?dGxMbE5NV2ZoQjJMS2NsMVI3L09Ra0RDSWdJWHdSNGFrbEMrVHdhVHhWbXVZ?=
 =?utf-8?B?WFozUVVLbSsrM1ZlZ0FoWHBFVDBWUCtyQU1WLzdHZWFWUTFKOUFKblFOVmtF?=
 =?utf-8?B?WFFEMXVjUU9Xd25iVDh3cmU4OUxuVC9FL1lBOVd4cVAyT0E0bHlvVkVPQ3U5?=
 =?utf-8?B?Uys5OEtMTGtzdGZYd09ac0lWUHJNZU56K1RzN2czS0w0bW5lQ29ZRGhaOHgx?=
 =?utf-8?B?K2tFREk0YVVadDRkTmhmRGdjVFNod2ZqKzFDRTZUTHVKWU43bzQrclVlb1d1?=
 =?utf-8?B?NlBCRFR0Ym1DNUsxWFI5K2VFd0FWT0ttWlhMZWVQa3FNWkhkdG1wM3RUdlRz?=
 =?utf-8?B?ZWZVY2ZRcnFBV1Q4L1pEQmJOazU2ZEhIN1hKZFFqZ1V1OGNXVkNyTUJDSXdh?=
 =?utf-8?B?WHFOdk5HKzRQNWVPcy9qWXBVaGVCQ3JQbHZGUkpONGdVLzRIaWhaWEpOcVJr?=
 =?utf-8?B?V3FieXBWN1hlaklMU0h2RzVnRnh6bU1ZVHhKQitzUDdKTDhjRUlQeUd4Z2NG?=
 =?utf-8?Q?O+UHTIphiTd1G2ZAR+6NQlsj9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52878960-03ab-4d4c-aa2d-08ddfb92bf24
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 17:49:44.8525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jt/Y+iLWqSIiFSSNemkv0dElDGaSmw613/nObogitUnDf1OiTuld6++3pY42BKYA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4265
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

On 24 Sep 2025, at 7:04, David Hildenbrand wrote:

> On 23.09.25 05:47, Balbir Singh wrote:
>> On 9/19/25 23:26, Zi Yan wrote:
>>> On 19 Sep 2025, at 1:01, Balbir Singh wrote:
>>>
>>>> On 9/18/25 12:49, Zi Yan wrote:
>>>>> On 16 Sep 2025, at 8:21, Balbir Singh wrote:
>>>>>
>>>>>> Add routines to support allocation of large order zone device folios
>>>>>> and helper functions for zone device folios, to check if a folio is
>>>>>> device private and helpers for setting zone device data.
>>>>>>
>>>>>> When large folios are used, the existing page_free() callback in
>>>>>> pgmap is called when the folio is freed, this is true for both
>>>>>> PAGE_SIZE and higher order pages.
>>>>>>
>>>>>> Zone device private large folios do not support deferred split and
>>>>>> scan like normal THP folios.
>>>>>>
>>>>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>>>>> Cc: David Hildenbrand <david@redhat.com>
>>>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>>>>>> Cc: Rakie Kim <rakie.kim@sk.com>
>>>>>> Cc: Byungchul Park <byungchul@sk.com>
>>>>>> Cc: Gregory Price <gourry@gourry.net>
>>>>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>>>>>> Cc: Alistair Popple <apopple@nvidia.com>
>>>>>> Cc: Oscar Salvador <osalvador@suse.de>
>>>>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>>>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>>>>>> Cc: Nico Pache <npache@redhat.com>
>>>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>>>> Cc: Dev Jain <dev.jain@arm.com>
>>>>>> Cc: Barry Song <baohua@kernel.org>
>>>>>> Cc: Lyude Paul <lyude@redhat.com>
>>>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>>>>>> Cc: Mika Penttil=C3=A4 <mpenttil@redhat.com>
>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>>>>> ---
>>>>>>   include/linux/memremap.h | 10 +++++++++-
>>>>>>   mm/memremap.c            | 34 +++++++++++++++++++++-------------
>>>>>>   mm/rmap.c                |  6 +++++-
>>>>>>   3 files changed, 35 insertions(+), 15 deletions(-)
>>>>>>
>>>>>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>>>>>> index e5951ba12a28..9c20327c2be5 100644
>>>>>> --- a/include/linux/memremap.h
>>>>>> +++ b/include/linux/memremap.h
>>>>>> @@ -206,7 +206,7 @@ static inline bool is_fsdax_page(const struct pa=
ge *page)
>>>>>>   }
>>>>>>
>>>>>>   #ifdef CONFIG_ZONE_DEVICE
>>>>>> -void zone_device_page_init(struct page *page);
>>>>>> +void zone_device_folio_init(struct folio *folio, unsigned int order=
);
>>>>>>   void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>>>>>>   void memunmap_pages(struct dev_pagemap *pgmap);
>>>>>>   void *devm_memremap_pages(struct device *dev, struct dev_pagemap *=
pgmap);
>>>>>> @@ -215,6 +215,14 @@ struct dev_pagemap *get_dev_pagemap(unsigned lo=
ng pfn);
>>>>>>   bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn)=
;
>>>>>>
>>>>>>   unsigned long memremap_compat_align(void);
>>>>>> +
>>>>>> +static inline void zone_device_page_init(struct page *page)
>>>>>> +{
>>>>>> +	struct folio *folio =3D page_folio(page);
>>>>>> +
>>>>>> +	zone_device_folio_init(folio, 0);
>>>>>
>>>>> I assume it is for legacy code, where only non-compound page exists?
>>>>>
>>>>> It seems that you assume @page is always order-0, but there is no che=
ck
>>>>> for it. Adding VM_WARN_ON_ONCE_FOLIO(folio_order(folio) !=3D 0, folio=
)
>>>>> above it would be useful to detect misuse.
>>>>>
>>>>>> +}
>>>>>> +
>>>>>>   #else
>>>>>>   static inline void *devm_memremap_pages(struct device *dev,
>>>>>>   		struct dev_pagemap *pgmap)
>>>>>> diff --git a/mm/memremap.c b/mm/memremap.c
>>>>>> index 46cb1b0b6f72..a8481ebf94cc 100644
>>>>>> --- a/mm/memremap.c
>>>>>> +++ b/mm/memremap.c
>>>>>> @@ -416,20 +416,19 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
>>>>>>   void free_zone_device_folio(struct folio *folio)
>>>>>>   {
>>>>>>   	struct dev_pagemap *pgmap =3D folio->pgmap;
>>>>>> +	unsigned long nr =3D folio_nr_pages(folio);
>>>>>> +	int i;
>>>>>>
>>>>>>   	if (WARN_ON_ONCE(!pgmap))
>>>>>>   		return;
>>>>>>
>>>>>>   	mem_cgroup_uncharge(folio);
>>>>>>
>>>>>> -	/*
>>>>>> -	 * Note: we don't expect anonymous compound pages yet. Once suppor=
ted
>>>>>> -	 * and we could PTE-map them similar to THP, we'd have to clear
>>>>>> -	 * PG_anon_exclusive on all tail pages.
>>>>>> -	 */
>>>>>>   	if (folio_test_anon(folio)) {
>>>>>> -		VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
>>>>>> -		__ClearPageAnonExclusive(folio_page(folio, 0));
>>>>>> +		for (i =3D 0; i < nr; i++)
>>>>>> +			__ClearPageAnonExclusive(folio_page(folio, i));
>>>>>> +	} else {
>>>>>> +		VM_WARN_ON_ONCE(folio_test_large(folio));
>>>>>>   	}
>>>>>>
>>>>>>   	/*
>>>>>> @@ -456,8 +455,8 @@ void free_zone_device_folio(struct folio *folio)
>>>>>>   	case MEMORY_DEVICE_COHERENT:
>>>>>>   		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
>>>>>>   			break;
>>>>>> -		pgmap->ops->page_free(folio_page(folio, 0));
>>>>>> -		put_dev_pagemap(pgmap);
>>>>>> +		pgmap->ops->page_free(&folio->page);
>>>>>> +		percpu_ref_put_many(&folio->pgmap->ref, nr);
>>>>>>   		break;
>>>>>>
>>>>>>   	case MEMORY_DEVICE_GENERIC:
>>>>>> @@ -480,14 +479,23 @@ void free_zone_device_folio(struct folio *foli=
o)
>>>>>>   	}
>>>>>>   }
>>>>>>
>>>>>> -void zone_device_page_init(struct page *page)
>>>>>> +void zone_device_folio_init(struct folio *folio, unsigned int order=
)
>>>>>>   {
>>>>>> +	struct page *page =3D folio_page(folio, 0);
>>>>>
>>>>> It is strange to see a folio is converted back to page in
>>>>> a function called zone_device_folio_init().
>>>>>
>>>>>> +
>>>>>> +	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
>>>>>> +
>>>>>>   	/*
>>>>>>   	 * Drivers shouldn't be allocating pages after calling
>>>>>>   	 * memunmap_pages().
>>>>>>   	 */
>>>>>> -	WARN_ON_ONCE(!percpu_ref_tryget_live(&page_pgmap(page)->ref));
>>>>>> -	set_page_count(page, 1);
>>>>>> +	WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << =
order));
>>>>>> +	folio_set_count(folio, 1);
>>>>>>   	lock_page(page);
>>>>>> +
>>>>>> +	if (order > 1) {
>>>>>> +		prep_compound_page(page, order);
>>>>>> +		folio_set_large_rmappable(folio);
>>>>>> +	}
>>>>>
>>>>> OK, so basically, @folio is not a compound page yet when zone_device_=
folio_init()
>>>>> is called.
>>>>>
>>>>> I feel that your zone_device_page_init() and zone_device_folio_init()
>>>>> implementations are inverse. They should follow the same pattern
>>>>> as __alloc_pages_noprof() and __folio_alloc_noprof(), where
>>>>> zone_device_page_init() does the actual initialization and
>>>>> zone_device_folio_init() just convert a page to folio.
>>>>>
>>>>> Something like:
>>>>>
>>>>> void zone_device_page_init(struct page *page, unsigned int order)
>>>>> {
>>>>> 	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
>>>>>
>>>>> 	/*
>>>>> 	 * Drivers shouldn't be allocating pages after calling
>>>>> 	 * memunmap_pages().
>>>>> 	 */
>>>>>
>>>>>      WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 <=
< order));
>>>>> =09
>>>>> 	/*
>>>>> 	 * anonymous folio does not support order-1, high order file-backed =
folio
>>>>> 	 * is not supported at all.
>>>>> 	 */
>>>>> 	VM_WARN_ON_ONCE(order =3D=3D 1);
>>>>>
>>>>> 	if (order > 1)
>>>>> 		prep_compound_page(page, order);
>>>>>
>>>>> 	/* page has to be compound head here */
>>>>> 	set_page_count(page, 1);
>>>>> 	lock_page(page);
>>>>> }
>>>>>
>>>>> void zone_device_folio_init(struct folio *folio, unsigned int order)
>>>>> {
>>>>> 	struct page *page =3D folio_page(folio, 0);
>>>>>
>>>>> 	zone_device_page_init(page, order);
>>>>> 	page_rmappable_folio(page);
>>>>> }
>>>>>
>>>>> Or
>>>>>
>>>>> struct folio *zone_device_folio_init(struct page *page, unsigned int =
order)
>>>>> {
>>>>> 	zone_device_page_init(page, order);
>>>>> 	return page_rmappable_folio(page);
>>>>> }
>>>>>
>>>>>
>>>>> Then, it comes to free_zone_device_folio() above,
>>>>> I feel that pgmap->ops->page_free() should take an additional order
>>>>> parameter to free a compound page like free_frozen_pages().
>>>>>
>>>>>
>>>>> This is my impression after reading the patch and zone device page co=
de.
>>>>>
>>>>> Alistair and David can correct me if this is wrong, since I am new to
>>>>> zone device page code.
>>>>> =09
>>>>
>>>> Thanks, I did not want to change zone_device_page_init() for several
>>>> drivers (outside my test scope) that already assume it has an order si=
ze of 0.
>>>
>>> But my proposed zone_device_page_init() should still work for order-0
>>> pages. You just need to change call site to add 0 as a new parameter.
>>>
>>
>> I did not want to change existing callers (increases testing impact)
>> without a strong reason.
>>
>>>
>>> One strange thing I found in the original zone_device_page_init() is
>>> the use of page_pgmap() in
>>> WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order=
)).
>>> page_pgmap() calls page_folio() on the given page to access pgmap field=
.
>>> And pgmap field is only available in struct folio. The code initializes
>>> struct page, but in middle it suddenly finds the page is actually a fol=
io,
>>> then treat it as a page afterwards. I wonder if it can be done better.
>>>
>>> This might be a question to Alistair, since he made the change.
>>>
>>
>> I'll let him answer it :)
>
> Not him, but I think this goes back to my question raised in my other rep=
ly: When would we allocate "struct folio" in the future.
>
> If it's "always" then actually most of the zone-device code would only ev=
er operate on folios and never on pages in the future.
>
> I recall during a discussion at LSF/MM I raised that, and the answer was =
(IIRC) that we will allocate "struct folio" as we will initialize the memma=
p for dax.
>
> So essentially, we'd always have folios and would never really have to op=
erate on pages.

Hmm, then what is the point of having =E2=80=9Cstruct folio=E2=80=9D, which=
 originally is
added to save compound_head() calls, where everything is a folio in device
private world? We might need DAX people to explain the rationale of
=E2=80=9Calways struct folio=E2=80=9D.

Best Regards,
Yan, Zi
