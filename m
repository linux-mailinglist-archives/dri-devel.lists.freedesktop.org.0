Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAFgITjDnGnJKAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 22:14:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 358B017D6D8
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 22:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3BD10E273;
	Mon, 23 Feb 2026 21:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cVXsvDaS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011033.outbound.protection.outlook.com [52.101.52.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11DE10E10D;
 Mon, 23 Feb 2026 21:14:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sAdFn1RhwQ9oV3rFUC5jnPwKZ8ayu8UE0BgxTYE3FpxhYxQGca/AMfd+XVnMsHu2g7iQdsINRh8yoXrU+HHHWQSh4uo30tNF5A5VoxUGRA3UhArrZTUuIGGaw2kwhiD3KXMJhvShRG+c6fMNqDGPJiNjhEuZ9pNzwYxHXxElXfsGFxU45Hu8vvJmbcNCsIOVrL0MGHrkJ+zeUx8RascR1+xJV84IQ5G4mhyPsENMokPtmIizvNIytripmmirPNwt59TjMw2qZzNDxNBjXhGExAoQ5CI8FVU31bGtVrPma5m3ry3TVIcfvfCyoByW5KCxeyGZwosMEITsMIjQScO3Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziCnCnad/2U0jJbatk8l5s9kM3psNGZ1xmghRM9H6RU=;
 b=rBm+jkkJ5WcLbGOM4QPtyPQBqhDjnG+ONX7WbzT5q8lzcUt2Zv7Ub0T2ZpNOhcDAiYOwAQiXNfbvmHx+V1pgLo3sticwGVCVCuACudaej8CHCwrmJ/XH+yrB/G1Hooujr7Bl6mE+oVB+aoEznkOxGBIRTv5F2DkfGRllWw+ByQLejha4JPurJEJtTm+FqkEdI4zvDwyaubKDxD0OBTiKcjSNr56g1NC3TAqFncaCl67kdpIMCK0RPym4PGJB6bCQTAaknXeRWA42LdluglQ31Dl/yoGrHAQpba1oHCmMGwwIMNK9PnzAohDmfqG99bHjjGpVwf3/gnme86Ws/kfRXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziCnCnad/2U0jJbatk8l5s9kM3psNGZ1xmghRM9H6RU=;
 b=cVXsvDaS6+quaj2J2jqrGk/l3BcvzEtK5DNBZposF6EbvDXWVMAFQ4OzklWZM1RfZo+dIC/nhONsYK9XJZi42BSQ+gJ/siRN0Ml1TD+P/ReaNfMP2pTr7JHC97PWe1sz+A8ruTMRNsc37G5i252v8Qm4fb2hx+U4/gjuCxmXj+M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 by BL1PR12MB5922.namprd12.prod.outlook.com (2603:10b6:208:399::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 21:14:23 +0000
Received: from BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe]) by BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 21:14:23 +0000
Message-ID: <f670f350-7230-4bbc-9443-a6307429d7b3@amd.com>
Date: Mon, 23 Feb 2026 16:14:06 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/colorop: Keep colorop state consistent across
 atomic commits
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: contact@emersion.fr, alex.hung@amd.com, daniels@collabora.com,
 mwen@igalia.com, sebastian.wick@redhat.com, uma.shankar@intel.com,
 ville.syrjala@linux.intel.com, maarten.lankhorst@linux.intel.com,
 jani.nikula@intel.com, louis.chauvet@bootlin.com, stable@vger.kernel.org
References: <20260218065713.326417-1-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20260218065713.326417-1-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::29) To BL1PR12MB5126.namprd12.prod.outlook.com
 (2603:10b6:208:312::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:EE_|BL1PR12MB5922:EE_
X-MS-Office365-Filtering-Correlation-Id: 93aa6ede-f2d0-4dda-def3-08de732084ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1lXVFlNRXd4WEJkNWZoNnB5OTJ3ZndPSGQ5L2JLUm1HYmU0UytpNDRqOHZs?=
 =?utf-8?B?aDdrRTJZa3pjZWtXMVRVYmdwVVFHcnBTQ051c2lpV3RSclpyUk1hbWI3R2Ew?=
 =?utf-8?B?R3lHOU1UbjBMU0RSQ2ZodTdXdjc4QVRZQzFyWUJBRjltREtYTFdhdG0wdldz?=
 =?utf-8?B?QWtpeGtpWVpLbkFWcG1BMFMzaTd0L3lITGNxUVo5VGVuRTZJakIyUzZnbHBB?=
 =?utf-8?B?YmtTK212dmNEOFl0SmVFNWJCU3FqdnlnaUVjOUJ6T3ZhTC9kVlM2Nmd2aFQ4?=
 =?utf-8?B?UDNLYUppZS9SN2JuVWM5T2w3dGhnUGhOeWhDSEVORGNRNmdRK3B5d0dRTUx6?=
 =?utf-8?B?WHJpMFFVNzYxMXI1a3cxZmtvQmNmNVRQWDIvZmdYY1kwOVFtMEd0c2lORWl3?=
 =?utf-8?B?SitDcWQzdWRVTFJyeHJnWC9lR0JJVTZNRWZJUVVpYWMveHNoWGRVU05tUjFu?=
 =?utf-8?B?WURjRlp1bDV0VE0rN2JWNDlkOFRHdVBzRkttQkFPUWJTSWRYbW5FUFU2MUdt?=
 =?utf-8?B?R3FXUXV4QzNWVTRwakc4SnV5T080eUVTQ1VoaXA1SGhrZnBkR2k3UHJZRk1k?=
 =?utf-8?B?ejJJK2FmaXZHMFRxYUVzTkxYcVJZZnlGVXQwODNsOXR3R2UyTFlGTkxOclpC?=
 =?utf-8?B?eHdRNTNpay9keDNnUEZpbjZLakQzdE5XRmM1Y0hScVJCcTBDQzNUUnZrVTFu?=
 =?utf-8?B?WVEzVEk1L1NxSFJYbUErVDljSEJ0NmpnU0N5ZVFvUWFlOHg1cWcrWW93N1pV?=
 =?utf-8?B?ek9JUisyeGw0eDB4UzhUUlhHbVhtaVlTNTlpT3JzM0dUSGFQaG1Fak5UdzNZ?=
 =?utf-8?B?VWV3czNMVGhaaTRzZER0TG5ybzVGYVdOK20vTjFTamd0Sy9ST3FwVnpQYmtO?=
 =?utf-8?B?K05Rb1RnaXVDL09KWHlaK3orWnBPL09zVitadUJMYWF2TDF2NjJXZlpDbmY1?=
 =?utf-8?B?VEtqTGEydzBaRzd2Q3gyRGRjUnVmWDJxUmVHR21IeTZZSVZqMEtTdHZVUmpr?=
 =?utf-8?B?WXQ0dUVMWVhwY21QUUgvWUdValJhSmpvZ3ZBczdsYXY1WjNNWG5tZ2M2VDM4?=
 =?utf-8?B?cmJpUmkyYnozQUFFUWNySnRpMVFTMFMzWHJOd2pjVlA0cUQ1TkxLaFJVakZM?=
 =?utf-8?B?a3I0dlhza2UzbjdLaXZzUGNvbSt1M281TnllTERUdlZpZnJjaXgzUkVjeUFl?=
 =?utf-8?B?UG9RTk5yL3ZTUnBhQTYwQ2NxdWErSG1FcUtsa2xtZTZDaWprZlo4YWdkeUJp?=
 =?utf-8?B?QTBuL1BPL3QvR1VMSzdlUTRWWWZHVGsxWFRzWGVocVR6d2gwK1JlMVUxQ01K?=
 =?utf-8?B?RlUyZ0dzdTVsRTB3Mmg3SFZJS2VUbTd3bk1CRnZZTllrT3lXd2xJWXdzWlVu?=
 =?utf-8?B?S3FOQ1VJTUUxMGdCQWJCTldxZTJOVVp2RG5YV0ZFcVBQdkhDRHpla1IyUld2?=
 =?utf-8?B?UlVFb3k3aURGb1kxZWVpQ0hjak1kQldnUWJLbjFHTThFekFBeDZzVDVBejlB?=
 =?utf-8?B?SEZXSHBFSGFXdHZwYTgwRzJCMWNLWHFYZStDWVRhbXBMYXIxSGJueEkrbG92?=
 =?utf-8?B?Ujd6RTVNS3hMQmh4ZjlkQ0JZN2FYbUw0c25jc3U5Qm1vOTJvUnN4YWRneThr?=
 =?utf-8?B?WkR0bGZSTmpvM3BsME1WaTRRcDNYNk0vZis4VklQQW00dFE3WnAwWmxFZXIv?=
 =?utf-8?B?akNHYncvNmtNS0ZINEYwRTlhM3NDd0NPeTdKb0pIcS9velJNNkF4bUNSZ1BG?=
 =?utf-8?B?Y1ErcTIzMms0TzVWZTVVK21iSDNpeG5hSFI1aE5iZzZteUpWa3NzMWF3REFG?=
 =?utf-8?B?cm1CMkNwcDhVZ09Jaysyc2hCcFRYdnlRaGJIVFd3QzBadEhsME4zT3dPWkhz?=
 =?utf-8?B?L0FYYXlJRGlWazVIeUxXeXo2dGJrQWFmQUttTTBkUjE4enFUMlQxcWpVdk5C?=
 =?utf-8?B?NlVoeDBwam9UTWg4UW9sV01DekRLVGZkcXIyYjVhQlllSTFCT1JTUDhwS2RX?=
 =?utf-8?B?N2ZoalVBTWxEUDk3WkxlbldyWG81Ym0wU3ZKdStUZjVkVkh5TGlWUFBncUxp?=
 =?utf-8?Q?vcEDm+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5126.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmFJbFNDdzBxSzl0QXFxZkh6dm1oSEs1LzROZWgzdEdDa3l6NW52Vnd3VXk1?=
 =?utf-8?B?YzJFc2dMTXQ2YXRXUTJ1MU90QmJjSkszR2dnSDdpMHZjZElyV0pSWnc3aUJV?=
 =?utf-8?B?R2VnMUF2SjJjMDVhUVA1LytMNHZabWg4RGlFSXFWcUs5OHcwL3pMZnArak03?=
 =?utf-8?B?TENUemIvN0lIOFhLUkU3b3ZDWk9SYksvV3Fxc0ZQT1JtMzZOd0ZoYTcxS3lZ?=
 =?utf-8?B?cmdWZDlDekRibDVIUXNOc3V3Njl1MWF4eElmSHQxVDBPMWpYR2V5Y1NDcUg0?=
 =?utf-8?B?dnIrdmRsMmd5ODlPZU1wc1pIR2k3azUrRmU3eERDbnNmU09tS29OM2Q2cEE4?=
 =?utf-8?B?SGNKZ0d2OW1CZW9hVk1yVHZhSnp1TllpNFAwYktEOTd6MFphUklReG5OR1JT?=
 =?utf-8?B?by9NL1JsUnk5NFNtVFRNSUJLeTV6K0JKSUJNNkpFa08yL1J0RE4waklGcytU?=
 =?utf-8?B?dXVEK3JuUWd5VkF1aXREZkJHQmxDRTNNckFqOUpaWDRSTHhzWEorZUNoTVVE?=
 =?utf-8?B?TjU3NnlvclRCbzRQQmpUdjBpNkJCTnlRMGwvWUFyQjRaWkxVbWczcTRRNnJk?=
 =?utf-8?B?ZjhiNDJEODRoemhPMzFNbThTRVUycjl6UHl6QWtUZWEyS2Y3cDhSUlA3a0ky?=
 =?utf-8?B?YzRJZHMvcGJVY21XSUtLTGdYbjhneTNXK3FIYXgxV3VwUUpiQXk0djMzTExo?=
 =?utf-8?B?Q3FzSkVRWWRReEZDOGo0andHL0t3REJyTkVkRXUvTXBFUlhrVGRZeGY5RVdN?=
 =?utf-8?B?RU9OODIvUFI4ZmlRK3NXc3ZBR1ZDVlF0bWNKWFhQb3Vxck5XRUpNSUhNeEJV?=
 =?utf-8?B?OUlWbUpjMHV2T0JZaHllZlR3VWtNV2VmaHZiVXZRYjNpTElVclpXdjU3ZGxi?=
 =?utf-8?B?V0F5U0xvRTJJRlNPQ3pQR1JXUXVidE5walBLRmhjckJxaE80MlVSTWlzZ2dx?=
 =?utf-8?B?QjFSR2tyR3pxcWw4QVczNDl4aFZUMXFFN1FLODd0MjN2WnZsWHpObTNWS1BW?=
 =?utf-8?B?ak1KQVJvZG5wRkJjUFFMSDhkc0treFFXNHZPR3ZyeTloQUk2Y2hGdjdqdmY3?=
 =?utf-8?B?SVRaS1RZSVNLRHpBZTRibGhXRmVDR3ZKRFlkVWNUVkNQVTB6YVExV0tINzh3?=
 =?utf-8?B?V01Xb29CNEUzS1JpcWhnUDVSVlE5QVFPQmpNYmdUYTJGTWp5aVVFQXpKWTBB?=
 =?utf-8?B?NmF4ZkRjbStCYVZlRVB6YThOWTRmVDVJTTVIVExPUkpMYXNzMHZCMWR6T1pj?=
 =?utf-8?B?OGFTbnZKRGFFNm5lNnBqNlY5NWo4SWp5STZ3dUMvY09oWEladzJvMGZPR01O?=
 =?utf-8?B?dkd0aDZyS3RtcldoeHd5MU81ZExkY2NwMndrOU9lbDlkaGFVWUllNDNpRTI3?=
 =?utf-8?B?ckxOSDh6TmQ1NndUVmRSRERLaVc3ZWYyeUxPR3MyRzkzOE53YzZtdGVyd3Nz?=
 =?utf-8?B?aUFGalVXUWFOTTBkTHU0TGRPRFNwZnpRRXBXbVR6c1czYm8yOVFhVUNIU1M1?=
 =?utf-8?B?NzZ5RmlkaHQzbEQ1dUF0eDh0UkZpR2tzRmJ0YkE2TVV5UGx1aG9qYzg2T1Np?=
 =?utf-8?B?VXh2RExYZ1E2V3dUTVdvVFpMdHlUNDJVRkRMT0Fka2l2MmhteFhoT0Q4YUpZ?=
 =?utf-8?B?WGl0TGx2bEJ3YVRKUTVjdVY0K1dDRWVvZy9aS1NzMjlmOHFXWFNjYlpENFl1?=
 =?utf-8?B?UTVHaEUvckkxaFJGd2V2OUhDdkVHOVJ1anV4ZXMxK3JxcVpqMUJ3eTBPblE2?=
 =?utf-8?B?dmhjaFdRWUZzTjNsTzg0UlkrMlhxVmRWUGhHTENlczl5VlFXMnBDNE82TlI3?=
 =?utf-8?B?RkpCa1czSURLOEFTbVBwa1Z2S0FMMVNFZHpFU3hpT2NmUmFaWjVFWnIwY3N4?=
 =?utf-8?B?Q0V3WnptLytJWVEyZXl2czJPaTNzVndubEJTeVFtSjk3OGUxK3dLMnNWanhu?=
 =?utf-8?B?OHZlQ2NKQWJPS2MrUHR3dHc3QS91ZTVkVE9uOGxud1drTnR5NmRlSWQzbGtj?=
 =?utf-8?B?RFFFYllEUTFheFZyMkpWRmZ5dWZDUjFqNHJaQzRYU2Z2MmtHMnVSeFoxeE9n?=
 =?utf-8?B?a29mMnlQd2d6VmQyVzEyZzVsYThSbjRRdE56UFVvdWR0QStZcWpVM0daZVJM?=
 =?utf-8?B?bDdNNytmQUJNUVgxK3lMOURZRElwUkthLzhxdE03WWZYY3NtWTJIbS9rOWZR?=
 =?utf-8?B?MjVjcEl2SnMvMWZJK2tPM2pqdXgwd0t2M3A2cTRMNVBqTHVSSk02S1QvS1FP?=
 =?utf-8?B?OEtWOUx2c05BeVRYWWhTQms5RFRCL3NVYUhKak9odFNOQmZRU3oxWnorNkcy?=
 =?utf-8?B?UHNzY0NONG1kamd6d1phZUJJM0MrS0dKV01UbFlWQUhkZHdtYnpEUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93aa6ede-f2d0-4dda-def3-08de732084ae
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5126.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 21:14:23.6418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8oyTznPMvQcpSky8yDqnjEdXnCkG7qsRtNqAjbkbFOeRoOtn+n0M/ZDBZeaQdKWG5Va4EuXKEyNITBAUcQeGZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5922
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,igalia.com:email];
	FROM_NEQ_ENVFROM(0.00)[harry.wentland@amd.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 358B017D6D8
X-Rspamd-Action: no action

On 2026-02-18 01:57, Chaitanya Kumar Borah wrote:
> This series aims to keep colorop state consistent across atomic
> transactions by ensuring it accurately reflects committed hardware
> state and remains part of the atomic update whenever its associated
> plane is involved.
> 
> It contains two changes:
> - Preserves the bypass value in duplicated colorop state.
> 
> _drm_atomic_helper_colorop_duplicate_state() unconditionally reset
> bypass to true, which means the duplicated state no longer reflects the
> committed hardware state. Since bypass directly controls whether the
> colorop is active in hardware, this can lead to an unintended disable
> during subsequent commits.
> 
> This could potentially be a problem also for colorops where bypass value
> is immutably false.
> 
> Conceptually, I consider 'bypass' to behave similar to 'visible' in plane 
> state - it represents current HW state and should therefore be preserved
> across duplication.
> 
> - Add affected colorops with affected plane
> 
> Colorops are unique in the DRM model. While they are DRM objects with their
> own states, they are logically attached to a plane and exposed through
> a plane property. In some sense, they share the same hierarchy as CRTC and
> planes while following a different 'ownership' model.
> 
> Given that enabling a CRTC pulls in all its affected planes into the atomic
> state, it follows that when a plane is added, its associated colorops are
> also included. Otherwise, during modesets or internal commits, colorop state
> may be missing from the transaction, resulting in inconsistent or incomplete
> state updates.
> 

That tends to reflect my thinking when I wrote the colorop stuff.

> That said, I do have a concern about potentially inflating the atomic
> state by automatically pulling in colorops from the core. It is not
> entirely clear to me whether inclusion of affected colorops should be
> handled in core, or left to individual drivers.
> 

Could this lead drivers to reprogram possibly expensive colorops
when they didn't change? It won't be an issue for amdgpu since we
have another level of state tracking, but for drivers that strictly
follow the atomic model it might lead to issues.

On the other hand it makes colorop handling less error-prone in amdgpu,
and possibly fixes a bug I've come across where we get confused if an
active colorop isn't part of the state.

Harry

> My understanding of the atomic framework is still evolving, so
> I would appreciate feedback from those more familiar with the intended
> design direction.
> 
> ==
> Chaitanya
> 
> P.S/Background/TL;DR:
> 
> I discovered inconsistency with the colorop state while analysing CRC mismatches
> in kms_color_pipeline test cases[1]. Visual inspection reveals that while CRC is
> being collected degamma block has been reset. This was traced back to the internal
> commit that the driver does to disable PSR2 and selective fetch for CRC collection.
> 
> crtc_crc_open
>     -> intel_crtc_set_crc_source
>         -> intel_crtc_crc_setup_workarounds
>             -> drm_atomic_commit
> 
> During this flow colorop states are never added to the atomic state which in turn
> makes intel_plane_color_copy_uapi_to_hw_state() disable the colorops.
> 
> If we add the colorops, to the atomic state, the problem still persisted because
> while duplicating the colorop state, 'bypass' was getting reset to true.
> 
> The two changes made in this series fixes the issue.
> 
> [1] https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18001/shard-mtlp-6/igt@kms_color_pipeline@plane-lut1d.html
> 
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Alex Hung <alex.hung@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Daniel Stone <daniels@collabora.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Alex Hung <alex.hung@amd.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> Cc: <stable@vger.kernel.org> #v6.19+
> 
> Chaitanya Kumar Borah (2):
>   drm/colorop: Preserve bypass value in duplicate_state()
>   drm/atomic: Add affected colorops with affected planes
> 
>  drivers/gpu/drm/drm_atomic.c  | 5 +++++
>  drivers/gpu/drm/drm_colorop.c | 2 --
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 

