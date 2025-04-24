Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8FCA9A074
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 07:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB17110E433;
	Thu, 24 Apr 2025 05:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nG4cjSD4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAF710E433
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 05:34:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zb3sh4rksBLc/aVb4kMkBC/ZZNZkvF56704YfIN6pw2QN+wpo783UFdRMed3/xQKKO3s7Rcpz97fH2lHT7GEfQ7KMO6hpOm+kvZrbdCJmDgYq1KIlHLj6fh+N5+v9QOW7apVFiqCSXnejH4yUuGzQXQwXExe5gCUyCCGan6wGCJ786WsD/Yn86nCUbs6cI1TQf1feXYY3P3Og0gFa2NRE68tGwUgg8KXkYlu7LBXctCy9whDt9NiDxyvPUuHKWlKmIlbRZO+KCN/S4RpQZnLsgMRAcqQXEkxixXBN1sFuaT9OEd7i9zxzcuLJCMLwZ43+cRJaartthiY/KGzATTlgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcDv8IVdYWQSUjH/18yJAkZ9EnXS3VWf9nITU92MLGA=;
 b=C45DD7q8JnrupMXvrnNXxxqtpIC5Q4T6DShhxa+uMs7krhQmAIzYvI19ceJyCppYo715hgTNJgHNdcl303nlXshK4xEZVB19Vt7P88HWXbtiD5Yi+NJ0lKmrtQCiYLY09fnlLkO9Kr5HoC/T4SHx3xlOUhDFdo36h+oqcTucXANOaOzO2DIxYzJSMixY8J4yKfO6ftPjLPpDExatzAun6lfzFX/CRXFhzIGjLw6nXzPmQqaDJ8dKiOF7El3zv6J1b5DPi6hpC4xTn5PRRPdl3ov2r16cASlbR9ibOlaUDGCkpb2htBgxGDo/AFlDgJeZzfCQljV4L2QyjFl7C5ymNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcDv8IVdYWQSUjH/18yJAkZ9EnXS3VWf9nITU92MLGA=;
 b=nG4cjSD46SYxIptZc0wdELDbj81lOz2U5cne6zaF3T32tiN6MWT6ZrtJuSHh83nyp9Cte/3Gg45gSIT4876ssEsdyHwJ0uGn0wq/A28egFwnxzF6qHgPxaoKzIeVle0EmsDDWNUuQ61xu/jvrQBq6rz+tVypTL4CPYPAIceNDSw=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by MW4PR12MB6899.namprd12.prod.outlook.com (2603:10b6:303:208::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Thu, 24 Apr
 2025 05:34:18 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282%2]) with mapi id 15.20.8655.033; Thu, 24 Apr 2025
 05:34:18 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>, "Limonciello, Mario"
 <Mario.Limonciello@amd.com>, "Wentland, Harry" <Harry.Wentland@amd.com>
Subject: RE: [PATCH 0/2] Fix I2C-Over-AUX handling
Thread-Topic: [PATCH 0/2] Fix I2C-Over-AUX handling
Thread-Index: AQHbtMYRCy2Mbc1Ts0OHUrFVknlwfLOySjoQ
Date: Thu, 24 Apr 2025 05:34:17 +0000
Message-ID: <CO6PR12MB5489FB836017EAFADE38457FFC852@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20250424030734.873693-1-Wayne.Lin@amd.com>
In-Reply-To: <20250424030734.873693-1-Wayne.Lin@amd.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=a3d67b04-8dc7-46e6-92d8-fce8b6bfa444;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-04-24T05:29:59Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10, 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|MW4PR12MB6899:EE_
x-ms-office365-filtering-correlation-id: 1dfe5902-774b-4410-1420-08dd82f1a85a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?bGRIWXJTY0FDTjYwNXdjcmpmd3BmMDJUbDdVTG9UVHVqcVA5MnBJQXMzeXIr?=
 =?utf-8?B?cDFQWWlPUUhlUEd6aEF0V0U4bTUvYnNydzBlMUV3N3QrVWpXMlY5aW5QS1Jz?=
 =?utf-8?B?STBpY3N4bDlUaEF1TGZWNnVRNHUrWWxJVnE5Rk5XSkZ5ZzQ4amtZOVBBRzZS?=
 =?utf-8?B?RnRta3Vxa0h4S0dBNGFWSEJYMFVtUzM3MUc5YUkydm5BZGJDRG43K1B3SzVq?=
 =?utf-8?B?dFFDY3lIK204aHFDa0VCSlg0SWJvZlBZRGZlRkVpOUxiN1QzK0U2bDFxbkF6?=
 =?utf-8?B?bWZhVUlHZkVwUFZKb0x5T1dMQi9nSk1iUlUyTy9TUzVXYy9nMitWc3kwYTBP?=
 =?utf-8?B?K0l0b0dNZUFwVXZQSW9Vb2pPa3lWVTF0cmVtelFOL2syeDcwUTlTcnhDY21Y?=
 =?utf-8?B?cm10ZllLYkZhaktWRzZKdHd0bHVLSjdEQmszVEZpeVBQMFRkb1h1d1U5Tit6?=
 =?utf-8?B?enhuMUM0SnBXa0RHNGt0b0NyZDJ5eHorNWpLV1Y0TVl3VzBkcWgyWC92dXFl?=
 =?utf-8?B?djF2Y1ZjdXphK0ZDWHBxUndzN09weVFlZkhyaVNtRDZLNitkSDVCMEdVLzBW?=
 =?utf-8?B?a1dzS1Q0cEtlNXV5azZWdks5YlkxSzNLNzFVbGl3ZGhFWmdSZlNYc3ZGU3lz?=
 =?utf-8?B?V0p3bUdvcWVtU1BuZFJpbG93ekNXRlZDc2llZ3Z2SlZpQmxQT1F5REFsTzlp?=
 =?utf-8?B?elVXWTNZUmZRQk5TMEhpMW5paDVEVHFLTDRpTDFYa2ZSekZiMldrQmNVMkRF?=
 =?utf-8?B?TldEaW5ic3dMeG9hYjk1UEMrbW9DNCt3N1NJc1hBa1JVcm9KcUhNb3BhYzJq?=
 =?utf-8?B?eVpQRU9ma2wvN29PY0tWanpWdlVFdTdSQ1RIS1JOUmdYdFJIY0VLWXhMVzlu?=
 =?utf-8?B?Q2dxajQwMlRqOGRNbTRsMlhZc2FIT1dVVzUzbWQ3dWdRYzMzTWNUN1k4U2Rp?=
 =?utf-8?B?QVp6SU5BZ1FxK1FBZDFTRUhzRkVtZFVYc1pxWGlzSTd5cWN1a2NVZUs3OUwr?=
 =?utf-8?B?SUlFVGlTVFg4UjgrUUdpQlRMQW9JUTQreS9hNUEvVWRoVTNUbEs3aVFYbnY3?=
 =?utf-8?B?Y3hJcTVpd2NrQ0NxUU8vK2lsWURUNzJNZlJEcFcwc3M4K2pUTjZScDIxMVlL?=
 =?utf-8?B?WW5qVS9DbjJmOG1iNWlSbG1xaGI5M3I1QVRvaXhwaVQvczFodGk0WG11Y21L?=
 =?utf-8?B?ODI0SlFpTjQwMzFTODI1SVFQdzRNRjRNVVZsSGQ1MjJQSU9OT0R4VTlLNGh3?=
 =?utf-8?B?VDhhYkVickQwN1cyZzFKRy9lM1dJMi95TDdMYVpEaWtDMG9hYkZwZ0FQNUhm?=
 =?utf-8?B?dGZZNGhzQUVleXZ1aTJ6a1RKaVRkKzE5djNNTURoaDZnanRKSkw2bE9WcjJZ?=
 =?utf-8?B?UWNVbEgrYmNZYkZxVTJ5S1kvcHNTWFNTN1NzREN6UEpaNmNQM1FoZldVbTkz?=
 =?utf-8?B?N2cyc2tlS2lLTklxOGIrclR1cCtRYnVZM1QwTXVHSDhxWWdsTlBPcmhkcUIv?=
 =?utf-8?B?SE1RcUJoVkVFa09peFhwVi9hUnR4Z0s5L0FJQm05K3ZHbDg5RUhqWDByU2Jo?=
 =?utf-8?B?NXdSbkNxVVk5L01NTFdES2lSSDZJOU9jZk9nM1FETEpkd1JCMVFvaWpvUDJt?=
 =?utf-8?B?UW1NUy9Ick10K3pOcVQ1bUdWZDllSjJYdVJFMzhIVkhiNyt6ZEVqWGtrdU5y?=
 =?utf-8?B?VkhqdURIcGg3T1htM1Z1RmM1T2ZoWjRyMmJKbm0xYlhSQndnN0VDQ3dibUJa?=
 =?utf-8?B?cUNMU3V2NkF6M0JKdHRWQWxsYTRzNDlaZkhUTjJqM3VZWDBrckt1NitrNFpF?=
 =?utf-8?B?YUJPZEZtWjNZcVZvQS9zZzN3eHNpVU4xNUROazBReTFlV3dDQTIvaVVtL1dl?=
 =?utf-8?B?cm9QL1FwOVg0c0s5UlY1blFpcWdydHVwYmNBMzlyd29JSzFibzlFUk8wMXBO?=
 =?utf-8?B?bDI1ZTg1d2tMUXFqRTZZdWVRN25EdUU3dW9RVW9zL0N3aVZlRm5XV0VvYTUv?=
 =?utf-8?Q?SbK9ppQTUfgMKY+JPxD2K+57DMvpCw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3gvdnliKzV3akt0NG9GTUZuMWRPRWZwMk5XbkQyYWpzYzNpbnBDRm9oNFdQ?=
 =?utf-8?B?ZlMvRHgrQm42VklVUFVQdk4rSlZiNngvaTA2eFV1Sjl5MnNXeGxDTUxQNWNR?=
 =?utf-8?B?aHJxRUd2Mjlhcms0bk5QdDlIcjRVVDFweTdQTTF0VHZCNWxEbUpmR2FnVWwz?=
 =?utf-8?B?Y2cyNlc1QTZ6K1Flc2V1aE9KWUtEUjFjRjFhSmJoSE53bFBrNHQrOTVnRGxP?=
 =?utf-8?B?OEpoTmh3QlkrekVXM3BnUTdDSUxqb1BMQi9JYnBZU3hRRXhlSUQvTTVuQURF?=
 =?utf-8?B?TmZicE9JbDRkVTNTYlhhYkJ5Y2lpcEUvODZ5em9HUWdYMW04ZEEvNDQ4ZEI2?=
 =?utf-8?B?U2N1b0p0QXRMd0JqQzd0bTFycGN5WGZlZlRRcGdLeGUvZmw0VDFPUCs5R3Bh?=
 =?utf-8?B?WnZ0cmcrUEsxTTNQRXJhdEhXZVE3Wll2K3RIUDVxVVFNakpSS20wZW5vb2Nq?=
 =?utf-8?B?VnpoOWE3N25CRGZnOWhtbUNJdFhBdGg5WUo5Nk9oWlY4N0E2YVFlVkMvZ0VS?=
 =?utf-8?B?Z3p5SHVBdkRGckZDcXNkQi9vdUpyZEJ4dlNoclIyamtsYi9tVW1Gc2Q0QjBC?=
 =?utf-8?B?YVVHZDQ0OU5Fekh4Y2JDbWlKSzFqY3NWanFXRnA3UEY2Tm9rd1FsblhEUkhj?=
 =?utf-8?B?UHFNOUYzeWMyUWY3U3ZFZ3hrNVZsNTM4NVFZMnluOExtbFdHSk9WelBEM3My?=
 =?utf-8?B?T0hjVTlkS2pvS2huTkFtRDdzenVJZWJUVEM4TTJNQzhSNEltRU9JTDJ6eUZv?=
 =?utf-8?B?TjBsVUVTRnU0RzRWSTE0TmFRbWVrTHVhaTg5Tm5tR0dPUlplQVZISGZMSXV3?=
 =?utf-8?B?Yy9uTkhCVkJqazJ3Zklia2F6ejlOcnpuUDZpang3MElhOTIxZUc0U0VoMXlC?=
 =?utf-8?B?WkY3aHkvYlovYmxvcERqdEhsV2Q4QTB0ZUNUeDNVOHB6bUQxL3FOcU9ueGdY?=
 =?utf-8?B?TDc1dzVaMVhReUZkUGpQN1FmVjlxeUN0eUdlQkVhQzNndnNPcGFjazdPaG9L?=
 =?utf-8?B?MmxCeXB1cy9UWWZ2dFdBbHNkbkR0UmQ2VVRpNU1NbzNKTkFRblRqdnFSRm9P?=
 =?utf-8?B?MC81N210c1FjT212WVZIVVlIaVYrUm16SDZIZ1JtV2RNTkNuSVZMYUNRSmg2?=
 =?utf-8?B?S082SHVNQUpnNHBDajJCNHJ2d1JyWjNBbVNrSEIrSVhRU29iZHgyT1ZXdzZt?=
 =?utf-8?B?d2RLM2F3alVSVWdhdnJ6WDQvQzF3MUlTWEJmNE8xMXBwbWFvdTZqRUl1cmpM?=
 =?utf-8?B?bUlCa0doNG11UllqNlV0SnNkT0JjNkd5QTArb1hTV2k3YjNGVjF2NTZydVJr?=
 =?utf-8?B?NjRkYW01QVZYTnJvdUpobUd2d21ndUdxSE0wMlpJdzhXc2dKTjU2ZGdVelBt?=
 =?utf-8?B?aUtQbk5oQ3hIMmNiMldMVmlQQ1kwZTB6ZTRaUHMxdE9tNlpJVCtpWC9UZWE2?=
 =?utf-8?B?YXFkUzMwUmNmQmgxNDhVVFpMK0VjeHphWDdKZnRtWTd5T3dacnRsUVJIYzdX?=
 =?utf-8?B?UC93Sjl2b1hwY0tXQ3JLbHh6dC94L0cyR1VaYmV5bjNENWpCTnRiMU5veTlO?=
 =?utf-8?B?VDdwaVFvVWd1M1B2SVdOLytScUlZTW5IbVNmbUNwYld2ZlIzaUtjK0FDWlg4?=
 =?utf-8?B?N3NWQmc3TVdYSkIyT3E2TFNvQXRWS0wwekFhc1Z6Tk41ZTdxbHRlRGVhRUlN?=
 =?utf-8?B?VGtVOGwxMUZWRVJwSHJ4YmxCUlFBNXgzZWlxSnRXUWVQVGVkemltd05pQ004?=
 =?utf-8?B?SG5LNzBoYU90WnE4Z2dQQ2JoZjdkbFkvMDM3aE5MRVptUjZ6eHQ3VUM5UXNJ?=
 =?utf-8?B?WGtsNzl1d2V5RzZYcFFWaUlEdEE5T3pKT0NVbjR6eEEzY3ZJendQOVNSa0FL?=
 =?utf-8?B?T2lnTTVzSm1PYlgvQW8xa0hkd0JJTE9HMU4yRjJ5Wi9nMzhJV3NRVm5sOVlo?=
 =?utf-8?B?aGQ5QXZLVTZESk03OERTUS84TzgxUUNKVmFxNWNtRVZKcFdIUnQ1cWNtSVZU?=
 =?utf-8?B?RTZFQ1FzTDAyeHlGN3RDenNIaVMrOHBpUnl1Q1N3bWFQT0FCYnAxd1luVkpV?=
 =?utf-8?B?QndWcW5uTjgrdUdid213eE8rSkJCS21Pbk9BUkJLSkRRcUZUUzBoVVJNQkc5?=
 =?utf-8?Q?T2qA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dfe5902-774b-4410-1420-08dd82f1a85a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 05:34:17.9484 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nXrnIK+HDOBkCBCMZ45Eob9oJKzu2syGyh5NMJhSNhQkeFg2b5aComDzKnkSxOhdfSXG2WrgVjUCRu9ZKDef/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6899
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

W1B1YmxpY10NCg0KU29ycnkgZm9yIHNwYW1taW5nLg0KUGxlYXNlIGlnbm9yZSB0aGlzIHBhdGNo
IHNldC4gSSBtaXNyZWFkIHRoZSBjb2RlIGZsb3cgaGVyZSBhIGJpdC4gV2lsbCByZWZpbmUgYW5v
dGhlciB2ZXJzaW9uIGxhdGVyIGlmIG5lZWRlZC4NCg0KVGhhbmtzIQ0KDQpSZWdhcmRzLA0KV2F5
bmUNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBXYXluZSBMaW4gPFdh
eW5lLkxpbkBhbWQuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgQXByaWwgMjQsIDIwMjUgMTE6MDgg
QU0NCj4gVG86IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tOyBqYW5pLm5pa3VsYUBpbnRlbC5jb207IExpbW9uY2llbGxv
LCBNYXJpbw0KPiA8TWFyaW8uTGltb25jaWVsbG9AYW1kLmNvbT47IFdlbnRsYW5kLCBIYXJyeSA8
SGFycnkuV2VudGxhbmRAYW1kLmNvbT47IExpbiwNCj4gV2F5bmUgPFdheW5lLkxpbkBhbWQuY29t
Pg0KPiBTdWJqZWN0OiBbUEFUQ0ggMC8yXSBGaXggSTJDLU92ZXItQVVYIGhhbmRsaW5nDQo+DQo+
IFRoZXNlIHR3byBwYXRjaGVzIGFyZSB0cnlpbmcgdG8gZml4IGhvdyB3ZSBoYW5kbGUgSTJDLU92
ZXJfQVVYIHRyYW5zYWN0aW9ucyB3aGVuDQo+IHNpbmsgc2lkZSBjYW4gb25seSBjb21wbHRlIHBh
cnRpYWwgZGF0YSBhdCBvbmUgdGltZS4NCj4NCj4gV2UgZW5jb3VudGVyIEVESUQgcmVhZGluZyBl
cnJvciB3aXRoIHNwZWNpZmljIG1vbml0b3IgYW5kIGNhdXNlIG1vZGUgbGlzdCBjYW4gb25seQ0K
PiBiZSBsb3dlciByZXNvbHV0aW9ucy4gQWZ0ZXIgYW5hbHlzaXMsIHRoZSBtb25pdG9yIHdpbGwg
cmVwbHkgSTJDX0FDS3xBVVhfQUNLDQo+IGZvbGxvd2VkIGJ5IGEgYnl0ZSBpbmRpY2F0aW5nIHRo
ZSByZWFkIGRhdGEgbGVuZ3RoIGZld2VyIHRoYW4gdGhlIHJlcXVlc3RlZCBvbmUuDQo+IFVuZGVy
IHRoaXMgY2FzZSwgd2Ugc2hvdWxkIHVwZGF0ZSB0aGUgcmVxdWVzdCBsZW5ndGggYW5kIHJlcXVl
c3QgYWdhaW4uIENvZGUgd2UNCj4gaGF2ZSB0b2RheSBkb2Vzbid0IGhhbmRsZSBzdWNoIGNhc2Uu
DQo+DQo+IE1lYW53aGlsZSwgaG93IHdlIGhhbmRsZSBXcml0ZV9TdGF0dXNfVXBkYXRlX1JlcXVl
c3QgZm9yIEkyQyB3cml0ZSBvdmVyIEFVWA0KPiB0cmFuc2FjdGlvbnMgc2VlbXMgd3JvbmcgYXMg
d2VsbC4gVGhlIHJlcXVlc3QgZm9ybWF0IHNob3VsZCBiZSBhZGRyZXNzIG9ubHkNCj4gdHJhbnNh
Y3Rpb24gd2l0aG91dCBsZW5ndGggYW5kIGRhdGEsIGFuZCB3ZSBkb24ndCByZWFsbHkgc2VuZCBp
dCBvdXQuDQo+IEZ1cnRoZXIgbW9yZSwgaXQgc2hvdWxkIGJlIGNvbnN0cmFpbmVkIGZvciBJMkMg
d3JpdGUgY2FzZSBvbmx5LiBOb3QgZm9yIEkyQyByZWFkDQo+IHJlcXVlc3QuDQo+DQo+IDFzdCBw
YXRjaCB0byBmaXggdGhlIEkyQyB3cml0ZSBwcm9ibGVtIGFuZCAybmQgb25lIHRvIGZpeCB0aGUg
STJDIHJlYWQuDQo+DQo+IC0tLQ0KPiBXYXluZSBMaW4gKDIpOg0KPiAgIGRybS9kcDogQ29ycmVj
dCBXcml0ZV9TdGF0dXNfVXBkYXRlX1JlcXVlc3QgaGFuZGxpbmcNCj4gICBkcm0vZHA6IEFkZCBo
YW5kbGluZyBmb3IgcGFydGlhbGx5IHJlYWQgdW5kZXIgSTItcmVhZEMtb3Zlci1BVVgNCj4NCj4g
IGRyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9kcF9oZWxwZXIuYyB8IDI4ICsrKysrKysrKysr
KysrKysrKysrKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQ0KPg0KPiAtLQ0KPiAyLjQzLjANCg0K
