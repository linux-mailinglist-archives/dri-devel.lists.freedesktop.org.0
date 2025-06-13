Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1728DAD8F49
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 16:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DBD10E9E1;
	Fri, 13 Jun 2025 14:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IW4EI6mT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF7110E9E1;
 Fri, 13 Jun 2025 14:20:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AggzW2Au5vFzQU60h3XpjjvujuubnuKeh4zEdTSzzGUrb7U8DFIKtmyEGSQa0WNd3sC3vv5NVwDC+DSXtDrp3U75T98xtFx6KV4qWeTg/3krABWmtUIq+WAbkpWPIx7KsmXlOeMakbuNjD6XPxdq1b5LiFJQYo67e/UKZVrY7lGXI+C/fx2ZWEG3tcOzGKA9ENDYbkts+HiphhpsQOggUPWWtEFgFV0qr76W9EbNcr6NrkSQLXebfojTdmpmUrVqHgpwHCL0utvzpMgdFajtClHsFVnpeU4l7r5HhNS1aDzYxluyfLzCq50Jr4iiYg00wr+Z1/DcsdtxIHZNpl3G2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1/3SI3H8V8CQ7KcYolUlR4Yk9QuHUD39nu1tle5aDo=;
 b=I9rFOhSoGnPWLSlb/eAXjy7XLFyL3TtIrXiDvFGs5NGC2T/qNoA0tQ67/V9xEu3zd4lbXJFvmxmXOENd1BuPvKzV71kKgX3fULCGy4L4Wrg2lLpUWWX1YOqGk+x1wam/dBYlQLMygfD8aU3xeyAjC/Z7UM/lDz3XqTIgah1R3qNVm3ST4jwrgZ6uIKHbiFdcQ/5mvIlIDni6aXReIg02t7Il18GBHpiPs5ow7k+SQD39FZ78S/yaK5T04VOYbCaSFPO6o8FYuUYUtHpGTcXLDGSOfRIot58LiSQI9AMSsmGA5WV58Cu2Y4QgZ+oifmWQ68nIiFzv14z5SARJJK4TOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1/3SI3H8V8CQ7KcYolUlR4Yk9QuHUD39nu1tle5aDo=;
 b=IW4EI6mTfz25Mvf1My4yYnzqq4wk0DR0JamcpXfrVpcNTNOH5z/gzDkZ3UziQQH/AcTDhZ1TfUuxIjr7L5pFkY7lMWgHIfBL0ZfwEsYEuZFUy/hj2cHEJ1NYcqu8nV7if71/Qh5qlQDd21rYD77HBdG/31NCKDEjrO93ghrL2I8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ1PR12MB6124.namprd12.prod.outlook.com (2603:10b6:a03:459::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Fri, 13 Jun
 2025 14:20:23 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%7]) with mapi id 15.20.8835.019; Fri, 13 Jun 2025
 14:20:23 +0000
Message-ID: <34d9f4df-d4a4-459f-97ad-e5d3061ff42d@amd.com>
Date: Fri, 13 Jun 2025 10:20:20 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/4] New Helper to Initialise writeback connector
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: arun.r.murthy@intel.com
References: <20250613061550.2893526-1-suraj.kandpal@intel.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250613061550.2893526-1-suraj.kandpal@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0308.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::22) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ1PR12MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: fd99607e-63ee-47b6-bcbc-08ddaa856f21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0c1WFpxNFVDRVN4TnE4V0czcmp6TVRzU0M4TTQ4L3dyMXBZUTVzMi9RTGZY?=
 =?utf-8?B?MCt2bzR4UGc3Z2lXMzBrZ3dhdWhHVTJtR09XYy9jZjlvaW1ZSlhSVGpjamNB?=
 =?utf-8?B?a0cxUGgvUmZTaytRa214eUZPU0dLUVFqbFgzRm1MbS8zRVlPRDB2dnJ5WTZN?=
 =?utf-8?B?bDJLKytjZHVycmhVTlZ5dmg1RDlCUGxtMUpRb1gveDFHdmRLMERpYzg2am5N?=
 =?utf-8?B?amJORnN6UVByUEtuci9UUDBkeGNDVDRiYXRTaHp1Sld5RFc0d1QwOTdKYXNN?=
 =?utf-8?B?QTU0c1RiQU5ZS05YUElLbFIrWWt3U05oRVZnV1U1WWFqZStSVlVNc1N2emk1?=
 =?utf-8?B?RnIyNU1OdUdXM0EwMzlIM2JBVkFLTWFpSGlIZFQrSnlpdGswSUVkQXhkMHZT?=
 =?utf-8?B?R3VucXIvMEwraFNQRnRJM1VIbFh1cC9HV2xLUEhNL2hKeDNQT1ZIaUxLdEVi?=
 =?utf-8?B?MDFNa3pBMDF5S2F3OW9VMG83T1cxbzh1SGVqelZoeUxsYzlra0JNL1plT0dG?=
 =?utf-8?B?blEvTWpSbzJoVXdsdUVuSDliOC90am94ZzNzK2pSMHExMlVTYS9hbGlkVldT?=
 =?utf-8?B?VHlaVlJ2dlpVZFNyYWNoYUFLNTI2dGk3dkFGbkFyblJybU0vaTdzb2tqeldB?=
 =?utf-8?B?aERNOWVLU1FKdTZjMU1PQjZEc2pIWXlwaUxTN1VTcFVmOTRUeXllNFJ3eDFn?=
 =?utf-8?B?RDZ2ZkpMQ3FaVUErOE9rYkw5TElLSHY0Rmd3OW5iYk04UVovS2VPWEVHYVRo?=
 =?utf-8?B?ZUFMU01tdW5nWStibWpiUXRESDlwSTFmWVU4K0YzNWhRMjF3eExhMnFnUEFX?=
 =?utf-8?B?V25NZngxa1BqU25KbkIvYWdnbWgxT1gxd2ZWREZOcFFoaFlSYy9EOUZqcjlx?=
 =?utf-8?B?ZjZvcStVL01QYmVBRWFmRTJ4bEYyM1B2cEVsdmlhVEtnSnhtK0RNd1F0Wk9n?=
 =?utf-8?B?dDFic2lWcmJ1RG02SXZUNWN3VEtzMm5zaVh1TWhmenBNLytYRWd1QXhGZnlp?=
 =?utf-8?B?T2QxaDdBdlpQbGVrdWw2SWY0SlEvc0d0NmtFekU2NUVSSjNMZkVVcHBCcmVT?=
 =?utf-8?B?QUlBNWc5djVCS2Vsdy9DQWJ1dFNSNFp0WGYzWkZxKzAvNXJnMTJOQXBSbjI5?=
 =?utf-8?B?OU4wbkxOeTV6aFZaQlQ3eDJDNUg4cXZwcWVXL3Avb2hFMWtxQThBY280aHBm?=
 =?utf-8?B?Y1FHaHJvWDMwcjBZK1dzenZVNGhoZHJsRTVmVi9CWWJZdnp3YTVjdWhValNE?=
 =?utf-8?B?NzdDUXhxcFJQdmV5eU1pQ1ltR3hNbFVhOEpJSnMxSXJNNEtjMGcwcWdqWHd4?=
 =?utf-8?B?SC9tMnRXN0d0MmU3Yi9zK2dTbEczbEl5WUhxdEdseUJUUzI3aVNYZlJoZFhS?=
 =?utf-8?B?RFhNK2J6ZHF5b3FRTXNONlIzWXZwb2ZGTzU1V09lSGV0d0oxb0M4MjhhUXF4?=
 =?utf-8?B?TDZ3L2ovNVNmS2hIczdVdGZTY3BhbTQxeU5xQ1ZvZkRnUXZ3RGxpYWZJT2Mx?=
 =?utf-8?B?Q3lzeWhCWWZ4NE14bGNNRndUdG0xdkxYdEZvRUxCVi9SZTR4cHh5bnZUOVBM?=
 =?utf-8?B?WUZjL1RhYnZRV3NXWW80RW1nMjdOekNENWJwdHFYOUkrWmtVN0daRGRSRFRY?=
 =?utf-8?B?eDZIUHI1anlVSTJsYVpOYWhvMTVFZnI2MTBDS3RTczJDcnQvWWZ6S0VYakNS?=
 =?utf-8?B?Z3hpeHNaV3kxQmZVVkdIRTRtQVQrOGtkUjg0WU5IOUxDODZjZ1pWeE1tYitw?=
 =?utf-8?B?WnZHNWxUdHNwYXNYaDhIUjRMNFlFSDArbHh3clg4b2VvRVlRcU1OMzdhNkxa?=
 =?utf-8?B?MndacE04aWtlZExMdlg2MS80d3d6QUdYd0NWYVFwZzZkMjlXckU4Qnh0aUc3?=
 =?utf-8?B?UmRGWXlPT2N4b3E1ai9PUVkyMkl1TFY4NzFhUWtWaWJMQ3E3YmxSQWVsYSs2?=
 =?utf-8?Q?fBxKy/mA648=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnIzbmE4ZWxpUGZNK3NiUFF6NUpEaWg3WlZGTjlkTk9YNEJESGpSUko5ZXBl?=
 =?utf-8?B?ZUljRWlPOXBJKzl0K3Jna3B5QmFURE12TFdraU5HUzhIM3BEeWl2OUgvck9C?=
 =?utf-8?B?NU95cDF3NTdoK3RmeTUybjl0WjBDdko3ak4ycXdiMmlRaUxuSEQvQUJCalk1?=
 =?utf-8?B?MnBmRlY3R2owdmdoYUNRVXMvTkJCSVBKM29xR3R1SzUyNVlYMGZTMHFkQkpk?=
 =?utf-8?B?dW0veEVZVTJ0TnJNT0VDZGRjRUdZbS9VVVBLZG1qamNGbVhnbWV0Wm5pbXUz?=
 =?utf-8?B?REtaRXE5RDZGdlZ0Wnp1bE9zMHlZYkdSYmhoNEhBWm9oL3ZnY1g2YThtMmpD?=
 =?utf-8?B?RGxkejVHSEN0M3V3VFowaGVTWTBSMmpKMWF2TDNQWjcxUEY3cGZLbUpQRWYr?=
 =?utf-8?B?V0s4cXNNbDI3R2ZWakRKK2F6Nm5tOVhBSDhJRDV3ZVlFUmY3RFp3cGo3UE5M?=
 =?utf-8?B?WkZXcCtWWTIwY3IrUkg1dHFKNmh1VXFjQ0VoaEdncVAyaGFOL2ozSHZZZ3Br?=
 =?utf-8?B?dVQrWjBCRkZWbS95SWFEYm9vL2JQMHZWMVN2S2dVTUdOTVFSNUorUEtyQTFH?=
 =?utf-8?B?cDVEQUFlbTZhOEdTNCtBaXhnM1AxVHpQY2VrTFd2M3RHS1l1NElmSTloZVRi?=
 =?utf-8?B?eTltUjZTMXFCUkNQUG1zWG5CVENDMU8xMVQvZjROQzdTYzVYNGp6TEF4RTFQ?=
 =?utf-8?B?dTJYTExjY2k0T1cyOGdiZmYxNnpNN3lQb3FFL1JZY3FQNzhNbEJ0cXpiSHJO?=
 =?utf-8?B?Z2I0bkpWbHpZZFhzZHBYYmNscmZSQTFmRjFFcmlqQW56eDUzZXovZXhJdENB?=
 =?utf-8?B?cjhNMjFTeFpFTHFyS2hRMUpDYmdKV1RnWGFSNjhDYXN6bGU2RnU5eUJXajRN?=
 =?utf-8?B?VzMvblRlUVVMK0dyQVh1WnE2NW5sc09HcVBoUTFXL056NXdpdkNzTXBmYUNL?=
 =?utf-8?B?Y2JoUkh6VWhJSWc5YUhQeXNtSkc1cXh0VmVvU3ZSdERmc2FQRFVuT2pmeFFH?=
 =?utf-8?B?SU80a3hNaHBRZzd2UHdUMUR2cmVCeFg1dXRHeTAzNGZiUm83UGlBN1pBVmZO?=
 =?utf-8?B?WlpORzBBRVBjNno4UUZkUElxeGNnVXBjY0NCTUFtajRqZlRkMXVQTmp4NUpu?=
 =?utf-8?B?SW9Mc2M3RDlrN0VudWpTUWppWVRteWV4eVN3OG1CaXRiV09xaHRlVjdlb0o2?=
 =?utf-8?B?bzZHaitxUkhyUEpZR1kwZTFpU2xvK2JtdGZ5cFo4c2FoaW1OZ3o5SnhDWVZl?=
 =?utf-8?B?aVNmUExyQnBJcjA0SzRySkxJZVJ6R0VkTDY4K1ZHTExwMUhYRERRWG1yNGVM?=
 =?utf-8?B?SkkzZWowTzFVcmZHNVFCaGNYaERsUHlYSkFBdjVMRUtkY25teDdTQ2hrMHht?=
 =?utf-8?B?ZktXNEM2YkFEYk11eGFWTkF1UXZaOGdHS3p3VDJyT0wxaEx4alJacFFFejQz?=
 =?utf-8?B?UWtLSG9xVEVnOFU4K1pBanN5RkN2UWlzeVNvTTYzNThkWWNHWmtCaWtTdXFZ?=
 =?utf-8?B?R1FpbmZvUmhYOHhaNG1kOGw1ZFJLRWlkQjRkMFpMZWREUmNhd3h6b1hId0s1?=
 =?utf-8?B?aXZxQi9KQjVpek5LUXRuU2E2NG9FM1dReHM5Q25WODBSd1czM2dlYktTOHl6?=
 =?utf-8?B?dG4vcDFwRnVBNUdlbjRwQ1ZXL0RlUUFwREE1NWxLTjlHQ09sOHFMUXN0UmEy?=
 =?utf-8?B?bjBUaEVWNy9iUW02N1FSVnlzOUxmbzk5ckpOa1BEK3liRFhqZzFXZUhwcTFn?=
 =?utf-8?B?czFGcFJubEc3ejNHWWxRMUdZQVpnWnQwemwyeXVwUUlubXZKemoySHd5VC8r?=
 =?utf-8?B?ZzNjeEtwVklTaXczaEwwWW5veER3ZmozdTJ2VmRKRnRueFpaZFdNRnZvZXRQ?=
 =?utf-8?B?WU5BVEJpc29sZzdCZUYwZjBVRjRqVUJoTmNUaUR4K3BQZkxaK09POUlpWnZV?=
 =?utf-8?B?L2JCdUhGTzVDaU12ZW9jc1cwckFzeVJlVGtzcU53V1RKMmVBaUlybDRKRGE1?=
 =?utf-8?B?U000ZVZpWm9sdWE2d0laaG1DcXpia1pqUm9hVDNkeHV1STZ6emlUSVZBQlJx?=
 =?utf-8?B?STRqdW9adXlTMjBxN2dXNkR1aWxWaXVMVURhQXlnZUN5Q011Um5xM2pxVVV2?=
 =?utf-8?Q?p4gpVmC8Ut3Wyv5yLFlsWWig2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd99607e-63ee-47b6-bcbc-08ddaa856f21
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:20:23.3420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xgqDi4kfzRYvzaIwcG7YsnQjFdMGInDWc9qsOoGnPyowP0jEW8CTsh0GtE0sNPoc/sb9YmYI8Mz5ePQeIY9Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6124
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

On 2025-06-13 02:15, Suraj Kandpal wrote:
> This series is for review comments only and is not tested.
> This series added a helper to be able to initialise writeback connector
> in a way where drivers can send their own connector and encoder.
> 

I've only skimmed it but this looks nice. If I understand this
right it should solve the problem where drivers need to check
whether they're dealing with a drm_writeback_connector or a
my_driver_connector.

Harry

> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> 
> Suraj Kandpal (4):
>   drm/writeback: Add function that takes preallocated connector
>   drm/i915/writeback: Add writeback registers
>   drm/i915/writeback: Add some preliminary writeback definitions
>   drm/i915/writeback: Init writeback connector
> 
>  drivers/gpu/drm/drm_writeback.c               |  83 +++++++++++
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  drivers/gpu/drm/i915/display/intel_display.h  |   4 +
>  .../drm/i915/display/intel_display_device.c   |  26 +++-
>  .../drm/i915/display/intel_display_device.h   |   2 +-
>  .../drm/i915/display/intel_display_limits.h   |   2 +
>  .../drm/i915/display/intel_display_types.h    |   1 +
>  .../gpu/drm/i915/display/intel_writeback.c    | 131 +++++++++++++++++
>  .../gpu/drm/i915/display/intel_writeback.h    |  17 +++
>  .../drm/i915/display/intel_writeback_reg.h    | 134 ++++++++++++++++++
>  include/drm/drm_writeback.h                   |   7 +
>  11 files changed, 405 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_writeback.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_writeback.h
>  create mode 100644 drivers/gpu/drm/i915/display/intel_writeback_reg.h
> 

