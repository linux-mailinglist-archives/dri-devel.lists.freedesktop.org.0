Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E03D966D44E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 03:33:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED66410E179;
	Tue, 17 Jan 2023 02:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E3210E0D8;
 Tue, 17 Jan 2023 02:33:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWzvqIc02f+Vl4xWAclM/i9KkuhElQ6gVQOjA5caesnj/9m47kCDzUOK1vwHT1LANAmzvxtQqGaAb6q6Q6hz1jW8IQFy/myFWDECqO2BmVoTv8dJv8v+zJawKyZOiIYJJMmUDwz0wj/zRMEmRsIFAAPhmsT7F2BLPbsmiP4j+u1i7gkzBCeIumKsd0jeoCUCl48MfwsbHP4EE0XQisDHXqzbYhz5KjjOd2JCs3Cele+KsywNnhZzT7wD9w228LxPZdIy42U8RYhmzVaHjGy1As9D7Bk198r51QpzqcBnuqFoR4NQaQKKsu1EGwvsljNmnDrs4dvDYn3p9yhmDx3u8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bk/X0IKj0j/JGwQO+eyT8efJARYrRQReUNk7q7KoUBk=;
 b=KG/aVHDnsRLqdSM51Ca8nKBDB1qJrUYTRUB7ipinVg5fhaNhb0LZdmITJv0qM0FQ5502/fwpMH8u/QmuFicZDg/d1GQVUdsbJ1qB8r6qcKddzyWcBJl1cZn2ISJjOWe4SU/0zXwQ4H+WEDqavm5YSmCRFSShNR8pDBkMgtulVXJnYS9reWRp0vTGlGC3oNxa/vDwKNABNVGMCH4ZTTntTBj6NgJWe4LsB+CW3UT4/59rTslmXHBsj9fMQSKmaUgAxa2bhfCb0A5UJ0pCKURdy/8wcGKgYOsOXdOUuK4ewZi5a08Atkaxp6y7lrO5fHFSJuL8WxBu2ziTMkNdpN9Z3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bk/X0IKj0j/JGwQO+eyT8efJARYrRQReUNk7q7KoUBk=;
 b=JLXMy1usqSQWw+nqcQ/t7u9YbvqDpe8FX89jyK0gK5lao3MNe4oQnYN8xUD1xjMZOfe1DfktpbYSfwmK84MNnp+NngCSmSFzGKEQOU2x3o4+2+KR7K4820TkE6DDVEVf84PqhiIzT0InOe4DrqcFtaUSIF6AwzN80WObkNe4jGI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA0PR12MB4590.namprd12.prod.outlook.com (2603:10b6:806:93::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 02:33:13 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a%8]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 02:33:13 +0000
Message-ID: <968afa8d-d402-311f-cf14-fd2dd27bf385@amd.com>
Date: Mon, 16 Jan 2023 20:33:10 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] drm/amdgpu/vcn: Add parameter to force (en/dis)abling
 indirect SRAM mode
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20230116212004.860968-1-gpiccoli@igalia.com>
 <20230116212004.860968-3-gpiccoli@igalia.com>
 <CADnq5_Oh5Vdygo12evQKxw3w-ipRoQMvSNFHGcKtBNbSmtW7GQ@mail.gmail.com>
 <DM8PR12MB53991481A19B6AC8BA7A4E0AE5C19@DM8PR12MB5399.namprd12.prod.outlook.com>
 <b8a7253e-6902-e143-1bf2-ff107f25fd2b@igalia.com>
 <CADnq5_NJ7Kjoi7d+8bL2KNY3Leg8Jy7QL5reDS_dyEt7MUB0wA@mail.gmail.com>
 <a6680b24-372f-673c-4b3c-1fd3c309f242@igalia.com>
Content-Language: en-US
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <a6680b24-372f-673c-4b3c-1fd3c309f242@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::27) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA0PR12MB4590:EE_
X-MS-Office365-Filtering-Correlation-Id: 99f29154-e0cf-4e44-7372-08daf8332e28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6a54POVO5ukoPc55g8PRt6jUB7B8uRgaB4ydtZDzoJvMyasI5lkVSrL4KyaKfgK6AqrP80XWDWyxhUaWDjeuij0pAAprDvK9f9edRnV/6QExMyclnT8pbKl81M+NNTO8Dw05Xd3hX4cJ8fJOCNLiH3qePjkmqOka+2eqw2A6oUVdtIoOLI18KA5uuzGuJnHOds8lf390JoPNOqH1me1REvtmctTWhAUL4WYE1IGsJB68I+IDgYckmvDgAx31hj2fz19b0BfNO5egk0atlEtW+yLvxXnv739JNHR9GO/rxJzM5KE9+wF63Xk6ZIu9FDdG/Dpqx5qPUTsAOVKIbJ995Tn2dw+cRCZT2djLvvihQMLv68d2EJtpWJVdSsiDWllyjgLu3fuiaHbnG+EP3d1ovbxGlcm+BdF96tl51aXQhJYvgoR0JHrHrZytS282V1V1rcE4eD4BZ4RLlqa06jE05/byrZLbl6P+Oui0laWCGXBRdhtU9lVrgh1S63g36xjTBkJTBBUh1jUqwCBtuKBFKPUI8g0eTiNndyUWJV7XjzJtNM+sKrP7q+lUmamjv6wjr3NcTX21t6vI4e/E/OzYn1sHLMvprpl68eaL7RtLtMhlpgYUVP+JmO8kmbTJAUMch1nofsCKvJhcybaNhvO2+Kh9+2ZMXPnIPnuFdHaCl9r4psUHgft6LSDKpTgwKrPtp2XvigO/pj+bBfvCuyCc2SxX/Ki1ezmWU79/kdmRrgE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199015)(31686004)(66946007)(2616005)(66556008)(41300700001)(66476007)(186003)(53546011)(6512007)(8676002)(4326008)(86362001)(31696002)(36756003)(5660300002)(8936002)(54906003)(110136005)(478600001)(83380400001)(6506007)(316002)(38100700002)(6486002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHBFbEJWZkxPZ3YrRTdNWS80bWdIbngyMEgydzFwSWw2TWMrNU5Fd2xIZWcv?=
 =?utf-8?B?b3AraS8rQjljelhsRDdCRlYwQStQUGc5NzUyYlVCN0hSbEZoRWFKbTEvK2Vp?=
 =?utf-8?B?eEo0NjdKZEFad2s0KzdwTSsvcE81Ull1YlBpeExNSHJmT1o4T1dHc0k1T2c4?=
 =?utf-8?B?dC9aQW9JTXA2aHFXc25IaVV6OEFXRFQ3VlpEbzJMclpRL1lVbytybThidFk1?=
 =?utf-8?B?TkF5MHFJd2xwbVMyT3U0Y2tkR3pPamJFY3B6T2ZjSHc0WU9HM2kydWtxWENl?=
 =?utf-8?B?QmI4Y2JIV0ViUXAxVUdBSHRlVFJJVlJpbWJnTmcwU0tvZ1hQS1kzaU9iQWIx?=
 =?utf-8?B?Qkg3RVNjRURGRjZ2cHJDT2lpendvd3RxOHNTcW83UEU3K2dLbE5yT0xKVjF0?=
 =?utf-8?B?MDh3RGhyekVMOUlRTGJ5cmNZMDNkalhvTjhma0U1MkNnQVF5cUw4RFhXR2Ev?=
 =?utf-8?B?YXp5UXRKVjhnTHNydkViNUxvWFR0MVpNaXpZNlJMM0RBNWtGajMwNTV3dzVP?=
 =?utf-8?B?bHNvOU5tNStXNGNvYXJWM1c4bEcvRVVnWnErWHF5eFpJVkp2T29EZDA2WFdX?=
 =?utf-8?B?ZXR4VitLSzhDSDVMRFl0Zkl1eTJ5d3ZpRUxocUd2U3NGOHdlUVdEbEVoM1lX?=
 =?utf-8?B?N1RXV29SU3NMOXMxVmMzZmg0N3BubENVRnBzRzAzZExGdHZvOEZBYzlYbDU0?=
 =?utf-8?B?OVptTWZzbmE2NHJKOFAyTkIwaEFzYmR5Y2xKRUNXNkJvd2xlaFRpQU9pOWhl?=
 =?utf-8?B?c1FCOUtXTk41bm51bkZrQnRxZDcyemplQnhDOUYzeC9zOWhkQlI5Tnl2cnNv?=
 =?utf-8?B?dFV2WjFCWXo4YnhTR1YrMVB5SDRvd05xSzQxTUk4aHc2cW9OK2hmRC9JUVY0?=
 =?utf-8?B?TWhqcjZWSEtGU1grZWZQK2x4Sm5yMXg0SkFPZ20vUDZTRWNUQW83SXV6Wm5F?=
 =?utf-8?B?NTZGdEZtSVQwUTIvNmViWldWRGgvZkQ3MEJNRE1iRDdWTm5pTXFqRTNFVGpq?=
 =?utf-8?B?akJqNHJTMzVVNlFWcDk4Q2I1UGY4UWZLenRqZ0tYTFlDYmtYZThxNDBtb3FN?=
 =?utf-8?B?aVdBeEdDbTh5NUZqQWlScEhVWFpTRm1QRitPODJtWC9pcTBtY3hDN0FDc2Vy?=
 =?utf-8?B?Rld3anU0dTVEdG9FZnlrdnFwak5XYTVHdUNLU1hHQzE2bE1haGxWcmErMWpu?=
 =?utf-8?B?ckpVSktPSTlicmluT2hoNVNqZUVrMTNtTVVNMWVHcHl2VFU5eEx5ajR3U2VM?=
 =?utf-8?B?NllaeFFEQXAyb2ZzSVFST083TUNKVHJBVUE1c0gwYlJ5a0REWlZVNWxTdlFx?=
 =?utf-8?B?bSswR2U5L2FHeGdlakdwbWpibkUzWlNkMWQ0MkZJbEdvaGg2TGhrRnk2aHlk?=
 =?utf-8?B?VWVLbnJVWVFkUWl6dHBBUTY5K1RkM2xSOTIreHNqU1hOKzN5VC9MODNKK2xi?=
 =?utf-8?B?OENVSVNBYXlEbDE0d1A5bGc0Z0gzYlkyVFdWSDd2VTFUemVsdjhYSEpDSXlC?=
 =?utf-8?B?bGovUE9zWEhHYlU0dFQzSzYwc2EycG9JaFlndEJqcDdQVnhRak1yTFJ4eEtF?=
 =?utf-8?B?SS84MFBzVENaZmdVWW1Nbmc4TERzRkFZTTcxL2ExZlJiWTF5aG40eUxyb1Yy?=
 =?utf-8?B?VGZ1RVVwS1NJeWdVY0w4V2VwRGFac2lwQ0NuK2IwZy92RE5BMTlMVkFBY3Z3?=
 =?utf-8?B?V3FOeHp1cGxKMVlGb3Q1WlFPejZnVXhsTnRva0h4WllMSm9qNm5BV2tzUFFQ?=
 =?utf-8?B?TktmbzVONmR2bG1HUHlHYlVZQ2JXeXZ0SDRrMXlGWnVSZ3VOY3VrVmxCNjJI?=
 =?utf-8?B?Z00yZnFQZ3YwY0JHK2hoTnNJcTNmSndVRDZqanIvbjdiYTRvb2Z4Vjl2b0NT?=
 =?utf-8?B?ZHVTVTVLbHJLZWFuTVYxNFExRXJySFZuM1dWSHpVMDRIcWR6bjVyQ1Z3UmJ6?=
 =?utf-8?B?bzBRTnlPVHJiKzJHZWRBYjZTK05QZHhyeklGQno3NXo1eExGYXdMak1GendC?=
 =?utf-8?B?UXBtOGl1WE9CNnVpQ1dQT1ZCVENURU5KSk1wOVFZNVJpV3F2WGVLVUJ6Q21l?=
 =?utf-8?B?TzR0Z2RLWmZIRXdZckpYekxaU0xER3NvMnErRDNrMHpMNjlHUjBFeDNENENh?=
 =?utf-8?B?aTc1MFFXR3l0SHFvaXBpRnA1Zm5DbVZRM3ZiVnU2Q09iTEs5VEY0M29lZURt?=
 =?utf-8?Q?iJGKmL/CvVO5zv74F3ztP/9upIvsJaw8TcHeNudqMnbM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f29154-e0cf-4e44-7372-08daf8332e28
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 02:33:12.9800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pmeVOTOVf7mjhuerc/sDMg5wjxRJaQ5aUAwkJoR15nBCJq7azeu4i7O01SpmvWabrKKvkYDNafg72e6Kuciyrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4590
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
Cc: "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jiang,
 Sonny" <Sonny.Jiang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Zhu, James" <James.Zhu@amd.com>, "Liu,
 Leo" <Leo.Liu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 Pierre-Loup Griffais <pgriffais@valvesoftware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/16/2023 18:47, Guilherme G. Piccoli wrote:
> On 16/01/2023 20:00, Alex Deucher wrote:
>> [...]
>>
>> It's not clear to me when this would be used.  We only disable it
>> briefly during new asic bring up, after that we never touch it again.
>> No end user on production hardware should ever have to change it and
>> doing so would break VCN on their system.
>>
>> Alex
> 
> [+ Pierre-Loup]
> 
> Steam Deck is facing a pretty weird scenario then heheh
> 
> Commit 82132ecc543 ("drm/amdgpu: enable Vangogh VCN indirect sram mode")
> corrected a long-term issue in which the indirect SRAM mode wasn't
> enabled for Vangogh - and Deck GPU architecture is Vangogh, so it was
> working perfectly with that disabled.
> 
> Happens that a bad FW candidate seems to have broken something - it was
> a bit convoluted to debug, but we proved that disabling indirect SRAM is
> a good workaround so far, it "restored the behavior" pre-82132ecc543.
> 
> Hence my proposal - this parameter would've made life so much easier,
> and we're start using it "downstream" now. While I understand that of
> course the FW should be fixed, meanwhile this is a cheap solution to
> allow further debug and real use of the system.
> 

For debugging these type of problems, I think an effective debugging 
tactic would have been to mask the IP block (amdgpu.ip_block_mask).

