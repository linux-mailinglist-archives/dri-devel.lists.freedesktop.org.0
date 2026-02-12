Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCDxDHKDjWlb3gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 08:38:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3022012AF9D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 08:38:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BCBC10E6DF;
	Thu, 12 Feb 2026 07:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kV/xmHcb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012004.outbound.protection.outlook.com
 [40.107.200.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F8410E6DF;
 Thu, 12 Feb 2026 07:38:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ui+OtM5vqPghGvYy8YDFVoayYHluLctUdMLGeSoF0+agpcZZdq78xcX/S5YeScC/QNJkBOYlkm5cZ/LrYb4YEjT2Cwf1z5TqS2WfADmCl0L5Jj6ulWDSxRrS30VOD5nCrKdI+mzFA3k6FzOr9fIqHSIAG854YQ70NVvtvcsOXLpzqOAvq5f3woW/BXCkxIN17cVBzwnd/9Ozhp3cUvC3BVoDf/8eM1ySSa6C39aUURWxN3Ygo1MAVmJqpgvouVh0Cukm0YEIasck4bo4aN6+SMZUx9MC6jiMWIURs1M0gaJau6j3uNq3tNGLMscTM9LGXqxr67T7FKBdw0l8ytPd9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8mtqKAz/NrfPvlZGDGOT9HA+3oaQURyR3KFqE46XGU=;
 b=mLzqWflGUIiRN3HnXiGX2yUhKlk6K4z3oo0lIKSRQxfZ/lhKHusbT5BIyg5Dj3+fqe+bwniX9BbrcVXLjlw92qiqfP4PVONjFYVNiffuLUgfDEPWFDp9Mohj33vd/TdcQI74LLrW1/9IAhPr8mF8iFgDDOwBAwrAK0d9K/CeDrwQJN19KpDEARfoV+XLrxd/m1U8dS4D37lpFfNyztsFgYCBfBtEj7oKEP+lYTzABK2A/063FWjQHFj2jiSJox//Y4CTEhE8dQCo6Bjf2TESKLnALADJyVnHNzSInSsmSrdcyROAfBxWPeWrgLOghrLUYLHdw6jvUVAU4sKsZxL9Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8mtqKAz/NrfPvlZGDGOT9HA+3oaQURyR3KFqE46XGU=;
 b=kV/xmHcb8+QIFkkf4XeEvF4LzvrrK5yjaPVeFZikxhNoIi1xgSVyU6MMXRfA0qoUuDXeLSuMGEixA4jEzfd6tPAS1uM04PRPzP+hIkKGjfPnIwDcKXxZHbk000qyIF7VEP3NvU6akHeUN3ZLQpabSrO0LjWyPxv7WV2G2JshWF4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by CH3PR12MB8657.namprd12.prod.outlook.com (2603:10b6:610:172::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 07:38:17 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::8434:dc50:a68d:7bdd]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::8434:dc50:a68d:7bdd%4]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 07:38:16 +0000
Content-Type: multipart/alternative;
 boundary="------------mzIuGTL0pgJokSb989AqzrlX"
Message-ID: <f1660888-9682-4c74-9241-063750bd63ef@amd.com>
Date: Thu, 12 Feb 2026 13:08:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/buddy: Add kernel-doc for allocator structures
 and flags
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthew Auld <matthew.auld@intel.com>
References: <20260211053123.260037-4-sanjay.kumar.yadav@intel.com>
 <20260211053123.260037-5-sanjay.kumar.yadav@intel.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20260211053123.260037-5-sanjay.kumar.yadav@intel.com>
X-ClientProxiedBy: PN3PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::22) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|CH3PR12MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: 77bd29b5-12ff-4872-a358-08de6a09af40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UW8yeVBGbUxiR0hTUTVnZ1g0RDcvS2UxL25RcERjMXFCbk00OXN2NTVmYm0v?=
 =?utf-8?B?TWx0S0pVUU9EMDRzNkFHSWxjMFZtem1pTVFpWXRGNGZRRUQrb01MKzRGU1dp?=
 =?utf-8?B?S0NlTmo4ZVBHSytuM05JSDRPZnBwdkFKdVY4TFQ2bUZFOEtmR3FHaWplY09r?=
 =?utf-8?B?VGl1aDRON0hRS0lXRHo4TDF3NHBHV2V4L1dhaWxNUDBMNGZ5cHJpdXZEaFVn?=
 =?utf-8?B?aXh5SGlUQ0Z0RE5LMk04eUdrekVxbGthbHFmcTRlazJCcWNZMDMvUGYzVWtw?=
 =?utf-8?B?QVo0YkNqSTZHTHpGanlTb0JJQWk1dHNRbVgrSWpGd3poRmdJL3prMGt0ZXVs?=
 =?utf-8?B?R2R4SFhMNk8xaGdYbnJERlovWkpIRWlGN2U5eSsvVHcxeW5BQ2NaVzJNeEtI?=
 =?utf-8?B?TTU1NzFIdHkwV3U3UDNMTjYvL1NSTGpJb1BLdGkyS3FEOFJBVkdUSElFc2I3?=
 =?utf-8?B?MHdyMm95YVNJUm0wWmFBWWhMaDlwTkJEK0tFcnpMQmkvK3Y5TlZmd05CTVlO?=
 =?utf-8?B?a05HT3drUW9sMUhmeWR2RFpiV2M2anE2b0E1RFNaZWRuRW43VldTWVBsM3Zl?=
 =?utf-8?B?REdNZ1B0K1NJbnZEZW15SUxPQklCTktES09tQlVFeVE2c1A0MTdXajc5UWww?=
 =?utf-8?B?ZWc3QzJUMWFHdjF6SVBZSkd0OEJmWXd4TVdQSWlXSHNCVlorbWl4ZTBUWHYz?=
 =?utf-8?B?Q3M5cG5pSXRydFBIWXBpMUozYXdiWnUybTBONS9yV3lUNlpBb3lCRFRyZldO?=
 =?utf-8?B?VWZOREh0MzVmVFUxUjFOMVJ2SHBvZlZrUE5CQzN3Z1UrRkpVMU9GQ1FyazZx?=
 =?utf-8?B?NnY0czRMSDAwS1hZVFdYa1RNTnRBckFaZmZZdkYwbE1LL1lWaVIzc21qTWxO?=
 =?utf-8?B?WlhxR25wVUVXYzR5Q2tTaGdSa1FlSThveENtSlUzakhLMDczZDFFdk9OQkFV?=
 =?utf-8?B?c28xMXVNcmQ4TFVOTTFrR01VNnMzb3l4VmZxKzZGQTdHMFRtdVlnMVhTbkpH?=
 =?utf-8?B?Z1VmYlE2c3hrcjIzbjJxOGc4eDhlbEhVRGhBV0xBTzVsQ21nT2xwQnZodmZC?=
 =?utf-8?B?WXU2VlZUQTRyUlpOa2NWbU4yZ2dyNXU2dXUxREtMOTV4bXJ2MndvaW5xYXdr?=
 =?utf-8?B?TFE2S0VkTXRmMGVkb0xDalBpTE9iSzVmUjFBU2NiNDRoUTRrZVUrSEVRZUJw?=
 =?utf-8?B?VkM2U0dBZFB4cW9XUUVySUJZRmNZWnQxMnZPZ1llOEZaWUsyMDdOenZaWlQ0?=
 =?utf-8?B?NU9Xdjc0aTNWQmdCVGVpTW5GY3FqblpSYkhhL1pvR1EzUVBIUnl4Uy9DdUdq?=
 =?utf-8?B?YWhOZjlCZkV0eURkOHpXVHRvZk1QWkt5NFFyV3pnZTU4QXN2Q1htcmVGUCtV?=
 =?utf-8?B?NUVLb1MvNmtaSnJHMURxcUN5NUF3ZCt6YkR0TXdOaW1MVXJJcWhzcktTZTM3?=
 =?utf-8?B?eTl2YmNGa2tsRkEyK0I2NHVXWFUxdTdUazBoUGk1eHMzdnEya0pNeWVWeDNP?=
 =?utf-8?B?SjlPTjF5KzRvS0pFNHNxUGp3aWpBVUN4Y2VLNWFGZ1N5YTQ0R0NBbnRqRDEr?=
 =?utf-8?B?dUFyTXM1TmpFWHpWYnZpYi93c0hLeSs0ZFd1bUZYcUprRGQybVBMV0tUTUVp?=
 =?utf-8?B?RmNIUjZ2anlmL3M5anVZbzhQNThYWko4cG0vNzRDVFJJMmludi9rODVFamdH?=
 =?utf-8?B?eGxkY0orSndVemE2THpLMGRna3FXWGJQWUVacWFzTzJnbVJocE9OUzE3a1hD?=
 =?utf-8?B?N3lHQUVQWVc1dVdsYjZZMlkwcW1xNjdHVFJ5WWlqdTBmTkdheFcrNklHUGZF?=
 =?utf-8?B?OWllb29DNWZsVXBaQW9UdERvM3NmQ1ZFRzNvZy9oUkxWT3V0OUdBVExNakV5?=
 =?utf-8?B?Z3NiNi9VZTNwMVV5cC9DNkQxYjZRbTVha005enFYTzg2WjJRSytRNmUxRE5N?=
 =?utf-8?B?dXNFY2JySFFrbk11YXlhUU9FNlNqVUd4VGV2RGFPakJTaWRQdjBRclQyaGd1?=
 =?utf-8?B?YU9CN0N3a2tNbnc2cW9wL0hMRytBR0hMbGNENFZXQmlydHh6ZTN0WEJ3NVdv?=
 =?utf-8?B?Yk1wbGxHdkY3UUdDenk5bGdOZmcxaFA3dkluRWdwOXYzaFFIdjNtaHpBcmNx?=
 =?utf-8?Q?1ZPc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEZYeUluYjJHMXFCazJmQU1qRkFxRmdjZ0NlSStFNHIyRHRkUWU2S0Jnando?=
 =?utf-8?B?Yko4bGozVWcvMUJqYTNoeFJMS2ZxNndpdnBsSkdkb3U3NjAyNTJjcXgxVkwz?=
 =?utf-8?B?QmFTT05SbE82VDlWVjROODBNTldsS2xGQWVvMmdJcHZ2czRXQ25HcVhqQi9a?=
 =?utf-8?B?Wk9YYkZMWlA0VWxlVTluWVRMaDVUSzVZU1QzSDRpRHRIK0VNSVdEcFo0R002?=
 =?utf-8?B?YlFQQ1E0YWh4YjZsaDdwMGlaYUZiM2o2RGxZUW5wenJSNEtyN0VwWjRkdkQ3?=
 =?utf-8?B?VHdIR3BuY29MWE55Z1UyeUNYK1JOVHIxWWQvWE5YcXVIcXppUjZQQVg3ajQ3?=
 =?utf-8?B?K2VmUTVrZzQ3QUUyVFIzb1dib0pqTGs2VSs2dGVBbURyeTRBc1hWYXJyKzVo?=
 =?utf-8?B?QlNtdk9IN09iTTZLTDk5bUVIcm11TUxhZk9HKzNjWUVHYWdXVHRUd2hIeldD?=
 =?utf-8?B?bEgxb1NLV1Q0cHRzaVM2NU1VclpVTVBFYUpSSzNzQXF0Z00zeG81N3NDY0wx?=
 =?utf-8?B?Z3dsUW9GblpQaWU5NUJSVjUvTkl4aUs5M2tyRFcxMjVpSEM5S2NDc3A2Mzhz?=
 =?utf-8?B?aUtBcXhZSTlsbHVTSkJlNWJsMGtmc08zRzJJbFdpZ1RySU5PMFVNeUVjZnVo?=
 =?utf-8?B?REltUVNWaExyK2hFd3R3b2VhM0NzeGhXZ2VYOVhVZlpvQ001NXRYcmRvbnRS?=
 =?utf-8?B?TUE4UzFnOWc5U2VldTBORjhZeTNLMmwxcC91bFc5RFJFQkNDY0ZaVDhrbCtq?=
 =?utf-8?B?U2ZBV05QTnlZNlE2eitrR0ZaME1ESWpyWFNUQXZxV2haUVRNSURvNk1HUHVR?=
 =?utf-8?B?NittUDFnSlpBTmNYaTd4MEdCNmtucktJY1ovRVo3cHB6ak9ZWFNiTmE5Yllr?=
 =?utf-8?B?TDc0bFlOTnpYbVQ2WWZNS2FLbmVMQlJkRkJtYTA3VTVFTHl3R0hTZy9aelE0?=
 =?utf-8?B?akNybE9QWGRDRktadGFEbHcvV3crMlRIcVBIeFd6TmFvcFRYU0Zta243Zyta?=
 =?utf-8?B?MlVJNWN1bkY3MzlEdTd3bHBuTlNNcng4NHdLMDdWY0hWbHlOZ1ZmZ1UyUXdL?=
 =?utf-8?B?c0J2ZXNRSnN5eVRTS0drai85MEVFT2E0STJiR29QQ2ZNNHphUWFYWWQvNWlj?=
 =?utf-8?B?bFdZcXB2MkVsY00ySzNmSzE3eVNyWDdseEFXSkhMV2lybStyOXNEOHVPZGJ2?=
 =?utf-8?B?MGdHemoyWmpMS2pKSmFNOUhaZFJQaHk3VDJsakR3N0NlV0pKQS9raHVmcEF6?=
 =?utf-8?B?Rm5GMnkzbms0cngrd1pXUnY0aHF5QVZzRnZKcTg5MHg4aHRHREwyYUhWMlJI?=
 =?utf-8?B?cUN1cnU2cmVDVDZZNUVjMy9PTlU1M0prTjQ0OFBxUDVWb3lmdU9ZTkM4TThW?=
 =?utf-8?B?VDBMMnFiYU1sSStwUkFLM3MwN2xMWDBRSDY3RUpnRk5BK1RZZFVXaVdvR0tY?=
 =?utf-8?B?Z1liQ3ZoN0xzUzZKTFhESEg1bzVkOU1aaUt6aUdKUVBXbFlUU2VSVEY5d1Bi?=
 =?utf-8?B?QTF5azhTUzhwK2tkMWxpNmFLZXR3QmVjRSt4RElORUNkTU1aNkoxUDJ2bVpH?=
 =?utf-8?B?T2RZeDQ2L1RwMGh0K3pDRUFHbERzNWVzQW5mWEI1RmdjRkp5dHhrSytMTXhx?=
 =?utf-8?B?Q2pEOXVIMVQxYUpMS25RcWhTeS9UbGRxbG96K2xOUDZTdXIrR0xJMmpoYlRM?=
 =?utf-8?B?eUEyandKbnJCMExyWkF2S2dJdkNkMFpZYTdSbFF4a080dmNHRXExVFFCWm50?=
 =?utf-8?B?RElFS01NUzBIQ0hmY05PVi85aHJlUS9VZ1NTVDd4ODU3Z3ZqTU93aUFOWVZy?=
 =?utf-8?B?OG1kclM5bUZGWEtYUkNmQkZma2NlNnhtd2twTkNnK29uSGp2Ymk1N3A4MTVh?=
 =?utf-8?B?bVJlTzdFck1JL0drL2J6aUpYdnZ4YlJmdURlUDhqbmRTbUNwci8wS3QvVWdE?=
 =?utf-8?B?NVdrUENOaFN3RjR6bHpGUjM1YW1aTVNUMi91djg4TDNMUHVORmZNUXhDc3g4?=
 =?utf-8?B?YjNaOWZuVFd4RkFJQU1ZL0gzVmZaYzU1VjdSQXphVGxrL2QwdWFIbTdzNnk3?=
 =?utf-8?B?MGQyYlQ4SEpzQVVsVWZRelVUUWptZ2hncmw5bXBKUDZYcXE1UkVjUGRFU3Vi?=
 =?utf-8?B?Yzg2YVNYS1ZiaUk5Z1I5ekEwQ2ZzQ0wzWVJXb0ErbXNlR1NVWTVrSDJoSXll?=
 =?utf-8?B?WnY4dWUvYzNsUWdYaktEQkNYWGtRd2JJRVYvYnNXeWJTWVhrNUd3VlJJanlK?=
 =?utf-8?B?UDZ4Zk1GU0kwRGx1enRHREFwYW4wNlQ3bjVWZmZXTFA3WHN0aUZzM1kvVWxo?=
 =?utf-8?B?VTZjUlN6LzZ5QXB2UE5DNnhJRVhQS1FhT0RTSmRqM01yUWhHOUVEUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77bd29b5-12ff-4872-a358-08de6a09af40
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 07:38:16.6706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AXK/QOHRimENjZ/todwgVWnJ8qDin+nO4H+u//ENBg3DnUfdG+YavV4yTREW4bTYPeEmjJz49xokvG+Nhdq3sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8657
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[arunpravin.paneerselvam@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 3022012AF9D
X-Rspamd-Action: no action

--------------mzIuGTL0pgJokSb989AqzrlX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2/11/2026 11:01 AM, Sanjay Yadav wrote:
> Add missing kernel-doc for GPU buddy allocator flags,
> gpu_buddy_block, and gpu_buddy. The documentation covers block
> header fields, allocator roots, free trees, and allocation flags
> such as RANGE, TOPDOWN, CONTIGUOUS, CLEAR, and TRIM_DISABLE.
> Private members are marked with kernel-doc private markers
> and documented with regular comments.
>
> No functional changes.
>
> v2:
> - Corrected GPU_BUDDY_CLEAR_TREE and GPU_BUDDY_DIRTY_TREE index values (Arun)
> - Rebased after DRM buddy allocator moved to drivers/gpu/
> - Updated commit message
>
> Cc: Christian König<christian.koenig@amd.com>
> Cc: Arunpravin Paneer Selvam<Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Matthew Auld<matthew.auld@intel.com>
> Signed-off-by: Sanjay Yadav<sanjay.kumar.yadav@intel.com>
> ---
>   include/linux/gpu_buddy.h | 122 +++++++++++++++++++++++++++++++-------
>   1 file changed, 102 insertions(+), 20 deletions(-)
>
> diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
> index 07ac65db6d2e..b06241c78437 100644
> --- a/include/linux/gpu_buddy.h
> +++ b/include/linux/gpu_buddy.h
> @@ -12,11 +12,58 @@
>   #include <linux/sched.h>
>   #include <linux/rbtree.h>
>   
> +/**
> + * GPU_BUDDY_RANGE_ALLOCATION - Allocate within a specific address range
> + *
> + * When set, allocation is restricted to the range [start, end) specified
> + * in gpu_buddy_alloc_blocks(). Without this flag, start/end are ignored
> + * and allocation can use any free space.
> + */
>   #define GPU_BUDDY_RANGE_ALLOCATION		BIT(0)
> +
> +/**
> + * GPU_BUDDY_TOPDOWN_ALLOCATION - Allocate from top of address space
> + *
> + * Allocate starting from high addresses and working down. Useful for
> + * separating different allocation types (e.g., kernel vs userspace)
> + * to reduce fragmentation.
> + */
>   #define GPU_BUDDY_TOPDOWN_ALLOCATION		BIT(1)
> +
> +/**
> + * GPU_BUDDY_CONTIGUOUS_ALLOCATION - Require physically contiguous blocks
> + *
> + * The allocation must be satisfied with a single contiguous block.
> + * If the requested size cannot be allocated contiguously, the
> + * allocation fails with -ENOSPC.
> + */
>   #define GPU_BUDDY_CONTIGUOUS_ALLOCATION		BIT(2)
> +
> +/**
> + * GPU_BUDDY_CLEAR_ALLOCATION - Prefer pre-cleared (zeroed) memory
> + *
> + * Attempt to allocate from the clear tree first. If insufficient clear
> + * memory is available, falls back to dirty memory. Useful when the
> + * caller needs zeroed memory and wants to avoid GPU clear operations.
> + */
>   #define GPU_BUDDY_CLEAR_ALLOCATION		BIT(3)
> +
> +/**
> + * GPU_BUDDY_CLEARED - Mark returned blocks as cleared
> + *
> + * Used with gpu_buddy_free_list() to indicate that the memory being
> + * freed has been cleared (zeroed). The blocks will be placed in the
> + * clear tree for future GPU_BUDDY_CLEAR_ALLOCATION requests.
> + */
>   #define GPU_BUDDY_CLEARED			BIT(4)
> +
> +/**
> + * GPU_BUDDY_TRIM_DISABLE - Disable automatic block trimming
> + *
> + * By default, if an allocation is smaller than the allocated block,
> + * excess memory is trimmed and returned to the free pool. This flag
> + * disables trimming, keeping the full power-of-two block size.
> + */
>   #define GPU_BUDDY_TRIM_DISABLE			BIT(5)
>   
>   enum gpu_buddy_free_tree {
> @@ -28,7 +75,27 @@ enum gpu_buddy_free_tree {
>   #define for_each_free_tree(tree) \
>   	for ((tree) = 0; (tree) < GPU_BUDDY_MAX_FREE_TREES; (tree)++)
>   
> +/**
> + * struct gpu_buddy_block - Block within a buddy allocator
> + *
> + * Each block in the buddy allocator is represented by this structure.
> + * Blocks are organized in a binary tree where each parent block can be
> + * split into two children (left and right buddies). The allocator manages
> + * blocks at various orders (power-of-2 sizes) from chunk_size up to the
> + * largest contiguous region.
> + *
> + * @private: Private data owned by the allocator user (e.g., driver-specific data)
> + * @link: List node for user ownership while block is allocated
> + */
>   struct gpu_buddy_block {
> +/* private: */
> +	/*
> +	 * Header bit layout:
> +	 * - Bits 63:12: block offset within the address space
> +	 * - Bits 11:10: state (ALLOCATED, FREE, or SPLIT)
> +	 * - Bit 9: clear bit (1 if memory is zeroed)
I think we should add
- Bits 8:9: reserved

Apart from that, looks good to me.
Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> +	 * - Bits 5:0: order (log2 of size relative to chunk_size)
> +	 */
>   #define GPU_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>   #define GPU_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
>   #define   GPU_BUDDY_ALLOCATED	   (1 << 10)
> @@ -43,7 +110,7 @@ struct gpu_buddy_block {
>   	struct gpu_buddy_block *left;
>   	struct gpu_buddy_block *right;
>   	struct gpu_buddy_block *parent;
> -
> +/* public: */
>   	void *private; /* owned by creator */
>   
>   	/*
> @@ -53,43 +120,58 @@ struct gpu_buddy_block {
>   	 * gpu_buddy_free* ownership is given back to the mm.
>   	 */
>   	union {
> +/* private: */
>   		struct rb_node rb;
> +/* public: */
>   		struct list_head link;
>   	};
> -
> +/* private: */
>   	struct list_head tmp_link;
>   };
>   
>   /* Order-zero must be at least SZ_4K */
>   #define GPU_BUDDY_MAX_ORDER (63 - 12)
>   
> -/*
> - * Binary Buddy System.
> +/**
> + * struct gpu_buddy - GPU binary buddy allocator
> + *
> + * The buddy allocator provides efficient power-of-two memory allocation
> + * with fast allocation and free operations. It is commonly used for GPU
> + * memory management where allocations can be split into power-of-two
> + * block sizes.
>    *
> - * Locking should be handled by the user, a simple mutex around
> - * gpu_buddy_alloc* and gpu_buddy_free* should suffice.
> + * Locking should be handled by the user; a simple mutex around
> + * gpu_buddy_alloc_blocks() and gpu_buddy_free_block()/gpu_buddy_free_list()
> + * should suffice.
> + *
> + * @n_roots: Number of root blocks in the roots array.
> + * @max_order: Maximum block order (log2 of largest block size / chunk_size).
> + * @chunk_size: Minimum allocation granularity in bytes. Must be at least SZ_4K.
> + * @size: Total size of the address space managed by this allocator in bytes.
> + * @avail: Total free space currently available for allocation in bytes.
> + * @clear_avail: Free space available in the clear tree (zeroed memory) in bytes.
> + *               This is a subset of @avail.
>    */
>   struct gpu_buddy {
> -	/* Maintain a free list for each order. */
> -	struct rb_root **free_trees;
> -
> +/* private: */
>   	/*
> -	 * Maintain explicit binary tree(s) to track the allocation of the
> -	 * address space. This gives us a simple way of finding a buddy block
> -	 * and performing the potentially recursive merge step when freeing a
> -	 * block.  Nodes are either allocated or free, in which case they will
> -	 * also exist on the respective free list.
> +	 * Array of red-black trees for free block management.
> +	 * Indexed as free_trees[clear/dirty][order] where:
> +	 * - Index 0 (GPU_BUDDY_CLEAR_TREE): blocks with zeroed content
> +	 * - Index 1 (GPU_BUDDY_DIRTY_TREE): blocks with unknown content
> +	 * Each tree holds free blocks of the corresponding order.
>   	 */
> -	struct gpu_buddy_block **roots;
> -
> +	struct rb_root **free_trees;
>   	/*
> -	 * Anything from here is public, and remains static for the lifetime of
> -	 * the mm. Everything above is considered do-not-touch.
> +	 * Array of root blocks representing the top-level blocks of the
> +	 * binary tree(s). Multiple roots exist when the total size is not
> +	 * a power of two, with each root being the largest power-of-two
> +	 * that fits in the remaining space.
>   	 */
> +	struct gpu_buddy_block **roots;
> +/* public: */
>   	unsigned int n_roots;
>   	unsigned int max_order;
> -
> -	/* Must be at least SZ_4K */
>   	u64 chunk_size;
>   	u64 size;
>   	u64 avail;

--------------mzIuGTL0pgJokSb989AqzrlX
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 2/11/2026 11:01 AM, Sanjay Yadav
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260211053123.260037-5-sanjay.kumar.yadav@intel.com">
      <pre wrap="" class="moz-quote-pre">Add missing kernel-doc for GPU buddy allocator flags,
gpu_buddy_block, and gpu_buddy. The documentation covers block
header fields, allocator roots, free trees, and allocation flags
such as RANGE, TOPDOWN, CONTIGUOUS, CLEAR, and TRIM_DISABLE.
Private members are marked with kernel-doc private markers
and documented with regular comments.

No functional changes.

v2:
- Corrected GPU_BUDDY_CLEAR_TREE and GPU_BUDDY_DIRTY_TREE index values (Arun)
- Rebased after DRM buddy allocator moved to drivers/gpu/
- Updated commit message

Cc: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: Arunpravin Paneer Selvam <a class="moz-txt-link-rfc2396E" href="mailto:Arunpravin.PaneerSelvam@amd.com">&lt;Arunpravin.PaneerSelvam@amd.com&gt;</a>
Suggested-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Signed-off-by: Sanjay Yadav <a class="moz-txt-link-rfc2396E" href="mailto:sanjay.kumar.yadav@intel.com">&lt;sanjay.kumar.yadav@intel.com&gt;</a>
---
 include/linux/gpu_buddy.h | 122 +++++++++++++++++++++++++++++++-------
 1 file changed, 102 insertions(+), 20 deletions(-)

diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
index 07ac65db6d2e..b06241c78437 100644
--- a/include/linux/gpu_buddy.h
+++ b/include/linux/gpu_buddy.h
@@ -12,11 +12,58 @@
 #include &lt;linux/sched.h&gt;
 #include &lt;linux/rbtree.h&gt;
 
+/**
+ * GPU_BUDDY_RANGE_ALLOCATION - Allocate within a specific address range
+ *
+ * When set, allocation is restricted to the range [start, end) specified
+ * in gpu_buddy_alloc_blocks(). Without this flag, start/end are ignored
+ * and allocation can use any free space.
+ */
 #define GPU_BUDDY_RANGE_ALLOCATION		BIT(0)
+
+/**
+ * GPU_BUDDY_TOPDOWN_ALLOCATION - Allocate from top of address space
+ *
+ * Allocate starting from high addresses and working down. Useful for
+ * separating different allocation types (e.g., kernel vs userspace)
+ * to reduce fragmentation.
+ */
 #define GPU_BUDDY_TOPDOWN_ALLOCATION		BIT(1)
+
+/**
+ * GPU_BUDDY_CONTIGUOUS_ALLOCATION - Require physically contiguous blocks
+ *
+ * The allocation must be satisfied with a single contiguous block.
+ * If the requested size cannot be allocated contiguously, the
+ * allocation fails with -ENOSPC.
+ */
 #define GPU_BUDDY_CONTIGUOUS_ALLOCATION		BIT(2)
+
+/**
+ * GPU_BUDDY_CLEAR_ALLOCATION - Prefer pre-cleared (zeroed) memory
+ *
+ * Attempt to allocate from the clear tree first. If insufficient clear
+ * memory is available, falls back to dirty memory. Useful when the
+ * caller needs zeroed memory and wants to avoid GPU clear operations.
+ */
 #define GPU_BUDDY_CLEAR_ALLOCATION		BIT(3)
+
+/**
+ * GPU_BUDDY_CLEARED - Mark returned blocks as cleared
+ *
+ * Used with gpu_buddy_free_list() to indicate that the memory being
+ * freed has been cleared (zeroed). The blocks will be placed in the
+ * clear tree for future GPU_BUDDY_CLEAR_ALLOCATION requests.
+ */
 #define GPU_BUDDY_CLEARED			BIT(4)
+
+/**
+ * GPU_BUDDY_TRIM_DISABLE - Disable automatic block trimming
+ *
+ * By default, if an allocation is smaller than the allocated block,
+ * excess memory is trimmed and returned to the free pool. This flag
+ * disables trimming, keeping the full power-of-two block size.
+ */
 #define GPU_BUDDY_TRIM_DISABLE			BIT(5)
 
 enum gpu_buddy_free_tree {
@@ -28,7 +75,27 @@ enum gpu_buddy_free_tree {
 #define for_each_free_tree(tree) \
 	for ((tree) = 0; (tree) &lt; GPU_BUDDY_MAX_FREE_TREES; (tree)++)
 
+/**
+ * struct gpu_buddy_block - Block within a buddy allocator
+ *
+ * Each block in the buddy allocator is represented by this structure.
+ * Blocks are organized in a binary tree where each parent block can be
+ * split into two children (left and right buddies). The allocator manages
+ * blocks at various orders (power-of-2 sizes) from chunk_size up to the
+ * largest contiguous region.
+ *
+ * @private: Private data owned by the allocator user (e.g., driver-specific data)
+ * @link: List node for user ownership while block is allocated
+ */
 struct gpu_buddy_block {
+/* private: */
+	/*
+	 * Header bit layout:
+	 * - Bits 63:12: block offset within the address space
+	 * - Bits 11:10: state (ALLOCATED, FREE, or SPLIT)
+	 * - Bit 9: clear bit (1 if memory is zeroed)</pre>
    </blockquote>
    I think we should add<br>
    - Bits 8:9: reserved<br>
    <br>
    Apart from that, looks good to me.<br>
    Reviewed-by:
    Arunpravin Paneer Selvam &lt;<a href="mailto:Arunpravin.PaneerSelvam@amd.com" class="moz-txt-link-freetext">Arunpravin.PaneerSelvam@amd.com</a>&gt;
    <blockquote type="cite" cite="mid:20260211053123.260037-5-sanjay.kumar.yadav@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	 * - Bits 5:0: order (log2 of size relative to chunk_size)
+	 */
 #define GPU_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
 #define GPU_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
 #define   GPU_BUDDY_ALLOCATED	   (1 &lt;&lt; 10)
@@ -43,7 +110,7 @@ struct gpu_buddy_block {
 	struct gpu_buddy_block *left;
 	struct gpu_buddy_block *right;
 	struct gpu_buddy_block *parent;
-
+/* public: */
 	void *private; /* owned by creator */
 
 	/*
@@ -53,43 +120,58 @@ struct gpu_buddy_block {
 	 * gpu_buddy_free* ownership is given back to the mm.
 	 */
 	union {
+/* private: */
 		struct rb_node rb;
+/* public: */
 		struct list_head link;
 	};
-
+/* private: */
 	struct list_head tmp_link;
 };
 
 /* Order-zero must be at least SZ_4K */
 #define GPU_BUDDY_MAX_ORDER (63 - 12)
 
-/*
- * Binary Buddy System.
+/**
+ * struct gpu_buddy - GPU binary buddy allocator
+ *
+ * The buddy allocator provides efficient power-of-two memory allocation
+ * with fast allocation and free operations. It is commonly used for GPU
+ * memory management where allocations can be split into power-of-two
+ * block sizes.
  *
- * Locking should be handled by the user, a simple mutex around
- * gpu_buddy_alloc* and gpu_buddy_free* should suffice.
+ * Locking should be handled by the user; a simple mutex around
+ * gpu_buddy_alloc_blocks() and gpu_buddy_free_block()/gpu_buddy_free_list()
+ * should suffice.
+ *
+ * @n_roots: Number of root blocks in the roots array.
+ * @max_order: Maximum block order (log2 of largest block size / chunk_size).
+ * @chunk_size: Minimum allocation granularity in bytes. Must be at least SZ_4K.
+ * @size: Total size of the address space managed by this allocator in bytes.
+ * @avail: Total free space currently available for allocation in bytes.
+ * @clear_avail: Free space available in the clear tree (zeroed memory) in bytes.
+ *               This is a subset of @avail.
  */
 struct gpu_buddy {
-	/* Maintain a free list for each order. */
-	struct rb_root **free_trees;
-
+/* private: */
 	/*
-	 * Maintain explicit binary tree(s) to track the allocation of the
-	 * address space. This gives us a simple way of finding a buddy block
-	 * and performing the potentially recursive merge step when freeing a
-	 * block.  Nodes are either allocated or free, in which case they will
-	 * also exist on the respective free list.
+	 * Array of red-black trees for free block management.
+	 * Indexed as free_trees[clear/dirty][order] where:
+	 * - Index 0 (GPU_BUDDY_CLEAR_TREE): blocks with zeroed content
+	 * - Index 1 (GPU_BUDDY_DIRTY_TREE): blocks with unknown content
+	 * Each tree holds free blocks of the corresponding order.
 	 */
-	struct gpu_buddy_block **roots;
-
+	struct rb_root **free_trees;
 	/*
-	 * Anything from here is public, and remains static for the lifetime of
-	 * the mm. Everything above is considered do-not-touch.
+	 * Array of root blocks representing the top-level blocks of the
+	 * binary tree(s). Multiple roots exist when the total size is not
+	 * a power of two, with each root being the largest power-of-two
+	 * that fits in the remaining space.
 	 */
+	struct gpu_buddy_block **roots;
+/* public: */
 	unsigned int n_roots;
 	unsigned int max_order;
-
-	/* Must be at least SZ_4K */
 	u64 chunk_size;
 	u64 size;
 	u64 avail;
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------mzIuGTL0pgJokSb989AqzrlX--
