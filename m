Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF615B1BB35
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 21:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4788210E2BF;
	Tue,  5 Aug 2025 19:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="spOqQNBL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AB310E2B6;
 Tue,  5 Aug 2025 19:56:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxPTW7dYgxa9hD0uIL1AGRBx9gwYrsvg4lKLVBJPx1WTwNU3j1Eje+kRSvA8UDhJfQpzzosz/fXk0PveZrKmrP7GXqaZ5UYkJ9meJEUzWryms2syjOv+I+2i3ex6Jvre+eAkDpAYRl9IhpBTTAJLSWcJcB+dqt01NHNvnB+IdQz7yEDTGp3xNoFolZfOpGp5LGaIS62aN8XskCeJ1wGmKrymrSh2WTJG34mRcjGOsH5c8HYFfuy8DxW2U8+HLqVnJBEI3RMuIDx08kP5z12XkGaCs031BVZMk1ratGd2XLPNb+U3U41Z7VbdTFBLEXTZ7kRwoS8CSLlLNuWtRDgH4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+5ooMhdvrDD7vbPH1y1l5Ln0YTlSh1zbRBBnJAul2k=;
 b=NlKv47gWQjZVZHUxfjRxP6g84kg9JvsKfGq6/5ehm7CopxMVfYotnG/qxj5iFzajDM69BIEjUrlBBQrmMdg2UMYk+DnStg2ddsYdVUhOFTxAkq5FBQTW4/6PQKjT18Fmj5l0e78EEa7R/t0W+0lyfbk/p78meODp9odu7WOZ50YdWKzKdpczB4pgCuEMF8Zib1tcwBnmG7iyJ063Hz6YbAEuhi4WF5BOssFe1WDD2zNYFU1Yi8jWk9L/5YKIa267XYZo/tnCRjMm+AtBkzfCbzodaOJxvOWV1gnUAw1FvZAmjvOv1hgxlkTE04SZZvk3Pl6/0eyJRBUb0ASNLxofnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+5ooMhdvrDD7vbPH1y1l5Ln0YTlSh1zbRBBnJAul2k=;
 b=spOqQNBLFUhuB2oyPOpmJDuMUWj4XgBPmSXEB2augBw7VQE/q5kcLTHZXkEGwFIqvX3ORffFw34tgJ/9kElDQsP3MjkjYtz8BpADAtrZcIj0nJ6fM7TQN7EonA55tEjp/mvFI3sj2TRCyLleNg2D7Xpz4QLm+a4EY3qsh3xTIQY=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by DS0PR12MB9324.namprd12.prod.outlook.com (2603:10b6:8:1b6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 19:56:19 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%4]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 19:56:18 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Lazar, Lijo" <Lijo.Lazar@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "McRae, Geoffrey" <Geoffrey.McRae@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for unsupported IOCTLs
Thread-Topic: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for unsupported IOCTLs
Thread-Index: AQHb77/tr0JuVvZNCUyuhhAzX4RdRbQnzKYAgAAkzYCAAGOm0IAA5vwAgAA+TACAAAY9AIArJPww
Date: Tue, 5 Aug 2025 19:56:18 +0000
Message-ID: <BL1PR12MB51449F87DEA24FCA2F225859F722A@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20250708042219.180109-1-geoffrey.mcrae@amd.com>
 <470a613e-d85d-4943-aa48-7590d84f7fd2@amd.com>
 <PH7PR12MB55958988869861DF44D3D007884EA@PH7PR12MB5595.namprd12.prod.outlook.com>
 <BL1PR12MB5144018C868ED8C6566B8B84F74EA@BL1PR12MB5144.namprd12.prod.outlook.com>
 <5878b6eb-7961-4ffb-aebd-601868163de6@amd.com>
 <103de0a1-22bd-4389-9f5b-c1283497387c@amd.com>
 <d9ccf4e8-afed-4206-8f5e-b9e2bc02dae0@amd.com>
In-Reply-To: <d9ccf4e8-afed-4206-8f5e-b9e2bc02dae0@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-05T19:53:13.0000000Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source; MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|DS0PR12MB9324:EE_
x-ms-office365-filtering-correlation-id: 7727ed89-813d-4cee-67d1-08ddd45a24dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UTVIQW5KSnpndkNZeTJPVitvNmJvTEJMYWMrODRuM3dJRDN1dW5DNlJlTjZ3?=
 =?utf-8?B?SHJrd0RFYUowWHNxTE9RL2JkbXZROWxLbGlIc0JiTGd5MUZvbmR3S0t6UUhK?=
 =?utf-8?B?dW1Bek1GT3VMK3cybjQ5MzJQY3RVTWRoQUtLY3JZZkVTdWFGcHZucnRCNXBG?=
 =?utf-8?B?T1J2NDh4cGpNSlRDVG9JY1IyNTUwcGZmbVh3YUhRd3JuczhhZkNaWURCZ3FW?=
 =?utf-8?B?bGhTeE9sTStmbnFoTEhqY1RFVUNpNDNNNE1ETlh6dll1TEJndEQwOWN4YkhS?=
 =?utf-8?B?VVJSR2lQTWROQ1R5U0RXaUhFSzlXNmlDYVRRMXVMaEhwSkg3RTNIUmlIemZ2?=
 =?utf-8?B?SHdmSm90YWcwYmlmcFVzYngzSG05WXN3dDdkeVJkSnhFdXNQTnk4cExDbEVp?=
 =?utf-8?B?UW1CYXJ4TFg0KzZJN1hpd3Iza1RlK2d0dXlFdW9UeEVLZ3VGZC94N1YwM2pU?=
 =?utf-8?B?eldLWGcxK0tOZGpvdDVXbnc2cW5lZE9YaDl2bXMwY2JFOThBNWMzSkx3YlZU?=
 =?utf-8?B?Unp3SFNJdDM5dTh2YnVDTXFhc01EN2tuSjNhaFIzWE4xWHIyS3c1Vi84SHRu?=
 =?utf-8?B?MlE1WS9Pcm92bWxCMlluaXVsdWZ1R2ZCcitub3JwNVRwUnZRaUhkTmI3bFlj?=
 =?utf-8?B?Z3dOSVU4NUFkWmhid0lYMENBNzNxckU4bkFBREJYa3N1amF0cWt5d3JxVnNh?=
 =?utf-8?B?UEhYaHV2MURSaVR5MHVsR2szckV6Tm55OWxNUUw0eS9DeXRSTWp6Yk11VWhL?=
 =?utf-8?B?eU96RlQ2SCtVMzhHOWNsWVJySHZxNUp3Z0pvUlhJbG52T0tPelVsYjFZSzQz?=
 =?utf-8?B?VVpBRHNiblBqQ0E2V2pkMmxPWDdwbllIbTN2THlzTVZudVpnQndTQ2dNRllo?=
 =?utf-8?B?OVFYdGJIZldka1c0dE5RbVZ2azV6SW4yM1I3UHFJd3FqdjZkazIzT0JDQTU3?=
 =?utf-8?B?WElkT25UNG01cE92eU13TXI0M0l1OGR3enVTVWVBd0haRXlON1llWXI1MWlJ?=
 =?utf-8?B?QkozSEZ4QU9HdjJDcXMrSFRIRmkvNGJNZ29IUVh6VTFVTmpjeXRXVTNGb2NY?=
 =?utf-8?B?OFp3V1FyTndDT0FXMFZZSnJCZWRHbjVEcVdPRDIzZHdtQ29LckNtVUM0eTJL?=
 =?utf-8?B?bktPcloxdjJsNHhkOFM5Y2FlUXUzMmRuUHBPRkd0NUNxL2pxc0gzWmhNeHJJ?=
 =?utf-8?B?dyt4U0dXZmRBcmVSTmt6TGdXSjh1RVpGdWh0VWhiT01qSDhmR1FCNjRkejdN?=
 =?utf-8?B?VlNMd01mdDB6dVNWeXEyV3hoTGc4S0V0WlNXZ1BSYU43a0V5OUVaa2RmSThK?=
 =?utf-8?B?MDlIbGNOYlR2bDhPTk9GRDBWOUFXQTVVNytmVC9OWjYrQ0VJRHd1QnllMnFo?=
 =?utf-8?B?MzNBTFFtVFNXdDl2dzJIMUpEUWhyRjRZbXorVEFuQU9oNmRqMSt3bkg4eEJD?=
 =?utf-8?B?emF5Vi9PYU1wTFBPRWZnb2RxUVg1MW1MREt5cHA2NjFub3hPNDd1RWZHaTI5?=
 =?utf-8?B?RFhWakhERk10K2ZVVHorWFQwQmw1SUtHNkU2YnhHeWQxZ1VwOWFEbHBhOWVJ?=
 =?utf-8?B?L1Jwc2FPSS9HS0xIWXo4R0hFa1hYT0lWNVFiL2V5TERhL3htWHoxS0J0RGpz?=
 =?utf-8?B?ZnJoOHY4cGl3NHd6SlZRRVlNd0l5bENXdkJQKzg5UDlrVm5WaGNnWHR0cDRK?=
 =?utf-8?B?aG1hMzcrR1N2SnY0TnlyWXVBcGRCdEV1L0R3R3FGaitkWnQrOUh3cHVFbFFx?=
 =?utf-8?B?cW9MQmhZMURLc0ZwOVpKbHpoSS92M056Mnl5TmF2czEvbFVWQnJzZThhVm13?=
 =?utf-8?B?R3A0Z1dtZ1kvWFVGM3hsQXBrTjJuSStOM2RtTlNlRkp0Z0l5eG9ROGhMMkZH?=
 =?utf-8?B?enlNcHlNQUZ1dDhIa3pmVEo4UGJqc21rSHFLWlM5anlJNytVWlZGcFNWQU90?=
 =?utf-8?Q?O3Ab+3IP4sk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFlMNnVxWFV2dnNLSjRGUUw4cWpNdWl1K2F4M1VwUVVTTTNvblNYa2ZtYlpz?=
 =?utf-8?B?VnRxT2l6emJIZC8yQXByTzJWSDhrc2JXZnYvTnNGU0tzZGZ1Y2xEL1MzRi9s?=
 =?utf-8?B?QkFRb2NQYmV0QkpMYjZaYTJlVmxSRk5NTk1vaHhNcjhyTjNEMnFFalhVVk1S?=
 =?utf-8?B?S2ZtTjdzVnEzRGxmS25QbXlqcTg2WVRhejZxaTUvQ3NVaEtnaEcxTXNEbjZ0?=
 =?utf-8?B?ME1Hd2ZEbzFFZkh3clNKTWtwYzBPaEI3RkFiS1RROVFDd1lTQ2VVR1E0RVM0?=
 =?utf-8?B?TnNKTlhpQlA1dSs4cjgwVW9Tdms1Y1B3RXllR1FYK3U1UjlLbDdlMTF3UUZs?=
 =?utf-8?B?d2tZbSs2SmNSTGR6Z3hvZ3kvQmF1VFllZkV0OWJJTDZKQi9zSXJvZ0ErUjQ2?=
 =?utf-8?B?NTV4YkpRNTQwMHNEeXNIL3dJenBHakxhUWxOczNXTUxqNTNNZGIvd3Fua0pF?=
 =?utf-8?B?bVRMcVJ1dmVocHpFN1VIR0RLWlhRZmQ2Tng0aVd2SHAzVWFkMkQxc1M0YUJT?=
 =?utf-8?B?KzJvanI0bm81VENkdXV4TDhsRU96bmNWMXE1QnNSTEZIcE1MVzREVmRUQjlX?=
 =?utf-8?B?bGdGZXdSdUxtYXRBNDVzcENOMmJSRmI0aWhZbHI2aU1JQlNKaUFrY24venhX?=
 =?utf-8?B?WUV2V2VVc3NFQlBpeit1cEVlVTI1OVluVmJnSTI0ZEVIT3k0Ulcvb2Q2NU1K?=
 =?utf-8?B?dzc1YTZ6dXFnL2lMRUZKaUlNK2hJRkhCQThQWkduRXUyMW9OaWt4dkQ1bDAy?=
 =?utf-8?B?a0Jpd28xTWFvT21TU0xzb3oySHEzQ0hnMmtZNnJPaVdMUWVWMzZIQ2tHOEdn?=
 =?utf-8?B?TVlydDNoY1ZTWGlHM3NlS0kvUUdQZmZvSTNOeXgrOXRTYUozcUg3c1hwWURr?=
 =?utf-8?B?aDBzcFhpNEFwUVRRRVJVd09HSnNiR2hyNzVyTldWTjJyd0FUeWlhZGc3ODU5?=
 =?utf-8?B?Y3NFdUg1ZUZ2Vy9hRTQ4a2xxVlo0dlJGUHJUZUdqYTRuQ0lxdUUxWWZCYkR1?=
 =?utf-8?B?bEh2RHFyYXc2aFJLR1k1WVlTR1pIUUlTNUx0d1FIMXFNZEI0N3RRb1MxZ1hp?=
 =?utf-8?B?Qkh4VU5BSzFYaHRTS1dsS3ZveDcvcWVLQjQwQ3RtU0xEM0lobGZaa3ZYaHBF?=
 =?utf-8?B?Vlo4WWZRcUhSYTY5dmNqWGkvcEp3OXVjOVRBZGVraWZ4dXVtbktrME0vb2My?=
 =?utf-8?B?blpab3JtS0tVeHVSc2VubUppaDdlMFA1SmEvcDAzOWlIWTZmeFg5MEpVT2JC?=
 =?utf-8?B?UTZ5TVBJcVpkd0NUY2RLU2NWVmxCWlpJV3lzNGFhaDlFK2gwNXRLZGl3eURX?=
 =?utf-8?B?SzBjQ1NiSllZR0lid2llSGZaWksrWGxvSW5sSGlXdlU2QlQ2cHRiclhFeG4y?=
 =?utf-8?B?UCs0Y0VmTlVQbzNoNkFLcDl4a3hJcWlrMHM5U2RrbGxic09rbXJhMTUreHox?=
 =?utf-8?B?TEo0OUhHalRNTkh3bm5mS1oxcFZEcm1vN2xROW9CTXpNczFlaXdBaDY5dTdI?=
 =?utf-8?B?b3lsQTJJQmtzRW94WE90TTFOc2JMbzYzRlBwYkE4MzQ0WDF2T214WGRqdkpW?=
 =?utf-8?B?djhFRTcyQ1M2MWZsNDJGS1BqMTJLWHJ5WENBMmErRlBwTnhXdDlsaUdqaVE0?=
 =?utf-8?B?U2ZSaG5GaHR1MlNPd0g3UzYzYkh6N1FnRFFqVTY2NnlaeW1LNG8zOWxVL29F?=
 =?utf-8?B?d1gwQzJWbVFMcHJRUGViZzZMY2tCMjhFL1JlaG83bVIxbXZYWi9qeXdCQmNn?=
 =?utf-8?B?YXZ0U1BhTzlCcEdwbXBFZzF0UXJZMm9QeS9KOE5obit6UW12M0JhVExSRmI3?=
 =?utf-8?B?OUlWQnUvNkJCQVlmZ2NCVWdiTEJjZ0U5SHc1NWhQYzdVSWt5ZGNxOFZXcHdR?=
 =?utf-8?B?WEppKzlVRGV5TWpRZytoc09BVm95aW1aendFekRiVjlkTk9hNUZlakdnanBO?=
 =?utf-8?B?N1J2R2lFVWR0dGJmdDR3VkFyWllROFFIcGFXN0VnK0RxSml2L0QzYTlKamRE?=
 =?utf-8?B?UEIwcG5CVndCSWZLK0JMSjl3WmZmeTZEZkJHdHZhcVRmd1dVL0UzeEFCNUVh?=
 =?utf-8?B?dU1HS1NIWUdLckVEMm0yUTBORjNtVWpaUVRkeGlVM0N3bEdOMXF2TVAyNEtm?=
 =?utf-8?Q?DPL4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7727ed89-813d-4cee-67d1-08ddd45a24dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2025 19:56:18.6575 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T0GE+cniFpgev+F0Skj1uolij+yb13nLy7ei3tCk4naDepVO/g+tLhUarXJwKkFlrc0ppaRJW14OtlSdIc2H/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9324
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

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXphciwg
TGlqbyA8TGlqby5MYXphckBhbWQuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bHkgOSwgMjAy
NSA1OjAyIEFNDQo+IFRvOiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQu
Y29tPjsgRGV1Y2hlciwgQWxleGFuZGVyDQo+IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsg
TWNSYWUsIEdlb2ZmcmV5DQo+IDxHZW9mZnJleS5NY1JhZUBhbWQuY29tPjsgS3VlaGxpbmcsIEZl
bGl4IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2MiAxLzFdIGRybS9hbWRrZmQ6IHJldHVybiAtRU5PVFRZIGZvciB1bnN1cHBvcnRl
ZA0KPiBJT0NUTHMNCj4NCj4NCj4NCj4gT24gNy85LzIwMjUgMjowOSBQTSwgQ2hyaXN0aWFuIEvD
tm5pZyB3cm90ZToNCj4gPiBPbiAwOS4wNy4yNSAwNjo1NiwgTGF6YXIsIExpam8gd3JvdGU6DQo+
ID4+IE9uIDcvOC8yMDI1IDg6NDAgUE0sIERldWNoZXIsIEFsZXhhbmRlciB3cm90ZToNCj4gPj4+
IFtQdWJsaWNdDQo+ID4+Pg0KPiA+Pj4NCj4gPj4+IEkgc2VlbSB0byByZWNhbGwgLUVOT1RTVVBQ
IGJlaW5nIGZyb3duZWQgdXBvbiBmb3IgSU9DVExzLg0KPiA+Pj4NCj4gPj4+DQo+ID4+IEdvaW5n
IGJ5IGRvY3VtZW50YXRpb24gLQ0KPiA+PiBodHRwczovL2RyaS5mcmVlZGVza3RvcC5vcmcvZG9j
cy9kcm0vZ3B1L2RybS11YXBpLmh0bWwNCj4gPj4NCj4gPg0KPiA+IEdvb2QgcG9pbnQuDQo+ID4N
Cj4gPj4gRU9QTk9UU1VQUDoNCj4gPj4gRmVhdHVyZSAobGlrZSBQUklNRSwgbW9kZXNldHRpbmcs
IEdFTSkgaXMgbm90IHN1cHBvcnRlZCBieSB0aGUgZHJpdmVyLg0KPiA+Pg0KPiA+PiAiTm90ZSB0
aGF0IEVOT1RUWSBoYXMgdGhlIHNsaWdodGx5IHVuaW50dWl0aXZlIG1lYW5pbmcgb2Yg4oCcdGhp
cyBJT0NUTA0KPiA+PiBkb2VzIG5vdCBleGlzdOKAnSwgYW5kIGlzIHVzZWQgZXhhY3RseSBhcyBz
dWNoIGluIERSTSINCj4gPj4NCj4gPj4gU2luY2UgS0ZEIGlvY3RscyBjb3VsZCBldmVudHVhbGx5
IGJlIHN1cHBvcnRlZCBpbiBkcm0gbm9kZSwNCj4gPg0KPiA+IFRoYXQncyBjZXJ0YWlubHkgbm90
IGdvaW5nIHRvIGhhcHBlbi4NCj4gPg0KPiA+IFdlIGFyZSBjdXJyZW50bHkgaW4gdGhlIHByb2Nl
c3Mgb2YgZGVwcmVjYXRpbmcgdGhlIEtGRCBJT0NUTHMgYW5kIGVpdGhlciB1c2luZw0KPiB0aGUg
ZXhpc3RpbmcgRFJNIHJlbmRlciBub2RlIG9uZXMgb3IgY29taW5nIHVwIHdpdGggbmV3IElPQ1RM
L2FkZGl0aW9ucyB0byB0aGUNCj4gZXhpc3Rpbmcgb25lcy4NCj4gPg0KPg0KPiBJIHJlYWxseSBt
ZWFudCB0byBjb252ZXkgdGhpcyB0byBqdXN0aWZ5IHVzaW5nIGRybSBkb2N1bWVudGF0aW9uIGFz
IHRoZSBiYWNrZ3JvdW5kDQo+IGZvciBwaWNraW5nIGVycm9yIGNvZGVzIGZvciBLRkQgb25lcyBh
bHNvLiBBdCBsZWFzdCBmb3IgYW55IG5ldyBlcnJvciBjb2RlIHJldHVybnMsDQo+IGRlZmluaXRp
b25zIHdpbGwgcmVtYWluIGNvbnNpc3RlbnQgYWNyb3NzIGJvdGguDQoNCkluIHRoaXMgY2FzZSwg
SSB0aGluayAtRU5PVFRZIG1ha2VzIHNlbnNlIHBlciB0aGUgZG9jdW1lbnRhdGlvbi4gIFBhdGNo
IGlzOg0KQWNrZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4N
Cg0KDQo+DQo+IFRoYW5rcywNCj4gTGlqbw0KPg0KPiA+IEJhY2tncm91bmQgaXMgdGhhdCBzb21l
IG9mIHRoZSBLRkQgSU9DVExzIGhhdmUgZGVzaWduIGZsYXdzIHdoaWNoIGFyZSB1bmZpeA0KPiBh
YmxlLg0KPiA+DQo+ID4gUmVnYXJkcywNCj4gPiBDaHJpc3RpYW4uDQo+ID4NCj4gPj4gaXQgc2Vl
bXMNCj4gPj4gYmV0dGVyIHRvIGdvIHdpdGggRU5PVFRZLg0KPiA+Pg0KPiA+PiBUaGFua3MsDQo+
ID4+IExpam8NCj4gPj4NCj4gPj4+DQo+ID4+PiBBbGV4DQo+ID4+Pg0KPiA+Pj4NCj4gPj4+DQo+
ID4+PiAqRnJvbToqTWNSYWUsIEdlb2ZmcmV5IDxHZW9mZnJleS5NY1JhZUBhbWQuY29tPg0KPiA+
Pj4gKlNlbnQ6KiBUdWVzZGF5LCBKdWx5IDgsIDIwMjUgNToxMyBBTQ0KPiA+Pj4gKlRvOiogS29l
bmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IEt1ZWhsaW5nLCBGZWxp
eA0KPiA+Pj4gPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQo+ID4+PiAqQ2M6KiBEZXVjaGVyLCBB
bGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBhbWQtDQo+ID4+PiBnZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4+
PiAqU3ViamVjdDoqIFJlOiBbUEFUQ0ggdjIgMS8xXSBkcm0vYW1ka2ZkOiByZXR1cm4gLUVOT1RU
WSBmb3INCj4gPj4+IHVuc3VwcG9ydGVkIElPQ1RMcw0KPiA+Pj4NCj4gPj4+DQo+ID4+Pg0KPiA+
Pj4gW0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25s
eV0NCj4gPj4+DQo+ID4+Pg0KPiA+Pj4NCj4gPj4+IEkgYW0gaGFwcHkgdG8gdXNlIEVPUE5PVFNV
UFAgYnV0IEkgbXVzdCBwb2ludCBvdXQgdGhhdCB0aGlzIGlzIG5vdA0KPiA+Pj4gdGhlIHBhdHRl
cm4gdXNlZCBhY3Jvc3MgdGhlIGtlcm5lbCwgdGhlIHN0YW5kYXJkIGlzIHRvIHVzZSBFTk9UVFks
DQo+ID4+PiB3aGljaCBpcyBhbHNvIHRoZSBkZWZhdWx0IHRoYXQgZnMvaW9jdGwuYyByZXR1cm5z
IHdoZW4gbm8gaGFuZGxlciBpcyBwcmVzZW50Lg0KPiA+Pj4gVXNlcnNwYWNlIHRvb2xpbmcgc3Vj
aCBhcyBzdHJhY2UgYW5kIGdsaWJjIHNwZWNpZmljYWxseSBleHBlY3RlY3QNCj4gPj4+IEVOT1RU
WSB0byBpbmRpY2F0ZSBpbnZhbGlkIG9yIHVuc3VwcG9ydGVkIElPQ1RMLg0KPiA+Pj4NCj4gPj4+
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo+ID4+PiAtLS0tDQo+ID4+Pg0KPiA+Pj4gKkZyb206KktvZW5pZywgQ2hy
aXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20NCj4gPj4+IDxtYWlsdG86Q2hyaXN0aWFu
LktvZW5pZ0BhbWQuY29tPj4NCj4gPj4+ICpTZW50OiogVHVlc2RheSwgOCBKdWx5IDIwMjUgNTow
MSBQTQ0KPiA+Pj4gKlRvOiogTWNSYWUsIEdlb2ZmcmV5IDxHZW9mZnJleS5NY1JhZUBhbWQuY29t
DQo+ID4+PiA8bWFpbHRvOkdlb2ZmcmV5Lk1jUmFlQGFtZC5jb20+PjsgS3VlaGxpbmcsIEZlbGl4
DQo+ID4+PiA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbSA8bWFpbHRvOkZlbGl4Lkt1ZWhsaW5nQGFt
ZC5jb20+Pg0KPiA+Pj4gKkNjOiogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hl
ckBhbWQuY29tDQo+ID4+PiA8bWFpbHRvOkFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+PjsgYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPj4+IDxtYWlsdG86YW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc+DQo+ID4+PiA8YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
Pj4+IDxtYWlsdG86YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+PjsNCj4gPj4+IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPj4+IDxtYWlsdG86ZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gPGRyaS0NCj4gPj4+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPiA+Pj4gPG1haWx0bzpkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPj4NCj4gPj4+
ICpTdWJqZWN0OiogUmU6IFtQQVRDSCB2MiAxLzFdIGRybS9hbWRrZmQ6IHJldHVybiAtRU5PVFRZ
IGZvcg0KPiA+Pj4gdW5zdXBwb3J0ZWQgSU9DVExzDQo+ID4+Pg0KPiA+Pj4NCj4gPj4+DQo+ID4+
PiBPbiAwOC4wNy4yNSAwNjoyMiwgR2VvZmZyZXkgTWNSYWUgd3JvdGU6DQo+ID4+Pj4gU29tZSBr
ZmQgaW9jdGxzIG1heSBub3QgYmUgYXZhaWxhYmxlIGRlcGVuZGluZyBvbiB0aGUga2VybmVsDQo+
ID4+Pj4gdmVyc2lvbiB0aGUgdXNlciBpcyBydW5uaW5nLCBhcyBzdWNoIHdlIG5lZWQgdG8gcmVw
b3J0IC1FTk9UVFkgc28NCj4gPj4+PiB1c2VybGFuZCBjYW4gZGV0ZXJtaW5lIHRoZSBjYXVzZSBv
ZiB0aGUgaW9jdGwgZmFpbHVyZS4NCj4gPj4+DQo+ID4+PiBJbiBnZW5lcmFsIHNvdW5kcyBsaWtl
IGEgZ29vZCBpZGVhLCBidXQgRU5PVFRZIGlzIHBvdGVudGlhbGx5IGEgYml0DQo+ID4+PiBtaXNs
ZWFkaW5nLg0KPiA+Pj4NCj4gPj4+IFdlIHVzdWFsbHkgdXNlIEVPUE5PVFNVUFAgZm9yIHRoYXQg
ZXZlbiBpZiBpdHMgbm90IHRoZSBvcmlnaW5hbA0KPiA+Pj4gbWVhbmluZyBvZiB0aGF0IGVycm9y
IGNvZGUuDQo+ID4+Pg0KPiA+Pj4gUmVnYXJkcywNCj4gPj4+IENocmlzdGlhbi4NCj4gPj4+DQo+
ID4+Pj4NCj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBHZW9mZnJleSBNY1JhZSA8Z2VvZmZyZXkubWNy
YWVAYW1kLmNvbQ0KPiA+Pj4+IDxtYWlsdG86Z2VvZmZyZXkubWNyYWVAYW1kLmNvbT4+DQo+ID4+
Pj4gLS0tDQo+ID4+Pj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5j
IHwgOCArKysrKystLQ0KPiA+Pj4+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkNCj4gPj4+Pg0KPiA+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jDQo+ID4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfY2hhcmRldi5jDQo+ID4+Pj4gaW5kZXggYTIxNDlhZmE1ODAzLi4zNjM5NmI3
MzE4ZTcgMTAwNjQ0DQo+ID4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2NoYXJkZXYuYw0KPiA+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9j
aGFyZGV2LmMNCj4gPj4+PiBAQCAtMzI1Myw4ICszMjUzLDEwIEBAIHN0YXRpYyBsb25nIGtmZF9p
b2N0bChzdHJ1Y3QgZmlsZSAqZmlsZXAsDQo+ID4+Pj4gdW5zaWduZWQgaW50IGNtZCwgdW5zaWdu
ZWQgbG9uZyBhcmcpDQo+ID4+Pj4gICAgICAgICBpbnQgcmV0Y29kZSA9IC1FSU5WQUw7DQo+ID4+
Pj4gICAgICAgICBib29sIHB0cmFjZV9hdHRhY2hlZCA9IGZhbHNlOw0KPiA+Pj4+DQo+ID4+Pj4g
LSAgICAgaWYgKG5yID49IEFNREtGRF9DT1JFX0lPQ1RMX0NPVU5UKQ0KPiA+Pj4+ICsgICAgIGlm
IChuciA+PSBBTURLRkRfQ09SRV9JT0NUTF9DT1VOVCkgew0KPiA+Pj4+ICsgICAgICAgICAgICAg
cmV0Y29kZSA9IC1FTk9UVFk7DQo+ID4+Pj4gICAgICAgICAgICAgICAgIGdvdG8gZXJyX2kxOw0K
PiA+Pj4+ICsgICAgIH0NCj4gPj4+Pg0KPiA+Pj4+ICAgICAgICAgaWYgKChuciA+PSBBTURLRkRf
Q09NTUFORF9TVEFSVCkgJiYgKG5yIDwNCj4gPj4+PiBBTURLRkRfQ09NTUFORF9FTkQpKSB7DQo+
ID4+Pj4gICAgICAgICAgICAgICAgIHUzMiBhbWRrZmRfc2l6ZTsNCj4gPj4+PiBAQCAtMzI2Nyw4
ICszMjY5LDEwIEBAIHN0YXRpYyBsb25nIGtmZF9pb2N0bChzdHJ1Y3QgZmlsZSAqZmlsZXAsDQo+
ID4+Pj4gdW5zaWduZWQgaW50IGNtZCwgdW5zaWduZWQgbG9uZyBhcmcpDQo+ID4+Pj4gICAgICAg
ICAgICAgICAgICAgICAgICAgYXNpemUgPSBhbWRrZmRfc2l6ZTsNCj4gPj4+Pg0KPiA+Pj4+ICAg
ICAgICAgICAgICAgICBjbWQgPSBpb2N0bC0+Y21kOw0KPiA+Pj4+IC0gICAgIH0gZWxzZQ0KPiA+
Pj4+ICsgICAgIH0gZWxzZSB7DQo+ID4+Pj4gKyAgICAgICAgICAgICByZXRjb2RlID0gLUVOT1RU
WTsNCj4gPj4+PiAgICAgICAgICAgICAgICAgZ290byBlcnJfaTE7DQo+ID4+Pj4gKyAgICAgfQ0K
PiA+Pj4+DQo+ID4+Pj4gICAgICAgICBkZXZfZGJnKGtmZF9kZXZpY2UsICJpb2N0bCBjbWQgMHgl
eCAoIzB4JXgpLCBhcmcgMHglbHhcbiIsDQo+ID4+Pj4gY21kLCBuciwgYXJnKTsNCj4gPj4+Pg0K
PiA+Pj4NCj4gPj4NCj4gPg0KDQo=
