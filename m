Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E62A1B9937
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20FB89E39;
	Mon, 27 Apr 2020 08:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B756689E38;
 Mon, 27 Apr 2020 08:02:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eunK4BtvvyrpfHkNqSVf/O4SKWpKltbLhwsiXYtL4r51iiZAgLcDVTKgpipReO78iOGnAkuOYlMqeTbla+RXDvrCJem7OnjJEJSdIXAzgQjdkA+WQGde3dI1oGNxTNmD/orxTDo1p6lW8v37soynYTzobpx86kCy7Hax9aTGvOYBcOx4S0OveCAd/vM/8Gwj6L6m1Ov9O04GSXZFdau3baSlcd6KL2i6cI0i3ZoTgdsIukUlZFzrq1T4xN+FFRF60VbR2EO2UgY1ODT1+SyvKBUU+alloXt5DWPpiQJ46ILkDPT4zf2FSZtUH4xx7nVSDIV3iNa6svX9Svz6+ouU9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfAuTqNdZrxCCoiSEe+Wf0k2MuD/uf7U4RsxgDeBmn8=;
 b=C377x//CPqC+SKKzCt2F5xhQXgfDEWPQ4rST38YGHcLSrfLQhuMdvfVddLyrcXMibAGGcenquhC9ZHO64ISJF9UgNJcnkNS6isviqXcctapSIKO33tqNEvG6AvJnQCMES/Rww9+FSe7WytnQwxKuRkJ/EL9n0+L/lPAzdWZgX6ytG+uDk2hgp5QuAXYnWJj+xKM/D8Zg1nnipbcqKXVZ9gfihRXbXrZ7bhvMnSoukgBdq4mtkg0xi6QTKHMHOdOF04de4rKNDt5lwgbtiW7ZFwGcCtzU86wkunogalUxX7vsF5y3a7cCn1EJ8WvDY6KU75avBT4gwUfEGjgVNndE2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfAuTqNdZrxCCoiSEe+Wf0k2MuD/uf7U4RsxgDeBmn8=;
 b=RWcxERoXtHifnUjyDKb9JsvJGWqVsC9BKSiprpr/HrtGQDZ2VHoPXy5AqpTbbGTzLXm2WzNt41bllXqR+AHbCZjKG9Rogw/Go2BN2d2c7YDM7w6tWbuINXuleVWSh+Am8/41tr3macBKlmtFjIHYI4f6bq1FDPX6Mc7L/DACfqM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB4564.namprd12.prod.outlook.com (2603:10b6:5:2a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Mon, 27 Apr
 2020 08:02:28 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2937.023; Mon, 27 Apr 2020
 08:02:27 +0000
Subject: Re: [PATCH] drm/amdgpu: remove conversion to bool in amdgpu_device.c
To: Jason Yan <yanaijie@huawei.com>, alexander.deucher@amd.com,
 David1.Zhou@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 sumit.semwal@linaro.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20200427063655.21169-1-yanaijie@huawei.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <69374bbb-7e17-8b3a-8a24-591de2c55ee3@amd.com>
Date: Mon, 27 Apr 2020 10:02:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200427063655.21169-1-yanaijie@huawei.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0126.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::31) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0126.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend
 Transport; Mon, 27 Apr 2020 08:02:25 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0fa1a210-ff05-4229-9595-08d7ea8153dc
X-MS-TrafficTypeDiagnostic: DM6PR12MB4564:|DM6PR12MB4564:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4564B5BFA3E2B7B60FFA2BA683AF0@DM6PR12MB4564.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-Forefront-PRVS: 0386B406AA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(81156014)(6486002)(31696002)(8676002)(8936002)(2906002)(66574012)(36756003)(86362001)(316002)(6666004)(31686004)(2616005)(186003)(5660300002)(16526019)(66476007)(52116002)(478600001)(66946007)(66556008)(921003);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 92tJyVm4S8PTKYb/DN0apie4GIbwdLtJZBfOFuybwNkurcruae3jK3ddWAsJXho0luD9T2fXRXSzScTYdh00rYpPUTYcu+LkwImTocOtof822T+tjVv0VkmNw88ni6smnglGX3uX9LYt5q4UJtlUlls+mPpmx+VVKyeZ3g0M4dLQ4UYDyDf91vtZJarRPgn3f6783HNEO8fHRi0ITIqFjpffODHNq06MgZpQ30zrb7eCzcJDrkNGGd1rPEhTrnWaBFdj4ItEfFkorgPInm7TkCwDzmNeGaUf+PnBNJpt1w8vJmxhigR8egL5apPAYsV+gozMp8Z6ALimp9g8FJq5cpFGEG4Ohjwk0cKUDqNvt7nn3XJf+pQAkjTBTxoVjrh/iDfC7JUhE1S9wYMe3yPuTRa/jpEo3Bg/DmKNyG2y3GGvUc+Ur08zxrL6FfH57FpDnA+id37GBt7F4H6Nf5avehq5zERbGd04bApMkGJDKIM=
X-MS-Exchange-AntiSpam-MessageData: bi7Zslq4G9+9LkEP45OSn6S8dXZJ1MPS/5yD7aXZkw81N5MjmC2lxOWUkztXm2AOcdjazvuffxiQeDghDrCC+HHTWhYpN42z/gWTAVcKSSdNqFmx5r6v8stul0TSmeOCD21FTN6UjKwjSrrYoj+BFVywZmLMKszmC2gRMpk6iiByl4fksF/tt8IFaOZGn3BNsg73Eby1H718qjhJ7cFl9C69Pcpfuyrs99+RnMG9bUeMU0Au3zUlBN0LqYsk+O49HSJyW9gLgnyiNgsJy2iYcFb6jQmkeKRD/ezGlOkUclNo8OlnzQjJ5rgB45EK8MHEBSYup79ORsJS/BehCH+gg7P5WkzN2Jnwd8l5dlC0nmysPgqeYl1r/RNJ0n8ljdtQDagircaCngOhF4DXSgMCtzKr9om7ZSFbZy7h3cbNNnQnaCtocOkQyMDgYOU5Y0coVf8MwKFazy26EDWYmqmD338NDDTIwLUhP2QMaQ/oUnNgc08aC3p9MLEVI5iHILSUGe2MsKS9twDzYrPBTf5zha9MGsyKJ5fYoa7GzWHHn4QsTKdiRjlc+XZKLyNLefMzYD5LVghzp6z3tVzpAw96+KjECX6bKGTbD2PmZ7pMdzQblFYAp2dZ22RdTUdAPNYjPJbyav9VCYHt5i9l7j9d8DfIASKv2PeGx8CLG17I1DfLkIosGL7RIBCJ4+bYTkTttWRhcBb0UEgssU2Hvj+dMyYpOjO7h1dVcUv9yvVxZyjA5Bvqm9aUHrwPT3tmFDTm9bkX0TlwrDfHDQYfqeHTyy2Nev0C9DVOCqt4/CvRz4iKuYcr5jh3LG0WydM4r836Zu405La145vgxxxiDRLYSsXvaPq7yR+s+RbACtp5wTM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa1a210-ff05-4229-9595-08d7ea8153dc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2020 08:02:27.8036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rODL7CwHx0iNHsKWqS9dEyCVOthl/LxvVqVq6VKOFsW4cYo9Gceo1wAXp2wbySLP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4564
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

QW0gMjcuMDQuMjAgdW0gMDg6MzYgc2NocmllYiBKYXNvbiBZYW46Cj4gVGhlICc+JyBleHByZXNz
aW9uIGl0c2VsZiBpcyBib29sLCBubyBuZWVkIHRvIGNvbnZlcnQgaXQgdG8gYm9vbCBhZ2Fpbi4K
PiBUaGlzIGZpeGVzIHRoZSBmb2xsb3dpbmcgY29jY2ljaGVjayB3YXJuaW5nOgo+Cj4gZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jOjMwMDQ6NjgtNzM6IFdBUk5JTkc6
Cj4gY29udmVyc2lvbiB0byBib29sIG5vdCBuZWVkZWQgaGVyZQo+Cj4gU2lnbmVkLW9mZi1ieTog
SmFzb24gWWFuIDx5YW5haWppZUBodWF3ZWkuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGV2aWNlLmMKPiBpbmRleCAzZDYwMWQ1ZGQ1YWYuLmFkOTRkZTM2MzJkOCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPiBAQCAt
MzAwMCw3ICszMDAwLDcgQEAgaW50IGFtZGdwdV9kZXZpY2VfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwKPiAgIAlJTklUX1dPUksoJmFkZXYtPnhnbWlfcmVzZXRfd29yaywgYW1kZ3B1
X2RldmljZV94Z21pX3Jlc2V0X2Z1bmMpOwo+ICAgCj4gICAJYWRldi0+Z2Z4LmdmeF9vZmZfcmVx
X2NvdW50ID0gMTsKPiAtCWFkZXYtPnBtLmFjX3Bvd2VyID0gcG93ZXJfc3VwcGx5X2lzX3N5c3Rl
bV9zdXBwbGllZCgpID4gMCA/IHRydWUgOiBmYWxzZTsKPiArCWFkZXYtPnBtLmFjX3Bvd2VyID0g
cG93ZXJfc3VwcGx5X2lzX3N5c3RlbV9zdXBwbGllZCgpID4gMDsKPiAgIAo+ICAgCS8qIFJlZ2lz
dGVycyBtYXBwaW5nICovCj4gICAJLyogVE9ETzogYmxvY2sgdXNlcnNwYWNlIG1hcHBpbmcgb2Yg
aW8gcmVnaXN0ZXIgKi8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
