Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A501575085
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 16:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52BF710ED76;
	Thu, 14 Jul 2022 14:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1AE10E70B
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 14:14:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NCBEPmIxpFcYlTEatnkz6pSYU+1ILT6qPJ9rj/28XdF/P4s9vAC0MJMQ9THhSXV5ESA69AmnaTBdbp7I0MCgMFZ4XydzKjSsPTnF7m9icWc579l7n7cscD5jrTdpCZnlIs3LbRPy07SU/Q47dD4kxd/3WKwuUw5/iIWa6IUMIOTBM/xlhx8HFiMsDuLe3/ClM+IEuZO3llW0zNelyvPmG7k83FY+s1+t2LsZXQtkZui+6V7jycIJ0dpQWCpAWhml4cW9UNNDBHmvjPznzPY2bj3NIfx0LXQia4/PRdglV/FKAMDZ15Ym5RxobFs8cXOhewAtI5iOzPXmhM9wh6ecKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MoOudQYzJXf1vdW/46SZpu+D8MPwvnskPIpcUsem56Q=;
 b=C75b6P/OPfj1X43TIdGuoC7oNz58HuH5PdXgYQEyscrlWssag7OW33hu15PmIIRGGxZOedOnHV2JoQpGclzddPdyET4U5WXgom4MbfCfvPpiqx28MGRKHIvQW3ShQsq3midGIgjdfi7HQDcgwmxO+fKUo6wYncRQBweIcoVUmcQpkNI6RRUPFfBy+NZbIVh96oBARnho/hOzrlJFk+qU4xOxskPV5fTd1WnPe3uXZjy6h6yOn1awfinBWtykoF+LIcdJa1P2IciJFZZPn4grhRNrXCT/G9d4yzFomRIoruU8yqQy4Z4cb9M0cwQNP5BMZH05Hw/bHicNx39gLOKWXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MoOudQYzJXf1vdW/46SZpu+D8MPwvnskPIpcUsem56Q=;
 b=KA/g4UjMwrsdACket2NxCiaxqDFhDI573K+PGbSOCtlMtZmuzp54MoOPQ9STwpA4IIKgMlv3KaVU1kOc7iAsOhGAGVq+TdcCBlBOUXdT6M/z4QQ+ZhUfhA9j6q+3om8vWyNPXWItj9eVJ9i2OICZSZZqmmgxX894PHwu7Yew7Y8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by BN6PR12MB1924.namprd12.prod.outlook.com (2603:10b6:404:108::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 14 Jul
 2022 14:14:02 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91%9]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 14:14:02 +0000
Message-ID: <4ca27cee-eda0-0a65-f972-c69cc3b3e53e@amd.com>
Date: Thu, 14 Jul 2022 10:14:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1] drm/scheduler: Don't kill jobs in interrupt context
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Alex Deucher <alexdeucher@gmail.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20220411221536.283312-1-dmitry.osipenko@collabora.com>
 <a78343c8-2a6d-b223-4219-6b6b0a4fcb1f@arm.com>
 <CAK4VdL2hCEoshWZbCh5mkHuS6wYMiPFR3v4MWTnrEKM9zyv6Mw@mail.gmail.com>
 <ef88ec2c-77b5-fa0d-49d1-fdd2451713b7@collabora.com>
 <573fae0d-c9ab-98b0-c6f1-5b0d4e52dd01@amd.com>
 <a33ab7b9-738f-db91-f6ba-78a9641365e8@amd.com>
 <b05f9861-1966-72f5-132b-aebb4b6e0c6b@collabora.com>
 <107fe968-8311-0511-cc31-22feb994a6d7@collabora.com>
 <3e07a8d0-2cbc-8f3e-8f9f-5b73fb82028b@amd.com>
 <CADnq5_MMmeWkiMxjYfrG7pip8BEkbkRc8ADUDLEi++kRF76sqg@mail.gmail.com>
 <bff42c98-045d-2e5a-2cf9-eb563425375e@collabora.com>
 <6e0c7590-6ffb-162b-a98d-0a39333453f6@collabora.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <6e0c7590-6ffb-162b-a98d-0a39333453f6@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::12) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c797226-36ad-4af6-1416-08da65a31a53
X-MS-TrafficTypeDiagnostic: BN6PR12MB1924:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3H+uUk9Px/b5lUANfrT+O5nX+gNNG+Cw1Fvci1iVVRSJws910yYCH7itBYHjX4sIdfW1DAz66Yj5Twg7vVXC1BwQOUmBbVEZJNCOvZX+bCfUMIZh61nlourugY//E4QAVIeqYROSDhDY/Lo7hPl11wfIVSSQPWbYzknJhp0ee/U2/hm1a8H5es0yLFHmSwDKM2UPdeceORoJZw77FvmD2ZwTefKE01c6dHqzJg7/vdcZyouGiaezF7Mcs8a4dOGd/8qt+gmgat55va9MvaAz/04dtPZMZL7M6vutdiX9M6GAvflH2Fy/wHg6IO58dAqbky6k7aHXD0gNSUSGbzFvuCPlS847ykYQgtGk79TE0e31e4RQ0AhRo+YRc2d/Llrn/ULY0C13Aj4G1s706/eA0ne2pNfR+J6kokRGee2KBouIPLhoMzSHDEtp4M+sdOOL8+XNUr9UGyZA8jR/ze+6ZpF1fHOX0Cj0IEk7uknoD7bVoDtMTwjuIDpjr/PP5GZCddVP4pAigTWeyswFOq8suIjro2EcxpmJA1Ir5yNR7ivewMWEqMOLcfk4QBjkJHuL+P4edXDyVPW1DkSditSY3CGjoG894mXFMCZflNp44J2/s9twtQkBl+yUTham0wvhTiihgxpzDu1G/C9opMs7ycO7nQqbCvV2pT0EckpiHoLGpWdUHa4wo0ELNJPokZ22XRj/z9Ac0GP+FeJNqxsWRHITqcnhYWNHIIFEXRQlAC3Bdy076alTyTouOYa0rQMtBsfTJW1IklfW4K+cSMaZYygUb0qw2MfTaRqbPCbtcMWefW9dqCBI6Pk5T7woi+6/AA+/+hmllPtU2Ym4gYtZk1QNusVd9aZ0sD6Q5LWOamC5Qbt4pUzHdxuFxvuxNyDM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(366004)(39860400002)(346002)(396003)(6506007)(66476007)(83380400001)(186003)(31696002)(36756003)(31686004)(45080400002)(966005)(66556008)(316002)(4326008)(54906003)(66946007)(8676002)(38100700002)(86362001)(6486002)(2616005)(8936002)(5660300002)(53546011)(478600001)(7416002)(6512007)(44832011)(2906002)(110136005)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mk1nYTdIdjBYNUxYOEJkdEYyUHJBVEh5NktXb3BIemUwZXMwQUR2TU5sQXFG?=
 =?utf-8?B?WmpWVzZjbFVKTk8rSzBBeVFETmx5Znl4TU1xcTd5OE1EeEpsZEFjU1lwVkQ1?=
 =?utf-8?B?bXZScDhDTUROSEVhdVZrYTdjR1Y5TDh4d2V3N2x1cWg0aWpIaDFBUDJzSmx6?=
 =?utf-8?B?T1dYdHhsZHRlMktWQWFIL2NhbS9vRTRyNlZ2SXNyWkE0cDZFR296ODNsM3U3?=
 =?utf-8?B?T0VNL3ZGZGkvN1M4ZWVsaVk5S2lBVHMzUm1CWE9Rb1g1ejUyMEtsTTg3OFdk?=
 =?utf-8?B?UmRRWmU1WDdhME5RaUgzOHpYVG5XMnQvYmxpWlNwc1Y4TnUzUVlCR3hrZC9N?=
 =?utf-8?B?eENPamxpa1BZVWd1amRJbWZRVGRRWWQ2cDlSbmhSZUE1SUdUaWtZendIRFdF?=
 =?utf-8?B?L2Y2bm1JTTU5SEpYWW1LUzBXUDUrRUo1V0dhUjJ4Z0tqMzI4Si8vdzBXQ3BU?=
 =?utf-8?B?RFJuQi9jS0s4TkhML0V4U1BXQWQ2TXFVMDlJOGs2S05tSjVqVEl2UU5aQUdC?=
 =?utf-8?B?cVd5WkxGb0FDQmQ2R0dNMU5FQnV5YklWcUdiUE9xR1FabnI4S3ozS1Q5NHRB?=
 =?utf-8?B?UjVLcEhxaFVacnlwVnRsRGNVQUJkUm9jUXAyekZRaVZXKzRaUkd0K2IvYUcz?=
 =?utf-8?B?ejhNd3BpZkhKL3k4NEhaZmpES0VPVHBnR2prd3diaDZaRDM0eE11ZTVFNDdP?=
 =?utf-8?B?UXZEdTRWOVlpazFWMDJac0JtYTROY2lTL2h5Z3p3cmhxakRSQjBvUFRhVmhF?=
 =?utf-8?B?NlE3Z2FkSzVLUFRkdnVaRTV4ckphdFh3M0FacWNVKzAxNDB5enA4RmlhZzly?=
 =?utf-8?B?YklxaEZ6U0pJU1IxUHVQT3RWU2NvaGhCNy9tdlJGTUtyVzg2aFA2QUtVQ0Fn?=
 =?utf-8?B?NXBEU3pDUStjYUEzd1k2T1Nib3l2TmpHZGdLTnFCUTcralNwWnRjU1dEOVVr?=
 =?utf-8?B?QjF5Z0Q5dGJGek9OV2JxaUNuSHd0SmNwSElVV3Z5UUpHQ0JNeC9tSXBKUFRZ?=
 =?utf-8?B?enZEdUtjU2lCdW5ZT2Y1c0Vla1dGT2FlaFJBTjQ4VTF6ZDNZeW5Wb0ZzTDN0?=
 =?utf-8?B?bU5uN3pQRmt4RTJ1YXdVMXZSSHZnZFAxejc5NXJodkJjaVJqamZMeG5uYkdl?=
 =?utf-8?B?NEovYkw3QjYzVVE5MFA2UDE0YUtIQ0dubVIvVUJFTHNmM3hoS1pmVU4ySzN0?=
 =?utf-8?B?Z2J1T3ZhT1o1SG1SYmp2clpqMk9aSmx6SGRWaW8vVSsycTNmejhJeTQrOVpD?=
 =?utf-8?B?a0pZYkJ0YWlSN0tBNmdSdVRKMTh2cnZZUHl1NWZZTVcwYldnckxLelFCczhU?=
 =?utf-8?B?S2N1d3d6RU53aXl6RXQ1WXNEUVR1aSs3WmducDNnMS9GMDliWE5iSm5WeDZ3?=
 =?utf-8?B?WXFZTUZxSWJzVXVuS0ZIam5QNmtVVkJLMGs0TkUyclhGUzFOVHpWSklxWWhi?=
 =?utf-8?B?ZGJMRkxWQU5sSmNqTWVUY2ROeUpRcEtIUEcydWt6R1FnTVo3Y1Jqem5ldWZF?=
 =?utf-8?B?eFphZ3pvaUFrZ3czaTBvN2JpOU5Ea0EwQkJMYUNzWXMwUEtTNVJGQlJzY0Q4?=
 =?utf-8?B?WHVWRUR0UjFyUUhkM0tWbVlkeTFQZjk2QzNreGF6T3N1ZVJEN1YxZWROZTdr?=
 =?utf-8?B?Y1A4RHlsY2JlODZ4VmEwdmlqMjlHR3V2KzhQS013bHh2bUNUUncvL3d5V09L?=
 =?utf-8?B?alpGUmdBOUI1QWMxTjdRd3VaNW5uSnFUM0hIclV1c0o4eDRvQXpCRlpwb3h5?=
 =?utf-8?B?enJwWlFOVUJUczk5UmZubkNqckt2S0M2blVvNVFMdnBYLzJBam5VZDJtRzdT?=
 =?utf-8?B?b2dUelRRODBJRUYzbk5FQ3hKdktra05ISUY2VHRKZVZxaHBKOXRWZWIrOS9L?=
 =?utf-8?B?YmtudFk1eVpPLzBsZ0llWGgzcmMwa1hBU1cyT1FveDd3N2Zzd3B1T1JqZ0NN?=
 =?utf-8?B?Y29RNU5pc1NDYjRwMVdtRGFRV1NobStGTHN4ZTUycXN3dDR5SU92ZXpTRmR0?=
 =?utf-8?B?VzBtc1FCcTZLUmtzTmthbnlpVDEzWjBoNUU0ZERISG5iM2plWGJoWWd1M1k5?=
 =?utf-8?B?WmRTTkw0MFdxQ2tPOFVDYkdoTGNvQWxsRVdtQ0dyc2poejZxeGFYaXpjODJH?=
 =?utf-8?B?SkVwQ0tIL3BpTTlNWHJtenIyVkt2MThUZi9EMUJSNXdaV2xkeTVRSmdxTjJK?=
 =?utf-8?Q?RX3csy/l1Ai0Zw6esv+b95p0pdMbK0dB5epPLFj5VYqO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c797226-36ad-4af6-1416-08da65a31a53
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 14:14:02.4573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E0wKIdW1IBWQHzhpiABFhhMoFh+3RJgxq/8wXvLwxeN5X8yDKr9XMJX91auKgyoINKTutKlCa9sKxdngayEnhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1924
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-07-14 05:57, Dmitry Osipenko wrote:
> On 7/12/22 11:56, Dmitry Osipenko wrote:
>> On 7/6/22 18:46, Alex Deucher wrote:
>>> On Wed, Jul 6, 2022 at 9:49 AM Andrey Grodzovsky
>>> <andrey.grodzovsky@amd.com> wrote:
>>>> On 2022-07-06 03:07, Dmitry Osipenko wrote:
>>>>
>>>>> Hello Andrey,
>>>>>
>>>>> On 5/17/22 17:48, Dmitry Osipenko wrote:
>>>>>> On 5/17/22 17:13, Andrey Grodzovsky wrote:
>>>>>>> Done.
>>>>>>>
>>>>>>> Andrey
>>>>>> Awesome, thank you!
>>>>>>
>>>>> Given that this drm-scheduler issue needs to be fixed in the 5.19-RC and
>>>>> earlier, shouldn't it be in the drm-fixes and not in drm-next?
>>>>
>>>> I pushed it into drm-misc from where it got into drm-next. I don't have
>>>> permission for drm-fixes.
>>> The -fixes branch of drm-misc.
>> Now I don't see the scheduler bugfix neither in the -fixes branch nor in
>> the -next and today Dave sent out 5.19-rc7 pull request without the
>> scheduler fix. Could anyone please check what is going on with the DRM
>> patches? Thanks!
>>
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Ffreedesktop%2Fdrm-misc%2Fcommits%2Fdrm-misc-fixes&amp;data=05%7C01%7Candrey.grodzovsky%40amd.com%7C68b627b8482a4fd28a5608da657f4375%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637933894551324163%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=CDdLG%2F7SqCudEnjhBSsXqq15mfhlHlS3xAdAfB%2Bh%2F1s%3D&amp;reserved=0
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Flog%2F%3Fh%3Ddrm-misc-fixes&amp;data=05%7C01%7Candrey.grodzovsky%40amd.com%7C68b627b8482a4fd28a5608da657f4375%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637933894551324163%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=4Vz40j6F%2FzHYckXEyPEunj9DRSoTXikhNxZDXeocTss%3D&amp;reserved=0
> The patch is in the drm-misc-next-fixes, so it wasn't moved to the
> drm-misc-fixes.
>
> Andrey, don't you have access to drm-misc-fixes? Or you meant
> drm-fixes=drm-misc-fixes?


I have only accesses to drm-misc-next to which I pushed this patch.

Andrey


>
