Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7EE20A28A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 18:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3599C89FF7;
	Thu, 25 Jun 2020 16:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912E089FF7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 16:02:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUoMha5c70S38lfj0l0+vcC3zYk2RZ7dMxCh8c2f9jrdepGF9sHQaGGKd45RBklEpqiBgcctU1fjGXvuYZv78P9A8gNwXC3DCFmveohA5iVHBThb5MqJhYkw7TsWkxyYQxt0ouiCQNQuk3gKRUCzL4XrvIL8Kg4us7jLH8BFV/sEOh0X4DF583qL0iceCmk+pkILQUv03cWpyjAV5wbnQxkboBLKsxuTLaBqh85itIGjuJqlgInvKfki9U1UPpXLkcG+RAjIBRNpytUkvhVzkNg1N6mxP4bsF1alOf6AA0ss3TyjDWnJldfiXt91/iHBCVaQtgXldjq9UQuNX1VwSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rZhmQGkwjSVMfSLulu0+rBpVvrSDU5oBJiFK94gvWA=;
 b=GY1jqg7N4X48z83FZ9ap3G/mL1j/SVMv+/fItC2Os9+quhfgXUMpUpzcvP0rZsFpKcyDPeHB54kJE2d6qk6nzw1+N1vmzgm2AvvgyLf4yvO0G+GynEDkIQPXfSXxKNeMv1CBONz2UboCKfiQEDosq0sV/3oqv2666kgjIsyiIX+kX8i1KGnhLNJAR3VJW2RpWZ/Qs4Fp0MMaZcHvnJKN42mNStB5LdXte623n+CSm9M9vz070vDJxpNktWZl7R6aOxFBtI/SW+F1QXdv7CibsxMw8eTfQ8xjaK0+8I/yaPsNJwAzMtqHyvXw4xJaRIRuSbPUE4fxzxCuuBoIdpj1CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rZhmQGkwjSVMfSLulu0+rBpVvrSDU5oBJiFK94gvWA=;
 b=n/od4fxjLIcfx+kyAqvMFhoCjuTWs6XNcZFllAd6SpCwBgYRwwXM7COQIS4IhHI2wdlND2gmNb37wSyRGmLRn5w+8zC5n5AKZLv+q+mvI0CHuLAG18NVHzK1xuWMsXhj77apPI/WwoR7d0ldmt5DlGp+Mzd44a34tUB4DoTz9aY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM5PR12MB1321.namprd12.prod.outlook.com (2603:10b6:3:78::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Thu, 25 Jun
 2020 16:02:17 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::a045:f8c0:8edb:1ef1]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::a045:f8c0:8edb:1ef1%9]) with mapi id 15.20.3131.020; Thu, 25 Jun 2020
 16:02:17 +0000
Subject: Re: [RESEND] [PATCH v6 0/8] do not store GPU address in TTM
To: Daniel Vetter <daniel@ffwll.ch>,
 "Nikula, Jani" <jani.nikula@linux.intel.com>
References: <20200624182648.6976-1-nirmoy.das@amd.com>
 <b5629fcc-ba5e-4882-bafb-d88ef0ef144e@amd.com>
 <CAKMK7uGQCttt-X3eoftdO6aHRtS0RQE6P=yRQK97Hp9N2jLLYQ@mail.gmail.com>
 <803bcaee-3773-ed9d-2b55-74961d693c05@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2d281cf1-07ac-45ec-c3c0-983db360888e@amd.com>
Date: Thu, 25 Jun 2020 18:02:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <803bcaee-3773-ed9d-2b55-74961d693c05@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0034.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::14) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0034.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend
 Transport; Thu, 25 Jun 2020 16:02:15 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bc3e290f-d72f-443b-1000-08d819212274
X-MS-TrafficTypeDiagnostic: DM5PR12MB1321:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1321BA375CC71A8DF4D7D97483920@DM5PR12MB1321.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RdjIerIbaEeZDhgdYA5y220LsMcYBENB7Rl5vl7MjzHKl8DdDQUkCSOPz6jwpFIe3fSGxhfDTXaEO28b72FR2ELjawyxYWbpOlYk9jGRiCCZw6YPKFFnWs2UsmBJnbTLkNbdHvRSq43X0uPjDRx6t8XNCupqfikFfX9OCzoaGPnBqlYf1HR4xhn6nwtLx6h8WCTeZeTNloK6+h4R5TEFREHx3q/2TfDfZbeehnjXiniYV2Dztf05sB/F2/738vRUKg238x8vpwVXZ7MiT4UGqRcyZLKb5tbGuK8UOwXjFHYnNLZLi09l/Okn4yqNm7AWBwn+mktYEHNqcpGM0tiIAC4sboZNZNinAhb7ZcFcygbeFertMcDQIJTdVD6TysPWb6HE4T67Z0XZDuQBhrHY3hUktBsUo77HhawrMwwE5wk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(53546011)(316002)(66946007)(66556008)(66476007)(36756003)(186003)(16526019)(4326008)(5660300002)(6486002)(6666004)(83380400001)(2616005)(2906002)(478600001)(66574015)(45080400002)(31696002)(52116002)(54906003)(86362001)(31686004)(110136005)(8676002)(966005)(8936002)(7416002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: tDshkLAVaChIVrjuHvS4nwC+X9SlmzpD2TqQWBuxD/RpEXMmVraTuIH7RiFVBu1ggd7xHkilQwylCPRjPfyQ6umD2Dwe3OKliPgfzSzFZCQS8Eq4gUJ1D3DC1nVHTX0k+hMcrYxMUUPO9HqOmy7ibZDX6JnrxZA1qdV+MOfVD1mUgmvH9HkFKyYA4LfdziumzVRf4Gvm1nPVfURWodoIa6kIul2Z9N7dzBqUVj+s4zmmdlvHjbCk9Km9/Paw1xntFRbk34gxOwrPKwkkSOIL0AB98bFNg4oPO+4SD2OE+dRGGBtWQ7vWCqBdB5qhW9pxs3hp/7gM9wCrt/QHQzyf9Q3OZzWMaIWI0Yxi1L+kIKaqCXQJ42bUwDI/ewzQybU2iVqL8D0iPfbxx7fpkNsCTb7XKKUCSUm9PwWBfSwysQUAk/ft1tsNuQWXlZUAFHQvxaaMj/unfCsf0ti1fat46D0ZThQ9Kr3bMFHWKCFGYL/J1qygl9cgQ27KhK/3eIk81oM84ihuktyE85KMBhMlWLCmEWvzHgsRpnQgZcBEgRWUjtvlyFyXOWUxOWN+jseB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc3e290f-d72f-443b-1000-08d819212274
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4401.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 16:02:17.6856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+mGr6V141upkRb+qMvtSlDafsp2j5qtp3m1zWoIQmIkPCpklYUk7XN3McNz4i5K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1321
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
Cc: Sasha Levin <sashal@kernel.org>, Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Airlie <airlied@linux.ie>, "Ho, Kenny" <kenny.ho@amd.com>,
 Brian Welty <brian.welty@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Nirmoy Das <nirmoy.das@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sean Paul <sean@poorly.run>, Nirmoy Das <nirmoy.aiemd@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMDYuMjAgdW0gMTc6NTIgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IEFtIDI1LjA2
LjIwIHVtIDE3OjQ0IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4gT24gVGh1LCBKdW4gMjUsIDIw
MjAgYXQgMTE6NTAgQU0gQ2hyaXN0aWFuIEvDtm5pZwo+PiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPiB3cm90ZToKPj4+IEkndmUgcHVzaGVkIHBhdGNoZXMgIzEsICMyIGFuZCAjNS0jOCBvZiB0
aGlzIHNlcmllcyB0byBkcm0tbWlzYy1uZXh0Lgo+PiBJIHRoaW5rIHlvdSBsZWZ0IGFuIHVucmVz
b2x2ZWQgY29uZmxpY3QgYmVoaW5kIGluIGRybS10aXAsIHBsZWFzZSAKPj4gcmVzb2x2ZSBwZXIK
Pj4KPj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJs
PWh0dHBzJTNBJTJGJTJGZHJtLnBhZ2VzLmZyZWVkZXNrdG9wLm9yZyUyRm1haW50YWluZXItdG9v
bHMlMkZkcm0tdGlwLmh0bWwlMjNyZXNvbHZpbmctY29uZmxpY3RzLXdoZW4tcmVidWlsZGluZy1k
cm0tdGlwJmFtcDtkYXRhPTAyJTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3Q2Mx
NDQxYTgxZTlkYzRmYTQ1MDcyMDhkODE5MWVhMGY2JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJk
OTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzI4Njk2NjYzMTU5NTMwMCZhbXA7c2RhdGE9cGZXUzRWZ0R2
VThJc1IyNjM4TURyN2ZZV0UwbmVmYTNiNlh4eVBDQ3NPVSUzRCZhbXA7cmVzZXJ2ZWQ9MCAKPj4K
Pj4KPj4gVGhlIHNjcmlwdCBzaG91bGQgaGF2ZSB0b2xkIHlvdSB0aGF0IGFscmVhZHksIHNvIG1h
eWJlIHJlaW52ZW50IHRoYXQKPj4gaW4gd2hhdGV2ZXIgdGhpbmcgeW91J3JlIHVzaW5nIDotKSBK
YW5pIGhhcyByZXBvcnRlZCB0aGlzIG9uCj4+ICNkcmktZGV2ZWwsIHRoaXMgYWxzbyBob2xkcyB1
cCBDSSB0ZXN0aW5nIHNpbmNlIHdlJ3JlIHJ1bm5pbmcgb24gdG9wCj4+IG9mIGRybS10aXAuCj4K
PiBXZWxsIEkgdXNlZCBkaW0gcHVzaC1icmFuY2guIEkgZXZlbiBoYWQgdG8gcmViYXNlIG9uY2Ug
bW9yZSBiZWNhdXNlIEkgCj4gZm9yZ290IGEgc2lnbmVkLW9mIG9uIG9uZSBvZiB0aGUgcGF0Y2hl
cywgc28gSSdtIHByZXR0eSBzdXJlIG9mIHRoYXQuCj4KPiBIYXZlbid0IHNlZW4gYW55dGhpbmcg
cHJvYmxlbWF0aWMgZXhjZXB0IGZvciB0aGF0IHdoaWxlIGRvaW5nIHNvLgoKT2ssIGFueXdheSB0
aGF0IG9uZSB3YXMgdHJpdmlhbCB0byBmaXguCgpUaGFua3MsCkNocmlzdGlhbi4KCj4KPiBSZWdh
cmRzLAo+IENocmlzdGlhbi4KPgo+PiAtRGFuaWVsCj4+Cj4+Cj4+Cj4+PiBPbmx5IFZNR0ZYIGFu
ZCBOb3V2ZWF1IGFyZSBtaXNzaW5nIGFuZCBJJ20gcHJldHR5IGNsb3NlIHRvIGp1c3QgcHVzaAo+
Pj4gdGhlbSB3aXRoIG15IEFja2VkLWJ5IHNpbmNlIHRoZXkgc2hvdWxkIG5vdCBjb250YWluIGFu
eSBmdW5jdGlvbmFsIAo+Pj4gY2hhbmdlLgo+Pj4KPj4+IEFueSBvYmplY3Rpb25zPwo+Pj4KPj4+
IFRoYW5rcywKPj4+IENocmlzdGlhbi4KPj4+Cj4+PiBBbSAyNC4wNi4yMCB1bSAyMDoyNiBzY2hy
aWViIE5pcm1veSBEYXM6Cj4+Pj4gV2l0aCB0aGlzIHBhdGNoIHNlcmllcyBJIGFtIHRyeWluZyB0
byByZW1vdmUgR1BVIGFkZHJlc3MgZGVwZW5kZW5jeSBpbgo+Pj4+IFRUTSBhbmQgbW92aW5nIEdQ
VSBhZGRyZXNzIGNhbGN1bGF0aW9uIHRvIGluZGl2aWR1YWwgZHJtIGRyaXZlcnMuIFRoaXMKPj4+
PiBjbGVhbnVwIHdpbGwgc2ltcGxpZnkgaW50cm9kdWN0aW9uIG9mIGRybV9tZW1fcmVnaW9uL2Rv
bWFpbiB3b3JrIAo+Pj4+IHN0YXJ0ZWQKPj4+PiBieSBCcmlhbiBXZWx0eVsxXS4KPj4+Pgo+Pj4+
Cj4+Pj4gSXQgd291bGQgYmUgbmljZSBpZiBzb21lb25lIHRlc3QgdGhpcyBmb3Igbm91dmVhdS4g
UmVzdCBvZiB0aGUgZHJpdmVycwo+Pj4+IGFyZSBhbHJlYWR5IHRlc3RlZC4KPj4+Pgo+Pj4+IHYy
Ogo+Pj4+ICogc2V0IGJvLT5vZmZzZXQgPSAwIGZvciBkcm0vbm91dmVhdSBpZiBiby0+bWVtLm1t
X25vZGUgPT0gTlVMTAo+Pj4+Cj4+Pj4gdjM6Cj4+Pj4gKiBjYXRjaCByZXR1cm4gdmFsdWUgb2Yg
ZHJtX2dlbV92cmFtX29mZnNldCgpIGluIGRybS9ib2Nocwo+Pj4+ICogaW50cm9kdWNlIGRybV9n
ZW1fdnJhbV9wZ19vZmZzZXQoKSBpbiB2cmFtIGhlbHBlcgo+Pj4+ICogaW1wcm92ZSBuYm8tPm9m
ZnNldCBjYWxjdWxhdGlvbiBmb3Igbm91dmVhdQo+Pj4+Cj4+Pj4gdjQ6Cj4+Pj4gKiBtaW5vciBj
b2Rpbmcgc3R5bGUgZml4ZXMgaW4gYW1kZ3B1IGFuZCByYWRlb24KPj4+PiAqIHJlbW92ZSB1bm5l
Y2Vzc2FyeSBrZXJuZWxkb2MgZm9yIGludGVybmFsIGZ1bmN0aW9uCj4+Pj4KPj4+PiB2NToKPj4+
PiAqIHJlYmFzZSBvbiB0b3Agb2YgZHJtLW1pc2MtbmV4dAo+Pj4+ICogZml4IHJldHVybiB2YWx1
ZSBvZiBkcm1fZ2VtX3ZyYW1fcGdfb2Zmc2V0KCkKPj4+PiAqIGFkZCBhIGNvbW1lbnQgaW4gZHJt
X2dlbV92cmFtX3BnX29mZnNldCgpIHRvIGNsZWFyaWZ5IHdoeSB3ZSAKPj4+PiByZXR1cm4gMC4K
Pj4+Pgo+Pj4+IHY2Ogo+Pj4+ICogcmViYXNlIHRvIGRybS1taXNjLW5leHQKPj4+PiAqIHJlbW92
ZWQgYWNrZWQgZm9yIHZtd2dmeCBhcyB0aGVyZSB3YXMgYSBzbWFsbCBjb25mbGljdAo+Pj4+Cj4+
Pj4gTmlybW95IERhcyAoOCk6Cj4+Pj4gwqDCoMKgIGRybS9hbWRncHU6IG1vdmUgdHRtIGJvLT5v
ZmZzZXQgdG8gYW1kZ3B1X2JvCj4+Pj4gwqDCoMKgIGRybS9yYWRlb246IGRvbid0IHVzZSB0dG0g
Ym8tPm9mZnNldAo+Pj4+IMKgwqDCoCBkcm0vdm13Z2Z4OiBkb24ndCB1c2UgdHRtIGJvLT5vZmZz
ZXQKPj4+PiDCoMKgwqAgZHJtL25vdXZlYXU6IGRvbid0IHVzZSB0dG0gYm8tPm9mZnNldCB2Mwo+
Pj4+IMKgwqDCoCBkcm0vcXhsOiBkb24ndCB1c2UgdHRtIGJvLT5vZmZzZXQKPj4+PiDCoMKgwqAg
ZHJtL3ZyYW0taGVscGVyOiBkb24ndCB1c2UgdHRtIGJvLT5vZmZzZXQgdjQKPj4+PiDCoMKgwqAg
ZHJtL2JvY2hzOiB1c2UgZHJtX2dlbV92cmFtX29mZnNldCB0byBnZXQgYm8gb2Zmc2V0IHYyCj4+
Pj4gwqDCoMKgIGRybS90dG06IGRvIG5vdCBrZWVwIEdQVSBkZXBlbmRlbnQgYWRkcmVzc2VzCj4+
Pj4KPj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuY8Kg
IHwgMjMgKysrKysrKysrKysrKystLQo+Pj4+IMKgwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X29iamVjdC5owqAgfMKgIDEgKwo+Pj4+IMKgwqAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3R0bS5jwqDCoMKgwqAgfCAzMCAKPj4+PiArKysrKysrKysrKysrKysr
LS0tLS0KPj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uaMKg
wqDCoMKgIHzCoCAxICsKPj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92bV9zZG1hLmMgfMKgIDQgKy0tCj4+Pj4gwqDCoCBkcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9j
aHNfa21zLmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNyArKysrLQo+Pj4+IMKgwqAgZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuY8KgwqDCoMKgwqDCoCB8IDExICsrKysrKyst
Cj4+Pj4gwqDCoCBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnYwNC9jcnRjLmPCoMKgwqDC
oCB8wqAgNiArKy0tLQo+Pj4+IMKgwqAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQv
ZGlzcC5jwqDCoMKgwqAgfMKgIDMgKystCj4+Pj4gwqDCoCBkcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9kaXNwbnYwNC9vdmVybGF5LmPCoCB8wqAgNiArKy0tLQo+Pj4+IMKgwqAgZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvZGlzcG52NTAvYmFzZTUwN2MuYyB8wqAgMiArLQo+Pj4+IMKgwqAgZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvY29yZTUwN2QuYyB8wqAgMiArLQo+Pj4+IMKgwqAg
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvb3ZseTUwN2UuYyB8wqAgMiArLQo+Pj4+
IMKgwqAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvd25kdy5jwqDCoMKgwqAgfMKg
IDIgKy0KPj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL3duZHdjMzdl
LmMgfMKgIDIgKy0KPj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYWJp
MTYuY8KgwqDCoMKgIHzCoCA4ICsrKy0tLQo+Pj4+IMKgwqAgZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9iby5jwqDCoMKgwqDCoMKgwqAgfMKgIDggKysrKysrCj4+Pj4gwqDCoCBkcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmjCoMKgwqDCoMKgwqDCoCB8wqAgMyArKysK
Pj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfY2hhbi5jwqDCoMKgwqDC
oCB8wqAgMiArLQo+Pj4+IMKgwqAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVt
LmPCoMKgwqDCoMKgIHzCoCAyICstCj4+Pj4gwqDCoCBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2ZiY29uLmPCoMKgwqDCoCB8wqAgMiArLQo+Pj4+IMKgwqAgZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9nZW0uY8KgwqDCoMKgwqDCoCB8IDEwICsrKy0tLS0KPj4+PiDCoMKg
IGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqAgNiArKy0tLQo+Pj4+IMKgwqAgZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfa21zLmPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA1ICsrLS0KPj4+PiDCoMKgIGRyaXZlcnMvZ3B1
L2RybS9xeGwvcXhsX29iamVjdC5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNSAtLS0tCj4+
Pj4gwqDCoCBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0uY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgIDkgLS0tLS0tLQo+Pj4+IMKgwqAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb24uaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSArCj4+Pj4gwqDCoCBkcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuaMKgwqDCoMKgwqAgfCAxNiArKysrKysrKysr
LQo+Pj4+IMKgwqAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmPCoMKgwqDCoMKg
wqDCoMKgIHzCoCA0ICstLQo+Pj4+IMKgwqAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNyAtLS0tLQo+Pj4+IMKgwqAgZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfYm8uY8KgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNCArLS0K
Pj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2V4ZWNidWYuY8KgwqDCoMKg
IHzCoCAyICstCj4+Pj4gwqDCoCBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9maWZvLmPC
oMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+Pj4+IMKgwqAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfdHRtX2J1ZmZlci5jwqAgfMKgIDIgLS0KPj4+PiDCoMKgIGluY2x1ZGUvZHJtL3R0bS90
dG1fYm9fYXBpLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgLS0KPj4+PiDC
oMKgIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDEgLQo+Pj4+IMKgwqAgMzYgZmlsZXMgY2hhbmdlZCwgMTI1IGluc2VydGlvbnMoKyks
IDc4IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gLS0gCj4+Pj4gMi4yNy4wCj4+Pj4KPj4KPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
