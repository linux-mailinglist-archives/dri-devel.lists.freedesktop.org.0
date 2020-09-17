Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB8826E03D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 18:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F066EC4D;
	Thu, 17 Sep 2020 16:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770054.outbound.protection.outlook.com [40.107.77.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D643D6EC4D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 16:06:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLKaKtZzrcszfnPE4BIWQ6Tj5hj0b0Ni9H0HyWbH1CKnj97+3UMY8G9FKHiH8D9/7b3XebPF0790YkiaUjrkTa5g/uzYxjaNLHptlYmJTQwXNr5VAt+o2fH5TduPsl2xC1aT5yPWjKgsshk79xzMMBnO3NLq4BOh9NMNkroLaGdnfsYPiwAl/4H5CiFZKZjnWS4nO+aevON4fHjRqvBElDMLGAmq3rFWGIBQMqEPaxNUUP6c8oaWbBNVMU+zhRqREaeUf8xHAF6CMQIXg9Kjuikr9dt82YFicOjJONJ9gwEXSh1s2FIjYacJtP5oOewlqU4Cy9CU+p6OAUI4CB6f7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jABm8LwfQX+B7OVzYuiuFVcRy4WDCIjn9tFN0xI5x1o=;
 b=Sswm6761KqzqkxCER6CFcZXF1mnPMPS4ElQKY+lKY7XxT4AjY97EKf7fI8iwVWR1ykEkD4DO/DxKcDZl1UjBoI0jrXVMT4WUExMkRijE8cGfq6WFERv8l8gRg7Gj9HW6M06Wx7/yZDagCHm9eKa7cOI5eOpEoFtCX+JsfU9g+kdRSSNuAs7OxWjNHy6xPRDBRbMQJv7Lhkg9Fshwpoa34Jo7QMU7aM0IG4jXuKHRbl0UFtH3qdK6zJsmQXkCUwt37jLwyQCstoioySCvZETqPQ8Bg492lL2ZwtCiKKkJm68E5V/KqvO+OGHXDJ1vsAhSP3ouEtgqPjHEXrl+xZaB9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jABm8LwfQX+B7OVzYuiuFVcRy4WDCIjn9tFN0xI5x1o=;
 b=tjUQf9hu1vkWKCA3qyTQqvjNmAGdMhOEhTeTuqNFS7lAq7+zyry4CiqiZfKNjJKoTnJxhnYePvcidoa3TFQQki6N6nBgu68jufvZ/6wlN8q4TrvcLqzkArzflVdRcmmgXWp3VFjxsvDKEXPE+4dHBKhvbl7Pgs9k2qKR9PPAShk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4317.namprd12.prod.outlook.com (2603:10b6:208:1d0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 17 Sep
 2020 16:06:19 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.014; Thu, 17 Sep 2020
 16:06:19 +0000
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
To: Daniel Vetter <daniel@ffwll.ch>, Jason Gunthorpe <jgg@ziepe.ca>
References: <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
 <CAKMK7uHJNRzCJfWVSmMrLmGXE0qo+OCXiMd+zPTOkeG2pnVrmQ@mail.gmail.com>
 <8d8693db-a3f0-4f5f-3e32-57d23ca620f8@amd.com>
 <CAKMK7uE=UqZD3PVC8XZAXrgGH-VsUF_-YQD3MLV8KK1kpxO4yQ@mail.gmail.com>
 <20200917113110.GE8409@ziepe.ca>
 <6fd74b84-959c-8b3b-c27b-e9fbf66396c7@gmail.com>
 <20200917121858.GF8409@ziepe.ca>
 <d82f08ee-2dec-18e8-fb06-d26f18ed777a@gmail.com>
 <20200917143551.GG8409@ziepe.ca>
 <5b330920-c789-fac7-e9b1-49f3bc1097a8@gmail.com>
 <20200917152456.GH8409@ziepe.ca>
 <CAKMK7uHQLAHXC_aBZZco0e3tbAqnNuW8QdJk=-V-yM2khw5e=Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b9e65f47-b5c8-db09-117a-a8e22a5b6c71@amd.com>
Date: Thu, 17 Sep 2020 18:06:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uHQLAHXC_aBZZco0e3tbAqnNuW8QdJk=-V-yM2khw5e=Q@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0902CA0001.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::11) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0902CA0001.eurprd09.prod.outlook.com (2603:10a6:200:9b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend
 Transport; Thu, 17 Sep 2020 16:06:18 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 71c1777b-f91f-422d-07f7-08d85b239d36
X-MS-TrafficTypeDiagnostic: MN2PR12MB4317:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4317C26D8019B740B7579197833E0@MN2PR12MB4317.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uTF4rWjd0cd8XQV8FUu1r/YTO4CJa+Rap3hyTCxCUTppkm9WqcOioURc0B9j1e3XMOuqhPVsoUanx1QtHpXo40LjBtIOjn68phfWENPOTmU89Dl9i2NGWNEtH7FNSfXeP0N+JQyTd8qi8TJ9L5UU++1hmBXwlCbYVc+zzPaXmFm0/XCuOB4+5aZZ1uq6g6FtZ5AILJGuzmcw23znq+ifNJZlvSO+Q63zEEH30qfxj42GO3MFUjHm8qgP7L8jF5ebNrEs4aomHdQx3ZqiYiowDq6FasLRShWNSmVPymaUNGD6hqkLYvS4PpXFowUJDtpmgm/L6oVVmDCxBJ82PYV/uIHpTA0YAguc6WB708EGll/6K8Kv0DEEg8f7YPn0CXkF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(2906002)(110136005)(66476007)(186003)(6666004)(66556008)(478600001)(66946007)(316002)(53546011)(16526019)(5660300002)(54906003)(2616005)(52116002)(31686004)(83380400001)(66574015)(8936002)(6486002)(31696002)(86362001)(8676002)(36756003)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: /fwqzab6FKSc2jXw0oyBau/S2HZmZQJuqcmcAfhEcvQWiv+Etyas15rnnZ1rR0CbCcSr8BG5X9JPpId/YYBnUmJllk4B7smIFNj05aZTyULc+88TgOnGUpfZ2tQNELpFOsV+A78HaCJBc3BKoKfSehCgqcRnVB4E2iXGUUVbozAWEeRaYn9DhNIyMn6JYxO91Hmt68ibRX3iUJwkkiLItS9kCNcZQ8oPFIX0oXINZgMtbYLBPlfPgby10FDIud/WGO5fi9x4gMRq9+bqCgSa9oBI2IbJsvncxcgVQN2+OF9rg3iCnbcTDz4GC++8/Ksk2XbM2rPRfSEFWeHBGqT9edUgHj8akQVfEsGC7pmv3FOqrgIVjGm/U9/T7FjtfAGMtPaxmYiq7G+wdBT0qUxIJ6sSGYj+GzwqxlWBinLSAHPp+n86pwSXqn4tnZRJYEZfZpHwvrs+WL4P7hQolQAfi5LmhZ6SjwiMjQPnMqQwuAJ5CmzYoyiA/r4ZJUTflnUf6WREmCZA9DtOyFmwdl6quTtnI2rQSIWdWWvkLKMVGcll2UV0CHTYaJlHkuCIdeS832IK2XQxk50NrrjMczKiJLaewEy0Kvk7k6T5RqNTA00Ty7liIEOAvIgtVmVMduaTXoMkW36Es0GTcLmfcrk5/XvbbcZ7DIwdbycYAqGmo+19YNDaMb368BWye/sVgDifAV/WRmFXvgMql28d5MBXSQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c1777b-f91f-422d-07f7-08d85b239d36
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 16:06:19.4131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e6L3bzi/zd6czyz0pwmshNVrnkdyfc7qmRXmFsjjH/K8aYeaGIAriPbeejyTnwb/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4317
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMDkuMjAgdW0gMTc6Mzcgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFRodSwgU2Vw
IDE3LCAyMDIwIGF0IDU6MjQgUE0gSmFzb24gR3VudGhvcnBlIDxqZ2dAemllcGUuY2E+IHdyb3Rl
Ogo+PiBPbiBUaHUsIFNlcCAxNywgMjAyMCBhdCAwNDo1NDo0NFBNICswMjAwLCBDaHJpc3RpYW4g
S8O2bmlnIHdyb3RlOgo+Pj4gQW0gMTcuMDkuMjAgdW0gMTY6MzUgc2NocmllYiBKYXNvbiBHdW50
aG9ycGU6Cj4+Pj4gT24gVGh1LCBTZXAgMTcsIDIwMjAgYXQgMDI6MjQ6MjlQTSArMDIwMCwgQ2hy
aXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4gQW0gMTcuMDkuMjAgdW0gMTQ6MTggc2NocmllYiBK
YXNvbiBHdW50aG9ycGU6Cj4+Pj4+PiBPbiBUaHUsIFNlcCAxNywgMjAyMCBhdCAwMjowMzo0OFBN
ICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4+IEFtIDE3LjA5LjIwIHVtIDEz
OjMxIHNjaHJpZWIgSmFzb24gR3VudGhvcnBlOgo+Pj4+Pj4+PiBPbiBUaHUsIFNlcCAxNywgMjAy
MCBhdCAxMDowOToxMkFNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+Pj4+Pj4+Pgo+Pj4+
Pj4+Pj4gWWVhaCwgYnV0IGl0IGRvZXNuJ3Qgd29yayB3aGVuIGZvcndhcmRpbmcgZnJvbSB0aGUg
ZHJtIGNoYXJkZXYgdG8gdGhlCj4+Pj4+Pj4+PiBkbWEtYnVmIG9uIHRoZSBpbXBvcnRlciBzaWRl
LCBzaW5jZSB5b3UnZCBuZWVkIGEgdG9uIG9mIGRpZmZlcmVudAo+Pj4+Pj4+Pj4gYWRkcmVzcyBz
cGFjZXMuIEFuZCB5b3Ugc3RpbGwgcmVseSBvbiB0aGUgY29yZSBjb2RlIHBpY2tpbmcgdXAgeW91
cgo+Pj4+Pj4+Pj4gcGdvZmYgbWFuZ2xpbmcsIHdoaWNoIGZlZWxzIGFib3V0IGFzIHJpc2t5IHRv
IG1lIGFzIHRoZSB2bWEgZmlsZQo+Pj4+Pj4+Pj4gcG9pbnRlciB3cmFuZ2xpbmcgLSBpZiBpdCdz
IG5vdCBjb25zaXN0ZW50bHkgYXBwbGllZCB0aGUgcmV2ZXJzZSBtYXAKPj4+Pj4+Pj4+IGlzIHRv
YXN0IGFuZCB1bm1hcF9tYXBwaW5nX3JhbmdlIGRvZXNuJ3Qgd29yayBjb3JyZWN0bHkgZm9yIG91
ciBuZWVkcy4KPj4+Pj4+Pj4gSSB3b3VsZCB0aGluayB0aGUgcGdvZmYgaGFzIHRvIGJlIHRyYW5z
bGF0ZWQgYXQgdGhlIHNhbWUgdGltZSB0aGUKPj4+Pj4+Pj4gdm0tPnZtX2ZpbGUgaXMgY2hhbmdl
ZD8KPj4+Pj4+Pj4KPj4+Pj4+Pj4gVGhlIG93bmVyIG9mIHRoZSBkbWFfYnVmIHNob3VsZCBoYXZl
IG9uZSB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2UgYW5kIEZELAo+Pj4+Pj4+PiBhbGwgaXRzIGRtYSBi
dWZzIHNob3VsZCBiZSBsaW5rZWQgdG8gaXQsIGFuZCBhbGwgcGdvZmZzIHRyYW5zbGF0ZWQgdG8K
Pj4+Pj4+Pj4gdGhhdCBzcGFjZS4KPj4+Pj4+PiBZZWFoLCB0aGF0IGlzIGV4YWN0bHkgbGlrZSBh
bWRncHUgaXMgZG9pbmcgaXQuCj4+Pj4+Pj4KPj4+Pj4+PiBHb2luZyB0byBkb2N1bWVudCB0aGF0
IHNvbWVob3cgd2hlbiBJJ20gZG9uZSB3aXRoIFRUTSBjbGVhbnVwcy4KPj4+Pj4+IEJUVywgd2hp
bGUgcGVvcGxlIGFyZSBsb29raW5nIGF0IHRoaXMsIGlzIHRoZXJlIGEgd2F5IHRvIGdvIGZyb20g
YSBWTUEKPj4+Pj4+IHRvIGEgZG1hX2J1ZiB0aGF0IG93bnMgaXQ/Cj4+Pj4+IE9ubHkgYSBkcml2
ZXIgc3BlY2lmaWMgb25lLgo+Pj4+IFNvdW5kcyBPSwo+Pj4+Cj4+Pj4+IEZvciBUVE0gZHJpdmVy
cyB2bWEtPnZtX3ByaXZhdGVfZGF0YSBwb2ludHMgdG8gdGhlIGJ1ZmZlciBvYmplY3QuIE5vdCBz
dXJlCj4+Pj4+IGFib3V0IHRoZSBkcml2ZXJzIHVzaW5nIEdFTSBvbmx5Lgo+Pj4+IFdoeSBhcmUg
ZHJpdmVycyBpbiBjb250cm9sIG9mIHRoZSB2bWE/IEkgd291bGQgdGhpbmsgZG1hX2J1ZiBzaG91
bGQgYmUKPj4+PiB0aGUgdm1hIG93bmVyLiBJSVJDIG1vZHVsZSBsaWZldGltZSBjb3JyZWN0bmVz
cyBlc3NlbnRpYWxseSBoaW5ncyBvbgo+Pj4+IHRoZSBtb2R1bGUgb3duZXIgb2YgdGhlIHN0cnVj
dCBmaWxlCj4+PiBCZWNhdXNlIHRoZSBwYWdlIGZhdWx0IGhhbmRsaW5nIGlzIGNvbXBsZXRlbHkg
ZHJpdmVyIHNwZWNpZmljLgo+Pj4KPj4+IFdlIGNvdWxkIGluc3RhbGwgc29tZSBETUEtYnVmIHZt
b3BzLCBidXQgdGhhdCB3b3VsZCBqdXN0IGJlIGFub3RoZXIgbGF5ZXIgb2YKPj4+IHJlZGlyZWN0
aW9uLgo+IFVoIGdlZXogSSBkaWRuJ3Qga25vdyBhbWRncHUgd2FzIGRvaW5nIHRoYXQgOi0vCj4K
PiBTaW5jZSB0aGlzIGlzIG9uLCBJIGd1ZXNzIHRoZSBpbnZlcnNlIG9mIHRyeWluZyB0byBjb252
ZXJ0IGEgdXNlcnB0cgo+IGludG8gYSBkbWEtYnVmIGlzIHByb3Blcmx5IHJlamVjdGVkPwoKTXkg
ZmF1bHQsIEkgd2Fzbid0IHNwZWNpZmljIGVub3VnaCBpbiBteSBkZXNjcmlwdGlvbiA6KQoKQW1k
Z3B1IGlzIE5PVCBkb2luZyB0aGlzIHdpdGggbW1hcGVkIERNQS1idWZzLCBidXQgcmF0aGVyIHdp
dGggaXQncyBvd24gCm1tYXBlZCBCT3MuCgpJbiBvdGhlciB3b3JkcyB3aGVuIHVzZXJzcGFjZSBj
YWxsIHRoZSB1c2VycHRyIElPQ1RMIGFuZCB3ZSBnZXQgYW4gZXJyb3IgCmJlY2F1c2Ugd2UgY2Fu
J3QgbWFrZSBhbiB1c2VycHRyIGZyb20gc29tZSByYW5kb20gZGV2aWNlIG1lbW9yeSB3ZSAKaW5z
dGVhZCBjaGVjayBhbGwgQ1BVIG1hcHBpbmdzIGlmIHRoZSBhcHBsaWNhdGlvbiB3YXMgYnJhaW4g
ZGVhZCBlbm91Z2ggCnRvIHByb3ZpZGUgdXMgb3VyIG93biBwb2ludGVyIGJhY2suCgpJSVJDIHRo
aXMgaXMgZXZlbiBkb25lIGluIHVzZXJzcGFjZSBhbmQgbm90IHRoZSBrZXJuZWwuIEJ1dCB3ZSB0
YWxrZWQgCmFib3V0IGRvaW5nIGl0IGluIHRoZSBrZXJuZWwgd2l0aCB0aGUgcHJpdmF0ZV9kYXRh
IGFzIHdlbGwuCgo+Cj4+IElmIGl0IGlzIGFscmVhZHkgdGFraW5nIGEgcGFnZSBmYXVsdCBJJ20g
bm90IHN1cmUgdGhlIGV4dHJhIGZ1bmN0aW9uCj4+IGNhbGwgaW5kaXJlY3Rpb24gaXMgZ29pbmcg
dG8gYmUgYSBiaWcgZGVhbC4gSGF2aW5nIGEgdW5pZm9ybSBWTUEKPj4gc291bmRzIHNhbmVyIHRo
YW4gZXZlcnkgZHJpdmVyIGN1c3RvbSByb2xsaW5nIHNvbWV0aGluZy4KPj4KPj4gV2hlbiBJIHVu
d291bmQgYSBzaW1pbGFyIG1lc3MgaW4gUkRNQSBhbGwgdGhlIGN1c3RvbSBWTUEgc3R1ZmYgaW4g
dGhlCj4+IGRyaXZlcnMgdHVybmVkIG91dCB0byBiZSBnZW5lcmFsbHkgYnVnZ3ksIGF0IGxlYXN0
Lgo+Pgo+PiBJcyB2bWEtPnZtX2ZpbGUtPnByaXZhdGVfZGF0YSB1bml2ZXJzYWxseSBhIGRtYV9i
dWYgcG9pbnRlciBhdCBsZWFzdD8KPiBOb3BlLiBJIHRoaW5rIGlmIHlvdSB3YW50IHRoaXMgd2l0
aG91dCBzb21lIGxhcmdlIHNjYWxlIHJld3JpdGUgb2YgYQo+IGxvdCBvZiBjb2RlIHdlJ2QgbmVl
ZCBhIHZtb3BzLT5nZXRfZG1hYnVmIG9yIHNpbWlsYXIuIE5vdCBwcmV0dHksIGJ1dAo+IHdvdWxk
IGdldCB0aGUgam9iIGRvbmUuCgpZZWFoLCBhZ3JlZSB0aGF0IHNvdW5kcyBsaWtlIHRoZSBzaW1w
bGVzdCBhcHByb2FjaC4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4KPj4+PiBTbywgdXNlciBWQSAt
PiBmaW5kX3ZtYSAtPiBkbWFfYnVmIG9iamVjdCAtPiBkbWFfYnVmIG9wZXJhdGlvbnMgb24gdGhl
Cj4+Pj4gbWVtb3J5IGl0IHJlcHJlc2VudHMKPj4+IEFoLCB5ZXMgd2UgYXJlIGFscmVhZHkgZG9p
bmcgdGhpcyBpbiBhbWRncHUgYXMgd2VsbC4gQnV0IG9ubHkgZm9yIERNQS1idWZzCj4+PiBvciBt
b3JlIGdlbmVyYWxseSBidWZmZXJzIHdoaWNoIGFyZSBtbWFwZWQgYnkgdGhpcyBkcml2ZXIgaW5z
dGFuY2UuCj4+IFNvIHRoZXJlIGlzIG5vIGdlbmVyYWwgZG1hX2J1ZiBzZXJ2aWNlPyBUaGF0IGlz
IGEgcmVhbCBidW1tZXIKPiBNb3N0bHkgaGlzdG9yaWNhbCByZWFzb25zIGFuZCAiaXQncyBjb21w
bGljYXRlZCIuIE9uZSBwcm9ibGVtIGlzIHRoYXQKPiBkbWEtYnVmIGlzbid0IGEgcG93ZXJmdWwg
ZW5vdWdoIGludGVyZmFjZSB0aGF0IGRyaXZlcnMgY291bGQgdXNlIGl0Cj4gZm9yIGFsbCB0aGVp
ciBuYXRpdmUgb2JqZWN0cywgZS5nLiB1c2VycHRyIGRvZXNuJ3QgcGFzcyB0aHJvdWdoIGl0LAo+
IGFuZCBjbGV2ZXIgY2FjaGUgZmx1c2hpbmcgdHJpY2tzIGFyZW4ndCBhbGxvd2VkIGFuZCBhIGJ1
bmNoIG9mIG90aGVyCj4gdGhpbmdzLiBTbyB0aGVyZSdzIHNvbWUgc2VyaW91cyByb2FkYmxvY2tz
IGJlZm9yZSB3ZSBjb3VsZCBoYXZlIGEKPiBjb21tb24gYWxsb2NhdG9yIChvciBzZXQgb2YgYWxs
b2NhdG9ycykgYmVoaW5kIGRtYS1idWYuCj4gLURhbmllbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
