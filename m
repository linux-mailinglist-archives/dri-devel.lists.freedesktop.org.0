Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D7EAEB7BD
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 14:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED47D10EA21;
	Fri, 27 Jun 2025 12:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B4NTl9f/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8488110EA17;
 Fri, 27 Jun 2025 12:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751027551; x=1782563551;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=htlLKp+IE1ugHq7G/RErb/tSVatr4/C7tDBGB7wnxWI=;
 b=B4NTl9f/TJW1lWQz4+frJ+E0NeitT4/iREL4iX4KcG5ZFFvYSMzw+OXG
 fwDpnkQ/Cs5ZAlWZ/qV3Zj2w86xYn90WFqt++XZAk1EfK1l7hAUvnQ1B3
 ZOm0Na/BI71ADBg9goB9Pi+956Q5Qct+WGf0fOvKtL67oWncVEgnix/uf
 MnYUn3EERg6PpXdOYvpoq8vPayC54CFP3Qt1jhVDJ43k8IDI87qS0Mwxj
 hRSKy89rxboefodz2PeC1BdTHjxbwL3dJSUCkPOPz9BFRtQl2NIXBsWr3
 mAAdqFunwD5YTKBl38HiQcUCAKjfZlmJZ9KRBDJvBK0RqhwgwHj46JNoH g==;
X-CSE-ConnectionGUID: azd1lKenTaehLyRVrQDqOw==
X-CSE-MsgGUID: 6BvUEgoeRC6HGhMdlcfsPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="63936807"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="63936807"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 05:32:31 -0700
X-CSE-ConnectionGUID: Ct9uVfZvQD6JRbyyzk8KGg==
X-CSE-MsgGUID: cLTZL3AqRyyL4q3n+XNUGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="176475172"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 05:32:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 05:32:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 05:32:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.81)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 05:32:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UP4emvpd5Z1VABsgk4b9wBufSibfvgRQr4rka1xoeTCJi0CgVb/ANy3ANT2EF1B2s4Slw3lCBuLEuJAWkb8u10ancp7qXT+nHeJSuFpqHaVDYM80LfTfO4rzudd6pIg26SsiMv4Hp7sS0tVGyK58390siaW2ziFanEHWriLnDcgDk8RsHD+aeDd51Aaav/iV+iNdkF2Bp+zO2FfXYlZ7HmZz0NSHEGegbvvFoU8Vq3E8J4hkBzqolgAOTzQ0RPSwOJdkRLdZUFPjiybINFX0DfRXog1t+6Vehc6Trq5DoESe/D1WlnLszY2xH12pjCMNUODkJPXXOUYeBVMN8IoJ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HYlzGw9CsBlmQBjfHisWMeMlxwKq8lS+oTGhYoNSR0=;
 b=ZkzDBsWcdoQmwEelw2x5bLfvo/zI/MeN5lx13wtVTVfJK0X+5aNr6fSrDCSJt50qvhiBMQA31dKkPwYJacn5YM9usd/cmv2k2brqd9EyQBo4AS4XYc3iHAKuKIiAB2FpQ/JtG49ijnGVlGAjwhQXGuGovi+MOElip8GPSf+bApJpod1JI0EjuVU+1Ew4HK7w4TZY+6UgXZvT9FkRaFhhWh1471k4S9F6Nt3ZF078xobnXDNM7aV9QIY65WypRw9Zx1eQO6x725+GN7qhxYBTFNOhHts9a8Fh/CO5vY42q82hqlv04XGr2xvo4b6BbYeIIIN8Jg7vKAsfmU/7UZ1CjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SJ2PR11MB8497.namprd11.prod.outlook.com (2603:10b6:a03:57b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Fri, 27 Jun
 2025 12:32:22 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%4]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 12:32:22 +0000
Date: Fri, 27 Jun 2025 12:32:13 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Jeff Layton <jlayton@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
 Qasim Ijaz <qasdev00@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v15 5/9] ref_tracker: allow pr_ostream() to print
 directly to a seq_file
Message-ID: <gzivdr6uvr4fps7uu2wl7ti63lnevmlekww6lbqfvyp4crm424@srxb7pzsj3fi>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250618-reftrack-dbgfs-v15-0-24fc37ead144@kernel.org>
 <20250618-reftrack-dbgfs-v15-5-24fc37ead144@kernel.org>
 <kd4urnnwx22njawv54ppewljkwlh2usqa4iengp64bpxyevpad@26vjqeu3dvn3>
 <61c653aa5f298ded89f35eef76374b3138d17b02.camel@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <61c653aa5f298ded89f35eef76374b3138d17b02.camel@kernel.org>
X-ClientProxiedBy: DB8P191CA0009.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::19) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SJ2PR11MB8497:EE_
X-MS-Office365-Filtering-Correlation-Id: 34593276-2751-495f-55b3-08ddb576aa13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXdtZzBiZ1d4dTBSb1pjWk9KNFE0Y0NlNnNzcFhZUmRHbjF4SGpSd2RiY0hT?=
 =?utf-8?B?ZUF0cUs0bXpUZTFNSTJUdkUzMGZXT1F0TzVWVmpWbExtQ25VcWFPYytnMmpy?=
 =?utf-8?B?ZkM0TnhnRzJHMFk3cjU4MmZjOW55bGJKRlRvY25rU3dZVWtaclB1ZjdZaytv?=
 =?utf-8?B?TGVnd1hmeFlkS2tWM1dFR3QvSDMvVVRYVElkMk9XT2ZoZ1djZUtNVkQwYWEz?=
 =?utf-8?B?WTIwd0tYV2ZpYXBlS2Z1NlJiWm02WUhXRlkwanJDOWxucHQwTHBac3JFSlJl?=
 =?utf-8?B?SjlnSm5zcmszYkVsTWlCQVhiN0VuYmQrdVpZVitZc1BuRnN5cWpadTJZSXA1?=
 =?utf-8?B?VytCckIrRnpidmJFQlFHcndDeGNKNVhpSVp2VTF2a2V2eXVINUhiWlZUWDV2?=
 =?utf-8?B?K0t5TU1vb3hPVHNGNlhaRTd2cVNWWXdPVDBDOUJJZVJpZ3FwY3ZMenBFcTh2?=
 =?utf-8?B?UStwL2VqRExPUHl0cmRHcFZWSEl3Vit2dmVZWW4zZVpxWVIwMnIyaDhIZHVK?=
 =?utf-8?B?NGVaNHFjSHp4a1JabDdPTzFqanp2c0J5OTFHSjI1TjBERXdmRlZpeGVnOExl?=
 =?utf-8?B?Y3NqVVczQ2FuL3NiVDg1Qmp6OFhJZTJ5ZnU1N01qSStHeVFxV1M3Q1h2bGJj?=
 =?utf-8?B?bGl4NVBReVdwWlJ1SzlLazBQODBJbUw3ZzNQVDBWK3lMQkF3ck1lb3BIUFVC?=
 =?utf-8?B?RXp3eWNodW1JL1BWUThMdHEvaHlhQTF5aWxaSmtWRmdibXZINWVWV2lPZnV0?=
 =?utf-8?B?YjlNNGFmUWxuNDl2TThQYnlJTjhWcTVxM1dEV2VZKzlGeEhxd0UrZFZ5ZmFC?=
 =?utf-8?B?TmlqemlTd1VNUjZLazQ0RGRMMzkwTFRVSFUrWUc4UmhvOEVyYUJpOXd1dHcx?=
 =?utf-8?B?WFpydjN2WWV0bEdRb3hESWZiNm9nVG8vcHBLUjVGRVhuaGNpNlhrcm5Cdy9h?=
 =?utf-8?B?U0Q3WXJGY2I4a0diZjhjVjBXdUZOVWs2elB2SnREQ1d3ZG9DRElaVnFDTVRp?=
 =?utf-8?B?NzVXUkxKajJlcHVFbHQ1V3dJa21IQnVGNHRQUCt5VElaQlc4enZOd2VrWVFr?=
 =?utf-8?B?NEthNzBSN3RjSzhaZ0NjdkJKK0VEL2w5N012MFlKb2JMYnNWYmpDM2FrdGRm?=
 =?utf-8?B?U2xCU2IwWmlkcEp0ZFBFRWgwbEF1eUd2d1NpNzM2cGE1Wms5UVQ0ek1HTWoz?=
 =?utf-8?B?YnBMaENDaWQwcWY1aGdlTldvbnEzOFQ3a1drWUZSWW03L2ZJNjUwYmcrU3NR?=
 =?utf-8?B?Y2luRjVVeGZUc3ZyZUlDeXJqcnc4VjF5Qit5dVNqNE9KbmJqaFQzaXc4QlU1?=
 =?utf-8?B?Q0ZPcXRnMTcrRngzSUpnalNUWjU2TkJaVG5CVmNwL0Z6aUwvZ3Y0elRmVWxO?=
 =?utf-8?B?ZUU4ak1zNk9RdElxWGI5UGFISDJPdmJoWFVlVms5NjlkUzNiR0w4RDZUK0li?=
 =?utf-8?B?MGhiZVhZL2I2ZFdacHN2RlhvUHZhYTFjRWpWSHNmeEw4NUxWR0ptTVBkYitH?=
 =?utf-8?B?K01BdjRxbG9RT0NXeTlhcUZRbUVVT0FMRmpqdmVTR2wrQXVKbFNSelJSd3hj?=
 =?utf-8?B?N1pOQlJJdXRTUU9kbWpHRjJZQWVudUlRb1JmUThKT1lWdmUvUHRMZmhMaHR3?=
 =?utf-8?B?U01CVXplNXk0MDNScHRUeWdjSHBnUHIvQm1GdmYyQjJlZTRjcGFUR3dHM0xU?=
 =?utf-8?B?RjFPbk9YbkJaaDJvWHJ1U0RQV3M1OURqTnRyWnVYREV0WnA0S1Vua0lxa0du?=
 =?utf-8?B?emJqRUVIVDFoYkxSUWIweWx0d25mOGtNNE1wQWVEdUxaY21ORG9NcW9QanFh?=
 =?utf-8?B?YmNQOVREcUxQN29kblh6WWVNMWhFQ1Q2bWk3VWJDU21BUVZMTFR4ajRDeXEr?=
 =?utf-8?B?VjVpNlpuTE5GS3ZIWENBeGlpNkl2TlRIVVBjOG4wWEdvNHFSMnhiNEc3ZVRD?=
 =?utf-8?Q?SNdex98Z7R8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmExbGY5YnMvWmQyYVlhS0Y0THh2ckdiNnhsMzk4dGxkTXVRbVRQa0VEa0h2?=
 =?utf-8?B?YUE1ZXpsOUh4eGFwdnRHZm9US0NJUzlybkl0MytJN3FmOU9CMlRGOGJvNkZM?=
 =?utf-8?B?SVc2dm9tOGxZaFJHNllKZXcxdFJUUm5uRlVOcWw4aXlYaHNXYzNVRGFXUUJv?=
 =?utf-8?B?V24vNE02YWgzc2orQVpWQXBnSHo3anpHRHBYcklXLzl0YW83am16MkJzQk5W?=
 =?utf-8?B?ZGlRUWNvbHN0RHZZZHhxTjhoOW0vdmdhNDZQTjFtKzA2N1lkbXluaERhVkh6?=
 =?utf-8?B?cnpnS0VMUkxYMkplbGt1Y3FJN21xMVVQWFdDY0NNcHdsb2xKa284OVMwYnht?=
 =?utf-8?B?SFpZbmFVTDh3dVcvM2tUZnp5S2VZMWlkaDB5amcwdDFXSEYzc2IwU3ZJRHNG?=
 =?utf-8?B?LzhRb0ZPeWtuUU1ENEJoK1puME9RcFZBSVF0SDZUd3NXMTdmMUdWUmhiUmlC?=
 =?utf-8?B?MnRBU1QrWFFsQ2FiaWhINHVhcURHVUNNZnNub0p3KzhWOHdDV2N1NURYeC96?=
 =?utf-8?B?cGdvUUhBQzZmVjZVN3Z4RzNCZTZKUitQZy9IRE4yQXpScGVzUU11cnBzcDlZ?=
 =?utf-8?B?aVl2N3ZHc1FvaldublAvMzNDRlJ2dGRQM0Z0VTV6M3d0WjAzYTlXVWtCZ0hr?=
 =?utf-8?B?bnMzYjhwdnF1UmxzUnJvaFdid1NyUHppWVBXTEdnV24zZzgzbEE5Q0VkZDMy?=
 =?utf-8?B?cEFlY2R5VWNFaTJFamR6TVNDL1FWUG5WTFBPdEpvZWlMWVV3d2M2NEtOTits?=
 =?utf-8?B?UERQQXR1d1RPUmZlSTIvb09LbHFlQWYwUS8wcHpmVm9GOHdQaTlha1lMbndF?=
 =?utf-8?B?SXNHUzdYVnRFR3RDRUF1aWNoekp6OUxGcWp4N0R4UTNYVGw2b0FGS3lCNzBV?=
 =?utf-8?B?K1B0Rlk5RlRmaUhTaUFSdmJIRXFIYUN6UjVTWTRPUUZwQ3hnSW5sNlJlMnpD?=
 =?utf-8?B?eHlBZHhaMndiN3djaGVVd2tETlVSV3pGL0pJci9uZ1QrWi85MitKR1g3djQ4?=
 =?utf-8?B?b2NtMURiZnczeW83NmI2WEdPS2F1eVFKME5iMlAxNGJwYWNBcXdQblEvRnNj?=
 =?utf-8?B?Yks3Vm1FVjdhOXRPc3Bmc2R1clZUcWordHhCOFdYdFVrNUZPMkQ5WkxGYktX?=
 =?utf-8?B?MDdIL0tvQWhrbW9Jam02d3U5Nm9CVUduVmNaYXUxY1V4UXBOWndabmMrQ3o1?=
 =?utf-8?B?cTg5WG5EUlAvNzlaRlVhZkgvZGF4dERaUk1EWCs4b1VzakJHeVVabjQwVG4x?=
 =?utf-8?B?US95ek1mZXpNdUZSeUJTVzZPVHk4MnFzanI5MFIraUFDL1lIT2VqMUZabVlt?=
 =?utf-8?B?aHpaRjlpSmVwZE93N29IQkFvSWhvVU9OVitscjFUdFlrbmttSTBBL1QzZlZw?=
 =?utf-8?B?aWU2QnJ2K3dlN1l4Vkpkdm42OVhLVnRjRi9mUnhUTHNNS09aVDdCTjdQL1I1?=
 =?utf-8?B?cWlSeE9tcHhnTnJVZnMwaDVnaEwzdURVUndnZ2lSYmllUFdwdG1RdXRmQjVr?=
 =?utf-8?B?NUh5NnA4Y1pOdkZmdmJDZWczaHFvSWh6emo3ek9kSjJ1TGtMU3B4OXdYbU5E?=
 =?utf-8?B?bFhKdS9UcXBkM1dUTkt4b1VsRjZjQXBNTGdBS0s3U3czSUg4NUpDcDV2VkFB?=
 =?utf-8?B?bjlZYzA3bkZYVnN1QnhPamZ5OU5MME16ZkRkUFNYOFIzR2pmUFVXU2lQbmEz?=
 =?utf-8?B?am5Yb3RpbGVHN01VNk15bE1ma0tKelo3YzlDNGhLNzQ4SkNYblpOTERwM01F?=
 =?utf-8?B?SmhQZjRHMW5jd0U4bGxjL0VCNWpuNkVESFozeVd0Q2QvS1Y2dUFJWDZXR2FT?=
 =?utf-8?B?RGVRVUxBaUVSMVREYW83a29ZellSL1czOThJc2F3NWJPeUFlSkVQVExUa0g0?=
 =?utf-8?B?UmgyMjM5L1o5aTM2dnNiVlZaaWVyMXdqakF1NUlDeXIzMmU4SzNhU3VyRnM5?=
 =?utf-8?B?M1NLOHl4UHgvTnR4R1NRZWdzL3NxS2U1SkVTVjhENm5neTBBanpVV0lTVXRI?=
 =?utf-8?B?V2YwN05HdVV3Q0RUZk9hVDdEdFdRbGJrcTRvUDZYSUxJaU9HdnNHZHRIcmp2?=
 =?utf-8?B?Q1lSV2pPM0Juam9UalVaUFlBWTdFTzZINFgzR3FwWHpZWVRPSzhDL056a3R0?=
 =?utf-8?B?ZFBwbjd5dEVoL0hoWk1RRno3SHZHSS8vUzF1TkZwY2h0aXRhMVhUdmliZWNs?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34593276-2751-495f-55b3-08ddb576aa13
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 12:32:22.1827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L0jKn6sLgpMPOAKTm8HRgwTNPdjQdatL52yjINWHluZQykMohwSx6WskfltS1GnNZUNs0++s9ffIeojZBsTgeCiTCWluAjc+ZnnPDI0YS9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8497
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

Hi Jeff,

> On Mon, 2025-06-23 at 14:01 +0000, Krzysztof Karas wrote:
> > Hi Jeff,
> > 
> > [...]
> > > +static __maybe_unused int
> > > +ref_tracker_dir_seq_print(struct ref_tracker_dir *dir, struct seq_file *seq)
> > > +{
> > > +	struct ostream os = { .func = pr_ostream_seq,
> > > +			      .prefix = "",
> > This is also a "ref_tracker_*" function, so maybe use the same
> > prefix as in other functions? I mean .prefix = "ref_tracker:".
> > Unless, you have a reason for leaving it empty ;)
> > 
> 
> I have a reason to leave it empty.
> 
> That is the prefix for each line that gets printed by the pr_ostream()
> call. This one is for the lines that go to the debugfs files. I think
> it will be redundant to prepend every line in these files with
> "ref_tracker: ".

OK, this makes sense.
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

---
Best Regards,
Krzysztof
