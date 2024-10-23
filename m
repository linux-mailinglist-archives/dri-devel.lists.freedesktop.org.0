Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9319ACB47
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 15:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80F810E7D4;
	Wed, 23 Oct 2024 13:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bfZG5yUj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2057.outbound.protection.outlook.com [40.107.101.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A64F10E7E3;
 Wed, 23 Oct 2024 13:31:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oBxNc7tclFnvF5Eeunj9ZnUi9XCuhxjlsv7cyio2WklUc++4Q2DgayGoWaHFpk58RfYM1eOvCJV9XdL7S7EyFmE3cLBb75Ks/Fh6v/AosaHr0SZbCR5SVRM0RsZ+aMftGtQK9/DxDVJvMeHmqhVIdRq+jhfX+k4p/+hzqB+VgxPgi5vl9UfbXYw+XpE6TwtrlIeHx+1qJQzmeG64EAKlCp+P+0Zxk96QHNlGFiJWbc5vs/9rHB4YIhW6O4EFwZrgGSHhU0fGept5HZLVsiJ8eAYYvm00e1xUCtCwfLopk3sdYZCCBg/Xk2QSWOZDqb8zZfyiJdTatXJQeJv7aS32uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYLDXArSDRxzTceI+WD5rJw7SAzqPrVy7He0Cmn9A1k=;
 b=UL2gS4JMjU5AG/VA9VXrlJXg2+pqmEugzLjSgjNKLWrGNCHxrTWPPdNz2Wz7Dcb18vnbTwlyzrZe4b7aMMG1UHxCVt9Av7ZJ6oBO7xvAwxsrQwArJBYR7E0V87ANjtnl7TA7khkZDR4f65raNBypgaC8x4sIu5OhBdusP9CmzmzCJxI6nFJu59uBccbt6Hn2bzcQspu5PikwggKdpr2UlLtFSlZ6pa2QuQh/mvqhJPLnQpGuwwpRO74ulJQODDE63ciORHpHks/GJB3yz8RW3WyFZJ6+x5kgdjtMxBeLhJ0AJnywfOg7wUleHyuC1U2zXT93nMz/pffxAESMsp63Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYLDXArSDRxzTceI+WD5rJw7SAzqPrVy7He0Cmn9A1k=;
 b=bfZG5yUjVQjjx9/92VnIP0F+Dh3K4onoiu8qw1rb95gsbp0HCVijdUgtFnYDteJOLZ81QGqh/gbBLamCcF1gcLjpxuxNVPOb/8IQJUL8JWcn0wxljKPTxDDCJYDPbaMXiagTuAeIZNu8xo0+eXeafYZJl58kLpbf8pnTRrZH6GU=
Received: from SA1PR12MB8599.namprd12.prod.outlook.com (2603:10b6:806:254::7)
 by IA0PR12MB7774.namprd12.prod.outlook.com (2603:10b6:208:430::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Wed, 23 Oct
 2024 13:31:30 +0000
Received: from SA1PR12MB8599.namprd12.prod.outlook.com
 ([fe80::25da:4b98:9743:616b]) by SA1PR12MB8599.namprd12.prod.outlook.com
 ([fe80::25da:4b98:9743:616b%3]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 13:31:30 +0000
From: "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH v5 4/4] drm/amdgpu: track bo memory stats at runtime
Thread-Topic: [PATCH v5 4/4] drm/amdgpu: track bo memory stats at runtime
Thread-Index: AQHbIWJhHP+NzSvtr0Wud0WRwWwvcrKSaWAAgABzHCCAAB6NAIAA/2oAgAAavQCAACfTAIAACe2AgAADXQCAAA5OsA==
Date: Wed, 23 Oct 2024 13:31:30 +0000
Message-ID: <SA1PR12MB859920867E49C80E5059C97BED4D2@SA1PR12MB8599.namprd12.prod.outlook.com>
References: <20241018133308.889-1-Yunxiang.Li@amd.com>
 <20241018133308.889-5-Yunxiang.Li@amd.com>
 <1057097f-02f4-4f0f-9ac5-37aa84570b47@amd.com>
 <SA1PR12MB8599E3DD01B4A45AD7CA71FAED4C2@SA1PR12MB8599.namprd12.prod.outlook.com>
 <53382fc0-0686-46af-9285-0cd6aec314ae@amd.com>
 <cd2b57c6-1947-4dbd-bae8-ecdb2b42de72@igalia.com>
 <47e4b79b-2c08-4ee8-b472-5482bc159856@amd.com>
 <6d324aca-76fd-420b-9bae-6c0984e659e1@igalia.com>
 <7503c3fd-deea-4eb9-9324-ab4f13f70332@amd.com>
 <2141a4f4-bcf4-4419-8756-fb5afd6c7f3a@igalia.com>
In-Reply-To: <2141a4f4-bcf4-4419-8756-fb5afd6c7f3a@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=8fea7a6d-92f9-4ef8-8b3f-e663cec44db5;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-10-23T13:15:53Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8599:EE_|IA0PR12MB7774:EE_
x-ms-office365-filtering-correlation-id: 862629da-98ca-4c3d-3255-08dcf367013d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RjhFOVBvTGJCYXRLQXRZODViWWtCWUlXZnptK05PdlpUVzFZcVZiUHhjVjMz?=
 =?utf-8?B?ZVgrREVoZ3JyWmJuRmtoeFZuUko5NUptYThKeS9zZlpTTC9pb21haVlEempM?=
 =?utf-8?B?MWVjZWxpeFgzNk83cGtKS2krdUMxM044QmFHTUdza0lNaXdsYnUzQVRNbkI2?=
 =?utf-8?B?aUtvbjJXSTZvQjY4d0Q1QUtnRjRCU0x2bmJvY0UrT0UzVjd1ZXVZS0dCeWZU?=
 =?utf-8?B?VzF2UXdaMmFLL0thN1FNb2tublVkYjVaeEpjRWxzd3ZQYmt6ZGdLZkZWQnQz?=
 =?utf-8?B?d29WUHEvdGh2OC9tdVU2YzJXaGU0dE85YXlVdG1CTU5yZ2ROVmVHVUxPVmlw?=
 =?utf-8?B?WUFGWFlROHFINnE4MEpKcXJtenE5bk9qaWc4dE5URDhVU2ltSjMwcHp3cDFC?=
 =?utf-8?B?Y3JlTmdmckY2VGRxcGs3RGgvRDd6V1I5alVOY1ZLRi9WYjN2QnlnZEo0RWJW?=
 =?utf-8?B?KzZ6RnZTVGk3TGkrVDJVRmVpQkN4VmpiOWdNd205NWlVSE1GRjh2YzFSbHI3?=
 =?utf-8?B?Vi9mR096OStnWlZ2c0NjZkZFM3FJa1NaSml5SDRIakMvSG1GWE12Y01KWnlJ?=
 =?utf-8?B?Z1oyeWEwemNRL1ZzSnF4YksyTnVKS1ZHMUZSV3hQamlST0tFVlFsUnI0cTBI?=
 =?utf-8?B?eXBVN1lNVDdVNEZWNGdQd1FtT3NFb2tzZVlyY3NQbkE3ZnNvWDdMVUpxaUto?=
 =?utf-8?B?a0h4SVRSd1dvZTBkQ1ZxYmF0SllEUXlFYTk2eE9QQTlJdDJoYW5OMVdwNWNK?=
 =?utf-8?B?Nmt1aEpmWDVQTmNSYk5wR3h2QXVWdUZvTFZLUm9BczRvSzg3b2ZZN3c5K05O?=
 =?utf-8?B?ZjdwU3c2UkJpSkVHSUI1bDJwNU5uUTlsbEJHaWZJSENiaXlFWUlDa1p0WGpw?=
 =?utf-8?B?SStHZjZOOXFremwvejM2TlpCVHpaM0RZQXVLMW9CYXpmWU95RkpFUVBSUDRa?=
 =?utf-8?B?WFJPWTJJZzJKcXdUa0ZhcmNVakRMa2d6VG11cUNJU1ZoODVBTElXYTlkaWU0?=
 =?utf-8?B?cEQzWk1LSHBPc0UwTFAwS1Y5ZjQ4UlpoM0xxQXoyaWJra2E3VHVyWGYvUVFw?=
 =?utf-8?B?amphK0hQd3ZyRGJtaytraXJjRS9ncnpkaURKNDFBbXRXeUR4MnRCYXVyaS9B?=
 =?utf-8?B?SHJuRUJ6TlBON1dOb1J3MDZBY2JldlF6aHJpNU8vRXV5Vm9NN3hhRWl1anBY?=
 =?utf-8?B?YnM5aGxid0pzWDFmMXgvZGFyQThRKzRZVS80VHlYbVBkMEl5Y3E3U1JOcWhy?=
 =?utf-8?B?dS9pRVkvbmhwbk05L250eEhCWnFBYkdsc2lLVTh1Zzl5TlBkR0t1bmFiaTdB?=
 =?utf-8?B?Yzh3QnYwNTJpTlFnMmVJdk52bnVuYUs4TG1uVTlJNmdWQ05RRVhmRGxRVE1D?=
 =?utf-8?B?ZUZIeDZUaWpZQ05Oa3g4Q1NoNEhrN3dBbGladVB4Vm42QWNMb3pjQXcvdmxr?=
 =?utf-8?B?UEYzY2JYc2ZiN01rNkE3S3I1QXhRVGVaTmxjR2dMQy9NejZqUmp4UFdUaG84?=
 =?utf-8?B?aEJIQUxZMjVEdTN3bE04Z3NTcy9DZ041WFJSMERpMnhBQ2pEOGN5c2syWEpG?=
 =?utf-8?B?dDJjWW1mTzUzbFFNYjBpUGpvUHA5NmRWRzFEbkhmdEpNQ21oTC9wMUt4c3Rs?=
 =?utf-8?B?RWpxQjVkQnp5dGpUS2Y3eXFWUEt2WDByL0krY1pQNWxVL1RPOXJ3VndUVStC?=
 =?utf-8?B?UmFqaTd2VTA4OUIveWtPaUxVWEpsL0g1cDBGSUIxMXBUa1YrcW5UeEZGMm9i?=
 =?utf-8?B?MitESFVQNVc2VVQvT29nYXZFc0I5YzVvVmE0ZURTS2ZsUXNBTnE2bzlPUEQ5?=
 =?utf-8?Q?YAMdD0/OoWbUaHN09JJHtncnHpOVUiWl++kr8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8599.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S25FSzZSc1VwNlNkMkZSeUhtaXRMcEtpVG9qSWg0TmEreGdVWkxiWFY4bXZm?=
 =?utf-8?B?MXBoMjBiTmxWNGlCam85Ulh4d0w2YjV3cDZybDVaOFhmdDdHRzV6VFg0RkFW?=
 =?utf-8?B?YnEvYStueUlIWlpndzNjTk1KYUU3UGZFdE1TeFlrazNDVENPNlpCVUJMWVA4?=
 =?utf-8?B?Ti9pa2RvNksxTUZGV1IySFlNRlhGVFhzUy8wWjgxSDNlU2VTbVZpOFZZQXk3?=
 =?utf-8?B?ek1JR05sdk5hNW1YMWJraXpwZWU4SVRUQjFEalBuMTFRS2NxM3pLYk1NV1p1?=
 =?utf-8?B?SDA4bG56TXcyVkg3T3FwYXVSZCtFMzkyci9ZU3ZZZFhPS1NQbURvWXd2N2hu?=
 =?utf-8?B?bzEvUU5BZkNmWjk5M1RVRXh2dnlETzI5dDFJOHljckY2UWdkSmlscjRuQ1BD?=
 =?utf-8?B?R3JDU2dxT3o3K0oyNXY4QkV4bmNHZUdIREw0c2Zyb0h0UzFROHlQa2tISWxQ?=
 =?utf-8?B?NDU4cy9ONitQTmRjdWNIdkQ1TWxtcE54c0IybGpFRHk1cHdBZm1FSXhoM09o?=
 =?utf-8?B?VjVRelRDZ2ExRTJtRTVZMVdHN1diT0pnM29UTjl1YXIrcjNuekxtTUlFOFlm?=
 =?utf-8?B?RHVEV3dtUlJiejhGMTVTY200SlhMeHZmYUVNQXllN21lWEdLRDZIUTU0dTZ5?=
 =?utf-8?B?dk9XQVRIYzVaUVdzNlcrVHA0VnZIWERvZ2VTeENITEEzR1g3OEEyYm12OWt1?=
 =?utf-8?B?TWNRRkN6MVZMMkRsUlM1ditCOVRIODRGRXFibFZPVlNzUkg0YlF4Zy9scHI3?=
 =?utf-8?B?NVJzMVB4emRDQmtobG5LcVprK1VHbmgrWHRGVWZQdVhjYVd1OWhTMFZZVDB6?=
 =?utf-8?B?Q3lWanoxc0JGWExwQ3ZheHk1dzFEQlZBVGdiOXdOaEo5WEFPNzA0WktJa0ZV?=
 =?utf-8?B?dGd2aWxTMkN2aUV5Y3JTMWRjTm5NNEsvcFR2NEJRT0lIL2VFaXM5eW9YZWpl?=
 =?utf-8?B?c1JaSEp5OUxaVUk5MTI0aVVIQzA4YU1qbFgzZlNOTzE3bEprL1ZoMjlWblFH?=
 =?utf-8?B?NTBjeEhpWU5HQXBmd3U5bjBGNEJzeVR2Q0F0TzNPSU1rOHpSWk8rWjByN3JV?=
 =?utf-8?B?NUtIZ0RYUTk4eS9tRHNaNGpRMFpGNFZDRFd6VVpQRDloUE9Xa3c4RGFBNTFT?=
 =?utf-8?B?MzhNd0lEdkdMaWFwVGc0bVpnY1U4Y3JDQnNaeE43Q2M4aENRSnN4SlorZG81?=
 =?utf-8?B?M05JZExFejRQSE9BZG9KM3FvUzNkbGNWQ0RXRUtHNWo3bGhGVzdiR1g2Zzk2?=
 =?utf-8?B?YTc4L3ZubWttdFlQL2tLM1BxTjI0UUpUMHhENHU2QmxuZnFrYWttT3IwVnFT?=
 =?utf-8?B?cnlwSkNWblRkRTNNSmRBTjFLaHdhSDR4Q0pzTVlTNzh3TXRPQ1JncnJTRjV0?=
 =?utf-8?B?bCtVQ1J2RFZiMzZaWXBFY2V2T1JCMEViZ1lHUnVwNU1HZ3ZUS3VWY3h3Z0hY?=
 =?utf-8?B?WVQ0Y3V3RWhsN0JHbXJ4Y1NCMnJQaVh0MTdaekxrMjViTU1FR2oxNjdMWmRB?=
 =?utf-8?B?RWx6WXF2V3hhbTVORC9kN1A3cjVpbnlXd1RCazRaT0ZpVGVubFE5WHBKV2R3?=
 =?utf-8?B?djFUMHFTVy94VTZGWG03aGQrcEZkNC9tRkJnamZBWGkxbnpweExmbnpzS3dn?=
 =?utf-8?B?TEJzb0k2M2RjNWQ5N0pTR1JQaWdwTVozMFBUN1ZvTkUyNW9GQkZzeDB4WGs2?=
 =?utf-8?B?aWpab0dYSzVQbUd3U045RUs0UGlsVkQvSWF5elBEdjUvalowQkh1OXNhUUlV?=
 =?utf-8?B?TUJlM1FZWEhpczg0bGRkSFlCbVB4cHlZTjhZV1RHUHpMeUdzcTdLbkxiM01C?=
 =?utf-8?B?b2Uybzl6bCs5bVA3U2RUaWZVRVkyV0NKR2Q1czZMWDBNYmpVODRuUGpRTXJS?=
 =?utf-8?B?VC8xVElZbzlqc3djeDlNaVRLNE03ajdwTCtEMzFBcHAxKzRkTmcreE9tTFpw?=
 =?utf-8?B?N0pIbUNUNUw4OEgrRGN4NmxheUc1c0pJTVNsRTVjZHRKVEd3RWxjMGdXbHln?=
 =?utf-8?B?ajhkSE11R3lYc0oyUW8vQ044bFdBd2hZOUkrQ2x5QzdET2tEUlhIT1NITFJS?=
 =?utf-8?B?S0NVa3p3UjNlNlFnYWNVYVRtMi9FejdXNFFIY3hUaEdMemdNTnMxbkl1QldN?=
 =?utf-8?Q?pOzo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8599.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 862629da-98ca-4c3d-3255-08dcf367013d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 13:31:30.7231 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m0a1dfRJTeujOoCF+0wkhK5IcIhR//Y/va2QQlUQFkE7Ao397KolDhL13FYAZ7WZCpARksKfck6hCk0DNSQEuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7774
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiBGcm9tOiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaWdhbGlhLmNvbT4NCj4g
U2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDIzLCAyMDI0IDg6MjUNCj4gT24gMjMvMTAvMjAyNCAx
MzoxMiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCj4gPiBBbSAyMy4xMC4yNCB1bSAxMzozNyBz
Y2hyaWViIFR2cnRrbyBVcnN1bGluOg0KPiA+Pg0KPiA+PiBPbiAyMy8xMC8yMDI0IDEwOjE0LCBD
aHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KPiA+Pj4gQW0gMjMuMTAuMjQgdW0gMDk6Mzggc2Nocmll
YiBUdnJ0a28gVXJzdWxpbjoNCj4gPj4+Pg0KPiA+Pj4+IE9uIDIyLzEwLzIwMjQgMTc6MjQsIENo
cmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+ID4+Pj4+IEFtIDIyLjEwLjI0IHVtIDE3OjE3IHNjaHJp
ZWIgTGksIFl1bnhpYW5nIChUZWRkeSk6DQo+ID4+Pj4+PiBbUHVibGljXQ0KPiA+Pj4+Pj4NCj4g
Pj4+Pj4+Pj4gK3N0YXRpYyB1aW50MzJfdCBmb2xkX21lbXR5cGUodWludDMyX3QgbWVtdHlwZSkg
ew0KPiA+Pj4+Pj4+IEluIGdlbmVyYWwgcGxlYXNlIGFkZCBwcmVmaXhlcyB0byBldmVuIHN0YXRp
YyBmdW5jdGlvbnMsIGUuZy4NCj4gPj4+Pj4+PiBhbWRncHVfdm1fIG9yDQo+ID4+Pj4+Pj4gYW1k
Z3B1X2JvXy4NCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4+PiArICAgLyogU3F1YXNoIHByaXZhdGUgcGxh
Y2VtZW50cyBpbnRvICdjcHUnIHRvIGtlZXAgdGhlIGxlZ2FjeQ0KPiA+Pj4+Pj4+PiB1c2Vyc3Bh
Y2Ugdmlldy4NCj4gPj4+Pj4+PiAqLw0KPiA+Pj4+Pj4+PiArICAgc3dpdGNoIChtZW1fdHlwZSkg
ew0KPiA+Pj4+Pj4+PiArICAgY2FzZSBUVE1fUExfVlJBTToNCj4gPj4+Pj4+Pj4gKyAgIGNhc2Ug
VFRNX1BMX1RUOg0KPiA+Pj4+Pj4+PiArICAgICAgICAgICByZXR1cm4gbWVtdHlwZQ0KPiA+Pj4+
Pj4+PiArICAgZGVmYXVsdDoNCj4gPj4+Pj4+Pj4gKyAgICAgICAgICAgcmV0dXJuIFRUTV9QTF9T
WVNURU07DQo+ID4+Pj4+Pj4+ICsgICB9DQo+ID4+Pj4+Pj4+ICt9DQo+ID4+Pj4+Pj4+ICsNCj4g
Pj4+Pj4+Pj4gK3N0YXRpYyB1aW50MzJfdCBib19nZXRfbWVtdHlwZShzdHJ1Y3QgYW1kZ3B1X2Jv
ICpibykgew0KPiA+Pj4+Pj4+IFRoYXQgd2hvbGUgZnVuY3Rpb24gYmVsb25ncyBpbnRvIGFtZGdw
dV9iby5jDQo+ID4+Pj4+PiBEbyB5b3UgbWVhbiBib19nZXRfbWVtdHlwZSBvciBmb2xkX21lbXR5
cGU/IEkgZGViYXRlZCB3aGV0aGVyDQo+ID4+Pj4+PiBib19nZXRfbWVtdHlwZSBzaG91bGQgZ28g
aW50byBhbWRncHVfdm0uYyBvciBhbWRncHVfYm8uYywgYW5kDQo+ID4+Pj4+PiBzaW5jZSBpdCdz
IHVzaW5nIGZvbGRfbWVtdHlwZSBhbmQgb25seSB1c2VmdWwgZm9yIG1lbW9yeSBzdGF0cw0KPiA+
Pj4+Pj4gYmVjYXVzZSBvZiBmb2xkaW5nIHRoZSBwcml2YXRlIHBsYWNlbWVudHMgSSBqdXN0IGxl
ZnQgdGhlbSBoZXJlDQo+ID4+Pj4+PiB0b2dldGhlciB3aXRoIHRoZSBvdGhlciBtZW0gc3RhdHMg
Y29kZS4NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBJIGNhbiBtb3ZlIGl0IHRvIGFtZGdwdV9iby5jIG1h
a2UgaXQgcmV0dXJuIHRoZSBtZW10eXBlIHZlcmJhdGltDQo+ID4+Pj4+PiBhbmQganVzdCBmb2xk
IGl0IHdoZW4gSSBkbyB0aGUgYWNjb3VudGluZy4NCj4gPj4+Pj4NCj4gPj4+Pj4gSSB0aGluayB0
aGF0IGZvbGRpbmcgR0RTLCBHV1MgYW5kIE9BIGludG8gc3lzdGVtIGlzIGFsc28gYSBidWcuIFdl
DQo+ID4+Pj4+IHNob3VsZCByZWFsbHkgbm90IGRvaW5nIHRoYXQuDQo+ID4+Pj4+DQo+ID4+Pj4+
IEp1c3Qgd2FudGVkIHRvIHBvaW50IG91dCBmb3IgdGhpcyByb3VuZCB0aGF0IHRoZSBjb2RlIHRv
IHF1ZXJ5IHRoZQ0KPiA+Pj4+PiBjdXJyZW50IHBsYWNlbWVudCBmcm9tIGEgQk8gc2hvdWxkIHBy
b2JhYmx5IGdvIGludG8gYW1kZ3B1X2JvLmMNCj4gPj4+Pj4gYW5kIG5vdCBhbWRncHVfdm0uYw0K
PiA+Pj4+Pg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+Pj4gKyAgIHN0cnVjdCB0dG1fcmVzb3VyY2UgKnJl
cyA9IGJvLT50Ym8ucmVzb3VyY2U7DQo+ID4+Pj4+Pj4+ICsgICBjb25zdCB1aW50MzJfdCBkb21h
aW5fdG9fcGxbXSA9IHsNCj4gPj4+Pj4+Pj4gKyAgICAgICAgICAgW2lsb2cyKEFNREdQVV9HRU1f
RE9NQUlOX0NQVSldICAgICAgPQ0KPiA+Pj4+Pj4+PiArVFRNX1BMX1NZU1RFTSwNCj4gPj4+Pj4+
Pj4gKyAgICAgICAgICAgW2lsb2cyKEFNREdQVV9HRU1fRE9NQUlOX0dUVCldICAgICAgPSBUVE1f
UExfVFQsDQo+ID4+Pj4+Pj4+ICsgICAgICAgICAgIFtpbG9nMihBTURHUFVfR0VNX0RPTUFJTl9W
UkFNKV0gICAgID0NCj4gVFRNX1BMX1ZSQU0sDQo+ID4+Pj4+Pj4+ICsgICAgICAgICAgIFtpbG9n
MihBTURHUFVfR0VNX0RPTUFJTl9HRFMpXSAgICAgID0NCj4gPj4+Pj4+Pj4gK0FNREdQVV9QTF9H
RFMsDQo+ID4+Pj4+Pj4+ICsgICAgICAgICAgIFtpbG9nMihBTURHUFVfR0VNX0RPTUFJTl9HV1Mp
XSAgICAgID0NCj4gPj4+Pj4+Pj4gK0FNREdQVV9QTF9HV1MsDQo+ID4+Pj4+Pj4+ICsgICAgICAg
ICAgIFtpbG9nMihBTURHUFVfR0VNX0RPTUFJTl9PQSldICAgICAgID0NCj4gQU1ER1BVX1BMX09B
LA0KPiA+Pj4+Pj4+PiArICAgICAgICAgICBbaWxvZzIoQU1ER1BVX0dFTV9ET01BSU5fRE9PUkJF
TEwpXSA9DQo+ID4+Pj4+Pj4gQU1ER1BVX1BMX0RPT1JCRUxMLA0KPiA+Pj4+Pj4+PiArICAgfTsN
Cj4gPj4+Pj4+Pj4gKyAgIHVpbnQzMl90IGRvbWFpbjsNCj4gPj4+Pj4+Pj4gKw0KPiA+Pj4+Pj4+
PiArICAgaWYgKHJlcykNCj4gPj4+Pj4+Pj4gKyAgICAgICAgICAgcmV0dXJuIGZvbGRfbWVtdHlw
ZShyZXMtPm1lbV90eXBlKTsNCj4gPj4+Pj4+Pj4gKw0KPiA+Pj4+Pj4+PiArICAgLyoNCj4gPj4+
Pj4+Pj4gKyAgICAqIElmIG5vIGJhY2tpbmcgc3RvcmUgdXNlIG9uZSBvZiB0aGUgcHJlZmVycmVk
IGRvbWFpbiBmb3INCj4gPj4+Pj4+Pj4gYmFzaWMNCj4gPj4+Pj4+Pj4gKyAgICAqIHN0YXRzLiBX
ZSB0YWtlIHRoZSBNU0Igc2luY2UgdGhhdCBzaG91bGQgZ2l2ZSBhDQo+ID4+Pj4+Pj4+ICtyZWFz
b25hYmxlDQo+ID4+Pj4+Pj4+ICsgICAgKiB2aWV3Lg0KPiA+Pj4+Pj4+PiArICAgICovDQo+ID4+
Pj4+Pj4+ICsgICBCVUlMRF9CVUdfT04oVFRNX1BMX1ZSQU0gPCBUVE1fUExfVFQgfHwNCj4gVFRN
X1BMX1ZSQU0gPA0KPiA+Pj4+Pj4+IFRUTV9QTF9TWVNURU0pOw0KPiA+Pj4+Pj4+PiArICAgZG9t
YWluID0gZmxzKGJvLT5wcmVmZXJyZWRfZG9tYWlucyAmDQo+ID4+Pj4+Pj4+ICtBTURHUFVfR0VN
X0RPTUFJTl9NQVNLKTsNCj4gPj4+Pj4+Pj4gKyAgIGlmIChkcm1fV0FSTl9PTl9PTkNFKCZhZGV2
LT5kZGV2LA0KPiA+Pj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgZG9tYWluID09IDAg
fHwgLS1kb21haW4gPj0NCj4gPj4+Pj4+Pj4gQVJSQVlfU0laRShkb21haW5fdG9fcGwpKSkNCj4g
Pj4+Pj4+PiBJdCdzIHBlcmZlY3RseSBsZWdhbCB0byBjcmVhdGUgYSBCTyB3aXRob3V0IGEgcGxh
Y2VtZW50LiBUaGF0DQo+ID4+Pj4+Pj4gb25lIGp1c3Qgd29uJ3QgaGF2ZSBhIGJhY2tpbmcgc3Rv
cmUuDQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+IFRoaXMgaXMgbGlmdGVkIGZyb20gdGhlIHByZXZpb3Vz
IGNoYW5nZSBJJ20gcmViYXNpbmcgb250by4gSQ0KPiA+Pj4+Pj4gdGhpbmsgd2hhdCBpdOKAmXMg
dHJ5aW5nIHRvIGRvIGlzIGlmIHRoZSBCTyBkb2Vzbid0IGhhdmUgYQ0KPiA+Pj4+Pj4gcGxhY2Vt
ZW50LCB1c2UgdGhlICJiaWdnZXN0IiAoVlJBTSA+IFRUID4gU1lTVEVNKSBwcmVmZXJyZWQNCj4g
Pj4+Pj4+IHBsYWNlbWVudCBmb3IgdGhlIHB1cnBvc2Ugb2YgYWNjb3VudGluZy4gUHJldmlvdXNs
eSB3ZSBqdXN0DQo+ID4+Pj4+PiBpZ25vcmUgQk9zIHRoYXQgZG9lc24ndCBoYXZlIGEgcGxhY2Vt
ZW50LiBJIGd1ZXNzIHRoZXJlJ3MNCj4gPj4+Pj4+IGFyZ3VtZW50IGZvciBnb2luZyB3aXRoIGVp
dGhlciBhcHByb2FjaGVzLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBJIHdhcyBub3QgYXJndWluZywgSSdt
IHNpbXBseSBwb2ludGluZyBvdXQgYSBidWcuIEl0J3MgcGVyZmVjdGx5DQo+ID4+Pj4+IHZhbGlk
IGZvciBiby0+cHJlZmVycmVkX2RvbWFpbnMgdG8gYmUgMC4NCj4gPj4+Pj4NCj4gPj4+Pj4gU28g
dGhlIGZvbGxvd2luZyBXQVJOX09OKCkgdGhhdCBubyBiaXQgaXMgc2V0IGlzIGluY29ycmVjdC4N
Cj4gPj4+Pj4NCj4gPj4+Pj4+DQo+ID4+Pj4+Pj4+ICsgICAgICAgICAgIHJldHVybiAwOw0KPiA+
Pj4+Pj4+PiArICAgcmV0dXJuIGZvbGRfbWVtdHlwZShkb21haW5fdG9fcGxbZG9tYWluXSkNCj4g
Pj4+Pj4+PiBUaGF0IHdvdWxkIG5lZWQgc3BlY3VsYXIgZXhlY3V0aW9uIG1pdGlnYXRpb24gaWYg
SSdtIG5vdA0KPiA+Pj4+Pj4+IGNvbXBsZXRlbHkgbWlzdGFrZW4uDQo+ID4+Pj4+Pj4NCj4gPj4+
Pj4+PiBCZXR0ZXIgdXNlIGEgc3dpdGNoL2Nhc2Ugc3RhdGVtZW50Lg0KPiA+Pj4+Pj4+DQo+ID4+
Pj4+PiBEbyB5b3UgbWVhbiBjaGFuZ2UgdGhlIGFycmF5IGluZGV4aW5nIHRvIGEgc3dpdGNoIHN0
YXRlbWVudD8NCj4gPj4+Pj4NCj4gPj4+Pj4gWWVzLg0KPiA+Pj4+DQo+ID4+Pj4gRGlkIHlvdSBt
ZWFuIGFycmF5X2luZGV4X25vc3BlYz8NCj4gPj4+DQo+ID4+PiBZZXMuDQo+ID4+Pg0KPiA+Pj4+
IERvbWFpbiBpcyBub3QgYSBkaXJlY3QgdXNlcnNwYWNlIGlucHV0IGFuZCBpcyBjYWxjdWxhdGVk
IGZyb20gdGhlDQo+ID4+Pj4gbWFzayB3aGljaCBzYW5pdGl6ZWQgdG8gYWxsb3dlZCB2YWx1ZXMg
cHJpb3IgdG8gdGhpcyBjYWxsLiBTbyBJDQo+ID4+Pj4gKnRoaW5rKiBzd2l0Y2ggaXMgYW4gb3Zl
cmtpbGwgYnV0IGRvbid0IG1pbmQgaXQgZWl0aGVyLiBKdXN0DQo+ID4+Pj4gY29tbWVudGluZyBG
V0lXLg0KPiA+Pj4NCj4gPj4+IEkgbWlzc2VkIHRoYXQgdGhlIG1hc2sgaXMgYXBwbGllZC4NCj4g
Pj4+DQo+ID4+PiBUaGlua2luZyBtb3JlIGFib3V0IGl0IEknbSBub3Qgc3VyZSBpZiB3ZSBzaG91
bGQgZG8gdGhpcyBjb252ZXJzaW9uDQo+ID4+PiBpbiB0aGUgZmlyc3QgcGxhY2UuIElJUkMgVHZy
dGtvIHlvdSBvbmNlIHN1Z2dlc3RlZCBhIHBhdGNoIHdoaWNoDQo+ID4+PiBzd2l0Y2hlZCBhIGJ1
bmNoIG9mIGNvZGUgdG8gdXNlIHRoZSBUVE0gcGxhY2VtZW50IGluc3RlYWQgb2YgdGhlDQo+ID4+
PiBVQVBJIGZsYWdzLg0KPiA+Pg0KPiA+PiBNYXliZSA4ZmIwZWZiMTAxODQgKCJkcm0vYW1kZ3B1
OiBSZWR1Y2UgbWVtX3R5cGUgdG8gZG9tYWluIGRvdWJsZQ0KPiA+PiBpbmRpcmVjdGlvbiIpIGlz
IHdoYXQgYXJlIHlvdSB0aGlua2luZyBvZj8NCj4gPg0KPiA+IFllcywgZXhhY3RseSB0aGF0IG9u
ZS4NCj4gPg0KPiA+Pg0KPiA+Pj4gR29pbmcgbW9yZSBpbnRvIHRoaXMgZGlyZWN0aW9uIEkgdGhp
bmsgd2hlbiB3ZSB3YW50IHRvIGxvb2sgYXQgdGhlDQo+ID4+PiBjdXJyZW50IHBsYWNlbWVudCB3
ZSBzaG91bGQgcHJvYmFibHkgYWxzbyB1c2UgdGhlIFRUTSBQTCBlbnVtZXJhdGlvbg0KPiA+Pj4g
ZGlyZWN0bHkuDQo+ID4+DQo+ID4+IEl0IGRvZXMgdGhpcyBhbHJlYWR5LiBUaGUgcGxhY2VtZW50
IGZsYWdzIGFyZSBqdXN0IHRvICJpbnZlbnQiIGEgVFRNDQo+ID4+IFBMIGVudW0gd2hlbiBiby0+
dGJvLnJlc291cmNlID09IE5VTEwuDQo+ID4NCj4gPiBBaCwgZ29vZCBwb2ludCEgSSB0aG91Z2gg
d2Ugd291bGQgZG8gdGhlIG1hcHBpbmcgdGhlIG90aGVyIHdheSBhcm91bmQuDQo+ID4NCj4gPiBJ
biB0aGlzIGNhc2UgdGhhdCBpcyBldmVuIG1vcmUgc29tZXRoaW5nIHdlIHNob3VsZCBwcm9iYWJs
eSBub3QgZG8gYXQgYWxsLg0KPiA+DQo+ID4gV2hlbiBiby0+dGJvLnJlc291cmNlIGlzIE5VTEwg
dGhlbiB0aGlzIEJPIGlzbid0IHJlc2lkZW50IGF0IGFsbCwgc28NCj4gPiBpdCBzaG91bGQgbm90
IGFjY291bnQgdG8gcmVzaWRlbnQgbWVtb3J5Lg0KPg0KPiBJdCBkb2Vzbid0LCBvbmx5IGZvciB0
b3RhbC4gSSBzaG91bGQgaGF2ZSBwYXN0ZWQgbW9yZSBjb250ZXh0Li46DQo+DQo+ICAgICAgIHN0
cnVjdCB0dG1fcmVzb3VyY2UgKnJlcyA9IGJvLT50Ym8ucmVzb3VyY2U7IC4uLg0KPiAgICAgICAg
ICAvKiBEUk0gc3RhdHMgY29tbW9uIGZpZWxkczogKi8NCj4NCj4gICAgICAgICAgc3RhdHNbdHlw
ZV0udG90YWwgKz0gc2l6ZTsNCj4gICAgICAgICAgaWYgKGRybV9nZW1fb2JqZWN0X2lzX3NoYXJl
ZF9mb3JfbWVtb3J5X3N0YXRzKG9iaikpDQo+ICAgICAgICAgICAgICAgICAgc3RhdHNbdHlwZV0u
ZHJtLnNoYXJlZCArPSBzaXplOw0KPiAgICAgICAgICBlbHNlDQo+ICAgICAgICAgICAgICAgICAg
c3RhdHNbdHlwZV0uZHJtLnByaXZhdGUgKz0gc2l6ZTsNCj4NCj4gICAgICAgICAgaWYgKHJlcykg
ew0KPiAgICAgICAgICAgICAgICAgIHN0YXRzW3R5cGVdLmRybS5yZXNpZGVudCArPSBzaXplDQo+
DQo+IFNvIGlmIG5vIGN1cnJlbnQgcGxhY2VtZW50IGl0IGRvZXMgbm90IGNvdW50IHRvd2FyZHMg
ZHJtLXJlc2lkZW50LSwgb25seQ0KPiBkcm0tdG90YWwtICh3aGljaCBpcyBkcm0ucHJpdmF0ZSAr
IGRybS5yZXNpZGVudCkuIFRvdGFsIGFuZCByZXNpZGVudCBpbnRlbmQgdG8gYmUNCj4gYW5hbG9n
dWUgdG8gZm9yIGluc3RhbmNlIFZJUlQgYW5kIFJFUyBpbiB0b3AoMSksIG9yIFZaUyBhbmQgUlNT
IGluIHBzKDEpLg0KPg0KPiA+PiBBZ2FpbiwgYmFzZWQgb2YgdGhlIHNhbWUgZW51bS4gTm90IHN1
cmUgaWYgeW91IGhhdmUgc29tZXRoaW5nIG90aGVyDQo+ID4+IGluIG1pbmQgb3IgeW91IGFyZSBo
YXBweSB3aXRoIHRoYXQ/DQo+ID4NCj4gPiBJIHRoaW5rIHRoYXQgZm9yIGRybS10b3RhbC0qIHdl
IHNob3VsZCB1c2UgdGhlIEdFTSBmbGFncyBhbmQgZm9yDQo+ID4gZHJtLXJlc2lkZW50LSogd2Ug
c2hvdWxkIHVzZSB0aGUgVFRNIHBsYWNlbWVudC4NCj4NCj4gQWdyZWVkISA6KQ0KPg0KDQpPb2Yg
SSBtaXNzZWQgdGhlIGRpc3RpbmN0aW9uIGJldHdlZW4gcmVzaWRlbnQgYW5kIHRvdGFsIGFzIHdl
bGwuIEp1c3Qgd2FudCB0byBkb3VibGUgY29uZmlybSB0aGUgZHJtLXRvdGFsLSBzZW1hbnRpY3Mu
DQoNCkRvZXMgZHJtLXRvdGFsLSB0cmFjayB0aGUgQk9zIHRoYXQgcHJlZmVyIHRoZSBwbGFjZW1l
bnQgKGRlcml2ZWQgZnJvbSB0aGUgcHJlZmVycmVkIGRvbWFpbikgYW5kIGRybS1yZXNpZGVudC0g
dHJhY2sgdGhlIGFjdHVhbCBwbGFjZW1lbnQsIG9yIGRvZXMgZHJtLXRvdGFsLSB0cmFjayBkcm0t
cmVzaWRlbnQtIHBsdXMgQk9zIHRoYXQgZG9uJ3QgaGF2ZSBhIHBsYWNlbWVudCBidXQgcHJlZmVy
cyBoZXJlPw0KDQo+ID4+DQo+ID4+IFRoZW4gd2hhdCBUZWRkeSBkb2VzIGlzIElNTyBvbmx5IHRh
bmdlbnRpYWwsIGhlIGp1c3QgY2hhbmdlcyB3aGVuDQo+ID4+IHN0YXRzIGFyZSBjb2xsZWN0ZWQg
YW5kIG5vdCB0aGlzIGFzcGVjdC4NCj4gPg0KPiA+IFllYWgsIHJpZ2h0IGJ1dCB3ZSBzaG91bGQg
cHJvYmFibHkgZml4IGl0IHVwIGluIHRoZSByaWdodCB3YXkgd2hpbGUgb24gaXQuDQo+DQo+IE9r
YXksIHdlIGp1c3QgbmVlZCB0byBhbGlnbiBvbiBpcyB0aGVyZSBhIHByb2JsZW0gYW5kIGhvdyB0
byBmaXggaXQuDQo+DQo+ID4+IFRvIGZvbGQgb3Igbm90IHRoZSBzcGVjaWFsIHBsYWNlbWVudHMg
KEdXUywgR0RTICYgY28pIGlzIGFsc28NCj4gPj4gdGFuZ2VudGlhbC4gSW4gbXkgcGF0Y2ggSSBq
dXN0IHByZXNlcnZlZCB0aGUgbGVnYWN5IGJlaGF2aW91ciBzbyBpdA0KPiA+PiBjYW4gZWFzaWx5
IGJlIHR3ZWFrZWQgb24gdG9wLg0KPiA+DQo+ID4gWWVhaCwgYnV0IGFnYWluIHRoZSBvcmlnaW5h
bCBiZWhhdmlvciBpcyBjb21wbGV0ZWx5IGJyb2tlbi4NCj4gPg0KPiA+IEdXUywgR0RTIGFuZCBP
QSBhcmUgY291bnRlZCBpbiBibG9ja3Mgb2YgSFcgdW5pdHMgKG11bHRpcGxpZWQgYnkNCj4gPiBQ
QUdFX1NJWkUgSUlSQyB0byBhdm9pZCBzb21lIEdFTSZUVE0gd2FybmluZ3MpLg0KPiA+DQo+ID4g
V2hlbiB5b3UgYWNjdW11bGF0ZSB0aGF0IGFueXdoZXJlIGluIHRoZSBtZW1vcnkgc3RhdHMgdGhl
biB0aGF0IGlzDQo+ID4ganVzdCBjb21wbGV0ZWx5IG9mZi4NCj4NCj4gT29vcHMuIDopIEFyZSB0
aGV5IGJhY2tlZCBieSBzb21lIG1lbW9yeSB0aG91Z2gsIGJlIGl0IHN5c3RlbSBvciBWUkFNPw0K
Pg0KPiBSZWdhcmRzLA0KPg0KPiBUdnJ0a28NCg==
