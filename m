Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCnqAJyHlWnqSAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 10:34:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A84A7154BF6
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 10:34:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B571C10E096;
	Wed, 18 Feb 2026 09:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TPK4x4oI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012051.outbound.protection.outlook.com
 [40.93.195.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA8C89F35;
 Wed, 18 Feb 2026 09:34:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvzmDvyM6I3etIi1QZflddIElGfRFjO8n6CADlnrdk3vEUdy0zPi4yWOAP0sbwVbhQyNyxRcWPmJkX3lSzP52kPwHEVPbutVNN4HbCmJXCa6+lUq3+5y2WJfGGGq84ZqIgBkPkA1S5Hmj6zZxwp6nAEw7fjr4JDWvq3Hw1x6v+17l0QiLxCSv3HdkBnDipSj3Br4oO7yjBVqaD/RZjylhvZ9C5xMJU4TEuEqIcW2zWYvRRUeJOz+47EzeHMqZ/iQLf+djA6bNJwzeY6xsGM2f1t/4AyEj5pLvCi+t3o5hWGGVAZdoN2CC0Xf0Zr2r5ZbD1vIiF46CaCQwFqB6ZmvYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MFQJ9ToACDoGrGD5bzdBtnflMhxYdhFnuFEzBA759g=;
 b=WZAz2BJ8pCirQJRIWHr0sPVthW0IbugxSBpdnb4/M/MPGQ0SoZrYHBSM/EZIl7dqJxz/aTLFgrxLB8ubNch2N4Osbr+oCvqvoJk1VjifmgCZemfjFXv130M246coG3/wm+IRJ9BpQ7OKzGKa0UMY4ZPP1rfBxV9Aq2D47G+pwPuCIVrmiSQUk7C1b3eozdn8g4t2iCaQh0xGNL8Ptjk9AI4rPCHmH87elMbZGgT2LJiZQPWJnYLKxF3sK5x0vQcu8px32kf6UKvs/7SAbmyz1y4Z5x4sFedOA6kaAfDZmFfNO08UpTjd142CJ4fetyVvJp1AzQI8fX16gZcJlzl+jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MFQJ9ToACDoGrGD5bzdBtnflMhxYdhFnuFEzBA759g=;
 b=TPK4x4oIdMXkVgPUObFx7AS9+7LwqrPIRSFttfLaHajFwGwKQl52Hu8/BNOn2zMfMjRdjTAEcKbqehAcDFKdLgvdZ+EttxP3epahMvHkNYq6A0Tu7BhaAsn/fWC1JARirdmN1AvHCMnj0Bzk4cqUHjpFvtnyrhHJhpdtKxR6YMU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4392.namprd12.prod.outlook.com (2603:10b6:208:264::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 09:34:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9611.008; Wed, 18 Feb 2026
 09:34:12 +0000
Message-ID: <4cecb94f-be5d-4598-872e-83735588121e@amd.com>
Date: Wed, 18 Feb 2026 10:34:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/amd/display: add vendor specific reset
To: Hamza Mahfooz <someguy@effective-light.com>,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Mario Limonciello <mario.limonciello@amd.com>, Alex Hung
 <alex.hung@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Ivan Lipski <ivan.lipski@amd.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260212230905.688006-1-someguy@effective-light.com>
 <20260212230905.688006-2-someguy@effective-light.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260212230905.688006-2-someguy@effective-light.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4392:EE_
X-MS-Office365-Filtering-Correlation-Id: 6346a848-6796-43c1-fdc4-08de6ed0df74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3lPSmoyY2lpMEYzVDl3MGZONEExaVJza0hTOFNXcEZmcnRyMXd0dmUrS01x?=
 =?utf-8?B?cGEvMWlsakt3aVJISG1yV1E1MVUwQ0xiRUMxRnFOMUpnZ3hZbDdlQzJKM2N2?=
 =?utf-8?B?R1RBMHRDL05YdlRXTjRGejFralp0RFAxNmRLbXIvc1dmcFkwQjFGZVdTRGFT?=
 =?utf-8?B?eU1sTEwrMHRoNGxZdnQwb05vbTFTRW96cGlNRjJoak9qaHBKN28yL0hkWlVq?=
 =?utf-8?B?RHRXTzdGTXk0WitKL0tnVjc3U0RneHB1NWFyM29yME5ERjljVHdRZktBV1Zq?=
 =?utf-8?B?NmhSZk5LeG9jVWlBcDJSZWlnRTJPTlUrMGJvOW9qMmE1YlJzWnRtQlF1cE9z?=
 =?utf-8?B?K2JrUUhWdG9peDFXR0NwZ0c4YXJuTVFIQmwrRFVtY3BpeVVRZGVOVmhvbEhY?=
 =?utf-8?B?NlpmOFFFYmpCR056ZGdPZGpqaHNiMDE3NVVxdXJlSWZvcGNWMTlZdThJMzR6?=
 =?utf-8?B?Q1BjY3h5aU9LVGJSc2ZuVnBUeG9yVFFZZ1RJRHhkWnhsWExNMm9DUWtrYnpQ?=
 =?utf-8?B?ZGVBT1dpS1grZDVIbzMvQ3lkK0NOc2hnbnZsWDJmbTBtdU1od2VBNzFOeWs0?=
 =?utf-8?B?UDdieW13cHpMU2d1UzI3SHN3UXNUWWhPZUxMOXhwVmNMZ3Zwd0dSbHBnWlBV?=
 =?utf-8?B?WnFBSkJMWWJ4dGR6eiswRnRnUUJIZmE5UUZBOHREVExjeEJlZFQ2SHVqM3Vv?=
 =?utf-8?B?amx5RStDSnBRTFBEMit3ZGtYQW5yVkRteW9WTmNFek5Pc1FGUTIyRlRRZEFP?=
 =?utf-8?B?b3VHNmlrbG05ZlNhcVhlc1Zjd1R5UnU1USsybENYWE8rU3NaSGxxVWJnYUVO?=
 =?utf-8?B?OEwzUzZhV3FpdFZsUjRCeDZLQUxBcDN3bUlYaUhEamhDYzdtc2hkNG1BNzhI?=
 =?utf-8?B?eVh6UU1pSHZ3TzlabStPNXJQWXpNd3VTWndYbTZRbm1PazlWL2pwbG1DOTU4?=
 =?utf-8?B?NFI4SWJDQ040THp4bVl0QkVUT2NlZFdoL2o4STVqaDByWmIzRjlIbW5FcWZH?=
 =?utf-8?B?bXdJZVBhenh4ZnhWdkFFV3Ezd3Y2dkxURDZyU1hWRy9uUWdwU01SSE9ST2oz?=
 =?utf-8?B?SFAzUW1sMDhXSUJmeFM1UjNHU0xiSXFnMzUrWmhKNDBCWDA5V2VabUNFWDRp?=
 =?utf-8?B?RTdiM2FOYzl2VGhkSG1JWnI5ZnNXVm9VaUhWMWhURTMvaDFxMjJYU2pmd3Vy?=
 =?utf-8?B?Mjg3czF6WnArYi9QN0R4Tm5XK2RSQmxSUmRuczIvVlZ2NDAzOXQ4RmhhUzNo?=
 =?utf-8?B?azdtWjUrRVg5VWJEV0M4d1g2MEw3RFp1bWRKZ2VHN1l4a2lLM0dtbWZUd2pU?=
 =?utf-8?B?bzcwNGpzTGNGZFhudmtIeGw1QjlLRXBNTjdxZjhQdTVEYjFGbzMxOE9Paktv?=
 =?utf-8?B?TkYxR05EWW1RS1NsWjJqd1FLZFUrbjdkRnNqVFo3d0duWkVjZmVHRjJlZElo?=
 =?utf-8?B?eFdJWFgxL2ZFYTRwSW5oRjI5czR2WUxzV1pVZmJvZ1lvRWtVRnN6TnhKYUp1?=
 =?utf-8?B?bDIxSUt0dU1ocy9MME1Ma3FuRWkwNkVmSnQyemVPUWllV211aUNFVjV2U0kz?=
 =?utf-8?B?U09oakRpbkUyS2U0QnVsdVdlWTNFcGlIVEZTa1JFVDZZbUFBZzJqcTRMRkNT?=
 =?utf-8?B?VXFXRVA5RGlkeWRsR1dyTzd6U05kRWJGang1UUN4WXhhYkFSVVRwZy9Salhy?=
 =?utf-8?B?YW9ULzJqcjlDQ1AyQ0UyRG42aXRKdFl3WWZlQWszWCtRTHZ1VzFXUWNGUUE0?=
 =?utf-8?B?MjVpdm1tbzZGQ2V2MERCU2Znc01mZzhUL2NubXFRSVRTNENwZmxvNytwRzds?=
 =?utf-8?B?akdzT3JQTzIxRkxuZFRCMnF4RUh1QzhWbzVSQkhwMDhoVklvL3dxck9ick9v?=
 =?utf-8?B?NzF5Yk1UUmFmVDcwQVQ0bEdTSVhTa1libGRzMTYrdTdKYTVHUC9McXVmQm5O?=
 =?utf-8?B?ODBMcFZmS2cwc3lKMElSQ2NIMVFDdGtrVC9idE9XYVF1R0VzUXdTMUNmUG9J?=
 =?utf-8?B?dUpqekEraTBXLzRoTXR0ZjJPcXlBbWFRZWhXS2MzVDJ5cXdvNk9mUzVFSFhx?=
 =?utf-8?B?ZytVN0d1dkxtWVc4SzhDc0FubWlFbVNZZWVxQ0NpQ21WeDZYYkhIandMOXNC?=
 =?utf-8?Q?Ss3A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHIvOWVlQkFpV3FKTFdwN2EvRzNudU9uWWJRWU1wMXhBbEI1LzNCSEN4VXFO?=
 =?utf-8?B?dWgrS0JWbGp1WXdDOWVrbFlUd0ljTEV6TnBxR01NOHpwdmdLcENta1hPdUhK?=
 =?utf-8?B?ZlNTZWRBb2VkWnhiemM2a1ZvYTNNU3hKa21BRk1WeFlvMjRKcHZRRWgwU3Jw?=
 =?utf-8?B?NDNiVVZKMExXaTBUbkZESCtpaWJINU96YmV6N3VmZmZhVjJqeHRERDZET3Vx?=
 =?utf-8?B?OXVXZ0xTR2Z1UFBtMHAyUS9nQkVNRWM2Qk5MODcvdlJJSEtwT0UzcTBEMnVu?=
 =?utf-8?B?QnJPaFRIY09pV3NiQ2lFMWl4UG1adXgrQkR1TFRYdzFNYjNDTHZ2ZmgrUGhZ?=
 =?utf-8?B?TXdBREhCaktGcW5oNEZoK2ppYnNQVVlyNlpqSGc2cjlGY3lSdi9DK0RDZkxa?=
 =?utf-8?B?WFVHVGhib24zdTUzWTA3aTkweEN5TUF2RXFnLzNFTDlndVA5WUxta21RbHZh?=
 =?utf-8?B?MGtleVBGdElIb0lpWUt1NlkrT2NSOFZqeGtSTHFMWFo5WU92WUx4TjZ6Tmhk?=
 =?utf-8?B?dTA2UkY5ZVB4TmYraitGTXN0SDFHQkdNZ2cxTk5qeHlaYm1QVFdTeDgzS3RY?=
 =?utf-8?B?N2ptOTFkRjFhaWljc2dISUlMeXRscGZlejkvV1I1VUFUaW5VZStMMzZJYlI0?=
 =?utf-8?B?WDV2UndudjJHbmxudGNEZU1rRlkvcGluZDBhNlNYVmF2S1A0dEUrd0FsbUJ4?=
 =?utf-8?B?Z3BjTTAybXdBSG9UL1NkMERUb0U1cnI2YVhHK3ZZWE8zV2h4eTVZSE41bXBW?=
 =?utf-8?B?QnN4WG8rNlhJbjU3c0hyN2lvaCtHRVlyVG9CQStmNlczLytlTldEa0RvUVNM?=
 =?utf-8?B?WTJVUEFEdEFGTVZQejF6QUQxVnBiM1NGVDRtbkJZV2tuOUJRNTJadTJTOFln?=
 =?utf-8?B?SEJ0VXJrNlVVampSYWpjakxEd0ZTbTBqRHVlVlN1R2gzWGVwOEVvOXlqc3pv?=
 =?utf-8?B?ZDFURFM2SUhmS3B6MWIremJydnEzbDVxMXpZRis2cWNkM0phcWhBaFViSjJP?=
 =?utf-8?B?Vld3VHpvTER6U0lNRlpEUTVWaExqMlM4WnlybWR2WHExd0YwdWFONXRNaE9n?=
 =?utf-8?B?RmJvM2FrTEJxbG53cXZQSHR0cWRUZUpMVVdoT3I4OFhxS3hRdEFCK1JIdkE3?=
 =?utf-8?B?MUl2TTFoNUpqbm5GajVzWFRQeldEQmFkOHJvYlhIeW9DOHVmcDBNcUdHSHVh?=
 =?utf-8?B?Q1I1SHh2clR4YTJlUi8vcEJJalExUjhiTlNwUnZoa25yVTBvNUI4b2hJOWJn?=
 =?utf-8?B?SS9hUEVKc0F0SGZkMW43Zyt6QXlUM2l2V3pWSXpMV0p0Q1ZvU081S2Fxckd6?=
 =?utf-8?B?UVEwU2JLMFo4eGhycG5wN1dmZGM1dlIzdkM0Y2pIaFVEeUZ5aXhRMHZpTWs4?=
 =?utf-8?B?ZDVBZWNkeXlBV0s1RHZBWGxmd1lkNTdxZ2JMN0J4QkpsVmhYVmxGakRRdXNJ?=
 =?utf-8?B?RXErczV3VFNZemdBNk9vNlhiZzVmRFpLeWxnVWhERlVhUXNvSmRSUjNaMk9l?=
 =?utf-8?B?UWJSaFV3R0Q1dzZtZmxxOE5jeitFKy9HRDJoOGswSzZSczlMSUl6ZWRXNTd6?=
 =?utf-8?B?UjF6dUx6OEZYZ0NCa0R1UzNDYWZ3b1ZXc0JpZ3g1MUo1UWdYNTlSQjhocG9S?=
 =?utf-8?B?Q1MrVjdlUTNnc2E0NlZBeko2U2ZQdzc4Umg0Yng4WmpzV0FPY2M2NGJVb3o2?=
 =?utf-8?B?WlI1eTFHMmoxNFZFcTBuZEswR1hzV2k4MnVkUks0LzlMNlo3RkJ6ZkVXZWxZ?=
 =?utf-8?B?Z2dRYzR6OFJBQTZiNTR5ZW9XdUh6NDBCekNtMkwyZjd6MkhnNkcyaVhJWCtT?=
 =?utf-8?B?ZW5vWDlsUmIvWFhyY1Fvd3hRRmVMNG5KTVFOMFE5NjYzU1B6YjVzWnVYTEo5?=
 =?utf-8?B?NmtOaW9iRjBkWnhrcWZXL3lFYm91NTZvM1NjaTdoNmt6NFVsRzFudUhFd2FZ?=
 =?utf-8?B?NEJ1ZS9jMk52OWFtNWRmUjVWZnR1NEVOUHdwZFBNYTh0MTlDbStEYjZqT05x?=
 =?utf-8?B?Um93eGttZkxEMDNHN2hYaGwzVG1hbkdTL3QxckdxZTJOdTJvR0gxY1cvN3F6?=
 =?utf-8?B?dUtnR2t0OEJEWjdPY25NZ2RGQnV1aENmQ04wMVY0S1VUY00rMFB6RFNyRk1E?=
 =?utf-8?B?M1hyRmRrcWFhSzdURUlnd3Z5M29KdDk2SWw5L0FqYmJ1RCtUN1ZNSS9QSU1T?=
 =?utf-8?B?c0NVM0hhLzhPOHIzWmJheWs3aHhscVV4UWpGSmlqeXVDVnRHQllrbTNOS2h1?=
 =?utf-8?B?OUVDU2ZCdkoxNkVxTUdac0xmTW96TVdiR3JHQUp5dWl1UmpJMzdZM2pjWkkv?=
 =?utf-8?Q?qZvsffWXBlaVe52pAT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6346a848-6796-43c1-fdc4-08de6ed0df74
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 09:34:11.9135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sYz2sZaNgo1jXrvTms/wwtFNfyy/9Xw7K31izc5/xeFFeZAdeSoQQK/yEzIW7jz1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4392
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[mailbox.org,amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: A84A7154BF6
X-Rspamd-Action: no action

On 2/13/26 00:09, Hamza Mahfooz wrote:
> We now have a means to respond to page flip timeouts. So, hook up
> support by sending out a wedged event if
> drm_atomic_helper_wait_for_flip_done() fails.
> 
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
> ---
> v2: send a wedged event instead of attempting a GPU reset.
> v3: read return value of drm_atomic_helper_wait_for_flip_done().
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 7c51d8d7e73c..06d8353cb616 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -87,6 +87,7 @@
>  #include <drm/drm_atomic_uapi.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_blend.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_fixed.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_edid.h>
> @@ -11085,8 +11086,12 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>  	/* Signal HW programming completion */
>  	drm_atomic_helper_commit_hw_done(state);
>  
> -	if (wait_for_vblank)
> -		drm_atomic_helper_wait_for_flip_done(dev, state);
> +	if (wait_for_vblank) {
> +		if (drm_atomic_helper_wait_for_flip_done(dev, state))
> +			drm_dev_wedged_event(dev, DRM_WEDGE_RECOVERY_REBIND |
> +					     DRM_WEDGE_RECOVERY_BUS_RESET,
> +					     NULL);

Well that is the worst of all options since it will completely kill userspace.

We need to figure out what exactly is necessary to get the CRTC going again.

Regards,
Christian.

> +	}
>  
>  	drm_atomic_helper_cleanup_planes(dev, state);
>  

