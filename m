Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E182B6D85
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 19:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E475C89DB7;
	Tue, 17 Nov 2020 18:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8346D89D81;
 Tue, 17 Nov 2020 18:38:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRsm1mBSinTH28z6sz3IrqthtthJ6IaM07Uuq2gxCnrr6oKFHhnkYM/R7pb76k2zQGYG5vBUqj0faQfjbjBVN0cuIjV/kUN2kPLCasr9PRMkp4oCYR5m6AzeI10I6Fy5AwpqJtR41scJ2JuEq/SX2iYGbFNa8JckEQ8Ap2lQcdzoD5lbkaZOntuQbrBMxcUQ1SLiCbH9obiCXwCF/GVC6vW285VH0z+uzo8MGuvEFY+Y9MokuCNXkbZJebN9N7XLkhvoeU6w2fFNJNNaqdX4PomjyVefW+3tqLyczU6hSqLkGmIm0dDgYBOfArsqlbR54wgYkNZZe/hmDNfEeKP2Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5iFXagutagjiEAI6sMPuugeFbJAX4jN4sO5xofl25o=;
 b=JrzTkuFRc1rHUhqlrBLRzNbpA2xZkLC19BlbA3Y7myOknaVd1/TY97YPLn5CXr1PoBpRZz2kaIe8/2RH7ojW+neaUKLLvUNuq//Cq1u+FR2tqNx0SrJVCU9tbf8LbvwVOCth4rz3NtF0rrjiefuDqrr9KfqE30sY56zL9/D+zFZ1M6k/8Lot4TVteSGyXsYXzZ2x6rp6Y2IkxLVehmGV3EpfOuleTcN9a35ZD8cUSI5ucFyXombuHBa9kqO604URbuL+lUJ3qphls/9t9P/c7H/Ff2oeEAHxKp6ItYgHYui2uSUxYR7Zxfc5p6aITp7aOSU9L9adoUGz+ntUFU567A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5iFXagutagjiEAI6sMPuugeFbJAX4jN4sO5xofl25o=;
 b=Lyik2U1XDifxbTuOuSbpGCM4tGS6qPx1EP6coDDESAhxioSBekB/d1DFIbDcuGNf1pDTNrn8elkNbryF7X2CB9SiufFp7FslbWYLYp2owz4Z0Dyfhp2HjPdJoPvpCnqua12SYKhoWTk3s3OdWEktaLUZ3EQsVeYpnRxSSfiKpYI=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB3212.namprd12.prod.outlook.com (2603:10b6:5:186::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.25; Tue, 17 Nov 2020 18:38:16 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%7]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 18:38:16 +0000
Subject: Re: [PATCH v2 8/8] drm/amdgpu: Prevent any job recoveries after
 device is unplugged.
To: Daniel Vetter <daniel@ffwll.ch>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-9-git-send-email-andrey.grodzovsky@amd.com>
 <20200622095345.GF20149@phenom.ffwll.local>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <24dd3691-5599-459c-2e5d-a8f2e504ec66@amd.com>
Date: Tue, 17 Nov 2020 13:38:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20200622095345.GF20149@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: CH2PR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:610:4e::26) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.0.72] (165.204.55.251) by
 CH2PR02CA0016.namprd02.prod.outlook.com (2603:10b6:610:4e::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.25 via Frontend Transport; Tue, 17 Nov 2020 18:38:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ed71400c-42b7-45c3-6d71-08d88b27f24e
X-MS-TrafficTypeDiagnostic: DM6PR12MB3212:
X-Microsoft-Antispam-PRVS: <DM6PR12MB32127FA09C8C8909F77F1B61EAE20@DM6PR12MB3212.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o7zb1ZYOQZMAnqZAZAax4CRgASyoEwfhzBmdhzHDACQEnh85ryRapkVmy1JEzWYXfYZj/S9eB77PDmbAvphzfs7KyHwCuM68vgCEo5zBTRPtIqSjQRxIFNo5BJLzs47gUEc0Bj8Qda2w1MLxArjfUpBluP9TeLbSv2qBtB6oOX3nLYUUXF9T24v8DPGFnNHsP6y3cdbcScvtWku8FCMFe5/Hm8qSm0GtA4DgRUcXfS+5v0wlrdTP0WErTPOXmq5z8O5BINT0a1+1KH7q4mEtwJAG1hsl2KD0LAP8J8qaruk/h7UY6Bg3VCfXPIZOVsMi+LiGrVnC9OaeMAALwpCXJ1tceW2uGwcGPFiYY/aJZgqhHT4xanBbX8esi9qYd4rW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(66946007)(36756003)(66556008)(66476007)(956004)(2906002)(83380400001)(6486002)(316002)(16576012)(31696002)(86362001)(186003)(31686004)(2616005)(8936002)(8676002)(478600001)(52116002)(26005)(53546011)(16526019)(6916009)(4326008)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: bpFt+atkwKJqIl4l7n8+CG8/d1PT8og3pXswSUyY7QFuX6wf2hXJpqEh34s3vaDHJdm2oQsVzFDxFv7Y1GMzCI5WrKyVQQzTJeMQO6sPhE4q0J/9Zu0H13i3O9D1MBkRDAay/Yc1kWeHMiAkraeF30RH+e5hK/z9hmhweW1hHCE//3SO/FmxUhyJE9YihJBAkp4gYE4mRGraY2NWdVHc3l1PBmoRjTyzhjB0s5I0CbwMVSZqGH9LA/gbod5aYd6mlotaT595yC103NjLDfgEBh1GwCiXy7a8iCHKti9Zt9ZQdgpOCnUeqbVnwcId30aHqaP12YUxyWdLpqq03wWTQ61aSIjUlKMt7K1OfKSZgmgtz3T/7ysveI756zcnLaY56zA5yCcYLmSLxlQcRnBI77EHKCpDvSwGrgxz1JMwGNxwv8uN/3PNAbOYl0DtcvVTOvSBBcgYgJqtOa1Jk0MP8385qckdXV5HUbWaS2A1uKapADLFK76MwYmTxC5vlJfbE4aCRwSRpi89I1b6lXOQnT+d3wJY37A+tA8aAjnfYDrJ5+41dxNNv2OiCSE6JS0UAr+MuzzKuFlXfKXDIZg5N7BoQKkqQ6uwDajgGRZ2cKngYjCsQITUvtt9zUdC6XEHfaJSSCfqdKPOcGJjduhywg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed71400c-42b7-45c3-6d71-08d88b27f24e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 18:38:16.6798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OlxE33q/M/7evJXYDh8hJWFgv5+Z6Iscg6erxqT0mgHUp4LjosLA98yonCLTYJyBqrEDMZzFSqqiUfyNy6EHSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3212
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

Ck9uIDYvMjIvMjAgNTo1MyBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBTdW4sIEp1biAy
MSwgMjAyMCBhdCAwMjowMzowOEFNIC0wNDAwLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90ZToKPj4g
Tm8gcG9pbnQgdG8gdHJ5IHJlY292ZXJ5IGlmIGRldmljZSBpcyBnb25lLCBqdXN0IG1lc3NlcyB1
cCB0aGluZ3MuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXku
Z3JvZHpvdnNreUBhbWQuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZHJ2LmMgfCAxNiArKysrKysrKysrKysrKysrCj4+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jIHwgIDggKysrKysrKysKPj4gICAyIGZpbGVzIGNoYW5n
ZWQsIDI0IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kcnYuYwo+PiBpbmRleCA2OTMyZDc1Li41ZDZkM2Q5IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4+IEBAIC0xMTI5LDEyICsxMTI5LDI4IEBAIHN0YXRp
YyBpbnQgYW1kZ3B1X3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKPj4gICAJcmV0dXJu
IHJldDsKPj4gICB9Cj4+ICAgCj4+ICtzdGF0aWMgdm9pZCBhbWRncHVfY2FuY2VsX2FsbF90ZHIo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4+ICt7Cj4+ICsJaW50IGk7Cj4+ICsKPj4gKwlm
b3IgKGkgPSAwOyBpIDwgQU1ER1BVX01BWF9SSU5HUzsgKytpKSB7Cj4+ICsJCXN0cnVjdCBhbWRn
cHVfcmluZyAqcmluZyA9IGFkZXYtPnJpbmdzW2ldOwo+PiArCj4+ICsJCWlmICghcmluZyB8fCAh
cmluZy0+c2NoZWQudGhyZWFkKQo+PiArCQkJY29udGludWU7Cj4+ICsKPj4gKwkJY2FuY2VsX2Rl
bGF5ZWRfd29ya19zeW5jKCZyaW5nLT5zY2hlZC53b3JrX3Rkcik7Cj4+ICsJfQo+PiArfQo+IEkg
dGhpbmsgdGhpcyBpcyBhIGZ1bmN0aW9uIHRoYXQncyBzdXBwb3NlZCB0byBiZSBpbiBkcm0vc2No
ZWR1bGVyLCBub3QKPiBoZXJlLiBNaWdodCBhbHNvIGp1c3QgYmUgeW91ciBjbGVhbnVwIGNvZGUg
YmVpbmcgb3JkZXJlZCB3cm9uZ2x5LCBvciB5b3VyCj4gc3BsaXQgaW4gb25lIG9mIHRoZSBlYXJs
aWVyIHBhdGNoZXMgbm90IGRvbmUgcXVpdGUgcmlnaHQuCj4gLURhbmllbAoKClRoaXMgZnVuY3Rp
b24gaXRlcmF0ZXMgYWNyb3NzIGFsbCB0aGUgc2NoZWR1bGVyc8KgIHBlciBhbWRncHUgZGV2aWNl
IGFuZCBhY2Nlc3NlcwphbWRncHUgc3BlY2lmaWMgc3RydWN0dXJlcyAsIGRybS9zY2hlZHVsZXIg
ZGVhbHMgd2l0aCBzaW5nbGUgc2NoZWR1bGVyIGF0IG1vc3QKc28gbG9va3MgdG8gbWUgbGlrZSB0
aGlzIGlzIHRoZSByaWdodCBwbGFjZSBmb3IgdGhpcyBmdW5jdGlvbgoKQW5kcmV5CgoKPgo+PiAr
Cj4+ICAgc3RhdGljIHZvaWQKPj4gICBhbWRncHVfcGNpX3JlbW92ZShzdHJ1Y3QgcGNpX2RldiAq
cGRldikKPj4gICB7Cj4+ICAgCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBwY2lfZ2V0X2RydmRh
dGEocGRldik7Cj4+ICsJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBkZXYtPmRldl9wcml2
YXRlOwo+PiAgIAo+PiAgIAlkcm1fZGV2X3VucGx1ZyhkZXYpOwo+PiArCWFtZGdwdV9jYW5jZWxf
YWxsX3RkcihhZGV2KTsKPj4gICAJdHRtX2JvX3VubWFwX3ZpcnR1YWxfYWRkcmVzc19zcGFjZSgm
YWRldi0+bW1hbi5iZGV2KTsKPj4gICAJYW1kZ3B1X2RyaXZlcl91bmxvYWRfa21zKGRldik7Cj4+
ICAgCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9i
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMKPj4gaW5kZXggNDcy
MDcxOC4uODdmZjBjMCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2pvYi5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9q
b2IuYwo+PiBAQCAtMjgsNiArMjgsOCBAQAo+PiAgICNpbmNsdWRlICJhbWRncHUuaCIKPj4gICAj
aW5jbHVkZSAiYW1kZ3B1X3RyYWNlLmgiCj4+ICAgCj4+ICsjaW5jbHVkZSA8ZHJtL2RybV9kcnYu
aD4KPj4gKwo+PiAgIHN0YXRpYyB2b2lkIGFtZGdwdV9qb2JfdGltZWRvdXQoc3RydWN0IGRybV9z
Y2hlZF9qb2IgKnNfam9iKQo+PiAgIHsKPj4gICAJc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nID0g
dG9fYW1kZ3B1X3Jpbmcoc19qb2ItPnNjaGVkKTsKPj4gQEAgLTM3LDYgKzM5LDEyIEBAIHN0YXRp
YyB2b2lkIGFtZGdwdV9qb2JfdGltZWRvdXQoc3RydWN0IGRybV9zY2hlZF9qb2IgKnNfam9iKQo+
PiAgIAo+PiAgIAltZW1zZXQoJnRpLCAwLCBzaXplb2Yoc3RydWN0IGFtZGdwdV90YXNrX2luZm8p
KTsKPj4gICAKPj4gKwlpZiAoZHJtX2Rldl9pc191bnBsdWdnZWQoYWRldi0+ZGRldikpIHsKPj4g
KwkJRFJNX0lORk8oInJpbmcgJXMgdGltZW91dCwgYnV0IGRldmljZSB1bnBsdWdnZWQsIHNraXBw
aW5nLlxuIiwKPj4gKwkJCQkJICBzX2pvYi0+c2NoZWQtPm5hbWUpOwo+PiArCQlyZXR1cm47Cj4+
ICsJfQo+PiArCj4+ICAgCWlmIChhbWRncHVfcmluZ19zb2Z0X3JlY292ZXJ5KHJpbmcsIGpvYi0+
dm1pZCwgc19qb2ItPnNfZmVuY2UtPnBhcmVudCkpIHsKPj4gICAJCURSTV9FUlJPUigicmluZyAl
cyB0aW1lb3V0LCBidXQgc29mdCByZWNvdmVyZWRcbiIsCj4+ICAgCQkJICBzX2pvYi0+c2NoZWQt
Pm5hbWUpOwo+PiAtLSAKPj4gMi43LjQKPj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
