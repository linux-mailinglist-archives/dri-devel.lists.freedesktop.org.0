Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EBA2279AE
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 09:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D256E4B5;
	Tue, 21 Jul 2020 07:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750050.outbound.protection.outlook.com [40.107.75.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842A06E4AA;
 Tue, 21 Jul 2020 07:45:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JH4r4aiIjtUZTVN3wCAR85JmhzgvHxeKRPv4I6P33gABSgVxmKHFJ6w5mpI9xOdM5PQy/N9bB7xHU8PsdRb+x1x5JnP29cpVptm8d8Fmq9Gx5AgqCakA3ftwV46OYsFq2W4T7/1IqL6hCtGDmPcX977SkQFl1PVRif2zlrcOhnWkwbek5sxPTpu6I3jqtGKdHuDfiQwQRfCh2ysQOG1PoCiariCONc95ryg8h/5prkibj9Q0IV5fO43Y3R47qFRHRR8XeUCo8aqB3N4RI3GXaSKWkBuCVNifyEXYSayl4fvEKMy4mr3bJMzubPfwJETtzvLEJ/2fhJ08H4zxd8XoDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUWqYWXjGZ5OdnuqsTdsz2ev0WdISQZDr42VloR8yTg=;
 b=BBjk7K4eNb5Xo8gOipIrLOEQq9ZPr5fNd9H3rz6kG6++6EBa73Eue8YOTXQFyGNeC1CMxPePxv0AHja76vkvb39x5Mmn3AopIQIQQI+Tgz1O7VgruMA6Wgc5G/8/4cASHzsmJS9YZoZr1a7ohkYKJ5xfDS/SsWpRWMS4QEDkQb8H4qTrU4osXtFMvqSyHz0TND4sul3nCYn5ZPfsK8HRvNa6HN0XTomnrfuyahSsFa6Ql/o8PDVdorb9TakdvDF2vQk3riZwYjcuFB3ZNSgF6D2GUweAwjbZFNuTxgxlE9lpW7sTSexXZCsGrCg0UPbiV7nXOSiZgptzIvGF7wPLxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUWqYWXjGZ5OdnuqsTdsz2ev0WdISQZDr42VloR8yTg=;
 b=c+dtzQWRT44Rk4LpECCKHIfnAqFBH7IxBMsj6AHLd+byUq4V74rkvMnkOhwUp0Y1GF+wJZ7A9jcDoF+SvqmwGgQbbw+kwsQZNbyNbijlE4hG86imHv00B666Qd4PBgwnN22bVe/YdJvl2/iDPSQIU7gjMW2oAoV4tdjp7/iZoas=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3935.namprd12.prod.outlook.com (2603:10b6:208:168::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Tue, 21 Jul
 2020 07:45:26 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3195.026; Tue, 21 Jul 2020
 07:45:08 +0000
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf.rst: Document why indefinite
 fences are a bad idea
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
References: <20200707201229.472834-4-daniel.vetter@ffwll.ch>
 <20200709123339.547390-1-daniel.vetter@ffwll.ch>
 <93b673b7-bb48-96eb-dc2c-bd4f9304000e@shipmail.org>
 <20200721074157.GB3278063@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3603bb71-318b-eb53-0532-9daab62dce86@amd.com>
Date: Tue, 21 Jul 2020 09:45:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200721074157.GB3278063@phenom.ffwll.local>
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0025.eurprd03.prod.outlook.com
 (2603:10a6:208:14::38) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR03CA0025.eurprd03.prod.outlook.com (2603:10a6:208:14::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.20 via Frontend Transport; Tue, 21 Jul 2020 07:45:05 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 22de25be-7bf2-498f-4608-08d82d49fd49
X-MS-TrafficTypeDiagnostic: MN2PR12MB3935:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB393545FF5A8E570BA46DC7B783780@MN2PR12MB3935.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lrltq7Ly72C8i0bovbe0zZUFMP4Tfdyg2RsSqDceZyLsfPKvUdY6pJf2iCAn+Y74/qZfsTc63IlsEP0GB2fkQdizlCINvrm+yi9db1h/nlM605u0+xap/qweIh+oaoV90CTHBRsWZJLc29brjhhWt6CGYWnPYKJHf7si8R5Y+Wznyaiwha5OFuGuUjrVjknAmY98KFbZDjCAreeF4dRM1CCZPBGilHWxBS/4ZCky81aVaaH2fC+5nuq5vbhikKf/1KF5vysF5+ea7La7y9HL3P9SRBpEG5t0CfMexq0K4oYqGBvVjCGQgHMgoAWCVimLuQKCuCGGXNC7DLut3ZNeTU8iNf+JUofesjhgcaIiIa61Z0ZXsEHM0RcPZyT9dZwh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(5660300002)(8676002)(52116002)(53546011)(6486002)(8936002)(86362001)(478600001)(7416002)(31696002)(6666004)(316002)(110136005)(186003)(4326008)(54906003)(66946007)(66556008)(31686004)(2616005)(66476007)(16526019)(36756003)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: cxZHbExQQhGeLFZVzw/wzeeLojbqJpl1tA5DhMdFLoATBRaxTd7i467dORphz1si3INLY7Yx7SmBBjzovaEq/tFAQHcBnBduoPSdytdogLcb+INCJbHvNuQlC4lKO0YU9DxOzVsH+bLFLowRcf7XuXBDZzNwA2mm1fv+X8XsobWs3V73rP6tmeKEiIbnLU9BTGrMcG5tWfhFivveJHxnYIqn5I/Q+20cHNHF0bYhtnL4mDG28Ln7yYCtXNvP3HvLd2riyGUTuSKsxZ3I2P4wXdHN+KBPMBdV/hi6UzMXgaF7iZF4Tejkjpl7IPOc/54ZvZQv8TPZL9S/JrK/dy05mU41QIk17c1OnbYIkXTfThZ4ORB4phuomRN0GMuwHFtcjJ8+JMcdgN2CPesyR004E25Fs5Gsa0wBf8jpJR6XH4vNoNIvtoEKy9QmY/XwWEvId0s7Hx3UnNfpCTHndSgdNTCoGpdS3xEC0vUpZT/2hVKunIoWYqjQ28Ko03eOTvCQ8siizE4fUNoqi0udpqpmfVx1BLYZsg5JxpR/3eisG3AcrFZL41Q/K964cbZm9Yap
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22de25be-7bf2-498f-4608-08d82d49fd49
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2020 07:45:08.1363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ThKWsuBaLokNtiT4Q6yFfZqYtxeKlxVTVLiWK1NUTsK51epKUjyyPcvIY910y5A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3935
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
Cc: Daniel Stone <daniels@collabora.com>, linux-rdma@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, Steve Pronovost <spronovo@microsoft.com>,
 amd-gfx@lists.freedesktop.org, Jason Ekstrand <jason@jlekstrand.net>,
 Jesse Natalie <jenatali@microsoft.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDcuMjAgdW0gMDk6NDEgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIE1vbiwgSnVs
IDIwLCAyMDIwIGF0IDAxOjE1OjE3UE0gKzAyMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkg
d3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiA3LzkvMjAgMjozMyBQTSwgRGFuaWVsIFZldHRlciB3cm90
ZToKPj4+IENvbWVzIHVwIGV2ZXJ5IGZldyB5ZWFycywgZ2V0cyBzb21ld2hhdCB0ZWRpb3VzIHRv
IGRpc2N1c3MsIGxldCdzCj4+PiB3cml0ZSB0aGlzIGRvd24gb25jZSBhbmQgZm9yIGFsbC4KPj4+
Cj4+PiBXaGF0IEknbSBub3Qgc3VyZSBhYm91dCBpcyB3aGV0aGVyIHRoZSB0ZXh0IHNob3VsZCBi
ZSBtb3JlIGV4cGxpY2l0IGluCj4+PiBmbGF0IG91dCBtYW5kYXRpbmcgdGhlIGFtZGtmZCBldmlj
dGlvbiBmZW5jZXMgZm9yIGxvbmcgcnVubmluZyBjb21wdXRlCj4+PiB3b3JrbG9hZHMgb3Igd29y
a2xvYWRzIHdoZXJlIHVzZXJzcGFjZSBmZW5jaW5nIGlzIGFsbG93ZWQuCj4+IEFsdGhvdWdoIChp
biBteSBodW1ibGUgb3BpbmlvbikgaXQgbWlnaHQgYmUgcG9zc2libGUgdG8gY29tcGxldGVseSB1
bnRhbmdsZQo+PiBrZXJuZWwtaW50cm9kdWNlZCBmZW5jZXMgZm9yIHJlc291cmNlIG1hbmFnZW1l
bnQgYW5kIGRtYS1mZW5jZXMgdXNlZCBmb3IKPj4gY29tcGxldGlvbi0gYW5kIGRlcGVuZGVuY3kg
dHJhY2tpbmcgYW5kIGxpZnQgYSBsb3Qgb2YgcmVzdHJpY3Rpb25zIGZvciB0aGUKPj4gZG1hLWZl
bmNlcywgaW5jbHVkaW5nIHByb2hpYml0aW5nIGluZmluaXRlIG9uZXMsIEkgdGhpbmsgdGhpcyBt
YWtlcyBzZW5zZQo+PiBkZXNjcmliaW5nIHRoZSBjdXJyZW50IHN0YXRlLgo+IFllYWggSSB0aGlu
ayBhIGZ1dHVyZSBwYXRjaCBuZWVkcyB0byB0eXBlIHVwIGhvdyB3ZSB3YW50IHRvIG1ha2UgdGhh
dAo+IGhhcHBlbiAoZm9yIHNvbWUgY3Jvc3MgZHJpdmVyIGNvbnNpc3RlbmN5KSBhbmQgd2hhdCBu
ZWVkcyB0byBiZQo+IGNvbnNpZGVyZWQuIFNvbWUgb2YgdGhlIG5lY2Vzc2FyeSBwYXJ0cyBhcmUg
YWxyZWFkeSB0aGVyZSAod2l0aCBsaWtlIHRoZQo+IHByZWVtcHRpb24gZmVuY2VzIGFtZGtmZCBo
YXMgYXMgYW4gZXhhbXBsZSksIGJ1dCBJIHRoaW5rIHNvbWUgY2xlYXIgZG9jcwo+IG9uIHdoYXQn
cyByZXF1aXJlZCBmcm9tIGJvdGggaHcsIGRyaXZlcnMgYW5kIHVzZXJzcGFjZSB3b3VsZCBiZSBy
ZWFsbHkKPiBnb29kLgoKSSdtIGN1cnJlbnRseSB3cml0aW5nIHRoYXQgdXAsIGJ1dCBwcm9iYWJs
eSBzdGlsbCBuZWVkIGEgZmV3IGRheXMgZm9yIHRoaXMuCgpDaHJpc3RpYW4uCgo+PiBSZXZpZXdl
ZC1ieTogVGhvbWFzIEhlbGxzdHJvbSA8dGhvbWFzLmhlbGxzdHJvbUBpbnRlbC5jb20+Cj4gVGhh
bmtzIGZvciB0YWtpbmcgYSBsb29rLCBmaXJzdCAzIHBhdGNoZXMgaGVyZSB3aXRoIGFubm90YXRp
b25zIGFuZCBkb2NzCj4gbWVyZ2VkIHRvIGRybS1taXNjLW5leHQuIEknbGwgYXNrIE1hYXJ0ZW4v
RGF2ZSB3aGV0aGVyIGFub3RoZXIgcHVsbCBpcyBvawo+IGZvciA1Ljkgc28gdGhhdCBldmVyeW9u
ZSBjYW4gdXNlIHRoaXMgYXNhcC4KPiAtRGFuaWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
