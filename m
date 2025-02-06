Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 195F6A2A6BB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 12:06:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BFCC10E810;
	Thu,  6 Feb 2025 11:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="e7Pe52wj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1F510E810
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 11:05:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VFb3lvCiYUrfcTdogogVi3JWCmSJP1MO400K99py9SoTHSke85u1GTx81tavSQ+zpqPRcCSjcm2j87NqQsts37fvWFGpcG/jj+a04f69tpp69x7hQz/FGO0sdTkNiPs5Z6AxVKxlpLvN362EJ0JCgu5HPFn6ALsI0ARfRt4lDepEZlJHrPdJnU+CmNTPcRjtq2TIhWjTC+Ift7hhYV3NKYpJHpUcPP6grrTWvgX+EWsGndn8SEh6hWCiVhmW8bZJ/JntP3CjYjkyEC9Pa+SK6NFuwMo4tUQpxIRjmeWMlBUVht+f+MUfD6wO/kd7Rc/+6atAK8FoXos1tZqTtZArBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+jHqYRpGFbpqfNiW+00SwjS0m2cG57GrMoYy92UGzY=;
 b=P1y5AGMVAFxy+cwhgUccd/SGEU9UcBu/NfWdSi9h1lAXkncR9fj2E/eJ2o6V3RSgmoKfmQklF0bvF9IM7FAqkislzGLeL4xniR7n6VDvJlxRXQdkx50Z83xBNBNweQy8CC9Lt6sIqE9nRWB8g1EFSxZ5s5QTeC1l3/JJVK0dnyGNhVGAAIhZ9bUmx6Fgfq73Tzx42iS+vBArsuAyumBzkTXue0nB020MQa4P/ZxRYeVJqr0K64eoEIGGNCCQQZRo6NBecaQgreFeFoJFYUg9UOEZ4QRavbiZM0/8e/Kmw+I6k8uCOh/kv16bB4eRlmFf6yR7bhtH9VbTYDF2HHaYhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+jHqYRpGFbpqfNiW+00SwjS0m2cG57GrMoYy92UGzY=;
 b=e7Pe52wjDwY80m8DBWWkbnTMMAIKvSFsK9lZviRDMgVMKsJRag1xzaM9FKBadhd0WuzXE4liQiH1RYQFLblEEiDIhVsnC+mkHGbzar1aCi6Tynx3TIb9Nh7OCs1LXtW/Br4H4+B3CYtWzndB/5J5aXvZBz2fTez3MU+K5DDUWvU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by CY8PR12MB7611.namprd12.prod.outlook.com (2603:10b6:930:9b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 11:05:52 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 11:05:52 +0000
Message-ID: <d2aebe45-92cd-43a8-9766-61a36c4539a8@amd.com>
Date: Thu, 6 Feb 2025 19:05:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] drm/virtio: implement blob userptr resource object
To: Simona Vetter <simona.vetter@ffwll.ch>
References: <20241220100409.4007346-1-honglei1.huang@amd.com>
 <20241220100409.4007346-3-honglei1.huang@amd.com>
 <Z2WO2udH2zAEr6ln@phenom.ffwll.local>
 <2fb36b50-4de2-4060-a4b7-54d221db8647@gmail.com>
 <40485636-7ea3-4e34-b4bb-1ccaaadd4e47@amd.com>
 <62aeac90-1ba6-4e22-9465-fee95973a6bf@amd.com>
 <Z6Hv5esGqHWU2TVe@phenom.ffwll.local>
Content-Language: en-US
Cc: Demi Marie Obenour <demiobenour@gmail.com>, Huang Rui
 <ray.huang@amd.com>, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Lingshan Zhu <Lingshan.Zhu@amd.com>
From: "Huang, Honglei1" <Honglei1.Huang@amd.com>
In-Reply-To: <Z6Hv5esGqHWU2TVe@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG3P274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::23)
 To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|CY8PR12MB7611:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e97a12a-e3c7-4bc3-e869-08dd469e389a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHRSd3RsK053ZUdvdCt2MXdKczBQWVlLNzN2Y3l2Z21Cb3laMGcvUk1tc3BY?=
 =?utf-8?B?UjB3dEt3ZHh4Y2VmL1E3RjdYVUxJbVZxWnF2RTFXUDJwN2MwSkZkSit2M3li?=
 =?utf-8?B?WEFXank2ZHFneUtTbEJMUGVUNm1Tc3U1THNJS0pSeWkreUdvcll3ekFLVDBV?=
 =?utf-8?B?R2Nhc2JkYmJ3ZGJuQ0VYVVJjRkxwZkJrZWg0a2o3M3I0M3hJZUpKMDBjVEdZ?=
 =?utf-8?B?YWFsTzJXZGJoT3I2YlBhcXVOaWNtbGpYV1FYZlRKYjRjVXg1b28xcHlpL05U?=
 =?utf-8?B?bDZUSHZJZ05jdUVJZGdWSjVEUnFwRnl5bk5iUlJHNEtMZkN0a2J4Z1dERHUr?=
 =?utf-8?B?RjJzTkNtNm0vZ3RGUmhpNllsZGNiZ1dSeTJROXd0OXBPZ3dvUUR3eFhRZk43?=
 =?utf-8?B?NmZqbTk0bEFuUTFTUFErZVJrOW1mZkVJWUIrZTB6VVd5S0gwbVRmSkZhOHUr?=
 =?utf-8?B?UHo2cXgxZE1yWkExQVZCTFB0QW90bHdvSjJlTEJONzNQaWJnWTNNMnZiNVQr?=
 =?utf-8?B?ajdiOUNKNVhKdVYxTWpNc3hOZkxLc0Uvc3dEVGt5bDV2cWF3TWt3bVFUUkJQ?=
 =?utf-8?B?MUtlSzhIeW1BMDV4S1VJbnNkSk44ZDlCS2hnVWZybmt1aUFabWJKR1FISXkr?=
 =?utf-8?B?VDZ0OUpIU0tYa04xSlkzQU5NTDJYSjJxcllkOXJPYk9ValF5dHphYTVWYURu?=
 =?utf-8?B?Mld6WURodC9VbURjVHIrck1DcENKUjZpRnFTZjJrejV4Q2d1RFNrY1l6aHQ3?=
 =?utf-8?B?VVMwUGhEZTk5dkU4L1NwSjVPa0lOS1dZN0ZXYXcwSlYrakxxMXJWUEhpdkN2?=
 =?utf-8?B?aDlpd0pqSVNGdmozMWw4Q1g3WHovSnRacWpmamNYKzI4R0ROcUZUK3RzRWV4?=
 =?utf-8?B?MHJOc3c3ZE1WMFNXQUlWbGhxVkpiUWlWNzlzVjFDazBpUWVNSTlnbnZhNXR6?=
 =?utf-8?B?N09qejR5LzRTcGFiMGUxeWoxcGxIdWRPbmQ5VGRWVjhOdUVFOWNDbzN4K3NM?=
 =?utf-8?B?QjhVbVBLRlZwMWNqUWtFb3lYdk10UzNnOVR3S0hncDd3a3dkVkFTUlZOcU9x?=
 =?utf-8?B?aCs1eW1nL0NSQW1oYUIzZWxSNmNpMlBtcE5QWG8rZm16Uis1SU8yNjdNejJ0?=
 =?utf-8?B?ZU9sWnJ4N1VJT3FNZkV5eXgxZTJ3SEYzdC96eTFDcVNLVFZmeWcwdUpqN2h2?=
 =?utf-8?B?VHVYNDF2aEVTMmhzTUpacjgrR0g1bjBGWFZDRU1OUTRvRjNPUGZSaWk1U2tw?=
 =?utf-8?B?Z2RHVTRWaXYwRFppc3RSck1iTUtoT3Nmd0dvaTh1YkZNalhCMEtWc0RybGMy?=
 =?utf-8?B?dVFGckpRbnJHQzRqV1dFaHE5N1A4SE44SnJodFZRek1JbTNuT2ZjVmZxRE1D?=
 =?utf-8?B?T0ZUc3JxMEJBL25NdGJBcXJBT1p1S3YzYVVqWHZvdTF2OGw3ajFtUTFuRm9Y?=
 =?utf-8?B?WXN2UFVZRWRJYzlZemFvd2hkZ1JjT3BmeXkwVFBNbFpTSFJsVG1YVW84UmR6?=
 =?utf-8?B?UTZmMHdyVGdOY3ozYzAwZmN2MFNpTEw0ZHJmb3B4WHhyOTkxSnFvS2Z0b1Bh?=
 =?utf-8?B?cXdHekl0TFl1Nm5BUzlrUmJScjJSV0ZLamhZTTFFN0tscFFia1JiQU8zUVgx?=
 =?utf-8?B?MVl5TE5LUDRoNy9MaVhLRldNZ2NtMExWWEQwM0s2Y0xoZURaREQyZ0pabXVv?=
 =?utf-8?B?ZkJFcmM2WG84STJ1a3lJNlcyTTZzWlA4WVFCanQ2bkZvQmo5SGZYb2x5YUts?=
 =?utf-8?B?b0ozRFA1QytpVGRpRmNEQ2ZyQTZwR0lxMGRpNzdsemNOQWtMQ3dRSmpsWGg5?=
 =?utf-8?B?WEZjMEMzRUVaWVNFb1VkQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c21hYXFId000cnRVRzRrZXMvVDcrblpsWG5VeU5CUlFReVpZZG55UlNEQTU3?=
 =?utf-8?B?N3dJeVpwTTA4OXVVbjRERkNpZkdJS29GYmdWcVk1U3d4RytqeEVkMVgxUG9J?=
 =?utf-8?B?OWQ3M0tKcnlzOUp6WVJIQ3FPYTdnQldsdVV0RmswVFU3QTU5cThKZ3p2NHE3?=
 =?utf-8?B?dHVUc3k3NFpvOGZteHI2bDBBS2pUMFI1R1J5aHhzdWpva0w1cktnYnQwbkZL?=
 =?utf-8?B?NEhsenU3VHIxSjU0VWlQeU91dEo4QUdEdGJoQmZoMG1IVjl5blYyY1dnTG05?=
 =?utf-8?B?SHhWaDEvZ0JMRUxKdU1LNDJEeUwwU0x3M2MvQ0IwRmxSK1E5UGpUSzhGRVBD?=
 =?utf-8?B?QlhqWGhIQW9JMlE5RWk0cGFjSkFNWVVOd040S3orNjZxeTdOanpYN2ZxbFgv?=
 =?utf-8?B?c2tkSzMrRzQ1eTdjS2dPR2ZHZWtOU0dtUUdwaVdMaWVUTUdQendQWG4vTWpv?=
 =?utf-8?B?VUlEU3BUOWVxZm5FU1BraVRjVHI1aCtsMnBNSGtTc09ldHdRZUpsVGlaMlBl?=
 =?utf-8?B?eDdpQ1NBZW80VGtYVFk4ZDRZWHh0VnhQeHh1dThFTjlwWE5LbExvT1hlQXhz?=
 =?utf-8?B?b0hrNjNQY0ZXblZuMVNSUEpzeVIrODMwbXhKckdHWjBkdXJRM3VNVGh2cXk0?=
 =?utf-8?B?SThOSXpGdkVuOXBhQzAzSzRLQWpJTFZTZUZsVkcwVEE2K0IvRUtwQ1JHRDh2?=
 =?utf-8?B?RGh2a0paKzgvMXhlVDF4SlJ2SnNhV1JsSGhZWldLcVR2bVFTNGdjZW5EdUY2?=
 =?utf-8?B?emdGT2d0cTV5RXRpb2VlNkxYVG9scGVoN1B1dUlHNXBRaERaSlNYMDFIWUJF?=
 =?utf-8?B?NTdmUlBtcTNvZFk4YjZpL0xWL0xLTEVZVlEya2toNGZIdDA1Z1dYN0I0cDRq?=
 =?utf-8?B?TXVLUDNxTzdoN05XbnVmVVVXY2N6b0x5QmxwVWFCWklvUTRld1puQm5taXMr?=
 =?utf-8?B?RU5DSWIrWEs5WjFIMEJlWUpTU0RPYlFFWVkzTW1WdkVIbkF3ZzVLV0NsNjE1?=
 =?utf-8?B?MWV6UWVWSE1GUjd3ZjJLR2VFTHNKOUZLSjJwNEsyN0dRaitEM283V3lVdEhp?=
 =?utf-8?B?cE12cndyWVA4L3JWalRuaDZ2dmdsNjZTdi9hczR6QmRNMmJ5REtmK2VtZGV5?=
 =?utf-8?B?YmhaSkNDRlEza2MwRFlmYzVsWkFKMTJpakM3QlFEWTlTWElZVzZpWjNNaWpP?=
 =?utf-8?B?UG1lVW9JdDdjNmZ3OHJHNTlVQS9oT3VheWVzOS94a1BGN1NzWk5VMUt0UEhK?=
 =?utf-8?B?VnZzdG1HZm5BU1VHbWNPSXBheHh2UnhCYmZ1TkIrVUJoM00xbmlmTDlXUFRR?=
 =?utf-8?B?dTJwNHBwbjVXV1dibGlmZWN5cGZmUHNpTWloQTlDYUMyOVQ0NWJxdHZMYldR?=
 =?utf-8?B?UENEdUUxamlLOWhEQ2NYU1U1S0hZZkU1VTRzR0tyNFhXK3RqVmZHK0N4anpT?=
 =?utf-8?B?SUEyWHVDQmtpVkxBdTF2OTZBaHhWc213K1p6M3FrVmpZc2VIL284U2hLeE93?=
 =?utf-8?B?ZlAxUlpFRlozR3RVdzZaWGxMb1dDUmJNdnh3Z0VUOFBRWFkrOExPZFZmUnla?=
 =?utf-8?B?eEpIcE81bGlEejJDczI5amh2N0VGSnJycmpaYzROVHZEYkRkdktERzNGNlhh?=
 =?utf-8?B?TEVtL2wyWW1MdFg5U1l1YnBPTnpZYzArcHh2alhkRE1BNFBxQ0UxZ0Q5Z1pS?=
 =?utf-8?B?TjhkbndtTmJWUWlHY0tyOXdrL0s5dVF3dERVSnc4ZTJ3clA2ekNySERhcGx6?=
 =?utf-8?B?eGYzU2ZDZ0t1eEpoNnRLMWc1MGxWdVgwM0tEMS9Rd28rVnY3T3RwSkxXdW1h?=
 =?utf-8?B?YkNDbHJjOWxWZmtna1JxdmpHdmc5UUVZNk4yVzdRL1Y5cFNYc1dCc3dzWHhu?=
 =?utf-8?B?enUyYy9QK05HQTdJYlMzSEI3RExuaGgyMzRmTWVkS1dMZGhtTmUvU2lFNVE5?=
 =?utf-8?B?Y2RudXloNnNoSlRSNzdYU1N2TFM3eEJ6VG1sU3UzTTI3MDdod0w4Z0srcUVU?=
 =?utf-8?B?TFpWVjFUTVRCaXF3L2laa2psNUx0K1JoT3FxU21hMVZDbTd3VXo2S1ZMbmh4?=
 =?utf-8?B?WmtTdHBuMit0WHNUUTFoVnlCd2VaRVQzY2s0b2NiektGdlBFTVFKS1F6S2ky?=
 =?utf-8?Q?TFi8iQZsLXVvzW0BtUZ310/xp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e97a12a-e3c7-4bc3-e869-08dd469e389a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 11:05:52.8144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rXz0MC4r1QMqkUTKPVtpALjrbQFSkMGVEHzeNMtg++39VZyqxGn/mbOr23VR/Igy/1W9IPFzMYkGYBK/RArFxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7611
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

On 2025/2/4 18:45, Simona Vetter wrote:
> On Mon, Jan 20, 2025 at 05:54:10PM +0800, Huang, Honglei1 wrote:
>> On 2024/12/27 10:02, Huang, Honglei1 wrote:
>>> On 2024/12/22 9:59, Demi Marie Obenour wrote:
>>>> On 12/20/24 10:35 AM, Simona Vetter wrote:
>>>>> On Fri, Dec 20, 2024 at 06:04:09PM +0800, Honglei Huang wrote:
>>>>>> From: Honglei Huang<Honglei1.Huang@amd.com>
>>>>>>
>>>>>> A virtio-gpu userptr is based on HMM notifier.
>>>>>> Used for let host access guest userspace memory and
>>>>>> notice the change of userspace memory.
>>>>>> This series patches are in very beginning state,
>>>>>> User space are pinned currently to ensure the host
>>>>>> device memory operations are correct.
>>>>>> The free and unmap operations for userspace can be
>>>>>> handled by MMU notifier this is a simple and basice
>>>>>> SVM feature for this series patches.
>>>>>> The physical PFNS update operations is splited into
>>>>>> two OPs in here. The evicted memories won't be used
>>>>>> anymore but remap into host again to achieve same
>>>>>> effect with hmm_rang_fault.
>>>>> So in my opinion there are two ways to implement userptr that make sense:
>>>>>
>>>>> - pinned userptr with pin_user_pages(FOLL_LONGTERM). there is not mmu
>>>>>     notifier
>>>>>
>>>>> - unpinnned userptr where you entirely rely on userptr and do not hold any
>>>>>     page references or page pins at all, for full SVM integration. This
>>>>>     should use hmm_range_fault ideally, since that's the version that
>>>>>     doesn't ever grab any page reference pins.
>>>>>
>>>>> All the in-between variants are imo really bad hacks, whether they hold a
>>>>> page reference or a temporary page pin (which seems to be what you're
>>>>> doing here). In much older kernels there was some justification for them,
>>>>> because strange stuff happened over fork(), but with FOLL_LONGTERM this is
>>>>> now all sorted out. So there's really only fully pinned, or true svm left
>>>>> as clean design choices imo.
>>>>>
>>>>> With that background, why does pin_user_pages(FOLL_LONGTERM) not work for
>>>>> you?
>>>> +1 on using FOLL_LONGTERM.  Fully dynamic memory management has a huge cost
>>>> in complexity that pinning everything avoids.  Furthermore, this avoids the
>>>> host having to take action in response to guest memory reclaim requests.
>>>> This avoids additional complexity (and thus attack surface) on the host side.
>>>> Furthermore, since this is for ROCm and not for graphics, I am less concerned
>>>> about supporting systems that require swappable GPU VRAM.
> 
> I kinda ignored this one, because from my point of view it's all clear.
> But I guess better to elaborate some more.
> 
>>> Hi Sima and Demi, I totally agree the flag FOLL_LONGTERM is needed, I
>>> will add it in next version. And for the first pin variants
>>> implementation, the MMU notifier is also needed I think.
>>> Cause the userptr feature in UMD generally used like this: the
>>> registering of userptr
>>> always is explicitly invoked by user code like
>>> "registerMemoryToGPU(userptrAddr, ...)",
>>> but for the userptr release/free, there is no explicit API for it, at
>>> least in hsakmt/KFD stack.
>>> User just need call system call "free(userptrAddr)", thenkernel driver
>>> will release the userptr
>>> by MMU notifier callback.Virtio-GPU has no other way to know if user has
>>> been free the userptr
>>> except for MMU notifior.And in UMD theres is no way to get the free()
>>> operation is invoked by user.
>>> the only way is use MMU notifierin virtio-GPU driver and free the
>>> corresponding data in host
>>> by some virtio CMDs as far as I can see.
> 
> Yes that's what I meant that you need real svm/hmm here. You cannot fake
> the amdkfd/hsakmt model with pin_user_pages, it fundamentally falls apart.
> One case is overcommit, where userspace malloc() a huge amount of virtual
> address space, registers it with the gpu, but only uses fairly little of
> it. If you pin that all, you run out of memory or at least thrash
> performance.
> 
> For the hsa/kfd model, you must use hmm+mmu_notifier, or you're breaking
> the uapi contract.
> 
>>> And for the second way that is use hmm_range_fault, there is a
>>> predictable issues as far as I can see, at least in hsakmt/KFD stack.
>>> That is the memory may migrate when GPU/device is working. In bare
>>> metal, when memory is migrating KFD driver will pause the compute work
>>> of the device in mmap_wirte_lock then use hmm_range_fault to remap the
>>> migrated/evicted memories to GPU then restore the compute work of device
>>> to ensure the correction of the data. But in virtio-GPU driver the
>>> migration happen in guest kernel, the evict mmu notifier callback
>>> happens in guest, a virtio CMD can be used for notify host but as lack
>>> of mmap_write_lock protection in host kernel, host will hold invalid
>>> data for a short period of time, this may lead to some issues. And it is
>>> hard to fix as far as I can see.
> 
> I forgot the exact details, but when I looked amdkfd was taking too big
> locks in the migration paths, which results in deadlocks. Those were
> worked around by taking even bigger locks, the mmap_write_lock. But that's
> a design issue with amdkfd, not something fundamental.
> 
> hmm only needs the mmu_notifier callbacks to work, meaning either context
> preemption and restarting, or tlb invalidation and gpu page fault
> handling. Those you can forward between guest and host with no issues, and
> with hw support like pasid/ats in iommu this already happens.
> 
> Note that the drm_gpusvm library that's under discussion for xe had the
> same issue in version 1 of relying on mmap_write_lock to paper over design
> issues. But the recent versions should be fixed. Would be really good to
> look at all that. And then probably do a full redo of the svm support for
> amd in amdgpu.ko using all these new helper libraries, because my personal
> take is that fixing amdkfd is probably more work than just writing new
> clean code.
> 
>>> Finally I will extract some APIs into helper according to your request,
>>> and I will refactor the whole userptr
>>> implementation, use some callbacks in page getting path, let the pin
>>> method and hmm_range_fault can be choiced
>>> in this series patches.
>>>
>>> Regards,
>>> Honglei
>>
>> Hi Sima,
>>
>> I modified the code, remove all the MMU nitifior and use pin_user_pages_fast
>> only. Under this implementation userptr fully
>> managed by UMD. We did a performance test, it decreased by 30% in
>> OpenCL stack in Geekbench6 benmark.
>> We use AMD V2000 for test:
>> use MMU notifior + pin_user_pages:
>> near 13000 score: https://browser.geekbench.com/v6/compute/3257793
>>
>> use pin_user_pages only:
>> near 10000 socre: https://browser.geekbench.com/v6/compute/3496228
>>
>> The code is under clean up, I will send out later.
> 
> pin_user_pages is fundamentally broken for the hsa memory model, no amount
> of benchmarking different flavors of it against each another will change
> that.
> 
>> And I found a another thing, it seems like in intel i915 userptr
>> implementation, the pin_user_pages is also used in MMU notifior.
>> Code path is: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/i915/gem/i915_gem_userptr.c?h=v6.13#:~:text=ret%20%3D%20pin_user_pages_fast(obj%2D%3Euserptr.ptr%20%2B%20pinned%20*%20PAGE_SIZE%2C
> 
> Yeah i915-gem isn't great code and shouldn't be used as example for
> anything. This is Dave&me asked Xe developers to create a lot of the
> infrastructure in drm libraries, to make sure we have a solid design here
> and not what i915-gem did.
> 
> Also note that i915-gem userptr is for buffer based userptr, like for
> VK_KHR_external_memory if I remember correctly. This is not the hsa memory
> model at all.
>>
>> Patch set: https://lore.kernel.org/all/159353552439.22701.14005121342739071590@emeril.freedesktop.org/T/
>> https://patchwork.kernel.org/project/intel-gfx/patch/20210323155059.628690-17-maarten.lankhorst@linux.intel.com/#24064663
>>
>> And I didn't find the hmm_range_fault code path, maybe I missed it?
> 
> i915-gem never supported the svm/hsa memory model in upstream, so yeah
> it's not there. For drm/xe see the work from Matt Brost that's currently
> under discussion on dri-devel for what it should all look like.
> 
> Cheers, Sima
> 
>>
>> Regards,
>> Honglei
>>
> 

Understood, and really sorry for the misunderstanding on SVM feature. 
This patch set is not going to implement the SVM/HSA feature for 
virtio-gpu. Just to let host GPU access the guest userspace memory. I 
will correct the feature description in patches. The full SVM/HSA are 
heavyweight feature, need much more time to implement.
The goal of this patch set is not to achieve the SVM/HSA feature, called 
by "userptr" or "guest blob memory" maybe is better.

Regards,
Honglei


