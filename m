Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F33E61C58A9
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 16:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4346E26F;
	Tue,  5 May 2020 14:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C296E26F;
 Tue,  5 May 2020 14:17:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTwMMdSXk86f9sU25Er2ZrmP+IAXOtBmRH6lV6K/C9uEYotthNLSpeixGHFQp/sBN/+Ux4vQzNr/RXkDiRwIZf26EPk5/PMBWt0c/HNLVuE0+BCmdJTHwVPjPy9XhJW2szIoKb5sJd93FEcR6xU6yRQjx0hsoMOY/FjFxN6trgf2Gc+aVfOrAidH+lPgX01q3PZU8Bi4gI8AWA6fcMC3mW+2uGZGlQ/mgz8R5neSNdnhttZlyAuPNJbHYgpWLFswT4JIfXdJ9E1jgTd26IqGggNhhM/54WBjTLAybCHCiqfNIwAscRIsWgKspUoC5Edm0Ys2HOvJ9MtO1fpfHIWssg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSX4ilqrJ63bGDLmAyA/63T2YgBZrcYZjNEIh/Oqjg8=;
 b=b1TPWpzqEzEr47DJZdyvorA6ChnxXlaKGKZq3ukAf6g5zNU5qCwMF+IbBF2lRW+3FCNHMVlt3OU09M9kdAvzAMUg++0w2TjRyT6vSby08Ck+Dy8yHVto4T/uqkLzy72ZenBK/JgY6hu3MiCXbZh7WoiH4hkNowsedkfyWEc65Ig9okjAWWjWREWdDLmbCensMci/4j+wmmSwGhdCIASTOra3tNGEnYUDf7FqCVoooJQX6moEyxjLiK4vTIgezccAN9hHY85ApXwta6KLKmL9vT5/b9rnV6lVQ7BRsCu3DHUcgPiPb73zo+N3XtSnB15616zX7hifI7Q4jJamRadE7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSX4ilqrJ63bGDLmAyA/63T2YgBZrcYZjNEIh/Oqjg8=;
 b=NkZP1v5S6GCWMrPk/71nwTcH1wugAOb0nJVrK7u8dl5rYczOP1SIOHtR2SCt86GvXhl9DfbndSxq3T/GajvOI5iypADJQVzj1Wxkx0FHmHsaEXx8Zx67fDUYBOX3Ikq17TIdl8e10XAevn1EcqOxt6ka4JKVkKv79ExztzbCEZs=
Authentication-Results: googlegroups.com; dkim=none (message not signed)
 header.d=none;googlegroups.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3596.namprd12.prod.outlook.com (2603:10b6:5:3e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29; Tue, 5 May
 2020 14:17:06 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2979.027; Tue, 5 May 2020
 14:17:06 +0000
Subject: Re: [PATCH] amdgpu: fix integer overflow on 32-bit architectures
To: Arnd Bergmann <arnd@arndb.de>, Alex Deucher <alexander.deucher@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Evan Quan <evan.quan@amd.com>
References: <20200505141606.837164-1-arnd@arndb.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e4a852b2-807b-bc73-7328-bcc399341085@amd.com>
Date: Tue, 5 May 2020 16:16:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200505141606.837164-1-arnd@arndb.de>
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0116.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::21) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0116.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend
 Transport; Tue, 5 May 2020 14:17:02 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 26815344-3fc2-4d2e-e3db-08d7f0fefd64
X-MS-TrafficTypeDiagnostic: DM6PR12MB3596:|DM6PR12MB3596:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3596F390893E330D97A4F0B183A70@DM6PR12MB3596.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0394259C80
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KaQgGPXlPqwW268N5DGaLZ9UqH2nezz7ZC1jnmahY4OSqUjpJiDYV4F9xq2xE3FFdqGUmD1d16jK887A1MIKz/6OEMWOSFfn0IKqIEg0nT3qhTOUghIwqEdDnAqJjrBcpubl9pKgE2KzdjaSFJPeQM0AJt4eoYVPsVNJtwT+R/theJsGCQHJXaAUGyh6QTRrZJb87eNRmhrAlcc2ycECyMAKUWc776kykoL+DX3d7Y9oJffDMzO4HGI5lxWmA2HAcShxZ8F6crzcS2d6Rymm2B4h2yQWVERSyQdqWY/4TL+nsa6xgfddugFs2HuLr3FdY7xq/QlZ7YsnA8snPi+eBZuQ66iuAvuXrKY1AYwmKmIiMw4qIcfRKL2mz5zffX+ZzyOiQZng2kBI6yAj+ONhp2AHMMiBWVnYQrA/hNc9AXio89iw+sxE2cjj/yoeUmYcYh+GMqkmBodhhcJdcTFH6ufxuZzQhZ+4q22DPIJjAfCz+OS0ClRisE0ZVUK+d7S3PCVwi/PsLVVxHNJwc4GvXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(33430700001)(478600001)(31686004)(4326008)(6636002)(6486002)(31696002)(33440700001)(16526019)(186003)(86362001)(6666004)(36756003)(54906003)(2616005)(110136005)(66574012)(66476007)(66946007)(2906002)(52116002)(8676002)(5660300002)(66556008)(8936002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 1vNBnmUD2Ca9zDw1mF4DDeu80iMi3ZbEwYIHARuvVgXRNBu0WT48imymAY2XK5DjQGRjfMKUBugkT75R7aVEXltQADdbvk+sVvOAvEn9+f0NEf0OvEIP+BYa8xQJFQuIO6N9aKl2UYO6RmBjUsJ/jLfINQ9/reALOPr2W7g0+L2Y0LBLJW7IRbMNOiLD/EIQMI+sR0zog3UBqSeBQOpb9xxOxyerByU9Udj4Go4/ndkBmzp8QJmdXAmAQJcY2lEW0OIUV9R+Z8olroB9JCJrIZp9pIy9xUf3TfB/0hzxYsRNJ9z9uRvs8CWEpxNf04e58cimG9t0B5SulAlwgTkAUX5v5Cv9RQ5g8xk0gi4tSItxeCDXYC86z+vFo71pIlDHHKpge5ADYAxPuBkrtrtQIZ5sFIKgRvHG2RG4A9iZg83Kz8ApcpcrkYZ3e6tFtjVb8NF/wYClyD+Cdf9wN5lMK1ybzO3kqUn2lYzTTLqee4BCoiaAfw3jPTM/Ngc0dN7OjwqJ1Mktf42ToutUz/8dgDZk1adLuqwJGO1bV/NM20x9NpzMqAzt9NigybVFtig1EY3CAXnxDF0WtuUtkT1hTHkv/2Y8anf4qv4lNP8fz/3yJRzK2f70755lCVVeXlMZ+pq1owVQKueWdYJOJjQDnwTiYaShcOrzUyKrUZVymsqFM3T16UNXyTBDlTb6qR7ju4gmUlBKiNBzS5ddq3f0mrVuhzPwWsV5eRKLahpdD2x+rTDbclFWmxXQ6FcpvOyrp2Z28oFnk8j48GpoXgI6CxZwATp2NlyqYCtxLyIeftxajHZ5vrLAK0ys6LPH1bKLP4A81W8/7XIkz3UnBXjT4AKmSf96AjGheyoaLk12GP0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26815344-3fc2-4d2e-e3db-08d7f0fefd64
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2020 14:17:06.2987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IAKBi0sO6PGJCWXmaXaixuWoyWAe6aijK6n5Fp3zqDjNtPz03EK1eWmX04FXsG+M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3596
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 clang-built-linux@googlegroups.com, amd-gfx@lists.freedesktop.org,
 Hawking Zhang <Hawking.Zhang@amd.com>, Monk Liu <Monk.Liu@amd.com>,
 Kent Russell <kent.russell@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDUuMDUuMjAgdW0gMTY6MTUgc2NocmllYiBBcm5kIEJlcmdtYW5uOgo+IE11bHRpcGx5aW5n
IDEwMDAwMDAwMDAgYnkgZm91ciBvdmVycnVucyBhICdsb25nJyB2YXJpYWJsZSwgYXMgY2xhbmcK
PiBwb2ludHMgb3V0Ogo+Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rldmlj
ZS5jOjQxNjA6NTM6IGVycm9yOiBvdmVyZmxvdyBpbiBleHByZXNzaW9uOyByZXN1bHQgaXMgLTI5
NDk2NzI5NiB3aXRoIHR5cGUgJ2xvbmcnIFstV2Vycm9yLC1XaW50ZWdlci1vdmVyZmxvd10KPiAg
ICAgICAgICAgICAgICAgIGV4cGlyZXMgPSBrdGltZV9nZXRfbW9ub19mYXN0X25zKCkgKyBOU0VD
X1BFUl9TRUMgKiA0TDsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+IE1ha2UgdGhpcyBhICdsb25nIGxvbmcnIGNv
bnN0YW50IGluc3RlYWQuCj4KPiBGaXhlczogM2YxMmFjYzhkNmQ0ICgiZHJtL2FtZGdwdTogcHV0
IHRoZSBhdWRpbyBjb2RlYyBpbnRvIHN1c3BlbmQgc3RhdGUgYmVmb3JlIGdwdSByZXNldCBWMyIp
Cj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KClJldmlld2Vk
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+
IEknbSBub3Qgc3VyZSB0aGUga3RpbWVfZ2V0X21vbm9fZmFzdF9ucygpIGNhbGwgaXMgbmVjZXNz
YXJ5IGhlcmUKPiBlaXRoZXIuIElzIGl0IGludGVudGlvbmFsIGJlY2F1c2Uga3RpbWVfZ2V0X25z
KCkgZG9lc24ndCB3b3JrCj4gZHVyaW5nIGEgZHJpdmVyIHN1c3BlbmQsIG9yIGp1c3QgYSBtaXN0
YWtlPwo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5j
IHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rldmlj
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4gaW5kZXgg
NmY5M2FmOTcyYjBhLi4yZTA3ZTNlNmIwMzYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jCj4gQEAgLTQxNTcsNyArNDE1Nyw3IEBAIHN0YXRpYyBpbnQg
YW1kZ3B1X2RldmljZV9zdXNwZW5kX2Rpc3BsYXlfYXVkaW8oc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpCj4gICAJCSAqIHRoZSBhdWRpbyBjb250cm9sbGVyIGRlZmF1bHQgYXV0b3N1c3BlbmQg
ZGVsYXkgc2V0dGluZy4KPiAgIAkJICogNFMgdXNlZCBoZXJlIGlzIGd1YXJhbnRlZWQgdG8gY292
ZXIgdGhhdC4KPiAgIAkJICovCj4gLQkJZXhwaXJlcyA9IGt0aW1lX2dldF9tb25vX2Zhc3RfbnMo
KSArIE5TRUNfUEVSX1NFQyAqIDRMOwo+ICsJCWV4cGlyZXMgPSBrdGltZV9nZXRfbW9ub19mYXN0
X25zKCkgKyBOU0VDX1BFUl9TRUMgKiA0TEw7Cj4gICAKPiAgIAl3aGlsZSAoIXBtX3J1bnRpbWVf
c3RhdHVzX3N1c3BlbmRlZCgmKHAtPmRldikpKSB7Cj4gICAJCWlmICghcG1fcnVudGltZV9zdXNw
ZW5kKCYocC0+ZGV2KSkpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
