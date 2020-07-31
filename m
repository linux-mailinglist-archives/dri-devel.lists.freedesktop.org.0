Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED73234662
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 15:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7071E6EA85;
	Fri, 31 Jul 2020 13:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E566E6EA85
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 13:00:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXsRrn1X9rHAWYH4TE0Z+h6W/L56NXJasnuUUg9fMiET1XFo/3aFtL7ICkjL78w9hMFYfXohnvL6YUEgSoZjnKjIsibdiz1fD8xzGHl75zrsNifWxo/Nn2t2YLYy1uXtQT3zPJSIuTWs6JEbA7IMdkX5xmcZhIv14j+28cBcEI17GxOjE1IxfnpoZej7hcAcnikspwjMP3XKlOvaW/bKqGpNR/F5EoMMyRDBl9cOTcjSRCM38VvTzxeT3vg4Ve96AgcVdcL1WZLDKfUdMkTBlrXeR/m4FrXJn41dC3bjGch2x7mC/upNASQZBnjIgCC+OoudHR3hhUcECjrOvJzong==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0oiVECV9RCNM5XsvW2bk7Akv2ozg7vS78WDlWipGXAM=;
 b=ZkmCXIdtavZ0UldEWB4HoVCl2qKFY9XY1D1O2ZhHlcRnkKIoilVKsT9kJFj/8mfe9BFoSGc4YqjgDF3lSCTAQYUuG7s7Uu98cMFFU7eWi59ojsaDit55dPjgKMsLE383RHkKVpctUHd5GmSL4t6L0qiz904+LNzDQOxOjUfqZVsKoYZnTxuQlEYUBL8YBhXfuiV+g67d4AM5W4IqQVg/gaiMhzLa4wigP7uPfQnm11N/s7GJwah3tFYJVQqkIW9Ml2QT70KcD5f2gd9v5m8IIFkDF7QhtgZM+NX6cAD3qAL+cTGz/r9UFX7BbDgCiupe/+OGMzMJ/vpDKuO+kelFkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0oiVECV9RCNM5XsvW2bk7Akv2ozg7vS78WDlWipGXAM=;
 b=U/rBmSgROZS+07lYaek5IQExuXhakcTDKDP5pkzAmZ77p2+KkE5LGA95HIrxVSEI2si+b+QEY2OCOVhGXMSNUw1NTs76vqV2ZCb+CDls4wu87/xPfzQxaELJW8x5W+BD2X79BrRV+NpcR45XX0DvCrtIfsRSZIFn0oNXei/S2nk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4109.namprd12.prod.outlook.com (2603:10b6:208:1d9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.25; Fri, 31 Jul
 2020 13:00:06 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 13:00:06 +0000
Subject: Re: [PATCH 04/49] drm/ttm: provide a driver-led init path for generic
 mm manager.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-5-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <65895c0f-5930-efba-4190-979e7fe50e81@amd.com>
Date: Fri, 31 Jul 2020 15:00:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200731040520.3701599-5-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR05CA0087.eurprd05.prod.outlook.com
 (2603:10a6:207:1::13) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR05CA0087.eurprd05.prod.outlook.com (2603:10a6:207:1::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.20 via Frontend Transport; Fri, 31 Jul 2020 13:00:05 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b64692aa-5f2e-4423-8584-08d83551a5b1
X-MS-TrafficTypeDiagnostic: MN2PR12MB4109:
X-Microsoft-Antispam-PRVS: <MN2PR12MB41098852D3576A1091ECC490834E0@MN2PR12MB4109.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f27Xlz8Rpp/zGqPL62MTGO/T8Nhb6lHVT7072Xr6Kvxq9czJ6iXaF3J2SbiGrNpmo7f7j0RSgxcyyzQh8lCLbYRIHWDAZ0qnEwoQ6KLQ1gJaDSnbh3rxMXo3mqCu5Be6eUvjdPQ2RjCkuuEjIz46bTMgOGbPv+EOwdqdKs7TRW7eTtbIlfrKov3VXkL+ClXd7M45rOu7hZis+mVmhSvK3YmqKBhShIT6pm7SEQbBXbcQ/tsduqon9bC427eVDvEzeDqhnCzSrXeuW3xutUwRGfST2bX1+PveSkooWzPenALFaEyvkuobFnfPxUa7Y6WVrmYGFJ7M41BsUGfxPvwUKAplWMC1MoecBBMjMyU4M2zjN2uA7gurQVSgq1QkSSIHU3As3GeQyaKn5LLRvl/kNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(36756003)(31696002)(52116002)(186003)(8936002)(16526019)(31686004)(2616005)(478600001)(8676002)(86362001)(6486002)(4326008)(5660300002)(2906002)(83380400001)(66476007)(66946007)(6666004)(66556008)(316002)(41533002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 2wMNM26b5Xq+KAKum5lyNUateoyNI0xT9/jO5RE1KjSIo0OG/mgIpBU/B/rFfsArCQwQWiPFkFEdJhvtqce2BmAMZ7ElBzWNgvMFms/EN9lWzs08nL/Hk8fPPuynQVw2YKLEaknzJyS0CXgeeeJZZCaXpw41lWU/Wrb+JUXrgA0xtGsv161PvK4YmtvqUoxGSl4ENLnjFXeQjO3DVXJmKU8LZeXiZ3HKn1DXskbiwJCYH7u5KitBndYqSfLb83h0e3/Tb6DFRMdULNfNK5nY9+WeqWozN4qBlCq0QX2jK7Q53AiHc9iJEZ2MTlicgr/kflpMLH6aKDP94o8BE/5XjEjn7bTOQNCOMzXZV9coBcUsXQmc2Wdh9FGPOewpd4Bkjau0L3qkdkwQgptrJU8ILjcnjgyHnEiXBLIWXyYoRvn0bJ0yz4TcrSZVrVm71gpnw8YVaBIpFi8bqU0NPCkJekEjtem71ovWQjP7mJPEybWL/G0PwJepcb6W34xgo77BpoCIp1nuoQL28aUeVc/7H5q/HRpr8IJyg3L+f1h32ugc1aYGYiOA6B4YebPj5W16
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b64692aa-5f2e-4423-8584-08d83551a5b1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 13:00:06.7489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mz9gNB3qsdsM5ZiHHommO0cRxuCe/CVBOg3PhGzS1EdJwPyl9+f1toiFcAW1LNU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4109
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
Cc: sroland@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzEuMDcuMjAgdW0gMDY6MDQgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhpcyBsZXRzIHRoZSBnZW5lcmljIG1tIG1h
bmFnZXIgYmUgaW5pdGlhbGlzZWQgYnkgdGhlIGRyaXZlci4KPgo+IFNpZ25lZC1vZmYtYnk6IERh
dmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvD
tm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvX21hbmFnZXIuYyB8IDIzICsrKysrKysrKysrKysrKysrKysrLS0tCj4gICBp
bmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oICAgICAgfCAgMyArKysKPiAgIDIgZmlsZXMg
Y2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib19tYW5hZ2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9ib19tYW5hZ2VyLmMKPiBpbmRleCBmYWNkMzA0OWMzYWEuLjY0MjM0ZTVjYWVlMyAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib19tYW5hZ2VyLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib19tYW5hZ2VyLmMKPiBAQCAtMTA0LDggKzEwNCw4
IEBAIHN0YXRpYyB2b2lkIHR0bV9ib19tYW5fcHV0X25vZGUoc3RydWN0IHR0bV9tZW1fdHlwZV9t
YW5hZ2VyICptYW4sCj4gICAJfQo+ICAgfQo+ICAgCj4gLXN0YXRpYyBpbnQgdHRtX2JvX21hbl9p
bml0KHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLAo+IC0JCQkgICB1bnNpZ25lZCBs
b25nIHBfc2l6ZSkKPiArc3RhdGljIGludCB0dG1fYm9fbWFuX2luaXRfcHJpdmF0ZShzdHJ1Y3Qg
dHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwKPiArCQkgICAgdW5zaWduZWQgbG9uZyBwX3NpemUp
Cj4gICB7Cj4gICAJc3RydWN0IHR0bV9yYW5nZV9tYW5hZ2VyICpybWFuOwo+ICAgCj4gQEAgLTEx
OSw2ICsxMTksMjMgQEAgc3RhdGljIGludCB0dG1fYm9fbWFuX2luaXQoc3RydWN0IHR0bV9tZW1f
dHlwZV9tYW5hZ2VyICptYW4sCj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4gICAKPiAraW50IHR0bV9i
b19tYW5faW5pdChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKPiArCQkgICAgc3RydWN0IHR0
bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4sCj4gKwkJICAgIHVuc2lnbmVkIGxvbmcgcF9zaXplKQo+
ICt7Cj4gKwlpbnQgcmV0Owo+ICsKPiArCW1hbi0+ZnVuYyA9ICZ0dG1fYm9fbWFuYWdlcl9mdW5j
Owo+ICsKPiArCXR0bV9ib19pbml0X21tX2Jhc2UoYmRldiwgbWFuLCBwX3NpemUpOwo+ICsJcmV0
ID0gdHRtX2JvX21hbl9pbml0X3ByaXZhdGUobWFuLCBwX3NpemUpOwo+ICsJaWYgKHJldCkKPiAr
CQlyZXR1cm4gcmV0Owo+ICsJdHRtX2JvX3VzZV9tbShtYW4pOwo+ICsJcmV0dXJuIDA7Cj4gK30K
PiArRVhQT1JUX1NZTUJPTCh0dG1fYm9fbWFuX2luaXQpOwo+ICsKPiAgIHN0YXRpYyBpbnQgdHRt
X2JvX21hbl90YWtlZG93bihzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbikKPiAgIHsK
PiAgIAlzdHJ1Y3QgdHRtX3JhbmdlX21hbmFnZXIgKnJtYW4gPSAoc3RydWN0IHR0bV9yYW5nZV9t
YW5hZ2VyICopIG1hbi0+cHJpdjsKPiBAQCAtMTQ3LDcgKzE2NCw3IEBAIHN0YXRpYyB2b2lkIHR0
bV9ib19tYW5fZGVidWcoc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4sCj4gICB9Cj4g
ICAKPiAgIGNvbnN0IHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlcl9mdW5jIHR0bV9ib19tYW5h
Z2VyX2Z1bmMgPSB7Cj4gLQkuaW5pdCA9IHR0bV9ib19tYW5faW5pdCwKPiArCS5pbml0ID0gdHRt
X2JvX21hbl9pbml0X3ByaXZhdGUsCj4gICAJLnRha2Vkb3duID0gdHRtX2JvX21hbl90YWtlZG93
biwKPiAgIAkuZ2V0X25vZGUgPSB0dG1fYm9fbWFuX2dldF9ub2RlLAo+ICAgCS5wdXRfbm9kZSA9
IHR0bV9ib19tYW5fcHV0X25vZGUsCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1f
Ym9fZHJpdmVyLmggYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCj4gaW5kZXggNjhl
NzVjM2I4YzdhLi41YzRjY2VmZDUzOTMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0
bV9ib19kcml2ZXIuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKPiBA
QCAtNzk5LDYgKzc5OSw5IEBAIGludCB0dG1fYm9fcGlwZWxpbmVfZ3V0dGluZyhzdHJ1Y3QgdHRt
X2J1ZmZlcl9vYmplY3QgKmJvKTsKPiAgICAqLwo+ICAgcGdwcm90X3QgdHRtX2lvX3Byb3QodWlu
dDMyX3QgY2FjaGluZ19mbGFncywgcGdwcm90X3QgdG1wKTsKPiAgIAo+ICtpbnQgdHRtX2JvX21h
bl9pbml0KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAo+ICsJCSAgICBzdHJ1Y3QgdHRtX21l
bV90eXBlX21hbmFnZXIgKm1hbiwKPiArCQkgICAgdW5zaWduZWQgbG9uZyBwX3NpemUpOwo+ICAg
ZXh0ZXJuIGNvbnN0IHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlcl9mdW5jIHR0bV9ib19tYW5h
Z2VyX2Z1bmM7Cj4gICAKPiAgICNlbmRpZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
