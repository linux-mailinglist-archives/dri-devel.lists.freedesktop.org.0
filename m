Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D92021B5BB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 15:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FAB6EC41;
	Fri, 10 Jul 2020 13:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700063.outbound.protection.outlook.com [40.107.70.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF656E0D1;
 Fri, 10 Jul 2020 13:01:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJkzxDsVxd6UWgRY7nMqJaKwlXKR11wXCEl60F7mqXjKv2dgpITL8xW0uZ1B/94WXGkHUAqlaSSH2xAcZ14pASWckhLnhwHyui+uK+rWbnA60CioyzgrpyH0SK2LlBasF4xYsrawnVbqXJPc4Qvuz1vD5yPcGJMuWMgpyseJxG4a9L2RnBR8vTBl2KU6UwVYimABFPHnczFlwJh55ugxBnGKnIJCeHY9RWQqDEs3E2VHAuVaQzIeM092vEkvQUXAJU+KpEE6/TccsG5kbau6zYtNpVKFYglLJR2kt9ODWjE8FdtJNul08iq30zmiVfPfj9R063T/m1BzQ4GeVdPSog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvoj0UPxl5sV1BKedq5MB5ya7NKN4pwFxxf9skzqc5A=;
 b=QJIRHdMM49AUpfb9tPhRVBiUJBgz3TRJrvjnEUrrxO7ahcuLHjMY+22l7s59GcibLz2oL1wEEKemfjY2LRmaCjWPDRm1SsI5e8ZKVsa6DvsWSt6INeR0REjlYrY8L0pM0Tcn2AUvA/ArXY6SV3j92va5KXwcIzLoPDhs8FDyrcewKxC0WE+XG7HwZnlhRwIGqBAS0mS4Uv0/sUSGlCXpDgjHgE8r7aHXiJ1A/oprFnH1tD6TTaOXQ0/bHnbA7jWWmRQUrDWsTLqR0RCnHEekMy+menTR6hltJIkdfk2bw+pEdoT9+Yrs/ONhWQxz5UrSe5WwqJO20ktT/namX9qCbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvoj0UPxl5sV1BKedq5MB5ya7NKN4pwFxxf9skzqc5A=;
 b=fRAELXzYpnbCo7qdLnST2p6fw9QAzWJJ3pHGCDDfJtQ4RbYkzJvQg/W5jugk3cNsP8afARLtjTSLbmeXSQ2Rts0brdR4953pbSbnj7kFTI0e9pfTiZKHZUhmqAcC0PjIP1S0TQ6AEEKXipQdbSE/vInn/jIkFYI0B7/bCchozDU=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3837.namprd12.prod.outlook.com (2603:10b6:208:166::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Fri, 10 Jul
 2020 13:01:18 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3174.023; Fri, 10 Jul 2020
 13:01:17 +0000
Subject: Re: [PATCH 02/25] dma-fence: prime lockdep annotations
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
 <20200707201229.472834-3-daniel.vetter@ffwll.ch>
 <20200709080911.GP3278063@phenom.ffwll.local>
 <20200710124357.GB23821@mellanox.com>
 <5c163d74-4a28-1d74-be86-099b4729a2e0@amd.com>
 <20200710125453.GC23821@mellanox.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4f4a2cf7-f505-8494-1461-bd467870481e@amd.com>
Date: Fri, 10 Jul 2020 15:01:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200710125453.GC23821@mellanox.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR05CA0112.eurprd05.prod.outlook.com
 (2603:10a6:207:2::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR05CA0112.eurprd05.prod.outlook.com (2603:10a6:207:2::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.22 via Frontend Transport; Fri, 10 Jul 2020 13:01:15 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 654f8270-9a84-4446-88d7-08d824d15574
X-MS-TrafficTypeDiagnostic: MN2PR12MB3837:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3837B2385A43A1D20210668F83650@MN2PR12MB3837.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xRLiOYHxG5vTItW5egYmGcyj2/QGyI/CtGDYhznnJ7R+Ntr6izpVJGlvR2P5oHalT33iFcyv6YGRb2WmeJpjZQ5I9z1OJ9w7X8cLtBVD6HBh1cPUKxD2YVSQE0LxnfdaByHrLlGKePgoYk5aLhNJAi/hYVAOUtaZcLDniru2cWZ4XbfoxA+pK77voQkO16Jp0ws7LPv89gBoRszWMaMZ++2mqF+TShGO+MIQ/77L1zVeqMewzntInmm/7VzlHcPmx1WfL4x+sap0Z7SM5jWgXLJKSlB0VdrNqG2UFmJAOU9TF/Q+3O6d6PGEMCImX/T0lMdjCR6HuPDApZrqdqXJHhqkr5f8qTymcd11j6z2STYzY+jlX+beKCz6l7Bv7gf7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(31696002)(86362001)(5660300002)(186003)(2906002)(52116002)(31686004)(6486002)(54906003)(6666004)(6916009)(16526019)(83380400001)(66556008)(66946007)(36756003)(316002)(478600001)(4326008)(7416002)(66574015)(8936002)(8676002)(2616005)(66476007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Cp/XSdTj4fK0jBEt08abf2CDWwk/t//b6f9CU9BkqlDdICPd/8+QeMo30jSK3XW+ZWMRu2HlyjHQYolwSukXWY/5pTgyhZ9wjEuQ//evrWRgws1MXibgHuGF2qEbf3tZVWFBObiukkm9SrxKl+o8RN5hfq6TfWOjlxDTyb8W/M/5LPadF4m5GsPnBf4Sn/CEMjXKTl4BY/x98q++otSIneHE3u/UjQ15Iw/eiZhJ20pW5ClvxZgRVUClZ+o4ySL5ABP6P/QS2BHkU1MWXfYSihv2c7rgwhL7HSUzPNVCFkIEkNmzVbL8xSNQAAT6Tdc7P8LaGYMBCj3rzYnsCKyAn32pM8ooURKAUcdMiQsK+i5LzxVgajHwZsQU6LDtu9VSZqnPPeQa306sdXe/+dUvI0xCDPgcfNsN5pKxV723OzkPslEE26SbO0dNKIjJaSP1Lh9x3kmdAunHvP+qwvkZ2ZPWm2PYMPuBLIVj9wbfTKuk716/HKE934Mf4xoTmtxkr2BXYtOVpmZVbvVmnmsy5nhxFLBA4UPixetKQp25luyXPYckWV0nj9s3p7k5EW7B
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 654f8270-9a84-4446-88d7-08d824d15574
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2020 13:01:17.7848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qdzPPeSxnFTZhRMskH2h0e3xvWnqWdX/cpk660JRGnCwVgVSA5HIezqnQF9Rag7X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3837
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
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@intel.com>,
 amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 linux-media@vger.kernel.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTAuMDcuMjAgdW0gMTQ6NTQgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4gT24gRnJpLCBK
dWwgMTAsIDIwMjAgYXQgMDI6NDg6MTZQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4gQW0gMTAuMDcuMjAgdW0gMTQ6NDMgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4+PiBPbiBU
aHUsIEp1bCAwOSwgMjAyMCBhdCAxMDowOToxMUFNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3Rl
Ogo+Pj4+IEhpIEphc29uLAo+Pj4+Cj4+Pj4gQmVsb3cgdGhlIHBhcmFncmFwaCBJJ3ZlIGFkZGVk
IGFmdGVyIG91ciBkaXNjdXNzaW9ucyBhcm91bmQgZG1hLWZlbmNlcwo+Pj4+IG91dHNpZGUgb2Yg
ZHJpdmVycy9ncHUuIEdvb2QgZW5vdWdoIGZvciBhbiBhY2sgb24gdGhpcywgb3Igd2FudCBzb21l
dGhpbmcKPj4+PiBjaGFuZ2VkPwo+Pj4+Cj4+Pj4gVGhhbmtzLCBEYW5pZWwKPj4+Pgo+Pj4+PiAr
ICogTm90ZSB0aGF0IG9ubHkgR1BVIGRyaXZlcnMgaGF2ZSBhIHJlYXNvbmFibGUgZXhjdXNlIGZv
ciBib3RoIHJlcXVpcmluZwo+Pj4+PiArICogJm1tdV9pbnRlcnZhbF9ub3RpZmllciBhbmQgJnNo
cmlua2VyIGNhbGxiYWNrcyBhdCB0aGUgc2FtZSB0aW1lIGFzIGhhdmluZyB0bwo+Pj4+PiArICog
dHJhY2sgYXN5bmNocm9ub3VzIGNvbXB1dGUgd29yayB1c2luZyAmZG1hX2ZlbmNlLiBObyBkcml2
ZXIgb3V0c2lkZSBvZgo+Pj4+PiArICogZHJpdmVycy9ncHUgc2hvdWxkIGV2ZXIgY2FsbCBkbWFf
ZmVuY2Vfd2FpdCgpIGluIHN1Y2ggY29udGV4dHMuCj4+PiBJIHdhcyBob3Bpbmcgd2UnZCBnZXQg
dG8gJ25vIGRyaXZlciBvdXRzaWRlIEdQVSBzaG91bGQgZXZlbiB1c2UKPj4+IGRtYV9mZW5jZSgp
Jwo+PiBNeSBsYXN0IHN0YXR1cyB3YXMgdGhhdCBWNEwgY291bGQgY29tZSB1c2UgZG1hX2ZlbmNl
cyBhcyB3ZWxsLgo+IEknbSBzdXJlIGxvdHMgb2YgcGxhY2VzICpjb3VsZCogdXNlIGl0LCBidXQg
SSB0aGluayBJIHVuZGVyc3Rvb2QgdGhhdAo+IGl0IGlzIGEgYmFkIGlkZWEgdW5sZXNzIHlvdSBo
YXZlIHRvIGZpdCBpbnRvIHRoZSBEUk0gdUFQST8KCkl0IHdvdWxkIGJlIGEgYml0IHF1ZXN0aW9u
YWJsZSBpZiB5b3UgdXNlIHRoZSBjb250YWluZXIgb2JqZWN0cyB3ZSBjYW1lIAp1cCB3aXRoIGlu
IHRoZSBEUk0gc3Vic3lzdGVtIG91dHNpZGUgb2YgaXQuCgpCdXQgdXNpbmcgdGhlIGRtYV9mZW5j
ZSBpdHNlbGYgbWFrZXMgc2Vuc2UgZm9yIGV2ZXJ5dGhpbmcgd2hpY2ggY291bGQgZG8gCmFzeW5j
IERNQSBpbiBnZW5lcmFsLgoKPiBZb3UgYXJlIGJldHRlciB0byBkbyBzb21ldGhpbmcgY29udGFp
bmVkIGluIHRoZSBzaW5nbGUgZHJpdmVyIHdoZXJlCj4gbG9ja2luZyBjYW4gYmUgYW5hbHl6ZWQu
Cj4KPj4gSSdtIG5vdCAxMDAlIHN1cmUsIGJ1dCB3b3VsZG4ndCBNTVUgbm90aWZpZXIgKyBkbWFf
ZmVuY2UgYmUgYSB2YWxpZCB1c2UgY2FzZQo+PiBmb3IgdGhpbmdzIGxpa2UgY3VzdG9tIEZQR0Eg
aW50ZXJmYWNlcyBhcyB3ZWxsPwo+IEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGV4cGFuZCB0aGUg
bGlzdCBvZiBkcml2ZXJzIHRoYXQgdXNlIHRoaXMKPiB0ZWNobmlxdWUuCj4gRHJpdmVycyB0aGF0
IGNhbid0IHN1c3BlbmQgc2hvdWxkIHBpbiBtZW1vcnksIG5vdCB1c2UgYmxvY2tlZAo+IG5vdGlm
aWVycyB0byBjcmVhdGVkIHBpbm5lZCBtZW1vcnkuCgpBZ3JlZWQgdG90YWxseSwgaXQncyBhIGNv
bXBsZXRlIHBhaW4gdG8gbWFpbnRhaW4gZXZlbiBmb3IgdGhlIEdQVSBkcml2ZXJzLgoKVW5mb3J0
dW5hdGVseSB0aGF0IGRvZXNuJ3QgY2hhbmdlIHVzZXJzIGZyb20gcmVxdWVzdGluZyBpdC4gU28g
SSdtIApwcmV0dHkgc3VyZSB3ZSBhcmUgZ29pbmcgdG8gc2VlIG1vcmUgb2YgdGhpcy4KCkNocmlz
dGlhbi4KCj4KPiBKYXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
