Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KP6bKVP3pmmgawAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 15:59:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AEB1F1EAE
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 15:59:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7712710E0FB;
	Tue,  3 Mar 2026 14:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zZP52VWh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010013.outbound.protection.outlook.com [52.101.85.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0554A10E0FB
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 14:59:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JX9hUcYmMslBoNmkFLO46F1wqnODtOqeR775Le2FP+j5XxAJ8qp035zLqrCgvf176RsWWZjWlWcOSIzyxKnKk8VrIHSfapEYAIi0onQEia8V0yYKjvjTpGn2Qv6w0qOBLdO1/EGlyDMW8U0JcenJUOKMdYHVpP47eWi3QaaNV0oSF8rHABavEt0VhNAUcoV95yLqXXA8uVmeZPl4083Mx339JqF9mmZAyHm3gV5tvRH/IMC3lBzf2oRkkLhAjmQ1PqJEQ97uYZJRAZXc2gG1GjJARNbLxiCJu7X4vR1Ahp/pUlqW1Nta+Y2KEti/ySAOi0psi5oTqztnCDgCQbtjSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAjFDQLzbFcx6MBPhtCuI5lTwleTlzA9XGDq09HKm9s=;
 b=bK1vdXJJK1BPt9YY44J02qqh8S1RcUgbYmzuEqtbZJdW/WNulqCy+jlpeCnvkc4PdoFKMmPVHa1/LUBkPlMX295T/so7pil4sv5N7GlaANiqdGMuMh5IGZ2ThsC6yBPJcmf0ZZ3kQwi34k1vUsJwWpwrX/PBIgmdfIykId1Wrvx8X/+y6Ln5Aj5cLIxVAkxpJ49c/slRx3vs7hyeiHWwOo6SEANPr1v6SefvUba0HqKqzo7brgEGxdEciPT1GaHHFsH6iKMKrj/lp+f4+qCiIMtCy5ScgaakN4xTqCYFp6apiGXeNDsJAvNa9RsngmxqyAQiH+za3pRsgQ84Ywtjfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAjFDQLzbFcx6MBPhtCuI5lTwleTlzA9XGDq09HKm9s=;
 b=zZP52VWh6T1QxKt0O21Lg/H9Abte+788Zzrhx2lzmfRp+um2j0YbNa506SEVL+Tm9WisWXvv1LZ5nOy+8vpkuXeGNxlH+6J3a3oVF+jk8y5vHIswuvAIKdyp975Jprx1Ggz08AuSY0VIbeOGK0fUHz/ZwpZXszRU5WYGJzqGlTA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB6893.namprd12.prod.outlook.com (2603:10b6:806:24c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Tue, 3 Mar
 2026 14:59:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 14:59:23 +0000
Message-ID: <3c969254-ed38-4b13-84b3-5afa365b04cb@amd.com>
Date: Tue, 3 Mar 2026 15:59:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/syncobj: Fix handle <-> fd ioctls with dirty stack
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Julian Orth <ju.orth@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260301-point-v1-1-21fc5fd98614@gmail.com>
 <e0f687da-7323-40fc-af50-82abea6e25cc@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <e0f687da-7323-40fc-af50-82abea6e25cc@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB6893:EE_
X-MS-Office365-Filtering-Correlation-Id: 113ada8b-ef76-4cca-ea77-08de793574b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: 5YpH0wKAYmZbvWTktvbv7NhHTaXELJXDq5EuU8jCDS6LCUFvq4YDPnRwZI9jAiC+rDn0BX257JVw+RvopvNKrdFGblCDxrY5LuaP+aWex577Fx8wVe66+c9u4n2ob5EbkUKrCiqOGpPfTVe2nndNBy1zjIKxWPKLJ11UEuSYoZFs1GFaqo+5UmRi8BuhLToJVx80dirzQLT9wU1L2IqFDjIxyKsaSHIiKX0fv6bsFgyYTYBXMYM0V3Em6RhPQU3C/Zpb6d0nl3LB6Z5dz5vEygI/xm8Yf/D9wqXMZAk7olBGae8R8XbltbFCZJmuFF00vkdJDvioDBGRB+fWa4C0R0/OYCZGiheBz8XrneYkRxjV7msFfW9LLkLAAskNjUKi+2pt6eZiA4lrS4352+jfrxRGlUhZ/veVj8DVMCl9zgisHVsP0bBOlNfpuXGYvr4WU7ip98UhlDK8AuF25bMmS1Hqn5QG78FxxCoASK0hnJhZ4vlg19o/wSu5LBXKyAS7otaM/IyY8kIIHACnlTEvusTf9btbST9VaxQHWmc06fWl1p/t8zjhAAiGyoqwrOgeDKgmPM+IsRPjxO3aui1/BwYdvM7QU6vM54nHn6oJw2+KEYI5hE1PmH/4VUS1j5TKSg9pGdG0qydYauBnL4AdNIIKXcxeGJAS40bSbZaRNFeugh8ZiQxeHe3GcLjtrCkI+D2C+c7ewTG4b6d+QuCAk9E+hhUjnCvjz0HyUStGgBA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFBSYmM1RWp3Ny9JNGpZM3Vmdm5lSmRkZG5wdEdZN0FLa09YVXF4RVRVSk84?=
 =?utf-8?B?eTdObkJSZURjbDByVjBBbDJGOHpSN3BWSmlYSWdBRTZ6UGp2a29hK3VTWnpW?=
 =?utf-8?B?akZSZDlqTXJ3MDdYUm1vRzZlSS93R3dUUGVmU1p6VDMzY3cyM2E2YkcxUkFv?=
 =?utf-8?B?ZHdReWhWQXF0dEkrTGlqdXhHZFVnTFRxL0tvaDY1RUM2Q3gzMEM5dzhYNlJV?=
 =?utf-8?B?Vit6RjFkaklYMDJ0RTdQUVVpYlZNYlpUVTBOTkpNbUZmL3R1RDNQWnBqRzBW?=
 =?utf-8?B?bXhWR0RSOGRLc3gvRVY3ZElMUytxZEdUOEVNRDVhS3BudVNzL2hvbHpiNjh5?=
 =?utf-8?B?QkRnTmtTc3BkMTYvS1FBZUR3TDUzWHdzZDBqSm9rS2owVjJKaUswbzFlQ2pO?=
 =?utf-8?B?V2RCT1k5bWlJSUo4RVcyRHJPWHIySHJNWXRQejQzMWJ4RG5MSFBRemhaMjd3?=
 =?utf-8?B?R1hzRm5wL2FUSkpTeTlzNk9mSUtjVkY2cXgyN0VrMWVvSzllK0J4Y2dUMlIw?=
 =?utf-8?B?dVd1TmlpQzhQWGJCSnIzeEhjR0Z1OE9jT2Z4c1hhOHVaNFErOG5jK3FqM1pz?=
 =?utf-8?B?RDFEaUVQZ3VSWXZQZG9Ib2FDSVpEME83RUh3enFhbUlHY3pUaUI2eG4zZDB5?=
 =?utf-8?B?Skd4bHFqYnYxd0JEN1B1c2gzS2U4ZjFMcWwwV2FrWmNsSS9Pc3g1RFhlMmU2?=
 =?utf-8?B?NEo2ZTB3WVNtT28zY2pFU3JXVkpkRFZvN2FjZDVKMHpTWVlPRzhZTDAyZWhR?=
 =?utf-8?B?MkowMC9sdTJjN1JyN3IxSS9zaWo4N1Z0aElOWEV1aUFha0FBRlN6WkpuQU5S?=
 =?utf-8?B?ZXhVTUFGWGZGc2RUb0pqQ21xLzIwSEJIeHU1T2ZXWEhOZWIzYXZXR2ZDMmRI?=
 =?utf-8?B?ajBaRkpVaWY2Yktqb1g5RUpUS0VBYXNOdTloQ0VwVDR3Sno1dkF3MGFFTTd0?=
 =?utf-8?B?NmIxb0pNNFZERWJVLzdNWjBJTlJKUThub1VyRjBaVWFUQytwWUZrM3d2RFA3?=
 =?utf-8?B?TTJXVkUxbm9MMjhVekJiWiszcnlITDY1K1hBZkJ0RUFIaUY2RGtzVlRVNmM3?=
 =?utf-8?B?RHZvOFB2TVJNbjF0YnloVlN1aVFCdzFNREd4RFhvWGFnS2R1WE9kZktKZzRz?=
 =?utf-8?B?K05EZTdZNGppRFdwSWRSYjB2ODdGRGUvWlRsOEZHNjhNYWI2UlJJTzZDT3NR?=
 =?utf-8?B?czZlSFVFeWlnWlZISjZwRU5VRytVR29GRktTZDU5RXpmOFptQTQ1SlIwUzFZ?=
 =?utf-8?B?RWphN1ArOGlSOGFmenZBS3NRSmVlZDIzMFZNbitzTGpqR1ppMUZ1NkxESTlJ?=
 =?utf-8?B?VFpvQ2txTTRrRXl6NUJZUlVSV1FkREJ0Qm5KK3gvNkJHY3FuQk1vOWxqRTZu?=
 =?utf-8?B?N1hrclZvUDRBWTc5eHVWajVWcVRLeHFQbkRZSFFmR3hsMnYzbmNUQ1J0NEhM?=
 =?utf-8?B?cDhaYjZhd1hoZ1o1aXRINXhnUmd6aVM4cDI3V3RiRjk0WEVJTlFEdXhZdmp1?=
 =?utf-8?B?OVBydDBhaXdTYVRzRFRKcDBoNGs2QjNGbWtwUEVPS203REt1VHA3QjFQVzBt?=
 =?utf-8?B?M05kZ0F6Y3pxekxXcE12cEk0cTc2M1cyN1djZnpRUlN6cWJZUnZzRWRjKzNQ?=
 =?utf-8?B?MkJYQ3hhb1lRMFM0YWtGLzRWdDNUWG9MVjBJcVFMNzd4RzFwYUY1aExGTDlD?=
 =?utf-8?B?TlhWYzYwZDNlTVdUOVVVaWNiSzJZTm5ac21qVmc4UU1HbHZrd3ArTUVmNVln?=
 =?utf-8?B?NnplTU91blhNOVJwV1BnNllRcnZuZkRVdWRaSEI1WkFERFV6UGhydEpzZDJ6?=
 =?utf-8?B?dmpwOS9zRGtKV3FKb1Y2Q3EwT1p5RDVNcXNXNU1wS1pmV2l2YmpxNE9KajVV?=
 =?utf-8?B?MHBUY01raS91YnNHcFhTLzMzUVpXbXRFYWJ4RVpDWmtyVjNwbzI5bDlNWFBX?=
 =?utf-8?B?cjAzS0ZCR2phYUVDeHRtMmJ1dnpDT1IrUzFlRDBkdkFlYWx4RURWbEJSamtz?=
 =?utf-8?B?TEhWa2xCMzhYZ0E0aXZUL1JJN0s5OTM1dm1JOXhRWk9UZ210cE9YZzRJekd0?=
 =?utf-8?B?YU1Ma1BtL0dTMStrY2x4TnpHdmNJcmF4VzVqZUR5SnhTSzNUWXFvcjVGZFdH?=
 =?utf-8?B?OU4ybG8yVFdLZk1laWZWeGo2OVJ0Q2JhVkdOcnF4bVU2NE1hU2NhdFozL1oy?=
 =?utf-8?B?VkFQT01iSEd0ajI1Qlh5TnpacG1yV3ZLSnFCYm1PbkVkeWc3S2FaN0VWZzYw?=
 =?utf-8?B?Q0pyQmRjRk1WM2xGSlBoU0hiR1hON1pNejJhc1JhMGNId240MHVaeHltazd5?=
 =?utf-8?Q?xuT+MdOOmRKrQKsdlt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 113ada8b-ef76-4cca-ea77-08de793574b6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 14:59:23.4308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IC2Y4rfv2XJwN/ANgiUl0jYlD+9Pkesr4gLs0PX2xtI4viBozudtqGRQCBf80Uee
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6893
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
X-Rspamd-Queue-Id: F2AEB1F1EAE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:ju.orth@gmail.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.osipenko@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:juorth@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,kernel.org,suse.de,ffwll.ch,collabora.com,oss.qualcomm.com];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:mid]
X-Rspamd-Action: no action

On 3/3/26 15:53, Maarten Lankhorst wrote:
> Hey,
> 
> Den 2026-03-01 kl. 13:34, skrev Julian Orth:
>> Consider the following application:
>>
>>     #include <fcntl.h>
>>     #include <string.h>
>>     #include <drm/drm.h>
>>     #include <sys/ioctl.h>
>>
>>     int main(void) {
>>         int fd = open("/dev/dri/renderD128", O_RDWR);
>>         struct drm_syncobj_create arg1;
>>         ioctl(fd, DRM_IOCTL_SYNCOBJ_CREATE, &arg1);
>>         struct drm_syncobj_handle arg2;
>>         memset(&arg2, 1, sizeof(arg2)); // simulate dirty stack
>>         arg2.handle = arg1.handle;
>>         arg2.flags = 0;
>>         arg2.fd = 0;
>>         arg2.pad = 0;
>>         // arg2.point = 0; // userspace is required to set point to 0
>>         ioctl(fd, DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD, &arg2);
>>     }
>>
>> The last ioctl returns EINVAL because args->point is not 0. However,
>> userspace developed against older kernel versions is not aware of the
>> new point field and might therefore not initialize it.
>>
>> The correct check would be
>>
>>     if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE)
>>         return -EINVAL;
>>
>> However, there might already be userspace that relies on this not
>> returning an error as long as point == 0. Therefore use the more lenient
>> check.
>>
>> Fixes: c2d3a7300695 ("drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs")
>> Signed-off-by: Julian Orth <ju.orth@gmail.com>
> 
> I'm not convinced this is the correct fix.
> Userspace built before the change had the old size for drm_syncobj_create,
> the size is encoded into the ioctl, and zero extended as needed.
> 
> See drivers/gpu/drm/drm_ioctl.c:
> 	out_size = in_size = _IOC_SIZE(cmd);
> 	...
> 	if (ksize > in_size)
> 		memset(kdata + in_size, 0, ksize - in_size);
> 
> This is a bug in a newly built app, and should be handled by explicitly zeroing
> the entire struct or using named initializers, and only setting specific members
> as required.
> 
> In particular, apps built before the change will never encounter this bug.

Yeah, I've realized that after pushing the patch as well.

But I still think this patch is the right thing to do, because without requesting the functionality by setting the flag the point should clearly not have any effect at all.

And when an application would have only explicitly assigned the fields known previously and then later been compiled with the new points field it would have failed.

It is good practice to memset() structures given to the kernel so that all bytes are zero initialized, but it is not documented as mandatory as far as I know.

Regards,
Christian.

> 
> Kind regards,
> ~Maarten Lankhorst

