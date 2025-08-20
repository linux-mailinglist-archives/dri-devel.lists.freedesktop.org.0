Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FB8B2E4C5
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 20:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0272310E7BE;
	Wed, 20 Aug 2025 18:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZRPNc8Bc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD7510E283;
 Wed, 20 Aug 2025 18:17:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdvQE61HYSOO2B3ooXjYQ8wRlPNWc24/NXM4E+Wc8Kg0Df8E1e3DdM6GqnmyzmNw00rkUOyJ7izjjM+rwToQsd4Zjvu7f5py8XJg7x9JszqjEX7GEYjieXim4dXyRfON/3Y0tt2e5yXiTF7IvujUlS+nGc73iUyHCEeFdg2zxVIQSuy5FO+E0Rs0xxk0cTJt7/63HfxY+ou8cZKJn8n4CCCH4rXPiS8nrDlvaJ444g8QzcJloyKUxAAM2kxluuywCiuyolW7WNXiDiE/W2hgh3UbOF50vrMcnhJWvQuRKWfFh5Nbgyl9qCP8mJutPjWmutCCrux+t06mzdON9q8pWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHRhFRfasoT6OUUnmHJ1RVN+nZji94c2O9WLHxiWYZk=;
 b=Uyg17/p+IYijd2RzYyt1V6gy5RidDXeEelmVet8MHZQ2USee4pLhJyO819pAfvDMIPxpzQbl1bcCCRJjZ7zI4NnLXQEB1qLLgicU8Gs+SWV6mTC+i6/dhlswGgAS0fHhqJrEtqmQ/c1U3vX1y+OZOrMrBdgk7xokcT2R/zH6939h4nZaSH+zPk/2sXNvfr2oHo019OgCuxNjqZonxT6ShlVFYo8R7EcXvp60jERc/IHeaydOzQUpz2LrEsTy4d2+t4nnceQEtEDKAoBkBDXYEj730uWPhaDwb/2ctStGt1FRFSwaoxvBTKRX2II9yLP4/epJMMiMKMJGOfNqvj9C2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHRhFRfasoT6OUUnmHJ1RVN+nZji94c2O9WLHxiWYZk=;
 b=ZRPNc8BcqXVgDmxV+n8jP6c5lWVsBHeX6NffL6e5hVSoH3cLvB3Xl32nXNjYvv205+v6mAls0d96EfwGNCoX0uqR/henlhXEiSjvheVxWLyvbN97TOHk4lIiPMDPjFqZNaY6q2Pf5Kuq1IO61KR0f97bshiTlOo7v5uRr0dHLAw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by LV5PR12MB9777.namprd12.prod.outlook.com (2603:10b6:408:2b7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 18:17:01 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 18:17:01 +0000
Message-ID: <f3061c6f-5a73-4890-92b0-90f153e8dcc0@amd.com>
Date: Wed, 20 Aug 2025 12:16:58 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 35/47] drm/colorop: Add 1D Curve Custom LUT type
To: Sebastian Wick <sebastian.wick@redhat.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, mcanal@igalia.com, nfraprado@collabora.com,
 Daniel Stone <daniels@collabora.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-36-alex.hung@amd.com>
 <DC6IG8LQAIF4.6KM7AM5JD3J3@redhat.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <DC6IG8LQAIF4.6KM7AM5JD3J3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0237.namprd04.prod.outlook.com
 (2603:10b6:303:87::32) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|LV5PR12MB9777:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ae59f67-6818-48e4-8b99-08dde015c247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkFMOFJYMzRpdy9SQWlvcnZ2UWVRV3lEM3JHZUFtOE1vM01WaWJXMUVtbzNU?=
 =?utf-8?B?Rkw1WDJZeHE2S0lROGVzd1VkOGRzbUhJTUFnYkFETUozb0NHM3ZJN3VmWmZH?=
 =?utf-8?B?YkRiVGJ4Uk5UZVhPeHFpdTdvZXpSU2JPM3pzQ2dkeEN0bG15L3JrSFFHTXBG?=
 =?utf-8?B?STRZVHFJQnFpQkhpYnFSWnRWRzBzM0RCWDJOTis3dWt6dk9FejVZQTlndDVj?=
 =?utf-8?B?TFNvblBDZVJZaVlOSWJTWXIvYVprUmc5aWxsRmFCdHlHN0Frc2FSOFNvRW1z?=
 =?utf-8?B?ZFp5NkJ0cTQwUS9RM2NJTVhUQ1Exdkh2bWgyS25xQXhlYmFsdnZ4TTlMUVRu?=
 =?utf-8?B?Q0l3V09tb1hhcXRscmVpdVpNbGhpMXpuTGNkSE5mWnNEUzlMdlhHRVp2UHFu?=
 =?utf-8?B?WnkrUlZFS1VQNjViZW5XdUQ3aGpwY1AxYXIxNFJhdXNnOEN3UklhNzRDZzRL?=
 =?utf-8?B?aUlEUUZMamZCckRZWWE2VDkyN1p2TTdwRGdscVd1VUFoRGhidUpWeVlqQXJp?=
 =?utf-8?B?eDkzQ3dvbHNsMCttcFBLOGVDNXliVTRHcy9MNk1NcnE0UHh1MXlrNTdwT3dj?=
 =?utf-8?B?YUxGVW45ZGxVVGsxZGc3SlE1VWNRR2N3TlV2ZHJhSUhZUUNFbmJDSVlJaWxp?=
 =?utf-8?B?TjExQXFvNzdHNjdWY0Znb3pGL3NGK0dxY01rb2tXdUl0Z2hTU2tBY2JGcnVR?=
 =?utf-8?B?eGxCb2xmMUF5enY5SFFSVHFTS2dqV3dOZm1rN2J6TnNpM21Wam9LamZ6SS8v?=
 =?utf-8?B?WXQ0WXBGK0ZjaTdDTkxMSFJMbXlOOUErbU0xZWxPOUZOQVZVNUhwOWZhVG1m?=
 =?utf-8?B?a2VqaWdWNjlWZHFSalpPSlVDaHl5RHNZL1B6Zlo0VEMxUTFaUkMrYmFxWmV4?=
 =?utf-8?B?SmEzbjhoZmI4YzBuWTVkRXQwTkV4SnRZcW5aWExlMEJaeXN0MDJKU08wL1M2?=
 =?utf-8?B?WXJzVU1XUnlUR1dxYnB6VlhOYXVDczExVDY5THFBQVUzeTJ4SFZmeFR4UnZr?=
 =?utf-8?B?Q21Jd0M4MTRac2xWZC9QNGxFeEZiQTEvRWxlL0hycHVvajFXY1YwdFFPUHVB?=
 =?utf-8?B?NzA2UGdQMTZ5YXkwTXpBQThKSzV5RGRvTkRneTFaMURLR1NSVTZQQ29qZGFK?=
 =?utf-8?B?K01udmZLYzBENFBVZnlMSnp3Z01vSUxnVkN3UDNBWHBqQURaZ3BvM2FENFVO?=
 =?utf-8?B?ZWF3MDVpbDdzSmdSVjlYZktzUXQ5M1FTTDFTb2JObzhXMzR5MG02bWQ2TVAz?=
 =?utf-8?B?Mm91YUcvQWkwTWFKZUU2UDJuOXViZTRLNzRxUEIwNDErZms5dWNyV0JPRWFH?=
 =?utf-8?B?bkQ1TFRDR3VqMFY4L0x5WjlFekJpaWJwY3VxMzhWYk1ZNFpFdlNkOU12Z0Q0?=
 =?utf-8?B?UlNqb3RWMVFuTDRzN3ZJbkl5MW1jS0U1LzRQSk1CMzBRb0lMZ0JyRmJqUGNx?=
 =?utf-8?B?cEpGUWRMTmpTalpNd1RhbXZ6ZTk5R0RWejRRQm84SDZsR2xON2xReFNoc3l0?=
 =?utf-8?B?eW9SRWZOcVhtT2d3NXlpRjdmTjR6U3oxeEVGZlloMm5HRndJZ2dYeCtrOWdj?=
 =?utf-8?B?VnRzWUNQREJsQnBpK2ZJNy9YRXBadjlPS3IwQi80eFNPTVFaVURMVjkvQ0Rx?=
 =?utf-8?B?amFacXZRenhSeGRMU1c5Yk4rSk4ycnFUbDFVK21JeVJXK2pudjJNYy9IMDA2?=
 =?utf-8?B?SlptRldaQkVXOFBvRjE2S1ErWHljdHRMZ3J2SHJnOTFGcjFoOGxiT3hEUmRV?=
 =?utf-8?B?WGgrbTJ3RTF2Mk9IRk50UzdvZ0lrdytvVHBWd1dYTSs2M2x1ZGNsb0N3dUIw?=
 =?utf-8?B?Um1TaEx6K3FPNmgvK1Y4WHE5ekV2ZGY0cXZUdURBR2tPM0pBNXFyTE44YjlQ?=
 =?utf-8?B?dnlQSFBFSTArT0JtZmozTm9Rb0tMK1I4SHJDU1NhZFMxSmRjbEZUaFJ5djFX?=
 =?utf-8?Q?88ojl4DThAM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTZqc0pNK0haY0w3b0MxV2lVRjlhaHB1WU5vMmh2ejlNeEE4RnYvUG8xa2Vh?=
 =?utf-8?B?eUpyS1o1M2gwU2NFbXZvWEpkTGxIazBxMmF3ZkdSMmxXaEt2dUtia3RFYjY0?=
 =?utf-8?B?dkNwZzlramIxSlZKcnJzOHRhVUhWeDdiZW01elR4bEZhUkNhQS85Q21jcHJ3?=
 =?utf-8?B?YS82NzVVTVEwVldvQVZ0bnp0Wkc3ODMvTHc5NXk4OWpySXZ4NitaQk9MRmVK?=
 =?utf-8?B?eTdEdTAzQUxNMmxDOWJQZzd1a0xSWkU1cWVLYnNFT0UzK1VJL2tUbVpFaFNS?=
 =?utf-8?B?NzFrU0Q0TFRIckswcVYzVDRXTjlSWlh6Qml5SUN2RGJPZHlUMXBGYmxPUW92?=
 =?utf-8?B?Zm5NVWo3TU4zVUxPNHpLR1o1OFExK2pYbFRxK000Qm81V1owcUZJTTd4cDIr?=
 =?utf-8?B?MEppeGRFK3V5dGFyQWdpWXlUc0FGcXRvcjNaWHVFYzlDY3pDY3c0NUk0MEF5?=
 =?utf-8?B?TWlvbklZcFRyaC9CMEYxdWVQQk9za2kyM1lTb2lrKzM4RzViQk41bjNFYVQ2?=
 =?utf-8?B?SUthaWdzUnloVWZDSko0WU5WZGFRWXBhUlB2Rnd0VmVkUVBzWTNEVjh0aDdD?=
 =?utf-8?B?NStkWUo1ZEtMNkZTWFhqNXVwQzU4UkFmdU8zRDUrWWhILzB5QXJCTmxjRUZm?=
 =?utf-8?B?Ukdha1lCZ095VTlrQVhabWJFTzErVVEyRUhtN1BhejRxa0g0U09NYXhiZFFD?=
 =?utf-8?B?aHVZUDNJZWJ3OFFyMWRwa1FjVzFOZi9QdEVTV3NPK2FMY3RiNk83WTk5Nlpw?=
 =?utf-8?B?MW0rblF2OTU0dDVHM05XazdJaWF0aXg5K1ptNEp5dnlnaXBOallHR0JFWTZH?=
 =?utf-8?B?dmJHNHhwVjcybVkzbkhJRXgydnpaK2RoNVN4QmhYR3JDeWJyeU4zOTVKZGhl?=
 =?utf-8?B?K1ZkRWNYZDU5Q3FkSVdmTVVMNGJuallJUUZxUlhQUWpnanRYVWViNUhFMmN1?=
 =?utf-8?B?bUl1Wk1BSTdDWDNXdHhpb3VwQ3g3MVN3OFVDcGRFbnhWamI4aUptZGNmTDFa?=
 =?utf-8?B?amRJN1p2UWJlcHJKV3BMOFAyM3Y5VXhIa0JHS0pTdHVsSWw2TmFvaE1ZYWY2?=
 =?utf-8?B?OFZBTmNuV1hOQWlGUW5QdFVyMzc3SlJtdmVJLzlZZzVGU29WcXdZL3VqZlRu?=
 =?utf-8?B?SWdpMkZTRWpFbG1mM2Z2c2FhOWhyNEx4RWdjVndiK01LNUJMQWVHZ2ltYjNa?=
 =?utf-8?B?NVE2NmVua1p0bFF3MWFjL0Zza29Lc2pBV29tWGQvSGhKOFl5bGU3KzJBbmpS?=
 =?utf-8?B?YStrUXNIWUVEcy8vN09iREdoVnZyeW5uQTRMTko5ekxJOVhVdFIxaW4xMFNm?=
 =?utf-8?B?THB6NzJIV0FaVXlxZDZPSTVrRFYyblYwYXZucEV5RnpadEV5M1hUOTNIT3Bz?=
 =?utf-8?B?L2hQTkpjbzBWanRhcS94SkZRU1N3dVFLM0RFTWZ5ay9ZT0QrWnFINVB1QktZ?=
 =?utf-8?B?dFNLaExHM2R0VEpuY2xRTVYyMjdFd3l1bEE1K0l6RGZqbHU2VjR3VTB4TlJo?=
 =?utf-8?B?NGo0N2xSQUJSRUl4UzRKOVdJbGlwZXdFditpQ2t1LzVVak1nY0E2MnZXeE1O?=
 =?utf-8?B?RXNWYmROTnREeFE3dkVjRmNUYkw2T3dCYjRCYWhnM2k1ODZZUC84NTdMYm42?=
 =?utf-8?B?QWpkRHRpSG5IMlB4VXdsdUFicnp6bG53Q0NDYnR0Vk10SWNDQ3VLMEl0b1Zo?=
 =?utf-8?B?OENnOG9jQmREU1MrVklWcHdqVENJb3I2Z1pRQXVML2daVHZPM29maWtlOUhy?=
 =?utf-8?B?VzZTbDMvbUYxUGZGcWx1eEZMZ2xqZ0MrSXZtZm5MTmdlMVBHbWZrQ3huK0Ix?=
 =?utf-8?B?Vmx5UitwQzAyRENZYUplZGR4MjVqV2hDMWpsSW11SEVPVlppeGFXOXEzcVVV?=
 =?utf-8?B?d3RyR2dZUVVxd09BNXh2b2NFbVRGTVJndDd0V2VLSHhIc2lLTHhINVhJQnpj?=
 =?utf-8?B?NE5ZVHVKTS9BU1IwMHV4UjlnVlFHVU42cFdLckV4aFNZM2ZCNmRWcE15WnNN?=
 =?utf-8?B?WlY1NWtjYjVJS1VSd0JMRWc2VllMYmExVVE3UVpiclFvcVVoVUk1clJkSEdT?=
 =?utf-8?B?RDR6UjVPeEt3YU9oaDVuTUpDeDlwRldyNEFRenB4QzdkYzlhdlJVcUZQOHRG?=
 =?utf-8?Q?KCux5GeCYVF9rRpyTVVuafRuD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae59f67-6818-48e4-8b99-08dde015c247
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 18:17:01.7178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xW4E2IXbJ4QYQ+DfymhSYTNU2ID8ZcX3x1ZFOPWMCVyBf/q9s1T2Jm/iiczF2HZ6Ful8ViT/qghzNDui2hvgMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9777
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



On 8/19/25 09:31, Sebastian Wick wrote:
>> +/**
>> + * drm_plane_colorop_curve_1d_lut_init - Initialize a DRM_COLOROP_1D_LUT
>> + *
>> + * @dev: DRM device
>> + * @colorop: The drm_colorop object to initialize
>> + * @plane: The associated drm_plane
>> + * @lut_size: LUT size supported by driver
>> + * @return zero on success, -E value on failure
>> + */
>> +int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
>> +					struct drm_plane *plane, uint32_t lut_size)
>> +{
>> +	struct drm_property *prop;
>> +	int ret;
>> +
>> +	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* initialize 1D LUT only attribute */
>> +	/* LUT size */
>> +	prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_ATOMIC,
>> +					 "SIZE", 0, UINT_MAX);
>> +	if (!prop)
>> +		return -ENOMEM;
>> +
>> +	colorop->lut_size_property = prop;
> I'm a bit confused here. The property itself is just called "SIZE" which
> looks very similar to the generic "DATA" property. However, it is
> assigned to `lut_size_property`.
> 
> Is this meant to be to be a generic property where the exact usage
> depends on the type of the color op (like "DATA"), or is this meant to
> be specific to LUTs (in which case the generic name is misleading)?
> 
> I also tried to find the user space documentation for all the properties
> but could not find them. The only thing I could find was the kernel
> documentation of
> 
>      struct drm_property *lut_size_property;
> 
> Which says "Size property for custom LUT from userspace."

In earlier version, this lut_size was specific to 1D LUT and 3D LUT has 
a dedicate lut size field in another struct, and lut_size_property is 
now used for both 1D and 3D LUTs.

Do you mean we clarify by making either changes?
1) "SIZE" to "LUT_SIZE"
     -> specific to LUTs
2) "lut_size" and "lut_size_property" "size" and "size_property", 
respectively
    -> Can be reused in the future, if any.


