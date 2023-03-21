Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7695C6C399B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 19:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDEA10E262;
	Tue, 21 Mar 2023 18:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE57C10E262;
 Tue, 21 Mar 2023 18:55:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7pkNXMgQqmaJ3UqpDNpQs4fkpF9LO7Ruuhq0uwujX+tyIgPRMZJKSAffXdrZQBhZuPz83awoExqoP9RMU22ATyYEHklrtEO3jdkZ27/75XxF0cLndSU4NGjlY6GJd4QrC/QOEnQ89vlcm2qU5YbnZhOaIm+qVGyBFzXLmUf3kJyznjXpczFF25BSFpwTQsgdApp3Sr7FOY3Z0jh0G58hEIEqpbUOfHeMFSpCRYDeW3xTn48QJdogoJHNAziSUNa6Iyj4wtkZcgTlgswx2CEtOocUXxkWFn8EXq6lG633B5avcpAzSs8smIGXm6sPAV5PWWGe5hYMpZSwL5L55482w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HV5tAZkMTA86CnxwVywC1hyOWM5EHGs520IjmM0K8Gg=;
 b=WbPs7ohsONHpWW1XVJssmHYCsjvPbFUAcqaJdUAZ6H8bkUO/Zja1O8NjRV4wNyWV32cYujmoHKQ+oDgxqoUA1rsLcomRIZt60RBmT/oTOrQzRhH3wk48pwR3BLKG0gVnoW7e0IY8abkN8S+aupkv9rY3Ts+xLRUXy8nbQmDeiohyuZoj0xyt/Ds5XlpKHcYrzCz14gWNJ6IwZjGJTo9esU5SNsSGzApOusUWGmqYI68wBt3LOHi0ha6VPcNZAqzp7UGkn5gYPVnmrrbXTqO7WBRgx+7jC2XvuLObnlNpXNZYCTWoCmJ+YNUOeadBRGgHtXEdzzysETHj5LvKyE883A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HV5tAZkMTA86CnxwVywC1hyOWM5EHGs520IjmM0K8Gg=;
 b=Z1QGzfeQZwpR/cl8QSudiwCeWSHybMLVGPXCXk4v4yZFqPuodtOD/N05WVJ4cYTAkD+5k/YqAAODCbDlsLhlvwp3sAyehWjQD3PzYjxFBKjvWDBbd59NZAqgc5oGx/8RGhgcBnG44x6c+xw4akQ2J+1I0LnHL/3RDTF6rtW8Ab8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5239.namprd12.prod.outlook.com (2603:10b6:208:315::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 18:55:28 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 18:55:28 +0000
Message-ID: <69f0ba3b-c7a7-a059-3cd4-181a9d474320@amd.com>
Date: Tue, 21 Mar 2023 19:55:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 1/5] x86/xen: disable swiotlb for xen pvh
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230312120157.452859-1-ray.huang@amd.com>
 <20230312120157.452859-2-ray.huang@amd.com>
 <ea0e3852-87ba-984b-4010-5eeac3d6c507@suse.com>
 <alpine.DEB.2.22.394.2303141747350.863724@ubuntu-linux-20-04-desktop>
 <f5e03f2a-8176-528f-e885-9a97940367c0@suse.com>
 <alpine.DEB.2.22.394.2303151616200.3462@ubuntu-linux-20-04-desktop>
 <5e22a45d-6f12-da9b-94f6-3112a30e8574@suse.com>
 <CADnq5_PH9ZqDqpPES74V3fB3NVpaexDoGTyu_+-zoux5vgagyg@mail.gmail.com>
 <dcb54275-b21f-a837-76bb-e19e331a0666@suse.com>
 <CADnq5_PpCWrZzQdE_X6ZnuNU3ktVeC6TbmE5vq3K6rCAdB8GTg@mail.gmail.com>
 <d256a967-f50e-2e19-1985-aa9cfc0e8b18@suse.com>
 <alpine.DEB.2.22.394.2303161603200.3359@ubuntu-linux-20-04-desktop>
 <CADnq5_NnOApcpkKb3UqAKAcS9s_gG3Lq4ssJDgCjq5ZQty2rnw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_NnOApcpkKb3UqAKAcS9s_gG3Lq4ssJDgCjq5ZQty2rnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL1PR12MB5239:EE_
X-MS-Office365-Filtering-Correlation-Id: 04968f21-c04e-4f23-876f-08db2a3dd654
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: upyAIgScAZ4yXuW85QaOIok1B3L97K3FKfrBnIKaNyye0XKPTHqW5h7NWB68IbY+kAf75mwzcIcBKj8r3d8Qyk1vt+iQ7sBrMGAVpUsujNsCYwElvJRhUE1ItS3GnTUL1G5tFJKHzHlhDp0LywgZJAe/jLABydSfgmKsFfQnHiRlOoUMJETYG786aSL2/ynwKUtblzAI3ot9XhaFxQLpw5t1LsW3iqXFrYcNTOqtmUJJyA8BKv3SmuPi12Jxg5F/8f/0RDpRs9rrQ4fVJv549O1lU1/i7JsAqJo6g5xA54GRdrhywZ+DamcKpFaXblgcjc3FA40JMUqmk8SovZHyIXUhXkKhIaIuID1XKYwPl7ceuAhXMSkEbUWTUEbr9Xb2MHgKx0Voz8OYBzm5mdIC6xicLiBVWVPbjUxuTnX0z20k6RBS1IstM031i6jpT41hQAWJcIZ4zmPU4siwQ+fPHLNPtqMbfDpMAkiTAGD++t3sPDVJgO8i4JWzeomluc5v49UaKI8CY1CakCgtvMr/ztA/Lg2JKZCsVkJRy4IKKeLsus6S4TLPKp5Wn1h+MxoPMv0DgJ0RBkwuy4JTLwkdLz+NXVzHDWYN+OevWvA2xj+UK01l1h0njHNk0ZFvaplsJPUaHjxRY1PM7Bn6PLAVj5mDhEymuAqywlA7gYV54gMXQTW64POi7AXbUs8BrALs1lVKjapzOIdx5e0S+Lt/QNWkcXc95f9DiXmAo1EMFw8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199018)(31686004)(66899018)(2616005)(54906003)(83380400001)(6512007)(7416002)(53546011)(6506007)(6486002)(478600001)(316002)(5660300002)(6666004)(186003)(31696002)(110136005)(86362001)(38100700002)(66946007)(41300700001)(2906002)(8936002)(66476007)(66556008)(8676002)(4326008)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0hCVlgyNUhjbm42NUtOdGx3cUhuQm1CQnBoYlplaFhmTFVibzM2TGthN1Zm?=
 =?utf-8?B?ZkIwckFzV1g2MmRPNlRVR0RsYStnem5lT2VydFNKUWxpRTJWOS9UUEVrWWMr?=
 =?utf-8?B?VFNpN3paektrMVJramJmNTVzSkticllndDVldnNXSUFJOTF5ZkhodkhTNVlt?=
 =?utf-8?B?R0dRSjQrbzBWTVRIQUlMMlF6MWNaY2NrZUxuQkY1RGQ0dUI0TkZZa1JvSHRO?=
 =?utf-8?B?NytsL2ljb29rczIyZWcvckJ4Wkp6a2REVUFkdU43VXpCdWVkKzFzZTdjR1lD?=
 =?utf-8?B?WXNiRGZXdjVaMkFSV2kxRUVORDNJTElqMHFXZGhLTDlaZ1ZYb2JLb2txYlp5?=
 =?utf-8?B?d1BKL3ZkcEZsN1BocDVWTjdlRW0zbko4OXpMN25BTkM2cUFGUW4xVzdPbnBT?=
 =?utf-8?B?eS93aS9XTzhGZk1MWmtIb3ZhTVVvM3B6N1pLSzlJM0M1SDNoTHdrSlB2b0Z6?=
 =?utf-8?B?RWRhT3JFVHNKSW80TUUzbm1kRnBLSzU3MEowaTBDemRpbCtVNHlJdHBCRU0z?=
 =?utf-8?B?RXpMUXJ6M0t6Ukc0aEQrdUIwb1BjVFV2b3k5MmhkR2JDbDhTZFFhYy9RcjY1?=
 =?utf-8?B?L0tkV1VoVHY1ZzRvUCtsZmVBTWRiR29KWm9oaHFwaG1JaUNObHNKbFlPdlpX?=
 =?utf-8?B?cTd3OVB1VXlNUFpoMXBBblM2WkFRdzR3NE4xZ1lMM3lpV3lCYmdQU3NIMGcz?=
 =?utf-8?B?bW0wU0xabEV6N01taVhnbHlTVXcxZXRHVGxJWm1OZ0lIQTVPa25JWTl5T0d0?=
 =?utf-8?B?SmFUNklQN1huRzBEaXcwKytCWFJJM1ZmZFdkcWw5SW9uRFFoVzhmN3Y2aVhz?=
 =?utf-8?B?UnBiSFc3TkxZZzUwTlFhOE05SVROMDFwNWlmTldFOXVhNGtVZXZJaEtyS0cw?=
 =?utf-8?B?OXdrQnRTVFhENGdBZVlVWjR5c0ZLTlVtY3FpWTBYOWxROXRmTTRob2RIM2kr?=
 =?utf-8?B?UFhHenFLYW1iME5LWVJKSVBnTHNLMlE4Wml3UW1FZ2xWR1VqeHY1NWh4UzQw?=
 =?utf-8?B?V0NvZGlNV0hzVXBrUll4M3k0TkJwM0FhQUx2WDc1SHVFeGNnVmlXVzUzUm9z?=
 =?utf-8?B?MFIvYkp6bEdCcjU4dkVYY0I1WjNJL2ZxNGVWK0JWREZLWDhEWlFOemlQbWd0?=
 =?utf-8?B?aEpZNnpZcDc1cFRxTElsWExDK1BqR0xhVTBqU1IzdXV4L2hTSDF2NVJWRzZ1?=
 =?utf-8?B?ZU8xb1NteVI3NGZLRmFLZ09NdjJ4TS9aMHZsNk1zTG9leFpkRXlCYUFja2VC?=
 =?utf-8?B?SVZWTDgzcWozTERFRXhBVWEyWmFiWTZHTGI4WFA4a0UvM3lnMVQvNDR2UmYr?=
 =?utf-8?B?RGlUMHIyUWw1REVtNDlLZWJiLzhoMjVxdTJ3WlhVUXRnZnpidGJGUldRRVd3?=
 =?utf-8?B?NG1iV1lJU3Nzb2t4YWVVZDNhbWtQeE1wTitUM0JvcTI4U3h6OUN2dzhlMSt5?=
 =?utf-8?B?dFpHMEE4OUhmNU03aFFHK25iZm5HSmhML1d2SHZ6dzd4b3BQdzFIbjhONUR6?=
 =?utf-8?B?QVNYNlF4bjAvMHhsc0NsSEN2NHFPaDBvNHdsSU01SWgxMXBtTUxnL3ErU3dN?=
 =?utf-8?B?TUhVN1cveFJleHVncVJmR3kzQ0pVd3JvZ1JFUG1KMGE3YVNqYU9MTDdUd0pW?=
 =?utf-8?B?QkRPNWRVWnE2Ym5DSWhJRnBkamJ4NUhMM01rdWZzSWphNUJ3VllWTy9sTDha?=
 =?utf-8?B?NEp2VGg3M1g1alJJcXVaak5SVGRKRklZUG5MSDgySXpiUzFxY0txd2NuZXkw?=
 =?utf-8?B?cU5GY1hpRStDNDVIMVZDOW9PbWt2amN3R2pab1g2cGlIOG5qYityeG8vRlBV?=
 =?utf-8?B?ZkRtL0FLTHpNVU8yWHU5bzc1UDY5dEV6V05NVjVxVHplNjFncE1pRjEvY2JZ?=
 =?utf-8?B?My9Bd29meTNxNHgvWnBIM2Z2dFBUMnFVa3VSQXd4UGE0SnU4UStOcCt0SFZO?=
 =?utf-8?B?bmhZODhMR2pHVmVXOFVPcTFYRlp1eXA5WDRXaXZXOWkyTXd0MEYrajFrbW10?=
 =?utf-8?B?OUtDdEJ3UFhMVEVtY0tJeFhZa1NsQ28vUU5qeFp2bVVzV1FWVGsxdVRESnpo?=
 =?utf-8?B?QmdVb1kvK3VScnNhMGh2Z1RQVXJFeU5CbldhY2MzNkhyeFNCcFJQSkcwMjlm?=
 =?utf-8?B?ZFluWFNsTlY2anVWTE5nR0YveHpLT3BSNXErdXdTREVHa2FnMGdiWDZaTXZC?=
 =?utf-8?Q?I4/LN4AFkDkiyX37jnGjFAg6x8C656fmxT996YZ62jsn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04968f21-c04e-4f23-876f-08db2a3dd654
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 18:55:28.2636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BVkc48WqdHlFqzYAggFI/RtiIAxjqxcaZ8aZLZwZcsYsaARJd84s519Jkb/62Sso
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5239
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
Cc: Juergen Gross <jgross@suse.com>, Honglei Huang <honglei1.huang@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>, Chen Jiqian <Jiqian.Chen@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Huang Rui <ray.huang@amd.com>, amd-gfx@lists.freedesktop.org,
 Jan Beulich <jbeulich@suse.com>, Alex Deucher <alexander.deucher@amd.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Julia Zhang <julia.zhang@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.03.23 um 15:45 schrieb Alex Deucher:
> On Thu, Mar 16, 2023 at 7:09 PM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
>> On Thu, 16 Mar 2023, Juergen Gross wrote:
>>> On 16.03.23 14:53, Alex Deucher wrote:
>>>> On Thu, Mar 16, 2023 at 9:48 AM Juergen Gross <jgross@suse.com> wrote:
>>>>> On 16.03.23 14:45, Alex Deucher wrote:
>>>>>> On Thu, Mar 16, 2023 at 3:50 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>> On 16.03.2023 00:25, Stefano Stabellini wrote:
>>>>>>>> On Wed, 15 Mar 2023, Jan Beulich wrote:
>>>>>>>>> On 15.03.2023 01:52, Stefano Stabellini wrote:
>>>>>>>>>> On Mon, 13 Mar 2023, Jan Beulich wrote:
>>>>>>>>>>> On 12.03.2023 13:01, Huang Rui wrote:
>>>>>>>>>>>> Xen PVH is the paravirtualized mode and takes advantage of
>>>>>>>>>>>> hardware
>>>>>>>>>>>> virtualization support when possible. It will using the
>>>>>>>>>>>> hardware IOMMU
>>>>>>>>>>>> support instead of xen-swiotlb, so disable swiotlb if
>>>>>>>>>>>> current domain is
>>>>>>>>>>>> Xen PVH.
>>>>>>>>>>> But the kernel has no way (yet) to drive the IOMMU, so how can
>>>>>>>>>>> it get
>>>>>>>>>>> away without resorting to swiotlb in certain cases (like I/O
>>>>>>>>>>> to an
>>>>>>>>>>> address-restricted device)?
>>>>>>>>>> I think Ray meant that, thanks to the IOMMU setup by Xen, there
>>>>>>>>>> is no
>>>>>>>>>> need for swiotlb-xen in Dom0. Address translations are done by
>>>>>>>>>> the IOMMU
>>>>>>>>>> so we can use guest physical addresses instead of machine
>>>>>>>>>> addresses for
>>>>>>>>>> DMA. This is a similar case to Dom0 on ARM when the IOMMU is
>>>>>>>>>> available
>>>>>>>>>> (see include/xen/arm/swiotlb-xen.h:xen_swiotlb_detect, the
>>>>>>>>>> corresponding
>>>>>>>>>> case is XENFEAT_not_direct_mapped).
>>>>>>>>> But how does Xen using an IOMMU help with, as said,
>>>>>>>>> address-restricted
>>>>>>>>> devices? They may still need e.g. a 32-bit address to be
>>>>>>>>> programmed in,
>>>>>>>>> and if the kernel has memory beyond the 4G boundary not all I/O
>>>>>>>>> buffers
>>>>>>>>> may fulfill this requirement.
>>>>>>>> In short, it is going to work as long as Linux has guest physical
>>>>>>>> addresses (not machine addresses, those could be anything) lower
>>>>>>>> than
>>>>>>>> 4GB.
>>>>>>>>
>>>>>>>> If the address-restricted device does DMA via an IOMMU, then the
>>>>>>>> device
>>>>>>>> gets programmed by Linux using its guest physical addresses (not
>>>>>>>> machine
>>>>>>>> addresses).
>>>>>>>>
>>>>>>>> The 32-bit restriction would be applied by Linux to its choice of
>>>>>>>> guest
>>>>>>>> physical address to use to program the device, the same way it does
>>>>>>>> on
>>>>>>>> native. The device would be fine as it always uses Linux-provided
>>>>>>>> <4GB
>>>>>>>> addresses. After the IOMMU translation (pagetable setup by Xen), we
>>>>>>>> could get any address, including >4GB addresses, and that is
>>>>>>>> expected to
>>>>>>>> work.
>>>>>>> I understand that's the "normal" way of working. But whatever the
>>>>>>> swiotlb
>>>>>>> is used for in baremetal Linux, that would similarly require its use
>>>>>>> in
>>>>>>> PVH (or HVM) aiui. So unconditionally disabling it in PVH would look
>>>>>>> to
>>>>>>> me like an incomplete attempt to disable its use altogether on x86.
>>>>>>> What
>>>>>>> difference of PVH vs baremetal am I missing here?
>>>>>> swiotlb is not usable for GPUs even on bare metal.  They often have
>>>>>> hundreds or megs or even gigs of memory mapped on the device at any
>>>>>> given time.  Also, AMD GPUs support 44-48 bit DMA masks (depending on
>>>>>> the chip family).
>>>>> But the swiotlb isn't per device, but system global.
>>>> Sure, but if the swiotlb is in use, then you can't really use the GPU.
>>>> So you get to pick one.
>>> The swiotlb is used only for buffers which are not within the DMA mask of a
>>> device (see dma_direct_map_page()). So an AMD GPU supporting a 44 bit DMA mask
>>> won't use the swiotlb unless you have a buffer above guest physical address of
>>> 16TB (so basically never).
>>>
>>> Disabling swiotlb in such a guest would OTOH mean, that a device with only
>>> 32 bit DMA mask passed through to this guest couldn't work with buffers
>>> above 4GB.
>>>
>>> I don't think this is acceptable.
>>  From the Xen subsystem in Linux point of view, the only thing we need to
>> do is to make sure *not* to enable swiotlb_xen (yes "swiotlb_xen", not
>> the global swiotlb) on PVH because it is not needed anyway.
>>
>> I think we should leave the global "swiotlb" setting alone. The global
>> swiotlb is not relevant to Xen anyway, and surely baremetal Linux has to
>> have a way to deal with swiotlb/GPU incompatibilities.
>>
>> We just have to avoid making things worse on Xen, and for that we just
>> need to avoid unconditionally enabling swiotlb-xen. If the Xen subsystem
>> doesn't enable swiotlb_xen/swiotlb, and no other subsystem enables
>> swiotlb, then we have a good Linux configuration capable of handling the
>> GPU properly.
>>
>> Alex, please correct me if I am wrong. How is x86_swiotlb_enable set to
>> false on native (non-Xen) x86?
> In most cases we have an IOMMU enabled and IIRC, TTM has slightly
> different behavior for memory allocation depending on whether swiotlb
> would be needed or not.

Well "slightly different" is an understatement. We need to disable quite 
a bunch of features to make swiotlb work with GPUs.

Especially userptr and inter device sharing won't work any more.

Regards,
Christian.

>
> Alex

