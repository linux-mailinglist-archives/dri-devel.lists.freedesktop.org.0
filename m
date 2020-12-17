Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 861672DDA89
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 22:06:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950EF8991A;
	Thu, 17 Dec 2020 21:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAD9898F0;
 Thu, 17 Dec 2020 21:06:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZvz0uarY+c1gRBwdiWKbC/06ytYf7sYITw4pk/Fi2EWOZwoDqTs0uK2bBdvxvNPh3FDHZY/bz31d/cDBv0/L2KJofu6C9FjogMPBdzeIAjQc09Nc9bHDjhsnhf60J99LGckune+dV/ce6+5qkqT2Wz1CSV039fl31cV7YxnTYXXCtQWk/LyQe3ta/CRefVIJcIaoLyDmAGpmqfwciUuOe8uFsuopvVjLBSgcjpdukPRE9jj5JR8tLy+jZwMJNLt/dNgnvRPKT0/dGJPSJSS0w9PGpxOkjZSWT3Axz9Ld9Ab8uaOMtK5WE1DnvVevItQ3BtSAm6ZEh40ojmb8u4ZMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iksQAwb1Ap5pMchPNWAqlE4FA1EMMMu08RHUN2a+hQ=;
 b=F3uYHQ4kT0Pg5xx5is1LvbYY8RW7tLxyZbCe+Xm16ybTckSDFObyCJbVZxRuHPzK/z3E3Gic60gAhIbrl3iAw59JUJWi3M4gwZtbQu2RM6/sMuBGQgjeDLruEc7NSLanZAtObtsho+YtTHAzaBLAFzM1iK4j1ISgABtzLGAJJz5Jsawwk0FCz0sq1Mx6scIu4I1+QI95amdNb5N4Es8Mqnv44IDcgU3GXwuJe74nL/xE+Tr3XUuORoh3res5X9y3YCDMcfOxmvLAR/nLNRw1wI78kACjEkkcx14Z6qZwW+Qpb9x+Rj+5AyfHdNmoA3Ug6HddwEJP31EGxtLeLJsqBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iksQAwb1Ap5pMchPNWAqlE4FA1EMMMu08RHUN2a+hQ=;
 b=vFYxhe7sIkt75s9dpmQAId1GiQUGnVzXK1WfDPPy4qw+egX+LtfSVbeta3ZKJaxLcfwJNzTFBsLgQ6LO6B/88voKU89lmRv9CpZEMKjahTBzn55Olu7Qr2y2Vsz+IUQ1mJK09vN3qzQBbT0UnUu5kLDb0ljpT+jBFm8YliF9bYQ=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4576.namprd12.prod.outlook.com (2603:10b6:806:93::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Thu, 17 Dec
 2020 21:06:42 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::6d32:940b:f630:b37d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::6d32:940b:f630:b37d%4]) with mapi id 15.20.3654.025; Thu, 17 Dec 2020
 21:06:42 +0000
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
To: Daniel Vetter <daniel@ffwll.ch>
References: <041210e5-e237-b72e-dcbc-17027d057c55@gmail.com>
 <1fa4dd77-deec-aa7b-7499-0537e9a01919@amd.com>
 <a818be68-518c-754d-f63b-3754ce882fdc@gmail.com>
 <CAKMK7uEx631E1NB1=NYh7V2_+X=pK0WhA_sBwpxCGOhFaYw9wQ@mail.gmail.com>
 <e389b7d7-196c-ee03-ff94-ffd110c1013f@amd.com>
 <77cdb5bf-a418-bafd-2360-163e428c7394@amd.com>
 <CAKMK7uEgY4gYqowUZP0FZYHB7FNPCqApWojmSnuwhQ9WnY6hLA@mail.gmail.com>
 <8083b9f8-ee43-504f-0690-7add68472ca9@amd.com>
 <CAKMK7uGQtOgHxXQ_AK7f0unrwOnLQm3nb-VUJ_pW6vonRazu0Q@mail.gmail.com>
 <74140041-d838-87ce-5408-806d860cf9b3@amd.com>
 <X9tIrE0Ak68HJ391@phenom.ffwll.local>
 <864df6cc-33f4-6624-6756-5a171ad7ed4f@amd.com>
 <e1549b76-eed4-fa91-88c6-083e0dfe5595@amd.com>
 <cf18edc7-e1a6-7a6e-3944-63f3463577b9@amd.com>
 <CAKMK7uF5NRARdA1BrsYSBgYw-ioTc_P54LXLCi4LQ21S3NZc1Q@mail.gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <19ec7cb6-e1aa-e4ac-9cb1-a08d60c07af4@amd.com>
Date: Thu, 17 Dec 2020 16:06:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <CAKMK7uF5NRARdA1BrsYSBgYw-ioTc_P54LXLCi4LQ21S3NZc1Q@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:d8d8:8cb4:36f0:9435]
X-ClientProxiedBy: YT1PR01CA0113.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::22) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:d8d8:8cb4:36f0:9435]
 (2607:fea8:3edf:49b0:d8d8:8cb4:36f0:9435) by
 YT1PR01CA0113.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 17 Dec 2020 21:06:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5f0c9c15-7b33-4204-6574-08d8a2cfa745
X-MS-TrafficTypeDiagnostic: SA0PR12MB4576:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB45767A02EA558E8BDBE9B19CEAC40@SA0PR12MB4576.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W+8W6w1/soDviB+UEa7k3AydizZk493hbmZWayxoAdgboZOfVyJyfWcXqch8nvzhf1L0akHT2MyxO7e2SsDhsyOhbPKhDJnh/hgX209N4AP8DCgprBHs2Mu5zDW4DMoEyW5ldwzRlEAQZd4ypqM+scNYmvxyRxV4YwlwAVrmWp8e7W/ObN7jNo/02FzGuEx6V2AG86bG9se+SX7m9KIA7bCy6feHPwc0MSlevah6pcm5a550rJpZ17J0uGiTjBwPmeE9+wMAldA2dmrDrbnaUrHZP8/TliJ68DOOW3eZcpjNg/QJMUgxQH6a3wtMfFgFiHUSV8L4l66eu6U8RKr4kAGZCze9PFlvi/FkDsXBSl7BGKlrI2x6vXEeYtMAaqoCBMXMXecGehJEmZg2IOANR5QIhP2OWXVj3OZk5ebC3E8T6boZPBptHZot3pReuVYkjEg5y829wuYbv7VRsA1S5rJ5Bej83icSYUSU3QhMF/E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(66574015)(966005)(2616005)(2906002)(316002)(66556008)(86362001)(5660300002)(16526019)(66476007)(8676002)(6916009)(186003)(45080400002)(54906003)(53546011)(66946007)(478600001)(4326008)(36756003)(31696002)(31686004)(6486002)(52116002)(83380400001)(8936002)(370214003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Qi8yejd4M3JoNzVKZkpqdmVQaERjb3BvU0lKQm05UTBqMXh0TkhWZEhKYWpT?=
 =?utf-8?B?eHBmQnpaejhzczB5dm9mcjR5ZDA5OGdXU2w2TlExaXF4NWw3T1NyKzc3aDRv?=
 =?utf-8?B?dVQ5L2NDRWVUelJMN1pFRU1IN2FkS3FYTTM3cEhibVlEVmt2Tzhka2pkOHJG?=
 =?utf-8?B?NzZCRG5jQUhMMTZvSklxYktUSlBPQnlJaWlYWExNV3BFckVndU5TU0l1Vy9o?=
 =?utf-8?B?NGVMZDVGS2pGUDduK2V6REJmd094cE9EN01JL2tZYS9WdU5qODh6blJiby9S?=
 =?utf-8?B?S3NmcFU2bzkveWpLRDA0SFVHYm9kVFRmRm9udGlTMGVhOVlXM2lNYlB0dVh0?=
 =?utf-8?B?VHp6bWgzUWRXdFliM3F0dXArL2U1K252Ly93d3JONU01YkN3eVc4NmN1bkdj?=
 =?utf-8?B?NWNHYVlZNzJ4WThpVDFIYWM1VEZoVVRXZThCZkt2RURPdnhYb1RhaHVuRXor?=
 =?utf-8?B?YXNud1F0SmpnL2dWZllndzVwR3h2VDBIYjd3cDF6V0NOWVFYd2YwRHZFUFhr?=
 =?utf-8?B?TnRlelkvcEVRbWxVYnBIZlpLUWIzaHVFbUk5Qm9ENXFraHdHQjJwbVFSZE1C?=
 =?utf-8?B?S1BUUGhLZjduVHhhUTE3MVJUQXVncVlydE5lUytzRXBpaDBpUnhrMGpLZXAz?=
 =?utf-8?B?Q01RVXB1U0JtLzhtUDlTUUdnUE5FV0x6VG5Hd2VIN1VZVmZ2VVBWaXJTQ1lU?=
 =?utf-8?B?aEJNNTF1dzRhUXJuY21Fd3ZFUllnRCtLZDhkMGVmbStBS24rTG52MjlqZTRK?=
 =?utf-8?B?djBnOGlLcStlTjlqbExKNHdPTXhHdWVzZnNTNTQ3REo5dDZhZlhJeVhiOVFz?=
 =?utf-8?B?UzVPeU1ld3I5a0kxajBjNW1TWHpUVkJVN0xUcGE3dDg2bCtOVzZ5cTNxN0Fi?=
 =?utf-8?B?emF1SEdsWVRwV05qOThPK0Ixc2JHUlpqM3oxU0ljb29seFQySmgrYnRlYWxz?=
 =?utf-8?B?RVF2YnRleVBmNnQrMEF0YVpoSlR0L2FrVHc0MFU0QkNwWjdoWnliNW52OWhN?=
 =?utf-8?B?Z3VyVGs5eWZBVnQzRkVTOEZEeWI0aDQySm41bHl2aEd6Rys5K0UyOWFJeGpt?=
 =?utf-8?B?QXRSSFd0WlhqdFMzWVNtNXozMW9Vb29DUkgxWlduWnV5V3hLWEFQQkRKVGtD?=
 =?utf-8?B?QitKVnh4T1BRZ3d4L2lnUG1xR0ZwRSsyaUlaNUhDcjdQUXBoSERSLzVHOWFV?=
 =?utf-8?B?aDcxenZHMlZCTlJMRC9RQ1dLdVNHRmpuRE1QU3B6c3VMb0tETzVUTFBtbmoy?=
 =?utf-8?B?cW9LVEllZllSRnFHTjYzUDkwa004Q05VeUpSYkJmN25YRFRER0Q0TnduQ055?=
 =?utf-8?B?SjZ1T1QxcnU1dmZZOCtqZG40cE9kcVZIdERRRjQyRE52S2NiWEJKZDN3VzdJ?=
 =?utf-8?B?RnhDS1QySUZRVStxdnF2NW1tYXlKNWE1YmFOUndiaDE0SXFkdkdITlFRUnQr?=
 =?utf-8?Q?4OiLrPjT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 21:06:41.9838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f0c9c15-7b33-4204-6574-08d8a2cfa745
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IqSiT6cKAuS1YZl071uhZMRFXxaaeoEHIirrPMq3Gfj1mJ3L6KYlpJwYL5NaXAFKu598gATIP73fhjXMphCwtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4576
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
 Greg KH <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Qiang Yu <yuq825@gmail.com>,
 Alex Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEyLzE3LzIwIDM6NDggUE0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gVGh1LCBEZWMg
MTcsIDIwMjAgYXQgOTozOCBQTSBBbmRyZXkgR3JvZHpvdnNreQo+IDxBbmRyZXkuR3JvZHpvdnNr
eUBhbWQuY29tPiB3cm90ZToKPj4KPj4gT24gMTIvMTcvMjAgMzoxMCBQTSwgQ2hyaXN0aWFuIEvD
tm5pZyB3cm90ZToKPj4+IFtTTklQXQo+Pj4+Pj4gQnkgZWxpbWluYXRpbmcgc3VjaCB1c2Vycywg
YW5kIHJlcGxhY2luZyB0aGVtIHdpdGggbG9jYWwgbWFwcyB3aGljaAo+Pj4+Pj4+IGFyZSBzdHJp
Y3RseSBib3VuZCBpbiBob3cgbG9uZyB0aGV5IGNhbiBleGlzdCAoYW5kIGhlbmNlIHdlIGNhbgo+
Pj4+Pj4+IHNlcmlhbGl6ZSBhZ2FpbnN0IHRoZW0gZmluaXNoaW5nIGluIG91ciBob3R1bnBsdWcg
Y29kZSkuCj4+Pj4+PiBOb3Qgc3VyZSBJIHNlZSBob3cgc2VyaWFsaXppbmcgYWdhaW5zdCBCTyBt
YXAvdW5tYXAgaGVscHMgLSBvdXIgcHJvYmxlbSBhcwo+Pj4+Pj4geW91IGRlc2NyaWJlZCBpcyB0
aGF0IG9uY2UKPj4+Pj4+IGRldmljZSBpcyBleHRyYWN0ZWQgYW5kIHRoZW4gc29tZXRoaW5nIGVs
c2UgcXVpY2tseSB0YWtlcyBpdCdzIHBsYWNlIGluIHRoZQo+Pj4+Pj4gUENJIHRvcG9sb2d5Cj4+
Pj4+PiBhbmQgZ2V0cyBhc3NpZ25lZCBzYW1lIHBoeXNpY2FsIElPIHJhbmdlcywgdGhlbiBvdXIg
ZHJpdmVyIHdpbGwgc3RhcnQKPj4+Pj4+IGFjY2Vzc2luZyB0aGlzCj4+Pj4+PiBuZXcgZGV2aWNl
IGJlY2F1c2Ugb3VyICd6b21iaWUnIEJPcyBhcmUgc3RpbGwgcG9pbnRpbmcgdG8gdGhvc2UgcmFu
Z2VzLgo+Pj4+PiBVbnRpbCB5b3VyIGRyaXZlcidzIHJlbW92ZSBjYWxsYmFjayBpcyBmaW5pc2hl
ZCB0aGUgcmFuZ2VzIHN0YXkgcmVzZXJ2ZWQuCj4+Pj4KPj4+PiBUaGUgcmFuZ2VzIHN0YXkgcmVz
ZXJ2ZWQgdW50aWwgdW5tYXBwZWQgd2hpY2ggaGFwcGVucyBpbiBiby0+ZGVzdHJveQo+Pj4gSSdt
IG5vdCBzdXJlIG9mIHRoYXQuIFdoeSBkbyB5b3UgdGhpbmsgdGhhdD8KPj4KPj4gQmVjYXVzZSBv
ZiB0aGlzIHNlcXVlbmNlCj4+IHR0bV9ib19yZWxlYXNlLT5kZXN0cm95LT5hbWRncHVfYm9fZGVz
dHJveS0+YW1kZ3B1X2JvX2t1bm1hcC0+Li4uLT5pb3VubWFwCj4+IElzIHRoZXJlIGFub3RoZXIg
cGxhY2UgSSBhbSBtaXNzaW5nID8KPiBpb3VubWFwIGlzIGp1c3QgdGhlIG1hcHBpbmcsIGl0IGRv
ZXNuJ3QgcmVzZXJ2ZSBhbnl0aGluZyBpbiB0aGUgcmVzb3VyY2UgdHJlZS4KPgo+IEFuZCBJIGRv
bid0IHRoaW5rIHdlIHNob3VsZCBrZWVwIHJlc291cmNlcyByZXNlcnZlZCBwYXN0IHRoZSBwY2kK
PiByZW1vdmUgY2FsbGJhY2ssIGJlY2F1c2UgdGhhdCB3b3VsZCB1cHNldCB0aGUgcGNpIHN1YnN5
c3RlbSB0cnlpbmcgdG8KPiBhc3NpZ24gcmVzb3VyY2VzIHRvIGEgbmV3bHkgaG90cGx1Z2dlZCBw
Y2kgZGV2aWNlLgoKCkkgYXNzdW1lZCB3ZSBhcmUgdGFsa2luZyBhYm91dCBWQSByYW5nZXMgc3Rp
bGwgbWFwcGVkIGluIHRoZSBwYWdlIHRhYmxlLiBJIGp1c3QgCmFzc3VtZWQKdGhhdCBwYXJ0IG9m
IGlvcmVtYXAgaXMgYWxzbyByZXNlcnZhdGlvbiBvZiB0aGUgbWFwcGVkIHBoeXNpY2FsIHJhbmdl
cy4gSW4gZmFjdCwgCmlmIHdlCmRvIGNhbiBleHBsaWNpdGx5IHJlc2VydmUgdGhvc2UgcmFuZ2Vz
IChhcyB5b3UgbWVudGlvbiBoZXJlKSB0aGVuIHRvZ2V0aGVyIHdpdGggCnBvc3Rwb25pbmcKc3lz
dGVtIG1lbW9yeSBwYWdlcyBmcmVlaW5nL3JlbGVhc2luZyBiYWNrIHRvIHRoZSBwYWdlIHBvb2wg
dW50aWwgYWZ0ZXIgQk8gaXMgCnVubWFwcGVkCmZyb20gdGhlIGtlcm5lbCBhZGRyZXNzIHNwYWNl
IEkgYmVsaWV2ZSB0aGlzIGNvdWxkIHNvbHZlIHRoZSBpc3N1ZSBvZiBxdWljayBIVyAKcmVpbnNl
cnRpb24KYW5kIG1ha2UgYWxsIHRoZSBkcm1fZGV2X2VuZXIvZXhpdCBndWFyZGluZyBvYnNvbGV0
ZS4KCkFuZHJleQoKCj4gQWxzbyBmcm9tIGEgcXVpY2sgY2hlY2sgYW1kZ3B1IGRvZXMgbm90IHJl
c2VydmUgdGhlIHBjaSBiYXJzIGl0J3MKPiB1c2luZy4gU29tZWhvdyBtb3N0IGRybSBkcml2ZXJz
IGRvbid0IGRvIHRoYXQsIG5vdCBleGFjdGx5IHN1cmUgd2h5LAo+IG1heWJlIGF1dG8tZW51bWVy
YXRpb24gb2YgcmVzb3VyY2VzIGp1c3Qgd29ya3MgdG9vIGdvb2QgYW5kIHdlIGRvbid0Cj4gbmVl
ZCB0aGUgc2FmZXR5IG5ldCBvZiBrZXJuZWwvcmVzb3VyY2UuYyBhbnltb3JlLgo+IC1EYW5pZWwK
Pgo+Cj4+Pj4gd2hpY2ggZm9yIG1vc3QgaW50ZXJuYWxseSBhbGxvY2F0ZWQgYnVmZmVycyBpcyBk
dXJpbmcgc3dfZmluaSB3aGVuIGxhc3QgZHJtX3B1dAo+Pj4+IGlzIGNhbGxlZC4KPj4+Pgo+Pj4+
Cj4+Pj4+IElmIHRoYXQncyBub3QgdGhlIGNhc2UsIHRoZW4gaG90dW5wbHVnIHdvdWxkIGJlIGZ1
bmRhbWVudGFsbHkgaW1wb3NzaWJsZQo+Pj4+PiBvdCBoYW5kbGUgY29ycmVjdGx5Lgo+Pj4+Pgo+
Pj4+PiBPZiBjb3Vyc2UgYWxsIHRoZSBtbWlvIGFjdGlvbnMgd2lsbCB0aW1lIG91dCwgc28gaXQg
bWlnaHQgdGFrZSBzb21lIHRpbWUKPj4+Pj4gdG8gZ2V0IHRocm91Z2ggaXQgYWxsLgo+Pj4+Cj4+
Pj4gSSBmb3VuZCB0aGF0IFBDSSBjb2RlIHByb3ZpZGVzIHBjaV9kZXZpY2VfaXNfcHJlc2VudCBm
dW5jdGlvbgo+Pj4+IHdlIGNhbiB1c2UgdG8gYXZvaWQgdGltZW91dHMgLSBpdCByZWFkcyBkZXZp
Y2UgdmVuZG9yIGFuZCBjaGVja3MgaWYgYWxsIDFzIGlzCj4+Pj4gcmV0dXJuZWQKPj4+PiBvciBu
b3QuIFdlIGNhbiBjYWxsIGl0IGZyb20gd2l0aGluIHJlZ2lzdGVyIGFjY2Vzc29ycyBiZWZvcmUg
dHJ5aW5nIHJlYWQvd3JpdGUKPj4+IFRoYXQncyB3YXkgdG8gbXVjaCBvdmVyaGVhZCEgV2UgbmVl
ZCB0byBrZWVwIHRoYXQgbXVjaCBsb3dlciBvciBpdCB3aWxsIHJlc3VsdAo+Pj4gaW4gcXVpdGUg
YSBwZXJmb3JtYW5jZSBkcm9wLgo+Pj4KPj4+IEkgc3VnZ2VzdCB0byByYXRoZXIgdGhpbmsgYWJv
dXQgYWRkaW5nIGRybV9kZXZfZW50ZXIvZXhpdCBndWFyZHMuCj4+Cj4+IFN1cmUsIHRoaXMgb25l
IGlzIGp1c3QgYSBiaXQgdXBzdHJlYW0gdG8gdGhlIGRpc2Nvbm5lY3QgZXZlbnQuIEV2ZW50dWFs
bHkgbm9uZQo+PiBvZiB0aGVtIGlzIHdhdGVydGlnaHQuCj4+Cj4+IEFuZHJleQo+Pgo+Pgo+Pj4g
Q2hyaXN0aWFuLgo+Pj4KPj4+Pj4+IEFub3RoZXIgcG9pbnQgcmVnYXJkaW5nIHNlcmlhbGl6aW5n
IC0gcHJvYmxlbSAgaXMgdGhhdCBzb21lIG9mIHRob3NlIEJPcyBhcmUKPj4+Pj4+IHZlcnkgbG9u
ZyBsaXZlZCwgdGFrZSBmb3IgZXhhbXBsZSB0aGUgSFcgY29tbWFuZAo+Pj4+Pj4gcmluZyBidWZm
ZXIgQ2hyaXN0aWFuIG1lbnRpb25lZCBiZWZvcmUgLQo+Pj4+Pj4gKGFtZGdwdV9yaW5nX2luaXQt
PmFtZGdwdV9ib19jcmVhdGVfa2VybmVsKSwgaXQncyBsaWZlIHNwYW4KPj4+Pj4+IGlzIGJhc2lj
YWxseSBmb3IgdGhlIGVudGlyZSB0aW1lIHRoZSBkZXZpY2UgZXhpc3RzLCBpdCdzIGRlc3Ryb3ll
ZCBvbmx5IGluCj4+Pj4+PiB0aGUgU1cgZmluaSBzdGFnZSAod2hlbiBsYXN0IGRybV9kZXYKPj4+
Pj4+IHJlZmVyZW5jZSBpcyBkcm9wcGVkKSBhbmQgc28gc2hvdWxkIEkgZ3JhYiBpdCdzIGRtYV9y
ZXN2X2xvY2sgZnJvbQo+Pj4+Pj4gYW1kZ3B1X3BjaV9yZW1vdmUgY29kZSBhbmQgd2FpdAo+Pj4+
Pj4gZm9yIGl0IHRvIGJlIHVubWFwcGVkIGJlZm9yZSBwcm9jZWVkaW5nIHdpdGggdGhlIFBDSSBy
ZW1vdmUgY29kZSA/IFRoaXMgY2FuCj4+Pj4+PiB0YWtlIHVuYm91bmQgdGltZSBhbmQgdGhhdCB3
aHkgSSBkb24ndCB1bmRlcnN0YW5kCj4+Pj4+PiBob3cgc2VyaWFsaXppbmcgd2lsbCBoZWxwLgo+
Pj4+PiBVaCB5b3UgbmVlZCB0byB1bnRhbmdsZSB0aGF0LiBBZnRlciBodyBjbGVhbnVwIGlzIGRv
bmUgbm8gb25lIGlzIGFsbG93ZWQKPj4+Pj4gdG8gdG91Y2ggdGhhdCByaW5nYnVmZmVyIGJvIGFu
eW1vcmUgZnJvbSB0aGUga2VybmVsLgo+Pj4+Cj4+Pj4gSSB3b3VsZCBhc3N1bWUgd2UgYXJlIG5v
dCBhbGxvd2VkIHRvIHRvdWNoIGl0IG9uY2Ugd2UgaWRlbnRpZmllZCB0aGUgZGV2aWNlIGlzCj4+
Pj4gZ29uZSBpbiBvcmRlciB0byBtaW5pbWl6ZSB0aGUgY2hhbmNlIG9mIGFjY2lkZW50YWwgd3Jp
dGVzIHRvIHNvbWUgb3RoZXIKPj4+PiBkZXZpY2Ugd2hpY2ggbWlnaHQgbm93Cj4+Pj4gb2NjdXB5
IHRob3NlIElPIHJhbmdlcyA/Cj4+Pj4KPj4+Pgo+Pj4+PiAgICBUaGF0J3Mgd2hhdAo+Pj4+PiBk
cm1fZGV2X2VudGVyL2V4aXQgZ3VhcmRzIGFyZSBmb3IuIExpa2UgeW91IHNheSB3ZSBjYW50IHdh
aXQgZm9yIGFsbCBzdwo+Pj4+PiByZWZlcmVuY2VzIHRvIGRpc2FwcGVhci4KPj4+Pgo+Pj4+IFll
cywgZGlkbid0IG1ha2Ugc2Vuc2UgdG8gbWUgd2h5IHdvdWxkIHdlIHVzZSB2bWFwX2xvY2FsIGZv
ciBpbnRlcm5hbGx5Cj4+Pj4gYWxsb2NhdGVkIGJ1ZmZlcnMuIEkgdGhpbmsgd2Ugc2hvdWxkIGFs
c28gZ3VhcmQgcmVnaXN0ZXJzIHJlYWQvd3JpdGVzIGZvciB0aGUKPj4+PiBzYW1lIHJlYXNvbiBh
cyBhYm92ZS4KPj4+Pgo+Pj4+Cj4+Pj4+IFRoZSB2bWFwX2xvY2FsIGlzIGZvciBtYXBwaW5ncyBk
b25lIGJ5IG90aGVyIGRyaXZlcnMsIHRocm91Z2ggdGhlIGRtYS1idWYKPj4+Pj4gaW50ZXJmYWNl
ICh3aGVyZSAib3RoZXIgZHJpdmVycyIgY2FuIGluY2x1ZGUgZmJkZXYvZmJjb24sIGlmIHlvdSB1
c2UgdGhlCj4+Pj4+IGdlbmVyaWMgaGVscGVycykuCj4+Pj4+IC1EYW5pZWwKPj4+Pgo+Pj4+IE9r
LCBzbyBJIGFzc3VtZWQgdGhhdCB3aXRoIHZtYXBfbG9jYWwgeW91IHdlcmUgdHJ5aW5nIHRvIHNv
bHZlIHRoZSBwcm9ibGVtIG9mCj4+Pj4gcXVpY2sgcmVpbnNlcnRpb24KPj4+PiBvZiBhbm90aGVy
IGRldmljZSBpbnRvIHNhbWUgTU1JTyByYW5nZSB0aGF0IG15IGRyaXZlciBzdGlsbCBwb2ludHMg
dG9vIGJ1dAo+Pj4+IGFjdHVhbGx5IGFyZSB5b3UgdHJ5aW5nIHRvIHNvbHZlCj4+Pj4gdGhlIGlz
c3VlIG9mIGV4cG9ydGVkIGRtYSBidWZmZXJzIG91dGxpdmluZyB0aGUgZGV2aWNlID8gRm9yIHRo
aXMgd2UgaGF2ZQo+Pj4+IGRybV9kZXZpY2UgcmVmY291bnQgaW4gdGhlIEdFTSBsYXllcgo+Pj4+
IGkgdGhpbmsuCj4+Pj4KPj4+PiBBbmRyZXkKPj4+Pgo+Pj4+Cj4+Pj4+PiBBbmRyZXkKPj4+Pj4+
Cj4+Pj4+Pgo+Pj4+Pj4+IEl0IGRvZXNuJ3QKPj4+Pj4+PiBzb2x2ZSBhbGwgeW91ciBwcm9ibGVt
cywgYnV0IGl0J3MgYSB0b29sIHRvIGdldCB0aGVyZS4KPj4+Pj4+PiAtRGFuaWVsCj4+Pj4+Pj4K
Pj4+Pj4+Pj4gQW5kcmV5Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiAtIGhhbmRsZSBmYmNv
biBzb21laG93LiBJIHRoaW5rIHNodXR0aW5nIGl0IGFsbCBkb3duIHNob3VsZCB3b3JrIG91dC4K
Pj4+Pj4+Pj4+IC0gd29yc3QgY2FzZSBrZWVwIHRoZSBzeXN0ZW0gYmFja2luZyBzdG9yYWdlIGFy
b3VuZCBmb3Igc2hhcmVkIGRtYS1idWYKPj4+Pj4+Pj4+IHVudGlsIHRoZSBvdGhlciBub24tZHlu
YW1pYyBkcml2ZXIgcmVsZWFzZXMgaXQuIGZvciB2cmFtIHdlIHJlcXVpcmUKPj4+Pj4+Pj4+IGR5
bmFtaWMgaW1wb3J0ZXJzIChhbmQgbWF5YmUgaXQgd2Fzbid0IHN1Y2ggYSBicmlnaHQgaWRlYSB0
byBhbGxvdwo+Pj4+Pj4+Pj4gcGlubmluZyBvZiBpbXBvcnRlciBidWZmZXJzLCBtaWdodCBuZWVk
IHRvIHJldmlzaXQgdGhhdCkuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gQ2hlZXJzLCBEYW5pZWwKPj4+
Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IEFuZHJl
eQo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4gLURhbmllbAo+Pj4+Pj4+Pj4+
Pj4KPj4+Pj4+Pj4+Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+Pj4g
SSBsb2FkZWQgdGhlIGRyaXZlciB3aXRoIHZtX3VwZGF0ZV9tb2RlPTMKPj4+Pj4+Pj4+Pj4+Pj4g
bWVhbmluZyBhbGwgVk0gdXBkYXRlcyBkb25lIHVzaW5nIENQVSBhbmQgaGFzbid0IHNlZW4gYW55
IE9PUHMgYWZ0ZXIKPj4+Pj4+Pj4+Pj4+Pj4gcmVtb3ZpbmcgdGhlIGRldmljZS4gSSBndWVzcyBp
IGNhbiB0ZXN0IGl0IG1vcmUgYnkgYWxsb2NhdGluZyBHVFQgYW5kCj4+Pj4+Pj4+Pj4+Pj4+IFZS
QU0gQk9zCj4+Pj4+Pj4+Pj4+Pj4+IGFuZCB0cnlpbmcgdG8gcmVhZC93cml0ZSB0byB0aGVtIGFm
dGVyIGRldmljZSBpcyByZW1vdmVkLgo+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+PiBBbmRy
ZXkKPj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+Pj4+IFJlZ2FyZHMs
Cj4+Pj4+Pj4+Pj4+Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+
Pj4+IEFuZHJleQo+Pj4+Pj4+Pj4+Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+Pj4+Pj4+Pj4+Pj4+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+Pj4+
Pj4+Pj4+Pj4+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4+Pj4+Pj4+Pj4+PiBo
dHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMl
M0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZhbWQt
Z2Z4JmFtcDtkYXRhPTA0JTdDMDElN0NBbmRyZXkuR3JvZHpvdnNreSU0MGFtZC5jb20lN0NjNjMy
ZTViZDVhMWY0MDJhYzQwNjA4ZDhhMmNkMjA3MiU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5
NGUxODNkJTdDMCU3QzAlN0M2Mzc0MzgzNDkyMDM2MTkzMzUlN0NVbmtub3duJTdDVFdGcGJHWnNi
M2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxD
SlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9dEtrMEdUbVNua0xWVjQySHVRYVBBajAxcUZp
d0RXNlpzJTJCZ2kyaG9xJTJCdkElM0QmYW1wO3Jlc2VydmVkPTAKPj4+Pj4+Pj4+Pj4+Pj4KPj4+
Pj4+Pj4+Pj4+Pj4KPgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
