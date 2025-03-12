Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1225A5E8D0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 00:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFA310E33C;
	Wed, 12 Mar 2025 23:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GciAgPF/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A72B10E33C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 23:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741823800; x=1773359800;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pGcGCiLOPfJqCG7xCbOJ/3yQ4+n4KuuFm/PEXhaUxhs=;
 b=GciAgPF/lSiloWRotYSqkvoEJ2mLrIpOZmQKl8jc4ZJLS5lC/ZAHj9vN
 Z9p5Cs0a1quGzTMAgGke9v2Hk+Yde75P8losmVGgZRG3z6I2MJNv+S58S
 LdBpMd5i0VlG6acF4L1bxEHc1GMbFgsOy1sowmaSHm6QLkbUGXqo/A/yd
 YWB4EZ6aPfxlPPpcE5E7tlYXIyfBmpDoi6wyxLSsJKfbY6jTf02i9ts9l
 WoH/e/E/8zKCZC89RF72RO0Vj+2tdxFsJZ3eQxJ4zaSeT7/KriOxidius
 qsbwurtNPRx9Y/iYwMIb/dGraOTjMA7mMqhwK6vRA4RuNi39/wGu46U4D Q==;
X-CSE-ConnectionGUID: CZFMntl1SLGuRgwfSpLHGA==
X-CSE-MsgGUID: LeY8YrhZRSyP4stOpn8LaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="30514409"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="30514409"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 16:56:38 -0700
X-CSE-ConnectionGUID: q/0gx/XjQaqpRpNE5JRLng==
X-CSE-MsgGUID: NrG0LIS1QmadnkhRMXWfNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="151612852"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 16:56:38 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 12 Mar 2025 16:56:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 12 Mar 2025 16:56:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 16:56:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V25K0CFm/cYN0CU5GbHf+Z19qxqv04cF597SKY5lCD62jj1jyVo5nlH/QA0AD1dStaZW9jBwqokjxfN8Wzg/sLyqR3CjCrqIodLn0soi8HZ/L5eHcv/BbxNNKHGVxT4tU5NXB8oceJPIPt0BV6R4hJhVL+05pJAaYTYRv5l8fcnS216snli1akykxYv23xeIyLiNqG2r0B+u+adYB9XXKCGWt4ImChrRb8x01HMnOt0NPObQWQLmNrjfSJnVUWsbDMyVGOaYPuZPcmX4Qu5U2poRbojkbVLXF1g5x/HHucRKc9oDdAkfRRekxu52bBfOIDYhnRMjuykgzAXYjoV09g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0eMlOF73O7NA+I6xGYjyQ/g0PmA321lzCtF+JT8iyA=;
 b=hG81wJd6WKYsJC7eENPIhWBAY2slIp/nRDKBfHu4kLgNT4buhgyB1OaCQS6HgZxvd/iJOy3LBKgMtQX1r6XtTnl3BfMKDU3ALjowMcLrx6yXGkaF2CZFCl0gEG2T/AIGAZ+YtNNYO0CeBZTJeuSRorhLOmm/nsQQ//JooVlLSW62YdrXU1zvN9xup/qEepTDosxQMYJL5ld/1IO6hpZOVIulB43s3qSP8yRpCxLZFiCRDIddmWiyF4QWro7koM0uRHFlSx13pQosyX2cCV/edOjcfpR0brXUfkgr1LE5tAhsAU7LbioZ0w5JF9AUi0eWcmy2srhNW979Bf9nIjujOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by IA0PR11MB7186.namprd11.prod.outlook.com (2603:10b6:208:442::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 23:56:33 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%4]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 23:56:33 +0000
Message-ID: <cbb26a91-807b-4227-be81-8114e9ea72cb@intel.com>
Date: Wed, 12 Mar 2025 16:56:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/16] bitops: Change parity8() return type to bool
To: David Laight <david.laight.linux@gmail.com>, Jiri Slaby
 <jirislaby@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>, Kuan-Wei Chiu <visitorckw@gmail.com>,
 <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, <jk@ozlabs.org>,
 <joel@jms.id.au>, <eajames@linux.ibm.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dmitry.torokhov@gmail.com>, <mchehab@kernel.org>, <awalls@md.metrocast.net>, 
 <hverkuil@xs4all.nl>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <louis.peens@corigine.com>, <andrew+netdev@lunn.ch>,
 <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>,
 <parthiban.veerasooran@microchip.com>, <arend.vanspriel@broadcom.com>,
 <johannes@sipsolutions.net>, <gregkh@linuxfoundation.org>,
 <yury.norov@gmail.com>, <akpm@linux-foundation.org>, <hpa@zytor.com>,
 <alistair@popple.id.au>, <linux@rasmusvillemoes.dk>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <kuba@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsi@lists.ozlabs.org>,
 <dri-devel@lists.freedesktop.org>, <linux-input@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <oss-drivers@corigine.com>, <netdev@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>,
 <brcm80211-dev-list.pdl@broadcom.com>, <linux-serial@vger.kernel.org>,
 <bpf@vger.kernel.org>, <jserv@ccns.ncku.edu.tw>, Yu-Chun Lin
 <eleanor15x@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <20250306162541.2633025-2-visitorckw@gmail.com>
 <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org>
 <Z8ra0s9uRoS35brb@gmail.com>
 <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org>
 <20250307193643.28065d2d@pumpkin>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20250307193643.28065d2d@pumpkin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0272.namprd03.prod.outlook.com
 (2603:10b6:303:b5::7) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|IA0PR11MB7186:EE_
X-MS-Office365-Filtering-Correlation-Id: e3a10a16-be92-4ca2-f6d8-08dd61c1847d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M241YXVpTjN5MjE4WUFoSjZRTW9rb0pTeExPdUFuTEZFSU5hSnNBYkdzQVJ5?=
 =?utf-8?B?M2VEaUhuNFRSTWI3Tk11aVNoYU8rWWc5UE84bElZR21yd2NhSWZhZkFUREVE?=
 =?utf-8?B?cWVhZUUzc28rVjlSc1NSUGFsVGJuaDZsU0M2MzIvcHBBYUlGSTYyY2dPSk9t?=
 =?utf-8?B?OVB1cnlxeitmYzFYenUzVExQZ0JOSTBhV0V6aEJYa2RkcDcrNnFRcGRNWWYz?=
 =?utf-8?B?cGQrd3NkcE1QSDBSZUdGV0JXQTdRQUNoOVJGZkxKZ3VCSVp5SHlKUzBrT09x?=
 =?utf-8?B?VzFESVdiSWxRUEJqNExLc1V0aTl4bmxDTTdZcVZSWnA3a0NRckhIT3lIRDhj?=
 =?utf-8?B?R2Q2RTZQdDE3b2dPTmxoTmNkNWZVckZtQzRIWTJwYjNxUWd6MU9TOEM2R0NL?=
 =?utf-8?B?em9hUmliT2RPUm1oRkFDMnhETEZHVkNRQWJ6RlhNZzFmUXhQWWpVZEpxaGd2?=
 =?utf-8?B?d1F6WWp1dlVudDJlVy85bzZYcWJhVjJYdUlVVmZwTmNlVVhabjJpZlNaT25U?=
 =?utf-8?B?QUtNY2VBVGc2dUR1WDRVVUtFV3dvVTZqWU1NTi9JK3NtWXJxV2hKdU5QaE9V?=
 =?utf-8?B?ejA5a2ZiQmZCeFNVYkFOdUJZMGNXUmxXYzVPMzNmK0RndzZGQzNhaVVGUk1U?=
 =?utf-8?B?ajZKa3Q2RmlPMjY0Um5QZU9RZWtDWWxlSEIwc3Z5UGlOdVJkN1VHRXErUjNB?=
 =?utf-8?B?UUdKSXA4VURpeWhBL3VaSTlSaWdGR1o5aU9Lem5LK01XYTBGeENnREY1dStP?=
 =?utf-8?B?OVJ4TlVUSERLanQ2NjlQRXBNR3Vlc1ZpT1lMamMzTmUrN1NBMnA2NVpGeVlw?=
 =?utf-8?B?Y20xb21od0xoVWdVSW5PTVpEUGx2T2NsQzJ3SFVFZXlhbUhYVHk5T3VleVRZ?=
 =?utf-8?B?aWNsS25TemowdXIxcVVtWVRBSzZsejE2Ylg5L0R1V1dZY2l2Z0xtakVobTdj?=
 =?utf-8?B?aDRqRjd3UTRhbnE2NW9NNWpMZjcxbmlobldMZE9STHlOei9JT3RtWVk1UFdo?=
 =?utf-8?B?T1ZKV0VHbEk2ZTdlUW54M1ZnakJucmwrMTc2a2hLWFRRcWJacGI3U0wyc2tq?=
 =?utf-8?B?OCtQeklsa0JZVnZyZlNiR1BDOWh6S2VJM1RLN0t2b00raGJLQno5L01LanhC?=
 =?utf-8?B?aHlueGszV1cvdkI5bi8rS0g3YUduZ01kTFNUYmVETU9sNjFxdE5lc0dBM1d4?=
 =?utf-8?B?ZjJmZzBHeEVKcm4rYTBkTGhMWmlzVGZ5NEsvcjF6ZUJQMU56WmNlcStuNkxm?=
 =?utf-8?B?a3FXUWJ5SzYwZHQxdXVHRGIvT2kyN09FRVJsVFdVZUlkYThMc2lFMkE2SGxN?=
 =?utf-8?B?T1BzWEFZMS94aklDYUJqL0lOVTM1Y1ozdUErVTVTSzYzNDFvZHJHbkNFTkE3?=
 =?utf-8?B?cjdEdm13eEk5b0QzVXR6L0Z6VU1OMVZRejI4YWsvRlNYZHVjTmQ3cjB3NU9w?=
 =?utf-8?B?SWdHek1rRy9kb3U1MXJVZVk4OVAybGJLdEpEZE82UU4yTDR3VkpORjk5ZXkr?=
 =?utf-8?B?UkxLb1RHM25xNzBtNmg1WDVWQ01EYkVSKzRPZE1oU3hoNlo0bUhhRmp5REZ1?=
 =?utf-8?B?MDRMQllEenV3TXByd0xieEw2TnNLaHdOdm44VHJnbFpPd1pSUHRSLzlobkIy?=
 =?utf-8?B?RTFzWFA5Snc3R3cwT1IyM280UXo0dktkVkFNZkozVEhVaWh0REdwTWtGMW41?=
 =?utf-8?B?a2piL2pZWW9yMFVnYS9LOUF2MUhNMmZ1TmdkOGRkT2FQR3hCQlVUQmw5UTk0?=
 =?utf-8?B?TmZrcFlOcDhqbVJSVmcrVkNNTTdORTJ3eXRrc0RxTFljZVI2V1FHNTF1MWoz?=
 =?utf-8?B?dXBUNHFZR1VXYVp6Yy9UUzlyK090Qk9ta1dFMXl2dlRBZ08zU3lYNS9XSDdp?=
 =?utf-8?Q?+yKepvpGsYydE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5089.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUVzR2ozWTU5cTVMcCtobXBUL2VtMElKV0VNRXlYN1E4N3NkVkpJZ1dNbDdV?=
 =?utf-8?B?dXpLUUV3YXNrSEIxYk5NU3pRWG80ZlNRcHdKU3RIVnBwU3dCWnBJdkFxczRi?=
 =?utf-8?B?Yndzd2tKdTZnd1hLangwWlM3Q0JUNUxwdjFYRm5NZ01qT1pYRDJXTy9oNFVG?=
 =?utf-8?B?MHdNSFZHQ0xYdVFiSzFJNXJuOG5TKzVtM2xPWTlYRXYwM0FqRHBTZTNJRkkw?=
 =?utf-8?B?aksveVhOZTdLbDRRd0d5c04wUmlCalJoSks2b1FLTlFyTDNwS1JGVGpWVFY1?=
 =?utf-8?B?ZGx4YjhmKy9mcGJ5UUcxSWEvTE5XZUd1LytBOWkvRG9MeHZCMmVRKzNTN3pO?=
 =?utf-8?B?bUs4KzNIRG5hbWpucDVIRzZ4bVcrbXhubmg4U2JHaVA4bk52NFBpbHg4bmVP?=
 =?utf-8?B?ZlpJZG00WlBqL3BwcXJFdEw4RklDTkQ4d1NIOGthL1loVWRUeFhWU0RpbVo5?=
 =?utf-8?B?YkoveGNBTmMwcWY4cjRuNWNyMlh6ZXhyTWkzOUFUb24zR0xDVFVOSDBCTUJn?=
 =?utf-8?B?YkZ3bnFmM3RTSk5tNFZIVi9XMDhTbXhKSng1eVROQlVFQ3JteWtZQnptK0J3?=
 =?utf-8?B?TmpJSlRZY0JKbGhMdlRwM01zbnhVSEl6YTViZU15MU4wN1RyZDE3Zm13bmdu?=
 =?utf-8?B?b2RCZEpjR1RwRGEvdGV2TURqSFZtN0lTZk05N1hLclh0Wkc1TitIQlVZQVpl?=
 =?utf-8?B?Qk14ajB1akFaek9lTnhmYURyak9Xcmh5bU04TlZwYjNQNDhxK01pM3VLekpx?=
 =?utf-8?B?WllNL2RjOW9YTnRtVGVIMWprSlNLRnk3N0hLWTcrQklmVlpRcS9WQXRiYy9Y?=
 =?utf-8?B?ZUd6ZW1GRk8zckdjSWUvTmZKRWtEeXZKd1JqRE5zUHJ4ejdjTzBVRk9xdjVQ?=
 =?utf-8?B?eXgrdjFpSXRuU1RyZkNkcWNnSUx3cExEYU9NYVVkVERVbnpXcHBuZzE1VUo5?=
 =?utf-8?B?Y3NXWE9OVE5telJFeHorZDlWaGxSZlNZZ2hpSmpBNnhwQmdCUjVyTWgrUDk2?=
 =?utf-8?B?cFF3RStXZjltYWI3QndsMFVzbzdhMTdrN2RMUnJNVFltaHFDQkxISmZZUnR2?=
 =?utf-8?B?NHRPS0NoaXNGUGxBZmJQZTMvb08zdDd0aXdhbXZ5Ky9mVDlqOVVWd0tpUTdo?=
 =?utf-8?B?T0p5emxSR0dxMSsvU0VlN3pSU1h5cGdEUmlDb2xEUjZaTFZDRjBPbkZ4Z3l6?=
 =?utf-8?B?UGhkenhqbzlTbC9kOXhrSW5ENDJTNXB0YmJlaENzUTRMQkwrRjcybGNyVjZq?=
 =?utf-8?B?c2JRNmtQL3g1WXhmTi9lM2hEdHRPZFlXc0o1WDE5bXJIM085bGgzN0k3cm5q?=
 =?utf-8?B?Y2syaDBDU2JUSmZvejVWMTY0cXJzWEdvczVoQ2hqQ3RTM2NvSG01R0FqcXFo?=
 =?utf-8?B?YmtPRGp2aS9QcktqOHZoQTZ2dEJDQTh0MG1OeWNyV1NIWGkza00vZ3g2VGt0?=
 =?utf-8?B?Rk9BY01XRVlPQTZEbHZRQ3JKemh5WjhGQkNlZExNUm56MHRjSmg2azZEOFJX?=
 =?utf-8?B?UkRiZlRsOHd6cjVOcUxucjVNMjM0Z1NJSkcyWCtpVS9mckJuTUE1K0FtWnBx?=
 =?utf-8?B?VytPbzZIOEs1UVZmbGZkY0VTS2l0RGdrM2hMMm1uNEp0SExTN0VwQWZ4MnJV?=
 =?utf-8?B?TFNsWFRSR3RGQlZjYWZVYWlMNSt6NEx6ckpjR1NpaG5XZnlNWHJ2RXZvZ2I4?=
 =?utf-8?B?OXNnaTFTMjRTekJSRTdQK0I3bzVzNkxFTUQvdHRnVzdvcElkMnUxeGJielZz?=
 =?utf-8?B?R0c1c0YwVlJpWVZ4SDNQUFViQ0hFU3NGc0NNZ2x6a3pXVkJCMVJ4Zi9Odkhu?=
 =?utf-8?B?bzU0aFVmWG1Sa25ZaTFHRWloV3gwb2lEdzV1YzN1VERmbkFNOHJodTM5ckE5?=
 =?utf-8?B?anFmdzY5WTJleHJEYUlKVEQ0NkcxT1BOZE1EMXdhb0p4Z05OZUN1TmNzdEVh?=
 =?utf-8?B?UnBxd1plQ3M4N2FYa0xSRlAwUWtqdUNCalV5VmcvRnRrV2p3bE5EZkVPb0Vx?=
 =?utf-8?B?UGNMNzY0TWJkS21zVUpOMno5enNuc0lycEJWN3hWK1VWbm05TTI1ZzA4MmRv?=
 =?utf-8?B?NmwyOHc0VjdLLytRcjltMjJGTUd5NlpGZGc1WkhtMVhLcW01Yndob0tML2xp?=
 =?utf-8?B?dHdXNEw2V2pLWks4TnJGS3N5UU5RbDZXVTR2TUp3Y1VER2ljMUw4di9ERmQ1?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a10a16-be92-4ca2-f6d8-08dd61c1847d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 23:56:33.7401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2BY86rJPtDfRKH80mqGgvcN6rlgYcHHVsvMqWl2O1A7wiJ/DbgrW91Bhla6CM65titrLCDntxpaET0C6Qk2t4qa/QkMTVKblrTWFsWbDC4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7186
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



On 3/7/2025 11:36 AM, David Laight wrote:
> On Fri, 7 Mar 2025 12:42:41 +0100
> Jiri Slaby <jirislaby@kernel.org> wrote:
> 
>> On 07. 03. 25, 12:38, Ingo Molnar wrote:
>>>
>>> * Jiri Slaby <jirislaby@kernel.org> wrote:
>>>   
>>>> On 06. 03. 25, 17:25, Kuan-Wei Chiu wrote:  
>>>>> Change return type to bool for better clarity. Update the kernel doc
>>>>> comment accordingly, including fixing "@value" to "@val" and adjusting
>>>>> examples. Also mark the function with __attribute_const__ to allow
>>>>> potential compiler optimizations.
>>>>>
>>>>> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
>>>>> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
>>>>> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
>>>>> ---
>>>>>    include/linux/bitops.h | 10 +++++-----
>>>>>    1 file changed, 5 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
>>>>> index c1cb53cf2f0f..44e5765b8bec 100644
>>>>> --- a/include/linux/bitops.h
>>>>> +++ b/include/linux/bitops.h
>>>>> @@ -231,26 +231,26 @@ static inline int get_count_order_long(unsigned long l)
>>>>>    /**
>>>>>     * parity8 - get the parity of an u8 value
>>>>> - * @value: the value to be examined
>>>>> + * @val: the value to be examined
>>>>>     *
>>>>>     * Determine the parity of the u8 argument.
>>>>>     *
>>>>>     * Returns:
>>>>> - * 0 for even parity, 1 for odd parity
>>>>> + * false for even parity, true for odd parity  
>>>>
>>>> This occurs somehow inverted to me. When something is in parity means that
>>>> it has equal number of 1s and 0s. I.e. return true for even distribution.
>>>> Dunno what others think? Or perhaps this should be dubbed odd_parity() when
>>>> bool is returned? Then you'd return true for odd.  
>>>
>>> OTOH:
>>>
>>>   - '0' is an even number and is returned for even parity,
>>>   - '1' is an odd  number and is returned for odd  parity.  
>>
>> Yes, that used to make sense for me. For bool/true/false, it no longer 
>> does. But as I wrote, it might be only me...
> 
> No me as well, I've made the same comment before.
> When reading code I don't want to have to look up a function definition.
> There is even scope for having parity_odd() and parity_even().
> And, with the version that shifts a constant right you want to invert
> the constant!
> 
> 	David

This is really a question of whether you expect odd or even parity as
the "true" value. I think that would depend on context, and we may not
reach a good consensus.

I do agree that my brain would jump to "true is even, false is odd".
However, I also agree returning the value as 0 for even and 1 for odd
kind of made sense before, and updating this to be a bool and then
requiring to switch all the callers is a bit obnoxious...
