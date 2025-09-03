Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B67B411D4
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 03:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B69A10E85D;
	Wed,  3 Sep 2025 01:20:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="F/WkYn7D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2089.outbound.protection.outlook.com [40.107.212.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC3010E85A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 01:20:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BSXJGAg/QugtURs1S4OKfM1mkPDtGxcJh2tJHm66LEy2XNt/s6rvuDHXMFStIjZL5kdQYNWcx9WmiHd4XSrF4MA3TQKFOb/Nz7tVO+9x2WDM892XdNZrQUXrfyDClhPWTh9SZujbTsI8pz50WmLb6UHrXNrfcbqxUKqTn9BYARPo97iMaT6FPPgPBtqiwIVVi+j8YjT1L3WmmIpk6e4z+EFoQ2HGmPSvmyEO2E8s5rStKTHC41jJ+f2RpQ0f5PKcPGbv+UU64bHEpX+7Cw4CkCDoV/HWukhj1lG0BASnjBWuqF5UHlYTE/ZRzWTLfS0s+GURBjAs3VF6RXFh5RZA1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7Gb8kyHDWG3YTr/2xyERL2yoR14rvhNRW78EViJ0sI=;
 b=HmW/ONcsxJHwSbucijnaFpykou9AGU4TO+bOLZco6S6MfO+SdME0XI9qcGE0Bm+4GlkT2J74UUav13X26JG4H/lKFLPCLUNPCepRzypQMv4d/PuQ4UcXSwwhbFif8LTf2roqGwy7w1r4+qUxP6FczhnHt2mxVxgd9heMmwcuYTCApV7PyUK+COXc0bHh7+RQiLtKgzCje9bhqf9JPKIq9qHuxreUas646jGmoT/+kkMLoxQUoePNWkipDxTdPsp5446Pz3+8tRY3iiiP+TO3VkFiFspiwjs6A9uCM17YpjPmSt8UotpCcS/X9GTwQRrfF7DDFySugoxhVAwKQSE8XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7Gb8kyHDWG3YTr/2xyERL2yoR14rvhNRW78EViJ0sI=;
 b=F/WkYn7Drlu/6gF2sjL3cPbrzrhqtvfOw8arEciyrpA063hPiO2HR43suseChFBSX4eNOEg+n+UGqdoEk6gCe7atJXPbFxba3h2q1ghu5deI0sjgGZloLVP1nDhrAGd2t2PuAWJ+y+h2/e3misouR1grUiB2v/jS9mHOdkLurLpPeg2PTv3+DgAIoRdmimoj7azDOZZVGUZhfV80FXJVuMRNeQ5/+iCLZNVX4e4am89HRbR4AQbVHTqZ3QXyoy+G/r6k9UlGpFkyXOetycM4A3isPMIB0uGoZxihhq5fVoIFFkCdGGRoedu31waOGHJM0fa11a+aK2sXhyJ0RnXzkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by MW4PR12MB6708.namprd12.prod.outlook.com (2603:10b6:303:1ed::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.34; Wed, 3 Sep
 2025 01:20:23 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 01:20:23 +0000
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
Subject: [v4 14/15] selftests/mm/hmm-tests: new throughput tests including THP
Date: Wed,  3 Sep 2025 11:18:59 +1000
Message-ID: <20250903011900.3657435-15-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250903011900.3657435-1-balbirs@nvidia.com>
References: <20250903011900.3657435-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5P282CA0119.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:20b::16) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|MW4PR12MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: 07f970fc-d22c-43aa-f8c5-08ddea880e51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWpKc3JEa1licmp3R092S1djUHZFY3Q0S0JJU284STJZRG14QWFLN2wyNkJk?=
 =?utf-8?B?SkZOaDl1WDZIdDlHRTEzU1pLRUxjUmcrSXkwbmtBRVhQM2NWN1ovNmVVK2Fk?=
 =?utf-8?B?WFM3R0VEZWRmdHhPek1UMGlCNnMwaEZZUDhCQ3k2OTlXWFBoOXV4QysvWmFQ?=
 =?utf-8?B?Wlg1bzB2ZGp0aXNTYlZMMmppcUVVeXdCRUMwNllMeWx2MStnbTFMbUtGYWow?=
 =?utf-8?B?bndvdWNNVVI2MzM4ek9CUDlubHRjaTVVN1ZTTUFMcWs3SHpETWUwaFZOenJG?=
 =?utf-8?B?NkcxZnVPRVFHRlpqSUZRcHU3TXZLTks4STZLRmZYUzBzRjBGT2tIcXVTQXFI?=
 =?utf-8?B?VzUvTUQ1NGE4WmIwRExFTjBHWE9ocTZBYjdMZVhENlNpTkxieHNnSnh4Z1Zk?=
 =?utf-8?B?dk04QUFIRnlidklTbmZORFFvc28rdGtvU3FlK0V0MTJMSVdTUlpjdE8ybXo2?=
 =?utf-8?B?RlVlS3FROUdlbjk2RlIzYUl2Z2lIWTY0cUZsS3BnT0dOTUdVeWdidXZ6MWg1?=
 =?utf-8?B?UnJ4TzhyTUxTbzBUckhMSDNibkhGQXFGMHh3LzNlc3RKQ0o1aHZMM24wMWh1?=
 =?utf-8?B?bjVKeU5XWEZLMnZWL1ZiWmJBc0dudTdXS1hjUUVrb2VrUUlncU5EbEZuUlRj?=
 =?utf-8?B?cVRKMWZlMDlCek9nUWtSdFEzTi9YVXNoSzNhSkdEMWtNNnVPV0RaNE9hS2g0?=
 =?utf-8?B?bHJ0YjBVN0hKdmZyTU9hUkx5OWJmVHFxNDlZRUk0T2RYYURoaUVMcEpyUG04?=
 =?utf-8?B?T2piVTFVTHpsRHFOMDBuN1RpTEZROHF4dEdiSnNrdE80RDNCM0J0Rjdqd0RL?=
 =?utf-8?B?bkE0YW5tMVA1Tm54UkNNc1lUUHZ3MlcwNm9OSjZ4dFBwcnR2cGlIRWdrb2hD?=
 =?utf-8?B?cHFQUXdMc0tIOHlIajBVUEpxcnNZZ2pGSkFkYWhNaWhaWHd1MzZETGk0b2FU?=
 =?utf-8?B?VDlvYW9iS2dhS0pHYjd3Q3dCMjl3eWQxODBROXlNWUdnMDgrenhKaW9YL3p4?=
 =?utf-8?B?NTRaRysxaXRiWnRJd25xeDN4c2J5M09RZ1NjbzRxVDF3VksrYkZuUlF0WlZI?=
 =?utf-8?B?UUlSbFNnZlZXeVJxaEd3MDJ5L1Vza3pBQ3JZRHNubWlCRlRoVzY4MHc0Sm1X?=
 =?utf-8?B?ZFlRaUxhWnlDRG9JMXBwUnkrTHB0ZWJzc3lOaVBPbFI1UkJRVTZ6Q0hrR1lC?=
 =?utf-8?B?cVJHY3pyMHBkdzJib05xd2ZDU2J2SHMyYmkyeXI0dzdlQ21yd1hJWGNFUHUz?=
 =?utf-8?B?blVLK3VRanpxMWx6WDc0ZHN6WVRNVDhaY2NwUjR4T3RjWjIzSDJhdnhsTEc4?=
 =?utf-8?B?R2ErR3pnNklJS3Q0N2Q1d3VlRWUzK0RXMFJ0RkYzUStEbENWZUVwV3lJTERS?=
 =?utf-8?B?ZndDcHNmR2RQSG83dTJ5UGhtZW1VbVJlNzBVL1p2aVdLOUJXUDdJMXJmQTRu?=
 =?utf-8?B?clNwL2RFNGhNYldRZGlHbE5WWGJ0V3cxWjJodUZIQXZBQlNnNGlaU1g3bGQ1?=
 =?utf-8?B?c3Z4ZXBlVm9LLzd5MVgzTmIvcjBVS2xHZlM1V2Z4MFBUM3V0MTA5YXZ5Y3Bu?=
 =?utf-8?B?TC9DN0I4ZDhpcUpTY1VoU3VURXdWU21HWFRoVitWS3JFamQzRUNMQitvNkox?=
 =?utf-8?B?TkhPSkpKNUdXUld5dG43bXdaWUlhczhLOERhakZPR2hVc2xRT0tCRFgvbk1x?=
 =?utf-8?B?a3FNTU5QbmZ6aHo1OFpvWkxUN3UyM3dHTklRdjZydUQ1VTFKbENmc0xkRlg5?=
 =?utf-8?B?MmhPOE0yMlFZU1J2VjZCYWlPQXNCN1NOUUw1UTJpaUtaaGlsQzdCemM1WWZs?=
 =?utf-8?B?ZnVmR1Z3MmVzeFpLWThPNXA4eHAzc0xKb2hySGlGUUVHOWhFOW03UzhXeDZv?=
 =?utf-8?B?RDZoUXl6aWFMRmtVSFlyWTFiazlLTnJ3R0xvKytYWUpRbXVaUUx6bzMzS1Zn?=
 =?utf-8?Q?fUUNKm07NbI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGt5ckkrdGlJdjgvcWhWb0hIMjRsM3ZudGJKVmJHQ0orVTVLVVRET1NFdG1D?=
 =?utf-8?B?SlVXdUR1ZitsSS8xT3B4cS9INGpETm4rZG5mYk13QWFqeW4yOTNEdS82WnpY?=
 =?utf-8?B?U0JvczBCVkRYZDJreEZibVN6TVUvZlRpZjgzMklXRktxQmNEdTc2eGJQdWg4?=
 =?utf-8?B?UmdWWDN2ZlZRM1hseHZHWFlGVjgycXpINWdGM3k3SWtPNUttSDVHSXhwRkV2?=
 =?utf-8?B?dTlnZDROUmxXeG5nUlYxeGpqck9yRjVaUFpiYzRLTFNmNFYvZG9vLzVWdmxB?=
 =?utf-8?B?TXBESElsTjNNdVFENnExdFJCY3dqYXdydGt3SXdBQWIwOWZZTmVYREM1NkpV?=
 =?utf-8?B?MXZFVGpTdWY1K3E0T0Z5cmdHRUtkbm1wcENYaGtWQnAvcStucXBZNUpHNEcw?=
 =?utf-8?B?eVJaTDdHL3dkT0VWWDFWOVlZNTlZL0dKMXUzVjdhdFFsTS9sMGdTY2psclUx?=
 =?utf-8?B?RDhHUmxaRzY0T2gyYkhYQUJ2aUdqMENmeTUwR0ttVFVlOXdIL3J5Nkg3djdo?=
 =?utf-8?B?R2tHWHFqTzU3WjRHUjYrNmFCNXNidnljZHZUZzltNWpyMld5THUzQTlLRGhY?=
 =?utf-8?B?dGx2elorWjVDMm9iSmRBN2Q3Z0JwZ2g1UzEyd0RKUDdHdnkrUmJBYVNLMzM2?=
 =?utf-8?B?Nnp0b1huUTV5bStJelE2TjhzZkRLZkpGTUp3eEhNTmdYNGhQRVgzN0NhVmZB?=
 =?utf-8?B?dFoyRVFvTlh4dnRLa2NlRHE4ek9rcGwxWDlSaG54WWpkUEY1YnFtajZ0K1BN?=
 =?utf-8?B?Z3JIK3BKczRHRWpScXVnMCtqWWhEcVZCcm5XM0UrV0NNSlZtdFlXeTc4eU5L?=
 =?utf-8?B?S0lQVXZjbXZVeEJjTFhwOTFYaXg2aGxRckVkclA0dmVLWlRmZXdDbTdheEJz?=
 =?utf-8?B?bWpzRjcvbjRmM2FyWkNyaXl4NTV4VFdNL0FhL2hBWE5yYzgwOGkrN3RBQnZP?=
 =?utf-8?B?RVVZMFQ4d0FmempoK3dLTi8ySXlJUVdQMURRTFFOYVZ3VERRZFNxSkpzcjdG?=
 =?utf-8?B?Sk5LYkJyWDN3Sll4aFBmdGtjdHlmU1lLTjJtdk85QVNwdFJWSHVnbnpwejRW?=
 =?utf-8?B?eXBueDFkOC90YjNRcHl5ZFdJaDBuNWJuSFdKUkhOa3VkL0hMb0NHdjBNOHZY?=
 =?utf-8?B?T2ozSFRPVm90cXA0K1BleGUyVTh3RFpSNUZ2c01KWkwxVUJ1SHpTeFFWYUtt?=
 =?utf-8?B?VWd1UllvVHlTYVpsL0lGYzZ2QTBGVUh1UzNYRlg4V1A2cDhjRThZVjRNSXFv?=
 =?utf-8?B?VG00Q1hVQXdiektBSE81T3pVcVJodWtSYzBuUURvOCtpS3pzQ1ZjaEl5TVRV?=
 =?utf-8?B?eDdTcGFVbmN0NmNCd1FnZUhFaFZ3K08rdWNJd1dJMGd6SmgyODM5M1VDK2tL?=
 =?utf-8?B?VjNSVSsvaGlWL1FISzVMSERIM2d5NElKYktZRXBiMWNRVTNRZEVJaFBsYmRl?=
 =?utf-8?B?LzUwR3Q4UTlSbURPendyQkJ3STBDS2lVY2RIbWtrRW1IM0laK1RieTEzZlNy?=
 =?utf-8?B?QXZLc3ExT1ZCUnFiYTk1Vm04OEtNbzlEbnhvc0pJaFEyVWxjUGkyK0ZuZVli?=
 =?utf-8?B?dkphVVBaUjdYTjBycThtZkQwbmJLSU5pZGtVbi90eVpmOXR1L1QzMnVoZmcv?=
 =?utf-8?B?dmtnb0l5cW9MNDR4OGtKbm9ySi9FUm14dUxGRCtqUDZJNno4VWxLbjlMVjRh?=
 =?utf-8?B?U0R4ZndwVk42cjFYY1RrejEzd245WHM2ZVllblR1OE9Ob2JpWGR1SWNnc1J5?=
 =?utf-8?B?dEdYaTBkejdJUGhHaEJGNmZzcmhadFdSVU5sbUxQU0JHV2lwSys1MVpQYkZC?=
 =?utf-8?B?dTZUY3lldFgzdzNwekJMUGRmdkJ6SE83eVh4WDR6ejhsTk5ZdFNLWitIRjhT?=
 =?utf-8?B?dVllMGU4RkdNWVZGWCttb3FiK3V4RXRoM0E4SmpPNFo3MyttTUpIOFYyZDZR?=
 =?utf-8?B?TEtwZWNHYnRla1VMM2FIZThCUThwdThTcDNkTmlhbjRSbk9tZ290TmpHM20v?=
 =?utf-8?B?YklEVS9tajVrSlh5RjIyWlRLUzZZelRnZVlVck9zZWhrdEF6cjdjRFd1czdv?=
 =?utf-8?B?WitBdjg4N2UwdklXaXpNMUFleTZmVmtLT0llMEFPUXVXY1o4OXkwaVNHcG5X?=
 =?utf-8?Q?L10iGvCJp4s76uNwcZJ/Pqcbl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f970fc-d22c-43aa-f8c5-08ddea880e51
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 01:20:23.6088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpMkeB/pvepkhU6313C6Pf7P5FCinaluRSc6/tAksx+IbVVhgP/FrXgou4tOK9SnHfK5QpufN0mvIUjsr6lLWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6708
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

Add new benchmark style support to test transfer bandwidth for
zone device memory operations.

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
 tools/testing/selftests/mm/hmm-tests.c | 197 ++++++++++++++++++++++++-
 1 file changed, 196 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index 0e6873ba5845..96d3b994a93d 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -25,6 +25,7 @@
 #include <sys/stat.h>
 #include <sys/mman.h>
 #include <sys/ioctl.h>
+#include <sys/time.h>
 
 
 /*
@@ -209,8 +210,10 @@ static void hmm_buffer_free(struct hmm_buffer *buffer)
 	if (buffer == NULL)
 		return;
 
-	if (buffer->ptr)
+	if (buffer->ptr) {
 		munmap(buffer->ptr, buffer->size);
+		buffer->ptr = NULL;
+	}
 	free(buffer->mirror);
 	free(buffer);
 }
@@ -2658,4 +2661,196 @@ TEST_F(hmm, migrate_anon_huge_zero_err)
 	buffer->ptr = old_ptr;
 	hmm_buffer_free(buffer);
 }
+
+struct benchmark_results {
+	double sys_to_dev_time;
+	double dev_to_sys_time;
+	double throughput_s2d;
+	double throughput_d2s;
+};
+
+static double get_time_ms(void)
+{
+	struct timeval tv;
+
+	gettimeofday(&tv, NULL);
+	return (tv.tv_sec * 1000.0) + (tv.tv_usec / 1000.0);
+}
+
+static inline struct hmm_buffer *hmm_buffer_alloc(unsigned long size)
+{
+	struct hmm_buffer *buffer;
+
+	buffer = malloc(sizeof(*buffer));
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	memset(buffer->mirror, 0xFF, size);
+	return buffer;
+}
+
+static void print_benchmark_results(const char *test_name, size_t buffer_size,
+				     struct benchmark_results *thp,
+				     struct benchmark_results *regular)
+{
+	double s2d_improvement = ((regular->sys_to_dev_time - thp->sys_to_dev_time) /
+				 regular->sys_to_dev_time) * 100.0;
+	double d2s_improvement = ((regular->dev_to_sys_time - thp->dev_to_sys_time) /
+				 regular->dev_to_sys_time) * 100.0;
+	double throughput_s2d_improvement = ((thp->throughput_s2d - regular->throughput_s2d) /
+					    regular->throughput_s2d) * 100.0;
+	double throughput_d2s_improvement = ((thp->throughput_d2s - regular->throughput_d2s) /
+					    regular->throughput_d2s) * 100.0;
+
+	printf("\n=== %s (%.1f MB) ===\n", test_name, buffer_size / (1024.0 * 1024.0));
+	printf("                     | With THP        | Without THP     | Improvement\n");
+	printf("---------------------------------------------------------------------\n");
+	printf("Sys->Dev Migration   | %.3f ms        | %.3f ms        | %.1f%%\n",
+	       thp->sys_to_dev_time, regular->sys_to_dev_time, s2d_improvement);
+	printf("Dev->Sys Migration   | %.3f ms        | %.3f ms        | %.1f%%\n",
+	       thp->dev_to_sys_time, regular->dev_to_sys_time, d2s_improvement);
+	printf("S->D Throughput      | %.2f GB/s      | %.2f GB/s      | %.1f%%\n",
+	       thp->throughput_s2d, regular->throughput_s2d, throughput_s2d_improvement);
+	printf("D->S Throughput      | %.2f GB/s      | %.2f GB/s      | %.1f%%\n",
+	       thp->throughput_d2s, regular->throughput_d2s, throughput_d2s_improvement);
+}
+
+/*
+ * Run a single migration benchmark
+ * fd: file descriptor for hmm device
+ * use_thp: whether to use THP
+ * buffer_size: size of buffer to allocate
+ * iterations: number of iterations
+ * results: where to store results
+ */
+static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_size,
+					   int iterations, struct benchmark_results *results)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages = buffer_size / sysconf(_SC_PAGESIZE);
+	double start, end;
+	double s2d_total = 0, d2s_total = 0;
+	int ret, i;
+	int *ptr;
+
+	buffer = hmm_buffer_alloc(buffer_size);
+
+	/* Map memory */
+	buffer->ptr = mmap(NULL, buffer_size, PROT_READ | PROT_WRITE,
+			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+
+	if (!buffer->ptr)
+		return -1;
+
+	/* Apply THP hint if requested */
+	if (use_thp)
+		ret = madvise(buffer->ptr, buffer_size, MADV_HUGEPAGE);
+	else
+		ret = madvise(buffer->ptr, buffer_size, MADV_NOHUGEPAGE);
+
+	if (ret)
+		return ret;
+
+	/* Initialize memory to make sure pages are allocated */
+	ptr = (int *)buffer->ptr;
+	for (i = 0; i < buffer_size / sizeof(int); i++)
+		ptr[i] = i & 0xFF;
+
+	/* Warmup iteration */
+	ret = hmm_migrate_sys_to_dev(fd, buffer, npages);
+	if (ret)
+		return ret;
+
+	ret = hmm_migrate_dev_to_sys(fd, buffer, npages);
+	if (ret)
+		return ret;
+
+	/* Benchmark iterations */
+	for (i = 0; i < iterations; i++) {
+		/* System to device migration */
+		start = get_time_ms();
+
+		ret = hmm_migrate_sys_to_dev(fd, buffer, npages);
+		if (ret)
+			return ret;
+
+		end = get_time_ms();
+		s2d_total += (end - start);
+
+		/* Device to system migration */
+		start = get_time_ms();
+
+		ret = hmm_migrate_dev_to_sys(fd, buffer, npages);
+		if (ret)
+			return ret;
+
+		end = get_time_ms();
+		d2s_total += (end - start);
+	}
+
+	/* Calculate average times and throughput */
+	results->sys_to_dev_time = s2d_total / iterations;
+	results->dev_to_sys_time = d2s_total / iterations;
+	results->throughput_s2d = (buffer_size / (1024.0 * 1024.0 * 1024.0)) /
+				 (results->sys_to_dev_time / 1000.0);
+	results->throughput_d2s = (buffer_size / (1024.0 * 1024.0 * 1024.0)) /
+				 (results->dev_to_sys_time / 1000.0);
+
+	/* Cleanup */
+	hmm_buffer_free(buffer);
+	return 0;
+}
+
+/*
+ * Benchmark THP migration with different buffer sizes
+ */
+TEST_F_TIMEOUT(hmm, benchmark_thp_migration, 120)
+{
+	struct benchmark_results thp_results, regular_results;
+	size_t thp_size = 2 * 1024 * 1024; /* 2MB - typical THP size */
+	int iterations = 5;
+
+	printf("\nHMM THP Migration Benchmark\n");
+	printf("---------------------------\n");
+	printf("System page size: %ld bytes\n", sysconf(_SC_PAGESIZE));
+
+	/* Test different buffer sizes */
+	size_t test_sizes[] = {
+		thp_size / 4,      /* 512KB - smaller than THP */
+		thp_size / 2,      /* 1MB - half THP */
+		thp_size,          /* 2MB - single THP */
+		thp_size * 2,      /* 4MB - two THPs */
+		thp_size * 4,      /* 8MB - four THPs */
+		thp_size * 8,       /* 16MB - eight THPs */
+		thp_size * 128,       /* 256MB - one twenty eight THPs */
+	};
+
+	static const char *const test_names[] = {
+		"Small Buffer (512KB)",
+		"Half THP Size (1MB)",
+		"Single THP Size (2MB)",
+		"Two THP Size (4MB)",
+		"Four THP Size (8MB)",
+		"Eight THP Size (16MB)",
+		"One twenty eight THP Size (256MB)"
+	};
+
+	int num_tests = ARRAY_SIZE(test_sizes);
+
+	/* Run all tests */
+	for (int i = 0; i < num_tests; i++) {
+		/* Test with THP */
+		ASSERT_EQ(run_migration_benchmark(self->fd, 1, test_sizes[i],
+					iterations, &thp_results), 0);
+
+		/* Test without THP */
+		ASSERT_EQ(run_migration_benchmark(self->fd, 0, test_sizes[i],
+					iterations, &regular_results), 0);
+
+		/* Print results */
+		print_benchmark_results(test_names[i], test_sizes[i],
+					&thp_results, &regular_results);
+	}
+}
 TEST_HARNESS_MAIN
-- 
2.50.1

