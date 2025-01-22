Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CF0A19A21
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 22:05:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58A110E75F;
	Wed, 22 Jan 2025 21:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p33KEvbX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496B410E232;
 Wed, 22 Jan 2025 21:05:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dFRTPkPjWFNf4XtN6pDcNFp4X2XWIsILlz02rpvQPKBwYdyktShNggTDv4jNJHklm0hCpgokW3LMD9m8YjdjLgVRDNJk8I08Avm3gTxP3W2dUEDISLxvcWrm+gaTi1IMD9oN2NzENrm3Tr6YT2p2fk8JYZUN/HCJHaWTBON6vsNModtvc8SJ5SGwgzfSbi0023SAmjFKLp+UL5hnDNgtMPICY1FQBt79haxw1fdNk9CATaFFoCu6JkEEiPAz7df5QBvYGuadYnmzZHqMfsQpqF/DTBXP7Q3AR9mJGESLcsGHD7eHTC31ComnwTNOcVn/iH18yipTiwFVYl+b4Qw8hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3wNIsHhX1vqLl6RwV8kXNkAM9wPDZE12CIpXt/7R0U=;
 b=qT7MnWddaEXYq8n7JLttB7HIAxaMY8y6Giqc2AsU1e1/j1eNHPQcqkO7cfBbKZIaZcA8vkLBlD5YOKNPL7BPfZX5VCZxoS0cnO3WqbpOaeEa+uVXrZGDY3AFKmGEkA8U2abcqRLXNEZu8EdgUiPzxh6Z+qAEtdPDc6yqITuF6nfABrVo04PkWXWUeTqxJ73yCeNknVztrCn/5sJc0X+vUYJTFSA6f+Wode63pdMjfWA5PvsvNQRUePUFsDQRhD7Rghqcd3grLc2+if2c2EUIc5pi943MwyKCbQL1ACcQPwfmyP+4ZWbhCVbEEbXj7VDzdknZcrdwHKvQSjfao+k1uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3wNIsHhX1vqLl6RwV8kXNkAM9wPDZE12CIpXt/7R0U=;
 b=p33KEvbXlumhc5KvpIIIvB8/d6cpTucL3kbw0JGMYmsztg5WxjALZwo2WpZ97wAcSFxE3H0hcFb8nqgCP+1qsm4+20AsVxxgJBZE2+Zp2UrnEGT+KUiNPyFxpzlCXwEPm3eqJ5/et/PcX+E18P0yx8V6nGENN4poIiPVi54Z0no=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS7PR12MB5816.namprd12.prod.outlook.com (2603:10b6:8:78::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 21:05:42 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 21:05:42 +0000
Message-ID: <f6354255-c6b0-4558-bce6-a153ddc8ceee@amd.com>
Date: Wed, 22 Jan 2025 16:05:40 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 23/45] drm/amd/display: Ignore deprecated props when
 plane_color_pipeline set
To: Simon Ser <contact@emersion.fr>, Alex Hung <alex.hung@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-24-alex.hung@amd.com>
 <jvy2Hqze-awB760FG1skr9viS1MfGpXrAOrJiwgHdtEQ_4eB4cLVMCzL-2zax_-kG8ZtLWrVxQ3vscFfN2jHU09AvlBPhN7ax_u7hTGKTyw=@emersion.fr>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <jvy2Hqze-awB760FG1skr9viS1MfGpXrAOrJiwgHdtEQ_4eB4cLVMCzL-2zax_-kG8ZtLWrVxQ3vscFfN2jHU09AvlBPhN7ax_u7hTGKTyw=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::24) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS7PR12MB5816:EE_
X-MS-Office365-Filtering-Correlation-Id: 70811bb0-4e18-46e3-d3a0-08dd3b28882a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGkzcHM3RDhtcXpRaTE5bzRBS0dmbkJuK21CZzhiTlorMDlLb3lJOGlXMzRa?=
 =?utf-8?B?czhzT3ljMWFTVysrU0JkMXRYbGtmVGx0a2hRalQrOGxrWWRJMGtUOHAreGFT?=
 =?utf-8?B?WGpOVjhmcUtnMFpVSUd3azJoNzFuSGhDUEQrQTBEWmhSOGFzWDVGazkvQ1Ey?=
 =?utf-8?B?TXNnOVRzckRXL2pIU0tjTVRkcHZCNmVxb0R1bTdqVXpIRkluWG1nYTJncXdY?=
 =?utf-8?B?dHk1K1B0QmJHQzMyaFd0LzM5NmozcXVIME9hVzNaT2tjcDBkTGhhaitDV04x?=
 =?utf-8?B?YzBxb0MvblFRUXNJMTE0ZW1UUkpNSk1yY3hycWxrbDVXUFM3UnRudXFqZElE?=
 =?utf-8?B?T1BVM2tIN1VzN3Q1bWUwclpBZlRzcEJ5MkQ3ckpNSHI3RGlReG9GRGhMTGlQ?=
 =?utf-8?B?a3pUM2RRTkVDOTZMR1JIN2pNaC9PamJ1bWtNd2tPSFYvOFRIcGdNS0hDVFlv?=
 =?utf-8?B?RDNHc2k4OVVFeFZsemJYaFoxMmxHaWdSK25ucnBiR3NVS1ZnS0JSTVBxV21S?=
 =?utf-8?B?S0dOSVBVUSsyOUxaV3Z4ZktrMzZnUXd4VDV3V2h0WXlYa3E5Q2hkbG5CWVZJ?=
 =?utf-8?B?c0trVzRIUWw4V3k2R0c5b2xjYWlpd1ZETmhSZHpuK245MGYvWnFBUFIzZ1Nq?=
 =?utf-8?B?eW9RMlRjTERCbytxVjMybTdJc04zRER2RGFWem1rWkxoNXV4TU5MWmJHejl6?=
 =?utf-8?B?Wjh0VXFPdUttSW9vWThNRG9raEM5ZHNQUDZjR05nUS9GMFovUUd5MEJXY2xZ?=
 =?utf-8?B?dnd3cVVodEVZSlVaUGl3dnlGK0YwSnl1Q09WeHZlQm5pQXlsVWlqZ2xuN3J5?=
 =?utf-8?B?UTNielRMc3JsS2h0QjVPYVVpWHUzZlVVRDIyU0lkZnA3WGtEdi9pRHpicCtB?=
 =?utf-8?B?ZEdsY2dSeFZPRkMxSHJjODVHZ2t5UUdibzBrNU0xV0hTdWc2TlZvSEplbE91?=
 =?utf-8?B?N2JjMy91ajduQXd2NDdjQ0ZIa1FEdzRuam5hc1JYY1h4NHpub2tCREhUL3Zm?=
 =?utf-8?B?NlVldlV0WlIyVFBNQmNBSlp6cmhwdk5ONGlxSlFqQ3g3NDBSemlqNUpuYkFT?=
 =?utf-8?B?VDBaWktaWUlIODlWS0dqWnZQb25oZmhXbWxwYXBHbkNsY0FZTWZLUlZnTWZt?=
 =?utf-8?B?S2VNeDJLbGpNeGtQZjV2YVlDOTNwS0I3aDBkOUZydnUrOTJnalBBOWpqOU1E?=
 =?utf-8?B?OCtpdE1Vd1NkdjJGN2RaL3J5RGtaRUVJeHdYdnhYc2VMZjd1TXdGbFVpOEVJ?=
 =?utf-8?B?QnZJMHlwOEtZK2lSUFBnRXEyZHRyYndWWU0vbTJTUzVzNmRaK2g3V1pFUEJP?=
 =?utf-8?B?S2NMVlhLdHZ1RkxpMHhHRUJKWUFodEFIU2ovQTd5bWlUUmQwUTcvZmVEWXZW?=
 =?utf-8?B?U2FERHQxQlpRbmJFWlQ4bkp5R2c5eFMrWCtBUUxJbkErY2VPTm1QQTUvYkZY?=
 =?utf-8?B?KzNkVkR2WE54QndJU0VDdVZJU2RvS2xVeHpteEd6RWorb0tEblNtN01RQXRw?=
 =?utf-8?B?M3RMZVBSMndkdzhJZGZzTC9mdVBYeG9GVjRYbVVrQlY5NTBoK2xnNGFOd0V3?=
 =?utf-8?B?NUZtd0YxWUVjd2tVWmRwZzQwMnBTYU02dllOYkhla2daLzBqREgzRlJLVEVi?=
 =?utf-8?B?aWUzSHFIQVZZclpuRCt4blJYc0tJSEpKVURCSnZJSmxJZFliNW9hK0hEZm4z?=
 =?utf-8?B?a0FPVFk0eGpWenFBbmlsN1pkWklFQ3JBU3VVQzFkSnVKNUhTMi9qQjFmRm9a?=
 =?utf-8?B?bFo3Tlk1QU5xSXVGd2VJdHljTFhUZkVmTkN0VCtzV3lweXJ1ODNpRjU0V3cx?=
 =?utf-8?B?UG43TGZVSWJ3V2ovcmhkdHRRQnI3U1hsUEtEeGx2MmNSL2xRUjZBeUpSYS9j?=
 =?utf-8?Q?2fMnH8p9GbLtr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkxvZmZMTHU3ZzJzMUtkR1lqOVUxdzcwd2k5RTBBQ0ZHcFBUcXhwa3NqYnAx?=
 =?utf-8?B?MWlQU1FZU0s0NTg2eVlJNitXR3I2WkZkRy9YY1owZHRsaVRJM2RHMmhOaFpQ?=
 =?utf-8?B?TGNGYVpjZXplWHN3QUUwb1VidTV0TXJKSzBXMEhBeFVYaGNXTEFoZHVKQkEx?=
 =?utf-8?B?OStRaVBQRUtlb0F6VWdDMzFyR2R5aC9wRXhDMHFXK3ZQQTdIblRUY2hNajNS?=
 =?utf-8?B?aHBnWlphR3dkT25iYkU4QjBrQWJNb3c3anZEZjM3WXo2eWtpUHdjK3ZQeGFr?=
 =?utf-8?B?RGFNaGhFeHNqMlhJM0x4RkNoYlBCQXJGOW42MVdYNWZ2aU95OHRpQm5HMTk5?=
 =?utf-8?B?TkJaQ25TVEgzUVVxOUdqWEwrWStMZ0ZzQW9Dc0hkU1NmS081UytGVGlQb1Bt?=
 =?utf-8?B?VmtBajdiWEkxZ3RYQjA2T1dyUjNwUW5KZ0ZLTDhyWHlneFczVW4xV0VLWUhp?=
 =?utf-8?B?Rk5seDI1VW9ST2pnMmVwdWU3cE1TZmF4bHBLMjF3OFJSVXhzU3hjaWtXMDY5?=
 =?utf-8?B?Q29yT3pkRysveGlaMWhuY1NTblFjQ241MHhML1kxR0FSZEQ0em9TUUVpSitF?=
 =?utf-8?B?blNUVmRibVFnZ0Y4UVJwVlMybmZwZ2FTZ1Jnc3k4bHpPZ29jMm0rYWVGMko3?=
 =?utf-8?B?N0FIOUpPK2RzVnl0ZEszRVFteTB0WG9xWFNyWEc1RzhjSTRkaVkxUy8reXd6?=
 =?utf-8?B?UFBEZ29kTm1hd2l0TXY3a09hRmRDZFByQnNlS1FiQ2xWdzRDWllJTkUyK0R4?=
 =?utf-8?B?aDRNR3hOd0dRSHBLNzlzVURoQXNXMGdiTGR2dENKLy9HZDhVKzJtMy8xcjNP?=
 =?utf-8?B?Q0I3MTc3ViswSWN1OVFyS3AwbTNuUnN2UkhPaFN0RXUyaUZ1a0ZETWI4ZnRQ?=
 =?utf-8?B?aHBLL2huTG1jcWZkQWFONHlsZUZjU0hNRURFbU55VkREUkhWcTc0YVRGaWdn?=
 =?utf-8?B?QmtKMjJwbWRUMjhJdWdncTg4OU9hc001Y3RnQ1ZjQ3NoS2JFTzBMcVlhdEcz?=
 =?utf-8?B?VkFvSE1TTVVCZDBxVUdDbmlvRXVwYW55Ni9DNVIyblBrRmtSQ3ZtenhJbnlm?=
 =?utf-8?B?L1RyVmRuSUVCR2xwU1IxTGJYV3hmR1lQMjQ1ZHBFbG50M0VjV1ZmMTJuMWwy?=
 =?utf-8?B?RjZQMkRvSjB1NDhsRjBqTVByY1V0dVoxUUw0TTlVRnc5a3M5ZzUrTUVDS3d4?=
 =?utf-8?B?dTQ4NnYyeTNlSE93K3pTZmZhMGdseTNJd0tFWnJ4ZWNyeEJMdU8yNUxKbWl4?=
 =?utf-8?B?Z0RGVklEa29uS0laTCtROEZBVDI2anJSYXNjZ3d6MkMzbjMyakZMRHJCWkFS?=
 =?utf-8?B?TUlSTFZkRkhONDJsbDRrc0p2ZnB5TEtReDJ4WWM4RUt0Ung1NW80cUUySzQ0?=
 =?utf-8?B?aGdhaVBqUGwxamxGUnU0bmVFajIxV3lTa2lWNWcwU0RtMlBhWDd6YnhOWmpw?=
 =?utf-8?B?L3FLbGdjczZRNzRUUkJxdE1GUjc1TmwyN0ZsUjJlNHZtUVFMUzZLdEUrdzhF?=
 =?utf-8?B?UmdwWjYzUFBRTUhUbnBQbzNRaFU2bDdhK3o3alpxVEZDVmcxcFRVLzdqOHll?=
 =?utf-8?B?c2VNNHNKN0xHSXU2K0wyQVdzMGYrcnpRRjdRQ0lEY2c1blpUcDMwb2xxaFZ3?=
 =?utf-8?B?RW5mVEx5dWJBc0kvV2Jacnc2Zld0WDVzZ1pIamlsV2hRbG1PMm4vZkd0WXp2?=
 =?utf-8?B?aDVJWHhyVnBDWUNVNGwvTk5nMGFrZlZ6Q0luUmR0SngzelNDcWZZeU1LYW02?=
 =?utf-8?B?K2FLL055Vnp5cHZyYTNOK3hGUytoWmNsam42MG5FZUk2YkNQYzErbnRRT0dh?=
 =?utf-8?B?UCt1SnJHVlZId2RYSnloS0dCU3NoYWMrL3AwYm5YQksvV21weUVQZ2V5dnJu?=
 =?utf-8?B?Q2w5S3dnbzQ0V245eVJEa0U1RkFYZFFmV3ZGYXdpQWl3c0tUM1hCV1R6NUho?=
 =?utf-8?B?NDNnb05XaVN4Nk83Y2wxakNQb1pVWXpRQ3ptSVlFMlo4NTI5VFlWSHVwcFFl?=
 =?utf-8?B?aVdhY1RqRUFYWU9nK0ZDcXdTL2pMUmIzcVJ5SjBvVVRRbW9kYUJLOUZGSFF1?=
 =?utf-8?B?LzdZMWltVEZJcTA3NjcxOXNNczdZaVlTR09MNjdKZWZOcDNjODBkMzdjaWh4?=
 =?utf-8?Q?bGzUE34oVQ0SRLwWKp4V5jPqt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70811bb0-4e18-46e3-d3a0-08dd3b28882a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 21:05:42.7655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2lTvW0iwZ+XwnJeGoo9PvPQO0S9sNskxjM7wPvnZda/4gOexqP14UiCXFHr9BUJiOjju4d75Em8ecNqVmUTqTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5816
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



On 2025-01-15 02:56, Simon Ser wrote:
> Is this "ignore" something we could do at the core DRM level, instead
> of doing it in all drivers? e.g. by silently ignoring user-space requests
> to set the property?
> 

I think it'd be better to reject setting the property. The problem
is that a client without the COLOR_PIPELINE client cap might have
set these properties and we'll want to ignore that when we are
programming a commit with a color pipeline.

Since it's the drivers that decide on the programming based on
the states it's up to each driver to ignore the deprecated
properties.

> It sounds like this codepath still resets the colorspace to sRGB, which
> is later overwritten by colorops pulled in the atomic state anyways.

We didn't yet define a colorop for COLOR_RANGE and COLOR_ENCODING
so the color pipeline currently only supports RGB content. The
intention is to set a reasonable default but the HW programming
code should be ignoring this for RGB content.

Harry
