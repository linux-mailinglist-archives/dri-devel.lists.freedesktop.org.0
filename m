Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1C89EE840
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 15:04:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070E010E22F;
	Thu, 12 Dec 2024 14:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qqT2XJqj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::61c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00F810E02B;
 Thu, 12 Dec 2024 14:04:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTFYW4fymKvOmaOZW43rUlC7YiAdiyuQ58eLDbybeofDHfBVKhTCm1iJ4dIwgXqHeYKmXBDRT4jpl2Mn3lj4G2gOWXs+oNWZLK8vfSojcOfnQR0g7ywNgQVMhGZtCRZYyFpsujx66bVCbnnSigaAyAh6Nth+Ek1H8eQkVkQ4YZBp20OEEhL3f+JeR+ebczE+TFPSVwd4yGICbzapN7U4Dy9mWEZi4jyaZcZMH9USM82sp9YJlpTYTwpOMxFYcO5BeCLkPFvFHWIfXOFXEEb0yxg6ar6fSjUxwjCeON7lUiB58C/ZCz189bx5B722wctI81FwTztqVfcTJutAXcIQbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJkNJyApnGv3MleTwq2iLfB/F+O3F1I3khqRnPSAQVo=;
 b=lp7YatlhT3WM3l/v/ej9ZVO+PurFJ/8nB0yABwpWZZRGJxqYQWTulXO7Fbd8ZZfQc/JlRqKgZsQ8GKcOXCnm2iC8DASRO1oGXWwJk5GBvEfT9mp72YW0Njkqyt1mIxqgJ6AYz8lzVAdh7rhJAExIfbwNbsfyb+fh32dDDNTtVQ1tM0zwa46M3KRMUk2eXsIgx77eDFmPqR+XuoIrzqKY1i2rLuQ8449tc3oQ+MJGP8dxHJn5e2dq4itMWLXNoNnRGQBn99mUN5tc5Vwj7Mf2Sl6ZE2jCo64rqb4tvKYaaKnOdDXF4FBAHMJGeTcaEL3mJKZp9GEYOSvpwOLEnYrJeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJkNJyApnGv3MleTwq2iLfB/F+O3F1I3khqRnPSAQVo=;
 b=qqT2XJqjlGg27roHQ7LBJfIxKeyj/ohAIVfUwNVSrO38i3ZdmtnaHRRRemtM91gt3aIzbC6kjidNa5DRxHh6qWdSz0eU7Yvalcg8YQ8BlQv4OH5ofw79J7KXSgxbXkCxKjVWET4R93j+vO7nvxAxgrLvX60kT3T27HlAFb3TjUo=
Received: from SA1PR12MB8599.namprd12.prod.outlook.com (2603:10b6:806:254::7)
 by SJ0PR12MB7083.namprd12.prod.outlook.com (2603:10b6:a03:4ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 14:04:16 +0000
Received: from SA1PR12MB8599.namprd12.prod.outlook.com
 ([fe80::25da:4b98:9743:616b]) by SA1PR12MB8599.namprd12.prod.outlook.com
 ([fe80::25da:4b98:9743:616b%6]) with mapi id 15.20.8251.015; Thu, 12 Dec 2024
 14:04:16 +0000
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
Thread-Index: AQHbSy1d2oBDuua+lUe3Pyt6olRLiLLgs3MAgABeW/CAABNdgIAAEZEggAEiYICAAEpmcA==
Date: Thu, 12 Dec 2024 14:04:16 +0000
Message-ID: <SA1PR12MB8599790B4D062F061684CB92ED3F2@SA1PR12MB8599.namprd12.prod.outlook.com>
References: <20241210175939.2498-1-Yunxiang.Li@amd.com>
 <20241210175939.2498-5-Yunxiang.Li@amd.com>
 <674b6d62-2274-4b0d-8d27-382faad5de88@amd.com>
 <SA1PR12MB859965C4B7EEB4B131E8C7E6ED3E2@SA1PR12MB8599.namprd12.prod.outlook.com>
 <8e514b7b-7826-4870-921a-ab6dac9a65c2@amd.com>
 <SA1PR12MB8599C134256BC6E17AD66070ED3E2@SA1PR12MB8599.namprd12.prod.outlook.com>
 <b402ba4a-fc8b-43c9-aabb-b6e482565331@amd.com>
In-Reply-To: <b402ba4a-fc8b-43c9-aabb-b6e482565331@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=6a49d694-015c-40d5-a93d-90055ef0d09b;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2024-12-12T14:01:59Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8599:EE_|SJ0PR12MB7083:EE_
x-ms-office365-filtering-correlation-id: b9e81203-4059-4c63-2226-08dd1ab5ddb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YURKVDM4YlJoMjRCbWlWOHJwWENDNGFCNzdTSW4zMEZOMWp0bHFkckZ5dEtq?=
 =?utf-8?B?dkF1Z1hzU0RnRnU4S3hYYUkrVG45YUQxTlRjMWszREpRSFQ2amVQY05ON29w?=
 =?utf-8?B?NWs2NFV0Ri9vK0xNQ0hFMkpZR1hzamNybzhkV1FIclNxeG1lWVROQmY4WHd1?=
 =?utf-8?B?ZjVxOTN4Sjc3YUFvMm5wT3lmN2FJRmpGT2UvZ0ZjNk5sMmdvc0VaSUV3SXkr?=
 =?utf-8?B?WHhoVUh4RFJZYmQrd2RUOEZpQjhZRXI3a0c2a2RLUTZ3VGR0VWtqNVNOZmZW?=
 =?utf-8?B?QWVJbW9QUzhQRThIZVg5alBiM0hqbGV0bjBkVUZuVjA3T3ZIQVB6WFpQLzlI?=
 =?utf-8?B?VzlscmlUMnpBU0FHaERxQTc1d0dwVkdkSzBBVFFzOTFsNTVSUXF4eGptU3di?=
 =?utf-8?B?Y1lJcDVTRTBlN2ppQVF3OTQ5Rk9BQ1U2T0RQeE9BU1U0NGs2R21IUTVJZlpY?=
 =?utf-8?B?c0R6MlA3dFBOcitRVHhtNTdhVVNyWDFUZW0vbExPL2hGdUo1bVNmbjZFUHhM?=
 =?utf-8?B?R01GVnNJaGdMcWxQSGtvZXBjUW0wS2xOQzhaKzdmYlNJaDRQdThpcWZRNVVr?=
 =?utf-8?B?QkxuZHJNa2VoK1FTeDBXWEdvRlg3OSt1OUdLWDVOeVhaZlgrT2YrNjFTQzZ6?=
 =?utf-8?B?YWtVaWNIOWwzYy9jZngwdmR6a3RoSG9hbWZ6V1FWd1c4dVBnRzMxZ3RvdGlj?=
 =?utf-8?B?MFJtbW4rTTJUdUZITWs5dGZwNXhHVXBKRTlEUFAwT0pPeWd2cC9MQ3lkUzZH?=
 =?utf-8?B?aDBKU0I2bHRkZXVSaFc3aml1OFYreStpTlRENzkyZHpVVll5TFNwUEZhczFR?=
 =?utf-8?B?TDZCZHkycyszckF4alkzRzgvMGZqVVZsNW1ZbTM1VG1lNW5uU3AwaS8xVjY4?=
 =?utf-8?B?akdJdm5ZUjhIZ3F3RnNVWUJ5R2tibWpuRG0vOFA3ZUtnZDNLZDJiNGtyci9q?=
 =?utf-8?B?dENvbzRxTjFHQmo1MUVGTzkxK2ZCdVZPTmpJWitEVlJEQVJiK0RmSU4ycXMr?=
 =?utf-8?B?TW1seGpJU0dVUlFDT0lMYUI0WW53a1Z1a1EwZnQrUDd1SkpmRGNKeHF6a3RC?=
 =?utf-8?B?UUxCazdCTTlUUWR2QzRUZEVWL2xIb1lzZG1tNGhEV2p2dzR2bWtFSS9ZY1Zp?=
 =?utf-8?B?NlJXVVpkelJVdkRxdHR3TW1RTXBTNWVjOWRRTHl1cFpEZVV3WjhVaW1wci9G?=
 =?utf-8?B?Qm10UUtWa1YrU0NyZnlxYXNiUUt4VjRaVzdqVTQ5R0dRTmZrS1VYeFJkV3dk?=
 =?utf-8?B?aU9zUmgyMnVBN3p4TVZiVXVyZW0yS0pDRTBtcjRKbEgwUWdJM09OYlJXc1V5?=
 =?utf-8?B?UURTdXYwRlhkSzh3TjliQTNmSXlBUHFoSFVpdE5pQnBwUzFyL2o1b1ZQZ0F2?=
 =?utf-8?B?dDY0TkVkcWRKZitnVEQxUit3d3drcXFIdGlhZE51em5WcUpwbTZZbUlVN3Ex?=
 =?utf-8?B?czU0ZitsN0hUakhvZFBaVmZYSWU2ZitnYU44TXFxbXV6MTZpaSsxbmxzbDky?=
 =?utf-8?B?Vk02TjJuMk1aQWlieThQanREN280SU9SaUFwd2lwd0xyZHBiZW5oRytpOURN?=
 =?utf-8?B?dnRzdXExMkY5MC9DVUtkWk9DbTJFelVob1prbkVsTzkyWVZiNjY2Z214NG9s?=
 =?utf-8?B?VytGUlh1elIvVUtmLy9nNFV1eTUzVWRiZGxkbm9HS0VSeXNzU1ZkWmhHRmRT?=
 =?utf-8?B?enRqTG1NdnYzSTBmdUROWnRnR1ZOWk9SakdMdU51d0pVRkFXNVkrcnkyM1FB?=
 =?utf-8?B?dkFYOGhJT3Jtck1aUSthQVhiTnAzNk1aK1BQZ3k2RFZmSUllZ2lrNEZhUEx1?=
 =?utf-8?B?TzBtUGxJTmNHQklFOFlNY2N3c2drSW9PVHZsVFhZT1dZaU5PK1F3QVZ1N1NB?=
 =?utf-8?B?ZmwzZitHc1FlVTBiMTA5MGl5ZGMvd1Jpb1dPeG01Z0ZFNFE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8599.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WXJkZmcveHhVTGF2dmMyd2NGZnVhNVRlcUUyMWhiZWpTMktwMktpMXlPU2wz?=
 =?utf-8?B?Ny80VW5zUFBBTkkxU1Q3ZUU5QVVNaEUxWHh5SFRibWNSMURuOGcvUEVsd21O?=
 =?utf-8?B?Z0JIVzdsS3V5emsxVjY3V213OGtRYTJnR1cyN0NYL2dyZnVxVVBPd3AyVi9q?=
 =?utf-8?B?QUJsMzNhSUFYdkZUUUJ6OFRuT0JldHRSR2liU0dkbzdjbjNEL2c5SE1qdmJ1?=
 =?utf-8?B?NUJnbUNUY0NNdXhiRlVrTmxLRVo0VWZCOU4vandwZmpTcW5lWW5zendsZVR1?=
 =?utf-8?B?RVBUS3BlZVpGZ1RCK2ViYXY3ZFdMeXRmaThTdmlSanp1NWJ6dno5SitBNzBj?=
 =?utf-8?B?NnZNZGtucWJUM3dpc2p5WTFkRVhKSHZLZU02VzFTblE2SlBqL0lIUFBQWEZE?=
 =?utf-8?B?a0RKYUJ1ekd0OGYrZ3lpQmtlUTIwM1d2UXBEMktlb0VhUERJZXJvMjJkWWdj?=
 =?utf-8?B?KzJEZG1VRkJuNnczbTlVS2ZJd2crUFJZOEhYMGpIbEd1Tmd6T0RlR3pmWEpV?=
 =?utf-8?B?bXA2Wko4OEhJa2RDL1BxUU9UdjR2T1MvblFFV0ZyVTlaeDFxSzBZSnMrY0Rn?=
 =?utf-8?B?Ny8zdlp4ZVIzTE1ZMEFUaldRWWNjSE5BOElINml1c0N6TU9yL0N5VkVaMGJ3?=
 =?utf-8?B?UU43c3MwVktsUFluQzNHVVF5Y1pHWUVsTWNFOEtwTmpZU2k0bWFLMGlZbStX?=
 =?utf-8?B?TFZyWWNMTlBraFBpaFJYenFWZ2hOaDRpcGFuTWxOa0pDVmRGOGRaWVFJRDV1?=
 =?utf-8?B?TGU3TG1Sc3VJVFJrdVU2S3pRQXdNUW9OVmZRRnRFMmpCTHpsdFZ4bDIzMDZp?=
 =?utf-8?B?Y09jc1Z3aFNDRzg3aGV2WlpkZ3FpczN3TVBqQTJWcmlQQUw0bU9ZKzRLWHBx?=
 =?utf-8?B?NGRDNGltTmZTdTM2ZDdQQWhtdm9PRzdvZkd2SDAvTmpRbVVFZFBvQVVoMzRr?=
 =?utf-8?B?Sy9ydGw0Z3h1QTJ2dkNjYmhsc0VFYzRNV2pCZThDcUd0cGpIc29sbmk1ZUFk?=
 =?utf-8?B?cndIYWtKODhVQ202UjhKaVk4ZWRMVi9XR0xmZENTNWRtclNEVXdvRkhzYWFD?=
 =?utf-8?B?VFlNQ3F1Ukd2dnNPeFVadFl3ZUFqOXdoNEVzcmhqNjh0U1lvU0JFSkxiL2lL?=
 =?utf-8?B?dnhvRUdtSGJnTlk5Q1dSRitLK0RLNnRITnd2a29SdVA3V1RIL01Ta3JDdlow?=
 =?utf-8?B?NVplSUhPSUptcTNaSGtIVk5OR3BDUXU1OUMwUzVaMmZrZk9BVkhsWHh3S3ps?=
 =?utf-8?B?ckhCU1hvOVlmenRzSUVOalVXREJIRXpKMCtEalRDOXpsTFBsTXdVUDN1RGx4?=
 =?utf-8?B?cDJrQUl5UHdUWTRMK215cWdiYk00VXNLSDBCZzJpZmRnVllmMVp2ckpNbytU?=
 =?utf-8?B?VWRTYUpkRjZadUdRMy80aUovR2F3VGVmYkdUWWVLOU5oLzZwanlIWTJJUFdY?=
 =?utf-8?B?OUlBeTVPK3g3WUUrcGNwRCtnYU5adVB1RkpWNXpyczJRL0hXVWQvc3Q5V2cy?=
 =?utf-8?B?bitFTENhUFhSSDJMNFVNQSs1YXBFRnRsTkF5K0swMkVLc0NVOGZVbmhLcXRF?=
 =?utf-8?B?T2Z0cWNxNUV0K2wveDJ0QTVMVWtLb0x1eEhnL3BnQVZiN25ieGNLR1FXSUxC?=
 =?utf-8?B?ZExLeHNBblE4ekloYXhaU0pKTzlzWDVVYlFyTkVqdVJDUS9PaU1XaThaTlJ6?=
 =?utf-8?B?VFRyc3VKRjk0Z1hMRlIvSENncVFyNlhzQkJmN21xVS9pNk1icDYxSE5NWEtK?=
 =?utf-8?B?akNLWW1Bd0d1Sm5qamdkUkxpSktEd1dBTU9LYXNRWkRNa1FwK1U4SGdxbDh6?=
 =?utf-8?B?VEJjeUZHRlAzejd4YXprNEdlOUNpVnk3dFRXRTFXSkM2WHRmd2Q5Tjdlb0Ra?=
 =?utf-8?B?TVE2RVhHcm9kbE1zWk9mNjI1ZVBSbGRuWG80ekVzbzFjQ2JMRkZMaWFzNTBz?=
 =?utf-8?B?WlpwM056Rm1RZk5CVlc0WHpYLzJCeGI1SHQvVFNwSjBqQjRqR2tQMjcwdXdx?=
 =?utf-8?B?eEd3YmVoVEJDd0RaaG5oSmtUUmxXNXY0VE5xNCtWbnZqVk16OUNLdXBVRmtq?=
 =?utf-8?B?ZHU1VG9ycDFidHE5L1VML3BJcHhhbWxHSlByZGFtMjBRNlhXdUoxR0V2aWxM?=
 =?utf-8?Q?Kap4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8599.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e81203-4059-4c63-2226-08dd1ab5ddb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 14:04:16.7216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jN63uvkDx8kr8OL8IhqxUZ0B8Feovtp9gyf90ueREoJdrX7t+DhDa/gBCLpLvyZNsUBxGv5pEkTOgabzVgRwFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7083
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
bWQuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgRGVjZW1iZXIgMTIsIDIwMjQgNDoyNQ0KPiBBbSAx
MS4xMi4yNCB1bSAxNzoxNCBzY2hyaWViIExpLCBZdW54aWFuZyAoVGVkZHkpOg0KPiA+IFtQdWJs
aWNdDQo+ID4NCj4gPj4gRnJvbTogS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdA
YW1kLmNvbT4NCj4gPj4gU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciAxMSwgMjAyNCAxMDowMyBB
bSAxMS4xMi4yNCB1bSAxNTowMiBzY2hyaWViDQo+ID4+IExpLCBZdW54aWFuZyAoVGVkZHkpOg0K
PiA+Pj4gW1B1YmxpY10NCj4gPj4+DQo+ID4+Pj4gRnJvbTogS29lbmlnLCBDaHJpc3RpYW4gPENo
cmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4NCj4gPj4+PiBTZW50OiBXZWRuZXNkYXksIERlY2VtYmVy
IDExLCAyMDI0IDM6MTYgQW0gMTAuMTIuMjQgdW0gMTg6NTkNCj4gPj4+PiBzY2hyaWViIFl1bnhp
YW5nIExpOg0KPiA+Pj4+PiBUcmFja2luZyB0aGUgc3RhdGUgb2YgYSBHRU0gb2JqZWN0IGZvciBz
aGFyZWQgc3RhdHMgaXMgcXVpdGUNCj4gPj4+Pj4gZGlmZmljdWx0IHNpbmNlIHRoZSBoYW5kbGVf
Y291bnQgaXMgbWFuYWdlZCBiZWhpbmQgZHJpdmVyJ3MgYmFjay4NCj4gPj4+Pj4gU28gaW5zdGVh
ZCBjb25zaWRlcnMgR0VNIG9iamVjdCBzaGFyZWQgdGhlIG1vbWVudCBpdCBpcyBleHBvcnRlZCB3
aXRoIGZsaW5rDQo+IGlvY3RsLg0KPiA+Pj4+PiBUaGlzIG1ha2VzIGl0IHdvcmsgdGhlIHNhbWUg
dG8gdGhlIGRtYV9idWYgY2FzZS4gQWRkIGEgY2FsbGJhY2sNCj4gPj4+Pj4gZm9yIGRyaXZlcnMg
dG8gZ2V0IG5vdGlmaWVkIHdoZW4gR0VNIG9iamVjdCBpcyBiZWluZyBzaGFyZWQuDQo+ID4+Pj4g
Rmlyc3Qgb2YgYWxsIEdFTSBmbGluayBpcyBwcmV0dHkgbXVjaCBkZXByZWNhdGVkLCB3ZSBvbmx5
IGhhdmUgaXQNCj4gPj4+PiBmb3IgY29tcGF0aWJpbGl0eSByZWFzb25zLiBTbyBwbGVhc2UgZG9u
J3QgY2hhbmdlIGFueXRoaW5nIGhlcmUuDQo+ID4+Pj4NCj4gPj4+PiBUaGVuIGZsaW5rIGlzIG5v
dCB0aGUgb25seSB3YXkgdG8gY3JlYXRlIG11bHRpcGxlIGhhbmRsZXMgZm9yIGEgR0VNDQo+ID4+
Pj4gb2JqZWN0LiBTbyB0aGlzIGhlcmUgd29uJ3QgaGFuZGxlIGFsbCBjYXNlcy4NCj4gPj4+Pg0K
PiA+Pj4+IEFuZCBmaW5hbGx5IHdlIGFscmVhZHkgaGF2ZSB0aGUgLm9wZW4gYW5kIC5jbG9zZSBj
YWxsYmFja3MsIHdoaWNoDQo+ID4+Pj4gYXJlIGNhbGxlZCB3aGVuZXZlciBhIGhhbmRsZSBmb3Ig
YSBHRU0gb2JqZWN0IGlzIGNyZWF0ZWQvZGVzdHJveWVkLg0KPiA+Pj4+IFNvIGl0IHNob3VsZG4n
dCBiZSBuZWNlc3NhcnkgaW4gdGhlIGZpcnN0IHBsYWNlLg0KPiA+Pj4gRm9yIHRoZSBpbXBvcnRp
bmcgVk0gdGhlIHNoYXJlZCBzdGF0cyBpcyBhdXRvbWF0aWNhbGx5IGNvcnJlY3QgYnkNCj4gPj4+
IG9wZW4gYW5kIGNsb3NlLA0KPiA+PiBidXQgZm9yIHRoZSBleHBvcnRpbmcgVk0gd2UgbmVlZCB0
byB1cGRhdGUgdGhlIHNoYXJlZCBzdGF0IHdoZW4gdGhlDQo+ID4+IGJ1ZmZlciBnZXRzIHNoYXJl
ZCwgc2luY2UgaXQgaXMgYWxyZWFkeSBjb3VudGVkIGFzIHByaXZhdGUgdGhlcmUuIEFzDQo+ID4+
IGZhciBhcyBJIGNvdWxkIGZpbmQsIHNlZW1zIGxpa2UgZmxpbmsgaW9jdGwgaXMgdGhlIG9ubHkg
cGxhY2Ugd2hlcmUNCj4gPj4gdGhlIGdsb2JhbCBuYW1lIGlzIGFzc2lnbmVkPyBUaGUgaW1wb3J0
aW5nIHNpZGUgaGF2ZSBtdWx0aXBsZSBwbGFjZXMNCj4gPj4gdG8gZ2V0IHRoZSBnbG9iYWwgbmFt
ZSwgYnV0IHRoZSBleHBvcnRlciBhbHdheXMgbmVlZHMgdG8gZmlyc3QgY2FsbA0KPiA+PiBmbGlu
ayB0byBhbGxvY2F0ZSB0aGUgbnVtYmVyIHJpZ2h0PyBTbyBob29raW5nIGludG8gZmxpbmsgYW5k
IGRtYS1idWYgc2hvdWxkIGNvdmVyDQo+IHRoZSBiYXNlcz8NCj4gPj4NCj4gPj4gSXQncyBpcnJl
bGV2YW50IHdoZXJlIHRoZSBnbG9iYWwgbmFtZSBpcyBhc3NpZ25lZC4gVGhlIHByb2JsZW0gaXMN
Cj4gPj4gdGhhdCB0aGVyZSBhcmUgbW9yZSB3YXlzIHRvIGNyZWF0ZSBhIG5ldyBoYW5kbGUgZm9y
IGEgR0VNIG9iamVjdCB0aGFuIGp1c3QgZmxpbmsNCj4gYW5kIERNQS1idWYuDQo+ID4+DQo+ID4+
IEZvciBleGFtcGxlIHlvdSBjYW4ganVzdCBhc2sgYSBmcmFtZWJ1ZmZlciB0byBnaXZlIHlvdSBh
IEdFTSBoYW5kbGUNCj4gPj4gZm9yIHRoZSBjdXJyZW50bHkgZGlzcGxheWVkIGJ1ZmZlci4gU2Vl
IHRoZSBjYWxsIHRvDQo+ID4+IGRybV9nZW1faGFuZGxlX2NyZWF0ZSgpIGluIGRybV9tb2RlX2dl
dGZiMl9pb2N0bCgpLg0KPiA+Pg0KPiA+PiBXaGVuIHlvdSBtYWtlIHRoaXMgY2hhbmdlIGhlcmUg
dGhlbiB0aG9zZSBHRU0gaGFuZGxlcyBhcmUgbm90DQo+ID4+IGNvbnNpZGVyZWQgc2hhcmVkIGFu
eSBtb3JlIGV2ZW4gaWYgdGhleSBhcmUgYW5kIHlvdSBzb29uZXIgb3IgbGF0ZXINCj4gPj4gcnVu
IGludG8gd2FybmluZ3Mgb24gVk0gZGVzdHJ1Y3Rpb24uDQo+ID4+DQo+ID4+PiBJIGNvdWxkIHBy
b2JhYmx5IG1ha2UgaGFuZGxlX2NvdW50IHdvcmsgc29tZWhvdywgYnV0IGl0IGxvb2tzIGxpa2UN
Cj4gPj4+IGl0J3MgcmVhZCBpbiBhDQo+ID4+IGxvdCBvZiBwbGFjZXMgd2l0aG91dCBsb2NrcyBz
byBJJ20gbm90IHN1cmUgaWYgdGhlcmUgd2lsbCBiZSBzb21lIHJhY2UgY29uZGl0aW9ucy4NCj4g
Pj4NCj4gPj4gVGhlIGhhbmRsZSBjb3VudCBpcyBwcm90ZWN0ZWQgYnkgdGhlIG9iamVjdF9uYW1l
X2xvY2sgb2YgdGhlIGRldmljZS4NCj4gPj4gVGhlDQo+ID4+IGRybV9nZW1fb2JqZWN0X2lzX3No
YXJlZF9mb3JfbWVtb3J5X3N0YXRzKCkgZnVuY3Rpb24gaXMgcHJldHR5IG11Y2gNCj4gPj4gdGhl
IG9ubHkgY2FzZSB3aGVyZSB3ZSByZWFkIHRoZSB2YWx1ZSB3aXRob3V0IGhvbGRpbmcgdGhlIGxv
Y2sgc2luY2UNCj4gPj4gdGhhdCBpcyB1c2VkIG9ubHkgb3Bwb3J0dW5pc3RpY2FsbHkuDQo+ID4+
DQo+ID4+IFdoYXQgeW91IGNvdWxkIGRvIGlzIHRvIGhvb2sgaW50byBhbWRncHVfZ2VtX29iamVj
dF9vcGVuKCkgYW5kDQo+ID4+IGFtZGdwdV9nZW1fb2JqZWN0X2Nsb3NlKCksIGNhbGwNCj4gPj4g
ZHJtX2dlbV9vYmplY3RfaXNfc2hhcmVkX2Zvcl9tZW1vcnlfc3RhdHMoKSBhbmQgZ28gb3ZlciBh
bGwgdGhlIFZNcw0KPiA+PiB0aGUgQk8gYmVsb25ncyB0by4gKFNlZSBob3cgYW1kZ3B1X3ZtX2Jv
X2ZpbmQoKSBhbmQgYW1kZ3B1X3ZtX2JvX2FkZA0KPiBhcmUgdXNlZCkuDQo+ID4+DQo+ID4+IFRo
ZW4gaGF2ZSBhbiBhZGRpdGlvbmFsIGZsYWcgaW5zaWRlIGFtZGdwdV9ib192YSB3aG8gdGVsbHMg
eW91IGlmIGENCj4gPj4gQk8gd2FzIHByZXZpb3VzbHkgY29uc2lkZXJlZCBzaGFyZWQgb3IgcHJp
dmF0ZSBhbmQgdXBkYXRlIHRoZSBzdGF0cw0KPiA+PiBhY2NvcmRpbmdseSB3aGVuIHRoYXQgc3Rh
dHVzIGNoYW5nZXMuDQo+ID4gQnV0IHRoZSBvcGVuIGFuZCBjbG9zZSBmdW5jdGlvbnMgYXJlIGNh
bGxlZCBvdXRzaWRlIHRoZSBvYmplY3RfbmFtZV9sb2NrIHJpZ2h0LA0KPiBzbyBkbyBJIHJlZ3Jh
YiB0aGUgbG9jayBpbiB0aGUgYW1kZ3B1XyogZnVuY3Rpb25zIG9yIEkgY291bGQgbW92ZSB0aGUg
Y2FsbGJhY2sgaW50bw0KPiB0aGUgbG9jaz8NCj4NCj4gWW91IGRvbid0IG5lZWQgdGhlIG9iamVj
dF9uYW1lX2xvY2sgZm9yIHRoaXMsIHRoZSB1cGRhdGUgaXMganVzdCBvcHBvcnR1bmlzdGljYWxs
eS4NCj4NCj4gRS5nLiB5b3UgZ28gb3ZlciBhbGwgdGhlIFZNcyBhIEJPIGJlbG9uZ3MgdG8gYW5k
IGdyYWIgdGhlIFZNIHNwaW5sb2NrIHRvIHVwZGF0ZQ0KPiB0aGUgc3RhdHVzIGluIHRoZSBhbWRn
cHVfYm9fdmEgc3RydWN0dXJlLg0KPg0KPiBJdCBjYW4gaW4gdGhlb3J5IGJlIHRoYXQgYSBjb25j
dXJyZW50IHByb2Nlc3MgbW9kaWZpZXMgaGFuZGxlX2NvdW50IGF0IHRoZSBzYW1lDQo+IHRpbWUg
eW91IHVwZGF0ZSB0aGUgVk0gc3RhdHVzLCBidXQgdGhhdCBkb2Vzbid0IG1hdHRlciBzaW5jZSB0
aGlzIG1vZGlmaWNhdGlvbiB3aWxsDQo+IHVwZGF0ZSB0aGUgc3RhdHVzIG9uY2UgbW9yZSBhZ2Fp
bi4NCg0KV291bGRuJ3QgdGhlcmUgYmUgYW4gb3JkZXJpbmcgY29uY2Vybj8gU2F5IHRoZSBoYW5k
bGUgY291bnQgZ29lcyB0byAyIGluIG9uZSB0aHJlYWQgYW5kIGFub3RoZXIgdGhyZWFkIGRyb3Ag
aXQgZG93biB0byAxIHJpZ2h0IGFmdGVyLCB0aGUgdHdvIGxvb3BzIHJ1biBjb25jdXJyZW50bHku
IFdvdWxkbid0IGl0IGJlIHBvc3NpYmxlIHRoYXQgc29tZSBWTSBnZXQgdXBkYXRlZCBieSB0aGUg
c2Vjb25kIHRocmVhZCBmaXJzdCBhbmQgdGhlbiB0aGUgZmlyc3QgdGhyZWFkIGFuZCBiZSBsZWZ0
IGluIHRoZSAic2hhcmVkIiBzdGF0ZT8NCg0KVGVkZHkNCg0KPiBSZWdhcmRzLA0KPiBDaHJpc3Rp
YW4uDQo+DQo+ID4NCj4gPj4gUmVnYXJkcywNCj4gPj4gQ2hyaXN0aWFuLg0KPiA+Pg0KPiA+Pj4+
IFJlZ2FyZHMsDQo+ID4+Pj4gQ2hyaXN0aWFuLg0KPiA+Pj4+DQo+ID4+Pj4+IFNpZ25lZC1vZmYt
Ynk6IFl1bnhpYW5nIExpIDxZdW54aWFuZy5MaUBhbWQuY29tPg0KPiA+Pj4+Pg0KPiA+Pj4+PiBD
QzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+Pj4+PiAtLS0NCj4gPj4+Pj4g
ICAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMgICB8ICAzICsrKw0KPiA+Pj4+PiAgICAgZHJp
dmVycy9ncHUvZHJtL2RybV9wcmltZS5jIHwgIDMgKysrDQo+ID4+Pj4+ICAgICBpbmNsdWRlL2Ry
bS9kcm1fZ2VtLmggICAgICAgfCAxMiArKysrKysrKysrKy0NCj4gPj4+Pj4gICAgIDMgZmlsZXMg
Y2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+Pj4+Pg0KPiA+Pj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZ2VtLmMNCj4gPj4+Pj4gaW5kZXggZDRiYmM1ZDEwOWM4Yi4uMWVhZDExZGUzMWY2YiAx
MDA2NDQNCj4gPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYw0KPiA+Pj4+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jDQo+ID4+Pj4+IEBAIC04NTQsNiArODU0LDkg
QEAgZHJtX2dlbV9mbGlua19pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiA+Pj4+PiB2
b2lkDQo+ID4+ICpkYXRhLA0KPiA+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnI7
DQo+ID4+Pj4+DQo+ID4+Pj4+ICAgICAgICAgICAgICAgb2JqLT5uYW1lID0gcmV0Ow0KPiA+Pj4+
PiArDQo+ID4+Pj4+ICsgICAgICAgICAgIGlmIChvYmotPmZ1bmNzLT5zaGFyZWQpDQo+ID4+Pj4+
ICsgICAgICAgICAgICAgICAgICAgb2JqLT5mdW5jcy0+c2hhcmVkKG9iaik7DQo+ID4+Pj4+ICAg
ICAgIH0NCj4gPj4+Pj4NCj4gPj4+Pj4gICAgICAgYXJncy0+bmFtZSA9ICh1aW50NjRfdCkgb2Jq
LT5uYW1lOyBkaWZmIC0tZ2l0DQo+ID4+Pj4+IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jIGluZGV4DQo+ID4+Pj4+IDBlM2Y4YWRmMTYy
ZjYuLjMzNmQ5ODJkNjk4MDcgMTAwNjQ0DQo+ID4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fcHJpbWUuYw0KPiA+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMNCj4g
Pj4+Pj4gQEAgLTQwNiw2ICs0MDYsOSBAQCBzdGF0aWMgc3RydWN0IGRtYV9idWYNCj4gPj4+Pj4g
KmV4cG9ydF9hbmRfcmVnaXN0ZXJfb2JqZWN0KHN0cnVjdA0KPiA+Pj4+IGRybV9kZXZpY2UgKmRl
diwNCj4gPj4+Pj4gICAgICAgb2JqLT5kbWFfYnVmID0gZG1hYnVmOw0KPiA+Pj4+PiAgICAgICBn
ZXRfZG1hX2J1ZihvYmotPmRtYV9idWYpOw0KPiA+Pj4+Pg0KPiA+Pj4+PiArICAgaWYgKG9iai0+
ZnVuY3MtPnNoYXJlZCkNCj4gPj4+Pj4gKyAgICAgICAgICAgb2JqLT5mdW5jcy0+c2hhcmVkKG9i
aik7DQo+ID4+Pj4+ICsNCj4gPj4+Pj4gICAgICAgcmV0dXJuIGRtYWJ1ZjsNCj4gPj4+Pj4gICAg
IH0NCj4gPj4+Pj4NCj4gPj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9nZW0uaCBi
L2luY2x1ZGUvZHJtL2RybV9nZW0uaCBpbmRleA0KPiA+Pj4+PiBkYTExYzE2ZTIxMmFhLi44YzVm
ZmNkNDg1NzUyIDEwMDY0NA0KPiA+Pj4+PiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZ2VtLmgNCj4g
Pj4+Pj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2dlbS5oDQo+ID4+Pj4+IEBAIC0xMjIsNiArMTIy
LDE2IEBAIHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcyB7DQo+ID4+Pj4+ICAgICAgICAqLw0K
PiA+Pj4+PiAgICAgICBzdHJ1Y3QgZG1hX2J1ZiAqKCpleHBvcnQpKHN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqb2JqLCBpbnQNCj4gPj4+Pj4gZmxhZ3MpOw0KPiA+Pj4+Pg0KPiA+Pj4+PiArICAgLyoq
DQo+ID4+Pj4+ICsgICAgKiBAc2hhcmVkOg0KPiA+Pj4+PiArICAgICoNCj4gPj4+Pj4gKyAgICAq
IENhbGxiYWNrIHdoZW4gR0VNIG9iamVjdCBiZWNvbWVzIHNoYXJlZCwgc2VlIGFsc28NCj4gPj4+
Pj4gKyAgICAqIGRybV9nZW1fb2JqZWN0X2lzX3NoYXJlZF9mb3JfbWVtb3J5X3N0YXRzDQo+ID4+
Pj4+ICsgICAgKg0KPiA+Pj4+PiArICAgICogVGhpcyBjYWxsYmFjayBpcyBvcHRpb25hbC4NCj4g
Pj4+Pj4gKyAgICAqLw0KPiA+Pj4+PiArICAgdm9pZCAoKnNoYXJlZCkoc3RydWN0IGRybV9nZW1f
b2JqZWN0ICpvYmopOw0KPiA+Pj4+PiArDQo+ID4+Pj4+ICAgICAgIC8qKg0KPiA+Pj4+PiAgICAg
ICAgKiBAcGluOg0KPiA+Pj4+PiAgICAgICAgKg0KPiA+Pj4+PiBAQCAtNTY4LDcgKzU3OCw3IEBA
IGludCBkcm1fZ2VtX2V2aWN0KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKTsNCj4gPj4+Pj4g
ICAgICAqLw0KPiA+Pj4+PiAgICAgc3RhdGljIGlubGluZSBib29sDQo+ID4+Pj4+IGRybV9nZW1f
b2JqZWN0X2lzX3NoYXJlZF9mb3JfbWVtb3J5X3N0YXRzKHN0cnVjdA0KPiA+Pj4+IGRybV9nZW1f
b2JqZWN0ICpvYmopDQo+ID4+Pj4+ICAgICB7DQo+ID4+Pj4+IC0gICByZXR1cm4gKG9iai0+aGFu
ZGxlX2NvdW50ID4gMSkgfHwgb2JqLT5kbWFfYnVmOw0KPiA+Pj4+PiArICAgcmV0dXJuIG9iai0+
bmFtZSB8fCBvYmotPmRtYV9idWY7DQo+ID4+Pj4+ICAgICB9DQo+ID4+Pj4+DQo+ID4+Pj4+ICAg
ICAjaWZkZWYgQ09ORklHX0xPQ0tERVANCg0K
