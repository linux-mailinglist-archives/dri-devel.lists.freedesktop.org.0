Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FECC5D19D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 13:27:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2E110EA5D;
	Fri, 14 Nov 2025 12:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zLK65cmp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012027.outbound.protection.outlook.com [52.101.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C7A10EA58;
 Fri, 14 Nov 2025 12:27:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hW7QhC4pX5S7Mh8ePs5UJ6ICxamOj1pZ1lvoes9X6gijD3W7ZY9KYQbdreRNGtY6NMzbXwtwW6d1l1lT5uX6Z/PGpD9kV19PMjo8+LwC5YRWDi0kQiXovIUyybOrUoL1Cawz89hvV2nqtSknyR0y9fMDLgo5ANslsj9J2yUVZeKfVZSBu+7ac6d+ptt6qzECB30eQVyyxu3I+yhT6R+UWbI71F7/aP0rzQbYP5Z7fqmIHoBGdUYcna88ylP5vuh6ne76kVNbT0upivVZc58YtE8cDT+r/sJNcBWtKMNTExAavCmVDjiFesGHQUN0JBL7aO3/5WF0eEb0xnps4w5X9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpTS3pyg2qpwpJBndkKSS4WHoZg/tDfQ1lYnoQWXCbk=;
 b=U7a1mISJXyNGRlS82V0Nz0hyQPU938r0hVZ7FRxUstuuR/uSNyn5I/H2aOds+GtdxG6uNHn4yhsAMdDfBwPpexhoXn0NCXH2g7ORpRPd3/EQcXgHbjNvbXePqvxDklD27lH+FAJUrsQNpiZuDFt/uRj6jQMvzY9ew7Ero8q1qFcM7Kg6Yp0767jZQjJkKzrDOjw3QcPdiEUFHqsaHC9foIaE3NStQoSn0409fjm/Cw4bmNFPLUet4lhAMoGL7bxz6/22guFLXe4iZk9/BEteDdp+HQ6ZyOG0buY97SuF2qfYLQ1/uzggdY+sEzMG3dohUAAxSADTQEKD5xxbfMLv6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpTS3pyg2qpwpJBndkKSS4WHoZg/tDfQ1lYnoQWXCbk=;
 b=zLK65cmpkPdAN+o+C83uEVptotZzGb3LsFaHo1c0r//Y8YnpMcGL8FPel2OEJ7xZ7Pa9XMQlUtkFza/tsdmQGn5P5poPKt6Y7X6iLiyqaGb5BXxoG5a7Pom8iGTrSZ2mNgfQyinfan4NME1x6f0lIGIiXIRjGAPmSyysktNd370=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW3PR12MB4361.namprd12.prod.outlook.com (2603:10b6:303:5a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 12:26:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 12:26:57 +0000
Message-ID: <e1371dbb-a33b-4246-b71d-0b56d5ad85cd@amd.com>
Date: Fri, 14 Nov 2025 13:26:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/20] drm/amdgpu: give each kernel job a unique id
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-2-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251113160632.5889-2-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW3PR12MB4361:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b814825-114b-4ca4-e6b7-08de23791a5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RllpVjlNbjlUMXJyd2t6TUhHUms5aDVmb0pwRGFrTk5tM01sVXAwbE80eWU4?=
 =?utf-8?B?WTVhYnljcVFIQUFQUFpHWHVvZkdtc3kwejRhK1Y3ZnJ1aloxK3UwbW9UZjBT?=
 =?utf-8?B?eGJMVzI0QmMwM05pd0xsZ3pwSndJNTJjQnNRaGZmNzZkS3RtVkh3a2Z6NGJx?=
 =?utf-8?B?cDIwZ0NBWHpZS0ZXcDA5Q20vaXRhVHNIT1hSMWs4TnViSFpUckdjWUFGVkhK?=
 =?utf-8?B?enhSYkVyYmNGVExES0M1Wk1SQ3lVQm42OW5TU0taVmNMTjRPZmJhYVh0eldx?=
 =?utf-8?B?WTR1bzhLOEc4QWxBZkpPOUtwd1hORDFMTDA4OWhmSmpiNEhYRmdpV2JLSlZC?=
 =?utf-8?B?cnFoNFNpMTgrM1IydHJkSmVDYVBkUzNKVmxJZjFBTE14ZHJFWGR0MUMrN3NY?=
 =?utf-8?B?U1UwTndickFwUml5RDlLckdlTVkxMlRjTGs1d3laZWM1OHU1d05idGRJRVZk?=
 =?utf-8?B?dEtaSTk3Q0hsTU50QTY0RldXTGRaaVVQZWNoUHh3TFhudHBEKzZBOG1XZU1P?=
 =?utf-8?B?REtWUHpVT3BRd2U2L1RYQjRyOUlZU2VvOUVuYkRMYjREaTFCaGc0OEZDaHZE?=
 =?utf-8?B?NHpRSzNZbG1wRXNNOTBVZHU2UzZFS1FxMS92eWFUOEVkOUR5RHNNM3ZSZ0U0?=
 =?utf-8?B?Y084R3V1ZGhPL05Rd2tqSDgzaGYzdVZxOEF6VWlVZ1JzeVpMV1I4QXFzZ0VE?=
 =?utf-8?B?eWQzUEVQQ1NNNE4yV3hOTFk0M0VhNTdUZGQwU25OL0pPTUVPVks0MEM2MzdS?=
 =?utf-8?B?UWhUVFlRWmR5VTZHa2hoS2NFTWxtUTJRNTR1aUNnWXZ0bEpCb3dhdm50TlFR?=
 =?utf-8?B?ZG4ydStIVE1RWUQwSDZWakUwQ2tRbmlQOVNpeU5WcTc5UEhtUkJreld5NTRI?=
 =?utf-8?B?TUp3azBVTlM2KzQzN1BsU0tOL1JJbXZEOG1aSkFIMmtBMTlRSlV1MVlJRDdS?=
 =?utf-8?B?NjlKcDJXZ3JoSXZxa3kxL09rczNmOXFsRXAzdmRtRTNTTlF5UGFrR0hGUG5J?=
 =?utf-8?B?N1lhamNncmZTeHdWMUlWbmVha1V0OElVUm8zc3hVbzJoYXd6WHVxYnlGcGpu?=
 =?utf-8?B?bEtFRzdFWmQzSXY3eUhpd3I2bFIwc2R1MlJhSDJodlFZekY5U1J2UUZCYnlN?=
 =?utf-8?B?Vm5ZUHdZaERSc1hicWlwQ1gyM2hyZjJYVTJ1Y0FEOG5SMFUwQ3h1SDNVQzNS?=
 =?utf-8?B?enBXWkFuSTR6MnJCWmp3RytTbDkzMUNyUjVwMkxJL3NGNTN4TWZxT3pPem1D?=
 =?utf-8?B?OWEya1AxcWR2bWlOR0VURjlaL2Z3czVieW5uTUZMd1BpOWlQc2YvTDdVczFT?=
 =?utf-8?B?YndpTmVUZ0Y0MjhQNGVWNnB6dk5qQVI1VmtiYmJBd3k3N3RIaFFNbzQ4YlF6?=
 =?utf-8?B?U2VpV0JRQzVOcXdkRWF3WCtiL0RFc2dxTTM5QzVYZkZndkpsUEM3RDFMdWxV?=
 =?utf-8?B?Vmt1cWgweXpqQTRKLzh5MVRqU3VwS2VQMG5xbnhCUk03MU9qS3dEYmZGTVlL?=
 =?utf-8?B?VUZoUVE2Z3hjRXQvN2NrWEhTZVhMSnUzaXRMQTNGd2tiZi9mTHBZWGdyY0Nv?=
 =?utf-8?B?ZGdLRFgyejFJQ3UzL3BYeU90RzlMa2ttb3lYck5IZVpyVVRIclhSa3BUNnZl?=
 =?utf-8?B?aDJ0VzV5ZFdJZW1DK0U5Z1ZWbXdSQ2I0cmJ3ZlVaYS9HREhHTWxoWVQ0STV6?=
 =?utf-8?B?eVZaZDBON25WR1JMbWovc01IRkhUOXRudjBkditMdUp4S29DVndDeHlWTkEr?=
 =?utf-8?B?emQwaUNjZnU2VVB5QUpnRXBXMldyVTN5WjhMczN3cm1ienRabzhIY2JLcmFz?=
 =?utf-8?B?dU53eVZKakNqMlNHV1hwK2JZL3JiT0N4b0hqMVd4K2RQd2NSQUtiQjd0a012?=
 =?utf-8?B?V0tiYTJjOVprc0FoQStIV1o4RmpWQWxldFl4NHhrdVkzeS9qVm82NDlyYTMw?=
 =?utf-8?B?ZkZBNUxYRllFaGpzTWNQeEpQaU13dmg5QnRJRTJpdjVwaWpwV05DdkVodVlR?=
 =?utf-8?B?Y3g3Mkw5VzNBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1hmYWRISEFvbnBPR0d3OTU0Y2xNdEF4MjhLQ0tGdmVUREY2dXJWNkxIZm4w?=
 =?utf-8?B?RUx3S1dER3N1dUNNY1lFa0tKRmpWd3JuWUZRVkxRWmExRjc3TlhVZ0tic1Zu?=
 =?utf-8?B?ZDcxUmZ6TngwcWV0Q3U3djI4V3JHc1dpbVh4OWZvQzJlcmM3bmNHNDEvQ0lr?=
 =?utf-8?B?RTgxeXNHTlpMWTlySVF3MkRWYUZBckNLV3FnUGovTnBPQjEweFFqRkt4b21P?=
 =?utf-8?B?YlR1WGdBMWlhM3R5eUVoa2k2MklUcUtha1hSWW9tRVNGaGFQalYyZmtuNEVh?=
 =?utf-8?B?SGMranRVSHJYNmtuT2ZWcHgwYk1VVXdjWTV4UDFmb1VGZ3pPTUR5bTd0U21L?=
 =?utf-8?B?YUJmQk9Wbmw2NjZXQ3dqSThZMnltRy9sQjc0ZDZjdmFHekJGVEh4cHNCQU5Y?=
 =?utf-8?B?RjZoWEJIUWVsc1F6MkhMTFJtaGdiWnhnZ2NidDh3Q1kwTGVaMkI0U0FOcG1L?=
 =?utf-8?B?bXZjQ29lUjZtcC96K1BzMGlvQ3puVDRJQ0NXWWp1TkUvUEI5Wit5YVNZZmJq?=
 =?utf-8?B?NFJQdlZ6VkhkMzBWZjQ5N1ZibEpMb3lCVUhkUDNmeS9HNFM5ZnBhbHhJVHYx?=
 =?utf-8?B?OEdra1RUN28zR203TXRJZ3FSMVFIdjdaMnhaMzFKRFE1TWdnZFZKNm5IekhY?=
 =?utf-8?B?MnMyMEtBWGVONE1JazVzank3QUkxVE80d0ErOERUclhqQUJNcldjd1djUVNp?=
 =?utf-8?B?QlJUeUFhMTA5NVBoTHVQaThFbXhqSjUrM1F3bVNNK3E1ekxuankwRlYxWWE2?=
 =?utf-8?B?NVZaQ01KV01wOHhjNmtKYmdPS29vN2xJbC9YZm5BYWZ4M1ZoTFlHcHNITFNr?=
 =?utf-8?B?RGxVeVV1c2NrOHlIMFNRREkzUjgzWEdyOFBXSXpCZ041L2gvd2loSGx2SjVq?=
 =?utf-8?B?TjdXbTl3eURheE4yQ1ZUVSsydldDRnFOdWlVY3JIM2FvM2ZrejN1QU5veFBh?=
 =?utf-8?B?NkZKVHNRUjBqWVkxUWYyNGJLZGp5QmFRb08venM0bzRFQWR2UURYNk9mV3c1?=
 =?utf-8?B?cWFzRlFsKy8vZEtwQ2RYVXJrbVlPQ2F5c2IzeE1LcjVZa2E4bmdCRTBSUkxh?=
 =?utf-8?B?SnhGNGx2dGJ3MU0wcXdPNElMTzFUanhWVUZQbWVqSXZmclVrdU5GUkVZNm4r?=
 =?utf-8?B?MDFOY3hmdmk2SnBZQ05yTVB1cHc3cDg5SFlha25DOE5qdXBrY0JzdzV6VzI1?=
 =?utf-8?B?STExM2VaZXVmQ1ZkeldhQmtnS3QzUEhwaEt1WVRxUkUwQ2Z3R3pycWM2cjBN?=
 =?utf-8?B?RGF0NXd1UWx6NDdnb1hpNE5XQVM5Tk05d0E5NnBscXl1SXcwdGRYOFZWNW5H?=
 =?utf-8?B?UHVjSkxvMlJtemRTZnQrR1BYeWk5TlY0SGwwK3o2bDFtQ3FOK21SSkEzaGhZ?=
 =?utf-8?B?WmxYTjV4Y241djErcWhOY0N5VmhOWUpCNGZqampVdnVOQ1RIemRqTUkzRHhB?=
 =?utf-8?B?TlhPbUhkU2tLZW5nK3JEcW9LLy9uSFBDWVJpRlZTejFXdkRtRlYwbzlUTlZ4?=
 =?utf-8?B?NkhZd0ZmaklrZ2FrWm9hMWluTm1xdjR5NU5iRG8zcEtFbUpQbU8zdEFuZCtw?=
 =?utf-8?B?SU9TaVFTeG14ZENWMzA1Z2VJWDhsYkpDOXNzbnlUUWZEVzIwOWdaYWhqZnhO?=
 =?utf-8?B?ZWcrNzVsSGw4blgzOFpTb0ZmRC9laFREdWR6UzhkbllEUWdzNEZIcnRpTVQ4?=
 =?utf-8?B?bkkvRVN3TjYxVlhEb1lsOWNadWxHZnZzT3hrZVhWb0RXU1NQWG1PdXlrT3kw?=
 =?utf-8?B?bXhNYUsxNWQ5aVJ1ZERkcE9NNHFPZXhYbHdrMHFrc0VZWTdyUkxSVE01cjRH?=
 =?utf-8?B?d3pjQ0JuSmVWTWZQVUIzZzVUMk11UG9sSEp3SUN1WmRBMU5HaFRab1VaSXRl?=
 =?utf-8?B?amsvTmswdkJBZFN1ZG8wV2NCRUlSVnREN1ZKL3F6RjJTL1V1bUZOSVp6c2hi?=
 =?utf-8?B?a2xSNmVHcFk2SFprb0NZMXJNaVVLNFZEVmMwdVJiRW80YVBrdFRZREJrVld3?=
 =?utf-8?B?aEtVUTdMeldVOUo3L2dMVlJRZ3dGUnljdlQ2NUNHYjlhUys5eStqYWZScVBD?=
 =?utf-8?B?TFFORE84MUJFdlZ1d1liU1J5NzljOGxFTHJhaVVCOXVJOEp5NXpuVDVGM3Fm?=
 =?utf-8?Q?OvN1Hr2xeaZITK08ftTeBFUbB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b814825-114b-4ca4-e6b7-08de23791a5b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 12:26:57.6298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rG6I4HDcfeWxzRsO3YWx5GAOkSSz59sVg5adRxiyz3r5IXFyvdLiZhIWs4opMAJR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4361
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

On 11/13/25 17:05, Pierre-Eric Pelloux-Prayer wrote:
> Userspace jobs have drm_file.client_id as a unique identifier
> as job's owners. For kernel jobs, we can allocate arbitrary
> values - the risk of overlap with userspace ids is small (given
> that it's a u64 value).
> In the unlikely case the overlap happens, it'll only impact
> trace events.
> 
> Since this ID is traced in the gpu_scheduler trace events, this
> allows to determine the source of each job sent to the hardware.
> 
> To make grepping easier, the IDs are defined as they will appear
> in the trace output.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Link: https://lore.kernel.org/r/20250604122827.2191-1-pierre-eric.pelloux-prayer@amd.com

Acked-by: Christian König <christian.koenig@amd.com>

You should probably start pushing this patch to amd-staging-drm-next even when not the full patch set is reviewed.

We need to get this partially merged through drm-misc-next because of the TTM dependencies anyway.

Regards,
Christian

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c     |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c     |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  5 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.h     | 19 +++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c    |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 28 +++++++++++++--------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c     |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c     |  5 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c     |  8 +++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  6 +++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c  |  4 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c   |  4 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 12 +++++----
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c       |  6 +++--
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c       |  6 +++--
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c    |  3 ++-
>  19 files changed, 84 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> index 3d24f9cd750a..29c927f4d6df 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -1549,7 +1549,8 @@ static int amdgpu_gfx_run_cleaner_shader_job(struct amdgpu_ring *ring)
>  	owner = (void *)(unsigned long)atomic_inc_return(&counter);
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, &entity, owner,
> -				     64, 0, &job);
> +				     64, 0, &job,
> +				     AMDGPU_KERNEL_JOB_ID_CLEANER_SHADER);
>  	if (r)
>  		goto err;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> index 97b562a79ea8..9dcf51991b5b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -690,7 +690,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>  	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.high_pr,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
> -				     &job);
> +				     &job, AMDGPU_KERNEL_JOB_ID_FLUSH_GPU_TLB);
>  	if (r)
>  		goto error_alloc;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 55c7e104d5ca..3457bd649623 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -234,11 +234,12 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
>  			     struct drm_sched_entity *entity, void *owner,
>  			     size_t size, enum amdgpu_ib_pool_type pool_type,
> -			     struct amdgpu_job **job)
> +			     struct amdgpu_job **job, u64 k_job_id)
>  {
>  	int r;
>  
> -	r = amdgpu_job_alloc(adev, NULL, entity, owner, 1, job, 0);
> +	r = amdgpu_job_alloc(adev, NULL, entity, owner, 1, job,
> +			     k_job_id);
>  	if (r)
>  		return r;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> index d25f1fcf0242..7abf069d17d4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> @@ -44,6 +44,22 @@
>  struct amdgpu_fence;
>  enum amdgpu_ib_pool_type;
>  
> +/* Internal kernel job ids. (decreasing values, starting from U64_MAX). */
> +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE              (18446744073709551615ULL)
> +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE_PDES         (18446744073709551614ULL)
> +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE_RANGE        (18446744073709551613ULL)
> +#define AMDGPU_KERNEL_JOB_ID_VM_PT_CLEAR            (18446744073709551612ULL)
> +#define AMDGPU_KERNEL_JOB_ID_TTM_MAP_BUFFER         (18446744073709551611ULL)
> +#define AMDGPU_KERNEL_JOB_ID_TTM_ACCESS_MEMORY_SDMA (18446744073709551610ULL)
> +#define AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER        (18446744073709551609ULL)
> +#define AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE       (18446744073709551608ULL)
> +#define AMDGPU_KERNEL_JOB_ID_MOVE_BLIT              (18446744073709551607ULL)
> +#define AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER       (18446744073709551606ULL)
> +#define AMDGPU_KERNEL_JOB_ID_CLEANER_SHADER         (18446744073709551605ULL)
> +#define AMDGPU_KERNEL_JOB_ID_FLUSH_GPU_TLB          (18446744073709551604ULL)
> +#define AMDGPU_KERNEL_JOB_ID_KFD_GART_MAP           (18446744073709551603ULL)
> +#define AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST          (18446744073709551602ULL)
> +
>  struct amdgpu_job {
>  	struct drm_sched_job    base;
>  	struct amdgpu_vm	*vm;
> @@ -97,7 +113,8 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
>  			     struct drm_sched_entity *entity, void *owner,
>  			     size_t size, enum amdgpu_ib_pool_type pool_type,
> -			     struct amdgpu_job **job);
> +			     struct amdgpu_job **job,
> +			     u64 k_job_id);
>  void amdgpu_job_set_resources(struct amdgpu_job *job, struct amdgpu_bo *gds,
>  			      struct amdgpu_bo *gws, struct amdgpu_bo *oa);
>  void amdgpu_job_free_resources(struct amdgpu_job *job);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> index 91678621f1ff..63ee6ba6a931 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> @@ -196,7 +196,8 @@ static int amdgpu_jpeg_dec_set_reg(struct amdgpu_ring *ring, uint32_t handle,
>  	int i, r;
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
> -				     AMDGPU_IB_POOL_DIRECT, &job);
> +				     AMDGPU_IB_POOL_DIRECT, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index fe486988a738..e08f58de4b17 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1321,7 +1321,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>  	if (r)
>  		goto out;
>  
> -	r = amdgpu_fill_buffer(abo, 0, &bo->base._resv, &fence, true);
> +	r = amdgpu_fill_buffer(abo, 0, &bo->base._resv, &fence, true,
> +			       AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
>  	if (WARN_ON(r))
>  		goto out;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index e226c3aff7d7..326476089db3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -227,7 +227,8 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
>  	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     num_dw * 4 + num_bytes,
> -				     AMDGPU_IB_POOL_DELAYED, &job);
> +				     AMDGPU_IB_POOL_DELAYED, &job,
> +				     AMDGPU_KERNEL_JOB_ID_TTM_MAP_BUFFER);
>  	if (r)
>  		return r;
>  
> @@ -406,7 +407,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>  		struct dma_fence *wipe_fence = NULL;
>  
>  		r = amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
> -				       false);
> +				       false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
>  		if (r) {
>  			goto error;
>  		} else if (wipe_fence) {
> @@ -1488,7 +1489,8 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
>  	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     num_dw * 4, AMDGPU_IB_POOL_DELAYED,
> -				     &job);
> +				     &job,
> +				     AMDGPU_KERNEL_JOB_ID_TTM_ACCESS_MEMORY_SDMA);
>  	if (r)
>  		goto out;
>  
> @@ -2212,7 +2214,7 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
>  				  struct dma_resv *resv,
>  				  bool vm_needs_flush,
>  				  struct amdgpu_job **job,
> -				  bool delayed)
> +				  bool delayed, u64 k_job_id)
>  {
>  	enum amdgpu_ib_pool_type pool = direct_submit ?
>  		AMDGPU_IB_POOL_DIRECT :
> @@ -2222,7 +2224,7 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
>  						    &adev->mman.high_pr;
>  	r = amdgpu_job_alloc_with_ib(adev, entity,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
> -				     num_dw * 4, pool, job);
> +				     num_dw * 4, pool, job, k_job_id);
>  	if (r)
>  		return r;
>  
> @@ -2262,7 +2264,8 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>  	num_loops = DIV_ROUND_UP(byte_count, max_bytes);
>  	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->copy_num_dw, 8);
>  	r = amdgpu_ttm_prepare_job(adev, direct_submit, num_dw,
> -				   resv, vm_needs_flush, &job, false);
> +				   resv, vm_needs_flush, &job, false,
> +				   AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER);
>  	if (r)
>  		return r;
>  
> @@ -2297,7 +2300,8 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
>  			       uint64_t dst_addr, uint32_t byte_count,
>  			       struct dma_resv *resv,
>  			       struct dma_fence **fence,
> -			       bool vm_needs_flush, bool delayed)
> +			       bool vm_needs_flush, bool delayed,
> +			       u64 k_job_id)
>  {
>  	struct amdgpu_device *adev = ring->adev;
>  	unsigned int num_loops, num_dw;
> @@ -2310,7 +2314,7 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
>  	num_loops = DIV_ROUND_UP_ULL(byte_count, max_bytes);
>  	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->fill_num_dw, 8);
>  	r = amdgpu_ttm_prepare_job(adev, false, num_dw, resv, vm_needs_flush,
> -				   &job, delayed);
> +				   &job, delayed, k_job_id);
>  	if (r)
>  		return r;
>  
> @@ -2380,7 +2384,8 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  			goto err;
>  
>  		r = amdgpu_ttm_fill_mem(ring, 0, addr, size, resv,
> -					&next, true, true);
> +					&next, true, true,
> +					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
>  		if (r)
>  			goto err;
>  
> @@ -2399,7 +2404,8 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>  			uint32_t src_data,
>  			struct dma_resv *resv,
>  			struct dma_fence **f,
> -			bool delayed)
> +			bool delayed,
> +			u64 k_job_id)
>  {
>  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>  	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> @@ -2429,7 +2435,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>  			goto error;
>  
>  		r = amdgpu_ttm_fill_mem(ring, src_data, to, cur_size, resv,
> -					&next, true, delayed);
> +					&next, true, delayed, k_job_id);
>  		if (r)
>  			goto error;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 054d48823d5f..577ee04ce0bf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -175,7 +175,8 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>  			uint32_t src_data,
>  			struct dma_resv *resv,
>  			struct dma_fence **fence,
> -			bool delayed);
> +			bool delayed,
> +			u64 k_job_id);
>  
>  int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
>  void amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> index 74758b5ffc6c..5c38f0d30c87 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -1136,7 +1136,8 @@ static int amdgpu_uvd_send_msg(struct amdgpu_ring *ring, struct amdgpu_bo *bo,
>  	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->uvd.entity,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     64, direct ? AMDGPU_IB_POOL_DIRECT :
> -				     AMDGPU_IB_POOL_DELAYED, &job);
> +				     AMDGPU_IB_POOL_DELAYED, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> index b9060bcd4806..ce318f5de047 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> @@ -449,7 +449,7 @@ static int amdgpu_vce_get_create_msg(struct amdgpu_ring *ring, uint32_t handle,
>  	r = amdgpu_job_alloc_with_ib(ring->adev, &ring->adev->vce.entity,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
> -				     &job);
> +				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> @@ -540,7 +540,8 @@ static int amdgpu_vce_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     ib_size_dw * 4,
>  				     direct ? AMDGPU_IB_POOL_DIRECT :
> -				     AMDGPU_IB_POOL_DELAYED, &job);
> +				     AMDGPU_IB_POOL_DELAYED, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> index 5ae7cc0d5f57..5e0786ea911b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> @@ -626,7 +626,7 @@ static int amdgpu_vcn_dec_send_msg(struct amdgpu_ring *ring,
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>  				     64, AMDGPU_IB_POOL_DIRECT,
> -				     &job);
> +				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		goto err;
>  
> @@ -806,7 +806,7 @@ static int amdgpu_vcn_dec_sw_send_msg(struct amdgpu_ring *ring,
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>  				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
> -				     &job);
> +				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		goto err;
>  
> @@ -936,7 +936,7 @@ static int amdgpu_vcn_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t hand
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>  				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
> -				     &job);
> +				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> @@ -1003,7 +1003,7 @@ static int amdgpu_vcn_enc_get_destroy_msg(struct amdgpu_ring *ring, uint32_t han
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>  				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
> -				     &job);
> +				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index db66b4232de0..2f8e83f840a8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -983,7 +983,8 @@ int amdgpu_vm_update_pdes(struct amdgpu_device *adev,
>  	params.vm = vm;
>  	params.immediate = immediate;
>  
> -	r = vm->update_funcs->prepare(&params, NULL);
> +	r = vm->update_funcs->prepare(&params, NULL,
> +				      AMDGPU_KERNEL_JOB_ID_VM_UPDATE_PDES);
>  	if (r)
>  		goto error;
>  
> @@ -1152,7 +1153,8 @@ int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  		dma_fence_put(tmp);
>  	}
>  
> -	r = vm->update_funcs->prepare(&params, sync);
> +	r = vm->update_funcs->prepare(&params, sync,
> +				      AMDGPU_KERNEL_JOB_ID_VM_UPDATE_RANGE);
>  	if (r)
>  		goto error_free;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index 77207f4e448e..cf0ec94e8a07 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -308,7 +308,7 @@ struct amdgpu_vm_update_params {
>  struct amdgpu_vm_update_funcs {
>  	int (*map_table)(struct amdgpu_bo_vm *bo);
>  	int (*prepare)(struct amdgpu_vm_update_params *p,
> -		       struct amdgpu_sync *sync);
> +		       struct amdgpu_sync *sync, u64 k_job_id);
>  	int (*update)(struct amdgpu_vm_update_params *p,
>  		      struct amdgpu_bo_vm *bo, uint64_t pe, uint64_t addr,
>  		      unsigned count, uint32_t incr, uint64_t flags);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> index 0c1ef5850a5e..22e2e5b47341 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> @@ -40,12 +40,14 @@ static int amdgpu_vm_cpu_map_table(struct amdgpu_bo_vm *table)
>   *
>   * @p: see amdgpu_vm_update_params definition
>   * @sync: sync obj with fences to wait on
> + * @k_job_id: the id for tracing/debug purposes
>   *
>   * Returns:
>   * Negativ errno, 0 for success.
>   */
>  static int amdgpu_vm_cpu_prepare(struct amdgpu_vm_update_params *p,
> -				 struct amdgpu_sync *sync)
> +				 struct amdgpu_sync *sync,
> +				 u64 k_job_id)
>  {
>  	if (!sync)
>  		return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> index 30022123b0bf..f794fb1cc06e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> @@ -26,6 +26,7 @@
>  #include "amdgpu.h"
>  #include "amdgpu_trace.h"
>  #include "amdgpu_vm.h"
> +#include "amdgpu_job.h"
>  
>  /*
>   * amdgpu_vm_pt_cursor - state for for_each_amdgpu_vm_pt
> @@ -395,7 +396,8 @@ int amdgpu_vm_pt_clear(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  	params.vm = vm;
>  	params.immediate = immediate;
>  
> -	r = vm->update_funcs->prepare(&params, NULL);
> +	r = vm->update_funcs->prepare(&params, NULL,
> +				      AMDGPU_KERNEL_JOB_ID_VM_PT_CLEAR);
>  	if (r)
>  		goto exit;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> index 46d9fb433ab2..36805dcfa159 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> @@ -40,7 +40,7 @@ static int amdgpu_vm_sdma_map_table(struct amdgpu_bo_vm *table)
>  
>  /* Allocate a new job for @count PTE updates */
>  static int amdgpu_vm_sdma_alloc_job(struct amdgpu_vm_update_params *p,
> -				    unsigned int count)
> +				    unsigned int count, u64 k_job_id)
>  {
>  	enum amdgpu_ib_pool_type pool = p->immediate ? AMDGPU_IB_POOL_IMMEDIATE
>  		: AMDGPU_IB_POOL_DELAYED;
> @@ -56,7 +56,7 @@ static int amdgpu_vm_sdma_alloc_job(struct amdgpu_vm_update_params *p,
>  	ndw = min(ndw, AMDGPU_VM_SDMA_MAX_NUM_DW);
>  
>  	r = amdgpu_job_alloc_with_ib(p->adev, entity, AMDGPU_FENCE_OWNER_VM,
> -				     ndw * 4, pool, &p->job);
> +				     ndw * 4, pool, &p->job, k_job_id);
>  	if (r)
>  		return r;
>  
> @@ -69,16 +69,17 @@ static int amdgpu_vm_sdma_alloc_job(struct amdgpu_vm_update_params *p,
>   *
>   * @p: see amdgpu_vm_update_params definition
>   * @sync: amdgpu_sync object with fences to wait for
> + * @k_job_id: identifier of the job, for tracing purpose
>   *
>   * Returns:
>   * Negativ errno, 0 for success.
>   */
>  static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
> -				  struct amdgpu_sync *sync)
> +				  struct amdgpu_sync *sync, u64 k_job_id)
>  {
>  	int r;
>  
> -	r = amdgpu_vm_sdma_alloc_job(p, 0);
> +	r = amdgpu_vm_sdma_alloc_job(p, 0, k_job_id);
>  	if (r)
>  		return r;
>  
> @@ -249,7 +250,8 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
>  			if (r)
>  				return r;
>  
> -			r = amdgpu_vm_sdma_alloc_job(p, count);
> +			r = amdgpu_vm_sdma_alloc_job(p, count,
> +						     AMDGPU_KERNEL_JOB_ID_VM_UPDATE);
>  			if (r)
>  				return r;
>  		}
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> index 1c07b701d0e4..ceb94bbb03a4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> @@ -217,7 +217,8 @@ static int uvd_v6_0_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t handle
>  	int i, r;
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
> -				     AMDGPU_IB_POOL_DIRECT, &job);
> +				     AMDGPU_IB_POOL_DIRECT, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> @@ -281,7 +282,8 @@ static int uvd_v6_0_enc_get_destroy_msg(struct amdgpu_ring *ring,
>  	int i, r;
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
> -				     AMDGPU_IB_POOL_DIRECT, &job);
> +				     AMDGPU_IB_POOL_DIRECT, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> index 9d237b5937fb..1f8866f3f63c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> @@ -225,7 +225,8 @@ static int uvd_v7_0_enc_get_create_msg(struct amdgpu_ring *ring, u32 handle,
>  	int i, r;
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
> -				     AMDGPU_IB_POOL_DIRECT, &job);
> +				     AMDGPU_IB_POOL_DIRECT, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> @@ -288,7 +289,8 @@ static int uvd_v7_0_enc_get_destroy_msg(struct amdgpu_ring *ring, u32 handle,
>  	int i, r;
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
> -				     AMDGPU_IB_POOL_DIRECT, &job);
> +				     AMDGPU_IB_POOL_DIRECT, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 3653c563ee9a..46c84fc60af1 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -67,7 +67,8 @@ svm_migrate_gart_map(struct amdgpu_ring *ring, u64 npages,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     num_dw * 4 + num_bytes,
>  				     AMDGPU_IB_POOL_DELAYED,
> -				     &job);
> +				     &job,
> +				     AMDGPU_KERNEL_JOB_ID_KFD_GART_MAP);
>  	if (r)
>  		return r;
>  

