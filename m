Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B402DB2809A
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 15:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1410A10E952;
	Fri, 15 Aug 2025 13:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uc/KZjDB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A680B10E952
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 13:28:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UVjwLpBDmcIp9n+ZW6iwL4+jyHaFog99MlNxRPX6UoGeWLbOAs7RVTVLnvRChafQm/gYD50tTt3OCiafdlx+JE64zFASTEcAuldGFliRpqZnQTdDF2SR9r93ToIb87ivBLLfUG6tJwZaTX0WXtz51mh/4JfMFE3Nh3QxBR2973VHRz16XOQnpF5cr4qt/LHysNZxP6VlKhywgRTYqTGsLrwPs9PbS3wdezNJC5VlEyEX4SFu2MLWKnlHkGxTV0YZgAdCffWZ0TyEzdktx00bm8M1yofBzCbKpw92vwCaBXg/mYDbYg5vE3dxLcVNmsC8Yf/WTCGL8S0+6xdhmlRvmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Na0VLSA5Bxu/5vuM/q0Z//22T2Z0KKlkYUgNr668FfU=;
 b=SOwsBWtVpL98P1IABwVPTfraDVR6qa1ZoeltzNv/wbHJhfefKDTR6ruflrqi5gVh7xMk/+e0wu7FbsSm3lOY2YwWLIq5InVq0FHK6B2jhn61xMnj8w2QtJtdANTH2uT3KUd8OKwc5fBQ+zN6Er1t+N5x2dlQ+A6fA5qkYKdb5uFgGAxJmJ8J2jvtVPQMPy6kUZ+Je7HhhQv/PhuaJxwn8K4LFGhOBrbEq2Vdpm8HutgpeFOWpfrDnuTVbG2PrknNSdrL06f6sGDpTRfjiLGda8mfwdcZxVyFCjq+aNw/FWRmNjGF5b5Oa8gNGMOJevII/SN0mL32Hy0a/6QWtumRuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Na0VLSA5Bxu/5vuM/q0Z//22T2Z0KKlkYUgNr668FfU=;
 b=uc/KZjDB9u5yWHl66ZxG/QFbNtIFRE2WFeFwbyVZyus6XHE84Gr/zZP9mMC/bkYqabDwAPibSZ4hmFuKF38h1k1ZZ5yi2UQRsKHhU50erllR0BZVmVpCdvs9IRhj9t9D59qTcpOQFMqh94rgAyzOIV/gDX/oB2giGSS7Xv8c9JQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4100.namprd12.prod.outlook.com (2603:10b6:a03:200::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.19; Fri, 15 Aug
 2025 13:28:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 13:28:35 +0000
Message-ID: <56fa1b91-ddc0-464a-817a-23cea112d758@amd.com>
Date: Fri, 15 Aug 2025 15:28:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 RESEND 1/3] drm/shmem-helper: Import dmabuf without
 mapping its sg_table
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Shixiong Ou <oushixiong1025@163.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20250522070714.439824-1-oushixiong1025@163.com>
 <ba1bdfb8-dbf7-4372-bdcb-df7e0511c702@suse.de>
 <7d974eaa-d8a4-4430-a999-7b06c4e17a81@163.com>
 <9792c6c3-a2b8-4b2b-b5ba-fba19b153e21@suse.de>
 <f18a41f5-bf33-4e83-9cd1-59b0efd952c1@amd.com>
 <47ba5d7b-dd1c-4f19-92cb-523b60f1e876@suse.de>
 <b4a18ca4-2889-4a16-9b75-872a1fec3c19@suse.de>
 <e1be85e2-b7c2-44d4-87f5-b5966bc6d053@amd.com>
 <d4bcf787-2bec-410c-9eb4-4621a05aa666@suse.de>
 <805acaca-3b91-438d-b842-25c055fd898c@amd.com>
 <cebf5e76-a87b-4467-91a7-6655489f548a@suse.de>
 <5625ec2a-0014-4f54-9a71-184d15918490@amd.com>
 <05e0f219-cfaa-4cdd-b043-323d3d38fb9c@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <05e0f219-cfaa-4cdd-b043-323d3d38fb9c@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4100:EE_
X-MS-Office365-Filtering-Correlation-Id: accb6a94-7b29-4498-c7e4-08dddbffa2d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTFBSk5rU2d3VzkrVGt3a1dpakNJL3Btd1YzVGI0OGlKMG1BZ0Y3US9vYlRz?=
 =?utf-8?B?eXlBaWpRcVpUZGYreVpCd3pFbkNlbklNRFpPcDNITWhUdFN0cERoU3hVeUpQ?=
 =?utf-8?B?cWExTjJwaTBha254Y0VyTW1vWk5ON0VZejlLQVl1alltU2lnMnBtbkxQNUtn?=
 =?utf-8?B?WStWY1JNV3Fod0lWYVBJdEJ0Y1lCNGlZeE5yNlpkUXJheTk5b1JRMmZmdWZU?=
 =?utf-8?B?amJqa0loTCtNTjRJUFVKRjRLYkFvbllXd1RScTI5dHdjTmhGV1JiaGNJb2xR?=
 =?utf-8?B?dE9zTE5WNGxvZzEwTlJkbXdpTzFzR29RbDhQM1p2OFEvNXEyMW9KVjZ4TVhk?=
 =?utf-8?B?WjhpWkFJVDB5VmZTZnNIMVJFQzd3L1JIejRndDJGTlk3YUVCMXNqeVJxeTUv?=
 =?utf-8?B?RzhyeFI2dlpyb3VMSGY1Ulk0cU11YVRqVE55ZzhxZW44UHZvNjArM2dheDJW?=
 =?utf-8?B?TDFOUFI5MWdoRkI3bzNHRlpRSGFteGlJTGZvY2E2cXo5WDhJcVBidTVCT1M2?=
 =?utf-8?B?VGJaTVJYNW14clVSVElPVXNrV1V3Y0RWa0VjRVpsWG10eUEwbWp0N3k5eEJT?=
 =?utf-8?B?V00xUnNuYWxQc1MwQ3p2NXk0WDc2N0xJMW1XbTQwZkVRbUVZaTMxYzlnN3dt?=
 =?utf-8?B?SzMzc2lOYXFrNksvc3d1b1JLMXJNbHVONXMvbkY0bUJLVk5FcUFPRHpSNkJl?=
 =?utf-8?B?VGxJOFQyUGFjb2NhaEw1bkE0UkpmZ3lRYUduNHBabTd0QkZiMHZNaUVXV3Qw?=
 =?utf-8?B?ME03SFNURVBrL3JhK3oxNVNVUUhVQXY2bW9oemd4V2NhOU9GSkhKTG9XTWJB?=
 =?utf-8?B?dFB6RGw5VW5FTUQ5NUtNRW02VFUwUy9VSHBVWmRUWEdhQXRTU1RVWi81bC9a?=
 =?utf-8?B?dlNKdWtzcHFqaFd6bjkxOU5DVk53RFhrbEtmVGtLOHlhU2FOTEtaMk56d2E0?=
 =?utf-8?B?bW52NlVJVWdiNkd5OEZzNVluSkEvRG9oT1hxZGhTZzhsWGs5cnZRUlNOZzNN?=
 =?utf-8?B?aDJGZlVNOS9Xd1JJOWFvSUFIM1BrM1dUTXVuSFZNYUp3MFl0dlFjY2tiS0Iy?=
 =?utf-8?B?WlVIQW14WXhmYnhjWFFPeUcvSXVkelpRcVQwQVgvdXFUNi9PMUpNa2J5c1lT?=
 =?utf-8?B?K3RuWUgrdDI5MUhSOE9jcDE1MFEvWmFYbng2SitqVVZOK2JPVloyT2xaeEhP?=
 =?utf-8?B?a29KTW1JeVRvakxHMStGUVBrc2h6WWZ2d0FyRGxUNWZGNUszSi9UOEUrdjhG?=
 =?utf-8?B?Ujg2aTVZZ3hWYTZKYkZTeWc4NUFRbXNJdk9qUEE0UTh4YVB6d1BJZ0xxY3Ry?=
 =?utf-8?B?Z09NN2tTOVVBRmt2Wm54Um1GYlFTb213SGRrdDlzZHk3aGlIMU84YWtpS1Fo?=
 =?utf-8?B?Z0wwSjFTRFBmeUVUQzI5ZG92NjZPOXhTZTV2ZHdaajdCajgwdnJiSk5WUERL?=
 =?utf-8?B?aEJSU296RXAyQVJDakhTWHZUSmtYOENYSEtod1RXb2dJWmN1U0ZqUndOV1g5?=
 =?utf-8?B?anRuN28yc1pYZ2I3ODRCZFFnZnlOZHVScGVzSm1ORSsrTmpNRERXUVFzLzV3?=
 =?utf-8?B?NkNGdCtXbmhNWjRMSkJGa2hzWjIyR1g4RE8xVm9kN29YOG5MZ0c3K1JoaENv?=
 =?utf-8?B?V0NTNlpLRm03cTJCSjRnN24wYlhrY0NmaEg3TEVYRUxIZ29FTWtZK0cxY0xF?=
 =?utf-8?B?TlZ3WE5ZTE4zTzNXMmZsMWdZV3RGOEdGVC9OOTZxTkdjRjk0cHBRVVFKMkxC?=
 =?utf-8?B?TlluQmlZU0VUSmtLRWJzK0NUUTQzRG1UUzFIOHIzRTlVcnJtWXlhZmpxNjg2?=
 =?utf-8?B?ckhjYnhKSHdDV2dKUUNQcE9aVVV3K2J4OGdFc01vYmxGMzlxYXJuWVZvV3ZE?=
 =?utf-8?Q?AeWr9oAPABNC8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3hhcFFDWDdsZC8za3EwM3NMS2lFdDdoVnJmQllVeFdsUVVKMG94aHBpaG15?=
 =?utf-8?B?clRmcWtZQTZhWkwzQW5RUE5Ld0dkSnh0ZDJVcFQ4NkRvNjQ0L2dic09IWTVN?=
 =?utf-8?B?NzdzQkxXa2ljSkV3RjlVRThlY0Jvb1ladFk0TlNva2wzWDhwMnVpRWRqK0ZE?=
 =?utf-8?B?ckVZSUNGTnhuUnBGVHlJREVHV0gwRlpIVmo1S2tVdmpadktMbFQ1VTlnQjB0?=
 =?utf-8?B?SjRCN25RTEVKamZUMTlWeExTRnNoaXQ3K1VGRk1MdSsxa0RxMVdPMitOTDgr?=
 =?utf-8?B?L1JYQzZPcnlxQlNhZzhaTmtEeXh0b3RQUkY1WndJRlhvVzVpQkxUNmtNS25Y?=
 =?utf-8?B?OGxsdWlkT1JGQjJhdXQvOVZ1a29ZRGNFM3RJcVM5bmdPanpwNDQ1Q1RhOVdu?=
 =?utf-8?B?em1TOUM3TFp5NkxsMzFRTXlZMElxcTVERGtFcHJ6eThvVGs4SWREeWdSSkhU?=
 =?utf-8?B?bGFuUXdnQUFLNlB2K0IveE9HdnphRCtxVXE1WUtiZzl4bEtPOERmRkMwcHRQ?=
 =?utf-8?B?eGl6KzZhRytSN0tmWDVLSE80QVFIa0lOeTQ1UXhiTElEK3lUekJIRUlJZ2JP?=
 =?utf-8?B?aHlxaFprZHhzNjltMm9mQmNIaTVYSVMrbXFzUlRVc1VjeXN0Szh4VGNGZEtQ?=
 =?utf-8?B?anJKQWRmbld3T2hJZXpWWkE4dVZlVFhONnhXTFBBbmJDbVVQQUpyS0xGRFBW?=
 =?utf-8?B?SkkrR2RsWXBSUlc5eGY4ZDBHKzdnemFtUGhFa2FHYWpUQTJFUjhQMElRNG1B?=
 =?utf-8?B?Y2hFVFFpL0s3TzV2RVRMOXZGOTl1Rlk4WFhNVU1IbFQ2QlA5R0ZEcml2aVg5?=
 =?utf-8?B?OFpka093SHlWa1BoTC9UbU9rVHh2Zy9rWTI2ZUh5TzBzVCt5MEV0ZnJHNlpW?=
 =?utf-8?B?emQrY2tpdm1hVnBLbzZYUW9NRVUvZ0R2VmR0ZFBENGMwZGpMRldsNkRzQ3V0?=
 =?utf-8?B?dlJZelI1c1ZCQzkxNllMcERJM0ZZWVdWUHB5aHo1UHVod1l3RVFJcFplRXRx?=
 =?utf-8?B?K3JRcWc0Q05KYVlHcUs5Z2dCalhkbGVsaStzN25yOUJoU3lQWEkwVklYVW9U?=
 =?utf-8?B?d2ptM0ZsSnE4Z0l0a3Y4SmRlL3Y5MWV1VWQvSThBdHZmdHg2SXZsZ1U5bnl3?=
 =?utf-8?B?Vk0wdUJ5bnVLZm92aEpHU08rOXZyUGRLbXBqTlpsR0VHbTg2QTJYQW1iN0Vh?=
 =?utf-8?B?R0ZIUWErMjJOdFFvRFBDUjE0dTAzdTcya3BUSUhLNlJzTGJtU011Qk9vOEU4?=
 =?utf-8?B?L1prcHo3UVpVNHRwNFVMMW8ybjY5b0NtTG5NUlozTlNDK1M2RWtLRy9LS0dp?=
 =?utf-8?B?ajI0TWp6Z2NsVTZUYWJIaGZWSThlWnpXdHEvZFVGajZJbmtPYURISE05R2tl?=
 =?utf-8?B?NGYweXV6ZG5MV1cxNWdnNnFGRE5JQThRejExQlA2bHpxWGVTWEFrUWxjYXJE?=
 =?utf-8?B?d2NkcHBxcklMNXFKdThhVDF3bHYzWlVTdWFyQk9Rd2ZHS2Y3bXlXdEVNY011?=
 =?utf-8?B?VmIxWVRMRnprR2ZveTdZTXN5VytLSGJpak4zV3VlVThuT2N0QS9LenJaR3l0?=
 =?utf-8?B?Y1dOTWdlQmxVWkdadEFZUURtUE1TVy92YysxSFdDSHpVTzY5bUFpc0xFWnRT?=
 =?utf-8?B?TElLTGp5OUdqU2xSWmR5TmgrOElxWlZETkthTmJuRU1EeVh5U3lHMUJ6Ui9a?=
 =?utf-8?B?c3pnTXgxZzZCTFVqZFlrMTh1N0tjZVVJWWZpVmJNZHdUMHNXY3BIazc5V2lF?=
 =?utf-8?B?cmhFSnRZYkF4c0FBR3o3UlhoOVB2aVI2S2pmV2JSZ3R0eWM4RlpTN0h0NzM5?=
 =?utf-8?B?dVhGWmxZd0FQTWJhSFR1NWRBMG1zdUlaKy9US2Fkd0xyalBRR0FTSU02SkNL?=
 =?utf-8?B?dE5DYzd0emxjOVNhZVZSQ1hJcjNScC9mRkdWc09NVU1DSWFtK2ZOekZmcEpo?=
 =?utf-8?B?VCtpTjZzTnFGOW14UlpwRXVvNDlxamdmTFNYbVVYWWlIRG1KNCtGV29DTkha?=
 =?utf-8?B?K0YxSVNxbWxlS1BQc2lFdVJOVDFNbkZKdzBVTW5SQnNrbnRidkVWcFZmM0t5?=
 =?utf-8?B?RnFrKzdSQVFDNGtXLy9CL2QyMFd1cXAwbEpnSE41UXZOelFJYTFSTTUzOG1W?=
 =?utf-8?Q?K0oWU7BB2Nyh2t2bn1VWt4yh/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: accb6a94-7b29-4498-c7e4-08dddbffa2d3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 13:28:35.4760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N3QYLWijR0UX0gPOq0N3DEFTrOMMoEQhgJD0EzwVex51NQ8jxIH5vcMXBKPt5iTM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4100
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

On 15.08.25 14:46, Thomas Zimmermann wrote:
> Hi Christian
> 
> Am 14.08.25 um 15:16 schrieb Christian König:
> [...]
>>
>>
>>> Another point to keep in mind is that other drivers besides amdgpu might also be affected. Most drivers appear to be using drm_gem_prime_export(), which ends up with drm_gem_dmabuf_vmap(). So a fix there would benefit them.
>> Yeah, good point as well. I quickly checked and Xe and virtgpu seem to have the same problem.
>>
>> So we indeed need to put it somewhere into common code.
> 
> Turns out that fixing this problem is tricky.
> 
> 1) Putting a pin call into drm_gem_dmabuf_vmap() won't work easily, as amdgpu does not have a GEM pin callback. Adding one might have side effects elsewhere.
> 
> 2) One solution that works is to implement a custom version of dma_buf's vmap op for amdgpu. It does the pin and unpin around the vmap/vunmap. But it solves the problem in the wrong place and would require similar changes in  other drivers.

Agree, a driver specific solution is something we should try to avoid.

> 
> 3) Another solution is to call the dma_buf_pin() from GEM-SHMEM's vmap code. The issue here is that dma_buf_pin() is only for dynamic importers and GEM-SHMEM is none. Hence this doesn't work easily.

Ah, yes we have a WARN_ON(!attach->importer_ops) in there.

> So I took a step back to better understand why the pinning doesn't happen. Please correct if I got something wrong. The vmap'ing is valid while the buffer is either pinned or while the caller holds the resv lock.

Well, question is which vmap'ing? The problem is that we have different semantics between the TTM vmap and the DMA-buf vmap.

For TTM vmap what you wrote is correct. The vmap stays valid as long as the buffer is either pinned or while the caller hold the resv lock.

For DMA-buf the expectation is that the vmap stays valid until the importer explicitely calls dma_buf_vunmap().

> And neither is the case for udl's imported buffer. With the old code, pinning happens during import from within drm_gem_map_attach() [1] or from within dma_buf_map_attachment() [2]. Now, pinning is supposed to happen during the commit's prepare_fb step, but GEM-SHMEM doesn't implement this. Amdgpu get's this right. [3]
> 

Not quite, the problem is that we use the TTM vmap functions to implement the DMA-buf vmap functionality and the two have different semantics and expectations on the caller.

We could define the DMA-buf vmap semantics differently, that might have actually some value, but that is not something I would recommend for a bug fix.

So I think we either need to implementing the GEM pin callbacks for amdgpu or find a different solution.

What if we just add a call to ttm_bo_pin() into drm_gem_ttm_vmap? That is bypassing amdgpus pin logic, but that is not necessarily needed here.

Regards,
Christian.

> [1] https://elixir.bootlin.com/linux/v6.16/source/drivers/gpu/drm/drm_prime.c#L617
> [2] https://elixir.bootlin.com/linux/v6.16/source/drivers/dma-buf/dma-buf.c#L1116
> [3] https://elixir.bootlin.com/linux/v6.16/source/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c#L971
> 
> GEM_SHMEM behaves like a dynamic importer, but isn't one. So I think the best solution for now is to implement dynamic importing for GEM-SHMEM and do the pinning in drm_gem_shmem_vmap_locked(). [4] This works well in a prototype fix I have. A later patch series would move the pinning/unpinning into prepare_fb/cleanup_fb. That requires an update to each driver using GEM-SHEM, so it needs a separate series.
> 
> [4] https://elixir.bootlin.com/linux/v6.16/source/drivers/gpu/drm/drm_gem_shmem_helper.c#L352
> 
> Best regards
> Thomas
> 
> 
>>
>> Regards,
>> Christian.
>>
>>> Best regards
>>> Thomas
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Best regards
>>>>> Thomas
>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>> [1] https://elixir.bootlin.com/linux/v6.16/source/drivers/dma-buf/dma-buf.c#L1115
>>>>>>>
>>>>>>> Best regards
>>>>>>> Thomas
>>>>>>>
>>>>>>>> [1] https://elixir.bootlin.com/linux/v6.16/source/include/linux/iosys-map.h#L110
>>>>>>>>
>>>>>>>> Best regards
>>>>>>>> Thomas
>>>>>>>>
>>>>>>>> (*) White lie: we had problems on exotic architectures, such as sparc, but never on x86.
>>>>>>>>
>>>>>>>>
>>>>>>>>> Regards,
>>>>>>>>> Christian.
>>>>>>>>>
>>>>>>>>>> Best regards
>>>>>>>>>> Thomas
>>>>>>>>>>
>>>>>>>>>>> Best regards,
>>>>>>>>>>> Shixiong
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>> [  168.785445] BUG: unable to handle page fault for address: ffffc9012b800000
>>>>>>>>>>>> [  168.792311] #PF: supervisor read access in kernel mode
>>>>>>>>>>>> [  168.797452] #PF: error_code(0x0000) - not-present page
>>>>>>>>>>>> [  168.802586] PGD 100000067 P4D 100000067 PUD 0
>>>>>>>>>>>> [  168.807042] Oops: Oops: 0000 [#1] SMP KASAN PTI
>>>>>>>>>>>> [  168.811573] CPU: 2 UID: 1000 PID: 2380 Comm: KMS thread Tainted: G            E       6.16.0-rc5-1-default+ #4080 PREEMPT(voluntary)
>>>>>>>>>>>> [  168.823537] Tainted: [E]=UNSIGNED_MODULE
>>>>>>>>>>>> [  168.827458] Hardware name: System manufacturer System Product Name/Z170-A, BIOS 3802 03/15/2018
>>>>>>>>>>>> [  168.836125] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]
>>>>>>>>>>>> [  168.841779] Code: 0f b6 34 28 4c 89 d8 49 d3 e5 83 e0 07 4d 01 dd 83 f9 01 0f 84 4a 03 00 00 83 c0 03 40 38 f0 7c 09 40 84 f6 0f 85 82 05 00 00 <41> 8b 03 4c 63 7c 24 78 4c 89 5c 24 08 89 c6 41 89 c4 c1 e8 08
>>>>>>>>>>>> c1
>>>>>>>>>>>> [  168.860476] RSP: 0018:ffff88811c7e75c0 EFLAGS: 00010246
>>>>>>>>>>>> [  168.865697] RAX: 0000000000000003 RBX: 0000000000000000 RCX: 0000000000000002
>>>>>>>>>>>> [  168.872815] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000100
>>>>>>>>>>>> [  168.879934] RBP: dffffc0000000000 R08: ffff8881082efe00 R09: ffff8881082e0000
>>>>>>>>>>>> [  168.887046] R10: 0000000000000002 R11: ffffc9012b800000 R12: ffff88811c7e76f8
>>>>>>>>>>>> [  168.894155] R13: ffffc9012b800400 R14: ffff8881082e0007 R15: 0000000000000000
>>>>>>>>>>>> [  168.901266] FS:  00007f4685f3b6c0(0000) GS:ffff88846c690000(0000) knlGS:0000000000000000
>>>>>>>>>>>> [  168.909330] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>>>>>>>>> [  168.915058] CR2: ffffc9012b800000 CR3: 0000000117944004 CR4: 00000000003706f0
>>>>>>>>>>>> [  168.922170] Call Trace:
>>>>>>>>>>>> [  168.924616]  <TASK>
>>>>>>>>>>>> [  168.926714]  ? validate_chain+0x24e/0x5e0
>>>>>>>>>>>> [  168.930718]  ? __lock_acquire+0x568/0xae0
>>>>>>>>>>>> [  168.934725]  udl_render_hline+0x165/0x33b [udl]
>>>>>>>>>>>> [  168.939256]  ? __pfx_udl_render_hline+0x10/0x10 [udl]
>>>>>>>>>>>> [  168.944297]  ? local_clock_noinstr+0xb/0x100
>>>>>>>>>>>> [  168.948557]  ? __lock_release.isra.0+0x16c/0x2e0
>>>>>>>>>>>> [  168.953162]  ? mark_held_locks+0x40/0x70
>>>>>>>>>>>> [  168.957077]  ? lockdep_hardirqs_on_prepare.part.0+0x92/0x170
>>>>>>>>>>>> [  168.962721] udl_primary_plane_helper_atomic_update+0x432/0x670 [udl]
>>>>>>>>>>>> [  168.969145]  ? __pfx_udl_primary_plane_helper_atomic_update+0x10/0x10 [udl]
>>>>>>>>>>>> [  168.976089]  ? __pfx___drm_dev_dbg+0x10/0x10
>>>>>>>>>>>> [  168.980357]  ? drm_atomic_helper_calc_timestamping_constants+0x141/0x200
>>>>>>>>>>>> [  168.987044]  ? drm_atomic_helper_commit_planes+0x3b6/0x1030
>>>>>>>>>>>> [  168.992599] drm_atomic_helper_commit_planes+0x3b6/0x1030
>>>>>>>>>>>> [  168.997987]  drm_atomic_helper_commit_tail+0x41/0xb0
>>>>>>>>>>>> [  169.002943]  commit_tail+0x204/0x330
>>>>>>>>>>>> [  169.006513]  drm_atomic_helper_commit+0x242/0x2e0
>>>>>>>>>>>> [  169.011203]  ? __pfx_drm_atomic_helper_commit+0x10/0x10
>>>>>>>>>>>> [  169.016413]  drm_atomic_commit+0x1e1/0x290
>>>>>>>>>>>> [  169.020500]  ? prepare_signaling+0x355/0xda0
>>>>>>>>>>>> [  169.024769]  ? __pfx_drm_atomic_commit+0x10/0x10
>>>>>>>>>>>> [  169.029372]  ? __pfx___drm_printfn_info+0x10/0x10
>>>>>>>>>>>> [  169.034069]  drm_mode_atomic_ioctl+0x8ff/0xe40
>>>>>>>>>>>> [  169.038510]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
>>>>>>>>>>>> [  169.043466]  ? find_held_lock+0x2b/0x80
>>>>>>>>>>>> [  169.047295]  ? __lock_acquire+0x568/0xae0
>>>>>>>>>>>> [  169.051293]  ? mark_usage+0x65/0x180
>>>>>>>>>>>> [  169.054870]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
>>>>>>>>>>>> [  169.059823]  ? do_raw_spin_unlock+0x55/0x230
>>>>>>>>>>>> [  169.064081]  ? drm_is_current_master+0x26/0x30
>>>>>>>>>>>> [  169.068517]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
>>>>>>>>>>>> [  169.073465]  drm_ioctl_kernel+0x141/0x2b0
>>>>>>>>>>>> [  169.077468]  ? __pfx_drm_ioctl_kernel+0x10/0x10
>>>>>>>>>>>> [  169.081987]  ? lock_release.part.0+0x47/0x90
>>>>>>>>>>>> [  169.086249]  drm_ioctl+0x481/0xb50
>>>>>>>>>>>> [  169.089653]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
>>>>>>>>>>>> [  169.094610]  ? __pfx_drm_ioctl+0x10/0x10
>>>>>>>>>>>> [  169.098525]  ? find_held_lock+0x2b/0x80
>>>>>>>>>>>> [  169.102356]  ? lock_release.part.0+0x47/0x90
>>>>>>>>>>>> [  169.106621]  ? __fget_files+0x1aa/0x2f0
>>>>>>>>>>>> [  169.110450]  ? __fget_files+0x1b4/0x2f0
>>>>>>>>>>>> [  169.114281]  __x64_sys_ioctl+0x135/0x1c0
>>>>>>>>>>>> [  169.118201]  do_syscall_64+0x68/0x2a0
>>>>>>>>>>>> [  169.121856]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>>>>>>>>>>> [  169.126892] RIP: 0033:0x7f469391a53f
>>>>>>>>>>>> [  169.130460] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00
>>>>>>>>>>>> 00
>>>>>>>>>>>> [  169.149151] RSP: 002b:00007f4685f39a80 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>>>>>>>>>>>> [  169.156703] RAX: ffffffffffffffda RBX: 00007f465c002da0 RCX: 00007f469391a53f
>>>>>>>>>>>> [  169.163868] RDX: 00007f4685f39b20 RSI: 00000000c03864bc RDI: 0000000000000010
>>>>>>>>>>>> [  169.171029] RBP: 00007f4685f39b20 R08: 0000000000001310 R09: 00007f465c044cf0
>>>>>>>>>>>> [  169.178194] R10: 0000000000000002 R11: 0000000000000246 R12: 00000000c03864bc
>>>>>>>>>>>> [  169.185358] R13: 0000000000000010 R14: 00007f465c0284b0 R15: 00007f45d402b110
>>>>>>>>>>>> [  169.192525]  </TASK>
>>>>>>>>>>>> [  169.194732] Modules linked in: udl(E) snd_seq_dummy(E) snd_hrtimer(E) snd_seq(E) snd_seq_device(E) af_packet(E) nf_tables(E) iptable_filter(E) binfmt_misc(E) intel_rapl_msr(E) nls_iso8859_1(E) eeepc_wmi(E) nls
>>>>>>>>>>>> _cp437(E) intel_rapl_common(E) snd_hda_codec_realtek(E) asus_wmi(E) iTCO_wdt(E) vfat(E) ee1004(E) snd_hda_codec_generic(E) sparse_keymap(E) x86_pkg_temp_thermal(E) iTCO_vendor_support(E) snd_hda_scodec_component(
>>>>>>>>>>>> E) intel_powerclamp(E) snd_hda_codec_hdmi(E) platform_profile(E) fat(E) e1000e(E) i2c_i801(E) ptp(E) battery(E) snd_hda_intel(E) i2c_smbus(E) snd_intel_dspcfg(E) mxm_wmi(E) rfkill(E) wmi_bmof(E) intel_wmi_thunder
>>>>>>>>>>>> bolt(E) coretemp(E) pps_core(E) i2c_mux(E) pcspkr(E) snd_hda_codec(E) xfs(E) snd_hda_core(E) snd_hwdep(E) snd_pcm(E) snd_timer(E) snd(E) soundcore(E) mei_me(E) acpi_pad(E) button(E) mei(E) joydev(E) nvme_fabrics(
>>>>>>>>>>>> E) loop(E) fuse(E) efi_pstore(E) dm_mod(E) configfs(E) nfnetlink(E) ip_tables(E) x_tables(E) amdgpu(E) amdxcp(E) i2c_algo_bit(E) drm_ttm_helper(E) ttm(E) drm_exec(E) hid_generic(E)
>>>>>>>>>>>> [  169.194874]  gpu_sched(E) drm_suballoc_helper(E) ghash_clmulni_intel(E) sha512_ssse3(E) video(E) sha1_ssse3(E) aesni_intel(E) usbhid(E) drm_panel_backlight_quirks(E) drm_buddy(E) drm_display_helper(E) cec(E) w
>>>>>>>>>>>> mi(E) btrfs(E) blake2b_generic(E) xor(E) raid6_pq(E) msr(E) i2c_dev(E) efivarfs(E) dmi_sysfs(E)
>>>>>>>>>>>> [  169.311501] CR2: ffffc9012b800000
>>>>>>>>>>>> [  169.314835] ---[ end trace 0000000000000000 ]---
>>>>>>>>>>>> [  169.434549] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]
>>>>>>>>>>>> [  169.440237] Code: 0f b6 34 28 4c 89 d8 49 d3 e5 83 e0 07 4d 01 dd 83 f9 01 0f 84 4a 03 00 00 83 c0 03 40 38 f0 7c 09 40 84 f6 0f 85 82 05 00 00 <41> 8b 03 4c 63 7c 24 78 4c 89 5c 24 08 89 c6 41 89 c4 c1 e8 08
>>>>>>>>>>>> c1
>>>>>>>>>>>> [  169.459062] RSP: 0018:ffff88811c7e75c0 EFLAGS: 00010246
>>>>>>>>>>>> [  169.464309] RAX: 0000000000000003 RBX: 0000000000000000 RCX: 0000000000000002
>>>>>>>>>>>> [  169.471474] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000100
>>>>>>>>>>>> [  169.478635] RBP: dffffc0000000000 R08: ffff8881082efe00 R09: ffff8881082e0000
>>>>>>>>>>>> [  169.485800] R10: 0000000000000002 R11: ffffc9012b800000 R12: ffff88811c7e76f8
>>>>>>>>>>>> [  169.492962] R13: ffffc9012b800400 R14: ffff8881082e0007 R15: 0000000000000000
>>>>>>>>>>>> [  169.500126] FS:  00007f4685f3b6c0(0000) GS:ffff88846c690000(0000) knlGS:0000000000000000
>>>>>>>>>>>> [  169.508246] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>>>>>>>>> [  169.514014] CR2: ffffc9012b800000 CR3: 0000000117944004 CR4: 00000000003706f0
>>>>>>>>>>>> [  169.521180] note: KMS thread[2380] exited with irqs disabled
>>>>>>>>>>>> [  175.343111] ==================================================================
>>>>>>>>>>>> [  175.350342] BUG: KASAN: slab-use-after-free in mutex_can_spin_on_owner+0x1a6/0x1c0
>>>>>>>>>>>> [  175.357886] Read of size 4 at addr ffff8881172daff4 by task kworker/5:0/49
>>>>>>>>>>>> [  175.364738]
>>>>>>>>>>>> [  175.366235] CPU: 5 UID: 0 PID: 49 Comm: kworker/5:0 Tainted: G      D     E       6.16.0-rc5-1-default+ #4080 PREEMPT(voluntary)
>>>>>>>>>>>> [  175.366240] Tainted: [D]=DIE, [E]=UNSIGNED_MODULE
>>>>>>>>>>>> [  175.366242] Hardware name: System manufacturer System Product Name/Z170-A, BIOS 3802 03/15/2018
>>>>>>>>>>>> [  175.366244] Workqueue: events output_poll_execute
>>>>>>>>>>>> [  175.366249] Call Trace:
>>>>>>>>>>>> [  175.366251]  <TASK>
>>>>>>>>>>>> [  175.366254]  dump_stack_lvl+0x68/0x90
>>>>>>>>>>>> [  175.366259]  ? mutex_can_spin_on_owner+0x1a6/0x1c0
>>>>>>>>>>>> [  175.366261] print_address_description.constprop.0+0x88/0x380
>>>>>>>>>>>> [  175.366266]  ? lock_acquire+0xf2/0x140
>>>>>>>>>>>> [  175.366269]  ? mutex_can_spin_on_owner+0x1a6/0x1c0
>>>>>>>>>>>> [  175.366272]  print_report+0xf8/0x1e2
>>>>>>>>>>>> [  175.366275]  ? __virt_addr_valid+0x22e/0x500
>>>>>>>>>>>> [  175.366279]  ? kasan_addr_to_slab+0x9/0x90
>>>>>>>>>>>> [  175.366282]  ? mutex_can_spin_on_owner+0x1a6/0x1c0
>>>>>>>>>>>> [  175.366284]  kasan_report+0xd8/0x190
>>>>>>>>>>>> [  175.366288]  ? mutex_can_spin_on_owner+0x1a6/0x1c0
>>>>>>>>>>>> [  175.366294]  mutex_can_spin_on_owner+0x1a6/0x1c0
>>>>>>>>>>>> [  175.366297]  __ww_mutex_lock.constprop.0+0x2f8/0x34d0
>>>>>>>>>>>> [  175.366301]  ? do_raw_spin_trylock+0xa2/0x160
>>>>>>>>>>>> [  175.366304]  ? __pfx_do_raw_spin_trylock+0x10/0x10
>>>>>>>>>>>> [  175.366308]  ? get_nohz_timer_target+0x28/0x3d0
>>>>>>>>>>>> [  175.366311]  ? modeset_lock+0x3c6/0x640
>>>>>>>>>>>> [  175.366316]  ? __pfx___ww_mutex_lock.constprop.0+0x10/0x10
>>>>>>>>>>>> [  175.366320]  ? rcu_is_watching+0x11/0xb0
>>>>>>>>>>>> [  175.366323]  ? timerqueue_add+0x154/0x3c0
>>>>>>>>>>>> [  175.366328]  ? __hrtimer_start_range_ns+0x2e1/0x750
>>>>>>>>>>>> [  175.366331]  ? rcu_is_watching+0x11/0xb0
>>>>>>>>>>>> [  175.366334]  ? lock_acquired+0xb6/0xf0
>>>>>>>>>>>> [  175.366337]  ? rcu_is_watching+0x11/0xb0
>>>>>>>>>>>> [  175.366340]  ? rcu_is_watching+0x11/0xb0
>>>>>>>>>>>> [  175.366342]  ? drm_helper_probe_detect_ctx+0x6d/0x1a0
>>>>>>>>>>>> [  175.366345]  ? lock_acquire+0xf2/0x140
>>>>>>>>>>>> [  175.366349]  ? ww_mutex_lock+0x27/0x150
>>>>>>>>>>>> [  175.366352]  ? drm_helper_probe_detect_ctx+0x6d/0x1a0
>>>>>>>>>>>> [  175.366355]  ww_mutex_lock+0x27/0x150
>>>>>>>>>>>> [  175.366358]  modeset_lock+0x3c6/0x640
>>>>>>>>>>>> [  175.366362]  drm_helper_probe_detect_ctx+0xa6/0x1a0
>>>>>>>>>>>> [  175.366366]  ? __pfx_drm_helper_probe_detect_ctx+0x10/0x10
>>>>>>>>>>>> [  175.366375]  ? __pfx_drm_connector_list_iter_next+0x10/0x10
>>>>>>>>>>>> [  175.366381]  output_poll_execute+0x29b/0x760
>>>>>>>>>>>> [  175.366387]  ? trace_hardirqs_on+0x14/0x150
>>>>>>>>>>>> [  175.366391]  ? __pfx_output_poll_execute+0x10/0x10
>>>>>>>>>>>> [  175.366396]  process_one_work+0x7b5/0x1390
>>>>>>>>>>>> [  175.366404]  ? __pfx_process_one_work+0x10/0x10
>>>>>>>>>>>> [  175.366409]  ? assign_work+0x156/0x390
>>>>>>>>>>>> [  175.366413]  worker_thread+0x58d/0xf60
>>>>>>>>>>>> [  175.366420]  ? __pfx_worker_thread+0x10/0x10
>>>>>>>>>>>> [  175.366422]  kthread+0x370/0x720
>>>>>>>>>>>> [  175.366425]  ? __pfx_kthread+0x10/0x10
>>>>>>>>>>>> [  175.366428]  ? local_clock_noinstr+0x56/0x100
>>>>>>>>>>>> [  175.366431]  ? local_clock+0x11/0x30
>>>>>>>>>>>> [  175.366433]  ? __lock_release.isra.0+0x16c/0x2e0
>>>>>>>>>>>> [  175.366437]  ? rcu_is_watching+0x11/0xb0
>>>>>>>>>>>> [  175.366439]  ? lockdep_hardirqs_on_prepare.part.0+0x92/0x170
>>>>>>>>>>>> [  175.366442]  ? __pfx_kthread+0x10/0x10
>>>>>>>>>>>> [  175.366445]  ret_from_fork+0x1f4/0x2f0
>>>>>>>>>>>> [  175.366448]  ? __pfx_kthread+0x10/0x10
>>>>>>>>>>>> [  175.366450]  ret_from_fork_asm+0x1a/0x30
>>>>>>>>>>>> [  175.366459]  </TASK>
>>>>>>>>>>>> [  175.366460]
>>>>>>>>>>>> [  175.632772] Allocated by task 2342:
>>>>>>>>>>>> [  175.636282]  kasan_save_stack+0x1c/0x40
>>>>>>>>>>>> [  175.640137]  kasan_save_track+0x10/0x30
>>>>>>>>>>>> [  175.643992]  __kasan_slab_alloc+0x5f/0x70
>>>>>>>>>>>> [  175.648023]  kmem_cache_alloc_node_noprof+0x13a/0x380
>>>>>>>>>>>> [  175.653097]  dup_task_struct+0x32/0x730
>>>>>>>>>>>> [  175.656952]  copy_process+0x2d8/0x5380
>>>>>>>>>>>> [  175.660720]  kernel_clone+0x9f/0x5e0
>>>>>>>>>>>> [  175.664318]  __do_sys_clone3+0x135/0x180
>>>>>>>>>>>> [  175.668258]  do_syscall_64+0x68/0x2a0
>>>>>>>>>>>> [  175.671940]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>>>>>>>>>>> [  175.677014]
>>>>>>>>>>>> [  175.678520] Freed by task 0:
>>>>>>>>>>>> [  175.681418]  kasan_save_stack+0x1c/0x40
>>>>>>>>>>>> [  175.685273]  kasan_save_track+0x10/0x30
>>>>>>>>>>>> [  175.689130]  kasan_save_free_info+0x37/0x70
>>>>>>>>>>>> [  175.693333]  __kasan_slab_free+0x33/0x40
>>>>>>>>>>>> [  175.697278]  kmem_cache_free+0x10b/0x4d0
>>>>>>>>>>>> [  175.701221]  delayed_put_task_struct+0x15e/0x1e0
>>>>>>>>>>>> [  175.705858]  rcu_do_batch+0x2e3/0xb30
>>>>>>>>>>>> [  175.709542]  rcu_core+0x51d/0xb60
>>>>>>>>>>>> [  175.712873]  handle_softirqs+0x1a2/0x6b0
>>>>>>>>>>>> [  175.716817]  __irq_exit_rcu+0xf7/0x160
>>>>>>>>>>>> [  175.720585]  irq_exit_rcu+0xa/0x30
>>>>>>>>>>>> [  175.724006]  sysvec_apic_timer_interrupt+0x9d/0xc0
>>>>>>>>>>>> [  175.728820]  asm_sysvec_apic_timer_interrupt+0x16/0x20
>>>>>>>>>>>> [  175.733980]
>>>>>>>>>>>> [  175.735486] Last potentially related work creation:
>>>>>>>>>>>> [  175.740385]  kasan_save_stack+0x1c/0x40
>>>>>>>>>>>> [  175.744243]  kasan_record_aux_stack+0x88/0xa0
>>>>>>>>>>>> [  175.748618]  __call_rcu_common.constprop.0+0x77/0x850
>>>>>>>>>>>> [  175.753693]  __schedule+0x887/0x1d00
>>>>>>>>>>>> [  175.757287]  schedule+0xd0/0x260
>>>>>>>>>>>> [  175.760533]  smpboot_thread_fn+0x583/0x7a0
>>>>>>>>>>>> [  175.764650]  kthread+0x370/0x720
>>>>>>>>>>>> [  175.767896]  ret_from_fork+0x1f4/0x2f0
>>>>>>>>>>>> [  175.771665]  ret_from_fork_asm+0x1a/0x30
>>>>>>>>>>>> [  175.775608]
>>>>>>>>>>>> [  175.777113] Second to last potentially related work creation:
>>>>>>>>>>>> [  175.782886]  kasan_save_stack+0x1c/0x40
>>>>>>>>>>>> [  175.786739]  kasan_record_aux_stack+0x88/0xa0
>>>>>>>>>>>> [  175.791118]  task_work_add+0x1b1/0x270
>>>>>>>>>>>> [  175.794886]  sched_tick+0x226/0x6f0
>>>>>>>>>>>> [  175.798394]  update_process_times+0xe9/0x1f0
>>>>>>>>>>>> [  175.802685]  tick_nohz_handler+0x1a6/0x4b0
>>>>>>>>>>>> [  175.806801]  __hrtimer_run_queues+0x161/0x960
>>>>>>>>>>>> [  175.811181]  hrtimer_interrupt+0x33e/0x880
>>>>>>>>>>>> [  175.815295]  __sysvec_apic_timer_interrupt+0xf6/0x390
>>>>>>>>>>>> [  175.820370]  sysvec_apic_timer_interrupt+0x98/0xc0
>>>>>>>>>>>> [  175.825183]  asm_sysvec_apic_timer_interrupt+0x16/0x20
>>>>>>>>>>>> [  175.830343]
>>>>>>>>>>>> [  175.831849] The buggy address belongs to the object at ffff8881172dafc0
>>>>>>>>>>>> [  175.831849]  which belongs to the cache task_struct of size 11968
>>>>>>>>>>>> [  175.844582] The buggy address is located 52 bytes inside of
>>>>>>>>>>>> [  175.844582]  freed 11968-byte region [ffff8881172dafc0, ffff8881172dde80)
>>>>>>>>>>>> [  175.856969]
>>>>>>>>>>>> [  175.858474] The buggy address belongs to the physical page:
>>>>>>>>>>>> [  175.864070] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1172d8
>>>>>>>>>>>> [  175.872104] head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
>>>>>>>>>>>> [  175.879788] memcg:ffff88811068a301
>>>>>>>>>>>> [  175.883209] anon flags: 0x2ffff800000040(head|node=0|zone=2|lastcpupid=0x1ffff)
>>>>>>>>>>>> [  175.890547] page_type: f5(slab)
>>>>>>>>>>>> [  175.893706] raw: 002ffff800000040 ffff888100930500 0000000000000000 0000000000000001
>>>>>>>>>>>> [  175.901479] raw: 0000000000000000 0000000000020002 00000000f5000000 ffff88811068a301
>>>>>>>>>>>> [  175.909249] head: 002ffff800000040 ffff888100930500 0000000000000000 0000000000000001
>>>>>>>>>>>> [  175.917109] head: 0000000000000000 0000000000020002 00000000f5000000 ffff88811068a301
>>>>>>>>>>>> [  175.924968] head: 002ffff800000003 ffffea00045cb601 00000000ffffffff 00000000ffffffff
>>>>>>>>>>>> [  175.932827] head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
>>>>>>>>>>>> [  175.940685] page dumped because: kasan: bad access detected
>>>>>>>>>>>> [  175.946283]
>>>>>>>>>>>> [  175.947787] Memory state around the buggy address:
>>>>>>>>>>>> [  175.952603]  ffff8881172dae80: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>>>>>>>>>>>> [  175.959854]  ffff8881172daf00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>>>>>>>>>>>> [  175.967101] >ffff8881172daf80: fc fc fc fc fc fc fc fc fa fb fb fb fb fb fb fb
>>>>>>>>>>>> [ 175.974353] ^
>>>>>>>>>>>> [  175.981256]  ffff8881172db000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>>>>>>>>>>> [  175.988504]  ffff8881172db080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>>>>>>>>>>> [  175.995755] ==================================================================
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> Am 22.05.25 um 09:07 schrieb oushixiong1025@163.com:
>>>>>>>>>>>>> From: Shixiong Ou <oushixiong@kylinos.cn>
>>>>>>>>>>>>>
>>>>>>>>>>>>> [WHY]
>>>>>>>>>>>>> 1. Drivers using DRM_GEM_SHADOW_PLANE_HELPER_FUNCS and
>>>>>>>>>>>>>         DRM_GEM_SHMEM_DRIVER_OPS (e.g., udl, ast) do not require
>>>>>>>>>>>>>         sg_table import.
>>>>>>>>>>>>>         They only need dma_buf_vmap() to access the shared buffer's
>>>>>>>>>>>>>         kernel virtual address.
>>>>>>>>>>>>>
>>>>>>>>>>>>> 2. On certain Aspeed-based boards, a dma_mask of 0xffff_ffff may
>>>>>>>>>>>>>         trigger SWIOTLB during dmabuf import. However, IO_TLB_SEGSIZE
>>>>>>>>>>>>>         restricts the maximum DMA streaming mapping memory, resulting in
>>>>>>>>>>>>>         errors like:
>>>>>>>>>>>>>
>>>>>>>>>>>>>         ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728 bytes), total 32768 (slots), used 0 (slots)
>>>>>>>>>>>>>
>>>>>>>>>>>>> [HOW]
>>>>>>>>>>>>> Provide a gem_prime_import implementation without sg_table mapping
>>>>>>>>>>>>> to avoid issues (e.g., "swiotlb buffer is full"). Drivers that do not
>>>>>>>>>>>>> require sg_table can adopt this.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>> v1->v2:
>>>>>>>>>>>>>         Patch rebase.
>>>>>>>>>>>>> v2->v3:
>>>>>>>>>>>>>         Rename the import callback function.
>>>>>>>>>>>>>         Remove drm_gem_shmem_prime_export() and separate some codes
>>>>>>>>>>>>>         to drm_gem_prime_import_self().
>>>>>>>>>>>>> v3->v4:
>>>>>>>>>>>>>         Separate the test from the policy.
>>>>>>>>>>>>>         Rename the macro.
>>>>>>>>>>>>> v4->v5:
>>>>>>>>>>>>>         Rename some functions.
>>>>>>>>>>>>>
>>>>>>>>>>>>>       drivers/gpu/drm/drm_gem_shmem_helper.c | 57 ++++++++++++++++++++++++++
>>>>>>>>>>>>>       drivers/gpu/drm/drm_prime.c            | 36 ++++++++++++----
>>>>>>>>>>>>>       include/drm/drm_gem_shmem_helper.h     | 15 +++++++
>>>>>>>>>>>>>       include/drm/drm_prime.h                |  3 ++
>>>>>>>>>>>>>       4 files changed, 102 insertions(+), 9 deletions(-)
>>>>>>>>>>>>>
>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>>>>>>>>>>> index aa43265f4f4f..126aa79042ad 100644
>>>>>>>>>>>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>>>>>>>>>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>>>>>>>>>>> @@ -800,6 +800,63 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>>>>>>>>>>>>>       }
>>>>>>>>>>>>> EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
>>>>>>>>>>>>>       +/**
>>>>>>>>>>>>> + * drm_gem_shmem_prime_import_no_map - Import dmabuf without mapping its sg_table
>>>>>>>>>>>>> + * @dev: Device to import into
>>>>>>>>>>>>> + * @dma_buf: dma-buf object to import
>>>>>>>>>>>>> + *
>>>>>>>>>>>>> + * Drivers that use the shmem helpers but also wants to import dmabuf without
>>>>>>>>>>>>> + * mapping its sg_table can use this as their &drm_driver.gem_prime_import
>>>>>>>>>>>>> + * implementation.
>>>>>>>>>>>>> + */
>>>>>>>>>>>>> +struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
>>>>>>>>>>>>> +                             struct dma_buf *dma_buf)
>>>>>>>>>>>>> +{
>>>>>>>>>>>>> +    struct dma_buf_attachment *attach;
>>>>>>>>>>>>> +    struct drm_gem_shmem_object *shmem;
>>>>>>>>>>>>> +    struct drm_gem_object *obj;
>>>>>>>>>>>>> +    size_t size;
>>>>>>>>>>>>> +    int ret;
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    if (drm_gem_is_prime_exported_dma_buf(dev, dma_buf)) {
>>>>>>>>>>>>> +        /*
>>>>>>>>>>>>> +         * Importing dmabuf exported from our own gem increases
>>>>>>>>>>>>> +         * refcount on gem itself instead of f_count of dmabuf.
>>>>>>>>>>>>> +         */
>>>>>>>>>>>>> +        obj = dma_buf->priv;
>>>>>>>>>>>>> +        drm_gem_object_get(obj);
>>>>>>>>>>>>> +        return obj;
>>>>>>>>>>>>> +    }
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    attach = dma_buf_attach(dma_buf, dev->dev);
>>>>>>>>>>>>> +    if (IS_ERR(attach))
>>>>>>>>>>>>> +        return ERR_CAST(attach);
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    get_dma_buf(dma_buf);
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    size = PAGE_ALIGN(attach->dmabuf->size);
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    shmem = __drm_gem_shmem_create(dev, size, true, NULL);
>>>>>>>>>>>>> +    if (IS_ERR(shmem)) {
>>>>>>>>>>>>> +        ret = PTR_ERR(shmem);
>>>>>>>>>>>>> +        goto fail_detach;
>>>>>>>>>>>>> +    }
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    drm_dbg_prime(dev, "size = %zu\n", size);
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    shmem->base.import_attach = attach;
>>>>>>>>>>>>> +    shmem->base.resv = dma_buf->resv;
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    return &shmem->base;
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +fail_detach:
>>>>>>>>>>>>> +    dma_buf_detach(dma_buf, attach);
>>>>>>>>>>>>> +    dma_buf_put(dma_buf);
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    return ERR_PTR(ret);
>>>>>>>>>>>>> +}
>>>>>>>>>>>>> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_no_map);
>>>>>>>>>>>>> +
>>>>>>>>>>>>>       MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
>>>>>>>>>>>>>       MODULE_IMPORT_NS("DMA_BUF");
>>>>>>>>>>>>>       MODULE_LICENSE("GPL v2");
>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>>>>>>>>>>>>> index d828502268b8..b825b71038d6 100644
>>>>>>>>>>>>> --- a/drivers/gpu/drm/drm_prime.c
>>>>>>>>>>>>> +++ b/drivers/gpu/drm/drm_prime.c
>>>>>>>>>>>>> @@ -910,6 +910,26 @@ struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
>>>>>>>>>>>>>       }
>>>>>>>>>>>>>       EXPORT_SYMBOL(drm_gem_prime_export);
>>>>>>>>>>>>>       +
>>>>>>>>>>>>> +/**
>>>>>>>>>>>>> + * drm_gem_is_prime_exported_dma_buf -
>>>>>>>>>>>>> + * checks if the DMA-BUF was exported from a GEM object belonging to @dev.
>>>>>>>>>>>>> + * @dev: drm_device to check against
>>>>>>>>>>>>> + * @dma_buf: dma-buf object to import
>>>>>>>>>>>>> + *
>>>>>>>>>>>>> + * Return: true if the DMA-BUF was exported from a GEM object belonging
>>>>>>>>>>>>> + * to @dev, false otherwise.
>>>>>>>>>>>>> + */
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +bool drm_gem_is_prime_exported_dma_buf(struct drm_device *dev,
>>>>>>>>>>>>> +                       struct dma_buf *dma_buf)
>>>>>>>>>>>>> +{
>>>>>>>>>>>>> +    struct drm_gem_object *obj = dma_buf->priv;
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +    return (dma_buf->ops == &drm_gem_prime_dmabuf_ops) && (obj->dev == dev);
>>>>>>>>>>>>> +}
>>>>>>>>>>>>> +EXPORT_SYMBOL(drm_gem_is_prime_exported_dma_buf);
>>>>>>>>>>>>> +
>>>>>>>>>>>>>       /**
>>>>>>>>>>>>>        * drm_gem_prime_import_dev - core implementation of the import callback
>>>>>>>>>>>>>        * @dev: drm_device to import into
>>>>>>>>>>>>> @@ -933,16 +953,14 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
>>>>>>>>>>>>>           struct drm_gem_object *obj;
>>>>>>>>>>>>>           int ret;
>>>>>>>>>>>>>       -    if (dma_buf->ops == &drm_gem_prime_dmabuf_ops) {
>>>>>>>>>>>>> +    if (drm_gem_is_prime_exported_dma_buf(dev, dma_buf)) {
>>>>>>>>>>>>> +        /*
>>>>>>>>>>>>> +         * Importing dmabuf exported from our own gem increases
>>>>>>>>>>>>> +         * refcount on gem itself instead of f_count of dmabuf.
>>>>>>>>>>>>> +         */
>>>>>>>>>>>>>               obj = dma_buf->priv;
>>>>>>>>>>>>> -        if (obj->dev == dev) {
>>>>>>>>>>>>> -            /*
>>>>>>>>>>>>> -             * Importing dmabuf exported from our own gem increases
>>>>>>>>>>>>> -             * refcount on gem itself instead of f_count of dmabuf.
>>>>>>>>>>>>> -             */
>>>>>>>>>>>>> -            drm_gem_object_get(obj);
>>>>>>>>>>>>> -            return obj;
>>>>>>>>>>>>> -        }
>>>>>>>>>>>>> +        drm_gem_object_get(obj);
>>>>>>>>>>>>> +        return obj;
>>>>>>>>>>>>>           }
>>>>>>>>>>>>>             if (!dev->driver->gem_prime_import_sg_table)
>>>>>>>>>>>>> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
>>>>>>>>>>>>> index b4f993da3cae..35f7466dca84 100644
>>>>>>>>>>>>> --- a/include/drm/drm_gem_shmem_helper.h
>>>>>>>>>>>>> +++ b/include/drm/drm_gem_shmem_helper.h
>>>>>>>>>>>>> @@ -287,6 +287,8 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>>>>>>>>>>>>>                           struct sg_table *sgt);
>>>>>>>>>>>>>       int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>>>>>>>>>>>>>                         struct drm_mode_create_dumb *args);
>>>>>>>>>>>>> +struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
>>>>>>>>>>>>> +                             struct dma_buf *buf);
>>>>>>>>>>>>>         /**
>>>>>>>>>>>>>        * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations
>>>>>>>>>>>>> @@ -298,4 +300,17 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>>>>>>>>>>>>>           .gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table, \
>>>>>>>>>>>>>           .dumb_create           = drm_gem_shmem_dumb_create
>>>>>>>>>>>>>       +/**
>>>>>>>>>>>>> + * DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT - shmem GEM operations
>>>>>>>>>>>>> + *                                       without mapping sg_table on
>>>>>>>>>>>>> + *                                       imported buffer.
>>>>>>>>>>>>> + *
>>>>>>>>>>>>> + * This macro provides a shortcut for setting the shmem GEM operations in
>>>>>>>>>>>>> + * the &drm_driver structure for drivers that do not require a sg_table on
>>>>>>>>>>>>> + * imported buffers.
>>>>>>>>>>>>> + */
>>>>>>>>>>>>> +#define DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT \
>>>>>>>>>>>>> +    .gem_prime_import       = drm_gem_shmem_prime_import_no_map, \
>>>>>>>>>>>>> +    .dumb_create            = drm_gem_shmem_dumb_create
>>>>>>>>>>>>> +
>>>>>>>>>>>>>       #endif /* __DRM_GEM_SHMEM_HELPER_H__ */
>>>>>>>>>>>>> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
>>>>>>>>>>>>> index fa085c44d4ca..f50f862f0d8b 100644
>>>>>>>>>>>>> --- a/include/drm/drm_prime.h
>>>>>>>>>>>>> +++ b/include/drm/drm_prime.h
>>>>>>>>>>>>> @@ -100,6 +100,9 @@ struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
>>>>>>>>>>>>>       unsigned long drm_prime_get_contiguous_size(struct sg_table *sgt);
>>>>>>>>>>>>>         /* helper functions for importing */
>>>>>>>>>>>>> +bool drm_gem_is_prime_exported_dma_buf(struct drm_device *dev,
>>>>>>>>>>>>> +                       struct dma_buf *dma_buf);
>>>>>>>>>>>>> +
>>>>>>>>>>>>>       struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
>>>>>>>>>>>>>                               struct dma_buf *dma_buf,
>>>>>>>>>>>>>                               struct device *attach_dev);
> 

