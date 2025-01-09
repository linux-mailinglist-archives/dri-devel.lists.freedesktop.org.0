Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B349A078C0
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 15:12:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD5310E37C;
	Thu,  9 Jan 2025 14:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NtKPlH9M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B611C10E37C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 14:12:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yuOCkBzrAF8U2gdmOV3JoYkj5+BMLor++xUJ1cD3r8OCiT+rkhpDuq0tFeclCZomxlmDgCMe+knkHe9gEjmBXEpc8YksqeVYaVjkd6rIEBNBIUyEXS3OVQO+FJEYuObfvLiEfeYkKaENLPSOdmSHUN5QL439UWdDGd4xmhFgMAMGbfjfTaqs1ZfXOsKAVpK+HAuVqJAMJ+a3Liq325PIjJgSaMgf9YBKmlxLyR/Zxcg4UX8eWXO5QkIV6Ci7meyiV8bQKPyRBGwIn7smFOLTYLcSEtIqYYfjpY8jdwvRj4oeJdmPzFfW7pbXhEctCpfJL0PYTKPjosr6kIcBz3671w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBRNMLM1hPxB9B+vCtzHJof0XmXoHGUVz9ifcBOHdG0=;
 b=mQehfeDlxp34sJKg8sh25+u/ALb2eR8jJMMJo205o/RdQQGephvJUQiqrzd222YIKPTnlnarGsHS0TmGv4vd3HynXvQ5HiPgHOHJF8iPn0m/7e7bsqtyJ5Nux4kfcUF3y6aaHKscTu/3lnSttYsA1V/ttgFjzreUTABuDagG6hK6YvIVvOlpWsCXtq/bu1i4FOwLBGMC1JKX14ebUbejysWEAJi6/SJurEPt+twkYUO3p1KQxmKE2xT8hmQl5W8b1rTkFdazwqdmP6R1D/6MwWo2fey2ITZna+QoTAnvy4GMvcCimYFuSIsXcswZXk2ncPHXn2E3xqXVOdI1KDp/pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBRNMLM1hPxB9B+vCtzHJof0XmXoHGUVz9ifcBOHdG0=;
 b=NtKPlH9MUO9QqsJzBhJZkhQZgSv1rlI3mcZNsvXAYrlYYyj96pigZr/AjVaxPKPLiLEt42OkI1quq/TAba70gnu8ER9M+z5UItpOp4qn5aSkLKX2xnkqUSvi1u07QZv9btBrZW5k9xzf23KfPz8MTQh9zqmS52Jr6ip+CtUuQWk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB8345.namprd12.prod.outlook.com (2603:10b6:8:d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 14:12:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 14:12:19 +0000
Message-ID: <b9abe236-fd01-45eb-873f-e458dfc0b0ee@amd.com>
Date: Thu, 9 Jan 2025 15:12:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 10/18] drm/sched: Implement RR via FIFO
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
 <20250108183528.41007-11-tvrtko.ursulin@igalia.com>
 <e2dea565-96a0-4d83-81db-0d38ba180292@amd.com>
 <218feab1-f8a8-43cc-a23c-01e31e59a2b2@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <218feab1-f8a8-43cc-a23c-01e31e59a2b2@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB8345:EE_
X-MS-Office365-Filtering-Correlation-Id: 04c59722-97b3-4019-a2ee-08dd30b7a0f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bW9OV1ZKTzJaL2RDQ3JpUzk0eTZQVEc2QWtyZkJ1eW95OTV6ekYvSldiNzJm?=
 =?utf-8?B?dXhMbytUMHlOQ2wzZ29ORE81U0xuZEVtTXlNbGtqY3NieENvemR6V1g4d0xM?=
 =?utf-8?B?cGxmVDhVdlJZTHRDL1NZZW1UOFN2cXArQStUdldNTWJnOHNBWVZXRm4zeGNi?=
 =?utf-8?B?R21QdkFUK0dZNmZHUGp1M0dHcVdYalNyd3V1NzErdG9vdFM5VzZva003d1o3?=
 =?utf-8?B?d2laRDJDeGhNSlMrdGhYYWJKbUl0dzFRUW95Y3VkRXo0eWdIeU9tN0FmdCth?=
 =?utf-8?B?TGpWSzkzVWV1a21MaFBUcGFQOWZUSUxCYmZrcGZ3MEk1N283OHJZNUszbmNz?=
 =?utf-8?B?MGZiRUVwYTE0MjFqTVQzbE9XdG1Ua3Z6MThKTVZBZ0pSVGFYampKUUVOQjc3?=
 =?utf-8?B?Mmw3UUkxbzNVbXl1L3hpOHN6V3duaXk0TmJrU05udTRPc2JPTnBTWWsrZkJR?=
 =?utf-8?B?NUNEMXRXYVgrR2NQQ3A2eHo4MDRsc2hFMkpPQlFqQXdqZk5tNFl3NkdGZWNI?=
 =?utf-8?B?T2psTFc2dVdsSngrM3UyZVJGZjBDUTM0SmFsUDg5NWEyenBxSkJJakZ2bEtL?=
 =?utf-8?B?b0tWeTh5SVg1TGhjbVA4L2QrMG5QOGNONVJmeXdUcU8zL1oyTmhMV1ZDcGNw?=
 =?utf-8?B?NkdjUWo2cDFkVWVrbWJrZVhGdEFIWWV3VXlUblJ1K1hKSVpYOXVtMyt5akJV?=
 =?utf-8?B?ek1yQXNrR2lKTGNIcWpvL3VjWHhuZk1wcWxwaEsvK1k4NFpVc0syTHJlRXBM?=
 =?utf-8?B?bzcwUElWUllwYzVPdXdIbUl5ZDBFMk44emdXZVZPczQzamdsT0JKN1lzUDZp?=
 =?utf-8?B?a25Pc2U3ZzVSOTU2dnJmWWtsSmZKZ3VQU1N0ZWJWS0szaVBmVEhQcmp5SEpQ?=
 =?utf-8?B?SkRjTzVGRHBZM1FNb0dITzg3dlM2VmJOMDlzUE1Td2dqMzZvZ0M4SlltM3Vm?=
 =?utf-8?B?d245dU5oazA5cDcxL1ZDYVRXSDIvcWRuTllmZkxtNmhicXJxQXUxUkJDU2Jp?=
 =?utf-8?B?TlBkaElLVVpNdjgvazQwK05XdTk4NXBMV2FUVXU4cFpuZzN2MHc4WWhKSDBy?=
 =?utf-8?B?WVozRjdTTWhRQU9BTmdVUTExK2xJNjdYVFBQZmtGWFRxVzNYNHV2L2tHS3BC?=
 =?utf-8?B?elIybExMT0c3NGgvWXlTSnpzNno1Rmg5REk0U0RqREZ4dVQ5VUlBQWF6S0dU?=
 =?utf-8?B?NTFnNU9qNUQ5NTFOOEpYVU1McXR0ajJNajV3cEhCdHhiUWpnYVh3Um1SOUxX?=
 =?utf-8?B?UTBlY3VodXVUYzZNdGNDR2hDSkhOZi9vUUJhVG8zQ3l5Z0U4RXFJbDlaS0l6?=
 =?utf-8?B?VHBUSXRFN3k1WUoybVA1RnIya0tTblpWd2dFdCtMeFczdGhabjBsUEVhU1VR?=
 =?utf-8?B?Q3BPdmFJL1lyc243dkpLczJ2cGViWXAzNFljY29SN1B4aXMxcjgrdmtnbXB5?=
 =?utf-8?B?aVV0ZC90ck9pQ2VmeHM1QURteWIwc1Q4WDJWc0pleXd2Ry9yRFQ5MFpjNXlj?=
 =?utf-8?B?dlJQVjdNNzBGTFQ1b0NtWDFaMEFXUGl5aDRGV3FuYS9pSGZxTWRxQVRWWTIx?=
 =?utf-8?B?RW1hZ3hQZWZGdEVYcVBiTFZZWlpvS2VoUzZmcC9WNzdaM0U4ZjBkeG5JNmYy?=
 =?utf-8?B?a2hlNlpKMjFzS013eW9UeEJLMm9mek4wSlVFQk1SQ0Y0dGFwcjA4S0VuSnE1?=
 =?utf-8?B?T0Z2bW5wQXFsdmVVY255bExJTTRWejVtczRCKzFibjNFK1pxYzZzNzRpYWFG?=
 =?utf-8?B?UVNwY0FzTG9PYWkyN0RNOThNMHNTTzV4d2lPVkp5NHdSKzlGQzNEcTdXWGU3?=
 =?utf-8?B?UjAwU0FHcVpLbjc2cXVVallSSjdqSXhZVHVBYkJUTjV6c2xCV1c4SFJRdzAy?=
 =?utf-8?Q?3aVxlO0KElw7s?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1pQTTliWUZhNjVFbWo2TlJvaTNldHN3emRhTFZiQ3BLMUlmLzVaSnUzL21S?=
 =?utf-8?B?Qzh6c0crNkdyRGdCaXk0SHcydjZXcXhCZUwzczByQngwZzRrckFBNTNJTDEx?=
 =?utf-8?B?bmc3OS9BUFhMb1J5bHZCSmx4UXErL3BFN254ZE41WHp0ZjFYRHJKYU5NLzdn?=
 =?utf-8?B?K0o2amR1SXl0d05tV1NYMUZMMVlkV2gyWmFSUCtDaDQ2TlFmd2FBQTRkYUJU?=
 =?utf-8?B?Smc2MVpvODhOMEdBUTlnWDZkRnZhN2hpSnRSdXNBUlhVS2xSeW1pRUpDZDdP?=
 =?utf-8?B?YVhsT2VESWdrL3FubVMvbkhFSTNTZE9CbnBSMjlYV1laaDk5OGFucHRVVXBt?=
 =?utf-8?B?eUN2WkZjTmF4L0FmdThNMy9TRmgxMDBKb2dNT2wxLzVqalNaTm1oR1hsNU9v?=
 =?utf-8?B?bXlRUE9kUzFLVk1wck5nU25aWkUrWmtHb3RuRWtrcXFKTElHTHUwTEtha1dj?=
 =?utf-8?B?cHIwQmpYNnY3YWp3SXVVcENURG01SGYzUmdBYlk2RHR5RUVHcTZpa3FXU3Rw?=
 =?utf-8?B?R3NNaXJCS2xOclA3L05hWUVhc2dYK2tTcXh5UEhHK2NNRmlZd3YxK0U4QVBL?=
 =?utf-8?B?Y0NGYVBlV3ZkZmVpMzA4ZmZQaXRjQVBJNW90YXJQY3Z6L0JLVjIwNUJ5Uyti?=
 =?utf-8?B?NDJrd1Y3eUEvZHVDZkFlK2YrSjVJaU1MTXRoTkxSTllpWHFPcVZ5Z3B2ZHpq?=
 =?utf-8?B?RFpuTmd1OUsyOFlTdThERmlNY1RHaElmRmRxTkFxNHlBc0c1Y08wakYzbWlJ?=
 =?utf-8?B?Nm5sRG1oL3ArL050VmhsQ3VYdnJZQzV3bW5jN0xKdm1FVUhSbVJlWWlkdHRi?=
 =?utf-8?B?bmhJaU96SmxOUXFYYVA1VlUzVEVva0JObzBvNGM3ZGU0Y0NqZU51VUkyeVZC?=
 =?utf-8?B?SVZ1SkJuMHQ0Vk9JUnpWRGNYTUZ0Vjcyb3RlVTZzQTRPVmtGUUFBQkV1Um1O?=
 =?utf-8?B?Ujc4QjNncWQ2Zk5UeUtERlBDM21rR2xFYmFqcGcvRTIxZStJZzA4eVBtZFk0?=
 =?utf-8?B?ZDJ5ZXRYd3ByN1YycjlwZGkyU0V0OUVJVFhUaVF1UUlYOHFMd1cxTXRVOXkx?=
 =?utf-8?B?d3VaeFJkV3N0WmZJdjZ5MXVYdWh1clZPTlZiWjdOTnhZS2VlTDE3Q2RrMnQw?=
 =?utf-8?B?dUN1MzFKaWZhV1dybC85YjZ0RTdabWJoUmEyUkIzVFRlODJvOFJhN2dDekVB?=
 =?utf-8?B?MEwyYmhVNFdZL1FsMXhUUkdaTnNHdnlCR01tclZ2eGEvMGdlZFVYTzlJVTRS?=
 =?utf-8?B?NXdSeFFCMmlHZ3hXRSs0UW1PUlJIbXFTSDdHQXdFTFgxUUFKUlJqRTVLdlg5?=
 =?utf-8?B?aTlZYTFicnVHR05XNU81UWdRRzFVZU1BVythVGl1OEJuZGhxR09GVVU1MHpk?=
 =?utf-8?B?b3BEdVg5NHNYQWJhNDZWVEVzbEVqM2tZUmZJWXpaN3V5S1NHS2ovcXIvMUt6?=
 =?utf-8?B?UjBRQ0UwU25Gd2VpUFRmcnN1bFNYY3hIRkVmVHplTjJhL2ZmNW8xL3hNNy9Y?=
 =?utf-8?B?OW9ZYzd4SmZRbmJYZUVFbS95Mzg4K2JCc0JTU21GWUE4a2dCMFNlRExkeWVw?=
 =?utf-8?B?akxyaEVuZkx5MEpPNHlGcEFPSE1YN0R0U04xNG5USHA1Q01XaEFSZTRYZE5W?=
 =?utf-8?B?T2VpVWMrUEhDZlV4UmFUbkdiMXBLTlVPeDYzY3RvaFpUa0hXOWsvRzU3K2E5?=
 =?utf-8?B?T2ZUZ3Z1cDZSM3NzOFpjVTE1NjM0ems1eE5oRFBWdlAvcmlYOFFnRWhncFMy?=
 =?utf-8?B?N0V6d3AwdEY2Zk03TWZ1dndZVm1IYVZtSnNXZ0UyNjl6MHpZSUFHZURDT3lp?=
 =?utf-8?B?MHcvUVBnMnpGVFVNQjc3Z3NmYWZucHd5UVFYY2c1UW0vNlhNQUE0T2w1NFZw?=
 =?utf-8?B?RVNseVM5VUpvdHJFS0xtVUtkNjd3MFVsOE5tZUZEUmxHU2VBc2dXaDVBeWI1?=
 =?utf-8?B?SHRxclFCMm9ENFl6V1c0aFRUWHlLY1NxbmlNVlJaZXZ5Q1NWNGY0ekt2SFJF?=
 =?utf-8?B?ajdjcjFSazFGZkI5Q0JWOWR2MU1CTTExS1o4YllWaUlTUlBKN3ZxdFN3Wm1a?=
 =?utf-8?B?bXRNTXNEWGJGUDBEckgrTlcyRHcrMHNnK082RW9Wa3h6RXNFcXBvZ01DNzNY?=
 =?utf-8?Q?kIoxVKL0pEJeywBn7i1jCeOQS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c59722-97b3-4019-a2ee-08dd30b7a0f9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 14:12:19.7070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QupM7FTcpg0LwG3NstV2XqehCv1QC4zV3lwMAAy3PiemAur6b8CEwZ8sAzpIy8oM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8345
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

Am 09.01.25 um 14:27 schrieb Tvrtko Ursulin:
> [SNIP]
>>> @@ -259,7 +258,7 @@ struct drm_sched_rq {
>>>       spinlock_t            lock;
>>>       /* Following members are protected by the @lock: */
>>> -    struct drm_sched_entity        *current_entity;
>>> +    ktime_t                rr_deadline;
>>>       struct list_head        entities;
>>
>> If I'm not completely mistaken you can now also nuke this entities 
>> list if you haven't already removed all users.
>
> I had a version which did that too. But then I dropped it in favour of 
> only keeping entities with queued jobs in the tree. (Before both the 
> list and the tree contained entities which submitted at least one job 
> in the past.)
>
> I kind of like keeping the tree trimmed (would it lower the rb tree 
> re-balancing costs?) in which case the full list is needed for that 
> karma processing business.

Well, is anybody still using this karma stuff (maybe amdgpu, but we 
could drop that)? That as well turned out to be a quite broken approach.

Basically the idea behind karma was that on a crash you re-submit the 
same job over and over again until it either doesn't crash any more or 
your karma became to bad.

And when you now think of what Einstein once said about insanity then 
yeah that was also my first thought when I learned about that :)

Cheers,
Christian.

>
> Regards,
>
> Tvrtko
>
>>
>> Regards,
>> Christian.
>>
>>>       struct rb_root_cached rb_tree_root;
>>>   };
>>

