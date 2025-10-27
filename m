Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B91FC0F4E7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:31:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC7710E4FF;
	Mon, 27 Oct 2025 16:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jx8SoAN5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012044.outbound.protection.outlook.com
 [40.93.195.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B43710E4FF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:31:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0hDchJ06btvDN49fuVGa+MjN70wUdxyGH+ntQHnf02rQbggkYcAkCdFh3hsiloFdh2ksnQRkr6are3f05rJimdcyiwh6KYRmHbP+R5oRXG9DAZSxogFA82B9JvftQCW9bBfIIWB20/eS7+U7saEze96bpaaUvPp7QZZx2puSmysleROUyZpERI/lE0tMdKnSVLvQbzNf29AXS3l6uWKI/IrVoh59uzOHB1QzI0USCw+tFlIrhzLSfFq/3jmSI3LiUD8yLq5RsqmcmWUZEWTzG1HX7TzHntQjU9sgMPS3iqpDsWTHgIjhN3+A3M9LmL/x0tyObnKhMOh7urrjL26Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9ridu7xzi98u/ufrISovQd57BLjj/Q7sOmg1czLy9Y=;
 b=rAtScOAOR/WAuKjlzzExcvufveYCU4fb9TPle2ZFGk9gYWIVn81ie4zVjVICg0/ZS8c2fglc1r5OmD0CFgqzk7fXpgAJ3qG37/Qv8cbwo68WfB0SCHa1nS4dRb2exTFwnkIHpOBv9wtyCe1prYJWFfNGg2QP1DuNyGsdYPReKuwPRpCuZ9aIGVuTKg1e3ucjob5uAtNCqAxw2cY+61pe2SndWbzgRMyW4rHuRjmy5FbayHzxo1D649ikqiaf7n9vFrX0A8s0vVG+kWIRSck1f9HQHeHJlHACuNACZ9fzoXapdZtQiwJF0iTH/dkUyUCBZtlIpzKWOtF4emgZnN0wVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9ridu7xzi98u/ufrISovQd57BLjj/Q7sOmg1czLy9Y=;
 b=jx8SoAN5eaMDX5uXRrJHnKEAIKJ4q3QLCV8dQxEPbXj7Vpb0W9/TT0LKZ4pH5ZlKhxgbTnaJkxRrXLT5xHTrzEGwO95qkmgJv/wJ1u44aLFgHmxFBk0xs0P9+lE5YDE3hHc34mgSXtYf8Acm5W3JxDRyMtjtE7eeIz7PZ2WckIU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by LV2PR12MB5918.namprd12.prod.outlook.com (2603:10b6:408:174::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 16:31:16 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 16:31:16 +0000
Message-ID: <93cbbaef-918f-4300-aa5b-11f098e217b2@amd.com>
Date: Mon, 27 Oct 2025 11:31:06 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/3] Add splash DRM client
To: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Francesco Valla <francesco@valla.it>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-embedded@vger.kernel.org
References: <20251027-drm_client_splash-v1-0-00698933b34a@valla.it>
 <yq4btdc5qqukuqps7y53dratmu64ghyifgprlndnk5rbgml4of@rvca75sncvsm>
 <3edea192-6a3f-44f5-b570-7033776e2ce4@suse.de>
 <5ff10f7d-e9d4-4d4d-ae82-8986dc28d14b@amd.com>
 <i7xxy33do4q4odvxxb77xv4ri5jgr6dup5kvfsjfs4h7mbmhrj@h3ke7h5whyvx>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <i7xxy33do4q4odvxxb77xv4ri5jgr6dup5kvfsjfs4h7mbmhrj@h3ke7h5whyvx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0090.namprd11.prod.outlook.com
 (2603:10b6:806:d2::35) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|LV2PR12MB5918:EE_
X-MS-Office365-Filtering-Correlation-Id: 04ec4b18-829e-4cda-fa43-08de15764012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SG1SVWtqeG5UcU8rSDZRaU9VeVFOZ2VGYUFTNy9mS3VCQ3VPZ09GNDhvUmU2?=
 =?utf-8?B?VGFmalhKSVNybHJuRDBwczZjS0dnTDRpTSs2dUNUZ0tVNXlmWm9kbldPNUpi?=
 =?utf-8?B?YWdOWTNPVThkMzZRWFJUSkp2aTlvekRwczB3YnVQT055RjQ4VUs2dHowQ2VJ?=
 =?utf-8?B?aXUvZTIwcmwzWkEvdnlOVXpYVll6SzkxVCtxdVRzcXB2TmdhY2c3U0pXRE42?=
 =?utf-8?B?cDdxODFTZXIrZG9rUEYvRlU4WVQvM0FmK1haYkthZGxKdktOcWhBa2ZBQVY2?=
 =?utf-8?B?OUJQdEZDL2I2SXZBc3hETmNacVl0QllvVlhIb0k4YUs5UE5aYVl0a0dRaXNK?=
 =?utf-8?B?eVhJc3RwSXIrQ3I5TXBxTGlzVXcyajdpV3crSUUwWThoUHBieEZoUSt5cUtD?=
 =?utf-8?B?SENoRHJISEVoTU13UDl0dTNTQzIzMFlLWlhHNWlCVUhYL05IMzdnQU9HV2FF?=
 =?utf-8?B?eFRINVNnRTNKMXRCak5Hd2Q4RjJJeDhjbFZjVDZkTWNGT2JNNGxiU01NY2RP?=
 =?utf-8?B?bmZONEZacDkrWnZBejM0V2gzdzlvM2JqLzE1akhHVUxJOEROTlEzS0lIUUtv?=
 =?utf-8?B?RjhjeC8wYzdsdVYvSUtKSnZnQXp4Y2JaQ09JNFJhdGppb1Bha045S3BkZTA5?=
 =?utf-8?B?RmJSVXhjb0YzTzdMNElrb0ZnQjVwaTVxbzF6SzZsanpHU2VpVEtCQ29PRFIv?=
 =?utf-8?B?OWpER25nRmRYQTliekFSemtUMDE0YWozWG1Ub3RjSVUwaGhaeUpxTklIZTVr?=
 =?utf-8?B?RlBTVUNnanNCUkw2TmRyTllPcE5xOFJEMnJYaVZvOVNHQkVtd3U0c0srTUNW?=
 =?utf-8?B?UVM1dUdyUktpNW80aURrODd5b1hSTE5OWldLQnBJNGlZVlRBU0FTaHpVZVVW?=
 =?utf-8?B?MFhHckdrTDA3UEVWZ2hJS3dqNVEyeXA2NWNFRVI2RkZZdzBzTys4Z0czWisv?=
 =?utf-8?B?M29rQ0NwUUFWVHNDUkZTQi9ST2FaSjVXcERpMXo0MlkxTGpjdGk0anBwV1ND?=
 =?utf-8?B?THM3Q24xYThkcHBlOVI5bWoxVFpMT2szREdNUWJCSERSbkxZMUg4MnFpeEVo?=
 =?utf-8?B?eUhWQ2tsVFlXZnQ5eG1pQUtITEFJdVIwRGFlZ2o1T0RreTc5SGo1RDFySzdv?=
 =?utf-8?B?OHF5Mys4TEpXWmMxWndDOTBxL3NBSHdTMjhPUlhNZExXWTRzay9sVjBYb2pT?=
 =?utf-8?B?MXhOdzV3bEdpbFdmd2dXZldDWkIwWjZUdWRnZGFRQzJ1UUFXQ3F6aSs2bHJw?=
 =?utf-8?B?L2RkcUU2NVV6UUxaS0dSR2VkUFFHWXhGU0dObnhYdlgvQXBoR0lmWS9MYzZL?=
 =?utf-8?B?SDZOY2NuSW1id3dPdnl1dTk4eG5rM0tPYmpWWlBKZ1RlZndYek5vL3ZzRmRS?=
 =?utf-8?B?N3dGVWNHbkNici9JazQrNWpOQld1clBwVVhqQk5CMy9WZTQxUWNqWHM0YkFa?=
 =?utf-8?B?aGRXQnE2MmZCRk9FWHN2QlRjWmUwdDlrTnp1S1RCbXBiM0lHUW55TFJ1eTNU?=
 =?utf-8?B?T0ZobHJuN3VibFBpRGhwTHZJZUM2S3pVMEhIRi9uNWcvMm9JNXBUNUJiN2JH?=
 =?utf-8?B?dHFxbE9CMGNHKzBpU3psWmZmOEpGSVo1U2pzRjdYU012T3Rvbm8weVppcnVF?=
 =?utf-8?B?NGVEVWYxWGNCWkdjQnk2aFpBUUdGTmJUd1BGb3I3ZENkMThPSzBxWWZkMHpC?=
 =?utf-8?B?TGp2SWw3UENDZ1hNdXpITjlEdDJ3UStOazR5R0N3ck1SUmovVk4yK3VaRFlK?=
 =?utf-8?B?S3Rndm40dFpqcnhrMmpablhTT0xPWmRNdHZPR21lZXFpcExYV2k4Nk1rUzFZ?=
 =?utf-8?B?aUtaMkhTZ0Y5Z2RJT1B1UmdiMTJVT25MYmpWSlZLRUtSSTgxN0dJL2JJSzE1?=
 =?utf-8?B?NGYwdUV5VEczbmhTM0IxNkV0T1hHT1E5TmZ4bGMvREhHVFFCbFMwVUt4NlBV?=
 =?utf-8?Q?kJAEf5g9+aQ+JyGowLGcrvJQF7ybWwaH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDFDMk9GektJdVFYVVhJVmF5aGRGSW5zOG44UjYrRTliRmlFQXhhaXhkbml1?=
 =?utf-8?B?ZGxORitSSWVpbjF3K0pKQVhEMEgrbXZxZFlDVDE5cXEyTE9hVXpaN0VRNjQ3?=
 =?utf-8?B?VStzTTg1OGFKSkpPWmlLK3p1TlJXOTBFT2c1Vm1QQzZ0VitjaUExbkV4VWdx?=
 =?utf-8?B?RmZtR0tLQzBySXYxckoxd2tWMWc0RVpCMGlZdDJtaFU1R2Zva29KSzh5YXg4?=
 =?utf-8?B?dVhBODB4c0dGVFpSVFZzSldKK253M1luY2dwNnZJR2NoUW11MWU5VDNCTlZx?=
 =?utf-8?B?c2F2WTRkTnJoNUJZS3pYTUN3ZGRVYlN5S1p0OXphN1RYeWFOdmNBRXU3a3F4?=
 =?utf-8?B?OXhkRkVLQ2pVU3lYUWV2ZUdyc2lVK1FWSEVYcVcvLzVHajVJSEFhS1llRnFm?=
 =?utf-8?B?T0pSY3I3alk2KzYwYjdpK2w0NnhCUzFTUkJLMGFTS2srL3pIOHBSYllBaW5y?=
 =?utf-8?B?Yy9wSml4dlJnV3JDSzJxakZEbVJscGkxQ1hRZHpyak53VVlmS3BjRUR5THdl?=
 =?utf-8?B?R01YNTU1QzVYdnorTHdVeWNsc3dVUTJQZ01JSGVUbGpjZlJOMGxqUjRVdmp2?=
 =?utf-8?B?ajVVZHRZMkQ5Y1k3ZDdrVnNUTkdOODZiZ1lGQzFFQmgxNHFTSTdhK1VYbUd1?=
 =?utf-8?B?bUl2RC81R00rb3VQR1FEcTNXaitVQlRBWWVrOGVyeTRMR0JPRkNvUFhjWU9u?=
 =?utf-8?B?NVBxcmlMcGl6NXJTenA4cHUwQ2hQbnRqMEJzYVliWkFaZmRCUEk4ZENpeDh5?=
 =?utf-8?B?Qk5BQWlxUzBrMEczdGpmY1Z6Q05RMVZuWm9zSnIzd29xUzRqMGs1MGhycngx?=
 =?utf-8?B?Z25Db050K0p0Vm04TjBzcndPSzZhTEpleHJBbXJGb3NCdFRDWWh3WTZ6eUZ1?=
 =?utf-8?B?WCtxNnVCRmNiQkhpYndUL1VYQVpLTUFkMVBSODdpdWtPUHc1UGR5MExMYjYx?=
 =?utf-8?B?SjRqMlpRZkNPYS9UR0RVUW5rNXZLRGlMd2xzVmdwbnhqZERiMEhvVnRseko1?=
 =?utf-8?B?S1RKM081T1VXKzhienRmY1VHRTlCM0JpZzI5UjFpMVF3N2RoUXgrYUE4c2dq?=
 =?utf-8?B?WG45a0gxcDdEdk1SL3ExNHBYUXM0NURpMEdVdTQyYTZYcDhlNzhia3IxaXdH?=
 =?utf-8?B?MDd1ME9kT1NTQjNoV2YvRkJYTlpNNnMySHJpMUxkWFREMW9lbHFMMzdnVHFE?=
 =?utf-8?B?RW1WbDkyQmpGb1haWnVzSGkwL25vOGtta0xNRVA2Ym9xVnJUN3BWY01pdGVT?=
 =?utf-8?B?VmJIN1hZRTdEa25TUldKM3JwVDVqMVNVWk84TkI2YU1NL0x4KzJmZVpzZys4?=
 =?utf-8?B?VW93U2tCdEluRnl5blZOazcrMUJYODRDOFJLSVpyTFd1bDNqbW13NzhzQnVL?=
 =?utf-8?B?NEVvSVRUMHZCSDRrQm02MXFoK2xJb1J0WXI5a0RFNGlJTkhOdldrT0dZSGlm?=
 =?utf-8?B?ei9pWTNZbG82UzQvZzZQclArZkFqZlFJS1MzSm0rTXB6UWJtVWt2bjY1MDRq?=
 =?utf-8?B?b0NySDBpc3hpQ1ZidXRxY2Z4cDVCYXdGYnczbFI3TTNYSUo4QlNGN1VaeGp6?=
 =?utf-8?B?Q09jbzdrSWU4OUwrbGREeU02MWYyZHA2REwzbUxnbFd2cWlUME8wbkdDSnd5?=
 =?utf-8?B?a3lnMlJFTWVxZ1h1Q2tUQThMR1QwVjRBZnJmVnFxSWxrV1E1UTFRRVN6bmtu?=
 =?utf-8?B?SnV1RWlzSnJlS1RJZTliTFdOdnpPNHRHK3NVb3FSOUVGUHp3YTZ3eTNwZTVr?=
 =?utf-8?B?Sk9CRlBnYTlLVVRCNGVMU25HekdqVkZRZ2ZESFc4K20wR25PbHBGWFJEb1Vz?=
 =?utf-8?B?UEpEREx4cjlpZ1dJSUxyVjdzdFZFWTBYcyt5WmFzZlNsbmovQmVNN0NmZUdx?=
 =?utf-8?B?blZLSzlyRHcwOTFDWWJHaUNRbUxqUGZDU2FacWN2K1c3cHo3clBBd3hHMUdr?=
 =?utf-8?B?cTVDbWdQaUZJWkdmVHpzcVZIclRkZjlZNFpKc1d5ZzRwdTJCME1FZDNQTmNG?=
 =?utf-8?B?QU5FMU44MVA1a2RFeUhMWFA1a21TTTMwNFlLYVNXSkF0MVNCSzVGb2RpeWg4?=
 =?utf-8?B?SzUrUWw2S2xZMDJFeEZUVGFRaTBTTFZRRGVZVlFPZjNhNkkzZ1FCbGZQYitq?=
 =?utf-8?Q?ntGUQp2nneS5z3vJilV4MBToV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ec4b18-829e-4cda-fa43-08de15764012
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:31:16.2279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a4cs9UcMVt1W39GvxgUV8kp2bvexuDVNVqvoAI0jlB0H5expVops2OJUm55/+uxBg+q9ptHs9RTcdLN3R5eApw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5918
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

On 10/27/25 11:28 AM, Maxime Ripard wrote:
> On Mon, Oct 27, 2025 at 11:01:55AM -0500, Mario Limonciello wrote:
>> On 10/27/25 7:35 AM, Thomas Zimmermann wrote:
>>>>>     - a very simple progress bar, which can be driven through sysfs;
>>>
>>> Once you have options to control these settings from user space, you
>>> should do it in user space entirely. As Maxime suggested, please improve
>>> plymouth for anything with animation.
>>>
>>>>>     - a static image (optional).
>>>
>>> Board vendors often provide an image, see /sys/firmware/acpi/bgrt/. This
>>> is a candidate for display, or the penguin or a custom image. Please
>>> make it configurable by Kconfig. Again, if you need policy and
>>> heuristics for deciding what to display, you better do this in user
>>> space.
>>
>> I'd actually argue that the static image from BGRT should be the preferred
>> priority.  This can make for a nice hand off to Plymouth.
>>
>> The (UEFI) BIOS already will show this image as soon as the GOP driver is
>> loaded.  Bootloaders like GRUB by default will avoid showing anything or
>> will overwrite with the exact same image in the same location.  This can let
>> the kernel do the same, and then the moment Plymouth takes over it could do
>> the same.
> 
> And BGRT isn't typically found on embedded systems at all, so I'm not
> sure it's a sensible default, let alone a priority. At most a possible

There are certainly embedded machines using UEFI and that have a BGRT.

How about "Sensible default the top of the priority list if it exists"

Just like Plymouth will start out with graphical splash and fallback to 
text if problems.
