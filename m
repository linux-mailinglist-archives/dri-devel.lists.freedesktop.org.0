Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6114DAE62EB
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 12:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81D910E12A;
	Tue, 24 Jun 2025 10:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="rlPHDjJV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF70810E12A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 10:53:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9ah1cjgi/jLY+Ouk2PDkMqCQvQlij74IRE3LJg9QN3N0z6u+fvJS0oHvFnWRnlqq1HLPsid9D6sG6Pkgfl4PGunKYYpQcd0VkrAeiTBPfbkRc4Gg1dziUpwTLTgXmok8JYj6RCEqbapWunJ+gZGq/NicsJF8h3BmfeMqKy0yL5wPd8v9jwkjjhMDJ1jsJ1svgL0oDBCoaznMyDQQ7tAWEMHAYMh1yPNQ0Vb3Piw1R7wMq9e4osSsk+tDedTUNzvv09DUPo6ysR4NlJJAB79Ux2uSSFoThmvVhNWUDcwydMAzFzJsXBC54xr1ExR8Fw7fHSF4/kE7I6t8KuQwpGckw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tv8w2vpXHfORcd9a8vynl8n2EboLkpe9KHSrRAXEqN8=;
 b=w49GFD1vu9QTCK1RDY3GuU5hux5Gw5PXB5DZPtZJ6E9CME6hSZQTRWoD9rfZUzwe93Mb3o1ONoTZNR99Dkg89SfhL5a7TLVuUSNdpbjSuhdjwS1532hzzd3OFojwJb9W5DjoXMlXaxjDlAGK3nUItdvbYzYwtCO/vRkSKYaerMaxQOqfciUi00IH+3kFik2LYyCEkV8j5hM6iw2/kdxZYQEcXn2FUKKzRjHMdKC6FrvZmy1gN2p/3LyEjxdsP7vLlP+Xn7MvArMWCUaVv4lOjUPn/uig9OSnuFNS67urH+RJX0v0UWFTg0pYodbA4PG3JQeQAYlC3GbjazlPG6l8wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tv8w2vpXHfORcd9a8vynl8n2EboLkpe9KHSrRAXEqN8=;
 b=rlPHDjJVebppLwzv1xI6e3SZ7c7gSA41FI3+JNTnNbZHDorQ/Hw4IC+LMceyXAzRNJaqnxIh+kNKvZnBmRC1a8rJ+biesrsqoWxywpB/BBHQglU9QEFZ7znhESCq/995A19p/msk2/r9uDyM57Q7ZowFQO5/dn1CYRjVxSdvNveVdXjy6VZhCYfqIeXcW/W1PC2F4Zv9sbEJpJJ1yqKIo1pc7ETuLGd7JcEbeY6zV6QfiLgXk/JnA6i3bvnrWZvpCciT6h2FV8b3SSowm/BAp9KxFy/euJoPtldfZbwFJQPdZ696kjRlTrlnlbONgmTf0NR2b9bK3yYlh6wDKm5o/Q==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by DM4PR11MB5245.namprd11.prod.outlook.com (2603:10b6:5:388::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.31; Tue, 24 Jun
 2025 10:53:07 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80a8:f388:d92e:41f8]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80a8:f388:d92e:41f8%5]) with mapi id 15.20.8857.022; Tue, 24 Jun 2025
 10:53:07 +0000
From: <Dharma.B@microchip.com>
To: <laurent.pinchart@ideasonboard.com>
CC: <Manikandan.M@microchip.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] drm/bridge: microchip-lvds: drop unused drm_panel
Thread-Topic: [PATCH v4 1/3] drm/bridge: microchip-lvds: drop unused drm_panel
Thread-Index: AQHb5OnimHgNx3OeY0G+OrHRjNF7R7QSH6AAgAABAQCAAAEqAIAAALSA
Date: Tue, 24 Jun 2025 10:53:07 +0000
Message-ID: <9f7fe1a6-77bd-4dba-9d83-2a9d0625baec@microchip.com>
References: <20250624-microchip-lvds-v4-0-937d42a420e9@microchip.com>
 <20250624-microchip-lvds-v4-1-937d42a420e9@microchip.com>
 <20250624104248.GH15951@pendragon.ideasonboard.com>
 <adee247c-933b-418c-959d-665b1df11874@microchip.com>
 <20250624105034.GI15951@pendragon.ideasonboard.com>
In-Reply-To: <20250624105034.GI15951@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|DM4PR11MB5245:EE_
x-ms-office365-filtering-correlation-id: 98b69ed5-8138-4ad9-11a5-08ddb30d4d99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?WW96S0JCZU1IU290TC9WYW9SS3dqODBKeWdpSWhCamJhZnZobTN5TFBJSlRn?=
 =?utf-8?B?VzVwb1AxMU1SLzRSVkx5VTUvUXJJMzg3Nlk4MFQ3MStJOWY3NWZ2UTNzSUJP?=
 =?utf-8?B?dFBFem5ac21EVFVYeVM1Nnl5dlBwYUIxc2xjeG85elAvVVdPOGxPMzJpbnZM?=
 =?utf-8?B?S3ZPWmJpRmNXNng0SGdiVFVBVEpNZUJkbllBVFFuZ3ZBQ0M3NWxSY3VRZjJl?=
 =?utf-8?B?VjNLYTZaMnpYZjNxMndYQmxvUlJnbFZTWW9zRFV1WnBtbFhseGFFMWowUTRC?=
 =?utf-8?B?eWx3bEcvT0pxeSswWWhyTk5pTGVPZDJyVkVpZXQ0Q241blJxUFJZNGlGa0My?=
 =?utf-8?B?V1UrdC8xZFBIaEx6RFRKWlgvUUR3blZKOFNnQlpLOTg0S3QvR09pMjkwWWVl?=
 =?utf-8?B?RWZRS24zYmhDZjVwdEJ6VENKREJWZWthRFN4RFZNWFRQNTFmWE5nSVZMNktS?=
 =?utf-8?B?ZkpJM1BCcnpIRjlvTXlPcnNRWlJZd1JhamdrZ09kKzVVMWRKZnlObytjOVZy?=
 =?utf-8?B?dGR2cDFYSHU2UXRWN2Q2ekFVek5LeVlrYi8yWnRvY3UweFlYYjhobE5ybU1D?=
 =?utf-8?B?ejFKbkRHSDQwcUZNeGFDamx4VVV5MWx3UlIwYnorR3gvOXBnT1lPK3o0UzJC?=
 =?utf-8?B?T1FHMEtzUUloTE1RUTRubHE3YnZTR0Q2Yzd4b0ZvNEhVaGZpK2owNmhlWnps?=
 =?utf-8?B?UCs1NmRML0sza3pvMzdOdWFZeksrNHJFc1NVcEk0ZUtvUkdWWVZwOVdDSURX?=
 =?utf-8?B?WGxZVjkxVXgvOXR3bkpvM05pNUYwSmMwdlBHaFJvaTlZdWJnR0N5M3VKYlpC?=
 =?utf-8?B?cGZVZmZYQ1FNU1U5STA2Um5Yd0dqYTRQcmtjaVRabDI2TkJYbVp2eEpFa3Yz?=
 =?utf-8?B?MjJtS3VoZE9WN211R29iOUorYmgyQmNoeUFJZVpyeXNqZUh1S1FJem5PVURw?=
 =?utf-8?B?SGczbXM4dWtWbkdlVUlwRnZZM2tRQlVTNHZEZERvdm5PR3F2Skhoa25VZzNs?=
 =?utf-8?B?NGFUeUk3dThkYUptczdQZ1ovanlkNEN2THdIMGJsaytrZ2tCQ3RtT21GaitZ?=
 =?utf-8?B?WUJadXNsME9UcUt5VERTeTlleWpPTlhxdU9TQlNDUXd4V084dDZrUHBVSTVM?=
 =?utf-8?B?YWRCN2o3TktFME5tSllDeW81WG43OU1ONXYvZW1DWi9iYUM4R1ZRd1g2UE5X?=
 =?utf-8?B?MUN4U1ZQZ1J5dVhmMHhBbXVENDhYb085a2VIK0ZBcHNiQTd6N2M2VVZEcWtw?=
 =?utf-8?B?bmo1anB5TEVpUVZwbktyQ2U4K2FDY3ZmNklmSytLSkhoSnNVenVXN0E4UzIr?=
 =?utf-8?B?YUZUNTRDclphV3hlVFVsdW1KTG5nMHY4cmI5SmtDNDJQTlJINWFRdDN3ay8x?=
 =?utf-8?B?OE05OE1pVWdVRm9EOERmUGdQUnVDVkMyMjFpVTZmYzdyb09pVmxGVzN3bERK?=
 =?utf-8?B?MUp5WnliNk1talVVUGIrblpNdlB2OTBDMnQ3ODF2NjJxQllCRHgreTZQTzgz?=
 =?utf-8?B?Ym1ZOU1lYVVrM1RwbDc2L2JWaEFucS9pOVhOMW42Q0Rpcnd3ZUpuYXIxRmI1?=
 =?utf-8?B?d2N0dFVBVEFoUjM4Zk9LeGRzNjl2ZDkzUmRjcUhXc1VBZjdaSGVFbENYVlJP?=
 =?utf-8?B?VzJ0VzFEVC9xR0J1aVNOc2xSM1h4emkxVDRtejZlS1Z5eUQ3bTVXN2ZMci9K?=
 =?utf-8?B?L0wzeWNzNEpiZkpmOXJpQURxK1RsVGEvYjZUM2tBWFJXRFkzTG0rOC8wVkpx?=
 =?utf-8?B?VFJKcWgvVUNUdDR4SmJjNVlWUWcvRmhIY2pUT0F3dlE0bFNlUXZuQnJNYTZu?=
 =?utf-8?B?TXJLSStDdWZiVTBheVA4MWdha3ZndDVwcDNMYW9YemU0aWJmZGxoc3oyRzNI?=
 =?utf-8?B?S3NBUFgvWUhpaGVFTnRXTmVhWFZvME9FNEtmNm8xT1Z5QU1Zd3lpKysyOFRW?=
 =?utf-8?B?NDN2eUxxL2lEZnRrUUJyakkya0ZKTzcwMi8vakkra0pPUXluYUJjNnR3NC96?=
 =?utf-8?Q?+tNBkeEXqXG9lzHjDWQ4scqU6RpYiY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1B1bVdvRmpUYnNoWHgvWUZFdU1RN1NHZ0tLWXEyRzRYR1ZzUklET2RISnF2?=
 =?utf-8?B?d0RiWmp1c3Z5dkNkdlVWT2JpY0dkU2x3ZjJ0RDBFSzZWcm9TUGVMZGc2cXVq?=
 =?utf-8?B?L2tNbWlSZHpXSkgyZVJoSzBIdExzU1ltYjVzSU1JRktNZElGQjFqeWFZd3FS?=
 =?utf-8?B?cGpDM0xSZXB5ZUZ5SzFyNW1rY1lyTk5LV1diTkpFR1dJMURQSXV6OVVHMCtT?=
 =?utf-8?B?U01rVmw2QS9wVktaVzNkZVdoRU1KNUwvZ1puUk8rYVZRUFB6V1V3cjhHeVEx?=
 =?utf-8?B?SGFRRDl1TUw4K1JoTTVMcFVOTGhERjdOUWdZWm9yYlJsVEFybFM5ODZiK081?=
 =?utf-8?B?ZG9sLzhKenlMcUJiOWF2UFAwaU0zWUxGTnZZbG1Td1VpTUVURUdrNisrME4r?=
 =?utf-8?B?aDBOR0FrdHpkMzY2OC9oVGw1YUxmTzV3eXRVZUdGVThkU3ZWSkYwZDIrZU9W?=
 =?utf-8?B?VnhUODMxNFhZZ3BoY1lTa2xnK0hRQ2N6Q0R4K3p5M0I1RDc2OXZLN3IxME5P?=
 =?utf-8?B?VllBOFdyV3IwTFUxWFdKdnd5VjR2SFVYYVpLd1RNV3RNbmhUd1hjZFMvVk9V?=
 =?utf-8?B?TXJkaGVjYmZoMURyR01iRUcrVlo5Q3VkZ1ludXFILy9zbXN2ZVBQS3lEOWJL?=
 =?utf-8?B?VjNZWmtLbmFvYkNETTdDWU1ySTJMVlVIQ3N4TU9NaUI4MmYzRDA4Zyt6WnQz?=
 =?utf-8?B?ZjYyNnJ5K1VxcVhUR0p1eVZFc3JQYzhidFI4TTBwTkw5UEw4VndVQWRJYzI3?=
 =?utf-8?B?S21yb3RMcjE4MWdHTGdHSXRJWEFPL3RTb0EyeEtaSXdPcGhkMWN0ZytOdzdp?=
 =?utf-8?B?aSs3cCtiMm5LWXJpTE00QUd5a2FjT3p0em1pcDY4VGM4aXJpL29rTDc2akx5?=
 =?utf-8?B?c2txY01sOTZ1WC8vL0tqYXBEUWgxcitRRVhEV2pBc1VRTmp2NHN1U3B0Z1ZQ?=
 =?utf-8?B?ampUejdNSzl1eVQ3RGgvUlRWWW5Ga0EzNzl2OVpNeE9tUTJKWkhDRzNxYkpr?=
 =?utf-8?B?aCtHSTVNUjREeEppL1JodWNiT3lBcVRKb3Zaek05WWFpY3lWWWU0ZlZtNm1u?=
 =?utf-8?B?QVFwckFXNWVwS3lpeGkvOFJOS0FCdTVSNmc2bEhrem42TUVYb2hzS3dYL3FS?=
 =?utf-8?B?WjU2OVZpYnBMTlRLbVVESWFtaE55OTh6bjkzNmF0L3duNW9uOVQwSndFSith?=
 =?utf-8?B?dUtVdWQvZTlTTldKbU1NRVpndlk0Z0pMa0VHODR2TkpONmFRNVRQZzN1R3Rs?=
 =?utf-8?B?M1VqVUsvRGdPd0VmbkZTTEplUFdqRWFrQlRWem9lZlZzbTVLcEd5Mk9sRitv?=
 =?utf-8?B?VjJxdnBMNGpjNFRJN3VkZ2dhemZ3SWRNZTZEM0RjQVpYWVhNMGg0SE1jcHlG?=
 =?utf-8?B?ZU1lMW5GYWNraHRQVFFqblBPbTloa3Y4bG81UVFndDBBeldvdTZrRVNzQjFL?=
 =?utf-8?B?bm5hR0M4T1pwc282SVRzNkZoNTczVG1EU3dHNHlLb0RRRnRQb3p4V2lQV2dt?=
 =?utf-8?B?Ym15Z1RNWW42NDRxVXIzR1NRUTZ3aklLdENiSWZHVU16R2ZENUw5VGZSTkx1?=
 =?utf-8?B?aW01WDN2RkxqWm1mV1JqM1JBNHBDSWNMUXpoNVVvZUhnS2tKb3ZHUWhtZ0N4?=
 =?utf-8?B?YWkvVm9TaHpSNjV3aXF0azROVzJxQXdvdW1ZR2tab2F3cXVaWlhIeE9laHdY?=
 =?utf-8?B?UzVpTTFkd3Q3MGt0Z3BpYTkxMzdmNzVEY2dwbkpnd0lMZ2tTTUdEa0I5YnVC?=
 =?utf-8?B?cm10R2drYUtUUFZWd256OWxwOWI5Z0ozWEFWblVPaGpjWHRjVGdSbEthb3c4?=
 =?utf-8?B?Y0Y2QTNrWTVwYW9qak5YTkVJQ3A2bGgxejVIN21oMDB1YXN3VDkzaXJIcWpo?=
 =?utf-8?B?b2xwbnRJNVZEOXU1b1hDNXU5U0pFT20rTTl3Mkhab3pXOE5Ra0gyNmNPNE42?=
 =?utf-8?B?VW1uSGI3UTNXWVRRZk9tUkdmRHRVZ0xPcDlDQ0FJNGZEekNzVlF4WVdzM3Fn?=
 =?utf-8?B?eU9VMFVsV1NmekpibEdtTFlua1BnbkthQTNXNExFV3I1UzRXYWprbTRGNlIx?=
 =?utf-8?B?UXJQbi94c1d1M1YvSFlRUmh1MnpHY2J1QkY3L2RPLy9pY3hUemw1bkw0aVEw?=
 =?utf-8?Q?yPDIpSIQcWHeotFqYptZMSJOB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D2BBE453B769564484A6E65172B41A88@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b69ed5-8138-4ad9-11a5-08ddb30d4d99
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 10:53:07.3850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 10VOb+QdfdoWNwmuZSK/PfS1vxX2mYBeMDrR3q/PSdIQctJE1qBWWQygNeGo4x8sVsjJpB2+87ii0CiJO6ZdmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5245
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

T24gMjQvMDYvMjUgNDoyMCBwbSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToNCj4gRVhURVJOQUwg
RU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
a25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiBUdWUsIEp1biAyNCwgMjAyNSBhdCAx
MDo0NjoyNkFNICswMDAwLCBEaGFybWEuQkBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4gT24gMjQv
MDYvMjUgNDoxMiBwbSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToNCj4+PiBPbiBUdWUsIEp1biAy
NCwgMjAyNSBhdCAwMjo1NDoxNFBNICswNTMwLCBEaGFybWEgQmFsYXN1YmlyYW1hbmkgd3JvdGU6
DQo+Pj4+IERyb3AgdGhlIGRybV9wYW5lbCBmaWVsZCBvZiB0aGUgbWNocF9sdmRzIHN0cnVjdCBh
cyBpdCBpcyB1bnVzZWQuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IERoYXJtYSBCYWxhc3Vi
aXJhbWFuaSA8ZGhhcm1hLmJAbWljcm9jaGlwLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+ICAgIGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvbWljcm9jaGlwLWx2ZHMuYyB8IDcgLS0tLS0tLQ0KPj4+PiAgICAx
IGZpbGUgY2hhbmdlZCwgNyBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvbWljcm9jaGlwLWx2ZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvbWljcm9jaGlwLWx2ZHMuYw0KPj4+PiBpbmRleCA5ZjRmZjgyYmM2YjQuLjQyNzUxMTI0
Yjg2OCAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9taWNyb2NoaXAt
bHZkcy5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbWljcm9jaGlwLWx2ZHMu
Yw0KPj4+PiBAQCAtMjMsNyArMjMsNiBAQA0KPj4+PiAgICAjaW5jbHVkZSA8ZHJtL2RybV9hdG9t
aWNfaGVscGVyLmg+DQo+Pj4+ICAgICNpbmNsdWRlIDxkcm0vZHJtX2JyaWRnZS5oPg0KPj4+PiAg
ICAjaW5jbHVkZSA8ZHJtL2RybV9vZi5oPg0KPj4+PiAtI2luY2x1ZGUgPGRybS9kcm1fcGFuZWwu
aD4NCj4+Pj4gICAgI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4NCj4+Pj4gICAgI2luY2x1ZGUg
PGRybS9kcm1fcHJvYmVfaGVscGVyLmg+DQo+Pj4+ICAgICNpbmNsdWRlIDxkcm0vZHJtX3NpbXBs
ZV9rbXNfaGVscGVyLmg+DQo+Pj4+IEBAIC01Niw3ICs1NSw2IEBAIHN0cnVjdCBtY2hwX2x2ZHMg
ew0KPj4+PiAgICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldjsNCj4+Pj4gICAgICAgICB2b2lkIF9f
aW9tZW0gKnJlZ3M7DQo+Pj4+ICAgICAgICAgc3RydWN0IGNsayAqcGNsazsNCj4+Pj4gLSAgICAg
c3RydWN0IGRybV9wYW5lbCAqcGFuZWw7DQo+Pj4+ICAgICAgICAgc3RydWN0IGRybV9icmlkZ2Ug
YnJpZGdlOw0KPj4+PiAgICAgICAgIHN0cnVjdCBkcm1fYnJpZGdlICpwYW5lbF9icmlkZ2U7DQo+
Pj4+ICAgIH07DQo+Pj4+IEBAIC0xNzksMTMgKzE3Nyw4IEBAIHN0YXRpYyBpbnQgbWNocF9sdmRz
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+Pj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICJjYW4ndCBmaW5kIHBvcnQgcG9pbnQsIHBsZWFzZSBpbml0IGx2ZHMgcGFuZWwg
cG9ydCFcbiIpOw0KPj4+PiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7DQo+Pj4+ICAg
ICAgICAgfQ0KPj4+DQo+Pj4gVGhlIGFib3ZlIGNvZGUgc2VlbXMgdW5uZWVkZWQgbm93LCBJIHRo
aW5rIHlvdSBjYW4gZHJvcCBpdCB0b28uDQo+Pg0KPj4gWWVzLCBJIGNvbnNpZGVyZWQgcmVtb3Zp
bmcgaXQgYXMgd2VsbC4gSG93ZXZlciwgSSB3YXMgd29uZGVyaW5nIGlmIGl0DQo+PiBtaWdodCBz
dGlsbCBiZSB2YWx1YWJsZSB0byByZXR1cm4gZWFybHkgd2hlbiB0aGUgZW5kcG9pbnQgaXNuJ3Qg
Zm91bmQsDQo+PiB0byBjbGVhcmx5IGluZGljYXRlIHRoYXQgdGhlIHBhbmVsIHBvcnQgaXMgbWlz
c2luZy4NCj4gDQo+IFRoYXQgZXJyb3IgaXMgY292ZXJlZCBieSB0aGUgZGV2bV9kcm1fb2ZfZ2V0
X2JyaWRnZSgpIGNhbGwgYmVsb3csIHNvIEkNCj4gdGhpbmsgeW91IGNhbiBkcm9wIHRoZSBjb2Rl
IGFib3ZlLg0KDQpTdXJlLCBJIHdpbGwgZHJvcCB0aGUgZGV2aWNlIG5vZGUgInBvcnQiIGFzIHdl
bGwuDQoNCj4gDQo+Pj4+IC0NCj4+Pj4gLSAgICAgbHZkcy0+cGFuZWwgPSBvZl9kcm1fZmluZF9w
YW5lbChwb3J0KTsNCj4+Pj4gICAgICAgICBvZl9ub2RlX3B1dChwb3J0KTsNCj4+Pj4NCj4+Pj4g
LSAgICAgaWYgKElTX0VSUihsdmRzLT5wYW5lbCkpDQo+Pj4+IC0gICAgICAgICAgICAgcmV0dXJu
IC1FUFJPQkVfREVGRVI7DQo+Pj4+IC0NCj4+Pj4gICAgICAgICBsdmRzLT5wYW5lbF9icmlkZ2Ug
PSBkZXZtX2RybV9vZl9nZXRfYnJpZGdlKGRldiwgZGV2LT5vZl9ub2RlLCAxLCAwKTsNCj4+Pj4N
Cj4+Pj4gICAgICAgICBpZiAoSVNfRVJSKGx2ZHMtPnBhbmVsX2JyaWRnZSkpDQo+IA0KPiAtLQ0K
PiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0KDQoNCi0tIA0KV2l0aCBCZXN0IFJl
Z2FyZHMsDQpEaGFybWEgQi4NCg==
