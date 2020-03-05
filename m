Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BA917AEDD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 20:19:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294536EC02;
	Thu,  5 Mar 2020 19:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750054.outbound.protection.outlook.com [40.107.75.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A7B6EBFE;
 Thu,  5 Mar 2020 19:19:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqZkMe+C8US3QY8USKXc7npJpqdLOw7h65W+EL590FQiS8z6ZK3H+O/41sY1kX+FWzO5w8DjVXgxC7avoI5WqYfKLW+ZeOeWJfDD2KKr0VQaOFP0mAPBHjeLjJl2M5sWYoUuNCrRyOM+i+mbjqmNeSbFOapWc9vmb09HUWmB71CWCqxqgP+z/K+qnb22zM5q1dlrU4yVytyxz+5TkRBzhMQDDBg1WYdcuL0YChLQjCC7e7nJeERSf+znS9M2S+V0u6PCGUw+dVo+MwegxEecSaIfHK2Prxd2918XErps0OMqccjifju+NNRyqiTj/DNjd7KwtX/zOvTFmlLzyLfeZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgzzkFShmEQIWXu3S36YvNE8mSarfdLNBxAJikD4ONY=;
 b=R0DfkitC6QhjF0NcxRK97m4SKc9N6J1w3Yv3CrORG0AoTInW1Rd3b13L64a5FC/E6FFRHPYQ4dc0yVaLVjiubK9OflUjX/ZZRY2kTW1TiBj/XcVieIG3WfduEHXThNI72zhP+RGCH+N9hdXe13xAUME86z4J3c9PXvRwZh/s7bomL57FJ/pSxWLt9z67xQy/gs+lJ9X+im36p/ZFvNOD8YdoT58+iQ6+pnxNvfPFI4HPaJ/f+omSy2iLVGDHoecYz8UV8hrRV3XTN2RWAur+sJvpMu1yl0RvI3Ap7MDRiGSXRPvNM271f8RyFYmMX+1QrkomHanOkgN0bWFNU2MsaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgzzkFShmEQIWXu3S36YvNE8mSarfdLNBxAJikD4ONY=;
 b=DRAuPZ9Ay8lOCaPp7qeh4qilpKcPbo1XUNHwl56dTeMlp2ID/uj5s0Se9ODnS3DcunIffkL5Z3fH7VstErL5jQtFEwl+bp8aj3Jxkg3YLbvL6ZtnGsZ9vDdahSfhmltGEdBWgjg9YDK1tfVk8gAlGXspoCOjCV5Rff+XGJqyCKQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luben.Tuikov@amd.com; 
Received: from DM6PR12MB3355.namprd12.prod.outlook.com (2603:10b6:5:115::26)
 by DM6PR12MB4300.namprd12.prod.outlook.com (2603:10b6:5:21a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15; Thu, 5 Mar
 2020 19:19:48 +0000
Received: from DM6PR12MB3355.namprd12.prod.outlook.com
 ([fe80::9505:d766:9ac9:2bfd]) by DM6PR12MB3355.namprd12.prod.outlook.com
 ([fe80::9505:d766:9ac9:2bfd%6]) with mapi id 15.20.2772.019; Thu, 5 Mar 2020
 19:19:48 +0000
Subject: Re: [PATCH 2/8] drm/radeon: don't use ttm bo->offset
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200305132910.17515-1-nirmoy.das@amd.com>
 <20200305132910.17515-3-nirmoy.das@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <375abd03-85c3-e19a-753b-859ba7e19b6a@amd.com>
Date: Thu, 5 Mar 2020 14:19:45 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <20200305132910.17515-3-nirmoy.das@amd.com>
Content-Language: en-CA
X-ClientProxiedBy: YTOPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::38) To DM6PR12MB3355.namprd12.prod.outlook.com
 (2603:10b6:5:115::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.35.64] (165.204.54.211) by
 YTOPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.15 via Frontend
 Transport; Thu, 5 Mar 2020 19:19:47 +0000
X-Originating-IP: [165.204.54.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4ebf1304-26ce-4709-3969-08d7c13a2bdf
X-MS-TrafficTypeDiagnostic: DM6PR12MB4300:|DM6PR12MB4300:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB430073CC50E774FF7FCAD00E99E20@DM6PR12MB4300.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-Forefront-PRVS: 03333C607F
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(189003)(199004)(16576012)(316002)(66476007)(66946007)(66556008)(2616005)(956004)(2906002)(7416002)(5660300002)(31686004)(36756003)(31696002)(8936002)(81166006)(4326008)(478600001)(45080400002)(44832011)(966005)(6486002)(26005)(8676002)(53546011)(186003)(16526019)(86362001)(52116002)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4300;
 H:DM6PR12MB3355.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kMo1pk49WWc9tjlHKx0uoaLiGJGfLFnfOXhH6nbyYLKGwrudJ6OK+bEi4jUoEDLEPuCJbMg04jAL1nnjBeSEbNViXrePTp3zUXp0bWfmRBP6J0cr3h/rq9wlh8T6bAc2IIKLVwmRzJdhIaC5u9wImztEG5rx07XVRDxp5mxewmQoXKFahLhpsALPpfPmGlsKKyfJfcDOz4AFyOXqOfwr7WFU51IBklnCDE9g8sh3ZQXWjUUga1qZR+XmwRDuDck/EoKguPyNwysM/wSqQlH/P3iCuRuLiHYy7liOSIjabv6U81XHAmRj2TbfMv/r4JoffAc+3kBdsCXzC3qw0nYsVOw9PZSQzmrfnltxcbd/9PttJcNDqnYKkFUWphQAV16kjwDpTQFMVFKXHuv+Zc3EhMeuk5rzX0iUqyl4LWS3SbGLsTwWPD5EIhsTZT2DVQUBKCTxyn+re48N4geD2LTP6/MZSimywgvFYMJxOLASaro=
X-MS-Exchange-AntiSpam-MessageData: CaI5UM+04B1NOTAJsNW/lQyKBup6WHwwMeIA7DSjTapL0nQEXhpBC4S/rEYSsh4uRWOu2QmIRhN76QbTi+SFbma05IrThtmDXIT420RKdFxI3RP7qW3F1Bn8bjuJCfq8YdMKUoKIAcyxNubqr4Sfmg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ebf1304-26ce-4709-3969-08d7c13a2bdf
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2020 19:19:48.6706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qBhMIrQ/d9fzgmbO4ro31n6QbwY/01kyp8Oi7kUBo3mLRrz0DToGdfrNgpAn+bJN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4300
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

T24gMjAyMC0wMy0wNSAwODoyOSwgTmlybW95IERhcyB3cm90ZToKPiBDYWxjdWxhdGUgR1BVIG9m
ZnNldCBpbiByYWRlb25fYm9fZ3B1X29mZnNldCB3aXRob3V0IGRlcGVuZGluZyBvbgo+IGJvLT5v
ZmZzZXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogTmlybW95IERhcyA8bmlybW95LmRhc0BhbWQuY29t
Pgo+IFJldmlld2VkLWFuZC10ZXN0ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaCAg
ICAgICAgfCAgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX29iamVjdC5oIHwg
MTYgKysrKysrKysrKysrKysrLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0u
YyAgICB8ICA0ICstLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bi5oIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaAo+IGluZGV4IDMwZTMyYWRjMWZj
Ni4uYjdjM2ZiMmJmYjU0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5oCj4gQEAgLTI4Mjgs
NiArMjgyOCw3IEBAIGV4dGVybiB2b2lkIHJhZGVvbl90dG1fc2V0X2FjdGl2ZV92cmFtX3NpemUo
c3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHU2NCBzaXplCj4gIGV4dGVybiB2b2lkIHJhZGVv
bl9wcm9ncmFtX3JlZ2lzdGVyX3NlcXVlbmNlKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LAo+
ICAJCQkJCSAgICAgY29uc3QgdTMyICpyZWdpc3RlcnMsCj4gIAkJCQkJICAgICBjb25zdCB1MzIg
YXJyYXlfc2l6ZSk7Cj4gK3N0cnVjdCByYWRlb25fZGV2aWNlICpyYWRlb25fZ2V0X3JkZXYoc3Ry
dWN0IHR0bV9ib19kZXZpY2UgKmJkZXYpOwo+IAo+ICAvKgo+ICAgKiB2bQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX29iamVjdC5oCj4gaW5kZXggZDIzZjJlZDQxMjZlLi42MDI3NWI4MjJm
NzkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fb2JqZWN0LmgK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuaAo+IEBAIC05MCw3
ICs5MCwyMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcmFkZW9uX2JvX3VucmVzZXJ2ZShzdHJ1Y3Qg
cmFkZW9uX2JvICpibykKPiAgICovCj4gIHN0YXRpYyBpbmxpbmUgdTY0IHJhZGVvbl9ib19ncHVf
b2Zmc2V0KHN0cnVjdCByYWRlb25fYm8gKmJvKQo+ICB7Cj4gLQlyZXR1cm4gYm8tPnRiby5vZmZz
ZXQ7Cj4gKwlzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldjsKPiArCXU2NCBzdGFydCA9IDA7Cj4g
Kwo+ICsJcmRldiA9IHJhZGVvbl9nZXRfcmRldihiby0+dGJvLmJkZXYpOwo+ICsKPiArCXN3aXRj
aCAoYm8tPnRiby5tZW0ubWVtX3R5cGUpIHsKPiArCWNhc2UgVFRNX1BMX1RUOgo+ICsJCXN0YXJ0
ID0gcmRldi0+bWMuZ3R0X3N0YXJ0Owo+ICsJCWJyZWFrOwo+ICsJY2FzZSBUVE1fUExfVlJBTToK
PiArCQlzdGFydCA9IHJkZXYtPm1jLnZyYW1fc3RhcnQ7Cj4gKwkJYnJlYWs7Cj4gKwl9Cj4gKwo+
ICsJcmV0dXJuIChiby0+dGJvLm1lbS5zdGFydCA8PCBQQUdFX1NISUZUKSArIHN0YXJ0Owo+ICB9
CgpZb3UncmUgcmVtb3ZpbmcgYSAicmV0dXJuIGJvLT50Ym8ub2Zmc2V0IiBhbmQgYWRkaW5nIGEK
c3dpdGNoLWNhc2Ugc3RhdGVtZW50LiBTbywgdGhlbiwgbm93IGluc3RlYWQgb2YgYW4gaW5zdGFu
dApsb29rdXAsIHlvdSdyZSBhZGRpbmcgYnJhbmNoaW5nLiBZb3UncmUgYWRkaW5nIGNvbXBhcmlz
b24KYW5kIGJyYW5jaGluZy4gRG8geW91IHRoaW5rIHRoYXQncyBiZXR0ZXI/IEZhc3Rlcj8gU21h
bGxlcj8KCkkndmUgd3JpdHRlbiBiZWZvcmUgYWJvdXQgdGhpcyBmb3IgdGhpcyBwYXRjaDogV2h5
IG5vdCBjcmVhdGUgYSBtYXAsCndob3NlIGluZGV4IGlzICJtZW1fdHlwZSIgd2hpY2ggcmVmZXJl
bmNlcyB0aGUgZGVzaXJlZAphZGRyZXNzPyBObyBjb21wYXJpc29uLCBubyBicmFuY2hpbmcuIEp1
c3QgYW4gaW5kZXgtZGVyZWZlcmVuY2UKYW5kIGEgdmFsdWU6CgpyZXR1cm4gcmRldi0+bWMubWVt
X3N0YXJ0X21hcFtiby0+dGJvLm1lbS5tZW1fdHlwZV07CgpPYnZpb3VzbHksIHlvdSdsbCBoYXZl
IHRvIGNyZWF0ZSAibWVtX3N0YXJ0X21hcCIuCgpUaGF0J3MgYSBOQUsgZnJvbSBtZSBvbiB0aGlz
IHBhdGNoIHVzaW5nIGNvbXBhcmlzb24KYW5kIGJyYW5jaGluZyB0byByZXR1cm4gc3RhdGljIGRh
dGEgbG9va3VwIHZhbHVlLgoKUmVnYXJkcywKTHViZW4KCj4gCj4gIHN0YXRpYyBpbmxpbmUgdW5z
aWduZWQgbG9uZyByYWRlb25fYm9fc2l6ZShzdHJ1Y3QgcmFkZW9uX2JvICpibykKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl90dG0uYwo+IGluZGV4IGJhZGYxYjZkMTU0OS4uMWM4MzAzNDY4ZThm
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKPiBAQCAtNTYsNyArNTYsNyBA
QAo+ICBzdGF0aWMgaW50IHJhZGVvbl90dG1fZGVidWdmc19pbml0KHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2KTsKPiAgc3RhdGljIHZvaWQgcmFkZW9uX3R0bV9kZWJ1Z2ZzX2Zpbmkoc3RydWN0
IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwo+IAo+IC1zdGF0aWMgc3RydWN0IHJhZGVvbl9kZXZpY2Ug
KnJhZGVvbl9nZXRfcmRldihzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldikKPiArc3RydWN0IHJh
ZGVvbl9kZXZpY2UgKnJhZGVvbl9nZXRfcmRldihzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldikK
PiAgewo+ICAJc3RydWN0IHJhZGVvbl9tbWFuICptbWFuOwo+ICAJc3RydWN0IHJhZGVvbl9kZXZp
Y2UgKnJkZXY7Cj4gQEAgLTgyLDcgKzgyLDYgQEAgc3RhdGljIGludCByYWRlb25faW5pdF9tZW1f
dHlwZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwgdWludDMyX3QgdHlwZSwKPiAgCQlicmVh
azsKPiAgCWNhc2UgVFRNX1BMX1RUOgo+ICAJCW1hbi0+ZnVuYyA9ICZ0dG1fYm9fbWFuYWdlcl9m
dW5jOwo+IC0JCW1hbi0+Z3B1X29mZnNldCA9IHJkZXYtPm1jLmd0dF9zdGFydDsKPiAgCQltYW4t
PmF2YWlsYWJsZV9jYWNoaW5nID0gVFRNX1BMX01BU0tfQ0FDSElORzsKPiAgCQltYW4tPmRlZmF1
bHRfY2FjaGluZyA9IFRUTV9QTF9GTEFHX0NBQ0hFRDsKPiAgCQltYW4tPmZsYWdzID0gVFRNX01F
TVRZUEVfRkxBR19NQVBQQUJMRSB8IFRUTV9NRU1UWVBFX0ZMQUdfQ01BOwo+IEBAIC0xMDQsNyAr
MTAzLDYgQEAgc3RhdGljIGludCByYWRlb25faW5pdF9tZW1fdHlwZShzdHJ1Y3QgdHRtX2JvX2Rl
dmljZSAqYmRldiwgdWludDMyX3QgdHlwZSwKPiAgCWNhc2UgVFRNX1BMX1ZSQU06Cj4gIAkJLyog
Ik9uLWNhcmQiIHZpZGVvIHJhbSAqLwo+ICAJCW1hbi0+ZnVuYyA9ICZ0dG1fYm9fbWFuYWdlcl9m
dW5jOwo+IC0JCW1hbi0+Z3B1X29mZnNldCA9IHJkZXYtPm1jLnZyYW1fc3RhcnQ7Cj4gIAkJbWFu
LT5mbGFncyA9IFRUTV9NRU1UWVBFX0ZMQUdfRklYRUQgfAo+ICAJCQkgICAgIFRUTV9NRU1UWVBF
X0ZMQUdfTUFQUEFCTEU7Cj4gIAkJbWFuLT5hdmFpbGFibGVfY2FjaGluZyA9IFRUTV9QTF9GTEFH
X1VOQ0FDSEVEIHwgVFRNX1BMX0ZMQUdfV0M7Cj4gLS0KPiAyLjI1LjAKPiAKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBs
aXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL25hbTExLnNhZmVs
aW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVl
ZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZhbWQtZ2Z4JmFtcDtkYXRhPTAyJTdD
MDElN0NsdWJlbi50dWlrb3YlNDBhbWQuY29tJTdDY2E2MDA0YTVhYzdhNDAwYTAzMDcwOGQ3YzEw
OGJjZGUlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3MTkw
MTE1NjE5NDg3ODI3JmFtcDtzZGF0YT1Fa1N5NHZwVUliVEUlMkI3NUNTTzM3SldpVUxLYlJUWWJj
WlVTRXRScGNyVGslM0QmYW1wO3Jlc2VydmVkPTAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
