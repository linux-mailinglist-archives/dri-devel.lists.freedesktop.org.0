Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C62D910EFF8
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:24:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880BF89D4A;
	Mon,  2 Dec 2019 19:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790074.outbound.protection.outlook.com [40.107.79.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C2889D46;
 Mon,  2 Dec 2019 19:24:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIUPd+kTL8+aZ5x6bKGE7VSVkkRZE6AWLaIFO9BxJcddeGWxSx1jiQRzveJb9aDwQN2X3FleSkOd+SskbVHuCqeYW20JAnpYHyP5zlSdduwss6eIV0eP0EmIZ5QClWw8RkKzHIsCwg5zcC988XwJU65YG0g044x4Gnh2u36Sug9xZyUmhjQiEL2zTI8kMxxvDopHl+hzXTqGPmZwf6oF6ujlJUnqi1EZwEfXpBvDTr3CKeC3MrXjtLGH1RKcdIFwHg3LuU43DCpzzHxRNHZqAdbVoShJ6b4MwATHyC2oBUOspy+dD4CmQ4OPPsGpoFwUoVeKBUe3oRI31TnjmtWNyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNBuC/v2o7WtohL0ByXeOw46b7uH3c8PJkYS6uFrX40=;
 b=Q5KdkR4gqWq7/KKR1gRh8rb2eLrynxh3mbr0Z6XpHiocFjLBwER4AHkKYaENef1DJrEY5C2AIKqmH3TAZL0RQr1vDrsCZG//pyyxLYXk31V3wpAZ+AOl6FlmULdS8mShP6sEzKXDvS/r/QwqTl4vD8mrfIRLkg/pPfD3nThJLBURCFCQItxQgyF8L0az2bYt+YA6Yaihmg5xRxZb9WV4DbFnrlrXYG4iWvHkJdaOpNF8+tpIhwVOw3TYem83Y8y7nRDXjE3Cz/ClWVmq6Y8Alvc2Pkj2brxQV7J0bkOzwADiN5gxk8y/nuwff47usxQ5bOv7XPNTJjgh6IODf6c/zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2975.namprd12.prod.outlook.com (20.178.243.142) by
 MN2PR12MB4015.namprd12.prod.outlook.com (10.255.239.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Mon, 2 Dec 2019 19:24:25 +0000
Received: from MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::851c:eebf:b936:20fd]) by MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::851c:eebf:b936:20fd%4]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 19:24:25 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
Subject: RE: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
Thread-Topic: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
Thread-Index: AQHVo9IhnWBRQA7TSUuQ4gUMKSHN+6edlxiAgACX24CACRV/kA==
Date: Mon, 2 Dec 2019 19:24:25 +0000
Message-ID: <MN2PR12MB2975F38D8FB87D9812E0B0C88F430@MN2PR12MB2975.namprd12.prod.outlook.com>
References: <1574715089-14875-1-git-send-email-andrey.grodzovsky@amd.com>
 <b8b716a7-e235-38b2-ea6d-0a21881fa64e@amd.com>
 <MN2PR12MB2975CA8858F21FDF325C33FE8F440@MN2PR12MB2975.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB2975CA8858F21FDF325C33FE8F440@MN2PR12MB2975.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2019-11-27T00:41:12Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=78c0a9f3-10d3-46c5-88f1-0000d774a655;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2019-12-02T19:24:22Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 4982744a-e797-4a9d-9158-0000795f7bee
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
x-originating-ip: [165.204.53.123]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 47919d85-42af-4f29-3742-08d7775d3e0c
x-ms-traffictypediagnostic: MN2PR12MB4015:|MN2PR12MB4015:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB40151037152DD934B90E43D38F430@MN2PR12MB4015.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(199004)(189003)(13464003)(66066001)(446003)(11346002)(14454004)(102836004)(14444005)(256004)(305945005)(76116006)(66946007)(66476007)(66556008)(64756008)(66446008)(52536014)(6862004)(5660300002)(478600001)(4326008)(66574012)(26005)(6246003)(186003)(54906003)(99286004)(6436002)(8676002)(316002)(25786009)(6506007)(6636002)(7736002)(55016002)(9686003)(7696005)(2906002)(76176011)(6116002)(3846002)(74316002)(86362001)(33656002)(8936002)(81156014)(81166006)(71190400001)(229853002)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4015;
 H:MN2PR12MB2975.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z1qptLE3HAhLHSfr4kC80vT8YVnN8OqPwX8FUnHL4zlwJCP8c7B4iWVTBCq+VFMMrK8A5DVVwOlm5A3MJ8A4uSmbKYPbZkaqNaREevIl0XHxycj4AJ8qHWBhZA+1lg/lHFOM/b3R203xN11ixCxwypUSk8sPU3f1N8xmxBbKeT3O33M+AGDk8cmRIiEKka9gzzBfB83Qc0H53FC1+105T0VoAFFmeOWkkGX5B+FuxEyw22RD/KABgFpo82oxM73zQbc53jhXfBKilN9OR6hCOrocrfGn6XJNibJUtohdnbcPThwapl7SDuQprxlolXd9P7n1lFmCmEG6BVGY3oEl9hg5QJHaqhmqqR7Zi3fkz6ZpllQyD98OVq2Ma44H/llS63zYDN4SMBbNGLqDsuCZNAly2SsH2L8/1rkBsdsjNud/4mf/Mizau7W1QPScvN0D
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47919d85-42af-4f29-3742-08d7775d3e0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 19:24:25.1187 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nZF14g1fC1cgWwRmwyLqLltcM/AWd32r5Jxq3YsPUl+yenooBmgLKMS+ovH4FBQs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4015
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNBuC/v2o7WtohL0ByXeOw46b7uH3c8PJkYS6uFrX40=;
 b=BwOAYVtsUj8eoBdAwBp+p4f0tiCAmMS25Rvb2aqr81CFc1e/EM4y1R7YvDkUSrrTaAIcwyUF8EndgtE5fXpsPqDGqJwfydNflZJM7gJybpHhtTBEMKoS2WqTsf5PsUktpOanzSGObjN8G2vxbphIwH1VdEbKpN1SvEWGEmmfoI0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Emily.Deng@amd.com; 
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
Cc: "steven.price@arm.com" <steven.price@arm.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KDQpI
aSBBbmRyZXksDQogICAgU2VlbXMgdGhpcyBwYXRjaCBpcyBzdGlsbCBub3QgaW4gYW1kLXN0YWdp
bmctZHJtLW5leHQ/DQoNCkJlc3Qgd2lzaGVzDQpFbWlseSBEZW5nDQoNCg0KDQo+LS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBEZW5nLCBFbWlseQ0KPlNlbnQ6IFR1ZXNkYXksIE5v
dmVtYmVyIDI2LCAyMDE5IDQ6NDEgUE0NCj5UbzogR3JvZHpvdnNreSwgQW5kcmV5IDxBbmRyZXku
R3JvZHpvdnNreUBhbWQuY29tPg0KPkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgS29lbmlnLA0KPkNocmlzdGlhbiA8Q2hy
aXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgc3RldmVuLnByaWNlQGFybS5jb20NCj5TdWJqZWN0OiBS
RTogW1BBVENIIHY0XSBkcm0vc2NoZWR1bGVyOiBBdm9pZCBhY2Nlc3NpbmcgZnJlZWQgYmFkIGpv
Yi4NCj4NCj5bQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gSW50ZXJuYWwgRGlzdHJpYnV0aW9uIE9u
bHldDQo+DQo+UmV2aWV3ZWQtYnk6IEVtaWx5IERlbmcgPEVtaWx5LkRlbmdAYW1kLmNvbT4NCj4N
Cj4+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+RnJvbTogR3JvZHpvdnNreSwgQW5kcmV5
IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQuY29tPg0KPj5TZW50OiBUdWVzZGF5LCBOb3ZlbWJlciAy
NiwgMjAxOSA3OjM3IEFNDQo+PkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4+S29lbmlnLCBDaHJpc3RpYW4gPENocmlz
dGlhbi5Lb2VuaWdAYW1kLmNvbT47IERlbmcsIEVtaWx5DQo+PjxFbWlseS5EZW5nQGFtZC5jb20+
OyBzdGV2ZW4ucHJpY2VAYXJtLmNvbQ0KPj5TdWJqZWN0OiBSZTogW1BBVENIIHY0XSBkcm0vc2No
ZWR1bGVyOiBBdm9pZCBhY2Nlc3NpbmcgZnJlZWQgYmFkIGpvYi4NCj4+DQo+PlBpbmcNCj4+DQo+
PkFuZHJleQ0KPj4NCj4+T24gMTEvMjUvMTkgMzo1MSBQTSwgQW5kcmV5IEdyb2R6b3Zza3kgd3Jv
dGU6DQo+Pj4gUHJvYmxlbToNCj4+PiBEdWUgdG8gYSByYWNlIGJldHdlZW4gZHJtX3NjaGVkX2Ns
ZWFudXBfam9icyBpbiBzY2hlZCB0aHJlYWQgYW5kDQo+Pj4gZHJtX3NjaGVkX2pvYl90aW1lZG91
dCBpbiB0aW1lb3V0IHdvcmsgdGhlcmUgaXMgYSBwb3NzaWJsaXR5IHRoYXQgYmFkDQo+Pj4gam9i
IHdhcyBhbHJlYWR5IGZyZWVkIHdoaWxlIHN0aWxsIGJlaW5nIGFjY2Vzc2VkIGZyb20gdGhlIHRp
bWVvdXQNCj4+PiB0aHJlYWQuDQo+Pj4NCj4+PiBGaXg6DQo+Pj4gSW5zdGVhZCBvZiBqdXN0IHBl
ZWtpbmcgYXQgdGhlIGJhZCBqb2IgaW4gdGhlIG1pcnJvciBsaXN0IHJlbW92ZSBpdA0KPj4+IGZy
b20gdGhlIGxpc3QgdW5kZXIgbG9jayBhbmQgdGhlbiBwdXQgaXQgYmFjayBsYXRlciB3aGVuIHdl
IGFyZQ0KPj4+IGdhcmFudGVlZCBubyByYWNlIHdpdGggbWFpbiBzY2hlZCB0aHJlYWQgaXMgcG9z
c2libGUgd2hpY2ggaXMgYWZ0ZXINCj4+PiB0aGUgdGhyZWFkIGlzIHBhcmtlZC4NCj4+Pg0KPj4+
IHYyOiBMb2NrIGFyb3VuZCBwcm9jZXNzaW5nIHJpbmdfbWlycm9yX2xpc3QgaW4gZHJtX3NjaGVk
X2NsZWFudXBfam9icy4NCj4+Pg0KPj4+IHYzOiBSZWJhc2Ugb24gdG9wIG9mIGRybS1taXNjLW5l
eHQuIHYyIGlzIG5vdCBuZWVkZWQgYW55bW9yZSBhcw0KPj4+IGRybV9zY2hlZF9nZXRfY2xlYW51
cF9qb2IgYWxyZWFkeSBoYXMgYSBsb2NrIHRoZXJlLg0KPj4+DQo+Pj4gdjQ6IEZpeCBjb21tZW50
cyB0byByZWxmZWN0IGxhdGVzdCBjb2RlIGluIGRybS1taXNjLg0KPj4+DQo+Pj4gU2lnbmVkLW9m
Zi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+DQo+Pj4g
UmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4N
Cj4+PiBUZXN0ZWQtYnk6IEVtaWx5IERlbmcgPEVtaWx5LkRlbmdAYW1kLmNvbT4NCj4+PiAtLS0N
Cj4+PiAgIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIHwgMjcNCj4+Kysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0
aW9ucygrKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIv
c2NoZWRfbWFpbi5jDQo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4u
Yw0KPj4+IGluZGV4IDY3NzQ5NTUuLjFiZjljNDAgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
c2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPj4+IEBAIC0yODQsMTAgKzI4NCwyMSBAQCBzdGF0aWMg
dm9pZCBkcm1fc2NoZWRfam9iX3RpbWVkb3V0KHN0cnVjdA0KPj53b3JrX3N0cnVjdCAqd29yaykN
Cj4+PiAgIAl1bnNpZ25lZCBsb25nIGZsYWdzOw0KPj4+DQo+Pj4gICAJc2NoZWQgPSBjb250YWlu
ZXJfb2Yod29yaywgc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyLA0KPj4+IHdvcmtfdGRyLndvcmsp
Ow0KPj4+ICsNCj4+PiArCS8qIFByb3RlY3RzIGFnYWluc3QgY29uY3VycmVudCBkZWxldGlvbiBp
bg0KPj5kcm1fc2NoZWRfZ2V0X2NsZWFudXBfam9iICovDQo+Pj4gKwlzcGluX2xvY2tfaXJxc2F2
ZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsNCj4+PiAgIAlqb2IgPSBsaXN0X2ZpcnN0
X2VudHJ5X29yX251bGwoJnNjaGVkLT5yaW5nX21pcnJvcl9saXN0LA0KPj4+ICAgCQkJCSAgICAg
ICBzdHJ1Y3QgZHJtX3NjaGVkX2pvYiwgbm9kZSk7DQo+Pj4NCj4+PiAgIAlpZiAoam9iKSB7DQo+
Pj4gKwkJLyoNCj4+PiArCQkgKiBSZW1vdmUgdGhlIGJhZCBqb2Igc28gaXQgY2Fubm90IGJlIGZy
ZWVkIGJ5IGNvbmN1cnJlbnQNCj4+PiArCQkgKiBkcm1fc2NoZWRfY2xlYW51cF9qb2JzLiBJdCB3
aWxsIGJlIHJlaW5zZXJ0ZWQgYmFjayBhZnRlcg0KPj5zY2hlZC0+dGhyZWFkDQo+Pj4gKwkJICog
aXMgcGFya2VkIGF0IHdoaWNoIHBvaW50IGl0J3Mgc2FmZS4NCj4+PiArCQkgKi8NCj4+PiArCQls
aXN0X2RlbF9pbml0KCZqb2ItPm5vZGUpOw0KPj4+ICsJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUo
JnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7DQo+Pj4gKw0KPj4+ICAgCQlqb2ItPnNjaGVk
LT5vcHMtPnRpbWVkb3V0X2pvYihqb2IpOw0KPj4+DQo+Pj4gICAJCS8qDQo+Pj4gQEAgLTI5OCw2
ICszMDksOCBAQCBzdGF0aWMgdm9pZCBkcm1fc2NoZWRfam9iX3RpbWVkb3V0KHN0cnVjdA0KPj53
b3JrX3N0cnVjdCAqd29yaykNCj4+PiAgIAkJCWpvYi0+c2NoZWQtPm9wcy0+ZnJlZV9qb2Ioam9i
KTsNCj4+PiAgIAkJCXNjaGVkLT5mcmVlX2d1aWx0eSA9IGZhbHNlOw0KPj4+ICAgCQl9DQo+Pj4g
Kwl9IGVsc2Ugew0KPj4+ICsJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnNjaGVkLT5qb2JfbGlz
dF9sb2NrLCBmbGFncyk7DQo+Pj4gICAJfQ0KPj4+DQo+Pj4gICAJc3Bpbl9sb2NrX2lycXNhdmUo
JnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7IEBAIC0zNzAsNiArMzgzLDIwDQo+Pj4gQEAg
dm9pZCBkcm1fc2NoZWRfc3RvcChzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkLCBzdHJ1
Y3QNCj4+ZHJtX3NjaGVkX2pvYiAqYmFkKQ0KPj4+ICAgCWt0aHJlYWRfcGFyayhzY2hlZC0+dGhy
ZWFkKTsNCj4+Pg0KPj4+ICAgCS8qDQo+Pj4gKwkgKiBSZWluc2VydCBiYWNrIHRoZSBiYWQgam9i
IGhlcmUgLSBub3cgaXQncyBzYWZlIGFzDQo+Pj4gKwkgKiBkcm1fc2NoZWRfZ2V0X2NsZWFudXBf
am9iIGNhbm5vdCByYWNlIGFnYWluc3QgdXMgYW5kIHJlbGVhc2UgdGhlDQo+Pj4gKwkgKiBiYWQg
am9iIGF0IHRoaXMgcG9pbnQgLSB3ZSBwYXJrZWQgKHdhaXRlZCBmb3IpIGFueSBpbiBwcm9ncmVz
cw0KPj4+ICsJICogKGVhcmxpZXIpIGNsZWFudXBzIGFuZCBkcm1fc2NoZWRfZ2V0X2NsZWFudXBf
am9iIHdpbGwgbm90IGJlDQo+PmNhbGxlZA0KPj4+ICsJICogbm93IHVudGlsIHRoZSBzY2hlZHVs
ZXIgdGhyZWFkIGlzIHVucGFya2VkLg0KPj4+ICsJICovDQo+Pj4gKwlpZiAoYmFkICYmIGJhZC0+
c2NoZWQgPT0gc2NoZWQpDQo+Pj4gKwkJLyoNCj4+PiArCQkgKiBBZGQgYXQgdGhlIGhlYWQgb2Yg
dGhlIHF1ZXVlIHRvIHJlZmxlY3QgaXQgd2FzIHRoZSBlYXJsaWVzdA0KPj4+ICsJCSAqIGpvYiBl
eHRyYWN0ZWQuDQo+Pj4gKwkJICovDQo+Pj4gKwkJbGlzdF9hZGQoJmJhZC0+bm9kZSwgJnNjaGVk
LT5yaW5nX21pcnJvcl9saXN0KTsNCj4+PiArDQo+Pj4gKwkvKg0KPj4+ICAgCSAqIEl0ZXJhdGUg
dGhlIGpvYiBsaXN0IGZyb20gbGF0ZXIgdG8gIGVhcmxpZXIgb25lIGFuZCBlaXRoZXIgZGVhY3Rp
dmUNCj4+PiAgIAkgKiB0aGVpciBIVyBjYWxsYmFja3Mgb3IgcmVtb3ZlIHRoZW0gZnJvbSBtaXJy
b3IgbGlzdCBpZiB0aGV5IGFscmVhZHkNCj4+PiAgIAkgKiBzaWduYWxlZC4NCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
