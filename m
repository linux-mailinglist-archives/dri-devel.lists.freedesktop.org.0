Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8001A21B7
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 14:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256946E99B;
	Wed,  8 Apr 2020 12:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690075.outbound.protection.outlook.com [40.107.69.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59956E99B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 12:21:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oE5de1MvKZToWwPK2J/6Ol/HzXzeO5v4Ocmgm6bNWX6bffEucvsD/wx0ngTzKBiUo3yYMquRynnhng2dYOXuG1aXbyXqeXA7NrX/QfgbHo4ZcrfQYi1+bLptOqMBSYakkppXW7UuGpVeapaopgjkymUUMUnzZBdSdLbkdbL6K8z/0+Dvlk5Zju5VYGO4NcQB1NzWeWG94r2OmCPTi2jqqrWovmvfvokzRyeH9sJvCszpKHKdPHs5EKUIpmVM/5bFNVzsnpmn/DT0BrCYVTxMPqxTwa2BaW4msaw9sAeBNiEnVqozoXZ1n6qNGc6WB6+8jz9cHOPe36H/l1Cf/i3Y6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WDASgH8UHchHYSnCSUSkjTJqdlPwhGrdMHt3JKqB9E=;
 b=akJn2K1lJoKz5m4ln97YsfTgJAjCYIzYtRcXyNFYF+lg9VdTSNyfrwL1HDDtMDxed1do56KFGzn3H+yOgPwIy9vW1g+9WIoflf3KGJD1v6dhfeKUq26BKxeoRGJwQDfZ7toqzYAO1tJ3O8JFZ3U7aLsVv+p3y6f8VZeqy7xJvzM+Y7l1ux0KokEY4dkipntiOC4tvt6AefdBtA/DL7q+lzdtdPhYlBkWkN6r2T8iMQgsiGR9K9MwNbTAqi3+ttM2ydtLQN+5/71rAQiHWP3AonZoJsLcFGIe4cVV3+PpPCQABqssjYbEXzvDJWCMqNIzA3TzAN5Y+QXYhFSEDR+Vkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WDASgH8UHchHYSnCSUSkjTJqdlPwhGrdMHt3JKqB9E=;
 b=cbVqClmZxmXNpG6QRqtN1LVgA/VBsceJsoj8tLob/2O1EkVHF3aHtG5v26P+KNpfP0/gXo28iUz3dGh7gtWtVxCVo/bcK88trgovrL7AC8gfxTkUuae2smuRRiPDYIsxNdg9OnFlnrGnGz/e8iJWjp7zeGh9VoP+xUkxdaQ5ZuY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB4316.namprd12.prod.outlook.com (2603:10b6:5:21a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Wed, 8 Apr
 2020 12:21:01 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::f164:85c4:1b51:14d2]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::f164:85c4:1b51:14d2%4]) with mapi id 15.20.2878.022; Wed, 8 Apr 2020
 12:21:00 +0000
Subject: Re: [PATCH] drm/ttm: Temporarily disable the huge_fault() callback
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org
References: <20200408115331.5529-1-thomas_os@shipmail.org>
 <f7408653-39a1-e234-c45d-7a786e043b8f@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <67f24846-0063-d435-1423-3cab8744854d@amd.com>
Date: Wed, 8 Apr 2020 14:19:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <f7408653-39a1-e234-c45d-7a786e043b8f@shipmail.org>
Content-Language: en-US
X-ClientProxiedBy: ZR0P278CA0012.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::22) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 ZR0P278CA0012.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.15 via Frontend Transport; Wed, 8 Apr 2020 12:20:59 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e31b0987-34ee-4cb2-2e6a-08d7dbb74c5e
X-MS-TrafficTypeDiagnostic: DM6PR12MB4316:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4316010EC4A51BD665E6816583C00@DM6PR12MB4316.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-Forefront-PRVS: 0367A50BB1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(316002)(52116002)(53546011)(66574012)(6666004)(86362001)(31696002)(478600001)(6486002)(2616005)(16526019)(66476007)(5660300002)(31686004)(81166007)(2906002)(8676002)(66946007)(36756003)(81156014)(8936002)(186003)(66556008)(14583001);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X6gODTmTVbupEqK7Zo8gC6mRkFOYq+hkeh3jCJ6QxvL1sTtynq7odJyZgNoEdMjj2qTFZoBCGXR4Aq5c1yTxOBHCSDVedxMwnsvL17dTbXghIdHq9knZT3uOyOIn673WcXtfOOrwNsa27F1hjRmkEBj+in8Z6IX4XZD4JGu7xdXROufRlxp9ZnhbvHwyps3KSkyNmu9CsqMXgwxfthBwng+4RFHUXuRLatC2znPM18baGmcMwva3wGo+3f20ndGs/t2+oDRRAEw8W88XYCq030ltX8dVHGhccxaxxHrHKpw8NcQ+mDTwjDfDpQBHU2Ra5hlrTNhqqlyHQ5Qh/Kl85kPiRhcy0oPzl2zf5Hd6HFV9PYZrPvzVNm0fQVe+aXmicZHI8xyrliaRn1ptdKGbzYdEVCJHgRlf3BL1eyxgYXZvMon0AV2tx3qUGPCFtfSYYMyOY6UbseFJMnUOAeC/puDEJFLeXm6LKawd6gy7fC06oTiT6M0qz91P7kHYjpTe
X-MS-Exchange-AntiSpam-MessageData: tXfeWyeepHkI/b/YMU7XBUcUzVtKRZy+9VZ5x++tP6WbNXaQQi08bWqPTMJ0BPZBUwR8l+HU/9+G5V5ouC5L3+K1oj4AHgEu9rhRNH2N+QdW/9T/g99R8dnwQ/KpvXRbqLO91uoMZQF+PA8JvtRnMjgmcoxGMIc4iEHL6OGXRJpP0DItGpk9z4/OSkUV2Ez7XgsvrT5Fiy+lG58EL7DCUQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e31b0987-34ee-4cb2-2e6a-08d7dbb74c5e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2020 12:21:00.7433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZIZAuGpba+Nst7/7zqzlZBcIxXi4kMmiApvZtfiB332T6OHF+Q/pRm9mp3JvNE1c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4316
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

QW0gMDguMDQuMjAgdW0gMTQ6MDEgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKToK
PiBIaSwgQ2hyaXN0aWFuLAo+Cj4gT24gNC84LzIwIDE6NTMgUE0sIFRob21hcyBIZWxsc3Ryw7Zt
IChWTXdhcmUpIHdyb3RlOgo+PiBGcm9tOiAiVGhvbWFzIEhlbGxzdHJvbSAoVk13YXJlKSIgPHRo
b21hc19vc0BzaGlwbWFpbC5vcmc+Cj4+Cj4+IFdpdGggYW1kZ3B1IGFuZCBDT05GSUdfVFJBTlNQ
QVJFTlRfSFVHRVBBR0VfQUxXQVlTPXksIHRoZXJlIGFyZQo+PiBlcnJvcnMgbGlrZToKPj4gQlVH
OiBub24temVybyBwZ3RhYmxlc19ieXRlcyBvbiBmcmVlaW5nIG1tCj4+IGFuZDoKPj4gQlVHOiBC
YWQgcnNzLWNvdW50ZXIgc3RhdGUKPj4gd2l0aCBUVE0gdHJhbnNwYXJlbnQgaHVnZS1wYWdlcy4K
Pj4gVW50aWwgd2UndmUgZmlndXJlZCBvdXQgd2hhdCBvdGhlciBUVE0gZHJpdmVycyBkbyBkaWZm
ZXJlbnRseSAKPj4gY29tcGFyZWQgdG8KPj4gdm13Z2Z4LCBkaXNhYmxlIHRoZSBodWdlX2ZhdWx0
KCkgY2FsbGJhY2ssIGVsaW1pbmF0aW5nIHRyYW5zaHVnZQo+PiBwYWdlLXRhYmxlIGVudHJpZXMu
Cj4+Cj4+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+
IFNpZ25lZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ryb20gKFZNd2FyZSkgPHRob21hc19vc0BzaGlw
bWFpbC5vcmc+Cj4+IFJlcG9ydGVkLWJ5OiBBbGV4IFh1IChIZWxsbzcxKSA8YWxleF95X3h1QHlh
aG9vLmNhPgo+PiBUZXN0ZWQtYnk6IEFsZXggWHUgKEhlbGxvNzEpIDxhbGV4X3lfeHVAeWFob28u
Y2E+CgpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
PgoKPj4gLS0tCj4KPiBXaXRob3V0IGJlaW5nIGFibGUgdG8gdGVzdCBhbmQgdHJhY2sgdGhpcyBk
b3duIG9uIGFtZGdwdSB0aGVyZSdzIAo+IGxpdHRsZSBtb3JlIHRoYW4gdGhpcyBJIGNhbiBkbyBh
dCB0aGUgbW9tZW50LiBIb3BlZnVsbHkgSSdsbCBiZSBhYmxlIAo+IHRvIHRlc3Qgb24gbm91dmVh
dS90dG0gYWZ0ZXIgZ2V0dGluZyBiYWNrIGZyb20gdmFjYXRpb24gdG8gc2VlIGlmIEkgCj4gY2Fu
IHJlcHJvZHVjZS4KPgo+IEl0IGxvb2tzIGxpa2Ugc29tZSBwYXJ0IG9mIHRoZSBrZXJuZWwgbWlz
dGFrZXMgYSBodWdlIHBhZ2UtdGFibGUgZW50cnkgCj4gZm9yIGEgcGFnZSBkaXJlY3RvcnksIGFu
ZCB0aGF0IHdvdWxkIGJlIGEgcGF0aCB0aGF0IGlzIG5vdCBoaXQgd2l0aCAKPiB2bXdnZnguCgpX
ZWxsIHRoYXQgbG9va3MgbGlrZSBhbiB1Z2x5IG9uZSBhbmQgSSBkb24ndCBrbm93IGVub3VnaCBh
Ym91dCB0aGUgcGFnZSAKdGFibGUgaGFuZGxpbmcgdG8gaHVudCB0aGlzIGRvd24gZWl0aGVyLgoK
QlRXOiBIYXZlIHlvdSBzZWVuIHRoZSBjb3Zlcml0eSB3YXJuaW5nIGFib3V0wqAgIldBUk5fT05f
T05DRShyZXQgPSAKVk1fRkFVTFRfRkFMTEJBQ0spOyI/CgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+
Cj4gL1Rob21hcwo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
