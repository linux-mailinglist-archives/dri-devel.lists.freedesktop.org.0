Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C1DB411C7
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 03:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF7210E854;
	Wed,  3 Sep 2025 01:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cveou21r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0434E10E853
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 01:19:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQFIB1mMTi/73Wn2qcdj1un1wAoI0hu1iF20oaivRfQhpy215m5+afj2cCihpNVrP2kBFqv8sNWa1+HMu+T8yhFqWCEfkpXIvXTd9rRDr6TS1ctBqCmUyZIwXxxL+hzOjvu30IU6/Dz4mO2KhZZlyUSHpEmHLaSs0KzJO7+Epj5th+SHlNlN5lU31S6EMLDX+e0XRAf942jn4D0Xnry6Lt7ZFp9YoFXa8J3o3Vt5tpQ9Ujq1hZKYgFYKZ+biJZT7b1neuG8a1B8JsCrm2o1UM0XakWJMAs9rhJ7SjPH+wnPi/2Y7pdyW5ph4Z/mYKDuKmC6hacwUdg/bGzAz4/aVnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/Xl3mQG/VVnOsUD3BG6UNC8u0eW+KdALscPe8O559o=;
 b=nGzDsSMRx8rrxOmFjKwwrKUhSrHR88t+0oSrNDOHDAwYEeLiE3PeALfekF2dEkreqBmc11neNe3TQLXOhNbNWtlRLK9EgLUzzAtT59ye9xFmqzAgiwWlrfS19f1UrFmPu5Cxs3cptMQgM2KDj0gtdEG9jvHQsUaJsbsoxuhJaSTt+8eaIq+mfx+ulxmBaIhIYTyKoPL7HOtaL9r4RXh98w6rF5yz+N2qhjwZSFmvcuaUH4jGwth1YQu1k9+W3heaYi+03pYtVF6mzL8vA4h5SzCLjTynnCGMdKXX+QER+tXNT4EfnprwQ8pLOW6cCUX1FQHLYVrDvhnXtcUzCO2TIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/Xl3mQG/VVnOsUD3BG6UNC8u0eW+KdALscPe8O559o=;
 b=cveou21rpvs7YgHgd7cbcaTVnRBpbxDGalhgTToLstp+jRFp/ymCzi67MhCLsyldWDwDIa+EXeztZr+9UjbK2Iozb5poVgtcWo4pyEZ4MS2xIOPpMH9LtDm8h1EithU2G6J6QzaRkAq50OUzWNq8scO1TU/WCyYc2TgL1DandTqEBq7Gn4XvYQut7nQQcqfk9SysIUkb+fxznjl3+4jNNrvdHfETx0qCRx+W8X4Hqt3NK9X40BfhVddpxLn0mMEe8B+61RL7N/9PuzhbxzfSZFGH3FxAoN4xVc0ZFEsmBcbHRwKL8BNmkW2RFT26NcKavG2VeBJao32Zfln5Y9UYPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH7PR12MB5950.namprd12.prod.outlook.com (2603:10b6:510:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 01:19:46 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 01:19:46 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [v4 04/15] mm/huge_memory: implement device-private THP splitting
Date: Wed,  3 Sep 2025 11:18:49 +1000
Message-ID: <20250903011900.3657435-5-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250903011900.3657435-1-balbirs@nvidia.com>
References: <20250903011900.3657435-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0012.namprd21.prod.outlook.com
 (2603:10b6:a03:114::22) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH7PR12MB5950:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e73ba38-a7c0-4d6a-f221-08ddea87f800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXVlVm51aENrRFI2NjA5dmFqQ29GL3Z0a2FCTGRUdXZrUmZqOE9Ocmh3TVpp?=
 =?utf-8?B?NVdaemp1dGRIVXJGeTk3U1ZtOTk3ejY0Y0J1K2pOUlhuUHpmS3dmZlQwU0V4?=
 =?utf-8?B?OWh1TnNzc1ozOHBaQWVyRUs3OXZHL2hqTFNUT1k0RVF0b0d6SGhKTmkrNlli?=
 =?utf-8?B?cU1ibGRwcmJQai9XL2ZDdTJwOENZSVo5bkdkNHNLdGdGakJOdEc4aFhGcDhz?=
 =?utf-8?B?WUpxYktQUmFFSTcwVUxQdERyaEFiSW9OVkxETitpZTdIVUQyWW9yL210b2lj?=
 =?utf-8?B?bnYvVndmWklsU29RVXpTbEx4cU5iQUc1ZnhDT1pVODU3eC9lRHZLVmthSndn?=
 =?utf-8?B?SzdwZ1dhUFcwWDltRGJDeW1TTVp0eVE5Z241L1YzbWc2clFtZDNiNEdwWFNO?=
 =?utf-8?B?NXV6ajl0MDBiKzRTRDM4eDhSUi9xMHlhOTlkUDFMeUppYUt5TzVRZ0lrV2lo?=
 =?utf-8?B?L2pCSmkzc0ZxU05nNmhhQzY2ZTdVTWZDYjN4NFp5NWlFRk41WWhXbXJYVkFo?=
 =?utf-8?B?aERJLzhGaXo3UkhWb0RsZFBxdTJVVzdKUHphY2Z5N09pOTVla1dlRzBGa2VI?=
 =?utf-8?B?VUd4VVZhZXdJQ1FxRjJjOEtXanpkazZ2Y25WL3pJdVZ3TURQOVNOUVB3eVZC?=
 =?utf-8?B?cGtCVVJEV1FDMGpCUXJrYWE2Sk5SNEIxWWFob3JXREg2L2Fpc3BWSWJHWC9J?=
 =?utf-8?B?cmZ5aVlLZGdwS3ZZa014WG5nL3RGUFFncDNGVldJQTBwRFBFVXdoQXlzSE1l?=
 =?utf-8?B?azVvNnk4bXFzUGNqNWtYRUJNSmxkYVJtditWSTYyRmV4QjJDNWtNTkhmclB6?=
 =?utf-8?B?TFVicGhMYk1ObUZ1c2VWeTBxRWhEdUsyT0hRNTBzbWlxVTN0SU5zNmZtVTFB?=
 =?utf-8?B?cUhmeldjNU9ZYmtiRkZ3S00yN29NYitPbWlYeFhoeXk0Mk5hN0lRSCtwT2Iw?=
 =?utf-8?B?ejN1REhlQzhZdHVrZGVUTFRxODN1S1BXV1VsRndYNzVwWkU0R1ZEeEk1VThE?=
 =?utf-8?B?Yk9JZGZiQTZtVTJCeC9IK0t3Q3diZGRpeEljTXdERU8vVUhFNThTZk10NC9C?=
 =?utf-8?B?Kys3N0hQV2hUbUxJaFMxRXJ0eDh6RWl4QjFjaFlYOENFV1A2Rkg3VUI1YU5F?=
 =?utf-8?B?ZlUrVERna2JFbWtFbU5Uamg3cWZwWlhFTTlSY2dHdUZaNWFBWjh4WVRBU2Zk?=
 =?utf-8?B?RGw3YmFrRWp1Zm03Y21LQnRCQjZlcTZaZ2tzbm0vNXZyZk83TGpNR0RkWG5J?=
 =?utf-8?B?NzQ1Tmk3S3BXTlNtQ2EvZ3F3QWhmWGh3Q21wWXdoWDBhdTBVdWp5U1J2czkx?=
 =?utf-8?B?YjRCc2tEclUwbnFzWDdCZ3NLcXlXTTZhcklBUkJCdzl5TSthVWlldWdHODR0?=
 =?utf-8?B?VjhYMStZK2hjbW81akkyV1ZJeXpGQ0NDSXcvbzdYWVFXeE9ZODc3N2ViZ0M3?=
 =?utf-8?B?Si9LcTUxV3hKYTVpdDlKZUNrb0haNTR5ckM2dk4yeHE2OEMwbWs2QnJLR1h0?=
 =?utf-8?B?RXFUTFlhNVpZdURsTzdvRzJFUWdCWEpMUktsUmtYdVdGWitNYUlyc1JPMGI2?=
 =?utf-8?B?UTRkT1dSbnhWcWkvbSthRURuZFNOaHFtUHczRXc5MWlxY2tBTm1ORkZjS3d2?=
 =?utf-8?B?NTExNjAvcEhLWWRoUEduZTRvNUczMTNLWDcxaWFwMEh1YXJyeEpnd0tkenl0?=
 =?utf-8?B?dkdDeUQ3VTN4L1pKdU5HcGR2dWlBMkdiMTNiSGdyVXFzQW03U2JVVU9ONkJX?=
 =?utf-8?B?a1c0S213TXlQUHo3VHdjVXRnb2NobkVoWnpkOU9CY0o2YnNqb0doR3RPMnFk?=
 =?utf-8?B?M3FGbmkyRXZXejh1a3BHcnN1VEtDazcydUR6a3ExR2pZSXBsM1ovOW80Q3g3?=
 =?utf-8?B?ditOeGdRdXRCdWdoRSt0SHFhTkFZbmlsMGtyUHBwa3BUSjNNanl5dmFzMVUx?=
 =?utf-8?Q?+gHgf9HvGaA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3FCb3VVLzRwT0hDZk00VW5LRTBuNW9GRDB2RTZoQkI3dTdqSWZXT3hOOStV?=
 =?utf-8?B?NnJsMzFTbXo1L0gzUCtuK2VMWFVIZm1NZTdrUVdRbXI2VTZLSmExYVBNcVhq?=
 =?utf-8?B?ZVlXNHJ4NzMyUE5qcVV1KzkrVUpGT002ZnBkR1U3QUVnY2V2Nmp3ZGxsT3dt?=
 =?utf-8?B?SXYzM04vMVVJRmpHVjNodGw3ZzdnMnhXNWZuVUVNTmk5TWE4cHR5UllHcnNS?=
 =?utf-8?B?WDhlK2V3K2pPeXhzTG9sVklVNDFhTVZteUVaTloxQmxiTmU4d0pyamtYZ1di?=
 =?utf-8?B?ZWxvYjJJekp2YkRRSVdhVE9nOXRlZHA4MlQ3a29DSmF2dnd1dFduc2kzU0dD?=
 =?utf-8?B?SFdCTDZjUFRwL0l3ZFZIcUVjcXg0TjNXMlc3OXpZays2OHBsaElaN0dEMlho?=
 =?utf-8?B?UFhSem55S3ZBa09ZRldabzJXemxmWm9zeFAybG9CUVoxWDkrcTlwaWJSZnJt?=
 =?utf-8?B?OWpmdXZTYU83M2FnUDAzOGhTYnZjVUhtdzBNM29ubkRncTQzQnU1dHdEd0Vp?=
 =?utf-8?B?NFpwRCsvdmZoblZvcExVR1A1MlVyTTBDT3NHNnVzM1czekdFRU1xZ09ZejYr?=
 =?utf-8?B?TkxTWkR6aWEzemZmdkx5dXFFeC9aV2UxRXJjR3BNNm9rS05nQlBOODJoQWZy?=
 =?utf-8?B?ODNsNVN1WHFWQ1NERTVOLzdXSVJ1TUVRMkpwUFNkMHNtcDVWbUZGQ2VXSmpU?=
 =?utf-8?B?TW9zQlo0SDJ4SDNvdGNuanVkMWM0ZW81aHJCRjJRbUhhUkhYY2dRV1FmelBW?=
 =?utf-8?B?M2lpNHNqY1AzcnVON2t3V1lEWVpEZ21CS040MDFSZ0NQK2FyTEM0TnRLSFht?=
 =?utf-8?B?TXFicVFWbkluMDB0NXoxMnBLRUJFTDNWZHV6U1pBTW9nQWhmbVA5bUFRQ3Zz?=
 =?utf-8?B?cXRuTHNkMFRHVFF0T3BMVDJySVpwb1Rud0tQTGJUdlI2d1JqR3lFSS92V0FO?=
 =?utf-8?B?cmlzSFRoS1h5ZExNaXVSYmJvZnA2NUZEZHlwaXc5dE8wYSswbjc2VVhvU3NV?=
 =?utf-8?B?MnBiMndoVGkvalFJSkxpMURicVVaamxwdmkxWGZ1MUhoUzM0UUIyUENqNEpx?=
 =?utf-8?B?N045MWRkL0czdFBGaFE4S3FtYXVQbUVQMm41c2ZkOU1xdUl5ZWhjV3RTWTQ2?=
 =?utf-8?B?TGRlUTFwTmFCa3oyQTNZdUxzdE40aUlxNE1sb29HVW5rOHd4V1liNzJoU3Y0?=
 =?utf-8?B?TVI3V1dUZWVnUHdsWG4xb3NnNzFBd3g4aVpaMVJ4L0VCckFkZEEyaUlxelRx?=
 =?utf-8?B?V0pvc0t1ZlBhSUZRZTc1YklXS0pwWDAwSTdWbDdVQnU4M0g5RTZ5QWZXS3Ur?=
 =?utf-8?B?YnMrN0pCdlpTcUVnMkVzUDJOSndLTGc3cnozSFBYUEZBdWR3dHZUeFQ1anhR?=
 =?utf-8?B?dFF2dGk0Zy9FaW1oWlZWeWM5S1liVFBGRndqd1lWN3NMbGF2cjNsS0l6Y00r?=
 =?utf-8?B?TjErZHY4M2ViKzZWYmZ5RnEvTXhOdFAveDRsc3Q1YUVtMWxrK0RqcFJOLy9x?=
 =?utf-8?B?amVrRWVRQ3E1SzFBNTJXNHlnTnYzWElZbzJWK0pTeUo5OG9nNkluZnV1OWRC?=
 =?utf-8?B?OVFKS2JUeG9CdWVodDB3N1RIbjhQamhHQ0NmOHRoUzcyRVlla1BNMFpUT2Ez?=
 =?utf-8?B?YllPMHNSQW1mRjdaWVNZQzhJaS9FVkZiWHdsOE9VR0RhYkNwRzRmaEtQaHEz?=
 =?utf-8?B?dkdpWHZlTHpHakwzcW1JSUNOVCs3M0MzYzkweERKYlkyT3pLM282M2t0RnRJ?=
 =?utf-8?B?T2thaGo4bnV4Q0VrMlMwMGFQUzhYTkFCVjMxSnM3WTBnNGxubmpsMWY4YjdW?=
 =?utf-8?B?N1doZXNXTHJaSEM1ZzhPSVptaW12enZxOElsamRQN002UGdwdmhMMVNGWmdH?=
 =?utf-8?B?TWVxZ3YxRmM0TmtUdUpXeUlCSkhiZ2NTNnMyV0dHKzBLWGlYV25CeFNxY2hx?=
 =?utf-8?B?UnNhMVF3RERqN2E4Sk1OaG51dFkrdW1PSkRYeGcyaWg2UUJXQUtoM1pOb2Z3?=
 =?utf-8?B?QUJMUERmQkRGU0pyaGN1L0YvZlB3c25zUkc2MC9rQjY3YW1rdThSWWptZDBU?=
 =?utf-8?B?RmQ3Y0dkZU9EYldxb0J0ZW51b0VzZDNibTVycVArdmxwME9iYTJqbzdPc0tY?=
 =?utf-8?Q?3QgSMwZIElRT1oRxg7sG16SGd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e73ba38-a7c0-4d6a-f221-08ddea87f800
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 01:19:46.1887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cWqNmGabnQ2qbZ+O7rKoK9QdMBehRlEdOCkwqxgpK4smFCismbfPE06/XNa/vEPPcI34yB9RT+cS74FjWLj0YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5950
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

Add support for splitting device-private THP folios, enabling fallback
to smaller page sizes when large page allocation or migration fails.

Key changes:
- split_huge_pmd(): Handle device-private PMD entries during splitting
- Preserve RMAP_EXCLUSIVE semantics for anonymous exclusive folios
- Skip RMP_USE_SHARED_ZEROPAGE for device-private entries as they
  don't support shared zero page semantics

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Rakie Kim <rakie.kim@sk.com>
Cc: Byungchul Park <byungchul@sk.com>
Cc: Gregory Price <gourry@gourry.net>
Cc: Ying Huang <ying.huang@linux.alibaba.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: Mika Penttilä <mpenttil@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 mm/huge_memory.c | 129 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 91 insertions(+), 38 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 0c811d34f418..47fe07b9fee4 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2888,16 +2888,19 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	struct page *page;
 	pgtable_t pgtable;
 	pmd_t old_pmd, _pmd;
-	bool young, write, soft_dirty, pmd_migration = false, uffd_wp = false;
-	bool anon_exclusive = false, dirty = false;
+	bool young, write, soft_dirty, uffd_wp = false;
+	bool anon_exclusive = false, dirty = false, present = false;
 	unsigned long addr;
 	pte_t *pte;
 	int i;
+	swp_entry_t swp_entry;
 
 	VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
 	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
 	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
-	VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd));
+
+	VM_WARN_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd) &&
+			!is_pmd_device_private_entry(*pmd));
 
 	count_vm_event(THP_SPLIT_PMD);
 
@@ -2945,18 +2948,43 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		return __split_huge_zero_page_pmd(vma, haddr, pmd);
 	}
 
-	pmd_migration = is_pmd_migration_entry(*pmd);
-	if (unlikely(pmd_migration)) {
-		swp_entry_t entry;
 
+	present = pmd_present(*pmd);
+	if (unlikely(!present)) {
+		swp_entry = pmd_to_swp_entry(*pmd);
 		old_pmd = *pmd;
-		entry = pmd_to_swp_entry(old_pmd);
-		page = pfn_swap_entry_to_page(entry);
-		write = is_writable_migration_entry(entry);
-		if (PageAnon(page))
-			anon_exclusive = is_readable_exclusive_migration_entry(entry);
-		young = is_migration_entry_young(entry);
-		dirty = is_migration_entry_dirty(entry);
+
+		folio = pfn_swap_entry_folio(swp_entry);
+		VM_WARN_ON(!is_migration_entry(swp_entry) &&
+				!is_device_private_entry(swp_entry));
+		page = pfn_swap_entry_to_page(swp_entry);
+
+		if (is_pmd_migration_entry(old_pmd)) {
+			write = is_writable_migration_entry(swp_entry);
+			if (PageAnon(page))
+				anon_exclusive =
+					is_readable_exclusive_migration_entry(
+								swp_entry);
+			young = is_migration_entry_young(swp_entry);
+			dirty = is_migration_entry_dirty(swp_entry);
+		} else if (is_pmd_device_private_entry(old_pmd)) {
+			write = is_writable_device_private_entry(swp_entry);
+			anon_exclusive = PageAnonExclusive(page);
+			if (freeze && anon_exclusive &&
+			    folio_try_share_anon_rmap_pmd(folio, page))
+				freeze = false;
+			if (!freeze) {
+				rmap_t rmap_flags = RMAP_NONE;
+
+				folio_ref_add(folio, HPAGE_PMD_NR - 1);
+				if (anon_exclusive)
+					rmap_flags |= RMAP_EXCLUSIVE;
+
+				folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
+						 vma, haddr, rmap_flags);
+			}
+		}
+
 		soft_dirty = pmd_swp_soft_dirty(old_pmd);
 		uffd_wp = pmd_swp_uffd_wp(old_pmd);
 	} else {
@@ -3042,30 +3070,49 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	 * Note that NUMA hinting access restrictions are not transferred to
 	 * avoid any possibility of altering permissions across VMAs.
 	 */
-	if (freeze || pmd_migration) {
+	if (freeze || !present) {
 		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
 			pte_t entry;
-			swp_entry_t swp_entry;
-
-			if (write)
-				swp_entry = make_writable_migration_entry(
-							page_to_pfn(page + i));
-			else if (anon_exclusive)
-				swp_entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(page + i));
-			else
-				swp_entry = make_readable_migration_entry(
-							page_to_pfn(page + i));
-			if (young)
-				swp_entry = make_migration_entry_young(swp_entry);
-			if (dirty)
-				swp_entry = make_migration_entry_dirty(swp_entry);
-			entry = swp_entry_to_pte(swp_entry);
-			if (soft_dirty)
-				entry = pte_swp_mksoft_dirty(entry);
-			if (uffd_wp)
-				entry = pte_swp_mkuffd_wp(entry);
-
+			if (freeze || is_migration_entry(swp_entry)) {
+				if (write)
+					swp_entry = make_writable_migration_entry(
+								page_to_pfn(page + i));
+				else if (anon_exclusive)
+					swp_entry = make_readable_exclusive_migration_entry(
+								page_to_pfn(page + i));
+				else
+					swp_entry = make_readable_migration_entry(
+								page_to_pfn(page + i));
+				if (young)
+					swp_entry = make_migration_entry_young(swp_entry);
+				if (dirty)
+					swp_entry = make_migration_entry_dirty(swp_entry);
+				entry = swp_entry_to_pte(swp_entry);
+				if (soft_dirty)
+					entry = pte_swp_mksoft_dirty(entry);
+				if (uffd_wp)
+					entry = pte_swp_mkuffd_wp(entry);
+			} else {
+				/*
+				 * anon_exclusive was already propagated to the relevant
+				 * pages corresponding to the pte entries when freeze
+				 * is false.
+				 */
+				if (write)
+					swp_entry = make_writable_device_private_entry(
+								page_to_pfn(page + i));
+				else
+					swp_entry = make_readable_device_private_entry(
+								page_to_pfn(page + i));
+				/*
+				 * Young and dirty bits are not progated via swp_entry
+				 */
+				entry = swp_entry_to_pte(swp_entry);
+				if (soft_dirty)
+					entry = pte_swp_mksoft_dirty(entry);
+				if (uffd_wp)
+					entry = pte_swp_mkuffd_wp(entry);
+			}
 			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
 			set_pte_at(mm, addr, pte + i, entry);
 		}
@@ -3092,7 +3139,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	}
 	pte_unmap(pte);
 
-	if (!pmd_migration)
+	if (!is_pmd_migration_entry(*pmd))
 		folio_remove_rmap_pmd(folio, page, vma);
 	if (freeze)
 		put_page(page);
@@ -3104,8 +3151,10 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
 			   pmd_t *pmd, bool freeze)
 {
+
 	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
-	if (pmd_trans_huge(*pmd) || is_pmd_migration_entry(*pmd))
+	if (pmd_trans_huge(*pmd) || is_pmd_migration_entry(*pmd) ||
+		is_pmd_device_private_entry(*pmd))
 		__split_huge_pmd_locked(vma, pmd, address, freeze);
 }
 
@@ -3284,6 +3333,9 @@ static void lru_add_split_folio(struct folio *folio, struct folio *new_folio,
 	VM_BUG_ON_FOLIO(folio_test_lru(new_folio), folio);
 	lockdep_assert_held(&lruvec->lru_lock);
 
+	if (folio_is_device_private(folio))
+		return;
+
 	if (list) {
 		/* page reclaim is reclaiming a huge page */
 		VM_WARN_ON(folio_test_lru(folio));
@@ -3904,8 +3956,9 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 	if (nr_shmem_dropped)
 		shmem_uncharge(mapping->host, nr_shmem_dropped);
 
-	if (!ret && is_anon)
+	if (!ret && is_anon && !folio_is_device_private(folio))
 		remap_flags = RMP_USE_SHARED_ZEROPAGE;
+
 	remap_page(folio, 1 << order, remap_flags);
 
 	/*
-- 
2.50.1

