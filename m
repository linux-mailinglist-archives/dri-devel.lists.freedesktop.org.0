Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DD09DA23D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 07:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFEE10E425;
	Wed, 27 Nov 2024 06:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jKvvR5QW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DF910E428
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 06:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732688426; x=1764224426;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7JwfQWm6feTpElm/HivTpZiTq1udsVKVSUyk3RJ73LY=;
 b=jKvvR5QWKjB/7T5gWMQL+7F7vUKeMgNohlYiedoL146xhHt15fuMgMsV
 NlvY2ZFaJ0Z3hfknSITvQNbqQHiEVs/W8p4Q7+Q5GDwRz2JYGKFzldMhe
 SeBLOCkJ/K7ahr6jAWHo7pMlIIolDUvQU+JuYgNZYp7zpvsjiz4e9iOWT
 ztqc3h9oHmonHZY0MaM3hYk+bLz3HnstsvESkjWOKsh/Sikj1D8yH6IFa
 jG4GXslryWLd9MR+afXoTwuG9ItMGmA2o+4uY4dBaZLMX99fmFcaWoJic
 vAnYj4NdurP9KKjoZXefhmvhbwJHomZnngxfeFtxCOeBQ7SO8FLe+pOTr g==;
X-CSE-ConnectionGUID: XarGSUEJTHyCg2tvtNBMCQ==
X-CSE-MsgGUID: aiKNXj5+S32xwuAwjLt9/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="50281061"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="50281061"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 22:20:26 -0800
X-CSE-ConnectionGUID: NpB+GgiWRR6dKDM/7lHjxQ==
X-CSE-MsgGUID: JrDG4kqARNGNhLzvSD/r4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="122678878"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2024 22:20:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 26 Nov 2024 22:20:25 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 26 Nov 2024 22:20:25 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 22:20:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+zsMK25oPwSdup8SQTYduEK1IpGK8lL5qZkrQ1vUZLw5QKMhqcOTARbU/JhoJgjM4dN8lqqaEosV8el1ikX3WLV8Q1E9WdS+94T8HDvG1bRQLFXvK4S8AHehkku1fVQ5XgxDhVoe9/SiPvUqCyjknhukkC0QBXSRGTj8VvCoVq8lmuqqc3NvqlQxeU3Y3ICA5TpsiEPOPXsQzsBexiZ+gwCjv/Ap/w4KCTZi8E4EeAR7nZaRaAkETvvPHEbNeTknZ0474b7ZZVUqKuWyHgpx5QfALU3Vd1x2ogDurhecunfZ0s61oVaZrVPLfMx8vP33KmkCv+2e/e1DUkEh/RaOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JwfQWm6feTpElm/HivTpZiTq1udsVKVSUyk3RJ73LY=;
 b=JE0W31xYS6FHkZ5jrbg7xURD1BuObNAVxqfn1KJeOI9RjYZDU7xMCQgffIkQ943zZBP5c6AHBIcQssKVBF9xu8ArPoQo6V0hnsgwS9dMxLaH3WNN/wyGZLSJ1aEWwFKtBC6DknbXcDecPjYK0COyf6FAiyHITMT4EB5a11C3ts8MnlS6SPcx6szwlUazMq/5AHWiLAFzWrWB+7k0BZM51nY6+j1UuSIjlJyWgqn1RlBGSAtj9drJv6BVO1z7MvkMPM68RR5zIxx1/k7HXt9pu3nlRZDfJ/OLlo15m7wuF7bTYlMn6nGSk8PJOhRKfHUFJfCUdpMlg4z7qE1G6fMazA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH7PR11MB6548.namprd11.prod.outlook.com (2603:10b6:510:210::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Wed, 27 Nov
 2024 06:20:16 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.8182.019; Wed, 27 Nov 2024
 06:20:16 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
Subject: RE: [PATCH v4 2/5] drm/virtio: Add a helper to map and note the dma
 addrs and lengths
Thread-Topic: [PATCH v4 2/5] drm/virtio: Add a helper to map and note the dma
 addrs and lengths
Thread-Index: AQHbPw9/P9uH01LpvkqBXy8zZg5fNLLH39gAgADRzNCAAJ5jgIABG0cA
Date: Wed, 27 Nov 2024 06:20:16 +0000
Message-ID: <IA0PR11MB718536D3A822E95550426917F8282@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20241125073313.3361612-1-vivek.kasireddy@intel.com>
 <20241125073313.3361612-3-vivek.kasireddy@intel.com>
 <a10f9b16-9cbf-4e51-a4ce-a408f792cafc@collabora.com>
 <IA0PR11MB7185AD723F92BAECA4D56E2CF82F2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <250c5b23-86b7-418d-a2df-fd7f1aff63de@collabora.com>
In-Reply-To: <250c5b23-86b7-418d-a2df-fd7f1aff63de@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH7PR11MB6548:EE_
x-ms-office365-filtering-correlation-id: 2e487f51-6caa-4ce9-bf95-08dd0eab8f8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?R2xnbTgvM0U3L1M3V3FpNjZxVkVzOERZMnk2cHd2NWkrOFV6a0hqanhua2x0?=
 =?utf-8?B?cnB6aDIwbUJBR3c5d0sxa0o2VnB0L2ZVZmhJNjlrZWhFUWdlMXVqTFNWTXVz?=
 =?utf-8?B?QmkwYUIwNFhnTEdhOVZiOStiSUJCU2pSN0xxNnRCQU8xVjUwN0ZHWmcycjRo?=
 =?utf-8?B?WENTNHBHTVpjekJDV1M4UENFNVJlVm92YmgvVWVobzlqUmNRQmorZDhTUUUx?=
 =?utf-8?B?Y0syd0JTV0Q2WDFuTXdSMHFpSStKWW1wNFA3SUdxWGdPTkYzampiUFAxUWUr?=
 =?utf-8?B?a003SFN6OVNGdGluRy9Qdm9wK3l5MnNiUERWVnJjSWNDNlVWMjZyTWt1ZWNZ?=
 =?utf-8?B?RGk4YWhudnNvb1BUV01mWEFxM0ZoY2JkT0hhb3dGL1d0ekR3THE5WVdpTk5G?=
 =?utf-8?B?b3NXMWJUUGtCS3FiNWdqNENJbE1HUnJmZmV5ZVZBd3ZYTWo3aDNoYmlYNmYx?=
 =?utf-8?B?SDVmM096UDNjWG1TbDdFL3JZSU5pM3YwLzJQY291aHk2eDFzeTFCS2lRZCtG?=
 =?utf-8?B?UU45ZFdLSVo2OWVvZjYrZE1zdmxiOFZzRlFNbUl1bFFDZGhlRGF1RDFrM2M1?=
 =?utf-8?B?NlZETE91ai9mT3JUdXVFZWJMeHQ1aWlUV3lhQXZ5c1pZcG43d3pvMHZUQnFL?=
 =?utf-8?B?ZzNkL3BwRXErdVpoTGJ2Nkd0WUNURm5NMlF5UkR3eTZzNmZJYlZaK0FuNG1Q?=
 =?utf-8?B?T1ZDT2NDMVZPelEzN2Y2NFBwZHVxUW15M244dTFyeEZJL0xVV2ZldW1OSFJR?=
 =?utf-8?B?L1U0QkloS2R1TWlRWXovV0x6bVB1VHVpelhzLzdwNG5oTzRYdWQ5RHFaZEpm?=
 =?utf-8?B?cXBXTWNnM20xa3FJdHBCSTJXYlMrQlVlRUZNUGVXLzl4dW0rRGlQVFBFWmZk?=
 =?utf-8?B?Um9tOXlXUE5XalRRejRlQm96QlJqdTNlT1cvd1NycFhFT05nbVIrcXNOdXhI?=
 =?utf-8?B?Rk5FRG5GQTBJNURKZ2diVEV4VDBTYThGbS9mZWVLZEdGbDBEdU1tbXdQQWRa?=
 =?utf-8?B?Yit4THduM1Fja2pnL21haGt3M2dnc1dqSCtYOFZRTkpqMHNMNlZVODdOK0tx?=
 =?utf-8?B?OUh6ZVpRZWVUcFpIRDdCT1FnRThzVkdvdzF4enRtczFHbGw2Zm1MSVpZb3R5?=
 =?utf-8?B?Uk1hVWhPZWowMnJaRVRSK1BuUGFZcndjZ3V2R3oxdkIrVlE0VWVJRnpuK2Fq?=
 =?utf-8?B?YUdIa0NFRDRMMko3MHlHVVIzbSsrNEJVYkV0bFBHM0ZFQWhlbUU4QjU1cDVR?=
 =?utf-8?B?UCsxTmlRUkZncGFGRWliY2lMUnM1OWlVaTBrRml3cUsvQjd1aDdCczJ3NFlF?=
 =?utf-8?B?a3JnOG1UOVlzUWNRRm00S0g1bFU5MTJ2SGVSZlU5SmJoTVBmZTZ1bkluUFlt?=
 =?utf-8?B?K29mU0tVTU9QQkNzaTFjNGZ1OFV3ZEk3YlZ0TUFXRlIyOVoxclR6UlNBZ0Zs?=
 =?utf-8?B?ZDB4WnUvT2FyYlFxWUhiUkxrSUZLVzB3bVlWMTQ2Z0p4b2U0QnJ4Z0daMTQ4?=
 =?utf-8?B?L2MrYlZ6VHFaWlI5TTJaek5OOTBhYVVCYkZXRDB3YXV5N29jeHBTbFFJVlk3?=
 =?utf-8?B?Z3p1cGo1cXJHQUd0d2ZQYnRBSGNIM0N3ODZ6T3lmaTBQWTFBdlNJanVCdUpN?=
 =?utf-8?B?OUlSaVYxRXVTSEh3Q3ZadGZKRXVKN2dtRU1NTmhabWxyNWxrMVRNcVlXUURG?=
 =?utf-8?B?SmtZeU12VlFHekx3Q2YxbHovZmhCbTk2M1BrZ3lFc3dRT2ZhMUY1YUk2VVVV?=
 =?utf-8?B?cGI5eHBZTnpuV1FCYnZJcTVCMzZMNDhkYkRHbXlTK01HZGNEVU9GOFhpSEE5?=
 =?utf-8?B?YitDQS9JSWNRR1ZiNDRzUFk3NUlHaXlUR245eVNHeGxXVm1yMTFJUHdRc2cz?=
 =?utf-8?B?QXhvYmY4ZHJNbldIMWJYVDhMdG9pMStzTnFyTFVVdVM5L1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWdiRnhiWGFQZnRnVXh4eVk2R0w0a092T0JiQWVjM09kK1QvZU8vakprdURC?=
 =?utf-8?B?UFJuQmlLa1kvQ1J5UEtleTdIeHpXQ0RmTXpTVHVqYThMWFRNRTlDSzB4cjAz?=
 =?utf-8?B?bm5CRlRrSmhuTEcyS3RNUUFLcVpHN0RjMDVKWEk1aVJFZ2IwSTVLcHZzL3l4?=
 =?utf-8?B?RHV1a1BXbnJnM1J1ejdLOUM4Y21RUlpZVkEyUE4yaTB2Um5OU2JIWDhrNGlG?=
 =?utf-8?B?bTlEV2I1cmJOSUVhSFgvTDkzSEVUZUtZc2s0b3pHUTQyblphYWRUS1NOcWF1?=
 =?utf-8?B?OXgxL25iNE9NR0VPOCtmSytKa2xCbW5iZlV5dHFQMmVycHNqRVZCZXBtRzBE?=
 =?utf-8?B?M0k5MHhKYlA1ak1tVzJuTUhnWnMrdTdFL1VTMisvQ0cyZ3lMQ295bDNxQWxz?=
 =?utf-8?B?NiszazZEMFk4MEdIenErWmRCRzhmancyKzVnaXV4Y2N1NVYzSEZLeVh5SmxV?=
 =?utf-8?B?UExjVk5LWDVBOW5ESWVSK3owNEdaZUYrZkRCMXh3SkdqN0lwbU9yTys0Z2NE?=
 =?utf-8?B?d0pBdlA1bDlnK1ZBNmlVNXRwaGcxcWZtR251ZXBMbWhhaUtoajltWmZzODFz?=
 =?utf-8?B?Q2pvb3J2Y2g3dENhL3N3cXNZK1FWTXltQXM3bTdjWmxXb3pVV3hBSGptM0F5?=
 =?utf-8?B?N2wxZ0lrS1h6T2pRUjhQeVNkV1NhWFFZZHJIcVdiTkV4Ym1ybkViS2FFS0FG?=
 =?utf-8?B?OGRsTW44WjUzSmdNWXc0dVhEbkdNVW9ZM0x3bWdsVXhlSE9wS091aXQzYmNp?=
 =?utf-8?B?bzdsM21odTVBRVZ0NWdZRldnVHhFWnRNRWl4VnY4bS9tNDcxWDQ0N1hxaXQy?=
 =?utf-8?B?THBXTEZvKzB3eTMyVkNPSnlTWjNVZklBcGFIYUYvQ2FqVjJ3RThsQUtqSmtO?=
 =?utf-8?B?YXc0S1RIRkJDZkEwNmRjWHZ6UHBTR0F6Q08zUWJOak5uZFFqRFZsMFI1R1gz?=
 =?utf-8?B?VVFuVWFIeGtJUmNXOU4rZnIxTUZaVFFIWVZoeDk3bCs2ZUNBOVpGKytTS29h?=
 =?utf-8?B?VzdIWmo2YmhocDVETTZDSVVBcFM2dU82V3ZlS3JxR0pVL2ZDeGhwNmx4Yk1t?=
 =?utf-8?B?WTY5YmFWSW5pSThvU2lIMHNmc3F6cFVBMm1SemQwTUdPM3NTWXJGUTRJNlQx?=
 =?utf-8?B?cytRQ1c4Mnh0Y3U3d2hDM1BBeEptMUJ6Y2thUXJRUEZoSTBlWHpmQ2d6ek1N?=
 =?utf-8?B?ancwandvdDlUeWI3Qm1zdWZKd1V0dnkrOFE5OFh1akVhRndVbjhDV3ZIcThx?=
 =?utf-8?B?b0RDdktuMEVqNHFQT0hLTGJ1dmp0dUsvOTlBcXQyOUZDRUNhRkt4aWhmdzZs?=
 =?utf-8?B?T280MS9jVWwyWVA0MnJxc0xoRHNqOExCWDBrQ25KcEpGdEorS3BPL0diS1RN?=
 =?utf-8?B?RWs2Mkk2VUtqbFpiQTBOTFM5VkhidDZvUDA4V1NxVkZDbjVGUjJWdDU4SkZI?=
 =?utf-8?B?YWZyRkV4RGpxUzhoQUxnMkNZT05iNmU0b1JtQWN6VWV2WGphZjAwNGI4QVo0?=
 =?utf-8?B?ekxIWWZDQVc5MUg0bDdwNk9sSEw4ZGFFSkF1RmhnMnpBU25vUTMyUjlCckp4?=
 =?utf-8?B?Vm52YXNzTmxWcVNOak1MVjcwSkJlTUl3QU4rRTQyeEdvVHkxWjJQd2tIcXFC?=
 =?utf-8?B?b203ZGNpNDFxQVg2Ykc3a1o2dGZZcWFJYy9nMjV2TnFxb3FPeWNZVG9yR2dv?=
 =?utf-8?B?MGVZNEVSTkxaQncwT0tEd21oR0ZKdHZINVY1MUVnNnM0VGJOVzkxSjY5RnJa?=
 =?utf-8?B?ZUNnbVNEZW85RXA2WTlMcGZ2NXhPM2luWjRoREdVcGRxS1ZweERudHhScmdD?=
 =?utf-8?B?cUpvWk42bFpLZ2lDUGppQmhOejc1SE81S2dteWZkRTd6amxSQi9xMjJ5NHRM?=
 =?utf-8?B?RUphSTRWSHZPVUd3TFBJME9aYS9BVlRhNGxpWHR2RzJLbnM1UXBUNEdXM3hr?=
 =?utf-8?B?V2FYYkFpbFFYamR3TFhFcWFWNTliUUs4NUwwbFl4azZPT0VCZkViQldpcVdv?=
 =?utf-8?B?UzJSbjZsYXlVYXk0RkpLVmdUblFFS2dTajc0bmVVQUk5NUNSbVFSbmZ6dFVN?=
 =?utf-8?B?OWxVSkRyQkhLaTZRdTBtaVZtdk9TZEgxbnVZallwMGdUd0h4RVd1eUd4eGty?=
 =?utf-8?Q?USHPoxoUKJt5ktYZAHwCpR2Ue?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e487f51-6caa-4ce9-bf95-08dd0eab8f8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2024 06:20:16.6799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VfSwTVXRUS6ygo4DiJEaFvF0lkLND4B2CgxJi9zZOhPnSWnFelnlrGfnkzzcI6AYDrp4MotzJTd8uXrurAkohunTingAVUI/Lj5iSNY7SZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6548
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

SGkgRG1pdHJ5LA0KDQo+ID4+IFdvbmRlcmluZyBpZiBpdCBjb3VsZCBiZSBhIHByb2JsZW0gd2l0
aCBteSBndWVzdCBrZXJuZWwgY29uZmlnLiBJDQo+ID4+IGF0dGFjaGVkIG15IGNvbmZpZyB0byB0
aGUgZW1haWwsIHBsZWFzZSB0cnkgdG8gYm9vdCBndWVzdCB3aXRoIG15IGNvbmZpZw0KPiA+PiBp
ZiB5b3UnbGwgaGF2ZSB0aW1lLg0KPiA+IFN1cmUsIGxldCBtZSB0cnkgdG8gdGVzdCB3aXRoIHlv
dXIgY29uZmlnLiBDb3VsZCB5b3UgYWxzbyBwbGVhc2Ugc2hhcmUgeW91cg0KPiA+IFFlbXUgbGF1
bmNoIHBhcmFtZXRlcnM/DQo+IA0KPiBSZWNhcCBvZiB0aGUgREcyIHByb2JsZW06DQo+IA0KPiBU
aGUgdmlydGlvLWdwdSBQQ0llIGFjY2Vzc2VzIGluIGd1ZXN0IGFyZSBiZWNvbWluZyByZWplY3Rl
ZCBhcyBzb29uIGFzIEludGVsDQo+IGRyaXZlciAoZWl0aGVyIGk5MTUgb3IgWGUpIGlzIHByb2Jl
ZC4gTXkgdGhlb3J5IGlzIHRoYXQgSW50ZWwgZHJpdmVyIGNhdXNlcyBQQ0llDQo+IGNvbmZpZyBj
aGFuZ2UgdGhhdCBpbmRpcmVjdGx5IGJyZWFrcyB2aXJ0aW8tZ3B1IFBDSWUuIFRoaXMgcHJvYmxl
bSBpc24ndA0KPiBvYnNlcnZlZCBieSBzd2FwcGluZyBERzIgY2FyZCB3aXRoIEFNRCBjYXJkLiBB
TUQgc2V0dXAgd29ya3MgcGVyZmVjdGx5DQo+IGZpbmUgb24gdGhlIHNhbWUgbWFjaGluZSB3aXRo
IEdQVSBjYXJkIHBsdWdnZWQgaW50byB0aGUgc2FtZSBQQ0llIHNsb3QgYXMNCj4gREcyIHdhcyBv
biBob3N0Lg0KPiANCj4gJCBsc3BjaSB8IGdyZXAgREcyDQo+IDBjOjAwLjAgVkdBIGNvbXBhdGli
bGUgY29udHJvbGxlcjogSW50ZWwgQ29ycG9yYXRpb24gREcyIFtBcmMgQTc1MF0gKHJldiAwOCkN
Cj4gMGQ6MDAuMCBBdWRpbyBkZXZpY2U6IEludGVsIENvcnBvcmF0aW9uIERHMiBBdWRpbyBDb250
cm9sbGVyDQpMb29rcyBsaWtlIHRoZSBHUFUgYW5kIHRoZSBhdWRpbyBkZXZpY2VzIGFyZSBvbiBk
aWZmZXJlbnQgYnVzZXMgKEkgc2VlIHRoZSBzYW1lDQppbiBteSBzZXR1cCBhcyB3ZWxsKSBidXQg
eW91IGFyZSBtYWtpbmcgdGhlbSBhcHBlYXIgYXMgZGlmZmVyZW50IGZ1bmN0aW9ucyBvZg0KdGhl
IHNhbWUgZGV2aWNlIGluIEd1ZXN0IFZNOg0KMDE6MDAuMCBWR0EgY29tcGF0aWJsZSBjb250cm9s
bGVyIFswMzAwXTogSW50ZWwgQ29ycG9yYXRpb24gREcyIFtJbnRlbCBHcmFwaGljc10gWzgwODY6
NTZiZF0gKHJldiAwNSkgKHByb2ctaWYgMDAgW1ZHQSBjb250cm9sbGVyXSkNCiAgICAgICAgU3Vi
c3lzdGVtOiBJbnRlbCBDb3Jwb3JhdGlvbiBEZXZpY2UgWzgwODY6MTIxMV0NCiAgICAgICAgUGh5
c2ljYWwgU2xvdDogMA0KICAgICAgICBLZXJuZWwgZHJpdmVyIGluIHVzZTogaTkxNQ0KICAgICAg
ICBLZXJuZWwgbW9kdWxlczogaTkxNSwgeGUNCjAxOjAwLjEgQXVkaW8gZGV2aWNlIFswNDAzXTog
SW50ZWwgQ29ycG9yYXRpb24gREcyIEF1ZGlvIENvbnRyb2xsZXIgWzgwODY6NGY5Ml0NCiAgICAg
ICAgU3Vic3lzdGVtOiBJbnRlbCBDb3Jwb3JhdGlvbiBEZXZpY2UgWzgwODY6MTIxMV0NCiAgICAg
ICAgUGh5c2ljYWwgU2xvdDogMA0KDQpJIGFtIG5vdCBzdXJlIGlmIHRoaXMgYSB2YWxpZCBjb25m
aWcgb3Igbm90LiBSZWdhcmRsZXNzLCB0aGUgcHJlc2VuY2Ugb2YgaTkxNSBwcmV2ZW50aW5nDQp2
aXJ0aW8tZ3B1IGZyb20gcHJvYmluZyBjb3JyZWN0bHkgaW4gdGhpcyBzaXR1YXRpb24gaXMgaW5k
ZWVkIGEgcHJvYmxlbSB0aGF0IEkgYW0gYWJsZQ0KdG8gc2VlIGluIG15IHNldHVwIGFzIHdlbGwg
KHdpdGggeW91ciBRZW11IHBhcmFtZXRlcnMsIGVzcGVjaWFsbHkgdGhlIHBjaWUtcG9ydCBvbmVz
KS4NCkknbGwgZGVmaW5pdGVseSB0YWtlIGEgbG9vayBhdCB0aGlzIGlzc3VlIG5leHQgd2Vlay4g
DQoNCj4gDQo+IHFlbXUtc3lzdGVtLXg4Nl82NCBcDQo+IC1rZXJuZWwgbGludXgtZ3Vlc3QvYXJj
aC94ODZfNjQvYm9vdC9iekltYWdlIFwNCj4gLWFwcGVuZCAiY29uc29sZT10dHlTMCBub2thc2xy
IHJvb3Q9L2Rldi9zZGEgaW5pdD0vbGliL3N5c3RlbWQvc3lzdGVtZA0KPiB2dC5nbG9iYWxfY3Vy
c29yX2RlZmF1bHQ9MCBsb2dfYnVmX2xlbj0xNk0iIFwNCj4gLW5ldGRldiB1c2VyLGlkPXUxLGhv
c3Rmd2Q9dGNwOjoxMDAyMi06MjIgXA0KPiAtZGV2aWNlIHZpcnRpby1uZXQtcGNpLG5ldGRldj11
MSBcDQo+IC1zZXJpYWwgbW9uOnN0ZGlvIC1tIDI0RyBcDQo+IC0tZW5hYmxlLWt2bSBcDQo+IC1j
cHUgaG9zdCxob3N0LXBoeXMtYml0cz1vbixob3N0LXBoeXMtYml0cy1saW1pdD0zOSBcDQo+IC1k
ZXZpY2UgdmlydGlvLXZnYSxtYXhfb3V0cHV0cz0xLHhyZXM9MTkyMCx5cmVzPTEwODAsYmxvYj10
cnVlIFwNCj4gLWRldmljZSB2aXJ0aW8tdGFibGV0LXBjaSBcDQo+IC1kZXZpY2UgdmlydGlvLWJh
bGxvb24gXA0KPiAtZGV2aWNlIHZpcnRpby1rZXlib2FyZC1wY2kgXA0KPiAtZGlzcGxheSBndGss
Z2w9b24gXA0KPiAtc21wIDE2IFwNCj4gLW1hY2hpbmUgcTM1LGFjY2VsPWt2bSxrZXJuZWwtaXJx
Y2hpcD1zcGxpdCxtZW1vcnktYmFja2VuZD1tZW0xIFwNCj4gLW9iamVjdCBtZW1vcnktYmFja2Vu
ZC1tZW1mZCxpZD1tZW0xLHNpemU9MjRHIFwNCj4gLWQgZ3Vlc3RfZXJyb3JzIFwNCj4gLWRyaXZl
IGZpbGU9ZGlzay5pbWcsZm9ybWF0PXJhdyBcDQo+IC1kZXZpY2UgcGNpZS1yb290LQ0KPiBwb3J0
LGlkPXBjaWUuMSxidXM9cGNpZS4wLGFkZHI9MWMuMCxzbG90PTEsY2hhc3Npcz0xLG11bHRpZnVu
Y3Rpb249b24gXA0KPiAtZGV2aWNlIHZmaW8tcGNpLGhvc3Q9MGM6MDAuMCxidXM9cGNpZS4xLGFk
ZHI9MDAuMCx4LQ0KPiB2Z2E9b24sbXVsdGlmdW5jdGlvbj1vbiBcDQo+IC1kZXZpY2UgdmZpby1w
Y2ksaG9zdD0wZDowMC4wLGJ1cz1wY2llLjEsYWRkcj0wMC4xDQpQYXNzdGhyb3VnaCduZyB0aGUg
ZGV2aWNlcyBkaXJlY3RseSBpbnN0ZWFkIG9mIGNyZWF0aW5nIGEgbmV3IHBjaWUgcm9vdCBwb3J0
DQplbmFibGVzIHZpcnRpby1ncHUgdG8gd29yayBjb3JyZWN0bHkgaW4gbXkgc2V0dXAuIFRoYXQg
aXMsIGhhdmluZyBqdXN0DQotZGV2aWNlIHZmaW8tcGNpLGhvc3Q9MGM6MDAuMCx4LXZnYT1vbiAt
ZGV2aWNlIHZmaW8tcGNpLGhvc3Q9MGQ6MDAuMA0KDQppbnN0ZWFkIG9mIHRoZSBsYXN0IGZldyBs
aW5lcyBpbiB5b3VyIFFlbXUgcGFyYW1ldGVycyBsaXN0IG1ha2VzIHZpcnRpby1ncHUNCnRvIHdv
cmsgYXMgZXhwZWN0ZWQuIENvdWxkIHlvdSBwbGVhc2UgdHJ5IGl0IG91dCBhbmQgbGV0IG1lIGtu
b3cgaWYgaXQgd29ya3M/DQoNClRoYW5rcywNClZpdmVrDQoNCj4gDQo+IEd1ZXN0IGtlcm5lbCBi
b290IGxvZyBpcyBhdHRhY2hlZCB0byB0aGlzIGVtYWlsLg0KPiANCj4gLS0NCj4gQmVzdCByZWdh
cmRzLA0KPiBEbWl0cnkNCg==
