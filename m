Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D37B1FFAD
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 08:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B783410E2F5;
	Mon, 11 Aug 2025 06:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g51FBW9z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F417F10E2EC;
 Mon, 11 Aug 2025 06:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754895305; x=1786431305;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A1K6TovKxmV1CicWm8DY1mNXsphnGLzFF3RN3b2oDpY=;
 b=g51FBW9zw/RT6SXQFBD3Qs5oD4YVEROjiVrz4m4+vVgSns2LwLCQhALS
 2OUAuwv4P2uK0vHiYL0QxblWec7RHJwbQPPC0XVhDNp2GQC9fpY9YYaid
 G1LlWW0S5yxVPN0lZ0+VWPNexrhHb3o6PyfRZBmMJ0V+NYhxaGY0e4jtO
 BZzstIuYDRpYsGeYc8O/IrV4uYydCzjLUP2THh0FwlqxAiKevbNyuJU5y
 ebdMTVTfriCOz7eVfQ1LUoV2iIWzTsgbwKqutlXxbDdrZSe8Q1zF+2Pq0
 IwhLtY/zqSd45dngcjDEdKcGl+MtJr7iLygsoHd5A9Nj26NuYGDU/JFCi A==;
X-CSE-ConnectionGUID: Qa61qWrJQ++sHNBReHwDqg==
X-CSE-MsgGUID: 3l1yvmHESDihInhNFSkHiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57219923"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="57219923"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2025 23:55:04 -0700
X-CSE-ConnectionGUID: X23UMfO6QJWjK8x0SBBXrg==
X-CSE-MsgGUID: xkkxaDGRRw+5bKWnveah5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="169950295"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2025 23:55:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 10 Aug 2025 23:55:03 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sun, 10 Aug 2025 23:55:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.80) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 10 Aug 2025 23:55:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCpd31wiHFVFo4tk/RIIZl3shQdgQdzVgfk56uQi3FoQjaxNh4HixH7bBPelOcF+a70iRxGzj3vxgA6ucOIQ0xulERsm7rZjyBiWojjGwY80pzqrsyH0XyESxJ2uL7JuAfup0pw+SAmz4a3EbRElp6RyjntBI6bJRuyAcBa/gpwV5PxkMTaUgbdyyZkb0yoU/Qbzm1uh9lTRPS8LY3mZhbUn77DlPs8YA7+r69MC1FRgfsoe/DD2/7IwvStdClTz5I8panMd9bSSZ9rUUd/EnWPFsVwxFgaOUzihgircuwRnHgSdQBAHWGoG1i3jrBzdEzg4yF+PdfkPNqg4Y1CmzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDFswQMltTQpO6/XpVr1ToFQm212t8N5JMqwYOz/Ww4=;
 b=RWMSK/X9/454nKmGbJDeWoAG2sFqPK8BTfgsqiXYRtLri6HznnAuyleZXRxjYRDHeVDXgFfLTrvbyq/tzCnBF5YeVohCJQ4EoFVWvLGbc0D82Xn8lxvlDL0mAzsk7y/f1zzcdzY9Z1NObO4xBnO0fKIgKDB3Ww3cHD35AQJz8UUt3+cnBVlfktw98KRcM/OqG6Rh+vGN82h5SZwb9qaLr45cEzkjluDjgrbr11hHhnK4qVjxGYoo9/sSqBuihwtBcTls87HrsGKckIxe4EQl8R+aly9c388tq+G3ejk3vrmFP6VCNaiTq+23eGzQFJJ8tLRRndp0uV61nryKL9lxxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DS0PR11MB6472.namprd11.prod.outlook.com
 (2603:10b6:8:c0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 06:55:01 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e%7]) with mapi id 15.20.9009.013; Mon, 11 Aug 2025
 06:55:01 +0000
Message-ID: <ecd1e145-61f5-46c3-95f3-0769f8e9209a@intel.com>
Date: Mon, 11 Aug 2025 12:24:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/26] drm/gpuvm: Pass map arguments through a struct
To: Danilo Krummrich <dakr@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Boris Brezillon" <boris.brezillon@collabora.com>, Brendan King
 <Brendan.King@imgtec.com>, Boris Brezillon <bbrezillon@kernel.org>, "Caterina
 Shablia" <caterina.shablia@collabora.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, <dri-devel@lists.freedesktop.org>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
 <20250807164338.1832254-2-himal.prasad.ghimiray@intel.com>
 <DBXWMIF2E8KO.3COG8ZYK5XE2N@kernel.org>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <DBXWMIF2E8KO.3COG8ZYK5XE2N@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::16) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DS0PR11MB6472:EE_
X-MS-Office365-Filtering-Correlation-Id: 4838213e-f834-4223-e36e-08ddd8a3fe29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cE9ZUUxzalUyL2lEY2RFOE85RytDNGxtVDVMWmd6QnNMb043cVo4SWR6VTR4?=
 =?utf-8?B?ejhTeC9DNnhSZDhEMWxWNXc2cEU2WXdadG5yWUk3VkZFc2lhQVVXVmdqWEN1?=
 =?utf-8?B?RUN5TmNjRS9vdFFTT3oybzIxejVTOG1QWVhCUnNUUVFTKzdFR2d4RE90OHBT?=
 =?utf-8?B?aThtVDBaZ3lxMHpYWmtZOVFQWXpFRVRYV0laZ3hnSEpzSVF2WStKMGVJY29r?=
 =?utf-8?B?ajlkenRFM2FVU1VjUWRhaE9qdCsxeW5pMTJqUEQ2Y2ZxZWtKcS93QXg0UXFG?=
 =?utf-8?B?Ry9ydXJMTGExVTdBNG9aRGdRb25aeVBwTThmZ1RWemNUbHRIc3F5UU5IdU9q?=
 =?utf-8?B?NlBKUWdjQWx6S2VZSW1NVkJ2SG9abElkVGo5SkEwYnQ2SjlaUVlqWDRPRklt?=
 =?utf-8?B?V1dEaDRHcHk4dGFQZkJ5WHlVZ1RUZ01udng0cmlDRlozZEhvY1E2TUFIUDEy?=
 =?utf-8?B?d1djWFJtRW1CbVZpbWRWcHgyYU9iSVJINWt1RmdTenBPMUhVVk1MNnR1eGhX?=
 =?utf-8?B?TllkRU1mN1VObjRFRi9YMUpkaEhoS1A0ZnhBY1VRSytybWpoUllDZ3BFM3Vj?=
 =?utf-8?B?ZVVKc2Nod3pFN0FjNEtESWRxbHB2a0l4STRPajFrd2lIb1NaMkRvRTRjSnJF?=
 =?utf-8?B?RjJKSlhlLy8weld0cXRyVGYreTZTMmNZOVRXY3l2SGtnZnJGWnJYNXNCWlY5?=
 =?utf-8?B?SmxBRGMyWE1pNmgrbG1neGQzNjBxdlNXWFRtWEREZzlSTUJFTkdKeXVHRkhx?=
 =?utf-8?B?d1BiWUtQMXMrbXB0MFNyUnBEbEtHYW5tV0ZUczVFTVJGd1dML09yM2dXTHNk?=
 =?utf-8?B?TmgrcmZkZHBQMlF6NExpNkwzZXhwVi9Qby80UDlBVW1yK1ZvaXlMUGVzQ09p?=
 =?utf-8?B?eEVyTHVqTnVCZmx1VDhKOEgxM1JQd1JkV0xRbmVqOE9Dd1hoT1VYQkJZNnIx?=
 =?utf-8?B?anBYdjdnLzh1RXd1MTFnai9iTXNEVC95dVc3VE1FQWQyeGlPY2xtLzJpbUty?=
 =?utf-8?B?OVJzOTR1OFNuTGJvM05hVFM0NlNteEpybHhzb091dlFmeXlPSVFVNlRtQjRU?=
 =?utf-8?B?QjVWRDVZc1lxaU4vVFNqNjhhM01YeUtCNEI0RHI4cVg0WlFqbUdHYXovMWpq?=
 =?utf-8?B?cFNsYVhrQXdPQWk4djlSa0d2WWR4VmdaR25VNWNsSEEvZndyb2VYTmRyU1dV?=
 =?utf-8?B?UjlpSXBzQzJRazBTSTl1T0lQMnU1dE1IU3gwQWRncWkrNnlQaGtzbXdmalNF?=
 =?utf-8?B?cStOdDV5REEwZndyaVhtRm5QQUUrVmpScTJWMHJYUkNWQjhnUDVQVHhLaFU3?=
 =?utf-8?B?a0RER1FPTlZ0QUhrRFdEOGtZL3F3OHIwd2tnTUFGbGtqMG90aUlUTjkyaXQr?=
 =?utf-8?B?YnhSR2d5QmFYczhuUk5IckRrNEF4RHA3SjZ2NXVGWkxPNktlQlpPT0I4K0dk?=
 =?utf-8?B?b3U5VHJVSFlVbjNtZDZOMDN2WG9lQk9JRXZETU9Zdm54OE55d1pCVWtJZGsz?=
 =?utf-8?B?RjFUNTQwcDZBeWp0QjJLei9URFJHMmdaMlJaM2h4bnVVcDFVR3BiMTlJUThM?=
 =?utf-8?B?Um9IaVNiNkxSME9FZTBUc3NxMzRKL0lFOEYvbFcyN3hKR3lYeHRvTm1OZlZ0?=
 =?utf-8?B?blpvZTVuQlVRWjdnMkcwckJYMUw5OE5WeVR0Z3IxOWVZK2NKdVJvckdjZ0cy?=
 =?utf-8?B?c2xhbVRzQnd0NUxXSGdXQ3JWbHM5akdVNXJjTzVOeWU1Um0vZURyTnRDcHdn?=
 =?utf-8?B?ZUVraWZFbUN3bDg0RThxSkxLODVybWpXSXFUZDE3U0lSTDViZlNJbVRxWmxE?=
 =?utf-8?B?MzI5MVhVLzJGOUR2TUl0bkF5WHZIR3JlL1B5SDdSbXlVMU5kRmkraW0yMU81?=
 =?utf-8?B?citpWUp0QzgycmE3SzJBYUZob05RQkZFRms4QXNnN1lQSXlOYysrSmhUSW43?=
 =?utf-8?Q?gqMe+xrIhbI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3dpaHg5eXNDL2Rtb2twb2g4TWJldk9zcFNsWDMxVUFCc3dYdjlUK21Ldk1q?=
 =?utf-8?B?d0NUQjFrOTRMVTE1QkxROVNmWFR3cXNOY2w3b1B1TEthbGtBWDVjT3h0bFpr?=
 =?utf-8?B?cWFBSVhHdGs3S1RmR2cyMGJqTDN2c1NkYVlKaHdwSjFvbmJMM3RlWXF1WUVz?=
 =?utf-8?B?NjdqT2o4TmZETEhUQ1lXR3pXSDdhcnMrcWpBcDh2WkM4ZWg5MWo1SG1xVkFO?=
 =?utf-8?B?K3RSd0RqMDY2bW5nck5iN2xHSTNZYm1jZXh2THI5T2YyVHdZSTdoOWh5QnMy?=
 =?utf-8?B?U1lPZkp4UlI4ZG1XYzZ5R2RpejJzclplUmJEYUthT3FLRFE5QzlBZXBYcmVW?=
 =?utf-8?B?WlA0TWlaN0pQQjFjOVI3dEJuclFJZThTbG40dkVVdk84Nm9waFdjbFl5VHFo?=
 =?utf-8?B?Qmg5UTNqb1d2SnVoU0diNllwT1FyNml1ZU1xOWZ6NXdHaEdMSmJ6V0NxWW5F?=
 =?utf-8?B?WUdCZVo3Q2VxUFZRc20xdlQzZmR0dU5VcVJlT1Nsa2FtUGxxK2N0YXNSYnJv?=
 =?utf-8?B?TjJOZWFtbjRsZk10a3pUTUZjZld0aXZad2lVOHNwTHBXemdxemdmUWpDeFl3?=
 =?utf-8?B?bm83MFBNWHlvT0NQbzBVVk9ZYWNaMFUvUXFmdXBoTkRsYnpBQ1htSDZOQW5H?=
 =?utf-8?B?azUyVWVpcXJMOFR2dGExd2tvU01RSWZTdlJNdzduZkNjVjcxSXEzZ1pwTTNt?=
 =?utf-8?B?NW9SK2t5TklyZVJ5Q2tkWGFhKzJ4VEtxTmJzNUFGdWdjZkNmNWJ2Uys4NitZ?=
 =?utf-8?B?TTBRMXR3LytXNXpHcUxlb1BTZXlVTUlVcXFOTmZ4THB2T29ZS3N1SWFlL0ZX?=
 =?utf-8?B?NzZ1ckRmdHpnbGtoUFZrUEVQUURleSt0ODFEQ0VFKzd4dlZQdHJhMlNJbENw?=
 =?utf-8?B?cVdUNjlUQ0N3RmZ6di9RV1paSGw3N3plV1QwZytGTGlhQm84WHJwajE5QkE3?=
 =?utf-8?B?MlpGbWlpQ2hmZUJYc0MzZHpyeC9Bbmc4MHZHVC82UUh4MDFuM1IzV2k3dWox?=
 =?utf-8?B?ZkJNRFRVQlJ2YnRtSkFtUUlKUG9hL2lhOTZqZUp1TmpwUFpqRHduZHk4WVFE?=
 =?utf-8?B?cGwyQXlqNjNzTUhtdzloZHdXNWl0aVBEZVBnZjZ1Vm9ZMjhRY0Iwc3h1M1hm?=
 =?utf-8?B?WWZ5SFNPZWY4Z010TXV2aEEyeTJrVlJTamM3d3ZZME1EUXc0U29wWUFkQnRK?=
 =?utf-8?B?SkFMclRVWEpjSktTajI2NEMvMUVQdVF2R3NPMDUwejUrWGRyeEVoOVdSYkNo?=
 =?utf-8?B?cmVnU2VnMVFubWJXNUtsUXI3YjZrd3R1YVU0UXpMa0ZtMDYvUFFhTFNQajFn?=
 =?utf-8?B?SG84aWtsNW4yNExWbm5vN2p3b251RVlMeXdGOGMvczZtZEhReGRuSWZwcDlp?=
 =?utf-8?B?cVYxaDByOEtiMzVXRGRmdFo0TFF5TXhWOGN6a0x2VnFpNFJxeWFYZVJHYnl2?=
 =?utf-8?B?dGdDbFpaK3F4Q0ZLZXZTbml3eXJFQ2NMcnRzcHhwYURMT21HcHdqWllBenpU?=
 =?utf-8?B?bXd6cFhCK21HN3RObmVKV2p6dkRzdmxoS1k5RVhGVHQvZ1ROc1NMQVVqcXZ3?=
 =?utf-8?B?UjhvZGIxVU1GeElhTjZPdTFGVjdiWWdIU0tTS3BSOWM1aUhROVQ2TmJzU2VR?=
 =?utf-8?B?N3l5d2JKUkJ1cE1TMXF2MzZtZWJ1VGFxMGZmVVVNQ01yNnN5NTdSNWRDTHhL?=
 =?utf-8?B?cElrQlRlM3JUWHYzMjBscUVSRHBITVdFeXRqWTBHd0FsMGhJTWJLWXBOWmZr?=
 =?utf-8?B?K1F3SnAwbjJLRFZ5ZlpvN3hRcVZzOFBOeG40VWx3VlM5QlR6aWZSUlhWRlgx?=
 =?utf-8?B?ZCtwcGFTT0dEcy91eW42bUh2KzYyQ3NSY1UxQkMyQUdWWW5UWk11bWxScnZ3?=
 =?utf-8?B?QkJodjFBWkxpME1PUEJMQnR0TVptZUdhOExsMlZybUZ1Nkc1TnlkQU1ObW5r?=
 =?utf-8?B?KzZETWxPZzJKeG9lN29OZHVyUi9UcDdjM3VoTUVpdTlialovZWRSYlRWS3Zv?=
 =?utf-8?B?bFNEUG1kLzRnaUdIVkcxYi9jcHRsekxPdlA0bCswOGlpS3VWdzdTY3dQQzdp?=
 =?utf-8?B?aXpTNzJibVZiUXk4cks2b1RtbXpzbVJwREZuWmhudUhrK252RFFBaHFpcEg1?=
 =?utf-8?B?NjgxUVhxN2sydWpWMnlLdGJ3SmtYYmxxSUJlU1FFN1d2aDBQVWd6OHFtMWNR?=
 =?utf-8?Q?QrPlvQeZrAgV40DmUrZ1Jpc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4838213e-f834-4223-e36e-08ddd8a3fe29
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 06:55:01.5189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XNYgHrJfjxY+Os90Cg1cDq5Tq0qC/8kRCyyn7cbATnErUKu2saeo8wj8ntfZQ5mwhi899ouJJOoy+KYKPnVMN9qP4d8kFuY4MRj32fWOuu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6472
X-OriginatorOrg: intel.com
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



On 09-08-2025 18:13, Danilo Krummrich wrote:
> On Thu Aug 7, 2025 at 6:43 PM CEST, Himal Prasad Ghimiray wrote:
>> From: Boris Brezillon <boris.brezillon@collabora.com>
>>
>> We are about to pass more arguments to drm_gpuvm_sm_map[_ops_create](),
>> so, before we do that, let's pass arguments through a struct instead
>> of changing each call site every time a new optional argument is added.
>>
>> v5
>>   - Use drm_gpuva_op_map—same as drm_gpuvm_map_req
>>   - Rebase changes for drm_gpuvm_sm_map_exec_lock()
>>   - Fix kernel-docs
>>
>> v6
>>   - Use drm_gpuvm_map_req (Danilo/Matt)
>>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Brendan King <Brendan.King@imgtec.com>
>> Cc: Boris Brezillon <bbrezillon@kernel.org>
>> Cc: Caterina Shablia <caterina.shablia@collabora.com>
>> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: <dri-devel@lists.freedesktop.org>
>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
> 
> Caterina does not seem to be involved in handling this patch. Either you should
> remove this SoB or adda Co-developed-by: tag for her if that's the case.

Caterina will it be ok to remove this SoB ?

> 
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> You may also want to add a Co-developed-by: tag for yourself given that you made
> significant changes to the patch. But that's between Boris and you of course.

If Boris doesn't have any objection would go ahead and add 
Co-developed-by: tag for myself.

> 
>> +/**
>> + * struct drm_gpuvm_map_req - arguments passed to drm_gpuvm_sm_map[_ops_create]()
>> + */
>> +struct drm_gpuvm_map_req {
>> +	/**
>> +	 * @op_map: struct drm_gpuva_op_map
>> +	 */
>> +	struct drm_gpuva_op_map op_map;
> 
> I think this should just be 'op', the outer structure says 'map' already.

Makes sense. Will update in next patch.

> 
>> +};

