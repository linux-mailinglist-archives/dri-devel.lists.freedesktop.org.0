Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMmAG+X8g2kXwgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 03:13:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2659EDE73
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 03:13:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C67B10E795;
	Thu,  5 Feb 2026 02:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AP/AQYMd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012064.outbound.protection.outlook.com [52.101.43.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9634A10E795;
 Thu,  5 Feb 2026 02:13:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Epgng0J4OmkDOAL705SyAT8eP1hp/RUJnn5dKZp2U8rzwpa1eSC3C7ZDFQhXrME1mUiRXH6cTe5PBbIT+DZHPJpoyGSbGTkrPI7UsH/5u0vkr7GvKAfLjKvzHX5IEOfFZRuxhA0BhomSp/00IigokoFsxmj4jUcdZSZD9soC79x6U80dLW/RTv3lzLh3SyOdtY939RBGrffYUNgWnR0H9s+Q+gHacbrrEXIWlB65ZJXevUSjC6xeWCYl+zEMug7hqqqu23vBVWB01iWn0QhhrBwhQrVn/Fz3Vab9BbGy5HInJP4sydnuEVwfcMWpE7/qiTYg5O6JrQybIfZk+KA4JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vab2i9Pywoa5ql5uDAmP/kI3lyw6KnsxshqXk4z4Mo=;
 b=fsaLy9ZQQXz/S7qqm1Rqg0hk8qLwD3XNta/QUxNt/fRx+3RC0+PR+So6+NfrbSo+ddXe8DUAJYWpZ1cmfEejszvdkL0ZCOnd552P4dpgmbH2kmaLe6t4eYBRNuPT+rM9FhEjpC6CyA7MdJwKEiqGnXygwdsoO+IhS1zI/b/XUopChTeBywVir49odo40db8z3OH66CEm74zNJNGQQ3Tp+zTfTotDJ0ZLAS8u12L+HQWxiSd9DQcyPBsCUvvniHq25psIsPCWWwWTeQkDaABZMPRSiv9ihi4guF869mOSA+pt7FVlCPIZrLN6xvpHv2u7w10HVavHNUfwH4FTZOH3mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vab2i9Pywoa5ql5uDAmP/kI3lyw6KnsxshqXk4z4Mo=;
 b=AP/AQYMdi0BsaXq16OGX0L53svaZ6HK0T1iCC2Kdvp0GVgWzyGMW8dlIAYbtksOenQdpsL89BYtvDyACp3vwXPchq537y+Vf+ELY7oXJ1TkuFAemVGYSH7URNXxJRGuwVMzwfRBwMPjV7dOlaimKfJPtmNKFXGA8OtZSyCFa6d0OW95rM44/B9zJdMm1mxNWq/YfIV47VpXGZBEy/NOXgnZavoYQ4pLc8t3NmOqMbjHHubgt6SoqCI+g2kr0sXeQPPf1oeRb/kvFfGx+DmuCXmcGyorQaLv74XzRIFxyJ6Kjw3a8YILoZo6DncTou58hmG1Bh9bQ/tdpxY39x3kUIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 by SJ2PR12MB8062.namprd12.prod.outlook.com (2603:10b6:a03:4c8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 02:13:49 +0000
Received: from LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4]) by LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4%5]) with mapi id 15.20.9564.016; Thu, 5 Feb 2026
 02:13:48 +0000
Message-ID: <11e38ec6-05bf-4ebe-9bd2-d7786699ff1d@nvidia.com>
Date: Wed, 4 Feb 2026 18:13:42 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
To: Dave Airlie <airlied@gmail.com>, Danilo Krummrich <dakr@kernel.org>
Cc: M Henning <mhenning@darkrefraction.com>, Karol Herbst
 <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, bskeggs@nvidia.com,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-2-mhenning@darkrefraction.com>
 <Z9xb5SABWcwYnV-x@pollux>
 <CAAgWFh2dHZs2D7R4ejY9sNQ+QCtLQeGGS2PNtcsm_MPeV3edLw@mail.gmail.com>
 <Z-VX3TJPI6Tgin2G@cassiopeiae>
 <CAAgWFh3c=qE+c8Q04W2NXpBLBeXC12qTKLNmZeJA65m+dTMG8Q@mail.gmail.com>
 <Z-aDWWUTN1MBI_wl@pollux>
 <CAPM=9txXG=tqrDjhXXvfQ+eMRnsVab=xz4CBOd1Nzwu3XR+DyA@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CAPM=9txXG=tqrDjhXXvfQ+eMRnsVab=xz4CBOd1Nzwu3XR+DyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0378.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::23) To LV3PR12MB9412.namprd12.prod.outlook.com
 (2603:10b6:408:211::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9412:EE_|SJ2PR12MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: ac68c256-5b3e-480c-31db-08de645c32d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkVDS3lZS0c5TTRYcm9lNG92VDJhRXEzZ1A5Sm5PcjdWQkxwelVkYUR3SElQ?=
 =?utf-8?B?RkpsWW50WndOSy9pZTVKTTM5dlRQS0F0K3pGOWVCSW5wdWppLzlWWlVOU21C?=
 =?utf-8?B?ZDQ3L3J3dDZIemd0dGMyc0pnOGpqR2xPditCeHprS0ZxMTVpWjZoN09mNGhw?=
 =?utf-8?B?Q0FuZ2pzUVBIQmliaUNQc3h2Ti9CK3JuUUFwcktUOWE1Q0xtaC9FcWM5eWpr?=
 =?utf-8?B?bG9WdGFsS3NnMHpPWkNqSmFpQnovWTZPWTlxUnlDUDBmbWZyWjRqbnhaajBl?=
 =?utf-8?B?Zkl3QnpydkNORlFWTEc1U2NWS2o2M2tnR2FzVDNXWFBTeUVsaWRTU3RmQk9N?=
 =?utf-8?B?QTRCQ2ptWWlEY0JWRmpEeFBCd1ZTRkFjUmpZZytBbTYvQWNwdHRpSzhlOGhR?=
 =?utf-8?B?eGdKMHBkSkhoejR3WXlCeStlNHJscjNjM0d6S0pWY3N0YkdzRXVJQmplamc2?=
 =?utf-8?B?ek44Y050REdTTGdsKzBtN1BBLzEvV21WS2tHRm4vTTRYVVQzaE5EQ2hhT1lk?=
 =?utf-8?B?YUJ5cldMSWF2QTRvT2pwcEZaY1ZkbTEvdTFZbmpMMjQrMVRxMU9HOEs1NzNr?=
 =?utf-8?B?SFNjWStZaU5rUldIc3RYcUNEMnR3N1FuMWJiVXY3eXZCaWNJMUpDbHg2dXlC?=
 =?utf-8?B?eFY4SitsZ2F2QXRmV1JpL2dPV0pUOHJSQUJMSUNtd1BEdE50dEZMbjNVdEFw?=
 =?utf-8?B?aWZCYmZtUXdHUXB4K29XRjRxaDlZMm5waGIvMndBbHViaTJUZmk1VTVKSTVy?=
 =?utf-8?B?VEluRzRtNjZseEhEdk1vRW4zcndnUU5rOTJxSFhJbUFZQU1sejJJVjR4NGZT?=
 =?utf-8?B?SXJjK3NwcDlLUHRHKzVUR2ltdHIrN2VscVZoMG9JQVpocHVaUHFFYWdSQ2d0?=
 =?utf-8?B?TEtNWDB0NFkralVOcXg0a0lFN0lFR2lma2xMWHVmRXpyYkNzcUFjY3hGNTUz?=
 =?utf-8?B?UmNFbjdkSVgyZE81bEtzVVBxQkdDR1VROWExWDZ1ZmxVUEExS2lDamlZRG5a?=
 =?utf-8?B?TG13VVcxQXVBWmdCU2E3Vi9LdURFUlZmVjR6UWFkWVJaY3Voa2JwazhBZDZ6?=
 =?utf-8?B?T3NCbFNkcGtrZ2JpQnFqSFR5RGhMRlJicTlpaE0wQU82eWltV042RU50Zm9i?=
 =?utf-8?B?WEp2MkNKZjRsTVMwdFJidkNtMXRmS0d6NVEzZkhLUCtvbURPTTFlZml3T056?=
 =?utf-8?B?N2x4MVFXY1VzTWVHY2pQL1VTQnhxVVNPMkhReGRxK2JhZllTR3duRVZWMWw0?=
 =?utf-8?B?c1FLM1dUa05IeHdrSFEyTjFxWFdqNVlVSHNSdlBhajE5SUtRekdxSjRVai9o?=
 =?utf-8?B?QTd2eHorNG9UcUhyVDhBYUZtYmhYYWFoV3RSM1Q2aExMUkRQVW1iR2dLbEtU?=
 =?utf-8?B?SklneEpxemJWUTIvaDVyZzh5aUFwWml3cnl3dWZKQjZKMStsWHRoRXlaZVh3?=
 =?utf-8?B?QnduUUtDejFvOW85N01QM3lCRTBKOWUzUWNLZWs3dWJTUm4wOGZGbytvTElH?=
 =?utf-8?B?Qm5VdlFCa1NqTFp4NHBOeHBJT3kxS1IwT05uVzF1ZDA3Uy9qMDQxQWtMMjR6?=
 =?utf-8?B?NXp5UGkzQ2FhR3hSbVdseUIxaXQvK0JrdUJsUmdha3gzUmlNRGZPZ1R4b1Bl?=
 =?utf-8?B?dm1wVXU4MXFaYVRpQnpjQmpqaC9vSG1CQ0NHV2F6MTgrNzJkSXVBajU5Nnhm?=
 =?utf-8?B?bHlsQUN4NFAyYjBGN1pRK25BamVTN2lqTktXS3gyb2Z3ZmNpbFc0THZKQlRw?=
 =?utf-8?B?ZVZ6V1ErZERTMXFCczRIZzR0ZysveTRreWJqNFNyN3NuS3JhbGdCTXorTkw1?=
 =?utf-8?B?VHZMdDR2Ukk3TkhDSlR3b1J1UDJzMlNhSnBMSWtRU2NBWkY3bk9IRlpVcUxJ?=
 =?utf-8?B?R3U5RHN5RzltdS93SHUxd0lHblliVDlnT0pkNDg2TDFkY1AvbEovZGJEd3Zi?=
 =?utf-8?B?RERBaTc1S0FITmVKK0loaTZBOW81M2NjME54NjE3ZjB1eEtjT3J5SnpleDJF?=
 =?utf-8?B?OTM3MnUvR3dETHdZdnB5SXgvbW9lUVF1NVc4b0ZIY1ZFazUwZDRIa20rNkNs?=
 =?utf-8?B?d2taUE9LOG9IZ2UxMExFYnZRb2NWWHpNWVBOQkpQS0t5OTZYU3lqQzltQXRi?=
 =?utf-8?Q?UpCg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR12MB9412.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1JBVis5bW5MaCtCT2ZMMmJuS0haWXZHYzUxejN5cGdzVjkzQ1RHZ05zL0Q2?=
 =?utf-8?B?UlJ6cDVIelpucVd2SHNWd0drS3NabDVUWEhCVWM0UlFDa2xUdFBLL2N6WTAy?=
 =?utf-8?B?SStBc0hpTmRpUmdlZ21NMWZsN1N2eFdyWU5RQUhVRVlyNkhuc0plZ1RIbXF0?=
 =?utf-8?B?VVI0K3Nmd3JvRkdsTXNhV0x5N1JSam91RVJ6VUVNbFZqaUVmeEhMZHVWSnkx?=
 =?utf-8?B?R0o5NDV0SW9lM0NES2M1N1lzR3RDZlgxQjd6R2ZCVDUwNDNZcXYzc3BFYWVD?=
 =?utf-8?B?MWtCaWNBdjUrNHd5ekUvTTlDSFp5cXBEU1hicloxWGlwbEw1VUVUaExxUHY1?=
 =?utf-8?B?T0JLd2NBTUczYmhWUStRWm55aFlUVkF2cHBWVk1jUE1nVWJOQ2NacVltZzdG?=
 =?utf-8?B?bnQyR1Babm5VOGw3bzRWandPS1JSR0FaWVpsQ1hPV01FVzMzVVBFWW9MU2xP?=
 =?utf-8?B?cXFscjl1RVM1QzBNTDRvSkxMRkg4bS82UlhTT0NlaVkwb2Z6THRhTGtXQ1Ry?=
 =?utf-8?B?MHNJam1Ib1lnMk9hRnMyOFZjSTBUVkJWa2RSYXd4ZWxpaW5iTFB5bzdGRVhu?=
 =?utf-8?B?VFdkUkJaNm5iQ1ZuZnRuTDZSRDRZWi9iWnk0U1QwMWZ5bkNhTUYzRU1ScnF2?=
 =?utf-8?B?TjVyNEhHWkRvN1Q3RE1DSzVpc1g3SnZ3OVg3UDBlRTZBRTBKMDFtWDdPQkh2?=
 =?utf-8?B?ZDZDbkVBOTdLRXN5LzRDYTBwV2FPbktsVVZnL1RHOU9BL1BQMEdXbDY2ZUdw?=
 =?utf-8?B?WU5sUDlTMTlGYUd1czJJb3lVTmVCZUhsUjVqQ0FKeVdEVnE4NS9KN2VJUTNW?=
 =?utf-8?B?UFo1czMvYnRwQ1NKUjUyenVZWTliNXVYTkhwVldZcUhZVUtOaHE5dWNpTDl5?=
 =?utf-8?B?WXY1aGx5WmFyaXNOa3VBNWp2d1Zrd3FCMU1Hd0dCMXRJa0NaczJDM0NKYjc5?=
 =?utf-8?B?WHc4TjZub0l1bWRncEhIT1JleHovamJBaDhwUWdYdGNURHUrNjFqaThHa2d6?=
 =?utf-8?B?MzM5ZEVLaFVJRUxvZ0RRdjhSMkFtMVlZaVNGQ0VZVTZVQ3BpY0h4ZmQxaldn?=
 =?utf-8?B?NS9GaUxxRThiNGlObTBTcmNJYmc5Ulg4dFZVdlUzcmhaUGxldzlkUWpRRm5q?=
 =?utf-8?B?bkFsMUxRVmJRL2RQam1sTFZkN3BTRit0ZnZRYStHd0NpSGtMM2s5enFhREQy?=
 =?utf-8?B?Yll1WlhZeE5DRnNrMGV3SFF1VEVoSHIzZWdYaHNDK0lIYlNIOXhsMXhFSDZa?=
 =?utf-8?B?MVVjTFZGd3Z4RUFFcWF4U0xsK0E4ZlVBWDFZWFFkRCsrVG1LL2xYWXYyL21n?=
 =?utf-8?B?K0JOWktRUmNWWTJpWW83RHFVSG54QVFsaUttUzFMY25kRmpuRkhLdEE0QnM0?=
 =?utf-8?B?elBCQWI4WU01RXFTN0FzVW9tT211aVNuWjRDcldqbi85NWhoRUN1b3hic1pS?=
 =?utf-8?B?NkI2U21oalBqcnpKaXZNaGFKNGl2S24yeTc0SUJVVDMxYm1XTytGTXlnZzdw?=
 =?utf-8?B?c0FBdndQOUZGd3cvMkdaQVhnbFVlS25JWU5pUWVOWUk3NWExR05GMjJLSXpV?=
 =?utf-8?B?QW9VcmhUY0R0TkNKWHhFWHI2UFlkeTJqMllYQjl3UnFVWWV6WWhGYVcrV0E0?=
 =?utf-8?B?VkJGMXYwbHZhcVVFc0hnZmUrMmFtRGh5TjJ3RzZ4ZDJKTGY2TWw2VFEwdEVh?=
 =?utf-8?B?dzczNmFhcUFaOEVhVDVXRVd2Z0hNME84VXIzL0phRUNxTWxTcDVPV1BWUW5I?=
 =?utf-8?B?RUpwaC9OanBsTkdmNkVlWkkydlRoZE12VzV1WHhlODdXY3AxMlZMcG8yWlFl?=
 =?utf-8?B?TnFJWmFTY2JNWmV2Qjd6dlFwL25KVnYvdEdiU21tbEVWREVsa3hEcTk2eGNN?=
 =?utf-8?B?bFVJTWlJcXhNV3JTMG5lVy9JZ0RodWs1L0UvYnRKYkpRRlR0YUdhN1IycWNK?=
 =?utf-8?B?WmNIWVJSY3A5T2R4cE5KdlhVb3ZNZGo2Y0NubGVvb1B6bnNqaFZOM0xVUFFy?=
 =?utf-8?B?bjdqQWxMMFBxd0JFRE5vSEFQNFo0TnRQOWRTcUEwWDQxOWRwTGM3MGlnamtG?=
 =?utf-8?B?K21DV0twb0QzK3cwWllKK1RCY0svWEswY0JxUWI5dkt5eXZFaG9QdFI4TUN0?=
 =?utf-8?B?MXJtYmlqemJTeGNyU0tabysvVGRicTczTHR2eEhYdUwyUHRHdTA0NERmenE0?=
 =?utf-8?B?ZjF2dFdNN0VxdmptRWd6N2gwMWFrUWtjRStLeGtvSkhGSm9rSzZsRFhIb3kx?=
 =?utf-8?B?OHZManRaTXVWQVNMQjVPOWRoeXBKSUhKQnVJZmtyZlJoLzRIdVhlbjVBd0Vn?=
 =?utf-8?B?amxSWVplYW10aGE4T011ejB6YzNqbkpLWnRWR2Nub3hvNHYzRXJiZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac68c256-5b3e-480c-31db-08de645c32d3
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 02:13:48.7880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n0Bwb5TGFPBqH4cv9sfKPKKnjEeHLbmAXwGOsubu40sLIK4RZtSVchzKhTB2ukGEa0pSf1KACVrAeJqPoZVs/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8062
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
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: B2659EDE73
X-Rspamd-Action: no action

On 2/4/26 5:16 PM, Dave Airlie wrote:
> On Fri, 28 Mar 2025 at 21:09, Danilo Krummrich <dakr@kernel.org> wrote:
>>
>> (CC: Ben, John)
>>
>> On Thu, Mar 27, 2025 at 02:03:21PM -0400, M Henning wrote:
>>> On Thu, Mar 27, 2025 at 9:51 AM Danilo Krummrich <dakr@kernel.org> wrote:
>>>>
>>>> On Fri, Mar 21, 2025 at 06:06:34PM -0400, M Henning wrote:
>>>>> On Thu, Mar 20, 2025 at 2:18 PM Danilo Krummrich <dakr@kernel.org> wrote:
>>>>>> On Wed, Mar 12, 2025 at 05:36:14PM -0400, Mel Henning wrote:
>>>>>>> +     __u32 width_align_pixels;
>>>>>>> +     __u32 height_align_pixels;
>>>>>>> +     __u32 pixel_squares_by_aliquots;
>>>>>>> +     __u32 aliquot_total;
>>>>>>> +     __u32 zcull_region_byte_multiplier;
>>>>>>> +     __u32 zcull_region_header_size;
>>>>>>> +     __u32 zcull_subregion_header_size;
>>>>>>> +     __u32 subregion_count;
>>>>>>> +     __u32 subregion_width_align_pixels;
>>>>>>> +     __u32 subregion_height_align_pixels;
>>>>>>> +
>>>>>>> +     __u32 ctxsw_size;
>>>>>>> +     __u32 ctxsw_align;
>>>>>>> +};
>>>>>>
>>>>>> What if this ever changes between hardware revisions or firmware versions?
>>>>>
>>>>> There was some previous discussion of that here:
>>>>> https://gitlab.freedesktop.org/mesa/mesa/-/issues/12596#note_2796853
>>>>>
>>>>> From what I can tell, this structure hasn't really changed since
>>>>> FERMI_C (circa 2011), so I'm not too worried about it changing on us
>>>>> too quickly. When it does change, we have the option of appending more
>>>>> members to this struct in the usual way, or if the change is more
>>>>> fundamental we can return an error from this ioctl and add a new
>>>>> interface. Userspace needs to handle an error from this ioctl
>>>>> gracefully anyway since whether it works or not depends on the gpu
>>>>> generation and what firmware is loaded right now.
>>>>
>>>> We could also define it as
>>>>
>>>>         struct drm_nouveau_get_zcull_info {
>>>>                 __u32 version;
>>>>                 __u32 _pad;
>>>>
>>>>                 union {
>>>>                         struct drm_nouveau_get_zcull_info_v1 info;
>>>>                 }
>>>>         }
>>>>
>>>> just to be safe.
>>>
>>> We can do that, although I don't see any other drm drivers using a
>>> similar pattern anywhere.
>>
>> I think it's a bit cleaner than adding new members, leave existing ones unset or
>> add a new IOCTL in the worst case.
>>
>> Maybe the NVIDIA folks can give us some hint on whether this is expected to
>> change at some point?

"Predictions are hard, especially about the future." :)

> 
> I think it's an ioctl, let's just leave out version/pad, adding a new
> ioctl isn't a major trouble if the world decides we need to do it.
> 
> Also you can extend ioctls with new fields at the end without
> problems, so if it's just extra info it'll likely be hw specific and
> be part of enabling a new GPU.
> 

That seems reasonable to me.

thanks,
-- 
John Hubbard

