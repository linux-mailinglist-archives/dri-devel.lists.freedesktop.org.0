Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11429205B08
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 20:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984016EA2E;
	Tue, 23 Jun 2020 18:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680061.outbound.protection.outlook.com [40.107.68.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C083D6EA2C;
 Tue, 23 Jun 2020 18:44:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGal9rzS+ZdPHXN7ity1AHUOetLZQru5okq+C9fleXbHVJDrRvvcPo33UhLADbZlWEfOEgeaSE+bZyq5bWg3UZNxjDD3VThjc/15F+XF5Tq552xNNoyujq/lvkPvaYWGYJUZZ2j1jLAo7c+LshjBu3K6d9v+aXKVWrxcCXGxkp0oYpfvJETIPX2XsqUs68qj01l4DhrzU2AoU3LohPobZCWpUEZRAu6XhYOAVUtCOrHb5YmB+Il79gZg8wNPemU++D+GLEdAKa5w55kDtP+jFt2ar2pf8lAVFdNKSnqapW1vpeFqJ96erruOEYTYQNt2SS2MDm09qMy1N3E+5XfSQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpyBSe/Mausy9Q9xIlp7WqOYfXTTTSgy65o5X07mAKM=;
 b=HNdq8F6xleENe7a0pZgWR5s85wVpS50pzQbLn/b+sy/h38pXltpM2ColMbdisZ9BxiOmapuqC9RFc5uyMOc42wXMvrwQMBhkySnWq3CleWa5u9xM3zCoEWUYuZfSoNK/jasWAHLIESAme3z4k78GczjoXMM97jWvyElbQNq/IwpGFFky00d3sptEm5NVtreEvcv/iQLy4qMYz0TB0AlWt0HzsCfceSZPTJdGlPCsn/F5a8uCH6MOs2YWHnb1vLFkVEoQEPxjfttYmmG6qo/zOSgIbBd0/CZIyuovBJIBH/Amfpco+fw4Cb/m33UuOHmghECUvqKhjK6wU3xDcgqTvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpyBSe/Mausy9Q9xIlp7WqOYfXTTTSgy65o5X07mAKM=;
 b=ROSFSatg70lKkNykuMQz6dONdWh7lr1th0C8qaX4x8a/YCYy4E5l9JMXD/6/xMGbkb0BnEs7ffYiCoGKrROX6DrYwuTmSSRMnFqrP9qzVQ4hOPpXGYW5WWYCv2FPiyZtRc3aHoY/W9iQsJWgJ/sidqkw5BoFIxmTuCYSQB/uzok=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 by SN1PR12MB2510.namprd12.prod.outlook.com (2603:10b6:802:28::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Tue, 23 Jun
 2020 18:44:27 +0000
Received: from SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::18d:97b:661f:9314]) by SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::18d:97b:661f:9314%7]) with mapi id 15.20.3109.021; Tue, 23 Jun 2020
 18:44:27 +0000
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep annotations
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
 <20200604081224.863494-5-daniel.vetter@ffwll.ch>
 <b11c2140-1b9c-9013-d9bb-9eb2c1906710@shipmail.org>
 <20200611083430.GD20149@phenom.ffwll.local> <20200611141515.GW6578@ziepe.ca>
 <4702e170-fd02-88fa-3da4-ea64252fff9a@amd.com>
 <CAKMK7uHBKrpDWu+DvtYncDK=LOdGJyMK7t6fpOaGovnYFiBUZw@mail.gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <99758c09-262a-e9a1-bf65-5702b35b4388@amd.com>
Date: Tue, 23 Jun 2020 14:44:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <CAKMK7uHBKrpDWu+DvtYncDK=LOdGJyMK7t6fpOaGovnYFiBUZw@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: YQBPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::20) To SN1PR12MB2414.namprd12.prod.outlook.com
 (2603:10b6:802:2e::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.63.128) by
 YQBPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Tue, 23 Jun 2020 18:44:26 +0000
X-Originating-IP: [142.116.63.128]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a4870c98-7a4d-47d7-1d96-08d817a57535
X-MS-TrafficTypeDiagnostic: SN1PR12MB2510:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB251032784C27E3E494F690B292940@SN1PR12MB2510.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-Forefront-PRVS: 04433051BF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EBeOa6qdsFFSxtV0/6Nc8Iw3gHKVMfqr7+7YcwWO2Q3oCnPnZC0mUvZhL7gb/RwDHpePXor/BR3Qj1PlnGCMNcIEmcK/akI5tqfO1Pr22474uScXqCabvSWaTDq+g9JrbVx3S5/rwD5A4817CU+0RQd2SR5ZkkHCz536aFZB6jOUbXFxlpzG0QTR3uCLJKlRDnWfZuRIDDPX+Ij0ghVrl8tAxt0SOO4ST9ynAbLZ3GkLg7v6/p2DkIP/6V/jb9PUSYhiRnyO3eq67o1nCX9w8zjixFAHqT6RxI/Iym2clnVeFuAO/Wa7yeM4EiKVyjaj/VAL5KwfWRup4jfJd730b0GQW1g5+dI+AvnY6XT0LdZYgY+vCF9I9jyKh+TwYMiIuUsN7svKE/1h4Mr3PAS7uUrzP7te9RNiNG0LaFJfSiU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2414.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(8676002)(6486002)(86362001)(7416002)(54906003)(316002)(8936002)(44832011)(956004)(2616005)(31696002)(5660300002)(478600001)(4326008)(16576012)(52116002)(31686004)(16526019)(6916009)(83380400001)(36756003)(66476007)(66946007)(2906002)(66556008)(966005)(53546011)(186003)(26005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: +Fjeaie/hiKPDNe2T5bo173L+87sd5OK/IjavYHGlvcsOFCiTW9Dc+nuYiqN8o7Isj6qyL1ZFJfDkwdPfkd456XysI0mv9hd1z0uGXDCDZkgR2L8lFBD7JbtujXuWdiXBzzvk7rkh3l/L0y2l+3j7fChqwl1BZg++mcTPG9nMYbIg16q9PVroebiwS5k021ZcRhmYM2GoYV8pUCimIawuOauJpNo821jDp5yxoj5LcBL+oegEANFncIxewy/UMDIiqgaKLi9YQvGt1AwGie8uwB9hViK0iCzXXUj6e51GURPLRqDk6JantIKWvp9E4m82E+cWi6I8ySm3Z2CvzUlRKCpNWZX0WVqZwDSCfTaQlIIKZnwagz1aTvaJUKxaSUY3+2g2mEpf0UofKdOtZjltJ7lkBeyoGAzGJxVzJj4mjEFfCTdvND3ijnkCb0LAxwSFmlNHLADQBcUiwRtKUIH4fQLzBRN/ruplLNCaI3knVGSsT/kMFsR1lDMbx193R1A
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4870c98-7a4d-47d7-1d96-08d817a57535
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2020 18:44:27.7922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ip46S6apHT4+o/d11JZkRyfUzTFQUMVgDK7tOuGMMHaW5r8fehi0XWVnuqaIwyctV32ywaGomPhASixdzwXt/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2510
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Thomas Hellstrom <thomas.hellstrom@intel.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMC0wNi0yMyB1bSAzOjM5IGEubS4gc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIEZy
aSwgSnVuIDEyLCAyMDIwIGF0IDE6MzUgQU0gRmVsaXggS3VlaGxpbmcgPGZlbGl4Lmt1ZWhsaW5n
QGFtZC5jb20+IHdyb3RlOgo+PiBBbSAyMDIwLTA2LTExIHVtIDEwOjE1IGEubS4gc2NocmllYiBK
YXNvbiBHdW50aG9ycGU6Cj4+PiBPbiBUaHUsIEp1biAxMSwgMjAyMCBhdCAxMDozNDozMEFNICsw
MjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+Pj4+PiBJIHN0aWxsIGhhdmUgbXkgZG91YnRzIGFi
b3V0IGFsbG93aW5nIGZlbmNlIHdhaXRpbmcgZnJvbSB3aXRoaW4gc2hyaW5rZXJzLgo+Pj4+PiBJ
TU8gaWRlYWxseSB0aGV5IHNob3VsZCB1c2UgYSB0cnl3YWl0IGFwcHJvYWNoLCBpbiBvcmRlciB0
byBhbGxvdyBtZW1vcnkKPj4+Pj4gYWxsb2NhdGlvbiBkdXJpbmcgY29tbWFuZCBzdWJtaXNzaW9u
IGZvciBkcml2ZXJzIHRoYXQKPj4+Pj4gcHVibGlzaCBmZW5jZXMgYmVmb3JlIGNvbW1hbmQgc3Vi
bWlzc2lvbi4gKFNpbmNlIGVhcmx5IHJlc2VydmF0aW9uIG9iamVjdAo+Pj4+PiByZWxlYXNlIHJl
cXVpcmVzIHRoYXQpLgo+Pj4+IFllYWggaXQgaXMgYSBiaXQgYW5ub3lpbmcsIGUuZy4gZm9yIGRy
bS9zY2hlZHVsZXIgSSB0aGluayB3ZSdsbCBlbmQgdXAKPj4+PiB3aXRoIGEgbWVtcG9vbCB0byBt
YWtlIHN1cmUgaXQgY2FuIGhhbmRsZSBpdCdzIGFsbG9jYXRpb25zLgo+Pj4+Cj4+Pj4+IEJ1dCBz
aW5jZSBkcml2ZXJzIGFyZSBhbHJlYWR5IHdhaXRpbmcgZnJvbSB3aXRoaW4gc2hyaW5rZXJzIGFu
ZCBJIHRha2UgeW91cgo+Pj4+PiB3b3JkIGZvciBITU0gcmVxdWlyaW5nIHRoaXMsCj4+Pj4gWWVh
aCB0aGUgYmlnIHRyb3VibGUgaXMgSE1NIGFuZCBtbXUgbm90aWZpZXJzLiBUaGF0J3MgdGhlIHJl
YWxseSBhd2t3YXJkCj4+Pj4gb25lLCB0aGUgc2hyaW5rZXIgb25lIGlzIGEgbG90IGxlc3MgZXN0
YWJsaXNoZWQuCj4+PiBJIHJlYWxseSBxdWVzdGlvbiBpZiBIVyB0aGF0IG5lZWRzIHNvbWV0aGlu
ZyBsaWtlIERNQSBmZW5jZSBzaG91bGQKPj4+IGV2ZW4gYmUgdXNpbmcgbW11IG5vdGlmaWVycyAt
IHRoZSBiZXN0IHVzZSBpcyBIVyB0aGF0IGNhbiBmZW5jZSB0aGUKPj4+IERNQSBkaXJlY3RseSB3
aXRob3V0IGhhdmluZyB0byBnZXQgaW52b2x2ZWQgd2l0aCBzb21lIGNvbW1hbmQgc3RyZWFtCj4+
PiBwcm9jZXNzaW5nLgo+Pj4KPj4+IE9yIGF0IHRoZSB2ZXJ5IGxlYXN0IGl0IHNob3VsZCBub3Qg
YmUgYSBnZW5lcmljIERNQSBmZW5jZSBidXQgYQo+Pj4gbmFycm93ZWQgY29tcGxldGlvbiB0aWVk
IG9ubHkgaW50byB0aGUgc2FtZSBHUFUgZHJpdmVyJ3MgY29tbWFuZAo+Pj4gY29tcGxldGlvbiBw
cm9jZXNzaW5nIHdoaWNoIHNob3VsZCBiZSBhYmxlIHRvIHByb2dyZXNzIHdpdGhvdXQKPj4+IGJs
b2NraW5nLgo+Pj4KPj4+IFRoZSBpbnRlbnQgb2Ygbm90aWZpZXJzIHdhcyBuZXZlciB0byBlbmRs
ZXNzbHkgYmxvY2sgd2hpbGUgdmFzdAo+Pj4gYW1vdW50cyBvZiBTVyBkb2VzIHdvcmsuCj4+Pgo+
Pj4gR29pbmcgYXJvdW5kIGFuZCBzd2l0Y2hpbmcgZXZlcnl0aGluZyBpbiBhIEdQVSB0byBHRlBf
QVRPTUlDIHNlZW1zCj4+PiBsaWtlIGJhZCBpZGVhLgo+Pj4KPj4+PiBJJ3ZlIHBpbmdlZCBhIGJ1
bmNoIG9mIGFybXNvYyBncHUgZHJpdmVyIHBlb3BsZSBhbmQgYXNrIHRoZW0gaG93IG11Y2ggdGhp
cwo+Pj4+IGh1cnRzLCBzbyB0aGF0IHdlIGhhdmUgYSBjbGVhciBhbnN3ZXIuIE9uIHg4NiBJIGRv
bid0IHRoaW5rIHdlIGhhdmUgbXVjaAo+Pj4+IG9mIGEgY2hvaWNlIG9uIHRoaXMsIHdpdGggdXNl
cnB0ciBpbiBhbWQgYW5kIGk5MTUgYW5kIGhtbSB3b3JrIGluIG5vdXZlYXUKPj4+PiAoYnV0IG5v
dXZlYXUgSSB0aGluayBkb2Vzbid0IHVzZSBkbWFfZmVuY2UgaW4gdGhlcmUpLgo+PiBTb29uIG5v
dXZlYXUgd2lsbCBnZXQgY29tcGFueS4gV2UncmUgd29ya2luZyBvbiBhIHJlY292ZXJhYmxlIHBh
Z2UgZmF1bHQKPj4gaW1wbGVtZW50YXRpb24gZm9yIEhNTSBpbiBhbWRncHUgd2hlcmUgd2UnbGwg
bmVlZCB0byB1cGRhdGUgcGFnZSB0YWJsZXMKPj4gdXNpbmcgdGhlIEdQVXMgU0RNQSBlbmdpbmUg
YW5kIHdhaXQgZm9yIGNvcnJlc3BvbmRpbmcgZmVuY2VzIGluIE1NVQo+PiBub3RpZmllcnMuCj4g
Q2FuIHlvdSBwbHMgY2MgdGhlc2UgcGF0Y2hlcyB0byBkcmktZGV2ZWwgd2hlbiB0aGV5IHNob3cg
dXA/IERlcGVuZGluZwo+IHVwb24gaG93IHlvdXIgaHcgd29ya3MgdGhlcmUncyBhbmQgZW5kbGVz
cyBhbW91bnQgb2YgYmFkIHRoaW5ncyB0aGF0Cj4gY2FuIGhhcHBlbi4KClllcywgSSdsbCBkbyB0
aGF0LgoKCj4KPiBBbHNvIEkgdGhpbmsgKGFnYWluIGRlcGVuZGluZyB1cG9uIGhvdyB0aGUgaHcg
ZXhhY3RseSB3b3JrcykgdGhpcwo+IHN0dWZmIHdvdWxkIGJlIGEgcGVyZmVjdCBleGFtcGxlIGZv
ciB0aGUgZG1hX2ZlbmNlIGFubm90YXRpb25zLgoKV2UgaGF2ZSBhbHJlYWR5IGFwcGxpZWQgeW91
ciBwYXRjaCBzZXJpZXMgdG8gb3VyIGRldmVsb3BtZW50IGJyYW5jaC4gSQpoYXZlbid0IGxvb2tl
ZCBpbnRvIHdoYXQgYW5ub3RhdGlvbnMgd2UnZCBoYXZlIHRvIGFkZCB0byBvdXIgbmV3IGNvZGUg
eWV0LgoKCj4KPiBUaGUgd29yc3QgY2FzZSBpcyBpZiB5b3VyIGh3IGNhbm5vdCBwcmVlbXB0IHdo
aWxlIGEgaHcgcGFnZSBmYXVsdCBpcwo+IHBlbmRpbmcuIFRoYXQgbWVhbnMgbm9uZSBvZiB0aGUg
ZG1hX2ZlbmNlIHdpbGwgZXZlciBzaWduYWwgKHRoZSBhbWRrZmQKPiBwcmVlbXB0IGN0eCBmZW5j
ZXMgd29udCwgYW5kIHRoZSBjbGFzc2ljIGZlbmNlcyBmcm9tIGFtZGdwdSBtaWdodCBiZQo+IGFs
c28gc3RhbGwpLiBBdCBsZWFzdCB3aGVuIHlvdSdyZSB1bmx1Y2t5IGFuZCB0aGUgZmVuY2UgeW91
J3JlIHdhaXRpbmcKPiBvbiBzb21laG93IChhbnl3aGVyZSBpbiBpdHMgZGVwZW5kZW5jeSBjaGFp
biByZWFsbHkpIG5lZWQgdGhlIGVuZ2luZQo+IHRoYXQncyBjdXJyZW50bHkgYmxvY2tlZCB3YWl0
aW5nIGZvciB0aGUgaHcgcGFnZSBmYXVsdC4KCk91ciBIVyBjYW4gcHJlZW1wdCB3aGlsZSBoYW5k
bGluZyBhIHBhZ2UgZmF1bHQsIGF0IGxlYXN0IG9uIHRoZSBHUFUKZ2VuZXJhdGlvbiB3ZSdyZSB3
b3JraW5nIG9uIG5vdy4gT24gb3RoZXIgR1BVcyB3ZSBoYXZlbid0IGluY2x1ZGVkIGluCm91ciBp
bml0aWFsIGVmZm9ydCwgd2Ugd2lsbCBub3QgYmUgYWJsZSB0byBwcmVlbXB0IHdoaWxlIGEgcGFn
ZSBmYXVsdCBpcwppbiBwcm9ncmVzcy4gVGhpcyBpcyBwcm9ibGVtYXRpYywgYnV0IHRoYXQncyBm
b3IgcmVhc29ucyByZWxhdGVkIHRvIG91cgpHUFUgaGFyZHdhcmUgc2NoZWR1bGVyIGFuZCB1bnJl
bGF0ZWQgdG8gZmVuY2VzLgoKCj4KPiBUaGF0IGluIHR1cm4gbWVhbnMgYW55dGhpbmcgeW91IGRv
IGluIHlvdXIgaHcgcGFnZSBmYXVsdCBoYW5kbGVyIGlzIGluCj4gdGhlIGNyaXRpY2FsIHNlY3Rp
b24gZm9yIGRtYSBmZW5jZSBzaWduYWxsaW5nLCB3aGljaCBoYXMgZmFyIHJlYWNoaW5nCj4gaW1w
bGljYXRpb25zLgoKSSdtIG5vdCBzdXJlIEkgYWdyZWUsIGF0IGxlYXN0IGZvciBLRkQuIFRoZSBv
bmx5IHBsYWNlIHdoZXJlIEtGRCB1c2VzCmZlbmNlcyB0aGF0IGRlcGVuZCBvbiBwcmVlbXB0aW9u
cyBpcyBldmljdGlvbiBmZW5jZXMuIEFuZCB3ZSBjYW4gZ2V0IHJpZApvZiB0aG9zZSBpZiB3ZSBj
YW4gcHJlZW1wdCBHUFUgYWNjZXNzIHRvIHNwZWNpZmljIEJPcyBieSBpbnZhbGlkYXRpbmcKR1BV
IFBURXMuIFRoYXQgd2F5IHdlIGRvbid0IG5lZWQgdG8gcHJlZW1wdCB0aGUgR1BVIHF1ZXVlcyB3
aGlsZSBhIHBhZ2UKZmF1bHQgaXMgaW4gcHJvZ3Jlc3MuIEluc3RlYWQgd2Ugd291bGQgY3JlYXRl
IG1vcmUgcGFnZSBmYXVsdHMuCgpUaGF0IGFzc3VtZXMgdGhhdCB3ZSBjYW4gaW52YWxpZGF0ZSBH
UFUgUFRFcyB3aXRob3V0IGRlcGVuZGluZyBvbgpmZW5jZXMuIFdlJ3ZlIGRpc2N1c3NlZCBwb3Nz
aWJsZSBkZWFkbG9ja3MgZHVlIHRvIG1lbW9yeSBhbGxvY2F0aW9ucwpuZWVkZWQgb24gdGhhdCBj
b2RlIHBhdGhzIGZvciBJQnMgb3IgcGFnZSB0YWJsZXMuIFdlJ3ZlIGFscmVhZHkKZWxpbWluYXRl
ZCBwYWdlIHRhYmxlIGFsbG9jYXRpb25zIGFuZCByZXNlcnZhdGlvbiBsb2NrcyBvbiB0aGUgUFRF
CmludmFsaWRhdGlvbiBjb2RlIHBhdGguIEFuZCB3ZSdyZSB1c2luZyBhIHNlcGFyYXRlIHNjaGVk
dWxlciBlbnRpdHkgc28Kd2UgY2FuJ3QgZ2V0IHN0dWNrIGJlaGluZCBvdGhlciBJQnMgdGhhdCBk
ZXBlbmQgb24gZmVuY2VzLiBJSVJDLApDaHJpc3RpYW4gYWxzbyBpbXBsZW1lbnRlZCBhIHNlcGFy
YXRlIG1lbW9yeSBwb29sIGZvciBJQnMgZm9yIHRoaXMgY29kZQpwYXRoLgoKUmVnYXJkcywKwqAg
RmVsaXgKCgo+IC1EYW5pZWwKPgo+PiBSZWdhcmRzLAo+PiAgIEZlbGl4Cj4+Cj4+Cj4+PiBSaWdo
dCwgbm9yIHdpbGwgUkRNQSBPRFAuCj4+Pgo+Pj4gSmFzb24KPj4+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+
Pj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo+PiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPgo+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
