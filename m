Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACF8AB96AE
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 09:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B43810E9C4;
	Fri, 16 May 2025 07:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S8hjCmhf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192B910E134;
 Fri, 16 May 2025 07:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747381120; x=1778917120;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZfMSAdwcfFeFuSI0M8WVn6tlhOxZ4jAiX/z1S9+uMgA=;
 b=S8hjCmhfAf6L+I0/mAG4ygZAYrzextQsXa0vjveNdY3WDl6d9sD5fDB7
 zqkZTuHiyDFzpuhTCJPy/7p5X4LaTT6urxWqVw8X//ZWvknHBRw/gheOB
 tLSh7lDg7Vp/J/Gz/QyHpoEe6wWX+6oJJHkzPh0RV2E1gNSUGToVUFslw
 bTwrz5h1LnhwBQjPnap3ulKRWm4GIwzw6TL9fzJehsgnLUEoAeNCSpBy/
 S2j2FBcMgiQs0XUIAvRqW6RwgGmX13DU/0XtEc9AnBH4VMLK6VkvXO5Yy
 OIq98YuKu5SGgCcs7FbDnYPWSLswHAkSet5C1NPowOROk4Ys26x6FYQnA A==;
X-CSE-ConnectionGUID: Z/UJ0FSpT4mnemeZKKZ1zw==
X-CSE-MsgGUID: WIPlPe8WQNyIqdS+oYJuwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="59982508"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="59982508"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 00:38:39 -0700
X-CSE-ConnectionGUID: S56sWbXaQp60U1b1Looa+A==
X-CSE-MsgGUID: t9/dqpc7Q/qqiI/gZXU3HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="138523776"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 00:38:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 00:38:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 16 May 2025 00:38:38 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 16 May 2025 00:38:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZcNSp+6iA+wgs1c1WmReXk3vjiBUI1pktQ5thkCOm/vHlWMyEY2A+dB+k4Cy2DRXILA0/5hZBfF//N9oLF0oZBBs5Uf+0k4Lcg/NTw+hG6k9NddSqAqUP+BD65bUFK37fF/3YCtOb48jCp/xBldAaM6yqJvyYZypDKCGwXvV5r/geZcjJ4VorBKGnZBfRvMND6EAIkvPBr8mL2nEDBJubDMjcA79ZOab1gbMiYc8ifGT80lpYwSuDmPbD9w0ozN705ebcwKYElaTX8sw8cKPYwpfGIgzGgml29vKhh5YkQcwAq3+RDiXdfslBOhOgzTDfJneGEKcsbMA67LZhA7zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpOxSb4fynvM3sCwdGB6F45JPdJG/WLaal+jx2gPhOc=;
 b=Slgd0HZd55Roh4vUvUo+q2tJ6qd4jjz812y3lFcyWV3dxQCZS+uG3hpp2m9PS6wdIXX0B56MZLaBRH4mKDpLwHBRPYCQGg9BD/0gwO3fskJ5Wu5IGzu6vibYlmhNj/EnSkjBBuvWc6qQpT5Nz+fFo+LFdDDM8eo4MyekCh7vyOakW1733OwQq3aoCisFsEHWqSF4jjG3yuZJdbdyIbWXVifGbGB2AAJx2zSmcDOgYfk8Vl//tuE0Ecko1geRzww7ZXDt2rx2jDQAIYER80hBxfkeMSfjPZbenT/KwxeKrVSgHsY/oY4TQGuZtjeoMlIEE8gzFHcgFe+X3JDGkkKmsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SN7PR11MB6725.namprd11.prod.outlook.com (2603:10b6:806:267::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 16 May
 2025 07:38:36 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8722.020; Fri, 16 May 2025
 07:38:36 +0000
Date: Fri, 16 May 2025 07:38:25 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
CC: Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, <siqueira@igalia.com>, <airlied@gmail.com>,
 <simona@ffwll.ch>, Raag Jadav <raag.jadav@intel.com>,
 <rodrigo.vivi@intel.com>, <jani.nikula@linux.intel.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, "Pierre-Loup A . Griffais"
 <pgriffais@valvesoftware.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kernel-dev@igalia.com>,
 <amd-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/3] drm: Create an app info option for wedge events
Message-ID: <5dxyi6z36a2vwwkw4lmh5sitgl62tneefwgnfa65pe36nvgsb4@6xzavo5itdjp>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250512203437.989894-1-andrealmeid@igalia.com>
 <20250512203437.989894-2-andrealmeid@igalia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250512203437.989894-2-andrealmeid@igalia.com>
X-ClientProxiedBy: DU2PR04CA0234.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::29) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SN7PR11MB6725:EE_
X-MS-Office365-Filtering-Correlation-Id: 8717b919-ec81-4f14-c5ab-08dd944caafd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzFRQ2FGcWE3YlJ3UHhuU0NkNXBqVnp4YS9jVlJXWW4xL1YrVEtyR09GeHRJ?=
 =?utf-8?B?SFZBZEJYbWFjbUc3M1V6OVRvM3BxbzRBK2xrNzExcjVWYTJNNy9iSHFDbUZ6?=
 =?utf-8?B?OVFIdjV5MVA3ZUdrcmVvdFNUN3BmYWFmakE1YnNFb2pKR082M3ZOdGxwN2VN?=
 =?utf-8?B?SjAwZzJuRXZMbUNTdjhaai9hS3Q2QjBRdWNRWGFyV25tZ2FhL3B5ZzNSKzA5?=
 =?utf-8?B?b0tzRFk1dGNOU1FScDFrWGxCY3J4VXZ5VE5QQ3lEOXFmdG1mQWdHb1ZMd2Vu?=
 =?utf-8?B?YzJ1UTgwZTdtSkNTZ21NL1FIQnhvQlhXQzhldDdtOGdoL2QrOGF6TjhnRjZ4?=
 =?utf-8?B?QjBoT1VXVjJMQzAwTUpnSWdlVXYyZFVrUU1YeUV6UmE1RHJDWWhCSDZVNFdo?=
 =?utf-8?B?YnVKNCtCRXU2bmw1TFlWZHZ3ckMrWWhOWUVYWU84K3RLdlB3U0E5L21XeDZt?=
 =?utf-8?B?Um4rNHROS0xPL2dFL3l2Vzd5ckZoMDVrbmxFVTJnbEw5WTNnSktJTTB3NXVI?=
 =?utf-8?B?MlhYRUFlTVdUVTBBRWdsd3I1aEZXeXoyZE9zemszZlJWdlIyWm9NWHJPY213?=
 =?utf-8?B?d21CVjFTbW1EOE1MQTI5OGdBWWZzWStES01VaWVLK2RtV29ZVzFqSDhkeTRG?=
 =?utf-8?B?aVlqaVVhRHV4b0lOOVZDZExLOWc0TGRhbnBUeXpVdUxFWjFVaDNrNHBQQmVV?=
 =?utf-8?B?UHd1OTBXOEN5d1BsaWZSYVJZUGJEaXloYmdJSU8vSXk1VFJRYUFXWkxscTd6?=
 =?utf-8?B?Z2VrK1FlSFQyTExVejFiVTJnTVhJd0dJMDZxT1FEM21sejVzUGJ0YzBZT2Nz?=
 =?utf-8?B?b0lYSWZSL25tN0x5NmUvV0lacitQR2pSSEtIOGJyVU16UXVjK2o5akhFRndj?=
 =?utf-8?B?MUV2dXM2dnRYdlo3NDVWZzdIZWh6bFNFa255cGNQMjJNcStMeTlVcjlFcG83?=
 =?utf-8?B?NU1HREVvbmpFcDdqSzhGMmlsd2NFSlg2UWtGbldseExGaHhmTm5VTkV1aFRI?=
 =?utf-8?B?bnRtSGVacTBYanVkSUpSVjk0dEliNjNaR0MxekQ3NGoyY20ycjVnZlJlZ0VX?=
 =?utf-8?B?ZGRmekJHamRIaWRKYzUwSC8yd3dhWUlEUmpiYnpoVDUxTGh2NnZtVEpvY1cv?=
 =?utf-8?B?RWFDTlNFZ1ZTb01ldnVBbW5aam5FODFWZTZLaXE4Nm5OUU5hM1EwVDQrVTBs?=
 =?utf-8?B?S2d2MG9CSTU3OGFyamZ5NmdFYWlRYlFFeHloSGZiZTRRdlVBeWo4NGZOUWJB?=
 =?utf-8?B?NkVuUFJwU2R0NnFjQ0I1a0lLUkhVRFk5Zk1lMEkvQk1DTHB4R1lxZmNTa21T?=
 =?utf-8?B?eThGZEpSbjVVV3dQcjdwR1AvUWJtSldNbWg1RXRBQzRTYnRTZVhLbCs0aS9X?=
 =?utf-8?B?bDN1Zjg5Z3dOOUZQTzl1ckhqd0tqTFJRUlQwZ2FNeHY0UFM4ZUFJeXMzVEFj?=
 =?utf-8?B?eC9PY2lNSXRaeWljb3NDay80bTFkeGxiTm9qcTN0OWxUM3NHS2lGUW96NjF5?=
 =?utf-8?B?MldvYVBHR1A4K2Z4K0RDcHRrVytYK3BWRjAyRE1MbG8yb1RnYU9sRlZ1VHNI?=
 =?utf-8?B?Mm9iTitxVzUyUnZyQmxWdDJIdHlrN3FlU29lK2VXMUk1bmRVcjNwRE5jc05M?=
 =?utf-8?B?THNBL3pFRzQwajMvaC9HTFB6d0Y5ZTl1N3RPcHZQLzBnVFFRRWhYcnBNU011?=
 =?utf-8?B?K0RUV1BoOVMxQUZtUWJOTFZ0ZEhHUkx6NU1PWDlKUGNJWFNrbGYrb3ZtclUx?=
 =?utf-8?B?NnpOVWI1MWk0UjUzV0xZMlV3eFBpRDNxZnM3TDBnOVRoUDBXaUtVbGFmRmpk?=
 =?utf-8?B?dUdOWVd4R0tzODR0RUZBUGtMQ0N3d0VjcURxNEVlQmZaNEFqZzZUZnl1bVo0?=
 =?utf-8?B?bUVzdThSSEcyREMwNFNUMklZWjBVRzBSZE5zKytLWHkzd01wNVVQMnlPc2VO?=
 =?utf-8?Q?jHosl2l4c3I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDhQVXBEYVhEY0srZ0h0VkhQQzJGMnlyWXVLK2JodXR1bnRZYlZTSWV1eU5U?=
 =?utf-8?B?dnNTNE9STHR6UmxvLzhlMlE2SmVDa0hMVjIweTc4ODJ0elc3V09UU0lydUxn?=
 =?utf-8?B?WXdSOGp5KzRGWjRVaWsxN3R0cE5tU0oyUFdOb01qQUs0ajg2VW5adzlJdkZO?=
 =?utf-8?B?VE1NQllkMkNDMi9PUTUvQVovRkMzVm9kVkVhbUVzMDdPVzdPOU1RVDROU3hX?=
 =?utf-8?B?Sk5WblJHbXphbFlrYk5CRTRvNWlnUjc3Sm5ia2swbUFrSGNybGNxTk0vL2dw?=
 =?utf-8?B?eGZPVkRBWEtzb3FpZEZpTEJDWHlwVXVEWDNGY0Fhd2RHK0VHczNzcG5tOHor?=
 =?utf-8?B?YnhXTjJONGZlVnBMSi9GV0JmcHBzbGo1cUpTR2ZMNVFHKzRSNXhmdWxSNGIx?=
 =?utf-8?B?NjRuVnZBYkF5bjJTZWpRUGhpemkzNFkxTTAzVCswMHA4UnZKWWorNDZ4Y3Zq?=
 =?utf-8?B?Y05aZ2lJQWFtYWlxZUxwUlJ2WFRpL2IzbDBoWk50b0V6R2RZUVh0RTdncFY2?=
 =?utf-8?B?S2J2RHpEcjNHQlBINDhyWVhzRDQ0REZFS3JPV1JvSUNuOEZnVHRpR05Helgy?=
 =?utf-8?B?VGhXRmZNeU1iNFpNOGs1QWdNanpFVmNmR3FwU3I0OGoxcHFhMUNvS2dYaWpt?=
 =?utf-8?B?L1JyaTFlWDJTNGJjTEh4QkxicjJXYllXRy9LUnhMVVpGQ3Z2TWRLRm56L1Jk?=
 =?utf-8?B?TzVXNGF1dkYybkJXVExYWTlSTis3KzFjSkJjOUduKzg2Q29uSFdDVERUdGtT?=
 =?utf-8?B?MUh0R3lFeG1WK3d3YlJOK252M1BVK2dISXZiWjBIeUlsV20wWjFNdlREWkNx?=
 =?utf-8?B?L2JuOXVCQXNrMUppQ01CcGJ0dHMybjlkV2pPWXoyYnJJSm5vUTA5MGpDUmVy?=
 =?utf-8?B?WEZFbEpXS0tWQmJ1TEhwcS9VV2M3VEc5Sm5jOThCTTVKQ283c1NKemd0L2tY?=
 =?utf-8?B?ektMcHZNdDd2WkgxWWNHdGVKekdhMHErQ3l6WWtmc0xuWDhSRTkzL0lzM3FG?=
 =?utf-8?B?SitOQS81NEk1NWxaWDJCc3hDMWc3MHpYYi8xVkltdnNzYjRjUkhXN2d1Ujlm?=
 =?utf-8?B?Y083Q2lOWm56aStmR1hzY0wyZTVGNWNyN3FHclFHTmVPeTZCeTRpbWdPOHJi?=
 =?utf-8?B?eDVZT3lHRVBLUmE3VmNFNzliYlBlYnFZTm01OUgvNTU2WWZySk1EQ0wwc1FO?=
 =?utf-8?B?VmNBUElGYi84SGJSUWxhTHpuME5ETnFjUkZtdUNqVnNUTy94d2xBeWYxZkF6?=
 =?utf-8?B?MVR0QUt2TWUyOUVLeGJvOVppS3lndm5kc1VvWHIrUTlleUpMZXh4QURteUVm?=
 =?utf-8?B?MTl1anQ1NVBEK3dibjlnd21sVHkyR0pCTDZzYkhEMnZLYnFSVWwyTE43UkhF?=
 =?utf-8?B?OXhIYXI1RHJQME5zY1hvUVN1UXNqWmlzQUNzT2g4T0I4NnNmOTROd1BOOWZ0?=
 =?utf-8?B?bm5NalZMVkRlVHZCSTJNUG4zaGRGWGdYQjRnSTVEdzVjUFo3T1ZKRDk3dHJW?=
 =?utf-8?B?UzRVTHlEVTZjMHc5Nzk5MGRUNmxUTWlhWHg1elpBNzM5WFBZOUJUNTYydndu?=
 =?utf-8?B?cHZUZzZRZndwb1EybUhvRys2c3dWb296V04zNVRZYmN1VFdscUJMZG9JYjFK?=
 =?utf-8?B?TE8rQzdUVE9pZ2J0SnR5dExTYkdOQmh2ZUVYanVWZDUrRS9zb3RJS3VKb1VK?=
 =?utf-8?B?eVYzc1RoNGg5b2NSaUZwejNRS2x0Nm81cUR4Z3FCNWxrNGVjQWdXNGNJcW1n?=
 =?utf-8?B?SFpqMFdEQ3dUMjNieDhqRTVKM0luS3dRQWUvUzdESmZWaVNvenM1Sy83TVFa?=
 =?utf-8?B?UUl1MTczT05qa3orV1c5QkhGSWs3bEl2MkVPQ1N3RU5zTTRZNldHWFprZjFY?=
 =?utf-8?B?TkRFelM1djhyeVo3RjJaMjcvY0RabGI0d3UrOUVoMHNJdi9mMWdIRVdZajIr?=
 =?utf-8?B?cHhaQm1OWnMwOVZJZFlvL0dQYXU1K0J0dHpBNWY5TnR2b1l2Z1hEamg5N21x?=
 =?utf-8?B?YnBaTGtMYVdVR2lMNFlTMDl0eGNDT01RRzgycjVXUUI3cUd6azRxdVZWNFlL?=
 =?utf-8?B?Q1h3TE9ub3VGbUFaTkNHOENMMFA3TTIrUHJGbzQyRVd4K0wreGFTOXRrZnRK?=
 =?utf-8?B?cU04YmI4VFYrbHZyWVhqaTRSVlpLRGxKc3MrY0xWS2piOE5leFpQY0tOeExT?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8717b919-ec81-4f14-c5ab-08dd944caafd
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 07:38:36.6668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FeKx+2o0NlZQUTwNfO9BFCdUArJFoQ50dVKcC3JalPB68J/y2neul59nA1Tl6szwtTUwFkwFCqX+/pBpJ8r9vPPxcW8pxaYJV1HXe6W+SJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6725
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

Hi André,

> When a device get wedged, it might be caused by a guilty application.
> For userspace, knowing which app was the cause can be useful for some
> situations, like for implementing a policy, logs or for giving a chance
> for the compositor to let the user know what app caused the problem.
> This is an optional argument, when the app info is not available, the
> PID and APP string won't appear in the event string.
> 
> Sometimes just the PID isn't enough giving that the app might be already
> dead by the time userspace will try to check what was this PID's name,
> so to make the life easier also notify what's the app's name in the user
> event.
> 
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com> (for i915 and xe)
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v3: Make comm_string and pid_string empty when there's no app info

LGTM:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Best Regards,
Krzysztof
