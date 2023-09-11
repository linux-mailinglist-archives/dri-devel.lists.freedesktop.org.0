Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B467479A834
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 15:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30F410E2F3;
	Mon, 11 Sep 2023 13:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CBC10E2F3;
 Mon, 11 Sep 2023 13:13:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TR+bArBYyGNkjeWav50rlNhUyeHL+PpvKPHW1Nu9Mk4iOzsqA4jlaSccMQI+X7hBw/1nsePbfp6bkmToCnTMTHA/w9dIkgva3eJRfG97Y44olU4yzjVhtClTnaxa+rUy6zpTGM8W18DH+JsvOSpb3v3EJ2C9MPPN+U6woVEH8KoLPxB0S1FPFzVIerFzrkTkUHFNhIa+j5OWt2b1mNN6B1LAaZmxooCXamLsnLXtpmLCf69XI72TEBvz8TZNTSGv1vJWxhCXA0YMafCpRaDXEhfu8GXULnYjSawibAwPbtqclLG4772Rl/tXnK8zNcQiXpEm2Pfph4IYGiSgO+POpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQshHsJVCBz68e6TzJ6QMDlC5zu28yQOUVDHnLwnmnA=;
 b=dy1BHO3Cdk5XVmVFkxpQ4Ho8Llyt1D6Rz6Pt5K4hmjjYNjrC7ew+Pk7gnY209MoLQ2fFTdVPwrNktdu8NSDG8aiqTh5yKyRY2W+Cp7R65uwvkm23Y8WaBP+2j/tionkTB0QotqYYhqmGjYnNUraR8MeP+jhI/2Rl7+k0nq/wBhrZ5QSm4URDU/gDfaCVqZXjzO/F3SUYNFPeUQ4wUtCsOtawWxdkI3cjDpxweSmXAkrJ/aKUNBl5yNxx/7dB0BOhqmrgjT4Hw2mT404KkXU4KPffTEBGqXPcmAcLgrFkIETtfJpNhFOuk1MDGBdMXGRHaZ4E/s5685N4pYB9F391qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQshHsJVCBz68e6TzJ6QMDlC5zu28yQOUVDHnLwnmnA=;
 b=ou22cBVbg2ZAcME3B3YEXRgpouJ5FuKA08R6mfD3TkEjSrQI1SeBzy5lRDzYn7eRu21ZWxiXwmi23zqZTEd97qRRxbIhUWcsYJtxAEKiyr9fS+0IvG1y1XiHxMSV+/pYBo8xc/pXvZR+JpnARWHCv3xgwvsq2BB16DbyW7h4AJM=
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by BN9PR12MB5210.namprd12.prod.outlook.com (2603:10b6:408:11b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 13:13:28 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86%3]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 13:13:27 +0000
From: "Sharma, Shashank" <Shashank.Sharma@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 =?utf-8?B?QW5kcsOpIEFsbWVpZGE=?= <andrealmeid@igalia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 1/5] drm/amdgpu: Allocate coredump memory in a
 nonblocking way
Thread-Topic: [PATCH v6 1/5] drm/amdgpu: Allocate coredump memory in a
 nonblocking way
Thread-Index: AQHZ5F82qJ0nSbk17kC9ALrdxBJq37AVeaOAgAAhB4A=
Date: Mon, 11 Sep 2023 13:13:27 +0000
Message-ID: <MW4PR12MB5667BFFD978A330AD51E579CF2F2A@MW4PR12MB5667.namprd12.prod.outlook.com>
References: <20230911030018.73540-1-andrealmeid@igalia.com>
 <20230911030018.73540-2-andrealmeid@igalia.com>
 <4a6622b8-231e-74fc-f558-0f124b851308@amd.com>
In-Reply-To: <4a6622b8-231e-74fc-f558-0f124b851308@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=b827f38d-a74a-43d9-9bce-cd7607253397;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-09-11T13:13:07Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB5667:EE_|BN9PR12MB5210:EE_
x-ms-office365-filtering-correlation-id: 987cdc49-6cf9-410b-023f-08dbb2c8e320
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9Q3ZL40+CjrNq4m0mVvUz/Pk+SYPyQDmvXOfVbS2aEvPe5CBZOhcG563vVxefbPTPLS0v3i6l8MOIcYCkaXegVzWjcXen7huPiM2/yfnEoDjE0XFImar1RtT/oKId4oNHojxNQtPZFiUep31T2fNKVPqJATPShUOPpiECpO2Yk9G0ESSfSh81quHzxgfC1gLngpGR0eHXFSM41fbvYwvEN+YI980ua8xkGfkSSnoM6W4aNmSdEHKyFeaL+g8/kSNKnc6Iro2EruaZA6nVQhHFS3S5BFb5Nxk/VKx2dXZo3SqoGnBJcDL3KplvHDT5ao10XwISSwGGV8Um2m8bOV3PpbjTDOxd2cC4B7cJT7l8lDniWfzfxyUnFyn2ZbM9xrb10HR4lVSWiy4nFGG72gDvn8lqg97moEvdwTFiXfzKfMAZwAbHwUy8BF1eWfqmbwHpqVf02NM7Q0j0YMKzdMuasaAnmLRA7fs/fhHFSZ+b4lKnw1Wu5VqdqyFCbFa4o9CGW9jSHVNVXiE05+LtB9cyopkXwc3A1ymB+Vqk7X8165iJodN/Si5fGb3396oESJWNWjaqutGmmHnhgLWHO4lVX5WRgVrbSrzkAdYQH83DDwz15oUXbSH27vINA00iIzA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(39860400002)(366004)(396003)(186009)(451199024)(1800799009)(6506007)(7696005)(53546011)(9686003)(71200400001)(83380400001)(122000001)(86362001)(33656002)(38100700002)(38070700005)(66574015)(55016003)(26005)(52536014)(316002)(41300700001)(8936002)(4326008)(2906002)(76116006)(8676002)(66946007)(54906003)(478600001)(66556008)(66446008)(66476007)(64756008)(110136005)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?alB2eE1IUEh4dDJ3WHgrbzhFSzFLMzhrbmp1ZW5jRDZzT2pMaTcwVU5lRHMv?=
 =?utf-8?B?VFlIUE9qem51Uk9aTTR6YysydVVNdDdRcjhuLzhVN1RVYTUwd2h1SXc4VW51?=
 =?utf-8?B?b0FUTloxalFEUmI0V2Rpc3JaUzEweVdieHdTUVd5bi9CVmRqdmhtclVKNXcz?=
 =?utf-8?B?aHE1UVVwdkxwOTdYQjZhamFqS01LVUk1REM3NHdpTWt2dUtWSiszZUVVdDhE?=
 =?utf-8?B?NGd6Y1hzb2M0SW56MFNkS3NLaTZhdm9jM0pDNEpoK3Y1NE9reklucGthbjll?=
 =?utf-8?B?dVROK3EzT1M0OXh5YjQ4emxjeWxSNWhaeEZiU3g4dkFoOTJ1V2hpREM5YUYw?=
 =?utf-8?B?T1J0cU8vd0kxem5vSkFqay9kRmtsaFZpM3psbDVrM0RRR2Ivd2I1WUdDdVJC?=
 =?utf-8?B?bmtOZ09qSFBrbnc0bTBkU1ZFZXV3YjlSU2lKckRxVXdMdVFrOVJvQ1RFRSty?=
 =?utf-8?B?emNoZzF3V0ovenVjM3VlM2czcDByalNvYVlYSnFONDAzUlg4N0J6MSthSXZj?=
 =?utf-8?B?UDJLM0VNQ3dHZ0NQdXNkV0RmOUh0OEVDb09uMWZzOXNVV1Z2OTFRMk1BeExU?=
 =?utf-8?B?QWlWS3dxSU5TNTMvU25JNVJ3QWxOUmtjaVFZbjZnTlQxU0lJbnkvam82Q1hU?=
 =?utf-8?B?SVhjQTFEcWUvUHozc1ZnODUxeUp2UWpLRFBKc1NZdytKQWgzZXdGREdwUGJS?=
 =?utf-8?B?UWM1OFF3bXB2YVhFRmVlQ0R5allXSnNLOU5sUWlqZDRIeVgzQ3I1SXdaYjg5?=
 =?utf-8?B?UXVNRVZiTXhmZFpxSmcwWHdzR0F6T1FCcU1xNkx4WTRxTC9pbVU0a00xN0U5?=
 =?utf-8?B?d3ExdU5odnVlODhjbTlreG1GY2tZNmY5emlWSVBVZE5aN0prbW5DMWdDUlZ1?=
 =?utf-8?B?VDZOelFleVRVSWVmRjBkZnJmcGNVNzNtcUdmQ1VNT0c5aFpyRmVKWXF5OGxE?=
 =?utf-8?B?UVpxL2dvZHArb1Z0YXFxUWpDTFlyTk1vMXVETXRGaG5VQ25UcDBkaTFIV0Qv?=
 =?utf-8?B?TXpFa3hpdlp2b0grYzQrajh0NHBkaG1DZDdQR0F3MUZqU0xVeGdHdW9pNXpq?=
 =?utf-8?B?bjlKby9ZcmZzYUs4VGt2N1ZwSm84VVAzWE5wT01ESDZFZWVMaVJVNWI4UUFQ?=
 =?utf-8?B?V3RtZ3p1T3BBUlF4NHFEQ0t6ZjdYQU5sZ2I1cXltNUFXVzcwRHBFOUpQeVNG?=
 =?utf-8?B?Vm82bXMvSDFNNzI0citkUko1RVkzVlZjQ1ZYNWVlczlnR3lSbmM2ak8rOW1x?=
 =?utf-8?B?ZHFrREpwT09LWTNybzFLYi9nTGRySDl6S3N2OVV1L3lSRUF1R25jS3VSYlY5?=
 =?utf-8?B?OHFIZlpMeXMyZnA1ZmdkenpMNmtERzBJNGJiQW85d0FSTmFlZDQ3NWd4RStk?=
 =?utf-8?B?TkN4TGFtcXJtRDJOT0dQeUVsbTIzTWc0eFJyRUw5QWs4cElyNzFtczBOL2dG?=
 =?utf-8?B?cE1pTHNvbFpoSzUrQTE5RU1UVjBKSEFsL3hsMlp5OGNlQjlKWGtKQ0lwY2N3?=
 =?utf-8?B?djZIdGZtRkY5R0o4TEJHYmRHOXEzWC96cHpjdE42RUFGVU1nVlpyNXVRV3hk?=
 =?utf-8?B?ZGZoUjJrbytkN2RzNWNsRDJHUW5GcjJlb3pTZ2NnNVJjOXJhV3FNZGtPRXYv?=
 =?utf-8?B?dm1rWlAzQ1RZS3Iwcnd6TmE3TzAzeFRMbTZ5Z3BMeERXNlZyQkwxenR6MFE3?=
 =?utf-8?B?dlgySVY2amJ1bVBTa2R6YlVDTHlPZ0Q2bFBTVUw2NzJQMUxhaE94dTdReklT?=
 =?utf-8?B?cUtCVkhBMlNDbGVLRmx0dFhaZkEvZ2R3bHQ2NGFNQXZyL1c3OWhFREtyOHJa?=
 =?utf-8?B?YzNzNEgweTFTeTgrNURCL2F0T1hEdTBsRFlpempITnpxMlBWaXBXeEg2ZGE0?=
 =?utf-8?B?SkZMQ3VqMlVERUNvRjZQakh1UVhJWGRKQVFHbE1EbTlGWE4rNzZMQy9zRU5i?=
 =?utf-8?B?c2lPU245bGlSeTZXaUxocldGbVpLOE5JT0pVRFRwa2pSNlBsOHlneTUwdUxO?=
 =?utf-8?B?WGlPRUpZa2dxZEhxaEdtdWFEc1NJMHVUWDJzdk1FclNUZm5hUmFnaTlUZkly?=
 =?utf-8?B?c1NTdk5GYlA2ZVdGK3VzODdJZEJ4bFduUklkc1ZVTllTbVpIdzIvUHFpQ1RS?=
 =?utf-8?Q?iAvM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 987cdc49-6cf9-410b-023f-08dbb2c8e320
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2023 13:13:27.6337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ztygtBYoWflda8STb9XUBdM8Ro+7yZznm/Yin8m0+/q82mzirmw40r3AG6u90jy8R3l4x3q6ILJmtvgNsvsqnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5210
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Pelloux-Prayer,
 Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCkhleSBDaHJpc3RpYW4sDQoNCldp
bGwgZG8gdGhhdC4NCg0KUmVnYXJkcw0KU2hhc2hhbmsNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+
DQpTZW50OiBNb25kYXksIFNlcHRlbWJlciAxMSwgMjAyMyAxOjE1IFBNDQpUbzogQW5kcsOpIEFs
bWVpZGEgPGFuZHJlYWxtZWlkQGlnYWxpYS5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZzsgU2hhcm1hLCBTaGFzaGFuayA8U2hhc2hhbmsuU2hhcm1hQGFtZC5jb20+DQpD
Yzoga2VybmVsLWRldkBpZ2FsaWEuY29tOyBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5E
ZXVjaGVyQGFtZC5jb20+OyBQZWxsb3V4LVByYXllciwgUGllcnJlLUVyaWMgPFBpZXJyZS1lcmlj
LlBlbGxvdXgtcHJheWVyQGFtZC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIHY2IDEvNV0gZHJt
L2FtZGdwdTogQWxsb2NhdGUgY29yZWR1bXAgbWVtb3J5IGluIGEgbm9uYmxvY2tpbmcgd2F5DQoN
CkFtIDExLjA5LjIzIHVtIDA1OjAwIHNjaHJpZWIgQW5kcsOpIEFsbWVpZGE6DQo+IER1cmluZyBh
IEdQVSByZXNldCwgYSBub3JtYWwgbWVtb3J5IHJlY2xhaW0gY291bGQgYmxvY2sgdG8gcmVjbGFp
bQ0KPiBtZW1vcnkuIEdpdmluZyB0aGF0IGNvcmVkdW1wIGlzIGEgYmVzdCBlZmZvcnQgbWVjaGFu
aXNtLCBpdCBzaG91bGRuJ3QNCj4gZGlzdHVyYiB0aGUgcmVzZXQgcGF0aC4gQ2hhbmdlIGl0cyBt
ZW1vcnkgYWxsb2NhdGlvbiBmbGFnIHRvIGENCj4gbm9uYmxvY2tpbmcgb25lLg0KDQpTaW5jZSBp
dCBpcyBhIGJ1ZyBmaXggSSd2ZSBhbHJlYWR5IHB1c2hlZCB0aGlzIG9uZSBpbnRvIG91ciBpbnRl
cm5hbCBicmFuY2ggcXVpdGUgYSB3aGlsZSBhZ28uDQoNClNoYXNoYW5rIGNhbiB5b3UgdGFrZSBj
YXJlIG9mIHBpY2tpbmcgdXAgdGhlIHJlbWFpbmluZyBwYXRjaGVzIGFuZCBwdXNoaW5nIHRoZW0g
dG8gYW1kLXN0YWdpbmctZHJtLW5leHQ/DQoNClRoYW5rcywNCkNocmlzdGlhbi4NCg0KPg0KPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyw6kgQWxtZWlkYSA8YW5kcmVhbG1laWRAaWdhbGlhLmNvbT4NCj4g
UmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4N
Cj4gLS0tDQo+IHY1OiBubyBjaGFuZ2UNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RldmljZS5jDQo+IGluZGV4IGFhMTcxZGI2ODYzOS4uYmY0NzgxNTUxZjg4IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+IEBA
IC00ODQ3LDcgKzQ4NDcsNyBAQCBzdGF0aWMgdm9pZCBhbWRncHVfcmVzZXRfY2FwdHVyZV9jb3Jl
ZHVtcG0oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAgICAgIHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYgPSBhZGV2X3RvX2RybShhZGV2KTsNCj4NCj4gICAgICAga3RpbWVfZ2V0X3RzNjQo
JmFkZXYtPnJlc2V0X3RpbWUpOw0KPiAtICAgICBkZXZfY29yZWR1bXBtKGRldi0+ZGV2LCBUSElT
X01PRFVMRSwgYWRldiwgMCwgR0ZQX0tFUk5FTCwNCj4gKyAgICAgZGV2X2NvcmVkdW1wbShkZXYt
PmRldiwgVEhJU19NT0RVTEUsIGFkZXYsIDAsIEdGUF9OT1dBSVQsDQo+ICAgICAgICAgICAgICAg
ICAgICAgYW1kZ3B1X2RldmNvcmVkdW1wX3JlYWQsIGFtZGdwdV9kZXZjb3JlZHVtcF9mcmVlKTsN
Cj4gICB9DQo+ICAgI2VuZGlmDQoNCg==
