Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B93773258D2
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 22:39:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9EE6E51D;
	Thu, 25 Feb 2021 21:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483DA6E51D;
 Thu, 25 Feb 2021 21:39:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NrLueCpdOqEfE/C9Qxd/kj2mhd0SwFAcUCTHJ+skHVPxkquFWZ2RYzTIycfwNNmZvvLPDMfWqOiAO7BTx4O11f3PBl9adZZkUQQ0H+Hi/EUsD6v/vSExR233tS1dF+PuhuoE2EfBiiN1Wc6x6/cZKI0Q01rLrVW4g8WqNn6BEIXtAW2QRDJURO8SxqFZCQASGyD/4Z0eDkLkInBfX8coL2m0R7V9TD2qzI7md/aGOCrF02ERjSFn2xmeSrgaPdANUjW83FnPFZanImu9JORcw7fVZZNQ7Vu5HAA2wO5FJkGb4xAvFJsY+hlLUCCJTmYR3FhUZtysR5+pjGgQS5VYDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqkMa4XAx4ei7BIIRv4LplUGXmGEcV8f+jzA5CXKK64=;
 b=VFds/4nwB9He0ikItzuZBKKCnexNCvLWj2pj5yQonUQjzcrdOfBOdgnYKCOB2H2pRLWgXATzrDdEmtWhOz293PYVSCXBeyF7QYwnYdFb9ocr0N0LW2U+GCfgJBeitAwcHOI4WVJPUwSs1//xTSJdfAiSoWvl9OKWh0mA7+tER41bMNahMQW7tU6IXOsj6ZwgDbmBl/nWHKzjEiy8kVIDWpgTt7kxhd1xjKeYbfdx/HlozM4PFoAWDsMikZpklbZMNGfFJF/o9isEFQrsYjLoGrXmzGz+vmexrzJy/E6boDiGKQDk9vUKHuowTO2G0HAlOAkaS1PtF5yiI+WU4cDvzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqkMa4XAx4ei7BIIRv4LplUGXmGEcV8f+jzA5CXKK64=;
 b=lfTTyFS4mZ3FHAN7uobcZ7a2znBGWQM12WkTLpOUHcyQUVoBEJvrtqYZLO6lXEEgLOx0ToGYSnZo+n+WbQ+HciyW5gzaQ8Pq8qF1C6hS3PsCc6L+BJV0qgtf4PuZh4cl/sZ5gvYTsLhYD5tLHQGTs+rQ+QyTIO6RT7EX1tSj9YM=
Received: from DM5PR12MB2582.namprd12.prod.outlook.com (2603:10b6:4:b5::37) by
 DM5PR12MB1436.namprd12.prod.outlook.com (2603:10b6:3:78::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19; Thu, 25 Feb 2021 21:39:47 +0000
Received: from DM5PR12MB2582.namprd12.prod.outlook.com
 ([fe80::6c5c:202c:6afa:b664]) by DM5PR12MB2582.namprd12.prod.outlook.com
 ([fe80::6c5c:202c:6afa:b664%7]) with mapi id 15.20.3868.031; Thu, 25 Feb 2021
 21:39:47 +0000
From: "Stempen, Vladimir" <Vladimir.Stempen@amd.com>
To: Arnd Bergmann <arnd@kernel.org>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, "R, Bindu" <Bindu.R@amd.com>
Subject: Re: [PATCH] drm/amd/display: fix 64-bit integer division
Thread-Topic: [PATCH] drm/amd/display: fix 64-bit integer division
Thread-Index: AQHXC4M7YzvJuSend0aEmpejDCFDf6ppZWkA//+tNwA=
Date: Thu, 25 Feb 2021 21:39:47 +0000
Message-ID: <EB1143CA-884E-43A2-A14E-6B909D29F5E8@amd.com>
References: <20210225143339.3693838-1-arnd@kernel.org>
 <CAK8P3a0Zi2MAzG2f6Te-LYuDuLd4yiy4b3VRYQY6EspqzMnQ5w@mail.gmail.com>
In-Reply-To: <CAK8P3a0Zi2MAzG2f6Te-LYuDuLd4yiy4b3VRYQY6EspqzMnQ5w@mail.gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.46.21021202
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=caae59f8-303d-42e3-87d7-34346010df48;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-02-25T21:37:27Z; 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.55.211]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0a4e004d-56a3-4c99-9f59-08d8d9d5df8b
x-ms-traffictypediagnostic: DM5PR12MB1436:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1436F7C739D405DF193861AE879E9@DM5PR12MB1436.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hzy0BdAD0dT2QPVkE5avSL096dWGCHx9VJmtCdVLzFM1BJ2oK8FHv8olm3GeKCftmMOdtBbLT8m8GIXS27oY2yhMkD9esMDSHViYCTCjBcQZlSbpdAlUpN6Xx8WEqTB6RNtNNlhtM3XjYizNQDiZWsiSSwz3C8q6WxHYFiHYumzkrDJzHVcTiKHROQ9iylH+F7LHuHVBCEGvdzfe36K2rEZg6nEBuqUBOeloYEUwJSVR7o9wyYHt8riSEf+9UTWeqnRjb5QQFXLzDiLuh2DgIOaKzj67JKJtE+xN9LA0G3ttsDWPxtBDtC9XMtz3CHZvNXew2nxGwqMc+3L6MbK890Q+O57qynmN46BvpzY2M7gC2qiHM82+hT/G6f7VtD0BQTdT7sh2jmFfFT78rAlye28Haj4RQNw/dFrKdpW1UvyZydsRuBgGL/bYHatGv8RaMrZyPubeQo4sYtFjVkuEC0ddzB5SIOGrckrvMPG9jMbY62syqcRNIrNptbRs5gwc/eJYJuSxcvDpIV/Ej3tGUSLA1+a0/Ri8uVJziklK2WKniz/ZLh058/Wjq1p7+8FmWfKGX2nEDYk4uk+zow1QYHl4wizwjeffDSnSPJI0Ads=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2582.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(64756008)(26005)(8676002)(54906003)(66446008)(8936002)(33656002)(66476007)(76116006)(91956017)(2906002)(66556008)(66946007)(36756003)(921005)(6512007)(53546011)(6636002)(83380400001)(6506007)(186003)(4326008)(71200400001)(316002)(5660300002)(2616005)(110136005)(478600001)(6486002)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZG5NQkMvYnVwYVZtQ0Y5MkJCKzJ5TVpLcmhkcE9BQWs0L1hTdUhCUHRDOGhB?=
 =?utf-8?B?cUdPWlBjK0tZY3k2ZXlqQm9UM2lxd1ZrcEl0S3l1ekdTdlRjZU9FRXRVYmIr?=
 =?utf-8?B?Z0prTVZUWllLSzVQRjN6ZkFHMGx5ZzdUcEZYNnVpZG1Ra09sMEFQNDk5Vitk?=
 =?utf-8?B?enY1emxBcFQ1Q1QyWXFxaThzWHBHd29KZUlVY0FXaC9JOXBHV2tnanluelI0?=
 =?utf-8?B?L2Z0aEw0Nlk4YzVVVVpwYkhTNEh2WVpUR2JtSVlLVlRaQjF3RitOS2dqUm1O?=
 =?utf-8?B?NWNaeXZCckVXRjVjMmVKRHBxY0p3MkttejJuQmtRamJ4dGNBRUpHenJDUXp5?=
 =?utf-8?B?NC9rK2x6QlNTbkliNHN1cXRlQ2szd2lWTS9QaGJWZGcvSVhYcWtvcUEzUERh?=
 =?utf-8?B?Yld1dTBsZ2dTTXQxZ05rWDRzcTliQk95U1JHYmRBSENpQld3QnhPaXFLdXhW?=
 =?utf-8?B?Vkh6Smp1V3RZZThENjJVekorLzdaaXl0Ym5Yc0FEOWZvYmEzbGNyMjBmVnF1?=
 =?utf-8?B?SERhOHpldGppRFZOQ25uYlQvZ3d6YXg0K3Y5N3VUTHdTMlhSck9HSjI4eUVS?=
 =?utf-8?B?cEJPME55L0FtRndldWtaS21SNUpDT2plampQVzV1dmQwYVkxcFdFZlA3a3Nm?=
 =?utf-8?B?Y3lEWWRWZytESmxpdFY5SmRwU1RBSXRWR0g3bjdQVC9FUis3T1pQVjVQa1pm?=
 =?utf-8?B?SXhOL0YrV1B5TUF3NGFka3g2UTFIb2M4TDF3QWtaeHJld2RPVVlWVkV2MVA1?=
 =?utf-8?B?YStraHFFNUV3RjZiNm9XekNScUg0cTJhdmNNR3RYK1RJa00wK0NYQmdoQzdC?=
 =?utf-8?B?YVJLUkFaazZaUHFLVHhNM1NiUGtGWDIxNnVTTDVVSm5pMnRTc091cVhQbHB2?=
 =?utf-8?B?UU5NTjJ2WEE2eWhaV2txaEphNWpDSk8yc1NMalRCVWVCOUxGSjBGSHV6MFF4?=
 =?utf-8?B?ZnJhdzNGaXZvZWFVNW5EelFmSjdPR2MrUEhGdXJJcmtSRWh5amRlN3Qyazhq?=
 =?utf-8?B?NDd0MHNVOWg5c0FLTmpDS3lYQTZhK3JNeXpmL0FCSVF2bVB3bjVRejAxdnFG?=
 =?utf-8?B?bzF3YjU0dkkyRkpmaGVSVkJ3ZWxpeUZiWjc1OGlTUFVvcTlWMUhJUUNWWlhL?=
 =?utf-8?B?REsxYlJ2ckFNNmJPd3VEVXhUNjJYeTNSWm5jY09jSTZibzBsTHV0Q3FVSHhk?=
 =?utf-8?B?WWsvSi9weVNWQ0FGNXN1OVBjUHhxK0RibjIyT215ZlBLaVNGb2NjWTFyK3NP?=
 =?utf-8?B?RnBxc2lGYUNMaG9VTEJ1MXc2OTd3aFZIQkkvbmRKKyszL05pY0ZsaXhDUzFu?=
 =?utf-8?B?cXV2RFh2Uk9nbkg0Y3VVcWRrM3o4dWRhVmZpdVJUcCt3LzloMWFCMXpzVDhu?=
 =?utf-8?B?YkcyUXpXVTlGb3dEdUZCc2I2ZTY4cE1TV09GSENFOWx2L2ljcGtrR0xFMHEz?=
 =?utf-8?B?Yk9sZHY1Y0Z2aXhOcFJFVW82UWg0aUtVUFFuOS81blRVOVlkbGhqRlo3MWNt?=
 =?utf-8?B?b3lqV1VZWk0xRWtvS3NJUzdBMy91WFRHczRXcUxJa3NPTTR4VGF5aVgrY0Qz?=
 =?utf-8?B?aHBYRlJGU051SUpFSUJqaTBlVlp0Smp1NTF5NGQzdlA3NkRMWitzK1hjQU9H?=
 =?utf-8?B?d3owRzF2SnVvZ3AxWDFqVk9WeVFtQkh5V1h0aFh5MUwva0FlRWxJR1dCQlhr?=
 =?utf-8?B?WnlRY3MxQUMvVCtHcDRsZkNSbDM4dFhoNmxNaHdSNmlFWXFYSEJHM09zR0hv?=
 =?utf-8?B?QUFGODRuVnpnOVhvM0E0dWo1UHVwVXJ1ZjEwTUhUNE1ROUllZWwwSFd3QWM2?=
 =?utf-8?B?TkJ6dlU2ekh2aHJCb2Vtdz09?=
Content-ID: <55C07F2982DB5C46933A26BAFF3267FA@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2582.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a4e004d-56a3-4c99-9f59-08d8d9d5df8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2021 21:39:47.4056 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iWp2ABBdgAi83FRWNCydvvGpAvbl++OnlLLHHMG3cb5BL2mMTQjQRh6KrnHmQ54Pgn2SiVUjmn4YRs4B9+V5wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1436
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
Cc: Arnd Bergmann <arnd@arndb.de>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Pillai,
 Aurabindo" <Aurabindo.Pillai@amd.com>, "Laktyushkin,
 Dmytro" <Dmytro.Laktyushkin@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KDQpI
aSBBcm5kLA0KSSBoYXZlIGFsbCB0aGUgcGF0Y2hlcyByZWFkeSBhbmQgSSBoYXZlIHRlc3RlZCB0
aGVtIHdpdGggdGhlIGZlYXR1cmUvcGxhdGZvcm0gSSdtIHdvcmtpbmcgb24gYW5kIEJpbmR1IGhl
bHBlZCB0byB0ZXN0IHRoZSAzMmJpdCBidWlsZC4NCkknbSBpbiBwcm9jZXNzIG9mIHN1Ym1pdHRp
bmcgdGhlIGxhdGVzdCBjaGFuZ2UuDQpUaGFua3MsDQpWbGFkaW1pci4NCg0K77u/T24gMjAyMS0w
Mi0yNSwgNDozNiBQTSwgIkFybmQgQmVyZ21hbm4iIDxhcm5kQGtlcm5lbC5vcmc+IHdyb3RlOg0K
DQogICAgT24gVGh1LCBGZWIgMjUsIDIwMjEgYXQgMzozMyBQTSBBcm5kIEJlcmdtYW5uIDxhcm5k
QGtlcm5lbC5vcmc+IHdyb3RlOg0KICAgID4NCiAgICA+IEZyb206IEFybmQgQmVyZ21hbm4gPGFy
bmRAYXJuZGIuZGU+DQogICAgPg0KICAgID4gVGhlIG5ldyBkaXNwbGF5IHN5bmNocm9uaXphdGlv
biBjb2RlIGNhdXNlZCBhIHJlZ3Jlc3Npb24NCiAgICA+IG9uIGFsbCAzMi1iaXQgYXJjaGl0ZWN0
dXJlczoNCiAgICA+DQogICAgPiBsZC5sbGQ6IGVycm9yOiB1bmRlZmluZWQgc3ltYm9sOiBfX2Fl
YWJpX3VsZGl2bW9kDQogICAgPiA+Pj4gcmVmZXJlbmNlZCBieSBkY2VfY2xvY2tfc291cmNlLmMN
CiAgICA+ID4+PiAgICAgICAgICAgICAgIGdwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9j
bG9ja19zb3VyY2UubzooZ2V0X3BpeGVsX2Nsa19mcmVxdWVuY3lfMTAwaHopIGluIGFyY2hpdmUg
ZHJpdmVycy9idWlsdC1pbi5hDQogICAgPg0KICAgID4gbGQubGxkOiBlcnJvcjogdW5kZWZpbmVk
IHN5bWJvbDogX19hZWFiaV9sZGl2bW9kDQogICAgPiA+Pj4gcmVmZXJlbmNlZCBieSBkY19yZXNv
dXJjZS5jDQogICAgPiA+Pj4gICAgICAgICAgICAgICBncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nv
cmUvZGNfcmVzb3VyY2UubzoocmVzb3VyY2VfYXJlX3ZibGFua3Nfc3luY2hyb25pemFibGUpIGlu
IGFyY2hpdmUgZHJpdmVycy9idWlsdC1pbi5hDQogICAgPiA+Pj4gcmVmZXJlbmNlZCBieSBkY19y
ZXNvdXJjZS5jDQogICAgPiA+Pj4gICAgICAgICAgICAgICBncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2NvcmUvZGNfcmVzb3VyY2UubzoocmVzb3VyY2VfYXJlX3ZibGFua3Nfc3luY2hyb25pemFibGUp
IGluIGFyY2hpdmUgZHJpdmVycy9idWlsdC1pbi5hDQogICAgPiA+Pj4gcmVmZXJlbmNlZCBieSBk
Y19yZXNvdXJjZS5jDQogICAgPiA+Pj4gICAgICAgICAgICAgICBncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGNfcmVzb3VyY2UubzoocmVzb3VyY2VfYXJlX3ZibGFua3Nfc3luY2hyb25pemFi
bGUpIGluIGFyY2hpdmUgZHJpdmVycy9idWlsdC1pbi5hDQogICAgPg0KICAgID4gVGhpcyBpcyBu
b3QgYSBmYXN0IHBhdGgsIHNvIHRoZSB1c2Ugb2YgYW4gZXhwbGljaXQgZGl2X3U2NC9kaXZfczY0
DQogICAgPiBzZWVtcyBhcHByb3ByaWF0ZS4NCg0KICAgIEkgZm91bmQgdHdvIG1vcmUgaW5zdGFu
Y2VzOg0KDQogICAgPj4+IHJlZmVyZW5jZWQgYnkgZGNuMjBfb3B0Yy5jDQogICAgPj4+ICAgICAg
ICAgICAgICAgZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9vcHRjLm86KG9wdGMy
X2FsaWduX3ZibGFua3MpIGluIGFyY2hpdmUgZHJpdmVycy9idWlsdC1pbi5hDQoNCiAgICA+Pj4g
cmVmZXJlbmNlZCBieSBkY24xMF9od19zZXF1ZW5jZXIuYw0KICAgID4+PiAgICAgICAgICAgICAg
IGdwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2VyLm86KHJlZHVj
ZVNpemVBbmRGcmFjdGlvbikgaW4gYXJjaGl2ZSBkcml2ZXJzL2J1aWx0LWluLmENCg0KICAgIEkg
aGF2ZSBwYXRjaGVzIGZvciBib3RoLCBidXQgd2lsbCBsZXQgdGhlIHJhbmRjb25maWcgYnVpbGQg
Ym94IGtlZXAgd29ya2luZw0KICAgIG9uIGl0IG92ZXIgbmlnaHQgdG8gc2VlIGlmIHRoZXJlIGFy
ZSBhbnkgb3RoZXJzLiBMZXQgbWUga25vdyBpZiB5b3Ugd2FudCBhDQogICAgY29tYmluZWQgcGF0
Y2ggb3Igb25lIHBlciBmaWxlIG9uY2UgdGhlcmUgYXJlIG5vIG1vcmUgcmVncmVzc2lvbnMuDQoN
CiAgICAgICAgICAgIEFybmQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
