Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED362A9BDD8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 07:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E372E10E028;
	Fri, 25 Apr 2025 05:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ymnd5HNR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B37C10E028;
 Fri, 25 Apr 2025 05:26:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u++i5Jm173xcSAuqIrzTAFWIaduoKz6NnrWWDfOzSh1ZxZ7dp2PvWhB2GXNuqQrw0teAeJqNp/UxfRAQWF0kTZx7f/Poo8cFAVTNAMuPJCJUDgQAmT8T9HZ8t6einBgVKBk97dtdtQLnpzW/oW2hM0FrLj4qmZGpWcUHH/6SwpkKyr8iUZmd3pmrNazee7Jip88JTIjWv7I1Mh4tZl5j3CAAmV+UAi+CvyKavup2Ez/CSp7ESTbR0lIvWghgSmZC1ioH+V3G1NIla2ArVnvpi+BzKMLkKxWzhg5e4zRfinPQzDpIXVm4jI6hB6IBxRl3g2MbWUDZ/nXD/hAHrcKFzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dY6XhF1znbDOwqtQr3xy9iuM9sUgywf+EsWoF4abhEM=;
 b=G29Ju8xcyp0ZnrOS7Ch60FxQFzLLI649VTdt/BEhrSpSNyhB0WQYC36zXC4I8sdkU6H9lRBVc9mIDZakZcPRX2ijNfQvNvQMsJNQrVqhEfc5ag/9hOSIZRvjlvFGupFlmt8uhM5W1QFsQkmXeMaLF1xCseDRJ+DiC+aUPMSrMkq/vmENx7cHhh2HaWfL8iLwaV2t9XS1yDvKo3RHOk562KJdjYch7fum1sKL5tyvWQQIr1ife7P/lxPkGR764NPrlMA+68EQipJrRxMlmZgZ0lbGkvE4Tw4LXKkagJay88ILfN1QzAFPIb/8NB2DFwYBtekVriyEEE1iSeuSGmi4wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dY6XhF1znbDOwqtQr3xy9iuM9sUgywf+EsWoF4abhEM=;
 b=ymnd5HNR1J2LCIsoizwU+hYjznjzHPKgweefeAnKA3YYSTQAL1q5/VfOakBorzDbzs+dQBWNQBnK2XwOr+X6WEeDzsbYiX6WLGFmV6+WfK9nG/pMTVfu09368XK76y/PrJxSUbMJh4fFtlcqj0VjJvhitZ3R218fI/9WW9qSq30=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5052.namprd12.prod.outlook.com (2603:10b6:408:135::19)
 by DM4PR12MB6206.namprd12.prod.outlook.com (2603:10b6:8:a7::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.26; Fri, 25 Apr 2025 05:26:12 +0000
Received: from BN9PR12MB5052.namprd12.prod.outlook.com
 ([fe80::7714:4f80:f3e1:60cf]) by BN9PR12MB5052.namprd12.prod.outlook.com
 ([fe80::7714:4f80:f3e1:60cf%5]) with mapi id 15.20.8632.025; Fri, 25 Apr 2025
 05:26:12 +0000
Subject: Re: [PATCH v9 08/10] drm: get rid of drm_sched_job::id
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tvrtko Ursulin <tursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
 <20250424083834.15518-9-pierre-eric.pelloux-prayer@amd.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
Message-ID: <c8b033a8-229a-1c1c-20ab-6d940f2d6df2@amd.com>
Date: Fri, 25 Apr 2025 10:56:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20250424083834.15518-9-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PN4PR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:277::7) To BN9PR12MB5052.namprd12.prod.outlook.com
 (2603:10b6:408:135::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5052:EE_|DM4PR12MB6206:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d08b35f-0a96-401d-3061-08dd83b9b111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWg1VG5OQmY0eisvbS9NMjZBL1VCbTF0MHNOZ0pJL01CZUwrdFU1Sy85eXpO?=
 =?utf-8?B?YWVFbkJ4d0NvR0RwYkozNFl4QXBIZ2JTTndBSDF0S0RNZmVMbnR5THQySUtE?=
 =?utf-8?B?clFJZWM2Mjd0UDgzUFEvL2R5RDI5aDNCOHVLSHRHQWt2MkxxTHN2UE11V0dp?=
 =?utf-8?B?ZVBXSTVTekNReW9BOUFtWkNsN2pOZWVRVnlqdTlFODk4RGZ4azV4NGxQc3dt?=
 =?utf-8?B?UkZZbkdWNytzaUZacy9yazh2eGV3Rkx5VEhOYnhhNVJCWERCc0FiUm43dUZ2?=
 =?utf-8?B?cmNVNk82R0wxUUJHYkRML2RSRXhZL1lwY1lwRExCUm96QTdOZU1YelNndkQv?=
 =?utf-8?B?YnUyRUZCWlkyVmJUdGs0RHhtRzdUMnBTUjByMVNQL0ZXY25tZXFLeFdZSWNV?=
 =?utf-8?B?YTBCNHZUMkd2MEMxcEQ0NW9iOTNoQUlTTGJxQjQ2dHZPbjN4NXFVNXNUWnRL?=
 =?utf-8?B?ZVpzUjg5ZFdzUmFvRE9TWThkUmM5OUozT1BKcFB4RnJIc01tSmE0NFR5WGFy?=
 =?utf-8?B?aDYyK0FaWTJ2V25jVENMaEQ3NDVKQTdtaWdtckEvWVZUR0tsK3VSeUxLOHoz?=
 =?utf-8?B?ZDBqclVncU5CVGh3WUo1SWd3MmltTjFQT3EzNitjRjU1eUJ6Tm0xZGQ3dmNp?=
 =?utf-8?B?QnRpb01FNGRHTWd5WW1UOVJDUDN6MUpZc2Jvb2tsWEhabmppQzlCTXBXZ05L?=
 =?utf-8?B?elNsK2s2bVl6RXdkaUh6eFlEQ3E3emk1RjR2cHYxUTJJN1J3dDUwNkNhd21t?=
 =?utf-8?B?ekUyV2NPZFkyWitqdXBFcTd1cjJkSDJXa2VyR0FEZFNLbmZuYi80M0hSUnl5?=
 =?utf-8?B?WFlqSlhoalhjY0dxYWNtODNGTzNBOEszQitSTjVLejlzUTJYbzd0YzZ2SzR0?=
 =?utf-8?B?MElMemxjZENzcWdWU2tLS1BXNk5aUnlFRUdmM3FabWl0U0h6dVhVc3ZKU1RK?=
 =?utf-8?B?R3h2elRmNTZtRGFoQklDMVhpMnhiWEVSTmJjU3d2ZUlCbVNYT2Nxb1JCbW9D?=
 =?utf-8?B?Rm9nOHJCbWlTYmxNK0gzVTRUYktkN0NKb2ZrUG5hN1UxSUQyN3ZtcmZ1bGE3?=
 =?utf-8?B?VW9UOEM2OVRKckdIS2NxL1JGVWlqYWdHOVFYMnphaktFZ3RJMVhxRHdOM0J4?=
 =?utf-8?B?a3dsVFpBUHJhR1FyTTBDUDREOVh5Q3B5YTRvS2tlUnp5TW14elpRYlJQdzNj?=
 =?utf-8?B?a3ljL0lFMkJST1FzVFFzWXZROUltWW83RHMwSUpuV3duYVBxN1JWR01KUitL?=
 =?utf-8?B?MzFlUTg0MmFuNDUzZGFqRHJBODM3RmJ1dVkwZS9lTjV3c2txQXE0MjM3RnFy?=
 =?utf-8?B?K3RvZUZUdFBlbTJENzNGZC9CN3k2bWkwU1lpVE1XT2gzT3pxbjQrcVZwVjBp?=
 =?utf-8?B?b2F0MzF0OWtHa3NHOHhLVTlCWDgweC9ZRW9yMUM3WllvNisrb1Z4d1ZIZmEw?=
 =?utf-8?B?Z3M3dTBNTFBSdnpjaE5nTkZKUzUzNDZCdFdnRW5acDJ1Z2wxRGxSWHRWU3Rx?=
 =?utf-8?B?dUkxVWkzeFUwcjVxT08rQ1NsK1pOOGxtWkVrSjZXNUkxMVhBRHlMdzR3M0Jn?=
 =?utf-8?B?dGRiRlVwdkJkaXV4a3ovd1dMTFJ6K2pwR1IzbjJTU3JHbTYzWW9FVm15VERs?=
 =?utf-8?B?cVBZYXNLbitXTVRxQjhEdStnZEMyT0l1SDV6Vk9zWndsTUpKbkRjVzdBVXNB?=
 =?utf-8?B?SmoyamhaZ0M2M1kwUHd5b0lFRkpIMnVBODZBcG5NMTBxZ3UzWE5ZU0g2eEMx?=
 =?utf-8?B?dkdUT2ljTENVRWlHb3N1RU94K2o4Sk9TYy9lRW9wL1dmOGFZejVpOHR3cXR4?=
 =?utf-8?B?YWVpL1lYV0pmNGNMazZqNlRDUDk0RC9tRGRRc0R2YmlITWRFUWUvTUgzQTdI?=
 =?utf-8?B?d1c1Q080a1hQWUNvSXJwNXJOV0NMQU03R3BudmVYdHJsdVJTZWRIZy8wVmJk?=
 =?utf-8?B?OVJ3VTNsZy9VK29zTE8zbHpIL3J0TTR5ZG5TVU5Rc3EvMUFtU05MdkQ5RTNv?=
 =?utf-8?B?Tm5FcWJOY1FRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5052.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlRqeW94M0c5UjlKQ1VqOTFaV1FKajdmeXNQN3Q0OHRmNkg3RStZVXNBMzZK?=
 =?utf-8?B?UUR0Um1RcjY5bUY1UUpTK080WUpLY0xmL1VxR3g1LzFpU0M0UzVzV0QzWSto?=
 =?utf-8?B?dm04N0ZWWDljS0I1K0JzVmlPSUJqRG9aME56WXRCRDNsbHFpa0tSVlgyVHhU?=
 =?utf-8?B?SUljZ1JUZCtpRHJ6enZ5dHE5SThoMnBCYVhIQjNvaEZVVWFBa2xoV2IxeXNa?=
 =?utf-8?B?cVJvTjZqNzl4eGJqcDlGNU1Xam9FTjBaVmNhT1hzS0pnc1REamh1eDBoTnIz?=
 =?utf-8?B?UGVSb2pkS2QwL1lBY0JBS1ZqdTMvR1ZINnEwTEUxUit4WGVWMGF5dUkyZXcz?=
 =?utf-8?B?ZWRXRTNnM203NmZUSCtCN1BLNTJLc2xVS1l0UUE1M29iWURTRVVmbExGbWpW?=
 =?utf-8?B?WGJLSE9VZWhOaVNSQmFGWjRVS0t0L2NNdENJQmxoVG51RG9FM0xsdnpFODhi?=
 =?utf-8?B?dDhDYmtncHhZSzFGTDJFNUVtRGsxK1R2STFWMDRScHk2NS90dkZmVHgxalJm?=
 =?utf-8?B?TjU0OExzdG8yR3l5QTJCYWJHUUZjRStjTjZlUGpGbURGNmNNZ1dOQ0dSMnFP?=
 =?utf-8?B?OVJOekF6bnlINU5aQjMwNVY4c1RqMzJZZVBFNGN4WmdLcnZ5Yzl1M2FuSkZW?=
 =?utf-8?B?QjAvQkNTblFiQU82cWJUeGp6VmlEMUJrajMveklNYWpYUVJtMHVUWUxiSElI?=
 =?utf-8?B?eG0wUWx1TUJqdUlRMlBGZmxnWVhCUmdwb1RjZVdxWGIrU2ZJZnhwYnRicGJN?=
 =?utf-8?B?QTQvZmR1VnFrKzU3Uy9ESG93UGNpU2ZUNmlzSVN1eE1VQTg0QlVGK0hOQmtB?=
 =?utf-8?B?aU9BNnNjNVRUMm1MZWVqZVBCUzI4Q09Sc3FsdUI3ZytoSGYxdWlRUVpSS1NV?=
 =?utf-8?B?aWZiUnV5Rnh5Mm5RYnl0NlZnTldRZ3ZTM0I4M0ZGM3FOaWxlWkd2MDFNM3lO?=
 =?utf-8?B?TXBlZ09DakZobnpOR2lPcTlJTnB6aXJUWXR4NmplM0d5UDV5MU9vZjRBVnE4?=
 =?utf-8?B?SnA4dmRnRHlyWU4yWVlrSVFFUnd2blVSTlVFdjdmS0NGQVFFS2xUK0hpZ2Fp?=
 =?utf-8?B?ZW9lazVEUFVvTzU3aTBTSDRLNElzTkJ1U21zVXA4WVg2VDE1aGs3QW5aa2I4?=
 =?utf-8?B?NWNKWVlXYTE4bkU3d3Z1Kys1cUhRUGVXdTkyL3RKNjZ2RWpRZHlPanJrbUlE?=
 =?utf-8?B?Um11Q2I0S1c1cDZxaU4rS1VyOFU1L1A4QncvMFhpV1hEaXBvSnRWbHJ4cnBk?=
 =?utf-8?B?SldCcFZCSHo4c3VDbGRsTnRsQmpYRXN0TlY4ZzMydWYwR2pVclU5SmFRenlH?=
 =?utf-8?B?S012d1NIYjJaUzJDaHJ3M0tVbmp6d3lzbFdqWWNONEdpd3h2WmZ4dDhqa1pE?=
 =?utf-8?B?eTE4WXFITjUwcDVGa053S3RleUY4aFF3SDlNZzlZQ2JTSnVyQ0lkaVdUbWRN?=
 =?utf-8?B?UytmQ0ZuaVViZkFqcHR4Tm9ieU5qVEVNTUVyN0h0a3ExS3NMUUZaZGNGRTJQ?=
 =?utf-8?B?VncrelIwa2hzOWh3emRIVVFROUpaQjNsZXZCY25jOFZHZ3Arb0JiQ3RFODdw?=
 =?utf-8?B?NmRKOWhHNDk0eTJJYlRZNDh3c2xGL3h3MktHS29xVGVUcnAzVUpxcUpvc2w1?=
 =?utf-8?B?WitYL0xXS0hHcXFwUm5ha3hROHNzdS9neEpkNXl3a0FCVkk4TkJiT3hYTjVt?=
 =?utf-8?B?cnVyV0hyeEFWQkoyT2cwNXVMd1NlTDJybEtEMXZNMjVxS2RKNFJMd1FWWDJ6?=
 =?utf-8?B?bVl3V2pxVE52N3g5QjU5Sjh1WDFsQ1NuaCtuV0tOa0lwWUpMdU9IS0ZJaXpG?=
 =?utf-8?B?R1E0T0pXRVc4K0hPOGlKdDhnUzdPVitodDhZTms5RSs4Q29wVkhQOWlLTDVm?=
 =?utf-8?B?ejJ6RkxWVHROVkppL2tZbWZnT1kxc0UzQnRBd1BJYzdaY3Y1dEo3N2xMVldD?=
 =?utf-8?B?bUw4Nlc3SUtHYWpDVzlWN3JrYUozOUZqSlkvRmlZSlYxWGUvM1Fabnc1OXhF?=
 =?utf-8?B?eHp2NGFxalZxalBNOCtyTHpiV3ByLzBINnU5M0hEdHE3RXZwWUI0WWxSNklx?=
 =?utf-8?B?a09iZE1TclFSRXdaSDNIQmFzWWkxekhDb29mOFdoTWEzNHM1WnRPd0FHc05M?=
 =?utf-8?Q?FQBvs3G1pjlgx5BVBJzZAnVic?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d08b35f-0a96-401d-3061-08dd83b9b111
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5052.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 05:26:12.0974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dv8UXfeTM1lCLq0mN+tqXlHgIwpQJ1opG5HkkkA7fvX/3lFe6vzHAZmTNrVhIuqxbGO6eRxifMvEyF5wunhXjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6206
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

Reviewed-by: Arvind Yadav <Arvind.Yadav@amd.com>

On 4/24/2025 2:08 PM, Pierre-Eric Pelloux-Prayer wrote:
> Its only purpose was for trace events, but jobs can already be
> uniquely identified using their fence.
>
> The downside of using the fence is that it's only available
> after 'drm_sched_job_arm' was called which is true for all trace
> events that used job.id so they can safely switch to using it.
>
> Suggested-by: Tvrtko Ursulin <tursulin@igalia.com>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h      | 18 ++++++------------
>   .../gpu/drm/scheduler/gpu_scheduler_trace.h    | 18 ++++++------------
>   drivers/gpu/drm/scheduler/sched_main.c         |  1 -
>   include/drm/gpu_scheduler.h                    |  3 ---
>   4 files changed, 12 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> index 11dd2e0f7979..4fd810cb5387 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> @@ -167,7 +167,6 @@ TRACE_EVENT(amdgpu_cs_ioctl,
>   	    TP_PROTO(struct amdgpu_job *job),
>   	    TP_ARGS(job),
>   	    TP_STRUCT__entry(
> -			     __field(uint64_t, sched_job_id)
>   			     __string(timeline, AMDGPU_JOB_GET_TIMELINE_NAME(job))
>   			     __field(unsigned int, context)
>   			     __field(unsigned int, seqno)
> @@ -177,15 +176,14 @@ TRACE_EVENT(amdgpu_cs_ioctl,
>   			     ),
>   
>   	    TP_fast_assign(
> -			   __entry->sched_job_id = job->base.id;
>   			   __assign_str(timeline);
>   			   __entry->context = job->base.s_fence->finished.context;
>   			   __entry->seqno = job->base.s_fence->finished.seqno;
>   			   __assign_str(ring);
>   			   __entry->num_ibs = job->num_ibs;
>   			   ),
> -	    TP_printk("sched_job=%llu, timeline=%s, context=%u, seqno=%u, ring_name=%s, num_ibs=%u",
> -		      __entry->sched_job_id, __get_str(timeline), __entry->context,
> +	    TP_printk("timeline=%s, context=%u, seqno=%u, ring_name=%s, num_ibs=%u",
> +		      __get_str(timeline), __entry->context,
>   		      __entry->seqno, __get_str(ring), __entry->num_ibs)
>   );
>   
> @@ -193,7 +191,6 @@ TRACE_EVENT(amdgpu_sched_run_job,
>   	    TP_PROTO(struct amdgpu_job *job),
>   	    TP_ARGS(job),
>   	    TP_STRUCT__entry(
> -			     __field(uint64_t, sched_job_id)
>   			     __string(timeline, AMDGPU_JOB_GET_TIMELINE_NAME(job))
>   			     __field(unsigned int, context)
>   			     __field(unsigned int, seqno)
> @@ -202,15 +199,14 @@ TRACE_EVENT(amdgpu_sched_run_job,
>   			     ),
>   
>   	    TP_fast_assign(
> -			   __entry->sched_job_id = job->base.id;
>   			   __assign_str(timeline);
>   			   __entry->context = job->base.s_fence->finished.context;
>   			   __entry->seqno = job->base.s_fence->finished.seqno;
>   			   __assign_str(ring);
>   			   __entry->num_ibs = job->num_ibs;
>   			   ),
> -	    TP_printk("sched_job=%llu, timeline=%s, context=%u, seqno=%u, ring_name=%s, num_ibs=%u",
> -		      __entry->sched_job_id, __get_str(timeline), __entry->context,
> +	    TP_printk("timeline=%s, context=%u, seqno=%u, ring_name=%s, num_ibs=%u",
> +		      __get_str(timeline), __entry->context,
>   		      __entry->seqno, __get_str(ring), __entry->num_ibs)
>   );
>   
> @@ -551,7 +547,6 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,
>   	    TP_ARGS(sched_job, fence),
>   	    TP_STRUCT__entry(
>   			     __string(ring, sched_job->base.sched->name)
> -			     __field(uint64_t, id)
>   			     __field(struct dma_fence *, fence)
>   			     __field(uint64_t, ctx)
>   			     __field(unsigned, seqno)
> @@ -559,13 +554,12 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,
>   
>   	    TP_fast_assign(
>   			   __assign_str(ring);
> -			   __entry->id = sched_job->base.id;
>   			   __entry->fence = fence;
>   			   __entry->ctx = fence->context;
>   			   __entry->seqno = fence->seqno;
>   			   ),
> -	    TP_printk("job ring=%s, id=%llu, need pipe sync to fence=%p, context=%llu, seq=%u",
> -		      __get_str(ring), __entry->id,
> +	    TP_printk("job ring=%s need pipe sync to fence=%p, context=%llu, seq=%u",
> +		      __get_str(ring),
>   		      __entry->fence, __entry->ctx,
>   		      __entry->seqno)
>   );
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index 4ce53e493fef..781b20349389 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -36,7 +36,6 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>   	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
>   	    TP_ARGS(sched_job, entity),
>   	    TP_STRUCT__entry(
> -			     __field(uint64_t, id)
>   			     __string(name, sched_job->sched->name)
>   			     __field(u32, job_count)
>   			     __field(int, hw_job_count)
> @@ -47,7 +46,6 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>   			     ),
>   
>   	    TP_fast_assign(
> -			   __entry->id = sched_job->id;
>   			   __assign_str(name);
>   			   __entry->job_count = spsc_queue_count(&entity->job_queue);
>   			   __entry->hw_job_count = atomic_read(
> @@ -57,8 +55,8 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>   			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
>   			   __entry->client_id = sched_job->s_fence->drm_client_id;
>   			   ),
> -	    TP_printk("dev=%s, id=%llu, fence=%llu:%llu, ring=%s, job count:%u, hw job count:%d, client_id:%llu",
> -		      __get_str(dev), __entry->id,
> +	    TP_printk("dev=%s, fence=%llu:%llu, ring=%s, job count:%u, hw job count:%d, client_id:%llu",
> +		      __get_str(dev),
>   		      __entry->fence_context, __entry->fence_seqno, __get_str(name),
>   		      __entry->job_count, __entry->hw_job_count, __entry->client_id)
>   );
> @@ -95,7 +93,6 @@ TRACE_EVENT(drm_sched_job_add_dep,
>   	TP_STRUCT__entry(
>   		    __field(u64, fence_context)
>   		    __field(u64, fence_seqno)
> -		    __field(u64, id)
>   		    __field(u64, ctx)
>   		    __field(u64, seqno)
>   		    ),
> @@ -103,12 +100,11 @@ TRACE_EVENT(drm_sched_job_add_dep,
>   	TP_fast_assign(
>   		    __entry->fence_context = sched_job->s_fence->finished.context;
>   		    __entry->fence_seqno = sched_job->s_fence->finished.seqno;
> -		    __entry->id = sched_job->id;
>   		    __entry->ctx = fence->context;
>   		    __entry->seqno = fence->seqno;
>   		    ),
> -	TP_printk("fence=%llu:%llu, id=%llu depends on fence=%llu:%llu",
> -		  __entry->fence_context, __entry->fence_seqno, __entry->id,
> +	TP_printk("fence=%llu:%llu depends on fence=%llu:%llu",
> +		  __entry->fence_context, __entry->fence_seqno,
>   		  __entry->ctx, __entry->seqno)
>   );
>   
> @@ -118,7 +114,6 @@ TRACE_EVENT(drm_sched_job_unschedulable,
>   	    TP_STRUCT__entry(
>   			     __field(u64, fence_context)
>   			     __field(u64, fence_seqno)
> -			     __field(uint64_t, id)
>   			     __field(u64, ctx)
>   			     __field(u64, seqno)
>   			     ),
> @@ -126,12 +121,11 @@ TRACE_EVENT(drm_sched_job_unschedulable,
>   	    TP_fast_assign(
>   			   __entry->fence_context = sched_job->s_fence->finished.context;
>   			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
> -			   __entry->id = sched_job->id;
>   			   __entry->ctx = fence->context;
>   			   __entry->seqno = fence->seqno;
>   			   ),
> -	    TP_printk("fence=%llu:%llu, id=%llu depends on unsignalled fence=%llu:%llu",
> -		      __entry->fence_context, __entry->fence_seqno, __entry->id,
> +	    TP_printk("fence=%llu:%llu depends on unsignalled fence=%llu:%llu",
> +		      __entry->fence_context, __entry->fence_seqno,
>   		      __entry->ctx, __entry->seqno)
>   );
>   
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 195b5f891068..dafda1803c7c 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -852,7 +852,6 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>   
>   	job->sched = sched;
>   	job->s_priority = entity->priority;
> -	job->id = atomic64_inc_return(&sched->job_id_count);
>   
>   	drm_sched_fence_init(job->s_fence, job->entity);
>   }
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 6fe3b4c0cffb..48190fdf661a 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -326,7 +326,6 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
>    * @finish_cb: the callback for the finished fence.
>    * @credits: the number of credits this job contributes to the scheduler
>    * @work: Helper to reschedule job kill to different context.
> - * @id: a unique id assigned to each job scheduled on the scheduler.
>    * @karma: increment on every hang caused by this job. If this exceeds the hang
>    *         limit of the scheduler then the job is marked guilty and will not
>    *         be scheduled further.
> @@ -339,8 +338,6 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
>    * to schedule the job.
>    */
>   struct drm_sched_job {
> -	u64				id;
> -
>   	/**
>   	 * @submit_ts:
>   	 *
