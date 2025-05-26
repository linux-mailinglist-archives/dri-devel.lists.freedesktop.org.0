Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D508DAC3E3A
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 12:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE5C10E33D;
	Mon, 26 May 2025 10:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JgRdWl9X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE23A10E352;
 Mon, 26 May 2025 10:59:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fEt33gvM+VXLy7gFfLFNcrgGQS1jWWTZnoa5SJXL2rU44gG2jaN0SrwdxFjHHa+UoAtEs5gByZK3V8jeBKJ2LP/ED/jvtuec9tu8F5TL8ig9WNf19c/5Qr7Rj+pppt+KDvqZBxMehRwPxA7GRn/Zn4h/PqbQiRSCXVdeIcP57MJDCXF787Zq4x1TCjpTDFaWOMmNL6bWT46grJU9rq9BnA11t8tVOfVirLBIMig9k6eESv4kyWDq/s77lsYp4g4WnRc8aGsRsFD6JMevrzzDEEe1Ynhtz4DwK3b3Jp2ZtHCsbUzl88XKib69RPe9xBeMotfoyfedKCMpY6ezVV4cdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fRr8pBsc6Ye1pZ9CakuCbJecVr6M0imLP86mhhLKn4=;
 b=OAeXzGuww4r9uYdrOhjkxsMOvmNs6WAlku9hfLndqvOdG9qrWJGtHAUQWBItamkYSgAh/A0ChaJzkuWdhKbhGPfYCEia5gzM3QVQarQki+eKGDiEAwpKTDJ3Nb4dD/pW0XTduloyLYTm/b4h4Wan/kZ70Hb/k0nUxTeu8FoRz+/U6GXssPZTX9JY4k7Dfg9VcUG5UFfeUV5zvqBoUEu99JaoOO2eL3TFsMmlJGJhqZWvoMzrdR/13obkpUVjGmNQr6MMWNZimn2pn5TYAeNWW6m+Q3yliEuz5Dl0CL9+tQMpZy/zcZ4jHLADB/xYpTJHpFVsa5hL9M+Y8bKSDVePHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fRr8pBsc6Ye1pZ9CakuCbJecVr6M0imLP86mhhLKn4=;
 b=JgRdWl9X6uMhEyZhwt1fMGau7rD+IdHlxsgIaeSeEulsHixqr4ikHQ/zonZ3gW3rsjMWoGzTlrne0QuoXqRboiK6zfIv1JNl5RzzA+Ua/qP7Lm+9cHdK170ywZZqcmocOkaW9IL90rDjn6NEc0ZMgLoVhtV3JFh/1Y85alhrfpA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV2PR12MB5824.namprd12.prod.outlook.com (2603:10b6:408:176::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Mon, 26 May
 2025 10:59:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 26 May 2025
 10:59:46 +0000
Message-ID: <9ee10cc3-733b-4d64-b396-28e62c631dc4@amd.com>
Date: Mon, 26 May 2025 12:59:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/sched: optimize drm_sched_job_add_dependency
To: Danilo Krummrich <dakr@kernel.org>
Cc: tursulin@ursulin.net, phasta@mailbox.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250523125643.7540-1-christian.koenig@amd.com>
 <20250523125643.7540-2-christian.koenig@amd.com>
 <aDCCF0JFhO7lR2VJ@cassiopeiae> <aDGqt0jERFlU42J6@pollux.localdomain>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aDGqt0jERFlU42J6@pollux.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR07CA0027.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::37) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV2PR12MB5824:EE_
X-MS-Office365-Filtering-Correlation-Id: 58d71b1c-67f0-4970-9799-08dd9c446d3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1NuQ3ZreGVaOVFIUHZWWHVRYit6VTNKd0U5TVpTSWY5YUVweGVibFlvWDNT?=
 =?utf-8?B?NUM1NGpsbEJPc2RKeER6UDNyQ08zYXg0VnIzaEpqUC82OHFPa20vQjFwL1d0?=
 =?utf-8?B?Y2hYVzlFTnpSU2FlSnpiNmQ1TEhqRHJhdHVyZzIwNmEzYU1kK21xVHhQTkpB?=
 =?utf-8?B?dDQ2QXZnUGk0Z0RlRklUU09qZisrUGVVdi9GNytSdndNWHBBQS9ub1hVUkVv?=
 =?utf-8?B?aWFnbGdtSjlxczJsTTNhTUVaQk9Ybm1KenBCdjFhYVB4RysyYk1iYmlQMndN?=
 =?utf-8?B?alhNc0hzdDJoTnZrTXVxMXNMNU9LRXlMaGQ3aE83M0hGKzZtYWk5NUUwTzN5?=
 =?utf-8?B?Qko4TXZpSEwrOVFNL2x5Uk5lbGlXdmJRa2xoQngvdUk2MmQzdk9QNkNyZDB5?=
 =?utf-8?B?SVo0OGVPbHFxblVrcDR6UTJKeW91bzl5ZGpkWmozL2pvNFhWeUo0cnVtTnFs?=
 =?utf-8?B?VTRPQlIrcFdtRCtPNHR3aG5zKytVc3ZUeHZGeFJQTFpnWVQzTHh5eFk4VUwv?=
 =?utf-8?B?RnMweUFMMlljbHYvVUpIUzh1SVVvRGVjM01RTWNadWJlbXFSUy82dmEwWVA3?=
 =?utf-8?B?dGZ3SWVDNUdqTG91RkRDWjdXZ0N4TUlWUjdiWUJ6SUt4d3ZaMDU5QU5qMUh6?=
 =?utf-8?B?N2ExRktzSWNKc2dTV25VVVFSak1ycklyczNnZUQ4c3loaTFOYmtkV2tkZmwz?=
 =?utf-8?B?bGlJOWpKSURTbnJBRU52Q0VONlNQajF5WDV4bHU1MndFNm8xT2tKdm16eVdu?=
 =?utf-8?B?MFN1b3RwV0pBekdkclNEL2dSd2RJeUhjNDdKSVY5OFFvSTZUd01XRlhaam94?=
 =?utf-8?B?RnZuSnRPL3doaDVFTlQ3blB4OEVSS2RQcUIzWWt2VmFPQVVkTWdZODNOYW45?=
 =?utf-8?B?Vm1KQzBPbjdBcS93aElYRytTakpka2h3NWkyR2h5RElsS1lEUnphTnF3OHdq?=
 =?utf-8?B?d080QmNWVEZYd1FoLzI1MFVnS01qbTlSWjN2MmVIR0hHM25vYUo5a1RkRDdB?=
 =?utf-8?B?OTdsUW9yQ2Q3Z1o1emo4eGhaTUxybjQyRTV4NnJhTjljT0ovZjlvb2hGQU1p?=
 =?utf-8?B?ZVNYdzhXckdWRjlOeEo2cnhwYnZGY1VmbVlTWjhQNCtmWmhHNGZuOERLekRi?=
 =?utf-8?B?cEhCNzl6TEZVYmZPQUxWd09KWXZpQUlUajJ1M2Z0U3RpcUltaDJaeE5ocSti?=
 =?utf-8?B?eHN2R1drWVJyLzdjTkZlamxaWFBPMDNiL3lac3JVTzBybXJkd3pXUGVSN2Ur?=
 =?utf-8?B?UndqZk9VNTBYOWNOUlBveE9reTFobzdad1NXOTMwR2Vud00wUkNMbHBFQzdY?=
 =?utf-8?B?SjlmTUNGcWo2MlNtOEFOQVBtZEI4QWpFMHdoZUttSkpJUC84czhDOW9OK2U5?=
 =?utf-8?B?SFlTZUpySmRXeWR1QnZ4SWRVbXI2TkFQRlA0dkhzcGJDdUY5Z2o1WWcrUVNH?=
 =?utf-8?B?Wlphc3prZ1dkazFOQVVjTmN2SURvc3dkc3h1OUtLeUFwYzFTdmJ0MzV4R0FD?=
 =?utf-8?B?WmdMaGpjUk9XbndZYk85b3FTaTFsa2ZqSkZXcHluVzN6MUN4T3J1M0lTWVlI?=
 =?utf-8?B?YW5CT1pRRm5mVWcwZHh2bm1RNGlLOXFsUm9oTm80bEE1M25Sa3dvNFBMRzQz?=
 =?utf-8?B?Sjl2RHVjclZOQm05MmVtNFBEMVB3cVhwdUpTWjU5emJ1Ukdaa0Nwb0JKVmF5?=
 =?utf-8?B?ZmM5YzRmM29KQ3RKWEtQMkJBNndjcFVJQmFnS0s4TUpTRGRKenlWbnM5aEM4?=
 =?utf-8?B?TWRiRlVjRUVWNDJCc2RhSDV6VU5lWW1iRnFOZjk4bnkxdG1KRGtTVWRuZUlR?=
 =?utf-8?B?akY3WjM3MGVJUlgzR3p6dUhUQ2xuSnEyWkgrOFVnWVFhWm9xNitHTVNLNFM4?=
 =?utf-8?B?alQ4WVRKeitoWGVhOWdod1FWUWpUUS9ZcHJRT2RIM25ydERJTXNzclc2VGRG?=
 =?utf-8?Q?pd2VcF63APM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVkxeEJzSmZFa083UVFDd2FOSGZtbXd2TjI0cWp5c3EvYnhFRzRBVUxzYlZo?=
 =?utf-8?B?QWlub21haDJnYUtWdlh6QlZQVU13SmY5NWs3N2ZlMWFCbmI4YkpDRVU4d1hy?=
 =?utf-8?B?RkhYeHpqQTZLVXRBQkxSQXc4eDB1bEVtSnNDSnRza2JUYnRhcjNIeC84TTdq?=
 =?utf-8?B?Mk1RYWJaTGxQR1NvOW1kNDZMSTNmN1dtUEtudm5weXJaSUFyTXZ5WiswRVV3?=
 =?utf-8?B?VC9acFhTclpBWmRWdlROT0pSQ0J2VnFlUkJvTEdJRlVhZklHWUdjUDlUc0kr?=
 =?utf-8?B?bVMwc0draEY2WXdOaDdGNXhsTVoxYzFWbHFVTU1BWFBzSktQdEprelRFKytt?=
 =?utf-8?B?d0xVZnVOSm1OSlZkOFJ0SEJCRVp1Z0RmdEFCRnJZVGNWZXFsSFBTbUwrNGNI?=
 =?utf-8?B?eHFhYmlJVDZJVHhEM1hrSE1IVHJiR0gwamVhSnBCTmNDa1dCclN1TmhYNHBU?=
 =?utf-8?B?WTh6RkhkOWxmSXNCaU5KSENVYjJUS29UQVpXbXZudkZHbmxjQlV6SSswWjFN?=
 =?utf-8?B?SDA2UklST0VNVk02WUlWYmR1TlBzOHE4aDE1QVlkN0NVR28yNXpVOGRKc1pI?=
 =?utf-8?B?V0ZweW5Od3NPaE9HcGl0SUpXbVFoNERDQWNMMk5tdUx4VTN3SnI1dHNpWlEw?=
 =?utf-8?B?TStMdXhmMGMxTVpSQUxSRWE1aXhlL045Myt4Vy95N05mSDNyR0taQjdRRUl0?=
 =?utf-8?B?VFFIVGFnZzMrWDJEZ3Q2ZVZrVCtURXlrdktPTW45L1hHNHZPNEhtQUtnRTk0?=
 =?utf-8?B?cnRlOSt4WWM2bkJDbENyanc5dmJpbmVSL1prSUFVRFJBRG5zdXVJekEwZm55?=
 =?utf-8?B?UENSY2ozeE9UMVkxM25hdEIrNFpiaWtlMXZjOS8xTW8xaXVBTmxyR3ZCY0ZU?=
 =?utf-8?B?VHZSWkc1VFBkV1pqN3k5Q0pDQ1pIOEd6RnZLbFF0em1BbmFua3JJUXJuRm92?=
 =?utf-8?B?b2VadHBCNms2d21LQS9aSnFOVTdzNDNhMTRrVEhHTHBHV2E2eGNuZmhUY1Q2?=
 =?utf-8?B?VVBuMHNBZERSWUozWXQxUG14WnV4OUxFTXRFcDJCb2xCUCtBSkh6cEtzb0Mx?=
 =?utf-8?B?aFRSUW1WZm50TU1naGJHeHlDYnkwR2ZmeFRVTFJLUmFsazJWS0NBS09uTCt5?=
 =?utf-8?B?SWJKY28waTQyVEdzQTVwdUtoNGdWWnFubllWeFRLSU1RVktKdTBKQUVmRG4r?=
 =?utf-8?B?Sm1rVzZROWppOVdqd3hSWUlSdlkrSmFLaTNCVzZFUGdwWFFkZ1dNNWtlTC9F?=
 =?utf-8?B?QXRVOXhSY1lNRmZseFE4SVJuYXJMdGJKME9jOVI5R01UaFhaZ25JOHVzNDdn?=
 =?utf-8?B?bkQ0RUdtakFpTVo3SWE2aXRrTGxHR3IwUFIvc2sxVkZ4MDQvUCtMSzJSMEZJ?=
 =?utf-8?B?Rk54dWJCOHFOVkZKYlhZWXB3VXhKVDVMNmh6T1RBbnM0QlpsTDdZNXFuNm1D?=
 =?utf-8?B?ajF0SlVHYzNBV21XNFBGRi9ueUViSm5zNFlKTjZCTHhWQWVpMUF4WGtBN25R?=
 =?utf-8?B?SVlZTzZFQmhMdU8zdXpnNGREbWZ5aFdDRjlLYlNJNEFRaXFtUHAySWRvc3NU?=
 =?utf-8?B?L2RmV1JjVm8zVGhiYlV3UXJzVGViRzBrSm56M2pEYm1JRithUFZEekk4alpr?=
 =?utf-8?B?cVB0K3BzSzl2b0Q0Z0Q2V2VJMTZPVHFiazRWZVgrbHIrVjJOUGR5ZUplMG9B?=
 =?utf-8?B?aEJHdHRnMVBpTXFUazczZzNrNmhpTEJ3SVNoRVpLUWJYZFVxTHlzemQ4T28w?=
 =?utf-8?B?OXB6RWhVM3gwMVhpemU4RERVVDlabUw1dUJiNVdOOFIzNEIyTFd1eTFXUklG?=
 =?utf-8?B?bjBXRmhFWElHZm9DREpzRWNGOTI2dUpENDNIWXBqQXdvK1k4eXgza1BvUkZr?=
 =?utf-8?B?cFNEelhNWG8yZ2d0VjNtamtKQnR5cUY2M2VHTllCSmd3NWdGcUxmSHYwdCsz?=
 =?utf-8?B?Y1ZNblJwS0RDbWtLcXpuS1g5MGRIdDA1TWo5UjRDQ3NMOGxETTNncklDL1RS?=
 =?utf-8?B?SVZPTWJpQldQeitOV0dYTEpLdW5iMEVhdkZxd3VHdmh3aGhzendPUWo0bXZw?=
 =?utf-8?B?ZzJYVExZZ2ltS0J3Wkt4TVFudXdlQUVDcmd5ZUhxUzBNSzQrMzFqYkkyZnNQ?=
 =?utf-8?Q?oI1I=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d71b1c-67f0-4970-9799-08dd9c446d3e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 10:59:46.4237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQ81nBKZccR7tc7GNex+cai6r/bq9G7Qe3xpyEQ4h8Y3840uEyB7xN1C5P57CfRp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5824
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

On 5/24/25 13:17, Danilo Krummrich wrote:
> On Fri, May 23, 2025 at 04:11:39PM +0200, Danilo Krummrich wrote:
>> On Fri, May 23, 2025 at 02:56:40PM +0200, Christian König wrote:
>>> +	if (xas_nomem(&xas, GFP_KERNEL)) {
>>> +		xa_lock(&job->dependencies);
>>> +		goto retry;
>>
>> Please don't use a goto here, if we would have failed to allocate memory here,
>> this would be an endless loop until we succeed eventually.
> 
> I think I got confused by xas_nomem() returning true meaning that memory was
> needed and was successfully allocated (which can be a bit counterintuitive).


Yeah, I had to take a look at the samples/tests to understand that as well.

> 
> So, your code here should be correct. However, I'd still remove the goto and
> just call xas_store() again. There's no reason to make this a loop and backwards
> goto is better avoided anyways. :)


I was considering that as well, but than abandoned this idea. The xarray() sample code and test cases as well as the use cases where I took a look either use a loop or a goto.

I'm not 100% sure why, my suspicion is that you need the loop when there can be concurrent add/remove operations on the xarray, but I think we should stick with the common approach.

Regards,
Christian. 
