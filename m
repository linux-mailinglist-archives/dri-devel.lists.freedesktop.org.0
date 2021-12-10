Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 656064701A0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 14:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F9FD10E292;
	Fri, 10 Dec 2021 13:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FCC10E292
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 13:29:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=El8PBOmxOXC3UW30XW8D7oWgEc6NpfqM9rLkuD8puOcb8XR+1k6RdMZRZUHmTmdPR7lF5KMtG7II/T8R+gJd06nnCeLc4yAsdACbAkB63npxnhoV54zlBwBXr4NF/Cq8mQxdCpPIAlwB70Fh91eczP74dh5EDSB4L01gI46FXu31qLXLv4wkfrSvzhW8haCsEPaR+/LMqBe9+gqMqLW9xxyNwV+iyAX2pRA5mxPOhqbQhjktRtKjXLXPNlOcLK6ki88vF2jK8CCWBb/aAvgo/vNI3HfH5cD7CF+IBiyn1FLUWUNZjaGfjM1a5JcrFOWvsdRMnuPl/0QCt94ZOCuVzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ed4XKMmoN/Q85E8p3Djd4G4KfV8Of7d5gFGbWZMdCkY=;
 b=YDeIEJLR/UV7O77Rj1RJn9ChH6TXnozvNuJL0dXq4jCDLNdDzOhwUHkb6WTOlacIhE853k7WG7TfbOQQgYDwvkSPgcvunNVoQJ77udKES6g15xP1Ay2F4V3RZHWqkrtwyY3w/tXnO8hJBRGABq81GLcwkDAMVgXHiVJMzTZYQ2mNyt5yEEnl+dOcWJbKAAeL0LA01/QGxoGUPT8h5bhZNhztkfX6QTVVoX1nxke3SkKBhkrxpL/LnZlBYYMFm0c8S143z9f3Le6uTEkDT8G6kHyGcz4/dx2vS5pnvlNSGM25DcNidcCe13c6WO69CBmVLePParHI9IJ93H1K/UTEmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ed4XKMmoN/Q85E8p3Djd4G4KfV8Of7d5gFGbWZMdCkY=;
 b=5dfb6lJhezWBRMWcEWav3m8uT3hhHZKVo3RuA2AEnEGaBLSidYh+SR6+s6nQ87IRD7H+q3qMs3Rr/WwoyPYGFyMHDZ2ac/ONQtsUOwHHeS4e17BoDimD4WAsgiKoLW1EY8TZoKSfYEGIJppd2LtJG2ndtdmdvMibxFbp6RZ/MXo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Fri, 10 Dec
 2021 13:29:00 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4755.027; Fri, 10 Dec
 2021 13:29:00 +0000
Subject: Re: [RFC PATCH v4 0/2] RDMA/rxe: Add dma-buf support
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20211122110817.33319-1-mie@igel.co.jp>
 <CANXvt5oB8_2sDGccSiTMqeLYGi3Vuo-6NnHJ9PGgZZMv=fnUVw@mail.gmail.com>
 <20211207171447.GA6467@ziepe.ca>
 <CANXvt5rCayOcengPr7Z_aFmJaXwWj9VcWZbaHnuHj6=2CkPndA@mail.gmail.com>
 <20211210124204.GG6467@ziepe.ca>
 <880e25ad-4fe9-eacd-a971-993eaea37fc4@amd.com>
 <20211210132656.GH6467@ziepe.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d25b2895-63b6-158d-ff73-f05e437e0f91@amd.com>
Date: Fri, 10 Dec 2021 14:28:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211210132656.GH6467@ziepe.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0068.eurprd04.prod.outlook.com
 (2603:10a6:208:1::45) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (87.176.191.248) by
 AM0PR04CA0068.eurprd04.prod.outlook.com (2603:10a6:208:1::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 13:28:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce5a0807-81ec-4c11-c06c-08d9bbe10659
X-MS-TrafficTypeDiagnostic: MWHPR12MB1453:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1453AAB6017B424E3A7FA13A83719@MWHPR12MB1453.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wSbKDZifX0+R3H4cS4B0J3P6HcdF6TVJZEc1DH6jFp7bFjLgcFWVQQOuwdroxKSCE79czzvlWioHdsZlfnuw8WzdPcbUyiYXeVyyQyGScI1FaxpuXVlwYf/QtcbIxq3ibdg/IViXHffC+xBB5sG5tYI+XKT2VIeXmanB3dCftL+7296lr/EiYrCg3HYAGjrZ+IAv/9cMk2t8hTBrl4GjC+rQBv6Sj4WgVY3QM07dFhBZv/VuIQrkoQmQMIefLxlBtGLeeSCBCxAMHfyhUlHDkWRuBRamq624xge1ZYGq2FwtOoTMxEs8fkuA4HGLh3OdyLYpk0sOu2CxljKhh1fT28G2v8iZhWtv/r4IHwlejETbGuDTyU4Yh+iEHLheZe6D3eJbMkBTZ/oSLrNLeGatkL7Pxwn5FcoTOq2A3vLdtqw6a5Bfwig1BDUl16Ck53gZWGgdxoy6gNObraek2M/Ep7hZBuXYKmojBL120nXmEQm/SV0DROgpPOmz8wbnlKrb/X4wzqjR8Kt0OEMDijaubWRcK3j6w8ss7z77CSMX0N4Eux6vuYpb+nrQYBOgS4h0aWZXzeJGwYnk38i/OG0J3TtQvvttSe3JTYfdaCsKuk/BiOMR4xIm2LkJUvuRkh0qH4AzPOnVmntoFdtfHy4gExN24YdOSIeityANaInTaYjJZ5Vs/VRzhsinnZDncGRWuuk8lHlCmMfMS6rfwI6qlsJJNTlFidcmqWccSYtLg3CAkvOEVHcthRYlaytUsdlg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(83380400001)(86362001)(8936002)(66476007)(66556008)(66946007)(508600001)(6486002)(6916009)(2906002)(31696002)(66574015)(26005)(54906003)(5660300002)(36756003)(8676002)(7416002)(956004)(31686004)(16576012)(38100700002)(2616005)(4326008)(6666004)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STZhK0pLRzQxOHphT1RBQzRLZGZLKzJHbU92UkpMNFJSOWhQQUx0UVNmRVRS?=
 =?utf-8?B?MHZRaktIT1FGRW5jM0lESHpLbVhOK01KZDBVRlZwSFZoVGV6K0lCTmp1L2dE?=
 =?utf-8?B?bGNHNWdZWEdrbXZ6eFJTZmtLMzE4SDdWS0tKZmg5KytBMEVzbzlPeTRZM05R?=
 =?utf-8?B?TlB1R3hwYUVUSEY3S1FZK0NOdXZwUU9EMCt3R3ozSlVSWGdHQlFvLzNueFE4?=
 =?utf-8?B?WnZBMXJnOCtqZWNnb0E1a2p0a2pYTXoxdmtGM04wZXN4UHd6aTdOaFhzVUZq?=
 =?utf-8?B?WUpmbG51WkViR2FaZk9pOENnSXBkVy9zM3NCZU5CZ0lJTEpFTEhiRnlHMm5V?=
 =?utf-8?B?NzhVRlA5cDZ0ZVRZcFNEc0JnSHlqdU1HdWpYaE1PbTRiZndLQ2pVQ2I1Ujlu?=
 =?utf-8?B?b21jbUlkM0JIQUorVGkrNzFyRDh0ck91WXFEbjlVSTFxSzQ2MVZaaUROOFY2?=
 =?utf-8?B?a3RVeDQvVXdzNElHdDBNWWFrMHgwUC9Ib2xJem1ZWksxdlpVUG0zUDE3cTdB?=
 =?utf-8?B?ZVNhQmdBR09uN1lVSWh5WlNJRkhFYXUwbDJ1SExhZkpvbVBqR1VjcnpTS3VS?=
 =?utf-8?B?MVFRTXg3NTdIRUEwYWhoWWxDa28vRzJZSWF1MEw5TjlmK1V4cGEwcktsSlkw?=
 =?utf-8?B?Um52cERwM0s4eHI2bGg0MDlPQW9ESmNwK0JMTWJ2MjVncDFYbWd1YmVBYnhz?=
 =?utf-8?B?R1kzbUx3bXM4OWJGQjREM3N1bWFFa3lndVMyajZWSzJzZzB1VTljcVluRExi?=
 =?utf-8?B?NFp0cDlWRzNmczFoZXAraTZYWGtwWGlhTWNGeXQybXh1c2dDS3ZRSE9ndmFo?=
 =?utf-8?B?OCtIZkxGMEdtejRaVDdKakx6ZTNjTFMzdTNWN1YyaHl1YldJVmthSFZYOVN1?=
 =?utf-8?B?Y3BITkRxdk03dFpmRnVyZTNSQlpGSUxOaVRrOW1NU01PWjNNelZYYTIwT1lG?=
 =?utf-8?B?SW5pczBEdjFmN0FGRE43dG84SnluOUJDaVduNFh2dFQwT0RQSkRtVUtCc3Na?=
 =?utf-8?B?OUc5WEw5cXV3L3NyYzI3ZVZRVkRBTExXWU01bVdPblRzS3NSZHJPckh5Wis0?=
 =?utf-8?B?c1hTWTZWNUNFYkdQMHNtWUlCcytVY2tDcGlWaG5vREJ0M1QzWnJLbm5jcXI1?=
 =?utf-8?B?SmxmaGdmWGRpL0tFS0lNckdsdlJYVDk1aXhiV1U4SE0wY2VnWngzT2VGM0pQ?=
 =?utf-8?B?Y3FUbkd3TWV5VEUwVU9yVGplcVZIYm5BTmpuYy85Z01mWFB6b211T2ZCRWJM?=
 =?utf-8?B?WlNxZis3ajkyQVFhcWtKSHFLUkVtalZOUkJ4bFFaYm9lRGltandkV2drMkFS?=
 =?utf-8?B?T2R2U1ZHQWNyUzFCd2RzZTlqQk8wcFlxN01rSk1mMk9UVmErczh3Tzk4d2sy?=
 =?utf-8?B?UXVBOGFaRi9Va055NXdabmtuM3o4aDdZLzBJNm9ObHFSVlRnWHhSdFozRTlW?=
 =?utf-8?B?ZHd0NTF4UzR0ckFkdkh4dnpiRWRGeFNUZmJtZ0V1SWNIWnFac3ZZQlBNQnlX?=
 =?utf-8?B?RVRxZHJkRjNEOGp0WlF6cmRFZk9rK3FMdjNDRzc1cmVoQ0dScEtKdEp0cUxv?=
 =?utf-8?B?RGRHYmUySTRBalhVUVBiTGlSalNOdHdDZ0Mxd0xmTGxNaTVnVjJmZE40ZVFC?=
 =?utf-8?B?Q3owZnQ4dGJOZnNFclVwSmtSZEJDdzVZSzlJMW5DQlJEdkR1RzYxY2dBN1hL?=
 =?utf-8?B?NFJPdUM1YVVnRXFmcTZQYkN4RWF3d1JIUWozTXBRUm42eHFUWDRYdmFVVXYw?=
 =?utf-8?B?M0sxSDFSSHpkeE5SYldDZnZmb2hLZnB5UEFmZXZ0MFBIVThwN1dackxqM3Za?=
 =?utf-8?B?Z2ZLeXNXNG1pZm5zbnUxeHQrUi9MbmtPVjMxQzJOTnJPdHBhY2FvaEx3bUNP?=
 =?utf-8?B?MFEreDlMSHRsQmp0Y1BneFdBdERvTVREcjNDQjVsVzdFUG9DWkVxMnl3Wk1E?=
 =?utf-8?B?Q3FNSyt0d1dmdkVna0taQUR5cnV6UVM3aDE2UjJVdkpyK3VLZDdYOGVlRDIw?=
 =?utf-8?B?ZUpCZ08vb2VhcjFha0VCdk1DTFQ1a2poWlhGQVB2akp0b0N0NUdwUE5NekVV?=
 =?utf-8?B?WUhwOXBlV290bno2WUY0UWs1Q3VIVERReU1JMFVpRXArSFNHTmxhSWFsSy9Z?=
 =?utf-8?Q?62pM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce5a0807-81ec-4c11-c06c-08d9bbe10659
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 13:29:00.0115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A1NxZbcorJG8kg59IHpcHok0oppB6cJPSruZk/VGZYV5iaElLheYfpGlFA1WNCkk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1453
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
Cc: Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 Takanari Hayama <taki@igel.co.jp>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Tomohito Esaki <etom@igel.co.jp>,
 linaro-mm-sig@lists.linaro.org, Doug Ledford <dledford@redhat.com>,
 Zhu Yanjun <zyjzyj2000@gmail.com>, Shunsuke Mie <mie@igel.co.jp>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Hefty <sean.hefty@intel.com>,
 Maor Gottlieb <maorg@nvidia.com>, Jianxin Xiong <jianxin.xiong@intel.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.12.21 um 14:26 schrieb Jason Gunthorpe:
> On Fri, Dec 10, 2021 at 01:47:37PM +0100, Christian König wrote:
>> Am 10.12.21 um 13:42 schrieb Jason Gunthorpe:
>>> On Fri, Dec 10, 2021 at 08:29:24PM +0900, Shunsuke Mie wrote:
>>>> Hi Jason,
>>>> Thank you for replying.
>>>>
>>>> 2021年12月8日(水) 2:14 Jason Gunthorpe <jgg@ziepe.ca>:
>>>>> On Fri, Dec 03, 2021 at 12:51:44PM +0900, Shunsuke Mie wrote:
>>>>>> Hi maintainers,
>>>>>>
>>>>>> Could you please review this patch series?
>>>>> Why is it RFC?
>>>>>
>>>>> I'm confused why this is useful?
>>>>>
>>>>> This can't do copy from MMIO memory, so it shouldn't be compatible
>>>>> with things like Gaudi - does something prevent this?
>>>> I think if an export of the dma-buf supports vmap, CPU is able to access the
>>>> mmio memory.
>>>>
>>>> Is it wrong? If this is wrong, there is no advantages this changes..
>>> I don't know what the dmabuf folks did, but yes, it is wrong.
>>>
>>> IOMEM must be touched using only special accessors, some platforms
>>> crash if you don't do this. Even x86 will crash if you touch it with
>>> something like an XMM optimized memcpy.
>>>
>>> Christian? If the vmap succeeds what rules must the caller use to
>>> access the memory?
>> See dma-buf-map.h and especially struct dma_buf_map.
>>
>> MMIO memory is perfectly supported here and actually the most common case.
> Okay that looks sane, but this rxe RFC seems to ignore this
> completely. It stuffs the vaddr directly into a umem which goes to all
> manner of places in the driver.
>
> ??

Well, yes that can go boom pretty quickly.

Not sure what they want to use this for.

Christian.

>
> Jason

