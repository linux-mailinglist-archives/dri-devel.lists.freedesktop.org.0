Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E07288ADD
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 16:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513BF6ECFC;
	Fri,  9 Oct 2020 14:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690061.outbound.protection.outlook.com [40.107.69.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9642B6ECF9;
 Fri,  9 Oct 2020 14:30:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PV84I/lm/EdmwwsdT6QwaaQHeuf9Fmk8OAWlxSyoXG0r1CiF+3yH/f1FuhEORAadc7/1Z3I4zbLBXp2Gf/jT+FgtiNr7mvjZpwUVeq4QzCszaO8SeHAZz8kA4ckTckVcThhoU3vnxkWEV8EYSPp8CCbT3etOM5K3a/o/DwV+BCwRyoAAwR8E+cIVgMu4JRtOvqoIeUV3yK3giN4DynzRCyG39vXYQNhDGDOSEjdyKmO42zVkwJaR+JoNHPZhfBFhRaWTav+8bG+6cnrFANkC1asbKUu8oNDhBGzZ1a6TsGO7/+wtVQEpT4CLM697Wq1hpQ2UATnvg1OeijEQF2ppsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8HRRhEx3lleKRTEQD7f8UhAoDHN+IiT4sBWXQMPlGM=;
 b=MCgijlAsEYUa6A5hIAfok6CL6AZJLEg//vKuZXG4xQIMUxvaJF/CJLEhQfa5Gxq5BU3j9ZzmwQa3rEJMMoQ8seZ+Iy3lTA3jZb1tCSECBkvv2ByGTm+nMnQ3uqgrC75Hi+2hVxCXWE0PxP802jwDj0deD04i+fUHwx+cQnA3Rex41/RHgXetxsc1rkMtEhd7YfK8wodyjhaJeqENzXfWUPOm26LC2jeWk//KOJlfEF7vhu20VlSOsM2ftNuVxqRgs1UQpQI/IY7U2jgfzxHuUvF/s4iolOOXKRicnc7W5mqu9oT0azMGWU9BjPcmV/eobtHPfrh4FBHOKpfr9Xsi7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8HRRhEx3lleKRTEQD7f8UhAoDHN+IiT4sBWXQMPlGM=;
 b=euOFN+Ypx5mKk3D2en6DeHvOLB3aZt3uJCO/bdCXOY3qsFIpsrYCDTkmEZhi+pxLULrObtlEXnk7tYkUpy+KcFlJCmQ5yOywbJWwbyV6C6p4umDZAy8gxYNtyylL48mBeg36c2DWqTWJiTv80O4/PZyz/fbuBKy9JTqv0aLxGXM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4302.namprd12.prod.outlook.com (2603:10b6:208:1de::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.26; Fri, 9 Oct
 2020 14:30:00 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3455.027; Fri, 9 Oct 2020
 14:30:00 +0000
Subject: Re: [PATCH][next] amd/amdgpu_ctx: Use struct_size() helper and
 kmalloc()
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
References: <20201008143450.GA23077@embeddedor>
 <4fe00048-2612-39f3-29bb-c9424000f836@amd.com>
 <20201009135430.GA31347@embeddedor>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <de2282e7-7eb9-db79-1082-36d6508b05dd@amd.com>
Date: Fri, 9 Oct 2020 16:29:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201009135430.GA31347@embeddedor>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR02CA0107.eurprd02.prod.outlook.com
 (2603:10a6:208:154::48) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0107.eurprd02.prod.outlook.com (2603:10a6:208:154::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend
 Transport; Fri, 9 Oct 2020 14:29:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a1a5b6da-c9da-42d2-e554-08d86c5fcd69
X-MS-TrafficTypeDiagnostic: MN2PR12MB4302:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4302FC63E3E9A37971E2480383080@MN2PR12MB4302.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2CfiYDTmO1yMEFkGBPScVI18ylx6DHUNgRu5CsUBQkJ4wD83UydSAt5gdK98xP0aHliLzoFe+4ULjKY0cBqSPkOb4wC9GmEjz8H4cwBiUzdUgsgpbf1iJ5qHFe501XDgD5c8tmv1a7kcoMSyzttiejNa2Vvjxlf4gCd05aRYQE+8iASctXTsCn28kuKgNRTD8aAwI5j1t7yg/k4YW4xeu07tYb9fr7Ewf+ZhjjddUBilVZhM7u9FBAuV2MXpEswZlnYtbomU0B3CLUf0Xui17KYW3BpsnkzEm6w6DLoNA+Khw20xw5IYQYCALZljXbCb6gpjyXAVUn5jpNZUMw2AN5jY13Gmsy4X6drIuVXdG/1pMiLp8iA5KtSyiFX5Lwnu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(31686004)(8936002)(2906002)(6666004)(83380400001)(6486002)(31696002)(54906003)(4326008)(66574015)(52116002)(2616005)(316002)(6916009)(5660300002)(8676002)(86362001)(186003)(16526019)(478600001)(66946007)(36756003)(66556008)(66476007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: qyYR4unOw0SaE857F0W1DB2JBCPb1a992B5g2KJ6eOghue3lO6USOeDT7wU6CAot2pukB/OE3cL0Qxjw/sSpGRv4tIs2i0gziIQKNirbxj0zLD8+725oJygRb27SRdOg3u13sSJeH8PMy73QW9J9J7RTPz1HVrCZUftdOg6iSim/lPqdCu1yj+6qZllngQSQ7wo8jOgFolDi7D+1yqtJgf64p6h1kk+i1YYKS6rLKGOqkjmDxu0LzUxuJweKgFqb1ng1ZIUyGlf6/TA3A24/xnzLhLsCggjWxDEQsKLwwUwXjpqRwEbm2nXgzdA7s7/E5EtllS4PvxjRLAFw5/NfuqKCpltghIgnvCPOK7uTN89Xi/IXOLwDd4SIRQAOSnZBwu4XAJYfbjcq8Du4iVyKjnIJx4wT79uEwNgzZSV7Hmb+D69VxPD2Vds5huLAtW41ki8WR4CtxqL8EXhVLf2+IvZ0XtbRYa40miZGNUvEAvdyjt6Hqxi7mcgJY9KuXDWTvI5zr/Sv8fHZcrIKc80+9lMwyYMDBQKiWivNpsRdqN7F234ZAWywfFgy8arn1fJ216JTs2IRFx1Fm3oWzBPLR+Q+XcFihNhPh8m6gXzRUGNmvLw0I94f7lOwbxEbKFcgkcKI+IlhUpqv+CIZZbFz6gX/KgM6hlQTYisfU1KSRM1Azgs+/paiVeFOEii54rbD2OMloWPcLy1j4UIpZ15BwQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a5b6da-c9da-42d2-e554-08d86c5fcd69
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2020 14:29:59.9026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 91tCQdavCY71BwONN0CY21PzO4dTT8+jp85NtsEEPhz82EQUELmAYo1rCWxmsaKC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4302
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-hardening@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDkuMTAuMjAgdW0gMTU6NTQgc2NocmllYiBHdXN0YXZvIEEuIFIuIFNpbHZhOgo+IE9uIEZy
aSwgT2N0IDA5LCAyMDIwIGF0IDA5OjA4OjUxQU0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3Jv
dGU6Cj4+IEFtIDA4LjEwLjIwIHVtIDE2OjM0IHNjaHJpZWIgR3VzdGF2byBBLiBSLiBTaWx2YToK
Pj4+IE1ha2UgdXNlIG9mIHRoZSBuZXcgc3RydWN0X3NpemUoKSBoZWxwZXIgaW5zdGVhZCBvZiB0
aGUgb2Zmc2V0b2YoKSBpZGlvbS4KPj4+IEFsc28sIHVzZSBrbWFsbG9jKCkgaW5zdGVhZCBvZiBr
Y2FsbG9jKCkuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3Vz
dGF2b2Fyc0BrZXJuZWwub3JnPgo+Pj4gLS0tCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfY3R4LmMgfCAyICstCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2N0eC5jCj4+PiBpbmRleCBjODBkODMzOWY1OGMuLjViZTEyNWYzYjkyYSAxMDA2NDQKPj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYwo+Pj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jCj4+PiBAQCAtMTAwLDcgKzEw
MCw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2N0eF9pbml0X2VudGl0eShzdHJ1Y3QgYW1kZ3B1X2N0
eCAqY3R4LCB1MzIgaHdfaXAsCj4+PiAgICAJZW51bSBkcm1fc2NoZWRfcHJpb3JpdHkgcHJpb3Jp
dHk7Cj4+PiAgICAJaW50IHI7Cj4+PiAtCWVudGl0eSA9IGtjYWxsb2MoMSwgb2Zmc2V0b2YodHlw
ZW9mKCplbnRpdHkpLCBmZW5jZXNbYW1kZ3B1X3NjaGVkX2pvYnNdKSwKPj4+ICsJZW50aXR5ID0g
a21hbGxvYyhzdHJ1Y3Rfc2l6ZShlbnRpdHksIGZlbmNlcywgYW1kZ3B1X3NjaGVkX2pvYnMpLAo+
PiBOQUsuIFlvdSBjb3VsZCB1c2Uga3phbGxvYygpIGhlcmUsIGJ1dCBrbWFsbG9jIHdvbid0IHpl
cm8gaW5pdGlhbGl6ZSB0aGUKPj4gbWVtb3J5IHdoaWNoIGNvdWxkIHJlc3VsdCBpbiB1bmZvcmVz
ZWVuIGNvbnNlcXVlbmNlcy4KPiBPaCBJIHNlZS4uIEkgY2VydGFpbmx5IGRpZG4ndCB0YWtlIHRo
YXQgaW50byBhY2NvdW50Lgo+Cj4gSSdsbCBmaXggdGhhdCB1cCBhbmQgcmVzcGluLgoKU2hpdCBo
YXBwZW5zLCB3ZSBhbHJlYWR5IGhhdmUgYSBmaXggZm9yIHRoaXMuIEFsZXggbWVyZ2VkIGl0IGFu
ZCBpdCAKaW1tZWRpYXRlbHkgYnJva2Ugb3VyIHRlc3Rpbmcgc3lzdGVtcy4KClNvIG9uZSBvZiBv
dXIgZW5naW5lZXJzIGNhbWUgdXAgd2l0aCBhIGZpeCB3aGljaCBzaG91bGQgYWxyZWFkeSBoYXZl
IApiZWVuIGFwcGxpZWQuCgpDaHJpc3RpYW4uCgo+Cj4gVGhhbmtzCj4gLS0KPiBHdXN0YXZvCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
