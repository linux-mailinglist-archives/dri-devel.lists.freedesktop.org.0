Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDEPGUXXjGm+tgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 20:23:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DF7127235
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 20:23:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39CDF10E0C2;
	Wed, 11 Feb 2026 19:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PFWb+GJt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012018.outbound.protection.outlook.com
 [40.107.200.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87AC10E0C2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 19:23:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTqMsU4j39skkQpjKkIlLS1VBShRUKx2dI2fG43WjRDY5NX7lCfGP8flQWPJ5sDxJLTRt0zI6BvWdC/JJ+pPLvTiIsUP9JyqcnavC8YohlfkVAV26AHvFncv6yrHYTu+nZf99ZL14bSdNQVw2tG6EW5Tb8nj61njAnUw1hc06LDsMXGMvcu74mF10i6SfQQ0YrWht0CO3PxrLjN/ujmv0ohwwAqO2CwEKrrLdYYdLkHWXIeCNSL5iSTWlSYLciggcJ+7mwfj1ZMHoRavf1bkmmoZYYRnubsHAJSUJfckZbTEFqS9Xqjnaj1hJO4RnETGdaV0pEeGWTVKW68GYOnRDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OMxI1+qIxgWABMDuWUb32l34T7lJzS3gfO/jAbOzCU=;
 b=txqKqZrvJUHWsHO98DCaNIdPv2XG6/81St7FjmxwG7b/pKeTvYhOmsl2oYQxy0pZbXWDsGkAtsv7TWh3j4vchnSgTwMpd3gysQEyKLdicCPRLtoOaSn2dsAIu59jsSEedewMTHy2vLdaazw1SM0CzQsQtpNOx+yU9i+/xAX64MmSAZGVUn9mT1FaNUsnY4xaOvwSpY1lqVWi+c/Q1oQx+CAcNqm00VABobt0enQmydjhrvxnZeghe8c05qJBrBsCcqIbI0ozQUFYIrhhW5LFGDUnSzcEJIUzpJ1H+CzNx1vw1yUdOx0ZhwDJ1/FIo0zAx24HAZ7mmO5HNc3T7dnpcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OMxI1+qIxgWABMDuWUb32l34T7lJzS3gfO/jAbOzCU=;
 b=PFWb+GJtSTwLEB8wuYdcKhGiR3CYzpX9+z5oDfsCYo39Xv4kuQT6IVCCfTxLEy64kNCEmXglHUzSY7OFC8AEuEz1b0RZV2YwTRrH8aOrX9ns4IV4f7R7hPzrfy1AKzB5CWN4pwhhyE7zoJANZYRY07K3eX7ZImAFOabs9hTJfF4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH0PR12MB8005.namprd12.prod.outlook.com (2603:10b6:510:26c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 19:23:38 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 19:23:38 +0000
Message-ID: <86576aff-a280-4529-9976-da87f5b67d4a@amd.com>
Date: Wed, 11 Feb 2026 13:23:36 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Fix dead lock for suspend and resume
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260210191626.311976-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260210191626.311976-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0050.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::25) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH0PR12MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: ceef5859-6b84-450c-3b23-08de69a30f04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1JiV0Zzb3VzWElJZ3hEQkhKTG1ueU1LVXpaRmZLY2RhV2JoQ2ltMUhOaERE?=
 =?utf-8?B?Q2t2MFUrNWkzUHJXRnhabkhjcy9vdHhMT2NzN1VIZjVyYXJqS1MxYTQ1VHRw?=
 =?utf-8?B?Qk53S1FHNFdrZWpRa255T2s4MFVleXBHN3Z3MnlOUlZSRlhOYW5Ocms2bHJl?=
 =?utf-8?B?dWMzZWtXRWdZTkMzdVQ0RnFCUkk2cmU0SEhhMmNYbkl5bEQ4aFZrL3NxTnVM?=
 =?utf-8?B?cGVjYlZCSWd4WmRJT3ZkdkJsK3YyamNKM0hTSmhHMWpjTUtrQVh2YlZDYURw?=
 =?utf-8?B?R0JiVHg3YlZqeTljc2NOUE5uOHFHYjd5TWJLQkkzbWUyNUUyZGJOYUFmMURn?=
 =?utf-8?B?N3lqQmk1QTZIZEVPWXE1czVMYVJxdnp6bHBXL0pKWTZ3UWRVT2N6TlZ1OWFQ?=
 =?utf-8?B?NlN3a0FRUE55U0hFRmUwSzl5VUlWQkgrNVNpSzUrNnVqK0tZeWlacFNaSHc4?=
 =?utf-8?B?WUN0VGE3Qi9TVHhCcVVSZWJwVVJnZUJNWFpqWWhrNGRkWXpjT0lTdHpyNFp4?=
 =?utf-8?B?VHdqbi9YVGY1aE00M1I2V1Y4YVNjVEUxQlcxejZiQU9jcW5uYXcwUVYzV2NV?=
 =?utf-8?B?TWhIalN0clhvWHZoV1lRZUphQ051M1BMd2hJUmthcWNxZkZrMzNRODVHWEVk?=
 =?utf-8?B?VzZqY2k0blJPN2VMSmRYbUlqUjlWOHZmOW8vUmI1WUJTMUREektiWkpoYS9p?=
 =?utf-8?B?U2h4T1VKdW1xQm4yWUlEREM3MjRZOVJXYkQrbXYvMG1nOSs5RGZ5OGVudEFO?=
 =?utf-8?B?b0x0U2l0ZnMyQUs0SjJVZlFhTitrL3ZFd00xd0ZXN0hiMVZ5Y1ZqRDNNbExQ?=
 =?utf-8?B?UFVYM1VpNTA2TlJIbHc3aVRVUWxYNUxjUFozSEU3SFRLV25pSUFrNGdlQ2Fa?=
 =?utf-8?B?YmMxamRJOVJETk5tRjY4WFozZjI2RjdXUTl5Qm9SczJVdGQvLzBoZjBIeEk5?=
 =?utf-8?B?aVJSVTdBdFE2QUEyS3JjWFl2Tk83NnpONWZoUE1nSXVrU1A5N0krMkNwM2Vi?=
 =?utf-8?B?V3U3VzVxUGRxVSsrTmxTWDRoWDNNVTRPcUJ3NVZhTUJadEF5dWpMcWliTmFl?=
 =?utf-8?B?bml4c2RGb3lhazNiRlRHVjFLdTcxZC81OHVFcHZmdytZK1pXUkNDNnBsR0lL?=
 =?utf-8?B?ZjI5WGlWTitWYzloRlQ1RG5pSlg4YWxxT2RwUlV6WVQ2OEZnczBjVFpoa0Y3?=
 =?utf-8?B?Sng5WTk5Qnc4SWYyQjZRa3dxRUxlblVuUlV3MDJKVHJycjRVb0JYdlcxWW1h?=
 =?utf-8?B?Ujh2YUU4OStIUE9jZVVnY0lsbEc0bzJRejNCNm9PWkk0QTZXUFBRbGdYZzBh?=
 =?utf-8?B?M1BCNFVSMW80S29seHZqZmovbCtIYnU3dUJHcm9wRTNKQWhaZ2kwWDliakF2?=
 =?utf-8?B?Lyt2aU1hU3ZoZ043SnpNSGdlRHNXU2JDZ2lmaWsxcFcrUmppbG5nOEV2dVZu?=
 =?utf-8?B?YUdwQWRQMTR0L04rckNZUmlaV0E1ajJtZE1WeFFwUEpoRTdKQXFyK2txTXhW?=
 =?utf-8?B?M0NBSGppK3JQMnZ3cnI1WDlTV3ozK09OQmNBU2pIM2Q4OXhEci9xRlN4VG1i?=
 =?utf-8?B?RXltRkppZitTcWQ5SnN1d0JnZ2RXdXpjMTFXKzlDa1ZIMERjN1NzK3k1a3Yw?=
 =?utf-8?B?TFFmTXdycUZGeDJzWHlTdjdNYnEyVjNBWTFrRDIxekJHR2RJL0p6RktMd3RQ?=
 =?utf-8?B?T3kwc1dRZ09wVlFtdHF5QU1oc3JBSkUzR1RCVVVGblZKamp0Tk1EYWNGTnVx?=
 =?utf-8?B?bVZ0TWVSVXI0aEJoR2ZXWWxML0g2d3dHZUh3NnpsbWM4SnU1OW1Cc3pFSWRB?=
 =?utf-8?B?UU9mU2FSckVLc0IxWDRnQWVUajZuVlVsUFJEeGdvT1pmM042czlIVzRjcjlu?=
 =?utf-8?B?T3hKOFNmKzZNQVZkYTdvQXJjaHFOY05XTXFLVDk2THhsWFlCL2w0cktld1VI?=
 =?utf-8?B?U0xFZHZXYTZTbTMraHE1L3NjTGtlc0VYb1dxVTg2VGcxWnRzU01wbVFLSWV5?=
 =?utf-8?B?MTZVZU82NC9wcDQ4K2hKNFp0dmhEZnEzR3hScCswckFWS3FhMk4xTG53UjN4?=
 =?utf-8?B?ZDMzcjcxaGhsVGlsSnhqYU04b09JdDVVSUV5M3lIRDRUMnBaSDQ3YXdpVTBq?=
 =?utf-8?Q?7XbQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnAzMFFoNmlLbzhqN3NVVm4wUEduQmJqTnkwQUlCeWVxdjJqbEhXb1RtQ3F2?=
 =?utf-8?B?bmVCaEVLZXlyREFtZWNwYVpTSHFLbHhjL2FQVHd4TXkrU3ArVjg1Sm5NMFk5?=
 =?utf-8?B?QVczSGlKekw5MUNVRjVnRHY2YW1tM1AveHlHa0pnS3U5anBRak1KUlBTV3Bu?=
 =?utf-8?B?MHpEcTJLZDdrTnMxV2w4RkVRbnUrL3dnUzRyVU0zWjBITHBMUzhTc0h0cmJL?=
 =?utf-8?B?MTMwV0twLzA5TitsRVFtQ2JyN2ErVHZWa01IWXlDRWFSWUxYMW50TTNOdEVx?=
 =?utf-8?B?eEFHZEREVnp4emxCTU92WjY1ZjV3aFhDWUJxRSs3U29Gc2JkUkZYRHRaRDRp?=
 =?utf-8?B?N2wvcVhOanp3ZXBtMXdVZXJvMzQ5bFZsRjRvWUxVYis3Q29EdExxMTFXaDhr?=
 =?utf-8?B?NFhuZDRWMUYzL0JYcXRuN3ppMDRaSXg2YWJaWHVWbUI4YjdMN0JiWCtjNnov?=
 =?utf-8?B?bkI2NHB1Z1dMcUNXVWJUem1xUWVPQTcvWmtRL25vL0NNT3VrQS9lS2FhU3lr?=
 =?utf-8?B?SllZU0xjSlVVak9mOXJ6ZjZZeTJZUjVOb0ZNcEplemYrK1NiT3crR1BqYkF5?=
 =?utf-8?B?UTkyeDVpRXIyTGR2a3Avd1BidzA4bVdjY0RaM2NPUHRCSVl5MS9jczhMaDI5?=
 =?utf-8?B?RldyUHJwM0dFYzFkYnBVdlUvbjBaR015dHJTcU1hUDV2eERHUzM2WnpHbGJT?=
 =?utf-8?B?d0FRZWNWWFBLOFU1akR1ODdrTy9sVlJyNGl0cnB5U0tqUm1TTlZMNnljakhD?=
 =?utf-8?B?THoxSmJRcGNLMnpCSEptQmx4R2V1WFdDTVliYmFZQk5PdmVCSHhDWVMxdHpi?=
 =?utf-8?B?VDI5bGNPOFJoVmRFTjNJcGcwNjNFY0dJUzlYRjZEUm95N1dLNUpqVUc5U1Fm?=
 =?utf-8?B?OWorYTkrWjhtdUJwVUxuUnNQUTl1TzlaWE9CdHNVbG9na2NOZkd6VldIRHJD?=
 =?utf-8?B?UXFsOWhzVDl1WXJHRm55Y3B6SjFRL2xmcndNN1BLUkx6SEV3TUZtMmZ6M3dC?=
 =?utf-8?B?azdZM2xvUVdjRUhzY2wyTDk5czhMUDg4b0lZN1VITXVjdnhJa0JjS01idEI3?=
 =?utf-8?B?bjBxV1RqbVdwZk1QTkVENGNZa05lczFyRG0yMVV4cWJuRWZCM2tGcTlBUU1v?=
 =?utf-8?B?M0M5alVFS0ptV0pGQktpbGNrODlIWnkyZE5sbzZ2UjdsY3Y0Tko0WGtCTXN3?=
 =?utf-8?B?UnBCbVJaM1VCUExjaUJ2OGgwMU1sb1Uwc3BlL3J1cTd2YnRHWW1qbmdLaWlY?=
 =?utf-8?B?bzNFVFZaM3Vuc1EraFdEL05KU1oyVlk1N3oxTXUyY0w2cFBrbUJReTFkcGMx?=
 =?utf-8?B?bFlTZ0lSVEczaVlnd1pycjJCODZ0UjR2NVd2WjRudlRFd3QzMTV3NzBsdHoy?=
 =?utf-8?B?TEFCc3M5Qm5TcU1hVG1JWjNSdVlXbjBDeXBKcGlZbENLbmFpck90a1dHZDYz?=
 =?utf-8?B?M0VhTFlSWkZqYTdraUJzSjFRdWs1Zy81aWV3d1RRcnVrbGpLRmd4M3pUbVB6?=
 =?utf-8?B?K2R3azFaL21xVHV1M0NyL2JUclpYUUIxYnNqYVNONmdMRUw4RmFXcjJEbmV3?=
 =?utf-8?B?amdEa055cU9qb1d4NE9VWm9XRENPeHR4YVYrS3VzMUdZaXdqdWZOeFY0cnBp?=
 =?utf-8?B?VzdmSzJaZEpvUmd0S1NOM1JTdkhhQnk0NEJtZGNuVDU5WjRMY2NDR09pZWxz?=
 =?utf-8?B?cGsvNGtBLzhITzRxRFBzZEFaZ0d5aG1YWVBFb044UFNnNDZRbThaL3ZNT1JF?=
 =?utf-8?B?aWFnaCs2MDZiaGlFc0txUGFzeitKMXVUTFZ4djFvN0JuNWpLeGl0cjJYQVlo?=
 =?utf-8?B?cUM3TXdzdDhtcHNUdkdrSEszZW1vS1U1a0VVRVFnVW90REZlUlZYclRyVUlG?=
 =?utf-8?B?V2h2c3E5dmwyVkhEOFlTUmhHcTFVV2MzNEhTaXgvSHdCekRidGVNTnk4cUFl?=
 =?utf-8?B?bmVvTTV5MmpYTm5UUEQ4VEg0ejMxNFRTaWtNc2VXdmdGWDJWaHU0SWxPTFNG?=
 =?utf-8?B?dzRlWW1vRjdXL1FnR1NxRStHRVpTdzlTY3Jqem8yUTNWZHVzd2JVQ1VuZVFz?=
 =?utf-8?B?aTg4a3pTWHNhbXdCSjIvdHVUeHN3TGJSZ205S0RnUEhEWGZvSld4TnovZnpL?=
 =?utf-8?B?bnNTNXpxOGxZYU1DUjlyUTZURDRxY3E4Uy91V3JMSUNKWWVYMklLemxEN0Vi?=
 =?utf-8?B?UzZzWUcwVXQ5RHUrTUFIMFllQUN5bFhDZE5UalcwbHpHOElIOCsxNi8rSnBW?=
 =?utf-8?B?OStpRmVaa3lSVTE5Mm4vQUtZSklPRmdWZ1IwQ1ZSK1ZlR0oxVlZPNUFFUjBI?=
 =?utf-8?Q?yhLurtkMp5BAbVs0fp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceef5859-6b84-450c-3b23-08de69a30f04
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 19:23:38.7479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1XNL4LUyi4hIKzVXqMVuV8gFlF5XmPRmteQQS/3w30jUyFduBcKGGZX5WeDuoBn4SIQCn+puV4pSUrB3xspAjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8005
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: A2DF7127235
X-Rspamd-Action: no action

On 2/10/26 1:16 PM, Lizhi Hou wrote:
> When an application issues a query IOCTL while auto suspend is running,
> a deadlock can occur. The query path holds dev_lock and then calls
> pm_runtime_resume_and_get(), which waits for the ongoing suspend to
> complete. Meanwhile, the suspend callback attempts to acquire dev_lock
> and blocks, resulting in a deadlock.
> 
> Fix this by releasing dev_lock before calling pm_runtime_resume_and_get()
> and reacquiring it after the call completes. Also acquire dev_lock in the
> resume callback to keep the locking consistent.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
No Fixes tag?

> ---
>   drivers/accel/amdxdna/aie2_ctx.c    |  4 ++--
>   drivers/accel/amdxdna/aie2_pci.c    |  7 +++----
>   drivers/accel/amdxdna/aie2_pm.c     |  2 +-
>   drivers/accel/amdxdna/amdxdna_ctx.c | 19 +++++++------------
>   drivers/accel/amdxdna/amdxdna_pm.c  |  2 ++
>   drivers/accel/amdxdna/amdxdna_pm.h  | 11 +++++++++++
>   6 files changed, 26 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 37d05f2e986f..58e146172b61 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -629,7 +629,7 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>   		goto free_entity;
>   	}
>   
> -	ret = amdxdna_pm_resume_get(xdna);
> +	ret = amdxdna_pm_resume_get_locked(xdna);
>   	if (ret)
>   		goto free_col_list;
>   
> @@ -760,7 +760,7 @@ static int aie2_hwctx_cu_config(struct amdxdna_hwctx *hwctx, void *buf, u32 size
>   	if (!hwctx->cus)
>   		return -ENOMEM;
>   
> -	ret = amdxdna_pm_resume_get(xdna);
> +	ret = amdxdna_pm_resume_get_locked(xdna);
>   	if (ret)
>   		goto free_cus;
>   
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index f70ccf0f3c01..5b326e4610e6 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -451,7 +451,6 @@ static int aie2_hw_suspend(struct amdxdna_dev *xdna)
>   {
>   	struct amdxdna_client *client;
>   
> -	guard(mutex)(&xdna->dev_lock);
>   	list_for_each_entry(client, &xdna->client_list, node)
>   		aie2_hwctx_suspend(client);
>   
> @@ -951,7 +950,7 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
>   	if (!drm_dev_enter(&xdna->ddev, &idx))
>   		return -ENODEV;
>   
> -	ret = amdxdna_pm_resume_get(xdna);
> +	ret = amdxdna_pm_resume_get_locked(xdna);
>   	if (ret)
>   		goto dev_exit;
>   
> @@ -1044,7 +1043,7 @@ static int aie2_get_array(struct amdxdna_client *client,
>   	if (!drm_dev_enter(&xdna->ddev, &idx))
>   		return -ENODEV;
>   
> -	ret = amdxdna_pm_resume_get(xdna);
> +	ret = amdxdna_pm_resume_get_locked(xdna);
>   	if (ret)
>   		goto dev_exit;
>   
> @@ -1134,7 +1133,7 @@ static int aie2_set_state(struct amdxdna_client *client,
>   	if (!drm_dev_enter(&xdna->ddev, &idx))
>   		return -ENODEV;
>   
> -	ret = amdxdna_pm_resume_get(xdna);
> +	ret = amdxdna_pm_resume_get_locked(xdna);
>   	if (ret)
>   		goto dev_exit;
>   
> diff --git a/drivers/accel/amdxdna/aie2_pm.c b/drivers/accel/amdxdna/aie2_pm.c
> index 579b8be13b18..29bd4403a94d 100644
> --- a/drivers/accel/amdxdna/aie2_pm.c
> +++ b/drivers/accel/amdxdna/aie2_pm.c
> @@ -31,7 +31,7 @@ int aie2_pm_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>   {
>   	int ret;
>   
> -	ret = amdxdna_pm_resume_get(ndev->xdna);
> +	ret = amdxdna_pm_resume_get_locked(ndev->xdna);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
> index d17aef89a0ad..db3aa26fb55f 100644
> --- a/drivers/accel/amdxdna/amdxdna_ctx.c
> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
> @@ -266,9 +266,9 @@ int amdxdna_drm_config_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
>   	struct amdxdna_drm_config_hwctx *args = data;
>   	struct amdxdna_dev *xdna = to_xdna_dev(dev);
>   	struct amdxdna_hwctx *hwctx;
> -	int ret, idx;
>   	u32 buf_size;
>   	void *buf;
> +	int ret;
>   	u64 val;
>   
>   	if (XDNA_MBZ_DBG(xdna, &args->pad, sizeof(args->pad)))
> @@ -310,20 +310,17 @@ int amdxdna_drm_config_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
>   		return -EINVAL;
>   	}
>   
> -	mutex_lock(&xdna->dev_lock);
> -	idx = srcu_read_lock(&client->hwctx_srcu);
> +	guard(mutex)(&xdna->dev_lock);
>   	hwctx = xa_load(&client->hwctx_xa, args->handle);
>   	if (!hwctx) {
>   		XDNA_DBG(xdna, "PID %d failed to get hwctx %d", client->pid, args->handle);
>   		ret = -EINVAL;
> -		goto unlock_srcu;
> +		goto free_buf;
>   	}
>   
>   	ret = xdna->dev_info->ops->hwctx_config(hwctx, args->param_type, val, buf, buf_size);
>   
> -unlock_srcu:
> -	srcu_read_unlock(&client->hwctx_srcu, idx);
> -	mutex_unlock(&xdna->dev_lock);
> +free_buf:
>   	kfree(buf);
>   	return ret;
>   }
> @@ -334,7 +331,7 @@ int amdxdna_hwctx_sync_debug_bo(struct amdxdna_client *client, u32 debug_bo_hdl)
>   	struct amdxdna_hwctx *hwctx;
>   	struct amdxdna_gem_obj *abo;
>   	struct drm_gem_object *gobj;
> -	int ret, idx;
> +	int ret;
>   
>   	if (!xdna->dev_info->ops->hwctx_sync_debug_bo)
>   		return -EOPNOTSUPP;
> @@ -345,17 +342,15 @@ int amdxdna_hwctx_sync_debug_bo(struct amdxdna_client *client, u32 debug_bo_hdl)
>   
>   	abo = to_xdna_obj(gobj);
>   	guard(mutex)(&xdna->dev_lock);
> -	idx = srcu_read_lock(&client->hwctx_srcu);
>   	hwctx = xa_load(&client->hwctx_xa, abo->assigned_hwctx);
>   	if (!hwctx) {
>   		ret = -EINVAL;
> -		goto unlock_srcu;
> +		goto put_obj;
>   	}
>   
>   	ret = xdna->dev_info->ops->hwctx_sync_debug_bo(hwctx, debug_bo_hdl);
>   
> -unlock_srcu:
> -	srcu_read_unlock(&client->hwctx_srcu, idx);
> +put_obj:
>   	drm_gem_object_put(gobj);
>   	return ret;
>   }
> diff --git a/drivers/accel/amdxdna/amdxdna_pm.c b/drivers/accel/amdxdna/amdxdna_pm.c
> index d024d480521c..b1fafddd7ad5 100644
> --- a/drivers/accel/amdxdna/amdxdna_pm.c
> +++ b/drivers/accel/amdxdna/amdxdna_pm.c
> @@ -16,6 +16,7 @@ int amdxdna_pm_suspend(struct device *dev)
>   	struct amdxdna_dev *xdna = to_xdna_dev(dev_get_drvdata(dev));
>   	int ret = -EOPNOTSUPP;
>   
> +	guard(mutex)(&xdna->dev_lock);
>   	if (xdna->dev_info->ops->suspend)
>   		ret = xdna->dev_info->ops->suspend(xdna);
>   
> @@ -28,6 +29,7 @@ int amdxdna_pm_resume(struct device *dev)
>   	struct amdxdna_dev *xdna = to_xdna_dev(dev_get_drvdata(dev));
>   	int ret = -EOPNOTSUPP;
>   
> +	guard(mutex)(&xdna->dev_lock);
>   	if (xdna->dev_info->ops->resume)
>   		ret = xdna->dev_info->ops->resume(xdna);
>   
> diff --git a/drivers/accel/amdxdna/amdxdna_pm.h b/drivers/accel/amdxdna/amdxdna_pm.h
> index 77b2d6e45570..3d26b973e0e3 100644
> --- a/drivers/accel/amdxdna/amdxdna_pm.h
> +++ b/drivers/accel/amdxdna/amdxdna_pm.h
> @@ -15,4 +15,15 @@ void amdxdna_pm_suspend_put(struct amdxdna_dev *xdna);
>   void amdxdna_pm_init(struct amdxdna_dev *xdna);
>   void amdxdna_pm_fini(struct amdxdna_dev *xdna);
>   
> +static inline int amdxdna_pm_resume_get_locked(struct amdxdna_dev *xdna)
> +{
> +	int ret;
> +
> +	mutex_unlock(&xdna->dev_lock);
> +	ret = amdxdna_pm_resume_get(xdna);
> +	mutex_lock(&xdna->dev_lock);
> +
> +	return ret;
> +}
> +
>   #endif /* _AMDXDNA_PM_H_ */

