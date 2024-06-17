Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDBA90BA46
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 20:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765B310E03A;
	Mon, 17 Jun 2024 18:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i2ymImXh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2057.outbound.protection.outlook.com [40.107.102.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AA410E03A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 18:57:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ja5s+E2k6UwMVc59f/1wKuuhAw2m5j+N2YQGndRgbzxjJpxPCH+/sralLDYwqdmtckz/Tq2QKn3E4D9anI+w9hiCn+04qb/gZ0rbH/MHe9Qm3hq9tlXNx1S7an9T6/0Nj+TkolOon5/EzoDC3Zuitwk/6ntv+QM9eCt04H4O6/91W/LjYiyizPSY6JQnfs63N/i9SG2Ly0F4hcPKFyW8hfe5kip0Ju0VJcJOS3gFvaeedQfL/vNQW7l0ZXPudHTgY0WdLJSdVZHUCz1vVgxY9yOhEEytk9iWU7hvWc99yOQzxiUHcxOhrajbdnCqM6m6w1ns+pWg8OuEjzIRUN+ofA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CA7iF8z+MRapD1aWiG0FjhwBWFMGY62YE8D+WKdI200=;
 b=KyapS+M6Mlze3D+u0fQC4QDCJib/+wfWK1aq0xo8pStRi1ZXkOHowXiOO94sSk5vBWMfie6ibQJl550P3A5ULY0KGO9QOuYMhVziuPCbN2xAnDSg6/x5rhpF9tqt97XK+YAT+FU2vlZUw2Lavk3jpFLb16N2m002I7DXq4o0utyvD6ikqGl7j4ZqXpIvXPYubs6gFDPIR5bNamTGF1L0SBHqV810T/qll7hGgNUl4swOF+0n4odaorBDBy1CwXj9CwSJHI+IQz4CS2YFpRLy8uCyrgvuvkBGz46m+1+26YuvGHpAIcaQLVi/yzbP0zhKSBcSx5XfwsZvJEdKCKPqLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CA7iF8z+MRapD1aWiG0FjhwBWFMGY62YE8D+WKdI200=;
 b=i2ymImXhoe/UljymX+QQvAQYWtewBQNnPEvM0ytjtJg9DQ1dR8gGkUcXDnR7Pi2fjo/4DKRmpIX5G+4k+T3JWgmI24gAdvIUndPkkgoufxBtn+vOAerZ22Uxgrh+14Quvlw/8iRko96mKgIDJutQC/7X+qhqVVb0Uu05quTh4XM=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by MN2PR12MB4223.namprd12.prod.outlook.com (2603:10b6:208:1d3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.22; Mon, 17 Jun
 2024 18:57:39 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::a32f:9b78:fc2e:6076]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::a32f:9b78:fc2e:6076%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 18:57:39 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Simek, Michal" <michal.simek@amd.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] drm: xlnx: zynqmp_dpsub: Enable plane in atomic update
Thread-Topic: [PATCH v2] drm: xlnx: zynqmp_dpsub: Enable plane in atomic update
Thread-Index: AQHarWvgyJc4v+8fzUa/XVkIlqYvJbHLuXIAgAC8DkA=
Date: Mon, 17 Jun 2024 18:57:39 +0000
Message-ID: <MW4PR12MB7165963B11E07DCC4C2E5B34E6CD2@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <20240523-dp-layer-enable-v2-1-d799020098fc@amd.com>
 <d8880923-6555-4713-bd9e-bea056b08f59@ideasonboard.com>
In-Reply-To: <d8880923-6555-4713-bd9e-bea056b08f59@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|MN2PR12MB4223:EE_
x-ms-office365-filtering-correlation-id: 790db1d6-4a55-4b8a-d11a-08dc8eff5c68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|376011|366013|7416011|1800799021|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?VHJTdStiQUpEd1pHblUxRzlkTDVyRDB1SGpUeWRzL2dOeEQ2VFVyTDNhbEJh?=
 =?utf-8?B?cEY2b3lBMlUrMjJVYzdnZXA0Z3RKWmg2OXhkNTRXUFdLTDA1QmlJZFJXb0dm?=
 =?utf-8?B?cDVqa1ZpMXVVZUZhaDRCanZTMEtwS3hDWWlNSmwySHNKTHRrZzVNMjJJUzNj?=
 =?utf-8?B?V2w3TmY3eThJWmVpMVBQNEdrdlM5OFBVaDVUZll5V0pNb01IVHBXd1BoaHpJ?=
 =?utf-8?B?bDRBZGUxemE3YUlaRjM1OW5wT3o0M2c0L2NBUkUwV0wxb1F6VjJmSVVWYmtQ?=
 =?utf-8?B?MkF5MDJuS3JJbjZzV3RSMjBGaWYwZnJ3ZERWTTlyQ2lBUGppd0ZTWU42R1Vq?=
 =?utf-8?B?eWd6bCtEcnZHNHkzNC9kYVVxYjgzSHNHYXR3N3YxaUVPTFhERmxsbkM1U09C?=
 =?utf-8?B?eFZyRVVHTFhQcVgyanZyVk9QZXM0Q0JUcWtldmNHbVhnMkd3YVFiNzc2WjM3?=
 =?utf-8?B?RUhleGxTTHNvU1RTT2VpRHU5aHU1Q3lPaytrQzBUclJUeFZNeW44YTg2YnNJ?=
 =?utf-8?B?a0RZMFkxQXZ2R3ROTDJNbG83eHRDNFd1UTFZaU9xYkRvKzF2MFNWSHJleStp?=
 =?utf-8?B?Y1RlaXRlOWJJRVpUb1crRmF3TzVSejRCM0hENFNTUHZCMTQxMUxlcDZiemF6?=
 =?utf-8?B?clh3WU9vczRTU1pXNUhpTnBXWi85SGQybEJuaEk1UktuaW9iNkd0SjhlMWtO?=
 =?utf-8?B?ek01cy9wL1lUbWlEZFFtbisveVdYTlhvTUM5eU00andtREM5VXpTQU93bDky?=
 =?utf-8?B?SGpGMmpTK3ozWXpNZ1BHeXduRDc0bmFuZkFkdW9PYUR5ZFIxaVhOYVA2czJp?=
 =?utf-8?B?WWJuQk9sdXlTQkd2NTg5aXB2K1hCdmRQWnp1MkFIYkxXWHdMV011OG1Fbk0y?=
 =?utf-8?B?aC9JUzgxUFdhWDgxei9yaFhBYTNEalpMc2JhbXB1UnFXdXhPRG5IYktxTzB5?=
 =?utf-8?B?bkRxL2dWdFlYbWZqTXcrYngrOEZsbzdkTVZyZ3owNy9ZVzQralM1Qm1UZXlp?=
 =?utf-8?B?cGQxeEVlRDhDNDFPUUNQMksyajlpNjJoNjNseXRtbERwQnJWSW5sQ21NMy9C?=
 =?utf-8?B?VXFrTVZtTDhIWHlualZoanZNdVBFejM4REhFZ0tmUE1zamZncC9EaWloMHpN?=
 =?utf-8?B?a0FpYnVJajdvYW5zMHZRK1I1T2ZJTDdwQzFyUFNqdlBqNXA5VjNPNHcwZEVa?=
 =?utf-8?B?SzN2elRQeVRYdTFxZFBuRGVKdUk3RjlBbnR5SXZDOWNGRk91R0lOcFdrTU9L?=
 =?utf-8?B?eTBFRXBXWEc2Yk5xeUV3MW4wMW9XcWlka1Ivc3dVNXpKS1JRZHZmbWFHWUw0?=
 =?utf-8?B?RWJVSmUySjE2WkhJUXk3M281VHhaNmtNL1ZYaFVlcVEzMm9acnU1RVJFWk9x?=
 =?utf-8?B?YkloZXE1K1NOMllqWGJ5bkN4dlNyV05NWkJlMkltdys4Z2ZTcWNHL2VmT3lF?=
 =?utf-8?B?Z1gzMHE4cEgyaUNWcEZZQkVmaDBNOXpjTHZ3aWQwUkhMZ3lzSUpnTkE4dkR6?=
 =?utf-8?B?ZXJ1K3l6ZW0rUU5mcTlZWm00ZC91SEMwWmc1NUxkTDFDVTh5dU5sNVpPTTI5?=
 =?utf-8?B?ZUJQVGU4UEpzNzNkMG44N2VQZUd4eWw4Q0RXU0c3TnNHK2VtVGFNbjBxWlhI?=
 =?utf-8?B?L2Yybmh1QXE4eHJhOXhxYS9jVXhGMzVBNXRGWGdTUkx4RGRQSlRRTjR5OER6?=
 =?utf-8?B?ZFdUVlFieWdKaDlUZWRhckdpbkJYcU4yc0JYM2x2U0QxdTV3WjBCZTN5dUFr?=
 =?utf-8?B?aHRLbERsWGgxYUxHSDlLUmNuYm1VMHpucy9YVEJ3dXkvQitWNXdXOVdVcjZk?=
 =?utf-8?Q?E51sP0B7v8F7bBlDJaj8QMk7G7bVUNphGC65I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB7165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(7416011)(1800799021)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUpKUGJ3a2dneGZRamlEZUJ6cWtTbU9Xb1lVK3k4MkEyRzVwaG94bTNuSXVz?=
 =?utf-8?B?Q1ovT1cxdW5CNjMxSzd0YXlkSnI2NGI5bHRzbE02cDZDZld3cWxRTlpKMklF?=
 =?utf-8?B?M1o1SWxyMUR2aSs1Qkkrc1E3ak12Q1BVaDdGbTRxMmVpK1ZSUDRXYlpOMG5y?=
 =?utf-8?B?T2IwanJwUTVNaVdlT005cmI2ZmFVbkxxVHVBSTNVamNJbmtaMWxTbkZxeWZ2?=
 =?utf-8?B?V2dyZXk4bytlMUY4ak9lL0xwWGRaVGFEV3ptMmtCTm50MExueGliaWJlN3F0?=
 =?utf-8?B?VTQwUmxoMWo1RkxySnFQYzhOQ1kxSWxGUVY3MDlxaDJNWWNOeWdRbXVLc2xP?=
 =?utf-8?B?bjlySXhWRlRJN1hWaVY4S2lCTkV3TUxIaUF2U3pFM2I4YXVGcGFDM2JEV1ln?=
 =?utf-8?B?T2ExdXZ5VHp0R1RuSjZJNmd1VmFVcVZURENvUG1qSEVNbllrQTdEUnVHS2NS?=
 =?utf-8?B?S0JRbHpHTzdXZUdPOEFNN3FXZE85R1RhQjZud3R3ZUZLRTVNWW9wdTVWK1dx?=
 =?utf-8?B?T1hCY3RLblo5N25BSU44SEpSMGhaNy9YYk01aWJnTE5VRVBOUktMeWtWc2tV?=
 =?utf-8?B?cnN0cGhjMmppNlg3ZHFHTldPaEVEWHVHdmQyOXhaZi9sSlZUZTc0bmovN2ll?=
 =?utf-8?B?UlhMVThISExqbzBxd20zL0hVMFpXMURoVXVoMis0RC90TXMwTXhzcE9pemp1?=
 =?utf-8?B?bmVlOEE2NEROMGxzMHoxVGFCaDdYREF4V0lkOVpLdTRCbHlvbFNsUk1zcnBt?=
 =?utf-8?B?K1BiNm54N2YxTFVUNFFtZG5SQnNlOWNyY3V4QWxXSVBldXMxQ1BqL29ReWhB?=
 =?utf-8?B?ck91WEpRNEh3VkU0KzNyMkp0QXBTNXZTdzJYTEJLdGhFKzdWbDBlcWFCaHcv?=
 =?utf-8?B?VnNmT1ROOHpLWkVoNnpRV1M4QlBZNWk1cHd5ZHpDNDh0M1FHK0pSQ1pLR2hC?=
 =?utf-8?B?N3RWZk9CMzBBVHd3dllMZ3NHSDJaWHJkemZsWktJYTNDSUVOeitHWG15N3lh?=
 =?utf-8?B?WFRtT3ZveVVaTkdaemdiNU5RcTBUOFdTWis3MllqbTMrUWY1bExxWi9MY3FU?=
 =?utf-8?B?YittM0Iwd2l3WHBsNlo2bWFQMTRZUlJXSXRETGNNRVVlanBVazN3WkZKb3ZU?=
 =?utf-8?B?aVkxeWl2MUtzcEFncWhNcGVkcEx0YkRsaTRzdUlKZFd0dmZnSkdsbnNKU2hy?=
 =?utf-8?B?dHVQZzdJa0JaMndLVm5jZjRSSUZQRithQ1lVNHFET0pDcVU2UE1xY3VRRi8z?=
 =?utf-8?B?ZmdKZ1NSeEllUDF2VThCUmpEQmlQRGVaZDNFOVF1QVlwWWYzR2xzWDJocmVP?=
 =?utf-8?B?a2JBejhQSlZ6U1N2Z0tWTmc3eEtEUERBWHhUclRXa1J0T3gxNVBLUDhDNS9Q?=
 =?utf-8?B?RUlJM0lkbjFRY2kvR0doUzVic3lFT0RreXAwd1BlUUxZWWZQVURUMEg1Mnc3?=
 =?utf-8?B?bzhVQTlqZ2x3dXpaajI3Mk1lVGJMazAxcnJPQmxHZ1NRd2xsT2cxSTB4d1Jl?=
 =?utf-8?B?dTBUemQra1Y0TldVb3F6WnBrVTFyYVlpRVFQRkpMZkE5ejV1UVhMVjZLMXFk?=
 =?utf-8?B?YlNDTTBUSnU5VlFOZEVKUWhGOVoxODYrWFZ6WU9WZE1NVnZnQ1Vxd1orSkE1?=
 =?utf-8?B?YTF0cW10dmlwR3J1OTFKeDNiRGU1M0REd2pJNHUrbjd0S24rVlU1K2dLNG1I?=
 =?utf-8?B?Ukl4N3RIOHNIVkpqL0xlakhZeURVMzhBSjRua1ZJM2llVjV4ekFzbHBKemxB?=
 =?utf-8?B?MllXK1N1alozdjJkZFQ1SENXZXc1dklab0t5UTgvN2g5bW43WnZpc0dmWGJw?=
 =?utf-8?B?YTFpZzQ5dFc0WXJ0djBmaDdCd2JOaGJFV3Y1WDN6N3ZGeXF4QmhYMzkwSzJL?=
 =?utf-8?B?RHRnNFkyMGRkNzl6amRrQWpqdjRJemNJUzdqWldmRVJjajRuY0lXaERDY25j?=
 =?utf-8?B?a0pxZjhoOFBJMGQvZHN0M0xldytnYkIvUkRvYnRXUGxicStCNkdVYWFtTWFZ?=
 =?utf-8?B?NlFISUFEcG1iUjBwblB0Z3NrY0FlTHpaaGlSU1RIVk5uTnNDeUFua2dFdHhK?=
 =?utf-8?B?bVRiTWhRUHpQQ2Z3ZjNlWkNKTW9KU1hrcXNGL01GekR3WXZ5RVZ1bHhYSkw5?=
 =?utf-8?Q?3TUA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 790db1d6-4a55-4b8a-d11a-08dc8eff5c68
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2024 18:57:39.7663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Jf1o143sTqgyqQ5lRzeRzUBZ/fhfz1XEQb96IiX9tTHSEuorSVQM/icuy5VW33oJNy4JFCIdc1lrlyKz4Kd8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4223
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVG9taSBWYWxrZWluZW4g
PHRvbWkudmFsa2VpbmVuQGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgSnVuZSAx
NywgMjAyNCAxMjo0NCBBTQ0KPiBUbzogS2x5bWVua28sIEFuYXRvbGl5IDxBbmF0b2xpeS5LbHlt
ZW5rb0BhbWQuY29tPjsgTGF1cmVudCBQaW5jaGFydA0KPiA8bGF1cmVudC5waW5jaGFydEBpZGVh
c29uYm9hcmQuY29tPjsgTWFhcnRlbiBMYW5raG9yc3QNCj4gPG1hYXJ0ZW4ubGFua2hvcnN0QGxp
bnV4LmludGVsLmNvbT47IE1heGltZSBSaXBhcmQNCj4gPG1yaXBhcmRAa2VybmVsLm9yZz47IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPjsNCj4gRGF2aWQgQWlybGllIDxh
aXJsaWVkQGdtYWlsLmNvbT47IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD47DQo+IFNp
bWVrLCBNaWNoYWwgPG1pY2hhbC5zaW1la0BhbWQuY29tPg0KPiBDYzogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0K
PiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJd
IGRybTogeGxueDogenlucW1wX2Rwc3ViOiBFbmFibGUgcGxhbmUgaW4gYXRvbWljDQo+IHVwZGF0
ZQ0KPiANCj4gQ2F1dGlvbjogVGhpcyBtZXNzYWdlIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5h
bCBTb3VyY2UuIFVzZSBwcm9wZXINCj4gY2F1dGlvbiB3aGVuIG9wZW5pbmcgYXR0YWNobWVudHMs
IGNsaWNraW5nIGxpbmtzLCBvciByZXNwb25kaW5nLg0KPiANCj4gDQo+IEhpLA0KPiANCj4gT24g
MjQvMDUvMjAyNCAwMjo0OSwgQW5hdG9saXkgS2x5bWVua28gd3JvdGU6DQo+ID4gVW5jb25kaXRp
b25hbGx5IGVuYWJsZSB0aGUgRFBTVUIgbGF5ZXIgaW4gdGhlIGNvcnJlc3BvbmRpbmcgYXRvbWlj
DQo+IHBsYW5lDQo+ID4gdXBkYXRlIGNhbGxiYWNrLiBTZXR0aW5nIHRoZSBuZXcgZGlzcGxheSBt
b2RlIG1heSByZXF1aXJlIGRpc2FibGluZw0KPiBhbmQNCj4gPiByZS1lbmFibGluZyB0aGUgQ1JU
Qy4gVGhpcyBlZmZlY3RpdmVseSByZXNldHMgRFBTVUIgdG8gdGhlIGRlZmF1bHQgc3RhdGUNCj4g
PiB3aXRoIGFsbCBsYXllcnMgZGlzYWJsZWQuIFRoZSBvcmlnaW5hbCBpbXBsZW1lbnRhdGlvbiBv
ZiB0aGUgcGxhbmUNCj4gYXRvbWljDQo+ID4gdXBkYXRlIGVuYWJsZXMgdGhlIGNvcnJlc3BvbmRp
bmcgRFBTVUIgbGF5ZXIgb25seSBpZiB0aGUgZnJhbWVidWZmZXINCj4gPiBmb3JtYXQgaGFzIGNo
YW5nZWQuIFRoaXMgd291bGQgbGVhdmUgdGhlIGxheWVyIGRpc2FibGVkIGFmdGVyIHN3aXRjaGlu
Zw0KPiB0bw0KPiA+IGEgZGlmZmVyZW50IGRpc3BsYXkgbW9kZSB3aXRoIHRoZSBzYW1lIGZyYW1l
YnVmZmVyIGZvcm1hdC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFuYXRvbGl5IEtseW1lbmtv
IDxhbmF0b2xpeS5rbHltZW5rb0BhbWQuY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgaW4gdjI6
DQo+ID4gLSBBZGRlZCBjb21tZW50IGFyb3VuZCBEUFNVQiBsYXllciBlbmFibGVtZW50IGV4cGxh
aW5pbmcgd2h5IGl0DQo+IHNob3VsZCBiZQ0KPiA+ICAgIGRvbmUgdW5jb25kaXRpb25hbGx5Lg0K
PiA+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDUyMC1kcC1s
YXllci1lbmFibGUtdjEtMS0NCj4gYzliNDgxMjA5MTE1QGFtZC5jb20NCj4gPiAtLS0NCj4gPiAg
IGRyaXZlcnMvZ3B1L2RybS94bG54L3p5bnFtcF9rbXMuYyB8IDEwICsrKysrKystLS0NCj4gPiAg
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hsbngvenlucW1wX2ttcy5jDQo+IGIvZHJp
dmVycy9ncHUvZHJtL3hsbngvenlucW1wX2ttcy5jDQo+ID4gaW5kZXggNDNiZjQxNmIzM2Q1Li4w
YjU3YWI1NDUxYTkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hsbngvenlucW1w
X2ttcy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hsbngvenlucW1wX2ttcy5jDQo+ID4g
QEAgLTEyMCw5ICsxMjAsMTMgQEAgc3RhdGljIHZvaWQNCj4genlucW1wX2Rwc3ViX3BsYW5lX2F0
b21pY191cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsDQo+ID4gICAgICAgICAgICAgICB6
eW5xbXBfZGlzcF9ibGVuZF9zZXRfZ2xvYmFsX2FscGhhKGRwc3ViLT5kaXNwLCB0cnVlLA0KPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwbGFuZS0+
c3RhdGUtPmFscGhhID4+IDgpOw0KPiA+DQo+ID4gLSAgICAgLyogRW5hYmxlIG9yIHJlLWVuYWJs
ZSB0aGUgcGxhbmUgaWYgdGhlIGZvcm1hdCBoYXMgY2hhbmdlZC4gKi8NCj4gPiAtICAgICBpZiAo
Zm9ybWF0X2NoYW5nZWQpDQo+ID4gLSAgICAgICAgICAgICB6eW5xbXBfZGlzcF9sYXllcl9lbmFi
bGUobGF5ZXIpOw0KPiA+ICsgICAgIC8qDQo+ID4gKyAgICAgICogVW5jb25kaXRpb25hbGx5IGVu
YWJsZSB0aGUgbGF5ZXIsIGFzIGl0IG1heSBoYXZlIGJlZW4gZGlzYWJsZWQNCj4gPiArICAgICAg
KiBwcmV2aW91c2x5IGVpdGhlciBleHBsaWNpdGx5IHRvIHJlY29uZmlndXJlIGxheWVyIGZvcm1h
dCwgb3INCj4gPiArICAgICAgKiBpbXBsaWNpdGx5IGFmdGVyIERQU1VCIHJlc2V0IGR1cmluZyBk
aXNwbGF5IG1vZGUgY2hhbmdlLiBEUk0NCj4gPiArICAgICAgKiBmcmFtZXdvcmsgY2FsbHMgdGhp
cyBjYWxsYmFjayBmb3IgZW5hYmxlZCBwbGFuZXMgb25seS4NCj4gPiArICAgICAgKi8NCj4gPiAr
ICAgICB6eW5xbXBfZGlzcF9sYXllcl9lbmFibGUobGF5ZXIpOw0KPiA+ICAgfQ0KPiA+DQo+ID4g
ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wbGFuZV9oZWxwZXJfZnVuY3MNCj4genlucW1wX2Rw
c3ViX3BsYW5lX2hlbHBlcl9mdW5jcyA9IHsNCj4gPg0KPiA+IC0tLQ0KPiA+IGJhc2UtY29tbWl0
OiA2NzMwODdkOGIwMjNmYWYzNGI4NGU4ZmFmNjNiYmVlYTNkYTg3YmFiDQo+ID4gY2hhbmdlLWlk
OiAyMDI0MDUyMC1kcC1sYXllci1lbmFibGUtN2I1NjFhZjI5Y2E4DQo+ID4NCj4gPiBCZXN0IHJl
Z2FyZHMsDQo+IA0KPiBUaGFua3MsIEkgaGF2ZSBwdXNoZWQgdGhpcyB0byBkcm0tbWlzYy1uZXh0
Lg0KPiANCj4gICBUb21pDQoNClRoYW5rIHlvdSwNCkFuYXRvbGl5DQoNCg==
