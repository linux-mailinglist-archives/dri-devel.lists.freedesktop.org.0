Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D9D2346CE
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 15:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6F66EA9F;
	Fri, 31 Jul 2020 13:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98D96EA9F
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 13:25:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvGsEAvy/AnuVb7RmPZotmmxZhq4/shgjcRL5FeZmPkp0lQWt9wwbNXpNXp1qwQJWOW8qyLOkzJOZVDTHK2G+CwaFg+2rKGyksXS3spWdrUG1hKBcgdc/5wiEh8q/RR7a/u6rbPeYTrmi+0kQVXoBiGQLhw8l5ShOKHGhjKY2qUH1qFjqj60//XdzFK6Fz46mvVUoOulrYlrAPLZnzUPHsC8f3gIreE8Lw6NvM9KU1G8zI2g8kGDWt6TF58xN6H4IZmI3gUb7kE+KkWZc8HObXYGZWTopIrRTUy7/64gG+qJpRXmVWTKnoGLTkQVvL5pQxUsjfHZ0BWWKha7PtPDTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0aK+7PbEi6jKp3dj42XA9erEqoXRFi35eLEWR0BIdU=;
 b=IvsNjdqcGMo+65qOTWMRiypStB26m2jjM9hhNB/HTpkyithLMaXabYm6RrFAWMoSpDXxGW7fq1ePygt637JFFhuRoblybjdZ9G8CVr0u/HnEl2OowD5s0+e/6EaQXPVqHE2IEjIH8o7ige1IFViK9FW0hWXJiWyqgUHcV1tSiPgBIHJpBDcu+hCsKDgtk0DKyXAF2uzLJom7lMe9fzEEs9fI8EHSYK04GWN4iY82G9Cdnd7CkS5urJkZLDLPrz6Ln0dvg1PofIRRiU0eYcumdXejC/6/0WJ5TGo59/wpW7zrFWk3QT6uw/d5aCF0wedIDHWIDYGYZzm2YWhL7ILGCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0aK+7PbEi6jKp3dj42XA9erEqoXRFi35eLEWR0BIdU=;
 b=vNTPHdIbfutvjUM8QxyE0ZwzgSczgW/uavUoBfsM6q+9zywKG0GLllarERXvLXvRhl3kAZIjMobul7s7OBDZIXzwYjqS16MYOVQD2FgCsbTN2d8utacyLXp9tIEqp3RNydsGwUe34796DEDbPNLZ7MIBVGwgv808zH+KCogMfmA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Fri, 31 Jul
 2020 13:25:34 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 13:25:34 +0000
Subject: Re: [PATCH 35/49] drm/nouveau/ttm: don't fill in blank ttm debug
 callback
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-36-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <29259351-5c17-b6d4-7def-cb55795ec2b9@amd.com>
Date: Fri, 31 Jul 2020 15:25:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200731040520.3701599-36-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0101.eurprd07.prod.outlook.com
 (2603:10a6:207:7::11) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR07CA0101.eurprd07.prod.outlook.com (2603:10a6:207:7::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.9 via Frontend Transport; Fri, 31 Jul 2020 13:25:32 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9b4b3eb8-321b-4dec-94de-08d835553436
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4342A3FB270F4041EDA99D9D834E0@MN2PR12MB4342.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0YWr/iWdYxVre2iSDwbeMkB5uAnbphdpolYLXnwibFjW7i3tRn6qdePktkROXZktFwCxOrCdHwB+7FRV0VLlZmo4jqQoX1ufiYJxuWNSGtmjXocCJQBwUjuj8iSQcmkem6PkJucN0v2H6lErUvCEa7aKETrp2UIPwIsTf8/tKiObX8OYE9PsFo2YCNNL8SJRijMFRfQPTaB48b4Jikj1Wt3ekcIFPs38tJm7y4L74rEkJ+xv9G0GlaHwh0IPsoAfjc3OVn27Zo5ziPzEavlBcQQ5nQsURUB5U1Hyw7Z+1w80XmMoi7ebrHaK4w3TWfap7NM3ei7EDNwApAPmvoEhkovtiav3ifFqc4i+m8iACed9SgvJg3N1PcZR9hbf+/UE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(2616005)(186003)(16526019)(36756003)(31686004)(83380400001)(31696002)(86362001)(8936002)(316002)(2906002)(66556008)(66476007)(66946007)(478600001)(5660300002)(52116002)(6666004)(4326008)(8676002)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: MAbSBjcAHCDPFxFNuj9NGuls2pP6fIkqmRfEJ2KZoJnd/xetAujy+DtuOdUjIEbma4CNCpPkoiE6ZRrvXzo4gNNSkCkqv1TKm9UkmKL6QQTK+JD1RtTZjt6wOnII5eUo8gk+D2aISZTi6XaFRq4708N5loVtO2K8ratZxMKaiumkGNyKqgGijxF9VlOcxnewXubEzeCUd0pmcrOYx45Lgr+ub3ZL7ZIlwbQo66Z3xkllwsFeJwsS1km9TYdG+Ru6B8PZjuksVv1y2oxdFTvdljSLYC0Y9eHx9Z/hk7SiXpLCr+Gpd+ghTnHrzwoO4K1mmJ7wQIT85BjZADA7Vm67jPy+DWPAFh4nM26RJUtxm4xHYLCdnn35YBcO4S0sTS/rb4012LKy/O4S59wCboXtFhe+8g7L067XrHVeYEMVgQ/QpQ4VwmQJzWUxROzFIrOBQAnfRlv7dfPGer4aJVSp3pLmnWJJtp/Wj2cDRXGdIZTcFK5zTKjNIca1ipSvhrp03v+KLM7mdtMlGToSi5QSRkvtA4Zsyy/NRigs/4NLYDAI47pcGZ6kFjHo/SMU3zs9LadJTO1BsewTQhkDHjOaPt4xtu4lqF/iWdYlQQmpOKwvqQMLWe7J3H00EcWQAnLb5A3JwJWZCoGXbypjryIlzaAhwVw4Vu/X0PXYb4YVa1LoUigFqLyvY1u0BEa8iTJ01Y/BFctAItcUqjGj/EHr+g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4b3eb8-321b-4dec-94de-08d835553436
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 13:25:34.1557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bfsm7Guwp2zHYS8Pax7dEOYSyQarnygjD8mB5mEIIFKX8jf/GnCsmTTIG0LtLfwh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4342
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

QW0gMzEuMDcuMjAgdW0gMDY6MDUgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gU2lnbmVkLW9mZi1ieTogRGF2ZSBBaXJsaWUg
PGFpcmxpZWRAcmVkaGF0LmNvbT4KCkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV90dG0uYyB8IDkgLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgOSBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3R0bS5j
IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYwo+IGluZGV4IGVkNjUxZDc2
NzlmZS4uMWI5ZDkzNjIxMzJkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfdHRtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3R0
bS5jCj4gQEAgLTM3LDEyICszNyw2IEBAIG5vdXZlYXVfbWFuYWdlcl9kZWwoc3RydWN0IHR0bV9t
ZW1fdHlwZV9tYW5hZ2VyICptYW4sIHN0cnVjdCB0dG1fbWVtX3JlZyAqcmVnKQo+ICAgCW5vdXZl
YXVfbWVtX2RlbChyZWcpOwo+ICAgfQo+ICAgCj4gLXN0YXRpYyB2b2lkCj4gLW5vdXZlYXVfbWFu
YWdlcl9kZWJ1ZyhzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwKPiAtCQkgICAgICBz
dHJ1Y3QgZHJtX3ByaW50ZXIgKnByaW50ZXIpCj4gLXsKPiAtfQo+IC0KPiAgIHN0YXRpYyBpbnQK
PiAgIG5vdXZlYXVfdnJhbV9tYW5hZ2VyX25ldyhzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIg
Km1hbiwKPiAgIAkJCSBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+IEBAIC03Miw3ICs2
Niw2IEBAIG5vdXZlYXVfdnJhbV9tYW5hZ2VyX25ldyhzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFn
ZXIgKm1hbiwKPiAgIGNvbnN0IHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlcl9mdW5jIG5vdXZl
YXVfdnJhbV9tYW5hZ2VyID0gewo+ICAgCS5nZXRfbm9kZSA9IG5vdXZlYXVfdnJhbV9tYW5hZ2Vy
X25ldywKPiAgIAkucHV0X25vZGUgPSBub3V2ZWF1X21hbmFnZXJfZGVsLAo+IC0JLmRlYnVnID0g
bm91dmVhdV9tYW5hZ2VyX2RlYnVnLAo+ICAgfTsKPiAgIAo+ICAgc3RhdGljIGludAo+IEBAIC05
Niw3ICs4OSw2IEBAIG5vdXZlYXVfZ2FydF9tYW5hZ2VyX25ldyhzdHJ1Y3QgdHRtX21lbV90eXBl
X21hbmFnZXIgKm1hbiwKPiAgIGNvbnN0IHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlcl9mdW5j
IG5vdXZlYXVfZ2FydF9tYW5hZ2VyID0gewo+ICAgCS5nZXRfbm9kZSA9IG5vdXZlYXVfZ2FydF9t
YW5hZ2VyX25ldywKPiAgIAkucHV0X25vZGUgPSBub3V2ZWF1X21hbmFnZXJfZGVsLAo+IC0JLmRl
YnVnID0gbm91dmVhdV9tYW5hZ2VyX2RlYnVnCj4gICB9Owo+ICAgCj4gICBzdGF0aWMgaW50Cj4g
QEAgLTEyOSw3ICsxMjEsNiBAQCBudjA0X2dhcnRfbWFuYWdlcl9uZXcoc3RydWN0IHR0bV9tZW1f
dHlwZV9tYW5hZ2VyICptYW4sCj4gICBjb25zdCBzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXJf
ZnVuYyBudjA0X2dhcnRfbWFuYWdlciA9IHsKPiAgIAkuZ2V0X25vZGUgPSBudjA0X2dhcnRfbWFu
YWdlcl9uZXcsCj4gICAJLnB1dF9ub2RlID0gbm91dmVhdV9tYW5hZ2VyX2RlbCwKPiAtCS5kZWJ1
ZyA9IG5vdXZlYXVfbWFuYWdlcl9kZWJ1Zwo+ICAgfTsKPiAgIAo+ICAgaW50CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
