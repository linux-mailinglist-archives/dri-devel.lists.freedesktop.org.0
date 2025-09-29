Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B7CBA8605
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 10:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E63910E3B6;
	Mon, 29 Sep 2025 08:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="n79JNck2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013002.outbound.protection.outlook.com
 [40.93.201.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A3210E3B2;
 Mon, 29 Sep 2025 08:20:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ds7sbbo6GQHr0qrpBCpiyR1i9/UiA5ciHlu5Qsr2xZHBF3t6YnVBI2rZcvILzs+xsprxm9bxnrgIrvkCTupKUfkXNN5veAFVnh2wyxISQuhpDNkx2OuAp+4NVMEr3s310G51vHeN2uNA2CrNNAwb5XUYUXmq8a7R4cQjmNYNmyTgNWcfXVd9HW4blWSy5OGgVMf8P1rEVSpHDoBQ4Pntb8TuHrsk1YkF8l1ygsUix3Civ3ORxmtP4nClhikuNHfRuYy/lUEda6v8/5vR9GAJwlyh4MtWOqis3FDXaUDHf3pBYnAnRdGpKdRZ5U9bSMFqO++ThvS8JGE4CcjqxX3kEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXA368NvfWCLSrvh9UvTraQvHEk58vjh7rViT2zxTAk=;
 b=gNPPRSZM5cOAY8RHyWyXHMuMbn6+rSK8DgXqhzLpNdzstsVmwC9VyEqQX7rfbqXLci48iipobnjTCAILcAJy/y3IhFIinOnwX5imeqgBiIOg0A6nA7VKWPJTyqJR/F1Rb1mLSoFgImqaE+aH9IpAVi8b4C9JhXz3S8TJvMvcxstt451170li+oB07PW47hVfXg8TLhXxxiiXp69015vYy2IAA/YyT3Gruck1KJBB9if3+5iAUxHZjIN4oyBHT58OifcFUimP0O/Js69KdJySq29Sn4Cnsa2+bmH2z8Wv194eeP/QWBF7bw7HCXwT1sWM4mkHogLLBXHKXjIxF9uCbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXA368NvfWCLSrvh9UvTraQvHEk58vjh7rViT2zxTAk=;
 b=n79JNck2O2uEZvRqNEvYHYdZRCK0wPFnVnEKsm5OhAeRn5CHLv38G5QGVHvHTnAhg8CiqQnIg3HSNWgTJGt14MC9mpCOMVDJOJOf7KjPaEwUwH8QKajiglo/roqFvbuO7FGaRdr+LKnwgpgpvAs9OB3GnvLpoEr8dZQoqYgX/Z8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB5657.namprd12.prod.outlook.com (2603:10b6:806:234::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 08:20:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 08:20:33 +0000
Message-ID: <a5ffd1ee-b0b5-40bd-b68f-3779ca70dcae@amd.com>
Date: Mon, 29 Sep 2025 10:20:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/2] dma-buf: Add support for private interconnects
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kasireddy Vivek <vivek.kasireddy@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20250926084624.2288-1-thomas.hellstrom@linux.intel.com>
 <20250926084624.2288-2-thomas.hellstrom@linux.intel.com>
 <472f27f0-2f54-45dd-b0a6-3a26b5eec301@amd.com>
 <ef9f4fb1c55bf3e5e6423b2accdccee0607b95ef.camel@linux.intel.com>
 <20250926144128.GD2617119@nvidia.com>
 <765e3449-2eb1-49f5-954e-3bab5a5fc9d1@amd.com>
 <20250926160036.GE2617119@nvidia.com>
 <d3cc5b7fe4189c6f529b532273ece34c9c0e975f.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <d3cc5b7fe4189c6f529b532273ece34c9c0e975f.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:208:32b::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB5657:EE_
X-MS-Office365-Filtering-Correlation-Id: 10766ba9-6401-4057-c31e-08ddff310f85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnNqVUhHdXgvQWcxdVA2M1JnQ2FHcVpKNFllbG1wdkxWb3JMd2FTME00ZEZi?=
 =?utf-8?B?V281WG83UUp6NHZleVJNSzQvdXJuOUlaOFF3ZE4zR0dsSzB5NnlmendycjE3?=
 =?utf-8?B?Y0VrZ3BFSSsxZTJKa2QweUpRcng0U000R2F3clMzc1R2UjZzUjVtODQxaFhz?=
 =?utf-8?B?cXlCZ2RmMGpRUWhTampjRklLempuWjdxWnFsa25raGpFYzI3T1VVSUYyWXd1?=
 =?utf-8?B?NFFxZ3l4Y3BzMTNlUkhVN3pWN25MVStzYmJQTjVHWkJNbzR0ZCtCQktwT3BL?=
 =?utf-8?B?aXhuTWN6YlVycGNCNU1ESkdCNFFBNXlUcGU5RHd5Y1k2WkJodnpJRFZJQm9R?=
 =?utf-8?B?YzN0eXFRbnNRYjlPcjIxa3ovZEdXMXlsT3pldnpSWEhhL2dPYkJpWDVWMjhI?=
 =?utf-8?B?UllKMTA4ek8xK1NSOHV4UVIxTUZySkpOUFBPbkh1SGpVRExNblhueEpNVjJB?=
 =?utf-8?B?a096bDRQb2NnODNOUWpqS0lmNCtmdGQ0K1dsV2RsdHNpVWNyWEFzQ2VkbmNp?=
 =?utf-8?B?SFk2RUVsTVBRcFYzQlpNRVJkRzhsdWhnN3FaVGppVWd6c1lac2p1NG9FY0hG?=
 =?utf-8?B?ODU1eTZ5SmJnUWh5TlVvZzJWRzVmeUl1TThMQ01heGhydDdMdWpvWUdrMjlU?=
 =?utf-8?B?Tyt1Z3RLUlhUakxQakgvaWh6ZWNzdnZwaGNlZ3h3cnlvZXl4TDMvRHFFSDZp?=
 =?utf-8?B?SU1wM2VMWng1dGtoNU1mVWptM2ZEajFNMHB5TE92WXpvZm1MdVMwaWZaWWEr?=
 =?utf-8?B?RlVKbTlwd29aZk5LbjVIQXVvcTF1ZEFyc1pKcGwwQmZZbkpkbTJVUnFqYXRE?=
 =?utf-8?B?ZG1VdTdoR2NOZ3U3cnhqVTdTZlFPRitscm4wSzRYRmIyRUJiKzBadXhsMHRD?=
 =?utf-8?B?VDA2MEdOYUlEZlk1UFlDOUxlRWhETDFvbHIxanJ4MWVUa0pIS3hpZG1PN0lr?=
 =?utf-8?B?U2k2ZWFIamNTa2sxeVBwRU0xY21Pc0pmZTdLcE5pSDZzck5aUmt3SE5icTEw?=
 =?utf-8?B?YVRNMGFHOUdpN2pZMUIrcVZZcUJEblErRFpROWZ4dk9ZME9BVXFXb1g2RmFu?=
 =?utf-8?B?Q1FFMkVGQktMQUNsZlZ3V0V0Z3M0OVFzZnRLbW5reC9HdG94VHFnRHdsNjVJ?=
 =?utf-8?B?K2NOTGM1ZTJlSzM2N1RPKzh4ZzFHWjFCQ092T0krWTA0MHhCckQwNUdJQUJP?=
 =?utf-8?B?ZjFZNnBjV05lRTExeEw3VkdtYzJQdisxaHh1eUIzaHVZN3FvcWI5Y3ovdmQw?=
 =?utf-8?B?MXNNa1R3bXBFb0ZkblprU2h2ajYvUWp6aWlqU3FpcjhHb2w5VmVLYnNxWDQ2?=
 =?utf-8?B?NmFIRExYMEd6TDJWN0tyWHVPR0N0WlFFektvQlJVNVFpMXQwbUdaaWRocmdz?=
 =?utf-8?B?dzVjWUVQYTQ2cVlkWG9WbDU3QVJkUGJSNGI3ZlZWeXVvT1dSeXZydDBGRThS?=
 =?utf-8?B?N25WamR1UGlJdzJ2Rmhwd3M0WVdmZkhhcFIzUmtVOU1PWmZyZ3JGUXRLaFZi?=
 =?utf-8?B?NmZnbEtMQUFGVUZmSXNCYkYvU0E2WHRyZ2FwOUwrSTNIaEdrYkYyYThiTDlq?=
 =?utf-8?B?dTZSdjhneWFTamxWRlFscXVvT1J1UWhycnhZVHYrQTB4Q1NudlZjOG5DSFp4?=
 =?utf-8?B?OFFhdWNLcTM0emJGQ2dqR1JtejMrTE9XNmlqQ3VrbzV4dDEva0Z1VlNuZmI1?=
 =?utf-8?B?VDlCWWNBK0lwWjJIYkNJT3p0ZDFDczdBdDZLejhoaXRLTmRITDUrWTFZVWpN?=
 =?utf-8?B?d0U3Y0MxY25rZXNrc09nTkFUc001VktJN1p5b0hmU2gwYUJMSklKeWtxUXZ5?=
 =?utf-8?B?NXlKcWlNNWNNRnVBY2hnbUZrTzNTNzF6bFo2ZTVhMzNMQVdNQWxuQXBYaEZ6?=
 =?utf-8?B?UXorb1VaTUcvRnVGK3YxMEhGR1ZLZHBHM3VIWjFGeVBQRDczelZ6TkJMSUoy?=
 =?utf-8?Q?MBw5LkL4PUhBKqlSH/Q5qlRFDzFZ5m8D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTAwM21INDBwRGxrQVV3bzdHSk84bm9oekFKWmZoRXNSakFId2M3SFVIa1gy?=
 =?utf-8?B?WE1ZNDdKSE1TK081SXU4VFRiN3RBNW85ZjRycTFEMThmVmwvbHU2ejlQNW4v?=
 =?utf-8?B?WmgzLzNDeTdIbHdpdStNNi9rR0lYVVRIanllajBZZ01pS2tqQXZGZWREMHpW?=
 =?utf-8?B?NmU3cTg5TlhQQ0lvWkFTUW9CdWQ3RkJ5QlF6M1pXY245UmdadVp5VytvL0pQ?=
 =?utf-8?B?MG91WnJaSzg0M05UbjN6M1duSWZKNzFEYU91ZEZoTURaVXNkSUdmQXdISnNx?=
 =?utf-8?B?cGJuVzZLdU9CVkxiOU1CNFRWbU9JNlZMdFZhclJJbUt2WmRMSFZWTTBzbFBP?=
 =?utf-8?B?dlVyd1RYbzNKdjBDK1hlL3pNNXlhNE5FOGZyUVlkWGIvTGFiRmZZVVlDUEty?=
 =?utf-8?B?YVJwMG02U0dBQVF5ZmQ5MzRXMlhkdms5TjJYazhhNjNXUThjR1FTcjlwWlI3?=
 =?utf-8?B?RVVXRDB3ZWFYWWxnQ1RMRmFUUHQvMmRxWUZPR0FTWXNrUlRxUDYzTVFuOXU3?=
 =?utf-8?B?Rk1jOFQrY2J1NTJ1MDhacWJGckY0SUJIOC95TGtyL2liNmJJRldCY2ZZVlBz?=
 =?utf-8?B?MFNtTEN0NUwvWThmcyswSVNFRk1TWWh3VStBV2JveXk2T0FVbXBUSDFXMjdl?=
 =?utf-8?B?Qm5BK1Nnd2ZNNVJ5OFRlMUQ0Vi9aYlpSZmhwOXZqeFBVUGxZa3NSbUNhM3hQ?=
 =?utf-8?B?WGhqNlJ0bUxqTFRUZTBZSXhnY00rTjZvZ2F1UFRIR0VMWVZWYzU1SVNtRVg0?=
 =?utf-8?B?WmIzOWlNZFBJRjVHcHlQbXlkUldkdGd4U2FYS3U0Y053UGtiRmRmd2JoZ2hy?=
 =?utf-8?B?MVBzdEcvTjFCSFBaTUxBS0xTbkFxZ2dxWXVQYk9SeXVUTUtQdmRTbzFHdWFh?=
 =?utf-8?B?VEhtTWNiQlJsczlNbkFGOFVMR2JmbWs2OFV0NkpkNElDZUZrNjdaczdvS0gx?=
 =?utf-8?B?TDN0aVJhdEVwOHZlNzJXSzc3YVhjUTBIYzRlL3pCdnI1UXdYcVZxQ0ZjR0tk?=
 =?utf-8?B?MHBHWmJpUmVSZkhHTUk0dHhaMDM1S2NScDR1dHo5WWVjT0JLMHBrTGNJcXVy?=
 =?utf-8?B?eEJVMW9qRW9MMTc2bkZWcWh0S0pqSWtRbWRJYjk0RVM4d2Y2WE5Cak5WS3NW?=
 =?utf-8?B?WjBhWEdOYlVnTnV3TFNtZDN3akJnejVIUEQ2VENRNytPK3RhaXNPVStWeThW?=
 =?utf-8?B?U01xeUpMLzM4Tk1SWGVtWlRSNm1OcWM1N3FpRXg0WVpGMEhHVzg4YUpsbWRJ?=
 =?utf-8?B?c1FndldVVVJtdGxQV1RFTFZibWlaZ0h5L0RDd0JtajRQS2t3enFFelVnMWh4?=
 =?utf-8?B?NitHK3hoMmxkWklXSVNiOVF5aTREMWJFbStPSWZpcjBHdXpMVml4WG9ZZmlQ?=
 =?utf-8?B?NmV4Z1dHZVAxMTh6dVBoS0lGeXM3djVDSmIzNTExdlhmSTdLRzhXZlBPZjlx?=
 =?utf-8?B?cWZVeHZ5QjgyT1FaMG1xMDhQdnR0OHhFd2R1VmRTRVVaR1lVZml5N3hDVjJM?=
 =?utf-8?B?Z2twYUsvbTFhUHd0aS9KSUROSzNnVTVZeWRoZVF5UmZzQ1BFd2RnVHZVdWRR?=
 =?utf-8?B?VEo0bXQ5ZnpsYmtHVlVJREQ1RHpycWNjRmVHUFBEaiszNWtTR2ROV3BpSk9T?=
 =?utf-8?B?aENHem02NnBzSWhJRklCQWtLWVpTOXNXbCt4SFVvYkxoSGNoNGR5T0ZtSDZl?=
 =?utf-8?B?NlZDU3dPUDdabEY2bXZRL0FLZy9rWitwYmEzUXk0bXY4Q2xRNXlJZjNzcmt2?=
 =?utf-8?B?RkhKU2dQdW9kcHp5c2xvR3RFN1drWlV3Zm9aWGt0ekZGdnZKOTIzaVpVRGFp?=
 =?utf-8?B?dUFpclByeUhoZDZDTDZwa0Y1alFmVkcxMTIxVzloa2ptTy90aDRHcmdHYXUx?=
 =?utf-8?B?Ty9vRmgxZVhxN3A4QzFOc251Tld0RVYxOTd2Ukd1UmNpZ0p1dlN5cGFNdGk0?=
 =?utf-8?B?cFc1cWt2WUpxVE5NL2tMSFRqd3Z6QkJnUVpVRUF0M216aWFJMENmSjYxNUNv?=
 =?utf-8?B?bW9Kbm9yUEZWL0pSRGtXNGUrTlJWVzBYSldrWE5zcVo3NEs4NG5US1NpWnE4?=
 =?utf-8?B?MThJQ0FUZ2NDVGxHcys1cGt3NjVPWVBCYTFaMVEwR2ZCZlVhaHVpa3FkL0Vq?=
 =?utf-8?Q?HprNPx28VbQfFyNZStu3sxUYK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10766ba9-6401-4057-c31e-08ddff310f85
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 08:20:33.7444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0dymTEotBeflSTys5AngJmSDLMTKo3OO5dX83wIT1T5wP/xfladsvqS0DtNm8Nk+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5657
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

On 29.09.25 10:16, Thomas Hellström wrote:
> On Fri, 2025-09-26 at 13:00 -0300, Jason Gunthorpe wrote:
>> On Fri, Sep 26, 2025 at 04:51:29PM +0200, Christian König wrote:
>>> On 26.09.25 16:41, Jason Gunthorpe wrote:
>>>> On Fri, Sep 26, 2025 at 03:51:21PM +0200, Thomas Hellström wrote:
>>>>
>>>>> Well both exporter and exporter has specific information WRT
>>>>> this. The
>>>>> ultimate decision is done in the exporter attach() callback,
>>>>> just like
>>>>> pcie_p2p. And the exporter acknowledges that by setting the
>>>>> dma_buf_attachment::interconnect_attach field. In analogy with
>>>>> the
>>>>> dma_buf_attachment::peer2peer member.
>>>>
>>>> Having a single option seems too limited to me..
>>>
>>> Yeah, agree.
>>>
>>>> I think it would be nice if the importer could supply a list of
>>>> 'interconnects' it can accept, eg:
>>>>
>>>>  - VRAM offset within this specific VRAM memory
>>>>  - dma_addr_t for this struct device
>>>>  - "IOVA" for this initiator on a private interconnect
>>>>  - PCI bar slice
>>>>  - phys_addr_t (used between vfio, kvm, iommufd)
>>>
>>> I would rather say that the exporter should provide the list of
>>> what
>>> interconnects the buffer might be accessible through.
>>
>> Either direction works, I sketched it like this because I thought
>> there were more importers than exporters, and in the flow it is easy
>> for the importer to provide a list on the stack
>>
>> I didn't sketch further, but I think the exporter and importer should
>> both be providing a compatible list and then in almost all cases the
>> core code should do the matching.
>>
>> If the importer works as I showed, then the exporter version would be
>> in an op:
>>
>> int exporter_negotiate_op(struct dma_buf *dmabuf,
>>    struct dma_buf_interconnect_negotiation *importer_support, size_t
>> importer_len)
>> {
>>      struct dma_buf_interconnect_negotiation exporter_support[2] = {
>>          [0] = {.interconnect = myself->xe_vram},
>>          [1] = {.interconnect = &dmabuf_generic_dma_addr_t,
>> .interconnect_args = exporter_dev},
>>      };
>>      return dma_buf_helper_negotiate(dmabuf, exporter_support,
>>              ARRAY_SIZE(exporter_support), importer_support,
>> importer_len);
>> }
>>
>> Which the dma_buf_negotiate() calls.
>>
>> The core code does the matching generically, probably there is a
>> struct dma_buf_interconnect match() op it uses to help this process.
>>
>> I don't think importer or exporter should be open coding any
>> matching.
>>
>> For example, we have some systems with multipath PCI. This could
>> actually support those properly. The RDMA NIC has two struct devices
>> it operates with different paths, so it would write out two
>> &dmabuf_generic_dma_addr_t's - one for each.
>>
>> The GPU would do the same. The core code can have generic code to
>> evaluate if P2P is possible and estimate some QOR between the
>> options.
> 
> This sounds OK with me. I have some additional questions, though,
> 
> 1) Everybody agrees that the interconnect used is a property of the
> attachment? It should be negotiated during attach()?

Yes, attach allows the exporter to know who wants to access it's buffer.

Map/unmap then requests the actual location where the exporter has moved the buffer so that it is accessible by everybody.

> 2) dma-buf pcie-p2p allows transparent fallback to system memory dma-
> buf. I think that is a good thing to keep even for other interconnects
> (if possible). Like if someone wants to pull the network cable, we
> could trigger a move_notify() and on next map() we'd fall back. Any
> ideas around this?

We already do that if new importers come along.

E.g. you have a connection which can do PCIe P2P and then suddenly somebody attaches which can only do DMA to system memory. In that situation we use move_notify to move the buffer into system memory and imports re-map it to grasp the new location.

Regards,
Christian.

> 
> Thanks,
> Thomas
> 
> 
> 
>>
>> Jason
> 

