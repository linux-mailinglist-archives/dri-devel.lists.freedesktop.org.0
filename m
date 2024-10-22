Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A6D9AB4C2
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 19:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1DA10E6CD;
	Tue, 22 Oct 2024 17:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jZ1zBeAS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221EA10E176;
 Tue, 22 Oct 2024 17:09:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8MP16vmVHSa1sv/sR9i8z3aJ4Fnor/jRPijYENyJotEQ5ihm5BfA+nR4zE87Tv/C0ITGJPnqqU+exMb8gZz1wuZcwn9rSxCHQpKmddqayAYAjNSROmEFNMyJvCYl7yJwg3Oc5GvwrYiLxtAYDHAZfb0XvAjJ84rLzjQ7AmjazuIRJJzs8MEasbeL1ILITFfi2fVL3Ck2PKy5tvoQIn4szDqomOJypvnpICXa3O8hkyjfTdE/TZFh0tIBS/gY8aU+oXiWSNBMuSJbr9ar5tMep7f37VEysJeBy11omFkEfzHMOpESZZT0FyiEnukijOtC5PPKo3UfpBJ32BLyotGiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAwypMUXpD6/qx9ArESFlTT3Uomx3EF016Nch63d9FI=;
 b=f7jVfzTuD+Wsk8h4XHNQ7cJJnpWuBJKD9JoTgBPUVJnwTQSybfeevRhDkypp1bEyg7W845pE/9ckVAX0i2DJ2Q+4hOk7T3D9dV2dViz4vaV4Lyv6zgh4fqAu77EScxW7acQQVWvgas9U2uf/rlaTjPP8LOiflBKqnqz29bR3zfGqAR7m1Ql6MCWNDOfHLrpgScVEwJfDSLb/dyBuAKAuaxS9NWCVEUnszhC+i+zTlG2TtAd86I0ohAbuu1tt5Erz/U33llJqZlQCEYmlA2ikcMIxDSjhHwjQ8nRc81xNbg5C7YzpM6tGvJxZLgMBxDZ/r73GGVPnyALDqzgsZv8Ghg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAwypMUXpD6/qx9ArESFlTT3Uomx3EF016Nch63d9FI=;
 b=jZ1zBeAS0N8lmxvrnpgLjHxja+YFEGuo383KxgyM6oX2I7U8qDTlR6XR31torPpgh/pvsmKeKmnPqF/KMjKcfRymcRtI1C8RKJa20n1XRViqUMikPhP1izg+0YIuk1kydUFeNfU2YEeVTWpk//mT6s5TtkWWik8Jc5/2GgmYXxE=
Received: from SA1PR12MB8599.namprd12.prod.outlook.com (2603:10b6:806:254::7)
 by CY8PR12MB9033.namprd12.prod.outlook.com (2603:10b6:930:71::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Tue, 22 Oct
 2024 17:09:41 +0000
Received: from SA1PR12MB8599.namprd12.prod.outlook.com
 ([fe80::25da:4b98:9743:616b]) by SA1PR12MB8599.namprd12.prod.outlook.com
 ([fe80::25da:4b98:9743:616b%3]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 17:09:41 +0000
From: "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "tvrtko.ursulin@igalia.com" <tvrtko.ursulin@igalia.com>
Subject: RE: [PATCH v5 4/4] drm/amdgpu: track bo memory stats at runtime
Thread-Topic: [PATCH v5 4/4] drm/amdgpu: track bo memory stats at runtime
Thread-Index: AQHbIWJhHP+NzSvtr0Wud0WRwWwvcrKSaWAAgABzHCCAAB6NAIAAATtggAAKkgCAAABScA==
Date: Tue, 22 Oct 2024 17:09:41 +0000
Message-ID: <SA1PR12MB8599EFE21B3D23648FEEB157ED4C2@SA1PR12MB8599.namprd12.prod.outlook.com>
References: <20241018133308.889-1-Yunxiang.Li@amd.com>
 <20241018133308.889-5-Yunxiang.Li@amd.com>
 <1057097f-02f4-4f0f-9ac5-37aa84570b47@amd.com>
 <SA1PR12MB8599E3DD01B4A45AD7CA71FAED4C2@SA1PR12MB8599.namprd12.prod.outlook.com>
 <53382fc0-0686-46af-9285-0cd6aec314ae@amd.com>
 <SA1PR12MB859939F759D6B661D49FC924ED4C2@SA1PR12MB8599.namprd12.prod.outlook.com>
 <3930f491-10a2-4863-8e24-009d3fbc2b23@amd.com>
In-Reply-To: <3930f491-10a2-4863-8e24-009d3fbc2b23@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=5f23e325-0dee-45f2-86f0-c2bd2f44b82d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-10-22T17:08:06Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8599:EE_|CY8PR12MB9033:EE_
x-ms-office365-filtering-correlation-id: 640a1230-70e8-4ebe-a681-08dcf2bc5191
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZlNuQ2VaZmsrV01wOUVPVnBkaFA1T1NYU3Y2V1ExVUU0SXMzK1Q1bHdsR3dw?=
 =?utf-8?B?K2NNeUF0ajZ6eHF1aDFkL1JqN2VIbXdCaUlyenRLNUdjRmp0dUZkQmtjbVVo?=
 =?utf-8?B?ZzFzOEZxamp2TmJHR1kyd0ZKbTFsc2Q2QnVqZ0VHTHJXaU5oRDNsbHhHYkRz?=
 =?utf-8?B?VU4yeFowZm1BS0U5VnVmaS9oTVUvVnNDVmpqOG15YkMySzZXYzFadmVpdzl3?=
 =?utf-8?B?UFBEaGJ6V3oxQXI0QUJQZGxpSSszc0orNW93NCtsWklNNHRMZ1owcWZMbXZM?=
 =?utf-8?B?SFp3dzdzTGpJbm5XSlNtaGFtQm9SZHJYbFE4SHJuT2R2RFlza0daVEVHVnBt?=
 =?utf-8?B?Y3ZDM0N0U0IvSUdvcnFuKzZVdmdCVWpsemY3TEswN1ZJSDY4YnNEY1lySTZ3?=
 =?utf-8?B?MFlaVlVSQnBrQ2xSY2F4QXNTWkxNMlg2Tzh3SzNVK2pxMlVxdktMOGJMRG4v?=
 =?utf-8?B?dXQxUCtMTnB3TzJpQThHT1NsZkJEbnBLR1VTenBUdGlHUjQrbFhxTm9jQjY5?=
 =?utf-8?B?NHdIbjNCb1p0QXJaTFEyUFhtTkdDNVI0Z0Y1QUlGWXNlbFNsZ051ZXZzQ0hE?=
 =?utf-8?B?Nklkc0N6bmJJQUdVN1FKcGJJK1NzTEZLZVc2aThYa1FGb0hIbXdSVm5SclVi?=
 =?utf-8?B?OUNjVy8vdnlmMW5ualczRllBUGtmRGRpZk10WGpsV1BxNDVXaEw4eTFNZlRu?=
 =?utf-8?B?VkIxYmF2QkpkQWxIalNUenVlclo4czJvaEs5bnp1ODl4bmMvQ2ZYUmpET2s2?=
 =?utf-8?B?T1hHTlNvaWdoM05aMzQxZmQrRWZiZHh2MUY5Ykk1aUlWN1VKdmRhcXlnTi9N?=
 =?utf-8?B?UmVKVnFtbisrMFptMnRZOTRKT1NXNDhGb1RBekJoQllEUERiV1kxVHArVGJ5?=
 =?utf-8?B?aElXdHFMelQ0NC91M0puU1B4T2dvZm81M1dHYzlwZmkwQyt6TnRCMmlvQUVp?=
 =?utf-8?B?NUtQNnh5dlVRaXZoWGpKR214blNSRmxTb1BGS2dDQytNamlnMTNnWktTTkpI?=
 =?utf-8?B?eXNaZER4eHFtNmFsUURmQzJibmhCK093V1NZeWVMT3ltRytZWE8wTXh5ZVRP?=
 =?utf-8?B?T3d5dEFnOEV1bjFpa28wRk9OdnZzYktVNWsyREJPa2t1R20zMnVOeWhrOHQw?=
 =?utf-8?B?enZEcVhaMkRMcjRoeGhrdWU0ZG9yTlo3U0VNZEFySGdDaE1MVEIyc3ZrRXBK?=
 =?utf-8?B?TzRUNlhWQTVDWXArcG9WaldUc29NbHZDTE9sQ1d3bElYV0FKVytIVXRnSDlP?=
 =?utf-8?B?ODFzT2YyZ0lqWUt1dTYzMGJOeTRCQ2F1azNRcnQxMTNLYTI4N2syby9MRjlz?=
 =?utf-8?B?b21uMys2dHFham1LTGNoQktFR0ZNeHFNMjVMQUZicVp5NTlqWGdDZHFOZ3RO?=
 =?utf-8?B?NVQ3OEE3OG1pRVZrdkJHR0hOSUlKVjlsbkVrdWF5MjRicyt3WkQxc2FaUG5l?=
 =?utf-8?B?YjhCdGpocE83SmVrcUJ5KzRzRStkRyt3WkZUalVTT1d2dWdWcXdyVEkyVUVu?=
 =?utf-8?B?eStVOGlSWjJmN3F4bldRT1VkbkYzZXlmZjhsMHkvdzRPSllyTVNSaVBxU09q?=
 =?utf-8?B?VlplTC9hdUZFamJmMmhRTGFQU256cnorNXJuNm5PcG1LckxzZHlTWll3a3Nt?=
 =?utf-8?B?anBnN3Jkc3JnejlUa0JZajFxUUVwMjAxS2xrTDQ2MTYzcjhPczNiS2thSmcv?=
 =?utf-8?B?d2gvanNRcGJJTVYvWmxGdzBPaGFTSDZrbll1UUFCTnpZZzBlZEhnUXZQWWtl?=
 =?utf-8?B?MnJZVHhhSGpSZ21MS0FsSmNXM0tjZDhSZkRYVmFoTjVSNjNib2VHTjNDZmNQ?=
 =?utf-8?Q?kL3cjity2WiuD+7edej0f9eu37IvTaTQBq2JI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8599.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3o1YzRRcHo3SnhUWEREZ0NDelkva0RtdjFscEw2T2hmZFgvak5sQVpHNTlu?=
 =?utf-8?B?aUdRMVl6aWt5aGhTOTZURS9BMTE0d1B0Mll2RGtLWHQyR0NPc09QcGNLeVNz?=
 =?utf-8?B?b0cwU0RTcXZxc2FBR3dRTVl3OStBbGpXTUF6OU1mY3hma0laVjBQZjhCWk04?=
 =?utf-8?B?Uno4SEtFNXhSbzJzU0dRSk9ObENCY25yc1QvVWtIUlhUaitvUkJkNEhzejJr?=
 =?utf-8?B?dmoxdXJZbi82QjVJcWhCWTJpdUFlN0NEYlRqcHdLNU0zbHUvWjBtS3pVMExZ?=
 =?utf-8?B?dFlJUUJ3VjZtcVE5N2s2VGxvTEUxUG1VRnQrZnpGN1BJWFIrYVJFRjhQSU14?=
 =?utf-8?B?ajJkWFlFK3RhTUl0WlhNQzl0Q2hTOWJZZzZJNlhDTW53K2ZNTHc5ajJCeUlP?=
 =?utf-8?B?OHAxYXByTUNjU29EMktybnRaUmduczluWDIxRnMwUW4rYittZ0tYdE9KdmU5?=
 =?utf-8?B?TFBGSG5PZ1NRZUpSQ2VibzhOZGRUWTNSRFNrSEZzMGdhbS9lRXpHVnNlZlIv?=
 =?utf-8?B?V1Z2UGYrV20xbktmdG5oZVNyKzY4aTI4aFlWcEhrSSswY3ZjdnlOakJpaUdl?=
 =?utf-8?B?WWQyZTNldVJ4YzBzcUxJVkVER3N4VERIUDZScXJSQ25ZTXdkcHdKdjBvK0Fl?=
 =?utf-8?B?SEJYa0R4S1Y4eUZZRm5PNlh1RzFKWWhGcmxEa0k2bVg2MHZ3T0JQUVZQTW5r?=
 =?utf-8?B?cjZZQytRaE9MQkRnd0RuUDlZeDlvWm5ML2JDclN4UVNuZHpQeWN4VXlqZ1JZ?=
 =?utf-8?B?NGNma1dJZnFYTnlub1dBT3dkcytraDBNT2VCVVQvU3JFU3cxOURLS3p6UXJr?=
 =?utf-8?B?RGRtUWtVbHFOZUFzdW5IaDBtZ2NVcTdOMW5tblBSc0JkZ1RwT2Y0V2FxU1ZX?=
 =?utf-8?B?MTMra29Xb0ZsZUV4MGM4VjBsZXgwbHBsMUhLMWZEaU5VcEVVMUJyaVczY29r?=
 =?utf-8?B?cktvRkZmUnRYSjFPSHNmdThpdG9sQUJBbytDWlVKak53UkZ0ZUpYV3Vrcytr?=
 =?utf-8?B?U01MMVFINWVMZ3JLeE1ackFoMEZWNHpqOWs1WXdCS1ZORUZZTHlPV3JlVjYw?=
 =?utf-8?B?b2RtdmNaaVVyeThkSExKS1dGWXFtMnRWeGVqaDg4ZWxWNXg3WFFHTURmcnpr?=
 =?utf-8?B?TUJWOHkwaWwxTFdBQUUyanFhb2xwcGRLb3JScnRMcytGaXVKMVI5bjcvRG01?=
 =?utf-8?B?ZjBUMGJDak9qbzR2VTlYY1lVSWtlNmdJMnFhMTRlbHcvdU9udTF2NjJPeUZv?=
 =?utf-8?B?M2htOE1ZMGJZVTBPVkJmRlJCTDFLL0ErN1U4a1J2YXQ4a3VQRnFhd1hXeDBm?=
 =?utf-8?B?UkdSY1BPbDhyMmhZUCt2c2lqVDJjRW1qUVFFTkpiYXloNG8zT1FXYWRWMDcr?=
 =?utf-8?B?ZTVTc3NHRlhoK3RDQWU3V25ramUwcnY0UVFmSllHWHAvbWFtU0h0dG1PZ2Ji?=
 =?utf-8?B?Y0VpODRHVCtCZXpCRzVCNlh4c1MzTlNyZWNvQWlaR0hjYVMzNFNNVVo2OUgv?=
 =?utf-8?B?a3FhS2crNDFyOTFTcHVhV0tVdHVPdER1Qm1uZy8rSFM4VTFQak5iVGdUdDdm?=
 =?utf-8?B?OHBneHNSVGlZMFBBQVVWaVFJZFFyaml6cWxSMGo2RTdvektXTFgrZ2I4bHdU?=
 =?utf-8?B?SjYxQUZDQzFvR0ZlelZ4Q0Jvek9jVGY4bkc4NlNrQjFZLzEyNlhzUnZQVEs3?=
 =?utf-8?B?NjczQ3FFSkQvQUp0NVMyWEhzSzBjekM4MUNQYVpxRUVDbnFBbkRmRGkyemd3?=
 =?utf-8?B?VEU5Z1ZiMVZpNExDam9hK0RPSkFPK1FBSHNqdGdFNEVKTmF1WkdoYlNpVWI4?=
 =?utf-8?B?WGhGM1RxNVV4NWFBMzhxUmYzTnFweEVFT0Z4NFNObzJuMFFlMFBSZkd6ellj?=
 =?utf-8?B?dXEzMGpoZTlCYXBXU29xemhKQXN5WXJGU0Roek5KNmlLaGZaZVVLVEx4OG8x?=
 =?utf-8?B?ZE9FTWhscFdLTmtUaW1xWHdIVGNMQ3lwTVg0ZlpxSG5aNXN2YW9TN1ozVS95?=
 =?utf-8?B?bXZYK3NhcGdncFBkUW0vdjA0dHpHZmtXUUl5QUtjNGg0YnhqU3NDcXBxVGFx?=
 =?utf-8?B?MXpvVzVmZmNjQzZnUi9zL2N4ejFteStVQWlXUzVJT1phN0l2cFF0UFFyVnFG?=
 =?utf-8?Q?P/tw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8599.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 640a1230-70e8-4ebe-a681-08dcf2bc5191
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 17:09:41.6023 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gdg4vag7w4EobHxwyc8+pH1XKybzemJ2pclykAjFcc1xtwze2lxIHlaP8pWGI1+dUFr2kAE/AYwtB3rwYHlx+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB9033
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
Cg0KSXQgc291bmRzIGxpa2UgaXQgbWFrZXMgdGhlIG1vc3Qgc2Vuc2UgdG8gaWdub3JlIHRoZSBC
T3MgdGhhdCBoYXZlIG5vIHBsYWNlbWVudCBvciBwcml2YXRlIHBsYWNlbWVudHMgdGhlbiwgaXQg
d291bGQgc2ltcGxpZnkgdGhlIGNvZGUgdG9vLg0KDQpUZWRkeQ0K
