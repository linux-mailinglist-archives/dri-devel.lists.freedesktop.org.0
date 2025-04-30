Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2113AA4BAE
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 14:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F2910E778;
	Wed, 30 Apr 2025 12:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YQz06Vor";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398B810E770;
 Wed, 30 Apr 2025 12:50:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MF8i9AXKvTmD10hbyWW9XfNME6PRvwoNY8VuM7g6lP9Q3w+HkK7SYmaJLjZ1MAqzim+339LdXJFFv3KD75VWk/fGccZ42zenzwiHBgbCUpdEKorzcX/NLEUh6hdJJ7XL2KEu7568VMv42EqMXzGIbQ890ZgQVOgGMoB1YuDmHMPw7uKksIlw68RhUOBRcc4e6KtBuUbCMlWQ9lcqPy8ZgoF6WuTqrJGOXyCG05y3myl0HttgIsoxYEkidhpsU+1WRCjbdjY3KeK+HxgvonqmBkkYLdNmAmXHwhkbXvc/BcLJ+oVfPLUh9BeYpZNWUy06xflICPnRXf6qiSB2+fvtvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aj6S1HsLQCzCQ9hx09oCnB4GNVVzZZawWtvvpU0fYPQ=;
 b=IyoHENtpYLZjLOMj/EaZbtBQAwRS7xtVwVwItByIFem8muLp85DX7zihW1FZjheWce4TLmPryMZVVyFiZmeQLt4Q1KJMZb0p4HaEh7bXXD6h8tiBCnH7MIQMHsw5j1PuVnpo4NQOICUNxO90NKcn420mubpniuIj2KKbTXDSZQWr3OP+skhLN//wV+w0+zYBUVuaHP6A7xJkiQ3yrvsMWFnDTJebE26AIKWTFzSa3AL+6oAH/ltAbkVrgZB/F0tdActsjlanYpKiivlcjwLK/m1vIhf+GlL4bfg0KcRGk4t/OjLqOUv9pOmgB6/OXtqtOuh4HMOUs9rssbJHWecF+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aj6S1HsLQCzCQ9hx09oCnB4GNVVzZZawWtvvpU0fYPQ=;
 b=YQz06VorMc0JUq3HxGrzlNBhyeGSPTRG4gvyiDurdPpMcdhbmOpfWxWzoUK+jzLkRc25jyBToFPIjj8kp3j2/58s3yaaP1NdHPUxfoS6w3s9g9HntCiTlbtDBvcN83o7DOhs8z75eqgPOeBIlGFOf9uE1TTRxNvhrvnWarG7ycY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by PH7PR12MB5782.namprd12.prod.outlook.com (2603:10b6:510:1d1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Wed, 30 Apr
 2025 12:50:50 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::6216:e70a:9c8b:7abb]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::6216:e70a:9c8b:7abb%4]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 12:50:49 +0000
Message-ID: <254d31f8-0cbb-45d2-9686-2923e511811b@amd.com>
Date: Wed, 30 Apr 2025 14:50:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu/userq: remove unnecessary NULL check
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Khatri, Sunil" <Sunil.Khatri@amd.com>, "Yadav, Arvind"
 <Arvind.Yadav@amd.com>,
 "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
References: <aBHZuejTTKkdnGaZ@stanley.mountain>
 <MW4PR12MB566769E097E394ED607DBD9CF2832@MW4PR12MB5667.namprd12.prod.outlook.com>
 <ac039a7e-4152-4df5-af3d-c952cedfa6dd@stanley.mountain>
Content-Language: en-US
From: "Sharma, Shashank" <shashank.sharma@amd.com>
In-Reply-To: <ac039a7e-4152-4df5-af3d-c952cedfa6dd@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::15) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|PH7PR12MB5782:EE_
X-MS-Office365-Filtering-Correlation-Id: a8aa4097-3d2f-4f1d-9d3b-08dd87e5a22e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmlXTHdPK1JEVk9ud3BEQUsva0Z4SXpXazhZaVk4WHpYMGN1U3hDWks5aDh6?=
 =?utf-8?B?b3Y4T0NuOXBaK01yZ2F4SXZFbm5DMmNTVXVqQjJQQUZmZERTd0RWYXpmdEtm?=
 =?utf-8?B?RzZiZXFlZ09SckluYmM1eThEY0pJenIxR3BlVjJvL0RnSjNnSVRHd09seTVl?=
 =?utf-8?B?L0NONEZCOGpzRDNEUWs0QldlMGRhMDNUemV6U29YZ0s4YUozMExJeXp3TDBl?=
 =?utf-8?B?eGwydTVuYUo4Z0VBWjNtTERrWG5Wb3FIR1ZSeU54K0pJaXY3Tmw2QUowMUNV?=
 =?utf-8?B?Y1EyclMvV0NlZnNqeGsvVGM2YjlBai9zck51bTBXUWRvamhaZkNpSXFWR0NF?=
 =?utf-8?B?UjQ5QitFMmZ5bU81WnlHdHhoeWxmOGJ5SEJZWHpEOEN2NW45d3VScW5VSC9u?=
 =?utf-8?B?dXNOK09PUXc3aUtpaTlWQThHWUg1RlNtaFlYcGppSGV5TUNEN1A4MUxZTXlL?=
 =?utf-8?B?MW4wSFk4dnNQeVBWeWtJMGYxanNFTnQ0cHdMMkhyUVN4QVd5bkxEcEFEdVlK?=
 =?utf-8?B?RENpM1Y5WmtKckxvcCtKRFpIOFF3cHpCaTF2REpta09rc2VrR0N6RVpiZ2ZG?=
 =?utf-8?B?eVdQQ1pVWUdiV2NndTN5RDcvc2xZZVhDWWZLWmY4SE5tZkIzY254YzF5Kytj?=
 =?utf-8?B?UFJsbWhQZEFJNnRnWk1UM2w3c0VmMndCQmNmVG5mdU5NQ3h4RkVpMFZBV0xj?=
 =?utf-8?B?aFNtQnV6ekZNY1E4bG9wZFZLNzg3LzhSbWhvS0tlcy9iZC9aaWhWYXVRNjZs?=
 =?utf-8?B?eFdjUVExTTJZcitiVXlnai8yU3l1RHd2RVcyL1JzeUNQN2l4UjArc29zVUlm?=
 =?utf-8?B?c2swTmRQVkRXK0MzZXVwOUphZDRUaUtxNHV2TXpURFZPTlhycE1tOGY2MWF5?=
 =?utf-8?B?blpEN0tzc3A4VUFUbTFPaTNXTC83S3JOcFU1ZXdVaDFpWS92YlBycEh4cFk0?=
 =?utf-8?B?SVdNYk9uaGhqRU5CaXlZVjBXenk3eVNxY0dWY1FjSkltYURWREI5RzNsSmZl?=
 =?utf-8?B?NXdIWnZBZzRad2JveUd3M2d0elpTWUVRYytrdDQyTE5WMVhPSXdrcXZ1RTFa?=
 =?utf-8?B?N2RlNlF2S2xoRHJzMHlhNDFCNmJ6VmZoOE4xSHpYV05MakhCRE9WZU5GSTNz?=
 =?utf-8?B?OEp6YzJKaytWQWRYaUx3Q3FLQ0RwaU1KUTIwRlBmS2RLcDRzdGFhUmNyaU1l?=
 =?utf-8?B?aTdpVW5XSGdSQ01PRDAyM1AvNU1mbTE3THFYakxYMXMxY0RudEhRSVlIZ2lM?=
 =?utf-8?B?ZnF0eUNPN0g5RkFTY2FFcE00SmxVQVl5Wm05YUorZHROaTVFbmRNVko4RVU1?=
 =?utf-8?B?M29qdE9zT0dkNTNPZ1Rka3Q2OUR1Tm5UdWdIa2FlRDlEdThrUFl0eGVEOUhS?=
 =?utf-8?B?MU04eVpsNk5wZnBTeTVRVjZScXRVdkcwRVNoNk9BL2doWjlxaG5ZeThYWnIr?=
 =?utf-8?B?UTdrSDBvd1YxMFZJZ2dTT01TR3dwY040aGROTmZqN2NNNkpsVUVubWdYSzEr?=
 =?utf-8?B?NnNOazBFOG44citmWnNDbEVVWTFFcmhtZWh1eWticFZwSGNlSzlZb3pRVXlw?=
 =?utf-8?B?bjVJMHhSdDBVV3ExMkxjMHg1NXJQSFE0OVFVVzZabVNrS1IyN3orbUFweXAw?=
 =?utf-8?B?WTd1L1VSUTRPR3locXVTMG5XMFdFRDE3ZGxHQkk4a2FzUVhIbk1rZlNEOENt?=
 =?utf-8?B?SjhEZ2tnelE2dGlkTTFqc1ZtMjhuK1BFVzNIMExJV0hHMHJZYWZrSy9uUzlP?=
 =?utf-8?B?OXZVRS9xL3piM1BzeUVPRXZPQUFaTVEzQWc2cW5oM0FkMUdkUHpyQUdpOW1N?=
 =?utf-8?B?UldDWmdkQ0VTeVR4Y1YvRXVWQVhtWXFPcCs0Ri9kaHk1cDhUK1loMUVCeERz?=
 =?utf-8?B?bWd3S25ObnJBWm5vVkZFUzluWVRqenloZTlRTThPVzNLakFYRkNXYXV3OGJw?=
 =?utf-8?Q?FrJ+dycoz/w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnNBdlF1SU9mWDlrTkJqSStjWEM1NUFqaTF1V3lPMWRLaTltRnREV0tLWDlX?=
 =?utf-8?B?c29McGlHMVdTYVpPcitBVk5LMlplRGhsS3FJN2Z5WXgyVVhwcTJNVldLRVVq?=
 =?utf-8?B?TXNqTVNXcGFwVy85eFp3bGRmOGZ6bHZ2TWNwSThaV3g5alIrcmsveTd4cHRl?=
 =?utf-8?B?QWpRNW9BMVN4YUNac09zTDVKeFdPckJnTndHc3FXV0NpcktCTFEydVpqR3FV?=
 =?utf-8?B?N2l1SURFTXNsVWN6STA5WkMyMlhURHZjZTFMRVhEVnp3RUhjUkJNa2xzbGdQ?=
 =?utf-8?B?VFZYbDVoOXZMc3h0YWlvb0pRR2xVU3NibTEyb3FEbmxDSkZlR1NES3RrTFpW?=
 =?utf-8?B?Wm1jZ0gxM0hJQjBJQmhYd1gxVUV0ZGl4OWVRTC96TDl0Qlh3YjUyc1BqMlhG?=
 =?utf-8?B?WVNMUUJFSEtFSGNzYzdZNFBrZTFOTDR3a21rVWRWR29PNmpsMmNsRk84UzlO?=
 =?utf-8?B?M3RTMThZNm5jZDQ4R2VoOXl3a2trbkFNTkxMbk13Z1pXVFVtNnZEQUI0SHFa?=
 =?utf-8?B?NjdxWXVqRkJ3YWRZcVhSMzhqM1pHaW5ucVFmVi90T0w3V1czNDhjeU1yMlpD?=
 =?utf-8?B?dHM3NHhMSDR3dVU3R2hVLzZlTVJHck53aVJZa0svb2o0S2NRd3d5V0orY2RW?=
 =?utf-8?B?Q0NqNDF6ejhxbGh6akZROGI2M0pYMFp0SzhBQUsvS1V2YUR5eHJ5R1ZYb2gz?=
 =?utf-8?B?V0M4SXh5MzhUNStCTHEydy9BMEYweGtOTldDckFHZStTc2FxMkptWEpMZW0w?=
 =?utf-8?B?MmZNUktkaFRob1kraTZpaUtUL296c2hXd05SaElQN3RzeUhDMUYyMU5BLzFX?=
 =?utf-8?B?ZzJXNG1oaUkwb2M2QjdYSWdTUTJEUityR2lvREgrVktCT3MrSHNGZVZ1eFJG?=
 =?utf-8?B?SE9CUDJ1VmNtT1JqNnlHM0RjVXF1Uk9ucTgvRnFoY2FycTMrWGZQTDhJM0dD?=
 =?utf-8?B?Yks1QUZMR0ZDa09Ga1YxYXhjNXZCNnRLYXpHMG0rR05nM1lGN0dmaEpmWjFJ?=
 =?utf-8?B?czdhZ1U1Nm05TEJMUk9CRlBiV05DS2h2aUxzNlVFWHI3ODVHbTlpT0JYRXBv?=
 =?utf-8?B?T3hxWWxiZWpRcVd3Vlh2ei93aDUveXZTaUFVNXlBM0MzUDhxTWU4d0lvRzdT?=
 =?utf-8?B?L21uSnllcVkzVE5SZ1FUT1FQNXJKNVh1TDdHMG1leGhNZjQvRU42Mzl1djZB?=
 =?utf-8?B?ZWxLQmlzOWp0OHpJSE10c3BpWGJwRi8yTmwwdnBsN1lra2I5ZDdRMXUzRmRD?=
 =?utf-8?B?TEdTWENtZXl6NVNsQzFWMUxTS2xvR0FaelJzV2hlLzVnS2tTRHBGY0gwUEhz?=
 =?utf-8?B?M2VXZWIyQ2xSeWVMQS9wbDBkdG9EZ3F3UmxEam9xRzZNRjA5akh3azEwZHEv?=
 =?utf-8?B?Y0l4bEh3YjVEeTVnTkx3MEpnODFJQmF0ZVdGM2hBblloQ3gxMTFMYU1QbUNi?=
 =?utf-8?B?RmxDbUM5Y2xpTXJSaFR0MDJWd3A2c2ZzejZTZDlMclM0ZEtBRXpYZTJEdUN6?=
 =?utf-8?B?RjhBNk82K3VqRU9Ob2owTjVJTnNVMHRwdm9kd0daSFdLNkMxaURQdUZhcjVC?=
 =?utf-8?B?b1hFRGR6djBPeWhLTFFkQTNLVHBza2k4WEV6RmtrL3ZjNkdqbnhTZkN4VjEy?=
 =?utf-8?B?QWxmQlhKWWRkTjhOQzlubTI0TUhqUlJFcjE1cGE0TXpsL1o0eVp3dVVIMG4x?=
 =?utf-8?B?Q1pPSEFOVkN0MHlVK2tZMU9ZN3g4K0pYTHJLaXVCaHJVZm5ZTzExM2pVZXF5?=
 =?utf-8?B?MlFPK3p5QnFpWDVqVFRaRkFTU2J4UlBHaWYzN2ttSGx6Tk9RR0pma0IyU1kv?=
 =?utf-8?B?Y1daNW1OZml6YkJLQUVwd2RpcExZUVVoanZRQkptR04zUjNLQURhazFpLzV0?=
 =?utf-8?B?VFRhV3ZZdExySlMwTkJSOWRyY04rZWJjWEhSOUJKUnF4Q2tzcUIzUzhYMEZT?=
 =?utf-8?B?bmhWSlNUUDVObW9ITTJ5QmRSWFppMUd4SzdoZlhaUVp1SWpoaWNPQ3g4M2Jh?=
 =?utf-8?B?dExvZTNsLzcyM2w4elJMMVRhamc1MVJOZVR1bWlUU0NjZGNFc2IwVFJaQ245?=
 =?utf-8?B?ZWpUVUpwWDJWa3hhZHltV3dGU1ZUZEpkdkUzcjk4ZmNOdTEvSFNVQkhqaXFq?=
 =?utf-8?Q?emX6K8xqkfJmnpQyryP3fPNbb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8aa4097-3d2f-4f1d-9d3b-08dd87e5a22e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 12:50:49.8227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yQuaDFx9u7FhblfISudpN5aFHYNjl+N+IwMCFfDFs+qUQtM6MfdoYKxHPdCp2LUvZK66dDHxOa8rx2Yj2hivw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5782
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


On 30/04/2025 11:49, Dan Carpenter wrote:
> On Wed, Apr 30, 2025 at 09:28:59AM +0000, Sharma, Shashank wrote:
>> [AMD Official Use Only - AMD Internal Distribution Only]
>>
>> Hello Dan,
>>
>> ________________________________
>> From: Dan Carpenter
>> Sent: Wednesday, April 30, 2025 10:05 AM
>> To: Deucher, Alexander
>> Cc: Koenig, Christian; David Airlie; Simona Vetter; Sharma, Shashank; Khatri, Sunil; Yadav, Arvind; Paneer Selvam, Arunpravin; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; kernel-janitors@vger.kernel.org
>> Subject: [PATCH] drm/amdgpu/userq: remove unnecessary NULL check
>>
>> The "ticket" pointer points to in the middle of the &exec struct so it
>> can't be NULL.  Remove the check.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
>> index b0e8098a3988..7505d920fb3d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
>> @@ -631,7 +631,7 @@ amdgpu_userq_validate_bos(struct amdgpu_userq_mgr *uq_mgr)
>>                           clear = false;
>>                           unlock = true;
>>                   /* The caller is already holding the reservation lock */
>> -               } else if (ticket && dma_resv_locking_ctx(resv) == ticket) {
>> +               } else if (dma_resv_locking_ctx(resv) == ticket) {
>>
>> Its a Nack for me, There are a few situations (particularly during the
>> first launch of the desktop, and also when eviction fence and new queue
>> creation are working in parallel) where this ticket can be NULL, we
>> observed it during the stress validation and hence added this check,
>>
> It shouldn't be NULL.  It sounds like you are experiencing stack
> corruption and this is just a bandaid.
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
>     566  static int
>     567  amdgpu_userq_validate_bos(struct amdgpu_userq_mgr *uq_mgr)
>     568  {
>     569          struct amdgpu_fpriv *fpriv = uq_mgr_to_fpriv(uq_mgr);
>     570          struct amdgpu_vm *vm = &fpriv->vm;
>     571          struct amdgpu_device *adev = uq_mgr->adev;
>     572          struct amdgpu_bo_va *bo_va;
>     573          struct ww_acquire_ctx *ticket;
>     574          struct drm_exec exec;
>                  ^^^^^^^^^^^^^^^^^^^^^
> The "exec" struct is declared on the stack.
>
>     575          struct amdgpu_bo *bo;
>     576          struct dma_resv *resv;
>     577          bool clear, unlock;
>     578          int ret = 0;
>     579
>     580          drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
>     581          drm_exec_until_all_locked(&exec) {
>     582                  ret = amdgpu_vm_lock_pd(vm, &exec, 2);
>     583                  drm_exec_retry_on_contention(&exec);
>     584                  if (unlikely(ret)) {
>     585                          DRM_ERROR("Failed to lock PD\n");
>     586                          goto unlock_all;
>     587                  }
>     588
>     589                  /* Lock the done list */
>     590                  list_for_each_entry(bo_va, &vm->done, base.vm_status) {
>     591                          bo = bo_va->base.bo;
>     592                          if (!bo)
>     593                                  continue;
>     594
>     595                          ret = drm_exec_lock_obj(&exec, &bo->tbo.base);
>     596                          drm_exec_retry_on_contention(&exec);
>     597                          if (unlikely(ret))
>     598                                  goto unlock_all;
>     599                  }
>     600          }
>     601
>     602          spin_lock(&vm->status_lock);
>     603          while (!list_empty(&vm->moved)) {
>     604                  bo_va = list_first_entry(&vm->moved, struct amdgpu_bo_va,
>     605                                           base.vm_status);
>     606                  spin_unlock(&vm->status_lock);
>     607
>     608                  /* Per VM BOs never need to bo cleared in the page tables */
>     609                  ret = amdgpu_vm_bo_update(adev, bo_va, false);
>     610                  if (ret)
>     611                          goto unlock_all;
>     612                  spin_lock(&vm->status_lock);
>     613          }
>     614
>     615          ticket = &exec.ticket;
>                  ^^^^^^^^^^^^^^^^^^^^^
> ticket is only set here.  We know that &exec is non-NULL because it's
> declared on the stack.  ticket is 4 bytes into the middle of a non-NULL
> struct.  It is impossible for ticket to be NULL here.

Yep, you are right. I just did a code review, and probably we added that 
NULL check before we had the right locks in place, and there was a race 
between eviction thread and the UQ create thread, causing corruption. 
Please feel free to use Acked-by: Shashank Sharma <shashank.sharma@amd.com>

- Shashank

>
>     616          while (!list_empty(&vm->invalidated)) {
>     617                  bo_va = list_first_entry(&vm->invalidated, struct amdgpu_bo_va,
>     618                                           base.vm_status);
>     619                  resv = bo_va->base.bo->tbo.base.resv;
>     620                  spin_unlock(&vm->status_lock);
>     621
>     622                  bo = bo_va->base.bo;
>     623                  ret = amdgpu_userq_validate_vm_bo(NULL, bo);
>     624                  if (ret) {
>     625                          DRM_ERROR("Failed to validate BO\n");
>     626                          goto unlock_all;
>     627                  }
>     628
>     629                  /* Try to reserve the BO to avoid clearing its ptes */
>     630                  if (!adev->debug_vm && dma_resv_trylock(resv)) {
>     631                          clear = false;
>     632                          unlock = true;
>     633                  /* The caller is already holding the reservation lock */
>     634                  } else if (ticket && dma_resv_locking_ctx(resv) == ticket) {
>
> I've included the whole rest of the function so that we can see it is not
> set a second time.
>
> regards,
> dan carpenter
>
>     635                          clear = false;
>     636                          unlock = false;
>     637                  /* Somebody else is using the BO right now */
>     638                  } else {
>     639                          clear = true;
>     640                          unlock = false;
>     641                  }
>     642
>     643                  ret = amdgpu_vm_bo_update(adev, bo_va, clear);
>     644
>     645                  if (unlock)
>     646                          dma_resv_unlock(resv);
>     647                  if (ret)
>     648                          goto unlock_all;
>     649
>     650                  spin_lock(&vm->status_lock);
>     651          }
>     652          spin_unlock(&vm->status_lock);
>     653
>     654          ret = amdgpu_eviction_fence_replace_fence(&fpriv->evf_mgr, &exec);
>     655          if (ret)
>     656                  DRM_ERROR("Failed to replace eviction fence\n");
>     657
>     658  unlock_all:
>     659          drm_exec_fini(&exec);
>     660          return ret;
>     661  }
>
>
