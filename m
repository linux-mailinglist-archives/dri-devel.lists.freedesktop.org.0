Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0619571103
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 05:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9179718BC0B;
	Tue, 12 Jul 2022 03:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2079.outbound.protection.outlook.com [40.107.102.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0B418B429;
 Tue, 12 Jul 2022 03:56:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KawD7d0U5VQnEtTttn4yhhNSAv/C3xU66Qkdh/e+lqjfEmFx+X2xvsVPthAgtZs/91OOfWDeVrWK48JWZXNeBoBaCYZ1Z5uLffolYzSfjVBgUBeTAnN4JaxAdY6//Vsi+yaN7mO1sSr5qLO/Qq2jAE0psuPVYYZhPGXUfOuH3D34vi3pRtY91iGBkhDGectRfIqd2AxkkOACsVktQ40l/U7xxzYnDsA1KwKFvsm3J9p/7Dc1rZLo66tTGR0k4rQAyb4XzH/YYj+NdKbfsGSrZd1K3tvje57QnByAPpJic3v+XAyHAs1iyK3ubuHEd2pMns0QGVloMkM1q9osCKBqGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3COSo/LWdMgfbs/z1o+yaxg5TQmNY0h8xF7CaYveCg=;
 b=bBB1lJPl2NbaLiVKvcWmzUjJmN2IDGYIKmJwHI6qjiQcftReQau6RIqGFPU8HxPc+onPgr2Q2en1qw+YHw64Ab8syXHsw9gaVXS47ezCeM3NxGGX9r3z0DJfB4+Aw4Ble0X7e6B5sB4AE/1S1nHhBQ0ocwa5uxDyhyXu7+dEXiIR2TVE+vx+XzDXAgpslrUJXt9EjfeHo27WSEJlm7kzRMa4u6upGdZJyZws/hHVeZLWDNUObNgE+K1/HlpJjt5MaLJ4+BGx57awyx4WzD7aohkEmAKJ4KOdOAfvMJYQmVDXrkD1JJ2faxee0mSzHWW0QPvLCatAxLvWBr9mlaQMAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3COSo/LWdMgfbs/z1o+yaxg5TQmNY0h8xF7CaYveCg=;
 b=HLdqSu170j16j7PTBgX89csM8dQjjOgm5L5yxb8DEp8fjMZNfMZ7NKH5mQ3yKHQUTPW98LUMl5rymurtvJS8/htXFQx38UhgWZ3LVKrfGdqYug9kbrXFI6veYUNcpsPINdUjfKlPBWsxIWJtzdCj1L3NXrQIkzQkzPXKEMUpO7U=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 MN2PR12MB3072.namprd12.prod.outlook.com (2603:10b6:208:c5::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15; Tue, 12 Jul 2022 03:56:50 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::5ca4:efdd:b7b0:53c6]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::5ca4:efdd:b7b0:53c6%5]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 03:56:49 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: =?utf-8?B?QW5kcsOpIEFsbWVpZGE=?= <andrealmeid@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "Xiao, Jack" <Jack.Xiao@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/1] drm/amd/pm: Implement get GFXOFF status for vangogh
Thread-Topic: [PATCH v2 1/1] drm/amd/pm: Implement get GFXOFF status for
 vangogh
Thread-Index: AQHYlV1pN57xPzq8ukKJlIFO71z3wq16HABQ
Date: Tue, 12 Jul 2022 03:56:49 +0000
Message-ID: <DM6PR12MB26194DEB8A7B8E307EA5C305E4869@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20220711193458.158462-1-andrealmeid@igalia.com>
In-Reply-To: <20220711193458.158462-1-andrealmeid@igalia.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-07-12T03:56:46Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=c38cfc9f-10b6-4f58-bd4f-fec308e5c44e;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 085c82e3-b6cc-496a-36a2-08da63ba8c7e
x-ms-traffictypediagnostic: MN2PR12MB3072:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6ceTXUcUjafCFNNAWh7sN1ZgrTZlfuQUTU33QymLWaBjmJNGWB5IvRtPTgXr9InXgzJGIk1YHbeyW4FtMA3MtaKy8BdIZlmjxVX0s6hLUQZmgV5yrJMT0nuwvg9vikOUFSxCY6jHKtDCEr3JDJjFt6sQTJH81Me4MUs56eX6G0aNI6VkJatsJ5MtethWeFBDDuZB7XwpnMSya3G6aaz+2P/U07s6dg2gA03eNY3FogM8Z+4K9ALvDJnpcrolT9A+8nJ2QNJL7SNun/iYmv/C5Cw6BZSHPymWO+ojswF1jUU2onDGMzPl9Y47T4Qhyk5lsISZE4VJ5ZKLrc0gII9QKK5H7Zxb/dKsTG9yEWouaJP8xl+VCJRFCL5UUkt1tfmRc/yLpWCg6CbsNjJ/5qoSZusZMQ9p/1G8QN2V1gOZhTILv0smL7cdbdvBWAH1P1qJwwK6uZm9zRHyFGKi/hmeA1nYm9F8HqUMUqiRZZz70jYCgH5z4E8VHo6l8PEOtC3BDg7ifkqhDZ1vvgM0sBDrIOXCTLZxvT6F9LjzXxZmpo3cTGZ2pwKyOThsfdjgranTkz1MbeeiqNVQ7D62wDRWxXe8l8F1Mux9dHRSSM4hS0kRSheJkhJTJUnDIuLKFN6G+8cbBNIwk42LWFNll5YAUaEA2/y0/SHRVRIeiNB+NT63vqBR5zWmUJnJlZvRSmbBvbh6hsrRfbcQgJbty33n4l+R09zIX0zLtqRYQCnI45yPiN0nOGrNDR41FnujUm4eGWNO7FEh4W9WRdLKWFEWnwknMV5hMHPAPTzq6+bQNEsJo4k24M7KczofiHjVwjUiD0EF/e6MIJ/JL+xPvNu99A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(316002)(55016003)(8676002)(66446008)(64756008)(76116006)(66556008)(4326008)(66946007)(71200400001)(66476007)(52536014)(110136005)(83380400001)(5660300002)(33656002)(8936002)(478600001)(9686003)(41300700001)(2906002)(38100700002)(7696005)(53546011)(122000001)(186003)(921005)(6506007)(26005)(38070700005)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVFqQTd1WTIxamROcDFOL2lkbXQ4SGlHQU1lMm5KOHBUNEhEMXErZ3hCeWVT?=
 =?utf-8?B?RHl6NHRTK1ltbTgraDlNOUI3a2tjd083SnI1T3V5bEN3ODBla1pnM0ZubkJr?=
 =?utf-8?B?dUZiK0U3ckdrczBBdThUU2RGdUk4UlJKcm1yVHFCb0RJQ3RWY0xZUkZJUThz?=
 =?utf-8?B?WkNSUTVpalhwaWd3QkYvU2djUVNnTm5uNXU4ZjhwYlI2QUgxMHZSd0F4c0R0?=
 =?utf-8?B?Ry9SK1BVU0JwTlhGem81TlRaNUx3c2JYOWdZa3V6Zks0MXM3TjlOejZmc1Z0?=
 =?utf-8?B?QmJvVDJMQnZUYmt3ZmQ1SjJtUWJPVzBFMm1MZHJ4ekI0R1UxU1V4Zit2NGl1?=
 =?utf-8?B?aFJDeTVYR2FzMk1JaGNHL0ZOVWI2clk0WkVpWU54S2xadUdMcStTanZvTjVp?=
 =?utf-8?B?Kzg5TUVrSFMzbWFyOTBNRkNBUkNPNzdNMnRLdFhIZGxNSzYwa1p3TjZDUHdU?=
 =?utf-8?B?ZTBXUm1haUxIZjlId2ExcVQ5Skh4SnczWVdzUmtXTEU4OCtvTjNoOWRlSXo2?=
 =?utf-8?B?RmYxSnIrK2JKRUo2YkZjUi92dkJsRUtIeVhmVnkrc1d0VDd3Y3dZSFdySUdW?=
 =?utf-8?B?bWRCV2N1MVg2ZThWcWJ4ZWhGRWlKeFE3VmNvOGE1WHBIdFlJMGZlWHpOU2Yy?=
 =?utf-8?B?ZXo0TmZpcmJ3SzNOMHhFM2c3NFNmU2hXQm1EQnRKMXZ3Y0hwMjRJSkxIVGRH?=
 =?utf-8?B?WFZ2MkJyMnZXb2luUzBLUnRmY0dWOUloUjErN2xTMVlYOER3dmZ2WXhER2Zl?=
 =?utf-8?B?d29oeWpseElmSVhIUFdCWlZBek5JZHhWYTR5aGFYUFI2UU50bFdJZ2g1R3BT?=
 =?utf-8?B?bTFVVWl2aXlTSDNxYkkzZU0wd1pZT3hhaE1Nc3FhbmJubkthcVVYMlhQV0Fw?=
 =?utf-8?B?dkRHKzlpYlBJckhtWWJYTmFMRThjTUVYNHlseEJJNFJrREVTUGpLYlo0Vnkr?=
 =?utf-8?B?NWVSbmd3eU00RkpaSDVoVytmNjRONWdyOEtVQ1Y2aDZ1QWw5Z3g2TGdvTmtG?=
 =?utf-8?B?SVdyS2dZU0F5NFRGSHNXVlpEN01uQzhKaG1DV1IydUVadWQzREFZS1p5WjAx?=
 =?utf-8?B?dFk1UG56MFZVUkxScXZxbmwwZ0poODc3QnBoVkJxQWZtd3U0NVFBb29RLzFn?=
 =?utf-8?B?ckxsRE1MUDUxRS92dzNUN1UvOTRTN2FCQ21aTFY4SzlDbE5nblRYY3hsSG9X?=
 =?utf-8?B?T2pyeDY4R3NybHlrb21VZUFhQmQreGdybzBMalVrMUF3MHQ3NEF4QndPNDUr?=
 =?utf-8?B?SHNnNUJSc0h5b1BNSVE3WXpPa3hDOXpUcyt6azk3bHQzaEpMS0VyTHMzVFhS?=
 =?utf-8?B?RFhOLzg5UUtKU2FvVDVveWM5UHBTWGpyUjFNOURJV2JDdFZsU2FtenJEUDBp?=
 =?utf-8?B?VDBpUXlTYjJwNDFjWHBrWEx0Z0w0TWFId21RRzNVZjZ4bXNHMmFxS2llMWJu?=
 =?utf-8?B?eGZWTmZlM05Ld1BHVjN2Q0MzZW1NY20vU2MvOUJiV2toc3kwODVEdzV6UE9l?=
 =?utf-8?B?SmZ6MHo4dUF5amcrZHg3d0tuZ09ONjB2Q3JGMWlBeWVQOGhpaldUYURXMVZ4?=
 =?utf-8?B?L1lISW5NdE1wS2d6a3Q3TlI0Z1hpWTZXYzY1L1hxMXo5K0tJU1dZeGhUZG1x?=
 =?utf-8?B?bENxMEV1ZnZWdEw1Q1I3c0pveldNNGlIY1hOcnp4V2xBMHovLy9OYmlJaS9L?=
 =?utf-8?B?UjduNlZIMisyU1cwdjJEYnpoQlRjZWI2WmM2dUx0b1ZEWW1qM3ZBRkY0UFE5?=
 =?utf-8?B?RSsvWVpuTkN0Si9JSGdnZDQ0MS9RZXQ3TTVhQzN6YU90akFlYTh1c21pZXRi?=
 =?utf-8?B?TDhFcGtnQXltRFg5WUliclZ6am5vTGxhTWJRaWdkdDJoTkwwZUdubW1kS3Fh?=
 =?utf-8?B?S05qbWVQcVZMM1RUY0FvYjlabWl6Zmh2V1BNcytqMVdXNkxYMFBMMDNaYkJ3?=
 =?utf-8?B?Q1NTTjlRdHFaVkRZd0lWcDhDbTQyWDFTUjFoS3RXZ2VnaUdTdVJCMlpON2Q0?=
 =?utf-8?B?ZXlQcWlDdVFVQ3NTZXA1dFFGcFZybHFNK09mTTFZZ3UwRFprODBmdHJaMlcy?=
 =?utf-8?B?QmxnUXNoU2s2UktjQ05HM0UwNkc3MjZrQkk4ZW4reEEwYXU5SklIZVZobDhI?=
 =?utf-8?Q?qQ8E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 085c82e3-b6cc-496a-36a2-08da63ba8c7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2022 03:56:49.8182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aZoEt284dHW8BUAYalF/nun9jXQ3qbtC2Qzb2t4FfBKK+9s93mJsWiJHBvvbmuWW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3072
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
Cc: "kernel-dev@igalia.com" <kernel-dev@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCkFja2VkLWJ5OiBFdmFuIFF1YW4g
PGV2YW4ucXVhbkBhbWQuY29tPg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJl
aGFsZiBPZg0KPiBBbmRyw6kgQWxtZWlkYQ0KPiBTZW50OiBUdWVzZGF5LCBKdWx5IDEyLCAyMDIy
IDM6MzUgQU0NCj4gVG86IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1k
LmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuDQo+IDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBQ
YW4sIFhpbmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPjsgRGF2aWQNCj4gQWlybGllIDxhaXJsaWVk
QGxpbnV4LmllPjsgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPjsgWmhhbmcsIEhhd2tp
bmcNCj4gPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQu
Y29tPjsgS3VlaGxpbmcsDQo+IEZlbGl4IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPjsgWGlhbywg
SmFjayA8SmFjay5YaWFvQGFtZC5jb20+OyBhbWQtDQo+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdl
ci5rZXJuZWwub3JnDQo+IENjOiBBbmRyw6kgQWxtZWlkYSA8YW5kcmVhbG1laWRAaWdhbGlhLmNv
bT47IGtlcm5lbC1kZXZAaWdhbGlhLmNvbQ0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMS8xXSBkcm0v
YW1kL3BtOiBJbXBsZW1lbnQgZ2V0IEdGWE9GRiBzdGF0dXMgZm9yDQo+IHZhbmdvZ2gNCj4gDQo+
IEltcGxlbWVudCBmdW5jdGlvbiB0byBnZXQgY3VycmVudCBHRlhPRkYgc3RhdHVzIGZvciB2YW5n
b2doLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcsOpIEFsbWVpZGEgPGFuZHJlYWxtZWlkQGln
YWxpYS5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIGZyb20gdjE6DQo+IC0gU3F1YXNoIGNvbW1pdHMg
aW4gYSBzaW5nbGUgb25lDQo+IA0KPiAgLi4uL2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdTExL3Zh
bmdvZ2hfcHB0LmMgIHwgMzgNCj4gKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDM4IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3BtL3N3c211L3NtdTExL3ZhbmdvZ2hfcHB0LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3BtL3N3c211L3NtdTExL3ZhbmdvZ2hfcHB0LmMNCj4gaW5kZXggZTJkOGFjOTBjZjM2Li44OTUw
NGZmOGU5ZWQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvc211
MTEvdmFuZ29naF9wcHQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3Nt
dTExL3ZhbmdvZ2hfcHB0LmMNCj4gQEAgLTQ2LDYgKzQ2LDE4IEBADQo+ICAjdW5kZWYgcHJfaW5m
bw0KPiAgI3VuZGVmIHByX2RlYnVnDQo+IA0KPiArLy8gUmVnaXN0ZXJzIHJlbGF0ZWQgdG8gR0ZY
T0ZGDQo+ICsvLyBhZGRyZXNzQmxvY2s6IHNtdWlvX3NtdWlvX1NtdVNtdWlvRGVjDQo+ICsvLyBi
YXNlIGFkZHJlc3M6IDB4NWEwMDANCj4gKyNkZWZpbmUgbW1TTVVJT19HRlhfTUlTQ19DTlRMCQkJ
MHgwMGM1DQo+ICsjZGVmaW5lIG1tU01VSU9fR0ZYX01JU0NfQ05UTF9CQVNFX0lEWAkJMA0KPiAr
DQo+ICsvL1NNVUlPX0dGWF9NSVNDX0NOVEwNCj4gKyNkZWZpbmUgU01VSU9fR0ZYX01JU0NfQ05U
TF9fU01VX0dGWF9jb2xkX3ZzX2dmeG9mZl9fU0hJRlQNCj4gCTB4MA0KPiArI2RlZmluZSBTTVVJ
T19HRlhfTUlTQ19DTlRMX19QV1JfR0ZYT0ZGX1NUQVRVU19fU0hJRlQNCj4gCTB4MQ0KPiArI2Rl
ZmluZSBTTVVJT19HRlhfTUlTQ19DTlRMX19TTVVfR0ZYX2NvbGRfdnNfZ2Z4b2ZmX01BU0sNCj4g
CTB4MDAwMDAwMDFMDQo+ICsjZGVmaW5lIFNNVUlPX0dGWF9NSVNDX0NOVExfX1BXUl9HRlhPRkZf
U1RBVFVTX01BU0sNCj4gCTB4MDAwMDAwMDZMDQo+ICsNCj4gICNkZWZpbmUgRkVBVFVSRV9NQVNL
KGZlYXR1cmUpICgxVUxMIDw8IGZlYXR1cmUpDQo+ICAjZGVmaW5lIFNNQ19EUE1fRkVBVFVSRSAo
IFwNCj4gIAlGRUFUVVJFX01BU0soRkVBVFVSRV9DQ0xLX0RQTV9CSVQpIHwgXA0KPiBAQCAtMjA0
NSw2ICsyMDU3LDMxIEBAIHN0YXRpYyBpbnQgdmFuZ29naF9tb2RlMl9yZXNldChzdHJ1Y3QNCj4g
c211X2NvbnRleHQgKnNtdSkNCj4gIAlyZXR1cm4gdmFuZ29naF9tb2RlX3Jlc2V0KHNtdSwgU01V
X1JFU0VUX01PREVfMik7DQo+ICB9DQo+IA0KPiArLyoqDQo+ICsgKiB2YW5nb2doX2dldF9nZnhv
ZmZfc3RhdHVzIC0gR2V0IGdmeG9mZiBzdGF0dXMNCj4gKyAqDQo+ICsgKiBAc211OiBhbWRncHVf
ZGV2aWNlIHBvaW50ZXINCj4gKyAqDQo+ICsgKiBHZXQgY3VycmVudCBnZnhvZmYgc3RhdHVzDQo+
ICsgKg0KPiArICogUmV0dXJuOg0KPiArICogKiAwCS0gR0ZYT0ZGIChkZWZhdWx0IGlmIGVuYWJs
ZWQpLg0KPiArICogKiAxCS0gVHJhbnNpdGlvbiBvdXQgb2YgR0ZYIFN0YXRlLg0KPiArICogKiAy
CS0gTm90IGluIEdGWE9GRi4NCj4gKyAqICogMwktIFRyYW5zaXRpb24gaW50byBHRlhPRkYuDQo+
ICsgKi8NCj4gK3N0YXRpYyB1MzIgdmFuZ29naF9nZXRfZ2Z4b2ZmX3N0YXR1cyhzdHJ1Y3Qgc211
X2NvbnRleHQgKnNtdSkNCj4gK3sNCj4gKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHNt
dS0+YWRldjsNCj4gKwl1MzIgcmVnLCBnZnhvZmZfc3RhdHVzOw0KPiArDQo+ICsJcmVnID0gUlJF
RzMyX1NPQzE1KFNNVUlPLCAwLCBtbVNNVUlPX0dGWF9NSVNDX0NOVEwpOw0KPiArCWdmeG9mZl9z
dGF0dXMgPSAocmVnICYNCj4gU01VSU9fR0ZYX01JU0NfQ05UTF9fUFdSX0dGWE9GRl9TVEFUVVNf
TUFTSykNCj4gKwkJPj4NCj4gU01VSU9fR0ZYX01JU0NfQ05UTF9fUFdSX0dGWE9GRl9TVEFUVVNf
X1NISUZUOw0KPiArDQo+ICsJcmV0dXJuIGdmeG9mZl9zdGF0dXM7DQo+ICt9DQo+ICsNCj4gIHN0
YXRpYyBpbnQgdmFuZ29naF9nZXRfcG93ZXJfbGltaXQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUs
DQo+ICAJCQkJICAgdWludDMyX3QgKmN1cnJlbnRfcG93ZXJfbGltaXQsDQo+ICAJCQkJICAgdWlu
dDMyX3QgKmRlZmF1bHRfcG93ZXJfbGltaXQsDQo+IEBAIC0yMTk5LDYgKzIyMzYsNyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IHBwdGFibGVfZnVuY3MNCj4gdmFuZ29naF9wcHRfZnVuY3MgPSB7DQo+
ICAJLnBvc3RfaW5pdCA9IHZhbmdvZ2hfcG9zdF9zbXVfaW5pdCwNCj4gIAkubW9kZTJfcmVzZXQg
PSB2YW5nb2doX21vZGUyX3Jlc2V0LA0KPiAgCS5nZnhfb2ZmX2NvbnRyb2wgPSBzbXVfdjExXzBf
Z2Z4X29mZl9jb250cm9sLA0KPiArCS5nZXRfZ2Z4X29mZl9zdGF0dXMgPSB2YW5nb2doX2dldF9n
ZnhvZmZfc3RhdHVzLA0KPiAgCS5nZXRfcHB0X2xpbWl0ID0gdmFuZ29naF9nZXRfcHB0X2xpbWl0
LA0KPiAgCS5nZXRfcG93ZXJfbGltaXQgPSB2YW5nb2doX2dldF9wb3dlcl9saW1pdCwNCj4gIAku
c2V0X3Bvd2VyX2xpbWl0ID0gdmFuZ29naF9zZXRfcG93ZXJfbGltaXQsDQo+IC0tDQo+IDIuMzcu
MA0K
