Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0754EB8386C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 10:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838FE10E679;
	Thu, 18 Sep 2025 08:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zY3Cx3n5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010061.outbound.protection.outlook.com [52.101.56.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E145710E66C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 08:33:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GPNLFxsumbTHjEwnWfB2pwzYkJG0edJc/HLgUsloovj3Lmc5uovSelVcyFtdxp5Y//ZOsZw3S3V0lYe12xgTLoQhHRmUGBrZDve+6iXDSFvC8WLTQGb1adwADtdX1JpxqICb7U30pPnOdJSJxdnIPROf2DkhElZFfgr7C0/s8tBp9BloT7OUIE3oKrbClWOcco7NW6g7S00A7LpMthQ7C4uAxo0jr1TM2IhroeXu/keh/6N8xB5uA1F7ag8HJhDFAq5TrO0U+0eZr+ISKdWH1jnuxNMWySrqAMkKJ9akghiJjm/VU3JuwU1GX3rSNvM3tPy5U3ehjhlaXUunsIk6Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVYmGS69jDVJcX4jXU1GQVtXMTXVeFl+/HynScu1EOc=;
 b=r2kAPvINZuCcLC4bFL2HJ+HeRDODPQx5FK596DB1OcUoctnas5e59uoCZXSZp/Ivqf4wmOpdTca68+svzRaybOoB7RAOqs0paQsdipZFiBrIflwYL8gNbmnzJTNHo6iv6ioiBfV6511ZJakSkwZpkfne+DYpAmiSYJDBZ11TLQkcShmkd49TQMPm97VCpPrhAzleYzQHBvIQ3snlWIbvQ2IiLKHuh2NNIHaHuG07HkH5GajT6KJdU5XkIB7aCwT4Q2SpzAimgzJehhaTqPxZGq6XaypH2R6CpbEHoaGh9b9K8tsxdHj2dMGX99I30FWqy6rEY5oXlA/z5KAUKVNOoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVYmGS69jDVJcX4jXU1GQVtXMTXVeFl+/HynScu1EOc=;
 b=zY3Cx3n5gQlqW+e65/xIPC8ykxxNw+QcH9MAmvBjBxmPdNu8V2VEIKmyqq0liXrdrXn2BUyvHJgdpq+6aHkX/0HlZ2l+lkXIFJqx1vcv9Q9AiiaIMYdzXRyC7qdRiAVYBZGgy9bGdFqJyrvbdkRY74Xgw4VDYLYzNO48oUu/3RM=
Received: from CY1PR12MB9583.namprd12.prod.outlook.com (2603:10b6:930:fe::18)
 by DM3PR12MB9414.namprd12.prod.outlook.com (2603:10b6:0:47::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 08:33:20 +0000
Received: from CY1PR12MB9583.namprd12.prod.outlook.com
 ([fe80::ac1b:c950:a7d9:7d54]) by CY1PR12MB9583.namprd12.prod.outlook.com
 ([fe80::ac1b:c950:a7d9:7d54%7]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 08:33:20 +0000
From: "Tseng, Chuan Yu (Max)" <ChuanYu.Tseng@amd.com>
To: Derek Foreman <derek.foreman@collabora.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, =?utf-8?B?TWljaGVsIETDpG56ZXI=?=
 <michel.daenzer@mailbox.org>
CC: "Wentland, Harry" <Harry.Wentland@amd.com>, "Limonciello, Mario"
 <Mario.Limonciello@amd.com>, "victoria@system76.com" <victoria@system76.com>, 
 "seanpaul@google.com" <seanpaul@google.com>, "Li, Sun peng (Leo)"
 <Sunpeng.Li@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [RFC PATCH] drm/uapi: Indroduce a VRR Range Control Interface
Thread-Topic: [RFC PATCH] drm/uapi: Indroduce a VRR Range Control Interface
Thread-Index: AQHcI7gZf8Th5B5kL0uR/XQemuhkAbSPj50AgAR4RICAAF3egIAAA2aAgAH5D4CAASFRAIABIITw
Date: Thu, 18 Sep 2025 08:33:20 +0000
Message-ID: <CY1PR12MB9583E829ED2AF17A77A3EE7DE516A@CY1PR12MB9583.namprd12.prod.outlook.com>
References: <20250912073305.209777-1-Chuanyu.Tseng@amd.com>
 <010201993e2cb26f-089ce007-9e30-4b79-b487-c16c360309fd-000000@eu-west-1.amazonses.com>
 <d8694d69-62b3-4418-9fcb-d37c1daa1f9f@mailbox.org>
 <010201994e05ce63-85ad5afd-fc09-48fc-bd6e-f3716c8ba09f-000000@eu-west-1.amazonses.com>
 <d52ec8d7-cc5e-4801-bc04-096504a131b7@mailbox.org>
 <CAFZQkGzWUK5BP_f=zyOM8_pzvv6xYOaVdqN4RAULArvEmD4wUg@mail.gmail.com>
 <01020199583bf42e-4a08777d-554c-42b7-a42c-5162f4459a72-000000@eu-west-1.amazonses.com>
In-Reply-To: <01020199583bf42e-4a08777d-554c-42b7-a42c-5162f4459a72-000000@eu-west-1.amazonses.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-09-18T08:25:05.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY1PR12MB9583:EE_|DM3PR12MB9414:EE_
x-ms-office365-filtering-correlation-id: 28ed66e3-feba-418b-5432-08ddf68e062e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bDdzdnRaVTBISW1LenBtOXRWb29FN0Y5ZUUxa3J1TmpieDdicjJNL25mZm5K?=
 =?utf-8?B?SlZCRkVnOHpWTGxwUUI5Q012anlUajVrK1dKbkxBVkhLY2VXdUhCUndjR1Jt?=
 =?utf-8?B?V3MzWVozQmoyaDhJT3VuU0FFYS9laGJTaVV1aVFvbG14WEhvd0VZTjRjN0dl?=
 =?utf-8?B?ZkgwSVJiQjVDMk5halhtdG4wUmF0M25NR3FLNnI2SXpKS1FUby9Mbi9WVWhY?=
 =?utf-8?B?dytSa21qa3ZvQzcyaWVMNkxuNWRsYnZMTnJucGNxM1pLRXlOZ2ZRYmhkY0U5?=
 =?utf-8?B?Y0ZtdnUxcmxzVkZVcjVwaUVtNU9kTnZVTy9yOXhyZzZ1emtTS0xCZ2hhalBz?=
 =?utf-8?B?VVpKSGxlRm15SFJTamsvYkM1elltOE01Q0xiOGZXREpXbC94UnY1TVFUU0Jy?=
 =?utf-8?B?dGtNU3JGL3lLUFhERldCMDdycUViRGV2UENrcmpTamxFcWI4UTFOYW1DZDhi?=
 =?utf-8?B?V3VuZWdnQ0JnUjA3bkc3ZmI1djMrYk1lazBkeWVVS01Iem9FQVFYL3NNamx5?=
 =?utf-8?B?aTNyWERhTjIrTzExSVlTc3U3S0plL2EzZVVuTmMyN3htL0xuUmsrODZuZTlI?=
 =?utf-8?B?MEd2RllBMHkvMTBBaXhsZlc2V0loNmZ1N3laY0dnUGxQTmRIRCtPcUV5MWRp?=
 =?utf-8?B?Q3YzaTVYZzZoWldGdlJwc2pqVlZXYUh1SFlyNFY0NmFCRVI0dldPRTYvZDg4?=
 =?utf-8?B?K0lMUDVMajlWelhtZlQvRVFaaG9CdER1VjhJTngyY0hyVFQweFBKS3JkaHRK?=
 =?utf-8?B?cVNzU0U4ZGdDdWtOTU1xWVk1OVhTQ0VJQVRNT2U3QThxWDJCWUFzMW9ncWQx?=
 =?utf-8?B?ZmQrMmF1OUlDMkZvY1FIbTZiWmJTZmdVZUYzM3lHSTVzbnhBT1pYN29WRFgz?=
 =?utf-8?B?NmI5RnRrdTU5YVJJNldySHJZYWtPTlZpNnZtY3NyK1NXaVJoWUN5VW10d2VN?=
 =?utf-8?B?aDR5aUdRYW16SGV4c2UwTmwybk5GeVV5czR0cmNOM0RjZCt5V0pOTTVFMlJG?=
 =?utf-8?B?eCtRY21SWWRVSFkvMnZ0MnVxKzA3MHJjMjVVNnZVQzR0d3o3cEJpYWFhQWpT?=
 =?utf-8?B?Q3FWY2NTUHR0U2NKV1dJc2ZuT24zZU93K3pCMEcyTVhralVEMjAvSlk0V3N4?=
 =?utf-8?B?ME9nR1Z1TXNkV1BWOXl4WjAzbUlCVHZSSGFqaDZmeG15S28vWWloWXBMQU5G?=
 =?utf-8?B?ZUUyek90QkViTDhHMFF3K0JrL3hqRTRTZ0h0OG9Jd3Mvb2xKT1J6MXNvM09a?=
 =?utf-8?B?Y20zRmpqZEsvK1didFp5akNNODZlOWJaQTVrVzUvV2pYT2ErenJOVzYvbzg2?=
 =?utf-8?B?KzZoR3p3M0s0UDYwbG5haTFkclNqYUhXNHVIejc1aWFoNnJzb3gvYjRSWjdr?=
 =?utf-8?B?dVhxcy9SYkNCckRPcFdLOFNjNWhmczB0emJsYUo5Y0J4RVEvcm0zRFo2TXdG?=
 =?utf-8?B?TU13N0lSckRzUU0ycXBKemZIZ1lGbkhLdDNGNFNsWE5mdVNyRDVBUS9FbnlB?=
 =?utf-8?B?RE8vZDc0Slg1ZUJMSWMxZElDRjZCaHZOd0dYdVh3L1JBc3czU1hGMVg2Zjht?=
 =?utf-8?B?T0JSbnBwRndrbi9ZMkRqeHR4VG5WakNYNG9tT1ZHelo0ODJhYm5iRnNCVmRz?=
 =?utf-8?B?aVhKaDhhaTZCSXQwK2hKVVBBcWJneHh6ZktVT0tEQmdXT3RNZnZPcDdRMVFt?=
 =?utf-8?B?d2NHYzMrdjdTMXp0RFpwYVVWWklUMFpqM21hYmRnTUFPMEpUUGJxdmJsbE9M?=
 =?utf-8?B?L0NCQnZRWXp5U1ozY3ExSjVLMWxyQmxNUjd0Q2tnczUwMHBuY0VpblZhV1VG?=
 =?utf-8?B?a05QZUVleWJ3RDA4SVNiUEowOTd0eUNveTZXZU1laFZKYTF5N1F2aHBPVDds?=
 =?utf-8?B?ejhKdnBjYmVlRzRhSCtUYlRoYVFUQ2ZVcmtlS1JUa0RkbzNoaW00R0I4bFpZ?=
 =?utf-8?B?dVNrSEtwUXdNQWtqY3lDTXlSV0FzSDI3MUcxdXJ3elZTTm5WMGZITGorRnNx?=
 =?utf-8?B?NW0weEloNTNBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY1PR12MB9583.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rm8zZkp6M3lDTFhxaHV5ZlY2dGo3T1RSVXIyV3M3Q2xhbHlMME1lM3RlUWtO?=
 =?utf-8?B?ZDVyQmFOakI2akJNcmNUUnVGdWZSaUNzbDJpUGlsSGpPVlFxM0dwY0ZvaEVZ?=
 =?utf-8?B?ODNKem5HcWo2QXRZbm9rcXRTbzhPQStFWXNheFRKcU1jUmVpbk5IOHI1RTIr?=
 =?utf-8?B?a2haTm5BTGk4QmJMQ2JFb3NHbDZHRnhsWUk1Q2ZFL2JVUDV0ZnpVSVoraWUz?=
 =?utf-8?B?S1lzK2NxUlNCMUkwR2xQOUg0YlY2QmZPQVNBbUxKa3c0ZFZsMWpxempKNnNZ?=
 =?utf-8?B?Z0gyQmxieFJId3dIZERmenVUbE91OWpPMUM3K1FpazJHaWVSZ2U1c0xsZWhm?=
 =?utf-8?B?Y0J2MGl6Q3ZmajlnUy85RUJNVFZmQ3pSSUZtRVBkZW9mN0xQMkpCRVBpREMx?=
 =?utf-8?B?b05xOE0zUnlrdUsxUlJtc0ZTTjRNOTVZNFFjcnp6NmJxNityZXpoTWt6b1ox?=
 =?utf-8?B?VENtMGcyQnZLZWVFYjZSY0xlVmRjZkk1bmRmWFN0dHdKZjFIamJnZzdURnV5?=
 =?utf-8?B?NGFjaDFacDhDL2dhT3U0ei9NRGxnVEppV3VXZWNBaGZLZ0t0T2E3S1hMRHU3?=
 =?utf-8?B?d0hsY29oSmpmL0dhZnF3RVNQdkJRZ3ZyN2ZjWFlpVm5odTFFcElMTTJFT0pj?=
 =?utf-8?B?NFhTTng0RWpZeEtGM0x6SjRKeHdrZEZGeGR3TUFmaHZZTm1sSFlJc2F6Z0s1?=
 =?utf-8?B?NnE2S3ZwclBxd0s0TExTdmgzNTd2U3ZUUjdyV2NwcDczWnRKWlBjSlM5bTBp?=
 =?utf-8?B?UWs5YVZ3OVlRMlU2UkhPV3NnYWYrUW5SRllLcVhFd3pkV1RIZ3ByV28vazhl?=
 =?utf-8?B?ZHV2b1FIWHVHS3NuWmJGZHFETWJ2TjJmbjlpVWM5WmRaeU5pcG5DK1lySytI?=
 =?utf-8?B?VWF6KytpV3RCNkx0K3M3VE1LTW5DV3dhT2FtTGJ6REZtL0UxSWx4cE0zUU9N?=
 =?utf-8?B?UW4vQ2VyVlhPYlhqaTAvWHcvZnE0VjFJZmE1bVoyK2I3YlVJNzdVSW4xb1hJ?=
 =?utf-8?B?WjZuR1VpNTAwOEIvajM4UmxyZTdKckh1OTVYb1hEZ0txK2hIZjFYQ1V1T2RH?=
 =?utf-8?B?WDEvQkZxdWpuZklhNnZEdkZJd005Sk1aSnN3Q2IxeHMyc2UwUmJRU1VzS2I3?=
 =?utf-8?B?NWZEUXI5d01JbHo1VVFqcEVra1IySDRka1VKR3hoQzlnUXBxZHlWcU1YNS96?=
 =?utf-8?B?aWhzU0l1OE92dHhGSkVYVGVBUHoyYi9jSDM4eitzbTRZSUVGSFplVXViMzlQ?=
 =?utf-8?B?dWVrOGNOc1FqTUxIaGZVNnl4SGFkYkp1V3c3aFdHU01zbFVVeGFUTmRPcmw4?=
 =?utf-8?B?aStKTm5Gb1FTYTNkQkY0MXJBZnRqZVVIWG01UnBOcnNUVWtPYnJBQ0JNNHIw?=
 =?utf-8?B?dEhTRVUwbmxxeUhWSlZsSDE1d1EvdEdyTFYzV0lrc2hpT3Z6by9sOHlDVjkv?=
 =?utf-8?B?Tis4S2J2REFFTFBYY3JOK0JkN0hRUmVyS0pyQUFXWWpKU2FLR1BJaGtUd3BQ?=
 =?utf-8?B?OXREYzBzRjJIUlVVU21CYjhsR3ZDOWsweWZybUNaTXBFSk5KMi9EbHJyK0hO?=
 =?utf-8?B?MW16cnNEU2duVGdwd1lzODhqNmh2WCsxY2xzc1NwY2xEeFAzZ2p2b0o1d0hZ?=
 =?utf-8?B?azZacTFibzVQVmZHMjkwazcxMmQwT0xNUGlqMkI0bFZiUVZwRnpsZ0V0WXBK?=
 =?utf-8?B?K0Y0NXJpaFlJeFVxaWhaMXp6OWRzODNTQVJvL3R6UVRHTVkvVXJXK1BZTVBw?=
 =?utf-8?B?MU15UEZiTFphbDBHVmZzYVFNQkhDa25yU2NNN0JKOGNzRkNRMDRCbDBvc0k4?=
 =?utf-8?B?ZFlKUmhyODM0d1hxYiszbmFZeUlIWnk3QjdIS3UyK3FraVhnazF0d0NnM0hk?=
 =?utf-8?B?aldXSFpiVmpvRVlZY2R5Nkg0WkhPVDczQ2xudWdDWDRvQWZNWXQrZ3gwT0U1?=
 =?utf-8?B?RmU5OXFsVXhEdzRUb3RKb0VmUUtTU3BzOWcxTHVSKzZQMHV2ajRUTzdhclI3?=
 =?utf-8?B?M284R2FiM0VrZXNQb0Nkc0tvT1p5c28rRUlLcDVGeXhZSFdKV2FDSmZ4M21o?=
 =?utf-8?B?L2lHUVkzRGpZOTdlQ0tOVlk4NjJsS0V6VGkvRTh3WGxZdE95YVZ4MityTTJ2?=
 =?utf-8?Q?8B/8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9583.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ed66e3-feba-418b-5432-08ddf68e062e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2025 08:33:20.5428 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aXSDrsIp6zhPdWZC0ZMifrTtmnoGQJyaFQmjgGzig7rKoAzgLksp0cTR1EnVkxzjAMdd4fjDu3nVEgL7hpoIcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9414
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
Cg0KT24gOS8xNi8yNSA0OjU2IFBNLCBYYXZlciBIdWdsIHdyb3RlOg0KPiBBbSBNby4sIDE1LiBT
ZXB0LiAyMDI1IHVtIDE3OjQ5IFVociBzY2hyaWViIE1pY2hlbCBEw6RuemVyDQo+IDxtaWNoZWwu
ZGFlbnplckBtYWlsYm94Lm9yZz46DQo+PiBPbiAxNS4wOS4yNSAxNzozNywgRGVyZWsgRm9yZW1h
biB3cm90ZToNCj4+PiBPbiA5LzE1LzI1IDU6MDEgQU0sIE1pY2hlbCBEw6RuemVyIHdyb3RlOg0K
Pj4+PiBPbiAxMi4wOS4yNSAxNTo0NSwgRGVyZWsgRm9yZW1hbiB3cm90ZToNCj4+Pj4+IE9uIDkv
MTIvMjUgMjozMyBBTSwgQ2h1YW55dSBUc2VuZyB3cm90ZToNCj4+Pj4+PiBJbnRyb2R1Y2UgYSBE
Uk0gaW50ZXJmYWNlIGZvciBEUk0gY2xpZW50cyB0byBmdXJ0aGVyIHJlc3RyaWN0IHRoZQ0KPj4+
Pj4+IFZSUiBSYW5nZSB3aXRoaW4gdGhlIHBhbmVsIHN1cHBvcnRlZCBWUlIgcmFuZ2Ugb24gYSBw
ZXItY29tbWl0DQo+Pj4+Pj4gYmFzaXMuDQo+Pj4+Pj4NCj4+Pj4+PiBUaGUgZ29hbCBpcyB0byBn
aXZlIERSTSBjbGllbnQgdGhlIGFiaWxpdHkgdG8gZG8gZnJhbWUtZG91YmxpbmcvDQo+Pj4+Pj4g
cmFtcGluZyB0aGVtc2VsdmVzLCBvciB0byBzZXQgbG93ZXIgc3RhdGljIHJlZnJlc2ggcmF0ZXMg
Zm9yDQo+Pj4+Pj4gcG93ZXIgc2F2aW5ncy4NCj4+Pj4+IEknbSBpbnRlcmVzdGVkIGluIGxpbWl0
aW5nIHRoZSByYW5nZSBvZiBWUlIgdG8gZW5hYmxlIEhETUkncyBRTVMvQ2luZW1hVlJSIGZlYXR1
cmVzIC0gaWU6IHN3aXRjaGluZyB0byBhIGZpeGVkIHJhdGUgZm9yIG1lZGlhIHBsYXliYWNrIHdp
dGhvdXQgaW5jdXJyaW5nIHNjcmVlbiBibGFja291dHMvcmVzeW5jcy8iYm9ua3MiIGR1cmluZyB0
aGUgc3dpdGNoLg0KPj4+Pj4NCj4+Pj4+IEkgY291bGQgc2VlIHVzaW5nIGFuIGludGVyZmFjZSBz
dWNoIGFzIHRoaXMgdG8gZG8gdGhlIGZyYW1lIHJhdGUgbGltaXRpbmcsIGJ5IHNldHRpbmcgdGhl
IGxvd2VyIGFuZCB1cHBlciBib3VuZHMgYm90aCB0byBhIG1lZGlhIGZpbGUncyBmcmFtZXJhdGUu
IEhvd2V2ZXIgZm9yIHRoYXQgdXNlIGNhc2UgaXQncyBub3QgcHJlY2lzZSBlbm91Z2gsIGFzIHZp
ZGVvIG1heSBoYXZlIGEgcmF0ZSBsaWtlIDIzLjk3NjAyMzkuLi4gRlBTLg0KPj4+Pj4NCj4+Pj4+
IFdvdWxkIGl0IGJlIGJldHRlciB0byBleHBvc2UgdGhlIGxpbWl0cyBhcyBhIG51bWVyYXRvci9k
ZW5vbWluYXRvciBwYWlyIHNvIGEgcmF0ZSBjYW4gYmUgc29tZXRoaW5nIGxpa2UgMjQwMDAvMTAw
MWZwcz8NCj4+Pj4gSSB3YXMgdGhpbmtpbmcgdGhlIHByb3BlcnRpZXMgY291bGQgYWxsb3cgZGly
ZWN0bHkgc3BlY2lmeWluZyB0aGUgbWluaW11bSBhbmQgbWF4aW11bSBudW1iZXIgb2YgdG90YWwg
c2NhbmxpbmVzIHBlciByZWZyZXNoIGN5Y2xlLCBiYXNlZCBvbiB0aGUgYXNzdW1wdGlvbiB0aGUg
ZHJpdmVyIG5lZWRzIHRvIHByb2dyYW0gc29tZXRoaW5nIGFsb25nIHRob3NlIGxpbmVzLg0KPj4+
IFN1cnByaXNpbmdseSwgdGhpcyB3b3VsZCBhbHNvIG5vdCBiZSBwcmVjaXNlIGVub3VnaCBmb3Ig
ZXhhY3QgbWVkaWEgcGxheWJhY2ssIGFzIHRoZSBleGFjdCBpbnRlbmRlZCBmcmFtZXJhdGUgbWln
aHQgbm90IHJlc3VsdCBpbiBhbiBpbnRlZ2VyIG51bWJlciBvZiBzY2FuIGxpbmVzLiBXaGVuIHRo
YXQgaGFwcGVucyBhIFFNUy9DaW5lbWFWUlIgY2FwYWJsZSBIRE1JIHNvdXJjZSBpcyBleHBlY3Rl
ZCB0byBwZXJpb2RpY2FsbHkgcG9zdCBhIGZyYW1lIHdpdGggYSBzaW5nbGUgZXh0cmEgc2NhbiBs
aW5lIHRvIG1pbmltaXplIHRoZSBlcnJvci4NCj4+IEludGVyZXN0aW5nLCBtYXliZSB5b3VyIHN1
Z2dlc3Rpb24gb2YgbnVtZXJhdG9yIC8gZGVub21pbmF0b3IgcHJvcGVydGllcyBpcyBiZXR0ZXIg
dGhlbi4NCj4gQVBJIHdpc2UsIEknZCBtdWNoIHByZWZlciBqdXN0IHVzaW5nIG5hbm9zZWNvbmRz
IGluc3RlYWQgb2YgdHdvDQo+IHByb3BlcnRpZXMgdGhhdCBjb21wb3NpdG9ycyB3aWxsIGluIHBy
YWN0aWNlIGp1c3QgdXNlIHRoZSBzYW1lIHdheS4NCg0KPlllYWgsIEkgaGVhciB5b3UuIFBlcmlv
ZCBpcyBnZW5lcmFsbHkgbXVjaCBuaWNlciB0aGFuIGZyZXF1ZW5jeSwgYW5kIGV2ZXJ5IG90aGVy
IHRpbWUgSSdkIHVuY29uZGl0aW9uYWxseSBhZ3JlZSwgYnV0IFFNUyBpcyBhd2t3YXJkIGluIHRo
aXMgcmVnYXJkLg0KPg0KPlRoZSBtZWRpYSBmaWxlIEkgc3RhcnQgd2l0aCB3aWxsIGhhdmUgYSBm
cmFjdGlvbiBzcGVjaWZpZWQgaW4gaW50ZWdlcnMgZm9yIHRoZSByYXRlLCBlZzogc29tZXRoaW5n
IGxpa2UgMjQwMDAvMTAwMSBmcHMuIFRoYXQgd2lsbCBtYXAgdG8gYW4gaW5kZXggaW4gYW4gYXJy
YXkgb2YgUU1TIGJsZXNzZWQgdGFyZ2V0IGZyYW1lcmF0ZXMgKDI0MDAwLzEwMDEsIDI0LCAyNSwg
NDgvMTAwMSwgNDguLi4pIGFuZCB0aGUgaW5kZXggZW5kcyB1cCBpbiBhIGJpdGZpZWxkIGluIHRo
ZSBIRE1JIFFNUyBpbmZvZnJhbWUuIFRoYXQgaW5mb2ZyYW1lIGFsc28gaGFzIGEgYml0IHRvIGlu
ZGljYXRlIHRoYXQgdGhlIGZyYW1lcmF0ZSBpcyBjdXJyZW50bHkgY29uc3RhbnQsIHdpdGggY29u
c3RhbnQgZGVmaW5lZCBhcyAiY29uc3RhbnQgbnVtYmVyIG9mIHNjYW5saW5lcyBidXQgbWF5IGJl
IGV4YWN0bHkgMSBzY2FubGluZSBsb25nZXIgb2NjYXNpb25hbGx5Ii4NCj4NCj5JbiB0aGUgY29u
c3RhbnQgc3RhdGUgd2UnZCBuZWVkIHRvIG1haW50YWluIHRoYXQgZml4ZWQgcmF0ZSB3aXRoaW4g
dGhhdCBjb25zdHJhaW50LCBhbmQgdGhlIGludGVnZXIgbWF0aCB0byBkbyB0aGF0IG5lZWRzIHRv
IHN0YXJ0IGZyb20gMjQwMDAvMTAwMS4NCj4NCj5TbyBpZiB3ZSB1c2VkIGEgbmFub3NlY29uZCBw
ZXJpb2QgZm9yIHRoZSBpbnRlcmZhY2UsIHdlJ2QgbmVlZCB0byB0YWtlIHRoZSBtZWRpYSBmaWxl
J3MgdmFsdWVzIGFuZCBjb252ZXJ0IHRoZW0gdG8gbmFub3NlY29uZHMsIHRoZW4gaW4gdGhlIGtl
cm5lbCBjb252ZXJ0IGJhY2sgdG8gc29tZXRoaW5nIGxpa2UgbWlsbGlmcmFtZXMgcGVyIHNlY29u
ZCAoc28gd2UgY291bGQgZ2V0IHNvbWV0aGluZyBuZWFyIDIzOTc2KSwgdGhlbiBsb29rIHRoYXQg
dXAgaW4gdGhlIFFNUyBhY2NlcHRlZCByYXRlcyBhcnJheSwgaGF2ZSBzb21lIG1hbm5lciBvZiBl
cHNpbG9uIHRvIGRlY2lkZSBpZiB3ZSdyZSBjbG9zZSBlbm91Z2ggdG8gb25lIG9mIHRoZW0gdG8g
dXNlIGl0LCBhbmQgdGhlbiB1c2UgdGhlIGludGVnZXIgcmVwcmVzZW50YXRpb24gKGJhY2sgdG8g
MjQwMDAvMTAwMSkgdG8gc2V0dXAgdGhlIHNjYW5saW5lIHRlbXBvcmFsIGRpdGhlcmluZyBhbGdv
cml0aG0gdG8gZG8gdGhlICsxIGV4dHJhIGxpbmUgZXZlcnkgZmV3IGZyYW1lcyB0byBoaXQgdGhl
IGV4YWN0IHJhdGUuDQo+DQo+SW4gZWZmZWN0IHdlJ2QgdGhyb3cgYXdheSB0aGUgcHJlY2lzZSB2
YWx1ZXMgd2Ugc3RhcnRlZCB3aXRoIGFuZCB0cnkgdG8gcmVjb25zdHJ1Y3QgdGhlbSBsYXRlci4N
Cj4NCj5RTVMgYWxzbyBoYXMgdGhlIGFkZGVkIHN0cmFuZ2UgZmVhdHVyZSBvZiBiZWluZyBhYmxl
IHRvIHNldCBhIGZpeGVkIHJhdGUgYmVsb3cgdGhlIGRpc3BsYXkncyBub3JtYWwgVlJSIG1pbmlt
dW0sIHNvIEknbSB1bmRlY2lkZWQgYXMgdG8gd2hldGhlciB0aGlzIHJhbmdlIGNvbnRyb2wgaW50
ZXJmYWNlIGlzIGFuIGlkZWFsIG1hdGNoIGZvciBzZXR0aW5nIHVwIFFNUyBhbnl3YXksIG9yIHdo
ZXRoZXIgSSBzaG91bGQgcHJvcG9zZSBhIHNlcGFyYXRlIGZpeGVkIHJhdGUgcHJvcGVydHkgbGF0
ZXIuIEkganVzdCBkb24ndCB3YW50IHRvIGlnbm9yZSB0aGlzIGRpc2N1c3Npb24gYW5kIHNob3cg
dXAgcHJvcG9zaW5nIGFub3RoZXIgbm9uLW9ydGhvZ29uYWwgcHJvcGVydHkgbGF0ZXIuDQo+DQo+
U29ycnkgdG8gYmUgc3BlYWtpbmcgaW4gaHlwb3RoZXRpY2FscywgSSBkbyBoYXZlIGEgd29ya2lu
ZyBRTVMgaW1wbGVtZW50YXRpb24gdG8gc2hhcmUgc29vbmlzaCwgaXQncyBqdXN0IG5vdCBxdWl0
ZSByZWFkeSBmb3IgcmV2aWV3IHlldC4uLg0KDQpUaGFua3MgZm9yIHRoZSBpbnB1dC4gRm9yIHRo
ZSBRTVMgc3VwcG9ydCwgaXQncyByZWxhdGVkIHRvIEhETUkgMi4xIHNwZWMuIEZyb20gbXkga25v
d2xlZGdlLCBpdCdzIG5vdCBvcGVuIHRvIGV2ZXJ5b25lLg0KV2UgbWlnaHQgc3BlcmF0ZSB0aGlz
IFFNUyBzdXBwb3J0IGludG8gZGlmZmVyZW50IGRpc2N1c3Npb25zLg0KDQpUbyBzdXBwb3J0IEZQ
Uy8xLjAwMSwgSSB0aGluayB3ZSBjYW4gYXVnbWVudCAxIG1vcmUgcHJvcGVydHkgaW4gdGhpcyBw
YXRjaCwgb25jZSBpdCdzIHNldCwgd2UgY2FuIGRpdmlkZSB0aGlzIEZQUyB3aXRoIDEuMDAxLCB2
aXNlIHZlcnNhLg0KDQpUaGFua3MsDQotLQ0KQ2h1YW55dS4NCg0KDQo=
