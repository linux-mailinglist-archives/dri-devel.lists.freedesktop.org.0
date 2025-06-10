Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A84AD2C86
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 06:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6487910E461;
	Tue, 10 Jun 2025 04:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BuGXkh41";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061.outbound.protection.outlook.com [40.107.96.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FCD10E258
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 04:20:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PbWeQuvB7zsQ9U6zsQwbLjR1UV6xh48Nw7LoowNgB+1G8AajnjKfq3zhsVAVybjA+BidCA5qs1Zli181JNfmwCK03PcKRHWfm8Km/PRUOaVaITmdVHuqL/bVZRuvm+P+WxY507ucBljT3F/XNUAcNVqPf5qz2nWWbsQT6fxBWP4WeHgKNKqBn73IGpZL9K4eJmdfCgsFo0ssyHvNkohzHpnuZdD/R3t+MbViyt8FgmsTYLrWYD+x4/k4JH2G3GBCYcfh+KV5YBUxnvKODFY7zl057Bxm5MfiCTtwLoqZkRzJZ9NbgjYE7b4Mr0JvNCQRfuWJHp3XYRG6UQeUBxdX2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilUn8SfmyVVrnjU2SGHxyDwdC7IFSXVgGhAtlG8PrSo=;
 b=biEA7sFdoFIaPEpayDc5bjIef1FNEE97FNM1DpZwuw7P4y62UDOzTS8xBKyLU+bNLsOZcqAr4eHBdKE85zoyQRtp4rdguB5s7okoXepqb1zRbjyN33ljE55cm3e/UdnLnax2nwcL2jNMwvsKRkl3XyQLJSthC3T8KJBdYvOxZJ1f4pxbPhZ94j6BVeXWkPx2Hd3QD0H7zAyfiEoD+3oKW8/exacLohjs/5kWfgGdllHebSWFbUR5VyZ3C712UZ76qwJpZ9DEr0pjGA66KuXp4XnOaXsO+08clns7pHzpRgVv+igBIuTWuS2YPxs902FhmKKN7ScXtgLsYeUtrams8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilUn8SfmyVVrnjU2SGHxyDwdC7IFSXVgGhAtlG8PrSo=;
 b=BuGXkh410ZrlHHzHjeX2bWrIBqca2d0yoDVJZn/DDU2+Q7b4U+HmcTt3zRKFN9TgOdV7Xegvgnfphc1kJqsUTLKg2E7SJiui8dsVCXmGMr5vPZwSMcVE8AHSlTOowudvIhl59g2Z8+4vDopmkKvusTtMX70dn+pzA2t9anNJKF4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by BY5PR12MB4276.namprd12.prod.outlook.com (2603:10b6:a03:20f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.41; Tue, 10 Jun
 2025 04:20:12 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f%5]) with mapi id 15.20.8792.038; Tue, 10 Jun 2025
 04:20:12 +0000
Message-ID: <bd0d8d69-78dd-44d8-9f32-d945bc6078c2@amd.com>
Date: Tue, 10 Jun 2025 14:20:03 +1000
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [RFC PATCH 00/12] Private MMIO support for private assigned dev
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
References: <2c4713b0-3d6c-4705-841b-1cb58cd9a0f5@amd.com>
 <20250512140617.GA285583@nvidia.com> <aCRAHRCKP1s0Oi0c@yilunxu-OptiPlex-7050>
 <20250514163339.GD382960@nvidia.com> <aCYQdDrYYZRAgsen@yilunxu-OptiPlex-7050>
 <9dea400f-a57b-43be-a2e4-24a9f51e6ba0@amd.com>
 <aDE5SPzOAU0sNIt+@yilunxu-OptiPlex-7050>
 <ae16db07-5fca-4369-aa67-cbe2e0fd60fd@amd.com>
 <aDhyC73r149syMpc@yilunxu-OptiPlex-7050>
 <79872224-4e81-446b-a451-28260f449ea9@amd.com>
 <aDnbgBbxF8IkH/cq@yilunxu-OptiPlex-7050>
Content-Language: en-US
From: Alexey Kardashevskiy <aik@amd.com>
In-Reply-To: <aDnbgBbxF8IkH/cq@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR20CA0020.namprd20.prod.outlook.com
 (2603:10b6:208:e8::33) To CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|BY5PR12MB4276:EE_
X-MS-Office365-Filtering-Correlation-Id: 52dbfe4b-9e65-433d-d592-08dda7d617be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGhPb3RYbFlZWFphOWFTWEo0SnQxRnNZd044dWpKbU5EczFuQ0xOeFhqN0lY?=
 =?utf-8?B?WDJDa3cwRnBzSkdEdUh2QVlsV0JCMEhnN0p1SGZ3aDhOendqMUEwVldhc2hP?=
 =?utf-8?B?TnliODdQQTJPODdCZkc0YzJzczdRVGNNSndmTmRVY2M0b2JnZmtZc0NjU1dn?=
 =?utf-8?B?MkxjdVFlOFlPeEg0eEdsdEhZY3NFd1JIVnU3REw2andXOURBTDVUN0Z3K0l0?=
 =?utf-8?B?dW92dkJSb0R3RTFuUDhXeGEzZUVDK3V1T01pd1ljTEpDaThDWTRxOUt4TUpa?=
 =?utf-8?B?NVpNTUYvUUZRdzJPbmpkekFoQ1YvK3J0VEFqbGt1U3JDeUxnUExLSkoxdVRF?=
 =?utf-8?B?NWRJSVF0M2J2YnJQZWh3eTZ5M2ZQdityS1RnUUhGNjZYOW9ta203MkQ4Z1Qr?=
 =?utf-8?B?TkJXT2dIQWpTcC8zbkJVdE5oeUMrNEw1RWJZSEd1bTlpOEZJSExCNVJPY2Ro?=
 =?utf-8?B?YzhhNm5nWTFFaXhaV2ZWU3gwd1d2cmIraXJVcHFObTBBU1JVcWRDMllRZGE0?=
 =?utf-8?B?VGE3QTVndkdHY3JseFN1VGNCZVl2RlBTMTlpcSthTnowTFA4OTBCOUZ5VzFD?=
 =?utf-8?B?RFhVK1o4Mjdvc043OFoyU2pVN1QyT2NxTEUzTVBGMC9rZkppUW12amJXZmJO?=
 =?utf-8?B?dHRhbFFaelFWcE8yVXV2Q1ZTRnViYmEzR2NJck1xSTJNK1k0N0ExRGQzK0JW?=
 =?utf-8?B?ekltRGZFQTJDMFFGb2ozTWlnVFJTMit4Y1JVRWFRa05aM2FkL3NBWnpqR3d3?=
 =?utf-8?B?M1hFWk92YXlWZnJUUmdJdEFOcGIyRmVqQ0pkWjQyK1lsbXpERDF5RG5QbUR5?=
 =?utf-8?B?ZDNibTVNZkFlTS9ZZm8yZTMvNUhQWUJpVFVPdDJmZTEwQ0doVTlqTWJ0cWZ1?=
 =?utf-8?B?MjFzaVRsUlN0ZFFYVDQyTVRXOUpoZzYvcll4WDl1anNlWitWVVVyM25qRGs4?=
 =?utf-8?B?UktqWnkzNE1jbnQ1WEVTSjJGWmdyd0hNMjJSZHNHWHNtRmFBaDhxSFRZSVMz?=
 =?utf-8?B?U21LUzZGQmhlS1RKQ2tJempONWNrclVXOVNOZUNJMTlhMFdiWVd2SE9DUEFl?=
 =?utf-8?B?cUFYTmFWNzQyYmI0azhxM2o5dlJBVUpFamdCY0RucC9yZVk2RW5wakJYbjFP?=
 =?utf-8?B?SWNCYUFaYU9WV3Bibkd5RVZwVHBaZm9xQzNzS1JyVlppVHlZMk1QMVlhYU9J?=
 =?utf-8?B?N0RKVVA3UXdXaVpOT2hTUFN5OW15MzBVUG5TbDRQMnczcGp1Z0dxeXc1cW0z?=
 =?utf-8?B?TXJkRGs5MzV6VFhFZ1o3RjJjTk1jQlJWTlhNNnMxSGRQejVNRnpvVEZ2MWUv?=
 =?utf-8?B?bEY5OUw1NUZxNW95LzBXdm1sdFMvM01OaUI2bHdBclBxYXlHK05scmhxaHpv?=
 =?utf-8?B?bE9vK0NxRVQ2N042dHhiU0hRRlNqN0Q1RVZybllxUFh3L1ZtQmlBZEJkdmVm?=
 =?utf-8?B?Q0VUazNqODBXREU0QWRNSUFvTCt6R3hNTU93Ujg2N2RpWVUzWmV3RGZ6UFhh?=
 =?utf-8?B?OHNZczBVRDloYUNjcUZZelVtNjBXOTE5U1JxeUNBVWF1MGpxZ0d4TVhsNVhr?=
 =?utf-8?B?akRVdUdXMlpjVUdDeWFVR1FJY2piNXdHTGFrdkhXL0tObGUxRVFZUVNGcEFw?=
 =?utf-8?B?WVhVZlh6bGVQM25SZWl6RE96T1M1T3FFYTdzcTl3c25CT1ZnQVdDWXhPNitM?=
 =?utf-8?B?blRTaXo5cmg4OGJHTHQydnhwNFF6ZitjbVE1RUcyemswY2NuUzA5UHdMWE8z?=
 =?utf-8?B?MStqR0NURWVkUktodndVWU1nT0JaOCt0MTBpWXBadXFrMWtVZ0taZzRKVVo2?=
 =?utf-8?B?RnZrTUZEUVRxcUY1bjhVKzYzMnVnTEhTNU9aZFhQNmhVVGMwQmMvZncyVG5H?=
 =?utf-8?B?d0REcE1TTWxId05nQ3lWUklCSzlSSU55UkJXaWFKMnEvaWtEUWQ2bjgwd3g0?=
 =?utf-8?Q?UE6aUb0pR8o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB9194.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TW1HS1RyZGFHb1B6dk1oeGt3NDNQYUZ6cHRhRmZLSlZoSytvcVN6Q09VTG0y?=
 =?utf-8?B?WE5xMWo0NWhJTmZ1K3ZIOXlZUjlqMHpZZUlTT0ZtNmZpWlR2UUJkWHUyNEY2?=
 =?utf-8?B?NzZia3dOaEtHbmY4bC9QTW41SG9YMnFoS3JkQnF0QkNKRTZhMFMydTBRbE9a?=
 =?utf-8?B?OEY5N3ZPdzc3eEU1a1ZrbTBHbXN2L3VheXZISGJ6a2VkRk1kcFl4ODFCYmI3?=
 =?utf-8?B?Q05MQ0x5SHQ1N2dOYUpmK050QTdFUmVkb2RoZE43ZmY5NnZnYkZVbmNQUXN5?=
 =?utf-8?B?dUdjb2dSYlZOUVcxSVZ0VDhmRjhjZWRwY0huYit4N3JOMXI3bHQwMy82MU9N?=
 =?utf-8?B?bFkyVDBCclpxK2pWZDRrMys0Yk1xQnZqSXdENzBTK0gwV0o4aFU5TU0yOVdU?=
 =?utf-8?B?SCtUQUNnendQU2VoUng4NVhpeWsrUVJta1J5cTdUc1VkNUE2ZGNoQ2JzazNP?=
 =?utf-8?B?bWRtdmpyWGVOQ0s0RWFKbjdiT08wb0JFTnJGRWF4SVEySUFQQ0M2TVBQQXo1?=
 =?utf-8?B?Slh3Uk11aEhYWHM5TVpiMmRwYzE5ZzU2aEFIWTd6QklsU0Y0MG5zK0NWVC8y?=
 =?utf-8?B?aGNLUVk2bE1IZlZPY0JzVzZPZ05URmZNb2FFa3VWOFQxcithaU5zUm92NXpI?=
 =?utf-8?B?ekpaTnVIUkdUbktLOEg2bVV0dUdERi9mcWh3UnNLQ1hxQWs1K0FveS9RMita?=
 =?utf-8?B?TS9wVjVjQk82a1d0Ynp5TGpHY1N1eW9qRWNEZjZRK3QyUzAzR3EwU2NLcHBr?=
 =?utf-8?B?MUdwRlZtRlozNXFLa090dXBrSUNONzVoVDArcXI3L1FycGNpQ3VEemV2NkF0?=
 =?utf-8?B?NWlFZ1ZtMVNtZTh1YmxSbXR1V21sYURLZkpqWEpuTC9kRGFhQko5S1hDZmZl?=
 =?utf-8?B?MXduUzJnVWIzMmxTMzY4WVVOT2JCbk53L3BZd041cml0WWYyb1g4K1VLNUsx?=
 =?utf-8?B?N25KdmZFaTdSUmFjbWd2NVpQeGJoY3U0K1o4QXEvVlhGM0p1d2h1cXc0QTBh?=
 =?utf-8?B?cDdhVk5yWFk5ZndyNUNqZWlNN1NITlhOYUN4ZVdwZEgraEJBNjFGREZKSjJi?=
 =?utf-8?B?TzNyTElhMWM3VUtXbnNoVnBDZERXbk5XdTcvK00vNzlzVjBnS3JMdVkvQjlz?=
 =?utf-8?B?ZEhsL2h4WWp6dTJJbU9qR3U2dnVGTmtteUJFZTEzQ0RreFcvcVk2Y1NUOXF2?=
 =?utf-8?B?SjRqS1VGVUthWEUvVldrMjJqT3prbmdqRVg4M2VJdmYvb216NU9EOHVHU1VZ?=
 =?utf-8?B?WWxPM25EdUJqb3dYbWVIZ1BWL01EYUNRQllQVVVvZTMrV1NVV0NvZVR4U1Mw?=
 =?utf-8?B?VmMvMXNsTStDelYwZ0YyU2kwZ0NUQ2pRbmpqeWZ4ZFNCYkFMaEg4cDdXZDYz?=
 =?utf-8?B?Z3hVMG5sdFZOWloybVV2VDNqNDNGUlB2eEpydWRGVWV6MHM1b0NoaURsNmxD?=
 =?utf-8?B?cUVNWXIzRk5vNi83eFlHVVFyaTk2alNjcFgzb2NEbUVTTDM5Zkx3TUlpZUxl?=
 =?utf-8?B?cUtFazhCUExNcXdCMVlPS3hmaUNtWE1CSFVtYnJCOFlRWU9oQys5bDlLNDEy?=
 =?utf-8?B?RmtmS1BCcUo3aDFmalB3dWY4dkJUb0pKL2toUS9uUzk5MXRRbkxSbzRoSVNt?=
 =?utf-8?B?UHdwOXd5UEFuSS9LaTZ6cVZ5WHNGSkwxdW9xYlQ4enkxWUxHcTNaZ2dyY3pj?=
 =?utf-8?B?bkUzOCtxUnlna2J5bXRqYk42VFZISU02MkZTNzNNcHRwVmhtaUlHNkk0MDdo?=
 =?utf-8?B?dWkzajNiSlFUTU5PR2g4alFGaDg1N2RQZE13NUdTNnVLQ3BKQ0N3a2tVYm1a?=
 =?utf-8?B?VGNVZmxIZlA0bGF5clhTYWp3KzFGQWZJZGFOSlRCWmVmeld2eTFQN1FBd0cz?=
 =?utf-8?B?K2lNUTFDRlJXU1h1QUVsZTVkOTZEU3F6UURtZVFKUTZ6djdwQ0U2V2xFSUhF?=
 =?utf-8?B?RGk2anUwQ3lIa3Y4cVI0U0tVZXJMZ0lYVmF3cTlzYU1Qck1ZTWRlSmlFMWEy?=
 =?utf-8?B?RXllWDQ2QTJBMThkNGZNZ3hNaE5aa3RmcGZGNmUzTTBuRnBhdmdFZDRwdFBH?=
 =?utf-8?B?YUpqNThGY1Y5c2hBdi9tNjE1d0xVQnBpamlMNGZvVlVETE4rOVhmOEpYc3Bw?=
 =?utf-8?Q?ceclnonoXMThqK6CCsFvbRD7b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52dbfe4b-9e65-433d-d592-08dda7d617be
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:20:12.1747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 221JAJE1qtKfJrmrj+I1fVGSBgk8iPHvkbmTPEkcOlGxQjUzxztCQvgd92GRUcFRkjjgAjyJVL0sHxfV6Ajfuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4276
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



On 31/5/25 02:23, Xu Yilun wrote:
> On Fri, May 30, 2025 at 12:29:30PM +1000, Alexey Kardashevskiy wrote:
>>
>>
>> On 30/5/25 00:41, Xu Yilun wrote:
>>>>>>>
>>>>>>> FLR to a bound device is absolutely fine, just break the CC state.
>>>>>>> Sometimes it is exactly what host need to stop CC immediately.
>>>>>>> The problem is in VFIO's pre-FLR handling so we need to patch VFIO, not
>>>>>>> PCI core.
>>>>>>
>>>>>> What is a problem here exactly?
>>>>>> FLR by the host which equals to any other PCI error? The guest may or may not be able to handle it, afaik it does not handle any errors now, QEMU just stops the guest.
>>>>>
>>>>> It is about TDX Connect.
>>>>>
>>>>> According to the dmabuf patchset, the dmabuf needs to be revoked before
>>>>> FLR. That means KVM unmaps MMIOs when the device is in LOCKED/RUN state.
>>>>> That is forbidden by TDX Module and will crash KVM.
>>>>
>>>>
>>>> FLR is something you tell the device to do, how/why would TDX know about it?
>>>
>>> I'm talking about FLR in VFIO driver. The VFIO driver would zap bar
>>> before FLR. The zapping would trigger KVM unmap MMIOs. See
>>> vfio_pci_zap_bars() for legacy case, and see [1] for dmabuf case.
>>
>> oh I did not know that we do this zapping, thanks for the pointer.
>>> [1] https://lore.kernel.org/kvm/20250307052248.405803-4-vivek.kasireddy@intel.com/
>>>
>>> A pure FLR without zapping bar is absolutely OK.
>>>
>>>> Or it check the TDI state on every map/unmap (unlikely)?
>>>
>>> Yeah, TDX Module would check TDI state on every unmapping.
>>
>> _every_? Reading the state from DOE mailbox is not cheap enough (imho) to do on every unmap.
> 
> Sorry for confusing. TDX firmware just checks if STOP TDI firmware call
> is executed, will not check the real device state via DOE. That means
> even if device has physically exited to UNLOCKED, TDX host should still
> call STOP TDI fwcall first, then MMIO unmap.
> 
>>
>>>>
>>>>> So the safer way is
>>>>> to unbind the TDI first, then revoke MMIOs, then do FLR.
>>>>>
>>>>> I'm not sure when p2p dma is involved AMD will have the same issue.
>>>>
>>>> On AMD, the host can "revoke" at any time, at worst it'll see RMP events from IOMMU. Thanks,
>>>
>>> Is the RMP event firstly detected by host or guest? If by host,
>>
>> Host.
>>
>>> host could fool guest by just suppress the event. Guest thought the
>>> DMA writting is successful but it is not and may cause security issue.
>>
>> An RMP event on the host is an indication that RMP check has failed and DMA to the guest did not complete so the guest won't see new data. Same as other PCI errors really. RMP acts like a firewall, things behind it do not need to know if something was dropped. Thanks,
> 
> Not really, guest thought the data is changed but it actually doesn't.
> I.e. data integrity is broken.

I am not following, sorry. Integrity is broken when something untrusted (== other than the SNP guest and the trusted device) manages to write to the guest encrypted memory successfully. If nothing is written - the guest can easily see this and do... nothing? Devices have bugs or spurious interrupts happen, the guest driver should be able to cope with that.
   
> Also please help check if the following relates to this issue:
> 
> SEV-TIO Firmware Interface SPEC, Section 2.11
> 
> If a bound TDI sends a request to the root complex, and the IOMMU detects a fault caused by host
> configuration, the root complex fences the ASID from all further I/O to or from that guest. A host
> fault is either a host page table fault or an RMP check violation. ASID fencing means that the
> IOMMU blocks all further I/O from the root complex to the guest that the TDI was bound, and the
> root complex blocks all MMIO accesses by the guest. When a guest writes to MMIO, the write is
> silently dropped. When a guest reads from MMIO, the guest reads 1s.

Right, this is about not letting bad data through, i.e. integrity. Thanks,

> 
> Thanks,
> Yilun
> 
>>
>>>
>>> Thanks,
>>> Yilun
>>
>> -- 
>> Alexey
>>

-- 
Alexey

