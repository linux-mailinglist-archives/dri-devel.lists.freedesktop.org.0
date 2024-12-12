Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F4A9EE2D2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 10:25:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD4410E204;
	Thu, 12 Dec 2024 09:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="222S/KDV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02C610E204;
 Thu, 12 Dec 2024 09:25:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hACEKhCMT19z+EHVDTVbEa32zipygq46CRxVhutfYgjy3idQmP9eJIY3nZu8PtYSHkatTS0wtbSTcrErL/X+BV2EOYI70DkiEBRF6Aootkcci0fECUd8pSVdYoLzX/T0yGoojfUKQWbMxZKEWu3FJotsaiSH2FCsESIuNRmNyYA9Zhyd7ITiVqapvqnJ4FU5McrPSVNlKyD7nxJSNg+zSjObRMPilhRGQCX4v84CO8MwxYRVQPZN6FhnhRV4lHXdtjuP9Bxf+UbHXsiFb0L93pufS3onuQpe4zCGE7vwzhhx9q4i0rVumfunxj4IPeF1j1QYTND81Gg4gwtpIa7unQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7fSfkELsyAl7RojSQtDfE/pdgoUbQbNq5LN3HepzDM=;
 b=cv1f1x4j0RWU9+mZoUzj6nuf0wjN5erpS4kxZh2OSunKWntWiqeJxI4bRwEC1wx/7yxzSSJdikFu9o/qFeh+OTRPP/snDh1vsFSs7a8T8K8PRiqYaTnp1sXxxott9n3NRF+iODZRjtzI8vXR1apPAFstaX5/pTkua0SdcT5DBuJEMIlVJiI8ZIFFAF6/NueaUAZ3tg15czrKwo/P4E4rzbBHAkF0eE3y1IDQsyOf2hEhKGlVRcBE3Pr6BYVD5bStpGljy1eWCbSyAiv4PttU48hbY43yTItauZ4FmzyBODRZW6YtJ6snTV/h24If9iy1pI0kHaEjOVnExwvuZUczAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7fSfkELsyAl7RojSQtDfE/pdgoUbQbNq5LN3HepzDM=;
 b=222S/KDVl6E3bQPdLEDb+ATblrWS4t/3xeEuo9p3kjWCkmrxxJ2X+zsfWMGXhWrb4aLln3e2pbehJ7bnQdzMnmWyV2/GmX7gEZlp2+/P8bEwENoKt9lxk0xTW0FGzMHIs2gbC15YfDVprEddVm+uSmgzRtYPRsH7WGdbaRcv9I8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA0PR12MB4461.namprd12.prod.outlook.com (2603:10b6:806:9c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Thu, 12 Dec
 2024 09:25:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 09:25:12 +0000
Message-ID: <b402ba4a-fc8b-43c9-aabb-b6e482565331@amd.com>
Date: Thu, 12 Dec 2024 10:25:07 +0100
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
 <8e514b7b-7826-4870-921a-ab6dac9a65c2@amd.com>
 <SA1PR12MB8599C134256BC6E17AD66070ED3E2@SA1PR12MB8599.namprd12.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <SA1PR12MB8599C134256BC6E17AD66070ED3E2@SA1PR12MB8599.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::23) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA0PR12MB4461:EE_
X-MS-Office365-Filtering-Correlation-Id: 70d86271-bdd0-4709-0039-08dd1a8ee13b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEpFR2dad05QR3hVM2NiY1ZqMXZSNFRWK29IL0RJZ25rMGIzNXhLNjVxRTNU?=
 =?utf-8?B?RXd1RlVySE53NW1rWUptdHYzQjc1Qld2Rmo4Zyt5dzFYTXR4OGVuSjQ2NGRO?=
 =?utf-8?B?RTFmV0hOTmxkVTJNY3lhMVZUSG83WFd2RmlPTlBoZTVkeGdheHMyV0pvZmlv?=
 =?utf-8?B?SmNwRXhJcmduM2pNd1p5UXF2Q0lCT0NrQ1hURnJmZUNDQ0sxSVAveDlzYlZH?=
 =?utf-8?B?U1E5RjU4QnozY0I2cnJiaFFlKysxampuYmlSLzVDaE1xL2FxMmFpdGx0SGcw?=
 =?utf-8?B?V0pWUHRTK25tZ1NiTzdjQ3IzRWlEOUcyMGdvYUZ5SWRRRDdUWFUrOWJ0Y3M2?=
 =?utf-8?B?eEsxNWNRaTl3MUc2amVQU1N5b2xHa0VwNDRaWlJGeThMay9ROXlDc3NwSzVq?=
 =?utf-8?B?OVdtVDVKUjVxQnV2aUo1NDBkVWhYVk0zREdMNUFMbk9nMXd4Z09QSFMzYnpU?=
 =?utf-8?B?RUZaeXR2M0s2RW5DT0NWeDRaUWplY3FuWGlwK0xkRWhES0hzd0pnaU9xdWVj?=
 =?utf-8?B?Ykw4QlYxZVgrVU9FbDJtdXpGdDRIOHk2WHRSWkRKR0FUbFRMU3dsdWJ3Y1lF?=
 =?utf-8?B?L2VYZGxicnlKc0JBTnVhRlkwRnV1R2p6Q3hzbndId3dzQi90UGhrU1dOeHlM?=
 =?utf-8?B?azNGbDBLNFBSdHFlSzk0cnpid3poVHQzZzl5dU5CN0U0YWRjUEtMcy8vL21B?=
 =?utf-8?B?ZEcwSzlEVVlrZzF5MkJPMTl0YkRtdkRvZUY2UzFTREd1V0g0b0tLcitoUjBy?=
 =?utf-8?B?SkJIVWorUFdmeUlOZ1drSW52aUhNNmdqT2xPaWNUQzR6dFVKcCs0YktkeEY3?=
 =?utf-8?B?d3NLUCtrS0IyeEkzNDkrOHdaWXZGOFp0NXdzVkdkRjVMV3lGTWVhNzNzTEpE?=
 =?utf-8?B?WWJkcHJyUXlHSEdNWWhpWXF0d3JoVDU2WVJiN3dnTElqNEtEeEx5WGZSdndX?=
 =?utf-8?B?RWNsN05wVXNlTlhYOWs3ekxCYmNaR3VxSnljSmtETFpTTmthYW1qK0lQNlZ6?=
 =?utf-8?B?aDdOQWE3YVFOVmVpMFhpVlUrUkVjZWVaRkU4NFRrMGJJakJac0psUWt2RmQy?=
 =?utf-8?B?M2h2dUJWcXpIY1JleXl6bUN0eFY4NTFqcHdZVTFPd2dUem1nNjN3OXViUVh5?=
 =?utf-8?B?S2IxZnVJUS9oWWRDdjk3ajNac1FTa0h2SXVlUkV6ZjNGa1gzWmY0di9jb05U?=
 =?utf-8?B?R0JCRDNkQXZ5b2ZaQmxTM1lyTGd2bis2b3VleElYRGh6VWZ6eUwrc3BQRTJu?=
 =?utf-8?B?ZGt5alM4dmhFUGZKbWpQYUtialZPU3A5ZDhqcU5UUWdtRTgySUVSSGZ1Y0tz?=
 =?utf-8?B?RnNzQ2l2Ung5WXNvaHFVaW90TC80OFdabmUxRitodXJpN2hrM3NWRmVJbDM1?=
 =?utf-8?B?dytvbU1iOEkyN2wxbmVwMkZNb0svM0hvUFNZOE5CS01QRmx0cVJCa2J1NWw5?=
 =?utf-8?B?MTNJSFFNQ2d4R2dmVkMwQlRlTDFSTVBxOWFzMmoycmFyNVV3REZGS1VvNUNu?=
 =?utf-8?B?b2JJa0s0WXFlOW1VM2k5WW5RaXJYWklSRXZoWTBrZ1dBUG9tbXo2S1c5cisy?=
 =?utf-8?B?MmtQMjBOVlJFMklPa3BuU0tOU3JsajUwUDBCWjJSWmg4Rkh1TU0zVTdCM1Zt?=
 =?utf-8?B?RElocUNSTnYyeDRhNmlZTllIOERUcWlRb0hrTk1KeTJZZUg1dlJ2em8ydmF6?=
 =?utf-8?B?NSt4WDVJa0xWUWZ2ZjhmWlUxelhyZDBxSGJEQXZGMHlwMCtlMWJtLzZLMmtF?=
 =?utf-8?B?YnRtb0YwcjFlbU1oelN4d1B3SFBEd3Q2TFpnWCtVam1pcmZOMjZVVUkxWGlW?=
 =?utf-8?B?U29KVitIOVU1UytBMlFKdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0F6aDY0TTE5bk45N1dZOE90U2creDdNQUVHeUZxV0p1OVpRUnhDZDJKazJF?=
 =?utf-8?B?TDlIQnhEa1pPdGI5eFc0K0FPRzlxZjgxTEZuU09rL3JIdWlleGpLc1hWM3A2?=
 =?utf-8?B?SVlidEhMTDc2MW1YdnRjYWdaZmRsZ2dJbHg5Y2FRTTZIcVpHb3NVUFlCM2gz?=
 =?utf-8?B?eTIwR2p6UGVxRWF1b2syREl6T0xHNHNaMUw2emJSTVdzRCtvS0tCTFpEWk1r?=
 =?utf-8?B?ZVpaWVlleE9pOGZuQUpmdGt5VEx2akdJQjBMWC80SkZ2VVkxY05HQWNPcGJa?=
 =?utf-8?B?ZlBMQitVU01vMUF2eXhDU0h0R1Rja0NJdXA0Y3d3S0ZlTGpXUk5IeHVHUXRq?=
 =?utf-8?B?Y3Y4T1hYTjcreEREVW02bXlOSk9qVklXL3JMbTNBUnZ4NmYyMjR5VXRwUVFY?=
 =?utf-8?B?bitqakJJUXI5M2VkMmFJVXo1am1VK0Nob1BCK0dPcnlpamwra3UyMGdkc1N6?=
 =?utf-8?B?Um41UDNyVVlxWHYwQWdXTmZ3ZVJ5RERoaVZsbE91b2hFQnhKdFd3TzZkemoy?=
 =?utf-8?B?TjkvVmpvUlJIVUxidU9uakdCK1U5bnZCeVFROFdhdENHVE1VRmExd05mNjU4?=
 =?utf-8?B?eWRmSG0vbm9JdjdvaGx1dkNEbEoxUndKemRhNEpUdENNNFlzZFJkbWFmaTdL?=
 =?utf-8?B?bVpjdnNEWEYxY1lwMzJSMWdDSUdyOEQ3a3kyL0RIZ1h2TkEzcjZKdS9SNExO?=
 =?utf-8?B?MnZpTFpsdTBZOEltQk4wZ09rbEp3ZHQ0ZVpSTWtwcnhqNTF0ayt0MktVT1VW?=
 =?utf-8?B?eXRQMGlXWWg2ZUdQUW95bEZ4UEtDQ243bUNzd0VzcjBocTU2Mm5LMGF4SGNl?=
 =?utf-8?B?RHpQbHZUT09xNjJyVXRHV3E0M1JFS3hOcGdNeUw0VWdGR1pMN2hCWmJBdEdS?=
 =?utf-8?B?Y1hjdVpsVWR5ajg0cWRRM3ZBc3U2UWpRL2hHRW0wMTRUUEVFWC9KTWdtVzRB?=
 =?utf-8?B?VWxnUjAvbmdGL3NvRHVmdjVFcmhXZ0lqcmpJNTIrZG1jWUtaZFJTdWkwK1By?=
 =?utf-8?B?YnhpaDRnQzZjakYwc2FrRElpdkJMWFhRMlFCOWM3YWtEQzc4L1NxNHNCNnpu?=
 =?utf-8?B?RzZFOXhSUmc1dGk5MUVYYUFVRXdjMUh2QzZIVFpvMkNDS2dSWUhYY3J0K0pZ?=
 =?utf-8?B?Yzc0d0dxR1ZUQmkxa1g2T2xJL1FQQmxjOFExZm5WYy92d1dUNWZqd0s5SENV?=
 =?utf-8?B?MHZSak1jK1phT3FkQVpma2dVUFlOU0ZHU2RZVFJIOUZ1KzhzZkNmTkFWclFC?=
 =?utf-8?B?SU9WMm9NZE5nQXU1R2FvSldxTHYwNDRwckk0cTM0NVJ2ak4wUHJFRENhOU0w?=
 =?utf-8?B?U3NEUlI2VHM4cXZTckVmc05Vd0xwekNuU21rTTZkNWZJTXlCNi83RURqUUxv?=
 =?utf-8?B?TVpDVXBVK3QyVVoyMisyOUp1VkJqQms3TXVyUEJVWDMveVI1Z1BMcXVtV2hs?=
 =?utf-8?B?SWZaZnVmLzIvNHdyRW54cFBWOWUrQ09pMW5lbGlmZFdFUGVlckM4c3d5QWVC?=
 =?utf-8?B?Q0hqSXVaQ3hkciswWkd5alFXT1ZlNkNjeVZNQkFKcTNKZkUzU3ZHK0lWcy94?=
 =?utf-8?B?UlcxQkVsbHZObGxIOTlwdXFJVnkvTFZ6NDgwYVNSSS9Pc0o4Ynk4VGFzNkh0?=
 =?utf-8?B?YnN4L3FadTNkOHF0Y3U4TlBmTjgzR09NQ3ZvZ1JWbmdKZ2IrNkZtSm1Sdm9v?=
 =?utf-8?B?SHpiZ0lMRWFxSGd4RHViVHRGb1NjRHlOcmErSktHcEpQK1JlQW8yaHRNUC8w?=
 =?utf-8?B?Yk5BSFc1NUM1alJ5K0FzNEFGc0VUNWUyaFN5WThJUDROUzQ5RUQ4ZXd6V1ZF?=
 =?utf-8?B?NEsvTGZHb3ZON0kzOXhURC81Y3VQOWJnN00xZk5IdFlIbXlwN01waGV3MTFX?=
 =?utf-8?B?dnNiWlBJdEd5Mk5LWlVkcU9FKzZZZ1FaMlVPMlIrdE9hbS9PR0s5ZnNBWjcz?=
 =?utf-8?B?TUpnWkhpUk5lUlhLODdCTlp4cFJySEw3c3BRckpiODdwc093L2QyRlViVkYw?=
 =?utf-8?B?SFVPdzhocVdmOWdYd0FaS0dmTlB3cXNkK1VIY0lwWGorWHhyV3VwQXlUMVd5?=
 =?utf-8?B?eUcrN3RNdUNLYzVZTkpHNjIvRTk1NytYZklvNTdTNTFFN0Rla0h4WlpsLzVt?=
 =?utf-8?Q?n6VY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d86271-bdd0-4709-0039-08dd1a8ee13b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 09:25:12.5951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oimnxes30KgK8GtUEsLNhjApYedRlHM87mSqdCX13eCoFuSirmAUu2lk3y7b3PxK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4461
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

Am 11.12.24 um 17:14 schrieb Li, Yunxiang (Teddy):
> [Public]
>
>> From: Koenig, Christian <Christian.Koenig@amd.com>
>> Sent: Wednesday, December 11, 2024 10:03
>> Am 11.12.24 um 15:02 schrieb Li, Yunxiang (Teddy):
>>> [Public]
>>>
>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>> Sent: Wednesday, December 11, 2024 3:16 Am 10.12.24 um 18:59 schrieb
>>>> Yunxiang Li:
>>>>> Tracking the state of a GEM object for shared stats is quite
>>>>> difficult since the handle_count is managed behind driver's back. So
>>>>> instead considers GEM object shared the moment it is exported with flink ioctl.
>>>>> This makes it work the same to the dma_buf case. Add a callback for
>>>>> drivers to get notified when GEM object is being shared.
>>>> First of all GEM flink is pretty much deprecated, we only have it for
>>>> compatibility reasons. So please don't change anything here.
>>>>
>>>> Then flink is not the only way to create multiple handles for a GEM
>>>> object. So this here won't handle all cases.
>>>>
>>>> And finally we already have the .open and .close callbacks, which are
>>>> called whenever a handle for a GEM object is created/destroyed. So it
>>>> shouldn't be necessary in the first place.
>>> For the importing VM the shared stats is automatically correct by open and close,
>> but for the exporting VM we need to update the shared stat when the buffer gets
>> shared, since it is already counted as private there. As far as I could find, seems
>> like flink ioctl is the only place where the global name is assigned? The importing
>> side have multiple places to get the global name, but the exporter always needs to
>> first call flink to allocate the number right? So hooking into flink and dma-buf should
>> cover the bases?
>>
>> It's irrelevant where the global name is assigned. The problem is that there are more
>> ways to create a new handle for a GEM object than just flink and DMA-buf.
>>
>> For example you can just ask a framebuffer to give you a GEM handle for the
>> currently displayed buffer. See the call to drm_gem_handle_create() in
>> drm_mode_getfb2_ioctl().
>>
>> When you make this change here then those GEM handles are not considered
>> shared any more even if they are and you sooner or later run into warnings on VM
>> destruction.
>>
>>> I could probably make handle_count work somehow, but it looks like it's read in a
>> lot of places without locks so I'm not sure if there will be some race conditions.
>>
>> The handle count is protected by the object_name_lock of the device. The
>> drm_gem_object_is_shared_for_memory_stats() function is pretty much the only
>> case where we read the value without holding the lock since that is used only
>> opportunistically.
>>
>> What you could do is to hook into amdgpu_gem_object_open() and
>> amdgpu_gem_object_close(), call
>> drm_gem_object_is_shared_for_memory_stats() and go over all the VMs the BO
>> belongs to. (See how amdgpu_vm_bo_find() and amdgpu_vm_bo_add are used).
>>
>> Then have an additional flag inside amdgpu_bo_va who tells you if a BO was
>> previously considered shared or private and update the stats accordingly when that
>> status changes.
> But the open and close functions are called outside the object_name_lock right, so do I regrab the lock in the amdgpu_* functions or I could move the callback into the lock?

You don't need the object_name_lock for this, the update is just 
opportunistically.

E.g. you go over all the VMs a BO belongs to and grab the VM spinlock to 
update the status in the amdgpu_bo_va structure.

It can in theory be that a concurrent process modifies handle_count at 
the same time you update the VM status, but that doesn't matter since 
this modification will update the status once more again.

Regards,
Christian.

>
>> Regards,
>> Christian.
>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
>>>>>
>>>>> CC: dri-devel@lists.freedesktop.org
>>>>> ---
>>>>>     drivers/gpu/drm/drm_gem.c   |  3 +++
>>>>>     drivers/gpu/drm/drm_prime.c |  3 +++
>>>>>     include/drm/drm_gem.h       | 12 +++++++++++-
>>>>>     3 files changed, 17 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>>>> index d4bbc5d109c8b..1ead11de31f6b 100644
>>>>> --- a/drivers/gpu/drm/drm_gem.c
>>>>> +++ b/drivers/gpu/drm/drm_gem.c
>>>>> @@ -854,6 +854,9 @@ drm_gem_flink_ioctl(struct drm_device *dev, void
>> *data,
>>>>>                       goto err;
>>>>>
>>>>>               obj->name = ret;
>>>>> +
>>>>> +           if (obj->funcs->shared)
>>>>> +                   obj->funcs->shared(obj);
>>>>>       }
>>>>>
>>>>>       args->name = (uint64_t) obj->name; diff --git
>>>>> a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c index
>>>>> 0e3f8adf162f6..336d982d69807 100644
>>>>> --- a/drivers/gpu/drm/drm_prime.c
>>>>> +++ b/drivers/gpu/drm/drm_prime.c
>>>>> @@ -406,6 +406,9 @@ static struct dma_buf
>>>>> *export_and_register_object(struct
>>>> drm_device *dev,
>>>>>       obj->dma_buf = dmabuf;
>>>>>       get_dma_buf(obj->dma_buf);
>>>>>
>>>>> +   if (obj->funcs->shared)
>>>>> +           obj->funcs->shared(obj);
>>>>> +
>>>>>       return dmabuf;
>>>>>     }
>>>>>
>>>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h index
>>>>> da11c16e212aa..8c5ffcd485752 100644
>>>>> --- a/include/drm/drm_gem.h
>>>>> +++ b/include/drm/drm_gem.h
>>>>> @@ -122,6 +122,16 @@ struct drm_gem_object_funcs {
>>>>>        */
>>>>>       struct dma_buf *(*export)(struct drm_gem_object *obj, int
>>>>> flags);
>>>>>
>>>>> +   /**
>>>>> +    * @shared:
>>>>> +    *
>>>>> +    * Callback when GEM object becomes shared, see also
>>>>> +    * drm_gem_object_is_shared_for_memory_stats
>>>>> +    *
>>>>> +    * This callback is optional.
>>>>> +    */
>>>>> +   void (*shared)(struct drm_gem_object *obj);
>>>>> +
>>>>>       /**
>>>>>        * @pin:
>>>>>        *
>>>>> @@ -568,7 +578,7 @@ int drm_gem_evict(struct drm_gem_object *obj);
>>>>>      */
>>>>>     static inline bool
>>>>> drm_gem_object_is_shared_for_memory_stats(struct
>>>> drm_gem_object *obj)
>>>>>     {
>>>>> -   return (obj->handle_count > 1) || obj->dma_buf;
>>>>> +   return obj->name || obj->dma_buf;
>>>>>     }
>>>>>
>>>>>     #ifdef CONFIG_LOCKDEP

