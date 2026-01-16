Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A58D38785
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 21:28:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BA210E92A;
	Fri, 16 Jan 2026 20:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MCqRg5ov";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010020.outbound.protection.outlook.com [52.101.85.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FDB10E926;
 Fri, 16 Jan 2026 20:28:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOxSbHOl7X0/6JnAbytiqa4g0Qz1/iXC3sxCrKwXh4YDrogsBF+56sDhgajAvpS+JIvSWrBD3dbVbkESBaclufYwPStANzKxyRrqglTCwNUGDAg4rl68txGdf+hPijqT04UyHg1Zqddcl6wu8LhZpJQCHa7rfdyLanTTDqtk7YMQPo+10YyZDfX9r9ST9UuQ2ctDHV42MrAU6sRJQxspEsMbyiY1kruFcA9KNBxR0psB+ejkP+EQ/+H3alFX6nn8f/jPQYQOzgdyePbZ5duUM7gpzTyFSS40948yA0sH/+m9BgkD1i4lII9XlMZ/QJqKZVOfVOOev5GRXQs9TVhVNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVR2AoMqB0HkUoLxzzsVTu38jt4IA1bFppVlpuNiHuA=;
 b=v9SGPInHGLoho79b9mM+QQAshmp7pBMOWnvxWhjZmFeQLr5EqqUXj1FU/WAV9mA/C77ET+PE5ixHsGEkgd70FQq+yUzCff2430ADRWv7wUbpeofY7CwEKyknr6/I4NsMQPjrXLwRzG6W8HVxlSmZ9VeixZhaU+NV9z7gGXK0ye2DetQX1avt2+nsbU9UVuHxHz1VYYlUoaexU+9wss0iCcsLCwZg5T3+ER+wmZyKEX7Z4+8UaciNMFDHaQck1orJr/d16W+eIf58rIn/VHAfLfI7TZ9rVceqf4R+Z2+Tcs/wQnajRLknsmvZ5MVLYus4zw/JVRho5dOPtMYcffop7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVR2AoMqB0HkUoLxzzsVTu38jt4IA1bFppVlpuNiHuA=;
 b=MCqRg5ov6bvGx3GZ0xI6DLoRVmWESTXtGGhiLHHZGGwS+YAE7ivCTl5olRvX4INqBYZ+Wkw3SXqZd7/oJqcadLkp+uLoc/Tx1pPkavLNMzDcvFhn4HRepMR3gO93onllz7EvKrLHLolz4NrlzgCXyhCE3Sr+il1HSy3Xw7rWkV0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 by PH7PR12MB6882.namprd12.prod.outlook.com (2603:10b6:510:1b8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Fri, 16 Jan
 2026 20:28:05 +0000
Received: from BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe]) by BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe%4]) with mapi id 15.20.9499.005; Fri, 16 Jan 2026
 20:28:05 +0000
Message-ID: <a18c26d2-0664-4eb8-914b-52667fcc63f0@amd.com>
Date: Fri, 16 Jan 2026 15:27:59 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] drm/amd/display: extend delta clamping logic to
 CM3 LUT helper
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, simona@ffwll.ch,
 siqueira@igalia.com, sunpeng.li@amd.com
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20251208234741.293037-1-mwen@igalia.com>
 <20251208234741.293037-3-mwen@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20251208234741.293037-3-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0105.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::41) To BL1PR12MB5126.namprd12.prod.outlook.com
 (2603:10b6:208:312::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:EE_|PH7PR12MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d88b5c3-4a96-47dd-d398-08de553dc0d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3VwU2FLOHJtR1BKbkJQbHg1UzhnU0pwTHpOcmNRbk0wd1E5Z2o4VktpSlQx?=
 =?utf-8?B?cG1TWndJQ2NPcVBBSm82dmFqVUlHUTlTUjdUNjU5d3dPTU5pa0hJUXY0TDZp?=
 =?utf-8?B?K1g3QzBVQTBiZzEzakk0UlZFRGZiMnoyb1hUakM4TWk2UGJ6UlhTWHBZRHpH?=
 =?utf-8?B?cEcxdFVxejFXVkFnZXM3QThDSWswUTJHTzJGcDlBQStVcFljMnZOZzY5YW9N?=
 =?utf-8?B?U0FjU0xYMGpRbElFZCtvRDBjd25wOFpKZVRTTFpDSDJaWHRLdzVpd1BncXdk?=
 =?utf-8?B?dllGRFluU25JTVZ0MFAwbXhvKzdwaTdyZUVtTFhialVJU2t0aFdlaXZ5VU1B?=
 =?utf-8?B?U1Zhd01hZGR2ZEcxNE5yRE44L0hFRkIvY05abDZqeEg3UEk1NTJNV2RGcDhJ?=
 =?utf-8?B?eFl4dFRhUmJpYjFLcVV0THEreWc1dUNYSFdNUlEyekcvNmovUUNaRGNlZnp1?=
 =?utf-8?B?L21FazMwNUtWR1BwNUI4NjZubVM3MWxhVkhOZlVSQ24xR2FPNmZPbWdkRFN0?=
 =?utf-8?B?bVliSXAvc0k2ZHJXK2NyckVOQ0NpZVhhVWVDQWI0UWRBQ2pKb0szYW9xNk1F?=
 =?utf-8?B?UTBBTVVUckgzRGhDdUxmR2VFeGdVaWcwdExtdkYvdVV6U2ppODZtRGVPY1Mx?=
 =?utf-8?B?QktoVlVQaEhScGVSeW54TkNaNlFla2hLbU9NRFR1Qm05eWhPaHVHclltSVp1?=
 =?utf-8?B?RlhqME5EVmtDb2M5czQ2ZlJYQ05qdTY1YWYxeStHbE1mZ1lDUGdrMWxSa3Zo?=
 =?utf-8?B?WC92WWhYak1lUmxlT3k2akdxaGpVT01lS2N0ViswZVJhYXN0bnY5K3gwdlNV?=
 =?utf-8?B?S203d3ZzaHVMU1krT0ljaDZXS3UrN09rYittN3M4S0tDK08zVGZyYkFERXln?=
 =?utf-8?B?b2pBMy9tUU54VTBjU2MySjhlUHBtc0hqZGRWbUYwZURsUDlYK1hyVUduTVZk?=
 =?utf-8?B?L1JzYnJkSjliUWVqaEJsdFJBbmJ5THpTdkZid3M3QU5MMy9yTW0wSHZlRWtH?=
 =?utf-8?B?T0pUOVJNVVVFdkswMEpjUWtGVG9nTUlQaEVGaFoxMXM4NE0rWG96eVd6SzUv?=
 =?utf-8?B?V3I4bmNVT1kyYk15TXV5ZXg5VVJ5YWtvWXZQUFMraloyVDJEd0FsN3VBTnRN?=
 =?utf-8?B?WTJiZGgyaVhVODZpdDFFbDZOTnpIelBXUWRNRFRXbVFxbkRpdHRCeGY4ZGo1?=
 =?utf-8?B?OHBUZi91UlgvcVBXTWw0YUs5UzZ5NzNZbXlqdmtaN3FiUWt1TkZZcDNvSGVZ?=
 =?utf-8?B?bVZJL1BQdXo1QzNjQ2hDRVZWRTVUNC9kTkhVTFZPZzN2ckNueFlFQTBBZXFq?=
 =?utf-8?B?R0ZLeSt0TlZJQmRBOU94cU1FdFNGRHIzREJhbXlZRGkxNHNNMU43TFRGc1gy?=
 =?utf-8?B?SWp0Z3dmNTczUHRtMTR4amRKNFlXOHNjZ3pjck5kdUJyYkJydXZJY0Q4MXdN?=
 =?utf-8?B?SXlGVEdzZlBXZXk0eU91NVlndW5yekV5a1VjZUZIcXYwak9kV1dpYXVISGs0?=
 =?utf-8?B?eVJZQXBKSVU4LzFOMWNxN0NreXhxWWdCOGRyRGxZWUhoUHhzYzA0Vm0wZUZi?=
 =?utf-8?B?cElCL1RsTEhwK3Z5ZWZTS1VNaFN2WlR4OFNzTDVBUndiNmN4T2dXWW85U0ZL?=
 =?utf-8?B?dTl4Y0pOSWpLWlVpQWdXUXB4Y0JzS2QxdVRBM1MyZTkxdU1MUWtCSXl0aUJi?=
 =?utf-8?B?YWdub2VpTkNyRTBvcnhRTnY5U2Y0dHErSm9LK0oxeEM2UnlRRWlNamIvZ0I0?=
 =?utf-8?B?MzlscDFwTno3cWEyK1Y0Sk1vaFFNUWh2Q1JKUURkVWEralE0YzQ4WDJwejB1?=
 =?utf-8?B?V1B1dW9lR3hUVFROaHNXT2JNZkZXQk9GMXBQaWtVeXYzMy90ZkErZzkwSFZs?=
 =?utf-8?B?YVJlQW80azhOMlMvKzNER0ZvSnlmdkdrdkZYUUpab2NmcytpaStrcnNBRmJJ?=
 =?utf-8?B?bXg0OUwyUHhHOHIyNUU0ZjVZNDN3SjNXZUhWdHNEOEtpYm1sSWFqYjNMWFQ3?=
 =?utf-8?B?QzMzNTZZTWpEVjd2VzZrYjkxTml3TVh5S0hrKzdTZFpjZldMM21lM3pRZktN?=
 =?utf-8?B?bVB6V0xVMjlxMmF4NzllUHMya1BhczFpWVRhWC85aTBvR3MzWnkyT1d5VGF3?=
 =?utf-8?Q?ahAc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5126.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUxqeUY2SHVmYzRjWjZvRmpNUnFMbHBuNTRkL21QZFBUbWJFQXNPUFgrM0JO?=
 =?utf-8?B?VE9aM3N5RklxVUhNOGk1MzVQYXgxb2VsTkkvdVZXb1JYMWlvbHpJbTdPTnV5?=
 =?utf-8?B?azg1Z0dIWUI1QmhtZWVQZUNZRWdXYWpiQjIrTEwxVXNwNVJvQUhWc1BVVjBl?=
 =?utf-8?B?VThyK3dWZy9yTG1Qa1dPcW5VeHFEQkkxN0tGTDNBVGsvQllJbmxRc1BJT3oy?=
 =?utf-8?B?RnI2cFY2QkxmaGdxb282cHhWcC9YeGFMb0NSMENvbmJQSk80NmdZeHROZ0Ur?=
 =?utf-8?B?OVhodEsrL0lFelhJd1l0akFieUFkd3BvZWF2eFlXeW5ZZVA4emsxZ1Y1SEZO?=
 =?utf-8?B?WFdSQzdZV01sY0JkaUcvMGJDbGlYY1cxSzlBRGxkVisrVThXSGZ3ZG4xSXdj?=
 =?utf-8?B?UWFCT1NJTFFPSlJnZ05LSGVZQ3ZnV0F5V09IeWV0d0U0aStxenR1OWhzU0k1?=
 =?utf-8?B?VzgwWTlKQzhqZ1E3ZVozV0ZCck5WQndsb09PTVVYcXhJMDRaczFZaThZQjRC?=
 =?utf-8?B?WkRIczRGdm5ydUJLdmZUZzc0VVg4VVZaOC9rWnNDd2VacStla2tLdllvUjdC?=
 =?utf-8?B?aWxLT2dSZjZLd1RxS1dsSXYrRHdYUGlJektjQVk3dTd3YlpXdHUxRUREUHlx?=
 =?utf-8?B?REJyZ3lZbGR0WUNJN3k0UE1MWWRDaHhnS3lwVURDRWNiL3JNbFp1L1BuNmxm?=
 =?utf-8?B?OUNNTUZJeUVWQVc4WkVhOE9MK2hQZFZ5MmxZeGJKWVdoTEZ0WHozTE9hQTZ4?=
 =?utf-8?B?WlNvMElDVHJvcVFWSjRoNDVYTGxIWDdvUDdpejc4OUFKSmZVb2FLR0JjWkRB?=
 =?utf-8?B?Rmw3dHFmRzNNRUdPa2ZtZ0FTVlRXZitEZTY0WTd5OXFOYWxUei9SR0NSQVc4?=
 =?utf-8?B?VXYwRGlCNDY4UEtBeUxNaFdKY01CM2lPOTJhbnUzTGIzSTlBcjRiNHdQblYz?=
 =?utf-8?B?UklXc1kxL0h6U2pTU3RPTmtDNXlmWkdpZ0J4YWVJOVJGaS9BdkhBY0tRSUNm?=
 =?utf-8?B?cy9zMlRZV0NCcDhEK0x0Q2N1SXpYbVkzVzczRkg2cGlHTnJZNExBaDlWNmJQ?=
 =?utf-8?B?aGFpNWFCM2oyZVY0Sy96blhaZDBDRGlXNnZCVnZ2TEZ1eHpJOVdPYUt5MXh1?=
 =?utf-8?B?YldqdnRvR0VobUpYcmRqdlBVRm9rcWIxY29yUUFoMC9TTkNBRWRTalhDUGtJ?=
 =?utf-8?B?ck5sNFFhYmlyN2FNcU91NFNyQzNubnlaWHpYM3NRTk5ieUxKT1ZoK0o2ajdh?=
 =?utf-8?B?V1pwclBQVEtoWDdIcW4vdDJCRlBJbHhFdStJZ3lSaXQ5L2UvM212Si9XQzNo?=
 =?utf-8?B?UlBzK1ZRYldwUTRJK2hLdGZ0TTlMZDFmQlNOTHFhMUtVT2Q0RlB0OTMvWGJF?=
 =?utf-8?B?Qi9TOUdzZDR3akhKbElyakFIM0Z4QWxwc0NmMHlKNjJQMDBuZDZhTEFzdktv?=
 =?utf-8?B?TlhGamdLRlF1eUtxTUt6SzlIai9aT0tSZ3RrODVqQWlLTlh5aGlqSUt4aDFP?=
 =?utf-8?B?aWJJbjI3Ti9jU0V2L0pMZ3k4SFZzbnNWTW9MZ0tRdFY3dTJ2T3RaMGRWQjhs?=
 =?utf-8?B?Q0o1ako2T1BGTlVVcG1UazBobDJ0cXhmbjgrVGFha1pidnd4dTZhamxqdzRT?=
 =?utf-8?B?Z1pLdEJDVmJ1MUxSNkF6c29mV0psaEphcEJ3aFcwZjlUT1IwbHpPdFdvc094?=
 =?utf-8?B?ZzA5UTJCancvTnZmcmErTDJ4R0RVT21TUXhCZTJxczcrdTBtMS9jRkl6ZXFa?=
 =?utf-8?B?R3VqTm5tUHlKK2NFUVFIL2lHTUhHZFRGRk5xOEEzMVA4WlR2amRXcGloM0or?=
 =?utf-8?B?U2t0TnkzVGhNTFlNaWZhRHROMTdhV1JaUUJrOVFjWnZZTzdSaXpFeWJ6WnZR?=
 =?utf-8?B?ZkZ2NnVhTGZybnRWNWxNVVdpbHJUbEZMN05wbHVwYUE2L3dwdVYwVExDVVht?=
 =?utf-8?B?RWx5RklEKzRqTFNvc1cwWWJ3ekhhbDAzSUpURFZ5Q2t3TXJtcU9BUmZ1bmFx?=
 =?utf-8?B?c2hlYkpFRDVyUHhBMld3cUh3YkhudHpWOEkvbHhEN25yMGVtUnhzVm02R1pU?=
 =?utf-8?B?Z3BFWXBFcHdzVkpCS2U2SG11RW14a2NHdEQxeEl5bmt6NjRhMnhjSy9XWHNM?=
 =?utf-8?B?MUVVN2NTemN4VlU5aXgrcFB5SHFJdHI4T1RMNHNtK1VLeTJ6S1NxNkNEalFS?=
 =?utf-8?B?dFlPc1d5WTBPL3R4d0xCVHJuMkxKRnU4VzcrSm03TlhvN0kxLy9xZ2xzSVhI?=
 =?utf-8?B?NDRGbUtSY2xGVmk2NXJHL2cySUJuektLaDlrVjkvWkhuMUVsZnU0Ulp6bVhy?=
 =?utf-8?B?bmpYNzJPTVlhVnFQTkpoNVdtbFhuaVI3bmdLTEF1c0ZBQUJ6T3JyUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d88b5c3-4a96-47dd-d398-08de553dc0d7
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5126.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 20:28:05.2651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VRHTXlFaM3XVKC/o7TupnrxE/E+ZTL5YDTQS2YAmLhe+awjOBIFHOEu45LhDnDcm48YpuFhlQss7TU7Tgiti5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6882
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



On 2025-12-08 18:44, Melissa Wen wrote:
> Commit 27fc10d1095f ("drm/amd/display: Fix the delta clamping for shaper
> LUT") fixed banding when using plane shaper LUT in DCN10 CM helper.  The
> problem is also present in DCN30 CM helper, fix banding by extending the
> same bug delta clamping fix to CM3.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  .../amd/display/dc/dcn30/dcn30_cm_common.c    | 30 +++++++++++++++----
>  .../display/dc/dwb/dcn30/dcn30_cm_common.h    |  2 +-
>  .../amd/display/dc/hwss/dcn30/dcn30_hwseq.c   |  9 +++---
>  .../amd/display/dc/hwss/dcn32/dcn32_hwseq.c   | 17 ++++++-----
>  .../amd/display/dc/hwss/dcn401/dcn401_hwseq.c | 16 +++++-----
>  5 files changed, 49 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
> index ba20575be214..b1c2c8da1937 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
> @@ -105,9 +105,12 @@ void cm_helper_program_gamcor_xfer_func(
>  #define NUMBER_REGIONS     32
>  #define NUMBER_SW_SEGMENTS 16
>  
> -bool cm3_helper_translate_curve_to_hw_format(
> -				const struct dc_transfer_func *output_tf,
> -				struct pwl_params *lut_params, bool fixpoint)
> +#define DC_LOGGER \
> +		ctx->logger
> +
> +bool cm3_helper_translate_curve_to_hw_format(struct dc_context *ctx,
> +					     const struct dc_transfer_func *output_tf,
> +					     struct pwl_params *lut_params, bool fixpoint)
>  {
>  	struct curve_points3 *corner_points;
>  	struct pwl_result_data *rgb_resulted;
> @@ -248,6 +251,10 @@ bool cm3_helper_translate_curve_to_hw_format(
>  	if (fixpoint == true) {
>  		i = 1;
>  		while (i != hw_points + 2) {
> +			uint32_t red_clamp;
> +			uint32_t green_clamp;
> +			uint32_t blue_clamp;
> +
>  			if (i >= hw_points) {
>  				if (dc_fixpt_lt(rgb_plus_1->red, rgb->red))
>  					rgb_plus_1->red = dc_fixpt_add(rgb->red,
> @@ -260,9 +267,20 @@ bool cm3_helper_translate_curve_to_hw_format(
>  							rgb_minus_1->delta_blue);
>  			}
>  
> -			rgb->delta_red_reg   = dc_fixpt_clamp_u0d10(rgb->delta_red);
> -			rgb->delta_green_reg = dc_fixpt_clamp_u0d10(rgb->delta_green);
> -			rgb->delta_blue_reg  = dc_fixpt_clamp_u0d10(rgb->delta_blue);
> +			rgb->delta_red   = dc_fixpt_sub(rgb_plus_1->red,   rgb->red);
> +			rgb->delta_green = dc_fixpt_sub(rgb_plus_1->green, rgb->green);
> +			rgb->delta_blue  = dc_fixpt_sub(rgb_plus_1->blue,  rgb->blue);
> +
> +			red_clamp = dc_fixpt_clamp_u0d14(rgb->delta_red);
> +			green_clamp = dc_fixpt_clamp_u0d14(rgb->delta_green);
> +			blue_clamp = dc_fixpt_clamp_u0d14(rgb->delta_blue);
> +
> +			if (red_clamp >> 10 || green_clamp >> 10 || blue_clamp >> 10)
> +				DC_LOG_ERROR("Losing delta precision while programming shaper LUT.");
> +
> +			rgb->delta_red_reg   = red_clamp & 0x3ff;
> +			rgb->delta_green_reg = green_clamp & 0x3ff;
> +			rgb->delta_blue_reg  = blue_clamp & 0x3ff;
>  			rgb->red_reg         = dc_fixpt_clamp_u0d14(rgb->red);
>  			rgb->green_reg       = dc_fixpt_clamp_u0d14(rgb->green);
>  			rgb->blue_reg        = dc_fixpt_clamp_u0d14(rgb->blue);
> diff --git a/drivers/gpu/drm/amd/display/dc/dwb/dcn30/dcn30_cm_common.h b/drivers/gpu/drm/amd/display/dc/dwb/dcn30/dcn30_cm_common.h
> index b86347c9b038..95f9318a54ef 100644
> --- a/drivers/gpu/drm/amd/display/dc/dwb/dcn30/dcn30_cm_common.h
> +++ b/drivers/gpu/drm/amd/display/dc/dwb/dcn30/dcn30_cm_common.h
> @@ -59,7 +59,7 @@ void cm_helper_program_gamcor_xfer_func(
>  	const struct pwl_params *params,
>  	const struct dcn3_xfer_func_reg *reg);
>  
> -bool cm3_helper_translate_curve_to_hw_format(
> +bool cm3_helper_translate_curve_to_hw_format(struct dc_context *ctx,
>  	const struct dc_transfer_func *output_tf,
>  	struct pwl_params *lut_params, bool fixpoint);
>  
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
> index 81bcadf5e57e..f2d4cd527874 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
> @@ -239,7 +239,7 @@ bool dcn30_set_blend_lut(
>  	if (plane_state->blend_tf.type == TF_TYPE_HWPWL)
>  		blend_lut = &plane_state->blend_tf.pwl;
>  	else if (plane_state->blend_tf.type == TF_TYPE_DISTRIBUTED_POINTS) {
> -		result = cm3_helper_translate_curve_to_hw_format(
> +		result = cm3_helper_translate_curve_to_hw_format(plane_state->ctx,
>  				&plane_state->blend_tf, &dpp_base->regamma_params, false);
>  		if (!result)
>  			return result;
> @@ -334,8 +334,9 @@ bool dcn30_set_input_transfer_func(struct dc *dc,
>  	if (plane_state->in_transfer_func.type == TF_TYPE_HWPWL)
>  		params = &plane_state->in_transfer_func.pwl;
>  	else if (plane_state->in_transfer_func.type == TF_TYPE_DISTRIBUTED_POINTS &&
> -		cm3_helper_translate_curve_to_hw_format(&plane_state->in_transfer_func,
> -				&dpp_base->degamma_params, false))
> +		cm3_helper_translate_curve_to_hw_format(plane_state->ctx,
> +							&plane_state->in_transfer_func,
> +							&dpp_base->degamma_params, false))
>  		params = &dpp_base->degamma_params;
>  
>  	result = dpp_base->funcs->dpp_program_gamcor_lut(dpp_base, params);
> @@ -406,7 +407,7 @@ bool dcn30_set_output_transfer_func(struct dc *dc,
>  				params = &stream->out_transfer_func.pwl;
>  			else if (pipe_ctx->stream->out_transfer_func.type ==
>  					TF_TYPE_DISTRIBUTED_POINTS &&
> -					cm3_helper_translate_curve_to_hw_format(
> +					cm3_helper_translate_curve_to_hw_format(stream->ctx,
>  					&stream->out_transfer_func,
>  					&mpc->blender_params, false))
>  				params = &mpc->blender_params;
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
> index b213a2ac827a..27abc08918bc 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
> @@ -486,8 +486,9 @@ bool dcn32_set_mcm_luts(
>  	if (plane_state->blend_tf.type == TF_TYPE_HWPWL)
>  		lut_params = &plane_state->blend_tf.pwl;
>  	else if (plane_state->blend_tf.type == TF_TYPE_DISTRIBUTED_POINTS) {
> -		result = cm3_helper_translate_curve_to_hw_format(&plane_state->blend_tf,
> -				&dpp_base->regamma_params, false);
> +		result = cm3_helper_translate_curve_to_hw_format(plane_state->ctx,
> +								 &plane_state->blend_tf,
> +								 &dpp_base->regamma_params, false);
>  		if (!result)
>  			return result;
>  
> @@ -502,8 +503,9 @@ bool dcn32_set_mcm_luts(
>  	else if (plane_state->in_shaper_func.type == TF_TYPE_DISTRIBUTED_POINTS) {
>  		// TODO: dpp_base replace
>  		ASSERT(false);
> -		cm3_helper_translate_curve_to_hw_format(&plane_state->in_shaper_func,
> -				&dpp_base->shaper_params, true);
> +		cm3_helper_translate_curve_to_hw_format(plane_state->ctx,
> +							&plane_state->in_shaper_func,
> +							&dpp_base->shaper_params, true);
>  		lut_params = &dpp_base->shaper_params;
>  	}
>  
> @@ -543,8 +545,9 @@ bool dcn32_set_input_transfer_func(struct dc *dc,
>  	if (plane_state->in_transfer_func.type == TF_TYPE_HWPWL)
>  		params = &plane_state->in_transfer_func.pwl;
>  	else if (plane_state->in_transfer_func.type == TF_TYPE_DISTRIBUTED_POINTS &&
> -		cm3_helper_translate_curve_to_hw_format(&plane_state->in_transfer_func,
> -				&dpp_base->degamma_params, false))
> +		cm3_helper_translate_curve_to_hw_format(plane_state->ctx,
> +							&plane_state->in_transfer_func,
> +							&dpp_base->degamma_params, false))
>  		params = &dpp_base->degamma_params;
>  
>  	dpp_base->funcs->dpp_program_gamcor_lut(dpp_base, params);
> @@ -575,7 +578,7 @@ bool dcn32_set_output_transfer_func(struct dc *dc,
>  				params = &stream->out_transfer_func.pwl;
>  			else if (pipe_ctx->stream->out_transfer_func.type ==
>  					TF_TYPE_DISTRIBUTED_POINTS &&
> -					cm3_helper_translate_curve_to_hw_format(
> +					cm3_helper_translate_curve_to_hw_format(stream->ctx,
>  					&stream->out_transfer_func,
>  					&mpc->blender_params, false))
>  				params = &mpc->blender_params;
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
> index 2fbc22afb89c..5eda7648d0d2 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
> @@ -430,7 +430,7 @@ void dcn401_populate_mcm_luts(struct dc *dc,
>  		if (mcm_luts.lut1d_func->type == TF_TYPE_HWPWL)
>  			m_lut_params.pwl = &mcm_luts.lut1d_func->pwl;
>  		else if (mcm_luts.lut1d_func->type == TF_TYPE_DISTRIBUTED_POINTS) {
> -			rval = cm3_helper_translate_curve_to_hw_format(
> +			rval = cm3_helper_translate_curve_to_hw_format(mpc->ctx,
>  					mcm_luts.lut1d_func,
>  					&dpp_base->regamma_params, false);
>  			m_lut_params.pwl = rval ? &dpp_base->regamma_params : NULL;
> @@ -450,7 +450,7 @@ void dcn401_populate_mcm_luts(struct dc *dc,
>  			m_lut_params.pwl = &mcm_luts.shaper->pwl;
>  		else if (mcm_luts.shaper->type == TF_TYPE_DISTRIBUTED_POINTS) {
>  			ASSERT(false);
> -			rval = cm3_helper_translate_curve_to_hw_format(
> +			rval = cm3_helper_translate_curve_to_hw_format(mpc->ctx,
>  					mcm_luts.shaper,
>  					&dpp_base->regamma_params, true);
>  			m_lut_params.pwl = rval ? &dpp_base->regamma_params : NULL;
> @@ -627,8 +627,9 @@ bool dcn401_set_mcm_luts(struct pipe_ctx *pipe_ctx,
>  	if (plane_state->blend_tf.type == TF_TYPE_HWPWL)
>  		lut_params = &plane_state->blend_tf.pwl;
>  	else if (plane_state->blend_tf.type == TF_TYPE_DISTRIBUTED_POINTS) {
> -		rval = cm3_helper_translate_curve_to_hw_format(&plane_state->blend_tf,
> -				&dpp_base->regamma_params, false);
> +		rval = cm3_helper_translate_curve_to_hw_format(plane_state->ctx,
> +							       &plane_state->blend_tf,
> +							       &dpp_base->regamma_params, false);
>  		lut_params = rval ? &dpp_base->regamma_params : NULL;
>  	}
>  	result = mpc->funcs->program_1dlut(mpc, lut_params, mpcc_id);
> @@ -639,8 +640,9 @@ bool dcn401_set_mcm_luts(struct pipe_ctx *pipe_ctx,
>  		lut_params = &plane_state->in_shaper_func.pwl;
>  	else if (plane_state->in_shaper_func.type == TF_TYPE_DISTRIBUTED_POINTS) {
>  		// TODO: dpp_base replace
> -		rval = cm3_helper_translate_curve_to_hw_format(&plane_state->in_shaper_func,
> -				&dpp_base->shaper_params, true);
> +		rval = cm3_helper_translate_curve_to_hw_format(plane_state->ctx,
> +							       &plane_state->in_shaper_func,
> +							       &dpp_base->shaper_params, true);
>  		lut_params = rval ? &dpp_base->shaper_params : NULL;
>  	}
>  	result &= mpc->funcs->program_shaper(mpc, lut_params, mpcc_id);
> @@ -674,7 +676,7 @@ bool dcn401_set_output_transfer_func(struct dc *dc,
>  				params = &stream->out_transfer_func.pwl;
>  			else if (pipe_ctx->stream->out_transfer_func.type ==
>  					TF_TYPE_DISTRIBUTED_POINTS &&
> -					cm3_helper_translate_curve_to_hw_format(
> +					cm3_helper_translate_curve_to_hw_format(stream->ctx,
>  					&stream->out_transfer_func,
>  					&mpc->blender_params, false))
>  				params = &mpc->blender_params;

