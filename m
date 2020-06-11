Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C5D1F70ED
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 01:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20396E0E6;
	Thu, 11 Jun 2020 23:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514D56E0E6;
 Thu, 11 Jun 2020 23:35:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QCj4ycS2eNtDoyLqhGUc6kbAgn1yyQAXwd1tKQ0jHsxhB7IgjctW/ppJYgIeDrVc8UKfS5VIE4sYH75ulVZJYSiLW+hvW9UHElEPyue271NEufsUnVgqsDhQSBqrUgCejMhrfT5f9Cn5FkL0k37uyfczJDQeSFs01Acs2Fil8HpG5OdH0K3v3C7KtW0e9qDTBqsP5vOhKXQtv/uoFDdReW2023u9/vqgRtyNc/LIk/TDHjdTvpYWLjuiedQQcYw6jM4hBVOTe7iiB64r/IwGwprFDPBTxykzOHf5lpUL+drIhOQs/+C/vCy3cImQKUyJsRUD8z+pN9Qqt4dcqVD0Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xr6Xx2Tzlwq18f72B6suSX3Y6Np/pqJzGT7hI8LGYI=;
 b=j53W+DgaXzo9iC7seWlU4YRSWx3I3VMfEvdoky4wTU0K7mZaS3TZadb6nf8FPgWmKRqqzTJmHJlncI0D39qhCwLgwbr9JBalOqZZEpARtV8dAOwf02ADqBZrfNXmfG3+GiLf5CMndCn70je91dj5pUeXy6ud4PLWKJxLZAdKu2J9Q+vNX3NNblUx4aHKFCiqlAC7wXnbGtTTPNc/HEV+2mScM1rbNGDQPtm89GTl8qjhfY3sWaD2L6VXPY1i6YXWIIwtNTWfvsOYZk+s+7wxVEG2dVe9DapShwWV3IZbR83JR2Cqk6BUGRq0Yg5IFSdaVmhnu33o52kcsDgRxYoNjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xr6Xx2Tzlwq18f72B6suSX3Y6Np/pqJzGT7hI8LGYI=;
 b=1oMdu4F+eJwl5JGFP32PSdS9dgSdYvAw92u/tYi1Meye1eookLSzlUCezJKPmXLb9z3QigkXKpgvk9swWN0hvAA2prPdl/j13gW0vihtWXDU49MahixXwLO30eh7vPnlbKy26FOK7Mr+nExFrDLGkHBzadbnQpUUKlHBdGOljY8=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 by SN6PR12MB2639.namprd12.prod.outlook.com (2603:10b6:805:75::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.23; Thu, 11 Jun
 2020 23:35:37 +0000
Received: from SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::18d:97b:661f:9314]) by SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::18d:97b:661f:9314%7]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 23:35:37 +0000
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep annotations
To: Jason Gunthorpe <jgg@ziepe.ca>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-rdma@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Thomas Hellstrom
 <thomas.hellstrom@intel.com>, Daniel Vetter <daniel.vetter@intel.com>,
 linux-media@vger.kernel.org, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, Mika Kuoppala <mika.kuoppala@intel.com>
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
 <20200604081224.863494-5-daniel.vetter@ffwll.ch>
 <b11c2140-1b9c-9013-d9bb-9eb2c1906710@shipmail.org>
 <20200611083430.GD20149@phenom.ffwll.local> <20200611141515.GW6578@ziepe.ca>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <4702e170-fd02-88fa-3da4-ea64252fff9a@amd.com>
Date: Thu, 11 Jun 2020 19:35:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200611141515.GW6578@ziepe.ca>
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::42) To SN1PR12MB2414.namprd12.prod.outlook.com
 (2603:10b6:802:2e::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.63.128) by
 YTBPR01CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.21 via Frontend Transport; Thu, 11 Jun 2020 23:35:36 +0000
X-Originating-IP: [142.116.63.128]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ca613209-cae9-4beb-763c-08d80e602514
X-MS-TrafficTypeDiagnostic: SN6PR12MB2639:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2639E32D582F0E0D4E44B1E692800@SN6PR12MB2639.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xhct3Q5PmgQdbZA3Wwr9sogT+nC+dDoZtuF1u3u4HIj89U+4iw4cVNY27v7o5Q5/ywyDJgMBLGT5TZCauityIo46zksiCnyHMfjcf5D9DiAZn4/wKP/EjihWQ2dSl9gu3RKxDpWzLSvD3zkVIICf/4tcB6xUtRJXvF+AY4hi+EXwk8rKQRYgsMb5qbjLJiSeouRJ6XAXw0qmFom5ESC8nZ9QmHWsZOmOx6iXMrgBmWw+b257E9nx61ipsJwkBr7vaDn94QxpYLhTfjHE865zIi8BU7AGMLjdBBVSvON/XLpiUsxYI7VjD8cYG4YuJyRak/tAl6DSEfUm14xX2sxRdxspmHpsaY2gJ/KXXQgtXlbKB6XTw0rfFY2qHuNFJ43Pozb2Y7pINwVNLtebtQOvYA/wrXIApR9jw+KG2HnzfFcC99g9P4rtT3pV5nKFF2nU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2414.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(66556008)(26005)(44832011)(186003)(16576012)(110136005)(478600001)(8676002)(966005)(66946007)(66476007)(83380400001)(2906002)(16526019)(52116002)(7416002)(956004)(31696002)(36756003)(31686004)(6486002)(2616005)(86362001)(5660300002)(8936002)(316002)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: lMVnk/iA/no3q+kLsUZGrVml75gTPfF4B+EPZD+9nMXS9I4q/X0SR1BFYoq2BTMgOh9S9eSY2c/gBIifXvKGaIJEHQyiNATyW80UrcTfF5LbtbeFpieyRYVHExjUJCPsffdRwJ3Xx9AWQDDhsowRCHcpHxUMKhjStfResRhsZ2WiwqwhIHWLEbhkoTvyPyYDVd2fuZlqU3EEBoBUA+eEmf7IlnaYkUjvjN9N+f6jabdc5aaCiq8cM0P5I6rPjYghUQvqFy7eayQhDrNXrfgPbLC/TnxGxXzwp5ZstTXpw0/cLWCEnBhrxRPtnnocGVbV/gekM+Bg1N1gg82foZqNYELOvpmlFOSyldwehtDD3mDaEaaJft9hA24PT81LAoC+7jkSWOB3QKKrsteiGEwmp6ggPgTr7ztztmSZpyRWm0kM0pWD/2uqKBKcXEodk8cqZ6OMGoE4X0Ugh5iW6QmiDrOeUFs3wJJq1IBsYlbljcTOpwi2qrLlyzY8U82I5EKQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca613209-cae9-4beb-763c-08d80e602514
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 23:35:37.6581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9I0+zgkWdPhK56zX6YsItahFnR5mXeKGy5ASpENti8IRJtYCU4K7jcgtIuLDzFaArmNtGv3QWTS6RLkBYIL8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2639
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMC0wNi0xMSB1bSAxMDoxNSBhLm0uIHNjaHJpZWIgSmFzb24gR3VudGhvcnBlOgo+IE9u
IFRodSwgSnVuIDExLCAyMDIwIGF0IDEwOjM0OjMwQU0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3Jv
dGU6Cj4+PiBJIHN0aWxsIGhhdmUgbXkgZG91YnRzIGFib3V0IGFsbG93aW5nIGZlbmNlIHdhaXRp
bmcgZnJvbSB3aXRoaW4gc2hyaW5rZXJzLgo+Pj4gSU1PIGlkZWFsbHkgdGhleSBzaG91bGQgdXNl
IGEgdHJ5d2FpdCBhcHByb2FjaCwgaW4gb3JkZXIgdG8gYWxsb3cgbWVtb3J5Cj4+PiBhbGxvY2F0
aW9uIGR1cmluZyBjb21tYW5kIHN1Ym1pc3Npb24gZm9yIGRyaXZlcnMgdGhhdAo+Pj4gcHVibGlz
aCBmZW5jZXMgYmVmb3JlIGNvbW1hbmQgc3VibWlzc2lvbi4gKFNpbmNlIGVhcmx5IHJlc2VydmF0
aW9uIG9iamVjdAo+Pj4gcmVsZWFzZSByZXF1aXJlcyB0aGF0KS4KPj4gWWVhaCBpdCBpcyBhIGJp
dCBhbm5veWluZywgZS5nLiBmb3IgZHJtL3NjaGVkdWxlciBJIHRoaW5rIHdlJ2xsIGVuZCB1cAo+
PiB3aXRoIGEgbWVtcG9vbCB0byBtYWtlIHN1cmUgaXQgY2FuIGhhbmRsZSBpdCdzIGFsbG9jYXRp
b25zLgo+Pgo+Pj4gQnV0IHNpbmNlIGRyaXZlcnMgYXJlIGFscmVhZHkgd2FpdGluZyBmcm9tIHdp
dGhpbiBzaHJpbmtlcnMgYW5kIEkgdGFrZSB5b3VyCj4+PiB3b3JkIGZvciBITU0gcmVxdWlyaW5n
IHRoaXMsCj4+IFllYWggdGhlIGJpZyB0cm91YmxlIGlzIEhNTSBhbmQgbW11IG5vdGlmaWVycy4g
VGhhdCdzIHRoZSByZWFsbHkgYXdrd2FyZAo+PiBvbmUsIHRoZSBzaHJpbmtlciBvbmUgaXMgYSBs
b3QgbGVzcyBlc3RhYmxpc2hlZC4KPiBJIHJlYWxseSBxdWVzdGlvbiBpZiBIVyB0aGF0IG5lZWRz
IHNvbWV0aGluZyBsaWtlIERNQSBmZW5jZSBzaG91bGQKPiBldmVuIGJlIHVzaW5nIG1tdSBub3Rp
ZmllcnMgLSB0aGUgYmVzdCB1c2UgaXMgSFcgdGhhdCBjYW4gZmVuY2UgdGhlCj4gRE1BIGRpcmVj
dGx5IHdpdGhvdXQgaGF2aW5nIHRvIGdldCBpbnZvbHZlZCB3aXRoIHNvbWUgY29tbWFuZCBzdHJl
YW0KPiBwcm9jZXNzaW5nLgo+Cj4gT3IgYXQgdGhlIHZlcnkgbGVhc3QgaXQgc2hvdWxkIG5vdCBi
ZSBhIGdlbmVyaWMgRE1BIGZlbmNlIGJ1dCBhCj4gbmFycm93ZWQgY29tcGxldGlvbiB0aWVkIG9u
bHkgaW50byB0aGUgc2FtZSBHUFUgZHJpdmVyJ3MgY29tbWFuZAo+IGNvbXBsZXRpb24gcHJvY2Vz
c2luZyB3aGljaCBzaG91bGQgYmUgYWJsZSB0byBwcm9ncmVzcyB3aXRob3V0Cj4gYmxvY2tpbmcu
Cj4KPiBUaGUgaW50ZW50IG9mIG5vdGlmaWVycyB3YXMgbmV2ZXIgdG8gZW5kbGVzc2x5IGJsb2Nr
IHdoaWxlIHZhc3QKPiBhbW91bnRzIG9mIFNXIGRvZXMgd29yay4KPgo+IEdvaW5nIGFyb3VuZCBh
bmQgc3dpdGNoaW5nIGV2ZXJ5dGhpbmcgaW4gYSBHUFUgdG8gR0ZQX0FUT01JQyBzZWVtcwo+IGxp
a2UgYmFkIGlkZWEuCj4KPj4gSSd2ZSBwaW5nZWQgYSBidW5jaCBvZiBhcm1zb2MgZ3B1IGRyaXZl
ciBwZW9wbGUgYW5kIGFzayB0aGVtIGhvdyBtdWNoIHRoaXMKPj4gaHVydHMsIHNvIHRoYXQgd2Ug
aGF2ZSBhIGNsZWFyIGFuc3dlci4gT24geDg2IEkgZG9uJ3QgdGhpbmsgd2UgaGF2ZSBtdWNoCj4+
IG9mIGEgY2hvaWNlIG9uIHRoaXMsIHdpdGggdXNlcnB0ciBpbiBhbWQgYW5kIGk5MTUgYW5kIGht
bSB3b3JrIGluIG5vdXZlYXUKPj4gKGJ1dCBub3V2ZWF1IEkgdGhpbmsgZG9lc24ndCB1c2UgZG1h
X2ZlbmNlIGluIHRoZXJlKS4gCgpTb29uIG5vdXZlYXUgd2lsbCBnZXQgY29tcGFueS4gV2UncmUg
d29ya2luZyBvbiBhIHJlY292ZXJhYmxlIHBhZ2UgZmF1bHQKaW1wbGVtZW50YXRpb24gZm9yIEhN
TSBpbiBhbWRncHUgd2hlcmUgd2UnbGwgbmVlZCB0byB1cGRhdGUgcGFnZSB0YWJsZXMKdXNpbmcg
dGhlIEdQVXMgU0RNQSBlbmdpbmUgYW5kIHdhaXQgZm9yIGNvcnJlc3BvbmRpbmcgZmVuY2VzIGlu
IE1NVQpub3RpZmllcnMuCgpSZWdhcmRzLArCoCBGZWxpeAoKCj4gUmlnaHQsIG5vciB3aWxsIFJE
TUEgT0RQLiAKPgo+IEphc29uCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
