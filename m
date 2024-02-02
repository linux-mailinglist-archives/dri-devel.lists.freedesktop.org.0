Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1A08475EA
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 18:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0BB10EFB4;
	Fri,  2 Feb 2024 17:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZExq61NZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B4810EFB4;
 Fri,  2 Feb 2024 17:14:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQI00+52M5P2cr49OG9gZjF7qDpNqZXtfZLI/MrrxLo5GsoawYZmmlKAHdX2l4QD0x6CbxHGaqBag2cp9ldhSWlnjuO6uSgoKKmUPG04OgBmS+7pd9UM7TfuSH4SLSwyGrpfGK4QR8VZYG0lvYbgiMUTJATrAZFtk5IaFGQ95V7Cx4HbXWPJ3CfjyOD7rgpJjz1nFCfUe4owHzMSlWutKakzSII6RSSCzq7PynNQhlzuL+2HmWGRqVxG/53Z4/8yxcpqNVpB1mni4Cl7ZXWO73XwysSlACgSh4JkFEQeS9kQ22HOQOPs/x9szUnXwpdfu/uXuoT1a3dKqEeil45UhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f18HsL8TiYKjeE11bBXiNOqZTOkhukTR3afuRebksAA=;
 b=CAHCAmUcW8aRdTHGDojc5rci5cTKN4T0GXozwMTyMsK+yW1vw87zimqVab11YOBNYkYF6WhiZ9DK9ix82wwRE9ctDCrCJcqVCqgHcAUxdlpyxTyAPTgDJBEP9CJ4Qe2ExpPA3UJY2gf59T5UD4kYkl0PKPst6fAFrhdc7EWW9l1d8CUNO5eXpHay3dVDWdic7Ux0mOkzPC/yVoT7kq1aY8nKU2GZgPM10vx5zWJOim+B3rKOwpvDARx3LMHe8CyazraIcqkkKpeVpHbuL/yiy2E+6mHy1V9a5Uv9/kaEQtz46FL6Fwo6EvRUbsJEQbmGjHqo5hlVljMbL9MZ269mkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f18HsL8TiYKjeE11bBXiNOqZTOkhukTR3afuRebksAA=;
 b=ZExq61NZ3lC0R5l5LAh+FO2kvJ3H60+1v23DyDViq2SdOPqx8LXNch9K7dNknHR6LVhGGYE8+XP6T3Wr2+mg3BsqGxVi8gTmVOParhuFu1CGWylVwo0aRGqzbll3d0Qyhkchwd8FzAiciej/ARC34J18lO6Z2QcRp8s4KaPq3ivDt/k6V5gEOYDf/GkU+nIv/GZ2DUebipX3+T/t3HpWs8i2kI9vb/Qw+SKXTHdYqyAjWDEaJG1OpVXxF4NpjzOhGK6sbzmc0dLUQjQhI/pz2NMUeO/Gal0NLAwLtpOTNZRTGGGIwk2uV5Njq2jgk4r4lkKAna5rpanYmvU2jS+3VA==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by SJ2PR12MB8737.namprd12.prod.outlook.com (2603:10b6:a03:545::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Fri, 2 Feb
 2024 17:14:29 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::9f0f:632e:815c:f953]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::9f0f:632e:815c:f953%7]) with mapi id 15.20.7228.029; Fri, 2 Feb 2024
 17:14:29 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@redhat.com" <dakr@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kherbst@redhat.com" <kherbst@redhat.com>, "lyude@redhat.com"
 <lyude@redhat.com>, "airlied@gmail.com" <airlied@gmail.com>
Subject: Re: [PATCH 1/2] drm/nouveau: don't fini scheduler if not initialized
Thread-Topic: [PATCH 1/2] drm/nouveau: don't fini scheduler if not initialized
Thread-Index: AQHaVWujZdZ67CmKRUWEtG0ranjbRrD3S7cA
Date: Fri, 2 Feb 2024 17:14:29 +0000
Message-ID: <eeecdd4b5daff8a831b6f11671a2205504e5173a.camel@nvidia.com>
References: <20240202000606.3526-1-dakr@redhat.com>
In-Reply-To: <20240202000606.3526-1-dakr@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|SJ2PR12MB8737:EE_
x-ms-office365-filtering-correlation-id: ae60e4cf-528a-4831-d3be-08dc24126a8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ton3MkBdJsFogRgKzh0vMRuFoOr+y4Keh7PMACKG2ivfp8T4p5AgkMdiTiEsWRZBxYJyEbSoRSdvcSmESR1m+X2Qwf2xIS3HYlRb0a/3d04/9q2QvZq1kgbwQhs4a7IR/k6ik3yW54GVY9PvRbFLJvAedpyYUJtKd0atvw7Vc3In2PIbdPi5QT5a/mZnu7YN3rkbyMG+q/iLOSNA8Jq1K62lQ7eBJxlLanqjsh7h4vpJW5U8LEAGi/t2N7tahRrerdZK7HyGVtD69/+8oQQSW+B3AMvANERWJf5Nv0VC7NXl4XypwfGHffDZ7b7exPeIGnuI6Gn6Az9Mce+dv0XaqK7AHEst51f0C068CeZA3mffshRginpzO98z4G1C52CNNyFEUjtHCe38DWgAfF6vKIz6QgSiit2dlBPzfrDRM4HILFd6S3FC+l98nTZ0lcMJmM+AB1vBrFmYra5NcFJVoQvBkbxG8fB8CDHHzf8+IuVAKl3WOknQso4JFbXrYqycCz/C0VDPpw82o6gXLEa7Gg1o8v1f/94m9rMCRlYXRGxB6KClohoo1ZPb/5FLE0/+IshmwfnIWTDQEJ/6Dltrj+lFNzQJeFrsip7pKS68pEBThzH1y/fgzsZsIz7GXO3Z
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(366004)(376002)(136003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(38070700009)(4744005)(36756003)(2906002)(41300700001)(316002)(76116006)(66476007)(86362001)(66446008)(66946007)(54906003)(64756008)(110136005)(66556008)(71200400001)(2616005)(6506007)(6512007)(26005)(5660300002)(478600001)(83380400001)(6486002)(38100700002)(122000001)(8936002)(4326008)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czdJdVEwVFNxR1U3bHpFZ29Xcmd5N3QyK3FTb2VkMGpERStFK2ZZM2xhek83?=
 =?utf-8?B?SEp6Qk0rcnI0RE1weUVvVFh6YnJhZmk3M1g4ZzBxakVrRHNxdEg4S2srNTZT?=
 =?utf-8?B?MkxERzVhLzlCUVBRVnNIT1EweHV2RXBDenhVUG1wNWYzZUhrVkJJVVNOU0U3?=
 =?utf-8?B?Q0drQVVXdHZ2emluT0xYQ09BTG02NC9sVVhrZU5qQnU4TGYremtvSW5HT3k2?=
 =?utf-8?B?OFBJaHhvaHh0dm9zaGN0QWJCVnFSbmNXNHNYN0hXV09GdE52Rnl1NENRMzBK?=
 =?utf-8?B?cnpqaXFRS2ZRTlQ0ZWZvTDFHTHExYzNmaTJ6a2NKTjk4YXZjcWhmOVFwd1Js?=
 =?utf-8?B?L2J5YzlSeWlIQ2I0YU1MQWxPMFlDd2JUd1VON2tHWmRjdXR1ZWRBaFg3OW9V?=
 =?utf-8?B?MkloclVmQmtLdzBJU3lSamJybkFuVFoxVTY1M2s2ZDBnOVdFQTZyMkhJblJp?=
 =?utf-8?B?MmdlMlhQMHBnd0RlVitEN1NBOEphYTdUZmsrMElFdE5aUGowMVFjWk5EUStk?=
 =?utf-8?B?T2tUWFNtY0R6SkVqSEMwK09mVnBnTUpQRU9yM21SNDlKVUFuYmNQRTg2Nk5E?=
 =?utf-8?B?eVhRU1JMbjZ1RGtwQTVyeWpVMHFkVE9zc1NTNlZ6SDA4YWU0TWVqZCtmUTVF?=
 =?utf-8?B?MHAxQmtwRDNZOGR0NEdSWXYxWGREQmlYektNV2krT2FnektreGJFN01jUzJP?=
 =?utf-8?B?Rjd2ODdva2lrUm1ueFIzUUZQZUpkbEFIb0ZUUzFiZ21la25lN215RitYSVlx?=
 =?utf-8?B?b3lLWnhnZEFOdGpOTkN6V3QwM2Jic295eDNvelYzZm9EU0syeElqUGxuWE9j?=
 =?utf-8?B?Qm5tRWNxSVVWdW0veDZ4cS9kc0o3R2xDa2JsZHlEVUNGMk5IWkNBeXZIa09v?=
 =?utf-8?B?aEdVakplSU9zOURhOUZRTHZyR1dKVzNVNGh4Q0VlMXI2Y1laQnlwYWFFVnBp?=
 =?utf-8?B?bXFzTVhoeXNaYk1USTkybUNBdjhjOElKcXJJRWZFMFBicVlnbW11akhSOVlE?=
 =?utf-8?B?N2tPNzNUV1g3ZnUyV0xUaE9Za2had2lDUmk1emZLZmdUUGFYcnlLZ1JpaEZt?=
 =?utf-8?B?dlpaTEFBYWtYZ3AxMnVBKzh1MlVaZk9hdUp3bi80QjZFNUp6TENyNy9tNnJk?=
 =?utf-8?B?dVJxL0hwc1AyTktMbjdjSkRjQ2wrZXB0VHc0SjhOVFNBUmVpVk9qUnpkT3Nt?=
 =?utf-8?B?cUVzQ0RueXowTlhERjdBNm5BampyRmlEK2dLb1NEMWJleGJ3ZktJcW5lLzBq?=
 =?utf-8?B?RkZIM2haU3NZZjZmNTJCZHBad2x2RFd6R3Yxd1pqaVczK0NYSkJOVVpHajdw?=
 =?utf-8?B?dEIvSk5MSGZTd3drU00rbjFuV2RaUnkwbklPbXBEVjczZXp2dFV4b1lqdFJW?=
 =?utf-8?B?dlZzWTJEM1dXSEI2TytwWDlXVnhWWGVBOHRyenFzcGZza2V6N0RBQXlGZkZH?=
 =?utf-8?B?UkhLczErZUM1WXRPNmFEMnJ4ZHZkdUJRclZlOEV0bjBtK3AwZ2ZkNlRyYnNI?=
 =?utf-8?B?S29GVzF1VE12Qmh0T0diY09RYms2SHJtSVVkNTlCTHhBa3ZPaFJ0NytWNlBY?=
 =?utf-8?B?cHNqYXRNT3A5MFlMY0tNQ0pkNWZ0ME1Ta1g4cjhzcmtTZGZORzF5K1cxYk1H?=
 =?utf-8?B?MWZxN3VZb1JJSXV3WGNkSHBBUzJjQVloVGJqck9kUlptOW5zMEcxd3UyNkxW?=
 =?utf-8?B?Q3JMblNmL2xiUXZ2TnZlN0ZCV1h6QjdaY01DcnUwZURROWxGQ0JUQjJuOGZZ?=
 =?utf-8?B?S1Y2VlB0bm5yM0tDODZDSm5ycGFET3VWV3U2M0ZPaExHQ1djTSttSERFZkNZ?=
 =?utf-8?B?RWhHbWxjMzB4dzd0aTgzMWlBejZEK05udTZPOUNTNzZ2c1FQekVORmtDV2RD?=
 =?utf-8?B?Y2Qyd2JXSVZuN2ZrRURxLzBaeSt6RVl6UkNIVjZWRFRzKzFFTU1kZmxwRG4z?=
 =?utf-8?B?ZGJscHJvK0VDWnJicGdUR1dBUDc0L3FZREpXK2UyY21Kcnp5WlgwdXdCT09y?=
 =?utf-8?B?Z2JEcEpRaEE4T3U4eU9rbnhRM3l6SUJ0U2hITnBGa1ZpejRTYmMyVzFZdHI5?=
 =?utf-8?B?Lysycnh5Q0gyRVI0OTg4bm9jK1BhZEhtYkFhZXRINURHSHFHTU5Rb3lFd0Zt?=
 =?utf-8?Q?69SiqEtEAilbjiMRxeGJXalef?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E27554A363F93F4E98AD99C32AE1A757@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae60e4cf-528a-4831-d3be-08dc24126a8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2024 17:14:29.5331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6MwDZxI72aBb+9C3SGa2Ch/teyx7Ipe5oNG3wpegMgOmK/InKPPk12++VGQeBff4uoea/F2PcPyXs4Uhaqa72w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8737
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDI0LTAyLTAyIGF0IDAxOjA1ICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiBub3V2ZWF1X2FiaTE2X2lvY3RsX2NoYW5uZWxfYWxsb2MoKSBhbmQgbm91dmVhdV9jbGlf
aW5pdCgpIHNpbXBseSBjYWxsDQo+IHRoZWlyIGNvcnJlc3BvbmRpbmcgKl9maW5pKCkgY291bnRl
cnBhcnQuIFRoaXMgY2FuIGxlYWQgdG8NCj4gbm91dmVhdV9zY2hlZF9maW5pKCkgYmVpbmcgY2Fs
bGVkIHdpdGhvdXQgc3RydWN0IG5vdXZlYXVfc2NoZWQgZXZlcg0KPiBiZWluZyBpbml0aWFsaXpl
ZCBpbiB0aGUgZmlyc3QgcGxhY2UuDQoNClRoYW5rcywgSSd2ZSBjb25maXJtZWQgdGhhdCB0aGVz
ZSBwYXRjaGVzIGRvIGZpeCB0aGUgcHJvYmxlbS4gIA0KDQo=
