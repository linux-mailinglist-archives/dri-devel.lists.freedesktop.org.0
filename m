Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2F6230435
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 09:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C936E1D3;
	Tue, 28 Jul 2020 07:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D126E1D3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 07:37:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKX8o9jlT0AvGUwmDKTc3+5Y71Xj1iPa2i5ETKWbjBw4YexyZRE70UDzyybFQwkEZDmw2NiwDTLRz9krVkQfn0CLCQyHhluj2D2VJ8gbvGqScLnRt8VxGgQBLJz26Eb89F6wd/7DY0CdsviNxwuA5M7yRZYj8hcg+5ZbYzTW1X0FGyh3kXvb3nTWakqjqVa4ghq/LUrJXUh6p/O+wTPHxhZUUmocucVDwVA0hkfHdke3aZSZzj21820NknDxqSAZ2zF9muu2YkhfYdx0votH9lQ5J2v3C3e9S9SlFQ0jMc5rOLN8+b59L9Je2khmZ6q1Pif3H2iS4BVsuolCFzmGJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5dBEnOgq76ErJpvhPgUZPqXrIPCgJjlvB261rVTvGAQ=;
 b=Ta7Petk6DV1mwjdazkp7WZHy7lUVP3sMXrq7q5+9FbkrHiOpH7iW4u14WnIuQ+bt9veejBxFZkWRbsu54CZ0rBlTX4V9wbxH+/DwElzX+T6GsVstkW1+YNC/PNAtKbnqaGnNEyt9PzKzf9zVNUebkaGRfX7nk56TDYWb9rRi3Zd9Le9P9HIVA2XQVARZBggRWLhguDA+cW7RpDcoAxrker6MEq77BTAg/rkkeU0eGVbaDq0+o8hwkllqh8weZNf5ZZp99bCidkpNywMjv2VUUCRkaZ4XxmDAv/rjmo5mr17uLqqHyPNkxSVUHkpGZh2XoB2OdMl/dmX7AqGIcNU7kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5dBEnOgq76ErJpvhPgUZPqXrIPCgJjlvB261rVTvGAQ=;
 b=Rfq0kLxSOCbx/UPYkgsK54fYoc3kIWt2Lk/BLXaDNuQaq87T7+LSS2PClsa1C3ed5IkohHTj0Xz9Choo/RQF0ad2u80cGJ3399Ttu9mkUnBqMDQL2nCNvvBp0KDp2V1da4Ed70UXGJBwQOgdsJi+VcXzLLvaziIbGTIl6MWx714=
Authentication-Results: vmware.com; dkim=none (message not signed)
 header.d=none;vmware.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4205.namprd12.prod.outlook.com (2603:10b6:208:198::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Tue, 28 Jul
 2020 07:37:10 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 07:37:10 +0000
Subject: Re: [PATCH] ttm: ttm_bo_swapout_all doesn't use it's argument.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200728034254.20114-1-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <976bf436-55aa-bfcf-cf74-1e02c2794d06@amd.com>
Date: Tue, 28 Jul 2020 09:37:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200728034254.20114-1-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0077.eurprd02.prod.outlook.com
 (2603:10a6:208:154::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0077.eurprd02.prod.outlook.com (2603:10a6:208:154::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Tue, 28 Jul 2020 07:37:09 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c6b98f61-3ff2-4833-304f-08d832c90931
X-MS-TrafficTypeDiagnostic: MN2PR12MB4205:
X-Microsoft-Antispam-PRVS: <MN2PR12MB42054742504ABC80EF0E1C8283730@MN2PR12MB4205.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q5Jrm34Wd4PqWh61ykySQaXG206kQFnxQ07Y+GdoVP2S+q6xJD/Eqr6vX9nDmJbJsWLOg0W+PR/D5+o2ZQAhzfU7+M8lnol4b1VXbVYbAdxusHLHHrm7maLUtd6Z6d0iUvYnTcrfXmI2nxwmj5yl1bDCaUlIZIk+cRv8XLrdgakn7yPf9ac6ZmavXwDlW6r1N99OH/RFgHjsMtCT2raMdeJExTwyq4i7+rNxkS7Nen3wz47RKjJXs7Sor2G9haZF1zEroqKJ8GNMxwGjYloPHzjk8CbT1rmqdmaR+q+uOMnC5GIQ4yR7W6on52mYtL8Lbs209IN7dd6t1ZHWJrrary2AZCa5qon3ZlGVMgWSMSNbg3xyU0mmRGIp+LxcmA1y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(2616005)(16526019)(186003)(6666004)(5660300002)(66574015)(4326008)(31696002)(6486002)(66946007)(478600001)(316002)(66556008)(66476007)(8936002)(86362001)(36756003)(31686004)(52116002)(8676002)(2906002)(83380400001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: UPay9mV/DtOArwHbqeLdUwdJVDCOI7EsYS/+wiYLfjJuyr5oZ4gpzCeD3udPxU3hSIRxC6DBvedmGJkKBIpUrzL8iThxy2ItYjgeF/YYRF5qm6Ch/e14IITuwZU9w0ci7kOENkK77TN8aPXmPNvjlf5vGSgKEfEYKfGM2hN2p5qbaJ5blGwy/QcsqJwMPF7rvv4IG4BjKupS4HiD4u8golcepDuucrCcYt/4GuV++l2XISXAhau1xMmxpWTbe51YS+XlBI4tcCIq8Ek2Btj3g/L7KZXlaiqQ8Gi6aPT3WFnNl5wzdVGb8Snl3QQFjUG9208ZA2s6rWuabGjmBu81lIrMNQEPkwhk5FnvhIqcRDb16R4DOokyDpECy9VeCv8IsXjWgOdcO6Tnb95OHQl27udTUvdtzkPtI67mrWHiit5RPlZGg6HPoOHXXl+RdAct4J7wHJy3f/zMUGz45h2rBkG0pFg/nOhNbNFiM5IQoE72N98etMsUPzKBWT7AOeqHaReqp9wVEVDwGIDciRbzteWzl03OnO74qBZbMDM3qPYa7Gr7UhJg/LXEuWUHSWVQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b98f61-3ff2-4833-304f-08d832c90931
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 07:37:09.8278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGAbzFxvBKTK1pAvbm8PpROkA66nAZk47oVXSwV+mYOcVNMXdxORE3kw0N166eC/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4205
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
Cc: sroland@vmware.com, linux-graphics-maintainer@vmware.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjguMDcuMjAgdW0gMDU6NDIgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gSnVzdCBkcm9wIHRoZSBhcmd1bWVudCBmcm9t
IHRoaXMuCj4KPiBUaGlzIGRvZXMgYXNrIHRoZSBxdWVzdGlvbiBpZiB0aGlzIGlzIHRoZSBmdW5j
dGlvbiB2bXdnZngKPiBzaG91bGQgYmUgdXNpbmcgb3Igc2hvdWxkIGl0IGJlIGRvaW5nIGFuIGV2
aWN0IGFsbCBsaWtlCj4gdGhlIG90aGVyIGRyaXZlcnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZl
IEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jICAgICAgICB8IDIgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X2Rydi5jIHwgMiArLQo+ICAgaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCAgICAgICAg
fCAyICstCj4gICAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+IGluZGV4IGIwMzc0NzcxN2VjNy4uZjI5N2ZkNWUwMmQ0
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gQEAgLTE4MzgsNyArMTgzOCw3IEBAIGludCB0dG1f
Ym9fc3dhcG91dChzdHJ1Y3QgdHRtX2JvX2dsb2JhbCAqZ2xvYiwgc3RydWN0IHR0bV9vcGVyYXRp
b25fY3R4ICpjdHgpCj4gICB9Cj4gICBFWFBPUlRfU1lNQk9MKHR0bV9ib19zd2Fwb3V0KTsKPiAg
IAo+IC12b2lkIHR0bV9ib19zd2Fwb3V0X2FsbChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldikK
PiArdm9pZCB0dG1fYm9fc3dhcG91dF9hbGwodm9pZCkKPiAgIHsKPiAgIAlzdHJ1Y3QgdHRtX29w
ZXJhdGlvbl9jdHggY3R4ID0gewo+ICAgCQkuaW50ZXJydXB0aWJsZSA9IGZhbHNlLAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYyBiL2RyaXZlcnMvZ3B1
L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jCj4gaW5kZXggNDcwNDI4Mzg3ODc4Li5mYjM5ODI2Zjcy
YzEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYwo+IEBAIC0xMzUyLDcgKzEz
NTIsNyBAQCBzdGF0aWMgaW50IHZtd19wbV9mcmVlemUoc3RydWN0IGRldmljZSAqa2RldikKPiAg
IAl2bXdfZXhlY2J1Zl9yZWxlYXNlX3Bpbm5lZF9ibyhkZXZfcHJpdik7Cj4gICAJdm13X3Jlc291
cmNlX2V2aWN0X2FsbChkZXZfcHJpdik7Cj4gICAJdm13X3JlbGVhc2VfZGV2aWNlX2Vhcmx5KGRl
dl9wcml2KTsKPiAtCXR0bV9ib19zd2Fwb3V0X2FsbCgmZGV2X3ByaXYtPmJkZXYpOwo+ICsJdHRt
X2JvX3N3YXBvdXRfYWxsKCk7Cj4gICAJaWYgKGRldl9wcml2LT5lbmFibGVfZmIpCj4gICAJCXZt
d19maWZvX3Jlc291cmNlX2RlYyhkZXZfcHJpdik7Cj4gICAJaWYgKGF0b21pY19yZWFkKCZkZXZf
cHJpdi0+bnVtX2ZpZm9fcmVzb3VyY2VzKSAhPSAwKSB7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
ZHJtL3R0bS90dG1fYm9fYXBpLmggYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oCj4gaW5k
ZXggYjFjNzA1YTkzNTE3Li5hOWUxM2IyNTI4MjAgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0v
dHRtL3R0bV9ib19hcGkuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKPiBA
QCAtNjkyLDcgKzY5Miw3IEBAIHNzaXplX3QgdHRtX2JvX2lvKHN0cnVjdCB0dG1fYm9fZGV2aWNl
ICpiZGV2LCBzdHJ1Y3QgZmlsZSAqZmlscCwKPiAgIAo+ICAgaW50IHR0bV9ib19zd2Fwb3V0KHN0
cnVjdCB0dG1fYm9fZ2xvYmFsICpnbG9iLAo+ICAgCQkJc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4
ICpjdHgpOwo+IC12b2lkIHR0bV9ib19zd2Fwb3V0X2FsbChzdHJ1Y3QgdHRtX2JvX2RldmljZSAq
YmRldik7Cj4gK3ZvaWQgdHRtX2JvX3N3YXBvdXRfYWxsKHZvaWQpOwo+ICAgCj4gICAvKioKPiAg
ICAqIHR0bV9ib191c2VzX2VtYmVkZGVkX2dlbV9vYmplY3QgLSBjaGVjayBpZiB0aGUgZ2l2ZW4g
Ym8gdXNlcyB0aGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
