Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 746A0B1E176
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 07:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B66C10E4B1;
	Fri,  8 Aug 2025 05:03:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jNzASWSI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE00A10E4AA;
 Fri,  8 Aug 2025 05:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754629411; x=1786165411;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k89OAf9cnUHDq2dyfSjzC8iNlC1DQ0r99l5i3cfxpV4=;
 b=jNzASWSIzUjXtrhvjCMc4Bksl60CUpHR+nyQbPdD25+l+2AtfS9yz3Ga
 CgVgWlT3MGE9wHEmEyJWNLvwChJIn9LydLisy4oT9xaDQ8dKo186K5NSU
 sziqDLz5U0kG/V3yo5EYgdUM35hj/asBh16uxHzqy7MT9UTyjtqDQTa+1
 d4WrOQQZDyBSADaVckjkHM3vSMXxSONo/5cp4DXKC8qxYv3mSJVQjNfLW
 X2us2aODLSNyqcETa/VKujAgMXCwxgQk2Xj4xPezu0u3HIc3JQc3isf/O
 I4cJioxlpPkFxZhJyG915m/t2a+L4X+ZrNRsQQ7DLIFfMHgM2icXsPAtA w==;
X-CSE-ConnectionGUID: 4t2NDN7ERq29osH9e66muw==
X-CSE-MsgGUID: qdGdssAiQbiiMhHn/OuO0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="57105523"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="57105523"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:03:30 -0700
X-CSE-ConnectionGUID: FfT7pEJvQAGVkit2dZszuQ==
X-CSE-MsgGUID: 7gStdni1RoOiqGgYSlXeTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="169699406"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:03:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:03:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 22:03:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.54)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:03:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GO1OghH4oU/LD7yU28GUoQECjhOw0WLV8pp+4gDFCbobxPBO4RmXrwwaZQMj2RIxAXWDM87W5a0M6nAWFliqg96IV4A6L6o+hwXO2Wxvs+ylYzR//6v+eOVEPrqnuGNd1++5avYzKXy1NZSSNBOICUDtLYH+RIR7wJzHO+N3n3MCsAYATFLxMBmE6ThuBIlLAEnuCcgir16LXrGSlCai1qzuD3ZSgU3w4Pu60Zis2ez/QyAWOF3NHDi8rvVPIJcrqPgL1OQg5cYdOOdQxjoxez2kXTHOPHR7M9jELifWUTyLW7/Z3JymABR9ph09yiE3zoPUrJudeGLdq2FMYhEZ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k89OAf9cnUHDq2dyfSjzC8iNlC1DQ0r99l5i3cfxpV4=;
 b=icbsb+VqrIQoa2fjBAepNowusDsD+812GaPuAMq+M9jaRFc3RBgh06YCArncuoAvXKqKkBu5Ie3Mq1b4cDLFFTP4wKewvqcDXwK7WaqYQJf693+KccuyQic4TVQ3LdsfvC73lrsLmyIS3o3Rv+f/N8vJzDR6lFh2KdUXyNrh57jNKnDS33jPp6tiY25kzgrrg7yIuG5azQ9/jJPI1eEU5i6zjgIUobHF3NUhU02bFu+IGtU5pwwaVprXsIGTzFZTDMCNSpgLQNbTpdIdQpGP7bI6etvdWVzUHY0xFMMzh/b3MNBL6DeXXJ5bThNMGiLhUx5uIIqalCGrvF36rVgg8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by LV1PR11MB8819.namprd11.prod.outlook.com
 (2603:10b6:408:2b3::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 05:03:26 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f%7]) with mapi id 15.20.9009.016; Fri, 8 Aug 2025
 05:03:26 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Jani Nikula
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
Thread-Index: AQHcAutr9HenA3S/zE2ohrLEHk85MbRYPaSA
Date: Fri, 8 Aug 2025 05:03:26 +0000
Message-ID: <DM3PPF208195D8D4ADC3C62D015D08F6C9CE32FA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
 <20250801-wb-drop-encoder-v1-7-824646042f7d@oss.qualcomm.com>
In-Reply-To: <20250801-wb-drop-encoder-v1-7-824646042f7d@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|LV1PR11MB8819:EE_
x-ms-office365-filtering-correlation-id: 83f17565-54e0-4d63-ed71-08ddd638e8cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?eW5HeHFFdXE0bDEvcS9Ed2ZUQkVOTUxSbEhHZUFqUHhmOUVtR2xoa1V5aUtu?=
 =?utf-8?B?Mk56Q0FidkIwTnJvZFFiUEJvTlJILyt2YkgvcDNlNC85TUZMcWFBbmJhbTNw?=
 =?utf-8?B?MGRRWm5YaFhQTDB0RzNhZEhSQUdDV1V2Smh0YnJnMStkUk9mcHh4UEFvek9I?=
 =?utf-8?B?R0NYNlRsaE9NUnBjTVJhL2daQ3hwVWNRVW5KT1lhYW5yUS96S0hLNXlWU3py?=
 =?utf-8?B?bUl6OURqWmljVTB0VmtFRE1zL09DeUF3TmUxT1pHeGZ3MTB5MFhielVsbGh0?=
 =?utf-8?B?Y21sSGRoaUxiS3pTYjFFUnhTNENyNVU1cHJ1MHJKaVBpazRPZC9SRFpPeXEw?=
 =?utf-8?B?bWhEaEtzbFo4Mk9lR05PdzM1ejA5RmUrLyszRS95T1k1LzFQVmN4UTdubDdN?=
 =?utf-8?B?VjFCNng3U0x5YzJRZHlMUXpIdlpmNXU4aHl6aU9ncWxRNGFYRWMxbEIzTFlv?=
 =?utf-8?B?aUsvamxTSEJnNmdBdHBoaStPTy90ZldUSVlBWGQ2TGd2SUtva0pnMG5ETzBx?=
 =?utf-8?B?ZEE0NUpRZmN6elFIUm1xNklORDdHOHZwTFdWMHZTMC9hVEFBWHB2ZXM0OFJQ?=
 =?utf-8?B?REd1eU4ydkZHSUd1YkI1MHMwdmlYWWo4ZmpyNHlISXVGRkxIUjFqRURjcnlt?=
 =?utf-8?B?MEJXYXo0R25kcC9YZHFycEtzcGxTa1lTQncycWJ6ZUd6aHQ4UWlja2tCVVJH?=
 =?utf-8?B?U2xhUzR5T0JCd0ZmRERnbjQ2NEtJMERxUzI5SGxuYWV0ZUE0Y3dDZjZsZ0pm?=
 =?utf-8?B?WThqajNueU1aUHZGMytXNHBlYmJDUWdjKzFOemU1ZWVGNk9KZm1QZnJWU3d3?=
 =?utf-8?B?ckhaQjVpYnduWWx6bTN5T2ozQUdta1orOTdHbmNScXl5Z1dFQzZWOXFzQjFi?=
 =?utf-8?B?RStzSzJxOHJzMVNOSEdJcXZRV3hZWnpPNDhQcGNIL0M1U3BYR1VsVXo2cEVM?=
 =?utf-8?B?OXk1S3d4emxTaytCbTE1UVFKZjAwSUlkZ0JiR1FrQzZYS0VwTTZhWkhGNlF5?=
 =?utf-8?B?WTdSZzZIM2Fuc3BnVHpHdTFzOWhUZWFCZldScjI1REpFUEs0eisvdzdGOFEz?=
 =?utf-8?B?UGFYRmhOOXBTVjRwQytlekIrSkpqdkZzSWlzY3pkMytTdlFYc1hnc2p4QkhZ?=
 =?utf-8?B?REd4T0ZvS0EvZmZqOFdwaW5UVVZMNXFENXgveDlSVW5BVnN3MEZ1amp2ZXdB?=
 =?utf-8?B?dUtEcjFQVUw5cWpoVm4rRTRHaVpBcWFMN0dBbG9jeXB6SjI5ZGtJa0pJc1dw?=
 =?utf-8?B?Nld6ZnJVUk15NGU1ZEs2M1pGNHVuWGNCVlZ1YW93TEx2dVdadEZVeEZuUWFX?=
 =?utf-8?B?V05vR0c2VUE2aTBXaGIrS0VFTy9EZ2hKRjY5UDBBcFd4cFhnNDdmSWl6TUgz?=
 =?utf-8?B?eUxrOEJwVm4zaXovREZ6cGJNd3hqaE9TZUREVHpqYUZONVdseStkalBmK1pr?=
 =?utf-8?B?SnpIUGUzaUhUaG1SRTU0cmJBanEwYzBjN0E3RktNRkV6clNPQVRpbGhRMXUz?=
 =?utf-8?B?Zlg2aDM0TWI2dGxUSlhuQjFhMFlqMTJlSlE3UFRGUlFmeDQxaXRhSW11dDI4?=
 =?utf-8?B?dzVLQlByUDhpODlHTWJIOVJIMzM5M3Q4YjY4TW5lMEx6UzhxVlFNVHBVV1Rz?=
 =?utf-8?B?S3JrWVdVZ2VLQ01PNFgwbExNTDFvVlBYT3QyaVREM0hmNEVZd2JLODlhcUJM?=
 =?utf-8?B?TDFpUjFiRDJQRGJzaGZNaDZFa3RxaitNK3ZzMkN0K2s1cTRKcXUvaytESytT?=
 =?utf-8?B?S2s0MWkzUmloYlk5Rm9ydFZGeC9QVkZ1N1lUaVVUc3F2NXNUTFM3S2FaY0Q5?=
 =?utf-8?B?RitMcStaMmNRd000bnhVczZvZ3lGdEFIamtaUFduQW1ubXAyeHY1QmhISlYx?=
 =?utf-8?B?aWJ6T1h4Mkk1R0ZTNzd2TVRWek9PME1IeFpGaGxIS01yQ1dLajNmdnVDd043?=
 =?utf-8?B?U1JZSzlEeEYvUE10YWFwMHVhbktFYUlGV3dBUG5sZVkvL1JXK1g3TWhHVU5G?=
 =?utf-8?Q?QYl1CJKV8SMdRPHZfOwHOvRe4r87MU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmVjbmprUFNqa0ZnYWZUQk41VmJzSVp0dVQzUnM4bEQ5bGlQUFlCRzExNHlT?=
 =?utf-8?B?bnQ3Wi9zN1ZnaGVRMnJicmt1Rm5xUnVEOWhYS0ttNjlFa3RGdEJ2c0Z6MXRl?=
 =?utf-8?B?THpQc3hKb3YzcTgrMzU5UFV4M3J6dmtwL0RaQUlHNEpaSG5nVW1iRTVXTTRx?=
 =?utf-8?B?RDRocFNVS291L0k3Z1E2c3FsUXlZVU1jYlhPSHp4ektYWE9xcjVvU3NzRWdJ?=
 =?utf-8?B?Z0VvUVdxdDZCSHJ1RmRVaEZEaUNWN1RoM1AyeXhBZldaZFlZbitiK0lWNnFQ?=
 =?utf-8?B?MUZDWFRtUE1BKy92YnRYcVNqZDRhTDYzeVJGSUwyNm5YVHpzeFRCUlpTbGtZ?=
 =?utf-8?B?bVFraS9XMnpBNGhxS2Y3bGhSLys4RDlPeU5HeEpaT1QwWnE1QzNiUkVyMTl1?=
 =?utf-8?B?ZG9odnhOWjNwSlQ0WEdJS3l6T3ZjRjA4V3JKWmloY1MzckI4UmhWQnROUEh0?=
 =?utf-8?B?V0RvaUJYdjNyendPSmozZ2FSTEpqd25GdTkrSUVvWTI0WnZQQ2oyajlKMm5k?=
 =?utf-8?B?d2VVaEZtV01HUHNCeU16cjZCT0lNWVZaZ0dXa0s5NVNNWko3REhHS0YxSm94?=
 =?utf-8?B?UXZYNUFEZk1veDREditnRHRiTWdsZTlSOUd5d1lNVHY4ZERyVndqTFJZU2Q5?=
 =?utf-8?B?WmV4VVIxVXVoWm9zbUN6aExUNStSMXZVUXhscGFsemx2a3JPZjFoSlhXYmpM?=
 =?utf-8?B?aG94ZE1JVTVxaEkvZVFBRnE5L3VlSEdjb3BybmpDenYzYXFhMSs3SWVoSkV2?=
 =?utf-8?B?KzZMaVhPS0xGTXF6S0tXY000VGFSNlo0ZkZ2SFlqUlU0NEl6NmtzNkFnZURX?=
 =?utf-8?B?Z2JnZU9IOUJmMUJDY2RQZnNiOXRGbTFUcSs4UmtrOFMrWjVXTE9uTjc3NnlS?=
 =?utf-8?B?MFAzZnFNRWVKV0ZTR1NyRWVLcDdjbXhweFhia1pyV2pWM1ZtejhlTGQ3ai9P?=
 =?utf-8?B?ZDlpa1E3dWlXbENpTi9nZ0Z5SEcvbmsyeXBIMVBucm43QlphREJzSnNsaXph?=
 =?utf-8?B?MmJCR1ZreFJtK1REaHF3YnZyWlBFSFNEVkJKQmx3c1lmU2N1dm5jaVV6L0Qx?=
 =?utf-8?B?clY3RzBqY0p6RW5ZMXpGamZnamg4b21RWlJicjJ3bUI3SnB3aEQrU1RQMVhx?=
 =?utf-8?B?dkUrcFliT3llY09ic3oxcCtYMC96aHZSYndIaFNDNGp1b212eGJmblV4MnJT?=
 =?utf-8?B?Q1hKVGtVOHpMVEhHMERXNTk4ZDZ0bjNSSHI4azRZOHFHOHEzK2tjaEo1Vkw5?=
 =?utf-8?B?d1VQdjRyWmM0cEVwdGRJcUJCRzZDeE0wSkZBem56WjdFdFF0UW5oR3hkOFdP?=
 =?utf-8?B?WEdad0Y2N2tyMkdDK2ZBUGxpaVlSaTJNcjNCR0ZsQnJrUGxrK3puTm03Ujhp?=
 =?utf-8?B?STNTTFl0OU0vSUMxZDF2RGRUUnRSYVQzTTBJZEhPWVZubGFIMVhXeVpFakZW?=
 =?utf-8?B?WS85V1YvTFZXRXFuUTVnWmZvRGhqaHNXa0ZpRHo1VWF3KzJsNUU3SWtVQkRk?=
 =?utf-8?B?N1NMWExxbitscTNmRzROM2xjUEFFaEptZSthWDZTUXZkQUNJbEIzeERwZmJG?=
 =?utf-8?B?K2xxVlo4MFlGMitncERRdnJFcjFlZEE3OHhZank1a0lPOHBQODgzb3piUDZC?=
 =?utf-8?B?THdZTjhEUWNmYkNMRWozdnZhbVBPMjNzT2VOeTJkNnZNVkl3cjFBWHgxVTlw?=
 =?utf-8?B?ek1WY2RMNERKQitXRCt2QkRQbWlUTUpOUzdybTFPSTlLV3lacU1ZT0ZNZm1C?=
 =?utf-8?B?cERCWU5pdFJmSDk0R1lQK2tEVjN3V1Y5Y3NJYmE5YmFKbUM2WmxFUDhyWXNZ?=
 =?utf-8?B?L2VIWTVUYnBtZW5NZGNiYmVBdGdvRitaekNLQ3ZiWWhCazEyZzhRREcvbDNL?=
 =?utf-8?B?TXhIc1Q0SWtLNXBDWG43N1FDNmlock1YRjVMcGdmMXQ4cTgvZUUvc21uOWtP?=
 =?utf-8?B?MTAzYzQ3YmpzV2QzOFZLMGwzMEJ1a1VUb0IvTG1tM2RycFpCZ0t1RTlQKzM5?=
 =?utf-8?B?RDVPU2plYTFRT1JyaWQxR3pScDVNdEpEbU8xL3NFbUh0NHhSUE9RKzB6KzAx?=
 =?utf-8?B?dFZlWk5lck52emRvamZDZEpaMFN2ZmE4YjF0VUNMSldqdmJBVGw4dWcxekxP?=
 =?utf-8?Q?JqdQ+CMX5ByEvJGjRvx4Vg3Ee?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f17565-54e0-4d63-ed71-08ddd638e8cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2025 05:03:26.8324 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JANGHnYmXcTfSlr8tnyWwm4iANDfJCtj2Eq0j5qTsr7esi81NyNREKb47jwWCeeSnV5WTOmIw0buMycRIzMUXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8819
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

PiBTdWJqZWN0OiBbUEFUQ0ggNy84XSBkcm06IHdyaXRlYmFjazogZHJvcCBleGNlc3MgY29ubmVj
dG9yIGluaXRpYWxpemF0aW9uDQo+IGZ1bmN0aW9ucw0KPiANCj4gTm93IGFzIGFsbCBkcml2ZXJz
IGhhdmUgYmVlbiBjb252ZXJ0ZWQgdG8gZHJtbV93cml0ZWJhY2tfY29ubmVjdG9yX2luaXQoKSwN
Cj4gZHJvcCBkcm1fd3JpdGViYWNrX2Nvbm5lY3Rvcl9pbml0KCkgYW5kIGRybV93cml0ZWJhY2tf
Y29ubmVjdG9yOjplbmNvZGVyDQo+IGZpZWxkLCB0aGV5IGFyZSB1bnVzZWQgbm93Lg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBvc3MucXVh
bGNvbW0uY29tPg0KDQpMR1RNLA0KUmV2aWV3ZWQtYnk6IFN1cmFqIEthbmRwYWwgPHN1cmFqLmth
bmRwYWxAaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV93cml0ZWJh
Y2suYyB8IDU1IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICBp
bmNsdWRlL2RybS9kcm1fd3JpdGViYWNrLmggICAgIHwgMTggLS0tLS0tLS0tLS0tLS0NCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgNzMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV93cml0ZWJhY2suYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGVi
YWNrLmMgaW5kZXgNCj4gOTViOGEyZTRiZGE2OTIzMDU5MWI1MGJlMTVkMTRkMGIzNjkyMzczYi4u
MWEwMWRmOTFiMmM1ODY4ZTE1OGQ0ODkNCj4gYjc4MmY0YzU3YzYxYTI3MmMgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV93cml0ZWJhY2suYw0KPiBAQCAtMTQyLDYxICsxNDIsNiBAQCBzdGF0aWMgaW50IGNy
ZWF0ZV93cml0ZWJhY2tfcHJvcGVydGllcyhzdHJ1Y3QNCj4gZHJtX2RldmljZSAqZGV2KQ0KPiAg
CXJldHVybiAwOw0KPiAgfQ0KPiANCj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJf
ZnVuY3MgZHJtX3dyaXRlYmFja19lbmNvZGVyX2Z1bmNzID0gew0KPiAtCS5kZXN0cm95ID0gZHJt
X2VuY29kZXJfY2xlYW51cCwNCj4gLX07DQo+IC0NCj4gLS8qKg0KPiAtICogZHJtX3dyaXRlYmFj
a19jb25uZWN0b3JfaW5pdCAtIEluaXRpYWxpemUgYSB3cml0ZWJhY2sgY29ubmVjdG9yIGFuZCBp
dHMNCj4gcHJvcGVydGllcw0KPiAtICogQGRldjogRFJNIGRldmljZQ0KPiAtICogQHdiX2Nvbm5l
Y3RvcjogV3JpdGViYWNrIGNvbm5lY3RvciB0byBpbml0aWFsaXplDQo+IC0gKiBAY29uX2Z1bmNz
OiBDb25uZWN0b3IgZnVuY3MgdnRhYmxlDQo+IC0gKiBAZW5jX2hlbHBlcl9mdW5jczogRW5jb2Rl
ciBoZWxwZXIgZnVuY3MgdnRhYmxlIHRvIGJlIHVzZWQgYnkgdGhlIGludGVybmFsDQo+IGVuY29k
ZXINCj4gLSAqIEBmb3JtYXRzOiBBcnJheSBvZiBzdXBwb3J0ZWQgcGl4ZWwgZm9ybWF0cyBmb3Ig
dGhlIHdyaXRlYmFjayBlbmdpbmUNCj4gLSAqIEBuX2Zvcm1hdHM6IExlbmd0aCBvZiB0aGUgZm9y
bWF0cyBhcnJheQ0KPiAtICogQHBvc3NpYmxlX2NydGNzOiBwb3NzaWJsZSBjcnRjcyBmb3IgdGhl
IGludGVybmFsIHdyaXRlYmFjayBlbmNvZGVyDQo+IC0gKg0KPiAtICogVGhpcyBmdW5jdGlvbiBj
cmVhdGVzIHRoZSB3cml0ZWJhY2stY29ubmVjdG9yLXNwZWNpZmljIHByb3BlcnRpZXMgaWYgdGhl
eQ0KPiAtICogaGF2ZSBub3QgYmVlbiBhbHJlYWR5IGNyZWF0ZWQsIGluaXRpYWxpemVzIHRoZSBj
b25uZWN0b3IgYXMNCj4gLSAqIHR5cGUgRFJNX01PREVfQ09OTkVDVE9SX1dSSVRFQkFDSywgYW5k
IGNvcnJlY3RseSBpbml0aWFsaXplcyB0aGUNCj4gcHJvcGVydHkNCj4gLSAqIHZhbHVlcy4gSXQg
d2lsbCBhbHNvIGNyZWF0ZSBhbiBpbnRlcm5hbCBlbmNvZGVyIGFzc29jaWF0ZWQgd2l0aCB0aGUN
Cj4gLSAqIGRybV93cml0ZWJhY2tfY29ubmVjdG9yIGFuZCBzZXQgaXQgdG8gdXNlIHRoZSBAZW5j
X2hlbHBlcl9mdW5jcyB2dGFibGUNCj4gZm9yDQo+IC0gKiB0aGUgZW5jb2RlciBoZWxwZXIuDQo+
IC0gKg0KPiAtICogRHJpdmVycyBzaG91bGQgYWx3YXlzIHVzZSB0aGlzIGZ1bmN0aW9uIGluc3Rl
YWQgb2YgZHJtX2Nvbm5lY3Rvcl9pbml0KCkgdG8NCj4gLSAqIHNldCB1cCB3cml0ZWJhY2sgY29u
bmVjdG9ycy4NCj4gLSAqDQo+IC0gKiBSZXR1cm5zOiAwIG9uIHN1Y2Nlc3MsIG9yIGEgbmVnYXRp
dmUgZXJyb3IgY29kZQ0KPiAtICovDQo+IC1pbnQgZHJtX3dyaXRlYmFja19jb25uZWN0b3JfaW5p
dChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiAtCQkJCSBzdHJ1Y3QgZHJtX3dyaXRlYmFja19j
b25uZWN0b3INCj4gKndiX2Nvbm5lY3RvciwNCj4gLQkJCQkgY29uc3Qgc3RydWN0IGRybV9jb25u
ZWN0b3JfZnVuY3MNCj4gKmNvbl9mdW5jcywNCj4gLQkJCQkgY29uc3Qgc3RydWN0IGRybV9lbmNv
ZGVyX2hlbHBlcl9mdW5jcw0KPiAqZW5jX2hlbHBlcl9mdW5jcywNCj4gLQkJCQkgY29uc3QgdTMy
ICpmb3JtYXRzLCBpbnQgbl9mb3JtYXRzLA0KPiAtCQkJCSB1MzIgcG9zc2libGVfY3J0Y3MpDQo+
IC17DQo+IC0JaW50IHJldCA9IDA7DQo+IC0NCj4gLQlkcm1fZW5jb2Rlcl9oZWxwZXJfYWRkKCZ3
Yl9jb25uZWN0b3ItPmVuY29kZXIsDQo+IGVuY19oZWxwZXJfZnVuY3MpOw0KPiAtDQo+IC0Jd2Jf
Y29ubmVjdG9yLT5lbmNvZGVyLnBvc3NpYmxlX2NydGNzID0gcG9zc2libGVfY3J0Y3M7DQo+IC0N
Cj4gLQlyZXQgPSBkcm1fZW5jb2Rlcl9pbml0KGRldiwgJndiX2Nvbm5lY3Rvci0+ZW5jb2RlciwN
Cj4gLQkJCSAgICAgICAmZHJtX3dyaXRlYmFja19lbmNvZGVyX2Z1bmNzLA0KPiAtCQkJICAgICAg
IERSTV9NT0RFX0VOQ09ERVJfVklSVFVBTCwgTlVMTCk7DQo+IC0JaWYgKHJldCkNCj4gLQkJcmV0
dXJuIHJldDsNCj4gLQ0KPiAtCXJldCA9IGRybV93cml0ZWJhY2tfY29ubmVjdG9yX2luaXRfd2l0
aF9lbmNvZGVyKGRldiwNCj4gd2JfY29ubmVjdG9yLCAmd2JfY29ubmVjdG9yLT5lbmNvZGVyLA0K
PiAtCQkJY29uX2Z1bmNzLCBmb3JtYXRzLCBuX2Zvcm1hdHMpOw0KPiAtDQo+IC0JaWYgKHJldCkN
Cj4gLQkJZHJtX2VuY29kZXJfY2xlYW51cCgmd2JfY29ubmVjdG9yLT5lbmNvZGVyKTsNCj4gLQ0K
PiAtCXJldHVybiByZXQ7DQo+IC19DQo+IC1FWFBPUlRfU1lNQk9MKGRybV93cml0ZWJhY2tfY29u
bmVjdG9yX2luaXQpOw0KPiAtDQo+ICBzdGF0aWMgdm9pZCBkZWxldGVfd3JpdGViYWNrX3Byb3Bl
cnRpZXMoc3RydWN0IGRybV9kZXZpY2UgKmRldikgIHsNCj4gIAlpZiAoZGV2LT5tb2RlX2NvbmZp
Zy53cml0ZWJhY2tfcGl4ZWxfZm9ybWF0c19wcm9wZXJ0eSkgeyBkaWZmIC0tZ2l0DQo+IGEvaW5j
bHVkZS9kcm0vZHJtX3dyaXRlYmFjay5oIGIvaW5jbHVkZS9kcm0vZHJtX3dyaXRlYmFjay5oIGlu
ZGV4DQo+IGMzODBhN2I4ZjU1YTM2MTZmYTA3MGMwMzdkNWNjNjUzYjAwNjFmZTYuLjg3OWNhMTAz
MzIwY2MyMjVmZmIzNjg3NDE5MA0KPiA4ODM2MTMxNTUzNWZjIDEwMDY0NA0KPiAtLS0gYS9pbmNs
dWRlL2RybS9kcm1fd3JpdGViYWNrLmgNCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX3dyaXRlYmFj
ay5oDQo+IEBAIC0yNCwxNyArMjQsNiBAQCBzdHJ1Y3QgZHJtX3dyaXRlYmFja19jb25uZWN0b3Ig
ew0KPiAgCSAqLw0KPiAgCXN0cnVjdCBkcm1fY29ubmVjdG9yIGJhc2U7DQo+IA0KPiAtCS8qKg0K
PiAtCSAqIEBlbmNvZGVyOiBJbnRlcm5hbCBlbmNvZGVyIHVzZWQgYnkgdGhlIGNvbm5lY3RvciB0
byBmdWxmaWxsDQo+IC0JICogdGhlIERSTSBmcmFtZXdvcmsgcmVxdWlyZW1lbnRzLiBUaGUgdXNl
cnMgb2YgdGhlDQo+IC0JICogQGRybV93cml0ZWJhY2tfY29ubmVjdG9yIGNvbnRyb2wgdGhlIGJl
aGF2aW91ciBvZiB0aGUgQGVuY29kZXINCj4gLQkgKiBieSBwYXNzaW5nIHRoZSBAZW5jX2Z1bmNz
IHBhcmFtZXRlciB0bw0KPiBkcm1fd3JpdGViYWNrX2Nvbm5lY3Rvcl9pbml0KCkNCj4gLQkgKiBm
dW5jdGlvbi4NCj4gLQkgKiBGb3IgdXNlcnMgb2YgZHJtX3dyaXRlYmFja19jb25uZWN0b3JfaW5p
dF93aXRoX2VuY29kZXIoKSwgdGhpcw0KPiBmaWVsZA0KPiAtCSAqIGlzIG5vdCB2YWxpZCBhcyB0
aGUgZW5jb2RlciBpcyBtYW5hZ2VkIHdpdGhpbiB0aGVpciBkcml2ZXJzLg0KPiAtCSAqLw0KPiAt
CXN0cnVjdCBkcm1fZW5jb2RlciBlbmNvZGVyOw0KPiAtDQo+ICAJLyoqDQo+ICAJICogQHBpeGVs
X2Zvcm1hdHNfYmxvYl9wdHI6DQo+ICAJICoNCj4gQEAgLTE0OCwxMyArMTM3LDYgQEAgZHJtX2Nv
bm5lY3Rvcl90b193cml0ZWJhY2soc3RydWN0IGRybV9jb25uZWN0b3INCj4gKmNvbm5lY3RvcikN
Cj4gIAlyZXR1cm4gY29udGFpbmVyX29mKGNvbm5lY3Rvciwgc3RydWN0IGRybV93cml0ZWJhY2tf
Y29ubmVjdG9yLCBiYXNlKTsNCj4gfQ0KPiANCj4gLWludCBkcm1fd3JpdGViYWNrX2Nvbm5lY3Rv
cl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+IC0JCQkJIHN0cnVjdCBkcm1fd3JpdGVi
YWNrX2Nvbm5lY3Rvcg0KPiAqd2JfY29ubmVjdG9yLA0KPiAtCQkJCSBjb25zdCBzdHJ1Y3QgZHJt
X2Nvbm5lY3Rvcl9mdW5jcw0KPiAqY29uX2Z1bmNzLA0KPiAtCQkJCSBjb25zdCBzdHJ1Y3QgZHJt
X2VuY29kZXJfaGVscGVyX2Z1bmNzDQo+ICplbmNfaGVscGVyX2Z1bmNzLA0KPiAtCQkJCSBjb25z
dCB1MzIgKmZvcm1hdHMsIGludCBuX2Zvcm1hdHMsDQo+IC0JCQkJIHUzMiBwb3NzaWJsZV9jcnRj
cyk7DQo+IC0NCj4gIGludCBkcm1fd3JpdGViYWNrX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZW5jb2Rl
cihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiAgCQkJCXN0cnVjdCBkcm1fd3JpdGViYWNrX2Nv
bm5lY3Rvcg0KPiAqd2JfY29ubmVjdG9yLA0KPiAgCQkJCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5j
LA0KPiANCj4gLS0NCj4gMi4zOS41DQoNCg==
