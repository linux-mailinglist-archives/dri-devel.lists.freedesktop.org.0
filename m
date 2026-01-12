Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2649D10531
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 03:15:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF81E10E04B;
	Mon, 12 Jan 2026 02:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KY+pH9W7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013028.outbound.protection.outlook.com
 [40.93.201.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1303610E04B;
 Mon, 12 Jan 2026 02:15:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZ4Yvzd/YONEPyccMh04/23QlKXLtie4sLWmQE3Ae+Oe/ZDcc4INynV9l7zuoNgvlGo2xRaafy7USeYJtuqaIIlpk7QkOXYbpr21/cwVqqWk2p7w0kAPwaPQ8ui3ljzb5yMPvL9+TIvTzp68g62gMkvXNU/kXJZvWxnYDqCBFQgP8+GYaiiXoDUa1EUVF4KXjMry9O/nNOQ5bxFnLLy1C0unNBXeo+YpbJNmgjmWZpby5nvR5i5SSfXCxRyxAPJPn+dBHB4eIXsgZu6woVgU/Iy7p8kzMDVd8JbQ79jNot5eLC2t/nlhSTGDDjxwZiDX/lXUPBeKSTFDnENXLAR5uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8JJTANOoICf4vzFFew3zeJKUdpi0P4nacfSNiUcZZM=;
 b=WBshJpEzyigdVur8WNgA5LP0j2jyV87hQsk9LKHkUye66w+ETcytDOo3li3J6bl9555K49LYzgk2uBMy0HewHXExNWkeUM06edYGNx4aQvdTKvGNh0eqZtHQtLiwa56l3+OjLrI5Bxfkgay1OOf5oE/Y96aNbBuX8r7B7bJ0yEXcixdAv74Da2fXzcMAM6fXQ/tuHWsFmc3mrXcSlbj1IR9C9MDoFt77ZqXHF6jw4+evD2X3uXS7QKRqTNntDsQEaJ70GbthRzEEb/VvFOEFPTUCYRJD1xGr4EDZ5UG68+qVehQxJWVuikmP8rOOqtS+t2KpMcJ23dKuNAOC6t5HtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8JJTANOoICf4vzFFew3zeJKUdpi0P4nacfSNiUcZZM=;
 b=KY+pH9W7NepAJwnOVQLzhSfc634uOEp2DeuYImqV7RDXJZDjLiUR2UmVprFawxkyIsddr1f/V/cA4rKZpkU/loktBFzbR0atR5krNd2C14STH+hUU3EBqOPhyz0KsyXk1wj+YebKMUNTcxuaywPzfLPhbcmZA80J8gtt0HvULo71PYHbEdmbX0GKafzVu316lJQjQ+57dCf8BrnZqwo+BmVRRo9EE0Vp0y2yiLFdS+rRweikT1pt+AJEtCXjANNcSzm21DSTOVebvAdEPdp4ahvyQ6neq+wuPI9L8zVFPyr43sqH02crZNG2jr6addNPDoV321M4+S56p/QEhb6XSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by MN0PR12MB6030.namprd12.prod.outlook.com (2603:10b6:208:3ce::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 02:15:18 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 02:15:18 +0000
Message-ID: <dd60d292-a267-4ccd-842a-36525b707bde@nvidia.com>
Date: Mon, 12 Jan 2026 13:15:12 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] mm/zone_device: Add
 free_zone_device_folio_prepare() helper
To: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Andrew Morton
 <akpm@linux-foundation.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-3-francois.dugast@intel.com>
 <706ba3a6-5be2-46d7-9e7d-d613f2e061cc@nvidia.com>
 <aWRLeoUJAYAWbLD3@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <aWRLeoUJAYAWbLD3@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0106.namprd05.prod.outlook.com
 (2603:10b6:a03:334::21) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|MN0PR12MB6030:EE_
X-MS-Office365-Filtering-Correlation-Id: 571d3430-db55-4909-98eb-08de51806e68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|10070799003|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2Jyek0yc203dzdIdms5cktzcDlVS2ZEY2VHTEM0TWgvT1dCM0phU2RwY2U2?=
 =?utf-8?B?ZzRUd2VUd0xkZjhUNEg1dVlZUWZVZzBVNkUwMmI0eEVSUkxKNTZrb2ZNSnZw?=
 =?utf-8?B?bVArOVl6QmpBS1FZN1IwYmsycE9ZNzkreFd4cExuL0FYWEZ1WVJJTHNEUW5p?=
 =?utf-8?B?WVIxczdxUXY2VnFPRU9NZWh2NEhOK3ZtS1Y5WU5vTXI2d20rYTFCV016d0Zn?=
 =?utf-8?B?RXdNZjlLM3MvcTBheS9tcFNnbS9sNjBUeUxhU1BXWHpvbjVCbmZlZ1RqdFNw?=
 =?utf-8?B?VGpHQ2hYNHJ0OXdBNnRHRjRTL1VBeE9mOTdCTTZnbWxwSVFPWnFjWExuQ1V0?=
 =?utf-8?B?K204a0Z1cDBlb1QxYkF5dHhKSWs2ZHQwdVpMbWJFQWNMMmhqL1ZoZFlHL3Ri?=
 =?utf-8?B?Z1k2NkVPWWdmR3EyVlZJMXliL3lPelpKdWg0STMrU3ZNRitzZ2hBbWsrVWpH?=
 =?utf-8?B?WjJzTEsrdTF1b0l1VVhKeU1xejE0L0tKdFgzMXBMbFJPYWpRQWZMbC9rb042?=
 =?utf-8?B?K1FNcEd5MGNBNVhhSTQ0NUY0cHhSZW1Vc0RaNktNS0tPYldEMkVIdFZRN2tz?=
 =?utf-8?B?Y205VHZUN2R0VFdIZUJUbXpHbWpKbnE2VHZPTlBLaHZiUGtiSmpUUVZsWk1E?=
 =?utf-8?B?KzJmR1Z3anlLc1l3YlI1NFo0Rkk5bHhXQ3lTckhIczVUTnVRbGNleWxpTFd0?=
 =?utf-8?B?QWdycElxT2d4cUJrZjR1Y2pMRmtmZlNDd1hOTGwzVlUwTHM1OUNPRG16Qi9i?=
 =?utf-8?B?SHFhekZrTUdWRmhicWpYdDZFa1ZGVVB3eTB6eVZlWTNNR3pYUkx5WGxrTWxB?=
 =?utf-8?B?M0FzYzhZNnZpZUozOEgrek9rUjFwbUR5cnhKYUhQclk2b1Q1S2Jvc2ZWYjJG?=
 =?utf-8?B?WklMV3FjMG83RkRJSVF0MFZFSy9FMFlQQ0R4NmY1NEpGRGdJY3FwdzYyRTN3?=
 =?utf-8?B?Tkp3dEhtcE5jTzNRNWJTTHI2M0Z2VURxODNCNWsxUTlJRkRyTndzb1I1SUx1?=
 =?utf-8?B?dm5QaE9XUTNwejBUZzIvYnpINXZqYWNEYVkvYm02bEVybmZXcE93c3FxT3A2?=
 =?utf-8?B?QzRxb3l2QzJnSUg3MmdwanN6ZXFrV1lRbG05TWJjVTJZVXpqSlU5QjYzVFNq?=
 =?utf-8?B?ZmFaZ0szdFY2Vk8rTTh3VE05YjhlUjFDNFd4QThrV00yYUxYeWdYRC9SV2xC?=
 =?utf-8?B?d0hXWG9ycEhsRW4zS1RLWXVIQlRGZkF5dlVBa3FlSmw4RUF6SndocGhLaGFE?=
 =?utf-8?B?MXRCU2ZwTGxTb0RjVlZ6ZmZKSFhLbDZlOHhnUUYxdlpsQUUwY25HVCt1bUtP?=
 =?utf-8?B?akdTd2pDOU01bnlMNmdSRXladHdaTHR6dHdLRTk0SEZKamtpd1l5SXplYmI1?=
 =?utf-8?B?QkR4NW1sdXdjSmxRUnl6T2FYY093a1RKbUdGc25WZTdoUGE2UkFDMFdkR0Z3?=
 =?utf-8?B?Y0hyWUI0ZVJOYUx2U2d5bWRyQ0g2K01nUU1MUE5ZajI4cjV3dEtPT1lJL0l4?=
 =?utf-8?B?SFo3MDByYjN2UGNSTTVid1lYWHUrZmF5QWlEcXJrQzV2YUlPYm04S2JCVDg0?=
 =?utf-8?B?cWpLRXBGZWpBSE5JcW5hRDdxM0M5dzgwMGg2Q0JORTVxbk5malpJRm1XVnlZ?=
 =?utf-8?B?K3FHc2wvMW5JNkFZWkJMeC9odTNRaGRybmpQYTZ5a3lpY0FqMDhBVU1DT1ZN?=
 =?utf-8?B?R05SNk9DdFRrSHBjMVpXUWtIQjBxYkRvcFNlTklCb2dieklBVENWWGFDZmV0?=
 =?utf-8?B?VWxuMnEvbExoNlJ4K09Ea0x4QlJMWDRsdmc2MTFldG45THk3NlJUWWliMDJr?=
 =?utf-8?B?SUpWdzBaaFhTQ0s1VFZ2UENCODF4ZWJFNWVtWU1KVTdFY2NzSnJNMXpTZUh6?=
 =?utf-8?B?TGlXbXdOTS9velV0bHBiVGRhcC9JWnhJNU14R2ZqNXFObFkrN0tGSk1rUWx0?=
 =?utf-8?Q?cGhHGoTrj+ikQw0CBUH57G4URWonSPVs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlMrTUkzTFg4dU0wcFBZUWY4dlNNT1dKVjJjR3Z2ZEV2M29pR0JIQWlzOEdF?=
 =?utf-8?B?a2F3TFoxTEFCNmRwbXphTzMwSG9OOG5oVmphelNoNGpMcGNtei8zelpVWjV1?=
 =?utf-8?B?R0MrOGNzQzhZcCtkOHpJOUVYUG8ydzJ2bVVvSVBpVkpNMG95cjlETUdlVHp4?=
 =?utf-8?B?U3RZa2ZnTlorbHZjOUtiaTB6L0VKeStLYzVJRzNNRXpLaEtYZlh1WjRUV2xo?=
 =?utf-8?B?VU9OY1o5OFIwZTlWQlZtNDU2cmF6Y3p2azhac1NCUDRvUmRlY0pTSGlQTjc5?=
 =?utf-8?B?ZmdNYzE5dUMzTzdZVGdJWExUMUtoUE90dm1TUk80L0wvWmdtZmp4Tkk3L1Mr?=
 =?utf-8?B?L2QwTUdCS0hQRU8rQXdvWThyMEhQUllqTDFwZVRHTjU2UjBjcERMUVFReEFD?=
 =?utf-8?B?MkY5Y0tPQmhMaExKNUg3ZnphL1RNcmVxbVpTekRmVHo5Z0tBeitJVkZSNGZn?=
 =?utf-8?B?YW5SbmVJWG5hczFpaE1JZ3lSKythY1Jrbi8xbEVwdndtTGpZWFBDTk85QWNr?=
 =?utf-8?B?bml2RkhJR0dYSHNRZWxtb1dOUnpwYzNXMjMwM1hRcXlWb0tuVW9nN003ckQr?=
 =?utf-8?B?amN3VGJqVmd3VjhCcFRWN2NDaFdZM1lCY3dwbWcySjdQRUNoVWRkNEpscmhv?=
 =?utf-8?B?dUdpOVp3VVNjRlh4eGhqa1BBUGFndjFhdFhrTEgxUXlEdlhyUHpBNmI3WXJE?=
 =?utf-8?B?azVCYWZnRlRSY1NTT0xSYlBxb0RjUG1RY0JuL3lSRmVmTzBHdVRRNTVhSUJ6?=
 =?utf-8?B?N1NieUs1VWZGZlg1WWxxZUd2VlFWQUZMdXkwMFU3RDJ5YzdpZWdoNVAyeGlL?=
 =?utf-8?B?dmtpQXZiVm93ak1UZDJETzIrL1FQQnVLU0hVeEhIazZLWkxEVVp4ZGJrcVJZ?=
 =?utf-8?B?N241OC82SVRTK0hsclFRaVM3cUtxRmVyMkJUZjBKSUM3Wmw1MjJTcjR6NUVM?=
 =?utf-8?B?SXo2aWNESU01T2hwM2FaYUxWVE54eUR2U0pKdnFzcFZOSzFKamtxY25YMnFJ?=
 =?utf-8?B?d1l4RmRWeTVUOTM0NzBnTFc1dVV2NHZ3dnNUN3JrTlpaRDdRcU56RlNHQWZm?=
 =?utf-8?B?dkQxdzZUT3NDL3BUSEFCZFU0VmVRdmxPY2JkK0FPRjl4Q0YyRVVpS2xBbGZZ?=
 =?utf-8?B?eTdoRzVVTURSc2lUdjdOZjh3UmdjbExqZGlqbFBoRC9OOElkSk15eUtyZHhQ?=
 =?utf-8?B?c0ZhRHZ3YzMrSzFEM3I0VjZockNLVXJ1b2dxeDBMVFZldlVTN0sxQ1lBREVw?=
 =?utf-8?B?ZE13MlNKT0dPU2NVWGoxQVFJMHRxL1hETUJpYlF1dWJwWFZPSDJIeVJhVTN1?=
 =?utf-8?B?Yjl1OG9VVW1yQ1BiVndONzhkb3BEMEpXM2VCNitCc2Z6aTVaMWdoeENOWHAv?=
 =?utf-8?B?L1JEUFZPcjlZODBzT3FzQURjaXpSc1lCSmpnYUZVYzVyWHNUSC91MUFTcFlj?=
 =?utf-8?B?SnRZdWNnbEdncWRmT1JrTmtSNG55ck8vWUtCTSs1cnZ6K05ZMWRwTmdSdHV1?=
 =?utf-8?B?dTdMayszT3hNZEV6VW5Sb3RFZnRaaEZMVDBVM3FiQm43MS9SQjZGU1hUM1dN?=
 =?utf-8?B?VEpoVVJsMmdNbnV6bUZlQTA3K0NRWUkzTklndW9SZkh4eHdvODI3TU5NVXlm?=
 =?utf-8?B?czA3YjFJcVdnSDZwdllFYkJOcTZVa0l5Mnk3cFgzcVNmSHNGcnl0QzcrWmlw?=
 =?utf-8?B?TmEvTUNjd3ZWVmF5cVlaYTFVWElwSUlOdkJWWTZlTHZmSlFrNWhkc2pIWDdt?=
 =?utf-8?B?dlNHU0dtcFE1d0R2eXM4WS84aDlNNFVMRUpCTFhSbDduS1ltcmM0VDkyL011?=
 =?utf-8?B?VjVMTm5QQ3ovM0NlVzN4eG5NZUxmRFcwa1pEZFhwZmxWMzkwTzNWTE1hZllm?=
 =?utf-8?B?YnlwSjQ1NGRXN3RVTUZzaHB2YTRJaGtUNXlnRHc1VmU4TVhJOXJ6MHdGVVpr?=
 =?utf-8?B?UGtiMUM3TFl6Yko5S1BmcFZic0trODV4NXJwSDNTZ3NtSEFaeitnNlBpbUdv?=
 =?utf-8?B?U1NCM1huekRHaVExYUkvbVJIRTlLc1FjL01nWGpEbmJLMjdHd3RzNGRHSnFa?=
 =?utf-8?B?L3I1akhpTDVsdDJjVlA3WGxhV3Raa055RUF3UHE3d1cyRGZxSXVSY3l3Y05P?=
 =?utf-8?B?KytMT0kvcXB2R3QrYUd3VDB2SmtYMU1hbXJ6cVFpejFQcHAxVitPVll5VHFJ?=
 =?utf-8?B?WkE2WkQ3bnJFRnBycy9iZnUzZTdNQm5uSFJ1MXhQQ1o2UTBnM3FYVXkxbEdy?=
 =?utf-8?B?emNyUUhKSG92RTgwcWZqUW9SeEhobGxYYjBDNWhieWg4Rk9ISU1nU3h2NXk5?=
 =?utf-8?B?OE5ObUVraG9DcjQ3V3diU0FaSVcxZU1la2NUcTBneFpGZkZudUxDSXZmRTFy?=
 =?utf-8?Q?Q69g1d4dAX36Btk2fDImTMUf69MDfJytqgHFH1vOzdOXE?=
X-MS-Exchange-AntiSpam-MessageData-1: E/skEZFj9mGHkA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 571d3430-db55-4909-98eb-08de51806e68
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 02:15:18.4885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eTiFdeaE1RRmtlLyLH6GwLV7/CX9X5uLye4pzreYZP06JRBLdshi3BKb5Wa/TnzxX3pKri4tkSuN5uO309/y4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6030
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

On 1/12/26 11:16, Matthew Brost wrote:
> On Mon, Jan 12, 2026 at 11:44:15AM +1100, Balbir Singh wrote:
>> On 1/12/26 06:55, Francois Dugast wrote:
>>> From: Matthew Brost <matthew.brost@intel.com>
>>>
>>> Add free_zone_device_folio_prepare(), a helper that restores large
>>> ZONE_DEVICE folios to a sane, initial state before freeing them.
>>>
>>> Compound ZONE_DEVICE folios overwrite per-page state (e.g. pgmap and
>>> compound metadata). Before returning such pages to the device pgmap
>>> allocator, each constituent page must be reset to a standalone
>>> ZONE_DEVICE folio with a valid pgmap and no compound state.
>>>
>>> Use this helper prior to folio_free() for device-private and
>>> device-coherent folios to ensure consistent device page state for
>>> subsequent allocations.
>>>
>>> Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
>>> Cc: Zi Yan <ziy@nvidia.com>
>>> Cc: David Hildenbrand <david@kernel.org>
>>> Cc: Oscar Salvador <osalvador@suse.de>
>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>> Cc: Balbir Singh <balbirs@nvidia.com>
>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
>>> Cc: Vlastimil Babka <vbabka@suse.cz>
>>> Cc: Mike Rapoport <rppt@kernel.org>
>>> Cc: Suren Baghdasaryan <surenb@google.com>
>>> Cc: Michal Hocko <mhocko@suse.com>
>>> Cc: Alistair Popple <apopple@nvidia.com>
>>> Cc: linux-mm@kvack.org
>>> Cc: linux-cxl@vger.kernel.org
>>> Cc: linux-kernel@vger.kernel.org
>>> Suggested-by: Alistair Popple <apopple@nvidia.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>>> ---
>>>  include/linux/memremap.h |  1 +
>>>  mm/memremap.c            | 55 ++++++++++++++++++++++++++++++++++++++++
>>>  2 files changed, 56 insertions(+)
>>>
>>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>>> index 97fcffeb1c1e..88e1d4707296 100644
>>> --- a/include/linux/memremap.h
>>> +++ b/include/linux/memremap.h
>>> @@ -230,6 +230,7 @@ static inline bool is_fsdax_page(const struct page *page)
>>>  
>>>  #ifdef CONFIG_ZONE_DEVICE
>>>  void zone_device_page_init(struct page *page, unsigned int order);
>>> +void free_zone_device_folio_prepare(struct folio *folio);
>>>  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>>>  void memunmap_pages(struct dev_pagemap *pgmap);
>>>  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
>>> diff --git a/mm/memremap.c b/mm/memremap.c
>>> index 39dc4bd190d0..375a61e18858 100644
>>> --- a/mm/memremap.c
>>> +++ b/mm/memremap.c
>>> @@ -413,6 +413,60 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn)
>>>  }
>>>  EXPORT_SYMBOL_GPL(get_dev_pagemap);
>>>  
>>> +/**
>>> + * free_zone_device_folio_prepare() - Prepare a ZONE_DEVICE folio for freeing.
>>> + * @folio: ZONE_DEVICE folio to prepare for release.
>>> + *
>>> + * ZONE_DEVICE pages/folios (e.g., device-private memory or fsdax-backed pages)
>>> + * can be compound. When freeing a compound ZONE_DEVICE folio, the tail pages
>>> + * must be restored to a sane ZONE_DEVICE state before they are released.
>>> + *
>>> + * This helper:
>>> + *   - Clears @folio->mapping and, for compound folios, clears each page's
>>> + *     compound-head state (ClearPageHead()/clear_compound_head()).
>>> + *   - Resets the compound order metadata (folio_reset_order()) and then
>>> + *     initializes each constituent page as a standalone ZONE_DEVICE folio:
>>> + *       * clears ->mapping
>>> + *       * restores ->pgmap (prep_compound_page() overwrites it)
>>> + *       * clears ->share (only relevant for fsdax; unused for device-private)
>>> + *
>>> + * If @folio is order-0, only the mapping is cleared and no further work is
>>> + * required.
>>> + */
>>> +void free_zone_device_folio_prepare(struct folio *folio)
>>> +{
>>> +	struct dev_pagemap *pgmap = page_pgmap(&folio->page);
>>> +	int order, i;
>>> +
>>> +	VM_WARN_ON_FOLIO(!folio_is_zone_device(folio), folio);
>>> +
>>> +	folio->mapping = NULL;
>>> +	order = folio_order(folio);
>>> +	if (!order)
>>> +		return;
>>> +
>>> +	folio_reset_order(folio);
>>> +
>>> +	for (i = 0; i < (1UL << order); i++) {
>>> +		struct page *page = folio_page(folio, i);
>>> +		struct folio *new_folio = (struct folio *)page;
>>> +
>>> +		ClearPageHead(page);
>>> +		clear_compound_head(page);
>>> +
>>> +		new_folio->mapping = NULL;
>>> +		/*
>>> +		 * Reset pgmap which was over-written by
>>> +		 * prep_compound_page().
>>> +		 */
>>> +		new_folio->pgmap = pgmap;
>>> +		new_folio->share = 0;	/* fsdax only, unused for device private */
>>> +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
>>> +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
>>
>> Does calling the free_folio() callback on new_folio solve the issue you are facing, or is
>> that PMD_ORDER more frees than we'd like?
>>
> 
> No, calling free_folio() more often doesn’t solve anything—in fact, that
> would make my implementation explode. I explained this in detail here [1]
> to Zi.
> 
> To recap [1], my memory allocator has no visibility into individual
> pages or folios; it is DRM Buddy layered on top of TTM BO. This design
> allows VRAM to be allocated or evicted for both traditional GPU
> allocations (GEMs) and SVM allocations.
> 

I assume it is still backed by pages that are ref counted? I suspect you'd
need to convert one reference count to PMD_ORDER reference counts to make
this change work, or are the references not at page granularity? 

I followed the code through drm_zdd_pagemap_put() and zdd->refcount seemed
like a per folio refcount

> Now, to recap the actual issue: if device folios are not split upon free
> and are later reallocated with a different order in
> zone_device_page_init, the implementation breaks. This problem is not
> specific to Xe—Nouveau happens to always allocate at the same order, so
> it works by coincidence. Reallocating at a different order is valid
> behavior and must be supported.
> 

Agreed

> Matt
> 
> [1] https://patchwork.freedesktop.org/patch/697710/?series=159119&rev=3#comment_1282413
> 
>>> +	}
>>> +}
>>> +EXPORT_SYMBOL_GPL(free_zone_device_folio_prepare);
>>> +
>>>  void free_zone_device_folio(struct folio *folio)
>>>  {
>>>  	struct dev_pagemap *pgmap = folio->pgmap;
>>> @@ -454,6 +508,7 @@ void free_zone_device_folio(struct folio *folio)
>>>  	case MEMORY_DEVICE_COHERENT:
>>>  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->folio_free))
>>>  			break;
>>> +		free_zone_device_folio_prepare(folio);
>>>  		pgmap->ops->folio_free(folio, order);
>>>  		percpu_ref_put_many(&folio->pgmap->ref, nr);
>>>  		break;
>>
>> Balbir

