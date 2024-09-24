Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBD0984AE1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 20:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF93610E11D;
	Tue, 24 Sep 2024 18:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cB5VJW86";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2078.outbound.protection.outlook.com [40.107.101.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9615A10E11D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 18:35:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWIZjlr2sg8efuCqfpiF6Wb7EDHQteGSdv85jUJdIDX5H9wn0oCVQykTbfVsFq5aErAEngFUREXj/mqsgOCeDKrP5WSaFYAInMDHJ5vVyqb29JMg/Ku8K4eF0WiXTEt4qAzWjMy/GQSsofYMvTK4ueGfjZ1ER1LOQ1IF9oZzkQzKEp4bUhLHgxg7a0ixxxtgbTiwsUfWoLnVJcrCeKVevAVHctybas+lvV3iY0RXAHVc1DydFauv+HVuaZnzCVQSMhHX4f7+4ovRhLOb+1FbBcLpSajuryz5ICUApB4fvsBWSFoMDJAUcrLA1MWd2Qwjf5Ce5f9lPSZagZgJAbF6jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ouJvfNL8kMnQ2V4o1IjHM5qV0cHdJz/vBa3qB+iV+E=;
 b=xiFJJHXli/aYqGZeP3CPEmszT6H8exfrlkW0C/eIs2bKZRVtK7IGJyW4w8G7cc7g8RtAAkrK+7cf5Pp0IF/ZHGiKEaIwYqQN9G3sMmKJS1u6vjQD/DAxsEGrVZW4mTooAf3JsgwoEQpxRDA3x0EXVH5VH3UD01FRx5eH5iAQubGTL/JTJ7YLFgHrXbdjwk19cCMxo2KztV0BtQc0ETtA7OQVTM+pWEsw/dNxwZH609k5ZhE6i0Jm/Ytlu7L3sg1nLkAUm2i8SqBG/vujw1XcnaGAtc7wXW+lLkP/ctlk1fn6/uPfswkAKDXDb+0LA6THOMsRc846oKgLEHIxQSqOVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ouJvfNL8kMnQ2V4o1IjHM5qV0cHdJz/vBa3qB+iV+E=;
 b=cB5VJW86pv1a2alROb7ikCgSoaBEg6nUdASNeYBXR/nz3BVu3VV3bXr5gnoLy+GYFTYMzeHR9BbbWJ/mLabf17EOhH7tGqy0HPxotegSZvMbsSUANj36oCbeOzXyv0lkeifmHr2BC0qo9TdyFfLvwzva17n3XzFBfLu9oKVwJyckweagzF2YJWybs+XhEVOZObdZEw8zpV3LsnufcN6VfOQzNRI7jdZHfOHlXqMBY7VcE8npEPrJmjK2jbWaDQvAok23BGSkYlepnu25gx27v7++F23Ke0j2G6FZgYJHVppEk2SPvgVU+n66LCGyqHjJwk4SUuuLj9q8o4RXK6CctQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM8PR12MB5447.namprd12.prod.outlook.com (2603:10b6:8:36::7) by
 DS0PR12MB8528.namprd12.prod.outlook.com (2603:10b6:8:160::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.22; Tue, 24 Sep 2024 18:35:49 +0000
Received: from DM8PR12MB5447.namprd12.prod.outlook.com
 ([fe80::5f8:82ee:7da9:219b]) by DM8PR12MB5447.namprd12.prod.outlook.com
 ([fe80::5f8:82ee:7da9:219b%4]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 18:35:49 +0000
Message-ID: <a82202e5-81b9-4041-b02d-d69c46204cad@nvidia.com>
Date: Tue, 24 Sep 2024 19:35:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: host1x: Request syncpoint IRQs only during probe
From: Jon Hunter <jonathanh@nvidia.com>
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org
References: <20240531070719.2138-1-cyndis@kapsi.fi>
 <f0720898-aadc-4e98-9369-05ec5821414f@nvidia.com>
 <18b6c018-618d-42e6-81f4-48bfb4eba206@nvidia.com>
Content-Language: en-US
In-Reply-To: <18b6c018-618d-42e6-81f4-48bfb4eba206@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0536.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::16) To DM8PR12MB5447.namprd12.prod.outlook.com
 (2603:10b6:8:36::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5447:EE_|DS0PR12MB8528:EE_
X-MS-Office365-Filtering-Correlation-Id: a6f7343e-0ec1-4423-90d6-08dcdcc7b5f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MStPeWpzWTU0WHRPTVZkNThPVXE3QWRTeVFwY1lWeFFSaDZIK1hkbStWOU5Q?=
 =?utf-8?B?STZWaUw0Q2Z1T3RoS01IRmVONVVBTnBiNzA2YXY0SGdSakVSVFRNS1Q3UzAv?=
 =?utf-8?B?QXdHck5XdXY1Z0lDSktURVJvcno2YzhjVWREOU1WVUpMS3NqZC9KZzFiZFdn?=
 =?utf-8?B?OVQrcWowRzVqM0dCSmZvRUxRNzVieFJSK3RWUkl4RDRkSmNnNVI4TFVRVkRQ?=
 =?utf-8?B?cVdTR3gxdThrOXRrZjM0dzIwYzRTY1VqNkVPUk83UjFJaDNOQnJMWUI4VThk?=
 =?utf-8?B?VmdpazZNMmFtV1UvbDltT0k0bXBpWlR0aHJwYXJzRXRtSXBFOE1XYk9hdllP?=
 =?utf-8?B?TVZCMFdwb3ZaZGZZcXJpL09vTU5tcFNEMncreHRYcUdkbWFsUmIyNEZrUnUr?=
 =?utf-8?B?ZHpMa1gxbm4yZ083N1NOYjBJODFrbUZVa0xZdVd3V01RdnFXUEYwTzIvSTBt?=
 =?utf-8?B?eDF3WjhoOXhGVGxGeW9DeXB4Uk1yeVJJQzQvTmtxK01lTWYvbWw2VWV5Qk1H?=
 =?utf-8?B?elVtMzlRck42RGlvVnc1U2l3T1RSYm54ZXdodkVIeVo5SS96RmRUZTNkRGVP?=
 =?utf-8?B?andiRXY5aURVeGJQZDJENS9KVU1uSHFqdkdtaWhqNkE4eXRZUG11Z1NGNXpV?=
 =?utf-8?B?cElKWGZXYnc5bU5jK3lmYkd5d0VwTE94SDltL05BM2xHdkRVclA4TFMxYnVr?=
 =?utf-8?B?SDd3WVh4UXdHeDdBNVZVRjV1TGFPWHVobGVJVDFZRXl2Uit1eld2T1RXa3lq?=
 =?utf-8?B?cWhCak5BOVk3dWlOODQvODVKa1UxWjBmako2ajFPRDI5SS8xVkVDajFhNWFE?=
 =?utf-8?B?Qit6dFdYNGE2UUxOSmFKeVF6c252c0dQMkJEM2F6eUVkbWtvQVRYZVoyRjV5?=
 =?utf-8?B?elNDcjZvVUJNbEJBb3o5Qng4KzdOK3R5bTlYQmZFa0lCb1lWYzRsczBid1RZ?=
 =?utf-8?B?WUpXaVhGTGxFSXd1MUY5dDVxTk5oVmpiNU9CZXA4Q0ExR2xSaHN2TmgrR29Y?=
 =?utf-8?B?c2VKQ3pMZlE5OFA1djk1S1UzdDRVSjF1ejZxZUR4eU5EdGZHTzk1Mmk1SHRj?=
 =?utf-8?B?eWR6MG9ZSTQxTG1QWWZqSzFraDROTVBmZWpZSFFiYytROWltQjNMWGQrejc5?=
 =?utf-8?B?ZjFFclpCV0FWaCtSUzMyNGpaL2x3N2ZYN0VRWkt2blVEMVE1ejBiak12clRN?=
 =?utf-8?B?TUpJVWxWUFd0NVJkNmJ6dHlJbWtRcG5URTdPblFPKzhGOVBQSW9VanU4djNZ?=
 =?utf-8?B?Z21jaVVmT0pqZ3VkbmwrNXE5SHdKYUpSclhXUWlJdGJ3ZGNyZFQ3MEt4MXVt?=
 =?utf-8?B?MUNscUVWeUhldVZtMUJvN3dpbVN6OFBKeWY3SWUxTm5PWGpVdCtpbXRFV3I2?=
 =?utf-8?B?TmFqK0RVM1VaQk1JVUIyZUJnOTBBUVB6SGN0Z1QrdjJtVTJFbFIxdnZobDNk?=
 =?utf-8?B?R0pac3RmSVhJSnJHYVNaUlpnQ1Mxc0wrb0FYbkN1T0x5Uk96QXhPbHEzTnZJ?=
 =?utf-8?B?Zjl2OEJJZGRRUGhKdUZYNGFkL1FxZ01iZ0Z6V2tsZys1eXFSNGd3cXJnUzZ2?=
 =?utf-8?B?RnRnQUs4bS9aR3d5N2JGekN6MHdJcG5BM1ZRR1Z4akVQYi94b0RxZkd1RVZ0?=
 =?utf-8?B?Mm5Md05ENHFZc01UbDhLbGZzbEZFemNUckFpbG9DVHFnV0oySjNGQVpEaTgw?=
 =?utf-8?B?OWhhQXJXWWZYcERISjFuMk9pT29Yemlodm1wRTQrNGc5cEpvSEVHMmJyQ3VU?=
 =?utf-8?B?VWxqUzBDTVY1WWUvSmpyT25sczl0TnV3UWNhVGtHZllhczlKRFNvbnRYMzBj?=
 =?utf-8?B?Z1JlRzJGN2VyS3pvSEFCZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5447.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFM5VjBhdWc0R3JETGVXcmpUVUxvbTJRNDZSY2IzdE9vVlVOV2RIVkk1ODB4?=
 =?utf-8?B?enlsZ01COEtMY1lxcGNUZUtWL0VDTFMrNlp4YUpZcHZhTmNaMHlGL3JmM042?=
 =?utf-8?B?c09UbXBQVDZUYkNUM3M4UjlJN245VzRtWW1KQy9PN3RvZ1d3VW1OdGtpaE1z?=
 =?utf-8?B?Rk5ZTG1Td1hPZjZhbUV1WG1Jbm1yZTR5dGkwMGtvU1Q4aDRjV3JIMXQyMnNq?=
 =?utf-8?B?eTUwZzNQNnJSWDZ3dVAxNkdCVzRnbUJsODkvTE1WQnBkSTBOQmUrQ2xyWDNQ?=
 =?utf-8?B?emxvaGFSYlhZaGtlUkNia29McklIeXB2YXNzR1E4Umt6NmlueklzV1BERjJC?=
 =?utf-8?B?RWMwdFpNODJ2RlA1NENDbHNQVEFOcDJqaEJDTFlnUHM1dGJ2RjVYdXN1MnNV?=
 =?utf-8?B?RTJ3eEZFR3BDWlhKMXo3Z0NiVXBrVVI5NmFGWlkwb090YTNkd0Y1RWR0WGFi?=
 =?utf-8?B?cmI4aWs1Sy9BcjdDdnhidjczSlVvMjZ0TFJaYk5XNFpVL1h3OTZLaW02eGVB?=
 =?utf-8?B?K0dGeUlKTE5iS2pzOVBkM0NjbzA0QXpJZlI3S05xUTN6WUNSbENDVStlcFdo?=
 =?utf-8?B?bko0YkJod2VLNnpKYmlxZUx0Q0JBdkhnTmU0a0h2cUZRVnd2VnJYSERabWxP?=
 =?utf-8?B?N2g4dm4zZFgyaUNhV2ptMmQ2cE9IUVBDMzIxcjlpaitsTUxtVnMrSFNLUFE2?=
 =?utf-8?B?TGJqckRIMDBiVW5oYk5ua0lmK3Z2NEF4dFpjR3k5T1ZXb2F4bVcwTy9hTklZ?=
 =?utf-8?B?Zy96SzlQVUVCL1hrV0pGM1pYR2FtNmNzL2g0TXphTlpXYjFNeHRWVDBmZ1Bo?=
 =?utf-8?B?dm81YUtSWU1OSFFhOUo4U1RIZk43TVAzOEJxeFNpaVI1dm5oKyt2eThuQzlu?=
 =?utf-8?B?ampDTUFEMVYxdENYbTMwc3B3NThIVW95MnpTbHhRTXNiMkN0S2lBVHhuZVBy?=
 =?utf-8?B?ODI2L05rVEIyUzg1eDJPaWVQSVJ1dFI1ZkdhRUlkam05WUI1b2JWZ09hNFNk?=
 =?utf-8?B?WldxRWxtOXNxVFpJbjZ1YXgzNHpUQUdnVjBYUk1nMi9DdytCNkJnR29iZnk2?=
 =?utf-8?B?UUNXUzVQNFNMbmZ3bXFIeDFNOExEN2QrdGZFb0s0QzlMYkVONW4yemhNcHk1?=
 =?utf-8?B?R0ZSY3prRURqWjhwRjJmVVJhSzFseTNPd2ZVMDlXaUVkZkJucEg2OGFWQWtC?=
 =?utf-8?B?OUwzQUFtZE5ueHdCVU01V0FIV3JnTDM5dUJ2R3ZKenZTRm1SWExPejlBblNy?=
 =?utf-8?B?SkFYOGxNNzdVVG5IeHRaWTFiWGJ2NGU2UDFkNmdtTDF6UVNwRmpkU3VkcVJl?=
 =?utf-8?B?RFV2aTY2ay96eTdueWpUeWtWbVBFN01FUnp5RzRYanRmOEo3aU05QWFrVkdm?=
 =?utf-8?B?U1JvMnl1dXBqc1VPWFBobXhlV1VMUHl0U2w5MUVKSk9sR3YraWk5emRXWlQz?=
 =?utf-8?B?QjlEa3diMFFpNlVrRnZyc211dS91NlZQNG1nY0VZQy9GamlEWWt3WWVrak1E?=
 =?utf-8?B?VkdrZFVMMEMxOHlQSk5yajE2dGZ2cUNuRGE1VnY4dC91QmlVcGJ1QXkwR2dV?=
 =?utf-8?B?aExYVUU0eVVheUJlbTV2OUJkTHVVMXRsd0NOa2xFWVVUTUo3cjA4eUNMeWxJ?=
 =?utf-8?B?YkI4K05sUGJiSGExazBQNEV3NG03NktwbGtta2NvVGtCdFdPYnhPVXBWV2cv?=
 =?utf-8?B?WVJobzJ1blU4V3NxWTBuTUJ6Yjd6K0hISkVFcjQzV0R1VU9SSHNXaFFUYUFO?=
 =?utf-8?B?djhPclNQN0lGYlJRa3JRTmJvdVZCT0U5bmtEWGV2bGpGMWRMT214R25BcUUx?=
 =?utf-8?B?Z3hWL0FRZVJxOEFWSGduRXpVLzMrZXdxcFhHRHc1ZDNhMW5RZG1SckloN3Q5?=
 =?utf-8?B?Uk5iT0NwNStGa2ZXNDM1U0t5SE1ieG5OaGQyVXMyQU1KaDRaVVExMThwcTM1?=
 =?utf-8?B?MXJBVG15VWczeEtlMmpJS21iMk5PaDdSTURZTnpXZXVrUUh3Y3NrenAvQVVt?=
 =?utf-8?B?azJUdmN4TkpOb1RXaXNjYzhFdTFXRWhRcmRVUElUV1lIWTY5RHVTK1hDeC8y?=
 =?utf-8?B?RkJGU0VPdEJ4TFBQVTRQZVNobFhpUXEydDdTa1JJVHllM3BoUDVVYjk5ekxD?=
 =?utf-8?Q?erf7GhzN65+hQi2b3d2zxltY4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f7343e-0ec1-4423-90d6-08dcdcc7b5f3
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5447.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 18:35:49.1138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZ38Vnqqz5kKVCLWOKOs2Qvznxlk1ZbrowRReNrU+ek6yHkjXFk2aWq0rpxuKeGGNuxhBKrMiMtEm1Qi+SzMnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8528
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


On 24/09/2024 19:33, Jon Hunter wrote:
> 
> On 06/09/2024 09:38, Jon Hunter wrote:
>> Hi Mikko,
>>
>> On 31/05/2024 08:07, Mikko Perttunen wrote:
>>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>>
>>> Syncpoint IRQs are currently requested in a code path that runs
>>> during resume. Due to this, we get multiple overlapping registered
>>> interrupt handlers as host1x is suspended and resumed.
>>>
>>> Rearrange interrupt code to only request IRQs during initialization.
>>>
>>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> 
> ...
> 
>> This change is causing a boot regression on Tegra186 with the latest 
>> -next. I have reverted this to confirm that this fixes the problem. I 
>> don't see any crash log but the board appears to just hang.
> 
> 
> I had a look at this and I was able to fix this by moving where
> we initialise the interrupts to after the PM runtime enable ...
> 
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index b62e4f0e8130..ff98d4903cac 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -625,12 +625,6 @@ static int host1x_probe(struct platform_device *pdev)
>                  goto free_contexts;
>          }
> 
> -       err = host1x_intr_init(host);
> -       if (err) {
> -               dev_err(&pdev->dev, "failed to initialize interrupts\n");
> -               goto deinit_syncpt;
> -       }
> -
>          pm_runtime_enable(&pdev->dev);
> 
>          err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
> @@ -642,6 +636,12 @@ static int host1x_probe(struct platform_device *pdev)
>          if (err)
>                  goto pm_disable;
> 
> +       err = host1x_intr_init(host);
> +       if (err) {
> +               dev_err(&pdev->dev, "failed to initialize interrupts\n");
> +               goto pm_put;
> +       }
> +
>          host1x_debug_init(host);
> 
>          err = host1x_register(host);
> @@ -658,14 +658,11 @@ static int host1x_probe(struct platform_device *pdev)
>          host1x_unregister(host);
>   deinit_debugfs:
>          host1x_debug_deinit(host);
> -
> +       host1x_intr_deinit(host);
> +pm_put:
>          pm_runtime_put_sync_suspend(&pdev->dev);
>   pm_disable:
>          pm_runtime_disable(&pdev->dev);
> -
> -       host1x_intr_deinit(host);
> -deinit_syncpt:
> -       host1x_syncpt_deinit(host);
>   free_contexts:
>          host1x_memory_context_list_free(&host->context_list);
>   free_channels:
> 
> 
> Thierry, do you want to me to send a fix for the above or do you
> want to squash with the original (assuming that OK with Mikko)?

Or can we drop from -next and have Mikko send a V2?

Jon

-- 
nvpublic
