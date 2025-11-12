Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34211C52767
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:24:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B28010E734;
	Wed, 12 Nov 2025 13:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nq5dY9gg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B0210E734;
 Wed, 12 Nov 2025 13:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762953859; x=1794489859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=GVvOhKUcVtLR60Qlei9a8qmdgP1tYGEWFL+swVuJpgI=;
 b=Nq5dY9ggv62cP4geyp2Qd+Zr8fApLyWYqICIClPCD7MIrO4fzNUCgiDl
 IAC4gjjjuqjPqZ35/cpdoJ15utfAS2jz3RXzdGaKCBIt41p8KWfgxUqv0
 w5xRKXMPN/lexnBCEPwJFLcy06ILGdQoMlEP35ZCV3YxKd1/B/6XrOBdz
 41McYFYtFndKiEmtIETIHrhKpz28NLhd74uGQN/VppAYYzdXLWMg0im9R
 4c0CIP50hFKCyNOhTM3qV+IHnVfDDnUnpRE0JFNJ9P8uUF6jm7t4pQzyM
 LFCg7+Z0YZ0VCGtwu5iqiF6RIkUX29o4WwUxHh2sWoe4zAg2iKff02ZJJ w==;
X-CSE-ConnectionGUID: WWBUmcbJSEe/54ZXWRvnKg==
X-CSE-MsgGUID: jAQTxq8xTtuXlvMNL6A3wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="76363964"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="76363964"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:24:18 -0800
X-CSE-ConnectionGUID: 59RB/gKmR8+3yUSLauey0Q==
X-CSE-MsgGUID: S/ELCOL3RoOaL3bKNUaC4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="189069167"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:24:18 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:24:17 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:24:17 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:24:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AeHNv3ZJi4/MqmbPxPxIGw9nYIRQwQuY2AMl0SyNHzMW5ZFXBGPNr9uxttS1oE9T773Lkx/xpkcT6kCboBG0r3QALs4YjAW0iM7GwtSxfgdQ9Z4nAq6A9HW/6xvP5Cscn+PBWwus7tSKmH3ESKp907VMbYniO0cmai3GN0/3QaiipUZ1JY9sC2CeF2IuzLIdh2AMWz6FTmgC+qAoldqk3N92jBh0Y2s/IY8HLtziLZOUEIBsY2BXw4p7oDmmHXAKQJeXVg+BWM9ZSBfYrEfaj1m5qhrOT89dIpFQdsqNXHqkVuBMIGEts5i0xMa0oUgAA12PYWylVKsXepJc5d66HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4tRBXZvEeZwwqDFQYKGgZhI4C7r02WUoIU3jfxdNa0=;
 b=R6NdpRmietcDyg/kdZTgAFKV0V3iojDwTprPUEHgmk1xfglGfl1Xpq3UsLZ3q2OZsEsu4uAKJK42SXXbiWmCt5hKODSgJfhgcLKld7vHUlHYkkV0tmxEdDbaGplQXil1rt8K2YB6tMlL70j7pbhQUdAM/JdrSPCg1XnRKwl8I//SZE2ThUF7AVJVk2llXMWvfShBIK8bya0k0Iuzqbtfj/y2nXWRgjXbIg1zzDjuW4Xdipp0ImvcNa3clzv5f2o99gld8JU+eMunK0ZEBRq+DnyxPuxPqiN2Rt9zpKZFK4QRyienuVGY8EAsMOmeWYhXFHU60iq1ipf9xf9t5mUbkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 LV1PR11MB8849.namprd11.prod.outlook.com (2603:10b6:408:2b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 13:24:15 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:24:15 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 20/24] drm/xe/pf: Add helper to retrieve VF's LMEM object
Date: Wed, 12 Nov 2025 14:22:16 +0100
Message-ID: <20251112132220.516975-21-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112132220.516975-1-michal.winiarski@intel.com>
References: <20251112132220.516975-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0009.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::9)
 To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|LV1PR11MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f4ec296-13aa-4dad-0269-08de21eec6eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3RweTVlS3lWVDQ2bU1BQm1aOVF3NWlLMDNRekd4NDR2UDBBbEJTSmZiNG15?=
 =?utf-8?B?S3lTcW9Jdm5IVzAySUhQWHVETnlINlFwNGZpd3dNLzRaekJCdkVNc2cxQUVC?=
 =?utf-8?B?VG40eTJFSW5veG9FQkVhU3lIWERJNUhCOTdETkZpL2kyQi9MV082Uk5Yamtw?=
 =?utf-8?B?QWhpS2xva3VPZXp1TjIya3dKYnpwVzllQi8rOWRaSEw4RytnWVBrampxeWpy?=
 =?utf-8?B?WldBeDhOeWl5SkIvZUhjNEU3ZWZ0aktCNVcyeUZVaHp3SmlZTzFhdWx6LytJ?=
 =?utf-8?B?aHE2R2hhNExBNnZGUEFjS2xrampTc2t0V0U1eXZIT0dwSXBOTGpzNGlwV3cy?=
 =?utf-8?B?d2N1RjBjbCtpTlZSK2VDTUtvNXZQTjdXMm9jVUFsK1llTXhPamxXNlpaR3I5?=
 =?utf-8?B?WmQ0R0tMUmtUdWhGS3c2M3BLVWNtMFZQTklQb2VtZTJUeWVOYXhwY2Y3ZVFr?=
 =?utf-8?B?K3FLdFpIaFh4YldscmllMFVTb1NpR2VBZzI5NHFMWndLdmpidUdJNzFDNDQ1?=
 =?utf-8?B?Y0JyL0M4bTlPb3d4U2oycTlVbElISm5OcytUbjZhdlk0TXppejgvaUhoUmdi?=
 =?utf-8?B?cDdaMy9ZWXZ5aExLWlNmSmF0Q25SNUdLeFAvMHppRHhsRUhNNWtzdDZPSDBs?=
 =?utf-8?B?YUVXQ3Y1Unp0ZldnQ0dlT3BsNHR0WjV2K1hXY2JteXdsbUZGaG40NW0zc3dU?=
 =?utf-8?B?MmtDTndvWjZVd09YZVJRTVphZ2kra2svdmllOWZlWUJCaWhjMW9YaGQyS1ZX?=
 =?utf-8?B?K2dzTWhySGhUR0ZGdWJjaFZTaHovY1ZCWEVNT0I4QjFJcXBMdXJoOGtYakE3?=
 =?utf-8?B?NEFpU1Nob2w0OFA0MWtmdmoyN1JXVVVYWjVsNzZ2RzhGaVd0ZFlMbU9kS2tI?=
 =?utf-8?B?c2dsUHRiYnY0SGszNXY4cU83YWlRT09XRlFuSm9hYUJaRTdJbGFBQ2Zwd3VW?=
 =?utf-8?B?Z3hNd1pxdzRFc1dXVDNVczF2eVdEWnA1a1VLNDJCaWcrajFLa1luV2JuNTlE?=
 =?utf-8?B?UFQ3cXU4akthK1NzV0dySVNMOHJLZFEyMnJoS2owSmp5UUh0S0htWmxxVzhU?=
 =?utf-8?B?ZkFpelFneC9VT3lWb0l4MFBHOFpMM3N5THBSakorNkpORUxoOE5LNHpJOXRB?=
 =?utf-8?B?c0VKOTkvRWcvblBxZmFHREJheVEwNHdva1Y0NHRJVHhld3FBL1VmTElGQk9q?=
 =?utf-8?B?eHR4dTdjdkZKU2ZtUEd4Rnh6ZmxZSkZMRzJrb3pDODhETFdHNU9lbVBna1Fv?=
 =?utf-8?B?aXFnTFpwR3ZiSVVXWGNRSWo4UU9kT3F6d2l2KzZJRjlJSUxCZS9LMk9KTW1t?=
 =?utf-8?B?aXRWNFBSYmk3WVNIeGxKaHNUcWVkOHRNZ3ZYNURkVEFESldtQ1YydFc1VmpT?=
 =?utf-8?B?dW1QdWI3bXRQbjYwblJJNkV3WWtNY0dwWktSU0NKRTNpYktUN1dMVmI3RHp2?=
 =?utf-8?B?di9TRHBqS0FWd2puTm5PeExFYStpOHE4VDVtb2daa2pHK0tqRitmWldYakpG?=
 =?utf-8?B?WmprdFNEeE82ZVRBZ0pvUHNNUGRVUWQzZU90c29LRzFkSzM4K1VHZUN6UVFK?=
 =?utf-8?B?a1VXQ2hBbDVTV3RJWm5zcHJ0b2hjNHpvWEdSZUxwWWs4SFliY3VqR3Q5L3p0?=
 =?utf-8?B?MksvL0FjSWdOdERnZU5kNUxuelRYQjkzMUYwbmxoV3c5aFpuOVVjVFlKTzg0?=
 =?utf-8?B?bC93Y3BPSlkwelJIQmtSVjh3THBpekNDSHN2eUJKaEVKZzZRRVpiN0ZNek5I?=
 =?utf-8?B?eWtaSTluc002UjBoNjM4UGYzVFd6SFpHT3ozdXhyemNGV09ySTl6K2oxMnZv?=
 =?utf-8?B?NlVQWW4wWHpEeERBWmRhYjBNSUR5Qmw4d0Q3cnFyaDRYcXg0eXNabTM1eXF2?=
 =?utf-8?B?amlBa1NLY3NkK2pkU2kyMTNEL0d2aWpWME5WdUVyZ3MzY0x2eEhIcFMwSElJ?=
 =?utf-8?Q?0VZd8U1REEmGwsVnRFi0/NPZUCtfbp3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bytIYmpUVXR4a2lzaDd0UUtERGNJdURRWjdwZi9nVk5VVVlia1JmMFdUQ0VN?=
 =?utf-8?B?VzdSRU5uRHNKbmpWRDE5SGpMYVptay9yeXFKbGpmbzZ5alU4REtZOXMzaDR3?=
 =?utf-8?B?dXdoQXZMT0ZnSmZRZlJBakYyQlpDbjF6S0owSm9COWVOMHJGeENBdGhnYUY2?=
 =?utf-8?B?N3hNTGN4NklZUkVSRGY4WFVab0FXazA1TXhpeS85bU5MemV6Y3VxNis1alRP?=
 =?utf-8?B?b0xJWitDRjlRb05PSTBSZ3VvdCtmV1pPV0FCYTkyQ1NJeGFJUzVKN3dZMEFu?=
 =?utf-8?B?bm1hVVhPRVZwRnF0UHlESndWTWR1STNud1J3bmw0dHplSTRmL0hkYkpIOEla?=
 =?utf-8?B?L1d1VXN1RkdiZldiL3g3TndGMHF4bUVsS0dtMVpRSmlrN2VwUXNjdUpkejM1?=
 =?utf-8?B?ZkdRZm9OcU5XZzRKWDFoQUlSYjl6VGNSQjlrVmd2MERYZG43M1hWOE0xdTdp?=
 =?utf-8?B?cU8rbnZoS3VycWowMzJqZ2liczgxOTFmSkwzRGtzYitPVHhqUFArYWJ3b3Yr?=
 =?utf-8?B?aHpITWZ5dE9oMzQ4amx4K2xaajhzcmQyYktLSzFVNGJDSWRIZXFsV1FYZTNw?=
 =?utf-8?B?TkV4anZhOXA4M2dOcW5iUHVoNDNheDJTS1NHNEJmMDlnVnBtbnFCSFNRZVEy?=
 =?utf-8?B?REtUcXE1MW1YMFR0eVovbnBpZGNuYmllbGJEZ012dUo1V2ZSaTJLY1hCMlQy?=
 =?utf-8?B?dHVPUm0vRk9zVHJaQjd5dEpoemg1bzlVMDZ5QS9YdjRNMkR5MjdRYklZZU5J?=
 =?utf-8?B?SE5NUHNvejdMSTdHejUrQnlvaDhqY3Aza1JxZjFQYTdib3RlTFhHNDErMXBl?=
 =?utf-8?B?em5USW9LVmM2c0QxejdidXV5V25xakdvSVFuVG9oMXAvM3B4MlNSQktnRHdD?=
 =?utf-8?B?TmYrOE1PWTFvZEp1aklhTVJuSHdNNlJoSVNSeFJzdlFLWFExTWw3OWZFaDVm?=
 =?utf-8?B?ZmRmYzdOeVcvTEpPQitabzh4RGJZaHZ0MXJqTlVVZ1FlU0NwQ1RZRVRCb08v?=
 =?utf-8?B?ampnMFFtK01YZzNXSndRRU9LVFFETEcxSUlpaUdsMUd3eW9MOUFldHdqOFhk?=
 =?utf-8?B?VGdHNzFEYVJJRU5PRHUwb2IzTzIxN1hlYU5Tamd5eDhzMUJHcjVINXd0ZE9G?=
 =?utf-8?B?cDJ3T1BWV0J1M29Ob3FMMFJyY0Y3a2lLajJFUTdmR3AySUplMUtTYVh1SG5q?=
 =?utf-8?B?UEhkdmEvNlhpN1ZvRjlxckpUQlN2VmxET21EWjdXWDFNSnFUc2RuYnUrK2po?=
 =?utf-8?B?RFVLbHVZRXd6Uy96TEJHWWx3M1N4NHdwOENONlhlRmNCTWFSSGh2d2l1NVB6?=
 =?utf-8?B?dGluSGFvZVhVTjQ3M0k1eStDZGZrUzNxcTMrZ0VUdmIrLy9aYnVwSCtXRDYz?=
 =?utf-8?B?cWxkcG9oR3gvYnlOdmxPbXdOTDJVdG9ma3FXNkptUGMySzBiTXNYQTJSY1NM?=
 =?utf-8?B?bTlPYUtoTitHTExOVWZNS0s0eFhHZ2twSnhSbVQvWU9yd09aSStzb21GdUtX?=
 =?utf-8?B?dlBCYnNSRzJWaFNLSjVrSzV5YnY0UlEvOTJaTHY0aVVrWFMvT2N4QW85OWsv?=
 =?utf-8?B?VHhJbVY1TGo3R1V6STl1N01wblFkSU83a05vQlZ0WWE0Y3JIOVoyL2tvMG90?=
 =?utf-8?B?N215YVBkYWEreFZwRGRpOGI1NE1FeEFheGpJM0FQbU5GcENkWHRnTGp2bnIx?=
 =?utf-8?B?cnhqVEFTY2Fac3VwQlZpQTFLaUVJS2NrR1djQWduclFMNUx3S3BkNFRZNVlT?=
 =?utf-8?B?cGg4Y0dySmJMQ0N5QTZmanVUcG9YRUxuS0RZVzM5am0ydE12bTlLOWV2ZUg2?=
 =?utf-8?B?QllQbmE2c0owTEdTelFVdkJWYnBpcDUzSkcrTnhTNHN6dm84aG5Wd1ZlZW9C?=
 =?utf-8?B?WkFFQTVWS2xVS3FsMWFYMlR3Nk1OTXgrNm5JZzMxMkxvZVoxNEcwZEFuR09l?=
 =?utf-8?B?R2dsTjEwOU9vOHNLMklXNHBVMTM0SUVhTTM1RE5NUCtQYTRhUWxWcHlyMlFS?=
 =?utf-8?B?NWoyTmFDUEppeWQvbjhDQ1JVcTBNSUJBUHcyNGV5S0lJRzBGZEk4V0ZGeitG?=
 =?utf-8?B?M3VhUEc0TEE5ZVcrejlHd2FFS2gvSFJBNUt0MDh1cURIWnRvMGdtb0VvQ01h?=
 =?utf-8?B?cDlBMGhqSDdWQ3BmOEJ1RjFEcEZZa3VsbEQ4aWc2ZXc0NER1RlVxM3pvSU1l?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f4ec296-13aa-4dad-0269-08de21eec6eb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:24:15.7738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1JVCD7eVwefJdPybjTK43nfm+mQSbYzdLvBWjumRkJc0Vlp0BOtahOyzILmXvPwJmcSF6wEcZwp7ZJEccyHIH0AqDUh3sXIkFw/2UJKyTQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8849
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

From: Lukasz Laguna <lukasz.laguna@intel.com>

Instead of accessing VF's lmem_obj directly, introduce a helper function
to make the access more convenient.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 26 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 5b4e1d2da5adc..9c14f02961355 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1692,6 +1692,32 @@ int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid,
 					   "LMEM", n, err);
 }
 
+static struct xe_bo *pf_get_vf_config_lmem_obj(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
+
+	return config->lmem_obj;
+}
+
+/**
+ * xe_gt_sriov_pf_config_get_lmem_obj() - Take a reference to the struct &xe_bo backing VF LMEM.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function can only be called on PF.
+ * The caller is responsible for calling xe_bo_put() on the returned object.
+ *
+ * Return: pointer to struct &xe_bo backing VF LMEM (if any).
+ */
+struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt, unsigned int vfid)
+{
+	xe_gt_assert(gt, vfid);
+
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	return xe_bo_get(pf_get_vf_config_lmem_obj(gt, vfid));
+}
+
 static u64 pf_query_free_lmem(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt->tile;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 66223c0e948db..4975730423d72 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -36,6 +36,7 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size
 int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
 int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
 					u64 size);
+struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt, unsigned int vfid);
 
 u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid, u32 exec_quantum);
-- 
2.51.2

