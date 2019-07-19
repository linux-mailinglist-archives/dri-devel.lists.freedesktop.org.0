Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3D56E288
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 10:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CEC6E5BD;
	Fri, 19 Jul 2019 08:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680076.outbound.protection.outlook.com [40.107.68.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB8A6E5BD
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 08:31:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/sf1lQX8g9LXhuvfy1ah63L2pQ9VwXbtEQnbpYY6LkAIdBKOZVKYiob64TU4Rb4bfFGLthVqny3PON3de1Cau8qVKpuYTkAHo1WIbH/AH+UMak5oX3/BMqSRMm1uzacrzEYxgAgcAK2wtWJk/QbZ1LYZgVV5Q7paRHeANl79J4s3JgJNhA9YjHfmm4ooVCL1AH5LWIKyrsjMAo8V9BtdZWxh1A/1m2l5+H3vdtyE7IZHslLR18uKH8XlDUn3aAjybR+nr4TAY0AST8DJVUyyqDq2MvPfHF4OmKMeVYiBGUuYyf56ocf37HR6AOL6E/vCImjM5cq/z1A0qcXjVvm+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ucpn0NAhn0yTjyR6KSdem6JDrUYgysZvZIU3Ku7eiI=;
 b=dN55YjchoXi4HQNbvkkt0GLfhZwo+KIWM+0cnXd0ci3ZEoa9GxOV97ekibfIrRDjnXIosuQ39M15NE4RcIYctonGiA+Ik9/cw09vuezxKnUSKvAOc8UF3Q4LQP4t3n0DWuYe9r8V5z2JVRZccQi2MGugXBOLShjPnBlCls66Dwi3zpMa3GDj26YH6rl97P3bQu7/uvEaH8wbyqBKuexy357/ys4dY6eV2RUd1AZWu606Hvcr2gEDbCma3UmTnJoNC3PfY0DFxYCSXj7y7p1m/ZzCUhQlz8ZIoIc44pa+PGyHh94JOq49efTmd1xKpHIfVk6/vmd1cg2fdj6478WZ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0110.namprd12.prod.outlook.com (2603:10b6:0:55::30) by
 BN6PR12MB1921.namprd12.prod.outlook.com (2603:10b6:404:fe::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Fri, 19 Jul 2019 08:31:14 +0000
Received: from DM3NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by DM3PR12CA0110.outlook.office365.com
 (2603:10b6:0:55::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.14 via Frontend
 Transport; Fri, 19 Jul 2019 08:31:14 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT025.mail.protection.outlook.com (10.152.82.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Fri, 19 Jul 2019 08:31:12 +0000
Received: from [10.65.99.155] (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server (TLS) id 14.3.389.1; Fri, 19 Jul
 2019 03:31:10 -0500
Subject: Re: [PATCH] drm/syncobj: return meaningful value to user space
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
References: <20190718111339.25126-1-david1.zhou@amd.com>
 <3bef64d0-97be-6aed-aa10-7a4592e7fb54@intel.com>
 <d7085a57-b9fc-c5d8-bea2-10cabb80f0f8@amd.com>
 <36d29516-42e7-6ce5-88fc-a005ed4432d6@intel.com>
 <30bdbec2-4ae1-943b-86a2-2424655fedf5@amd.com>
 <67cece6c-8629-9870-79d2-6e276e6fc08e@intel.com>
From: zhoucm1 <zhoucm1@amd.com>
Message-ID: <27a3eaa2-1fc1-afa4-d381-29c600ab32a6@amd.com>
Date: Fri, 19 Jul 2019 16:31:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <67cece6c-8629-9870-79d2-6e276e6fc08e@intel.com>
Content-Language: en-US
X-Originating-IP: [10.34.1.3]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(136003)(346002)(2980300002)(428003)(189003)(199004)(446003)(305945005)(336012)(11346002)(36756003)(47776003)(65956001)(65806001)(426003)(26005)(23676004)(7736002)(76176011)(53546011)(2501003)(2486003)(16526019)(186003)(110136005)(65826007)(14444005)(16576012)(81156014)(81166006)(3846002)(58126008)(6116002)(316002)(229853002)(8936002)(68736007)(67846002)(53936002)(6246003)(70586007)(70206006)(356004)(2906002)(6666004)(486006)(2870700001)(8676002)(64126003)(50466002)(31696002)(31686004)(5660300002)(478600001)(476003)(2616005)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1921; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 285cd8f8-d37d-470c-5a67-08d70c237590
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR12MB1921; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1921:
X-Microsoft-Antispam-PRVS: <BN6PR12MB19215C54A3D576BB93B521DDB4CB0@BN6PR12MB1921.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 01039C93E4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: T2LyHenphun0VQ1yA37ueUD6x0rXSThDGx5pmZ6hocOK8jP3dwvbXU1BxX0Y4cECfVxWdz9NdE4Uuq5LFjxfqPj62fGJRnnmbhYokEVo286ZP6DCTs4olwvUQ4nkJXuTTF4wnIXM4tv0nE+o1jZGUGPiSg6yNIdEBGW2OhcO6wwaq4/D9qY4qlYgTCTYyKrQZtl1AJdEe84rSt+fOd5p9baGfq9Lh1gOJnd6IClSv5sXjchGNV6imdw96SsThLkW+HoYZRLAZLAHjC/HbzI2x0HhI+UT0TOjp+fEQjGe//Lu19ZXT7Nl1AlD7zL7KTBzdtiEzigZqss5IKNfmfxmWx1hBln1O4jfKwOAk9nBrK9cgPDwPpnJhEPKieIfmMLNIlERjnE9FHwLi4WQTvYS7mGUFiGJOqIAsqgEiiIl858=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2019 08:31:12.4421 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 285cd8f8-d37d-470c-5a67-08d70c237590
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1921
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ucpn0NAhn0yTjyR6KSdem6JDrUYgysZvZIU3Ku7eiI=;
 b=QGI6A3H17E8Ic5+woc9VmlZqCAlgqUVJv6SxVQLaC0ja7K/SOu+Ejn6n/U4k2LLiHBzFU/M2qtgchbX9fcX7TsalT7iQDSCoCXt/CHDxvwHYwWiQ9DLOTsIUkPd2/WgmPcmlaSvNhfinB2V7DuWThHjXqKI3nfS5unRQprGCwIo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=permerror action=none header.from=amd.com;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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

CgpPbiAyMDE55bm0MDfmnIgxOeaXpSAxNjoxMywgTGlvbmVsIExhbmR3ZXJsaW4gd3JvdGU6Cj4g
T24gMTgvMDcvMjAxOSAxNzozMywgQ2h1bm1pbmcgWmhvdSB3cm90ZToKPj4g5ZyoIDIwMTkvNy8x
OCAyMjowOCwgTGlvbmVsIExhbmR3ZXJsaW4g5YaZ6YGTOgo+Pj4gT24gMTgvMDcvMjAxOSAxNjow
MiwgQ2h1bm1pbmcgWmhvdSB3cm90ZToKPj4+PiDlnKggMjAxOS83LzE4IDE5OjMxLCBMaW9uZWwg
TGFuZHdlcmxpbiDlhpnpgZM6Cj4+Pj4+IE9uIDE4LzA3LzIwMTkgMTQ6MTMsIENodW5taW5nIFpo
b3Ugd3JvdGU6Cj4+Pj4+PiBpZiBXQUlUX0ZPUl9TVUJNSVQgaXNuJ3Qgc2V0IGFuZCBpbiB0aGUg
bWVhbndoaWxlIG5vIHVuZGVybHlpbmcgCj4+Pj4+PiBmZW5jZQo+Pj4+Pj4gb24gc3luY29iaiwK
Pj4+Pj4+IHRoZW4gcmV0dXJuIG5vbi1ibG9jayBlcnJvciBjb2RlIHRvIHVzZXIgc2FwY2UuCj4+
Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2h1bm1pbmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1k
LmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4gwqDCoMKgIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29i
ai5jIHwgNCArKy0tCj4+Pj4+PiDCoMKgwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9zeW5jb2JqLmMKPj4+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMK
Pj4+Pj4+IGluZGV4IDM2MWEwMWEwOGMxOC4uOTI5ZjdjNjRmOWEyIDEwMDY0NAo+Pj4+Pj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKPj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fc3luY29iai5jCj4+Pj4+PiBAQCAtMjUyLDcgKzI1Miw3IEBAIGludCBkcm1fc3lu
Y29ial9maW5kX2ZlbmNlKHN0cnVjdCBkcm1fZmlsZQo+Pj4+Pj4gKmZpbGVfcHJpdmF0ZSwKPj4+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZG1hX2ZlbmNlX3B1dCgqZmVuY2UpOwo+Pj4+Pj4gwqDCoMKgwqDC
oMKgwqAgfSBlbHNlIHsKPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCByZXQgPSAtRUlOVkFMOwo+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9IC1FTk9UQkxLOwo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAg
fQo+Pj4+Pj4gwqDCoMKgIMKgwqDCoMKgwqAgaWYgKCEoZmxhZ3MgJiBEUk1fU1lOQ09CSl9XQUlU
X0ZMQUdTX1dBSVRfRk9SX1NVQk1JVCkpCj4+Pj4+PiBAQCAtODMyLDcgKzgzMiw3IEBAIHN0YXRp
YyBzaWduZWQgbG9uZwo+Pj4+Pj4gZHJtX3N5bmNvYmpfYXJyYXlfd2FpdF90aW1lb3V0KHN0cnVj
dCBkcm1fc3luY29iaiAqKnN5bmNvYmpzLAo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGlmIChmbGFncyAmIAo+Pj4+Pj4gRFJNX1NZTkNPQkpfV0FJVF9GTEFHU19XQUlUX0ZP
Ul9TVUJNSVQpIHsKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNvbnRpbnVlOwo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7
Cj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRpbWVvdXQgPSAtRUlOVkFM
Owo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0aW1lb3V0ID0gLUVOT1RC
TEs7Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGNs
ZWFudXBfZW50cmllczsKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+Pj4gVGhpcyB3b3VsZCBicmVhayBleGlz
dGluZyB0ZXN0cyBmb3IgYmluYXJ5IHN5bmNvYmpzLgo+Pj4+IEhvdyBkb2VzIHRoaXMgYnJlYWtz
IGJpbmFyeSBzeW5jb2JqPwo+Pj4KPj4+IFRoaXMgaXMgdXNlZCBpbiB0aGUgc3VibWlzc2lvbiBw
YXRoIG9mIHNldmVyYWwgZHJpdmVycy4KPj4+Cj4+PiBDaGFuZ2luZyB0aGUgZXJyb3IgY29kZSB3
aWxsIGNoYW5nZSB3aGF0IHRoZSBkcml2ZXJzIGFyZSByZXBvcnRpbmcgdG8KPj4+IHVzZXJzcGFj
ZSBhbmQgY291bGQgYnJlYWsgdGVzdHMuCj4+Pgo+Pj4KPj4+IGk5MTUgZG9lc24ndCB1c2UgdGhh
dCBmdW5jdGlvbiBzbyBpdCdzIG5vdCBhZmZlY3RlZCBidXQKPj4+IGxpbWEvcGFuZnJvc3QvdmM0
IHNlZW0gdG8gYmUuCj4+Cj4+IGFueW9uZSBmcm9tIHZjNCBjYW4gY29uZmlybSB0aGlzPyBUaGVy
ZSBhcmUgbWFueSBwbGFjZSBpbiB3YWl0X2lvY3RsCj4+IGJlaW5nIGFibGUgdG8gcmV0dXJuIHBy
ZXZpb3VzIEVJTlZBTCwgbm90IHN1cmUgd2hhdCB0aGV5IHVzZSB0by4KPj4KPj4KPj4+Cj4+Pj4K
Pj4+Pj4gSXMgdGhpcyByZWFsbHkgd2hhdCB3ZSB3YW50Pwo+Pj4+IEkgd2FudCB0byB1c2UgdGhp
cyBtZWFuaW5nZnVsIHJldHVybiB2YWx1ZSB0byBqdWRnZSBpZiAKPj4+PiBXYWl0QmVmb3JlU2ln
bmFsCj4+Pj4gaGFwcGVucy4KPj4+Pgo+Pj4+IEkgdGhpbmsgdGhpcyBpcyB0aGUgY2hlYXBlc3Qg
Y2hhbmdlIGZvciB0aGF0Lgo+Pj4KPj4+IEkgdGhvdWdodCB0aGUgcGxhbiB3YXMgdG8gYWRkIGEg
bmV3IGlvY3RsIHRvIHF1ZXJ5IHRoZSBsYXN0IHN1Ym1pdHRlZAo+Pj4gdmFsdWUuCj4+IFllcywg
dGhhdCBpcyBvcHRpb25hbCB3YXkgdG9vLsKgIEkganVzdCB0aG91Z2h0IGNoYW5naW5nIHJldHVy
biB2YWx1ZSBpcwo+PiB2ZXJ5IGNoZWFwLCBpc24ndCBpdD8KPj4KPj4KPj4gLURhdmlkCj4KPgo+
IEkgY291bGQgYmUgbWlzZ3VpZGVkIGJ1dCBJIHRob3VnaHQgdGhlIGtlcm5lbCBwb2xpY3kgd2Fz
IHRvIG5ldmVyIAo+IGJyZWFrIHVzZXJzcGFjZS4KQnV0IG5vIG9uZSBleGFjdGx5IHBvaW50cyBo
b3cgdG8gYnJlYWsgdXNlcnNwYWNlLCBkb2Vzbid0IGl0PwoKLURhdmlkCj4KPiBJJ20gbm90IHN1
cmUgd2hlcmUgdGhpcyBzaXRzIDovCj4KPgo+IC1MaW9uZWwKPgo+Cj4+Cj4+PiBEaWQgSSBtaXN1
bmRlcnN0YW5kPwo+Pj4KPj4+Cj4+PiBUaGFua3MsCj4+Pgo+Pj4KPj4+IC1MaW9uZWwKPj4+Cj4+
Pgo+Pj4+IC1EYXZpZAo+Pj4+Cj4+Pj4KPj4+Pj4gLUxpb25lbAo+Pj4+Pgo+Pj4+Pgo+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
