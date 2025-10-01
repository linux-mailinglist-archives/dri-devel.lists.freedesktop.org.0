Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97095BAF510
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 08:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBF910E336;
	Wed,  1 Oct 2025 06:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uBKL9XJ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013062.outbound.protection.outlook.com
 [40.107.201.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C51410E2FC
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 06:58:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rpm40GRhpDv8exT8SPwNQEzV9ubCcoTjuCJ6Ki+lhLe78txHyiZ/0ZFumoqZYgsOb4Vs3SOanfVi3kW5A1vBLwE9TtsBGAtEg4MVwad7YDMHxUbkq92uJJ6ignKB5izpqLAmccLClj9Dan+2IDb3zrhWPd6sEWF1BiOVi8+soK/MsfNADctixQCkH9f5t8qW5XjylXeeC99Qlmxm0YVptnIWfiTf2VDyQyUfDP+vQQOROi9qxkjT7Eubgg4sW808rwi4aFofdJPnSmklMRBwn36nVg1TdLo1LNT539r90RwXhLWOFwsFAdVBEt5sHG6HzueC3A/RMOFAiLBmv0SQTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGSmDhVqJHtL/eSfNmUjvSaSPl/EgaRDFf6kOKd4q7o=;
 b=UCf4VUNCad5QbSbIs+3VeNkGtt2SWw+41jXudv16uVoD53OXK4Q9tuJmxw0FkYNfH+gs2lg1M27suLqhnsxajgwAdbz2/0w8lwOwM1zcboEJgSTt4D5+bCJd5S39MZj+YRI1ukEpjPT0bBAr0WcrsRvdeg0s50/oLJ2jc6Z0A9VAyVhoICuteOSdCP1+tDsA1j8BHZrqbC+nKg7+qBljlNpn7/EQz7/pZ6JTECA3osP54eyvEFr3PDg2wh0YS5E2bpVFORKwRYgxlAWvxD6PyDHOMpJjvGjo6fwv38VD6GFVBGjR0KETnMJ6WB+Qpmw6CVEhnBMpR2CdcbIBJqFPxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGSmDhVqJHtL/eSfNmUjvSaSPl/EgaRDFf6kOKd4q7o=;
 b=uBKL9XJ/h1FfoPPJ83Zpuy0/QYwW+dRgYMOjdgSpNoBGlmt6WQMw/t45Dhb5OCUwTO8LD/yuw8n1pVVTPTUcY+IH4dyyiuqeTUGtsh1WAPPCxnswsURu4QkUNioHwSprQXXieE4UrmGlSrCQLhsWmKbF6jD2Y0zkXaGeuiNxNFWvivO87FxoQ/6hEm+mhouBjexQLvYa3SupmoEFSXYpF6J7Rt2goJqLGsDRsKPEQtNuu7iF9x/cjkZQvt5E1f6ZbxIMNysPiKlpZkPtqOm3rwwcGEzzUQ5MYn7fkIPbuWZMoR5SK3Hnsftvl1IRhzw7rNsUGVRmzaJM4pv0qUzg3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by BL1PR12MB5779.namprd12.prod.outlook.com (2603:10b6:208:392::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 06:58:07 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 06:58:07 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Cc: akpm@linux-foundation.org, Balbir Singh <balbirs@nvidia.com>,
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
 Francois Dugast <francois.dugast@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [v7 02/16] mm/zone_device: Rename page_free callback to folio_free
Date: Wed,  1 Oct 2025 16:56:53 +1000
Message-ID: <20251001065707.920170-3-balbirs@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001065707.920170-1-balbirs@nvidia.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR02CA0141.namprd02.prod.outlook.com
 (2603:10b6:5:332::8) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|BL1PR12MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: ab28b348-35cc-44f8-8ec4-08de00b7e04d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHJHTi9tejY3UFRuRXlTcy93enVQQ0laSWF1OXJiRzRVSjRtWHkyWVZLcmxY?=
 =?utf-8?B?bWQrMktXOEVUbWVUbURkdEJTRWgxbitpd0dEbDRocGFjSG8zNEFyd0tVK28x?=
 =?utf-8?B?NHA3VWZKUENMQVFienBvV2l0bTZKSFZ1WUxlOHFzVFYvMmkyMDVqckNuRW44?=
 =?utf-8?B?VXhieFcycmdHNjNzMXVLMHlKalVrNkV6WnBSRHhaeXI3c1JEYTdIQkorUTUw?=
 =?utf-8?B?bkJTZTBnU29BanJScVI4ZUF4NzNlN1ptRGMrUGlUZUFYc2ExTnpaRVgvS0Zz?=
 =?utf-8?B?STU4dm9TWDhwdTNiSGV6b2R0YlV4Y2JteDM4ZlBEVzl4Zk81YmpvWnRuNDZr?=
 =?utf-8?B?eThNcy9tUGdPRCtlTEordk1PRi9WZ3JnTGZCL3pDYmRzTnJSNmZSbXZXUURQ?=
 =?utf-8?B?ZjJwaW16UW00bHFPUHZ5b2pzVU55ZzNXNTZQMjZQeUJINC9ZVWdHY1NjQUtJ?=
 =?utf-8?B?OUc5WGtpMFlRYkQ0ZmJzRXFhS3NEMzZyTC9vakUvSDFzUDZWVzJveE4xUnEv?=
 =?utf-8?B?eHY4dVNHdjl1KzNtSVdJYmlSNWE2eHZHQ0pST21JdDJWdjhNOTNTVlgyRDg4?=
 =?utf-8?B?b0FyWWhVK1FTRTNkQnJNWGEzUkxZcEc2MTg2QlBaeHZQMjV0eVlGNUJFMmRm?=
 =?utf-8?B?SW5PcldtYVkzVy9CYUZWc2g2cEkrd0tjbVFjQWFEbmlzUWNHeTNTcVphY29o?=
 =?utf-8?B?Wmc0aXExT1djV0RrN05ucjJQbG9uSXp4Mis2WUhkbU1sSXdwUWsyNmVUOTlN?=
 =?utf-8?B?VWZqVFpqSDh4QnlDTlUwaEtONUhvcVFWWHllcENpRmZRUmU5ckFpRFZzc3Rz?=
 =?utf-8?B?bGZuN0RGL3puM3A4OWhYSjlDL2tBdUVmT2czb04vQngxdmxoNGNpRmNTekFL?=
 =?utf-8?B?SXFBVUg5MlJPZVcvM0VjU3Y5bWdxUTVhTFRBYzVxVzc3ZjVxaXZ4bzNvWXBP?=
 =?utf-8?B?SXpsUGdBNnpNcmFEQXFUcUdDYUgyN3BBNGdTWEppcUlpV0pXODQ5aVBiL21D?=
 =?utf-8?B?OVRzc0tydVA5Z3lFeVI2Y1o4QWNnKzJSZUs0VENIQ3ZyZzZCbXFGUkl4NXBa?=
 =?utf-8?B?N1FSSStPUm9WU29aSldydTdnUXhnTStvNHdyNllQQXQ0WXc4eDYydVZqamY1?=
 =?utf-8?B?OGpSTXZzdzZUV2J0SUYyd2NRa3U1bXV0WjdKT2dMUUpMcksvd1A0SkM5ZTd0?=
 =?utf-8?B?QTc2YitLRWIyRloyRzkrb24rWmZJWmxCV2c0d1dqL3doYkVmQ05CVG8wZ1gv?=
 =?utf-8?B?cXRadExhOVN4VXNhc0dCLzhZNnVDVnBNV1BLOThTSER6akRZS3lpa1BIeHZ4?=
 =?utf-8?B?UE9oV1hFMk81Z2NTYWtLODBrYUthTCtZN1ZaTVNOQ016VXl3a0RJT0NOd2Zw?=
 =?utf-8?B?L1F0aklwb3JMcXdpT3hXRzJJTHVxRXhuODhjWVF4Ly93QWFWWWJ6Y1dJVzRR?=
 =?utf-8?B?NVJ0QURBWE91ZUFqMGZVOGZSalIrSVJsWWwvTGNuSDZOUm1TYVVMTFBjUFB0?=
 =?utf-8?B?M3BML2IzRG5OUXlTUVdzYnhrTDNpMUpFdjYrTHdMSEEzZGIrR0R2YnVnSzM0?=
 =?utf-8?B?eTg3dFpmN0pyczBSc2hwY0hiSU1sRkhOckhwRzRpK082UEtIWUZIa2p5aldW?=
 =?utf-8?B?citxV3VDN3R5YTdMRy9pWWFpcnRzd2ZXc1N1WHdFRy9tc2xPUm93MUdCNklw?=
 =?utf-8?B?bzdDTytaQ0V0QktTN1QxK0RvL0V3YkVTczlqTWdDU2FZRkYwQ21zVkV2R2hz?=
 =?utf-8?B?akdYMXVYWi9IYm96Z1JWSS9ZczBHVW1JWTFoY0NQRDF4azhJMkdGeUNiMWNO?=
 =?utf-8?B?S3QvclRaY2hUVGUxaVNFZzhNaU9HbWVBaEdIeGhCNFVOUmZ2S2Y1bHNJZzFR?=
 =?utf-8?B?bXhpYUlJNmJQVmpPMDc0bFc1TjdxcVZEeWNvaGV2eUY3QXZWbHV2VThna25T?=
 =?utf-8?Q?F34HKtGeApm6YF11FYwpYf82eabJBI3N?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzZPQ3UxMGdrOGhxZjJFNDFZOEIvSGp1SXF6blh6clg4bENGaFhMU2Q2TTdZ?=
 =?utf-8?B?emVNRlRtenFSTFh4OTNvR1hqbXd2cDJ5YUlreFlRT2lTMkN2ZlJxRFF6OUdp?=
 =?utf-8?B?MzN1RWFGeXZUaG9PaG1QeXhkeWhxNFJ5b0diU0J0WVRTVU9EdUZydGpmNDJT?=
 =?utf-8?B?cndRelg4Uk16YkwwaGc1TFFiMGdBWlVEeUFsRzVRUkF4R0Zwc1dvVEZwWG14?=
 =?utf-8?B?alpxRW9xNThiY0M2aUxBR0pYdG45QzNBOTBHZzZEQTJxejZuK2doVFNUVUVq?=
 =?utf-8?B?dEIvejk2OGF1SEN0dWhkRExIeCtOaEllekZNNDM0Mm5RU3BPZjVPZ1JYV3lT?=
 =?utf-8?B?Q3MwSmFyUkZ3VnQ0clBJY0FPakhmaGFzMUt0SXEvaVNrKzZuSzFlUlA0YWlV?=
 =?utf-8?B?a3VXY2I0UFJIOURjeitJNWVsQlhoS2c0Q3ptNkdiS3ZLdDk2OWdLNCt1UkpW?=
 =?utf-8?B?UllDdytkdU5DcDNUN3gwcFZFajFKS3BlbmdmUzlraEYrMG5qMWx0WitNNVZK?=
 =?utf-8?B?dnFlczJMZ0VoQUg1Z2VRNGNyUWd3SmU1MXBsYk5vb2pvWWU3dUdMdXEzakZI?=
 =?utf-8?B?ZGQrSksyVHNHZ2VLNzBueWhFbjhFK2EraU1DcGtuVzFXTFBvMXJHOHVEY21h?=
 =?utf-8?B?RjVNRXpOOG9hVk83TVZScVQ2VTZBeTFRYW9RMG1sVStWcTNwTDQ1L1NWNGg3?=
 =?utf-8?B?aytsU1kyNnd3aElnR3ZlL2tKQ2FRWXJraEFucXBNbUNPQUpnZEtYaFp6UjZK?=
 =?utf-8?B?bkFMdnViaDBTVWVBWmJ4ODZDVDZmSmQrQ0UrM2ZnTm5iZ1FrOWp6aHIxcmVF?=
 =?utf-8?B?bC9TaGx1RTc2VE9nOXhPWGY0YTJ6eGpqM0lVOFBiVUtGUlIvQXZpTThTbjFj?=
 =?utf-8?B?bHFWQmQyUWZGWUFFNzFXRktXYUZ2REdPM1BmQWU2YmV3cnQ0VU9HTjNvVUVG?=
 =?utf-8?B?VGVpMkJwOGVwWG5pbE1nUGkyZG0xY0FSWG96SHo0UGp3R3ZOenNJa2hrWkRv?=
 =?utf-8?B?ZkpkOUdLVkVkWUlrM2Zwd09KR0RNY3dDUzlQSmNGeFdtMjFrZUVjMEprNUh3?=
 =?utf-8?B?VHI0L3FNdTRiYjNpOWN2d2JOMm5TS2lWUHh4OWFsaXlWU2F5anpFVERrVUdy?=
 =?utf-8?B?MkdqRzRjajgxWldoV3Q3V3BZbTlTRDJPdEt3UU1wVlAweVVJREdsd3FCZkVP?=
 =?utf-8?B?QkErS0IybHJ3eTQ2djJMQjQ3SmdGSzFaVTM5WEN4dm52QXZadDZMVkMvek9q?=
 =?utf-8?B?VjJOUDJ3dU44YTFmejYrdERHbDZPRVdQcWlOZ0FKUGpBckF6WFNMWU8ybEhp?=
 =?utf-8?B?ZlFwNXp2bUtEbFcvVHJzOWgwOUNMbWdzdlY4alNoUEE4Wlhha1lEUjF3MEpK?=
 =?utf-8?B?VzBRa1hUV2ltZWFoME9mcklpN2YyV2J6bGZaSVZUVTBJRVY5d3U5aGJ3eCtY?=
 =?utf-8?B?amZRczNuRWdYN2d2ZTUvTUJmL215dEpIUEQ3dXdaT0dpMzNsSnlUblhOZTRE?=
 =?utf-8?B?aUdBaE0rbDlrWkcrd2N3b0ljcG5ONDJUdjdEZ05OYlJ3WHY4dDh4MGg2bzJO?=
 =?utf-8?B?NGU2OW55RTEwVnF2eWR5NDN1ekJGUDZKeHlFZzRpNXQ2Z3k1c1NGY2VXeFhR?=
 =?utf-8?B?WndTelBQN3B5QjNyMlFNZWF5bkNURk5PWFd1VG8yb1czMGdDQzFDTjRzdDhZ?=
 =?utf-8?B?SlNIcDVrcDdRdVhSZFpFOGNkVTh6bDJZVkRCWEtqYWZPb2o1ZUhEa3JuN0JU?=
 =?utf-8?B?bWVBdHV3Q1lGN0RxbjFEeVRwdnJtbW4zcHBPbDYrN0NuWFF5eUFKeWVvT2RF?=
 =?utf-8?B?RDZHa0VaMXgvVGhJYlB1MXpCdkZSeTV4bHVpVXVZdnZBSzdkbGV1MkF5eU9p?=
 =?utf-8?B?Q0tJYjl2RURLbEk5OUlCLzBLK01ub2w4VFFzakxpK2pCZG12ZUFGVDltSnY4?=
 =?utf-8?B?NkRuczFTdCtzdU1wdnRYUTFCaG5ZaDdJRDVMbTRNQXBxamtjYzI4T2xGOTZ2?=
 =?utf-8?B?UkxTT1VhcTFLMWh1UWVxQkFpQUd4a2Rjb2wyUWhqRXRaNXlEbmExUWUyRThO?=
 =?utf-8?B?Wkt0VVRIdVUrbXg3K1Q2WjZtN2VSS1g5SHZwbC80Tzg5bkhXa0pEdG1PUFN4?=
 =?utf-8?B?MXZ1NHNwUE85OW5lbmdiVXE5S2N5RXV0ajN1Z2FsYUlwMDJmb0lsdG5GUlZH?=
 =?utf-8?B?amc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab28b348-35cc-44f8-8ec4-08de00b7e04d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 06:58:07.7451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /RcQmmpwbf4DOOt6UV9TED/VYNsqGjQE/263B9eC7hn4oA2x2g2qNdCuDjndK4lUj3UnC2Bpub4Y9b7vRkNyPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5779
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

Change page_free to folio_free to make the folio support for
zone device-private more consistent. The PCI P2PDMA callback
has also been updated and changed to folio_free() as a result.

For drivers that do not support folios (yet), the folio is
converted back into page via &folio->page and the page is used
as is, in the current callback implementation.

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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Andrew Morton <akpm@linux-foundation.org>

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 Documentation/mm/memory-model.rst        |  2 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c       |  5 +++--
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  5 +++--
 drivers/gpu/drm/drm_pagemap.c            | 10 +++++-----
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  5 +++--
 drivers/pci/p2pdma.c                     |  5 +++--
 include/linux/memremap.h                 |  6 +++---
 lib/test_hmm.c                           |  5 +++--
 mm/memremap.c                            | 16 ++++++++--------
 9 files changed, 32 insertions(+), 27 deletions(-)

diff --git a/Documentation/mm/memory-model.rst b/Documentation/mm/memory-model.rst
index 5f3eafbbc520..7957122039e8 100644
--- a/Documentation/mm/memory-model.rst
+++ b/Documentation/mm/memory-model.rst
@@ -165,7 +165,7 @@ The users of `ZONE_DEVICE` are:
 * pmem: Map platform persistent memory to be used as a direct-I/O target
   via DAX mappings.
 
-* hmm: Extend `ZONE_DEVICE` with `->page_fault()` and `->page_free()`
+* hmm: Extend `ZONE_DEVICE` with `->page_fault()` and `->folio_free()`
   event callbacks to allow a device-driver to coordinate memory management
   events related to device-memory, typically GPU memory. See
   Documentation/mm/hmm.rst.
diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 91f763410673..e5000bef90f2 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -1014,8 +1014,9 @@ static vm_fault_t kvmppc_uvmem_migrate_to_ram(struct vm_fault *vmf)
  * to a normal PFN during H_SVM_PAGE_OUT.
  * Gets called with kvm->arch.uvmem_lock held.
  */
-static void kvmppc_uvmem_page_free(struct page *page)
+static void kvmppc_uvmem_folio_free(struct folio *folio)
 {
+	struct page *page = &folio->page;
 	unsigned long pfn = page_to_pfn(page) -
 			(kvmppc_uvmem_pgmap.range.start >> PAGE_SHIFT);
 	struct kvmppc_uvmem_page_pvt *pvt;
@@ -1034,7 +1035,7 @@ static void kvmppc_uvmem_page_free(struct page *page)
 }
 
 static const struct dev_pagemap_ops kvmppc_uvmem_ops = {
-	.page_free = kvmppc_uvmem_page_free,
+	.folio_free = kvmppc_uvmem_folio_free,
 	.migrate_to_ram	= kvmppc_uvmem_migrate_to_ram,
 };
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index d0e2cae33035..e5203764287b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -567,8 +567,9 @@ svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc,
 	return r < 0 ? r : 0;
 }
 
-static void svm_migrate_page_free(struct page *page)
+static void svm_migrate_folio_free(struct folio *folio)
 {
+	struct page *page = &folio->page;
 	struct svm_range_bo *svm_bo = page->zone_device_data;
 
 	if (svm_bo) {
@@ -1008,7 +1009,7 @@ static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
 }
 
 static const struct dev_pagemap_ops svm_migrate_pgmap_ops = {
-	.page_free		= svm_migrate_page_free,
+	.folio_free		= svm_migrate_folio_free,
 	.migrate_to_ram		= svm_migrate_to_ram,
 };
 
diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 31c53f724e25..1bd949df2fe8 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -708,15 +708,15 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 }
 
 /**
- * drm_pagemap_page_free() - Put GPU SVM zone device data associated with a page
- * @page: Pointer to the page
+ * drm_pagemap_folio_free() - Put GPU SVM zone device data associated with a folio
+ * @folio: Pointer to the folio
  *
  * This function is a callback used to put the GPU SVM zone device data
  * associated with a page when it is being released.
  */
-static void drm_pagemap_page_free(struct page *page)
+static void drm_pagemap_folio_free(struct folio *folio)
 {
-	drm_pagemap_zdd_put(page->zone_device_data);
+	drm_pagemap_zdd_put(folio->page.zone_device_data);
 }
 
 /**
@@ -744,7 +744,7 @@ static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
 }
 
 static const struct dev_pagemap_ops drm_pagemap_pagemap_ops = {
-	.page_free = drm_pagemap_page_free,
+	.folio_free = drm_pagemap_folio_free,
 	.migrate_to_ram = drm_pagemap_migrate_to_ram,
 };
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 53cc1926b9da..d34288ebe7d2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -108,8 +108,9 @@ unsigned long nouveau_dmem_page_addr(struct page *page)
 	return chunk->bo->offset + off;
 }
 
-static void nouveau_dmem_page_free(struct page *page)
+static void nouveau_dmem_folio_free(struct folio *folio)
 {
+	struct page *page = &folio->page;
 	struct nouveau_dmem_chunk *chunk = nouveau_page_to_chunk(page);
 	struct nouveau_dmem *dmem = chunk->drm->dmem;
 
@@ -220,7 +221,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 }
 
 static const struct dev_pagemap_ops nouveau_dmem_pagemap_ops = {
-	.page_free		= nouveau_dmem_page_free,
+	.folio_free		= nouveau_dmem_folio_free,
 	.migrate_to_ram		= nouveau_dmem_migrate_to_ram,
 };
 
diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index da5657a02007..8515b3bfdfdf 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -200,8 +200,9 @@ static const struct attribute_group p2pmem_group = {
 	.name = "p2pmem",
 };
 
-static void p2pdma_page_free(struct page *page)
+static void p2pdma_folio_free(struct folio *folio)
 {
+	struct page *page = &folio->page;
 	struct pci_p2pdma_pagemap *pgmap = to_p2p_pgmap(page_pgmap(page));
 	/* safe to dereference while a reference is held to the percpu ref */
 	struct pci_p2pdma *p2pdma =
@@ -214,7 +215,7 @@ static void p2pdma_page_free(struct page *page)
 }
 
 static const struct dev_pagemap_ops p2pdma_pgmap_ops = {
-	.page_free = p2pdma_page_free,
+	.folio_free = p2pdma_folio_free,
 };
 
 static void pci_p2pdma_release(void *data)
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index d2487a19cba2..cd28d1666801 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -77,11 +77,11 @@ enum memory_type {
 
 struct dev_pagemap_ops {
 	/*
-	 * Called once the page refcount reaches 0.  The reference count will be
+	 * Called once the folio refcount reaches 0.  The reference count will be
 	 * reset to one by the core code after the method is called to prepare
-	 * for handing out the page again.
+	 * for handing out the folio again.
 	 */
-	void (*page_free)(struct page *page);
+	void (*folio_free)(struct folio *folio);
 
 	/*
 	 * Used for private (un-addressable) device memory only.  Must migrate
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 24d82121cde8..9dbf265d1036 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -1374,8 +1374,9 @@ static const struct file_operations dmirror_fops = {
 	.owner		= THIS_MODULE,
 };
 
-static void dmirror_devmem_free(struct page *page)
+static void dmirror_devmem_free(struct folio *folio)
 {
+	struct page *page = &folio->page;
 	struct page *rpage = BACKING_PAGE(page);
 	struct dmirror_device *mdevice;
 
@@ -1438,7 +1439,7 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 }
 
 static const struct dev_pagemap_ops dmirror_devmem_ops = {
-	.page_free	= dmirror_devmem_free,
+	.folio_free	= dmirror_devmem_free,
 	.migrate_to_ram	= dmirror_devmem_fault,
 };
 
diff --git a/mm/memremap.c b/mm/memremap.c
index e45dfb568710..4c2e0d68eb27 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -289,8 +289,8 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 			WARN(1, "Missing migrate_to_ram method\n");
 			return ERR_PTR(-EINVAL);
 		}
-		if (!pgmap->ops->page_free) {
-			WARN(1, "Missing page_free method\n");
+		if (!pgmap->ops->folio_free) {
+			WARN(1, "Missing folio_free method\n");
 			return ERR_PTR(-EINVAL);
 		}
 		if (!pgmap->owner) {
@@ -299,8 +299,8 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 		}
 		break;
 	case MEMORY_DEVICE_COHERENT:
-		if (!pgmap->ops->page_free) {
-			WARN(1, "Missing page_free method\n");
+		if (!pgmap->ops->folio_free) {
+			WARN(1, "Missing folio_free method\n");
 			return ERR_PTR(-EINVAL);
 		}
 		if (!pgmap->owner) {
@@ -453,9 +453,9 @@ void free_zone_device_folio(struct folio *folio)
 	switch (pgmap->type) {
 	case MEMORY_DEVICE_PRIVATE:
 	case MEMORY_DEVICE_COHERENT:
-		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
+		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->folio_free))
 			break;
-		pgmap->ops->page_free(&folio->page);
+		pgmap->ops->folio_free(folio);
 		percpu_ref_put_many(&folio->pgmap->ref, nr);
 		break;
 
@@ -472,9 +472,9 @@ void free_zone_device_folio(struct folio *folio)
 		break;
 
 	case MEMORY_DEVICE_PCI_P2PDMA:
-		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
+		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->folio_free))
 			break;
-		pgmap->ops->page_free(folio_page(folio, 0));
+		pgmap->ops->folio_free(folio);
 		break;
 	}
 }
-- 
2.51.0

