Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8ABB49695
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 19:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5DD10E585;
	Mon,  8 Sep 2025 17:10:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wRlDT2tv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8F410E57C;
 Mon,  8 Sep 2025 17:10:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZxT9Dv/JuU/tFUiiYudKrz7wH6t0b6/6QuPaO4WOUDUdF19JRiJtKY7IwR734wSBxp/pxB3BIU3ViM9QP+jlD6dZPsAGwRAkW7Yp6WE5N0n98J4Ki5GF0CG3CZWUybX4lAtIWJIoOONYvOe1yBu7i5sWqu6Im68qkMPcLdLkL6vCkVzwvcdZiEPSvDkUUNRewSikYPT78mKkRhV++c0pOb1OwzCJDAY9G/4h8uNPc/p7w829qfib0/a+JKSxlafCZRA/4iOnKhNhEhayiZzNd80aI9HMO7VC/7vniO8rbTlCl1yL/R9wd86bSdu3/qu7C5DlXVugSdblVjBK1WiZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZoE+ztEfJOCUipTW2PsD+usM/3x9Is0Ft/lAt+VcD1g=;
 b=zFwNkrmSbWZsSDGaJkfNbajaMTeGlLDScZC33g1aqWWYWxy2fs55UJK4EIsCZfw9Yytts7ZpOks2Lk1kvFbTxTs5kJsARhwJAXGiYf57SRpDGOaI+anI7ofWpsZXR0V5SLvnoKyXJ+cfaj4JkcsCKfZtVo8tcT90xvy6hj0RJDmRSLqg0yj1+NwH44foAZoWdU7auMWVX5LLijuIoTj5M3W6O5iHfIKr1bzBbhR3E0zv4aW1nFZvYWGKC1PVhGMawAirv1lAEkuVfDZL/IIdVsHeJzThe2yDrQVlfWJ++Luuaubv55KBiXET/SNBoP6eJTT4K0vza9f5e4oGq+6vtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZoE+ztEfJOCUipTW2PsD+usM/3x9Is0Ft/lAt+VcD1g=;
 b=wRlDT2tvSeD+1uawUHBbCB80h4QmO8C3fIJetS2/HUSvQCJcZi2EUDL2Ez33ky0awKmmV6r+bFfBrymsvRjCvcorgCnnfkUhPOGFV+5p84TqGyFuOOgfwAsTM8i6wzYQciR5aAbprP70KO/7ND0OG6SU7p/aBczjV9th1XHSVDY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CY5PR12MB6600.namprd12.prod.outlook.com (2603:10b6:930:40::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 17:10:34 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.9094.021; Mon, 8 Sep 2025
 17:10:34 +0000
Message-ID: <0ed3fa16-9e0d-4f8d-ac22-c9f6b541ae8b@amd.com>
Date: Mon, 8 Sep 2025 11:10:30 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amd/display: Optimize remove_duplicates() from
 O(N^2) to O(N)
To: Kuan-Wei Chiu <visitorckw@gmail.com>, austin.zheng@amd.com,
 jun.lei@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch,
 Aurabindo Pillai <Aurabindo.Pillai@amd.com>
Cc: zaeem.mohamed@amd.com, wenjing.liu@amd.com, chiahsuan.chung@amd.com,
 Natanel.Roizenman@amd.com, Daniel.Sa@amd.com, jserv@ccns.ncku.edu.tw,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250824182359.142050-1-visitorckw@gmail.com>
 <20250824182359.142050-3-visitorckw@gmail.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250824182359.142050-3-visitorckw@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0105.namprd04.prod.outlook.com
 (2603:10b6:303:83::20) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CY5PR12MB6600:EE_
X-MS-Office365-Filtering-Correlation-Id: b99abcf4-679d-49b1-b644-08ddeefa9f9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEJrKzhIK01vZTN6QmlDcFVmR2VGdXVkM3l3RTR5MmRaTkJIMTdwbGNTV1VP?=
 =?utf-8?B?ZW5uTEphdUpMTVF5UWZrY1lnOHI3YUZpRlg1eEtEUnhlNEJlbks4a2dhT3p2?=
 =?utf-8?B?ZXNuckZ6ZFg0QmpyUEVmMVpObU5iQk5QTCsvYTRaa3hWb2hhNmNtUExJMlEv?=
 =?utf-8?B?UjNINVBRZmwyYVI1aXQrSHY3UGlhN3AyNEhZRnM2bE9aVXp5Nk80YUpRbWIx?=
 =?utf-8?B?dFI5RWtRbWF2WTJOZTljd3dtajRsQ3dQVkQ2UVVVaWY2Z0hjbWduT1lCMVpk?=
 =?utf-8?B?Y2o3VnU4QUs5Skd2VGFoYi9xQkdJUTAzanhSSDlDSkh3UWFJbzdGUzdOVFls?=
 =?utf-8?B?UVlOZTNBeEZqK3RXSzhQTlNncmhyTHJXYXBBeW1nWTQya1RxZWpNSkRPR3NB?=
 =?utf-8?B?MkNCOGU4QXRKZndSLzhzQ3RIRFg1TjFxSXZoOG5Lc0Uzak1vUEJNN1pZaU00?=
 =?utf-8?B?aEJneVh3TW1JZ2NXaGVReTFtNFQyUXBxYm9OSk95ZDNLMFFWcXNWdDFpUEo1?=
 =?utf-8?B?LytFZG9RMmdOVDcwU2YrNHQxVHAxUDFXMmFiSlpjK29xekZHbk5sY1YyTExX?=
 =?utf-8?B?eVM3b1VsYmRkQlArNVBIMXN4L2ZiWXk4SWpHR3Z5azBTVnJZUE1NaHRIQ0Fr?=
 =?utf-8?B?cmg2VU9mTU4xTzc4L0c0eGlSVjRjMThXUDVQU3NiRmQzRXZnWWhMVW90YkU2?=
 =?utf-8?B?V3BlMG5SM0dNR2dFNmJXU2JzMG5pem5TdUZ4cThkU0t0d09uNmw5U2lDcEVB?=
 =?utf-8?B?Ui9KV3RHdEdGOHh1WlZ6ZkZydG01aG5MK0ZnZE9YR1k5Z3JBY0N1OHJvWVJS?=
 =?utf-8?B?M010WTNKa0prVkw1bHExQnV4enlQVUxHVWZYWTFLTG1xdWsrRFU4aEFCbC82?=
 =?utf-8?B?SFZUd0NNbzR0NHNxUHpaMzJRL3ZzYmRaMkh6cDU5eG4vUXdWM25lZDAzNHJq?=
 =?utf-8?B?VFoxaDNZOXFlTmoyZUhXY2d1aVhtV20vcERyOC9Wc2xGMitiNmlxSVNHdVFW?=
 =?utf-8?B?TnVPWjhBajZqZUFOWlZCMVFOZWlVQS9rS0JubnJNdzJIL1NHc1VaaG4yY2NQ?=
 =?utf-8?B?dkg0ZjFTQ3VaQm9scmM4by92NXlyNXlqRnJZNUVHYzR4dy8wYjFGczduRGFF?=
 =?utf-8?B?TjlGRWhYVDJuWGc2Q3l0NDJSYkxPR1VCaWlTOGVVdUx5dUdkRnZhSWJXZktJ?=
 =?utf-8?B?d2hZUW9LMU5wSThJKzViT1AvT29xWWJtU0Fyak0ybFh6ZDRjM3F1VDhETFpr?=
 =?utf-8?B?WWRaMmtBaEFHd3piaTFXdFVqUzhyMFhBTVAzV2s1cy90ck9XakphSm9nQjRi?=
 =?utf-8?B?Yjl6NjgrVStKeHIwdXBoTVJmQWlvTjRHUjhhYkpOMHNiNlhvSUVubTBFWGJP?=
 =?utf-8?B?QVpkVkgwS3pKU3J0R3ZZMjMwbjlwMkZadE41YmdXb0JVTUwycm9iaWdUSDd2?=
 =?utf-8?B?bVV4R0lVZ21pT3djeDc3UWFObWsrSHJPUzVVMnRiR3E5aVdyQ2JzSTFoYytD?=
 =?utf-8?B?emhYRFVtYk02TG9jTHNWVkk0OG9jMUc1ajFrOStCNnMyRjQ1ZmJIYklIYjRH?=
 =?utf-8?B?bFY5aWdSaklGdVRoNDcyZXBON3F5RUdSenNmNzVZMnJPbFpQYjh2blRyMHNX?=
 =?utf-8?B?TUYwUkdhWURUZ0NXaWJWdGVmWjJoR1oxMXJVbkxaYVhPUEZCQmlaL3hscDZW?=
 =?utf-8?B?dyt0NmRlc3dEZEJXWW9uZUdhdElQU256MXJ5MnRjOEZkWmV4T05RTzJpekY3?=
 =?utf-8?B?UllkYXZ6c2NSU0VYMWRxc3RNZWxpYStkU1Y5ZERDVm9tbm9oWElYMUlsMUwv?=
 =?utf-8?B?TksyVy9BT2xJY3ZiMEVoMzFkc2x0WjdISVFLMVB5VjlxY0xCVjRUWGR0enYy?=
 =?utf-8?B?R2lIbitleExWUWhNamhBSTExVVhEdVJNYjFxRGRhWk5nMGVQK213Y2JIaUlV?=
 =?utf-8?B?S2pzQ0RLRmtjRWdKRXlFdkJJUjM2Z0x6ZzVEaGNoc1pBakdyNVJaVEoyNk5W?=
 =?utf-8?B?WlZlMllHVURRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(921020)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VE1Vd25XT3BTOVh0S01LaHVKMWk2Q2IvQzA0MjFFcm0xY3pQYmpRN2I0anB0?=
 =?utf-8?B?Vit1VWVrZXFSamJJWWdFOXNTMVlORTZIbTcrNmJhVVZ5eXpUOW1oYnVQd25D?=
 =?utf-8?B?WjZsUEt0am9wR0JOUmhSNUFWSVRHaGVPZnpuYTZIMnQyUTh3azl2Q3BVcHpm?=
 =?utf-8?B?a1VCUSt1TUQxS3doMlUrSVMwUUVMSktwUHVMVHZzc0Y1QzVkUXF2ait0M3hT?=
 =?utf-8?B?dnJ1b0dFWGROSGpFRlExT2JPL0d0cmZkekZHNGM1a20vWHluVG4xUHRyNGMz?=
 =?utf-8?B?V2tXY0Y2dnlJQWJWaVRHNmQvdzlsOEl3UUEvMzVHcll1WlZDckZ1RC9YMkJP?=
 =?utf-8?B?NXY2dkJPNk1SUk9mdFBFaTZFMGZmQmd1KzZQUGt0ZjNnYlhnRmFtclcyemZU?=
 =?utf-8?B?aU55VklBVCtKZlk3SitQZlVxcU1uM0hHTnUrMGwrOWdSVGs2b3NjTXZxUENL?=
 =?utf-8?B?QXIvcTFHT002VjVMM0RyK25STmxZb09IZ3Fkck5abzFwbWRZMGJENW50S3cw?=
 =?utf-8?B?US9MNVRUVytsNzNEYkhONXVOUk9sMjRxL29HUkdjd1dkZnFhQnRPaXB2cjZY?=
 =?utf-8?B?QVZvQVJQaGovcmp0UmVwRFFZeDhzcHFpVExnT29nZDlydk1MdGVhK0xkTk1u?=
 =?utf-8?B?WEJLR2tLLzBLei9BZXg3SjlJeHVodU1CaUlTbXdjYkxTb0Z5VEQzaUxrR3Zs?=
 =?utf-8?B?QmF0bGpHSm1CUkZkb1lvcmlGTVQ2UmZCNG1xc2NEN1NEUUhBMlIxU0gvVW1r?=
 =?utf-8?B?RE91OWdBTFZpc0RFeTVLRk5LR2xLVkZJOUlHT2labzZ6ZFVWMFNYR1Fmc0pq?=
 =?utf-8?B?TEh4RHc5NTZMbkdJdlh3Z1UwSExJeW5wNW5IT1hCZXdVbk5zUVV2K3hlVkpy?=
 =?utf-8?B?cU9aQ01Dc00yQW1xM0lrR3d1RGlVVmx5LzN0OVN3L20vcFo3ZkRSL2FQV3hh?=
 =?utf-8?B?TjRGNnVsU0EvOFEvWEpkUTg2QmVUWjk1UGd6QjFjQjVzejllUzl0QjhMZS9Q?=
 =?utf-8?B?Z29adHZ2b1c4V1ZwWHJKWStrTFNLSEUzV1FKVFpXVE93S2RQdzl5VS9TZFNh?=
 =?utf-8?B?bEY2WCs5dUhiL1hqOWVSbEVVSVNEcWJEMS82NVgySTlhL2podUgwVkowUUxm?=
 =?utf-8?B?TTlKdWdwNlkwVDIzOVZtT2Z6ditHckdWdmV3UStxS1NtbDdBMEhtamFOeDZC?=
 =?utf-8?B?ak52VHBEbGhRTXdHTzdGR2pBNkdoSHQ1elBOeW5McmtpdklRTmlCaVpaNnJq?=
 =?utf-8?B?R290bEl2eXNVdGhzRzRsclpMa1NBV2Rha21oMUNWQXV6alpONEQ3MFkxS2VE?=
 =?utf-8?B?UDhhaysxOVdsN0JJTG5uYXpmK3lzTk5JWEh2NFdJVmxhMFM5bVNVb251cUk1?=
 =?utf-8?B?NHV2WGU5cGd0V3VCaHRYeG5DUlQwaVFEeWY4Q1M4VXgrKzA2c2lqM2MwZ0VY?=
 =?utf-8?B?bDdTOGFZaVUrcW41NWl0OFBkZGs3UEkzS1krYWo3am1xZlh0WHJ0QmVjQzQ4?=
 =?utf-8?B?TUd2YlZJVUJkWWFtOFo4SDNaOElVaTZzeWpTczZFZjRTZXBlZUZVaWwzVlJr?=
 =?utf-8?B?M2Ixcmx3b2lsTnM2RzRZRmdGR085WXBRQXhQSW9vUVhtclBCemt0c3h1Wjgy?=
 =?utf-8?B?Uys1SC8xRjhpWjV2cXFidzZpblhoSmFMbUZPZ3NvdjNwT3Nvb3NYaGRYOUdx?=
 =?utf-8?B?aEJ1ZUpiNUFDUVhBMWxvN1VlRjJoY0tYRGwwTG90V3Exd3BrYVdjN3o4TVVH?=
 =?utf-8?B?eks0Y2NIK3BVTjQ2RzRyNHNSV0M3S2ZYejVJMVNHQ0dyOXFYNW9QT3dVR0Vp?=
 =?utf-8?B?Z3o3UjgxbU90cWFRZUtYdWl0cTNtU0JyTWxIS3RuNXJZSE1HdzJKTTNwK05n?=
 =?utf-8?B?Qy83QUk3Q0l5clNKM2J2ZGV2dW9yMXpnRytnUTYyaGJ2S2I3SStYZGJzc1Bz?=
 =?utf-8?B?amFneSthcEx4R2VJQjJXRXlNTXpaVlRkSnpBb0tJSDkxeS9xQzMzK2V1VE82?=
 =?utf-8?B?RHAwYUd4b2lQUDFiZkVHMTFhcTYxUHE3L1p4WkhJNHdyU3UxZjVmakFKSFA1?=
 =?utf-8?B?bkgwSDFqNkhoSlZCVU8rS2ZCdm4zcU4xTy9Ra3J4cWw3QlAxVVFKNjhCUGRh?=
 =?utf-8?Q?HuFZQplIG8FanykK/Wzxoniw/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b99abcf4-679d-49b1-b644-08ddeefa9f9a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 17:10:34.5978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ribQ7XJXHX/LDC/zTel994s0dYA9jsZfSEUrItkdlsCaTIcZq1BPvPtcoi3Tb+DEF2sd1SNtayCyV7AaL/y2Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6600
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



On 8/24/25 12:23, Kuan-Wei Chiu wrote:
> Replace the previous O(N^2) implementation of remove_duplicates() in
> with a O(N) version using a fast/slow pointer approach. The new version
> keeps only the first occurrence of each element and compacts the array
> in place, improving efficiency without changing functionality.
> 
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> Verified correctness using the following simple unit test:
> 
> double arr1[] = {1,1,2,2,3}; int size1=5;
> remove_duplicates(arr1,&size1);
> assert(size1==3 && arr1[0]==1 && arr1[1]==2 && arr1[2]==3);
> 
> double arr2[] = {1,2,3}; int size2=3;
> remove_duplicates(arr2,&size2);
> assert(size2==3 && arr2[0]==1 && arr2[1]==2 && arr2[2]==3);
> 
> double arr3[] = {5,5,5,5}; int size3=4;
> remove_duplicates(arr3,&size3);
> assert(size3==1 && arr3[0]==5);
> 
> double arr4[] = {}; int size4=0;
> remove_duplicates(arr4,&size4);
> assert(size4==0);
> 
>   .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c | 18 ++++++++----------
>   1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
> index 2b13a5e88917..5100e0e7af42 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
> @@ -50,18 +50,16 @@ static void set_reserved_time_on_all_planes_with_stream_index(struct display_con
>   
>   static void remove_duplicates(double *list_a, int *list_a_size)
>   {
> -	int cur_element = 0;
> -	// For all elements b[i] in list_b[]
> -	while (cur_element < *list_a_size - 1) {
> -		if (list_a[cur_element] == list_a[cur_element + 1]) {
> -			for (int j = cur_element + 1; j < *list_a_size - 1; j++) {
> -				list_a[j] = list_a[j + 1];
> -			}
> -			*list_a_size = *list_a_size - 1;
> -		} else {
> -			cur_element++;
> +	int j = 0;
> +
> +	for (int i = 1; i < *list_a_size; i++) {
> +		if (list_a[j] != list_a[i]) {
> +			j++;
> +			list_a[j] = list_a[i];
>   		}
>   	}
> +
> +	*list_a_size = j + 1;

A corner case needs fixing:

When input *list_a_size is zero, it will be updated to 1, unlike the 
original code. Maybe a early return when *list_a_size is zero?

Hi Aurabindo,

Do you have other comments or other concerns?


>   }
>   
>   static bool increase_mpc_combine_factor(unsigned int *mpc_combine_factor, unsigned int limit)

