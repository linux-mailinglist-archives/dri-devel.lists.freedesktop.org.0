Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 744356E8EBA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 11:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D964510E26A;
	Thu, 20 Apr 2023 09:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FE510E094;
 Thu, 20 Apr 2023 09:59:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbTV7wjvyhkuIBJnazL95PNpdrULbNeQRMBZZxqYGZWIRR9BOdia9TyT3GIcbdjlG7fGtYpnRmm4DYLPJRc1/J9HyRZ/Yr73pCIwQlMvBxrAeXM+mk4sfyFw3Gv90qoCcGRluHKFHioQ0Et5c2kyfGtme039Ooh+ekQ/9zTR7yYhZf5tm+Xct6GUTUdrcmYAemcVdTM1k791y1Cx57zzOz5vZlkbc5PaNMqUd48v9tg4cUBI34pkm9N7RNxZF2xf6i//4I6W+oezZbjidi1oE6fT6zOrDB73avkcTkJbIj21zQQIpJBRQILhqxcEd+EvoDMuQYlqGpImeP0uWKbkxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADg25vwVIBjXa0kAlIYrrkqy51/aO+lsQE3mT7hiwLg=;
 b=mPVQCBnhEFB+afGRaeXHU7Bs6qPvNM+AT9mHox6PnpGwGVHAJe5+YTawm0mZJcpRic/wQcSwkKeZ8pR4jny1/TpA8NOz6RHovqDRbG8glWzjcprYbNJyqGENCcjgW1lwiF+6HXMBPROgvNrlIzK9aM1HgU8IkjqsGqNRZufZdXI31Als4oOOBslK5DXnwfZb9s3a3rgnOSoYmbxKYqMy9x8aSIdQ8VCTzTHsVLfJqVVzTOPKI6rQh5LBqWzFrUSSO507c8ogPN7OWi354iRwRnLSIjLVv3BWqsBcXpEvvZCh3HIOwlNwU1VApUWaQAk/4uFCVuUcpdNKlyj8Ltf5Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADg25vwVIBjXa0kAlIYrrkqy51/aO+lsQE3mT7hiwLg=;
 b=JeJGarL1vmBVsGxpxLnHry8hDF7MGZ8XWBEh0bVDvUJ2lZaDQ3OoGMqnJ04RNda0Yh1MlVqaHwI6BakIg1vfZDoBMwX/YFy0Rg3hYIGjmfpb9eFcwxOYudoEn9WdUTaTdSVQVUXtMEqhk4JvnlulYp8zYPcXME1O3whk/1mTHRg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB8041.namprd12.prod.outlook.com (2603:10b6:8:147::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Thu, 20 Apr
 2023 09:59:25 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 09:59:24 +0000
Message-ID: <b6ab0086-7d52-2a41-2f76-44694faed317@amd.com>
Date: Thu, 20 Apr 2023 11:59:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: BUG: KASAN: null-ptr-deref in drm_sched_job_cleanup+0x96/0x290
 [gpu_sched]
Content-Language: en-US
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
References: <CABXGCsPZxgpFzAVN=eFXu0WV+Jk0vB4rv4p+Jt31C841LcqV=A@mail.gmail.com>
 <CABXGCsO0sST8+MvQs=T1JP49ogRsaHPT9gMQZGJ3dY7v3m0H8g@mail.gmail.com>
 <CABXGCsOTEpJG_0NWdGXRvcXQ4iTav6AUJm-U4SQb-vVzjoL6rA@mail.gmail.com>
 <10b2570f-a297-d236-fa7b-2e001a4dff12@gmail.com>
 <CABXGCsPcPY8dqZm0aF4c1p0ZvMYHy+NksMrZi9xK0=WdE5_osA@mail.gmail.com>
 <d96519fb-9e12-5a81-a60b-384dcb286f28@gmail.com>
 <CABXGCsP2JQMtNjBROSLs2y612iLZuCyoe-uD6OScAWbKHBWsCA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABXGCsP2JQMtNjBROSLs2y612iLZuCyoe-uD6OScAWbKHBWsCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB8041:EE_
X-MS-Office365-Filtering-Correlation-Id: 084894c3-61e9-4956-f232-08db4185ebac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9ltJPt5MLuUuOeHyWgaE0Bpte0GYB0qUMfsQn37YC1GX1VUMUNZJmelWKlmBV9MUQN9GDX+6TaQKeBSsvo2Tz5tkZObhoNnyMT81NgFrVkz83K3cREfsCXqUBtIDXWx5IVoRO0ZA0QyGxu2f3mMIedkPF6OeLkkprThkqzmO8hyqA7JXHSzQrIfqsra43ZaihAVLVO5mN3rjIq6zmhfRBW5kaIEUeygHi2iCAkW2v546ebsfeUbZV8zea6i9UQcFcC8yiCUvmqdYERrUoL+sFD51KlxdkZknKPaw2IiGcSx1LP7Fi3l8+7ehV0Oyk5KrTtpSaAAZ7x2QHVomtZl0pQg/2+I2xVl8oYeudMLweTHlnr0OCOmgSG5qqUcK6nGus3oDdBepdUzMWy9mGr1sm+qwybSG5CrmpNtfYls40a4P6cxgGW/4KF97owSQLbTI+bSWw4DJ5UGvIRGeVpjvyvtQFPP0hB5W4/Sgmp4ZbJ6SJGA+rBUZKkMR47HYe4MpEHN7bf08LzFAV2M/SGvgnk290RxGx2gyETrfluj0pNWIJAEPg4l0dWF6eMg3rMNmpJ7BDmYujm1ClgaPP30QL98XGJVkHQja0u1V2cwtjwehjMFU61uUpbsBR6OQgwZ+XpobFtak7bBH89j2XmU++A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(451199021)(186003)(6916009)(4326008)(54906003)(316002)(966005)(66556008)(66476007)(66946007)(6486002)(478600001)(6666004)(8676002)(5660300002)(41300700001)(8936002)(4744005)(2906002)(86362001)(36756003)(31696002)(2616005)(26005)(6512007)(53546011)(6506007)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjBPdUdvdUI2UzVjbjlzRWpVVk1jRHBGeDI4N0tWQXoyVVNFbFpEbFoyNS8x?=
 =?utf-8?B?bzEwT0VNaHk1OFVDWHpGZWMyUGs1a1lxRzNRdDNhTmZmL0hpOXVzWms5RkEz?=
 =?utf-8?B?YnNRVDZUc2RFYnRvZ3RMRWd6RDNlZkhXT25jRmtncFVPNVRreXdGVkx3aUJG?=
 =?utf-8?B?S2d4Z1dDUUREUnNVVmhSMDFLc3JmcTZRdHl3N3FKZTJ3MFI5OFIzbk9qUXlR?=
 =?utf-8?B?V3dzQk9xZzBIbklwZ0pmeUNPNkw3blBtWmNnTFBtYUc5ei82YnRjLzlRUzJp?=
 =?utf-8?B?NFJMR01PUm9zTTVXdHpMOEplZEt4cDZxQTQrREMyOUtsajdnL0xib0c3eTFL?=
 =?utf-8?B?SURXTjR6aXlzQXk1WFBUVENUQ2VQM21tdkVwanJJemxpOGZzNzJYVGYwcWMw?=
 =?utf-8?B?L1B3d0xPejFWdzJyREkwVVNYb20zVm5yci9ORk1BaTBmc2NxeHUrRG1Pcndm?=
 =?utf-8?B?THVGN0VDeHhDcjJDUVdDaVpsdUwzdFBiTDlnckR6bUR6dFl1WkxUTTA3YnJj?=
 =?utf-8?B?WE0wcUwveTlCeE4rT3NicXl2SjREUDZaMTY2N1FzSnpaZnlaNWN2WTR4Nm1H?=
 =?utf-8?B?em4wMno2THpWUUp4N3N4c0hWMlNWOTQvSnhITmdzRDllenFUZXVHaEszWXNv?=
 =?utf-8?B?SmtZSzlNT2JTeXhVcitMSGhVcnJNbTBEbHdYRkphZmxBSUJPdGcyS3lBam94?=
 =?utf-8?B?K0gweitsMGkrQmVyaGgrUjVjNmxPOXVsUEFQazJlY2RCMHBBaWU5RmZwQ1ht?=
 =?utf-8?B?a0NkbVFBY3F3c01JMzR2aDZaTytoUGV5MHRzV0g2dVFtV3J4Ui81dlR6aGpu?=
 =?utf-8?B?eXUreEhjSmhrM3gzMUgreDZPbUpkeG1MR3NWS2xmdUF6azJDRm9BM2FPL1ZH?=
 =?utf-8?B?WitRaW1VSWU4Y0FQbnFBbkVGdGtmT1lSRXRhSXhpa1doUE1QVllTUzFndXd6?=
 =?utf-8?B?QXJmR1NwQk50Mlc1VGRBYVhjYXZTUDV0VGN4NXFFWVhkc1hmQjVJRWdVTXd2?=
 =?utf-8?B?amZPdnA5UE9RSHJ5Tk9ZdFpGbmx3MHlxejRYQUx2WDdhV3hwUWxkMEU4Z2k0?=
 =?utf-8?B?cWw2eDg0RjAwcWR1Q1FvWGZDNjhWZXdIUjBUVUdRRXo4dE90K29Ib2QvWkk1?=
 =?utf-8?B?andGMzNnQU9NN1hxQ2g5d2RKdlAyODV0dCtsRVNrNmRlaGVDbFlIRXZ4ajV4?=
 =?utf-8?B?K2hoM1V5YUsyb2gvbENXRWRQUm83MzNOalVzWkFZS3ljd0swTmlZUXFFTmgr?=
 =?utf-8?B?NW5iZEJGSUlOMEQveUtiR3ByUkIxc3luTExNaGpveVdIVnhscVhkTjVEcXNG?=
 =?utf-8?B?OHp2SHdzdnB1ck5raGE1TDdoSVBXYkg1RlE0NmRvTmdGZGdub0lzSjd1RUx2?=
 =?utf-8?B?ZkRlWFZEYU16aWtSaEx1U1NIWXVLUjRsQjZXeS9GQmdHRmQ1ZzJwUnJMM2xa?=
 =?utf-8?B?RWJtVTdwYVJ0Y1VwR1I3QmRpZEY1QXZhdGsxTTRGUVMvcWhkWnhFY3BRRGpx?=
 =?utf-8?B?TDFyUWJ2cDlDc29KSTVmeGlJVldKbmRaNG5TUXV5WEhnYVFBWnlQN1Rra2d2?=
 =?utf-8?B?ZHd4S29FdXhwT2NIaGpkODlnYWxPUHZsWU9pNlkvUXlRTnFoUXh4dCtqNE80?=
 =?utf-8?B?Zzhzb09BSUxjN0kzYzI0M3R1Z0gwbVlmWkZtN1JEUUtCOVMveXBtM1h2SW8y?=
 =?utf-8?B?VEg1UGt4cm5JSDFYU1IzbDJuUzdTMzlQUGtmQTIwSzJ4TVJtUU90QmV4aXdG?=
 =?utf-8?B?aURLWUpFd3ZlWTJLUGdLYUV1UlVMZFo1dERqODRtUGV3NHVyVThXS0ZnQWxB?=
 =?utf-8?B?YzVoMXhZaUNveFBtcVdMQnhxWEtnOHFxMU52TFh2QUNvdy8wME1VaFZERUxI?=
 =?utf-8?B?YXBrRGJ3UzlqcksvY3hTSzhpdy96WmNxaStMalJ0T3c5STM2UmZiYnRkZExU?=
 =?utf-8?B?N1JTQWhlMmdtYTJpU3dLU0o3MitNbnVEMnhFRUNBaWc5TFo1ekZYM0lmbU1y?=
 =?utf-8?B?ZXU4MU92NFFkem9pZFJ4bnRPbENHUmc4Zk5oamFsRWRoNDhyR2dnclRIQzhs?=
 =?utf-8?B?Wmc1N1JYZ0pUaGc1RWxNRUUzclYxNU1wSGdWWGhFbW0vZVRmUFlsQ3dRZFhZ?=
 =?utf-8?Q?BUh15qLh5OGSHi5EL3t1va8W8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 084894c3-61e9-4956-f232-08db4185ebac
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 09:59:24.6071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tcUXZug8ScaOcgf8LNtyPi73UchIWJqp0vPt8dk+TK5v1iHjCsmQaUvF6XpSWN+5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8041
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <Christian.Koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.04.23 um 21:17 schrieb Mikhail Gavrilov:
> On Wed, Apr 19, 2023 at 6:15 PM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Well exactly that's the problem, I can't reproduce it.
>>
>> Have you applied any local change or config which could explain that?
>>
> I did not apply any local changes.
> I just pulled all changes from drm-fixes and used the attached config.
> After that I am lucky to reproduce the issue after 3 minutes.
> I recorded this on video with first take: https://youtu.be/wqD_t8AFU3s
> I able to reproduce it on various hardware:
> Ryzen 3950X + 7900XTX
> Ryzen 7950X + 6900XT
> Ryzen 5900HX + 6800M

Could you try drm-misc-next as well?

Going to give drm-fixes another round of testing.

Thanks,
Christian.
