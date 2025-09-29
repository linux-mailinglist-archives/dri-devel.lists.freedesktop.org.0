Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439A6BA8E51
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 12:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD00D10E3DD;
	Mon, 29 Sep 2025 10:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kalq+PR8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011061.outbound.protection.outlook.com
 [40.93.194.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366EB10E3DD;
 Mon, 29 Sep 2025 10:33:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQuFZTRygnhd5RSJXX2o34pBZHoqdXSTN2Q++2dGpYWp1C+0MuSltExWH45XZeT5TSgic96/3gamDKexNn+ZJVICfNHbct5t5POi4BjtvfRsIgvy19TSi6EmmSglhXT1IwFlGsR6VWYwOfZFq8cLU+z9koZvoXV2NQZFHdR77hCUB5xtyF9o7lxNapwLkuRfndtXVPyHTw7yaEMFfgx5G78Fcy1q1qyYWZxjQV2LTyMdp7w6ppu5OPs39K2MBWzDoKt7vSqZhWOV1tlp+2zLHN14ZSS4hwq/sodAbFF8+5gwhyJGitFMKv6KTM3j3iedYjcPuAChjzfFLtqtNWMx1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5aCZvL66BcX8YSkpYsZrG5E/TZw2wHrXdc9VadFAks=;
 b=sLNHyaZxFJC1UHCpyh9eVSJ3Y2ON07k32/8L21e11GctcKpFuJspXYuWz6tJNdV7nTlsEdru+FHqcofaHtUhP+iEoCCK5VPKAIhHHlLdatEjI7D2SKY2jFRuWFdJNqDQVHYGmeZd4lpS+5A9P5+OTudYiJbwUjVgYgR7b2zTWu2IyBbyFkUbbXpunIjD93hICWhzVYqccCMAqyMUjiC8XcuJoGFbl2xUn70gUmtsh9hDWVVOafGzQBH0IJBr5CKpKVdIIh7knd6e6Hw3R1Woy0EpDsgx5iC1Rb4bKeoJ7wpsaylirOpRy0xRbInwxTkeLEwU7bdfPlbMuOzq129uuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5aCZvL66BcX8YSkpYsZrG5E/TZw2wHrXdc9VadFAks=;
 b=kalq+PR8T+QrW/RI9+MlTZvc0/w35ziwiOtVrMUd+JcQN2wtBxF9li4GW5Yv1XdnU6eQ5BeLbHRaYydVGLsKYytXlkJE1XuwOzyIibHsGJ1AiSJ5Dga1q8je50+CkHbldM5YgynYD9KbGEn7ASNUlkgQVthqtCmRa39xeNho21k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM6PR12MB4138.namprd12.prod.outlook.com (2603:10b6:5:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 10:33:26 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9160.008; Mon, 29 Sep 2025
 10:33:26 +0000
Message-ID: <35328505-8e2c-48df-840d-25e1a7521442@amd.com>
Date: Mon, 29 Sep 2025 06:33:03 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/5] drm: Support post-blend color pipeline API
To: Sebastian Wick <sebastian@sebastianwick.net>,
 Daniel Stone <daniel@fooishbar.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Xaver Hugl <xaver.hugl@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alex Hung <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 victoria@system76.com, uma.shankar@intel.com, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 mcanal@igalia.com, kernel@collabora.com, daniels@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
 <20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com>
 <CAPj87rPAoD2D99zTdsvJ=9K8+G17mTS2jDYHMPYmXNtUyp2L_Q@mail.gmail.com>
 <CAFZQkGwotQ6cxVCSgp-BhUi5DaZ7MyVvbnrDJW11Z7ztzqy58g@mail.gmail.com>
 <CAPj87rMTOD3_tC70QX4xz3G4zdG=tmwt5VgPhq6jNyf8bbW49Q@mail.gmail.com>
 <269ca85a59f613568543f45867fba7e604cc9f11.camel@collabora.com>
 <CAPj87rMhsFy+uzKmNecrQG4e+BEoeX1FyEobO7bnHdQqhy1_2Q@mail.gmail.com>
 <7a25beb8-6b81-4652-b509-b6410ae1dec1@app.fastmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <7a25beb8-6b81-4652-b509-b6410ae1dec1@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR10CA0117.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::46) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM6PR12MB4138:EE_
X-MS-Office365-Filtering-Correlation-Id: 00580b76-069a-4066-4a33-08ddff439f86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUJjaExQY1lBZjlWbjI0VUlnWVBnWHkyU1lLbTYveXZEQVVNQTdTUHJnRlNV?=
 =?utf-8?B?NUJ4V0F2Vjc5UUxpb01HRU9oMk9oT1NiRWRqd1IyRVVHeGo3K1h0OUM1dDdt?=
 =?utf-8?B?N096dGhzZnRoYlI3b0drWW9OeS9yNjNuNkNRbHRiMTR5dGUxaklBR21LQlBN?=
 =?utf-8?B?KytKY3ZodTFkUE0vdmNvbkRiVTFjMVIrVUpqNW5qOUdBa1g2MVVpb01Udllx?=
 =?utf-8?B?Z2lPUWRRNTVuMTNRcGZ2MzJwdE9EV2VVdGZUOWx6QlRPK20wd2tlM0lIUmZS?=
 =?utf-8?B?Q0NCRktmVzlraVcrQ2ozaUROb1J1RnpGaTZSSVd2Mm44cExoWUVyRGZuUjBp?=
 =?utf-8?B?MTRucnp5UXhpVndmS3lidXl6b2F1SklMNkxWeDZMWDlBaERJc1FtUmJ2Ukxl?=
 =?utf-8?B?YnExdnJtY0NGOGhOR0puMDVsRlVNMHNaRDJaVTBWcnNablJTRnNkbTEzSEM3?=
 =?utf-8?B?eEdjaDdYa0djZGlSMkErWldTanBYZUY5NlpIL1VLVytIMG1WZFpYSWdqRU43?=
 =?utf-8?B?VG5uQzRtT1dwR0JoYllZSWI2WGZHbUZoTkU1RXRDaGlyQVZRUGt4TVN5UUlD?=
 =?utf-8?B?K24xMFZoOEhHYU5mUy95UFNKRWV0eXhyRkxITDN1VENEZXk1ZG5ZZE5ZdGNr?=
 =?utf-8?B?bWlxNjZhcmlhSjlENkYycktjaGlhdHNWejhaSDNmSlVrOVRoWVZYeVBPNXhE?=
 =?utf-8?B?NkFWRGV5UHN3OXhSU09xQ29Xb3AxR2VXOXRTVHFDZWhUWEhtZXpnOUhhL2ZJ?=
 =?utf-8?B?emkxL3lIanNZK3lmNVg0VWJpL0J5U3Uxbm4wK1VwOVFkaDlReC9zWFBzSEZW?=
 =?utf-8?B?MGRiMTRIQTZsNjBzU0FkTklwdGsxZm54ckRWOVI5OUFXOUpyb1JDd3hJZkdJ?=
 =?utf-8?B?eGhkRWpCeUREOFB2b0hsMWhiNjFPU1pWU0tvaUJMeEoza3BNdXV3WkFMaFpV?=
 =?utf-8?B?ekwzcUFJdE5PM1dZMU8vcVJ6Q2d5NEV5RWFZM21HRVZLTHNIeGtObUVBMW8r?=
 =?utf-8?B?OFRva0Fua0ZiOXBEUjNiZWo1a0FGRlk5Zzd3d1ZaU3o5RFhDZzV4UitzOWZj?=
 =?utf-8?B?RXdXVVl0aFNHY1lrazhJc21RaHNka2RrcVM5ei8wZG1QMWcreEU5T0Q0MmhB?=
 =?utf-8?B?RlAxRjVvSUtEdXdLSUgzZVhZdzJ3WERLNDZlN1k1aUdyd2dUVmNabmFCOEpX?=
 =?utf-8?B?MGNRSXN1UkUrSlJ3ZUs2ZG12bWNUN3Q4T3cxa0M2M2lGY2Fja3h6dmVnQnRm?=
 =?utf-8?B?YytRQk4wcHQ5U1FoZkg1dEZ2NDh3YWZObDJGVVZFaUlPbmNoaFVVODd0SDNx?=
 =?utf-8?B?RE5xYjZFOVk5elZORTRveHR3VGhkcTJEYjJweC9qclNPRUtZZEdFOHh6eXN2?=
 =?utf-8?B?ejlMUE50OUx2Wm9wZXkxZTNoVW5yeFZWR1hxQWI5SlhJYTZsNWFnaDBKdGli?=
 =?utf-8?B?N01tbDFkcTk5S1p5Zm51VDJveG8wSHlmNjVheDFvc2hNc2ljbWZYcWZmRnNX?=
 =?utf-8?B?TGdhaGRQeXMzV2VKcVBqY29UMTRkQTB0VElMelA4S1JZNFp1eWRKTFZHRmlx?=
 =?utf-8?B?WGxJQ3ZBSHBkeFZuR2xYbUtXbHBXYXRCUFhpVUtPV0N4SWxkWjdJejVqWE9Z?=
 =?utf-8?B?aVV3eDVYQXZ1L2JHWFh0dHdZV05vWWNUamFYT2ZCdU1hUTBHVmw5UDVUeTV1?=
 =?utf-8?B?MUVHbFZ5SWhvb05JMitOMDIwR3hLMVNpSlVQOHBwN2lyR0RmK3lQbndTRWtT?=
 =?utf-8?B?L1ZTRWU5dmtpZzh1dlh3dERhL0c1YWFjNUZ5c3JxUkMyeUhDYks1YW1TTktE?=
 =?utf-8?B?SFhTSEJJRmN1eXZWdWhyT21FUjJHamJVc3p1eUZkNy9YUGwxeFp3QkdvbFpV?=
 =?utf-8?B?dU02am5hZmtsdng5Z3RjV0xqT3ZqWU1FZmFkK01OeEdBYWxDNUU0WmRjU2Vp?=
 =?utf-8?Q?7c1UuYILsHqVO/CmVyAShLCa38GTmAds?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHNYbzRZdUxOTHNpYk5xM1FTUFkrTXVXNHpRUGl0cm9Qb0xyWGVIdjd3QjJG?=
 =?utf-8?B?QXBITnpsQktPbkdXUSt3S0ZoWXpma1Q3NG9LbG14Z0N1WWFjd2FwRnF0YjJP?=
 =?utf-8?B?ZWVUNkp1RzZEM1c2cHZTa1g0QmhCVzU3NGVOQUhsai90dGZHOHBBR2kvS2xD?=
 =?utf-8?B?Skp2MDA4R05FVHltRHFwNWx6UDVpY0Z1MVl2OTJTWDhnV3dFU1JxT1ZzNlFs?=
 =?utf-8?B?S09YM0xZWGMwOVRBZzhsWllzclU2bkhzMzVmUVBUeHVvU2dXNWx5bEcxMHJJ?=
 =?utf-8?B?L2l4Z2hSNW5aalpKZEZ6VjJSSjB0dnJxdS9IeWJzZmM5QzZ4YjB4dzBJN041?=
 =?utf-8?B?MHZSRnRCTmJkbjc3aWxGcE5HR0VzOC94Q3BQNEE3MmhFSHg3YXJsSkxjZ2k0?=
 =?utf-8?B?cUxXdXBEejI1YlNPSGVzT25rNjl3dzVLaEdGeTVkRXBZRXc0aEliNjlaWWFC?=
 =?utf-8?B?RmpHbHlFU011Tjh0WkYyMEMxeDJUT0puRFV5Z0JieERIRU1FcXFBVlVTeUlh?=
 =?utf-8?B?eHBUZS9TTVdHTEZrcHh0UlVDazRaTjBoWUczcWVDQnBZM2VtOVNHSGl1cnVs?=
 =?utf-8?B?ZVdnTlNDaUFWdnpSdEFWMXZVZWt5YUNLbkRxQ0VYNlJ5ekRES0FjZXpFa2VL?=
 =?utf-8?B?NE9YcjVWVlArTlFwc01EWGhIMjFKaXNmbXMzT1RNeEliNEpLNFZENm4vZTJl?=
 =?utf-8?B?UWhHaWxNU0dZM016WFBOZHlScjRDdjZWV1psN2x1UmlNRDBHRVRGOGp5MHJB?=
 =?utf-8?B?a21zeFlRd0F1UzNDQlk2amI5aUExYXpoZHpyMnN5ZTVoYjQ5M1pCOTNlVTdU?=
 =?utf-8?B?Tis3Zk1LWCtCSldVWXBNN1ZsSE9qUThWYTFjWTJ1dzBjK1VucjY5Sm9hM1Bx?=
 =?utf-8?B?MzEydHRvcTk2d29NNWsxRzJ3aCs2VTRLaVgyUk5jVHhpUmVBZWRHeEVBM3NV?=
 =?utf-8?B?WTFSZERpME9kR09BTytvS0ZhdzlsTjRDMTJQcEJ1dHVNRytiTVVNK3ZqSW5P?=
 =?utf-8?B?ZFAzVC96VnllenZCTU1iZUMxM1RwdjhqU3NQb0lId0dTZGU0VmpGQUJyN3lV?=
 =?utf-8?B?N2d2SXJ6QW1ydUFmbThndmE2RHpudXF5M01DeU1oQ3ljRTdhL0YzSU85Ti9Y?=
 =?utf-8?B?OTFtMGluWDFVNGkzditOTkRZYm5HNklrRWlsMWEwVDZjZFZmVkhxZXBLbWFv?=
 =?utf-8?B?WFp5Zm13YkRJUjhKMjlsTFA2Q3o2WE5ad1dtQUNNYW13NWdFS2ZrTGREaldl?=
 =?utf-8?B?bzk2U204VVVBZndPVWZQQXlyTmdqNXVZcmN3UVNKN3hvWHJpMDVMTVRLblBP?=
 =?utf-8?B?RWJvZ1dzb0p0RmQ0L0NaQ0svLzh0MFNUQUhYTmJySkFYWWhGeGVKOVNtVmFi?=
 =?utf-8?B?VVRacDYrWGptQ3ErTHlSM1c4dVFVNVo2UTJ3RGlkanlqb1JVeHhjNzVVTHQx?=
 =?utf-8?B?T3lPUStkektRZTdkeWZtbVNZNk9MVjd6bDk5UVdPNkgxZXBoenBUdjRSMmJm?=
 =?utf-8?B?V0cvRFI2TDNZeHFwN0o5b1Jaa2l2RU5DeEhINDRkNUd6SFdmUzdSMTQ3d3Jj?=
 =?utf-8?B?MkptdjVadFBVRjNTbUxQT0EwbGlJWXhPNWc5SW5KTkoxVnRDNFdPZ2RZdWZr?=
 =?utf-8?B?QWtTRU8ySWtOMFFSNjdKNmVRdFQyYnEyZzQ3VUZLYjJ2YmdweVBPdVQ1ditj?=
 =?utf-8?B?NzBTcXZiZHgxMFdQKzdaR3pncThLOHNjeHZBU0g0R2FoMWJBaEpTZVF1YkYx?=
 =?utf-8?B?MnV5TmY4U2pGcFNLSWh1eHNYVVljaGE1Z3pmckN5OHRWNU5XVXpYSExxZDNw?=
 =?utf-8?B?aXY1M3ZnclhJdUJMQ2MwU0I0RVhMWVg5WTRKekh6bE0ycHowdlA2eW9scHpu?=
 =?utf-8?B?NWhTSVY3T2FKOGh2QUh4T0VNcWJXT1A4d09WemRoNW9IVWR5KzdOKzIvY04y?=
 =?utf-8?B?L2lCMU1QQTQwNjNLUGRRU3JXZ25WSDdNTE9hWEFSSENPWFR5Vkw4NVVUeEVL?=
 =?utf-8?B?eDdjUHhGRXJrclg4cDJEQW5TQ3dkdzFoR1Z0TDNxU3FNWlZYNWJOTm1PK2FO?=
 =?utf-8?B?cm5pVE9Bc2p2OEZhWnFiUXdZdjJlQkJKcnA5UlRWbHJibVRaN0U0bTljZEs0?=
 =?utf-8?B?Wk9yU1JzVjFWaSszZTc1aDNyTHNkeldidERtNzd1Z3IrVTBGNnVxbkk4RlJ4?=
 =?utf-8?Q?tbzxZrbTzB/M2ynhtkwlzoE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00580b76-069a-4066-4a33-08ddff439f86
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 10:33:26.4149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UDJzDCjc4KGcg+HbCUm42iLtFOEaH65ljW5OZ7cpLJ67sZ2G+mFgIUHXGIYbp0/GVqBkYcLcCpAvJ9PfCcj4fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4138
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



On 2025-09-26 09:51, Sebastian Wick wrote:
> (Sorry for re-sending; used a web mail client which send html)
> 
> On Mon, Sep 15, 2025, at 2:31 PM, Daniel Stone wrote:
>> Hi Nícolas,
>>
>> On Wed, 3 Sept 2025 at 19:43, Nícolas F. R. A. Prado
>> <nfraprado@collabora.com> wrote:
>>> On Tue, 2025-08-26 at 13:25 +0100, Daniel Stone wrote:
>>> Based on this discussion, this is my understanding for the changes
>>> desired on the series and their reasonings:
>>>
>>> 1. Add a driver cap, DRM_CAP_POST_BLEND_COLOR_PIPELINE, which drivers
>>> will use to signal they support post-blend color pipelines.
>>>    - Reason: Allow userspace to figure out that the driver doesn't
>>> support post-blend color pipelines and choose to not set the client
>>> cap, DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE, so it can use legacy
>>> color management instead.
>>> 2. Make it so setting the client cap,
>>> DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE, fails if the driver cap,
>>> DRM_CAP_POST_BLEND_COLOR_PIPELINE, isn't set
>>>    - Reason: Prevent userspace from making color management unusable if
>>> the driver doesn't support post-blend color pipelines, as the legacy
>>> color-management properties (GAMMA_LUT, DEGAMMA_LUT, CTM) would be
>>> unwriteable with the client cap set.
>>
>> Definitely.
>>
>>> 3. Make legacy color-management properties (GAMMA_LUT, DEGAMMA_LUT,
>>> CTM) read-only if the client cap,
>>> DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE, is set
>>>    - Reason: Allow drm_info to print legacy color management
>>> configuration while still enabling post-blend color pipelines through
>>> the client cap. Also to allow smooth handover from pre-colorop
>>> userspace client to colorop-ready userspace client, as the latter can
>>> now replicate the legacy color configuration through the colorops.
>>
>> I think yes, but I don't really feel strongly about this. If others
>> involved have stronger opinions, I'm happy to yield.
> 
> So I'm going to argue that making the properties read-only or read-write is useless.
> 
> The only case where knowing the color pipeline of the previous user would be useful is if you want to re-use the framebuffer of said user. Otherwise, the color pipeline and the generated framebuffer have to somehow just match to produce the desired output and that does not require any previous state, making the legacy properties useless.
> 
> If we genuinely believe that this is something to be supported, then my question is why the new color pipeline should not be able to accurate reflect the state of the previous user, even if they used the legacy props?
> 
> The hardware was able to get into some state based on the legacy props, so it will be able to get into the same state with the color pipeline props; it's "just" a matter of exposing the right pipeline.
> 
> If we are not able to accurate reflect the previous state with the pipeline props, then use space will see inconsistent state between the legacy and color pipeline props. Which state is the right one? We cannot know. The previous user could have used either one. So having the legacy props does not help because we don't know if we should use them or the pipeline state.
> 
> So, I would argue that we should *remove* the legacy props if DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE is set. If the handover is relevant for a driver, they should ensure the legacy props state translates to the correct color pipeline state.

I tend to agree. The DRM driver cap seems to complicate the handling for 
userspace and drivers, which makes the whole mechanism more fragile, all 
to work around a commonly known short-coming of DRM/KMS, which is the 
default state problem when transitioning between userspace clients.

Harry

> 
>>> Side note: Smooth handover back to pre-colorop userspace after tweaking
>>> the colorops to something else would not be possible without making the
>>> legacy properties writable too, so that the client could update them to
>>> match the colorops setting before switching back. I don't imagine this
>>> would be a common use case, and colorops are a superset of the legacy
>>> properties so there are cases where it wouldn't even be possible to
>>> replicate the colorop setting on the legacy properties, but thought I'd
>>> mention this limitation for completeness' sake.
>>
>> That's a totally acceptable tradeoff. We don't have a standard
>> inter-client capability handshake, so if downgrading from a
>> newer/more-capable to an older/less-capable client is a bit janky,
>> that's OK. There's only so much we can do given the original design
>> decision for the KMS core to not be opinionated about a 'golden state'
>> that could be used as a reference for userspace to work from as a
>> base.
>>
>>> Also, as Xaver noted, this feedback also applies to pre-blend pipelines
>>> and its legacy color-management properties (COLOR_ENCODING,
>>> COLOR_RANGE), so the same changes would be desirable there for the same
>>> reasons. So we should share this feedback on that series as well.
>>
>> Yep.
>>
>> Cheers,
>> Daniel
>>

