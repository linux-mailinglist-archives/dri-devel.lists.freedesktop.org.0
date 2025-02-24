Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1164AA42160
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0815F10E4E9;
	Mon, 24 Feb 2025 13:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZyBRAGf3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2DD10E051;
 Mon, 24 Feb 2025 05:26:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lHGH23+mwr8NgwD5jPgxiBuTadLTamtSaGskiytaqHTn8FI2nJe6RezOofER3tJuE8LSY4go4tBxC5q501O2HiZXsNoV+nSqp3hun+oLIPw2Aw9E8xNGdh2zTtVzRoTy6J6Hl5PQryE3JoI8wFhVoXrgZarxBUPj+rHXQHKPn8Sp4PUj+P2aDDudLBbWyGD5CgK8jrE1gf1vNE2wr+EqC2vabqMgUjwmBe0s1V5h6LdR1BJBEirAyiU/iz2AgkJGS/zqyo+gl5C9Js8jHWbZFRp8iMNLPWASu10LZ7X2DjbHs7uSlcrcDDWEzHRML0qE89hY12sjSPfgwrgmDuOhEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yF8A0QwevwiRq2RBP9zJDLn0u1kEgzTytcok9aZFIeI=;
 b=SYerh9j/jYhZZ3nqh5KaaVGBs/apX9Dgdo0k0P4HenXzNU7BVwW8MrWGmc7yVkjTK+UVLxmo6BezLNnnF+15uYxqouzOpg4f5nMG6V9new6KNl/fQV6vslSv4OfxAlmUxWBrBxkFvb9ZoE3G5Y2qLaSLI4P7knHx8uMKN56riifAFHku6S4PyNQZnKavl8VU2etK8MxHzqyFVONDA0KgD1RD0arJ7whCQuoAbIQmJ25MbcvFQwaiE8HTslJcG30hvClKLSFxNOKYf4ppjT8B0mt8EoKD2Sz5ctp5TgqN7eWTlk+4qxJTtYoDzl2EieF9wF106wEkhrOnYS+hmdpH9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yF8A0QwevwiRq2RBP9zJDLn0u1kEgzTytcok9aZFIeI=;
 b=ZyBRAGf34hJbDDnUccznVi29yEITXDbol+OYeFUoX1NhlrEoVUdXx/D0FGkazRx9RflLg0Pdzxn8dAk1y/mwTgGyAmtBqHiSVcJKpgRmetj0rCdqxPHTjCcM88ZMpX33V13SiJX83aPJZ6hgWHUi4l/6sByrmOY9BnrxSZC1cyQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CYXPR12MB9425.namprd12.prod.outlook.com (2603:10b6:930:dc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Mon, 24 Feb
 2025 05:26:53 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 05:26:53 +0000
Message-ID: <011bd073-b600-4db9-b371-05e443db6a9e@amd.com>
Date: Sun, 23 Feb 2025 23:26:49 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: REGRESSION amdgpu 20241108 firmware breaks screen updating
To: mail@tteles.dev
Cc: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Xinhui Pan
 <xinhui.pan@amd.com>, Airlied <airlied@gmail.com>, Simona <simona@ffwll.ch>,
 Lijo Lazar <lijo.lazar@amd.com>, Tzimmermann <tzimmermann@suse.de>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 Ahmad Rehman <ahmad.rehman@amd.com>, Shaoyun Liu <shaoyun.liu@amd.com>,
 Ramesh Errabolu <ramesh.errabolu@amd.com>, Jun Ma2 <jun.ma2@amd.com>,
 Daniel <daniel@makrotopia.org>, Linux Firmware <linux-firmware@kernel.org>,
 Dri Devel <dri-devel@lists.freedesktop.org>,
 Amd Gfx <amd-gfx@lists.freedesktop.org>, Stable <stable@vger.kernel.org>
References: <OJnZDtd----9@tteles.dev>
 <eabde17b-b5e5-456f-a499-cff132f1bf8a@amd.com> <OJpqNWx--F-9@tteles.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <OJpqNWx--F-9@tteles.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0206.namprd04.prod.outlook.com
 (2603:10b6:806:126::31) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CYXPR12MB9425:EE_
X-MS-Office365-Filtering-Correlation-Id: 32b3a987-3d66-44d6-a67f-08dd5493d8ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|13003099007|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlJqRWtkcDY4eGVjdWxWd0VKeTJSZ2RjTEFGdzRnbThDRlN2a2ZGd1V0c2tU?=
 =?utf-8?B?dTlFTWlNRTFTSnhtYkJYcllncC9wbUNMWDJ6bWpXWWZNbTRUQzMzeDdkWlJ5?=
 =?utf-8?B?VFRNZjBjSm1aTWdIazRpcFgzSTNYUG95SFN0SThUMDUyK2VKeTBjenJhYkQv?=
 =?utf-8?B?N0gxclZPNnpETkVRejVUckpUaGx3Sm5ZNHNON3BPamlFUlVXeTF2NnhBdGF4?=
 =?utf-8?B?Z2ZqZHNIS3NUWEVTem8rWW1xWCtlWDlmS0hBdWNPYUlsVzR1VldzVHg3cWlK?=
 =?utf-8?B?SEMybzdvWEN0RWRiQWRLWStyTFNwblljVUFtUUZMSnFnWkpuK3U1ZnIyQm9B?=
 =?utf-8?B?UnRtc3BuRWswckNZUnc3WG5VNk11NUFXRFdPNkVkckl1NnhrOGdKQ3oyYXBP?=
 =?utf-8?B?QURESW05VzhBSHJYb1AvV2czb2VRWS93OHNKZ3Mxbjd5UnRnMnV6c3M0S05B?=
 =?utf-8?B?aWJxcmdlaWlwbk14VnZLWndvUmhNSkRCLzhKaHZnTk5tdjAzVVdoeGxIc0hn?=
 =?utf-8?B?bGZORVlGU0cxeHlTYVFNdjQ5bTc1c3JoY1NVNDlZVmkxZmQwaDBUOUNrWTZU?=
 =?utf-8?B?alBGbVF0bDlWU1J1QnVHY1dxdE80TkwrNWVRWFpteWlUOS84MENsbEpGd2Ry?=
 =?utf-8?B?WVEzWkdpYUxoVStXZGp0eWxVR1BYbS9vUjVXdkpVenBzdFZSSVZOdTIrd2xH?=
 =?utf-8?B?TVNZRWpTU1pYWXoyc3hQelRIeGxlVkZESzBtNk5PanFGVC81ek4xNXZsQ2Zs?=
 =?utf-8?B?NTFtUDVhS0tvU0hqRjllaW1hNVd6UGRNZkMrbUptYkhNd1AzbW40V2QyeDk5?=
 =?utf-8?B?WVhXdjdjMkE1bWpOKzFKck1OeFlmRm11OFF0c0JKZXFwNllrUnZWWUpPWE9R?=
 =?utf-8?B?WXp2a3pWdm9ra3BXaHltSmZEQURBUk54ODd6Q2w5OWFJU1diMXRQRXFrUE0v?=
 =?utf-8?B?S3NiYitmV1V6WjJaNjFWdmJDdkhPcTZySDNLZDJLU012R3JvTzVNdlNycG9D?=
 =?utf-8?B?ZlZ3QUdLb2Rhb2NQSkJKNk1qRkx5bm1xeG5DT0FiWERzNENOYTBTbFYvdXRU?=
 =?utf-8?B?dW9pVkp2ZVR1NmoyTWI2ZCtSeFFRQnRUNlI3M1hvYis4VzJiMFg5azJzRFEr?=
 =?utf-8?B?RHE2RzR1bDNSbEM3Y1I3ZnZIUkM1bDVWQnUwUGlqMWJ2bnVwc2t2MDdXUHVw?=
 =?utf-8?B?NG1XeGR3d2lVSGhrNUFEd2NsUitGQ0UzSlErUUNhekZCczhPY2hxNjFyT1lH?=
 =?utf-8?B?aUxSbkN1OTluSWREY3hpNWg4emtBZXBQVDRFVkZUejArcWExTHgwOFJvZmV4?=
 =?utf-8?B?cVFqMnZoZTNyWjZhWUVnZ3hJcW5hdDR5bzZRaHZQVXN6aHdGUy9WdHFqdm12?=
 =?utf-8?B?RURFc0FsRmdLM0IrWnVQSGo2OEtQWFQzZC9MaktiZkN1VU5oT2s3Vk5SSWp6?=
 =?utf-8?B?Q3pmMmZScHJpT1N6U2pmVFd5MmZxMTBYNmNMd3BIWGxpeGRmYkl6QVl0dVFq?=
 =?utf-8?B?RXQ4VUc0WTVYVU5oTE9sYWhjdW91aG5JWTFXZi9Eb3lMRFYzUU4rdy9nSjhK?=
 =?utf-8?B?NlVLSWZrU01ZaDlnWE5DRHBEeDM1Ri9FRzFzajJJU0pvUWlpUDh4NXBaT0xG?=
 =?utf-8?B?M1V3R2RQQlptSmtZRUd1eCtjOTZMZEluMExGdmV1R3NGVyszU3RQTDJMZDhT?=
 =?utf-8?B?ZmtvbTdhTXpNTHFrUkFXaVB3d0dnRWlqcGpLUmtrNktSdFVOQjluRksvQVBY?=
 =?utf-8?B?TUJsSlR5NXAwTUFnOGtQekdGZHpJSXRQaEttcG5VRXFaU0pIQTd3dlZNU2U2?=
 =?utf-8?B?UVZBallJMXNxSTh6Z09FUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXl6SkJiN1VOK1hDM1RyU0RBeEFGYVZBanlXMVpjaUc5YkpGUWkxUy9WNHV1?=
 =?utf-8?B?MmsydVVPQ2dmZ2RQTGhDV1dwaDZST3dwRVFOaDQ3dHlneXYwaXMwdXJmRkUw?=
 =?utf-8?B?MFZNMWxGTXFjWU5lM1lzNEErMWRJcGxOL0RpZzRnK2dxdlo0ZTNSN3dLU01P?=
 =?utf-8?B?b1cxQ2lKckxxVm05dGtqSy8ySkVoUW51Z3lhcHJlUVYrZFhLWXdzR1lmUmph?=
 =?utf-8?B?SzltUHduTUNwVHpqVkpWdis5SUVCTUtITGJEZFNtOVBCTjlSS3hNWU9TbVlZ?=
 =?utf-8?B?OHd5cmVHWnB6cE9yWWJFNTdRN1Q0Mmk3aWhra3BNNWJ1ZWR0US9CNHoxbzBW?=
 =?utf-8?B?N2JuTVhDTm91SEFTVkQzd3cwczQxbUNZT3BLT0M5Z3FZNCswdGJEdkNxZUQ5?=
 =?utf-8?B?dWxqNFVLcEtFRFd2T1hpV1VLMzNzanJtM0xBYk1CWmhUMDE0M0dYcGpZak1u?=
 =?utf-8?B?dkREUWlERjhxUWhhTkZyTE8zMXFIS1Y1REdobzQrNElyNDFGMUlTbnQyV3Vx?=
 =?utf-8?B?TG14ZWxOYmZGQWh5VlN3dW1BVCt6K1lwTy9rUW5oM056U2ZVaTRraDM1T1lS?=
 =?utf-8?B?WkI1eCtHcGlQR0JPbkY3MGVOZWNsTUU5a3IyL2hLcjdWbHVJK0xGdVJpMlM1?=
 =?utf-8?B?ZFg4WVAzOUQ4VzdHQ3hTVTZCZyt2SSt1WkUyekpyeG1VakExT2NwdktBSitq?=
 =?utf-8?B?UTBsMS9DWU10S1JDWElXZzN5RFg0eEoyalZzUkZnSVBJMFcrOFdHU3BUaWZu?=
 =?utf-8?B?TkwrS2JmdjRnRUFyWWJzZjJmVXpPY3JRcms4UnhMdno3T1gzQmZmdkg0YlhI?=
 =?utf-8?B?RVA5K3dIYXJYaW1Ua2RPT0UxOVNwMzVoQkI3MmphYVRPVWZGekxnNHUzR0w0?=
 =?utf-8?B?QVVFTTgvWlhXZ2tPM0ZzY09peENjbnNscktkRjlnWnFiZVA4RlJOOTlqK1Zm?=
 =?utf-8?B?Qmg4QTBHSk9QckRLTVphK3Nwd0RBMGFVNXBVZUNQSlRad0JWMGFJRm9TV2NS?=
 =?utf-8?B?QnF3SmNNQTIvazBNdjVqSDlaVFduWjJYVm9vWm05a2E2c0VoL3I0UndwVDdR?=
 =?utf-8?B?UnVHV1lRdUxXY3NYK1REQllkaDdEVXdpb05EL0xLTE5sZHZNWENMeXNYQTc0?=
 =?utf-8?B?elVWOER0d2RnT0kyQVVzeHdrRTREQWl5RlhzVU1TMzM4ZmVxMXRkOVRCTCt1?=
 =?utf-8?B?VkdvbGlid0FQcVZGWkc5ZlB4VVgrUTN5cHl1TEhOR3NrSnU4Yjk4aGI3L29m?=
 =?utf-8?B?aW9iSUVQWndvUnA0aUVnTWlaaWl5dHR2Y3hRTzB4ZUZ4Z3BQSGo3KzBKdm1X?=
 =?utf-8?B?RitvVTBocHZYMGgvQjRhMnljSlRlM3k3cldJM2R5V1dldkMwZDVEQlRYK2ho?=
 =?utf-8?B?alFCZWJSa3VUbDVUWFA5NU1DRWEvZmoxV0U2NUxnb2ZUNTJGNk9jT2JBUTJS?=
 =?utf-8?B?OWwwTUVIL0JKZ1VoSXFrZE9tZGJTS3p5bkU3bkZLcVdaV1g0b0RBeTdieDNo?=
 =?utf-8?B?dHJrazF0bTU2dk9abDdDbnNudWFXNUpNRFo2cXJCVUZXajVDa3JRbS9EZEg4?=
 =?utf-8?B?alo1ZlBERnkzWEJCUVhPdDZqV0FpbUluZC9ybko0RXB5VFlQZ2JLYWhqMjli?=
 =?utf-8?B?TWFNb2pBUFV5ZHhvRk5BbTA5bmVPdldIdnFzaW9LamxnLzR0a2E4MUVvK1ZG?=
 =?utf-8?B?dEJ0c2lzZkhoYWpLN3liUWc0U0VMRE05ZDNVbHVqSDBuYWhuTEIyZk1Ld05P?=
 =?utf-8?B?Z1NuWnZ5NzdHQ2hJeDg2aDczOXBjcExrbTNCbGs3T3ZUTGJzTmxjaFR6Mlk2?=
 =?utf-8?B?YVpLNXRCdzc1R2JobFo2NVFucVJMYnhVQkxNMERTbkkvTlJ6WmMrN0hQWjYz?=
 =?utf-8?B?OWE4RTY4T0JDOXZJQnpQNENOOUtmcEpEVnREOTZCaHQ4NkNCRHpvRGZnQnR5?=
 =?utf-8?B?TDRhRTd5UUVhN01IRTlGd09EYXdUYktpNi9KOXIwOHJnZXdpNVZ0VVU0QllQ?=
 =?utf-8?B?cCtnamxpRVFMM21zVVNnNytmaXNiSm5jMkVPWnRHRXR0WTh4dVJDTzY2UW54?=
 =?utf-8?B?bkovaXVXS2VTZ2hpOHBxa0ZFZ1BrSWVrZ3NvNGtLSEEwZVo3ZHA4ekRneWlN?=
 =?utf-8?Q?qMNZJIsZ8gfK2B3VpRFwtQ8Uf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b3a987-3d66-44d6-a67f-08dd5493d8ba
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 05:26:53.1214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jifJa1yVyQq6edPXRcrmlPoNWyIZ6CvKio/zMreK/E4PPMcZUWdguPzENMIKON+lbKMBfBx/5ulJTWSaOyHMZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9425
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

On 2/23/2025 20:56, mail@tteles.dev wrote:
> 
> I can confirm amdgpu.dcdebugmask=0x200 fixes it, no more stutters.
> 

Thanks for confirming.

> It would be very beneficial to include the patch making this behavior default (https://lore.kernel.org/amd-gfx/20250221160145.1730752-3-zaeem.mohamed@amd.com/T/#u) in the relevant linux-stable trees, as this is a major issue for affected systems.
> 
> I CC'd stable@vger.kernel.org and ask for the patch to be included in linux-stable, even though it does not have a "Fixes:" tag, if the maintainers are okay with it.
> 

Yes; the patch has a stable tag, it should come back.

> Thank you for the quick response!
> Tiago
> 
> Feb 23, 2025, 17:26 by mario.limonciello@amd.com:
> 
>> Hello,
>>
>> This sounds like to me a problem with PSR-SU.  There have been a variety of these being reported the past few months.  Enough so that the policy to enable it by default is being rolled back for now.
>>
>> https://lore.kernel.org/amd-gfx/20250221160145.1730752-3-zaeem.mohamed@amd.com/T/#u
>>
>> To confirm that's the root cause you can disable it with amdgpu.dcdebugmask=0x200.
>>
>> Thanks,
>>
>> On 2/23/2025 10:08, mail@tteles.dev wrote:
>>
>>> Greetings,
>>>
>>> I wish to report a regression in amdgpu firmware introduced in commit c99eeb4d0e13f5831ae77f7ec521162594385d5f, the problem persists until git HEAD, and reverting to the previous commit fixes the issues with no further changes to the environment.
>>>
>>> The issue appears on a Lenovo IdeaPad Pro 5, with a Ryzen 8845HS processor, using the 780M iGPU (1002:1900 I believe). The screen on this laptop is 120Hz 2800x1800, supporting HDR.
>>> This was tested on Archlinux 6.13.3.arch1-1, with amdgpu drivers, on both Wayland (Gnome and Hyprland) and Xorg (i3wm). I'm using amd-pstate-epp scaling driver, tested with both performance and powersave governers, to the same effect.
>>>
>>> I will list the symptoms and attempt to guess at what the issue may be.
>>>
>>> - The screen stops updating if no mouse input is given while watching low resolution video (wherever it is, Brave and mpv, regardless of software or hw decoding).
>>>    Low resolution matters here, I can play 4k video fine, 1080p with mild stutters, but lower becomes very bad.
>>>    Here is an example using mpv with 360p sample video, recorded on my phone as to not disturb the environment its running in. (https://youtu.be/kYHqBjPxM2s You can tell it is very choppy, the original video https://www.youtube.com/watch?v=1HrXwe6s4W8 is not choppy)
>>>    mpv did not report any dropped frames despite there obviously being a huge amount.
>>>
>>> - In some programs, text does not get displayed instantly from when typing it, having to type 5 or 6 characters for the previous to finally show.
>>>    All these new characters show up at the same time. This was extremely noticeable with gnome's default "Console", it also happened in Brave Browser's search bar, and Signal, it does not seem to happen with Ghostty.
>>>
>>> Constantly waving my cursor fixes all these issues. Connecting a secondary display seems to fix the issue on all displays.
>>>
>>>  From my limited knowledge this seems like a bug in damage detection for eDP + power management, where low enough power levels don't trigger redraws.
>>>
>>> I am confident the issue was introduced in that commit since I bisected linux-firmware commits affecting amdgpu until the issue was no longer found.
>>>
>>>
>>> Extra info:
>>> # dmesg | grep amd
>>> [    0.414396] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 counters/bank).
>>> [    1.875492] [drm] amdgpu kernel modesetting enabled.
>>> [    1.878563] amdgpu: Virtual CRAT table created for CPU
>>> [    1.878573] amdgpu: Topology: Add CPU node
>>> [    1.882607] amdgpu 0000:63:00.0: amdgpu: Fetched VBIOS from VFCT
>>> [    1.882610] amdgpu: ATOM BIOS: 113-PHXGENERIC-001
>>> [    1.909536] amdgpu 0000:63:00.0: vgaarb: deactivate vga console
>>> [    1.909542] amdgpu 0000:63:00.0: amdgpu: Trusted Memory Zone (TMZ) feature enabled
>>> [    1.909612] amdgpu 0000:63:00.0: amdgpu: VRAM: 4096M 0x0000008000000000 - 0x00000080FFFFFFFF (4096M used)
>>> [    1.909614] amdgpu 0000:63:00.0: amdgpu: GART: 512M 0x00007FFF00000000 - 0x00007FFF1FFFFFFF
>>> [    1.909829] [drm] amdgpu: 4096M of VRAM memory ready
>>> [    1.909832] [drm] amdgpu: 13932M of GTT memory ready.
>>> [    1.935030] amdgpu 0000:63:00.0: amdgpu: reserve 0x4000000 from 0x80f8000000 for PSP TMR
>>> [    2.482626] amdgpu 0000:63:00.0: amdgpu: RAS: optional ras ta ucode is not available
>>> [    2.491068] amdgpu 0000:63:00.0: amdgpu: RAP: optional rap ta ucode is not available
>>> [    2.491071] amdgpu 0000:63:00.0: amdgpu: SECUREDISPLAY: securedisplay ta ucode is not available
>>> [    2.521960] amdgpu 0000:63:00.0: amdgpu: SMU is initialized successfully!
>>> [    2.601611] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
>>> [    2.601628] kfd kfd: amdgpu: Total number of KFD nodes to be created: 1
>>> [    2.602048] amdgpu: Virtual CRAT table created for GPU
>>> [    2.602191] amdgpu: Topology: Add dGPU node [0x1900:0x1002]
>>> [    2.602193] kfd kfd: amdgpu: added device 1002:1900
>>> [    2.602206] amdgpu 0000:63:00.0: amdgpu: SE 1, SH per SE 2, CU per SH 6, active_cu_number 12
>>> [    2.602212] amdgpu 0000:63:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng 0 on hub 0
>>> [    2.602215] amdgpu 0000:63:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on hub 0
>>> [    2.602216] amdgpu 0000:63:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on hub 0
>>> [    2.602217] amdgpu 0000:63:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 6 on hub 0
>>> [    2.602219] amdgpu 0000:63:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 7 on hub 0
>>> [    2.602220] amdgpu 0000:63:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 8 on hub 0
>>> [    2.602221] amdgpu 0000:63:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 9 on hub 0
>>> [    2.602222] amdgpu 0000:63:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 10 on hub 0
>>> [    2.602223] amdgpu 0000:63:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 11 on hub 0
>>> [    2.602224] amdgpu 0000:63:00.0: amdgpu: ring sdma0 uses VM inv eng 12 on hub 0
>>> [    2.602225] amdgpu 0000:63:00.0: amdgpu: ring vcn_unified_0 uses VM inv eng 0 on hub 8
>>> [    2.602226] amdgpu 0000:63:00.0: amdgpu: ring jpeg_dec uses VM inv eng 1 on hub 8
>>> [    2.602227] amdgpu 0000:63:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM inv eng 13 on hub 0
>>> [    2.609481] amdgpu 0000:63:00.0: amdgpu: Runtime PM not available
>>> [    2.610787] [drm] Initialized amdgpu 3.60.0 for 0000:63:00.0 on minor 1
>>> [    2.617618] fbcon: amdgpudrmfb (fb0) is primary device
>>> [    3.788332] amdgpu 0000:63:00.0: [drm] fb0: amdgpudrmfb frame buffer device
>>> [    5.120419] kvm_amd: TSC scaling supported
>>> [    5.120426] kvm_amd: Nested Virtualization enabled
>>> [    5.120428] kvm_amd: Nested Paging enabled
>>> [    5.120430] kvm_amd: LBR virtualization supported
>>> [    5.120443] kvm_amd: Virtual GIF supported
>>> [    5.120444] kvm_amd: Virtual NMI enabled
>>> [    5.170720] snd_hda_intel 0000:63:00.1: bound 0000:63:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
>>> [    5.191443] amd_atl: AMD Address Translation Library initialized
>>>
>>>
>>> Thank you for your time,
>>> Tiago Teles
>>>
> 

