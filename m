Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B35BF254433
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 13:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06026E417;
	Thu, 27 Aug 2020 11:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F166E417;
 Thu, 27 Aug 2020 11:18:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jERHr2oMoVMBFcB0t9AwWwLDlGvGHnoYNTgF4squ8bBiX1nQdDoOvDk7uX4yCe71Suy4b/fDNRIp0Qrt7yxi3P9f1f+hOpFhlYQmem6kjOjay+/F1XcMP1hDBXAQ0QFDfad6DsSBp6v5L55z6vgiOgbR/2UZhKbYEY7izCHZFeYrhzyCLKcgSCGndF6H/Q4FxEk02up3U03fVsl+ihRR42q4s3UyPouh31MenTXzmFIn0zza5Jwfp/QgtDsnr61EophU3erJzugh1FpeA2WTfwhAq1uj2k2ocULuryDhFkOwgE1eMnXymj17RWLrezqqCkMaeRiHsOoWkUw4FfQYOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wWCfkOgUE+ohYTzwTmGd0xf2a4388Q1FM0IPwadNO8=;
 b=heRvxGgZbMg46pNHcjrBbmfeaQdSRukdKPhxbvwByDQYKq4kstrWG2wZ8LuO+DhwvnTZsA5H3DRH/JpdLjZq1wJ9i0EwrQYvtD2OpeOTh/aL1L5RHrMbA9rDvEPqwFCzRHEghi4nrFgqSeJxyMY/UEP48/m2tKENM7R5uLXBKvN7rLzJ+OxkoW4JxFW1fr/5MfaneHwwIsnoJN0g7B9ScYmMWRQGNTHVhJPl7GMAGleC/PVMvOwu7ABnBuLta56QG0kjU7URPLtoYR4q6FCYaHT8Ofi32lIaCf1I8wKnwshZTWYgl+FkGAgFyAkxerATneWlHw1PlgVkGBEs3Mp/Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wWCfkOgUE+ohYTzwTmGd0xf2a4388Q1FM0IPwadNO8=;
 b=dJQTrYaU7PO+TYXrb9cSB993wp+a8x3E0xJWtVfZDeXYxMV86pfcJpNevZwEXZRfj+Fw4uq/Q8xuzqduC5Psl4m0iU+syNrxsNdPpJujvb+0o1MbiABGkVWIKLP7a0sHftvSLslyzHdWp0Yo4ou2Kd/Er9slpwfDb1fmAnfxiFo=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2451.namprd12.prod.outlook.com (2603:10b6:207:4e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Thu, 27 Aug
 2020 11:18:38 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3283.030; Thu, 27 Aug 2020
 11:18:38 +0000
Subject: Re: [PATCH] drm/radeon: Prefer lower feedback dividers
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, alexander.deucher@amd.com
References: <20200825173349.24580-1-kai.heng.feng@canonical.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <36ccb6ad-d005-4c39-fc32-7ecf4e71331f@amd.com>
Date: Thu, 27 Aug 2020 13:18:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200825173349.24580-1-kai.heng.feng@canonical.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0302CA0030.eurprd03.prod.outlook.com
 (2603:10a6:205:2::43) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0302CA0030.eurprd03.prod.outlook.com (2603:10a6:205:2::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Thu, 27 Aug 2020 11:18:36 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ded730c3-5bbf-487e-4266-08d84a7af1f0
X-MS-TrafficTypeDiagnostic: BL0PR12MB2451:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB24514EF5EAB5D27A5E27FF2783550@BL0PR12MB2451.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0GoVZEQ76I63j7ynoI9+36PY8G/T1ChcfRILiSjV+BWWGz6pdz5wJJ4MFdoxEii6Pn4SRMu3wBPvNze5aEy/MYXuDXqyMLYhiYneZKSHIVdW87bLKInkPu9IuQPLTtcWsF7wU+lSHprq3+Mvj+y7ZTM4LNVXciRpEbqRB3GXNO+4X++qdOL6SaqUsSh/0arvdMFLVtvY8MMfc73KQcLBOxJL43noslBCuS+TA92VMQAs2VzmNyWI9J5U6nlz5qulUlcTMu+eVkp0aF3Hjc7VcNUozBjAMWM/6gDSRIYm/rNo2Uy6QWb5EEYBfsOeVt4ZM3ZElKUo1s9i3j1qsJOaujeSSGFACRHxWyt0kvow+tbEiPHv7JZ+j4myv2WQLcFT6YdNwHPwjRXy5Lu1xHBav7r+t0e7/Xwna9WyopeiVktAGLzk4dL5zxVLs15+jC+DUpOlz/woi4ylC3c4nwlxx+0DgKS1d13fqw6UdrhMdf4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(86362001)(4326008)(66574015)(54906003)(478600001)(31686004)(966005)(16526019)(186003)(83380400001)(5660300002)(6636002)(66946007)(316002)(66556008)(6486002)(31696002)(66476007)(8936002)(2906002)(2616005)(8676002)(36756003)(52116002)(6666004)(154273002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ADhSXVIanPcFQck4TDEe6+mrEx9VoNAX6n38zjoRefNFgZI1wXL9Vu9Z9zLaj08ewP99r6mp1+Bv9HOhsfn98eKZBB8u8kJ9Cfcqa8Dq0cleBQkdLZrmvK1esiT5gK0pUfEPGWkleAi/h2CddJzIf7i7JCvd80C6bvTYJOCo67FxlqFXhc8f2W9ssc9tu9vCSQKmKTKBVLVpjuWVHYfrFT1EgUf7XysEcgjneawQCVxe6RGE/kbXlyA5uh3mOqJgj51QMj4jdC7Kr3huQCunAgRfP0EJecVxjpenzHP/VZAm4Tn0W+MqByoAsZShuyc+41aTVNC5TTPlNQN3ZNWMO+TlOULEW2x4PSypztmpsGEWwyWH1baSE9Md32jtIK5I4jmsZ6FjFElkKjYLn3EKiVX9vp/e9L1z2WL54ASb2IbWwjtmTCJA+9Y0I2oQf7oNzNyksROzB+A/2ZQfWn6oWJaWUzS1yoKf/6E7Vi73s2/m13z5SEXBEPbt+jvyXn97lLKLerECjFq02X3am7NU5WmgdhAXMYwXWXH5neSB5ldTtpYzNZjvtdvyxYxzg0AeXwaX8Gdcu200ux+dShuI73ly75VbxBYx9/OcmVmYTgvd2FVeQoqI8S2iJAgbP78mO3bO9VWdk/9WaPIO6qfkUBvXfOntOQmj7lIu29ojvk5uoDR1R71CZH/VM6ea56JeCF6/6JHbS/qn7gesADZzsg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ded730c3-5bbf-487e-4266-08d84a7af1f0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 11:18:38.0694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21CiNRTvULizoEIWA3WhP3C9+9DQUpIFDaqidSiyYNyXMHUUqBihKNPdX9K9kkK0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2451
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMDguMjAgdW0gMTk6MzMgc2NocmllYiBLYWktSGVuZyBGZW5nOgo+IENvbW1pdCAyZTI2
Y2NiMTE5YmQgKCJkcm0vcmFkZW9uOiBwcmVmZXIgbG93ZXIgcmVmZXJlbmNlIGRpdmlkZXJzIikK
PiBmaXhlZCBzY3JlZW4gZmxpY2tlciBmb3IgSFAgQ29tcGFxIG54OTQyMCBidXQgYnJlYWtzIG90
aGVyIGxhcHRvcHMgbGlrZQo+IEFzdXMgWDUwU0wuCj4KPiBUdXJucyBvdXQgd2UgYWxzbyBuZWVk
IHRvIGZhdm9yIGxvd2VyIGZlZWRiYWNrIGRpdmlkZXJzLgoKTWhtLCBsZXQncyBob3BlIHRoYXQg
dGhpcyB3b3JrcyBvdXQgZm9yIGFsbCBvdGhlcnMgYXMgd2VsbCA6KQoKPgo+IFVzZXJzIGNvbmZp
cm1lZCB0aGlzIGNoYW5nZSBmaXhlcyB0aGUgcmVncmVzc2lvbiBhbmQgZG9lc24ndCByZWdyZXNz
IHRoZQo+IG9yaWdpbmFsIGZpeC4KPgo+IEZpeGVzOiAyZTI2Y2NiMTE5YmQgKCJkcm0vcmFkZW9u
OiBwcmVmZXIgbG93ZXIgcmVmZXJlbmNlIGRpdmlkZXJzIikKPiBCdWdMaW5rOiBodHRwczovL2J1
Z3MubGF1bmNocGFkLm5ldC9idWdzLzE3OTEzMTIKPiBCdWdMaW5rOiBodHRwczovL2J1Z3MubGF1
bmNocGFkLm5ldC9idWdzLzE4NjE1NTQKPiBTaWduZWQtb2ZmLWJ5OiBLYWktSGVuZyBGZW5nIDxr
YWkuaGVuZy5mZW5nQGNhbm9uaWNhbC5jb20+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX2Rpc3BsYXkuYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rp
c3BsYXkuYwo+IGluZGV4IGUwYWU5MTFlZjQyNy4uN2I2OWQ2ZGZlNDRhIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rpc3BsYXkuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX2Rpc3BsYXkuYwo+IEBAIC05MzMsNyArOTMzLDcgQEAgc3Rh
dGljIHZvaWQgYXZpdm9fZ2V0X2ZiX3JlZl9kaXYodW5zaWduZWQgbm9tLCB1bnNpZ25lZCBkZW4s
IHVuc2lnbmVkIHBvc3RfZGl2LAo+ICAgCj4gICAJLyogZ2V0IG1hdGNoaW5nIHJlZmVyZW5jZSBh
bmQgZmVlZGJhY2sgZGl2aWRlciAqLwo+ICAgCSpyZWZfZGl2ID0gbWluKG1heChkZW4vcG9zdF9k
aXYsIDF1KSwgcmVmX2Rpdl9tYXgpOwo+IC0JKmZiX2RpdiA9IERJVl9ST1VORF9DTE9TRVNUKG5v
bSAqICpyZWZfZGl2ICogcG9zdF9kaXYsIGRlbik7Cj4gKwkqZmJfZGl2ID0gbWF4KG5vbSAqICpy
ZWZfZGl2ICogcG9zdF9kaXYgLyBkZW4sIDF1KTsKPiAgIAo+ICAgCS8qIGxpbWl0IGZiIGRpdmlk
ZXIgdG8gaXRzIG1heGltdW0gKi8KPiAgIAlpZiAoKmZiX2RpdiA+IGZiX2Rpdl9tYXgpIHsKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
