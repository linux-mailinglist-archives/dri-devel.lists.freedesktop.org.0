Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C460499573B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 20:54:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1DD10E081;
	Tue,  8 Oct 2024 18:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WVie5a+2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8120F10E081;
 Tue,  8 Oct 2024 18:54:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FELko1ob4nTF9lhur3z+3F6EalyBxviiM0eOgsUswo/nSFFqsGh6lRLjCL+i4kzlI61K5VKwFXWrSjhqLVUNB3x0m+TbHdNmqhhFVvadwzyi6IFtRk73uGsuIxVJpTVxF7xJ5hlLP+EQqF8Kj7+uv2VZcXXHkL5lvDL3rkbtBv+ukhQPGB/t3ZqOlq7b0ATSOuQsq+SbwgajSJVWFX9C51Wpl2nSskZb1Y5kWGMSz4+0IpM7s27983CDy0OaZlbwxQHQvKQNZiCOHIMHZMbHPatPYZZI7Zr6OfwM28PuVq07xOKV3KecORiSMV0ChFX2mTiLMXK8W5n3EOu+p7mukg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BUfozrVHBRShaRReL7HpCTEzp1VprzztY/cFEWO+gxA=;
 b=aq0sVMMxSEX6LqHRGKTBD79Blz6B0N00NYHhlo0YbE/NvJPakX27PyOMTfRmmSSF0Gqv/KQMf2ZVvLgvmvdGEKdUacltXllEy3fkZZaSffiTPX+I7PKHRPqt81mGO7HMMHPDcRwfbYFj5AH3fQvpkTq3x5OVSxeTRSOyiT+vH8e7FFhJ8HD4ZCEtW1kQkw80uJLK5eaNAD77ri2vogSfOC/ymbxalAPlqhxLrYV8X3HkuEvS4V5+zUZejPh5uwKmfJ57ZPa26dDJvPi5fszjGvnkXaypK1VBIY+1DHPIuZitdmpB2WPh3UyPjCvaQtE+xYvhozoV99dWVt/ypBuj4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUfozrVHBRShaRReL7HpCTEzp1VprzztY/cFEWO+gxA=;
 b=WVie5a+2SPNiLlChnA2MAXGJd7E3abdR7/S6IhOueUXlDVzrz8b8u1foMjp4zMBppCkm3mVp1MedZ9Omtbnt9Us2nbedvroujxh/7p0SgC/0hs3JcNwEQlbWRk0qcy3//ZppieEfQ7q/Stdhslfq3coGOzIbffcEuUall8HcXws=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by SA3PR12MB7832.namprd12.prod.outlook.com (2603:10b6:806:31f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 18:54:39 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%4]) with mapi id 15.20.8048.013; Tue, 8 Oct 2024
 18:54:39 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
CC: "robdclark@gmail.com" <robdclark@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "tursulin@igalia.com" <tursulin@igalia.com>, "simona.vetter@ffwll.ch"
 <simona.vetter@ffwll.ch>
Subject: RE: [PATCH v5 0/6] DRM_SET_CLIENT_NAME ioctl
Thread-Topic: [PATCH v5 0/6] DRM_SET_CLIENT_NAME ioctl
Thread-Index: AQHbFZImBC6QPnQgNU6GOP68qbLmC7J8jJeAgACvOtA=
Date: Tue, 8 Oct 2024 18:54:39 +0000
Message-ID: <BL1PR12MB51447304414D32EFE3042D47F77E2@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20241003124506.470931-1-pierre-eric.pelloux-prayer@amd.com>
 <c3cbe908-ef13-4d76-afe5-bce4a3a55195@amd.com>
In-Reply-To: <c3cbe908-ef13-4d76-afe5-bce4a3a55195@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=0807118d-9c20-4097-91e5-85cdd577c449;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2024-10-08T18:54:25Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|SA3PR12MB7832:EE_
x-ms-office365-filtering-correlation-id: 737e283a-321a-4c9c-9a26-08dce7caa96e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZnJzQzRXbmdaOGlTRTEvaTBqdzFNM1lCQTNvS3k0UyszSkw5VW1pOFFJRDV0?=
 =?utf-8?B?N1VJNFdmMEcwMGttUXJtKzZxeTZxZGdseXo5Qk1nRGFvcTliUjVwaHBlb3FS?=
 =?utf-8?B?a3FPSEdMTGJnUGdJRTRXVHZqV2JtUXBiOWhQQThxc2VMNDZIWjI5RTNJdkMx?=
 =?utf-8?B?bWU3TjNvdlRZNjZSaGdRNTVTSjlBNXRKTzlzazFXK2psWWJJOXAwM2tlWTht?=
 =?utf-8?B?Z1FrWFJmcE1tMnJOd0J5UzRLdGRLbitNVUlXVUI2MXNndi9jM3BVTC9tSUlz?=
 =?utf-8?B?VjVLRlcrQUtWb0t1UFk3cUZtUm9ZamVrZmFpY0NOZ3BNMGJ6cythdW5WWlh5?=
 =?utf-8?B?cmw4eCs3WnM4UTNWaFQ5UnBTWVBwTjVRcCtRcDI3YStjajU5WWlPUW1sSTB0?=
 =?utf-8?B?QU01dFVIYmRIQjFWZnZqQkU4bVhLVEhycHlJbHZVN3MyMnhOYW9YMHFLRDlK?=
 =?utf-8?B?VEYrcENCVW14WjltVTg3TklQN0w0V0x4N3VjR1dXQXh4bXU4dzZaWWpQalVa?=
 =?utf-8?B?R255b2dldkt3TVV6NVJyQ3RBb1BxNUxlNytNWTNtQTBaWHNONEY3Y2daWHoy?=
 =?utf-8?B?ZXJEOW9SQUd1ZFpXazJoK0ZqdDhLcDBscC9BdUp3amJ5cDFscU1maFg5VVk4?=
 =?utf-8?B?SDJUQ2oxRWNYSGphUmpSQVg5MmJ6UVZqN2h0a3VCY2srQ3ZEUEF0R01KWi84?=
 =?utf-8?B?WUdGTWJMRjMwa2ZZOUU3Nm9tRm42bjZNbE5QQjNNRDNvR0hVOE9kamVVZzhB?=
 =?utf-8?B?bGJCb0dEZFlPWmw4RFdhdFpmS1VtVE02SllEQTNGdE9ROEROTzY5NHQ0VEZn?=
 =?utf-8?B?NkowSEpIMmtvZmtCaWVPUWx2cTBzNmtwcVRLQWFPVmhEbTNPNkQ1emdJODZx?=
 =?utf-8?B?QVJJOEFTcFV6TUF5ZXZxcDFST0pRaDFjb1JjQ3o0ZjY1cjhIUTZYZE1VTG5F?=
 =?utf-8?B?ZGsxNElzcG1BL2MvNWE3bEtEWGc0WnhYNGQ5bWt1QkxnUGt6bHYwaU1ONzVz?=
 =?utf-8?B?cU5Hem9ja0FSZDZVYjU4aGh2WUxBOUhMUXIvUUlXbWV5bDV2QUJaRUw0ZDJ1?=
 =?utf-8?B?cVpRTDRqU1Z4QXJySFU4SVJxNGc1Mks3ZjFNRk5xZm9qa1A5a2VUdzVOVUJP?=
 =?utf-8?B?M2cwdkdJZ2c2VGdSU0lqYWVqMGVxWUZSR2FWbThqc1dFSDRKUmRyWStTTEU2?=
 =?utf-8?B?U2d0Z1M5UjY1N1FxYTY4Z1JCZkhCMndzTitzeG02R29vK0F3SFRYM2lUam1Z?=
 =?utf-8?B?eGtvUGZxY2xnNWI0amhUYW9PUlI2UkFIRU12K2hKSlpaYjMxT1dScHFEOWRx?=
 =?utf-8?B?V0NOSTV0K0lqUEdWd0ZpTDhVSHdyeVZqYmlHRzFGYVJ3WGlndTV0bUhiMlRW?=
 =?utf-8?B?amYwTlBRdjM2N1ZLSnNaU29UbURSbWVnNGN5TlVYVisrUmo0THFqVUdzbjVD?=
 =?utf-8?B?THNtV0h2eHJQb0ZuNEFNODF6TE9La2hFTEl3ZmEyZ0ZrYmdJNFAxelF5c3V4?=
 =?utf-8?B?eDE0NzNrVjFNUEczaG1ySzV2Q1NUMzRJT21uL1pVcmpZUE9hUy9Yc0JMUWh5?=
 =?utf-8?B?anlwME9MK1RscUdPMzlsaW5SekxROVB6R2RwU2ZLaW1QSGxvazZOV1dWSFhH?=
 =?utf-8?B?UVVWV09RMXNHcGJySXJDWUx2TkZYRGhob2k2d0U4VVg1K3JwUWhOY2V5K1Ev?=
 =?utf-8?B?U1NoTEtnNnZiTEJ4aHp1RHVYeTFvc0RYZTd0OUtvM2NHYk9kSjVRTkcxY3Vh?=
 =?utf-8?Q?a9gg7BXLoDzq+wbI1g=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1BGd3B4RERtVkUvS3ZtNmlzVzdWWnhnSGJ6dDd1U0xabnVyR1B1YUhrTWdF?=
 =?utf-8?B?SWF1Tk1CYitEdTVtRVRWdTZ4dEcrOFg0YVU1a3NoYXM0Z0pkZHBHVWNnU0Vz?=
 =?utf-8?B?dGpTQWpSVXRZRzBzRE9XMmRLMUMzQXM1dnNVZjB1TGlvYnE5T294MnNsYnhD?=
 =?utf-8?B?WjluMTZveUVrVDhPZC9EM280ZmFaR1JHQ091WUw4SVFhN1ZTL2JWYUR0YXVQ?=
 =?utf-8?B?YkpIMDBITlprZXFGK1VDb1pTZkZYMHFiTUJVcEcyK21oQmdSbEpDeUJkN2dj?=
 =?utf-8?B?dUMzUC8vRkZUdTVweUVIbWFiWHhpdHZQdDFTYnZLM3RzNzRtTUp4ZFFHTE5U?=
 =?utf-8?B?K1FnSW16c1Eyb09CTTBrQzQ2ZHQ4STFRZXJVRWtzMllxQldqeEpxemJ1Q202?=
 =?utf-8?B?M1JmT2oxdFNOWWF1cHhCN0tFTlRYYU1TOEtPVmhFUVpBelUxc0hmSE5odktD?=
 =?utf-8?B?aitjeXRtY2llS1I4NGtUeFdXMTh5ZDFLeTU2MlJZMHRmNkxZeUZPeXZtVDJy?=
 =?utf-8?B?SnFyU2Z6OHdKcFNuREZnaTAveWNzVlA4cjJqR2tnQ1pSNTB0WjdRY3M0K1Rs?=
 =?utf-8?B?ZTF2TllvWFRPQ1BMZGdkRzY3Y2FTRDBGdllhM0lnR3hwSU1CdzZOY0JJR3lr?=
 =?utf-8?B?T2tjekMxOEpsa3orcjR0SUh5K081emdrUzlvUTJjNi9Sbnpab3c4L1VHWXds?=
 =?utf-8?B?MndyQmlwa3lGdEpDaGJBblh6eEN3N3JCYk9YZkRONWkxMlhkdWZidzMxZy9S?=
 =?utf-8?B?YzF6SGlWN0xvcmNNdlhFZFNJYlNaNlBXaUlBVHhnYXBCQk51NHc2Zmo5VUVt?=
 =?utf-8?B?Z1ZJV21RRFRwc2RkS2RESFBvNlNpa1hadjE4Z0NBQ2R4VjhxNEdNN1FCSmZB?=
 =?utf-8?B?NHo2TTFDOVJaRk13NTFHc09abHhTQi9RT3VQRUZ2V1d2Ykp0N1ZVd2w0K2tl?=
 =?utf-8?B?Wk1VUkhnOStYOVFrU0NJcWZUQjc4TitYdlg0Y3RiYUJ0Q1Q4VXZtdGFKNEcr?=
 =?utf-8?B?cFBnVjk4KzhNWWpJTWF0MjVWMjVQc25meklTQUhvRFNDOEcvbWlBOWFGdWkz?=
 =?utf-8?B?MDhTNjlUeGJyV3hXZnAwTGEyUmx3aFE2Sk9ydHZSVlZsMkU1c2V2QmNxN20z?=
 =?utf-8?B?ZHNER2REKzNCaWJYcGZROXVzdnVEcFhnZFZrZHFZZEpRRHNvd0gyNmI5ajd5?=
 =?utf-8?B?Vk9qcE14aDU4TWN1MEpLckhJWmFIblBRWmtBTllQbmhZUGV1WTVMTmM1ODJq?=
 =?utf-8?B?VUh4eTUrcVpoZ1NEZmw0QjhZNzNZVlZZeWp6bG9EYWJ1VWNxdStCbi9ROEZk?=
 =?utf-8?B?OXJZSkl3NDFYRDB5N2NWY0VXeVpVQ0RBT3NoUENzMkhXYlBYRC9ZMHJYTDdV?=
 =?utf-8?B?N0k2OTVMK3BiWWNrT2JnZTUzVkY2MU04WHdNODRJYm41TW9YSEpOZHlXQmhX?=
 =?utf-8?B?NHFvVGh6em1QNEd6TmRmZVhLd1NSTk1Kb2hXcG42UVUzcVpZVEZzN0kySmM0?=
 =?utf-8?B?dFlLc2dIMU9DSXVhS0Eza3RKY2FLMkF1Umtxd0E2V1VYc0R2MUgvNkR3R3pz?=
 =?utf-8?B?aEVlTTZRQXZIQUI2NGhjZkVDYVRSSGRtUHRmMUVFblYzWmE1QjZ3M081R21x?=
 =?utf-8?B?ZHBqQWxnRlc4bm5yN0QxU08ySjhPQnJHb3Z4dTBDcCsrMEZTOGlIZStKdExL?=
 =?utf-8?B?N2l6QkRTWWhUdDlKUytHUmE0WXJJN3c4WTdZSTMyemVOeDlmV0FaSEl3Zm9G?=
 =?utf-8?B?Q2RObyt4YmhDL3dyVUl5OG9icSsyVkdvSG5OakpqZkdwd1hUNkdEZWdKeTN5?=
 =?utf-8?B?TzhUQUZsNWd1Wit3TDZCZTR2WUF0OVVyeUxkN1ZRZ1hwVldaYmpmai9sMEFL?=
 =?utf-8?B?WDhpYVVqc1RXd21QeHJZTThoYlNCQUgzMENOcFdsN0VLYllLSDdoRk9qS0xu?=
 =?utf-8?B?K1V1VmRHWGtXZmdybENDbHdNejc2TGQveklDZ25FTjVDL0pjK1h5QXhiV0ht?=
 =?utf-8?B?d2VyZ0ZlY0ZZNDlpVk9sQTJnT1ZGd2czVXdlOGwwTTFQek5HZU1PZXUzeW5i?=
 =?utf-8?B?ak8wa05WU0FvS1FJK29lalVzclNPdUkzcFRKKytXTWVGQlE1S3NHallFSXM1?=
 =?utf-8?Q?G0o0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 737e283a-321a-4c9c-9a26-08dce7caa96e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 18:54:39.1204 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pEMLL+RIgorm/bpKiORrXw8gURVsTl3iatPAWaq3aa0P1uIb5eG+XP8m5b9ezkJZ/eixFvS2vD9fDKx07vqZkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7832
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

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLb2VuaWcs
IENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBP
Y3RvYmVyIDgsIDIwMjQgNDoyNyBBTQ0KPiBUbzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5k
ZXIuRGV1Y2hlckBhbWQuY29tPg0KPiBDYzogcm9iZGNsYXJrQGdtYWlsLmNvbTsgYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7IFBlbGxvdXgtUHJheWVyLCBQaWVycmUtDQo+IEVyaWMgPFBp
ZXJyZS1lcmljLlBlbGxvdXgtcHJheWVyQGFtZC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOw0KPiBkbWl0cnkub3NpcGVua29AY29sbGFib3JhLmNvbTsgamFuaS5uaWt1bGFA
bGludXguaW50ZWwuY29tOyB0dXJzdWxpbkBpZ2FsaWEuY29tOw0KPiBzaW1vbmEudmV0dGVyQGZm
d2xsLmNoDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMC82XSBEUk1fU0VUX0NMSUVOVF9OQU1F
IGlvY3RsDQo+DQo+IEhpIGd1eXMsDQo+DQo+IEkndmUgcHVzaGVkIHRoZSBmaXJzdCB0d28gcGF0
Y2hlcyB0byBkcm0tbWlzYy1uZXh0Lg0KPg0KPiBAQWxleCBhbnkgb2JqZWN0aW9ucyB0byBtZXJn
ZSB0aGUgYW1kZ3B1IGNoYW5nZXMgdGhyb3VnaCBkcm0tbWlzYy1uZXh0IGFzDQo+IHdlbGw/DQoN
ClRoYXQncyBmaW5lIHdpdGggbWUuDQoNCkFsZXgNCg0KPg0KPiBUaGFua3MsDQo+IENocmlzdGlh
bi4NCj4NCj4gQW0gMDMuMTAuMjQgdW0gMTQ6NDMgc2NocmllYiBQaWVycmUtRXJpYyBQZWxsb3V4
LVByYXllcjoNCj4gPiB2NSBvZiB0aGlzIHNlcmllcyB3aGljaCBpcyBhZGRpbmcgYSBuZXcgaW9j
dGwgdG8gbGV0IHVzZXJzcGFjZQ0KPiA+IGFzc29jaWF0ZSBhIGZyZWUtZm9ybSBuYW1lIHRvIGEg
ZHJtX2ZpbGUuDQo+ID4NCj4gPiBIYXZpbmcgdGhpcyBuYW1lIGlzIHVzZWZ1bCB3aGVuIGRlYnVn
Z2luZyBvciB0cmFja2luZyByZXNvdXJjZSB1c2FnZTsNCj4gPiBpbiBwYXJ0aWN1bGFyIHdoZW4g
dXNpbmcgdmlydGlvIG5hdGl2ZS1jb250ZXh0IGRyaXZlciwgd2hlcmUgYSBzaW5nbGUNCj4gPiBw
cm9jZXNzIChzYXkgUUVNVSksIHVzZXMgMSBkcm1fZmlsZSBwZXItZ3Vlc3QgYXBwbGljYXRpb24u
DQo+ID4gV2l0aCB0aGlzIGNoYW5nZSwgZmRpbmZvIGFuZCBvdGhlciB0b29scyBjYW4gbWFwIGVh
Y2ggZHJtX2ZpbGUNCj4gPiBhY3Rpdml0eSB0byB0aGUgZ3Vlc3QgYXBwbGljYXRpb24uDQo+ID4N
Cj4gPiB2aXJnbHJlbmRlcmVyIE1SIHVzaW5nIHRoaXMgbmV3IGlvY3RsIHRvIGFzc29jaWF0ZSB0
aGUgY29udGV4dCAiZGVidWdfbmFtZSINCj4gPiB0byB0aGUgZmQ6DQo+ID4gaHR0cHM6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL3ZpcmdsL3ZpcmdscmVuZGVyZXIvLS9tZXJnZV9yZXF1ZXN0cy8x
NA0KPiA+IDI4DQo+ID4NCj4gPiBDaGFuZ2VzIHNpbmNlIHY0Og0KPiA+ICogcGF0Y2hlcyAxLCA0
IGFuZCA2IHdlcmUgc2xpZ2h0bHkgcmV3b3JrZWQgYmFzZWQgb24gVHZydGtvJyBzdWdnZXN0aW9u
cy4NCj4gPg0KPiA+IHY0Og0KPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hp
dmVzL2RyaS1kZXZlbC8yMDI0LVNlcHRlbWJlci80NzE2OTUNCj4gPiAuaHRtbA0KPiA+DQo+ID4N
Cj4gPiBQaWVycmUtRXJpYyBQZWxsb3V4LVByYXllciAoNik6DQo+ID4gICAgZHJtOiBhZGQgRFJN
X1NFVF9DTElFTlRfTkFNRSBpb2N0bA0KPiA+ICAgIGRybTogdXNlIGRybV9maWxlIGNsaWVudF9u
YW1lIGluIGZkaW5mbw0KPiA+ICAgIGRybS9hbWRncHU6IGRlbGF5IHRoZSB1c2Ugb2YgYW1kZ3B1
X3ZtX3NldF90YXNrX2luZm8NCj4gPiAgICBkcm0vYW1kZ3B1OiBhbGxvYyBhbmQgaW5pdCB2bTo6
dGFza19pbmZvIGZyb20gZmlyc3Qgc3VibWl0DQo+ID4gICAgZHJtL2FtZGdwdTogbWFrZSBwcm9j
ZXNzX25hbWUgYSBmbGV4aWJsZSBhcnJheQ0KPiA+ICAgIGRybS9hbWRncHU6IHVzZSBkcm1fZmls
ZTo6bmFtZSBpbiB0YXNrX2luZm86OnByb2Nlc3NfZGVzYw0KPiA+DQo+ID4gICBEb2N1bWVudGF0
aW9uL2dwdS9kcm0tdXNhZ2Utc3RhdHMucnN0ICAgICAgICAgfCAgNSArKw0KPiA+ICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oICAgIHwgIDEgKw0KPiA+ICAgLi4u
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgIHwgIDMgKy0NCj4gPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jICAgICAgICB8ICA2ICstDQo+
ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jICAgfCAgMiAr
LQ0KPiA+ICAgLi4uL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2X2NvcmVkdW1wLmMgIHwg
IDQgKy0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuYyAgICAg
ICB8ICAyICstDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyAg
ICAgICAgfCA2NyArKysrKysrKysrKysrLS0tLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdm0uaCAgICAgICAgfCAgNCArLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ21jX3YxMF8wLmMgICAgICAgIHwgIDIgKy0NCj4gPiAgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dtY192MTFfMC5jICAgICAgICB8ICAyICstDQo+ID4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEyXzAuYyAgICAgICAgfCAgMiArLQ0KPiA+ICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y4XzAuYyAgICAgICAgIHwgIDIgKy0NCj4gPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgICAgICAgICB8ICAyICstDQo+
ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyAgICAgICAgfCAgMiAr
LQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF80XzIuYyAgICAgIHwg
IDIgKy0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9ldmVudHMuYyAgICAg
ICB8ICAyICstDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5j
ICAgICAgfCAgMyArDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnMuYyAgICAgICAg
ICAgICAgICAgfCAxNCArKy0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYyAgICAg
ICAgICAgICAgICAgICAgfCAxMCArKysNCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1faW9jdGwu
YyAgICAgICAgICAgICAgICAgICB8IDUxICsrKysrKysrKysrKysrDQo+ID4gICBpbmNsdWRlL2Ry
bS9kcm1fZmlsZS5oICAgICAgICAgICAgICAgICAgICAgICAgfCAgOSArKysNCj4gPiAgIGluY2x1
ZGUvdWFwaS9kcm0vZHJtLmggICAgICAgICAgICAgICAgICAgICAgICB8IDE3ICsrKysrDQo+ID4g
ICAyMyBmaWxlcyBjaGFuZ2VkLCAxNzIgaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pDQo+
ID4NCg0K
