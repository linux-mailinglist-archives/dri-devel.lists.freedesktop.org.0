Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBRNMYX/jmmOGwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 11:40:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2C21352B4
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 11:40:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6D310E7E6;
	Fri, 13 Feb 2026 10:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RVW1Kn6+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748BD10E7E0;
 Fri, 13 Feb 2026 10:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770979201; x=1802515201;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Hy+lDJgeskdtgm+aFoFzx9fbWyHjOXO1mk2ceTq4CR0=;
 b=RVW1Kn6+UuZfyjYH6/ZdzuRu9O9OmFZYuGw954iJmoexyPJF0kz1V/Lb
 01rsvQdIGeekszTeXTN1uexUlCLLzvvhAkh3siFbtSjR/KN7uLuS6FfPO
 RXcjOrHu6lJ54GILtPsm4yWbSWKTKBGI57qTeXFjX9aJ+ZCf/W679oMT6
 k7GOfNTOI6quR9r4cphljcckrwPcqrvniuAOFDbwa4K0saykJSU0qBRKQ
 l9LKfb5tvZUuKPTKrxdixVNxM65lKVbuC2a1OJgJrvVl6+BvNsNcNx1y4
 TZTywDkBR22Gn8ftPzbYtsloI/m4uQTwnkDqlzpN3jm/AdA7HD2HllYoQ Q==;
X-CSE-ConnectionGUID: pBstvb//TGCJjPDj+5cjcQ==
X-CSE-MsgGUID: 4WQMFX8PTJaYbnecI/VZzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72340801"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72340801"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 02:40:00 -0800
X-CSE-ConnectionGUID: Z+VD+s/2RN6PuBBCR4HawQ==
X-CSE-MsgGUID: le7oSLzTRaSFMsuI1vP/RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="217431915"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 02:39:58 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 02:39:57 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 13 Feb 2026 02:39:57 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 02:39:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b85rvQaJV101gt9phYxJ+cz6Nvf0Q9CKGfP4piyoClaqgWsgX78la73qYL2V+Y8uPyaKEIISs9mV4sK9N9Q1t/nviFXcuf/8N1HFrU7lWfHpEXlBHPl9L5DLPYMamBw67dX6KZGZqtCdY2lSnfo2EQ9uUYnIVBwyHR/U4HkzJfJqpb8Sin6Guip5jfq64JEXlEbkPihzzs558rtSAM6FFqV1HQeAbL7sDqex8hgtcXYFL0hPc6uNkQpTthBtkoWMIsD6Vsr3z0AlAnrwTxgZs4ef1Ma1aXadshW3quEMZWeZhSkjDEi1L7gRQ5/kz3X591ebNGNl1QvPVglJzX+ZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+/Rcw0MlZ/9kMTR+4AqnoSItcnXsjVVHZdCA/PAl2A=;
 b=jLXyl07YdDPXRjf1WcGA2QtaY7Kc9I1guTh+2j6A83AUxsgJKaIfUCZwq7E9/jRoDre5isiivW6TR/cNylAttbbj7dDsdr278fNQtKCQbOt/fOdtsIILu0H3paHUGutlDklfWLiYAjM8Em7xUo/gkd+ikaxDMux9GWZn+StUekOld3aVhlV4tqXxv1c5QAXCwxNujN/H3QyER1cfvRBF+VXDNcJhEE1en9vYXKsp/Qwdej9BQvIURVUtSvDTfAZ4YkpoymUIlWP0GTxVGI9Ma74eRB6IzXhu+VFX+Jw/5sskamwaNl8u5N9pI2L/wDXSz+UAvojRyhB+1c4lcc1Hrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DM4PR11MB8225.namprd11.prod.outlook.com (2603:10b6:8:188::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 10:39:50 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 10:39:49 +0000
Message-ID: <bf3ab4cf-d49f-4785-8df6-74f13436f854@intel.com>
Date: Fri, 13 Feb 2026 16:09:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/4] Add cold reset recovery method for critical errors
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rodrigo.vivi@intel.com>
CC: <andrealmeid@igalia.com>, <airlied@gmail.com>, <simona.vetter@ffwll.ch>,
 <mripard@kernel.org>, <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>
References: <20260211115946.2014051-6-mallesh.koujalagi@intel.com>
 <1db2ea6c-4a0b-4071-9918-5ba756d17a0c@amd.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <1db2ea6c-4a0b-4071-9918-5ba756d17a0c@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0073.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::6) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DM4PR11MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: fd840c91-b17f-4e3f-6f4e-08de6aec36a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTVOZVhaYjJMbzlMaVFEdlB0cXJYRUFIZVR0Smdwbi85bmhvQ0xTMWt5NGtF?=
 =?utf-8?B?aU0wclR4N2dtSTFvRXQvWmhqdUlla3J1VWhjVDJXSFlZWG5uSktPSEdhS3Vh?=
 =?utf-8?B?TzUyQWFzU256Q3ZMbWVZWStxTEEwRGxROHpPYklLQ3ZSTzg4L1VmOWRCWmVU?=
 =?utf-8?B?ZEYrdXIwZUNiRlJ1cEVJQnlmM1JRY3hsSEppSFZMMmkweGppdDc4YjlyT2Rn?=
 =?utf-8?B?V3VyMG90ZXp5MnEyWHlOU0J5WGhVTkVDR2wwTlVYanBCK2VTOGlZTWxhVTB6?=
 =?utf-8?B?NENoS1dKY3VxVEdYZDZDdjlRK2FkRzFOcjlBeHlrdUFBemlBK2UyTFkxS1BS?=
 =?utf-8?B?MEptdGVOTWZNWkd0STNXR0x4alN0SmpNcXNZNjQwL3pLNVc1UTZEQXVrT05h?=
 =?utf-8?B?RWF2QW1KK3lUc280aUsvQmdxY2psckFZbStJTTZ3TGxnV2RJNlJGcUlPMEx2?=
 =?utf-8?B?cEtpZG5TTUhZeUpYQ0EydTFkWU01YXlWMXhseEp3QWdjRkxLMjZsRFVxRmph?=
 =?utf-8?B?cnRZSWJNTEoxbUNyQk4vVmNUUFNFSWd3TVQ4TmM2dFJSYWhHaVgzcnhkejZ4?=
 =?utf-8?B?eUQ1SURORFhnNXVuTEpiT1Mxa3doZy85RUFGUjhXemEyczh6ZFZIYkJtYk0w?=
 =?utf-8?B?eExKUTFpUTVaWnJMRkhpVjZmTDBMbFVRQk1ndmJLcHZXcUwrS2x6eE1jZWh3?=
 =?utf-8?B?UnplN1ZWc0pRZ3RvdzRmRDJUUmpuNnBLZ0txUFRHVElBS0RDWHFKalBXb0Ey?=
 =?utf-8?B?a0lEbDZKcksvVkpERk9wdDc0ekFmSENwWm44b0thcitSZ2R1eENIbXA0YVR1?=
 =?utf-8?B?aWNhTTZNcmY4RzJXQ2RHZ2lXSXpaNmlwTVpkL2VDQ0YyaXZMRjQ3MThHYXpS?=
 =?utf-8?B?dnYyV09OUk11emh3NnNDbm42Y2ZQQ0srZFYwcithTkJBYTYya3lLRHR6R2di?=
 =?utf-8?B?clVpOEFjbngrU0d2OVQ2VjYrb0NJcTNmeEtWOXNTWDlodlBqNlZEdEJ6S1lE?=
 =?utf-8?B?dUdlNnhhcXEwVCs1VDRJSDNVZXkyMWgrTE5ZNjMyVGNoQXFRWlpGeGx0ZXlM?=
 =?utf-8?B?VWhValllYThmWElRNUFMN3c4MEIyc3lMb0NiRmJYcU5wNjVhUy94ZDJKTU1I?=
 =?utf-8?B?WVRLT3NFdTVNL3VLQllrV2REWmlyMDlDTCtrNmhTYWNIa053UjdDUjd6ek5P?=
 =?utf-8?B?SFVTektPZTlBZVZDajJpSVlHRFBjUmFCWHpuN1FSbktFSnRHbW1oYW9vUlFa?=
 =?utf-8?B?WEhaR1hWekpxR0V4Ky9wRktPTnZWS1pMOHJvbG05N0lycU1KeVBPV0FhcWp2?=
 =?utf-8?B?L2dndGpUSG5xcmtNcUJVRjVoN2d6Mnk1NExKWG1Cd3NRdUVNSmdLTWExUlpq?=
 =?utf-8?B?clZsZ3U0ejIvOGIzbnA5SXVONzFHZ29vZUJ4YjQ1UWYwL0p5QnZuc0dZVmxk?=
 =?utf-8?B?Z3JKbU9PVnRsNDZYcGdOMGtETEcrM0pITUZhOFVWMThWZ0RVaDQ4eXEvQklj?=
 =?utf-8?B?bWdRNkJDMFNFR1cvYWVZSHNYeHBtL1pHWFdPWWxZdUQrVmJUSWlDQXd2MzNr?=
 =?utf-8?B?K1ZCSk5xWjJKV2JkbHU3TkZkbFlOYy9qSTRQQjZBVjZRdzBIOWFYTTc3ajBn?=
 =?utf-8?B?cUowL3ZqcFo2ajlHd0dvTUtEbFdPc28wSXg4SVNvTTdnM1FDd1ZsZVJ3amdR?=
 =?utf-8?B?RjNKRTJmM0dYTWEreU1MUnJPeW9BdUZsWXlyOEQyRDhQSGErQjR3aGFDcGtx?=
 =?utf-8?B?M3JxTzl1TlNSeUxyN3pTOERtcEQ5QjdDWUdjOXc4ZTl3R1BQd0lSMElST2w5?=
 =?utf-8?B?RFk2VlFMNmR0Y29vMlpmOWo4L3VzMDFRUzdWUnNxL1oyVXZQb1cyTWtoUTRa?=
 =?utf-8?B?dCtUVHNHZ0pPNUR1R2JScU1JUFdZbWtLaGMybXBleDdwSWkyWEtReXpXUFdM?=
 =?utf-8?B?WHVvcDRrbmExMGlMNlhGcUhkWEFmNVBsQ1J0R09qQUV5dW1UbVZ0b1MwL0dZ?=
 =?utf-8?B?RnlCeGR4cUVoVUdmU2FQalNtaFFwVjVZWjlaUktZTzNxeWZzeGo0T1ZtcFdH?=
 =?utf-8?Q?PmLKlB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjhjOHFvWEZSZWJkWmZjTzQvNkJ3ZlJzS05ZWXZjMzVSZ1hvNXBXTG9rQlBZ?=
 =?utf-8?B?SC9XNTNQN3FiMHJUcWNqQWE4Zk8ycE1hVUFYck9UcFNsaWhqbHYzamYrVmIw?=
 =?utf-8?B?b1VXQ0lIRVBWaUlMQlJVMG9NSzdNSkN5dStiVkU2TFpIYXUrczJHd0ROOEZF?=
 =?utf-8?B?aGF6NDlNeENBdTQ1VGFLYkJZaFpmcWU1Q3lnTGFXNnpFMnN4a2JEai9UZjhT?=
 =?utf-8?B?Z3RMTEhtd2s1bXhKNERuMXpONGQyNHRjM0F1cHFmS0UvWVorOGZ5bWlmM3hU?=
 =?utf-8?B?WksvZkxDRi9KQU8yNkpxMzl1QzJBK2QyVmVWZTdFOTY4MG05Y0hlRjJvdkRj?=
 =?utf-8?B?Mmd0cHlVMGdPU1huSFpKVEdmajE2dXlJWU9jemNLTmt0NktyeU02c3JwRyt6?=
 =?utf-8?B?OTJ4RkpheGxINDI2ME81M3EzdG5xWEdnbGk4L2JGU3Bna0VDKzhmeDEwU2Ru?=
 =?utf-8?B?dkJoWm9RYytmMks0MmNITGxOdXA1b3V1ZWhXRFZTQzRlVllRWldnMERERjRt?=
 =?utf-8?B?dDZVMXlXTWlTSFB0dTFyc3pkK3BHWW5ieS9JM3YySkRJSUFmM01tM3RTU1JV?=
 =?utf-8?B?ang1VW9XNytDZ0VDV2JsT0IxbUdOTENPVlIzMnA0TG5pajN5cDNGVVFUYnd3?=
 =?utf-8?B?SW14a05wcFFPakhrUlk0OVF0Y05VMjYxZmowaDBkS2hPV2ZjOGVjTVE4VHZ6?=
 =?utf-8?B?Yk1aLzd6cEJXWDc4SjZjM1ZwUEdmYVg2aWJnZWNjZnpvODh2Ri9WUGtlb3hL?=
 =?utf-8?B?ZFpVTVRZenJQMW4xWW9GUjhyRkNrcE9ia0l4SkxLVkw4RnFHNDg2MUhZRnU1?=
 =?utf-8?B?ckNHb2ZwVVgwc0ZZL2JRR2xaODJ0UkRuQTBrbGlMTlBvdEFBN0RIR3pHQ1A2?=
 =?utf-8?B?YlEydDRyZkhubU5sRW4wQW5kK21qbkdSUFIzblZhQ2Z6MnZodk80ZFVOa3Fv?=
 =?utf-8?B?VWhCNTNLbDRqR0pKR3pRcWs5bVVoQWZPQnNyRkVNZlhPbXlMcWRINjRKcW01?=
 =?utf-8?B?c1EySmRWbFEwK0FMM2lZUG1lbTkxMWtTenhsWE9WSGtycW9RaDZWMmNaeTF4?=
 =?utf-8?B?RkVNQkYvNVI2NDBKVytYWThVM3cxNnc5N205YUpPUy83cXlCVWlpUTNxbmtE?=
 =?utf-8?B?V0gwTzgrTitBYUJoU1Vib0xzZVlxbUQ2bVVtbjJzd2ErbUxFTVRDM3NSd1Jj?=
 =?utf-8?B?T3ZTZzJnUHZQcTl4Zm5BdWxIb1JEN3VOMEk3ejFMRVRKRzU2TXFJWlJUM3Fa?=
 =?utf-8?B?N0FsTWl2OTBpOUxIcGQyUE8wWURWc3lndmxPSlJYa0RicGdvbFREZW91UmdC?=
 =?utf-8?B?M2I0NnIrcDV0azBONjV4Y0RUaG1SSVVldzVuU3VURkwzY2ZGNFoyZU11NWU4?=
 =?utf-8?B?VHhjU3BUZGN0dHBWYy8vUmxtS1ZLYjFhRmJucXRYR0IvWmF6RC9KS2lDT29m?=
 =?utf-8?B?SGZtajQwdDRPN21JbTVtQ2taeHpYNU1QeW1nb3BDN0d4eS92eSszcktqK0JE?=
 =?utf-8?B?emdaNmRvYzBhYTl0YXRMSHYrYVkvMXZqMk1odmI0QXRDcTBiS0w0ckhVR0pi?=
 =?utf-8?B?WUxoczIvRHV3YVU1Y00zeFVtUHFYSkhmNEdRamJUR05kSFNxVjB2eWtIS2Rl?=
 =?utf-8?B?NXR6TG4yaTU2MEZxN0FOOWJsWlJuQlcxYzhjd3M2S09Od2VhRUtGUUFValll?=
 =?utf-8?B?dXo1aW51b1BuY09lWnF4ZEhOY3J6ODc0QzJJWjA3YXNnWWFsa0JYS0MzMXdS?=
 =?utf-8?B?bUtxUlFhRHZpTkxZOE9YMGdRNWhyUjRrN2dHSXZpWkp2Y21YanVaS3p4UWpJ?=
 =?utf-8?B?WmdiSDZxOWE3NXNZWHlTcXFKRmhXZ3hxbmdhVzlCRjQ5WGpUQzdIR1N5UDFo?=
 =?utf-8?B?R3lycHV5ODhyQ2J5UjFVcGI1T1FLYWE4eDc5WHR3S3hiNUgyZXFWUzRsbkhr?=
 =?utf-8?B?enFldVNncnVUQ3NRdkxKQUhyOU0yVDlVZktnMWpBUUkzNGgrQ09WWGRjY3BR?=
 =?utf-8?B?dW5vaklLY2d6cCs0QlpJaXZtRWRlZXZaZ1Y0NTN3dXZnTnBOQVA1TVZDMUE2?=
 =?utf-8?B?SkErTGJQc2VtNEtDMUowblpOOFFaRVh1Q29CY0lIMTRRVThGVWdYNTd3MVla?=
 =?utf-8?B?NnRqc0c4dHFzM2xRUElBbURMVmxzM2RTQmp4cDRvclpkcFFuVDg2RHpWN1d1?=
 =?utf-8?B?Uk13dThjVXl5N3Q4TmY0b000RDBEZy9VQTRkV0RFNkRrKzNpR1lyOTRlMlp4?=
 =?utf-8?B?SGpqRnFRYys5MFlaSXZGcWsyVWVuZzQwRTRlT09WTzdrUlFxZWo4ZFExZkVS?=
 =?utf-8?B?VEVnT3hvc2cwbzhVczZKS1ZMWDdnUzF4bytUSnBoZjVITmFOSk1rdTU5eDJo?=
 =?utf-8?Q?WXxPTMQkEedPOego=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd840c91-b17f-4e3f-6f4e-08de6aec36a2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 10:39:49.8502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ke2mERJ4hO9Q/uBZhVxy2uprSE2CVwoKwXBdHQmeJaMTZo4HZQYPsS5EXXSWZiZS7RV2nVGCS5XSGRNeyQ/pYj1YEGj4eITgmVIWK32Pdjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8225
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,ffwll.ch:email,amd.com:email,patchwork.freedesktop.org:url];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[mallesh.koujalagi@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[igalia.com,gmail.com,ffwll.ch,kernel.org,intel.com];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 1D2C21352B4
X-Rspamd-Action: no action


Hi Christian,

On 11-02-2026 05:57 pm, Christian König wrote:
> On 2/11/26 12:59, Mallesh Koujalagi wrote:
>> This RFC patch series introduces a new DRM wedge recovery method
>> 'DRM_WEDGE_RECOVERY_COLD_RESET' for handling critical errors
>> that cannot be recovered through existing software-based mechanisms.
>>
>> Background
>> ----------
>> Current recovery methods (driver rebind, bus reset, FLR) are effective
>> for most error scenarios. However, certain critical errors
>> affect device-level persistent state that survives warm resets and
>> software recovery attempts. These errors require complete device power
>> cycling to restore functionality.
> I don't think that this is a sufficient justification for making those changes.
>
> Especially since the patch set doesn't seem to add any detection for those cases, but rather just exposes a debugfs file to trigger them.
>
> So what is the actual technical background? In other words when is that necessary?
>
> Regards,
> Christian.

Thanks for the feedback. Sorry I missed to add reference of actual usecase.
This method is for handling errors from power management unit, which 
requires
a complete power cycle (cold reset) to recover.

I'll add actual implementation in next revision. It will be an extension of
our WIP RAS infrastructure which is being developed in parallel.
(see https://patchwork.freedesktop.org/series/160482/)

Current RFC series is to get community insight on proposed recovery method
as part of wedging uapi.

Thanks,
-/Mallesh


>> Proposed Solution
>> -----------------
>> This series adds DRM_WEDGE_RECOVERY_COLD_RESET (BIT(4)) as a new
>> recovery method to the DRM wedging framework. When this method is set,
>> it signals to userspace that only a complete device cold reset (power
>> cycle) can restore normal operation.
>>
>> Example uevent received:
>>    SUBSYSTEM=drm
>>    WEDGED=cold-reset
>>    DEVPATH=/devices/.../drm/card0
>>
>> Testing
>> -------
>> The debugfs interface allows testing the cold reset recovery path:
>>
>>    echo 1 > /sys/kernel/debug/dri/N/trigger_critical_error
>>
>> This triggers the critical error handler, wedges the device with
>> cold reset method, and sends the appropriate uevent to userspace.
>>
>> Cc: André Almeida <andrealmeid@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Simona Vetter <simona.vetter@ffwll.ch>
>> Cc: Maxime Ripard <mripard@kernel.org>
>>
>> Mallesh Koujalagi (4):
>>    drm: Add DRM_WEDGE_RECOVERY_COLD_RESET for critical error
>>    drm/doc: Document DRM_WEDGE_RECOVERY_COLD_RESET recovery method
>>    drm/xe: Add handler for critical errors which require cold-reset
>>    drm/xe/debugfs: Add interface to trigger critical error handler
>>
>>   Documentation/gpu/drm-uapi.rst   | 73 +++++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/drm_drv.c        |  2 +
>>   drivers/gpu/drm/xe/xe_debugfs.c  | 38 +++++++++++++++++
>>   drivers/gpu/drm/xe/xe_hw_error.c | 28 ++++++++++++
>>   drivers/gpu/drm/xe/xe_hw_error.h |  1 +
>>   include/drm/drm_device.h         |  1 +
>>   6 files changed, 142 insertions(+), 1 deletion(-)
>>
