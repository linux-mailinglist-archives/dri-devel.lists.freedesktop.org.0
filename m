Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DB81F564D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 15:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280066E5A3;
	Wed, 10 Jun 2020 13:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770048.outbound.protection.outlook.com [40.107.77.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1796B6E5A3;
 Wed, 10 Jun 2020 13:56:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkVq0xcODFKv1yGtGkgX1A+vR0oMj/7msqN7P9Aai0RM3Kysyf2mOl43aYEJHZt5NE4cTCd3Q8jkpSNNmcw/BAVxaVaWrtZlddovZWZ0YrL3soHqkISt93v9mLr7SxxkcfDhruNitPIMNGHNnDYW0nQOD4KtHmH8Su6TFRcs90tc4FVxW6LVKbgqT5myBAXjxo2wNZJkLsVLtnDJQP+VNR7CJGf/qauGVV9L8M8RXhi0RQJUJ75RIjhX+OsasgQvyfYxecrQYubcVZwy/2F4K7j51BBm8RqYdmeJipZP3lWGeVyzvsNyxJ3gpcgaqUnx8t+BHHaoSfaZ16uTysZifw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9kwEBtnLaK1HyJeQb+1eDE2E9kxW0UzCcDicU4LA/Y=;
 b=HJ4+GDio6Rcej0/zrAahd0V89kV/+BnnRipDYbi8aqmL5xTsLx/4lxeNY3AEyo6Ul8Ohoprp8mvbAxKBToyl/HyLauAaKLT1WmoG0UlxsfguNJLh/uBxZ/IiXlHSC8CGeCD1SpLsyz3kYPOsZqGh/OimJ0ASZ/kLwUmq5HWcutRwFkTbFxQt/5KUBRQNE+tXjFlQY2KEWXpXXX6iXg91mmzRwBD2AWmmQa/p0SrLMFflmimohtcx0/nwud6BVRzVmlCZTNKoix4Tkmo5zh3Q2VLvoC9Egv+aM3KhrEg8ad1nDzTVf3YASGhPIVnv3DSmgwwd79fgqijhh1JPrVL/3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9kwEBtnLaK1HyJeQb+1eDE2E9kxW0UzCcDicU4LA/Y=;
 b=Yf6B30ggQbLkwHpl3Zs+aJtcfN+HqKIEZHbZo1IAnUJ1pvA81lBWd2kxPasTt5vKlVGO0ZOFSqh7mw6vn7158uZvS4ccH50uVT79u+QtwFEyXCzQDy6Q0fX+DtxU5itaNele1/5Cw+MnRA1dpVf+qTklzT2I+1UzwuOUdU65cdc=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB3435.namprd12.prod.outlook.com (2603:10b6:5:39::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.22; Wed, 10 Jun 2020 13:56:40 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::943d:4dcf:f18e:5df]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::943d:4dcf:f18e:5df%2]) with mapi id 15.20.3088.018; Wed, 10 Jun 2020
 13:56:40 +0000
Subject: Re: [PATCH 5/6] drm/ttm: Add destroy flag in TTM BO eviction interface
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
 <1589050310-19666-6-git-send-email-andrey.grodzovsky@amd.com>
 <dd61e068-cbf1-c612-2c7f-f1e7786b16f7@shipmail.org>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <f9ecea63-8d6e-bb01-8c27-6b85971c2570@amd.com>
Date: Wed, 10 Jun 2020 09:56:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <dd61e068-cbf1-c612-2c7f-f1e7786b16f7@shipmail.org>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0110.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::19) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3ee0:2de:8925:fc4b:27b0:2560]
 (2607:fea8:3ee0:2de:8925:fc4b:27b0:2560) by
 YT1PR01CA0110.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.19 via Frontend Transport; Wed, 10 Jun 2020 13:56:39 +0000
X-Originating-IP: [2607:fea8:3ee0:2de:8925:fc4b:27b0:2560]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3bbbee06-8323-4e24-f047-08d80d4619af
X-MS-TrafficTypeDiagnostic: DM6PR12MB3435:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3435D4469DB3D76B1C7453D8EA830@DM6PR12MB3435.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:195;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KhdS98MvnGIXEpPbF5PU62iDo4duozf3lbXmUgsJHnNWFVUkQ+CIgBgtNRapTqDorkaWYeG8HEtlBDZ2/pOKjQ2xKUeiCvkHCxIDj9msbwfX2ib7pPwy3dcDqwL/TqylO8m1sQN49k6zu+SMTbg1B5EYFFMxgBktPzV9x+6yyHYPkz7FJ5kdliHH9nmF+BjsHDZZ4qXAZk6ISOwsACJFp09GCCYejmIFgdLawCbGT1Rf7e/kT/IzIiGbdAysKQARm0ndfImLNJfMVr8QG98ivEqPGnvRn2mDwJf2/9GQosld4IKWAgXY0crvnzWDfkL//nKtud5FX+GLU0qFexik8jfeP00MMPv2bTbNyES8orYhlLkZiFa0hia01qVkamcv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(16526019)(8676002)(31686004)(8936002)(86362001)(5660300002)(6486002)(31696002)(4326008)(52116002)(478600001)(66574014)(53546011)(83380400001)(316002)(66476007)(186003)(2906002)(66946007)(36756003)(2616005)(66556008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: K9SoXw5pc404U/i5LxJZR5/Zg910I7/4KBZQ6EpZMQS6TSf+mzQRi5gSBU2r3hhYA1jb5+mHUvLNxM9ONdT0Ehvu3MPUthOEIxDQmttJHqlbijUKjvel09KrF5MFIpT/3B3Lp2yR+JPVPLY52Vam863l5Djace8svB9xrckjTfIOA9BI/A9zBrmsughUisBAlfYYcWfPlInUtm9DoAaeWF+ktV5yH6eUsCKI076qqcJ8OA0Y6qu+GGc6y9ikfZ+oY5F6lCA5DguhmS9L5WwyjjxzOvAUTutH/gISbdikLJr4p0ViJpkb0z5362V7NvaUOf7WMF+WKxOvHIQpUS7WdENsMe0dEw8gZgGx/fk7m2umb/8EE3YmPGwK0IAtAxcrFVk3TEIdBVDEjEfL4rV5WNKQWy4cfSeZw8tcJfhnwXBVracMs3yENcENFW8NgNW/FomqTy9o0X7gVuw1LsbNOro80ardnDm3bOF/i/rFbkkheC8AN4EfYeY3hmzmc+0ryQqSukdFB9fI2o53lcEAxSu7I1TwGPgIfAok7WptArk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bbbee06-8323-4e24-f047-08d80d4619af
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 13:56:40.3763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h5qR+6tA6l3Jd5SAbT2MR6R0FFe1n7mQ1dRlEUK2RA0VEZyh0H7RNXqUY3gnba2MxU1o86s3NHGM0g96Ypn79Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3435
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net,
 ckoenig.leichtzumerken@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8xMC8yMCA2OjI1IEFNLCBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpIHdyb3RlOgo+Cj4g
T24gNS85LzIwIDg6NTEgUE0sIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+PiBUaGlzIHdpbGwg
YWxsb3cgdG8gaW52YWxpZGF0ZSwgZGVzdHJveSBiYWNraW5nIHN0b3JhZ2UgYW5kIG5vdGlmeSB1
c2Vycwo+PiBvZiBCT3Mgd2hlbiBkZXZpY2UgaXMgdW5wbHVnZWQuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+Cj4gUGxl
YXNlIGFkZCBhIG1vdGl2YXRpb24gaW4gdGhlIGNvbW1pdCBtZXNzYWdlIGFuZCB1c2UgaW1wZXJh
dGl2ZSAKPiB3b3JkaW5nICgiQWxsb3cgdG8gaW52YWxpZGF0ZS4uLiIgaW5zdGVhZCBvZiAiVGhp
cyB3aWxsIGFsbG93IHRvIikKPgo+IHMgL3VucGx1Z2VkL3VucGx1Z2dlZC8KCgpJIGFtIG5vdCBz
dXJlIHlldCB0aGlzIHBhdGNoIGlzIG5lZWRlZCBpbiBWMgoKQW5kcmV5CgoKPgo+Cj4+IC0tLQo+
PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jIHzCoCAyICst
Cj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuY8KgIHzCoCAy
ICstCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmPCoMKgwqDCoMKg
wqAgfMKgIDIgKy0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoCA0ICstLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl9vYmplY3QuY8KgwqDCoMKgwqAgfMKgIDIgKy0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDQxIAo+PiArKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9kcnYuY8KgwqDCoMKgwqDCoMKgwqAgfMKgIDYgKystLS0KPj4gwqAgaW5jbHVkZS9kcm0vdHRt
L3R0bV9ib19hcGkuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+PiDC
oCA4IGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCBiL2luY2x1ZGUvZHJt
L3R0bS90dG1fYm9fYXBpLmgKPj4gaW5kZXggYjliYzFiMC4uOWQ1N2I4YyAxMDA2NDQKPj4gLS0t
IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaAo+PiArKysgYi9pbmNsdWRlL2RybS90dG0v
dHRtX2JvX2FwaS5oCj4+IEBAIC01OTcsNyArNTk3LDcgQEAgaW50IHR0bV9ib19jbGVhbl9tbShz
dHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwgCj4+IHVuc2lnbmVkIG1lbV90eXBlKTsKPj4gwqDC
oCAqIC1FUkVTVEFSVFNZUzogVGhlIGNhbGwgd2FzIGludGVycnVwdGVkIGJ5IGEgc2lnbmFsIHdo
aWxlIHdhaXRpbmcgdG8KPj4gwqDCoCAqIGV2aWN0IGEgYnVmZmVyLgo+PiDCoMKgICovCj4KPiBQ
bGVhc2UgYWxzbyB1cGRhdGUgdGhlIGZ1bmN0aW9uIGRvY3VtZW50YXRpb24uCj4KPj4gLWludCB0
dG1fYm9fZXZpY3RfbW0oc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVuc2lnbmVkIG1lbV90
eXBlKTsKPj4gK2ludCB0dG1fYm9fZXZpY3RfbW0oc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYs
IHVuc2lnbmVkIG1lbV90eXBlLCAKPj4gYm9vbCBkZXN0cm95KTsKPj4gwqAgwqAgLyoqCj4+IMKg
wqAgKiB0dG1fa21hcF9vYmpfdmlydHVhbAo+Cj4KPiBUaGFua3MsCj4KPiBUaG9tYXMKPgo+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
