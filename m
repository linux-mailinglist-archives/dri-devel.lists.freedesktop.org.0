Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5836D3AD0A3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 18:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6182C6EA40;
	Fri, 18 Jun 2021 16:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4006E123;
 Fri, 18 Jun 2021 16:42:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcsbmyf0D87QpmvFjoVZH9Rsp79RgfMgjNnKznAQ5od1eoO8mEksFQ8dQaAK8EsKd+XGMgNyK/R8yAS3hHTPTvo+bPkyAcVKk1DqlkvamO7x7OprMRO5pQBH7D/qbtzVoNh7vy4pzU440hYJJsG13soPuTK3gtDYm2HY5ZnavQjQoEfZnUqyI8G2LCnhKEanxitSKD/qRQvLNhV0rvOJAsLAN+rRXLwaBESbj5T1ZJFAsW7LFHdAqpKaQTEcE4n3ZYgD0pll+KsKAHd2We6ggJI5qjr4moL1v2ZUM6cIkCmg8Vh5cqBmF7Pl0cLjtUKIQfYdNU/OTn6Ed2i+BceAAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWieP9uxUVtctKyKxYm3TxKEF5HznzXpdeH8Y4SSTgM=;
 b=FYDpripaZsJJVdfj90vpKPf1GGgHF3WsC53Iw5HEPY9qlxC+yI9DYmvSVFRFdlKW3jNuLGMpSMUKnYKI9wKiOHRvnSkTS3prJXjMifhZn8muj4eVDiP/F/kOCZtaEijDLGO/ppyel1C7tY9I2fOUyfa/QxuV2EQv/+MDCE2JjYcXdEFMrietzZ/Al+nbG3k4o5/HFdnwFFY3f0QTv5PKNui/Ew3/RMrzQsbA5wZKw24a1Kidl9ZpXIiLKnMWtKa4CjCDihBh+snhTGcWvuVFGQ7vbcChe/xlbL8+sE7poMdtln+XAVigdjAJFmxi2tW3G5Aw/upo8tskl7wTRGOYTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWieP9uxUVtctKyKxYm3TxKEF5HznzXpdeH8Y4SSTgM=;
 b=IzSpM3Ya4ZDl/4K59KDYIw6DXQ1kFDa/UPx8+Aswo3k3C1NHKxP23nKBmraDrQkMlygvu2wdIXULLA3Ehn3H/Vn8Qn0ceKGwyDIfIQECKPRxHCT2zeZXqBkr5kdWCUTTnFhMQc4d1qFinNl6uvXmjmLsB93byIn1nzctwUHbHsI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3951.namprd12.prod.outlook.com (2603:10b6:208:16b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 18 Jun
 2021 16:42:57 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 16:42:56 +0000
Subject: Re: [Mesa-dev] [PATCH 0/6] dma-buf: Add an API for exporting sync
 files (v12)
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210610210925.642582-1-jason@jlekstrand.net>
 <29e9795e-8ec7-282c-c8ec-413eaed2e4d4@gmail.com>
 <CAOFGe94oFA9=vy56--hm=9=232+Npnxrpn+6gGFpRM2dmJZh3w@mail.gmail.com>
 <84135114-71d4-77f0-7a6b-69bb81b7f73c@amd.com>
 <YMupgTffAfw8xw51@phenom.ffwll.local>
 <e8fc12a3-42eb-30f9-c6ac-772fbc675678@amd.com>
 <CAKMK7uH5oW3icBPOPsumRv+LJ-5qCVKgfniXd-J8mnA+JuRq+Q@mail.gmail.com>
 <53c1c0c2-5e17-a54f-155b-66f3cd4b48a3@amd.com>
 <CAKMK7uHng_beNWeYa50Nxrz2SQVmjTuuN-cAYz-SQtAymGdH3Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b364d818-edeb-a2e9-a3a0-960e2463f086@amd.com>
Date: Fri, 18 Jun 2021 18:42:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAKMK7uHng_beNWeYa50Nxrz2SQVmjTuuN-cAYz-SQtAymGdH3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:bc4b:3792:1cd:4c5d]
X-ClientProxiedBy: PR0P264CA0056.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::20) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:bc4b:3792:1cd:4c5d]
 (2a02:908:1252:fb60:bc4b:3792:1cd:4c5d) by
 PR0P264CA0056.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Fri, 18 Jun 2021 16:42:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da0e2a50-6d57-4f26-dbe1-08d93278200f
X-MS-TrafficTypeDiagnostic: MN2PR12MB3951:
X-Microsoft-Antispam-PRVS: <MN2PR12MB39512C15D7CFEB88575E7770830D9@MN2PR12MB3951.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +k+JVoWRL0R1CFBCwFcOYyz1at3DaLeiRjRAWNLe8+NpOYxjMn0WMtsMk6bHfa0/1RAuV91gjBJ/3XTR7kvRLHxCFI+vbp8nLVNbu+t5sv/JCksvlw+RvJmHMMZKYaeqOb2PjQXYlu/XhBGeNt8CDImlZ1nY9Zs/nP1VcCYlzQIfx2zo/p1xKKHhUPe0BIv1SrPMZ6nrQemHfCcdKrkI/dooudk8y1JEExKnW/zWdgJt7yqqUHWBL8RRZesVtLHJlieOgQVZv4/B00Ejxgx8n6G1hAHNXTC53QJqkTatWRUN8zBbsMnj6D7dFl1xpBW6+zTnaEWYKcy/VK+vp7eGeuMv62GgjcwST/A9kI5H1NauB5P65wLtEiFhRQ6r71WevP/Dyj3pfMJuDhigPcmoCS377m6UG7fsNoRgEcLklRo2L/RfObTZZjV6vBxpFPYm/ZdlGjoWJBX7uYNI5gxP2o2eAEynxmUsLBcXkatNhI3qgZI2Bj1uSHnl753Gn5xLTzqBrLcGYp3LLiHha2Fkxu9szhv1AVaADZyBi7KUbO+OGs6cAuU5OTLrX3Y1dXYGHpp7GMltSg6gsatVT5necAcCFyqpqJybMMjfO8gV4/uilMogC3C19B/1IlUmi67TAYMlHZXsngEvMkpjAxGyMdxOdrhff9hRmmYZeMk8ckwinHdnM29Y3EwP95+iDdGW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(4326008)(16526019)(31696002)(8676002)(478600001)(36756003)(66476007)(66556008)(6666004)(83380400001)(8936002)(6486002)(38100700002)(186003)(31686004)(316002)(5660300002)(86362001)(2906002)(66946007)(2616005)(54906003)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTU5MEZ4U1ZvTlN6TlhNQ0l1b2ZxeGFDejl3WXBiUzFlMnZlMWJnNXl3cjVC?=
 =?utf-8?B?YSt0MEIyVlFKTkJzNE9vd1hRalVPeGVKbk1OMU54S1R5ZE9jdmhMWjdOTGdp?=
 =?utf-8?B?TGROZVg0dUUwaGFBTVBZSisxWXZpN200WllPaWVqek0yR2l6cTgydHVWdk1W?=
 =?utf-8?B?M0loVm5iSzNHS2hUUXRmcmoweDhMMEJPOTJOcS9VZGRNTDN0NTFQMEpvaC9H?=
 =?utf-8?B?emtERko3WXQ4NkY0QmFwcVVneEp0bWIvbVpPUnBmTXZ1aXpGRm5raTRIaWNN?=
 =?utf-8?B?VE50b3pDZExMSitYY2tFd1pvQ0xGeVUydUdzM0hMTW9RVnJjRlRaQjlIVEk2?=
 =?utf-8?B?V282cnQ5TjA5OEJqbGNER0VXOWxtMVlzVWRnTDNIRlgyMDdBWXo0NEVKU1NN?=
 =?utf-8?B?OVNhUk9FYVVPN01wcVNKZytCaVpyZEJBUWhWdFpNc0kwYjNNcktOZVJTU2px?=
 =?utf-8?B?UUxSWjJsUzlzN3Q0M0RyQXg2NXBGdisyZjNVbHVqMVJqYm5kbCtjc2dZRnQ4?=
 =?utf-8?B?ZHk0bk5MWHJBRVEraHlmaWFDL0RpS1RWdUpxZGwzdzlWbWc2OHN2S3FuQ3J2?=
 =?utf-8?B?UDB5T1JYdUxXaWFNd0RMVkJISit4R0tOd3ZJV1ZoU1hHMnF4QUZ6cDlpbE16?=
 =?utf-8?B?aFhuUUlURHJWUmpMdjUyVURKQWt4cy9ZTFR6ZjMrUjZJc3dtRWZhZldZSjJH?=
 =?utf-8?B?WVM1b0pSUlFydUIxczY4bmlOWU8rbDhsN3RJTmRDd2FyQ0hCR0MxNmpzYkVz?=
 =?utf-8?B?WmxWRGZaRVdSU1FqM29OQjF5MEd6S25TZFF4eWhmMndIamlweGdlWkN3V1dG?=
 =?utf-8?B?WWUrQVJDOUtBTTJLNkxmaTQvYmRSV2p5VHl5NHpIUDAxY2xlaUpFOUh3ZWdX?=
 =?utf-8?B?YUpFOFhJSlFRMzNrakZENzRSOFgrTUx1OTZsVXZ4ZnI0c0duTTMzLzBuOTNH?=
 =?utf-8?B?REJOZDMxbmtINjZqdStUSjNRZmFoZjRYVWVLRVl3Z1BpSk5sNE9vcCtFWlNM?=
 =?utf-8?B?QklGQTlKUEVYZHl6OTdxRnFJWUVWZW9tbXFnMWFLQ3luR2x1YXFFQUVxTnJs?=
 =?utf-8?B?ZHZTekxhL0Y2NWpwcHdCOERBYVdBY0s5RTdPZ01ZWjIxejQ3SFdTWVkwZmMw?=
 =?utf-8?B?VjZjVjNrUmNybEJmQ0NPZ1M3Z3FuRytnbHZtcmcvbzlXV0Z5QU1KTkVEcHkr?=
 =?utf-8?B?SkRGNjR6TFpjR3MwOEY3T1lCMzVTVmxVZTRielZqVUQyaStpeHVIYWZYLzA2?=
 =?utf-8?B?ckF6Q1lET2YzcnJscUR4bVBxOEN5bjVSNWpPbWVFZTVhdVZueUlseVMrSVk5?=
 =?utf-8?B?VWpXYmFEUFBNaXprVkNDR3k5QlJzOEc1cjQ2M3YrS3g5Z3FSUE45WVJuZmZk?=
 =?utf-8?B?WFFWT2ZPREZ4dktaZGEyeXV0RE5ERDBGMkNJVUxkYkJzLzl1eDFlYjFqWmtP?=
 =?utf-8?B?WG5zazJXNVVCNm1DQkZkUkNBRlpLUG9ncE5vSDE2bVBVay8wL28zNU90NWJO?=
 =?utf-8?B?K3lFRW5ydDUwclBBL2RIbGswSXRncnZ5SEEzdzhqd09XTm1wbHpFTXFkMHAz?=
 =?utf-8?B?dWZ6VHptM0RiSXV1YjBDbmVMbEptZmhjT0tncU5rK2FVQVpKcko1ckpQL05X?=
 =?utf-8?B?UVo5TDVPVzBNTjZWcHdBY2xSRVY3VkhLdmd2ZnVab252aWo5Ykpkc1o2bGFU?=
 =?utf-8?B?ZU5NU3BPYVdsbUFKQUFlN3hqMDZncENybytOck00WGZvMGk3ZDVoNkhjWXZU?=
 =?utf-8?B?NnJRQUpUT2dlOUxnbDFxLzh0emZ4WnpIem0wUnpFeVR2elMxVVhEQjlIUXls?=
 =?utf-8?B?Zk83a2JLUXFPUkcrN293a0xMNWhwQlFLRVVRVkx0RWVaVkI1aGxabHIyUnlT?=
 =?utf-8?Q?JvnxRRgLbiEgw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da0e2a50-6d57-4f26-dbe1-08d93278200f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 16:42:56.9058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DLOHP/2HG/8aAZHLzcbqihGSB6JNOnv6ANT+6fgIAKjJyAK1n7i9Wf0hcSYRTNJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3951
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
Cc: Daniel Stone <daniels@collabora.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>, Jason Ekstrand <jason@jlekstrand.net>,
 Dave Airlie <airlied@redhat.com>, ML mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.06.21 um 17:17 schrieb Daniel Vetter:
> [SNIP]
> Ignoring _all_ fences is officially ok for pinned dma-buf. This is
> what v4l does. Aside from it's definitely not just i915 that does this
> even on the drm side, we have a few more drivers nowadays.

No it seriously isn't. If drivers are doing this they are more than broken.

See the comment in dma-resv.h

  * Based on bo.c which bears the following copyright notice,
  * but is dual licensed:
....


The handling in ttm_bo.c is and always was that the exclusive fence is 
used for buffer moves.

As I said multiple times now the *MAIN* purpose of the dma_resv object 
is memory management and *NOT* synchronization.

Those restrictions come from the original design of TTM where the 
dma_resv object originated from.

The resulting consequences are that:

a) If you access the buffer without waiting for the exclusive fence you 
run into a potential information leak.
     We kind of let that slip for V4L since they only access the buffers 
for writes, so you can't do any harm there.

b) If you overwrite the exclusive fence with a new one without waiting 
for the old one to signal you open up the possibility for userspace to 
access freed up memory.
     This is a complete show stopper since it means that taking over the 
system is just a typing exercise.


What you have done by allowing this in is ripping open a major security 
hole for any DMA-buf import in i915 from all TTM based driver.

This needs to be fixed ASAP, either by waiting in i915 and all other 
drivers doing this for the exclusive fence while importing a DMA-buf or 
by marking i915 and all other drivers as broken.

Sorry, but if you allowed that in you seriously have no idea what you 
are talking about here and where all of this originated from.

Regards,
Christian.
