Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9913195B6EA
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 15:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0516510EAAA;
	Thu, 22 Aug 2024 13:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ShRFHmwt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8944110EAAA;
 Thu, 22 Aug 2024 13:34:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZIe4n9P7PUsjlj930arxZtibLiTBPg8P4vz+VnQwFBvK+idxI91g6hxYAZNcIFwWX8DUMKkNokpuxLkM2Bp3HBLKfKu96Ote0SwOURpAClEKUx73KmK+uiPKpxJybz9EQvGJo2AjoweBcNfPBwKK14F5nFP99d6d6UU2tanoB7Gz7rH+C0s7tbHYz9B8gfQGbX1NfqKppjwrOtvrSk2E32zbd9CaWjuvRQR/JEJiNM98xx9SOiSDhheB2BMMzuWXjR1nfpNjqV1sgJUN4mULmH5h48lff9U4gtCLRLiIqmE2/H8BNwjlXYn0GWIACYI8OEDBajevJgCoLcoZLvlQPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PadkYNYfQasG1Xao9DaHY2/cWouAKSDb2Jqibk9JlII=;
 b=tXNOJ8uD/ziECDn9Z36qELNCf8AQGuAp6qzDxPqthQZPgd97bZb10EtXPMpvTxOqx6YkjaU4CPdrsrP0GqCgzzw6VhZ5SjR8IWLrZDm5URutQJR9b9JZhovRHnw9BFHVFzOrxens+qAFAZKd22rmYP+Sdhzh5Wuc33F+fjoA/1RjurZVVP3/1oCixmBF2H7T8+oJzrL/bZyYaTgpNrNlfax5ejABGYfQaJIB1VK8J2b0ECcSPIp78bi/tS8IW06ITOe5NwatTfc3C9x83b3gcoJ1Q5MJBc/aOwcJZNAP+WQ0dX1T3P/7j4aQ+yxK7r4eErJTq9++O0tQp07dwtNF1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PadkYNYfQasG1Xao9DaHY2/cWouAKSDb2Jqibk9JlII=;
 b=ShRFHmwtwt84BJ6w+vSUMYsoJ8a8WsH4tp9og0OhDlgo83/qZ3xTKSJxXwOnbWanABtBWeGRKXNVjWH7XbiYm0QSGMmoicirFWozn3KWkmjMFKv0z9w/zFCF6bRL0ZXnPY6C5mw/4ICtZQBqw+VdBs6Wwy0e8Ti4dU4+m/D7y8Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB8209.namprd12.prod.outlook.com (2603:10b6:610:123::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Thu, 22 Aug
 2024 13:34:28 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7875.016; Thu, 22 Aug 2024
 13:34:28 +0000
Message-ID: <3940dab1-ec3d-4d14-a43e-8821b9f6a1de@amd.com>
Date: Thu, 22 Aug 2024 08:34:34 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] drm/amd/display: Add support for minimum backlight
 quirk
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>,
 Hans de Goede <hdegoede@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Jonathan Corbet <corbet@lwn.net>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dustin Howett <dustin@howett.net>, linux-doc@vger.kernel.org
References: <20240818-amdgpu-min-backlight-quirk-v5-0-b6c0ead0c73d@weissschuh.net>
 <20240818-amdgpu-min-backlight-quirk-v5-2-b6c0ead0c73d@weissschuh.net>
 <269b2e72-2f93-4415-a56e-77536f373b22@amd.com>
 <f516b4af-0dac-4607-bdab-e4c83395fe04@t-8ch.de>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <f516b4af-0dac-4607-bdab-e4c83395fe04@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::16) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a4e1954-6353-47e8-5afc-08dcc2af251e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZklsZ2djQWltcUdhRmJDck5ka0NyeVBUemIyWWFSUnlzMEtGVnM5dHR3eVNK?=
 =?utf-8?B?SDU3ZVo3TUJHd3E1VTNIa01KMm9XRWxJK0h0UUFsaG1uL1BCeWZPcXJmcXJK?=
 =?utf-8?B?c2pGZU1lQktyOTJKNmU0UDIrMy9xM0N5L2lQYThJVnV3UllQYmVWb25BMFdD?=
 =?utf-8?B?RXI3QU0vNldqblZuNHRGUzI2dE5mMnd1V1dMWm1aVkVzZnlFbnNuM092dU5W?=
 =?utf-8?B?TTJad1hoTjd2MXZBaDk5MVIza1RRKzFMRG5adTMyaVBORVg3aXlBYmhOZSt6?=
 =?utf-8?B?Vm44V2ZBRG80d3plK2JVbWlIRVNVR3FCSG9xT25DMWJVZDZGZ29uRVNTZzY5?=
 =?utf-8?B?R0FrVE5qSklWaGFiQVd5RCtVZ1ZtUzZ3ZmlacHNGanc4U2pyOWZTQ3U4NnRC?=
 =?utf-8?B?UWVuZWdETFNmbTRDQVJjZnVkSThPRHlwaTlrT1VSZWlJSUx5V2prNlJTQzc0?=
 =?utf-8?B?cGkyaWZlZ0ZsTkJTbXVpMkwwSkZDZzY5QTE3T2I0Qm1EMmljVEJVR2pTU0Rv?=
 =?utf-8?B?aUc2NUd5YUhMZzdwZGxiT0MwMkFuTG4wdGc2dHI1M0hublZQSXZtbDc4SEFa?=
 =?utf-8?B?cFVMZHFvclRKdFdlMTBoMGFWT2s5cjgveWlkVGJNRWZlUi9hQUR6aTlOd2xT?=
 =?utf-8?B?cnp1MFphbXdoRzE0ajRubysrRVhJUDdRWUUrSTVzWFZsQkdoMzFFNG5yZkgv?=
 =?utf-8?B?N2FHZWFBZzhKeDcyNGtUbmptVnYyU25YSHBuSmlXNHNQN24ySFVrTkVzdng4?=
 =?utf-8?B?Ynh3emFtWGlERWErVEJRQzhHdE5YQmROUk9KWnhDblROL0pSY2I4YmozRmt3?=
 =?utf-8?B?d255Mnl1UTNpVTY5VTZ0SmR5emo4WXJMUmtlcGFBZnZGRUpvQkR5cVZSOTRU?=
 =?utf-8?B?KzJWZDlDU2h1a2RUUGhVZW5KUTBmQVlZemwrMjdXYWJDZmZPTmJBNWZoM2Ft?=
 =?utf-8?B?Z0tYbVJBSmtQV2U4Snp4TGtvRTl3QXBGSjlISHg3YUdvOFJmNEVTRUliVUJM?=
 =?utf-8?B?WSsrZmN3ZndPMzkxRndCVXpWQWRJenpxSndmZTJvNFBFWDJIN21KZXVadUdC?=
 =?utf-8?B?cWRQQnNhRHZqQjFPKzNqOEkvc0ZLaWs1Rmh5a1hMTlJPc2RrcjVpOEhsV0Mz?=
 =?utf-8?B?bzJocE1LdVBlaVNGM3RsTXBDMWh6WUxKczNEa1VFUkZsakJXekhEYjR1OUJI?=
 =?utf-8?B?RzNvRXhrWW1DNFpyWGdBeld2ZncyTW1VQkVnSUlLaHZ2czA2SHY4dytBcktr?=
 =?utf-8?B?YlZWQ0R3L0IvZ1RwRlphZ2lLbGNkanJ6VUpINGljWjNmRGY5b1lLSEttWHlW?=
 =?utf-8?B?ZkxOS2ZaOHEyNTgwRis1am5XVWpyNEM2WGtCK1R6NjNsN0NDVTRLS0kxRi9V?=
 =?utf-8?B?NzFqN3hVNzVkSXRIZ2JPYThteWpERm81MS9nMGNWZXhlL0ZqS3F2bm5WZE56?=
 =?utf-8?B?bmJoMUZXYzQ3RE9qbHdlN0J4b2VFdzZvM0lQWERwU0ZXSVRwc0RKNjRsYzl4?=
 =?utf-8?B?ZElxenkxNnlRbnlKcUVLMGcrV0FsZEM5ZCtKeGpGSG5KRUx0d0hEMzdKRjdp?=
 =?utf-8?B?RlBMQ2o4RTUyc0Q1ZzhtK3VUeXFXL05UWmNMM1hJckZwdGdxZ1hTVWprOGFP?=
 =?utf-8?B?WExDNGlSVSttU1ZQeG5lYmlDaFBPTDZUU0Zxa1JOMXFKOFJYbE9VbWg0dHJr?=
 =?utf-8?B?cXZHaGQrU0I1SDFtMUEwNDQzelZzd2Z2NUlFbHhIZi80c0x4YS9qTUxhZ0ZU?=
 =?utf-8?B?dzZvY2lIdlNnZklkakY4TDJ2dS80RUlsdEI0MDU5MjZ2Ym1HR3k3NGdkTmdm?=
 =?utf-8?B?Vzg1RXlqVjRLUWVzRUFiQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlowS25wUGpZMU5odUM5YXY4M1doTlYxNU53cmw1RGIwekUvbzZYcXVtZUZl?=
 =?utf-8?B?TjRaeDEvdkRmcFdoSWd1bkNwMStLTzZXVklTUGJrd1c0MVBsUTd3UTZEUE90?=
 =?utf-8?B?dTh1dHorQ3U5UFpYYWllR2x5STBWZzFNdXFyelhNd0dicFQzS2hPNVNGRmd4?=
 =?utf-8?B?dTZZMkltQXdYejlhNnFVNGZ1Q2RxVVczanZmN1prOTlyNTU2bUhKWGlBZkUr?=
 =?utf-8?B?MDJTUFBPMVF6WGUxSkY2NXRLYmE2NEo5cytNSlE0YzBwWVRJNmpyRC9KWS9X?=
 =?utf-8?B?MEw3NDRGTEhxeEloV2JLbUVjNmExazE4YVFZN29sbjhLVEtaL200RjNJMjBs?=
 =?utf-8?B?bE9CWjdvazVOTlJqNW1lSVplRU9SVmNsVUFnK3QzMExWanQ0ZXdaK2ZNcmtN?=
 =?utf-8?B?RjBha3g3cElPQ0VqZ0NnSjEySDFnYVcrSklIM1VQdk14ZkxFaHBtYkRrVzFC?=
 =?utf-8?B?a0Q5S2dNNGEySEtxcVhJOHdxSzUwOXIvcy9pUHVOcnZJeGRtR3d1WTNSV0RO?=
 =?utf-8?B?dmh6RVNKaFpVc25ueVZVQW5mRmMrQWlTSlZGMVpOYzhpSFVpQUN1ZHllZGl4?=
 =?utf-8?B?NnF0cnlqSlNXRnV2ZUZXZW9tK2Q2eUw4L200ejdnSGl1cjA2T0o1WUVEVkZ6?=
 =?utf-8?B?SFVhODE4K3liQkFjQzJsa0NmNXoveUZpaVBXSGlHSktWQ3p4VFA2bVBNb2pl?=
 =?utf-8?B?L0Q2UHlJeFlOWTgyRlUrZmc4V0ZBWjVhSG00S0FmSE9JZGtNb2hlNXBaK2Jh?=
 =?utf-8?B?K2c1TEhzemlSL2s3VmllVUlXa0FCMFFpOWhteXZicDF3L085UHJmZG80ZlA4?=
 =?utf-8?B?enU1T3FDY2xOQk92MU9nZ25XdDRWZW5MTzFMZjExSlhhN0JaNGluSWZGZUVp?=
 =?utf-8?B?QkFib0U0UHloNVJSUmx6dVhVWTlpQ25PNlJQZEdEUXF2U3htYVo1Ujc0ZnVJ?=
 =?utf-8?B?Y3NJQ2dqWllBc3p3WDByZGFoeWlva0RaZTJlaWk1YzhhN2l4eDQvam5mR3gy?=
 =?utf-8?B?dlVXUkg5blZJSHdoY1VHb0R4c3dmL1FNb0RqWW4yOENuR3doQm1ORFVNbnlF?=
 =?utf-8?B?Z0QxQXhZY0hJOXB6U3loZEFHOFkxdzFKcysyQkxGdHhNSnNaQmdpRnFETFIw?=
 =?utf-8?B?bVJEM01XZURDbFEzaHVhREtINnVKUWRVN3p0TnZkVVExaEZFc1VENjFKRkVw?=
 =?utf-8?B?UjljdDlmQUhaNjRzZ0ZSNVIrY0RRc0lNb21Oa2I0dEhMWlZxbG4vWXBzQ3Q0?=
 =?utf-8?B?eFVLUWgzUmkwa0xxVGE2L2NMaTBKalpZNlIxZVYwR3dIaE5hYjQybktlKzM5?=
 =?utf-8?B?cGxLNEpmRFgyazFpN1lWS0NQYkxNZXAyZEFDOFZtZTRsZ1JsaGNDRDByaWdT?=
 =?utf-8?B?dTZXYitmSkk5T3dhTTZGbWtGaVhWZERaMjQvNTQ4R2t6SENzbjQ2YXlWcmVj?=
 =?utf-8?B?MFpid0Vzb3NGNkszZkRGMjhsV21kblo3TW8rcUoxL3JBR1BJZVM5czEvZFlC?=
 =?utf-8?B?WUk0Z2NhTFlseHA4NXdiRE9GZzAzR0ZLZWR4QUdqa2kwUHQ3M3haeDdvVXp2?=
 =?utf-8?B?NDJVc1BCVVRlZnlaZllzaXdNZU9mZ3JaeGRnYW1ORzJ3Zlc4dUFnUG43Z0hy?=
 =?utf-8?B?NXNydDR5Y1Z3cEJ0ZlZGanpISXZoaVZSNVM3ZUdkeXZYUjVmU2pWcEF6dnFl?=
 =?utf-8?B?bW41R1pOU1FXUEZZeTBsY2syOUhrRFcvY3BXd3E0ODBpRjg5RlM4cmJxYTZE?=
 =?utf-8?B?YXFnQk5TMzZUVWhFY2NqTTByaVpmeDhRd0hDcmNUOHhmSHd1V2NpMWVpSndD?=
 =?utf-8?B?WTE0WmRBL05zZGhXbXZUcndQbEpkaUxMQ0NyN3BPaUVLT3dBbDJ5LzF3UXFn?=
 =?utf-8?B?QnBMVjRtUExlL2NZcHI4UVVJYmVZUVI5V2RvaHBGNHQyMFhlZ29KTi91Nms3?=
 =?utf-8?B?ZDJVcDJ0Tm1ST1NTVldxaDNBT1JVT3h6WU12cjJ1Q3JZWnVCdGNUSkhRNVl2?=
 =?utf-8?B?Q0F4OUNINlRCZlZmcnB5TU1LTnIyWWgrNUQ1QUhKcGIrQnRuclg3ZTZkUUFr?=
 =?utf-8?B?TnJkNEJvWjlhUXBDSzBWRnk2SVZyd3pWUFJzY0pqTkorVjRzdWcrSHpCeHBO?=
 =?utf-8?Q?+TNC6y+c2NCYnBiFLV4mAm91e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a4e1954-6353-47e8-5afc-08dcc2af251e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 13:34:27.8829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Snc1rxzPMeaSBPyZRMr0QKXEbDaGINi/hWzpUXSbqJ8SpIqkbD2u7EI4VYzY7/DFwYrY+1hnHW2UpS4ooJzJ/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8209
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

On 8/22/2024 01:14, Thomas Weißschuh wrote:
> On 2024-08-21 15:54:14+0000, Mario Limonciello wrote:
>> On 8/18/2024 01:56, Thomas Weißschuh wrote:
>>> Not all platforms provide correct PWM backlight capabilities through ATIF.
>>
>> I don't think correct is an accurate term here.  How about 'optimial'?
> 
> Looks typoed to me :-)

heh.

> 
> What about this?
> 
> Not all platforms provide the full range of PWM backlight capabilities
> supported by the hardware through ATIF.

Sounds great, thanks!
> 
> 
>>> Use the generic drm panel minimum backlight quirk infrastructure to
>>> override the capabilities where necessary.
>>>
>>> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
>>> Tested-by: Dustin L. Howett <dustin@howett.net>
>>
>> The code looks fine to me but please wait for an ack from someone on the AMD
>> display team.
>>
>> Also, I would like to see comments about the testing with panel power
>> savings enabled to avoid a conflict.
> 
> Ack.
> 
>>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/Kconfig                |  1 +
>>>    drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++++++
>>>    2 files changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
>>> index 0051fb1b437f..655c10aef2e3 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
>>> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
>>> @@ -23,6 +23,7 @@ config DRM_AMDGPU
>>>    	select DRM_BUDDY
>>>    	select DRM_SUBALLOC_HELPER
>>>    	select DRM_EXEC
>>> +	select DRM_PANEL_BACKLIGHT_QUIRKS
>>>    	# amdgpu depends on ACPI_VIDEO when ACPI is enabled, for select to work
>>>    	# ACPI_VIDEO's dependencies must also be selected.
>>>    	select INPUT if ACPI
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index 983a977632ff..056960ea335c 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -93,6 +93,7 @@
>>>    #include <drm/drm_fourcc.h>
>>>    #include <drm/drm_edid.h>
>>>    #include <drm/drm_eld.h>
>>> +#include <drm/drm_utils.h>
>>>    #include <drm/drm_vblank.h>
>>>    #include <drm/drm_audio_component.h>
>>>    #include <drm/drm_gem_atomic_helper.h>
>>> @@ -3333,6 +3334,8 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
>>>    	struct drm_connector *conn_base;
>>>    	struct amdgpu_device *adev;
>>>    	struct drm_luminance_range_info *luminance_range;
>>> +	const struct drm_edid *drm_edid;
>>> +	int min_input_signal_override;
>>>    	if (aconnector->bl_idx == -1 ||
>>>    	    aconnector->dc_link->connector_signal != SIGNAL_TYPE_EDP)
>>> @@ -3367,6 +3370,13 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
>>>    		caps->aux_min_input_signal = 0;
>>>    		caps->aux_max_input_signal = 512;
>>>    	}
>>> +
>>> +	drm_edid = drm_edid_alloc(aconnector->edid,
>>> +				  EDID_LENGTH * (aconnector->edid->extensions + 1));
>>> +	min_input_signal_override = drm_get_panel_min_brightness_quirk(drm_edid);
>>> +	drm_edid_free(drm_edid);
>>> +	if (min_input_signal_override >= 0)
>>> +		caps->min_input_signal = min_input_signal_override;
>>>    }
>>>    void amdgpu_dm_update_connector_after_detect(
>>>
>>

