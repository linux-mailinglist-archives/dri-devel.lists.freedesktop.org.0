Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D3B31F0AB
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 21:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A477D6E886;
	Thu, 18 Feb 2021 20:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C98F6E886;
 Thu, 18 Feb 2021 20:03:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWvTdGtYSi/w+Ftm1jI1ii+BFwGsEtjoUe4kwgTbHyte1228lx7z7qJ+DyvQb//4bClLqIdN3SerxTbZxW7Ise5p1o7LIDFUrrYdRdRyewDUaASBvqkSBQqYb7k6dOTrSKEqnM29Wq6VYEVi0HnOlXIvNQJ4d2aYMfZTKcGQ1sveHUp1BNROuw0d55L/OkvE5R2ktUHHOM2epSECC64hnCPbdkZiKcAdU+/GnfolVrtmmwvDmajYcxe7sFMs01JeXx151d/9ii15OXciJ2JyTVNjv/5/Q5at/pgqiZdBPRwtLzmWakJV4THYJr1IswZl9SxH5UDp1T9Va6scUdiw3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHSP6JHrFtIU0S9QyUYrQ3WGR9bM7MJEqWw3jUV1DiA=;
 b=OjPsWVa6bW05VY8WnKFgPAbvC2WxJLbYdHnlCiX711b6qdMSNa66o4SnI4Mvhd49Kbny59lK/HurrMSLVxGo2ei5rUHy942Ojk/C6LGeFHpvlHXjQEcHyUo5Cl5WLdmCWBP9pvj59qc1m0t+t0WIdpmc63pzNvBB/YpJxHSnkpKrY4jYI0Z/rNL7FlCNjxg4aN2HilsYuIOjF6A0c2rGVur6m3YSoNDgRnYV3MEfC1rz+/UF/0+FzQd9uEKgT4oY/NXAZWgr70r+2oOKf1NrvHkhdYlhfXDWnY5ZSXKstHidZm/HxS4MDMHvfNSJTUR1bsRKX9jHb7tQ4ugwGs7ZRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHSP6JHrFtIU0S9QyUYrQ3WGR9bM7MJEqWw3jUV1DiA=;
 b=QpeQKfHtQWRnQqIkrHQvchv6whjFffJJdW+n56MDlkVPEDLaOCeFsoJoTZl68gcJZyIZUxa37iGsQv2z/kiDueN0tuq13nEXsZR4qwK6k1MAjyfjbCqA8S2RcrutsLXcF3n10NxK8zjSFgJGVtZIT2VfHErP15oTeixqRtZCzWY=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4398.namprd12.prod.outlook.com (2603:10b6:806:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Thu, 18 Feb
 2021 20:03:44 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f%5]) with mapi id 15.20.3846.025; Thu, 18 Feb 2021
 20:03:44 +0000
Subject: Re: [PATCH v4 00/14] RFC Support hot device unplug in amdgpu
To: Daniel Vetter <daniel@ffwll.ch>
References: <YAbpxbTifiupYJML@phenom.ffwll.local>
 <c4f911dc-99a9-387c-21d1-a3ca2cfd78da@amd.com>
 <CAKMK7uFKMgKAQSCgunjStuUTbuiwdR3zjwtn_Ms1XJjO0ML2EA@mail.gmail.com>
 <755e7c8a-5bd7-6414-8141-249a1ba5a865@amd.com>
 <YAfyPEB2gpMnW/PP@phenom.ffwll.local>
 <8ea4b2d7-d5f3-3708-724d-c70520603283@amd.com>
 <CAKMK7uE11MonjPB3dmy6u=b029am1p2KqJ57DgLUGu-9QgtebA@mail.gmail.com>
 <75e782f1-4cb9-9210-87d2-e7d2a76782f1@amd.com>
 <CAKMK7uH=ycuBQ5qbujA8kwcrExAC4YAM26W-7wJjE7RS4zPiHw@mail.gmail.com>
 <6152bf16-6086-17f5-4157-c9be0ef84155@amd.com>
 <YCJa2HraImprr4Ew@phenom.ffwll.local>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <871a02d8-e776-dd37-bd25-3169f8167923@amd.com>
Date: Thu, 18 Feb 2021 15:03:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <YCJa2HraImprr4Ew@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:d9fa:5842:b5a8:9b5]
X-ClientProxiedBy: YT1PR01CA0153.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::32) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:d9fa:5842:b5a8:9b5]
 (2607:fea8:3edf:49b0:d9fa:5842:b5a8:9b5) by
 YT1PR01CA0153.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.38 via Frontend Transport; Thu, 18 Feb 2021 20:03:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ef428541-5e38-483c-a074-08d8d4484b70
X-MS-TrafficTypeDiagnostic: SA0PR12MB4398:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB439886FDE384C737547ACD9BEA859@SA0PR12MB4398.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hhDc960jAwhd8D0c8Nhnj2Wv2ZeK1eUj9auOnFKQ+AsYhDs97yKFrm+FI2Mw8gztBZAQgm2mckzxxysYLpHn4b7fYZYxfI67XuzAyGIkQl9f0pDViWDxEw51+vDuG0Lsxw/B1mAEFpNXFvZAhIP0iFGiR6j4G/umnl8+IA0TjqHMtxo3ClioMLFZSW/KntqDpKsrdt82n/4n7BqtvdkyyrZUFqgofrt41k6M1mnzwFtUgrZaz7G9AP+xL/ydhsI4OGwbIT80oiHco/SC3pfBV0+2fKfheUZsrUp/u3Aa4EhpNBuSGSqx4koQ7+14PY+/c5wh7QRHdF0vnaMvp37B9sT/DBZ9RHXvi29i1fHlEf/h6hDQFA/aDMWCnEqsaWWZ1+lBm/cEsH0qGz0prne4kF9nBgPQAqTLVZpdHIUl8zpjk8eqDJ+LaDIaIqzRZcU9aPIpBareMNuN9zl2VI+kfIbUnM+bi/3xVj1pw93b70zwtnfjaVSyKjA8GN/YIpnfTvHXEZvqFiBc/FEFkrGOBJGBw4/XpougXCDdrOati028ks2LkPNtVls0N5eV0EQHCYpOQqhcfDWde+k5a2EKzbB1l4wnNmjjKsM7TSYKMYfUyLDJc/cNJ6BisdOCmkRL2zdhJFyPsT/ldrgj6VxYlbyfGLPY9ymH+np/2TCF6tzGif/A3uvmZTupzjH/CSvC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(4326008)(316002)(31696002)(8676002)(6486002)(966005)(86362001)(66946007)(54906003)(7416002)(2616005)(186003)(52116002)(16526019)(66476007)(5660300002)(478600001)(66556008)(2906002)(31686004)(53546011)(6916009)(8936002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MGhFRU83THE2aGhzSDIyWElWNTBlZ0l1NFBjOWkwc2hVa0lqV0x4ekwzY0xO?=
 =?utf-8?B?emhYMU4wb012T3RsZWcvNncveVFPUkY0M2hMbmFsTFJkWm5CKzM2THVLUjFU?=
 =?utf-8?B?ZUNlU1Bpam4rbjFrZWFTU1dnQW1odDdRb2d0QTExNDl4UzN5KytkaEdBWVg3?=
 =?utf-8?B?d2hjU2gvTVprM0hzbThjeStrUlBFNlJSellaTWRkZGladUJCUXR1NkdEZ0ZY?=
 =?utf-8?B?NnJZSUF0c2tDdEpRWGFIbGwzYkFGb0NDKzMycCtkdk5LYXg2aElpaGFtTmZZ?=
 =?utf-8?B?aTN1c2tkRUdMOXI0RFlDbmJxSUdJRVlMZHZ6ZGxwVTZFRkhRUjFEalBtdVlF?=
 =?utf-8?B?QlV0SDdrYkZkeS9jOHpCRm5oOHpnbndhWHNPUkZlNjNqdllxQ0puaWNidGFK?=
 =?utf-8?B?K1J2SWVDL1hMZnBlOUdHSEpSUGMyRjF6ZUtoQkxXc2dvVXkrdjFMVnVOc3VB?=
 =?utf-8?B?Vmg4RHM0ODJCQ2xWeGFZN1l2MXVFZXFwaVc4Qy9WdmV6TXJ6dkY1TkpZcURr?=
 =?utf-8?B?RVZNQjA1aEhkei8yTVlDZ010NUhkSlFVSjVibVpCK1V6MitMY2h6Q0ZRY3Rs?=
 =?utf-8?B?UjQxMCtjdTRyR1NJL281TVBmNTlpVlZpOU54QnFyWlN4WTBIUVUyWHVaZDhJ?=
 =?utf-8?B?c2JCTlZNVFp0dG05WmRZOGNlWGJHSXd3ZE9tSURkNzlqVkhkeE9wUmhnUzBX?=
 =?utf-8?B?SU1xTngrRVF5SC9rU21FdUVMQnFKelpUY21ZbTVRSGRIT285MUtPVEpNdUNB?=
 =?utf-8?B?OFNGY2F4QnU4RFFzVEpGZFVHaTFYSURWblZGV01JRlZJanVlVUVBUWcrcDVM?=
 =?utf-8?B?QTlzZm9NTFNpTVIyTEcwYkYwU1NLTTVNNHJGVytnQW1pUDZVM2I2aUM2WkRx?=
 =?utf-8?B?UHJQOTFnbmlPVS9UcXR3RnMxRnVMOWh2ZFB3NWRmSlpKc3NRQzNiZUpQUzdC?=
 =?utf-8?B?Nm92RDlOQy9iV214SXdWOTdYT2hYSUtDbmFWa2NkUnF1RjFCcm96bHlOc0VI?=
 =?utf-8?B?Y0xBM0JqV2dOeDcrUG5hdVpGYnJud2l0cXM5Q0NNNnJTT0kyUDgrcGVvUkJ2?=
 =?utf-8?B?bThKY0s1L3EybXorUDZFaW1XQm0rOWRrZXkxL3V4Smh5N3ZYeURTTmtvWDdv?=
 =?utf-8?B?eXRGOEVDanE4WG82UjdkSTZaaVhRdG54UUdBMCsvU1hFNFZwbnJhcTNvZVg5?=
 =?utf-8?B?SVhoK2JZYkNQVXJ1TzRaQ3pCVEtGOFVKRXlMZ3hjS25Od3ppVHBvRjFhcTVK?=
 =?utf-8?B?SERoY3ZwcXJxbStITTlwdnQwd1prdEt0aERVOHFKL1gxL21OenU5Yld0eG5Z?=
 =?utf-8?B?U0NpV2FybDRJbzhrL1diL2krZXRIV20zRE1KbjNha1JUUGFjeC95d0xERnlv?=
 =?utf-8?B?MDhxckRRQkh5cVBvTDczenIraDhBbFdMbUdKNndOU1lxTk5Rb2lzdzJ2ZlVC?=
 =?utf-8?B?ZHFWQjNBKzNqSkpJRjcrcFltOG1JaFZDMXhyRmE2QnhYRTZ4UkhUaHhXVWJX?=
 =?utf-8?B?M29WVklKL0NDaXNZWjRsaDEyVm0zRzc5aDAzMHdzM3FlWmZvNkdrZlozNGtY?=
 =?utf-8?B?SkpMNXZSV0NJbGhmQnVpU255b3dtUCsrQmtCZ2RpRmVTWDM4Q1RnTE11UWZG?=
 =?utf-8?B?RlhyOHQ4NDBubzZMOEE1SFordHNUU1hWNG9JZ2ZKVnNWekhySEtETDVIL1hj?=
 =?utf-8?B?a1diYXZkSWQrbnNYWU9PYVd0OGh3ODBSTnlBbmdub3dxWW1OZ2JqcVZSd3dT?=
 =?utf-8?B?akxuSUozblRVbFgxbi8rd3lQVnlmYzRYRTFjWXY5QnBBTUk5eDFJbWx1cldZ?=
 =?utf-8?B?VXUxSG1vcjBZa1FVWW9hQnU1ckJ0VHpELzBVb0gxclVCMHFUaTZiR2hGRVBU?=
 =?utf-8?Q?ZmnHrcf/V4AyJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef428541-5e38-483c-a074-08d8d4484b70
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 20:03:44.4119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Td8MJOscW5m3oLAonxOEspaH6dgKbi5I+vRg9d06uDlWkwiycEVv1epMI/8A9sA7fzhVzx/7AmCjoqT0/MNWBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4398
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Qiang Yu <yuq825@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <Alexander.Deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TG9va2VkIGEgYml0IGludG8gaXQsIEkgd2FudCB0byBleHBvcnQgc3luY19vYmplY3QgdG8gRkQg
YW5kIGltcG9ydMKgIGZyb20gdGhhdCBGRApzdWNoIHRoYXQgSSB3aWxsIHdhaXQgb24gdGhlIGlt
cG9ydGVkIHN5bmMgb2JqZWN0IGhhbmRsZSBmcm9tIG9uZSB0aHJlYWQgd2hpbGUKc2lnbmFsaW5n
IHRoZSBleHBvcnRlZCBzeW5jIG9iamVjdCBoYW5kbGUgZnJvbSBhbm90aGVyIChwb3N0IGRldmlj
ZSB1bnBsdWcpID8KCk15IHByb2JsZW0gaXMgaG93IHRvIGNyZWF0ZSBhIHN5bmMgb2JqZWN0IHdp
dGggYSBub24gc2lnbmFsZWQgJ2Zha2UnIGZlbmNlID8KSSBvbmx5IHNlZSBBUEkgdGhhdCBjcmVh
dGVzIGl0IHdpdGggYWxyZWFkeSBzaWduYWxlZCBmZW5jZSAob3Igbm9uZSkgLSAKaHR0cHM6Ly9l
bGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vZHJt
X3N5bmNvYmouYyNMNTYKClAuUyBJIGV4cGVjdCB0aGUga2VybmVsIHRvIGNyYXNoIHNpbmNlIHVu
bGlrZSB3aXRoIGRtYV9idWZzIHdlIGRvbid0IGhvbGQKZHJtIGRldmljZSByZWZlcmVuY2UgaGVy
ZSBvbiBleHBvcnQuCgpBbmRyZXkKCk9uIDIvOS8yMSA0OjUwIEFNLCBEYW5pZWwgVmV0dGVyIHdy
b3RlOgo+IFllYWggaW4gdGhlIGVuZCB3ZSdkIG5lZWQgMiBodyBkZXZpY2VzIGZvciB0ZXN0aW5n
IGZ1bGwgZmVuY2UKPiBmdW5jdGlvbmFsaXR5LiBBIHVzZWZ1bCBpbnRlcm1lZGlhdGUgc3RlcCB3
b3VsZCBiZSB0byBqdXN0IGV4cG9ydCB0aGUKPiBmZW5jZSAoZWl0aGVyIGFzIHN5bmNfZmlsZSwg
d2hpY2ggSSB0aGluayBhbWRncHUgZG9lc24ndCBzdXBwb3J0IGJlY2F1c2UKPiBubyBhbmRyb2lk
IGVnbCBzdXBwb3J0IGluIG1lc2EpIG9yIGRybV9zeW5jb2JqICh3aGljaCB5b3UgY2FuIGRvIGFz
Cj4gc3RhbmRhbG9uZSBmZCB0b28gaWlyYyksIGFuZCB0aGVuIGp1c3QgdXNpbmcgdGhlIGZlbmNl
IGEgYml0IGZyb20KPiB1c2Vyc3BhY2UgKGxpa2Ugd2FpdCBvbiBpdCBvciBnZXQgaXRzIHN0YXR1
cykgYWZ0ZXIgdGhlIGRldmljZSBpcwo+IHVucGx1Z2dlZC4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
