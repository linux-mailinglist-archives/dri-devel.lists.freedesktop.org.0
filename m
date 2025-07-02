Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC414AF5A88
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 16:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396F810E71A;
	Wed,  2 Jul 2025 14:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dIpB6TOU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD3610E715;
 Wed,  2 Jul 2025 14:07:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ScQsvjgz/cBj6k20KdBX9YhdahkvE6lLX5ZPpN7Gdl/wxnOidtZsKgAzqcoVKJsGzAPaj2+4hNzl0RbrjE33L6R5cyCfK3ILKJtDPCa9fsvh3eKZBDp8CAXV4DvtQ11ri622MRUlkxdocTWwFv8QoXvITqprpb00qxBEyZDmRslfh5Xl0K6FDHDZutUWIn5guYKNnb6c8j32ra9KiRIFxOWcEhg7U9NiKZbmK9ewtNTn8CuZelxdPAHLmHsBZH30+5cD5MRpEHgiMDLWrITaW39iz4kxUJ+D1Pf/Psgt/ZrhBhl76qY92ArK9Esa+Iw/A8Llgw6iCgjE6wGzn1K7Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQZdYMLRcst0xvvLdGgZxcvQuHEaoiPg7wll016keEE=;
 b=Q24IPJDtdlEw6Rpn3D3gWPqMq8Nf2M366/5oFH/+N6Ed58IXugBkHMpQvN0y2DayqGqtkC01uE9NN3iqzosXq4vtJPRAo2IapN7Bp8HXg6fpDHcjnrd08Efyn6PP76f7Ss9ibrCmQyW59jdDA2R9NVeSHFXdb0P0z7/KeyPCuUglNrImWTQP29QIuO8u0FOpqyWAPR9zW8Wu+TwGSLtfDfbBR+kpKk0gbIiTgSXO4XwnniyIYkdteDkk87oJvRqyVO6UmRd6n9Cu/DLgsCMNdNJf6OJ5/cFQUqInJ0UJN+HpYZTCHQc8MOLHiPljsgfMb52ivYj2+q3icn8mrQWOuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQZdYMLRcst0xvvLdGgZxcvQuHEaoiPg7wll016keEE=;
 b=dIpB6TOUY2V8h5n43u67cuwg+90piyLIR6lipf0BAmiNODs9o7bflFVe/M7YXXn73YlFAZXtxflNbBNrkvMchTGbbrKlzdkkYALJea/qjvXEHqzpq5jdIWQ7j4/rMx4IQbxehy0v1l563UE/KjHeG+ssSuVl65qlB/vfSzt3KFc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7804.namprd12.prod.outlook.com (2603:10b6:8:142::5) by
 PH7PR12MB7331.namprd12.prod.outlook.com (2603:10b6:510:20e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 2 Jul
 2025 14:07:50 +0000
Received: from DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290]) by DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290%4]) with mapi id 15.20.8880.023; Wed, 2 Jul 2025
 14:07:50 +0000
Message-ID: <84d111fd-f71d-4f4b-ab33-a6ff800731f8@amd.com>
Date: Wed, 2 Jul 2025 19:37:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/amdgpu: skip kfd resume_process for
 dev_pm_ops.thaw()
To: Alex Deucher <alexdeucher@gmail.com>, Sam <guoqzhan@amd.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Zhang, GuoQing (Sam)" <GuoQing.Zhang@amd.com>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "len.brown@intel.com" <len.brown@intel.com>,
 "pavel@kernel.org" <pavel@kernel.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "Zhao, Victor" <Victor.Zhao@amd.com>, "Chang, HaiJun"
 <HaiJun.Chang@amd.com>, "Ma, Qing (Mark)" <Qing.Ma@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250630104116.3050306-1-guoqing.zhang@amd.com>
 <20250630104116.3050306-4-guoqing.zhang@amd.com>
 <8806781b-90d1-4b99-a798-dd1d29d4c8c0@amd.com>
 <8eb1700d-4d60-4a1e-9d09-718f65baaf1e@amd.com>
 <019a15d5-142f-4761-9408-58c103d3922b@amd.com>
 <CADnq5_PHfNTbLL7Xmb9HFgtZemDVaLSqbrONWWEf9hjwk1rF1Q@mail.gmail.com>
 <1e82f0af-daf6-4dd6-bc43-2969ac970589@amd.com>
 <CADnq5_M_NWSbqJUrBcDy_bARrPcQDDhSvHCKCqEoTWijBWHxGg@mail.gmail.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <CADnq5_M_NWSbqJUrBcDy_bARrPcQDDhSvHCKCqEoTWijBWHxGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0229.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::11) To DS0PR12MB7804.namprd12.prod.outlook.com
 (2603:10b6:8:142::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7804:EE_|PH7PR12MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: d3773be9-4baa-4f80-3ec3-08ddb971d41c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzhrbElVSmo1RmpkaHViRWk5dUtQbnRoOTFFRjNNYytUYWpjK2VDeGxtWlNQ?=
 =?utf-8?B?aWs5SHpMUHJTRThUN1ZYclJ0UWI3eGdQa0FYWTBISFE0UHRXZ3lUQkxJT0RV?=
 =?utf-8?B?VCtVenJQYXI3YzV1NHQ2UUVkc2g3d1ozSHBQT2k1cCtJMERPQitudCt5eTBD?=
 =?utf-8?B?N0JTcXg5VzA0Z0ZTVHdwWElpalc2RnU5N1lTYS9sd3pTWG80QjM4anJ6dk5F?=
 =?utf-8?B?c1k0Y3V3Z0FucW9qUXIwVnpITEVod0JJNHg0S3orYlkyZlVmbDFLaHBLWUYr?=
 =?utf-8?B?RmdFWWZPQXY5RkhoU3hTcGF2dUoxTnVOYXo0T2ttYWx5OGsrQ05BdEV4cnlh?=
 =?utf-8?B?OVRWcXM1S3ljM25ldnFXUHdYWlVQSng5MWdSSThhZTI2NXVjaDVnMFZBZUh1?=
 =?utf-8?B?MnhRMk1RQTliUGJkUVlrZ0NXQU4xZUUxQWZvMmJmR0Mxc3lyQTYrWDU5V0ZJ?=
 =?utf-8?B?UHdUVVZCd005NkNDdTlQRzgzWjBVMEY3OHExVFJMYmgrUGlFbm1taGtZRU9L?=
 =?utf-8?B?U3NMMUFpam1wVk1vTDZqTVF0R1FoZ1NPVUdhL2RuRWtReG15MlZNTHBYajNn?=
 =?utf-8?B?NmNIUytqWkZ0ZUplTUExN0IzZGxPelpPRU9yV0k4YlR0aWVwcFdRSnY4YWpn?=
 =?utf-8?B?TlIzMVBTWFRLSWxmQ0dsUFVGanQ4MmxTVEZkRnk0bUV5UjIwMFFBTVVHNzR1?=
 =?utf-8?B?WG9yMWtEOEpEcld4T2xqSFN0R0VPOU1ydjR2REV1Wlo0MXR6c3o2RFNuVlRy?=
 =?utf-8?B?T1pPdjlQaFFPNmpjYzErMCthcysrdjk0Mld0SHAwZnoxRDRhMXdMQzVDN3l0?=
 =?utf-8?B?WGlYOTRLU3pTVzdvbVdvbExkK3poaWduN1lZNVNuNjZwSC9TR0JSdVBhQito?=
 =?utf-8?B?VFo2UHU0N0NCQ2VQWGl3Zm44cDVoZVJKc09pYWdEZzlpQnNHdlY2Y2JJaVB3?=
 =?utf-8?B?dlJLL01wb1J5cys3V2VIK0lPUEVqYjYvVGo0d0IrNzBZanJaV0tnaVRENVF3?=
 =?utf-8?B?aDc3UkxNdnZTTjFqbGNtdkx0NzlxekEyc1h0d05lOEU4Rkh2QzhHYVcrdnpR?=
 =?utf-8?B?RVJ4UFpLRjZtNGlnOU1OcjY3UGlmZzFSVW5EWXljUWJWeWgweEh4eUl1R0FD?=
 =?utf-8?B?NU5BaWZ5bzE5OThKQSs4RlljNTlJQWpURFFpS2ZFNEdtVmI5UkQrZGVlYURi?=
 =?utf-8?B?L0orMjVCT1NKRlVWcVNFNWtTRmRnQStENmpqRi9QQWkvZlNnVFU2RmN0MCtw?=
 =?utf-8?B?QThQUHR2b3hkVDZIZk8wa3RYTlN5a0diK0NZT1dNTGJVWnc1WTloZXVvVnhB?=
 =?utf-8?B?ZXVGVmw4M1MyclRINmRzTTdIUXNKY01IN3ErMnVBVE9STFRYd0xSNS9QTnlk?=
 =?utf-8?B?eFJFalM2cXBCcDZMa2M5VnZIOVNIV2hqd1o5ejdSZ09VVFg5UWFWelZJKzM5?=
 =?utf-8?B?QUMyV0NZaHlJSFFNUjZhaXcwMWN0VnVVYUZ1WmRBTnFjdE1Ya1ZsSGNxSXRE?=
 =?utf-8?B?T3hsL3pGSHZQN2IyYjcxVlRQQjdKUzhnaURDV29COGtMK1Z2ajJxcGNFOVNE?=
 =?utf-8?B?ODRrTXloMU52eitKaCthc0ZWeFJxRFIxK1NiRWhEdzNPUlJTR1ArQlp1bWZP?=
 =?utf-8?B?Zk45cGdFVnArUFNSMUIzZ1h4emw1ZWpKTWxOdFpqd3dFeDNBWHVXZFNpYll4?=
 =?utf-8?B?OWhGNmZhU0xINVNGVjRGdWRpWXFxNVVIWmJxZU9qV1p0QjliaDN4Y292VXlv?=
 =?utf-8?B?WG1ndGV2UmI1WXJQdlFwYXBoUmpZMWllcUV6cmYyOWk0UlF3Nzkxa2pVclM2?=
 =?utf-8?B?Zmd0WUNMbi84YU9ZUXd5aWpBV2htOTZrb0RidEgzOFVZMXBFb1JObHFuTHJr?=
 =?utf-8?Q?nu1eY2LOTt3Fh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7804.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHEvOGFCME1XSHlRSVlzMFRQQjFnbG5XUGYzUUIrSU9HZEVZRGF2OWFrZERt?=
 =?utf-8?B?SnZqQnZibHVIaThiZG1tNzhFUjBhS0hxNkNjVS9GSHdwSEFPYkMxeDdEUHF5?=
 =?utf-8?B?Wlp3cEZnZWJTS0RWVDF0bmhxczFVRkJ1RitPVXRrR0YzZnduNEVCeGtlNnJw?=
 =?utf-8?B?M3Eyai9vMDNtWitTMDMwdkVMazdEa2R0U1JNNzN2UDhnamdDZUxSYm42ZGZL?=
 =?utf-8?B?NU0xbVNjd1ZFUHJvSlRtTWJ5cFNnVm9SbjB6ZENQcEtwajBWYlExdm9kWWxB?=
 =?utf-8?B?UThpTkVxQjd3dmpMZ3BqWG5hcVYzNjY4ZjVLZURBOVgxZW1tZXIrYmE0TmlY?=
 =?utf-8?B?QnRUY1ZGekVPK0Nha0pZWnhVbG11M1JvTDFyVkZYRTNDTGFNdmIzZjZOQVhU?=
 =?utf-8?B?T2ovZHBqamJsVGlpaDhHQmtOdFhZUnp2RXF0bjlrY1R1Umtoc09idTVIUEJY?=
 =?utf-8?B?MkF5SzV1OXV2dmpaRW1yUmQ0OGdkR003cjJqcjlIM050d2ptMHBEK055bG0w?=
 =?utf-8?B?TW82UGg3cnYyLzJnOTF6K0QyeGFXWjZ5eSsvdlIzY1FhRFpWVkxBcitoakNi?=
 =?utf-8?B?djdaZDB1ZGkySmN3dWxEdzVGenpiVjZaOHcreFU3RWdFMWhPbVhHK3RwNXBK?=
 =?utf-8?B?czRzaWFCNTJxMzB6bkpuakJBQU9JQnBsNkwyeUxRUWNxeW5TV2kxZlhoRmdC?=
 =?utf-8?B?eE5KRVNzemxsZU9Mc3JqWFpGZGxUYkxjVG5IKytGRGlMS1hZR0JoZGlDdVBn?=
 =?utf-8?B?L0ZXcVNSZkZYMDRyMHJ4YU1TYjA2TnBYVTJFcFFCU1JmZnlOSWp0OC9ST094?=
 =?utf-8?B?b2IvaXhqdmY1TTMyWTBwejYrSUt3Q1BCTnZVY0h4eC9mRGd2QlNWSk9jVU1G?=
 =?utf-8?B?dVlqRmVYZEtDS0UxRTR1c2ZDQzQ1a2g5dnExTGVNUVlwdWZOY0R1K28xWUdL?=
 =?utf-8?B?V2QzWkRrcFp0UlFLZ2dXQW1ZZ3FNYW5lcGpWeU0xVUNveUVCMWpGODhibkJ1?=
 =?utf-8?B?U1k2SldxVjR5VGtUREw4QTJVaWRTWVIxMUx6SGFMSnJkS09VaHBJdmJUbHda?=
 =?utf-8?B?OTRRNlJueFVSdFFPUTA5M0Z5YktId0U3Q21lR3cyaHV2KzIrQk1tOWY3ZVFo?=
 =?utf-8?B?Y0l5OUlESWhwT2tUQnp1dDZrQmxzUHBEYjJjZ2dKaWRHMU9TVjczV21nS1dK?=
 =?utf-8?B?Z3dQb1hTZ3daMUJ1M091ZUpMaGlhRS9FUllFVDA4MTBlbk1GeHU5T2VxOW1p?=
 =?utf-8?B?S3ZWQ1BVWU11emd6Z3ZqVk5UN2ZoWkVCU0hVajludmlZbHFaKzlod3NOUDEx?=
 =?utf-8?B?ZmE5U1pmNE5aSTM3bXdnL1Z1ZjczVmExVHBSUEtjM2pqYUh6MmhPMXRnVHYy?=
 =?utf-8?B?QS9XdUVEVWFrQXR6ZFM3cG5wZmdKZWxSZTRGTTJseWFaYjNXL1h4SFQ4aVFS?=
 =?utf-8?B?Njk2TmREM29wWUxBTHZONW1aSWVXQi9nR1gvbU1mRFVxeWNFck96cGFjZDlq?=
 =?utf-8?B?MDM0Q1JTRHl6aTE1QjNZVktHM1JwWWN1eUxJSHRBM2NyOW9mSDNqc2krMGNq?=
 =?utf-8?B?MmZSUFJ3bWNSZUpseGlzRnBNdWVod283dmZnZm9MU2FZaWtNZCtkS0JndkNN?=
 =?utf-8?B?WitXc1VZQUlyT3d3YllEZm8ybVF0R3M0UzVSbHR4VzZXejFsaTVGSlBJczNH?=
 =?utf-8?B?NW51a2NIRmwrQjdRWGtZS3lick1XUGtrd21IQXRRMUNJakNoOXdlK2VMWUxQ?=
 =?utf-8?B?R0Vmbnp0K29GeDJDVjE0bzdiRDdQcHh4MFJOSHJvRjlweVNyL29XeG5xRkJW?=
 =?utf-8?B?c0t4REhMYzF1dGxkbDE3SEFGVmNZWTVCdytFOGpKUUhjWkd5a0pqVGVZS2sx?=
 =?utf-8?B?SmVFYmNzcWR0ZlFsRHMxendBWFVHNE1yRVJsblFyNmhKWWZWWXZqYUE4UzFt?=
 =?utf-8?B?ZVJTS0lCYzRHK1pSWU4yUSs2a3cxQWJmc3hjc3M0SytmZXc5Rk1qYjl4NE1r?=
 =?utf-8?B?Y3NQL1BYRXpYT2hiUGtLM2VZUWhHV3IwZFd2OHJKd3Bqd3lwWjFlejBqVzhG?=
 =?utf-8?B?blQ0VGM0cFVsa1NYUzE5ZU1iSFhNQzFldjJrNTh1YU1kN1dNUzJtaG5pcUln?=
 =?utf-8?Q?ajHDFv7QUyZ+pGKQil8d1c7te?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3773be9-4baa-4f80-3ec3-08ddb971d41c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 14:07:50.3332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YRGuJQjx4uWBH2+IGTiFkxrsb8IkoaW1ZkHOAcQRl6Zlc0KKw0JLD759ERZ6W2pq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7331
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



On 7/2/2025 7:24 PM, Alex Deucher wrote:
> On Wed, Jul 2, 2025 at 3:24 AM Sam <guoqzhan@amd.com> wrote:
>>
>>
>> On 2025/7/2 00:07, Alex Deucher wrote:
>>> On Tue, Jul 1, 2025 at 4:32 AM Christian König <christian.koenig@amd.com> wrote:
>>>> On 01.07.25 10:03, Zhang, GuoQing (Sam) wrote:
>>>>> thaw() is called before writing the hiberation image to swap disk. See
>>>>> the doc here.
>>>>> https://github.com/torvalds/linux/blob/v6.14/Documentation/driver-api/pm/devices.rst?plain=1#L552 <https://github.com/torvalds/linux/blob/v6.14/Documentation/driver-api/pm/devices.rst?plain=1#L552>
>>>>>
>>>>> And amdgpu implemented thaw() callback by calling amdgpu_device_resume().
>>>>> https://github.com/torvalds/linux/blob/v6.14/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c#L2572 <https://github.com/torvalds/linux/blob/v6.14/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c#L2572>
>>>>>
>>>>> This patch is skip amdgpu_amdkfd_resume_process() call in thaw() during
>>>>> hibernation. it is not skipped in restore() during resume from
>>>>> hibernation when system boot again.
>>>>>
>>>>>
>>>>> I just found the following kernel doc. Thaw() is intended to resume the
>>>>> storage device for saving the hibernation image.
>>>> Ah, that makes much more sense.
>>>>
>>>>> Our GPU is not involved
>>>>> in it, it is not necessary to resume our GPU in thaw().
>>>>> https://github.com/torvalds/linux/blob/v6.14/Documentation/power/pci.rst?plain=1#L588 <https://github.com/torvalds/linux/blob/v6.14/Documentation/power/pci.rst?plain=1#L588>
>>>>>
>>>>> So another implementation is to remove the amdgpu_device_resume() call
>>>>> in amdgpu_pmops_thaw(), and skip amdgpu_device_ip_suspend() call in
>>>>> amdgpu_pci_shutdown()for hibernation.
>>>>> Initial tests show it's working fine for hibernation successful case.
>>>>> Should I switch to this implementation?
>>>> No idea. Alex and the KFD guys need to take a look at that.
>>>>
>>>>> But thaw() is also called to restore the GPU when hibernation is aborted
>>>>> due to some error in hibernation image creation stage. In this case,
>>>>> amdgpu_device_resume() is needed in thaw().
>>>>>
>>>>> So I need a method to check if hibernation is aborted or not to
>>>>> conditionally skip amdgpu_device_resume() in thaw(). Currently I don't
>>>>> know how to do this.
>>>> Yeah that approach here looks fishy to me, but I don't know how to properly fix it either.
>>>>
>>>> @Alex any idea?
>>> Yeah, I'm not sure how to handle that.  I don't see a way to avoid
>>> having all of the callbacks.  We could ideally skip some of the steps.
>>> Maybe we could optimize the freeze and thaw routines if we had some
>>> hint from the pm core about why we were getting called.  E.g., thaw
>>> after a failed hibernation restore.
>>>
>>> Alex
>>
>>
>> I just found pm_transition variable can be used to check if hibernation
>> is cancelled (PM_EVENT_RECOVER) or not(PM_EVENT_THAW) in thaw(). I just
>> need to export this variable in kernel.
>> https://github.com/torvalds/linux/blob/master/drivers/base/power/main.c#L64
>>
>> Provided pm_transition is available, should we skip
>> amdgpu_amdkfd_resume_process() only, or skip amdgpu_device_resume()
>> completely?
> 
> Hmmm.  Still not sure how best to handle this.  For entering
> hibernation, all we really need is freeze().  Once we are done with
> that we don't need thaw() or poweroff() for hibernation as we've
> already suspended in freeze() so there is nothing else to do.  For
> exiting hibernation, we need freeze() to suspend and then either
> thaw() (if the hibernation image is bad) or restore() (if the
> hibernation image is good) to resume.
> 

If pm_transition is available, we can keep thaw() as we have now and do
resume only if pm_transition =  PM_EVENT_RECOVER. shutdown() may check
in_s4 and do nothing.

Thanks,
Lijo


> Alex
> 
>>
>> Regards
>> Sam
>>
>>
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Regards
>>>>> Sam
>>>>>
>>>>>
>>>>> On 2025/6/30 19:58, Christian König wrote:
>>>>>> On 30.06.25 12:41, Samuel Zhang wrote:
>>>>>>> The hibernation successful workflow:
>>>>>>> - prepare: evict VRAM and swapout GTT BOs
>>>>>>> - freeze
>>>>>>> - create the hibernation image in system memory
>>>>>>> - thaw: swapin and restore BOs
>>>>>> Why should a thaw happen here in between?
>>>>>>
>>>>>>> - complete
>>>>>>> - write hibernation image to disk
>>>>>>> - amdgpu_pci_shutdown
>>>>>>> - goto S5, turn off the system.
>>>>>>>
>>>>>>> During prepare stage of hibernation, VRAM and GTT BOs will be swapout to
>>>>>>> shmem. Then in thaw stage, all BOs will be swapin and restored.
>>>>>> That's not correct. This is done by the application starting again and not during thaw.
>>>>>>
>>>>>>> On server with 192GB VRAM * 8 dGPUs and 1.7TB system memory,
>>>>>>> the swapin and restore BOs takes too long (50 minutes) and it is not
>>>>>>> necessary since the follow-up stages does not use GPU.
>>>>>>>
>>>>>>> This patch is to skip BOs restore during thaw to reduce the hibernation
>>>>>>> time.
>>>>>> As far as I can see that doesn't make sense. The KFD processes need to be resumed here and that can't be skipped.
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 2 ++
>>>>>>>    2 files changed, 3 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>> index a8f4697deb1b..b550d07190a2 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>> @@ -5328,7 +5328,7 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
>>>>>>>                amdgpu_virt_init_data_exchange(adev);
>>>>>>>                amdgpu_virt_release_full_gpu(adev, true);
>>>>>>>
>>>>>>> -            if (!adev->in_s0ix && !r && !adev->in_runpm)
>>>>>>> +            if (!adev->in_s0ix && !r && !adev->in_runpm && !adev->in_s4)
>>>>>>>                        r = amdgpu_amdkfd_resume_process(adev);
>>>>>>>        }
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>> index 571b70da4562..23b76e8ac2fd 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>> @@ -2734,7 +2734,9 @@ static int amdgpu_pmops_poweroff(struct device *dev)
>>>>>>>    static int amdgpu_pmops_restore(struct device *dev)
>>>>>>>    {
>>>>>>>        struct drm_device *drm_dev = dev_get_drvdata(dev);
>>>>>>> +    struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>>>>>>
>>>>>>> +    adev->in_s4 = false;
>>>>>>>        return amdgpu_device_resume(drm_dev, true);
>>>>>>>    }
>>>>>>>

