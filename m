Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0389F82A9B8
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F01A10E863;
	Thu, 11 Jan 2024 08:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E044B10E85D;
 Thu, 11 Jan 2024 08:52:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFOmGRkozk1d+UGcwodLfI5FuKZghsJkxUe2rubxBXsSyDqtqVBYPVlU8KzlGonAwYiMJm841nMj8siiiZ1L69WZMgLoDV6IVXSgk3ry3o+Cr/hpGqKHrEqFe2YpSDUDIHtssSLh5+aEOIESIyqYEV83xZbtU0voHjmBoURikW2XDs9ZhBpWbHweSBjq/1wB7xdvGwTTapBlxC3r2o7ky+mXajtXNxWLFyd817O88Ef7GGB/jWJoWqv86Xk67Tm8ELFeo2w+hBMGvdIguyNQ13vlZ1II8sECvJRTGOuJN51LhuruSnZ/tzs8thrQCBFcnbhr58rbn/kEn9Oh0OkILg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=goiwk2DIfAVPjGQ8f98lev7zYD6szPELJOfrjEcA7/w=;
 b=MRhfOsZyahgxq9R5MEFBsyQ4wvSLDPLKX9GdEWhXmOUy6s5AiYfGbzlik/x0SVPuosEVaVnUlbjkpqpq+qL5O+MZgEMPu4Wn5FU2+NbcgFGQA/FHymTIyn/sWahiETs2BAfLPvkwhEa+o+CBG9Msgx3M4szjEBQZYKsLszTUrQXrWZv2RO+XVGw4R5gp4MtGQpZBoeZyruzlpEd0N3kmnvw29IdJnN42S0J0+LhlErr/o/nSTQdfIqnAll+jzHpRB213ctHOrJlmy3WQMOX7A4znrWis5Akd/0Kc4/z+qvzWZiOT6m9NKfFB8IwBBDikruHr2gEJrFCFT7qfgsXJCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=goiwk2DIfAVPjGQ8f98lev7zYD6szPELJOfrjEcA7/w=;
 b=ItkYqpgQqDGzAgIb48dFRh4nO52Y0xMEI2T0d8SdNTKWSHmwsBw84jW9dlqr/8P4T+OvDu0QUHiU4znkc7Fbrq9zTCw3KZw2237PcQn9rX69lk5NmLI9kTvCnU4jpnDNvXV8AztTWoxLQRSq36nGUuxCVse03qyB1RM3t6alxb4=
Received: from IA1PR12MB6532.namprd12.prod.outlook.com (2603:10b6:208:3a3::12)
 by IA1PR12MB6410.namprd12.prod.outlook.com (2603:10b6:208:38a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Thu, 11 Jan
 2024 08:52:07 +0000
Received: from IA1PR12MB6532.namprd12.prod.outlook.com
 ([fe80::660a:3ae2:f8e:a372]) by IA1PR12MB6532.namprd12.prod.outlook.com
 ([fe80::660a:3ae2:f8e:a372%7]) with mapi id 15.20.7159.020; Thu, 11 Jan 2024
 08:52:07 +0000
From: "Zhang, Julia" <Julia.Zhang@amd.com>
To: "Zhang, Julia" <Julia.Zhang@amd.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, David Airlie
 <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Subject: Re: [PATCH 1/1] drm/virtio: Implement device_attach
Thread-Topic: [PATCH 1/1] drm/virtio: Implement device_attach
Thread-Index: AQHaQ6ts5sCsKISH6Uegp4vHFXM+VrDS1jIAgAH3zYA=
Date: Thu, 11 Jan 2024 08:52:07 +0000
Message-ID: <IA1PR12MB6532BF0748B47057101A1CDDF2682@IA1PR12MB6532.namprd12.prod.outlook.com>
References: <20240110095627.227454-1-julia.zhang@amd.com>
 <20240110095627.227454-2-julia.zhang@amd.com>
 <ZZ5vpoHKhjrpskgY@phenom.ffwll.local>
In-Reply-To: <ZZ5vpoHKhjrpskgY@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: MN0PR12MB6031.namprd12.prod.outlook.com
 (15.20.7181.004)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB6532:EE_|IA1PR12MB6410:EE_
x-ms-office365-filtering-correlation-id: 0e3d9106-47b0-41bc-def5-08dc1282976d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E6roAmAk6F+wubSdiDM7teJEgP4SMzM5ZdWXTE9+t0wqYl5UDfl5ZEAU7Xy1BMjrzJlHYa4WLgVNCApjOoqSFkyKJ0rgvnXAiHoI/HtmS4IqLMf+qOhIjNM0joCK+MM+QS+IqFsxAgm6gmm+/ZcSHbu6GrbC86+57firxQK7UVFkaRwD4/8nIFH5koAPJ9lByl0aBhCmEOz5urLi/wP4QRiSbp26CsTDNGF4VwXERGaf9McibE+J0tCoRCvtwix432suzbWUNKXkgV6pu2/kcTu+VQZ/WISSoco1lv6gw6DqVGK/BoJK5H1Z/Ex6YL2v4+z5o2xljzEGeG/mwzlt0vGpFCXLEXOV94RwyuFHQg4KU/9daZFRQps84d3oNJ2xNiEGWYnsz4OjTvQPCBQeIuZYaPJ4x81Hvwgnha+0Ckm88g2hF/sDG8tTsm3FXK4YtrqHbv8ejenHsS1Ek549RggkmpwXP6LZsnzVEtz1U6yJKY+bdxJVK1l80x2S3Z/0rbDUXq4aMnRg9xoofvLyc5aNs6GWpQC5IWqqHh9GQAsKQMIRXrodso64SLrSqCq4WdjwEvzll8vnhrDyYpnijeCksdvjrJfErFOIG7xOSqfaojdevo7bMGnJYmQb0iTx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6532.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(396003)(136003)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(55016003)(53546011)(6506007)(478600001)(9686003)(122000001)(7696005)(26005)(966005)(71200400001)(52536014)(38100700002)(921011)(33656002)(41300700001)(7416002)(38070700009)(83380400001)(66946007)(2906002)(54906003)(316002)(66476007)(8936002)(64756008)(66446008)(110136005)(66556008)(4326008)(8676002)(76116006)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWtTZEpycXlLbzN5ZU9DSHJoTWM4STBpemZDU0RXbW5jcVVpVWZlUGJpNEFL?=
 =?utf-8?B?OGg0UXU3WUxoQUdxZ0FpTGFWQmRhTE1FS1YwaFIyTlVqVVJFU25EeHVxc3ly?=
 =?utf-8?B?czhWbEF5cDhIUzZuU1liNFkyM1hyT3lkWjRlNXRLbTR3K1k0Z1RyQlpvdEpJ?=
 =?utf-8?B?R3BEU0ExWCsxTmlIMVA4ZTRXaklwVUpWb1BLY0VDOERBcUtidm1kU1NYb1pD?=
 =?utf-8?B?Qlc5V3gwUDY1cmJ6ZHNKTGRTSkhnMDM1TlEwWDR0ZVBCVFluVEI3SUp0Q1FS?=
 =?utf-8?B?SGNXNXhtRDBWbmt2NVNrU2crUStjSVp5UnRiazdySkJQQmZYMEllNENnMm51?=
 =?utf-8?B?YWFERHNROUdiRHhqYWZERXFmRU8wZWVZWWJhME40ZW54elRoM3JYV2JXLzRu?=
 =?utf-8?B?T2p1QUZlNG1mK29wL2JMWmVFNEFEWkIwVTdranRLRyswKzNMYUJPS0lyTklU?=
 =?utf-8?B?Zk8xVWlYM1h0LzQzV2h2S0JPNVdxRnFXd0NWWWJjOFc0QW45a3laSnppYVVO?=
 =?utf-8?B?RUxzdG9QWWNlekl5ODlhN0FRQ1RJZlpRWUhEc2pHOHBhYjVReHlZdncwdmIr?=
 =?utf-8?B?dktyaW1HUFIxQmV1ZU5CZElMZVZ0KzMzQ1ZMRFNoNUplSVc5S1JzcVppbHpy?=
 =?utf-8?B?Z0cxdU05VkptVnorY250SnU5ZjBoMkpRaEZReVNzS08wREVsRnl3OWI4Wi9B?=
 =?utf-8?B?eDNBNEQyNGMwQ1QxdmhqcHVGZTFnc1kzdm5teW9HUENUU1YxQVVzbHZNTEQ1?=
 =?utf-8?B?cXdEd2xCQnJ2ZVhIdTBUYitlZC9CUXFtZXI3RFJoZWJZM2lyMXpZMHFPOGNZ?=
 =?utf-8?B?UGYyOExNWDFKRmkxemNZQWVoVnZRUWlENU1UT09uSGt1OGdMUmZrMVhYUTdI?=
 =?utf-8?B?eFdyT3dTZGMwU3E0WlNwVjg4NEVCbTBwZkdudFgxVVl6VEsrbitzT3MwUFVL?=
 =?utf-8?B?ei84WnNDYXRNV0ljTzJuTFRsTStoazhYOEhzZENjcElrMjUza2lQblNKN0tx?=
 =?utf-8?B?c3NZKzlsRU9saW5oMkpFTnpyd2Z6K3N0T1VFNkUxRlBOb3hRR3FPNURrY3dX?=
 =?utf-8?B?ZFZRN3U5VEVwSkwvanBNWVlBYnNYNzJyYUZWaS9uRGxBTDc5NUFCRXIwazh0?=
 =?utf-8?B?VThjZ0Z2eWNQNmUvdUpWZC9OdmhYVUUzcWEvbnFxdzhxQjhwTDVNbyt0YmlM?=
 =?utf-8?B?LzhzK2thbklCbTlpN0tWSSswU3FmaTRrWjRHODhieldHRC9xYmVPWFhzdmJF?=
 =?utf-8?B?SThvZ0gvcThMQ2JpdXJsc2tEMnVVWnFUZHp2dUd5Y0NjbUJHUHlieW5yMnpu?=
 =?utf-8?B?ZzdSTktnVmF5ekJGcWJudm45VGVSTlltZko3NU41Yk5RQWlUUlc5S3hiSUVZ?=
 =?utf-8?B?SmNDS25NS2VTa1JQdjdSVzNzem93RmNTRzBldkQrMUVHKytZY1ZpT2FDdUVH?=
 =?utf-8?B?V2dNc1RXZGJyQXBnRkJYMXpkVkx4MkdZemthdUlRM3AxUExYY2ZEVTRnaG5J?=
 =?utf-8?B?VUxUSWtuYnVCb2c4cmJTUy91eVk3SGMrYS9Oa3EzOXord2FKZnNRYXNFRldM?=
 =?utf-8?B?eHFmUGNraHI4aWc4bm1aYzZmT3BlWm9IMUhGa2xZdER1eHRQWDlOcHN2QVVx?=
 =?utf-8?B?VURPTk1UeWRuTVF2V0F5bk1yMGoyRWRvMlpvQVpadzd6a3h5Y2ZLRUI1bnJu?=
 =?utf-8?B?T1lyM2N2NkRyMlUrQ1dJTHZWYnVyVXVhSm9vbDZ3d3FmaEJJWjBXeHRmSUdF?=
 =?utf-8?B?TFhXRWhPK25WRXUycXk4ZVRNU0t0aDNNNDE4TC9kdU9ncjhVQ3NtY09Sd2Fr?=
 =?utf-8?B?RFdndVphaXBiSnYrMVYycEpsSFlLTllFUHpnazRkeXlwWXlOQ2FMOTBRU1NN?=
 =?utf-8?B?MTdOK0JkOWpRWWNWY2phVzE2QUVxSUxscU1jWE9SUUJPZEd0ZUU2QmpFc1JR?=
 =?utf-8?B?RjNxS1hiQmxWdk5sZStyZEUvV3dkRXh4dVpzWVJaY04zSEZsTE01UVczSlUw?=
 =?utf-8?B?NE9Jb2pMOFlLR2lPTXZwWTVRU0c5MEp0VXBqNCtLWFVYZ3dGL3l6RnFBbXFi?=
 =?utf-8?B?ZG53ekszOFdDSkxhbytKRStuL3JIMS9DVUgvdm5QUUZHL0Z6UEZRWnJuNVJL?=
 =?utf-8?Q?6wrY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <96B7DDFDF1EDF04FA96DC171DEBA8649@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6532.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e3d9106-47b0-41bc-def5-08dc1282976d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2024 08:52:07.5039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: exSdQHfE0Q0qf4sFW2/C6DV0kkuFnJQYt9Qg4K8bU2Rwaj3ogcHtDVl9kN03xYSk51zDOX7mesGNPVE3NoSvqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6410
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
Cc: "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 Erik Faye-Lund <kusmabite@gmail.com>, "Olsak, Marek" <Marek.Olsak@amd.com>,
 "Chen, Jiqian" <Jiqian.Chen@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Huang,
 Honglei1" <Honglei1.Huang@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDIwMjQvMS8xMCAxODoyMSwgRGFuaWVsIFZldHRlciB3cm90ZToNCj4gT24gV2VkLCBK
YW4gMTAsIDIwMjQgYXQgMDU6NTY6MjhQTSArMDgwMCwgSnVsaWEgWmhhbmcgd3JvdGU6DQo+PiBk
cm1fZ2VtX21hcF9hdHRhY2goKSByZXF1aXJlcyBkcm1fZ2VtX29iamVjdF9mdW5jcy5nZXRfc2df
dGFibGUgdG8gYmUNCj4+IGltcGxlbWVudGVkLCBvciBlbHNlIHJldHVybiBFTk9TWVMuIFZpcnRp
byBoYXMgbm8gZ2V0X3NnX3RhYmxlDQo+PiBpbXBsZW1lbnRlZCBmb3IgdnJhbSBvYmplY3QuIFRv
IGZpeCB0aGlzLCBhZGQgYSBuZXcgZGV2aWNlX2F0dGFjaCB0bw0KPj4gY2FsbCBkcm1fZ2VtX21h
cF9hdHRhY2goKSBmb3Igc2htZW0gb2JqZWN0IGFuZCByZXR1cm4gMCBmb3IgdnJhbSBvYmplY3QN
Cj4+IGluc3RlYWQgb2YgY2FsbGluZyBkcm1fZ2VtX21hcF9hdHRhY2ggZm9yIGJvdGggb2YgdGhl
c2UgdHdvIGtpbmRzIG9mDQo+PiBvYmplY3QuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVsaWEg
WmhhbmcgPGp1bGlhLnpoYW5nQGFtZC5jb20+DQo+PiAtLS0NCj4+ICBkcml2ZXJzL2dwdS9kcm0v
dmlydGlvL3ZpcnRncHVfcHJpbWUuYyB8IDE0ICsrKysrKysrKysrKystDQo+PiAgMSBmaWxlIGNo
YW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ByaW1lLmMgYi9kcml2ZXJzL2dwdS9k
cm0vdmlydGlvL3ZpcnRncHVfcHJpbWUuYw0KPj4gaW5kZXggNDQ0MjVmMjBkOTFhLi5mMGIwZmY2
ZjM4MTMgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcHJp
bWUuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ByaW1lLmMNCj4+
IEBAIC03MSw2ICs3MSwxOCBAQCBzdGF0aWMgdm9pZCB2aXJ0Z3B1X2dlbV91bm1hcF9kbWFfYnVm
KHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCwNCj4+ICAJZHJtX2dlbV91bm1hcF9k
bWFfYnVmKGF0dGFjaCwgc2d0LCBkaXIpOw0KPj4gIH0NCj4+ICANCj4+ICtzdGF0aWMgaW50IHZp
cnRncHVfZ2VtX2RldmljZV9hdHRhY2goc3RydWN0IGRtYV9idWYgKmRtYV9idWYsDQo+PiArCQkJ
CSAgICAgc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoKQ0KPj4gK3sNCj4+ICsJc3Ry
dWN0IGRybV9nZW1fb2JqZWN0ICpvYmogPSBhdHRhY2gtPmRtYWJ1Zi0+cHJpdjsNCj4+ICsJc3Ry
dWN0IHZpcnRpb19ncHVfb2JqZWN0ICpibyA9IGdlbV90b192aXJ0aW9fZ3B1X29iaihvYmopOw0K
Pj4gKw0KPj4gKwlpZiAodmlydGlvX2dwdV9pc192cmFtKGJvKSkNCj4+ICsJCXJldHVybiAwOw0K
PiANCj4gWW91IG5lZWQgdG8gcmVqZWN0IGF0dGFjaCBoZXJlIGJlY2F1c2UgdGhlc2UgdnJhbSBi
dWZmZXIgb2JqZWN0cyBjYW5ub3QgYmUNCj4gdXNlZCBieSBhbnkgb3RoZXIgZHJpdmVyLiBJbiB0
aGF0IGNhc2UgZG1hX2J1Zl9hdHRhY2ggX211c3RfIGZhaWwsIG5vdA0KPiBzaWxlbnRseSBzdWNj
ZWVkLg0KPiANCg0KRG8geW91IG1lYW4gdGhlc2UgdnJhbSBidWZmZXIgb2JqZWN0cyBzaG91bGQg
bm90IGJlIGltcG9ydGVkIGJ5IG90aGVyIGRyaXZlcnM/DQoNCj4gQmVjYXVzZSBpZiBpdCBzaWxl
bnRseSBzdWNjZWVkcyB0aGVuIHRoZSBzdWJzZXF1ZW50IGRtYV9idWZfbWFwX2F0dGFjaG1lbnQN
Cj4gd2lsbCBibG93IHVwIGJlY2F1c2UgeW91IGRvbid0IGhhdmUgdGhlIC0+Z2V0X3NnX3RhYmxl
IGhvb2sgaW1wbGVtZW50ZWQuDQo+IA0KDQpJIHNhdyBvbmx5IHRoaXMgY2FsbCBzdGFjayB3b3Vs
ZCBjYWxsIC0+Z2V0X3NnX3RhYmxlOg0KDQojMCAtPmdldF9zZ190YWJsZQ0KIzEgZHJtX2dlbV9t
YXBfZG1hX2J1Zg0KIzIgdmlydGdwdV9nZW1fbWFwX2RtYV9idWYNCiMzIF9fbWFwX2RtYV9idWYN
CiM0IGRtYV9idWZfZHluYW1pY19hdHRhY2gNCiM1IGFtZGdwdV9nZW1fcHJpbWVfaW1wb3J0DQoN
CnRoaXMgc3RhY2sgaXMgZm9yIHNobWVtIG9iamVjdCBhbmQgaXQgcmVxdWlyZXMgLT5nZXRfc2df
dGFibGUgZ2V0IGltcGxlbWVudGVkLg0KDQoNCkJ1dCBmb3IgdnJhbSBvYmplY3QsIF9fbWFwX2Rt
YV9idWYgd2lsbCBjYWxsIGxpa2UgdGhpczoNCg0KIzAgc2dfYWxsb2NfdGFibGUNCiMxIHZpcnRp
b19ncHVfdnJhbV9tYXBfZG1hX2J1Zg0KIzIgdmlydGdwdV9nZW1fbWFwX2RtYV9idWYNCiMzIF9f
bWFwX2RtYV9idWYNCiM0IGRtYV9idWZfZHluYW1pY19hdHRhY2gNCiM1IGFtZGdwdV9nZW1fcHJp
bWVfaW1wb3J0DQoNCndoaWNoIHdpbGwgbm90IGNhbGwgLT5nZXRfc2dfdGFibGUgYnV0IGFsbG9j
IGEgc2cgdGFibGUgaW5zdGVhZCBhbmQgZmlsbCBpdCBmcm9tIHRoZSB2cmFtIG9iamVjdC4NCg0K
QmVmb3JlIF9fbWFwX2RtYV9idWYsIHRoZSBjYWxsIHN0YWNrIG9mIHZpcnRncHVfZ2VtX2Rldmlj
ZV9hdHRhY2ggaXM6DQoNCiMwIHZpcnRncHVfZ2VtX2RldmljZV9hdHRhY2gNCiMxIHZpcnRpb19k
bWFfYnVmX2F0dGFjaA0KIzIgZG1hX2J1Zl9keW5hbWljX2F0dGFjaA0KIzMgYW1kZ3B1X2dlbV9w
cmltZV9pbXBvcnQNCg0KU28gbXkgcHJvYmxlbSBpcyB0aGF0IHRvIHJlYWxpemUgZEdQVSBwcmlt
ZSBmZWF0dXJlIG9uIFZNLCBJIGFjdHVhbGx5IHdhbnQgZG1hX2J1Zl9hdHRhY2ggc3VjY2VlZA0K
Zm9yIHZyYW0gb2JqZWN0IHNvIHRoYXQgcGFzc3Rocm91Z2ggZEdQVSBjYW4gaW1wb3J0IHRoZXNl
IHZyYW0gb2JqZWN0cyBhbmQgYmxpdCBkYXRhIHRvIGl0LiANCklmIGhlcmUgcmV0dXJuIC1FQlVT
WSwgdGhlbiBhbWRncHVfZ2VtX3ByaW1lX2ltcG9ydCB3aWxsIGZhaWwgYW5kIHRoZSB3aG9sZSBm
ZWF0dXJlIHdpbGwgZmFpbC4NCg0KPiBQZXIgdGhlIGRvY3VtZW50YXRpb24gdGhlIGVycm9yIGNv
ZGUgZm9yIHRoaXMgY2FzZSBtdXN0IGJlIC1FQlVTWSwgc2VlIHRoZQ0KPiBzZWN0aW9uIGZvciB0
aGUgYXR0YWNoIGhvb2sgaGVyZToNCj4gDQo+IGh0dHBzOi8vZHJpLmZyZWVkZXNrdG9wLm9yZy9k
b2NzL2RybS9kcml2ZXItYXBpL2RtYS1idWYuaHRtbCNjLmRtYV9idWZfb3BzDQo+IA0KPiBTaW5j
ZSB5b3UncmUgbG9va2luZyBpbnRvIHRoaXMgYXJlYSwgcGxlYXNlIG1ha2Ugc3VyZSB0aGVyZSdz
IG5vdCBvdGhlcg0KPiBzaW1pbGFyIG1pc3Rha2UgaW4gdmlydGlvIGNvZGUuDQo+IA0KPiBBbHNv
IGNhbiB5b3UgcGxlYXNlIG1ha2UgYSBrZXJuZWxkb2MgcGF0Y2ggZm9yIHN0cnVjdCB2aXJ0aW9f
ZG1hX2J1Zl9vcHMNCj4gdG8gaW1wcm92ZSB0aGUgZG9jdW1lbnRhdGlvbiB0aGVyZT8gSSB0aGlu
ayBpdCB3b3VsZCBiZSBnb29kIHRvIG1vdmUgdGhvc2UNCj4gdG8gdGhlIGlubGluZSBzdHlsZSBh
bmQgdGhlbiBhdCBsZWFzdCBwdXQgYSBrZXJuZWwtZG9jIGh5cGVybGluayB0byBzdHJ1Y3QNCj4g
ZG1hX2J1Zl9vcHMuYXR0YWNoIGFuZCBtZW50aW9uIHRoYXQgYXR0YWNoIG11c3QgZmFpbCBmb3Ig
bm9uLXNoYXJlYWJsZQ0KPiBidWZmZXJzLg0KPiANCj4gSW4gZ2VuZXJhbCB0aGUgdmlydGlvX2Rt
YV9idWYga2VybmVsZG9jIHNlZW1zIHRvIGJlIG9uIHRoZSAidG9vIG1pbmltYWwsDQo+IGV4cGxh
aW5zIG5vdGhpbmciIHNpZGUgb2YgdGhpbmdzIDotLw0KDQpPSywgbGV0IG1lIHRha2UgYSBsb29r
IGFuZCB0cnkgdG8gZG8gaXQuDQoNClJlZ2FyZHMsDQpKdWxpYQ0KDQo+IA0KPiBDaGVlcnMsIFNp
bWENCj4gDQo+PiArDQo+PiArCXJldHVybiBkcm1fZ2VtX21hcF9hdHRhY2goZG1hX2J1ZiwgYXR0
YWNoKTsNCj4+ICt9DQo+PiArDQo+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCB2aXJ0aW9fZG1hX2J1
Zl9vcHMgdmlydGdwdV9kbWFidWZfb3BzID0gIHsNCj4+ICAJLm9wcyA9IHsNCj4+ICAJCS5jYWNo
ZV9zZ3RfbWFwcGluZyA9IHRydWUsDQo+PiBAQCAtODMsNyArOTUsNyBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IHZpcnRpb19kbWFfYnVmX29wcyB2aXJ0Z3B1X2RtYWJ1Zl9vcHMgPSAgew0KPj4gIAkJ
LnZtYXAgPSBkcm1fZ2VtX2RtYWJ1Zl92bWFwLA0KPj4gIAkJLnZ1bm1hcCA9IGRybV9nZW1fZG1h
YnVmX3Z1bm1hcCwNCj4+ICAJfSwNCj4+IC0JLmRldmljZV9hdHRhY2ggPSBkcm1fZ2VtX21hcF9h
dHRhY2gsDQo+PiArCS5kZXZpY2VfYXR0YWNoID0gdmlydGdwdV9nZW1fZGV2aWNlX2F0dGFjaCwN
Cj4+ICAJLmdldF91dWlkID0gdmlydGdwdV92aXJ0aW9fZ2V0X3V1aWQsDQo+PiAgfTsNCj4+ICAN
Cj4+IC0tIA0KPj4gMi4zNC4xDQo+Pg0KPiANCg==
