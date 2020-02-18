Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DFC162E68
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 19:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44546EA61;
	Tue, 18 Feb 2020 18:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306366EA61;
 Tue, 18 Feb 2020 18:23:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mex7WUHK2oHUL9FUtEZ9mR04RLW6wikU7Y33xQ92tvn1lSm+1Jj0Z6KzulfuRq/4TP9vGKhH1D5EtI17MwaQGNh2xptivNtARRgFuhkFLCykqZNNPKIjdm+eVPl0LleLJJhrPNLom3eltPmxtdxKjrBt2zhQxxLOikI8s0pDAzzBZ1VZGzEgHccHZ/anHpFO4akI/7l9cRxFdEwGxwd8wm70Fnwsmv1DyMoL06wVKJRfX05XdbDU6uh9OtaJsvr8zpL2tX5BSoX1yErRsjvGvyeJOUhUk93hueXmD8fhCo3Zx9zF7rm4xfP3xK5owhmQq3l75UhO/1DHPBmt+FF4NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuJjU/xji2N4O88pw3VjDwz3WsLotZn/ovRm6u312sU=;
 b=IMjWE+48Bpf+PJAWjPa9hkJbwFPnMZM3VlynMQeqa/JCIAGvUjKHmMPqaqLsz9YZptQHvt+EuV2iAD1z+kZZ15APxDfDSzxjEDTWElxE+SPMvvJBNyNOMXvGuIk+vVUBr+19NQp7WkqB7hYS3i6XuerunHVVMl5QRFCo9PcumiXtBUbmuEvtIkIHNtVPDUM2qGg0M1Il6ZaGyYUgEDkGZOwYItXYtb93EYQRtKD1XRoN+rHzIqsMmYmGwJ+EzyOTxRC91D1rGCYHpmha2/2caP0LBzqvUCgJ/4X55B+DAHTviRQT/Mb2Sen91AUmei97706D+zUx/sMXZDujJZ+95Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuJjU/xji2N4O88pw3VjDwz3WsLotZn/ovRm6u312sU=;
 b=1dyR0S8u7a9nMpfXJe9L6GiLY0yiIUAvFwSa1LfnMyPscMeKypjuUJxuzQR7UOHMAHxvLJ9Cx0zDFuC0PT36abWK4cwPJ7KdZAtmnwkdJ5Z3y6GGIbE+VDtBECZbywejQFUbX5FASXwWZfXm5xJuzM3VTRB9QJY4UjNILaFOjNI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1324.namprd12.prod.outlook.com (10.168.238.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Tue, 18 Feb 2020 18:23:12 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2729.032; Tue, 18 Feb
 2020 18:23:12 +0000
Subject: Re: [PATCH 8/8] drm/ttm: do not keep GPU dependent addresses
To: Thomas Zimmermann <tzimmermann@suse.de>, Nirmoy <nirmodas@amd.com>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200217150427.49994-1-nirmoy.das@amd.com>
 <20200217150427.49994-9-nirmoy.das@amd.com>
 <c3a20c1b-0520-1995-7445-9e3f3ea77394@suse.de>
 <9db59846-90b4-2b9a-8200-69297112693a@amd.com>
 <edc985f1-8856-4d1a-8960-efe4d21b960d@amd.com>
 <5b8db944-5a55-8161-6ab6-98490cfb0562@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f8534965-ea14-bbac-bd34-06b951766a7c@amd.com>
Date: Tue, 18 Feb 2020 19:23:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <5b8db944-5a55-8161-6ab6-98490cfb0562@suse.de>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0701CA0038.eurprd07.prod.outlook.com
 (2603:10a6:200:42::48) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0701CA0038.eurprd07.prod.outlook.com (2603:10a6:200:42::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.13 via Frontend
 Transport; Tue, 18 Feb 2020 18:23:09 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 16878b5b-347b-4130-f80a-08d7b49f9ce8
X-MS-TrafficTypeDiagnostic: DM5PR12MB1324:|DM5PR12MB1324:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1324EDA4E125BBBD491B8C2383110@DM5PR12MB1324.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 031763BCAF
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(199004)(189003)(31686004)(2906002)(52116002)(316002)(6666004)(31696002)(66574012)(53546011)(86362001)(966005)(6486002)(186003)(478600001)(16526019)(110136005)(8676002)(4326008)(2616005)(8936002)(66946007)(81166006)(5660300002)(81156014)(7416002)(66476007)(36756003)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1324;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zq21dKmE3kV7TUtkaGReY9epM4h30+I39GfkwD5AZaqCm4uPFFTveHVl84vkhdi6AWEMKC1QTdp4WFJ/rWtGznxMpOe5TeGupYtTQUiT5PQa4pezcN/GqSFVc9e6mPuXL6toxcaDC9466ueXReCehwAYO7Nw8ryhrNkEJOTuVgmUlNxO9y2LlZxAPWgqMH4dk6uH/x7vPUQa7CTAkWQ8Uaui6iyRgPWa12pOrUZdsae/q5Un7F7nQBHYuTpf3SHQDjFtTu7k4HM6XiqyiklzQAZT24rkBqUAw2WygYfEHSxqyw+Rf+RHYLE8wxj6wxq4W4wAU7Kys8/CkYPU7kgQMjSfLU9TYTlNzuz2+5KaVWmiCvFxZRJbTBo7J+UPqehLnD0s6j0UKIZLsmdq7bdHUVCFDbZb/2A/5gB0HXArbefH1q+fuksEdSMZyVPZ+WD/HmcAggIyihd2NNi52h7ZAmSMsRhEHGaUGB5BMMIdR/Uo4zDpBPU7hO/rXutloTFCfU/Oqbd56x824bzWhAdzZg==
X-MS-Exchange-AntiSpam-MessageData: vg5bRJA9crPnwMeM6G5h9J/du3gMVE2voi0qfal8W1qgxq6rh4SDH/LXarNGksBinru6UQbS/+h7dD2aupmYUlNEgxSKZvi/qacnEh4RLmWp/7KN/TePtUiQ9zWaiB8eC3FwRZiMq/O7jjhwYKPfohj8FUfksarzwibET1QrrgvP6LNID0Ta3U0kfMCvsdY+Wv+lpQgbE6lRXVO4B1F/TQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16878b5b-347b-4130-f80a-08d7b49f9ce8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2020 18:23:12.4216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2kA7iw9kk3J0uj78j8iGnjYnP5bzgToT45aSFnLuBdCrImbnl9o3Vf9fDE5EL+Gq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1324
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

QW0gMTguMDIuMjAgdW0gMTk6MTYgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBIaQo+Cj4g
QW0gMTguMDIuMjAgdW0gMTg6MTMgc2NocmllYiBOaXJtb3k6Cj4+IE9uIDIvMTgvMjAgMTo0NCBQ
TSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+IEFtIDE4LjAyLjIwIHVtIDEzOjQwIHNjaHJp
ZWIgVGhvbWFzIFppbW1lcm1hbm46Cj4+Pj4gSGkKPj4+Pgo+Pj4+IEFtIDE3LjAyLjIwIHVtIDE2
OjA0IHNjaHJpZWIgTmlybW95IERhczoKPj4+Pj4gR1BVIGFkZHJlc3MgaGFuZGxpbmcgaXMgZGV2
aWNlIHNwZWNpZmljIGFuZCBzaG91bGQgYmUgaGFuZGxlIGJ5IGl0cwo+Pj4+PiBkZXZpY2UKPj4+
Pj4gZHJpdmVyLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBOaXJtb3kgRGFzIDxuaXJtb3ku
ZGFzQGFtZC5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiAgwqAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym8uY8KgwqDCoCB8IDcgLS0tLS0tLQo+Pj4+PiAgwqAgaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19h
cGkuaMKgwqDCoCB8IDIgLS0KPj4+Pj4gIMKgIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVy
LmggfCAxIC0KPj4+Pj4gIMKgIDMgZmlsZXMgY2hhbmdlZCwgMTAgZGVsZXRpb25zKC0pCj4+Pj4+
Cj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+Pj4+IGIv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+Pj4+PiBpbmRleCAxNTFlZGZkOGRlNzcuLmQ1
ODg1Y2Q2MDlhMyAxMDA2NDQKPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8u
Ywo+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+Pj4+IEBAIC04NSw3
ICs4NSw2IEBAIHN0YXRpYyB2b2lkIHR0bV9tZW1fdHlwZV9kZWJ1ZyhzdHJ1Y3QKPj4+Pj4gdHRt
X2JvX2RldmljZSAqYmRldiwgc3RydWN0IGRybV9wcmludGVyICpwCj4+Pj4+ICDCoMKgwqDCoMKg
IGRybV9wcmludGYocCwgIsKgwqDCoCBoYXNfdHlwZTogJWRcbiIsIG1hbi0+aGFzX3R5cGUpOwo+
Pj4+PiAgwqDCoMKgwqDCoCBkcm1fcHJpbnRmKHAsICLCoMKgwqAgdXNlX3R5cGU6ICVkXG4iLCBt
YW4tPnVzZV90eXBlKTsKPj4+Pj4gIMKgwqDCoMKgwqAgZHJtX3ByaW50ZihwLCAiwqDCoMKgIGZs
YWdzOiAweCUwOFhcbiIsIG1hbi0+ZmxhZ3MpOwo+Pj4+PiAtwqDCoMKgIGRybV9wcmludGYocCwg
IsKgwqDCoCBncHVfb2Zmc2V0OiAweCUwOGxsWFxuIiwgbWFuLT5ncHVfb2Zmc2V0KTsKPj4+Pj4g
IMKgwqDCoMKgwqAgZHJtX3ByaW50ZihwLCAiwqDCoMKgIHNpemU6ICVsbHVcbiIsIG1hbi0+c2l6
ZSk7Cj4+Pj4+ICDCoMKgwqDCoMKgIGRybV9wcmludGYocCwgIsKgwqDCoCBhdmFpbGFibGVfY2Fj
aGluZzogMHglMDhYXG4iLAo+Pj4+PiBtYW4tPmF2YWlsYWJsZV9jYWNoaW5nKTsKPj4+Pj4gIMKg
wqDCoMKgwqAgZHJtX3ByaW50ZihwLCAiwqDCoMKgIGRlZmF1bHRfY2FjaGluZzogMHglMDhYXG4i
LAo+Pj4+PiBtYW4tPmRlZmF1bHRfY2FjaGluZyk7Cj4+Pj4+IEBAIC0zNDUsMTIgKzM0NCw2IEBA
IHN0YXRpYyBpbnQgdHRtX2JvX2hhbmRsZV9tb3ZlX21lbShzdHJ1Y3QKPj4+Pj4gdHRtX2J1ZmZl
cl9vYmplY3QgKmJvLAo+Pj4+PiAgwqAgbW92ZWQ6Cj4+Pj4+ICDCoMKgwqDCoMKgIGJvLT5ldmlj
dGVkID0gZmFsc2U7Cj4+Pj4+ICDCoCAtwqDCoMKgIGlmIChiby0+bWVtLm1tX25vZGUpCj4+Pj4+
IC3CoMKgwqDCoMKgwqDCoCBiby0+b2Zmc2V0ID0gKGJvLT5tZW0uc3RhcnQgPDwgUEFHRV9TSElG
VCkgKwo+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiZGV2LT5tYW5bYm8tPm1lbS5tZW1f
dHlwZV0uZ3B1X29mZnNldDsKPj4+Pj4gLcKgwqDCoCBlbHNlCj4+Pj4+IC3CoMKgwqDCoMKgwqDC
oCBiby0+b2Zmc2V0ID0gMDsKPj4+Pj4gLQo+Pj4+IEFmdGVyIG1vdmluZyB0aGlzIGludG8gdXNl
cnMsIHRoZSBlbHNlIGJyYW5jaCBoYXMgYmVlbiBsb3N0LiBJcwo+Pj4+ICdiby0+bWVtLm1tX25v
ZGUnIGFsd2F5cyB0cnVlPwo+Pj4gQXQgbGVhc3QgZm9yIHRoZSBhbWRncHUgYW5kIHJhZGVvbiB1
c2UgY2FzZXMsIHllcy4KPj4+Cj4+PiBCdXQgdGhhdCBpcyBhIHJhdGhlciBnb29kIHF1ZXN0aW9u
IEkgbWVhbiBmb3IgaXQgaXMgaWxsZWdhbCB0byBnZXQgdGhlCj4+PiBHUFUgQk8gYWRkcmVzcyBp
ZiBpdCBpcyBpbmFjY2Vzc2libGUgKGUuZy4gaW4gdGhlIHN5c3RlbSBkb21haW4pLgo+Pj4KPj4+
IENvdWxkIGJlIHRoYXQgc29tZSBkcml2ZXIgcmVsaWVkIG9uIHRoZSBiZWhhdmlvciB0byBnZXQg
MCBmb3IgdGhlCj4+PiBzeXN0ZW0gZG9tYWluIGhlcmUuCj4+IEkgd29uZGVyIGhvdyB0byB2ZXJp
ZnkgdGhhdCA/Cj4+Cj4+IElmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHk6Cj4+Cj4+IDEgcXhsIHVz
ZXMgYm8tPm9mZnNldCBvbmx5IGluIHF4bF9ib19waHlzaWNhbF9hZGRyZXNzKCkgd2hpY2ggaXMg
bm90IGluCj4+IHN5c3RlbSBkb21haW4uCj4+Cj4+IDIgdW5mb3J0dW5hdGVseSBJIGNhbid0IHNh
eSB0aGUgc2FtZSBmb3IgYm9jaHMgYnV0IGl0IHdvcmtzIHdpdGggdGhpcwo+PiBwYXRjaCBzZXJp
ZXMgc28gSSB0aGluayBib2NocyBpcyBmaW5lIGFzIHdlbGwuCj4+Cj4+IDMgdm13Z2Z4IHVzZXMg
Ym8tPm9mZnNldCBvbmx5IHdoZW4gYm8tPm1lbS5tZW1fdHlwZSA9PSBUVE1fUExfVlJBTSBzbwo+
PiB2bXdnZnggc2hvdWxkIGJlIGZpbmUuCj4+Cj4+IDQgYW1kZ3B1IGFuZCByYWRlb24gcnVucyB3
aXRoICdiby0+bWVtLm1tX25vZGUnIGFsd2F5cyB0cnVlCj4+Cj4+IEkgYW0gbm90IHN1cmUgYWJv
dXTCoCBub3V2ZWF1IGFzIGJvLT5vZmZzZXQgaXMgYmVpbmcgdXNlZCBpbiBtYW55IHBsYWNlcy4K
Pj4KPj4gSSBjb3VsZCBwcm9iYWJseSBtaXJyb3IgdGhlIHJlbW92ZWQgbG9naWMgdG8gbm91dmVh
dSBhcwo+IEkgc3VnZ2VzdCB0byBpbnRyb2R1Y2UgYSB0dG0gaGVscGVyIHRoYXQgY29udGFpbnMg
dGhlIG9yaWdpbmFsIGJyYW5jaGluZwo+IGFuZCB1c2UgaXQgZXZlcnl3aGVyZS4gU29tZXRoaW5n
IGxpa2UKPgo+ICAgIHM2NCB0dG1fYm9fb2Zmc2V0KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAq
Ym8pCj4gICAgewo+ICAgICAgIGlmIChXQVJOX09OX09OQ0UoIWJvLT5tZW0ubW1fbm9kZSkpCj4g
ICAgICAgICAgIHJldHVybiAwOwo+ICAgICAgIHJldHVybiBiby0+bWVtLnN0YXJ0IDw8IFBBR0Vf
U0hJRlQ7Cj4gICAgfQo+Cj4gQ291bGQgYmUgc3RhdGljIGlubGluZS4gVGhlIHdhcm5pbmcgc2hv
dWxkIHBvaW50IHRvIGJyb2tlbiBkcml2ZXJzLiBUaGlzCj4gYWxzbyBnZXRzIHJpZCBvZiB0aGUg
dWdseSBzaGlmdCBpbiB0aGUgZHJpdmVycy4KCkJpZyBOQUsgb24gdGhpcy4gVGhhdCBpcyBleGFj
dGx5IHdoYXQgd2Ugc2hvdWxkIE5PVCBkby4KClNlZSB0aGUgc2hpZnQgYmVsb25ncyBpbnRvIHRo
ZSBkcml2ZXIsIGJlY2F1c2UgaXQgaXMgZHJpdmVyIGRlcGVuZGVudCBpZiAKd2Ugd29yayB3aXRo
IHBhZ2Ugb3IgYnl0ZSBvZmZzZXRzLgoKRm9yIGFtZGdwdSB3ZSBmb3IgZXhhbXBsZSB3YW50IHRv
IHdvcmsgd2l0aCBieXRlIG9mZnNldHMgYW5kIFRUTSBzaG91bGQgCm5vdCBtYWtlIGFueSBhc3N1
bXB0aW9uIGFib3V0IHdoYXQgYm8tPm1lbS5zdGFydCBhY3R1YWxseSBjb250YWlucy4KClJlZ2Fy
ZHMsCkNocmlzdGlhbi4KCj4KPiBCZXN0IHJlZ2FyZHMKPiBUaG9tYXMKPgo+Cj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPj4gYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPj4gaW5kZXggZjgwMTVlMDMxOGQ3Li41YTZhMmFm
OTEzMTggMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8u
Ywo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPj4gQEAgLTEz
MTcsNiArMTMxNywxMCBAQCBub3V2ZWF1X2JvX21vdmVfbnRmeShzdHJ1Y3QgdHRtX2J1ZmZlcl9v
YmplY3QKPj4gKmJvLCBib29sIGV2aWN0LAo+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGxpc3RfZm9yX2VhY2hfZW50cnkodm1hLCAmbnZiby0+dm1hX2xpc3QsIGhlYWQpIHsKPj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm91dmVhdV92
bWFfbWFwKHZtYSwgbWVtKTsKPj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChiby0+bWVtLm1tX25vZGUpCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBudmJvLT5vZmZzZXQg
PSAobmV3X3JlZy0+c3RhcnQgPDwgUEFHRV9TSElGVCk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGVsc2UKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIG52Ym8tPm9mZnNldCA9IDA7Cj4+ICDCoMKgwqDCoMKgwqDCoCB9IGVsc2Ugewo+PiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxpc3RfZm9yX2VhY2hfZW50cnkodm1hLCAm
bnZiby0+dm1hX2xpc3QsIGhlYWQpIHsKPj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgV0FSTl9PTih0dG1fYm9fd2FpdChibywgZmFsc2UsIGZhbHNlKSk7
Cj4+Cj4+IFJlZ2FyZHMsCj4+Cj4+IE5pcm1veQo+Pgo+Pgo+Pj4gUmVnYXJkcywKPj4+IENocmlz
dGlhbi4KPj4+Cj4+Pj4gQmVzdCByZWdhcmRzCj4+Pj4gVGhvbWFzCj4+Pj4KPj4+Pj4gIMKgwqDC
oMKgwqAgY3R4LT5ieXRlc19tb3ZlZCArPSBiby0+bnVtX3BhZ2VzIDw8IFBBR0VfU0hJRlQ7Cj4+
Pj4+ICDCoMKgwqDCoMKgIHJldHVybiAwOwo+Pj4+PiAgwqAgZGlmZiAtLWdpdCBhL2luY2x1ZGUv
ZHJtL3R0bS90dG1fYm9fYXBpLmgKPj4+Pj4gYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5o
Cj4+Pj4+IGluZGV4IGI5YmMxYjAwMTQyZS4uZDZmMzllZTViZjVkIDEwMDY0NAo+Pj4+PiAtLS0g
YS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oCj4+Pj4+ICsrKyBiL2luY2x1ZGUvZHJtL3R0
bS90dG1fYm9fYXBpLmgKPj4+Pj4gQEAgLTIxMyw4ICsyMTMsNiBAQCBzdHJ1Y3QgdHRtX2J1ZmZl
cl9vYmplY3Qgewo+Pj4+PiAgwqDCoMKgwqDCoMKgICogZWl0aGVyIG9mIHRoZXNlIGxvY2tzIGhl
bGQuCj4+Pj4+ICDCoMKgwqDCoMKgwqAgKi8KPj4+Pj4gIMKgIC3CoMKgwqAgdWludDY0X3Qgb2Zm
c2V0OyAvKiBHUFUgYWRkcmVzcyBzcGFjZSBpcyBpbmRlcGVuZGVudCBvZiBDUFUKPj4+Pj4gd29y
ZCBzaXplICovCj4+Pj4+IC0KPj4+Pj4gIMKgwqDCoMKgwqAgc3RydWN0IHNnX3RhYmxlICpzZzsK
Pj4+Pj4gIMKgIH07Cj4+Pj4+ICDCoCBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9i
b19kcml2ZXIuaAo+Pj4+PiBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKPj4+Pj4g
aW5kZXggYzllMGZkMDlmNGIyLi5jOGNlNmMxODFhYmUgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2luY2x1
ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKPj4+Pj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0
bV9ib19kcml2ZXIuaAo+Pj4+PiBAQCAtMTc3LDcgKzE3Nyw2IEBAIHN0cnVjdCB0dG1fbWVtX3R5
cGVfbWFuYWdlciB7Cj4+Pj4+ICDCoMKgwqDCoMKgIGJvb2wgaGFzX3R5cGU7Cj4+Pj4+ICDCoMKg
wqDCoMKgIGJvb2wgdXNlX3R5cGU7Cj4+Pj4+ICDCoMKgwqDCoMKgIHVpbnQzMl90IGZsYWdzOwo+
Pj4+PiAtwqDCoMKgIHVpbnQ2NF90IGdwdV9vZmZzZXQ7IC8qIEdQVSBhZGRyZXNzIHNwYWNlIGlz
IGluZGVwZW5kZW50IG9mIENQVQo+Pj4+PiB3b3JkIHNpemUgKi8KPj4+Pj4gIMKgwqDCoMKgwqAg
dWludDY0X3Qgc2l6ZTsKPj4+Pj4gIMKgwqDCoMKgwqAgdWludDMyX3QgYXZhaWxhYmxlX2NhY2hp
bmc7Cj4+Pj4+ICDCoMKgwqDCoMKgIHVpbnQzMl90IGRlZmF1bHRfY2FjaGluZzsKPj4+Pj4KPj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
