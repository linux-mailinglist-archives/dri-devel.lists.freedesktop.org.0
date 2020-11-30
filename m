Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 420902C8414
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 13:27:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761116E48E;
	Mon, 30 Nov 2020 12:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993FD6E48E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 12:27:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FEr/C84N8jh+A7csWEGEBFW1hlXIqqbTc0X/shg9AKJRhjxLhMyrPBiIq1I0mhALE+86DG48XKO0Mx6dEaHAL37fAm9+0hDJdZKeHe4gHntwUiBamCQznuuEpaCfd/YAOMr4on4n4/tNZLu+ASG72Zj8TkAPBCk+xJQF0/uOF36YmC4Qh1Q7kpJ0Ix5TX6ZCe5nsuiEWBhU1FHXNF2cJR+J/igc/vVGkIrhNhU6gACYVXGKVaxfof4Gsr3XCtMLim2sdw8zWyhYtf/I0rqte3Jy8PCd3sU7CJYJgvaLujKh56gQ5n/98GA8YFvRRUf1OKLrxb2dZWPMylCSmGJ5ixg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ft/IcS21h9xxK27oC/bdZhPtquuI4tZ3wNW1nfncjMk=;
 b=fqBCkxFNnjSLLgNaz13XTm4PenMAGIG9ocWSFoSApvGG036stcMMGY2Wzumkil8ATwx0FaYRuqbtOqSyzdHmaRLDmAWdfdMZEcBylY36FhKRK5Kt99Pz+GiMYPI+jkzAqML6KtvfnhLAxGGhgZZ+AAl/oTwPAph6juiHyTC7nZo+7LoN7sQw4Wh/x5HohkYL4478tl3slMsOMNwg6wC8dxYEu9sAB1Yxx1QxNv4ql5KQitT1JFsxxkt+3YfXWyoywc2hntiELs0eKKoU0KQZpu7XQoZaJZZHg/g3AUYUHNSroFlAbA6lokjve8tAg6SB4g8U0Py9ZmknHUnOi+hhjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ft/IcS21h9xxK27oC/bdZhPtquuI4tZ3wNW1nfncjMk=;
 b=rGdrsdxF5sHhQvbeYHQgfDqgPCWsHdpwPRJU+8bWEXydxWgZUv3UEL97nSahd5osmx5kl55p9Uwa7X+PFWBGzbhbmSD60OuKRDJkvETbOELYsxS1WPywJ4bPns+vhj0agV4DnSzQHopTo+n0Hs1lzc1wFKTXmIuFUdbwhUDDkwo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4095.namprd12.prod.outlook.com (2603:10b6:208:1d1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Mon, 30 Nov
 2020 12:27:07 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 12:27:07 +0000
Subject: Re: [PATCH 0/8] drm/vram-helper: Lock GEM BOs while they are mapped
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 hdegoede@redhat.com
References: <20201130120433.7205-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d72d446d-2bb0-0507-5fd3-168ed2aa76dd@amd.com>
Date: Mon, 30 Nov 2020 13:27:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201130120433.7205-1-tzimmermann@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM9P191CA0016.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM9P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21c::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Mon, 30 Nov 2020 12:27:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 711806b3-7dce-434b-d58f-08d8952b40a0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4095:
X-Microsoft-Antispam-PRVS: <MN2PR12MB409538A41234C394D4D4546683F50@MN2PR12MB4095.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AD3fgyBLKrtqOLUjwmSu+kbShZU1Cwo3bBhtoPk4crfubtqW99SWS63hyEbRPckscjsxFB9hbyyW3fTevDspOdxnpUoSv5nOCt4LG2Lz6jRrQKWZlWaEFK+V1km8/cMBHKtBE++lmPa+etjvbGx2I5JdXYLz/5/e26kXx6juFi6GjHjs5e6hu1NOEf8yfnw4moMDzaFzO1/plVmv+6cpUWK5GHETHQSimNSLkkC+Lgf/K1AOc3XJZz8OZ7UD97gMZ4OOJgrXthJk0B5GqL/zDZ597mejDSdzsldzXvc4IbrQIjzoHNZMoGx3S2OQkRR6S0RV0fZ9JowU0W1b2RlvFJOWxu3ERzftbJEe8geNLEQSxCbejUb/TRTSDnG5P5wq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(52116002)(16526019)(83380400001)(8936002)(186003)(66476007)(66946007)(31686004)(66556008)(6666004)(6486002)(316002)(4326008)(478600001)(86362001)(36756003)(8676002)(31696002)(5660300002)(2906002)(66574015)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bG9jNU1NM0ZLRHVRUFR1R3VVckd3a0o0ZnFVWDlpeG83Rk5SVlcwdTNCbGx1?=
 =?utf-8?B?U2ZrTEZmTG5tWktsMUlXWStFR05WckZ6azBNVUI5RXBYTVpJZ1JxMzNqSWJC?=
 =?utf-8?B?QkhUSmFEeG90bDJ4ZW5QeEVxbjJRc2lVY3pucWZPQmI5ajZwWWEwclJsZzdL?=
 =?utf-8?B?RHlQODcvN0dZV1ZMU2NxRHpPRWpweDQydVNPUVlxQ25mOHhEc0krem8yU0M4?=
 =?utf-8?B?bk9sdWNUdEVFR1hldkNYQytjamtsTWlBc0ZSeDF4N2ZMUEVpdlduVmg4b1cw?=
 =?utf-8?B?cjlFSjBXcFBJL1h3My8wdXJmTEgzcHgwa1k2MlBmOXkzeVNZOFFtTm5pdjFm?=
 =?utf-8?B?SnRSZ2c3aVlnRWtYNkxzc3pUdC9sUktUY3NTVU4wZC9YcXdxNzZBWGo5V1Fj?=
 =?utf-8?B?WU4rZHFhaGhkbm9UcENTeHIybVRlb0dIVVVpeXE2SFoxa1hHRkJkaDRVY0gx?=
 =?utf-8?B?VzdudGhFT1dUL1hFU3h6bkx5dW01VWY0clBkcGZwZC9tK1FmaC9sbG42SXhC?=
 =?utf-8?B?alovOWlJNHdtMm5QaDB6VHdnR3RFbzYrOGsvVmt1aVpMVXZaa2JIbk1BdUdH?=
 =?utf-8?B?RnhpOGErZlgycjRuQ1ViMGdpNytGbXVHNTV4Y280WHNlU2xxTW5nWW1lWjZp?=
 =?utf-8?B?OVR4Q2FwcEJBZ2ZpMEVzdXlSVVB2RkM5clpnN3dmU2Q1Mkpwa3dtSXBheGxu?=
 =?utf-8?B?MzFyWkN0UjZ5QjB1SnZqTndiVG9hZy9CV0o1azd5WmtjQ2REWGVwdXpnMHBs?=
 =?utf-8?B?N29wdTBZYmR0aW15OTlNeFdiSFRITlV2aGFhazdxd3dHeStzNXJsSG9GVHBN?=
 =?utf-8?B?ckliWFc2VGJyRlhUSGJjY0ZvNi9tVHFqU0ViOTlGTXpjYWt1SWRRSzhVdE1N?=
 =?utf-8?B?c2NaQjJCMll6Z3VNMVdoTG1vZ3lQdGFuaUtEWGdHZ1pyeHFBRUVycXI5N2Jz?=
 =?utf-8?B?ZGZualIxY2hPSGZRZTFSUkVhem1qeUduL0I3QXl6VStDSzdBTVphckp6UkNn?=
 =?utf-8?B?TENNWjN3NktIUThDeE1vcWYzVzVEM01tdk16UUkyWGZtSFJWVUlhSEtLaGcw?=
 =?utf-8?B?SWJSTjVqS2JyZUs2Mm9OU1AxY3JseVN4WUZ4OFZCdGVZbXp0S0J3TGtEYzJB?=
 =?utf-8?B?NWJuNlBCelBXRmlGL1cyeExKSGJ2ZjIxcGhtb1pvSDdLLzg2ZWYyQ1NkSDk0?=
 =?utf-8?B?QTE1OHNrRjRjSzk2bWVOZkpUd01yWFF2alJBSW9SbkZ2TmtMemNKR3dqODN0?=
 =?utf-8?B?VUY2WndBRExaazc5UmhIRCtPaG5Ya1lUSVNMSTNNQWl0cFkyRk43RGFLQlRx?=
 =?utf-8?B?cklLZXA2ZlZkVXIzSURXenlNak9HclErcFJseEJLMFpSRXA5QWxJT1FkcVor?=
 =?utf-8?B?Y1A2cnV0RUV5SThJM1BUcEdnc3k3UUJXQzUrbUtEY2VENXMzOXNWakJrcUo3?=
 =?utf-8?Q?3WkeD+92?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 711806b3-7dce-434b-d58f-08d8952b40a0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 12:27:07.5698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +hVgDA+ELFW1HPRg8go1481Kd9nfS3vij7FxaofDuoKSYzLJ9X+TWtOtSP0Pla3m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4095
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzAuMTEuMjAgdW0gMTM6MDQgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBHRU0gVlJB
TSBoZWxwZXJzIHVzZWQgdG8gcGluIHRoZSBCTyBpbiB0aGVpciBpbXBsZW1lbnRhdGlvbiBvZiB2
bWFwLCBzbwo+IHRoYXQgdGhleSBjb3VsZCBub3QgYmUgcmVsb2NhdGVkLiBJbiBhIHJlY2VudCBk
aXNjdXNzaW9uLCBbMV0gaXQgYmVjYW1lCj4gY2xlYXIgdGhhdCB0aGlzIGlzIGluY29ycmVjdCBh
bmQgdGhhdCB2bWFwIHNob3VsZCByYXRoZXIgcmVwZW5kIG9uIHRoZQo+IHJlc2VydmF0aW9uIGxv
Y2sgdG8gcHJldmVudCByZWxvY2F0aW9uLiBUaGlzIHBhdGNoc2V0IGFkZHJlc3NlcyB0aGUgaXNz
dWUuCj4gQmVzaWRlcyB0aGUgdnJhbSBoZWxwZXJzLCB0aGlzIGFmZmVjdHMgYXN0LCB2Ym94dmlk
ZW8gYW5kIHRoZSBnZW5lcmljCj4gZmJkZXYgZW11bGF0aW9uLgo+Cj4gUGF0Y2ggMSBhZGRzIGEg
ZmV3IG1vcmUgcnVsZXMgdG8gdm1hcCBpbnRlcm5mYWNlcy4gV2l0aCBWUkFNLCBpdCBpcwo+IG5l
Y2Vzc2FyeSB0byBrZWVwIHRoZSBCTyBldmljdGFibGUsIHdoaWNoIHJlcXVpcmVzIHNvZW0gY2Fy
ZSB3aGVuIG1hcHBpbmcKPiB0aGUgbWVtb3J5LiBQYXRjaCAyIGNoYW5nZXMgYXN0J3MgY3Vyc29y
IGNvZGUgYWNjb3JkaW5nbHkuCj4KPiBQYXRjaCAzIGFkZHMgdnJhbSBoZWxwZXJzIHRoYXQgYWNx
dWlyZXMgdGhlIHJlc2VydmF0aW9uIGxvY2sgYW5kIHZtYXAgdGhlCj4gbWVtb3J5IGJ1ZmZlci4g
U2FtZSBmb3IgdnVubWFwIGluIHJldmVyc2UuIFBhdGNoZXMgNCBhbmQgNSBjb252ZXJ0IGFzdAo+
IGFuZCB2Ym94dmlkZW8gdG8gdGhlIG5ldyBoZWxwZXIuCj4KPiBQYXRjaCA2IHJlbW92ZXMgcGlu
bmluZyBhbmQgbG9ja2luZyBmcm9tIFZSQU0gaGVscGVyJ3Mgdm1hcCBhbmQgdnVubWFwLgo+IFRo
ZSBhZmZlY3RlZCB1c2VycyBpbiBhc3QgYW5kIGZiZGV2IGVtdWxhdGlvbiBhY3F1aXJlIHRoZSBy
ZXNlcnZhdGlvbgo+IGxvY2tzIG9mIHRoZSBHRU0gb2JqZWN0cyBiZWZvcmUgdm1hcHBpbmcgQk9z
LiBWUkFNIGhlbHBlcnMgZG9uJ3Qgc3VwcG9ydAo+IHRvIGV4cG9ydCB0aGUgYnVmZmVyLCBzbyB0
aGVyZSBhcmUgbm8gb3RoZXIgdXNlcnMgb2YgdGhlc2UgZnVuY3Rpb25zLgo+Cj4gVGhlIHRoZSBw
aW5uaW5nIGFuZCBsb2NraW5nIHJlbW92ZWQsIHZtYXAgY2FuIGJlIHNpbXBsaWZpZWQgYXMgZG9u
ZSBpbgo+IHBhdGNoZXMgNyBhbmQgOC4KPgo+IFRlc3RlZCBvbiBhc3Qgd2l0aCBHRU0gVlJBTSBh
bmQgYWxzbyBvbiBtZ2FnMjAwIHRvIHZlcmlmeSB0aGF0IHRoZSBmYmRldgo+IGNoYW5nZSBkb2Vz
IG5vdCBpbnRlcmZlcmUgd2l0aCBHRU0gU0hNRU0uCgpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiBmb3IgdGhlIHNlcmllcy4KCj4KPiBUaG9tYXMg
WmltbWVybWFubiAoOCk6Cj4gICAgZHJtL2dlbTogV3JpdGUgZG93biBzb21lIHJ1bGVzIGZvciB2
bWFwIHVzYWdlCj4gICAgZHJtL2FzdDogT25seSBtYXAgY3Vyc29yIEJPcyBkdXJpbmcgdXBkYXRl
cwo+ICAgIGRybS92cmFtLWhlbHBlcjogUHJvdmlkZSBkcm1fZ2VtX3ZyYW1fdm1hcF91bmxvY2tl
ZCgpCj4gICAgZHJtL2FzdDogVXNlIGRybV9nZW1fdnJhbV92bWFwX3VubG9ja2VkKCkgaW4gYXN0
X2N1cnNvcl9zaG93KCkKPiAgICBkcm0vdmJveHZpZGVvOiBVc2UgZHJtX2dlbV92cmFtX3ZtYXBf
dW5sb2NrZWQoKSBpbiBjdXJzb3IgdXBkYXRlCj4gICAgZHJtL3ZyYW0taGVscGVyOiBSZW1vdmUg
cGlubmluZyBhbmQgbG9ja2luZyBmcm9tIGRybV9nZW1fdnJhbV92bWFwKCkKPiAgICBkcm0vdnJh
bS1oZWxwZXI6IFJlbW92ZSB2bWFwIHJlZmVyZW5jZSBjb3VudGluZwo+ICAgIGRybS92cmFtLWhl
bHBlcjogU2ltcGxpZnkgdm1hcCBpbXBsZW1lbnRhdGlvbgo+Cj4gICBkcml2ZXJzL2dwdS9kcm0v
YXN0L2FzdF9jdXJzb3IuYyAgICAgIHwgIDYzICsrKysrKysrKy0tLS0tLS0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9hc3QvYXN0X2Rydi5oICAgICAgICAgfCAgIDIgLQo+ICAgZHJpdmVycy9ncHUvZHJt
L2RybV9jbGllbnQuYyAgICAgICAgICB8ICAzMSArKysrKysrKwo+ICAgZHJpdmVycy9ncHUvZHJt
L2RybV9mYl9oZWxwZXIuYyAgICAgICB8ICAxMCArKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1f
Z2VtX3ZyYW1faGVscGVyLmMgfCAxMDEgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyAgICAgICAgICAgfCAgIDYgKysKPiAgIGRyaXZlcnMv
Z3B1L2RybS92Ym94dmlkZW8vdmJveF9tb2RlLmMgfCAgIDcgKy0KPiAgIGluY2x1ZGUvZHJtL2Ry
bV9jbGllbnQuaCAgICAgICAgICAgICAgfCAgIDIgKwo+ICAgaW5jbHVkZS9kcm0vZHJtX2dlbS5o
ICAgICAgICAgICAgICAgICB8ICAxNiArKysrCj4gICBpbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1f
aGVscGVyLmggICAgIHwgIDIxICsrLS0tLQo+ICAgMTAgZmlsZXMgY2hhbmdlZCwgMTU5IGluc2Vy
dGlvbnMoKyksIDEwMCBkZWxldGlvbnMoLSkKPgo+IC0tCj4gMi4yOS4yCj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
