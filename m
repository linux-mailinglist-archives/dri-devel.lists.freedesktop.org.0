Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2595D34F7B5
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 06:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643C16E125;
	Wed, 31 Mar 2021 04:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F456E125;
 Wed, 31 Mar 2021 04:09:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KG3sleijmfshsnVgiuXnc0VXH+VAbYcZHgXDbDM9tW7xola5sK1/L/ODJpXk1GYM5ozAciD2rtiAyok8lXvBPbLpukp8ygkH2WXYg6J1QNLH8tfU7wC6XOjuL7/Su2moNPHMC1WlOSoVma/pRCgtzW4FSpDXu4lgyjjd9bvF+6+tKOHJoDLH6MmyBiuCiqwBNBJ0FJ0Bh/t4v1w+eWGWymBcrvskQpDw67TG8MNg3kssGzeEznWYnkewV5+T6J6/WaessxFAWH2gcDw8+xfcQ7gQdXszOnpyxvBQXNQEfg3KNQe89wh4zxiyBIgM851rWUiG0XE2pTiwVSMxz+5Azw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXXGpRObgcKxUvREhZ5EfSSsMUPiAAFeZVNFXO5ZyL8=;
 b=f4Y6mJUvTBn4ygmtTZPgriGsoG6dTjYifA46Q7eqN8t+QiguJbRL3p4aUqvhKf5K1dYM2VkZYBec+MSbDNeCDo4BjRTu3afuIAm/Q6wfhpjTJXFDsWI/4ZklBptTa6K/1idfk9JNDxZlcPpBjYJlhSZz3OWsoGnkZWuEDkw/2+zsWpZlDrfXaVt6ec30OgztjVcF0T/8EMDgh+0di+BEF7mTFyY8DA7t3yREQVbjSDIfNNwzVgkgtojFtykdx2DaQ6aBvX1+5Rahm8HCJAQ+jCS9A+GaqyI9kWa+wt5SYbXY6Ddeab9s7Rx0HK+W0onKDHXe0S+mYZXDPt/I5JcL8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linux-foundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXXGpRObgcKxUvREhZ5EfSSsMUPiAAFeZVNFXO5ZyL8=;
 b=J0AN9lO0lDBkLZW577JcdQxHfE7SxMaWAb1gNCA/mV7/Ev6ssBQP/BNWSIxoBjfBVurFwBmoSTttYA5nfWh/GKXNLzC1N4ooyuQ6Os+8BXVr5mLiWd2AIBFH14zABSW1YjgS0Dh1o+0zDcHp6pnO3MIdLmpBY0deQD9dzYZoOq6oe9W8QuUnlKYdaEiTJoyzZcrBPYbgfvoFmjWWNtVq7POpK1JL23Kq8deZG+TY2cBPj2a/k491uDIaX6op3u8mb45Rbod2cuRI9vIhSdbfvhIXyQcCwWi/BmfaDCYn4Dz4dS2qjxW9fN3uJFUlY+h+DSV9DAF5c1CdNg+YdJd//A==
Received: from BN6PR16CA0020.namprd16.prod.outlook.com (2603:10b6:404:f5::30)
 by CH2PR12MB4247.namprd12.prod.outlook.com (2603:10b6:610:7c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Wed, 31 Mar
 2021 04:09:58 +0000
Received: from BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:f5:cafe::ed) by BN6PR16CA0020.outlook.office365.com
 (2603:10b6:404:f5::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26 via Frontend
 Transport; Wed, 31 Mar 2021 04:09:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linux-foundation.org; dkim=none (message not
 signed) header.d=none;linux-foundation.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT051.mail.protection.outlook.com (10.13.177.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 31 Mar 2021 04:09:57 +0000
Received: from [10.2.63.109] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 31 Mar
 2021 04:09:56 +0000
Subject: Re: [PATCH v7 3/8] mm/rmap: Split try_to_munlock from try_to_unmap
From: John Hubbard <jhubbard@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>
References: <20210326000805.2518-1-apopple@nvidia.com>
 <20210330222440.GC2356281@nvidia.com>
 <bce0605a-336f-99ba-5b65-a8e5a7e49e00@nvidia.com>
 <12636584.zsJ0Sx4KLp@nvdebian>
 <b4b11c59-975d-26c7-043a-6acddff78dfd@nvidia.com>
Message-ID: <5f156670-e8d0-e62a-2286-764687a6669f@nvidia.com>
Date: Tue, 30 Mar 2021 21:09:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <b4b11c59-975d-26c7-043a-6acddff78dfd@nvidia.com>
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1e0ab9e-2a38-4cd6-d901-08d8f3fad8c5
X-MS-TrafficTypeDiagnostic: CH2PR12MB4247:
X-Microsoft-Antispam-PRVS: <CH2PR12MB424725FB554880BBFE09BBA2A87C9@CH2PR12MB4247.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IXnxcDCMG7HgK1yl5/JC1fcnLUDMGnnv12SjLkhjBFbbMBCXwrZqjcVa79tPiKuGLfUjySW+2bynrlZsmzxpsDkkZDT4Qnvy8tpyfoDubHH2fWppXyp0CAVZTDg2HR4q7jpWL+DPp/qyIKh3zr0GZJvlVktZ8BA5H+QVXJ2q7xgnwV898rZnpYhb92b8w9kuzABplcvb9U5S+/IKUass1bTTzODr9T3ZUB7Ivnjtp9BLMJcQYKHEv5Wj/rPud9rbivrmiibjzj/JmHK7NSa6sKhEGj8YPigBl6fNeoFJ6Pdm2ZC/eKt7yhCQxDGtgxytTWrf89gJbWG+C1AYDOoY2leCKXj47uogFUM83yggg46EpXQiF+I0VN0C/zgjAmyunw3p7SdRaMkpX9b0u5wwStxzcheq4FZHz83RW/3KSbA9AvjeQzl4+S4ejfVhRA+KPuJAEFnxITzZ8t8JpXBSrkj9Nxo/wwZog9mF88+WxkBU7hrMQGTuU1y/nfKCQymcxx/satX5f/ylYVGVJNmJeB/lz4MmnKtjBTp7E3tMOsPmHfRtXPIxYveSRteMO02Ov4VcLnwFzhL55OIMM5Z2oMglg3KlfAsuukiAP84kbEineqOMPyvKWnhcqoRN8gQSV4zY+EMSrwGdzxa5PKOvjzAERhqzALNJkCp7VJ3zalYRxvxWkp0cjMbXMqjkYy1o
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(46966006)(36840700001)(36906005)(70586007)(83380400001)(31696002)(7416002)(4326008)(70206006)(316002)(26005)(37006003)(16526019)(31686004)(186003)(82310400003)(336012)(7636003)(36860700001)(47076005)(8936002)(2616005)(8676002)(356005)(82740400003)(478600001)(5660300002)(2906002)(6636002)(6862004)(54906003)(86362001)(36756003)(16576012)(53546011)(426003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 04:09:57.5524 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1e0ab9e-2a38-4cd6-d901-08d8f3fad8c5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4247
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, hch@infradead.org,
 linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 Jason Gunthorpe <jgg@nvidia.com>, akpm@linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMy8zMC8yMSA4OjU2IFBNLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4gT24gMy8zMC8yMSAzOjU2
IFBNLCBBbGlzdGFpciBQb3BwbGUgd3JvdGU6Cj4gLi4uCj4+PiArMSBmb3IgcmVuYW1pbmcgIm11
bmxvY2sqIiBpdGVtcyB0byAibWxvY2sqIiwgd2hlcmUgYXBwbGljYWJsZS4gZ29vZCBncmllZi4K
Pj4KPj4gQXQgbGVhc3QgdGhlIHNpdHVhdGlvbiB3YXMgd2VpcmQgZW5vdWdoIHRvIHByb21wdCBm
dXJ0aGVyIGludmVzdGlnYXRpb24gOikKPj4KPj4gUmVuYW1pbmcgdG8gbWxvY2sqIGRvZXNuJ3Qg
ZmVlbCBsaWtlIHRoZSByaWdodCBzb2x1dGlvbiB0byBtZSBlaXRoZXIgdGhvdWdoLiBJCj4+IGFt
IG5vdCBzdXJlIGlmIHlvdSBzYXcgbWUgcmVzcG9uZGluZyB0byBteXNlbGYgZWFybGllciBidXQg
SSBhbSB0aGlua2luZwo+PiByZW5hbWluZyB0cnlfdG9fbXVubG9jaygpIC0+IHBhZ2VfbWxvY2tl
ZCgpIGFuZCB0cnlfdG9fbXVubG9ja19vbmUoKSAtPgo+PiBwYWdlX21sb2NrX29uZSgpIG1pZ2h0
IGJlIGJldHRlci4gVGhvdWdodHM/Cj4+Cj4gCj4gUXVpdGUgY29uZnVzZWQgYnkgdGhpcyBuYW1p
bmcgaWRlYS4gQmVjYXVzZTogdHJ5X3RvX211bmxvY2soKSByZXR1cm5zCj4gdm9pZCwgc28gYSBi
b29sZWFuLXN0eWxlIG5hbWUgc3VjaCBhcyAicGFnZV9tbG9ja2VkKCkiIGlzIGFscmVhZHkgbm90
IGEKPiBnb29kIGZpdC4KPiAKPiBFdmVuIG1vcmUgaW1wb3J0YW50LCB0aG91Z2gsIGlzIHRoYXQg
dHJ5X3RvX211bmxvY2soKSBpcyBtbG9jay1pbmcgdGhlCj4gcGFnZSwgcmlnaHQ/IElzIHRoZXJl
IHNvbWUgc3VidGxlIHBvaW50IEknbSBtaXNzaW5nPyBJdCByZWFsbHkgaXMgZG9pbmcKPiBhbiBt
bG9jayB0byB0aGUgYmVzdCBvZiBteSBrbm93bGVkZ2UgaGVyZS4gQWx0aG91Z2ggdGhlIGtlcm5l
bGRvYwo+IGNvbW1lbnQgZm9yIHRyeV90b19tdW5sb2NrKCkgc2VlbXMgcXVlc3Rpb25hYmxlIHRv
bzoKPiAKPiAvKioKPiAqIHRyeV90b19tdW5sb2NrIC0gdHJ5IHRvIG11bmxvY2sgYSBwYWdlCj4g
KiBAcGFnZTogdGhlIHBhZ2UgdG8gYmUgbXVubG9ja2VkCj4gKgo+ICogQ2FsbGVkIGZyb20gbXVu
bG9jayBjb2RlLsKgIENoZWNrcyBhbGwgb2YgdGhlIFZNQXMgbWFwcGluZyB0aGUgcGFnZQo+ICog
dG8gbWFrZSBzdXJlIG5vYm9keSBlbHNlIGhhcyB0aGlzIHBhZ2UgbWxvY2tlZC4gVGhlIHBhZ2Ug
d2lsbCBiZQo+ICogcmV0dXJuZWQgd2l0aCBQR19tbG9ja2VkIGNsZWFyZWQgaWYgbm8gb3RoZXIg
dm1hcyBoYXZlIGl0IG1sb2NrZWQuCj4gKi8KPiAKPiAuLi5iZWNhdXNlIEkgZG9uJ3Qgc2VlIHdo
ZXJlLCBpbiAqdGhpcyogcm91dGluZSwgaXQgY2xlYXJzIFBHX21sb2NrZWQhCj4gCj4gT2J2aW91
c2x5IHdlIGFncmVlIHRoYXQgYSByb3V0aW5lIHNob3VsZCBiZSBuYW1lZCBiYXNlZCBvbiB3aGF0
IGl0IGRvZXMsCj4gcmF0aGVyIHRoYW4gb24gd2hvIGNhbGxzIGl0LiBTbyBJIHRoaW5rIHRoYXQg
c3RpbGwgbGVhZHMgdG86Cj4gCj4gIMKgwqDCoCB0cnlfdG9fbXVubG9jaygpIC0tPiB0cnlfdG9f
bWxvY2soKQo+ICDCoMKgwqAgdHJ5X3RvX211bmxvY2tfb25lKCkgLS0+IHRyeV90b19tbG9ja19v
bmUoKQo+IAo+IFNvcnJ5IGlmIEknbSBtaXNzaW5nIHNvbWV0aGluZyByZWFsbHkgb2J2aW91cy4K
CkFjdHVhbGx5LCByZS1yZWFkaW5nIHlvdXIgYW5kIEphc29uJ3MgZWFybGllciBwb2ludHMgaW4g
dGhlIHRocmVhZCwgSSBzZWUKdGhhdCBJJ20gKm5vdCogbWlzc2luZyBhbnl0aGluZywgYW5kIHdl
IGFyZSBhY3R1YWxseSBpbiBhZ3JlZW1lbnQgYWJvdXQgaG93CnRoZSBjb2RlIG9wZXJhdGVzLiBP
SywgZ29vZCEKCkFsc28sIGFzIHlvdSBwb2ludCBvdXQgYWJvdmUsIG1heWJlIHRoZSAidHJ5XyIg
cHJlZml4IGlzIG5vdCByZWFsbHkgYWNjdXJhdGUKZWl0aGVyLCBnaXZlbiBob3cgdGhpcyB3b3Jr
cy4gU28gbWF5YmUgd2UgaGF2ZSBhcnJpdmVkIGF0IHNvbWV0aGluZyBsaWtlOgoKICAgICB0cnlf
dG9fbXVubG9jaygpIC0tPiBwYWdlX21sb2NrKCkgLy8gb3IgbWxvY2tfcGFnZSgpLi4uCiAgICAg
dHJ5X3RvX211bmxvY2tfb25lKCkgLS0+IHBhZ2VfbWxvY2tfb25lKCkKCgoKdGhhbmtzLAotLSAK
Sm9obiBIdWJiYXJkCk5WSURJQQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
