Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2DC98E2DA
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 20:50:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B898210E227;
	Wed,  2 Oct 2024 18:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="H7rjfJkW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D41910E091;
 Wed,  2 Oct 2024 18:50:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UequFPs7Tn5Qwfb/kKnaSkHLl3x48MTW9GyLX5+EjTHd0ut3hylvQ1xAYixoSWNOxNVmMSAv/p8P3WoqaP/C4FM1KAb8u+kQB4TLZOFMyIATrnTNt8QqrnxmbDS4sPAmXmFRwVsnHtioeEhmCev/X4G6zl+eTLpDtHtk/V4DG0Y8f2RdRzOkF+E36+Si5iQBltkAYNj6JhSOY90O7NZqMFaQ16ckqEuEqAk1lE5vivLhCxdT5ApU49Mh1QAP+H1yeu8g1hJK/2joCcLBj4dxpkPTYg/UcyKtafktbmi/qDY5seamj7PkjYBsoK3/DFSwesoSlzAMVx9nZs7+ox5F8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/L7lfFeS8DrLKnP3vCVUaZm6SLPoTmqP5QJqwe407Vs=;
 b=x2VEk8QJqHjebOE4SIz1RJQN/q1ravcS54IgLitCm+QQr2PdipPRa1GOaNpeMNZh+zM95S6NmYTjKqgq2v0Wtx6nr0AByiqiC6IuJBsaDCOENl7EFOwJxkQPeUURvNkEIDY320/iCZFBQmQzyiob/eDq8ptW7Lz3mkOuHmnD7i6MBsakH4u5tHdDJ3tfWs4pMkKjPXtbzhx8BoioxKNjEE3Du6epaYmaeOsgwEtsl+gE2SDtqnS0A+aIjtEbrhZn4SchcFExHUbsq0A04mFFB8AJFqXX9741YqLq5OgAzmtFpmvb3Tl/7t+I9BzSxLj6Ukjo/Z0SgRiP/TBjo6k5Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/L7lfFeS8DrLKnP3vCVUaZm6SLPoTmqP5QJqwe407Vs=;
 b=H7rjfJkWyBpjvnbP4f+IYYOF1XosDxoVY7ldqvJRgXai8Ws91OOWV1wzbd47Q1WsOCW0p4Xtj6BO9h7VnjRlHYakxmUazEJEhn47r5d3nczFNbNAMUG/1QDrH87KOFGg7QfMFm8nK+ARXkMJEjpFnajcP4NYTPz/2mBlCyFSHUQ=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Wed, 2 Oct
 2024 18:50:15 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%3]) with mapi id 15.20.8026.016; Wed, 2 Oct 2024
 18:50:15 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Vignesh Raman <vignesh.raman@collabora.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "daniels@collabora.com" <daniels@collabora.com>,
 "helen.koike@collabora.com" <helen.koike@collabora.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "robdclark@gmail.com" <robdclark@gmail.com>, "guilherme.gallo@collabora.com"
 <guilherme.gallo@collabora.com>, "sergi.blanch.torne@collabora.com"
 <sergi.blanch.torne@collabora.com>, "deborah.brouwer@collabora.com"
 <deborah.brouwer@collabora.com>, "dmitry.baryshkov@linaro.org"
 <dmitry.baryshkov@linaro.org>, "mripard@kernel.org" <mripard@kernel.org>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v4] docs/gpu: ci: update flake tests requirements
Thread-Topic: [PATCH v4] docs/gpu: ci: update flake tests requirements
Thread-Index: AQHbEx6VZq9NdGlJcES3XBOMhY5TvbJx64qAgAHl6LA=
Date: Wed, 2 Oct 2024 18:50:15 +0000
Message-ID: <BL1PR12MB5144DCE3B2511FAFB73AE77CF7702@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20240930095255.2071586-1-vignesh.raman@collabora.com>
 <87fea8ea-fe9d-4114-b03c-7ec50a4be874@collabora.com>
In-Reply-To: <87fea8ea-fe9d-4114-b03c-7ec50a4be874@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=a60077be-fb78-4542-81b9-465ee21eecfe;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2024-10-02T18:49:51Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|DS0PR12MB7726:EE_
x-ms-office365-filtering-correlation-id: 5fb4f004-be11-4f46-4238-08dce3130dd7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?bXVxdGFGN21oajgzOC9iMERlUW9lMnRuS1RUWmU5dzRYbkJaS1BraVhhSkVG?=
 =?utf-8?B?MXNRSS9CLytYZkRtSDI1Y2dsZDZMUUEraGlTQUN6aGhjTnJwMTdtNVJJL014?=
 =?utf-8?B?aHBpZ0ZzaHp6MitkeGo3eEw5SGhVS2lpUWw1NEJjY0RtR2JTVXR6anpMeHV0?=
 =?utf-8?B?MEJrWDhVOVFmdXV6cUpZV3AzUjJGZERwY2RrWGVQcDA3OXdBR1NSbEh3RExi?=
 =?utf-8?B?TjdQRTF0NndrWGwxMHhGR0tKWHUrWk4rWWRLKzF1RzJtTnkyZFV0MndtRjhn?=
 =?utf-8?B?Z0xIUUZaSmpzZENxeTJpZ1JGcDd0eC9OWWJuaWFSQ0dQMjExL3BxblFlYy9u?=
 =?utf-8?B?MEE1cTJJUkZKa3M1Z0xxNXRZQnFYaHJVN1NPcmRiQUYwOWhROEVxRTFGck9a?=
 =?utf-8?B?UzFmeUR6bERYYUoyaWJSVWgwQVNMbmkrMlVOa1o2bnBLVDVEN3RnYS9kWGhl?=
 =?utf-8?B?cENVcEJGL05wSDRvR25jY2IxamdyM0grZ0FZOU5JQ0cvT3NRUDdHUEFxNHBk?=
 =?utf-8?B?bkJiRmpObk04ODl1ekt6V21IaVZrUk4wLzRPcyt3VVNUMnJLVytQWDgrNzFU?=
 =?utf-8?B?MVNaVmNRZGJicjlPVFNUYlBKYTVtci8xbTRROUp4Z1FtZmRjRGtnMmJaNW9k?=
 =?utf-8?B?L055ODExZGxDMGRLVW92b2w0bkFYeGJ3ZVZJMU1HV3grQzV1SjFxK3VqM2Iy?=
 =?utf-8?B?M1ZPY1NmdytaY3RyY1d0RVNTTVp0K2wxZHkzbHQ1UlgvakNxcHNhRnFKSERk?=
 =?utf-8?B?Mmc2WW1aVUp3aXFnVVJubVlFRWg1NzlwdUtkbU5uZFM3NitqK3VRcUtvU2Mw?=
 =?utf-8?B?T0hjeDNTZmZHTk9yN2tzSDZWVDA0R1N6bGZtcU9mTEFwWGc2cjVIOWQ1RkFj?=
 =?utf-8?B?NTZxUUwwRjVURGV6dlFMQzdCUmxubE1ZcCtMS1piWVczeGptd2lGVGRjdS9M?=
 =?utf-8?B?aGpTWFhYMFhWOGtkMCttZUd6SCs1WDltemZGOVkwTDdNUmtMdjZPL3g0RzVy?=
 =?utf-8?B?SFQvMzBlN2Q0TGpxQVpjaVcwQ2N4aXVuYVZiQ3Q2bTJGSmloQkZtMU42Nldq?=
 =?utf-8?B?SW9Zd3hicTJ5dTU2VWF2L2tIbk5NU1Q1azNvdmlsQUg4RUdqekgvNk0xTDhk?=
 =?utf-8?B?ZCt3TnFXdGQ4L0JVSXVlcWV6ZXIydHJza3JpaE5rUkMzVVFKK0lsdFpjMVFE?=
 =?utf-8?B?K0txdlhvMGdCa2RwWTJNQ1NabFNsb2dIdWJROWpkYklORDYvbHBlNU9lU2Vw?=
 =?utf-8?B?eldlaWpSZEZTYk43L3JWNHBkVGJMb0s2cis3WE1lOUpyZXBacENzNmFVL2Uw?=
 =?utf-8?B?b0NSdTJXY1pUZEdBMWZGZElySmt3Q1E0bXNlWnZzaU5JNng5VUhicERWSkVD?=
 =?utf-8?B?R0RlMUZQUld5REttWXArajJpeGFsaE5Mb0luOGVGQmFqZWdtK3JpTXRETlhH?=
 =?utf-8?B?QjI1VUpJcktkUk1oWHQwMkRnNThuTGlqQWFMZkx3SHh6L255ZjZXb25qbklj?=
 =?utf-8?B?NHBsS0MwNVMyaWpwSmt4U1B5NTZTS0MrbVdZaWQ5ejdWM09jcEZrQTV0NXo4?=
 =?utf-8?B?NzZuNGtVM2NINk1Gc2hEYzY3R1pxY1NqejFPYUlIZWlpMmROTUlqODNvbVQv?=
 =?utf-8?B?aWlPRXpmZ1AxT3FBMVRhUVNrSHpxcXBndWJmNHNTZUFTVGo4YUxIMFVkT3FB?=
 =?utf-8?B?UkEwcDZwL09lMzlqRTBvMVJyelNBSVA5R0hWbk4xcXFtNzlHdUtuRzhxL2ov?=
 =?utf-8?Q?Np6tOBK6COMr1O4W/Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUhLSXo3anlqeFdjTVJvUG9ZRlVZYWM5am8veG93dURBOGlXY3llODBCZFQx?=
 =?utf-8?B?MlpKM0F4THhOMnExcFU5ZmJkOCt5VjJFYVRnUTlEazZUWFB1TGs0UUVVQ3VZ?=
 =?utf-8?B?RTYyRC8wSUxXa0NSTXVFQmlja2NVbEYrOVRUOEIrYXhoVzJXRzJwMEJJTW9h?=
 =?utf-8?B?d0NhYU1FVGJpVnhvT1FRbEgvSTJCOGhjalpJc2FsdkdOazJRdTdOZWtKSXZB?=
 =?utf-8?B?aXJOZ1k3WGVRQlJKZDV0akFSZUcwMFRUMUlZLzdzT1N2RnJnbmFENE14RDUw?=
 =?utf-8?B?YjVIZU5yM1lxNGdoZUVFYUhZZ296RVRWL0dGQ0FyakI1Qkp3QitCK01sYVE4?=
 =?utf-8?B?dStIZmNQa0x2bmxPaUI1V1NjRVV0V2RDMFI1S1JYSG1vWmNIQVJNejdOWkhw?=
 =?utf-8?B?ZXI3S1lNcVdhZllFK1FQRmdnWEFuZ0FQY1pwb1JyVzRPOTM0YkJ3TnU5STFq?=
 =?utf-8?B?bWFxaE5SZnUzTVdWbkFFbUFGZmRQM2UrZUZyaWNFc09tVGgzNWYyTUxQRWpj?=
 =?utf-8?B?QlZTWjBZS0k2OU5VSy9uenoreHFmOC9ZWTRlSW1xLzJMMEROeFNEa0tFYmtq?=
 =?utf-8?B?Nm5PbUgrUzBsY0hwdFJBOWlmbDZGdEZCekxDMnZKT3R2d2pvdHlPQzFDdzFH?=
 =?utf-8?B?dVZhUm4vUFg4NVg3QXJNR2NIQjhxdDQyQnZGQlBWc0d5RUNJYThON3g4eVJR?=
 =?utf-8?B?aEVvUGF0WGpsUk0zS3A2TUVZZXY3ZGNwMEtuR0x0a3JYU3JaeXFGWGgwQ3VZ?=
 =?utf-8?B?OUd3aFM0NytqS1hyZ2NDcHBJSWp1c0t6cElFOEtBdDdRUGpMQ3VjNTJoNG1r?=
 =?utf-8?B?Y045UHVaTHRmY25nNTNqNFpKZW1McURJVkFtY0VTSWZaNDVMZWVvekFRWGFQ?=
 =?utf-8?B?Yzluby9TbFB4TXZjMTRrdSs4UE9BWWxES05FS0dBWjQ3M3NONWVNTHlFU05R?=
 =?utf-8?B?cW1iYkhzQ21uUUZKR2xXNmJ6dnBuUmZ5ZHpteE5nWTRvUUdIWmU2K1diczJQ?=
 =?utf-8?B?TEQ5eWIrc3Zwdll5byszYU4rblNTc3IxT2l3aC9DdEtWQ2tSRWNKaXBQMlRX?=
 =?utf-8?B?MEF5N3NtaFlLRytWdlRUV3A0L3ptUGgvYk5uWWVoRjZJVlM2UzFZWXQveEhv?=
 =?utf-8?B?T2hmUXZQTFVhUjNSeW5XZ2RuQmNZaVgvRWNTSVdUVkQwN3EvMEQxYXkxNktB?=
 =?utf-8?B?V1Nqb3lGbHpBcE14NWg2bytqdDFPN0tiV3paOEc1Q3RaN0g0MjdoZGdlL3E2?=
 =?utf-8?B?aXM2S1VhN2FuSXVLa2FrRmZ6SWo5R3dKK1BVTlFwekpDaGVJUUxTdXQrYTN0?=
 =?utf-8?B?NW90WW5yV3dCU3lkeTB5Z0ZWZ1RNYThDY244NERRQ2NkbjAyQnJlbXMrcjNG?=
 =?utf-8?B?VUUwMEZ1R1FKUU05YUs5eU1DRzZQQ1BZaVBrTkJKbm1MUlh6TExBRnpvWS8y?=
 =?utf-8?B?Y1l4VUZ5Q1FCSWJkU2lXYlVKWkZ6Y3hvMmFhYlNJWmV5bGN4VWpaOUQ2YXNC?=
 =?utf-8?B?ZS9hWmxkRmRMNHNaaWc4bzlCVzBkTmFCOGV6TXQ0ZSs5ZTAvKzJmeW55dXFu?=
 =?utf-8?B?RnladDJ0bmNXbFgwNDF2NFNaMEtVWEJlUHA3dUNlcXIvQjMzamFFeGh3K2du?=
 =?utf-8?B?TWJJTFJLc1g3akZOK3F6SitIL1lzSHREdG5JTmZxOW9RdkMwRVBqdUEzUlhD?=
 =?utf-8?B?K0I5SFJvbE1lczh6Uk11dElHamNwVXo1Wm5GdElpUU01dUlCT3FvU2V5TXNn?=
 =?utf-8?B?M0RDQXk4Vk04cGZ4c1dFQXFrNEtrZDZ4eHRzdzhRWGV3cjFGOEV0aU5ORWlP?=
 =?utf-8?B?T3doaWFUd2M1QXpDOFdSZ25LZmlhekN3YVlIMlcxMEZ2c3lFMGcwR3RWaXlB?=
 =?utf-8?B?K2tNZ2hpcG5SZXF1YXRFejE2WEFBWGo5VS9la0M4alh2dTlITVpUUlJqWGFy?=
 =?utf-8?B?L2NTR2hlR0sxZ2pwbWxOSnRwS0d3NU4zbjE5RXovYzdVWlRTOFdMeGVsZXZ1?=
 =?utf-8?B?TnZWYzdLSjU5VGxHZjhvUXFzc2lxTzlZaUh4UWxjZVRmakI5TWlaVTFqcjJJ?=
 =?utf-8?B?RDVTV0ZiVHFwNVd0WVVKWDU0V3BUTHNXem55ekttc0IzVG9FZnM3T0hyVFhh?=
 =?utf-8?Q?FTPw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb4f004-be11-4f46-4238-08dce3130dd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2024 18:50:15.5248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BWQvWeO9mLJqzvS6bhgwQkgKuPcRLfrz6jer/GAoosQ5f+j/1KQubKJmlclTO9TAy02FJjfRhPhX7+gatK3lLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7726
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

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBWaWduZXNo
IFJhbWFuIDx2aWduZXNoLnJhbWFuQGNvbGxhYm9yYS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE9j
dG9iZXIgMSwgMjAyNCA5OjUxIEFNDQo+IFRvOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRl
ci5EZXVjaGVyQGFtZC5jb20+OyBLb2VuaWcsIENocmlzdGlhbg0KPiA8Q2hyaXN0aWFuLktvZW5p
Z0BhbWQuY29tPjsgUGFuLCBYaW5odWkgPFhpbmh1aS5QYW5AYW1kLmNvbT47IGFtZC0NCj4gZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogZGFuaWVsc0Bjb2xsYWJvcmEuY29tOyBoZWxl
bi5rb2lrZUBjb2xsYWJvcmEuY29tOyBhaXJsaWVkQGdtYWlsLmNvbTsNCj4gZGFuaWVsQGZmd2xs
LmNoOyByb2JkY2xhcmtAZ21haWwuY29tOyBndWlsaGVybWUuZ2FsbG9AY29sbGFib3JhLmNvbTsN
Cj4gc2VyZ2kuYmxhbmNoLnRvcm5lQGNvbGxhYm9yYS5jb207IGRlYm9yYWguYnJvdXdlckBjb2xs
YWJvcmEuY29tOw0KPiBkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc7IG1yaXBhcmRAa2VybmVs
Lm9yZzsgcm9kcmlnby52aXZpQGludGVsLmNvbTsNCj4gcXVpY19hYmhpbmF2a0BxdWljaW5jLmNv
bTsgbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtDQo+IGFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9yZzsg
bGludXgtYXJtLQ0KPiBtc21Admdlci5rZXJuZWwub3JnOyBpbnRlbC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyB2aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC5kZXY7DQo+IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2NF0gZG9jcy9ncHU6IGNpOiB1cGRhdGUgZmxha2UgdGVzdHMgcmVx
dWlyZW1lbnRzDQo+DQo+IEhpIGFtZGdwdSBNYWludGFpbmVycywNCj4NCj4gT24gMzAvMDkvMjQg
MTU6MjIsIFZpZ25lc2ggUmFtYW4gd3JvdGU6DQo+ID4gVXBkYXRlIHRoZSBkb2N1bWVudGF0aW9u
IHRvIHNwZWNpZnkgbGlua2luZyB0byBhIHJlbGV2YW50IEdpdExhYiBpc3N1ZQ0KPiA+IG9yIGVt
YWlsIHJlcG9ydCBmb3IgZWFjaCBuZXcgZmxha2UgZW50cnkuIEFkZGVkIHNwZWNpZmljIEdpdExh
YiBpc3N1ZQ0KPiA+IHVybHMgZm9yIGFtZGdwdSwgaTkxNSwgbXNtIGFuZCB4ZSBkcml2ZXIuDQo+
ID4NCj4gPiBBY2tlZC1ieTogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPg0KPiA+
IEFja2VkLWJ5OiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+ICNpbnRlbCBh
bmQgeGUNCj4gPiBBY2tlZC1ieTogQWJoaW5hdiBLdW1hciA8cXVpY19hYmhpbmF2a0BxdWljaW5j
LmNvbT4gIyBtc20NCj4gPiBBY2tlZC1ieTogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlz
aGtvdkBsaW5hcm8ub3JnPiAjIG1zbQ0KPiA+IFNpZ25lZC1vZmYtYnk6IFZpZ25lc2ggUmFtYW4g
PHZpZ25lc2gucmFtYW5AY29sbGFib3JhLmNvbT4NCj4gPiAtLS0NCj4gPg0KPiA+IHYyOg0KPiA+
IC0gQWRkIGdpdGxhYiBpc3N1ZSBsaW5rIGZvciBtc20gZHJpdmVyLg0KPiA+DQo+ID4gdjM6DQo+
ID4gLSBVcGRhdGUgZG9jcyB0byBzcGVjaWZ5IHdlIHVzZSBlbWFpbCByZXBvcnRpbmcgb3IgR2l0
TGFiIGlzc3VlcyBmb3IgZmxha2UgZW50cmllcy4NCj4gPg0KPiA+IHY0Og0KPiA+IC0gQWRkIGdp
dGxhYiBpc3N1ZSBsaW5rIGZvciB4ZSBkcml2ZXIuDQo+ID4NCj4gPiAtLS0NCj4gPiAgIERvY3Vt
ZW50YXRpb24vZ3B1L2F1dG9tYXRlZF90ZXN0aW5nLnJzdCB8IDE0ICsrKysrKysrKystLS0tDQo+
ID4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dwdS9hdXRvbWF0ZWRfdGVzdGluZy5y
c3QNCj4gPiBiL0RvY3VtZW50YXRpb24vZ3B1L2F1dG9tYXRlZF90ZXN0aW5nLnJzdA0KPiA+IGlu
ZGV4IDJkNWEyODg2NmFmZS4uNmQ3YzYwODYwMzRkIDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50
YXRpb24vZ3B1L2F1dG9tYXRlZF90ZXN0aW5nLnJzdA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24v
Z3B1L2F1dG9tYXRlZF90ZXN0aW5nLnJzdA0KPiA+IEBAIC02OCwxOSArNjgsMjUgQEAga25vd24g
dG8gYmVoYXZlIHVucmVsaWFibHkuIFRoZXNlIHRlc3RzIHdvbid0IGNhdXNlIGENCj4gam9iIHRv
IGZhaWwgcmVnYXJkbGVzcyBvZg0KPiA+ICAgdGhlIHJlc3VsdC4gVGhleSB3aWxsIHN0aWxsIGJl
IHJ1bi4NCj4gPg0KPiA+ICAgRWFjaCBuZXcgZmxha2UgZW50cnkgbXVzdCBiZSBhc3NvY2lhdGVk
IHdpdGggYSBsaW5rIHRvIHRoZSBlbWFpbA0KPiA+IHJlcG9ydGluZyB0aGUgLWJ1ZyB0byB0aGUg
YXV0aG9yIG9mIHRoZSBhZmZlY3RlZCBkcml2ZXIsIHRoZSBib2FyZA0KPiA+IG5hbWUgb3IgRGV2
aWNlIFRyZWUgbmFtZSBvZiAtdGhlIGJvYXJkLCB0aGUgZmlyc3Qga2VybmVsIHZlcnNpb24NCj4g
PiBhZmZlY3RlZCwgdGhlIElHVCB2ZXJzaW9uIHVzZWQgZm9yIHRlc3RzLCAtYW5kIGFuIGFwcHJv
eGltYXRpb24gb2YgdGhlIGZhaWx1cmUgcmF0ZS4NCj4gPiArYnVnIHRvIHRoZSBhdXRob3Igb2Yg
dGhlIGFmZmVjdGVkIGRyaXZlciBvciB0aGUgcmVsZXZhbnQgR2l0TGFiDQo+ID4gK2lzc3VlLiBU
aGUgZW50cnkgbXVzdCBhbHNvIGluY2x1ZGUgdGhlIGJvYXJkIG5hbWUgb3IgRGV2aWNlIFRyZWUN
Cj4gPiArbmFtZSwgdGhlIGZpcnN0IGtlcm5lbCB2ZXJzaW9uIGFmZmVjdGVkLCB0aGUgSUdUIHZl
cnNpb24gdXNlZCBmb3IgdGVzdHMsIGFuZCBhbg0KPiBhcHByb3hpbWF0aW9uIG9mIHRoZSBmYWls
dXJlIHJhdGUuDQo+ID4NCj4gPiAgIFRoZXkgc2hvdWxkIGJlIHByb3ZpZGVkIHVuZGVyIHRoZSBm
b2xsb3dpbmcgZm9ybWF0OjoNCj4gPg0KPiA+IC0gICMgQnVnIFJlcG9ydDogJExPUkVfT1JfUEFU
Q0hXT1JLX1VSTA0KPiA+ICsgICMgQnVnIFJlcG9ydDogJExPUkVfVVJMX09SX0dJVExBQl9JU1NV
RQ0KPiA+ICAgICAjIEJvYXJkIE5hbWU6IGJyb2tlbi1ib2FyZC5kdGINCj4gPiAgICAgIyBMaW51
eCBWZXJzaW9uOiA2LjYtcmMxDQo+ID4gICAgICMgSUdUIFZlcnNpb246IDEuMjgtZ2QyYWYxM2Q5
Zg0KPiA+ICAgICAjIEZhaWx1cmUgUmF0ZTogMTAwDQo+ID4gICAgIGZsYWt5LXRlc3QNCj4gPg0K
PiA+ICtVc2UgdGhlIGFwcHJvcHJpYXRlIGxpbmsgYmVsb3cgdG8gY3JlYXRlIGEgR2l0TGFiIGlz
c3VlOg0KPiA+ICthbWRncHUgZHJpdmVyOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcv
ZHJtL2FtZC8tL2lzc3Vlcw0KPg0KPiBQbGVhc2UgY291bGQgeW91IGFjayB0aGlzIHBhdGNoLiBU
aGFua3MuDQoNCkFja2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+DQoNCj4NCj4gPiAraTkxNSBkcml2ZXI6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMNCj4gPiArbXNtIGRyaXZlcjogaHR0cHM6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL2RybS9tc20vLS9pc3N1ZXMNCj4gPiAreGUgZHJpdmVyOiBodHRw
czovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL3hlL2tlcm5lbC8tL2lzc3Vlcw0KPiA+ICsN
Cj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9jaS8ke0RSSVZFUl9OQU1FfS0ke0hXX1JFVklTSU9OfS1z
a2lwcy50eHQNCj4gPiAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4NCj4NCj4gUmVnYXJkcywNCj4gVmlnbmVzaA0K
