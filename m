Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7019E6FED
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 15:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0246810F0FA;
	Fri,  6 Dec 2024 14:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MecxJLX4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2075.outbound.protection.outlook.com [40.107.96.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A9010F0FA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 14:17:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBkTGHzB9JbYtE8eU2vGcDBJpX9GGMdDoZzga9c0EpqLwlu4Dua+LI97c9uteQkb1nkkDtzgZXlDt+FhaVVM+JyTioGASApUo7o9J2F6+OylPZl2nf3UKpwSSpEnLFxlUuC+F+Ltns1j/J6Xdp1SnomEYgtOgb1JkoRrg7e7zayexACNWOBr0jdpaby+nszdfMnSAfsS+/f0VeOz7mP34Hckpz2bGZ2KmEKvBzkwxxf1GWU1iuTXTB40whbLhq7bkm7oK8ygn2NDpr2S/PWF+98nFAZqlsK0wPPmJQOYIMedDzI2e8VPdQmLBg+63EbIzINF5fLfhZIXHd/KzM1yfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJUSnFHi+9iXUPU74PmP16StasbR0+kNNlTVmvTl3DA=;
 b=WeMMiSbCbBsPWxemyRTFaPXjrdXBjF0eEoyNG2xVmjpW3C2Oe+oOQd64V+KlckfbW7jG1JDsOEMI1wGtciLO2Lg7fTc7ZsNih8+Zi7U01aWSthe1s+aOOPxsHNmQiFd9cH2he8Kz0MjnKIesVumSYL+9MNmukGIT6yhCsYDDvZF10XEtZuxy8IQS78RE7g9ycfRI/UeNZp9V7ZWyJ6/0GP1GgAFAx2rChKaLOjp/rQBWg318Bd+H1QeCGnzcOIBCfNKW0Sk+PNtlPasyUM+hHd4sqDP2FN45TV3M8M6ML6bVXOuRJex8+Y03gnoR+q7M0RFeqYxvPuN9GOnvgsDvqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJUSnFHi+9iXUPU74PmP16StasbR0+kNNlTVmvTl3DA=;
 b=MecxJLX44yhNSGINYSUBdgsgDKni51XN0s+T5l1CR2nM6+IflsKd6d3e2dck2hcx2PYtXqQ5oadlp9qYHq2GSnbYLX18FCp70qEn8Lrqj8KTJQtPVcthP/BAsKEfcfHbUUvkL03Fk6GYNGofKpIQ0GmIUrBaSqZ3cr7Uo1M0f1E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4189.namprd12.prod.outlook.com (2603:10b6:208:1d8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Fri, 6 Dec
 2024 14:17:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8207.017; Fri, 6 Dec 2024
 14:17:39 +0000
Message-ID: <4df589b6-93be-40eb-a918-ec26f93b923f@amd.com>
Date: Fri, 6 Dec 2024 15:17:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/vc4: Clean-up the BO seqnos
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241206131706.203324-1-mcanal@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241206131706.203324-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0388.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4189:EE_
X-MS-Office365-Filtering-Correlation-Id: 156b4a87-a8b2-47a1-9906-08dd1600bd71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHRwWjlNU2hsN0kwRCthYVdEMlBZZzFEdGcraXhsSXBoSEo5ZXNYbU9IaHNq?=
 =?utf-8?B?UkVzNkNPaTBaM0NkVWFGRDVEUmZEQU0rVUMrdE5KTmFsczREbG5ua3ZQVXRy?=
 =?utf-8?B?TXZaV3dhSGV5RXVkbWQ5cnJEK2IrOExjSXdaa2VBRC8wbGpvSXA1c1kvOS85?=
 =?utf-8?B?UEdFTSswNEQ0aFR4SlZBazRoUDZKejFmaW0rOHdjZ3JCTDY4U2xUd2R1eVpK?=
 =?utf-8?B?UmlaNHNoMHM3cHBoQVFUaHpXQ2FhdzB6UEw0NWxQdFdJenJvbHRvQzQzemNw?=
 =?utf-8?B?c2Vlc1R6NmszM1dGMFNON0JCa3J2N2N5Z1U4enBDNDVmYXBwanV4a3VtREhI?=
 =?utf-8?B?d3RvYnRRZ0lxM3J0MnhQR3BVaEx2NUtiQXJWL2NVc3NNeWNBeGhleHFXcmJq?=
 =?utf-8?B?bUFxTFhnZVVDYWlJV1hRMWhLU0NHZDlOV0RwaE9lVDlaUXNoK1BpSDVVc0ZB?=
 =?utf-8?B?T05vc0MzSng5YUNQMkdDd2dFTTZ4aVVUb2JrMzJLcTBUalNCc3pPTFJKM2Zx?=
 =?utf-8?B?aUYwVmVHU1pneVdsK1hvS0VNaHU5QWdvdmF5VnlsSDdBL1RQNnVpM3V4Y25U?=
 =?utf-8?B?SzVqaVJ3YVQzRG9MVzFSUmg3U3gwcHg5ZHdwYzdQc21uK1I2WjdkWEJSOU0w?=
 =?utf-8?B?WWljQm01SGlQb3JJeGRBOHdOU210TVVyRXVNcjA3U0Y4Y1Vja09jaTM5d2J0?=
 =?utf-8?B?SmZOSkwySUhyL1hod0FXL0w5K281WGF5UHR2QUczZXo5eTBKNjdhc1ZRYmZK?=
 =?utf-8?B?Vkx1ODdBbzM2RnlYVU14MnJYajRtRVdQYnBhREY2RzJkYXJKQXQxdkZEOERO?=
 =?utf-8?B?SjdYOUlTOElYc2RZUEYzN294eFIySzJieFp0WjhGaTN3VklIMFpZdVMwekd5?=
 =?utf-8?B?QkppZFg2U1RHTk5pbW5HbHA0OFBzMzhyclBRMDRtTmltMDlGdTB6RklnbVpz?=
 =?utf-8?B?dldlRzVEN0pyZUdmZUoxNXIvblhDRXhBTmxFYUpGQ0xjeU9VcDZCWWkwWnNs?=
 =?utf-8?B?N0htUTJlOW84OUhHSzNjY3VNNXBRU28rNXB2L3kxVXRtQ2wyZkhZbkxVckFM?=
 =?utf-8?B?R1c3TkhuTDJBNzQvTXE4RDdPcFdrSzJ6Ky9ZTzJsaDFFSHlkMytLS1R5ZHEz?=
 =?utf-8?B?bVFpR3F3bmFBbldQR1lDMXdqaU9oOFZBVmpUOTk5L1FXTEx2YTBzaVBpUTJL?=
 =?utf-8?B?ZW1ndTc2eis2R0doekRXOFYwejc4aHFPWXZDdDhzWjJROUowb2FFc25vY3ZH?=
 =?utf-8?B?cDNNV25ETlZMQzlwK3FtTzRCenlRL2NHdGk4aHMydE1QYjVUemlzcDlOdnNz?=
 =?utf-8?B?K0xsNk03RDVXWGJLVmd0bW5kMEpqL1I0eVQ2T1ZDL25vRm9ma0tFVE9GQ1Vn?=
 =?utf-8?B?UFgwcGdaZXZ3Tys4UkFOSVREUHduWndodVU3Rk9LemtUL1kyTHc2YzlrM1FX?=
 =?utf-8?B?YzVobjJxeEFzRDRPOXB6WnRkT2hnc3lTRVR5bThQYWtpQTdEZCt2a1FIVVZi?=
 =?utf-8?B?em13RkdvOThpV2l1Z29aQkVZcEdnNXBVSU5takUwWmsxWkpZVDYvQTRSbS9P?=
 =?utf-8?B?enBIQWNieEFxWkZHanhLYi9jYjZhWnVUdjdldFZYSi9DTEVtajYxbUExTHR1?=
 =?utf-8?B?ZWZQSlVXSTVKOVBLQko2Qm8ySDd4dk9UbFdEMGVsNjlFL3l2MDVnKzdZdEYw?=
 =?utf-8?B?SXM0cUlQU3R4N0IxcUpSN3JUelM2SVcwMWZRRFg3MWJieS80enoyeXBZTkds?=
 =?utf-8?B?bSt2TGdxckZCNG1SVzd1b1JLSzQxdm9lUUNjT0s3R1dMci9oRnNwdTNFTm9h?=
 =?utf-8?B?YlJIN0E4YTlVenVVYlN4dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXVJb2loRVZEcWI1cXg4SnhKRGZTbHZkRnU4ckJrRGNlOGdUbEwxSXl6M0k5?=
 =?utf-8?B?VXpJQjJZWWpsa0tvdkMyWUhYUFR0RWRqTFZ0alVhdk9nOWdiK01sWjRSN2px?=
 =?utf-8?B?M0J5MXFwRC9iZ0g4bUFhSkRxd0lnaENjWU01TlM3N21JMVVhclBOenFZYTFV?=
 =?utf-8?B?NTd3QzBKN1ZtbFMzbERWb0xQb3VMRjhoVWZLeVlUSXBJTzhWY1VienA3ZXBS?=
 =?utf-8?B?aUZkMzhPblB1dWlselYyYlBvWHYwNXdDSzhlaTNHVGRGd1lod050bmpJazVT?=
 =?utf-8?B?ZjJwQ2kzYnlSTGVqZVJ3ZzY3N25BWUt0NDNUcEVXMUxHWkZZdWRLN2thMTFX?=
 =?utf-8?B?VTBTSzhXQ1I0aXV1K0hlN3E5NVhEeXVRbytvL2ZpYVRLL1huRWxYWkwzRmhn?=
 =?utf-8?B?QUhXVnVZckgxMWxXcStNWkZza09uRyt0Sm1HMXgwZG5PL1ltUXJxYzk4VVc5?=
 =?utf-8?B?Z1JMQ05DRXRqdnFyL2p2WWlwR0hKRE41Zzh1OS9oaVNMSHZYV2d0am4yNWJr?=
 =?utf-8?B?d01Fb3g0bVR4Y2RsaG1keE1xa3J3VFhFMU1wZ3pzenZpTk1CUEloU1RuY3Z3?=
 =?utf-8?B?eDlPNW5RTFZMUGUxYkYzVnkrN05uWE9jQTlrWG55MDI4OFlHV0dBK05tblJr?=
 =?utf-8?B?UlI4WTZXOG4ydFc2cWdzdDJzaDZVSVJPVHRKZUY1VEpLeGFxUHZLMGMyME9U?=
 =?utf-8?B?Z2M2bVBRUXNqQmsybkt3NHVTZnVaQWE2bU9YTkliZTBReXZFaXl2VUR2aysv?=
 =?utf-8?B?OUs2LzZPQ3c0b1ZUOU0rNnpTRkFhTnAwdXE2akhrN0E0YllGSGlydkxLNEtD?=
 =?utf-8?B?Q2JwSFhTZEtIc3BhTURzZkpNVGltQ3kyRnNPd0VNeWJ4NERUMFV2UDBQci9l?=
 =?utf-8?B?Q2ppMzVYNHpVUi9sVVpqZkxNUUphampmakJqSlhXSkQvaWVZUGhPNHFVcldU?=
 =?utf-8?B?SGVrVGw3ZTJVVUQ1YVhweXBHai9vMkJsaThrOU5MVnl4aE54dDdCcE9tRTdu?=
 =?utf-8?B?anJHY2lzcEhJWkM1TDhoTVVFbDgxR1hQVkpqYnRXcllza3RLQXFvcjdUUHJq?=
 =?utf-8?B?UFQ2M21FQTBhblFqQTJtZmFPMUpkZWdZQXhKWkR6bFRwMHNYSjJyWnZ0bDlS?=
 =?utf-8?B?YjRzVTVVQU9Fc09ML2w3cWxZa1dpdmRUcVpXMnpCZWVPL1lSSEY4YjJJQUt1?=
 =?utf-8?B?ZXhSazUvZ3lmOW05SkllUHE4MGo5cDRWNFZuckpvRWdVUWh0U1NsL1hwdFFL?=
 =?utf-8?B?K2pIUnhjSHZlbVVHaVgxVXBrY0FaWE1VMWtjZVBXYW92bXhmejVtejM2cGlG?=
 =?utf-8?B?MWVjNVhPcFM4NzRzbWFWTVMvczRiM2hjYnczb3ZlTjJQK3hGa1BRcG9sOVUw?=
 =?utf-8?B?RFRnUm53blpFN25OSWdxTzdSVFZRVTgrRkcwYnpxSEpoSENCSGxGdnFzTU9P?=
 =?utf-8?B?dFZJSkFNQytIeW16em04WEFOMzZadVQvNEF5RFFiYy9FWm5oRndMVHpDVHBL?=
 =?utf-8?B?Nk1DeTJuNkk0OFczM2JuRmp4dkJFbjJESFA0ZmtZeEEwR3JpMVB3RXltcnFJ?=
 =?utf-8?B?ekZMdTlIWjFacUFKcEhMdjQvSE0weXljQU8xV2xYQ29KYjJzYnA5RHZyL0Zl?=
 =?utf-8?B?T24xb3oyaW1XazgzVUZXTnNoeWRpVW8rVjhFcXFXcHQzN2RuVVd1VFE2Tlgr?=
 =?utf-8?B?ajI5Q1lqV0xrdStPZ0Nab0Y2Y2g4aEpZS2FLcDB3dGJJeURtWWJVbWFWcUNj?=
 =?utf-8?B?d2JUOGRKZlRkZHdmZUlQbFNLY3VIenVPSDhzNTdqeFF1MW1VQ210dTFBQmQ0?=
 =?utf-8?B?N1FMallhMk9DNGh2Mkw5N05Ja2FrWnlOc0thQStFNGZWUEZ1NTVSSGhaRE91?=
 =?utf-8?B?cGhUeFVoOGJvSjkyTWpjcEVxWDNVNXcxeDE5NGxZbEhZOHJkT3Q5V2FJRzU4?=
 =?utf-8?B?RDBNckRRUkxzUHIxdzJwVTZtZU41WDFPQ2hSUlhUd205MmM0eURvalVYWklY?=
 =?utf-8?B?aFl3MGhqZEtRWk5ONGpHUXMwclhKcCtMUkthZVRueVhmUkd6em5jZ1lVM3hD?=
 =?utf-8?B?cUUwOFlqdEFVRXM4Y0tqZDZJcGh4QXovTjVaamE2c2FhdFl1THBaOVpQcTY4?=
 =?utf-8?Q?FM5pBlg4XFbLABHBc94TZDi+w?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 156b4a87-a8b2-47a1-9906-08dd1600bd71
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 14:17:39.3992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7mlGJSfXO0i6jex+P82486yYv513cLIOMPlkFjItbxuuFNZ0c+fGfd14s6Ib2y+s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4189
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

Am 06.12.24 um 14:12 schrieb Maíra Canal:
> This series introduces a series of clean-ups in BO reservations for the
> VC4 driver. Currently, VC4 uses shared fences to track BO reservations as
> several other DRM devices. But apart from the DMA reservation objects, VC4
> also attaches seqnos to its BOs with the intention to track if the job that
> uses such BO has finished.
>
> The seqno tracking system was introduced before the DMA reservation objects
> and we ended up lefting it in the code after DMA resv was introduced. This
> is redundant, as we can perfectly track the end of a job with a fence.
> Therefore, this series focuses on eliminating the seqnos from the BO.
>
> This series introduces a series of clean-ups for BO reservations in the VC4
> driver. Currently, VC4 uses shared fences to track BO reservations, similar
> to many other DRM devices. However, in addition to DMA reservation objects,
> VC4 has been maintaining a separate seqno tracking system for BOs to track
> job completion.
>
> The seqno tracking system was implemented before DMA reservation objects
> and was left in the code after DMA reservation's introduction. This
> approach is now redundant, as job completion can be effectively tracked
> using fences. Consequently, this series focuses on eliminating seqnos from
> the BO implementation.

Just FYI, you duplicated the text somehow :)

>
> Patch Breakdown
> ===============
>
> * Patch #1: Uses the DRM GEM implementation of `drm_gem_lock_reservations()`
> and `drm_gem_unlock_reservations()` to replace the open-coded implementation
> of this functions by VC4. A straightforward change with no functional
> changes.

I actually pushed to remove drm_gem_lock_reservations() in favor of 
using the drm_exec object.

It would be nice if you could use that one instead.

Regards,
Christian.

>
> * Patch #2: Implements the VC4 wait BO IOCTL using DMA reservations. The
> new implementation closely mirrors the V3D approach and removes the IOCTL's
> dependency on BO sequence numbers.
>
> * Patch #3: The central piece of this patchset. It removes `bo->seqno`,
> `bo->write_seqno`, and `exec->bin_dep_seqno` from the driver. As the seqno
> tracking system is redundant, its deletion is relatively straightforward.
> The only notable change is `vc4_async_set_fence_cb()`, which now uses
> `dma_fence_add_callback()` to add the VC4 callback.
>
> * Patch #4: Deletes the now-unused function `vc4_queue_seqno_cb()`.
>
> Best Regards,
> - Maíra
>
> Maíra Canal (4):
>    drm/vc4: Use `drm_gem_lock_reservations()` instead of hard-coding
>    drm/vc4: Use DMA Resv to implement VC4 wait BO IOCTL
>    drm/vc4: Remove BOs seqnos
>    drm/vc4: Remove `vc4_queue_seqno_cb()`
>
>   drivers/gpu/drm/vc4/vc4_crtc.c     |  22 ++---
>   drivers/gpu/drm/vc4/vc4_drv.h      |  26 ++---
>   drivers/gpu/drm/vc4/vc4_gem.c      | 147 ++++++-----------------------
>   drivers/gpu/drm/vc4/vc4_validate.c |  11 ---
>   4 files changed, 48 insertions(+), 158 deletions(-)
>

