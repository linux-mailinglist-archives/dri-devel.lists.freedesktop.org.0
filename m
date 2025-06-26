Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDADAE9FC8
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 16:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C2610E0A1;
	Thu, 26 Jun 2025 14:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VlnU+08n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77AF10E0A1;
 Thu, 26 Jun 2025 14:05:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DUvRU8Is1IfwMK1ZF8j79krgr2PHWD4n/kqrcCGnkEtR3D+wJ2AjYMXi/iHnFoe5WPhq2q+yl3sYzgzWx2S0/83EFz01iduP6u6dkwvlt7keFn61kuMETW+eTbDEZWpuBs6BeCvoJVzh0xQ9JN2nui8dyUfn2bEwYkzoqOJvy8kxabHcPOkbjo12bApIxxg6l6gc3WtjXZn5Z5unWPsyYIp1RIDn5sDmCD1tUc978bQsrodDO1sfpoJqP2+Htcx5BCH8vSkl0GIgcL2rAds+oEGByeYwPFIx8LznOpbNrLCPk8VnnbNUhhGitxfmBBxTvzaOoc2KMjQ3m6UF1SqutA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vh/OpkVfNfkWp1n5nIF/RiXOh6b3BCGJ8NdLdj1jJaY=;
 b=zA2UG6cKRD6cC9ulbOrb0aREu8hTuYsKpSZ/p586aA1VX7t0BWuffF8oB574VqlXdWx0JjilvOsDAKP5BjzaneJ359eNw6pYCCYAEXufJYVgrQeqF4UftC3hPK2GaC1PLI1WqJeA4gWS3M92k5t/MJQ5Mddwn0Q2m1Rag22L0gM2Q8f36YZ6dJZiqNOqyTvReleCP/BH8TdAcyx3AxISKnjaL7n8T0JD5dPInR0x2ZYqingPn4QHuxJ5JGCxN2ka1ZqXW4bNvaRqcYt2XV0X0mVavZMRJcQbfLLEy8kI/7UjGYrAPhpkaocZSHrwVWCg3l0mp2wATnLzvODqiDxrNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vh/OpkVfNfkWp1n5nIF/RiXOh6b3BCGJ8NdLdj1jJaY=;
 b=VlnU+08nm8d9OZyP8a0otiy/397uH+pUGIkBn222jG6ATE+NYR1G0A8rOv7MsVOZvsezHz5h/zPkSdZScvpiulRDxr8RKuJ8XbJQFsQOysOdYpsbfIMDhyU9DZNJPEDQ6r5hh7YQ2vqkPbcVybhm+DKGUMJHH+FXb6hXaQdo/H0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6531.namprd12.prod.outlook.com (2603:10b6:208:3a4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Thu, 26 Jun
 2025 14:05:02 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 14:05:02 +0000
Message-ID: <be21bc76-8ad0-4ffd-832e-e50e9e31a903@amd.com>
Date: Thu, 26 Jun 2025 16:04:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] drm: add debugfs support on per client-id basis
To: "Khatri, Sunil" <sukhatri@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org
References: <20250624113454.2322935-1-sunil.khatri@amd.com>
 <20250624113454.2322935-3-sunil.khatri@amd.com>
 <12f39316-9ef2-4448-a1eb-1fba9da5c8e3@amd.com>
 <568e519a-a3fa-4da0-b8b4-6ac3df19947f@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <568e519a-a3fa-4da0-b8b4-6ac3df19947f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR0102CA0004.prod.exchangelabs.com
 (2603:10b6:207:18::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eaf4ace-6aff-408b-a501-08ddb4ba716f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUtYcFRhTWR3MTFIenJmTEFLeHFXT0kwSkFyWFRXVmlsdU1QdEpENHZvVml4?=
 =?utf-8?B?bmFsTVhLQUdsZSt6RUpucktlUjJnVnRCNFdSamtiZm1vakY0WVZGZCtWOFJs?=
 =?utf-8?B?V3crY2l5M2thQ0draDdXWUVOSVRNU241Y1hRRUNOTTF1cXZZTVJsZTcwMTRX?=
 =?utf-8?B?VHZSSnl4djlsS0pQcFZTOC92d2JPVUI5SWx4NGNDY3lUSjRvU2wvU2oyS2Na?=
 =?utf-8?B?VDdQZ1ZvamdHZEt4OUMrNE5MbzJ3SXNlV2NTNU8zNGN0L3V5MEZvczhURitO?=
 =?utf-8?B?TjJZelh6OUhqZEliNCtmZkl1L1hwa24wYm44ZkVkS1dlc1NpYmUvZGxRbG9W?=
 =?utf-8?B?R3Ztd3dFemlyZ1BuM0RBcjMydkhZR1pYUHU4ZDl6WFJOWVMwY2NVMGdXTTdz?=
 =?utf-8?B?UUZRY3NIaFQ4UTNTSVBqbW9EM2VMTXJoQjEzWkZTamI2UzA3QzFNblJKZWJP?=
 =?utf-8?B?dHVZTUJiNDNvT2JIZjdWSllEVjlXdDAwMjI4TmdqN3RMcjNUcWY4dWJ2c3pQ?=
 =?utf-8?B?MHNhT1pHN0x3VjFuclVkL3M0cVFSMUFGTFEwVDk1WWo3VE5zWGVWVVkrQ1lq?=
 =?utf-8?B?QmJEWkwzN2J4ZG4wd2t5dllQdDMxVFhWdzdaeHJaZjV3RmU2TEpCajVuOGpM?=
 =?utf-8?B?bjA2aWFRRzJXeGZxL2ZmbkIxZ3c4WGxJRzc4cjM4U21vZXJ6emNmbXh0Q3ZM?=
 =?utf-8?B?VWI3U2R2RXQwby9HSEJsWXVYdElaWEMybWtQOVhhMmNxOCtwcXU2QXUvczdS?=
 =?utf-8?B?bHpVWmlUWGlhREFMaW5jWjFCNWYvdFNOeFhPY09WNjN5RVc0VS9aZWhrY0Ex?=
 =?utf-8?B?aXV5YTJXRnpuaU5Oc0xUaXN4U2JGZ01hNHpWTTJvaUZkdVBmRm1CcStMM0hz?=
 =?utf-8?B?dXJiaXlZbE9TVklYNCtlT0F0c1RQbHZ3S3cvbGI4dEdmQ01tTWdEVEk5NlhJ?=
 =?utf-8?B?OWJRTjBRZlR4MXhBUm9tdGZLSHpwc0U5MGVqUUttL1dqamJmaXp4R2V5OEIr?=
 =?utf-8?B?aFV0V0phWHFyTk8zS3l5UjZKYkV1U1BrZDBvSDBITk9UaDZzcHkraUdLRVJB?=
 =?utf-8?B?NGxrTldtc1psQTUyS0hLbTJwOEpsMkRmdy9ZR3BHemFtRThCeldwYWRZbHNX?=
 =?utf-8?B?Qmhqamx0QjhDT2VlaVNuVFl6YjYxcjFkVTQzWEFPZng4dmpUNXNkd241dzFP?=
 =?utf-8?B?Z0x0QVkrSWJ4aVZUOXk5NVBkMXpvbnFSWmRRdUdWbEdERzBzVmZjaEVVR0JH?=
 =?utf-8?B?VlE3ekpjSnlPWlEyM1hKc2hIMlhXYmdxcHpoRjNMR0Q1ZVc2ZmEwSzlRejY5?=
 =?utf-8?B?cmdRZVlTSDZKL3dvRVR4ZEVpb1JBMnpvcmZ2bHYrWEhRZVhxZ1lHR0dZZnFx?=
 =?utf-8?B?M3RLVTU2K3dkazAwaE5Mdy9GYnR0MGtTY0pjRFNsOVRYelFoNVpJSVh3cXRF?=
 =?utf-8?B?WGNuNGlSaFZUTGVHeURBbE1ORk9pN2RHblhHeEpjWEx3NzdTOXpCNDB6NVow?=
 =?utf-8?B?M1J4N3AvU2huM1YweWMrUkxEL0svUEZFK1JqdUl5TmVDcjRxVUo2Z3VRc2ox?=
 =?utf-8?B?Z1ZMWTdNdjIyd0RhV3M4bjFScUdxWXVIUVVkZEovN1JPNzZFQ1ZhNXpBVWdp?=
 =?utf-8?B?Z3BUR05yVlJPQWlITGhBM2hiVm4xOUR1OTNuSUxvOGljeU1iQzN3NkpGNzRm?=
 =?utf-8?B?ZVdQWG1mMHZPSnFZRE1wL2U5OExxcE9MMWFieUR4a0N3bGQrN01HSEdydzJO?=
 =?utf-8?B?djNYZDg2bWFDTnJzbENuT01oZzRiRFFNK3B4ZDVBNnBKUGtxZmgxV1kwWVFK?=
 =?utf-8?B?a3dwVGNKam5EQTZkVDk1a0xHQXNGME9MUVIwYzR4bm93KzNOZnh6RUptVWUy?=
 =?utf-8?B?bTVnVGhhNEE4TmtBZWsvQ05Waml0eEpIT0thVmtFV1hlSmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a250L2lpQkN0aUxna09DL0IxalptTFNUdkpsREZNcnlja1VvNjN2RU1WUnFo?=
 =?utf-8?B?ejJXQlZLa0V3QklrMzk0UjlVUTlXZmhkcFRieldPWWFkU015WnJsanRrUmRi?=
 =?utf-8?B?UXlBS1VPRGlpTDhyNldRNTdsb3FkajV4TWZTSVdCNkxVQW9zamwrc2kxTUdh?=
 =?utf-8?B?NGI3UWZhT1BqMFF5L1hmM1hKcnpSa1d4MEw2bUZ0K0pNUFVTRS9JVUFERkZV?=
 =?utf-8?B?Q0NWQ0VvOUxGellDYUUwZnZBZFBTN1ZNcXdnWUFtZzhkVFA2YWNRN3ZhZ3hi?=
 =?utf-8?B?ZlBIYzlIOGQrK2ZtSXlwVHpZSHF5a24wTkNZM0dZSmwzNWFxZUZ3bU9LR3Mx?=
 =?utf-8?B?dHcrN2RyMkJkYUlPTnc0OWRVZ0w1T2l4ZWZKNW45Z0RPTzgrYm4yNEZwVEU1?=
 =?utf-8?B?a3A1SlFTYnFRYTZ1bW9hdC9sTHExdE51SWZaNUVUSDZLMFczcGFVTWllc1JR?=
 =?utf-8?B?K1AvWVQzclV4NGdxV0tSd3lGRjJYeHBsaG9VL0l1L3ZST21Lc2x4NHNoSC92?=
 =?utf-8?B?S1JhZCsrdjgzVkxLUGUrNzYrMkVIMHVqd3JVb1AxK3FBZ0pEdytDQTVYT1hq?=
 =?utf-8?B?TkJWT2dYMy9FaStBKzI0WE0yUnlGRWRCZHlTOE13RTFGWGVqaG81K2VwN0xw?=
 =?utf-8?B?QXd2MmJJUkNJWG1aQkRUWEE4cGhIdWs0SlBGaVhmMmdpVy9mdlhXR1ZZOUNC?=
 =?utf-8?B?UGpidHU5YkRLbWRsS1JTWVZadEVWbWtIZ21RS2ZQMnhrN3g0MTVhaFVxSjBB?=
 =?utf-8?B?Wlo5aWkzb2JMdncyT280cWo5ZTFVY2pYb1B1TVFzVkVqL2lQQ0V6Mm8yaUxR?=
 =?utf-8?B?eDMxRm5iSTA1Z3BPUEpXWnJCYnpUanNyVTMvY3NadFVIaW1LaTRHbVhRdTBW?=
 =?utf-8?B?NkJVTy9XbzNXUEpyUkZEYmJQd1VSZ2RSd2JEZUlGU1puNW1Xa2pGdlVmd3NZ?=
 =?utf-8?B?M1NlamFTNzduUUdKYm05SGp3TjY1bFJBbnI4OWVoek5sWG9obVEySElNc3dy?=
 =?utf-8?B?MzZ6WUxLNm5jdVo1NGp1MC96bGtmc0xwb3dna3pGSC9CMlpLcVJISEJ3a1hT?=
 =?utf-8?B?bW5yUWFtZ3lCeDhwUlpoSmczVHU5QUxPOUZ5eUJwTVJOWDZTVkJmcmJGR3Ir?=
 =?utf-8?B?NytHRHZQOFVxY2diMkxVL1JpNERYUkN0MFVCNU1VeUZSZk05cjZVMWQzRUpO?=
 =?utf-8?B?TFBBZldadml1OGxNNW5mSmg5Y3ZiSXBJWHNKZ052ODFFbEcyYlFjOE4xN0hy?=
 =?utf-8?B?RlVKZzhtOWp5cXR5VXhyU2hUR3psRGRySVhpTlp6RFd5WDg3Z3FhUVJJcUZz?=
 =?utf-8?B?VytHcHUvbmRDNVVHWDdSWDJBWmZUeFlGek9EMmVGUHNlSGY1MGxIL2o3V2xP?=
 =?utf-8?B?RnNFY1JoRVdaa0pOWldCZmU3QXQ5N2JEWkxiMm9zNGlTb28zdm5xT2RYZEZP?=
 =?utf-8?B?V0ZWRll6andvbHBpUFZqWHYwR3IyTnNsa1BOOG4yMm1jNDh5YVEzV2g3aC9H?=
 =?utf-8?B?ckhNTUsvem9KRGdQT2pLUy83MTl3NDM1N3k5bkdwTTRHZm1hcU5hcEkwcUpG?=
 =?utf-8?B?YUkwSHQyclhvQ0owS1JWTEhOOXlZMjZqL1YxanArR2VER1Z6eEpxc3ZnNzgx?=
 =?utf-8?B?aTFNSno3aG9UOHZrdjFFUEEzcmU5K0ZWSzNpQXZMQVh2RjYzOGxlMndaTFF3?=
 =?utf-8?B?eFgrUkMyYm5QVHUzR2p6WEtzdFlGY2pxR09ZMG1Ya0pvQUt5ditWTVd4OG1h?=
 =?utf-8?B?K2t0ek9IMlBCOTVYOXBLTUNXRnhqbmZlaWZmN1FVQ3BTWGg1Sm92UVNrZXZS?=
 =?utf-8?B?VHh0b1N0em5jQk9seksxenpJeHNMZVhzdzRqeFNJdWFDczRsclljeDFwUUVx?=
 =?utf-8?B?YkYyd09ibUNZcnlQQzBQelFFbng5Y3VYNCtHTTlqbncxbXk0UVZPUWY0Tm80?=
 =?utf-8?B?T1J2QlZ4SXdsSmRNcjJMMkxUM1hMblZabmZRcGpnVEoxYTNjV0xOaTZjSEww?=
 =?utf-8?B?Q0dZMlhpR0dENEFIajhkMGF0YnBPdnJFTGNGd093V2NmcThydkpsTjhTUGd5?=
 =?utf-8?B?bUJQeVB5MHdGWHBjSXJkc01HRFAwOWN5WFp1eDZzVlVsMEI0OEVaOWdKTHZZ?=
 =?utf-8?Q?rv8j5OwFQU8Dw+9PIwAosTvEp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eaf4ace-6aff-408b-a501-08ddb4ba716f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 14:05:01.8587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: skWzJAMk+I/diV1M7Ls4kyimslgOQ3mdgZLo3oKALznAa98wUfms7sNpKX/RHXZ2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6531
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

On 26.06.25 15:48, Khatri, Sunil wrote:
> 
> On 6/26/2025 5:34 PM, Christian König wrote:
>> On 24.06.25 13:34, Sunil Khatri wrote:
>>> add support to add a directory for each client-id
>>> with root at the dri level. Since the clients are
>>> unique and not just related to one single drm device,
>>> so it makes more sense to add all the client based
>>> nodes with root as dri.
>>>
>>> Also create a symlink back to the parent drm device
>>> from each client.
>>>
>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>> ---
>>>  drivers/gpu/drm/drm_debugfs.c | 26 ++++++++++++++++++++++++++
>>>  drivers/gpu/drm/drm_file.c    |  6 ++++++
>>>  include/drm/drm_debugfs.h     | 11 +++++++++++
>>>  include/drm/drm_file.h        |  7 +++++++
>>>  4 files changed, 50 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
>>> index a227903c29c4..ebdf60665b86 100644
>>> --- a/drivers/gpu/drm/drm_debugfs.c
>>> +++ b/drivers/gpu/drm/drm_debugfs.c
>>> @@ -309,6 +309,32 @@ void drm_debugfs_remove_accel_root(void)
>>>  	debugfs_remove(accel_debugfs_root);
>>>  }
>>>  
>>> +void drm_debugfs_clients_add(struct drm_file *file)
>>> +{
>>> +	char *client;
>>> +
>>> +	client = kasprintf(GFP_KERNEL, "client-%llu", file->client_id);
>>> +	if (!client)
>>> +		return;
>>> +
>>> +	/* Create a debugfs directory for the client in root on drm debugfs */
>>> +	file->debugfs_client = debugfs_create_dir(client, drm_debugfs_root);
>>> +	kfree(client);
>>> +
>>> +	client = kasprintf(GFP_KERNEL, "../%s", file->minor->dev->unique);
>>> +	if (!client)
>>> +		return;
>>> +
>>> +	/* Create a link from client_id to the drm device this client id belongs to */
>>> +	debugfs_create_symlink("device", file->debugfs_client, client);
>> Mhm, that won't work for accel devices. How should we fix that?
> 
> All the clients we are creating is doing for the dri clients only and not for accel driver, Since the root itself is different for accel it cant be in dri and we could leave that for accel driver to take care if they need client
> directory for something or this we could pick later if there is a need.
> 
> In the mean while what we can do in the drm_alloc/drm_free is to add an extra condition to check if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL)) or not. and create and remove client onyl for !accel
> if(!drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
>                 drm_debugfs_clients_add(file); and
> if(!drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
>                 drm_debugfs_clients_remove(file);

Works for me.

Regards,
Christian.

> 
> 
>>> +	kfree(client);
>>> +}
>>> +
>>> +void drm_debugfs_clients_remove(struct drm_file *file)
>>> +{
>>> +	debugfs_remove_recursive(file->debugfs_client);
>>> +	file->debugfs_client = NULL;
>>> +}
>>>  
>>>  /**
>>>   * drm_debugfs_dev_init - create debugfs directory for the device
>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>> index 06ba6dcbf5ae..17b803ab119e 100644
>>> --- a/drivers/gpu/drm/drm_file.c
>>> +++ b/drivers/gpu/drm/drm_file.c
>>> @@ -45,6 +45,7 @@
>>>  #include <drm/drm_file.h>
>>>  #include <drm/drm_gem.h>
>>>  #include <drm/drm_print.h>
>>> +#include <drm/drm_debugfs.h>
>>>  
>>>  #include "drm_crtc_internal.h"
>>>  #include "drm_internal.h"
>>> @@ -167,6 +168,8 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>>>  
>>>  	drm_prime_init_file_private(&file->prime);
>>>  
>>> +	drm_debugfs_clients_add(file);
>>> +
>>>  	if (dev->driver->open) {
>>>  		ret = dev->driver->open(dev, file);
>>>  		if (ret < 0)
>>> @@ -181,6 +184,8 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>>>  		drm_syncobj_release(file);
>>>  	if (drm_core_check_feature(dev, DRIVER_GEM))
>>>  		drm_gem_release(dev, file);
>>> +
>>> +	drm_debugfs_clients_remove(file);
>>>  	put_pid(rcu_access_pointer(file->pid));
>>>  	kfree(file);
>>>  
>>> @@ -236,6 +241,7 @@ void drm_file_free(struct drm_file *file)
>>>  		     atomic_read(&dev->open_count));
>>>  
>>>  	drm_events_release(file);
>>> +	drm_debugfs_clients_remove(file);
>> That most likely needs to come even before releasing the events.
> 
> Sure will move it before events_release.
> 
> Regards
> Sunil Khatri
> 
>> Regards,
>> Christian.
>>
>>>  
>>>  	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
>>>  		drm_fb_release(file);
>>> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
>>> index cf06cee4343f..2b3767ad8f5d 100644
>>> --- a/include/drm/drm_debugfs.h
>>> +++ b/include/drm/drm_debugfs.h
>>> @@ -153,6 +153,9 @@ void drm_debugfs_add_files(struct drm_device *dev,
>>>  
>>>  int drm_debugfs_gpuva_info(struct seq_file *m,
>>>  			   struct drm_gpuvm *gpuvm);
>>> +
>>> +void drm_debugfs_clients_add(struct drm_file *file);
>>> +void drm_debugfs_clients_remove(struct drm_file *file);
>>>  #else
>>>  static inline void drm_debugfs_create_files(const struct drm_info_list *files,
>>>  					    int count, struct dentry *root,
>>> @@ -181,6 +184,14 @@ static inline int drm_debugfs_gpuva_info(struct seq_file *m,
>>>  {
>>>  	return 0;
>>>  }
>>> +
>>> +static void drm_debugfs_clients_add(struct drm_file *file)
>>> +{
>>> +}
>>> +
>>> +static void drm_debugfs_clients_remove(struct drm_file *file)
>>> +{
>>> +}
>>>  #endif
>>>  
>>>  #endif /* _DRM_DEBUGFS_H_ */
>>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>> index 5c3b2aa3e69d..eab7546aad79 100644
>>> --- a/include/drm/drm_file.h
>>> +++ b/include/drm/drm_file.h
>>> @@ -400,6 +400,13 @@ struct drm_file {
>>>  	 * @client_name_lock: Protects @client_name.
>>>  	 */
>>>  	struct mutex client_name_lock;
>>> +
>>> +	/**
>>> +	 * @debugfs_client:
>>> +	 *
>>> +	 * debugfs directory for each client under a drm node.
>>> +	 */
>>> +	struct dentry *debugfs_client;
>>>  };
>>>  
>>>  /**

