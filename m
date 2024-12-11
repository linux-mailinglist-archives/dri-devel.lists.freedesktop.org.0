Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B2D9ECDE8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 15:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D0F10EB58;
	Wed, 11 Dec 2024 14:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ygcqulcj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F51710EB58;
 Wed, 11 Dec 2024 14:02:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFHsSyfQZyCHYJmtgAWouPwlK80tNT4sYLkjD9V8joNn7AWzf6s8SOE5HZJuOBdeurZUiW7AoSkUevEyKIVVhx6ZOtt+P3tH2ZJhBLc65pJpRJolsX7+s+wwxPIEb74zjKa98Flj3ujPNcQbDGlUdgwrfGINAlYILTmhWES4R7ouO/zG6iqFbY6QEwmU8F/Ud+E4ywt+iK2PSAHJIyoMkskkuwzG7M2qvaTXG+zHsl/ERNPlFLMQzj+ONYyug3aSW+906rmwww790jUZj0WHXTX6zaS/8W/PMi3MuCL/DRR51Sd/CJc/SRM8qMbtZ5HGqK9Z/YKhoW6GuW+Pr4ZRBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbDDomBkXWKU0+BXR+dQx5C1o0pNcOkL9GQCcGwv4MM=;
 b=JXwlIw2m33BuzREay6wI9nNgdAQL7JMd0VWLiOOjPwbk+FjT5BSy/QKrx85M7iorJYeSkdC2G1gSo6FE1mUt2jL7guQJIiSUiTe7I6eL4NchZ9TC6FTV72BA9cCOVMub2lJOoaOw7bRQYXrGatolykrxB/soise/PqFdY96V5l7PfRNToX2x50oE6MezrDvW3XZIeA41Ot25597Oq2NAd7CtV4FHTMKPngfXdhf9sTFpu2xijonLNIheBsana92vV2vFBUQVOFF2pXkK2NAI8DapmqAoDhHS9/ZRsKFIs/lO6imdEvOk9vkwMb+WxuZ+efFp4nvvNCOarjkdzlrW4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbDDomBkXWKU0+BXR+dQx5C1o0pNcOkL9GQCcGwv4MM=;
 b=ygcqulcjblglsGreZej7Un9Vz4K5wnwIx9/gp6uF4GJNiMu1WkmqJOtD9d4Er0gaDk//MxItdzfKdAgNg6IGc5abXtBVD6uLgmifhGOIERLFBQy0u3ZMpMCL6l7jbLZJklp755j6s1RV7kUL06V7qMVxxzr2IuqpKWl/Szj+ld8=
Received: from SA1PR12MB8599.namprd12.prod.outlook.com (2603:10b6:806:254::7)
 by LV8PR12MB9229.namprd12.prod.outlook.com (2603:10b6:408:191::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 14:02:24 +0000
Received: from SA1PR12MB8599.namprd12.prod.outlook.com
 ([fe80::25da:4b98:9743:616b]) by SA1PR12MB8599.namprd12.prod.outlook.com
 ([fe80::25da:4b98:9743:616b%6]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 14:02:24 +0000
From: "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "tvrtko.ursulin@igalia.com" <tvrtko.ursulin@igalia.com>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v10 4/6] drm: consider GEM object shared when it is
 exported
Thread-Topic: [PATCH v10 4/6] drm: consider GEM object shared when it is
 exported
Thread-Index: AQHbSy1d2oBDuua+lUe3Pyt6olRLiLLgs3MAgABeW/A=
Date: Wed, 11 Dec 2024 14:02:24 +0000
Message-ID: <SA1PR12MB859965C4B7EEB4B131E8C7E6ED3E2@SA1PR12MB8599.namprd12.prod.outlook.com>
References: <20241210175939.2498-1-Yunxiang.Li@amd.com>
 <20241210175939.2498-5-Yunxiang.Li@amd.com>
 <674b6d62-2274-4b0d-8d27-382faad5de88@amd.com>
In-Reply-To: <674b6d62-2274-4b0d-8d27-382faad5de88@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=3a1b59cf-e294-4d8e-9f00-701ea67769af;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2024-12-11T13:54:31Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8599:EE_|LV8PR12MB9229:EE_
x-ms-office365-filtering-correlation-id: d3281588-a2ac-47a0-6f3e-08dd19ec7072
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?U2h2eU1RODMySGFKZndvOC8yeXA0bGNlQ3RsenFuY25oazdjZWhEWGNxYnJx?=
 =?utf-8?B?RG94M09VT1l5Z1hjQWppMjhHSUhDcCs5cnAzN2hlQ1pOcWZoQWwrcWJmeW9u?=
 =?utf-8?B?ME82ZzJNam5Tc1hkbWpkR0FVWjFqTjNvcFZVdVd1TkErSEZmV2F5dWpvcXdz?=
 =?utf-8?B?NTIyTEREZGoxZ2twcTdqc0VtUHZGMWlYWFVTNnpoZjgxVkFjSW1HeU96Z3FQ?=
 =?utf-8?B?T1VEOHQ2UVE5MXFIbkp3VktqSjE0anl1dGgrSFJBbmF3L21sZkFDSlo2MUZE?=
 =?utf-8?B?Y05kVFNwNDN4M0Nmc05FUEw0SGx4MlR2NDMvNkVyNEV5TGYza09WS0pyU01D?=
 =?utf-8?B?QW1PeUxtekh6d1h5OThscmg5cUhwek1LQ05RRFpSQlZtWUJhV0VMQWFpMHhK?=
 =?utf-8?B?ek1Kd0kzZmFjQlRMdnEvbjNXUjNUVFExNkZiRTNzTHFFMWZtN0sweW1DOXov?=
 =?utf-8?B?d1FBazhlYjJLQUNTMm1aWlNFQ1RYYkhhOU9HOGhNWllVMUF6b0ZhOFNYdVVL?=
 =?utf-8?B?dTBPQzJzTXVWRmcxaTlRS0EvVU1OdE01ektsUHlkd1crTml5RnRKV0tySW9j?=
 =?utf-8?B?WVVSWXdvOU44V2VicmNrOWp1RmtjRi9ZejFWc1l0WnBjQnpmSmJQM05lTVpa?=
 =?utf-8?B?UFlONUV4dWpZMy9ObE1Sdzh6T1lVZG5jT1FuNGdBL3EzZlpjNFA5bWFvL0Ex?=
 =?utf-8?B?S25YUUVIMktvZjFjaGxuQy85dVdHaE1VWk5GQS9ZczkzYjZJT2R4Mm5UV3RE?=
 =?utf-8?B?NHYyWE5MdXl3Q2hNY2tPeTdtZnBSemZPVVIvZEdjZEFST0JIdm5KdWRjcGNn?=
 =?utf-8?B?ZTN0SzhmbEkwQlltRXcrb2wwTFFISkIvVUhUUTJ2MDR1WVJ2bGlUZHYxQlhh?=
 =?utf-8?B?a1FSZ2JqNXdKMHJWSENrQ0Rlb3RlVGxJL1FtaXpzNnRmMG9hK1NJUG0rWEd4?=
 =?utf-8?B?cXYyd2JXWEtvZ1dEbUc1ZXVtdUVWalpYbm5FN1N1L1BDa2ZQSVVjcUlNbWV5?=
 =?utf-8?B?Q1ZJdzJ2RjhLWVJnY21kTW5JV1ZwWHZpOTJIMU1LaHgxdXRPV1FPTUFoS1lG?=
 =?utf-8?B?ZGlLN0hRSStJSERXTWhkblVBYzFubklVYkNNOUxERTBOMWlBdFYwaVpMa2dL?=
 =?utf-8?B?WTVyYVg4cjV4dko4UXhTaFByRU05MlFsa2pGUllwdThzWEZRM3ZkNHRFeXZI?=
 =?utf-8?B?SWVTdkpYRWhKbmtLWmMrdmZLYkx0NHFzZ1hDaHFxMDc2RW1lK3VWRHpKT3I5?=
 =?utf-8?B?T2JIajY1S0hLcTVFNlAyU01MZ1lJVThRN3lMZ3REUVRyL1BjaEpiVDNnSWxa?=
 =?utf-8?B?bkdJTU03dXBhdTk2UFAxQ2RMOTVISFU0bFkwMWZ5NHBrQlNNZy9ycW5Kem5u?=
 =?utf-8?B?WTVkd2ZGcGFpMUpjd3FRNUNNZGJlTXBGNXpDdHpnQ3oxYk1mMnNrOW5PdmZN?=
 =?utf-8?B?NFFIaWMvN3FFZ1RtZUR5WVU0d2UxVlhmdDBIOXp4ZE8rdlBHT0dwQWdOeHdZ?=
 =?utf-8?B?Tnh6dGRWUFRMa0l6blVBaXE5S1NUaGNNSjdJWWVhNFF2VWM0SnM4KzF2blBY?=
 =?utf-8?B?TGgwbkFOTGs0aFJpOEQvUDltNzBmazR5YnhYcEtRM1lwOXZJblROdGFjNWpI?=
 =?utf-8?B?OFQ3RmdJY1NXL01qNGswMGlQbVBTT0NjWTducWFMQVNucHdwSEtvNFg0RENC?=
 =?utf-8?B?aDk1TXBjamJEeXRmd2NKNGhxK2UreERoeUdtK1RXdkhaY0VCUEdicDFqUXZx?=
 =?utf-8?B?Q0NERkVpZ1k1RlYvOXlIdmplNnVVWlJyUDFEY09wWmJQbWJmeEYreW4rRWQx?=
 =?utf-8?B?YVJxVXBEK3VjWjFKSHhaZ1hWdFJCWDExSEhqNmdsOHFDamRtbmU1andMUnFz?=
 =?utf-8?B?R3AxQ3B2TENjc3NDemV1WWdDZzZOOEtRemtEVkU0ZXYxNEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8599.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGRyY0E4WWZtSW91UFY0Zjg4M0RvM3FQbXBZaE9Wa2NvSHBobEN1SE1YODh4?=
 =?utf-8?B?d0RLOEdxRk5Qa3dqdmszWWZ6clZCRkp0V3diazAyOHZIbjJsNXIyczdHQjc0?=
 =?utf-8?B?SXIwWWlWb3V3SUcwNEExWHJCcmlvcDhqN25qcnJXQnNNT0hhMkF5OE9aSjZj?=
 =?utf-8?B?Zml2NFZGeE53N01jZmgrWWVXUjk0SmhOeUg1UVpic1NYQzlyc0VRbXNDd1U0?=
 =?utf-8?B?NzJ3QU50VjJ2WmpEaS9aMDNJSXlpcHVtSXJVY21kNHNFUkE1MjhwblJjeTA1?=
 =?utf-8?B?Wnl0NUJGUUVqU0tkOHpYYkw3T1RVczU2YWo0SWNZeUw4MGJaRzZkL0MrOTcy?=
 =?utf-8?B?djNWckN2OUdNTW12T0dSZ3pXV0RvUDhUaTR2ZGd4SEp1b1lUekJCdmhNVldU?=
 =?utf-8?B?Wk9QZ1BCbWFuUE1ad1pubVl5SkRvamxHb1BGUGpZNUd2VGVmQTFuVzV2YXVl?=
 =?utf-8?B?SmE5OTlSck9BWXczSzcrWGd1end3cTdacnpZdjRNY3FwcUd6TmRlNk9Bc1l1?=
 =?utf-8?B?dWhtVmtWaWNXR2dkTldBTmloQm1UNTZqeGRVaEVuQjlrRG14Y1YvWENxUFc4?=
 =?utf-8?B?WFJna0pNTDliSnBsYTNEbzZreFR5ZGJsQjBRUmhUVFRqOHBucXN4VzlKcjlX?=
 =?utf-8?B?QWxLSVV2Vnp4VmhQYi9WR2xTSVkwZVAwMUNWQ1FEczhtWDhGY2ZTTGNObyt2?=
 =?utf-8?B?S20zY3lBUlp4dHpzQXhyMkJXZkhBam9OYTJrQno1d0MyaDhFSVJ3Qjl6cVd4?=
 =?utf-8?B?eG1yZVJYekZkUXVvRk42cUtPMFFONmNES3FyUk5DenlQdWZrYkNxeFc5WjVp?=
 =?utf-8?B?VTFEb1NzUCtzQ254cWd2Y0xwQ0YrYkhmMWY3Q2NuMjI4bm9mZm40dmNMZUlG?=
 =?utf-8?B?RGFrVWpmOVgyMGJ6bTV4Yks2bENIaEg0cDcwZlBCYm1wL3k3YWxJK2IzSG56?=
 =?utf-8?B?WmM5VGdYTEZ3aE56VjJjQVhtOHc5VDZlQTBFeHgyVHhiclNHanVoMDJTc09O?=
 =?utf-8?B?MjF4VytXS0FMM3gyNUpMTFZhbzBRSVpYcGdQYm0zSzVDSTAvQ214ZjRVMjl2?=
 =?utf-8?B?YTdvMFowY1ZEc1lOZnJxOE5sbldiR3VsOTFOdEcwN2FOQ001MUU4ak9CNnI0?=
 =?utf-8?B?MEp3dzhlc3Jlc09CZjV3a3U4K1hGM2I2aUg3Q3I2UUJvQlpqejBtSEJ0enpI?=
 =?utf-8?B?WW1nZjJXS0h1dUNwbW04Vks5aDdoZVhDakROa08zalNRTDljOVlIeDBJd25N?=
 =?utf-8?B?Y0l5L29aZENKcHRMc2xaRzZzTVFlVFpIa1dYVjFNYU9pR3dFajBDQWtzUHpZ?=
 =?utf-8?B?a2RuMGpTSTdFb1I1LzRPcHBQVGlOelFrc3VLVDdVLzBKTk81U29nRDdaKzFR?=
 =?utf-8?B?Rm1qNThrUnE5Nk0rTWt1U2RMalBNRm1FYjg1VUNjNjB6U2UwYjhmcE9sUFIz?=
 =?utf-8?B?dndpbWtUWkZrZlhUOFlxOUZlRy9LTnZaMmxiQ3ptcjRtaTVNTjVjdFRWZWwz?=
 =?utf-8?B?VzNMU3krbXZyWjRvYVJkbE1XeEdlWFZxQWtKSFhOWllZV2gxbzhrRWZsbXBW?=
 =?utf-8?B?UEwvb21YRkdCeHBLUGRzaDU0Um0vYit5dGo3b2Z1QVBhR0dWM2VJcGs0VlFt?=
 =?utf-8?B?TGZDaVRhOHZwZFk4WDNaQkp1c2gvRjRSMUs5VTV4Vk1QZ0tKckdyQjZSUEs5?=
 =?utf-8?B?czJxdHpNTkZLSXRPcndjVlQ3WDFkeUJVUWI0THJBVTh6RVhkdkluWGVVS0Nw?=
 =?utf-8?B?WG5BbWo4aWFDS055U1IveWhQMkVId3ZlSzNjMWRpL3M1OHpqTUduQjVNZlRL?=
 =?utf-8?B?ai83NUZUNkpLcnBjSjZ0THZnVWpNMnJDZ1YzYU51Z1I3ZldhaUxiYUVFMnpF?=
 =?utf-8?B?VHJhanZMalVLVGxVMjFTT1psN2xZbXdXVHRvcGZ4K0k0TFBGMTVYMm9DWklt?=
 =?utf-8?B?UzNXQzg0dmRjYzZxVUl5OG95WDBiQXlFd0hRbnlvZmZJbUFLUnJHTWRvOVFl?=
 =?utf-8?B?bG9SOFpEcU4zamtuZUtnMFN0UkZKMzJmckRtVEFQZDBTMWM5dVpCRHdZMlZQ?=
 =?utf-8?B?QlNUZkhOenNoL21hNitrWDg2VmtPYzBScEg0a0hYWTVEZUpNUkxBUCtpSENw?=
 =?utf-8?Q?ZJEY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8599.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3281588-a2ac-47a0-6f3e-08dd19ec7072
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 14:02:24.5379 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SI7sVZmxCbZ7mrB9h5fVBCT6u/A3oUU3stMwnOt6pHgmKwdhRh3I4YZxps677qFf2GodznMNFzWdB/FX8jZxdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9229
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

W1B1YmxpY10NCg0KPiBGcm9tOiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0Bh
bWQuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIERlY2VtYmVyIDExLCAyMDI0IDM6MTYNCj4gQW0g
MTAuMTIuMjQgdW0gMTg6NTkgc2NocmllYiBZdW54aWFuZyBMaToNCj4gPiBUcmFja2luZyB0aGUg
c3RhdGUgb2YgYSBHRU0gb2JqZWN0IGZvciBzaGFyZWQgc3RhdHMgaXMgcXVpdGUgZGlmZmljdWx0
DQo+ID4gc2luY2UgdGhlIGhhbmRsZV9jb3VudCBpcyBtYW5hZ2VkIGJlaGluZCBkcml2ZXIncyBi
YWNrLiBTbyBpbnN0ZWFkDQo+ID4gY29uc2lkZXJzIEdFTSBvYmplY3Qgc2hhcmVkIHRoZSBtb21l
bnQgaXQgaXMgZXhwb3J0ZWQgd2l0aCBmbGluayBpb2N0bC4NCj4gPiBUaGlzIG1ha2VzIGl0IHdv
cmsgdGhlIHNhbWUgdG8gdGhlIGRtYV9idWYgY2FzZS4gQWRkIGEgY2FsbGJhY2sgZm9yDQo+ID4g
ZHJpdmVycyB0byBnZXQgbm90aWZpZWQgd2hlbiBHRU0gb2JqZWN0IGlzIGJlaW5nIHNoYXJlZC4N
Cj4NCj4gRmlyc3Qgb2YgYWxsIEdFTSBmbGluayBpcyBwcmV0dHkgbXVjaCBkZXByZWNhdGVkLCB3
ZSBvbmx5IGhhdmUgaXQgZm9yIGNvbXBhdGliaWxpdHkNCj4gcmVhc29ucy4gU28gcGxlYXNlIGRv
bid0IGNoYW5nZSBhbnl0aGluZyBoZXJlLg0KPg0KPiBUaGVuIGZsaW5rIGlzIG5vdCB0aGUgb25s
eSB3YXkgdG8gY3JlYXRlIG11bHRpcGxlIGhhbmRsZXMgZm9yIGEgR0VNIG9iamVjdC4gU28gdGhp
cw0KPiBoZXJlIHdvbid0IGhhbmRsZSBhbGwgY2FzZXMuDQo+DQo+IEFuZCBmaW5hbGx5IHdlIGFs
cmVhZHkgaGF2ZSB0aGUgLm9wZW4gYW5kIC5jbG9zZSBjYWxsYmFja3MsIHdoaWNoIGFyZSBjYWxs
ZWQNCj4gd2hlbmV2ZXIgYSBoYW5kbGUgZm9yIGEgR0VNIG9iamVjdCBpcyBjcmVhdGVkL2Rlc3Ry
b3llZC4gU28gaXQgc2hvdWxkbid0IGJlDQo+IG5lY2Vzc2FyeSBpbiB0aGUgZmlyc3QgcGxhY2Uu
DQoNCkZvciB0aGUgaW1wb3J0aW5nIFZNIHRoZSBzaGFyZWQgc3RhdHMgaXMgYXV0b21hdGljYWxs
eSBjb3JyZWN0IGJ5IG9wZW4gYW5kIGNsb3NlLCBidXQgZm9yIHRoZSBleHBvcnRpbmcgVk0gd2Ug
bmVlZCB0byB1cGRhdGUgdGhlIHNoYXJlZCBzdGF0IHdoZW4gdGhlIGJ1ZmZlciBnZXRzIHNoYXJl
ZCwgc2luY2UgaXQgaXMgYWxyZWFkeSBjb3VudGVkIGFzIHByaXZhdGUgdGhlcmUuIEFzIGZhciBh
cyBJIGNvdWxkIGZpbmQsIHNlZW1zIGxpa2UgZmxpbmsgaW9jdGwgaXMgdGhlIG9ubHkgcGxhY2Ug
d2hlcmUgdGhlIGdsb2JhbCBuYW1lIGlzIGFzc2lnbmVkPyBUaGUgaW1wb3J0aW5nIHNpZGUgaGF2
ZSBtdWx0aXBsZSBwbGFjZXMgdG8gZ2V0IHRoZSBnbG9iYWwgbmFtZSwgYnV0IHRoZSBleHBvcnRl
ciBhbHdheXMgbmVlZHMgdG8gZmlyc3QgY2FsbCBmbGluayB0byBhbGxvY2F0ZSB0aGUgbnVtYmVy
IHJpZ2h0PyBTbyBob29raW5nIGludG8gZmxpbmsgYW5kIGRtYS1idWYgc2hvdWxkIGNvdmVyIHRo
ZSBiYXNlcz8NCg0KSSBjb3VsZCBwcm9iYWJseSBtYWtlIGhhbmRsZV9jb3VudCB3b3JrIHNvbWVo
b3csIGJ1dCBpdCBsb29rcyBsaWtlIGl0J3MgcmVhZCBpbiBhIGxvdCBvZiBwbGFjZXMgd2l0aG91
dCBsb2NrcyBzbyBJJ20gbm90IHN1cmUgaWYgdGhlcmUgd2lsbCBiZSBzb21lIHJhY2UgY29uZGl0
aW9ucy4NCg0KPiBSZWdhcmRzLA0KPiBDaHJpc3RpYW4uDQo+DQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBZdW54aWFuZyBMaSA8WXVueGlhbmcuTGlAYW1kLmNvbT4NCj4gPg0KPiA+IENDOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9k
cm0vZHJtX2dlbS5jICAgfCAgMyArKysNCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUu
YyB8ICAzICsrKw0KPiA+ICAgaW5jbHVkZS9kcm0vZHJtX2dlbS5oICAgICAgIHwgMTIgKysrKysr
KysrKystDQo+ID4gICAzIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYw0KPiA+IGluZGV4IGQ0YmJjNWQxMDljOGIuLjFlYWQx
MWRlMzFmNmIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYw0KPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMNCj4gPiBAQCAtODU0LDYgKzg1NCw5IEBA
IGRybV9nZW1fZmxpbmtfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwN
Cj4gPiAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyOw0KPiA+DQo+ID4gICAgICAgICAgICAg
b2JqLT5uYW1lID0gcmV0Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICBpZiAob2JqLT5mdW5jcy0+
c2hhcmVkKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgb2JqLT5mdW5jcy0+c2hhcmVkKG9iaik7
DQo+ID4gICAgIH0NCj4gPg0KPiA+ICAgICBhcmdzLT5uYW1lID0gKHVpbnQ2NF90KSBvYmotPm5h
bWU7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fcHJpbWUuYw0KPiA+IGluZGV4IDBlM2Y4YWRmMTYyZjYuLjMzNmQ5ODJk
Njk4MDcgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jDQo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jDQo+ID4gQEAgLTQwNiw2ICs0MDYsOSBA
QCBzdGF0aWMgc3RydWN0IGRtYV9idWYgKmV4cG9ydF9hbmRfcmVnaXN0ZXJfb2JqZWN0KHN0cnVj
dA0KPiBkcm1fZGV2aWNlICpkZXYsDQo+ID4gICAgIG9iai0+ZG1hX2J1ZiA9IGRtYWJ1ZjsNCj4g
PiAgICAgZ2V0X2RtYV9idWYob2JqLT5kbWFfYnVmKTsNCj4gPg0KPiA+ICsgICBpZiAob2JqLT5m
dW5jcy0+c2hhcmVkKQ0KPiA+ICsgICAgICAgICAgIG9iai0+ZnVuY3MtPnNoYXJlZChvYmopOw0K
PiA+ICsNCj4gPiAgICAgcmV0dXJuIGRtYWJ1ZjsNCj4gPiAgIH0NCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2RybS9kcm1fZ2VtLmggYi9pbmNsdWRlL2RybS9kcm1fZ2VtLmggaW5kZXgN
Cj4gPiBkYTExYzE2ZTIxMmFhLi44YzVmZmNkNDg1NzUyIDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1
ZGUvZHJtL2RybV9nZW0uaA0KPiA+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9nZW0uaA0KPiA+IEBA
IC0xMjIsNiArMTIyLDE2IEBAIHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcyB7DQo+ID4gICAg
ICAqLw0KPiA+ICAgICBzdHJ1Y3QgZG1hX2J1ZiAqKCpleHBvcnQpKHN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqb2JqLCBpbnQgZmxhZ3MpOw0KPiA+DQo+ID4gKyAgIC8qKg0KPiA+ICsgICAgKiBAc2hh
cmVkOg0KPiA+ICsgICAgKg0KPiA+ICsgICAgKiBDYWxsYmFjayB3aGVuIEdFTSBvYmplY3QgYmVj
b21lcyBzaGFyZWQsIHNlZSBhbHNvDQo+ID4gKyAgICAqIGRybV9nZW1fb2JqZWN0X2lzX3NoYXJl
ZF9mb3JfbWVtb3J5X3N0YXRzDQo+ID4gKyAgICAqDQo+ID4gKyAgICAqIFRoaXMgY2FsbGJhY2sg
aXMgb3B0aW9uYWwuDQo+ID4gKyAgICAqLw0KPiA+ICsgICB2b2lkICgqc2hhcmVkKShzdHJ1Y3Qg
ZHJtX2dlbV9vYmplY3QgKm9iaik7DQo+ID4gKw0KPiA+ICAgICAvKioNCj4gPiAgICAgICogQHBp
bjoNCj4gPiAgICAgICoNCj4gPiBAQCAtNTY4LDcgKzU3OCw3IEBAIGludCBkcm1fZ2VtX2V2aWN0
KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKTsNCj4gPiAgICAqLw0KPiA+ICAgc3RhdGljIGlu
bGluZSBib29sIGRybV9nZW1fb2JqZWN0X2lzX3NoYXJlZF9mb3JfbWVtb3J5X3N0YXRzKHN0cnVj
dA0KPiBkcm1fZ2VtX29iamVjdCAqb2JqKQ0KPiA+ICAgew0KPiA+IC0gICByZXR1cm4gKG9iai0+
aGFuZGxlX2NvdW50ID4gMSkgfHwgb2JqLT5kbWFfYnVmOw0KPiA+ICsgICByZXR1cm4gb2JqLT5u
YW1lIHx8IG9iai0+ZG1hX2J1ZjsNCj4gPiAgIH0NCj4gPg0KPiA+ICAgI2lmZGVmIENPTkZJR19M
T0NLREVQDQoNCg==
