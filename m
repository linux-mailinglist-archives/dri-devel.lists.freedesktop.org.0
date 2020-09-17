Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D82426D585
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 10:02:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 435696EB12;
	Thu, 17 Sep 2020 08:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3316EB15
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 08:02:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsD+e1d+UGOrxgS7O9TyO0Bqzg8LCM8rHjQvzBWjgx890IzihAN5B7f0I/17gdwaLBf7xpd66gUP+n/h2TE+3qLt+7JxT3xLyd1B1FHuCD1PL7V+Y1vNhaZHSlBT8xxNOkOchGLBOXXcz8y/XaPG0OER9/hWoJcYXnKBqJAJuTUy7K7C69sHBiFSObDC8FyG5jM+hjC0zkuFpuEEfB5Aa4T2iCMrDnQtqLyPodvw2lCvS+PSubOdVI+n6mVJwBiweAZ8GtxLmKAZGaQs4AbRmw6IG9YWhsVHBfoz6ZJA8XXcKuM1dUA9V0zWExzuaBQd34dKxnz5gjcT/gU8BCBhhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzyB2/mGSEKdaEgZ9akbvE7qOdZMPPJ67oxVRYJm2vs=;
 b=S/ethxfmMROou0UPomJ1MOVqZLGD2/UDRoevnSxFBucrZ8Ifg0zHy2/Lrjub2QV+R/T6Xxy/AkxIFaOFWhuRak2AFeT3zexAtUwBU6tEITeuxZRNjbnD+6Q5sU3EAJRP6wSq2Dsn+8d93i0mrlEi2aK8vaLEgfpZLH4r3x5vR7swcC/Hrz5/TTMwUYikAyAieMxWbqFrzEWxjWZSM7IRHQFDE7EV4ew9wsfn8s+O9DRnJ//w4KTF9JTanu4VE8VZRqz7ekSKofOY1E9T8M1+Uf7Xj2DhmxnLh3Z/aCDDZSec3ea/WuOYu7awJm3HFyUouPoaxyFsIyo9buS5rxI1PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzyB2/mGSEKdaEgZ9akbvE7qOdZMPPJ67oxVRYJm2vs=;
 b=TGSNzzDHvwnR7dWemlVBo0WqNWHmnX5+cJufxENTm8dzVtMyw8P2Oxs3Hzjp7iMHfMRgFKq2SBDH3ejCWCsjzLQJubO4f9boznVxiqVBEQOPtB+6Ff/Gx3HgmLa4WdAJpjCp23wsW6oOmm3DuxYw0Cfo87wMRXoK/daHeyWxlYM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4814.namprd12.prod.outlook.com (2603:10b6:208:1b6::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 17 Sep
 2020 08:02:49 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.014; Thu, 17 Sep 2020
 08:02:49 +0000
Subject: Re: [PATCH 2/2] drm/ttm: drop evicted from ttm_bo.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200917064132.148521-1-airlied@gmail.com>
 <20200917064132.148521-3-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <77fee681-dd79-86f5-d1cf-646b7d1504f5@amd.com>
Date: Thu, 17 Sep 2020 10:02:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200917064132.148521-3-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0028.eurprd04.prod.outlook.com
 (2603:10a6:208:122::41) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0028.eurprd04.prod.outlook.com (2603:10a6:208:122::41) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend
 Transport; Thu, 17 Sep 2020 08:02:48 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 18e485d8-44cb-4340-eac8-08d85ae0119d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4814:
X-Microsoft-Antispam-PRVS: <MN2PR12MB48142E1EF213B53DA8EB0313833E0@MN2PR12MB4814.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cNow0ZG6dh/EtExURugOzxl8JmXP1cSJS98QsM9gVZeexbmzlOOp+g//XHbmGfmNBfVtB3oc/i9gkNS8pa1mhdpl+zRbJrc6EKYI9smC+QHW+RS9/FZ6RozTszjfKMWBazOqsdg5w9SwPCUxyIrdFmcXkb9VMPlK78a8oW/5F0Z1uLH3jd8cEM/16YznwsIAddWshjJGu23AeLFpcWCbsWqQ9BsDAl2tads1wzq7G4KjNQALSsND1W3aXEOIUY8chjwMOEXEeM5jmTt1bE0oDKiDqCTTsnASC0uHin/Ct412x8gT/akLmCbXtXUcvdW0aiRAXJMzeJRTqTx7xta2n6PI6OR9P3X+i3iYrvutGELzK5Spen0rbHahI3DuzRM8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(16526019)(83380400001)(66574015)(8676002)(66556008)(2616005)(31686004)(6486002)(66476007)(6666004)(52116002)(5660300002)(8936002)(186003)(2906002)(316002)(86362001)(36756003)(478600001)(66946007)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: /SIrkDHhG2gqX1TaK0JexxER/lb792xxi8DryagrFsP37dc1QoMQhzMp95hF2yQpqvThoAbDLm36Q7YWxscA6xh4eQVLrUbGjuGV4EacSskLdSfW9MEgPrzcx3s26/y79nWYwJePXNRU97QelyvKXWkY9mR6QoLPAVAAbD+0AwRAkJBMUU1reJ0xwr4jbapAI3XXbpHVDr/LlVCqU3bDH9wHEu3Brw/8xxxvQ305wBj5brh2fatekV+3L1oBNiVAmqlh5DbLmb+H1E4slllUwYsZ+LiXUvFKxIy4yu9uVXdtC9KHKv2Rmb7pdK6K0mJwCTdOAuis2WNZHXhcBArel5BDnHTNhxTDBLOYxRUldpal799tDq/KY0aNvvY05W8v1lwk3KNBJMiL9INOz2yRXGC8vEWJYNQocJO8Fkm3nFXb2dIdvzg1euwHaF8mrzJjgCPyyS0OK3l/Adf61EDwbAQ3kcUGIZYwts8NJmFDlUei2VVJ2Rz1mz2SfOkkaHTQroDeSY9AwZjud4Fx64dxAbsEMQHyWsKdgxjRCXI7pMyRCPHqH3IOIdH7rdWSwNqcmhxNv/JBR/oUrwFnS9Sp/LKhkzzvXmfwAezHwRTMGgF6WJssRRS8HR0T1wuC9Iz5LAiQSXclatCm/OIHBgqO5f8MH6VP5Vmvom7jdKnpUvv11Lxqdg6kPNpwbiyYBvhz9oQSP6hf5McsyXSqwikb6w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e485d8-44cb-4340-eac8-08d85ae0119d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 08:02:48.9580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDakmRU9U5bxqEBRJijOxpu3bFQI509+0j4Arx8JMYnTAALaV4MpPpdTpSSlGYpj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4814
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

QW0gMTcuMDkuMjAgdW0gMDg6NDEgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhpcyB3YXMgdW51c2VkLgo+Cj4gU2lnbmVk
LW9mZi1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDQgLS0tLQo+ICAgaW5jbHVkZS9kcm0vdHRtL3R0
bV9ib19hcGkuaCB8IDEgLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9iby5jCj4gaW5kZXggMjc5YTBlNDRhNWVkLi43NTYyYjA4NDRjNzUgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvLmMKPiBAQCAtMjk4LDggKzI5OCw2IEBAIHN0YXRpYyBpbnQgdHRtX2Jv
X2hhbmRsZV9tb3ZlX21lbShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCX0KPiAg
IAo+ICAgbW92ZWQ6Cj4gLQliby0+ZXZpY3RlZCA9IGZhbHNlOwo+IC0KPiAgIAljdHgtPmJ5dGVz
X21vdmVkICs9IGJvLT5udW1fcGFnZXMgPDwgUEFHRV9TSElGVDsKPiAgIAlyZXR1cm4gMDsKPiAg
IAo+IEBAIC02MzgsOSArNjM2LDcgQEAgc3RhdGljIGludCB0dG1fYm9fZXZpY3Qoc3RydWN0IHR0
bV9idWZmZXJfb2JqZWN0ICpibywKPiAgIAkJaWYgKHJldCAhPSAtRVJFU1RBUlRTWVMpCj4gICAJ
CQlwcl9lcnIoIkJ1ZmZlciBldmljdGlvbiBmYWlsZWRcbiIpOwo+ICAgCQl0dG1fcmVzb3VyY2Vf
ZnJlZShibywgJmV2aWN0X21lbSk7Cj4gLQkJZ290byBvdXQ7Cj4gICAJfQo+IC0JYm8tPmV2aWN0
ZWQgPSB0cnVlOwo+ICAgb3V0Ogo+ICAgCXJldHVybiByZXQ7Cj4gICB9Cj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmggYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2Fw
aS5oCj4gaW5kZXggMzZmZjY0ZTI3MzZjLi4wM2I0NzYxYTNlYTMgMTAwNjQ0Cj4gLS0tIGEvaW5j
bHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9f
YXBpLmgKPiBAQCAtMTQxLDcgKzE0MSw2IEBAIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCB7Cj4g
ICAJc3RydWN0IHR0bV9yZXNvdXJjZSBtZW07Cj4gICAJc3RydWN0IGZpbGUgKnBlcnNpc3RlbnRf
c3dhcF9zdG9yYWdlOwo+ICAgCXN0cnVjdCB0dG1fdHQgKnR0bTsKPiAtCWJvb2wgZXZpY3RlZDsK
PiAgIAlib29sIGRlbGV0ZWQ7Cj4gICAKPiAgIAkvKioKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
