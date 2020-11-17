Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 510BD2B6828
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 16:02:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D896EAA2;
	Tue, 17 Nov 2020 15:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C0D6EAA2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 15:02:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I72SJ5yzwk7zeL88o49swAr/pdCR8Rllwl23UpKrhTu42lMIXEgFa/ksuHE2ejgh0/Ys3PLQTSxZclP4qT6e2LDIWsrOZ4JEkOfT5EDnGbxXgJGKMbOF0Qf/5vmbDcDZ8uXae5YyB3SENI71eGJYE9q6V1Psn5pZU8J1yw+ou46rtRd0NpbdSsZZzsPuD7UBy7jD0tL18kcAO5ZtI4eN7MN2j57RVCiLHqc77+HEIA8Jz5BwbsN89FmtY3Rmzu0+ELw5vD6l9xCRizwEYZVmn+SUs1XSu4inFHyS7G9NV1C7hXmVQm5cs7mTxs+lj6+0pSeqxEmbpS5sISPiNe3aEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMDyPIk5SJ1rhkxsahI0Zh9p/LB0P2hYrl2eAYMFRqs=;
 b=bEV1JXnm1CphaMIG5EYSKw+wMOf+qGpbw6q+dDO3qOoTntx2V8fJekXwmtw2ZLTVEXdNLzA9PwBMxp6YuETP+LZKBiusQT7qAUIvHIvjQPcgzEx63uFVZRgc1oZpDZCcBkAtlnV08X3cd1+ZKygVt7/wQFfJqvXyNQoIP/4MM6bqeuCzmpXMmGETSCARkbY39ctjj67mCPYkT4uzKM1Am5XAD2FaUzA0ddfaynQhoMP5vJZ3Mj+4u5ERz4SXH9gCbBqt0xF44guj2H3lhXZ0xlqDVyTbmPAuuNL2gIYXugxyW/NPvbCYSzmjFuEJ1btpk01VZrgEY2FIDgHxdRr6VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMDyPIk5SJ1rhkxsahI0Zh9p/LB0P2hYrl2eAYMFRqs=;
 b=AFgC3+sPSuBf83i4zXhyl6U3BcmH1TMyVP8RbUx1+2J6alZeVA9Im2GXujeV84rpCa1yoRdJQ9Xr7wwTd3pDXboIL0FmSf0Ei7bnOrzQXU/gdio6bQP5zd/iBJ52uDmJDzsvgFjFZ84npuyXDCIzc/Hir7L53efOZajGDZpiZaI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3916.namprd12.prod.outlook.com (2603:10b6:5:1ca::21)
 by DM5PR12MB2453.namprd12.prod.outlook.com (2603:10b6:4:b5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.23; Tue, 17 Nov
 2020 15:02:01 +0000
Received: from DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::7080:fa49:2223:5f4e]) by DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::7080:fa49:2223:5f4e%7]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 15:02:01 +0000
Subject: Re: [PATCH] drm/amdgpu: fix check oder in amdgpu_bo_move
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 airlied@gmail.com, dri-devel@lists.freedesktop.org
References: <20201116191429.1636-1-christian.koenig@amd.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <9d5095f2-7918-6e5b-c8bc-6e0837a3b277@amd.com>
Date: Tue, 17 Nov 2020 16:01:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201116191429.1636-1-christian.koenig@amd.com>
Content-Language: en-US
X-Originating-IP: [217.86.120.122]
X-ClientProxiedBy: AM0PR03CA0104.eurprd03.prod.outlook.com
 (2603:10a6:208:69::45) To DM6PR12MB3916.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.87] (217.86.120.122) by
 AM0PR03CA0104.eurprd03.prod.outlook.com (2603:10a6:208:69::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.28 via Frontend Transport; Tue, 17 Nov 2020 15:01:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dbb6761a-a763-4844-5df8-08d88b09bc5e
X-MS-TrafficTypeDiagnostic: DM5PR12MB2453:
X-Microsoft-Antispam-PRVS: <DM5PR12MB24534FC682390A6DC53265FB8BE20@DM5PR12MB2453.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YSfpR8b++1CIudK7eLgD4JE9a+W+dhgaJcKstwRVB8zArr7+aCP2qCuXr87cQkYhCibh4XSccDwHWK/H3fInMymqB52GzTk/B0Qm6dHIsuTQl5Vo6wexxnkrF6nrRk4wY0ICyL0H5VFsQSKb7PMxbpDm7wacU6LO3Zvp+Fj9eXQW0NE5jhpCY/6nQKiGyZ6Ci5Ug+NmOUB3bdemfq+n5R5UbIf3UdACEi0n4nSkjvl5AalxbbH6AQ7eIlr/AQACtFqxAaZMJAIDqjjlfsUNCd4jABzFWkZnjUdnFommoMyEMD91Cb+4T9WxCQB4dhi1OXDjKXI57F0q/74ryXVXz527kzYB06wFi8mSVPEUQi5flgiNf6fX2Ndpuo3Wm+Cpb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3916.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(478600001)(16526019)(53546011)(16576012)(2616005)(83380400001)(316002)(2906002)(186003)(66574015)(6666004)(66946007)(66476007)(66556008)(6486002)(36756003)(26005)(956004)(31696002)(52116002)(8676002)(8936002)(31686004)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 56ZZigrq0RS35JHBmP1YZqwdhCa6gwalY0Ul7DGyuhV5gnrubwzpK7m6GIczmHfLiuvQ3a414w7C6AJ546uijgocNs+TW6ltr462est2+QL0uRWZ/K9txCImPLkhaNW4Ox6n7QOipPbexNh8jztQqTpnbM+tup9e5oirJfC487BMhhpD/7lQVqZkA/ej1+ymcMva/scIVpyhUAx7oved99qGCYNQx0MvjMT/PPCeTdv11A1yiq9C9hNBfp6dtvgh4d5/tLasnjSDFrfkA+24NZ15bZqkODd98ejOWRaoZkq3BVonVFgVVs5g8k89rLQJte0XFWi6jPeIPD6iNSL9bk4SrDxlKMPTNCMeQvyMRVo5XQz1WgY1xc7VKQ1fTAFZpSGgZOQJVGWFOm3GaEbmtqVedENadQHeqZxiRo8sQckjBnYBUxD2p6xIDDcHF7rXoVs7XA5/bWDQTrSGnUhgixeyDcYEBHPB+h2oHjX1vudmmCoOdNPygL/BNW6mAMOISFUhvODppbPsRUDzAw0eDpRWfDEA3lmyNMX///nOUD3h7Ks4EUHg7PpTtLGvcaE5H32gQaGYuHeaUvK+/mnIn4Dr6xoDvRKNbTRZvzkGOHiM+gv/H6odwSnru5BvKsNnWEDyIrJxlm15viRvtCmf/yeARTZHITL67lw83GY2QpIFulSRrwreAXJ67EOMU72XHxagLqMmzFVEN4fFb/fQzqyIKL4h1ZBaIth7ypxU5RW9k5Qg4b/sQ6TRMv0fol3Zt7/9aSa3ts54f986+oQRhLnl+FaVk5x0nbEwQc7+7MpQ1ZRxpjF94KMmJf7NL5tx9Q3fFvmMBEr3l92z0/Up1SfMKaJdxKbfSQT04E/5AD4EdFTbVmkC1z/QQmf3e0KbYUmJjW5zp8auKLVFxO3pmg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb6761a-a763-4844-5df8-08d88b09bc5e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3916.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 15:02:00.9199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y727lT33MkZZhUMybzJ+Of74DnivHL+6CD2VoMpXXfUqfBq9fh0CEf3RO0MAnOA64Z8FdCrzcuO3yaB2zB3A0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2453
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

VGVzdGVkLWJ5OiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGFtZC5jb20KClRlc3RlZCBvbiBjb21t
aXQgOTZmYjNjYmVmMTY1ZGI5N2M5OTlhMDJlZmUyMjg3YmE0YjhjMWNlYiAoSEVBRCwgCmRybS1t
aXNjL2RybS1taXNjLW5leHQpCgoKCk9uIDExLzE2LzIwIDg6MTQgUE0sIENocmlzdGlhbiBLw7Zu
aWcgd3JvdGU6Cj4gUmVvcmRlciB0aGUgY29kZSB0byBmaXggY2hlY2tpbmcgaWYgYmxpdHRpbmcg
aXMgYXZhaWxhYmxlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgo+IEZpeGVzOiBmNWE4OWE1Y2FlODEgZHJtL2FtZGdwdS90dG06
IHVzZSBtdWx0aWhvcAo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3R0bS5jIHwgNTMgKysrKysrKysrKystLS0tLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDIzIGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV90dG0uYwo+IGluZGV4IDY3NmZiNTIwZTA0NC4uYzQzOGQyOTBhNmRiIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+IEBAIC01NTEsMjUg
KzU1MSwxMiBAQCBzdGF0aWMgaW50IGFtZGdwdV9ib19tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29i
amVjdCAqYm8sIGJvb2wgZXZpY3QsCj4gICAJc3RydWN0IHR0bV9yZXNvdXJjZSAqb2xkX21lbSA9
ICZiby0+bWVtOwo+ICAgCWludCByOwo+ICAgCj4gLQlpZiAoKG9sZF9tZW0tPm1lbV90eXBlID09
IFRUTV9QTF9TWVNURU0gJiYKPiAtCSAgICAgbmV3X21lbS0+bWVtX3R5cGUgPT0gVFRNX1BMX1ZS
QU0pIHx8Cj4gLQkgICAgKG9sZF9tZW0tPm1lbV90eXBlID09IFRUTV9QTF9WUkFNICYmCj4gLQkg
ICAgIG5ld19tZW0tPm1lbV90eXBlID09IFRUTV9QTF9TWVNURU0pKSB7Cj4gLQkJaG9wLT5mcGZu
ID0gMDsKPiAtCQlob3AtPmxwZm4gPSAwOwo+IC0JCWhvcC0+bWVtX3R5cGUgPSBUVE1fUExfVFQ7
Cj4gLQkJaG9wLT5mbGFncyA9IDA7Cj4gLQkJcmV0dXJuIC1FTVVMVElIT1A7Cj4gLQl9Cj4gLQo+
ICAgCWlmIChuZXdfbWVtLT5tZW1fdHlwZSA9PSBUVE1fUExfVFQpIHsKPiAgIAkJciA9IGFtZGdw
dV90dG1fYmFja2VuZF9iaW5kKGJvLT5iZGV2LCBiby0+dHRtLCBuZXdfbWVtKTsKPiAgIAkJaWYg
KHIpCj4gICAJCQlyZXR1cm4gcjsKPiAgIAl9Cj4gICAKPiAtCWFtZGdwdV9ib19tb3ZlX25vdGlm
eShibywgZXZpY3QsIG5ld19tZW0pOwo+IC0KPiAgIAkvKiBDYW4ndCBtb3ZlIGEgcGlubmVkIEJP
ICovCj4gICAJYWJvID0gdHRtX3RvX2FtZGdwdV9ibyhibyk7Cj4gICAJaWYgKFdBUk5fT05fT05D
RShhYm8tPnRiby5waW5fY291bnQgPiAwKSkKPiBAQCAtNTc5LDI0ICs1NjYsMjMgQEAgc3RhdGlj
IGludCBhbWRncHVfYm9fbW92ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBib29sIGV2
aWN0LAo+ICAgCj4gICAJaWYgKG9sZF9tZW0tPm1lbV90eXBlID09IFRUTV9QTF9TWVNURU0gJiYg
Ym8tPnR0bSA9PSBOVUxMKSB7Cj4gICAJCXR0bV9ib19tb3ZlX251bGwoYm8sIG5ld19tZW0pOwo+
IC0JCXJldHVybiAwOwo+ICsJCWdvdG8gb3V0Owo+ICAgCX0KPiAgIAlpZiAob2xkX21lbS0+bWVt
X3R5cGUgPT0gVFRNX1BMX1NZU1RFTSAmJgo+ICAgCSAgICBuZXdfbWVtLT5tZW1fdHlwZSA9PSBU
VE1fUExfVFQpIHsKPiAgIAkJdHRtX2JvX21vdmVfbnVsbChibywgbmV3X21lbSk7Cj4gLQkJcmV0
dXJuIDA7Cj4gKwkJZ290byBvdXQ7Cj4gICAJfQo+IC0KPiAgIAlpZiAob2xkX21lbS0+bWVtX3R5
cGUgPT0gVFRNX1BMX1RUICYmCj4gICAJICAgIG5ld19tZW0tPm1lbV90eXBlID09IFRUTV9QTF9T
WVNURU0pIHsKPiAgIAkJciA9IHR0bV9ib193YWl0X2N0eChibywgY3R4KTsKPiAgIAkJaWYgKHIp
Cj4gLQkJCWdvdG8gZmFpbDsKPiArCQkJcmV0dXJuIHI7Cj4gICAKPiAgIAkJYW1kZ3B1X3R0bV9i
YWNrZW5kX3VuYmluZChiby0+YmRldiwgYm8tPnR0bSk7Cj4gICAJCXR0bV9yZXNvdXJjZV9mcmVl
KGJvLCAmYm8tPm1lbSk7Cj4gICAJCXR0bV9ib19hc3NpZ25fbWVtKGJvLCBuZXdfbWVtKTsKPiAt
CQlyZXR1cm4gMDsKPiArCQlnb3RvIG91dDsKPiAgIAl9Cj4gICAKPiAgIAlpZiAob2xkX21lbS0+
bWVtX3R5cGUgPT0gQU1ER1BVX1BMX0dEUyB8fAo+IEBAIC02MDcsMjcgKzU5MywzNyBAQCBzdGF0
aWMgaW50IGFtZGdwdV9ib19tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIGJvb2wg
ZXZpY3QsCj4gICAJICAgIG5ld19tZW0tPm1lbV90eXBlID09IEFNREdQVV9QTF9PQSkgewo+ICAg
CQkvKiBOb3RoaW5nIHRvIHNhdmUgaGVyZSAqLwo+ICAgCQl0dG1fYm9fbW92ZV9udWxsKGJvLCBu
ZXdfbWVtKTsKPiAtCQlyZXR1cm4gMDsKPiArCQlnb3RvIG91dDsKPiAgIAl9Cj4gICAKPiAtCWlm
ICghYWRldi0+bW1hbi5idWZmZXJfZnVuY3NfZW5hYmxlZCkgewo+ICsJaWYgKGFkZXYtPm1tYW4u
YnVmZmVyX2Z1bmNzX2VuYWJsZWQpIHsKPiArCQlpZiAoKChvbGRfbWVtLT5tZW1fdHlwZSA9PSBU
VE1fUExfU1lTVEVNICYmCj4gKwkJICAgICAgbmV3X21lbS0+bWVtX3R5cGUgPT0gVFRNX1BMX1ZS
QU0pIHx8Cj4gKwkJICAgICAob2xkX21lbS0+bWVtX3R5cGUgPT0gVFRNX1BMX1ZSQU0gJiYKPiAr
CQkgICAgICBuZXdfbWVtLT5tZW1fdHlwZSA9PSBUVE1fUExfU1lTVEVNKSkpIHsKPiArCQkJaG9w
LT5mcGZuID0gMDsKPiArCQkJaG9wLT5scGZuID0gMDsKPiArCQkJaG9wLT5tZW1fdHlwZSA9IFRU
TV9QTF9UVDsKPiArCQkJaG9wLT5mbGFncyA9IDA7Cj4gKwkJCXJldHVybiAtRU1VTFRJSE9QOwo+
ICsJCX0KPiArCj4gKwkJciA9IGFtZGdwdV9tb3ZlX2JsaXQoYm8sIGV2aWN0LCBuZXdfbWVtLCBv
bGRfbWVtKTsKPiArCX0gZWxzZSB7Cj4gICAJCXIgPSAtRU5PREVWOwo+IC0JCWdvdG8gbWVtY3B5
Owo+ICAgCX0KPiAgIAo+IC0JciA9IGFtZGdwdV9tb3ZlX2JsaXQoYm8sIGV2aWN0LCBuZXdfbWVt
LCBvbGRfbWVtKTsKPiAgIAlpZiAocikgewo+IC1tZW1jcHk6Cj4gICAJCS8qIENoZWNrIHRoYXQg
YWxsIG1lbW9yeSBpcyBDUFUgYWNjZXNzaWJsZSAqLwo+ICAgCQlpZiAoIWFtZGdwdV9tZW1fdmlz
aWJsZShhZGV2LCBvbGRfbWVtKSB8fAo+ICAgCQkgICAgIWFtZGdwdV9tZW1fdmlzaWJsZShhZGV2
LCBuZXdfbWVtKSkgewo+ICAgCQkJcHJfZXJyKCJNb3ZlIGJ1ZmZlciBmYWxsYmFjayB0byBtZW1j
cHkgdW5hdmFpbGFibGVcbiIpOwo+IC0JCQlnb3RvIGZhaWw7Cj4gKwkJCXJldHVybiByOwo+ICAg
CQl9Cj4gICAKPiAgIAkJciA9IHR0bV9ib19tb3ZlX21lbWNweShibywgY3R4LCBuZXdfbWVtKTsK
PiAgIAkJaWYgKHIpCj4gLQkJCWdvdG8gZmFpbDsKPiArCQkJcmV0dXJuIHI7Cj4gICAJfQo+ICAg
Cj4gICAJaWYgKGJvLT50eXBlID09IHR0bV9ib190eXBlX2RldmljZSAmJgo+IEBAIC02MzksMTQg
KzYzNSwxMSBAQCBzdGF0aWMgaW50IGFtZGdwdV9ib19tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29i
amVjdCAqYm8sIGJvb2wgZXZpY3QsCj4gICAJCWFiby0+ZmxhZ3MgJj0gfkFNREdQVV9HRU1fQ1JF
QVRFX0NQVV9BQ0NFU1NfUkVRVUlSRUQ7Cj4gICAJfQo+ICAgCj4gK291dDoKPiAgIAkvKiB1cGRh
dGUgc3RhdGlzdGljcyAqLwo+ICAgCWF0b21pYzY0X2FkZCgodTY0KWJvLT5udW1fcGFnZXMgPDwg
UEFHRV9TSElGVCwgJmFkZXYtPm51bV9ieXRlc19tb3ZlZCk7Cj4gKwlhbWRncHVfYm9fbW92ZV9u
b3RpZnkoYm8sIGV2aWN0LCBuZXdfbWVtKTsKPiAgIAlyZXR1cm4gMDsKPiAtZmFpbDoKPiAtCXN3
YXAoKm5ld19tZW0sIGJvLT5tZW0pOwo+IC0JYW1kZ3B1X2JvX21vdmVfbm90aWZ5KGJvLCBmYWxz
ZSwgbmV3X21lbSk7Cj4gLQlzd2FwKCpuZXdfbWVtLCBiby0+bWVtKTsKPiAtCXJldHVybiByOwo+
ICAgfQo+ICAgCj4gICAvKioKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
