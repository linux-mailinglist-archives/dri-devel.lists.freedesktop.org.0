Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C5C21E95E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDD46E915;
	Tue, 14 Jul 2020 07:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2047.outbound.protection.outlook.com [40.107.20.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE0E6EC55;
 Fri, 10 Jul 2020 13:48:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRAmcn4fAugr8rFQFozG4YPCi2+sk8bEd3+Q3DLdmqgLPSI2LjiDpT5j4E0u5sM0h2r5t1FRMd/E1eRlA0hjjc0Z+AdIpUvx9jg3UiCcB6y+ynuiVdSdHBc9gpG3U46h2DmysyqR1bqwnBWJPP3A5HHnqSSovWAdYw2je09FkmD26IuKVRXLdXCtFB2k8BNWZLnquXmFAak5AxMbr/FqI/SaNdu37mFGOhOCBlzmbc8VI7oCoNt0iOHIpiW50WJsKrPr9xwSiXdTq6cOfeh9oOxWCGNq4lT1bOoXsICzZo+FBMPsPXoiv4iLxraiYppQBUqsaF2uk9idDLsYKwzrjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=em9GCfPc3Bhl6JX25VZ+Xquk7PsFs1BYXjOVmaCss3E=;
 b=f3MYU/LuVCIP3RgFhOoPo5CWKDhDx/ln5AjYzuby7yz9mXQ6D54bTpEHrboflAkB3NGvigNDRLNFx2eILH5PgGugyiXs4msAXAd3t6i5250Wvp15FcSPgkDVmuNF512UPtH4D/cB7399xN7M/pnZUPzLdga6jxtapBT/c47Tz+I0Na+SXmnLtS3Mz+BtZ4oPA0zkWo2i/tO05Nj1Zbia0mgPd23nFjDRsGodgzJTC+NGdG0+UCYqS7dO+dx+qZO28hnpW9GQWesZzqHPZGMX+KkzqXripsYEkmBYY1zZuleIB3N7G9udRyImCcXhQB2F5UD1tAtne71n2bmH9DM8fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=em9GCfPc3Bhl6JX25VZ+Xquk7PsFs1BYXjOVmaCss3E=;
 b=s+k5G4GJ2ik0VcgrCETSHsZsYksTNfhGgtfRBIx/m9tpprGynyLJa//4SaOkSvO7/5IC7X8HJ6EEF9BJEQvgULB2xNqiYiDwPbnunmcEwCD0LMeD3v7b9kWZTVEP2SeeXPMza8weQuxXbRCGeautX0hLKN85a/WIwJmqKEgDGgU=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=mellanox.com;
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (2603:10a6:803:44::15)
 by VI1PR05MB3341.eurprd05.prod.outlook.com (2603:10a6:802:1c::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Fri, 10 Jul
 2020 13:48:31 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::848b:fcd0:efe3:189e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::848b:fcd0:efe3:189e%7]) with mapi id 15.20.3174.022; Fri, 10 Jul 2020
 13:48:31 +0000
Date: Fri, 10 Jul 2020 10:48:26 -0300
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH 02/25] dma-fence: prime lockdep annotations
Message-ID: <20200710134826.GD23821@mellanox.com>
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
 <20200707201229.472834-3-daniel.vetter@ffwll.ch>
 <20200709080911.GP3278063@phenom.ffwll.local>
 <20200710124357.GB23821@mellanox.com>
 <5c163d74-4a28-1d74-be86-099b4729a2e0@amd.com>
 <20200710125453.GC23821@mellanox.com>
 <4f4a2cf7-f505-8494-1461-bd467870481e@amd.com>
Content-Disposition: inline
In-Reply-To: <4f4a2cf7-f505-8494-1461-bd467870481e@amd.com>
X-ClientProxiedBy: MN2PR12CA0020.namprd12.prod.outlook.com
 (2603:10b6:208:a8::33) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR12CA0020.namprd12.prod.outlook.com (2603:10b6:208:a8::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Fri, 10 Jul 2020 13:48:30 +0000
Received: from jgg by mlx with local (Exim 4.93)	(envelope-from
 <jgg@mellanox.com>)	id 1jttO6-0088nX-PV; Fri, 10 Jul 2020 10:48:26 -0300
X-Originating-IP: [156.34.48.30]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1079218b-4c9e-4621-75d7-08d824d7ee4e
X-MS-TrafficTypeDiagnostic: VI1PR05MB3341:
X-Microsoft-Antispam-PRVS: <VI1PR05MB334116D18115F3E3CEC3F202CF650@VI1PR05MB3341.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 046060344D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jFcgn1ydcEHhSz0+CCy2fjDkK2bLF6z96HDaXcAemHtsFZaRD1P6Bkl6Lf4sQDJ179Dj5+yiBvx8W03b6zomX4c+0Aas850u+VEb2JyqcfQLuHUcM9j7fkoxPhcxJnUC5+qiK5T/QFiPsFr7W0EZP5dHQWBr92bBhVjVMcwwAxt9azTFIf/9/viPoEdulANqJTCYx6IvfyIABN6Nf8BSCCPF/WbndfXoQvhj7FerTXgSlrGbPOohMqgoIZuLynxs1v9euWtw+NKEGbp6xz0SMJeCQ6xOJL1/DaFalHI5+gwJlyNkIOyVCXkJzjcEtlx6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR05MB4141.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(9786002)(8676002)(2616005)(2906002)(26005)(4326008)(66574015)(426003)(8936002)(478600001)(186003)(33656002)(66476007)(66556008)(5660300002)(54906003)(9746002)(66946007)(6916009)(316002)(1076003)(7416002)(86362001)(36756003)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: mCS9wS9QeKkaqEbOX6nWRQVjGpk009DZ+9L4MMYCuwizDkRfwcVGl2Ifz/M/2qJBamVMTYjQdiX9BDntxbzIBzZo9pIe3Z7k0ed2b4XN7k79+eoblcipgLb0B23mOpoAXYzxV0r+OgIA4HeLkJCQIRIO4FbIvOZUt310fUHt6ORCb17kIge3hgp2U5G54kHt8FqwmTtq7RpQ366QEtaaAlwaRHwmfC7YF1yJmJ9H4WS05GYHXIf98c9K0D2iFv6bYWSL+Y+DBhUQrEoZCcpU3EGf7qelTzYqGCCPEYcZGtjZaBKc8BRJNmaZN6oJH7WG7v+sjfq7/VikEARYWuzBoHylswNBgoe1g77BHg2Pb+uFQuUxSrDA9+DwnD45K6SpvI3t8C1W5bgL/bTWAqklQ0IUhQUjmDiB/OdeGDTvc1Jvxt+EYGzdRJFw/WX9pZ1EPZfJ/ehQ7nnWPGHH0eEaC1cS0xCdbcKacIznULoPwaE=
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1079218b-4c9e-4621-75d7-08d824d7ee4e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR05MB4141.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2020 13:48:30.9082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nN1oo7fZeG14NNr4HLKjPR1Q1Vi2ci48IOOg+CuIA2svEhrRbTLSAvTFlJSuNBkb9dnKcGyrpYAHuwbZnVD/iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3341
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
Cc: kernel test robot <lkp@intel.com>, linux-rdma@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, linaro-mm-sig@lists.linaro.org,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
 amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 linux-media@vger.kernel.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTAsIDIwMjAgYXQgMDM6MDE6MTBQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBBbSAxMC4wNy4yMCB1bSAxNDo1NCBzY2hyaWViIEphc29uIEd1bnRob3JwZToK
PiA+IE9uIEZyaSwgSnVsIDEwLCAyMDIwIGF0IDAyOjQ4OjE2UE0gKzAyMDAsIENocmlzdGlhbiBL
w7ZuaWcgd3JvdGU6Cj4gPiA+IEFtIDEwLjA3LjIwIHVtIDE0OjQzIHNjaHJpZWIgSmFzb24gR3Vu
dGhvcnBlOgo+ID4gPiA+IE9uIFRodSwgSnVsIDA5LCAyMDIwIGF0IDEwOjA5OjExQU0gKzAyMDAs
IERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+ID4gPiBIaSBKYXNvbiwKPiA+ID4gPiA+IAo+ID4g
PiA+ID4gQmVsb3cgdGhlIHBhcmFncmFwaCBJJ3ZlIGFkZGVkIGFmdGVyIG91ciBkaXNjdXNzaW9u
cyBhcm91bmQgZG1hLWZlbmNlcwo+ID4gPiA+ID4gb3V0c2lkZSBvZiBkcml2ZXJzL2dwdS4gR29v
ZCBlbm91Z2ggZm9yIGFuIGFjayBvbiB0aGlzLCBvciB3YW50IHNvbWV0aGluZwo+ID4gPiA+ID4g
Y2hhbmdlZD8KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhhbmtzLCBEYW5pZWwKPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiArICogTm90ZSB0aGF0IG9ubHkgR1BVIGRyaXZlcnMgaGF2ZSBhIHJlYXNvbmFi
bGUgZXhjdXNlIGZvciBib3RoIHJlcXVpcmluZwo+ID4gPiA+ID4gPiArICogJm1tdV9pbnRlcnZh
bF9ub3RpZmllciBhbmQgJnNocmlua2VyIGNhbGxiYWNrcyBhdCB0aGUgc2FtZSB0aW1lIGFzIGhh
dmluZyB0bwo+ID4gPiA+ID4gPiArICogdHJhY2sgYXN5bmNocm9ub3VzIGNvbXB1dGUgd29yayB1
c2luZyAmZG1hX2ZlbmNlLiBObyBkcml2ZXIgb3V0c2lkZSBvZgo+ID4gPiA+ID4gPiArICogZHJp
dmVycy9ncHUgc2hvdWxkIGV2ZXIgY2FsbCBkbWFfZmVuY2Vfd2FpdCgpIGluIHN1Y2ggY29udGV4
dHMuCj4gPiA+ID4gSSB3YXMgaG9waW5nIHdlJ2QgZ2V0IHRvICdubyBkcml2ZXIgb3V0c2lkZSBH
UFUgc2hvdWxkIGV2ZW4gdXNlCj4gPiA+ID4gZG1hX2ZlbmNlKCknCj4gPiA+IE15IGxhc3Qgc3Rh
dHVzIHdhcyB0aGF0IFY0TCBjb3VsZCBjb21lIHVzZSBkbWFfZmVuY2VzIGFzIHdlbGwuCj4gPiBJ
J20gc3VyZSBsb3RzIG9mIHBsYWNlcyAqY291bGQqIHVzZSBpdCwgYnV0IEkgdGhpbmsgSSB1bmRl
cnN0b29kIHRoYXQKPiA+IGl0IGlzIGEgYmFkIGlkZWEgdW5sZXNzIHlvdSBoYXZlIHRvIGZpdCBp
bnRvIHRoZSBEUk0gdUFQST8KPiAKPiBJdCB3b3VsZCBiZSBhIGJpdCBxdWVzdGlvbmFibGUgaWYg
eW91IHVzZSB0aGUgY29udGFpbmVyIG9iamVjdHMgd2UgY2FtZSB1cAo+IHdpdGggaW4gdGhlIERS
TSBzdWJzeXN0ZW0gb3V0c2lkZSBvZiBpdC4KPiAKPiBCdXQgdXNpbmcgdGhlIGRtYV9mZW5jZSBp
dHNlbGYgbWFrZXMgc2Vuc2UgZm9yIGV2ZXJ5dGhpbmcgd2hpY2ggY291bGQgZG8KPiBhc3luYyBE
TUEgaW4gZ2VuZXJhbC4KCmRtYV9mZW5jZSBvbmx5IHBvc3NpYmx5IG1ha2VzIHNvbWUgc2Vuc2Ug
aWYgeW91IGludGVuZCB0byBleHBvc2UgdGhlCmNvbXBsZXRpb24gb3V0c2lkZSBhIHNpbmdsZSBk
cml2ZXIuIAoKVGhlIHByZWZlcmVkIGtlcm5lbCBkZXNpZ24gcGF0dGVybiBmb3IgdGhpcyBpcyB0
byBjb25uZWN0IHRoaW5ncyB3aXRoCmEgZnVuY3Rpb24gY2FsbGJhY2suCgpTbyB0aGUgYWN0dWFs
IHVzZSBjYXNlIG9mIGRtYV9mZW5jZSBpcyBxdWl0ZSBuYXJyb3cgYW5kIHRpZ2h0bHkgbGlua2Vk
CnRvIERSTS4KCkkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIHNwcmVhZCB0aGlzIGJleW9uZCBEUk0s
IEkgY2FuJ3Qgc2VlIGEgcmVhc29uLgoKPiA+IFlvdSBhcmUgYmV0dGVyIHRvIGRvIHNvbWV0aGlu
ZyBjb250YWluZWQgaW4gdGhlIHNpbmdsZSBkcml2ZXIgd2hlcmUKPiA+IGxvY2tpbmcgY2FuIGJl
IGFuYWx5emVkLgo+ID4gCj4gPiA+IEknbSBub3QgMTAwJSBzdXJlLCBidXQgd291bGRuJ3QgTU1V
IG5vdGlmaWVyICsgZG1hX2ZlbmNlIGJlIGEgdmFsaWQgdXNlIGNhc2UKPiA+ID4gZm9yIHRoaW5n
cyBsaWtlIGN1c3RvbSBGUEdBIGludGVyZmFjZXMgYXMgd2VsbD8KPiA+IEkgZG9uJ3QgdGhpbmsg
d2Ugc2hvdWxkIGV4cGFuZCB0aGUgbGlzdCBvZiBkcml2ZXJzIHRoYXQgdXNlIHRoaXMKPiA+IHRl
Y2huaXF1ZS4KPiA+IERyaXZlcnMgdGhhdCBjYW4ndCBzdXNwZW5kIHNob3VsZCBwaW4gbWVtb3J5
LCBub3QgdXNlIGJsb2NrZWQKPiA+IG5vdGlmaWVycyB0byBjcmVhdGVkIHBpbm5lZCBtZW1vcnku
Cj4gCj4gQWdyZWVkIHRvdGFsbHksIGl0J3MgYSBjb21wbGV0ZSBwYWluIHRvIG1haW50YWluIGV2
ZW4gZm9yIHRoZSBHUFUgZHJpdmVycy4KPiAKPiBVbmZvcnR1bmF0ZWx5IHRoYXQgZG9lc24ndCBj
aGFuZ2UgdXNlcnMgZnJvbSByZXF1ZXN0aW5nIGl0LiBTbyBJJ20gcHJldHR5Cj4gc3VyZSB3ZSBh
cmUgZ29pbmcgdG8gc2VlIG1vcmUgb2YgdGhpcy4KCktlcm5lbCBtYWludGFpbmVycyBuZWVkIHRv
IHNheSBuby4KClRoZSBwcm9wZXIgd2F5IHRvIGRvIERNQSBvbiBuby1mYXVsdGluZyBoYXJkd2Fy
ZSBpcyBwYWdlIHBpbm5pbmcuCgpUcnlpbmcgdG8gaW1wcm92ZSBwZXJmb3JtYW5jZSBvZiBsaW1p
dGVkIEhXIGJ5IHVzaW5nIHNrZXRjaHkKdGVjaG5pcXVlcyBhdCB0aGUgY29zdCBvZiBnZW5lcmFs
IHN5c3RlbSBzdGFiaWxpdHkgc2hvdWxkIGJlIGEgTkFLLgoKSmFzb24KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
