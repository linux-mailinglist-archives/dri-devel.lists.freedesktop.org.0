Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF95C522CC1
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 09:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8836610E0AB;
	Wed, 11 May 2022 07:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2044.outbound.protection.outlook.com [40.107.212.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56DE10E0AA
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 07:03:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQ8CvQReG6S7IfuGhVNTsqkwrOG12bfQUmJFOnGgH9usDfpUoTpW5qeVawHtpWWPctz2p+QKMcifpntfSwCjmnbflOdNLrkXnxFcQ+n0aSqab6l6NIO8JMXgS2s2HeIYmBUQBXzTRF6yXwbzifEvviSwUgqwR26dXEoy/+Bt3W2TRC+F2udu2br9w6w8kKXHrbqwPOMP7xGgEfCmErR9Y3//8uq3AoK4LvzSpcjEZMuxEd0X17sv6hSb7anoKahZpuDi0gIStWMCO01oJg631HclOI8Qc62r5Nwi3CeCyNtFqkW/T1jOR5hQf29hZBYJvMZA8gPPBihFFe4P8nH5zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFvxJO9wdJoCvkCdM4G9vLuXJ3UVbYwzhTOv6DkZKOY=;
 b=Fw0+qiUoAAsAIeIa7JA6pbkUdrWjMyKtw1AL/ECA9FqZB+5X1DLlx56N+uXB3tTGDS0JmbpHXxVr8S743Y5rKGSfxO8QFMtXYcJnTHHAbWMWVciSDBWZgBTbzBvkTT6ECW/Dnp7qnZ4dnIyEWOmuatlSr4kpSP9I2x4hdsBXpv+zCjnkqoGH+ThSl1IfTAcdImIUUJvqJp63NFwR8Z9V0MKOEzkKSV7FKJGks58y57CcUFB4LtFB4yTh3TUKddLG3hANOMW09DZp64gThxrKBjWFwP2VjnED/WPgx/hqeGXL3Mrck2ty9nML/rbd7fH7vzGlbvlI3het7GrI+Z/D1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFvxJO9wdJoCvkCdM4G9vLuXJ3UVbYwzhTOv6DkZKOY=;
 b=P/mGZMpM0R92ScwU9nSLwJG0cFqz7GLv5I+Y/+rUwHxSuZWf7nlWmdQYVQi23TzfJYmuSeWhzdArH0WB7s474C2G4tUVgXq/LS5L3XcATC9FApJZAaB4ji67WX08WtUC3Id3kN3wr6gCeWCSGqKFcQQ3XMJ4VZDYb9zX+kNyGyo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA1PR12MB6306.namprd12.prod.outlook.com (2603:10b6:208:3e6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Wed, 11 May
 2022 07:03:55 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f%4]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 07:03:55 +0000
Message-ID: <93103bb7-8d67-a9ae-31c8-d53cb651a027@amd.com>
Date: Wed, 11 May 2022 09:03:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2] dmabuf: ensure unique directory name for dmabuf stats
Content-Language: en-US
To: Charan Teja Kalla <quic_charante@quicinc.com>,
 gregkh@linuxfoundation.org, sumit.semwal@linaro.org, hridya@google.com,
 daniel.vetter@ffwll.ch, tjmercier@google.com
References: <1652191562-18700-1-git-send-email-quic_charante@quicinc.com>
 <4ac55be2-7d55-2c3b-0d5e-f61c02c62792@amd.com>
 <6dc59fa7-5885-9ed1-54c3-f2d112786312@quicinc.com>
 <2a0312d3-d576-b5be-c823-938b38096523@amd.com>
 <4d644a01-5259-a063-b5b2-ea95d5e7dd88@quicinc.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <4d644a01-5259-a063-b5b2-ea95d5e7dd88@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR01CA0067.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::44) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54bd7899-46e2-4176-bfc2-08da331c6925
X-MS-TrafficTypeDiagnostic: IA1PR12MB6306:EE_
X-Microsoft-Antispam-PRVS: <IA1PR12MB63062FE38FB228428D51C39E83C89@IA1PR12MB6306.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aGIErnFc9embB9mtmVg6K9B3Leylr5p881nC3NxCUaWlUDfwwdbVEt1K+sZt0xFg16JXFJoNAOqS5rCKhBurb70T9HISnFa0Soa9ls98us7ojvWghbEWbfT2gJymau+TyUDzCdZnObhE+pEFUe4Yn8lNXIpg99IyzUy2Ooj54T4trZEDn0jAvcWDewV851BfFW7GceCfFIgljfvsB7Pofmdl0ti8C/F1qCbupCkJry5/+dNyV09RUDZlLsGa4eQssDuD4z/5McSXeiaHv/UD1Mm8AdfwSfHGRxGPd6ksGsvXkkiG7SEZvPRBMMKBU4yKbZzFt251zoEALNOJztYS588iE2FqRN6zjt4Umgtr/LW1RdIuE+v2ABbJBu+C5G+h7t1sxrPUVD2xN8OEgq4BAfYmMuHtHbGF4GNO98V3TkpIvAxSDZlEBjVz+ZAWEPaZgq0YntQfAY+rXaokVIU+WdG90cRxj/Tx0OoyPH1EVrk72dRtntTtPqNB2rIFh1nnxO1BBhIJ/8zwhrsKFaojqVP3IHTgtXW0gAHci5iEzomkA0ssSSI3fgnrCQIlQgwz6GvrqXP4unagW1sB5l7dBPoW0pZIUXoUY35WEXFn0XHCCVOu2I5yGNFti4rqqkittbC1fGDmIB3g2CyU5j+GETZLLnpdmX/keIZcoGFM+0nytKTO1NkKC6R2pJapM1KKPJ3rcVLSBkW6mjeGAKZSwLZE70mi2x9kJq2NFF5eI4p6F/Wa7KAhXWJefjyDgJtLncOdkUO2l/usiv2T9o5a3rFKBOAQTY6nmw7pV5hBV/+ujvvVIK+l16jZv8pPga51hR11POqQxY7KFvaMjaYu4l95IZn5/BykKaQi8oDMgW8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(4326008)(6666004)(31696002)(86362001)(66476007)(508600001)(66556008)(66946007)(45080400002)(6486002)(966005)(316002)(66574015)(186003)(6506007)(53546011)(2616005)(26005)(6512007)(31686004)(5660300002)(36756003)(2906002)(7416002)(8936002)(38100700002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2s4bUM1NlVLR2RSTXBzZDNJM0JCY3ZSWFErK2hCRlBrU25xdmwrRGF1M1lJ?=
 =?utf-8?B?aUl5YWVKZkZoanR1UlVENGRpSEY2ejQ5WTlGV2dsWjFXN0NWVVVhZkJ5UVBt?=
 =?utf-8?B?Slk1a1pMc0VXRDI1bjc4dmlkemg5RnU2QjNDV1NhN2pKcU9DaHF1bWdTOElQ?=
 =?utf-8?B?bzRTUXBQVU5qNTNYODRaUTdnVjRJTi9PWXBzMVBzcFJObGlKc1NUejhFamJp?=
 =?utf-8?B?VGs1eTRrSWVmOFlxRjZpR2E0TWVLSVlnb1FYRTFZUjFoclZ6V0lqaDNYZ1JP?=
 =?utf-8?B?aWt6WnJWZW1QR25VMEpwRmt0Z0dIc0NaOS8vMWpDRmdUTjR3SDlEam5oY09s?=
 =?utf-8?B?eEVMWm9hbHBGdHNuczVmTThCQnRMYnlUWWIxVy9zMGJCZ2cza08xZUhUdWts?=
 =?utf-8?B?NGcrVzJxaGo0RGRuRkh4WmV3NzRJZWw4OFJjREhQUGZXZHJteFRlc1ZVV3RV?=
 =?utf-8?B?L2NJMENIUFdmS1MrOTF5RmlRM2lNa2d2ZnZHY3lIeHhnbWQydGppZjkxZGxW?=
 =?utf-8?B?cHQyZEdDdWxrR3dXTitNWWtFckhyQVFJNUdPbU1aeDdiZGpwQnF0SnZKYzJm?=
 =?utf-8?B?WXIzbmFtSVo5T2hjdUJUYWFIL3VEamZlYnAyRGFlbS9KR0NzalZhT1ExRURL?=
 =?utf-8?B?Q3UwQXZiZFdoMDlKbnhSL1pHeTU0ckJ1N3lzdWVTem5wVFZoSW1MNEREYlNH?=
 =?utf-8?B?LzBoQ2F0bGVGOHQ0WkFNREp1Q0lRSGJqL1NrTXEyWFNTZUJiQ254bE9vRVNB?=
 =?utf-8?B?ZG9qMUgrMTdDZURBZ2ZCOWRrV3BFYnN4SCtveVNnbEFjU2JUUTNrbmtFZE1P?=
 =?utf-8?B?QWxlUnQ3L0l4Y1czME1OUUJNVWpjRXJvc2JKbE84d01FS2ZtQmV5ejRoMHla?=
 =?utf-8?B?RmVVdHpHMi8raFJob0IvbU5jRWhYQjRHRVgrSDBhTW5EdTVLdC82K0QyeVFD?=
 =?utf-8?B?QmpxTXUxRHcxb1REMFhSdnovazVKbTFGTEtoSUh2L1dOejZnalZJR0lOMW4r?=
 =?utf-8?B?dFlVekxzM0d2MGlDRXBLM1JFYy9RaW5WV21VQnBqOEhpT0xhd1J1ZUwrZU01?=
 =?utf-8?B?SHNuTi92UVExOXQwYUlmdExONGhTR0U3eVlYemp4V2lWaXQzUnlpT2U3eFg2?=
 =?utf-8?B?MWQwU1ViMUx5OEs2MzNMbGtaYlhWNlhqRW1UQk9ZZHQrY3g2QWU1ZUtiZHlt?=
 =?utf-8?B?dnk1V0tXOW1RbW9YM1pXWncybjlDZFk4dGF0ZSsxWXNoaWx1QXhuZXlwV05U?=
 =?utf-8?B?ckZlVWF6S1Z0NWdDZ2pncWFpZTljdXlqeThxbWNVY0ViTnA5S0FETUZzaGdV?=
 =?utf-8?B?ODdLcUhtWmsyR1pyWVFXdTJCbzcrZ1U3QXBqckpwMU1xdVVtcHo0bDNaVG84?=
 =?utf-8?B?M0tDeDNtSmI0b3lPc0ZHTVBrY1NTVmZmUkkvUlNHWTErQlQ1US9BV1JaVjlr?=
 =?utf-8?B?ZFNHV0lvbGpWVXNKQzZTL096bkc5ZytXanR4V2llaGEweWpNbTg0SUlteW1q?=
 =?utf-8?B?bnhmYTJXTmVlZm0rZ2s4K1BFaUFCRTdid3BscHdJeDdaVkE5S24vQUxjbENL?=
 =?utf-8?B?RkRpTjROQjZicEtBZzRNYnBsdTBXMkdKdExJb3JyR2YvTnBwREtjQUVySjFN?=
 =?utf-8?B?OGRWS0Vxa3ZYdWJHYmFPdTRzYjl4SG15R3lFS25Qa1BHM2Ftcy95cjJqdTkx?=
 =?utf-8?B?Z1Vjbm9veThvUUZjUjRNc1ZYZlRrV0o4eDhEa2F1MWpCb1lRL2Q4Vno3NjVh?=
 =?utf-8?B?WmJRQXlzQlNzNWs2ajdRbks3Z29rTWxGNFRxZGh2c0s1b0hIRnNLamxITkU3?=
 =?utf-8?B?ZVJIbTF6aEZGK2Q5dyswNENUclN6djlHMkl2MEZoblg0d1p0dVFwbi9DaTFJ?=
 =?utf-8?B?Wnl2M21SYXFxSUV5VmRXUlZwdUgrQmhHTWNSaVpMWEJDN3pFUXhWekUyT01N?=
 =?utf-8?B?dGJ3d0huL3RORVlHZ0k5RTBuV0h5UzluSytKczZWUzc3MjVsZXhkZlAvK2kw?=
 =?utf-8?B?MGZEbmhIbXF2OUo0MlorMWFrQlVzbEV6cmVwRm9XL05nZDNNWlFWV0ZOQXZl?=
 =?utf-8?B?TWRoZGxIRFVmMFVJYlZuRGZsVE5LWjdTYjJ1bFBrYzNiaUFOc2ErVHQ1UEQ4?=
 =?utf-8?B?ZTNMT2NHMmQ2US9peFVMaTgzbmNFcGVVOE42UzUxb2xCUWVzSTd0SkdsOG9G?=
 =?utf-8?B?K3c4ZlVZMHBISUtnckF4ZHlXdUd4enk2Y01NazBTSE5JT21zelRPT09YTUpj?=
 =?utf-8?B?ZGprVzNVS2J5UHlUbng4UkxWcGU1bmJlemVtZW5tbGt1c3oyNlZBYzNWZ1Qv?=
 =?utf-8?B?R0U5eWF5NEhiaU1oZG9PekxtQXE4SzBFbVVVZW12NWJBa1NDbFcyQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54bd7899-46e2-4176-bfc2-08da331c6925
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 07:03:55.3621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCgmeQ1a+unmfvM2Jv0i1KanFUu9S1IvNcb7WJk40h9nXZRSXA4idavdPn18V6Zl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6306
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.05.22 um 08:49 schrieb Charan Teja Kalla:
> Thanks Christian for the inputs!!
>
> On 5/10/2022 10:52 PM, Christian König wrote:
>>>>>           if (!dmabuf || !dmabuf->file)
>>>>>             return -EINVAL;
>>>>> @@ -192,7 +193,8 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
>>>>>           /* create the directory for buffer stats */
>>>>>         ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype,
>>>>> NULL,
>>>>> -                   "%lu", file_inode(dmabuf->file)->i_ino);
>>>>> +                   "%lu-%lu", file_inode(dmabuf->file)->i_ino,
>>>> Why not just use the unique value here? Or is the inode number necessary
>>>> for something?
>>> This will ease the debugging a lot. Given the dump, I can easily map
>>> which dmabuf buffer to the process. On the crashutilty I just have to
>>> search for this inode in the files output, just one example.
>> T.J. Mercier just confirmed my suspicion that this would break the UAPI.
>> So that won't work.
>>> This needs to be a single number, preferable documented as such.
> Usually, What are the chances that a patch breaking UAPI will get
> accepted. IMO, If there are few users, I had learnt that it is allowed
> to merge. (Eg: In [1] where Andrew, -mm maintainer, mentioned that: "I
> think we should just absorb any transitory damage which this causes
> people." for the patch posted breaking the UAPI). Even the patch
> c715def51591 ("dma-buf: Delete the DMA-BUF attachment sysfs statistics")
> deleted the sysfs entries which also comes under the UAPI breakage but
> still allowed to merge. On those lines, Is it fair to say If few users
> are there, uapi breakage changes are allowed to merge on the assumption
> that userspace code needs to be aligned with the new uapi changes? To my
> knowledge, Android is the only user which is just getting the dmabuf
> stats as part of the debug code.

I don't want to open up the can of worms discussing under which cases an 
UAPI breakage is acceptable and under which cases it's not.

So to make it short: When this causes a regression for Android it's a 
clear NAK.

> The single number approach, generated by atomic, wouldn't break the
> uapi, but that number won't give any meaningful information especially
> when this is targeted just for debug purpose. And just 'inode' is not
> usable for already stated reasons.

Well, why do you want to use the ino in the first place? This is an 
anonymous inode not associated with any filesystem, so that number is 
meaningless anyway.

> How about using the atomic number generated it self used as inode
> number? I see tmpfs also maintains its own inode numbers for the same
> overflow reasons[2].

Yeah, that could potentially work as well.

Regards,
Christian.


>   The code will be like below(untested):
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index a6fc96e..eeed770 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -408,11 +408,17 @@ static inline int is_dma_buf_file(struct file *file)
>   static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
>   {
>          struct file *file;
> +       static atomic64_t unique_id = ATOMIC64_INIT(0);
>          struct inode *inode = alloc_anon_inode(dma_buf_mnt->mnt_sb);
>
>          if (IS_ERR(inode))
>                  return ERR_CAST(inode);
>
> +       /*
> +        * Override the inode->i_no number with the unique
> +        * dmabuf specific value
> +        */
> +       inode->i_no = atomic64_add_return(1, &unique_id);
>          inode->i_size = dmabuf->size;
>          inode_set_bytes(inode, dmabuf->size);
>
>
> [1]
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Flinux-mm%2Fpatch%2F4f091776142f2ebf7b94018146de72318474e686.1647008754.git.quic_charante%40quicinc.com%2F%2324780139&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C62c0b07ffb084635dcbe08da331a6830%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637878485789848020%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=V4QdoKGL8Ifuq2gvhNcP8oPJt%2FI%2BPkhzVDhSYShCS2M%3D&amp;reserved=0
>
> [2]
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fstable%2Flinux.git%2Fpatch%2F%3Fid%3De809d5f0b5c912fe981dce738f3283b2010665f0&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C62c0b07ffb084635dcbe08da331a6830%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637878485789848020%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=Vid4T1njdOMZv%2B1ADKfjiiuzt8z6%2FiFP%2BcbUwNcZmdw%3D&amp;reserved=0
>
> Thanks,
> Charan

