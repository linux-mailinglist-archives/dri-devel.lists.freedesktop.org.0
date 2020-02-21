Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2435A166C3C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 02:20:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167476EE09;
	Fri, 21 Feb 2020 01:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3C86EE09;
 Fri, 21 Feb 2020 01:19:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iq62OkEdpKcqI9gMEqlEBn8yi3DG/sAYT1hCZm+Swfkv7eMLMAHwI6omXALfbnj++6EU4R5RSI5aBvnkLkoczRH3iXEGX09djdYorqGIBIDa/PJK9195kIzDQIsEmL1bdmDdfGFdMPnwBUbVVkQU7hcj5Tla21HNtUZt2rMCqZXh5zwueYG56PyX9jgGrYR/p3EWKrL1tS9kNaYoqkeKLi+Xf4jdbZVzlDsdrerH/JPc65I/eNG2Aso/5NQ2zJKRr7vNJktMzjstpyLvF9/aIUBmDrfXyMbnEPiFEMtZSv0RTM3SvB9mUkBdE8WLXoeATVRnZazrrskYrWNiAjcbQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xK63Yf3W2D47hwYr/xAoWfG2NtovPBJ3soRNi17HI8w=;
 b=ayYNOz7duRjFPIoMd/EFXJtqT9nl3+Qqwu0jVjkToHUDdPyuICf2be16snkRgytQ9g9EMU6NJrq68yi9lQEV1Up+iT/bgmQpx4fb1nPNshOSBI/DsCNGrrmcNGRlCdaiOqWDcBtVfWIrkWvF0ZlutH01g4sLAtKJKSznKOFSh7jO/4SMMWoUAdRRkb5f3lnx2rZ3fh2bAZ7a6xgX3+c75GfYJ4oOmfv7R2yPhwZonS8i0JSoaiJ9GULVUxZNu09gw4xM8ydtbmcMnId7g6x355WenYgv+N/QP2PLQ4+5QmKEsHZumVNA6CdbtsyjuVZiOgUf77PTH4kgwbPmjDVUiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xK63Yf3W2D47hwYr/xAoWfG2NtovPBJ3soRNi17HI8w=;
 b=I1rD9Qv9MlTWkQniINGLNBPP5SnjaJ69WwmcBHGszV1JiZ24e4Vqrct7RPvWhaVanPWpj57OZbRY5+CSpbxQt4a2bTeA+vuQnb3PCuNbN16Pxbu0RkJSTEUjDWBtc5+2i9OyjgfPa1XUIJlhoHRaBEbeSWoAys5UnQbYizGiyIw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luben.Tuikov@amd.com; 
Received: from DM6PR12MB3355.namprd12.prod.outlook.com (2603:10b6:5:115::26)
 by DM6PR12MB3913.namprd12.prod.outlook.com (2603:10b6:5:1cc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25; Fri, 21 Feb
 2020 01:19:54 +0000
Received: from DM6PR12MB3355.namprd12.prod.outlook.com
 ([fe80::9505:d766:9ac9:2bfd]) by DM6PR12MB3355.namprd12.prod.outlook.com
 ([fe80::9505:d766:9ac9:2bfd%6]) with mapi id 15.20.2729.033; Fri, 21 Feb 2020
 01:19:54 +0000
Subject: Re: [PATCH 2/8] drm/radeon: don't use ttm bo->offset
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200219135322.56463-1-nirmoy.das@amd.com>
 <20200219135322.56463-3-nirmoy.das@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <9e26a27b-eeaa-39b3-dacc-9f3777f3cf92@amd.com>
Date: Thu, 20 Feb 2020 20:19:50 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <20200219135322.56463-3-nirmoy.das@amd.com>
Content-Language: en-CA
X-ClientProxiedBy: YTBPR01CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::35) To DM6PR12MB3355.namprd12.prod.outlook.com
 (2603:10b6:5:115::26)
MIME-Version: 1.0
Received: from [10.252.35.64] (165.204.54.211) by
 YTBPR01CA0022.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18 via Frontend Transport; Fri, 21 Feb 2020 01:19:52 +0000
X-Originating-IP: [165.204.54.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ca8f6924-9581-4bc8-40e4-08d7b66c2832
X-MS-TrafficTypeDiagnostic: DM6PR12MB3913:|DM6PR12MB3913:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB391334724DECFABCA44EB18999120@DM6PR12MB3913.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 0320B28BE1
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(199004)(189003)(26005)(86362001)(8676002)(16576012)(81156014)(478600001)(81166006)(31696002)(316002)(186003)(8936002)(16526019)(5660300002)(2906002)(2616005)(36756003)(7416002)(66946007)(6486002)(31686004)(4326008)(53546011)(44832011)(66476007)(52116002)(66556008)(956004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3913;
 H:DM6PR12MB3355.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i1FsBhSUPTwkV8kNEe4hmvKBNuXoKVoWnGrxVaDo/DtlDnPq9DFkzL+yV1dwO0/sAH0ue5fAx17VR0BIq7v/sEPvPyLaT8oc/09B/iUqUAxBdLUav3UBZ+VJW574NmoY3JRoP+2piCQj1ED0QlDFcsrKrskwCDhz6A3kLLo1b9C1vCPI4g4wyTypy2s6FeHER0ugBNhIq50agiZ51HfYdTrQFGrRrLRzS6QjzcsyQv6zyPYiGQEoPBO6mmiAFsWG3GXfa6VHPost8yi1aXQOwodPFeW8aVSrcoQohpycvtAGPCEx72t/Hi/79FhB13UmldV1YBH2BfD1mpLQuj0iIOFC3Cb4vZ/0YUQAPIbWRDTa2PmClckbUaEiNBjsNTSSM7Nubts3vAkGnuIHMBtknOGrCLQlZJoD9E6yb5DCfl4hNDnnvEVVkEjs9JoET21b
X-MS-Exchange-AntiSpam-MessageData: mZXUWsD1ycfTg3jjttPfJNjwsiWd6opSEUZNkfxsSIB6TsdKTSHJhBQXbUCFf0I61/2xQoWTQS05UbvdQWPCZOpOpVo0UuCkYtewR0OoR2EuCSx60qwJ85KwiM8mntaYOMB8zEyXeD3ktvzzny8Alw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca8f6924-9581-4bc8-40e4-08d7b66c2832
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2020 01:19:54.5348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PPNB6UuTIbTWpA9NIRAYmBZQJO4rZ2yV5cF6KAUyR6PsTlgT4LXuEzTXOmvU11yu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3913
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
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wMi0xOSAwODo1MywgTmlybW95IERhcyB3cm90ZToKPiBDYWxjdWxhdGUgR1BVIG9m
ZnNldCBpbiByYWRlb25fYm9fZ3B1X29mZnNldCB3aXRob3V0IGRlcGVuZGluZyBvbgo+IGJvLT5v
ZmZzZXQKPiAKPiBTaWduZWQtb2ZmLWJ5OiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGFtZC5jb20+
Cj4gUmV2aWV3ZWQtYW5kLXRlc3RlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5oICAg
ICAgICB8ICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fb2JqZWN0LmggfCAx
NiArKysrKysrKysrKysrKystCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5j
ICAgIHwgIDQgKy0tLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
LmggYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5oCj4gaW5kZXggMzBlMzJhZGMxZmM2
Li5iN2MzZmIyYmZiNTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b24uaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uLmgKPiBAQCAtMjgyOCw2
ICsyODI4LDcgQEAgZXh0ZXJuIHZvaWQgcmFkZW9uX3R0bV9zZXRfYWN0aXZlX3ZyYW1fc2l6ZShz
dHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwgdTY0IHNpemUKPiAgZXh0ZXJuIHZvaWQgcmFkZW9u
X3Byb2dyYW1fcmVnaXN0ZXJfc2VxdWVuY2Uoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsCj4g
IAkJCQkJICAgICBjb25zdCB1MzIgKnJlZ2lzdGVycywKPiAgCQkJCQkgICAgIGNvbnN0IHUzMiBh
cnJheV9zaXplKTsKPiArc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJhZGVvbl9nZXRfcmRldihzdHJ1
Y3QgdHRtX2JvX2RldmljZSAqYmRldik7Cj4gIAo+ICAvKgo+ICAgKiB2bQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX29iamVjdC5oCj4gaW5kZXggZDIzZjJlZDQxMjZlLi40ZDM3NTcxYzdm
ZjUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fb2JqZWN0LmgK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuaAo+IEBAIC05MCw3
ICs5MCwyMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcmFkZW9uX2JvX3VucmVzZXJ2ZShzdHJ1Y3Qg
cmFkZW9uX2JvICpibykKPiAgICovCj4gIHN0YXRpYyBpbmxpbmUgdTY0IHJhZGVvbl9ib19ncHVf
b2Zmc2V0KHN0cnVjdCByYWRlb25fYm8gKmJvKQo+ICB7Cj4gLQlyZXR1cm4gYm8tPnRiby5vZmZz
ZXQ7Cj4gKwlzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldjsKPiArCXU2NCBzdGFydCA9IDA7Cj4g
Kwo+ICsJcmRldiA9IHJhZGVvbl9nZXRfcmRldihiby0+dGJvLmJkZXYpOwo+ICsKPiArCXN3aXRj
aChiby0+dGJvLm1lbS5tZW1fdHlwZSkgewoKTEtDUyB3YW50cyBhIHNwYWNlIGFmdGVyIGEga2V5
d29yZCwgInN3aXRjaCAoIiAuCgo+ICsJY2FzZSBUVE1fUExfVFQ6Cj4gKwkJc3RhcnQgPSByZGV2
LT5tYy5ndHRfc3RhcnQ7Cj4gKwkJYnJlYWs7Cj4gKwljYXNlIFRUTV9QTF9WUkFNOgo+ICsJCXN0
YXJ0ID0gcmRldi0+bWMudnJhbV9zdGFydDsKPiArCQlicmVhazsKPiArCX0KCkNvdWxkIHRoaXMg
bG9va3VwIGhhdmUgYmVlbiBwYXJhbWV0ZXJpemVkIGJ5ICJtZW1fdHlwZSIKdG8gYmUgbG9va2Vk
IHVwIGJ5IGFuIGluZGV4IChwb3NzaWJseSAibWVtX3R5cGUiKSB0byByZXN1bHQKaW4gc29tZXRo
aW5nIG5ldyBsaWtlIChwc2V1ZG8tY29kZSk6CiAgICAgc3RhcnQgPSByZGV2LT5tYy5tZW1fc3Rh
cnRfdGFibGVbYm8tPnRiby5tZW0ubWVtX3R5cGVdOwpXaGVyZSAibWVtX3N0YXJ0X3RhYmxlIiBp
cyBhIG5ldyB0YWJsZSBob2xkaW5nIG1lbW9yeSBzdGFydHMKb2YgcGFydGljdWxhciBtZW1vcmll
cy4KVGhlbiB5b3UgZG9uJ3QgbmVlZCB0aGUgc3dpdGNoLWNhc2UuCgpSZWdhcmRzLApMdWJlbgoK
PiArCj4gKwlyZXR1cm4gKGJvLT50Ym8ubWVtLnN0YXJ0IDw8IFBBR0VfU0hJRlQpICsgc3RhcnQ7
Cj4gIH0KPiAgCj4gIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyByYWRlb25fYm9fc2l6ZShz
dHJ1Y3QgcmFkZW9uX2JvICpibykKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwo+IGlu
ZGV4IGJhZGYxYjZkMTU0OS4uMWM4MzAzNDY4ZThmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fdHRtLmMKPiBAQCAtNTYsNyArNTYsNyBAQAo+ICBzdGF0aWMgaW50IHJhZGVvbl90dG1f
ZGVidWdmc19pbml0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKPiAgc3RhdGljIHZvaWQg
cmFkZW9uX3R0bV9kZWJ1Z2ZzX2Zpbmkoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwo+ICAK
PiAtc3RhdGljIHN0cnVjdCByYWRlb25fZGV2aWNlICpyYWRlb25fZ2V0X3JkZXYoc3RydWN0IHR0
bV9ib19kZXZpY2UgKmJkZXYpCj4gK3N0cnVjdCByYWRlb25fZGV2aWNlICpyYWRlb25fZ2V0X3Jk
ZXYoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYpCj4gIHsKPiAgCXN0cnVjdCByYWRlb25fbW1h
biAqbW1hbjsKPiAgCXN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2Owo+IEBAIC04Miw3ICs4Miw2
IEBAIHN0YXRpYyBpbnQgcmFkZW9uX2luaXRfbWVtX3R5cGUoc3RydWN0IHR0bV9ib19kZXZpY2Ug
KmJkZXYsIHVpbnQzMl90IHR5cGUsCj4gIAkJYnJlYWs7Cj4gIAljYXNlIFRUTV9QTF9UVDoKPiAg
CQltYW4tPmZ1bmMgPSAmdHRtX2JvX21hbmFnZXJfZnVuYzsKPiAtCQltYW4tPmdwdV9vZmZzZXQg
PSByZGV2LT5tYy5ndHRfc3RhcnQ7Cj4gIAkJbWFuLT5hdmFpbGFibGVfY2FjaGluZyA9IFRUTV9Q
TF9NQVNLX0NBQ0hJTkc7Cj4gIAkJbWFuLT5kZWZhdWx0X2NhY2hpbmcgPSBUVE1fUExfRkxBR19D
QUNIRUQ7Cj4gIAkJbWFuLT5mbGFncyA9IFRUTV9NRU1UWVBFX0ZMQUdfTUFQUEFCTEUgfCBUVE1f
TUVNVFlQRV9GTEFHX0NNQTsKPiBAQCAtMTA0LDcgKzEwMyw2IEBAIHN0YXRpYyBpbnQgcmFkZW9u
X2luaXRfbWVtX3R5cGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVpbnQzMl90IHR5cGUs
Cj4gIAljYXNlIFRUTV9QTF9WUkFNOgo+ICAJCS8qICJPbi1jYXJkIiB2aWRlbyByYW0gKi8KPiAg
CQltYW4tPmZ1bmMgPSAmdHRtX2JvX21hbmFnZXJfZnVuYzsKPiAtCQltYW4tPmdwdV9vZmZzZXQg
PSByZGV2LT5tYy52cmFtX3N0YXJ0Owo+ICAJCW1hbi0+ZmxhZ3MgPSBUVE1fTUVNVFlQRV9GTEFH
X0ZJWEVEIHwKPiAgCQkJICAgICBUVE1fTUVNVFlQRV9GTEFHX01BUFBBQkxFOwo+ICAJCW1hbi0+
YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfRkxBR19VTkNBQ0hFRCB8IFRUTV9QTF9GTEFHX1dD
Owo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
