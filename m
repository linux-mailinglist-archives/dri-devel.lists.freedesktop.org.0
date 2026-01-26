Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CSONRG8d2lGkgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 20:10:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEED8C5F5
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 20:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A1110E10E;
	Mon, 26 Jan 2026 19:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="umJt4VCJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010048.outbound.protection.outlook.com [52.101.46.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4CE10E10E;
 Mon, 26 Jan 2026 19:10:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kRBlh+GT8JNQxMGUio3rY4lNCIxbfkfbjQ6/9ecrmcwWolyxd/iHOB+C6ZDsg6MHLvnyTpEETv/MNd+V7EQ1a2y2e73JvgAgGDNceKWckhY12RU/PEetQfPdH9FkpllR/0qcG8qqzm8ey54u4EANQEJVwTRI8zMZjy9nyk1AOX1aaCig1/AwLKXiHA06hdWLcCfd9r9ZLO2/0ZHOrti+O/L7EFFKSmfQcHcaJRc76+IeleIfTWoSWj0puqiqAPdVMo4izFPWux7pdaRlLUB5jpD0C7fRmDHsR1LKUV9bkQN+eLMR039PiwMfWaZMs6CHJBsrRXd0S8fkOjaGFueTIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8Vz9syslvnma5MwWPu9wLv0ung1FdUXLfkaARdkfHQ=;
 b=RTG41GqX/uhs741cpNsiOBqvSEyeVyR/UqJmXmINV1n0CCqPRbrU+qmUKbHsaxMv14ttaIlW/GEAxJNpA9xMdkkqZ5DQFzooj4DDRNfi1m2J8OtC4ymG6T9nXEIJ/xGwmya5BGNuJULo06OCxTtj+B2On1w4JoIGggo+7zBeYEq53N+LEoKn+OhhiJYL1zXXeRnMJrWo50dxKsyxSJC4sotwl/GMKZP+Yd1MLzNufelgMeNy/GjE6tSC25wyt+I7qPTdQk0ORWIgSr72Y4810MwWq8zxoriZxwNUHlEfklaPtebxUlGGJAGCxpndZW7z1/QOhn5YYHhGkmNz+LIFEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8Vz9syslvnma5MwWPu9wLv0ung1FdUXLfkaARdkfHQ=;
 b=umJt4VCJB9pP6HrIAItYMAhJgShf4mAu0cNsdCTY9vwaY70ohO4PzsR5yQd2j4BFCt1a3A5PJRfVhOk2E0+95HUXf1PmUFb5VGzFI8xRJwTzeZMxgVo4QdxeKivIeku20AwCCiuwUKvbs+Cu1ZnurHuhNuGyatvRJwTUPF+kRUo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7563.namprd12.prod.outlook.com (2603:10b6:930:96::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 19:09:59 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Mon, 26 Jan 2026
 19:09:59 +0000
Message-ID: <94ac5458-4f2d-4646-8e22-7ea7a3fa9b82@amd.com>
Date: Mon, 26 Jan 2026 20:09:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/11] amdgpu/vce: use amdgpu_gtt_mgr_alloc_entries
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260126133518.2486-1-pierre-eric.pelloux-prayer@amd.com>
 <20260126133518.2486-5-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260126133518.2486-5-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0350.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7563:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f16fed4-7154-4674-54d9-08de5d0e7fdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHlHdEZLa2ZJVzFtTjNrOFNPcUlqSlZKelBtd0NNeVB0WklpejNSODgrSUJY?=
 =?utf-8?B?RXk0L2dIYkpYRGIwUk9UcFkydi9EQ2ptd0t1S0E2VUE5d04zTzU2K2VCengz?=
 =?utf-8?B?dGgraHdzS29lQ2FwSzJVZUdLcEJwdXRZNzRhQlNpNlJ2Tm9SMmhLUWREWjBm?=
 =?utf-8?B?OHZwK25mOHU0ampMRUEwTktBeEw5WmVPRUxqWFB2aHMwL3R6MmpoMkl4V2hO?=
 =?utf-8?B?WmtTN0U1UTZGK3JBeG42Q2pjUWxOTXd6WHQ3c045WmtIT2ZyNk54ZUVMT1BW?=
 =?utf-8?B?a2dnMExleTBrZXZTYXhIUHNKbkc2MElheVVFcDNnT2hqazhrbEs0MHpaMzF5?=
 =?utf-8?B?S0p4RkpkK0diMnFFaXNhSXB0N0tIZVhHYkVORUNTcWJ6UjNLbjdUUUlXcExV?=
 =?utf-8?B?TCtjQ1pmOWh2bkZtcmtDbTdCRHR6b2JHUnpVVCs5eEFXMXFYa3V2RVQwWW9z?=
 =?utf-8?B?aE16OVNKTUd0NnN2NTE4L1NzY0hxWkpQbGpDRlRteHFSYmNVWS9WZ3RIeHIz?=
 =?utf-8?B?ejdjUWtjcTVSY1ZsRkd1c3pmWm5iNENmaVVCRDlTQVhSY1d1SUJYcXFmR01F?=
 =?utf-8?B?WWgySDZrRVQ2MWtFSzI2czBwRk4zeEIweWZKM0FZZ3pXT2lua1RISTRGMW1U?=
 =?utf-8?B?N3V4KzZhQ0Y1TGpIRDZtaHUzL2trdmc3bmVKa0F6Z0M5bFc5ZkRkREJ2VU04?=
 =?utf-8?B?eHBDd29JN2Z5V1FWck9hWXZwOW0yQk1EZ2xpYTM2QjdsSDRWS2JBSzI5QmIr?=
 =?utf-8?B?ZVI5dk8wMzNyM0tPSTJFMmVhOVNrY2RhVlRidEpPL3I4ZGtEekJCQ1BaUkZr?=
 =?utf-8?B?MCttVXRiT1RsTFpIcTYvbWJRZHFIM1dHY0RSUkVGb3plZmc3WVVzelNEZWcr?=
 =?utf-8?B?eXdaR01KeHp1OTNrL3BMcCtQODdZVDNKZ0JUZktCQmorUkF0Z0Noa2F2N0Zj?=
 =?utf-8?B?Z0thWFBkYy83L2FpbEZmS1ZwbmZwSTZDQzJXUVRZb3RkRzJxSkl2RDJEeWpq?=
 =?utf-8?B?b0lTMml2V1RGdnFJMWNzNHBYckRiM2lNalg5YkY0TXBMd2VsYXNYa0FJR0hJ?=
 =?utf-8?B?RXFCZzRKWVlWeEJoT0JXaDRSOTI3aGVvTUhLQS9rcFJFNVd0UGo0TnVOOG9J?=
 =?utf-8?B?d2c5L09CQk5sNDVqMTdxMmhtZjhVVlNOSHRGVFBmUEZJaHZCY2ErUmVNbVE5?=
 =?utf-8?B?MmxjWm9pQlZ2NEEyZ2srYW14R2FoMHZwaWRHa0o5YXNFUStWWVJ3aWkwMWZU?=
 =?utf-8?B?bHBLRVBnN1M1WGpTSlZZN1pVMjlZWE0vWTFXMlE3a0RhQVMwSDl0dkhSWURi?=
 =?utf-8?B?WVB1Ni9XdDBxRVB2TnNhMU1Qdlc1dmVrdUY5THUxMTByNGtHL3h3MVNFRU56?=
 =?utf-8?B?MWU4VEo4d1pjZGExY3dEU3dWeU5sdmcvbnNmZFhiUkhCWUtqRFVSbEo0Z3NC?=
 =?utf-8?B?MStOblVOOTRoV1hZaW1TNDlxODJoZTJidEtpTWpRSmpBSnpmUWM4UWZERmFC?=
 =?utf-8?B?aHBaRjBOUHBocDhaN3hpWEMrUmtkbVRVVGErUXBlcHFOUmNOU3M3dW1JZGZs?=
 =?utf-8?B?N3JLYkQ1WjlSclNuSzJIUk1wQWdWYVZ6b3dHZDNsUUY5UFRLTU4rQW9lRWp0?=
 =?utf-8?B?MkJlZ0VZbXgxSGFWS1ZsUlJLRklsYWRaOXR4SENoN29kbDBrY09pb3IxOEpo?=
 =?utf-8?B?VExLL3VqVHZ3akllWkVhWGFKYk1nK21iYTF4ZUFBU0JGVEdCYlhqdEFBRUdm?=
 =?utf-8?B?WWczVDJrQ1pCTVpwSThmTm1XempqaXZIT0NTUVlnNDZ2VjNjK1BUWTQzNTJI?=
 =?utf-8?B?OXFhVENPUHJTN0ZZekRlNmp6dXVRQStPNVhkTzArUGhpbjBXMVI1akp5L01w?=
 =?utf-8?B?ZU5iRk1zK2t3MXJNT08rVGRFOThlVzR4TmVtczdtS3Z2UDdXUWhFVGUwclMw?=
 =?utf-8?B?Tnora1l4czY3MWpWQk5hbmh5U1Q4bER6NGhxOE1aSG1DcGp2aDZIdWNLRW1D?=
 =?utf-8?B?KzVYOFhFMUdBOUtDMDcvZjBkL1cwS0ZrVndDNUJ4VW1xQmJ4aXBvUVpoSFho?=
 =?utf-8?B?K0pzS2VpNWhZT08vR3hObmNVVDFlMUE1UHFrRGYwWEVyYzhGY3JUV3BQNUV5?=
 =?utf-8?Q?RhnY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXdGTUU1WjU2ZDEvaWROTzdPcVM2ZkJ3ZHJBUG52MlV5Skh4R2FTNE9WalF3?=
 =?utf-8?B?WVNqSUZvTHoyMnhEY2xKSmJ4WURhdC8xNjNTWHdOM0hKRnA5eXhYS2RCTlM3?=
 =?utf-8?B?YXd3cmlnQ2lOMlpONEg0YzAvS1VmcjBYZkNDY2xXTkN0RnlaQlV4dHMwT293?=
 =?utf-8?B?NjEwZ3VPSVFMeXVVaVpiV21YanJndGk5MXJDbERRNnA3NVozajdHVHBoWWNN?=
 =?utf-8?B?NlBOS2JJZHdpRUx1eEM2Y3hIM1hJejN3VXpXSmlscXI4Nm1FVmk2eHozVlEr?=
 =?utf-8?B?Yk1zc2Qwc2Z0WGNydmRtcHY3aGRxZDZIaXcyWnV2V3pRQWdxWXFWY1VzZmpy?=
 =?utf-8?B?dHVUSTBTbUk0V1cySnNiYWVNMktseHVsMnMwTGY2SWo5d21ZdjNYY282dUI0?=
 =?utf-8?B?VU9MOHB5ekhxOWNWVlRqdTZnYndYTlVjQkVvaFp5MlFrSGNiTitYcFhPZVNS?=
 =?utf-8?B?YmRZNVgwZ1hYUTJUNjgxN1dUZG9BVEdQbml1SEhvVkhaOE4yKytGdncxZktt?=
 =?utf-8?B?aXB4M3VhRHJPRTBIWllBK0VNUU54MTBkbG03cjVwK2FKMVVEdlJCRnNVRDll?=
 =?utf-8?B?Q2lhVXNvYjNWcWhuRkJCYW43bG9DR2wzRmdlcjlxRzJKNEtYdGJETTlFR1ho?=
 =?utf-8?B?MUtLS2hYaDVrellra2FEUkVmTzREaU1aVDFGUEJEU3B2V3FtdjJ3UmVFRHlI?=
 =?utf-8?B?ekxrZ0Z3bGU4RDFDTVhCc2E2VzJaNVhEVDhjZlB3YXorbm1FbG1zUVlJUUxR?=
 =?utf-8?B?azdHQTFSVUlSbE1qRlpsWjdhV0I2K2RrTWh3VlI2L2ptblNHNnFicCtldzND?=
 =?utf-8?B?SEFkQzgwOEFYZVJ4UnFkM3JDLzVaOXYrYWtkOE92TE1IRFN1dGhMbS9PMk04?=
 =?utf-8?B?bW10SXJ6RTVDblhTY09XMFBkVlNuRFZLMWkxczBmS3RyMk5jUy9McDV3SGlE?=
 =?utf-8?B?L1doZitTaEw5ZmNJR1ZKcG5WWTlFU2ppSmVMNVhCcSsweXhjTUh0MFJZcVNi?=
 =?utf-8?B?QStIYXBPU1dMWHFsN2JSTVBER3UrcS8xNGhveTNUR2JSN093WW1ldmhxbTM3?=
 =?utf-8?B?UzRZb2lyNThpc2NyenVFajU4bzBOYkR4cGhQaWIyb2Vmb0xaemd3eFlnTVQ0?=
 =?utf-8?B?d0tGRG5SRkFpU09YUVpkeHZIWmQzOHZxSjFLcWR1SjREbkE1UFFPOHZCZFBj?=
 =?utf-8?B?TnZjOEMvaEhjNlJnR0pXNkZkSExHb2tnSjZ2VEVhbDFBS0FZZnUrRXRqRWR1?=
 =?utf-8?B?UkMwd2FIZEV2S2RMdXdoMDBxaXd4a2ZCWTUxK0tCWTgwWjFJL2FYeGdEQS9O?=
 =?utf-8?B?S1AwRTEyN0dwTzhkSHJuaUNiZ3lnbEhuWjBHWmd5bmZ1ZisrRnpoNXorSGVw?=
 =?utf-8?B?MFcvVXFDdGQvNHN0Ym0yMlIvS1czaHVnbzF4YWZzNHYwMTl5d1JYNmp4U2F4?=
 =?utf-8?B?YWVhSC9kMmZFZ3V6NWEzM2svQW9zZTRvdlkwcW5GNU15dDcwQmtxSFFkajdu?=
 =?utf-8?B?bDQ0bFFQV1F3Um1JT0k4NjlycjRJVHhaTFRuZlRpMjczczBrNzh5c2c0MXEx?=
 =?utf-8?B?aTgySktuOVlrSTdrUDdPZXJsMFhiejlkbllMalB4VWsva0pJcnVuQi9tMFpW?=
 =?utf-8?B?MUJNZWJ4YStPek1ENEdINzNoTWlSV0ZEa0RRN0o2ckM2R29CdTdYUVhuSHRz?=
 =?utf-8?B?ZVg0bVpOVXUrNW9zVmFvb0JVM2hZYy8xVmo5SnFtZG1DTGVzRkVVOXlFSTZ5?=
 =?utf-8?B?eHJmZS9hOGxzLzIwamZpZmExcm1kcmdwbkR0TURTZDlibjRQMW5SOXlkTlhP?=
 =?utf-8?B?SDk4UmxXMGxXN09mTVhFSDU1U21Jb0ZBaGsrWGM1RElvc0FNdGhBdGFWYkNz?=
 =?utf-8?B?ZWZFMUpGZ2xhR25uR0thZEpzV3hweWJ5S1Y4a0dKb0ZGLzdmL29xSGlVbms2?=
 =?utf-8?B?TmNtV2x4SnIxOVVlL0FFc0tpMlNRWG5IMFFEQ002SUM2alFWcVJjTGJpK0ty?=
 =?utf-8?B?YlMrUllxdHhVWmtpK1JZdmxiYW51Y3c1WDYrSnJkcTVhdTBFV21DWm1zWkpE?=
 =?utf-8?B?YVhpUk1BdXMvcWkyd3VmYnRLWEJlbFIzWmR2R0hjMC9tcHlVVWN1eHNiaGJB?=
 =?utf-8?B?UXJiOHV1T3JaV1k4MzF2Y2NpU1NIbDkvN0JkdGdWTE1LTC8rd3Q1TTdZbnox?=
 =?utf-8?B?dVFyczV1LzF4aUdKN1VMZS9kMXFxYUdPMkJiZVdqMGRSZWNieXdsUDA3Zjkr?=
 =?utf-8?B?VVJtVHAzanhOaTE1R0wzcDZOOWpkNG1qWWlBb2thNXZkZkdvbTJzbys1Z0tV?=
 =?utf-8?Q?RqfVCOBSbdyIziPGFk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f16fed4-7154-4674-54d9-08de5d0e7fdc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 19:09:59.2244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLz1lYnu6ZN0JdwzB2rnTwZimyGvhQmRHF+AvpuZgTp9WZQFM3oCKEMQv0h04bHh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7563
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9BEED8C5F5
X-Rspamd-Action: no action

On 1/26/26 14:34, Pierre-Eric Pelloux-Prayer wrote:
> Instead of reserving a number of GTT pages for VCE 1.0 this
> commit now uses amdgpu_gtt_mgr_alloc_entries to allocate
> the pages when initializing vce 1.0.
> 
> While at it remove the "does the VCPU BO already have a
> 32-bit address" check as suggested by Timur.
> 
> This decouples vce init from gtt init.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c     | 18 ------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h     |  2 +-
>  drivers/gpu/drm/amd/amdgpu/vce_v1_0.c       | 32 +++++++++++----------
>  4 files changed, 18 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index dd9b845d5783..f2e89fb4b666 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -332,7 +332,6 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
>  	ttm_resource_manager_init(man, &adev->mman.bdev, gtt_size);
>  
>  	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
> -	start += amdgpu_vce_required_gart_pages(adev);
>  	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
>  	drm_mm_init(&mgr->mm, start, size);
>  	spin_lock_init(&mgr->lock);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> index a7d8f1ce6ac2..eb4a15db2ef2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> @@ -450,24 +450,6 @@ void amdgpu_vce_free_handles(struct amdgpu_device *adev, struct drm_file *filp)
>  	}
>  }
>  
> -/**
> - * amdgpu_vce_required_gart_pages() - gets number of GART pages required by VCE
> - *
> - * @adev: amdgpu_device pointer
> - *
> - * Returns how many GART pages we need before GTT for the VCE IP block.
> - * For VCE1, see vce_v1_0_ensure_vcpu_bo_32bit_addr for details.
> - * For VCE2+, this is not needed so return zero.
> - */
> -u32 amdgpu_vce_required_gart_pages(struct amdgpu_device *adev)
> -{
> -	/* VCE IP block not added yet, so can't use amdgpu_ip_version */
> -	if (adev->family == AMDGPU_FAMILY_SI)
> -		return 512;
> -
> -	return 0;
> -}
> -
>  /**
>   * amdgpu_vce_get_create_msg - generate a VCE create msg
>   *
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h
> index 1c3464ce5037..a59d87e09004 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h
> @@ -52,6 +52,7 @@ struct amdgpu_vce {
>  	uint32_t                srbm_soft_reset;
>  	unsigned		num_rings;
>  	uint32_t		keyselect;
> +	struct drm_mm_node	node;

Maybe name that gart_node.

>  };
>  
>  int amdgpu_vce_early_init(struct amdgpu_device *adev);
> @@ -61,7 +62,6 @@ int amdgpu_vce_entity_init(struct amdgpu_device *adev, struct amdgpu_ring *ring)
>  int amdgpu_vce_suspend(struct amdgpu_device *adev);
>  int amdgpu_vce_resume(struct amdgpu_device *adev);
>  void amdgpu_vce_free_handles(struct amdgpu_device *adev, struct drm_file *filp);
> -u32 amdgpu_vce_required_gart_pages(struct amdgpu_device *adev);
>  int amdgpu_vce_ring_parse_cs(struct amdgpu_cs_parser *p, struct amdgpu_job *job,
>  			     struct amdgpu_ib *ib);
>  int amdgpu_vce_ring_parse_cs_vm(struct amdgpu_cs_parser *p,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
> index 9ae424618556..bca34a30dbf3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
> @@ -47,11 +47,6 @@
>  #define VCE_V1_0_DATA_SIZE	(7808 * (AMDGPU_MAX_VCE_HANDLES + 1))
>  #define VCE_STATUS_VCPU_REPORT_FW_LOADED_MASK	0x02
>  
> -#define VCE_V1_0_GART_PAGE_START \
> -	(AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS)
> -#define VCE_V1_0_GART_ADDR_START \
> -	(VCE_V1_0_GART_PAGE_START * AMDGPU_GPU_PAGE_SIZE)
> -
>  static void vce_v1_0_set_ring_funcs(struct amdgpu_device *adev);
>  static void vce_v1_0_set_irq_funcs(struct amdgpu_device *adev);
>  
> @@ -541,21 +536,24 @@ static int vce_v1_0_ensure_vcpu_bo_32bit_addr(struct amdgpu_device *adev)
>  	u64 num_pages = ALIGN(bo_size, AMDGPU_GPU_PAGE_SIZE) / AMDGPU_GPU_PAGE_SIZE;
>  	u64 pa = amdgpu_gmc_vram_pa(adev, adev->vce.vcpu_bo);
>  	u64 flags = AMDGPU_PTE_READABLE | AMDGPU_PTE_WRITEABLE | AMDGPU_PTE_VALID;
> +	u64 vce_gart_start;

Maybe name that vce_gart_offs. The GART start in MC address space is something different.

> +	int r;
>  
> -	/*
> -	 * Check if the VCPU BO already has a 32-bit address.
> -	 * Eg. if MC is configured to put VRAM in the low address range.
> -	 */
> -	if (gpu_addr <= max_vcpu_bo_addr)
> -		return 0;
> +	r = amdgpu_gtt_mgr_alloc_entries(&adev->mman.gtt_mgr,
> +					 &adev->vce.node, num_pages,
> +					 DRM_MM_INSERT_LOW);
> +	if (r)
> +		return r;
> +
> +	vce_gart_start = adev->vce.node.start * AMDGPU_GPU_PAGE_SIZE;

IIRC that should only be PAGE_SIZE and not AMDGPU_GPU_PAGE_SIZE.

Apart from that looks good to me,
Christian.

>  
>  	/* Check if we can map the VCPU BO in GART to a 32-bit address. */
> -	if (adev->gmc.gart_start + VCE_V1_0_GART_ADDR_START > max_vcpu_bo_addr)
> +	if (adev->gmc.gart_start + vce_gart_start > max_vcpu_bo_addr)
>  		return -EINVAL;
>  
> -	amdgpu_gart_map_vram_range(adev, pa, VCE_V1_0_GART_PAGE_START,
> +	amdgpu_gart_map_vram_range(adev, pa, adev->vce.node.start,
>  				   num_pages, flags, adev->gart.ptr);
> -	adev->vce.gpu_addr = adev->gmc.gart_start + VCE_V1_0_GART_ADDR_START;
> +	adev->vce.gpu_addr = adev->gmc.gart_start + vce_gart_start;
>  	if (adev->vce.gpu_addr > max_vcpu_bo_addr)
>  		return -EINVAL;
>  
> @@ -610,7 +608,11 @@ static int vce_v1_0_sw_fini(struct amdgpu_ip_block *ip_block)
>  	if (r)
>  		return r;
>  
> -	return amdgpu_vce_sw_fini(adev);
> +	r = amdgpu_vce_sw_fini(adev);
> +
> +	amdgpu_gtt_mgr_free_entries(&adev->mman.gtt_mgr, &adev->vce.node);
> +
> +	return r;
>  }
>  
>  /**

