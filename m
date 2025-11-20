Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AABC76264
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 21:13:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9995610E2AB;
	Thu, 20 Nov 2025 20:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QYbYBu9W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012028.outbound.protection.outlook.com [52.101.48.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9324510E0A3;
 Thu, 20 Nov 2025 20:13:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EqYzm2D4jG/axICHtxouYWvMinXSDcMBAsuwRAwGQB4rXV7fddqJd+axA220d/DMnAKvHmfiixVPwiEU+jW9hXHk7ILOcudjwiV6BRq2Q1nTKN8cFx5MMFyAyVDNPPYtr5mJiwF8I2kmYS2cjSXvyUF0riIRHGTxuwOShXG8HJaCoA08O7WtGTCq8eYEl23EiBhcds+tkU40xBcxESa7t3OOWHLqmNOvLofxDt7uB2aQI5IWPDKQuw5rPKaeX2Lw5+vV2VZfhMIX3ewWB4twz4re5+1mCXc8Y3XqXJ1d2k1sCiaXA0ABykS/ImkxXK4gBJkqUTNzyd8OiRA8h87neQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqmJeV2DQ85HoNYs71GuMT5tWkDFW6zmqvaM+u3b5YI=;
 b=gWpv5WgQHufPf3QX4uscZLxs3r2mYRygDAMn/JPG16IP8YbkJVfZ20SOcl4AxbDKlb+4RbtbRO9BVqwqGFg8iHznD6EiYD0jhCsg2/0llR8M990Uwsp030/CfnaVR4U2m17FR1Hdur9/USiJajQCJcpP1U8kvjok9WjC54mfda3ZEjCNLvdsdGpsKa4J9xj7ZN49HtpVt/cUdA7UrGEvWNkwbPu5SVoJDTWtzDZTjx26CQJqf4vZcr8/IP68jMtCLPzXzf1sdhLLvhnUxzlkhqVaF3HMfe7NBpMS3+DodMQRlrDMw/+3ig4XlBfVsI87qwd6GqnwVRrJELOD80/JOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqmJeV2DQ85HoNYs71GuMT5tWkDFW6zmqvaM+u3b5YI=;
 b=QYbYBu9WKXUJHf5XnBVAfkRL59ygdNgybooAGMCCF+MgHT7XcQPinz+TFaJ8o+zXSIblIJy/q28fHBRoaAlDtnYINb7rJuYykRgpCa6kmw3/tSaE/41aKomhNWCyv9PAgGcm1/Z+FPGQl+//onom4Q8uk0invfvkZBgN8kvEqLg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH7PR12MB6933.namprd12.prod.outlook.com (2603:10b6:510:1b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 20:13:00 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 20:12:59 +0000
Message-ID: <cbe00ac4-a535-47d3-813a-e2eda7e9b991@amd.com>
Date: Thu, 20 Nov 2025 15:11:18 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 00/51][FINAL] Color Pipeline API w/ VKMS
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, xaver.hugl@gmail.com
Cc: wayland-devel@lists.freedesktop.org, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 mcanal@igalia.com, nfraprado@collabora.com, arthurgrillo@riseup.net
References: <20251115000237.3561250-1-alex.hung@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20251115000237.3561250-1-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0096.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::32) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH7PR12MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ca55703-6289-445b-32bf-08de2871338b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFFUcnhMb1VJSEhwT3FSeU92L084citQZUJyb0VkdHdRNWxuRGFWWEdWZTJW?=
 =?utf-8?B?MUpER0R2WEU5Q1plTXVWSGRWM3l0VXk5RmdPaVhhWHpvSGg5aFFrNlpEUFEw?=
 =?utf-8?B?WWtHNWxqVnZtc3RlWkdkc3JJU3lsemhkUllHT1c1QmZyQm1lQmVjbStNcXF0?=
 =?utf-8?B?enZmMnVxMGw1alBGUkhvbnEyZlhSdUdBa1RGNUg5dG5PcGFjTHlkbkN1TjNh?=
 =?utf-8?B?dCtmRWRjdU56TktZMm1XTHFXMjI3N2NtKzZvZDZKRFVSQmp1eDhjdnNMa0Vx?=
 =?utf-8?B?QTU1SVZTTCszQ1B4dFdRaVNVS0xlZWJqTWFPcXc3NVBZd0VPSmJYYnJKTS9I?=
 =?utf-8?B?S0FvTWRRcVJtb1NvUzJPTDlLV25razZJUEE3VjVsVWhodENFYWlPRE96ZTRG?=
 =?utf-8?B?ODZMalhhWHV6NkhPSm0xQXRmbE1QY0J4MERMRWh5NXBOQWFLMlArQkg0ekRC?=
 =?utf-8?B?YVhJeTBpZ3BrSGl4ajRFa0RxNjhqeGdDYjRSeGJ5TVREbmZRYXl3aEhQK3Y2?=
 =?utf-8?B?UnJidWFSNEtlcm9aNjJldnVXR0FseFJlMUlKMElsMUFKS3hEbHBBRy9iTklX?=
 =?utf-8?B?WnVtNkJsS0ZCaGRCY2JUaUgyTnVoWmI4TndOaU1NTG10cDVnNjhGQ1k5Zks5?=
 =?utf-8?B?SHB5UTJKdThxd0JwYWhJbE9YY0RSeC9WWXNJV05YM0RPd2M2MEhDYjBYL0R2?=
 =?utf-8?B?K0xVSGttSy9mZU1uSnNiZmZud3orak1aWG00ZDdSRm1oS093aUtpTUFXZTRq?=
 =?utf-8?B?bkRRejlzbTc2MEhFendTbGowdGw3US9mcGE0czZTanRva05XOTJtR3pZMC8y?=
 =?utf-8?B?QkJuVVhYSFlEM21lNWtta1JHV2ZPZVIvZzNKaVJrSnJkYmpZQi9JVkxjSXox?=
 =?utf-8?B?eC9uRUJ4TC9RUC94dkRTekl5Nkh1d0dsNitrWWZUaHdXL3ZzTy9uNkx3OWN2?=
 =?utf-8?B?ZlNQL1lNMWJaNENRT0k1Z3BhVys4d3NmSnM4M0o1aGhNbnFvbWhuUGpONVk3?=
 =?utf-8?B?RU5STG55NDNxcWw5YXF6MGhSMVBXWG9qV0tTTjh6MmZqRWpZbE92WFZCeVpk?=
 =?utf-8?B?a3pxdkVabi9ZcUExaDRQekhUY2dhRHZkNVNtcVFFN2dVeEN2Ukw1c2xzS2lJ?=
 =?utf-8?B?VGlzVEtQZkhKWHpicVBrd1BQU3FyWGZrZFJHVWhhcjBLZ2wzS0w5cGpaRFR6?=
 =?utf-8?B?YUR5SHRpM1VRZDBhNW5DcTF3S0xZQXNDckJ5Z2hEOHdGWVYrNk9KOVNQMnNl?=
 =?utf-8?B?MEdNMnRSeXdGRlUxTWYwdlFwakQzN295TU0vVVVTZHJoRysyS1dHS2pJY3Q0?=
 =?utf-8?B?RVBTL3Y4eXpkRUV1eGQvT0wvcFE2Z3ZMeU5waG1tdFhsTi8xWlQ1dHREVG45?=
 =?utf-8?B?UWJrUzRXMDE3S3QyQ0ptcWYza3dsT09WRzhOS2d2MmtPSnhZWVVZemJMVFZZ?=
 =?utf-8?B?MG1BNHdWbHV1YjdoQnNuVWYwd3g2VDVIc2p4UTVGV3I1Ri9nTk85SXE0QTd3?=
 =?utf-8?B?bklBSHZGblVNYlVuNytsSWFJZGdJR3hGOHlpRGpoSmlNQlIybGQydk4xd3o2?=
 =?utf-8?B?aTZSUkpqYUVvcU5kUlFWck5SU3F3OUx0REdGaHR4TWRjUE5zNTV4bE5Ganl6?=
 =?utf-8?B?RE51bTEwNTNUTTRDbEdyWWZBeUFUbGoxUG0ydzZpTmEzZllyeGp0ZUxCemxp?=
 =?utf-8?B?Y3ZPM0VaSHdVUUx3U0JicTNqQkdHcUdMSlBXa2l3MXpjRnpkY0FBTGo5S3Zy?=
 =?utf-8?B?bFM5UDBDV0VOR01FbEpsdEh6aFBCdWwyL2did2p5cHRpNi9KZFlCb3RXa2Fx?=
 =?utf-8?B?WWRWaFAvYzB4TlZ0RVFlbG9xT1BTWUxGYjBaMGFHdGZocUZpMDhoSEQvVmZL?=
 =?utf-8?B?aXpBR1hEQTNoOWhqTjFVOFVVOHJoRUNQRWgvblhwQTRRdHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUF1L1FSblU1NDZ6U04vTFk0UGJPMDYvVmJhZXBjR0lWY1d5bDRqVGYreXpp?=
 =?utf-8?B?MVBrbU1xYWdqMHR6VWpLMGQ1MHNZSTY5cEtoL3UvbHNVdjRxNWloNXBWalhK?=
 =?utf-8?B?ZEp1V0Q3NnJDMGlFOXhSWmtQSWZwckxxZFI5cXl2N1BpSGhxQ1ZmWFpnYXF3?=
 =?utf-8?B?cEozWGdVeDVCaDE1TVRsV0pCS0VrS2FHZmhBb2lJMlVnaGkvbjdJcUdTcjJZ?=
 =?utf-8?B?OGVWczRpL1J3cXlxMEladDluTzNXWW1LZUlFMjNOeDhRa0hHQjJMQzlpendY?=
 =?utf-8?B?Y1l4Y0FVRmF0ZDhJU1h6TS85b2pnSC9DczNjOCszazZRdEZCaG43TitQSk1X?=
 =?utf-8?B?aGxtQ1I2ZSs3MjZzMFVWOXdrUmdFaTRQbWt3OGFYU0llb2MzVlhKNGxXajUw?=
 =?utf-8?B?MkZEYks4d1BHNkNaR1B3OURiMnhEZzFIRTAwbExkaFdPd25hV2xrNlMrT0tS?=
 =?utf-8?B?dGUvbFVkZVBITG03WGFOYWxKaDA3L3NMdUgyM1k1NHQ0VlVpOGNZNVRkSFIz?=
 =?utf-8?B?U3VoR3MvYjliWWN1d3ZsbkZzVmlvdTB6N0xFdW95c01SSGtJcDRVZmwvQVlH?=
 =?utf-8?B?SXI3LzNmYU9Ca0F1VTd2QisrNzhZS25lYXZaRGtuNUJPYlg0SDBKQjJjT1RB?=
 =?utf-8?B?cXJvenFQd0xpVHROMFRoOHBEM1pWeURrUzZjSVkzNUc4RGJGc3d0VW9STHE4?=
 =?utf-8?B?YTRhQ0t2bUVIT0U4azhjd0JRZy81Q2tqd2ZWNWZ4KzJZR3VNSXlMc1hSTlVZ?=
 =?utf-8?B?Z3hLNmwzbCsvc3A1YkZSWTFUVk1kNjdzdjhuVndZUGI2L09CWTZURUZvcEda?=
 =?utf-8?B?dmtxOStjc2xyRWRSN0tLZGVPREF4N2d5S3lZaUEwbGY3NWU2cXFIRTkvTFlv?=
 =?utf-8?B?UTJyUWFJTEcyc0VvOGc4Y0pyT28vRWVyR3UxQkNPOEI1YkRVeXB2bUJFd0I0?=
 =?utf-8?B?djd4aWVsS2hHQnNYNUtiaHBvdDJ4NVM3TVUwQ3ZBaHhuWHMwZUd4STVvTzIw?=
 =?utf-8?B?U0hsWmluVDZIb2d2YjBzKzFwb3BDRWd3L0JvNG90T1BzY2RnMGx4RTZtamM3?=
 =?utf-8?B?WTdOeldDU1FGa05MZ3o1RUN0VWR3amd1T2t1VWtaM0ZzbU9vUnViTXhQMWpM?=
 =?utf-8?B?bXo5M0VzQ2FIUlNYMmlDaXY2L05OK0dQeitTeC8yaGVDVUE0dGsrNGdjS2Fi?=
 =?utf-8?B?cFM4K2xTc1lqTjJRSlBYZVpPRERTQ1Awa3AvQ3RPNGJuOW80eWdoV0hSaFRs?=
 =?utf-8?B?ekRTUytKNmtVTUlBcFpRdVZ4Sm1sQWZKRlIzc0Y5SkRXTEVhTU9tL2NqeVY4?=
 =?utf-8?B?OU14U2JZQUZxR2tqcnpadnF1VkltQTlGdml4YzhZVUhzUTNlbEMxYU00R2JG?=
 =?utf-8?B?TUREUkVKaWlMOHQrUUx0TEc4aG1uODdTRFlrMzI0SDBZVkNKeUkwak1HbENU?=
 =?utf-8?B?VU5HbUV1dzU4RU9HYWhoTUd6eDVZRUVtNDRaZ2cySjRrYUZ4d0V0VVlQZnBY?=
 =?utf-8?B?d0dVVTlrQ3hzNkpQa3BySURBbmVtTVQwRjRPR0xlODR3N0E2SnpqQklHdVdV?=
 =?utf-8?B?eTgwcG5RcENoNEdoc3RjSitOSi9NbnpZcEphODFtRGNxYlR6bU5sSjdvTUdM?=
 =?utf-8?B?dUwrYS9Xdlp2cW52ZzNod0ZQT3owVDBwbStRMnp1SUtmWENoY1pDaE1pSHhy?=
 =?utf-8?B?QWxhMy9ObU43YWNNSmNid3FrWi9qWGtJNzdQQk51REg4TEZIQ0xrMHdkS2Fs?=
 =?utf-8?B?TENnRGk2MHlMcmt6VjdkeTJSczdXM0FQYnc0ZjVOWlF4cW0wdWVMTGZUcTJE?=
 =?utf-8?B?OVBXWXYyN1RjMVhTM2FZbEJKeUVzaFpKMEVvSFZoVTFSaFcrSUxOS3dBT2Ny?=
 =?utf-8?B?djNSdWlvZU1tdE10N05Lc1NQbmdXenVRUWpZaUZWVjcwemJBb0p0bzY2M3Jk?=
 =?utf-8?B?WGFkMzNFU3RDWWRwUTIzQ21heG9DVlFsWEl2YjBKZitYelF1UlBuZEhkMXZj?=
 =?utf-8?B?c0Z0ZlZaSXNzd2FxOE5uZHd4bmcvNUQ4KzVYQmcvRjdZa2loalUxZ0Z0cXJK?=
 =?utf-8?B?RU1CakpQRUNDM25XRVFoczZSc1pxUnhkRjU3dCtVUmNMSk94cnY3NnQxVFp1?=
 =?utf-8?Q?pFg8JlM8eZCwBx4+Gq9Fsjxkp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca55703-6289-445b-32bf-08de2871338b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 20:12:59.7674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orfZG4+P/HhuFdj06z0LzyZITMZiSRI7UtJHn6UQZUjn+V+ie8SAQbVYZyVuXg70Fp/9M/qqg5oXFmxt1Q9KdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6933
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



On 2025-11-14 19:01, Alex Hung wrote:
> Both kernel patches and IGT patches are reviewed and the API is stable
> for a few revisions. Does anyone have concerns if kernel and IGT patches
> are to be merged?
> 

Xaver, are the kwin patches ready to be merged?

I'm planning to have a last look over the kernel and IGT series and merge
them to drm-misc-next next week if there are no objections. I believe
I still have committer rights to drm-misc and Alex should have IGT committer
rights.

Harry

> This is an RFC set for a color pipeline API, along with implementations
> in VKMS and amdgpu. It is tested with a set of IGT tests that can be
> found at [1]. The IGT tests run a pixel-by-pixel comparison with an
> allowable delta variation as the goal for these transformations is
> perceptual correctness, not complete pixel accuracy.
> 
> v5 of this patchset fleshed out documentation for colorops and the
> various defines that are being introduced.
> 
> v6 addresses a few comments from various reviewers.
> 
> v7 simplifies 3D LUT and addresses more comments from various reviewers.
> 
> v8 fixes typo and errors and address comments from reviewers.
> 
> v9 refactors cleanup functions, fixes typo and errors, and addresses
>    comments from reviewers.
> 
> v10 add 32BIT RGB (drm_color_lut_32) to 1D & 3D LUTs, addresses comments
>     from reviewers, and fixes typo and errors.
> 
> v11 change names from *_lut_32_* to *_lut32_* and fix RGB 32bit
>     extractions.
> 
> v12 add gamma 2.2 to 1D curve
> 
> v13 add two vkms patches
> 
> VKMS supports two named transfer function colorops and two matrix
> colorops.
> 
> Amdgpu advertises the following pipeline for GPUs with DCN 3 or newer:
> 
> 1. 1D Curve EOTF
> 2. 3x4 CTM
> 3. Multiplier
> 4. 1D Curve Inverse EOTF
> 5. 1D LUT
> 6. 3D LUT
> 7. 1D Curve EOTF
> 8. 1D LUT
> 
> The supported curves for the 1D Curve type are:
> - sRGB EOTF and its inverse
> - PQ EOTF, scaled to [0.0, 125.0] and its inverse
> - BT.2020/BT.709 OETF and its inverse
> - Gamma 2.2 and its inverse
> 
> Note that the 1st and 5th colorops take the EOTF or Inverse
> OETF while the 3rd colorop takes the Inverse EOTF or OETF.
> 
> The 3D LUT is a 17^3 tetrahedrally interpolated LUT but the mechanism
> exists for other drivers to describe their own 3D LUT capability.
> 
> This mirrors the color pipeline used by gamescope and presented by
> Melissa Wen, with the exception of the DEGAM LUT, which is not currently
> used. See [1]
> https://indico.freedesktop.org/event/4/contributions/186/attachments/138/218/xdc2023-TheRainbowTreasureMap-MelissaWen.pdf
> 
> At this point we're hoping to see gamescope, kwin and weston implementations
> take shape. The existing pipeline should be enough to satisfy the
> gamescope use-cases on the drm_plane.
> 
> In order to support YUV we'll need to add COLOR_ENCODING and COLOR_RANGE
> support to the color pipeline. I have sketched these out already but
> don't have it all hooked up yet. This should not hinder adoption of this
> API for gaming use-cases.
> 
> We'll also want to advertise IN_FORMATS on a color pipeline as some
> color pipelines won't be able to work for all IN_FORMATS on a plane.
> Again, I have a sketch but no full implementation yet. This is not
> currently required by the AMD color pipeline and could be added after
> the merge of this set.
> 
> VKMS patches could still be improved in a few ways, though the
> payoff might be limited and I would rather focus on other work
> at the moment. The most obvious thing to improve would be to
> eliminate the hard-coded LUTs for identity, and sRGB, and replace
> them with fixed-point math instead.
> 
> There are plenty of things that I would like to see, but they could
> be added after the merge of this patchset:
>  - COLOR_ENCODING and COLOR_RANGE
>  - IN_FORMATS for a color pipeline
>  - Is it possible to support HW which can't bypass entire pipeline?
>  - Can we do a LOAD / COMMIT model for LUTs (and other properties)?
>  - read-only scaling colorop which defines scaling taps and position
>  - named matrices, for things like converting YUV to RGB
>  - Add custom LUT colorops to VKMS
> 
> IGT tests can be found at [1] or on the igt-dev mailing list. There
> have been no updates since v5 and rebase on latest main is straight-
> forward.
> 
> A kernel branch can be found at [2].
> 
> [1] https://gitlab.freedesktop.org/alex.hung/igt-gpu-tools/-/tree/amd-color-pipeline-v12
> [2] https://gitlab.freedesktop.org/alex.hung/linux/-/tree/amd-color-pipeline-v13
> 
> v13:
>  - Update vkms test Makefile (Louis Chauvet)
>  - Include two vkms patches (Louis Chauvet)
>  - Remove redundant ternary null check for drm_color_ctm_3x4 blob (Coverity Scan)
> 
> v12:
>  - Reorder header files (Louis Chauvet)
>  - Add header file "vkms_drv.h" to vkms_composer.h to avoid compile
>    errors (kernel test robot)
>  - drm_colorop_cleanup is no longer static (Nícolas Prado)
>  - Rework cleanup in vkms_initialize_color_pipeline (Louis Chauvet)
>  - Add drm_colorop_pipeline_destroy in vkms_destroy (Louis Chauvet)
>  - Remove outdated commit messages (Pekka)
>  - Initialize the variable 'blend_lut' to NULL (kernel test robot)
>  - Change lut_size to size (Sebastian Wick & Xaver Hugl)
>  - Update comments for bypass_property (Sebastian Wick)
>  - Update lut_size to size (Sebastian Wick & Xaver Hugl)
>  - Add gamma 2.2 (Sebastian Wick & Xaver Hugl & Pekka)
> 
> v11:
>  - Refactor vkms_color_test_lerp() to parametized tests (Maíra Canal)
>  - Sort include file alphabetically (Maíra Canal)
>  - Skip color_encoding/range_property in drm_mode_object_get_properties
>    when plane_color_pipeline is present (Harry Wentland)
>  - destroy function takes drm_device *dev instead of drm_plane *plane
>    (Nícolas Prado)
>  - Fix undefined errors by EXPORT_SYMBOL symbols (kernel test robot)
>  - Fix comments to "2nd op 3x4 matrix" (Nícolas Prado)
>  - Update outdated "drm_rect_test_suite" to "drm_fixp_test_suite" (Maíra
>    Canal)
>  - Update outdated MODULE_LICENSE to Dual MIT/GPL (Maíra Canal)
>  - Create color pipeline on supported hardware only (Melissa Wen)
>  - Update names from *_lut_32_* to *_lut32_* (Simon Ser)
>  - Include help function drm_color_lut32_extract (Uma Shankar)
>  - Remove redundant is_legacy from __drm_lut_32_to_dc_gamma (kernel bot)
>  - Fix RGB 32bit extraction from LUT (Xaver Hugl)
>  - Handle errors in __set_colorop_3dlut (Nícolas Prado)
>  - Merged enable condition for drm_crtc_enable_color_mgmt (Melissa Wen)
> 
> v10:
>  - remove duplicated "is useful" in comments (Melissa Wen)
>  - guard "dm_plane_init_colorops" function when !AMD_PRIVATE_COLOR (Melissa Wen)
>  - Replace DRM_ERROR by drm_err
>  - Creaet color pipeline when >= DCN_VERSION_3_0 (Melissa Wen)
>  - Relocate amdgpu_dm_supported_*_tfs check (Melissa Wen)
>  - Support 32BIT RGB for 1D LUTs (Uma Shankar)
>  - Support 32BIT RGB for 3D LUTs (Harry Wentland)
>  - Fix typo mutliplier to multiplier in subject (Melissa Wen)
>  - 1D & 3D LUTs are no longer immutable ((Xaver Hugl)
>  - Fix 3D LUT kernel doc (Leandro Ribeiro)
>  - Check dpp.hw_3d_lut before creating shaper tf/lut and 3dlut colorops (Melissa Wen)
>  - Disable CRTC degamma when color pipeline is enabled (Melissa Wen)
> 
> v9:
>  - Update RFC documents for 3DLUT and fallback behaviours (Simon Ser)
>  - Specify colorop function names by _plane_ (Chaitanya Kumar Borah)
>  - Remove redundant comments (Simon Ser)
>  - Fix typo in commit description (Shengyu Qu)
>  - Move destroy and cleanup functions earlier (Simon Ser)
>  - Move DRM_COLOROP_1D_CURVE_BT2020_* from middle to end (Simon Ser)
>  - Chagne "bool allow_bypass" to "uint32_t flags" for better extensibility (Simon Ser)
>  - Return a value in __set_dm_plane_colorop_3dlut
> 
> v8:
>  - Change VKMS config names (Louis Chauvet)
>  - Remove deprecated function "drm_atomic_get_existing_colorop_state" (Louis Chauvet)
>  - Remove null check in drm_colorop_set_next_property (Simon Ser)
>  - Remove MAX_COLOR_PIPELINES in drm (Simon Ser)
>  - Update kernel docs and documents for DRM_COLOROP_3D_LUT (Simon Ser)
>  - Add comments for dmr_color_lut (Louis Chauvet)
>  - Fix typos and replace DRM_ERROR and DRM_WARN_ONCE by drm_err drm_WARN_ONCE (Louis Chauvet)
>  - Fix incorrect conditions in __set_colorop_in_tf_1d_curve (Leo Li)
>  - Add DRM_MODE_PROP_ATOMIC to drm_property_create_range (Simon Ser)
>  - Change "1D Curve Custom LUT" to "1D LUT" (Simon Ser)
>  - Return error when __set_output_tf fails (Leo Li)
>  - Return -EINVAL when drm_color_ctm_3x4's size mismatches (Leo Li)
>  - Set initialized to 0 and return when drm_lut3d_size is 0 (Harry Wentland)
>  - Rework tf->type = TF_TYPE_BYPASS for shaper (Harry Wentland & Leo Li)
> 
> v7:
>  - Simplify 3D LUT by removing lut_3d_modes and update doc accordingly (Simon Ser)
>  - Add destroy / cleanup functions when color pipeline initialization
>    fails (Louis Chauvet)
>  - Fix checkpatch errors and warning (spaces, long lines, {}, and etc)
>  - Change lut's size from drm_colorop_state->size to drm_colorop->lut_size
>    and from size_property to lut_size_property
>  - Update some kernel updates and commit messagesa (Louis Chauvet)
>  - Squash "drm/colorop: Add atomic state print for drm_colorop" and
>    "drm/colorop: Add NEXT to colorop state print" (Simon Ser)
>  - Add missing MODULE_DESCRIPTION (Jeff Johnson)
> 
> v6:
>  - Eliminate need to include test as .c file (Louis Chauvet)
>  - some doc updates
>  - cleanup if colorop alloc or init fails in VKMS and amdgpu (Louis Chauvet)
>  - couple other small improvements in VKMS, such as rounding (Louis Chauvet)
>  - take ref for DATA blob in duplicate_state func & fix refcount issues (Xaver Hugl)
> 
> v5:
>  - amdgpu 3D LUT
>  - Don't require BYPASS
>  - update RFC docs and add to TOC tree
>  - add drm_colorop and COLOR_PIPELINE kernel docs (non-RFC)
>  - add amdgpu color pipeline doc
>  - define SIZE property similar to drm_crtc's GAMMA_SIZE
>  - various minor fixes and cleanups
> 
> v4:
>  - Add amdgpu color pipeline (WIP)
>  - Don't block setting of deprecated properties, instead pass client cap
>    to atomic check so drivers can ignore these props
>  - Drop IOCTL definitions (Pekka)
>  - Use enum property for colorop TYPE (Pekka)
>  - A few cleanups to the docs (Pekka)
>  - Rework the TYPE enum to name relation to avoid code duplication (Pekka)
>  - Add missing function declarations (Chaitanya Kumar Borah)
>  - Allow setting of NEXT property to NULL in _set_ function (Chaitanya Kumar Borah)
>  - Add helper for creation of pipeline drm_plane property (Pekka)
>  - Always create Bypass pipeline (Pekka)
>  - A bunch of changes to VKMS kunit tests (Pekka)
>  - Fix index in CTM doc (Pekka)
> 
> v3:
>  - Abandon IOCTLs and discover colorops as clients iterate the pipeline
>  - Remove need for libdrm
>  - Add color_pipeline client cap and make mutually exclusive with
>    COLOR_RANGE and COLOR_ENCODING properties
>  - add CTM colorop to VKMS
>  - Use include way for kunit testing static functions (Arthur)
>  - Make TYPE a range property
>  - Move enum drm_colorop_type to uapi header
>  - and a bunch of smaller bits that are highlighted in the relevant commit
>    description
> 
> v2:
>  - Rebased on drm-misc-next
>  - Introduce a VKMS Kunit so we can test LUT functionality in vkms_composer
>  - Incorporate feedback in color_pipeline.rst doc
>  - Add support for sRGB inverse EOTF
>  - Add 2nd enumerated TF colorop to VKMS
>  - Fix LUTs and some issues with applying LUTs in VKMS
> 
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Jonas Ådahl <jadahl@redhat.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Alexander Goins <agoins@nvidia.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Michel Dänzer <mdaenzer@redhat.com>
> Cc: Aleix Pol <aleixpol@kde.org>
> Cc: Xaver Hugl <xaver.hugl@gmail.com>
> Cc: Victoria Brekenfeld <victoria@system76.com>
> Cc: Sima <daniel@ffwll.ch>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
> Cc: Christopher Braga <quic_cbraga@quicinc.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Arthur Grillo <arthurgrillo@riseup.net>
> Cc: Hector Martin <marcan@marcan.st>
> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
> Cc: Sasha McIntosh <sashamcintosh@google.com>
> Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> 
> Alex Hung (18):
>   drm/colorop: Add destroy functions for color pipeline
>   drm/colorop: define a new macro for_each_new_colorop_in_state
>   drm/amd/display: Skip color pipeline initialization for cursor plane
>   drm/amd/display: Add support for sRGB EOTF in DEGAM block
>   drm/amd/display: Add support for sRGB Inverse EOTF in SHAPER block
>   drm/amd/display: Add support for sRGB EOTF in BLND block
>   drm/colorop: Add 1D Curve Custom LUT type
>   drm/amd/display: add shaper and blend colorops for 1D Curve Custom LUT
>   drm/amd/display: add 3x4 matrix colorop
>   drm/colorop: Add multiplier type
>   drm/amd/display: add multiplier colorop
>   drm/amd/display: Swap matrix and multiplier
>   drm/colorop: Add 3D LUT support to color pipeline
>   drm/amd/display: add 3D LUT colorop
>   drm/amd/display: Ensure 3D LUT for color pipeline
>   drm/amd/display: Disable CRTC degamma when color pipeline is enabled
>   drm/colorop: Add DRM_COLOROP_1D_CURVE_GAMMA22 to 1D Curve
>   drm/amd/display: Enable support for Gamma 2.2
> 
> Chaitanya Kumar Borah (1):
>   drm: Add helper to extract lut from struct drm_color_lut32
> 
> Harry Wentland (29):
>   drm: Add helper for conversion from signed-magnitude
>   drm/vkms: Add kunit tests for VKMS LUT handling
>   drm/doc/rfc: Describe why prescriptive color pipeline is needed
>   drm/colorop: Introduce new drm_colorop mode object
>   drm/colorop: Add TYPE property
>   drm/colorop: Add 1D Curve subtype
>   drm/colorop: Add BYPASS property
>   drm/colorop: Add NEXT property
>   drm/colorop: Add atomic state print for drm_colorop
>   drm/plane: Add COLOR PIPELINE property
>   drm/colorop: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
>   Documentation/gpu: document drm_colorop
>   drm/vkms: Add enumerated 1D curve colorop
>   drm/vkms: Add kunit tests for linear and sRGB LUTs
>   drm/colorop: Add 3x4 CTM type
>   drm/vkms: Use s32 for internal color pipeline precision
>   drm/vkms: add 3x4 matrix in color pipeline
>   drm/tests: Add a few tests around drm_fixed.h
>   drm/vkms: Add tests for CTM handling
>   drm/colorop: pass plane_color_pipeline client cap to atomic check
>   drm/amd/display: Ignore deprecated props when plane_color_pipeline set
>   drm/amd/display: Add bypass COLOR PIPELINE
>   drm/colorop: Add PQ 125 EOTF and its inverse
>   drm/amd/display: Enable support for PQ 125 EOTF and Inverse
>   drm/colorop: add BT2020/BT709 OETF and Inverse OETF
>   drm/amd/display: Add support for BT.709 and BT.2020 TFs
>   drm/colorop: Define LUT_1D interpolation
>   drm/colorop: allow non-bypass colorops
>   drm/amd/display: Add AMD color pipeline doc
> 
> Louis Chauvet (2):
>   drm/vkms: Pass plane_cfg to plane initialization
>   drm/vkms: Add config for default plane pipeline
> 
> Uma Shankar (1):
>   drm: Add Enhanced LUT precision structure
> 
>  Documentation/gpu/drm-kms.rst                 |  15 +
>  Documentation/gpu/rfc/color_pipeline.rst      | 378 ++++++++
>  Documentation/gpu/rfc/index.rst               |   3 +
>  drivers/gpu/drm/Makefile                      |   1 +
>  .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   3 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   4 +
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 768 ++++++++++++++++-
>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 208 +++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  36 +
>  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  26 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  39 +
>  drivers/gpu/drm/drm_atomic.c                  | 170 +++-
>  drivers/gpu/drm/drm_atomic_helper.c           |  12 +
>  drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
>  drivers/gpu/drm/drm_atomic_uapi.c             | 159 ++++
>  drivers/gpu/drm/drm_color_mgmt.c              |  43 +
>  drivers/gpu/drm/drm_colorop.c                 | 600 +++++++++++++
>  drivers/gpu/drm/drm_connector.c               |   1 +
>  drivers/gpu/drm/drm_crtc_internal.h           |   1 +
>  drivers/gpu/drm/drm_ioctl.c                   |   7 +
>  drivers/gpu/drm/drm_mode_config.c             |   7 +
>  drivers/gpu/drm/drm_mode_object.c             |  18 +
>  drivers/gpu/drm/drm_plane.c                   |  59 ++
>  drivers/gpu/drm/tests/Makefile                |   3 +-
>  drivers/gpu/drm/tests/drm_fixp_test.c         |  71 ++
>  drivers/gpu/drm/vkms/Makefile                 |   4 +-
>  drivers/gpu/drm/vkms/tests/Makefile           |   3 +-
>  drivers/gpu/drm/vkms/tests/vkms_color_test.c  | 417 +++++++++
>  drivers/gpu/drm/vkms/tests/vkms_config_test.c |  47 +-
>  drivers/gpu/drm/vkms/vkms_colorop.c           | 120 +++
>  drivers/gpu/drm/vkms/vkms_composer.c          | 135 ++-
>  drivers/gpu/drm/vkms/vkms_composer.h          |  28 +
>  drivers/gpu/drm/vkms/vkms_config.c            |   7 +-
>  drivers/gpu/drm/vkms/vkms_config.h            |  28 +-
>  drivers/gpu/drm/vkms/vkms_drv.c               |   7 +-
>  drivers/gpu/drm/vkms/vkms_drv.h               |  12 +-
>  drivers/gpu/drm/vkms/vkms_luts.c              | 811 ++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
>  drivers/gpu/drm/vkms/vkms_output.c            |   6 +-
>  drivers/gpu/drm/vkms/vkms_plane.c             |   9 +-
>  include/drm/drm_atomic.h                      | 111 +++
>  include/drm/drm_atomic_uapi.h                 |   3 +
>  include/drm/drm_color_mgmt.h                  |  29 +
>  include/drm/drm_colorop.h                     | 462 ++++++++++
>  include/drm/drm_file.h                        |   7 +
>  include/drm/drm_fixed.h                       |  18 +
>  include/drm/drm_mode_config.h                 |  18 +
>  include/drm/drm_plane.h                       |  19 +
>  include/uapi/drm/amdgpu_drm.h                 |   9 -
>  include/uapi/drm/drm.h                        |  15 +
>  include/uapi/drm/drm_mode.h                   | 134 +++
>  51 files changed, 5014 insertions(+), 94 deletions(-)
>  create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
>  create mode 100644 drivers/gpu/drm/drm_colorop.c
>  create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
>  create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_test.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_composer.h
>  create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
>  create mode 100644 include/drm/drm_colorop.h
> 

