Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3D1280EFD
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 10:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB9E6E239;
	Fri,  2 Oct 2020 08:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680052.outbound.protection.outlook.com [40.107.68.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E095D6E239
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 08:31:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jbzl363dZh0bBLwKUwuUuzgS1pE3QcWOq956vRUgU/SF4WqO9/zCa/bzwgkltPuKmSDJEzWlv+y27Dqv/pxbJJamqLV5nZWJ6MwSkregzIpvjV4g2NcmnqgO/JEP3yz6swHSO0SuRg5gIjcq2+ihY7L2WneVTH3WANrRHCTWQi8cpRSjw/GgUyCTi6UvRORqXCzGTHC7qH/CxghgUxqI3b2rOcMB8H/2QsZCCwBEIbJlmkZwj8VPKWdOXXx9rpVdjpUhqlxjv+920UVMAarg+a+HhNPd69PZz7/HJ3RGIXWY0xoe51YnQNspbtGKr/Kl+4GDITP/n7jflOKUifwNrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72rxeVddBQuuiAo5yaZPI20Dmw7CwZ+VFn6/q6B68X0=;
 b=gSa7bOMorYYX0KNMZ+n6P1KWNY+O70UpCUY6YYw3GFd7zqB1yHPolg61BkTEpn2noVj9AfW1WdHvcGCe9aHwKf9I+1Joa23enH9phSk+ziLXun7s5Hkg48Tz2hPMdXplUGzaIBjO7z6b2TIqEydy3fOq9meyUl+RvWWek62VQUodds2EFrKfPEJ9fuxRmZLwaktFJrTBysXM2ZQz7B/cyDyr63hBD3aiRIfCJaq4SzKSRQrg3AsT/f18x0H9RskcW8v9UR+2g7irpF1pk9xcjXfv7aLGuuvdPftnGZWr8JE6pRnxWLKs7iUWMR/DGF6BEKgTndcDFy55P0gzr2r3NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72rxeVddBQuuiAo5yaZPI20Dmw7CwZ+VFn6/q6B68X0=;
 b=SPeesSTMdmi0d3bLi7GJuCQzVl6t0NaQqsu1Abix5/OVoUjjOw5UavUSWgpsMtZBbCWOsGLZRNKCGoHtiyU0qMHI/VmF5ZyVEQIZF1wJHSKflcwmz8E22VH9b72vCQEZRCtgBHlGTyf4rFG/DsBh2vY9Q/dJvl6U43n4t6yC6AQ=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3967.namprd12.prod.outlook.com (2603:10b6:208:16c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.23; Fri, 2 Oct
 2020 08:31:37 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3433.032; Fri, 2 Oct 2020
 08:31:37 +0000
Subject: Re: [PATCH v2] drm/sched: Avoid infinite waits in the
 drm_sched_entity_destroy() path
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20201002065518.1186013-1-boris.brezillon@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c62d5cab-a340-00cc-43ed-0a1edba76cc1@amd.com>
Date: Fri, 2 Oct 2020 10:31:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201002065518.1186013-1-boris.brezillon@collabora.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0018.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0018.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38 via Frontend
 Transport; Fri, 2 Oct 2020 08:31:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c063ca21-2703-4bb7-13a2-08d866ad939b
X-MS-TrafficTypeDiagnostic: MN2PR12MB3967:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB396777DEAB31AA499DA60DFB83310@MN2PR12MB3967.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yn2MYstDcW2hhyUxT2nhLhWeZDD/NE3R6DEJupemt1uWDE97jw95I7B2N5f92qsSFhaqTiiCQZU+1nJeYv0IAJsrzumw7GEajhprsjlViUJbEXlXXQBw/F319m7tDiojWn9xLLiGAN+WASMkfnsPUJHXxgoaxx206UHkB1ozcnB6N1KoUJA0oeVhoEoYetvnVGmOrpy9sucnWi6XeKdgTL3xIXsJME2+1y91c+Pg3XYKfScReSs2YANOVp8zgn9IZV8YFWWwY/MNKNrZGTn80bEpBe7QWoWvqTcUqTcNxQEC0SoZodZ4hkKduXjTHoHSTajZ/G1SkMEWpO4gjXVUBSKFC5tjLysxlAbA2bWrIuyR8TzuhpDv+vT4Y/tTIDR+9qeQeHKZwJi4hWXs+V+BhYnaMgEhTlXWnRYWjQI0tGBmwe7THB+IfYyn6ZPl8b3x
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(54906003)(36756003)(16526019)(6486002)(8936002)(66574015)(86362001)(83380400001)(66556008)(8676002)(6666004)(66476007)(478600001)(316002)(186003)(2616005)(4326008)(31696002)(52116002)(2906002)(5660300002)(66946007)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: podHCAKpg4MPAz/HkfUITEMpnIAmS4v0uvqBwBsB11vJ2J7IKPkEkRPkpmR6opL3kZyZQ1M9NoIMUk8ju+KYUYVVtRhCvnmnDx75LLDF1GghCqiQ8o8aFHEw89ZHAUMT0sDcBlf60UTSXHfb45Uvz8AptXV6hmg+xKBQxcN+17U36r8LPVyc8CVHz6wiBUOxthE8DFEmHDIr+jgXYguA3Eg7WZsC7Zte3FE3V6i/Lc9cJWshdasb3433+lE/N3XkkvFmeM+l18ow5w6p44janHLNKKGkgh8WyTeeFpS5ZVsduidj4ydDQqjCegL31GBrVHfYxJC6Jqq72by3VSBg8TA/MtcF/P9fD1x9+DdbaFiAuuN9FAW/mVXlGzwbF09ahB/RCrvhg8MrMOlcy37Bz3lCHot28Qffu0LnNFRWteD0U46A8g90fzVWQ+6ccDlT6LO0LWEiBnR7UMgYuvmVC/ehUcpyGTmPCdDFiHNETRREK0gfY2lYr2i29MxJ9TuhnRjEma7sT+qneh0Px8Wns8rs8Y2O39v2/ap/8SIAkSeA/frb8EhlbrQ1WZNdrBgk/0JKh6uY9TXQhAnhvPN/GLNv1zwdHxoDY1VDxN/7Ku/+bIkcof31ZV2fNvIhBBdmCPFCBFf/b8nAm1d5v1s6ayDMnn6AbZxuIGY9vdtk2PF4VFt9eK9JP5hRnTHsSnSbjJntLd/BbI5ZJRl6ouKxxA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c063ca21-2703-4bb7-13a2-08d866ad939b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 08:31:37.2490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YSV/CcR7hOSMBm76LuXP/OlmsihYAKmb1p4vaGAU86fnAtX9bE4Tg2RlC2W0mll2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3967
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
Cc: Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>, Robin Murphy <robin.murphy@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDIuMTAuMjAgdW0gMDg6NTUgc2NocmllYiBCb3JpcyBCcmV6aWxsb246Cj4gSWYgd2UgZG9u
J3QgaW5pdGlhbGl6ZSB0aGUgZW50aXR5IHRvIGlkbGUgYW5kIHRoZSBlbnRpdHkgaXMgbmV2ZXIK
PiBzY2hlZHVsZWQgYmVmb3JlIGJlaW5nIGRlc3Ryb3llZCB3ZSBlbmQgdXAgd2l0aCBhbiBpbmZp
bml0ZSB3YWl0IGluIHRoZQo+IGRlc3Ryb3kgcGF0aC4KCkdvb2QgY2F0Y2gsIG9mIGhhbmQgSSB3
b3VsZCBzYXkgdGhhdCB0aGlzIGlzIHZhbGlkLgoKPgo+IHYyOgo+IC0gQWRkIFN0ZXZlbidzIFIt
Ygo+Cj4gU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29s
bGFib3JhLmNvbT4KPiBSZXZpZXdlZC1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJt
LmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+CgpTaG91bGQgSSBwaWNrIGl0IHVwIGZvciBkcm0tbWlzYy1uZXh0PyAoT3IgbWF5YmUg
ZXZlbiAtZml4ZXM/KS4KClRoYW5rcywKQ2hyaXN0aWFuLgoKPiAtLS0KPiBUaGlzIGlzIHNvbWV0
aGluZyBJIG5vdGljZWQgd2hpbGUgZGVidWdnaW5nIGFub3RoZXIgaXNzdWUgb24gcGFuZnJvc3QK
PiBjYXVzaW5nIHRoZSBzY2hlZHVsZXIgdG8gYmUgaW4gYSB3ZWlyZCBzdGF0ZSB3aGVyZSBuZXcg
ZW50aXRpZXMgd2VyZSBubwo+IGxvbmdlciBzY2hlZHVsZWQuIFRoaXMgd2FzIGNhdXNpbmcgYWxs
IHVzZXJzcGFjZSB0aHJlYWRzIHRyeWluZyB0byBjbG9zZQo+IHRoZWlyIERSTSBmZCB0byBiZSBi
bG9ja2VkIGluIGtlcm5lbCBzcGFjZSB3YWl0aW5nIGZvciB0aGlzICJlbnRpdHkgaXMKPiBpZGxl
IiBldmVudC4gSSBkb24ndCBrbm93IGlmIHRoYXQgZml4IGlzIGxlZ2l0aW1hdGUgKG5vdyB0aGF0
IHdlIGZpeGVkCj4gdGhlIG90aGVyIGJ1ZyB3ZSBkb24ndCBzZWVtIHRvIGVuZCB1cCBpbiB0aGF0
IHN0YXRlIGFueW1vcmUpLCBidXQgSQo+IHRob3VnaHQgSSdkIHNoYXJlIGl0IGFueXdheS4KPiAt
LS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMgfCAzICsrKwo+
ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMgYi9kcml2ZXJzL2dwdS9kcm0vc2No
ZWR1bGVyL3NjaGVkX2VudGl0eS5jCj4gaW5kZXggMTQ2MzgwMTE4OTYyLi5mOGVjMjc3YTZhYTgg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMKPiBAQCAtNzMs
NiArNzMsOSBAQCBpbnQgZHJtX3NjaGVkX2VudGl0eV9pbml0KHN0cnVjdCBkcm1fc2NoZWRfZW50
aXR5ICplbnRpdHksCj4gICAKPiAgIAlpbml0X2NvbXBsZXRpb24oJmVudGl0eS0+ZW50aXR5X2lk
bGUpOwo+ICAgCj4gKwkvKiBXZSBzdGFydCBpbiBhbiBpZGxlIHN0YXRlLiAqLwo+ICsJY29tcGxl
dGUoJmVudGl0eS0+ZW50aXR5X2lkbGUpOwo+ICsKPiAgIAlzcGluX2xvY2tfaW5pdCgmZW50aXR5
LT5ycV9sb2NrKTsKPiAgIAlzcHNjX3F1ZXVlX2luaXQoJmVudGl0eS0+am9iX3F1ZXVlKTsKPiAg
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
