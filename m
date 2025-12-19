Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86100CD0042
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 14:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF36010EF91;
	Fri, 19 Dec 2025 13:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j7kkfUBE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A1F10E1C9;
 Fri, 19 Dec 2025 13:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766150325; x=1797686325;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5tbjYpNQY/x/Xk8E0w+prJBNpMTymmyyVXDX2hesEMw=;
 b=j7kkfUBEutAoun4SL7sX/QySRCnqPd02BmIY3OTAEMSHIL1ULkFLiOwA
 nr51YEmjyvItnZy2rbB9JJi0XAvVw6LaMZHv+BuOxzWApIh8gAPN0wXr9
 OeG/SsJbCuT+abhmnys296F9SfDWCY4xSvUH7xuHASDPSb82KAde/7ClC
 Rb8dnQGGp7TepASV9M87Qwd5IGWu25lwf0Y7gGs1xqFwROiddBpmLavJn
 q8fuUwpTNqbXt56XU+ssxMZYsu+PFg4p9Bw6z5yBp27QqZGfExKa5yrHb
 rAk0Pwxfjy2MN8HxIX7Mp1dyj9l6uDx0+A2pZ92IiUJTQMICgsWmnEg4n g==;
X-CSE-ConnectionGUID: aFzaZYiWQWWa+/Y/BkfaNw==
X-CSE-MsgGUID: aPymS5dDQlmIaq5GCVA55g==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79229792"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79229792"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 05:18:45 -0800
X-CSE-ConnectionGUID: fCSWNvm4RGWHkOpvFpb8HQ==
X-CSE-MsgGUID: 9zPQ/l4wTHCc9N2FsHURHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="199683139"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 05:18:44 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 05:18:44 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 05:18:44 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 05:18:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+2Xy0bcuYY/hPqq/2txUEkrt/UDNcNGoz9EBGlSGXOQYWQWC4fq1dkjaksVIfaM7zVvvOxFOtyh9z6y6X0wY2xEbkfmwJwccp7fmSo8+oDYT6S2Wvrqo6GPYKh3Ji0wVGsypNo4/WtBt6rQiMU2F8d0uqL8UpOJJSnpN0MmYd/DdrLP6JoXq4X72MR2/mUOBEdUHh6TR3FRoWI10NFpf+HPkyyZkTEC9rgpB7qZcm007e20WoSMuDleYksn4kRPJeAaN4BvK+LUEgySFVG+oT7lH4qWuuVXVSiwSs1sN/nRXF2nO0vVTUDMAbefHmj+voaM+zvpMWLrlazMXnCxmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dpnj6HN5kRNaP1MnGtj3y+d8DAqIwi2yit/eGYKOyHo=;
 b=T8BYj49dlwwjMD/C/4ITA2LL1GkDeYMwbEWoo05eWr2DsYIJVqVCr5eGYhjy/tw84tjEM1teqVLRr2tqk8SgM91Qap4hcdVMDdmTVoSa6XbIw5CVW4NqJbRdoAfdVhAB9qsdwkHyEg8thaoH5McBtBCjW0iAjvD5l8wSkv0sheVXf4A4OxxkNrxLCdcwMZF1b0MzbAPrOTIe3yFIzdDs8JDide86nmS5hlAzBQvScpa6cZUISVuUAzy1iycX+OFiE7YUc1vPZydbroeMr3MF2f4pScj1CYUAT//NEfNJ2P1sex/jeNZhwKpN/jgti4PSuvRHmXg1wka9TvK73epLVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by LV3PR11MB8530.namprd11.prod.outlook.com (2603:10b6:408:1b8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 13:18:41 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 13:18:41 +0000
Message-ID: <d4a01f71-96e9-4145-8b95-083369a8362d@intel.com>
Date: Fri, 19 Dec 2025 18:48:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 06/51] drm/colorop: Add 1D Curve subtype
Content-Language: en-GB
To: Alex Hung <alex.hung@amd.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <ariel.dalessandro@collabora.com>, <wayland-devel@lists.freedesktop.org>, 
 <harry.wentland@amd.com>, <leo.liu@amd.com>,
 <ville.syrjala@linux.intel.com>, 
 <pekka.paalanen@collabora.com>, <contact@emersion.fr>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <sebastian.wick@redhat.com>, <shashank.sharma@amd.com>,
 <agoins@nvidia.com>, <joshua@froggi.es>, <mdaenzer@redhat.com>,
 <aleixpol@kde.org>, <xaver.hugl@gmail.com>, <victoria@system76.com>,
 <daniel@ffwll.ch>, <uma.shankar@intel.com>, <quic_naseer@quicinc.com>,
 <quic_cbraga@quicinc.com>, <quic_abhinavk@quicinc.com>, <marcan@marcan.st>,
 <Liviu.Dudau@arm.com>, <sashamcintosh@google.com>,
 <louis.chauvet@bootlin.com>, <mcanal@igalia.com>, <arthurgrillo@riseup.net>,
 Daniel Stone <daniels@collabora.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
 <20251115000237.3561250-7-alex.hung@amd.com>
 <492878007a02ffa87d0cff301571ffd100bc9c94.camel@collabora.com>
 <083e313e-ab8b-4a38-b40d-9b416b8d162b@amd.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <083e313e-ab8b-4a38-b40d-9b416b8d162b@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0200.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::17) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|LV3PR11MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f62bd23-57e1-4bdc-2b5a-08de3f0120db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TldJTUdBWU5wMVRxd1RUOWtzUXVKN05taFdMdUo3UHJ2Y0hHQVpic0NFbVJJ?=
 =?utf-8?B?cHI3czdadGlCTWFDK2FSM1BKQ0tQWjJQRmpkNXF2bnQ0OG1ZS0lNbllRSXVH?=
 =?utf-8?B?dGc2dXJ1czRyNTNGanNnSjJ4WXh3eElkR2FHUnJLUzkwVzhUTHZ1T2MzRnZE?=
 =?utf-8?B?WlRtRmYyeE9WMWlISnpaZnIxSGUyYUp3dmxNekQwQi9YN1pNMkhpMFJteUdW?=
 =?utf-8?B?VVAzQlA4bmxYU05keVNCK3VtWjVyQnZGa3pFQ1pEN3pqUkV5QllvWkRoYXVh?=
 =?utf-8?B?YUd1OGYrejRLTDhHTCthb3hvcUR6Zk1JR3diU2lOZlFTYVZJb3U1RmFCTWVM?=
 =?utf-8?B?SkF3eDR3KzFMQWliZXYzWG1aLzk5QUJJKzVJekZlajMyb3VTcFVBbFFWQWht?=
 =?utf-8?B?RTJjMnVOUnNuZEtVckxlK3hTNGU4Z0ZMTW1YY2xHaUI2bmxUWG51N3ZCZE02?=
 =?utf-8?B?aGtEamZjbFVFcXhVUEowMDVoRUd2N2YvM0N4RFcwSm5VaXRpa2NPZ29wMzBY?=
 =?utf-8?B?cCtzdXpzSHZubk5XSUR5aW1YZWZYc2o4YUVMUms3QkJlY2FpcWVITWFGZHMw?=
 =?utf-8?B?ZVNGS0tGb0RqcnBzbVF3UmlUWW9lZDlJVFBmVklvRVFoU1cwNWFYZXF3bXZx?=
 =?utf-8?B?OUZkS1Y5b1QxMVZ3YkNyV0MyZGE2RlZES0pWK0RnaG41NVNQRUZCbzBieUd5?=
 =?utf-8?B?a0xNbjFXaUJaOFc5TmYvVXlzSG5va1ZyajR6aFJsaXZFdDMwNEtpWnk5RDRo?=
 =?utf-8?B?YkFNSE4vTE1UQkVxdXl6YlFOR3BsdUJQRUI4eW4rYy9aa1FnbVpSb2l1MXdD?=
 =?utf-8?B?Q2NvME56TGpTcFZoQTRlN29RMkJUV1MrTkNlOUNiSEFnVmdHRTdMNW5Wa21U?=
 =?utf-8?B?ZGg0bFQyMTVCbkxnU0R5OE1QanNWNGdqb3FIK001WHljNzZnRVJMOVJoVldv?=
 =?utf-8?B?YW5rUTlLaUJ6MFFza3Z6RStzM2U2RUowWHZVTXNCajM0My9BTUFQYk5YSnkw?=
 =?utf-8?B?VCt0dUVBMWZZT20vTktsNjlIczVGWHhLblZxT1FjckVsdnNzcjVkdW1nMkNO?=
 =?utf-8?B?bmxZNnI4eU1XaHg4VzJoMHExajhPT3ZmclVHUFFtSHZNc0wydk1MWVZxcC9j?=
 =?utf-8?B?YkVyZDlUcW02L01ZRm96c2ltVGVkMFNIRmR5ZXBRYXI3WjRkQnl6Q3prdEdu?=
 =?utf-8?B?aVg0T20yRlp5ZklxRzRPV2s4dEdURkRSd3l0T29Rb3MvNjQvNmtUZ0ZJL3VW?=
 =?utf-8?B?c0Y4TnAwbER5Y3p4ajZKWlRLbW5mVVBSU1phOXJzdkx5T0NYQUtvcTcybFRu?=
 =?utf-8?B?YXlYTnU0MDIrWExqaHVwc29IeTNLU3pvQ1dhOWVWK1dyd3dSelRrNi9veTdZ?=
 =?utf-8?B?RkJnUVRHcFpwVm9ha3RGVmFLc3JKWTUvZ1R1TU5MbFJIdmU3SE5ZNEV4TTkx?=
 =?utf-8?B?cHcraWUyaGwvczFPS05wQ1kwTElGdWhrNlNQT2NENVVWVlU0ZEhKL2hTMkk0?=
 =?utf-8?B?SW4rWmJiVFhHZmRVUjhFSXdlVkVWbmFLYUNyVlVCNHV3T2JmMTFINlI3Umt2?=
 =?utf-8?B?MC92ZG4yZFJuUjZaUE1lY1JVMUxQbnBwYUdQamd5cGlpbnBEVTR3a0VhWkQr?=
 =?utf-8?B?Ri82ckZ0WDA2d1NQbzViTE13cm9jd1J1dG9RTHRFZVE1SUtwQndPeG80R2Vh?=
 =?utf-8?B?cWo1dFFqTE9lTitUMUZRWTVjUVVkZE82QW5TMWpWcWFRUkhxWGlnamVaYksx?=
 =?utf-8?B?TXg2L1BMZkE4SVFTVGpJOFpkN0VuaHNLeW1TU2Jjd0ZyTEFjdjdHZnMzZHFk?=
 =?utf-8?B?NmJUbW05ZFIyTTZra3V0aHdleXhiK1lvYzVvbW53dGpaZXh4SEdFMkVrK0xl?=
 =?utf-8?B?ckwzMGU2c1hzNGJTZlA3M2F6Zi9mTmN3YWxqREVqOE5tdFM3eVhPeTVqejMv?=
 =?utf-8?B?U0dYMjdlMytWSXh2WHh5cmdGc1huUXVrRHlOcEJsMTc1WUR1cC91VUxidTkr?=
 =?utf-8?B?VVdZZ2g5WXd3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2VBWU01NnFHU0NFUFJFUUcrZzZGTENkak94ZGNpeVYzRUlHbjJ5Z3p1SExz?=
 =?utf-8?B?TXgwVDM2OXV5UTJudmV3L29jYW55Ynh4QlBvelpOUFhPZzZCWUFFMlREeGlE?=
 =?utf-8?B?djAvS0pSZ0VYN3lCTlhqQWJJYmRkK1Jwdys4V0hHR1dGSUhFbjJUN3BUZ3JJ?=
 =?utf-8?B?emVuV3R3RzNhSHEvdGpmOWplTXVST1dNdzVZVFNHcW0wU0RuMXdOdU94S0dN?=
 =?utf-8?B?eXRFTE9tRGlxZEY1UnlBSlUrb1BvOHRlVGNsMlFRTjZnb3JFalk3S1pUOWVW?=
 =?utf-8?B?RFNFZU95U253RXVzUHZWRVRjOFpxZXdlRk1lMDRzRXdQakNOZ0c1eGE0VGVr?=
 =?utf-8?B?SG1xcDloQXRmUmYyVlhOQW5vSFpYUS95QVFMQldaUW9NQmxuV24rMCt6T0pZ?=
 =?utf-8?B?VXBiV21TaGZ0VnF3Ym85UTh3UzNxNkY3T1NUVzd4L1piWkNYRy9LeWF5Z1lC?=
 =?utf-8?B?Nzk5OXAycjVaRVNkek9XK2Iyd0xPL1kzZE1VOGNZbDNlOGV3VTV2bmNtb2lS?=
 =?utf-8?B?WkJvb3FkNTBWK1dTcmV5RFdjb0NUdG96akRVdkZuc253Z3gyZVZRQnNnMkhW?=
 =?utf-8?B?R3lreHhKRjU3NUNZNWl3UkVsWE1LckFld0VTQXZDNXZtVCtoVkRST2kzaW5Z?=
 =?utf-8?B?bGpVdjFpMjZHeUlqVmx6cnFzOVFvOUMwU3Nnc3pjQVJnT2gxM1hZZzNDZTNj?=
 =?utf-8?B?L2pUb2cxSzJRNEFGK2w3VlpPdTR3M29kb1ZVQU1ma085TGJETU1rK0ZaYVdK?=
 =?utf-8?B?a1ZuNmNmdU5zNityK1lNdk1YUHVoeExuZ1lpRzdRcjRWcUtEdFl2bFRzTElx?=
 =?utf-8?B?bUM5ZExBLy9sUHhaaGZuRXgwempseEpXRDlHcDBEUTl5UDczYlZtOE5lOUVQ?=
 =?utf-8?B?TGh1bitZSTdQS0VLMkJnYnI0NjNhWHZLZm9UbldZbVZGazJSd3BOaGM2T1Jq?=
 =?utf-8?B?S0tjUWRWaWMwMnRsd1htcXhoWk1vdEdzR1lGdXFTZjNIQ3FJbkVJbDAvcFBB?=
 =?utf-8?B?TEdpZnVseTladDFHTnEzYmxKRHU4K1VZY3ppU0FhOVZxTXU3SEFKWm1qYTNo?=
 =?utf-8?B?NEpsUFJ4TmdMQVRqam5SU2dmajc5S1ZFNDR1bFBaMkVueWZQMUdyWDlIdE5s?=
 =?utf-8?B?QmdvL3djYlF0cnZkMEpFZmVyMHpJM2d1cnVpNXN5d3hOMGEvT3IvUHlWT1Rj?=
 =?utf-8?B?cDZ6VE9ra2lROGY5VzEzcm03UTZBNjBrTFgxZnBMN0dqZ2J2U1pHVUVxV1pY?=
 =?utf-8?B?eGgrMkFtbmdySElGMGVEK2k5aE1RVUhLZFhjdk55Zjg4OXRuenUra1Y5d2ZU?=
 =?utf-8?B?TzhSaHNsR2R6VHdvdTdrK1B3cU5uZHBFT3NjQnY1ZzAvK0sxRUNDSW9oOEV2?=
 =?utf-8?B?MGJxdDUxczR2NGtaU2dZbGU1NjB2NmkvV0tTSlRicHlJb2NVQzNJMFpzM3pj?=
 =?utf-8?B?a1drTlp4dHpPbUlDVlZ6aHlOOG8vSnFzc2RKOUxrYk9XSEMzejU4NHJVSnFI?=
 =?utf-8?B?clhtUG00RzIyVE5FUDZpYVRKWG02T21YajUzckJDNHJjMkFySm9RQ1k0Ymw5?=
 =?utf-8?B?Nk5IWCt6aXJpSHdPWGRaTGU1Y3pSRUsrK0RCYnJLU05RY0pCTkpsY0czQmpH?=
 =?utf-8?B?TUJscDZVNzdJNXp4Rm5xV0poSG9SWDlRaitzN1lzRFZSQS9aY1FqYVlQTlFJ?=
 =?utf-8?B?SERFT2hIL0ZhRkZRcDNQY2RDbzF0T0xqYWdlSzZ1UUpiNS8ydkFVakIrcEpC?=
 =?utf-8?B?UDRSRTlxVVJoc3dPcDA1dHByQkRFV2d5RmlaRG1FM0JSb1AzQWU2czhLYkFC?=
 =?utf-8?B?TWxnYTJtcDgvSHBXbkVGSStzdlZPaWxOZkQzUG9ZUTFxVXkyYlBKZE9QQTJH?=
 =?utf-8?B?M1Y3N3hJSEsyc0VIVzF4OWpsTmRrcEtsMWprYWZ3L2pkMTAxUSsvQis5aVB6?=
 =?utf-8?B?RWxqVm9oNUJqT2pXKzZwRUtmbzFnSWhvczZ4RFVidG5ZMHA4eUhxRkR2aDhQ?=
 =?utf-8?B?ajlhRlNiUEZZVTZ0Y1hKcko0Ty9SV0NRcExjbTBJa2YzN2FtRlNRdnpVSGRv?=
 =?utf-8?B?eE4rM1kxVHdtTHBBbURRaVBzcnF3VUpuZmowTUxUd2grTzJzS0R5dWxONW1a?=
 =?utf-8?B?Y1NIRE5kVEI0SWpPUUVVREpWaitwaUJzNkhQbGYxWG9yTkg4ZzRWNHRIWmkz?=
 =?utf-8?Q?ZxhD9uu1l9HHEi3jy5BXXwc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f62bd23-57e1-4bdc-2b5a-08de3f0120db
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 13:18:41.2840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCkDm+R26RLLKOhLxzZHHQsA5G9/ykTCnIg43NU7VDxUrvh7+5ccxW2AB2+qlw4KfPnzxP7/rK9lOojMirWJOtx8GLdhoXiCteZFXYHtBDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8530
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



On 12/17/2025 6:36 AM, Alex Hung wrote:
> 
> 
> On 12/16/25 11:19, Nícolas F. R. A. Prado wrote:
>> On Fri, 2025-11-14 at 17:01 -0700, Alex Hung wrote:
>>> From: Harry Wentland <harry.wentland@amd.com>
>>>
>>> Add a new drm_colorop with DRM_COLOROP_1D_CURVE with two subtypes:
>>> DRM_COLOROP_1D_CURVE_SRGB_EOTF and
>>> DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF.
>>>
>>> Reviewed-by: Simon Ser <contact@emersion.fr>
>>> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>>> Co-developed-by: Alex Hung <alex.hung@amd.com>
>>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>>> Reviewed-by: Daniel Stone <daniels@collabora.com>
>>> Reviewed-by: Melissa Wen <mwen@igalia.com>
>>> Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
>>> ---
>> [..]
>>> diff --git a/drivers/gpu/drm/drm_colorop.c
>>> b/drivers/gpu/drm/drm_colorop.c
>>> index 1459a28c7e7b..6fbc3c284d33 100644
>>> --- a/drivers/gpu/drm/drm_colorop.c
>>> +++ b/drivers/gpu/drm/drm_colorop.c
>> [..]
>>> +static int drm_plane_colorop_init(struct drm_device *dev, struct
>>> drm_colorop *colorop,
>>> +                struct drm_plane *plane, enum
>>> drm_colorop_type type)
>>> +{
>>> +    struct drm_mode_config *config = &dev->mode_config;
>>> +    struct drm_property *prop;
>>> +    int ret = 0;
>>> +
>>> +    ret = drm_mode_object_add(dev, &colorop->base,
>>> DRM_MODE_OBJECT_COLOROP);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    colorop->base.properties = &colorop->properties;
>>> +    colorop->dev = dev;
>>> +    colorop->type = type;
>>> +    colorop->plane = plane;
>>> +
>>> +    list_add_tail(&colorop->head, &config->colorop_list);
>>> +    colorop->index = config->num_colorop++;
>>
>> Hi Alex,
>>
>> I know this series has already been merged, but I was looking through
>> the code together with Ariel and we noticed that while this init
>> function adds the colorop to the list in the drm_mode_config, it
>> doesn't remove it in the error paths below, and I believe it should.
>>
>> Does that make sense?
>>
> 
> Hi Nicolas,
> 
> drm_colorop_pipeline_destroy() calls drm_colorop_cleanup() to delete it. 
> After drm_colorop_pipeline_destroy is called the entire pipeline will be 
> freed.
> 
> void drm_colorop_cleanup(struct drm_colorop *colorop)
> {
>      ...
>      list_del(&colorop->head);
>      config->num_colorop--;
>      ...
> }
> 
> For example, amdgpu calls drm_plane_colorop_*_init functions (which call 
> drm_plane_colorop_init themselves) to create a pipeline. If any of 
> colorop creation fails, amdgpu calls drm_colorop_pipeline_destroy to 
> destroy the entire pipeline.
> 
> In the end, we either have a good pipeline or none.
> 

There is one caveat though drm_colorop_pipeline_destroy() destroys all 
the colorop in the mode_config. That means, that pipeline creation for 
any plane fails, all colorops (even from successfully created pipelines) 
are destroyed too. However, that may well be your intention here, I just 
thought I would point it out.

For i915/xe, I decided to destroy colorops only for the failed pipeline.

https://lore.kernel.org/intel-gfx/20251219065614.190834-1-chaitanya.kumar.borah@intel.com/T/#m143bb249df288cf88123d5d66283918f3317ecc2

Anyway, all these are low probability scenarios.

==
Chaitanya

>> Thanks,
>> Nicolas
>>
>>> +
>>> +    /* add properties */
>>> +
>>> +    /* type */
>>> +    prop = drm_property_create_enum(dev,
>>> +                    DRM_MODE_PROP_IMMUTABLE,
>>> +                    "TYPE",
>>> drm_colorop_type_enum_list,
>>> +                    ARRAY_SIZE(drm_colorop_type_
>>> enum_list));
>>> +
>>> +    if (!prop)
>>> +        return -ENOMEM;
>>> +
>>> +    colorop->type_property = prop;
>>> +
>>> +    drm_object_attach_property(&colorop->base,
>>> +                   colorop->type_property,
>>> +                   colorop->type);
>>> +
>>> +    return ret;
>>> +}
> 

