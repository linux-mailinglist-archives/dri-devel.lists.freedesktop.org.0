Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3723D2FBFC3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 20:16:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6ED6E06D;
	Tue, 19 Jan 2021 19:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7288C6E03A;
 Tue, 19 Jan 2021 19:16:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dl7kk5+/mfaURDu624FU+jZkKdfRUMcmLHxXWAnwRE6bezk8n4F6zMaGMDSax/4LnjNfD3oIiO6rpjjk2Tj79yduAhUS0OfuHXmwo0F9qI3vVzY975w7s9x1l72eGDwiJMXqr3UqJ3JbjOfhw0FAoJB79KDYsA60j7kb8X4mdaWp1peHYwtokbiekBXQRdsYYt3RGZ3gkiGm10xY9pXWkTVFDyiRvzYD+lWuGsFLTwjXKxubtyMHLE/NLghuQjwQJVCyv3pAtNJj605FYCJ70WNpFNBZkrbfH63Ep4XmT/pLRwroiUN8TNhpttoGM815M3jLpUUqs4askOv/I1Va+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsThK7vs0m/SX0vFPKTtKVitiyFF4LpsuUS5eTvVum8=;
 b=BgJq1LKLXS8bzabrqIsMbavK0BkIBATxqtMcHlnPLV4VxQ2y3dHPAUeHTHTCD3rrap6xps9e4ThkZnSu7LMadNfN85AfpIFXl9SuJ+n/9D0XRH37f3GmCBTJxJcg4JR9f/Hg1uoO+Q7dJ5WhsACLnbLKtDgHI93XzU2Sz1rFvdsFS/fFK68d+n/q9oX2RLXQ+5VNZf/AzcGTWU1VxD1tWRyreAkL/uBc0xWCnr2vwr9yH95ltDq7GKJCxoQ/M01fBb11s0/0/MKrLWQV1wlTBnXAyZMoyZk1SVqF8fQiKorAgtrhF8VX5uQLMSkq8hXahUHFeDnGSwSGqURXVz4ZOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsThK7vs0m/SX0vFPKTtKVitiyFF4LpsuUS5eTvVum8=;
 b=VbMs0CFlCWWS7t1rcay+YJTG+DG5+zkfm+Dgo5NOWV12VPlf17YybCURSZp0mVIwfS0rPDU3F10M+62SumJ+IH6hVJrVR8jNQ2asTQ4XoYVSmds565YC4DsyvojPLH1Pnz4vFA4J7WcEA7io8OgF5jwjGTCjU2iSzb6A6PsFCRM=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4397.namprd12.prod.outlook.com (2603:10b6:806:93::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Tue, 19 Jan
 2021 19:16:07 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 19:16:07 +0000
Subject: Re: [PATCH v4 10/14] dmr/amdgpu: Move some sysfs attrs creation to
 default_attr
To: Alex Deucher <alexdeucher@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-11-git-send-email-andrey.grodzovsky@amd.com>
 <YAaLmBMlDRr56erH@kroah.com> <3650d98a-2d73-06b8-7f06-ca7728b5c4b5@amd.com>
 <YAcbIF8xaMcuSWG3@kroah.com>
 <CADnq5_PNFQ+3tmRXjY2m22Pnx=neqMC_PTtqrObrdeg0LQUo_w@mail.gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <d3c3ebd9-e887-7f2a-16dd-cc6841fffdf9@amd.com>
Date: Tue, 19 Jan 2021 14:16:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CADnq5_PNFQ+3tmRXjY2m22Pnx=neqMC_PTtqrObrdeg0LQUo_w@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:c1b5:6dec:d289:5430]
X-ClientProxiedBy: YT1PR01CA0138.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::17) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:c1b5:6dec:d289:5430]
 (2607:fea8:3edf:49b0:c1b5:6dec:d289:5430) by
 YT1PR01CA0138.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Tue, 19 Jan 2021 19:16:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0d3b4811-4613-4702-d8a3-08d8bcaeabf5
X-MS-TrafficTypeDiagnostic: SA0PR12MB4397:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4397FD57D39485F11EB479ADEAA30@SA0PR12MB4397.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:590;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UiRUpSC10gPjzn3ySUCDVfpNjH5va+iIfOAXIEIkZm/ZqLv53rdmE5tmPoVLgMLFXV/l39Rwik8V1Tkq4Fy4t7qAE5FUHqzZ8Gb9I1ZxxN/wR8MzlBbY4xQxLSiGXd8Zcm06xFs0EMoSZJf7UZRhMkk/+3YGRwr8bX/FV5qSdXhOY217Rc9ficztmWXGInZG7Koi66LTw9CM5dbzq0Bkzv6b3KVsnIRoXz4JSB5DKM/2QqbiurL+6/X3djg53lRuF1tENH9nYNzLE5okJJz5BdrwEyFIlHbeDYSKxf6a4yf6BvP2Yd6d9W2M4hX8Wt57CDtNQpdwec+/NUhsBf5pVdcEnyz05nifFkbB9cdeDm/xHzkD0qlAScxxpUj87De8/4GUSH9mxV3PS+ZBMbv10cRZRraWPf6Sh9njhIdgXXCKDX/1RHJTiEvZvz614P91TrPyijoojIbkP2bWUAr9jkL20pWPLbFFuKNEWegZ5OCqxlcMsgVxF4YkiBFe+AghrtG1XVP4Dt10FJYvnctckXsKTpkvDQOwh/3Q0LB68esJgHSl/b6BHSZnQtEFOA9n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39860400002)(136003)(376002)(396003)(6486002)(52116002)(16526019)(316002)(31696002)(53546011)(8936002)(2906002)(5660300002)(186003)(66946007)(2616005)(66476007)(54906003)(86362001)(31686004)(36756003)(478600001)(4326008)(966005)(8676002)(66556008)(110136005)(83380400001)(45080400002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NVZBcUphcE5qZGlrdDJWdFRYYS9tem1zdVBFRjc2RG9sU1FHOVVWNThEVlVn?=
 =?utf-8?B?UDFBY3dzOWU1amtRdWFYcXNSb1hPeFlqa2VvMExmY2hhSzhzNXJuNGZPT3hU?=
 =?utf-8?B?R2pHalNiTUliUHdEVnhBeW8yMVl0eTlhV0VrbjY1SWJCdjJIZUVaaFN5VE9x?=
 =?utf-8?B?WlVmR1VtYzlsbEJsZXhIRmhSTVJzTGRTaHkwd3g4Mmczd2YzdnpMM1pxUldr?=
 =?utf-8?B?K1FGSVZ2NkNmTCtINmUxc1JFNkg1N3Rtcmlmd3JiS1lid1gyN2F5N3p0Umx1?=
 =?utf-8?B?S0FLa1Rxa3JjMUIzU2w3N1FabHRjRUZ2ajQ4YnJwTmRUM3hpODVDUi9IRUVT?=
 =?utf-8?B?UDhPRjA0OVZmMnJCanlaRUJKZjFlUk1LaEFaNHg1L2FnK0JzbDMyT21qcmIv?=
 =?utf-8?B?NHFHbWo5K0wzWmo1dTBtTnlnTUtsWi9RbmZnODJpV3NaMkNwTENWakxCRnZ5?=
 =?utf-8?B?T3BGSnpYLzI2bnlBM2E2amZqeDlCTlJKY1MwSHh0RUkwYjBFaFFrajhKN0xD?=
 =?utf-8?B?N2dNOGFJeEdFZWVvYkJZVzl0M2FPbS9uMTVFSVhBNnN3Zk9mOUlxdkZHaXdZ?=
 =?utf-8?B?bE5hSUljb3VBdGIrL2NFNjJsMVA3K2p3TXIxWDNVcmdSN1RFN3FvNnFNOHYy?=
 =?utf-8?B?N01kaFVidHlwWHMwQUw4VkhORndWdFVkV3ZlRTR4WUtRTXNtVTVsN284RDkv?=
 =?utf-8?B?Nlp5OGttOER6dlVFamJpVk5QZ2FUcEc0cTdKWkNiNncyYzVwVTB6YzVMVnk1?=
 =?utf-8?B?aGxydUprQkd5STZFRjZSRStJNndvVFZWbkI4SUlKcG1DRTdQWkNPVmxzc1hm?=
 =?utf-8?B?OWhEQWppWmtjWk9NN3RqOEpDbnpNd01LNUJaNncvNTNFdzM0dDdCMUFPUWpE?=
 =?utf-8?B?VjY0TnBFTm9CSkxWSTFRaksyMkJycUlvZzcwc0ptU2piNEhTSnNEZElYNHBU?=
 =?utf-8?B?Wm1XWDlNejJVUHQvWStCdDA5clVLcnh2aXZkYlM3NmdXVit1SVA1aXA4ZWRj?=
 =?utf-8?B?SXl5d2g5eWZWZ2R3NkpLcytVRVJPTXI5QlBGcW1pZnpMck1CeklRand2VXps?=
 =?utf-8?B?KzJQWHl1UzlWUnhLLzYvOUJCRFNWU2x3YVU1U0N3Tm1SbHBxTzFpMnpwc3Fk?=
 =?utf-8?B?dEtSRmpWRUo0U3p3dTVyMXd2MWl2Ujc5ZzRiTmt6aVJpdGl3R2ZqOVNGOS9o?=
 =?utf-8?B?VThiY0gvNGkzQmVEcVF3NUVnYnhabjFEallEWFVIZjZPTkY1UUh3bUQ5UW1G?=
 =?utf-8?B?L0Fvc3dxTitpVlFyUThjOVVWK1dEUHBUdmljMEhjUFlVQkFwa2pOL0FnVUx6?=
 =?utf-8?B?aXRKeWlaeWlqa2VZMFZUcWFQV2xPWnp5NkF2c1lwUDhFNUpWWVdMd1p0YlZu?=
 =?utf-8?B?ZStndms0OXpadGJTWDg1YWNuRlVPOGVmbCszcGN2b2Z6SWoyQU5TL2ZsRnhT?=
 =?utf-8?B?WWp1OXR1KzBFbndyRHA4cXFGQmduaG5nR2FzVUhnK3pVVTdveVhpK1VoRXFN?=
 =?utf-8?B?d0hMM1R6VE1kRyt2R0N4WVh5L21XbGMyaXlEUXpLZlBjSXhSZnZMN2NDK0tJ?=
 =?utf-8?B?MXBqQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3b4811-4613-4702-d8a3-08d8bcaeabf5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 19:16:06.9671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W+RnnIIU9J09977tWgma6an2vynDq5MtKrFbxQC9jLR8MXsmL7gIRxFI2wtoldTLuPfbfICxBpAo1YUlxTGr9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4397
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Qiang Yu <yuq825@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/19/21 2:04 PM, Alex Deucher wrote:
> On Tue, Jan 19, 2021 at 1:26 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>> On Tue, Jan 19, 2021 at 11:36:01AM -0500, Andrey Grodzovsky wrote:
>>> On 1/19/21 2:34 AM, Greg KH wrote:
>>>> On Mon, Jan 18, 2021 at 04:01:19PM -0500, Andrey Grodzovsky wrote:
>>>>>    static struct pci_driver amdgpu_kms_pci_driver = {
>>>>>            .name = DRIVER_NAME,
>>>>>            .id_table = pciidlist,
>>>>> @@ -1595,6 +1607,7 @@ static struct pci_driver amdgpu_kms_pci_driver = {
>>>>>            .shutdown = amdgpu_pci_shutdown,
>>>>>            .driver.pm = &amdgpu_pm_ops,
>>>>>            .err_handler = &amdgpu_pci_err_handler,
>>>>> + .driver.dev_groups = amdgpu_sysfs_groups,
>>>> Shouldn't this just be:
>>>>      groups - amdgpu_sysfs_groups,
>>>>
>>>> Why go to the "driver root" here?
>>>
>>> Because I still didn't get to your suggestion to propose a patch to add groups to
>>> pci_driver, it's located in 'base' driver struct.
>> You are a pci driver, you should never have to mess with the "base"
>> driver struct.  Look at commit 92d50fc1602e ("PCI/IB: add support for
>> pci driver attribute groups") which got merged in 4.14, way back in
>> 2017 :)
> Per the previous discussion of this patch set:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.mail-archive.com%2Famd-gfx%40lists.freedesktop.org%2Fmsg56019.html&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7C1b43efdc8a164169eee508d8bcad1ece%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637466799090087255%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=T462j96qC%2BXCZzgnJMG%2BbUEOG94GVuqkvTWfUB%2B3%2Fl8%3D&amp;reserved=0
>
> Alex


Got it, Next iteration I will include a patch like the above to pci-devel as 
part of the series and will update this patch accordingly.

Andrey


>
>> driver.pm also looks odd, but I'm just going to ignore that for now...
>>
>> thanks,
>>
>> greg k-h
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7C1b43efdc8a164169eee508d8bcad1ece%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637466799090087255%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=reQqTGFCsEXvHOmSt8c4B6idrotIS4Q69WKw%2FRtpAEg%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
