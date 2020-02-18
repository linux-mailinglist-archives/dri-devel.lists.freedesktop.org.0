Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBDE162BAE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 18:10:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01766E0ED;
	Tue, 18 Feb 2020 17:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F080892AC;
 Tue, 18 Feb 2020 17:10:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3h0ML2ABFqjBGnKUH8VT8scIa11plpPMvqIt6UYaQ3FvGuoGWJhRlDEEnsAkLXyhxA+FWjio1u0sjn03EiWVAW7pB2vqsYSksWyDLTbam6M9DOOnxgyJf5l5PZ9nVc20rsJmUO0waC5+SXyYWfYDTHgt4LPiCvcfGMPZgqV/zs5J3C5IVrmXkPqJsywRbiRdBlLqBPhAyek3BMxGcTJafe+tcwSyoiA29+Ryv46TozgLtSacNIU8HkZLQzUItWFZf7ttSMvda58Y7hbWJlgvhbABwpt1GWfBFHFbA91yZB6RVhGsbLiUHbRmM2bQtWiiWojvTv0dDwyFx5OG8y74A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pbN1UEdYGmv1ApkMrSodX6ZyR+6+Mq7LC0XGoIe474=;
 b=NFSau0Wr8xsLjQq28jLiYnTdJJLc2QoBVV9z4xpO1P7TbtncVCMJy4YH/S0MIRR43HzvZmF/pk59Ps7dFycWsTC0lNzgl/Fj2MvhqsfWQLnXe+HCVZPWDcHcIcim/93q0amfKBvTc1GfCp5e1w2NGHZVu3j5oCw0nFuhDJ1fCgDJKDWN1pEXaHX0Gqyimn6+Ew/8jI6MZsIK9xb2dPcirtwWcnwCkxlA1Z3Zu8CoLPR/nyqzFXk3TekJwifkYiE3cxwP007EHvFXO8GdMrUHw0wI1jmho7zKGgHNKJGVqKLFFNeapNpvyNXObZ3ASw9x0sVsglXQ0AJ+tBV9r9G+AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pbN1UEdYGmv1ApkMrSodX6ZyR+6+Mq7LC0XGoIe474=;
 b=gzMrd6HM9dQY0Of9jMESP184FWPRPi1VgGjIpPotNBPmJL5YDghDQF8of68LwdmJlXRwN5q/URoV08bjFkrP9bus+rtMk3iePFNswr1rOBc1K6ss+iM4v0x466AO9SugL9/wEhzZn0OJocLBJLwwjSeBcCeRx6sTvdDzkMkyoSA=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nirmoy.Das@amd.com; 
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (52.132.143.139) by
 DM5PR12MB1450.namprd12.prod.outlook.com (10.172.33.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Tue, 18 Feb 2020 17:10:35 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::ac12:6413:cd14:4904]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::ac12:6413:cd14:4904%4]) with mapi id 15.20.2750.016; Tue, 18 Feb 2020
 17:10:35 +0000
Subject: Re: [PATCH 8/8] drm/ttm: do not keep GPU dependent addresses
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Nirmoy Das
 <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200217150427.49994-1-nirmoy.das@amd.com>
 <20200217150427.49994-9-nirmoy.das@amd.com>
 <c3a20c1b-0520-1995-7445-9e3f3ea77394@suse.de>
 <9db59846-90b4-2b9a-8200-69297112693a@amd.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <edc985f1-8856-4d1a-8960-efe4d21b960d@amd.com>
Date: Tue, 18 Feb 2020 18:13:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <9db59846-90b4-2b9a-8200-69297112693a@amd.com>
Content-Language: en-US
X-ClientProxiedBy: ZRAP278CA0018.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::28) To DM5PR12MB2376.namprd12.prod.outlook.com
 (2603:10b6:4:b9::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f2c:e900:7512:2832:6401:b174]
 (2003:c5:8f2c:e900:7512:2832:6401:b174) by
 ZRAP278CA0018.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:10::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.17 via Frontend Transport; Tue, 18 Feb 2020 17:10:31 +0000
X-Originating-IP: [2003:c5:8f2c:e900:7512:2832:6401:b174]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 283e9075-832f-4ba4-f766-08d7b49577cf
X-MS-TrafficTypeDiagnostic: DM5PR12MB1450:|DM5PR12MB1450:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB14505F1C309D7759BDB731E28B110@DM5PR12MB1450.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 031763BCAF
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(199004)(189003)(5660300002)(2906002)(2616005)(316002)(6666004)(8936002)(4326008)(31686004)(8676002)(81156014)(66574012)(52116002)(6486002)(81166006)(478600001)(36756003)(66476007)(66556008)(53546011)(31696002)(16526019)(7416002)(110136005)(66946007)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1450;
 H:DM5PR12MB2376.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fkfIpFwCDqfouZL0oaF4EAosEL3GeOLks+3cixGVw+vIpQ7lP0kEfobkBTJzkGeU+iryak589jdN4XuhSyuCA9GS8cAIalNE1PrWVj4/MpRvUVwh0d/D0JogltsIPypkSAeEghWNYYq2tKN0Tq1cP6ViAjHLhautpLRBAjUF6AUSXnZFBjyvQNVKiW8C5ybm8K3jBOhh3Bpyfwit0/M+jYtgKwhDta0NXOJDDCkWUHu/YBHSYbx9cKVJx8Hm721RMcOZXDLSV2vmjdUdwRXXPI9HcNDxc/k3EqwA4MMJeh1B/Lj6KenkVeJoiI/TaKBhshR63dBR+Zvq2Qn3T2b7vm08VmMJ0dufUmWDJMIJw5klQ3T0qxGmYPGyzocMMfPKUpqDopHKDY5Oe4KU0Tlk3Pohopl51jdK3Wr5PUUb/ry33UitZehBuBwBUkR6R4pb
X-MS-Exchange-AntiSpam-MessageData: VPCzzUUZwCCsKC2bywEdXCyRGR1pOk9bcezY7kDXiAFnbIXKLqvh7xtn2KBnPmh7toZSfLq5kqROV1C9lGNsLM5+RfAsDkNjmc7It7gEfbGBPQco2/FczDT9E+9p3HVLAQoRWLtnKfhdcX6UJ6eiKJzqItd96Fm0WwKObuOKAiPYKFPx2DAQk9JU7xG3D6hBhXtUn1w7KfIcbsV15brkjQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 283e9075-832f-4ba4-f766-08d7b49577cf
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2020 17:10:35.2617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u2lfe4iT9FFTzRlDCHsY3kxIW05ZR9ZEqyZaNDz8k/3LvlpwPd6fzqojP+4ztKDnKozIPp9EhxhDuoZsmiYJmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1450
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 nouveau@lists.freedesktop.org, alexander.deucher@amd.com, sean@poorly.run,
 kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIvMTgvMjAgMTo0NCBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAxOC4wMi4y
MCB1bSAxMzo0MCBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOgo+PiBIaQo+Pgo+PiBBbSAxNy4w
Mi4yMCB1bSAxNjowNCBzY2hyaWViIE5pcm1veSBEYXM6Cj4+PiBHUFUgYWRkcmVzcyBoYW5kbGlu
ZyBpcyBkZXZpY2Ugc3BlY2lmaWMgYW5kIHNob3VsZCBiZSBoYW5kbGUgYnkgaXRzIAo+Pj4gZGV2
aWNlCj4+PiBkcml2ZXIuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTmlybW95IERhcyA8bmlybW95
LmRhc0BhbWQuY29tPgo+Pj4gLS0tCj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5j
wqDCoMKgIHwgNyAtLS0tLS0tCj4+PiDCoCBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5owqDC
oMKgIHwgMiAtLQo+Pj4gwqAgaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCB8IDEgLQo+
Pj4gwqAgMyBmaWxlcyBjaGFuZ2VkLCAxMCBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyAKPj4+IGIvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYwo+Pj4gaW5kZXggMTUxZWRmZDhkZTc3Li5kNTg4NWNkNjA5YTMgMTAwNjQ0Cj4+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCj4+PiBAQCAtODUsNyArODUsNiBAQCBzdGF0aWMgdm9pZCB0dG1f
bWVtX3R5cGVfZGVidWcoc3RydWN0IAo+Pj4gdHRtX2JvX2RldmljZSAqYmRldiwgc3RydWN0IGRy
bV9wcmludGVyICpwCj4+PiDCoMKgwqDCoMKgIGRybV9wcmludGYocCwgIsKgwqDCoCBoYXNfdHlw
ZTogJWRcbiIsIG1hbi0+aGFzX3R5cGUpOwo+Pj4gwqDCoMKgwqDCoCBkcm1fcHJpbnRmKHAsICLC
oMKgwqAgdXNlX3R5cGU6ICVkXG4iLCBtYW4tPnVzZV90eXBlKTsKPj4+IMKgwqDCoMKgwqAgZHJt
X3ByaW50ZihwLCAiwqDCoMKgIGZsYWdzOiAweCUwOFhcbiIsIG1hbi0+ZmxhZ3MpOwo+Pj4gLcKg
wqDCoCBkcm1fcHJpbnRmKHAsICLCoMKgwqAgZ3B1X29mZnNldDogMHglMDhsbFhcbiIsIG1hbi0+
Z3B1X29mZnNldCk7Cj4+PiDCoMKgwqDCoMKgIGRybV9wcmludGYocCwgIsKgwqDCoCBzaXplOiAl
bGx1XG4iLCBtYW4tPnNpemUpOwo+Pj4gwqDCoMKgwqDCoCBkcm1fcHJpbnRmKHAsICLCoMKgwqAg
YXZhaWxhYmxlX2NhY2hpbmc6IDB4JTA4WFxuIiwgCj4+PiBtYW4tPmF2YWlsYWJsZV9jYWNoaW5n
KTsKPj4+IMKgwqDCoMKgwqAgZHJtX3ByaW50ZihwLCAiwqDCoMKgIGRlZmF1bHRfY2FjaGluZzog
MHglMDhYXG4iLCAKPj4+IG1hbi0+ZGVmYXVsdF9jYWNoaW5nKTsKPj4+IEBAIC0zNDUsMTIgKzM0
NCw2IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2hhbmRsZV9tb3ZlX21lbShzdHJ1Y3QgCj4+PiB0dG1f
YnVmZmVyX29iamVjdCAqYm8sCj4+PiDCoCBtb3ZlZDoKPj4+IMKgwqDCoMKgwqAgYm8tPmV2aWN0
ZWQgPSBmYWxzZTsKPj4+IMKgIC3CoMKgwqAgaWYgKGJvLT5tZW0ubW1fbm9kZSkKPj4+IC3CoMKg
wqDCoMKgwqDCoCBiby0+b2Zmc2V0ID0gKGJvLT5tZW0uc3RhcnQgPDwgUEFHRV9TSElGVCkgKwo+
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmRldi0+bWFuW2JvLT5tZW0ubWVtX3R5cGVdLmdw
dV9vZmZzZXQ7Cj4+PiAtwqDCoMKgIGVsc2UKPj4+IC3CoMKgwqDCoMKgwqDCoCBiby0+b2Zmc2V0
ID0gMDsKPj4+IC0KPj4gQWZ0ZXIgbW92aW5nIHRoaXMgaW50byB1c2VycywgdGhlIGVsc2UgYnJh
bmNoIGhhcyBiZWVuIGxvc3QuIElzCj4+ICdiby0+bWVtLm1tX25vZGUnIGFsd2F5cyB0cnVlPwo+
Cj4gQXQgbGVhc3QgZm9yIHRoZSBhbWRncHUgYW5kIHJhZGVvbiB1c2UgY2FzZXMsIHllcy4KPgo+
IEJ1dCB0aGF0IGlzIGEgcmF0aGVyIGdvb2QgcXVlc3Rpb24gSSBtZWFuIGZvciBpdCBpcyBpbGxl
Z2FsIHRvIGdldCB0aGUgCj4gR1BVIEJPIGFkZHJlc3MgaWYgaXQgaXMgaW5hY2Nlc3NpYmxlIChl
LmcuIGluIHRoZSBzeXN0ZW0gZG9tYWluKS4KPgo+IENvdWxkIGJlIHRoYXQgc29tZSBkcml2ZXIg
cmVsaWVkIG9uIHRoZSBiZWhhdmlvciB0byBnZXQgMCBmb3IgdGhlIAo+IHN5c3RlbSBkb21haW4g
aGVyZS4KCkkgd29uZGVyIGhvdyB0byB2ZXJpZnkgdGhhdCA/CgpJZiBJIHVuZGVyc3RhbmQgY29y
cmVjdGx5OgoKMSBxeGwgdXNlcyBiby0+b2Zmc2V0IG9ubHkgaW4gcXhsX2JvX3BoeXNpY2FsX2Fk
ZHJlc3MoKSB3aGljaCBpcyBub3QgaW7CoCAKc3lzdGVtIGRvbWFpbi4KCjIgdW5mb3J0dW5hdGVs
eSBJIGNhbid0IHNheSB0aGUgc2FtZSBmb3IgYm9jaHMgYnV0IGl0IHdvcmtzIHdpdGggdGhpcyAK
cGF0Y2ggc2VyaWVzIHNvIEkgdGhpbmsgYm9jaHMgaXMgZmluZSBhcyB3ZWxsLgoKMyB2bXdnZngg
dXNlcyBiby0+b2Zmc2V0IG9ubHkgd2hlbiBiby0+bWVtLm1lbV90eXBlID09IFRUTV9QTF9WUkFN
IHNvIAp2bXdnZnggc2hvdWxkIGJlIGZpbmUuCgo0IGFtZGdwdSBhbmQgcmFkZW9uIHJ1bnMgd2l0
aCAnYm8tPm1lbS5tbV9ub2RlJyBhbHdheXMgdHJ1ZQoKSSBhbSBub3Qgc3VyZSBhYm91dMKgIG5v
dXZlYXUgYXMgYm8tPm9mZnNldCBpcyBiZWluZyB1c2VkIGluIG1hbnkgcGxhY2VzLgoKSSBjb3Vs
ZCBwcm9iYWJseSBtaXJyb3IgdGhlIHJlbW92ZWQgbG9naWMgdG8gbm91dmVhdSBhcwoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyAKYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKaW5kZXggZjgwMTVlMDMxOGQ3Li41YTZhMmFmOTEz
MTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKQEAgLTEzMTcsNiArMTMxNywx
MCBAQCBub3V2ZWF1X2JvX21vdmVfbnRmeShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgCipibywg
Ym9vbCBldmljdCwKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsaXN0X2Zvcl9lYWNo
X2VudHJ5KHZtYSwgJm52Ym8tPnZtYV9saXN0LCBoZWFkKSB7CiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5vdXZlYXVfdm1hX21hcCh2bWEsIG1lbSk7CiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpZiAoYm8tPm1lbS5tbV9ub2RlKQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbnZiby0+b2Zmc2V0ID0gKG5ld19yZWctPnN0YXJ0IDw8IFBBR0VfU0hJ
RlQpOworwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbHNlCivCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBudmJvLT5vZmZzZXQgPSAwOwogwqDCoMKgwqDC
oMKgwqAgfSBlbHNlIHsKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsaXN0X2Zvcl9l
YWNoX2VudHJ5KHZtYSwgJm52Ym8tPnZtYV9saXN0LCBoZWFkKSB7CiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFdBUk5fT04odHRtX2JvX3dhaXQoYm8sIGZh
bHNlLCBmYWxzZSkpOwoKUmVnYXJkcywKCk5pcm1veQoKCj4KPiBSZWdhcmRzLAo+IENocmlzdGlh
bi4KPgo+Pgo+PiBCZXN0IHJlZ2FyZHMKPj4gVGhvbWFzCj4+Cj4+PiDCoMKgwqDCoMKgIGN0eC0+
Ynl0ZXNfbW92ZWQgKz0gYm8tPm51bV9wYWdlcyA8PCBQQUdFX1NISUZUOwo+Pj4gwqDCoMKgwqDC
oCByZXR1cm4gMDsKPj4+IMKgIGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2Fw
aS5oIAo+Pj4gYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oCj4+PiBpbmRleCBiOWJjMWIw
MDE0MmUuLmQ2ZjM5ZWU1YmY1ZCAxMDA2NDQKPj4+IC0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1f
Ym9fYXBpLmgKPj4+ICsrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKPj4+IEBAIC0y
MTMsOCArMjEzLDYgQEAgc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0IHsKPj4+IMKgwqDCoMKgwqDC
oCAqIGVpdGhlciBvZiB0aGVzZSBsb2NrcyBoZWxkLgo+Pj4gwqDCoMKgwqDCoMKgICovCj4+PiDC
oCAtwqDCoMKgIHVpbnQ2NF90IG9mZnNldDsgLyogR1BVIGFkZHJlc3Mgc3BhY2UgaXMgaW5kZXBl
bmRlbnQgb2YgQ1BVIAo+Pj4gd29yZCBzaXplICovCj4+PiAtCj4+PiDCoMKgwqDCoMKgIHN0cnVj
dCBzZ190YWJsZSAqc2c7Cj4+PiDCoCB9Owo+Pj4gwqAgZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
L3R0bS90dG1fYm9fZHJpdmVyLmggCj4+PiBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVy
LmgKPj4+IGluZGV4IGM5ZTBmZDA5ZjRiMi4uYzhjZTZjMTgxYWJlIDEwMDY0NAo+Pj4gLS0tIGEv
aW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAo+Pj4gKysrIGIvaW5jbHVkZS9kcm0vdHRt
L3R0bV9ib19kcml2ZXIuaAo+Pj4gQEAgLTE3Nyw3ICsxNzcsNiBAQCBzdHJ1Y3QgdHRtX21lbV90
eXBlX21hbmFnZXIgewo+Pj4gwqDCoMKgwqDCoCBib29sIGhhc190eXBlOwo+Pj4gwqDCoMKgwqDC
oCBib29sIHVzZV90eXBlOwo+Pj4gwqDCoMKgwqDCoCB1aW50MzJfdCBmbGFnczsKPj4+IC3CoMKg
wqAgdWludDY0X3QgZ3B1X29mZnNldDsgLyogR1BVIGFkZHJlc3Mgc3BhY2UgaXMgaW5kZXBlbmRl
bnQgb2YgQ1BVIAo+Pj4gd29yZCBzaXplICovCj4+PiDCoMKgwqDCoMKgIHVpbnQ2NF90IHNpemU7
Cj4+PiDCoMKgwqDCoMKgIHVpbnQzMl90IGF2YWlsYWJsZV9jYWNoaW5nOwo+Pj4gwqDCoMKgwqDC
oCB1aW50MzJfdCBkZWZhdWx0X2NhY2hpbmc7Cj4+Pgo+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
