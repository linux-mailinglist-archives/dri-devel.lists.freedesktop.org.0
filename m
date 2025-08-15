Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B28DB2865C
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 21:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39F810E233;
	Fri, 15 Aug 2025 19:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i+5m0D9d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DAAA10E029;
 Fri, 15 Aug 2025 19:26:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLfLQ2cgQFowW2cmCLbc3L57cxptdtv77fNHJ60nbEcLevKXIJW02Clu7xvOv21xHqhjwlfHmMXaW9dz4LaxSaDmRJcndgPMpXlBTb6hNi8heG8tu+tpIpNChcMz4aUNkhJ2nrH0cS53OBgpw/qutjDXwPv9K7+wpHkPrELv0srjO3TlM0T6xeZBKOT79NTt4zTpfIXUT3qAXcbrYoeglqs2VGLdaiiK8uaU3IAoHZYp0T7GXEWbeSYq0PIqvr1hCbb7zlm7aSPSthPqb56D4aqfm41N5nk4cXIYxOC2/EXMl3eUjTaT+d4+4fGA9oLWeo5yI4EEi6+GSl1QY0g9kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGZU3WDVLPP9/zrCv0LCmgCw6eyUYSZTyKHWUUlQXPc=;
 b=QCyM5aZ5QoWyHWwanBmqtUM4ET9GqRE8MIZpvpkasKH04gDm92D69EilHBMCZ9VPBJRTVhvwvQgsL5m2AepfGoI0PD/entkd4LmZCs3zsZADkTIS/gWEmkPtCXsVbPHJ9sX8adgdZxmRXJfhuDOBMVVtvOPlTxvqW8kIlDjkWjzXzzX5F6i0F9aURl51V/IzAh5G5w5ZjtnJN5JyUBf8wQaZSikWaxMOZl2R43wH/P0HFsgJOZePMc9yB4wVrDU7sys5MfpKudKtli1bni2Bm/eWAnrRdIYydKL4vVY+RYT+70CD1fLM6ky4PB5Gxi/57TcqEEPFvgw6XHFePeTtmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGZU3WDVLPP9/zrCv0LCmgCw6eyUYSZTyKHWUUlQXPc=;
 b=i+5m0D9dyY7s4E4KF6BcqS0zZADCkdbwLvh+I0qNf5WcqVaB4fQRtEnxL1SBQqkY905X06exjMr7TQP4RA3cZKs/vCSoNQkG1uRZH+gcMFkI01ucU2gk9qWjy8Nbte85/d5F7g2C9L+NJ0X330/B4AoR+VTVtZHnPQ42kzTKz50=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DS0PR12MB9397.namprd12.prod.outlook.com (2603:10b6:8:1bd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 19:26:13 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 19:26:12 +0000
Message-ID: <774b1164-b1e9-4b99-9dae-b6688980e39d@amd.com>
Date: Fri, 15 Aug 2025 13:26:09 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 31/47] drm/colorop: add BT2020/BT709 OETF and Inverse
 OETF
To: Qu Shengyu <wiagn233@outlook.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "leo.liu@amd.com" <leo.liu@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>,
 "mwen@igalia.com" <mwen@igalia.com>, "jadahl@redhat.com"
 <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>,
 "shashank.sharma@amd.com" <shashank.sharma@amd.com>,
 "agoins@nvidia.com" <agoins@nvidia.com>, "joshua@froggi.es"
 <joshua@froggi.es>, "mdaenzer@redhat.com" <mdaenzer@redhat.com>,
 "aleixpol@kde.org" <aleixpol@kde.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 "victoria@system76.com" <victoria@system76.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "uma.shankar@intel.com" <uma.shankar@intel.com>,
 "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "marcan@marcan.st" <marcan@marcan.st>,
 "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>,
 "chaitanya.kumar.borah@intel.com" <chaitanya.kumar.borah@intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>,
 "mcanal@igalia.com" <mcanal@igalia.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 Daniel Stone <daniels@collabora.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-32-alex.hung@amd.com>
 <TY4PR01MB14432C77EDFD80D2075FFCC2A9834A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <TY4PR01MB14432C77EDFD80D2075FFCC2A9834A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0060.namprd16.prod.outlook.com
 (2603:10b6:907:1::37) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DS0PR12MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: 399bb75e-e9e2-4f49-412a-08dddc319854
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFRaMXJ1UEFickVWZnhJTm5pc0E2dXpyZGZ4QXNYdWhjMFUvOE5YT1h2amRa?=
 =?utf-8?B?UDdNWWlyL2M0WGp3d3QzSVhuRVNnSDhxbXdpV2tDQ0JWdW1VQjJQbmVxUkgw?=
 =?utf-8?B?TVd1dkRqOCsvL2ZtdUswUEk4RzNjQ1Y2N3o4NnZHNGw0YVc1Z1lPcHpFS3Bt?=
 =?utf-8?B?S21mcjZ4UStMcXBRaUJ3VCtoNDAwTm5RNjlFZmswK2pJa3RVMVI2c05keGxI?=
 =?utf-8?B?bVplOFMrOW1pMm4wWDVGRzZxeE12TmlERUsxdmUxMitVZ3czQjdpRk5hQ0Rq?=
 =?utf-8?B?YkJuOGgwTjQ0L0VRV2g1OTA5OHpCVUhKNlp4amg0UEtJMDU1Ukp6ZFBKL3Ar?=
 =?utf-8?B?S1BkQXhqVTNheVZIOUs5QWZ2T2tPd2FibWsrWXpKMzdkNU1BdDVVVi9DNmpt?=
 =?utf-8?B?WmpiTkF1bHZjRW1ublBWZm9QNHZLZzVNZUc1cXBwK2ZOMFFIalZQTHFzU1Rh?=
 =?utf-8?B?V3RWNXQrS2ZlOUhqMG01M1FFU1hLYldoVXhYaUdNWTJLZEwxMFIwZ3pZc0Fi?=
 =?utf-8?B?dkFaZFVqeDBoeHZEMkNpZUgzWGgvM0NaTVdxY0thNWVEMzY3L0R4Qm4yWGZN?=
 =?utf-8?B?MmtldTlNZVgvVHBaNUxTTzRlSmVtaitwNXpibEs5cXhGRVovd0Z2UmJ2b1F1?=
 =?utf-8?B?QnJ1b2tjTkwxUUx3ck1QOE5rYi9XUGZuWkN1RElpMnY5ZnZpOTV5RGE1VndE?=
 =?utf-8?B?ZkxnQXkvZGpEbkR6bEgvbTFiT3BkSFUyZXdPTjdLeDVoSStSZk52TjJ4N1R5?=
 =?utf-8?B?eXhKVlJ1T1VRUHp2WWlNUkdnaXFFd0t3S1hnWHZhV1pKR1ExUmxjajJXdGNE?=
 =?utf-8?B?d0RuQm00ZXZ1M2VpaUhVdDVTZGFlcHQzb0FYZE11OUx1Z0lPamFPamFKZU5R?=
 =?utf-8?B?bTNDTm8vQThlVHc1anFwRU9JaEs1akpLMG9nMjgvVjBUdFVma1A2KzFsb05Z?=
 =?utf-8?B?L296VFFOWjlDZTk2QjM2WjlwR2NacWorS0lFNWFLaW45WWd6RnRzbTNyNTlk?=
 =?utf-8?B?Y0VEcFZBdnl5RkVkZXZrUnFsTUNNSEk1c0JxR1Q4amZYSjBIYmRYVE5HQnA5?=
 =?utf-8?B?cDlPajVhT2c4Y3FzSnFLUVllaWlmbUhtaGFRWnFCOGhreHErM3RFTTVnUlgz?=
 =?utf-8?B?ME44V0FId3ZUNkpVREhFQTJjOEUwaFo2Mjc0QnNBU2pKYW1maVdsemd5VTBE?=
 =?utf-8?B?TVl2YWR1M0hnVkVtVnFFY2dmK1dYOWY0NVo4RTBkbjdtdDNyMmlMTTRwdEVP?=
 =?utf-8?B?UDBkZTZqTVlzbWdCZ2FQVUkyKzR3Wm5STGZnTXdKcHBoU3lsemxNb0NraHFL?=
 =?utf-8?B?dlUvQWdiOGJ4UGtqSzlFSnZiSE53b2lXeWNmMlZ5ZFFLcXp0R2dHeGwzcE9B?=
 =?utf-8?B?cjZKRU9BWjVNa2p4ejIxTXg1QUJESkVZVUE3ZUMxcjN1eCsxR3NJVUhGSkpQ?=
 =?utf-8?B?THUzcFdQODlKOGdUL3IxWXpTUFhJSGxNeUozMTgxTVlDbzB1VHJFelExNmhx?=
 =?utf-8?B?SDg2Z2xWUkpBbmJYUzBVZ0Fxa0Yza084U2V3NmZGZmxyL1o3aTl0NXE3cXFV?=
 =?utf-8?B?ZUIvaFBLdUpOQU9MNnB3eTNINjVoNjdqTUtNMXBhODhVek5VNlBYdVkxd01G?=
 =?utf-8?B?bzBmL3A5UnczM2wwQzBnZThLcURDdGliQWRhaUZLV1F1NmNLMUpTWWwwOW10?=
 =?utf-8?B?RlJUS0hLTU92bnZ2cXc0cytHNm1FTVkxMVkvczh3d2tuYUdUNndkZFhQblRT?=
 =?utf-8?B?aURkek4zT2FlUW5UZ3ZHYlRTMFptVTIrVGJuNG5WQStsWnRFVkprRUVBMjdk?=
 =?utf-8?B?TVNTZFc2L3Yzajh2dkdVRnVuOU5rZVdxTkJDcHVadXlxRDVhSVRJdlVkMC9V?=
 =?utf-8?B?b3JUUENtT2xBSUtrZ28yZWdqWGtwb0Z2akhrSm9ta3lLY2NZaTYwOVNtaEU2?=
 =?utf-8?Q?u6D2e8QXoVE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmVMQW0wNEJCUHc1Tnp0Y3JyMDJPSVdTTjJkUDJkVUFGK1NnSVY5M0xuYzBL?=
 =?utf-8?B?RmdUQSs0N2lPNEpoUXYvbDhlY2wwSm9rOUovcmZnNGEyMGFicjdRTTZ5TU1u?=
 =?utf-8?B?ZTQ5RFRNYWMySDFLMnNiamM0TTFKWTlFWXNDQU9qMXQ3K2dpbnJmZ0V6Q2tN?=
 =?utf-8?B?dG9qWXVZSUZKUXY4ODJlWk0rKzY0RkVQREhzbGVxdWkxM1hUZjA4dlR6UkRj?=
 =?utf-8?B?azBSMnpjL3psUFdNN2V2THhBRkl4bkFxM2ZUSjdsc1F4dFNZUFhlbXhOcGVN?=
 =?utf-8?B?bEZWM1ZIVDRnYm5RUVBxNXVrT3RRMzlscmFCZVFLRFNYWXFmN2w1eEVGL0V1?=
 =?utf-8?B?dWVBY1dNY0pXYjl6MjV6VDk3M04rQkFyUDU0eklCOTVqbkJBYWgrdUdJYkUw?=
 =?utf-8?B?S21MZHlhVmJWNnQxN2hNT2ZhUkE5TkFkRXVtd0VJREI3WTMzRWFnNDFhQi9R?=
 =?utf-8?B?ODZPN3U4cmZuZXYwa0tuZUp1YnFRT09QN1VMcjJ0enRad05QSVZDb3lmSWVy?=
 =?utf-8?B?amZtZnM3ZjhrbTVVazZMNXZGWm9qQWN3Z1RGd2RYNGVCaDh2aVJxdXFYY3d2?=
 =?utf-8?B?VFNFa0ZhTGNtaEdIR3ZNQlU3ZkNsSHl6RVBUSUprVVRiL2Q5VlZCc2c4WUUx?=
 =?utf-8?B?UStOVnB4cEM2bWZza3ZMZlZMRHgrY0hiT0NHQkt4QlBVNk1COWIxa2prYjVz?=
 =?utf-8?B?SW9icXdieUlia3ltSy9zSXp4eVI3QlgveFBnTUQ3QVFUcEZseHpmZHZzeFNT?=
 =?utf-8?B?N3FNSDVwRnhEcDc1VXdmNkxzT1V3ell1Wk1IQ2ZNanVhS1ZNUXZyQkwwNHhn?=
 =?utf-8?B?blJldnlVUEVmaXFqUlBBZFNTRU1TQVgvV1ZXSFJsOXNhRmZMZElnc0VUcms1?=
 =?utf-8?B?c2VZMk5HdER3djhDTURHbS9ybHR0blVaa0ppLzRsblAzWGlsM0VCRTcxOCts?=
 =?utf-8?B?ME1HRWFwaFcxVUhNaVpqL1JsRFNEdForYWFRRzUrSXVidjJuOXFzdDkxQkxT?=
 =?utf-8?B?bWdjTUhQVWVBMmFKeG1UZ1MxRTRtaXVUZ2YvRXZGd1RvM093N2RJMy9CeEJl?=
 =?utf-8?B?VEFiYnR1Wjc2M1lwTjBLUHhnbUVUcGRIcFdpM0k0bzltYTZ0aGJHSlFGSHZS?=
 =?utf-8?B?bzlCdWgvMC9zeGhiNG13VWhtMXNXQlFlODQySkd2Zk5VbkVzcmVpYmIrS0V6?=
 =?utf-8?B?VDNYQ1ZTNkNLaXA0ZlN0aHlBOVVuZmpjelRuaXNTOXdaTnhLWSs5bmNkMzFj?=
 =?utf-8?B?SGFpL2k5VHRUeEpOc1ZWUHorYjRoSmlTMGxMcHBSdlJNOTkvaWdyZ0xoT3BW?=
 =?utf-8?B?dkpZVlJiYXpDNmN2Ly9PdUphNTYrL0xDVHQ4L2RKKzlUWkVaSmkyRUtLdDJP?=
 =?utf-8?B?L1ArQk80L0JvYTZZTXFHQVdvbC9PUzczRXYraENKNC9VQ2dqMFE1dXBkWlEz?=
 =?utf-8?B?RStFTjVNNHN1S0ZlL1pJLzBJUWhaODc2NXVpZ3BLcDVYWVBRNHltTWF0VU92?=
 =?utf-8?B?eHkyTExNN21zMDhrcTBzUmEvbHVsMG5VRFJmOXBOeHA2U2lIdkUxbGVuV0k5?=
 =?utf-8?B?bi9BbzlZeDc2bFlSYzJuMnpjVnllMUxvNVpnSi9nZWJWVDFVczVTcURkNVAx?=
 =?utf-8?B?cDFxWkRUdlk5K0ZXRWsvTnlnYU52L3FBUTBOV2FXellIWlVFTHdUcVJNRVZ5?=
 =?utf-8?B?VU5penVtakN6Z3VsN1hzck9MaWF5b0l4TWI2enpPN0Z0R0xKRzI3d3hmVHhw?=
 =?utf-8?B?ci9tcXBNUDBxTUlVSllPSEducUt3TzIxQWMzbHNQL3lmL2tJTUlQSUxvamNw?=
 =?utf-8?B?akdLYjFncnluaUNDSkNwRzBUMm1ITUxubkVCSmhJaGdhbGwzYnRTRXR2clN4?=
 =?utf-8?B?eFhTVzM4Y0h0c3RETG9zc3hjcS80Z29vL2Y0T2h6d3k2eVRXODZuU2FIS0lr?=
 =?utf-8?B?OWtlekNIMk5EcnE3RkU3Wk5qTlpYWGN3cDJkRlExSDB5M1RpdDJORVliZDFK?=
 =?utf-8?B?V3hJSXBya0d0VFNBTmFuZXRxdlV3RDMzTTVOVE03V3ptODdscXBnejdjUkt4?=
 =?utf-8?B?SnB1OC84VWZRVms2ZXlvNmNiaVovUXZLbENVSC9CYkM2ekNDaXo3enQ1czFa?=
 =?utf-8?Q?/WjSGPwo+RfI0YMUaYn7WsPis?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 399bb75e-e9e2-4f49-412a-08dddc319854
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 19:26:12.6761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+GNNi5pA701j3lciUAkPX/PiEICvCr7z4JVMIhYvbei42R+fzF5Ov5JTXG8a2sTxUKDw/B74Je/w3CE80wI4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9397
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



On 8/15/25 11:54, Qu Shengyu wrote:
> Hello,
> 
> What actually is this OETF? Is it power 1/2.4? Or reversed BT.1886?

https://www.itu.int/dms_pubrec/itu-r/rec/bt/R-REC-BT.2020-2-201510-I!!PDF-E.pdf 
(Table 4?)

> 
> Best regards,
> Shengyu

