Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9A8AEDF2F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 15:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9843510E459;
	Mon, 30 Jun 2025 13:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZjYBA3/3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00FB10E226;
 Mon, 30 Jun 2025 13:34:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ViLzkcXFsObXo6MeALkPWzWGQXf1ZKKKAj8O7wfJedMmuTTU+Z3lkkK982YK23AwVyw2/FPVs4UpFyiNv+woReJh71cyIkLfLAKaYfrxdn+s/NWJ/v22h8BvNKjllSDJst3GJS0oIOCi9gqM18H7S97a9BlcUKbYB/8q0l7liK0C5DQxUyxkCYe6HhtQ1PDSqiQncq0f4c0RmJuTy+Tsthp3fofwEv2617B1V82cGMJHj9dRwzKcY4leEK7QxJcsxkohJQEvNP20ETEsZeU9xpURKzGJV/NrH+4k0n91OpZ1KFgFsmWwnRWsKIbvhhp+ad4oT0xtl6Vm0osAmH6wrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jmYzwhK98Glit2BAeZFSs4oEWia2LG7LVZiML8sTdM=;
 b=mwg9RlNJRTWoU+dXWlYkRSFsfefNgDL57n0VMRkMkhioaOyMUQUQl50WZDaKHMo8K/95Xt439wseLSFSULDvTJoR8MBhcy0wh16iiV8S+tm6ZJ2PR3co1u80H/A+7jqRYzGmwaGwB1Pz3PMYujqryA+xC7ALqdszhFB3F8MNeB8bTpxTWOWGeErDTrLY12A7Gh4Le/sdCatzzy4vQYupivSIRV4qpHnSzU8J8+2lIE9q7KUn+1UfX8Htwiskghf6jT+NFVfpbAdfANAUmM+FyBtnq/bia9FSJG5rA0TutglBPAkJhnvmk+jZt4wL+o0AiM/6Rkom9y/g1eOi541QyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jmYzwhK98Glit2BAeZFSs4oEWia2LG7LVZiML8sTdM=;
 b=ZjYBA3/3i69n5yX324zRk77B9TslkeKXuZM1x0rgCDvsdUqem4mKK4y7YkLVvkIzRzU46RIudGAfL5Lt+uK0v67IGQ9g7AbEXTnzzHccGB09yvPV6uZxQmoOygC6+7MHee7i/nt5xSeJTT8g831tpZ0lJPaRNbX0UbvyQeBd1Uk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by PH7PR12MB7308.namprd12.prod.outlook.com (2603:10b6:510:20c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 13:34:16 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::81e6:908a:a59b:87e2]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::81e6:908a:a59b:87e2%6]) with mapi id 15.20.8880.021; Mon, 30 Jun 2025
 13:34:15 +0000
Message-ID: <8bad0398-7e4f-4611-8b21-cfbdbe671429@amd.com>
Date: Mon, 30 Jun 2025 19:04:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] drm: move debugfs functionality from drm_drv.c to
 drm_debugfs.c
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org
References: <20250627094921.911009-1-sunil.khatri@amd.com>
 <20250627094921.911009-2-sunil.khatri@amd.com>
 <d94574be-4054-40d0-98e7-36c32c1ca556@amd.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <d94574be-4054-40d0-98e7-36c32c1ca556@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:272::12) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|PH7PR12MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f5c7229-8a67-4f8c-7344-08ddb7dacec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sng3bU53MDM4WDAvazN4bnVGdWgrd1BZM1hwTDBKdVozQjM4MGdIZmJsazMx?=
 =?utf-8?B?M3V3c014ZmpaSUh0c1FqN0g3bWFZSnhSUTd3Q1Y4aldLcEpnbFNjWnpJWCtR?=
 =?utf-8?B?YklWSTJhb3gwRkZLZ0ozQVBhK3ZrUHltM1p1UXhwbnhybjRpejVKZDAvZ2lL?=
 =?utf-8?B?MXg4RWdBdWZLNC8xSGpsR1kraUVIM2pWSlMvN0xnNFNjV3dGbFJoZnhMc25s?=
 =?utf-8?B?dGpEOUN5UFNjVy9oR0FJQzV3OWgxam9nQjNmM1NGVTBReDQwVjg1UE1wWjFK?=
 =?utf-8?B?cFNubWV4dFYreE9uUnc4MjYxcDJxU2RGYm40Rmp6bWhjNy9PQ252WWpLQ3A4?=
 =?utf-8?B?d2IyWjFUM3RaR3FMd2hyRGNZWHVDUkk3L2FGS1pzYlhaa29hMkVJeGtnMzdR?=
 =?utf-8?B?UXlhSXdtSWRBUFRMcDBCYWZ0cnBFY0NtMnp3N2VYcitFamd1ZnRJeURMRzVG?=
 =?utf-8?B?N0o5cTVNOTFsUkkyTStzL0hreGhlOGlnbG54NHlsc3MyMUNWWEVvUzN0cUdu?=
 =?utf-8?B?TnhQeWsybkhJdC8yRU1qeXZlb0tRODQvVzIzK1p1dUlES2pENGlISXUzL2t0?=
 =?utf-8?B?c3VlbGxKbmphS3F0MDI4ejQ2ay95cG00VmhsVWVHcFNkcjEzaHhHVStpMHFU?=
 =?utf-8?B?V3JGTkZQS3FjVndpTnF4ZjRjUGZCcFJvcVJacWQzZzA1dGtySlBkMWZxRzl1?=
 =?utf-8?B?VHBJSG9KbDJ0ZHI5Wng1MldzSzh3LzV1NC9NK1o1dWowWHZsYnkrUUQxaWg1?=
 =?utf-8?B?UkpoM3hkRFZkRmJSRkpoK1FrdjNxc280UXc3eG4yRlJtaTJxeGx5ZExYYm9O?=
 =?utf-8?B?QUJCQWRtSGFrSjA4WVhZSGJqZXFUU09ObXpvUjBSbHVqV2pSOHBQeDQxWlRC?=
 =?utf-8?B?YXZWZFpjSUZRR3IwRUJiZUEzU2lTTEo3bFBoL0JWTURKelZGdllrU0pPRHhy?=
 =?utf-8?B?U0JvOG54aUcwSEtRZDY3OEtiVUlVMHFldS9NeWo0eU9pMXNVVnR0ckNoUFY3?=
 =?utf-8?B?YTliS1hLWGRqc09DeXErMCs5UXNTVGk1S2R1WFNoMXdIZDN3SExuMTNpNThY?=
 =?utf-8?B?d2x3QjFXblBmUVhJUGlqaXl0dVJET3I3eXNPd01FSGRyQzhqY05pb0JhcXY5?=
 =?utf-8?B?bVhnc0Z0bFNLWVBBS24yTFVtNE9YcXcrZUFoUXNFdFFVbUtOZzZnekRQNDFW?=
 =?utf-8?B?U0pzK3N0dXpqYVNObkxaOVU3T1dXUkMxOHc2U3VaSmt3dXYwbzlJVk1Jczly?=
 =?utf-8?B?QjFVSXg0VHhyZDhJZVN0M29NUUlpSW9JNG03bFU1bDJELzBUcUkwMUo1bVps?=
 =?utf-8?B?UmpsaHdQT0FZY2FMSVQ4T3VTa0dJcHZDbVAxK0tFV3hPVllPM0JaQzNxQkxi?=
 =?utf-8?B?WGFPZVMzbCtEVVJ2U3pNc0VnYS9jZStodWJCRmU5dG5CMDExUzQzc3IrTUhl?=
 =?utf-8?B?ekI3UlprWEYxRmc4YkxhQW1DU0JwRm52TzkvQmc0cVpNeGlVK1dtMVZwNS8y?=
 =?utf-8?B?Q2c1TmVzMm9tOVRKR25UdFVsMThOSlJ0UGszaTJQcHh5cmpsVDN6VnpWZjdM?=
 =?utf-8?B?QnRRQzRsemRJTE1vaENjQ2hkMUUrWGlQWUxhVHFxMHlqaEpOTHplNWg2eUlD?=
 =?utf-8?B?MDZMNGdncEVtNkZJK3Rwbkc2WWxsY015dEpvNy8xU1NTam4yU3RmTXBlSFhJ?=
 =?utf-8?B?MUFYSzVZYURVbVNiVklvb29tRmNEZmlRUmFqWjQxdEN4RnhOd0hjVkxpZWNB?=
 =?utf-8?B?OXlhUVd4ZzZCVkUrdkg3aXdYQzhpWEFpd1UyWmFkUTM0S3hsQzZmV1ROMjVH?=
 =?utf-8?B?emJ2VEF5SnY5ZzV1UlNLVktLdXkweThqcElwS0x4dlVEaEpLdXZnaGhBVzFm?=
 =?utf-8?B?bEhxYWpmbVVrWlkvaWd4WEk1TnkvQmY0dktkanc4dE01UG16cW9oV2R2YmZk?=
 =?utf-8?Q?4NB+egHcWe4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXcva0dUOG82c0E0L09MRjkzbDZtS1pvMkVPMmNjUnk5MHBtcmwxdnp3Qk1p?=
 =?utf-8?B?Vk1tZFdTNndhZlVaVEdwNXMzZDBiWFRjRUlSUkR3R0t2V0Mzb3JHNmlDMDdU?=
 =?utf-8?B?SlMyV0dFV2Nwa0hUMDlHQ3ZWc3B1dGQ4czhKTjBQUEhyb21UejYwTzYxWlNV?=
 =?utf-8?B?NVpPUUhtS2pvUHYvWk5DL2FIRWlmRUIvRDFmN0ZrYmM0UnpPYU1VQzdTTUZw?=
 =?utf-8?B?bzBBb0hDT1N0MmRmWXNLdmtlZ091TXZtcDlUdG1oODlUbzlBQzduQlZxbzRY?=
 =?utf-8?B?eHV1ZnBkWmxvdFhZcjMzZHZMYU5SMUpuczZqd0phY1VNdUFOdHA1ZHoraWx1?=
 =?utf-8?B?MS83SGtqMTNKWkROYW9GdHZDeFhRK0lXdTNBdVZBQjhhdGVVckx4YnN4MjNn?=
 =?utf-8?B?UExMRFpYVmU3UHJMa2tlTHpyNnpTWDcxSFJDM0VJbkxCN2doSkI0TkdzWkQx?=
 =?utf-8?B?VFhJaTM2bjdMYVBTa2pRNGpBRlpybmMyTTVWYXF0MjVieHQ3MmZPNWtoMUFx?=
 =?utf-8?B?b1ZyZlh0TTdtUjlaMkg3VG83RTRpODRWbkhCdEh0Tm9tbFZPU3dXQk1DOUZh?=
 =?utf-8?B?anBkRDFUNnZITE5NM284Sk5lMXdnTEhIYTdzdUJndlRKT2ZhVjMwSVNPc1M1?=
 =?utf-8?B?cTJmampqejcvNSszQXBnN1ZiTnlJWWhYc1dBbEowMWt3RkNsSlVMTGJIZXMw?=
 =?utf-8?B?RnJyZjl0OUV0aHhnNTVZN0RBaUw0VzZVS1hUYmZoT2tGVENianpxMjJBb1Nj?=
 =?utf-8?B?ZWFQSVhmRkpqdXlEUmRlK3lHRlVmeVhBMzdvVXRGYjBxeklWaGVCSm1YSDhP?=
 =?utf-8?B?OVZjd0NBcitBaTJyczhKZ3JiZGs3SGgrTWRiYjA5a1V1cjdiWjVqekpMZE5H?=
 =?utf-8?B?MmJtYzIwVkFpL0Z6UHFhMjgxY1I0MFgyVGhxZGtpM2N6QTNzVEIxSDVhNjR6?=
 =?utf-8?B?V3dERGYwUm1PeXVwSjBXUEhpWkZ5RXh2UTg0UE9OMFNBNlBFNG4waU0zWG54?=
 =?utf-8?B?QjFMOEJqTzA3dG1QMnRKeUx1akxZeXFzTUpsTzZZU0pmWFBRZDZsQjRuc3Br?=
 =?utf-8?B?Vm0zM24yYVR0L1ZUdTZoU25CNnQrRGphY3oyaU45Ylg0dWh1blEybFQ4RzRE?=
 =?utf-8?B?aitjWlp3U0hiQitrbFM5S3d1REU1LzZ3SGYycURPOEhPNWRzMmZrWUJUUHZR?=
 =?utf-8?B?OE1IL2JXdHgwRXpCNTBQQjNWVXVZVWxvWWRVTWpvcGs4OTlUR0RlMDBMUGRa?=
 =?utf-8?B?RU8zT01SVGNrZ1dZZVZEV2IxT2JyY20wYVRJeWMxUDJOWGw4cEdvTi9wc0Fr?=
 =?utf-8?B?bVRUUk1TaUxuU1pGYXFkRk1qZGdOTEdlK2diSlRSY0tiZ2ZmYTJsRnNvcnI3?=
 =?utf-8?B?MUc1SU16b0o1TUZKSm1nQ09qQ05UTXNtSWthQUEvcmxRS2RaRVZaS1pEb0hM?=
 =?utf-8?B?T3ViOFV2OTNwcGVja1pzbGxTRlFuRHo5bG5hOGhiaHdNS002M21IK29LNjht?=
 =?utf-8?B?L2VtYkFsWVBpQUp2ak5nNlJOSnBGcHkrWVlDS2toaTVEU2ZOR1dNaTVERzV3?=
 =?utf-8?B?dENJOWd5anBSNzJ5RmlmSS81aWVXd20ydkxvVXZaUFpvMnRVOHlWQ25PaGtk?=
 =?utf-8?B?ZEZ6eGhUdkJUWTNuS0t2czhyKzFIYmFPZG5jV3FIZWp5WEdEbTdJMnk3UWZt?=
 =?utf-8?B?bkxkRHhHTGtpMmx1ais2WmhyMk1ZRHFmRFN0Y2srRytmcFJzeHl4MG9Ya1gv?=
 =?utf-8?B?NHB6M3EwTjhieXBPZFIrTzBuUDNjV0Q5QTBZbmNyRTVmSlF0RUJBRnJuNkxI?=
 =?utf-8?B?ejA2ckJIVGsxa05jUTZXNHBjT1lrSzN2UWs3UHFlUHJUbmNPRW9BeHZ1YlAv?=
 =?utf-8?B?a3piZEl0NTEwdkw4dnh6NDJDY3AvVDlmQ0l4cEx1YWxzMzRZVDg2ZGZzQTZN?=
 =?utf-8?B?bVNDdHkvZUExc1k2Sms0REFLaVZsZ3ByeGxLdnpTMjdRK2YwTFZrOVFCWGJG?=
 =?utf-8?B?NlJUZWNsUXZjam1wRXVteCtEWWJaRkdyL0lIMnZCTVFIblh3RndSUE1RTkYx?=
 =?utf-8?B?L2h1cU9vNVROaHZHM3kyaFpZb2lKQUtQTWZBT2N5ZTM0d21RazFkMmM5azJ1?=
 =?utf-8?Q?GF1hfPDBB4a3WvXsnm+5Mo6Wq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f5c7229-8a67-4f8c-7344-08ddb7dacec9
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 13:34:15.8281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cb3MahsZUrGGx2Uf8Tdq8CRKtqAOy6nij+P1oeyitw1ULsY+npcLMQnLtNMjpisVqWWFqeqbN7EjGax9G4AAGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7308
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


On 6/30/2025 5:11 PM, Christian König wrote:
>
> On 27.06.25 11:49, Sunil Khatri wrote:
>> move the debugfs functions from drm_drv.c to drm_debugfs.c
>>
>> move this root node to the debugfs for easily handling
>> of future requirements to add more information in the
>> root directory and one of which is planned to have
>> directories for each client in the root directory
>> which is dri.
>>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/drm_debugfs.c  | 33 +++++++++++++++++++++++++++------
>>   drivers/gpu/drm/drm_drv.c      | 19 +++++--------------
>>   drivers/gpu/drm/drm_internal.h |  6 ++----
>>   include/drm/drm_drv.h          | 19 +++++++++++++++++--
>>   4 files changed, 51 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
>> index 2d43bda82887..5807dd64d28a 100644
>> --- a/drivers/gpu/drm/drm_debugfs.c
>> +++ b/drivers/gpu/drm/drm_debugfs.c
>> @@ -44,6 +44,9 @@
>>   #include "drm_crtc_internal.h"
>>   #include "drm_internal.h"
>>   
>> +static struct dentry *accel_debugfs_root;
>> +static struct dentry *drm_debugfs_root;
>> +
>>   /***************************************************
>>    * Initialization, etc.
>>    **************************************************/
>> @@ -286,16 +289,35 @@ int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
>>   }
>>   EXPORT_SYMBOL(drm_debugfs_remove_files);
>>   
>> +void drm_debugfs_init_root(void)
>> +{
>> +	drm_debugfs_root = debugfs_create_dir("dri", NULL);
>> +	accel_debugfs_root = debugfs_create_dir("accel", NULL);
>> +}
>> +
>> +void drm_debugfs_remove_root(void)
>> +{
>> +	debugfs_remove(drm_debugfs_root);
>> +}
>> +
>> +void drm_debugfs_remove_accel_root(void)
>> +{
>> +	debugfs_remove(accel_debugfs_root);
>> +}
> Those two can be removed together as well I think, apart from that the patch looks good to me.
If i got you right you mean to club

drm_debugfs_remove_root and drm_debugfs_remove_accel_root in one function drm_debugfs_remove_root?

Regards
Sunil Khatri

>
> Regards,
> Christian.
>
>> +
>> +
>>   /**
>>    * drm_debugfs_dev_init - create debugfs directory for the device
>>    * @dev: the device which we want to create the directory for
>> - * @root: the parent directory depending on the device type
>>    *
>>    * Creates the debugfs directory for the device under the given root directory.
>>    */
>> -void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
>> +void drm_debugfs_dev_init(struct drm_device *dev)
>>   {
>> -	dev->debugfs_root = debugfs_create_dir(dev->unique, root);
>> +	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
>> +		dev->debugfs_root = debugfs_create_dir(dev->unique, accel_debugfs_root);
>> +	else
>> +		dev->debugfs_root = debugfs_create_dir(dev->unique, drm_debugfs_root);
>>   }
>>   
>>   /**
>> @@ -322,14 +344,13 @@ void drm_debugfs_dev_register(struct drm_device *dev)
>>   		drm_atomic_debugfs_init(dev);
>>   }
>>   
>> -int drm_debugfs_register(struct drm_minor *minor, int minor_id,
>> -			 struct dentry *root)
>> +int drm_debugfs_register(struct drm_minor *minor, int minor_id)
>>   {
>>   	struct drm_device *dev = minor->dev;
>>   	char name[64];
>>   
>>   	sprintf(name, "%d", minor_id);
>> -	minor->debugfs_symlink = debugfs_create_symlink(name, root,
>> +	minor->debugfs_symlink = debugfs_create_symlink(name, drm_debugfs_root,
>>   							dev->unique);
>>   
>>   	/* TODO: Only for compatibility with drivers */
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 5d57b622f9aa..68f50d915153 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -69,9 +69,6 @@ DEFINE_XARRAY_ALLOC(drm_minors_xa);
>>    */
>>   static bool drm_core_init_complete;
>>   
>> -static struct dentry *drm_debugfs_root;
>> -static struct dentry *accel_debugfs_root;
>> -
>>   DEFINE_STATIC_SRCU(drm_unplug_srcu);
>>   
>>   /*
>> @@ -184,8 +181,7 @@ static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
>>   		return 0;
>>   
>>   	if (minor->type != DRM_MINOR_ACCEL) {
>> -		ret = drm_debugfs_register(minor, minor->index,
>> -					   drm_debugfs_root);
>> +		ret = drm_debugfs_register(minor, minor->index);
>>   		if (ret) {
>>   			DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
>>   			goto err_debugfs;
>> @@ -752,10 +748,7 @@ static int drm_dev_init(struct drm_device *dev,
>>   		goto err;
>>   	}
>>   
>> -	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
>> -		drm_debugfs_dev_init(dev, accel_debugfs_root);
>> -	else
>> -		drm_debugfs_dev_init(dev, drm_debugfs_root);
>> +	drm_debugfs_dev_init(dev);
>>   
>>   	return 0;
>>   
>> @@ -1167,10 +1160,10 @@ static void drm_core_exit(void)
>>   {
>>   	drm_privacy_screen_lookup_exit();
>>   	drm_panic_exit();
>> -	debugfs_remove(accel_debugfs_root);
>> +	drm_debugfs_remove_accel_root();
>>   	accel_core_exit();
>>   	unregister_chrdev(DRM_MAJOR, "drm");
>> -	debugfs_remove(drm_debugfs_root);
>> +	drm_debugfs_remove_root();
>>   	drm_sysfs_destroy();
>>   	WARN_ON(!xa_empty(&drm_minors_xa));
>>   	drm_connector_ida_destroy();
>> @@ -1189,14 +1182,12 @@ static int __init drm_core_init(void)
>>   		goto error;
>>   	}
>>   
>> -	drm_debugfs_root = debugfs_create_dir("dri", NULL);
>> +	drm_debugfs_init_root();
>>   
>>   	ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
>>   	if (ret < 0)
>>   		goto error;
>>   
>> -	accel_debugfs_root = debugfs_create_dir("accel", NULL);
>> -
>>   	ret = accel_core_init();
>>   	if (ret < 0)
>>   		goto error;
>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
>> index b2b6a8e49dda..d2d8e72f32d9 100644
>> --- a/drivers/gpu/drm/drm_internal.h
>> +++ b/drivers/gpu/drm/drm_internal.h
>> @@ -186,8 +186,7 @@ void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
>>   #if defined(CONFIG_DEBUG_FS)
>>   void drm_debugfs_dev_fini(struct drm_device *dev);
>>   void drm_debugfs_dev_register(struct drm_device *dev);
>> -int drm_debugfs_register(struct drm_minor *minor, int minor_id,
>> -			 struct dentry *root);
>> +int drm_debugfs_register(struct drm_minor *minor, int minor_id);
>>   void drm_debugfs_unregister(struct drm_minor *minor);
>>   void drm_debugfs_connector_add(struct drm_connector *connector);
>>   void drm_debugfs_connector_remove(struct drm_connector *connector);
>> @@ -205,8 +204,7 @@ static inline void drm_debugfs_dev_register(struct drm_device *dev)
>>   {
>>   }
>>   
>> -static inline int drm_debugfs_register(struct drm_minor *minor, int minor_id,
>> -				       struct dentry *root)
>> +static inline int drm_debugfs_register(struct drm_minor *minor, int minor_id)
>>   {
>>   	return 0;
>>   }
>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index a43d707b5f36..a02bf4885b79 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -566,9 +566,24 @@ static inline bool drm_firmware_drivers_only(void)
>>   }
>>   
>>   #if defined(CONFIG_DEBUG_FS)
>> -void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root);
>> +void drm_debugfs_dev_init(struct drm_device *dev);
>> +void drm_debugfs_init_root(void);
>> +void drm_debugfs_remove_root(void);
>> +void drm_debugfs_remove_accel_root(void);
>>   #else
>> -static inline void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
>> +static inline void drm_debugfs_dev_init(struct drm_device *dev)
>> +{
>> +}
>> +
>> +static inline void drm_debugfs_init_root(void)
>> +{
>> +}
>> +
>> +static inline void drm_debugfs_remove_root(void)
>> +{
>> +}
>> +
>> +static inline void drm_debugfs_remove_accel_root(void)
>>   {
>>   }
>>   #endif
