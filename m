Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNBpInA6hmmcLAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 20:01:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ABA1025A1
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 20:01:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0205110E8D6;
	Fri,  6 Feb 2026 19:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gEA+ng11";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012046.outbound.protection.outlook.com [52.101.48.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0481710E8CF;
 Fri,  6 Feb 2026 19:00:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e95Bm9pInzyvFZHLeEKX1vd7jDF87xByslPwktYBMgFFfNH5a0H8JxAvpfYfrrHL0nIAQOadERaG4I1cP0GJF7Oy51wqAfTaPuF8GQMZTkDOwuvEvbckc/PmfDu+fKjmq95/q+aBkri6HBnUHKr7HDseCX/ka848VL7RqsurF1rwC1ia28n06+kWQnU4w8zJhCP4T7LHmwHS60QqBUcKImxX8gafRFZIthprcmTJROh25GX3eesFXMejQCMhlNkSkzGxBtXfyQ/q+jA4XeqJVKfQk89qNWFeXWsgUA2zE4ulF1pjsfxcXopPAZKBAI07k0cAKNzARRq6mZS8RQYkhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTeKPg6saWXoY26Z9x632suURK8mxksbQ/AJGYCAKC8=;
 b=K70PU/y7hV/Rm4VurDXfzedsqi/1ACbJaXPMACUvobYZHSRGvCZaa1M6bd9aGC/L0ZAlkuIfvNahU/yAyTEcIUM+jMAdNu2CvL7zB36f/goV0VOf0B0zxLx72h5OBScZ1m/1/+iHqB6HHClJCQku4V51AC8R1xZS3r3gnfMThAwrvbv7yw0ngk5SOI3+5snKYdLVnJnCCa4DnLwHGiaaExq2c16mDDOwTLAOHSXFW6lhaLgOLKzxJu403IoXgZYseQfPoYh9xZULwYM4fE33fQYlOs0vZqOkTmVYz7VzQke0WJjVG9yfjW6M4Hc+B/EJ8e4YfH50VaR2Q4Ab95y4xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTeKPg6saWXoY26Z9x632suURK8mxksbQ/AJGYCAKC8=;
 b=gEA+ng113maCGaqUSioMM16lQSrOJuSwFYOmEaiI0WOJQxCTiSDJOHEmsM8LYx2BE755hn+Fcc7yqsrIZIf3n4hGjHmRh71NhaOD8mT7vLejNlKiK0+fZ8JM/tmAgP/x2Hvy7tF9iWZ/J8ZRU6lHBawyOf+wQNBCaEIU/lNuLAk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 by CH3PR12MB7714.namprd12.prod.outlook.com (2603:10b6:610:14e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 19:00:54 +0000
Received: from BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe]) by BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 19:00:54 +0000
Message-ID: <14151480-13e2-49b4-838c-7c784d293fb3@amd.com>
Date: Fri, 6 Feb 2026 14:00:17 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/19] drm/amd: VRR fixes, HDMI Gaming Features
To: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
 alexander.deucher@amd.com, sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 siqueira@igalia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org,
 admin@ptr1337.dev
References: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::9) To BL1PR12MB5126.namprd12.prod.outlook.com
 (2603:10b6:208:312::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:EE_|CH3PR12MB7714:EE_
X-MS-Office365-Filtering-Correlation-Id: c945594a-d99c-444c-5a12-08de65b20d8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1FGWXpWQ0xGMVdOSUtmRHM5N0htNE9tclA2Sm5kZjRMeEVHak96TjJmRERL?=
 =?utf-8?B?TWZPeG01NUJIRzJqaE9HQjF4WFcvWUVIVnloWnJVcnMrOTB2YkVWWDN4VmFP?=
 =?utf-8?B?L2xzQ2RybmhBUk9XL1luMVljS1FsZkhXc1Y3cUZjZkg4cXVnUmtIRDhTaVE0?=
 =?utf-8?B?VXhJbVRPVDFjTmNEUmtUZkVaT1M5WDU3TnpKNmJDdk5xSlNGbCtPQjBGdi9L?=
 =?utf-8?B?Y0xLZGFXUFo1K3NjTll4eksxSjgwTHoxTVM3VUxTR29uYVo5WW5DTStCYzB5?=
 =?utf-8?B?UnV1MlZhTHBiVC9mWFlmRVlsSEVvbGpqMFFpejh6L0N5NnJ1bnc4SERlRXdH?=
 =?utf-8?B?UFpIRG8rN0RIZGRFTXR0ZFI0a3lXcDRQbzcxdklpQXNONzhvQkpmcEVTYTlX?=
 =?utf-8?B?YjdLTG5wbnVVM2JHQ2FGZ1BCTUttbUZCKzlBUUZGQnhMZUpmbWlzaThCNmd1?=
 =?utf-8?B?b3loRFdvUWNTd3FMZktOUUJRcG1MNEdmTmlKeWc3a3lYeHJVWUZSWE1CR2tn?=
 =?utf-8?B?Mk9LZVEybTk0K3BHRWpMMUtRZERiVmp6OHhwcXpDUVNqT1c5STNocW85djZS?=
 =?utf-8?B?dlphY0Z4VU1yM25MdWZ3M0ViZGpUS2hnb2JTRnJvcGRkck9hbnhXYXhvK0w5?=
 =?utf-8?B?M1ZDNG4weFRXNmV5bnFqMncvRzdJRXAraW9VTEcwSWZwMGZjcG94KzVEcDlD?=
 =?utf-8?B?WWtGREswZ2Zpa0ZCYlVxOXM3YmdMN3dCN1V0ZGZNcnN0MDd5UzVFUFYvRmRS?=
 =?utf-8?B?NjRHM0t3QVF0Q0lJelEwbFFMK3pSUG1RN2RnNTVaOEF3NzhtMTNpdktJbWZm?=
 =?utf-8?B?VjRGbjl5ZjhUN1lZdE41S1pvRWJyQ1ZOcWFnenp4VzJsbFdWeU5lRWdPcXZy?=
 =?utf-8?B?Yk1kZ0o2azRWdG96Tkd0REw0VFlzZmRZeFlieDJ6cThBWGlCaW4vRXE1ci85?=
 =?utf-8?B?MUhTaWFWcGlPdnlsQWZWMnBwL3VBN2hXSjloU3pkNkFHV3h2Vmhpc3NSSEJj?=
 =?utf-8?B?VDZWeWtBZWY3TWhLYVJLNzJQM0MzYkJSVlRSNDZrT2dNVWFmMVdMTEtRdnIr?=
 =?utf-8?B?RVhDWEpTbzVMZ1F5TFNWaE83N3hmU2ZTNnFhNUJYOG9zZ2RySnFLRkx1ZXhu?=
 =?utf-8?B?N1JiNENpSmRsMHFzU3psMkNmb0p2eDNHWThLRjdxejdtM1p1amNKN3JER1Vy?=
 =?utf-8?B?MjFJSEpJYVd1ak1JUVRhcm5XQUxtVFFFc1NzUWx3Vm5qdUtId3RXVnlNTEQ4?=
 =?utf-8?B?aGxjRkVmTGh4WGdUMlhMdmEyaHRocm8yTkw4NTN4eGJrNmxWYXJURWd1MUZL?=
 =?utf-8?B?R2FsSlp6TUxOd1E2QURRcGJNdTJ3dGZ6SHB0U0pFQkVqeE1EM2czY0FlQUhL?=
 =?utf-8?B?SmNjaE5pRmQrMCtTWUVKUC92N0RwcVRML3hDV3c3VjdOdGFMRnZBREJlYmdZ?=
 =?utf-8?B?R0hnL3c2eHF0Ymgzb0d4a2JWbyt0blY2eDVCRE9DVFBoOEh2UExkbWlzSms5?=
 =?utf-8?B?OTZ4U2tMU1l1NlBvbkVOdmZnNjV2V3M2UE5hMUUvc1RmS3crNjZHZ1JMdUVh?=
 =?utf-8?B?ZHlCQ0hBWnR1ZjhvWkFRMG5aY2NOdDdMdjZhaERFbGpOdERXNUtnWEFsMGpx?=
 =?utf-8?B?d0pwZFJBK3JxSDNybHRXY2VLTWpaRG9wUkxSd09KdDM3cUF6MzZDc0FBaXFD?=
 =?utf-8?B?Vm4zS1I1b0hick4wYnN2bDVhMFk4THhRRDNhdHB4V2VqYjBESmVjVzdqa1JG?=
 =?utf-8?B?SWRIbndkNHIzVG56UDJsbm9WV2RNRzhabFlUY3pSdXc5NUNjM21KaFFrNGQ0?=
 =?utf-8?B?K1JTUHllMVEyVmZPVktKc0pVUTBFdTBjNEEyR2dLVlU3ZHN1SEhLN2w4Y1My?=
 =?utf-8?B?V1IzNklYcEVxY085bGR3RlVqWVR1NWM3MzBscDhOQ0ljZ295eEVVS042SWo4?=
 =?utf-8?B?c0w1MHJjWlFsbm0xOU9RUkRPRHhDa2FqRXBkUktJa25lTjVVTG1mcGFJUG9y?=
 =?utf-8?B?R24xb0xzRUE3Z0FKZjZkMXpiYVBPV1RoSDIrZ3RiWFNjUXprc3pHaXBOV0Zk?=
 =?utf-8?B?TzR6Z3V1OHhRNm03d2FJNFBOSjRHZHJyTDZIalJHdUZGcS8yOE5GcVEzYVpV?=
 =?utf-8?Q?61F6CHlUvFuEny6TiLSgE6eck?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5126.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm5mK3dKaEdDNEYybkk2RncxcjBwcnJtQllxY2dOTzNCUTg2dW1zeE5Fcy9l?=
 =?utf-8?B?aXgvV1F6emh1eFBSd0IyUlZUdVJKSk1MUmxVWHlVWnpaOVVVc3VrVVdQVFVR?=
 =?utf-8?B?MlJqUXJkL1hDdWZsdVlpemVuNXh0NWxEV3dIYml3V1NzS1NHazZXdXpxZE0y?=
 =?utf-8?B?ZjFJUktFVkdhekRMR3ZieEZBdUhVNTBOV2lJWmY1S2huR0t1c2JYQ3BGNTl2?=
 =?utf-8?B?TWJGMHl1TkszOWVUd04zeUFGVWpLUVU3eEwvVG9GKytTRE4rT0FJb2RXdUcx?=
 =?utf-8?B?OXFFMmFPN1hjQys3cDJMOTdoSFVwd3lhK1BkUHl4ZlNtMDdGOVdzRjZkcVo0?=
 =?utf-8?B?SzR5WFkyVXl4NE9rNTlraXc5NTNPdkZCNFRaejI1aTVyenRkR0ozYklpQWNW?=
 =?utf-8?B?MitTcmhxdnEyNWVvYldvTUhCYjErWUpoZXhHMWVDZTFDSUxIUVlnc0w1U3h4?=
 =?utf-8?B?M2FhMGxwbjh2OUQxVkNubUl6UjN2eXphTElpRG5jZUZxSU1lN1REWHU1R0g1?=
 =?utf-8?B?STJFbmhGTjhGYllhM09NUkVUKzNuaXlIbGZvTVJtT2U4Z3hUYVgzNWtmcjNC?=
 =?utf-8?B?K2hZK2pqeHdjNnBRSmZBU0xUVnNHcTVNUXZZSDZlWW9xV1JibXpXeVpXeTJm?=
 =?utf-8?B?R1pyZEVFNGc0cVlDTFl5N0EzamdVUUVJTVVxbDRuZW1PSUlISklMWTl5SXdO?=
 =?utf-8?B?aldlRFBXdjhEcTlFMkFhUWRCY3BhWWIxZU9tYVRleVV1VlRGNkZ5YTM5VmVZ?=
 =?utf-8?B?R0xNSjhxcEZ4b2tvRnJDZHJtbWlZQytyc2gxR0tHdE9qWFdXc2QwTk1pbG5v?=
 =?utf-8?B?blNkTFRJMU95OU9YL2E2L2Q2UlduUnhKdytVVFdWSnd1YVRSSXdWeFVhdkFp?=
 =?utf-8?B?aDR6OHlrc0Z2U08rQldsRXJ2SmxnUEtla09HSkJjNFprVFBVKy93UkdPQnBY?=
 =?utf-8?B?d0ZEK0lxbTdWYWlkaE5XNFh2cklHMjIrQTJvWE4wbkpTRzB0cCtoaWRJQjE0?=
 =?utf-8?B?YzRIYnFKcCtlVlJHWUl6MlBqWER6V01QRnZwa1loTEt1ZUkweTBNVW1qeEtW?=
 =?utf-8?B?NWpLaEpubU9OSDNYVmN4TkhRTXpsbE1jdy9RcWExNVR6RmhaQjVob0hLaXRw?=
 =?utf-8?B?bzJKbExiY1BZRDdrYUdSYjM3eE03T2o5Wmc0Tkc2WlUxc0hXVFFScSt1ZjJN?=
 =?utf-8?B?emRaNFd3YUMzOHg4VTNiOHQ2ZGpJWHU4K1FWSmduVjlvUXlwUmsvNlN0MzJ2?=
 =?utf-8?B?S1FDcnlTZlpCK0dYQ3hDYnpyemJsd3gxN0c0dlg5QnhwYmpvSjJjSG1nSVZW?=
 =?utf-8?B?aStoYjdvUXNSV1F6RVJ3ZHlyQVFJRTNDaGcxelk0OEQ1Qi9CcHRsQnVIU1Zt?=
 =?utf-8?B?anhTMzVOL0M2YW9yUXF5aVV2aVhzSGRaeEQwbFpxeXBNYndFNFVBUE9YSmJm?=
 =?utf-8?B?eXJBTDc2Rjh4b0tSbytWdVJUZnh4U29TMGYwUmlSTHFkRGhSZjlvQXpTWUhW?=
 =?utf-8?B?bWlGUTIwOHVDRVJZTkhVRm42SFJ4bVNmOWtMRXRCR1V4RmcyWVE4V2Y2MnhZ?=
 =?utf-8?B?S0xvM2NDL3pvTWNtR0NDbEc4aVdUZklQcXdWY0s4MlhRTzBZMkFaYlp3cWs4?=
 =?utf-8?B?NlpJZGlrZHFDaUlxY3BFTkZJVlRXWUpxKzJLS3ozbjRjdjlhb1Jnd1o4MEFR?=
 =?utf-8?B?emZqT3lDM2xBRjhjd1RmYkZ0azQ5VFpDZXZtekVCTnBJYTVmZmVXcmdZcXBP?=
 =?utf-8?B?ajNNaU1QemlsWC9DVTlxMnNTdnZtSXN3RXVsOUN2MDNucHhwWHk5c3lJSm5m?=
 =?utf-8?B?YjlyNHQwREVyWDlLcVovditTQlNuWmJ1RE9VbXhnTG5PK25ML09hV1BQaFMz?=
 =?utf-8?B?bGI0Q0lRYXcvMldJTjVURVNpRmFBVVhMNFJ5TmlNT0E0cUpYbjNGUHZiMEJp?=
 =?utf-8?B?OWhHbEF3eG1rU1B6cUowSnNIZnYwMXVyT1dRMERyM29Ca2Jyd3dEUFR5OU1Y?=
 =?utf-8?B?Q05tRW1pMEkzZ1FOTUR1RnNETGZZOUEzalp3WmRIQk5KM2JwZEtnUUxsT3Yr?=
 =?utf-8?B?V3RrM2ZsY3RSUnZ6REhabTZYRHU0cTQzd0c4M3M2bWp6MVlKQ3J2a00vMVBK?=
 =?utf-8?B?Ky9WU0gyUzI1bW5JSTJtaitLdktzZUF0dXdyT2FwMmRObmJqTzNRWHdzZmZU?=
 =?utf-8?B?bTdRcDMrOE0wMGZQaXN1Mm16dStVbXZBRHU2NmYyeTNhSnc1bmxaV1hnRHEy?=
 =?utf-8?B?anV6VlFLK1R0Z28yM0duWUkzUmROMG82aFdhaEdIbzQya3Z3d3o3aTNFR2ZF?=
 =?utf-8?B?ZWQxOUxjRDZtQUhwbHA0TlAzWDRaTVM3YkxQcngwM29sTU42eVVPQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c945594a-d99c-444c-5a12-08de65b20d8e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5126.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 19:00:54.0247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3n0g39mORoJK2MYPKilwafUMLNHXtEdxwro8B9jzdFcb/cX/sF0V7FCNudDCvFy79h3eF1Q6yFWplCzMomfMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7714
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[harry.wentland@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org,ptr1337.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 28ABA1025A1
X-Rspamd-Action: no action



On 2026-02-03 13:56, Tomasz Pakuła wrote:
> This patch series tackles a few things:
> - Fixes VRR not detected if monitor uses GTF flag for ranges
>   instead of Range Limits Only
> - Detects if AMD vsdb carries a wider VRR range and uses it instead
> - DP->HDMI PCON changes which includes a module property to override
>   PCON ID check
> - Parses HDMI gaming features in generic drm
> - Reintroduces proper HF-VSIF and VTEM info packets
> - Adds support for Auto Low Latency Mode
> - Adds support for HDMI VRR
> 
> VRR range fixes are simple and fix VRR support for many monitors. They
> close about 5 issues on the amdgpu issue tracker.
> 
> Adaptive Sync over PCON is only available as FreeSync over HDMI. TVs which
> do not support FreeSync, do not have working VRR with DP -> HDMI 2.1
> adapters even though adapters will take care of HDMI VRR info packets.
> 
> I myself validated these changes with my Samsung S95B + Bernhard validated
> on LG C4 + FreeSync-less Sony Bravia 8. I used Alienware AW3423DWF that
> only has HDMI 2.0 to check that FreeSync still triggers properly for
> "older" hardware,
> 
> For missing VRRmax or VRRmax == 0, the upper boundary is the currently
> selected video mode refresh rate. I wasn't sure how best to implement it
> but ended up on a great solution. We first check if maybe there is a VRR
> range in AMD vsdb. If not, rely on limitation of base refresh rate in
> VTEM vsif.
> 
> More history on previous shape of HF-VSIF and VTEM in their respective
> patches but the info packets were previously included in the driver code.
> HF-VSIF was improperly handled and VTEM doesn't seem to have been plumbed
> as it had no use before. I recoded these and this code should be much
> easier to understand and maintain.
> 
> ALLM support uses the info from EDID to determine if ALLM is supported by
> sink and if that's the case, always signals for ALLM to be enabled. In PC
> use, be it for gaming, desktop use, work etc. we always want the lowest
> latency and less processing + possibly higher available refresh rates when
> gaming mode is turned on.
> 
> HDMI VRR support relies on sending VTEM info packet in place of FreeSync
> info packets. Though VTEM has it's own place in the info packet pipeline,
> I didn't touch it as it already replaces FreeSync info packets. If there's
> a need to change this, please let me know for v2.
> 
> Both features were tested and work just like they were intended to. Gaming
> mode is automatically triggered and HDMI VRR is used in place of FreeSync
> (if available). This HDMI VRR preference actually fixes VRR-induced
> flickering on many TVs (S95B in my case) with somehow subpar
> FreeSync implementation.
> 
> I still think it's better to not force users to search for solutions
> manually especially since it seems like DP and eDP don't save info about
> FreeSync version and completely rely on basic VRR support.
> This would then be mirrored.
> 
> There's still an issue with some TVs behaving like a mode change is
> happening when VRR is triggered and I'd like to maybe tackle this too. When
> using HDMI through PCON, VRR is always active, like it's in
> VRR_STATE_ACTIVE_FIXED mode. This makes my TV much nicer to use and
> replication this behavior would be worthwhile IMO.
> 
> Everything in this patch series has been based on already public
> code/knowledge or trying things out until they work/break.
> 

Thanks for your thorough patch series. Really appreciate it.

I left comments on a few patches.

Patches 1, 3, 4, 6, 7, 9, 10, 12, 13, and 15 are
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

I can't currently comment on patches 8, 11, 14, 17, 18.

Harry

> This patch series supersedes previous patches/series:
> https://lore.kernel.org/amd-gfx/20251209231107.1968472-1-tomasz.pakula.oficjalny@gmail.com/
> https://lore.kernel.org/amd-gfx/20260113214104.146856-1-tomasz.pakula.oficjalny@gmail.com/
> https://lore.kernel.org/amd-gfx/20260113183540.86266-1-tomasz.pakula.oficjalny@gmail.com/
> 
> Built on top of amd-staging-drm-next
> 
> Changes in v2:
> - Updated BRR max value to 1023 after testing one by one. This should've
>   been obvious since 1023 is the max value for a 10-bit field
> - Fixed some comments, to silence "not a kernel doc" warning
> - Considered ALLM comments from Michel Dänzer, Daniel Stone and
>   Jani Nikula. ALLM is now triggered if either VRR is active or Content
>   Type Hint is set to "Game". Content type hint is already supported by
>   amdgpu and fully plumbed.
> - Added module parameter for controlling ALLM trigger behavior. Now it can
>   be configured to never trigger ALLM, trigger with VRR/Game (default) or
>   be always forced on.
> - Added HDMI VRR desktop mode module parameter, which is on by default.
>   This mimics how FreeSync is handeled on Windows and this fixes a lot of
>   issues with unwanted screen blanking and glitches around entering/exiting
>   VRR mode.
> - Moved hdmi vic mode check to one central function to avoid checking for
>   3D and ALLM in different places which could sometimes break the logic for
>   translating HDMI VIC modes into CTA vic modes (when such translation 
>   is needed).
>   
> Changes in v3:
> - Fixed wonky English
> - Less struct traversal in helper functions
> - Fixed possible NULL pointer dereference while checking if ALLM support is
>   indicated in edid_caps of local_sink
> - Fixed ALLM bit assignment overriding 3D bit data in HF-VSIF
> - Fixed assignment of the upper 2 bits of BRR in VTEM
> 
> Tomasz Pakuła (19):
>   drm/amd/display: Return if DisplayID not found in parse_amd_vsdb()
>   drm/amd/display: Refactor amdgpu_dm_update_freesync_caps()
>   drm/amd/display: Check for VRR range in CEA AMD vsdb
>   drm/amd/display: Use bigger VRR range if found in AMD vsdb
>   drm/amd/display: Refactor PCON VRR compatibility check
>   drm/amd/display: Add PCON VRR ID check override
>   drm/amd/display: Add CH7218 PCON ID
>   drm/edid: Parse more info from HDMI Forum vsdb
>   drm/amd/display: Rename PCON adaptive sync types
>   drm/amd/display: Enable HDMI VRR over PCON
>   drm/amd/display: Support HDMI VRRmax=0
>   drm/amd/display: Build HDMI vsif in correct slot
>   drm/amd/display: Save HDMI gaming info to edid caps
>   drm/amd/display: Restore ALLM support in HDMI vsif
>   drm/amd/display: Trigger ALLM if it's available
>   drm/amd/display: Add parameter to control ALLM behavior
>   drm/amd/display: Reintroduce VTEM info frame
>   drm/amd/display: Enable HDMI VRR
>   drm/amd/display: Add HDMI VRR desktop mode
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  27 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 207 ++++++++---
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  49 ++-
>  .../gpu/drm/amd/display/dc/core/dc_resource.c |   5 +-
>  drivers/gpu/drm/amd/display/dc/dc.h           |   1 +
>  drivers/gpu/drm/amd/display/dc/dc_types.h     |   7 +-
>  drivers/gpu/drm/amd/display/dc/dm_helpers.h   |   2 +-
>  .../amd/display/include/ddc_service_types.h   |   1 +
>  .../amd/display/modules/freesync/freesync.c   |   4 +
>  .../amd/display/modules/inc/mod_info_packet.h |  18 +-
>  .../display/modules/info_packet/info_packet.c | 342 ++++++++++++------
>  drivers/gpu/drm/amd/include/amd_shared.h      |   6 +
>  drivers/gpu/drm/drm_edid.c                    |  41 ++-
>  include/drm/drm_connector.h                   |  47 +++
>  15 files changed, 559 insertions(+), 200 deletions(-)
> 

