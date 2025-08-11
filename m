Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E28E0B21712
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 23:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351CF10E547;
	Mon, 11 Aug 2025 21:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bTu2qL/k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8286E10E541;
 Mon, 11 Aug 2025 21:10:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0b4OQBJBdm39BkyQSzGgrCUfafAH3SK41uvRMOBSNG9fjpMBbV0uhA6vErv+O7A24DVp0Wwt3XDpPPISYuZaT+0TH5v92RVf8bLGcKO7wacIYoSdjiRD/62ipHd3H/iE83ZTc2r92fHr4DW7KQer/wsio8rdsFAt9Ghxy84h3KFw4+zuC85tpmgd6vpS/AzXMQ5FucTZN1bPAmB6jdx/6z6nZSkNo8nhKFqmx8fSzr/dKL721n9h1FZ3AKz5InQYv4ioaaoew6sVrPXgNetb4NJh18giuPd5Lyyyg63h8OcMBm1ldxWrDybEyV4kJCbqxzfdyzyvokqsLEEIz8YIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdKGorFUQmyA5JguEf3ZglyNH2EYGr4fQpCJ8M52t1o=;
 b=FVU7ag3SHKzcVKG8hBrUw53kLo1NZcDq4T0KIkS4e5Aad0JkQOOszbOas0xNi+PtEjopXpCnwNF0vQ0FNk1Avj3Z3Zym2cyOJrI6lw48CQ/JKIQex94Arn6785u4cL5u6+zhg8bTdHpUxAth9uY9dT/arJUbiQAocC9JghkQSJR1jHR243f1IvSnpUoUVvYe4305+lhkS2xzjc32/K42tpWLpI58FFDBIZEiz6XvYtg5u/7ut7QQ8eZA/+FnsOSL8e9saQgjYxmig81qSiXoY0fI8L61GljdxrHZRkrTnredQiyzxMzWP2Tbi0aoq3ESC8kAwsZ08tlYbYijdPOfbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdKGorFUQmyA5JguEf3ZglyNH2EYGr4fQpCJ8M52t1o=;
 b=bTu2qL/kAD9SJE4236vKvo1yqMMGvsg44MwCr3oFA7MJ4eszYOpEze/Jq2Rj1cBqBDTuLqMxrjYAFcplBLflPNZllHYFhaEYiLb4mwbVZ8LBDmcwIydp4e55ND4Cyt9Iz3cQy/J9bCBWEog9bi9YWjdrVSq7yDbQw8bP8dGEX5Y=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA0PR12MB7556.namprd12.prod.outlook.com (2603:10b6:208:43c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 21:09:54 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 21:09:54 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: "Hung, Alex" <Alex.Hung@amd.com>, Melissa Wen <mwen@igalia.com>, Rodrigo
 Siqueira <siqueira@igalia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "andrzej.hajda@intel.com"
 <andrzej.hajda@intel.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "neil.armstrong@linaro.org"
 <neil.armstrong@linaro.org>, "rfoss@kernel.org" <rfoss@kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "Li, Sun peng (Leo)"
 <Sunpeng.Li@amd.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>
CC: Michel Daenzer <michel.daenzer@mailbox.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "kernel-dev@igalia.com"
 <kernel-dev@igalia.com>
Subject: Re: [PATCH v6 00/14] drm/amd/display: more drm_edid to AMD display
 driver
Thread-Topic: [PATCH v6 00/14] drm/amd/display: more drm_edid to AMD display
 driver
Thread-Index: AQHb/cWinIDyu7JV+ECUOZsr7TKJFbRIM0WAgBXAo4CAABiegIAAAH6A
Date: Mon, 11 Aug 2025 21:09:54 +0000
Message-ID: <4e94993a-92b3-4584-bfed-468d7606830d@amd.com>
References: <20250726003816.435227-1-mwen@igalia.com>
 <019ca526-5bdf-4c88-a994-a6babb9963c7@amd.com>
 <83d8ed56-2c2b-47dd-83a1-8e8f6a49fef3@igalia.com>
 <b0511344-f654-4f91-aa1a-06d7588a5db5@amd.com>
In-Reply-To: <b0511344-f654-4f91-aa1a-06d7588a5db5@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|IA0PR12MB7556:EE_
x-ms-office365-filtering-correlation-id: 84043019-9d95-4907-a447-08ddd91b6b3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dmtMMnNMUlE3RWJlbmgzZUtSVzdZMTZEREdzdWVsUU5vOUlqdjl1V0NMUUpM?=
 =?utf-8?B?WWllWUJhbGhyMmE4Y3ZpSDNWb3hkV2V6ZjV0dUFMUVJ3bkhZMzJWY1dlQmRj?=
 =?utf-8?B?dmtvb2p6QlJrTnlVT1F1TXdPWmxmZVNhVjhiL2RuZk9nSzJRODNqQUcwblV6?=
 =?utf-8?B?eXNFRHgza1ZyU09NTVlQeDdkaHgxMUhKTjZaV0NaSWxENGVrZjd0d2VwbTFO?=
 =?utf-8?B?VVlwMEZlWlYreHpEaTVkSWREaUcxOHN0ejRiQ2E2R3BWRUdTU2tjUC9RejFY?=
 =?utf-8?B?S2Jxak9JR25mVXZQUXRrbUZoVWhQV1Y2Tm9oL1BQOEt0Y2pMNmdOZC9ES2o4?=
 =?utf-8?B?NmJ2NWJHMGRDbWJncHRwWEJ0TVgxM2RJOUFZdTFMS0pvTWNTMlk2ZFVPUVZa?=
 =?utf-8?B?dVMrbXhaUTlnS0RhaVo3OFRZd1JkR3dmNlZWcG0rdHE2V1RjMHI1dlpyTElE?=
 =?utf-8?B?UEw5ckNPR1BGajlYMFNrYkpkYzZIWE9hendUb3FpS3huSmVRU1dEVFkzaVBN?=
 =?utf-8?B?VFZ5NElLcVl1ZzMrdDA1UFhJKy80Zmt5QmFUc01iTVVEeTk2VTJTRTRsSFgy?=
 =?utf-8?B?M1RRS3hWRUNxdlpxM1pNcFN5QTA2SFMzQlN6NWpoL2t4UytSVm5KNFFBaGt5?=
 =?utf-8?B?amdSS3pDbEcxYkw5Y1BQN3pJQUQzTmhNdmcralNVUVBCcGN3SmdkdlZhSGpP?=
 =?utf-8?B?L2pGWHY5M2FwOTNvenlaZ2oyeFlGNUZiS3BtMFJ6WlhCcFBoLzZHWE91Ujdq?=
 =?utf-8?B?NTFEcnB0a1E0ZE1BOXlVVEZYNUpvamQxR0lodi9zVGxSV21JS0FXblNHdVFI?=
 =?utf-8?B?eVEzVWhwRTBWZktSSCt1cEw0VlA5ekNhNHRLd0xBbG5tUmE1RU4wclUwKyts?=
 =?utf-8?B?NDVackVNSkZXN3M2SXF2elpqaEQrZUM4am5sbHJjeDdIOFpRTVVCTEZIZGhI?=
 =?utf-8?B?MmFQUWJGeXFBSXN6amdLOGRpOWdzTmtuMVY4YmNBenVSZWdXZTVIMlhkQXU0?=
 =?utf-8?B?SFd5M3FvVFdla2lYU2EvTDZId3BVcjhuVW1KSzNMcnR0U1lhd1d2b2lkKzla?=
 =?utf-8?B?NWQ1RkVyVEdySDhrWlNJakUxYVQrRzRicDdqckRoanRLOGM3dXNGSStKNzlS?=
 =?utf-8?B?SklWYUl5bFVuTjc3NGpqTkd4ZStNRDNCSHE4bEhJeEhkY3V2YVdDUzcxRmd3?=
 =?utf-8?B?U1RSeEZJUXdOQ2JhRC8xLzR5NFpuRkZ6bWI5V0kwRkg4dVplVVY5MzE4RFdO?=
 =?utf-8?B?b2UvTmlIUVdyMnBLbVdBcGI5ck1nYmdXMnlSdGZZcjkzQnl2RmVnSmlTTDJp?=
 =?utf-8?B?amlRMlNuS2ZFRWNnOXdHUDVZMmthZ0dWekhJQ2t4T21tbk1uNE5vVmE3TnBx?=
 =?utf-8?B?TXlJUVl0dEE1NCt2NFM3SVY4b0doMDVzRFYxendYMXA0clExTjl1TjBhOHd0?=
 =?utf-8?B?cXBBMnY3eG9UUHZ1VEhOUFk5c0VnbjVlMFVlQjk0bDN3RnhqMUNVV25SaHo5?=
 =?utf-8?B?R21hMWR6UjlFN2dmSlVJU3ZuRDJqT0RqRFR6a2gxMDNVQW5mT1EvdlQvcDlo?=
 =?utf-8?B?d1dyYy9KT09Tem9oZHp2VGZ2eU0wcXhIZFg4Z1dEQmo3bDZhdSs1eEVKdCtT?=
 =?utf-8?B?a2Vyb3M2N1ZXV0pUc3doK25vNUdzS05ES01yOEhqRWhXTlMvRkczSDlIZ2pD?=
 =?utf-8?B?UWtoclBpeGgyRjlVOUN5YmRsbzlJdkgvNUV5TittYmNLelRrb0w1M3lTU2M1?=
 =?utf-8?B?R2VRbUtscVpqSVFWNVVlc2NKSklRdDRvcEI5QlFyT0JHeDdEcVoyRHZodWRl?=
 =?utf-8?B?aThoT3piRXJPUlBRNkM0N3JrNGpKTlk3ejE4TXUxenlqeDIwU005bHMrZWht?=
 =?utf-8?B?VW1NWW9jMVJXQSsvQUZxWnFBRGtvaDNxaGEvUlN4dFYxblRRQjVMMVZMbkNo?=
 =?utf-8?B?QkZHNjlHOXVVL3hQMTNySEh2eS9RUkIxS2pnejFxdHNNL2htN2pYR25ZT2kz?=
 =?utf-8?B?Vy9RZlBxaS9rV3hqc1FPQXBmT2c5QmgxVmh4TlNWZDV2YUxUQjVSZHJhcVBw?=
 =?utf-8?Q?JYWTEM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWt1bGZyaDJXNlp1aHBOaXI1NjBVQ1M0a3lwaXpGYkpHVHA2SFRUU2JuQnRN?=
 =?utf-8?B?NTR2K1RqeEY4UEROc1NKZHRZeGhJMDB0eU9kNnoxRGZ4VWQ1NS9PRzVhcE1P?=
 =?utf-8?B?VjEwcnZWTlQ0bHhuZ1N5S3hDVHpwTGFOUDkvVzBZZFFLakRJeFYvRmJCYUtz?=
 =?utf-8?B?Vmp3b1ptN2lsWDVRbEY1bDRYdXJETnVVSWl2ZzdQbmc4NWZzRUdWcmlLYzBC?=
 =?utf-8?B?b1A2bTg3SG9Wb2lBT0xzeXNNRW8rclhYOHRrSUZRaWlRd0tmMjFjUkNwdW5Y?=
 =?utf-8?B?dlRXZWNzOE9kb2RjeStiTXBrcGRRd2Z2aklGRlBxV2Z4RW5TbU8vcVVDM1Rl?=
 =?utf-8?B?cjBTNjRpamViVFc4UXZpa2lJZ3MvQTcxZGdKZGphL3djT2x4SEdJRWMwT28x?=
 =?utf-8?B?c0ltaXJlT1M3ajRJVU8xZnQxaFV5U3NWaXpFWEU3SHh1eU5DVTlBQXFZRDNt?=
 =?utf-8?B?a2drZlZoN29GZG9pRGZhaUFPRGM5ZEd6QzBheVhZRHk0VW5JWU5qYk15NSts?=
 =?utf-8?B?SlVSWWZxbTBWekNZOUxjd1FIbWY0aUI5VGNKYXpPTzlCdjRsc2oxNDdlRUhL?=
 =?utf-8?B?Z1Azb041TVBrdW5rOXJkdHZvRlUybDcyM3A2YWtFT1ZBRmk2YWU3ekI3SDhF?=
 =?utf-8?B?K01jT0NwNFpZYnQxUHlUVFpmUDkwQ0syODZGYm9hZTBMN2w4ZnhNdkMzQ0Zi?=
 =?utf-8?B?R2MvMCtiZjNGb1pUbHdQTzNtTTZUM2RJMlllNHRUVEJYSG1idjJUQ0xDditm?=
 =?utf-8?B?K2NlMFdFajVEaHJGVklROGJ3UExyU2M5K0FIRFNEQ3V4S09LNFc2UllwZGpy?=
 =?utf-8?B?ejFRRkxZKzFscVJWZVR0eGFTVHJYdjRIekNXRXhxNGs1Ty9TdXRLY1ZvZDVI?=
 =?utf-8?B?OHBLWkw2Y0dGN0hERUJZd2wzS3NadFpuNzNIaDZ0eFVGV1pnYStyQVpoTkZP?=
 =?utf-8?B?N0hCVkZTd2pZS1F5ODE1Yk5maWRjOFRTc05RamxRdHptYkdKRnNXUndPVzNu?=
 =?utf-8?B?R2dhWURPc3QwbldRRGdvTElBK0pENklpaVRET0czUTJ0SUViYUZmN0E5Uml0?=
 =?utf-8?B?cmJ2U1hXWWU3aS90U3NBNlJpcnFlYU5QY1RzTVNQcW9WRVFmSDBHZk45ZHNV?=
 =?utf-8?B?TmhuTkRySnpaYnNmZ0R6bVNnaHhIRURDZzJvNTNHYktBN3JvbUJTY1E1alhY?=
 =?utf-8?B?NDQ1czlvMmhzY3NaU1IyY21BRFVxZG53NUxlaUdXK1hKSVVqR3RqZmlUSHRD?=
 =?utf-8?B?V0ErRHI0Wkw4Q3RKTXJ6a29LQ1pDZEpqWmx3SzFtS3RUWm01VWJIKzNDMWEr?=
 =?utf-8?B?MEZ2djl0aDdocVZXbTA2aXp1cy91QWRtZEF6ejRCeFlTRzNwODZQanZlUER6?=
 =?utf-8?B?TE5yb0M4S2I4NmNaNnJCSHYxOUJndEwwZ1lJYW1VeHg4UEs2b0pVRmQrRlVa?=
 =?utf-8?B?SEVHY2VWVTRzbURPU2J4TitmaVJsckhwMEtzT3lqcDNMWXYyNVJWcUd0L0N3?=
 =?utf-8?B?WW9lWDltZkhnU1FzdkNCR3RoZ05NdlV4K2lKQkN3NHhvc2ZHQnFWelgrODU5?=
 =?utf-8?B?NDRBeGRXdkFKVXQzenpsd2orNGplTDRZNS9JZ280Nk1KbVNSS01sMXVXci9C?=
 =?utf-8?B?Y01nUWl2Q1pxZmtXMWY0djR0T05CMUFoQW8wSXBoYVFib3JjTkc0VW55eTFK?=
 =?utf-8?B?SjFzcEF4TnA3VFJBVU03M1psaTlRcllnK1QyWWQzWUw1M1ZUaitVMmVzc3NZ?=
 =?utf-8?B?NE03emUwQzRzK0JGaVhSeDdaRGJVNWh4aXMvdU03WkRPUlNwYVJkbDYwS2hR?=
 =?utf-8?B?ZHlNSUlhQTd3cktIQVY5VEIyaEI5QjJka3VKbUNYS0J0TkxIa1NPL2pEK0x2?=
 =?utf-8?B?OWpMQmFKdklFZDAyZndHTDM5NVhNZnhjRytWeGRUVkdqeG83SUI0YWJmOEx2?=
 =?utf-8?B?Qk5ZRjl4cUNSaGxVb2hzZEpyRTF1SlFPazI0OUsvVU5oVGQ0MjhWa1VnU1Nj?=
 =?utf-8?B?NVE4QWJpbHFnVksrU2pmajQ1Tzl4QkRuYlV1WXNpYXRTdHJYWUZoSkZmaExp?=
 =?utf-8?B?TVQvUC95UERIYjlYYXRIck04ekhMZ0tUOUk3VFVOeDc3ODJMV1pNbThZSTRN?=
 =?utf-8?Q?M7Yw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF9E9E691C76414985C36F2685417856@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84043019-9d95-4907-a447-08ddd91b6b3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2025 21:09:54.2693 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: whM+MmSZ0mO+7I/GDLuQUIXU8i6ZUH6C/XxozRq4ZR+X/XCzinNgWG2g2XanwkhDd+ATgF2ZFXtZ7QH7vCkqig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7556
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

T24gOC8xMS8yNSA0OjA4IFBNLCBIdW5nLCBBbGV4IHdyb3RlOg0KPiBNZWxpc3NhLA0KPiANCj4g
VGhlIHBhdGNoc2V0IHBhc3NlZCBwcm9tb3Rpb24gYW5kIENJLg0KPiANCj4gSG93ZXZlciwgc2lu
Y2Ugb3VyIERDIGNvZGUgaXMgc2hhcmVkIHdpdGggdGhlIG90aGVyIE9TLCBjYWxsaW5nIGRybV8q
IA0KPiBmdW5jdGlvbnMgaW4gREMgd29uJ3Qgd29yayBmb3IgdXMuIEZvciBleGFtcGxlLCBjYWxs
aW5nIA0KPiBkY19lZGlkX2NvcHlfZWRpZF90b19zaW5rIGZyb20gZGMvbGluay9saW5rX2RldGVj
dGlvbi5jIGluIHBhdGNoIDE0Lg0KPiANCj4gSSBkb24ndCBoYXZlIGEgZ29vZCB3YXkgdG8gaGFu
ZGxlIGl0LiBEb2VzIGl0IG1ha2Ugc2Vuc2Ugbm90IHRvIHRvdWNoIERDIA0KPiBjb2RlIGZvciBu
b3c/DQoNCldoYXQgYWJvdXQgaWYgd2UgaGF2ZSBhIHNldCBvZiBjb21wYXRpYmlsaXR5IG1hY3Jv
cyBpbiBEQyBjb2RlPw0KDQpTb21ldGhpbmcgbGlrZSB0aGlzOg0KDQojaWZuZGVmIGRybV9kYmcN
CiNkZWZpbmUgZHJtX2RiZyAuLi4uDQojZW5kaWYNCj4gDQo+IE9uIDgvMTEvMjUgMTM6NDAsIE1l
bGlzc2EgV2VuIHdyb3RlOg0KPj4NCj4+DQo+PiBPbiAyOC8wNy8yMDI1IDIwOjI5LCBBbGV4IEh1
bmcgd3JvdGU6DQo+Pj4gVGhhbmtzLiBJIHdpbGwgc2VuZCB2NiB0byBwcm9tb3Rpb24gdGVzdC4N
Cj4+IEhpIEFsZXgsDQo+Pg0KPj4gQW55IG5ld3MgYWJvdXQgdGhpcyByb3VuZCBvZiB0ZXN0cz8N
Cj4+DQo+PiBCUiwNCj4+DQo+PiBNZWxpc3NhDQo+Pg0KPj4+DQo+Pj4gT24gNy8yNS8yNSAxODoz
MywgTWVsaXNzYSBXZW4gd3JvdGU6DQo+Pj4+IEhpLA0KPj4+Pg0KPj4+PiBTaXF1ZWlyYSBhbmQg
SSBoYXZlIGJlZW4gd29ya2luZyBvbiBhIHNvbHV0aW9uIHRvIHJlZHVjZSB0aGUgdXNhZ2Ugb2YN
Cj4+Pj4gZHJtX2VkaWRfcmF3IGluIHRoZSBBTUQgZGlzcGxheSBkcml2ZXIsIHNpbmNlIHRoZSBj
dXJyZW50IGd1aWRlbGluZSBpbg0KPj4+PiB0aGUgRFJNIHN1YnN5c3RlbSBpcyB0byBzdG9wIGhh
bmRsaW5nIHJhdyBlZGlkIGRhdGEgaW4gZHJpdmVyLXNwZWNpZmljDQo+Pj4+IGltcGxlbWVudGF0
aW9uIGFuZCB1c2Ugb3BhcXVlIGBkcm1fZWRpZGAgb2JqZWN0IHdpdGggY29tbW9uLWNvZGUNCj4+
Pj4gaGVscGVycy4NCj4+Pj4NCj4+Pj4gVG8ga2VlcCBEQyBhcyBhbiBPUy1hZ25vc3RpYyBjb21w
b25lbnQsIHdlIGNyZWF0ZSBhIG1pZCBsYXllciB0aGF0DQo+Pj4+IGlzb2xhdGVzIGBkcm1fZWRp
ZGAgaGVscGVycyBjYWxsZWQgaW4gdGhlIERDIGNvZGUsIHdoaWxlIGFsbG93aW5nIG90aGVyDQo+
Pj4+IE9TZXMgdG8gaW1wbGVtZW50IHRoZWlyIHNwZWNpZmljIGltcGxlbWVudGF0aW9uLg0KPj4+
Pg0KPj4+PiBUaGlzIHdvcmsgaXMgYW4gZXh0ZW5zaW9uIG9mIFsxXS4NCj4+Pj4NCj4+Pj4gLSBQ
YXRjaCAxIGFkZHJlc3NlcyBhIHBvc3NpYmxlIGxlYWsgYWRkZWQgYnkgcHJldmlvdXMgbWlncmF0
aW9uIHRvDQo+Pj4+IMKgwqAgZHJtX2VkaWQuDQo+Pj4+IC0gUGF0Y2ggMiBhbGxvY2F0ZXMgYSB0
ZW1wb3JhcnkgZHJtX2VkaWQgZnJvbSByYXcgZWRpZCBmb3IgcGFyc2luZy4NCj4+Pj4gLSBQYXRj
aGVzIDMtNyB1c2UgY29tbW9uLWNvZGUsIGRybV9lZGlkIGhlbHBlcnMgdG8gcGFyc2UgZWRpZA0K
Pj4+PiDCoMKgIGNhcGFiaWxpdGllcyBpbnN0ZWFkIG9mIGRyaXZlci1zcGVjaWZpYyBzb2x1dGlv
bnMuIEZvciB0aGlzLCBwYXRjaCA0DQo+Pj4+IMKgwqAgaW50cm9kdWNlcyBhIG5ldyBoZWxwZXIg
dGhhdCBnZXRzIG1vbml0b3IgbmFtZSBmcm9tIGRybV9lZGlkLg0KPj4+PiAtIFBhdGNoZXMgOC05
IGFyZSBncm91bmR3b3JrIHRvIHJlZHVjZSB0aGUgbm9pc2Ugb2YgTGludXgvRFJNIHNwZWNpZmlj
DQo+Pj4+IMKgwqAgY29kZSBpbiB0aGUgREMgc2hhcmVkIGNvZGUNCj4+Pj4gLSBQYXRjaCAxMCBj
cmVhdGVzIGEgbWlkIGxheWVyIHRvIG1ha2UgREMgZW1icmFjZXMgZGlmZmVyZW50IHdheXMgb2YN
Cj4+Pj4gwqDCoCBoYW5kbGluZyBFRElEIGJ5IHBsYXRmb3Jtcy4NCj4+Pj4gLSBQYXRjaCAxMSBt
b3ZlIG9wZW4tY29kZWQgbWFuYWdlbWVudCBvZiByYXcgRURJRCBkYXRhIHRvIHRoZSBtaWQNCj4+
Pj4gwqDCoCBsYXllciBjcmVhdGVkIGJlZm9yZS4NCj4+Pj4gLSBQYXRjaCAxMiBpbnRyb2R1Y2Vz
IGEgaGVscGVyIHRoYXQgY29tcGFyZXMgRURJRHMgZnJvbSB0d28gZHJtX2VkaWRzLg0KPj4+PiAt
IFBhdGNoIDEzIGFkZHMgZHJtX2VkaWQgdG8gZGNfc2luayBzdHJ1Y3QgYW5kIGEgbWlkLWxheWVy
IGhlbHBlciB0bw0KPj4+PiDCoMKgIGZyZWUgYGRybV9lZGlkYC4NCj4+Pj4gLSBQYXRjaCAxNCBz
d2l0Y2ggZGNfZWRpZCB0byBkcm1fZWRpZCBhY3Jvc3MgdGhlIGRyaXZlciBpbiBhIHdheSB0aGF0
DQo+Pj4+IMKgwqAgdGhlIERDIHNoYXJlZCBjb2RlIGlzIGxpdHRsZSBhZmZlY3RlZCBieSBMaW51
eCBzcGVjaWZpYyBzdHVmZi4NCj4+Pj4NCj4+Pj4gW3YxXSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9kcmktZGV2ZWwvMjAyNTA0MTEyMDEzMzMuMTUxMzM1LTEtIA0KPj4+PiBtd2VuQGlnYWxpYS5j
b20vDQo+Pj4+IENoYW5nZXM6DQo+Pj4+IC0gZml4IGJyb2tlbiBhcHByb2FjaCB0byBnZXQgbW9u
aXRvciBuYW1lIGZyb20gZWxkIChKYW5pKQ0KPj4+PiDCoMKgIC0gSSBpbnRyb2R1Y2VkIGEgbmV3
IGhlbHBlciB0aGF0IGdldHMgbW9uaXRvciBuYW1lIGZyb20gZHJtX2VkaWQNCj4+Pj4gLSByZW5h
bWUgZHJtX2VkaWRfZXEgdG8gZHJtX2VkaWRfZXFfYnVmIGFuZCBkb2MgZml4ZXMgKEphbmkpDQo+
Pj4+IC0gYWRkIE5VTEwgZWRpZCBjaGVja3MgKEphbmkpDQo+Pj4+IC0gZml4IG1pc2hhbmRsaW5n
IG9mIHByb2R1Y3RfaWQubWFudWZhY3R1cmVyX25hbWUgKE1pY2hlbCkNCj4+Pj4gwqDCoCAtIEkg
ZGlyZWN0bHkgc2V0IGl0IHRvIG1hbnVmYWN0dXJlcl9pZCBzaW5jZSBzcGFyc2UgZGlkbid0IGNv
bXBsYWluLg0KPj4+PiAtIGFkZCBNYXJpbydzIHItYiBpbiB0aGUgZmlyc3QgZml4IHBhdGNoIGFu
ZCBmaXggY29tbWl0IG1zZyB0eXBvLg0KPj4+Pg0KPj4+PiBbdjJdIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2RyaS1kZXZlbC8yMDI1MDUwNzAwMTcxMi4xMjAyMTUtMS0gDQo+Pj4+IG13ZW5AaWdh
bGlhLmNvbS8NCj4+Pj4gQ2hhbmdlczoNCj4+Pj4gLSBrZXJuZWwtZG9jIGFuZCBjb21taXQgbXNn
IGZpeGVzIChKYW5pKQ0KPj4+PiAtIHVzZSBkcm1fZWRpZF9sZWdhY3lfaW5pdCBpbnN0ZWFkIG9m
IG9wZW4gY29kZWQgKEphbmkpDQo+Pj4+IC0gcGxhY2UgZHJtX2VkaWQgbmV3IGZ1bmMgaW50byB0
aGUgcmlnaHQgc2VjdGlvbiAoSmFuaSkNCj4+Pj4gLSBwYXJhbWVudGVyIG5hbWVzIGZpeCAoSmFu
aSkNCj4+Pj4gLSBhZGQgSmFuaSdzIHItYiB0byB0aGUgcGF0Y2ggMTINCj4+Pj4gLSByZW1vdmUg
dW5uZWNlc3NhcnkgaW5jbHVkZSAoSmFuaSkNCj4+Pj4gLSBjYWxsIGRjX2VkaWRfc2lua19lZGlk
X2ZyZWUgaW4gbGlua19kZXRlY3Rpb24sIGluc3RlYWQgb2YgDQo+Pj4+IGRybV9lZGlkX2ZyZWUN
Cj4+Pj4gLSByZWJhc2Ugb24gdG9wIG9mIGFzZG4NCj4+Pj4NCj4+Pj4gW3YzXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAyNTA1MTQyMDIxMzAuMjkxMzI0LTEtIA0KPj4+PiBt
d2VuQGlnYWxpYS5jb20vDQo+Pj4+IENoYW5nZXM6DQo+Pj4+IC0gcmViYXNlIHRvIGFzZG4NCj4+
Pj4gLSBzb21lIGtlcm5lbC1kb2MgZml4ZXMNCj4+Pj4gLSBtb3ZlIHNvbWUgY2hhbmdlcyB0byB0
aGUgcmlnaHQgY29tbWl0DQo+Pj4+DQo+Pj4+IFt2NF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YW1kLWdmeC8yMDI1MDYxMzE1MDAxNS4yNDU5MTctMS0gDQo+Pj4+IG13ZW5AaWdhbGlhLmNvbS8N
Cj4+Pj4gQ2hhbmdlczoNCj4+Pj4gLSBmaXggY29tbWVudHMgYW5kIGNvbW1pdCBtZXNzYWdlcyAo
TWFyaW8pDQo+Pj4+IC0gcmVtb3ZlIHVubmVjZXNzYXJ5IGRybV9lZGlkIGR1cCBhbmQgZml4IG1l
bSBsZWFrIChNYXJpbykNCj4+Pj4gLSBhZGQgTWFyaW8ncyByYiB0byBwYXRjaGVzIDUtNw0KPj4+
Pg0KPj4+PiBbdjVdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FtZC1nZngvMjAyNTA2MTgxNTIy
MTYuOTQ4NDA2LTEtIA0KPj4+PiBtd2VuQGlnYWxpYS5jb20vDQo+Pj4+IENoYW5nZXM6DQo+Pj4+
IC0gZml4IE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSAoQWxleCBILikgd2l0aCB0aGUgc2FtZSBh
cHByb2FjaCANCj4+Pj4gcHJvcG9zZWQNCj4+Pj4gwqDCoCBieSA3YzNiZTNjZTNkZmFlDQo+Pj4+
DQo+Pj4gPiAtLS0+DQo+Pj4+IFRoZXJlIGFyZSB0aHJlZSBzcGVjaWZpYyBwb2ludHMgd2hlcmUg
d2Ugc3RpbGwgdXNlIGRybV9lZGlkX3JhdygpIGluIA0KPj4+PiB0aGUNCj4+Pj4gZHJpdmVyOg0K
Pj4+PiAxLiByYXcgZWRpZCBkYXRhIGZvciB3cml0ZSBFRElEIGNoZWNrc3VtIGluIERQX1RFU1Rf
RURJRF9DSEVDS1NVTSB2aWENCj4+Pj4gwqDCoMKgIGRybV9kcF9kcGNkX3dyaXRlKCksIHRoYXQg
QUZBSUsgdGhlcmUgaXMgbm8gY29tbW9uIGNvZGUgc29sdXRpb24gDQo+Pj4+IHlldDsNCj4+Pj4g
Mi4gb3Blbi1jb2RlZCBjb25uZWN0aXZpdHkgbG9nIGZvciBkYyBsaW5rIGRldGVjdGlvbiwgdGhh
dCBtYXliZSBjYW4gYmUNCj4+Pj4gwqDCoMKgIG1vdmVkIHRvIGRybSAoPyk7DQo+Pj4+IDMuIG9w
ZW4tY29kZWQgcGFyc2VyIHRoYXQgSSBzdXNwZWN0IGlzIGEgbG90IG9mIGR1cGxpY2F0ZWQgY29k
ZSwgYnV0DQo+Pj4+IMKgwqDCoCBuZWVkcyBjYXJlZnVsIGV4YW1pbmluZy4NCj4+Pj4NCj4+Pj4g
SSBzdWdnZXN0IHRvIGFkZHJlc3MgdGhvc2UgcG9pbnRzIGluIGEgbmV4dCBwaGFzZSBmb3IgcmVn
cmVzc2lvbiANCj4+Pj4gY29udHJvbC4NCj4+Pj4NCj4+Pj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FtZC1nZngvMjAyNTAzMDgxNDI2NTAuMzU5MjAtMS0gDQo+Pj4+IG13ZW5AaWdhbGlh
LmNvbS8NCj4+Pj4NCj4+Pj4gTGV0IG1lIGtub3cgeW91cnMgdGhvdWdodHMhDQo+Pj4+DQo+Pj4+
IE1lbGlzc2ENCj4+Pj4NCj4+Pj4gTWVsaXNzYSBXZW4gKDEyKToNCj4+Pj4gwqDCoCBkcm0vYW1k
L2Rpc3BsYXk6IG1ha2Ugc3VyZSBkcm1fZWRpZCBzdG9yZWQgaW4gYWNvbm5lY3RvciBkb2Vzbid0
IA0KPj4+PiBsZWFrDQo+Pj4+IMKgwqAgZHJtL2FtZC9kaXNwbGF5OiBzdGFydCB1c2luZyBkcm1f
ZWRpZCBoZWxwZXJzIHRvIHBhcnNlIEVESUQgY2Fwcw0KPj4+PiDCoMKgIGRybS9hbWQvZGlzcGxh
eTogdXNlIGRybV9lZGlkX3Byb2R1Y3RfaWQgZm9yIHBhcnNpbmcgRURJRCBwcm9kdWN0IA0KPj4+
PiBpbmZvDQo+Pj4+IMKgwqAgZHJtL2VkaWQ6IGludHJvZHVjZSBhIGhlbHBlciB0aGF0IGdldHMg
bW9uaXRvciBuYW1lIGZyb20gZHJtX2VkaWQNCj4+Pj4gwqDCoCBkcm0vYW1kL2Rpc3BsYXk6IGdl
dCBwYW5lbCBpZCB3aXRoIGRybV9lZGlkIGhlbHBlcg0KPj4+PiDCoMKgIGRybS9hbWQvZGlzcGxh
eTogZ2V0IFNBRCBmcm9tIGRybV9lbGQgd2hlbiBwYXJzaW5nIEVESUQgY2Fwcw0KPj4+PiDCoMKg
IGRybS9hbWQvZGlzcGxheTogZ2V0IFNBREIgZnJvbSBkcm1fZWxkIHdoZW4gcGFyc2luZyBFRElE
IGNhcHMNCj4+Pj4gwqDCoCBkcm0vYW1kL2Rpc3BsYXk6IHNpbXBsaWZ5IGRtX2hlbHBlcnNfcGFy
c2VfZWRpZF9jYXBzIHNpZ25hdHVyZQ0KPj4+PiDCoMKgIGRybS9hbWQvZGlzcGxheTogY2hhbmdl
IERDIGZ1bmN0aW9ucyB0byBhY2NlcHQgcHJpdmF0ZSB0eXBlcyBmb3IgDQo+Pj4+IGVkaWQNCj4+
Pj4gwqDCoCBkcm0vZWRpZDogaW50cm9kdWNlIGEgaGVscGVyIHRoYXQgY29tcGFyZXMgZWRpZCBk
YXRhIGZyb20gdHdvIA0KPj4+PiBkcm1fZWRpZA0KPj4+PiDCoMKgIGRybS9hbWQvZGlzcGxheTog
YWRkIGRybV9lZGlkIHRvIGRjX3NpbmsNCj4+Pj4gwqDCoCBkcm0vYW1kL2Rpc3BsYXk6IG1vdmUg
ZGNfc2luayBmcm9tIGRjX2VkaWQgdG8gZHJtX2VkaWQNCj4+Pj4NCj4+Pj4gUm9kcmlnbyBTaXF1
ZWlyYSAoMik6DQo+Pj4+IMKgwqAgZHJtL2FtZC9kaXNwbGF5OiBhZGQgYSBtaWQtbGF5ZXIgZmls
ZSB0byBoYW5kbGUgRURJRCBpbiBEQw0KPj4+PiDCoMKgIGRybS9hbWQvZGlzcGxheTogY3JlYXRl
IGEgZnVuY3Rpb24gdG8gZmlsbCBkY19zaW5rIHdpdGggZWRpZCBkYXRhDQo+Pj4+DQo+Pj4+IMKg
IC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9NYWtlZmlsZcKgwqDCoCB8wqDCoCAx
ICsNCj4+Pj4gwqAgLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
IHzCoCAzMyArKystLS0NCj4+Pj4gwqAgLi4uL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG1faGVscGVycy5jIHwgMTA5ICsrKysrKyANCj4+Pj4gKy0tLS0tLS0tLS0tDQo+Pj4+IMKgIC4u
Li9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmPCoMKgIHzCoCAyMSArKy0t
DQo+Pj4+IMKgIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9kY19lZGlkLmPCoMKg
IHzCoCAzOSArKysrKysrDQo+Pj4+IMKgIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9kY19lZGlkLmjCoMKgIHzCoCAxNSArKysNCj4+Pj4gwqAgLi4uL2RybS9hbWQvZGlzcGxheS9k
Yy9jb3JlL2RjX2xpbmtfZXhwb3J0cy5jIHzCoMKgIDkgKy0NCj4+Pj4gwqAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfc2luay5jIHzCoMKgIDMgKw0KPj4+PiDCoCBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAx
MCArLQ0KPj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1faGVscGVycy5o
wqDCoCB8wqDCoCA3ICstDQo+Pj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9p
bmMvbGluay5owqDCoMKgwqAgfMKgwqAgOSArLQ0KPj4+PiDCoCAuLi4vZHJtL2FtZC9kaXNwbGF5
L2RjL2xpbmsvbGlua19kZXRlY3Rpb24uY8KgIHzCoCAzMCArKy0tLQ0KPj4+PiDCoCAuLi4vZHJt
L2FtZC9kaXNwbGF5L2RjL2xpbmsvbGlua19kZXRlY3Rpb24uaMKgIHzCoMKgIDkgKy0NCj4+Pj4g
wqAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWwtc2lpODYyMC5jwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoMKgIDIgKy0NCj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX21zdF90
b3BvbG9neS5jIHzCoMKgIDIgKy0NCj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNTQgKysrKysrKy0tDQo+
Pj4+IMKgIGluY2x1ZGUvZHJtL2RybV9lZGlkLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxMCArLQ0KPj4+PiDCoCAxNyBmaWxlcyBjaGFuZ2VkLCAx
OTkgaW5zZXJ0aW9ucygrKSwgMTY0IGRlbGV0aW9ucygtKQ0KPj4+PiDCoCBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9kY19lZGlkLmMNCj4+
Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vZGNfZWRpZC5oDQo+Pj4+DQo+Pj4NCj4+DQo+IA0KDQo=
