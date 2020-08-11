Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DDD241677
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 08:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DADD89147;
	Tue, 11 Aug 2020 06:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7383F89147
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 06:48:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MigQeuEEr9cJcys2Dert/tCLXbGv56L6IIBqSti6fuUILCgt0bkARbQzYqf4xWxnfUrcWn/zY1YJKcmSWpSxyIM/pNw4/jtrmnjrrzT1b1qgFdcfhf9JpFW8Vb+bkjqGTpjFQFJQv6j8qIrXPGDR6c4cBpYIatB0PEVPHvXV8diFim5Mlo+SXOS4EWEps6OgyivUdAfKMFmg+HMKlus8j6gIbJEuogcsygupBiWKTpUQJfmNyQBysfBkav2e2P/Kwaups+HfJSbljekSdaxlgfuL1oVBuGbGdP3xVTSiFcgsKJ4PRu5me8kJ0VKzh0mBJrYRWLpV3UzGg40qgSugCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7W4h5pePeXDn6KvVzl48MhpCNTBG2fSXJtP7apm2sgY=;
 b=EBeTx9MSc/IfbvE/P/fHC61u0bv6YeZkIluTqxI2xDPcX7pBXMXPbg1biXXVghq3SR2aV/Py/RJ7kRGGZ/1Y5PZ38hOMSV0oR9/PNknKtgbb0cwe6h2mIavuwdqF+6PaMJU7HR1WJXI2a92KlQv+Lu6j/dYsMm9ZoH1DSrAYOMO5Nk2+vp0BpaXRpGrkB+NIcDgkfiDi8ULv/HDYdzus7C+yyzh+gYGHAGsNi3tYj3e120dBNKQbc4WLj3e1hjvc/lWVkr4xftLUxBnP1jCr2wgeKkg+UUla8OCCj+qbLyLmsL9aPgylI+Lf8r0DEMUgaFlU4PglUvVF+Qy/YZgipw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7W4h5pePeXDn6KvVzl48MhpCNTBG2fSXJtP7apm2sgY=;
 b=QFKRxMDtDOdGGFWXHopWzBcbItImoj52aH/C+ROAHvegxXjIHgTYF6Bo/NtctWG/ibjiORrQsTMXYMjr5vnkdhMFQ/Y8jvFDBsrUHLU43hmsYfT6+FmOV8PjIDIpqMD1WW/9Djkt+qQqwAk3I0bi3I4T9+xD2XthmD+FneLz8xE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Tue, 11 Aug
 2020 06:48:50 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3261.024; Tue, 11 Aug 2020
 06:48:50 +0000
Subject: Re: [linux.git drm/ttm]: NULL pointer dereference upon driver probe
To: Dave Airlie <airlied@gmail.com>
References: <230cc360-89b9-bb39-ee7e-d68ac037345f@i-love.sakura.ne.jp>
 <e5822548-4373-5020-eb3a-9d6144b74d25@amd.com>
 <be670819-20d0-0757-a0f9-20054a527e77@vmware.com>
 <33c4495c-7fb5-f075-b30b-9ab9bdd4ce32@amd.com>
 <e4055371-5a78-0b32-9e1f-d17d865cbb8c@amd.com>
 <CAPM=9txMmSdHqnTsq97voJnNabh+dzfSzeJL302z=WJJD9j8Gw@mail.gmail.com>
 <551d34e3-945f-cb76-f3a6-d2a7533ed2a6@amd.com>
 <CAPM=9tzS992VBjTX24wsz=Oey3SVO6PS50oXaW7o9kBqt156eQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <36e09aae-a758-43c0-2a3d-4eeb393d3e5a@amd.com>
Date: Tue, 11 Aug 2020 08:48:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAPM=9tzS992VBjTX24wsz=Oey3SVO6PS50oXaW7o9kBqt156eQ@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0P190CA0018.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0P190CA0018.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.17 via Frontend Transport; Tue, 11 Aug 2020 06:48:48 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 57292f94-a2cc-48d7-8aa8-08d83dc29a78
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3997EBFC519E6ACF3B8E003C83450@MN2PR12MB3997.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WxB4W2kV7QxRfHZq0wzxUZCETm0bum+XY+XjN19sKniFHmcIxHe8T5l0jl51vQ7U0XLz1I6mhW6hk//yBFOWAlP05PKjyNexuQiIKa/pNjl0q4Tc2ZUcVbqwqOrLcT5Nw9Df4d7e0YXGs3tzffUeF24cD338lLoRCkWIfkwB82AVtvgjWvfro1sEkIARkmuxkzQjNTYGDN0L+2wRYb2NCile0QD/MYYAI+xr3wzKKIPFTzVgqM6sLtz4CNGpwUuk9JtUBLFmr4zjf26Qx3W+0F4RGmIQ/cf7emBxHRgcdIsWlbzRNsG2eRNV8piU7daRHPt5SLxlTFtualF+Q6+4ENMRowSTRnTbtJkaG859xpm4Lvkpaqg8jb5f7iB02afT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(16526019)(186003)(2616005)(6486002)(478600001)(6916009)(54906003)(316002)(52116002)(4326008)(36756003)(66946007)(66556008)(66476007)(8676002)(66574015)(5660300002)(83380400001)(8936002)(6666004)(86362001)(2906002)(31686004)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: jmRHQUBa2R5J4B0f9xtV/LYsmLM6+PkBr45O+RTD2txRfwWComJY8nm4SB5/okoWaK8yDnv9J/Z4Od3mYi17Ml6iISb8NMctkUaldjk2AxtiUsO0j575NpHDU3pm7bk4rgxS0m5vt4ZBIn/4y2xyCSiodVBUIXGHRlxIPiM+fx9FA2XPQvixyI2NpuIUYrY0DhlDZ2RLINsoGKp1EYoK171oYdWGRTlPmepSMsugOtDTA5RkIQOAkZ6M8Sp39NOKHbC3PkwnpOYtc+1nxmBk92ploggGLkBRMfdblWkO0E//EBX937KHvcdFqTSnjIWJaYsgxg1dSbZ8N/AIX9C/B25JoUB/cCmMYCNOMXclVHmjKCW3KtsITs8NhzljsAEgXyq2TaGbn7O5ZTGK8NFz0cvBxmBK3nnC8zdGjFkJ1yeBKGVR2d5P2S90/+jOeKJNlhDYcGpCaGazC258YszN23poc1M5R4gn5+Q9HkoWT4g2gmz/0Xnj+48rthgJ/+EdmhoHVh1NifFlX4sWmxndbMLT5On2nL4NV4+HKZm9fBkLKAx/BJBkvFzCJVyy8lS+CVOezK8iVq3dfKb1O+h6AcLVNjHcrAjheMDYHk70JW4EOPl0czjix0rMOoF4DpTHjUW7Up/1XK3sEUY9/NnxO5hnVaCXNw9m9Y0rj29iwdc2ZAIsbKg4UEEC/dNgOEDnX94NfZcVy0gO2hQsP54Q0g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57292f94-a2cc-48d7-8aa8-08d83dc29a78
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2020 06:48:50.6530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oy9IJN5dfDEI9Mc6TWa4dlTdByoJQPy6cwpjh+dOc7eHnWk7QQH8oDm3YdHnyd0q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3997
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
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTAuMDguMjAgdW0gMjI6MDUgc2NocmllYiBEYXZlIEFpcmxpZToKPiBPbiBUdWUsIDExIEF1
ZyAyMDIwIGF0IDA1OjI0LCBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+IHdyb3RlOgo+PiBBbSAxMC4wOC4yMCB1bSAyMDo1MSBzY2hyaWViIERhdmUgQWlybGllOgo+
Pj4gT24gTW9uLCAxMCBBdWcgMjAyMCBhdCAyMjoyMCwgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPj4+PiBBbSAwNy4wOC4yMCB1bSAwOTowMiBzY2hy
aWViIENocmlzdGlhbiBLw7ZuaWc6Cj4+Pj4+IEFtIDA2LjA4LjIwIHVtIDIwOjUwIHNjaHJpZWIg
Um9sYW5kIFNjaGVpZGVnZ2VyOgo+Pj4+Pj4gQW0gMDYuMDguMjAgdW0gMTc6Mjggc2NocmllYiBD
aHJpc3RpYW4gS8O2bmlnOgo+Pj4+Pj4+IE15IGJlc3QgZ3Vlc3MgaXMgdGhhdCB5b3UgYXJlIGZh
Y2luZyB0d28gc2VwYXJhdGUgYnVncyBoZXJlLgo+Pj4+Pj4+Cj4+Pj4+Pj4gQ3Jhc2ggIzEgaXMg
c29tZWhvdyByZWxhdGVkIHRvIENSVENzIGFuZCBtaWdodCBldmVuIGJlIGNhdXNlIGJ5IHRoZQo+
Pj4+Pj4+IGF0b21pYy1oZWxwZXIgY2hhbmdlIHlvdSBub3RlZCBiZWxvdy4KPj4+Pj4+Pgo+Pj4+
Pj4+IENyYXNoICMyIGlzIGNhdXNlZCBiZWNhdXNlIHZtd19ib19jcmVhdGVfYW5kX3BvcHVsYXRl
KCkgdHJpZXMgdG8KPj4+Pj4+PiBtYW51YWxseSBwb3B1bGF0ZSBhIEJPIG9iamVjdCBpbnN0ZWFk
IG9mIHJlbHlpbmcgb24gVFRNIHRvIGRvIGl0IHdoZW4KPj4+Pj4+PiBuZWNlc3NhcnkuIFRoaXMg
aW5kZWVkIGRvZXNuJ3Qgd29yayBhbnkgbW9yZSBiZWNhdXNlIG9mICJkcm0vdHRtOiBtYWtlCj4+
Pj4+Pj4gVFQgY3JlYXRpb24gcHVyZWx5IG9wdGlvbmFsIHYzIi4KPj4+Pj4+Pgo+Pj4+Pj4+IFF1
ZXN0aW9uIGlzIHdoeSB2bXdnZnggaXMgZG9pbmcgdGhpcz8KPj4+Pj4+IE5vdCByZWFsbHkgc3Vy
ZSB1bmZvcnR1bmF0ZWx5LCBpdCdzIHBvc3NpYmxlIHZtd2dmeCBpcyBkb2luZyBpdCBiZWNhdXNl
Cj4+Pj4+PiB0dG0gbGFja2VkIHNvbWUgY2FwYWJpbGl0aWVzIGF0IHNvbWUgcG9pbnQ/Cj4+Pj4+
IEkgdGhpbmsgc28gYXMgd2VsbCwgeWVzLgo+Pj4+Pgo+Pj4+Pj4gICAgIFRyeWluZyB0byBmaWd1
cmUgdGhpcyBvbmUgb3V0Li4uCj4+Pj4+IFByb2JsZW0gaXMgdGhhdCB3aGF0IHZtd2dmeCBpcyBk
b2luZyBoZXJlIGlzIHF1ZXN0aW9uYWJsZSBhdCBiZXN0Lgo+Pj4+Pgo+Pj4+PiBCeSBkZWZpbml0
aW9uIEJPcyBpbiB0aGUgU1lTVEVNIGRvbWFpbiBhcmUgbm90IGFjY2Vzc2libGUgYnkgdGhlIEdQ
VSwKPj4+Pj4gZXZlbiBpZiBpdCBpcyBhIHZpcnR1YWwgb25lLgo+Pj4+Pgo+Pj4+PiBBbmQgd2hh
dCB2bXdnZnggZG9lcyBpcyBhbGxvY2F0aW5nIG9uZSBpbiB0aGUgU1lTVEVNIGRvbWFpbiBhcyBu
b3QKPj4+Pj4gZXZpY3RhYmxlIGFuZCB0aGVuIGJ5cGFzc2luZyBUVE0gaW4gZmlsbGluZyBhbmQg
bWFwcGluZyBpdCB0byB0aGUgR1BVLgo+Pj4+Pgo+Pj4+PiBUaGF0IGRvZXNuJ3QgcmVhbGx5IG1h
a2VzIHNlbnNlIHRvIG1lLCB3aHkgc2hvdWxkbid0IHRoYXQgQk8gYmUgcHV0IGluCj4+Pj4+IHRo
ZSBHVFQgZG9tYWluIHRoZW4gaW4gdGhlIGZpcnN0IHBsYWNlPwo+Pj4+IFdlbGwgSSB0aGluayBJ
IGZpZ3VyZWQgb3V0IHdoYXQgVk1XR0ZYIGlzIGRvaW5nIGhlcmUsIGJ1dCB5b3Ugd29uJ3QgbGlr
ZSBpdC4KPj4+Pgo+Pj4+IFNlZSBWTVdHRlggZG9lc24ndCBzdXBwb3J0IFRUTXMgR1RUIGRvbWFp
bi4gU28gdG8gaW1wbGVtZW50IHRoZSBtb2IgYW5kCj4+Pj4gb3RhYmxlIEJPcyBpdCBpcyBhbGxv
Y2F0aW5nIHN5c3RlbSBkb21haW4gQk9zLCBwaW5uaW5nIHRoZW0gYW5kIG1hbnVhbGx5Cj4+Pj4g
ZmlsbGluZyB0aGVtIHdpdGggcGFnZXMuCj4+Pj4KPj4+PiBUaGUgY29ycmVjdCBmaXggd291bGQg
YmUgdG8gYXVkaXQgVk1XR0ZYIGFuZCBmaXggdGhpcyBoYW5kbGluZyBzbyB0aGF0Cj4+Pj4gaXQg
ZG9lc24ndCBtZXNzIGFueSBtb3JlIHdpdGggVFRNIGludGVybmFsIG9iamVjdCBzdGF0ZS4KPj4+
Pgo+Pj4+IFRpbGwgdGhhdCBoYXBwZW5zIHdlIGNhbiBvbmx5IHJldmVydCB0aGUgcGF0Y2ggZm9y
IG5vdy4KPj4+IFByb2JhYmx5IGdvb2QgdG8gZG8sIGF0IGxlYXN0IHdlIGtub3cgdGhlIHByb2Js
ZW0gbm93Lgo+Pj4KPj4+IEhvd2V2ZXIgSSBmb3VuZCBteXNlbGYgaW4gdGhlIHNhbWUgcGxhY2Ug
eWVzdGVyZGF5IHNvIHdlIHNob3VsZAo+Pj4gZGlzY3VzcyBob3cgdG8gZml4IGl0IGdvaW5nIGZv
cndhcmQuCj4+Pgo+Pj4gQXQgbGVhc3Qgb24gSW50ZWwgSUdQcyB5b3UgaGF2ZSBHVFQgYW5kIFBQ
R1RUIChwZXItcHJvY2VzcyB0YWJsZSkuIEdUVAo+Pj4gb24gbGF0ZXIgaHcgaXMgb25seSBuZWVk
ZWQgZm9yIGNlcnRhaW4gb2JqZWN0cywgbGlrZSBzY2Fub3V0IGV0Yy4gTm90Cj4+PiBldmVyeSBv
YmplY3QgbmVlZHMgdG8gYmUgaW4gdGhlIEdUVCBkb21haW4uCj4+IFdlIGhhdmUgdGhlIHNhbWUg
c2l0dWF0aW9uIG9uIGFtZGdwdS4gR0FSVCBvYmplY3RzIGFyZSBvbmx5IGFsbG9jYXRlZAo+PiBm
b3Igc2Nhbm91dCBhbmQgVk1JRDAgYWNjZXNzLgo+Pgo+PiBTZWUgb3V0IGFtZGdwdV9ndHRfbWdy
LmMuCj4+Cj4+PiBCdXQgd2hlbiB5b3UgZ2V0IGFuIGV4ZWNidWZmZXIgYW5kIHlvdSB3YW50IHRv
IGJpbmQgdGhlIFBQR1RUIG9iamVjdHMsCj4+PiB5b3UgbmVlZCB0byBlaXRoZXIgbW92ZSB0aGUg
b2JqZWN0IHRvIHRoZSBHVFQgZG9tYWluIHBvaW50bGVzc2x5IGFuZAo+Pj4gc3Vib3B0aW1hbGx5
LCBzaW5jZSB0aGUgR1RUIGRvbWFpbiBjb3VsZCBmaWxsIHVwIGFuZCBzdGFydCBuZWVkaW5nCj4+
PiBldmljdGlvbnMuCj4+IFRoYXQgaXMgaW50ZW50aW9uYWwgYmVoYXZpb3IuIFRoZSBHVFQgZG9t
YWluIGlzIHRoZSBvdmVyIGFsbCBtZW1vcnkKPj4gd2hpY2ggaXMgY3VycmVudGx5IEdQVSBhY2Nl
c3NpYmxlLgo+Pgo+PiBUaGUgR0FSVCBjYW4gYmUgbXVjaCBzbWFsbGVyIHRoYW4gdGhlIEdUVCBk
b21haW4uCj4+Cj4+PiBTbyB0aGUgb3B0aW9uIGlzIHRvIGdldCBTWVNURU0gZG9tYWluIG9iamVj
dHMsIG9ubHkgbW92ZSB0aGVtIHRvCj4+PiBUVE1fUExfVFQgd2hlbiBwaW5uaW5nIGZvciBzY2Fu
b3V0IGV0YywgYnV0IG90aGVyd2lzZSBnZW5lcmF0ZSB0aGUKPj4+IHBhZ2VzIGxpc3RzIGZyb20g
dGhlIG9iamVjdHMuIEluIG15IHBsYXlpbmcgYXJvdW5kIEkndmUgaGFja2VkIHVwIGEgVFQKPj4+
IGNyZWF0ZS9wb3B1bGF0ZSBwYXRoLCB3aXRoIG5vIGJpbmQuCj4+IFdlIGFscmVhZHkgdHJpZWQg
dGhpcyBhbmQgaXQgdHVybmVkIG91dCB0byBiZSBhIGJhZCBpZGVhLgo+Pgo+PiBTZWUgYW1kZ3B1
X3R0bV9hbGxvY19nYXJ0KCkgaG93IHRvIGVhc2lseSBkbyBpdCB3aXRoIHRoZSBHVFQgZG9tYWlu
Lgo+IE9rYXkgSSB0aGluayB0aGlzIG5lZWRzIHNvbWUgY29tbWVudGluZy4gQmVjYXVzZSBpdCdz
IG5vdCBpbW1lZGlhdGVseQo+IG9idmlvdXMgd2hhdCBpdCBtZWFucyBpZiB5b3UgaGF2ZSBhbiBp
bnZhbGlkIGFkZHJlc3MgaGVyZSBhbmQgaG93IHRoYXQKPiBjb21lcyBhYm91dC4KPgo+IE15IHJl
YWRpbmcgaXMgdGhhdCB5b3UgdXNlIGxwZm4gdG8gZGVjaWRlIGlmIHNvbWV0aGluZyBzaG91bGQg
YmUKPiBhbGxvY2F0ZWQgR1RUIHNwYWNlIGF0IGFsbCwgYW5kIG9ubHkgc2V0IGxwZm4gd2hlbiB5
b3UgaGF2ZSByZXF1ZXN0ZWQKPiBHQVJUIHNwYWNlIGV4cGxpY2l0bHk/CgpZZXMsIGV4YWN0bHkg
OikKCj4gVG8gbWUgaXQgZmVlbHMgbGlrZSB3ZSBhcmUgd29ya2luZyBhcm91bmQgVFRNIGhlcmUs
IEkgdGhpbmsgdGhpcyBzb3J0Cj4gb2YgZmVhdHVyZSBzaG91bGQgYmUgbW9yZSBmaXJzdC1jbGFz
cyBpbiB0aGUgVFRNIEFQSSBpbnN0ZWFkIG9mIGhhdmluZwo+IGV2ZXJ5IGRyaXZlciB3cml0ZSBm
aWd1cmUgaXQgb3V0IG9uIGEgZGlzY292ZXIgeW91ciBvd24gam91cm5leSBwYXRoLgoKQ29tcGxl
dGVseSBhZ3JlZS4KCj4gSSBzdXBwb3NlIHNlcGFyYXRpbmcgdGhlIGNvbmNlcHQgb2YgVFRNX1BM
X1RUIGZyb20gdGhlIGNvbmNlcHQgb2YKPiBiZWluZyBib3VuZCB0byBhIGdsb2JhbCBUVCBpcyB3
aGF0IHdlIG5lZWQgdG8gZG8gaGVyZSBzb21laG93LgoKV2VsbCBob3cgYWJvdXQgY29tcGxldGVs
eSByZW1vdmluZyB0aGUgY29uY2VwdCBvZiBhIGdsb2JhbCBUVCBmcm9tIFRUTT8KCldoYXQgVFRN
IHNob3VsZCBkbyBpcyBtYW5hZ2luZyBkb21haW5zIGFuZCBoZWxwIHdpdGggdGhlIHRyYW5zaXRp
b25zIApiZXR3ZWVuIHRob3NlIGRvbWFpbnMuCgpUaGF0IG9uZSBvZiB0aG9zZSBkb21haW5zIG1h
cHMgdGhlIGJhY2tpbmcgcGFnZXMgaW50byBhIGdsb2JhbCBUVCBpcyAKY29tcGxldGVseSBzcGVj
aWZpYyB0byB0aGF0IGRvbWFpbiBhbmQgc2hvdWxkbid0IGJvdGhlciBUVE0gaW4gYW55IHdheS4K
CldlIGNhbiBvZiBjb3Vyc2UgcHJvdmlkZSBzb21lIGRlZmF1bHQgZnVuY3Rpb25zIHRvIG1hbmFn
ZSBBR1AgYW5kIApjbGFzc2ljIEdBUlQsIGJ1dCBUVE0gc2hvdWxkbid0IGVuZm9yY2UgdXNpbmcg
dGhvc2UuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4gRGF2ZS4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
