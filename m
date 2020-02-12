Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E80815A8DE
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 13:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397546EA95;
	Wed, 12 Feb 2020 12:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475A96EA95;
 Wed, 12 Feb 2020 12:12:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cx9mDLsAsgYYXIcPOJNERvc7QKvm0OQ/A5bhPGJbZLYUrnDHhwCAzYHmDu9WHtIti70Cik8DNDVVPvljrVdCayfoQ2iV1MaVarA2xO9uSrUUqWsZOF3klZwkHhjVqPe+7xmIPrFdURA1sXmM5RMNqTwa4105hLAbdZ4/gjHwrNO0UNy/WyvDuacF5+b0UHFXbN0EaBbW7c3jm1DgSjPrZafHnri1tKwWItd0I0cUXe0/LOfvX594BPTXm49Ef193sC19laDDtdR8zikiUzSeoaJW6K5Q6cojA0Q3Vw/2w5HrnwlIuTcEIHPcba4qDVSAb7En36qM7CDdMVU4y10x5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3f7ppoqe2PTs7uz+8tx2oOXv7ne69gyeVjOuNrw6I8U=;
 b=Mldb6Loh6ILOhfETiq8/05cy7tB59+NohHkFiy48XwJed9GytYed773RTkAkeRhz9TNIBmE6D6Jpd6Vf3HO7DsGSzDQJ2YJ7hB7F2yxpwPzkxAC/fUXLuYd1zzM5MoNs73CHcnAqpsMSim9QbSLr7JndqUD/MyKJ+zjogk98pHjU6o94su/bSz6uBUQTKwtsCs0oHSns9NVUdyZm1w6IXaTdVOPNPcZzKeNLN2E08csMlMLPwRPH2r0Gqol/meLyWUXW6PIvkFj+bY/2r/qIDUvKqsC1HhZRi4Lw3U+wWGYnz5U1EsrISwmcMN6+uH1TQhpSawpKr44WBAtrW4Uc9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3f7ppoqe2PTs7uz+8tx2oOXv7ne69gyeVjOuNrw6I8U=;
 b=pbgjuALzn9G54c4DLDt//hHZnUhgJ2A4KGZEzvQkAykYH5/0PryTmjNN+O80UohQ/74UMzR/4y3wLo842vtyJj+dgPJdR40yx6R7GdADWrnss2yW2f+/nL6lPj0Dh4XuzlvkxNrPtnb0KPGwfciXGFtDS8CzWBPccEwA5TDkWKg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2360.namprd12.prod.outlook.com (52.132.208.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.23; Wed, 12 Feb 2020 12:12:25 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2729.021; Wed, 12 Feb
 2020 12:12:24 +0000
Subject: Re: [PATCH] drm/amdgpu: return -EFAULT if copy_to_user() fails
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20200212120759.dokjxbk4cqln55sc@kili.mountain>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <577d76db-3c2d-545d-6237-1c66f17ec178@amd.com>
Date: Wed, 12 Feb 2020 13:12:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200212120759.dokjxbk4cqln55sc@kili.mountain>
Content-Language: en-US
X-ClientProxiedBy: ZR0P278CA0051.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::20) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 ZR0P278CA0051.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21 via Frontend Transport; Wed, 12 Feb 2020 12:12:22 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e4c546c6-21fd-4362-2216-08d7afb4d1b1
X-MS-TrafficTypeDiagnostic: DM5PR12MB2360:|DM5PR12MB2360:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB23604604FE04503CF797D25A831B0@DM5PR12MB2360.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0311124FA9
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(189003)(199004)(2616005)(86362001)(316002)(5660300002)(6636002)(8936002)(66574012)(52116002)(8676002)(66946007)(66476007)(2906002)(66556008)(478600001)(4326008)(31686004)(31696002)(81166006)(81156014)(6486002)(110136005)(54906003)(6666004)(16526019)(186003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2360;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +x1HZ1k8Fj4zfnTrfC9ODqqzR63moetRlW6wyCWEsQaKQpHcF1NLR/jiiwJ/X/MFAAGFnYD5kwt3OHJQBi4eebOHQYdrJBdGzbhHq64+ZESXRZcnkG7AwuUqJgi2vhEolsVx1eiBzOexzZEIvlltypwpIALw+GhDRF0lY60qjRWCS4SAGigk2dmXtSfvapk8kVdjb9nKfgnTnv70LmDSh9IfolIsazsvPvH62xi7kTuEQgaEEKh4bJD5bSiMjLigTKEHUeScL0OHjdPSZZjoFSgAIfx6js7rULLByU4qWqlCoNH/naUfoClPLjzNJJRyposUG/2qQLznjNY4XCxhFP3kPkDNsDqGvEk2fMWV20JO+SRteP42JWXWWKC2nU2ZlcCeSwVYY+cA64qYAoVihSjXUe8TyF25eeApmkKtAhYkdjYQd6amryKxmRrZCNWK
X-MS-Exchange-AntiSpam-MessageData: 5fBUy1TVT22lxZW/nAMlj4PyHHdiWWxb1DWLYHPILWDv5QSDLadkgt/jeKFmpG/lEKqMvc/S84d0E8V6UvWiPtR5tTMritiWEXLBqUiZC0MfoRR6SfpUiZx4MzByF4dr42s+VLkZpvnmGpZNrzAOkGr+ISjkfQ1vJRptaM2zZoFOgv1f9Rm1h1awjU9Pm+k/5AKptNHsdUas4mY4mgB/nw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c546c6-21fd-4362-2216-08d7afb4d1b1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2020 12:12:24.8563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AkrzvCzYUo37GhD9UBVAvo+hDgZ/kvFdtsBe9qTVa4j/BZu0txvblvgEKNssahtf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2360
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
Cc: Jonathan Kim <Jonathan.Kim@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 "Tianci.Yin" <tianci.yin@amd.com>, kernel-janitors@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTIuMDIuMjAgdW0gMTM6MDcgc2NocmllYiBEYW4gQ2FycGVudGVyOgo+IFRoZSBjb3B5X3Rv
X3VzZXIoKSBmdW5jdGlvbiByZXR1cm5zIHRoZSBudW1iZXIgb2YgYnl0ZXMgcmVtYWluaW5nIHRv
IGJlCj4gY29waWVkLCBidXQgd2Ugd2FudCB0byByZXR1cm4gYSBuZWdhdGl2ZSBlcnJvciBjb2Rl
IHRvIHRoZSB1c2VyLgo+Cj4gRml4ZXM6IDAzMGQ1Yjk3YTU0YiAoImRybS9hbWRncHU6IHVzZSBh
bWRncHVfZGV2aWNlX3ZyYW1fYWNjZXNzIGluIGFtZGdwdV90dG1fdnJhbV9yZWFkIikKPiBTaWdu
ZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+CgpSZXZp
ZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKQWxl
eCBkbyB5b3Ugd2FudCB0byBwaWNrIHRoYXQgdXAgb3Igc2hvdWxkIEkgZG8gdGhpcz8KClRoYW5r
cywKQ2hyaXN0aWFuLgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV90dG0uYyB8IDYgKystLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+
IGluZGV4IDE1ZjU0NTFkMzEyZC4uNjYwODY3Y2YyNTk3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+IEBAIC0yMjgwLDcgKzIyODAsNiBAQCBzdGF0aWMgc3Np
emVfdCBhbWRncHVfdHRtX3ZyYW1fcmVhZChzdHJ1Y3QgZmlsZSAqZiwgY2hhciBfX3VzZXIgKmJ1
ZiwKPiAgIHsKPiAgIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGZpbGVfaW5vZGUoZikt
PmlfcHJpdmF0ZTsKPiAgIAlzc2l6ZV90IHJlc3VsdCA9IDA7Cj4gLQlpbnQgcjsKPiAgIAo+ICAg
CWlmIChzaXplICYgMHgzIHx8ICpwb3MgJiAweDMpCj4gICAJCXJldHVybiAtRUlOVkFMOwo+IEBA
IC0yMjk0LDkgKzIyOTMsOCBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVfdHRtX3ZyYW1fcmVhZChz
dHJ1Y3QgZmlsZSAqZiwgY2hhciBfX3VzZXIgKmJ1ZiwKPiAgIAkJdWludDMyX3QgdmFsdWVbQU1E
R1BVX1RUTV9WUkFNX01BWF9EV19SRUFEXTsKPiAgIAo+ICAgCQlhbWRncHVfZGV2aWNlX3ZyYW1f
YWNjZXNzKGFkZXYsICpwb3MsIHZhbHVlLCBieXRlcywgZmFsc2UpOwo+IC0JCXIgPSBjb3B5X3Rv
X3VzZXIoYnVmLCB2YWx1ZSwgYnl0ZXMpOwo+IC0JCWlmIChyKQo+IC0JCQlyZXR1cm4gcjsKPiAr
CQlpZiAoY29weV90b191c2VyKGJ1ZiwgdmFsdWUsIGJ5dGVzKSkKPiArCQkJcmV0dXJuIC1FRkFV
TFQ7Cj4gICAKPiAgIAkJcmVzdWx0ICs9IGJ5dGVzOwo+ICAgCQlidWYgKz0gYnl0ZXM7CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
