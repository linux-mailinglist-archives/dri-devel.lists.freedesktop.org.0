Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DF4AF59B3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 15:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FBB10E710;
	Wed,  2 Jul 2025 13:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tRdxOsu7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E410F10E710;
 Wed,  2 Jul 2025 13:42:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HcWNZ8R+JEH+Gqf2PJ4TATI7S6ev9/t0HaxHh6FA+5htnDvdNfnbzbgrSn7OiT7lQNzT4Fehdbl6O+sYJIgoPCc8TP1EnlJjpSc59NHkHFAWvLLyMa9/7dMxsRhSBMVonYiGCGPa+jHAppP6HtkvIZaxgXMSWdzz5Cd+/olgNjPvFRoPcCekh1junLUC/Rgvc6lNEdql4XSNtoguxD1UKZaGxDiyT9wTIakrALsAK4HYJRJOcz2NQS8hOxD7G/n0h8yYUFajAbxJAO8WFwibSUvB6O++W3AndI4T765HigP+E5YubrdFHcaoF1JPrmnzARuougvrq3+7zzTncdZntQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qza4IhKR+joplv1+F+VJ+FHlih+mDpPCA2dTztFRk0s=;
 b=i4Z+klIMKQ6Hp1cEyO4ghVMroFuPFqVOx/IlSt4bZO1IOcVtbry3dGAXpcNwoE3VzM5S6ChkyTF4WvB+cVWfqLwQWWIpvHOk8qwGAYlmiRn9RO+ld8jyCgsJxZVV5RVTu00adSDMXrSrRGug7BcL14elz6S3OSBCxo/to6bBde6qDDrZ/QyY8ePAux7zsophwCS2IqiqFMZcfF4vu8QfHvzRADiNF+ZgsjLzkOn6/JhovHkS7pSR/cuQ0Zfs68E318y1WnVChanlRRfojz6gvyrbnYQW1YaPkSKxjBchc+3oPG6PUZs9jyEvh7PfeMp+Yppuj7X5khJMmGOHHRgF7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qza4IhKR+joplv1+F+VJ+FHlih+mDpPCA2dTztFRk0s=;
 b=tRdxOsu7DjJ5+XQi5tv+xzIgy+MLW/wVBCm71Pprp8gjJX1EEUbiEql57RLsNwX1wjhUGCRaja3RCfM1LQkGR5GKVwA/Lb1QJhTA6hNAkrmF7SMSEvi7ZYA+zIRdhJ1Y8oUpbbZG4o5SgmdDKmgNzWaLgThdxE06SDcvClsPFCc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYYPR12MB8892.namprd12.prod.outlook.com (2603:10b6:930:be::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Wed, 2 Jul
 2025 13:42:02 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 13:42:01 +0000
Message-ID: <dda50b9d-1348-4fce-a513-c20e6223d58f@amd.com>
Date: Wed, 2 Jul 2025 15:41:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/amdgpu: Dirty cleared blocks on free
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, matthew.brost@intel.com
Cc: alexander.deucher@amd.com, stable@vger.kernel.org
References: <20250701190822.5272-1-Arunpravin.PaneerSelvam@amd.com>
 <39ff4d7d-d8eb-4c2d-9330-2bb8a5a04964@amd.com>
 <eebf740c-2a96-434a-a114-2d168f51f774@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <eebf740c-2a96-434a-a114-2d168f51f774@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR22CA0020.namprd22.prod.outlook.com
 (2603:10b6:208:238::25) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYYPR12MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: f7c87b39-9ba2-4f26-2d63-08ddb96e3954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clBPamQzU0NLS0NoNW8xQ2Z2OGhOL0RsYW1VR29JekNxRUVEYm1tTU43VXd4?=
 =?utf-8?B?TncwaVRJeWhRU09yMDZuL3N5cmg0b09IOXdDZThxM1l1RUxwSC84MkRwNFhs?=
 =?utf-8?B?QTRXZGFGV0hjT2NqL2I0ckZ2T3RqaG5NMnNIRmFjcm1NSWNzNzhHb3NwVkVL?=
 =?utf-8?B?QkJNd3FXdkxlSEhVMDdkOXlXTGdpVmNBWE9YUDk0SXpXaTJGcyt3Z0lrTm50?=
 =?utf-8?B?RFk3ZzNSYTRXSk0xeS82cjZ6OGFkYzBCSzVnbWc0TnN6UDZRckZtSzFDQlhv?=
 =?utf-8?B?clZHV1JjeXJ1Tk1EeUs1cE1jSG5kL1RjZkpLcjI3bzVQMktWMi9zQUt2VG1I?=
 =?utf-8?B?TUlCdERHbm9SUDlQVVlFV0lnVTRuSDQ4TGVBa0pxNmNpdExQcjdZNitkakJ1?=
 =?utf-8?B?ZFpEc1pncHdPa0hmcUxPL0ZoUGlYb3dTMkZ5dXpTNzJUY2ZnaEtFV0o5Ukda?=
 =?utf-8?B?RTBpK1UzamhSZUpPZ09HU0VQTEVTNm43QnJZallub0lFWmVQV1Y2WUVxaGJZ?=
 =?utf-8?B?UWM3cEtUU0QvSWx5TXp6RjRTNWhic0d1SG8wcThCenpOWllnbUxLSlNmMEs2?=
 =?utf-8?B?ME5Za1p4VVVXM2hyM1ZFejhxNWQ2WkVTdmNJTjFXaFBIbFppS2xZaWpGbW4z?=
 =?utf-8?B?UGo1SDRUNEYyTzJON2Q0S0Fxb1pZM2I0VmtDTll1NzdncVgzeDhpRCtWT0wy?=
 =?utf-8?B?SUhWVFpHTnpZMmJoRzhBTndMTlBYa3l6bU1OZk92YmFHcjY2VWNJK2pEbU0y?=
 =?utf-8?B?ZGdpM1lkVlVpR2ZlWmVpd3YzdTBhUnpwLzlSc3F2dHlCdi9LaHBtUjZkRUND?=
 =?utf-8?B?bXQ5MDdzUHZmaHBIZ25FQzVCSmx3UTZGTVU1eGF6TkFYeHEzSmNJUlJCSWFG?=
 =?utf-8?B?QVIreWROS3hsdEplUUFxUktyOE5McDJPV3U0eHhIRTJtRW8wZEtXeE55bHhJ?=
 =?utf-8?B?M0FOajJJazBsMVM5QjRTNVBJYVZUb1AyblhtYkZ4NWxRVDVvV21SdmE0V0dD?=
 =?utf-8?B?bmoxY1FCcUk3SmtyejN1NjUzVkdOOUNYMlFnZ3NBQlcxZ1dWS29nWlcvZkwr?=
 =?utf-8?B?b2kzVmc3bzRDaEdlb3ZSTnZRVDArcWFzY2VwREdxdG9RVXRWYVV2VFlmbXRJ?=
 =?utf-8?B?eEFWRGhWUXZidVpadFRPaFR4a2NEQ2pySVplZ0JOOUdYcXNpZE1wWVI5bkJn?=
 =?utf-8?B?TTlFdEtkTjlmdHV4SmM4RmU0bzZzUEIyUmpJM3dnOUlpWElJdFZvVlJsSnRu?=
 =?utf-8?B?WFllRTlKT3ltL1ZhK0o1eEVBUGxTRno2T2RJdzQxL2dWY0s3aTFZQWYrQ2Iy?=
 =?utf-8?B?ZHVlc0dxYndQUmtBdWZEbU44c0tBQmFaRFQwWE5HNDNMY1I4cTlLUU5iVC9W?=
 =?utf-8?B?WEFLdnc0d05MTXgzREZaS2h5UGNnZDI0MlNMUGh6b1lRR3I1aHRlUmUxb0Rm?=
 =?utf-8?B?cFZQbnE4b2hObHpjTmxvZE91SWFhb3Y1Y1VwVUdRaS9INFI4TWdpQzlSSXJt?=
 =?utf-8?B?RzErbjJwRWhrbExjNUw5dXgvTlR4dk9mQmNScWZZMkxQbHlDMlVuMUg3elhk?=
 =?utf-8?B?RDdoRTZ4cWxrbXEwcFNmbnZZMHRJTFE1YmE1YWwyNExUUmMxQVoyeWl4NmpX?=
 =?utf-8?B?Rmw0NjZSdVJwYkxaQndtRC9HeHBEM09QZ2hwOWxkdTZFVlM1ajg5SUF3TlhD?=
 =?utf-8?B?eGZYUHBSVFdNZmNuRnV6ZVI3SHBKSTVFSE5aSXpscmo2MzMrb3Z4ck9TVith?=
 =?utf-8?B?V09sdTlMbHIxRnBrZnhLY1VsZzZ5ejFjV3dGWFRnTXNjTGhuYkJFRFBvYzRS?=
 =?utf-8?B?VUphS2FERlRSbHkreGlNL0pZRXpjYjFOcDVYd0tnMmUxU2FMV2FtZVpMVEUz?=
 =?utf-8?B?UGQ4VnZ0bEdhcjljYlphYzdCcU14clFNTVFUWDBkQTJuNE9CRzBtVzFCaURB?=
 =?utf-8?Q?8YBLnMKgkdE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXlxRFdzN3JJVE5MUTJWZjJWbWZLUGlKNkc2RVJXekppVVhjTEpLdTBMajlQ?=
 =?utf-8?B?Q1FOcHNUYms0ZXlPallRZldhTHdhOUYwR0ppMEVuQ09PNVdxY1I2d2NmVEZ1?=
 =?utf-8?B?dkcwZmMzNTFMNHZmWnlQVWFxQzVFM0FSbDRSQndrVDZEeDJCQjZ0cTZPSWw2?=
 =?utf-8?B?dzBWcXJkNkJmdVdPZU5oU3hxcmZhanlQbTdsWm5NN2dJWVNCRDZKQUZ0dkhn?=
 =?utf-8?B?ZHpWZlJDQUFheVgxRFVPdDZPYUpySStvV3ZPTkcvMEh3Z3RidTA3SEZXRm8y?=
 =?utf-8?B?L011Rlc0VW5VVm1kQWd6d2MrK0NFL3NrQmEyUFRPTlQxYjFBZi9rYWNOR215?=
 =?utf-8?B?bENERW5ubjN2MTR3S0x5U3FoUHVMclozUmROTU5teHNGbUliVDdOSnJrWTBW?=
 =?utf-8?B?Vll2L01KTkFWL01kbldWMktiTTMwNmU2RjhRSi92VGFYY0Jmc3hESXFmeHIy?=
 =?utf-8?B?ZHBCR1VzMTNqaCtURXVSTjQ3R1IrLzNKN2JkRFNhN2Y3NVRSMjFpNmlIUE9n?=
 =?utf-8?B?cnVYMStNZlFsWTF6SUk5VXlaWDhSZ1RVR2J0VkZjdlNyalU1UEhtNFh6S3Nl?=
 =?utf-8?B?TGp3dEVkQzczSUkrVzlibFhwN0pKbndVS2Y5bysrLzhaMlMrVGwvNUtOb2c0?=
 =?utf-8?B?UEZVT3N3WFpsTXRRQjNTMWkyV2VORHNOeUlsQ0JTYmFSMFYxbDFsb29ZcHN3?=
 =?utf-8?B?QWZYZ2tnbllFU2xGZVRJZWNYRUFGOEtjbVJtZVRXbHBGSkVIYmhoTlFYenBW?=
 =?utf-8?B?enBnWDFJVldNbzR3V1lVOWJNSHpCZ0loQ2Y4TjR5OGV2a1N2SEdWZEhaMW5N?=
 =?utf-8?B?R3E1aEZVd1d1TWdGN2RkRE80dUMxTUViNTZsM2sxOHkvUFIxZmV0bGM5b3NJ?=
 =?utf-8?B?cEMyemtUUTZMZ1VydHNyR05IYTE1U3lQOFFpcWZyanl6SWxhK1NicnBOU1I5?=
 =?utf-8?B?aUc4ZGM0MWpxcFNxeGZvRjM4N1EvaUxkN3V5V0UxUzU0MHdMdC9qZFVwQTdS?=
 =?utf-8?B?UVZzL2x2R0s3QkV1cU96bHQzNFI2Vlp6bUwvcUZWUDVuNEwrSnRINitqOTlZ?=
 =?utf-8?B?cDRjVkk5NnRzOURIL3ZqeE8xUkxkazJ2RXlBb1VwZmpCOUtrMzQ0V1lxREhD?=
 =?utf-8?B?MEIvbmZyVjhYaWJnb3BJMGFIaTFwc1k3aGNFeTE2bWVlZjh4cndVd0RnblJr?=
 =?utf-8?B?OVVMdlZiV3NXcDBtUWxoaVd5ZmpGU1BibVpDLy9MaG5uUXNLRVlMNlhKSUNk?=
 =?utf-8?B?ZEEza0ZSSEE2N3ZUWmtidFViR05ZY0hZRVY4ZE9oOEZtZ1FHbzRiK3R3M0Rl?=
 =?utf-8?B?TXU4ektMM2VqY3RYU1ZYaktjKzVYQkZFTkhJWWNhYVFJQmdzVWVZTWUrUW5L?=
 =?utf-8?B?dUgrRVJhWWlNZXZ2M3RoZHc1dGtRS3dOU0ovRUlMaGE1VHhXc3JXTUxkcVZa?=
 =?utf-8?B?SGpGbVltdEJFNUNUeWpNdmZrbDhYT2VFaWRHK0JWRTlLaDZMWFFTemIxT2lp?=
 =?utf-8?B?VGNlbHZLRGhYRVhRUUM4QWp5cmNBa2VLNTJQNmZHU0ppYjE0K2F6cy9CMlF4?=
 =?utf-8?B?c3BhNEJrNzluYjJZa0JKUm45YkRhSDBPWXhDM0JqUXpjN2M0WS85dlh4TEVH?=
 =?utf-8?B?WmoxeC9ZU01hVW9Xc09VejN5bzhIZ1ZGZldXV1NpSjRBTnJESjdBZzVUZHlj?=
 =?utf-8?B?eGRmVHhTRW9YU1haUHlkaGxWcmJod2tSUzBBa1pmSnBWOS9PZmdGQ2FYckFN?=
 =?utf-8?B?US9oL1ZxT2VqL012a0dvMExUdDUxMEdiU0lIV05WMUJ3TmxPaUdqUmtHWU9O?=
 =?utf-8?B?UnV1c1pIcmt5OFFuTmRQc3d5YW81TlhXT3ZyRHZrcENIZzVqOXNVbVFkdXdT?=
 =?utf-8?B?endTS2loTFZ4dThIcE00Q2Nab01yUGhXdy85QkJsUkRvczRiQ1orWW90SWRh?=
 =?utf-8?B?QUZ5UkpWWUI0dUJacnVyTkNaTHJhOHRSK2FUNnhyS1NBMUt4U3ZLZkEyS1JK?=
 =?utf-8?B?clM2RWE3NlNRTkl5OGsrWEJJT2swb1llZUVXTnRYcklvQURRRis1dzZwdU1F?=
 =?utf-8?B?Sm5wRi82Zm0wbk8wNzdpOFZGK2pZc2JJenQvWFNVVW9MYU9kQlloWFlOOXpP?=
 =?utf-8?Q?UyIU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c87b39-9ba2-4f26-2d63-08ddb96e3954
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 13:42:01.8442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J7ap3a1AZMKiZz7C3EeoqGAm/3Qu5ik3vR5I3EOcGNnBrubyJB1HcAw02H4eK8PO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8892
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

On 02.07.25 13:58, Arunpravin Paneer Selvam wrote:
> Hi Christian,
> 
> On 7/2/2025 1:27 PM, Christian König wrote:
>> On 01.07.25 21:08, Arunpravin Paneer Selvam wrote:
>>> Set the dirty bit when the memory resource is not cleared
>>> during BO release.
>>>
>>> v2(Christian):
>>>   - Drop the cleared flag set to false.
>>>   - Improve the amdgpu_vram_mgr_set_clear_state() function.
>>>
>>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>> Cc: stable@vger.kernel.org
>>> Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
>>> ---
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c      | 1 -
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h | 5 ++++-
>>>  2 files changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> index 9c5df35f05b7..86eb6d47dcc5 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> @@ -409,7 +409,6 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>>>  		if (r) {
>>>  			goto error;
>>>  		} else if (wipe_fence) {
>>> -			amdgpu_vram_mgr_set_cleared(bo->resource);
>> Mhm, that looks incorrect to me.
>>
>> Why don't we consider the resource cleared after it go wiped during eviction?
> 
> Modifying the resource flag here doesn't go into effect until we call the drm_buddy_free_list() in amdgpu_vram_mgr_del(). This BO will be cleared once again after executing amdgpu_bo_release_notify(). With the new implementation, there's a chance that changing the resource flag the second time would cause the WARN_ON to occur. Hence I removed the resource cleared function call in amdgpu_move_blit. Thanks, Arun.

Something fishy is going on that we don't fully understand.

What happens here is that we move from VRAM to GTT, clear the VRAM BO after the move and set the flag.

When the BO is destroyed the it is backed by GTT and not VRAM any more, so no clear operation and no flag setting is performed.

It looks more like we forget to clear the flag in some cases.

Regards,
Christian.

> 
>> Regards,
>> Christian.
>>
>>>  			dma_fence_put(fence);
>>>  			fence = wipe_fence;
>>>  		}
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>>> index b256cbc2bc27..2c88d5fd87da 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>>> @@ -66,7 +66,10 @@ to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
>>>  
>>>  static inline void amdgpu_vram_mgr_set_cleared(struct ttm_resource *res)
>>>  {
>>> -	to_amdgpu_vram_mgr_resource(res)->flags |= DRM_BUDDY_CLEARED;
>>> +	struct amdgpu_vram_mgr_resource *ares = to_amdgpu_vram_mgr_resource(res);
>>> +
>>> +	WARN_ON(ares->flags & DRM_BUDDY_CLEARED);
>>> +	ares->flags |= DRM_BUDDY_CLEARED;
>>>  }
>>>  
>>>  #endif

