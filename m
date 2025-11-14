Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D612AC5AFA3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 03:11:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC6E10E85A;
	Fri, 14 Nov 2025 02:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QQ1iADLn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012008.outbound.protection.outlook.com [40.107.209.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904C310E85A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 02:11:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ebcCEL795OhYRbPOUMuaIPqFBGEEpux4Qx4PynIzabX6/KDzNcXptaDsJFXxnHjLEADurzABeswAr/fp8cJ9r9BPdkaKSnpyq+Pt+kdl/SdQP6XOE4Z0P6stReMibxwJs0Uu59sK5BcHsJms1peUQ0u3nCmjZ2l5tIWaGhMtvIHNDbJcvgCIpgEJSQd9TBIMkYnDyobMgUuqY05lwUCrlaqMxaTc1wGSP8Jo2tm2BZwUYHarLXhcPcoTGnJjbRX41lg8Adl+aUCGHHrC2tUYfpw6wzawj2NCQJqPcfnH0ge4wSq5IGM2nbz6EGfdL73jH5BIhp8965OsaYUSubMJ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xMxoFyB1SLKaDRN/WrumEc7KF2HKZJEZW5ll7y1wHE=;
 b=KV0IY0rH2f3iik1LLediRraZrMGh71Mo4S1YO5CtkBO273J90BfQ3bzbXjyProZF5hofJvjtLLRFWxdAPtJpTM/7JWDiiAqhEmM9/oy7MFHjWrZz7s8PkWaS2L+56wf7gdOHcaNBMUeE5oLgLEIubjN7LHlghUsyFFIgJkFcQcJrBmU7jciE7F6J6owJNpiqDJJa4uvFFVYl6spNO0jaTKk1JYnV/bYtzS/PjzvzNAmLM2tBw3FVSBE+pPLh9hmhwg7fVRTFHDANb9vc+/F5/Q3JWYxY0CAxAz+hjl/u5qINJw/2dwr2XZ6jLz8BoQt3Pl9+D2J9n7GBrAbxbzlgfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xMxoFyB1SLKaDRN/WrumEc7KF2HKZJEZW5ll7y1wHE=;
 b=QQ1iADLnEVkJXDYiczandM5jZyWQomqLeFi9FR3fxU5W9p2HBtjjt5dkU4iYCOEpn7jmY0wJKMBGo7K3yokT48ItokJKaWU3v4UQJRkvcwKeNz5gwS9QhexADgjjtuV/7kCNpaoU3rQVOmyDAtn8o6lWuktwq54/E4wMGPUIKeKHMVZDbBEAgKZwhpBck099sD/MXwHINDtUxbaaZiKtBYUkEM8BrIQvty+B9P9gDswbw3yippqD0GZRbo/+91q9JjtjfeFxTzcOvXRCFR42WQ7jz2fLmgIU8wZvNyzOMlEL3PmoseWJ3uultencnxVJ8Hr+P4lCAva/AtQAU5y2wQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SN7PR12MB6789.namprd12.prod.outlook.com (2603:10b6:806:26b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 02:11:24 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 02:11:23 +0000
From: Zi Yan <ziy@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
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
Subject: Re: [PATCH] mm/huge_memory.c: introduce folio_split_unmapped
Date: Thu, 13 Nov 2025 21:11:20 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <210B3EB5-F24C-4A4A-896F-1C9B30A7C6F5@nvidia.com>
In-Reply-To: <20251114012228.2634882-1-balbirs@nvidia.com>
References: <20251114012228.2634882-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0179.namprd03.prod.outlook.com
 (2603:10b6:208:32f::33) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SN7PR12MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a65dfaf-466b-4160-e09d-08de23231c21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0NGVmRQcHlJLzJqa3Z3TmFmUUZ0ODMzbVNKNjJIN2EwdTRDemFVL2dUV1Na?=
 =?utf-8?B?MmtOUjFLakF5MllmdkdpV2hYbDBuL3EwMlBiUXNyNkFzdGZCdWE2U3BjM0kv?=
 =?utf-8?B?c0IwK2FhOFIvWU8yUTVSZWxhY090VW9zeDhrejl6WFYwNUN4cWpUeU9NNFBn?=
 =?utf-8?B?NEM0RWhKNCtYR2R3bFlPMVZsMGhhWXgwU2tmMW16ZS9OaGVscmFTN1d5UW0w?=
 =?utf-8?B?YU53d1Zzanl6SUhEQzRCRnVUa0dMNHlWM1J5MStyS3dENHd6clhDeWlCdmtR?=
 =?utf-8?B?ZTI1OHNacHZFVVk4QlMrUGMvOTZ5V3F5UmlSa3Q0bFVjN0crbFpTRFl0ZXpY?=
 =?utf-8?B?bktONzhTNmRlRUdXQlpNSGR4dW5BY0d2WVF4UysyUk1IdnNNMEtjTFNkZjhM?=
 =?utf-8?B?Q0ZSYmY5S1RmSjZlZWtOOEhLK3orcVJKNDZzS0MrRzR0WDN4cDRNdEhYV0t1?=
 =?utf-8?B?Mk00NDA4V0piREdFdHEwcGhjcEJrWlVmMDI2UjQrazI2YVR3bmlJUHVjVjdJ?=
 =?utf-8?B?U290QUNIVkRady8wblJWcDNaSWNIMERDYkFPOWZGbmlvMkhwOHFDam9iUVZK?=
 =?utf-8?B?ZmlEMFF2NVl3M2pEN04zYndQQzA4S0ZOVE40WXdnUXlzRjhJMDh1N1NEMGhZ?=
 =?utf-8?B?TGd0b0VsZmttS1RhUFFvVWh0bzcyYSt0dG9mWUJ4dlExeG8rRlZxYk9VOXlm?=
 =?utf-8?B?ZkJqR20zOG5OR2RFT0hpU1F5NFU4SWFCaVRjaWsyaVFLVjA2bDA1cDhqMDBQ?=
 =?utf-8?B?am5waEQzamsvR3h1MmxFL3A2Zzc3UzllajVEU1MrZnBWZTk4azMvSzZhWGR6?=
 =?utf-8?B?UmlNQ05uRnpNaTVzWm92SXhBMkRWZmlyZkcyUEFadzFYa3pwaHMrV3pmcm8y?=
 =?utf-8?B?K2RrUkgwZi91S25VUWg2c0ZwREhNZnd0UTRhUmQzU2ZpLytqWXVEekovMFV5?=
 =?utf-8?B?VWVFWHlqU3FuZjkzT2RNZUM3eVJaYmFWUENiaFMzMy9xTUprQWZ4Uk5RSllw?=
 =?utf-8?B?ZXl6VFR6MnFvTXZsMFQwQUwzTjVIcnJQOUxwTTNQams3Y2VqMDMzOFBxRDE2?=
 =?utf-8?B?Rk9zZkNYMXkxaTNpZDdQSlVvQ3M3YnBKbHltVmJCN2lGZ3NaTHBZQXdwVGsv?=
 =?utf-8?B?dkdlQ3VoK3pDdjY4cExuMlU5T2x3RURGQmtCRlFTdXNYSEJTQ3g1ZkhpQ2VH?=
 =?utf-8?B?OWYvRERVdFVQbE16Rnk2d3BBYUJLQ2ZXdUVRS3YvcWNtNFI4T01iOWhaQWtj?=
 =?utf-8?B?U2pjYVA4dEJnL2lCamk2SWlFcmdlWGJKOGVoUzRrWUR2T0djd3hJS2E0WlJJ?=
 =?utf-8?B?aFpuN0UrY1VpenJHRXJTcmdwTHBJNi9MdTVGNUhSMlRJdVVDTklqR0czTWVo?=
 =?utf-8?B?Q3UxZlF0dDdOSyswRm82ai9jVzdKUExaTTRtOTl3empEcXJkeWlFcGQvOWkz?=
 =?utf-8?B?YlJXbFVDeUt4aloyd1FBT0tKMDVQMHdiZGY5K01aV3lrRWZVbFVORU5nclVi?=
 =?utf-8?B?MS85bGNFZndTWVdkWmtaSTQ4ODV6OWsreEhnU2JxcWNGc0RZTDF2YlFmTDV2?=
 =?utf-8?B?RnJLc0svY3lubjM1NVRuanJkczVEZWtHV0dQZzU1Z0ZVWElkbkRjYTNlTTFi?=
 =?utf-8?B?SmJjYkQxWi9BdE5IY2xOWnE2REQ2UFArdHRhYzk4bCswU3MzQjd6Y2ZWM0F1?=
 =?utf-8?B?TmRaWjlFc1RrYlVGRXpmeWhwNFlYNHFNVVBlVFlGM28wNjJnQTl1WWFKQjQz?=
 =?utf-8?B?ZUI3elRUNE05b1pEbCtvSjVhYXJCMmZMdTYwRnhUVVpVMHNGcFJ3ckhPL1U1?=
 =?utf-8?B?ZFVZcWdQMk9BWHdlM2p1RUkvVDdkSmY0STFvZjhqMnVGTnpTR21VdjhvazRY?=
 =?utf-8?B?RTl0YjA0MWNMZWxNby8yT1QxcHpVUVY5blVpUG1FYXhYRmlKTDJaQ2JoV0Ni?=
 =?utf-8?Q?r1U1+mq+LtGsnlo3XbGejbbRovg8gGZs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WENjNXlQcThqcTNqOFdPaGliUDFGS25Sb2RnU2NjcUV1c1dNR01yZXZWUmpq?=
 =?utf-8?B?MVRXZUdMNmpkcWFiKzV1OTVwZkVZV3hlTEU2NVAyVlNhbDY0L2UrT0R0Ujc1?=
 =?utf-8?B?YytVQWk1UEJXazFQcVJXV09lYXcxNVRsenY2VzkrclovTjlIWnRmbHhpWFM0?=
 =?utf-8?B?VFZGdUhjVkVTU0hkTk1GYUhqSlI4dlJzeENHeWZBaWt2dmR1dzFNOHFlOFhH?=
 =?utf-8?B?ZXBnWnVVeldudFhTbkZYaFlJMXNJMHNpRlFqMmxrUG1UNFJnODREL1FDUDJW?=
 =?utf-8?B?UTArYjJQV3FZYkRqQTBtZ0Q1Z1JaS2dEZkdwL3NZNXozaVhUQ2JJWTNoazRB?=
 =?utf-8?B?UmRFenVCcmJsclhRelNFaXZuc3ZNZkpYVndqVS80c0RPVDBUUTU4V1hpSS9D?=
 =?utf-8?B?YXlIRHBJTGR1ZUp1RWcwajRjUUpZZDNCUWRXZ05DbFdjYlFRV1lMSjJvVTFD?=
 =?utf-8?B?WWxsbjIyUS94dUo4NlROSTVDSWlPMEhmZWRjcWIyMGdJZlBSaGVYZXpOZGJW?=
 =?utf-8?B?YUFjekJDZ0I5WjFvNW9KZ1FVL2RaNU1nRXE5YVlCSTZPYXRKM2NkSEZNc1g4?=
 =?utf-8?B?MW9wRUxOaHlXSmxtWUl0cjkyU2NwVTVEbDdiU3ZsTndwVWdrcGpZdXBKN2Qz?=
 =?utf-8?B?WDNsY0luZFpBTThHcE52VGl1emhWN1BRQzFXVm1JWkFpa0FhdC81YjloQlhS?=
 =?utf-8?B?YjY2b1J0cWcwbmFqbTNuc3RBcVlFUnAzekRlbnR2cDQ4QWhCRG1XSjk5YWs0?=
 =?utf-8?B?TTh1WlVHdFo0RndYZzV3Vk05eWFsQUZINll1R2dqYmU4Tmh5RWc2K2RNd0hl?=
 =?utf-8?B?eEtmemR0Si9tMTdDRUFwMEZ6eXdrRjJrNk5pSTlwVytlRFNTT2E4RHJLOHdH?=
 =?utf-8?B?VnNBQndPaDYvbUtuR3FWUk83S3pPZkVFaWt1azZLemczUWJlRTRtVER4WTc0?=
 =?utf-8?B?MlZFRndGY0xQazlrc1VqeFd3VTFUYkY1YVNqMEdPeWJ0bHdPenRFYVo3SDc1?=
 =?utf-8?B?aTNhUWVpVUZ3bk9wTTUrVXN5UktUTEhBbVhwVkwxUzlvbW4vcFNzbVVLRVdk?=
 =?utf-8?B?MW9neUdqVnNpM1hOYzlqbDNIZFpvVkVPRXlZWkd4eWE4NnFhQzY5SDVIYkZN?=
 =?utf-8?B?Sm9Neno0ZWpvMmJORDN2aWVXTFNVakE3cVFmRFVRamUxS2tMYVZaZ2Fremxk?=
 =?utf-8?B?L3NBQnNtb0VEMFp3azhoTFhyeDRiRGsxTEdlVkpQVUpHQlo4eEs4eXNzU0Ft?=
 =?utf-8?B?b0RlRjFZWURxdktrajBTTHozcVA2L1FpRWxZamlPNlRuVnlQYUdzTjA2Y0hY?=
 =?utf-8?B?eStSa1c5c2lBWHVxT0dDamQremJYZGpKUEE2eFRic0Rod01mdmFHanhsaEQy?=
 =?utf-8?B?ZmgxUllNekdscDIyVXJXc1NYa3BPL0w4ZFRUUHhLa3J5TDA2dzdmays1eG1y?=
 =?utf-8?B?eFVDeGRFNFkyU0JxbHJXVzB1RU5xR2pzYjVDSEtOMGM4OUJQRnl4K3c1bExQ?=
 =?utf-8?B?bXFRanpQb08rWC9hUVZraEI5YVFXYWJlcnVlK1lERFI2WGswQWl4bkozWXk0?=
 =?utf-8?B?S0NPVHo3anhXVXArdUZVZmxpUXlWeFVxSEdWSFFIWVRCZ2lNRVc2YzlUcExo?=
 =?utf-8?B?Rm4wTEdiMGJKVWxQdFE5anplZEptM0FUcmZ0VEZQZFZrN0lZdUFEVUk5Mmp2?=
 =?utf-8?B?UW9YclFhdlkzbmZITjlBYnBRVUJhNnlLaVVxT2p3OEJScWxFam5FNitFM0tH?=
 =?utf-8?B?MkoyOTc0eUMybEEyU1EydjlwQ2ZIaHNLK1YzRkNhK2VVTGJDTG5sakNNSFdS?=
 =?utf-8?B?bUR6eTlzRWIzaTNPT1c1M1JXWTBvMDFkNEdReEgxb2RCMUtQRUNDWGRNU2R6?=
 =?utf-8?B?ZUdMaGN3VHlXUk5lVitCR2M4TGtrZVBOVDErQnIxY3MvaDdadGJJejhnWXQ1?=
 =?utf-8?B?TXZTUmR2QjNGNE00WTRWZTlXRGJubEdpaGl1T2FhS0E5ODd6LytpZEQxZmFC?=
 =?utf-8?B?V2VzOGdjNWd1OFR3RFE3Z0NyWnNnZlhFUXdWOUt2N3ppUUtPY2puYzAyUE51?=
 =?utf-8?B?MVN1Umw4VUtBd2xuWERRcVJiZzBTbVlZaktTOEpvV3ltWTYwbmI5LzVwdjhX?=
 =?utf-8?Q?a0t0zCImE178Vq5AVuTxeROH/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a65dfaf-466b-4160-e09d-08de23231c21
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 02:11:23.7269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wyxUd85dNpQqB0k/x9j+IvyzPcUYk20OYjiEYTvEFeFHmtf2LzYtVhR8PZjd5+sG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6789
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

On 13 Nov 2025, at 20:22, Balbir Singh wrote:

> Unmapped was added as a parameter to __folio_split() and related
> call sites to support splitting of folios already in the midst
> of a migration. This special case arose for device private folio
> migration since during migration there could be a disconnect between
> source and destination on the folio size.
>
> Introduce folio_split_unmapped() to handle this special case. Also
> refactor code and add __folio_freeze_and_split_unmapped() helper that
> is common to both __folio_split() and folio_split_unmapped().
>
> This in turn removes the special casing introduced by the unmapped
> parameter in __folio_split().
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
> Suggested-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> ---
>  include/linux/huge_mm.h |   5 +-
>  mm/huge_memory.c        | 332 ++++++++++++++++++++++------------------
>  mm/migrate_device.c     |   3 +-
>  3 files changed, 191 insertions(+), 149 deletions(-)
>
LGTM. Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
