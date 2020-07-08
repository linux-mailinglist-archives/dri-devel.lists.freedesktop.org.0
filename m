Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EECDE218A43
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 16:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C5396E8DD;
	Wed,  8 Jul 2020 14:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2066.outbound.protection.outlook.com [40.107.94.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9460A6E223;
 Wed,  8 Jul 2020 14:37:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kubu3IWEfxIN+OPie0U1Kiwr+qB1CAdeyu2u2iC/yAGN0zmmzN8C9T4uNpUQ/Mi3DAAuU0mHk+tkDH4uSV6gVNP2byIgAPHBfRNA+erMNYKe0zrRMswdJg2JEwPLKi2oHoy1ObQOodMXcU+aU7J3Nl53ej5QOm9COIAdhySxIckoE2SjhTge3c9dMrzrK0vvkEp0WWZXH6YrFZXtZqVvOUVhZQLMGMe08SiwJv+w9+pfqkGNgYdu8QwYYRoqDwD824/eoejtaKSWSjsIzPd1pmByfVpA1HJGUnGSt1YQ1zoC9mo/On51+TUbeGh6CiY5mm3G7WajSwPbB+r9OEn+vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckqzsVYy9mjGbHscVpg2kEizuYZXDxUBiUU1JoJA1jY=;
 b=jPZyBeFrgVbWUXBepI+2GUzDrvgUfjfxR6C/hBEd+xQFfY6RjJCgE82keNkteKU3NBHqrZ4xEoD0CTr1pBPBHfEX9/LmJ4Ou/E/mqvBPQ14TffNHqIt4gaQ9JXh+e4kUcR2kGaVLSr4jg6Ir6S5Kg0N4ziQKHMWUbqtMz/SNFxXP/xX4CfGifnT4Ll4PZQN1vECLUDwUq01Cwk40P7qFKMmdYbrReL2tJBZ2JBA+8Ix8iu9mUQQBW10xfzS49nnTwbm1lI9Jc6Muvs+1p3FB9VfoaQXvblbUfT8Nvvvm3+/eI100cplIN4IcMquMBMQy/QxLkynv7JGo4sBkcXXzFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckqzsVYy9mjGbHscVpg2kEizuYZXDxUBiUU1JoJA1jY=;
 b=Hf+F6dA1OoIudiRVLoN5MFMeptXI2lGcAcjHSBQfx3kL/rPfLdMEU2ZLIybWLH5TWsz8EkuOiwCIgQqZSzXHZCfHiOaKUgSQ7bQR+OVpasufs7PsBjDr40p6XJZJ8YhmHnuIWfl3W8tbkOaLlnjYc95SmEcowVXJvyTaz2/LEOo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3727.namprd12.prod.outlook.com (2603:10b6:208:15a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Wed, 8 Jul
 2020 14:37:43 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3174.021; Wed, 8 Jul 2020
 14:37:43 +0000
Subject: Re: [PATCH 1/2] drm/vgem: Do not allocate backing shmemfs file for an
 import dmabuf object
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200707160012.1299338-1-chris@chris-wilson.co.uk>
 <CALqoU4y61Yc5ndaLSO3WoGSPxGm1nJJufk3U=uxhZe3sT1Xyzg@mail.gmail.com>
 <159414243217.17526.6453360763938648186@build.alporthouse.com>
 <CALqoU4ypBqcAo+xH2usVRffKzR6AkgGdJBmQ0vWe9MZ1kTHCqw@mail.gmail.com>
 <159414692385.17526.10068675168880429917@build.alporthouse.com>
 <b8e6d844-f096-8efc-1252-ef430069d080@amd.com>
 <20200708095405.GJ3278063@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d59a0057-31db-ce8e-e83d-cd9e023a9ab2@amd.com>
Date: Wed, 8 Jul 2020 16:37:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200708095405.GJ3278063@phenom.ffwll.local>
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0070.eurprd03.prod.outlook.com (2603:10a6:208::47)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR03CA0070.eurprd03.prod.outlook.com (2603:10a6:208::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.20 via Frontend Transport; Wed, 8 Jul 2020 14:37:41 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c4ccf0b2-5d3a-4abc-ea8d-08d8234c7910
X-MS-TrafficTypeDiagnostic: MN2PR12MB3727:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3727726DDDE99B3CBF61FE1683670@MN2PR12MB3727.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 04583CED1A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3tMs2og2IM0GfkNeqaTMqmp7365hyllJ9dKQ8nR4/FddlbDRcNIeUq+CatKioYk2xUY8PpLF1aGQQSXbCgIh7kNgRP9o8zkOvcUolipEdh2zI1CMU/IqoCGY8S7nQ+nsVE5agGXMcmBCJchPdrCvxxiezE1l4zUojutbJRjwrQ5CT5YBIoj3Ab8VHAjwkpKpYdH5eLPUhmOIVavwNyPwyvZ/xnPdU85CwAnpV9aSWlP/MV+PPT7NJiDU1rrHJjW+v7IRbt1ndcP9EZDyB11wocM6hW6KpiPnLyL3MXTCOK0HLp7QG6+bMAl55Dthp8TzGj1eN/FuWxBeaUyjnHNNwR+35sTwf3HEW2+XB21InzDZ5+QjwAKasJ34sLtYO+yq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(366004)(346002)(136003)(396003)(39850400004)(66946007)(6666004)(6916009)(52116002)(66574015)(83380400001)(31696002)(2616005)(316002)(36756003)(86362001)(8676002)(5660300002)(8936002)(2906002)(66556008)(66476007)(31686004)(478600001)(54906003)(4326008)(6486002)(53546011)(186003)(16526019)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: t8B2CODYEe7nffWGbzody2iNWbq2a/QSKtbOFn9KhoQOJv7j79SNrGlZnv6PG4v9ljIyWXJeD4UWIJOogpSjsTRamOR/JabeeybTQpYJsTprG4v+NAVErYlWmWhTZduygqV6Duub7mmb+yi+IXyzNfRI7Pa2T2PcpPCjQLp2PR7GC7Ebqp20Yg6ZnQhrMS8lbcVg5HCeC8CPi0+LN7FJZbzgmPcAqFCVxpcfdcrglKog8M79FMeJug5qic8HROc59CefG1uFJ/SS6e4XCLoxyJSvOUCx0ICTOqWF1xmripGGnw0/zkpUUbcBRBTHl3Ih2vBFjhoQM1sc5pA8SkZjPzmqjtUT4Xe9Q/7pFbGfIVrBgbnMrav+g3T274e2I98vSHukJ/2pf9KlYpPQcjPYzcy34Quu4HnYagG0Z1+vl014N+6NiSo446y/E8nr/0a5yGsR2tM8BycbdkLPc78XTRXyqapZdevB2oIucp+8jrZP5oRLesdazxqXMzribnNaVcHvNI8AXL6T41NmQ4ottdzw4CKjC643Nkaw/j8gJRar+Y77AFLwWWTDgGAw1JxG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ccf0b2-5d3a-4abc-ea8d-08d8234c7910
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2020 14:37:43.1382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Wv40aTx8J7gduE/7rs/oEYdZWt3t1/SUxNrjbKmIRASlRsRQIdy5yNbb5B3CcGl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3727
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 "# v4.10+" <stable@vger.kernel.org>, lepton <ytht.net@gmail.com>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMDcuMjAgdW0gMTE6NTQgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgSnVs
IDA4LCAyMDIwIGF0IDExOjIyOjAwQU0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDA3LjA3LjIwIHVtIDIwOjM1IHNjaHJpZWIgQ2hyaXMgV2lsc29uOgo+Pj4gUXVvdGluZyBs
ZXB0b24gKDIwMjAtMDctMDcgMTk6MTc6NTEpCj4+Pj4gT24gVHVlLCBKdWwgNywgMjAyMCBhdCAx
MDoyMCBBTSBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4gd3JvdGU6Cj4+
Pj4+IFF1b3RpbmcgbGVwdG9uICgyMDIwLTA3LTA3IDE4OjA1OjIxKQo+Pj4+Pj4gT24gVHVlLCBK
dWwgNywgMjAyMCBhdCA5OjAwIEFNIENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNv
LnVrPiB3cm90ZToKPj4+Pj4+PiBJZiB3ZSBhc3NpZ24gb2JqLT5maWxwLCB3ZSBiZWxpZXZlIHRo
YXQgdGhlIGNyZWF0ZSB2Z2VtIGJvIGlzIG5hdGl2ZSBhbmQKPj4+Pj4+PiBhbGxvdyBkaXJlY3Qg
b3BlcmF0aW9ucyBsaWtlIG1tYXAoKSBhc3N1bWluZyBpdCBiZWhhdmVzIGFzIGJhY2tlZCBieSBh
Cj4+Pj4+Pj4gc2htZW1mcyBpbm9kZS4gV2hlbiBpbXBvcnRlZCBmcm9tIGEgZG1hYnVmLCB0aGUg
b2JqLT5wYWdlcyBhcmUKPj4+Pj4+PiBub3QgYWx3YXlzIG1lYW5pbmdmdWwgYW5kIHRoZSBzaG1l
bWZzIGJhY2tpbmcgc3RvcmUgbWlzbGVhZGluZy4KPj4+Pj4+Pgo+Pj4+Pj4+IE5vdGUsIHRoYXQg
cmVndWxhciBtbWFwIGFjY2VzcyB0byBhIHZnZW0gYm8gaXMgdmlhIHRoZSBkdW1iIGJ1ZmZlciBB
UEksCj4+Pj4+Pj4gYW5kIHRoYXQgcmVqZWN0cyBhdHRlbXB0cyB0byBtbWFwIGFuIGltcG9ydGVk
IGRtYWJ1ZiwKPj4+Pj4+IFdoYXQgZG8geW91IG1lYW4gYnkgInJlZ3VsYXIgbW1hcCBhY2Nlc3Mi
IGhlcmU/ICBJdCBsb29rcyBsaWtlIHZnZW0gaXMKPj4+Pj4+IHVzaW5nIHZnZW1fZ2VtX2R1bWJf
bWFwIGFzIC5kdW1iX21hcF9vZmZzZXQgY2FsbGJhY2sgdGhlbiBpdCBkb2Vzbid0IGNhbGwKPj4+
Pj4+IGRybV9nZW1fZHVtYl9tYXBfb2Zmc2V0Cj4+Pj4+IEFzIEkgdG9vIGZvdW5kIG91dCwgYW5k
IHNvIGhhZCB0byBjb3JyZWN0IG15IHN0b3J5IHRlbGxpbmcuCj4+Pj4+Cj4+Pj4+IEJ5IHJlZ3Vs
YXIgbW1hcCgpIGFjY2VzcyBJIG1lYW4gbW1hcCBvbiB0aGUgdmdlbSBibyBbdmlhIHRoZSBkdW1i
IGJ1ZmZlcgo+Pj4+PiBBUEldIGFzIG9wcG9zZWQgdG8gbW1hcCgpIHZpYSBhbiBleHBvcnRlZCBk
bWEtYnVmIGZkLiBJIGhhZCB0byBsb29rIGF0Cj4+Pj4+IGlndCB0byBzZWUgaG93IGl0IHdhcyBi
ZWluZyB1c2VkLgo+Pj4+IE5vdyBpdCBzZWVtcyB5b3VyIGZpeCBpcyB0byBkaXNhYmxlICJyZWd1
bGFyIG1tYXAiIG9uIGltcG9ydGVkIGRtYSBidWYKPj4+PiBmb3IgdmdlbS4gSSBhbSBub3QgcmVh
bGx5IGEgZ3JhcGhpYyBndXksIGJ1dCB0aGVuIHRoZSBhcGkgbG9va3MgbGlrZToKPj4+PiBmb3Ig
YSBnZW0gaGFuZGxlLCB1c2VyIHNwYWNlIGhhcyB0byBndWVzcyB0byBmaW5kIG91dCB0aGUgd2F5
IHRvIG1tYXAKPj4+PiBpdC4gSWYgdXNlciBzcGFjZSBndWVzcyB3cm9uZywgdGhlbiBpdCB3aWxs
IGZhaWwgdG8gbW1hcC4gSXMgdGhpcyB0aGUKPj4+PiBleHBlY3RlZCB3YXkKPj4+PiBmb3IgcGVv
cGxlIHRvIGhhbmRsZSBncHUgYnVmZmVyPwo+Pj4gWW91IGVpdGhlciBoYXZlIGEgZHVtYiBidWZm
ZXIgaGFuZGxlLCBvciBhIGRtYS1idWYgZmQuIElmIHlvdSBoYXZlIHRoZQo+Pj4gaGFuZGxlLCB5
b3UgaGF2ZSB0byB1c2UgdGhlIGR1bWIgYnVmZmVyIEFQSSwgdGhlcmUncyBubyBvdGhlciB3YXkg
dG8KPj4+IG1tYXAgaXQuIElmIHlvdSBoYXZlIHRoZSBkbWEtYnVmIGZkLCB5b3Ugc2hvdWxkIG1t
YXAgaXQgZGlyZWN0bHkuIFRob3NlCj4+PiB0d28gYXJlIGNsZWFyLgo+Pj4KPj4+IEl0J3Mgd2hl
biB5b3UgaW1wb3J0IHRoZSBkbWEtYnVmIGludG8gdmdlbSBhbmQgY3JlYXRlIGEgaGFuZGxlIG91
dCBvZgo+Pj4gaXQsIHRoYXQncyB3aGVuIHRoZSBoYW5kbGUgaXMgbm8gbG9uZ2VyIGZpcnN0IGNs
YXNzIGFuZCBjZXJ0YWluIHVBUEkKPj4+IFt0aGUgZHVtYiBidWZmZXIgQVBJIGluIHBhcnRpY3Vs
YXJdIGZhaWwuCj4+Pgo+Pj4gSXQncyBub3QgYnJpbGxpYW50LCBhcyB5b3Ugc2F5LCBpdCByZXF1
aXJlcyB0aGUgdXNlciB0byByZW1lbWJlciB0aGUKPj4+IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUg
aGFuZGxlcywgYnV0IGF0IHRoZSBzYW1lIHRpbWUgaXQgZG9lcyBwcmV2ZW50Cj4+PiB0aGVtIGZh
bGxpbmcgaW50byBjb2hlcmVuY3kgdHJhcHMgYnkgZm9yY2luZyB0aGVtIHRvIHVzZSB0aGUgcmln
aHQKPj4+IGRyaXZlciB0byBoYW5kbGUgdGhlIG9iamVjdCwgYW5kIGhhdmUgdG8gY29uc2lkZXIg
dGhlIGFkZGl0aW9uYWwgaW9jdGxzCj4+PiB0aGF0IGdvIGFsb25nIHdpdGggdGhhdCBhY2Nlc3Mu
Cj4+IFllcywgQ2hyaXMgaXMgcmlnaHQuIE1hcHBpbmcgRE1BLWJ1ZiB0aHJvdWdoIHRoZSBtbWFw
KCkgQVBJcyBvZiBhbiBpbXBvcnRlcgo+PiBpcyBpbGxlZ2FsLgo+Pgo+PiBXaGF0IHdlIGNvdWxk
IG1heWJlIHRyeSB0byBkbyBpcyB0byByZWRpcmVjdCB0aGlzIG1tYXAoKSBBUEkgY2FsbCBvbiB0
aGUKPj4gaW1wb3J0ZXIgdG8gdGhlIGV4cG9ydGVyLCBidXQgSSdtIHByZXR0eSBzdXJlIHRoYXQg
dGhlIGZzIGxheWVyIHdvdWxkbid0Cj4+IGxpa2UgdGhhdCB3aXRob3V0IGNoYW5nZXMuCj4gV2Ug
YWxyZWFkeSBkbyB0aGF0LCB0aGVyZSdzIGEgZnVsbCBoZWxwZXItaWZpZWQgcGF0aCBmcm9tIEkg
dGhpbmsgc2htZW0KPiBoZWxwZXJzIHRocm91Z2ggcHJpbWUgaGVscGVycyB0byBmb3J3YXJkIHRo
aXMgYWxsLiBJbmNsdWRpbmcgaGFuZGxpbmcKPiBidWZmZXIgb2Zmc2V0cyBhbmQgYWxsIHRoZSBv
dGhlciBsb2x6IGJhY2smZm9ydGguCgpPaCwgdGhhdCBtb3N0IGxpa2VseSB3b24ndCB3b3JrIGNv
cnJlY3RseSB3aXRoIHVucGlubmVkIERNQS1idWZzIGFuZCAKbmVlZHMgdG8gYmUgYXZvaWRlZC4K
CkVhY2ggZmlsZSBkZXNjcmlwdG9yIGlzIGFzc29jaWF0ZWQgd2l0aCBhbiBzdHJ1Y3QgYWRkcmVz
c19zcGFjZS4gQW5kIAp3aGVuIHlvdSBtbWFwKCkgdGhyb3VnaCB0aGUgaW1wb3J0ZXIgYnkgcmVk
aXJlY3RpbmcgdGhlIHN5c3RlbSBjYWxsIHRvIAp0aGUgZXhwb3J0ZXIgeW91IGVuZCB1cCB3aXRo
IHRoZSB3cm9uZyBzdHJ1Y3QgYWRkcmVzc19zcGFjZSBpbiB5b3VyIFZNQS4KClRoYXQgaW4gdHVy
biBjYW4gZ28gdXAgZWFzaWx5IGluIGZsYW1lcyB3aGVuIHRoZSBleHBvcnRlciB0cmllcyB0byAK
aW52YWxpZGF0ZSB0aGUgQ1BVIG1hcHBpbmdzIGZvciBpdHMgRE1BLWJ1ZiB3aGlsZSBtb3Zpbmcg
aXQuCgpXaGVyZSBhcmUgd2UgZG9pbmcgdGhpcz8gTXkgbGFzdCBzdGF0dXMgd2FzIHRoYXQgdGhp
cyBpcyBmb3JiaWRkZW4uCgpDaHJpc3RpYW4uCgo+IE9mIGNvdXJzZSB0aGVyZSdzIHN0aWxsIHRo
ZSBwcm9ibGVtIHRoYXQgbWFueSBkcml2ZXJzIGRvbid0IGZvcndhcmQgdGhlCj4gY2FjaGUgY29o
ZXJlbmN5IGNhbGxzIGZvciBiZWdpbi9lbmQgY3B1IGFjY2Vzcywgc28gaW4gYSBidW5jaCBvZiBj
YXNlcwo+IHlvdSdsbCBjYWNoZSBjYWNoZWxpbmUgZGlydCBzb3VwLiBCdXQgdGhhdCdzIGtpbmRh
IHN0YW5kYXJkIHByb2NlZHVyZSBmb3IKPiBkbWEtYnVmIDotUAo+Cj4gQnV0IHllYWggdHJ5aW5n
IHRvIGhhbmRsZSB0aGUgbW1hcCBhcyBhbiBpbXBvcnRlciwgYnlwYXNzaW5nIHRoZSBleHBvcnQ6
Cj4gbm9wZS4gVGhlIG9uZSBleGNlcHRpb24gaXMgaWYgeW91IGhhdmUgc29tZSBraW5kIG9mIGZh
bmN5IGdhcnQgd2l0aAo+IGNwdS12aXNpYmxlIHBjaSBiYXIgKGxpa2UgYXQgbGVhc3QgaW50ZWdy
YXRlZCBpbnRlbCBncHVzIGhhdmUpLiBCdXQgaW4KPiB0aGF0IGNhc2UgdGhlIG1tYXAgdmVyeSBt
dWNoIGxvb2tzJmFjdHMgbGlrZSBkZXZpY2UgYWNjZXNzIGluIGV2ZXJ5IHdheS4KPgo+IENoZWVy
cywgRGFuaWVsCj4KPj4gUmVnYXJkcywKPj4gQ2hyaXN0aWFuLgo+Pgo+Pgo+Pj4gLUNocmlzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
