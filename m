Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 894D3D3878A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 21:29:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D589F10E92F;
	Fri, 16 Jan 2026 20:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hm+HJXvo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012037.outbound.protection.outlook.com [52.101.53.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8BF10E92B;
 Fri, 16 Jan 2026 20:29:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EM3rVEUvJpvIrMIsQ6zuGkuHGpe7PLXRKYDwk0z3norENxhK1GOkcmkXzsGWDqfGC3TNo0F9tBc8t0HE19W67aBDRxB3BX5wINdWsqevo5oFFchC1eQnOmnBxq9T+qJVzkiYjSVo+bKP3fjG2U195+YV6Lh38ckUznwTi4EUjwCsdVUgnVmOAxGO2SNlLWr/fWyhH0OXJ+UgTnrfKHntofJbupDgpNEAyt5gmEaHZdB+stM3ykXOVVYupOBMj4fXzbvgnliNh49GNZWP/DlJMmfiSVP4yFWKiK00BYsVdn3KhJcM2zS40RGAGxwVeNyhKdLqZEW0udKgNuG8t+oUoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmKclf6KLN4gbAEUb8zRbNo8eFCwSAtiPHgsWUvcjf0=;
 b=oP1clDBYG2HQppZAU8NjRibaKLxwA+NfNAtKEEyB3WntVypn2EAFFelI4kyVl5YJ5ntn08nW/mqvX8r8ZYbn48D5mdKI1eLIPkcti0rpLrCL26IGy6kynum1N8uGhJOKBkhVOA7uT8cYOP7oqKjn8sxrqA0/sn/5OV+g8Axvn3agBYMeNpfQowmW3JN010yKtsxN1Z1uAHQ9wUORTx2jKKJ31w/bAwPBZl40+i4F95i58HICb+0wsfGsllGCgAYjBVKRu+fTeVqxsLMY69MNBAq4STIqbsRNRq3wcAx3iCxC5kQ7HwR6vhy0fV0yk4Qc86u1um3XcqnuCvuQ/llihw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmKclf6KLN4gbAEUb8zRbNo8eFCwSAtiPHgsWUvcjf0=;
 b=hm+HJXvoLXRF3OpvNYq5jow++3gcvYy40OmRWzfa11r4LdPcD2el70KZRU8lLVoiazPwxEM7FZOHq3FXHy6+0DjPgoBHLTySj+OdDsYmxvZ10ZKWG3Mc4NsQHXmSRV9SMS/EPNphHs9FOsZcxNNn9Wh3lnauiRdCQO8CHagw8oI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 by LV8PR12MB9690.namprd12.prod.outlook.com (2603:10b6:408:296::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 20:29:34 +0000
Received: from BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe]) by BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe%4]) with mapi id 15.20.9499.005; Fri, 16 Jan 2026
 20:29:34 +0000
Message-ID: <81f336dc-3450-4ffb-9682-5098950c28f9@amd.com>
Date: Fri, 16 Jan 2026 15:29:28 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] drm/amd/display: fix wrong color value mapping on
 DCN32 shaper LUT
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, simona@ffwll.ch,
 siqueira@igalia.com, sunpeng.li@amd.com
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20251208234741.293037-1-mwen@igalia.com>
 <20251208234741.293037-2-mwen@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20251208234741.293037-2-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0105.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::41) To BL1PR12MB5126.namprd12.prod.outlook.com
 (2603:10b6:208:312::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:EE_|LV8PR12MB9690:EE_
X-MS-Office365-Filtering-Correlation-Id: 20689962-6f64-40b5-dccf-08de553df5db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWhxaEt2dEl0NVQ1Unk1Q09JL0x2QWVpU3psd2Q3SytnU01yTmY4aE85Z1NU?=
 =?utf-8?B?R3ZEZnpMY0w5MFZKZEVjZnVQc2xaNURDRDU4R0FLZnBRdTQvUzQ3c01RWml3?=
 =?utf-8?B?cjBRUVBVQUxWVEt1eU8wc2hQdVBuTW5LME5oV2pQSzcrL2lHN0t0LzFob2Vx?=
 =?utf-8?B?Wld3WGphYXM2U2VvbS9KTHA2OEIzMDlyUU0zUi9tOHcvY0JmdEw1blJGMlNr?=
 =?utf-8?B?ZjVRSjZBQzVEUmNWd1JoSEJZYnpXV2RBR3JqRldneDdCVXBKdW81TG8vcVdJ?=
 =?utf-8?B?LzdtS0xqU1o4QXVhdno2NnFkcFBVZk5jZk50UmxHOUZhYnkrZ293VWVuOGhT?=
 =?utf-8?B?WGswNmlvZVA3SUtLWk9EWEFkVHZ4b25pTnE4Mi9mUlM2dTlqcHRMV0RzeDlr?=
 =?utf-8?B?dkFzSEphTi80eDhXYUt5bXc3RzNmeUhKNXJhQnRSdXpldlJ3MmhwU0lGOGNM?=
 =?utf-8?B?WjFtTlpmYks0SkxJb21FSmIyYXlZZlVMbmdKSThPSE1QZFN1dEg4b1dTTlhJ?=
 =?utf-8?B?N05HVWxBMVowY2VIb2l5NUZNNlZLYkhleEEvOERsZ2hmK0ZGR3E2OGwyTHYy?=
 =?utf-8?B?OEI2VUJ2cWNuQitHL09VR01OM0haanRNdVh4QjBDbWY0NkExOEk3VWcxbDBh?=
 =?utf-8?B?VE4yNWJnN3owVExGVFVONTZDUG5iMkUzU0o0aWZOemdCdW9qY0QrQzh5OW5R?=
 =?utf-8?B?eFJsbTduQ2tSUVU3RTVRcjREaWl3T3VrcG04N0UrNTEwdkpxRCsyRDE0VlNS?=
 =?utf-8?B?RmVoZUJya2gxVUsveWRyZkpNM21nMHpkS3BONzNmdzJqQmdCTUxGRDlpQlZx?=
 =?utf-8?B?Nm81cSs0N3dUMkhaQWYwNFovWGx2TWJuMnE5bzAzNzU2V1E2Z2VxU3dUYk9O?=
 =?utf-8?B?cFl0YzdGaFI1WUptdlpqZ3dHRmZJSWxxQlNFVmhRT0Jud1VQcis5WXpQWnA3?=
 =?utf-8?B?SGIzalhFcDZZTzNGS0Z2blNBZUNENVZYU3hNZ3FLL2pWTnEyYm9ra2dkVWQw?=
 =?utf-8?B?dHFIblFmd1JvcFhHbnpuS29uM1hiai9lbEErMTU3dDBpemE3dUJ5amNVVUFI?=
 =?utf-8?B?bVhWZ013MCtqa1dER3RqOUtxN1dVdlBMK2xsK014NFNXckNTNGJabVYzMTV5?=
 =?utf-8?B?NURyVXcvR29IS2tiOW51K2Z5RnFvaTZkdlZERmlwQjFKcGZSTmJPVzV2VFI3?=
 =?utf-8?B?YzRESHB5UDd2eTRWT2lQOUdHOWg1ajgwU3NKOGd2UmJydzBWcCs5NXNiQnVZ?=
 =?utf-8?B?SndnV2w4Y3ZVWDVTU1BhYTlWSWY3VTFuNUZQV0xRdHNSWjRsSDE2RTBORURy?=
 =?utf-8?B?Sm9VcXdMaXlRd25yYmUyLzl3ZStBSzlHeGVSZVh2TjczenlMVjA4QTd1SUJ2?=
 =?utf-8?B?bHUxYnUxVGJsV1VCbm1BSHRPWkhPSHI3M1BkY2Y2VUhlSkEwVWJ5akdVRys3?=
 =?utf-8?B?Z0ZncVhZeHhSZytEVUxmcUlrVnBBMVUzd2NhNEpmdGNRNTFGMVVIbldsU1hP?=
 =?utf-8?B?YWxkR2p1eFV2NjZPU0wyNUlyYmlOYllqMWovZFFwNktpc1RoVWFIZCttY0ow?=
 =?utf-8?B?WFY2UE1lR2lsaXIrMDg3MlVab0dPQWtGcGNDbmhnOCtRNjBJS1VEemU5R3hu?=
 =?utf-8?B?Y3F1cUduMnhjS1FDUFcvN2gvMFZ0amVUdGtiSGsxUEg3eXJJY2xpWTdXNW5u?=
 =?utf-8?B?VkwrS3ZzbzFOckQ1SW9DcS9GVWhKL3JLWEsvVjllRG9NNzBuOURPM0d1Z0F4?=
 =?utf-8?B?OTVwc3hqOUZmeGtUamdKZVdIQ2lPMGJVbWVPcnFSNDh5eTJxVlJsd1NVT1la?=
 =?utf-8?B?akplVnZQckVtT0pMKzJxZk5ybmNLejVYM3VhZTFHOUQ1R2Myb3FXZVgyUDFx?=
 =?utf-8?B?Ukt0eG1TN0dBUENab2k0TmY1bk5tSnh4ci80VkloZk43ekJ5eEJtWFcwT3pa?=
 =?utf-8?B?ZHRZUFZvbDZwaHREN3JId2RycVBYMTlXU1l5UDBOcVhTZ3NRNHc0MVcvWllj?=
 =?utf-8?B?T0dUTFo0bjNEVTZyMWN3N0xHc05abE9pZCtOK2taN0NmaTI5V2EzclVJWlZ5?=
 =?utf-8?B?QzFkL05lQ0FuVGxJYnhiTGRqWWRMNW1saXJaaHlUb2JkbWRPaExJWEVNSENY?=
 =?utf-8?Q?bzcY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5126.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmhIYXhadTk4RHV2Z2xmcStnd1JlUGc1SEJoUloweEwvS1UzNXhvdjVxNXc1?=
 =?utf-8?B?NlZYTkp2anoxTnRFZnZHZEgwWHdVcXFsNVNxbmI3YVpoZEZrOEdkTU1qVDI0?=
 =?utf-8?B?OHcydTUyeEJSKzJPaDYzUjNqKzRVUUN1REsrdG02YUtVb0dHUHFqRlNFdVh5?=
 =?utf-8?B?cmkyM0pVcGEwSkdER3BLb2VXd1UvcDAzdGNHS2xZdzNpMnF0R2U1MXM3bWFB?=
 =?utf-8?B?RXBkRDMrSjU1bnFvN3VVU3grQ0E5K0J6RXNoVjA1cXZNcy9xaERpc1lwSFBa?=
 =?utf-8?B?cTRkek9EdlJyMmlvRTE2amM5VnNvMjBEa09tZ21PL3YwM3hZUnFsZy9QZWQx?=
 =?utf-8?B?YW03dHJXOW5NZXZveVR6cHJ2N2hKR2tvWERFK2kxdWF5REtxN1RDK1NGS3Az?=
 =?utf-8?B?Z2UzSGFMMTNxbzRORzJZa1RuRlJ1VWdTTTRpUXI3QmtocEZpWnlyNDhUSXB5?=
 =?utf-8?B?ZEhCOSt5UWRvQ2ZFMytzOFhxZmFZY2V3YXNEd3pqcGVzZy9VRTVPQjV4WWRh?=
 =?utf-8?B?dWtSY0Y1eU9jVGd1QWF5RVJZRkVTNnlCbnNoRUR2bkxLV05BenhCbUVMc3JJ?=
 =?utf-8?B?VVFwY0Z6SUt6cnFYcXpjU2trVjU1a0NzOVdyNUNxUlVQUG9sdkVFSmlONzBL?=
 =?utf-8?B?Vm05d2tGcHVLdmVYelBrL01ObVlIVjhJejVONi9QQndPNGgxL05DRVRRWGZI?=
 =?utf-8?B?SEpRRmpJT3lzaXMxT3F3TmFETjUrQkR4Mmw3ZVRqY0lYUEE1eU1Jb1Z6RUpt?=
 =?utf-8?B?Mk52QlcxcFplM3BmNGtobWVQYzZCclAybjZISCtES1E1M2Vwb2hWK1Q4ZkJv?=
 =?utf-8?B?SjMvdTlnUFhyTU9ac3g4NGNqaThoNU9MVTEzUGhoMXVnN0tmbHlud1FJTWxu?=
 =?utf-8?B?bUN4d2VsVlBHd085MDRBdWlnWjVFQnQ0Z21LWjErU3BjREFTS3dDNEIrYmlG?=
 =?utf-8?B?MkkvOFEvbFYrY0RxRS9jRmZvZUVJL1ZIdzRjUGNsMXJ3R29BMmZxRnduZW5j?=
 =?utf-8?B?RndGYVkzQU9yekxORnY0NVE5ZnVSS29SaXJqY1dqSnYzM3FJdU5FNlB4bzRS?=
 =?utf-8?B?VEpBaCtkNUtiQWFhQnkzbG9nekNza0xLTTdJczFMRzg4WjQzS3o4aWJvQlVx?=
 =?utf-8?B?RXViM3d4S0hJa21uOVNIR1ZBYVNiSUp1SWowUmZPdVpnRlY5T2xmMzJ4NU9j?=
 =?utf-8?B?MG5HbWxWdXRrWGlpT20wazJPUTI3QXF4dGVUMTk5djl2UUJTQnRoUmxNcEpB?=
 =?utf-8?B?anphZldPaVFSckFmM0N5ZWxpOGdzV0RnYzd1T2FMcGpnZFg0T3lpTzU1c3hX?=
 =?utf-8?B?aDBmYlFrY2VRQk5sOXRKTWR6V2ZqQi8wVGZRaGFFbDdUYWVXNlhCUlNraHFo?=
 =?utf-8?B?ZnM4WkxSdDRpZmdPUDVOMVRtaGE0RzJ4SmpkV3AxU01sZk1vc2c1N2VDSDhh?=
 =?utf-8?B?K09QUHBnaUlKcUR1U1Foam1OU24veCtjQnBhbk9Yd0JjdHlpU2hUWDJyaS9s?=
 =?utf-8?B?SWhGb3htVjd6VDRVT3dZSHZUdDVyMm9mVEJPblNwM2lXV1ZVbVJISTZuakNz?=
 =?utf-8?B?SlJHSCtpYjZTT20rRG1uUlUvRnhGZG9KalA0c250SExhZVFqVEl6RkRFUmln?=
 =?utf-8?B?aUhxcGJvNjNycUI4VzkzSmkzY0JlWUJCaVc2clFrY1JPaUt3V1U1SnYyUDhE?=
 =?utf-8?B?dHpJMmwrbEZ4QzJxem5sYkJVN2I3YnhUVEFzanR2MVZpSytjWUVZMHFuMkIx?=
 =?utf-8?B?bHk0dGJobWJoeThtUHBPUmY3ZGlCZ29qcW1MSUZNZDRRNzZKajM5QzMvdkVJ?=
 =?utf-8?B?R0VCdHNScm0rb0RlR0VuNGsxVy9yc04wZXE4N2tzMHpTQTVwelozMkkvOTl6?=
 =?utf-8?B?MVdRVWdiRlNpRWpyRHVjTzk2QXFwVEZnWVo1Rno4WlFoa0diYm9CSDBScnZO?=
 =?utf-8?B?TEJnVCtDSjdhWWhjUWVNZ0Uvem1RR1pKUS9oaUdISktWOWlvOGxnSHJYMUQ2?=
 =?utf-8?B?Y2lDNFdGRGZrTHVpUlJvYlgvazlYdE0rUDQ1VXhTTHF5bVNBN1hrQ0VRVHFl?=
 =?utf-8?B?NjBlL1RIb2NlWjhPUnBHcjJDMEF5YmZzUnNMMTVTM0FOSkNoV1o3L1AwSVVX?=
 =?utf-8?B?NlJVMU5mSGw0SW9WQmZBV1pNQ0RlSW40NWpKdUM5dXpBQW5vQ212eDVPRUp2?=
 =?utf-8?B?RVpyK3lqTFUyc0ZFME55QkQrR3FyeW5sR2pTakVobUhFT2hBb2ErWUNFdk15?=
 =?utf-8?B?UUN5Mk9JclZzRXo4WEk1c0M0SjVDc01TWEhqSUhHSmpkVnI2cXdTZXBRWFEz?=
 =?utf-8?B?bjVRbm9mOVB2eE5ZQUdSNlVEVkNFc29rYlRqZCtlWVBlS2loRWhHQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20689962-6f64-40b5-dccf-08de553df5db
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5126.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 20:29:34.0452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mr3ftH7AA7iaFjSwi1sRCTHemhraLF+hUmdydE74RrDsIyEtUDwElskdr78818qzQlRM0ncqwkK31d4a8kXvRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9690
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
> We've seen some shimmer points on DCN32 when using the steamOS color
> pipeline for HDR on gaming. Looks like black values being wrongly mapped
> to red/blue/green values. Fiz that by using the exact number of
> hw_points computed in the LUT segmentation. Probably the whole logic
> that adds +1 to the latest points should be revisited.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>

I haven't had a chance to trace the hw_points logic but am
inclined to take the patch if it fixes things. My only concern
is that it reverts part of Kruno's change to increase the points
by 1 so I wonder if it could break something else subtly.

Alex Hung will follow up and get back on it.

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
> index 0690c346f2c5..ba20575be214 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
> @@ -225,7 +225,7 @@ bool cm3_helper_translate_curve_to_hw_format(
>  
>  	// DCN3+ have 257 pts in lieu of no separate slope registers
>  	// Prior HW had 256 base+slope pairs
> -	lut_params->hw_points_num = hw_points + 1;
> +	lut_params->hw_points_num = hw_points;
>  
>  	k = 0;
>  	for (i = 1; i < MAX_REGIONS_NUMBER; i++) {

