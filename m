Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82669B1839B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 16:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865F810E882;
	Fri,  1 Aug 2025 14:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dLM1hBqG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9B110E114;
 Fri,  1 Aug 2025 14:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754058162; x=1785594162;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=C4YA7E6qebMACoL1oJSY/Ze7Lm4KezFiP0CyFF7v268=;
 b=dLM1hBqGvUts+LLbucfmVCM7wBZG/ouue2OssZR61ypLuPL64UIiLcg7
 uQP6AgPwhulfoVHHBllbG6taNPXXLonNjNQUiTLOfEXw+C4zIQq1Wh/8Y
 0ZA7QKsvwD5iRXVRy6X5m/GCiJ/JSHagjQv0GiiYtqav7B1msziWHJ4wb
 8KWGlOab5FzQDvy5Ik2owL4UBOmlWtCpIbDFgcLDCnjMzAtV+0WVjemG6
 4ncaE3ZwGU/MASSoJhfFTqHCwYQ1zK1pgyrYVL0IK3So4Ja+wMGwlqJ4S
 Naz7Njh44AijpeGjUJbNbCQLCPJlG3fTQ/YX72lhEGEc73VhlmGzYPwmO w==;
X-CSE-ConnectionGUID: xdoISQl+QTCjmFKXRmnvHw==
X-CSE-MsgGUID: FW9g6AjtTCKTQEwaQ5Imyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56485115"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56485115"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 07:22:42 -0700
X-CSE-ConnectionGUID: wZYK9dcXQf2OGX7iwGD4bg==
X-CSE-MsgGUID: mh/24oRNTpqkZAhvyavxYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="200733463"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 07:22:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 07:22:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 07:22:40 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.49)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 07:22:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FhYYtHvxBrXA9iftR0OnAkxE9PPoKDhjhHdcFZNTce7UWfSzXNlnTLrT+B961Wd6iIoLvy25shWEfKbRbNk0nJji1ogy/FlTorn1sL4L9o21uckCsMEGvQe0rZSHk7e+9c/I+SzR3VmZ4nCVf/ve0qlIA0hrE+Wnbv6xBgQgrXxv60yTWiYI3Jf23ImW7ZXezCZQJ+LDra8LP7PVOKKajdlO5WJTLu8kxlbSPN8kB9ZcHTGgcRutS7wVxjfpIkj8nncN5/5rTBcasxrUMWhVyBBjeZ3Fd7y3DwaBUm6cD36b71e1/hjaQfdgQigOSJZTsB3dyHInhoyyiuQ+z2Atww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4YA7E6qebMACoL1oJSY/Ze7Lm4KezFiP0CyFF7v268=;
 b=lzsRtDTsdpLcqPe9EKgkmAoIHNcc3iCHod1DIW53r6PtTT651vco/YI+1JXjPLv2pjRgR6Q65ThamlvIMonTWFzLJjnX9qVb5W6NCmVGnf6Lp0qwiHpqfYI9IvHXCUJWs4qiXde+SdIaDkpFuuR4tvKNQnLrE1UL9A3EiYbHVDVvHqBxeDtVFJ54ANfX47xg7lJRS3rpxQy0+u7X64GrJpUD7UKt+3QN16GQ1ZZ/8jm0HfpmZXxi+0zrz77Wk7ELbkx8ZY/MhQhroHpomv6eutAaHi8mKoe6UbfnGBlpEZYPSBFaGyVI8he7uRQ7qC1yOTMVH0n7c++NAoaaGcjc6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SA1PR11MB6966.namprd11.prod.outlook.com
 (2603:10b6:806:2bc::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Fri, 1 Aug
 2025 14:22:24 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f%7]) with mapi id 15.20.8989.013; Fri, 1 Aug 2025
 14:22:24 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Harry Wentland <harry.wentland@amd.com>, "Leo
 Li" <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, "Abhinav
 Kumar" <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Tomi Valkeinen
 <tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJhIENhbmFs?=
 <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance
 <kernel-list@raspberrypi.com>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 7/8] drm: writeback: drop excess connector initialization
 functions
Thread-Topic: [PATCH 7/8] drm: writeback: drop excess connector initialization
 functions
Thread-Index: AQHcAutr9HenA3S/zE2ohrLEHk85MbRN1b+AgAADlIA=
Date: Fri, 1 Aug 2025 14:22:24 +0000
Message-ID: <DM3PPF208195D8D03E1F9D3E7EB4D07C1D6E326A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
 <20250801-wb-drop-encoder-v1-7-824646042f7d@oss.qualcomm.com>
 <b92e89d2-5bd8-4228-872e-6e5ae9b4b054@bootlin.com>
In-Reply-To: <b92e89d2-5bd8-4228-872e-6e5ae9b4b054@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SA1PR11MB6966:EE_
x-ms-office365-filtering-correlation-id: 2643b512-5f76-4daa-5581-08ddd106d5c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?bjcyN2VMOEE5b3lNNkJQU29SSTFpWjBrbFB3SkNiVHQ2dzljaE1vNHZlRDVT?=
 =?utf-8?B?ZkpjSkJST09UeHhZNVpwNmZ5bE56azJtVUZRYWdmcW1mSTZPVUJ0SHZ6b3lP?=
 =?utf-8?B?dk5Mb3pQZm9NMDVmNFlMU3BNb2ttczlLSXhRWHdibytQaFIzY2FTNWl6NlJW?=
 =?utf-8?B?YWJyNTlRdWl1ODlvdGRqNXBBQzlzNUw2Z0c1enZFeDlwZDhUOFEzaGxCaDZD?=
 =?utf-8?B?dndZeXRNdzdUenVqbWoxd0R1RUphWlY0TWZhZFZrcnpvQ0c5NFlVZFY4Y1pu?=
 =?utf-8?B?SlJ6MklRZFI4V2pEVjdscjBpK05aNkF2Z2NYdExhdFMyMzU3b3VYQ2o0Yi9n?=
 =?utf-8?B?c1ZwYVJYYjJGV0loVnorcTljUVZVVWVYdGUzNEcxQk1PbGY4UTMrZE9sU3FV?=
 =?utf-8?B?d0lRV3ZxWHlBdXVBR01kWmZ1M1JQSVZlVkw3SjM5djg3U1U1MDdpQTU1a2pr?=
 =?utf-8?B?RWVDdUpWSmVjUU9PUEwvRU9meGM0VGRFNDVMTzI4ckErRnFhVmxDekVFWlkx?=
 =?utf-8?B?d1dybnZjMmV1WWRpbkdORmlKT28zcDVhREJTaEtZVVQ4NG15dU4rRnk4eUht?=
 =?utf-8?B?UWlBMldGSTJEQnBobDBMY29jMXlXVGZnM0szdVpIbHlLaFNGQmhvZktNOWtv?=
 =?utf-8?B?RnNGSmo2dndvY0dtcnpDVGVPZms3OWNnR3JmTjNNNWVuZHhnaEZ2N0pOcEQr?=
 =?utf-8?B?SlcyOTVEcURHT1p2YStFd090dDJ5RVJkalFVbUlRNERLUVJ3Yk0yekp0RkZK?=
 =?utf-8?B?WHB0N1JwZ3J3UTRNU2JnUDZzREk2RlBCblExb2l3TGxJTjVRRUN3SjVkMFd3?=
 =?utf-8?B?VlJLZ3JSRCtsWThqUFdSK2hrZFJUSmVnQjFUK0xhV1RzeUpQcWtlbjlyOXcy?=
 =?utf-8?B?SVBXYTBVMEVBN1FSdklPY0dzR0YvOHJENDBWMFpjbUlqdVJxRmRDZmZNb0F1?=
 =?utf-8?B?M0hIYVFwZEdKaXVWYVhBT1N2c1ZoNEJnNEVLUnVGNlE3YVFWOHBTdURkRkVR?=
 =?utf-8?B?ZnlyN0VWQ3NERnNrbWNicGtWSU9IcEQyK0NISm9IclRuV25XbFNSNmgwdWk5?=
 =?utf-8?B?ZTdKbXdicDRnRXlaeE1RTHhmcWRZU05DRkVpcmJkTkpuS0dPKzNPSWo5R0M0?=
 =?utf-8?B?Q0FId3ZzcTY3eW1JMkxpR1dPMXNTSjhFT3Q1bHRGVHdSSGU1TGFDcFdiTkhq?=
 =?utf-8?B?RjNpU1JlZmJ3eG4vZVlveE14UHBObEhMdGRzSkxnWHRjMzVaU1dSbit4UVpn?=
 =?utf-8?B?aUFoSkhQZEh5cStLZXdIa2EzbHZzWWQvMUZyaXc1UUQrb0NJeUtzZndSRW1I?=
 =?utf-8?B?S2JGNFZGZ01PL3p5VkJNQkRVUFdxTkliNWRnRlJrN2ZPbEFPcDRmY1JpUTEz?=
 =?utf-8?B?UEpYYmFRRHpadUUvckVMemZzWHQ0TVNLanJKcFd6UnRFejBCOVlzay9jbnhu?=
 =?utf-8?B?R2YrZlZmRFVJUlgvMVpJb0luT1ZvNjdpZElib2pVVUlpOVpjenVHdjdTSHE0?=
 =?utf-8?B?N1ptTHBRMkg2K3lORWd3UkI4Rk5OdngydktyN3M5M09Fek5pdTdmTysyaWtq?=
 =?utf-8?B?aVBlclltaHNUbFdEbWNiUVdvQldJME9sY2pJYWU4blNyYXIwVm1ZZHg0VFFR?=
 =?utf-8?B?SVBJeHdickRVWHB3b2ZVT0hEamtHRXB6cnFXUWpHY3l0NENxekhJZmlVWU4w?=
 =?utf-8?B?Z1dDaGVCaUUvQXlnRElUMEVKUjhLUWM3SkVVNzVhL0lmVWppcnZuY1dOOEkr?=
 =?utf-8?B?RVgrOGpweE0rakh3eUVBL2NrTDg1cXFSdUtCTCtqSHY0VHdpNU5DSkFqeE5P?=
 =?utf-8?B?ZytDZ1FuRkpmbW43bmY1aVJNUnRpTVU3ZCsxSWZtR1NjQURBaDNkWk5qUHFw?=
 =?utf-8?B?TUZLSU5BRFY2UVE3YWlrY3BJZnhRTU4xVStIOUcwRTVBNm5nQUMvbHN3WDVQ?=
 =?utf-8?Q?M/vQu7RDj7ni0T0mo6u6eOI7knRPx4vW?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDkzVjQ2dDltNWJUSVdmdzVxUG15Rk9LdGNMalFhS01rMWY3ZFlQbVNDQzVC?=
 =?utf-8?B?ODJYQy85SUc3OGw4amJqS3dWazVzRnQ1QTJmZzA0TzNSU1A1ZnlRQmV2NXcz?=
 =?utf-8?B?VWE5STZnQ0RXSXFCNGlkbmNueG1PRHZDZ1pydGY2NFFCM256QktxZElrSXh5?=
 =?utf-8?B?UnBCK2FUMWVLV3h3QTZPM3J1aEZxb1dYVEJ4Q2hUZ3FGZVArVm81alQ2aXhX?=
 =?utf-8?B?SWtZTGFPQzZEekl2NjBzSzRaT3ZyWldNcG0rWkhKOFBwZ3FYT2hVdmZOQlho?=
 =?utf-8?B?OUFvV01pQ0tTcm1iT0ZCYktCUGdhbGg2VSswRmtIOGJ1MXlyTlNrVzRGM3V0?=
 =?utf-8?B?enNWcEt6eXZSZTlVdWh5Ujh5ZnNzU0ZaVzNERGpGUDg2anQxWGlhVyt2RGhu?=
 =?utf-8?B?QlNXcTlramc4TFY4RHJvbFVOTElIa2NyKzhDMFNCTVE3bWVEaEhlZW9SK1pM?=
 =?utf-8?B?ZTU5NmUwMURxTlYxWFhiYUtwb1BVcU9WbUZrUHV2THJTVy9LTnArWGtIdjlH?=
 =?utf-8?B?aWQ1YlNvT3hCVmtRSktPdkMzazUxYSt5NVRCd0gwcjE1S1gvR25QVUdvNk91?=
 =?utf-8?B?YTRMQS9Gc3YwS2dmd2ViVzVBQkY1cHdCd3JldE4zMlZDa0Qxd1d4bFFQTk5y?=
 =?utf-8?B?Tng3Y1ZFaHcwcW1YRXNpTHZLbEd6Z1I2cE5MVGZadzZHTXYrRHlyTDYyMUI1?=
 =?utf-8?B?Unc0YjN3cGxpODRGT0VPSnFYZ0FKOVV2aGVYYnBiSmY2YzRZSEpYa00vZ3lW?=
 =?utf-8?B?UEI0UHdvdVRNTjlhTXc2MDl2eTlURmdwbFpvcDVyMEVJRjhXU3EycVRMKzZl?=
 =?utf-8?B?aEQ5d21jbmJ0bUphdGdvRk5Tc0NyTW1ra2RUUXBRb0RuMGNlSTd0NWpuaWVa?=
 =?utf-8?B?YWxnazJjekNNTC9xQ3F0dmpna25lOVJUTGdXeStGU1JycGExSG9wMk5VSEtu?=
 =?utf-8?B?MlZrLzZUZnJSTE9oaVArOEhUVkdQdWR6dkp1REtUR1V2QkVDN25EcVd4N0Jk?=
 =?utf-8?B?dnpLODZQWjlFYU1QVW42UzltVmkvajBtYWhtcWZzNzA4dDAzcVA1MjBSbm8z?=
 =?utf-8?B?KzNhVmdGZE1OeHI3TStBUWFYcDYzY2ZYN2Y4L0dhSUovK08yTC9YNk0zdjB3?=
 =?utf-8?B?aHpzQkYyVzYvS05XM3VhNXFWazlHeWFUeFp6VEM2STlMTS9VbW1rUXYwZG1k?=
 =?utf-8?B?SkRNV3MweURsSjlYcFNvb1o1YjNMK1AvL2NGVEgzMjEvOStCaFlPQmQ1c3F4?=
 =?utf-8?B?Skx0SlJrMW96V21TZDl4M3YvTllQMW5mZWxsUWw3bEtPcGFlR2s2ZUttMkIv?=
 =?utf-8?B?bURqUFVGLzJHUlJXeW1hb3drRGRXSzBpQmdHOW5hWGw0L0RCUUM0OTZDM09L?=
 =?utf-8?B?RDRIYUFPMGhLNW9FWEVsY3djYjBha2FMeGoxNHNWTXVNNUFJU3N3czRoVWpx?=
 =?utf-8?B?VjVKV1ZaZkxSUzJGemZyd3QwYWVUak5kWGhOYXoxN2puTzUvbjM4TmFkRmRQ?=
 =?utf-8?B?bnp2TzRDWjVkYzZkRDh6dWdqeWlhMmttRjAzYlo2MTd0dTRUTG0rRDhpMS9U?=
 =?utf-8?B?T2thdUZmdzB2b2xzR2gxUUcyUkU5KzAwd3pIQXJXa1FsazVuMGpCUmRicGlX?=
 =?utf-8?B?UmRNYU9aQ0ZUR05lMHNnWDUzV0xmM2UxSWZzWk5HT1JFcjNhZzFNUldpTW9y?=
 =?utf-8?B?M1g1R0IrQjRBc0ZCU1BSdVBIMW9wdE1hRm1maUhpVXdDK2JId05FMDJNNUFD?=
 =?utf-8?B?WGlTb3ZUVVpWQS9CcHpXRWs5YmE3bmM5bWE1MHNLYWEwSHEwMnFUTEYrU3V3?=
 =?utf-8?B?QllIeTdWN2cxQkhud083d0p2WTJaL1IzSC9uUlVaakhTZENuak13TnZncEVJ?=
 =?utf-8?B?T2tnb3NHSW1BY0wzaUN5Zm1FVFBIRjRBeUlVL0JweUJHd0ZOb01JUjBYWnl0?=
 =?utf-8?B?QThManVjdWZHZGhxWURBWVhON2l0NFA5bWR4WjFuMW84cU1lRkYvOXB4aVI2?=
 =?utf-8?B?L01SSFBWdmZGQUhCT1lRemVNSlFmUDN4UmUwSDZMSko5Z29Ud2FsTTNxYXRn?=
 =?utf-8?B?Tnl4ZzBnTU90VVFKbG5VSlJUcmF4L0hwOFVWbWtWSzNyWmdKTG1pTWdLNHFu?=
 =?utf-8?Q?F1HiyKYNZlBAl8XxTxbbvCUHI?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2643b512-5f76-4daa-5581-08ddd106d5c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 14:22:24.2765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vH1dJ7/NfWcG/4AA5LotvBLMI46VCpIT25YuXvuB2eRdp9Kq64FBTG26RuQ3ZEMwO2cZs4psbupNtV/H/BHZ8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6966
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIDcvOF0gZHJtOiB3cml0ZWJhY2s6IGRyb3AgZXhjZXNzIGNv
bm5lY3RvciBpbml0aWFsaXphdGlvbg0KPiBmdW5jdGlvbnMNCg0KVGhpcyBzaG91bGQgYmUgZHJt
L3dyaXRlYmFjayANCg0KUmVnYXJkcywNClN1cmFqIEthbmRwYWwNCg0KPiANCj4gDQo+IA0KPiBM
ZSAwMS8wOC8yMDI1IMOgIDE1OjUxLCBEbWl0cnkgQmFyeXNoa292IGEgw6ljcml0wqA6DQo+ID4g
Tm93IGFzIGFsbCBkcml2ZXJzIGhhdmUgYmVlbiBjb252ZXJ0ZWQgdG8NCj4gPiBkcm1tX3dyaXRl
YmFja19jb25uZWN0b3JfaW5pdCgpLCBkcm9wIGRybV93cml0ZWJhY2tfY29ubmVjdG9yX2luaXQo
KQ0KPiA+IGFuZCBkcm1fd3JpdGViYWNrX2Nvbm5lY3Rvcjo6ZW5jb2RlciBmaWVsZCwgdGhleSBh
cmUgdW51c2VkIG5vdy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBCYXJ5c2hrb3Yg
PGRtaXRyeS5iYXJ5c2hrb3ZAb3NzLnF1YWxjb21tLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBM
b3VpcyBDaGF1dmV0IDxsb3Vpcy5jaGF1dmV0QGJvb3RsaW4uY29tPg0KPiANCj4gPiAtLS0NCj4g
PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMgfCA1NSAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICAgaW5jbHVkZS9kcm0vZHJtX3dyaXRlYmFj
ay5oICAgICB8IDE4IC0tLS0tLS0tLS0tLS0tDQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDczIGRl
bGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fd3Jp
dGViYWNrLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMgaW5kZXgNCj4g
Pg0KPiA5NWI4YTJlNGJkYTY5MjMwNTkxYjUwYmUxNWQxNGQwYjM2OTIzNzNiLi4xYTAxZGY5MWIy
YzU4NjhlMTU4ZDQ4OQ0KPiBiNzgyZg0KPiA+IDRjNTdjNjFhMjcyYyAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX3dyaXRlYmFjay5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV93cml0ZWJhY2suYw0KPiA+IEBAIC0xNDIsNjEgKzE0Miw2IEBAIHN0YXRpYyBpbnQg
Y3JlYXRlX3dyaXRlYmFja19wcm9wZXJ0aWVzKHN0cnVjdA0KPiBkcm1fZGV2aWNlICpkZXYpDQo+
ID4gICAJcmV0dXJuIDA7DQo+ID4gICB9DQo+ID4NCj4gPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBk
cm1fZW5jb2Rlcl9mdW5jcyBkcm1fd3JpdGViYWNrX2VuY29kZXJfZnVuY3MgPSB7DQo+ID4gLQku
ZGVzdHJveSA9IGRybV9lbmNvZGVyX2NsZWFudXAsDQo+ID4gLX07DQo+ID4gLQ0KPiA+IC0vKioN
Cj4gPiAtICogZHJtX3dyaXRlYmFja19jb25uZWN0b3JfaW5pdCAtIEluaXRpYWxpemUgYSB3cml0
ZWJhY2sgY29ubmVjdG9yDQo+ID4gYW5kIGl0cyBwcm9wZXJ0aWVzDQo+ID4gLSAqIEBkZXY6IERS
TSBkZXZpY2UNCj4gPiAtICogQHdiX2Nvbm5lY3RvcjogV3JpdGViYWNrIGNvbm5lY3RvciB0byBp
bml0aWFsaXplDQo+ID4gLSAqIEBjb25fZnVuY3M6IENvbm5lY3RvciBmdW5jcyB2dGFibGUNCj4g
PiAtICogQGVuY19oZWxwZXJfZnVuY3M6IEVuY29kZXIgaGVscGVyIGZ1bmNzIHZ0YWJsZSB0byBi
ZSB1c2VkIGJ5IHRoZQ0KPiA+IGludGVybmFsIGVuY29kZXINCj4gPiAtICogQGZvcm1hdHM6IEFy
cmF5IG9mIHN1cHBvcnRlZCBwaXhlbCBmb3JtYXRzIGZvciB0aGUgd3JpdGViYWNrDQo+ID4gZW5n
aW5lDQo+ID4gLSAqIEBuX2Zvcm1hdHM6IExlbmd0aCBvZiB0aGUgZm9ybWF0cyBhcnJheQ0KPiA+
IC0gKiBAcG9zc2libGVfY3J0Y3M6IHBvc3NpYmxlIGNydGNzIGZvciB0aGUgaW50ZXJuYWwgd3Jp
dGViYWNrIGVuY29kZXINCj4gPiAtICoNCj4gPiAtICogVGhpcyBmdW5jdGlvbiBjcmVhdGVzIHRo
ZSB3cml0ZWJhY2stY29ubmVjdG9yLXNwZWNpZmljIHByb3BlcnRpZXMNCj4gPiBpZiB0aGV5DQo+
ID4gLSAqIGhhdmUgbm90IGJlZW4gYWxyZWFkeSBjcmVhdGVkLCBpbml0aWFsaXplcyB0aGUgY29u
bmVjdG9yIGFzDQo+ID4gLSAqIHR5cGUgRFJNX01PREVfQ09OTkVDVE9SX1dSSVRFQkFDSywgYW5k
IGNvcnJlY3RseSBpbml0aWFsaXplcyB0aGUNCj4gPiBwcm9wZXJ0eQ0KPiA+IC0gKiB2YWx1ZXMu
IEl0IHdpbGwgYWxzbyBjcmVhdGUgYW4gaW50ZXJuYWwgZW5jb2RlciBhc3NvY2lhdGVkIHdpdGgN
Cj4gPiB0aGUNCj4gPiAtICogZHJtX3dyaXRlYmFja19jb25uZWN0b3IgYW5kIHNldCBpdCB0byB1
c2UgdGhlIEBlbmNfaGVscGVyX2Z1bmNzDQo+ID4gdnRhYmxlIGZvcg0KPiA+IC0gKiB0aGUgZW5j
b2RlciBoZWxwZXIuDQo+ID4gLSAqDQo+ID4gLSAqIERyaXZlcnMgc2hvdWxkIGFsd2F5cyB1c2Ug
dGhpcyBmdW5jdGlvbiBpbnN0ZWFkIG9mDQo+ID4gZHJtX2Nvbm5lY3Rvcl9pbml0KCkgdG8NCj4g
PiAtICogc2V0IHVwIHdyaXRlYmFjayBjb25uZWN0b3JzLg0KPiA+IC0gKg0KPiA+IC0gKiBSZXR1
cm5zOiAwIG9uIHN1Y2Nlc3MsIG9yIGEgbmVnYXRpdmUgZXJyb3IgY29kZQ0KPiA+IC0gKi8NCj4g
PiAtaW50IGRybV93cml0ZWJhY2tfY29ubmVjdG9yX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwNCj4gPiAtCQkJCSBzdHJ1Y3QgZHJtX3dyaXRlYmFja19jb25uZWN0b3INCj4gKndiX2Nvbm5l
Y3RvciwNCj4gPiAtCQkJCSBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcw0KPiAqY29u
X2Z1bmNzLA0KPiA+IC0JCQkJIGNvbnN0IHN0cnVjdCBkcm1fZW5jb2Rlcl9oZWxwZXJfZnVuY3MN
Cj4gKmVuY19oZWxwZXJfZnVuY3MsDQo+ID4gLQkJCQkgY29uc3QgdTMyICpmb3JtYXRzLCBpbnQg
bl9mb3JtYXRzLA0KPiA+IC0JCQkJIHUzMiBwb3NzaWJsZV9jcnRjcykNCj4gPiAtew0KPiA+IC0J
aW50IHJldCA9IDA7DQo+ID4gLQ0KPiA+IC0JZHJtX2VuY29kZXJfaGVscGVyX2FkZCgmd2JfY29u
bmVjdG9yLT5lbmNvZGVyLA0KPiBlbmNfaGVscGVyX2Z1bmNzKTsNCj4gPiAtDQo+ID4gLQl3Yl9j
b25uZWN0b3ItPmVuY29kZXIucG9zc2libGVfY3J0Y3MgPSBwb3NzaWJsZV9jcnRjczsNCj4gPiAt
DQo+ID4gLQlyZXQgPSBkcm1fZW5jb2Rlcl9pbml0KGRldiwgJndiX2Nvbm5lY3Rvci0+ZW5jb2Rl
ciwNCj4gPiAtCQkJICAgICAgICZkcm1fd3JpdGViYWNrX2VuY29kZXJfZnVuY3MsDQo+ID4gLQkJ
CSAgICAgICBEUk1fTU9ERV9FTkNPREVSX1ZJUlRVQUwsIE5VTEwpOw0KPiA+IC0JaWYgKHJldCkN
Cj4gPiAtCQlyZXR1cm4gcmV0Ow0KPiA+IC0NCj4gPiAtCXJldCA9IGRybV93cml0ZWJhY2tfY29u
bmVjdG9yX2luaXRfd2l0aF9lbmNvZGVyKGRldiwNCj4gd2JfY29ubmVjdG9yLCAmd2JfY29ubmVj
dG9yLT5lbmNvZGVyLA0KPiA+IC0JCQljb25fZnVuY3MsIGZvcm1hdHMsIG5fZm9ybWF0cyk7DQo+
ID4gLQ0KPiA+IC0JaWYgKHJldCkNCj4gPiAtCQlkcm1fZW5jb2Rlcl9jbGVhbnVwKCZ3Yl9jb25u
ZWN0b3ItPmVuY29kZXIpOw0KPiA+IC0NCj4gPiAtCXJldHVybiByZXQ7DQo+ID4gLX0NCj4gPiAt
RVhQT1JUX1NZTUJPTChkcm1fd3JpdGViYWNrX2Nvbm5lY3Rvcl9pbml0KTsNCj4gPiAtDQo+ID4g
ICBzdGF0aWMgdm9pZCBkZWxldGVfd3JpdGViYWNrX3Byb3BlcnRpZXMoc3RydWN0IGRybV9kZXZp
Y2UgKmRldikNCj4gPiAgIHsNCj4gPiAgIAlpZiAoZGV2LT5tb2RlX2NvbmZpZy53cml0ZWJhY2tf
cGl4ZWxfZm9ybWF0c19wcm9wZXJ0eSkgeyBkaWZmIC0tZ2l0DQo+ID4gYS9pbmNsdWRlL2RybS9k
cm1fd3JpdGViYWNrLmggYi9pbmNsdWRlL2RybS9kcm1fd3JpdGViYWNrLmggaW5kZXgNCj4gPg0K
PiBjMzgwYTdiOGY1NWEzNjE2ZmEwNzBjMDM3ZDVjYzY1M2IwMDYxZmU2Li44NzljYTEwMzMyMGNj
MjI1ZmZiMzY4NzQxOTANCj4gOA0KPiA+IDgzNjEzMTU1MzVmYyAxMDA2NDQNCj4gPiAtLS0gYS9p
bmNsdWRlL2RybS9kcm1fd3JpdGViYWNrLmgNCj4gPiArKysgYi9pbmNsdWRlL2RybS9kcm1fd3Jp
dGViYWNrLmgNCj4gPiBAQCAtMjQsMTcgKzI0LDYgQEAgc3RydWN0IGRybV93cml0ZWJhY2tfY29u
bmVjdG9yIHsNCj4gPiAgIAkgKi8NCj4gPiAgIAlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciBiYXNlOw0K
PiA+DQo+ID4gLQkvKioNCj4gPiAtCSAqIEBlbmNvZGVyOiBJbnRlcm5hbCBlbmNvZGVyIHVzZWQg
YnkgdGhlIGNvbm5lY3RvciB0byBmdWxmaWxsDQo+ID4gLQkgKiB0aGUgRFJNIGZyYW1ld29yayBy
ZXF1aXJlbWVudHMuIFRoZSB1c2VycyBvZiB0aGUNCj4gPiAtCSAqIEBkcm1fd3JpdGViYWNrX2Nv
bm5lY3RvciBjb250cm9sIHRoZSBiZWhhdmlvdXIgb2YgdGhlIEBlbmNvZGVyDQo+ID4gLQkgKiBi
eSBwYXNzaW5nIHRoZSBAZW5jX2Z1bmNzIHBhcmFtZXRlciB0bw0KPiBkcm1fd3JpdGViYWNrX2Nv
bm5lY3Rvcl9pbml0KCkNCj4gPiAtCSAqIGZ1bmN0aW9uLg0KPiA+IC0JICogRm9yIHVzZXJzIG9m
IGRybV93cml0ZWJhY2tfY29ubmVjdG9yX2luaXRfd2l0aF9lbmNvZGVyKCksIHRoaXMNCj4gZmll
bGQNCj4gPiAtCSAqIGlzIG5vdCB2YWxpZCBhcyB0aGUgZW5jb2RlciBpcyBtYW5hZ2VkIHdpdGhp
biB0aGVpciBkcml2ZXJzLg0KPiA+IC0JICovDQo+ID4gLQlzdHJ1Y3QgZHJtX2VuY29kZXIgZW5j
b2RlcjsNCj4gPiAtDQo+ID4gICAJLyoqDQo+ID4gICAJICogQHBpeGVsX2Zvcm1hdHNfYmxvYl9w
dHI6DQo+ID4gICAJICoNCj4gPiBAQCAtMTQ4LDEzICsxMzcsNiBAQCBkcm1fY29ubmVjdG9yX3Rv
X3dyaXRlYmFjayhzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcg0KPiAqY29ubmVjdG9yKQ0KPiA+ICAgCXJl
dHVybiBjb250YWluZXJfb2YoY29ubmVjdG9yLCBzdHJ1Y3QgZHJtX3dyaXRlYmFja19jb25uZWN0
b3IsIGJhc2UpOw0KPiA+ICAgfQ0KPiA+DQo+ID4gLWludCBkcm1fd3JpdGViYWNrX2Nvbm5lY3Rv
cl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ID4gLQkJCQkgc3RydWN0IGRybV93cml0
ZWJhY2tfY29ubmVjdG9yDQo+ICp3Yl9jb25uZWN0b3IsDQo+ID4gLQkJCQkgY29uc3Qgc3RydWN0
IGRybV9jb25uZWN0b3JfZnVuY3MNCj4gKmNvbl9mdW5jcywNCj4gPiAtCQkJCSBjb25zdCBzdHJ1
Y3QgZHJtX2VuY29kZXJfaGVscGVyX2Z1bmNzDQo+ICplbmNfaGVscGVyX2Z1bmNzLA0KPiA+IC0J
CQkJIGNvbnN0IHUzMiAqZm9ybWF0cywgaW50IG5fZm9ybWF0cywNCj4gPiAtCQkJCSB1MzIgcG9z
c2libGVfY3J0Y3MpOw0KPiA+IC0NCj4gPiAgIGludCBkcm1fd3JpdGViYWNrX2Nvbm5lY3Rvcl9p
bml0X3dpdGhfZW5jb2RlcihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiA+ICAgCQkJCXN0cnVj
dCBkcm1fd3JpdGViYWNrX2Nvbm5lY3Rvcg0KPiAqd2JfY29ubmVjdG9yLA0KPiA+ICAgCQkJCXN0
cnVjdCBkcm1fZW5jb2RlciAqZW5jLA0KPiA+DQo+IA0KPiAtLQ0KPiBMb3VpcyBDaGF1dmV0LCBC
b290bGluDQo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6
Ly9ib290bGluLmNvbQ0KDQo=
