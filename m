Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 202CEA56660
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 12:14:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E5910E0AD;
	Fri,  7 Mar 2025 11:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="NjmJ2WdN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011031.outbound.protection.outlook.com
 [52.103.67.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A6310E0AD
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 11:14:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIrOuLzBQMtS+WHfs4Gd8iYsr+PauqRbUgVCSkIOow51D52O+SnLTGvqRjB7/W/XgapEKrSMU3UUTVXFpYWuJ0MyYwg6y96xla3lxu/AHnLW4CWsrNcaUkvnCMKvyOxiEQbSL3mI/0IqWgwLTA9CJHxUIEvFwPDLztyEfBXnNxnAWC+YsRZ4Q81tM1em/q6bbcCeRm/j8/nTnmCCIU03GvaLVZnPMvlVFQafkfbDffQofs/s4IASmlJzAvFDXh2o7FgnmRQCG1kThRtpRHYKXCsGO4xMTnquLudG+6mp/GpM0jQDyh70EXdc2aqJbzlUbJwcu3E8Lmjk4T2nDfJiRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/H4/DSNXuTRX0C+cZCFAkORTrru1R0gruXvZJIx0Do=;
 b=Ba6y0AZ43JHxFSsJcAu8iaLeuZ8NpT4S3m5tOSUh4lPGYm35gQsgvuhsXdXDODuI/+U3wwQ5G5Hktm257cWrrpuSo+rS4sI4s4rjKbXZWOgUlJPWVmBuO21WHaBrixWTf+DF4up7E1IdvjRQrqt1JYK40mW8KgDzyZGfBt4in+AZW8Q9RWuRw86DNFDB8X21iN/1+PwXisqLlmb8xbHEmYDOI/LIK8y81K0Fk/AZ0jtQt4XDkTt7Ger+z4oyu851KFoSsXtlO1gaqIe7RSW6uI0R7TBOADx2L69UQUequPzXDXAMv240+CHsVMeji6xbamuPxI+Tz/J3MjWBQYAx1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/H4/DSNXuTRX0C+cZCFAkORTrru1R0gruXvZJIx0Do=;
 b=NjmJ2WdNlbwYBwIb8nC/+erbX/m8cyt1ZreFOMP7Nl/8fYAip3BCA0mAg2MIBnZxchtaOXfDKyQVSMnzDsiKaoGYHeO1KJNEIxglXb3m2H2XDtmMri0Yu4CS5/etXls+A9UeDben6tUEHyvqsGWXUSbLhMMjgpDdkSLGJFDC7kjwuINt9DdpEH/8lbXOpp9d433siD+BOA2+FG+FYDenmKkrU66MDG90xmIXbyzGSFc99jhQtWx2N8BClm9JbYKTgmaGjdD9g6m8lowNmDxFsVuD4LUx8t1FYyHdlqh53TDMQexIr4QafnSmXpCQWSkhE53upLkXM5a80h4IYt1Vug==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB7265.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:31::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 11:14:28 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8511.019; Fri, 7 Mar 2025
 11:14:28 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "simona@ffwll.ch" <simona@ffwll.ch>, "javierm@redhat.com"
 <javierm@redhat.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "hdegoede@redhat.com"
 <hdegoede@redhat.com>, "airlied@redhat.com" <airlied@redhat.com>,
 "sean@poorly.run" <sean@poorly.run>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "admin@kodeit.net" <admin@kodeit.net>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/5] drm/appletbdrm: Set struct drm_device.dma_dev
Thread-Topic: [PATCH v2 2/5] drm/appletbdrm: Set struct drm_device.dma_dev
Thread-Index: AQHbjzik7qDIxCV6X0ORvtJmLzeskrNnha8A
Date: Fri, 7 Mar 2025 11:14:28 +0000
Message-ID: <A372C99E-90B0-4978-AA8E-2BC86B491C7A@live.com>
References: <20250307080836.42848-1-tzimmermann@suse.de>
 <20250307080836.42848-3-tzimmermann@suse.de>
In-Reply-To: <20250307080836.42848-3-tzimmermann@suse.de>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MA0PR01MB7265:EE_
x-ms-office365-filtering-correlation-id: 7939b372-1cf6-41c4-99f1-08dd5d6939ec
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|15080799006|7092599003|461199028|19110799003|8062599003|102099032|3412199025|440099028;
x-microsoft-antispam-message-info: =?utf-8?B?OEdlUzljbjNGd0xUbTRoeENPM0dGUmJObmVOVkViQVI5U1dHUzRmMW9JVVJ4?=
 =?utf-8?B?SlNuaDJKQVZLa3cxaVo0Z3kvMHErZ0VLS01NVElGRmFwV3FhenJqVkt3ejJN?=
 =?utf-8?B?TTdCa3ZqQTZwL09xY2tRVStxVk1GaWdGb3Y3WW1FUDRyMTNaVU9nNUx3SWxT?=
 =?utf-8?B?QVFsQmxGNkxKYmtBc3IvQ090VGpwajdBZHBrQjdDc0w4Y0JIZzZKWEdQdU45?=
 =?utf-8?B?T0hqR2E3d0g2ZVIvYXpzZlBYbzdwam1QYTdpbFlUbzR4L01kNzVraFRiRDN0?=
 =?utf-8?B?MjJ0YU5zVURXWXhNb25ldzJxZExwYjQ1N3o5WmFjeEdCT1JWbnpJQXg4OTdq?=
 =?utf-8?B?T2I5YVpVNk9ncGxlMmRrUVBjTk82UnN0S0pNRDEzRXZiRU91aVhSZ2tmbFNZ?=
 =?utf-8?B?SDQyZGlWcmUxeE5HUEMxZGNYLzRpUHkxZHYxUlZ6Mm56akJkVUUvZ0syYTdC?=
 =?utf-8?B?dEJnN1IwaXYwZWs0R2tGbmFXSGgyMVJQeE5MOVdKWFNPSy9vcVhvOGFyUEpL?=
 =?utf-8?B?QzZZT2dybWNXUFIva0JMc3NRbzZ2T2JMK3ZmWEt1ZFBiMXlNS21ZUkI0MVAx?=
 =?utf-8?B?N0xrY2N3KzhpQU5sWk8wVlNTcE1DTjVRYkxTUEFGOW56T1R3L3BPTU9BeDJL?=
 =?utf-8?B?Y0FESEJaNGlrUlF0dmdkRFAyQ3k3NzN0c25ramFia2loeFQwOGs2OWVBazNy?=
 =?utf-8?B?L25nVzlwNnlJQ0dsK3gvMWhhaVB1RWE3eUE0OHhTMENMRkFWQmpXTkc4b004?=
 =?utf-8?B?Zmo2MlVkVjVobHZUQUNNb3RKaXdlZWV4aERpVUJ0TC9QWm1DY3VscWFkRS95?=
 =?utf-8?B?RU9yM1B5a01UZjVpZHh0ZFVYeXBqYWRmcVArb3p6cGd5TzM4VTZqcFhkWk9Z?=
 =?utf-8?B?eWJ3cmVwMDlsWWM4dW0ySU5WdEZ4aGJPV2x3ZmNHSU5wNXk1aUJ1Z2tvOFZ2?=
 =?utf-8?B?a1o1ditGUWlkU3RGVmc5M3pFNzgzWVZNcjY2bnRhRFF2SDhMdk9oQlB2WnVx?=
 =?utf-8?B?Um5XVSsyV2UzYllnYlJmbEVvM1Fwd013MHdqalRSQWI5ZkY0azJKZ2V5Y0Rl?=
 =?utf-8?B?M2E0NEt6eUhjeUhnSzZyN1NXTlJiL2VJQ3dQYXNyYWxpY0pDS0dGNUlDMUJ3?=
 =?utf-8?B?dEVvZlhQczlHenNidFN6eGZuLzlsT2tySnpIU2R1cWYxNGlLcmNZL1U0QTYr?=
 =?utf-8?B?Y2JzTDVaU1dwbk40bU5sb3RpVzgxOXdlenFZeG9qUGpWL2k4Y2RKUVpRVmxZ?=
 =?utf-8?B?OU5PRG9wbkd4b0hSOHMrVEpUa0diRjl0cmQyTnhOKzRlSzlQWHlhTTNCYWVa?=
 =?utf-8?B?eDVrYXZwcXMyMkIxd0dyRG1rS2cwWlRjMmpzeUJGY1lFWlVuWnhwdDE4dHQx?=
 =?utf-8?B?ZFZ6bldWV3ZYWHlPY0RIdW9WcUU0TEwrN3EreENtT3NYM2tFNGlZSFJCQjdC?=
 =?utf-8?Q?V/tU2bCM?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3IraU5EL3JBNUFYWVpsVWpIbEEyZVIrcmpra0J6ZDJSQm93aEJzVjQxQnJi?=
 =?utf-8?B?Sm8xS2NzSDEzZ2FTaGFDOGlMMW1yY1RiYVppODkyNUwzY0laUUx4a092Njdo?=
 =?utf-8?B?WGJHdTlSYkdLeEw0Q0lOcFpBa2dvdGRDdkt0bXhLaWtSdTV6ZWFTOE51eVJx?=
 =?utf-8?B?b29jUmxHNitHWkg2NXJlR2hpSndWTTZCOHNYbDFieXljdFovM2F3cG9FSits?=
 =?utf-8?B?K1EvUGZsb1lzcEphOVkwMXR2UWhvYkJMVStoK0hiYllhMTk4NFBkY1RhN0U0?=
 =?utf-8?B?UEdkdnpQdHFhZlZiNFVQL0k1Qy9pRnVMblFMVVFLdUozT0taWFVVVjZlYVg2?=
 =?utf-8?B?NGZnd1dJQlE5VWRRaEVQbmVoVk85S3pXZ0FPblBNV2ZOQjUxUW4vdGloL1RT?=
 =?utf-8?B?aVcyaTRyczV3UmN3eXltSFg4a29nTitFQkVVeGpVb01aV2lPQjVFVk1KTlRo?=
 =?utf-8?B?YkxIN0FBRkRWdDVaZnE3U2oxcXIranEzYUI0cWxPMEFtZk1aL0xnVEVBVHJw?=
 =?utf-8?B?NWNsUzduSStKZzV2d0pTZ09RRTV5OXBMM1g4eURnM01rYlgwaGJYQWhKakJv?=
 =?utf-8?B?dml5ZWJDeG1lVjlBNURmVEQxRTQ4OUMyRzhJL0J2Yi9Zb3NjWncwWkF1OFpk?=
 =?utf-8?B?WEpMTXZKWDgyZU5wQlkwK1piVzBZV2I0bzNPc0h5RlR5Wm9acjZHWUlOOHRX?=
 =?utf-8?B?dFhqakZPVGpFUFZicmNiVFlSb1N5VXBiK1BialhRWUpMV0NoUVI1SHRHaDRH?=
 =?utf-8?B?bHNlelVvMlhGTi9tOUR6NlJaWFFwWWRnVWJ0eGQ5emJmc1ZZZ1JTN3VRT2J2?=
 =?utf-8?B?QlFOV1FwZkEzaUQvZm5lL21ReGIvY2RHMlJzeW5KZ3l2WlVUSEUveVJyTXYv?=
 =?utf-8?B?K3c5VVkxNGlWWDc5eFpIU2lmZ2xoRlR2aHhnenpCYnJoc0lEbDdQejl5aVB2?=
 =?utf-8?B?YUdQbVQ5NEdJRmlRSDZhdGRWdlo1aEtsV0NobXFzR3BDdDBwNTZKMzZTTnhn?=
 =?utf-8?B?RXNRcjRRQ2JxdWZ6ODdJcEtrMklLc2JiY1N0dmlSMmdaRUdQUXNCNURyQmFN?=
 =?utf-8?B?eXFmR1hVbndxTjB0enk3K2YwaEtmdm5XNmNsODg1SzE5NDhMaExRNTl6RElz?=
 =?utf-8?B?RnBHWnJ3bmJKSGF5Ylh6Zm5IK1BUS3puSDFkQUpYL0x3SnNadEFmMnZ0bUdS?=
 =?utf-8?B?MWliSzFDR3BDMVpOWEhMUCsrRzdCLzhtd3F0SGt0R1VJRExJUDdKNTJyNzZx?=
 =?utf-8?B?bEo2RVRUQXZGR2xCKzFyUC8rYzU1TUV5b056VHZ4MXQrRWpoNmNOT0Q2M3ZP?=
 =?utf-8?B?QXUvcmFMb1NpYUUyRW1UMERuTThuVE5ZeCtqMlBDMTFNWTB2aVNrZnJ6a1dM?=
 =?utf-8?B?TXJOMDVzek1OVUdHSVNacTArcWxDenVCeHZ3d2ZMODMwdU1tU0ticERNZ1Zv?=
 =?utf-8?B?cTVjeHUzUmxhRjViTGRNSGNUdDhZZFJNMFZTSXBha1dSbTBLTnZ0ZHRCT2dm?=
 =?utf-8?B?dnVXejd6emtnazR5L0VYK0d0VzlZSy9oV3htV3JFS3FxVHNxNU1Fcy9MQzZJ?=
 =?utf-8?B?bWtxRjdjczNjL1FhOHRONkZwNXhMbmJjRm1qWHlEZDBVUzJTVEFGRGFmSWY5?=
 =?utf-8?B?RWNLZDdHTS9PZ0lNL1Z1YlJyenlZSWMveEZTb1FBbnl6UVBSTHprS2FvNWlR?=
 =?utf-8?B?YXVNbTBURVg1VGhuMmtlYStQTFNwSk95d3Bna0ZBcWE1SjhZTzVpMFFlM2dT?=
 =?utf-8?Q?4Rnun83fDL0vlQiEDHwQkl4hiBVeEDP01YesLy/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <443A4B203B5F7A47A7ABB037658E4875@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7939b372-1cf6-41c4-99f1-08dd5d6939ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 11:14:28.1217 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7265
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

SGkNCg0KPiBPbiA3IE1hciAyMDI1LCBhdCAxOjM04oCvUE0sIFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4gDQo+IFNldCB0aGUgZG1hX2RldiBmaWVsZCBw
cm92aWRlZCBieSB0aGUgRFJNIGRldmljZS4gUmVxdWlyZWQgZm9yIFBSSU1FDQo+IGRtYS1idWYg
aW1wb3J0LiBSZW1vdmUgdGhlIGRyaXZlcidzIGltcGxlbWVudGF0aW9uLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IC0tLQ0K
PiBkcml2ZXJzL2dwdS9kcm0vdGlueS9hcHBsZXRiZHJtLmMgfCAyNyArKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0NCj4gMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDE3IGRlbGV0
aW9ucygtKQ0KDQpGb3IgdGhpcyBwYXRjaA0KDQpUZXN0ZWQtYnk6IEFkaXR5YSBHYXJnIDxnYXJn
YWRpdHlhMDhAbGl2ZS5jb20+DQpSZXZpZXdlZC1ieTogQWRpdHlhIEdhcmcgPGdhcmdhZGl0eWEw
OEBsaXZlLmNvbT4NCg0K
