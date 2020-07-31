Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCE12346A0
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 15:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1726EA95;
	Fri, 31 Jul 2020 13:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680085.outbound.protection.outlook.com [40.107.68.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153E06EA95
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 13:10:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mnYNBMpVvoSTr5yJrfIpyK1RumfmXUOjPcxKzV1LJ1e7t6sRtNPR4l2TBpcguDp8K8Y8Gu3APZ5IRjxVY1d2RavAeKrbMkdQdPsUwRaCfKEKLZtH6I9T7MwkBN4IgHWSUL+U6aV+15CGsDcB7Ccj/YRzm+wH1YtpCEbjwLNS4wg2hzx9QYH0ASabSxbZazV5NnMb5za4xMEVwZbKfcsW5/swqBvlnEV+RvBEW1/dHeakLBXuW2B5H7a/faeMLVBbAi55dnATfNTiCtEWKGVmwGh7UaE/BZx4swSKz9ugSjx2vWWT9KEeWuhajHlDoSNsVD+4AvGvGoaVhu8gT4vIKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EalLYqbukiJrmbIl5sHedeHBDZA6vhA9DE+/ci8G6U=;
 b=R1BDv8HXzzbKT3+/K+nTEiySXlSLJCFBk6NCE8AYofALzNMuBeowcmU2mRE4408i8diWUcJcmrWdEfpmERXV1egZ7eYIIfUGutz9rfn37tl/zRgl6rd59s465VsRAitvI9E6+pB4vNiSOYqOtPJtaAG7nyVwa2gTO4C5yEm9XBOu7t7XWUN6SXeoXw95uVXmEBepgvI4VO3PGMouE442zwcGu1b6RmG9zf+YT5djEqkrff2JNo6FyqIAnRy0VwiYAeZHaKBDLMr4ciIS7BEjhtHQvuKvCEhHNi/9JaXKJArS2HSqBoGe9cETe/dbMorQ0CXQruqDchMXPb4bb1Oorg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EalLYqbukiJrmbIl5sHedeHBDZA6vhA9DE+/ci8G6U=;
 b=n2t25Dj9kPgYoM1na9M2qcsNStsr9n/JO/Y1djgglHQ032bhMMiNsQSNE51ItK20loHjy3T1mnwQc9hPdqGS3603yzzNh00exYh4uzQAKHxiixWmyn/eWU4bHzhyOKa2jKyXRCtNCYhWEemDy7tRhOzQPpQKzP9VnwsAUBMQbCo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4096.namprd12.prod.outlook.com (2603:10b6:208:1dc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Fri, 31 Jul
 2020 13:10:32 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 13:10:32 +0000
Subject: Re: [PATCH 21/49] drm/radeon/ttm: use new takedown paths
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-22-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <16ffe51a-5204-b528-90a1-cccd9a627ae0@amd.com>
Date: Fri, 31 Jul 2020 15:10:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200731040520.3701599-22-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0076.eurprd02.prod.outlook.com
 (2603:10a6:208:154::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0076.eurprd02.prod.outlook.com (2603:10a6:208:154::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Fri, 31 Jul 2020 13:10:31 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fc87097a-d33f-40aa-2afa-08d835531abd
X-MS-TrafficTypeDiagnostic: MN2PR12MB4096:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4096B0CEAB59E07108A8D772834E0@MN2PR12MB4096.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:60;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ja+8BttiV+q12WJiKWrDlPkUK/qC7bon4UfVPdqbI0DZsg6uSjhS58wdtFR7ScQ28Kr0RtMqqRrRcKhKoI5yb7EAZlt/PAX1msoMdjkvn37bwK63Y6z676T6YvE1cZw51ildaWQAuCcYHx0Jb7ue0ukiv/EnJ0NZImVLEokrTzCWmmikzF8hsJ4Zod9tq0ay7KZkKmSXfBTjWv1eAGFdThh6003y6WugMtuc8gW2EeC2BypdPPlT5QY80ZIDuuJloC5h8vNLbxqQftwU9sHn1Dj5pBRD+WBIbBJ5ZB+3QTnydB9xkdCUJ097GHYHGU5PfvPwDREmz3ws6AjxWTJwBAjZjqIErssxQECqnp/JPYUxivhMN72VlhP8EDybSxSv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(66556008)(6666004)(66946007)(4326008)(2616005)(4744005)(5660300002)(478600001)(31696002)(316002)(86362001)(66476007)(8676002)(2906002)(6486002)(186003)(16526019)(36756003)(8936002)(52116002)(83380400001)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: DnH9hxJDOzB8X8NlYl+Q6G5UZP0ufjciMY/iibJjyARpGZAohMK0+LBVGHLtTjR5No3mXNh1FdUXKyy/7AZDNeNKBmbvjZuOilCTC66fME/EaN473V1nyLXSoFf1HZeSHsH2e3f02YMCq+M5uw2LlBehXnBvGAQIEv5r7+jyb2WvqYNu+Z2KE6iHPKwQ3BmJF2Lx60UX9ZUQjZa1LtnZau/TyFLOonTsJYYvHNEIlwleMGbWzT5u4vCHZrK9IX0RaakDBJaURt0Oy8UccOZYkBpgSO3dlxePrpbwMzJqtl+FQGvd+NsizHk+beAflablOKbSX4GEJkt88mD3Bv+f33ARismWFIlcDaloe+mQzPZ611MfaLVZRnYa+LNc1cHwTnIUFFL2CqIsYMhP2LAkqitEtre7se4ep6C4uajgEgmG+VEXO1MG5eErr6IA0dID57qsveP3yX4UXreB9YbQzuEXyvmgLabF4lH6L8HgSGPtk85Rhr4Kd9wGHsxHnF3pdu3T+b8FwRaSUbDjOrVZagZNd25QRA/QTMpbz+mSZRBoL96tW6wBSLqaRc+4s0Mdj6tNItxARlvadOF2DN7lGf3SAnEj+DjC9/5UQsuU1/6rAWxAVjXwfjJDkukHevcBXKN19/ebPfNPFgNFQfxhBfz8dixiOT94Dw9Yk33RTnn5ToU+cxGG5kLy8+uFlivQlD9yosqt4Pf7pZFo33CM1g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc87097a-d33f-40aa-2afa-08d835531abd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 13:10:32.5834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vfXLo9xjAgT921CkYSXLj8sUgXvXzbvQH9kZpnZKaCRKEiSrYYI0mgRyW+ODhReN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4096
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
Cc: sroland@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzEuMDcuMjAgdW0gMDY6MDQgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gU2lnbmVkLW9mZi1ieTogRGF2ZSBBaXJsaWUg
PGFpcmxpZWRAcmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fdHRtLmMgfCA0ICsrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwo+IGluZGV4
IGE1MDQzYTViN2Q4OS4uZTY1Mjk3YjRiNjc4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX3R0bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fdHRtLmMKPiBAQCAtODI2LDggKzgyNiw4IEBAIHZvaWQgcmFkZW9uX3R0bV9maW5pKHN0cnVj
dCByYWRlb25fZGV2aWNlICpyZGV2KQo+ICAgCQl9Cj4gICAJCXJhZGVvbl9ib191bnJlZigmcmRl
di0+c3RvbGVuX3ZnYV9tZW1vcnkpOwo+ICAgCX0KPiAtCXR0bV9ib19jbGVhbl9tbSgmcmRldi0+
bW1hbi5iZGV2LCBUVE1fUExfVlJBTSk7Cj4gLQl0dG1fYm9fY2xlYW5fbW0oJnJkZXYtPm1tYW4u
YmRldiwgVFRNX1BMX1RUKTsKPiArCXR0bV9ib19tYW5fdGFrZWRvd24oJnJkZXYtPm1tYW4uYmRl
diwgJnJkZXYtPm1tYW4uYmRldi5tYW5bVFRNX1BMX1ZSQU1dKTsKPiArCXR0bV9ib19tYW5fdGFr
ZWRvd24oJnJkZXYtPm1tYW4uYmRldiwgJnJkZXYtPm1tYW4uYmRldi5tYW5bVFRNX1BMX1RUXSk7
Cj4gICAJdHRtX2JvX2RldmljZV9yZWxlYXNlKCZyZGV2LT5tbWFuLmJkZXYpOwo+ICAgCXJhZGVv
bl9nYXJ0X2ZpbmkocmRldik7Cj4gICAJcmRldi0+bW1hbi5pbml0aWFsaXplZCA9IGZhbHNlOwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
