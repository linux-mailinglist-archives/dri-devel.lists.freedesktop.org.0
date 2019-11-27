Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDE510AC17
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 09:43:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B1F890A9;
	Wed, 27 Nov 2019 08:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730058.outbound.protection.outlook.com [40.107.73.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86AE890A9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 08:43:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSWJRcNEhBmK8mEJ5nUvoC/bG9MwbnpRdKKeLmRx33VDtpkohhEI2vcGPwYjKUT9Rw3sr2HJ0LJmYyvOgouCPPsn8A0fQX/t+dtc2Gd4dgrCx77N4p9J45vp36r8QOOhb/fN5gASjH71bLJExEN0+Z3wrZUyOPrzVPiIy4MzK7nw0ZqY2mPu2qDqLGYlD5PvkectprrJGM2y/evLVpaDjC+9YJz9lQUTelzZAE4v5y91hvOavF0ILz8VbEGjTbUlj1GhPDbOx1+3sfjAjNE4dVZ+B6fMDE5hDY4zVlMbfK4JVheHV7O/CU07qGLUDNOppHTeIFrW1y5HyLn62O6qAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GOdGPmLbLK2dWtxDG4fQ+gRLqxmPik3t4IKg2vFwTo=;
 b=UFB8EXTZdi6tBntA1HqXRo9gEvq19KzOdmk6xe0g+j7ICsiqOBJERyaM/aXdKMrKdI15BhSZFuroM04eGjqzN+AqqIsWnxlFn8YasURVTlbcuTP943isIlDO/ILusd/3JRgXEkvMyHIU20CcILtiV89EaP3OGOYgtZSs0n+0Kbe2IPYhxOOYSST/X8ONRm3JoWuvgDbwOIYVsCyAI61g8WK/765OvaS49ldvL6PHmXnLPluASoUHzDNdihCOAIBuJYmU9z/sOtqT7uHLeWvQh74o2Ae6c2IFnVKHEQ7R6KTQS+hUMlXH4g3kck9gc4EeShWk8qy11s9EthogZwfLzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1211.namprd12.prod.outlook.com (10.168.239.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Wed, 27 Nov 2019 08:43:42 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933%7]) with mapi id 15.20.2474.023; Wed, 27 Nov 2019
 08:43:42 +0000
Subject: Re: [PATCH 2/2] drm/ttm: Fix vm page protection handling
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-graphics-maintainer@vmware.com
References: <20191126202717.30762-1-thomas_os@shipmail.org>
 <20191126202717.30762-2-thomas_os@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <04b5dae3-6e72-2c35-117a-a79421d274d9@amd.com>
Date: Wed, 27 Nov 2019 09:43:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20191126202717.30762-2-thomas_os@shipmail.org>
Content-Language: en-US
X-ClientProxiedBy: AM4PR07CA0031.eurprd07.prod.outlook.com
 (2603:10a6:205:1::44) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0568cbb9-b7f2-42a3-00a5-08d77315e805
X-MS-TrafficTypeDiagnostic: DM5PR12MB1211:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1211C66892F454E687E558E483440@DM5PR12MB1211.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 023495660C
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(189003)(199004)(31686004)(446003)(11346002)(4326008)(50466002)(65806001)(47776003)(316002)(2616005)(186003)(46003)(2486003)(58126008)(229853002)(65956001)(6246003)(81166006)(81156014)(66556008)(386003)(66476007)(8676002)(6506007)(52116002)(7736002)(54906003)(76176011)(66946007)(23676004)(5660300002)(478600001)(6436002)(99286004)(6116002)(7416002)(8936002)(305945005)(66574012)(6512007)(25786009)(6666004)(14454004)(86362001)(31696002)(2906002)(6486002)(14444005)(36756003)(2870700001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1211;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2aI+74WArvZDM7lEo7TZnFuPzBnIDf3Evbz5PyfQ9kUg1GTUSYOfcrIUtFslGD7ubbfCyTNXyz2PX5L23ItPNGxntRRBpMHX1FdF1d0uDSAzn4xB7z1UNXIcBP7u+dzu5J/ZaktRi/WJo8hrZxCbm/nLWlYRx3o3o6QWHAYetYS5WqyBuyIVvayMxC1wLDpHmEmsVtedQya5Jk5Hrub3L4z/x1hJR9gJKMRTwIzqZPC6D8WgPhPuKYzXdViXlxZEZq01fKBNjXL+1w8JtslmqRJXTg9kFI21286uxjLrnFMxnHt78QItvdggX5d5602skLdHoXuhmoYiZeYtdt8FiwoCz7CJkXmGNBVmLIQYAnlsHqRSwXfViDBYe7nxCLID+a1A+UgGE44ncxG8NU2u6wGfQU4EFnMGOmEO32XVs4MQtqOBgeVR9B93Imvj9fU7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0568cbb9-b7f2-42a3-00a5-08d77315e805
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2019 08:43:42.2573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFypZ/Ucq29xrbRpEI1kZxa/pmJk3kQOBUriu2tSnxYH1IsrH0ypc+H/PjAK1zHj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1211
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GOdGPmLbLK2dWtxDG4fQ+gRLqxmPik3t4IKg2vFwTo=;
 b=RrSBhf9rCm0Gst0I4YHMAyyBCRG/k9L9aQ2tmi7JiZyYuJmokVgEYIApdo9aOJcT2L9dmGKiaOy2vEdFRQVxEJWDlI42wroDrtL3RQHGLpQQnE8+CuwSwhkj0gpw9d3tLcgA0j5RYmHO3XpzPQ62YE6IRXxETWexh2GCQWcVPMQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjYuMTEuMTkgdW0gMjE6Mjcgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKToK
PiBGcm9tOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4KPiBXZSB3
ZXJlIHVzaW5nIGFuIHVnbHkgaGFjayB0byBzZXQgdGhlIHBhZ2UgcHJvdGVjdGlvbiBjb3JyZWN0
bHkuCj4gRml4IHRoYXQgYW5kIGluc3RlYWQgdXNlIHZtZl9pbnNlcnRfbWl4ZWRfcHJvdCgpIGFu
ZCAvIG9yCj4gdm1mX2luc2VydF9wZm5fcHJvdCgpLgo+IEFsc28gZ2V0IHRoZSBkZWZhdWx0IHBh
Z2UgcHJvdGVjdGlvbiBmcm9tCj4gc3RydWN0IHZtX2FyZWFfc3RydWN0Ojp2bV9wYWdlX3Byb3Qg
cmF0aGVyIHRoYW4gdXNpbmcgdm1fZ2V0X3BhZ2VfcHJvdCgpLgo+IFRoaXMgd2F5IHdlIGNhdGNo
IG1vZGlmaWNhdGlvbnMgZG9uZSBieSB0aGUgdm0gc3lzdGVtIGZvciBkcml2ZXJzIHRoYXQKPiB3
YW50IHdyaXRlLW5vdGlmaWNhdGlvbi4KPgo+IENjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4
LWZvdW5kYXRpb24ub3JnPgo+IENjOiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BzdXNlLmNvbT4KPiBD
YzogIk1hdHRoZXcgV2lsY294IChPcmFjbGUpIiA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KPiBDYzog
IktpcmlsbCBBLiBTaHV0ZW1vdiIgPGtpcmlsbC5zaHV0ZW1vdkBsaW51eC5pbnRlbC5jb20+Cj4g
Q2M6IFJhbHBoIENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KPiBDYzogIkrDqXLDtG1l
IEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHJv
bSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9ib192bS5jIHwgMTQgKysrKysrKy0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm9fdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKPiBp
bmRleCBlNjQ5NWNhMjYzMGIuLjIwOThmOGQ0ZGZjNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9ib192bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9f
dm0uYwo+IEBAIC0xNzMsNyArMTczLDYgQEAgdm1fZmF1bHRfdCB0dG1fYm9fdm1fZmF1bHRfcmVz
ZXJ2ZWQoc3RydWN0IHZtX2ZhdWx0ICp2bWYsCj4gICAJCQkJICAgIHBnb2ZmX3QgbnVtX3ByZWZh
dWx0KQo+ICAgewo+ICAgCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hID0gdm1mLT52bWE7Cj4g
LQlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgY3ZtYSA9ICp2bWE7Cj4gICAJc3RydWN0IHR0bV9idWZm
ZXJfb2JqZWN0ICpibyA9IHZtYS0+dm1fcHJpdmF0ZV9kYXRhOwo+ICAgCXN0cnVjdCB0dG1fYm9f
ZGV2aWNlICpiZGV2ID0gYm8tPmJkZXY7Cj4gICAJdW5zaWduZWQgbG9uZyBwYWdlX29mZnNldDsK
PiBAQCAtMjQ0LDcgKzI0Myw3IEBAIHZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2ZhdWx0X3Jlc2VydmVk
KHN0cnVjdCB2bV9mYXVsdCAqdm1mLAo+ICAgCQlnb3RvIG91dF9pb191bmxvY2s7Cj4gICAJfQo+
ICAgCj4gLQljdm1hLnZtX3BhZ2VfcHJvdCA9IHR0bV9pb19wcm90KGJvLT5tZW0ucGxhY2VtZW50
LCBwcm90KTsKPiArCXByb3QgPSB0dG1faW9fcHJvdChiby0+bWVtLnBsYWNlbWVudCwgcHJvdCk7
Cj4gICAJaWYgKCFiby0+bWVtLmJ1cy5pc19pb21lbSkgewo+ICAgCQlzdHJ1Y3QgdHRtX29wZXJh
dGlvbl9jdHggY3R4ID0gewo+ICAgCQkJLmludGVycnVwdGlibGUgPSBmYWxzZSwKPiBAQCAtMjYw
LDcgKzI1OSw3IEBAIHZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2ZhdWx0X3Jlc2VydmVkKHN0cnVjdCB2
bV9mYXVsdCAqdm1mLAo+ICAgCQl9Cj4gICAJfSBlbHNlIHsKPiAgIAkJLyogSW9tZW0gc2hvdWxk
IG5vdCBiZSBtYXJrZWQgZW5jcnlwdGVkICovCj4gLQkJY3ZtYS52bV9wYWdlX3Byb3QgPSBwZ3By
b3RfZGVjcnlwdGVkKGN2bWEudm1fcGFnZV9wcm90KTsKPiArCQlwcm90ID0gcGdwcm90X2RlY3J5
cHRlZChwcm90KTsKPiAgIAl9Cj4gICAKPiAgIAkvKgo+IEBAIC0yODQsMTAgKzI4MywxMSBAQCB2
bV9mYXVsdF90IHR0bV9ib192bV9mYXVsdF9yZXNlcnZlZChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwK
PiAgIAkJfQo+ICAgCj4gICAJCWlmICh2bWEtPnZtX2ZsYWdzICYgVk1fTUlYRURNQVApCj4gLQkJ
CXJldCA9IHZtZl9pbnNlcnRfbWl4ZWQoJmN2bWEsIGFkZHJlc3MsCj4gLQkJCQkJX19wZm5fdG9f
cGZuX3QocGZuLCBQRk5fREVWKSk7Cj4gKwkJCXJldCA9IHZtZl9pbnNlcnRfbWl4ZWRfcHJvdCh2
bWEsIGFkZHJlc3MsCj4gKwkJCQkJCSAgICBfX3Bmbl90b19wZm5fdChwZm4sIFBGTl9ERVYpLAo+
ICsJCQkJCQkgICAgcHJvdCk7Cj4gICAJCWVsc2UKPiAtCQkJcmV0ID0gdm1mX2luc2VydF9wZm4o
JmN2bWEsIGFkZHJlc3MsIHBmbik7Cj4gKwkJCXJldCA9IHZtZl9pbnNlcnRfcGZuX3Byb3Qodm1h
LCBhZGRyZXNzLCBwZm4sIHByb3QpOwo+ICAgCj4gICAJCS8qIE5ldmVyIGVycm9yIG9uIHByZWZh
dWx0ZWQgUFRFcyAqLwo+ICAgCQlpZiAodW5saWtlbHkoKHJldCAmIFZNX0ZBVUxUX0VSUk9SKSkp
IHsKPiBAQCAtMzE5LDcgKzMxOSw3IEBAIHZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2ZhdWx0KHN0cnVj
dCB2bV9mYXVsdCAqdm1mKQo+ICAgCWlmIChyZXQpCj4gICAJCXJldHVybiByZXQ7Cj4gICAKPiAt
CXByb3QgPSB2bV9nZXRfcGFnZV9wcm90KHZtYS0+dm1fZmxhZ3MpOwo+ICsJcHJvdCA9IHZtYS0+
dm1fcGFnZV9wcm90Owo+ICAgCXJldCA9IHR0bV9ib192bV9mYXVsdF9yZXNlcnZlZCh2bWYsIHBy
b3QsIFRUTV9CT19WTV9OVU1fUFJFRkFVTFQpOwo+ICAgCWlmIChyZXQgPT0gVk1fRkFVTFRfUkVU
UlkgJiYgISh2bWYtPmZsYWdzICYgRkFVTFRfRkxBR19SRVRSWV9OT1dBSVQpKQo+ICAgCQlyZXR1
cm4gcmV0OwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
