Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C15CA9F31DB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 14:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D56D10E687;
	Mon, 16 Dec 2024 13:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QhgPnUR6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB96110E683;
 Mon, 16 Dec 2024 13:44:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Etl0HL/NybgRpnunbGGCziPKgUuqb5/68an6WzYfbbhPGu36UyJIkNuW2Px2HU8hyhDC2Ad4QCxSK979YQeqmXerFrx5C+ikNLlIraZ96tVfQChoVtT9plsMb2aHFCK976TycpOrUN2ZF4/VtIk4FVC4d57lDd7MzhHPk3C7nvqIPRGuLsBNvnefjvfilo8VqAhMfw7Xb134/SXhR7LFS6a757wGBkP+GijIZmCj66QDwSgjtAgPT3fL8yz92oX42tysPFWHf76miLhLaaD6n+bg0jVXB06hycst6DysUKDPxzrJkdM2VV3b/m7ljNUenWvs/yC2+fcmwm4gh2RfMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2P151CmXS3jmMec7D+i0kqzATQcfDyZcPO38Bz6s6fM=;
 b=bERgFfKn6vqMoYJ9/VJXYH8pqvD6RNRA+jvq7wm+3f+n1YLC6hvJwGvUROmqsc6hzqka5lgSatT6RWMDRBUwHqeSG93qSv4imKzPeudQMrsq5m6GXDdjqxtyDPGJ6EpuhFFeNxivjydbNMmld88gGaMU09WEVmIb/n0kLyXSvxuMVVLW/RmVQuXjOcXhTDB1/fPqTq00VTC6i56YZru5bJziTCD3oegrVzGMIWU+gYGMw6xtvJWRsCXDxYbA68V3w2zLmpoV3MhbVstCEJ0Z18vVUf1ieKM1+XR7+8eYwkw/Ty539KWjEAnoF2bApTPfYrCJef5OzRByP3hQo1hUcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2P151CmXS3jmMec7D+i0kqzATQcfDyZcPO38Bz6s6fM=;
 b=QhgPnUR6XzkDYTGB8+3H+BZjHAyhbGnKyBs1NKPwMJK683BYfX90kOtkGNMWJ1/555NepufoRZo1cieCdMcgAlLKit5sckY3MjilU1h5Ff/ub2dtnzJm0MWVMRmLrp/6RNJgcYvhCWIqCOnXkMd6ewLrTx2GOZmu5FGQjqbMg9s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7804.namprd12.prod.outlook.com (2603:10b6:8:142::5) by
 CY8PR12MB7193.namprd12.prod.outlook.com (2603:10b6:930:5b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.18; Mon, 16 Dec 2024 13:44:49 +0000
Received: from DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290]) by DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290%7]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 13:44:49 +0000
Message-ID: <7fbcacfc-7ade-4ae5-8e2c-b2793a63c1e4@amd.com>
Date: Mon, 16 Dec 2024 19:14:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/amdgpu: Use device wedged event
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: airlied@gmail.com, simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 lina@asahilina.net, michal.wajdeczko@intel.com,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241212190909.28559-1-andrealmeid@igalia.com>
 <20241212190909.28559-2-andrealmeid@igalia.com>
 <d9f2583d-da79-4532-90fc-85028e977ceb@amd.com>
 <c7c498f0-2ee3-42f5-9b45-c87e52ffc3e4@igalia.com>
 <Z1xGe1X_XzB00J1Q@black.fi.intel.com>
 <ed83b0a1-62d1-48e5-ac7b-478be3043733@igalia.com>
 <28d7dcd8-ed3f-4e52-b7fa-c348a827085d@amd.com>
 <7c64746a-c1f6-46c6-a97f-cfd87e9ec3b7@amd.com>
 <5f7dd8ac-e8cc-4a40-b636-9917d82e27f5@igalia.com>
 <84b6dc5b-8c97-4c8d-8995-78cf88b883fc@amd.com>
 <8d6395fc-8143-4099-a9d6-b13d450d7fd7@igalia.com>
 <6028b434-2be7-453a-9be8-bf2e85c0756f@amd.com>
 <18343eaf-7eb3-481c-ad99-9e6fcd837c39@amd.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <18343eaf-7eb3-481c-ad99-9e6fcd837c39@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::21) To DS0PR12MB7804.namprd12.prod.outlook.com
 (2603:10b6:8:142::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7804:EE_|CY8PR12MB7193:EE_
X-MS-Office365-Filtering-Correlation-Id: 0727b5b7-86fe-4d33-d470-08dd1dd7cf26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHQ1S1VGYkZYUmFER1RuOTBrSlNDME5aQnRSd09zN3d3VlVIS0pSa0dGUjhZ?=
 =?utf-8?B?MTd3T0ZkZTk1WWYzVE52N09mWHhpTXVBMlBzb0Uwd1F1bzRXUm5XZXVSWHZq?=
 =?utf-8?B?L0crMncrSWUzSVI5eE9LTlhCM0d4MmpaNDRTZGV5eUpZWHlsd2g1OGlWM2g4?=
 =?utf-8?B?YjgwbWpmRDR2N2h0VDA4TG4xcVFzR0QwMm1QcEtQWTBxNzFTNlZqSHozZkJT?=
 =?utf-8?B?cEk1T3RUQ08vSGZrS3hxWUZHQ1lIdmhzcHhmMjV0cTJvaCtKaDhFdlZhVUFM?=
 =?utf-8?B?ZjBkV0dOMzU4cGtMcjR0NFNYNTZCd3ltNCtIaUpTSlJaQzdnL0FFUnFRS2dZ?=
 =?utf-8?B?dUMwdUROOXVTRGJUTnZ0Nlc5NVJ4QUlLNUEvcmxCRUhmVk1KcDBYRllsamFi?=
 =?utf-8?B?dmw1M3hVMGRnOU5ZU1J1M3BHTG5QRXBjMmVQNjlUM2ZtTFUwb0J0ZDhsSjJB?=
 =?utf-8?B?Umk3K3dzc0dQYjEycDBzcU9TeC83aW1HdkxUeC9wZnpyTUV6ODgxblRQTG12?=
 =?utf-8?B?RE83ejVNaS9yTksrWVU4S2xPOE5IN1drN1JIRHI4L3FZb2l4MTZzVURPTS82?=
 =?utf-8?B?cXZTSkIrZUFOSzg4WXRaQlhwWEVDQ1F1VHhGMUpGZzlCdWt6T29QUzVpL0lD?=
 =?utf-8?B?WFYvbDR1TzRFME93WVV5N3dIOWpZZkxwaFVsNmkyUDZ3aWZ4Y1R4QVlCVE5X?=
 =?utf-8?B?SFIzS0U1bnlPb0ZnZW9tWWtRRmhVdFpNVVM1bGNWRVNLUlFwbTh3endzN00x?=
 =?utf-8?B?UEpaWVFRRFJEd0xLVFlzUk80Z1FXb2piSkM3Yk5UWERrVTBtWjYyTFE3ZERZ?=
 =?utf-8?B?VENBUEdibDhPOE41bTc4Qi9xVWxVREYxVzZEVXR2VE1MVlR5U3FqanJrZk9j?=
 =?utf-8?B?ZWFXSnlab1ZRT1lRK2tjeXFWZnkwTEtCQ2RzOURVWFl1TGZ0RHFFOCtpRzlF?=
 =?utf-8?B?TG1pT3hVcDl4K1pRdzVtZUYrSlJPYWhNT3JFOVcvOXN6QzN0b2dkbDF6TDZD?=
 =?utf-8?B?TmxPWE9mTTlncWRwei9oL2cxd1pheG9GYmwzc0J6ZzVsemkzdElRTGtVSXJI?=
 =?utf-8?B?OFE5OCtOME11elZwekRuaXhHMHc2cnFZUEk5T3NNV2FhRDk0cmk2SEora3Q3?=
 =?utf-8?B?ZnZqL0c5TGQ3d0ZWT2tWZDMzenBFM0hMQUgvNGU0VjhnM3ZzODkvTmJOU3Rq?=
 =?utf-8?B?WlJSMUh5YTh6WkVDekhkYkhBWXA1SU1SZFdZdHRNY2k3bzFuZ3lsREEvMm9n?=
 =?utf-8?B?am5JK3Rsd1RxZFp6aWk3a1pUOHQyRFJDb2ZzUXN4RGNVNis1RjdlUGR3QUw4?=
 =?utf-8?B?L2R3QzdjbSs2WStMZFJTWXkrVXY0UzMzZEFkdVdMaUltSkhIS1lDQzBySEx0?=
 =?utf-8?B?Q0JJcUozNHVZb3RkR0U2VGV5TE82ZFR6OTdjd25CNUlzb0F6RWxUQ3FTbWdV?=
 =?utf-8?B?cG1qRkVPNHZzS1NQOWxOR2RtbTNpZUFPNEhpR2JQYUVRQ0dhbTFZRnA2YzFh?=
 =?utf-8?B?M0pqTGdhYXJ5VGF3QjkzV29mY3ZuREZkNEhXQlNDU3JNbXk2b0lSNmtMWVhO?=
 =?utf-8?B?bjJhZUszYVRQSXRuQjhKNGFIVkNGaHBJRHpkZjlFWWg1TjN1VlExaGdZWDE5?=
 =?utf-8?B?clRleEhqbnJQTVhjLzlPS2ZSVE9rM0lKdDRmOW5ucjdFY0RaT2o1WUU2dlZi?=
 =?utf-8?B?QWdhNWxXcHVvR3YwTG1UY1JDQnBmZHd4bUJRT3dKM1ZoZlhBekg0NzJoQzBU?=
 =?utf-8?B?ZXIvR3R1ZkVpZDJSUUI3Q2hkbDFsNkdHWTc2RmxyTXAyMjVVNStTdndFUlI3?=
 =?utf-8?B?K1FiQXZwUjRXWEV2WmIzVjhKTlZCd1VKSWVFZktENWYvSUszMW9OTGdaWHMv?=
 =?utf-8?Q?NinfuwtqLvHVj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7804.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGVJalAwcTZtWlpsZnJQVzN0TGxiaCswd0RMZU0xK1BkaUNJMzllVXh3b3Vh?=
 =?utf-8?B?aUhtZFIvZXpZMVJEK20vcHVWL2dTdTdMLzNJYXl6SExTUWxSai95UzdjVUwx?=
 =?utf-8?B?LzAwUTVBWTdaeGRIdmVmdUJZeHpJY2xSWlB0Vmtpd0hLM04zQzY3ODRkb0p5?=
 =?utf-8?B?YkNndE1rRmJRdkJFNkNHT0RheGlFaWhKYkE5enRpeHFNRFFYQUgvT20rM0Ji?=
 =?utf-8?B?MmVSVS9pUzI2QWh3ZEoyTnNkdmE5TWVXM2tWRGRRaGxtWGlQRCtwc01uNndB?=
 =?utf-8?B?L0lYV3lHeCtmaWl2Mko4ZE04dUVraGZXTzNJM0VWVGQwN3ZVcUNHMWszKys2?=
 =?utf-8?B?M1NpN1dlV2E5dHAzN0ZJZCtLNkN6OWFCS3BvdGd6QVBTZHJRZnp4RE91R3Ft?=
 =?utf-8?B?ME40Z2dUcHdMZzlxOXRWRFRxemd4T2EwVk5IQ3IvMFRxbG5RUzhxM2Ezcmxm?=
 =?utf-8?B?SXFBdk9aMVN5eUpGU3NLWVIyWmxkUGIyUUxzY3dEMEdNdkdabHBQUFJQZmJH?=
 =?utf-8?B?S1kwSjVXK3h1aG4vaE5kZ3lFMHorV0wxN1MvTitJQ1M2VXI2eEM2T2tjNThR?=
 =?utf-8?B?UE0yTEhVVkxxaEdiUjhqOUdaOXFwQWM0ZHZPdklUMkJGQjZSMGJlSWg1MTEx?=
 =?utf-8?B?KzVKWG42WFEyZ0FQS0FCUGw1bUUySFhKWHpzVDUvK1lTQ3ZwcXRyK2JVS29Y?=
 =?utf-8?B?WlBYd1EzdFJoQ2l3OVVFaXFQYTdQb280dnk5YTY4MkY4T01FdDYyYVZPcmpU?=
 =?utf-8?B?WnBFSUlJSE1HbDRiN1BCSEkzdTRZTjcwV29oTGVJcEMrczVZMU55bFRYTGpD?=
 =?utf-8?B?emFDTmRwZUxEbTJudWw5MnJWTWNYcjZIejhGNXExc0k5bE5FcVJoVVNFME9a?=
 =?utf-8?B?ckcrNzB1K056QkV5ei9XREtmUzB3cW1JRVFmS3JWdjNIOTdOMWpxS21SOHRF?=
 =?utf-8?B?MjZ1TXpEaVNESzZtVWpLemd1QmtZOFFPS3FMelNWdDdNUDJ4K05EVjBtNHBE?=
 =?utf-8?B?bStUMzhzNURUeC9lUEJRdzZIWUw5RlA0S2JPWUYwVTZjZDdGdURJK3NkbVpB?=
 =?utf-8?B?VXZvVVk3QWRnRGhtOUdXanpySDBYaFVBbkMrampXK1puK0pWVVRNS3hzaE91?=
 =?utf-8?B?Z1lSQkNvOFJiRFRUcFMyQzJmOUVLaXNoVGJEMk5XNzVSbklSTjhTZzZiYzZH?=
 =?utf-8?B?a2dPYUsyMG50Rnd4UVhCeGFKT1l4Nk5TajJLdFMwVllNUXJsUG5JV3AwOGlK?=
 =?utf-8?B?djNOa0tPcmRESEY1bGZaakUxYzVDend1Z1FkS1U5eUE3aDdwRVZvaC9FUjhI?=
 =?utf-8?B?RFdwU3o3cGNQMUtJNzl2SmFGUDVoeSs0VXNGOFJvbW95NEc3LzFJUWdTWlZW?=
 =?utf-8?B?MmpWOURicXZId3dKZ3RtUXlCVUptV2VoblQwNjljUER2a2txdCswTEZJQXlz?=
 =?utf-8?B?Q25MNGMwZ1pFbjRZZzFNNUZ0WlZyRDRkNVByYWRyd1U5Q1RLSGp1b0lxeGho?=
 =?utf-8?B?dVppYzA5UnMvWWJtSVdUMnV0eGo1WlByQW9JaFZmbmE3ODNzQUcwb05Qeko4?=
 =?utf-8?B?RE1lZjV4cFR2aGo0dVppU1M3V1FxVW5ZNEFJN3ZXdWVaQURtTlNQN3VZTXZz?=
 =?utf-8?B?QzQrZVcyelFrdlJhL2FpeDFPYjR6d2k2eG8zVENPUFoxVmo0eDl4NVVsZ0Nl?=
 =?utf-8?B?TTVXOEpwS2FpeUFIY3dCcmtTL3djU3FIQWJkenYyU1pTcVlPazhSeVNCckZL?=
 =?utf-8?B?cFRzb1J4MWxVNEVVbnppN25qU1hQL3habVc1NUdvQzVuNXZmenRVZUQwbVBU?=
 =?utf-8?B?d1pHOHhmQ1RxUGlkNWtoVEVtbDJKK2Joc01QYVpkZnNKTmJueittcjZHaTVF?=
 =?utf-8?B?dFc1NHFQWmR5VWJ5cXRjTkhzUm9LazYxYmE5SjJhQlhtb2tmVW1NT2JNNU9Y?=
 =?utf-8?B?dWxxQ2swUnRZRXZhWndLZWZ0MFdOL1RzYjRneTE5Z3ZXVXBjREZuQVgxWmNk?=
 =?utf-8?B?TnJpa3dpOEczZUtGOERwLytTZ2lZVk9HOExhZ3FIWWg2Wld5dzU5Q1NqU1lU?=
 =?utf-8?B?TFZkNGZZNjZBRVozTmNjL0U4STdIYVFrNUgyNTJzTzQydkcyWVpScUc0T2Fw?=
 =?utf-8?Q?zYshLOTyeq1LeFG+quHV32Qwf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0727b5b7-86fe-4d33-d470-08dd1dd7cf26
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 13:44:49.0727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PZg+rzXHdext1ESfSlJl2YeiHw6eGy/yicifr8xlY3lGr1HRTdaE81EKbKyh+7P+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7193
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



On 12/16/2024 7:09 PM, Christian König wrote:
> Am 16.12.24 um 14:36 schrieb Lazar, Lijo:
>>>>>> I had asked earlier about the utility of this one here. If this is just
>>>>>> to inform userspace that driver has done a reset and recovered, it
>>>>>> would
>>>>>> need some additional context also. We have a mechanism in KFD which
>>>>>> sends the context in which a reset has to be done. Currently, that's
>>>>>> restricted to compute applications, but if this is in a similar
>>>>>> line, we
>>>>>> would like to pass some additional info like job timeout, RAS error
>>>>>> etc.
>>>>>>
>>>>> DRM_WEDGE_RECOVERY_NONE is to inform userspace that driver has done a
>>>>> reset and recovered, but additional data about like which job
>>>>> timeout, RAS error and such belong to devcoredump I guess, where all
>>>>> data is gathered and collected later.
>>>> I think somebody else mentioned it as well that the source of the
>>>> issue, e.g. the PID of the submitting process would be helpful as well
>>>> for supervising daemons which need to restart processes when they
>>>> caused some issue.
>>>>
>>> It was me :) we have a use case that we would need the PID for the
>>> daemon indeed, but the daemon doesn't need to know what's the RAS error
>>> or the job name that timeouted, there's no immediate action to be taken
>>> with this information, contrary to the PID that we need to know.
>>>
>> Regarding devcoredump - it's not done every time. For ex: RAS errors
>> have a different way to identify the source of error, hence we don't
>> need a coredump in such cases.
>>
>> The intention is only to let the user know the reason for reset at a
>> high level, and probably add more things later like the engines or
>> queues that have reset etc.
> 
> Well what is the use case for that? That doesn't looks valuable to me.

It's mostly for in-band telemetry reporting through tools like amd-smi -
 more for admin purpose rather than any debug.

Thanks,
Lijo

> 
> RAS errors should generally be reported to the application who issued
> the submission.
> 
> As a system wide event they are only useful in things like logfiles I think.
> 
> Regards,
> Christian.
> 
>> Thanks,
>> Lijo
>>
>>>> We just postponed adding that till later.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>> Thanks,
>>>>>> Lijo
>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
> 

