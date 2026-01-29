Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FFXJ8hGe2kdDQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 12:38:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA29AFB5B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 12:38:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5029610E32B;
	Thu, 29 Jan 2026 11:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2XUmb9Ff";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012047.outbound.protection.outlook.com [52.101.48.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0BB10E324;
 Thu, 29 Jan 2026 11:38:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Exoe2DEHykrU42sGl1u5EWHAjjls5CAR3p7on5+hyIvL0ywq7D1RnDlUuW/81LC++MKGonDehh8hGlLbRvjsSoFQbJmG7iJpd/CMBJaiVzMHFt5Rp0fa2h35Qss7ze7ga6b+3pmZoDPoDPEvtQRXMXQRy3oDM10XnYDYqV1ZtGfCCcgXQQrMx/+oO3RMyoEbadutNgIM2z3dDPNXgEmV734fqL4Wnmg0I7GKsT2izkEFfEnkkeP2DQU86sIFe9miNsco38ZrvpbIgDZIDhSG+8Uvnl11ZgEhW56krZL9QZyyN+XdZlLua0qD9sSBHftoc2bjIeY2PZkBGy9Y1rqeHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cF1A7BbRF8wChfcg/tsu2/oX4WNypbkal1hQ2Rz64uA=;
 b=kXD2V01RJQGRceKW225mewIP9iOj4J6YFaH93rMwTW6IOxFMBI86NiWyCFWew+T+duHozik0uuEl2BrjdWQOpH2pYWbsI14C8t0FKKhumg6tMwmKNjo4rRTo13H7dSfkMtKEIyYTZw01ezElu2sn7BZyeR0dypZ6sUhKPyhGFNnn447u5s8IhhcQSbWemFevoUOI3sUfU0r0Rz5Vikz7bZy1HZJFMXbtKb0Ir4IZj3WHszsm9nSI+nITv+ZWKpm3aSg2GAbNZ9t+HQd4QB2sb+Jhv+ZFucDj1SujhVLe+1phaSSm7qUEvoogB0nnJKoclX4mb4IxfzWE8mo4Xd7uwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cF1A7BbRF8wChfcg/tsu2/oX4WNypbkal1hQ2Rz64uA=;
 b=2XUmb9FfCRcW99YxGmiZj2NYQjN/W2mdNq4yo4dXuyaYDF9UupdVihf2b2+9jZT/Mz7g5tQhyrA7ALvH8PnohL7ephD19p95E/S27/AuWfgYPso/RGmrKpuQEeYUp58wljVnBu8L4PaYWryEWJRg8U77GVRI3aD4qjmSs3x0W9M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by MN0PR12MB5714.namprd12.prod.outlook.com (2603:10b6:208:371::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 11:38:41 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::c3e5:48f8:beb6:ea68]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::c3e5:48f8:beb6:ea68%7]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 11:38:41 +0000
Message-ID: <30f2480d-016f-417e-9ddf-7805e4943e7b@amd.com>
Date: Thu, 29 Jan 2026 12:38:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 Hamza Mahfooz <someguy@effective-light.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sunil Khatri <sunil.khatri@amd.com>, Ce Sun <cesun102@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Alex Hung <alex.hung@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <ab52825d-8f26-4b52-af5d-4051760b2aa4@mailbox.org>
 <6f1239d2-eec3-40b6-aca7-5b278350dd04@mailbox.org>
 <2719069.vYhyI6sBWr@timur-hyperion>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2719069.vYhyI6sBWr@timur-hyperion>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0071.namprd03.prod.outlook.com
 (2603:10b6:408:fc::16) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|MN0PR12MB5714:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ada3540-a6a5-4e05-e704-08de5f2af364
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUVLNFlNZ2NsS3hUdDF6clEwYk5OeW1BTmhsL2ZmT1hxM0J2L09yZ1MxeVQv?=
 =?utf-8?B?bTZxbi92ZEt3STZHUnR3SnFnOHVha3RzVExNdXhya1dLMGpBc1M2L0dDREVG?=
 =?utf-8?B?K0VRa2QyZEQwTmxQUVJtK0srdm9mUEVZQVJ3aGFnZFcyeGM2bEd2N2dOazRy?=
 =?utf-8?B?aFRGWjBqeG5xSzltTzBSRnMrZkpGZ0tjZnA0MTNwbElYNlB2K0d1MXZCOEN1?=
 =?utf-8?B?bjRuRHJTOVpvbWVLTHFUOE9hY2s4UXFNZlVXU0o3bEhvS3J3VEN0TitBejVw?=
 =?utf-8?B?VWM3Kyt5N0hVNnhwODRtWFdOd3VOeXdaVUgvWmd4M1p5cjZ6Wnd6eStxMnYy?=
 =?utf-8?B?NjJKSHA3dlk4bTE2R0RNWGE1SnlFVC9sMjh1SHBiN2poaDlzblJWR1cxR2l3?=
 =?utf-8?B?SHAxVXRIeWhSY2ZobFRXb0FEOWEvbE01ejdZMmNtbHZXMkhGRUNTeUJpUU9L?=
 =?utf-8?B?bmMxdDRQdWo2SjhQOTd6RTl1TDUraGxCamtqQVNoTUNxOEJIUktDNnpBZ3ly?=
 =?utf-8?B?MFJSQ3F2UXV1YTBka2s3UG9CK2xCdHFsY3JJTmdwSGcyc2RDNFRacDZLNUxr?=
 =?utf-8?B?cW40Ky83L2dyVTZBL3RRUFgwM2pteEJMN0l6cktnOFFMSWlOblJWTTdFeXk3?=
 =?utf-8?B?QWROdExIRmdQNlZjOWd2Nkt2TCtsSmRwbWRHM001TTZlQ3hDR1Q4L1NGYzJJ?=
 =?utf-8?B?cTd5TXZvQ0tzUER6YTJKMUtQWFg4QmE3ZWtyMG12SURpdUNuWVNlTHhKbDNi?=
 =?utf-8?B?b1V5L1BHM29LcEhJVVg2RUgyd1FIcit1UG9wQlhWZ1kwdmNHbndMR05wVDdR?=
 =?utf-8?B?d3h5Um1zb0ZxMzE4ejZHMXVINTJSRmVCSERDK0RhZFV3RE01UFhNWFd3ZVIy?=
 =?utf-8?B?cElqOEJyOVZzdy85N1lFV2srM0FNRGtlOVgwWWtFUVBKeUNrMzcvZDVzdFdD?=
 =?utf-8?B?ZVRUdy8vSHpZbmxlRWo5NHZpengwN1EvYWxma0RPOXpEVUh6UHNYaSswQmc1?=
 =?utf-8?B?T29sRXRwNk5NS05rb0YvVW90Smt3L2w3aEx2Q2NtYXVjMlhsOVBUZVpKQjE3?=
 =?utf-8?B?bTJMN3hDQ3JkM3NTNkowbWRvQWlyaVlTK0ZRS0VCWTJvK3lZbHd2UmwxcDdO?=
 =?utf-8?B?aDlSa0phdThYbnkzWWkvbmxHSnFJaHJoenRWbWJsMUZVSkx6YjV6K001SjN0?=
 =?utf-8?B?Z3FvalNVQlk0dE9reDlOazREMm5QWUZYU3QvT00yM3R3cUYrRENabEtkWW1I?=
 =?utf-8?B?VE16MjF6TzVOQlZnMHg4VXg2NktVRjlmaVJKZmtiMzJnWENXcWZIdThmRUNH?=
 =?utf-8?B?d0p0cFloTHRvVWZXV0hyT0xZQ3lNaGJIZGVuQzgzamRhRTBMMmdYWWs3SFgx?=
 =?utf-8?B?TUJ2SVRFM0VaejBIMzNBSC9obGVIaE9KTEF5UXpsUkUxcnRuWG5aM0graTFQ?=
 =?utf-8?B?UDR1R3p6TXdkd05aazFPcDYrSzl4U1gwbXJlT1BHamVjeTdndGo5OWRHaVFl?=
 =?utf-8?B?ZWVONFJ5blRuVGhJYVFqTE01QkdwU2xablFzSDU5ZGlpSkROT1VGbWZFcHhp?=
 =?utf-8?B?RFkydW0rNGNXaXVCNm8yUEVzRWhuS0RwL296dE9TUTZQUHN1cVdLNldUUzV3?=
 =?utf-8?B?V3BpdFllNzhrODB6UUZReUtoTUNzZlRSVGwrSlcvZ0E5TUR4UCswWkhoKzNK?=
 =?utf-8?B?WjRWcE9xZlBRajdjSHd3VnFXNXZmV0p3MGJsWkJEZlJNMFdRNnhXTStLRThO?=
 =?utf-8?B?WEM2VEVvMmNFbW5RZnhZdDhidE45U2xPbWZDOStJSkJWaGlaWVdFcThmbGpY?=
 =?utf-8?B?dTgyWUNBOStiZHVSb2lwZElNaG8vN3FQQ1RzZzREaEJZbjM0d1dHRGxhTkNM?=
 =?utf-8?B?L2tMTFpBZ2NMVnNhL2p1N3FhV0JQWm9kL1BtZitvRXVKaUxxekt5ZzdRVjlm?=
 =?utf-8?B?VzVDejE2aTRhVEJ3d085djdGMUVJNXVOQmJVazVsR21HTGV5T05uUEpKOE9y?=
 =?utf-8?B?UDdkam9wS2grRUpNa3pwR0cyK1FwL0NDYzU4U3Z4U3l4TU1takl3aEdIVDBh?=
 =?utf-8?B?VUpyclN6NStRdFpOVVBaTWFxZUlMT2tSNXQyODFRcStHMkdneklXM1pEbWV6?=
 =?utf-8?Q?nH84=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RElNYTUrZ0V6S0FtOTg1VHcwUnNRemJyeE1BQkZoMm1zblN4NGc1YkdQQXZq?=
 =?utf-8?B?ZU9aaDVFMXB6UjVGdk5xNG50cUJGanFxYUllUDkwZ200US9lSFd1V1IxMFJF?=
 =?utf-8?B?TXplQlc4K0UyZmVodTFvRUtQL3BjbHZlVVNZSGxXVjR3aXk1ZFRtV21BckFB?=
 =?utf-8?B?T2p3bWRNVlNid2Y0QXdvYStPZS9UN3k3VVQrWlJVNU9iNGhYUVNTQ1J5Tkh6?=
 =?utf-8?B?VDBNZkpqYWh4YTYweTlRWHAveFd0Zkh6bU9jQlM4bVhXaHdHaEZGeFlVWG9h?=
 =?utf-8?B?YUhrMWNub2xFdXRyVjFIemF0MUFaR2hLNEhqekVxSmY0R3JDWThCejFtdnNa?=
 =?utf-8?B?cUdKemJSdDBIK3ZUUnRKcE81N3FRYkRtbDl1bWVudTFrUTl1WWI4Wkk2N1FO?=
 =?utf-8?B?djFTSkVMYTV5VTErZVhuQUR5TjRkM3ppNktGaHIzcC95RnJ6bmRWWWZ3WHN5?=
 =?utf-8?B?TDNxTXpnQTJzMnlTNTRJWDVPNFoyTlV0L2hBc2FiWFdCYUxMU2pyMGtwZ010?=
 =?utf-8?B?OW9TSG1JTENTOTZyNy81SDA0YjhvUGdGZUFzVXRwRDd1SzU2R01hRFh5bUEw?=
 =?utf-8?B?eDJObVB2WTQweE9ObFNTMWxBNlNrZXJ3MDkrd3FlUzExS1EvVXdUdlZRT21q?=
 =?utf-8?B?blVFNGsrRC8yY3R3N0VmMGlpamtWVDl6UFVLSjNPR0JxVytGbWFaNm9rbFps?=
 =?utf-8?B?Zm5lUHQ2QXVjYlRGWmw0TWNLRWNZY2VFSzlQNlVtbFNqN1JldnJEWlNnbWd3?=
 =?utf-8?B?dkMrUm5UQVJGbCt4UGhuTFlBWEMwSXV5Y3ZURGtnM1poMUdxY25nUjR3ZmtV?=
 =?utf-8?B?aWg0VVpkdFpaV3NCYWVsc2x4Uk9ONHJkTXFCMjFGK0JCRG5uK0xveGZZRG5V?=
 =?utf-8?B?ay9rVG1EU05FMzhvZDh3SzlTTVBJcVhuNVBJQmlGYU9SaWdZdWZkTDF0QnVX?=
 =?utf-8?B?Z1lETng3a0pTbmFkMXhKc0thM3BoV1pjQzl1MFR2QVJPRUNKeGJ2WGhmbllG?=
 =?utf-8?B?QTdaRUtXbmR1c2RHdHNwblZEUnNkdDdQbE1JTXhEcmJ6a2luekRxWmd2THcw?=
 =?utf-8?B?c0swQzRxUDB4ODlKRk5wU2ptSDZqckRXWnZVVHBPWXpOd0tLZVBaM21kVm50?=
 =?utf-8?B?MS9ta3Fsa0REL1N4VFZ6WFBJelRBVEMydk02dnVNbUJvanpZYXEvSHBYNVI5?=
 =?utf-8?B?TEx2NEU1eVIyOWJKOWJhQWpRamNYeGNjVFlFWGdRK2llN0pOUzlOamtwUkZC?=
 =?utf-8?B?OHBMcVZaRFg4MC9BNXBkWCs1elRhcXZGdmY4ZTZiUmJNa01DYkNmeVNpRXFK?=
 =?utf-8?B?K25SQm52ajl1c01nL1dIT0J3M2lVMDlZUDdhU3VtV0J5bDhRNHhJem5zallu?=
 =?utf-8?B?STZDR2k3Nkh1cnNpK2VET3REOEJQbVMvRmpYWTNzaWUwRC9SMVJqSUNjVVRl?=
 =?utf-8?B?cUxGb0ZNazJyRTdHUGcyZm5TSEFnczFrb0xtdG9vNnRvenNvcDdDR2hxYWhS?=
 =?utf-8?B?SUR0bEpxVnNuZFd5aGtWeHkvL0lCQyszNzNiTG5MLy9EbjVhRTZYVUVteGkw?=
 =?utf-8?B?RkoxQVVyR3lHSG1nSkI2Y09mSXUwWjBCSnRVb0VvRXJOVXZ5ZDFoekxuekY0?=
 =?utf-8?B?dFR3M0xwYitHT0J3RFpxUFBFYUYyNGsxUERwYURiUjJueWF3RjBEYS9yVnRh?=
 =?utf-8?B?bERKRkFNTmFHRnpTT1JTUitkZHpNSTFGd21XODF1MmtmRkhMdXpWV0QxRkJl?=
 =?utf-8?B?VHp1OG5JWEIvWjlMUTlKMUUrZ3graHN2QnhQdVdBcDQzcFhKRnIxd1JhTktn?=
 =?utf-8?B?UnB0c2prQVBYcy8wN05qN1FzZWJ1UmNTWWx4Zmt4UEJ3STNMczhxaGVEV0lQ?=
 =?utf-8?B?dVc2UFJ1ZE9mdDZLL0VzUHdiZXhZSHo0VjZ5YUJieGxVOFNxdnAwd0pCZEg1?=
 =?utf-8?B?eGp1NWFkekRLbjNDYVlFcmVndTVDWElIcStmS3ZZM1FlMEg5UnNiR29halNo?=
 =?utf-8?B?cWM0emdpRzJaSzh0TkZOdFAvQU1JRW1yRW9ISytoZ2VOSnRBd3U3a2xycWVM?=
 =?utf-8?B?Yzlhd1BnNTRNa1BOY0owZ1ZPbmkrMTFCVzB6RkZ4QnlmWUFDanVJbXNrR3dM?=
 =?utf-8?B?Q0ExZzVjZWdGL2hLTkE5T1pHcXArRzRkWXJsTlVWUG9oQUpZTWFrdkRDNUR4?=
 =?utf-8?B?OUlZTWxtTFBwS0JGZE1OdTlDcUt6NS9IMmJMOVFrS0xaY2g5L2dNcFNPRHRO?=
 =?utf-8?B?bmpuUHI3cmdwbVFyZ3IveDNMdjVSZGk0MWkzQ3FienVMVjk4bTZIejB4Q0Rv?=
 =?utf-8?Q?feAlUDnkOdgOVv4eco?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ada3540-a6a5-4e05-e704-08de5f2af364
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 11:38:41.1402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxigfXjMABujoXC5621Ud25fH0xyTChpA4HV4mDhQ9JpnL00WHVokCKZ3dFQV3hr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5714
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
	FREEMAIL_TO(0.00)[gmail.com,effective-light.com,mailbox.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,lists.freedesktop.org,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 4FA29AFB5B
X-Rspamd-Action: no action

On 1/29/26 12:25, Timur Kristóf wrote:
> On Thursday, January 29, 2026 11:06:11 AM Central European Standard Time 
> Michel Dänzer wrote:
>>>>>
>>>>> Christian, why would the CRTC be turned off?
>>>>
>>>> Exactly that's the question we need to answer.
>>>>
>>>> But from what you describe the CRTC keeps on, just doesn't send any more
>>>> vblank events.> 
>>> The vblank interrupt source getting accidentally disabled might be one
>>> possible cause though.
>> Another possibility is that test-only commits with the
>> DRM_MODE_ATOMIC_TEST_ONLY flag (which can happen in parallel while the
>> kernel is processing a "real" commit) accidentally have side effects on the
>> current kernel state, resulting in the "real" commit failing to do
>> something it should. There have been bugs like that in the amdgpu DM code
>> before.
>>
>>
>> Anyway, this is all speculation. Somebody just needs to dig in and get to
>> the bottom of why the commits aren't getting completed.
> 
> Yes, I agree.
> 
> However, just like we do with ring timeouts, we also need to be prepared for 
> the situation where a page flip timeout happens and we should try to recover 
> from it. And if it isn't recoverable, fall back to GPU reset.

No, that is clearly a bad idea. CRTCs are fixed function devices, that GPU reset helps here is just pure coincident.

What we can certainly do is to improve the error handling, e.g. that the system doesn't sit there forever after a page flip timeout.

> I strongly suspect that there are many different issues depending on the 
> hardware generation and display configuration. There isn't going to be a silver 
> bullet to fix all of them, and in case it cannot be fixed, I think a GPU reset 
> is the right thing to do - it's drastic, but still better than letting the 
> machine just freeze irrecoverably.
> 
> One example of such a bug was fixed by 6cbe6e072c5d where DC was trying to use 
> an interrupt that didn't exist on some hardware. This type of bug would be 
> impossible for userspace to solve in any way, but a GPU reset would have 
> helped to recover the machine into a usable state.
> 
> Another example would be Strix Halo with adaptive sync and/or tearing updates 
> enabled, which 100% reproduces a page flip timeout for me. I haven't had time 
> to investigate that one just yet.

Let's maybe try a complete different approach. We force a page flip timeout, and see if the system can handle that or not.

E.g. every 300 page flip we just fail to signal and see if things still work after the timeout.

Regards,
Christian.

> Timur
> 
> 

