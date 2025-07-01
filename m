Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BA0AEF0EB
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 10:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A5F10E52B;
	Tue,  1 Jul 2025 08:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4Vpekxwk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD83410E527;
 Tue,  1 Jul 2025 08:22:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EfHMSQ+d1CZ5q9yWIhTzTv7WBltXDAQNMcGS2zqzqnHnp71cOc4/oxEuLwPYUYUfEC0+gv1jLUFTbD0NV6PjsbY1SozwnNw8oxmnX6MFWE7k97MRAQ5azLeAZdrhzG/Cnmt+pK8h4PA7XsIdZZ2yzlnZiy5odjfDmDzguLoiFTeBwBl5F3ZCMoDHsSG5aJvABfkCcDt34g2qS1EYFIOQEsj+tHv1rlWSnFtoj+w9PBnRa66MOPAKGDpDJtOPR2gUOogWdJh9wDghuhZStWyJABsxMdM+5tzS+VJs2ht+tb7FMKDAiVOZFNvSc6MXr5eRDUC7exoIypbkuYK0ZwjoDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOpfpBlyNL0di9ui1juvySpwNCp97KoCVghur/D8/aI=;
 b=vn8VIRQDp30ENPEEgpcy+JRFEpIfHLk5g8x9xS7L++sduUWMx/B6VUHeix3FDEJPzEVA3zrjODkT9lxLg5GURGSDubRqwLqp7rFZxuy+eod5pXfg3AvPKFNzQTVWOhWk/iTxYQ2w80qmboos/2f9uW3wM183GP83xSsrLdoJXtBzWqxbbRwbCEYX6YarrZ249y5yV45R0F+ZKtt6CCHIn0zFh/o+xoXYUOy/pgZbpuwsZp0olgV7cxLA0GHGOJhTi1VzdNuN8piQTLIxzOJb7GKR6h1AmlcekUpgHjcVjO+e/RQfj4LKVSTIi3iUs1/A2JuhvbUrHSvXPd2MqVFTsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOpfpBlyNL0di9ui1juvySpwNCp97KoCVghur/D8/aI=;
 b=4VpekxwkPg1esToSwzhDC73zrQLMVE3G+NQvbzSsNf6IcMZdoWfSJFPn7wRm1BQH8T5MZaL8UJK1DhaQR/cOunBIpWoIxVHH2XW1s79iOugrKTa0YrCWx5MPlwsCQjt1zyyMlEnq463qRhtzhFnVsDS6JXDuV3sjzLz8rB2lbsA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6132.namprd12.prod.outlook.com (2603:10b6:930:24::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Tue, 1 Jul
 2025 08:22:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 08:22:46 +0000
Message-ID: <ba843972-f564-4817-8651-b3b776c5f375@amd.com>
Date: Tue, 1 Jul 2025 10:22:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/amdgpu: move GTT to SHM after eviction for
 hibernation
To: "Zhang, GuoQing (Sam)" <GuoQing.Zhang@amd.com>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "len.brown@intel.com" <len.brown@intel.com>,
 "pavel@kernel.org" <pavel@kernel.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "Lazar, Lijo" <Lijo.Lazar@amd.com>
Cc: "Zhao, Victor" <Victor.Zhao@amd.com>, "Chang, HaiJun"
 <HaiJun.Chang@amd.com>, "Ma, Qing (Mark)" <Qing.Ma@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250630104116.3050306-1-guoqing.zhang@amd.com>
 <20250630104116.3050306-2-guoqing.zhang@amd.com>
 <ce04e266-6c3f-4256-aade-bafca8609ab3@amd.com>
 <DM4PR12MB5937FFB3E121E489A261785DE541A@DM4PR12MB5937.namprd12.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <DM4PR12MB5937FFB3E121E489A261785DE541A@DM4PR12MB5937.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6132:EE_
X-MS-Office365-Filtering-Correlation-Id: 1012a855-2f15-42f0-cfcb-08ddb87874bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1Znd2ZVcGdmZ0ZWVWlWdTZXNHBJZ2pqbkU0TGhnT3NRUXIrUG81WVJwNUhh?=
 =?utf-8?B?eUEyR25od2wwMUpGMkNST0pIbDFza3F1U3RjVFY5ZnRSNWJtQnFnOXVzYzVW?=
 =?utf-8?B?VXFxL0hDcW94eS9LNFJ0MVhaUUdRcjNyRlNZcGFSNDhnaE04VmNJUU43VEly?=
 =?utf-8?B?T01VeEExd243eUNTTEJRSVZhQU5mWDBYS2JsSTFIVWdxT1ZPR2VnSDl1bzJN?=
 =?utf-8?B?WEYwUVVEQXh6a0tGKzIyZkdtVnJIQUVXTW1yQk8vOVh4Nm5KZjFFNWwyQ1lv?=
 =?utf-8?B?UVBId2JyemplQSs0ZjdXYVJHeFY3MW1qdURZT1BrM1BqVE5Ed010QTJKRzRC?=
 =?utf-8?B?SG9SYlNUMXE5OXVYdDUzYkJJRzI3YzVjNEMwcHpvSWRwOC80UmJ2ekVpbmhy?=
 =?utf-8?B?MlJvWXJTK1J1amN4TStZRVN4RzdEWG82UVJPL1BKL3FNNk9VQTI2VERvUVNS?=
 =?utf-8?B?amgvYnh5VUE3Q3YrVDhJVlh0ZnBNWXNmbDhWNXNWN3VHeDVEbk8vZlZnUTJE?=
 =?utf-8?B?ay9Tb1VXdDRQS0hEMk55VWx1MGdBTFoxOThOYU5KWVdWUk81cW5FamhJUUdx?=
 =?utf-8?B?a1RkNVpIcmg2VStpT3ZPYkNmN0R5ZzN3WlFYSm1vdEkzQ3Q4bTcrYzJCNFNN?=
 =?utf-8?B?bEhRc0d3V1U2OE9FYVFxcmJydHdVaFMvTUkxRnU5SFJKclBMSkN1ZS94amJO?=
 =?utf-8?B?bnFUblZvb2x0QnZ3TFliZkYvc0NRSGZmWjFMby9na0ZwUUZYWS9udHRKRTJG?=
 =?utf-8?B?WWxIZXBCZWF3VG5wNGZ6VUkxakNYbEo5RTlIaVYxV0d1WVB0VkhrSGtQSVBn?=
 =?utf-8?B?THlwVjRNYXJMeW5ucnFhZHUzY1pwY1ZJYjd5NmhxRlREdU1VbnRmNFNSeHNO?=
 =?utf-8?B?M2JsNU1RWmlBclF5emVkR0llYnRiV3hJSy9xdVJIZXkrSk5oN0w1NEwyend5?=
 =?utf-8?B?TXJ6L0ZuYWdObjZNYXJHMnpQNDcrenF4eDRrekhpSkJYVG1IUGVFTzNDNjRJ?=
 =?utf-8?B?Mlo5MGdLeGZhUFpTTmdtWFdLbW1YQnpmR2N3cVFwRzFLdW5sRWdxMkUva3U2?=
 =?utf-8?B?UEJsaFA3bC94RkpFWlNzbTRtd3VLTnkwVncwRDg3R2Qrc2F4aU8rc0tZcThW?=
 =?utf-8?B?ZjlQSUtrd1lrSHpFbnJVWlBCNnVTY1d2bXdhL1dlZHE4eGJLQzFPaU1oNldK?=
 =?utf-8?B?cC9qazJqTjhVdnFXYStuK3hFTmdVVUVpNU1Cc2RaeW9DaFFCVU55dWxwNnZF?=
 =?utf-8?B?bU16U0VIK29WWXM1SnIrc1J2a3lKaGtiYzg4V3pTVWpNWVF6MmhYSkJEZ1Nx?=
 =?utf-8?B?aFVaZTM5K3RpeFAvS0JCMHlYUXZRNHlGL2ZmeVdLamZMY0htdS9VUnU0UWdF?=
 =?utf-8?B?UDFaY05VV2JZZ1BEMmFRWC9PUVl1aURJYk1Ra1FMS0tobGoveHgxa0Q5TmZD?=
 =?utf-8?B?RUVieDNFNmxCRlE3c3pDV0NSeGJxWWVKMUhCR3MzdTFvWnBYMUtTR0xrT3Fj?=
 =?utf-8?B?UGJGRXBBa0JCd2ZoYzU4OWU5S1Z3MVRidTFqQlNNcmc3dzM3ZEd3bG9JK05H?=
 =?utf-8?B?NnZ3RVJQQzZVMm5IWnR2dlFhU3NjRVgzbm5QcEZrb056dUo3UUYrdHY2R1Zn?=
 =?utf-8?B?UWh0dFQ2TUJ1UEZtbG1vZ2ZKVjZLNkVuQ2h2aGdSYWowNm1FRlR4WUxhL25S?=
 =?utf-8?B?THRCMWJ0K3VjSGpRZWZacFgvS3E0ak12VEZJc0R4T2xPWXpmMFRvMUVxYURv?=
 =?utf-8?B?cWtiV0g4anMwM1k5MVlrY05KNVptdGlOT2J4QXpXZ0xCUW9uTklIUFlHNTFk?=
 =?utf-8?B?cGNOTzJTSm5mOTZiMkQ0VGxzZ3RtQzEvdmJ5THBFN09CV3JLblNWeGJHWjVj?=
 =?utf-8?B?NU5rdFFXNjdhbVVseGJSUWh3amE4TUdOUVNLZ01ia1J5Vkl0QW9VNWpJQ2dr?=
 =?utf-8?B?VFg2dHZTTmVoaDdhcWtpRW1EQk5IUm9FejJMS3F4UStOcG8wY0pkWURyL0Ev?=
 =?utf-8?B?TVYrYnJEaWlnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZThzLzZCeWM3S0N0NGkzY2k2YmdwdHdPSTZZNFlZSXY2c3NQU0EyS3RZemRM?=
 =?utf-8?B?bUlNVW1uSSsrNVp4SkFwMGo5aGJHKzJUdEJpOCsvOTV4M2RDU3pNMm9KdTl3?=
 =?utf-8?B?N0tueFBlV1orcmx4QlVMZHR3ZGFNQWltWjJWc2ZPWmxhMThTT0NlVmtlcVNM?=
 =?utf-8?B?NkxuMlYvc2lBNXVlN1AxdGc1WGZxTEw4WDhVeHp4NC9mQ214ZExTVUJ5Szla?=
 =?utf-8?B?c2NmcXp6eVhtRERUSVEyMVVBY2htdWFHS3JKKzZXYzcweHlSTHBLWU8yekZB?=
 =?utf-8?B?U1hLYWR4dmV0Mm9jQ3JqdHFnRnE5YjE3amJ0VndIVXVuMHpPYTZaRFJFT0JO?=
 =?utf-8?B?d3FLQzc4OTdKVVgrYklMdkR2MytYQllqUTlwVjRrQVYwRkYyWVlodE8xakhI?=
 =?utf-8?B?Z1JTNUM5NmJPNTVvQW92eFdoR1BnSmJTZ2hvaW1BNk9MdlJpR1IrZ1lBMkl5?=
 =?utf-8?B?Kzl0MmtwbWFQcmphL0FpcTNld3JVRXpYcllRNndCNElhajVaNTNRZzAvMWMx?=
 =?utf-8?B?a1FEbi9yNHIyQ1hBNHpTaTFhdklzeENVdFh6Ly90VjJra0lDQ0tNM3E4cHFm?=
 =?utf-8?B?SEhYVjJlVjRxbXRJbUNsT201ZEVtOHF0dzB0Rldnamw0ZC9MekdjRTJpMjZ6?=
 =?utf-8?B?eGw5NGRma1FBVXRhUUNQdUhodzQ2cjJiWmpudTZ3K3RFRzF0aVhyK2p1ZVY4?=
 =?utf-8?B?TElqSVppTHJGZjRaNlFCRXRWVXhUQXBqV1VuMzh6VmpncVBaN2VsMksrc1pt?=
 =?utf-8?B?RkhHQTdvUDZ3OGFlaDZyck8yMUpJTFhoemRGMGhkMnI3Wk9lQXdYcTVpMm5K?=
 =?utf-8?B?RVVQZ0N6bFFhTXB3YTRLdDQ3MGtqUm80RVdPaHE0alI3dzFibzVVWEtSblN1?=
 =?utf-8?B?NU0vZ2c3ZHNGREtobStIVkl3cXRkaDFyRzArUElEQTRaNGtybklnTmxxMkF4?=
 =?utf-8?B?ZzFTMDcyS1R6MjFnc3I3V2pUQmJXT1kvSkhTL3lITHUraWdtTlA5czVDcGQ4?=
 =?utf-8?B?ODlCN2ZQdjdLY0VGZHJPUXpRbXNkSStMNVN0YlVWSlFBSDByWkg4TlhPbkRy?=
 =?utf-8?B?WjZIdDQ3cytaT1FPMHF4Q25NdU44eGhBcE9ZRmVHdnlQSStBam9yRGV2WFo5?=
 =?utf-8?B?Y3J3em1VK2drcTFleFlKaEIyWi9Zd1g3ZG9pOUJ6ZVhaTEhDemhCMkI5TnNU?=
 =?utf-8?B?bVZKK2FiVjY1SmY2alZOMVBDM2hMRnFQdUlGaXJndzNWbEIxbDFwMmYyQjln?=
 =?utf-8?B?OFBCUW5NWDdNRUNiUCtNbEpPcm5mQVZvNVpNeFI1QjU4QUU5OExHckxWV2lv?=
 =?utf-8?B?RDRqbnJOdWlwZnp1amwwRW1UNnJZU01ZbEFkeVpIaVdTNWhyWUY3bnIrRHhj?=
 =?utf-8?B?SnhwMXRCR1lpL1hCZGpUZzY4V1ltQVdwamNmQzF2VjNhUmJPVi9KYkZtWkRr?=
 =?utf-8?B?d1NaUFhMenpWcVJ3ZlpzMmgrSHRSU1pGTDNZTXpoZHZ6WWNKUDIvVTBJRS84?=
 =?utf-8?B?ZTJ0d2EyV3M3cEtqNERYdlFzTnJkUXdncnhLTlpUR0w3aHFTM0haMlhDd0Qy?=
 =?utf-8?B?VDdyckFOblh6QjJscWNuaDU4QTlPcmJ0TUFrOU84UG1CNDBYWFJWZVFHSlhi?=
 =?utf-8?B?YWdIUTE1RFUwRXFGQXNIdHhCaHErREhCbk5wdk9rSlB1aVBhK3V1bkh6b0dx?=
 =?utf-8?B?eU9QY3hJcVROSi8vMEtKSXlZMStHTjVXcUtRUTlWb3BPSEhReFRQYzBLSTBh?=
 =?utf-8?B?M3VKNHBaOFluYjBvWCtFRnp0TklobzF4d0RmM2hDVHpLR2Y5TXZVRlZwWEZL?=
 =?utf-8?B?T1dLNDlKKytWSGpvS1E3OHRXbFBnbStqaDhOMWx2NHoxak9mVElvV2ZTNnhs?=
 =?utf-8?B?ajQzMU5xbDdPNDNZNWh0UXRHNlJEcmFzWWxnYUtMaWVjT05PYnZPUzBEMzll?=
 =?utf-8?B?QVRLaGdqTE9qMUZIeG5VOVJOOElpd3NQSVkzTmROL29pMmxOdXB1eEJVZXhh?=
 =?utf-8?B?b3Y5NDcycmdCWXVVQXBpMThLT2hwYUloc0dZRDZMK1JEeGs1RjloVnE4eVJI?=
 =?utf-8?B?R2t1U1FiUmlXbVZFM3NFSUpqSTdWMjA5RGVkeS8wUFZ6ZjFhZk9ndklNdUl3?=
 =?utf-8?Q?unKRJYdtlX3GBmSogY7zAx0rr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1012a855-2f15-42f0-cfcb-08ddb87874bc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 08:22:46.4681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZtwnXaRcpXznz2rN6L3Nl+IXb2al8Xwa9PVzXJ7FbnCPpBZUsqTn4jVQb7Bqym6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6132
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

On 01.07.25 10:18, Zhang, GuoQing (Sam) wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> 
> Hi Christian,
> 
>  
> 
> Thank you for the feedback.
> 
>  
> 
> For “return ret < 0 ? ret : 0;”, it is equivalent to “return ret;” since ret is always <= 0 after the loop.

No it isn't.

ttm_global_swapout() returns the number of pages swapped out and only a negative error code if something went wrong.

And it's probably not a good idea to return that from the new function.

Regards,
Christian.

> 
>  
> 
> For all other comments, I will revise the patch accordingly in v2.
> 
>  
> 
> Regards
> 
> Sam
> 
>  
> 
>  
> 
> *From: *Koenig, Christian <Christian.Koenig@amd.com>
> *Date: *Monday, June 30, 2025 at 19:54
> *To: *Zhang, GuoQing (Sam) <GuoQing.Zhang@amd.com>, rafael@kernel.org <rafael@kernel.org>, len.brown@intel.com <len.brown@intel.com>, pavel@kernel.org <pavel@kernel.org>, Deucher, Alexander <Alexander.Deucher@amd.com>, Limonciello, Mario <Mario.Limonciello@amd.com>, Lazar, Lijo <Lijo.Lazar@amd.com>
> *Cc: *Zhao, Victor <Victor.Zhao@amd.com>, Chang, HaiJun <HaiJun.Chang@amd.com>, Ma, Qing (Mark) <Qing.Ma@amd.com>, amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>, linux-pm@vger.kernel.org <linux-pm@vger.kernel.org>, linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
> *Subject: *Re: [PATCH 1/3] drm/amdgpu: move GTT to SHM after eviction for hibernation
> 
> On 30.06.25 12:41, Samuel Zhang wrote:
>> When hibernate with data center dGPUs, huge number of VRAM BOs evicted
>> to GTT and takes too much system memory. This will cause hibernation
>> fail due to insufficient memory for creating the hibernation image.
>> 
>> Move GTT BOs to shmem in KMD, then shmem to swap disk in kernel
>> hibernation code to make room for hibernation image.
> 
> This should probably be two patches, one for TTM and then an amdgpu patch to forward the event.
> 
>> 
>> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 13 ++++++++++++-
>>  drivers/gpu/drm/ttm/ttm_resource.c      | 18 ++++++++++++++++++
>>  include/drm/ttm/ttm_resource.h          |  1 +
>>  3 files changed, 31 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 4d57269c9ca8..5aede907a591 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -2889,6 +2889,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>>  int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int mem_type)
>>  {
>>        struct ttm_resource_manager *man;
>> +     int r;
>>  
>>        switch (mem_type) {
>>        case TTM_PL_VRAM:
>> @@ -2903,7 +2904,17 @@ int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int mem_type)
>>                return -EINVAL;
>>        }
>>  
>> -     return ttm_resource_manager_evict_all(&adev->mman.bdev, man);
>> +     r = ttm_resource_manager_evict_all(&adev->mman.bdev, man);
>> +     if (r) {
>> +             DRM_ERROR("Failed to evict memory type %d\n", mem_type);
>> +             return r;
>> +     }
>> +     if (adev->in_s4 && mem_type == TTM_PL_VRAM) {
>> +             r = ttm_resource_manager_swapout();
>> +             if (r)
>> +                     DRM_ERROR("Failed to swap out, %d\n", r);
>> +     }
>> +     return r;
>>  }
>>  
>>  #if defined(CONFIG_DEBUG_FS)
>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
>> index fd41b56e2c66..07b1f5a5afc2 100644
>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>> @@ -534,6 +534,24 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
>>  }
>>  EXPORT_SYMBOL(ttm_resource_manager_init);
>>  
>> +int ttm_resource_manager_swapout(void)
> 
> This needs documentation, better placement and a better name.
> 
> First of all put it into ttm_device.c instead of the resource manager.
> 
> Then call it something like ttm_device_prepare_hibernation or similar.
> 
> 
>> +{
>> +     struct ttm_operation_ctx ctx = {
>> +             .interruptible = false,
>> +             .no_wait_gpu = false,
>> +             .force_alloc = true
>> +     };
>> +     int ret;
>> +
>> +     while (true) {
> 
> Make that:
> 
> do {
>         ret = ...
> } while (ret > 0);
> 
>> +             ret = ttm_global_swapout(&ctx, GFP_KERNEL);
>> +             if (ret <= 0)
>> +                     break;
>> +     }
>> +     return ret;
> 
> It's rather pointless to return the number of swapped out pages.
> 
> Make that "return ret < 0 ? ret : 0;
> 
> Regards,
> Christian.
> 
>> +}
>> +EXPORT_SYMBOL(ttm_resource_manager_swapout);
>> +
>>  /*
>>   * ttm_resource_manager_evict_all
>>   *
>> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
>> index b873be9597e2..46181758068e 100644
>> --- a/include/drm/ttm/ttm_resource.h
>> +++ b/include/drm/ttm/ttm_resource.h
>> @@ -463,6 +463,7 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
>>  
>>  int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>>                                   struct ttm_resource_manager *man);
>> +int ttm_resource_manager_swapout(void);
>>  
>>  uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man);
>>  void ttm_resource_manager_debug(struct ttm_resource_manager *man,
> 

