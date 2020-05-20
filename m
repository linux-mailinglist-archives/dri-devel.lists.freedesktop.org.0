Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E77B61DB307
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 14:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD236E7D1;
	Wed, 20 May 2020 12:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760057.outbound.protection.outlook.com [40.107.76.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69B36E7D1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 12:19:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZdzvYZqTzNletIvKyWo9mmpcmd+Op7fYCTsmuL2K0Ul+l22MUt9pVt8IihGsq8N1u3RzVMW7HODGx5AW2miboLMykI14mIXdtRWYk35NjYbYqYYm9sPiQr6IF+Bnv23rd1fYa9mtK4vTcbxfo55/nhKQlnUlvB8yGT6C7uD/dq5eK2l6X3rJXkIQ3fS8gdcjbqQDmKK+tXNrTcof1AchMEHEW85rqyMSqIM9ujRgwQ5vHMh9u1pW4s+hWvPzPUvUpIEe5FA1H6aNP+52HFFnvYS+fQH+/2Pi1B+5dcP+lFyZqQ3ZPz0ihKkLmkhG1ep4yhJIETKNx/U5r9ypX/4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0L3xHqWMTwCUSo+CYKJpm3+i9Ms/MDd9fT/Wi70Z58=;
 b=coxF4kpQIHiO3p01RoHN9GTr9WCgn0S7mfCDdnYLop0+D37cQYdpuqpaz1qxHKBaeT4Y8yDFf/DDhmjWETf87wN6Bn7aJ8guqcKHM0vEnWf76BofmZDW7Z/o6lsvKkiHPP+l7pk+OysN29aDtEGECujx+QkZKD6B0O1gh4vvUKmQ0uLFXfH4o/fkFaVWJWB6elDC5sBckBONLMZhDxN/SQb6VhjZ7v3Lsm8W7miFljSB7xG1yhoUMBSgRLZbuQgZPyOjJGemjAleYgZ1GfcQkrqbFnH7pzxRsaHd1jCqHxEFA9KMgoanXfzIuXe75wP0r1/QRS51+t2UT4tmO8H5Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0L3xHqWMTwCUSo+CYKJpm3+i9Ms/MDd9fT/Wi70Z58=;
 b=0ylwTQ/vli6tw5ovccHdaa1VbD3dEytsoQqJ930gpB4mEuB3ltko8ELLLzJqAB6Tqp6TcMBX4dUeJrbyU7bwVjOSqxtNZx63yJ9UmfZsfxVYU/sfImmCgOmCV4JOEal57V92IqnBhe+72Xy+5HLfmVeAsxzHamDqeopk+GL3gnA=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB2651.namprd12.prod.outlook.com (2603:10b6:5:42::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Wed, 20 May
 2020 12:19:50 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.3021.020; Wed, 20 May 2020
 12:19:50 +0000
Subject: Re: [PATCH 1/1] drm: check for NULL pointer in drm_gem_object_put
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200520121450.79340-1-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <96a01388-7d91-56b5-4cd4-16052aba7a60@amd.com>
Date: Wed, 20 May 2020 14:19:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200520121450.79340-1-nirmoy.das@amd.com>
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::20) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0033.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.24 via Frontend Transport; Wed, 20 May 2020 12:19:46 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6c1f4d8b-2f74-4f04-3edd-08d7fcb8182f
X-MS-TrafficTypeDiagnostic: DM6PR12MB2651:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2651D97D0DDF8AA46699574183B60@DM6PR12MB2651.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-Forefront-PRVS: 04097B7F7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2xN/Z0PkQ6GBeOYgwlGUZmtbNht85TiMFoNNu9tU9wLJ7Iu9p1PEsZqSlATBoUZxAJaGrBZ0X57bRzwAD0T+atBpOF/EsG2+zDuVdZWvr7I/BQ/bLapISguh4CeC1vjl3eUInewR/l1fDc3iarIb9nukglXruqZxwPIp1xrkhPbi+65B0a+F2u2hWYcquQvDzmcwqOUJTcIz50aGVN3y/KrzbM9ivOZQIrfK1MzwCG/f5sU50e273mOyAcX+mla0WvbUd216HsxCTMq5jUyRUUncLohpDSCeJIZfxku5FuVjzNeHwjJ3kJaSPMzermb9ixhIiCJxwZrK4eUVaJA2RH/bX43kV+b7bWvT90OACLgJ+/wVD0a5RoUIzW1A0pU4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(366004)(2616005)(6486002)(4326008)(2906002)(36756003)(8676002)(31686004)(8936002)(66574014)(52116002)(66556008)(16526019)(31696002)(186003)(86362001)(316002)(6666004)(5660300002)(478600001)(66476007)(66946007)(54906003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 8MIdrwpz+uhpfCn776RPU8zkpXRQcWQuMNpdHWmvXCQq7/RBdoJkA3T7s4xFVzB951m6cScsMEcC9bU8+fbJiuwHqaLawWjRCNJnnqUlZEiiKFARc3+hjMSEDywOGYRcb6K82/OGBF63UsqQ9PYD90iCOAxIiQHOrFY8F68uf1lwX45pvsuStNCtqpZEemra20pT38AO8AVC9tZTTLh2V9k0NofsNUEFhMgcJqUqVxHqbRB5vgYrtpsXvd0GlMjiCad/rNqoD5H9eNDU4RhIMl9se2kY43xsC93Zp78KQ5ilHc8Jkpvi5rCD9cDze2YTXHV+mUdYLqhuqKZH3jiYK5PlHaMNsljPJcBACQIiTmFk2brpfjZ+kjhtKWnKWltqhC1AW4+ghlPfH5ZAGA8YrRaddPd1ELFNJ/MEbsmuAUEWEwgzg3cVXVueEKbJSMav1vvLteNIVSduE/WuIru0sznBfqZ+nOHZrbBD7GRfDjvK0GH031zHSpfTTApGXufMW4ht9iD//NKWdRUErVK9Anw9tjV5k/W4InLm0Mkx0trUeB79kDTI/eCz1A5niUMU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c1f4d8b-2f74-4f04-3edd-08d7fcb8182f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2020 12:19:50.7977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z0O3EGVDs9PqKE4UojWmL0e7+dCFIZkSzbs3CfnCjc+0YeW+7NJM814DIBLiwy1q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2651
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
Cc: Nirmoy Das <nirmoy.das@amd.com>, Emil Velikov <emil.l.velikov@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAuMDUuMjAgdW0gMTQ6MTQgc2NocmllYiBOaXJtb3kgRGFzOgo+IGRybV9nZW1fZmJfZGVz
dHJveSgpIGNhbGxzIGRybV9nZW1fb2JqZWN0X3B1dCgpIHdpdGggTlVMTCBvYmogY2F1c2luZzoK
PiBbICAgMTEuNTg0MjA5XSBCVUc6IGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UsIGFk
ZHJlc3M6IDAwMDAwMDAwMDAwMDAwMDAKPiBbICAgMTEuNTg0MjEzXSAjUEY6IHN1cGVydmlzb3Ig
d3JpdGUgYWNjZXNzIGluIGtlcm5lbCBtb2RlCj4gWyAgIDExLjU4NDIxNV0gI1BGOiBlcnJvcl9j
b2RlKDB4MDAwMikgLSBub3QtcHJlc2VudCBwYWdlCj4gWyAgIDExLjU4NDIxNl0gUEdEIDAgUDRE
IDAKPiBbICAgMTEuNTg0MjIwXSBPb3BzOiAwMDAyIFsjMV0gU01QIE5PUFRJCj4gWyAgIDExLjU4
NDIyM10gQ1BVOiA3IFBJRDogMTU3MSBDb21tOiBnbm9tZS1zaGVsbCBUYWludGVkOiBHICAgICAg
ICAgICAgRSAgICAgNS43LjAtcmMxLTEtZGVmYXVsdCsgIzI3Cj4gWyAgIDExLjU4NDIyNV0gSGFy
ZHdhcmUgbmFtZTogTWljcm8tU3RhciBJbnRlcm5hdGlvbmFsIENvLiwgTHRkLiBNUy03QTMxL1gz
NzAgWFBPV0VSIEdBTUlORyBUSVRBTklVTSAoTVMtN0EzMSksIEJJT1MgMS5NUiAxMi8wMy8yMDE5
Cj4gWyAgIDExLjU4NDIzN10gUklQOiAwMDEwOmRybV9nZW1fZmJfZGVzdHJveSsweDI4LzB4NzAg
W2RybV9rbXNfaGVscGVyXQo+IDxzbmlwPgo+IFsgICAxMS41ODQyNTZdIENhbGwgVHJhY2U6Cj4g
WyAgIDExLjU4NDI3OV0gIGRybV9tb2RlX3JtZmIrMHgxODkvMHgxYzAgW2RybV0KPiBbICAgMTEu
NTg0Mjk5XSAgPyBkcm1fbW9kZV9ybWZiKzB4MWMwLzB4MWMwIFtkcm1dCj4gWyAgIDExLjU4NDMx
NF0gIGRybV9pb2N0bF9rZXJuZWwrMHhhYS8weGYwIFtkcm1dCj4gWyAgIDExLjU4NDMyOV0gIGRy
bV9pb2N0bCsweDFmZi8weDNiMCBbZHJtXQo+IFsgICAxMS41ODQzNDddICA/IGRybV9tb2RlX3Jt
ZmIrMHgxYzAvMHgxYzAgW2RybV0KPiBbICAgMTEuNTg0NDIxXSAgYW1kZ3B1X2RybV9pb2N0bCsw
eDQ5LzB4ODAgW2FtZGdwdV0KPiBbICAgMTEuNTg0NDI3XSAga3N5c19pb2N0bCsweDg3LzB4YzAK
PiBbICAgMTEuNTg0NDMwXSAgX194NjRfc3lzX2lvY3RsKzB4MTYvMHgyMAo+IFsgICAxMS41ODQ0
MzRdICBkb19zeXNjYWxsXzY0KzB4NWYvMHgyNDAKPiBbICAgMTEuNTg0NDM4XSAgZW50cnlfU1lT
Q0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NDQvMHhhOQo+IFsgICAxMS41ODQ0NDBdIFJJUDogMDAz
MzoweDdmMGVmODBmNzIyNwo+Cj4gU2lnbmVkLW9mZi1ieTogTmlybW95IERhcyA8bmlybW95LmRh
c0BhbWQuY29tPgoKRml4ZXM6IC4uLi4gbWlzc2luZyBoZXJlLiBBcGFydCBmcm9tIHRoYXQgUmV2
aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgCjxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+LgoK
UGxlYXNlIHJlc2VuZCB3aXRoIHRoZSB0YWcgYWRkZWQsIHRoZW4gSSdtIGdvaW5nIHRvIHB1c2gg
dGhpcyB0byAKZHJtLW1pc2MtbmV4dCBhc2FwLgoKQ2hyaXN0aWFuLgoKPiAtLS0KPiAgIGluY2x1
ZGUvZHJtL2RybV9nZW0uaCB8IDMgKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2dlbS5oIGIvaW5jbHVkZS9kcm0v
ZHJtX2dlbS5oCj4gaW5kZXggNTIxNzNhYmRmNTAwLi5hMTM1MTAzNDZhOWIgMTAwNjQ0Cj4gLS0t
IGEvaW5jbHVkZS9kcm0vZHJtX2dlbS5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2dlbS5oCj4g
QEAgLTM3Miw2ICszNzIsOSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZHJtX2dlbV9vYmplY3RfZ2V0
KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQo+ICAgc3RhdGljIGlubGluZSB2b2lkCj4gICBk
cm1fZ2VtX29iamVjdF9wdXQoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCj4gICB7Cj4gKwlp
ZiAoIW9iaikKPiArCQlyZXR1cm47Cj4gKwo+ICAgCWtyZWZfcHV0KCZvYmotPnJlZmNvdW50LCBk
cm1fZ2VtX29iamVjdF9mcmVlKTsKPiAgIH0KPiAgIAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
