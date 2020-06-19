Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D51A2201BE8
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 22:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7246EA04;
	Fri, 19 Jun 2020 20:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760040.outbound.protection.outlook.com [40.107.76.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125806E94A;
 Fri, 19 Jun 2020 20:03:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JG0wmHbsWmqhq8i//9RVirkPbeepXJw/3CezNwkc3pCHdGJ7ZKBPK3O97W9KVihxQjiJRQtYcjrBJCfab+qyclFUkAaPRNiZ15HvRNzPZutDMyXAyucV3EWPhgun0SrPGK1vGxyzi9TFL4VOG4LBrYfiLrLUhAa2bcP6CcvsfVlaHHi2a9TIVyYB6OdowF9OSy14WTP92aHN586Tpp964drrzB2HWKFsdSMNsgQSyAVAowS6IMIUHatKjoHHeZ37tKixdP3UBaaPDesJ5/+jHGhdgPXpj4IL9C8KJyM2YAwivZt4ne0i/crndyvD5eOZjKB/ViVfxx8FKZUSRetnRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSLqUErcw365gbQeTkLCzN7f8n341o9UbrWcBRLrfjQ=;
 b=lTD6eyHr8gS5LN9kKxNYg6Yiqy+fDp/epVqzI3ahBkegI6xflqkXOcGL0jZs4Ms/CDWlfNgRczgk3WNiM8ll6Ypc74fUW9/quEOsxg5eYZs7k6v66MPStBakzKZd62EZ84hlw/zpF98Au/kTHADrOTnzHb5tHxwn9swPA+zZX1HDTT5StoAGQTg6c4zg3K392lKsNAY9WZ5cCoEHzt8X47XehQ6LfSAiYvYOIraKRirJ7o8EkoV4jOwYaybZFF2yadyJgtE8Dh/GA8pCsyVyjOsHBem43y4xuwPkdQZwi5Yo2JnuIxT0Tr0mqt30wD6ZtJm6rfotRdM037knM2GDig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSLqUErcw365gbQeTkLCzN7f8n341o9UbrWcBRLrfjQ=;
 b=fBej0NlVcaEAY0Hfo+XSsuwFQUt1DVlDIHSK6RBnqCCKmX1N/CXLBz6qdxWX+57WLTom0XTrzUmNoA7V8iHwhI3aQaJkox78XepfCnMsIYXZX8wXNDaZaTFnk45ZkU6flqQOD3k+jX1RurtNWSc3pov4rKLqu2IO1Ffv0pw00/E=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 by SA0PR12MB4446.namprd12.prod.outlook.com (2603:10b6:806:71::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Fri, 19 Jun
 2020 20:03:34 +0000
Received: from SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::18d:97b:661f:9314]) by SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::18d:97b:661f:9314%7]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 20:03:34 +0000
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep annotations
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20200618172338.GM6578@ziepe.ca>
 <CAKMK7uEbqTu4q-amkLXyd1i8KNtLaoO2ZFoGqYiG6D0m0FKpOg@mail.gmail.com>
 <20200619113934.GN6578@ziepe.ca>
 <CAKMK7uE-kWA==Cko5uenMrcnopEjq42HxoDTDywzBAbHqsN13g@mail.gmail.com>
 <20200619151551.GP6578@ziepe.ca>
 <CAKMK7uEvkshAM6KUYZu8_OCpF4+1Y_SM7cQ9nJWpagfke8s8LA@mail.gmail.com>
 <20200619172308.GQ6578@ziepe.ca> <20200619180935.GA10009@redhat.com>
 <20200619181849.GR6578@ziepe.ca>
 <56008d64-772d-5757-6136-f20591ef71d2@amd.com>
 <20200619195538.GT6578@ziepe.ca>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <789aa42e-0ddc-14f2-96be-07c00603efea@amd.com>
Date: Fri, 19 Jun 2020 16:03:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200619195538.GT6578@ziepe.ca>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To SN1PR12MB2414.namprd12.prod.outlook.com
 (2603:10b6:802:2e::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.63.128) by
 YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend
 Transport; Fri, 19 Jun 2020 20:03:33 +0000
X-Originating-IP: [142.116.63.128]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1cfc64bd-c014-4a4f-d855-08d8148bd8bc
X-MS-TrafficTypeDiagnostic: SA0PR12MB4446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4446767A85FE9FC4C73E0E2292980@SA0PR12MB4446.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0439571D1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6bEP4Afs8TryzdJCPZ/qf9DxGNSXnRcJT0O4u+UQHr6G9Mkm9kO4Wm5WA9Hfi47yz+TOEVeWfw9V/8CVq3Pg8C9G43wUGBzaTIXzu0F10eKH+2B/xwB1P8bZSFlGRExJeZ+O0ZtCHiedC7pLF8VjSj17kVj90EbsKfJ+9cOwyZti4jjNMKiTIckN1HrOWgJxaA3Ba0OuuaKsgwEk5E8xl6/12S/ZUcoCwB+t2ZYHZQvzq8lPEyTrzl1jNMe2y/LJ5D6Pycyl3E+Xn+F6saYtONFiXNmBDSZ9bbexOlCBmF6NWMbMRy0zdfk4J5I5bOk2+PlHrumIuVWTDz1XuOpRP9y249seiupSdBXfWl3RC3bgaHoIAqrw57xRGpR4ulke
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2414.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(66946007)(66476007)(66556008)(52116002)(26005)(186003)(16526019)(83380400001)(316002)(16576012)(54906003)(44832011)(956004)(2616005)(86362001)(31696002)(31686004)(478600001)(8936002)(7416002)(36756003)(6486002)(8676002)(2906002)(5660300002)(4326008)(6916009)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Zo3Tf0t1VWiIXIkWjW7LU93PiNZvBn4o11OFBIf8WZrvL0ap8ev6rgTzu5wNys6FJ9NzVyMpq9kShPiZI9GMltnchmtsvteP6GkLziwTejEpNFvTF4rAvdGvslSXIoxWP35/iCj1bViqZxBOeRkcLYaL8hSD8guBCEB1KKiJEKfFKH+3LqG7jkI92g0xaMyNviryYnmGjKV5cA9wBaUv4CJgE6wa8J0cg5Pmw5ulbartrue4hdvYcsEBOznW+3HrX3jrw/Yp2bU+KbO8hXy6skywADcIThQoQwk/bvGn0wnmfwNm9Kd2aTZ+tYtP3pBN26+2i2+bs4oX/WR+ApB3RKOqbTy13dfl7cYiisz6DjsAu7WS7f4cjSC5pz0eGJDFR5ScIyo/vcUK2/t9ojVKp2q8xnM1pBIJFmnJH5v+Yz3iqqqgvk5V4XnK7O2c/f7PZUXdrCEUnZ1onwzDVqJKuqgqM3ZyyjlJY3CTbv4P6MoFwSn+KrEbyHHgEoBGXCPQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cfc64bd-c014-4a4f-d855-08d8148bd8bc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2020 20:03:34.4488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SbWO5zAONhMZfIimuvSuyttgMifJlQQgcid2omNW9KsnrGQTxsQRr8wsNKEF67CSGfL7sVwM0z1EvF9Dr1wxcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4446
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
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jerome Glisse <jglisse@redhat.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkFtIDIwMjAtMDYtMTkgdW0gMzo1NSBwLm0uIHNjaHJpZWIgSmFzb24gR3VudGhvcnBlOgo+IE9u
IEZyaSwgSnVuIDE5LCAyMDIwIGF0IDAzOjQ4OjQ5UE0gLTA0MDAsIEZlbGl4IEt1ZWhsaW5nIHdy
b3RlOgo+PiBBbSAyMDIwLTA2LTE5IHVtIDI6MTggcC5tLiBzY2hyaWViIEphc29uIEd1bnRob3Jw
ZToKPj4+IE9uIEZyaSwgSnVuIDE5LCAyMDIwIGF0IDAyOjA5OjM1UE0gLTA0MDAsIEplcm9tZSBH
bGlzc2Ugd3JvdGU6Cj4+Pj4gT24gRnJpLCBKdW4gMTksIDIwMjAgYXQgMDI6MjM6MDhQTSAtMDMw
MCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+Pj4+PiBPbiBGcmksIEp1biAxOSwgMjAyMCBhdCAw
NjoxOTo0MVBNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+Pj4+Pgo+Pj4+Pj4gVGhlIG1h
ZG5lc3MgaXMgb25seSB0aGF0IGRldmljZSBCJ3MgbW11IG5vdGlmaWVyIG1pZ2h0IG5lZWQgdG8g
d2FpdAo+Pj4+Pj4gZm9yIGZlbmNlX0Igc28gdGhhdCB0aGUgZG1hIG9wZXJhdGlvbiBmaW5pc2hl
cy4gV2hpY2ggaW4gdHVybiBoYXMgdG8KPj4+Pj4+IHdhaXQgZm9yIGRldmljZSBBIHRvIGZpbmlz
aCBmaXJzdC4KPj4+Pj4gU28sIGl0IHNvdW5kLCBmdW5kYW1lbnRhbGx5IHlvdSd2ZSBnb3QgdGhp
cyBncmFwaCBvZiBvcGVyYXRpb25zIGFjcm9zcwo+Pj4+PiBhbiB1bmtub3duIHNldCBvZiBkcml2
ZXJzIGFuZCB0aGUga2VybmVsIGNhbm5vdCBpbnNlcnQgaXRzZWxmIGluCj4+Pj4+IGRtYV9mZW5j
ZSBoYW5kIG9mZnMgdG8gcmUtdmFsaWRhdGUgYW55IG9mIHRoZSBidWZmZXJzIGludm9sdmVkPwo+
Pj4+PiBCdWZmZXJzIHdoaWNoIGJ5IGRlZmluaXRpb24gY2Fubm90IGJlIHRvdWNoZWQgYnkgdGhl
IGhhcmR3YXJlIHlldC4KPj4+Pj4KPj4+Pj4gVGhhdCByZWFsbHkgaXMgYSBwcmV0dHkgaG9ycmli
bGUgcGxhY2UgdG8gZW5kIHVwLi4KPj4+Pj4KPj4+Pj4gUGlubmluZyByZWFsbHkgaXMgcmlnaHQg
YW5zd2VyIGZvciB0aGlzIGtpbmQgb2Ygd29yayBmbG93LiBJIHRoaW5rCj4+Pj4+IGNvbnZlcnRp
bmcgcGlubmluZyB0byBub3RpZmVycyBzaG91bGQgbm90IGJlIGRvbmUgdW5sZXNzIG5vdGlmaWVy
Cj4+Pj4+IGludmFsaWRhdGlvbiBpcyByZWxhdGl2ZWx5IGJvdW5kZWQuIAo+Pj4+Pgo+Pj4+PiBJ
IGtub3cgcGVvcGxlIGxpa2Ugbm90aWZpZXJzIGJlY2F1c2UgdGhleSBnaXZlIGEgYml0IG5pY2Vy
IHBlcmZvcm1hbmNlCj4+Pj4+IGluIHNvbWUgaGFwcHkgY2FzZXMsIGJ1dCB0aGlzIGNyaXBwbGVz
IGFsbCB0aGUgYmFkIGNhc2VzLi4KPj4+Pj4KPj4+Pj4gSWYgcGlubmluZyBkb2Vzbid0IHdvcmsg
Zm9yIHNvbWUgcmVhc29uIG1heWJlIHdlIHNob3VsZCBhZGRyZXNzIHRoYXQ/Cj4+Pj4gTm90ZSB0
aGF0IHRoZSBkbWEgZmVuY2UgaXMgb25seSB0cnVlIGZvciB1c2VyIHB0ciBidWZmZXIgd2hpY2gg
cHJlZGF0ZQo+Pj4+IGFueSBITU0gd29yayBhbmQgdGh1cyB3ZXJlIHVzaW5nIG1tdSBub3RpZmll
ciBhbHJlYWR5LiBZb3UgbmVlZCB0aGUKPj4+PiBtbXUgbm90aWZpZXIgdGhlcmUgYmVjYXVzZSBv
ZiBmb3JrIGFuZCBvdGhlciBjb3JuZXIgY2FzZXMuCj4+PiBJIHdvbmRlciBpZiB3ZSBzaG91bGQg
dHJ5IHRvIGZpeCB0aGUgZm9yayBjYXNlIG1vcmUgZGlyZWN0bHkgLSBSRE1BCj4+PiBoYXMgdGhp
cyBzYW1lIHByb2JsZW0gYW5kIGFkZGVkIE1BRFZfRE9OVEZPUksgYSBsb25nIHRpbWUgYWdvIGFz
IGEKPj4+IGhhY2t5IHdheSB0byBkZWFsIHdpdGggaXQuCj4+Pgo+Pj4gU29tZSBjcmF6eSBwYWdl
IHBpbiB0aGF0IHJlc29sdmVkIENPVyBpbiBhIHdheSB0aGF0IGFsd2F5cyBrZXB0IHRoZQo+Pj4g
cGh5c2ljYWwgbWVtb3J5IHdpdGggdGhlIG1tIHRoYXQgaW5pdGlhdGVkIHRoZSBwaW4/Cj4+Pgo+
Pj4gKGlzbid0IHRoaXMgYnJva2VuIGZvciBPX0RJUkVDVCBhcyB3ZWxsIGFueWhvdz8pCj4+Pgo+
Pj4gSG93IGRvZXMgbW11X25vdGlmaWVycyBoZWxwIHRoZSBmb3JrIGNhc2UgYW55aG93PyBCbG9j
ayBmb3JrIGZyb20KPj4+IHByb2dyZXNzaW5nPwo+PiBIb3cgbXVjaCB0aGUgbW11X25vdGlmaWVy
IGJsb2NrcyBmb3JrIHByb2dyZXNzIGRlcGVuZHMsIG9uIHF1aWNrbHkgd2UKPj4gY2FuIHByZWVt
cHQgR1BVIGpvYnMgYWNjZXNzaW5nIGFmZmVjdGVkIG1lbW9yeS4gSWYgd2UgZG9uJ3QgaGF2ZQo+
PiBmaW5lLWdyYWluZWQgcHJlZW1wdGlvbiBjYXBhYmlsaXR5IChncmFwaGljcyksIHRoZSBiZXN0
IHdlIGNhbiBkbyBpcwo+PiB3YWl0IGZvciB0aGUgR1BVIGpvYnMgdG8gY29tcGxldGUuIFdlIGNh
biBhbHNvIGRlbGF5IHN1Ym1pc3Npb24gb2YgbmV3Cj4+IEdQVSBqb2JzIHRvIHRoZSBzYW1lIG1l
bW9yeSB1bnRpbCB0aGUgTU1VIG5vdGlmaWVyIGlzIGRvbmUuIEZ1dHVyZSBqb2JzCj4+IHdvdWxk
IHVzZSB0aGUgbmV3IHBhZ2UgYWRkcmVzc2VzLgo+Pgo+PiBXaXRoIGZpbmUtZ3JhaW5lZCBwcmVl
bXB0aW9uIChST0NtIGNvbXB1dGUpLCB3ZSBjYW4gcHJlZW1wdCBHUFUgd29yayBvbgo+PiB0aGUg
YWZmZWN0ZWQgYWRkZXJzIHNwYWNlIHRvIG1pbmltaXplIHRoZSBkZWxheSBzZWVuIGJ5IGZvcmsu
Cj4+Cj4+IFdpdGggcmVjb3ZlcmFibGUgZGV2aWNlIHBhZ2UgZmF1bHRzLCB3ZSBjYW4gaW52YWxp
ZGF0ZSBHUFUgcGFnZSB0YWJsZQo+PiBlbnRyaWVzLCBzbyBkZXZpY2UgYWNjZXNzIHRvIHRoZSBh
ZmZlY3RlZCBwYWdlcyBzdG9wcyBpbW1lZGlhdGVseS4KPj4KPj4gSW4gYWxsIGNhc2VzLCB0aGUg
ZW5kIHJlc3VsdCBpcywgdGhhdCB0aGUgZGV2aWNlIHBhZ2UgdGFibGUgZ2V0cyB1cGRhdGVkCj4+
IHdpdGggdGhlIGFkZHJlc3Mgb2YgdGhlIGNvcGllZCBwYWdlcyBiZWZvcmUgdGhlIEdQVSBhY2Nl
c3NlcyB0aGUgQ09XCj4+IG1lbW9yeSBhZ2Fpbi5XaXRob3V0IHRoZSBNTVUgbm90aWZpZXIsIHdl
J2QgZW5kIHVwIHdpdGggdGhlIEdQVQo+PiBjb3JydXB0aW5nIG1lbW9yeSBvZiB0aGUgb3RoZXIg
cHJvY2Vzcy4KPiBUaGUgbW9kZWwgaGVyZSBpbiBmb3JrIGhhcyBiZWVuIHdyb25nIGZvciBhIGxv
bmcgdGltZSwgYW5kIEkgZG8gd29uZGVyCj4gaG93IE9fRElSRUNUIG1hbmFnZXMgdG8gbm90IGJl
IGJyb2tlbiB0b28uLiBJIGd1ZXNzIHRoZSB0aW1lIHdpbmRvd3MKPiB0aGVyZSBhcmUgdG9vIHNt
YWxsIHRvIGdldCB1bmx1Y2t5Lgo+Cj4gSWYgeW91IGhhdmUgYSB3cml0ZSBwaW4gb24gYSBwYWdl
IHRoZW4gaXQgc2hvdWxkIG5vdCBiZSBDT1cnZCBpbnRvIHRoZQo+IGZvcmsnZCBwcm9jZXNzIGJ1
dCBjb3BpZWQgd2l0aCB0aGUgb3JpZ2luYXRpbmcgcGFnZSByZW1haW5pbmcgd2l0aCB0aGUKPiBv
cmlnaW5hbCBtbS4gCj4KPiBJIHdvbmRlciBpZiB0aGVyZSBpcyBzb21lIGVhc3kgd2F5IHRvIGFj
aGl2ZSB0aGF0IC0gaWYgdGhhdCBpcyB0aGUKPiBtYWluIHJlYXNvbiB0byB1c2Ugbm90aWZpZXJz
IHRoZW4gaXQgd291bGQgYmUgYSBiZXR0ZXIgc29sdXRpb24uCgpPdGhlciB0aGFuIHRoZSBhcHBs
aWNhdGlvbiBjaGFuZ2luZyBpdHMgb3duIHZpcnR1YWwgYWRkcmVzcyBtYXBwaW5ncwoobXByb3Rl
Y3QsIG11bm1hcCwgZXRjLiksIHRyaWdnZXJpbmcgTU1VIG5vdGlmaWVycywgd2UgYWxzbyBnZXQg
TU1VCm5vdGlmaWVycyBmcm9tIFRIUCB3b3JrZXIgdGhyZWFkcywgYW5kIE5VTUEgYmFsYW5jaW5n
LgoKV2hlbiB3ZSBzdGFydCBkb2luZyBtaWdyYXRpb24gdG8gREVWSUNFX1BSSVZBVEUgbWVtb3J5
IHdpdGggSE1NLCB3ZSBhbHNvCmdldCBNTVUgbm90aWZpZXJzIGR1cmluZyB0aG9zZSBkcml2ZXIt
aW5pdGlhdGVkIG1pZ3JhdGlvbnMuCgpSZWdhcmRzLArCoCBGZWxpeAoKCj4KPiBKYXNvbgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
