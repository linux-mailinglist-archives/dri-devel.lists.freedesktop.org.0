Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D544F203E3B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 19:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E466E873;
	Mon, 22 Jun 2020 17:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36426E873;
 Mon, 22 Jun 2020 17:45:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJrswrMdUtgHn0URsTmfnAtWdpCE5EWX/0y8L5qIIzG36BuUQ6oaf04ZqHo7/e7FCpV9D5T1Ft2CuIeyBBv/cCFuuxwtjH924tirvgOvL6ZFOgjFZyZ8DYf4QLJ2XDfcWhW2/WvklDgywjhZd9lWAUeRlUe00wOCVSXIFnJ/US8GEaA0y5fHsTBgqsi9hm7X34i6OcbiQ7tWdznpdMxXsk/yqHfW3rJSc+lE8OUnEtKByDsUfW4b/QQPj/g7XdAqPWQKnQCrHS0wNy/ffL+GzPUBWzT+H5IpakCZ9xeqK3FAW7fZ59oVKfsVRTS7319UKpKJOL+fQbTiiARKjky1sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEmUkXL2fGWqvR6GRH7EPrFKTlzDwEQfvFPdvU6AsTA=;
 b=VyFXxLGK0WYpWhYgI2ltl4dia2U6Pxo9Sj4S1khjap2ZVhXf/bdk1GxLYkQNiZm2x6POC3LkjL3+OUbKZBHvKq0pjyPlP62vnVOtTx2dTpRuxGCpvD3/SarzKrdXUnWeRwG9jti10fL/4eqbKuCRau5LEqLI0dtj+NlVHx8mdaEzHjmxTu+BVpBNC/glLc3+7iQ5Z7poatqJYhS4ZTfGVs8oIu7bu4c9qMsEWOsGdOWk5L5BF1xFoQsZGyumszWveTT2MVKSL6xqP44Di8qdZHhfSfW6ynqApbidFK7QqJ8j7gP3WmDr4qRJzJI4WaTsE9iMcW96GH+tTdiLxwQEcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEmUkXL2fGWqvR6GRH7EPrFKTlzDwEQfvFPdvU6AsTA=;
 b=wGaX89tC3xj1ILtFJV8qNRI6zEQ4dv5l3ysUnWSBpbs+Qel7PchwhhH7Ubd5jndSvmPnluxndHc4wt9Et9gS8yniZ1WZMpGSVDfhY0b471PIlQHNAWdZclo+nK0ShLzP+mEGWg86/fqrJJzPvTAXRVcoaNVoaIdSczJhkJsR54o=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB4314.namprd12.prod.outlook.com (2603:10b6:5:211::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 17:45:39 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::a045:f8c0:8edb:1ef1]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::a045:f8c0:8edb:1ef1%9]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 17:45:39 +0000
Subject: Re: [PATCH v2 1/8] drm: Add dummy page per device or GEM object
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-2-git-send-email-andrey.grodzovsky@amd.com>
 <6809de08-2035-edda-ebd2-05e7f77a1068@gmail.com>
 <cda48298-1e0b-7cad-7979-6d5c2f99ef94@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <78fd1669-e39b-d407-b558-f9ac76e494e2@amd.com>
Date: Mon, 22 Jun 2020 19:45:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <cda48298-1e0b-7cad-7979-6d5c2f99ef94@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0119.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::24) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0119.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend
 Transport; Mon, 22 Jun 2020 17:45:38 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6eb0a08f-987d-4cdb-d4ca-08d816d413dc
X-MS-TrafficTypeDiagnostic: DM6PR12MB4314:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB431436A68BA58EFCDA0878ED83970@DM6PR12MB4314.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oTCT9vju/61nnG4ICuVVXTtQmoHBqdfu36xLmgY4Sk7koCBYJ5i1OoR2XW5bB+rNTLaRcVWxchp0+fjoOHU0yAfmcAoakG3vqjey4Fb7v/beSkFtR9FfQWbbHODgZI4+6zuIU2PmaN4yG047b73BW8LEiuwxDAYsVNkTGXG2BI6fl9CKpGFRHN/gtv2nFoiaXER2y0pMMuKA0sX8s2gcCXPh4u3lqF2KIalrVOd5lQWv2Y3pjTNatv48SeSHHXXIEhFillC/nymldOCbOd2NIp2mN6DqB2qa84NjrYlhr04EPTB3k5ombIosqZJTSRqEdJievv4FxW1Pu1cf7RFdzOYrCXMWfmGVGPWz1FZIaAnw4VeXHeiIALCiv4osJI6iHGdWU+wxlmNjF0Td3iJrHLwSy5bOhhiMChwejoLPORt04vrVgSAVuu8RRBac2jbXwhs+Lneh7uHyeaIOIPgKcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(6666004)(86362001)(8936002)(186003)(16526019)(4326008)(53546011)(478600001)(5660300002)(66556008)(66946007)(66476007)(52116002)(31696002)(66574015)(83380400001)(36756003)(2616005)(31686004)(316002)(8676002)(2906002)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 6kHYUdkqRf238eaU06WwqNvw2NwhQWf27PNQBMn6OLGYtWWrRbxZDrDLiqi/O4xiF5cLLYgZMyjn8IEQmFNNWBe3zefSzhczf7RrePb0pP1BPIqNY8K78CZglXOU91qN/g03J054h/iXMlEP+XOEgUvdkj3roD8JG8S2mVKwRJrZzur5dyVRLhc5y+7bhl6wnCV5tM0F2YNeEUAwU1srHZvGKW4zr53+7lCSVj/vlTcat3hoaDpfSUAdCxxrzlvqM7Gkj2sgWy2R1Gosj5Rz3sXvOzlhHEZtxqZ6KJfMW4LG7T6jpJZT8tF90ecaRfCTURqtyZQwgBHI8cYFrW7PV/ykjUsiQKS07x5QC1WhkKjf3nbjNi7DWU1mZv/K7913nAFs72wisgvSU8KfYfGY3Nd8sbuZNY6lcn52tntvMhnXFkwnqmZjSgGlAtt4EYOweDG1+l/6SRBxnrNmTZxXmDXcC2Jg7W/Ol/Cti3pgN+iaWsB4IwHwmfpqrIi8VBmPqPlypo57RIyeVhzgA0a6Ou42F06niWLQok/ci2pIw72icUge+D/jPanYfoKJ1Gkz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb0a08f-987d-4cdb-d4ca-08d816d413dc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 17:45:39.6406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oeiz+RlmK03MRqRTk41u15Joi8wUDkkJQvUZVy0OYd70pn2bTJ7giByyUEUCe6JA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4314
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjIuMDYuMjAgdW0gMTY6MzIgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPgo+IE9uIDYv
MjIvMjAgOToxOCBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gQW0gMjEuMDYuMjAgdW0g
MDg6MDMgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+IFdpbGwgYmUgdXNlZCB0byByZXJv
dXRlIENQVSBtYXBwZWQgQk8ncyBwYWdlIGZhdWx0cyBvbmNlCj4+PiBkZXZpY2UgaXMgcmVtb3Zl
ZC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6
b3Zza3lAYW1kLmNvbT4KPj4+IC0tLQo+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmPC
oCB8wqAgOCArKysrKysrKwo+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jIHwgMTAg
KysrKysrKysrKwo+Pj4gwqAgaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaMKgwqDCoMKgwqAgfMKgIDIg
KysKPj4+IMKgIGluY2x1ZGUvZHJtL2RybV9nZW0uaMKgwqDCoMKgwqDCoCB8wqAgMiArKwo+Pj4g
wqAgNCBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMK
Pj4+IGluZGV4IGM0YzcwNGUuLjY3YzA3NzAgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2ZpbGUuYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMKPj4+IEBA
IC0xODgsNiArMTg4LDEyIEBAIHN0cnVjdCBkcm1fZmlsZSAqZHJtX2ZpbGVfYWxsb2Moc3RydWN0
IAo+Pj4gZHJtX21pbm9yICptaW5vcikKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdv
dG8gb3V0X3ByaW1lX2Rlc3Ryb3k7Cj4+PiDCoMKgwqDCoMKgIH0KPj4+IMKgICvCoMKgwqAgZmls
ZS0+ZHVtbXlfcGFnZSA9IGFsbG9jX3BhZ2UoR0ZQX0tFUk5FTCB8IF9fR0ZQX1pFUk8pOwo+Pj4g
K8KgwqDCoCBpZiAoIWZpbGUtPmR1bW15X3BhZ2UpIHsKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXQg
PSAtRU5PTUVNOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gb3V0X3ByaW1lX2Rlc3Ryb3k7Cj4+
PiArwqDCoMKgIH0KPj4+ICsKPj4+IMKgwqDCoMKgwqAgcmV0dXJuIGZpbGU7Cj4+PiDCoCDCoCBv
dXRfcHJpbWVfZGVzdHJveToKPj4+IEBAIC0yODQsNiArMjkwLDggQEAgdm9pZCBkcm1fZmlsZV9m
cmVlKHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkKPj4+IMKgwqDCoMKgwqAgaWYgKGRldi0+ZHJpdmVy
LT5wb3N0Y2xvc2UpCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2LT5kcml2ZXItPnBvc3RjbG9z
ZShkZXYsIGZpbGUpOwo+Pj4gwqAgK8KgwqDCoCBfX2ZyZWVfcGFnZShmaWxlLT5kdW1teV9wYWdl
KTsKPj4+ICsKPj4+IMKgwqDCoMKgwqAgZHJtX3ByaW1lX2Rlc3Ryb3lfZmlsZV9wcml2YXRlKCZm
aWxlLT5wcmltZSk7Cj4+PiDCoCDCoMKgwqDCoMKgIFdBUk5fT04oIWxpc3RfZW1wdHkoJmZpbGUt
PmV2ZW50X2xpc3QpKTsKPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1l
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKPj4+IGluZGV4IDFkZTJjZGUuLmM0ODJl
OWMgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKPj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwo+Pj4gQEAgLTMzNSw2ICszMzUsMTMgQEAgaW50
IGRybV9nZW1fcHJpbWVfZmRfdG9faGFuZGxlKHN0cnVjdCAKPj4+IGRybV9kZXZpY2UgKmRldiwK
Pj4+IMKgIMKgwqDCoMKgwqAgcmV0ID0gZHJtX3ByaW1lX2FkZF9idWZfaGFuZGxlKCZmaWxlX3By
aXYtPnByaW1lLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX2J1ZiwgKmhhbmRs
ZSk7Cj4+PiArCj4+PiArwqDCoMKgIGlmICghcmV0KSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgb2Jq
LT5kdW1teV9wYWdlID0gYWxsb2NfcGFnZShHRlBfS0VSTkVMIHwgX19HRlBfWkVSTyk7Cj4+PiAr
wqDCoMKgwqDCoMKgwqAgaWYgKCFvYmotPmR1bW15X3BhZ2UpCj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXQgPSAtRU5PTUVNOwo+Pj4gK8KgwqDCoCB9Cj4+PiArCj4+Cj4+IFdoaWxlIHRo
ZSBwZXIgZmlsZSBjYXNlIHN0aWxsIGxvb2tzIGFjY2VwdGFibGUgdGhpcyBpcyBhIGNsZWFyIE5B
SyAKPj4gc2luY2UgaXQgd2lsbCBtYXNzaXZlbHkgaW5jcmVhc2UgdGhlIG1lbW9yeSBuZWVkZWQg
Zm9yIGEgcHJpbWUgCj4+IGV4cG9ydGVkIG9iamVjdC4KPj4KPj4gSSB0aGluayB0aGF0IHRoaXMg
aXMgcXVpdGUgb3ZlcmtpbGwgaW4gdGhlIGZpcnN0IHBsYWNlIGFuZCBmb3IgdGhlIAo+PiBob3Qg
dW5wbHVnIGNhc2Ugd2UgY2FuIGp1c3QgdXNlIHRoZSBnbG9iYWwgZHVtbXkgcGFnZSBhcyB3ZWxs
Lgo+Pgo+PiBDaHJpc3RpYW4uCj4KPgo+IEdsb2JhbCBkdW1teSBwYWdlIGlzIGdvb2QgZm9yIHJl
YWQgYWNjZXNzLCB3aGF0IGRvIHlvdSBkbyBvbiB3cml0ZSAKPiBhY2Nlc3MgPyBNeSBmaXJzdCBh
cHByb2FjaCB3YXMgaW5kZWVkIHRvIG1hcCBhdCBmaXJzdCBnbG9iYWwgZHVtbXkgCj4gcGFnZSBh
cyByZWFkIG9ubHkgYW5kIG1hcmsgdGhlIHZtYS0+dm1fZmxhZ3MgYXMgIVZNX1NIQVJFRCBhc3N1
bWluZyAKPiB0aGF0IHRoaXMgd291bGQgdHJpZ2dlciBDb3B5IE9uIFdyaXRlIGZsb3cgaW4gY29y
ZSBtbSAKPiAoaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuNy1yYzcvc291cmNl
L21tL21lbW9yeS5jI0wzOTc3KSAKPiBvbiB0aGUgbmV4dCBwYWdlIGZhdWx0IHRvIHNhbWUgYWRk
cmVzcyB0cmlnZ2VyZWQgYnkgYSB3cml0ZSBhY2Nlc3MgYnV0IAo+IHRoZW4gaSByZWFsaXplZCBh
IG5ldyBDT1cgcGFnZSB3aWxsIGJlIGFsbG9jYXRlZCBmb3IgZWFjaCBzdWNoIG1hcHBpbmcgCj4g
YW5kIHRoaXMgaXMgbXVjaCBtb3JlIHdhc3RlZnVsIHRoZW4gaGF2aW5nIGEgZGVkaWNhdGVkIHBh
Z2UgcGVyIEdFTSAKPiBvYmplY3QuIAoKWWVhaCwgYnV0IHRoaXMgaXMgb25seSBmb3IgYSB2ZXJ5
IHZlcnkgc21hbGwgY29ybmVyIGNhc2VzLiBXaGF0IHdlIG5lZWQgCnRvIHByZXZlbnQgaXMgaW5j
cmVhc2luZyB0aGUgbWVtb3J5IHVzYWdlIGR1cmluZyBub3JtYWwgb3BlcmF0aW9uIHRvIG11Y2gu
CgpVc2luZyBtZW1vcnkgZHVyaW5nIHRoZSB1bnBsdWcgaXMgY29tcGxldGVseSB1bnByb2JsZW1h
dGljIGJlY2F1c2Ugd2UgCmp1c3QgcmVsZWFzZWQgcXVpdGUgYSBidW5jaCBvZiBpdCBieSByZWxl
YXNpbmcgYWxsIHRob3NlIHN5c3RlbSBtZW1vcnkgCmJ1ZmZlcnMuCgpBbmQgSSdtIHByZXR0eSBz
dXJlIHRoYXQgQ09XZWQgcGFnZXMgYXJlIGNvcnJlY3RseSBhY2NvdW50ZWQgdG93YXJkcyB0aGUg
CnVzZWQgbWVtb3J5IG9mIGEgcHJvY2Vzcy4KClNvIEkgdGhpbmsgaWYgdGhhdCBhcHByb2FjaCB3
b3JrcyBhcyBpbnRlbmRlZCBhbmQgdGhlIENPVyBwYWdlcyBhcmUgCnJlbGVhc2VkIGFnYWluIG9u
IHVubWFwcGluZyBpdCB3b3VsZCBiZSB0aGUgcGVyZmVjdCBzb2x1dGlvbiB0byB0aGUgcHJvYmxl
bS4KCkRhbmllbCB3aGF0IGRvIHlvdSB0aGluaz8KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4gV2Ug
Y2FuIGluZGVlZCBvcHRpbWl6ZSBieSBhbGxvY2F0aW5nIHRoaXMgZHVtbXkgcGFnZSBvbiB0aGUg
Zmlyc3QgcGFnZSAKPiBmYXVsdCBhZnRlciBkZXZpY2UgZGlzY29ubmVjdCBpbnN0ZWFkIG9uIEdF
TSBvYmplY3QgY3JlYXRpb24uCj4KPiBBbmRyZXkKPgo+Cj4+Cj4+PiBtdXRleF91bmxvY2soJmZp
bGVfcHJpdi0+cHJpbWUubG9jayk7Cj4+PiDCoMKgwqDCoMKgIGlmIChyZXQpCj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgZ290byBmYWlsOwo+Pj4gQEAgLTEwMDYsNiArMTAxMyw5IEBAIHZvaWQgZHJt
X3ByaW1lX2dlbV9kZXN0cm95KHN0cnVjdCAKPj4+IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVj
dCBzZ190YWJsZSAqc2cpCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX2J1Zl91bm1hcF9hdHRh
Y2htZW50KGF0dGFjaCwgc2csIERNQV9CSURJUkVDVElPTkFMKTsKPj4+IMKgwqDCoMKgwqAgZG1h
X2J1ZiA9IGF0dGFjaC0+ZG1hYnVmOwo+Pj4gwqDCoMKgwqDCoCBkbWFfYnVmX2RldGFjaChhdHRh
Y2gtPmRtYWJ1ZiwgYXR0YWNoKTsKPj4+ICsKPj4+ICvCoMKgwqAgX19mcmVlX3BhZ2Uob2JqLT5k
dW1teV9wYWdlKTsKPj4+ICsKPj4+IMKgwqDCoMKgwqAgLyogcmVtb3ZlIHRoZSByZWZlcmVuY2Ug
Ki8KPj4+IMKgwqDCoMKgwqAgZG1hX2J1Zl9wdXQoZG1hX2J1Zik7Cj4+PiDCoCB9Cj4+PiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaCBiL2luY2x1ZGUvZHJtL2RybV9maWxlLmgK
Pj4+IGluZGV4IDE5ZGY4MDIuLjM0OWE2NTggMTAwNjQ0Cj4+PiAtLS0gYS9pbmNsdWRlL2RybS9k
cm1fZmlsZS5oCj4+PiArKysgYi9pbmNsdWRlL2RybS9kcm1fZmlsZS5oCj4+PiBAQCAtMzM1LDYg
KzMzNSw4IEBAIHN0cnVjdCBkcm1fZmlsZSB7Cj4+PiDCoMKgwqDCoMKgwqAgKi8KPj4+IMKgwqDC
oMKgwqAgc3RydWN0IGRybV9wcmltZV9maWxlX3ByaXZhdGUgcHJpbWU7Cj4+PiDCoCArwqDCoMKg
IHN0cnVjdCBwYWdlICpkdW1teV9wYWdlOwo+Pj4gKwo+Pj4gwqDCoMKgwqDCoCAvKiBwcml2YXRl
OiAqLwo+Pj4gwqAgI2lmIElTX0VOQUJMRUQoQ09ORklHX0RSTV9MRUdBQ1kpCj4+PiDCoMKgwqDC
oMKgIHVuc2lnbmVkIGxvbmcgbG9ja19jb3VudDsgLyogRFJJMSBsZWdhY3kgbG9jayBjb3VudCAq
Lwo+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9nZW0uaCBiL2luY2x1ZGUvZHJtL2Ry
bV9nZW0uaAo+Pj4gaW5kZXggMGIzNzUwNi4uNDc0NjBkMSAxMDA2NDQKPj4+IC0tLSBhL2luY2x1
ZGUvZHJtL2RybV9nZW0uaAo+Pj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2dlbS5oCj4+PiBAQCAt
MzEwLDYgKzMxMCw4IEBAIHN0cnVjdCBkcm1fZ2VtX29iamVjdCB7Cj4+PiDCoMKgwqDCoMKgwqAg
Kgo+Pj4gwqDCoMKgwqDCoMKgICovCj4+PiDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBkcm1fZ2Vt
X29iamVjdF9mdW5jcyAqZnVuY3M7Cj4+PiArCj4+PiArwqDCoMKgIHN0cnVjdCBwYWdlICpkdW1t
eV9wYWdlOwo+Pj4gwqAgfTsKPj4+IMKgIMKgIC8qKgo+PgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
