Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 802DCD00475
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 23:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A34310E657;
	Wed,  7 Jan 2026 22:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i47nMDnH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013057.outbound.protection.outlook.com
 [40.93.201.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030D610E657
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 22:08:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PTp9pqsdMqx0gMwrcmRnLS3DqTijk8Tr0jrT2W3oMWQsEDcUAzaXZ09kr/mWtOxo6q3hEDAwOv+91JQ/coiU7WZFwWVJHSsF9Gcfr9RMCMfXNKaO+yY5Qc8VVCzEqjTLD9KGBx84nG0YXvBiaADrEpoGd9CJK6w30wqZKGD8bJ0cYy0pl0fHGu/jcFGEKMD7gys2MNREEczYa1mdzvdQM08H+FieGVSj+LmGCn53LC4V6d+G1f7FbiyNVhSVIPMFlRFRHbUVmpejLk19CVHAY93/8BD97Phpk9NC6dkO2oMq5nyqfnRgVOKbtaQDeO9bISNEEJMJh5weW3kkxysJsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ye+GHOPM2Jgeetkup4nJe1QWZiSoU2JgLOvKkFT+Z7c=;
 b=mxbsrLVHbqYrOu4nfvNB6gTPiWUXN23wFVtwWQxadOwqjWr7UO52y/oj78phj4lsTrh/IFYsessqYcZjTO/HQVXxLPrOCAd2C4y/TYWwLW/96T9haAnYkYrxLzZN2LRHWB7bwA93sCRH1ZGQQCVCoa5ipZ8dQUi9HCUDQTlW2EMSvcw/0YEx1NA6OSArCtazmsM3o7/+wou192E/j3CMC/UzUnpUlpZm0bEzSdJrq+vs002OFGezHchjl/pfJBcJYahjjyg4+D9CMMq/hfO8iyiXVTKYG+uNI6WKnnU3VbMYXeuKCf5RgOvgagfphYHwD0+sryRH/BFHnQXg/GpYqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ye+GHOPM2Jgeetkup4nJe1QWZiSoU2JgLOvKkFT+Z7c=;
 b=i47nMDnHAkFIVKaZHOPqjnafKETIA5DU+iFixwRL8Yh77WSOv1pBq+sKSzKyaRTLvt7BKiLGLVPKXe4wWpArC+tnemJjKDxJ9VhnsX7OcELTyYBDKJs+vy8+ASgHLWofZrsi9Ap9mokITLSMJV3F7LBsHtX9wS00vWQ9w3LgodU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS7PR12MB8345.namprd12.prod.outlook.com (2603:10b6:8:d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 22:08:14 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 22:08:14 +0000
Message-ID: <33765a47-b37f-4435-b12c-c1d712ebc194@amd.com>
Date: Wed, 7 Jan 2026 16:07:51 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/2] accel/amdxdna: Update message DMA buffer allocation
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251219014356.2234241-1-lizhi.hou@amd.com>
 <812bcf91-d903-410f-91c8-8a71be3f3f02@amd.com>
 <1b8b49a7-762c-f530-3744-231beef9942f@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <1b8b49a7-762c-f530-3744-231beef9942f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0105.namprd11.prod.outlook.com
 (2603:10b6:806:d1::20) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS7PR12MB8345:EE_
X-MS-Office365-Filtering-Correlation-Id: ec988638-5902-49ad-d34d-08de4e3940b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkgxekJPRjV3a2NEbUtuVmE5bW9lNVBuT0xDV0k5MGZmanRWWUVKMGNBa3k3?=
 =?utf-8?B?VSt4RnBIMGlUaUd2cThQSTFSUjYwL2l6VUVyc3JnKzNtV1AvaDRiRzQrR0la?=
 =?utf-8?B?L251REI2dkhscmYzZE1CY2dUTGIrVDZxTXdwbmc5TG5ITTFzRmgvZGg5M1dS?=
 =?utf-8?B?WlFlYTVZMEhja1M0Z3RnL0NJbWw1SjQyckwxcVJ2TmFSVHRQMk5JaGIrT3JX?=
 =?utf-8?B?a1VDbUp5MHkxUFF2MlpvWUJ4R2VKR1JCd293dnBFT0w4WHlTdTg0N3pqSkpl?=
 =?utf-8?B?WDlscnMxQ0V3MjJ3WE93VHQ5N3FlZjcyK1dVdWNKY1pFZmwyMWN0TEdjb0ky?=
 =?utf-8?B?azNJK1NxRmxWdXVVVTlpc3k4bTM5dEcyR2V0NmcxMkVDZUpOY2VGWk5qb0V4?=
 =?utf-8?B?M2Q0Z1pCZ1BWYno0a3N6ZUwrYWkzZHp2S3FpSkg4YWY4dmdlVDFWSEo0Z0sv?=
 =?utf-8?B?QnF5LzZxczdVbXZNRVdmQ1J2NU4xZVZwd1NpWVlpLzdCdUQ2S2dQNTl2QkpP?=
 =?utf-8?B?UnhPQjdJTFNqMnJndFFWWjI2QzhZYm0rRFpiNzNMT2xZNmZEdGJDSmtUbkVB?=
 =?utf-8?B?Y1VFeFAzL0Q3d2dBR3NhOTlmWHR6dXVpRjRxZlhvM2hLWWs3RGllMXAvK054?=
 =?utf-8?B?blpkRzdyK3NwVzF6dlROenhlVzVxVk9CcjF6bE1VSWpLdDdra2JQaGxtd0U4?=
 =?utf-8?B?T3dseDFrTkhzbVdHT0s0ciswQVlQTGpBVDBkU3BVNlYzeXltQkxUc1lacWln?=
 =?utf-8?B?b3N3OWE1TGhoLzN5cHE5MDFaTVViZ3MwQkxFc1ZVRFZXY2NsaENoRWtocUc4?=
 =?utf-8?B?bEN1YnhpbjUrcXV4WUh5RXVPS2E1TE41M01oVVYwOHJrNEwzMnZTUWlsVTd3?=
 =?utf-8?B?SXUrb2RkUDlkSzVQY2ptRlRuNkoycXdRYXBrbitVTjlSdFQzOHZ2Z3hMdjVW?=
 =?utf-8?B?MVV0TTlMemxOcDdlRk01KzE2aG5oOXlLNVBQd0ZrWEIyRVFrQmNadXQyKzFa?=
 =?utf-8?B?TkFJTG1qWnIxKzBFcnVBYmIxM0JRaUlEQW5BN0NSSjRoN2dLWVRCVmd5RURN?=
 =?utf-8?B?a3kxWFB5UnFXcEh2R3ZwNFlmUkkyMDhYekpYSE5FNFphK054KzlxUnhIM1hl?=
 =?utf-8?B?SzRhZFd4TEVNdlpKaWxxbEtvQ1pBMTJDVXlna0h4YzQ2S29OT0p3aVBlNE9q?=
 =?utf-8?B?elFmKzRTc3cvUXMyOGd5RVl6WUcra1ZqY3FVWWs1ZkJPNDllMmtRcndvUDU1?=
 =?utf-8?B?Ylpnby9qQUpYTVJkM0ZQZS83RjNJNDBNYXhKOElMbTNxM2pFQk5WY0M3anhJ?=
 =?utf-8?B?K3YzN2JiTUJ1cExZUnRwQWhlZTFwTzFlakhHQVVHNnFCM2tEaVB0cVI4UDZT?=
 =?utf-8?B?U01pSHNXRTRiMnlYOUJTUWlGOW9ud0o0dmJmaExPSUY4YjFSM25ERTVmRTUz?=
 =?utf-8?B?c1BHS1J0NnRlam0yL0FBNjRrRW45N0JMUy82M3JkNXFvSG1mdTBVRGpGUjRn?=
 =?utf-8?B?SzQveHpJRGRQYURCdXNoN04yRlo5NjVENUJkSEZPQVNQQVJOSlRaM3l1N1RI?=
 =?utf-8?B?RkNqSkdtVkMwRzQxekFRclNUVWpibHRURTJ2TmpVUktjcEdKWGkvWGxEYzhZ?=
 =?utf-8?B?WWErTldJd1RxUHlMNmloTUNYR1JUK2EvdTdpZVM2STRpeGNWa1d3VmdMblMr?=
 =?utf-8?B?amxnbUJCMmRYTTRaU1pWNHNWakM4anM2QmVzVDdqRElwYXVHejJ1NE52ZVdN?=
 =?utf-8?B?WGFVb1NkMEIzZGZpQ0JCSjZ5MmxNTjFWWVgvRVp1VmRrSmFRM1c1NzNMTjFG?=
 =?utf-8?B?SmdpcmNra3NCeThwdWpPakIyWWYxeE9MSGFGUDJyZXIyZzVVdDBLTmM0NVJl?=
 =?utf-8?B?UHU5QzV3ZG1FTlNVbDhjWUR1Z0xJRUU2cHFVTXM1azk2Uk9hWXVkNjlTL0Jj?=
 =?utf-8?Q?v+my97qfu+UKKapOFYP0gqqTrcbueoD4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTRCK3RTYTZGcEl3aGtMSTVOQUNZYlFzY3YxMk44cHZEeE5IWFpUU3U0OTM5?=
 =?utf-8?B?MTJsYm91WXN5QXdlREZuWC9iREpvbTRlaVptMW9rM0xMTWpnZ2NRNlVya3lj?=
 =?utf-8?B?MUhiclppTFhoQXJDRnV3TTFZUWdaZFo0MGtUQ2tCcnU4eWVWcTZjcDkwVzli?=
 =?utf-8?B?ZGNWbng3WXFVcXZPcm1RR3BsQzI5V3hTSHp2SGRwODhaRjBoVkwrcnhYVTBU?=
 =?utf-8?B?dGVJNDRRV3VQR2pmeTl4R25aSEJCQnZDSDdxNS9ZNUdMd2VXeEZ5dmxSeTFV?=
 =?utf-8?B?aEZnb1JZQ1Y3T09qRDhvcFRPZEpmcFZkenhkVHVSSy9JT21GWE01c2xJOTdM?=
 =?utf-8?B?REcyRVdyVkJJMEUvU2x4ak4wb1EwdnNtVWJybjhzOVMxbnQxbUdMQ3dxdnBn?=
 =?utf-8?B?RTBmUUNnRE9qbkF6V1pqb2tYUlRrNjJrVG9CRHgyaWNBcEpLVkY4TkpJMUJ5?=
 =?utf-8?B?RjhTZ3lRQ2JSZWN2OEtOd3F0VHJqam54TWRjWXMyUHRnalBOMExFOHVmdWYz?=
 =?utf-8?B?Q1d1THZ6R3hSTjhnT1hheC9rcVBKOHptWnRnZUNrcWpHNG43RjJBYkxidlRa?=
 =?utf-8?B?UDBYZGJhNFpDMWVjR2xzMlQ5a0dHNnptTEZUYm5rc1gzbERvdVFxTVZjU2sy?=
 =?utf-8?B?SFRzTlFHbW5qaDArZlFvYjFRdkNqUldTZmtBQWpHVXd0T2RLTmRtZGtueVB0?=
 =?utf-8?B?Z3dFYjJ1OTBzM2k5ZEJtZFp4QW41cytONjZOdG1tWXdDSWRwNjErSWFsSVNK?=
 =?utf-8?B?dXlmQ2Vwam5GcUFsUHB6NU44SU9ZNFpUaG0rdjFZSjJlY3h0R2pPM25vR1JM?=
 =?utf-8?B?a3BnamNCVHo0NllEVTNkNHJLVlRiT3dCVUVMcE5JOGdneU9tVXIzeTlOckM3?=
 =?utf-8?B?Zzlrak4rczRpWHVIVlVOc0o2QkhUL2xNVjRFWnhDYStsSW9teUYwTkUwUndO?=
 =?utf-8?B?OU83aENCUmE2ME02OTVDMEtOZzQrR1dVcjRCMXZWK0tmcUxWeDBuU0JLSm9O?=
 =?utf-8?B?MFgzL21LMXIyRU1QZ2xQa1p6Q2xKdE9hTUJ2MEZicUREZVpBZGFWR0xaalBZ?=
 =?utf-8?B?cjVQNjEwZlhDWTZFM0QyUnp4bHhyZ1E3bzdpdUFXM2pRT2RERWRIU1d6eDJH?=
 =?utf-8?B?bFF0bklacEx6bkRaenY1TUp4UUZPQm1rL04wWWFHK2d6dkRlZFcrWitnV29u?=
 =?utf-8?B?N2plR2psVmZmajJYb1Nab2xBOTVOTktJcXh0ME9SL082a3ZvakpPSktpUExP?=
 =?utf-8?B?U1VuUFBEMUhISFBxRkNGVlhjbG9RaUQvaUdHQys2NkNMck9RNXZkckVDMytH?=
 =?utf-8?B?bTRoUlJjcEs4d3djdUc3UjZlb1B3eFdHcngxSC9yZzM0aHo2dldOeHUydUJV?=
 =?utf-8?B?MkVnd0U2YjVhQmpVRmRtRE1TNTJnemJkMXdvR2EwYlVNczVoV0FVSHRmSU95?=
 =?utf-8?B?VXBwOFpNdVJXb0NzOEJhamdCODFXT0hXVXB6Y2MvbE1XdU5jOFZ1T0E1Nmht?=
 =?utf-8?B?MUdPdVAydmU4Zlg4emVtak9HRWJxRldUWHprZExBSFZPV2hqNEZZQ0pkVHAr?=
 =?utf-8?B?V2Y1NE43bFlHbHlMbHYyRE9xNTBZRHVBTEhGMHpPdnpkdUpXdThtZWZBWGJh?=
 =?utf-8?B?SzN5RGY1Q1JEc0gvR3luL1E5dHJ5cHU0NFVLWmI0empsbHc2TWQxajdwdEtO?=
 =?utf-8?B?NERlSVViRTRmWW1FcytIM21NL2twQmZaZERlR013aVExQkdIRWJwNU1Yc1E1?=
 =?utf-8?B?aU5HS2NJZzhST2FRVEp3c1F4VHlUbVBCT1NnRVhMcE01eU1oM04rVnNPU1FC?=
 =?utf-8?B?UUF0WUhsdXl4L1pxdUdKNmZXc1BDb0VZck1XTTFwREIxdGJhS0FTL0I4Tlgz?=
 =?utf-8?B?V2l1dFhEdlRKbmRYWWUxdU0xd0puVHVMbWhKWk9iNW1vaEg0ZTY1V01pSmdo?=
 =?utf-8?B?YVF0bVpUdTZaTGtObTBQWWVTUkIyeVFwcE04ZEUrMzJodWc2NEg4QnpVU0Mw?=
 =?utf-8?B?Vkg5ZnZ2Q3d6M2xWVkNtUElIajM2ODlGNE8yL215OXJDUURRS0ZFbWcrYXlV?=
 =?utf-8?B?Y1ZhWU51YmhEd3lMMnoxeUphQlFxS05HWm8wT3RBVjhISk9Lb2g3WnFUbEVl?=
 =?utf-8?B?L1pmTVMvWG8vbndxWTg0cHEweWdNQ0NzUnBKQ3VyQlMybHJ2dDZIbngxUGJq?=
 =?utf-8?B?eWZVZW1HcE92UGg5OU10cHVFQnZydDQ2QnBoQTlVSm1tZVRpL21VcHlFZFQy?=
 =?utf-8?B?WVZZTmdVcFhkWHVjL1lqQ1BQcG4ycWVPdEF1eEhSc3ViMDRvbUZvR0tuUndq?=
 =?utf-8?B?a1F4dFhOSW5jYURMWEJSMmIyaVhEeEJrQURnM3N4d2M3eE5lZFNIdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec988638-5902-49ad-d34d-08de4e3940b3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 22:08:14.0819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/4VgZzC6CbyA0NjBu/46E7NZ2nptaY40tJY0hBu2d3d19osoTNTqeWX+e0tHBZnjZmuBXPLx+E986y2ga+/Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8345
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

On 1/7/26 4:05 PM, Lizhi Hou wrote:
> 
> On 1/7/26 13:19, Mario Limonciello wrote:
>> On 12/18/25 7:43 PM, Lizhi Hou wrote:
>>> The latest firmware requires the message DMA buffer to
>>>    - have a minimum size of 8K
>>>    - use a power-of-two size
>>>    - be aligned to the buffer size
>>>    - not cross 64M boundary
>>>
>>> Update the buffer allocation logic to meet these requirements and 
>>> support
>>> the latest firmware.
>>
>> We can't guarantee that kernel and firmware are moving at the same time.
>> What happens if you run old firmware with these changes?
> 
> The old firmware runs fine this these changes. The new firmware adds 
> more alignment and size requirements which the old one does not need.

Ah OK - so patch 2 won't reject current firmware right?

> 
> 
> Lizhi
> 
>>
>> If the old firmware can't run with these changes then it would be 
>> better to instead add a fallback system.
>>
>> IE:
>> 1) kernel tries to load new firmware name and use new behavior
>> 2) if firmware is missing, kernel tries to load old firmware name and 
>> use old behavior.
>> 3) if firmware is missing in old name then fail probe
>>
>>
>>>
>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>> ---
>>>   drivers/accel/amdxdna/aie2_error.c   | 10 ++++-----
>>>   drivers/accel/amdxdna/aie2_message.c | 33 ++++++++++++++++++++--------
>>>   drivers/accel/amdxdna/aie2_pci.h     |  5 +++++
>>>   3 files changed, 33 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/accel/amdxdna/aie2_error.c b/drivers/accel/ 
>>> amdxdna/aie2_error.c
>>> index d452008ec4f4..5e82df2b7cf6 100644
>>> --- a/drivers/accel/amdxdna/aie2_error.c
>>> +++ b/drivers/accel/amdxdna/aie2_error.c
>>> @@ -338,8 +338,7 @@ void aie2_error_async_events_free(struct 
>>> amdxdna_dev_hdl *ndev)
>>>       destroy_workqueue(events->wq);
>>>       mutex_lock(&xdna->dev_lock);
>>>   -    dma_free_noncoherent(xdna->ddev.dev, events->size, events->buf,
>>> -                 events->addr, DMA_FROM_DEVICE);
>>> +    aie2_free_msg_buffer(ndev, events->size, events->buf, events- 
>>> >addr);
>>>       kfree(events);
>>>   }
>>>   @@ -355,8 +354,8 @@ int aie2_error_async_events_alloc(struct 
>>> amdxdna_dev_hdl *ndev)
>>>       if (!events)
>>>           return -ENOMEM;
>>>   -    events->buf = dma_alloc_noncoherent(xdna->ddev.dev, 
>>> total_size, &events->addr,
>>> -                        DMA_FROM_DEVICE, GFP_KERNEL);
>>> +    events->buf = aie2_alloc_msg_buffer(ndev, &total_size, &events- 
>>> >addr);
>>> +
>>>       if (!events->buf) {
>>>           ret = -ENOMEM;
>>>           goto free_events;
>>> @@ -396,8 +395,7 @@ int aie2_error_async_events_alloc(struct 
>>> amdxdna_dev_hdl *ndev)
>>>   free_wq:
>>>       destroy_workqueue(events->wq);
>>>   free_buf:
>>> -    dma_free_noncoherent(xdna->ddev.dev, events->size, events->buf,
>>> -                 events->addr, DMA_FROM_DEVICE);
>>> +    aie2_free_msg_buffer(ndev, events->size, events->buf, events- 
>>> >addr);
>>>   free_events:
>>>       kfree(events);
>>>       return ret;
>>> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/ 
>>> amdxdna/aie2_message.c
>>> index 051f4ceaabae..99215328505e 100644
>>> --- a/drivers/accel/amdxdna/aie2_message.c
>>> +++ b/drivers/accel/amdxdna/aie2_message.c
>>> @@ -55,6 +55,22 @@ static int aie2_send_mgmt_msg_wait(struct 
>>> amdxdna_dev_hdl *ndev,
>>>       return ret;
>>>   }
>>>   +void *aie2_alloc_msg_buffer(struct amdxdna_dev_hdl *ndev, u32 *size,
>>> +                dma_addr_t *dma_addr)
>>> +{
>>> +    struct amdxdna_dev *xdna = ndev->xdna;
>>> +    int order;
>>> +
>>> +    *size = max(*size, SZ_8K);
>>> +    order = get_order(*size);
>>> +    if (order > MAX_PAGE_ORDER)
>>> +        return NULL;
>>> +    *size = PAGE_SIZE << order;
>>> +
>>> +    return dma_alloc_noncoherent(xdna->ddev.dev, *size, dma_addr,
>>> +                     DMA_FROM_DEVICE, GFP_KERNEL);
>>> +}
>>> +
>>>   int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev)
>>>   {
>>>       DECLARE_AIE2_MSG(suspend, MSG_OP_SUSPEND);
>>> @@ -346,14 +362,13 @@ int aie2_query_status(struct amdxdna_dev_hdl 
>>> *ndev, char __user *buf,
>>>   {
>>>       DECLARE_AIE2_MSG(aie_column_info, MSG_OP_QUERY_COL_STATUS);
>>>       struct amdxdna_dev *xdna = ndev->xdna;
>>> +    u32 buf_sz = size, aie_bitmap = 0;
>>>       struct amdxdna_client *client;
>>>       dma_addr_t dma_addr;
>>> -    u32 aie_bitmap = 0;
>>>       u8 *buff_addr;
>>>       int ret;
>>>   -    buff_addr = dma_alloc_noncoherent(xdna->ddev.dev, size, 
>>> &dma_addr,
>>> -                      DMA_FROM_DEVICE, GFP_KERNEL);
>>> +    buff_addr = aie2_alloc_msg_buffer(ndev, &buf_sz, &dma_addr);
>>>       if (!buff_addr)
>>>           return -ENOMEM;
>>>   @@ -363,7 +378,7 @@ int aie2_query_status(struct amdxdna_dev_hdl 
>>> *ndev, char __user *buf,
>>>         *cols_filled = 0;
>>>       req.dump_buff_addr = dma_addr;
>>> -    req.dump_buff_size = size;
>>> +    req.dump_buff_size = buf_sz;
>>>       req.num_cols = hweight32(aie_bitmap);
>>>       req.aie_bitmap = aie_bitmap;
>>>   @@ -391,7 +406,7 @@ int aie2_query_status(struct amdxdna_dev_hdl 
>>> *ndev, char __user *buf,
>>>       *cols_filled = aie_bitmap;
>>>     fail:
>>> -    dma_free_noncoherent(xdna->ddev.dev, size, buff_addr, dma_addr, 
>>> DMA_FROM_DEVICE);
>>> +    aie2_free_msg_buffer(ndev, buf_sz, buff_addr, dma_addr);
>>>       return ret;
>>>   }
>>>   @@ -402,19 +417,19 @@ int aie2_query_telemetry(struct 
>>> amdxdna_dev_hdl *ndev,
>>>       DECLARE_AIE2_MSG(get_telemetry, MSG_OP_GET_TELEMETRY);
>>>       struct amdxdna_dev *xdna = ndev->xdna;
>>>       dma_addr_t dma_addr;
>>> +    u32 buf_sz = size;
>>>       u8 *addr;
>>>       int ret;
>>>         if (header->type >= MAX_TELEMETRY_TYPE)
>>>           return -EINVAL;
>>>   -    addr = dma_alloc_noncoherent(xdna->ddev.dev, size, &dma_addr,
>>> -                     DMA_FROM_DEVICE, GFP_KERNEL);
>>> +    addr = aie2_alloc_msg_buffer(ndev, &buf_sz, &dma_addr);
>>>       if (!addr)
>>>           return -ENOMEM;
>>>         req.buf_addr = dma_addr;
>>> -    req.buf_size = size;
>>> +    req.buf_size = buf_sz;
>>>       req.type = header->type;
>>>         drm_clflush_virt_range(addr, size); /* device can access */
>>> @@ -440,7 +455,7 @@ int aie2_query_telemetry(struct amdxdna_dev_hdl 
>>> *ndev,
>>>       header->minor = resp.minor;
>>>     free_buf:
>>> -    dma_free_noncoherent(xdna->ddev.dev, size, addr, dma_addr, 
>>> DMA_FROM_DEVICE);
>>> +    aie2_free_msg_buffer(ndev, buf_sz, addr, dma_addr);
>>>       return ret;
>>>   }
>>>   diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/ 
>>> amdxdna/aie2_pci.h
>>> index a929fa98a121..e1745f07b268 100644
>>> --- a/drivers/accel/amdxdna/aie2_pci.h
>>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>>> @@ -336,6 +336,11 @@ int aie2_sync_bo(struct amdxdna_hwctx *hwctx, 
>>> struct amdxdna_sched_job *job,
>>>            int (*notify_cb)(void *, void __iomem *, size_t));
>>>   int aie2_config_debug_bo(struct amdxdna_hwctx *hwctx, struct 
>>> amdxdna_sched_job *job,
>>>                int (*notify_cb)(void *, void __iomem *, size_t));
>>> +void *aie2_alloc_msg_buffer(struct amdxdna_dev_hdl *ndev, u32 *size,
>>> +                dma_addr_t *dma_addr);
>>> +#define aie2_free_msg_buffer(ndev, size, buff_addr, dma_addr)        \
>>> +    dma_free_noncoherent((ndev)->xdna->ddev.dev, size, buff_addr,    \
>>> +                 dma_addr, DMA_FROM_DEVICE)
>>>     /* aie2_hwctx.c */
>>>   int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
>>

