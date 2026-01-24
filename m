Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Im6Mw0TdWkAAgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 19:44:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AE17E861
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 19:44:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1624010E25F;
	Sat, 24 Jan 2026 18:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Hp+zoq3C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012045.outbound.protection.outlook.com [52.101.43.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D5510E25F;
 Sat, 24 Jan 2026 18:44:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MneGAMLzq17bgfptPaeN7lCNHX8FakPWl6yA9imAv+Ywtm41K/sDVmDwka/6k1DJYAslTgFif/Rj2fNgNnWSi6ZOwxshJ5Iv6pAY19ceRgB2zPW/ZSXlQtSkMdf8S9ZwXP5xmys6Xi3ObYCo/iHtvnFcTTkUUZIxh9iMK9V/S+C81MO4gBsWPyCJqlMxzB0G1LqZzZsd5EqD7krMJpcRowXIlX8e3K3z7tyTuxaSuuszdBYOtAiO7y8Xb+Xz5uRbgUQl4jmkiRGjPpEvxNh8CTsRyH3L5v1zTBuK06pr1JZcWvyJFX+dZAzWmgUYkaiquMeFxK+xvBoai0s+oCqkEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkZ2QFdgsXFAxREZ+4sWi1n+ceAawmnZv/mRtfHNOHY=;
 b=TW8LrbLxHLN71yYgJWiofhmyXC+jDG6lSO9Ts4tDzqNStQS13UzBCmBZSKn5mxR68nAvp6vgL3GjiXpsvmGXXEXUP/rlkQuV7y/UEiKZaEBA2772gj+CpJpCG0IuhU6eLLN9ZbuP7FjuoQuK5D9V13dUoY89w5eECZXiDU65FIcvM1+7mp9M8zMBIkFAiMhp8aghdgFWjhtM+rA2fS1P4xPx7JAHsFHgUQwTaEGyYE6zsyPA/c1JyMckJARVu13DIQVVF+s1yQuOn6K669EHAe8B3QpZnTWB2XAYgtfRfeUoX6J3dj8RyB/r42AdKr1rzKXA3Ztu3tF2RKDdezijZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkZ2QFdgsXFAxREZ+4sWi1n+ceAawmnZv/mRtfHNOHY=;
 b=Hp+zoq3C0pA70KhrbPcfkMho4pokhg5XMcJNi1wAnUESlSVCTRy5/k9L/1m0HCNKIZKFfGZDoNlN075uaFReot0fR5pE3mJ2B1thXP3Z5b5bG9DQFYvooLPt62jQw+qaZz+Zkg4zYGq087P/jU/Ywy7btv7HG6rnU91ojmuNJVk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BL1PR12MB5828.namprd12.prod.outlook.com (2603:10b6:208:397::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Sat, 24 Jan
 2026 18:43:06 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 18:43:06 +0000
Message-ID: <d327fc1a-0db4-4fcc-aed6-ded53fa28b62@amd.com>
Date: Sat, 24 Jan 2026 12:43:02 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
To: Hamza Mahfooz <someguy@effective-light.com>
Cc: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 dri-devel@lists.freedesktop.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sunil Khatri <sunil.khatri@amd.com>, Ce Sun <cesun102@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Alex Hung <alex.hung@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <2de6d428-b997-4ba8-8766-a211e5612e72@amd.com>
 <2349754.vFx2qVVIhK@timur-hyperion>
 <a8b972be-7265-492f-9855-cdec94a0e0dc@amd.com>
 <aXUQKSJGkz7nzHJ4@hal-station.localdomain>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <aXUQKSJGkz7nzHJ4@hal-station.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0105.namprd11.prod.outlook.com
 (2603:10b6:806:d1::20) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BL1PR12MB5828:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bdd401a-ece4-4004-3370-08de5b7869b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGJDR1gwVnpQclBCT1k2LzlLUTRVVEVuM2twOUlhUTIxcWgwQThTV0s5d1p3?=
 =?utf-8?B?VEpySjJ0cGI5eVhkcHBBTG9FWEZEczA0NTREWGdNNW1sbE9VMVJzK2pIb3p1?=
 =?utf-8?B?VDFHSWFqWnd3OFRnSVlVRW9YTjkwQVBBZitVNW5hTS9HTVpxeGJ1Y3JOWEdZ?=
 =?utf-8?B?N1dpSEoyc1pqNGpTUU5XWHhaQW95RTg0UzJvTEdzQVFPTmU3NlhFc1RQcTA2?=
 =?utf-8?B?ZUtpOElVWm5IcVltZUZqbFFsUHVYdkxOZFlIRms0MmNaVDNKWXhLQm10NjZy?=
 =?utf-8?B?MkpRUmZUMm9oUjR0STNrT3JzU09GRmpPRW5YRW5TanU2NHgzT0l3eVhlSjh0?=
 =?utf-8?B?d3VQc3RLQmdHVXBQK2hUODkyUDM0eUhjRm1kdTI0c3MyWEJnOCt4bUVZelJn?=
 =?utf-8?B?d0J4QndXNkk4MG4vUlpoVzJmMlNxK2tiQWIyQzRWaGtITVluVDhid0tzQVhM?=
 =?utf-8?B?VmN4UWFqMGNlZmdVd3NPWk5vV1RTSkdzam85R3pFWlljM0c4YXJ3MUMyYjlC?=
 =?utf-8?B?Mlh6VDZydzRyR2dHY1QrbUUxMUNCSlZVMGdrY0J2d09YM3lyYnZIQlh1VUla?=
 =?utf-8?B?N3h3ZGg3aXNyQk5xaUZGRnI2NkRoK0ZrZ1dGR1FyZVh3d0pRMTQ4OW41VWQ1?=
 =?utf-8?B?VVRTMlpCVWpUUjJnZ2J0d2pSeWxZZWJQRkJYc2I0eFQ4QU84QXBxQ2NlVmZX?=
 =?utf-8?B?S29UOEprdVNKT3ZJbDluMGtjbmdCcTh3OTAzKzR3bkRoQTVkd0dPak9xOVRX?=
 =?utf-8?B?aWUvU2hzYWFKeUhDMjVwUGJkcGdLam55SjAzVjNzNWN1ZGdJcU82N29CSkhX?=
 =?utf-8?B?cDMzc0E4Wmp6YmdsRlRXUXhyZllHN0FxNlh3R3VlVWlPNGlRbVVPS0MvSC90?=
 =?utf-8?B?OXpqV1l3ZXlLRC9RV2JaRmtLWmlrTWZtd2x5R0hTM3JqUlJ2d0w4dFVURWJB?=
 =?utf-8?B?bWhkc1ZSM2d2b2laQVo4eXMxTmFSNWZXTlIreHh0Q3A5RFZ5ZDBQeEZvUlFs?=
 =?utf-8?B?VTkvRDV0d0ZUeTE4Vkc0bWVPZlV2dUdxV2NCOXNYVEpjaUFZdENYeEJ6Wlpj?=
 =?utf-8?B?d1BhbHBMaEJJWGVVQ3g5MkV2b1g1N1I3UTF4U1NiQjBjT1JmZnlibDhoSmdF?=
 =?utf-8?B?amFNd0dXNGZKNTZkNFVzcGsyZmlwRzNYOWl6aFVLK21vc1FLd3o1UGkrbGFq?=
 =?utf-8?B?MXJ2V2RGczQrbi9XUTZqaHZCTEczR2tPdDFVY1RTYkNUUFovbnRPYlNoOTNG?=
 =?utf-8?B?NjY0RURPcnJwNlpTandYekdnT3c3cUV2cXQzanZtc2FrKzN4dnU4THBpeFhU?=
 =?utf-8?B?aGRKVGdCRXFQZW1vSzRVRGxacWFySHh4ZitjY044ODE2Y0lTUDhkL1JpUGov?=
 =?utf-8?B?bEFkdDcybDVvc2VmQ0xvSUx3OWt2amNPNlRLOUZpRzJ2Q3ZzWFFmaWczbWRw?=
 =?utf-8?B?cmFpYlVWbms1VUZ3THNQYU1URjVHSnFMd1N4WHhjaGlVZldISTRDZWJPblYr?=
 =?utf-8?B?YnpEWlNTMktja2plSEN6RmMvVVFCVzcxU2FhQTNONmtGdDBLTTh5VXpTV2c4?=
 =?utf-8?B?TTIvTC9NM0ZKWWk4U2RxWmovQnl1a2NocXJEdExkWWNNQS92akRCcEY5Y2lG?=
 =?utf-8?B?MEdlS1RQeHNzNDFobUVIOGQ1dFVEQ1gwZDBnRzQyREs4cTBtRWdaQzZJK0tr?=
 =?utf-8?B?ZlFGU1hHK0EyOEZGWlMvelM2emZvVjN6RjFQbTdMZ21pcTgwOWRkSXJyTU9U?=
 =?utf-8?B?WFpaMHdIcll1bkRwK25ZMUdWTFFVckxvWjNvMTZtUkQxdTJkWU8yMFN4Q2lQ?=
 =?utf-8?B?aWxITDBDNndpRTVyUTRRWlFjTW1TN0JKQ2hNQWMyMWIweWg5TmZsc3krK3Zz?=
 =?utf-8?B?VkViV005VmdLS1h5ejQ2NGdVeUVnNENPdzJhSmNOeWFUaGpIVzVaVTZuNExV?=
 =?utf-8?B?YjZtUExyMk0zbmtYT3JlcTk0TmFqbjRVMkxzN2hRQUpxcVFlQTlIYmVvTnhT?=
 =?utf-8?B?ZVpCRmxmS2hVMHBRR2dQUVNJVU5vZHZmbTJ0eDJHMDE0NytXSERjdmI0V2ov?=
 =?utf-8?B?b24zUjB4VHVjUExuOHljbEhDcVovU2ZBRnZnWHI2YVRtZWZmTWFaV3JzM0x6?=
 =?utf-8?Q?++O4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUdDYmNXVTdvY0tWcHZFS3ZET2pNWUJOOFRKNzlOWmhKanRIbFJhNWgwT0g4?=
 =?utf-8?B?d0pLR2JxUHVrazZGemlnSlRZRkxRUEN0T3IyK2xLdW52UE5tZFdGYjhXRXY0?=
 =?utf-8?B?cmRzYmZEL2JaZHZUN2hYaDBTUFl6SkhYUENHRHVNK2VYWjJSWURTNzZjZi9t?=
 =?utf-8?B?V29RYnpPVHlLejhnOVFYczVoL05EYTZXSjR1Y1BUTktVeTRTVjBiTHN2Z044?=
 =?utf-8?B?K3A3TGUxaHlaY3FmWmVMRU40a045UzYxQU11NmtDejdpYkh1VHdHRjRoMjBY?=
 =?utf-8?B?aTY4ZmJEbWxTU2MzZXcxYlBia1FOQkNrbUx2NnZiRVozL3VsTFFLNVVKN0ZB?=
 =?utf-8?B?MVF1bFpPWGpZVktJalUxc09HVzd5VkRsMUljNWh4a1VzL05ycjgxQlY5Z2hN?=
 =?utf-8?B?dmhMR2sxeCthWE1IMnM4MTNEbElvTzZNZnlPK0lBVzBzTVJna3JsV1F0OTQ2?=
 =?utf-8?B?Z1ViUXNsb1FRWm9idDlyNnVIcmxlTEJuQ2o0QXlaQmU2bHN6YzhhUkhJbW1u?=
 =?utf-8?B?b0dMYWR4dmZwN0k0K01OdHVKQWl1eXdQWmZhTUJsNjNtWUc5Q1BkOU9aQWVJ?=
 =?utf-8?B?L0hmakYyMEJUTi9nUWVDMHZSSXZWS1dUd1lmQ0pZaHZUclRQNm9FZHBlRURs?=
 =?utf-8?B?dHYvLy90QmFFclNSYnRSVnJFaEN5VFNNWmhUeVJFM2pNbFBxd2VzTzFyanIw?=
 =?utf-8?B?OXNvbjNUbytBRG9ZaThmQUZwZW9ZOHV5cWc2M29OYXFmMVZHUkZDODNIVHNS?=
 =?utf-8?B?U2cvQm9rS09lMENoV0xlMjk3d0RkRWxWbTlVcUpaVVEwSm9KYnVWSjBQTWhq?=
 =?utf-8?B?MEhvbVFNOWhWLzZnaUZ2a1RiOVFxcSt0ek81N1EreGRnOFYwTGhtLzY1Tkov?=
 =?utf-8?B?aXNqbTdpcFJxcHpoTS9JQWhxZm1yQzJYd3RZeW5PSTdWcTdxVjR0Uk1idSsv?=
 =?utf-8?B?NzBpZi9BWmdoNllCUE1RVWVXSE5ibkp5Tm80a1pNMTdtcGVGbDZUMlFyeFhi?=
 =?utf-8?B?bXNrU2E2RVhDcmR5T0RCNVY2UmR5MkFISUZxRG81blg4ekdUZ3JEOWlMRVVm?=
 =?utf-8?B?TU40OExVSmRBcmxjY1A1RFU3a21CNXUzd1dzQVZzazN0Z29kZ25iVWwxcEdY?=
 =?utf-8?B?SnduRnVGV0Y1dGlRSUtmcnliK1l5QmZxQzdNcU5DYXpqZCtudXZpeWJJWXNO?=
 =?utf-8?B?d2ZVSVBWUnZ2NE9peU5MbVBEd0t2NjBYdEprLy8rMGVNTEFJalFBU0dlM05s?=
 =?utf-8?B?UTRMcmpiRmt0S0pJVVZyS0tpMTFwankyRktGUVhDMGhBYmRsL0pPK21XbWla?=
 =?utf-8?B?MS9zck5lcCt3OE9FdGlmSEdrWDRMK1RLTTRoaFFKazNyZkdIWEFZZFBKZm5T?=
 =?utf-8?B?dVJ1Q3JxQUlmUmdUNVpCOElHSGwzR0pTUW8vZ3h4ZVA4R0Y1UjM3Vi9PR2Ni?=
 =?utf-8?B?SUpKZFlKYkNWUStoVlBvTW42UWpPMWd6c1RSOGlxT2lyNWFvWUtnenRuYTRy?=
 =?utf-8?B?dU15TkU1ZDRzZnRXZktzZXFmU091QlN4RWF3UzRHTnFUazVrK2d4aFpra3JP?=
 =?utf-8?B?YjNWTnlSaXNmbUJaK043RDJkWUFpMlBza3k1akhDYjhCVTQrZm53R25WQjFH?=
 =?utf-8?B?WUlkWGNpZm5qbnRIREprMTcwZnErYWhBS21qQ0JmOGNNMUNDQ2hKcC92bHJT?=
 =?utf-8?B?Q1l4TU1EeFUyTTN3TVpYeEM0dVNBNU0zbXNZSHZyaktKRlBBN3lsSXdGY1Jn?=
 =?utf-8?B?TjRCc0JmUTRoNkdzS3YyaWVlQ2NlTHR6M1k2dlJIejdkVEhjQU5xM1hhTjFL?=
 =?utf-8?B?NXpVckQvaFZwTjdMN0NrMStIWjIxK0FVVGw4Z3p1c1N4SGdzcm1JMzk3NEdS?=
 =?utf-8?B?WTJyRG1UUEttYlVVR3FuQTg1RW12RTFpZTVOT3ZyNUx0S2RHV2lOTjZsVW80?=
 =?utf-8?B?WEZTZFlQMDhhWmZyc01GK0lkaWgzaW5tRlN4aCt2VlhUQTd0R3NuTXlqS2Vo?=
 =?utf-8?B?SFc3ejRXcW92R3RpK0dZcGd1NHlGUkVlQ29RZ2pDVkhaOXc1VGZGanVPZUxM?=
 =?utf-8?B?WGtLTmVYa0RpaUhzbENreEZPREdrSUFlMGJvM0pQNkE2T09ZSm44bVJyMnBU?=
 =?utf-8?B?dzdOMmxpcHJxakVlVG4weDVQZFNDTHQ0RXZuQkxVN2hBaTJoeEE4TWxES0t3?=
 =?utf-8?B?bngxZ0pZRG8yZ25tVzVVaTRJMWlvcmx3SlZJSld6Z0xDSGZyejREK2VKckND?=
 =?utf-8?B?bG5pcVlZNG11NmltR2ltQ0dQcU1NWXFVdGRuNTNRcCtLNm43bWtlQmlCNFBU?=
 =?utf-8?B?c3YwTVRSZk15SmFkenpFbVMxVDJlcWl0RGNmanFIamcwU0JBbjdhQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bdd401a-ece4-4004-3370-08de5b7869b7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 18:43:06.2849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RAJngUqbhLBYnz4fbq/K3XgAHLawv7VApGN44D+B/cvi8vCSILrDnlCqP7lzwQOEBlcloVv3e393xPcpDpMCMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5828
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,amd.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,redhat.com,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 80AE17E861
X-Rspamd-Action: no action



On 1/24/2026 12:32 PM, Hamza Mahfooz wrote:
> On Fri, Jan 23, 2026 at 04:30:12PM -0600, Mario Limonciello wrote:
>> Hamza - since you seem to have a "workload" that can run overnight and this
>> series recovers, can you try what Alex said and do a dc_suspend() and
>> dc_resume() for failure?
>>
>> Make sure you log a message so you can know it worked.
> 
> Sure, I'll try something along the lines of:

Generally speaking that looks good, but I'll leave a few comments.

> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> index 492457c86393..bc7abd00f5f4 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -579,11 +579,28 @@ amdgpu_dm_atomic_crtc_get_property(struct drm_crtc *crtc,
>   }
>   #endif
> 
> -static void amdgpu_dm_crtc_handle_timeout(struct drm_crtc *crtc)
> +static void amdgpu_dm_crtc_handle_timeout(struct drm_crtc *crtc,
> +					  struct drm_crtc_commit *commit)
>   {
>   	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
>   	struct amdgpu_reset_context reset_ctx;
> +	struct amdgpu_ip_block *ip_block;
> 
> +	ip_block = amdgpu_device_ip_get_ip_block(adev, AMD_IP_BLOCK_TYPE_DCE);
> +	if (!ip_block)
> +		goto full_reset;
> +
> +	ip_block->version->funcs->suspend(ip_block);
> +	ip_block->version->funcs->resume(ip_block);

Both of these can fail.  Especially considering the page flip timeout 
could be a DCN hang, I think you should check return code for both of 
them sequentially and jump to the full reset condition if either fails.

> +
> +	if (drm_crtc_commit_wait(commit)) {
> +		drm_err(crtc->dev, "suspend-resume failed!\n");
> +		goto full_reset;
> +	}
> +

At least to prove "this worked" you should log a message "right here" 
that the reset occurred and you recovered.  That "might not" be in the 
final version, but I think it's worth having for now.

> +	return;
> +
> +full_reset:
>   	if (amdgpu_device_should_recover_gpu(adev)) {
>   		memset(&reset_ctx, 0, sizeof(reset_ctx));
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 7175294ccb57..b38c4ee2fc95 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1961,7 +1961,7 @@ void drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
>   				crtc->base.id, crtc->name);
> 
>   			if (crtc->funcs->page_flip_timeout)
> -				crtc->funcs->page_flip_timeout(crtc);
> +				crtc->funcs->page_flip_timeout(crtc, commit);
>   		}
>   	}
> 
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 45dc5a76e915..47a34a05f6de 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -616,7 +616,8 @@ struct drm_crtc_funcs {
>   	 * and can be used by drivers to attempt to recover from a page flip
>   	 * timeout.
>   	 */
> -	void (*page_flip_timeout)(struct drm_crtc *crtc);
> +	void (*page_flip_timeout)(struct drm_crtc *crtc,
> +				  struct drm_crtc_commit *commit);
> 
>   	/**
>   	 * @set_property:

