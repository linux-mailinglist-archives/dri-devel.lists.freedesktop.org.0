Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ip9EOvAd2nKkgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 20:30:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BA98C911
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 20:30:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190A710E475;
	Mon, 26 Jan 2026 19:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JwNEmQyt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010056.outbound.protection.outlook.com
 [40.93.198.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B6810E475
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 19:30:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrYvl0D6KoWOeujJdZ1JODo939uyuVHeJ7u8kQM7UsL8g7Gj27hljyqHkaRhWa8AMfz8Gmwi6owoBPxCovEQa1+Z4mj3KXQ3VDQQLd28jbl8vHq8pxMiOX5nIi3Aw1wzmPuAloli1yOPTEUeVLI5TJeoXMcj6oV0dqRsGcY54KXQDxM+ZveBQzx+KVfjwc3DjNOPmHUmx5LL/Zmb543lGtFy88BfXJB0d8txoawpwjgBzgpOh8xfAYKVg9S1OkgrtQoyKPaOD5+ouVJGQ4ocIREK5rtBcOCh9Q1udtIWE8G/EN0vlLjg2q/PTp7aLcdNqKJzv5qhLKrV7D+NwSXChg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfIUppSul99aX6DqnvemOeJAPB5nPwkIE3tN++Xo6qw=;
 b=MQGiTkuw8uaenEUIot9ApXw93Q+i42jPy2UI5zzm5c/JqMIltojEU9Pdjby8A6Wfgl+0tBJlK9OyUZTnvgZjaWA2goE2kywGV0+6KUTXdNc4SQ5wM2ZVOQ40MTbcUDUqAtvcJfNx9H/oiW2H3VDdUBfUHnu1L25rEFXCp4QN3lxWl7U18HhePFAODFTkARCvhvjPTTZLBv9LJeYrU274ZABz86p0Kclnx2y0Tx0PFjYZWH2r8SRIJ3mneFXzjTui8JauZf/HC1ElUUm/BSV7WmDC5b9fM3gszEhbWCxxWdJu8b6jZUX0VEPgPJKVYlPh8q8kTAvFw/SUsmY2PpnlqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfIUppSul99aX6DqnvemOeJAPB5nPwkIE3tN++Xo6qw=;
 b=JwNEmQytpwy6yYPGLmGzU/hXqfafYTxjGJiZSH6YdJ+imFVQiE8Spxr7/fJ/HauVKeBRyiogP3wBp82uMHh8ykDC+pk/6SV3xLhw4njTkH8xUBZpYGkNXpvWVmEAxkGRfTb5iI0MPII+MRB8YSacph52L6QmlkcgorUHrRVEHKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN0PR12MB6151.namprd12.prod.outlook.com (2603:10b6:208:3c5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 19:30:44 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 19:30:44 +0000
Message-ID: <3981d528-140c-42c7-94b7-007a84c1476f@amd.com>
Date: Mon, 26 Jan 2026 13:30:36 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/5] accel/amd_vpci: Add new driver for AMD Versal PCI
 accelerator
To: David Zhang <yidong.zhang@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sonal.santan@amd.com, lizhi.hou@amd.com,
 DMG Karthik <Karthik.DMG@amd.com>, Nishad Saraf <nishads@amd.com>
References: <yidong.zhang@amd.com>
 <20260126192732.1507084-1-yidong.zhang@amd.com>
 <20260126192732.1507084-3-yidong.zhang@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260126192732.1507084-3-yidong.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CP5P284CA0081.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:93::14) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN0PR12MB6151:EE_
X-MS-Office365-Filtering-Correlation-Id: 23c67211-722c-44cf-93aa-08de5d11660d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGJJSktMU01ZeFlTSmZ6dzFCUnk2dnBqWk4yaHA2Q2dNeTdpMkNUYlA3OEho?=
 =?utf-8?B?ZmowMDRaS0crWUtWY0l3Q2tKckd0Q3p1aTdMS2pjQ3pzN1FCMXZxUDRmR0N1?=
 =?utf-8?B?c21sWmJaVnZ1NmxXVnJORHFhZE4zSU1YTGhrQzVkREs3SDFYNzB0ODZYYjdh?=
 =?utf-8?B?Y2pTS1krTExwWWdydGRROXlQbTFrQXdKbUg1V2dtcHE5RTRRWmJzVlZxZ3lP?=
 =?utf-8?B?SWlscVExVjhFRVpNZG9LM29CRUdLdDdjZXBoRENYYUhXSVY2eDMzV0Mybk9Z?=
 =?utf-8?B?MHpoZDZicW40OE1PaUpxM3BtWjdRcmI2Y1JodmRpQVVhNi9jYUpnL0dLNE9R?=
 =?utf-8?B?UHVPTWVoWW1PMG9HaVdCYzN1dkpXVVk4QUs5QXB5dFZNUmpWR2hLa05ZSlBt?=
 =?utf-8?B?MHZ1T0RWbzdzMHdrUGlvZG8xdnBhUlFzL0tYNHFVODhFaWhnNlpzbXVsSkRu?=
 =?utf-8?B?bGJONjE0WEVCRVA3Q3oyakVQd2lpVG9TV1BJbDB0bnRYY2x6cTVMZ1JEWWdX?=
 =?utf-8?B?b1R5RGc4OUt1NjllTWQzRklCbXNjZUcvMkpYcU9MR05OZnphQnhiY1Z3OFZ1?=
 =?utf-8?B?ZjdleXM0ZTNLaFN0VldWNDVTZEZXUnYycjRVSDVGY0lkUWJ0RmhMQzQvVVVl?=
 =?utf-8?B?MEhKTzJwTU9ORzhZcWZFdjlCQzVGdVc4Q09xdFBLbmNoY1pQWmtOQzRKNFBM?=
 =?utf-8?B?Y0NPa2ZlUGRETTRZRWhVSDFiTFhIalBYNjhxMkIrMmErY1VtV2FEUXFHaXpV?=
 =?utf-8?B?NEdtRzlCaklFTGdWM0xYTkozcFJMSGswMTYrNXVEYlRxbS8vdG1rSzJCWjds?=
 =?utf-8?B?SS8rSUVOMGZMbHdFZ1BIK2lBSEtveVladDVFNzNMM0xvQzZieTE5a0s2NUln?=
 =?utf-8?B?OXFCc0tDbHZOQnhGVHhrUDRXaTVyTzVSUGFzZFkyZDlqMzhuY0FCN3V3UWVt?=
 =?utf-8?B?cExKc0dPUHErUUpVdmwvbTRnVFdlTU1NRTBIYzEySUJGajFHMWMzYlI4WVNO?=
 =?utf-8?B?NlNnVDZXV0U3cDRxMDFKZlB6ZWQvRWl2UEt5MndZaW5rbi8vYkxhV21ld1hK?=
 =?utf-8?B?b0RrQVd1TVRJVzVVRjZ2QVJnWmtVRlBYd0RSU1hWMmt4UnNjcUNHSGxsenVx?=
 =?utf-8?B?cGt5bEpnQWxmWGZpOHNyeXc2N0huVGJTckNRYjRJMC8wN1ZEeTc1KzA2KytS?=
 =?utf-8?B?azZXZnBmbHlReXdOZFVrM0loeXhDV21xSEN6UUdoaDZLZ1ZmTkM2NXB1RU9l?=
 =?utf-8?B?R2VHN1M4YXVjNmdheUdFdFZYSXpmbGdyL1o1TW0yZTV0elc2YVNQR3VKNE5X?=
 =?utf-8?B?anlPL0FkbGs2aTBxbzBtZkorMjdUaFRhZDhiZWRYbmdFdHpTK0d0bHJja3FL?=
 =?utf-8?B?a216ODJqeTN0eUtUdEJLNWdTdWxDeFhaMFE2c0VndkFXWUJJNU9EM2kwTHZI?=
 =?utf-8?B?ZEhab0xWSU5Pdm5XNUNJWktiVms2bFE5Uy9zdWRrbEtTMlZkNGJyMENiMEtj?=
 =?utf-8?B?NzNrZnBUTW5xdUwwTTJCVDlwRlZmdTZEVURhVkFHVWlBem11alpwaEdITGZN?=
 =?utf-8?B?cFlVOHhNU0tpc2tuc2JrSThITEFBTmsyMzVGMTJCOGNTdklIRmh2bVM3SHpp?=
 =?utf-8?B?bTlrM0JZWVZyVnorVFdvMUx2aVY2aHRRdW81VG1CbkVycEMyRXRiM3BvK2RJ?=
 =?utf-8?B?b2pjRngrdER6NU5RWEpXcmhneGpIUGpTZUp0N0JncDUzR1hUc3ZNQjBGdC9K?=
 =?utf-8?B?OUJaWjJ2QXlDanltRnpzSnNkMVFRN1VKMzJ3NllwQUdnVitNVHFEVnZvUFdu?=
 =?utf-8?B?NnliZTVBQnlSR2xPUUJmZkhLclJYUGtFeStOOUZRQ09ac21xMHFuaE80Wmhw?=
 =?utf-8?B?djdRQWdWcSt2OVhRK0NNNzlmY1NlaXM5YndNMm10VnZIOFd4MjhmOUY5SXRV?=
 =?utf-8?B?VzBGS1JPUkFCd0ZwR0w3QTNDV0pXN2JOZDdKVTJQbkpRYmFnNjRyRERaSjBa?=
 =?utf-8?B?MElhU01KTW01UUNQVWVKNkhNWXpMa3hETzY1UVJmL3FDN0RIUmowMExnT0ly?=
 =?utf-8?B?L2c5S3IvbFF0a2NOeHowR3FlYkFvNmtiK3FDSzFiQXlZVWNRYk5kSmpMakF4?=
 =?utf-8?Q?iwDA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RG1KSmhBd0VFMVJGVExJVmkzM2cwUnpzODV3QVBLZkFDa3VGU1VyZHV2ZlNh?=
 =?utf-8?B?bVdLZ3hQZ0t4U0U0N1pqYUZIMWZycERBVHNhTkZjRWJKM1E1RmoyN0dRRXUz?=
 =?utf-8?B?Z05sZmk4WE1HcWdkNktDNHFlYnQ3UkxjV1J5dTdRVm0zYmNiNFFuQytwTk4z?=
 =?utf-8?B?N2htNGZTZTRxUmlvdlFhMFhoZDJlZVN1REx2MUZkeTlpZEMxYldORkh1NlB1?=
 =?utf-8?B?NHlFUzRidTkzUUNqSnhqTnNwYXFtUTZWT1I2MW5ONjQ4alBXTHU4QjBpWHdn?=
 =?utf-8?B?dk5UMnhTNlVNN0grLzNrWk4xNzdPSlRRd0ovdVBXbmpTNnpueG1yNVQzQjBI?=
 =?utf-8?B?aU1XWTZ4WEd2THVoWE5aKzdHelFWTEJ1bjFLUGtDWTAzZDdyVC9qUFY5bm91?=
 =?utf-8?B?WVdmaG9jSndqV3hCcEhmS3JIYjM1SkVvVnhPL1lXaTBCNGI1bHczSEVrdFNz?=
 =?utf-8?B?WXBkanNYVEEvOWpRcUh3dWJVblNweFV5ZjlCMmtBY3FidVNFZEduOVVWWno4?=
 =?utf-8?B?RUVpZFZEQXQzMlhwbzNlNUlWc2k3bVV1SzkvYkM0MFV2UkQybE40dWd1eGpS?=
 =?utf-8?B?TWt6cm1kTmZxdFd6TC9HZzNrUXYxVnQxdzJsNkduU1M2bU96di9QekhLN0Jo?=
 =?utf-8?B?eVZCKzRMTEVTMlNDQjBmOG4ySzdDdWJIcndlN0tHOERVOHo1eUYvbGQyNGl0?=
 =?utf-8?B?aEozeTBJYTFDYzZ6TDRrYlJUUldKVXY5ZVgySEJ6U0xvdmpkRjhIY1gxT3NI?=
 =?utf-8?B?ajQ2ekNIdEEzazFsa09JM05Lc0NJcUpoRVRCbWFIT2pKck42ZjFEa3FGMGVk?=
 =?utf-8?B?QzdzUnhNcEIxMWFubEQxUlNoYVhIKzVtMlNLaGRjQkdiTmd5ZG9jeVR3ajFJ?=
 =?utf-8?B?M0VORXY4Nkl5NndNWDZtYmtWRWx2SE9MenRPV0lZTHlsVVBha3NoZ3dqVmNo?=
 =?utf-8?B?UmRHQUl0SUZJQVlUZklVcG94QXVRM1lxazJabnNoMm5GRHlOaUxJa2pHMzBR?=
 =?utf-8?B?Q2dJb2tQZ24raFhtU3ZMYmxGY1I0VVFOMWIzb1JqME04aDVjMUZ3ckpNakJL?=
 =?utf-8?B?VUJHZTZMbGNZbk9wMUFpMndrRzF4TGZUWWVtclhKV0NkQnExN1VXQ2xHU3dD?=
 =?utf-8?B?WXVXS3FjWFN2QVJzVFN5dTlIOTR1eXkwa2NxZ1MwTkJIeGRuOG13NDE1MWVQ?=
 =?utf-8?B?M2NLUi9vOXZrMDJoSUptd2hER3FnamtDMVAwSzNLWXJDUjZBVnRXS0Q1aHJE?=
 =?utf-8?B?dndhSXhZMWlWNnphUDJVZUJDSmtEeXpIUEZ3M3hDdG5BcHJsc1dsOTN2RmM0?=
 =?utf-8?B?SDZkVGluUW5vWVRmYTZrTzFVdWNRRCsveHBaSm1rcnpvU2tZOXhFSVdxZFpI?=
 =?utf-8?B?bXQ5dTBvOFpveU5aVk5oZVM4UDFqcWFBNjM2VlhKQnpQVDJGb2xxakZUd2s0?=
 =?utf-8?B?RktBZnprK1VJelpFY1M3d2dRTDdURUNWTFhOR3oxdC9OaGpWRVIyWTlMRjZT?=
 =?utf-8?B?bFlKb2dqanV1cTZyY3pxcW1HT04wL0NZaklyMEE0TlBXOVphbWZkZlY1N3dD?=
 =?utf-8?B?L3ZEN01ubk1Md3pMRmcvSFBwM292MzkrbnBkRkMzY0tmQmxxWS9EVCtCTStn?=
 =?utf-8?B?T1JLeXRTc3dlb0crckVlbE1tS1FjcEVSSjViV3dXV2hOc2ltZ0JMWk9HcEpl?=
 =?utf-8?B?djlidTdBcWZRTUY5dHlpekU0am00MDBQcDJGRW5ka1hJeGpFRzFvdFZzQ3or?=
 =?utf-8?B?UW1HRzNCRG9BZzh2SDZ5VTMvT25uaVdRd0FTeGgzSlQ2ekpsbC9DNHpHSjBj?=
 =?utf-8?B?YitUSDdvMDJEbFFvS2I4NmVRVHcxM3I0elZiYU5pUDNWaTBaOHlUSHdmcUNz?=
 =?utf-8?B?eG5Nd1hmR29sTEY2Y3Fwb2c2SzJjanFwMk42Z2hHOG1QbWJQTkdpOUZRZG9x?=
 =?utf-8?B?alNqaWtHZTc1MnNEUXZuL1U3QjJJMmpSRnhkQTZjVmlRZW54VzVjWEk1MC9N?=
 =?utf-8?B?V2p2SEJYZHZwY1pCbFErWlZJUzNuQ2lQMlI4RjhONWdpczg5ME83WlhYTWdq?=
 =?utf-8?B?b1puc2ZiUzBSdDhMVG54T1Zha1F2TnFPRjRGR245R3BVWUp5dUpQbGpUYUNw?=
 =?utf-8?B?SExpWTVEYytlcWZyRlMwNUdlNzdQQzZyNWppT2pPeGpIeEtCaUR3ZFcvWHdF?=
 =?utf-8?B?TDF1VzZUL1lKUTZBT2lrclVKSFl6SGdGaWdhM0NvY1NrbVpmbW55d2pJak91?=
 =?utf-8?B?dy9oNWVKSy9EaExZQS9zaHl0V21ldW5BbitmWlJmd25FelZPdnZyeEJjWitD?=
 =?utf-8?B?VnhScjMxcDhBNDl2ZlJSVUgyY1JBUnRmcXJPSzhaVEk5TG43RnhXUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c67211-722c-44cf-93aa-08de5d11660d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 19:30:44.3826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xW2UKkXpNfmiFC0MEZE6katitj5ivw/R+u4yeeukozJMCclr1PeSuUFlIcG9RCu2SfktZ8CkSDPXlRwaQpWviA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6151
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:yidong.zhang@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:sonal.santan@amd.com,m:lizhi.hou@amd.com,m:Karthik.DMG@amd.com,m:nishads@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: B8BA98C911
X-Rspamd-Action: no action



On 1/26/2026 1:27 PM, David Zhang wrote:
> This patch introduces a new PCI driver for AMD Versal-based accelerator
> cards.
> 
> The driver provides basic module and PCI device initialization, based on
> BAR resources used to establish a hardware queue-based ring buffer between
> the PCIe host and the Versal Management Runtime (VMR) service running on
> the embedded SoC. This interface enables firmware management and board
> health monitoring.
> 
> Key features:
>     - PCI probe and BAR resource initialization.
>     - Integration with configfs for firmware management
>     - Compatibility check using firmware-reported UUIDs
> 
> The base firmware image is expected under /lib/firmware/xilinx/<fw_name>
> and can be programmed to the device through the configfs interface.
> Firmware transfer is handled via a remote queue service (added in a later
> patch).
> 
> Co-developed-by: DMG Karthik <Karthik.DMG@amd.com>
> Signed-off-by: DMG Karthik <Karthik.DMG@amd.com>
> Co-developed-by: Nishad Saraf <nishads@amd.com>
> Signed-off-by: Nishad Saraf <nishads@amd.com>
> Signed-off-by: David Zhang <yidong.zhang@amd.com>
> ---
>   MAINTAINERS                              |   5 +
>   drivers/accel/Kconfig                    |   1 +
>   drivers/accel/Makefile                   |   3 +-
>   drivers/accel/amd_vpci/Kconfig           |  15 ++
>   drivers/accel/amd_vpci/Makefile          |   6 +
>   drivers/accel/amd_vpci/versal-pci-main.c | 280 +++++++++++++++++++++++
>   drivers/accel/amd_vpci/versal-pci.h      |  62 +++++
>   7 files changed, 371 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/accel/amd_vpci/Kconfig
>   create mode 100644 drivers/accel/amd_vpci/Makefile
>   create mode 100644 drivers/accel/amd_vpci/versal-pci-main.c
>   create mode 100644 drivers/accel/amd_vpci/versal-pci.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6863d5fa07a1..8fb7276eb7c1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1271,6 +1271,11 @@ F:	drivers/spi/spi-amd-pci.c
>   F:	drivers/spi/spi-amd.c
>   F:	drivers/spi/spi-amd.h
>   
> +AMD VERSAL PCI DRIVER
> +M:	Yidong Zhang <yidong.zhang@amd.com>
> +S:	Supported
> +F:	drivers/accel/amd_vpci/
> +
>   AMD XDNA DRIVER
>   M:	Min Ma <mamin506@gmail.com>
>   M:	Lizhi Hou <lizhi.hou@amd.com>
> diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
> index bdf48ccafcf2..f80998fdb3fc 100644
> --- a/drivers/accel/Kconfig
> +++ b/drivers/accel/Kconfig
> @@ -25,6 +25,7 @@ menuconfig DRM_ACCEL
>   	  and debugfs).
>   
>   source "drivers/accel/amdxdna/Kconfig"
> +source "drivers/accel/amd_vpci/Kconfig"
>   source "drivers/accel/ethosu/Kconfig"
>   source "drivers/accel/habanalabs/Kconfig"
>   source "drivers/accel/ivpu/Kconfig"
> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
> index 1d3a7251b950..be62e08bbef1 100644
> --- a/drivers/accel/Makefile
> +++ b/drivers/accel/Makefile
> @@ -1,8 +1,9 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   
>   obj-$(CONFIG_DRM_ACCEL_AMDXDNA)		+= amdxdna/
> +obj-$(CONFIG_DRM_ACCEL_AMD_VPCI)	+= amd_vpci/
>   obj-$(CONFIG_DRM_ACCEL_ARM_ETHOSU)	+= ethosu/
>   obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
>   obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
>   obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
> -obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
> \ No newline at end of file
> +obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
> diff --git a/drivers/accel/amd_vpci/Kconfig b/drivers/accel/amd_vpci/Kconfig
> new file mode 100644
> index 000000000000..dcf83bf3d8e6
> --- /dev/null
> +++ b/drivers/accel/amd_vpci/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config DRM_ACCEL_AMD_VPCI
> +	tristate "AMD Versal PCIe Management Driver"
> +	depends on DRM_ACCEL
> +	depends on PCI && HAS_IOMEM
> +	select FW_LOADER
> +	select CONFIGFS_FS
> +	default m
> +	help
> +	  AMD Versal PCIe Management Driver provides management services,
> +	  including download firmware, program bitstream, and communicate with
> +	  the User function.
> +
> +	  If "M" is selected, the driver module will be versal-pci
> diff --git a/drivers/accel/amd_vpci/Makefile b/drivers/accel/amd_vpci/Makefile
> new file mode 100644
> index 000000000000..03849875ad0b
> --- /dev/null
> +++ b/drivers/accel/amd_vpci/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +
> +obj-$(CONFIG_DRM_ACCEL_AMD_VPCI) := versal-pci.o
> +
> +versal-pci-y := \
> +	versal-pci-main.o
> diff --git a/drivers/accel/amd_vpci/versal-pci-main.c b/drivers/accel/amd_vpci/versal-pci-main.c
> new file mode 100644
> index 000000000000..36f88d5aee95
> --- /dev/null
> +++ b/drivers/accel/amd_vpci/versal-pci-main.c
> @@ -0,0 +1,280 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for Versal PCIe device
> + *
> + * Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
> + */
> +
> +#include <linux/pci.h>
> +
> +#include "versal-pci.h"
> +
> +#define DRV_NAME			"amd-versal-pci"
> +
> +#define PCI_DEVICE_ID_V70PQ2		0x50B0
> +#define PCI_DEVICE_ID_RAVE		0x5700
> +#define VERSAL_XCLBIN_MAGIC_ID		"xclbin2"
> +
> +static inline u32 versal_pci_devid(struct versal_pci_device *vdev)
> +{
> +	return ((pci_domain_nr(vdev->pdev->bus) << 16) |
> +		PCI_DEVID(vdev->pdev->bus->number, vdev->pdev->devfn));
> +}
> +
> +static int versal_pci_load_shell(struct versal_pci_device *vdev, char *fw_name)
> +{
> +	const struct firmware *fw;
> +	struct axlf *xsabin;
> +	int ret;
> +
> +	strim(fw_name);
> +
> +	ret = request_firmware(&fw, fw_name, &vdev->pdev->dev);
> +	if (ret) {
> +		vdev_warn(vdev, "request xsabin fw %s failed %d", fw_name, ret);
> +		return ret;
> +	}
> +
> +	xsabin = (struct axlf *)fw->data;
> +	if (memcmp(xsabin->magic, VERSAL_XCLBIN_MAGIC_ID, strlen(VERSAL_XCLBIN_MAGIC_ID))) {
> +		vdev_err(vdev, "Invalid device firmware");
> +		ret = -EINVAL;
> +		goto release_firmware;
> +	}
> +
> +	if (!fw->size ||
> +	    fw->size != xsabin->header.length ||
> +	    fw->size < sizeof(*xsabin) ||
> +	    fw->size > SZ_1G) {
> +		vdev_err(vdev, "Invalid device firmware size %zu", fw->size);
> +		ret = -EINVAL;
> +		goto release_firmware;
> +	}
> +
> +	if (!uuid_equal(&vdev->intf_uuid, &xsabin->header.rom_uuid)) {
> +		vdev_err(vdev, "base shell doesn't match uuid %pUb", &xsabin->header.rom_uuid);
> +		ret = -EINVAL;
> +		goto release_firmware;
> +	}
> +
> +	/* TODO upload fw to card */
> +	if (ret) {
> +		vdev_err(vdev, "failed to load xsabin %s : %d", fw_name, ret);
> +		goto release_firmware;
> +	}
> +
> +	vdev_info(vdev, "Downloaded xsabin %pUb of size %lld Bytes",
> +		  &xsabin->header.uuid, xsabin->header.length);
> +
> +release_firmware:
> +	release_firmware(fw);
> +
> +	return ret;
> +}
> +
> +static inline struct versal_pci_device *item_to_vdev(struct config_item *item)
> +{
> +	return container_of(to_configfs_subsystem(to_config_group(item)),
> +			    struct versal_pci_device, cfs_subsys);
> +}
> +
> +static ssize_t versal_pci_cfs_config_store(struct config_item *item,
> +					   const char *page, size_t count)
> +{
> +	struct versal_pci_device *vdev = item_to_vdev(item);
> +	u32 config;
> +	int ret;
> +
> +	ret = kstrtou32(page, 0, &config);
> +	if (ret)
> +		return -EINVAL;
> +
> +	if (config)
> +		ret = versal_pci_load_shell(vdev, vdev->fw.name);
> +
> +	if (ret)
> +		return -EFAULT;
> +
> +	return count;
> +}
> +CONFIGFS_ATTR_WO(versal_pci_cfs_, config);
> +
> +static ssize_t versal_pci_cfs_image_show(struct config_item *item, char *page)
> +{
> +	struct versal_pci_device *vdev = item_to_vdev(item);
> +
> +	vdev_info(vdev, "fw name: %s", vdev->fw.name);
> +
> +	return 0;
> +}
> +
> +static ssize_t versal_pci_cfs_image_store(struct config_item *item,
> +					  const char *page, size_t count)
> +{
> +	struct versal_pci_device *vdev = item_to_vdev(item);
> +
> +	count = snprintf(vdev->fw.name, sizeof(vdev->fw.name), "%s", page);
> +
> +	vdev_info(vdev, "fw name: %s", vdev->fw.name);
> +	return count;
> +}
> +CONFIGFS_ATTR(versal_pci_cfs_, image);
> +
> +static struct configfs_attribute *versal_pci_cfs_attrs[] = {
> +	&versal_pci_cfs_attr_config,
> +	&versal_pci_cfs_attr_image,
> +	NULL,
> +};
> +
> +static const struct config_item_type versal_pci_cfs_table = {
> +	.ct_owner = THIS_MODULE,
> +	.ct_attrs = versal_pci_cfs_attrs,
> +};
> +
> +static int versal_pci_cfs_init(struct versal_pci_device *vdev)
> +{
> +	struct configfs_subsystem *subsys = &vdev->cfs_subsys;
> +
> +	snprintf(subsys->su_group.cg_item.ci_namebuf,
> +		 sizeof(subsys->su_group.cg_item.ci_namebuf),
> +		 "%s%x", DRV_NAME, versal_pci_devid(vdev));
> +
> +	subsys->su_group.cg_item.ci_type = &versal_pci_cfs_table;
> +
> +	config_group_init(&subsys->su_group);
> +	return configfs_register_subsystem(subsys);
> +}
> +
> +static void versal_pci_fw_fini(struct versal_pci_device *vdev)
> +{
> +	uuid_copy(&vdev->intf_uuid, &uuid_null);
> +}
> +
> +static void versal_pci_cfs_fini(struct configfs_subsystem *subsys)
> +{
> +	configfs_unregister_subsystem(subsys);
> +}
> +
> +static void versal_pci_device_teardown(struct versal_pci_device *vdev)
> +{
> +	versal_pci_cfs_fini(&vdev->cfs_subsys);
> +	versal_pci_fw_fini(vdev);
> +}
> +
> +static int versal_pci_uuid_parse(struct versal_pci_device *vdev, uuid_t *uuid)
> +{
> +	char str[UUID_STRING_LEN];
> +	u8 i, j;
> +	int len = strlen(vdev->fw_id);
> +
> +	/* parse uuid into a valid uuid string format */
> +	for (i = 0, j = 0; i < len && i < sizeof(str); i++) {
> +		str[j++] = vdev->fw_id[i];
> +		if (j == 8 || j == 13 || j == 18 || j == 23)
> +			str[j++] = '-';
> +	}
> +
> +	if (uuid_parse(str, uuid)) {
> +		vdev_warn(vdev, "Invalid fw_id format");
> +		return -EINVAL;
> +	}
> +
> +	vdev_info(vdev, "Interface uuid %pU", uuid);

Is the UUID from the ROM not considered sensitive?  The system UUID is.

❮ cat /sys/class/dmi/id/product_uuid
cat: /sys/class/dmi/id/product_uuid: Permission denied

Besides this comment some errors are showing it too AFAICT.

> +	return 0;
> +}
> +
> +static int versal_pci_fw_init(struct versal_pci_device *vdev)
> +{
> +	int ret;
> +
> +	/* TODO request compatible fw_id from card */
> +
> +	ret = versal_pci_uuid_parse(vdev, &vdev->intf_uuid);
> +
> +	return ret;
> +}
> +
> +static int versal_pci_device_setup(struct versal_pci_device *vdev)
> +{
> +	int ret;
> +
> +	ret = versal_pci_fw_init(vdev);
> +	if (ret) {
> +		vdev_err(vdev, "Failed to init fw, err %d", ret);
> +		goto comm_chan_fini;
> +	}
> +
> +	ret = versal_pci_cfs_init(vdev);
> +	if (ret) {
> +		vdev_err(vdev, "Failed to init configfs subsys, err %d", ret);
> +		goto comm_chan_fini;
> +	}
> +
> +	return 0;
> +
> +comm_chan_fini:
> +	versal_pci_fw_fini(vdev);
> +
> +	return ret;
> +}
> +
> +static void versal_pci_remove(struct pci_dev *pdev)
> +{
> +	struct versal_pci_device *vdev = pci_get_drvdata(pdev);
> +
> +	versal_pci_device_teardown(vdev);
> +}
> +
> +static int versal_pci_probe(struct pci_dev *pdev, const struct pci_device_id *pdev_id)
> +{
> +	struct versal_pci_device *vdev;
> +	int ret;
> +
> +	vdev = devm_kzalloc(&pdev->dev, sizeof(*vdev), GFP_KERNEL);
> +	if (!vdev)
> +		return -ENOMEM;
> +
> +	pci_set_drvdata(pdev, vdev);
> +	vdev->pdev = pdev;
> +
> +	ret = pcim_enable_device(pdev);
> +	if (ret) {
> +		vdev_err(vdev, "Failed to enable device %d", ret);
> +		return ret;
> +	}
> +
> +	vdev->io_regs = pcim_iomap_region(vdev->pdev, MGMT_BAR, DRV_NAME);
> +	if (IS_ERR(vdev->io_regs)) {
> +		vdev_err(vdev, "Failed to map RM shared memory BAR%d", MGMT_BAR);
> +		return PTR_ERR(vdev->io_regs);
> +	}
> +
> +	ret = versal_pci_device_setup(vdev);
> +	if (ret) {
> +		vdev_err(vdev, "Failed to setup Versal device %d", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct pci_device_id versal_pci_ids[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_XILINX, PCI_DEVICE_ID_V70PQ2), },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_XILINX, PCI_DEVICE_ID_RAVE), },
> +	{ 0 }
> +};
> +
> +MODULE_DEVICE_TABLE(pci, versal_pci_ids);
> +
> +static struct pci_driver versal_pci_driver = {
> +	.name = DRV_NAME,
> +	.id_table = versal_pci_ids,
> +	.probe = versal_pci_probe,
> +	.remove = versal_pci_remove,
> +};
> +
> +module_pci_driver(versal_pci_driver);
> +
> +MODULE_DESCRIPTION("AMD Versal PCIe Management Driver");
> +MODULE_AUTHOR("XRT Team <runtimeca39d@amd.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/accel/amd_vpci/versal-pci.h b/drivers/accel/amd_vpci/versal-pci.h
> new file mode 100644
> index 000000000000..890da1d6bcc9
> --- /dev/null
> +++ b/drivers/accel/amd_vpci/versal-pci.h
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Driver for Versal PCIe device
> + *
> + * Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
> + */
> +
> +#ifndef __VERSAL_PCI_H
> +#define __VERSAL_PCI_H
> +
> +#include <linux/configfs.h>
> +#include <linux/firmware.h>
> +
> +#define MGMT_BAR		0
> +
> +#define vdev_info(vdev, fmt, args...)					\
> +	dev_info(&(vdev)->pdev->dev, "%s: "fmt, __func__, ##args)
> +
> +#define vdev_warn(vdev, fmt, args...)					\
> +	dev_warn(&(vdev)->pdev->dev, "%s: "fmt, __func__, ##args)
> +
> +#define vdev_err(vdev, fmt, args...)					\
> +	dev_err(&(vdev)->pdev->dev, "%s: "fmt, __func__, ##args)
> +
> +#define vdev_dbg(vdev, fmt, args...)					\
> +	dev_dbg(&(vdev)->pdev->dev, fmt, ##args)
> +
> +struct versal_pci_device;
> +
> +struct axlf_header {
> +	__u64				length;
> +	__u8				reserved1[24];
> +	uuid_t				rom_uuid;
> +	__u8				reserved2[64];
> +	uuid_t				uuid;
> +	__u8				reserved3[24];
> +} __packed;
> +
> +struct axlf {
> +	__u8				magic[8];
> +	__u8				reserved[296];
> +	struct axlf_header		header;
> +} __packed;
> +
> +struct fw_info {
> +	__u32				opcode;
> +	char				name[128];
> +};
> +
> +struct versal_pci_device {
> +	struct pci_dev			*pdev;
> +
> +	struct fw_info			fw;
> +
> +	void __iomem			*io_regs;
> +	uuid_t				intf_uuid;
> +	__u8				fw_id[UUID_STRING_LEN + 1];
> +
> +	struct configfs_subsystem	cfs_subsys;
> +};
> +
> +#endif	/* __VERSAL_PCI_H */

