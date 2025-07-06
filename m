Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E12FAFA7C0
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 22:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5C810E2E4;
	Sun,  6 Jul 2025 20:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1Y5Tp/mB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F7810E2E3;
 Sun,  6 Jul 2025 20:44:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+fNYnD+OJiQdQDgl2jmzN1Vgotncx01uovquI25RPkQueWRLky9yG3V2psZHhZFjQ8rEioVQXdUJZip6HgzzvupCEphhCmOdmxRYAHDWt1raNkmx92QqRwlNtqi0E7gbcZ+rhO1iWyG7Nxdq1QU/Cqh3wiSlgtb1SXj+kTSPHR1y5OucxY27/4ishvrLCxXPqqvhymWaeIU57uA+soE8j2P/ON5UdXkkz6AvaNdk0b8/ic8rSWgEmgx5QMxaiMrNEYtbQemgowGAuhWxkCr6EBWqJiedrMOepsYhCrBAGRDcy5FRBqaR0WrK08irduCgYp2e0bwr3uNiB8bIoFn2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1FYZfvWnk3mvvOCW+avIvJReP5y0k8vFAdLhVkJTFA=;
 b=V8TxK0g3dKeijywqQpA1Z9O6T5N72PU63tne9SthZ4pgQ7jWNtl4416naILJclUS9M1KCkbqx6B5YJg2wZ6tX1/cJlDt2GUn3MGGIPkORzA4HpB9OzWBNO5J1F0wWTuulFItBALR8kfww+Ef1MzO5gflsPhXLsNUU//Cf7pNgN8FKnZmr+5GbimVib1DGLvKVmLr3HDL5EULJroZfCcIvw3CIcqNhyl/FV+TgGkDsI0Xip/LjIdk6mjw4HRlsIDKyW+h/eXi5XW3rZfmU2fpCXmuz722KYhwmK9y7uW26sEvS09sKs0U+ilDPJAexzHJQNgWWrhDTBgZ6xo046xUMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1FYZfvWnk3mvvOCW+avIvJReP5y0k8vFAdLhVkJTFA=;
 b=1Y5Tp/mBCXVoMXexFg5D6km+fsKcq1MxAvm7hQ+01Ryqv2PzhoG2q9JlmkJrDxWfQHf/fYYd/Xgx7SzcGY11SBbayGlIEaj180PA74wGtZgC9ymZypO5/I3xZC53N8YPZP/NC0oL8YadR2VM1rHpNKivRbk7/qEH0jlJxdvdhq0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA0PR12MB8746.namprd12.prod.outlook.com (2603:10b6:208:490::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Sun, 6 Jul
 2025 20:44:30 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8901.021; Sun, 6 Jul 2025
 20:44:30 +0000
Message-ID: <5c4f5f0d-024a-46e5-9506-0b589f6cce5d@amd.com>
Date: Sun, 6 Jul 2025 16:44:27 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] drm/ttm: add ttm_device_prepare_hibernation() api
To: Samuel Zhang <guoqing.zhang@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, rafael@kernel.org, len.brown@intel.com,
 pavel@kernel.org, gregkh@linuxfoundation.org, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, ray.huang@amd.com,
 matthew.auld@intel.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: lijo.lazar@amd.com, victor.zhao@amd.com, haijun.chang@amd.com,
 Qing.Ma@amd.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250704101233.347506-1-guoqing.zhang@amd.com>
 <20250704101233.347506-2-guoqing.zhang@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250704101233.347506-2-guoqing.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0446.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10d::7) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA0PR12MB8746:EE_
X-MS-Office365-Filtering-Correlation-Id: cc58bb7b-1384-4cb7-9fa8-08ddbccde7e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SE5xR09JZHpWeTh3U2IreVhjTVhXTmZ6Mm9ZM3hiMHZQZ25HSmtqZEVjWGpu?=
 =?utf-8?B?ZVBFVFNsK1Z0WDJQSERGa3JIWnh1K0MycnhXNnNoY3JmRWFOcHVyZzBySTBo?=
 =?utf-8?B?aW51eTRMUjR2eWwxcG1SeGllc004OWNzc1p5MHJGZldOcDk4T21pdElDNmNi?=
 =?utf-8?B?YzhIVWV5N2hRa1NFMUttMlBhYXVZSUFXZ0NGdGhKZ243OGVZNXlyY2ljcTBW?=
 =?utf-8?B?RUxkWUlKeVBITDI0ZHVBZ2orYjBiSlpNVkZSNmp0bXMyYVBSNUxseUppYk1M?=
 =?utf-8?B?VElucFhyUVJUY09QWGRWZFJnQVZrNUpPZXhjUFo2b2dCeC9XY0UveHFuUkUy?=
 =?utf-8?B?VHovczhWcDhseWs2ckNpSG9mUVBlUUpHZFhKamxXbzkxdDZRTEtuWk8ycFpo?=
 =?utf-8?B?dUdZbU9pSWVaQlYzSFlCSzdVTXFLSlEvV0E5aTRONkl6TS9WYTRQU3FjNzVa?=
 =?utf-8?B?MzdRZDVZUzVaL3pEcUl2UGJWSzRBMDlLOEZkUEJ4bmdGYUNlc3VtSUE2N1Fx?=
 =?utf-8?B?aFpqQnRFczYzMmJpYzg2dHcxRVpzWnNmWG5UeFpGT1hHc2wweDV4OUd6VXo1?=
 =?utf-8?B?S0hZVTZVSzVPNUxSMFRyTDJ1eDRZeDV1VXdBREM3KzVEZCsxcUQ5NFBDdHFv?=
 =?utf-8?B?SEEzRCt2TC9FUlA4WlBUc1VCckdhTStCMTZCQnA5dENLa1ltcUVldUtCRVVM?=
 =?utf-8?B?aU9EVGdFUjVCWGpzSm9ZeVdxSUZYQndLVFhLMkVORlRSalhHUTNPR1BZRDht?=
 =?utf-8?B?azUyQlkwbHZCYkNkWG9USzZMNGs3LzlSREs3QmdORDZodWtET0NqT3diODZv?=
 =?utf-8?B?WjN0ekZNNkRaUTV4R2FESWQ4QlJMVzF6WGx3KzVWZGxEZXIyNnE0aDVIUjd6?=
 =?utf-8?B?RnE2SXZwOG4rcXM2U1IyVU13SEN4cVllY0pJMnlVWEJQUFBQWmE0dzgwcHo4?=
 =?utf-8?B?cjR1a3Z2S1dobnlPbHU5NnpQNkJSclc3OVEvS1JxZWNEbVd0cHgwRTJ3MGIz?=
 =?utf-8?B?UW4rc3E1Z0t1ck1WZkNETmxyZ0RYR3JOaHVXWVV5N3p3Wmp4U3FCWGhMdXBx?=
 =?utf-8?B?Mm1EVGZndzJ4a203K0NaTzVWQk42cUlNNEJQTVNKc3VCcU1KNXZYOFpVRmEv?=
 =?utf-8?B?RGM5b2c5QURPYzVhVHFxY2E5b05QR3N5RzFMdmQrUmxMSzBGR29hQ1pFWVlv?=
 =?utf-8?B?dVh4L2p5NE5TV3RQc29zcUJJZTJwK0Q3OHhMekRCVC81em1Xd1YzQjZEaWFy?=
 =?utf-8?B?YUNJTUxoV21zdUhrQ01CWHZacmp6UFlSbHZmSUVIZDVCYWMzejUxMFdNZXVx?=
 =?utf-8?B?aUExd3BlVzNWNzN4dlBEQU5UcGdveDVxdWJtSGF4a1VPZml4N3huSytqdHRJ?=
 =?utf-8?B?UGlqVTZWUnE3RjZBajFJNXUvWG5EdHpTSmdHSE1MNUtBV2pybUNhTkJNb1I2?=
 =?utf-8?B?cythQlJZdllhVFVWMmVaRklkTFJBVVJIc3NUbGVLMXprMnJnNWpxRjEvZmtC?=
 =?utf-8?B?bWxBaVUyOHJ5VCtxNEgvTnAvMzBqRTZQRmwxeGh6cUZmZUd1VzZQTjdIOFBl?=
 =?utf-8?B?QWFXc0JGdzllK1laZ2FjYUJOSGFoQ2UvNWxXbmhaZ3dUbjdocDlrekJFR1RN?=
 =?utf-8?B?cXFkWDNDWVVLQkFkUWJPeUkvR0RKSmhIUWZDZVVhbHN0Qndadk45bTBucXpI?=
 =?utf-8?B?ZmNKQXpPWHJkTkFqVlliZGZpVWRDdnhEVGs3NG9HOXAwZWNMVmhNYS9tVnBO?=
 =?utf-8?B?bFF5alczNTk5c05tR0xSQUlCVnRuemFnWTdCTmRCN1FkNTl2NzdMZHFtZFlk?=
 =?utf-8?B?WlBXK0ZsbHBrV1FpMHNMaWFNNFRrRTdhdWtNamhna2RsME5JbzZiRDg4Rzgv?=
 =?utf-8?B?WmtRbCtjbUxQUVdCb1hGRDVlTnlrYW1ac1I1Rk40T3V6MjVDYk1IRThNMWlo?=
 =?utf-8?B?Qnl2d2luSjVNWmhneStsbUFheXVxck5KUGVtQXRKYWxCSC9kb2ZHZVZRQm51?=
 =?utf-8?B?a2JmWUwzNy93PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFI5TURETTZkek5vemw4QVF5M3QzT1hveTV2K0t1bzh2dkFKbE50OUFxM2J1?=
 =?utf-8?B?Nit1cnNuNCtLUGFudC9acVNQY2xZVWRCZUxpWEpxM21LcWIzRG85QjIxa1hW?=
 =?utf-8?B?ZEVGNzZmVkc2MGNjU05VQzlKbHA4a3JoUHAxSWRXd2M3MUVOWnpiNkJpeXBX?=
 =?utf-8?B?czY5czhSNnhxcDBGVDEvbEYyTktqSU5FOUt0QjNXNGErQldLN3NIeDNzdHBM?=
 =?utf-8?B?dGpwa2EwOTc0V2Jxd3dML25QMUtqTEdHZXZZNjRrNFBPR1RKdU05VnFNZW8x?=
 =?utf-8?B?MUh2RS9VL2pwa0o1WkhiOVczUEQ4S0FxNUpwaG1jaHQ2Rm9rZTBiaTU1U2x2?=
 =?utf-8?B?VkEveTJoU2dKUGhKK0JTVWpLMkcvM1JCc3J1b3pEZnlHcGRvNForcmZFc01G?=
 =?utf-8?B?eFBsWWszL00rc045bm9hUzc4Vmd6djBaTzdUN0M0aW1JT3J3R2xhS2JrbVF6?=
 =?utf-8?B?amRKcTE0bW0zTlNxcXF6SkQrMEc2TEM0OURxbjFBenlTM1BsOHVQRnM1aERE?=
 =?utf-8?B?Zkp2NXoxWWNWTXBBZDJLVFQ3ek9tU0RJcFh4OW1pSlU4eE9PYllDN3dKb0lQ?=
 =?utf-8?B?aWw3aFpWYjlTdlcxR0NYeWZKbWRvOHhTUUQ1Zm5lZ3BPYU1RNFJXYkN3bk9T?=
 =?utf-8?B?ZU5sMFJQWHZFMGdFVW9MS2cxNkdHUUR5dzMxY3N4VERHb3Fic0tRdFVTL0xD?=
 =?utf-8?B?ZFkzVjhCRHQrT0lhZ2FvOGE3TWRsYkd1cWFMc2NDZVQxKzdKUVNGRWJoQmQ5?=
 =?utf-8?B?c1o2TWFYb0FPdW83d1c2YjJPSjM3bnF1UkdXSGw0eFlnSlpqWk5pcmZxbzlU?=
 =?utf-8?B?alRYRnZFMTIzVUtMWTFod1N6bzZBeTdBZHIxVjh6ampzMitEU2Y0WDMrOWJl?=
 =?utf-8?B?UDUwbzJBNEdVbFpCNkFaQU9sQzV6VDNLSitZbkVWRHNWOHZLYW92MUtNTkxn?=
 =?utf-8?B?bHBiRU8rUE0xeEZTOG9QcFh0dk9xSlU5bXBHbTNYMEJlYnlmMjRseDg1b1Y4?=
 =?utf-8?B?THhIOFFIbzlSZStKTHhEbE1sNkI3S2VWRXd6T3NyU2V0Z3ljNTRlZTBYOTVL?=
 =?utf-8?B?ZEtBVU1DTjhGSHMzZ2ZFaDFWVUxURnExMWt3WFY1N1ZZai9UaG9yMDhPdVpH?=
 =?utf-8?B?RnhVUmtaWEZadTVYc2tSV3U5bGZ2NVJ5RlRRVzZmK2ttU254cERERDYzUUR3?=
 =?utf-8?B?QUpoMXBSZmRsazlObTJlZFVDOElhcTU1Z09hU1VPS2t0TG1qbkFNOWQ2SXA3?=
 =?utf-8?B?YURIRHo0MHRTRksyTjQvaW5ONEJTbmdBRDBhYkdEaEN1eEhkL0duU0RFZXhE?=
 =?utf-8?B?N0owSCtqbDJLbHB2TDUrOFFTK0VESTlRUkdWekw0YlVzRVR0RzF6V3B2UW5E?=
 =?utf-8?B?anUxalE1WHVGam9JMzFvL2RjU1JDM041cHVXTXpCa3M3UlcxWEVsSUhWWG51?=
 =?utf-8?B?V0U2TXBOTGpaQmRSU1hQL0pwRFlRb0ljYmlRYzNRU0l6L1pBVmxvT3VFVVNQ?=
 =?utf-8?B?b09YYnN4Rm43SEUzVi9NemtrbzE1ZGVPS3o2MitXMkM5M2ZoSEZTWnQ3U1pL?=
 =?utf-8?B?bjBqcTJiVEJ5S0RuZ1hXcng3a0NieUZva1UxWWRkc3I1RU8zWGIyZGR0RTBq?=
 =?utf-8?B?Y0x2Nlh2b0kyMmhDVkxzcUFiOHl0NHpFNnJIUEsyNHdzaFlib2NhU1AxbzBG?=
 =?utf-8?B?S056SlB0Z2FBMDNGZGV3N25mc2RLdFYyNzdnODExVTBxTEtIT3J5U2Z1NnpS?=
 =?utf-8?B?Qzh4cDQwLzVLYUI3bndBNXh6WVpsTjNBbUJZNGZ3a2J2VDl3U0ZMc1E0QWRT?=
 =?utf-8?B?MVZLb0RpRVA2Ym5IM3dCdWJ3bndNRUV1ZUdEQnRHTDd3d2s5WnZYa0YzS3Y1?=
 =?utf-8?B?QXg2TW1DRDRmUVdyY0NBQnZUa2hrNUFVT2hWYzFmMkhmWTNzL0M1eGMzUXQ1?=
 =?utf-8?B?MTNTQkFiT2RkRi9lVjUrbWdqc3hpQnNORkhCZE0zVHg3eGpQMjVLc2tJUGJp?=
 =?utf-8?B?ekxIQ1pBbG4yNGxwbHNuMURsUURYRXkrQnV2Yi9aSjhTN0tSYlIyMUtXYmZt?=
 =?utf-8?B?dXkxZy9Ya3VxL0trK3hIZzFXMzJORGgwa3lDRDM5bkY4SmhGbytKV2IxeXUw?=
 =?utf-8?Q?pGp+2V+FbKO9vxnIJjKL1agSY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc58bb7b-1384-4cb7-9fa8-08ddbccde7e7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2025 20:44:30.3094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4VkzaUucNHDwaVVELYiy27qCaNIvlMhDMlLbbHSWCs5Oc3hsmnZQpdWQN9urOLVMGaggKUhrBsLJ2VVyBwVjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8746
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

On 7/4/2025 6:12 AM, Samuel Zhang wrote:
> This new api is used for hibernation to move GTT BOs to shmem after
> VRAM eviction. shmem will be flushed to swap disk later to reduce
> the system memory usage for hibernation.
> 
> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 29 +++++++++++++++++++++++++++++
>   include/drm/ttm/ttm_device.h     |  1 +
>   2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 02e797fd1891..19ab35ffeead 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -123,6 +123,35 @@ static int ttm_global_init(void)
>   	return ret;
>   }
>   
> +/**
> + * move GTT BOs to shmem for hibernation.
> + *
> + * returns 0 on success, negative on failure.
> + */
> +int ttm_device_prepare_hibernation(void)
> +{
> +	struct ttm_operation_ctx ctx = {
> +		.interruptible = false,
> +		.no_wait_gpu = false,
> +		.force_alloc = true
> +	};
> +	struct ttm_global *glob = &ttm_glob;
> +	struct ttm_device *bdev;
> +	int ret = 0;
> +
> +	mutex_lock(&ttm_global_mutex);
> +	list_for_each_entry(bdev, &glob->device_list, device_list) {
> +		do {
> +			ret = ttm_device_swapout(bdev, &ctx, GFP_KERNEL);
> +		} while (ret > 0);
> +		if (ret < 0)
> +			break;
> +	}
> +	mutex_unlock(&ttm_global_mutex);
> +	return ret;

I'd personally rather see scoped guard here so you can return 
immediately and the guard will clean up but up to Christian what he thinks.

int ret;

scoped_guard(mutex, &ttm_global_mutex) {
	list_for_each_entry(bdev, &glob->device_list, device_list) {
		do {
			ret = ttm_device_swapout(bdev, &ctx, GFP_KERNEL);
		} while (ret > 0);
		if (ret)
			return ret;
}

return 0;

> +}
> +EXPORT_SYMBOL(ttm_device_prepare_hibernation);
> +
>   /*
>    * A buffer object shrink method that tries to swap out the first
>    * buffer object on the global::swap_lru list.
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index 39b8636b1845..b45498b398dd 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -272,6 +272,7 @@ struct ttm_device {
>   int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags);
>   int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>   		       gfp_t gfp_flags);
> +int ttm_device_prepare_hibernation(void);
>   
>   static inline struct ttm_resource_manager *
>   ttm_manager_type(struct ttm_device *bdev, int mem_type)

