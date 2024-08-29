Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7210F964063
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 11:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F98910E32C;
	Thu, 29 Aug 2024 09:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fxrNYqd8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7DA10E32C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 09:40:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sYoV/FGU1dtmplpFTkgVqqShwX4bhIfj+TwGmLhv1jSaidi2TPsDUO0/95Ed/YW0cB+uWrZmFwY0U6YHqFCqpI/5yqHAAmFtNWyYF6nzgRJC1yElJG3HtaJXmYzZas7s1b/1pbsetnTbdZLS+Sl69mKcHwAwDwspjxtdEYFLt9rB/NTgZ5lszSPUaIEvI72CkIqPzr+9Pa390n2MzCfQ/RNbCn8ZurJU8CqKcLjSeSSrucM4tQAHVT7Vo0fSYvyAJy5Qfmj35Si4iJbpwzpUFChBAlx+0dWQhcrL/B2P3Yd8cL3jFsgGPtvB+CT7PFBx1QQr8wou3p7BHHXvSB1aZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06jgXY4F0HYuuXSOCtGklzSbrI8TLzs2+ok3o4EeFpY=;
 b=GUS49oBX2keTjwbMBIf2q4u+w7Ori8ckYGTMzi4lrrbj14hj50v46KMxUmPn0aW2U3zUUg7lCjA/XTvo0WSvilfeMrWyiRh7mmFZXMw+7/a87ty6IGx8pZ5eqcanxsuP6iJbOtDoFiwi3UmQZb7r2430bOgW22ONYQCSRDeolc+uHrGJq3e79FGcB1cN0qDlybgJ/eHvXCzH6Qf/JnyzTA6gci/ooF3wyBeSXhfH1Zpk5plhC+qmP4idgAMl+B4rPQWX4tS5PLXk9UGIw40x0tMGonwIoTShdep/zkBX+JU+pV/sBoUGSR9V/qio1VRzDO2wTlRnFDN8Stm6GImntQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06jgXY4F0HYuuXSOCtGklzSbrI8TLzs2+ok3o4EeFpY=;
 b=fxrNYqd8UQyJFTQWI9DGpXccq3gy4m9JgyJL6+3SndurkYOnCbyPHmNdJujP/w44iaztXuVCeO5tkxJtQJQ0V77Lv/Qjf92ez8MxoXA/LaXGGUbmBfTql4VuYGxvcXc7h+O6eFN2y3654IAJ2xY52xxP0lJ4ZHqGgOrxmk9+65c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by CH3PR12MB8509.namprd12.prod.outlook.com (2603:10b6:610:157::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Thu, 29 Aug
 2024 09:40:39 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%3]) with mapi id 15.20.7897.021; Thu, 29 Aug 2024
 09:40:39 +0000
Message-ID: <c64be651-2f40-4535-a537-b8304e6556ce@amd.com>
Date: Thu, 29 Aug 2024 11:40:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/10] drm/panthor: Add user submission
To: Mihail Atanassov <mihail.atanassov@arm.com>,
 linux-kernel@vger.kernel.org, Boris Brezillon
 <boris.brezillon@collabora.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Akash Goel <akash.goel@arm.com>
References: <20240828172605.19176-1-mihail.atanassov@arm.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240828172605.19176-1-mihail.atanassov@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|CH3PR12MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: 559b0fdd-b1ac-4e92-66cb-08dcc80e9df3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ykw4Nkt3K0hlNzN4c0tXTDNRUDZMWnVReWtrQ2NKYUMvU2N5aWJHK3V4d0FC?=
 =?utf-8?B?SFBJMEppeTQ5WFVrek8zMlBIVVRmSkx4WUtNNWlHLzNKdTU2K09xZElpYXVa?=
 =?utf-8?B?WUFXVDF1N01DdkxCSS9QZjh4VlpYeURLQ2VDQ0gxZWNiMkVaZmhQb3EwSWsw?=
 =?utf-8?B?QThWQnZ1a1RlWnNWUWNqSjFFNHFYeW9ZeVZHcnA4Qm5BaWNONW9KZ2dLYi8z?=
 =?utf-8?B?dEdqN09UY0s0VVkrUFJvSkUvN0RQdmVKV3o4OHF1L054SmIxcTMrRGUvVWJv?=
 =?utf-8?B?b3NLbkREWlk4ai9tUURVV1diR2Q3Y1lUa1I4Y0VoODh3SWE0bm1KUkRRS1RS?=
 =?utf-8?B?TTFVZnpaRm80NndvaU9uZjM3aStuL2MyVFVHTzhqbi9MRW4vbHdKV0Z2aUc5?=
 =?utf-8?B?Wk1iR0RGT2NwWXRNZVpRazFJT1g3anNaTE42QWFweDVaN0U4dFhnb0NKVVcy?=
 =?utf-8?B?WXZZU2FCTTV3cGQ4UEpCWldmUDVJQWRkTVlpN1VoaVVZelc5NXY3YlZQYzVP?=
 =?utf-8?B?bUZ6TzJKaDBNRlg2eEdWNFJBMTMwSVVSbFUybUdnOWVMbjgzY3RiWk1BWHJJ?=
 =?utf-8?B?Ymh5bU9WQ2JscEJPTUgrblVHMUp4amQ5LzRZSUJ4YkVuaysyMzlReDBkYm43?=
 =?utf-8?B?cjFBa3NTczhDMGJqZkMyVzZXQ2RnbStRT3ROWVA5elRFdURCT1p5d2tCeUtK?=
 =?utf-8?B?KytpYXBVYS9SV0VCZk1aNHk3Q0p2M1luTURzSGhQM25abDlQVXNIWHFrajA0?=
 =?utf-8?B?eEFWVGtUWFF0VllxRC9menNJcjFwazUzbHhRNGhrd3RseStTbGllaVVmbzBJ?=
 =?utf-8?B?WjBUYkJoajV1UzNlVlhxUWdCRUZ0N0xZNVJVYTB1ZVRsMGJWUmFzcGVGUGp2?=
 =?utf-8?B?aU1CRnI0dlNmMDFhUTZ2am5VZW1KRGYvSmM3NWUxTkZXSnVDVENoRFFNZmhO?=
 =?utf-8?B?VWpwOUhFc3J0SjJYaUo5ZERyRzY0NEJCNHlYNUQ1enQ1ZnkxN0FsT0VQVW4y?=
 =?utf-8?B?NVBQYXc2QXJBWmVnbmRZU2xIejFxaW9QYVQ3ZmQzWGFDVDllaEx2Q29JOGtt?=
 =?utf-8?B?MXgzUm84WGU2ZGVYSTlKS0h0S05nQkxwL1R0OHJITkREeTRJc0ZReDNCd2ZW?=
 =?utf-8?B?MkpJbzJaZVp0V1VuMkdwSERLMkxKaWI3ZGV3QTJBa3pLY0J5bURRUmVqaXFQ?=
 =?utf-8?B?OGdmRUM0aHpaR0Z3ZUk5UHJ5UUEzVDhpT2pOVHlrLzh4Yk1kcDlsWUdGRHUw?=
 =?utf-8?B?UWRNOFdtSGdFTkVINml1T0xVKzhpdG5GTzZpb3FuU1lZMEpRdFY3eEoxOG9T?=
 =?utf-8?B?Q3AyZXI1NjQ0YlNYRThESkZwM1FXN1dCNmx2OU5IaGUrRDg3YkFRbU9wYTRQ?=
 =?utf-8?B?SmM5N2M3aXhLNGRqRmEva2crK2J4MTgySHJJS1U3NDZzT1Vuc3RrdzFzeVVN?=
 =?utf-8?B?YlZteVpPK0Yyekh5MzJBREtxK3BmekJRUS9pak0vc2phQTZCcmNHQ2p4U08r?=
 =?utf-8?B?NDF2TGs3cGFUdldVYnRRSSs2YVdhcUMvRWh6ZGJDWWZLWGxaRENrSXd4UWdz?=
 =?utf-8?B?a3N4M2wxc2hPTjFDVThValFWM2M4REtSVDNHRHdTSEdVaXduN0lJY3V3RWdF?=
 =?utf-8?B?MkE3azcyQ2NxL0QyRit6Tllxc2c0dVRCMm9LNE1xVUZEYzdkMjlhZzdmdGQy?=
 =?utf-8?B?VFg1N0UwaGdUeFpJN0JaRzRIc3lTdFQ3R2VxZU1tQlZlSW5EMVhOUEVmN3Vq?=
 =?utf-8?Q?bk42L3g2JtB1X0Jxsc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejBiUWtPRVI1OW5kWC9SNkVJZDdySS8zdWZ1aHYxUVU5dEx0N1NLb1N6UDFs?=
 =?utf-8?B?d0R0blZodmxuRldLcldRZ1dGODBQdHJRL3Z4YnZGUWdKd2xxRDkybnBIRENG?=
 =?utf-8?B?RXhNY25IZjRwT3M3R3BvODN5SkdxZ2ZLeStMSUJYaUJpWlZibjhTMXl3U3N0?=
 =?utf-8?B?UUM4bmNNeU45bFR5UENBTmVRSjZib0swVi9aWEZOVXExY1Y4WVRCaW1JS0tk?=
 =?utf-8?B?STh5aXFJRjR3cEFmY3pqYVhyQ0tTZTRDYkp3cDlURDVpTmMycE80UDVXbmNa?=
 =?utf-8?B?aXE3VHRCbVhnWmdMa0ZybFlqRVM2R3ZhUWVtZ0xYTXIwbDJ6VnFzUjJzTVgr?=
 =?utf-8?B?WEREeEFKc0x2aDBTMS9BVXpuc3FWQkdUZ2tVU05wTHdXS3pML2FmbXZUY3NL?=
 =?utf-8?B?MEtJL2JjZzFVVXRDbHdpa1NFZElwY0taYVBJY2UxTERaWWg1dmk4aUp4b2Jo?=
 =?utf-8?B?TlNVa1lEcWduc2NicllEeHRvdXMwdkVGQ2V4VEMwOC85bVFXdUZzcDlLaXhJ?=
 =?utf-8?B?SW1ySFFYVnc1V1N4cTJnR1MrZ0NDclpoYjdhRG1uU2VnYUNkZk53Y3dWYVhB?=
 =?utf-8?B?TjhaV2FQSmZBa29DcENSVXkyUzdITE5qeEZkeHErQWFVWWRrVDJSSGVxbHg5?=
 =?utf-8?B?ZEtodTFpODBsbFEwOHdZVzA4WjFhQzk4Vzljclc2VzBXekwxZVlNUGROa1NU?=
 =?utf-8?B?SnBwaS9RYUY1Qk0rV3F5RGo3dlAzUHdiTXhCTHloNTI0U3ZmRk1NUUF0SW0y?=
 =?utf-8?B?SlJDVDBmSUtXV0dRQVBCdjBmajhETEVtYTVYN0Fyd0l3SkxGTVZoYU9lY1o0?=
 =?utf-8?B?cjIyenVmNDE4bGRLWVEvdWNHcFlTSjVzcENvdFkxNnVRU0k0R014WEJxNVJF?=
 =?utf-8?B?SVRLQ3lrWFlGSlVIL0ZTNkZ5ZmJtdUJiU1JyUHhRU29PRi9HVXJSTkxESFcw?=
 =?utf-8?B?ZklFNklkcVlYeE5BWWVJdlZRTURtNFYwcVFvdzlPMnFtNElndjNPbHFEMEE0?=
 =?utf-8?B?dGgvekdJL3B3TVpvRnF2bk9YQ2hKRTlKdWxoT2I3SC90YmJMOUxjZjA2U29k?=
 =?utf-8?B?cS9DYm0wS3ZJS0U2VkNDdjhYSGFZQXowK2g5MzlwL1hOaGJaZC9sNnMyZ3h5?=
 =?utf-8?B?R2NHVTFiTXE3T0J2a0hOYnAyUDBjVkxRaWNnK3dqbFFZYjZYdUFTY25jWEZM?=
 =?utf-8?B?K0l5T1NaR2lXQnRSeTZnS3JtLzNwdEIwM2NkQTd3WnVpZWdVWDlGSHhCK2RL?=
 =?utf-8?B?eDNjOUNzUVZsZkxSRFQrRkxKSE0yZzhOVFZhTnZBbVgwTEpZNm9GTVRRbDdh?=
 =?utf-8?B?OStsR0t2aGJjWGFKb0JESFVEMGk1dnJxUDNoejFzbTlicE1XMXdaTmw4L0Zi?=
 =?utf-8?B?ZVJHNGxqNFhEY21xc0hVOW03WHFuT1YvdEFvZlBaRU5CZ0RCRno4Sy83SGtY?=
 =?utf-8?B?NUFGZVVPNmpwUExIUEpFa0ZMaXNEcllWSkVoc3hla05MNWZsMlI2WmhUd0JS?=
 =?utf-8?B?bHI4RU5PVzJ0U1Q5c3BxeFdwdnVQM3p5N29OMCtnSkJYSXFUU1Z2RUNPdXhN?=
 =?utf-8?B?MncyQWFhbFBtdXBBREN2dnVkOTZIVEgwaTQrbUtHUXNRVFlXemI2YXNGUU5W?=
 =?utf-8?B?STVVM3F1ektOczVGQi9Bb0IxL3ZKRWh4NTdBM1dLZk10czlFejNnN2lseXpq?=
 =?utf-8?B?S1NpMXoyZTY5QUhGVUZWeXFyMzFTODllTHV5b08yd2NDV3Q2cTJPT1Q3YkV2?=
 =?utf-8?B?N3BHbUd5L202OC96OFQzVzNPMlJDcUhTbG1tdFdnN292dmZ2K0pCZkZkeVJX?=
 =?utf-8?B?N0psVW5SSnhoLzdQbkhMZWhOUTQvd2F6dkQ2eHBudlg5ZnNmSTZsTmJqVzlt?=
 =?utf-8?B?TG5uZzcvWmhsb0xCVHNadmRWbCtwaWpSQTRMSS9VNVVwcWVySjhlZ1lzZVFR?=
 =?utf-8?B?VUN2dXN6NFdxVytRMzcwM0ZNS0wzU1k1aDBwN0FrSXJrd2tZajhGRlJCcW5r?=
 =?utf-8?B?TGRQbHc0NElyZTFoaldWbzA0eEZoRG9USWNSZSsvNkVURG1VdTJaTWJWMWVx?=
 =?utf-8?B?Qi94ZlNtaytBNG1mSzBJN0taNTI4VzF3eWVSV1ZvekNqN2k3eWQzV1NrQ3BB?=
 =?utf-8?Q?omftVMTMBOLejzp/osh1Siy39?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 559b0fdd-b1ac-4e92-66cb-08dcc80e9df3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 09:40:39.0524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NpS8xqLjvtdFSOH0h85RCSkmo3C0lUXk/UQb6Tf/GGmGbxMKG5NVYultEcgtb7rI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8509
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

Am 28.08.24 um 19:25 schrieb Mihail Atanassov:
> Hello all,
>
> This series implements a mechanism to expose Mali CSF GPUs' queue
> ringbuffers directly to userspace, along with paraphernalia to allow
> userspace to control job synchronisation between the CPU and GPU.
>
> The goal of these changes is to allow userspace to control work
> submission to the FW/HW directly without kernel intervention in the
> common case, thereby reducing context switching overhead. It also allows
> for greater flexibility in the way work is enqueued in the ringbufs.
> For example, the current kernel submit path only supports indirect
> calls, which is inefficient for small command buffers. Userspace can
> also skip unnecessary sync operations.

Question is how do you guarantee forward progress for fence signaling?

E.g. when are fences created and published? How do they signal?

How are dependencies handled? How can the kernel suspend an userspace queue?

How does memory management work in this case?

Regards,
Christian.

>
> This is still a work-in-progress, there's an outstanding issue with
> multiple processes using different submission flows triggering
> scheduling bugs (e.g. the same group getting scheduled twice), but we'd
> love to gather some feedback on the suitability of the approach in
> general and see if there's a clear path to merging something like this
> eventually.
>
> I've also CCd AMD maintainers because they have in the past done
> something similar[1], in case they want to chime in.
>
> There are two uses of this new uAPI in Mesa, one in gallium/panfrost
> (link TBD), and one in panvk [2].
>
> The Gallium implementation is a naïve change just to switch the
> submission model and exercise the new kernel code, and we don't plan
> on pursuing this at this time.
>
> The panvk driver changes are, however, a better representation of the
> intent behind this new uAPI, so please consider that as the reference
> userspace. It is still very much also a work in progress.
>
>   * patch 1 adds all the uAPI changes;
>   * patch 2 implements the GROUP_CREATE ioctl changes necessary to expose
>     the required objects to userspace;
>   * patch 3 maps the doorbell pages, similarly to how the user I/O page is
>     mapped;
>   * patch 4 implements GROUP_KICK, which lets userspace request an
>     inactive group to be scheduled on the GPU;
>   * patches 5 & 6 implement XGS queues, a way for userspace to
>     synchronise GPU queue progress with DRM syncobjs;
>   * patches 7 & 8 add notification mechanisms for user & kernel to signal
>     changes to native GPU syncobjs.
>
> [1] https://lore.kernel.org/amd-gfx/CADnq5_N61q_o+5WYUZsZ=qu7VmeXTFHQSxLwTco05gLzHaiswA@mail.gmail.com/t/#m116a36a598d8fad1329e053974ad37a4dc0f28ed
> [2] https://gitlab.freedesktop.org/larsivsi/mesa/-/commits/panvk-v10-usersubmit?ref_type=heads
>
> Ketil Johnsen (7):
>    drm/panthor: Add uAPI to submit from user space
>    drm/panthor: Extend GROUP_CREATE for user submission
>    drm/panthor: Map doorbell pages
>    drm/panthor: Add GROUP_KICK ioctl
>    drm/panthor: Factor out syncobj handling
>    drm/panthor: Implement XGS queues
>    drm/panthor: Add SYNC_UPDATE ioctl
>
> Mihail Atanassov (1):
>    drm/panthor: Add sync_update eventfd handling
>
>   drivers/gpu/drm/panthor/Makefile          |   4 +-
>   drivers/gpu/drm/panthor/panthor_device.c  |  66 ++-
>   drivers/gpu/drm/panthor/panthor_device.h  |  35 +-
>   drivers/gpu/drm/panthor/panthor_drv.c     | 233 +++++++-
>   drivers/gpu/drm/panthor/panthor_fw.c      |   2 +-
>   drivers/gpu/drm/panthor/panthor_sched.c   | 408 +++++++++-----
>   drivers/gpu/drm/panthor/panthor_sched.h   |   8 +-
>   drivers/gpu/drm/panthor/panthor_syncobj.c | 167 ++++++
>   drivers/gpu/drm/panthor/panthor_syncobj.h |  27 +
>   drivers/gpu/drm/panthor/panthor_xgs.c     | 638 ++++++++++++++++++++++
>   drivers/gpu/drm/panthor/panthor_xgs.h     |  42 ++
>   include/uapi/drm/panthor_drm.h            | 243 +++++++-
>   12 files changed, 1696 insertions(+), 177 deletions(-)
>   create mode 100644 drivers/gpu/drm/panthor/panthor_syncobj.c
>   create mode 100644 drivers/gpu/drm/panthor/panthor_syncobj.h
>   create mode 100644 drivers/gpu/drm/panthor/panthor_xgs.c
>   create mode 100644 drivers/gpu/drm/panthor/panthor_xgs.h
>

