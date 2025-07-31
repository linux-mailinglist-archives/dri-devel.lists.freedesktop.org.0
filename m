Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AE4B17250
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 15:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF0C10E791;
	Thu, 31 Jul 2025 13:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z2ByHcij";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D61A10E78E;
 Thu, 31 Jul 2025 13:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753969746; x=1785505746;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y7dRnXzV0xOXoBT2ikgY50OPPU6Fo8WurDCCcvlanUo=;
 b=Z2ByHcijxqSjMAmXTTp7519cTK7ehesNjSUX3siQWaC6sgaiAxuU1r7x
 wxkBl6JJOPehcoxw4exYq6KAUrqUrkd30Zn2fwq4g7u2U8nLmhgCYOGrW
 fp25nAKX0c8tQvx3wBGIM7q4eKgOLNPldv4IeBIGPl2xasrsthzTHCbKb
 7Si9nK8uXVsEazYXp06CWSYlbRmuFf0BSatCQef9v81A/m/2HAeTvIZgv
 Nq0wfOzvYfh+zMY+RaQvobe8mpL/TylpwFzrLVpb9tdaP2VEvzGxrmfRl
 jtWdydYEezpBbJKjEg7OW0egG5yKy8hfHKC/ujVCctWeUh0sb0g2oIWR7 A==;
X-CSE-ConnectionGUID: 9MS3TsE2S2yoDHE2YUtFuQ==
X-CSE-MsgGUID: AT6BTg1DRBWX3cj3jKHDxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67736581"
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; d="scan'208";a="67736581"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 06:49:01 -0700
X-CSE-ConnectionGUID: 2jn7+PEcTlWGiqpJcFdlWw==
X-CSE-MsgGUID: AtAWb4IiST+Eth8Mr+iSSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; d="scan'208";a="163612414"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 06:49:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 06:48:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 06:48:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.52)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 06:48:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CP34C5qhv0ULKnPUdMcgGnVc3FJHMZT2QFzqZsAZ+yTFFanTnIfNSEJoHS57bZ1AEoZM8JCz0igASBO8d0x5Ln6NFW0Ommq97DuBO4Jdmq9lo0orK6HIaTXdp9V2JaU5/0fsvX+wkqLM1mDt1OlVQvZeoy+dAaq29MogvKQNFZAzz+6qLxgIv/nLLOdvVriVQklxICq8uQsam2gZbzWhmJC4vJMMOGKSFUzLJWO/scyer+zvxOpntr/cFiPEnz6SPp8llwt9bZdlHAUnOvgA8Zam7GbODVrpWZuyH/aJLBIv41hLdWgzwg9QfdI0NdBwbVDllYTzW2+rsEVPvIU8Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gvo5BujucQT4atqI7aGzIF2a/b2avkdREq3Y1wqGO5Y=;
 b=iGRqNF4cUQkZNS80rse6rEC2ePPrjvSGYT/NET739kYy1Pi4lB+drAuScD6GxmHRQjVvdpbkzXYpZFtIcvmy4LGGsBueu80I44npQcL6uSxC/DmM2b6lrHl9P/BO2muFPnMrH35TLQblqRoYivrPdI1uIO7ofyMbsA3e7tcwHMXL1P7hrIXdJqxPxSWCffbnBAftMOe8Zq+uka8fZfnb76n4Ix0UGEUE5W/1fH0pFkMIX95s5R21FprtUauoE6l3d5S5qhMppMW3kdyoSUWKkqtaIkRC1rIXyejW6HJ7B+jUyO5jcpklZ/Mn1Z3K/imtg0w/lAVUo9Ft0zUvF6zfHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA4PR11MB9231.namprd11.prod.outlook.com (2603:10b6:208:560::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 31 Jul
 2025 13:48:30 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8989.013; Thu, 31 Jul 2025
 13:48:29 +0000
Message-ID: <e545cb54-b7cb-484a-8e65-484feaf9cb27@intel.com>
Date: Thu, 31 Jul 2025 19:18:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/9] drm: Add a vendor-specific recovery method to drm
 device wedged uevent
To: Maxime Ripard <mripard@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <simona.vetter@ffwll.ch>, David Airlie
 <airlied@gmail.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <frank.scarbrough@intel.com>,
 <sk.anirban@intel.com>, <maarten.lankhorst@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <tzimmermann@suse.de>
References: <20250728102809.502324-1-riana.tauro@intel.com>
 <20250728102809.502324-2-riana.tauro@intel.com>
 <39095bd1-2dee-4bfb-bc87-ee8cecedebce@intel.com>
 <20250731-jovial-realistic-mastiff-2ef2a7@houat>
 <13e90893-d0dd-4f25-8541-ecfe875c52be@intel.com>
 <20250731-excellent-octopus-of-acumen-ebfd30@houat>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250731-excellent-octopus-of-acumen-ebfd30@houat>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::23) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA4PR11MB9231:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fd43c4d-d134-465c-6ac3-08ddd038ee69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0hyS1RIYW9jNjk1ZmZ4Mk1qMGpMNjY3N1RBbm1VUlRXTGxLK3RQU3hPU2Yx?=
 =?utf-8?B?d2hqL1V5eW1WUzFMMmljMjI1MVk2NlBlMks3UW40NTRqYlRMTWlsZTk5NE5D?=
 =?utf-8?B?THZKNUlGeFJGeEw4cEZSVnRDTU4zVUZ6eFdMQkRSOGNCRkdQMm92T3owRW1H?=
 =?utf-8?B?aVBPQTM4MEQxNDBpYW95WCswQnF4L0szNFRkOVJSWG5RRjFwWTgzcUVVWG5R?=
 =?utf-8?B?ZWhUYWNXZ0tGVUozY1FtNkw1WlJlVkpBZi9RU29QMnZZZ25WeG9BMWlvZ24z?=
 =?utf-8?B?VUtIT1RPTW5NSjlOUkhzS2dFMktIVmJJNG9vdk1ZcGxqR2twWHFYV3Fnbmpl?=
 =?utf-8?B?WG14U0RHV3lEWk9Gb3Y4SnBHTk5oN0hsU3BWT1BFZTRZV2QxbmVPM05pMUxW?=
 =?utf-8?B?ZVlZdzVmU2xaaUM4bGF2TVZ5RjdDOW9OLzUrcy9hRGtyRm5TM3IvOGVhT3Z5?=
 =?utf-8?B?dHc5WkNXczZ4Qk9vcjdPaWovUCsvUHp2bkVSQUFudjhGaGRQZUtJS2FKeFFl?=
 =?utf-8?B?UjErSjhwMGlyWDlteGdNQ1NmVG1uR1k2dE9Ldnh6OTZRM1cvamZjRkxnQUdO?=
 =?utf-8?B?ZThmTlNIRGJ6cFRqUWFlTGp6SElVVWZwNGU0U2JQZEMvbFJyekdSaGh0dmZG?=
 =?utf-8?B?ajh0bDBWUWNXY3RQdWFzeFZlZ3BRaTg0c3loQ3F1SkJQMEdYRXQvZUFLUUNz?=
 =?utf-8?B?V2xzSFhzUXNzdk8xMWNwM0xnaUJLNzd5L1ZpZmxSbmNDQWdnTE5YOU94UEww?=
 =?utf-8?B?bjM1VGVUTzZ0eGdZejVhOVVoTnZkOCtoaFJiajNBbEJzV2hCcE5HZFRkVlpk?=
 =?utf-8?B?TDlzMERMYlhWYisydXdOdHlVVFNGdElaTncrdXRqcDhMWG16LzJPajRncDY2?=
 =?utf-8?B?SHNKYTZqSnhsdFczbmFlWVY1bnJyVUgzaW5jSmVwRGptSDRQNDc4UlgzeGVx?=
 =?utf-8?B?MFZqRmFGMVFkVFZXamZDTWVwNE1aRHZETHhFQmh4ZjI5OURLb3NJcGJxbTNV?=
 =?utf-8?B?dVdPcDlBcW1hdThTa1NzL0tGcmlYYS9hTjFjZllDV2lpRkcwV3UwUHA2alp1?=
 =?utf-8?B?aEpNSDVvU2pWYm9ac1REeTN3ZFJadGNRWXZiMnRJaWJ0T2h0TXI0TGpOQlVx?=
 =?utf-8?B?R1R0UlJNenRYSm00eVVoOXRwUWxnc0tuVG9lK0k3U21Kci9vMUhnSEFwK3hY?=
 =?utf-8?B?N1JxcHBJb1BuWWs2MVVjMUN0Sk1CRDdCS3dyUE5tZnJtRVJkTThQY2lBWEVt?=
 =?utf-8?B?K0daN0FweWZXUlZucUZBR21rVXErV2RmZWtWNXZhRGF0ZWdRVzl3Zjc2UkFT?=
 =?utf-8?B?V3JRWXBPa2U0K0k2ZHhUZHlZcHVRdXErd04zL3FqOG0zRHAxblJPYzlTU2Ra?=
 =?utf-8?B?V2YzNWlFTGFCSU4zWjdHdnphZUxwNE43K1E2b0h3VnVKeUF6ZFJFdUx4eVpT?=
 =?utf-8?B?K04vRDk4UVlXLzllQWdTTWR2b1MwdjN2cDBxTmdsSDFZTzA5UFNnbG9lTjJz?=
 =?utf-8?B?Z05FUVptRWVMaW5YUEM0OWtwZm5vaWJJQm5MK0FXalE0cXdpU1FoYW82dzZk?=
 =?utf-8?B?a0h2M3pnb25QRWQ0dVhjcEtJd3ZkRHF6bWRSbDJ6cEdocDBTRGVWSXp4UGpC?=
 =?utf-8?B?NGJ1MEU1UXg3OGZTaHFYLzR4ZGFZc040U01iWVMwTTdrb0NwZXROVzVVME5t?=
 =?utf-8?B?TUF1MEEyRmppSWRINGlTQlBWNlB0V1Y0OUE0YWxYendnR1p3Ymt3OWhmRzY5?=
 =?utf-8?B?MFJKNmN4eFRFUFE1cUpqbTdVRlhvaGV2QzJLdEFhVys1L3dNUGtQd2RXbU82?=
 =?utf-8?B?bjdWMHlPMUFvZjYreVhoZUxTdjFrVHprbzFYTWxuanQwUThsRHA3N3VNdW1j?=
 =?utf-8?B?OUJoSU1ZYXU0TWV0N2JncUp5UHY0dzZ0QWZ1c0VDL1JadXdJcUZwS01HV1Uv?=
 =?utf-8?Q?/Hy8RUYOD5M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnhTQk1CVnJsaUFIRkhDcHFyOU9rVVFlQmVBU1JXUGhMSmd3QThPd3Nnd2k3?=
 =?utf-8?B?U2JVSDRkZS95MEJZWGEraHBHNlNQa3hIbE52VWVwbFBhMncyNEV1NTZOSnB0?=
 =?utf-8?B?VVVFVTRZTzZXMmxwNnQ4VDJ4UURyVHVxbGU2bjl1cTNmNjNydURjc2pqWEZ0?=
 =?utf-8?B?eURxREE1N0NEaHc5NDhNS3k0WVAwYnpnM0J0cDFiVXd6d3k1djRDTC9mWjYx?=
 =?utf-8?B?dEZJUzlhN0RERTAyNFdTcWMyckpHWStUTnlKYzlRYnAxZ29veEx1TFFJQ2N6?=
 =?utf-8?B?S1lWcVNsMUkzdDdSYXNUZzh6ODByRmE2MmVZZmlaTXVyUGRRbzRlcUhPMHB3?=
 =?utf-8?B?RFdQMzF0ZEpCejNvTEpNdEI0bXFSSi9DSndHNWFCMnFyZWdIcEpoMk5CT0NV?=
 =?utf-8?B?WEVCbDZjSG93WEdLZ1JnNEVaL3ZZTkMvQVczVnlUbTUvNEVaQnQ5dVEzamc1?=
 =?utf-8?B?L3luK1d5SExjcTBBSmZoaXJGN3hFN3J5Q2NrUmg2M0dnOE05Tkl4RVlPeWFN?=
 =?utf-8?B?RkhKVW93bVRmYjhvOENNb2pkMnNZQVlXQjd0Q0lNTjFsb204eCtuUmFrWWgy?=
 =?utf-8?B?SE5tTzREbWdONkN6MkhuaHR1eUtMVDJnL2JsK0pGcy9lVnBFVXVZbEZ0M1hF?=
 =?utf-8?B?MEhBdVc1SWZxeVJBVnUxRjE3RHFpSXRhN0o0V1YxRjFON01hdXgvOElKcGI3?=
 =?utf-8?B?VEJYUlVZZVZEQ2xrTmM4UFc1cFdoSzV0a0hqSGIyd2NRRXIrbGpzcDFjc3l6?=
 =?utf-8?B?a2tWNFZIMFFNajZBaWVjK3VoYit2Ry9yeGhDRHFhT0t6SHg3VzR1TEo2ODNv?=
 =?utf-8?B?M0tGZnpqMTlKYzgrZ21WcjNKa2MrMFc2UHdLWEgvakZ0QWIzT0l6dDZTSGR6?=
 =?utf-8?B?MjlQeGN3UW9rV2RMR1Z2SmF5SEszdWtnVXZ6U2NUVzA2a2ExWTZCS1pFQ1Fw?=
 =?utf-8?B?WE5DMW4wR0ZtS0wwQTdoeG9IVWlPSUpjejhSL1VzL0xBaDI0c3JGbEZZQXlL?=
 =?utf-8?B?RVZha1ljdlNhUE5aZFhGWTZPWU1ycTAxZ3ZHbHJCZE1ua2wwWk1hUWtIQzhG?=
 =?utf-8?B?SVZCK1ZVM3ZNbTJZTWRuZng0SUh3QnUzekc1d3ZMMVdGaGlnTWR3alZLWGJV?=
 =?utf-8?B?ejRiL0pNeFBIMVJ0NUhKVmZ5SDVhbTB5RFR3VmRCM0NrRnN0VkhzSWgwalZK?=
 =?utf-8?B?ZVMwNDk5UjdZVS96ZEZ3S0k1M0hwcklTWU1jaHVJTXJGakFvd2VhbUg0T1lT?=
 =?utf-8?B?UmpxNVNnMzJ2aWZFRmpkQy85SDByTGREK2RoZE1kd0sxUjAwQ0I0ditHUnlP?=
 =?utf-8?B?QmJzYnd5S0pvQ2YxZlh1c3pHc2xsYWRWdGJyYzJBTzZERjZnMk8wUjhpTEEz?=
 =?utf-8?B?L05BMCt5RWZPMk9DbTJkT0FrekloMXNpem1pNWc3dEJtVTc4MTd4TUlUSUh5?=
 =?utf-8?B?NEQ1QnNxTWZ4Yit3WWlSY3V4SnlkenlrN1JmaEJ3U2xUVm05aHFYbk51cTJz?=
 =?utf-8?B?bW1EVGdkbWwzMWd3V2dVMkZxOENWSDVZVmliVmZ3VmlxSU1JZlhsY3hocHpl?=
 =?utf-8?B?YWJwRExtUU50LzFQaGV1VmMvQk11Mms3WGEwTkRQUktSNlh0SnhwclBMWkNo?=
 =?utf-8?B?WHB4dm9oemw5OUxXK0ZLMGFTWFdVMmo1d0xSZU1DTXVpYUlKRzVBTVJlbnpX?=
 =?utf-8?B?WU5kckU0UEt2UWhncGJyOVc0QjhwY1hMelN5NkgvdUJGYnltck9ncnlPK0p4?=
 =?utf-8?B?QzI0eU9EQTN2RFdmRW1IR0pyQXphMENESGRoM08rc2plWkJyNk5vOXQ2QjJo?=
 =?utf-8?B?Z1dOSVNPWmt2T2hiQjRiYTh4b2ZzWkU4OW1XZXdPQTBBOTFjd3pWdUU4eGZP?=
 =?utf-8?B?UXovWTVzWEpjbFh6MlZTQUhVK2p1NDR4TkJOU1ZpbVFvaU0rQytBRHBSM1da?=
 =?utf-8?B?ckFXYnBTZ1RuSXlCMThHRTZRUExPd05JWXN4Y0ZpNU1rTmhpOUpKcUQwd3Jw?=
 =?utf-8?B?QUt0Y1VFSG9NUXhEVUZDY0lHUW5iQ05iMTRIOWpRUDV3N1BncXJTZEc1VG55?=
 =?utf-8?B?OEcvWTUyNWp6VUJ5bUtGSU1FcFJ5U1RPRDd1ZEYxOGEydDV0VlN2ODU0L2xJ?=
 =?utf-8?Q?/1YJH4x/y/DbADuwPbIlWlJvY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd43c4d-d134-465c-6ac3-08ddd038ee69
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 13:48:29.7437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YVlMmr2plwuDNqeKD/92iv1xeSJ5jLN2f3rZGTn1p8foDLosnkxNuyKhhMqokZBWG1OfOc3nyNcHO4UwH5EfTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9231
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



On 7/31/2025 6:31 PM, Maxime Ripard wrote:
> On Thu, Jul 31, 2025 at 04:43:46PM +0530, Riana Tauro wrote:
>> Hi Maxim
>>
>> On 7/31/2025 3:02 PM, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Wed, Jul 30, 2025 at 07:33:01PM +0530, Riana Tauro wrote:
>>>> On 7/28/2025 3:57 PM, Riana Tauro wrote:
>>>>> Address the need for a recovery method (firmware flash on Firmware errors)
>>>>> introduced in the later patches of Xe KMD.
>>>>> Whenever XE KMD detects a firmware error, a firmware flash is required to
>>>>> recover the device to normal operation.
>>>>>
>>>>> The initial proposal to use 'firmware-flash' as a recovery method was
>>>>> not applicable to other drivers and could cause multiple recovery
>>>>> methods specific to vendors to be added.
>>>>> To address this a more generic 'vendor-specific' method is introduced,
>>>>> guiding users to refer to vendor specific documentation and system logs
>>>>> for detailed vendor specific recovery procedure.
>>>>>
>>>>> Add a recovery method 'WEDGED=vendor-specific' for such errors.
>>>>> Vendors must provide additional recovery documentation if this method
>>>>> is used.
>>>>>
>>>>> It is the responsibility of the consumer to refer to the correct vendor
>>>>> specific documentation and usecase before attempting a recovery.
>>>>>
>>>>> For example: If driver is XE KMD, the consumer must refer
>>>>> to the documentation of 'Device Wedging' under 'Documentation/gpu/xe/'.
>>>>>
>>>>> Recovery script contributed by Raag.
>>>>>
>>>>> v2: fix documentation (Raag)
>>>>> v3: add more details to commit message (Sima, Rodrigo, Raag)
>>>>>        add an example script to the documentation (Raag)
>>>>> v4: use consistent naming (Raag)
>>>>> v5: fix commit message
>>>>>
>>>>> Cc: André Almeida <andrealmeid@igalia.com>
>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>> Cc: Simona Vetter <simona.vetter@ffwll.ch>
>>>>> Co-developed-by: Raag Jadav <raag.jadav@intel.com>
>>>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>
>>>> This patch needs an ack from drm to be merged.
>>>> The rest of the series have RB's. Can someone please provide an ack ?
>>>>
>>>> Cc: drm-misc maintainers
>>>>
>>>> Thanks
>>>> Riana
>>>>
>>>>> ---
>>>>>     Documentation/gpu/drm-uapi.rst | 42 ++++++++++++++++++++++++++++------
>>>>>     drivers/gpu/drm/drm_drv.c      |  2 ++
>>>>>     include/drm/drm_device.h       |  4 ++++
>>>>>     3 files changed, 41 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>>>>> index 843facf01b2d..5691b29acde3 100644
>>>>> --- a/Documentation/gpu/drm-uapi.rst
>>>>> +++ b/Documentation/gpu/drm-uapi.rst
>>>>> @@ -418,13 +418,15 @@ needed.
>>>>>     Recovery
>>>>>     --------
>>>>> -Current implementation defines three recovery methods, out of which, drivers
>>>>> +Current implementation defines four recovery methods, out of which, drivers
>>>>>     can use any one, multiple or none. Method(s) of choice will be sent in the
>>>>>     uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
>>>>> -more side-effects. If driver is unsure about recovery or method is unknown
>>>>> -(like soft/hard system reboot, firmware flashing, physical device replacement
>>>>> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
>>>>> -will be sent instead.
>>>>> +more side-effects. If recovery method is specific to vendor
>>>>> +``WEDGED=vendor-specific`` will be sent and userspace should refer to vendor
>>>>> +specific documentation for the recovery procedure. As an example if the driver
>>>>> +is 'Xe' then the documentation for 'Device Wedging' of Xe driver needs to be
>>>>> +referred for the recovery procedure. If driver is unsure about recovery or
>>>>> +method is unknown, ``WEDGED=unknown`` will be sent instead.
>>>>>     Userspace consumers can parse this event and attempt recovery as per the
>>>>>     following expectations.
>>>>> @@ -435,6 +437,7 @@ following expectations.
>>>>>         none            optional telemetry collection
>>>>>         rebind          unbind + bind driver
>>>>>         bus-reset       unbind + bus reset/re-enumeration + bind
>>>>> +    vendor-specific vendor specific recovery method
>>>>>         unknown         consumer policy
>>>>>         =============== ========================================
>>>>> @@ -472,8 +475,12 @@ erroring out, all device memory should be unmapped and file descriptors should
>>>>>     be closed to prevent leaks or undefined behaviour. The idea here is to clear the
>>>>>     device of all user context beforehand and set the stage for a clean recovery.
>>>>> -Example
>>>>> --------
>>>>> +For ``WEDGED=vendor-specific`` recovery method, it is the responsibility of the
>>>>> +consumer to check the driver documentation and the usecase before attempting
>>>>> +a recovery.
>>>>> +
>>>>> +Example - rebind
>>>>> +----------------
>>>>>     Udev rule::
>>>>> @@ -491,6 +498,27 @@ Recovery script::
>>>>>         echo -n $DEVICE > $DRIVER/unbind
>>>>>         echo -n $DEVICE > $DRIVER/bind
>>>>> +Example - vendor-specific
>>>>> +-------------------------
>>>>> +
>>>>> +Udev rule::
>>>>> +
>>>>> +    SUBSYSTEM=="drm", ENV{WEDGED}=="vendor-specific", DEVPATH=="*/drm/card[0-9]",
>>>>> +    RUN+="/path/to/vendor_specific_recovery.sh $env{DEVPATH}"
>>>>> +
>>>>> +Recovery script::
>>>>> +
>>>>> +    #!/bin/sh
>>>>> +
>>>>> +    DEVPATH=$(readlink -f /sys/$1/device)
>>>>> +    DRIVERPATH=$(readlink -f $DEVPATH/driver)
>>>>> +    DRIVER=$(basename $DRIVERPATH)
>>>>> +
>>>>> +    if [ "$DRIVER" = "xe" ]; then
>>>>> +        # Refer XE documentation and check usecase and recovery procedure
>>>>> +    fi
>>>>> +
>>>>> +
>>>
>>> So I guess I'm not opposed to it on principle, but the documentation
>>> really needs some work.
>>>
>>> You should at least list the valid vendor specific options, and what
>>> each mean exactly. Ideally, it should be a link to the datasheet/manual
>>> detailing the recovery procedure,
>>
>> This is added above
>>
>> "If recovery method is specific to vendor ``WEDGED=vendor-specific`` will be
>> sent and userspace should refer to vendor specific documentation for the
>> recovery procedure. As an example if the driver is 'Xe' then the
>> documentation for 'Device Wedging' of Xe driver needs to be referred for the
>> recovery procedure."
>>
>> The documentation of Xe is in Patch 6
>>
>> https://lore.kernel.org/intel-xe/20250728102809.502324-7-riana.tauro@intel.com/
> 
> I'm sorry, I still don't get how, as a user, I can reimplement what that
> tool is supposed to be doing. Or do you anticipate that there's only
> ever be a single way to recover a Xe device, which is to reflash the
> firmware?

As suggested, it is a combination of uevent with an additional vendor 
specific indicator. In this case, along with the uevent there is a sysfs 
and dmesg that indicates firmware flash is the required

In the future, if there is another vendor-specific recovery needed then 
same will be indicated in dmesg/sysfs or any vendor specific way and the 
case will be documented

> 
> What if in ~5y, Intel comes up with a new recovery method for the newer
> models?

That will be documented in the Xe Device Wedging documentation as 
mentioned above

> 
>> I'll add the link instead of just the chapter name
>>> but if that's under NDA, at least a
>>> reference to the document and section you need to look at to implement
>>> it properly.
>>>
>>> Or if that's still not doable, anything that tells you what to do
>>> instead of "run a shell script we don't provide".
>>>
>>> Also, we just discussed it with Sima on IRC, and she mentioned that we
>>> probably want to have a vendor specific prefix for each vendor-specific
>>> method.
>>
>> This was discussed as part of Rev4
>>
>> https://lore.kernel.org/intel-xe/aG-U9JTXDah_tu1U@black.fi.intel.com/
>>
>> DEVPATH from uevent and driver should be able to identify the driver.
>> Shouldn't that be enough?
> 
> See above. What happens if we start to see systems with two Xe GPUs, one
> with a new recovery method and one with an old recovery method?


The DEV_PATH will indicate the device and the vendor-specific indicator 
like dmesg/sysfs will indicate the recovery procedure

Thanks
Riana

> 
> Maxime

