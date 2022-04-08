Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CBB4F9A89
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 18:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B4510E574;
	Fri,  8 Apr 2022 16:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6435610E564;
 Fri,  8 Apr 2022 16:23:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XctnETpUpoE2Qta9e5hqtutvQ4mYdfNl4CSlrU+JFkXAC6e0aBqtYb2BLi/WV1L/LLk/kfxmTRDK0NMrp7Zue84bnBq/SYdrazlEcW3uFxr/d8lKOv8oQFAdnUKag6NbD5QhsOk/kXJ+C+y39KLqsNlWGTewA+FfV0BgEb78+L+Su09VoVtUfjDYHtSrUHM8sL5CRfepk+D1a/xT+uKv1XC+51lQ45rOjHwAtOAMaxx7vgbsnRxJOs+dzi8baLS07waTEZihxrZzHZDfHsWtvgBBsfp2vCabvfMer5rkQ2k4pILOD7Y06Dz5mo7JxGCqdgarJmlD3//MWbv/HFTvNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0bqr3nPo/EdHsvqGv8sqjeBdZaX7WAJdXkI4b8JLkb4=;
 b=jVAXh8GKDUfoxUBl7W2lxzKTeAzEU3k8cVhYEMXkiboOr2LdlHzArTDGyRxc8ECXA7t9vwjgLGTuMcPNVthwEU6aDq0x4HTsOG+dAOUVKFKF1tcN1yRKsksO3iDNcZdlY0/t+DsFiG3uT7u3G1aSuOfUyMDcg0wrdX82UHEyPCK2bDmUdEQRKf3DGDbo3OChFLt0j02gALPOxoyQtSrp8PjPkLXZ38+ogevfkA9Jau/yB23XGD8tLqfDUtW52Jzgx+BASCDW9BG8VRxuMCwIdsaCOzvofgcFvMNXwx7AivYVNkPaBL3TBTPo1Bce+FoUVZZpJbMNbcNtFJKx2ybauw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bqr3nPo/EdHsvqGv8sqjeBdZaX7WAJdXkI4b8JLkb4=;
 b=THQCCzGeqL8cObxvoMVBaZggXjEoNgNADr6AS/JPjfgYBGp/crvCS4jvM/Kbow+DWExERAFhzchL8AlUExo91pVy9D8Z6ZOJu3noCkt5zPy/8SLFMsO77RBm6UV2PTzqa82prYjzjAJiQwQqeb778MGBX2XP0I7hI7nyTRt0D5g=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by BYAPR12MB3256.namprd12.prod.outlook.com (2603:10b6:a03:135::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 16:23:30 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::70d6:f6dd:3e14:3c2d]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::70d6:f6dd:3e14:3c2d%5]) with mapi id 15.20.5144.025; Fri, 8 Apr 2022
 16:23:30 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: "Gong, Richard" <Richard.Gong@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: RE: [PATCH] drm/amdgpu: disable ASPM for legacy products that don't
 support ASPM
Thread-Topic: [PATCH] drm/amdgpu: disable ASPM for legacy products that don't
 support ASPM
Thread-Index: AQHYS1+vbeZYg8F3L0aXkBYKsAfwnazmKNIAgAAJZACAAACksA==
Date: Fri, 8 Apr 2022 16:23:30 +0000
Message-ID: <BL1PR12MB5157099D1DE3F8B3AC4F59FCE2E99@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <20220408154447.3519453-1-richard.gong@amd.com>
 <BL1PR12MB51576654D3EEB10F5DF862A7E2E99@BL1PR12MB5157.namprd12.prod.outlook.com>
 <768e8812-ecbf-93e7-ffad-feec1b36d924@amd.com>
In-Reply-To: <768e8812-ecbf-93e7-ffad-feec1b36d924@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-04-08T16:23:26Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=b89953b9-3b4a-43cf-98ae-41ef61289b46;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-04-08T16:23:28Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 70c15800-2c47-432f-ae89-2743b4122ff5
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 987aa9e0-73d4-4928-5df6-08da197c1e84
x-ms-traffictypediagnostic: BYAPR12MB3256:EE_
x-microsoft-antispam-prvs: <BYAPR12MB3256691A75944F99932E3BD6E2E99@BYAPR12MB3256.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IUKK74Ns7O5UZPIMW/eokltkk5WrOSCbjxsDKoYJ26pXfU0pySTAOLWDc51zWZeNTSzy0Mf585AK83buh0ks8DpiOTs4zR4Quqv03M/a9AQUdkTK9OVrcu00yDHGTf15fAM/B5LvBO/F6r+9GkPN9ChXlwvyUXzx0t5V36mSEgCkHXJl3O+ml3i5p+5LlyZ+VfFootLxPQHDnBPyunZwvBcUkueCKIFyBNNzbBA8livsg6KAQnxvY4gR3l35eEP4QGOPzUhDRxO8mRuRhC8EBIPfTLQP6lNZTIADkUUgAGsIZnyy44bvC655SwBjSpm7a2e+UY08RWuAsSdFpqO9XpZdYKFq75CjFVl+VaIZpR8dW0gfr05qoO5U0MIGf6JOhd096rMH4x14UuTE45v5GTSNJDd1JrL36lwDhnlnGecSSu9PtLFEWj4PnHWIoK54Nng55wrUFy96PK2BSO4XwhezYGskL+MS6UoaLy1nb4ifLwTtL+saowGDothcDGo8XLAtDrP3MViefar8nNV9MNIHUFglYeU1IADm1L6OZk6xig5nuK09MGb8/hEcDUkZtKc/5VCq509eY/8wgMJqWgPySXvlgUXbODR2K1stJm/eMaY/NZDH+tj05RwHUwY366WYABiWYgfNzoA0uqNat3giaqx4E0+98cRf/mthO0AopWusw6IEfVIM2va6B2/PmCHe4XqM6LZfYTe67fgfBu/q8NL5n9JljJ3raJ2CjPc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5157.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(9686003)(52536014)(508600001)(66446008)(6506007)(8936002)(86362001)(7696005)(2906002)(122000001)(921005)(38100700002)(55016003)(53546011)(186003)(966005)(33656002)(5660300002)(71200400001)(66556008)(83380400001)(66946007)(110136005)(38070700005)(54906003)(8676002)(66476007)(4326008)(64756008)(76116006)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TDBtRVlrd0t6WU1NMTl0eVV0RHpkQWN1OWpuNnVIdDlIZXNHZFdrbmdkZkJ1?=
 =?utf-8?B?bFhYeTZDNmRMZm9JYVR3MjB0TWVzclBRVFpJOHhCTzZmZXlPZE5DZkF2TytR?=
 =?utf-8?B?ZFhBOTZ3WU9VOFBIOU0vZHlvRE5sU2lyT2l1R2NsalJkTXlWdldIalJMbFFS?=
 =?utf-8?B?QWtYcDhZcGlVYk9XcnBkaGpyMExIMW9kU0IzSTVSNGlqN0c1OHJUVDQ2WDBK?=
 =?utf-8?B?Y3FoUkZabXBkR0xpMnRZemNtSFUrNEI5MXN4bGljekluQjZRdVVKSmxTWmFr?=
 =?utf-8?B?Z2FJdUEyclhFSm1VeWNZTGhJb0IxQVBoVlV0MWZ6djJKWnR5STRNTktBdTRl?=
 =?utf-8?B?ZldvWjUwQVBpa1h5bEZzSVk1cUY2QXZybWNqZnNGS0E4MTZLL2hGRU54TlJk?=
 =?utf-8?B?Y0FNQ01WYmZPNkljd3Jhb0Z5MGNuTitJYjNCR1VDWWRDN25uMVVCenYwbVZa?=
 =?utf-8?B?UHhseDhZVzBZajR4ZEl1UUlXNEFrYkE5S3FrUUdZVzE1WWM3UVpTRHlWWXli?=
 =?utf-8?B?T2o2V1haTXVpZjBPMnVGOXpxNVFpWjI4ZVRwbEdOZ3hseUxLbG1Xc3ZuanRn?=
 =?utf-8?B?aXBFc3Z0OVh0TDRONWlWTUMrTzFUZzJpVVkyVVR6Ri9wM1RJWUhoZHdsVWRj?=
 =?utf-8?B?LzRZRlhuMmg4U1JaMVp1RWFvRkowbVZyeHZKd25MN3FmcjZ2VHNDSnRnbEx4?=
 =?utf-8?B?a0Z0bDc0bDhQeXJ5SEhrV1BOWnJpMHBHVm9EOE8xaEVKOHE1YkY2YVlGTExZ?=
 =?utf-8?B?MWd3OWwra0FGR0k2NTVieERXeVNod3J0UXk0QnorNjg4L3lQWWxJMkxoNWtn?=
 =?utf-8?B?K3IyNkJpanprTEV5QmU0czNJVDJ4Smo5NHpBMjVuZzFLMkNSTWN5TGtrRUdx?=
 =?utf-8?B?VE1qUjR2eXJZZkxrdWxSRk5TOGpGeTd1RDJEQUVzQnNXWU84bC9QdCttTHBj?=
 =?utf-8?B?U0VFQzZsTUREZzZqUjNweGs4OHk1bFRrWHJ3dE84U1lNRkhuSmtQNEdjbHQ5?=
 =?utf-8?B?cDhZOHRGOG13MmhST0VacDMvMmFvQ1NQNXZJUHRVL2NQYVF3b2VsZHNEQ3pN?=
 =?utf-8?B?cnR1RzU0R01qZkY0SHJsMXUvUHRwTFJ6MEgwUlMvcmhFUWdudmY1eWltVGk2?=
 =?utf-8?B?OXA5dTUreExqLzJaT3NyR05LZXdGWjhnYWFqT09Qb1UxMnJpQ2p5amF3L2hM?=
 =?utf-8?B?NzBQSGpOUFRwZWdwcldkT1F2ZkxoemtKUWcxUk00R1R3WXN4NG5vOFVIdFhm?=
 =?utf-8?B?bnJIbkRVek9sMHk4OXB1V1pzZjBVc0pwRm9JamtyaWRhS2wzeXhJRFdXaHU3?=
 =?utf-8?B?ZUpSOGt5S05jejFpUG1hcGVTMkhWTHhnRDh6RWMvdGowUmp0RiszYnpIWFRm?=
 =?utf-8?B?SER1L3plSVlHVUxRaUpNaFE3blZVV1FSb2o5OG5GL2VubWFJbjhGRmlFcmpP?=
 =?utf-8?B?cWFVdlc3WkN2dVVCMk80WGR5NHQ5WXpIV1ZyRUZSejZHdjBnV3F6YWc1eXc5?=
 =?utf-8?B?ZGI2aXNuVmFqck4vTjh4VzlMSmFFY1crWm1ta3JPTkwwaUczMW11SE15ZnZs?=
 =?utf-8?B?RmFZSStFZVBKdzJhYW9MWHp2MHdqZTdjbTR1TmlCd1BUZUZkdDNBcy81aGpo?=
 =?utf-8?B?R1pEMG5yUU1kQSt2NHhOc2lpRnZPNk5ueDc0eC9aMUd5RUgvZXNJbzF6VUc2?=
 =?utf-8?B?Q00yYmxGajdLT0M2WHhoanVBY0hrMXkwNm9PRmZTWHNmb2oydllYTk5tR0JZ?=
 =?utf-8?B?eVFhYjd1Rm9zbk9BNFA4andLdDZSdHlvbUVOd0x1dUZtcHFFNk1zZlBuK0JE?=
 =?utf-8?B?SVZKUFI1Y2xvKzJPaDNpb21zZDVodXJaa3ZlTEFNMXEzK0thNG1helZNOXdM?=
 =?utf-8?B?RkFBVCtJSW1Hayt6VmpRNSsyQTBGamtEbTliOWNnc2x3YlZlMVdCK0dGMy9G?=
 =?utf-8?B?QTRYdzl5RnVIWHdiTWoxdDAyK0ZybC9oQkIzNi9JVjN1T0k1S0lUblBsejE0?=
 =?utf-8?B?Ky85OXl3aWZac3lrc0tkdlZzOHV1ajBHWmVTL05QWVRHNElGblZFR0hZM1By?=
 =?utf-8?B?ek9laFE0TEV0aTdTSExRTVVpTHpHazgrMmNvK2o5SFlxYmE2ZG1YYklLMENx?=
 =?utf-8?B?VDRkRjVJNVMycE03RHZ6cS9HUGFHUkNwMkFnM0lnZnBIZ1cwUHAvejVIZWV6?=
 =?utf-8?B?OHlBN21NR0llWXpRTytPbkxmYVpMcHNHMXBNbUtENDZraHlvWVlvUzRCQlQx?=
 =?utf-8?B?SllSQmo4d0QyYUh5ZnJIRDZJemp6R2hTckxDbXR0QVdSVnRwZklQSEVXelZC?=
 =?utf-8?B?Q2E1TG1jVnRlZGZSRzBFell6QzF1L1FRZHo3NmhYcFhIdk5HYzZpaGZFV041?=
 =?utf-8?Q?TPjosZdONKCatLEGYJGkadf+k/BcfKLPCJuVUhLUJvO0K?=
x-ms-exchange-antispam-messagedata-1: eXFaFAD+vqbaLw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 987aa9e0-73d4-4928-5df6-08da197c1e84
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 16:23:30.3258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gNRdWmv3ng8kiehM7C4lBZl79wuOPBqPLjyKueAedCXlzn1ZX1hsjF2QjpbDo2dKgNQIYketfxq3OzGW4vJlnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3256
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR29u
ZywgUmljaGFyZCA8UmljaGFyZC5Hb25nQGFtZC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgQXByaWwg
OCwgMjAyMiAxMToyMA0KPiBUbzogTGltb25jaWVsbG8sIE1hcmlvIDxNYXJpby5MaW1vbmNpZWxs
b0BhbWQuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVyDQo+IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQu
Y29tPjsgS29lbmlnLCBDaHJpc3RpYW4NCj4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IFBh
biwgWGluaHVpIDxYaW5odWkuUGFuQGFtZC5jb20+Ow0KPiBhaXJsaWVkQGxpbnV4LmllOyBkYW5p
ZWxAZmZ3bGwuY2gNCj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9y
Zw0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vYW1kZ3B1OiBkaXNhYmxlIEFTUE0gZm9yIGxl
Z2FjeSBwcm9kdWN0cyB0aGF0DQo+IGRvbid0IHN1cHBvcnQgQVNQTQ0KPiANCj4gDQo+IE9uIDQv
OC8yMDIyIDEwOjQ3IEFNLCBMaW1vbmNpZWxsbywgTWFyaW8gd3JvdGU6DQo+ID4gW1B1YmxpY10N
Cj4gPg0KPiA+DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJv
bTogR29uZywgUmljaGFyZCA8UmljaGFyZC5Hb25nQGFtZC5jb20+DQo+ID4+IFNlbnQ6IEZyaWRh
eSwgQXByaWwgOCwgMjAyMiAxMDo0NQ0KPiA+PiBUbzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4
YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgS29lbmlnLA0KPiBDaHJpc3RpYW4NCj4gPj4gPENocmlz
dGlhbi5Lb2VuaWdAYW1kLmNvbT47IFBhbiwgWGluaHVpIDxYaW5odWkuUGFuQGFtZC5jb20+Ow0K
PiA+PiBhaXJsaWVkQGxpbnV4LmllOyBkYW5pZWxAZmZ3bGwuY2gNCj4gPj4gQ2M6IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0K
PiBsaW51eC0NCj4gPj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgTGltb25jaWVsbG8sIE1hcmlv
DQo+IDxNYXJpby5MaW1vbmNpZWxsb0BhbWQuY29tPjsNCj4gPj4gR29uZywgUmljaGFyZCA8Umlj
aGFyZC5Hb25nQGFtZC5jb20+DQo+ID4+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdTogZGlz
YWJsZSBBU1BNIGZvciBsZWdhY3kgcHJvZHVjdHMgdGhhdA0KPiBkb24ndA0KPiA+PiBzdXBwb3J0
IEFTUE0NCj4gPj4NCj4gPj4gQWN0aXZlIFN0YXRlIFBvd2VyIE1hbmFnZW1lbnQgKEFTUE0pIGZl
YXR1cmUgaXMgZW5hYmxlZCBzaW5jZSBrZXJuZWwNCj4gPj4gNS4xNC4NCj4gPj4gSG93ZXZlciB0
aGVyZSBhcmUgc29tZSBsZWdhY3kgcHJvZHVjdHMgKFdYMzIwMCBhbmQgUlg2NDAgYXJlDQo+IGV4
YW1wbGVzKQ0KPiA+PiB0aGF0DQo+ID4+IGRvIG5vdCBzdXBwb3J0IEFTUE0uIFVzZSB0aGVtIGFz
IHZpZGVvL2Rpc3BsYXkgb3V0cHV0IGFuZCBzeXN0ZW0NCj4gd291bGQNCj4gPj4gaGFuZw0KPiA+
PiBkdXJpbmcgc3VzcGVuZC9yZXN1bWUuDQo+ID4+DQo+ID4+IEFkZCBleHRyYSBjaGVjayB0byBk
aXNhYmxlIEFTUE0gZm9yIG9sZCBwcm9kdWN0cyB0aGF0IGRvbid0IGhhdmUNCj4gPj4gQVNQTSBz
dXBwb3J0Lg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIEdvbmcgPHJpY2hhcmQu
Z29uZ0BhbWQuY29tPg0KPiA+PiBMaW5rOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcv
ZHJtL2FtZC8tL2lzc3Vlcy8xODg1DQo+ID4+IC0tLQ0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyB8IDQgKysrKw0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KPiA+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kcnYuYw0KPiA+PiBpbmRleCBiYjFjMDI1ZDkwMDEuLjg5ODcxMDdmNDFlZSAxMDA2
NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jDQo+
ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KPiA+PiBA
QCAtMjAxMiw2ICsyMDEyLDEwIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3BjaV9wcm9iZShzdHJ1Y3Qg
cGNpX2Rldg0KPiA+PiAqcGRldiwNCj4gPj4gICAJaWYgKGFtZGdwdV9hc3BtID09IC0xICYmICFw
Y2llX2FzcG1fZW5hYmxlZChwZGV2KSkNCj4gPj4gICAJCWFtZGdwdV9hc3BtID0gMDsNCj4gPj4N
Cj4gPj4gKwkvKiBkaXNhYmxlIEFTUE0gZm9yIHRoZSBsZWdhY3kgcHJvZHVjdHMgdGhhdCBkb24n
dCBzdXBwb3J0IEFTUE0gKi8NCj4gPj4gKwlpZiAoKGZsYWdzICYgQU1EX0FTSUNfTUFTSykgPT0g
Q0hJUF9QT0xBUklTMTIpDQo+ID4+ICsJCWFtZGdwdV9hc3BtID0gMDsNCj4gPj4gKw0KPiA+IEkg
dGhpbmsgaXQncyBwcm9ibGVtYXRpYyB0byBkaXNhYmxlIGl0IGZvciB0aGUgZW50aXJlIGRyaXZl
ci4gIFRoZXJlIG1pZ2h0IGJlDQo+IG11bHRpcGxlDQo+ID4gQU1ER1BVcyBpbiB0aGUgc3lzdGVt
LCBhbmQgb3RoZXJzIG1heSBzdXBwb3J0IEFTUE0uDQo+IA0KPiBUaGUgInByb2JsZW0iIGFyZSBX
WDMyMDAgYW5kIFJYNjQwLCBib3RoIGFyZSBmcm9tIHRoZSBzYW1lIFBPTEFSSVMxMg0KPiBmYW1p
bHkuDQo+IA0KDQpSaWdodCBidXQgd2hhdCBpZiBzb21lIG90aGVyICJ3b3JraW5nIiBjYXJkcyBh
cmUgaW5jbHVkZWQgaW4gdGhlIHN5c3RlbSB0b28/DQpUaGVuIEFTUE0gZ2V0cyBkaXNhYmxlZCBm
b3IgdGhlbSB0b28uICBJdCBzaG91bGQgb25seSBiZSBkaXNhYmxlZCBmb3IgdGhlIHBjaV9kZXYN
CmNvcnJlc3BvbmRpbmcgdG8gcHJvYmxlbWF0aWMgR1BVcyBpbiBwcm9ibGVtYXRpYyBzaXR1YXRp
b25zLg0KDQo+ID4gQ2FuIGl0IGJlIGRvbmUganVzdCBhcyBwYXJ0IG9mIHByb2JlIGZvciBQb2xh
cmlzPw0KPiA+DQo+ID4+ICAgCWlmIChhbWRncHVfdmlydHVhbF9kaXNwbGF5IHx8DQo+ID4+ICAg
CSAgICBhbWRncHVfZGV2aWNlX2FzaWNfaGFzX2RjX3N1cHBvcnQoZmxhZ3MgJiBBTURfQVNJQ19N
QVNLKSkNCj4gPj4gICAJCXN1cHBvcnRzX2F0b21pYyA9IHRydWU7DQo+ID4+IC0tDQo+ID4+IDIu
MjUuMQ0K
