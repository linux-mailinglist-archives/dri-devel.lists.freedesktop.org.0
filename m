Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A85A052220E
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 19:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E06010E80F;
	Tue, 10 May 2022 17:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E056510E7C8;
 Tue, 10 May 2022 17:12:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1QF7eGrQJLFxgpymN+Z3iTqgqI4AL6rxzPsM3VxFrFs/e7jrxleoZwKpggEyzBSoG2u/53EbSwXRorvdHhAJFuESlPhoKl+x/eiywXicgFEdQT5j+0reV4MTWixw4FAoegEhentKcxSBO0Pm2Pv5IoBHRPqauhlUlcxRWihEzYc1JCU2mXWhlI4Ss/kMC5UdDx1nn8/DoNuS39Vu5eBswXucd3dc3mbsWi86ywkMEPbHxoJnqvdn3hip9T9+xvhion2unS6150ABXqxeZlB/1Kb0SV07oSF4ED0oL06xxUe6LfcikgJUbRAHIC61HON60ZB695ZlVUswd/OTFCdTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vfxZEDP6JWGjZBN+Q1TrQFW11Zlsn+qeb2qSzRtPc4=;
 b=dYsbwgM5PytbVivnrL/p+r2fA/ZAv+avT1xJ7vqNbIncm3hpa1ipI9rPnLVEB+T23aMYO4138U3GYn9TqYVGb3P6coxbY/YA2mjfm6bLWM+mgcMMV3YPsfRZEx97AzW7Cyxg0R9GD9x5zYK8i7xQM6SS0bjOZiOzMUSiG78Z+u8mngNumQnv0daO4fZggf/vbXUxpxNn3pSEX+BcdaeoU8YHvNj6gPibO1r6ORjjQugA8vgO2ik8/S++9YgO0wqi5BN+/9GiD7p4JS3C+nmPVmgZ6vGYMSwn5UONCw78THL+i3zBT6NayLy2K4QMcQYd7Ql4/gr9KoRZirG+QQvJyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vfxZEDP6JWGjZBN+Q1TrQFW11Zlsn+qeb2qSzRtPc4=;
 b=Dfu+7s29tJ6SU7fb9aQNxUMnLNJROoA7Kq/Cu+EuHmyIfXH1Wk07hFddmF9W0+wa7Vt3OvA80ceTwhjFagzUEdXXTUhtiVg4hB2Rder2HI8SwWi9j7dzcVvdK2o5rWHAGP50x8llhSEnAcS4aUYcYI57kB1URGsOniiPCCvn54o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by SN6PR12MB5695.namprd12.prod.outlook.com (2603:10b6:805:e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Tue, 10 May
 2022 17:12:10 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::1ce8:827f:a09:f6e]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::1ce8:827f:a09:f6e%5]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 17:12:10 +0000
Message-ID: <e5a8b464-19c7-2497-8ae9-586808ca5594@amd.com>
Date: Tue, 10 May 2022 13:12:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Bug 215958] New: thunderbolt3 egpu cannot disconnect cleanly
Content-Language: en-US
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "bjorn@helgaas.com" <bjorn@helgaas.com>,
 Linux PCI <linux-pci@vger.kernel.org>
References: <bug-215958-41252@https.bugzilla.kernel.org/>
 <CABhMZUW4=XUOwFAE74nebnZcKBp5pwktWufHNBpB79t3iUeQ3A@mail.gmail.com>
 <CH0PR12MB513992A93F34197377A5315DF7C69@CH0PR12MB5139.namprd12.prod.outlook.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <CH0PR12MB513992A93F34197377A5315DF7C69@CH0PR12MB5139.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0092.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::31) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e81894ed-8602-4aff-bcde-08da32a837f3
X-MS-TrafficTypeDiagnostic: SN6PR12MB5695:EE_
X-Microsoft-Antispam-PRVS: <SN6PR12MB569502264275FDBB79FA8A1DEAC99@SN6PR12MB5695.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rAuoUiHXfAigB7L5XEzvnt3bCghlngkaMm/4dzgEeyRe8LIyf9F3J07QlAD5jEOjkxlNN/uz6/jBbRNC6Ks/giiEKC5qHx1H0xUcXJZr+vWOzYqjKVl4RjYeCfQiz+UInGzoxrYAb2IRjQlLFo0cfdKbvhQw9i/TsgDcX4gonXIBdbnqRg5+c244xzQbmbCNhjsTM+aIEO+hJ+99lH2PJMt0NuOGS/jerpL64iJZZW27eP+sl1xOw+/6L4YP5d5qqek45KO0q9n3+qEDeXZrkcI3U8E92kriJwdIMBhRq9/b0WTgOhArRaEhGo3GH3oI90/Z2YY+YvsCFsJSKoOLKM4qQy8NHilOFDNZKIVOM8wCWPhka1uTFdCMoU1AYiZRLCLhgM+p2ipOu6WlSLDzysdQ62id3v8Bgkho+hcaqGYLMR5OhaeZzSCsg6Tb9YmInXGC8SmNFAVIbUTzQJ8AN0tYgATBAMVgpMuQm16/NGGERbabXhJ5e3wtFKOV2erDZ7c4rUmlAP6sGngROTwul1u6+VkqKMcpjEEB7RT9bXqN7qEn72aYPkYc8gqa8x8p70Ef/2/JXvzf94JN6Yqi0TcRVlMiirR12LGnj1TCWFs89Y1a7iBGJoXVapC0NxhvsDTdP06PsDtzWAZmPkpC0s1BDL6ELOFgyDyUm7EdtW5Q0cm/1C6SstEFvehdKwNWCwJrBL7Lf00+RdHYgVouNtq4KCQtYUrgFk7GSsvNYTYZP9X49aoO+K8nYSbGlyicQ3ai1fcvlfLiQJYC4x601oYC1G8mW1z6b0I4JI6iD03sc7aoQ8SAEuSgq6ZPZT8d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(2906002)(966005)(8936002)(31696002)(6486002)(83380400001)(30864003)(45080400002)(44832011)(508600001)(86362001)(186003)(6512007)(53546011)(66556008)(66476007)(8676002)(4326008)(5660300002)(6506007)(31686004)(36756003)(66946007)(54906003)(110136005)(316002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVVkSFBybGs0YlBrcTFsUEt6VnNmMjh4S093MndoWmtDdXNJcTNuL0ZydjZG?=
 =?utf-8?B?U3NmUWtpWk5OSFhERVdrMVFFUlJrNFNGMTNFeW8wVkswWkU0TEV2WUFmYlFG?=
 =?utf-8?B?MStEYlNvK2tBVEFXSVlYUitodVFGclRFcnhCYTYvZWp1VjZkQVprTTAwWDNz?=
 =?utf-8?B?WWdVOERYVEpnNVRieVhBaU00VUJETzdNUHord2IvOThuMmF3RERiU3BjbnNp?=
 =?utf-8?B?Smx3L1Fldm84TTJldVY0QjhYVisvY3B3eWlSd3RmbkNyREZtT1p0NWF3QkRx?=
 =?utf-8?B?S2tJWm85MUdSbGRxZklHMS8yS0JJT0FNTW5UU1JDSm02ekhneUdCOUkxbnpR?=
 =?utf-8?B?KzdJdFlCMkFSSU96R29XVkJyZ3VWdmdaOG40aCtzVDF2VXJ5RVB1M25WQ3pN?=
 =?utf-8?B?WHNZbENmS0w2K1Blakc0aTQvL09HTFhES3dOdmFQaDMrM2VRSTlsYXFnVzF6?=
 =?utf-8?B?MkJWVlVmRlYrUVhqYTdpcDFPODh5ZzdCSSsrQndlTlhKSjNHa1RXaFFoNmN2?=
 =?utf-8?B?MHk5QVVzWVVoeFdDYkpBWXpRb0taTFBtQ0lnMk5xQjNxMzlvcHZVdTJLV09s?=
 =?utf-8?B?aWdOSXhrckxzajB2K0pXQS82ODlSanNNeVBoSzR3ZlZaZDFIRlh0NjU0aVMw?=
 =?utf-8?B?azQ0OHYxdHRPTHlQU1J0U1FkNGNGODJkZC83ZGRUMGUwSWV6b0dDV2VYQ2lC?=
 =?utf-8?B?dEw4emQrUEo0c2N4OHdGRVJnOEdITkIzRENmUGxKTGplVk5DdDIyeUJoRWlZ?=
 =?utf-8?B?UmpYL3p1OTNWVGgrVGNEYUJIb05kQmdsVmlZdVo3d3dWTk5HakZXRWhBWlRq?=
 =?utf-8?B?SFJQdk1COExpam4wNWs3NVgwa0VWb1M1VUJxM292dnVadTE3MTNScnV6eXJP?=
 =?utf-8?B?Z0R6aGhiQzkrNHJOU0lIMHpRUlg5Vmd3MGRNZDFKVDNQdUw1TWRNb2lINWlC?=
 =?utf-8?B?Uy8yZlRyLzY1U29ZYjFMcVNmSTF3RmZXK202eDZoME5aYm9WYjR3bjhQeml3?=
 =?utf-8?B?R1JWbi94SGppajYrczVabjhOOTBmS05nVTVaQThHNFIwb0cxZlgzRHBFckMy?=
 =?utf-8?B?T3U5aUxONjBoalNVRitTeEhFc09vSjdoalNxaThGMk9BQ0ZBdkgwMVdUazlQ?=
 =?utf-8?B?d1p0ZlNjb1BaRi9YZHVJK1IvV1dBdXVXSzJYaTE0TE0yVmNyRXJwaXFoeTkr?=
 =?utf-8?B?QjRudG9WaUJwb3lNbE9EcWRmOWlzeXl6UEFrcjUzRXNHZklqQWUzVk9ubFZn?=
 =?utf-8?B?RjdKUnlybEJ1a2luaUE3cTMxQ2QvWEd0MnUyL2oxNTlKN2tMWUtnRDN4TWpU?=
 =?utf-8?B?Y0sybUVyUHpHRmw4MWkyTlV2dk5pSG5TdDJuSDJzRmJsL1dYUkE4Z1pFUHZB?=
 =?utf-8?B?ejhGSVZsSUw0VXd2TjZEU3V6L0xMMzJoUGljSlE2c3NRVHllcEFQTVUreld5?=
 =?utf-8?B?c3dYdUJYV2luTlU3eWhFRWQ4TlZRSXM2Y01mNHVCT1JmWTY5N2xpa1hNckhO?=
 =?utf-8?B?RE01SzVUUy9vMG5WRTM5bGNISFR3QUpxUkRaWkxlaWxFY0tnS2RIVGwvaG1L?=
 =?utf-8?B?TTRKS0swNmN1V093M2tNdlFVSE4rbmFPWHY3MlNwT0xlRFJPZ2RGallMRGFD?=
 =?utf-8?B?MlpBTUFjdjRHM2ZDSHNNWXlYMCtkazdrTXh3RURDMmd5dUduNDVSZ2FqQTJj?=
 =?utf-8?B?dGZFV1E0Qlczc2lBQzlEZjMyMnBjczdsT0o3aWVSNlJEajg0T1pndGJoS3ov?=
 =?utf-8?B?bTlKWVp1a2NlVzAvdEp0Nmd3am5zUHM4S1lvYkJPTVY1cTRwYlUvMGRwd2dE?=
 =?utf-8?B?QTlMajRkbVBRWkw0ZjYxQTAwQStWOEZ0NndsVzhpU0xhY1VTMDZ5Vmg0MVlo?=
 =?utf-8?B?VWpkdXE4cVNwUlB0OCtyZysyVzZBVGpDQStENWZZOXlpek5OYVhKcXE0emsv?=
 =?utf-8?B?WDgvcFJlYnMreENsT0hWVENMVVV3UW8razM2RWg0ZTZhd0dEOEMxcjArdEhi?=
 =?utf-8?B?cm0xOEQ5SndSUUJtUVBIV1hYck9NdzdJY2tQOXhtQ2RqUjJyQVgrZXd1algr?=
 =?utf-8?B?U2tpRytZZ2lpUThVZmo1NElUaDZIemRBeDBlWUYzQ0Y0RCtXZW1KN1Y5VmpX?=
 =?utf-8?B?M1NJQ09tT1lTeUFMdlVLRk5DSktGN3A1U0pDb2FlV2kvVisycmNuaHQxNy9y?=
 =?utf-8?B?VFplVkFBZEJWYk8yc1V3QWZDTEJrcy9TMW9TZC9XbVFUeTNZWWpIQzZYSUhF?=
 =?utf-8?B?NldYSEV3OEwrdjFtbUVyMkpmZE44ejNpbll6eDhic0t6MVlLWHFNNGo5QjJJ?=
 =?utf-8?B?dktqejRxbnUyTUN5TEJvbUcwdkk5RS9YRGs5aGx4MHkxVk5xeHc3QVV2K1o2?=
 =?utf-8?Q?72WPLWaAl7QDCRqkoT7/E0rRiWAKx6rGJZDNWIBf3ywLr?=
X-MS-Exchange-AntiSpam-MessageData-1: O3J9v9HaYk3hVw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e81894ed-8602-4aff-bcde-08da32a837f3
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 17:12:10.2836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4XDOMif/4XU5eh9VLCxsusgwxma7cRYBxQSV4y1PzezuCorwz9M6o/2FDyuCmLh2JfqADsIv38xXAUxRRylSNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB5695
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
Cc: "r087r70@yahoo.it" <r087r70@yahoo.it>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-05-09 14:03, Deucher, Alexander wrote:
> [Public]
>
>> -----Original Message-----
>> From: Bjorn Helgaas <bjorn.helgaas@gmail.com>
>> Sent: Monday, May 9, 2022 12:23 PM
>> To: Linux PCI <linux-pci@vger.kernel.org>
>> Cc: r087r70@yahoo.it; Deucher, Alexander
>> <Alexander.Deucher@amd.com>; Koenig, Christian
>> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; amd-gfx
>> mailing list <amd-gfx@lists.freedesktop.org>; dri-devel <dri-
>> devel@lists.freedesktop.org>
>> Subject: Re: [Bug 215958] New: thunderbolt3 egpu cannot disconnect cleanly
>>
>> On Sun, May 8, 2022 at 3:29 PM <bugzilla-daemon@kernel.org> wrote:
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugz
>>>
>> illa.kernel.org%2Fshow_bug.cgi%3Fid%3D215958&amp;data=05%7C01%7Cal
>> exan
>> der.deucher%40amd.com%7C8bb8567427844b05e5f808da31d8435f%7C3d
>> d8961fe48
>> 84e608e11a82d994e183d%7C0%7C0%7C637877102168668221%7CUnkno
>> wn%7CTWFpbGZ
>> sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn
>> 0%3
>> D%7C3000%7C%7C%7C&amp;sdata=PpcDBIpUW8vCX%2F4kM6Q8RjdgS1qw2
>> uuWoWZXis4M
>>> dDQ%3D&amp;reserved=0
>>>
>>>              Bug ID: 215958
>>>             Summary: thunderbolt3 egpu cannot disconnect cleanly
>>>             Product: Drivers
>>>             Version: 2.5
>>>      Kernel Version: 5.17.0-1003-oem #3-Ubuntu SMP PREEMPT
>>>            Hardware: All
>>>                  OS: Linux
>>>                Tree: Mainline
>>>              Status: NEW
>>>            Severity: normal
>>>            Priority: P1
>>>           Component: PCI
>>>            Assignee: drivers_pci@kernel-bugs.osdl.org
>>>            Reporter: r087r70@yahoo.it
>>>          Regression: No
>> I assume this is not a regression, right?  If it is a regression, what previous
>> kernel worked correctly?
>>
>>> I have an external egpu (Radeon 6600 RX) connected through
>>> thunderbolt3 to my Thinkpad X1 carbon 6th Gen.. When I disconnect the
>>> thunderbolt3 cable I get the following error in dmesg:
>>>
>>> [21874.194994] amdgpu 0000:0c:00.0: amdgpu: SMU:
>> response:0xFFFFFFFF
>>> for
>>> index:18 param:0x00000005 message:TransferTableSmu2Dram?
>>> [21874.195006] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU
>> metrics table!
>>> [21874.195123] amdgpu 0000:0c:00.0: amdgpu: SMU:
>> response:0xFFFFFFFF
>>> for
>>> index:18 param:0x00000005 message:TransferTableSmu2Dram?
>>> [21874.195129] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU
>> metrics table!
>>> [21874.195271] amdgpu 0000:0c:00.0: amdgpu: SMU:
>> response:0xFFFFFFFF
>>> for
>>> index:18 param:0x00000005 message:TransferTableSmu2Dram?
>>> [21874.195276] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU
>> metrics table!
>>> [21874.195406] amdgpu 0000:0c:00.0: amdgpu: SMU:
>> response:0xFFFFFFFF
>>> for
>>> index:18 param:0x00000005 message:TransferTableSmu2Dram?
>>> [21874.195411] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU
>> metrics table!
>>> [21874.195544] amdgpu 0000:0c:00.0: amdgpu: SMU:
>> response:0xFFFFFFFF
>>> for
>>> index:51 param:0x00000000 message:GetPptLimit?
>>> [21874.195550] amdgpu 0000:0c:00.0: amdgpu:
>>> [smu_v11_0_get_current_power_limit]
>>> get PPT limit failed!
>>> [21874.195582] amdgpu 0000:0c:00.0: amdgpu: SMU:
>> response:0xFFFFFFFF
>>> for
>>> index:18 param:0x00000005 message:TransferTableSmu2Dram?
>>> [21874.195587] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU
>> metrics table!
>>> [21874.227454] amdgpu 0000:0c:00.0: amdgpu: SMU:
>> response:0xFFFFFFFF
>>> for
>>> index:18 param:0x00000005 message:TransferTableSmu2Dram?
>>> [21874.227463] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU
>> metrics table!
>>> [21874.227532] amdgpu 0000:0c:00.0: amdgpu: SMU:
>> response:0xFFFFFFFF
>>> for
>>> index:18 param:0x00000005 message:TransferTableSmu2Dram?
>>> [21874.227536] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU
>> metrics table!
>>> [21874.227618] amdgpu 0000:0c:00.0: amdgpu: SMU:
>> response:0xFFFFFFFF
>>> for
>>> index:18 param:0x00000005 message:TransferTableSmu2Dram?
>>> [21874.227621] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU
>> metrics table!
>>> [21874.227700] amdgpu 0000:0c:00.0: amdgpu: SMU:
>> response:0xFFFFFFFF
>>> for
>>> index:18 param:0x00000005 message:TransferTableSmu2Dram?
>>> [21874.227703] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU
>> metrics table!
>>> [21874.227784] amdgpu 0000:0c:00.0: amdgpu:
>>> [smu_v11_0_get_current_power_limit]
>>> get PPT limit failed!
>>> [21874.227804] amdgpu 0000:0c:00.0: amdgpu: Failed to export SMU
>> metrics table!
>>> [21874.514661] snd_hda_codec_hdmi hdaudioC1D0: Unable to sync
>> register
>>> 0x2f0d00. -5 [21874.568360] amdgpu 0000:0c:00.0: amdgpu: Failed to
>>> switch to AC mode!
>>> [21874.599292] amdgpu 0000:0c:00.0: amdgpu: Failed to switch to AC
>> mode!
>>> [21874.718562] amdgpu 0000:0c:00.0: amdgpu: amdgpu: finishing device.
>>> [21878.722376] amdgpu: cp queue pipe 4 queue 0 preemption failed
>>> [21878.722422] amdgpu 0000:0c:00.0: amdgpu: Failed to disable gfxoff!
>>> [21879.134918] amdgpu 0000:0c:00.0: [drm:amdgpu_ring_test_helper
>>> [amdgpu]]
>>> *ERROR* ring kiq_2.1.0 test failed (-110) [21879.135144]
>>> [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* KGQ disable failed
>>> [21879.338158] amdgpu 0000:0c:00.0: [drm:amdgpu_ring_test_helper
>>> [amdgpu]]
>>> *ERROR* ring kiq_2.1.0 test failed (-110) [21879.338402]
>>> [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* KCQ disable failed
>>> [21879.543318] [drm:gfx_v10_0_cp_gfx_enable.isra.0 [amdgpu]] *ERROR*
>>> failed to halt cp gfx [21879.544216] __smu_cmn_reg_print_error: 5
>>> callbacks suppressed [21879.544220] amdgpu 0000:0c:00.0: amdgpu:
>> SMU:
>>> response:0xFFFFFFFF for
>>> index:7 param:0x00000000 message:DisableAllSmuFeatures?
>>> [21879.544226] amdgpu 0000:0c:00.0: amdgpu: Failed to disable smu
>> features.
>>> [21879.544230] amdgpu 0000:0c:00.0: amdgpu: Fail to disable dpm
>> features!
>>> [21879.544238] [drm] free PSP TMR buffer
>> The above looks like what amdgpu would see when the GPU is no longer
>> accessible (writes are dropped and reads return 0xffffffff).  It's possible
>> amdgpu could notice this and shut down more gracefully, but I don't think it's
>> the main problem here and it probably wouldn't force you to reboot.
> + Andrey who has been working on properly handling PCI hotplug on AMD GPUs.


Added comment in the ticket.

Andrey


>
>>> [21880.455935] i915 0000:00:02.0: vgaarb: changed VGA decodes:
>>> olddecodes=none,decodes=io+mem:owns=io+mem
>>> [21880.456218] pci 0000:0c:00.0: Removing from iommu group 14
>>> [21880.456715] pci 0000:0c:00.1: Removing from iommu group 14
>>> [21880.456798] pci_bus 0000:0c: busn_res: [bus 0c] is released
>>> [21880.456950] pci 0000:0b:00.0: Removing from iommu group 14
>>> [21880.456985] pci_bus 0000:0b: busn_res: [bus 0b-0c] is released
>>> [21880.457106] pci 0000:0a:00.0: Removing from iommu group 14
>>> [21880.457156] pci_bus 0000:0a: busn_res: [bus 0a-0c] is released
>>> [21880.457279] pci 0000:09:01.0: Removing from iommu group 14
>>> [21880.457311] pci_bus 0000:09: busn_res: [bus 09-3a] is released
>>> [21880.457543] pci 0000:08:00.0: Removing from iommu group 14
>> This looks like removing 0c:00.0 (the GPU) and two switches leading to it
>> (probably part of the Thunderbolt topology), so to be expected.
>>
> The GPU actually consists of multiple PCI devices, depending on the generation.  Back when HDMI audio became a thing, and audio endpoint was added. Then more recently we added upstream and downstream PCI ports which connect the GPU devices to the system.  On the GPU side of the ports is the GPU, audio, and often USB and I2C (for UCSI).
>
>>> [21880.457847] pci_bus 0000:06: Allocating resources [21880.457888]
>>> pcieport 0000:06:02.0: bridge window [io  0x1000-0x0fff] to [bus 3b]
>>> add_size 1000 [21880.457897] pcieport 0000:06:04.0: bridge window [io
>>> 0x1000-0x0fff] to [bus 3c-6f] add_size 1000 [21880.457913] pcieport
>>> 0000:06:02.0: BAR 13: no space for [io  size 0x1000] [21880.457919]
>>> pcieport 0000:06:02.0: BAR 13: failed to assign [io  size 0x1000]
>>> [21880.457924] pcieport 0000:06:04.0: BAR 13: no space for [io  size
>>> 0x1000] [21880.457928] pcieport 0000:06:04.0: BAR 13: failed to assign
>>> [io  size 0x1000] [21880.457934] pcieport 0000:06:04.0: BAR 13: no
>>> space for [io  size 0x1000] [21880.457938] pcieport 0000:06:04.0: BAR
>>> 13: failed to assign [io  size 0x1000] [21880.457943] pcieport
>>> 0000:06:02.0: BAR 13: no space for [io  size 0x1000] [21880.457947]
>>> pcieport 0000:06:02.0: BAR 13: failed to assign [io  size 0x1000]
>> I'm not sure why we're allocating resources as part of the removal.
>> The hierarchies under 06:02.0 (to [bus 3b]) and 06:04.0 (to [bus
>> 3c-6f]) seem to be siblings of the hierarchy you just removed (my guess is that
>> was 06:01.0 to [bus 08-3a]).  But again, shouldn't require a reboot.
>>
>>> upon reconnection of the cable I get:
>>>
>>> [22192.753261] input: HDA ATI HDMI HDMI/DP,pcm=3 as
>>>
>> /devices/pci0000:00/0000:00:1d.0/0000:05:00.0/0000:06:01.0/0000:08:00
>> .
>> 0/0000:09:01.0/0000:0a:00.0/0000:0b:00.0/0000:0c:00.1/sound/card1/inp
>> u
>>> t98 [22192.753738] input: HDA ATI HDMI HDMI/DP,pcm=7 as
>>>
>> /devices/pci0000:00/0000:00:1d.0/0000:05:00.0/0000:06:01.0/0000:08:00
>> .
>> 0/0000:09:01.0/0000:0a:00.0/0000:0b:00.0/0000:0c:00.1/sound/card1/inp
>> u
>>> t99 [22192.753952] input: HDA ATI HDMI HDMI/DP,pcm=8 as
>>>
>> /devices/pci0000:00/0000:00:1d.0/0000:05:00.0/0000:06:01.0/0000:08:00
>> .
>> 0/0000:09:01.0/0000:0a:00.0/0000:0b:00.0/0000:0c:00.1/sound/card1/inp
>> u
>>> t100 [22192.755234] input: HDA ATI HDMI HDMI/DP,pcm=9 as
>>>
>> /devices/pci0000:00/0000:00:1d.0/0000:05:00.0/0000:06:01.0/0000:08:00
>> .
>> 0/0000:09:01.0/0000:0a:00.0/0000:0b:00.0/0000:0c:00.1/sound/card1/inp
>> u
>>> t101 [22192.763885] input: HDA ATI HDMI HDMI/DP,pcm=10 as
>>>
>> /devices/pci0000:00/0000:00:1d.0/0000:05:00.0/0000:06:01.0/0000:08:00
>> .
>> 0/0000:09:01.0/0000:0a:00.0/0000:0b:00.0/0000:0c:00.1/sound/card1/inp
>> u
>>> t102 [22192.975773] thunderbolt 0-1: new device found, vendor=0x127
>>> device=0x1 [22192.975786] thunderbolt 0-1: Razer Core X
>>>
>>> but the egpu no longer appears in `xrandr --listproviders`. Full
>>> reboot is needed.
>> Can you please build with CONFIG_DYNAMIC_DEBUG=y, boot with
>> 'dyndbg="file pciehp* +p"', and attach the complete dmesg log to the
>> bugzilla?  Also please attach the complete "sudo lspci -vv" output (before the
>> unplug and after the replug)?
