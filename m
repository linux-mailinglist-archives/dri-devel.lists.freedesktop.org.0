Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ECF9AD59A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 22:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A8010E385;
	Wed, 23 Oct 2024 20:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Xn/Bknry";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4075B10E232;
 Wed, 23 Oct 2024 20:36:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aa4181lYq96ZUI5YUfyRHa8CMVRrZRpEQijEf03JyisS6mrw/qdqaVoFRE+ufSYFY5YQPICdMzic7xQRLJoH5zwYQ/zjMzEIlH/Z+zBG0ow3JoCGrivBGzy9CiHRfy33X1CHlN5Zsh7xRY6gIPJn4e56iVQkHb1E/QDCEFiZnLcqX2VPfZ4jMLBoYcIhbM9z5Bn520wz0lDjuEeY2q30nhkUpDcq+zLZMUwJCYfOiZcBtLpApgR25XWoJ9sBxSRFMfdqzdCvz3dHovXVRvs8u/WT96tdH/6enK+7DfpSut9pJW3no5YltMLmBNx9lKQHVr9+WrOeF2cdhQ2oEjh15A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SERbwZGP8Q1uULxUKInjPl28NotZj7+fbzJsGPj2xHY=;
 b=A+x3/MBwgyGRRggQd18lmqgbMKeZfgITlGBvZYzi5XTuRu5ufB4/ufx6fZxB/Imep87OeZACiVT3DC6X6VTwOgJOu5v90HXXUhCb+42lgbjknvPtDtLUUxwEcv7yhqtyMK3gUXhYAto5RjJ9H7LP+4KHeQXuILqarIjDKbjAUGZb7EIUAWNyXIf1/cGAZHKTCsosQWpZEpk3+mpXnuDO1aJLuUH00R0Wz3U2SenE2WxuHci2afpa1CNmRbKYNMJmfs6rE+Xg4F2S8mjgWacCQ53qc5vjRf4DS9E60hJog3mkeOMYa+chbCMDgbMvOrklSNy+GVVVJUL4NN8ouK/dEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SERbwZGP8Q1uULxUKInjPl28NotZj7+fbzJsGPj2xHY=;
 b=Xn/Bknry4GxYYtlCSb4FEz0bG3rCwGItkR1rUCvGrk6oSfy4dVjlhcDwSnFHMoOkz2B9mTGzYsLZ2B/0/bt5MbECU5OR/jRbY7mJwpIqr7OmYgBcAzgrvuNhjmrosut5z7LyjEzukfz0WWnNI8TYKa1RTt8nrdlQO93tqXuTs94=
Received: from CY8PR12MB7289.namprd12.prod.outlook.com (2603:10b6:930:56::12)
 by CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 20:36:43 +0000
Received: from CY8PR12MB7289.namprd12.prod.outlook.com
 ([fe80::9cc2:b7be:be33:58b7]) by CY8PR12MB7289.namprd12.prod.outlook.com
 ([fe80::9cc2:b7be:be33:58b7%3]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 20:36:42 +0000
From: "Mohamed, Zaeem" <Zaeem.Mohamed@amd.com>
To: Melissa Wen <mwen@igalia.com>, "Wentland, Harry" <Harry.Wentland@amd.com>, 
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "Siqueira, Rodrigo"
 <Rodrigo.Siqueira@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/amd/display: increase max surfaces in line with
 planes and streams
Thread-Topic: [PATCH 1/2] drm/amd/display: increase max surfaces in line with
 planes and streams
Thread-Index: AQJbdzj5ttBrhthVEY8pRJyd9bB69QH9Y7zTsVst7rCAAAxXgIAnIpOAgAHf7iA=
Date: Wed, 23 Oct 2024 20:36:42 +0000
Message-ID: <CY8PR12MB7289D4A6DDB84A4F9B445344E24D2@CY8PR12MB7289.namprd12.prod.outlook.com>
References: <20240925154324.348774-1-mwen@igalia.com>
 <20240925154324.348774-2-mwen@igalia.com>
 <CY8PR12MB72895C3AF14118F815B9811BE26B2@CY8PR12MB7289.namprd12.prod.outlook.com>
 <cb1a6706-1feb-4ddb-884d-04f3f8543ca0@igalia.com>
 <95b25dd4-e039-4c63-9100-055f0c2fee6a@igalia.com>
In-Reply-To: <95b25dd4-e039-4c63-9100-055f0c2fee6a@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=3450767d-7851-4078-ac36-30dccb0677ce;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-10-23T20:35:59Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7289:EE_|CY5PR12MB6429:EE_
x-ms-office365-filtering-correlation-id: 1761d6ab-cfb9-4b21-6a28-08dcf3a2679c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?WWxIb0syVUJkNFkyY1lJQXppRVBWamJPWUpRdGpKaFJBRUdrOG1FUU4xODR4?=
 =?utf-8?B?TmdaeUJqVnpkNjdxUGxRZCtYREI5aEhTMDl3dkdoREUvMWhZR09kRXQ4VTZt?=
 =?utf-8?B?bC9PZU93bWcvZlpnRll3MG5ZeVFZV2FzU2tMRnhJMlVIS2RudTZ1cnczLzVM?=
 =?utf-8?B?VU9TZE1TeDQwSHdoR1NLNmJNc2pnQTVtMWVPYzkrZk9tYXYrOFFVQzNYTlJO?=
 =?utf-8?B?ZjFMYUNXUVNpT3VkWlM5a2czdUtnV2tncGFKZE1MNndDMmtnUEt5cmVkU0pw?=
 =?utf-8?B?eUtPVjFGMVkxN2NhRnE3NCtYazJBUGlmNDB0eTJZUnpzbUM4OTlHQWFVVVRS?=
 =?utf-8?B?eHltU1BpWlIyODZWaWVaQ21YNE1GbDM2ekw0R2F2WlFaeGRXd0NNNnJiQ2tE?=
 =?utf-8?B?Z3ZUM1pOcVdDTnJXeGc2dXdTdDljZngxdU0vaGtWSXYvUmxiSXk1b1VGR1lj?=
 =?utf-8?B?RXBlQjZoYUI1aENCZWh6MGZHbndWRjlvUDhwYnJiYkdpOVp0clNxS3d5cWpX?=
 =?utf-8?B?TTU2bitQTDVqb3llNFBKYUtiM2N3aHd6K3hsS3RNVCtQTE50QXFWVUFhTXJN?=
 =?utf-8?B?bXRUYjVtTngycWF6VlVkdmhZS05RaGREYisyRkg5QmlZZm9pZXRrM05aNzZo?=
 =?utf-8?B?TVMyajVwSFJKQm5CTzVOMlpPbzRxa1RLM2hoWk12ZG1aVWp4Mlo5QnlEcmNv?=
 =?utf-8?B?Z0tyUk1LaFNISHZPZXJHVFRlYjV0WVo3azMzQTBvS3FGYXRVLzA2RDNTQ0oy?=
 =?utf-8?B?Y3h4elNZdy9oanhRZHprWGlZYmMxbVY4eG1KQmVrOUY5SGl0VnpqUGZEcjR5?=
 =?utf-8?B?MjUxbklsanZRclNxcW9lL0pwa3Fra1lUempzSXJwRnRraHJLMm5RcVI4T3ZG?=
 =?utf-8?B?V3MxNHAxUThVOHg2b0RRMWMrUlhqazdWUU5vZlNKbzl3ZitOWVZPazVSZE5y?=
 =?utf-8?B?TXl5R0M0bW9SV0tJd05GZHlLYmZDNUQ1R2xmRU11enJoakxEQnVNZnpDOVpw?=
 =?utf-8?B?TzZGbXU3YjJ5MlZiYzRVaXl5MDkxbndmeHltMXNxQm9jL2VqUEY3QnZaMjFu?=
 =?utf-8?B?aW1wK2IvQW1IRkJ5V01sbngvODF4Qkgrc0tKUnhOanNUbTNoSUVWUHl0dksv?=
 =?utf-8?B?ZVFhcUQzdXhNY0hpL1dHYnN0NCtmV1NJSUd1R1ZzWnZiRHd2ZG9QeHhML0JK?=
 =?utf-8?B?SlBDSHVsdDloL0wrWE00N2loM0VtS2o0RTlLUWQ5d2lUQUJETzJJVG9FdXZ1?=
 =?utf-8?B?M2hxZjBJSGNtelowNkNIVmcrM3ZIWm1MSFFkWGlNVkl5bENVTUdIc3U0a1Ft?=
 =?utf-8?B?bzYrQ2FnS1Q3VzYybitSTmtNSGg3SWladUtWSGYvUHgrQ0xGTmJHWlRJTG9x?=
 =?utf-8?B?RnRFWjd0R3MvbXNXQldSYWNCMi92bVZpQWhiaDJGeVpwWUw0TWRJR0g0NEUz?=
 =?utf-8?B?d2hxblJmV0prQlM4V0hUcUkrcHdWRFJnMTlBMjhDLzNLeFg3UnBHTnpIbm9H?=
 =?utf-8?B?WkZXa2dTR09LU2JINTVWODhjRHl1YzhNK2daM1dCV1ZmQVJ0LzhaYnQrQWxD?=
 =?utf-8?B?QU9jbVRQQkZSQWpmdkFkTThuWkFWTXM2VmlRVTBmZFZNc0hKZ3F0blRTWFJk?=
 =?utf-8?B?ZHlvak1RdjAzVGVYOHN3a3MybEMwaWNuVzlUdUJTNThwZGllaDUzek9DYmNq?=
 =?utf-8?B?OVE2eFRLc1kvNzI4RHhsT1pqa2RoWTNrRXNHL3ZxVjlGWC8zOXZ3cFVacmlZ?=
 =?utf-8?B?MlpFRkdIQUpBaERTNHFVNHc1aFkramZDM0RyazlzamZRQXlHK3piYlJmRlFU?=
 =?utf-8?B?ZUNvL3cyakkrOU1pREU5QT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR12MB7289.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(921020); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3oxNHNxRUMzS2NjNWtEL1p0RnhoTkJiMkRBd0JqTS9pNmFUS01ob3o2Tkx2?=
 =?utf-8?B?bW5OeElqc3BScGhFZVVBeVFNeU91NzYyTDNyNXE0TFRzSE5NNEVQMXcyc1Ny?=
 =?utf-8?B?UGhEcDM1dWFqMzI5b3N4TTZRd0MrVnZSdk13NHhFRURra0NaeTRPVVpvd2JP?=
 =?utf-8?B?SUpaZEF5aVZBU2dUNlhPUU5CcUlDOEV0dE9ZVzRqK3NRVTJhLzBNd3RkOU1X?=
 =?utf-8?B?VVJua1JBRGRYanBRWnBPRzhQSnEyUXFjZUxiZXVmSGpNYXhGWEgrNldiTGd2?=
 =?utf-8?B?SHc2QjFub1J1TWNlTGJ1Q0VTQXJmekRKM3d1anVSTnpwamZYWHBtQTBPZTRj?=
 =?utf-8?B?RFdSL1VHbXp0d29UanFVQkkraUZibUV1djM4dDg1L2k1b2hiQlFxWStVMmJT?=
 =?utf-8?B?dkJ6L0kwQ0U5aU9icUd3UHQvM2xPR0xRbWdsZDFGeHBHK0laYUVBSmFMZXNU?=
 =?utf-8?B?UzNjUklRQzk0dURnemhzd1g4OHdiTHpZV2UwN1VUZ2tsUG5TWVUvR2t0N2dM?=
 =?utf-8?B?NjNVQTRCRFFLZVAyN2F5Qk1nZCs3dzMwTzNxalJRMGsydFdVSHJjbGRDN1ln?=
 =?utf-8?B?cVRSZG5CdE11d24wY3Q5WlVIZ2EwNkxnSkpNZEtSMnRZME9aWUtoMHBiV2JJ?=
 =?utf-8?B?T3pSNkUxVnJXSGRqa3hBZkZWVVFlejVraGZRUC9WajBiN1dvTk1hZGZibGpY?=
 =?utf-8?B?cjJRR1JPS29HUnViTUFzMlBTbk9Pa25YSmN1dm1ua2RtdnVXYjRUQ2JmYzQx?=
 =?utf-8?B?MFJRU3kxdkttaytVd2pVNWdaaCt1L1ZYdDhBTWd2QXlTTlhBZ1FpQnZyMWZv?=
 =?utf-8?B?RWRPcFhFRXgyZHZrNHFOMzBBRUNvUE94TzdSUGRFOXZId3VQN3NnbFhZN1Zw?=
 =?utf-8?B?Yk5oWUtiV2FKSU9CUXdzdmo5SzhZR2o3M3l3dzgvVExFdWhnTVdXZzgwU2hj?=
 =?utf-8?B?NS8yYmQ5K2tqeldUR2pFNDV6Z0NtTzRGeGs5S3VQMDRMUk9zQzJpcGhHdjV1?=
 =?utf-8?B?WWVDbFFBaVEvRjVpaGVITm5ZdU1mYTNsRnNCdVFkV2ZjQXVSSnJmanRpNmNn?=
 =?utf-8?B?OHdaOFZJUzhUVGtvUG94MWZJVEdGNU1sVGlrMGduNXR4Q2hFMXlwa1Y2WDRk?=
 =?utf-8?B?aGNUZjROZTBUMHpQVklkdk03U2MxbnRxa0E2dFRmdldVaWRucXNLemNXT1dS?=
 =?utf-8?B?MEtOcnFGTU9pcW9yaFlMVkFzK1Jic2FvZHdHUFVGMzYvemZLUVpvUXJkRkd5?=
 =?utf-8?B?YlV2dkh6NW9rN0RtOFI5cmtiRlVudXloRFlXMGZGZkJsbllCMVpEN2xMWk4x?=
 =?utf-8?B?bks0WHhPQ3RCWjMzdi81UWtybTVhNk5zWE5XQlV6Q2NTSCtLNmY2T1BlUnJq?=
 =?utf-8?B?b2cvWkNwVDVMdndGZDhReTl6TUFpTWo1UHNvSnRETXdCdTZ6QkpxNUs1WWlR?=
 =?utf-8?B?T3pHdndwdVpmMW81VTJkbXhkdWlNWU82NlpJamlhMUdEZmw0QlJDQmdYaExJ?=
 =?utf-8?B?YjZrYjE0NVBJMjM5eFFxVW5udWQyTjZhSENwNTFSV2lSRTlRY1dqNkYzVzBL?=
 =?utf-8?B?VWNWSXRlb0VmWTcvVE1vMFIwUnN2QzN6Z1FJNVg5RlFHeStUVGpXOFVTZkc2?=
 =?utf-8?B?U3pYTiswSUpNdUxDTTMrcnphbCs4MmNydDZheGNMNHBPNVVYcm9CeTlQL1U5?=
 =?utf-8?B?cVYyT1M0ZUNjRkVBaXpSQlhUMlpYcjd6cmF2NXNOMFIydnhyM3pFSkR4aTRF?=
 =?utf-8?B?T3VLQWMvR0wybHBIUGpMUUprSHYxRmNUS0Jnc0toc01FNTNmT2ZWUVE5RUJ2?=
 =?utf-8?B?cDVWNnI4UTM0eHFMeUQ4bFRyRlZHa1VreEVSTzhWM0pKVVhtU1RUNnd1QjJP?=
 =?utf-8?B?N1VYM2JTcVEvdTBsTm4zNVk0NnlpdGIzYjFXaW9IMytZSFlMblJxb1lpWHlT?=
 =?utf-8?B?bUlEbTlHMldFQkRHSW9pY1AxVG05STFYQXdVd2NKNmxTRW5DUXFEK1dUOEll?=
 =?utf-8?B?VitrVnJzYnppSW9JS1NrQWorNUpDYUg5L3lNQm80ZU9hcngwUzBZY3EwdU41?=
 =?utf-8?B?cFJHSDVoekdUWnVrN0dqV1dJS2RPdUIwNlpxdDhCSEFiK0lnYXBOdDdnVkpi?=
 =?utf-8?Q?Bk8M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7289.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1761d6ab-cfb9-4b21-6a28-08dcf3a2679c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 20:36:42.7813 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lFZSrbbgb92FSFNGaSXy4/sX7sRdnkCJEH0nXB3SA4QQA2EkCBAFl18SZ3IJGCwADt1HavsXb6gTkqdlk7IEAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6429
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
Cg0KSGksDQoNCkEgcGF0Y2ggYWRkcmVzc2luZyB0aGlzIHdpbGwgYmUgc2VudCBvdXQgc29vbi4N
Cg0KVGhhbmtzLA0KWmFlZW0NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE1l
bGlzc2EgV2VuIDxtd2VuQGlnYWxpYS5jb20+DQpTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDIyLCAy
MDI0IDExOjU4IEFNDQpUbzogTW9oYW1lZCwgWmFlZW0gPFphZWVtLk1vaGFtZWRAYW1kLmNvbT47
IFdlbnRsYW5kLCBIYXJyeSA8SGFycnkuV2VudGxhbmRAYW1kLmNvbT47IExpLCBTdW4gcGVuZyAo
TGVvKSA8U3VucGVuZy5MaUBhbWQuY29tPjsgU2lxdWVpcmEsIFJvZHJpZ28gPFJvZHJpZ28uU2lx
dWVpcmFAYW1kLmNvbT47IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1k
LmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBQYW4s
IFhpbmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPjsgYWlybGllZEBnbWFpbC5jb207IGRhbmllbEBm
ZndsbC5jaA0KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gZHJtL2FtZC9kaXNw
bGF5OiBpbmNyZWFzZSBtYXggc3VyZmFjZXMgaW4gbGluZSB3aXRoIHBsYW5lcyBhbmQgc3RyZWFt
cw0KDQpIaSwNCg0KR2VudGxlIHBpbmcgdG8gbGFuZCB0aGUgZml4IGZvciB0aGUga2VybmVsIGNy
YXNoLg0KSWYgZmFzdGVyLCBJIGNhbiBzZW5kIGEgbmV3IHZlcnNpb24gaW5jcmVhc2luZyBtYXgg
c3VyZmFjZXMgdG8gNCBhcyBwcmV2aW91c2x5IGRpc2N1c3NlZC4NCg0KVGhlcmUgYXJlIG5vdyB0
d28gYnVnIHJlcG9ydHMgZm9yIHRoZSBzYW1lIGlzc3VlOg0KLSBodHRwczovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvZHJtL2FtZC8tL2lzc3Vlcy8zNjkzDQotIGh0dHBzOi8vZ2l0bGFiLmZyZWVk
ZXNrdG9wLm9yZy9kcm0vYW1kLy0vaXNzdWVzLzM1OTQNCg0KQmVzdCBSZWdhcmRzLA0KDQpNZWxp
c3NhDQoNCg0KT24gMjcvMDkvMjAyNCAxNToyMCwgTWVsaXNzYSBXZW4gd3JvdGU6DQo+IEhpIFph
ZWVtLA0KPg0KPiBUaGFua3MgZm9yIGV4cGxhaW5pbmcgdGhlaXIgcmVsYXRpb25zaGlwLg0KPg0K
PiBTbyBJSVVDLCBjdXJyZW50IERNIGltcGxlbWVudGF0aW9uIGZvciBkY19zdXJmYWNlX3VwZGF0
ZXMgYXJyYXkgaXMNCj4gd3JvbmcsIHNpbmNlIGl0J3MgdGFraW5nIE1BWF9TVVJGQUNFUyAoPTMp
IGZvciBhbGxvY2F0aW9uIGJ1dA0KPiBNQVhfUExBTkVTICg9NikgYXMgdGhlIHVwcGVyIGJvdW5k
IG9mIHNpemUgb2YgdGhlIGRjX3N1cmZhY2VfdXBkYXRlcw0KPiBhcnJheSwgYXMgeW91IGNhbiBz
ZWUgaW4gdGhpcyBhbGxvY2F0aW9uIGFuZCBhZnRlciBhbiBpdGVyYXRpb24gZnJvbSAwDQo+IHRv
IGBwbGFuZV9jb3VudGA6DQo+DQo+IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9i
bG9iL21hc3Rlci9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3ANCj4gbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYyNMOTg2MQ0KPg0KPg0KPiBBbm90aGVyIHF1ZXN0aW9uIHRvIHVuZGVyc3RhbmQgd2hh
dCB3b3VsZCBiZSB0aGUgcmlnaHQgZml4IGZvciB0aGUNCj4gaW1wbGVtZW50YXRpb24gYWJvdmUt
bWVudGlvbmVkOiB3aXRoIHRoZSBjdXJzb3Igb3ZlcmxheSBtb2RlLCBpdCBtZWFucw0KPiB3ZSBh
cmUgdXNpbmcgb25lIG9mIHRoZSBvdmVybGF5IHBsYW5lcyBmb3IgdGhpcyBjdXJzb3Igb3Zlcmxh
eSBtb2RlDQo+IChvbmUgZnJvbSB0aGUgIm1heF9zbGF2ZV9wbGFuZXMiKSBvciB0aGlzIGN1cnNv
ciBwbGFuZSBpcyBhbiBleHRyYQ0KPiBwbGFuZSwgd2hpY2ggbWVhbnMsIGZvciBzb21lIGRyaXZl
cnMsIG9uZSBwcmltYXJ5IHBsYW5lICsgdHdvIG92ZXJsYXkNCj4gcGxhbmVzICsgb25lIHBsYW5l
IGZvciBjdXJzb3Igb3ZlcmxheSBtb2RlIChtYXggNCBwbGFuZXMpID8NCj4NCj4gQlIsDQo+DQo+
IE1lbGlzc2ENCj4NCj4gT24gMjcvMDkvMjAyNCAxNDo0MCwgTW9oYW1lZCwgWmFlZW0gd3JvdGU6
DQo+PiBbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gQU1EIEludGVybmFsIERpc3RyaWJ1dGlvbiBP
bmx5XQ0KPj4NCj4+IEhpIE1lbGlzc2EsDQo+Pg0KPj4gTUFYX1NVUkZBQ0VfTlVNIGFuZCBNQVhf
UExBTkVTIGJvdGggcmVwcmVzZW50IHRoZSB1cHBlciBib3VuZCBvZg0KPj4gcGxhbmVzIHRoYXQg
YXJlIHN1cHBvcnRlZCBieSBIVy4gSXQgaXMgYmVzdCB0byByZXBsYWNlDQo+PiBNQVhfU1VSRkFD
RV9OVU0gd2l0aCBNQVhfUExBTkVTIHRvIHJlbW92ZSByZWR1bmRhbmN5LiBNQVhfU1VSRkFDRVMg
aXMNCj4+IHVzZWQgdG8gcmVwcmVzZW50IHRoZSB1cHBlciBib3VuZCBvZiBzdXJmYWNlcyB0aGF0
IGNhbiBiZSBwaXBlZCB0byBhDQo+PiBzaW5nbGUgQ1JUQy4gS2VlcCBNQVhfU1VSRkFDRVMgYXMg
aXMgdG8ga2VlcCBzdGFjayBzaXplIGRvd24sIGFuZA0KPj4gcmVwbGFjZSBNQVhfU1VSRkFDRV9O
VU0gd2l0aCBNQVhfUExBTkVTLg0KPj4NCj4+IFRoYW5rcywNCj4+IFphZWVtDQo+Pg0KPj4NCj4+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+PiBGcm9tOiBkcmktZGV2ZWwgPGRyaS1kZXZl
bC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmDQo+PiBPZiBNZWxpc3Nh
IFdlbg0KPj4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMjUsIDIwMjQgMTE6MzcgQU0NCj4+
IFRvOiBoYXJyeS53ZW50bGFuZEBhbWQuY29tOyBzdW5wZW5nLmxpQGFtZC5jb207DQo+PiBSb2Ry
aWdvLlNpcXVlaXJhQGFtZC5jb207IGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb207DQo+PiBjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb207IFhpbmh1aS5QYW5AYW1kLmNvbTsgYWlybGllZEBnbWFpbC5j
b207DQo+PiBkYW5pZWxAZmZ3bGwuY2gNCj4+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4gU3ViamVjdDogW1BBVENI
IDEvMl0gZHJtL2FtZC9kaXNwbGF5OiBpbmNyZWFzZSBtYXggc3VyZmFjZXMgaW4gbGluZQ0KPj4g
d2l0aCBwbGFuZXMgYW5kIHN0cmVhbXMNCj4+DQo+PiAwOTFhOTdlNTQyY2YgKCJkcm0vYW1kL2Rp
c3BsYXk6IEZpeCB3YXJuaW5nLiBTZXQgTUFYX1NVUkZBQ0VTIHRvIDMiKQ0KPj4gcmVkdWNlZCB0
aGUgbWF4IG51bWJlciBvZiBzdXJmYWNlcyBzaW5jZSwgYXQgdGhhdCB0aW1lLCB0aGVyZSB3YXMg
bm8NCj4+IHVzZSBmb3IgbW9yZS4gSG93ZXZlciwgSFcgYW5kIGRyaXZlciBldm9sdmVzIGFuZCB0
aGVyZSBhcmUgbm93IGRyaXZlcg0KPj4gdmVyc2lvbnMgdGhhdCBhbGxvdyB0d28gb3ZlcmxheSBw
bGFuZXMgKG1heF9zbGF2ZV9wbGFuZXMpLiBNb3Jlb3ZlciwNCj4+IGNvbW1pdCAzY2ZkMDNiNzk0
MjUgKCJkcm0vYW1kL2Rpc3BsYXk6IHVwZGF0ZSBtYXggc3RyZWFtcyBwZXINCj4+IHN1cmZhY2Ui
KSBzdGF0ZXMgNiBpcyB0aGUgbWF4IHN1cmZhY2VzIHN1cHBvcnRlZCBhc2ljcyBjYW4gaGF2ZS4N
Cj4+IFRoZXJlZm9yZSwgdXBkYXRlIE1BWF9TVVJGQUNFUyB0byBtYXRjaCBNQVhfU1VSRkFDRV9O
VU0sIE1BWF9QTEFORVMNCj4+IGFuZCBNQVhfU1RSRUFNUy4NCj4+DQo+PiBJdCBhbHNvIGFkZHJl
c3NlcyBhcnJheS1pbmRleC1vdXQtb2YtYm91bmRzIHJlcG9ydGVkIGluIHRoZSBsaW5rLg0KPj4N
Cj4+IExpbms6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vYW1kLy0vaXNzdWVz
LzM1OTQNCj4+IFNpZ25lZC1vZmYtYnk6IE1lbGlzc2EgV2VuIDxtd2VuQGlnYWxpYS5jb20+DQo+
PiAtLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggfCAyICstDQo+
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaA0KPj4gYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaA0KPj4gaW5kZXggMzk5MmFkNzMxNjVi
Li4wOGIwMGIyNjM1MzMgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGMuaA0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgN
Cj4+IEBAIC01Nyw3ICs1Nyw3IEBAIHN0cnVjdCBkbXViX25vdGlmaWNhdGlvbjsNCj4+DQo+PiAg
ICNkZWZpbmUgRENfVkVSICIzLjIuMzAxIg0KPj4NCj4+IC0jZGVmaW5lIE1BWF9TVVJGQUNFUyAz
DQo+PiArI2RlZmluZSBNQVhfU1VSRkFDRVMgNg0KPj4gICAjZGVmaW5lIE1BWF9QTEFORVMgNg0K
Pj4gICAjZGVmaW5lIE1BWF9TVFJFQU1TIDYNCj4+ICAgI2RlZmluZSBNSU5fVklFV1BPUlRfU0la
RSAxMg0KPj4gLS0NCj4+IDIuNDUuMg0KPj4NCj4NCg0K
