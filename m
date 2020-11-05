Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B85E2A7F29
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 13:56:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931CB6E106;
	Thu,  5 Nov 2020 12:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770089.outbound.protection.outlook.com [40.107.77.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1946E106
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 12:56:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYTzOorXaRxicYDDuYnWiyGxfVd8K4Ka3rVLpM6XRe4B/QL9vF19yD88tROUAEQ0dc2HOeo5t2+EPydEYh9uWp4wi6LGqcR221Cy4+VPAWC8ZvSF69fSa2AaxfEFJzjHrW1FjB1vzkrIWeMTMu8CP1nYhfSnr3jPE5qJeZUzK9vuYWHuYovQ6o/bePjLDgQk3UPMufkt4f009sVX2f8drixW8xXL90cf4cqNvtSTjbte3vX2yb5HbKlt34IF8RMO9ZNPvQ3ZYL63EZnHK5hyw+DZZJIZf3i7r467FxHa7SjlNdWqqXrVgDJYYpVgDYJcrZRHT9Jk76SRpbcOR0kS9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUw2iVM6Ceo1sparsXG5oEZudgj5/caL4tnwP3XMog8=;
 b=gAnUMmTCB8dajGKSgGy15OveO1ChRO/JWTuQ1Mx2asW69yWgf2vSlbNchMj1kjbT+7IzA/PB8rMonEsq6cPMjc9n+2ocVilIGP5nbObFhyCMEOAbugkcAMw1HauN2aIbu94SiKqhfeYODMQjMLKVQliO704SPBW4UE8n/cKgIKqi+pv1Teb5qJ5qO6lUcv8RIAExpgr14INdEdjTRaRuA6f2OkNCGdbsYKqaMA3Yu+tEcKj5TkApMR/1KhzvHvF3ZTgi0Q7eq64GCJ6wdj84GmXCtpbmmTWQ96RbW7LOV+XlmRGc4KyIY59xXE4Hf3nimYe9SJ1gayUBiU4TaFCFqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUw2iVM6Ceo1sparsXG5oEZudgj5/caL4tnwP3XMog8=;
 b=HvnSJamGJTQtuJtjpCvTCvJeDBVl8B01oyT8ZR2DG8HZdbGpKc4ygw3r9A0WQxhFOaWc947r4A2F4RarCRPSmtZ/qkmmgvhuZXFKWYZkdqtXcsH/jI1LyY8JuQxUTEbfC9J5hOGNpWMcBiRtj5FOOE3unQLcRMS9KFcLOKeJITU=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 5 Nov
 2020 12:56:28 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 12:56:28 +0000
Subject: Re: [PATCH] drm/ttm: don't set page->mapping
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201104165030.2005167-1-daniel.vetter@ffwll.ch>
 <859e2b9c-c202-25c6-b52f-9841fe32b082@amd.com>
 <CAKMK7uGA3URvu3BUzs617sGS_TchHDhpzzgsMGrVVJtwBpD+Vw@mail.gmail.com>
 <d6cdc22d-9cb2-7985-fdc3-ad3548899f02@amd.com>
 <20201105125009.GV401619@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <614b3893-b735-7ba4-4f0a-55891adbdc8d@amd.com>
Date: Thu, 5 Nov 2020 13:56:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201105125009.GV401619@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR01CA0089.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0089.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Thu, 5 Nov 2020 12:56:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ff85aae5-12ef-4025-df5e-08d8818a35b8
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2353024A7101729BE39148A983EE0@BL0PR12MB2353.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5KJeZLLZGOH4xcRvEBx65qpDIK/rMW3Ni0Gj8a7WakDbONF8NlcsBWwE7wZvuqvN4th5+d/GJkvedKegVYplNR8wG+iXjLeF6rmcHdAROGxODuOG9T2g2FaFri7Z1DG9Qllfa6V08PDWULGyJxF6eqHBxyGV5ZgwiboBExIrceN70hWACC4JWXgZyaPHDvt4U+BwIzs/eK6kukUG8l0CCdRJZvx6sDYgsbmwOQKihrrKgGHG14OUb2Y5m2kkniDB9XEVDfUUPpYR9i0KdLpIGXkAPowHQ1FYaFVSmCaO4XgqR+cbjuSZm+1EGldV/wehlyHU9yLxyuzEhbiJG3CyL0AhJscSPx2TFxaTM+eKdINEj4Ll5omsjyGgQL4E2Sug
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(478600001)(2906002)(54906003)(6666004)(4326008)(16526019)(31686004)(186003)(2616005)(316002)(8936002)(31696002)(83380400001)(8676002)(86362001)(52116002)(36756003)(53546011)(5660300002)(6916009)(66476007)(66556008)(66946007)(66574015)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: TryLJTl7cmnqLZtjQ8mTZOe70iBPjR1Le0GzeyGIyCmgndpVKLo7kmDNZHIXJEDWiKFq1BuVUIBYHG5vCey01plD27h+E7Sx+Nf5kJa5+1xFDVsfXeS7MxNPuJRAwlvfYETSZpVzho72LVwzAsTHNNnT59bZbX4+09ML65OiKeY3T+BZz9vysTJ4aebudn5wWa8IX6LfDZmeoQE/j9H8W5tNXdyInGXiBPNoGL9LE2rLIfLYB5w3SD+tJp+jfvBfdKeUkEPSSk/+8uZ8zNTOK8jl4ftWsPD4Cxt3oP9Ktw/TgPzoqUyVAb+OeNykL3ibYuKU61ts3xLEA/Sa4n3ZIGcfuxtraSlARu9nHHajO0N5LmhlgwO2q6yfMeQm3DM+xaZsZWF49HC7osxR0zAww9XORrauuc1qOnKJhdkdv4ZOniJdp7tSbY0Qvio5bjbxg+4K5E1OWjt2kAWJj+8JO1m61XSiKa4i08clt7oFDGiQpwk9x6SLXlXOQ6JAXj75PQXriTWkSqJFKBMdHVI3m877ydEecMinLKztRr1pYUpkNfG34RsNrC6FbgPv0VJtLsSRPqb1KRuEMaY84yXfEFFuamoj4Zgs7bxXB+EaL+gwisOP1+C5ItkbcmrYXHTSly/kgBdNt7X4TcbEB1leWIx+t0Eujv0nzrkAvU9i2wgbz07cxDRk0eZPc9yZL4EwOX7EvXrxxKVJRFq1EfjsjA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff85aae5-12ef-4025-df5e-08d8818a35b8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 12:56:28.2691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFywzmjlCUrc0RPZEuhyJzsZq/kUk+1godhACB+1jpfWqNEdV9Obta9o4e7lFhfD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2353
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>, Brian Paul <brianp@vmware.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDUuMTEuMjAgdW0gMTM6NTAgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFRodSwgTm92
IDA1LCAyMDIwIGF0IDAxOjI5OjUwUE0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDA1LjExLjIwIHVtIDEwOjExIHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+IE9uIFRodSwg
Tm92IDUsIDIwMjAgYXQgOTowMCBBTSBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+IHdyb3RlOgo+Pj4+IEFtIDA0LjExLjIwIHVtIDE3OjUwIHNjaHJpZWIgRGFuaWVs
IFZldHRlcjoKPj4+Pj4gUmFuZG9tIG9ic2VydmF0aW9uIHdoaWxlIHRyeWluZyB0byByZXZpZXcg
Q2hyaXN0aWFuJ3MgcGF0Y2ggc2VyaWVzIHRvCj4+Pj4+IHN0b3AgbG9va2luZyBhdCBzdHJ1Y3Qg
cGFnZSBmb3IgZG1hLWJ1ZiBpbXBvcnRzLgo+Pj4+Pgo+Pj4+PiBUaGlzIHdhcyBvcmlnaW5hbGx5
IGFkZGVkIGluCj4+Pj4+Cj4+Pj4+IGNvbW1pdCA1OGFhNjYyMmQzMmFmN2QyYzA4ZDQ1MDg1ZjQ0
YzU0NTU0YTE2ZWQ3Cj4+Pj4+IEF1dGhvcjogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2
bXdhcmUuY29tPgo+Pj4+PiBEYXRlOiAgIEZyaSBKYW4gMyAxMTo0NzoyMyAyMDE0ICswMTAwCj4+
Pj4+Cj4+Pj4+ICAgICAgICBkcm0vdHRtOiBDb3JyZWN0bHkgc2V0IHBhZ2UgbWFwcGluZyBhbmQg
LWluZGV4IG1lbWJlcnMKPj4+Pj4KPj4+Pj4gICAgICAgIE5lZWRlZCBmb3Igc29tZSB2bSBvcGVy
YXRpb25zOyBtb3N0IG5vdGFibHkgdW5tYXBfbWFwcGluZ19yYW5nZSgpIHdpdGgKPj4+Pj4gICAg
ICAgIGV2ZW5fY293cyA9IDAuCj4+Pj4+Cj4+Pj4+ICAgICAgICBTaWduZWQtb2ZmLWJ5OiBUaG9t
YXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4+Pj4+ICAgICAgICBSZXZpZXdl
ZC1ieTogQnJpYW4gUGF1bCA8YnJpYW5wQHZtd2FyZS5jb20+Cj4+Pj4+Cj4+Pj4+IGJ1dCB3ZSBk
byBub3QgaGF2ZSBhIHNpbmdsZSBjYWxsZXIgb2YgdW5tYXBfbWFwcGluZ19yYW5nZSB3aXRoCj4+
Pj4+IGV2ZW5fY293cyA9PSAwLiBBbmQgYWxsIHRoZSBnZW0gZHJpdmVycyBkb24ndCBkbyB0aGlz
LCBzbyBhbm90aGVyCj4+Pj4+IHNtYWxsIHRoaW5nIHdlIGNvdWxkIHN0YW5kYXJkaXplIGJldHdl
ZW4gZHJtIGFuZCB0dG0gZHJpdmVycy4KPj4+Pj4KPj4+Pj4gUGx1cyBJIGRvbid0IHJlYWxseSBz
ZWUgYSBuZWVkIGZvciB1bmFtcF9tYXBwaW5nX3JhbmdlIHdoZXJlIHdlIGRvbid0Cj4+Pj4+IHdh
bnQgdG8gaW5kaXNjcmltaW5hdGVseSBzaG9vdCBkb3duIGFsbCBwdGVzLgo+Pj4+IE5BSywgd2Ug
dXNlIHRoaXMgdG8gZGV0ZXJtaW5lIGlmIGEgcGFnZXMgYmVsb25ncyB0byB0aGUgZHJpdmVyIG9y
IG5vdCBpbgo+Pj4+IGFtZGdwdSBmb3IgZXhhbXBsZS4KPj4+Pgo+Pj4+IE1vc3RseSB1c2VkIGZv
ciBkZWJ1Z2dpbmcsIGJ1dCBJIHdvdWxkIHJlYWxseSBsaWtlIHRvIGtlZXAgdGhhdC4KPj4+IENh
biB5b3UgcGxzIHBvaW50IG1lIGF0IHRoYXQgY29kZT8gQSBxdWljayBncmVwIGhhc24ndCByZWFs
bHkgZm91bmQgbXVjaCBhdCBhbGwuCj4+IFNlZSBhbWRncHVfaW9tZW1fcmVhZCgpIGZvciBhbiBl
eGFtcGxlOgo+IFdoeSBkbyB5b3UgcmVqZWN0IHRoaXM/CgpXaGVuIElPTU1VIGlzIGRpc2FibGVk
IG9yIHVzZXMgYW4gMSB0byAxIG1hcHBpbmcgd2Ugd291bGQgb3RoZXJ3aXNlIGdpdmUgCnRoZSBz
YW1lIGFjY2VzcyBhcyAvZGV2L21lbSB0byBzeXN0ZW0gbWVtb3J5IGFuZCB0aGF0IGlzIGZvcmJp
ZGRlbi4gQnV0IAphcyBJIG5vdGVkIHRoaXMgaXMganVzdCBmb3IgdGhlIGRlYnVnZnMgZmlsZS4K
CldoZW4gSSB0cmllZCBhIGZldyB5ZWFycyBhZ28gdG8gbm90IHNldCB0aGUgcGFnZS0+bWFwcGlu
ZyBJIGltbWVkaWF0ZWx5IApyYW4gaW50byBpc3N1ZXMgd2l0aCBvdXIgZXZpY3Rpb24gdGVzdC4g
U28gSSB0aGluayB0aGF0IHRoaXMgaXMgdXNlZCAKZWxzZXdoZXJlIGFzIHdlbGwuCgpSZWdhcmRz
LApDaHJpc3RpYW4uCgo+Cj4gSWYgdGhpcyBpcyB0byBhdm9pZCBpc3N1ZXMgd2l0aCB1c2VycHRy
LCB0aGVuIEkgdGhpbmsgdGhlcmUncyBhIHNpbXBsZQo+IHRyaWNrOgo+IC0gZ3JhYiBwYWdlIHJl
ZmVyZW5jZQo+IC0gcmVjaGVjayB0aGF0IHRoZSBpb3ZhIHN0aWxsIHBvaW50cyBhdCB0aGUgc2Ft
ZSBhZGRyZXNzCj4gLSBkbyByZWFkL3dyaXRlLCBzYWZlIGluIHRoZSBrbm93bGVkZ2UgdGhhdCB0
aGlzIHBhZ2UgY2Fubm90IGJlIHJldXNlZCBmb3IKPiAgICBhbnl0aGluZyBlbHNlCj4gLSBkcm9w
IHBhZ2UgcmVmZXJlbmNlCj4KPiBPZiBjb3Vyc2UgdGhpcyBjYW4gc3RpbGwgcmFjZSBhZ2FpbnN0
IGlvdmEgdXBkYXRlcywgYnV0IHRoYXQgc2VlbXMgdG8gYmUgYQo+IGZ1bmRhbWVudGFsIHBhcnQg
b2YgeW91ciBkZWJ1ZyBpbnRlcmZhY2UgaGVyZS4KPgo+IE9yIGFtIEkgbWlzc2luZyBzb21ldGhp
bmc/Cj4KPiBKdXN0IHBvbmRlcmluZyB0aGlzIG1vcmUgc2luY2Ugc2V0dGluZyB0aGUgcGFnZS0+
bWFwcGluZyBwb2ludGVyIGZvciBqdXN0Cj4gdGhpcyBzZWVtcyBzb21ld2hhdCB3aWxkIGFidXNl
IG9mIC0+bWFwcGluZyBzZW1hbnRpY3MgOi0pCj4gLURhbmllbAo+Cj4+PiAgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGlmIChwLT5tYXBwaW5nICE9IGFkZXYtPm1tYW4uYmRldi5kZXZf
bWFwcGluZykKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiAtRVBFUk07Cj4+IENocmlzdGlhbi4KPj4KPj4+IC1EYW5pZWwKPj4+Cj4+Pj4g
Q2hyaXN0aWFuLgo+Pj4+Cj4+Pj4+IENjOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZt
d2FyZS5jb20+Cj4+Pj4+IENjOiBCcmlhbiBQYXVsIDxicmlhbnBAdm13YXJlLmNvbT4KPj4+Pj4g
U2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4+
Pj4+IENjOiBDaHJpc3RpYW4gS29lbmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+Pj4+
IENjOiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgo+Pj4+PiAtLS0KPj4+Pj4gICAgIGRy
aXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMgfCAxMiAtLS0tLS0tLS0tLS0KPj4+Pj4gICAgIDEg
ZmlsZSBjaGFuZ2VkLCAxMiBkZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5j
Cj4+Pj4+IGluZGV4IDg4NjFhNzRhYzMzNS4uNDM4ZWE0M2ZkOGMxIDEwMDY0NAo+Pj4+PiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jCj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX3R0LmMKPj4+Pj4gQEAgLTI5MSwxNyArMjkxLDYgQEAgaW50IHR0bV90dF9zd2Fw
b3V0KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX3R0ICp0dG0pCj4+Pj4+
ICAgICAgICAgcmV0dXJuIHJldDsKPj4+Pj4gICAgIH0KPj4+Pj4KPj4+Pj4gLXN0YXRpYyB2b2lk
IHR0bV90dF9hZGRfbWFwcGluZyhzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwgc3RydWN0IHR0
bV90dCAqdHRtKQo+Pj4+PiAtewo+Pj4+PiAtICAgICBwZ29mZl90IGk7Cj4+Pj4+IC0KPj4+Pj4g
LSAgICAgaWYgKHR0bS0+cGFnZV9mbGFncyAmIFRUTV9QQUdFX0ZMQUdfU0cpCj4+Pj4+IC0gICAg
ICAgICAgICAgcmV0dXJuOwo+Pj4+PiAtCj4+Pj4+IC0gICAgIGZvciAoaSA9IDA7IGkgPCB0dG0t
Pm51bV9wYWdlczsgKytpKQo+Pj4+PiAtICAgICAgICAgICAgIHR0bS0+cGFnZXNbaV0tPm1hcHBp
bmcgPSBiZGV2LT5kZXZfbWFwcGluZzsKPj4+Pj4gLX0KPj4+Pj4gLQo+Pj4+PiAgICAgaW50IHR0
bV90dF9wb3B1bGF0ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKPj4+Pj4gICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3QgdHRtX3R0ICp0dG0sIHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAq
Y3R4KQo+Pj4+PiAgICAgewo+Pj4+PiBAQCAtMzIwLDcgKzMwOSw2IEBAIGludCB0dG1fdHRfcG9w
dWxhdGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCj4+Pj4+ICAgICAgICAgaWYgKHJldCkK
Pj4+Pj4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4+Pj4+Cj4+Pj4+IC0gICAgIHR0bV90
dF9hZGRfbWFwcGluZyhiZGV2LCB0dG0pOwo+Pj4+PiAgICAgICAgIHR0bS0+cGFnZV9mbGFncyB8
PSBUVE1fUEFHRV9GTEFHX1BSSVZfUE9QVUxBVEVEOwo+Pj4+PiAgICAgICAgIGlmICh1bmxpa2Vs
eSh0dG0tPnBhZ2VfZmxhZ3MgJiBUVE1fUEFHRV9GTEFHX1NXQVBQRUQpKSB7Cj4+Pj4+ICAgICAg
ICAgICAgICAgICByZXQgPSB0dG1fdHRfc3dhcGluKHR0bSk7CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
