Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A260ABC1DB1
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 17:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F9010E6C8;
	Tue,  7 Oct 2025 15:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HBGo4082";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013065.outbound.protection.outlook.com
 [40.93.201.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2BF10E6C5;
 Tue,  7 Oct 2025 15:05:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2/98HVQ247rndxR2vQnLu5KO3nZTiOzjr/bXaZ2QuJRFgq+8IRW4NA2vOuL81DEFMC5MQdP/NwrLmgjc1CesE/9BrNP3QmBuZ2PtE70Afv+kFuBq3BUKPAUF2dPuuNcaQ93DMnpkTuCu5V43f74uPxp03nU8pA/30qpLSRjhVqBsAKiDco8t70WjwRju04Y/hCzkM5yhwdQmW1TwJbDIo7ovoncLD7bn+wU9m/Q7Z0wWzbgbbcxXAdv4FMIorN3QgWARLGV4mk9zfpFfeHqt2bG/71DcL887RFl4pBxaWm59eoMzOmlvH2vE53jsC9z8ucGvS5zHusoxOlRGJR05Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9LrU4E6u09m9kgEN2/1gQ3k2vvBqKXmKRO03k1SQRc=;
 b=GMC6k+8MmQJ+Sh4mODbi12ZKPVnqXgvGaWMNTm6kD2m4WoFAqrgiFDNFLOGJK7qbbFxTwqJHRU2P4H+KlW34XXj7F7GCIQphbxxrQCmyFKRuyZknhS7yLPC6jeuvpkevDUuaZQZujH+8VXfFa6JCGm2ToebvPB42H6WTmp/KJDfc8p4H2CbgPiWmVjOOrFljp36+RQ54B2qF0A7bCo4bMk7YZvsBgiE4ZhLkBHw/auvK93Ez3yTpMfiV8EJ2HXzvg2+A42OVFPt39pKBExQpCY0+zJYAWMo61dRi7+e0xpFNRVh78sOUNBKdMnixTunHp82X1aF36qCuyyMCpk/sCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9LrU4E6u09m9kgEN2/1gQ3k2vvBqKXmKRO03k1SQRc=;
 b=HBGo4082Z0fW6/ANxZUaxokbg2VAz9tYz9HR1PETsE7pau5DstG3S3hVlsOJsPKWD6w5Ogv23xhiNIjt4iLgawGLaoRqm6VUPiZiTdLo8FHBUVrBMxjwAjiqFCzte+crmA2cidODlvQikAIu4qZFZwv3vTfelIuwxkHW08oKa2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7853.namprd12.prod.outlook.com (2603:10b6:806:348::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 15:04:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 15:04:53 +0000
Message-ID: <c7560981-22c1-4d90-99c9-5dc757a0a89f@amd.com>
Date: Tue, 7 Oct 2025 17:04:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 1/5] drm/ttm: Add getter for some pool properties
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20251003135836.41116-1-tvrtko.ursulin@igalia.com>
 <20251003135836.41116-2-tvrtko.ursulin@igalia.com>
 <b9a866ea-0f67-4e34-bb30-f8e297ee26f2@amd.com>
 <c3cb4df5-d6db-4cff-ba4c-c51f6503181c@igalia.com>
 <07ed348b-e8a7-4831-88d2-b53fcd07d5c5@amd.com>
 <a09343b9-2b37-4805-b1e0-54e97af8cd53@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <a09343b9-2b37-4805-b1e0-54e97af8cd53@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da31770-9c84-4c89-2089-08de05b2deda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlhUZ2poQm1ycXlxd2NGb0FjK3ZTMno3NThRWENpaW1jMXdaVUlPR1d4VlRt?=
 =?utf-8?B?UlMrbUF1dTMyeG9tUkJnY2FiM3JmRFRMVmZSaFo0OXZCbnlxSjlISk5jNmFU?=
 =?utf-8?B?dWJhSmsxZ1BSZlozaHVRWFJaK3VVZHVWdW1UYWtsTUdDcUVsc21XcE1iWHlj?=
 =?utf-8?B?U0JNR0l2L2RJM1pIU3hKWGQ3MzFaVXNwYy8xSTRnUlRDeDN5eTNYdmQ5QzYy?=
 =?utf-8?B?VGZ1eVZRdFAvam5TNngvdFMxUThXQ3QxYnJVN2xIdkN4TThjMS9WMjdlUlFl?=
 =?utf-8?B?MTloZHpERUVDNDZRMWZuUC9qTkt4dTJyNmxvU2FLYmlPYXJWcEQ0blg0b0RS?=
 =?utf-8?B?NzVDUithLytOdGMwRkVyT1FQNlpmbGxBOVVRN2VIci8rYmdwMHY1cmt5aHpO?=
 =?utf-8?B?Vi96STh4ODViNjQ5anlxb0o3YkNzdjY5YjZ0K3ZFZys4RVRhaXJmdFFGM3Np?=
 =?utf-8?B?czRvclpPaDBVZ3B4cERjbjFJRUJvMWs2aFp2Z3ZSUDRBR3h3Z3R2ejE3WXRo?=
 =?utf-8?B?aXpDTW5saDRVVUlaV0M2dWRoSkQ3TWZ0T1dFbFdUT3dKcmFzZm5kNEJvblhR?=
 =?utf-8?B?Lzh0MnBRNnRrQkdWbnVjMFpJbVRFYzQrL2psL2FUdnZiakxxaGpUY29NZ0t2?=
 =?utf-8?B?WWZ2ZFhpM1RQMHVoYWxhbDRFM0E5ZEc3TnpCRmF5VGdENWZiaDdXZXVoN3Jq?=
 =?utf-8?B?Q0hLWm1vNVJISTBiNHBuMmxBQVNkY3FxRlpxcFUrcWJwRkIrRWE3MXhLSnNp?=
 =?utf-8?B?T2J2UkRYZWZlcjg3YkVaMlBnNzdXVk5RTjgrS1VaTE10bnpMd3kzT3pPdVEz?=
 =?utf-8?B?VGpmN3RCdVVjWmlOVzBQVmhBdXhRZXpqZGJPTGdCR2NBcllOOUdlMzU2WUYy?=
 =?utf-8?B?TWhNSnNwQStEU0JNZ21uN3BmVjVldDYyYTd1T2dKNDJCT1oxOW1uUlhLV1VO?=
 =?utf-8?B?ZHBpUy84VTdxeVczcmlld1I0S0V2bjlkUG1HbWh1OEx4UElLVjYwVzRUVXVB?=
 =?utf-8?B?dkE1Z24wNm0xclgwNjArRkd3S3BCd05pWWRMQzk1cmdabWVrNzAyMmVMQVZw?=
 =?utf-8?B?RWxTdVBXVjhUNFJTSG8zU1dlTXlnVlJYWEJkMjcxbThwOWl4VGtWUXpZeWNM?=
 =?utf-8?B?QTFHOE1MdUszc0I5UXZWOXE5bnVlOTM2b2RKWVBaWmQvbVhUVzZ2TzZIQW40?=
 =?utf-8?B?STlBenJKU3djOXVVTkd1NTdTS2xqVGx3WDZ4TWt2ZGJxR3FtQmRDK1FQVlJ4?=
 =?utf-8?B?RFcreXFXODBRdTBodWt4akhybzhUYy9xNUZGYWdrNi8zaWhmWG9UN0pVVHB4?=
 =?utf-8?B?Q1lKd1c1ZnpqVmNQVjlGOHowZ3hrT2JIRUdVeWZHR2U1bTJNc3A1ODlpRkpL?=
 =?utf-8?B?OVVFVk45eUFoY3NOZmk4ZCtjbXp2TWRTSmpEWEVRTTE0cnd5azBWOG9maHZw?=
 =?utf-8?B?Vll3RjEwRXJGV09KWE56MlBUVDFZcEt3WWUwbUZRRkFoa1dPWStkY1h1dlZE?=
 =?utf-8?B?RFg3OE5aQmV3M0dXalJZd2RuMFRld3BNSFZ3Y2tlUGdiaXlxNC83VlowaHN6?=
 =?utf-8?B?Ly9tMm4vK3hpL0FHSEQ3MHorN2NEMEJOVzF4RG84M3lLazJGOUc4ZTNOWHI4?=
 =?utf-8?B?QmdsbzF2UkNHUmlVMzVURlhPdzZoOEMrZGV1L211ZjRTdUJnSjFLN05UMXdP?=
 =?utf-8?B?N3Rtd2dYRlpXVVZ0MFBOaUhqOVJ2OW1hbi9PZG1VK1RUU1l3VDdSc0IrNmhP?=
 =?utf-8?B?Y0FsZ3dFNWREZDBObzhGcGlqaVRzS3R2VkNTcnVQSFVmdlJOVVhseUNjRlRG?=
 =?utf-8?B?L1U1b3dkenBYRWpMbkx3b3EwSVFla0ovTGNDdXBiZERjSjhHNVUzVnVyZUVL?=
 =?utf-8?B?ZXMyTGR5QktzejRMaGROZ243TlVPdmpNVlkrNnVUN2MzL2pwMXYvY3Nzditu?=
 =?utf-8?Q?+juh74AwEPBEF+Dc30CQzCI4IjEGyXpw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEliUll4RHo3S3A4VG8ycnYrczE0RHZoVm9oRVdiYWxkcVB3aFpTRVpvaGJa?=
 =?utf-8?B?cTZ2MitGbU9qeFJFVUR3MEMxdnlqTXFrQks0MW8wYjVuTmxVaGE0NGRUV1BE?=
 =?utf-8?B?T0FQZWYxYWk2eHd0aWR5N2xhVC94YWIvTXhhenZEVkJWNll4ZCtGZis1KzJF?=
 =?utf-8?B?TUlnOGp4V1hOZGh1T0tHUFZtUW5GR0l0Mnlpd2x5M0tQcmJuNG1wdlRxWEx0?=
 =?utf-8?B?dm04QXgwWU83UHdwTXFQdk91aVQwMXdLaWJuNjdKWkxVVmZoTENkeXR1YnNk?=
 =?utf-8?B?VlpTZWpjU1hyaGxmT3l0cFJKMlhONHpJWEtDTE5Ha3hGOTBLbzkwNUZOakJh?=
 =?utf-8?B?bnphSExOZ1JZZnJGUmhYamkxR0dlRFoyb0gybTJMT1ZJUEFDUGllTmpRV3dY?=
 =?utf-8?B?ODMycjhMVEtvdzBHdE8ycEw0U0FoTVk2bXB5eWZYcFRoVTV2OHFJYkRLME9M?=
 =?utf-8?B?dGV3NHB1WGJMNnR6Q0NrMnBYRDQwem5jd0JsM3ladFB2aG80TnRCL3VaZm5C?=
 =?utf-8?B?aC9BZHFDaU0ycmM1ZnhuSzJyT1huTUd5R3BrekRsQW5wQ01IWUZpNkdtQjcy?=
 =?utf-8?B?dGhIWUoxRFI0dEdwQUJNeFVMWkhmbURydzhsVSttQksvNllMS2sybWFOWEw4?=
 =?utf-8?B?c29DeDlhd2QxRG52RGFmZzZiMUNwM0pabVpoSm5uK1drbXhuWFRucW1FOVpH?=
 =?utf-8?B?UThmM1Eva29LdTdONDNpd3FIT3BFa0NUTURVS1hBZjU2b3Vyb0o5Vm9NM1Vk?=
 =?utf-8?B?UlFUM2M2ajVKbWJYVm4vRXJJYWNNQXlWU1FTUFZaOTRRTjhJODZNSWR2RXI2?=
 =?utf-8?B?NlN6SkhDUTVNUVF4d2k2ZUErUlBZUFdTdzV2QU1ZYk9UdHNkNHRndzhlZnZC?=
 =?utf-8?B?YVN1Y3FQU05TZWVnRlFLUlNxYzMrdnRDMjVYVlkrVExaN1J5ZjNqNFNFMFVk?=
 =?utf-8?B?Mnl3V1BzZ0hjN0xaM1FDUmcybkhodmhOZThFQ281WU05U0l2RThqL2lvNUt5?=
 =?utf-8?B?Y2ZTWGFLaTVXT0VFaFpvN3dlU2pSenBLeDVkM0xURHJLMnc0RFZlM21UR2Q0?=
 =?utf-8?B?Vk5LeG1hZC8wdDNUbzdZeHh5eU9VWjB0YlpBM3JkL3ZhZHRjSVJQZWVVTlN1?=
 =?utf-8?B?SEswdVdyaUdUamxBNHpSN2tsRG1LZUJHVzh4TnZtZmliRVlJOHBlci8vNm9U?=
 =?utf-8?B?cnN3QkxydzI5YlRoYy8zc0dKQ1RhVWlQWm5ITjgyWCtHVlY0ZjdlRlAvZHdh?=
 =?utf-8?B?b3AreUNENnRJdWRTaURJTjV2V2F6a3p5WXJRcGJOaC9ycVVDcXNTRVNQODF2?=
 =?utf-8?B?WFJGWWxkTVp1NVU2RC8rekpFYWN1d08xWGdtYW5UM3NISm13c0Qyc3FISk51?=
 =?utf-8?B?YWRad3pYQ1pKTUo3WndlZTRua052MlNUYnhRNlJWVXJLaG1neDhQUEhoYWps?=
 =?utf-8?B?U0ZSNmQ4dmVwNUdDQ2tqOVlCZlpqTWlEcnQ1YVdjdEUzL2dYNExtY3NxcUpI?=
 =?utf-8?B?ckJ5RFpMc0VUU2xzTDdNbUNMR0pZcWNHNFJpN25rbGtUZTQ5eEhMODNrTUty?=
 =?utf-8?B?RGNWTjJEajZ5UGRIaFFVVVI5OUlyckkzZHlkbVRmQWo2TWlKUnZWaWQ4a1p0?=
 =?utf-8?B?MjNmZXl4K2dkTFM3bmxabTFoa2pCWXNVZUNjaERFRFBBaWhNUlZ0VGc1dFVY?=
 =?utf-8?B?bjhVSHFKUDZiandKbVZld1p5WHhnbmdpV2xsbjlxZXFveTY1aFhVL0ZVTlJU?=
 =?utf-8?B?Q0VZOFY0MHV2WTZaUUdLQitZaVFERGxuUk9Vald2czgzaXcxZmJkVW5LVkxD?=
 =?utf-8?B?UVNkZHNMVEYzTGExZEV3em9OZm5tKzZoMklOblJCM2hUUnpjTGdBNTFIemov?=
 =?utf-8?B?UnJSM0ExUTRYbWo4WVVYZmo1dUFmTU01MkhCTzM4cmtoNDRlTDV1Z25oNGhp?=
 =?utf-8?B?aU11Qnl4VU95S01xUjR3U0hLajNaR25GSDloT0xhdW1YeHFGbHp6Uk5EaE1n?=
 =?utf-8?B?eW9EZFhiZkVnRWJMZU93SHozSURMcHlSTDhqN2JXeGdET1JTcXFVTWVzd0dt?=
 =?utf-8?B?QUlTNGtsZVBLeHBkUzE1aHBodnNsaVVYOWI5dHBidGZRRWFFWE8xelhlSitV?=
 =?utf-8?Q?XqvQaTAAlTCKzZEXRpauwIAH8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da31770-9c84-4c89-2089-08de05b2deda
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 15:04:53.8623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUQ6W4x6sk4/7B6iFK/rpFEaGRHrrb1y8+EnjqhGlMDnJLM0a6SP19vBdVXY57nN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7853
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

On 07.10.25 16:27, Tvrtko Ursulin wrote:
> 
> 
> On 07/10/2025 15:03, Christian König wrote:
>> On 07.10.25 16:00, Tvrtko Ursulin wrote:
>>>>
>>>> Please not in the header. Neither drivers nor other TTM modules should mess with such properties.
>>>>
>>>> That is all internal to the pool.
>>>
>>> Hmm IMHO it is not that bad. Especially that ttm_pool.c and ttm_tt.c need to have access to them. Alternatiev is a new header for internal helpers which sounds a bit too much. But if you insist I can create it.
>>
>> Wait a second why is ttm_tt.c still needing this? For the DMA32 eviction?
> 
> Apparently so, goes back to:
> 
> 680dcede2762 ("drm/ttm: switch back to static allocation limits for now"
> 
> Then there is the newer usage for ttm->use_dma_alloc from:
> 
> 71ce046327cf ("drm/ttm: Make sure the mapped tt pages are decrypted when needed")

Ah yes that was the DMA layer hack for encryption Zack came up with.

In this case please put the functions into ttm_bo_internal.h. It should already be in the ttm directory for TTM internal stuff.

Going to comment on the other patch as well.

Thanks,
Christian.

> 
> Regards,
> 
> Tvrtko
> 

