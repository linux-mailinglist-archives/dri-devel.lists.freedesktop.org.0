Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D53BFB2723D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 00:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BAF410E11D;
	Thu, 14 Aug 2025 22:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sKpJki5v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98EBA10E11D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 22:51:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjdzZzQoOWLFwkEe+a9SfTD1c7a5cPRhJ5qqzZLruD5hj4AyAlunSrA5aadtRgRPQ1Y9SpDXiPWz5mDqa7r79u5aFS/d23PQgY1n+1dhRRq6WJComIsvjz2sbHgWaIyikCPXbKgg/hQgsfP7Ec06DTTaTuCzDquk5Qv1MkSNutuXDhpTsJH/wFSHugCEpUpwwwclEqELCNYXipGH1pTpYvL3fDzhRYOlQLoaB3om+/bHWQlS9Ol3N1izRLzkoe1ms/T7l26eiEeBQ+LRO+z6iR2EnO62IROgu4d3M0ljPPU4TUbZcx2BxG1SfWIgtHuiUJQ8vWxbKwTWr7xl9bmexw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QBj5ZLYhNLBYmLDrv/WL62PNOjHjBbabhI8M0xQbhU=;
 b=G2sIBm8tJCz12kuD30ctEL2Iic4iFLPDvxadE7q3hAwsXb8i2OX8Jo7a9wUEeRBW9PAihOFEbHAgittWUhLHWD7DdA+vER3XTei5cyxjzn7yf0r2vB4o+N0GOhRmAWK+4BJM6wmJ4fUmidDREz/YO15n9MPIVdRLAcTgGimWmTD2H94jGPuc9WTqk4CUBzDWKNIiS3QQUMDuhGsoP+p+2mMLUPOV6wA9nSn7O5yXe+HJyf34SS6fqN6yXRLIiC/jatbOvA/TrEAYtTItjUetSM8sLvQ9wMStNK+M3ue8hu8qezEYXLy6YZi39B5My3z7X4jPIY2MxU/FufNtMX+pvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QBj5ZLYhNLBYmLDrv/WL62PNOjHjBbabhI8M0xQbhU=;
 b=sKpJki5v9OhfiEqaFHjQ1Ts3VyWAFiW4UCNun+lL+VwtMgT7mBcO7/HunGouRbn8L3sv+TMxmhJUHDa6uQRlo4y/9PaUYBpZbEhfbvhBWi9MIAm//uAq+XlY6aeMkEObBJD5nQQBDXFtzHbD6hmFmEeTDMOHC3lSv5FgBWy4H2kHk5vw/vMF8lpl/lL5wDvg9dA3IW92WAMy3/h8yVIF2EgSTGx5yjG3sgspqpKV/2c56i6jT8DOSQ+gw1j2N9n1hWng9hTGUgRvUhw6i6ARG4KEnbOL7mmc2QQ/HjcjJkyuRV8RDNj/pmmW7zdmKvsMj2/BtO4fjL3JDJIE0GfD3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by LV8PR12MB9450.namprd12.prod.outlook.com (2603:10b6:408:202::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Thu, 14 Aug
 2025 22:51:29 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%5]) with mapi id 15.20.9031.012; Thu, 14 Aug 2025
 22:51:29 +0000
Message-ID: <a8732499-161b-47f3-a936-580a43c6f323@nvidia.com>
Date: Fri, 15 Aug 2025 08:51:21 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 03/11] mm/migrate_device: THP migration of zone device pages
To: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
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
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250812024036.690064-1-balbirs@nvidia.com>
 <20250812024036.690064-4-balbirs@nvidia.com>
 <81ca37d5-b1ff-46de-8dcc-b222af350c77@redhat.com>
 <9207451b-ebd1-46d5-b277-2adf3028f361@nvidia.com>
 <23a3e9b9-ad35-4469-884d-279aac0868de@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <23a3e9b9-ad35-4469-884d-279aac0868de@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::16) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|LV8PR12MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: 581309ea-5c9c-4f82-267b-08dddb851b31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFphYktJbDZwWnhxQmhmT3BjdWxjcWNCT2wwNm5ZNXBnVWhXMDFCcCtQR0t5?=
 =?utf-8?B?Nk5jNEpveURXUmZzd0xkRGFHcTdURlVaSjhhTUhhQTEzSUVYOEF3YStIL1Mv?=
 =?utf-8?B?L2JkY2NvMlBUK29zUERFZCtnMTVsQVBydlRpN0JIYmFHaERXcy9hOUN2eHZV?=
 =?utf-8?B?RzNRUVNkZ1A5eXlETkV3ZklvWFRRMDh6WGhPN2RvV2IvbTdod1BaNG5VaTdO?=
 =?utf-8?B?K0xxMkZ0WWJMcjQ5dEZ1S0tjbmd3aW53am9sRXVHTTBHVytMRkI2M0dERWZq?=
 =?utf-8?B?SDNWQXlKbUIyMjRJc0k1aXcrMEpWSkV1VG1YeFJNVnRxSGtBSG5NaTd2QURZ?=
 =?utf-8?B?Qk1LNVpBT1VocytZazBVdExMcUk5WVB0MWlXVnpSMEFtZE5jTTd0Tk9FTDBl?=
 =?utf-8?B?YUZoMlFDZ0NWZ3VWamwrOCtrNnBEL1h0cWNiZklRNU4rR1QrNFZjOC95bE1y?=
 =?utf-8?B?ZWdsRFVkd3c3YmYvTXllbWthNVBTTGtIdklzSE5QRlJXM1FNYUZGREN5Rnpq?=
 =?utf-8?B?aVBmWVBYT2ZLdjdQcU42V3FOQXBTVFdZUHAzNXZ1T2xLRExDd0kwNFJSQTVX?=
 =?utf-8?B?YkxlSTk3OHZGQ3RhUVZsM1dDaWszbk9KTEhpVjRZbHhEdVpudFc1VWUvRDN5?=
 =?utf-8?B?Nk9CR3R6NlEwZFpwRUZyMHVaZVdCUlZCQ1VPTC9yTEt0Nmx1RVRBRGxWV3FM?=
 =?utf-8?B?eS84VFhMT0ZXQjlTQVJ3RDlQTzFxNUJ3a1lIRFNIZGhSUitHckowNnBWaHNC?=
 =?utf-8?B?WjljQXptcmFNR0wwWHVHMDF3Y2h4VCtLUDBadUV2WXZhaTU1dUZrVmNUWWxJ?=
 =?utf-8?B?alJ2c2NJTnJoUitndGRkbm9Sb3A0TXFUT0MydURSMWdoMUwvOFp1OE9oRHVq?=
 =?utf-8?B?a2FGUkdOQ0JFQjVqU2xzQzZKZFNOdlphVnZnVnpSQW94VGRsTlhJQTAya2tt?=
 =?utf-8?B?K0tkR2diN3ZkNUQ5RXFqSzkwaE1kVUlQZnBkL2d5SVE5UGNaM2hhb00zZDZH?=
 =?utf-8?B?NmJYclVUelc2WGhYZm96L0locHcxNFhnNWRmVTFhNUppOStDWVlIMG40czBu?=
 =?utf-8?B?MEpKa1ZPSEF3ZzlmNSsxVUN3YU9HbUtVWTVWdUdoTEIzS3NkZkQ3bE5iK3Vr?=
 =?utf-8?B?L25oNStlcTRaa2gyMFVBaXhpbjhTWlBnelhPVDNTTEIvSW0xZDUwbWlYemRx?=
 =?utf-8?B?ZGU4NWJGeER1eUxlT0VoRHoyMDlwOU4xNENDOEgrVjFvZjU3RFc5cmIwaWpS?=
 =?utf-8?B?ZE1jS3orVi9lYUN0YWlyN3MzUmp0RVZ0cTRXbklzZ1ZTZXFqRnVxWjk2OHlO?=
 =?utf-8?B?bUpVOVhQTFk2Q3phV29oWXczODc1eWNBRDJRVVNoL2JFQjI1NU03V1ZNdGsz?=
 =?utf-8?B?Q09OeFJ5UVNQM0IxYkxldEozREo1TEFvWjJuWG41VVZmd1dEUjN1WUVHR0Y2?=
 =?utf-8?B?VkpoRHN2TURFcmZ2dzQ1aUJlRHFCMmtVUWswaW1GbTBhaUEwa1pFaHgyNUNM?=
 =?utf-8?B?KzRWWk1TY3NTNm1wOHkvS1JtU3JoekdPYUR6RE01RzkxVWs2TnBrUnFLTmty?=
 =?utf-8?B?VTF3VS84TlFYemZwVWF1eGkzVjA3WmsvdXB0a2JBY2ZLRXloTjVrNTd1TW10?=
 =?utf-8?B?VmVyT2dLK0wxWVl2N0FvY1UzOUZmK1FjelN0ZlFuMFM3UDB1aEd3MWc1MWJh?=
 =?utf-8?B?L1Qrd1IwVlJDbGZCMXRuUzVzR1I0bXg2eTdXS3JoZmxhTEdmOGxaM01VS0d6?=
 =?utf-8?B?cDB5UmJmMnFocE9IT1pSVENwcTJmRkJWWkZtTkhDdW5YUFVSYU4vS2xqMzd1?=
 =?utf-8?B?bnlrU21WMUxCaUV2SCtiUXRZcWFPWTQxTW1PWkN4R0NzMGJWODU2ajcvM2Rs?=
 =?utf-8?B?T0xMbW1wZTRmNksrRnZQaklndkFjWHR6TUU0TitFQkloeUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXVFSHVlYkFHZThQbWlOSU4vRi9FMHJ0RFVGWU9UYStIZHlrTmhEbHRnRm9i?=
 =?utf-8?B?RTllQnZuYXNxKzdQeDM2Y3hRM2Y0aWUyVkYvRTNRT0JJMGdEWVVrT1p0WGlZ?=
 =?utf-8?B?NFFIclRGbGs2VGpTV0JINFk1QVFwRkVOM1kzbnRCVmtDYU9hak9KZWd0OFl4?=
 =?utf-8?B?UjVXWGNMMEFMcEtGWHJVS1kyVUdpOE1GVmR0cXhIcXozVFEyb1FwOW1jNkxQ?=
 =?utf-8?B?OHdnWEIxelhnQjh2L1pObGs1K3g2Z0N2NGZPUzJFRjZMS0JEdlpaOTgzcWJZ?=
 =?utf-8?B?RXluMnFWSTlRL1BUQUF4d2NWNU1McFEyVXZjTEliS2d3WFYxRWRPSDZSSncy?=
 =?utf-8?B?NXJ3S1lNZG9YSlpYZzFWeWl1a0hrbHpXZmRQbFNEbHZOZkFENjR4ZkdYQ0VU?=
 =?utf-8?B?dE5TTHMzUzFvdUs0QUx1bzZseExaOHkyYmpXaVVNazBqZ2pkVlVuQUNtMi9t?=
 =?utf-8?B?L2tCTlpCbUNPS1BQaTV5UnRmdlg3SUNtOUVBcmFEYk1YazdtRjFoLzlYR1JN?=
 =?utf-8?B?NGd0UTJLeVIwNHdPQkpOYUtBenhqWXRjeDhPRm9McnBTMFo2dzRCQUYyRVFa?=
 =?utf-8?B?a1gxOWY2b3grSFNkWURxRzNaREMyci9aQlBnZXVrKzhyRjAxNWJRSVJNLzdu?=
 =?utf-8?B?alN3VVZ4VnpWQkFwWEd4V2FBOGdjUjI3UkdZK2VCMVdoY041eFVSK3BCWEZp?=
 =?utf-8?B?OERkcWlqcjJQUkZmYSthdE91aVp6azUya3ZkZ2gzK0J4c0NXZXhnTVcyNndQ?=
 =?utf-8?B?Y3JVdTJObU1wb0gvc2tUVzduaGdua2FaU3FWdVkzSWFMdU9pWGorOXFVNVZo?=
 =?utf-8?B?NmZJbWdMSjFRdnozSTNqOFM1MmlUY3RGcUNqK1BOTkJJK0tiV3FNaDhjTnVS?=
 =?utf-8?B?cy9PUjlpcFB5S3BYei9xeUkySmFhM1UvSlhKVzV4UlNadzZ0dUZGMmliNXpT?=
 =?utf-8?B?TnNMR1lpQUEvbkJ2QThzTUpyWWpRVUxiWW4vcjJ3UFg3cWxCRnRhbWs1R0hh?=
 =?utf-8?B?cGRNOGd5WGV4Y25BVjBGb2dNUGlOUTk5OHRnUTZnaHdtVjNoMHJ3N2YwNy9Y?=
 =?utf-8?B?WG81MzYvZFhrbFVFeXlKcjV6MmNhZkxobEJETk82TUVYanFiWldtd09DRkFz?=
 =?utf-8?B?akRUZlppNHM2d2NvclpHLzFrcTZ0SldLSmRoRVdvYWN2K080VVNBYktXMGpJ?=
 =?utf-8?B?d3V0M1g2c0hhUUQ5NjFMMFZLdGh0dnFhV3VCRWFQRlFBTDI3WTVDK1Y2U3Ni?=
 =?utf-8?B?YkQ5MFBtWUtyWGJDNEphMVVydE1RaVQ3RlA5dXZhNFVmUUQ3dXBoUnhsMzJa?=
 =?utf-8?B?M3pJMVhseG5kbFRVc0QyNlYxLy9hUWhlcDk1SjRyMmovM1NTS0N5VjZuUTAv?=
 =?utf-8?B?Uk80Sk9OQ2IzK3hYYVcwclpXOTNlVmtadzNSbWtUeHZ5dG9ENDNiK1B1c0xi?=
 =?utf-8?B?cU1tVVN0bTBLbStyV1FXOHVrd0NyMzJnRU5Vek5kZzhoSWxCaWpkQ1llQVJk?=
 =?utf-8?B?cjRhZHdvSEREQ3ZRM1hRMjloRGtFZ3hlSmZqb282aW82N2t3bWh2RmJsVGZN?=
 =?utf-8?B?d0lpK1NzbFFjUG9pVFZGdFh0SXhlVU1xaHhTdDBPM0U0MGl1UDAraEZBcVNv?=
 =?utf-8?B?YW5NQU8rNUhCb2pzaCtsLytjdll2NExLQi9OWkRlSXM0MjE1Wk1TelhVaFBj?=
 =?utf-8?B?Y0Y0Q0tlc0h4NWNBWEQ4cklLQVdxVXJjK0dTQlhXQ2R1WnZEWjRobDhpSW9I?=
 =?utf-8?B?blV3eitXRXU5bFduQTJFZnE1cXZhK1Y1UUJ0elkycU5qZ0QwYjVjK1pEY24y?=
 =?utf-8?B?YzFUMUlqRkNmbmVQWHcwTWYrbkQvOFBWUkp5dGRuOXlxbVRXemduS3dzK3Jy?=
 =?utf-8?B?a0VyN2M1UEVwV29YNmRWdis3TUkxbFFiV3JoMFJzZUNWUStOMzFENWI2MWRz?=
 =?utf-8?B?TGJjMEFsTjVyTDU0QjFJc1RsUzdlTmUzdy9oaWpNZFJkVWxZVlZyWGMweUZo?=
 =?utf-8?B?SG9OSnhmZ2JodlphREo2eStmc1BIbVZOR0E4blFCbGlYa0pMVUIyc3ozOXYv?=
 =?utf-8?B?RXdxa1dnc0dnZkxZTWxtam43bVcwRm03TEljUVJxYjVnK2g4cFZJcjk3WUUr?=
 =?utf-8?Q?4bcQeOB7eRCB/ZpJnsQzxIhB9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 581309ea-5c9c-4f82-267b-08dddb851b31
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 22:51:29.1159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NYg+uIPHReKzgqEci4a3cHG4CMW3QihYzkQKXYfTlnmOZNKNvV+EspV2spd4slK+8WbWiD0pbn4jCbDq0FbZGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9450
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

On 8/13/25 10:07, Mika Penttilä wrote:
> 
> On 8/13/25 02:36, Balbir Singh wrote:
> 
>> On 8/12/25 15:35, Mika Penttilä wrote:
>>> Hi,
>>>
>>> On 8/12/25 05:40, Balbir Singh wrote:
>>>
>>>> MIGRATE_VMA_SELECT_COMPOUND will be used to select THP pages during
>>>> migrate_vma_setup() and MIGRATE_PFN_COMPOUND will make migrating
>>>> device pages as compound pages during device pfn migration.
>>>>
>>>> migrate_device code paths go through the collect, setup
>>>> and finalize phases of migration.
>>>>
>>>> The entries in src and dst arrays passed to these functions still
>>>> remain at a PAGE_SIZE granularity. When a compound page is passed,
>>>> the first entry has the PFN along with MIGRATE_PFN_COMPOUND
>>>> and other flags set (MIGRATE_PFN_MIGRATE, MIGRATE_PFN_VALID), the
>>>> remaining entries (HPAGE_PMD_NR - 1) are filled with 0's. This
>>>> representation allows for the compound page to be split into smaller
>>>> page sizes.
>>>>
>>>> migrate_vma_collect_hole(), migrate_vma_collect_pmd() are now THP
>>>> page aware. Two new helper functions migrate_vma_collect_huge_pmd()
>>>> and migrate_vma_insert_huge_pmd_page() have been added.
>>>>
>>>> migrate_vma_collect_huge_pmd() can collect THP pages, but if for
>>>> some reason this fails, there is fallback support to split the folio
>>>> and migrate it.
>>>>
>>>> migrate_vma_insert_huge_pmd_page() closely follows the logic of
>>>> migrate_vma_insert_page()
>>>>
>>>> Support for splitting pages as needed for migration will follow in
>>>> later patches in this series.
>>>>
>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>> Cc: David Hildenbrand <david@redhat.com>
>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>>>> Cc: Rakie Kim <rakie.kim@sk.com>
>>>> Cc: Byungchul Park <byungchul@sk.com>
>>>> Cc: Gregory Price <gourry@gourry.net>
>>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>>>> Cc: Alistair Popple <apopple@nvidia.com>
>>>> Cc: Oscar Salvador <osalvador@suse.de>
>>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>>>> Cc: Nico Pache <npache@redhat.com>
>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>> Cc: Dev Jain <dev.jain@arm.com>
>>>> Cc: Barry Song <baohua@kernel.org>
>>>> Cc: Lyude Paul <lyude@redhat.com>
>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>> Cc: David Airlie <airlied@gmail.com>
>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>>>> Cc: Mika Penttilä <mpenttil@redhat.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>>>
>>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>>> ---
>>>>  include/linux/migrate.h |   2 +
>>>>  mm/migrate_device.c     | 457 ++++++++++++++++++++++++++++++++++------
>>>>  2 files changed, 396 insertions(+), 63 deletions(-)
>>>>
>>>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>>>> index acadd41e0b5c..d9cef0819f91 100644
>>>> --- a/include/linux/migrate.h
>>>> +++ b/include/linux/migrate.h
>>>> @@ -129,6 +129,7 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
>>>>  #define MIGRATE_PFN_VALID	(1UL << 0)
>>>>  #define MIGRATE_PFN_MIGRATE	(1UL << 1)
>>>>  #define MIGRATE_PFN_WRITE	(1UL << 3)
>>>> +#define MIGRATE_PFN_COMPOUND	(1UL << 4)
>>>>  #define MIGRATE_PFN_SHIFT	6
>>>>  
>>>>  static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
>>>> @@ -147,6 +148,7 @@ enum migrate_vma_direction {
>>>>  	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
>>>>  	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
>>>>  	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
>>>> +	MIGRATE_VMA_SELECT_COMPOUND = 1 << 3,
>>>>  };
>>>>  
>>>>  struct migrate_vma {
>>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>>> index 0ed337f94fcd..6621bba62710 100644
>>>> --- a/mm/migrate_device.c
>>>> +++ b/mm/migrate_device.c
>>>> @@ -14,6 +14,7 @@
>>>>  #include <linux/pagewalk.h>
>>>>  #include <linux/rmap.h>
>>>>  #include <linux/swapops.h>
>>>> +#include <asm/pgalloc.h>
>>>>  #include <asm/tlbflush.h>
>>>>  #include "internal.h"
>>>>  
>>>> @@ -44,6 +45,23 @@ static int migrate_vma_collect_hole(unsigned long start,
>>>>  	if (!vma_is_anonymous(walk->vma))
>>>>  		return migrate_vma_collect_skip(start, end, walk);
>>>>  
>>>> +	if (thp_migration_supported() &&
>>>> +		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
>>>> +		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
>>>> +		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
>>>> +		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE |
>>>> +						MIGRATE_PFN_COMPOUND;
>>>> +		migrate->dst[migrate->npages] = 0;
>>>> +		migrate->npages++;
>>>> +		migrate->cpages++;
>>>> +
>>>> +		/*
>>>> +		 * Collect the remaining entries as holes, in case we
>>>> +		 * need to split later
>>>> +		 */
>>>> +		return migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
>>>> +	}
>>>> +
>>>>  	for (addr = start; addr < end; addr += PAGE_SIZE) {
>>>>  		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE;
>>>>  		migrate->dst[migrate->npages] = 0;
>>>> @@ -54,57 +72,151 @@ static int migrate_vma_collect_hole(unsigned long start,
>>>>  	return 0;
>>>>  }
>>>>  
>>>> -static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>> -				   unsigned long start,
>>>> -				   unsigned long end,
>>>> -				   struct mm_walk *walk)
>>>> +/**
>>>> + * migrate_vma_collect_huge_pmd - collect THP pages without splitting the
>>>> + * folio for device private pages.
>>>> + * @pmdp: pointer to pmd entry
>>>> + * @start: start address of the range for migration
>>>> + * @end: end address of the range for migration
>>>> + * @walk: mm_walk callback structure
>>>> + *
>>>> + * Collect the huge pmd entry at @pmdp for migration and set the
>>>> + * MIGRATE_PFN_COMPOUND flag in the migrate src entry to indicate that
>>>> + * migration will occur at HPAGE_PMD granularity
>>>> + */
>>>> +static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
>>>> +					unsigned long end, struct mm_walk *walk,
>>>> +					struct folio *fault_folio)
>>>>  {
>>>> +	struct mm_struct *mm = walk->mm;
>>>> +	struct folio *folio;
>>>>  	struct migrate_vma *migrate = walk->private;
>>>> -	struct folio *fault_folio = migrate->fault_page ?
>>>> -		page_folio(migrate->fault_page) : NULL;
>>>> -	struct vm_area_struct *vma = walk->vma;
>>>> -	struct mm_struct *mm = vma->vm_mm;
>>>> -	unsigned long addr = start, unmapped = 0;
>>>>  	spinlock_t *ptl;
>>>> -	pte_t *ptep;
>>>> +	swp_entry_t entry;
>>>> +	int ret;
>>>> +	unsigned long write = 0;
>>>>  
>>>> -again:
>>>> -	if (pmd_none(*pmdp))
>>>> +	ptl = pmd_lock(mm, pmdp);
>>>> +	if (pmd_none(*pmdp)) {
>>>> +		spin_unlock(ptl);
>>>>  		return migrate_vma_collect_hole(start, end, -1, walk);
>>>> +	}
>>>>  
>>>>  	if (pmd_trans_huge(*pmdp)) {
>>>> -		struct folio *folio;
>>>> -
>>>> -		ptl = pmd_lock(mm, pmdp);
>>>> -		if (unlikely(!pmd_trans_huge(*pmdp))) {
>>>> +		if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
>>>>  			spin_unlock(ptl);
>>>> -			goto again;
>>>> +			return migrate_vma_collect_skip(start, end, walk);
>>>>  		}
>>>>  
>>>>  		folio = pmd_folio(*pmdp);
>>>>  		if (is_huge_zero_folio(folio)) {
>>>>  			spin_unlock(ptl);
>>>> -			split_huge_pmd(vma, pmdp, addr);
>>>> -		} else {
>>>> -			int ret;
>>>> +			return migrate_vma_collect_hole(start, end, -1, walk);
>>>> +		}
>>>> +		if (pmd_write(*pmdp))
>>>> +			write = MIGRATE_PFN_WRITE;
>>>> +	} else if (!pmd_present(*pmdp)) {
>>>> +		entry = pmd_to_swp_entry(*pmdp);
>>>> +		folio = pfn_swap_entry_folio(entry);
>>>> +
>>>> +		if (!is_device_private_entry(entry) ||
>>>> +			!(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_PRIVATE) ||
>>>> +			(folio->pgmap->owner != migrate->pgmap_owner)) {
>>>> +			spin_unlock(ptl);
>>>> +			return migrate_vma_collect_skip(start, end, walk);
>>>> +		}
>>>>  
>>>> -			folio_get(folio);
>>>> +		if (is_migration_entry(entry)) {
>>>> +			migration_entry_wait_on_locked(entry, ptl);
>>>>  			spin_unlock(ptl);
>>>> -			/* FIXME: we don't expect THP for fault_folio */
>>>> -			if (WARN_ON_ONCE(fault_folio == folio))
>>>> -				return migrate_vma_collect_skip(start, end,
>>>> -								walk);
>>>> -			if (unlikely(!folio_trylock(folio)))
>>>> -				return migrate_vma_collect_skip(start, end,
>>>> -								walk);
>>>> -			ret = split_folio(folio);
>>>> -			if (fault_folio != folio)
>>>> -				folio_unlock(folio);
>>>> -			folio_put(folio);
>>>> -			if (ret)
>>>> -				return migrate_vma_collect_skip(start, end,
>>>> -								walk);
>>>> +			return -EAGAIN;
>>>>  		}
>>>> +
>>>> +		if (is_writable_device_private_entry(entry))
>>>> +			write = MIGRATE_PFN_WRITE;
>>>> +	} else {
>>>> +		spin_unlock(ptl);
>>>> +		return -EAGAIN;
>>>> +	}
>>>> +
>>>> +	folio_get(folio);
>>>> +	if (folio != fault_folio && unlikely(!folio_trylock(folio))) {
>>>> +		spin_unlock(ptl);
>>>> +		folio_put(folio);
>>>> +		return migrate_vma_collect_skip(start, end, walk);
>>>> +	}
>>>> +
>>>> +	if (thp_migration_supported() &&
>>>> +		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
>>>> +		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
>>>> +		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
>>>> +
>>>> +		struct page_vma_mapped_walk pvmw = {
>>>> +			.ptl = ptl,
>>>> +			.address = start,
>>>> +			.pmd = pmdp,
>>>> +			.vma = walk->vma,
>>>> +		};
>>>> +
>>>> +		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
>>>> +
>>>> +		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
>>>> +						| MIGRATE_PFN_MIGRATE
>>>> +						| MIGRATE_PFN_COMPOUND;
>>>> +		migrate->dst[migrate->npages++] = 0;
>>>> +		migrate->cpages++;
>>>> +		ret = set_pmd_migration_entry(&pvmw, folio_page(folio, 0));
>>>> +		if (ret) {
>>>> +			migrate->npages--;
>>>> +			migrate->cpages--;
>>>> +			migrate->src[migrate->npages] = 0;
>>>> +			migrate->dst[migrate->npages] = 0;
>>>> +			goto fallback;
>>>> +		}
>>>> +		migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
>>>> +		spin_unlock(ptl);
>>>> +		return 0;
>>>> +	}
>>>> +
>>>> +fallback:
>>>> +	spin_unlock(ptl);
>>>> +	if (!folio_test_large(folio))
>>>> +		goto done;
>>>> +	ret = split_folio(folio);
>>>> +	if (fault_folio != folio)
>>>> +		folio_unlock(folio);
>>>> +	folio_put(folio);
>>>> +	if (ret)
>>>> +		return migrate_vma_collect_skip(start, end, walk);
>>>> +	if (pmd_none(pmdp_get_lockless(pmdp)))
>>>> +		return migrate_vma_collect_hole(start, end, -1, walk);
>>>> +
>>>> +done:
>>>> +	return -ENOENT;
>>>> +}
>>>> +
>>>> +static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>> +				   unsigned long start,
>>>> +				   unsigned long end,
>>>> +				   struct mm_walk *walk)
>>>> +{
>>>> +	struct migrate_vma *migrate = walk->private;
>>>> +	struct vm_area_struct *vma = walk->vma;
>>>> +	struct mm_struct *mm = vma->vm_mm;
>>>> +	unsigned long addr = start, unmapped = 0;
>>>> +	spinlock_t *ptl;
>>>> +	struct folio *fault_folio = migrate->fault_page ?
>>>> +		page_folio(migrate->fault_page) : NULL;
>>>> +	pte_t *ptep;
>>>> +
>>>> +again:
>>>> +	if (pmd_trans_huge(*pmdp) || !pmd_present(*pmdp)) {
>>>> +		int ret = migrate_vma_collect_huge_pmd(pmdp, start, end, walk, fault_folio);
>>>> +
>>>> +		if (ret == -EAGAIN)
>>>> +			goto again;
>>>> +		if (ret == 0)
>>>> +			return 0;
>>>>  	}
>>>>  
>>>>  	ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
>>>> @@ -222,8 +334,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>>  			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
>>>>  		}
>>>>  
>>>> -		/* FIXME support THP */
>>>> -		if (!page || !page->mapping || PageTransCompound(page)) {
>>>> +		if (!page || !page->mapping) {
>>>>  			mpfn = 0;
>>>>  			goto next;
>>>>  		}
>>>> @@ -394,14 +505,6 @@ static bool migrate_vma_check_page(struct page *page, struct page *fault_page)
>>>>  	 */
>>>>  	int extra = 1 + (page == fault_page);
>>>>  
>>>> -	/*
>>>> -	 * FIXME support THP (transparent huge page), it is bit more complex to
>>>> -	 * check them than regular pages, because they can be mapped with a pmd
>>>> -	 * or with a pte (split pte mapping).
>>>> -	 */
>>>> -	if (folio_test_large(folio))
>>>> -		return false;
>>>> -
>>> You cannot remove this check unless support normal mTHP folios migrate to device, 
>>> which I think this series doesn't do, but maybe should?
>>>
>> mTHP needs to be a follow up series, there are comments in the cover letter. I had an
>> assert earlier to prevent other folio sizes, but I've removed it and the interface
>> to drivers does not allow for mTHP device private folios.
>>
>>
> pte mapped device private THPs with other sizes also can be created as a result of pmd and folio splits. 
> Your should handle them in one place consistently not by different drivers. 
> As pointed by Matthew, there's the problem with the fault_page if not split and just ignored.
> 

I've not run into this with my testing, let me try with more mTHP sizes enabled. I'll wait on Matthew
to post his test case or any results, issues seen

Balbir Singh

