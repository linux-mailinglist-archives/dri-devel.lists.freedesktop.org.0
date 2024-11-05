Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 875AF9BD909
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 23:49:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D69F10E181;
	Tue,  5 Nov 2024 22:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JD/cLKjD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84A310E181
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 22:48:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uv/mDu4DSd0B9x3udxzLq0hg80U1ozWe4MkavIrx3rDfWFfnBACc9UxOUO/xI9QdKLDrLOvCxE+ASqQsA+o1etzK3p2vysYAPjU9rk4CxvMCHhVEEBEcpgGBqmEJWFlvasNqNxEdkBr2X2tQ53XHqgD1peolQQ+qZTwqiRrSB42IN4KO68U4cMPIKxQ+cQegqxm6rulg1yQ6aD81r6M3l5H9xl4/bfvHQuylwwb1ByPNbCvKrguBWcNRf+S9M3M8cc68HDEJDe8FQTovhsK9KSFthTzKeJIO7H89tJuwFIrNHQ8qJGkgmQ949+E+mleHgLPG5d21OdS9oBbpqFDnVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NUIelqgOQl3UzpgeaUI7cobYS0VMF/xGnyMfHWVOo14=;
 b=qW/xWa2H7dWETc5mNb3DGrKTEodnuR0cydhYFEzJl5thfA4qrCRkRtAdTC67OM6QU7YYPkf0ACcUGZInyYeJ9F13HwaMFVW314Dn+NU6fsiRCCVRx9VA2NM/lhqUB7uiajKODrRfcH17o9JUSuZTdD3VwFsKfbvtpA7j91svP29h7e7hQ4XY0930nIeKwBi4lADY747/g9hsJ/NPHUB/Z++8SNu8yn0A/PqM05XmFfgCkdQ+xrBCMG0YDGlDdG9h2+lpw2BKSIVviZFNU09ti5M1NJev9rwnOLbymAegp4BIOAuvKR0wF8t8Ny6AMNKL6oGK6ByoDOs1afFpOv7zlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUIelqgOQl3UzpgeaUI7cobYS0VMF/xGnyMfHWVOo14=;
 b=JD/cLKjDDNGyGOTLDSkA2NMOldzHwHGDNp805v6ZNZB673w/B1XYvUNJHZ5TyUrkzyz0kd4EpUz/5FQkTyo4nGSb4OMSjewuJt+LBSZ2a5f0kUZMs20Hq4/PunkEnNamz8pn00cg3teE0xfhTl2MdclPqCruWrcdElkW77fmZY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by MN2PR12MB4079.namprd12.prod.outlook.com (2603:10b6:208:1d5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Tue, 5 Nov
 2024 22:48:54 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4%4]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 22:48:53 +0000
Message-ID: <7cf3ceed-056a-4be0-804f-91f946db2b33@amd.com>
Date: Tue, 5 Nov 2024 17:48:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/edid: add CTA Video Format Data Block support
To: Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Karol Herbst <kherbst@redhat.com>
References: <20240909171228.148383-1-hamza.mahfooz@amd.com>
 <87plpbk92h.fsf@intel.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <87plpbk92h.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: QB1P288CA0001.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::14) To SN7PR12MB6839.namprd12.prod.outlook.com
 (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|MN2PR12MB4079:EE_
X-MS-Office365-Filtering-Correlation-Id: 0536c799-7341-40a2-0dcd-08dcfdec0628
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHFmeVllNTF6RkRPb0l6YXlaZEFIZUZVWms4ODNrMk1TMDNxRXVQQ0NyY1JO?=
 =?utf-8?B?SWpIcHZLc1Era0VmcDdXbWFNeVJFaTFIQy9OZzdHeW1BL0JGMzZjNTExVlZt?=
 =?utf-8?B?Y1R5cXJCUS9jWkZvaHdJMkx1T2xNNGtkdkphckZuckVHb0ErVDIwckJ1YU1L?=
 =?utf-8?B?ZUl5WC8xbmtmQThBM0xoRFNDUWd5MUVJVitKUWluUnpUblRKemNPREFYNVhw?=
 =?utf-8?B?RzE4MkcvNExSRFRmTDFkMzRJeG5jUW4wdllZZHVKOEFKSG45dEprTDY2Rlh3?=
 =?utf-8?B?V2djZS92L01KNXJiRUNpQWpBZGUyb1pCZUdJV09Ianc5emN6SXhoemhjdHlO?=
 =?utf-8?B?aWFSSng2UHErZStyWkpwVlp3Z3d5SEZOckttUUhnV2xRcFBUMjZtSjlhbXJD?=
 =?utf-8?B?N3JQcTdubjBlbHpNSnNHUXdaSklXOHBNcHRaZEh2Nll4TmUyZUovcHpTa1pi?=
 =?utf-8?B?cHFUTHc3SWdjQjhJa0pycjgrZXFxYmQ0dEJ2eG9FOHBYZmVXNHlGNVYvUVc2?=
 =?utf-8?B?WEV1cFBBUGhlOHJqWkpySnBBRWJRckYvZ3FnVlNkYi9pOWQ2RytFOVR5SGlY?=
 =?utf-8?B?dS9IcWZoNXl4TnNwcXRGeVFGOFo5OWhtcDlqS3UxQ1o5M0xreklxcVQxREE3?=
 =?utf-8?B?MjFGcmtlTWR6ZFZKamM5c0FjajVHWklnRVZ3YSt6VEpjdW9Nc0l1aVNqbFFJ?=
 =?utf-8?B?TEtsTGtXcWFVN0Z5ditvditIbFZWVHUwVVVFdDY1SnNycDZOTzhaR0ZmMlQ0?=
 =?utf-8?B?NjZoZWFhTm12RnF1T3d0ek15SlA0SmtHTHhBUEFSekVsejluTFEydi82M1JQ?=
 =?utf-8?B?V3Fud0tsbzFoY0pzRSs2dEZxcVhGS3NpcnNWZGovdmF0Q3lCMnNtWk9sQS9B?=
 =?utf-8?B?YlRVUFp6WjVaU0xmWDErc0tKMzA2T2cwR1FMSnpUSlcyNHNFZGhkOU5DaTVk?=
 =?utf-8?B?QWFzZTc1WXpZd0U3MmloczR5RUZEaURscXFURkNYQ3U5ODBxSjJ5cE9wVzFv?=
 =?utf-8?B?aFlJczIvU2dhQ0hVbHpVNzBtTnhoYnQ4TmVPdUp5QTRXQWxHWXYwYnVScWdL?=
 =?utf-8?B?azViejZxeTIxRTgzaVZuR3lUa3QxMklkMFE4OFlTQkgwQy9ZNHBxd0xlR25Q?=
 =?utf-8?B?TmVFZ2svT1RkUGwzTVZ6cXBjaElkVWQvaTJKNmdNc1RGemNDQjhMWlNMWVJK?=
 =?utf-8?B?ZWdtNGw1WXpienZRZmZXSzRjLzVzYVM0TjdpcGZIMDliVUNhVnluenYveXZk?=
 =?utf-8?B?L2JCNWFTa1YzOHhEaHRyU1QyMjNmUklVTDFYNGw4MDMyR3RaeXhUNTlHa0pL?=
 =?utf-8?B?bVFEY3VOc3YzcVhzYXZ6NGpKYUhkQTFKcWxqOEUrRTBTWjlpb0NYbVZIdVE4?=
 =?utf-8?B?dmhFQm0yekxyZlh5Qm80Q01qSStCOW82QmJzbENnSjRsbGtYOTFMMGNXaWpE?=
 =?utf-8?B?Q0FzdUxWUFB5eWVkaHlFNDVpZllQalRpM29KZmVQR2p0djR6ejZhZ0hSaUNK?=
 =?utf-8?B?M2lRekZISll5WnFSSHczRXR1b1pST3ZFNEwybDM4VWZKUVUwTWh5eXcrNXFq?=
 =?utf-8?B?UW8yY2NaQ2tOOUJWRFhwRzViV0gxMnlqakhncmNuYmNqd1RLVUtxTzRKelUz?=
 =?utf-8?B?U1lqeGRCWUlSSXd1WHlSTHJWS0UrR2NDZGFtbElEc3BaNEpGeGNnOENYUDlK?=
 =?utf-8?B?UllWZTRwMzkxeVR2bWE1VVN6V0dhdm1YZElUTHlaY2RDNGJQdFlTM1cwcEZH?=
 =?utf-8?Q?Ei8xL8EBFVGMWgQcV/QCSmcFqyoQ+SWGHULzyPz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB6839.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDY1Rm1vakQ4czFWTUdwaFU4eUlXQUtaQitkZmRHTm4wTmYrTEJJMUg2NjhQ?=
 =?utf-8?B?R2Z0N3I5WWd0Qm13NVVPWlp1Wm5rVmZ1T0k5cENJSXR1TjZ2VVZMdWFPd3k5?=
 =?utf-8?B?MVJ2QkFYOFFXdDFhTVVVZHBkVE9acm4yeFRsNGc2TzZuYjhXTG5UQmFWTnFF?=
 =?utf-8?B?WUpKUlRVaWRhVXlSM1g4SkFaMC92a0cvVkNIbUkzNGsxYTE5Q215UnRadWxz?=
 =?utf-8?B?bk1wNTI0MWRkMllYN3hzVWYrQ1VWbklDalJBSWRtUEREZGdoYnI3TW9VMjNI?=
 =?utf-8?B?dklXZGxpZHRta0VaaXhCaSs4aFVSVmo0bDh3V2tLa1V5UTBPR3JTckUzU3lk?=
 =?utf-8?B?bmk0T2tUSUdNbU1QVXVrRTg2ekdvYUZZaTFhbkg3ekZrbDYwbHMvVXBiYXVq?=
 =?utf-8?B?MEdQWEJYdzVsUXZhRERtT0xVZ01SNXhVSFcxYkdIWFo3RkVsNkdiTmdsVUl5?=
 =?utf-8?B?VW1uSUdHMkdweXJkYk1SeHJYTThxelI2MDFpcmRmaDZraEJEOGxxVjg5RE01?=
 =?utf-8?B?OGdVV1MwNUROdS94bWVmWCtQKzU1Ylo2bzF0NzNzcDFYVXI1YUxGY1M5UVV2?=
 =?utf-8?B?ZmhVbFB1bDUzMW9tQSt2MFRiUkVZZFlKcEFEOXhYZHh3Z0pzQk1pM2tEd0cz?=
 =?utf-8?B?bHRBZWVsODNXSXJPY0YzVVBKQUdnTGc4OWZBeWo4MXJVWm1WVkZiSkdJeVQw?=
 =?utf-8?B?MEthVlRLd052QUtoZTV3dk1uOEZZMHhvbU9XZ3c0VWlWSnVzMngzSDBySkxq?=
 =?utf-8?B?R1IvOTRJK2trVEdaUWRsRnh3SGhUN1JqUTRob2hhWWhubEFhdkFMOEl1Rng3?=
 =?utf-8?B?Z1p2TmpQWCtyZjhPSis3eVQ0N1BwOWdVa1ovdmc3UzRIUWhjODBkUXd0dFht?=
 =?utf-8?B?UE1NZlVJTEliLzFvNk5PRkpXeDlENlBMS3JyOFdySnVVVnZ0Q2dnbzNwanFL?=
 =?utf-8?B?ZURGczY1dEd2aTRrSkdxM3RQNnhkWGxqQ3k4c2hiSk83dHJTRDJqVFErS2VB?=
 =?utf-8?B?YTVNcUsxRzBOU2hxRUFGZEZpY3VaNm5zNllHbFVkSFk4MHExSWRWNjNBN0w0?=
 =?utf-8?B?VXpXQzZLZGVKS2MrY1NDT0tZaXhkZUR0ZzQvZDUyamwwdjl5bSt0aVdFaDRl?=
 =?utf-8?B?d3RONVpJQ0UxLzhXZllBY1l2Qjk4OURVR0RjSEd2WEdpcHVibHlFZ21WNk4v?=
 =?utf-8?B?S2VCZklWa2ZaQjdKRUhoVXpvdDBwQjc1VFVzeDdBSkJ0TGRRNXBSR1M3aWhy?=
 =?utf-8?B?R3Vsd21lVkZJMVVMYWpFZ0E1RU9qZG8vQjFUN3M5TlAyOG91dk1vekVBanFW?=
 =?utf-8?B?bXZIaXVPL2Fqa2tESlgvZkk0Mml3QjNwakdPQnlmRjdRbTJqSWJHWjVEK2xB?=
 =?utf-8?B?aldOZlBzcTR0bml2eGtmUmU0Q0FHQ2gvMFRuY3NlYm1zUXBOcmpUTGlBRyt5?=
 =?utf-8?B?eGRrSVRwM2FwOUtkcmJhWHBIVml0N1EyVzNON3B3RU1GMllpQWQzam9SMk51?=
 =?utf-8?B?Y2g2aGlQeEZyT05XVE5QdEhuNkxwVW9NeWN4VXVzQ3loQ3JUZVVBOFBnNStt?=
 =?utf-8?B?TXNUdzVGbW1GR0tBcjJ2a3RLck1HUTlsNzArUWY4NUNxY0hRdVpZUk9TbS81?=
 =?utf-8?B?VmIwMTJMN3NZYWhnei9WaVpDWjY2UU0vTWJuSUJIMXZUeUNNOVdpSWcxb2pS?=
 =?utf-8?B?UWxoR09Zd2dMWXVSYnVrTzBnbTg5VTdadVNwWFJEY2hKUWRTTFdCRE1hSWkz?=
 =?utf-8?B?dUdxMW5QdmIrSFBiVzM4KzVWR3c2TzRKcVFwN0NHbGVKbHRkalorZSt2Sjg2?=
 =?utf-8?B?THFiYmJ1MlpxTG85Q2s0M0dDL2xscU92RkMyZElxV25ncE5CMlluYTk3enlX?=
 =?utf-8?B?TFRmeEZmMjh3aXVGdmhibDlzZ2VvbVdhWndUZ3F6Nm9PWlNNLzFFK0lRRm9P?=
 =?utf-8?B?NHZaRkt4N0V6SlZONjdJcjh1b3NTeFJhYjlnb25uUWVLeUQwTjlDNC93Z04y?=
 =?utf-8?B?cjJaRlEvY2ZOWTMwemhTVVI5MkxVd1gwQ29iYWhxMlRCa1U2L25SOHBtcnRS?=
 =?utf-8?B?SVVSSnZxMjI4cjVXWDFSenBCY2VoblhLbzFrd1hKSTZGU3hvRFpFSGNxc3V5?=
 =?utf-8?Q?uE3qwY/GNp4kxVuEXI5rvwCQx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0536c799-7341-40a2-0dcd-08dcfdec0628
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 22:48:53.8298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8UfdFEn06bwA702CS/HL+K4E6DNyPWwCUVnzoy6N1kcO0xZrKm1pAra2bwHSo0tIWol4ugyaEqcD+zRhUhrpwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4079
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

On 9/10/24 08:05, Jani Nikula wrote:
> On Mon, 09 Sep 2024, Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>> Video Format Data Blocks (VFDBs) contain the necessary information that
>> needs to be fed to the Optimized Video Timings (OVT) Algorithm.
>> Also, we require OVT support to cover modes that aren't supported by
>> earlier standards (e.g. CVT). So, parse all of the relevant VFDB data
>> and feed it to the OVT Algorithm, to extract all of the missing OVT
>> modes.
>>
>> Suggested-by: Karol Herbst <kherbst@redhat.com>
>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>> ---
>> v3: move ovt stuff above add_cea_modes() and break up
>>      calculate_ovt_mode() to make it easier to read.
>>
>> v4: fix 32 bit build and constify read-only vars.
> 
> Please find some review inline. I'm not finished, ran out of time/steam
> a bit, and there's something to work on.
> 
> BR,
> Jani.
> 
> 
>> ---
>>   drivers/gpu/drm/drm_edid.c | 452 +++++++++++++++++++++++++++++++++++++
>>   1 file changed, 452 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 855beafb76ff..01de2117aaf2 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -31,6 +31,7 @@
>>   #include <linux/bitfield.h>
>>   #include <linux/byteorder/generic.h>
>>   #include <linux/cec.h>
>> +#include <linux/gcd.h>
>>   #include <linux/hdmi.h>
>>   #include <linux/i2c.h>
>>   #include <linux/kernel.h>
>> @@ -741,6 +742,93 @@ static const struct minimode extra_modes[] = {
>>   	{ 2048, 1536, 60, 0 },
>>   };
>>   
>> +struct cta_rid {
>> +	u16 hactive;
>> +	u16 vactive;
>> +	u8 hratio;
>> +	u8 vratio;
>> +};
>> +
>> +/* CTA-861-I Table 11 - Resolution Identification (RID) */
>> +static const struct cta_rid rids[] = {
>> +	/* RID 0-9 */
>> +	{ 0, 0, 0, 0 },
>> +	{ 1280, 720, 16, 9 },
>> +	{ 1280, 720, 64, 27 },
>> +	{ 1680, 720, 64, 27 },
>> +	{ 1920, 1080, 16, 9 },
>> +	{ 1920, 1080, 64, 27 },
>> +	{ 2560, 1080, 64, 27 },
>> +	{ 3840, 1080, 32, 9 },
>> +	{ 2560, 1440, 16, 9 },
>> +	{ 3440, 1440, 64, 27 },
>> +	/* RID 10-19 */
>> +	{ 5120, 1440, 32, 9 },
>> +	{ 3840, 2160, 16, 9 },
>> +	{ 3840, 2160, 64, 27 },
>> +	{ 5120, 2160, 64, 27 },
>> +	{ 7680, 2160, 32, 9 },
>> +	{ 5120, 2880, 16, 9 },
>> +	{ 5120, 2880, 64, 27 },
>> +	{ 6880, 2880, 64, 27 },
>> +	{ 10240, 2880, 32, 9 },
>> +	{ 7680, 4320, 16, 9 },
>> +	/* RID 20-28 */
>> +	{ 7680, 4320, 64, 27 },
>> +	{ 10240, 4320, 64, 27 },
>> +	{ 15360, 4320, 32, 9 },
>> +	{ 11520, 6480, 16, 9 },
>> +	{ 11520, 6480, 64, 27 },
>> +	{ 15360, 6480, 64, 27 },
>> +	{ 15360, 8640, 16, 9 },
>> +	{ 15360, 8640, 64, 27 },
>> +	{ 20480, 8640, 64, 27 },
> 
> Designated initializers would remove the need for the /* RID 0-9 */
> comments:
> 
> 	[1] = { ... },
> 
>> +};
>> +
>> +/* CTA-861-I Table 12 - AVI InfoFrame Video Format Frame Rate */
>> +static const u16 cta_vf_fr[] = {
> 
> We don't have to make the names as cryptic as possible. This is only
> needed in a few places, so could be video_format_frame_rates or
> something. With a comment that it's indexed with rate index.
> 
>> +	/* Frame Rate 0-7 */
>> +	0, 24, 25, 30, 48, 50, 60, 100,
>> +	/* Frame Rate 8-15 */
>> +	120, 144, 200, 240, 300, 360, 400, 480,
> 
> What if the preference is for 24/1.001 instead of 24?

According to section 4 the spec:

"""
A Video Timing with a vertical frequency that is an integer multiple of
6.00 Hz (e.g., 24.00 or 120.00 Hz) is considered to be the same as a
Video Timing with the equivalent detailed timing information but where
the vertical frequency is adjusted by a factor of 1000/1001 (e.g.,
24/1.001 or 120/1.001). That is, they are considered two versions of
the same Video Timing but with slightly different pixel clock
frequencies.
"""

The different pixel is calculated as part of step 9 of the OVT
algorthim, though I'm not sure it makes sense to include it here since
it would require an FPU.

> 
>> +};
>> +
>> +/* CTA-861-I Table 13 - RID To VIC Mapping */
>> +static const u8 rid_to_vic[][8] = {
>> +	/* RID 0-9 */
>> +	{},
>> +	{ 60, 61, 62, 108, 19, 4, 41, 47 },
>> +	{ 65, 66, 67, 109, 68, 69, 70, 71 },
>> +	{ 79, 80, 81, 110, 82, 83, 84, 85 },
>> +	{ 32, 33, 34, 111, 31, 16, 64, 63 },
>> +	{ 72, 73, 74, 112, 75, 76, 77, 78 },
>> +	{ 86, 87, 88, 113, 89, 90, 91, 92 },
>> +	{},
>> +	{},
>> +	{},
>> +	/* RID 10-19 */
>> +	{},
>> +	{ 93, 94, 95, 114, 96, 97, 117, 118 },
>> +	{ 103, 104, 105, 116, 106, 107, 119, 120 },
>> +	{ 121, 122, 123, 124, 125, 126, 127, 193 },
>> +	{},
>> +	{},
>> +	{},
>> +	{},
>> +	{},
>> +	{ 194, 195, 196, 197, 198, 199, 200, 201 },
>> +	/* RID 20-28 */
>> +	{ 202, 203, 204, 205, 206, 207, 208, 209 },
>> +	{ 210, 211, 212, 213, 214, 215, 216, 217 },
>> +	{},
>> +	{},
>> +	{},
>> +	{},
>> +	{},
>> +	{},
>> +	{},
> 
> Sparse stuff like this would work better with designated initializers?
> 
> 	[1] = { ... },
> 
> Also removes the need for the /* RID 0-9 */ comments.
> 
>> +};
>> +
>>   /*
>>    * From CEA/CTA-861 spec.
>>    *
>> @@ -4131,6 +4219,7 @@ static int add_detailed_modes(struct drm_connector *connector,
>>   #define CTA_DB_VIDEO			2
>>   #define CTA_DB_VENDOR			3
>>   #define CTA_DB_SPEAKER			4
>> +#define CTA_DB_VIDEO_FORMAT		6
>>   #define CTA_DB_EXTENDED_TAG		7
>>   
>>   /* CTA-861-H Table 62 - CTA Extended Tag Codes */
>> @@ -4972,6 +5061,16 @@ struct cea_db {
>>   	u8 data[];
>>   } __packed;
>>   
>> +struct cta_vfd {
>> +	u8 rid;
>> +	u8 fr_fact;
>> +	bool bfr50;
>> +	bool fr24;
>> +	bool bfr60;
>> +	bool fr144;
>> +	bool fr48;
>> +};
>> +
>>   static int cea_db_tag(const struct cea_db *db)
>>   {
>>   	return db->tag_length >> 5;
>> @@ -5250,6 +5349,357 @@ static int edid_hfeeodb_extension_block_count(const struct edid *edid)
>>   	return cta[4 + 2];
>>   }
>>   
>> +/* CTA-861 Video Format Descriptor (CTA VFD) */
>> +static void parse_cta_vfd(struct cta_vfd *vfd, const u8 *data, int vfd_len)
>> +{
>> +	vfd->rid = data[0] & 0x3f;
>> +	vfd->bfr50 = data[0] & 0x80;
>> +	vfd->fr24 = data[0] & 0x40;
>> +	vfd->bfr60 = vfd_len > 1 ? (data[1] & 0x80) : 0x1;
> 
> It's a bool member, so true instead of 0x1.
> 
>> +	vfd->fr144 = vfd_len > 1 ? (data[1] & 0x40) : 0x0;
> 
> false instead of 0x0
> 
>> +	vfd->fr_fact = vfd_len > 1 ? (data[1] & 0x3f) : 0x3;
>> +	vfd->fr48 = vfd_len > 2 ? (data[2] & 0x1) : 0x0;
> 
> false instead of 0x0
> 
>> +}
>> +
>> +static bool vfd_has_fr(const struct cta_vfd *vfd, int rate_idx)
>> +{
>> +	static const u8 factors[] = {
>> +		1, 2, 4, 8, 12, 16
>> +	};
>> +	u16 rate = cta_vf_fr[rate_idx];
> 
> Would make more sense to have int rate parameter instead of rate_idx, so
> you don't have to access cta_vf_fr here.
> 
> Having it int makes sense because it's used in calculation.
> 
>> +	u16 factor = 0;
>> +	unsigned int i;
> 
> Just use int, for both.
> 
>> +
>> +	switch (rate) {
>> +	case 24:
>> +		return vfd->fr24;
>> +	case 48:
>> +		return vfd->fr48;
>> +	case 144:
>> +		return vfd->fr144;
>> +	}
>> +
>> +	if (!(rate % 25)) {
>> +		if (!vfd->bfr50)
>> +			return false;
>> +
>> +		factor = rate / 25;
>> +	} else if (!(rate % 30)) {
>> +		if (!vfd->bfr60)
>> +			return false;
>> +
>> +		factor = rate / 30;
>> +	}
>> +
>> +	for (i = 0; i < ARRAY_SIZE(factors); i++)
>> +		if (factor == factors[i] && (vfd->fr_fact & (1 << i)))
>> +			return true;
>> +
>> +	return false;
>> +}
>> +
>> +#define OVT_PIXEL_CLOCK_GRANULARITY	1000		/* Hz */
>> +#define OVT_MIN_HTOTAL_GRANULARITY	8		/* pixels */
>> +#define OVT_MIN_VBLANK_DURATION	460000000	/* ps */
>> +#define OVT_MIN_VBLANK_LINES		20
>> +#define OVT_MIN_VSYNC_LEADING_EDGE	400		/* us */
>> +#define OVT_MIN_VSYNC_LE_LINES		14
>> +#define OVT_MIN_CLOCK_RATE_420		590000000	/* Hz */
>> +#define OVT_PIXEL_FACTOR_420		2
>> +#define OVT_MIN_HBLANK_444		80		/* pixels */
>> +#define OVT_MIN_HBLANK_420		128		/* pixels */
>> +#define OVT_MAX_CHUNK_RATE		650000000	/* Hz */
>> +#define OVT_AUDIO_PACKET_RATE		195000		/* Hz */
>> +#define OVT_AUDIO_PACKET_SIZE		32
>> +#define OVT_LINE_OVERHEAD		32
>> +#define OVT_HSYNC_WIDTH		32
>> +#define OVT_VSYNC_WIDTH		8
>> +
>> +static u32 calculate_ovt_min_vtotal(const struct cta_rid *rid, u64 max_vrate,
>> +				    u32 vtotal_granularity)
>> +{
>> +	u64 max_active_time;
>> +	u32 min_line_time;
>> +	u32 min_vblank;
>> +	u32 min_vtotal;
>> +
>> +	/* step 2 */
>> +	max_active_time = div64_u64(1000000000000, max_vrate) -
>> +		(u64)OVT_MIN_VBLANK_DURATION;
>> +
>> +	min_line_time = div_u64(max_active_time, rid->vactive);
>> +
>> +	min_vblank = max_t(u64, (u64)OVT_MIN_VBLANK_LINES,
>> +			   DIV64_U64_ROUND_UP(OVT_MIN_VBLANK_DURATION,
>> +					      min_line_time));
>> +
>> +	min_vtotal = rid->vactive + min_vblank;
>> +
>> +	if (min_vtotal % vtotal_granularity)
>> +		min_vtotal += vtotal_granularity - (min_vtotal %
>> +						    vtotal_granularity);
>> +
>> +	return min_vtotal;
>> +}
>> +
>> +static u32 calculate_ovt_min_htotal(const struct cta_rid *rid,
>> +				    const u32 max_vrate,
>> +				    const u32 min_vtotal,
>> +				    u32 *min_hblank,
>> +				    u32 *htotal_granularity)
>> +{
>> +	u32 max_audio_packets_per_line;
>> +	u32 htotal_granularity_chunk;
>> +	u64 min_pixel_clock_rate;
>> +	u32 min_line_rate;
>> +	u32 min_htotal;
>> +
>> +	/* step 3 */
>> +	min_line_rate = max_vrate * min_vtotal;
>> +
>> +	max_audio_packets_per_line = DIV_ROUND_UP(OVT_AUDIO_PACKET_RATE,
>> +						  min_line_rate);
>> +
>> +	/* step 4 */
>> +	*min_hblank = OVT_LINE_OVERHEAD + OVT_AUDIO_PACKET_SIZE *
>> +		max_audio_packets_per_line;
>> +
>> +	min_htotal = rid->hactive + max(OVT_MIN_HBLANK_444, *min_hblank);
>> +
>> +	min_pixel_clock_rate = max_vrate * min_htotal * min_vtotal;
>> +
>> +	htotal_granularity_chunk =
>> +		roundup_pow_of_two(DIV64_U64_ROUND_UP(min_pixel_clock_rate,
>> +						      OVT_MAX_CHUNK_RATE));
>> +
>> +	*htotal_granularity = max(OVT_MIN_HTOTAL_GRANULARITY,
>> +				  htotal_granularity_chunk);
>> +
>> +	if (min_htotal % *htotal_granularity)
>> +		min_htotal += *htotal_granularity - (min_htotal %
>> +						     *htotal_granularity);
>> +
>> +	return min_htotal;
>> +}
>> +
>> +static u64 calculate_ovt_pixel_clock_rate(const struct cta_rid *rid,
>> +					  const u32 max_vrate,
>> +					  const u32 min_hblank,
>> +					  u32 min_htotal,
>> +					  u32 min_vtotal,
>> +					  const u32 htotal_granularity,
>> +					  const u32 vtotal_granularity,
>> +					  u32 *htotal, u32 *vtotal)
>> +{
>> +	u32 resolution_granularity;
>> +	u64 pixel_clock_rate;
>> +	u64 min_resolution;
>> +	u64 rem;
>> +	u32 h;
>> +	u64 r;
>> +	u32 v;
>> +
>> +	resolution_granularity = OVT_PIXEL_CLOCK_GRANULARITY /
>> +		gcd(OVT_PIXEL_CLOCK_GRANULARITY, max_vrate);
>> +
>> +	do {
>> +		/* step 5 */
>> +		min_resolution = 0;
>> +		v = min_vtotal;
>> +
>> +		goto loop_end;
>> +
>> +		while (!min_resolution || r <= min_resolution) {
>> +			goto inner_loop_end;
>> +
>> +			while (rem || div64_u64(max_vrate * r, (h & ~(h - 1))) >
>> +			       OVT_MAX_CHUNK_RATE) {
>> +				h += htotal_granularity;
>> +				r = (u64)h * (u64)v;
>> +inner_loop_end:
>> +				div64_u64_rem(r, resolution_granularity, &rem);
>> +			}
>> +
>> +			if (!min_resolution || r < min_resolution) {
>> +				*htotal = h;
>> +				*vtotal = v;
>> +				min_resolution = r;
>> +			}
>> +
>> +			v += vtotal_granularity;
>> +
>> +loop_end:
>> +			h = min_htotal;
>> +			r = (u64)h * (u64)v;
>> +		}
>> +
>> +		pixel_clock_rate = max_vrate * min_resolution;
>> +
>> +		/* step 6 */
>> +		min_htotal = rid->hactive + max(OVT_MIN_HBLANK_420,
>> +						OVT_PIXEL_FACTOR_420 *
>> +						min_hblank);
>> +
>> +	} while (pixel_clock_rate >= OVT_MIN_CLOCK_RATE_420 &&
>> +		 *htotal < min_htotal);
>> +
>> +	return pixel_clock_rate;
>> +}
>> +
>> +/* OVT Algorthim as specified in CTA-861-I */
>> +static struct drm_display_mode *
>> +calculate_ovt_mode(struct drm_connector *connector, const struct cta_rid *rid,
>> +		   u16 vrate)
>> +{
>> +	struct drm_display_mode *mode;
>> +	u32 vtotal_granularity = 1;
>> +	u32 htotal_granularity;
>> +	u32 max_vrate = vrate;
>> +	u64 pixel_clock_rate;
>> +	u32 vsync_position;
>> +	u32 min_hblank;
>> +	u32 min_htotal;
>> +	u32 min_vtotal;
>> +	u32 htotal;
>> +	u32 vtotal;
>> +
>> +	/* step 1 */
>> +	switch (vrate) {
>> +	case 24:
>> +	case 25:
>> +		max_vrate = 30;
>> +		fallthrough;
>> +	case 30:
>> +		vtotal_granularity = 20;
>> +		break;
>> +	case 48:
>> +	case 50:
>> +		max_vrate = 60;
>> +		fallthrough;
>> +	case 60:
>> +		vtotal_granularity = 20;
>> +		break;
>> +	case 100:
>> +		max_vrate = 120;
>> +		fallthrough;
>> +	case 120:
>> +		vtotal_granularity = 5;
>> +		break;
>> +	case 200:
>> +		max_vrate = 240;
>> +		fallthrough;
>> +	case 240:
>> +		vtotal_granularity = 5;
>> +		break;
>> +	case 300:
>> +		max_vrate = 360;
>> +		fallthrough;
>> +	case 360:
>> +		vtotal_granularity = 5;
>> +		break;
>> +	case 400:
>> +		max_vrate = 480;
>> +		fallthrough;
>> +	case 480:
>> +		vtotal_granularity = 5;
>> +		break;
>> +	}
>> +
>> +	min_vtotal = calculate_ovt_min_vtotal(rid, max_vrate,
>> +					      vtotal_granularity);
>> +
>> +	min_htotal = calculate_ovt_min_htotal(rid, max_vrate, min_vtotal,
>> +					      &min_hblank, &htotal_granularity);
>> +
>> +	pixel_clock_rate = calculate_ovt_pixel_clock_rate(rid, max_vrate,
>> +							  min_hblank,
>> +							  min_htotal,
>> +							  min_vtotal,
>> +							  htotal_granularity,
>> +							  vtotal_granularity,
>> +							  &htotal, &vtotal);
>> +
>> +	/* step 7 */
>> +	vtotal = vtotal * max_vrate / (u32)vrate;
>> +
>> +	/* step 8 */
>> +	vsync_position = max(OVT_MIN_VSYNC_LE_LINES,
>> +			     DIV64_U64_ROUND_UP((u64)OVT_MIN_VSYNC_LE_LINES *
>> +						pixel_clock_rate,
>> +						(u64)htotal * (u64)1000000));
>> +
>> +	mode = drm_mode_create(connector->dev);
>> +
>> +	if (!mode)
>> +		return NULL;
>> +
>> +	mode->clock = div_u64(pixel_clock_rate, 1000);
>> +	mode->hdisplay = rid->hactive;
>> +	mode->hsync_start = htotal - OVT_HSYNC_WIDTH * 2;
>> +	mode->hsync_end = mode->hsync_start + OVT_HSYNC_WIDTH;
>> +	mode->htotal = htotal;
>> +
>> +	mode->vdisplay = rid->vactive;
>> +	mode->vsync_start = vtotal - vsync_position;
>> +	mode->vsync_end = mode->vsync_start + OVT_VSYNC_WIDTH;
>> +	mode->vtotal = vtotal;
>> +
>> +	return mode;
>> +}
>> +
>> +/* CTA-861 Video Format Data Block (CTA VFDB) */
>> +static int add_modes_from_vfdb(struct drm_connector *connector,
>> +			       const struct cea_db *db)
>> +{
>> +	struct drm_display_info *info = &connector->display_info;
> 
> const
> 
>> +	int vfdb_len = cea_db_payload_len(db);
>> +	struct drm_display_mode *mode;
>> +	struct cta_vfd vfd;
>> +	int num_modes = 0;
>> +	int vfd_len;
>> +	int i;
>> +	int j;
>> +
>> +	if (!vfdb_len)
>> +		return 0;
>> +
>> +	vfd_len = (db->data[0] & 0x3) + 1;
>> +
>> +	if (!vfd_len)
>> +		return 0;
> 
> This can never happen on the account of + 1.
> 
>> +
>> +	vfdb_len--;
>> +
>> +	vfdb_len -= (vfdb_len % vfd_len);
> 
> Matter of taste, I'd probably write the above lines as:
> 
> 	num_vfd = (vfdb_len - 1) / vfd_len
> 
>> +
>> +	for (i = 0; i < vfdb_len; i += vfd_len) {
> 
> And iterate like this:
> 
> 	for (i = 0; i < num_vfd; i++) {
> 		const u8 *vfd = &db->data[1 + i * vfd_len];
> 
> Up to you.
> 
>> +		parse_cta_vfd(&vfd, &db->data[i + 1], vfd_len);
>> +
>> +		if (!vfd.rid || vfd.rid >= ARRAY_SIZE(rids))
>> +			continue;
>> +
>> +		for (j = 1; j < ARRAY_SIZE(cta_vf_fr); j++) {
> 
> Maybe this should be int rate_index instead of j, because it does have a
> name in the spec instead of just random iteration?
> 
> Probably helps to have
> 
> 			int rate = video_format_frame_rate[rate_index];
> 
> 
>> +			if (!vfd_has_fr(&vfd, j) ||
> 
> Pass in rate there.
> 
>> +			    (cta_vf_fr[j] < 144 && rid_to_vic[vfd.rid][j - 1]))
> 
> This makes my head spin. Probably want a function that says what it
> does, and can explain in comments inside. Also useful because you'll
> need to bounds check rid_to_vic access.
> 
>> +				continue;
>> +
>> +			mode = calculate_ovt_mode(connector, &rids[vfd.rid],
>> +						  cta_vf_fr[j]);
>> +
>> +			if (!mode)
>> +				continue;
>> +
>> +			mode->height_mm = info->height_mm;
>> +			mode->width_mm = info->width_mm;
>> +
>> +			drm_mode_probed_add(connector, mode);
>> +			num_modes++;
>> +		}
>> +	}
>> +
>> +	return num_modes;
>> +}
>> +
>>   /*
>>    * CTA-861 YCbCr 4:2:0 Capability Map Data Block (CTA Y420CMDB)
>>    *
>> @@ -5318,6 +5768,8 @@ static int add_cea_modes(struct drm_connector *connector,
>>   			/* Add 4:2:0(only) modes present in EDID */
>>   			modes += do_y420vdb_modes(connector, vdb420,
>>   						  cea_db_payload_len(db) - 1);
>> +		} else if (cea_db_tag(db) == CTA_DB_VIDEO_FORMAT) {
>> +			modes += add_modes_from_vfdb(connector, db);
>>   		}
>>   	}
>>   	cea_db_iter_end(&iter);
> 

-- 
Hamza
