Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C354794080E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 08:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E34B10E228;
	Tue, 30 Jul 2024 06:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Q9q/2T/K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532C610E107;
 Tue, 30 Jul 2024 06:05:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HpaWJ+lezn3DhEPIiZ7Mu98w7d7BHode2mNsjQ4gyec35qrq8FLWnXY4zysYh/3WuXuPPolMSFL2cOka9dFk84AoNa0cHbyfnw6dxqWpCLT8jJteJCLngStfuXCIqLhd3u9sU6wJcd9CN4H6Exhg2GMtkQKeVOwe2TlchbUq61L55PoCFUrZUh3EgQa0ZPfrtg0VSFPbNS/+uh1PnCboDmYDfl5MZOuU9I+lSnPBuFC7P7jaMoD+HTdpEt1g0hDucC8AXxuffmCQ4Zbumj2H/5B7ViONNB+eP0CoXQbPhAJaDczC3Db+OBKWLt69uiykJvvKgCITL+t2ukYtiri49g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKbR+bEI0vIpDiFPYFR0it6rY9IcpqN4RLXX8Sjifrk=;
 b=mQK6sK+nKsGaJjmkggbvZFTAAEtBP2mDFJS9WxstJiSU5RwbLAuLjPFmou7y80DxfAegsrdcvpdqhJL5e6QvoTBqLkyQvAOvrO7cZU2cAJ3JOGh7p16g2sHYlmSPJJrBE1KcsIg89gVxVCiczsBLcK26jAThiej2tE9TsGprF8W0yGamU4vytx/gVPPDLK1LMyDL3lAFBItFkPHITEaRS3yC5l7lpA3FnuFBHOqKfWU66LY/w0QP4452yF8u22F1nWe0M6QfR/PPYOiiMeUvsjvc4g4/2PnkXpthVsFnVN6YfGz6wOZTFShRmacZ6JGrDg9sYeiBSDbSkNAxCcRGKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKbR+bEI0vIpDiFPYFR0it6rY9IcpqN4RLXX8Sjifrk=;
 b=Q9q/2T/KQXO5D5zZEwNBTDY1MqMKXr0eeC3iygAPNAdoYWVh6V7mhgPYOXIKtYsr37gO3Sl8z9oAPBLg6l7fyFrtxTuTM4svMbcFqLCqneRnDvj5XVgRpBMFAhgnwCzUkIhQ4ZeM2gcnCYj6js1nrxmWT1EURT+/blNyfY5tFL0=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by LV8PR12MB9110.namprd12.prod.outlook.com (2603:10b6:408:18b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 06:05:34 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282%4]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 06:05:34 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "kevin@holm.dev" <kevin@holm.dev>, Linux regressions mailing list
 <regressions@lists.linux.dev>, Christian Heusel <christian@heusel.eu>
CC: Greg KH <gregkh@linuxfoundation.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, ML dri-devel
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Wu, Hersen" <hersenxs.wu@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [REGRESSION] No image on 4k display port displays connected
 through usb-c dock in kernel 6.10
Thread-Topic: [REGRESSION] No image on 4k display port displays connected
 through usb-c dock in kernel 6.10
Thread-Index: AQHa4EIHlXNw8ZbqLEehA7MTA0aCA7IKx3CAgAKT1cCAAAi+AIAAA34AgAAHwgCAAES3AIABFr5Q
Date: Tue, 30 Jul 2024 06:05:34 +0000
Message-ID: <CO6PR12MB548906926B8D079157735F52FCB02@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <d74a7768e957e6ce88c27a5bece0c64dff132e24@holm.dev>
 <9ca719e4-2790-4804-b2cb-4812899adfe8@leemhuis.info>
 <fd8ece71459cd79f669efcfd25e4ce38b80d4164@holm.dev>
 <CO6PR12MB54897CE472F9271B25883DF6FCB72@CO6PR12MB5489.namprd12.prod.outlook.com>
 <e2050c2e-582f-4c6c-bf5f-54c5abd375cb@leemhuis.info>
 <b7f0f3e1-522b-4763-be31-dcee1948f7b3@heusel.eu>
 <ca007d54-c204-4f7f-9eca-5a282324b941@leemhuis.info>
 <7bf26283474fbb6ea915f93f4db0bc614a627617@holm.dev>
In-Reply-To: <7bf26283474fbb6ea915f93f4db0bc614a627617@holm.dev>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=bc238eaa-4ac0-40e8-84c7-6f8a87137815;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2024-07-30T06:00:00Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|LV8PR12MB9110:EE_
x-ms-office365-filtering-correlation-id: 583b8c80-2633-48fe-14b5-08dcb05da019
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?T21JaVpyZEhTS0VmZVJxVjFNSEZQODVuV1JjbEVobEhZM2J5RFpldHc0QXdS?=
 =?utf-8?B?TjliSklNMEJnZDN6Qi9QUG1nREJWNUlYdE9BaXRRZ1ZIZUdnU1FiTTg1OVAy?=
 =?utf-8?B?bXBHN3hWcGFIMXN3RWVjTXA2cENHOGRXZEs2NHh3ZHJxY1M3L0RYTG14MXJi?=
 =?utf-8?B?K29OTWVKdUkrbW9DMXpDTzA2UUs5QXFwV0FuNHo1czdjdkZrR2VkNU12Z2VY?=
 =?utf-8?B?SjJXMWkvREZDRWJwQ0ExQnNDazhSdVFxaVF3T2xDUFhURUJZbXBuaVpQcG9j?=
 =?utf-8?B?Zm9ra0pNN2htcFJrbG92QkwvRG91SHhJQ1ZhWWNGT0pXWElQOUx3MUFrdkpI?=
 =?utf-8?B?emN6TjFRb1RNRHBoenRzQW13bVoxNG9wNlB5OVF1N3VoOE4zMUMraHNYZ0FP?=
 =?utf-8?B?UmhaZldFQXNkcGxiNHVvMEo1UVl5dTlHRmJzSUdvMUNMSTZ4MWxGcGlWS2tT?=
 =?utf-8?B?THN1bTVuYkFxSUxidzZtakhzV2tpbVg4ZzVnSUd4eDluZjduSVlRMFJPRWtU?=
 =?utf-8?B?M2ZwZi9UZU1kY0FzanJ1dFVXVEVsNXI1WnBhcEdMY2dueFdVWm94N2ZYNWY2?=
 =?utf-8?B?RHhTaHRBZ29SbnZ6aCtoQ2wzOGY2anE1QUNmY213WDhtL0lNMW02R2N6RWxP?=
 =?utf-8?B?MkNNTFFDbVRmUzhiNURrZ2o5ZlQ4VWRpRUpnSGZHcllwVHh5VWxVWTRKRVFS?=
 =?utf-8?B?bHg0REd4RCtiNzdzZXRYc0k2K1NUbjlxNzNwZkwzWHFVN2xkNmhWWEFUekIv?=
 =?utf-8?B?aUF3WVVSeUptSWgybjNLMnY1cEJuUHdKSGFYRmZJdkpWVzBLZ2VPNGpscmhG?=
 =?utf-8?B?c09PUWxaVE5BMlpqRjd4enhkeHJWTXJ5Rno0RldiWXB6UnNoNFcrTkV2dGF0?=
 =?utf-8?B?TlZudmtBOFZYYzdUeldOZUh2U05Saisrams5d2VEWlhwaXJoK3VIK3ZwTGIx?=
 =?utf-8?B?ME5uaTNlOTJLMW1qdlREUVlsY3dXcTJaWFk2VWlFUER2RkR2TTY3d3hTQlpX?=
 =?utf-8?B?NmFzR3k5NkpXRnkwQjEzbHpTK3R0SmRpYitHOHF0ZEM1LzhnVVQ2aTNMRUN3?=
 =?utf-8?B?ZzRacHRZWXh3cHZUS3J6Um5ManlpZVhWaHk4U21la21tUHZIZEFnOTdtQW93?=
 =?utf-8?B?NFpWSzhFSjNNR2p0cEFtbHd2TzE2WURJekJwT0l2aUQ0SGE4UlZkSU1Eazl3?=
 =?utf-8?B?WGh6SmdyejROeXNGVGtZT1NYbmdrYkhXWHk4dGw5dFQveUNGSHdiYTVIUFU1?=
 =?utf-8?B?TEVLamsyZlNFRWh4VWgweUtlQ05aYVdUSjlSQzZPYVFhYmorNW90R3A4OHVK?=
 =?utf-8?B?Qy8wQlFHOGxFWkxGRmVEQndHTWFTbERzRVIrM0YweVIwTjlHTVUvdjI5dWQ3?=
 =?utf-8?B?QkR3bEx0OTk3b1IyQzFqZGk4L1hOa1kvS3Bja2tjUUNYczdpOHQxcE5VVllx?=
 =?utf-8?B?SUxZTG5TcUR2ZWFIUFVNNVVBUW03bTJSdHNkMlJreGQxbGg4cVJPOThvNGVl?=
 =?utf-8?B?TXlNOVlnZkdkSmg0WFFtNmw2VWU3VTR5dXFZUXRaeTFvQi9XSk4wVkg0T0dM?=
 =?utf-8?B?YlNDOTlGb1E5eWxkODNRM2pVRWFUM0tVcDhjWGV0NnZlV3ZETER4UzVNQ0oy?=
 =?utf-8?B?alRlTGpJeVNYRkNFSmErRCtEa1BKU1ZUVXJlc1FybEsxOStVMExqUlNlTUNS?=
 =?utf-8?B?Z0IyczVJY3B3OXZ2dVkvaDVUNmt4SUFPM1ROUkZoRStHdjRJL09IRm1jSGNk?=
 =?utf-8?B?VVVvbitDbndTM242MzIwc1hpZHMxcXdMeEJEZnNjY0FONFo5R0R1SFBCaERI?=
 =?utf-8?B?TkVnSFZnN1F3MS9ITEFsN1BrRG9YWmt6emFFM0xocXVXZXZmd3JBUnJPUjJU?=
 =?utf-8?B?anorR0lOdkRReXI2VmxyblY1dm9QVFNDVm5KZFJhOTgxRVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjJkVlJJT1Z4WjQzZUI1bzdRNEdrM0hnUUp5b0NKMHRZNWZOS0d0V1lGMEs4?=
 =?utf-8?B?RjlzWExSUHlSSDJSSFhoWmlPSGVsWk9mRGZhL0FuQzY0STE5ZWo3TkRZR0pE?=
 =?utf-8?B?ZllMUUpBeVhRUTlOZnN1dEhNb0tIQ0FUU0F1MHVXbGQ1TzFrNTBKSlNYdVBj?=
 =?utf-8?B?SG83ZTVRMDh0ME43NEhqQWZ4Y0pVejRmcjFPSzBaV2xMNktYbTR5MjltUUhQ?=
 =?utf-8?B?eG5ZTE1udGpQS3M4bk5EVFF4NEZCQkNzM3hGVmpOUzhIaGtjUkFBcG9GblVk?=
 =?utf-8?B?MjNybUZBODNqMjMyMHEzZXRtQ3Q0b0xNdEZrQk1hb2tkS055OTNlY2tIZnRj?=
 =?utf-8?B?aEpobGRaci9tamhJeXVQSFdoaVZSNW0xV0FHK0JTeVMvMDh3QzdKdWJKWXdU?=
 =?utf-8?B?QnlvYmJqTmRLanJOczd1TFdWZzJYMjQ2WjZ5ckFVSjhkZ2YwY2h0Y1pROFAx?=
 =?utf-8?B?aVF0aHcyb0JxK3E3T3Q1ZVI3WFgwL3pFVXdYcmx3Nk91V05DM0htWU1rU2t4?=
 =?utf-8?B?aWNtUWtrZ0ttaGF5a3hoUVRnNDZPOHJxa0lmZ0tVc09NTWl0UWZ2UXZwNXJ5?=
 =?utf-8?B?QkxrN1ovVy9CMWtKZXJEWVBtdTZ1MC9QMUJmQ3FvbWdyZnFqdDBUWnBuWGhN?=
 =?utf-8?B?NEJnVEs3bGtrSHhKcDRLMkxNcnJ4bVpIdi93NlhvMzdFTGpoVEs1UlRRaDQ4?=
 =?utf-8?B?NUg1bmJQUmJvOGRBNk5lWEdvQmdJVXUrOTNFcTc4cHBZK3BOTDMxUnV6OGxZ?=
 =?utf-8?B?dVBnVnNKVDk4eVFzd2p6Zm5QdXpKWmxPTnlVdjFLMzFMWEtPZFE5bXNuTmlI?=
 =?utf-8?B?UmdRZlFQWU0zdU02ZjBwWjFOeXVyVUU3b3pqTlEvU3JYNDB3MExZTThzRFVq?=
 =?utf-8?B?L1FVN214bFdHM1p2L2JSVVJhTVNRTGpoeEo3ckx5a3FDcVhmNm5lME55L1E3?=
 =?utf-8?B?TlJTKzM4SGtRSVNXQy94REQ3YXRIdjJvT2tkcmo1VDBrWFplSHI5NFlrUXJV?=
 =?utf-8?B?b2xJZ1pDTmxLTy9sclhEb3B0QVlhVW0rVStwTlphZW90bVlmWloyMU1jbVRC?=
 =?utf-8?B?RTE2YWt3SE9Ja1IwcUNWL1VYVXRYbEtJUHNhb244TzltV1hTMUtRWE5ZNys4?=
 =?utf-8?B?MkxrZXI3OEZlWFFiTmd3RUs1b0xsTHB1Sm91WHJIME5WVGdvVWdOeUJkczcx?=
 =?utf-8?B?NmZHemRJMUgxeE0zVWt6VHdYakttOHZFUTkrY3RQQUdxS3J3cDhxbTRpd0RU?=
 =?utf-8?B?VW12TUNTSHQ5bmJwUG9hQlJ2ZlFkY3hDOUVGeDVlUlJxN25YYWxWM2JYS25C?=
 =?utf-8?B?UVlvdjJxSUJSMDJjNGxodWdaYllPaDA2UDd3a2pzSjVWWkVFZk94TUF5L0E2?=
 =?utf-8?B?ZWpxZ2UvTGYzcGVSSFlpcTVoRkNjQ3liSUh4VUdMNElkUjNCVkpadTJSajFz?=
 =?utf-8?B?Mm83Ni9NbUdnMngxT0o1ZEo1YXY3NkpRTXR2UzlBWGJwcVo2OVliMkRxcjlR?=
 =?utf-8?B?Tm9wSVV4UzFqb1hVUjZWQjlWN25TcFVxYkJGMWhMdjFjWnhJTFVKdEJnSWFy?=
 =?utf-8?B?OFpZVmR3blVGL25sVWs2cm0vYmYrSDJ2czlDdytTSjRxeWVwaFNFMEMvY254?=
 =?utf-8?B?bk1yd1pNdTNUUXAzUlo4cjRLcE11R01vcHk1RERQajVQMUxmS05Lc3g0aHcx?=
 =?utf-8?B?b1dHTS9ORnRzcVl6UjZibHk1SzJjQzg1NEVhQW9zUTFSSTdhMytJM1RYSWZV?=
 =?utf-8?B?UERubGQ3RnZVUHdFeW1iRmloT1I1T2doMVdnakFkNUdENVRmZVFpOHZxMFl0?=
 =?utf-8?B?Q0hPT1Z6QzZqaHk5czdOalVKRkZZTFpiOG5JbWNEdVFIV0JzMzZVTmdBOTJs?=
 =?utf-8?B?K09PenJMT2tWangrOSttT1JNQk9uR0tXQ293N3YxakV0Q0szT0F4UWNFOXk4?=
 =?utf-8?B?SHRtQkVHZTBaL1RFanRyd0NLWEpwM2tVd1pIUDhoU3dEZktGaDVvcVZQZnI0?=
 =?utf-8?B?RkxzN3pqZjlDWEdQUWwyOUxRVTlIRzg2c09peUN2UDROOUtVNW53cTRwdHB6?=
 =?utf-8?B?M0g1RzJDKzBrcFNLL0lUNkFIYmhBTkR1dVhnZkNzZGRIKytJbWEwb2F5SjFQ?=
 =?utf-8?Q?XRIk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 583b8c80-2633-48fe-14b5-08dcb05da019
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2024 06:05:34.4132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bj25GP3HCvAR389EFiLvXJao8y20OcHsYpYSdj7We/1zGKfqDIGp9ytXNxIkoYyyJTKT8n9eXm8gOSyn/GsAZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9110
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

W1B1YmxpY10NCg0KVGhhbmtzLCBLZXZpbi4NClRoZSByZXZlcnQgcGF0Y2ggc2VlbXMgY29ycmVj
dCwgYnV0IHdlIHBsYW4gdG8gcmVmYWN0b3IgdGhpcyBmdW5jdGlvbiBhcyB0aGUgZm9sbG93aW5n
IHBhdGNoDQpmYTU3OTI0Yzc2ZDk5NSAoImRybS9hbWQvZGlzcGxheTogUmVmYWN0b3IgZnVuY3Rp
b24gZG1fZHBfbXN0X2lzX3BvcnRfc3VwcG9ydF9tb2RlKCkiKQ0KDQpJJ2xsIG1ha2UgdGltZSB0
byBwcm92aWRlIG9uZS4gVGhhbmtzIQ0KDQpSZWdhcmRzLA0KV2F5bmUNCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBrZXZpbkBob2xtLmRldiA8a2V2aW5AaG9sbS5kZXY+
DQo+IFNlbnQ6IE1vbmRheSwgSnVseSAyOSwgMjAyNCA5OjIyIFBNDQo+IFRvOiBMaW51eCByZWdy
ZXNzaW9ucyBtYWlsaW5nIGxpc3QgPHJlZ3Jlc3Npb25zQGxpc3RzLmxpbnV4LmRldj47IENocmlz
dGlhbg0KPiBIZXVzZWwgPGNocmlzdGlhbkBoZXVzZWwuZXU+DQo+IENjOiBHcmVnIEtIIDxncmVn
a2hAbGludXhmb3VuZGF0aW9uLm9yZz47IExpbiwgV2F5bmUNCj4gPFdheW5lLkxpbkBhbWQuY29t
Pjsgc3RhYmxlQHZnZXIua2VybmVsLm9yZzsgTEtNTCA8bGludXgtDQo+IGtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc+OyBNTCBkcmktZGV2ZWwgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+
Ow0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgV3UsIEhlcnNlbiA8aGVyc2VueHMu
d3VAYW1kLmNvbT47DQo+IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1k
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtSRUdSRVNTSU9OXSBObyBpbWFnZSBvbiA0ayBkaXNwbGF5
IHBvcnQgZGlzcGxheXMgY29ubmVjdGVkDQo+IHRocm91Z2ggdXNiLWMgZG9jayBpbiBrZXJuZWwg
Ni4xMA0KPg0KPiBKdWx5IDI5LCAyMDI0IGF0IDExOjE1IEFNLCAiTGludXggcmVncmVzc2lvbiB0
cmFja2luZyAoVGhvcnN0ZW4gTGVlbWh1aXMpIg0KPiA8cmVncmVzc2lvbnNAbGVlbWh1aXMuaW5m
bz4gd3JvdGU6DQo+DQo+DQo+DQo+ID4NCj4gPiBPbiAyOS4wNy4yNCAxMDo0NywgQ2hyaXN0aWFu
IEhldXNlbCB3cm90ZToNCj4gPg0KPiA+ID4NCj4gPiA+IE9uIDI0LzA3LzI5IDEwOjM1QU0sIExp
bnV4IHJlZ3Jlc3Npb24gdHJhY2tpbmcgKFRob3JzdGVuIExlZW1odWlzKQ0KPiB3cm90ZToNCj4g
PiA+DQo+ID4gPiA+DQo+ID4gPiA+IFsrR3JlZyArc3RhYmxlXQ0KPiA+ID4gPg0KPiA+ID4gPiAg
T24gMjkuMDcuMjQgMTA6MTYsIExpbiwgV2F5bmUgd3JvdGU6DQo+ID4gPiA+DQo+ID4gPg0KPiA+
ID4gIFRoYW5rcyBmb3IgdGhlIHJlcG9ydC4NCj4gPiA+DQo+ID4gPiAgUGF0Y2ggZmE1NzkyNGM3
NmQ5OTUgKCJkcm0vYW1kL2Rpc3BsYXk6IFJlZmFjdG9yIGZ1bmN0aW9uDQo+ID4gPiBkbV9kcF9t
c3RfaXNfcG9ydF9zdXBwb3J0X21vZGUoKSIpDQo+ID4gPg0KPiA+ID4gIGlzIGtpbmQgb2YgY29y
cmVjdGluZyBwcm9ibGVtcyBjYXVzaW5nIGJ5IGNvbW1pdDoNCj4gPiA+DQo+ID4gPiAgNGRmOTZi
YTY2NzYwMzQgKCJkcm0vYW1kL2Rpc3BsYXk6IEFkZCB0aW1pbmcgcGl4ZWwgZW5jb2RpbmcgZm9y
IG1zdA0KPiA+ID4gbW9kZSB2YWxpZGF0aW9uIikNCj4gPiA+DQo+ID4gPiAgU29ycnkgaWYgaXQg
bWlzc2VzIGZpeGVzIHRhZyBhbmQgd291bGQgc3VnZ2VzdCB0byBiYWNrcG9ydCB0byBmaXggaXQu
IFRoYW5rcyENCj4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+IEdyZWcsIHNlZW0gaXQgd291bGQgYmUg
d2lzZSB0byBwaWNrIHVwIGZhNTc5MjRjNzZkOTk1IGZvciA2LjEwLnkNCj4gPiA+ID4gYXMNCj4g
PiA+ID4NCj4gPiA+ID4gIHdlbGwsIGRlc3BpdGUgYSBsYWNrIG9mIEZpeGVzIG9yIHN0YWJsZSB0
YWdzLg0KPiA+ID4gPg0KPiA+ID4gPiAgQ2lhbywgVGhvcnN0ZW4NCj4gPiA+ID4NCj4gPiA+DQo+
ID4gPg0KPiA+ID4NCj4gPiA+ICBUaGUgaXNzdWUgaXMgdGhhdCB0aGUgZml4aW5nIGNvbW1pdCBk
b2VzIG5vdCBhcHBseSB0byB0aGUgNi4xMA0KPiA+ID4gc2VyaWVzDQo+ID4gPg0KPiA+ID4gIHdp
dGhvdXQgY29uZmxpY3QgYW5kIHRoZSBvZmZlbmRpbmcgY29tbWl0IGRvZXMgbm90IHJldmVydCBj
bGVhbmx5DQo+ID4gPg0KPiA+ID4gIGFzd2VsbC4NCj4gPiA+DQo+ID4NCj4gPiBIYWgsIG1hbnkg
dGh4LCBJIHNob3VsZCBoYXZlIGNoZWNrZWQgdGhhdC4NCj4gPg0KPiA+IExpbiwgV2F5bmU6IGNv
dWxkIHlvdSBtYXliZSBoZWxwIG91dCBoZXJlIGFuZCBwcm92aWRlIHNvbWV0aGluZyBmb3INCj4g
Ni4xMC55Pw0KPiA+DQo+ID4gQ2lhbywgVGhvcnN0ZW4NCj4gPg0KPg0KPiBJIHJldmVydGVkIDRk
Zjk2YmE2Njc2MDM0IGZyb20gdjYuMTAuMiBmcm9tIHRoZSBzdGFibGUvbGludXggZ2l0LCByZXNv
bHZpbmcNCj4gdGhlIGNvbmZsaWN0IGJ5IHJlbW92aW5nIGV2ZXJ5dGhpbmcgdGhhdCBnaXQgbWFy
a2VkIGFzIGZyb20gdGhlIGN1cnJlbnQgYnJhbmNoDQo+IGFuZCBrZXB0IGV2ZXJ5dGhpbmcgbWFy
a2VkIGFzIGZyb20gYmVmb3JlIHRoZSBicmFuY2ggdG8gbWVyZ2UuIFRoYXQgcmVzdWx0ZWQNCj4g
aW4gYSBwYXRjaCB0aGF0IGlzIGZpeGluZyB0aGUgcHJvYmxlbSBvbiBteSBtYWNoaW5lLiBTaW5j
ZSBJIGRvbid0IHVuZGVyc3RhbmQNCj4gd2hhdCB0aGUgY29kZSBpcyBhY3R1YWxseSBkb2luZyBp
dCBtaWdodCBicmVhayB0aGluZ3Mgb24gb3RoZXIgbWFjaGluZXMuDQo+DQo+IEZyb20gY2QxNjc0
YTQ2OWNlZGU4M2Y2YjA5MDdmMzIwYjZhZjA4YzNjODk1MCBNb24gU2VwIDE3IDAwOjAwOjAwDQo+
IDIwMDENCj4gRnJvbTogS2V2aW4gSG9sbSA8a2V2aW5AaG9sbS5kZXY+DQo+IERhdGU6IE1vbiwg
MjkgSnVsIDIwMjQgMTM6MjQ6MzggKzAyMDANCj4gU3ViamVjdDogW1BBVENIXSBUZXN0IHBhdGNo
DQo+DQo+IC0tLQ0KPiAgLi4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMu
YyAgIHwgMzMgKysrLS0tLS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgMjggZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQNCj4gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5j
DQo+IGluZGV4IGE1ZTFhOTNkZGFlYS4uNWM1NTVhMzdlMzY3IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9t
c3RfdHlwZXMuYw0KPiBAQCAtMTU5OSw3ICsxNTk5LDcgQEAgZW51bSBkY19zdGF0dXMNCj4gZG1f
ZHBfbXN0X2lzX3BvcnRfc3VwcG9ydF9tb2RlKA0KPiAgICAgIHN0cnVjdCBhbWRncHVfZG1fY29u
bmVjdG9yICphY29ubmVjdG9yLA0KPiAgICAgIHN0cnVjdCBkY19zdHJlYW1fc3RhdGUgKnN0cmVh
bSkNCj4gIHsNCj4gLSAgICBpbnQgcGJuLCBicmFuY2hfbWF4X3Rocm91Z2hwdXRfbXBzID0gMDsN
Cj4gKyAgICBpbnQgYnBwLCBwYm4sIGJyYW5jaF9tYXhfdGhyb3VnaHB1dF9tcHMgPSAwOw0KPiAg
ICAgIHN0cnVjdCBkY19saW5rX3NldHRpbmdzIGN1cl9saW5rX3NldHRpbmdzOw0KPiAgICAgIHVu
c2lnbmVkIGludCBlbmRfdG9fZW5kX2J3X2luX2ticHMgPSAwOw0KPiAgICAgIHVuc2lnbmVkIGlu
dCB1cHBlcl9saW5rX2J3X2luX2ticHMgPSAwLCBkb3duX2xpbmtfYndfaW5fa2JwcyA9IDA7IEBA
IC0NCj4gMTY0OSwzNCArMTY0OSwxMSBAQCBlbnVtIGRjX3N0YXR1cyBkbV9kcF9tc3RfaXNfcG9y
dF9zdXBwb3J0X21vZGUoDQo+ICAgICAgICAgICAgICB9DQo+ICAgICAgICAgIH0NCj4gICAgICB9
IGVsc2Ugew0KPiAtICAgICAgICAvKiBDaGVjayBpZiBtb2RlIGNvdWxkIGJlIHN1cHBvcnRlZCB3
aXRoaW4gbWF4IHNsb3QNCj4gLSAgICAgICAgICogbnVtYmVyIG9mIGN1cnJlbnQgbXN0IGxpbmsg
YW5kIGZ1bGxfcGJuIG9mIG1zdCBsaW5rcy4NCj4gLSAgICAgICAgICovDQo+IC0gICAgICAgIGlu
dCBwYm5fZGl2LCBzbG90X251bSwgbWF4X3Nsb3RfbnVtOw0KPiAtICAgICAgICBlbnVtIGRjX2xp
bmtfZW5jb2RpbmdfZm9ybWF0IGxpbmtfZW5jb2Rpbmc7DQo+IC0gICAgICAgIHVpbnQzMl90IHN0
cmVhbV9rYnBzID0NCj4gLSAgICAgICAgICAgIGRjX2JhbmR3aWR0aF9pbl9rYnBzX2Zyb21fdGlt
aW5nKCZzdHJlYW0tPnRpbWluZywNCj4gLSAgICAgICAgICAgICAgICBkY19saW5rX2dldF9oaWdo
ZXN0X2VuY29kaW5nX2Zvcm1hdChzdHJlYW0tPmxpbmspKTsNCj4gLQ0KPiAtICAgICAgICBwYm4g
PSBrYnBzX3RvX3BlYWtfcGJuKHN0cmVhbV9rYnBzKTsNCj4gLSAgICAgICAgcGJuX2RpdiA9IGRt
X21zdF9nZXRfcGJuX2RpdmlkZXIoc3RyZWFtLT5saW5rKTsNCj4gLSAgICAgICAgc2xvdF9udW0g
PSBESVZfUk9VTkRfVVAocGJuLCBwYm5fZGl2KTsNCj4gLQ0KPiAtICAgICAgICBsaW5rX2VuY29k
aW5nID0gZGNfbGlua19nZXRfaGlnaGVzdF9lbmNvZGluZ19mb3JtYXQoc3RyZWFtLT5saW5rKTsN
Cj4gLSAgICAgICAgaWYgKGxpbmtfZW5jb2RpbmcgPT0gRENfTElOS19FTkNPRElOR19EUF84Yl8x
MGIpDQo+IC0gICAgICAgICAgICBtYXhfc2xvdF9udW0gPSA2MzsNCj4gLSAgICAgICAgZWxzZSBp
ZiAobGlua19lbmNvZGluZyA9PSBEQ19MSU5LX0VOQ09ESU5HX0RQXzEyOGJfMTMyYikNCj4gLSAg
ICAgICAgICAgIG1heF9zbG90X251bSA9IDY0Ow0KPiAtICAgICAgICBlbHNlIHsNCj4gLSAgICAg
ICAgICAgIERSTV9ERUJVR19EUklWRVIoIkludmFsaWQgbGluayBlbmNvZGluZyBmb3JtYXRcbiIp
Ow0KPiArICAgICAgICAvKiBjaGVjayBpZiBtb2RlIGNvdWxkIGJlIHN1cHBvcnRlZCB3aXRoaW4g
ZnVsbF9wYm4gKi8NCj4gKyAgICAgICAgYnBwID0gY29udmVydF9kY19jb2xvcl9kZXB0aF9pbnRv
X2JwYyhzdHJlYW0tDQo+ID50aW1pbmcuZGlzcGxheV9jb2xvcl9kZXB0aCkgKiAzOw0KPiArICAg
ICAgICBwYm4gPSBkcm1fZHBfY2FsY19wYm5fbW9kZShzdHJlYW0tPnRpbWluZy5waXhfY2xrXzEw
MGh6IC8gMTAsIGJwcA0KPiA8PCA0KTsNCj4gKyAgICAgICAgaWYgKHBibiA+IGFjb25uZWN0b3It
Pm1zdF9vdXRwdXRfcG9ydC0+ZnVsbF9wYm4pDQo+ICAgICAgICAgICAgICByZXR1cm4gRENfRkFJ
TF9CQU5EV0lEVEhfVkFMSURBVEU7DQo+IC0gICAgICAgIH0NCj4gLQ0KPiAtICAgICAgICBpZiAo
c2xvdF9udW0gPiBtYXhfc2xvdF9udW0gfHwNCj4gLSAgICAgICAgICAgIHBibiA+IGFjb25uZWN0
b3ItPm1zdF9vdXRwdXRfcG9ydC0+ZnVsbF9wYm4pIHsNCj4gLSAgICAgICAgICAgIERSTV9ERUJV
R19EUklWRVIoIk1vZGUgY2FuIG5vdCBiZSBzdXBwb3J0ZWQgd2l0aGluIG1zdCBsaW5rcyEiKTsN
Cj4gLSAgICAgICAgICAgIHJldHVybiBEQ19GQUlMX0JBTkRXSURUSF9WQUxJREFURTsNCj4gLSAg
ICAgICAgfQ0KPiAgICAgIH0NCj4NCj4gICAgICAvKiBjaGVjayBpcyBtc3QgZHNjIG91dHB1dCBi
YW5kd2lkdGggYnJhbmNoX292ZXJhbGxfdGhyb3VnaHB1dF8wX21wcw0KPiAqLw0KPiAtLQ0KPiAy
LjQ1LjINCj4NCj4NCj4gUmVnYXJkcywNCj4gS2V2aW4NCg==
