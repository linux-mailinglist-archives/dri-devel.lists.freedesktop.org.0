Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A389B26C37B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 16:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A055C6E116;
	Wed, 16 Sep 2020 14:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C2D6E101;
 Wed, 16 Sep 2020 14:02:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5uXD5gloheWGvZ7mIrq9hZi/un9U/UekFRPn5JgEV/MZHLObCHTHcm7kieuNDvlikSHZ+47WUH1VwETtziKEyoiGxTVYP8joxLEQTC9LMi9kis72YSuX3a4y+6mB8pWLxEjf+8Lc24E/x0O2NZIKOoHfzm+mktw86iAWP+a//TLXw1KEZeFYP010npeV3NSSPOhCu7otkeObewMwmpduWxFV1pxAYHY3M6ub/n6vDIRCVOH1v42T/mW/1/EkohCNwClctt5EItUARWN9JLhuHfgiP72Pje54j34Pgkqgn+H8h6J9IWOupkU9EMuJDzS2UASOpBmrroJhLYnYqjEBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6i4M3Y98dT/bIFGmBVsAJ2ZCrfwrHbqEANpbxHP12M=;
 b=arvRfW9Uo8LsInmV6ZHeenuoDednJMmp7A+joZ5zTNSUnfyar9QVSpYPwgC3AsKC9A7+IUx2OuZAcjOTJtdXTMsQUkZIk0XSnkVqNiaP4Jt6YMuL/Ql8tCdXANvVGu0BliGwPJzSsLS/MSme45vLmfMoO1348VuktxIdffSwRd05FuS/Ut5/2jg9zoUENV5CAx1j2XWDU0sPBgN+M0jaMx+f/3LZUYQlj+QB1M89PcT6XnWQEjLXfFZNH1TAIIGwPtehnUSIzk8Cz8ZT3w1MKhO4E2XGQ0+SByZ4ccP2AM4s2IaBOPRc064gmLtVPTYbvfSmSdGZrWay6Qcub32rJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6i4M3Y98dT/bIFGmBVsAJ2ZCrfwrHbqEANpbxHP12M=;
 b=lQNKsq04zLjF8omVe9UPXJ5HaLA6L+4hx5zWpbSeoANX+TuSCkpDBqGQ+dUqY1bdekoCNXF5eBZuqe9AvypNRkWXvY31Cbqt6rTWklhKbQWsnZlEcH05SVrVd3LXARIm9iVDFpLQbqYOAARNrrxiJgMrXVIXEuRYNT6JNmzBjZw=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4333.namprd12.prod.outlook.com (2603:10b6:208:1d3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 14:02:25 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 14:02:25 +0000
Subject: Re: [PATCH -next 0/8] drm/amd/amdgpu: fix comparison pointer to bool
 warning
To: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 yi.zhang@huawei.com, Dave Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Zheng Bin <zhengbin13@huawei.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>
References: <20200909130720.105234-1-zhengbin13@huawei.com>
 <1fce0f2a-3777-e6d8-5a09-30261f843cfd@amd.com>
 <CADnq5_NoeFbBAMT6s_ictVXsUc2tx1U48MLxnMbAr2Sd58jyYA@mail.gmail.com>
 <20200915193549.GP6112@intel.com>
 <6658f89f-6957-e6ea-af41-7625f1fd3cb1@gmail.com>
 <20200916075156.GU438822@phenom.ffwll.local>
 <CADnq5_OS814FxmadZ9yBkrY6ije8h7FxswWstsxNr3rw=Bum=Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <372d7001-22cc-79b6-83b8-2fd75a1804d5@amd.com>
Date: Wed, 16 Sep 2020 16:02:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CADnq5_OS814FxmadZ9yBkrY6ije8h7FxswWstsxNr3rw=Bum=Q@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0096.eurprd02.prod.outlook.com
 (2603:10a6:208:154::37) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0096.eurprd02.prod.outlook.com (2603:10a6:208:154::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend
 Transport; Wed, 16 Sep 2020 14:02:23 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9835b93b-f5a3-4763-1501-08d85a49238e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB433375C47EE718796C17C55D83210@MN2PR12MB4333.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:220;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qgan8c80YOdAw+aoSXeEhtTYvTsnzMbVDe4bheFpkh1m0l5qOJW3Lq50nPmEZ8FlSVYIPbMEPSBsujo7/8B8Ehi8XiX97Lb5wIhfVh8o20hhPeivr2j7C6387w4gRYPBK/6u9ugaWb8P2KL//nplp4mNzzjt5A1+16iftz6ytnnMjaBWCnObBMSKjNZaODiLdV1XQmCgGnAv+KHRHFOfy+898hMNlKaFYaQdvuZi2KUPkH+GEb/5KlFNL2PcpUn7zDzENNdXM+3uMrJr8DZgWgQremvxbLMyr1M8cgVnRon2QsFdhozPuPRbwC97gy0gQS+OLXOsnC+c9Ndm3cyJdLj8EXsyH6Zod/uDAZy4J0lAfkJ0Zi/4mcdhqDVBVIseXsOqmdTdbtM7UycwJKO9udTRHi4C2hGVvaMo2C5O0qu1+r1RvgZR2Moym4oPUbnYLd2J21QYPlHecAuGD+KV2LIkbAt5g9JTJKi6yD9v/qQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(66574015)(8676002)(8936002)(316002)(36756003)(66946007)(52116002)(16526019)(2906002)(66476007)(110136005)(31686004)(53546011)(186003)(66556008)(83380400001)(86362001)(31696002)(2616005)(966005)(6636002)(5660300002)(6666004)(6486002)(45080400002)(478600001)(83080400001)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 3zo8Ss5KdFRZu0nzOf3tUeJ2fSFsBLQkvqKgzOy6Jmrj7VHegO1ZN/tPoSsSPZCFSm+HHKuS5YZMwHIYmrF66bWOx68Sukg8GRwl2d9FryDra/WHESbMiPhoVauarbQYZTC20HR7o5LoT38fzbbI+KbhwXAJYnD3GBbq9x9aAaYDsMUGBGz5QsPWuI+udXT8c4o6Lq0n0F/SQtNhpj8cJqw8pzZBJoQR17Jmj00fhtT5mbX2xBfZoWrly5gdbV30c97APy/5M0iwk9PU05rNuEY7BSOpbqpn3nDA3SA6A+cNMllHeYxDONUv/NRedK+hFjxmfxJ152PUbqaJBMZEq5u4y1qKa8mgkZkZZ16yQKUxR85SE3pRetQYg5lTvpupzV2aAl5bi4LOx3E21R05QTsdoUPhcT60aEZso24UBDJ1XV0h6eePJR48Ek6Lhuqscph+caAxrEOmAepcWBMgjEWrmiJ3jj7Po1KSWaCsvMBLOcKK/7W/06e42b+T6Wi2wxZs7rLgOxR390ievMyx731r3eZdjJJOx/b7XZ5T4jqyLebWEGvfJjivHfcWwRikiHnOe5j7YS8wJG3P+L4IVXvjByu9cyZh4rlyShkraV3re2Vo7fJXpNBpspijoiVdYkbcCgpActIIoBd9Xarphc847qhdqvVolXp3K2CMOKbGk6zw9fpzoRYd5T/mLc+DBjHw1hNhKL2lILapcIHh4A==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9835b93b-f5a3-4763-1501-08d85a49238e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 14:02:25.0910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: we3glLyzfZGwwUYFKRyV7RI7OLnYlPgAdNPdeJ1dS9Yw6kW9yxqsprBWpFem2Wfm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4333
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTYuMDkuMjAgdW0gMTU6MzYgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gT24gV2VkLCBTZXAg
MTYsIDIwMjAgYXQgMzo1MSBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyb3Rl
Ogo+PiBPbiBXZWQsIFNlcCAxNiwgMjAyMCBhdCAwOTozODozNEFNICswMjAwLCBDaHJpc3RpYW4g
S8O2bmlnIHdyb3RlOgo+Pj4gQW0gMTUuMDkuMjAgdW0gMjE6MzUgc2NocmllYiBWaWxsZSBTeXJq
w6Rsw6Q6Cj4+Pj4gT24gVHVlLCBTZXAgMTUsIDIwMjAgYXQgMDM6MTY6MzJQTSAtMDQwMCwgQWxl
eCBEZXVjaGVyIHdyb3RlOgo+Pj4+PiBJIHF1ZXN0aW9uIHRoZSB2YWx1ZSBvZiB0aGVzZSB3YXJu
aW5ncy4gIFdoeSBldmVuIGhhdmUgYSBib29sZWFuIHR5cGUKPj4+Pj4gaWYgeW91IGFyZSBnb2lu
ZyB0byBnZXQgd2FybmluZ3Mgd2hlbiB5b3UgdXNlIHRoZW0uLi4KPj4+Pj4gVGhhdCBzYWlkLCBh
cHBsaWVkIHRvIGF2b2lkIGdldHRpbmcgdGhlc2UgcGF0Y2hlcyBhZ2FpbiBhbmQgYWdhaW4KPj4+
Pj4gZXZlcnkgdGltZSBzb21lb25lIHNlZXMgdGhpcy4KPj4+PiBpZiAodGhpc19pc19zcGFydGEp
Cj4+Pj4gaWYgKHRoaXNfaXNfc3BhcnRhID09IHRydWUpCj4+Pj4gaWYgKHRoaXNfaXNfc3BhcnRh
ICE9IGZhbHNlKQo+Pj4+Cj4+Pj4gSSB0aGluayB0aGUgZmlyc3Qgb25lIHJlYWRzIHRoZSBiZXN0
LCBhbmQgYXZvaWRzIGhhdmluZyB0bwo+Pj4+IGRlY2lkZSBiZXR3ZWVuIHRydXRoIGFuZCBmYWxz
ZWhvb2QgOikKPj4+ICsxCj4+ICsxLCBlc3BlY2lhbGx5IGJlY2F1c2Ugd2UgYWxzbyBoYXZlIHRo
ZSBpbnZlcnNpb24gd2hlbiB1c2luZyBuZWdhdGl2ZQo+PiBlcnJubyBjb2RlcyBmb3IgZmFpbHVy
ZXMgYW5kIDAgYXMgc3VjY2Vzcywgd2hpY2ggcmVzdWx0cyBpbgo+Pgo+PiAgICAgICAgICBpZiAo
ZXJybm8gPT0gMCkgLyogc3VjY2VzcyBjYXNlICovCj4+Cj4+IGJ1dAo+PiAgICAgICAgICBpZiAo
Ym9vbCA9PSAwKSAvKiBmYWlsdXJlIGNhc2UgKi8KPj4KPj4gbm93IGNyZWF0aXZlIHBlb3BsZSBk
byBzb21ldGltZXMKPj4KPj4gICAgICAgICAgaWYgKCFlcnJubykgLyogc3VjY2VzcyBjYXNlICov
Cj4+Cj4+IHdoaWNoIEkgdGhpbmsgaXMgaG9ycmlibHkgY29uZnVzaW5nLiBTbyBpbW8gZm9yIG1v
cmUgZWFzaWVyIHRlbGxpbmcgYXBhcnQKPj4gb2YgdGhlc2UgdG9vIEkgdGhpbmsgY29uc2lzdGVu
dGx5IHVzaW5nIHRoZSBzaG9ydCBmb3JtIGZvciBib29sZWFucywgYW5kCj4+IGNvbnNpc3RlbnRs
eSB1c2luZyB0aGUgbW9yZSBleHBsaWNpdCBsb25nIGZvcm0gZm9yIGVycm5vIGNoZWNrcyBpcyBh
IFZlcnkKPj4gR29vZCBQYXR0ZXJuIDotKQo+IEkgZG9uJ3QgZGlzYWdyZWUgd2l0aCB5b3VyIGxv
Z2ljLCBidXQgd2UgcmVndWxhcmx5IGdldCBwYXRjaGVzIHRvCj4gY29udmVydCBlcnJubyBjaGVj
a3MgdG8gZHJvcCB0aGUgZGlyZWN0IGNvbXBhcmlzb24gYmVjYXVzZSB0aGF0IGlzIHRoZQo+ICJw
cmVmZXJyZWQga2VybmVsIHN0eWxlIi4gIEFyZ3VhYmx5LCB3ZSBzaG91bGQgYmUgZXhwbGljaXQg
aW4gYWxsCj4gY2FzZXMgYXMgdGhhdCBhdm9pZHMgYWxsIGNvbmZ1c2lvbi4gIFdpdGggdGhhdCBp
biBtaW5kLCBteSBvcmlnaW5hbAo+IHBvaW50IHN0YW5kcy4gIFdoeSBoYXZlIGEgdHlwZSB3aGVu
IGNvbXBhcmlzb25zIGFnYWluc3QgdmFsaWQgc2V0dGluZ3MKPiBmb3IgdGhhdCB0eXBlIHByb2R1
Y2UgZXJyb3JzPwoKV2VsbCBpdCBpc24ndCBhbiBlcnJvciwgYnV0IHJhaXNpbmcgYSBuaWNlIHdh
cm5pbmcgaXMgbW9zdCBsaWtlbHkgYSBnb29kIAppZGVhLgoKQ2hyaXN0aWFuLgoKPgo+IEFsZXgK
Pgo+PiBDaGVlcnMsIERhbmllbAo+Pgo+Pj4gQ2hyaXN0aWFuLgo+Pj4KPj4+Pj4gQWxleAo+Pj4+
Pgo+Pj4+PiBPbiBXZWQsIFNlcCA5LCAyMDIwIGF0IDk6MjEgQU0gQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPj4+Pj4+IEFja2VkLWJ5OiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IGZvciB0aGUgc2VyaWVzLgo+Pj4+
Pj4KPj4+Pj4+IEFtIDA5LjA5LjIwIHVtIDE1OjA3IHNjaHJpZWIgWmhlbmcgQmluOgo+Pj4+Pj4+
IFpoZW5nIEJpbiAoOCk6Cj4+Pj4+Pj4gICAgICBkcm0vYW1kL2FtZGdwdTogZml4IGNvbXBhcmlz
b24gcG9pbnRlciB0byBib29sIHdhcm5pbmcgaW4gZ2Z4X3Y5XzAuYwo+Pj4+Pj4+ICAgICAgZHJt
L2FtZC9hbWRncHU6IGZpeCBjb21wYXJpc29uIHBvaW50ZXIgdG8gYm9vbCB3YXJuaW5nIGluIGdm
eF92MTBfMC5jCj4+Pj4+Pj4gICAgICBkcm0vYW1kL2FtZGdwdTogZml4IGNvbXBhcmlzb24gcG9p
bnRlciB0byBib29sIHdhcm5pbmcgaW4gc2RtYV92NV8wLmMKPj4+Pj4+PiAgICAgIGRybS9hbWQv
YW1kZ3B1OiBmaXggY29tcGFyaXNvbiBwb2ludGVyIHRvIGJvb2wgd2FybmluZyBpbiBzZG1hX3Y1
XzIuYwo+Pj4+Pj4+ICAgICAgZHJtL2FtZC9hbWRncHU6IGZpeCBjb21wYXJpc29uIHBvaW50ZXIg
dG8gYm9vbCB3YXJuaW5nIGluIHNpLmMKPj4+Pj4+PiAgICAgIGRybS9hbWQvYW1kZ3B1OiBmaXgg
Y29tcGFyaXNvbiBwb2ludGVyIHRvIGJvb2wgd2FybmluZyBpbiB1dmRfdjZfMC5jCj4+Pj4+Pj4g
ICAgICBkcm0vYW1kL2FtZGdwdTogZml4IGNvbXBhcmlzb24gcG9pbnRlciB0byBib29sIHdhcm5p
bmcgaW4KPj4+Pj4+PiAgICAgICAgYW1kZ3B1X2F0cHhfaGFuZGxlci5jCj4+Pj4+Pj4gICAgICBk
cm0vYW1kL2FtZGdwdTogZml4IGNvbXBhcmlzb24gcG9pbnRlciB0byBib29sIHdhcm5pbmcgaW4g
c2RtYV92NF8wLmMKPj4+Pj4+Pgo+Pj4+Pj4+ICAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfYXRweF9oYW5kbGVyLmMgfCA0ICsrLS0KPj4+Pj4+PiAgICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgICAgICAgICAgIHwgMiArLQo+Pj4+Pj4+ICAgICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jICAgICAgICAgICAgfCAyICstCj4+
Pj4+Pj4gICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jICAgICAgICAg
ICB8IDQgKystLQo+Pj4+Pj4+ICAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1
XzAuYyAgICAgICAgICAgfCAyICstCj4+Pj4+Pj4gICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3NkbWFfdjVfMi5jICAgICAgICAgICB8IDIgKy0KPj4+Pj4+PiAgICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvc2kuYyAgICAgICAgICAgICAgICAgIHwgMiArLQo+Pj4+Pj4+ICAgICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjZfMC5jICAgICAgICAgICAgfCA0ICsrLS0K
Pj4+Pj4+PiAgICAgOCBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlv
bnMoLSkKPj4+Pj4+Pgo+Pj4+Pj4+IC0tCj4+Pj4+Pj4gMi4yNi4wLjEwNi5nOWZhZGVkZAo+Pj4+
Pj4+Cj4+Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+Pj4+Pj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPj4+Pj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4+Pj4+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxv
b2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFu
JTJGbGlzdGluZm8lMkZhbWQtZ2Z4JmFtcDtkYXRhPTAyJTdDMDElN0NjaHJpc3RpYW4ua29lbmln
JTQwYW1kLmNvbSU3Q2RjN2E4ZDc1MTdkMzQxZTNhODBjMDhkODVhNDU4YmE4JTdDM2RkODk2MWZl
NDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzM1ODYwMjA1MTY3NjA1MyZhbXA7
c2RhdGE9TVMwdmNCY1U3dW5YakVGbGJkOGtMYkprSjRzS2N2SWRMamM4eWhYNFVVSSUzRCZhbXA7
cmVzZXJ2ZWQ9MAo+Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+Pj4+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+Pj4+IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPj4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlv
bi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJG
bWFpbG1hbiUyRmxpc3RpbmZvJTJGZHJpLWRldmVsJmFtcDtkYXRhPTAyJTdDMDElN0NjaHJpc3Rp
YW4ua29lbmlnJTQwYW1kLmNvbSU3Q2RjN2E4ZDc1MTdkMzQxZTNhODBjMDhkODVhNDU4YmE4JTdD
M2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzM1ODYwMjA1MTY4
NjA1MSZhbXA7c2RhdGE9TWdmUiUyQndDVlk5Z1dmaFE5aTVrV2NLaWlZa1YxQzhPMmRFS2xaWVNx
c2NFJTNEJmFtcDtyZXNlcnZlZD0wCj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+Pj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVj
dGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
JTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGZHJpLWRldmVsJmFtcDtkYXRhPTAyJTdDMDElN0NjaHJp
c3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3Q2RjN2E4ZDc1MTdkMzQxZTNhODBjMDhkODVhNDU4YmE4
JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzM1ODYwMjA1
MTY4NjA1MSZhbXA7c2RhdGE9TWdmUiUyQndDVlk5Z1dmaFE5aTVrV2NLaWlZa1YxQzhPMmRFS2xa
WVNxc2NFJTNEJmFtcDtyZXNlcnZlZD0wCj4+IC0tCj4+IERhbmllbCBWZXR0ZXIKPj4gU29mdHdh
cmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtz
LnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwJTNBJTJGJTJGYmxvZy5mZndsbC5jaCUy
RiZhbXA7ZGF0YT0wMiU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0NkYzdhOGQ3
NTE3ZDM0MWUzYTgwYzA4ZDg1YTQ1OGJhOCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUx
ODNkJTdDMCU3QzAlN0M2MzczNTg2MDIwNTE2ODYwNTEmYW1wO3NkYXRhPUd2THM1T1h3Mk55JTJC
aWVKeG04aGphd05iMHJHQTk2NjUzOWlBd2xXd1BNWSUzRCZhbXA7cmVzZXJ2ZWQ9MAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
