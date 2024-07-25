Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8379F93BD31
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 09:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D1510E178;
	Thu, 25 Jul 2024 07:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="n+Hjp/YK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA6E8922E;
 Thu, 25 Jul 2024 07:37:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fDBG8UxTokmEms26w6IAvLGxSqtK+5YfhqUj0SJl7RkZn4d7mMtDB7dsBkVTx8Ou4ZlXAu8Ozy9LlkjQy2+l9YeLwqJtY3ND8ofqSPwSYZDizxAF9CWmh8INlwDXH2cNDzlycDqiy+Dkyo05nADeTBbnIvdVDMhKGarmNsbqiOogS/DEclvkqFFoNeWK4PVpFPxhV0EZlfKdxLWL/Qljl3env0D4oE+FDmCLHWO3XIntMrOBFwZuWH9Acjy0CrvszPv62MGH+296PBZarhTrMZqoM93+TWPjeJ8MreDDjBmqIFhp8EpW95z6MMG+ElcM0s1faiaTtxNU65jMbOedVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwO+mGmZc1bkDwKVOMalKRyZ+SivGlQal5/cAj97JuE=;
 b=CD0fynk7e5dU6wnNANSFAzMYcJqcgDjo47m/8dXO49cFbgITGAfd3mLs/6IkuwwnJsvFA9zGzoveQ49T1mjwqusTTciYeY9AoKPIu0e18cqJN3B7tA67u6vR0lMykfLOgcdWqytcEHI8+h/uDx85qJN8umwp24djZUJjxoxyCfWEY61Zlr0ZCXT8qs33I54qYIbE6JrMwCNu+vz9CTq1RTQ3PxQTsYG1tZLz/lElX4QPB6jK1r1nyR9mFk+WorNRSHwyLFZcTsDK+qh+j4Rb6tPKknHDssjL2+VsfjL/qWX8eY0+UienMDYFY1J3Xxc32poB8AivpVwBCy+wTiRa5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwO+mGmZc1bkDwKVOMalKRyZ+SivGlQal5/cAj97JuE=;
 b=n+Hjp/YKvlIg5t14wnmDpxFhrRYy1Riyb2gGvIzjf+ZtJnMbPlJHL2lOnrJGLWny1BvVy3hZ0fLgpXmZvmwmpKi0jDkkAkoj4SjNEkC5nsFfuo8UIqQ6dt4g320c8xS95wtPbMENSpwMLU2HAwWow+DqXb6vuqWJVOdKHKm8HKQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB8827.namprd12.prod.outlook.com (2603:10b6:510:26b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Thu, 25 Jul
 2024 07:37:43 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7784.017; Thu, 25 Jul 2024
 07:37:43 +0000
Message-ID: <429968dc-03e3-4755-865f-b6a844db7f0e@amd.com>
Date: Thu, 25 Jul 2024 09:37:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Add error code parameter to drm_sched_start
To: vitaly.prosyak@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 jesse.zhang@amd.com
References: <20240724184340.183606-1-vitaly.prosyak@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240724184340.183606-1-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0016.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB8827:EE_
X-MS-Office365-Filtering-Correlation-Id: 369680e0-78b3-4f1e-4551-08dcac7cab51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUZxci9TaVNYbXdTQjVka05tUGMrbkxpaXVzTTU1d2VjbExwKzBOendiY3dL?=
 =?utf-8?B?YkhMSnFnSW9tVnYwS2tUbG50dDRVZnVFcTlQOWNacjJTOXZoUmN4NnAvQW9q?=
 =?utf-8?B?N05YQVhlcXRzOTBDa3d4TzlucC9PeUFPREQyOUYwaTFQdjhoSGtKamc4Y2ZF?=
 =?utf-8?B?b0NMN1luKzgwNkJEQXJaQ0lzdXpBSnlkQThtWHNES2M1Wm5xSXA3R3FHMUJV?=
 =?utf-8?B?RXZXeXRXbHJkbVAzQU9yTVg2ZHRPYmJDem5rSktuY0UwK2dMZnJzQ2V0RWxZ?=
 =?utf-8?B?eE5DTkFTeXRyLzJzck4xYUlRdkVUL1JFR0tJTGFJeUEyaXhLbDV5YUx6bGVL?=
 =?utf-8?B?dnEwWWdQWFpXQWtTVjhIZnc2RVFYdElWajBHbGZTZjBZeFB1citsbGltQlNL?=
 =?utf-8?B?WldpNnByNC9jVCtiK3gzdlp4dFFFNS9GY21BdDAzL0hnNXFRU1VuZWI4Ry93?=
 =?utf-8?B?MHZtaEhnQVF0clA0WDJYbmhjZXdtYmYvWVgrTlhHR0NWamt1SE5hUk1QbkRw?=
 =?utf-8?B?RVJCcGxyZ09lNkdIMittZ293ZTFlM0ZXc3lVQ0lOU1F6Zi95UTRWeGZ4ZzNS?=
 =?utf-8?B?Z3dBdVZJTjRONGxETW4xK0VwaXhwZktVQXVIenkyL0Q5WFFIWk5hK3lPL3R6?=
 =?utf-8?B?aUlzYndBQXJRdUJ2Vm1vT1pSTDNLNGFaS3oxbUZneng0ckVIU2xtWnBZUzFq?=
 =?utf-8?B?WHRLbDJLTGNhL2d6dFhJRFgyejRaYnViVDNycDhsSFpSemhRUmNoYXd6aTg4?=
 =?utf-8?B?OERoZG1NdFh3VXNOOEtvbjEydnY0eG85c1phaHAzaDRyR285U3A4elNjK2Jn?=
 =?utf-8?B?Z1BaVEZobkhtMzRzeEFPcnZyZGFSRG1YZGZFYXpuZnZkdDZTOXFhaHlHNVRv?=
 =?utf-8?B?bllEcXVMNjNFVVZCMStTU0xnaUV0YVUzWUluY1UvQ1BGRFIzQjAyVEpwTlNw?=
 =?utf-8?B?UUpwaVVDeWNhbm8xRjlhZlF5U0FYMFdJbDNrcEFDOEQ3MmI1TERUbHV2ZS81?=
 =?utf-8?B?aW51M1dGMm5UN1ZjY2JxUmtNWm9sUVF5eHR6THFzKzJ4VWdDTEgvdHpPVGdD?=
 =?utf-8?B?b3BuVVQ0VlJuQWN3ODR3S2hNeGxpUWJyajk5SU9UM29DTVVWbFVkQ2ZFTkdL?=
 =?utf-8?B?c1Vla2NBYWpJWHpDd2lGYWh2ZGs5WU0za29JTXcyWm93R0hYbzhwMlFQREVo?=
 =?utf-8?B?U3c4NW83Nng4SmJLa096TFF2dDhwZzZESHh2Vk1uNVJlL2tIa3dLanFUbU8x?=
 =?utf-8?B?ejhCM1FUaktSNVFKUjk3dDlKc2RKWVZPb3BtdUNVaWNDODBpSUJPYmJzRUI5?=
 =?utf-8?B?OFdqcXpWSG9wQ0FEVHgwSWk5RVIvNGJIWXRDbG1OZWFGTHhNUnVsd3daeStq?=
 =?utf-8?B?cHhyQ1YyNXJiUFNLNGQ1YVVIWlRQckpOREY5b3cvZEZOT3NtSDRSeHJwdkg0?=
 =?utf-8?B?K3hJaXFtS2JYcU04ZU5HbThka0Y3aSt3enVQc203S2NpU09wdUVVRURFSHVx?=
 =?utf-8?B?MHZibk5PTXU5SW5FN25Id3lBaC9KQnlBOHJYMWRSMEk2YVF2b2tmSHpGMTlW?=
 =?utf-8?B?bGNOclRzYnhqSmM0WjNrenBZUkZaMjFjVWQ1NFJ4WmxsQjlFVUdZZTg5b01w?=
 =?utf-8?B?TFVOMXJNZUFJK3hrYllKdmk2aG5yU09nV24rbFZkemZVVUtKa21jL1NXSVFm?=
 =?utf-8?B?TXlhZmtEMjVvR2dzY2hBYTdxWkZSanVxdTZpWUt5UlBSSU1DZldyR3h5SWtN?=
 =?utf-8?B?N0V2eGVUVHNnaVVkbGNrZUJIWndJUzlpNnJBMkMwL05OUmFuVzlQMmVZMG9v?=
 =?utf-8?B?TVpYeGRsWE1PWUI0SXZiQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWlUSVF0YVFaMjZ6TGR6OUdqMFVoczBHL09XSFFWNHhNTnJIaXZMVHhTa01w?=
 =?utf-8?B?S2kxUjg4dFhVWllrakVVb2xiSVNwaFhwZXpSRWVweEJadlpucEgycTQ5NCtS?=
 =?utf-8?B?bHZEcnRXQkNGYlcyTjIyS0Fia0Q3WHRsVkVOcktwRFBHUy8yKy9xWjlrbkhH?=
 =?utf-8?B?ZmRobEZadzRva1hqUThnY1N1VFFIYXgxUEVpTXBCSE9DR00wcXBIOHhOZGFt?=
 =?utf-8?B?WVNEQUJjL1IwaU82UlVXTkliaThrRUtZNnZHeHFHNEw1UW1XTk56RzVlMmli?=
 =?utf-8?B?dUJUclludUExcHJla0p0ZHkyR0ZtcmlNdFRneXBNKzJVdm1tdDhxVCt2R2x1?=
 =?utf-8?B?cDZ4KzhlRkZxM0pUdHJ4WGd3OTlhQVBpRkI4U1I1eVBiNXVUSzBNam9XVTJY?=
 =?utf-8?B?czF5bGdQNi9hU05XK0ZWS0VzWXdoeWIramhLcUYwZm4wakpRZktNV1NST1ZI?=
 =?utf-8?B?MWJvZCs0RDB2cmUrSVVXUzNGV1V5dlo2RHhUS3hlby81d0dqNnNnU2dIaXVH?=
 =?utf-8?B?T3FGN09NM1MwVU5CVFY2Q1BlSm01UXFlRkg1Z0gxRWtRbVVIZEtpMmFHV2Jn?=
 =?utf-8?B?MU1PZmNNOVlwN2FWMURpVUtpNWpHbEQ2ZVM5YU4xcTRxc3VGS1AwRm1RRHJJ?=
 =?utf-8?B?NlBoMXVsVUNiY2RES2JubnFXeVpvWWxycUwzS1FRRWI1NnJqSXdhQzRVWGQ5?=
 =?utf-8?B?KzNQaVZyWEpYdVc3RXR2WE1nNDdQSEFqZkdRY04zK1lOcVZaejlqbnk3WWpY?=
 =?utf-8?B?SkNUbThSMWxidi83UTE2UUNBM2xQdWRRaDhHWWhLeWZtVUZFei90RkI1ZGpO?=
 =?utf-8?B?RFZOc1d2SUppd2JxTlNXclV2bEZKL2RLNlY3MXRqNkh3U2FhZmNrWFR4WUFI?=
 =?utf-8?B?NG9heUVpQlppM0F2NmsyM3Zzd3d4S3FYQlF1cDhOcFpmU3o5bVZieEdocEly?=
 =?utf-8?B?QmxmOXdnZW5kNDdZVlp5QVRLTmRRNlcwemdPOVN2ODFZSmJEN0VlTnV6VHYx?=
 =?utf-8?B?SWgrdjZZYVc1RkpjUmRZcGZFTndhb2wrNzgrUUI5Tk9MVTdVS2swbU1oYzMv?=
 =?utf-8?B?aUZjMUNXVW9pT2Jqc1E0ZzIydmtLdG9KOU02diszS29mY0dNQ3dvU1cwdmFk?=
 =?utf-8?B?OVI4OU9tN2J5bytKdHBYbHVFT1JxUkNrV1dQZHRHNEl2dW5IS25Id3c1Y1p1?=
 =?utf-8?B?M3BlMmQzcVl4MG5Fb2JkbUtCdjZXMXczVVJpdEJsZTBGQS9La0RNdG5laE1B?=
 =?utf-8?B?K254TmV4M0pBK1FFODVRUVBJSFhMM3pvMjIwUWdwWlh5dUk0SGwyWDZrZGtq?=
 =?utf-8?B?cjNCdGtyaG9lbFA1OHVJbFB1RlFERzg4cGZFd1E2cnFVeS9Xd1ViSkVyU21E?=
 =?utf-8?B?VDlSb2lDVkxSZ2pIemhMbDZRWldZLy9ja2pQT0RMZlJCYm53UXRCdE9HMVhj?=
 =?utf-8?B?dlIvZzM4N1hXdFBFM0dsRElURFZXeUxIQ3NJVjJNNmxLc3ZhblhJN3I2cVpK?=
 =?utf-8?B?YWhkc3RQS1NOWStmMnpxSnBsMWxTeUJLMXpLZktKMWVLUHFJTG9ONGtzNDZX?=
 =?utf-8?B?YWZpa0NyM0QxRW55THRzU1NYVHVJSGdxNUJ1YngxWVB3QUpPYnlZWDkwTTh0?=
 =?utf-8?B?S3l4V2RnUXBBdWJZdHRBYTNDRVZDTW1OUzZMZXRLS3FwZUJ3dVlpaFJrSUVj?=
 =?utf-8?B?RFRmaGo0SjFIaStvdmprM2gvUTBna1I5Y3VKeEVub0tQWjVLU09XamhpV3kz?=
 =?utf-8?B?cVZFK0NqTDRVQU0zMUwxUmtwbnhsREtoTFRUemhlUyttN0lFL1N6Z2I1bkhO?=
 =?utf-8?B?d0Y3L0p1c3lFL2YzSFBHeGEvbThOdGc2QnplUTV3YjFkM0lYZS8yMXNCRkp6?=
 =?utf-8?B?Q0YwVWxyaklGNzJ0OWxQSnh6MGV3V1pqU0lHL2JYWGt2WWQ2Wk9hMkpEVGx6?=
 =?utf-8?B?WEVrZVlqbmU1aWIyLzd0YlVPcThXN2VTQnpXT1VadDNxM2xTc0NmQ0JPZHRw?=
 =?utf-8?B?Rnp2N2I4ZHRtOXp4Z0hrSEJVaVNBZTRzRHFzblpXaGt6S3NzSEllZ3ZrTkNP?=
 =?utf-8?B?Yk03OG04RGFrQ3dySElGNHZQM2VUdk9TNUQ1U0xpSWF0bzNlakc1emhmTXFY?=
 =?utf-8?Q?1HL+w0uhj3KIT0+U3Mxx9PpRV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 369680e0-78b3-4f1e-4551-08dcac7cab51
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 07:37:43.2336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TztDNnbGBWvpEQ2QanlRSgmtSKPbb/1zztnf3vhhDuFU2BaSmJUD1lvtJ/Jsgmha
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8827
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

Am 24.07.24 um 20:43 schrieb vitaly.prosyak@amd.com:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> The current implementation of drm_sched_start uses a hardcoded -ECANCELED to dispose of a job when
> the parent/hw fence is NULL. This results in drm_sched_job_done being called with -ECANCELED for
> each job with a NULL parent in the pending list, making it difficult to distinguish between recovery
> methods, whether a queue reset or a full GPU reset was used. To improve this, we first try a soft
> recovery for timeout jobs and use the error code -ENODATA. If soft recovery fails, we proceed with
> a queue reset, where the error code would still be -ENODATA for the job. Finally, for a full GPU
> reset, we use error codes -ECANCELED or -ETIME. This patch adds an error code parameter to
> drm_sched_start, allowing us to differentiate between queue reset and GPU reset failures.
> This enables user mode and test applications to validate the expected correctness of the requested
> operation. After a successful queue reset, the only way to continue normal operation is to call
> drm_sched_job_done with the specific error code -ENODATA.
>
> v1: Initial implementation by Jesse utilized amdgpu_device_lock_reset_domain and
>      amdgpu_device_unlock_reset_domain to allow user mode to track the queue reset status
>      and distinguish between queue reset and GPU reset.
> v2: Christian suggested using the error codes -ENODATA for queue reset and -ECANCELED or
>      -ETIME for GPU reset, returned to amdgpu_cs_wait_ioctl.
> v3: To meet the requirements, we introduce a new function drm_sched_start_ex with an additional
>      parameter to set dma_fence_set_error, allowing us to handle the specific error codes
>      appropriately and dispose of bad jobs with the selected error code depending on whether
>      it was a queue reset or GPU reset.

I've already send out a patch to remove the full reset parameter from 
the function and have another one in the pipeline to add the errno as 
optional parameter.

I'm currently just waiting for the feedback on those patches.

Regards,
Christian.

>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 19 ++++++++++++++++---
>   include/drm/gpu_scheduler.h            |  1 +
>   2 files changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 7e90c9f95611..5a534772335a 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -671,13 +671,14 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>   EXPORT_SYMBOL(drm_sched_stop);
>   
>   /**
> - * drm_sched_start - recover jobs after a reset
> + * drm_sched_start_ex - recover jobs after a reset
>    *
>    * @sched: scheduler instance
>    * @full_recovery: proceed with complete sched restart
> + * @error : err code for set dma_fence_set_error
>    *
>    */
> -void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
> +void drm_sched_start_ex(struct drm_gpu_scheduler *sched, bool full_recovery, int error)
>   {
>   	struct drm_sched_job *s_job, *tmp;
>   	int r;
> @@ -704,7 +705,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>   				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
>   					  r);
>   		} else
> -			drm_sched_job_done(s_job, -ECANCELED);
> +			drm_sched_job_done(s_job, error);
>   	}
>   
>   	if (full_recovery)
> @@ -712,6 +713,18 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>   
>   	drm_sched_wqueue_start(sched);
>   }
> +EXPORT_SYMBOL(drm_sched_start_ex);
> +/**
> + * drm_sched_start - recover jobs after a reset
> + *
> + * @sched: scheduler instance
> + * @full_recovery: proceed with complete sched restart
> + *
> + */
> +void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
> +{
> +	drm_sched_start_ex(sched, full_recovery, -ECANCELED);
> +}
>   EXPORT_SYMBOL(drm_sched_start);
>   
>   /**
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 5acc64954a88..444fa6761590 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -580,6 +580,7 @@ void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
>   void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
>   void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
>   void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
> +void drm_sched_start_ex(struct drm_gpu_scheduler *sched, bool full_recovery, int error);
>   void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
>   void drm_sched_increase_karma(struct drm_sched_job *bad);
>   void drm_sched_reset_karma(struct drm_sched_job *bad);

