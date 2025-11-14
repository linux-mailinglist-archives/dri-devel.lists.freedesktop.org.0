Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3882FC5F3A1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 21:24:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833E210EB12;
	Fri, 14 Nov 2025 20:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="q7yfNdGT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012000.outbound.protection.outlook.com [52.101.48.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53EF110EB11;
 Fri, 14 Nov 2025 20:24:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIHRNXBa25Zmkx9bkK1nYC/oLxf1BgezpVO+yJdlGBW0o4AYx1z2RiUVAPOTESKpoHli5eM3a8uJgtBZ9iAaaHdTptKhuEdHhZccMpeRxjPirD5GnUscFmjd/eAGhXakvcNPLgA7csOd+CrMDfuX0F3CZS/hAWZYSIZ9qKL78XhHVGSefiu3alXDJfazX5maqCEzX1gZNr/Fk9sZbAnLqEPXD6zGJ/qAnNonqOFAKHyNV8qN/KcFF3mGiho5RABnrqiGHV/8NWXsOBn8B6zdMZziwTsPSouYXXZdD8SPulELPdRRS4bkoXbvo4kkHS+a5LzNZU0OU0fspj0VtOdLHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcdSbArGhrCJf02fbaG0sk1lppBniIcpHPUtZHQ5pns=;
 b=BsynL9tFoh01xr7WDlqya7lJuHHgJyPfG/vtSw64BiRpwNnX02qJEeOhjueNQ5JgfaeKiuT9NNoKsXJeBUQwt+yIxqysHUfmeDU+Lci2m22c4EVhJtWwRDMCwMz0fMEuAJNTKlRI7tNKFs6ssejEdPG12MK+SxfdAFpOqthOBhq44modiwihEz9jR0RC4lueaKJ/rv9uPMzzA7SIfNQuufPwmopHdbe2OyyQwIlMIW8km74kTzLANHp9p5DSq9oU/lJrs99MtemFF8bxtubc2Kjo0bimILUGSAlk9mbGLHZdqxFH771Gg4dW1oozhiRU5gK2TJm8alxJIkNNse9+pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcdSbArGhrCJf02fbaG0sk1lppBniIcpHPUtZHQ5pns=;
 b=q7yfNdGT8iEuSwoXwEYBND7S5CvKveP4iqjghmRnex0l8uydpFa7DWO68vHteWjIZsiR4gYaT8FZBpSLhannwQTet2+T0rUS33/u1fgDh8fxRsZnhAMux6yGZHjdqtY23kTTeKS4NF7pBJc0Sl0B6NoeCgiHdzj8Zv8DjJw83Ek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CY8PR12MB7660.namprd12.prod.outlook.com (2603:10b6:930:84::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 20:24:26 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 20:24:26 +0000
Message-ID: <1e503518-01ed-4562-833f-170ee2be5659@amd.com>
Date: Fri, 14 Nov 2025 15:24:24 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/20] drm/amdgpu: statically assign gart windows to
 ttm entities
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-7-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20251113160632.5889-7-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0199.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::19) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CY8PR12MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: f6e1c6ea-b128-4f11-daab-08de23bbceac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azVxRm5ieTRxT2crZUE4dlAxNW5PbU5TSk9ZT3Q4bnlYSXZGQmdSd2NpV0c0?=
 =?utf-8?B?VFZTU1pXSlFHNjJ5SW12YUxWVVZRMkIwMFZCUURNcmhWNndYaU9rVmNpRVIw?=
 =?utf-8?B?L1pPUWxxdUZNbXJJTVc1RFUxVG5pemJTaldDOSs5bHhKdzRDU0hmOFBzSU5Y?=
 =?utf-8?B?Wk54d3VIbk1KS3ZCYis3KzBiMTRmWGlNZC9rejZwd3BsQTNyVGFETWdlV1Zz?=
 =?utf-8?B?c3pQWU1kZ3JrR2xOZGtZQ0M4SWpyZnZ5S1VMK2t1RGJqTkFScWRoRHQ4NlRw?=
 =?utf-8?B?cEkxdllXeHBialpTaG84Y0xjL01aVXMxKzhEUjM1TkRtN29BRkpieXB4QS9k?=
 =?utf-8?B?L1JJRHMzeHRCL3JTRTV1a0Rxa2F2N3NGcFJUemJMQnIzSDdiZmR3Z1JjQnNt?=
 =?utf-8?B?dFd3cnVuaktCRklSWW1pVGJlV0dzY3lLNnZDMWZlZ1VnSkRKT3hOc1hpbDhR?=
 =?utf-8?B?eFBwWmZabWZkODU3ckR4bXY3RGRUNVE0aWNnbjdOa0FuMFJVSml2c3B3L2J6?=
 =?utf-8?B?azdaN0xTczZUdWYvVWJSeFZMWXNiNmtDeXVBWlJwOUtUbitCYzNzZzFoTDdl?=
 =?utf-8?B?WDdaSk9JMmEyd2xvNFBYU2wxYnhCRFBRQ3E0K0ROcGk4cVR3WEc2WjFmOVFh?=
 =?utf-8?B?dS8zWElscXBLNkpYYTRzQ3gzNkx4aVk5TUpZNUphSHBIUE9oaXJnQUlxeDdr?=
 =?utf-8?B?NjZDZmdJUUM2MjRtM0xabVNDejhVbWU4b0trbnQrUWp5TlBXMmN5d0JoKys5?=
 =?utf-8?B?d3lMWE0zRG1pVVJTSSt5QldMQXNIUHY0NnhRUXNqR3R3UlBIbGdvNnZzUkpo?=
 =?utf-8?B?c1BYR2Yva0k5aFRrdzk1b1BQNFpWZTNYRzJDY1huNCtXcVkvd0hrT3AwYnBG?=
 =?utf-8?B?RHcwb2ZGcVh3Rk4vU2NUUjdobGVCeTVJWFlEL1JpSG5NWmd2bTN6eUErTndZ?=
 =?utf-8?B?TE5uZmJpamUwdUoxODF6L2Q3RXFFWUtpWVdyN21nVjB4TGRxU01LOHlQa3Zk?=
 =?utf-8?B?NUZ2OXBweUMzaDlGZU1uRExkMjZSVWRtL1lueVR2MWM0eFFvbkhaUVdjWjB6?=
 =?utf-8?B?dnlmekVjZG15b3d5MVVCbXJwMjFYbE9tekxwTldNNy8yR1J5SVVNcnNOejN4?=
 =?utf-8?B?WDJ1WDRqbzNuT2lZSjZKMmF0dzBEWDdiRDFLSnI2OVM4QlNQMHY4Z2R3Q0NL?=
 =?utf-8?B?ZjgwK2RTdFhzTXZ3YVVLSW9pUkQxZXZYYUVVUVFpY0kraE5KVGpiUmNhSWI2?=
 =?utf-8?B?cGRyOFhNaXRCQTd5Z0dZRkZLZXd1N1dkd0psS3Q4UW9OL3lQY003Z2RRUCtX?=
 =?utf-8?B?Q1BDc0I5cWNOcVp6UXd0Q0xXaW45SnBQZkUrVituTjJoQUw2V0J1d0NFanlR?=
 =?utf-8?B?dFZPK0pqVTc4TXNxYitZenhNM3dGQUg0cXR4Y3ZtMnVQRlJTdDh3eUtYQWx1?=
 =?utf-8?B?QzlhZVQ2U2JzZ2ZhNmVTeUJvQVpUTkFuS3hiQ0NQSDhqaXdhK2IvRHdGNXJx?=
 =?utf-8?B?eU5WU0g5Z21zdS9Qdk9zS2tXNmk4SFNwbVdpVXVPajA5RDFPUlZOWFNnQm83?=
 =?utf-8?B?d2pZc3RLbU9yNjVacWdPRWI1aUpibWZ1c2pzVDBtemdYSnRieGhWa3plZEp0?=
 =?utf-8?B?T0VEeWdSdW52anJWTHIwcllQUnJHZnp4K2xOWWI2TlIzcW9jZU8wd2ZrWTZm?=
 =?utf-8?B?OVhBSDV1ZDcvODUrMGl5bHZzMUtjU1c0NWl6SkJrazBnNnFrZzIzQi9nZVNj?=
 =?utf-8?B?MzdYU3orR0Vkc2xDU0R1aTl0eU1VNit6TEV4MjBjelV6RnpqUTZDeXBicmV2?=
 =?utf-8?B?Z3VMcEw2emsrb1pOc3hjS1NQcVVPbE5LdTBkQWxGL2NXNnZ2amNNNEd0V0JO?=
 =?utf-8?B?NFVnVTZPV0dibHJBUFJySTdoMDdnRzZ1S2dBNXJ1aDZlRVNpdUdaWEk0WlMx?=
 =?utf-8?Q?u45DDkPF40ab14udR1H+FMg/8h7ceyM9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWRFKzNwZ3UvY1lEMmUyaHA1b0dCYjBFMGZkNzJhRWlXaTJMTWF5aUdsLzIr?=
 =?utf-8?B?QnNRWE5DWnhmL3ZSVVQ4bEZWbE9FZWd6M1ZwditlaUtIVVJjVEE1dUpKRm41?=
 =?utf-8?B?VFpwcnZpc05ibHFqZFp2QzJpNml0a2d2bDRISTVHQ0dybWxmT3NpRFRnZ1I5?=
 =?utf-8?B?MXg4a0I0NEphcHNsVlNBSVRTV3FBRzRUL1QwR0tGcXMrcUZXUUZvUjNXcnRV?=
 =?utf-8?B?ZkZWVFY4UVQ3ZWF3SElNUnBxWTZPV0V6NFhGMU5ZWWFJcFJUUzRRMXdsS1Bz?=
 =?utf-8?B?dEZzZUIvdGhYa3IrYi9ja1hsWHBkSmtIeldLRjkvNVhnRjd0UXZJcVVYL0d2?=
 =?utf-8?B?V29kNWN3R2JRZ3ZCbW9keUJES3d3SVJqZjdKK2xlai9YZ2tzYS9mcm9hTzY5?=
 =?utf-8?B?NXdRTzlucTFoU1V0TjZ3dmlJS1NtcGtHUGFhRktYZVk0ZUFPMHZ6VFc2bEg5?=
 =?utf-8?B?aXc5dVpGZzQ0OUpZR2VzeWdYbmpMRWJabnVWVjc4OFBjdWh5LzV2SzVHNnlQ?=
 =?utf-8?B?Z1VDYjc1L0QxN1pNSlB2a0poYzNGUTR0ODdJZ1BPbWtUTUIrWDRPYW4yMGRC?=
 =?utf-8?B?K0o1ODVHK3ZBNHhuUWx0ek9RSit2R0Rtd2I1d1FqL1lZR0tSNEpValFmZEg4?=
 =?utf-8?B?TEgrUTc4Y0ttQmhHK3JBdCtReWNUYXp4ZnkrZENaS1dQN1NuVEhpWEJUY1hy?=
 =?utf-8?B?UjBITm01YnNhdmF1bERqTkZuWmdPZ2FsODBjN2xVbUgyV0cveG9CNUtLZ1F5?=
 =?utf-8?B?d1RGUTlqR3VsUllBcjRBTExsRzRLV0xUVDdPbThSREpWdjhNZGVYLzJka1Nr?=
 =?utf-8?B?WmIvS2hYL1FQV3dtOCtESktSSnMzUHh5eUFBSWlIU2M5VCs3UU9DSkhrR1J1?=
 =?utf-8?B?cDZ0dllFb01WQjcvTkorcnhicGlsQ0dKL3Z2R2c3QTZTcHVhVHN4R1Nabllx?=
 =?utf-8?B?QjNISysvc2ovNXpsczU3T1FvNmEzcCtZWktWV0hKN3FJNm9JdTNtTUZzMnRN?=
 =?utf-8?B?ZGg2cm9pWk5GWFFQUkpwWW44aTIwclBZR24xOUw1d0VhV0V3MUZqaHVzWjYw?=
 =?utf-8?B?Y0xXcjBxTDFxMU15Qk1YRnF2VFV1UWZsUzJtWFFaakdBOXhJRWRHSW53UE9m?=
 =?utf-8?B?TDFubnc2WnJtMFNVbWZJZkJIdzlyM2t1S1JzZlFyYlptMzg5dUZLcHRLYWhG?=
 =?utf-8?B?WmhGVmdBWWZsWDVGWmtaRW9LNzhna2p5bjQvQlU3eURkVkhQckV5bHQzMzRj?=
 =?utf-8?B?d3JaMHdwb1UxMzhqMkZjTVRCcGVZUTNKcGxoSmtGSXQyT3IrbkVtbjJkcTZ3?=
 =?utf-8?B?bmY0UGkyaG5KLzFoYU1FYmtoODJyTW9OaHJ6WnlGNUZ3MGxUaWd2ajJ1NkNa?=
 =?utf-8?B?OXFHenhNQVZtN2JYK000Q0Y3RStTRTVSTlp3VUM4L1F4bW0vWHMxUFNJRjE2?=
 =?utf-8?B?QzlncWVjcWhmaEVuMmJ6b3JyQ2t1ME92WkFxQk80WUx0TU9UZmQ3dEphMG1n?=
 =?utf-8?B?c244UWdyZDNVanBRajM4QXZOc0JUNUVseGNBTFBBMDdpNldXeVZBOHNIb3pZ?=
 =?utf-8?B?NXN3VnZGNTZVOE1VdjJlL2JUSlg4UFBVbGx0NG94RzNvK1lmVjAxcWI2YmFZ?=
 =?utf-8?B?YVVSWTdMaWx0OU5lNFNCOHJjRDJCck9XcXM0c0lZaTZUTU5vQXhUdHBreDg0?=
 =?utf-8?B?OEwxMUFVS0NRTEFmYm9KWHVxUnFIQ3F5Qll2S0pkZXZ1NGg1amVDdE1sS0Yw?=
 =?utf-8?B?aDJpSDZ6dWowVnBTQ0NBNmV0NjBJcmFRUjlpdU1KN3lEYnlHMmQ2R3J5R0RV?=
 =?utf-8?B?UUE5TDhaZXdNOGVTdUJJeEl6eVNLMUtnWEhuREg0V0NsNWVUYWM3aU9IRkdE?=
 =?utf-8?B?MFJ4NEhmeDRFb0xNS0FhcGhIY0wzUmFVRXFma2c4OEdVZzRzRUJkT2M4ZCtC?=
 =?utf-8?B?c1IxelNFNUF0bVl6cndaMjF2WWduWG1Ic08zczFNajRWd29SVnRQbmI1T1p3?=
 =?utf-8?B?cysrbmNHeGtGV3g5VkRKNXVSMlFLQ2oyRGVLV3BIWXBVNVczNUVRUDJPWVpX?=
 =?utf-8?B?c2J4d0VMM21hM2N3c29MaE81SkpueUVhcDdBdEs0WVdhYWIxdHkxMXcvajZC?=
 =?utf-8?Q?lWYvcUJlp1fNO63BBpADvyEaj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e1c6ea-b128-4f11-daab-08de23bbceac
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 20:24:26.7820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ct2bYTDm7eDnW+nQmfXtylRYPCSlT4irY6ouD0GU8HGdzMbd3+lA3Fsuu4eVStTeOMw3Ob8tao96OmiJRt6sYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7660
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


On 2025-11-13 11:05, Pierre-Eric Pelloux-Prayer wrote:
> If multiple entities share the same window we must make sure
> that jobs using them are executed sequentially.
>
> This commit gives separate window id to each entity, so jobs
> from multiple entities could execute in parallel if needed.
> (for now they all use the first sdma engine, so it makes no
> difference yet).
>
> default_entity doesn't get any windows reserved since there is
> no use for them.
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c  |  9 +++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c  | 50 ++++++++++++++----------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h  |  9 +++--
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  8 ++--
>   4 files changed, 46 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> index 8e2d41c9c271..2a444d02cf4b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -686,7 +686,8 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>   	 * translation. Avoid this by doing the invalidation from the SDMA
>   	 * itself at least for GART.
>   	 */
> -	mutex_lock(&adev->mman.gtt_window_lock);
> +	mutex_lock(&adev->mman.clear_entity.gart_window_lock);
> +	mutex_lock(&adev->mman.move_entity.gart_window_lock);
>   	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.default_entity.base,
>   				     AMDGPU_FENCE_OWNER_UNDEFINED,
>   				     16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
> @@ -699,7 +700,8 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>   	job->ibs->ptr[job->ibs->length_dw++] = ring->funcs->nop;
>   	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
>   	fence = amdgpu_job_submit(job);
> -	mutex_unlock(&adev->mman.gtt_window_lock);
> +	mutex_unlock(&adev->mman.move_entity.gart_window_lock);
> +	mutex_unlock(&adev->mman.clear_entity.gart_window_lock);
>   
>   	dma_fence_wait(fence, false);
>   	dma_fence_put(fence);
> @@ -707,7 +709,8 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>   	return;
>   
>   error_alloc:
> -	mutex_unlock(&adev->mman.gtt_window_lock);
> +	mutex_unlock(&adev->mman.move_entity.gart_window_lock);
> +	mutex_unlock(&adev->mman.clear_entity.gart_window_lock);
>   	dev_err(adev->dev, "Error flushing GPU TLB using the SDMA (%d)!\n", r);
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index c8d59ca2b3bd..7193a341689d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -291,7 +291,7 @@ static int amdgpu_ttm_map_buffer(struct drm_sched_entity *entity,
>    */
>   __attribute__((nonnull))
>   static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
> -				      struct drm_sched_entity *entity,
> +				      struct amdgpu_ttm_buffer_entity *entity,
>   				      const struct amdgpu_copy_mem *src,
>   				      const struct amdgpu_copy_mem *dst,
>   				      uint64_t size, bool tmz,
> @@ -314,7 +314,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>   	amdgpu_res_first(src->mem, src->offset, size, &src_mm);
>   	amdgpu_res_first(dst->mem, dst->offset, size, &dst_mm);
>   
> -	mutex_lock(&adev->mman.gtt_window_lock);
> +	mutex_lock(&entity->gart_window_lock);
>   	while (src_mm.remaining) {
>   		uint64_t from, to, cur_size, tiling_flags;
>   		uint32_t num_type, data_format, max_com, write_compress_disable;
> @@ -324,15 +324,15 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>   		cur_size = min3(src_mm.size, dst_mm.size, 256ULL << 20);
>   
>   		/* Map src to window 0 and dst to window 1. */
> -		r = amdgpu_ttm_map_buffer(entity,
> +		r = amdgpu_ttm_map_buffer(&entity->base,
>   					  src->bo, src->mem, &src_mm,
> -					  0, ring, tmz, &cur_size, &from);
> +					  entity->gart_window_id0, ring, tmz, &cur_size, &from);
>   		if (r)
>   			goto error;
>   
> -		r = amdgpu_ttm_map_buffer(entity,
> +		r = amdgpu_ttm_map_buffer(&entity->base,
>   					  dst->bo, dst->mem, &dst_mm,
> -					  1, ring, tmz, &cur_size, &to);
> +					  entity->gart_window_id1, ring, tmz, &cur_size, &to);
>   		if (r)
>   			goto error;
>   
> @@ -359,7 +359,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>   							     write_compress_disable));
>   		}
>   
> -		r = amdgpu_copy_buffer(ring, entity, from, to, cur_size, resv,
> +		r = amdgpu_copy_buffer(ring, &entity->base, from, to, cur_size, resv,
>   				       &next, true, copy_flags);
>   		if (r)
>   			goto error;
> @@ -371,7 +371,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>   		amdgpu_res_next(&dst_mm, cur_size);
>   	}
>   error:
> -	mutex_unlock(&adev->mman.gtt_window_lock);
> +	mutex_unlock(&entity->gart_window_lock);
>   	*f = fence;
>   	return r;
>   }
> @@ -401,7 +401,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>   	dst.offset = 0;
>   
>   	r = amdgpu_ttm_copy_mem_to_mem(adev,
> -				       &adev->mman.move_entity.base,
> +				       &adev->mman.move_entity,
>   				       &src, &dst,
>   				       new_mem->size,
>   				       amdgpu_bo_encrypted(abo),
> @@ -1893,8 +1893,6 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>   	uint64_t gtt_size;
>   	int r;
>   
> -	mutex_init(&adev->mman.gtt_window_lock);
> -
>   	dma_set_max_seg_size(adev->dev, UINT_MAX);
>   	/* No others user of address space so set it to 0 */
>   	r = ttm_device_init(&adev->mman.bdev, &amdgpu_bo_driver, adev->dev,
> @@ -2207,6 +2205,15 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>   			drm_sched_entity_destroy(&adev->mman.clear_entity.base);
>   			goto error_free_entity;
>   		}
> +
> +		/* Statically assign GART windows to each entity. */
> +		mutex_init(&adev->mman.default_entity.gart_window_lock);
> +		adev->mman.move_entity.gart_window_id0 = 0;
> +		adev->mman.move_entity.gart_window_id1 = 1;
> +		mutex_init(&adev->mman.move_entity.gart_window_lock);
> +		/* Clearing entity doesn't use id0 */
> +		adev->mman.clear_entity.gart_window_id1 = 2;
> +		mutex_init(&adev->mman.clear_entity.gart_window_lock);
>   	} else {
>   		drm_sched_entity_destroy(&adev->mman.default_entity.base);
>   		drm_sched_entity_destroy(&adev->mman.clear_entity.base);
> @@ -2371,6 +2378,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>   {
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>   	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> +	struct amdgpu_ttm_buffer_entity *entity;
>   	struct amdgpu_res_cursor cursor;
>   	u64 addr;
>   	int r = 0;
> @@ -2381,11 +2389,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>   	if (!fence)
>   		return -EINVAL;
>   
> +	entity = &adev->mman.clear_entity;
>   	*fence = dma_fence_get_stub();
>   
>   	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
>   
> -	mutex_lock(&adev->mman.gtt_window_lock);
> +	mutex_lock(&entity->gart_window_lock);
>   	while (cursor.remaining) {
>   		struct dma_fence *next = NULL;
>   		u64 size;
> @@ -2398,13 +2407,13 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>   		/* Never clear more than 256MiB at once to avoid timeouts */
>   		size = min(cursor.size, 256ULL << 20);
>   
> -		r = amdgpu_ttm_map_buffer(&adev->mman.clear_entity.base,
> +		r = amdgpu_ttm_map_buffer(&entity->base,
>   					  &bo->tbo, bo->tbo.resource, &cursor,
> -					  1, ring, false, &size, &addr);
> +					  entity->gart_window_id1, ring, false, &size, &addr);
>   		if (r)
>   			goto err;
>   
> -		r = amdgpu_ttm_fill_mem(ring, &adev->mman.clear_entity.base, 0, addr, size, resv,
> +		r = amdgpu_ttm_fill_mem(ring, &entity->base, 0, addr, size, resv,
>   					&next, true,
>   					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
>   		if (r)
> @@ -2416,12 +2425,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>   		amdgpu_res_next(&cursor, size);
>   	}
>   err:
> -	mutex_unlock(&adev->mman.gtt_window_lock);
> +	mutex_unlock(&entity->gart_window_lock);
>   
>   	return r;
>   }
>   
> -int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
> +int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>   		       struct amdgpu_bo *bo,
>   		       uint32_t src_data,
>   		       struct dma_resv *resv,
> @@ -2442,7 +2451,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>   
>   	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
>   
> -	mutex_lock(&adev->mman.gtt_window_lock);
> +	mutex_lock(&entity->gart_window_lock);
>   	while (dst.remaining) {
>   		struct dma_fence *next;
>   		uint64_t cur_size, to;
> @@ -2452,7 +2461,8 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>   
>   		r = amdgpu_ttm_map_buffer(&entity->base,
>   					  &bo->tbo, bo->tbo.resource, &dst,
> -					  1, ring, false, &cur_size, &to);
> +					  entity->gart_window_id1, ring, false,
> +					  &cur_size, &to);
>   		if (r)
>   			goto error;
>   
> @@ -2468,7 +2478,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>   		amdgpu_res_next(&dst, cur_size);
>   	}
>   error:
> -	mutex_unlock(&adev->mman.gtt_window_lock);
> +	mutex_unlock(&entity->gart_window_lock);
>   	if (f)
>   		*f = dma_fence_get(fence);
>   	dma_fence_put(fence);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index e1655f86a016..f4f762be9fdd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -39,7 +39,7 @@
>   #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
>   
>   #define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
> -#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	2
> +#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	3
>   
>   extern const struct attribute_group amdgpu_vram_mgr_attr_group;
>   extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
> @@ -54,6 +54,9 @@ struct amdgpu_gtt_mgr {
>   
>   struct amdgpu_ttm_buffer_entity {
>   	struct drm_sched_entity base;
> +	struct mutex		gart_window_lock;
> +	u32			gart_window_id0;
> +	u32			gart_window_id1;
>   };
>   
>   struct amdgpu_mman {
> @@ -69,7 +72,7 @@ struct amdgpu_mman {
>   
>   	struct mutex				gtt_window_lock;
>   
> -	struct amdgpu_ttm_buffer_entity default_entity;
> +	struct amdgpu_ttm_buffer_entity default_entity; /* has no gart windows */
>   	struct amdgpu_ttm_buffer_entity clear_entity;
>   	struct amdgpu_ttm_buffer_entity move_entity;
>   
> @@ -177,7 +180,7 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring,
>   int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>   			    struct dma_resv *resv,
>   			    struct dma_fence **fence);
> -int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
> +int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>   		       struct amdgpu_bo *bo,
>   		       uint32_t src_data,
>   		       struct dma_resv *resv,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 09756132fa1b..bc47fc362a17 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -60,7 +60,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring,
>   	int r;
>   
>   	/* use gart window 0 */
> -	*gart_addr = adev->gmc.gart_start;
> +	*gart_addr = entity->gart_window_id0;

gart_window_id0 doesn't look like an address. What's the actual MC 
address that any copy through this window should use?

Regards,
   Felix


>   
>   	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
>   	num_bytes = npages * 8;
> @@ -116,7 +116,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring,
>    * multiple GTT_MAX_PAGES transfer, all sdma operations are serialized, wait for
>    * the last sdma finish fence which is returned to check copy memory is done.
>    *
> - * Context: Process context, takes and releases gtt_window_lock
> + * Context: Process context, takes and releases gart_window_lock
>    *
>    * Return:
>    * 0 - OK, otherwise error code
> @@ -138,7 +138,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
>   
>   	entity = &adev->mman.move_entity;
>   
> -	mutex_lock(&adev->mman.gtt_window_lock);
> +	mutex_lock(&entity->gart_window_lock);
>   
>   	while (npages) {
>   		size = min(GTT_MAX_PAGES, npages);
> @@ -175,7 +175,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
>   	}
>   
>   out_unlock:
> -	mutex_unlock(&adev->mman.gtt_window_lock);
> +	mutex_unlock(&entity->gart_window_lock);
>   
>   	return r;
>   }
