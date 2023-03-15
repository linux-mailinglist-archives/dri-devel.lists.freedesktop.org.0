Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE3D6BA873
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 07:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A52D10E978;
	Wed, 15 Mar 2023 06:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1b::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8C710E93F;
 Wed, 15 Mar 2023 06:52:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnIGa4bkFquuXCrxE9+j1anhsQC1T3IhzNm12CL1d/B/jHPSDI+WPapCM8BoUt6XoGKCKvzzfevryT28+RInI3rU5kF2qo04iCaoi+Hpvu8ulWCeTVts/wNRdCzQBLCMe54efLTI63QgMJQkD+qOWXQUg831yqxGZAAuARIsCmVfnpKSGt3WKzaZnwtlWp8qbF2rHWj4YCBmB20t4czlVX5XCLGB3H1C31U5kHn6iy3PgyV73gzurpqsQDnmlf00oDabSSoii3zIf3RKnf4Hk31N7BsMGVBU3QZZWPKOZKmqlpD5FrUq7u9xRV9TdLTPc9zNHLGtRhXAXf7Hw+6qmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CgJ/4y+3OdzOCLSAi9fZwcyeMn10s23vUP6pYpL7MAc=;
 b=ImUVv61nHY2pHMVtIhadU9+xT9XJCzt6HkHkDm9VQfslw/squVeUgfG1KePdO8LU+7w8DYhB+VMPjjXyy1zROv1bvf3iwK8iBmn+nn63DnckOnU0Qq+qGLRjP0KQDUleGpHPsWSNIWLBrHCPwN7i7BTrvYCY1tcv83W71Fs+K+x5bZ2vwOIKFPzUDGj49C6iZtcJtjSo5KJUVPu9fNvhm9atvQrNRve+QE+Da/YUdQPd4BQvJ4CuU8XUFPb8SjQcKrjyYDA4fxfkpy3bMRJpnrucbwiwnfzX4omUmDMj1rtPlku8Fyj47BLTHYvZU72Ch2t4RsaKfZkE5b4UWp5bPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgJ/4y+3OdzOCLSAi9fZwcyeMn10s23vUP6pYpL7MAc=;
 b=qatN1BYY9FSGqHsaFx+s2cKIQxO7tp51yot3GrHfM4JB9AePCjdCHJqTrmc5o2qmQx07+q3178WL0FGkSB+GYYGK9RlUYk3/LgndaZphixx+BCcsIXh3+MMS3rM3I8Mj0bDql35rzzcq49dJiE1cdWFCpoxlY+8EeObAOJcj1fMJK8lh1q2j9ot14WHvP0xJN+CfieltFwT9Jexr6vAJvglzm+ycCAav7ABdns+lVilK2SCCnSAlOKjjDHUOiln37JjSrTpEKESPXfArwq2DMHebd98m/tGAasj78L1zAR93IECqziFXHano5HI28N2jzib56oq069acRXc4uStHtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7445.eurprd04.prod.outlook.com (2603:10a6:10:1a7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Wed, 15 Mar
 2023 06:52:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 06:52:23 +0000
Message-ID: <d7ce665c-8fd9-30b4-bf86-8d6907a2c17a@suse.com>
Date: Wed, 15 Mar 2023 07:52:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 1/5] x86/xen: disable swiotlb for xen pvh
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>
References: <20230312120157.452859-1-ray.huang@amd.com>
 <20230312120157.452859-2-ray.huang@amd.com>
 <ea0e3852-87ba-984b-4010-5eeac3d6c507@suse.com>
 <alpine.DEB.2.22.394.2303141747350.863724@ubuntu-linux-20-04-desktop>
 <ZBFGJUE0ahA4R9gr@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBFGJUE0ahA4R9gr@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7445:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ab30859-5335-404a-e1e7-08db2521d48f
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n+1ZWZD0Sb2Exclqn0QVvcLfOIxb2pLTBEeGlUnxDPzgdikS+yBII6WTM/0XRUPJc+gCShZDIo02xkeZEzANGOm1lo4beQRF821W98yKue1+mPl9y0bte97VCZrzs2tKaZgcXQV5Ztc3I8r5y4yVixPY7yCwn3lr5csiOifQ5RWohJFPByXO8HfqUJ7AAataIPP1nU1CF4hpauVs5c5GlY3+NdNBWhd0cOrXj7jt5vREkdKnbc1xgoknZrtAdha45foBZ2JsaqCqw6RSDvZmScmKZcY7UZ/cijivC2N+e4/2Lp/tDTHbBKkfubJtjxKA5rvwA9Gim8yHGHS7Y+v4h6ZyYngzexha5EdqbFNETd/I6hGxAohK2qB9jtz7xsTEYQugEaRcItkmYlUU3ETArWqWUT6NvyZ9+17fbGsfFEPnOXcR5YOTl1tvSYtQcYwRpivno+BQRmi9cqC1+gAHxMZzw/YKNJmmDWMh2mP/sss1a1uruFmYXDVW/1Nvivm9XP2yGzbiLxGkrN70THCr2muLwKwIoiKyuffKf1KfPOnaoUlf4mDeGBbJQm2e+F1ynyBy7mFtRDIlmUZkyr3TmBW12Sxg/fx4+jox15vM+x6AkiA9QxhkKT9YvRCT9loT7QMy9X6ldqOel1fS7s+lLV5xZjMUg4QOHGkfnwVwPNyyHax+90XDh8vdne/DQzhH2lDeQsjKv/D1cBnDzZzdzcVL755dV0pNsQiQTIHXg7Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6560.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(346002)(366004)(39850400004)(136003)(451199018)(36756003)(7416002)(5660300002)(83380400001)(478600001)(6486002)(6506007)(26005)(53546011)(6512007)(2616005)(186003)(66476007)(66556008)(66946007)(8676002)(6916009)(41300700001)(4326008)(8936002)(31696002)(86362001)(54906003)(316002)(38100700002)(2906002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFZxOElXbFVHMU5FOWlIcVBmdWJBK2dSKzl0TisvdFhZS2dUVXZpRnlMSktt?=
 =?utf-8?B?ZXJYRlZQSUo5OWhBS0ExQysyaXkxdHdWZmFCT1MrRXNwdm5ydHRSU2lkSC9O?=
 =?utf-8?B?cGxwNUNPNHpDajY0a1UwcTlFWkRvWk9taE92RStzK1RYT2ZSVDBreVhNK3ZX?=
 =?utf-8?B?aW5XWTNQYmFFaWNLcmkreEE4OVoyMFA1MnMvMy9LNnkxOVBTWndFd2tHckxm?=
 =?utf-8?B?RDhYQ0lRejh6cjNXVjNOYTF2VUwrbGhxQXUzVWxsN1F6ZDYrcUJMWm5TMjdx?=
 =?utf-8?B?YUE3Wko5MU5LUHF6TEg1UkxRemVZRDYzM01wU09Dc3VsTVlJODM5dS9pQUp3?=
 =?utf-8?B?Q1FIQUoxRUFHR05yUmpIeFdVWDJSaFFpc3A2SlYxZXNOTS85VUV2RE1DRmpr?=
 =?utf-8?B?TlVDWS9wcXFFKy9FalhMMjI4dWpFOXJ5elpPaHg2NDJ5U1BpdURldWtSRmNV?=
 =?utf-8?B?cmNuUHpvOEtCWmd5WEN4WXNjT2hkVStKRGtIUTV5a0xnTVBsZVhKMVJVU3N0?=
 =?utf-8?B?bksySmpVU2YrSkJHSzdFQVJuTVc1RlJ6VmtHVXJLcFovbVdOaGgwbElhdzlz?=
 =?utf-8?B?RWFoeWVsZ0RkakVIcjNNQlp0bllOZHdIek1nZVVNK1NhZnlRMEwxZUlISEpy?=
 =?utf-8?B?OXBaYThJaFp1bnVJQitMaklEb0htRHQ3dHBlbXR1OXdsUGVEY1BQUkMrRGpt?=
 =?utf-8?B?cm8renJudU9oOUttWWd1ZkZDMUpmdC9OSThFSzJaaW40YTVRQ1lKdzhVbDFz?=
 =?utf-8?B?QlNNcWxEcXByejFEUGJGb0sweFBjL2pHWEtTTzFSU3VTa1Rlc1RrUTNUS0k2?=
 =?utf-8?B?dnRkdDBKM2svcE9ieHIzUlBqbFMwdXBHWUhkenc5R2tnL2NyT1FhODV4TVlU?=
 =?utf-8?B?UzgrZHhvSy9DOGhoR0U3aGI4VXpJSW53ZWVKazRYNC9mcjhsWHJuTXorNjAv?=
 =?utf-8?B?TC9ndW1hZktmRXVIMmp2R0FTbTRSUEF3M09pei9HeExQZ1IvUEVCdzhZTkxD?=
 =?utf-8?B?REQ1dzMwRy80M2RsSzFpcndwMlZqeW95VFlRNE9BL1Vmd1d0S0lNWGRLNExB?=
 =?utf-8?B?MndjN1FXS2hkS0pjL1VXUldWOEp6ZGY5UUxxQ2g1bGthcTFvanBNdmJTaG85?=
 =?utf-8?B?S0JBc1JGVG9IeGozQUlNNkxmSXpxbVJxRUt0VjZKV2hCdmJKd21vTUgxRTIz?=
 =?utf-8?B?VHFYckhLQ3RkT0ZKN3N1YVRvaEVCN3lNSVFJL1dnTHVlYnNDeWJPNVdFanRT?=
 =?utf-8?B?TmVuTGU4a0tycGNMSDdpZE9IMnBTWjhQZXNqOCs4OFlZWjFyUTJLWldPQVA5?=
 =?utf-8?B?QUpST3pQQWVXNDBiUlVKUGdBWHFKcHJ5VFZHWldqOFNXL3BNcUN6SkpMUW9V?=
 =?utf-8?B?bmc3UzBhNjI3UFpWYlVaK1IwRUJISzhYcld0SzBqcGZpdGNzeHVKQUVoMTJ0?=
 =?utf-8?B?d1hEYjByNmFoR2w4T2VxdDlJd1NITWNyZHFKL2lNMjFZNTU5eDR5eExGSDJE?=
 =?utf-8?B?bmc1R3lGdEdTSDl6OEgvdHVUT0NNVEpUNDlsRzk3VGoxbWdUeGhiS3RRZzVv?=
 =?utf-8?B?SnhReWxHbzdybFg4b3BPNG00Nk9wSmRqbWNHNW1DeGhmdjZ1NEpoaE82QVJj?=
 =?utf-8?B?UDkvRk5qcGRiS0ExY1laemJLYmlBcStaK01JNFdRSkdxYmVPWG00bEZqa2tp?=
 =?utf-8?B?ZC9kRTdoL1JXVUw5dHI2ZFQ4dGdLeFZTZzNBSVFrREFHbUlGTjQ0U3VoaktK?=
 =?utf-8?B?VFBwUEZ3d0tQYmJFSkZiZzkvVmxUamtQRVBmY3pJeHJ5YTk1cy82RWkxcm9W?=
 =?utf-8?B?b2gxeE5ad1d3RGdnUnc0YytEMDh3eFRTVG91ckpwRVdTZXVubkg1ZCtBVERT?=
 =?utf-8?B?bTNqTUdrTjNzTVM1UFZrV2hCZnlDSEorcHA4UFZDUjZDRGpQbHVZSFlMZ1NQ?=
 =?utf-8?B?WThkdFRYM09hTW1zYXhxWTdBZVNPcENKMDQ5cG1NbUJwa3VjeDJ5SG9DSFB6?=
 =?utf-8?B?a3ZPbEt4U0U0ejFtZ1BLckNqQWxyVk4zaU5wUCtrdDB3VHVudithQWFKS25T?=
 =?utf-8?B?dmhVejZQcDdxaEhOdjZUZlZGdkYwTG15S1RFVE9NNXJCYnBaVnh3OTk4emQ3?=
 =?utf-8?Q?P2WZO67KXr6oqNfqShydK7MC7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab30859-5335-404a-e1e7-08db2521d48f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 06:52:23.6373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wr4FUz3W7QSC9tI9ic70Pzda7tkaVKP1LzrYWRXKqav1dVtehgFBqtJQDjjYRCAdjixh+btX8ceg8rXymBYJFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7445
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
Cc: Juergen Gross <jgross@suse.com>, "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Xenia Ragiadakou <burzalodowa@gmail.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Zhang,
 Julia" <Julia.Zhang@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=ef=bf=bd?= <roger.pau@citrix.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15.03.2023 05:14, Huang Rui wrote:
> On Wed, Mar 15, 2023 at 08:52:30AM +0800, Stefano Stabellini wrote:
>> On Mon, 13 Mar 2023, Jan Beulich wrote:
>>> On 12.03.2023 13:01, Huang Rui wrote:
>>>> Xen PVH is the paravirtualized mode and takes advantage of hardware
>>>> virtualization support when possible. It will using the hardware IOMMU
>>>> support instead of xen-swiotlb, so disable swiotlb if current domain is
>>>> Xen PVH.
>>>
>>> But the kernel has no way (yet) to drive the IOMMU, so how can it get
>>> away without resorting to swiotlb in certain cases (like I/O to an
>>> address-restricted device)?
>>
>> I think Ray meant that, thanks to the IOMMU setup by Xen, there is no
>> need for swiotlb-xen in Dom0. Address translations are done by the IOMMU
>> so we can use guest physical addresses instead of machine addresses for
>> DMA. This is a similar case to Dom0 on ARM when the IOMMU is available
>> (see include/xen/arm/swiotlb-xen.h:xen_swiotlb_detect, the corresponding
>> case is XENFEAT_not_direct_mapped).
> 
> Hi Jan, sorry to late reply. We are using the native kernel amdgpu and ttm
> driver on Dom0, amdgpu/ttm would like to use IOMMU to allocate coherent
> buffers for userptr that map the user space memory to gpu access, however,
> swiotlb doesn't support this. In other words, with swiotlb, we only can
> handle the buffer page by page.

But how does outright disabling swiotlb help with this? There still wouldn't
be an IOMMU that your kernel has control over. Looks like you want something
like pvIOMMU, but that work was never completed. And even then the swiotlb
may continue to be needed for other purposes.

Jan
