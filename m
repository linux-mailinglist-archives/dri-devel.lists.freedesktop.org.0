Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCADA05524
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 09:19:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D0010E806;
	Wed,  8 Jan 2025 08:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jIqqswyU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D92710E800
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 08:19:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q98U19mztmSSVyWM/JwFT7XRhEM7N487mA7DWn4ADPpBzO8px7YNpTYGSGOJOiuDeyKkTmaedhgfj+F1tT28L6DsxsngqKOkNYFsQOKuYHRjiW0n2fLwBKbF62V49CurAZ2eFGgcDC3f9E18YzM4pRhFmhWy5GmhebDtKK8xqjViE1BUVscVV7XFUFSWe+EMqSJVtTG74vYBtxUADfWWhor5aVKb6VyjcdAG4701R9s+keBJqUHrb5bUTGIkCxV8dTxs1er4IOGP6bEugievT2crxeu8DKloDPcAPRe1fedhgW25pafRTMin5JCIOwH+RseA/qn9NcRcBJmiNTG8/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZR/fxC/Lcf8Bfc6DgobdHtEpwjZ1ZFRWPNPXTQMOJ1s=;
 b=bk5HZV1jefJ/fe9Val62iSQkXvMzCkKKoV+GcGg+W5i0g3Nc0gsY0h/iLjFeZgv7q8SVwsyvaFhHqYlGPA97eyjAeHkfb1yX3BHrvtR09fk+jKD1ke50svyRtF8pYwjguVxMTe9ZMofn8DXPeLWFJX71AbQggDG+DftNGI8fmucm/J0rQhnIZRUWmW/5GHQMaiCd9P1/sL83R2ZNjEtwA3HW2NWey2mJWYVfqs3gKoOhdwy6mk5LPoFtw2p9bE4F+s9cWxM1TJK6KRULDgmP9iTuwcxAvY3eGeAbhZmt5+6G53ODV8I+ANLyPdRU98VbEIzdYuS9P5rAkOeJahp+6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZR/fxC/Lcf8Bfc6DgobdHtEpwjZ1ZFRWPNPXTQMOJ1s=;
 b=jIqqswyUMOg5i/AAG7Pw6WIp2RN+KyTmkP+9+GICA3c6MNSKm4gb2TL37V/ddKwZS+etiXNFFh+zmBxX2WcBn7nCtOSiujexkMYGfI4kswl0cYf/QWqz7PHhB/AJIXnRawvjlyxRT8+anm5Ot16ER3ZzrKHyHQC3QRIbfnYS1XM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4371.namprd12.prod.outlook.com (2603:10b6:5:2a3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 08:19:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 08:19:12 +0000
Message-ID: <eb5f3198-7625-40f4-bc23-cac969664e85@amd.com>
Date: Wed, 8 Jan 2025 09:19:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Fix amdgpu crash upon suspend/resume
To: Philipp Reisner <philipp.reisner@linbit.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>
References: <20250107140240.325899-1-philipp.reisner@linbit.com>
 <942c02f2-6496-4406-a73b-941d096aadfb@amd.com>
 <CADGDV=U_7CdkdEiLX9kj9yHsXhwb5zP_eGXpwmrj20cmgzMAtA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADGDV=U_7CdkdEiLX9kj9yHsXhwb5zP_eGXpwmrj20cmgzMAtA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4371:EE_
X-MS-Office365-Filtering-Correlation-Id: ce55f653-afdd-4f9a-979a-08dd2fbd222b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkhySjB3OVdRZE5yUHd5YkZnYWVjQ2RRQlVtVnZwRWw5b29BTzVIU0srbVFq?=
 =?utf-8?B?eE9BSmN2N3o5VG93WlVXMmJBUHlsYmhhVEo4UERMcjQzbHdQYy9LekNMZXF5?=
 =?utf-8?B?OVlUTmpzODNRZHgyY0R5OG1FbGNzZjBKSjhsQ0tRaU5oYVdOZzdSbExUR0dS?=
 =?utf-8?B?M3ppZCt3THFFR2ZQMmNzOEJuZ0ZsS1NrZi92eDZPK0hwV0JhQXYzWjRzODJB?=
 =?utf-8?B?UEx3d1NrUnVwT3NtOS9uaWpWcjhoZ0xHSHFscC9lSG10SUFQYXdHL1lMMHBR?=
 =?utf-8?B?N2tKK3MzTW1Lc3FFM1YzM1IxM0paWjh0YnhKSmFxdHZHb1RpZldJZHV4N0xV?=
 =?utf-8?B?V2ZJSjdHMDcvZFN6dEs4djBKQmtJVGZwNDBNRzRPT0xUMEk5b21hbFlwL2Nn?=
 =?utf-8?B?ZkU0QTJZcDJaSU9IY2dXRlZtY2hjRE5PbHplT0k0VUNoS3RrU2hPc2NZK2hy?=
 =?utf-8?B?aWU4WjhZZ245SGVnSlBGYU1SV0R4dmRyTG4wek9WV1ZpYnVlSXdBaUVkTjFm?=
 =?utf-8?B?QTVZWGZGNmFYV1VDcjdkaTloL3NOd1YvV3ZzQWR2YVhlbWJhbjJ0RzBwVGV6?=
 =?utf-8?B?TkhrdytQSHVZZFBzS2h5eHdpcG1weVlpeHZLSUkzQXpnQ25GU3o4SkswbEEy?=
 =?utf-8?B?S0ZzMTNyeU8wUXRrNllia2J6dk5vbHdPdmpRSmZGOXVZMTFhZU1WVlozQXM1?=
 =?utf-8?B?NjAvREtLT1RNT0Fac2cxOUJJaTlmWERxeCtLc0xYVnp6UFBzVU10LzJHS2Vu?=
 =?utf-8?B?L25jalRvTWsrTXNSSU5kY1FVdlpPR1ZySU9MVElNdXZmVUpiYnNUbk9jYzR4?=
 =?utf-8?B?Q2VyOXFBL3BjaHEyb3JZeDlYaFpsUVZGQlNaamVRWkUrVW9CU3Y2L1JIK2ps?=
 =?utf-8?B?OWc4ZlhHRlhVRkpmN3R6K3ZjTjBZT1B3WFpsS0IvNkt2YmoyK3RJZzJSUVB3?=
 =?utf-8?B?RHdxcEthYmRROVIzajVKaGpsT1JQai9ySnJMc1BxRzRweWI2dUI4RHptNTNV?=
 =?utf-8?B?dlY4ZTl3U1picEZ6aEx3Vzl4dE1vd0kzcG9oY0E2cFBkWGRWanFoVGtaS01Y?=
 =?utf-8?B?OGdiQnc1djlxdExuKzFsWUZWRjh1dUFYUDhjcGZseU5ZRE5MSFRlY1A1VlVS?=
 =?utf-8?B?UXc3T0x4cDlMWlAzK2g1eDQwU1VkcHZmb0trS2xheEwrS0ZTd05xaXdydXhr?=
 =?utf-8?B?YjF3eHhSWlZTZ0pLTnd6a2I0RkFGTnl1bnNyT3hYTEszZUU4eE9pS0VkcjRM?=
 =?utf-8?B?ZWVtdmhDNnduL2QrbDNpVE1QM2lDQktBNjRDUUgzVURBcUlnRUR1TkQrNnRn?=
 =?utf-8?B?RGJEY0hrYVB3UXBBZGJib2cyZHpTV0tDWi9tdkwrWjVRaVgrOWxkZEJvYktu?=
 =?utf-8?B?SDF6ZElRc0ZSR2hZbndZT2U4MzNBK2JXaFVkYVowWUN4OUQyQlBtWDM1Vzhh?=
 =?utf-8?B?djIwN2lJSHNRR2h3ZFRDeWZ0M1RzWndXWFIxOGxWNjV5YWFvS3hkbmxoanM4?=
 =?utf-8?B?MDNTc1R1VjBlYTNwREphZjB1WnVVNkFnS0ZvODBCdm93RHAxRWl0QUF0QUVz?=
 =?utf-8?B?ajlJeE5GR1NheUZzemw4Y2VRTjkxOWpUY24vM3FWaWJSb3BKcEhSc3BqSnZG?=
 =?utf-8?B?NnpXZVJmMkp4dCtCckU1NGphZEdSdUNVYW44NjVOc1dYTlZmQmN0SUlaNUhl?=
 =?utf-8?B?Y1k5dkxkMVVORENkWjh2ZUdYYXo2b1hFVXF2dTd3bW1WOHNtZTJ6YkRqK1pF?=
 =?utf-8?B?VklNL1pxNGhwd3IzcVRqL1dsUy9lOFFHeGw5OG5iZ09RSFNJcDRXcnJLT3NN?=
 =?utf-8?B?bHF6VmVUakZGSXJ3UUpzVTlNeGMrREdnRjVoMzI5dUkrVkwrNy91NWl4VFpV?=
 =?utf-8?Q?ns7MFIIp7sR7t?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmFmOUp2Z3pUclN0ZSszdWdJaDh6Wmk1UHV3REM0ZGhJbWZjcDZXQllqYlYv?=
 =?utf-8?B?UXZQYllGSFFUckdnRVRsMFA2Y3prbllNbC9YWVpXRm1iVzUwY3VaZGh4R25s?=
 =?utf-8?B?cWJrYVhSZ2pId0dBakpHd1RQWWZJUE5VbTJ1aHc0MVFRRHA4bVZwRElUdGdY?=
 =?utf-8?B?WVFjWUF4Y0dFaDllTWNvK0hpMWtneTdJTUdLQjIzQ0o1ck5LbTJnMVhPSURB?=
 =?utf-8?B?R2hDRHRISS9xRVFDT3l5WDErYmtYUlBQNHlJYkhXUUZYVDE0cHdCNGkzNXV0?=
 =?utf-8?B?RkZvMVA5UjlNU2l4WUQrYkVNdFB4RG92Sk5oRWtpSG85bFZFQWZLTDZyQUVY?=
 =?utf-8?B?WkFwWVZmWDZ0SDBPZWJ3anhERnlrNjhwOGFIOW9mMk13K0d3RkcyRFlhNDMv?=
 =?utf-8?B?UW1CNWl5QlUweEZuSUdCN1RJVDJOWlJSODV2djhkV1YzYjBKbTFrYVJtcXVy?=
 =?utf-8?B?UFFoTTMzczcyeUc5bDhJVnd0b0Y5eGtoRjFXU0lTcVdaai94NWhudkwyc3hl?=
 =?utf-8?B?b3JRcys1UmtrN3ltWnhqVUdHMURoVk9odU9naTUvUUlqNUJxZzgvT2hyWGxS?=
 =?utf-8?B?UitjTitESjZGSHZXbUlwSE4yTjRJKzEwdVlibk02bkNMMkJlR1A5TWFrRDZn?=
 =?utf-8?B?OWJlOUU1YitQV2FrMDFVSS9CV3ltTGlHOTRNUStCNGRFMTJZQi9tZnRnQ1ps?=
 =?utf-8?B?MkkyaHhGRWtxeGQ5ckh4MWQ5RE9HUTZlWncxbmpEYUtDL2VuMmJnOEVUWm1E?=
 =?utf-8?B?eXJCTnNleUhYRGF2M0xuSlM0VUVRSktwU1dBdGlKRkI4RVpjTHhpZFFTbTRQ?=
 =?utf-8?B?UStLSy9rbWhiZ28xNGNPM3hLcW4rSDdzekpBNy85M25IbDdxdDdpNFZiM1Nx?=
 =?utf-8?B?bm9nN0FodW1WTHh6QjR3aEJyZE95VzhScWhPZ01tY2VDbm1STktyaGpuR21I?=
 =?utf-8?B?bHkydTY2aTZ3QWMyNUNvdUlOaVcvL3JoWU4wSnJxdjNscjlTcVB5c0hLRzdJ?=
 =?utf-8?B?QUVZR3RROFFZSDE5SGRwa0lkQStQcGtKRDl6RlQ2YmxPb00yVmhKa2Q1bzcv?=
 =?utf-8?B?dnc3U1hyc2ZsZVFISS9YOW5jSGZYU1YwZnM1QXRMaVFpTTY0NUptalB2Y0JJ?=
 =?utf-8?B?bWJ0YU9oQ2lZRnZ0cGpyYkI4SVR5RXBpckR4RWdVb2JsMExNWFRxdlZJck5r?=
 =?utf-8?B?ZWxSTUs5VnVuRjlDdWF4R01zMmtSd3pOQk1nczkzaFhLTEM5b1dnVVBtOWdS?=
 =?utf-8?B?WWEzYW5oc1F5dmZ2SVJPNVJQV3Y5ZEpwTUppSDVKU0gvQnNvVDNVZFRXM2tw?=
 =?utf-8?B?cllxeVY4ZmNOelFnM2lGQmdGKzYwTWhMbm12YkdkUHlNMWJxN0ozQm1VZ1Jn?=
 =?utf-8?B?R0JsV3loZUtLOUpickNyLzFBWTZGYVJRY0srNGdoUHBUR1hwSGdoWGZYK3Rt?=
 =?utf-8?B?LzlFRW9KcFVOUVJiYnljY016ZmRRcWNHejQzaDJHQkJjeGhwYkkvWXIvbkZU?=
 =?utf-8?B?NHlrU0lYSkFPK200T2JpQk1oOEVVTUdqVDRXay9nNTd6MXZmYTVvWGtYY29M?=
 =?utf-8?B?YVhQUVV2dEZHQWhRT3hEeENnc2lsbnV3N3p6cytacmlmMVdqc3BERXN4L2d1?=
 =?utf-8?B?bHBwa3BjOVE4SkNRR2Q4UzNJNUpQMmhRZnF3ZERUUVBZY0s5Q29iOTBBdnBG?=
 =?utf-8?B?Nm1WVkdacG5ZaEVyOHNDZlQ5dG9tWnZ4cXMzcUZDaUFKWUF6dENPTm5OSGF6?=
 =?utf-8?B?NE5JNWIyV2tsaDJORW5rQ1NuZEJXeVJMZmFTVWFkMVFjTzdmK0xJZzBCWmhn?=
 =?utf-8?B?TjVXUzdmT21TTjRNQ0dzbll1YmxHQ2E1UTJoQnIxRlhHSTRhOTZ1ZDV1K010?=
 =?utf-8?B?Ly9ub3JRd2pjRkdQWlArUHp5RDhwYUlGQzRSWkJYYWVSVXVqdkFyMkk1LzNi?=
 =?utf-8?B?N2IrWVBVdlJvQXdiR2pnY094U25seEsxT21QNWpOSG1uNlQ2b3p1TkljbmpM?=
 =?utf-8?B?dkY3aE5hY3J6THhOMUJndVRwVmtCazU2ZXhtMi9zeVhheTFLOEpZcUsyWjh2?=
 =?utf-8?B?ZThlblNzakhzQng2K2RHNHpGZzJjMjNkTWFkNStTYm41U0VJU3dRQzRXVHFU?=
 =?utf-8?Q?EKkFo8TAzX68/nes33bpzv4yx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce55f653-afdd-4f9a-979a-08dd2fbd222b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 08:19:12.7354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C7V+++luqCQGyuEGSgAuPK2yndjUK+4p92ngGQtUKlJwIoPMBnL6dWJieaoByq7+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4371
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

Am 07.01.25 um 16:21 schrieb Philipp Reisner:
> [...]
>>> The OOPS happens because the rq member of entity is NULL in
>>> drm_sched_job_arm() after the call to drm_sched_entity_select_rq().
>>>
>>> In drm_sched_entity_select_rq(), the code considers that
>>> drb_sched_pick_best() might return a NULL value. When NULL, it assigns
>>> NULL to entity->rq even if it had a non-NULL value before.
>>>
>>> drm_sched_job_arm() does not deal with entities having a rq of NULL.
>>>
>>> Fix this by leaving the entity on the engine it was instead of
>>> assigning a NULL to its run queue member.
>> Well that is clearly not the correct approach to fixing this. So clearly
>> a NAK from my side.
>>
>> The real question is why is amdgpu_cs_ioctl() called when all of
>> userspace should be frozen?
>>
>> Regards,
>> Christian.
>>
> Could the OOPS happen at resume time? Might it be that the kernel
> activates user-space
> before all the components of the GPU finished their wakeup?
>
> Maybe drm_sched_pick_best() returns NULL since no scheduler is ready yet?

Yeah that is exactly what I meant. It looks like either the suspend or 
the resume order is somehow messed up.

In other words either some application tries to submit GPU work while it 
should already been stopped, or it tries to submit GPU work before it is 
started.

> Apart from whether amdgpu_cs_ioctl() should run at this point, I still think the
> suggested change improves the code. drm_sched_pick_best() can return NULL.
> drm_sched_entity_select_rq() can handle the NULL (partially).
>
> drm_sched_job_arm() crashes on an entity that has rq set to NULL.

Which is actually not the worst outcome :)

With your patch applied we don't immediately crash any more in the 
submission path, but the whole system could then later deadlock because 
the core memory management waits for a GPU submission which never returns.

That is an even worse situation because you then can't pinpoint any more 
where that is coming from.

> The handling of NULL values is half-baked.
>
> In my opinion, you should define if drm_sched_pick_best() may put a NULL into
> rq. If your answer is yes, it might put a NULL there; then, there should be a
> BUG_ON(!entity->rq) after the invocation of drm_sched_entity_select_rq().
> If your answer is no, the BUG_ON() should be in drm_sched_pick_best().

Yeah good point.

We might not want a BUG_ON(), that is only justified when we prevent 
further damage (e.g. random data corruption or similar).

I suggest using a WARN(!shed, "Submission without activated sheduler!"). 
This way the system has at least a chance of survival should the 
scheduler become ready later on.

On the other hand the BUG_ON() or the NULL pointer deref should only 
kill the application thread which is submitting something before the 
driver is resumed. So that might help to pinpoint where the actually 
issue is.

Regards,
Christian.

>
> That helps guys with zero domain knowledge, like me, to figure out how
> this is all
> supposed to work.
>
> best regards,
>   Philipp

