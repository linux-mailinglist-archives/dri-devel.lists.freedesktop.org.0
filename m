Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C641EBC07EE
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 09:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E6A10E373;
	Tue,  7 Oct 2025 07:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="C3wRPyu9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011001.outbound.protection.outlook.com
 [40.93.194.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B2B10E373;
 Tue,  7 Oct 2025 07:29:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fI+yFV9zju1595PqqHC7m9HFOv7TEC79ay5NciVuky2qdxyo7jWgqaWskGbya8H4oyS38/Kudh4mYLUyd3PSgtX5KvV99sZHmBYjp4uXzsycJgLUAHtYVp97WE0NOgPutOyGYF+aRSJPyB1MyC3ZJub2kloMF04jtNvt2k0lIfDgSriVmEjEgj+57NvI0e4qpvCCsJc9AIuH0Shz3W9tefm6uA+Hus2vZe59U3+X5ioZPSu4WZ9pqjUF+GDtJXyRRpOiu17o/FohSt9SPrkIxu4HdPuk5tZYGv1YqmSyCEbISRWEAWBp0t2rmoN8he4oTQifbH9rG7GAW7k96mQnxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eV3hWvufENyVhBUasbhvIU15y44FD7GBYSc+VHm/L3A=;
 b=IAFqSxD17FGtPpJZZUQYZtm4J6e7nxQoAM9nMfstZKNODyZQ8IvOX+rnhQoRS1sqQ82AqK80hute5c4ayMmYOKWFURkLQ3VXL7Rk+At4qUCIr3t3oYWDTfUQ2nnnuswGzbhLpWX62qgPe2t8D1icBKIZEaPVbCWebAoNxJePpzdhDJKP1Te7O9/2SQs0dIgrXYmFbk2kzBOK+NwEB9r7Hm70bak8nAMwWsqcQla6IGmfgPL5+YFE/WEzGDRvSfS6M0xGWDCfLQInaJ1cVmsHTsWWPl2jA77Ko9yKLqyv4Yaw3gbtvPnuoWwir9aYOaxxJafClpLS0c2qx1NlZsgAwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eV3hWvufENyVhBUasbhvIU15y44FD7GBYSc+VHm/L3A=;
 b=C3wRPyu9Z0iVrWFTBzXdBNzr1URghZMceO9vMCMaKao34jfwGU3M8EnMb7b54hcNl7kWBhwc4Eo+Y3udEVB7fve6Qa061G2nYTXj3QWD2tXXqz3JaqGsbGVasmFEukvzmeNvB03OTJoa1NRhyU7/p7Kqn0ETycC3CT3mwa+KcJk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB8175.namprd12.prod.outlook.com (2603:10b6:510:291::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 07:29:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 07:29:00 +0000
Message-ID: <be806a5e-75c9-45da-962f-2c1db75b4a07@amd.com>
Date: Tue, 7 Oct 2025 09:28:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/4] drm/sched: Add pending job list iterator
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: alexdeucher@gmail.com, dakr@kernel.org, pstanner@redhat.com,
 Philipp Stanner <phasta@kernel.org>
References: <20251002051604.1865322-1-matthew.brost@intel.com>
 <20251002051604.1865322-2-matthew.brost@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251002051604.1865322-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: cc96daa4-a40a-4827-5cf6-08de05732f5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXN1b3VOSEYzRmsxYUJZZzJLREgzR3hmdmltY1Y1TGhsZzhyMFFzS3U2aWhO?=
 =?utf-8?B?b0xjTVJpc1gyV1NNY2ZseFpDSE9Cb1I3TEt2QnVrY2FiTXJVSVJMNDNFSWNm?=
 =?utf-8?B?enlSWjFBTGRQRzJCUVFTSXVhMVJCM1JENzVZV0RxeURLUFlCVTI5ZVFFRTRB?=
 =?utf-8?B?eWh4OFlpRzF6UFh3UTFWZENOWE1NbE8ybldZS1RMUTBwb0hPY01wQitwUUE5?=
 =?utf-8?B?Nllab3BJNi9sSkt5NmIwL0Q5TStWczV4Q3g5MjlUUWFFTTNGa2xnTldLK0dU?=
 =?utf-8?B?cW1ZSXpCSU9XYnBIMXF6RkU3cGd2ODRxRzhjd1IzSFhTUENwMDlDR2ZWYjlx?=
 =?utf-8?B?ekprcmQ2OUFFSDUxUzhhcUJvMFVYQXduYVNiZ1gxdkdlczVpTVhvLzZ1amlo?=
 =?utf-8?B?bDA3UzZQeVU4QW0ySklPUlFISHU0ZUFSUzE1bmxka2tkQmJIZS9qRW82SmtZ?=
 =?utf-8?B?NFZucDVRYk9IWWN4dG1iYk1YWTFLUWxIakk1Y2tneGczbXd2OXk5MHpGWkFz?=
 =?utf-8?B?ZkdBNVRCT2FoOVVOZHptdE1DdXNhL2RCWjc1QVZFZkN5QTFQQTJnbTBlYWsv?=
 =?utf-8?B?M0NJN3N5N2VMdXU3bVFvNlJuRFlqTWcwd1o5djFmc1lUdVlxZmk3UTM3Y0NU?=
 =?utf-8?B?NjZ1VHJsRTlURDRaenhmSGt6LzM3S1E1Z0J6WmlYM2QvSlNYaGVmd3M1SEJ6?=
 =?utf-8?B?S1VwWWRsRGNmTXRUYVdRSVl5bGJmekl2UCswWUxuNkx1Tkt0ejhpV1R0L1ZK?=
 =?utf-8?B?THhWdFhpZHZzd0Z6YmhUbXpNeDE5bFIyNmdrZCtwZG9qRlYrcW8wZUNmdUx1?=
 =?utf-8?B?T0RMOE1wSXgwZXJORzVYM2VzYmEyTjFtNGtSL3o2YWtlUlgwR2J1VE1hL05z?=
 =?utf-8?B?czhVUjc1WnRBVEZWTE13UVlrL1U5Y1I3ZFc1OXNxYUZSSzNhRHhFNnFUVXVn?=
 =?utf-8?B?YXl4YWEwVEwyL2phV0k3SG1CUFpaMUZteno5OE1tUkpWcllLTlJEZlRYWmQz?=
 =?utf-8?B?Smp4dkd3UUhia29VcHlFMGs1L1YzSy9RYXRzQjJUVDN5MTVuVUQ1NG10L2Yz?=
 =?utf-8?B?VU15a3JpemdveTVrR0JiQ2xvYnZ4MFYzUVg2Z2ZDTUpLSkVGMFc5eDBoMFdD?=
 =?utf-8?B?blN2NU9hWEc1dXFzSjF1YlphT3YwWjV1Slg2eFNYRVlVR0pvQWpSQ3M3ZW1i?=
 =?utf-8?B?NTM3YWNhNG0zUk1DTW51Z0hyaHYrVmg4dXNUa2dPdW1halNNMUJuNWhVNWJi?=
 =?utf-8?B?TjZYV2NWWDA2OUlIWmg1ckYvVmpjUUxVdVJVSkJvUUw1ZGtxVVQ4dVFTT1E0?=
 =?utf-8?B?b04yRWk3TTBXMHp4T0JNbFZPRVIzQnJhTlp3VlZBekVudVpNcHZTZkh4U0hM?=
 =?utf-8?B?SGdLQXR3cnR3VG5yRkJHNWtqSGk5VDFKMCszTnFRb2JGSG1QeHg1T2c2ajZt?=
 =?utf-8?B?eEU4YmNPY2xzQ0NIMUI1R1FQSVVWOW14bWpoUDJobXhJRVc4eGROM2xJRHVC?=
 =?utf-8?B?L3ZzS3JibE8zL2FkeXdlNFBidHc0TVZYWXVZR2phdlIwMEl0WXlGc2lyVGRS?=
 =?utf-8?B?V2F0NjB2VkJOQmdTS0hmMnBNTXhmWWNwSVRQL3pYdHZSVmdHUzZKOUtZR3cx?=
 =?utf-8?B?MnBPQzd6Rms5SFdvVmtLRjZlWTdSR0VsTjZrcXdXZ2p3ODVSOVNVYk9VTFpx?=
 =?utf-8?B?VVdOUG5rQlpyWFpoaFkvdkVCK0FVZHBEdjRKcjlPVEJXY3F1RlJjbTF4V2lL?=
 =?utf-8?B?N2txL21vd01ITkZISG5RUUYwK1gxL28zRXE5UEFhR2pucjNBUTArUXFpZ0h2?=
 =?utf-8?B?N3JkQkFLbXNLV0RROGdiL2g4T2RHQjk3dUFVZzczZFRzNHM2TE5kOFAvKzJU?=
 =?utf-8?B?NVh5WmI2Q3BtSXJUQUJRTTZtc2JMbWhmWitmQlZHeEQ1elF0YXk5TFVmUWJJ?=
 =?utf-8?Q?Qut7NFPU866Gmg6yuTP9yEE4nIV8xqNB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWorMGRuWVMxYTFUVWt6aWlTSW5kaXVHM2pGQzVTLzJVeUYvcmhWcVZITDc5?=
 =?utf-8?B?T2g0UG9pVnc3M1BjNEoyZHdBdlBMLzhwMDFZRkdOVzhhRnFMMXZiSzZjSjJY?=
 =?utf-8?B?L09IZi9hM0pDaUxWQnNwNEhpR2NPemFEY1ZqZ3RYQ3F4MXNWUGkvdEZadmZk?=
 =?utf-8?B?WGdEcmRNYnNFeUUwN3M3N3BjR0ZRcG5IVzJ4Mi9kY0ZPL3BqSHh1T3V6M3VI?=
 =?utf-8?B?dEhKcjZJenpKOW93eUdabGY1SHlYQU9wU2g1RXRSUS9HbENWSlFUREgySDRk?=
 =?utf-8?B?eGlRdlBOdm5rU0VIS0tldHE0Y2IzbTNXWnVxb2xNT0MycHhtOHVqcDYrUG05?=
 =?utf-8?B?VnNLcGNUbFRXL1czdzl2RzMzUEo5TWNKbU1UTWlyUWNPaTBlN2lHOHppeWFG?=
 =?utf-8?B?U2FweXo4c1BZbUljak81dFlkYzd5UWMxR3hyM2ltcHhodUhLZWxNUHZyR1dG?=
 =?utf-8?B?TEdVaHZtYytMUHdVcUMwUFEvdEFnQXZuSUR1aElEcVVDUzFUUEc0aGZMd1py?=
 =?utf-8?B?NWlQMHh2R3h6My9WdnJGeFNNL292dldxV1AvMEpodnMyblRVQzhIRWR3Zk0x?=
 =?utf-8?B?WG5Ic3dHOFEzSm5zWVJrRlZrdzBuZHNxdzJjaCtMS1NYSUYzOExZeWFKRzNH?=
 =?utf-8?B?d0cyQXJQYXRsWC9ZVnBpWDlSb2d4VysxMkpkbHN2VEFiVVBhNlpJQ2E2eENt?=
 =?utf-8?B?USsyS241ME41SDBweW92SVhmUCtnelgwVENmbThLSVNUKzhMeXhqNmxiRE1Q?=
 =?utf-8?B?eEExS2NQRVl0SUdTOEkvNk4yTlY5R09RenNoNjZjTHJQY3Q4Q0dmdmlQbmph?=
 =?utf-8?B?QjA1K2cxdm9CQWtnQ3h5NjB4MllFQzVkWEtOdG9pdWdlYzMyS0taZEpTRWsv?=
 =?utf-8?B?RWJqcXFBOWh3eWNLWEJnTFhQTmNqZW1UN3RKKzRNdXVZUDhTMDRiZzVET3dH?=
 =?utf-8?B?WG1Cank2b0cyR2FTOUJRbHVaYzlCQUV3M2I2VWQ0Z1ZBUmlVSDVKQU9XTUo1?=
 =?utf-8?B?cXVWYTlxTzBlOWI0dEhHeFpxc2pIWmVIeHJMUWpCbHlPejhUckovVjhNVEx2?=
 =?utf-8?B?UnZGeXhFRzY4TkhkQ3JDc0tDaDFNWWtjcUVnRENWNGlhdU85YXR6bXdJY1VP?=
 =?utf-8?B?dHdxUUN5ZlBjYXFJc0Z5QVQxZHZ5eERQYjhQS0VuR09BNUV4dXlKK3BsdWly?=
 =?utf-8?B?WHlaVUpDNmNZY1dBUTBUbURlS24zYkhmREhIaUswRm1kWm9mQ2tHVmFzclFn?=
 =?utf-8?B?YXVlKzdIeDd3bjUvZ25JbzFiS1EzRlViWStVOEltcVpSUisxc0xqSERwQzhq?=
 =?utf-8?B?ZWdEekZ2WHNpUXlLV0ZYQ21KMnFtaVpGRjZwdU5YenYyQTI3YkF2UHhQYTNj?=
 =?utf-8?B?NlN1OWQyWE1UbW1nM2J5R1pqbnBCSWZ5UXFNam5LcElvd3RvcEN3aGk1dmhX?=
 =?utf-8?B?Y2M2dmllZlFUV2lNQ000Mlg0N2w5Vzh6Z29abkRaSDZybDFhVDJ3RktRYTBi?=
 =?utf-8?B?RlJnbGQ5VzBkKzVuTzBFcDlKTllrN2VCZTRleklZL0Q5NTAzMHJqSyt1ejA5?=
 =?utf-8?B?dmswV3lUdnlTYWwzanoxcnFUQlBEWmtZNFpoeldhNnpBQU94ZzdsQVByNkhG?=
 =?utf-8?B?TGloWkkyMHJ6WTJyRm9ZNlcwQkQzTExHRlRQMnI3Y1g3ZUUxR1JTekdrUXFh?=
 =?utf-8?B?K3JpRUlXejlQN2tIa3dQUEZ4M2NPaHlWMXBnS2x6TjBqa29GYUVTNHdraEJw?=
 =?utf-8?B?MTVGcjdPbDh6U1dNQUliVkNISndEZlJJTmZmNUhZTmE4VHMwQlc2RWZHSjFX?=
 =?utf-8?B?UmgyU2tMUk53NzBCOC9PV2djcmM0N0xNZUlaNEs5ZDgrZjNVeHFCeGtrWnFG?=
 =?utf-8?B?ZjNZcjFSVDNBeXJQSm9FT3F2Z1k4azZ5OEdBemV2aVp5dlNURlFYR1VhZzFJ?=
 =?utf-8?B?b1BwaHpMWFdFWGtnSlRPeExQZ2UzOWdicG03b3RtMkkwVjhLbkUrWVlLTm56?=
 =?utf-8?B?dXVDMzZ6elAwQzhqL0FWT1BZNzc1ZmdJNkpvYThFYkVXSC9ZT3NYRXF6NEJ4?=
 =?utf-8?B?Rm1BZWc5a1JQcytlTzdVWlVUL2I5MkFud2lFRnlvdjdQWWRSeHdBRXpwL0NL?=
 =?utf-8?Q?NVjLs3WAHCpB2+oXvaO3598Cb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc96daa4-a40a-4827-5cf6-08de05732f5d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 07:29:00.9138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5EaDIK+PgNCek8yGH5bJzCZ+HkeY8rd3rL/tAf2S4NmdQMHuTQqsDTzBwcEeL2o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8175
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

On 02.10.25 07:16, Matthew Brost wrote:
> Stop open coding pending job list in drivers. Add pending job list
> iterator which safely walks DRM scheduler list either locklessly
> asserting DRM scheduler is stopped or takes pending job list lock.

Taking the job list lock and walking the pending list while the scheduler is not stopped is most likely a NO-GO.

As far as I understand it that is exactly what Philip rejected as looking into scheduler internals during the discussion on XDC.

So why is that actually needed? For debugging or something functional?

Regards,
Christian.

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  include/drm/gpu_scheduler.h | 64 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index fb88301b3c45..a2dcabab8284 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -698,4 +698,68 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>  				   struct drm_gpu_scheduler **sched_list,
>  				   unsigned int num_sched_list);
>  
> +/* Inlines */
> +
> +/**
> + * struct drm_sched_iter_pending_job - DRM scheduler pending job iterator state
> + * @sched: DRM scheduler associated with pending job iterator
> + * @stopped: DRM scheduler stopped state associated with pending job iterator
> + */
> +struct drm_sched_iter_pending_job {
> +	struct drm_gpu_scheduler *sched;
> +	bool stopped;
> +};
> +
> +/* Drivers should never call this directly */
> +static inline struct drm_sched_iter_pending_job
> +__drm_sched_iter_pending_job_begin(struct drm_gpu_scheduler *sched, bool stopped)
> +{
> +	struct drm_sched_iter_pending_job iter = {
> +		.sched = sched,
> +		.stopped = stopped,
> +	};
> +
> +	if (stopped)
> +		WARN_ON(!READ_ONCE(sched->pause_submit));
> +	else
> +		spin_lock(&sched->job_list_lock);
> +
> +	return iter;
> +}
> +
> +/* Drivers should never call this directly */
> +static inline void
> +__drm_sched_iter_pending_job_end(const struct drm_sched_iter_pending_job iter)
> +{
> +	if (iter.stopped)
> +		WARN_ON(!READ_ONCE(iter.sched->pause_submit));
> +	else
> +		spin_unlock(&iter.sched->job_list_lock);
> +}
> +
> +DEFINE_CLASS(drm_sched_iter_pending_job, struct drm_sched_iter_pending_job,
> +	     __drm_sched_iter_pending_job_end(_T);,
> +	     __drm_sched_iter_pending_job_begin(__sched, __stopped),
> +	     struct drm_gpu_scheduler * __sched, bool __stopped);
> +static inline void
> +*class_drm_sched_iter_pending_job_lock_ptr(class_drm_sched_iter_pending_job_t *_T)
> +{return _T; }
> +#define class_drm_sched_iter_pending_job_is_conditional false
> +
> +/**
> + * drm_sched_for_each_pending_job() - Iterator for each pending job in scheduler
> + * @__job: Current pending job being iterated over
> + * @__sched: DRM scheduler to iterate over pending jobs
> + * @__entity: DRM scheduler entity to filter jobs, NULL indicates no filter
> + * @__stopped: DRM scheduler stopped state
> + *
> + * Iterator for each pending job in scheduler, filtering on an entity, and
> + * enforcing locking rules (either scheduler fully stoppped or correctly takes
> + * job_list_lock).
> + */
> +#define drm_sched_for_each_pending_job(__job, __sched, __entitiy, __stopped)	\
> +	scoped_guard(drm_sched_iter_pending_job, __sched, __stopped)		\
> +	list_for_each_entry(__job, &(__sched)->pending_list, list)		\
> +	for_each_if(!__entitiy || (__job)->entity == (__entitiy))
> +
>  #endif

