Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E10BCB8782
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 10:31:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F3710E5A2;
	Fri, 12 Dec 2025 09:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="akRrsSJC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012031.outbound.protection.outlook.com [52.101.48.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2650E10E59C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 09:31:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tAcXvHam8wWCoHgYOGc7p2IGA+vtvDuy8eL9st0si5kxshLVksRe+CDSIwyt9If/RsuCmlex2iPQpseRTWOhdXq0byGA+v0BHg5/ulGA93moSkLjTif404m9y1RxmtEUBYwFmacLsI6Vecuk0yXrAXsmPcExERVY/rCOcWMDiQqrSDhcxHSBIR0VJu6OTCOCSdDJf9d0/yzj+tdPsjmuDsMBUF9ihpllCLFcV+le/90bvF+fgA5J7AURT3BjV0mc7ggdm0nuPWyaf6O4SOmTJIo62UtrihBReRiA+kpahs8GmxFWx+m3jESltTR39pEyjSHfXhMWHfw15k0EmAU4gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIkOSidsCf7h3Q8UKm4qvDtsOOOmHCW/P3f3xcYL5jA=;
 b=UZfPzv3njnnapzX3GwNvkbLbRVHnVELb9pfF3pcWvS4FuZYUPEDg0VhhyuWSCgJGwZrQ9pRU8lWtuvo+gFhmS8mnq6Yl33TL7DRjRYnlVB26ZVib/GLxRZD/OCrnOp8nChOO+tGnZWmjb9HWyrtjOuoEQfvExoDmXQkosqzterwaKyDhNhNsgCWgVFu307BmfOmKYHjku4Z6U2MgviicDrWzsCn36F8LiA42NEbzjqM52RShDunIF7Jfni4SNyEfCqvocolkEdwkOtIHWRFs/QN7wFvtLbuRxLMntdD8oMhtR1oY3GaGUV6ZBg8BF6rhCLB5/ZVVxuKRVlYfI3qWMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIkOSidsCf7h3Q8UKm4qvDtsOOOmHCW/P3f3xcYL5jA=;
 b=akRrsSJCuqnURmWSJ6x3QTPe1dLDZn0xHI5+QPDLl5BpBSGLgOPLdbZjGQdk0Xe+268uCn90PU9Cto0WxWgjRgY3onLdSYA1mlFiTdvulpDkCWClI0AKB4lD4Yd8DGP2kBWxoVKLbxN9lVU41AM2Nu6Qf7wZ7gMZpc5QCvGAeMQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH1PPFDB1826343.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::628) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 09:31:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 09:31:07 +0000
Message-ID: <36c216bc-a60a-4ec8-b87c-d9e8561eae1c@amd.com>
Date: Fri, 12 Dec 2025 10:31:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/19] dma-buf: inline spinlock for fence protection v3
To: Tvrtko Ursulin <tursulin@ursulin.net>, phasta@mailbox.org,
 matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20251211122407.1709-1-christian.koenig@amd.com>
 <20251211122407.1709-4-christian.koenig@amd.com>
 <cdfd4681-8680-4c6f-832e-3b7d8f9a775c@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <cdfd4681-8680-4c6f-832e-3b7d8f9a775c@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH1PPFDB1826343:EE_
X-MS-Office365-Filtering-Correlation-Id: b06423bd-2351-4e6f-192e-08de39612da6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVMvbktRcWxkQnRYeER6c29sNEtzVzlmNHZhQjQ2S053ZkRIYUp5UlUvSjky?=
 =?utf-8?B?OU9qaVNVNm9pckkrdVVNdWFqaGJGeTgxK0Q2c2VkMGVtdW5RQ2RjSTNEeFYy?=
 =?utf-8?B?MUt3REJDZ0thbkprT0RwZ1RYdnNUaFVWZjlUYXZWVVlVS2VnWFh0OVg0NnVG?=
 =?utf-8?B?T3RCNXh2RzJBMG1Pam9ud3hES3RML3NmakU3WmY1bG9Rd0JINHBHZUVMSkVI?=
 =?utf-8?B?WWtwQ0FKYVNzbFRCSFQ2WDd5cDV3M1RTSnFNdUFHQ24zVVg0emRDRGtLak5F?=
 =?utf-8?B?dUdLby9jYS92QkRWODdWZGxESTFKSWM5WUNja1NVOCt1NUdFOWNwZFoyV3lt?=
 =?utf-8?B?aVBadVlwdms5b2J2NEVwZGI5d3MyZFVLNDZCb3VwRWsyaGtrM3ZXbThXa2tp?=
 =?utf-8?B?U3BPcmRRMk5YYk1oTW43anMyOEZTbUswR2ZDTThOZWFxSGlvbVVvUnZ4cHJY?=
 =?utf-8?B?YTFwclMrK1pLMnVxc3p6ZlJvc0djZTkvRFNPU3RITEtkYmk2T2lJNXhkdUVq?=
 =?utf-8?B?cTJUQkIwTWdnOFJYYi9zNnZ4a1pua2JYTVNxRVNSa2ZKUnIrYzdjMVpXbnRv?=
 =?utf-8?B?dkEyc2hmRXVScFJ1N05tWXZMbzhqV2hhcG4rNGpwK1BZcDAwTm0xSFd3T2lo?=
 =?utf-8?B?TTYyaWNNaDdoVDhYVysxb0VYc3RVd0YvQVI1VDJiSm0wbnRQc1gwallvRzIr?=
 =?utf-8?B?VDQwN3djODY5aE5icmVNSFBneGNFNDc1cTFUb2ExK0VzREhxZFJMUVRURlFi?=
 =?utf-8?B?eE9Xd1IyK0xVOUlxUTV1OGRFY2RodzM3OFJFNzQ4WTduUWYvb3lMT3NiZUQ4?=
 =?utf-8?B?bExuOUxHRDhDMzQrYzFXU3owVVhIWURKREhGd2dvZ0cxYUhHNlNSV2NNcHJo?=
 =?utf-8?B?T1hUY29yY1ZMcEJsdVpzaTBUekJFWTZsM29MMC8wcUhxTUN5MUhUdXk4RTFX?=
 =?utf-8?B?UXY1cTVVdmd1Ykl1NVdDUiszWWFFMDhoSlgxVEF3NVIvNnhZcG1XT2YrOU4r?=
 =?utf-8?B?UXY0bll3NU81a25DTGo2ODBQMm9TaHNheVl0R0FPY0J3Rm1mc0dreXpIOTNv?=
 =?utf-8?B?WUUxRW9xdHRvNDJ6WHIvY0NlcVcyMTFNRXlQdDU1QzVaY2J6ZHVqbEVJVTFG?=
 =?utf-8?B?S24va1UvdUVCMnBZN21FWXBNdEkvUGFIV1AvRWtOU20ya2QwMlZHYVJQVU4x?=
 =?utf-8?B?RVY2QTdDTXk2OWE0R052Nkx4RjhQcjJQWmpoQXFGNnZROW1ObUppM3JSNFI2?=
 =?utf-8?B?NlBCcXlnQ3RKV3Y2YTJDaWJBemFiYkpQQWRwYVB6U3ZBT29KczlwKzNOTStW?=
 =?utf-8?B?RlkwS1VnVHlaOFRPbExSMjBXTTVoSHVrM01pbjFqdTRpckFYQjl1YkVIa2tZ?=
 =?utf-8?B?MmpHZnErS0l6VUlsdGwxMnVTKzFmYSs3LzN5aFdiQTYrQ2M5U1ZuU1VDTkVn?=
 =?utf-8?B?KzFINEZLYzdUYkZ3ZjFwbnFIaXo0U251Z2dqYXpMekpiY1Qxajg3S3ZVcWVk?=
 =?utf-8?B?RVFPUmkyelhDNlpSb0gyVzBRcCtKTE8wRktLekZ6WHMxb2FCVTdHZExxbTNY?=
 =?utf-8?B?Ukh2VElJa1hrbXAzd2hHcHY4VW5ZSUQ3anVTYWlQQWdXMTV0TW51cHUrN0pL?=
 =?utf-8?B?ZEZnejArWVpvLzlvODAzc3NkUHFQM1B1UlNza3lMcFhyTTFTeTNrTUJWSXUr?=
 =?utf-8?B?QTlkYkJYUzhhQXczUzE2Tmt4Y1U3WGx1QytvSG40OGs3MFordkNGQytmUlF1?=
 =?utf-8?B?Wno2THdRbUIvL3JmT1AxaS9uSFFGcVhmOC8veUZTaC9Cb2pzYkVNT2pzR3VP?=
 =?utf-8?B?U3V3QlNRWFRTbDE0NDFNb0VVb3N3eThlQ2VYZGFET1JwM0lxUUZjZEE3UkR3?=
 =?utf-8?B?QTZJOUVRVkxTbHlMcmtNV1pyQVNrNC9GOXQwclFxNi8rNisrVm5wd2xvSEox?=
 =?utf-8?Q?7GDvITJY8xHUY4qr8IFZFOKuOF4MtqV1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjZIdXhsdlQrdmFsUFo1Q0d1K2w3Z3U0bnIrM28zc3VINVR0UGlLL0JQTVhJ?=
 =?utf-8?B?THg5WmZsQUNQRE5Ec1BDRHBZN2xyalJoNEZmWGM3dHlCQ0xZV3ZDYjVmenBK?=
 =?utf-8?B?ZlZBeGwyUmdWdFJseGVGZXpkVm9lUDY1MEdTRm9veTNYSHVmOGVPT1pTNWIr?=
 =?utf-8?B?TEcxMmpOaHNMWmhJdlp5cEtOTEFaZHNBaGJDUU4zaCtWZk53RVQxZ1lZa1RV?=
 =?utf-8?B?NnJuOExGNTFmY1EvU1NWbkg5SFdENERoY3JDMFprRnVOeWVpakxCNzA0YmZJ?=
 =?utf-8?B?R3B0eDJueWp1ajZFQzhIU1M0WGhrSjFXWi8xNFNjbFMrU2xucmlpdTAvNUxE?=
 =?utf-8?B?bS9IU2dxN2JUNkowQkJZYlk1VGRaUk9OZHlRcGp0WHh5Zk5YNzBaQU9ncnB5?=
 =?utf-8?B?Y3UwWm5hUElFKzkyQUhlZURZclVGalRkYXdicmtLbnl1U3kxM3JtQ1UwWE51?=
 =?utf-8?B?eFhRbU55RCs1QnJhTFRuLyt6WS9UKy9QYnpOU1hlOGpYVGZMVG81Q0JGSTVS?=
 =?utf-8?B?RU1XNlB1VjhOdGE4Q0NRRDRCOWNmVC9jalorK2p6b2NyZDdEYXNhT1R5SXhl?=
 =?utf-8?B?VG02MDlGQzdIbS82UmJrT0wvODZBQk1yQXd6Q0IrajBqZjYrTEh5dWtEQUZI?=
 =?utf-8?B?b2tEMnJCVm8rbDJNWDdiQnROWkFpVmhUWUtZRWVaYzY5SW9qMjd3Z1grOTJa?=
 =?utf-8?B?Sm9KU3JmZ0drbjhQWmc2bThqVzZMNEZoZTVtSzBpWnpMcFRIY2N5cFFmeGow?=
 =?utf-8?B?OWRXRG5MVWZtUmtIRGVGSFFKOWM3WnFVZFVVS1BFbTZLa2g0QmlqMmUyVisy?=
 =?utf-8?B?Yi9QRVpxOXdMMTAwalp6eTBsajFsd0l5YkFINE5KdUhKVm93eHdvQzdkd0No?=
 =?utf-8?B?c3dlZ0gxaHpDVEFMK09Gb2RWM3FIMi9hQVlEbDlaUnBVTzFOTzFnd3B6RmZh?=
 =?utf-8?B?emRlSnBwK2VuMUdrOUN5QTlJdllVYVhPcUNzT2FzLzJOcFhxVWNkNXVyNmRL?=
 =?utf-8?B?Q2NYL1NtYWFBbUtRS3I2WlJMS2RVdGRibmxlOGEzN0FOTS9GTXM0NXRCS0Zi?=
 =?utf-8?B?UC95aGpTaVliamx4TWRjZmx1VXlLSHRvd1JRNU96UWNvRTVQdXZmOGJ4TlNi?=
 =?utf-8?B?VDVSWjlWNDk0ZEUvd05kQ05SQXBmSEpqQy94WTlXNE91VjdWRUYzMHd2WHFv?=
 =?utf-8?B?aEl3L3ZOejNYcTYwTGpNZkJVZWFhOWpJbGY0WmQ1S0pzRTE1UXVsbC9kdGp5?=
 =?utf-8?B?QXRFdEh2M0p6aE9IcUpuaGx1T3piYnM2VmIwVGx6SVdLNFFmNDNKSzhpV1ZD?=
 =?utf-8?B?cWI3RjlwTndnWHhObDRQMVBEYnR2WVU3eXhEdVF3NElDeStuTVV3MkRlL2Iw?=
 =?utf-8?B?NEFWNVBXM1NBcHNMSzkvb2Z3cG1UY2NHdHdveXVVUWdQbTk3YTRlbE9JUVhY?=
 =?utf-8?B?ZzU2eXR4REdiNFl0VHF1elIyM2pnKy9RSUU4dDduQ1p5VTlBT1VxejFWcUYv?=
 =?utf-8?B?QzF4amZad3pOcE1pMHZsU0psajhVbTUzYUVHV2lLd2RhZDQvZUUzR2cxeEVI?=
 =?utf-8?B?aTh4RFNnVzhkZ2Fta2d1dnJHR25vckV0bk9iU0M4OERnamlCNTZRVlNuTzdG?=
 =?utf-8?B?dW1MUWdSbldkR3Q1N2RLSGoyY09Bakpxb08rOFlpaEZocVREenlPclBScmZZ?=
 =?utf-8?B?VDlpUVFLUmRQL2VHQzNkdjJUZzFyYWhjZHV5bnhvZDdtRkFhMzZXNTZPQUVr?=
 =?utf-8?B?ckh6b0p6cXpOZEs2WU1QSG1Yb2NDelpMeHZxcThEUEtTRGpadlRKQ3MvbjE3?=
 =?utf-8?B?Q0prVEZpaHNFRGFGcklpMENGamZjLzAvYldaUFVXa2VvWmJQOEl1MEMvTElD?=
 =?utf-8?B?Mngyb1dNTEJBSVZHd3AybWhhRHpQWHYxQWlPT3pmR1BNd3RtRFFjWlZlU3pR?=
 =?utf-8?B?UWhHOU41T1NtUVpvaVlBM0RhSTJDNjc3Yk01c3EzU0laeXJNTGUvMUN1N2g4?=
 =?utf-8?B?bG5TYlhFSGNNOHVSWDNOTmVaV2FDR0F2bnZUZnVvNVJZa0MxeEwxUDVjUnZx?=
 =?utf-8?B?ZkZYeEU5TThWNkowRUM2N3pBOVlMdnpEaGtLbGxnbnorYkFJS2d3RGZuZmdZ?=
 =?utf-8?Q?rvg8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b06423bd-2351-4e6f-192e-08de39612da6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:31:07.6435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGwv1Zsq2km2Q6MH6af+BWbZfHjwaRVM1fFhc6iT/+nPhL77qVVrCLio7vzVWxHQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFDB1826343
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

On 12/11/25 15:35, Tvrtko Ursulin wrote:
> 
> Hi,
> 
> On 11/12/2025 13:16, Christian König wrote:
>> Implement per-fence spinlocks, allowing implementations to not give an
>> external spinlock to protect the fence internal statei. Instead a spinlock
>> embedded into the fence structure itself is used in this case.
>>
>> Shared spinlocks have the problem that implementations need to guarantee
>> that the lock live at least as long all fences referencing them.
>>
>> Using a per-fence spinlock allows completely decoupling spinlock producer
>> and consumer life times, simplifying the handling in most use cases.
>>
>> v2: improve naming, coverage and function documentation
>> v3: fix one additional locking in the selftests
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> I don't think I gave r-b on this one. Not just yet at least. Maybe you have missed the comments I had in the previous two rounds? I will repeat them below.

I was already wondering why you gave comments and an rb but though that the comments might just be optional.

Going to remove that and see on the comments below.

>> @@ -365,7 +364,7 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>       struct dma_fence_cb *cur, *tmp;
>>       struct list_head cb_list;
>>   -    lockdep_assert_held(fence->lock);
>> +    lockdep_assert_held(dma_fence_spinlock(fence));
>>         if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>>                         &fence->flags)))
>> @@ -412,9 +411,9 @@ void dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp)
>>       if (WARN_ON(!fence))
>>           return;
>>   -    spin_lock_irqsave(fence->lock, flags);
>> +    dma_fence_lock_irqsave(fence, flags);
> 
> For the locking wrappers I think it would be better to introduce them in a purely mechanical patch preceding this one. That is, just add the wrappers and nothing else.

That doesn't fully work for all cases, but I will separate it out a bit more.

>>   static inline uint64_t amdgpu_vm_tlb_seq(struct amdgpu_vm *vm)
>>   {
>> +    struct dma_fence *fence;
>>       unsigned long flags;
>> -    spinlock_t *lock;
>>         /*
>>        * Workaround to stop racing between the fence signaling and handling
>> -     * the cb. The lock is static after initially setting it up, just make
>> -     * sure that the dma_fence structure isn't freed up.
>> +     * the cb.
>>        */
>>       rcu_read_lock();
>> -    lock = vm->last_tlb_flush->lock;
>> +    fence = dma_fence_get_rcu(vm->last_tlb_flush);
> 
> Why does this belong here? If taking a reference fixes some race it needs to be a separate patch. If it doesn't then this patch shouldn't be adding it.

The code previously assumed that the lock is global and can't go away while the function is called. When we start to use an inline lock that assumption is not true any more.

But you're right that can be a separate patch.

>> @@ -362,6 +368,38 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
>>       } while (1);
>>   }
>>   +/**
>> + * dma_fence_spinlock - return pointer to the spinlock protecting the fence
>> + * @fence: the fence to get the lock from
>> + *
>> + * Return either the pointer to the embedded or the external spin lock.
>> + */
>> +static inline spinlock_t *dma_fence_spinlock(struct dma_fence *fence)
>> +{
>> +    return test_bit(DMA_FENCE_FLAG_INLINE_LOCK_BIT, &fence->flags) ?
>> +        &fence->inline_lock : fence->extern_lock;
> 
> Is sprinkling of conditionals better than growing the struct? Probably yes, since branch misses are cheaper than cache misses. Unless the code grows significantly on some hot path and we get instruction cache misses instead. Who knows. But let say in the commit message we considered it and decided on this solution due xyz.

Sure.

> 
> On a quick grep there is one arch where this grows the struct past a cache line anyway, but as it is PA-RISC I guess no one cares. Lets mention that in the commit message as well.

Interesting, I was aware of the problems on Sparc regarding spinlocks but that PA-RISC also has something more complicated then an int is news to me.

Anyway I agree it doesn't really matter.

Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
>> +}
>> +
>> +/**
>> + * dma_fence_lock_irqsave - irqsave lock the fence
>> + * @fence: the fence to lock
>> + * @flags: where to store the CPU flags.
>> + *
>> + * Lock the fence, preventing it from changing to the signaled state.
>> + */
>> +#define dma_fence_lock_irqsave(fence, flags)    \
>> +    spin_lock_irqsave(dma_fence_spinlock(fence), flags)
>> +
>> +/**
>> + * dma_fence_unlock_irqrestore - unlock the fence and irqrestore
>> + * @fence: the fence to unlock
>> + * @flags the CPU flags to restore
>> + *
>> + * Unlock the fence, allowing it to change it's state to signaled again.
>> + */
>> +#define dma_fence_unlock_irqrestore(fence, flags)    \
>> +    spin_unlock_irqrestore(dma_fence_spinlock(fence), flags)
>> +
>>   #ifdef CONFIG_LOCKDEP
>>   bool dma_fence_begin_signalling(void);
>>   void dma_fence_end_signalling(bool cookie);
> 

