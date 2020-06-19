Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9653201B97
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 21:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283176E94B;
	Fri, 19 Jun 2020 19:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39C96E969;
 Fri, 19 Jun 2020 19:48:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjqRvSqGbXssnrzhqaOQDhYCY+axUg8FIuBlcPhVcb+BioKprfeBQtnnawr6bhMG4ISvmM4GyjOX6bXg6cUVPPnySMhkdUZ+IDdG2KXOH4vOrhr6gvVVE2GIMvqSYy5yjpG83HLLx+ONsvtjTRePqtHd9NgQmF2RNq4xKsfFfi2d+E7/VowCsZlbFljnXEKiP6u1CjufCN0EAZrsK0gLv/29OR2Q5wtTQm3HAk13wwdqio69KZapJSzfoOW//jsX6DddkGoF3u2n1xHXvw8gi+/8vlmKXlEep7rbJ+Kedl1gQq9l+1R4kUyraQgvTcivy0Z1CwR/SWpuXvWBfRjZtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hY2s5Ok5u8FVj8sjo2EsGqQ5oy1A54oDL4muzRtBbzU=;
 b=aT5SQMqmrviLIslpS5xLjP+X+GGPrqCC05m8oRsW0orwbHMmv2fFPtPIlgwA0dfN9mSqGHriosZva/uRSeb8UTq6I4fKsVagsjOvlvgU69gNIJN+F8UCTRT3Za92iCJazGjWAI1aZ+p7dOVxDp+Dhz8AwAdStAzFHqLMQVVn9vxQ2vobU7VQ69/8xhYrAczJiP3idPSjccfQNBWm+YzJRIj2QR+kojB/4lVti7TAZdHyIwwczDrpGPXrHtsSmEeKRYFabaFmA5wMvy4npQICTK7eXY4xrik4z+ltAJftOuPALMyInxu/44lYgWNuqyopPrF175s8gVQqzChWUCLIeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hY2s5Ok5u8FVj8sjo2EsGqQ5oy1A54oDL4muzRtBbzU=;
 b=P4zvyX3CeWE/8rrxv8TjIoY83At7/msQJE08cKhbgHIhaJQD0cxbCYOPCTjm0ad+3c0puk6462+0Ocn6qiUyDViXAuFiCvfFzqB0Dz8Av9FFVf6GBjLy3hIWpmYel0koc9ZjQxfK4WGtde79fTelL8OEJsdwkvZDgQdaNmGPRqg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 by SN1PR12MB2366.namprd12.prod.outlook.com (2603:10b6:802:25::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Fri, 19 Jun
 2020 19:48:51 +0000
Received: from SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::18d:97b:661f:9314]) by SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::18d:97b:661f:9314%7]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 19:48:51 +0000
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep annotations
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>
References: <20200617152835.GF6578@ziepe.ca>
 <20200618150051.GS20149@phenom.ffwll.local> <20200618172338.GM6578@ziepe.ca>
 <CAKMK7uEbqTu4q-amkLXyd1i8KNtLaoO2ZFoGqYiG6D0m0FKpOg@mail.gmail.com>
 <20200619113934.GN6578@ziepe.ca>
 <CAKMK7uE-kWA==Cko5uenMrcnopEjq42HxoDTDywzBAbHqsN13g@mail.gmail.com>
 <20200619151551.GP6578@ziepe.ca>
 <CAKMK7uEvkshAM6KUYZu8_OCpF4+1Y_SM7cQ9nJWpagfke8s8LA@mail.gmail.com>
 <20200619172308.GQ6578@ziepe.ca> <20200619180935.GA10009@redhat.com>
 <20200619181849.GR6578@ziepe.ca>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <56008d64-772d-5757-6136-f20591ef71d2@amd.com>
Date: Fri, 19 Jun 2020 15:48:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200619181849.GR6578@ziepe.ca>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::41) To SN1PR12MB2414.namprd12.prod.outlook.com
 (2603:10b6:802:2e::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.63.128) by
 YTOPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::41) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Fri, 19 Jun 2020 19:48:50 +0000
X-Originating-IP: [142.116.63.128]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6b31f8f3-21d1-47e8-e8b4-08d81489ca69
X-MS-TrafficTypeDiagnostic: SN1PR12MB2366:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB23666F033A1C836299F9904592980@SN1PR12MB2366.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0439571D1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BFaPyrdjkcHTiVW5mxRZ1bAm2sGkOtkPfbaFXp49135XROOYLmzA96AOnxTN9GNzwWG3GCh5Wu8l914CpTgMTuPhjoOGC0uYCWGJV4WvseEQgZjX+ecl5kXBuSpnMd6QOU7XpZFUZCI0Jg+mAp0LBUB/edxPaMhCwpFHM3Ay5ZZYfZGVwosQi5sOevHwaXIVSpJX344TK5JuWlw2o3Ou2YwoD/uIq6bA1ie3tic51ipxs5n9HKlpz3PSS0C7lvass9a9fV1h1rePUOnIu3Gf1tbu//8o7OyTPvkpqAtfR2rpXnSFEQjAtgpsfunLmmVIZInaeTvT3Lc6xFYWT2W5d1k0c+lmXHaVLhzTnEuuGCafFrH9L9MVp0cXKanNKCPMRXMCcXbzxN+yQKaRswJUjSszL6LwB5c8uTD2+poPWZo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2414.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(83380400001)(66476007)(66556008)(966005)(66946007)(7416002)(16526019)(2616005)(4326008)(36756003)(110136005)(31696002)(8936002)(956004)(6486002)(86362001)(2906002)(54906003)(478600001)(8676002)(316002)(186003)(16576012)(26005)(31686004)(52116002)(5660300002)(44832011)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: pr3VWPwyk0cvydYqAZZkmQvEYteaGvklT7Gh18MyvmWsg8Zcw8I4d6CWtr8wh7IXTVVV1ZJg+pBGZaAarHjbdA+yu6r0boX4CaNJDnx0B5JOjdPO6Pp8NsBJb8UwV3Xr5hc83zTGXljN2VtsZKACVSUS8M5fepya1uRZEAnFNr29c6FTiZisq8lKbQ4c2Jd/P3Yk6FoV47lS+yoDrtPxPl/+bqs7svDLxQm/uJXpUzWzFNEMQzTiUO8pYEoNqv9D5fS4upsd7Y+ibQgAYdrQOW/mSpj+IzWGbmLEFF2yDWF9X0a0NWWQeDGev2HAEEM6J5/pekIinRD2w4XceS6ZBrrdYChruDLZWFamr7q6tQR97kIM0d95RYjaO35576F5xvaLrcpYa0nGZiXYwm1UeD0Fx2ww4I6wMjgP/rdgCB1fAsz1Hn73Vpq8MyMAZPdHrppKxF4a5sAjhYsGCKu/pR68zoas5vs29ryIbM9LR3qAo9WCN2XGpKNnmKnyeyat
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b31f8f3-21d1-47e8-e8b4-08d81489ca69
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2020 19:48:51.5066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EIMlq/N4DeJBMh4B2sfOovlW4tV4ECy4iXIEbqcQZIBq+Abw0vKvoE6uCcsQ6qB0GrjMDD+gLzSqBIugPf1KUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2366
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

QW0gMjAyMC0wNi0xOSB1bSAyOjE4IHAubS4gc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4gT24g
RnJpLCBKdW4gMTksIDIwMjAgYXQgMDI6MDk6MzVQTSAtMDQwMCwgSmVyb21lIEdsaXNzZSB3cm90
ZToKPj4gT24gRnJpLCBKdW4gMTksIDIwMjAgYXQgMDI6MjM6MDhQTSAtMDMwMCwgSmFzb24gR3Vu
dGhvcnBlIHdyb3RlOgo+Pj4gT24gRnJpLCBKdW4gMTksIDIwMjAgYXQgMDY6MTk6NDFQTSArMDIw
MCwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4+Cj4+Pj4gVGhlIG1hZG5lc3MgaXMgb25seSB0aGF0
IGRldmljZSBCJ3MgbW11IG5vdGlmaWVyIG1pZ2h0IG5lZWQgdG8gd2FpdAo+Pj4+IGZvciBmZW5j
ZV9CIHNvIHRoYXQgdGhlIGRtYSBvcGVyYXRpb24gZmluaXNoZXMuIFdoaWNoIGluIHR1cm4gaGFz
IHRvCj4+Pj4gd2FpdCBmb3IgZGV2aWNlIEEgdG8gZmluaXNoIGZpcnN0Lgo+Pj4gU28sIGl0IHNv
dW5kLCBmdW5kYW1lbnRhbGx5IHlvdSd2ZSBnb3QgdGhpcyBncmFwaCBvZiBvcGVyYXRpb25zIGFj
cm9zcwo+Pj4gYW4gdW5rbm93biBzZXQgb2YgZHJpdmVycyBhbmQgdGhlIGtlcm5lbCBjYW5ub3Qg
aW5zZXJ0IGl0c2VsZiBpbgo+Pj4gZG1hX2ZlbmNlIGhhbmQgb2ZmcyB0byByZS12YWxpZGF0ZSBh
bnkgb2YgdGhlIGJ1ZmZlcnMgaW52b2x2ZWQ/Cj4+PiBCdWZmZXJzIHdoaWNoIGJ5IGRlZmluaXRp
b24gY2Fubm90IGJlIHRvdWNoZWQgYnkgdGhlIGhhcmR3YXJlIHlldC4KPj4+Cj4+PiBUaGF0IHJl
YWxseSBpcyBhIHByZXR0eSBob3JyaWJsZSBwbGFjZSB0byBlbmQgdXAuLgo+Pj4KPj4+IFBpbm5p
bmcgcmVhbGx5IGlzIHJpZ2h0IGFuc3dlciBmb3IgdGhpcyBraW5kIG9mIHdvcmsgZmxvdy4gSSB0
aGluawo+Pj4gY29udmVydGluZyBwaW5uaW5nIHRvIG5vdGlmZXJzIHNob3VsZCBub3QgYmUgZG9u
ZSB1bmxlc3Mgbm90aWZpZXIKPj4+IGludmFsaWRhdGlvbiBpcyByZWxhdGl2ZWx5IGJvdW5kZWQu
IAo+Pj4KPj4+IEkga25vdyBwZW9wbGUgbGlrZSBub3RpZmllcnMgYmVjYXVzZSB0aGV5IGdpdmUg
YSBiaXQgbmljZXIgcGVyZm9ybWFuY2UKPj4+IGluIHNvbWUgaGFwcHkgY2FzZXMsIGJ1dCB0aGlz
IGNyaXBwbGVzIGFsbCB0aGUgYmFkIGNhc2VzLi4KPj4+Cj4+PiBJZiBwaW5uaW5nIGRvZXNuJ3Qg
d29yayBmb3Igc29tZSByZWFzb24gbWF5YmUgd2Ugc2hvdWxkIGFkZHJlc3MgdGhhdD8KPj4gTm90
ZSB0aGF0IHRoZSBkbWEgZmVuY2UgaXMgb25seSB0cnVlIGZvciB1c2VyIHB0ciBidWZmZXIgd2hp
Y2ggcHJlZGF0ZQo+PiBhbnkgSE1NIHdvcmsgYW5kIHRodXMgd2VyZSB1c2luZyBtbXUgbm90aWZp
ZXIgYWxyZWFkeS4gWW91IG5lZWQgdGhlCj4+IG1tdSBub3RpZmllciB0aGVyZSBiZWNhdXNlIG9m
IGZvcmsgYW5kIG90aGVyIGNvcm5lciBjYXNlcy4KPiBJIHdvbmRlciBpZiB3ZSBzaG91bGQgdHJ5
IHRvIGZpeCB0aGUgZm9yayBjYXNlIG1vcmUgZGlyZWN0bHkgLSBSRE1BCj4gaGFzIHRoaXMgc2Ft
ZSBwcm9ibGVtIGFuZCBhZGRlZCBNQURWX0RPTlRGT1JLIGEgbG9uZyB0aW1lIGFnbyBhcyBhCj4g
aGFja3kgd2F5IHRvIGRlYWwgd2l0aCBpdC4KPgo+IFNvbWUgY3JhenkgcGFnZSBwaW4gdGhhdCBy
ZXNvbHZlZCBDT1cgaW4gYSB3YXkgdGhhdCBhbHdheXMga2VwdCB0aGUKPiBwaHlzaWNhbCBtZW1v
cnkgd2l0aCB0aGUgbW0gdGhhdCBpbml0aWF0ZWQgdGhlIHBpbj8KPgo+IChpc24ndCB0aGlzIGJy
b2tlbiBmb3IgT19ESVJFQ1QgYXMgd2VsbCBhbnlob3c/KQo+Cj4gSG93IGRvZXMgbW11X25vdGlm
aWVycyBoZWxwIHRoZSBmb3JrIGNhc2UgYW55aG93PyBCbG9jayBmb3JrIGZyb20KPiBwcm9ncmVz
c2luZz8KCkhvdyBtdWNoIHRoZSBtbXVfbm90aWZpZXIgYmxvY2tzIGZvcmsgcHJvZ3Jlc3MgZGVw
ZW5kcywgb24gcXVpY2tseSB3ZQpjYW4gcHJlZW1wdCBHUFUgam9icyBhY2Nlc3NpbmcgYWZmZWN0
ZWQgbWVtb3J5LiBJZiB3ZSBkb24ndCBoYXZlCmZpbmUtZ3JhaW5lZCBwcmVlbXB0aW9uIGNhcGFi
aWxpdHkgKGdyYXBoaWNzKSwgdGhlIGJlc3Qgd2UgY2FuIGRvIGlzCndhaXQgZm9yIHRoZSBHUFUg
am9icyB0byBjb21wbGV0ZS4gV2UgY2FuIGFsc28gZGVsYXkgc3VibWlzc2lvbiBvZiBuZXcKR1BV
IGpvYnMgdG8gdGhlIHNhbWUgbWVtb3J5IHVudGlsIHRoZSBNTVUgbm90aWZpZXIgaXMgZG9uZS4g
RnV0dXJlIGpvYnMKd291bGQgdXNlIHRoZSBuZXcgcGFnZSBhZGRyZXNzZXMuCgpXaXRoIGZpbmUt
Z3JhaW5lZCBwcmVlbXB0aW9uIChST0NtIGNvbXB1dGUpLCB3ZSBjYW4gcHJlZW1wdCBHUFUgd29y
ayBvbgp0aGUgYWZmZWN0ZWQgYWRkZXJzIHNwYWNlIHRvIG1pbmltaXplIHRoZSBkZWxheSBzZWVu
IGJ5IGZvcmsuCgpXaXRoIHJlY292ZXJhYmxlIGRldmljZSBwYWdlIGZhdWx0cywgd2UgY2FuIGlu
dmFsaWRhdGUgR1BVIHBhZ2UgdGFibGUKZW50cmllcywgc28gZGV2aWNlIGFjY2VzcyB0byB0aGUg
YWZmZWN0ZWQgcGFnZXMgc3RvcHMgaW1tZWRpYXRlbHkuCgpJbiBhbGwgY2FzZXMsIHRoZSBlbmQg
cmVzdWx0IGlzLCB0aGF0IHRoZSBkZXZpY2UgcGFnZSB0YWJsZSBnZXRzIHVwZGF0ZWQKd2l0aCB0
aGUgYWRkcmVzcyBvZiB0aGUgY29waWVkIHBhZ2VzIGJlZm9yZSB0aGUgR1BVIGFjY2Vzc2VzIHRo
ZSBDT1cKbWVtb3J5IGFnYWluLldpdGhvdXQgdGhlIE1NVSBub3RpZmllciwgd2UnZCBlbmQgdXAg
d2l0aCB0aGUgR1BVCmNvcnJ1cHRpbmcgbWVtb3J5IG9mIHRoZSBvdGhlciBwcm9jZXNzLgoKUmVn
YXJkcywKwqAgRmVsaXgKCgo+Cj4+IEkgcHJvYmFibHkgbmVlZCB0byB3YXJuIEFNRCBmb2xrcyBh
Z2FpbiB0aGF0IHVzaW5nIEhNTSBtZWFucyB0aGF0IHlvdQo+PiBtdXN0IGJlIGFibGUgdG8gdXBk
YXRlIHRoZSBHUFUgcGFnZSB0YWJsZSBhc3luY2hyb25vdXNseSB3aXRob3V0Cj4+IGZlbmNlIHdh
aXQuCj4gSXQgaXMga2luZCBvZiB1bnJlbGF0ZWQgdG8gSE1NLCBpdCBqdXN0IHNob3VsZG4ndCBi
ZSB1c2luZyBtbXUKPiBub3RpZmllcnMgdG8gcmVwbGFjZSBwYWdlIHBpbm5pbmcuLgo+Cj4+IFRo
ZSBpc3N1ZSBmb3IgQU1EIGlzIHRoYXQgdGhleSBhbHJlYWR5IHVwZGF0ZSB0aGVpciBHUFUgcGFn
ZSB0YWJsZQo+PiB1c2luZyBETUEgZW5naW5lLiBJIGJlbGlldmUgdGhpcyBpcyBzdGlsbCBkb2Fi
bGUgaWYgdGhleSB1c2UgYQo+PiBrZXJuZWwgb25seSBETUEgZW5naW5lIGNvbnRleHQsIHdoZXJl
IG9ubHkga2VybmVsIGNhbiBxdWV1ZSB1cCBqb2JzCj4+IHNvIHRoYXQgeW91IGRvIG5vdCBuZWVk
IHRvIHdhaXQgZm9yIHVucmVsYXRlZCB0aGluZ3MgYW5kIHlvdSBjYW4KPj4gcHJpb3JpdGl6ZSBH
UFUgcGFnZSB0YWJsZSB1cGRhdGUgd2hpY2ggc2hvdWxkIHRyYW5zbGF0ZSBpbiBmYXN0IEdQVQo+
PiBwYWdlIHRhYmxlIHVwZGF0ZSB3aXRob3V0IERNQSBmZW5jZS4KPiBNYWtlIHNlbnNlCj4KPiBJ
J20gbm90IHN1cmUgSSBzYXcgdGhpcyBpbiB0aGUgQU1EIGhtbSBzdHVmZiAtIGl0IHdvdWxkIGJl
IGdvb2QgaWYKPiBzb21lb25lIHdvdWxkIGxvb2sgYXQgdGhhdC4gRXZlcnkgdGltZSBJIGRvIGl0
IGxvb2tzIGxpa2UgdGhlIGxvY2tpbmcKPiBpcyB3cm9uZy4KPgo+IEphc29uCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcg
bGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
