Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC60C31555E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 18:46:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280796EB85;
	Tue,  9 Feb 2021 17:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954296EB85
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 17:46:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCMCOUCpkicO5QRY/qRM7pPeqbwxl9lHDFZKO+IeDb5+yDawVEv0+rrdeftCzK4UDbDF8HPR8ESNGWhBj1kGzH4HU3h5UawD68dl0Cy/Qh1Ce0bkFOXFUY+G9W618/PU4zLTpN+YoxFjoDpJVG9zCBpPC2P/jLrI82FZbRT7Q3xTPaQf77Bq6/DPTru3jz2MssUOy8oXM5CYOuhH2+kE4iKiT4+f0HTQOOEIVTR1KXV3acnBgjKcbnt1Hmi22rZME/BFmugRLxeyTD6PcV4Hd990ceXElBx9dwKjcJ/an9mPxjk7x45M3Aqp/kTgasyUyJWm59hkIcFB3PzdQcAfPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OVDWMr3VC10GbAAJQyMf4L/d3lFCGKnTmvTvLn4kkM=;
 b=EU4BYEy1wLfTEI1QwiQ5b5L1UMoxo7i2QmodrVjVpLZah60sqTieC+6CjBGYX5BZDZpVFC07iGWu6/9bLYPhi/aEi8iLey34yugSHrqe+knAOOzgTYqvvgp0PacYc3ybX7ya7bqn0hfWq3O+HoPJLtyJDjBif0A9FsvCEhyqoQ7XTn2TfHVkgoKU1bZRO4Czj2IO2bu8V32OeHhRcatdluv/3quxuheRY+QhY6A9xhVch4JsqY8pFU9Fmc/Ne1vIrmDypEfn5KAuJRB3+sht0ccAp2hS0OWKU5cjMeQK5HwaO/bmT7lHge8hbjwx7hPwIoPttXHtvNjHyCgu/3QQkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OVDWMr3VC10GbAAJQyMf4L/d3lFCGKnTmvTvLn4kkM=;
 b=RYe/v8fyPI1TaeGOzhs2NGItn5eF2qiMF2PU2ZNzvCPY/1TIdFl1u3d9TuJ6ke/yKbai9K6ZPIgipCEMdSsWsVxw8uRF9Aqveh05GxvmQzYzNKfU52wOkd4WhpEh4QqqhwJjRttGh2+XAgyZQ31EVSbQaD+0ESeABAiBcd5wzuI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4223.namprd12.prod.outlook.com (2603:10b6:208:1d3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Tue, 9 Feb
 2021 17:46:43 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 17:46:43 +0000
Subject: Re: [RFC][PATCH v6 1/7] drm: Add a sharable drm page-pool
 implementation
To: Suren Baghdasaryan <surenb@google.com>
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-2-john.stultz@linaro.org>
 <4471b3b0-603e-6dbb-8064-ff4a95afbba9@amd.com>
 <CALAqxLWZkUFvJX5r2OU2erW4tU3j=+u==VTyzYkt+95LwwVCUA@mail.gmail.com>
 <48225879-2fe1-22ac-daae-c61d52465aea@amd.com>
 <a9dd7f8a-ef30-9eb4-4834-37801d43b96f@amd.com>
 <CAJuCfpE-T4Cs_h6LfrgHE+T_iOVywU2oNzLquYETudOaBMauMQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c7df099f-27f7-adc6-4e87-9903ac00cbea@amd.com>
Date: Tue, 9 Feb 2021 18:46:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAJuCfpE-T4Cs_h6LfrgHE+T_iOVywU2oNzLquYETudOaBMauMQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:fd71:881d:d213:f46a]
X-ClientProxiedBy: AM3PR07CA0122.eurprd07.prod.outlook.com
 (2603:10a6:207:7::32) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fd71:881d:d213:f46a]
 (2a02:908:1252:fb60:fd71:881d:d213:f46a) by
 AM3PR07CA0122.eurprd07.prod.outlook.com (2603:10a6:207:7::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.11 via Frontend Transport; Tue, 9 Feb 2021 17:46:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 46555105-3d6c-48b9-1eee-08d8cd22a988
X-MS-TrafficTypeDiagnostic: MN2PR12MB4223:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4223AD290AC034EB00E75EB5838E9@MN2PR12MB4223.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CqoE9asoBOC4TjIofMuktziMZrKeaBNvJKGiOIgSagSXbQBKIWz/zlan4Fn6bNkjhL2m+CttDuGwFc8btJG63Qe2SAOArU9tUjbBCxW+Phi3N7qNNnJu4oTZ06mruiVonhnajnNdqMCdS3yweVDfveYOzhiUKXKLm7VlgthNb4Kwm2RlgW+fIu7rD0Nyd5pMQjxLHx+XgAu24q5DEiQIeS1fvJ5hZXjwWIIc491UMlUuuqsrhLnYrW9cZf4sO3slUeZZ38wv2WATv0IW+nbo/vQI2sLXJjuzaiKlQ+TH/VQpofVfqowwGft1ldJjTBcseikWNmVUtaUA3ji+nVubNjGYTxHpDZQ6fsM6qBzyNGASGj8eX+ZLHAjkjdFyLAguBsL1++qJ8Aw+QdWko4r3mP97Wgz0xUn7x/eAPJIH8e2Jxb2USKWF9/GJa8utSadJh/9L6+U1aLKJuNBctIBAt/PiGq9z4cM0B0Uh91Hx2EnubFHWiHlpTqcOv3XjzpY5gB2wrYZoRMH1MD9fhPGQ5aJuPPpTZp8fkVbjP5mrVl2Z13HMB95TPyvLrtyUB9wtt7KxSPDY5NCiiwLWMr3nsm5Km3SKrFEtn8jSt8Q1NtGFmZKSXLNIJ2g6W2WnxKrNL2OWZqsmjzREJqNT5c2ttouYp9VUxQwST1m4cTrSExSKG8GYDw3jQRAZDc+PJtqK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(186003)(4326008)(45080400002)(66574015)(2906002)(966005)(86362001)(31686004)(66476007)(6486002)(66556008)(6666004)(5660300002)(31696002)(52116002)(478600001)(16526019)(8676002)(6916009)(8936002)(36756003)(54906003)(7416002)(53546011)(66946007)(316002)(2616005)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OGVhcW9Yblh6YVp3NnhQZ2pNK0JIVHVlTUpFUUF2MHAzTXFnQmhEQ2JicEFB?=
 =?utf-8?B?NTJPazBjalBPV3BJaDg5NnFhVnloZzRwbTdEUVEwVjhHbkhISUNiN3ZlZ2xj?=
 =?utf-8?B?RUxFQ08zRU16dTkvT1d2MGZ0MGlhZWV2eXRGZExxVCtEZmQ2WTJ4dUFXSjVJ?=
 =?utf-8?B?NzNXbWYrczlCVTluM3lmU1RaVFkrVWxMTWJsaXY1dlAyZ1hTZWkzWldUS0dV?=
 =?utf-8?B?SFc0MnJZdURpcEQ2NnJaU29KQ0lpcnVpUGY3cjZZcFN6eVhVQ01qTHYzSHFP?=
 =?utf-8?B?eklxZlNQNGZlbGNxZjNzUnJLd1NRQ2VQZkpOUU1nclBYNDFCYkxoQmZrRFNJ?=
 =?utf-8?B?eEF3WTJGWUVVNE9ZT2p1c0hMMHpVaGRGcG14bjUvNGdOTWc5bm1Bb1k0c2ZW?=
 =?utf-8?B?ck5WU1FBV2duWUNwS2d2WkRvWGp3WmZqOERUNzVlbytMTXZld1AwU2hwTUpz?=
 =?utf-8?B?WU9yRStGVkZzZ0FvSXplVitXZkJoUkxQdzdOb3JIWWxQSmg4Y3dVbGE3cm1l?=
 =?utf-8?B?SU5jVDM5WUJrZlVucGJIY1lhTVJHTHdQQ00rN3N2Sy9Kbll2YnRYM0g5bzJx?=
 =?utf-8?B?R3lBaUZlK1YvT0o3S2I3Q1Evei91b01zMWxzcWJMRGVKSW9YcmRYcHZQbjlH?=
 =?utf-8?B?bUhyc2tNcEdXL25WeWViWEEzd1RYT1hXb1YySHl5MXVmVkw4eWljVWp0TnNL?=
 =?utf-8?B?MnhuVXBidHptS2FseG8yTXhTTVY2Uk9jMTlLaytGWnpTMWxOS0kweWZnRUFL?=
 =?utf-8?B?RkNaQ0M3U0xyaTkwRC9IME1zeStyRHB2SFNNWGJseWtjQW9OTkdpQ2VDVlE5?=
 =?utf-8?B?Q2wzR2EyeDNVMW9xV3hySUJRcmVGeFVrNFQ4c2VyNFRNQ0JieWF1Rnl1MlJv?=
 =?utf-8?B?ZjdzWWZJa2ZqM212WXpVb0ord1FmVTkxYlVtVytuMWdXakFMeVlsRTd1N0g0?=
 =?utf-8?B?aGdjYlVXa2ZGc0M1YlNmK2lXY2lNelg5THhuQWtQbjlMNVZTV1BJR1cweFB2?=
 =?utf-8?B?ZHFEbFZGbWRxWWRCc25obnhWVDBWSCtkYVc0SW1FZTBIQmNieTFEZW5vSDJn?=
 =?utf-8?B?NEUxZytoU2VabnpjS0ZyY2pmbk5FSW5zejZuSU5rbTZKeTNrdWw3eDVnNERH?=
 =?utf-8?B?QVB2dGVKOUZLSU9hL0ViMDNOSitwVG5pV3VlYUZ4TjFqcGhKZ2h2R1l4YUpk?=
 =?utf-8?B?SktnemErcWkyN1dueVoxZzh6RFU4c2RlWVFBL1JIdnpyWllpRGhwWWhmcHNv?=
 =?utf-8?B?SHp2M2lvVGZ1Wmo3VlBCdTVEaHh0M0xRc3ZYOVBVeVpjbDVaeUxIVDJrTUxI?=
 =?utf-8?B?TVRYWVdhbG11enBmODNXdVkrV2VhOGRvckV0LzdTb0tUSW1iekEvR1BocDla?=
 =?utf-8?B?cEtnTVc1b1M1eWFnWVBvUzFYcHg4UGRsbG0vQnpQV1BlU3FKakR6d3FPUU9j?=
 =?utf-8?B?M0RObm1YSzZzY0kxZ1FoblFLODdJSElCb2RaWDdvcnB0ZEFsRkpzRVJ5dmR5?=
 =?utf-8?B?bnpSbjV6ajhiYUdPZ2ZuU1FGMkF4NjN2S0l5RWxZZ3RwVU1EWHlIRHJUM0U1?=
 =?utf-8?B?NEhRVGhSVytvdzc5ZXo5aHZyWkxid1ZKbVJFSXgxNFJYMWY1QjByeCtYU1lD?=
 =?utf-8?B?Y21Ic3Z6K3BFejR6MXVmdzVGdkExVWhhaGtKZlRsM0xtdUZ4SnQxMktmZDU5?=
 =?utf-8?B?d3libkV6VkludGRENWlzdUs0QzZibnYwZDBPTGJ1ajJrbmZOd241clhwZDRT?=
 =?utf-8?B?R1pucktuS3hHSTg1SGJWSU9xaElVdFZaWForRnJjZVQ2TUNwTGc4TzJZTkh6?=
 =?utf-8?B?MUJlUHpwdmlsQVJUYkt0NmxyeU5zNm5RVkRQeG1iUTFxRUZGRjI4TWUzNE14?=
 =?utf-8?Q?GzlS14C+pHGYS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46555105-3d6c-48b9-1eee-08d8cd22a988
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 17:46:43.2276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yY0mzzVeerlw7mMve/dYcat9tuIzNAYi8pRwgf3TuRfXqCdCylWLz/Hfdm9d5OPG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4223
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Sandeep Patil <sspatil@google.com>, Ezequiel Garcia <ezequiel@collabora.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=c3=98rjan_Eide?= <orjan.eide@arm.com>,
 linux-media <linux-media@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Daniel Mentz <danielmentz@google.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAwOS4wMi4yMSB1bSAxODozMyBzY2hyaWViIFN1cmVuIEJhZ2hkYXNhcnlhbjoKPiBPbiBU
dWUsIEZlYiA5LCAyMDIxIGF0IDQ6NTcgQU0gQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPiB3cm90ZToKPj4gQW0gMDkuMDIuMjEgdW0gMTM6MTEgc2NocmllYiBDaHJp
c3RpYW4gS8O2bmlnOgo+Pj4gW1NOSVBdCj4+Pj4+PiArdm9pZCBkcm1fcGFnZV9wb29sX2FkZChz
dHJ1Y3QgZHJtX3BhZ2VfcG9vbCAqcG9vbCwgc3RydWN0IHBhZ2UgKnBhZ2UpCj4+Pj4+PiArewo+
Pj4+Pj4gKyAgICAgc3Bpbl9sb2NrKCZwb29sLT5sb2NrKTsKPj4+Pj4+ICsgICAgIGxpc3RfYWRk
X3RhaWwoJnBhZ2UtPmxydSwgJnBvb2wtPml0ZW1zKTsKPj4+Pj4+ICsgICAgIHBvb2wtPmNvdW50
Kys7Cj4+Pj4+PiArICAgICBhdG9taWNfbG9uZ19hZGQoMSA8PCBwb29sLT5vcmRlciwgJnRvdGFs
X3BhZ2VzKTsKPj4+Pj4+ICsgICAgIHNwaW5fdW5sb2NrKCZwb29sLT5sb2NrKTsKPj4+Pj4+ICsK
Pj4+Pj4+ICsgICAgIG1vZF9ub2RlX3BhZ2Vfc3RhdGUocGFnZV9wZ2RhdChwYWdlKSwKPj4+Pj4+
IE5SX0tFUk5FTF9NSVNDX1JFQ0xBSU1BQkxFLAo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAxIDw8IHBvb2wtPm9yZGVyKTsKPj4+Pj4gSHVpIHdoYXQ/IFdoYXQgc2hvdWxkIHRoYXQg
YmUgZ29vZCBmb3I/Cj4+Pj4gVGhpcyBpcyBhIGNhcnJ5b3ZlciBmcm9tIHRoZSBJT04gcGFnZSBw
b29sIGltcGxlbWVudGF0aW9uOgo+Pj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rp
b24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdpdC5rZXJuZWwub3JnJTJGcHViJTJG
c2NtJTJGbGludXglMkZrZXJuZWwlMkZnaXQlMkZ0b3J2YWxkcyUyRmxpbnV4LmdpdCUyRnRyZWUl
MkZkcml2ZXJzJTJGc3RhZ2luZyUyRmFuZHJvaWQlMkZpb24lMkZpb25fcGFnZV9wb29sLmMlM0Zo
JTNEdjUuMTAlMjNuMjgmYW1wO2RhdGE9MDQlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQu
Y29tJTdDZGNjY2NmZjhlZGNkNGQxNDdhNWIwOGQ4Y2QyMGNmZjIlN0MzZGQ4OTYxZmU0ODg0ZTYw
OGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3NDg0ODg4MTE0OTIzNTgwJTdDVW5rbm93biU3
Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2
SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1wO3NkYXRhPTklMkJJQkMwdGV6U1Y2Q2k0
UzNrV2ZXJTJCUXZKbTRtZHVubjNkRjZDMGt5ZkN3JTNEJmFtcDtyZXNlcnZlZD0wCj4+Pj4KPj4+
Pgo+Pj4+IE15IHNlbnNlIGlzIGl0IGhlbHBzIHdpdGggdGhlIHZtc3RhdC9tZW1pbmZvIGFjY291
bnRpbmcgc28gZm9sa3MgY2FuCj4+Pj4gc2VlIHRoZSBjYWNoZWQgcGFnZXMgYXJlIHNocmlua2Fi
bGUvZnJlZWFibGUuIFRoaXMgbWF5YmUgZmFsbHMgdW5kZXIKPj4+PiBvdGhlciBkbWFidWYgYWNj
b3VudGluZy9zdGF0cyBkaXNjdXNzaW9ucywgc28gSSdtIGhhcHB5IHRvIHJlbW92ZSBpdAo+Pj4+
IGZvciBub3csIG9yIGxldCB0aGUgZHJpdmVycyB1c2luZyB0aGUgc2hhcmVkIHBhZ2UgcG9vbCBs
b2dpYyBoYW5kbGUKPj4+PiB0aGUgYWNjb3VudGluZyB0aGVtc2VsdmVzPwo+PiBJbnRlbnRpb25h
bGx5IHNlcGFyYXRlZCB0aGUgZGlzY3Vzc2lvbiBmb3IgdGhhdCBoZXJlLgo+Pgo+PiBBcyBmYXIg
YXMgSSBjYW4gc2VlIHRoaXMgaXMganVzdCBibHVudGx5IGluY29ycmVjdC4KPj4KPj4gRWl0aGVy
IHRoZSBwYWdlIGlzIHJlY2xhaW1hYmxlIG9yIGl0IGlzIHBhcnQgb2Ygb3VyIHBvb2wgYW5kIGZy
ZWVhYmxlCj4+IHRocm91Z2ggdGhlIHNocmlua2VyLCBidXQgbmV2ZXIgZXZlciBib3RoLgo+IElJ
UkMgdGhlIG9yaWdpbmFsIG1vdGl2YXRpb24gZm9yIGNvdW50aW5nIElPTiBwb29sZWQgcGFnZXMg
YXMKPiByZWNsYWltYWJsZSB3YXMgdG8gaW5jbHVkZSB0aGVtIGludG8gL3Byb2MvbWVtaW5mbydz
IE1lbUF2YWlsYWJsZQo+IGNhbGN1bGF0aW9ucy4gTlJfS0VSTkVMX01JU0NfUkVDTEFJTUFCTEUg
ZGVmaW5lZCBhcyAicmVjbGFpbWFibGUKPiBub24tc2xhYiBrZXJuZWwgcGFnZXMiIHNlZW1zIGxp
a2UgYSBnb29kIHBsYWNlIHRvIGFjY291bnQgZm9yIHRoZW0gYnV0Cj4gSSBtaWdodCBiZSB3cm9u
Zy4KClllYWgsIHRoYXQncyB3aGF0IEkgc2VlIGhlcmUgYXMgd2VsbC4gQnV0IGV4YWN0bHkgdGhh
dCBpcyB1dHRlcmx5IG5vbnNlbnNlLgoKVGhvc2UgcGFnZXMgYXJlIG5vdCAiZnJlZSIgaW4gdGhl
IHNlbnNlIHRoYXQgZ2V0X2ZyZWVfcGFnZSBjb3VsZCByZXR1cm4gCnRoZW0gZGlyZWN0bHkuCgpS
ZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4+IEluIHRoZSBiZXN0IGNhc2UgdGhpcyBqdXN0IG1lc3Nl
cyB1cCB0aGUgYWNjb3VudGluZywgaW4gdGhlIHdvcnN0IGNhc2UKPj4gaXQgY2FuIGNhdXNlIG1l
bW9yeSBjb3JydXB0aW9uLgo+Pgo+PiBDaHJpc3RpYW4uCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
