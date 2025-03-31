Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AA6A76CD3
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 20:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F80010E47C;
	Mon, 31 Mar 2025 18:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qWcNPf46";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D5A10E057;
 Mon, 31 Mar 2025 18:21:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=navrCSszctRGAqK3/SmKKnefQq/Lagch1hy/6cFmOf+95GnFMz66quOE4JsErbPO5eSIox7bzE7nCzu6QI49Kyp3mLJ2u84tkwab139pKGazGqk87EXK8n8viV9uoeOjWS4Guf8AUNlzRvSEDLVyrm903iCp1yA619goyWuM5Id9OWgE+zmIQIUocsCwcJdgiFdgJ2yR9t1tAfvewk4e4VVqQ5B53Q7qrG353LbNfc/eHK4HyWi2tmPToChQitODPQTBAMejdfwYoktnmnNFDOOuUZlJJR7rXx+QaqNmWy+h1ORTcww34v6HUBrmfMghSyNxGDqkmwaq3vIlZBJBuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HXWYn57BxnPGCYJCdqO/OF2XjScQu04kGfJGcRbQQI=;
 b=hmdjMficw7MpAuL/8YN0GRLnX1LuDWeP3phII5EJT+0oVUPr8WJP5Seg647+F1xBA5GYBbwvHZTkUyQcQZot/22nx9b1j/IcjE63LZFc6A7gwb8aK3+pM1fEe+jcoL6DkVHWvmIedX3ie9QyaZlb0MG1buZnuVBwo2bW7/AUUSlL3BK4huMlVCHOD5EnohfzsjAtvmrWQZ/5YlZooM8mfndSjFR8GxneU5eJCqp4cxaQ2hj7ji7Pf2yrhzicDa3KDa7j6zJFLsX+WeZ1vIB6PqciP542WXLQd3YJter5o5NvNvfK7RM6MzhHcdL52XHdl5XhSRwaiWo+7PzA6joXZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HXWYn57BxnPGCYJCdqO/OF2XjScQu04kGfJGcRbQQI=;
 b=qWcNPf46f+h+a9HLSKrgQ3T3d14DlEkk8xA3AStbG0ZrrGcOoXqpyHICqOhJEZWtB6VhcgS4m9IMBcMEB6M/ujqC2pFXZsaoeahiJZQVyfefKOKtgQsB4AuqkCnH/Fy1uL8ALCiMdvc4nqTJeOxYUN181U4YEVYk6aRufiq4RDg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ2PR12MB8062.namprd12.prod.outlook.com (2603:10b6:a03:4c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 18:20:59 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%5]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 18:20:59 +0000
Message-ID: <81cac86c-dece-4f0d-abd7-efd888a08db0@amd.com>
Date: Mon, 31 Mar 2025 14:20:53 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: replace use of msleep(<20) with
 usleep_range for better accuracy
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 James Flowers <bold.zone2373@fastmail.com>, sunpeng.li@amd.com,
 siqueira@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, aurabindo.pillai@amd.com,
 alex.hung@amd.com, skhan@linuxfoundation.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250326070054.68355-1-bold.zone2373@fastmail.com>
 <2a2e9a4c-b888-45e1-a191-847dd8e7cb9d@gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <2a2e9a4c-b888-45e1-a191-847dd8e7cb9d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::28) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ2PR12MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 986a1fa4-eb80-4b8b-1dc4-08dd7080c94d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RndIVG9XUlFMVjdIdDVrSmZydmhiZVZ3LzNJd3VJSkVtaHd2d1dpOHhudk9p?=
 =?utf-8?B?VzF6SjduQjhLY0ppdVlRTzFVTlFFRXFrUDVvZTVIbWQxbTZrR3Vma2JOQlRm?=
 =?utf-8?B?RVFnUENpTEJWMmY4WlZ0UUNhWUI0WWJnNFY2eE4rSDBnVTBQMlNQWHgyN0dM?=
 =?utf-8?B?a1M3VzJKNWxCUUdKbUt0bGdrZllWK0puaVZXM25LVzI5MnA2Q05rcGpqU3BL?=
 =?utf-8?B?b2pJUllpOEVucVdVZTIvczhOYWNpUFBDKzdBYm1pUFBQYmJ3bXpKbmdHR3ZM?=
 =?utf-8?B?V2tPRExhbHlLUWdTTkcxNXhiT2VNdEhiaWRxRDdqbTJPT3czVUZtVUF5LzFU?=
 =?utf-8?B?NjdEWTczMittN3ZFSnBrSklwZFF5MHBZUHE0c251Q1FPZjRMaFlPVTR3YWZP?=
 =?utf-8?B?V1BjcDhDL1hxZUVuNXIwY0ZURFpnYktXM2h6OXAyTWx0UUF0ZzRjN2pTWHYv?=
 =?utf-8?B?MmRFYllvN0RUdE92amF4UEU0bEJwVnN3MTBocUVzbFVmMG5ucXNjQjBNcGhp?=
 =?utf-8?B?UnVQNlBzd0JvMVowY2xPM21Kc1JDKzkxOGVaSmVWMjNQV0NtejJPa3h6ZndT?=
 =?utf-8?B?dHRlSkhpbFl1eE1DRXNKZVB5d1A0ZjBUTllaaW9Bd1JLWUFRd25xRzVROGp3?=
 =?utf-8?B?aFlPUzYyWkxzMU9Sd2JXNUNaVDJRcXVUYVFqK09JOEUxYlhOSDA1anlPaFNj?=
 =?utf-8?B?dVFxaHpYWE9zRTIxaDRTTWdIVEhOV00wbkZNOVNjbWdnSDIvamNEMllNN3lH?=
 =?utf-8?B?Q3JNbEVMODliQ3dHMzhhMFNXbHQwTXNSYUduaU52dHd5R0FydGtCVUtsNDlC?=
 =?utf-8?B?TFZJT096YkRCV1JpSldmVExwOGpkSWM4OW9ZT3plZnlBa0ZoOWtLVXJVd3dC?=
 =?utf-8?B?SGNMMVh2N3pzNjFOZGlMVEJnWjZYYkx2UjloSXEyTjN6NVlTaTdPekUzLzZk?=
 =?utf-8?B?YWJlNGFYZ1Y1SlJBWDZlSGNkL0dYQ0hBdG0wYlhtTExpc3VvdmhidWgwQ1VE?=
 =?utf-8?B?Z1RzT0wycGp5QzJYL3pSUER1S2xoU1NsQTdyeHpKMk1tQi9GdkE3eXM3UzU1?=
 =?utf-8?B?ZE9TNGtaLzFpNDY0dDlpc3pDS0l3K1dYbmUwVFkzWXYyaE1qR2ZLQVIyenFr?=
 =?utf-8?B?MTVNMmNQQkFEd29qaU0wczc2ZENXS1NicC9WZTJXZnlxVGh1WE4yazhibDZs?=
 =?utf-8?B?OThocFpkVFJVbkpFeDJSVmMrL2o0YTNvRUE2SnlZeFltQjEzcm81YWRpaVcw?=
 =?utf-8?B?Tm4rTjk2QW8rVXZJMzdpRzhobGlRbFd2Ymh1SVhoNHBZMXJHYStxekhYZGV6?=
 =?utf-8?B?NWZzcUpETDZXclFIUC9wR0w3UGRLQXpweTRHQ2pBUC9zSWRTNnpOUGhiSjZ4?=
 =?utf-8?B?N3o4eFFZYkZDMzZhYm82bE9WVldoNTRCbUdsNXZ2Mnh3ZmIzci85N1RueHd0?=
 =?utf-8?B?WS9nZGg0b3VOZjFOaFhiMXNOMkR2Y2NNUXlvdWpzNDdiSktVM09TMTAxUHZh?=
 =?utf-8?B?VytyczNPaTduRlM0eW5iNENob0JsRzJTVG94bE8vQlM0cDExcVRiaTc5QkJF?=
 =?utf-8?B?QlB0ZWxRSksxU2RHejZGbUlDanpLUjBaSlFPdjVRMnFibnFmdWNPMllNTFFB?=
 =?utf-8?B?bUVKYUpqOS9MRDNsYkVDRDkvUk91SzZna2ZWMU1SRWNBMmRUR3lUMS9DSTVC?=
 =?utf-8?B?anNuWHpyRUZpRU1NaXlJcEo0bks3dWZ5K3N1U2J3d1p3WjJiU3I1d0d6bUtv?=
 =?utf-8?B?a2kxWjNrWlZOeDBGaE02OHo1eWNUQm53V2RVdURTOEd3eU0yL1FQSG9WRTVO?=
 =?utf-8?B?ZXg0N2ZsYVc5RTRZZElhVUNkbUJ1NnFjSVBNYzJodWhFVjZTZ0hqd2szQ3Vi?=
 =?utf-8?B?VG5zWEhBVHBkSjREbWZRZTJFenRIYi92Tnl2ZGxsKy85bFpLS1owVE9OUUFS?=
 =?utf-8?Q?L2q8UpRBvjk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzZVTTh6ZzN0R1NaekxJbG1qSEN4Rnd0TUd2cCs5a2RjV0RCM1d0YmFhcTBX?=
 =?utf-8?B?eExrRFVycUxSbnRmTzR0UjlEOWpWbENNRTZxUS9Sa1FTN05ZTllHbEFWZFZY?=
 =?utf-8?B?R1N3V2xFdjJIMzlJQ1czOHVJVlkzZnRoUHFwYzdvMTFMSDRUU0JidXAzeUtL?=
 =?utf-8?B?MlgyVFJOMmptZnZpNmIyMWZEQ2FXQytmYVQ3MWMvTDdGbXNkZTVjZWJXaHk5?=
 =?utf-8?B?RWtRemZES2VSWmFSRFJWbWl3ZGJZbkkvSzU5bUJKOHllQU5KUi9lWVIrYklh?=
 =?utf-8?B?N3NsZWo0ZjlvdDNFVkk1aFdDN1NLYWg0QXJ2MGdMZVZPNFFyL2l5R3hSQXFj?=
 =?utf-8?B?VDJyZ3BIMnpXYng4MVBod09La1VMMFJOMkN4WG5ib2Z3RUYyTExpTFpURDNH?=
 =?utf-8?B?Z3IzUkY4WmhlK09xMVd1ekVsTlRKWWNtV1RRZk03ZGhLWjY1bGRwSlpleHdp?=
 =?utf-8?B?ampyR2VWc2F0SXFlRDhJZnpWTVc2TmtiMXpDZVRGTWo4NXB4RHhSU25uWVNG?=
 =?utf-8?B?QjFWdjU5YjZFMkorUWVkVlJsZG9NRHdlNzNjNG8weU1hU3krcksraXBHT2Fr?=
 =?utf-8?B?ZlR0RTlSK3hCZHFSYXg0RXpydTBmMWRSWVJFeXF1VVB1dXRYMUxsb1Q3azV4?=
 =?utf-8?B?UjdZVk9saytZUGhoY0VRVGRZZGs4WHVpYmlyL2tWS2pTYjgwN0M5azQzR2xi?=
 =?utf-8?B?bFQyNkdsQi9tNXBnanROQ2dxaW94dU9SM3FERHpVbzBwRS9CL2dpMUlBOS9r?=
 =?utf-8?B?YzJITUNSdDhBcTdvRFh6bGEyYm16VExTYmRIZjl2RmlQUTQ5bzBqMHpTUFln?=
 =?utf-8?B?VmJQRTJBRzRQM0cxak4wWnJ6UU1TdEoxZmJZSW42bXp1OVF3bVFRdlBobDV2?=
 =?utf-8?B?dmZnS1o1NkVBaU1QemI0SzEwQWlaWVMwUVhQLzh4WklzZkdqUDVHVGN6cm5E?=
 =?utf-8?B?OVc3dHErTUtxcU5SSTlPUURxMmNaLytiVnMvdXIrOElRSHkvUTBZTnlCUjg3?=
 =?utf-8?B?dmNWV2kydFZCMEV4Y2N4Q01aVFJFS3NXZ2lZN3VZeEUydkNudlpWZXF5ZGti?=
 =?utf-8?B?bVp4Nmp3T3BqVnE1d0pOTlJmVG92b00yRzhPNkM5RDRFTUhwVkJSNkQ5U0o5?=
 =?utf-8?B?MjRNMEtPS1R4OUZqbkMzM01STi9hOTdXbnZWTUlnNXZ4ZGJUUCs0dGlvdVRZ?=
 =?utf-8?B?LzZoOHJIRjFXanc3YnBnZDMvRFZURTYwM0padExSUlkzbVdBRWxqUlBHSW1O?=
 =?utf-8?B?WDVnUERtbjJ0MkZMWWU4T1IwdjgwUldiUVVES3hWd0orazFmMitPaFlJejBw?=
 =?utf-8?B?OGowWVpRbXNpZ3hBaEhCSjVJT2xKZ2wvNk9ZNjJMcDVrbFpOU3JDSEtldHRz?=
 =?utf-8?B?Wjgydm1TUUpybmhFZ0dhVTBLay82UlJGRU9LcmJBZlpabjB4UkhhdDBHU2hU?=
 =?utf-8?B?TzdFUkx5WHFFaWpvSzNHMFNtTnRXNk1pZ3NaN1U5QTRKcFpvakVPYVY5c2xZ?=
 =?utf-8?B?by9YUUNqeXpLVVloTC9MVGdMK1NCSlJkLytIU0UwNHQrb3lDTCtJVzJDdCtH?=
 =?utf-8?B?RnY4WGFqWXpKeDVwdkdKeDhXOXJndmZNNjlUQXhUUllZYmt1RHN5Z0twNzlL?=
 =?utf-8?B?ams0Uy9YNW4wNGN5U0VQSCt0a2lwbHVhSnoxRGpKUHlQUmpMbVdTOFBHVFZR?=
 =?utf-8?B?N1hFRk5lY0dCUk9URE4wdHgxR1JNL3VXMVZ0TFNCOE1WNmlxWFEwa1lVNzNE?=
 =?utf-8?B?ZDU3bVlvaEt0VjU3VHRwVmUyZm5GVW9PNXFXOW9ZeWh2RW04aWl6WjBtV1V6?=
 =?utf-8?B?dnlnMSt2WHVIeFFtc1ZqUnNndDczZGpsa3ZmcEtvOUcxc2Y1Q3NUNHl6Z2o1?=
 =?utf-8?B?c2tnQ0J3bkltWHBZM0EvY0tnTWt4cEpHNXRsZ3FKV21hSmRJOXRTMWNtbTVi?=
 =?utf-8?B?KzF3WVdpVkdraFB6akVHNTdycEhEMVhsOXFUcEtCNS9LQUR0VzRHRDljMFR4?=
 =?utf-8?B?T2plY3F3N2hjb3ZFVFAvZGV0a3R4SExwTFJhM0dkT3VCVGpMSmhOWVBKcXlW?=
 =?utf-8?B?UnlMTU92cDJjcFBnSjJFMDY2ZXJ1S1BqNkZzSWQ4RitPbzVqbXRrdks2U1E2?=
 =?utf-8?Q?AcGqN/sMfs4SkTYgHgGGyu1+x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 986a1fa4-eb80-4b8b-1dc4-08dd7080c94d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 18:20:59.4851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMf+5sueQ9ASrL1BFt2ugF+OIGnZ2MHbacgs98jrmEWtJvPZ0+CQWaJs488BbFpArzfhUNWyJc3sr9D0yv4Czg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8062
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



On 2025-03-31 08:34, Christian König wrote:
> Am 26.03.25 um 08:00 schrieb James Flowers:
>> msleep < 20ms will often sleep for ~20ms (according to Documentation/timers/timers-howto.rst).
> 
> Our display team has to decide but I don't think that this patch is justified.
> 
> The time given to msleep is just the minimum time necessary for some HW action to take place. Waiting longer than that is usually not harmful except when you want to optimize total operation time.
> 

Agreed. Little timing changes often have unintended effects.
I have no desire to change working code unless it's required
to fix a real-life issue.

Harry

> Regards,
> Christian.
> 
>>
>> Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
>> ---
>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> index 2cd35392e2da..2d225735602b 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> @@ -682,7 +682,7 @@ static bool execute_synaptics_rc_command(struct drm_dp_aux *aux,
>>  		if (rc_cmd == cmd)
>>  			// active is 0
>>  			break;
>> -		msleep(10);
>> +		usleep_range(10000, 10200);
>>  	}
>>  
>>  	// read rc result
> 

