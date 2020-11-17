Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E41942B6E51
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 20:18:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9136E060;
	Tue, 17 Nov 2020 19:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B9F6E059;
 Tue, 17 Nov 2020 19:18:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKzA99D89UhNCAlkdxcC0A1QKSNYkHcdPgjL5YVhZV8JpY509vz6m3og0qaUv/OsKeBTy/glyEKjSAhUcM2RjZMuz5YtlGAXI9anDqG+Qkj5rpfc4vHp+eZ5euDvimTA9QKLJJA+eRbhR1/P//l5amEnWM5HkX+OglPUn7kaAK/eQZnAVQpnS11vECWdx6FtyJnv3MwJEsHKMJ5UWgWC+n/ByvD2UOCLxd3mYPioa5Trr4/a5n8m1KSVrSHTSRy7Lzw2v+7G8YVWRqtT0EYLxCKfaPMa1cvdsuThAH0dhL8xnDx2O4fBp8GTh1ZWnWdD3OtSDJScBAgoywEwo8YUdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yx3oRmIIULtFWvnY6WzfyiO19D1p6M9L8n1bgWGDfXw=;
 b=B22/M+hEWeT/rEBKiYclye/+mZ6T77VLb/MIFOEnmBE2ziVkqP8ZtufjfGoAhTUvpQaWGJVqHYcV7lymwB4vsvfIl9OGl3m9gTMGapJPVLMnTdB8B0DD22tSImxtpqqAOJ8HLBQC/LukujJRZ9w10oSXv+pGfel/diEpnPAVrtQgqeNEwLGJVcsHWrWErmW6ckaWcXrMoeFCe9ZS7ZvKSWnu216p/mBpri+gaMw+s7KxyAsSiGwr4AioRm++MwgYJNFqOrhnKeqpxU78E0BK9u6bHdaemjsk2TI1Drb6YOFSXItN6ICpeYSn4OzzdDtFXn+1v7jFmsVZaj9lgL2G/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yx3oRmIIULtFWvnY6WzfyiO19D1p6M9L8n1bgWGDfXw=;
 b=l3wR8mIrz9HTqY6zHSTe/iJUEoRxsvF/+XV/6TxbjNTGVzhs3dAtQaYRemdSE0vtCFIyqqfEoHfHfc87qzik1eukKP9hQaa09qIVh20pr+vreowu2lBEf8SwpZT6QU1JOBnsusE6OP0tRhlg8NkTq39nlTl7lziJocQWrI2Lpec=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM5PR12MB2487.namprd12.prod.outlook.com (2603:10b6:4:af::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.28; Tue, 17 Nov 2020 19:18:51 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%7]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 19:18:51 +0000
Subject: Re: [PATCH v2 8/8] drm/amdgpu: Prevent any job recoveries after
 device is unplugged.
To: Daniel Vetter <daniel@ffwll.ch>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-9-git-send-email-andrey.grodzovsky@amd.com>
 <20200622095345.GF20149@phenom.ffwll.local>
 <24dd3691-5599-459c-2e5d-a8f2e504ec66@amd.com>
 <20201117185255.GP401619@phenom.ffwll.local>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <b827fa7a-d89e-d138-d275-60a9f15c128a@amd.com>
Date: Tue, 17 Nov 2020 14:18:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20201117185255.GP401619@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: CH2PR20CA0016.namprd20.prod.outlook.com
 (2603:10b6:610:58::26) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.0.72] (165.204.55.251) by
 CH2PR20CA0016.namprd20.prod.outlook.com (2603:10b6:610:58::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 17 Nov 2020 19:18:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 45b9eecf-fb2b-440a-db46-08d88b2d9e01
X-MS-TrafficTypeDiagnostic: DM5PR12MB2487:
X-Microsoft-Antispam-PRVS: <DM5PR12MB24877E2A318AB8759272D957EAE20@DM5PR12MB2487.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2smwlaz32yDNQjdvB1gqY0UMQ6FEUX4EAmcOIWeoVZYMqP8K6ph3kb3LA8ftmmKI5RIYnfphSir7oKfHLLH6wxHfhn9zcAYPRQu5J5I/mxy2gOd04mF2Vi0/vO3D4VUTzljvKw0ts+aXDp63EpGNElJPUszeHAI47STSRolsxISwIfScsHjOEg5wCLflSK3svtvRVbQXReT+8GYdLDI/Je+4NhpDeB3rhM8oa1G3pGnS+RvJNcN0LVvmz8PQLZBrnfYzF5RL5ILTFgGeOcMgpbCY+abBVNIucHc1LI3xV0EzSi8gEJoSBnd+jUuIhPELsnkDYjq+vTN2/Myt+NSDbRFvCRbukRYYBaECWP163KScdZFV17qd0A2mr+d4Xsa5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(53546011)(16526019)(186003)(26005)(8936002)(5660300002)(36756003)(956004)(86362001)(2616005)(66946007)(66556008)(31686004)(66476007)(6916009)(478600001)(31696002)(16576012)(6486002)(8676002)(52116002)(83380400001)(4326008)(2906002)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: O8w80fSeif/RbQycGou2gC5UEXco3iUWtKFwjSznCmRqXVnVkTPXdqt7Bk3i0RaW6eX1mhjBS7rDMVbNAERPMr5s1YGK+ounVKNAGOf83A12ASL3kZNh8qXqjBrHl8bipJNPZ6zFF+ya7JnoBvuqxYBe0MlL8JTvwDXxK3cmofQOYqLIIfy8Ii03s/DE1FlpttJwHiMFqLXSpPn8AlfqD7qIeLSyJkJf5p5MYPD3hlVN13jLa6KMAWtBivwfo/SkckJ8YWWdfEmDjEiYTjmCweRYTYqBp3Vnz2JRt5p4BqeRKh3AdWTEQ0Dxzl3Svsrd+6yODUpIISEIejAIuO6IWjfd5ppaCv1mDhfRS8xXj4VJF61CJq1X7wIHVFJrY0lcW+pH+071xawlGCLlI5tfgQD9YccbI63qHcBw23Ks5+AXzQqJUMxkDrdhjXF0/HQb31pspvF9EURcovUwVMmSdltDUILWR0q9Kh9fY5swzZjdyUm2ytNUTB0Pca/tqjyrtiS0WtsaC4csUKLv2tz9r91rrcBftNZP4LqMARopO+j5ZR5S29IbM300fqBEp4qxVNL+LjmIswet9Zhtqto5doXdfB1aeaRitmlliaDHHW2GArbDZhtlksoli7PrCfd9CAB0MudPzhlUABXp67PBEQCFhrRBenqkgn9/nraCuSt0+kDYjqoxeaU3Ws9BEL0S/olmmWyw7iT5hO9Ku9Oce0uGiiySjAFF4Ye5RBJfzESDIZiEUMwmXYikTZ1LBonhpE11OzpCRzODbHVnngSSK1mNp3SJN5xEHJuhrWaEwNt5yfNVAEWZimEPN5PiJHVXm/hf+RNg5MXQnMuBsJBRWyw2fXnE9RYZjBRZqdc7Y5agnEQM+JlYtjJAGSi8NGSAZp5ZQPxLrL5r/VAmoGupNg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b9eecf-fb2b-440a-db46-08d88b2d9e01
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 19:18:51.5846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RrdNpghZt2HzSFiOlfhOx1jYojHwpLrojjT+qYDK1NbTLGDhQjxNsEWkM3VaPzk7PdbihLADUqJdUBhLFPkJkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2487
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDExLzE3LzIwIDE6NTIgUE0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gVHVlLCBOb3Yg
MTcsIDIwMjAgYXQgMDE6Mzg6MTRQTSAtMDUwMCwgQW5kcmV5IEdyb2R6b3Zza3kgd3JvdGU6Cj4+
IE9uIDYvMjIvMjAgNTo1MyBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4+IE9uIFN1biwgSnVu
IDIxLCAyMDIwIGF0IDAyOjAzOjA4QU0gLTA0MDAsIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+
Pj4+IE5vIHBvaW50IHRvIHRyeSByZWNvdmVyeSBpZiBkZXZpY2UgaXMgZ29uZSwganVzdCBtZXNz
ZXMgdXAgdGhpbmdzLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kg
PGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Cj4+Pj4gLS0tCj4+Pj4gICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgMTYgKysrKysrKysrKysrKysrKwo+Pj4+ICAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuYyB8ICA4ICsrKysrKysrCj4+
Pj4gICAgMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspCj4+Pj4KPj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4+Pj4gaW5kZXggNjkzMmQ3NS4uNWQ2ZDNk
OSAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2
LmMKPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPj4+
PiBAQCAtMTEyOSwxMiArMTEyOSwyOCBAQCBzdGF0aWMgaW50IGFtZGdwdV9wY2lfcHJvYmUoc3Ry
dWN0IHBjaV9kZXYgKnBkZXYsCj4+Pj4gICAgCXJldHVybiByZXQ7Cj4+Pj4gICAgfQo+Pj4+ICtz
dGF0aWMgdm9pZCBhbWRncHVfY2FuY2VsX2FsbF90ZHIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCj4+Pj4gK3sKPj4+PiArCWludCBpOwo+Pj4+ICsKPj4+PiArCWZvciAoaSA9IDA7IGkgPCBB
TURHUFVfTUFYX1JJTkdTOyArK2kpIHsKPj4+PiArCQlzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcg
PSBhZGV2LT5yaW5nc1tpXTsKPj4+PiArCj4+Pj4gKwkJaWYgKCFyaW5nIHx8ICFyaW5nLT5zY2hl
ZC50aHJlYWQpCj4+Pj4gKwkJCWNvbnRpbnVlOwo+Pj4+ICsKPj4+PiArCQljYW5jZWxfZGVsYXll
ZF93b3JrX3N5bmMoJnJpbmctPnNjaGVkLndvcmtfdGRyKTsKPj4+PiArCX0KPj4+PiArfQo+Pj4g
SSB0aGluayB0aGlzIGlzIGEgZnVuY3Rpb24gdGhhdCdzIHN1cHBvc2VkIHRvIGJlIGluIGRybS9z
Y2hlZHVsZXIsIG5vdAo+Pj4gaGVyZS4gTWlnaHQgYWxzbyBqdXN0IGJlIHlvdXIgY2xlYW51cCBj
b2RlIGJlaW5nIG9yZGVyZWQgd3JvbmdseSwgb3IgeW91cgo+Pj4gc3BsaXQgaW4gb25lIG9mIHRo
ZSBlYXJsaWVyIHBhdGNoZXMgbm90IGRvbmUgcXVpdGUgcmlnaHQuCj4+PiAtRGFuaWVsCj4+Cj4+
IFRoaXMgZnVuY3Rpb24gaXRlcmF0ZXMgYWNyb3NzIGFsbCB0aGUgc2NoZWR1bGVyc8KgIHBlciBh
bWRncHUgZGV2aWNlIGFuZCBhY2Nlc3Nlcwo+PiBhbWRncHUgc3BlY2lmaWMgc3RydWN0dXJlcyAs
IGRybS9zY2hlZHVsZXIgZGVhbHMgd2l0aCBzaW5nbGUgc2NoZWR1bGVyIGF0IG1vc3QKPj4gc28g
bG9va3MgdG8gbWUgbGlrZSB0aGlzIGlzIHRoZSByaWdodCBwbGFjZSBmb3IgdGhpcyBmdW5jdGlv
bgo+IEkgZ3Vlc3Mgd2UgY291bGQga2VlcCB0cmFjayBvZiBhbGwgc2NoZWR1bGVycyBzb21ld2hl
cmUgaW4gYSBsaXN0IGluCj4gc3RydWN0IGRybV9kZXZpY2UgYW5kIHdyYXAgdGhpcyB1cC4gVGhh
dCB3YXMga2luZGEgdGhlIGlkZWEuCj4KPiBNaW5pbWFsbHkgSSB0aGluayBhIHRpbnkgd3JhcHBl
ciB3aXRoIGRvY3MgZm9yIHRoZQo+IGNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygmc2NoZWQtPndv
cmtfdGRyKTsgd2hpY2ggZXhwbGFpbnMgd2hhdCB5b3UgbXVzdAo+IG9ic2VydmUgdG8gbWFrZSBz
dXJlIHRoZXJlJ3Mgbm8gcmFjZS4KCgpXaWxsIGRvCgoKPiBJJ20gbm90IGV4YWN0bHkgc3VyZSB0
aGVyZSdzIG5vCj4gZ3VhcmFudGVlIGhlcmUgd2Ugd29uJ3QgZ2V0IGEgbmV3IHRkciB3b3JrIGxh
dW5jaGVkIHJpZ2h0IGFmdGVyd2FyZHMgYXQKPiBsZWFzdCwgc28gdGhpcyBsb29rcyBhIGJpdCBs
aWtlIGEgaGFjay4KCgpOb3RlIHRoYXQgZm9yIGFueSBURFIgd29yayBoYXBwZW5pbmcgcG9zdCBh
bWRncHVfY2FuY2VsX2FsbF90ZHIgCmFtZGdwdV9qb2JfdGltZWRvdXQtPmRybV9kZXZfaXNfdW5w
bHVnZ2VkCndpbGwgcmV0dXJuIHRydWUgYW5kIHNvIGl0IHdpbGwgcmV0dXJuIGVhcmx5LiBUbyBt
YWtlIGl0IHdhdGVyIHByb29mIHRpZ2h0IAphZ2FpbnN0IHJhY2UKaSBjYW4gc3dpdGNoIGZyb20g
ZHJtX2Rldl9pc191bnBsdWdnZWQgdG8gZHJtX2Rldl9lbnRlci9leGl0CgpBbmRyZXkKCgo+IC1E
YW5pZWwKPgo+PiBBbmRyZXkKPj4KPj4KPj4+PiArCj4+Pj4gICAgc3RhdGljIHZvaWQKPj4+PiAg
ICBhbWRncHVfcGNpX3JlbW92ZShzdHJ1Y3QgcGNpX2RldiAqcGRldikKPj4+PiAgICB7Cj4+Pj4g
ICAgCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBwY2lfZ2V0X2RydmRhdGEocGRldik7Cj4+Pj4g
KwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGRldi0+ZGV2X3ByaXZhdGU7Cj4+Pj4gICAg
CWRybV9kZXZfdW5wbHVnKGRldik7Cj4+Pj4gKwlhbWRncHVfY2FuY2VsX2FsbF90ZHIoYWRldik7
Cj4+Pj4gICAgCXR0bV9ib191bm1hcF92aXJ0dWFsX2FkZHJlc3Nfc3BhY2UoJmFkZXYtPm1tYW4u
YmRldik7Cj4+Pj4gICAgCWFtZGdwdV9kcml2ZXJfdW5sb2FkX2ttcyhkZXYpOwo+Pj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMKPj4+PiBpbmRleCA0NzIwNzE4Li44N2Zm
MGMwIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9q
b2IuYwo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuYwo+
Pj4+IEBAIC0yOCw2ICsyOCw4IEBACj4+Pj4gICAgI2luY2x1ZGUgImFtZGdwdS5oIgo+Pj4+ICAg
ICNpbmNsdWRlICJhbWRncHVfdHJhY2UuaCIKPj4+PiArI2luY2x1ZGUgPGRybS9kcm1fZHJ2Lmg+
Cj4+Pj4gKwo+Pj4+ICAgIHN0YXRpYyB2b2lkIGFtZGdwdV9qb2JfdGltZWRvdXQoc3RydWN0IGRy
bV9zY2hlZF9qb2IgKnNfam9iKQo+Pj4+ICAgIHsKPj4+PiAgICAJc3RydWN0IGFtZGdwdV9yaW5n
ICpyaW5nID0gdG9fYW1kZ3B1X3Jpbmcoc19qb2ItPnNjaGVkKTsKPj4+PiBAQCAtMzcsNiArMzks
MTIgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2pvYl90aW1lZG91dChzdHJ1Y3QgZHJtX3NjaGVkX2pv
YiAqc19qb2IpCj4+Pj4gICAgCW1lbXNldCgmdGksIDAsIHNpemVvZihzdHJ1Y3QgYW1kZ3B1X3Rh
c2tfaW5mbykpOwo+Pj4+ICsJaWYgKGRybV9kZXZfaXNfdW5wbHVnZ2VkKGFkZXYtPmRkZXYpKSB7
Cj4+Pj4gKwkJRFJNX0lORk8oInJpbmcgJXMgdGltZW91dCwgYnV0IGRldmljZSB1bnBsdWdnZWQs
IHNraXBwaW5nLlxuIiwKPj4+PiArCQkJCQkgIHNfam9iLT5zY2hlZC0+bmFtZSk7Cj4+Pj4gKwkJ
cmV0dXJuOwo+Pj4+ICsJfQo+Pj4+ICsKPj4+PiAgICAJaWYgKGFtZGdwdV9yaW5nX3NvZnRfcmVj
b3ZlcnkocmluZywgam9iLT52bWlkLCBzX2pvYi0+c19mZW5jZS0+cGFyZW50KSkgewo+Pj4+ICAg
IAkJRFJNX0VSUk9SKCJyaW5nICVzIHRpbWVvdXQsIGJ1dCBzb2Z0IHJlY292ZXJlZFxuIiwKPj4+
PiAgICAJCQkgIHNfam9iLT5zY2hlZC0+bmFtZSk7Cj4+Pj4gLS0gCj4+Pj4gMi43LjQKPj4+Pgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
