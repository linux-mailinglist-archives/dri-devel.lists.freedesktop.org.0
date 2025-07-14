Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A50B04254
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 16:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B0A10E03A;
	Mon, 14 Jul 2025 14:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VuKKoco2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8000910E03A;
 Mon, 14 Jul 2025 14:59:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imziP0Q1FNh4GoU7SWgX/Opkn4ksgbBdrMq9EekvcoujtlDd+XqjjU7hvzxDzBT1WgHOYpZWPMfwnXR8SiHEb4g+yz+EVhXNBcTeiAMokWv4AiNjFCMvumD/xvAB1apImp89E4lavlWfn+l5zgdgIAPtuYVsmJnVpjl5cPI11EQ1L8XDSCGHrcpjTlEcE/ILbJLTOtHvaEbU9sEPP+TdG1MqUG9CY9Ir/LJ4U31xp1jATvg7/775rmjAL09J/Urzn3CHga0PtHhngkWaeB6Xb3biWGq+HgeMVSHkP6afGPidWfJmRHVrAhKHYz91CHRip+y+TtHciIRsWFx1tqzQeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIg/iG2narhiCueVr0F+aRmXtKsQOg7Vq7JIqciLK24=;
 b=m4L7Yajyd3ZSVbo2tM+vGsCHB4FFZ1GvYpxAg6h0FJ8eMX6LunG4Lw4i29U5siRbHV7I5EJjn4RYGLvRMM47dkuRuiKwBc2PFp11N2Hpdmbs/UdRSQbiE1IJN9ufWJZL0C6rUld1FvfZwxeWDE7A0WcAT7mahH7sRvqGaWPWQE/PZi2aTRxTBaIg27dajjTjLFOrt+IUYA/UvMJ+peqpy9MjjesIToTHFx00WEge1Tm0OO7rQDwuzvPs0VcOpF79fao+BFwqCjv6XJ9V+2JjZogoYdMk9r/2frFkF/DstFi1wDaW8IkstyIQfvoAMUflBdCmc7kLIeSOD73PWDGupQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIg/iG2narhiCueVr0F+aRmXtKsQOg7Vq7JIqciLK24=;
 b=VuKKoco2gP1KQ2zewKsh47keNh2nnYDBQjQfGurcI7aaiM8W2Hjvd8GrolcRJk9A61bL5xbzFbWLV4Ci1SN1Ew0iYmh0ZKxlGtApBEhaS8khFcFfTdnmh9GHbRPe7j1gRjXChluXN851uSQ10lrKh3ih4rjLB50ckSLZRZzZ1YU=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB7137.namprd12.prod.outlook.com (2603:10b6:510:1ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Mon, 14 Jul
 2025 14:59:02 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%3]) with mapi id 15.20.8901.033; Mon, 14 Jul 2025
 14:59:02 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Arnd Bergmann <arnd@kernel.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>, "Zhang, GuoQing (Sam)" <GuoQing.Zhang@amd.com>
CC: Arnd Bergmann <arnd@arndb.de>, "Olsak, Marek" <Marek.Olsak@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/amdgpu: fix link error for !PM_SLEEP
Thread-Topic: [PATCH] drm/amdgpu: fix link error for !PM_SLEEP
Thread-Index: AQHb9Jeh7iYLBsEnJ0q+oYD5dzOV5rQxtnuA
Date: Mon, 14 Jul 2025 14:59:02 +0000
Message-ID: <db654178-a6d7-416c-bab6-b494a7c118ce@amd.com>
References: <20250714081635.4071570-1-arnd@kernel.org>
In-Reply-To: <20250714081635.4071570-1-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|PH7PR12MB7137:EE_
x-ms-office365-filtering-correlation-id: 3a6d1ac3-3cf7-4571-45a1-08ddc2e6f852
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?R3I3TjZ0ZXF5K2RpbFY1QStrVVNROC9VY1JibGwrbmo4NHE5ZWplOXdHVnA3?=
 =?utf-8?B?aHRDYko1L2VoY3FzVStlVFh5VGpZUVBEb3BTOVJqZkJSWHExWThEUDBKRWxJ?=
 =?utf-8?B?TTJtNUhSRUF0UGNWNDUrQ0huUHRtRnU0ZytsMUovaFpBcm5rTnJraFJYeWdJ?=
 =?utf-8?B?NHBhaVlKcFo3ZDRSaVFlVTNZOTFTSVZidVR6V3JkRXllSUNsekdXSlB2VGhQ?=
 =?utf-8?B?T0U5N1VlTkQ2VTdPWEZkd0IzeUU3TmRVOGpKcXIzTnV5eUhkeElHazdtNzBx?=
 =?utf-8?B?UFh6Rm93L0hKMTVSZ3c2UzA0RE9SZVhaVXFYSmJYV3Vpdnpka0R4RjNaazRr?=
 =?utf-8?B?Zm9iNUhUYjVkOEg5bGZoZlpqOE5UbFlwaTJLOWd4ajV5VDJkaVJ0aVRtZmh0?=
 =?utf-8?B?YjNDR3dGYXdaMHhmVEpEWEtWRGJkQ09CZDRQaThCTHhFTFFJRDI0cllVSnlW?=
 =?utf-8?B?VkRaRTJqMkxwd3ZKVG41ZEpzVlhaRGk3TzBobkJGem5TRWtuNkZoVWg1aW9Z?=
 =?utf-8?B?WXlpWDBMdk15a2JUaGZ2V1lxZlEwaDdRN1ord0VDN0gxMHRPVGtVaCtzR1lZ?=
 =?utf-8?B?aTFFZkhJSFFhYmNYK0duWWR3TFJtY1hKdjcvTS9kODVxaDlvUm9KbmcxQWs4?=
 =?utf-8?B?aEI3bmdGOG5kWU9DaTdXWmVaTVhSUldyQTVlbFFqVVNlZFlyZ25UOG5KZzBk?=
 =?utf-8?B?MkZLczBXcXFCb0lZMnZydXArQmJkRHlsM2VxSXdmMkg3TUkySnB3OU8xZCtZ?=
 =?utf-8?B?MVdSbENxWUFoN1E3YkliOWp2ZWg3RFBQK2VGSHJ0MjhTQ3E4WENLRjgrMDdQ?=
 =?utf-8?B?UTVjVUozSldKL1JSVHdYak9DSjh4Q2xlQk1SeVZrZzJmN1VHbVVZU3FxdHp1?=
 =?utf-8?B?UmNzYzZQanNtQk9OTmM5M1pnajFHendxQUJocE03bGhZZHVXYkcycnFOK1Ey?=
 =?utf-8?B?RElUbUltUkVZVGtabVFLZjN1azd1Zmg0MHkyaVhmTmx1TXZiS1F1VU5PK3g2?=
 =?utf-8?B?MW5SMWMvWitPSVBETVM0YnVWaGpWKzlIRHM2cSs0RUpkREduY3dmUXdzOE1p?=
 =?utf-8?B?c1pwMzdaazBvRlRDTU9YZHQ2ZHdHeEZQRHQybENMbmFXY29HRWVYVXRTUXR1?=
 =?utf-8?B?MGdiY0VSZG9DUWVsSWNtZ0FsSUJ6ZnJBQmdBekQxTldJN1dHY0dEdmJqUk90?=
 =?utf-8?B?cVVkWER3M3ZCcVdmVU1DemtVM0JMY1VlcmRPeE9CbWkvNE9wQTdkK3pHUjVQ?=
 =?utf-8?B?cTVYVWYxaW5QLy9BbithUUVkZkYxeEFGMllZaGVBOE1qSU42R2RyS2p5eng5?=
 =?utf-8?B?WDNqY2YwS0FKeDV3aG0vWXZOQ3pSVTBwODNyYmZIYm5nQy9aK1hzeTI4TEc4?=
 =?utf-8?B?K29sQ1VsUDRaOS92OU9OOHRNakF3K2RHakVuOVNabTRzZHFaOCtPRkc3VEpp?=
 =?utf-8?B?VnJRLy9ENjJUR1J1bENUWTBXWkZJSHd2RDJEUllCeVRiVGVtVnpqQXU3VUIw?=
 =?utf-8?B?QzVERGN4MVBXSU9ZVURQaUtsVGtVY3dOVHF0eWpvRUZFczEvU2VwbUl4N2F4?=
 =?utf-8?B?LytIVUgwV1ZWZHdGWXpCU0VuSnJKRUsyRC91SVJsRVlPQ0VNaW9UV3pKY1Z4?=
 =?utf-8?B?QnFZNHVLa1QwY3FhV2hlNU1GU09SV3U3bHVZTXZ1aW1WWmVYVjVTZW5qeGds?=
 =?utf-8?B?M3Z4aU1NRExuRmoyU21kR3duK2VPOGNIc25NNXFGMmRlSm01QzNhVWk3YzRN?=
 =?utf-8?B?blVtVTl5RzJPRGhiSHFqbnBRUW81cGFyYytURGdzTXpnMEpqcnlxTXRKZCta?=
 =?utf-8?B?YjlsNk5ka1A0L0tmazdhZXg0Rm9VeitHbm1oYWFVUDdsZzRXNWJLWXZTTk1a?=
 =?utf-8?B?V2RHei9OdDUzODBURm1sOTNXZG9mc1ROSmVhM0dCaVB3cGdDSVZRcTVtMW9U?=
 =?utf-8?B?akJvZVRiSUxvMDU4YmEyYThGSjNaRWU0Q251emoyUUFHR213bGNKSlJBSFFM?=
 =?utf-8?Q?lVvm7ZoxvQv4WrF46qZYmlv/b8CdCI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(921020)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjV3d3BwMG1KampnSjhpb1M3OG94cEl6VHlOcEJkcDhqcDhiRFYwbXlrUW04?=
 =?utf-8?B?MEJIM2hxdjNoeTQzZ2pYVDQwMFZacXUyYWp6U0N2TkthcUZRZ2ZyM1p6end2?=
 =?utf-8?B?ZnZwRmRnWUdUQzdxRnJjdW4rQVhtRkVqSlV5YzlyQ2dOaWZYQ1FQWTBpbzZJ?=
 =?utf-8?B?WFJvdzFldnZCRzFZNEx3YWlnUTM0eklhTTQycS9rSGhJVzR1dVVERlN4Q1lC?=
 =?utf-8?B?UTZDZ1FGZmJjZHpWWjZhdUpHRHhhdytlWHMwVVMvdnd1em1Xamd5ZDlOeFVO?=
 =?utf-8?B?ZEdxZ2lIMUNXVFVJTWZMendaeUxhc0dGSVIxZXgzRmxicE1ZS0d2bEE4cnVK?=
 =?utf-8?B?czQxT1M2eDBxTGRqUStkalkxRTVyUjBZb0k2THJYRURnN3gxM2NTMVRURzNX?=
 =?utf-8?B?ZWx6YW5rb2dUMFc1MzJVemFNd3hzaHBRR0I3N084ZE1UaFpjVllsNGFKdnQ0?=
 =?utf-8?B?V2ZsWTgyeE9QSmtJYUFKaDNXY3pxSWMrV2RWVHZBYmlPdVp2WFdFZSsyUmRS?=
 =?utf-8?B?SU15M0NPNDZpU01MWmFPbWlQV1dwdFlFZytEVGxlRFNNSDMxSXZ0cUVqb1pa?=
 =?utf-8?B?VzVwSDNjVFIrdURsWW4xUHhZS3djcjlLSUNGQS92eFFJcEZ6ZngzTGZSRThR?=
 =?utf-8?B?WmJEZDJWSGJWcDFHWWhtckJRdXh5UW90MFh0VkdTYU9sMlBKQXRnZ241Kzlu?=
 =?utf-8?B?NkZVdjR1cXRyWVVpV1Z2dnVva2NpZVJreDRvYXhGbFhhVFZ1cng2c3ZSNkVH?=
 =?utf-8?B?dXZhYzdBWWVPaUFaVS9tUFgxalRwY1lVWm5URVNqMVkzVmZLVXcrS05WYk10?=
 =?utf-8?B?eUFJdjBBcjhPUTI1U2RLeHRTN1kzNW1TWVQ4MTQ0S2JpY0w4SHRHdy9WWXc5?=
 =?utf-8?B?VU5kckJLK0drenFQK0wzSjlJQ3hMWThxckczK1VXZVoyQXhlV1QzR3lxWENL?=
 =?utf-8?B?c3pHTTFVOGJ6U2pTL1JtL1kxWUU3UUFldmhIS0hpaklUVG55S3VHRzVPdVVR?=
 =?utf-8?B?WWo2MDlibEd2cWNydHM3NkpDOGpoSVNIdUpCYXdZVHhMb25VUHNIMnB6RXp1?=
 =?utf-8?B?TTBtU1Z1NHM2eUtMU0NHaTlUTHpOL1NHd29JakxGK0RHb2YvRXFvMzJYS1pV?=
 =?utf-8?B?TTRWbGFRM3lrdDA1TUQvTzVaUmhsMHJIQzc4WWExMzk4SUxRU2p6VlZ1Q0I1?=
 =?utf-8?B?cnJnOEZVVVAva3gycUEwaVNNMWMrMVBmUEhkd1NLeGJDbTRMbmFmWjBwbFFO?=
 =?utf-8?B?Sy80bHBlVzlEbjBtam01aFdCeTFxOWExU2RORXNsbHpua3RjWGRhVmxsdUVU?=
 =?utf-8?B?SlA0Y0NWTFZyUFIwbUpkaWR5aG9aRUlwMC9IYmltTUNvYzdjK0ZBMlRqL2cx?=
 =?utf-8?B?cks2M0Q2MnJNOGNCWjMzWGhNSllvd1Y4L0M3UmRpNFdUdlFFeUc1eXBpMzUx?=
 =?utf-8?B?NzdEaElpbU90MmNyQUJSZjc0NGY5dXlmeUZkT1J0bUR6N2lJOHlmMUxRMUpl?=
 =?utf-8?B?SGNvbTRwUlRQS0R6aHpGcHJQM29BMDVCU2YzSWdaK0V0Zk9zMFR3ek9mKzFJ?=
 =?utf-8?B?ZGY1dDhFWDlIbWZMZXF2UlgycEFqbFo3a2NsaHREWnhJQ1pnTHI5L2V6UjNZ?=
 =?utf-8?B?V1g5TjUxS2taUThQZmwrOTcxbnp3dkpFMDlBR3E3MG9wSmJocVFUM2JyajAz?=
 =?utf-8?B?L0MvWDd5Wmw1QVVTclAxV2QybVRlT1REUjZ1UmNTei9BMHJpcUhIa3B5dUgz?=
 =?utf-8?B?R2xLNXJEcmtSNWNXWGFieWJsRkJBMnlBb1UzREdZNk80WTU2cHY0VER4Q3dT?=
 =?utf-8?B?dFVKdXNHWHlLdEszeThrQkI5STU0QVdvTUZFdFkyMnFZMUJmMmFqODVnampZ?=
 =?utf-8?B?cGNEbVhSdU9xZk5JcnhhRCt2RXEvSmlYWEhjZ2lOT08rekxEdWh1Nm8yS0x6?=
 =?utf-8?B?MnRkV0F4TWlFKzZWSmM5K2YyVytaMjBMVVNld2tiOUloNVBuNFE1Z1c1ZHZO?=
 =?utf-8?B?clVGZ1JTOHZmSm9ubkdlcDhaV2NjR3NiNmY5TC9KRmFaSUw3TSt5V3Y5QUhB?=
 =?utf-8?B?UTVJejlnMHZucDNBOElnUUk4UURPRG45Ukhab0dIUDE4aEdVMkZJeEt0YVNO?=
 =?utf-8?Q?Wy0s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC0D2ECD2291764781EBC930BECE3021@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a6d1ac3-3cf7-4571-45a1-08ddc2e6f852
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2025 14:59:02.0432 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D2udp19F/jwZAZ1G1KrCoFPs/cJaLNq9DzZF0M1gh6JIa6hrjJfW30oO1tbUVT9g4AmfP3BJNgluyJx/LUHEeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7137
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

T24gNy8xNC8yNSAzOjE2IEFNLCBBcm5kIEJlcmdtYW5uIHdyb3RlOg0KPiBGcm9tOiBBcm5kIEJl
cmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KPiANCj4gV2hlbiBwb3dlciBtYW5hZ2VtZW50IGlzIG5v
dCBlbmFibGVkIGluIHRoZSBrZXJuZWwgYnVpbGQsIHRoZSBuZXdseQ0KPiBhZGRlZCBoaWJlcm5h
dGlvbiBjaGFuZ2VzIGNhdXNlIGEgbGluayBmYWlsdXJlOg0KPiANCj4gYXJtLWxpbnV4LWdudWVh
YmktbGQ6IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYubzogaW4gZnVuY3Rp
b24gYGFtZGdwdV9wbW9wc190aGF3JzoNCj4gYW1kZ3B1X2Rydi5jOigudGV4dCsweDE1MTQpOiB1
bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBwbV9oaWJlcm5hdGVfaXNfcmVjb3ZlcmluZycNCj4gDQo+
IE1ha2UgdGhlIHBvd2VyIG1hbmFnZW1lbnQgY29kZSBpbiB0aGlzIGRyaXZlciBjb25kaXRpb25h
bCBvbg0KPiBDT05GSUdfUE0gYW5kIENPTkZJR19QTV9TTEVFUA0KPiANCj4gRml4ZXM6IDUzMDY5
NGY1NGRkNSAoImRybS9hbWRncHU6IGRvIG5vdCByZXN1bWUgZGV2aWNlIGluIHRoYXcgZm9yIG5v
cm1hbCBoaWJlcm5hdGlvbiIpDQo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRA
YXJuZGIuZGU+DQoNCldlJ3JlIGdvaW5nIHRvIGZpeCBpdCB1c2luZyB0aGlzIHN0dWIgaW5zdGVh
ZC4NCg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcG0vMjAyNTA3MTIyMzM3MTUuODIx
NDI0LTEtc3VwZXJtMUBrZXJuZWwub3JnLw0KDQpJdCdzIGluIGRybS1taXNjLW5leHQgYXMgb2Yg
dGhpcyB3ZWVrZW5kIGFuZCBpdCBzaG91bGQgc2hvdyB1cCBpbiANCmxpbnV4LW5leHQgaW4gdGhl
IG5leHQgZGF5IG9yIHR3by4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZHJ2LmMgfCAyMCArKysrKysrKysrLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMNCj4gaW5kZXggMDIxZGVmY2E5YjYxLi42NmI1YjMy
NjBmYjkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
cnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMNCj4g
QEAgLTI5NjMsMTUgKzI5NjMsMTUgQEAgbG9uZyBhbWRncHVfZHJtX2lvY3RsKHN0cnVjdCBmaWxl
ICpmaWxwLA0KPiAgIH0NCj4gICANCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMg
YW1kZ3B1X3BtX29wcyA9IHsNCj4gLQkucHJlcGFyZSA9IGFtZGdwdV9wbW9wc19wcmVwYXJlLA0K
PiAtCS5jb21wbGV0ZSA9IGFtZGdwdV9wbW9wc19jb21wbGV0ZSwNCj4gLQkuc3VzcGVuZCA9IGFt
ZGdwdV9wbW9wc19zdXNwZW5kLA0KPiAtCS5zdXNwZW5kX25vaXJxID0gYW1kZ3B1X3Btb3BzX3N1
c3BlbmRfbm9pcnEsDQo+IC0JLnJlc3VtZSA9IGFtZGdwdV9wbW9wc19yZXN1bWUsDQo+IC0JLmZy
ZWV6ZSA9IGFtZGdwdV9wbW9wc19mcmVlemUsDQo+IC0JLnRoYXcgPSBhbWRncHVfcG1vcHNfdGhh
dywNCj4gLQkucG93ZXJvZmYgPSBhbWRncHVfcG1vcHNfcG93ZXJvZmYsDQo+IC0JLnJlc3RvcmUg
PSBhbWRncHVfcG1vcHNfcmVzdG9yZSwNCj4gKwkucHJlcGFyZSA9IHBtX3NsZWVwX3B0cihhbWRn
cHVfcG1vcHNfcHJlcGFyZSksDQo+ICsJLmNvbXBsZXRlID0gcG1fc2xlZXBfcHRyKGFtZGdwdV9w
bW9wc19jb21wbGV0ZSksDQo+ICsJLnN1c3BlbmQgPSBwbV9zbGVlcF9wdHIoYW1kZ3B1X3Btb3Bz
X3N1c3BlbmQpLA0KPiArCS5zdXNwZW5kX25vaXJxID0gcG1fc2xlZXBfcHRyKGFtZGdwdV9wbW9w
c19zdXNwZW5kX25vaXJxKSwNCj4gKwkucmVzdW1lID0gcG1fc2xlZXBfcHRyKGFtZGdwdV9wbW9w
c19yZXN1bWUpLA0KPiArCS5mcmVlemUgPSBwbV9zbGVlcF9wdHIoYW1kZ3B1X3Btb3BzX2ZyZWV6
ZSksDQo+ICsJLnRoYXcgPSBwbV9zbGVlcF9wdHIoYW1kZ3B1X3Btb3BzX3RoYXcpLA0KPiArCS5w
b3dlcm9mZiA9IHBtX3NsZWVwX3B0cihhbWRncHVfcG1vcHNfcG93ZXJvZmYpLA0KPiArCS5yZXN0
b3JlID0gcG1fc2xlZXBfcHRyKGFtZGdwdV9wbW9wc19yZXN0b3JlKSwNCj4gICAJLnJ1bnRpbWVf
c3VzcGVuZCA9IGFtZGdwdV9wbW9wc19ydW50aW1lX3N1c3BlbmQsDQo+ICAgCS5ydW50aW1lX3Jl
c3VtZSA9IGFtZGdwdV9wbW9wc19ydW50aW1lX3Jlc3VtZSwNCj4gICAJLnJ1bnRpbWVfaWRsZSA9
IGFtZGdwdV9wbW9wc19ydW50aW1lX2lkbGUsDQo+IEBAIC0zMTE2LDcgKzMxMTYsNyBAQCBzdGF0
aWMgc3RydWN0IHBjaV9kcml2ZXIgYW1kZ3B1X2ttc19wY2lfZHJpdmVyID0gew0KPiAgIAkucHJv
YmUgPSBhbWRncHVfcGNpX3Byb2JlLA0KPiAgIAkucmVtb3ZlID0gYW1kZ3B1X3BjaV9yZW1vdmUs
DQo+ICAgCS5zaHV0ZG93biA9IGFtZGdwdV9wY2lfc2h1dGRvd24sDQo+IC0JLmRyaXZlci5wbSA9
ICZhbWRncHVfcG1fb3BzLA0KPiArCS5kcml2ZXIucG0gPSBwbV9wdHIoJmFtZGdwdV9wbV9vcHMp
LA0KPiAgIAkuZXJyX2hhbmRsZXIgPSAmYW1kZ3B1X3BjaV9lcnJfaGFuZGxlciwNCj4gICAJLmRl
dl9ncm91cHMgPSBhbWRncHVfc3lzZnNfZ3JvdXBzLA0KPiAgIH07DQoNCg==
