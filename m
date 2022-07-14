Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1DC57544E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 19:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E945710F0C4;
	Thu, 14 Jul 2022 17:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FD310F09D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 17:58:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRSWF1IynLozCv956Quna9K0rRhJK1UsfW+sFUvuxw5uBDjOkA/miOFyrq9URZFDKmRu1onJvhXbuiWXNhwZNXWBHjoZMRuJBy4WNdeVvN721DboTB1KSxGIgtIeZvZ+EA1HZlAMtk7BGQ5HfgY5g3uHhzImQYuiW3OVyUIp2mXjKAbQl65Jvlvn9kZkOV8fmNWrQ3lwBnFlVjuZk7a0W6nmQ61ENf8UFWpOT5CZ34LIi68oKSB7rvEJQdKwA8Y3HFR6y8Et0b2HiQqt+vDTMVSDdhLCiZsWb/6KXFMi9SpKDdl3dt26CYSXWNjWjrksARsM8kGOOutvH146yn5JGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27hbovlbXZ3D46G6gBCeT1GOadxd078+PNpqgJL28sc=;
 b=REXEYem18T8Xyu0+kXNoaEUQIP4V182R6hrFZYXN1C15h7O2wKZ1RCX8IaJl5l0yJKjYhFxMPeY4iP5kLEoHqMjchGpzVN41hxKtrYF60ggKKmjiBxrT5AhadrxD30UIDuo7JDfF9QC2IDMwl2ZY6aFkvyV89uG/7/4WuacsGjVL4RLaeAHLkHEgq3bCh1Ff/g1/BILIthPLVKcmHOmiroEydqax/ppYYlMwNhQvDbERw+Ra7u2HUC6acuzzQHukSlD9YQOB0IUdSfO6Ip/8NNYND4tRVeR6HctTF7spIC9xsF0X21aaf9oQ5blKrTtVUrJMehGU+S+vyVdZdUfSYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27hbovlbXZ3D46G6gBCeT1GOadxd078+PNpqgJL28sc=;
 b=CpCCk4F1Fiiy1YrljT+RVzjWskHJhE8LP+DJ7vCjOZHjk7dlAhnLJyV30Vf0JezRzm8dpJi52o+sfPWsuyxJj9idRHfBZn+14ZWjwnx1lPV32eIgba/lgPUEMfNotU8AtPFtWDbhaRUkM88nLcI4ksYQb6Y+9CDpMCdPEVuBNd0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM5PR12MB1643.namprd12.prod.outlook.com (2603:10b6:4:11::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.25; Thu, 14 Jul 2022 17:58:06 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91%9]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 17:58:05 +0000
Message-ID: <4c7e7b6d-8dcf-41ae-c853-b95e6efd9c32@amd.com>
Date: Thu, 14 Jul 2022 13:58:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1] drm/scheduler: Don't kill jobs in interrupt context
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
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
 <4ca27cee-eda0-0a65-f972-c69cc3b3e53e@amd.com>
 <CADnq5_Mms=UbPc7D0-Z-HNUHfCHVWMO82NO+jh5Yg8DmkKwH3A@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <CADnq5_Mms=UbPc7D0-Z-HNUHfCHVWMO82NO+jh5Yg8DmkKwH3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0131.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::10) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2518c9d-36a3-42fe-ad5d-08da65c26741
X-MS-TrafficTypeDiagnostic: DM5PR12MB1643:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jnmcf/AZMp3aQ4VO50XlZjKSWNSFQ+KRFa9oS+pg0k68Cr9DgDmfruct4+EFHSXXg6CRR+zkrF4MVhhXn02KHRptcTSFpo17Ng2Ga6qQQI0mR5VMXtP1YcM2dueEkt1em8homAxt1WAmfEtHiY4vOFFo+WIaz9KPHc2vB2QUAr9pXTkA3MuSBe2946OWRlmn6UDDkOp/+IWuFZjoOyGkeaLExdR5FFNeYiZtPC8Pg409jL7VmWwqH+Wx1//ecgkcbf/tVv+gxoE25o6C8nMkiCsPmD6QE3KV76lc17ND15dy356ZCLvJv0aOWUtAhW3BHMb/G+iHRWF0jqaLUy3KHS/IbkQ/e6x2Cp92BM6KwWnBEse0QnnsagkWRPPXHnfwAuh4u4W+ZwIkgbXVAmHpODcP37zpMOFzf+ZGe3QYH4aEWCl/suvSuZeial3AD0dS8/AqA0paMkqBEnBqdtM87gpKc01pOcWvx5eeJ6Fv/ZOl7IjP9cRsUiiFEENH9iR0vdWcWr2EnOxkiyPeVlyMRyaSC4/5IpBfTP6BgEo5ka1uCy4hTaTb1h3dpgOcnnyDQjIkqm72uXjxOMz5RKbgXWWzKhDCIiZCxrO1UYjwsIKPWCu/r3pQnZqjqb3+kyNuKcRfHPXb1jPce/xUM7LnGhskNnSxL73uz3eRy9No6LTEWaRN0NxooClHJ2pFx3HOtuACqF/ZNn5zi8qFlk/+2pLwD4lJCksJLb00WrZ0BAnwuHsnGCenPYBA44KzzPebmXUzm2gQNuJRHJSTLscdYrD521oAGgdwYDK9FUnOt+Zd8TRKK2hwmW0HWwIBJQn8HclhOOoG4DRN/ePMgAB2yVxv8WUYnY1WsGsf2GGpRQTKG6jjpMQ7rmE0UaIER1Cf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(45080400002)(8676002)(6486002)(83380400001)(8936002)(36756003)(4326008)(478600001)(7416002)(54906003)(38100700002)(44832011)(31686004)(5660300002)(316002)(6506007)(53546011)(66556008)(66946007)(66476007)(6916009)(31696002)(2616005)(86362001)(6512007)(966005)(186003)(2906002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFo4VjdvbEcwY3pMRmV3N29NMWFMT1VBUzRTRy9INFI3ek1qb0VianBnQXdM?=
 =?utf-8?B?QnBRZXRTM2crK2VaU3RNWUJSZnAzVTllQ3NIZ0VGM2F3eFdGVnRHZkhHUTJX?=
 =?utf-8?B?d05zWm5qZ1JpMHFMaTdrRWRKZVZtS3ZIdVJidzRLaVVnRy9abno2RWppSVFS?=
 =?utf-8?B?NG1mbVV5dDVvQ0RBZ29oTGllNVJ6TjhLcHBuZVI3cXMzc0lSaXk4bVdjRWlx?=
 =?utf-8?B?TEJzSUsvOXk3ZVljTEJHcWhxUmlLdjdRS0o0VWFYcEs1d1FaRyt3RDJUZHRO?=
 =?utf-8?B?VXhqdWVqOVpPRk5QaHlDUXlTMHVyZ204VVVkd1V4LzhpY0lmQzZrT2t0OHNB?=
 =?utf-8?B?NzB1VDRBSzM1RnVSQnVDZUxKWE9MWE9jYndrWm1za2hzSEM4NXFlWGxCRnlt?=
 =?utf-8?B?Nk5sWVlTZnlmOElhR1AyMlZYYnBseVN4SWNxKzE2a2ZOQmc4N2pZR2hla1NX?=
 =?utf-8?B?WFdxaVVpc2FQbkhwUFlJTms3Q2tHME9acEZyZjlxWGhmSzBxVThEbytSelhI?=
 =?utf-8?B?RGhSaWhUQlpmaHkxKzhoM2hYa2E1TFl2c2dQa0U4ZlFlYkd4VFFqOWVnZGJ3?=
 =?utf-8?B?ckNSRTkxZUpOSTczK0dZOFhwNnp3WWlmSmk3WXFoR2l0K3dWUzJEdWdzYmdx?=
 =?utf-8?B?OUkzTDN0dGFJajl0RlhxZlhpQ1c2R2xiaHpBQitVbHBwck1qNVJ1SVNHeG9F?=
 =?utf-8?B?dU9odXVGbDRWYmIvODlPY0xFTlhvN01oRCtSQUtpOCt2M1FRUnJqYkNDZEtl?=
 =?utf-8?B?b1hqbWwyMkV1aFZSNzB0OVp1RGU5T3hmaHlnZS8va3NaN283VU0zRDRCSEpj?=
 =?utf-8?B?VHZLVGo0T1Zpd0FTL3krMklzbUM2UGFScmpuV2JiMXlBWDBLWmVVdXRDQmp6?=
 =?utf-8?B?bUNmeHZOWU14MGN1RW5NcVNZWUZ0eFdkeDlkR09tc0JSaXB0UnBlVUl3eWIv?=
 =?utf-8?B?MVdROVZNejVSR2xhLzU1U0R4OXAyY2FvVTJhNFVwTkFnZjFZOXhTdXl0OVhR?=
 =?utf-8?B?OHZkUUYwbnVpZUh3RlUyaHJxZU5hVndacmNpUVV1ZU51bERqaTluT1NERWxh?=
 =?utf-8?B?RG0wc3FrN2ZTUkRld0p6R1d0aC8yOFViRVdkaWU0ZXdzVTNIMGVHN2JLU1A0?=
 =?utf-8?B?ZHNBN3VNc2xFNEx6NSs5eGdZSVBhdXIwa0s5aUhDMnZyZERrQmpXbWg4M1JC?=
 =?utf-8?B?WnJYVzdHZnAreHpVa1RhU1ZrWXFBNkEyL05KVWMxSmM4Ty90TXRuVWVUSmpK?=
 =?utf-8?B?MXU3OWVMVWZ1bXBQaUNDZktzZjlaTVlISEw2aXBtbWlVS3c3VUhDTmVYNDJB?=
 =?utf-8?B?K0VGUExtVGoyMnh4OEUyVlpwOHc1MXFpTEM5VnpmNVdEMGFMK3ZOZzZER0Na?=
 =?utf-8?B?b2JMTmhwZGszK0lHMVJSMlpWTDhhaGI2bjAwaW5TcnFERmwrYUUxSkM2eWRU?=
 =?utf-8?B?bmtJNHdqOWt3M3JXMGtVR0VXOW0yS0RHb0RnRG1HOTUzaEtZRGNDcC80Qm10?=
 =?utf-8?B?SUxUK2Q5eXZGbitPbWJmQ21zdEFmMFdiWlg4UE4yL3d5enh0MnZCSUcrR1pq?=
 =?utf-8?B?dkJFVnluT1BGdTc0WFp2bGFPaW93UEp5MENUUWlkTTNVeEdJS3BqZFA1bkxK?=
 =?utf-8?B?R0I4U3FXVnNlMW00V3B3YW1NdHlNbVRoVFlTVzNwMXdnSmkxNFJWaEdTVmxv?=
 =?utf-8?B?TWJzSitsamQ5YnpiTzc5dkFIem5wNzZ5YTd6R3gzbUU5bi9jdXZERE12UGEy?=
 =?utf-8?B?TzZ5L21QQklKM3RLZVd4OEJuUHczMTN5aFdDZzR0TytReEQrdHJpQUtjSldM?=
 =?utf-8?B?MllYL0lHbjVHOXZJWXRVZEYyN0I5RDRmVm5INkVlVjhMUjhxN0lySDAxMTR1?=
 =?utf-8?B?QWdzUlJSY24yU3hjbjNCYStJSUxwcVgyVFRkQlRuSForZUhnYzJTcGI3Q01s?=
 =?utf-8?B?L01FQ1dMZjNyVGtkKzZVQTlZMy9HZmoxRW5lcHBrZ09wWEZDdmdIa3RtY0Yr?=
 =?utf-8?B?UEh1cFB1WEhZQ3lSVnJlMnZTVndKUFRYVXNma3BFZ09neXhZOFViYUUyc20z?=
 =?utf-8?B?VklKcTV2ZllNRXZCdzhMWnBabGtibW9HSVA4MVRqczZ6QXJqVjdFb1VGWU5y?=
 =?utf-8?B?SGpGeTJ1U3lTNWhrUllQd1FDYytLYXZOYjlJNE9uS20ya2ZKcUpiU1hObFRu?=
 =?utf-8?Q?KlQOWrcliQZnCP0RGE8wulNPRYXk0ATgQnI3D1dLOHmq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2518c9d-36a3-42fe-ad5d-08da65c26741
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 17:58:05.8327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: piE0ADBdvd3hLOvuce7nJGdSUV5pl+7cJDdFtMHx6Jx4TYW7hxr5HgSctna/0BSD5mdaR6TTSdAKV7Sx+ZIW/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1643
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
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko <digetx@gmail.com>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-07-14 12:22, Alex Deucher wrote:

> On Thu, Jul 14, 2022 at 10:14 AM Andrey Grodzovsky
> <andrey.grodzovsky@amd.com> wrote:
>>
>> On 2022-07-14 05:57, Dmitry Osipenko wrote:
>>> On 7/12/22 11:56, Dmitry Osipenko wrote:
>>>> On 7/6/22 18:46, Alex Deucher wrote:
>>>>> On Wed, Jul 6, 2022 at 9:49 AM Andrey Grodzovsky
>>>>> <andrey.grodzovsky@amd.com> wrote:
>>>>>> On 2022-07-06 03:07, Dmitry Osipenko wrote:
>>>>>>
>>>>>>> Hello Andrey,
>>>>>>>
>>>>>>> On 5/17/22 17:48, Dmitry Osipenko wrote:
>>>>>>>> On 5/17/22 17:13, Andrey Grodzovsky wrote:
>>>>>>>>> Done.
>>>>>>>>>
>>>>>>>>> Andrey
>>>>>>>> Awesome, thank you!
>>>>>>>>
>>>>>>> Given that this drm-scheduler issue needs to be fixed in the 5.19-RC and
>>>>>>> earlier, shouldn't it be in the drm-fixes and not in drm-next?
>>>>>> I pushed it into drm-misc from where it got into drm-next. I don't have
>>>>>> permission for drm-fixes.
>>>>> The -fixes branch of drm-misc.
>>>> Now I don't see the scheduler bugfix neither in the -fixes branch nor in
>>>> the -next and today Dave sent out 5.19-rc7 pull request without the
>>>> scheduler fix. Could anyone please check what is going on with the DRM
>>>> patches? Thanks!
>>>>
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Ffreedesktop%2Fdrm-misc%2Fcommits%2Fdrm-misc-fixes&amp;data=05%7C01%7Candrey.grodzovsky%40amd.com%7Cd62c2e6d3ec748cd639608da65b52548%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637934125954377887%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=WPmMC%2B%2Fy83cUctuF%2FLNo9VhWnB%2FkpUVQotMh74VshB8%3D&amp;reserved=0
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Flog%2F%3Fh%3Ddrm-misc-fixes&amp;data=05%7C01%7Candrey.grodzovsky%40amd.com%7Cd62c2e6d3ec748cd639608da65b52548%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637934125954377887%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=RzCMLUYLmUjSmvDm4E%2FJr%2B5rp7E8UvjFt1tmwBoBiVc%3D&amp;reserved=0
>>> The patch is in the drm-misc-next-fixes, so it wasn't moved to the
>>> drm-misc-fixes.
>>>
>>> Andrey, don't you have access to drm-misc-fixes? Or you meant
>>> drm-fixes=drm-misc-fixes?
>>
>> I have only accesses to drm-misc-next to which I pushed this patch.
> anyone with drm-misc rights can commit to any of the branches in the
> drm-misc tree.  You just need to check out and push the appropriate
> branch.  then push the changes.  E.g.,
> dim push-branch drm-misc-next
> vs
> dim push-branch drm-misc-next-fixes
> etc.
>
> Alex


I see, but what  is the reason then that Dave sent out 5.19-rc7 pull 
request without the
scheduler fix if the patch was merged into drm-misc-next long ago ? All 
the changes from
there are usually picked up for pull requests, no ?

Andrey


>
>
>> Andrey
>>
>>
