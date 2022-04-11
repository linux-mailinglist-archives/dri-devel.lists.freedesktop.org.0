Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC09D4FBB1F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 13:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7A510E376;
	Mon, 11 Apr 2022 11:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567BE10E352;
 Mon, 11 Apr 2022 11:39:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfalJG0WMTKsfGyXhg6uplgr5n5j5v7HrSJixNsMx4Yg3AmBTna9h67pQJO/eXkP71wrhMaGvSa4Q5thgBovtK8xLhxn4HpbrPXT7gn8twuxkU4SseJJMRt/NcGkRvDAqU+ixUU4b0S5ZS3z8iACwy75zmD07oMHL96j9u/Q5fRn77khFNj2uW8PhQzk9dszZ7ugYsA35CCzzCHQKj3QjJrjIJ6MyecnL8GPU03zbiG8RQDWu7RgHPMtv9EZZIanOdX1CdtcEdP1tapTSYL9mvOLBLYdFefPTFmYVd8yvVw76xFf2cKfdWIqWvTDLOiZAOi2m3bBdZOQI+dkezJh/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tp73sOTOUFztA4heLMym96GYu+3DLmyT78gAw49ACPw=;
 b=RSeWnysbeyBtVz8MPPwtjZZ6NyTejxRGzojlamjqLprtqUmMo+7Wcaef+KJURst0ERAIJCnGj9wNuEOJwDYSUoGZlCN2MAkoz6phkoqirH2/z7OXN8q3AATVKJF3FOHk/xJ9E8BRbTiowxwpUNcBRwTiaSof2gX60qB8iH3fXUZbb+hF3X6atBNo37RxUe1mVrpkXvWRzKC1dn+OpndDsGUhFG1bMRkRfdKPmX333lA3l5UuxrHVqXwIY2eXYlTTYooC+KQpNqYWTs01/4Evxhgeve3gO5icAOAObiUyBxVhwQeeOTyVnu78iQXlpvQyVqnPpRWjNsNjk8HYqSqmWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tp73sOTOUFztA4heLMym96GYu+3DLmyT78gAw49ACPw=;
 b=bLs3bh36bKr455SM5JEeXkKthEmAkk5fFPPOxJiYVl440UqlBcVDat+re2LQ0Rbtniu6qDtmqv52gAaMQPoEls8NIIu5Wp20Ag/fa4L+RdX2kjH37tC4W9ECdMRAh6jwuD1FTIAdmOAKFwfAgenjFNHarOeQFoemHDagn7b82Mk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4526.namprd12.prod.outlook.com (2603:10b6:806:98::23)
 by DM6PR12MB3564.namprd12.prod.outlook.com (2603:10b6:5:11d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 11:39:02 +0000
Received: from SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::7ceb:a37c:cd60:9d5f]) by SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::7ceb:a37c:cd60:9d5f%7]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 11:39:02 +0000
Message-ID: <192375d0-85ac-ced0-43d6-e5ea4e3c0fae@amd.com>
Date: Mon, 11 Apr 2022 06:38:57 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCHv2] drm/amdgpu: disable ASPM on Intel AlderLake based
 systems
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <20220408190502.4103670-1-richard.gong@amd.com>
 <44354d78-b340-fbc4-fd6c-060d7ad3404e@molgen.mpg.de>
 <45ea5705-71d6-4008-f094-1aa902e5cc41@amd.com>
 <0d0a3f0f-f021-ccc2-a80a-f789cb53a47b@molgen.mpg.de>
From: "Gong, Richard" <richard.gong@amd.com>
In-Reply-To: <0d0a3f0f-f021-ccc2-a80a-f789cb53a47b@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR04CA0093.namprd04.prod.outlook.com
 (2603:10b6:610:75::8) To SA0PR12MB4526.namprd12.prod.outlook.com
 (2603:10b6:806:98::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67ffcb58-2705-49d7-f5b5-08da1bafe00a
X-MS-TrafficTypeDiagnostic: DM6PR12MB3564:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3564446AEB399A99CF12402D95EA9@DM6PR12MB3564.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 23E3FvOahz0r1MqH22MoHdIZKVifOwbRjaXTOw07j6GRGGg9b/Y290OscxiycIoEQSUkjUFTPAnDgO5HbLLVyDQ8VermY4r9mjV8JbWrkcerWLB856YW8Sa5/tHBtpbf7KKorO/6+K8Hcf9SwhWVpPoku5lzSYKLKQXNoCnvzFZQWZ/fi2BwRRMY1gyjVWKpeb/L9E5nimz9Q72jSqB7ZKHpjRej4SiJ1FrIZFUFjgSeaacjYKMaHjb09BgNeGwfoNcLaQbg9DfV3IOyUtUXmdZuTSsSmsjpWHgXicvg0lqoOvhNO0mxhrcqGi4NUP+Z+b8rVjbzB1aDe/y3kDtOGBiEqhw8moI9fdw/b/NZZX1N+Z6dRE3qKQRcTEFFxW7FwZjEByrKZe15W1pqokswabnpDSjOvWhgQcANYFC57XBzVIxNbkJbuGfaHd8Zh2u2QEtB1lHEOAmMFUp+Zg6fXQg5HRg2djHIjsBJU0VwBuFXe3Ff0IuY/6I144VA4nP1h0N0gtUBb/Me6zwX4rhTiPa8Be5wf52azm0ZONKebu6VpxzdpwYMX2icbx2Th3SNeMc0KLjHV6j4EBDIDXi5GDENtGY9Ic5XcDVDHC5EZ09+q1mx20z7ZZw5CYP0E2xFfL5zEmzdALpBeL2lZwbOGSyWafkBufVP0o2kubZ6j3ucAizXV5mN0sdhy3d5PadWHP4uSLQu64T7AymNTj92JFxVwHWRw3nGR4j41G/HzvBqFhqYdrxlL+gV5ihmLte+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(86362001)(36756003)(8676002)(38100700002)(316002)(66556008)(66946007)(66476007)(6486002)(966005)(4326008)(6916009)(8936002)(5660300002)(2906002)(26005)(186003)(83380400001)(508600001)(6666004)(2616005)(31686004)(53546011)(6512007)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlNoU3A1VGRWc3NzeDBkOGdDenJmaUNOZUZ4YWR6L3ZuQnB6a3dIbE1RdEJn?=
 =?utf-8?B?OE5qM0pNeFZiQXdHenBRRjFmSHlVU0tSVi9yTUdCeThmTFRyZTF1KzdsM2pG?=
 =?utf-8?B?cjI4RVZuMDFQeEM5MUJ2bUQ1T0xjczB0OUdXVUs3eUoxelIrbGxxeFd6c1o4?=
 =?utf-8?B?a0haUWw2ZlIxTnhPVmNRWFlCMHVNYkZvR01mUE9RTDhUSklrQ2d5czkvOFRr?=
 =?utf-8?B?T09aSGhCaEZ4OU5BVFo2T3ZrUUtlVEZWNE8rMTBrUno2Nlh6cTYzQlBFU0Ey?=
 =?utf-8?B?bmF2dXB5OUV6ZnlKOW9JcVpoUHBUYnhTbGJ3TUhFWVU5c05yYTVkUVF6OCtW?=
 =?utf-8?B?Kzd3UjJxbXArV0lacWtCVlkySkhldXdNNStaV1VnS3E5M2JjdmhKNjVJVWx0?=
 =?utf-8?B?V0FVRE9JU1FEZWVMTTJCdlU5WHJuR3dONEdyR25OUFE0V2FVNDdpOFBIcm82?=
 =?utf-8?B?T1BRTm00VnV5eU9LdmIvMG9PRjRrVU9ZcEZRNStnQWtOVUFJL3RZbmNjRjJU?=
 =?utf-8?B?NnlTUkhQWTJOUHlrSFFUT21tR0xIMjVWZjVJZER3RlFBeXppSVJoMnI3NHc0?=
 =?utf-8?B?V01PMHNmVVNZNXE4WGQ1TS9VM29HNmVubG9zZ0tiWE1LOFNDaVp5ZmF2L3kz?=
 =?utf-8?B?SVVYY2duOUk3NGJCSnRBZWcwTjc1aXY4c0dqMStUbjFxQzlFd1o0WW9UaWFp?=
 =?utf-8?B?VWlhUE01NzZBejg0cHlhSnQ3eEJLVWVjWDIxcXR4V3JFVzViRnVSQ1g5UXFC?=
 =?utf-8?B?WnBuN0tEKzNRSDVHeDJzTERGS0VnMFlSOEM4YXpFNy82QlVOOHgweTNMZ0Nj?=
 =?utf-8?B?c1ZtSjRXdVVXUjBlU1FlNUp0ZjZMTmY5MW91eXhUenFRVlRWUlIyRlVkVkhM?=
 =?utf-8?B?OXhzMFpUZE12Rlh1QUpBOHFRMjVLbmFoNVJaN0tORGhXYThUZ0NlbysyZmlr?=
 =?utf-8?B?QnNVTzBzZ0tTaFExaVptUWNSVlBnZmRQRGk0cnlDbm5vRXhYT2wvMTQrNGYy?=
 =?utf-8?B?WWtCMm9oNzV3d0NyZDJQSENNTGtWN0tNL2Zqa2NxcEFsYXFDZVFobVBZTWhG?=
 =?utf-8?B?Yk12SVYyd3MzMGd0NzJyaGhCQnRPN3VGckJ6SHk5TWN4MkpnaUEzbjY5TDhC?=
 =?utf-8?B?SHVTVVlJb1JRUURkUWc4cEhTaG1zWTg3RitjRkVSQ3NrS05KMkZKM3NpMmpW?=
 =?utf-8?B?d3h0SEFYalR0NVltOGJGUU9TdllsMkVmcWtWYTltazY2Z3dmaWZJN1Z1ejZm?=
 =?utf-8?B?RlJTMFNaekduMVczKzFBN1pIQVRqdGY5M250V2Z3K202Q2IrZ0Z0MHdWTXJw?=
 =?utf-8?B?VjF5Z1Y5YW1sU2oyRE0rdUtHV3NSOXVTT0Jrbmx4ekE2MDdIR0ZmdGdpajg5?=
 =?utf-8?B?VTU2aXJiMmlJak5ZeVRVazBOUTlMd0VmMWFvYzlqdE03eU1YanlBT1Rocm5N?=
 =?utf-8?B?NTRtTmlkOEQwMjRzNEFuZnZZYm1XWDRKVzcwUHRmYVNPd2xDMXdvQVR3REp5?=
 =?utf-8?B?TTl6TXhJSndLMjNTS2FCMWpTcnRLMXREWG9kc3V4NUFhdHdVMFEwb1ArK1dY?=
 =?utf-8?B?QmpWSXlqaklUNmpFS0VUTjhWQzRSTDNibUFCV0JlbGNTWnBZQzZFdVlWSS9S?=
 =?utf-8?B?dVAxeEpUaXFDSWlIWWJPZHcyaU4yWFF0SWpUdXNyNE41WkJ6M1llN2U0Y0sr?=
 =?utf-8?B?dFMxQ1JXZGhyUlZOWC9KdmVUTCtLRDRjY0JqTEI5U2xFNmx2T0xTMGRoTGVv?=
 =?utf-8?B?ekVsMzduR3B2VWNDdHFSRi8rdmw3SGV0djIxT3NTWHJxdHdMTFplQTg3d1Fv?=
 =?utf-8?B?elJkbkhnQVRpWnJOR1RVTTBSRnFualVhNENCNnFzUnp1Z3hQUkRXMzFVQnhq?=
 =?utf-8?B?SVRheW9oalVmU2tsL3pJaDVyOUF6bnppMmN4ejJNZytHcUpKRnFhcDRsSWgv?=
 =?utf-8?B?M3U1bDVpMjhQOENibVA4dlIzdmJndTc5YWc0bzhJRFpHanU3ZjdxSy9TY3Zm?=
 =?utf-8?B?bndHOWREZ2xYL0VRUEZsV250QnFEbldIcmJGZjJrcmJzcS81WURPOUdMcXdV?=
 =?utf-8?B?VVFDSkQyR2pmSHhudDR1Q0VoNW03RFVQZ3RtSnVwSElua2ZjbktJNmhDVGxD?=
 =?utf-8?B?bU96d3pCTTI5V3lSaGJ2K1hoU1VEaTJ6bGZzb0lpMlpWQUhVeHdUUjdOcFlU?=
 =?utf-8?B?b1BUVkxPS2pkRGYva2EzejNlT09IWEp0Snk5bityWEFIZmduQ1Uwa2NKenJZ?=
 =?utf-8?B?R2w5V1lHRGxwcDR6N0pVM0x2SkptUzhIN1BKdys5ZzZOb200YVl1eElkbWFQ?=
 =?utf-8?B?ZkpDeHFya2x1SG1wMDA3ZkNWWEJLRDlnUDdBNXlLZU5tQ3ZtVGFCdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67ffcb58-2705-49d7-f5b5-08da1bafe00a
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 11:39:02.0123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6SEFeWnoayCTkcvbruQRq1uXBwoOqcedRrqrNMhNXtjaorNOHDiwiYUn6CIbwh8+JQIB9TL3F03S91VDCPA5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3564
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
Cc: airlied@linux.ie, xinhui.pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, Dell.Client.Kernel@dell.com,
 christian.koenig@amd.com, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

On 4/11/2022 2:41 AM, Paul Menzel wrote:
> [Cc: +<Dell.Client.Kernel@dell.com>]
>
> Dear Richard,
>
>
> Am 11.04.22 um 02:27 schrieb Gong, Richard:
>
>> On 4/8/2022 7:19 PM, Paul Menzel wrote:
>
>>> Am 08.04.22 um 21:05 schrieb Richard Gong:
>>>> Active State Power Management (ASPM) feature is enabled since 
>>>> kernel 5.14.
>>>> There are some AMD GFX cards (such as WX3200 and RX640) that cannot be
>>>> used with Intel AlderLake based systems to enable ASPM. Using these 
>>>> GFX
>>>
>>> Alder Lake
>> will correct in the next version.
>>>
>>>> cards as video/display output, Intel Alder Lake based systems will 
>>>> hang
>>>> during suspend/resume.
>>>
>>> Please reflow for 75 characters per line.
>>>
>>> Also please mention the exact system you had problems with (also 
>>> firmware versions).
>>>
>>>>
>>>> Add extra check to disable ASPM on Intel AlderLake based systems.
>>>
>>> Is that a problem with Intel Alder Lake or the Dell system? 
>>> Shouldn’t ASPM just be disabled for the problematic cards for the 
>>> Dell system. You write newer cards worked fine.
>>
>> There is a problem with Dell system (Dell Precision DT workstation), 
>> which is based on Intel Alder Lake.
>>
>> ASPM works just fine on these GPU's. It's more of an issue with 
>> whether the underlying platform supports ASPM or not.
>
> At least you didn’t document what the real issue is,

You can refer to bug tag from the comment messages.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885

Regards,

Richard

> that ASPM does not work. With current information (some GPU graphics 
> card with the the Dell system and others don’t), it could be the GPU, 
> the Dell system (firmware, …), a problem with Alder Lake SOC, or 
> another bug. I hope you are in contact with Dell to analyze it, so 
> ASPM can be enabled again.
>
> […]
>
>
> Kind regards,
>
> Paul
