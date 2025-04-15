Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE467A8940C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 08:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F00010E35E;
	Tue, 15 Apr 2025 06:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fDaMb48K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2B610E360;
 Tue, 15 Apr 2025 06:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744699231; x=1776235231;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Gu0kkDamR4IK2VeWge7FlDkBEvp6CNHsY03mkmLvdRI=;
 b=fDaMb48Kw0iF5Lfcxh7dWsU55sEPhYA2ur3l396x6cdnUj/XRl2kY0gJ
 S+33qjn95TbkF8JQqA36l+RDRZ+uRQvzHAplox+5duaOhn4UlUMe9/3tk
 IAykKvzVgE/K31ncPHGwD+e+/YA0/EriPplFiDoEwj53l5MXigdym03NP
 v7DiNF0LaL0Agk79xIWXEk7LAdAK4HX4bK65ZNlpXXKdBejrR/i/PC1Bw
 WhpCb9dZzXUvoRDUadnfBEsUzr8gJ6zIu+5yGMWBU4KlztrgXpvYNAQaP
 /a9zq/RPLL7JFqOF9mFdbM3Y5920HHiD6VzHvh+JtsxmGWxZQefU2ldYJ Q==;
X-CSE-ConnectionGUID: UyPK5R+vTtGz4wokMys4jg==
X-CSE-MsgGUID: p2THbXgXQVOqpG/MDoGdAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="57555977"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="57555977"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 23:40:29 -0700
X-CSE-ConnectionGUID: 0cK94YZlRoWdfb3n+4V/sw==
X-CSE-MsgGUID: 3pptYnVORF2T+6DIvKltsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="129880958"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 23:40:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 23:40:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 23:40:27 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 23:40:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aC2+JQh0Kf+dCR6A1UqfEI+ov0ZbrV05amkn//d9GtwFMdDekkCzgxt6+Fu8Z0mYMaP2f3q410+lqNT4/2Kmb2zpZ2xcC8cHGLSmI0HQM2SEl7kNdgV9vUnkb0AVzXmQoGmyFI8Yd25qjkJo6Oi/7UEEBFo2TMpmGhCJxGzifoWo2gHGPArWPXMgyOe3JTx2yFmjDFaC+Urz1ZvS41eiZCeJtrRukPKH/5Q1WdkHj1MlEl7nuSbXOuQPXAp/iODjAt3k+wVt63FnVeErYjeTMaJvodCxSHEHxh33jZXuTtdaFumyviHo0NwyWnqk2/HUn0eiL23dBGxv/d5SxVco8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gu0kkDamR4IK2VeWge7FlDkBEvp6CNHsY03mkmLvdRI=;
 b=ZgUWJKK6Yi6BdY64JFv9lkRoy9+AYc3Vcmq5M1/dB4iX49Jia8mmsGI+H8colif0qh8hnPuZH1i2RJT/BqppgAJ2Fv9Nd7TpmJ4p1hJDiOVDY4PvkE3JxG5Tdc3sRlfQ9Mfu8ytF370ykvFxFUwVLv98QKBQ/8he000Gt3VgeS7vanl7fnx5TQfcXgOjdU9z7bva8wq0VMiYELX+DhTmhGmSPxBTodh0ghq3/MtAai5w0Y5hcLajSk26oPiFxRNohTzQ14LV5TP4Dno2d/rIT0B7gw3nW2JdmU4H//Fbhb7BUksS5N+FZSa58998D1t5BoM4lzf6/Dec8ojRuo50iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6)
 by DM3PPF5217261E0.namprd11.prod.outlook.com (2603:10b6:f:fc00::f21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 06:40:09 +0000
Received: from CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::3ac4:e20e:84f1:f826]) by CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::3ac4:e20e:84f1:f826%4]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 06:40:09 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Simon Ser <contact@emersion.fr>
CC: Alex Hung <alex.hung@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "leo.liu@amd.com" <leo.liu@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "mwen@igalia.com" <mwen@igalia.com>, "jadahl@redhat.com" <jadahl@redhat.com>, 
 "sebastian.wick@redhat.com" <sebastian.wick@redhat.com>,
 "shashank.sharma@amd.com" <shashank.sharma@amd.com>, "agoins@nvidia.com"
 <agoins@nvidia.com>, "joshua@froggi.es" <joshua@froggi.es>,
 "mdaenzer@redhat.com" <mdaenzer@redhat.com>, "aleixpol@kde.org"
 <aleixpol@kde.org>, "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 "victoria@system76.com" <victoria@system76.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>, "marcan@marcan.st"
 <marcan@marcan.st>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>, "Borah, Chaitanya
 Kumar" <chaitanya.kumar.borah@intel.com>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>
Subject: RE: [PATCH V8 32/43] drm/colorop: Add 1D Curve Custom LUT type
Thread-Topic: [PATCH V8 32/43] drm/colorop: Add 1D Curve Custom LUT type
Thread-Index: AQHbnqqz2YhtxDgq7E6gFv3ZntqEdLOkXCdQgAACfoCAAAPEoA==
Date: Tue, 15 Apr 2025 06:40:09 +0000
Message-ID: <CY5PR11MB63449DBA54519766E345CADAF4B22@CY5PR11MB6344.namprd11.prod.outlook.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-33-alex.hung@amd.com>
 <CY5PR11MB63441E057180C043C51230A3F4B22@CY5PR11MB6344.namprd11.prod.outlook.com>
 <fzuE3KXuocsKA0I9kWXruyw7IVbw3jwH2yeh59SfE0Qb0SGxa29rrj9X_XgNCdmj1vWgxLO619xyJY3r5R3hsZK6ElIkTvbyNfu40x1SiZM=@emersion.fr>
In-Reply-To: <fzuE3KXuocsKA0I9kWXruyw7IVbw3jwH2yeh59SfE0Qb0SGxa29rrj9X_XgNCdmj1vWgxLO619xyJY3r5R3hsZK6ElIkTvbyNfu40x1SiZM=@emersion.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6344:EE_|DM3PPF5217261E0:EE_
x-ms-office365-filtering-correlation-id: a70e7056-a480-456b-b13a-08dd7be85dfd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?aVVESFI4a2RHdkVwNjRRT3hqOEl1Wm9EY3IvQ3F3OWxCNG54alErZXBodm94?=
 =?utf-8?B?YWVRSmZKcGpQVmZ6RlMzSXB2OWg4OGJIMHBEN0puQWU5REJCRHZjOG9FaEdN?=
 =?utf-8?B?NCtoNGZHbWMxWGFWQmlCTTRzb3RvcjA4WUhrUDAySzQyd0RVM3pzbldzR0xJ?=
 =?utf-8?B?Qk5xVm5zMzBGRnVwb3BWeVlPVzFhVHF6djhzRkVuM3U0LzBpUjVNVHVDamhX?=
 =?utf-8?B?TkRaTERCWHhJYWZ4OXlKTlBPSkVxcVhXTjJyQnhQY0hwb2pJR0EwSTJKYjFY?=
 =?utf-8?B?bm1GUW1xcHZSSUdwUWQ2bDlMYW9WYWN1ajlCZnBIamsvV2dOZHlMZFlLQ0tu?=
 =?utf-8?B?Y1RrR1FKeGt3QzQ1aW1leDBhUWdkOTkvYjkvdStFcXZnYXdQUCtCYUMvcmRE?=
 =?utf-8?B?WFJHbE02VW1QQkhVSkE3cGVDdElUMTVtbGQ5SjJYRnR4RVI4SURoNEN0Zmc0?=
 =?utf-8?B?V1pBZzl2Z2dZMXFqRjRsYkxXNlkwRjlJL0J5eS9lYTA0ZURFeFZkTTVZam9k?=
 =?utf-8?B?Ui9TbVk2TWpHbGZ2MFJjc0FGNmtEdDZCMHRnQWovaUdaVXU5TGFPckVTcW5j?=
 =?utf-8?B?VUV0R0F1anEwa3lHVzV5SnhHR2Z0YlVDMVNsREtXNDRvSTBNeUNCeGhrV0F3?=
 =?utf-8?B?ZE5RTTF3cEZpQmtsNUM0aFlJUUZYOVhRYU9IK1lPU0xLL1RzbmFZYWZLMDNp?=
 =?utf-8?B?akZaYytRT1lzKzZiVEhocEpDR3Y0MWFxOUxHWE5oU2RFalBwZDZPazRwN3cy?=
 =?utf-8?B?UG51Smo1M2pMUjFpRXovdml3eURnY1dVajB2ZUZEd0gwbUxTeEtvMjd1ODhh?=
 =?utf-8?B?dFhQZUZBNFg3QlRoMnorSTFkYi91Znp3T2VkcUx2TW9hd21BQkJCc0lHOXR2?=
 =?utf-8?B?TG12ZzlxRHp0eEJiaEdNMEZCTTV2Ujd0LzRlZ2xKYmlwZkMxd1RCd2s4WjJP?=
 =?utf-8?B?a3dZaDRrejB6V20xd3cxMERUSzJlQWVEZ1BGblFkSUlUL1QraWRSeXZkYmt3?=
 =?utf-8?B?ajRVS2NKMkkwaXIySDVjS3FoOTlkU0hha21FcmRIanF4TDBma0h4VUkwSGtQ?=
 =?utf-8?B?UHhLcDdlN0UzTGxTZDhWcHlUeERXS1dLRmN4R0s2VnAzc0dGSFRzQkYxbXNK?=
 =?utf-8?B?NXJMU3gzSWFqQ2R6aGhJYTlWaUVMbnFOVmRRVThOVTUxVC8xUi9xWUFDaU1N?=
 =?utf-8?B?ZFdqS3NTR0JzWEcyUUdFY25nN1dSZ1JuVFhJQ3ZYWm1JbXJPMkNxS2sxblBq?=
 =?utf-8?B?Q0l0ZXhLbmJSTENXREQ3K3RvdWp3L0RYaS9YR3RBSTRzN0YrVWEvbFZNaTJX?=
 =?utf-8?B?Z0QwUVBmSVVGbjJHQmowU1N4YjAyOENKV2tZTVVyMThOWHVJY0w1Vk91bU92?=
 =?utf-8?B?S2JDWmgwa3dqR3YyZmJwVTlzbnVZekRQYXd3ZjN3SDFSYXdhS3NzbU1OZEtt?=
 =?utf-8?B?blFQZUtBaHRCazd5OEZLUWxGUS9JbmcrK3hSUzUvR1Z6Z3MrOEIwM3ZMc1My?=
 =?utf-8?B?VnNsOW8zMStiT3JDM0M5czB6TFdRL0VDelo3NUtrWUpvTGI1d0lHb0RtTjZl?=
 =?utf-8?B?Wno5Q1I0NUJHUnozWHlmUEdSeTU5RFpxbEJ6YmREam9MVU5wUmR6ajZXd1dL?=
 =?utf-8?B?aHBScitvZnIzbDYrdm91c0RPRlFlMk5FamE2Wkk2YzZ3M1RwNUxLTHRWUFI3?=
 =?utf-8?B?K3lSMUpjaGhKc3Z5OW9ZTmR5SzdlNFJ2U29ObDlNUkg3WTIyaXVjYm9VTk9J?=
 =?utf-8?B?MUZLRFZZZVhZTkRSdjRQdnBsTTlkRkhSMTFtNUpobDgwSUd6ZUE5ZFNtV2Ix?=
 =?utf-8?B?MmZONnNlVjJzR1ZVeDhkT0pBaHF3TWl0OHVRU2hIVEQ5OXV0K0RPamF0N0J1?=
 =?utf-8?B?UUJnNUpGMGtFd2NQS3FKVUVnUG1mRzVtUjA5VERIWUJrWEVRN1pNLzlRRXh5?=
 =?utf-8?Q?HhXu4yS05PY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6344.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWI0RkJ2WkZVVHYwUmcrOFBjaElqM2UxbEdYdmpzOHhqR2tQeWtKNEdCeUFo?=
 =?utf-8?B?NnFreUpxeGlWaDQvZk5UU0IxamM4UTl0Vk4rVzlOcWVzR1Q2Y2M4ZXo5WVM4?=
 =?utf-8?B?c3YxWWp3NExDeEROYUFwc1RpWUV2L0dCM01DeEptYUlhUjUyQy9IaGd5UHVl?=
 =?utf-8?B?Mm1FOGtwQ1Vmcm13Ykd1alhlbDBFYUJKQ1ZZZmJxNEFlbVEyeEdINEJjSzlW?=
 =?utf-8?B?c0ZmeFJHOTFXUmlkUytwQmNkK1Z4RE1zd2x5ZTlnY1FVcllTUXgwRU5weEdS?=
 =?utf-8?B?aFZKOUc5MlhLb2NZYlowOGE5TUh2MHdzbVRSTlRHaC9aV3ZHSkswY2RHWHV1?=
 =?utf-8?B?YjI3WVd1MzAwYStidEZ2Y3gxZTVEcXp2cVdLaHBUdDRTNW9TUFNVWXdiZUZN?=
 =?utf-8?B?NFdibkFSQUtBbmprVTQxV3R2ZTZQNncvbE9CT21kUFd4aEx6a0o1bVNNMG5V?=
 =?utf-8?B?Yy8yMm1oSURPSThLNHErbDhETmMvbVYvd0s3d0duYnVadmNHV29UVExSY1hu?=
 =?utf-8?B?Yy9JbUhaeHZ1NXdQbHJDVTZRZk1zMVcwbTU5S2wyRlUvcDZ4ZUdGUEl6TVUv?=
 =?utf-8?B?V0UyZDZQc3MzTzRmQkFmMmQzaFZwdTNpaExoSGEvcG1JOHUzSHdoUEhzdDlh?=
 =?utf-8?B?YklScUkxRGtZWUwvSllpcXlnUUhQb2poemZjOTB1eXZCZCtjL3llQ1BsR0Qw?=
 =?utf-8?B?VXU3ZGR4ZXRVTkRFNzYxNVJxbFZsQ0NNWGRoc2NQUXJ4djdBS3llV0hra3BI?=
 =?utf-8?B?cnl6clBoditsMzVZakgyVFJOL0w4NnVKUEg4d3lxMGZxVDNzRHNtaDdVbEh5?=
 =?utf-8?B?OGN4SVVwV0E5bHU1K0s4bmdIQm4rNmtMbFJUTzBaTENGMnNZRU15OUdDTmV2?=
 =?utf-8?B?MVRLd3V4Z1Q3Z3YxQnUvblJSOHd5RXpHTmNXbzdVVE9lbkNOSElOSllZWGNR?=
 =?utf-8?B?R3UwbGdpQ2ZzeG4veGtIM1YxT1U4Q2ZzZG5Jajhxc0tYRUtReFd6elRqUm9R?=
 =?utf-8?B?NkJWOGhJTkhXYlJaYm1ZV05zT3dzQVA2NHE2enR2ZWIyUVBkNzBmOXlnSkZv?=
 =?utf-8?B?KzFWSGpVWmp5Zjh2STF3bjVXWkdiMytkWFlUUHduMStuMDk1RDMvSEI2Y0U1?=
 =?utf-8?B?alNDSkdFaGRWY1h1NlQxVWJZd3AwNWNodVVVbU5uMWdnd2RtT0hIbUdBYTlC?=
 =?utf-8?B?RzRTZmh0MFJyQ0liSUIzazE1YUNxeW9Ha2RZSkNTZXhFUDc2cm5GeXIvYWhm?=
 =?utf-8?B?aTE3MXhlbzh6bExnSzY4ZU4zWEVRMXVRZ0FQMkFZRXFLZjZydGd0NWNvRFJN?=
 =?utf-8?B?R2pkRXlDaXdyTkRIL3paUXVNWkQraWlnTmFZS0tHcHYxbkh4RWR5SThSa3pm?=
 =?utf-8?B?RnVVNTZhUktrUktFd0VWT1lvUWJiRyt0V2JNSnpPdkdQRk04aTkwRVFkTldZ?=
 =?utf-8?B?TTZSZTFjSnRlNHRnaU9RSC9iWXExL202SjM3UGMxNDhtTGRiUmUxQ2pYTWJH?=
 =?utf-8?B?TXd0dXdUNjJSZWlJSEFqRmsyT05MYllDVnh4NG1US3QxMEFUWEl4WGQ3bEpC?=
 =?utf-8?B?S0plenhlOWZuYUt4NktYbFA4WnI1U1lMS29wQmhEcFBlMVN2SlNyaWJNL3Mv?=
 =?utf-8?B?UzB4TEoxeHR4azY4Q0xzYjczcUpKL1pKR25ZbXhoK0Q5cXBORncwcTFLRlNs?=
 =?utf-8?B?THl2UTQ3NmVuMTlSWDdDMG82VzUwdWpGRGtEYjdZT0Q4TWxEeFJyOXNkRkp3?=
 =?utf-8?B?ZXdTWkdJUnhxZlZxeGk1V0RWVkNYaWV0eWh2VGNuWERLWXlEak90OTlkRk9s?=
 =?utf-8?B?WG5LLzdaeFZmRHpqQkFkeGU4WHk5WWZYS0ZtTEt3eWtNVXdzR3kwejVWWUpS?=
 =?utf-8?B?eWZ4U2t1MlVDMWw1dVJRNktNMkJzZ3BXMWxaRzluWURiRmdDcmdCMU1ubE1B?=
 =?utf-8?B?WUw3TXI1NkVQMXkvWXdYSUI5SmhscVIrYVZ5VmJFQlMycmR5cE9VRTZaWTNv?=
 =?utf-8?B?T0dJY0Z6NzRUMEpSV09Yb1FRNzI5ai9OREhKVEFpNE1SU3pUUnNHakNUYkRY?=
 =?utf-8?B?VTJyc1d6aVBoMXdhcXU2YmI2blBRSHN3ZTdoaTJVOGVIWWo1T0dmaWtwS2xj?=
 =?utf-8?Q?FBCLwB5IhzlweyCkWpARUY61L?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6344.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a70e7056-a480-456b-b13a-08dd7be85dfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 06:40:09.5590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VfTJogqWLnTVG8kVlweZwmQmW7evmhEWB3K1aoSOPYdHVpHefzFzV2hZOlGfKqHa+t33WyncMJnYtZQBQn0lKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF5217261E0
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2ltb24gU2VyIDxjb250
YWN0QGVtZXJzaW9uLmZyPg0KPiBTZW50OiBUdWVzZGF5LCBBcHJpbCAxNSwgMjAyNSAxMTo0NyBB
TQ0KPiBUbzogU2hhbmthciwgVW1hIDx1bWEuc2hhbmthckBpbnRlbC5jb20+DQo+IENjOiBBbGV4
IEh1bmcgPGFsZXguaHVuZ0BhbWQuY29tPjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsgYW1kLQ0KPiBnZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyB3YXlsYW5kLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGhh
cnJ5LndlbnRsYW5kQGFtZC5jb207IGxlby5saXVAYW1kLmNvbTsNCj4gdmlsbGUuc3lyamFsYUBs
aW51eC5pbnRlbC5jb207IHBla2thLnBhYWxhbmVuQGNvbGxhYm9yYS5jb207DQo+IG13ZW5AaWdh
bGlhLmNvbTsgamFkYWhsQHJlZGhhdC5jb207IHNlYmFzdGlhbi53aWNrQHJlZGhhdC5jb207DQo+
IHNoYXNoYW5rLnNoYXJtYUBhbWQuY29tOyBhZ29pbnNAbnZpZGlhLmNvbTsgam9zaHVhQGZyb2dn
aS5lczsNCj4gbWRhZW56ZXJAcmVkaGF0LmNvbTsgYWxlaXhwb2xAa2RlLm9yZzsgeGF2ZXIuaHVn
bEBnbWFpbC5jb207DQo+IHZpY3RvcmlhQHN5c3RlbTc2LmNvbTsgZGFuaWVsQGZmd2xsLmNoOyBx
dWljX25hc2VlckBxdWljaW5jLmNvbTsNCj4gcXVpY19jYnJhZ2FAcXVpY2luYy5jb207IHF1aWNf
YWJoaW5hdmtAcXVpY2luYy5jb207IG1hcmNhbkBtYXJjYW4uc3Q7DQo+IExpdml1LkR1ZGF1QGFy
bS5jb207IHNhc2hhbWNpbnRvc2hAZ29vZ2xlLmNvbTsgQm9yYWgsIENoYWl0YW55YSBLdW1hcg0K
PiA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT47IGxvdWlzLmNoYXV2ZXRAYm9vdGxp
bi5jb20NCj4gU3ViamVjdDogUkU6IFtQQVRDSCBWOCAzMi80M10gZHJtL2NvbG9yb3A6IEFkZCAx
RCBDdXJ2ZSBDdXN0b20gTFVUIHR5cGUNCj4gDQo+IE9uIFR1ZXNkYXksIEFwcmlsIDE1dGgsIDIw
MjUgYXQgMDg6MDksIFNoYW5rYXIsIFVtYSA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPg0KPiB3cm90
ZToNCj4gDQo+ID4gV2Ugd2FudCB0byBoYXZlIGp1c3Qgb25lIGNoYW5nZSBpbiB0aGUgd2F5IHdl
IGV4cG9zZSB0aGUgaGFyZHdhcmUNCj4gPiBjYXBhYmlsaXRpZXMgZWxzZSBhbGwgbG9va3MgZ29v
ZCBpbiBnZW5lcmFsLg0KPiANCj4gSSB3b3VsZCByZWFsbHkgcmVjb21tZW5kIGxlYXZpbmcgdGhp
cyBhcyBhIGZvbGxvdy11cCBleHRlbnNpb24uIEl0J3MgYSBjb21wbGljYXRlZA0KPiBhZGRpdGlv
biB0aGF0IHJlcXVpcmVzIG1vcmUgZGlzY3Vzc2lvbi4NCg0KSGkgU2ltb24sDQpXZSBoYXZlIHRy
aWVkIHRvIHNvbHZlIHRoZSBjb21wbGV4IHBhcnQgYW5kIG1hZGUgaXQgc2ltcGxlIHRvIHVuZGVy
c3RhbmQgYW5kIGltcGxlbWVudA0KYWxvbmcgd2l0aCBhIHJlZmVyZW5jZSBpbXBsZW1lbnRhdGlv
biBbMV0gKGNhbiBhbHNvIGhlbHAgYWRkIHRoZSBzYW1lIGZvciBBTUQgY2FzZSBhcyB3ZWxsKS4N
CldpdGhvdXQgdGhpcyB3ZSB3aWxsIGVuZCB1cCB3aXRoIHVwIDIgaW50ZXJmYWNlcyBmb3IgMWRM
IEx1dCB3aGljaCBpcyBub3QgbmljZSB3aGVyZSB0aGUgb25lIGFib3ZlDQp3aWxsIGJlIGFibGUg
dG8gY292ZXIgdGhlIGN1cnJlbnQgb25lLiBMZXQgdXMga25vdyB0aGUgcHJvYmxlbXMgd2l0aCB0
aGUgcHJvcG9zZWQgaW50ZXJmYWNlIGFuZCB3ZSBjYW4NCndvcmsgdG8gZml4IHRoZSBzYW1lLiBC
dXQgaGF2aW5nIGEgY29tbW9uIGFuZCBzaW5nbGUgaW50ZXJmYWNlIGlzIGdvb2QgYW5kIHRoZSBj
dXJyZW50IG9uZSB3aWxsIG5vdCBmaXQNCkludGVsJ3MgY29sb3IgcGlwZWxpbmUgZGlzdHJpYnV0
aW9uIHNvIHRoZSBnZW5lcmljIG9uZSBhbnl3YXlzIHdpbGwgYmUgbmVlZGVkLCBhbmQgaXQgd2ls
bCBiZW5lZml0IHVzZXJzcGFjZQ0KdG8ga25vdyB0aGUgdW5kZXJseWluZyBMVVQgZGlzdHJpYnV0
aW9uIHRvIGNvbXB1dGUgdGhlIExVVCBzYW1wbGVzLg0KDQpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMjk4MTIvDQoNClJlZ2FyZHMsDQpVbWEgU2hhbmthcg0K
DQo=
