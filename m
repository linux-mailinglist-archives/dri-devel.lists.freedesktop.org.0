Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D52959632
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 09:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6BF89819;
	Wed, 21 Aug 2024 07:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MXtUDv7w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF5489819;
 Wed, 21 Aug 2024 07:48:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbbKHk8/F7YvIUoS/q2ezSiH0La1AfQaeLJ9gh2eXgiH8XF2vMBOdQgbDSKkWhiGtSjsEyZtLgKckMyFSpBrJlBEM5WwK6MrtrdlAjGgBBHS0mdZgfJNBdh+r9o9CjLX9dAdf03I9TKlWr/14UmwaqXC+YdRlGhriZnJo605ao2J19LuwCsH1dVj52KaaMe7Vu0a5Ix2r7MAr/i2IjAE6X3wEMKUXGvkKVQdxI+nxsNrJDTl/yAcufZq07a5Bkt98V/H1GKIabTKfmnyOopzfcFW3Dtp1v2EjHht5oa47jHjHO7/C3bMmGSm6TN0MBvKfb+yTnzv7jevs/7aWBJ7LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOW3slnfIX4l4ydb2JrLvdSH0gNJXavHCM7ys8EnVEg=;
 b=vB+TQCeqaeYwO+hLEhVZWLcRRHbIhc0LsxQh8Rmw62sBvRBpwnWmp3I82sqiLJJ8uapqzNcP8hCacg3jKFT7vpEyTtuhQBqs4TK8jPLLI9/rXVrdXwwVWyg7gJ5AAz/9U3z0RRxaeSEIpOZohfGkPxPxF8k32ZK5GSdJ1GAS58SW3e3KiW6sVMv56P3xNhj6Nb8+D2sV7KA2mepC6hdOb/QU6yC15HGq6Qeep+qBWBQFY6e8zVXiBeOet1RvrKU/eDR/ao2kVv7DyRnkcBVct31oQnBynQVZqITVh7p40q+ERIaqHRhcQg90XN6VxVV3Vl35ov9PL4z9Imcciuhljg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOW3slnfIX4l4ydb2JrLvdSH0gNJXavHCM7ys8EnVEg=;
 b=MXtUDv7w9s1cDtUFcUOZvzHvQH4mxH3Yi7V9V5N01iunhRgudXMLAGeyEZUSjL/S2AzBtmaTdZIwkW4JI36Um7ZEm5WkUDqRvTdGHDyf4mRRLKkI/ozjls+Ce3beNeaU8RGLIEYWzKYbntetbCxDqG/7JzUBDCl5Q1nbh236ONg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7210.namprd12.prod.outlook.com (2603:10b6:510:205::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Wed, 21 Aug
 2024 07:47:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 07:47:55 +0000
Message-ID: <02a383c5-db18-47ef-9118-72effd83a252@amd.com>
Date: Wed, 21 Aug 2024 09:47:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] drm/ttm: Add a flag to allow drivers to skip
 clear-on-free
To: Nirmoy Das <nirmoy.das@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
References: <20240816135154.19678-1-nirmoy.das@intel.com>
 <a09a268099ef61c46cf53f0d8847a8f07caa210e.camel@linux.intel.com>
 <f045daaa-e887-4f74-8cc1-5df0d0fc2593@amd.com>
 <b48456effda2ac845e08318da404e2810c74bd64.camel@linux.intel.com>
 <b94e2ea6-569d-47bc-8e01-199b543b2018@amd.com>
 <b37433a5-a3b5-439d-9ee6-6c6260a94f13@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <b37433a5-a3b5-439d-9ee6-6c6260a94f13@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::23) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c77b03c-e44d-40ad-3f5c-08dcc1b5915c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REg0MkhNb2JoQ3JQQk5ZNm1kOTdETWsxZ25yb2JOSlZob0ZBYWJYdzByR2Va?=
 =?utf-8?B?MGtyWFp2L2QxYjRPS2dIOGZIMXordXQ4Z2lDSE4xdmZZLy9tbllzZDdwUWNX?=
 =?utf-8?B?QysvN2x6Zm9obFgwSThQTVBXc0RJVy9vWkR0UjdydkdOVXEvNTV3UVFwdHdu?=
 =?utf-8?B?VlJIc2FCTzdTdVk4OUxJTENGQ0I0Vk9jZ2lXcUxudUFaRG80QU1lNzFMVmxE?=
 =?utf-8?B?VHVBeFhva1FaRVFsRkNLSy9Jbmx6UGZDR29TYzQ2Y2o1Mmp5dE5wL0k3RjBB?=
 =?utf-8?B?aVoveWVXTmc5eVJ3UVBEbUExczdUVGRsM01SMFA3Yk41WmtiVVJWUmY1MTN1?=
 =?utf-8?B?cWFkUmV3NExjd2FEbmQ4WGk1ZFVub3hjek5YQVVSVWNsSUJsT29sWkhPeFlF?=
 =?utf-8?B?MlN5WlpmREZSaWEyYTBtcnc2bXhmakFTUlhWTFdheXNrVy9wMUN2OUwrSHN6?=
 =?utf-8?B?bVVNTTlSRWdyM2p5dEVkUXE2RmExcG1DUVl0Y1pJRlNRa1dtYnptNnpEMkxl?=
 =?utf-8?B?N2RiRm1kSkRnZTBrSklUN05VN3k3RmMrbngraEc3RjlPMTlpVVB1eVpUOGhw?=
 =?utf-8?B?RmNnczlxVnJPWEhEYVdHSnE4b08wLzYzdDc5czVzTDIvUWc2Q0dKTFRuOEtE?=
 =?utf-8?B?RzlOSjFtRGwvUDZqcHZZOTY3eDQ3aWtidGRXWnlGNDdTb2NuWGljL013TGdI?=
 =?utf-8?B?TmQ1enRjU3VWTlNBbzhOSmlsSmJQMWpaSWdOdVBzeC9DU3gwdWpvdVJkUmFD?=
 =?utf-8?B?enJUdVNndGRvV1pJUVBTL3V3dEVsZkRVUk5sWGRQUkVsaFV5L0VOWkxIcS9Z?=
 =?utf-8?B?di9IVktQUC9waFg4NTZTUmJaWEl0dGxNU0VCRkYwM3hZMEJ4YW5BalNjVyt5?=
 =?utf-8?B?emxKZWg5ZjBGTGNMVXZ6QldWT3ZYNXIyd0RxQU8vVlQwYkR6VWo5VVd1VnRm?=
 =?utf-8?B?TjR6blErZ1Vqb25ybU4rVUZHZnFFbkUvdGZrdHFEVktqWm5lRTNidHJWMnFm?=
 =?utf-8?B?WVhMNzdwaWo0M0hMUFZkVHNDa3Q5ZXF6REE5S3FaL2I2MUIvdVJ2RDFrWlJw?=
 =?utf-8?B?b2dwUEswb1Mzb0NLdS9iTTNKWUNVZXBKSmFpK1BTSjZybCtWUGRjRm9KR1Nm?=
 =?utf-8?B?aGpHWlgxRnREL0hPRXlpVHdjK1A5d25XcjJjbXdscVRKOVcyanFjVlMwMmRG?=
 =?utf-8?B?RXFDeHpQdllNVnUyVVBUMm9kVlFiMUpPUklYUUp4Wk0wdXpkMlZsM09GU01m?=
 =?utf-8?B?T3dTeGNVMlZVa2RlYXhpRzUwTi9sMmhNa0t0UDUwcEYrdFV6Zi9SblF6d2NK?=
 =?utf-8?B?dGE2ZlkxNEd1RDl5RHdLb3owSXdXK1ZFVGcxSVVGRlhPQ2dKY1E0bUNNdVVx?=
 =?utf-8?B?ejV3cndJRXZzOTE2aGdOdkhDVVRnY2tFU0RWV0taclhnVytoek1vL3JXOFpH?=
 =?utf-8?B?aXhmVGR3N2ppaGxxTXB3aURsL3oweTBuM055Q2xPakJ6Y2tBZDZPdkpBN1RH?=
 =?utf-8?B?U2U4RDYyUFR3QXRTdk02SnViYm94a095UXFRY1ZRYkl0VjJ2RzROc2JBeG56?=
 =?utf-8?B?WnNlY21NWDV3TUw0L3ltamV2OERRZW8yTFNwOGVSQmtYcUROdEZWYnJHVEti?=
 =?utf-8?B?S1FZS2lqdVBWYXdLMWppSGFGQmVuRlpGNk1CVHpoTkNzSnR6YjZ5c21Md0Zn?=
 =?utf-8?B?Y0pSMFJiQ0JhTndwVXZIYjJVTVZSNGR4RlFGZzNCT1h4ekR4VWZLNUN4YnBV?=
 =?utf-8?B?L2N0eGxpclM5M3NwVDJLa2tjLzlTOHkrdFhSTnFUekZ4M0M0cURRRDJweEFq?=
 =?utf-8?B?SjJGUUpVTmRsVW13Mk9GQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azVVeEJDUkIzUHpBSmFKUTZjZlRwTFkwbWhKOG4rY0pXNUJzQmN4QnQyR3d3?=
 =?utf-8?B?R0V3MXAwVlZxMUNEUTNGUWRNQTJTN2FqYjhlSWtsQXd3RDRTRjJCQnVycTlR?=
 =?utf-8?B?OVlWanpEeEdOTlhxYWptTlAzWVlBVDRLQXk3Tld5NjhOdmdWVDZRakg4RlhH?=
 =?utf-8?B?VWxZa1g5WEFrMlZ4dE1FYnpHcEM3eUFjWlNvWmUyb1Q1bkV5RDRta0QwS0ZV?=
 =?utf-8?B?enFYTHFDbWtERHkvUFpWM21FMkVUYkhLdEVHTnZjYStSUTVpc0pMWGd3QWdx?=
 =?utf-8?B?WWJSVDJXem9VNkdaeDJyTkljTVI2aUo5QWpab3BicXJta2E0MkpGZ0J4b2Zm?=
 =?utf-8?B?RkxabFhoYkhPQWEyd3luYitBbnhha1A2cHdNdUFBaDNLQlR2SVlkOXBEY0ky?=
 =?utf-8?B?M1B0NU83ZlBEcVpRTVZXYWpjbXZrcVZhVFdobFBXUlVDSFpsU3ZSTXhsUTdB?=
 =?utf-8?B?eFJsSDd0N21YeTJhdnB0M1NIQ3dEcFpJK21JMW8xaFZBbFZpejRQMUlmMk41?=
 =?utf-8?B?cmMrU1ZGaFNvZkkydi83WmJVeE5DcUJ4U1UyODByTThuZXdKS3hFUG1BeHlh?=
 =?utf-8?B?aGkyZ0VSOVY0T0VLOUIxdm9sb1pmb0s0eVdQdFFZUjY2RjNsOFdtVVdiUDhB?=
 =?utf-8?B?TU1rZUh6WWRkanNRSXMvUDNTYjBoUGx4NDNhbzlJdXNpWWgwNjBvWEh5RlNJ?=
 =?utf-8?B?cFNxQWxRY0o3MXRpSzRSK2txMGg3UmY2YitrcHhOTXVDamwxL21nbnQxYXh6?=
 =?utf-8?B?RHB3YjZPSVpXWENZVGo1WXQ1OU1CSnpKTVoxMENLc3pYWmNxb2t0RFNrQ1BT?=
 =?utf-8?B?RnJzdkdYZHViZ1RRMWl1OWd4R0JBRU5zL1huTWVjTk5GNVllREgzT0JpV01r?=
 =?utf-8?B?MFFnRkM4dVBNOEJ0SS82VHYvVElFWmc0STROYm55VDZ2RjNiekVtalhZalZi?=
 =?utf-8?B?M1FkQUJ4U3RFVmVVdXptcXBUZVNrcUZ3NlRJWjdTbWNIRUd0cHdTTktEUEhs?=
 =?utf-8?B?SHdEeW44T3JrK3JDN3FvL1orOU1KSFdHbnFRVmdpekVWcS9LZTlQVTN5NHht?=
 =?utf-8?B?dTlCRytOT3IyQi9PYzg3TEZXOWxLVEdvd0lUZU85Zk0xNkgvN1ZrOWhUOEQw?=
 =?utf-8?B?QklIbklJeU5kSE5DdWFaYTlLRTBQVTRyY3hmVVZUNVRuanNsbWNLR0MvSjl1?=
 =?utf-8?B?cnNWL01pcWY1Vy9xWHBkVW9HUS9LeUlqWDRYL3FmZUhHODVFWXNkdmZ0Z2x1?=
 =?utf-8?B?azB6UStodVp4Tkp3RG54SzFzZmo2RDdTNUtHQ0xFcEdhU0tjS2t5eWgxSHZU?=
 =?utf-8?B?WUNHblRIZVRNd2lRNVc2ZVhsdUNjTWtHUnVvY2pvR21rWU85UXlzZHE1ZmZh?=
 =?utf-8?B?b3hUWDY4U2JiQ0NDazYrL29IY1g1SUhITDIwMFI1T0hkU0xsK0FocWFQWmwy?=
 =?utf-8?B?QnpiQm9HcXY2cmVmTkhocUVnZEx3TjZURVRhYzJteE1vWjBPQ01KcjdCS1RK?=
 =?utf-8?B?NENBaXF3bGZTMDUzNXcrSkpOeDJpek5iWkFIaFRrOU9QWnd0SkdnM3hHb1c3?=
 =?utf-8?B?Q0pvcjdmUXJVQzNWamdkR3hmZHdOMFltczErbG8zWGZJaWVla2c4cFdGeC9z?=
 =?utf-8?B?ZG00WVZTbEQrNWVvRm41UmpzcEZIcDdJSXN6T3NFWnZsa3VyZnI1V0pDUDZo?=
 =?utf-8?B?blFtczh0RFhnVlN0U2lnMWo2QVRZSTZ0RjRIbVNQTFYwZ2pWK1R2S2hEZ1JX?=
 =?utf-8?B?TFdNZitZYzF0VDJmckNxS0svUnFYS2g3Qm5EeFgwaU82RGN3S2k0cGVaQ3FN?=
 =?utf-8?B?bU00U2pRWVZtemlOVzFyZmluSmx2dE85T3JrSklnenROS0pDam5lSzdvQ29S?=
 =?utf-8?B?YUlNUzlxQ3VBVUhrR21hWmJjdDl6ZUhPMmZraXBRazBsbENJRnhTcVUvOUEv?=
 =?utf-8?B?RXZRZ1BpcXp4SUxUNE1BZ2Z2b0FBZVV4Yi9QVmwvNlg2dVdWMnZKTUVFMUlV?=
 =?utf-8?B?aHJMak1sNVk4Y1V2YlN6WTJnQ1NpbnJsRm4wbXA5UTJjU3E2UVRheHN1MzI2?=
 =?utf-8?B?SU1pRU9nM0w1SnpUV0F3akRYczRDcXVYS3lmamFhR1FmeVphQVkvTHRGN0Vs?=
 =?utf-8?Q?Vc9A=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c77b03c-e44d-40ad-3f5c-08dcc1b5915c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 07:47:55.3160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c2yYXFnHFaibcWt6CamY1XSRmuIusVS0UFYToijcnZy+bMYwKMJ7geJqAJpDFEPv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7210
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

Am 20.08.24 um 18:46 schrieb Nirmoy Das:
> Hi Thomas, Christian,
>
> On 8/20/2024 5:47 PM, Christian König wrote:
>> Am 20.08.24 um 17:45 schrieb Thomas Hellström:
>>> On Tue, 2024-08-20 at 17:30 +0200, Christian König wrote:
>>>> Am 20.08.24 um 15:33 schrieb Thomas Hellström:
>>>>> Hi, Nirmoy, Christian
>>>>>
>>>>> On Fri, 2024-08-16 at 15:51 +0200, Nirmoy Das wrote:
>>>>>> Add TTM_TT_FLAG_CLEARED_ON_FREE, which DRM drivers can set before
>>>>>> releasing backing stores if they want to skip clear-on-free.
>>>>>>
>>>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>>> What happens if two devices share the same global TTM pool
>>>>>    type and one that does its own clearing. Wouldn't there be a
>>>>> pretty
>>>>> high chance that the the device that doesn't clear its own pages
>>>>> allocate non-cleared memory from the pool?
>>>> That's completely unproblematic. The flag indicates that the released
>>>> pages are already cleared, if that isn't the case then the flag
>>>> shouldn't be set on the TT object.
>>> Yeah, this patch is OK, but the way the follow-up xe patch uses it is
>>> problematic since, AFAICT, xe dma clears on alloc, meaning the pool
>>> pages are not cleared after use.
>>
>> Yeah that is clearly invalid behavior.
>
>
> I was only thinking about one device use-case which won't leak any 
> data though I am now miss-using the flag.
>
> If I skip dma clear for pooled BO then this flag  is not really 
> needed. Shall I revert the this and usage of TTM_TT_FLAG_CLEARED_ON_FREE
>
> and re-introduce it after I get a working clear on free implementation 
> for XE?

Yes absolutely.

I though that I made it clear that the handling should be that the 
driver clears the pages and *then* sets the TTM_TT_FLAG_CLEARED_ON_FREE 
flag.

So if you don't have the handling implemented like that then that's 
clearly invalid behavior.

Regards,
Christian.

>
>
> Regards,
>
> Nirmoy
>
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> /Thomas
>>>
>>>> If one device clear it's pages and another device doesn't clear it's
>>>> pages then we would just clear the pages of the device which doesn't
>>>> do
>>>> it with a hardware DMA.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> /Thomas
>>>>>
>>>>>> ---
>>>>>>    drivers/gpu/drm/ttm/ttm_pool.c | 18 +++++++++++-------
>>>>>>    include/drm/ttm/ttm_tt.h       |  6 +++++-
>>>>>>    2 files changed, 16 insertions(+), 8 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
>>>>>> b/drivers/gpu/drm/ttm/ttm_pool.c
>>>>>> index 8504dbe19c1a..935ab3cfd046 100644
>>>>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>>>>> @@ -222,15 +222,18 @@ static void ttm_pool_unmap(struct ttm_pool
>>>>>> *pool, dma_addr_t dma_addr,
>>>>>>    }
>>>>>>       /* Give pages into a specific pool_type */
>>>>>> -static void ttm_pool_type_give(struct ttm_pool_type *pt, struct
>>>>>> page
>>>>>> *p)
>>>>>> +static void ttm_pool_type_give(struct ttm_pool_type *pt, struct
>>>>>> page
>>>>>> *p,
>>>>>> +                   bool cleared)
>>>>>>    {
>>>>>>        unsigned int i, num_pages = 1 << pt->order;
>>>>>>    -    for (i = 0; i < num_pages; ++i) {
>>>>>> -        if (PageHighMem(p))
>>>>>> -            clear_highpage(p + i);
>>>>>> -        else
>>>>>> -            clear_page(page_address(p + i));
>>>>>> +    if (!cleared) {
>>>>>> +        for (i = 0; i < num_pages; ++i) {
>>>>>> +            if (PageHighMem(p))
>>>>>> +                clear_highpage(p + i);
>>>>>> +            else
>>>>>> +                clear_page(page_address(p + i));
>>>>>> +        }
>>>>>>        }
>>>>>>           spin_lock(&pt->lock);
>>>>>> @@ -394,6 +397,7 @@ static void ttm_pool_free_range(struct
>>>>>> ttm_pool
>>>>>> *pool, struct ttm_tt *tt,
>>>>>>                    pgoff_t start_page, pgoff_t
>>>>>> end_page)
>>>>>>    {
>>>>>>        struct page **pages = &tt->pages[start_page];
>>>>>> +    bool cleared = tt->page_flags &
>>>>>> TTM_TT_FLAG_CLEARED_ON_FREE;
>>>>>>        unsigned int order;
>>>>>>        pgoff_t i, nr;
>>>>>>    @@ -407,7 +411,7 @@ static void ttm_pool_free_range(struct
>>>>>> ttm_pool
>>>>>> *pool, struct ttm_tt *tt,
>>>>>>               pt = ttm_pool_select_type(pool, caching, order);
>>>>>>            if (pt)
>>>>>> -            ttm_pool_type_give(pt, *pages);
>>>>>> +            ttm_pool_type_give(pt, *pages, cleared);
>>>>>>            else
>>>>>>                ttm_pool_free_page(pool, caching, order,
>>>>>> *pages);
>>>>>>        }
>>>>>> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
>>>>>> index 2b9d856ff388..cfaf49de2419 100644
>>>>>> --- a/include/drm/ttm/ttm_tt.h
>>>>>> +++ b/include/drm/ttm/ttm_tt.h
>>>>>> @@ -85,6 +85,9 @@ struct ttm_tt {
>>>>>>         * fault handling abuses the DMA api a bit and
>>>>>> dma_map_attrs
>>>>>> can't be
>>>>>>         * used to assure pgprot always matches.
>>>>>>         *
>>>>>> +     * TTM_TT_FLAG_CLEARED_ON_FREE: Set this if a drm driver
>>>>>> handles
>>>>>> +     * clearing backing store
>>>>>> +     *
>>>>>>         * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT
>>>>>> USE. This is
>>>>>>         * set by TTM after ttm_tt_populate() has successfully
>>>>>> returned, and is
>>>>>>         * then unset when TTM calls ttm_tt_unpopulate().
>>>>>> @@ -94,8 +97,9 @@ struct ttm_tt {
>>>>>>    #define TTM_TT_FLAG_EXTERNAL        BIT(2)
>>>>>>    #define TTM_TT_FLAG_EXTERNAL_MAPPABLE    BIT(3)
>>>>>>    #define TTM_TT_FLAG_DECRYPTED        BIT(4)
>>>>>> +#define TTM_TT_FLAG_CLEARED_ON_FREE    BIT(5)
>>>>>>    -#define TTM_TT_FLAG_PRIV_POPULATED    BIT(5)
>>>>>> +#define TTM_TT_FLAG_PRIV_POPULATED    BIT(6)
>>>>>>        uint32_t page_flags;
>>>>>>        /** @num_pages: Number of pages in the page array. */
>>>>>>        uint32_t num_pages;
>>

