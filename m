Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIIJO6GGc2krxAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 15:33:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FAE771BC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 15:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EDE010EAFF;
	Fri, 23 Jan 2026 14:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="G8Qk6Uso";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012063.outbound.protection.outlook.com [52.101.53.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634B410E0CC;
 Fri, 23 Jan 2026 14:33:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VHh9bu8GBCEh6zmU30z81O6zOPnBOCAFqcmljUPBsmeFtO6id3M4ojIPIlRzt3dLjsUh2kIejfBv8M6fiIw9uRgkrdQEsMl/sQNcc3mKWK5JZtL5Ld+Ykv054/Gg0Yw0RxtcFkrxJ4Z3OH2tKUgrWS5vHdcNXz4M1aYBmHi/vjvnpuiZ7TKAKUQ1yjbnI5LAQT07+/fmebNesVR2Ly17uxvdmG/Jq7TR7vxZgKXFWBzQr+HJuqBYyioPJMWWCGA92Xe76yAuGHC718CTQNJD66yxYluo8w6eVuK3wm4o28TlQMSJLBNvW1b1uOlv4lQQNz5uPqOpAedhN6bJv65low==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGhocS/Ay+Hlj1rrGQNwkqximQmP/wwa/StyNZXzbbY=;
 b=HHxqiC8cpXZ5rNuZz/gbhX7twxTVXv1wYZmvRliRwfEXnfMajze32gsr+TZ74URfHlAswB+uVhu0FRqa3lhz9OwglijS+hW3OVG30V4mN72Pjm39yupFBMYSMSk0atmelFc+oDJ6wwNfLcdQw/UAnY3Ge1ghxd21zMtWdPzAdcnTjq8VPhMqKmSVbocFOEt4r6vrrCc7v6eGGM34LyDnCrnz0coOvnpIGjhC7Yg724mFmZfhWW7CGyVTscWCNBk5boIuUzVcPkOWU7JVKkSFW0yNc56DSnxUgwAcwoJJ2Ybzm8IBsexDK9TqDQFKcdte0u3LKuLYYbKLbEwSKSIFSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGhocS/Ay+Hlj1rrGQNwkqximQmP/wwa/StyNZXzbbY=;
 b=G8Qk6Uso07VDLL8vVL4Svp662L1vVpdbkO3gZKWjbyg9HVtEy+VMx0Jy8cmVXEoapZTUQBrt9sJoeqV0lng/hLPH26gFDmyuwFEL6dWZ0JMc24bxJZs/Kj/6MVwU/hB0RH+Li55e28T5l+Umgo/lofRrfKd3xVfS+qsuJeq0XSA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYYPR12MB9016.namprd12.prod.outlook.com (2603:10b6:930:c4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 14:32:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Fri, 23 Jan 2026
 14:32:57 +0000
Message-ID: <3a6ae805-d761-4c5c-84ff-cd112018a092@amd.com>
Date: Fri, 23 Jan 2026 15:32:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] drm/amdgpu: add amdgpu_ttm_buffer_entity_fini
 func
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260122170218.3077-1-pierre-eric.pelloux-prayer@amd.com>
 <20260122170218.3077-4-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260122170218.3077-4-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0902.namprd03.prod.outlook.com
 (2603:10b6:408:107::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYYPR12MB9016:EE_
X-MS-Office365-Filtering-Correlation-Id: ab70d254-3438-411a-d77d-08de5a8c4d30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGxkZXAxcFZHZTFpaHlYWHRxR1hmWTZ3T0N2S3lmU1dkSDJzZS9nK1dZZU0r?=
 =?utf-8?B?c1lmbEh6VThuUXFZVFpWb09hK29nNCtkamp1TFV2VjFRYllwY0s0bHFFaElL?=
 =?utf-8?B?ZEZ2a253WW5meTAvc1ltNjlVK0lRNEg3cjQ0dEFBTW5IMWJqRHZ0Q2JucjNt?=
 =?utf-8?B?NnZrdHhxRkhjcmVWVko2V1NSQVJmMjYyeVJVOS96WDdJNlFZNFVmV3VidVB2?=
 =?utf-8?B?Yk96YURIMGt2cHlkcDJ6NUdsb0JQZzVwSnU0MStXWGRqMTB1ZGhhQUJMN2FZ?=
 =?utf-8?B?aGZZeStSTmM2cWQxUTlkM2xWTWVMV3Q1VElEYWFObWJsWXQ4UUxvNlF4YzZM?=
 =?utf-8?B?M2FpNkh1di84MzRpYVJzNWlCeHlzU2N4cFg2M05VVmdCczlTdERXWHAxMURz?=
 =?utf-8?B?SUk2N3pGc3d5ejdNRmxIZzFIK2NQSWcwS1lnMzFRUk1Qd1ZVc0hMUEp3QzJh?=
 =?utf-8?B?K2lGSVNvK0FRWWU0dmVGbm5YT0dJOGpmOTMyMzZvZU1Td1ZqY2I3Vm8xMStY?=
 =?utf-8?B?U3ZaRGpiUXFvUEFIRHRoQllta2lHU0dXd25LS2ZoVmFtcnloMnVyaDJZLzli?=
 =?utf-8?B?eHB3dGRrTHRLRFpwTWlFUzVpeFhFQzB5dkRYMnJlMm9pRm51NUs3OUZGSXBr?=
 =?utf-8?B?UW5LakhMNisvYU9EN1NnTm9zaDlCVVMycWhJcU1HNjJtSU41UHM1bVpNczh2?=
 =?utf-8?B?MFNLQVFySi94TnhLbXk1R0JBZ0J3ODdsRDJ1OXlzZmRFZGg1ajFyN3ZHbmg5?=
 =?utf-8?B?QmRSejJaeHpxMkxjeVZBYWdYUE9SSndmQTlTZDJVQnJyc3RqenVmbjVaYVQ5?=
 =?utf-8?B?RWIrYmhsc2xXRG43WXYvTnUrWlRuQUpBUDg5ZGhsOW5TN3o4SWhUZU16di96?=
 =?utf-8?B?U1l4d0F6UytMMVR6dDRuRUE1aTllSnV6dGhpM2RMS1VBaGZEaFIxcmI1Wm11?=
 =?utf-8?B?V0E4Sytvb01td0IySmFJWFp4WWFmZGFNdlBDZTFXa05zTENFMk5PUUNhSi9K?=
 =?utf-8?B?Q2U2aGQ2QVlkcldEYUhlQUxHdC9BdThqN1pFd1B6OEg2eXN3TGltMXRaNkFk?=
 =?utf-8?B?WDF1aDV6a0EwT0NHNnhHYVVoR2ZzbTRhRlVsOVcyVUlTbUQ5RkR2OWhQbGZP?=
 =?utf-8?B?Y1VRNHgzSy96SDRmcWZBeUs1aFQ1alhHV1B0cE15dEttb2trN1BwK3JzNm5J?=
 =?utf-8?B?cnVjMW03VGVObExreU55NkNsTzF4UitkVHdJbFBuMERVTFRUNllLYVNGNzcv?=
 =?utf-8?B?ZUV2V1BqL243KytSbEtLbVk3VkJ0Zk1wbTdoVmxpYnB3aVhEdUVaa2N1V0dX?=
 =?utf-8?B?Z3hxRUdMeEVmVEhJbmpKSG1EYVZjYkdCY2ppTUNORXhQa2pTV1VZUGhWcCt2?=
 =?utf-8?B?bkh4ZHFWVDdrWGtJSURhbVhLU0RyMXJxanRFUHRLUy8rQzRnQWlGWm91dllp?=
 =?utf-8?B?T1FocG9STDRtRk9XeW1IbUVaMHJ3UmVTd0FoR3RrVzR0SDF1S1JlT1o5dnlK?=
 =?utf-8?B?V0REUkFUR0UwSEtDK3VJby80MFljVDRxWWZDMzcwbndNMzlEbm1GRXd3bW4r?=
 =?utf-8?B?Sm50Mk1RR3dVSkNOYnduY0s0emg0NHBOc0NoRE0xNFlFbzdINTNidGdXdm9B?=
 =?utf-8?B?OWVaR2xZQ2E0UVRPdjY4YTgyLytZajlldzg5VStyWmFDMzVTOEE2RkZUNEZv?=
 =?utf-8?B?S1pxdEFkUW5FQWg4YjEzamZYdHhpVE5iaENGd21NVGYra2N2N09hZ253SCs2?=
 =?utf-8?B?NkNISXRSUUZkbjhQWjBkSXI3eFFaVC9FOXpWdG4xMmRwaVNUNWoyU3ptOHFy?=
 =?utf-8?B?THdBUGNIR2JLRjkxMlBrNGNHdmh3THhvaWdHNEp1WHF3d2lqdFViKzhqN2o2?=
 =?utf-8?B?UXhCaUMwM2R1VEtIdWp0T25zaTZQVlhoWEk0YWJTTFdXRkZGaTZWZzVtcjJv?=
 =?utf-8?B?SytZem0zSURXaUZrc25JU2hla05vWmVaaGJqUEh5aXdYRjVLTFg5VnFmcHpx?=
 =?utf-8?B?MkVERVU1eUVRdUZTdXRMSU8zTVRORFZ2aVdtejBXd296ZkRSQm5kc0tTSXgr?=
 =?utf-8?B?WlNmMWVBQ0NRM3o0bm5TNkkwbHcyZG9ZVTk0K2pwQVlNTm10MUJTa3g4NXZ3?=
 =?utf-8?Q?w0Ew=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2E4bGpmdWFwOXVEZFUzcjVuNzJGQURYZGpVS0I2SUFlbEdQZUlsd0U3cXZ2?=
 =?utf-8?B?czczT081ckc5cksvSjgrSitQeUE0OHpCemFnWDJyTmV6YkZ3UkFaTWo1R0R3?=
 =?utf-8?B?alhlRzk1RkxSNkJncDBiVUkxWUV2UU56c0U3cDRKT05PN0tmV1RyTEcwU3RI?=
 =?utf-8?B?Kzd4WVFrbUk3dVNKSi9jeWRMU2pCdmQ2NUVsazI2ZDByNFFyYXN6bW1HZTRq?=
 =?utf-8?B?MzBvSVpqbUNCT1BVT0FwNUNwajhwOXdPRDIwMGhsTjlNRFFCS0tQZGd0Qjl0?=
 =?utf-8?B?TTAvSUVDZUtab0daZ2d4YmovQnN0RjBheW9JT1BMM2VXQ0owM2pJa2FPR2lj?=
 =?utf-8?B?VVJaOFFxNGpnSnArdncvelRQbmJmZjRLNWpFcHplMXViQU9LSk4zNWRkM29p?=
 =?utf-8?B?UDRrTVNyb2FWWG8zK3luTG9ucjNsQUZNOHJZOU9RMWFGZVFpK3FYQTNCR3Fs?=
 =?utf-8?B?RmR1S25iQVZSSzZlSkdGS05JTkF6QUF4Z2xxbFpzZFR3amJpYSs0SFEvV2tH?=
 =?utf-8?B?bEdtRHZ2V3FpaS9HdFowck13Nk1QMGF5SkprWjVzUVB0Y2M2N01tVDFzRThV?=
 =?utf-8?B?dTQvemJoblZ4bW5IMXJ2RTUrYkpBZ1ZEMVlnaEMrQ1h6SEJYdGlpcnZHSTlB?=
 =?utf-8?B?NXNJZ0xZSTJaTnRvR1pnNjlCNlNnNnljUEJYL1Npc3BuUFhObWYvczdQNllU?=
 =?utf-8?B?UTY2K2tPNmJFNWcza3cyS2hBemRWZndqQ013Qjc0V3AxVms5K0FoY0M5STVr?=
 =?utf-8?B?VUlIVnhsRmphVEJGMmZXYlhuSTRRazJrejF6bXF6Tjgxd0RZLy9wc1VFWmsw?=
 =?utf-8?B?dFJkVG5OTFZla2tCTktJekRWVDR3OTU1TGRINEJsL2FVQ3dTZWVqM3R0c3hQ?=
 =?utf-8?B?Mk1yZmdlZWlObC81UnAzazN3K2RwenUyY0FqdDBZQ1JZN2pFcjNJNnJjT0xn?=
 =?utf-8?B?VGlLdG1SdEtxT2RVYTdyWFA5YnBEUXgrYS9iaXlSMjI2dWRQb0EvR3N0a0Fm?=
 =?utf-8?B?TXlYNmo5TFRzZjduMVp5dTNpWVJZTzBVY0dUVS9yZklOaWtJeFlRMVhGQk9V?=
 =?utf-8?B?MjBub1pyQnlkZnhJSWRIb1NPUDBuMFdyUTUwZFBKemxUM3c4c2tEdm51NVhM?=
 =?utf-8?B?NWdPQitlQjNMUnl4WFNpRjRoeTA5WVhkN3BsR3YvZDZCenVGOFdHaGJOQ09k?=
 =?utf-8?B?U2tBTjRPVlBFMVhmS1UvMWdoajFhR3VBTmRGV01xeGJZL0llOUFIb0VPdml6?=
 =?utf-8?B?aXVpV3g2Tlo2amxZcDVJU0VvcENGSWZVemNCSnVsMjY1ZHNxbEN1R3NJYmx6?=
 =?utf-8?B?cHIvS0o3ZlIzMVFGbjIwRFVJTW9sK21ZRDNvTWFTOGlKYWwwOXNJdW9oVlBC?=
 =?utf-8?B?SUxUOVF4TEtDZkhIdTNIMWJYQzBnb2RMU2hGSjJmaWUvZ0VvU3JKTnZ0MU10?=
 =?utf-8?B?SVc0azJEVE1HQUp0akhjQnQ1OHdEM0JvZHhIZHZ1R2NnbUNwSTIycVNNL0Q0?=
 =?utf-8?B?SDcrSzZRcXR0Q0s0d0ovcXF5WGs0WVJjNGFzbGw0eE5CQm1QeVR5RGh3Mm90?=
 =?utf-8?B?dUVYYUMvVC9GcDhESlJJMlhnVmpjakR5eGpwbGtOVXZPSCtoQmZTbFRBZi9G?=
 =?utf-8?B?aW5SSFhKNWxMMXhPeTRvaHQ4ZkVaMzhFZFZZRlVHV3pzMFlBK1dOOCtabWRr?=
 =?utf-8?B?UU9VQlRXMVUvR2ozOWpQMTZ6NXlHQi9UMVJzQlE5bzZ5ajI3R0pxVndXQ1JM?=
 =?utf-8?B?NWxmaVM1dXZ3YzlYLzZpa2tPZUh0K242T3VHTE84MjVBc1hBUS82WXFIWGts?=
 =?utf-8?B?YWwxb3hiQWZkV1FKcEdaYlV4eHBUVUZmVWhQejVWUDRMelFxOEtaNzJGVkY0?=
 =?utf-8?B?dlo3Q2F0VmZUellyMWtyQzU1WlNBa3d1QW9yU1RCZ2RqVzlkVytKcmFFQkJD?=
 =?utf-8?B?R01OTjZYMEJnMWpFNElta1hYNmRVeTB4bHRTejgyZEwwY0twZzY2UC9CVXFR?=
 =?utf-8?B?ZjM0WTN5c1VnREM5ekdLUmw3bFZja2VPOHgzcjdwQUVzMXE3bm1YMEU2bVJ2?=
 =?utf-8?B?REZIODM5YVZDNktLYjJwcFQyc0YyeTFiNFNLbW05SGYrY3ExL1lnODRSMEpv?=
 =?utf-8?B?dmdzQnFtWU9QZDBVK1hsSURCdVVVK2Ivb3NFOU5TTDhxZW92WDFhbUFSNW0z?=
 =?utf-8?B?RXh3cGJ2T2R1S3djWGdvMGNmN1d2ZmVFeUNYZ29FYm5qc0o0aFRBQndJMC9K?=
 =?utf-8?B?UnVwVW5YSnhWVzR0ZHUzSHpuVEhQMkZlckFrY1NQd2F6cU5oWlN5Y2E0ZUMx?=
 =?utf-8?Q?3nP2F+CyHVxM7uvSLY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab70d254-3438-411a-d77d-08de5a8c4d30
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 14:32:57.3725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cVnV3ttA4eiMnQgmM+cVM555/VuL0GcHDJZIg63vxtOT1NmMZIC9ynWvLOwaHFts
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB9016
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: A1FAE771BC
X-Rspamd-Action: no action

On 1/22/26 18:02, Pierre-Eric Pelloux-Prayer wrote:
> This allows to have init/fini functions to hold all the init and
> teardown code for amdgpu_ttm_buffer_entity.
> For now only drm_sched_entity init/destroy function calls are moved
> here, but as entities gain new members it will make code simpler.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 73 +++++++++++++------------
>  1 file changed, 38 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 5850a013e65e..8b38b5ed9a9c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2013,10 +2013,18 @@ static void amdgpu_ttm_free_mmio_remap_bo(struct amdgpu_device *adev)
>  }
>  
>  static int amdgpu_ttm_buffer_entity_init(struct amdgpu_ttm_buffer_entity *entity,
> +					 enum drm_sched_priority prio,
> +					 struct drm_gpu_scheduler **scheds,
> +					 int num_schedulers,
>  					 int starting_gart_window,
>  					 u32 num_gart_windows)
>  {
> -	int i;
> +	int i, r;
> +
> +	r = drm_sched_entity_init(&entity->base, prio, scheds, num_schedulers, NULL);
> +	if (r)
> +		return r;
> +
>  
>  	mutex_init(&entity->lock);
>  
> @@ -2033,6 +2041,11 @@ static int amdgpu_ttm_buffer_entity_init(struct amdgpu_ttm_buffer_entity *entity
>  	return starting_gart_window;
>  }
>  
> +static void amdgpu_ttm_buffer_entity_fini(struct amdgpu_ttm_buffer_entity *entity)
> +{
> +	drm_sched_entity_destroy(&entity->base);
> +}
> +
>  /*
>   * amdgpu_ttm_init - Init the memory management (ttm) as well as various
>   * gtt/vram related fields.
> @@ -2317,7 +2330,6 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
>  void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  {
>  	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
> -	u32 used_windows;
>  	uint64_t size;
>  	int r;
>  
> @@ -2331,47 +2343,36 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  
>  		ring = adev->mman.buffer_funcs_ring;
>  		sched = &ring->sched;
> -		r = drm_sched_entity_init(&adev->mman.default_entity.base,
> -					  DRM_SCHED_PRIORITY_KERNEL, &sched,
> -					  1, NULL);
> -		if (r) {
> +		r = amdgpu_ttm_buffer_entity_init(&adev->mman.default_entity,
> +						  DRM_SCHED_PRIORITY_KERNEL, &sched, 1,
> +						  0, 0);
> +		if (r < 0) {
>  			dev_err(adev->dev,
> -				"Failed setting up TTM BO move entity (%d)\n",
> -				r);
> +				"Failed setting up TTM entity (%d)\n", r);
>  			return;
>  		}
>  
> -		r = drm_sched_entity_init(&adev->mman.clear_entity.base,
> -					  DRM_SCHED_PRIORITY_NORMAL, &sched,
> -					  1, NULL);
> -		if (r) {
> +		r = amdgpu_ttm_buffer_entity_init(&adev->mman.clear_entity,
> +						  DRM_SCHED_PRIORITY_NORMAL, &sched, 1,
> +						  r, 1);
> +		if (r < 0) {
>  			dev_err(adev->dev,
> -				"Failed setting up TTM BO clear entity (%d)\n",
> -				r);
> -			goto error_free_entity;
> +				"Failed setting up TTM BO clear entity (%d)\n", r);
> +			goto error_free_default_entity;
>  		}
>  
> -		r = drm_sched_entity_init(&adev->mman.move_entity.base,
> -					  DRM_SCHED_PRIORITY_NORMAL, &sched,
> -					  1, NULL);
> -		if (r) {
> +		r = amdgpu_ttm_buffer_entity_init(&adev->mman.move_entity,
> +						  DRM_SCHED_PRIORITY_NORMAL, &sched, 1,
> +						  r, 2);
> +		if (r < 0) {
>  			dev_err(adev->dev,
> -				"Failed setting up TTM BO move entity (%d)\n",
> -				r);
> -			drm_sched_entity_destroy(&adev->mman.clear_entity.base);
> -			goto error_free_entity;
> +				"Failed setting up TTM BO move entity (%d)\n", r);
> +			goto error_free_clear_entity;
>  		}
> -
> -		/* Statically assign GART windows to each entity. */
> -		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.default_entity, 0, 0);
> -		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.move_entity,
> -							     used_windows, 2);
> -		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.clear_entity,
> -							     used_windows, 1);
>  	} else {
> -		drm_sched_entity_destroy(&adev->mman.default_entity.base);
> -		drm_sched_entity_destroy(&adev->mman.clear_entity.base);
> -		drm_sched_entity_destroy(&adev->mman.move_entity.base);
> +		amdgpu_ttm_buffer_entity_fini(&adev->mman.default_entity);
> +		amdgpu_ttm_buffer_entity_fini(&adev->mman.clear_entity);
> +		amdgpu_ttm_buffer_entity_fini(&adev->mman.move_entity);
>  		/* Drop all the old fences since re-creating the scheduler entities
>  		 * will allocate new contexts.
>  		 */
> @@ -2388,8 +2389,10 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  
>  	return;
>  
> -error_free_entity:
> -	drm_sched_entity_destroy(&adev->mman.default_entity.base);
> +error_free_clear_entity:
> +	amdgpu_ttm_buffer_entity_fini(&adev->mman.clear_entity);
> +error_free_default_entity:
> +	amdgpu_ttm_buffer_entity_fini(&adev->mman.default_entity);
>  }
>  
>  static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,

