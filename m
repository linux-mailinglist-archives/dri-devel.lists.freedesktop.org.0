Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCA17F0F9B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 11:00:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8C410E045;
	Mon, 20 Nov 2023 09:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::606])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2148D10E045
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 09:59:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSNoqBDHIQ7VRGPH3wrOZh78CCxdqKAiCa49ky/Z0OOjUhIIBrhRqtxZp0kofZnPWTIywZ0IZuGo8cmX/OCQvhpMn/uyF5p2l38MYnznc3pY1QK+ype5jk/y8y0ol1q6mXXqq85xG3gTPYMCzzJrb+r8v1+6znzCYGjNkGlA/1rfx0OkEtttv7pLB/MdCiFzTNS7TnLGB0TMWwh2HbPKJE343gXr6kfpHYYIns5fGduX08oZtsD+JXwn/KlQzj61ij1+GctlOgrTU4HPQznc/k1BK4v3IbkSMg4HFSBtdMVlZgtmTUMDdLbdP4JCSHR8WF64ByDINp8rpVHWOqPvFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFrh/sC7ndqdMaGUxMamCl3xy+XKX/8AaSQFawSJf2c=;
 b=hZouQWpLBmO+SZcFwSsHnxZjaPkx68RIDQpPmPCG3XneW3vuEd77FFmAoNvRzjsFx/8osje9c7cCzEOj4mmEdCy2CMZI9YE61dguO/SiKq2p5Y9b5Td97458DWLHQAPOyLQMqnhfB1tkODkvnixadloVaCwCv4aE6wEbcT2D5kgSZydKHlGlGc1qPJ/si+2nd75OC3gGVfq6t8rzFjCXMkk+7w6tpMF+WiijDnuQ47Wa/QLJ38dT2MfMNXvpCzhFE2ipQFoAOaHLiiX8lqCxtW6ldJ50+rSuwWzTeM8OA1P1HYvbCJsPuvUzDU96sipMVolwL25uh9Fr5MXZGT7rHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFrh/sC7ndqdMaGUxMamCl3xy+XKX/8AaSQFawSJf2c=;
 b=ZXDVaxP/IDbd7mUlciA5kKraxuIUlZIWqmTJ3O7irmcqdvERKi5yyqMAZKUkbcZygAkjVqCYRu76YlUoXZKMO7EeUTF+cXVXthQ+0k4hc/WmV0dzOT7kA3Gy+JcR3JxJAVvNOo5rESyd5Qg7hcyAYDMGE7ogT/6PyQwAWJhiW48=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW3PR12MB4523.namprd12.prod.outlook.com (2603:10b6:303:5b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 09:59:50 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 09:59:50 +0000
Message-ID: <4ff92772-9194-42db-b8af-8024e1fdf59f@amd.com>
Date: Mon, 20 Nov 2023 10:59:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: Replace strlcpy() with strscpy()
Content-Language: en-US
To: "T.J. Mercier" <tjmercier@google.com>, Kees Cook <keescook@chromium.org>
References: <20231116191409.work.634-kees@kernel.org>
 <CABdmKX1oNw+quAd+ALcgGoz-PPsvy=O6YM4f2_SmP+dQBddzAA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABdmKX1oNw+quAd+ALcgGoz-PPsvy=O6YM4f2_SmP+dQBddzAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW3PR12MB4523:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd0e950-2d36-4e28-a66b-08dbe9af6f43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jvhKcHeoH3d+DNh2eztHUQeuZdT67txD0KPKCwosdqLqoWYGcKuisRlvSOB1EhGcTXXRLGOLHMoCiLeF6+kXMg9q1h1nH38KuqmMPuqMLboH9RXD6KL267RDH81CLjLn4bS5tkAaeWJbSG9DkO8TxqRd60dmgjtkMMbfA5HTwBGw+aLGf7xkJol59/jhlgyk0G0NW4ElT7fOS4YEwL6Lbrl4QD/CU7wGMNnuQAUtDobBW+YlqlVhxUDnm/SI+tUbxYRoEQtkEbZcmqQyGaLZsPm518UrI7UJsqKWUAC61FS8mD/9g5mzq+MXNDp4+K7a+R0w7ClaVfnMexdsvyjLRvqk21Euz2hf2/r/Zz6d32TdUTKhYotGDcRFgScp/I46w324BldTRqMT7kDtZDkFl/ZFIIhsiO2corWHMQenD/8FPgwWA0W5RD/Wtse8JwyRavCXWBU+noaQm+Y2hEhmfIUcMocSGc8LHAifX1ujrapkf6jQABQRtBnRWroG0WIHpiM+YdSoPTggM+EhhIjESCCQHTvycZSXXSHXFlY9FZ3jn6yb8gbGM//NYZmoxcji4mZYB4Xm+3IHeHtVSBXYPXDg3Qfs/5FUEcDdcSqfyxNXkki3FrnphSxkEbnRNg7dKTblCAC05oBkSfUQAieSlZbZHIVtQxcy2vVZJSHh7MeRUzr1ORyBFQJbERxO9Ju6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(136003)(396003)(376002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(2906002)(8936002)(4326008)(8676002)(5660300002)(38100700002)(86362001)(31696002)(41300700001)(36756003)(2616005)(6512007)(26005)(6666004)(53546011)(6506007)(31686004)(83380400001)(66574015)(478600001)(66556008)(66946007)(66476007)(54906003)(110136005)(316002)(966005)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjA2ekIwZDhNemZFYVArYmNkdWVwZ3EvYWswek83eGpDYi8xUUM2MWJlWndt?=
 =?utf-8?B?bXZBV0szeU9Yb1dKbjVNTDhWRDI0SnBjT0VKMVdFRGVNUVBXU3NuaGtqM0ly?=
 =?utf-8?B?a0ZYRzZmU1ZVSmFhbmhwL2dPcmRhS3pRZktoUHAzbVZGamR6Z0crbXNUZHR6?=
 =?utf-8?B?SVQ2SWxsZ3NCQ2p3alkrOU15R3lLN24xb0hhWnpLVE9ZajdKMGE2NzlVbDRS?=
 =?utf-8?B?Nkl5WnNPeURHSFFuSkpBLzM2MU8wRUNqYUVPc1YrQ0s0eXNFdnQwanpoT1NC?=
 =?utf-8?B?NCtuM0VVMGZJb29FN2QzYkltdHhZdzM2RDdWVG1KY3ZWRGFSSG5ZdTlqcSt5?=
 =?utf-8?B?QVlMc3Axd3NKcmdwUVloa0VLanZHSkpDRldvSWR6SUNCQUtscGl5SWVCOUR2?=
 =?utf-8?B?M3RURE1PeHJjcXBnSWtNVmpaeWdzWDFETmIzQkJNMzhZcVRTbklSMHg1Y3py?=
 =?utf-8?B?L2lvbzJjZlFDK0lCcGorYzdhTHpmaVYvZUNIcWpnYkd0clBYeXJSclJDQ2Nk?=
 =?utf-8?B?Yk1xcWFrd3o4djhTQjloNHlBZUZHNHpXazlyTTdiMUtnZUp1OFhQc3p2YVRk?=
 =?utf-8?B?RDUrZTRXUXJBUXNWVlIvT2NVM09UMGJ0TWFiVEdpRmNVZG1SOExMVWpUK3ho?=
 =?utf-8?B?OTdzcmI4MklwSTJxaGIyUEhQYTU0MCtYOFJLN2JhV3kyaEMwdzIyZ3BlcnIw?=
 =?utf-8?B?aTJUOEdqU3ZEU0JJMWFDUkxjZHUrRW5tMitZVDcvdngwdnRHTHZITHl5b0s0?=
 =?utf-8?B?R2EvOVVvc0pjRTdCMXRPQWtFVktNMmdoSmNsbVRNTFlsRC9xZTd4NmxXbkl4?=
 =?utf-8?B?eVZVYURucXNnMTY2QVZGSXlyeUkrVkcyYUN0VGdjWG1kUlZwUkdqNW90UWZI?=
 =?utf-8?B?Wk1BQ2xXSjZTRVBWUTQ0bk45TmkwNTk5cUdFb3BOVUdFaDd2VlRCSWJZQk43?=
 =?utf-8?B?aGRCZGJiZXNhVWZoWDQ0MjlEbFh0S3grVkRwVG5GSFRBQ0k1NzROaGVYU1l1?=
 =?utf-8?B?UU5VZUY5YVI3RCthY0ZPL0Yxekg4YkdoaVVPbXNDNzh5YkZkZ2NMVzhkcEJY?=
 =?utf-8?B?VUFpR05wWTBYTTFjYlRpR0NsUXNRaVRHUjFrNmxRSmk0Z2lweXhOOVBwTTI0?=
 =?utf-8?B?YUF5U1VpSjBhZW1MaU9qcXY2V3dMSnN1bFRjUmkxKzhQTXNUUEdnZXRRemUv?=
 =?utf-8?B?ZDcrUE8yYkt0cmh5WFJXWS9tT3YrdmEyRE9wRkY5TEw2M1pLREVZcGJnK2FS?=
 =?utf-8?B?anRjOTZzeEhGOFVTT0VqWG0xcURNTCszZjRXK2JwTlFUcFZjR2VDM1ljbmdo?=
 =?utf-8?B?YjU0VUtZYnJCd1V5WGNRWnRHNFprTzhKQU9pN3J5dEdQYjVSK3lEVGpFdSs4?=
 =?utf-8?B?MlRSK0lzOExsVzljdEJ1K3NwQ1B2ZzJ4VEJQeTZjL2h4OTlpU3ZoZEpxcnA3?=
 =?utf-8?B?dzlPb1dMY3N2WE1hNWlaOWxuZ2NNMnQxS1dxTUZTS0VkUVJzZFNrQmh1TkRs?=
 =?utf-8?B?WlQvQ01nVFZUNE0zeFBLUmpQWlZlRG9yM3h0eUQxK1ZQY3RrM0gxNTdyYUl1?=
 =?utf-8?B?dU5PMHVvZVBqZlplaUFDSUJmWHp5QVhETUdUWlcyWEtyYzVrWTloUVVqUlhw?=
 =?utf-8?B?N3ZCZnd6MklaNlNwTlRUUE1sMERWOE1RQm11MmVabUVtVmM5QUZXYVB2eHVN?=
 =?utf-8?B?aGcwZTl5ZGp5a01jWTdPeGE0NHpRVlU1Q2RwN1ZsKzFjbk9lcDhoOVFlcHpG?=
 =?utf-8?B?OUFMaThzcVpVajFNcWFOblN2Yjk4MXRLeVhvalpRVks4aUU3UGlTNERxRXVw?=
 =?utf-8?B?dTBMbEJxdVl3ZWEzb0lNVi8rVzgzYnp1TDczR29SRW5hc2c2L1ZQRUEzSUh4?=
 =?utf-8?B?a04xL0dxYkl3KzNUUjVHbGFFK0w3WEszOW8wZ1kxU3JId3cvTGg4elBhYlls?=
 =?utf-8?B?QVhpMXFlS2IybmhqRUZRTnpMVFdTNFBvRFdDTkRWR1o4MDdudnkrZFdpYnBE?=
 =?utf-8?B?azJOQUZKNWkvM1VxanVmZWFrVmdPbEw0YWZUNDloaEV6cVBhSWxYRnhBUDA3?=
 =?utf-8?B?K1VmTWduTU41ZHhkTE16MkRKRjMyOE5zdFZxOGpwYkUzQ0I0TVBtOWNpQUJt?=
 =?utf-8?Q?2lhY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd0e950-2d36-4e28-a66b-08dbe9af6f43
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 09:59:50.0857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YivVTmkAJGrSyJapH69LLPoAr4pkBBTerGKFYT/cSU663UBMeAQMIDt+MwVkPc45
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4523
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Azeem Shaikh <azeemshaikh38@gmail.com>, linaro-mm-sig@lists.linaro.org,
 linux-hardening@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.11.23 um 19:50 schrieb T.J. Mercier:
> On Thu, Nov 16, 2023 at 11:14 AM Kees Cook <keescook@chromium.org> wrote:
>> strlcpy() reads the entire source buffer first. This read may exceed
>> the destination size limit. This is both inefficient and can lead
>> to linear read overflows if a source string is not NUL-terminated[1].
>> Additionally, it returns the size of the source string, not the
>> resulting size of the destination string. In an effort to remove strlcpy()
>> completely[2], replace strlcpy() here with strscpy().
>>
>> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy [1]
>> Link: https://github.com/KSPP/linux/issues/89 [2]
>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>> Cc: "Christian König" <christian.koenig@amd.com>
>> Cc: Azeem Shaikh <azeemshaikh38@gmail.com>
>> Cc: linux-media@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linaro-mm-sig@lists.linaro.org
>> Signed-off-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: T.J. Mercier <tjmercier@google.com>
>
> strscpy returns -E2BIG when it truncates / force null-terminates which
> would provide the wrong argument for dynamic_dname, but
> dma_buf_set_name{_user} makes sure we have a null-terminated string of
> the appropriate maximum size in dmabuf->name.

Thanks for that background check, I was about to note that this might 
not be a good idea.

Linus pretty clearly stated that he doesn't want to see patches like 
that one here, see this article as well. https://lwn.net/Articles/659214/

I think the commit message gives enough reason to merge the patch, so 
I'm going to push it to drm-misc-next. But please make sure to triple 
check stuff like this before sending.

Thanks,
Christian.
