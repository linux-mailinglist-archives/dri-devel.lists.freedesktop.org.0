Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AFF10DA76
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 21:10:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26FB6EA01;
	Fri, 29 Nov 2019 20:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720077.outbound.protection.outlook.com [40.107.72.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF6F6E9F0;
 Fri, 29 Nov 2019 20:10:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYVXlRCcPEi3SJj4XEgl8MuubaWPpFAP47R24yzNBDjuSHvve3Tz3eSZQ30gRBs/sigeRZJpftdF/qjGH0DAI7f23PBfIKip48/nmaJieZ7QS0u9qqX5YHWOacE2r063Qq6q6FZuFsk1P+eT+LZP01F26cttIfP31zKu62HMgtdRjrAA5wopam8+skhht+SV8m0y6zRtcRhyjScZYf4fRt6m2ASAURVPWhuo6Xiak4vOlMCg3DrXJbIjApF9+TNg0AUSD0QZEdZbcF7A9HvQ65t2Hbta/3HVcjYRQQQ+QYO41DVoFFrGwGF7TINR5P0y1HaW4Fre8ByL22OHdzn3oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMYoh1L/nswRC5J2bak673j2tmP7BBtku0I9XjgiYqk=;
 b=lypjIIVQwR9xwprXekNWJmhngezlZGCydQvJit+NXj/cUaABvoDI2NTaWL8IowRUbh2/4xKPd0kLGxNtnm/ijKw5szsQ9eystYaWRv/Y21sNbmTiVLs19gq4oiHgcTEBjgmj3lknXmSn6A36wgS7LB//JBtmOHPUqS+s6/YUE4lDAlfvKh+NRILts0yZ8MLWqqiqvaSy2/+2pQJbQAUlsWJyie/rkYoev/hYMCo3j/OO2DFq0IdlxTjPQ3/1bzIa/z4mOmPTTzyPu3owLmH6VBEZGiOWj3Sfhb/oRrUuMn+WryD2cvpIBlgvjw39byIstGw4AaSA1m//4ubDCkAOqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.175.222) by
 DM6PR12MB2985.namprd12.prod.outlook.com (20.178.29.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Fri, 29 Nov 2019 20:10:10 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::a099:6fd7:e4d6:f560]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::a099:6fd7:e4d6:f560%3]) with mapi id 15.20.2495.014; Fri, 29 Nov 2019
 20:10:10 +0000
Subject: Re: [PATCH RFC v4 14/16] drm, cgroup: Introduce lgpu as DRM cgroup
 resource
To: "tj@kernel.org" <tj@kernel.org>, Daniel Vetter <daniel@ffwll.ch>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190829060533.32315-15-Kenny.Ho@amd.com>
 <b3d2b3c1-8854-10ca-3e39-b3bef35bdfa9@amd.com>
 <20191009103153.GU16989@phenom.ffwll.local>
 <ee873e89-48fd-c4c9-1ce0-73965f4ad2ba@amd.com>
 <20191009153429.GI16989@phenom.ffwll.local>
 <c7812af4-7ec4-02bb-ff4c-21dd114cf38e@amd.com>
 <20191009160652.GO16989@phenom.ffwll.local>
 <20191011171247.GC18794@devbig004.ftw2.facebook.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <1a31dded-b386-0da4-3ff7-d6f4e767de75@amd.com>
Date: Fri, 29 Nov 2019 15:10:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
In-Reply-To: <20191011171247.GC18794@devbig004.ftw2.facebook.com>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::29) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:148::30)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6e6666af-1926-46be-4847-08d7750822ac
X-MS-TrafficTypeDiagnostic: DM6PR12MB2985:|DM6PR12MB2985:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB29853C0AA791BEE793E1CA2F92460@DM6PR12MB2985.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0236114672
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(199004)(189003)(2501003)(446003)(81166006)(81156014)(44832011)(31686004)(14444005)(11346002)(2616005)(110136005)(316002)(65956001)(186003)(58126008)(4001150100001)(50466002)(47776003)(6246003)(66556008)(53546011)(229853002)(8676002)(386003)(6506007)(52116002)(36916002)(2486003)(7736002)(26005)(76176011)(23676004)(54906003)(66946007)(3846002)(478600001)(6436002)(5660300002)(6512007)(99286004)(305945005)(14454004)(36756003)(86362001)(4326008)(8936002)(65806001)(31696002)(66476007)(66066001)(6116002)(25786009)(2870700001)(2906002)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2985;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n7iRlcVK7cQeD4EjASIAnb9LKO5IgEKyH/B8MwLfgqnYbtfg9KJr1ezIf+7gCgCsKVjpB4m14y30Irx2ST9fAsv5cafDoN/5eDfqnCKxn7V8vxAX/zze8dV0QjDr+oDs/cKXoC8hU8Ko0bIX0sSrBScjl/ewDXqDBpquoxIs9TFKVykOCF+WuwePwCPbIs6p+2hwhDf2h9l05FaZDWoLKj/20yevB8QB1P332aksaFCG9/asCOGEa7/GBmVJB63QFdEkUzOdjy82uGjGvfGh0jZYp7ZjJUPp5axnWRua5mGrWDRk0A+acH1QeXVztFSA55lMUJ3cG1WtCcOoo1GjU9MhxyQomNbovjPbYaqsMb9QeetFte04R3DtaI7WRGhrsJ7nBwKyJ6sPqEUAsmcDODaCy7yAd663QcqGEsUCvFTJmRWBUPD0j4uEmHEPJO2V
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e6666af-1926-46be-4847-08d7750822ac
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2019 20:10:09.9527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8uB+9auv5bMZc2Uv5tshH9huEm/p8QGwQZkZTRRln/umqtDRZERTtgS4GoV7Zn9hfW2Mq41VIf6QIuUYaqyuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2985
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMYoh1L/nswRC5J2bak673j2tmP7BBtku0I9XjgiYqk=;
 b=i9CVAI7Oy3ODfM1ewx4UkaQJZI3PVbe0JajgEr3nKnomkbi/hmfgw1iCGneCg1ECq3QbLznrxuOhi7fyiP+zFXK64ZnGcov82NOWZDggz4LE1dRUft2mjed1Ij+d9xgHmH0U4Je6oJLC35tMybfGiHDMsF6c/B2swIjgHCv/NlY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Ho, Kenny" <Kenny.Ho@amd.com>, "jsparks@cray.com" <jsparks@cray.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "lkaplan@cray.com" <lkaplan@cray.com>, "y2kenny@gmail.com" <y2kenny@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Greathouse, Joseph" <Joseph.Greathouse@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0xMSAxOjEyIHAubS4sIHRqQGtlcm5lbC5vcmcgd3JvdGU6Cj4gSGVsbG8sIERh
bmllbC4KPgo+IE9uIFdlZCwgT2N0IDA5LCAyMDE5IGF0IDA2OjA2OjUyUE0gKzAyMDAsIERhbmll
bCBWZXR0ZXIgd3JvdGU6Cj4+IFRoYXQncyBub3QgdGhlIHBvaW50IEkgd2FzIG1ha2luZy4gRm9y
IGNwdSBjZ3JvdXBzIHRoZXJlJ3MgYSB2ZXJ5IHdlbGwKPj4gZGVmaW5lZCBjb25uZWN0aW9uIGJl
dHdlZW4gdGhlIGNwdSBiaXRtYXNrcy9udW1iZXJzIGluIGNncm91cHMgYW5kIHRoZSBjcHUKPj4g
Yml0bWFza3MgeW91IHVzZSBpbiB2YXJpb3VzIHN5c3RlbSBjYWxscyAodGhleSBtYXRjaCkuIEFu
ZCB0aGF0IHN0dWZmCj4+IHdvcmtzIGFjcm9zcyB2ZW5kb3JzLgo+IFBsZWFzZSBub3RlIHRoYXQg
dGhlcmUgYXJlIGEgbG90IG9mIGxpbWl0YXRpb25zIGV2ZW4gdG8gY3B1c2V0Lgo+IEFmZmluaXR5
IGlzIGVhc3kgdG8gaW1wbGVtZW50IGFuZCBzZWVtcyBhdHRyYWN0aXZlIGluIHRlcm1zIG9mCj4g
YWJzb2x1dGUgaXNvbGF0aW9uIGJ1dCBpdCdzIGluaGVyZW50bHkgY3VtYmVyc29tZSBhbmQgbGlt
aXRlZCBpbgo+IGdyYW51bGFyaXR5IGFuZCBjYW4gbGVhZCB0byBzdXJwcmlzaW5nIGZhaWx1cmUg
bW9kZXMgd2hlcmUgY29udGVudGlvbgo+IG9uIG9uZSBjcHUgY2FuJ3QgYmUgcmVzb2x2ZWQgYnkg
dGhlIGxvYWQgYmFsYW5jZXIgYW5kIGxlYWRzIHRvIHN5c3RlbQo+IHdpZGUgc2xvd2Rvd25zIC8g
c3RhbGxzIGNhdXNlZCBieSB0aGUgZGVwZW5kZW5jeSBjaGFpbiBhbmNob3JlZCBhdCB0aGUKPiBh
ZmZpbml0eSBsaW1pdGVkIHRhc2tzLgo+Cj4gTWF5YmUgdGhpcyBpcyBhIGxlc3Mgb2YgYSBwcm9i
bGVtIGZvciBncHUgd29ya2xvYWRzIGJ1dCBpbiBnZW5lcmFsIHRoZQo+IG1vcmUgY29uc3RyYWlu
dHMgYXJlIHB1dCBvbiBzY2hlZHVsaW5nLCB0aGUgbW9yZSBsaWtlbHkgaXMgdGhlIHN5c3RlbQo+
IHRvIGRldmVsb3AgdHdpc3RlZCBkZXBlbmRlbmN5IGNoYWlucyB3aGlsZSBvdGhlciBwYXJ0cyBv
ZiB0aGUgc3lzdGVtCj4gYXJlIHNpdHRpbmcgaWRsZS4KPgo+IEhvdyBkb2VzIHNjaGVkdWxpbmcg
Y3VycmVudGx5IHdvcmsgd2hlbiB0aGVyZSBhcmUgY29tcGV0aW5nIGdwdQo+IHdvcmtsb2Fkcz8g
IFRoZXJlIGdvdHRhIGJlIHNvbWUgZmFpcm5lc3MgcHJvdmlzaW9uIHdoZXRoZXIgdGhhdCdzIHVu
aXQKPiBhbGxvY2F0aW9uIGJhc2VkIG9yIHRpbWUgc2xpY2luZywgcmlnaHQ/CgpUaGUgc2NoZWR1
bGluZyBvZiBjb21wZXRpbmcgd29ya2xvYWRzIG9uIEdQVXMgaXMgaGFuZGxlZCBpbiBoYXJkd2Fy
ZSBhbmQgCmZpcm13YXJlLiBUaGUgTGludXgga2VybmVsIGFuZCBkcml2ZXIgYXJlIG5vdCByZWFs
bHkgaW52b2x2ZWQuIFdlIGhhdmUgCnNvbWUga25vYnMgd2UgY2FuIHR3ZWFrIGluIHRoZSBkcml2
ZXIgKHF1ZXVlIGFuZCBwaXBlIHByaW9yaXRpZXMsIApyZXNvdXJjZSByZXNlcnZhdGlvbnMgZm9y
IGNlcnRhaW4gdHlwZXMgb2Ygd29ya2xvYWRzKSwgYnV0IHRoZXkgYXJlIApwcmV0dHkgSFctc3Bl
Y2lmaWMgYW5kIEkgd291bGRuJ3QgbWFrZSBhbnkgY2xhaW1zIGFib3V0IGZhaXJuZXNzLgoKUmVn
YXJkcywKIMKgIEZlbGl4Cgo+ICAgIElmIHRoYXQncyB0aGUgY2FzZSwgaXQgbWlnaHQKPiBiZSBi
ZXN0IHRvIGltcGxlbWVudCBwcm9wb3J0aW9uYWwgY29udHJvbCBvbiB0b3Agb2YgdGhhdC4KPiBX
b3JrLWNvbnNlcnZpbmcgbWVjaGFuaXNtcyBhcmUgdGhlIG1vc3QgdmVyc2F0aWxlLCBlYXNpZXN0
IHRvIHVzZSBhbmQKPiBsZWFzdCBsaWtlbHkgdG8gY2F1c2UgcmVncmVzc2lvbnMuCj4KPiBUaGFu
a3MuCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
