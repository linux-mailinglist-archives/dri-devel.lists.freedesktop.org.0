Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D4FD07A8E
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 08:56:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9724310E24F;
	Fri,  9 Jan 2026 07:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="o7B18pkv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011004.outbound.protection.outlook.com
 [40.93.194.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B9E10E24F;
 Fri,  9 Jan 2026 07:56:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tpm4x9DU46tR9E5F592Fb4LZQ4jsltbFpx6WR9aEiw4ZK4sAkI+HknlMznCC3odgLf9bmkVkpKqE3VK6QkM7KRRncVP3+SsVGSjg7rYLfvxU7XZMIeBvw0RxpMpIJvQahaKo0ge2irYY4v56DlXtcDxKXVOB+SA27556PVWCGivbXRgSA/bSSDytZykNyLzIruC4XmCZbzFyJwJEL8rmUEQaXxeAVq4opf+narNtv9RuwchllHVuFxacONAJLxKMS0qs2YoB+kc8pRvbGrGG5QPNeDbwfjOfIcAx+O31v4rPbjKx8DRz8FvIfUSuMcX3Y6I8/0jwVCZ2Gkl0qWmRKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ree1SLeF8cbTuD0Ww5//vNLZSfv6sT02vIoy4ulh5vA=;
 b=FzuTNLUkuFCZ+GKHRmF6PRPXDztYRiF990PlNMlN8QK0oc++sXiT0otvO5btxi2MjwJPQW/tErg67MaqiAlF+Z9nkrgENvVS2chDi8mWmTG+K2R3p1wx29h6LWlaQ0sabQQI7dy3Fiajf6pBMX8cBxzpuF6UQAT+Qk1nfCU/Obz81Z5nCnVcW9+3GkKzCgauOWoj8F/6OYDD49lIL6klHyGfx4LmRpBnuMXVAqbU75U/rjRDrEOJkq+5t/HJzmk4M/mnXAZCTeRXit0OWQggQTYp37LMlgX788jClYwKRdkZ/wYRhm7SPUEyxPJPLblwIW3lWXn0LxjoBQvH7bJgEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ree1SLeF8cbTuD0Ww5//vNLZSfv6sT02vIoy4ulh5vA=;
 b=o7B18pkvGoApOHbnB+x5GeKK2p4HRr6bIB7kCOfKgLlNU5QGTYlZUshTScelFH48UvSYprHSJX2rg3s/4Z5/c6jEJhY+qB7tnFFv9IwWGk1Ub7vsNql64Pv1tc6pGYyFyK1XZBw2/J4gqrVxAvKrBDXpPP5p+TLgafjcOzFjEHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6446.namprd12.prod.outlook.com (2603:10b6:8:be::7) by
 DM6PR12MB4171.namprd12.prod.outlook.com (2603:10b6:5:21f::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.3; Fri, 9 Jan 2026 07:56:01 +0000
Received: from DM4PR12MB6446.namprd12.prod.outlook.com
 ([fe80::cc30:b21f:ce4b:4522]) by DM4PR12MB6446.namprd12.prod.outlook.com
 ([fe80::cc30:b21f:ce4b:4522%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 07:56:01 +0000
Message-ID: <b6004bee-ffef-48ea-ba0d-57b390cb771c@amd.com>
Date: Fri, 9 Jan 2026 15:55:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] drm/amdkfd: Add batch userptr allocation support
To: Felix Kuehling <felix.kuehling@amd.com>
Cc: dmitry.osipenko@collabora.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, akpm@linux-foundation.org,
 Honglei Huang <honglei1.huang@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Ray.Huang@amd.com
References: <20260104072122.3045656-1-honglei1.huang@amd.com>
 <64f0d21c-1217-4f84-b1ce-b65c1f5c2ef1@amd.com>
Content-Language: en-US
From: Honglei Huang <honghuan@amd.com>
In-Reply-To: <64f0d21c-1217-4f84-b1ce-b65c1f5c2ef1@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KU2P306CA0030.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3d::16) To DM4PR12MB6446.namprd12.prod.outlook.com
 (2603:10b6:8:be::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6446:EE_|DM6PR12MB4171:EE_
X-MS-Office365-Filtering-Correlation-Id: e39b6d3e-9a50-40b4-a5f5-08de4f5487ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zy82cjJPNXk4WHp0QWRtakIrVG8rRzVybHUrbE9pN2pzdjhIejhhR1NJcGhJ?=
 =?utf-8?B?cUFjWkJrOVltNjNJajNYd04vcGtYc0ZiVXF1YnpLYWZZdmdhdWUxakt1NEhj?=
 =?utf-8?B?bEorMjNOVFo1WkFTNEcxSGhiTFFadUQzemtrZnQ0VDlLQTFSZmxvSGd5cXJU?=
 =?utf-8?B?NHl6UVhPWnBQMDFIc2lEZFMwNU9uY3BPYmhiYndNcjVEREdtN2E3K2RIVnBa?=
 =?utf-8?B?QUlhZnh6MFBOaDhPTGw4UkJzeVc4NURVWFdyU3lrb29HVWFoOHIzUGNoMWNw?=
 =?utf-8?B?ZWROT0Y0c3owb2NndmF4S2JEUkhiZVZEV2ZmRzJDemRhNUN3RlBPVXZRTzVB?=
 =?utf-8?B?M3RPSlgxSEt3YVBuT3cvV09XS1A5NDMxc1ZVRllqSlp1cldnQnpNOG1HSXZV?=
 =?utf-8?B?RjU2STA2NkJOSFhPZ3h6ZjFBd0lRSlBmY2xoWExZeXFUREdKMjFHMXkzWURY?=
 =?utf-8?B?OWROajk2S3lJK0ZzRTdFbExPRno0Z01nVW03TUJ0bEN6NW1vNFhXN3dvWllY?=
 =?utf-8?B?ZEVNZVlzRHJRSGE4QkNsN2pYNGxPK2t3QnFwR1d4ZGNjandKK3pQZ0xJTGND?=
 =?utf-8?B?YkR1ZXpoYnZ2ZkFaTm1hYXJ4MllMREFsd0twU0lQU25Vb21pK1pjamJBc0cw?=
 =?utf-8?B?Q3AzWXRZOGVnd2tqSWFtb3JMaVFtOXBUdU83Qlc0YTZVdFhLdnZxRy85SGoy?=
 =?utf-8?B?WFRRLzdoWFNxQ0NXanQ3RTd3NWdGRWRaTU5LYzMxUDFoMVlCU09lOVM5TVpn?=
 =?utf-8?B?dzRYWlNIa0ZkQkZFeXhsMHNKQ2l5Qm03Zkh1SDJGZ3M4RWhuSDhwRTJwSTRo?=
 =?utf-8?B?WkdwZ0ZkVm9RUEQxNEVRNGlyL3dsUHQ3dmZCdjhDY1liMWlHeW9mWjE1T3ZX?=
 =?utf-8?B?ckhYR3UzN1RyNDhhU1NINENuR1dxNmRrSmZYejVxamloM3luL2lubGNTWTE3?=
 =?utf-8?B?OTl4SUhkSktXWmVRVVlwOHFMbE1GNGRSMU5VVVhZbkNjdmpZeGhZWWtwZEwz?=
 =?utf-8?B?M0czM1ZMM2RlOWk1NGIyMXYrWXJ2aTZHVHcrczZvdmdtZFNQOTV0VDE4THZm?=
 =?utf-8?B?a2drZlpTczEvTVFOUHZ0VzRTSml6NzludzF0V0ZjQ2FobEpaVXlxL1Y2R0dp?=
 =?utf-8?B?Z3RrNGk4eWpPUEowRy9QWTltMDBBYnZwWXRmRzlPSUpiQjdLSDVwRHFubmxq?=
 =?utf-8?B?a1dXQTVkc3YyYnlVNzcrTmdra3FidXF5VllGSDFxZWxDSUMzZ3hQaG9GK3N3?=
 =?utf-8?B?T29lN09GZ01VVDRHckdPdHRVdjM5UEFUM3RmMzFrbVhxNmtzMnQzM0xCQmJa?=
 =?utf-8?B?RUVOYkJmRzk1cFMyTDVZUlhLN2pHN2V4MzQydW1RbFJTWVB0cmd2amRiaHJR?=
 =?utf-8?B?UDU3Q0JvQUVET2c5ZEo1NnNjUTZQK0dIOFVpbkYxZW1VN1p2ZXZ5bXp3ZHp0?=
 =?utf-8?B?RjBuSXdZOVVnU3k0c3VudHBoMmFvUnZPOVBOeTZOdlovN0pLU2srNUFRSzRB?=
 =?utf-8?B?OEZ4NGNXem9yNDhBQUtQUEx6WnlRMEwzQW5oWFJGRWw3UjRzdkVXQmlGMStj?=
 =?utf-8?B?SkxCdThHazFNNlVWYjFrd1JjSXluZXBIYXdyRTlBMkI5VW8wUkhOczV2VTk4?=
 =?utf-8?B?dndBT0ZVRFF3VGVjL2cvN2JNVFhQMHlQUUd1RUxLSmdWWkE2SzBGRmtoU3p2?=
 =?utf-8?B?eDVRVzNZK2loQWpuK3NaMWdmRmZJalhkd3pYZ2JGTDEwTG9yNytzcHp6Zzho?=
 =?utf-8?B?bk9ZMHJodDIvcEF2SkhDbTFhQUJyWVo5a3JadzQ5OUFJNVVIbXhuelB5aTFv?=
 =?utf-8?B?OFIrZUZLbXZtTGNEQTRWQ0hmbEVtcGtOY1pRN1RxZ3VUZExaQWxuNzl2dTlF?=
 =?utf-8?B?TmJBZG5PcksrMjFGTXUrajdjbjJOUkFBRXVNTGJxR2JTUENMbWNqazFRNHRj?=
 =?utf-8?Q?AHh2vSncXQCiUFPVjUQBRJxNYWF2zV50?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6446.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THI2NkwxbFRLeE9RUS83T094NEoxZWZwVktDRGZDQVgwaVZSS2RzR0RuYy9N?=
 =?utf-8?B?OC9XQU9DemJXY1dmSkhPa2EyaEQ0K1VsVEhLdVhjN0h3d3l4bUdoWG5SdERr?=
 =?utf-8?B?VjBRWUkxMDNxK25iSU9ET2xHdm4yQU00Z3RXaGhYbUwwREtUMmN6VFR2QkdH?=
 =?utf-8?B?VG96dE1ORlN5WEZsWEdOeVB2NnZwSitpVkM3cjV0b3JTWE9rNHRBd0IreGNL?=
 =?utf-8?B?SjFWK1V3cWphcDlnbnFxVzZVeVVuZ0d1SHFVekhPaHlkSDRZZnlVNkc5ZUhE?=
 =?utf-8?B?UjZwdHVOUHNuaWNJYi80ZjREZTZpUUtQYmgybGt2WTNUZExPSS9od2NOYVFX?=
 =?utf-8?B?RXNsVmFoSU5HcjhmNHBwYUdJTm8rdzdmU2NtSjRTOEprZXhHSVE2VlM4aklW?=
 =?utf-8?B?U2hrS0x0SlNlQy83OWJTbUMzbDNrRVRHMHNINDI3TGpCRjZzbXlsb1FpOENT?=
 =?utf-8?B?a2VVdU5hT2MydmUvT2NHb1lyUnJUcEZhN2VERGQyUkZrdEJJWldubGt4UHpN?=
 =?utf-8?B?ZHJmZS9jWUVPa1VuRDRNZlNwKzJ2M2RFd0xuNUN6QkNoQVlmcUZrTFVaa3Q4?=
 =?utf-8?B?Q3RqYldIMVlERVVQV2lpS2NNRm1wZFphS2VWckYrMzNMNnBWK044MWdTNVY5?=
 =?utf-8?B?MkIrdFV2RkdLYWEyN2tpS0VIa2E3T0djZ2FtVWE4T3IxdEw4WWhtOEwyNkxn?=
 =?utf-8?B?a2Y5K1JVU2FscSs0TFo5L1BuM1BnNXl5anJXa2xTaGIrdjFpTmhNUXZ1TnFv?=
 =?utf-8?B?RlVQRDBVK281WU1CdTh1VVY0SEcxODNwNVZqVEJmbVRvRU1CelNWZWVLR1g3?=
 =?utf-8?B?cXlHTWxtZTJhbXdzMndGZWIzSW9Ub0JZcEFHdjVHNEF1NWlIZUJqWFRzRWty?=
 =?utf-8?B?NTF1OFVSWmRDU0dVUm9QdGRqVWlmdFlvVzNCTDE0T05vanZOYi8yOVNUT0RV?=
 =?utf-8?B?QlpiUFhjZzh2ZHlNUHZuT1Avbzh3OGRBbVVaek9WUDI4N0NhZDRNZENDQ1Y5?=
 =?utf-8?B?SlAxVE0wNElPT0trVUpsZkFDME9HZk9MRVZ1R21ORTIzYXRLMHRPQUl5dU03?=
 =?utf-8?B?RzdFRUNLbFJRWW8xMkpkVWVyS3JRcnNHY1pPbmNJWFlsaGxvK1BvZDRvRGVr?=
 =?utf-8?B?VlF2NXBsZUVLRUg4QVlXSzBOVWI4aXUzY1NyMm9FNENINWpoVGNVdHE4MHhT?=
 =?utf-8?B?eEVRaFV6Q3hKYjQ2ZkNXTUIwTXJ4WHlmNmtpUzhIVFBkTEkxNTlGQzU5REhW?=
 =?utf-8?B?ZXY4NVFOREU5bDk1M3BvdFZUSnRXbng3UGVSNXVKRCt4VUR5dG05ZGJsaTN0?=
 =?utf-8?B?ZFpFcTlFdHpvMU1lTnJIL09tTm1LZTlMcHdEai9hOGI2YXRNOEhSMnJBcnhM?=
 =?utf-8?B?WnljVVJCeWc3c29rT2M4bUlVNjBjOWNqOTdYUnJtVGpYc1lWd0NEeUwyalF1?=
 =?utf-8?B?Wlo0ZEVHQ01PNXhTZWwwdnRFaCtlSUdJNzdWb3hYVjNKWGp0ZjY0VnY1dUZW?=
 =?utf-8?B?NjNCTU5FazNUdDl3dHhQOGRtNFcwWmdHR2lvVWtpTjdIVTBmbkl6KzNUNlor?=
 =?utf-8?B?NUthOXRnZWdzbGZyMGErS000d0E4c3UxSHZ6SzJReHd5LzJrcVo2YjJUbXcw?=
 =?utf-8?B?SUtpN09JUHQ5ZUtSWUNaOFdPK3Fhdlk2SUVybUlJTTZNMTBtVHdsY3ZqV1BK?=
 =?utf-8?B?YkxLVldPY2grNWJXV1praFpyQU5QQ3llOHZRbkE2RjUxb2ZQSXRpSUtFdklp?=
 =?utf-8?B?d3BzOTBWa2JHeFlSYXUyek1uRjZCZE9NcU00bzR5bWlKWEp3cXh5dFdBc3NI?=
 =?utf-8?B?ZG1HK0ZKZmZVM2Z1L2FLcEpEbHY0MXc1eGNJTWV0NVFsVkdRVWt3WkJKTU53?=
 =?utf-8?B?dVNSZjE1Vk9UUm54V1BzVGFRNWhBbU1ZTU16dGVDWCtHTzg1d0J2eU53UHVi?=
 =?utf-8?B?R2JRcGV4eDgwclcveDY5dm10WTMyM0FhVGJidVk0TjhtWjBsdThIQWFBb2tl?=
 =?utf-8?B?MHJSMFJodHEybkVXd2lCNDlHMXVUekZzZmxIQW0wL1Ixcll2Nmhxc2NYUFQ1?=
 =?utf-8?B?eG9sRlNrQ1ZzVUJTb0ZFWmhZaE85WGp0UmEyNUpiU1F2SmoxcUpweDNUcmVR?=
 =?utf-8?B?a28wbXczZHFFcXJMSm40MW9wWGF5OWFWbE92M1NaeWxtRVFHdlhvdFdDakV4?=
 =?utf-8?B?L056UkxNQ2xjTjJFLzhLZEFDZ1ZRWnN0bmFNOWEvOGE4UFZsYkdGNFlZVklP?=
 =?utf-8?B?cHJWaVh1RFpoRGtRcExnS0ZKTXY0Wm5HZkxQdGVHWmxCZk5jZWtFSEFVUTN2?=
 =?utf-8?B?N3lZZlNQSkNnQ3F5WGtEeXpEZmVsVEEvQ1Jjb1JjNkFEYmlPajZRQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e39b6d3e-9a50-40b4-a5f5-08de4f5487ef
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 07:56:01.2626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6+LUR7xUW0iLS6Qd/x14GIwph4bThPRYmCsaEWq0A0HZ2uOuBRTXRqUHkDpLdRYuLlciHOWkZO6ms/Z5GJSEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4171
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


Hi Felix,

Thank you for the feedback. I understand your concern about API maintenance.

 From what I can see, KFD is still the core driver for all GPU compute 
workloads. The entire compute ecosystem is built on KFD's infrastructure 
and continues to rely on it. While the unification work is ongoing, any 
transition to DRM render node APIs would naturally take considerable 
time, and KFD is expected to remain the primary interface for compute 
for the foreseeable future. This batch allocation issue is affecting 
performance in some specific computing scenarios.

You're absolutely right about the API proliferation concern. Based on 
your feedback, I'd like to revise the approach for v3 to minimize impact 
by reusing the existing ioctl instead of adding a new API:

- Reuse existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU ioctl
- Add one flag: KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH
- When flag is set, mmap_offset field points to range array
- No new ioctl command, no new structure

This changes the API surface from adding a new ioctl to adding just one 
flag.

Actually the implementation modifies DRM's GPU memory management
infrastructure in amdgpu_amdkfd_gpuvm.c. If DRM render node needs 
similar functionality later, these functions could be directly reused.

Would you be willing to review v3 with this approach?

Regards,
Honglei Huang

On 2026/1/9 03:46, Felix Kuehling wrote:
> I don't have time to review this in detail right now. I am concerned 
> about adding new KFD API, when the trend is moving towards DRM render 
> node APIs. This creates additional burden for ongoing support of these 
> APIs in addition to the inevitable DRM render node duplicates we'll have 
> in the future. Would it be possible to implement this batch userptr 
> allocation in a render node API from the start?
> 
> Regards,
>    Felix
> 
> 
> On 2026-01-04 02:21, Honglei Huang wrote:
>> From: Honglei Huang <honghuan@amd.com>
>>
>> Hi all,
>>
>> This is v2 of the patch series to support allocating multiple non- 
>> contiguous
>> CPU virtual address ranges that map to a single contiguous GPU virtual 
>> address.
>>
>> **Key improvements over v1:**
>> - NO memory pinning: uses HMM for page tracking, pages can be swapped/ 
>> migrated
>> - NO impact on SVM subsystem: avoids complexity during KFD/KGD 
>> unification
>> - Better approach: userptr's VA remapping design is ideal for 
>> scattered VA registration
>>
>> Based on community feedback, v2 takes a completely different 
>> implementation
>> approach by leveraging the existing userptr infrastructure rather than
>> introducing new SVM-based mechanisms that required memory pinning.
>>
>> Changes from v1
>> ===============
>>
>> v1 attempted to solve this problem through the SVM subsystem by:
>> - Adding a new AMDKFD_IOC_SVM_RANGES ioctl for batch SVM range 
>> registration
>> - Introducing KFD_IOCTL_SVM_ATTR_MAPPED attribute for special VMA 
>> handling
>> - Using pin_user_pages_fast() to pin scattered memory ranges
>> - Registering multiple SVM ranges with pinned pages
>>
>> This approach had significant drawbacks:
>> 1. Memory pinning defeated the purpose of HMM-based SVM's on-demand 
>> paging
>> 2. Added complexity to the SVM subsystem
>> 3. Prevented memory oversubscription and dynamic migration
>> 4. Could cause memory pressure due to locked pages
>> 5. Interfered with NUMA optimization and page migration
>>
>> v2 Implementation Approach
>> ==========================
>>
>> 1. **No memory pinning required**
>>     - Uses HMM (Heterogeneous Memory Management) for page tracking
>>     - Pages are NOT pinned, can be swapped/migrated when not in use
>>     - Supports dynamic page eviction and on-demand restore like 
>> standard userptr
>>
>> 2. **Zero impact on KFD SVM subsystem**
>>     - Extends ALLOC_MEMORY_OF_GPU path, not SVM
>>     - New ioctl: AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH
>>     - Zero changes to SVM code, limited scope of changes
>>
>> 3. **Perfect fit for non-contiguous VA registration**
>>     - Userptr design naturally supports GPU VA != CPU VA mapping
>>     - Multiple non-contiguous CPU VA ranges -> single contiguous GPU VA
>>     - Unlike KFD SVM which maintains VA identity, userptr allows 
>> remapping,
>>       This VA remapping capability makes userptr ideal for scattered 
>> allocations
>>
>> **Implementation Details:**
>>     - Each CPU VA range gets its own mmu_interval_notifier for 
>> invalidation
>>     - All ranges validated together and mapped to contiguous GPU VA
>>     - Single kgd_mem object with array of user_range_info structures
>>     - Unified eviction/restore path for all ranges in a batch
>>
>> Patch Series Overview
>> =====================
>>
>> Patch 1/4: Add AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH ioctl and data 
>> structures
>>      - New ioctl command and kfd_ioctl_userptr_range structure
>>      - UAPI for userspace to request batch userptr allocation
>>
>> Patch 2/4: Extend kgd_mem for batch userptr support
>>      - Add user_range_info and associated fields to kgd_mem
>>      - Data structures for tracking multiple ranges per allocation
>>
>> Patch 3/4: Implement batch userptr allocation and management
>>      - Core functions: init_user_pages_batch(), get_user_pages_batch()
>>      - Per-range eviction/restore handlers with unified management
>>      - Integration with existing userptr eviction/validation flows
>>
>> Patch 4/4: Wire up batch userptr ioctl handler
>>      - Ioctl handler with input validation
>>      - SVM conflict checking for GPU VA and CPU VA ranges
>>      - Integration with kfd_process and process_device infrastructure
>>
>> Performance Comparison
>> ======================
>>
>> Before implementing this patch, we attempted a userspace solution that 
>> makes
>> multiple calls to the existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU ioctl to
>> register non-contiguous VA ranges individually. This approach resulted in
>> severe performance degradation:
>>
>> **Userspace Multiple ioctl Approach:**
>> - Benchmark score: ~80,000 (down from 200,000 on bare metal)
>> - Performance loss: 60% degradation
>>
>> **This Kernel Batch ioctl Approach:**
>> - Benchmark score: 160,000 - 190,000 (80%-95% of bare metal)
>> - Performance improvement: 2x-2.4x faster than userspace approach
>> - Achieves near-native performance in virtualized environments
>>
>> The batch registration in kernel avoids the repeated syscall overhead and
>> enables efficient unified management of scattered VA ranges, 
>> recovering most
>> of the performance lost to virtualization.
>>
>> Testing Results
>> ===============
>>
>> The series has been tested with:
>> - Multiple scattered malloc() allocations (2-4000+ ranges)
>> - Various allocation sizes (4KB to 1G+ per range)
>> - GPU compute workloads using the batch-allocated ranges
>> - Memory pressure scenarios and eviction/restore cycles
>> - OpenCL CTS in KVM guest environment
>> - HIP catch tests in KVM guest environment
>> - AI workloads: Stable Diffusion, ComfyUI in virtualized environments
>> - Small LLM inference (3B-7B models) using HuggingFace transformers
>>
>> Corresponding userspace patche
>> ================================
>> Userspace ROCm changes for new ioctl:
>> - libhsakmt: https://github.com/ROCm/rocm-systems/commit/ 
>> ac21716e5d6f68ec524e50eeef10d1d6ad7eae86
>>
>> Thank you for your review and waiting for the feedback.
>>
>> Best regards,
>> Honglei Huang
>>
>> Honglei Huang (4):
>>    drm/amdkfd: Add batch userptr allocation UAPI
>>    drm/amdkfd: Extend kgd_mem for batch userptr support
>>    drm/amdkfd: Implement batch userptr allocation and management
>>    drm/amdkfd: Wire up batch userptr ioctl handler
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  21 +
>>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 543 +++++++++++++++++-
>>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 159 +++++
>>   include/uapi/linux/kfd_ioctl.h                |  37 +-
>>   4 files changed, 740 insertions(+), 20 deletions(-)
>>

