Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37822B411C5
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 03:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4E910E84D;
	Wed,  3 Sep 2025 01:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="czhfWDPX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F3510E84D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 01:19:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=soMF2A4M1GRhawja3m0D0+bQ5Q0BLY18nRasOY/gnL48+9UUnWmHtt4lIJ7STxGxPmn3Lg98VoXbLK1oq/WUEVzd3TyMxwDYfxFI3Tk5AZCBSMYKgHgZTJC3lpM57/RjJtZpxi/S2j8UJ70PBw521UHoYdDDAOrYxviMP3FdIBzVqwZRc0eLCOoWKbvhrJG0NP8pNP8TKasMmQPHfMJFT6Dr6hw6CYwjHVq4F98sp5npNs0H9PL8x8j7289Wvm9HzDWvyXZIPGMT3QDQe81WkpxP45B87x9MMslk24FX0fTTXq+apXXIlQbtZm5YBjZPrvsGeCxVzTmHtnRFWAzI4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAOFDkuCvdCY/aXlF2lV22TkRXJgxKoHzngwd/6lVqI=;
 b=FKBfNSLoyZRXUhNbbPiO0r44a30VIms5eUJGMnjORmUajYjfDaR62fgZrMVo9B0MDsd+dcRgHyO3qH1+EAZNrCZDsUch0cJPNvZ3aAERZnd42RGWX8QwkaLO58bb/mYcgUErOTkQc60HiX7oDjQItJjICQnMl0sMIcitjkhHEbwwbWdDj3e41CncrES00YvbXKxe8nEnKeENOLY+AqFc+yUqWo1NYlFqL3Z7Ki4Hghrnr4ORd/Wb8U3NbTTGLl2N7yx46Bu25dtdLlpZAiKI8KiGmR4SY06w8VQ0QSlay//i7iNt3u4JP/BPeoXKsrZa/ZqXbRYHLcre3Fxrg/ZEmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAOFDkuCvdCY/aXlF2lV22TkRXJgxKoHzngwd/6lVqI=;
 b=czhfWDPXx7eYN/2eSaeYgii1w3jbGoNO1nFAIJ7Lcg8z98q53P1jgLstGm3+5FsaxrRM2R89sQW8zZgJps7K4X4kRac7D8zJWxa5heow86K2iKKMyPq4x317Qv7KWVMCWPWb8uJh5x96ZRJOrfR9dEqGYLv33wgmMsqT81x5uQgY8V3yM69mLt7oBbQRg9yETCqQJINBOyzHPjoajZitNgDqEUdE+ZcWJ1ba0sr8GRMAuJHIumIUTT+hrf4Ql17GCtbU5EyAV8NR9Reyccey171acaeR1I4oOMdhofzX2mzlRBfZ58T53opu93mYtTVio1Q7rK++MAF7EN71iYFAOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH7PR12MB5950.namprd12.prod.outlook.com (2603:10b6:510:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 01:19:43 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 01:19:43 +0000
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
Subject: [v4 03/15] mm/rmap: extend rmap and migration support device-private
 entries
Date: Wed,  3 Sep 2025 11:18:48 +1000
Message-ID: <20250903011900.3657435-4-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250903011900.3657435-1-balbirs@nvidia.com>
References: <20250903011900.3657435-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5PR01CA0105.ausprd01.prod.outlook.com
 (2603:10c6:10:207::13) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH7PR12MB5950:EE_
X-MS-Office365-Filtering-Correlation-Id: 892f5cf7-8d26-4ab7-b23b-08ddea87f635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkthZXE2c3V6d28xT1AwcllCRnplZ3BjcU4vUnhWU052Wjl6Tzg2cGZUVlI4?=
 =?utf-8?B?Mnkra3FCdDIyVW1SVnIwYlBDeElkMVVCM0xhdVc4RUQ5anQvSG5BU01WU0Zx?=
 =?utf-8?B?V0g3VFlZMU9KbnJiak56SFVIbGROV3JSNHk2SW1BNllWWU8xWVZPWFUwMmht?=
 =?utf-8?B?RDhxcCtwNkZCeVY4enNaSU5CZEtXQm9nbkg2bEZ5OTdXK2FTRmxsVFlPeGV6?=
 =?utf-8?B?di80QU0reGpxVWtmTnFzMWVpOE95dVBUT1pWYjBVaEhMOVM1VmFVYTNIeE1O?=
 =?utf-8?B?MFFsbmdjSnc4QjZjejZpU1hvQjEwaGM5SkVEbEV6U2FYek5uNlowQjNoLzEy?=
 =?utf-8?B?a1cyL3k4U3RPd1RmNmU3RW1wd0c2akZhOEFQZ2x0TnZEejJnbDJrM0NnZ0dS?=
 =?utf-8?B?S0ZjYlZNcHlqb1RJMUZMd2NrN1FRR3lTV2pNMUNqOHRDSW5Zc3hCYWg3Z0NR?=
 =?utf-8?B?TFdpUXhuTkUvM1N2a1kwazA1cDlTbWdaU1lnUjVLY0FYVjkrQW9nOFlvVEVz?=
 =?utf-8?B?T0FMZlJCa3N5eE5SZVhCdStZRVV0anlCTjNiZ0VnNlNNOTgrcjUyMkFzbVRD?=
 =?utf-8?B?VWs5Ty9oNUpPWkYyLzAzTnIzR3FIL3QxeDNqUmo5MVV4TVZoWDArT01OZGQ4?=
 =?utf-8?B?VGNkT1d6aHJKTTdqby9tS0hMU1FPL0xERzVFaEpPYkhuTzRmdlI5TGplN0pZ?=
 =?utf-8?B?Y3BTZktqelQrZkp5dHpIcllPdmtrQUFYdzdJNXVleUs3dkQzMDBWZGQ0eDJ0?=
 =?utf-8?B?LzJiQ1BMcFRHWVVnbk5nVGJGWG1qTlVpQkp2VlZSNFlyNCtEdmU3OFFBZjlI?=
 =?utf-8?B?OWw1Z1diS3IvUnZEamJnS0hhSHdpOE0yRzNVR25uUDlRalFkOWkvZmlZRlU2?=
 =?utf-8?B?YlNlQjViZ2Ewa2owR2crVFlncS84OWRmMS9kZ1dJTlpZeFJTYXZIcVhMbnFG?=
 =?utf-8?B?OCtIVURkeHU1V2lhVW16YzRHK0VKa3FWWnZpd09zOTQ4TVVKTmxiakZBSTU0?=
 =?utf-8?B?MFRtOTVieHhXMHBDczhSbVR3RDhhZFoyNG9aVUFsY005RU1YRklReng0dU5W?=
 =?utf-8?B?OVBOYTZDSkp6ZGVMWEdvYkNqQjhHMVAwUGpVM1djK0UvSWtEMDR3MWVHVXpZ?=
 =?utf-8?B?R0M3a1hjUjNmMkRtQW81dXdDVlcyYUhucVh2aWp2WFFxSWVDcEZZQ1grc2R3?=
 =?utf-8?B?eWpyWlJ2L3E3T2dualgrdXVYRSt5RkdPaE82SHlIN1RCcDM0OFAvOC8ybTJU?=
 =?utf-8?B?cUZ1OFE5SHo4OENnV0R3RmZVS0kyczIxN3JvbjBQQW0yUXg4ZUZ0Zys5NHN2?=
 =?utf-8?B?OEpHZGVsbHp3SXF3ZW13MWd6b0NYVHdockFhWFlpRkI3Z3pEMlJ5bmhLRHd0?=
 =?utf-8?B?U1RMbVA5cndERUd6RXZaODErODRFUFpVcFVKT1duZWp6NVdlT3VZL0IxQzdz?=
 =?utf-8?B?VWJVamNDeEV6TWd6b3NMMTZhUFBpbzRuWnlNRnRxS011U1FuQmlMUlNzZDN4?=
 =?utf-8?B?ekE2cGpubVVQK2FMS1l0cGt6M1NtK3FzYmFJR2NHeEoxeSs1M0l1SzJWekxV?=
 =?utf-8?B?STgxL2xTY0FXN0RFZ3ZiRnVOSWU4MmNrSG5PRG05NHhFT0o2M1ltWnlDb01r?=
 =?utf-8?B?OUoxcURrSG9CT1BUeWx0MC81TDVkQ0FjK09vclpWSWdKTXRqZldVQ1lkVkk2?=
 =?utf-8?B?V3dwOHEzaDJVOU5ES2pCY0RSbEpBOThBam9IUkFPbW82SUdjNkgvS3ZIc0t1?=
 =?utf-8?B?cU1vc0puTFJlUXZHdUdLVERSdEhQR2FLOThBWTdKZi9taWx0NExRdy95Qm10?=
 =?utf-8?B?cFc4VGNzQk5pS3p0S1I2S1dkdVJrZXZobE5wVDZnajFOSDRBaStzTm1FZ2xS?=
 =?utf-8?B?SURlOFhPL2s0U3NBREhQQTZRTnJpTkRyQVY4anllU2lsQ2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEpzaXBEbFdoUyttZ3hGeDRWbkNwY3Npam1Rb0NXQ0ZIclFFU3c1TDlHL3FX?=
 =?utf-8?B?Y2JLTXkvUEF0djErV0ZEWTQ0ODhqUmtsczY0Nk4xaFJoRHI3WGlzT2p0dGp1?=
 =?utf-8?B?RituNzNieE9MYTByaHM2MEh6dVc1YUFLVkRGZk9aS0xGd01YWlhIWUc2cUZ6?=
 =?utf-8?B?RU1qTXZiOGNDdmFidDU0VCt6VVUrRmdxSkxERmsydXBVVEdjR0QvNEQwYUJr?=
 =?utf-8?B?eVF2eExKQ3pxb2ZnK2lya1VERDQ5NzNwZGsrRk51YTJpZWhXaHBBUCtCTlp4?=
 =?utf-8?B?YmllbWhnWWZnNmxsanVpRmhiVkFnbSs2MWM4ZDNjK29hUWtVWXFoUUM2TnR4?=
 =?utf-8?B?cEFGVForQ25JNUxBRkhENEgra3VTY003RWw1amhqa2dVanJwOTdWN1Vabnd4?=
 =?utf-8?B?Mk93enhpc1FXODZ0b01RZWM3V0NSL1hzb3NKdUN1a3hxWkorSnlFUzdvUmR5?=
 =?utf-8?B?TjczOE8wS1pIQmpJaXdnd25CVkhpUzkzakJ1cFpBRkJZRS8zNldoVklWMjA5?=
 =?utf-8?B?MzBLYldkakVpajhSSzZXV1R4dDRUM1JaQlg5SEp5c3hPNXl6MVU1dTlZbXZD?=
 =?utf-8?B?eWRNb1JiOUFSZmRCNnBjSDRaTC82N0prR0hmV3c4M3hvUzN4ZHJTOXVlRTFP?=
 =?utf-8?B?SyttbTUzM1A2MTIxdytQNW1WSjFVWjVBdGhCYW1WUHRDc0MzQUZocjlyNDZW?=
 =?utf-8?B?dVVjbm45WXU5QWg2Y2RXakdyblRTcnpMbHRnZWxUVjl4TVJ0OVhjSGt2VFdP?=
 =?utf-8?B?S1VSOGFUa01wWk5qdjg4UlRHeUNBdUU3eEt5VFVIRHNETXU2NnJYVk8va2Qx?=
 =?utf-8?B?NitVclVuKzlJRTZwY2FpZjNjZjRLemZaRXVIODZabUVNK05OL0FEQ3NuTjQ5?=
 =?utf-8?B?TmtKemZ5T3lwdWQ2WHlYR3ZZd1RZVHBSZitzdVJsQVVMNVlZWmsyWWpEZXlE?=
 =?utf-8?B?MXdxVktMOG85L09wRUZOSUZTZW0wRkwxdENRU2pjYjNBYndZVm5meWw0QmJl?=
 =?utf-8?B?VExHd0pEYTJLTEFhUXBJMWRZYkc5YlR0bmo3Z2F4Y0Y0TzBaSURmZnVaVFdv?=
 =?utf-8?B?SWNaUUlMWmlBL1prMlMxd1dVRUJFeHowSlJQK2tua0IxRG5VWkhEWjZqS3ph?=
 =?utf-8?B?RWlXRFBobGtrV2crWTlkOFUvZzhTWjh2cXFhbmp4U3JjMlFqK0kzUWlWb1Zw?=
 =?utf-8?B?VStHdW9HdjhWSzFnakNld3o4Z0plSDV4WkFYb29vUHh3Z2tsT2d5M1U2UVVk?=
 =?utf-8?B?MlFWR3c0dnp6ckJsUVN3Rklacmk4T1hyZmhHWWZjM1lsZjEyZ1pSTnB6ZWpZ?=
 =?utf-8?B?ZGNiVW5EV0NsUENWK2h1eGxEUVRIUXRhM1JrMW9YbGd1VzUyRGtSNDBtK1U5?=
 =?utf-8?B?TlhkZ1Z4RkM0T0pLMmRMY045cklZZ2pSU2REclpxaVZHRXQrV29IS0hyNzIv?=
 =?utf-8?B?cFFHUHdlQ1loOFljTEgwUGZGTEsvZ0tyakkrN3N1NzRKNXN3d2FMV0MvZENP?=
 =?utf-8?B?eW9BUXdkMWlTS01ueUxGcWNCQVFzVE1KMVFjbTZKWDNtQXdBeVZvRlJoM285?=
 =?utf-8?B?ZEJHaFFkQzFVZDBGWTI3aEJyTEZ6NFI3Q3Q3TFVNVWhkL2hwbEtFTUhZV0E4?=
 =?utf-8?B?UTJCNGxaai9qdGo0TGl0WGpDcENFa1FlMnU4ejRKcXRoN0tZS2JBQnA4aTJ6?=
 =?utf-8?B?LzBYOE1zK2hLa3dVY2h5eUg2VUhvUmdBWmhqUnorMFpYU2k5UjFNSmR2a2M0?=
 =?utf-8?B?QjB4UVYwUWdpYlpmVFR5Sk1tR1J3Rk5NOWxvVUgwSExnaTNta1FIbEg0ZnZO?=
 =?utf-8?B?R05MN2lMQlhjTm1CMHdHSXNYcnBHNkpoYU9Dek4wbzlIbWRLUzhIYjV3bDA3?=
 =?utf-8?B?enJHNVBjZmRmc3NZMVNvTnBUMVc1TUVvazBPRGQ5RElIOTdJY2VVWE5EQlUz?=
 =?utf-8?B?ZWxUaDYxVGI5WWRjZlRqWFlDTzF1THk5b3pqRWtLaHZHOUQ0TCt1dmpMV3Vm?=
 =?utf-8?B?cDZ5U2JFcG9qZ0d5L29yR3hWU3FwbmVFMCtZSEk0ZzMwckdvaFdBZWxWRnEy?=
 =?utf-8?B?S0Nmb0hZcEd0MXpUVXgzUUJoS1AvUWdRaDAxUXRxZyszd2w0T0dncGJNTXZI?=
 =?utf-8?Q?ThOhUFceBal1tjqmI7DnndW3k?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 892f5cf7-8d26-4ab7-b23b-08ddea87f635
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 01:19:43.1691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82BiE+4e2p7NReyefYtFZgxuhU7JYtqmVjKDYXdGP1IYwEvIMdYqiJyrj2/UWEGQOfHP/WpNoDe1OniVJpo4Qg==
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

Add device-private THP support to reverse mapping infrastructure,
enabling proper handling during migration and walk operations.

The key changes are:
- add_migration_pmd()/remove_migration_pmd(): Handle device-private
  entries during folio migration and splitting
- page_vma_mapped_walk(): Recognize device-private THP entries during
  VMA traversal operations

This change supports folio splitting and migration operations on
device-private entries.

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
 mm/damon/ops-common.c | 20 +++++++++++++++++---
 mm/huge_memory.c      | 16 +++++++++++++++-
 mm/page_idle.c        |  5 +++--
 mm/page_vma_mapped.c  | 12 ++++++++++--
 mm/rmap.c             | 19 ++++++++++++++++---
 5 files changed, 61 insertions(+), 11 deletions(-)

diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
index 99321ff5cb92..14ec6591074f 100644
--- a/mm/damon/ops-common.c
+++ b/mm/damon/ops-common.c
@@ -75,12 +75,24 @@ void damon_ptep_mkold(pte_t *pte, struct vm_area_struct *vma, unsigned long addr
 void damon_pmdp_mkold(pmd_t *pmd, struct vm_area_struct *vma, unsigned long addr)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	struct folio *folio = damon_get_folio(pmd_pfn(pmdp_get(pmd)));
+	pmd_t pmdval = pmdp_get(pmd);
+	struct folio *folio;
+	bool young = false;
+	unsigned long pfn;
+
+	if (likely(pmd_present(pmdval)))
+		pfn = pmd_pfn(pmdval);
+	else
+		pfn = swp_offset_pfn(pmd_to_swp_entry(pmdval));
 
+	folio = damon_get_folio(pfn);
 	if (!folio)
 		return;
 
-	if (pmdp_clear_young_notify(vma, addr, pmd))
+	if (likely(pmd_present(pmdval)))
+		young |= pmdp_clear_young_notify(vma, addr, pmd);
+	young |= mmu_notifier_clear_young(vma->vm_mm, addr, addr + PAGE_SIZE);
+	if (young)
 		folio_set_young(folio);
 
 	folio_set_idle(folio);
@@ -203,7 +215,9 @@ static bool damon_folio_young_one(struct folio *folio,
 				mmu_notifier_test_young(vma->vm_mm, addr);
 		} else {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-			*accessed = pmd_young(pmdp_get(pvmw.pmd)) ||
+			pmd_t pmd = pmdp_get(pvmw.pmd);
+
+			*accessed = (pmd_present(pmd) && pmd_young(pmd)) ||
 				!folio_test_idle(folio) ||
 				mmu_notifier_test_young(vma->vm_mm, addr);
 #else
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 4acdedf84fe6..0c811d34f418 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -4649,7 +4649,10 @@ int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
 		return 0;
 
 	flush_cache_range(vma, address, address + HPAGE_PMD_SIZE);
-	pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
+	if (unlikely(!pmd_present(*pvmw->pmd)))
+		pmdval = pmdp_huge_get_and_clear(vma->vm_mm, address, pvmw->pmd);
+	else
+		pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
 
 	/* See folio_try_share_anon_rmap_pmd(): invalidate PMD first. */
 	anon_exclusive = folio_test_anon(folio) && PageAnonExclusive(page);
@@ -4699,6 +4702,17 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
 	entry = pmd_to_swp_entry(*pvmw->pmd);
 	folio_get(folio);
 	pmde = folio_mk_pmd(folio, READ_ONCE(vma->vm_page_prot));
+
+	if (folio_is_device_private(folio)) {
+		if (pmd_write(pmde))
+			entry = make_writable_device_private_entry(
+							page_to_pfn(new));
+		else
+			entry = make_readable_device_private_entry(
+							page_to_pfn(new));
+		pmde = swp_entry_to_pmd(entry);
+	}
+
 	if (pmd_swp_soft_dirty(*pvmw->pmd))
 		pmde = pmd_mksoft_dirty(pmde);
 	if (is_writable_migration_entry(entry))
diff --git a/mm/page_idle.c b/mm/page_idle.c
index a82b340dc204..9030c31800ce 100644
--- a/mm/page_idle.c
+++ b/mm/page_idle.c
@@ -71,8 +71,9 @@ static bool page_idle_clear_pte_refs_one(struct folio *folio,
 				referenced |= ptep_test_and_clear_young(vma, addr, pvmw.pte);
 			referenced |= mmu_notifier_clear_young(vma->vm_mm, addr, addr + PAGE_SIZE);
 		} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
-			if (pmdp_clear_young_notify(vma, addr, pvmw.pmd))
-				referenced = true;
+			if (likely(pmd_present(pmdp_get(pvmw.pmd))))
+				referenced |= pmdp_clear_young_notify(vma, addr, pvmw.pmd);
+			referenced |= mmu_notifier_clear_young(vma->vm_mm, addr, addr + PAGE_SIZE);
 		} else {
 			/* unexpected pmd-mapped page? */
 			WARN_ON_ONCE(1);
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index e981a1a292d2..7ab46a2b4e15 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -250,12 +250,11 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 			pvmw->ptl = pmd_lock(mm, pvmw->pmd);
 			pmde = *pvmw->pmd;
 			if (!pmd_present(pmde)) {
-				swp_entry_t entry;
+				swp_entry_t entry = pmd_to_swp_entry(pmde);
 
 				if (!thp_migration_supported() ||
 				    !(pvmw->flags & PVMW_MIGRATION))
 					return not_found(pvmw);
-				entry = pmd_to_swp_entry(pmde);
 				if (!is_migration_entry(entry) ||
 				    !check_pmd(swp_offset_pfn(entry), pvmw))
 					return not_found(pvmw);
@@ -277,6 +276,15 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 			 * cannot return prematurely, while zap_huge_pmd() has
 			 * cleared *pmd but not decremented compound_mapcount().
 			 */
+			swp_entry_t entry;
+
+			entry = pmd_to_swp_entry(pmde);
+
+			if (is_device_private_entry(entry)) {
+				pvmw->ptl = pmd_lock(mm, pvmw->pmd);
+				return true;
+			}
+
 			if ((pvmw->flags & PVMW_SYNC) &&
 			    thp_vma_suitable_order(vma, pvmw->address,
 						   PMD_ORDER) &&
diff --git a/mm/rmap.c b/mm/rmap.c
index b5837075b6e0..196a542f983c 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1064,8 +1064,10 @@ static int page_vma_mkclean_one(struct page_vma_mapped_walk *pvmw)
 		} else {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 			pmd_t *pmd = pvmw->pmd;
-			pmd_t entry;
+			pmd_t entry = pmdp_get(pmd);
 
+			if (!pmd_present(entry))
+				continue;
 			if (!pmd_dirty(*pmd) && !pmd_write(*pmd))
 				continue;
 
@@ -2330,6 +2332,11 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 	while (page_vma_mapped_walk(&pvmw)) {
 		/* PMD-mapped THP migration entry */
 		if (!pvmw.pte) {
+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
+			unsigned long pfn;
+			pmd_t pmdval;
+#endif
+
 			if (flags & TTU_SPLIT_HUGE_PMD) {
 				split_huge_pmd_locked(vma, pvmw.address,
 						      pvmw.pmd, true);
@@ -2338,8 +2345,14 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 				break;
 			}
 #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
-			subpage = folio_page(folio,
-				pmd_pfn(*pvmw.pmd) - folio_pfn(folio));
+			pmdval = pmdp_get(pvmw.pmd);
+			if (likely(pmd_present(pmdval)))
+				pfn = pmd_pfn(pmdval);
+			else
+				pfn = swp_offset_pfn(pmd_to_swp_entry(pmdval));
+
+			subpage = folio_page(folio, pfn - folio_pfn(folio));
+
 			VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
 					!folio_test_pmd_mappable(folio), folio);
 
-- 
2.50.1

