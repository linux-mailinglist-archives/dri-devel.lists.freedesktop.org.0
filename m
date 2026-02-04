Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMUNHouhg2kLqQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 20:44:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D846EC311
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 20:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE8010E765;
	Wed,  4 Feb 2026 19:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5t6HlYrA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011036.outbound.protection.outlook.com [52.101.52.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473E810E767;
 Wed,  4 Feb 2026 19:44:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SN0l+PUWpriclQ93FG37yC3AVc7iMrGBqsyb0hy36fjSuJ7B3hq8dbRyfBe4LghnuLvmfQ0LKKON4BjoXL65BpzX8PZ5pqaZ/xIsw0d8hFcoHntoO0lDqRVFPtKVrIyDCvKs8/CY6O8GNMRMrVBjt2l6CepUxt7l6F8DsfpQqj3jcOBrnDbwHlq56LA02ECoHnlUDTu0v5pbanAaqyrIsbERbats72tDDahpkrSH8mpEXxoNHziLjvkbKtnOEWYPILO0OqkozHXKnNp7gqT3ECpFc3fJGys7OEbLzbrl2EvtRJqFc/tVPUzm5T7qx6YXx/T26zFaFS4G6tXqPi9FCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouFeZCH4EDu0Zr8I2K6ebaMRiHlr4n7EtHjIvP3IstE=;
 b=NtuVLNAG7kiPp5xM8Y/cpBSqqBMa9XcUBc06zUdmsQrp3+u7R13RiKQMP3YlfxTEReeZjS3SwlSmjUgmH5FzqL8E5N5+ww7+rrE/5SBSdHluMlZgf6vFiw2bi0tbPaepA36YtSZ6iKGhxkdSU2H3o3wKUIm+/l91UHdLmr91b5EgO0EA8U9o5704fsLSsNjK+Xqw4dX9EQOdfxCLH+jJw23p5EI595KKpZQqDKgTVQPskce2mYQThZxKRbxzf4qTdXF6fDpcCwgKcj9XClBzWejNteBKhMtwiNeM/mNmFXyGnwwIDSXhSoScubQjgSKDK2Iy3qUKJHKnaVxGMb8nmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ouFeZCH4EDu0Zr8I2K6ebaMRiHlr4n7EtHjIvP3IstE=;
 b=5t6HlYrAYiTAa43gRCcjE0/H7GdM1I17bzu6L4ICl1La6pQQu+3KAw96kOFd4Nm5B0rO/744EZOh8FVbQjvGGJJah7OV/Ch6AzQ+yX5fXjCRYBz3MaFDDyi9qdLrhC/+CYdDq0AVp0RowGKiORoxNLX7Y1UpfYG7747Zq1lUXi8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DS2PR12MB9799.namprd12.prod.outlook.com (2603:10b6:8:270::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 19:44:03 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 19:44:03 +0000
Message-ID: <00fc5199-0f6b-4b05-8825-f7ca627890a2@amd.com>
Date: Wed, 4 Feb 2026 12:44:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: expose plane blend LUT in HW with MCM
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20251209151032.91738-1-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20251209151032.91738-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0017.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::22) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DS2PR12MB9799:EE_
X-MS-Office365-Filtering-Correlation-Id: 8662e902-62a2-4ed1-dc7b-08de6425c004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXQxS0Y4cHZ2YWxFNVlMTjJ4Y1FMaU1TN2tmSFMxYXF2Z1Qyb1lKMDZoN3Vn?=
 =?utf-8?B?V3NSRGNabkpwMHR5cG9QbVExQmt0WmhZRHpib3FVRkJkTEw5WHZ4Q1NTdnlW?=
 =?utf-8?B?MERtYjF3L2RmQStPNUhQOUFHNEgzNVJKeG1FUEU4djRkZkxiRjBoNWZoSWNo?=
 =?utf-8?B?Y281aUpLSHFJYzFSZGFPc0NpcExZRU1ic3NKdE44YTVuOUl4OXZMUmZWUEpR?=
 =?utf-8?B?NUwxbUlFbjdkNmlyWWNIUllEVzZDajVmN0pDS0dXcnFwc2c3YmZsR3pUYW54?=
 =?utf-8?B?SmNaemtzMU5xZjhrN2dzYjRXYVAxQllUODlGMmdYN1ViNDhEMlFNVXFYZnlD?=
 =?utf-8?B?SzRxTGN2V1g5b2NvcS9TZGFCZDF0cjdTeXZiYTNtMlhHVkVoUHlqRCtSNS85?=
 =?utf-8?B?dERlT0FUMU9pVnQrQlJoTzFNd2g1MGZBUzBSLzZsR1IxSmJHQ3dBUXlKK2xK?=
 =?utf-8?B?N1lMUC95ZUE2VnZ5ZkNPdXV4UzhUdFEwcjltWHBVeEs3RkhyTU9wcHhWMTBi?=
 =?utf-8?B?TWxDYXNBbjV4MmFWREJQZEFnbEN5ZmZYbzRPQ1ZjR2J1Q2owVGRRdWpmanh3?=
 =?utf-8?B?YUpmL0F0UVhiVWF2RnpQNENTN0cwT1hBUmh1TmdIa25SRFRpOWlHbTBXdEhU?=
 =?utf-8?B?MU1zaXRLSDJYT3hpNzZCMXh1UmlHUW5vQTJBVHZITXNzK3BSMVozckVpT2pt?=
 =?utf-8?B?TnFkbHhCVFZSN1N2Q3JQZXRnSE8wU09sTTdwZktscGxqdjU4UUxTeGVYcjZj?=
 =?utf-8?B?cU5kNTAyVHBHL0kwMVFiOVd5Yll2cXlrNTBSVXhhYnE0R2hxVytIVzJjclRN?=
 =?utf-8?B?eGJDbWxETW1pTUJ2ZTJOQ3padStaR1ozR2NlVzVDaDNQamw3UVNTMmNvV2xw?=
 =?utf-8?B?OE9xSUNDMHRSZEF3RGVIOFZKaGxVbWcvL1hCaVVxWFhTM0wwVW5iMktlWTN3?=
 =?utf-8?B?UktKVDMvK3dTWmRVcDQvZ2FuVVYrY0NJT1FvbkFqN3JScUtFUTJneVBnbUpC?=
 =?utf-8?B?US8wSHBUT0htaktLZkdOZElybk1RVTIwaXlxdEFxTUplVmt1NjhqWEJ6U3Bz?=
 =?utf-8?B?eGNNZEtGNU5GS2QxL1dkcVFLTjVZdkhWQzRwN3JhQmpnZDJhM3NOaTczOGJY?=
 =?utf-8?B?S0ZHU00wYTdWdHBUTW9CcjhzaUZPbkpEK3puSEl4QXJTYXpPOUxRa3YxQUhV?=
 =?utf-8?B?SDVSOFZTU1JjSkFsTmZML1VPQjJNRG9NQTBzZUY4dDZmdWhKdktibjFhOWEr?=
 =?utf-8?B?Nms4UUwyRGJ1a2RMc29KRksyUEFjRUZvbHZSQlRnV2c2NDh0MFJiT1JiWWJQ?=
 =?utf-8?B?VmxGZjJGWjNRQ3Bya1Nsa2tWSlZKMTdGd2xqZVlJN09oZ3ExZ1VwQmNhdzJ5?=
 =?utf-8?B?VjFzUmhTZGIralozUkx4dkdvOTYwVzRCV0ppV1QyMXVlZnN1OXVNMCtha1dP?=
 =?utf-8?B?Ujc2TTZVVmFsbGFvbll0dVBEVTlVd29NT2lyajVscGtQazBtVWJCQjlEWXdC?=
 =?utf-8?B?eXlFb0duMlMxWHAwRGZYdWcwSHYvRmFtZmJVYitzbUR6ZWVJWUxSWVJxazN0?=
 =?utf-8?B?S2dGK2dzaUZ3WHYybWRZUWx6V1E2RktwQmNXWUtaSmp4WlpJdDlaOHlYbllj?=
 =?utf-8?B?d2lDaWNNS2srWnYzVDNxb2IyME5tRVQ3MGlCL3pLSGV6NFVIOWdCL1VET3V3?=
 =?utf-8?B?K3ovNGZDNmpnR2o1SXpab2dIK0xmakZTSWVZNFpwMVkxNjBnWjBTYWV1Rjdp?=
 =?utf-8?B?a0hTU1kxWUZiMlFER1FvNGNOU1M4RkZJM3NPSzdsN2ZyQjRsemJaa3h4UVRC?=
 =?utf-8?B?Z1lzeVJWNzdhT3Q4dmo3QXduR0FqeVVoLy9QTC9CZzhTYnlyVzhzZjE2U2hW?=
 =?utf-8?B?NVBhZTdYZGozS0ExZmNmenJOVk5jN0VvdHdMSndjOE5YcG15MVJhMUl3Qm9B?=
 =?utf-8?B?MDU1dlluNkRvdlY5SmowMVJFSG9zNFdvbkZtMzdGd2xQT2RuWkhNUVBGbFdx?=
 =?utf-8?B?dXpFRU5qcThHcjVYTHVITlFJSFZNNnpPQnFONzZJZWtSY1JCUHZKZUFYcmVO?=
 =?utf-8?B?bFpVWFJ3c2Fic3JxTUVxb3JKSkczc0VoZ1BXb2RGb0czZmpBOXo5dTJYTVNY?=
 =?utf-8?Q?CWqQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFJxV0FVMGZ1TzE1ekUzTTZpREJqdHJkbC9aUitHUjE4clVlTzVUWnNmMEVi?=
 =?utf-8?B?Mm0veE50MDBSVWlPOWd6L0pOcnUxRnFZSEhzMHRxdDBGWnJoa1l6M2dsL2Fr?=
 =?utf-8?B?ZjFoWmNxYXY3dDhwS1NDSnJHS2czS0NHeW9BNlJBRGpvS3ZpdEozK2lHdm8r?=
 =?utf-8?B?QnFtMS9ZcEhDNVZkV3U2bEFJTmJlU01lZFRVYnFuOXorY3IvdnRiZmNIbW1O?=
 =?utf-8?B?d3UvR2I0TmZIR0ZWZDU5NE93b29YbEt1eWdYczdCUTY5NHhrNEZZaTJSYjZK?=
 =?utf-8?B?cHNneGlVTzZadzBLenBHT08yTWYyTGhKVklXWmIwNHZocDBvaEZ5UVVoQThZ?=
 =?utf-8?B?MEZYTExic2g2M2ozdThLVHRhSU4yUFFsb3orK3F4RjBoc25Va3diQWNKaXBZ?=
 =?utf-8?B?Mml5eCt0bm5jNk44cTRmZTdvRFN0V0NVRjN6dW5VKzZjS3ZlRU1BbktMSEJ4?=
 =?utf-8?B?NTVpaURWOW1PUU1CcjRNZExudHlTRnlKRElSTFNFWElvOXlKSlJVNjE3dTRD?=
 =?utf-8?B?bTkxY1hSSE1Oa0lIT3RJNHlUUE5NZTFDdGJhbjRvVjc0WS9qZkpiK1I5VWo5?=
 =?utf-8?B?WkdvS0JYdFJJUmNoL3FibmpYeFJ6OG1OdW12RmpkK1JNejBlT2d4T2VDZllo?=
 =?utf-8?B?NmlCemx1TFhVdENMMVRndW44TFJ5c3lqakNqdkdQOHQvc0E0T29TVmVGZUdG?=
 =?utf-8?B?NzVsTGZjaXVwaS91YmtDR2UydDNaMHJ1cWFjcE1ldDVPR3MwV2Y2YUR3TE03?=
 =?utf-8?B?amdidVplZ2tvUFRYOWJZZzJPSW9Gdk5yTENOblZoQ3NaUmxQS2daMDU2Ui9r?=
 =?utf-8?B?RHNHMVNBbUFPVVFqdWNZZWYzQjhXb1h2NXNaR3k4OCt4WVIxTENaSmJFWVdC?=
 =?utf-8?B?VFRrUDN6M2xncHpSbzVNQjRDdzRCVjg3bVR0M05RSXkrOGZNR1VvQ01pMFZP?=
 =?utf-8?B?YjNlSzJzUjdDSDQxVnMrRmZaaTd5TStmcUd0a0M4eVZ4ZFlDZE9pb0t6UkQr?=
 =?utf-8?B?YjJiWkY4Q21iZkVaYjhqTzlYMHBwNy85bDR3VzhualFsc2xWWi9nSTFzeGZI?=
 =?utf-8?B?K1BRNC9meEc2cm9ucjNjUklxTkdJdkFZWFM1SzFqN2xxSng3d2pyc1AyMFFU?=
 =?utf-8?B?d3J3ekcrMkNGbVJIY0NzN0NORnBzLzlJNFdJUVN2Nm9JVTRFcWFCeVBGQ3Nm?=
 =?utf-8?B?OXB6TGxBckhhTEJlcnBqQU5EUkZGOThYNTEvSkVIbGYzOG1jcTIxczl5VTNk?=
 =?utf-8?B?dmFrU0NhU2hKRXVZWHdQWTJGb1Fmbm9WNUVUdlVNelUvaVhzWmY2WGx6bllJ?=
 =?utf-8?B?aXBGeE5JRlZ3Y1ZyMEhWQklsYmwwNjNmUFVrSWc5THFGQ2tNTXJMRGovV1lz?=
 =?utf-8?B?YjAzK2MvWTBmK0ZIUFRnQTVtOUNFSDhDWW5sOTVVamRZbUJab0VTK3JWM2Z5?=
 =?utf-8?B?cHQrWXFScEtyOXhLOEZneG1RQm9wNnZNVkd2N0lYWW44S3hDUmdtcWJ5U0Zq?=
 =?utf-8?B?NzN5NXZMbGdzUkZncFJzM3orVEpHYTRlV25ob1NsZlVCL3R0SVRCMzFjdmYx?=
 =?utf-8?B?U0dwWnFrNmtlbU5rOU4yS080aFhQUklzUVE3Ym8zbGE2ekRzOHUxQUMweG9R?=
 =?utf-8?B?b1R4TUU2cXNLUDVObTZNcU5kMWN1VzJENG9TU2t3NkJsR0MwVHVXSzNMRy80?=
 =?utf-8?B?NU4yaE9GSXBnNWJrNWd1L0lMdDhZNGRPL09EWEhydlJ3elFNd25nVHN3ZWdk?=
 =?utf-8?B?b1ZxNXNmZkc5RkFONDFqYjNtOW9kcVZVQmhqOFkwby9KcEc3b21tT2diNmJJ?=
 =?utf-8?B?dzF3YmNDZzhVOXBWWFJSS21yLzZNMENmUGRXQm1ndHVhVlB3RnpHQnVzSjdk?=
 =?utf-8?B?TStDcHpZcElveHJjYmpNeVNnNUw4WGV6OE5yZ1JXUmVZcVFQU1gzQWY2VVdF?=
 =?utf-8?B?ODgyQldpSlVSQVczQ201TDV5TGEzeXJkbjZHdnRjSlYvaCtnOUdSMXhqckw3?=
 =?utf-8?B?VWZ4UnR3c1lmVjRlM0VReVZQSFNwejFJTGZWZnRiVTZyMnZ4Ym1GaXZvY1lN?=
 =?utf-8?B?ZHpoeHdtYy83WFhqd3VpcVlBcmE0NFdRREh3R1VlTmpibVRWTktMTWozSVhX?=
 =?utf-8?B?MSsxUW5BaEdZWnduckNZMGg3WXV0dFg0aEw4M1VMZDc5TzB6YmtWNEg1bnlV?=
 =?utf-8?B?cnNpcFFLbkhIMlF3YUZ3WGtESkRvQlVFWTBvRTdLWE5xM1V0SE96UE56VmZR?=
 =?utf-8?B?dE91ZHF3TmhtK1REVG15VlJTcEJCWVJXdkpXbmk3U0xtMk0xdDNvRUtUbXhB?=
 =?utf-8?Q?6H7h+mMYt75uYxGOwv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8662e902-62a2-4ed1-dc7b-08de6425c004
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 19:44:03.3710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CnjkYY6ZVndgVia2/EWLpkoruo285E0ESeBDtDrvVoo8X8Qfe/6ybQG3a30gOoF1x0QHIoBpHglo1r6GoE3HmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9799
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[igalia.com,amd.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[alex.hung@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux.dev:email,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 1D846EC311
X-Rspamd-Action: no action

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 12/9/25 08:09, Melissa Wen wrote:
> Since commit 39923050615cd ("drm/amd/display: Clear DPP 3DLUT Cap")
> there is a flag in the mpc_color_caps that indicates the pre-blend usage
> of MPC color caps. Do the same as commit a0c3e8bfbab6 ("drm/amd/display:
> Use mpc.preblend flag to indicate preblend") and use the mpc.preblend
> flag to expose plane blend LUT/TF properties on AMD display driver.
> 
> CC: Matthew Schwartz <matthew.schwartz@linux.dev>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 56cb866ac6f8..b15f0cf86008 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1649,7 +1649,7 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
>   					   MAX_COLOR_3DLUT_SIZE);
>   	}
>   
> -	if (dpp_color_caps.ogam_ram) {
> +	if (dpp_color_caps.ogam_ram || dm->dc->caps.color.mpc.preblend) {
>   		drm_object_attach_property(&plane->base,
>   					   mode_info.plane_blend_lut_property, 0);
>   		drm_object_attach_property(&plane->base,

