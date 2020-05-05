Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE1B1C5822
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 16:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29EA6E262;
	Tue,  5 May 2020 14:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700062.outbound.protection.outlook.com [40.107.70.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64646E262;
 Tue,  5 May 2020 14:07:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hES0BXgAQqFN1eqOtXSy8R/OlHeJq/vMccWBZZ/RlemR9lasKov2caLAeDFhv1yMCkWtbn4kU+LrUIuN5/01+hmwGpWIrPHtf2L0n5EWxWPvNL2izbDAvtQu9/pBNGx6/BNra+Z7HjBu8oXcdYTeL4A0+t9a59BBLEv+yl306mWiT3c8iHmj67DYi3x/YKmWmYbm2l6L4k/hNEMRZVLLd6yZU5W6AYPMLKX4s0DlgaXQDsufYkjyznZf1NVNzDugk6NdPZM3UmJ2+WI7NWQBLi/nuYgnL/9Gw/HQIMyWSRsW+2/14Z5ILK25rjufJfz/uVcLCbNkJYl5RwuzppTvoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQcF/r3gTa/ltYgixgR3j/1xXcBt4gFUfbfutVwujws=;
 b=bRfGT6urieosTQ66lU0G6cwI479rdOxI5ajlqS/2BFf3udsE7jAXZmy66aEr4ebUY5lbjLLpypAtg1osSithpItuf6NbI9BM8nbNorSs54dExyyUm9atMnbMvEXniODqZETSClJq7QcX/XPADiIJzUz83kVaxf105KYmemPivZdfSrfnSjl/zr3e5zP0S1qe+jykQ6aNh7NgrQXGEfxivnIHbWJSSFgWEUrB+CT7BL1TYBsAVvT7ftwYEGYNusSTtVJrSO3K/l8n2rglskRv3OYoNqCi4fqjmHgvRkJKrrvFulojB0PdeTYFFoUPklSzT+NVPy3acw1PTu7DkHy7DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQcF/r3gTa/ltYgixgR3j/1xXcBt4gFUfbfutVwujws=;
 b=K6xB6fUq+6o087HCyw5m7sNB2NolaIMsqEYMreLvTrgJathdYEhQE3XFc1HeMWPqIsVLUshxNCvOUKcDLKT9dUo1FUltcb+5Lec/p5Tx4duQqD76+Q2CORh0G2bgB3c3r5DTmyRd8/3Rp03WeSWnnGh7f2WfpYKjwVNnVcdnhxQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3051.namprd12.prod.outlook.com (2603:10b6:5:119::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Tue, 5 May
 2020 14:07:09 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.2979.027; Tue, 5 May 2020
 14:07:09 +0000
Subject: Re: [PATCH] drm/amdgpu: allocate large structures dynamically
To: Arnd Bergmann <arnd@arndb.de>, Alex Deucher <alexander.deucher@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>, John Clements <john.clements@amd.com>
References: <20200505140208.284473-1-arnd@arndb.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6bbd0f78-6f42-968e-2269-0a6279753267@amd.com>
Date: Tue, 5 May 2020 16:07:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200505140208.284473-1-arnd@arndb.de>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0027.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::37) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0027.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Tue, 5 May 2020 14:07:06 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 23acd443-0029-42c5-aeda-08d7f0fd9971
X-MS-TrafficTypeDiagnostic: DM6PR12MB3051:|DM6PR12MB3051:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB30518DB9BA275836BA6DD6F483A70@DM6PR12MB3051.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-Forefront-PRVS: 0394259C80
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vPGS5HDO72NDu0xdMIrSXLVwDfTnXucEySZ3nhunIkVXKjF1HdT812nqLgEUQhpP8dry4HYApJ+sDdWP6PCN8rLncJdiwlZt5n9MQhCxsgz4y4uggq0mjh8k22cYn55v15u0a3OpFiTFnRv6WqIU86ZWviA7BD8ed5OzJSB0jbwH2P9n6tldHvwNSkeYYDjmjb6jTdGsfoO+okhEasuO6YzoSSwflkTS7wiQQ4bg7Ao8JvP1TmDman8ZEdPn/pXECIPPx7Hsoi4baDXCJIe3W0NkoEWDiO84RoUapfR/wtZiyoUr/fmGpysK1krlGLFiTESXE87D1f/vKXLEjLFR4mRg3OcW9HWJgjXvYEsGjfQGbPgR6VWlJmru40wyzGnjlh4NA5ndC83Aiw7n7p2lIhlGnbxJfuIjpySpotZdw/vKrqAqVZ1XrjSY+8rua2tG6+7O2f1dwiE7efMGsCXLJYKlDwHsCQKw5lftQjXNZU+N1oRsW/6Sn57qXU5JCXxzrjjPEzPLvp8QkSLNofVFCrI1VOGw0gGkj1DFvS//DY6Jb/TPVa7XLUF8fNW2cb4b
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(33430700001)(66476007)(66556008)(31686004)(6636002)(110136005)(316002)(54906003)(4326008)(8676002)(6486002)(33440700001)(8936002)(2616005)(186003)(86362001)(16526019)(66574012)(478600001)(2906002)(36756003)(52116002)(5660300002)(66946007)(6666004)(31696002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 4HctXg65QQrkCq0xCEttt+NFeOpFp+QCTgFBLh44EHHaGbjWHR0LpG9TAlM8bUpIjvowC+Uc8hHxbf6EXDqHhtVE2dVrAPLidg8D0/pwe1pPh7Jk+Z5YFSQU1VEeoaxmdxTG1DfPCrv37RP1qwvTJ69+JySclWjpGnf6pHTaOGO/8Lri04Sdymf9Ed2ZiSKUsoHS1oCFu1cefiwPtDEbdsV9Bo92E1cr98cGE1xenfEKml8+CBGzGjxx3o3DKCJ86XokQbu2dNuYKMkwO8zkuxH6+WssyS1DF60IraDJNUQ0T3HSfnlgM6JSYlpck9IW9oCHpCN+iwVsUxrIGLWkYGQVyY4MIg/KfQ8ARC9aCUs/vos2feCLMibMs0o183NhuhweHP9WBoCcuhtnO0haBSW/TLsKNc1CDtlDDQMfa6rFv7OoHqxCo3b3Qsx6uo7p5ksWouuE4o+DEC4bMknT/IhRKG0JgV+E5MDeSShXXcPmNEVSxv/xoxcFE/io/GB8lbJzySSUJ5xgn7pGeiJwQPQdaqc/73Q/uUuJxg7haI5PEuEaELe2BivMlHGBW0lKdcnnMVFt44TaspuF1vuvsFJJ3xpdcHEVACF/KyaUfs0KTjhJvq9oIw5vCsa9+hJ+FtfrHd382sGJBJMWh0QfIyb04GI2AXIAtdzB6UsnXeCI9k69ytVytnHvqN/Iw1MN7L5OawvWajyJhs7MDuKOtboROpGCbs3ySBDmNTlhDnrlk+aHgT3XHSBbIOVglYw1LBBtftSGkAGNA+VFpFOTXe5eNO+7F9xLXzT7ZPNvqv0vW14JR1qUp0vCY1XC4Y7ozBfcwLjEN9hqRTDS7RM2fBEIyaADCPs7rMhkp87gz44=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23acd443-0029-42c5-aeda-08d7f0fd9971
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2020 14:07:09.0121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rrjmOou45SVn4jET3Tfs3gagJrijAKJsuXb3eMVynxuUi7bAbOvbHSAVLsTT4DP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3051
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
Cc: Guchun Chen <guchun.chen@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Dennis Li <Dennis.Li@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDUuMDUuMjAgdW0gMTY6MDEgc2NocmllYiBBcm5kIEJlcmdtYW5uOgo+IEFmdGVyIHRoZSBz
dHJ1Y3R1cmUgd2FzIHBhZGRlZCB0byAxMDI0IGJ5dGVzLCBpdCBpcyBubyBsb25nZXIKPiBzdWl0
YWJsZSBmb3IgYmVpbmcgYSBsb2NhbCB2YXJpYWJsZSwgYXMgdGhlIGZ1bmN0aW9uIHN1cnBhc3Nl
cwo+IHRoZSB3YXJuaW5nIGxpbWl0IGZvciAzMi1iaXQgYXJjaGl0ZWN0dXJlczoKPgo+IGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYzo1ODc6NTogZXJyb3I6IHN0YWNrIGZy
YW1lIHNpemUgb2YgMTA3MiBieXRlcyBpbiBmdW5jdGlvbiAnYW1kZ3B1X3Jhc19mZWF0dXJlX2Vu
YWJsZScgWy1XZXJyb3IsLVdmcmFtZS1sYXJnZXItdGhhbj1dCj4gaW50IGFtZGdwdV9yYXNfZmVh
dHVyZV9lbmFibGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gICAgICBeCj4KPiBVc2Ug
a3phbGxvYygpIGluc3RlYWQgdG8gZ2V0IGl0IGZyb20gdGhlIGhlYXAuCj4KPiBGaXhlczogYTBk
MjU0ODIwZjQzICgiZHJtL2FtZGdwdTogdXBkYXRlIFJBUyBUQSB0byBIb3N0IGludGVyZmFjZSIp
Cj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCkFja2VkLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CgpXZSBoYXZlIGEg
YnVuY2ggb2YgdGhvc2Ugd2FybmluZ3MgaW4gdGhlIERBTCBjb2RlIGFzIHdlbGwuCgpDaHJpc3Rp
YW4uCgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwg
MzEgKysrKysrKysrKysrKysrKystLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2Vy
dGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9yYXMuYwo+IGluZGV4IDUzODg5NWNmZDg2Mi4uNzM0ODYxOTI1M2M3IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwo+IEBAIC01ODgsMTkgKzU4OCwyMyBA
QCBpbnQgYW1kZ3B1X3Jhc19mZWF0dXJlX2VuYWJsZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwKPiAgIAkJc3RydWN0IHJhc19jb21tb25faWYgKmhlYWQsIGJvb2wgZW5hYmxlKQo+ICAgewo+
ICAgCXN0cnVjdCBhbWRncHVfcmFzICpjb24gPSBhbWRncHVfcmFzX2dldF9jb250ZXh0KGFkZXYp
Owo+IC0JdW5pb24gdGFfcmFzX2NtZF9pbnB1dCBpbmZvOwo+ICsJdW5pb24gdGFfcmFzX2NtZF9p
bnB1dCAqaW5mbzsKPiAgIAlpbnQgcmV0Owo+ICAgCj4gICAJaWYgKCFjb24pCj4gICAJCXJldHVy
biAtRUlOVkFMOwo+ICAgCj4gKyAgICAgICAgaW5mbyA9IGt6YWxsb2Moc2l6ZW9mKHVuaW9uIHRh
X3Jhc19jbWRfaW5wdXQpLCBHRlBfS0VSTkVMKTsKPiArCWlmICghaW5mbykKPiArCQlyZXR1cm4g
LUVOT01FTTsKPiArCj4gICAJaWYgKCFlbmFibGUpIHsKPiAtCQlpbmZvLmRpc2FibGVfZmVhdHVy
ZXMgPSAoc3RydWN0IHRhX3Jhc19kaXNhYmxlX2ZlYXR1cmVzX2lucHV0KSB7Cj4gKwkJaW5mby0+
ZGlzYWJsZV9mZWF0dXJlcyA9IChzdHJ1Y3QgdGFfcmFzX2Rpc2FibGVfZmVhdHVyZXNfaW5wdXQp
IHsKPiAgIAkJCS5ibG9ja19pZCA9ICBhbWRncHVfcmFzX2Jsb2NrX3RvX3RhKGhlYWQtPmJsb2Nr
KSwKPiAgIAkJCS5lcnJvcl90eXBlID0gYW1kZ3B1X3Jhc19lcnJvcl90b190YShoZWFkLT50eXBl
KSwKPiAgIAkJfTsKPiAgIAl9IGVsc2Ugewo+IC0JCWluZm8uZW5hYmxlX2ZlYXR1cmVzID0gKHN0
cnVjdCB0YV9yYXNfZW5hYmxlX2ZlYXR1cmVzX2lucHV0KSB7Cj4gKwkJaW5mby0+ZW5hYmxlX2Zl
YXR1cmVzID0gKHN0cnVjdCB0YV9yYXNfZW5hYmxlX2ZlYXR1cmVzX2lucHV0KSB7Cj4gICAJCQku
YmxvY2tfaWQgPSAgYW1kZ3B1X3Jhc19ibG9ja190b190YShoZWFkLT5ibG9jayksCj4gICAJCQku
ZXJyb3JfdHlwZSA9IGFtZGdwdV9yYXNfZXJyb3JfdG9fdGEoaGVhZC0+dHlwZSksCj4gICAJCX07
Cj4gQEAgLTYwOSwyNiArNjEzLDMzIEBAIGludCBhbWRncHVfcmFzX2ZlYXR1cmVfZW5hYmxlKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAgCS8qIERvIG5vdCBlbmFibGUgaWYgaXQgaXMg
bm90IGFsbG93ZWQuICovCj4gICAJV0FSTl9PTihlbmFibGUgJiYgIWFtZGdwdV9yYXNfaXNfZmVh
dHVyZV9hbGxvd2VkKGFkZXYsIGhlYWQpKTsKPiAgIAkvKiBBcmUgd2UgYWxlcmFkeSBpbiB0aGF0
IHN0YXRlIHdlIGFyZSBnb2luZyB0byBzZXQ/ICovCj4gLQlpZiAoISghIWVuYWJsZSBeICEhYW1k
Z3B1X3Jhc19pc19mZWF0dXJlX2VuYWJsZWQoYWRldiwgaGVhZCkpKQo+IC0JCXJldHVybiAwOwo+
ICsJaWYgKCEoISFlbmFibGUgXiAhIWFtZGdwdV9yYXNfaXNfZmVhdHVyZV9lbmFibGVkKGFkZXYs
IGhlYWQpKSkgewo+ICsJCXJldCA9IDA7Cj4gKwkJZ290byBvdXQ7Cj4gKwl9Cj4gICAKPiAgIAlp
ZiAoIWFtZGdwdV9yYXNfaW50cl90cmlnZ2VyZWQoKSkgewo+IC0JCXJldCA9IHBzcF9yYXNfZW5h
YmxlX2ZlYXR1cmVzKCZhZGV2LT5wc3AsICZpbmZvLCBlbmFibGUpOwo+ICsJCXJldCA9IHBzcF9y
YXNfZW5hYmxlX2ZlYXR1cmVzKCZhZGV2LT5wc3AsIGluZm8sIGVuYWJsZSk7Cj4gICAJCWlmIChy
ZXQpIHsKPiAgIAkJCWFtZGdwdV9yYXNfcGFyc2Vfc3RhdHVzX2NvZGUoYWRldiwKPiAgIAkJCQkJ
CSAgICAgZW5hYmxlID8gImVuYWJsZSI6ImRpc2FibGUiLAo+ICAgCQkJCQkJICAgICByYXNfYmxv
Y2tfc3RyKGhlYWQtPmJsb2NrKSwKPiAgIAkJCQkJCSAgICAoZW51bSB0YV9yYXNfc3RhdHVzKXJl
dCk7Cj4gICAJCQlpZiAocmV0ID09IFRBX1JBU19TVEFUVVNfX1JFU0VUX05FRURFRCkKPiAtCQkJ
CXJldHVybiAtRUFHQUlOOwo+IC0JCQlyZXR1cm4gLUVJTlZBTDsKPiArCQkJCXJldCA9IC1FQUdB
SU47Cj4gKwkJCWVsc2UKPiArCQkJCXJldCA9IC1FSU5WQUw7Cj4gKwo+ICsJCQlnb3RvIG91dDsK
PiAgIAkJfQo+ICAgCX0KPiAgIAo+ICAgCS8qIHNldHVwIHRoZSBvYmogKi8KPiAgIAlfX2FtZGdw
dV9yYXNfZmVhdHVyZV9lbmFibGUoYWRldiwgaGVhZCwgZW5hYmxlKTsKPiAtCj4gLQlyZXR1cm4g
MDsKPiArCXJldCA9IDA7Cj4gK291dDoKPiArCWtmcmVlKGluZm8pOwo+ICsJcmV0dXJuIHJldDsK
PiAgIH0KPiAgIAo+ICAgLyogT25seSB1c2VkIGluIGRldmljZSBwcm9iZSBzdGFnZSBhbmQgY2Fs
bGVkIG9ubHkgb25jZS4gKi8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
