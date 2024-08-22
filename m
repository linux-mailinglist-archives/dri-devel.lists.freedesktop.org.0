Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F2D95B7DF
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 16:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB0810EAC5;
	Thu, 22 Aug 2024 14:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fzjYpLzB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6CA310EABB;
 Thu, 22 Aug 2024 14:03:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qilNPQgfkmqIGepFu84waaa2pMuBrdTYJOEnzvVADL5ZFw0iNttpDfqVbZ12ic5pyjJItgSOzd3JxkFwJyEndx2GOOpgv9BjVutjQZ5fBskrYePEqgXpNq+cxANEhSL4Ucx2YvnXMyTPlzbKUNGKr1eiFeeKIBmPr2gLureLtYBjNJLjsQr4UWYwWlLT7g/PQBnW1Y8Dpgwb3hQ+4Sl7z4uNMIejWlJ0fvb/8Nvtt4iQ3GjfK7l89zV3qN7UWxrwBT5DZ6IFOwGbEkJIDJthoiyPdBp16Lu3D0cac+nYzJcscy0rJ49Hcmy2jKOZBMGuXubfUUzCLcRH9azzdg+Ovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lZPvovy2g4JRb9rSlGAMLSnOP+kTsskQbEkokqMnAA=;
 b=ikZvZ/7/nGuSp3t2rSfBeOKBhnOQh2R3MbjQ2J3nnVTjmFXZy+xHLQpPTjRG9IXsfdcvB3fXz/HjWqOttwwWOfAT4EJWVlW9uX2XSiesR+wNJc3KfoKsyhhHke1wBPerfEUjUY51Tddo+Ay2L+Qm94g0KcchNwGvTiTtgiSfylw3dj3DTHmESJkHB8BsujojU9e7mZoq3I5Sl6pf93cLGmL6F8CIv7ROPB8C4S5ZmM+2Y0wJZ4jW4eYgbNZy/Yqv5y1exzVsXvlOeoQ4vy7EM8R/1F9F+NHWYgbJRRDF5D39s9XZAEiD8Lx8juJPpuvRo14vZd24szgkecVrIGInLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lZPvovy2g4JRb9rSlGAMLSnOP+kTsskQbEkokqMnAA=;
 b=fzjYpLzBIhz/q+j9d9MqqVY0FSR9vHc0+j08wEKWPcdWa+cwa/L+2sl8v3Bjn/P1LKUHcG1cyp2wRF1kGSXG5Izcl8msWscN/9K9gxW44uYLgmiVBKL4T7qw0McY+lj9kmtuo8kvwUWbD5d14AshsZiEaW/xef6XPUTgehOHXaI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by DS0PR12MB7653.namprd12.prod.outlook.com (2603:10b6:8:13e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 14:03:04 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4%6]) with mapi id 15.20.7875.023; Thu, 22 Aug 2024
 14:03:04 +0000
Message-ID: <0276fa79-518a-4b8f-b65f-dbcce92ca710@amd.com>
Date: Thu, 22 Aug 2024 10:03:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 65/86] drm/amdgpu: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>
References: <20240821130348.73038-1-tzimmermann@suse.de>
 <20240821130348.73038-66-tzimmermann@suse.de>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20240821130348.73038-66-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0091.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::24) To SN7PR12MB6839.namprd12.prod.outlook.com
 (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|DS0PR12MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a8d3507-4b3d-4478-2166-08dcc2b3246e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVZCclhjMm5OaWRVNUREdEdRd0tJV1g5L09WL0oza0tTWlNDOHEvdllrZXpV?=
 =?utf-8?B?WWVoaU5Wc2FqMVc0T3JwNHRCbFg2QnpmRGRLMDk0ZUtqZ3RqY1R0aTBBWUhH?=
 =?utf-8?B?clNRTkdGcGRrMGZMNGdZS1dkdTE2bWdSZ2dnam52REpINXl5L1JseDJnS09H?=
 =?utf-8?B?eDkrdThWUm1RTHIzKzdCUTYyLzlRY2pGVFNGcDRZRDA5OHVTTjJTVVhHQWZz?=
 =?utf-8?B?Y3dmVVI4Z2VmSXR3a0pLdlIvdVFDTHBRSXNHbTM2NEU5aTViaTYxUk1EUjF0?=
 =?utf-8?B?Z0tWVVVITTdVRkgvL2RQeW02V1lXc2dUQVptNGw3NVRJK2hKYUtUT1JEdEFj?=
 =?utf-8?B?RHg0MFlzVGRjN0trSXM4RnloQU5INUVrK0pFTzVBcFFyMFlhSUhoT0U3bFdE?=
 =?utf-8?B?dXdSa2x4dkVXK3c2aVNVZ2UvZmcvTDIyazBmaWFIeEtENzRkczJIaktQbk5w?=
 =?utf-8?B?V2swWWx4MEFGaWtEUXpic2FCWklnK0xlTGFlTnc3emlUV0p3RzB5dWE2MmR6?=
 =?utf-8?B?OU8rOWUvUU9UQUpSMGduZXdKbnU2dzg0SmVPTG1jZ1RNaGI4YmVoeEFtSnM5?=
 =?utf-8?B?SjRySVI0ZVZzNlVSYVNBUWRNcWQ5akd4eXN4cElKU1Q4VStmcW1NS2NWRG5h?=
 =?utf-8?B?T2hpZjRVZVBWZE5YeS90eHpHWWZoemMwc3lKZklGaTZoemI4UTRpTzZCNW85?=
 =?utf-8?B?NmNrZzdSRC9YYThNMGRFU1ExdVE3a3JYYm5qYXNoQnpkeU4veG1BUUhQTEps?=
 =?utf-8?B?QVZTQnNmY2FIanIwdVhvNXFkaTU5MWhiU0RoTGpnRjJvTjI0TFV5aUF0eUlj?=
 =?utf-8?B?TFNTdUMzMlY2UHJtT0hCd3UzRUhzYlloaDU4dzdKUC9BYm90aVk0RmR2Mnhi?=
 =?utf-8?B?NzE4cjEzZEVkOHI5S3RoZTc3TEFlT2s0bDBHOGFBL1I3bCtFN2VIbGRjUEJ6?=
 =?utf-8?B?MmI0U3BDSVg1Y3ovT0RjSFpwSHF4eGgxT0ljV1pUNjRMWTlpSCs1ZVZIdVlV?=
 =?utf-8?B?OEJYMUk0MC9wQThzQldIQ3hJU1R0dy9RUkpNUGtXKzMwY2tzWUF6NHRvMnV4?=
 =?utf-8?B?eTlJdG1ETHNtQ3A1cy9lTXJlbXZXV1liRFQ0VFFPUTlZTWZTTDFWS0RKUkhG?=
 =?utf-8?B?bXRxaURFcjZEbnZiZ0dFZmt3c1VFdjFtanBrZGpKcFhzMkFac1lvcThidkkx?=
 =?utf-8?B?WGxsbndFRjQ5ejVrOGUvd3JabGdTaHhmalovcG85VGZyaUx6cFZFTGtvNGJv?=
 =?utf-8?B?YlNHeFJEWVJUbVVNcXRHaGtYWUZoN3hRbzZuQnlTRXdQeXBtcXR2NllWNTRl?=
 =?utf-8?B?VmtuTnBWMTVQdFRBR3VIZ3Jtbm1GcFlab2R5TmlSNUg5Mjk2NEN0NmFJb0Zk?=
 =?utf-8?B?dW8zVUpMNDc4Q0Nucmd1R2ZzeTdzNC9TWXI1UDErTnhuS0Y1R2JEZkhjU0lJ?=
 =?utf-8?B?VnFHSHZBcExhM2hBc01zbFZvdkw4SVpvU3JsZlZ4VEpHTUxidzJ3aG1OZ2Uz?=
 =?utf-8?B?MHJ1UnJOOTJzTEg4NVgydmpNVWRCYnpDUFhSR0tIR0ZtcWtVRnhJcTBpdjdB?=
 =?utf-8?B?ZHVWb0tRWndUU1pWeWNxbDgvNG5PWC9WZXhaSy9qS2QxUFZ5K2Rtd1FNK1hT?=
 =?utf-8?B?ZzhMRWkrVmNGbmsxMFpta3BjcHpxdDhwdEsyelVPbGxnM3R4THIvamlIdHhD?=
 =?utf-8?B?UUlQSGEwZExud1k1dW1iZi9aQlBneHpHMlJReVp6VmtGWWp6Z2RqOTRnREhV?=
 =?utf-8?B?VTF2VzdvdFdzck1QbEI0Tzc1V3k0L2JpeVh4enB3R1Z1TGN5cmE1NEk2UkNY?=
 =?utf-8?B?WXNaaDRvNmt4QndMdHRwUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB6839.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTNxSkx5RXEyeVhmSElOeFlCQ2tHb05OYndxU2MvaXNjaEZDQUVsUkZPT3FM?=
 =?utf-8?B?eTJQRjRtSmhTQzIvYllXQWREd0FtbTBVSmlBTTl5bDJDWHdycXVpUmVSK0tP?=
 =?utf-8?B?S1pYMWVQb0xBQU5QMzdCZ0JOZFRWWGg3cjBaVUlOUDRsUXdDTThxaFJuSUM0?=
 =?utf-8?B?aDFXUm1jSHg5QklZZ1FDTktSeW5yYTEwZ05xcTNlNGFrbUFYVjlCSGM1bG94?=
 =?utf-8?B?YkdLeUxXcG9kM2V0RkdSK243d0pMRWxEeW1kNlVhemNZdWw2aEdDa0NhZ2Zx?=
 =?utf-8?B?c3J4SjdiWjNha2hocjNaK3p2bEk2RTFZTGw1TUpJN3JYY0Z3cVN2UUxCQTc5?=
 =?utf-8?B?Nm00VzF2di9LUWs1NkFCRVFEZlhBQW9XQkRRY25RU1BBTktjMEhoWUdrMGJa?=
 =?utf-8?B?TU5pUnRsVUpSTDJDVEczM1RhbXkveDd6bTc4NDU1WjQyZDdpVWF4WHZVd3FJ?=
 =?utf-8?B?UVhmTm1JNWRLSE5JbUVTMlFlZE1ZMTBIbVBKL3lWYUNpUjhNWkEvL25tKzYv?=
 =?utf-8?B?RmxUU3RKUmYySkdhQndQVG9FQTNHa0k2WUdwQkt6WENsck1Pd1lyZERnRTlZ?=
 =?utf-8?B?bEhQYVdmLy96NmxIV0daLytWaWVtV1NEOWVvdEo2NE1pT3lIRzJVbHVjV2pR?=
 =?utf-8?B?Z2JFcTROcFZpczNpYWxjWlI4OXorWXVJa2E2cWZzZTJ5MFpwV05wOHBTTVgy?=
 =?utf-8?B?ck9jSG1uTzlQcDBiNU5RRFBzT1d5QitFSUtQM2ZWQW56MGNJcWlrZmFpNllu?=
 =?utf-8?B?Nnp0US9NaVNLeTM2ako2ajhOVHRzY3JyTitsTmNiWkdPZUwrcVk4dE1KWTJp?=
 =?utf-8?B?bjZXT3lzMDU4K28zeHdrSHNDN0xtUzBwSUx3SkRKMENkd1IvL3ZTaEs1TEpS?=
 =?utf-8?B?VWRaRE5WMjNhamljaTFyd1psZ2JDQWJnQVM5bStOZ3hLRWNTbjlBbytRV3Qx?=
 =?utf-8?B?UXovMnV0L1k2VThVNmRCQm5CRVJ4a2hwRG1yU2FHM3VDUEx0eWp5Y2hZQ3FK?=
 =?utf-8?B?Q3pPa3U3N1hGOTdVNXlvOEwyK0xXOFpaWmR6UDEzaG5OdEhFWDliakt1N0RS?=
 =?utf-8?B?YmRJSHhNTlZibE1LTUtJWnRxMm1ZMzB2YUtTaHUzQzdMMU1VaVF4LzU5djZQ?=
 =?utf-8?B?MUtpNzVtMDN6M2IyL1VNN21GeVdGRmpOejhUVk9vbyt5OXkvdm5zRytIcGF2?=
 =?utf-8?B?bVg5blkvMk1KdlU0SFdTVFNrRXo3WThUZ1cxU1JET1dSaTNnd3JkR2dyWEN3?=
 =?utf-8?B?clNERVM3Y1FnSnFDV0Q1eEFCWkpzVWx4T1JscVFFMmR5MFZ1M0o3ZWw5VjQ3?=
 =?utf-8?B?Nk1BN1hoSXZPWTJ6alZFNlloNkdZNDJqalJOMnVLVk9hUHNLZ3pBVW1tSTAz?=
 =?utf-8?B?RER0dHdNVDlOVGprUEdHeTdXdHV3Qzd1WmNNUVgxZVc1elFaekdJdHdpaVBV?=
 =?utf-8?B?aXM1QmtHa09qVnk2aEkyc3pudU5LbjBId1pJb0RKUG9iZXo1RFFIY00wSUxk?=
 =?utf-8?B?b0xGeXJwdDVXUzJhaDlTWjZLUGNYTlUvZjRuV0FHa3A2UTZIeVpFZ3cwSG1D?=
 =?utf-8?B?djBSQmdjS29iQmNJWE00MUkrRi9zaXRVWCtJOUpaRndDc20rQWQyN3V4bFdT?=
 =?utf-8?B?WHN2TllVdnloNHpWa3NUcmwwMklLdWdsK0tMbVpSK3ljYjY2OVVKSlB1Q0Rx?=
 =?utf-8?B?djFabkFBV29CYno1NWJoRm9IUUVaSnBXYzNwcmU1Tkd4RmMxTHdKMjNySVF2?=
 =?utf-8?B?Z2NhMWtDSGsvZmRzaGhkYnV6RkE3S0ZvK2RlblRkNGg2RFNCbnAxUjBvLzdj?=
 =?utf-8?B?NEsvMy9iS2xQTU9WVjI5Sk85RGo1a2FISDAxNGVEVWFLWXMra1BaMnQwRStE?=
 =?utf-8?B?RTBqTjFRRFo1cE96MHdsMTBPT0JFQm9UMU5MWFB3a05DdFRqaTFJMXArTlh4?=
 =?utf-8?B?SEpVZ1FOOG9jOWh0YkxnRkhwM1NyaEZzMkFSM1pwRzJXc2QxbTRhN1pjcXpF?=
 =?utf-8?B?NFk0cUdkTjZUTnZzMXJaZnpaV0NicW9ySm9vN05hbkZMUWdROGhCUmpLTDI0?=
 =?utf-8?B?dFZKbFZZWlNrbVJDNTlrZGVHNGJjck1XVk10c215Z3dYeHQ0dEVFcDdiWHoy?=
 =?utf-8?Q?9MPck+TNcNUc8x44f8hD7Q07+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8d3507-4b3d-4478-2166-08dcc2b3246e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 14:03:04.7651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U6I7Mai0plY4SP2XcS8ZqQWG/mxrGU5ytrNEynlhn17eYpiEzL2iX3MdmUacVvMtWvXKGDwlHteQGfOzAOH4iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7653
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

On 8/21/24 09:00, Thomas Zimmermann wrote:
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
> 
> The amdgpu driver specifies a preferred color mode depending on
> the available video memory, with a default of 32. Adapt this for
> the new client interface.
> 
> v2:
> - style changes
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Xinhui Pan <Xinhui.Pan@amd.com>

Tested-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 5dd39e6c6223..849d59e2bca7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -23,6 +23,7 @@
>    */
>   
>   #include <drm/amdgpu_drm.h>
> +#include <drm/drm_client_setup.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_fbdev_ttm.h>
>   #include <drm/drm_gem.h>
> @@ -2341,11 +2342,15 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>   	 */
>   	if (adev->mode_info.mode_config_initialized &&
>   	    !list_empty(&adev_to_drm(adev)->mode_config.connector_list)) {
> +		const struct drm_format_info *format;
> +
>   		/* select 8 bpp console on low vram cards */
>   		if (adev->gmc.real_vram_size <= (32*1024*1024))
> -			drm_fbdev_ttm_setup(adev_to_drm(adev), 8);
> +			format = drm_format_info(DRM_FORMAT_C8);
>   		else
> -			drm_fbdev_ttm_setup(adev_to_drm(adev), 32);
> +			format = NULL;
> +
> +		drm_client_setup(adev_to_drm(adev), format);
>   	}
>   
>   	ret = amdgpu_debugfs_init(adev);
> @@ -2957,6 +2962,7 @@ static const struct drm_driver amdgpu_kms_driver = {
>   	.num_ioctls = ARRAY_SIZE(amdgpu_ioctls_kms),
>   	.dumb_create = amdgpu_mode_dumb_create,
>   	.dumb_map_offset = amdgpu_mode_dumb_mmap,
> +	DRM_FBDEV_TTM_DRIVER_OPS,
>   	.fops = &amdgpu_driver_kms_fops,
>   	.release = &amdgpu_driver_release_kms,
>   #ifdef CONFIG_PROC_FS
> @@ -2983,6 +2989,7 @@ const struct drm_driver amdgpu_partition_driver = {
>   	.num_ioctls = ARRAY_SIZE(amdgpu_ioctls_kms),
>   	.dumb_create = amdgpu_mode_dumb_create,
>   	.dumb_map_offset = amdgpu_mode_dumb_mmap,
> +	DRM_FBDEV_TTM_DRIVER_OPS,
>   	.fops = &amdgpu_driver_kms_fops,
>   	.release = &amdgpu_driver_release_kms,
>   
-- 
Hamza

