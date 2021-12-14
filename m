Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB44473F35
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 10:19:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C3710EAA4;
	Tue, 14 Dec 2021 09:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BA710EA66;
 Tue, 14 Dec 2021 09:19:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TyxV3O4w23CtYKBRMR2p2IJJHT42ByRunkb+B1vILneEbxazTuI9KCuNZJ6o/5EXYE8xwzL4mBb5WMkURIsx7TpRSYtfwn0D62P92qF6WAKVS0LX5EbN5jpk0m+F8YGCwmt7DRHVpnMvoQEWa37KYB0LYeKLi7SLHairZHeMbySIZS4xStjApyPRcL1kQ+Ph2rd7hp/UPXkjouZO6dlyXdrU3oiqdXI13Hx2ehlh+AErLhDklENltmE0ksBP2sW3Qfo6CIDJ0cXn6ERhudiNEYM9qWrcGRgEXosHIa7rdqLM8XWXOeFamQbAe4DHIVZ7H5PoEdyxboyiSqisqG7PxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqbfqODBW7r64MMNaB35hTZlnV2Ok1OMhjdhkv00X8U=;
 b=eQoz9Ja4B8mKK8tgio5xpaF42FR88kk31p9egrQURLxnLVfM9nsY3u3fbIMj8uINJc6YomzADVGTPZX/qgkLUxW2PxFtO75BXpTKHrfxBfMkLf4zIPaCcRuDQpVhHaUXsEHT3Ip6UyVnhzWNHMyakc6YvBn2LRKABNKZidRrHVX8N9a9BgrA1CbJ+bA8+ILrKlh8JXuKtvkHRWAIyiQuSWVCyoRjPnIC2R4PpuOBhzpjTm2dJmeyS7GEl1XA5XECpFZxaWle+AuRMmPx28pq5/RqvaktF3xfTCFThaKEBEMMNgQ0JtHpVaEFKoJLQc/IHnGdU/btWfKp0tMAcfh5Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqbfqODBW7r64MMNaB35hTZlnV2Ok1OMhjdhkv00X8U=;
 b=SjA7REMELHqS0AL7mdHkBOJexesGh21qFNNr1Y6we6QWj8XxLfK3v5uXabkAbmwUSylDg8Abl1b15D0HLSzSkJs6FcM3ioqa1QVuDgf76wQJ/MqHvEPzFHTVBZDrUKFrlWkul2vj6X8lGcxUVCKf8ywRudECETz1GL76BiWnp8k=
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 DM5PR12MB1643.namprd12.prod.outlook.com (2603:10b6:4:11::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Tue, 14 Dec 2021 09:19:22 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::5d07:e475:316c:d187]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::5d07:e475:316c:d187%5]) with mapi id 15.20.4755.027; Tue, 14 Dec 2021
 09:19:21 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Daniel
 Vetter <daniel.vetter@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Subject: RE: [PATCH 1/3] dma-buf: make the flags can be configured during dma
 fence init
Thread-Topic: [PATCH 1/3] dma-buf: make the flags can be configured during dma
 fence init
Thread-Index: AQHX7+uOznD3+/hXdUSwR6bUq1yPLKwxoUaAgAATxkA=
Date: Tue, 14 Dec 2021 09:19:21 +0000
Message-ID: <DM5PR12MB250468603570AFC28C211F56EC759@DM5PR12MB2504.namprd12.prod.outlook.com>
References: <20211213063422.2232155-1-ray.huang@amd.com>
 <5adca96a-e2bb-833a-e470-807a22b9b2fc@amd.com>
In-Reply-To: <5adca96a-e2bb-833a-e470-807a22b9b2fc@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-12-14T09:10:31Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=db6bac5c-665a-4e4b-9907-063b4ca4b050;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_enabled: true
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_setdate: 2021-12-14T09:19:18Z
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_method: Standard
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_name: AMD Official Use
 Only-AIP 2.0
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_actionid: cbeab1c4-1eb2-4602-b668-5d6c8443695a
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 169adae8-f0c9-4a1a-cade-08d9bee2d07e
x-ms-traffictypediagnostic: DM5PR12MB1643:EE_
x-microsoft-antispam-prvs: <DM5PR12MB1643E933B8FBCCD0DBF179D4EC759@DM5PR12MB1643.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pbrCSLv/JSvS6Dh8gbfpxilGxMi1KrBrDPM9ap2YsRYixptovqI6BfSveSyGdPRnBwO2TE453o03fnEJZ3uWp+iMEgfGPhmjccxW54mLjcCt6xQGR5Qi7grx6AMBJ0/8eCn3eSyixhWcZ4HnyCF+vnjGmP1KSPBDlrremsdxooA/ABbeQQa9g+P4/5EwebxYd0L8xxNm0U80y9yiP3vIFTmszNO/rsf6cMefBU15eUG96qVxQalKa648RMVlFryrGKSj6v+VfaFuZDLRG7WZpzx0nSFLr0qT3ho4ntt74aZW/3IlJ+ua5qFjOocaKmrq5742BRZ5Ir9CjbJ6F/+sTGbgoxPLeWaaQd182VjBwCGyJRzjXeSEYu1LY9MBpHXLlTTgryCPRUeQ9f1wCekrlsvBx7K1AJxI21IaX0Ty1pG3HUrdc//d+gGtECnQf9CaKG3cgmm6k6mY5Kmv5MIzdC0mDEaZcT+aKD6X7N9JmO1AbXpWo5+UJ+hDFbTUuMxfi/zwEYnwcyZ4oqJQwItAdlBIu2zPgRizTPK0e2zB9gx4fDvTx2iwv/x26grynkxmQrLpslDz3CZ8E5jxfVnUm5xFhFpOBMkFZoQTCzn5OWV1vV8hU7QieETTIJKgJ0Emw2xc4Y7GV7zbpIq0ZFgTtoeIR55eOL/GGS906u2W4H2p4cIUs4xokTaiv7RZN+kayo4fZVJA/HAnTNN2lFG90Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2504.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(26005)(5660300002)(316002)(122000001)(38100700002)(8936002)(52536014)(186003)(508600001)(54906003)(4326008)(9686003)(71200400001)(53546011)(6506007)(110136005)(55016003)(7696005)(33656002)(66946007)(76116006)(38070700005)(86362001)(2906002)(66446008)(64756008)(66556008)(83380400001)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1hGcDk2RUJGVHprbm5EbUVoRHJEWWpXVDVKZTRqQlNLNkNmYndsS3IrdmYx?=
 =?utf-8?B?N3RXMXl4MnNtU1JVUXltL2VjNXlNSXFCUnZ1Y3R3KyswajBOMWkvNWIyZE5t?=
 =?utf-8?B?SnlTYjUrVlBFcG1TVnZld2lpWFIrdWt5RVBZTURsOXNadVhHa09LS1gxRFFD?=
 =?utf-8?B?SU0rY1l5OGdvR01jSVZGMnJSVTdwLzVBczRVYWpFcjFMR1VzZTNiZE1tRlVm?=
 =?utf-8?B?emV4ZEdWYW03c3d3RDMwc3duNFBmZGliV3NIQU1jdlJpOFJ1VE9YRDlSZWVT?=
 =?utf-8?B?VDgxV0ZUeTdTNC9YdFlGU3J6UFpLbmJWQ1JXbDhFNHR2Z0VRdkVKbENKZ3Zz?=
 =?utf-8?B?bkFhTkllNEFqbGNlLzQ3Z0pvUmoxTGdyRnVNSzdadVVFb3hKRVZLclo5cE1V?=
 =?utf-8?B?dFNGU1I2cUlUZnVqczhaVmYxUGplL2ljT0twSXdONWZuV0loZ1prRzRoZnhQ?=
 =?utf-8?B?Rmp1b3ZzTitCbXUxRE5OaURqL3hGaDZvMFFWS2U3dUVPenBaVnkxOTYvMGlt?=
 =?utf-8?B?U1d2Vm41dGpZOEtpMWFPQUdVOUdyUTNmR2NJTHZPUVByVC9PcTkvcTBsRWI3?=
 =?utf-8?B?bUIyYW1xcjEvc3lhVWV5VlZtMVF5blpBTDZhZkJ3dVNvUFcxTysvdU5yU1A2?=
 =?utf-8?B?aUhCZEQ1WSsxWUZmaG5yRWx2dzdhZUhpSDB3SFo2YitHeTBFL3Y1a25ucDdW?=
 =?utf-8?B?ZlhTeVQwdS9BQXZLVjFIUExxdy8xQng0S2pVdDRXR1IxNFNGZTMwSHhSaFF4?=
 =?utf-8?B?NEduU1hCOXo2K1ljY3orejdYRlVmWVhaVlhOdTVrMnkxUytDL2d2ekQxOEtN?=
 =?utf-8?B?TFFMZ0J6Z2NDLzVDY05VWDNYL05pYUI0aVFGK00ydmxSNEpIVFZIR1ZJMHgz?=
 =?utf-8?B?R0ppcFgwUklPSG50T0xYM01aZDVkL21INW9sUFBpL1dnSEpLSVhqcFc4UGlx?=
 =?utf-8?B?RG1UaVpING5zWUNORURFYjkyaU9HOFA0Qk5TclBncHVyS0phUm1lZ3k1dml4?=
 =?utf-8?B?QlBOR0dTdjMwTERjLzYwUGlwaVFIM2UvQXFJMGZINDlJaC9UOU1kZ1ZocWNY?=
 =?utf-8?B?Nk9MY3BvUFFJelU3ais3WURtMmxIVkM0djVucEIrNDRJMXZkSEpQVUt1ZG91?=
 =?utf-8?B?N3N3eXJlanZpRjFhcEYwL2dIRFA0dmJkdnBnUWQ1OUN6UlFMbEFOSzdTdFQ5?=
 =?utf-8?B?TVJYVVpUQzRVQnZzWmRHT0NBZ2FpVFJnY0xaWHBpSjJDSWxlQVZjcVVIdXdI?=
 =?utf-8?B?WWt5R09hYVBJY1VMY0JuYWRpQWxZVjIrM0tzbUovaVVRUHdkbUxvaFFPeTFX?=
 =?utf-8?B?ZjhLUVYrdFFTQWpKSVdNM3djQjQ3ZXNKSXNUNHZDNVNyMVYxd1lkeXI1THB1?=
 =?utf-8?B?aUkxNDlwcitiRVA3NUo3VnhkUlRPekEyMTduMVRBOU1CVllSV0E5ODZBWmdC?=
 =?utf-8?B?OXoyRDVyNENqOWp0cWE5TDMxR25OdG5pTG5MNG1aV3ZtR1FUVk5ROFBZdlJp?=
 =?utf-8?B?SmZ2b0N6TVBUK0xjTTNBQzZlS2l5ZXFCUHh4V3BEb2tMdkpTNWpYS3NCcUdV?=
 =?utf-8?B?L05GL2RTM1BDUE5UckNhamFOcWxUOXZuZzREZ1hvTE9RUWt0ZDdHV2hRbXBI?=
 =?utf-8?B?b0lqbDNKdUdCQWtEdmRvSmNsZnFqWXpjNGxIVVJhamJsUU5rS1R3TW5YNUpq?=
 =?utf-8?B?S2xMU21UYmFkNiswSVU0TGRjd29KSWlVTFREWWxCTEFLMWpnV2Q3V2dEakZJ?=
 =?utf-8?B?QlNDOUl3aC9mdFNhT3ZBMXl1eEdvZ2dyK1NmZ1VSV1IrYmNqVFVWQ1VUVWtV?=
 =?utf-8?B?SHJrbHNxMHRiRVhHc0p0ZDdIZlV5ZTJMa1NUWVdIYXJpOVZlcHc0bHo5cUVP?=
 =?utf-8?B?T1B1Qk1JNXhKWDNidXYwamZZbVdjQUltcmJ4YUpGa1JoamNPQnBzd3VGb0JH?=
 =?utf-8?B?VXVaZDV4a1dUdjgyZHFWRzdlWkNpVjBxa2ZUblpFNVRFVkF0MUJvUVFqU0Fr?=
 =?utf-8?B?MVVjSmwxN1BLODh0Z3k4S3R5dWZKZUxIMjd4RlJUWGh4RjliVTMvRmtsVVhG?=
 =?utf-8?B?NlRFcGZweklXUjhNbjJnemhQU3ZIcWg1Q1ptUnpNWk9hNGt6QmFGRkZEMGdi?=
 =?utf-8?B?aHY4Zk1PTGxWelRNdGFKTkdqUVpDcjhQTUQ0NEpCTFBQa3B5Y3VjdSswK3Vy?=
 =?utf-8?Q?EBOP+LdwfyPGR95U8CwnlWM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 169adae8-f0c9-4a1a-cade-08d9bee2d07e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 09:19:21.8555 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /cyNk0g4tVQKqJ7iQe5U6Vwb3U0xnZDGTmM8l8aq5k1wxU5hlLjnvYU1F1vTEBnSCfe/iMnh74HiHNaYS1pJ4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1643
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
Cc: "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KPiBT
ZW50OiBUdWVzZGF5LCBEZWNlbWJlciAxNCwgMjAyMSA0OjAwIFBNDQo+IFRvOiBIdWFuZywgUmF5
IDxSYXkuSHVhbmdAYW1kLmNvbT47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+OyBTdW1pdCBTZW13YWwNCj4g
PHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPg0KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc7IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgRGV1Y2hlciwNCj4gQWxleGFuZGVy
IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgTGl1LCBNb25rDQo+IDxNb25rLkxpdUBhbWQu
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvM10gZG1hLWJ1ZjogbWFrZSB0aGUgZmxhZ3Mg
Y2FuIGJlIGNvbmZpZ3VyZWQgZHVyaW5nDQo+IGRtYSBmZW5jZSBpbml0DQo+IA0KPiBBbSAxMy4x
Mi4yMSB1bSAwNzozNCBzY2hyaWViIEh1YW5nIFJ1aToNCj4gPiBJbiBzb21lIHVzZXIgc2NlbmFy
aW9zLCB0aGUgZ2V0X3RpbWVsaW5lX25hbWUgY2FsbGJhY2sgdXNlcyB0aGUgZmxhZ3MNCj4gPiB0
byBkZWNpZGUgd2hpY2ggd2F5IHRvIHJldHVybiB0aGUgdGltZWxpbmUgc3RyaW5nIG5hbWUuIE9u
Y2UgdGhlDQo+ID4gdHJhY2VfZG1hX2ZlbmNlX2luaXQgZXZlbnQgaXMgZW5hYmxlZCwgaXQgd2ls
bCBjYWxsIGdldF90aW1lbGluZV9uYW1lDQo+ID4gY2FsbGJhY2sgdG8gZHVtcCB0aGUgZmVuY2Ug
c3RydWN0dXJlLiBIb3dldmVyLCBhdCB0aGlzIG1vbWVudCwgdGhlDQo+ID4gZmxhZ3MgYXJlIGFs
d2F5cyAwLCBhbmQgaXQgbWlnaHQgdHJpZ2dlciBzb21lIGlzc3VlcyBpbg0KPiA+IGdldF90aW1l
bGluZV9uYW1lIGNhbGxiYWNrIGltcGxlbWVudGF0aW9uIG9mIGRpZmZlcmVudCBncHUgZHJpdmVy
LiBTbw0KPiA+IG1ha2UgYSBtZW1iZXIgdG8gaW5pdGlhbGl6ZSB0aGUgZmxhZ3MgaW4gZG1hX2Zl
bmNlX2luaXQoKS4NCj4gDQo+IFdlbGwgdGhhdCBkb2Vzbid0IG1ha2UgbXVjaCBzZW5zZSB0byBt
ZS4NCj4gDQo+IE5vbmUgb2YgdGhlIGRtYV9mZW5jZSBjYWxsYmFja3MgaXMgY2FsbGVkIGZyb20g
dGhlIGRtYV9mZW5jZV9pbml0IGZ1bmN0aW9uDQo+IChvciBhdCBsZWFzdCBzaG91bGRuJ3QpLiBT
byBkcml2ZXJzIGFsd2F5cyBoYXZlIHRoZSBvcHBvcnR1bml0eSB0byB0byBhZGp1c3QNCj4gdGhl
IGZsYWdzLg0KPiANCj4gU28gcGxlYXNlIGV4cGxhaW4gdGhlIHJhdGlvbmFsIGFnYWluPw0KDQpP
bmNlIHdlIGVuYWJsZSB0cmFjZV9kbWFfZmVuY2VfaW5pdCBldmVudCwgd2Ugd2lsbCBjYWxsIGdl
dF9kcml2ZXJfbmFtZSBhbmQgZ2V0X3RpbWVsaW5lX25hbWUgY2FsbGJhY2sgZnVuY3Rpb24gdG8g
ZHVtcCB0aGUgbmFtZXMgaW4gZG1hX2ZlbmNlX2luaXQoKS4NCkF0IHRoYXQgdGltZSwgdGhlIGZs
YWdzIGFyZSBhbHdheXMgMC4gSG93ZXZlciwgaW4gYW1kZ3B1X2ZlbmNlX2dldF90aW1lbGluZV9u
YW1lKCksIGl0IHdpbGwgY2hlY2sgdGhlIGZsYWdzIChBTURHUFVfRkVOQ0VfRkxBR19FTUJFRF9J
Tl9KT0JfQklUKSB0byBzZWxlY3Qgd2hpY2ggd2F5IHRvIGdldCB0aGUgcmluZy4NCklmIHRoZSBm
ZW5jZSBzaG91bGQgYmUgYWN0dWFsbHkgZW1iZWRkZWQgaW4gdGhlIGpvYiAod2lsbCBiZSBzZXQg
YWZ0ZXIgdGhhdCksIGl0IHN0aWxsIHdpbGwgdHJpZ2dlciBhIGtlcm5lbCBwYW5pYyAocGxlYXNl
IHNlZSBwYXRjaDIpIGJlY2F1c2UgaXQgZ28gd2l0aCBhIHdyb25nIHdheS4gQmVjYXVzZSB3ZSBj
YW5ub3Qgc2V0IHRoZSBmbGFncyBhdCB0aGUgc3RhcnQgb2YgZG1hX2ZlbmNlX2luaXQuIFRoYXQg
aXMgdGhlIHByb2JsZW0uDQoNClRoYW5rcywNClJheQ0KDQo+IA0KPiBDaHJpc3RpYW4uDQo+IA0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4NCj4g
PiAtLS0NCj4gPiAgIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYyB8IDIgKy0NCj4gPiAgIGlu
Y2x1ZGUvbGludXgvZG1hLWZlbmNlLmggICB8IDcgKysrKysrKw0KPiA+ICAgMiBmaWxlcyBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNl
LmMNCj4gPiBpbmRleCAwNjY0MDBlZDg4NDEuLjNlMDYyMmJmMzg1ZiAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMNCj4gPiArKysgYi9kcml2ZXJzL2RtYS1idWYv
ZG1hLWZlbmNlLmMNCj4gPiBAQCAtOTUyLDcgKzk1Miw3IEBAIGRtYV9mZW5jZV9pbml0KHN0cnVj
dCBkbWFfZmVuY2UgKmZlbmNlLCBjb25zdA0KPiBzdHJ1Y3QgZG1hX2ZlbmNlX29wcyAqb3BzLA0K
PiA+ICAgCWZlbmNlLT5sb2NrID0gbG9jazsNCj4gPiAgIAlmZW5jZS0+Y29udGV4dCA9IGNvbnRl
eHQ7DQo+ID4gICAJZmVuY2UtPnNlcW5vID0gc2Vxbm87DQo+ID4gLQlmZW5jZS0+ZmxhZ3MgPSAw
VUw7DQo+ID4gKwlmZW5jZS0+ZmxhZ3MgPSBvcHMtPmluaXRfZmxhZ3M7DQo+ID4gICAJZmVuY2Ut
PmVycm9yID0gMDsNCj4gPg0KPiA+ICAgCXRyYWNlX2RtYV9mZW5jZV9pbml0KGZlbmNlKTsNCj4g
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9kbWEtZmVuY2UuaCBiL2luY2x1ZGUvbGludXgv
ZG1hLWZlbmNlLmgNCj4gPiBpbmRleCAxZWE2OTE3NTNiZDMuLmY5MjcwYzViYzA3YSAxMDA2NDQN
Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS5oDQo+ID4gKysrIGIvaW5jbHVkZS9s
aW51eC9kbWEtZmVuY2UuaA0KPiA+IEBAIC0xMzEsNiArMTMxLDEzIEBAIHN0cnVjdCBkbWFfZmVu
Y2Vfb3BzIHsNCj4gPiAgIAkgKi8NCj4gPiAgIAlib29sIHVzZV82NGJpdF9zZXFubzsNCj4gPg0K
PiA+ICsJLyoqDQo+ID4gKwkgKiBAaW5pdF9mbGFnczoNCj4gPiArCSAqDQo+ID4gKwkgKiBUaGUg
aW5pdGlhbCB2YWx1ZSBvZiBmZW5jZSBmbGFncyAoQSBtYXNrIG9mIERNQV9GRU5DRV9GTEFHXyoN
Cj4gZGVmaW5lZCkuDQo+ID4gKwkgKi8NCj4gPiArCXVuc2lnbmVkIGxvbmcgaW5pdF9mbGFnczsN
Cj4gPiArDQo+ID4gICAJLyoqDQo+ID4gICAJICogQGdldF9kcml2ZXJfbmFtZToNCj4gPiAgIAkg
Kg0K
