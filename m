Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C0A9ECF3E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 16:03:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298A310EB7B;
	Wed, 11 Dec 2024 15:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="y5xGBoVB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2043.outbound.protection.outlook.com [40.107.100.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCCA10EB7B;
 Wed, 11 Dec 2024 15:03:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aluzRmaxzlPZ8MkdsdUSmJ/pIwyMY38f+XfGoeaBbSWL+MQ43llawK3LlEu4/aMTKHo2XYQAc+Sg7X9DAxVMYiwPS9co7nw8I6G+NTk9LNzhGa+yedYU0SKtxKlCbklxxrIt0LTTQjMs+9QCickvP5cvWH5+d+VJHRL1iqCX6N/8q/5+X/PTZW/w/FKPyHwJvm7rvy8Ixi2ymLbfR6JV5V8+rPRpMz3JtCgjBE9HuTKTD7INbJJ3tutWnWwifbgCadv5vjNqoHR0qoPfkAng1ukT0MmIdJww3gTqPq/efM+g2p8dlLw2jdwzSdJe9N2Hhoto8z5IwgQZsrPGKDkzQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9ah541LLK/u8JDu/2+XORpqAAKyeOLanIHarWpWdV4=;
 b=YHKyqtvOTxv44RrN72F+gibOaKo8//atL4hIfchN5omta7i7oe6rtuTc40tHZ1wQOuD6rXQ05We7MXFxZNuBF0TpOPTc/4IP4iKyUI0nSP9FKDxxdETpC52YeTMuLXkfno3k80D8qOq+GICBwpXUtVTNfXZOaks/jNGVfYXXQOJOJ0NNCup6IFaIzcIrWTKDY+T5V1TjNkPu7nAyB+i/9l1IOatK+old8SZRUXHnawmsIMuc8GXZlF8sNoR1hVHhxWMLFbO3P0QAFHDj4nBEDHRrJ8yOwjD2PQZLibp/Ww6zPzBADqqpn6VQ1xtZdU3IM5fP4t2SprArIbLEy4uApA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9ah541LLK/u8JDu/2+XORpqAAKyeOLanIHarWpWdV4=;
 b=y5xGBoVBBtmahUPjJmkN0bG4hSTuClMisV2HZWtGosrWm7PwNKcprfIVaTyISZEDPOk33x+7hpIPQe/iBp9Whfq57ML22LzS/rW0bNxGvpSo9rttDn52qu6CGmYvIWbpjrNyRgjposmKVBOMxhiwRW6PHxMqUaT2b8htCRZUem8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB8710.namprd12.prod.outlook.com (2603:10b6:610:173::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.17; Wed, 11 Dec
 2024 15:03:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 15:03:01 +0000
Message-ID: <8e514b7b-7826-4870-921a-ab6dac9a65c2@amd.com>
Date: Wed, 11 Dec 2024 16:02:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/6] drm: consider GEM object shared when it is
 exported
To: "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "tvrtko.ursulin@igalia.com" <tvrtko.ursulin@igalia.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20241210175939.2498-1-Yunxiang.Li@amd.com>
 <20241210175939.2498-5-Yunxiang.Li@amd.com>
 <674b6d62-2274-4b0d-8d27-382faad5de88@amd.com>
 <SA1PR12MB859965C4B7EEB4B131E8C7E6ED3E2@SA1PR12MB8599.namprd12.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <SA1PR12MB859965C4B7EEB4B131E8C7E6ED3E2@SA1PR12MB8599.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0276.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB8710:EE_
X-MS-Office365-Filtering-Correlation-Id: 00a1dea8-c95e-4001-0a74-08dd19f4e84f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmlJSCsrRXZza3ZXWTV1QysxZi91dFNYeFBKZ2lyUFBTMjVpd2Vsa1hNazhq?=
 =?utf-8?B?UjBhYTgzci9kbXNDejc4dnJ4SUlZVVM5OHNjT09iOW83OTZWMUZBU1NVSXI0?=
 =?utf-8?B?MjRER0RwMjVFRC8rNmVJM3pxc21sTXFnaWtrSEVUU2FDQytZcXVXQ2tIbTBU?=
 =?utf-8?B?SitRS3ZtZzFMd1VUMTVBc1lwa0xFSUtiakRrZ2RodTgyNHhZNTFLcndKeVlq?=
 =?utf-8?B?dEFQRWd6TW95OStiTlN0SVBHbzZKb0tjeGd1K0UxU3U1T0psaFl5aWpSblFj?=
 =?utf-8?B?aW5iWmZJd1lUQTcvV1hJMG1qSXBlalZ0TmNVcjYzL2ZTTG1oUDlQT3MvYm04?=
 =?utf-8?B?bXhGOVg5dWYxQ3k1Q1lRdWY5M08wd21MRWZzdU14WUxXSWg2ZHVselB3NWFR?=
 =?utf-8?B?SFEyQzFOOEdZK0Q4dENSYmVTbDdDUHI1cTA4TUorT1dDTTNQcTcycWZSN09B?=
 =?utf-8?B?NExZUlMvMENCSFFvS0p6RU1mK2hJQzU2aVc2bUp5YWZDREIzMWZYVFhrc0FR?=
 =?utf-8?B?TDZZLzRtWnBlYm5MZSsrOWd1K0VLckdQOVpDZGFudnp1cWVwcVhYMEN4QmE5?=
 =?utf-8?B?Qmc0Rm9XcjdMUFdCenNIZVpMdkxmTFppYkhhOXNWVGZBNTV0V0V3b0kyRTRD?=
 =?utf-8?B?ckhNQytEUkVXR2VrRk85S05UZ3p1N2pQMXJlYnM2Si9BeUVVcFo3YWNPNk9n?=
 =?utf-8?B?YVJzNWZCWThwL0pYVUdNS0trTFM4bkVQQ0pZLzd3YmpScUxyQTJHeEhsQUww?=
 =?utf-8?B?eEQ2K2dLQVZMZ2hKWDBmanlMZW9OeEs3Y0RHa2wwWHZRa05laWVOZ2NlNHZk?=
 =?utf-8?B?QWNBS21kR1dZd1k1NHZTV3g0TzFhamgyOEtFTXZDbWF1VElxanB5QmhFMkhw?=
 =?utf-8?B?NmdHUFdybnM1NUphY3pYTUxxam1VSmZrcDIvVWlSeWJPajg5czMrSndUaXZJ?=
 =?utf-8?B?bW55eERVZXZjN1pZc2JoZGl3a1ZnaTk5T2VZaFdqSkxhUzFraXNrOHk1M284?=
 =?utf-8?B?MVhxQVQ4V0xwRkZNY25MbHJQWGphbC9JOVpLQnA4SVFRdjBHY1Rrd08yQXlM?=
 =?utf-8?B?SGV2WTRVQ2NzNDAyQzgzMS84TWgyNS9DWE5Va3pIWlNYdWxDNzBXdmUzeHVT?=
 =?utf-8?B?V2tLV0xFMi81ZTgxNks3ZEZJUVJoUGZoWjBvcWxzWmJvcjlZY3lSMHVaVWtX?=
 =?utf-8?B?YVBaaksra3dZQWFmWjlaakVEclFEWTdhK0VZMmxRajNnYnQ0N0JpdGdkNnlS?=
 =?utf-8?B?aXZtNmJNUnkyWWhORktRMEF0QmwxbmxXSVJmLzNsbnkrSHdDdk9VcTh3clIw?=
 =?utf-8?B?MHN5RHczMzJLLzIzT3RzdnN1dXBRcWJTcGJZdHgyNGtzNDByc3E1dGFYWm53?=
 =?utf-8?B?dm5vRGNrZWtrMjJNNE1JRnBmbVd3eGxSYjl0VjROMGtRZ0FMMjFueS9RZ2Nj?=
 =?utf-8?B?K1FFbmczMXVyWE11SjBXektJbVE1Y2taOWlqUFpHWXZONlBvamUzSXdWWnFN?=
 =?utf-8?B?SzJ3SjBEY3ZJbXVoSjZ1THZUc1M3dTBUVVhTT1M3aWhIb2FIcS9QdTVQT1ZN?=
 =?utf-8?B?cmdtc0pXQzIzbC9Vb04xdjhkZVhHSVVnbGNVdWN2aWYrWHB1UTVjNjdMbWdS?=
 =?utf-8?B?eFZrd3NtcmpRMFlCZk15N1Zvb1dxZFJiY3NyUW80RXVDa2QvTElzMzIvcVZw?=
 =?utf-8?B?MnVqM1N0dGNCdzNiRjVKeUhIUldHeG9ubmRDek9KSHpCenpKcGNDdW9Mc0Yv?=
 =?utf-8?B?bEUyWVVwZzFoRFBFbWlSNVdYTFZkallUbVBqNWh4YzRYMUpVMzhqNXpJTkNS?=
 =?utf-8?B?VDVtOW5kNmNESC92Qkd3Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzFCYVJJMmhJTVYzMU5xSXM2cDdoYnVLMmxrQ2d4WFVubVdIMm1YdS95Qmdu?=
 =?utf-8?B?MGZVaFV4ZEJHYjZaZXNqRGNIbnBTdU51VEJYTUNaU21EYncwZ3F5RDFXOUMz?=
 =?utf-8?B?TFJYMSt0QURFdjZ3cmNDNWN3NXV3b1JrMDd1cTg1bkJWQ1M4QzQwVm14cWky?=
 =?utf-8?B?NGIxd2h0eUJCV3MrNGw1M3BLOGpmYVNPUTBDc05IWXlUU3ZsNDdPb2huSGk0?=
 =?utf-8?B?SmFVWDRxcS96TVpiMWJOdGZCZitNMmk4RkJ0QW9Eam5rdlYwV1Fld1B3K0Jm?=
 =?utf-8?B?WWlQeEFEcUVnVDBEalZuazF5RHpSSkdkYWMxYnVSeElybjBNK0wzeGswREZa?=
 =?utf-8?B?dDUyTFc3djQyUXFEck5OZnpLWE1DaXpJV3crVnVyN2J0Q3VxR1grbFh5TzY1?=
 =?utf-8?B?VE93c2N1UkpmTDFTSW1tUkJHeVpMR1lIYk1LWkVrdEErL1AwQ0I2UzUyYmhB?=
 =?utf-8?B?Q0o1SUc4UGtTSVRPMDNjeGpDeXpCZmEvOENwQmc0NVJ5dkZxdkFzWnBvdEtl?=
 =?utf-8?B?OGdyYjZlZ2Y4eFphSHNDVDNwK0w2ZmR5QlpsbXNmcUxpdDFGcnFlb09BVW54?=
 =?utf-8?B?amREYU5xbnhVNmVxRy9QazVUK0JxV0JybVpPb0MvSU5pUlJYSyt3T2JLKy9S?=
 =?utf-8?B?VHJpdHBJRkVkaWc1SmVXaGFKNnorb1hLclc5aHJTb3E1R0cxQklSYk8xWFhS?=
 =?utf-8?B?YVcwQ1dodStqbDl6WDF2MHpzWWlkOXk3ZmpFTFpsWXJ4VEpqUTliRUdnK1c4?=
 =?utf-8?B?SkJodzVKOFM3cGU5RkxQeldSVnNkVkxwMEF6dTBydi9CT1FSQjhmRjNYQjNw?=
 =?utf-8?B?cDM1OXBBQzRocUV2RXByOTRFMVR1bmZEbkVPUzJmZUtnTkpyR2RQcklqVFpB?=
 =?utf-8?B?Tm5LVkxvRVhVdzFLQXpXMUhOUklaREVQdG9vbFpTTDM1WTFpZmlPcXArampC?=
 =?utf-8?B?d2RQdmxWYnRRS2NTRXM2eGxkd1FXSkYrS2l3TUF4NnM5eGpKQnBvS3pOenFm?=
 =?utf-8?B?UTRMQTZaRFBxS0lRaDZkL0VrcjUxQVJ0NDA4L1U4Tjl0QlVoRGVRbU9ISDFw?=
 =?utf-8?B?aUE0M2EzWStWbjkrTnBxZXdaaFJGZUtORkdIK0I3NVRRZjRKZGVWZ0UxUEZJ?=
 =?utf-8?B?Y2hOdXUrMmFkSmw5TEhKSW5PdnVZOVJkZCtaa1ppWFZuWWR6UVRkSWNCMGht?=
 =?utf-8?B?V3FacEVaYTVpZkNMZDJJQlpLL2VNK0FPczl5Q2hMZGFUQmdGUGxRUFpyd29P?=
 =?utf-8?B?WXIyL09WYzhnci9mNFlML2JQam1kVDZhdE9DUlNSNm52TDRaL0xIb3E2a2t0?=
 =?utf-8?B?MjZNczNBelVlWkhtdUoyeVJpVHY0VmxBYmZVVW1lUUM1V0hLVjFjR2JZblll?=
 =?utf-8?B?aFZRbzUwa2wxWDVZY1NZSERzQitJMnFZRkptc21VSGRPMjdDclFwQ2h0NkVz?=
 =?utf-8?B?VHRpeFJpS2tBSHhnOG5aYWxUTDNjV0xCZXRtWGNpd1Z0VFBVci9rMjcwNStG?=
 =?utf-8?B?RkZGQXp3Um1GQyttS2VBZlA5QTJGMkV6SmtwOXJtKy9XcmoraVRxS01HOFJr?=
 =?utf-8?B?cmtsYW9melVZcGNHNVVGRjhCVzY4VUdVVW1uMmVNUjBHMVNrQlZaMk5SVFV3?=
 =?utf-8?B?S1BNTWxZRTdQWU9oNHR2Yzg5ck4xSHJlQkh3NHhBZWtJd2FWYmpJc3lDc1J0?=
 =?utf-8?B?NFpaRHlqVHd3bG1nK3ZZTmtpQzZKeVZJd1pxaEVlNGRzUTB5dWp6dGE2NTlD?=
 =?utf-8?B?RUx0RWU2cW5Gc0t1RkZrZ3ZzNy9QMC8xMUUyeUpSWG94M3V0M1gxcjlJSml2?=
 =?utf-8?B?Z1UxVmNQUVBoSkVIZ1ZHRnB2V0lzRHVLWlJFQkVUTkpETVRsdVpsVUNJYXF6?=
 =?utf-8?B?eWdKMUN1aC9kcnc5MUlDaHVSNnlzZDByQzhiSi9qQTJJSU9TSU5vSHNoU3Vh?=
 =?utf-8?B?K1luV3dNQ0tjenh3SkZrbHhPaTZ2TEtoOU1GckhKZ05TVFg2T1JrMlJINVlX?=
 =?utf-8?B?L2t6S1BRUVNHenFNdDhMb0dLZ2l2OUVPcmhlUE9FeXIyYWVYMkdhcXJNVXBS?=
 =?utf-8?B?YTVsTDlvWll1OWUzeGJid0dnZEdIUHVLU2hHSkJlb2JiREtqWmh3WTdla0d1?=
 =?utf-8?Q?xVMc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a1dea8-c95e-4001-0a74-08dd19f4e84f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 15:03:01.8019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z3/LqORu052EwR9LZ8AEexb38RWfwYEUzJhfA8oBdSLxNPHNeVAc6hzfE2FJBue9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8710
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

Am 11.12.24 um 15:02 schrieb Li, Yunxiang (Teddy):
> [Public]
>
>> From: Koenig, Christian <Christian.Koenig@amd.com>
>> Sent: Wednesday, December 11, 2024 3:16
>> Am 10.12.24 um 18:59 schrieb Yunxiang Li:
>>> Tracking the state of a GEM object for shared stats is quite difficult
>>> since the handle_count is managed behind driver's back. So instead
>>> considers GEM object shared the moment it is exported with flink ioctl.
>>> This makes it work the same to the dma_buf case. Add a callback for
>>> drivers to get notified when GEM object is being shared.
>> First of all GEM flink is pretty much deprecated, we only have it for compatibility
>> reasons. So please don't change anything here.
>>
>> Then flink is not the only way to create multiple handles for a GEM object. So this
>> here won't handle all cases.
>>
>> And finally we already have the .open and .close callbacks, which are called
>> whenever a handle for a GEM object is created/destroyed. So it shouldn't be
>> necessary in the first place.
> For the importing VM the shared stats is automatically correct by open and close, but for the exporting VM we need to update the shared stat when the buffer gets shared, since it is already counted as private there. As far as I could find, seems like flink ioctl is the only place where the global name is assigned? The importing side have multiple places to get the global name, but the exporter always needs to first call flink to allocate the number right? So hooking into flink and dma-buf should cover the bases?

It's irrelevant where the global name is assigned. The problem is that 
there are more ways to create a new handle for a GEM object than just 
flink and DMA-buf.

For example you can just ask a framebuffer to give you a GEM handle for 
the currently displayed buffer. See the call to drm_gem_handle_create() 
in drm_mode_getfb2_ioctl().

When you make this change here then those GEM handles are not considered 
shared any more even if they are and you sooner or later run into 
warnings on VM destruction.

> I could probably make handle_count work somehow, but it looks like it's read in a lot of places without locks so I'm not sure if there will be some race conditions.

The handle count is protected by the object_name_lock of the device. The 
drm_gem_object_is_shared_for_memory_stats() function is pretty much the 
only case where we read the value without holding the lock since that is 
used only opportunistically.

What you could do is to hook into amdgpu_gem_object_open() and 
amdgpu_gem_object_close(), call 
drm_gem_object_is_shared_for_memory_stats() and go over all the VMs the 
BO belongs to. (See how amdgpu_vm_bo_find() and amdgpu_vm_bo_add are used).

Then have an additional flag inside amdgpu_bo_va who tells you if a BO 
was previously considered shared or private and update the stats 
accordingly when that status changes.

Regards,
Christian.

>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
>>>
>>> CC: dri-devel@lists.freedesktop.org
>>> ---
>>>    drivers/gpu/drm/drm_gem.c   |  3 +++
>>>    drivers/gpu/drm/drm_prime.c |  3 +++
>>>    include/drm/drm_gem.h       | 12 +++++++++++-
>>>    3 files changed, 17 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>> index d4bbc5d109c8b..1ead11de31f6b 100644
>>> --- a/drivers/gpu/drm/drm_gem.c
>>> +++ b/drivers/gpu/drm/drm_gem.c
>>> @@ -854,6 +854,9 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
>>>                      goto err;
>>>
>>>              obj->name = ret;
>>> +
>>> +           if (obj->funcs->shared)
>>> +                   obj->funcs->shared(obj);
>>>      }
>>>
>>>      args->name = (uint64_t) obj->name;
>>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>>> index 0e3f8adf162f6..336d982d69807 100644
>>> --- a/drivers/gpu/drm/drm_prime.c
>>> +++ b/drivers/gpu/drm/drm_prime.c
>>> @@ -406,6 +406,9 @@ static struct dma_buf *export_and_register_object(struct
>> drm_device *dev,
>>>      obj->dma_buf = dmabuf;
>>>      get_dma_buf(obj->dma_buf);
>>>
>>> +   if (obj->funcs->shared)
>>> +           obj->funcs->shared(obj);
>>> +
>>>      return dmabuf;
>>>    }
>>>
>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h index
>>> da11c16e212aa..8c5ffcd485752 100644
>>> --- a/include/drm/drm_gem.h
>>> +++ b/include/drm/drm_gem.h
>>> @@ -122,6 +122,16 @@ struct drm_gem_object_funcs {
>>>       */
>>>      struct dma_buf *(*export)(struct drm_gem_object *obj, int flags);
>>>
>>> +   /**
>>> +    * @shared:
>>> +    *
>>> +    * Callback when GEM object becomes shared, see also
>>> +    * drm_gem_object_is_shared_for_memory_stats
>>> +    *
>>> +    * This callback is optional.
>>> +    */
>>> +   void (*shared)(struct drm_gem_object *obj);
>>> +
>>>      /**
>>>       * @pin:
>>>       *
>>> @@ -568,7 +578,7 @@ int drm_gem_evict(struct drm_gem_object *obj);
>>>     */
>>>    static inline bool drm_gem_object_is_shared_for_memory_stats(struct
>> drm_gem_object *obj)
>>>    {
>>> -   return (obj->handle_count > 1) || obj->dma_buf;
>>> +   return obj->name || obj->dma_buf;
>>>    }
>>>
>>>    #ifdef CONFIG_LOCKDEP

