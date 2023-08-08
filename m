Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 964AE773A97
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 15:56:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D990510E1B5;
	Tue,  8 Aug 2023 13:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2073.outbound.protection.outlook.com [40.107.101.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A01210E1B5;
 Tue,  8 Aug 2023 13:56:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dclpPfKY+wFMcpAfC8a0pEjjY5+N5oMVi2K1QTKWAB+l9QcTB1FofE4Z3ojzZxUXZ68t6nylth5XuY5p08FL+X+c3EHQTCCxPGes2qWiYC3nT5BN8nLI0hTF/G9Bno5q+I/07qXRv6U+hzHmSVZ3mGSqz7UfRXdZuJhw2wK5pDL5DVaD+XomdR6Oqq2WHhNV1/yQg/nMHGcX9IPg7Eezc1BCneVY6SdUO3f/blE/rP66Htii3lTHipFhezvqfKaqZNsTIp5lNp4P1c8WGz+J3rEtIWgMKugtPA8f+e1R7ytVHnRP2dg2cIBmENwke+9h6zn+EpeDROWv27lnoPLJjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNP6R8X4hTuDoO7vL6CSKYK+xa8NvcH6JmVdtNr54n8=;
 b=hcTd0bcC0Gyb2g3TyCvT1wo/qLL83oU4ZVTTu50CJCo4g9xOyt167UAZMVmOx9uoD4HGib+2RDUWKsukYBGMOoIbWSC18QMeCY01S6ytdm93L9L8ZvYqkznfxndK8V6sa9/GzZijKtlXzkFzYOLxWOxnWGk6vBzg1/WkMM95sjbCUujnJwbiFK0/5581V2ayPcnwmgUFERC/fiGAs0V3y2TP4smUaNwg1ud8pOrIht0TEN8jT/HMV4eJJxsJP8hx8a6XZ3BJEDis8yQZD6uuSmn1kqod3N9iP54dFlWl5oSawKEYnlneJWDG3JkoyjOS5b1SyXY3zglXxPA2QTWrDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNP6R8X4hTuDoO7vL6CSKYK+xa8NvcH6JmVdtNr54n8=;
 b=aMTG3GrR7FKDWMW3O6k/P5taBgfTPI5y6J6UBSbMC2JOLH+xAy+lXjeglWgzNPrTagpeCLOVkzhpsojFlhrOn2cIgLOrqMGL2tBzuLEqxwvuL+ATreU7QimCsNbven1MGNDnN1qnxyFDBrqDdXYxS4grbF+ZuOUkJpinri5WxjU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB5421.namprd12.prod.outlook.com (2603:10b6:a03:3bb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 13:56:02 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 13:56:02 +0000
Message-ID: <ad26d275-4373-429f-ecaa-3e35978f1fb0@amd.com>
Date: Tue, 8 Aug 2023 15:55:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 3/4] drm: Expand max DRM device number to full MINORBITS
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20230724211428.3831636-1-michal.winiarski@intel.com>
 <20230724211428.3831636-4-michal.winiarski@intel.com>
 <83s0YPWEdYE6C2a8pa6UAa3EaWZ2zG-q7IL9M-y6W1ucF9V54VnZtigKj3BGKUA2FZpIrs0VVxmpHO2RAhs_FdOnss9vNLQNSHySY8uH7YA=@emersion.fr>
 <69801f61-37b0-3e46-cbef-31ff80ae9a34@amd.com>
 <TAdBP5BOy3cy7VnUb4t7ZkDOMK6wI_gPCjXanItN3TOsA1TbSk_6yrlcPTqvk3AZjamo96yHlEhjpfNUPFF6tA_9K8iRoie3h_z5Jf6zNtc=@emersion.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <TAdBP5BOy3cy7VnUb4t7ZkDOMK6wI_gPCjXanItN3TOsA1TbSk_6yrlcPTqvk3AZjamo96yHlEhjpfNUPFF6tA_9K8iRoie3h_z5Jf6zNtc=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB5421:EE_
X-MS-Office365-Filtering-Correlation-Id: f085530a-e6ff-4464-6791-08db9817336f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tib5wzkBUpx+wq+nMbONk4v3h8pkd1jj6u5/CfopWpJaoi6AkdDXLvITCThfqxcCq8Di/NkJtrBMRTBzIMc2VteGkApV62/IvUpQuS20YCHiIzl2kIUYFbwzfSXJLC8tFpXwxSSfXsEabkwgwyHgnJTUNdFQp8BB9iDsAiN3QOOxn2oLQPd1WkQxWznGlj8PTDyG9cZk7dZw9Bi8YgXGXEk6QnycHT4jpOj4xVSLprilxfJvHXp7HwOZQRHr/Gf9DkBUmk33v/qZlR7w2g2cTo+zL1AyZWlvuuKHZQxFKWTKGTviJBTX7xKRv1lvsBPgyEuilutCUBe/YpbbgrevjIotieCvFM5hhbKteR6G6K8zmXEMTQESgpf1v49jv/+QNKM6/CbovmVkiRExQwDy4wHYlf6c3YvYzDgJCS3+XfPwnJALpmQknKPy9nHVLFPn7RPX0mEPu9vwM9KHKofJLMfe3YFexXjGonr6JSZnSH5BdLGZHdDLjdxqe/YbQ3FtEVBfHWgit4zI0pMv36jj7ppxUI2KAhSlmjzFtG10H05QeOh23mT0ZZKRcMtUZJBk0YIX3iM7bYCaueVXJ82bdMVdUZwSajdfbuBtXWWqRj1QY+vMVqtIOWJgwaTgFiqZsGaCq8GwWTcyM2rKPV5rBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(186006)(1800799003)(451199021)(6666004)(31686004)(2616005)(54906003)(4326008)(6916009)(8936002)(316002)(8676002)(7416002)(5660300002)(66476007)(66556008)(66946007)(38100700002)(4744005)(478600001)(31696002)(6486002)(86362001)(2906002)(6512007)(41300700001)(6506007)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azNpL2o1Rk1KdFRjUG9nMnhoSk11ajRhSkVVajdNZTlnTlVKTmloYUFtbGh6?=
 =?utf-8?B?aUd2ZUxQMXlNSGVBckQrUGtJc0I1ZS9pTDU3czdZVkVYb2ZHOGUyNS9UbGox?=
 =?utf-8?B?K0oxMG1RRjN5bzdIbk1Tc0hydmU5WDNHU0NpdExIaEUyWnVxRkhZeDdEb2hI?=
 =?utf-8?B?aVkxNXc5TDhDVmRKQ2ZNY1p2eXZwTlorT1pJR29iNHlBMk9XU1RRcFlFVVYx?=
 =?utf-8?B?MVNLVHVKMVBXM2hoM0ZFKzY0K1RuR1lORGVtaGI2MDV4UHpFNmwrTCtqZWRz?=
 =?utf-8?B?VFRId09xWEZnNnFIOHVpSEd0VHkvSTlsZFFla2dRQVBLNTBQV0hLcHpEQkp4?=
 =?utf-8?B?UWprWjZJTURmNHdxSW96dkU0MzVta3lsUUVRUmU4WnlrcDZuUXRIOVJMY21E?=
 =?utf-8?B?bWhva3hCbzg3RE40ZGkyL3VXR1ZZNjBTdkorZWZaeGM1VHROWUJjbDJkTGJK?=
 =?utf-8?B?TGxXWWlRNWo2S1FxNG05MW11RUY2RWtLaHAwWmhTNGFhVXpZOGo2NDUyQ0t6?=
 =?utf-8?B?TU9qM0FYTVVid29sSDMySEdSWjVqU2xCY0p5VFdqSktlc2JKMlJ4c1NEVE5l?=
 =?utf-8?B?clVXOXVQaVVxWVpsR2JYSDNZSGxWOWxKN25ZTjl5UHloTC9ocldaTzA5Wmhj?=
 =?utf-8?B?SW9OK2tCdnhjRkc2MmUvelB1a3NjaFl2dEt0aHFtVVc1MG9EUFZGd0xIT3pQ?=
 =?utf-8?B?c3g1SUozcUJmUG9yTDYwL2UzU3lnU0VzK2J2SThJV2R5TlJZdEJ5aS9MbWh0?=
 =?utf-8?B?cEhvV2p2VUtjMnFaa0drQmtGWGlac3dVVDlvbExQNnpXM0piY0NPU05SR1Ns?=
 =?utf-8?B?bW1SWDhiRUwwRXM5dWNpMlRRYkZpOFVqUFdyUjFkckd5dkUwQWczd01qckh1?=
 =?utf-8?B?U2hoMmNIWWFMOWVUQ3dLTitoSjVvY252RmZQc3RZempzdlIyakg2aWpHNWI0?=
 =?utf-8?B?elI2QmhxQmY5cHR2K3dWZ0I2V0tkaXJvZnplaXA5K0lEOGM3S0ZKRG4vT1Zi?=
 =?utf-8?B?RWV2b0JUemw5MlJqYTVFUkpEU1FsTkMwV0JEaEpYdm9TQmtHUGpCR0hvY0RQ?=
 =?utf-8?B?aGtNd0NGSmtSODFFMXBsbSttQXJvVzZjeGU1ZmcxR1FZeUpscVN5QURyeGlB?=
 =?utf-8?B?enpkODVNOE5la3h4TUZ2SDIzTnZnN3RHMDZmU0tvZVUwU25rUHd4SWpLR0E5?=
 =?utf-8?B?ck5lYW5McnllU0VXVDg0T1pnNmhBQk8rU3hSUW03SUgwWlhkWlV4dzl2Ui9w?=
 =?utf-8?B?UkUvNFRHMW5YYnhEdmFGM1lnK1IzZ0hCSFR1U25FdVVsaVRJanhLb09Lem80?=
 =?utf-8?B?cElGcmRkS3YrM1ZzK0E0K1dPRzg2NjVTdXc2REZGTEFCTUoyTXFUSmFSLzNP?=
 =?utf-8?B?bWtwckZUeXR6N1dCV2R0UHEwTE9LeVVoajZ2VDMrMVBtZXAvOTBCZWdrNmNu?=
 =?utf-8?B?bThsZGZ2dk9uSjR1QTRyd3Z1ZWthRmlrdlhFWE91ZGdpUDNUcWJhd1g5WEFV?=
 =?utf-8?B?ZG9RdWk2bUdLYWs5Yk8rVEJQcWpISEowVDcwSnRPdGZlVzBJOEdZcHpPREVt?=
 =?utf-8?B?L0g5TTJvR1dkQ0ZsZTJpSG9Nb0prbzcvYXJzYVpQeG1JZTJxbzlxWis4Ykt0?=
 =?utf-8?B?NW5zUUErWlRGUVZCQ25TOGZ4WU5BTTBOWkp6Witaa2lVT21UZmN1eFZtMktB?=
 =?utf-8?B?eDV1Um1hUEhHaUV2cStFTzg0V0RHN0dFaFpSNU9Ram5pL3JiaWorcFR0U3k4?=
 =?utf-8?B?U1FBcGIvb2YrTTd2KzErd2pCNnhJejFGOUtad1Rtc2QvZXR2U3d6NVBwS3lZ?=
 =?utf-8?B?YXhlak1tMzZNbkRZemFlenZiQytwMWhyNUc3MmNyMkNKaUlQQzIyS2FxMzdR?=
 =?utf-8?B?S2lmWjQvY084WTFUaW5zSkM1dGxST0JSaldDL3orZC8wbDF4Y2djUkpJOUV6?=
 =?utf-8?B?Q0RSWjZtWTRFLy9XRTF2LzM3WTBvUFhEKzY1SVdxbENPNVd2cWJTd0R4R0E0?=
 =?utf-8?B?OFRKZXlyN1psUm1ENDI1amE4dytTNGNacWJxK1Qyc0Y2STNUUnRhK1dQekVo?=
 =?utf-8?B?ZFB5WWNRRmwyTU42QnJRRkZJSWw3WmE2Q0w0MTZLY3pIcTRWYlM1V3hIdDJM?=
 =?utf-8?B?Y0xLeDVMN2FEakd0TkpnR3RXN1ZJdWZtNmZaMkpGY1VzOWNOdVkzbDl5NU5C?=
 =?utf-8?Q?veaPBXnoOIkRjJc6UwJR5jL8tDJPcOlM5iH1ajVxbYuD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f085530a-e6ff-4464-6791-08db9817336f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 13:56:02.0070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eYgmixIhzTLHf5Z7i5Upf3gzFlrztsCI4og5VBgTlNcjmlF0ZN9sHXZJsMgnPjyt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5421
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
Cc: Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Emil Velikov <emil.l.velikov@gmail.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, James Zhu <James.Zhu@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.07.23 um 16:22 schrieb Simon Ser:
> On Thursday, July 27th, 2023 at 14:01, Christian König <christian.koenig@amd.com> wrote:
>
>>> We do need patches to stop trying to infer the node type from the minor
>>> in libdrm, though. Emil has suggested using sysfs, which we already do
>>> in a few places in libdrm.
>> That sounds like a really good idea to me as well.
>>
>> But what do we do with DRM_MAX_MINOR? Change it or keep it and say apps
>> should use drmGetDevices2() like Emil suggested?
> DRM_MAX_MINOR has been bumped to 64 now.
>
> With the new minor allocation scheme, DRM_MAX_MINOR is meaningless
> because there is no "max minor per type" concept anymore: the minor no
> longer contains the type.
>
> So I'd suggest leaving it as-is (so that old apps still continue to
> work on systems with < 64 devices like they do today) and mark it as
> deprecated.

Sounds like a plan to me.

Regards,
Christian.
