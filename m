Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGDkGBhwnWlyQAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:32:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B8A184A57
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:32:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D83B10E532;
	Tue, 24 Feb 2026 09:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fNfJVlWq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7A910E530;
 Tue, 24 Feb 2026 09:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771925526; x=1803461526;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0t1wx//vVPyV3L1lDlw2s2omPAIvaH+UxaoV7pQjAwE=;
 b=fNfJVlWqxI16+DseeqrgBIU4kLwMqXThSxheG2mbfDpGbibYGIEI2S4/
 kcelv544m/gQFzpmxUNMa/WYh/zIMkV6I7Am2xcfP+ZY/xocOvybMSPte
 zpRxtOKCqCSOB6nA95AoY5kR95gE/hDfZC4VBIVSLGQdIQSb0ew+MDEft
 Aqtth+0jW6leky2erfSdAnJotKX5mIze/QRfvaW2J68fYDGwEM+BfcdNB
 IWI+wCGybUP9t1spZ81+EZ+23FQEonzZBLlwBKBULIWK+OztAyEdYOtgP
 13+M1aupFjiwb5EDzAXTTi7ywWi4FnMBnm6jMGxoUX14hQK/YVdj0GZvj w==;
X-CSE-ConnectionGUID: kO/PjO6xTUuaph/unTbLxw==
X-CSE-MsgGUID: HNAjmtrLSk+ixy+Szkcv5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90345254"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="90345254"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 01:32:05 -0800
X-CSE-ConnectionGUID: 7y641id8T8+O2grO7xJTZQ==
X-CSE-MsgGUID: 9aYfEuRdT4S/1VpVhnFkqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220370491"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 01:32:04 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 01:32:04 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 01:32:04 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.29)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 01:32:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0w5Dt900oqbZynHJLnEQ1Bb6fNAqsaCy2TXPfHk6wC1dafglMIgceCRQO1M5UCSpQMneDYTgTDi2Hj545cMQbIX0xV+kRQQMCtsXOQ0LOV73wIR93XSCA95sghdQrrKFJDXI1bP/uBevmo7uuKp8vJTZut0UxFTS2Ff1dpI5AosK6SYhLu95DLVOMXy8g1EHpf8dyEDFQ3VORk5Unx1QkBMwzvMLD2FV9AVHPHRdI6ObTa/rLWKcvI2jmOMLopTkVfCVVETGfYhpMDvLTvp+R0/UtnNbAdA+VUhfref2x4U3q/IfDUvBC2ba5k5xbt292EiylVqaOuY0g2gYE/v4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqm4n3SFoP+OtMEMwuKUAzFq8j2qhYQUPzekTKtr1wo=;
 b=uiAdZEX8swe3VFQ+6oLaHJET8SugU3wejMzcRW2AF8fda3gTRziBZW1RVXKLfuAu0oO5rtgICcHh2u5TXdaoRtLEulqHKtUTHb2rpJqaKOUVai6pP9oTa02YyCv28zSW7Xo7a8dYy/agi0QgGPGFoFf19CnxrqtDEiRiRrh5cG5WyNxywgvFlUGc5a3Ds3Kr6Ui7ruc2sLEeoLzCfvnfNeBhzjAWUHYJ5D1p00JisW557UpZhFoFU3aDvpIvRp2vszPwqQwle/g4uM+9EIgbG7mmnksaLlSCwfhehXRiAwo2eCgsfL4WYZhF8oCqONHLiK2Cq6XbBBMTCj0jQA78Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 09:32:01 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 09:32:01 +0000
Message-ID: <1a39b9d5-ed57-4f6b-a4e2-9e26a2734c32@intel.com>
Date: Tue, 24 Feb 2026 15:01:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/7] User readable error codes on atomic_ioctl failure
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, <xaver.hugl@kde.org>,
 <harry.wentland@amd.com>, <uma.shankar@intel.com>,
 <louis.chauvet@bootlin.com>, <naveen1.kumar@intel.com>,
 <ramya.krishna.yella@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Suraj
 Kandpal" <suraj.kandpal@intel.com>
References: <20260223-atomic-v10-0-f59c8def2e70@intel.com>
 <1a4462b8-def9-4474-8382-6e99b7c8276d@intel.com> <aZ1OIDsVfFvyHUK5@intel.com>
 <5f04b5f1-744e-449e-9a45-00fd477256fc@intel.com> <aZ1lbnop84k4du6N@intel.com>
 <f155fae0285684108e92887e963358ea0ea158e9@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <f155fae0285684108e92887e963358ea0ea158e9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::21) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|SJ0PR11MB5920:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ce0f9f9-efc0-49dc-6aa0-08de7387900b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVlxYmZ3cGZWOGVaSTV0QTNOaEYrSE1wMU1DTlhLMWhoUjZDSTA1STExb1Jv?=
 =?utf-8?B?WE1ML3NLM1draWFMcmFzMXVTcTlWcU8zTXQ3dFpLdlBpWndhc3JYTWZPMlN0?=
 =?utf-8?B?R2JJdHJqSFAxUmk3QWh0bkptQjNjSmlxMFhvWHlvVEJ3UnlUczVlZzRQRnlZ?=
 =?utf-8?B?NjZ5SGN0NXNDNEJjTUVqOEVKWGNScWZIRzFYTjRWb1dGSTdYOThRellWU05R?=
 =?utf-8?B?djFNYzdHR2lMMjF5SFliL2o5TkxhUWNWNkRmeTdPT25MbTVzREwxeUtYUkxl?=
 =?utf-8?B?MnlzMEN1bDJ0RlVNNzZObmQ1UjZKc3JaRTNabzNxdjliSnZ3aWptM3B5d0ta?=
 =?utf-8?B?YjVNVW9LM2FJSVp5c1IrQit4cGdHUjlVRU5TQVBxNm1pQkxwM2V5ZSsxL1lS?=
 =?utf-8?B?TUIycE1OV2cvOXZMeWkxb1NpdkhockhUQXJ2QjZia0hYUVVrUVFFWnZXanZV?=
 =?utf-8?B?R3dwVkU3K2VhSEJMQ0JHSzdpaVlLTnRHUkFEQkdVN1h5UUFkdnBnK1JyRHlP?=
 =?utf-8?B?OTN0MG5sOCsrVnJ6WkdycGY1S2Q3bUJJS0FCMkNGRU5mUzQxMEdZVVpNa3ds?=
 =?utf-8?B?eVVvMm5JM1lSdngvSzZXUFQ1aXBiRzF6TUcrR3F3OUR5TXhUZFZUVDc1cjQx?=
 =?utf-8?B?NWZsS1BhOTRTcHJ4N21iTFBhTFNmaCt1eHV0c0NxL2xlWFAvNXhWNUJNemxJ?=
 =?utf-8?B?SVdCU0RHTzlYNWljMmVoMG1xRzMxaGdUU1VzaHFaMEN4Umo4STRNT3R2TnR1?=
 =?utf-8?B?M0VIZ0N4VnYreTFNVjRTWXdDOVU1RlRQQXN2SUtJSThpdFVrNFdHR0N2UlJZ?=
 =?utf-8?B?WW1qV2t4YWZVTDFnOUE1dUdZM3o4ZnVoQWw2L2xQb09pVGtPL215V1F6SlJF?=
 =?utf-8?B?bnoxejU3eGZZOG04MmtQR1lDU0Q0UkdpV0RISkZaSGVaOHRRRGRHeU1OdzhL?=
 =?utf-8?B?aEpKZTVTRVROYXJxakRQQ2dreEZ0SHBuNjZhUXMwWDd2d0dCY0x1Zk5HV1pD?=
 =?utf-8?B?SWFINnduQmYvV3lpTmRtT012aVEyeDVzbzRuMmlsbU1OTG01YmpvdC9PYXZi?=
 =?utf-8?B?RTRXclVpSTlvR091VCswYWNPaVR1aXNwSW9PRVVaRW5QS3U2S09SVkNNYStQ?=
 =?utf-8?B?TzRwRlFvVjJKa1JPS3hQR0JkV0l4WWFjZWlpWCtIVndodlczSEFpeE0xQ1JY?=
 =?utf-8?B?RjdnZXBzUEtwVTdDMU81N0cwa1FPQjlUVGhKdGwveG1hSStRUCtTUHczUUF6?=
 =?utf-8?B?M2ZFUGFkRWpyazlXNnk2N1VFdy92RnBKeDlnQ015TWc2TCt1T0hLaVhFazlr?=
 =?utf-8?B?bXlDazVQdDVOVzB3VXFoa21mR0ZueUJqUUFIQlRiOStuQmlpeWYrdElqQmxY?=
 =?utf-8?B?YjVLYWovNXRvSVBrME9tS0RTQXFVaEZpYkk4b1Y2UjhoK3ZQejRnZ2QwdWFp?=
 =?utf-8?B?SjU4ZUtGbzBwM2ljTFlpblhrM29KeVNUZS91V251S09yT2l1NzkvOG1xU3Q1?=
 =?utf-8?B?MVU5V0VCREF2YzlyMTFqTGwyclQzdjRSeVQ3c1A4YnVvQytDTGZMRk9nd0Mv?=
 =?utf-8?B?UFUrVFc2S2VlNGQxdlpsU0hjbUszY0EzcGQ5cHRqYVRVNXZqbmNKSmExckFq?=
 =?utf-8?B?QXZnczRYa2JiTEdXME9LT1JQQXkvUnl6QlluQVVDMU9pM2tFYXlYUmE4UVFC?=
 =?utf-8?B?eUxSTmREcklNalRrb3YvNkEwQnl5dGZUdHZJUUs3Y3RsSWJ5ZmxUajFNckJW?=
 =?utf-8?B?b3o1NjZ1T2FXbGdnMTIwOTdDd1pYRDR4M3JMdzlVZnpsNDRjUFB1NmtZQmJs?=
 =?utf-8?B?WGcvVmxiUCtCaEhkdFFjaklqdDd3a2VLTUg5L2hxeTBaZ0RCUGI4ZzQ2ZjFM?=
 =?utf-8?B?OC80WFJ3eVBOOGhDR1NOdXZ4aVNhM003SEFOZWlUUXk2VkgvOXhVRUUrWDdJ?=
 =?utf-8?B?WmZZRFFQa0RqaHViQWM5RFZGZ05MbGpqTWNyUWlDamVPZ0cyOFo0SGx3azc1?=
 =?utf-8?B?MnBCOGlPNjJ5TThFZkxLakYxY2NGbk1mK0xVQW4weS90aUZZdFR0dWNlaHBt?=
 =?utf-8?B?cVJiVXZqbllPQkEyRm9mUlZteVZNd3o0VEExeWNtUzBXSk5vSEFMS3haRDFT?=
 =?utf-8?Q?uu1U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjAvZ1RXb1E0MzVJRHp3Q2FlMkNkMXJFK3pCKytvUGVveGg3RHRDZkRVNktt?=
 =?utf-8?B?UDdIVjZTUkR5Sk5rS0Z1N1V2Z3B5OVhVbXZXRFJIUDlaYTJPOU13Z25aUVlL?=
 =?utf-8?B?ZFBDbERwamkvYlJtYUE0dURKaFQ2TER4eDVTbzVTZzQ4dWUySUxzU2ROSVpH?=
 =?utf-8?B?TVFHSDhTUVBRUHl6MlJWZ3ZENDBKdEtCeWdBQWxQNTYvaEh0OGVpdk9VTlRB?=
 =?utf-8?B?QzM1TTZrQXpsKzMvcS9vSXBEVUFBT1R3OWc1NWRSaXpJQy9lclBITWltM000?=
 =?utf-8?B?OWxxRDNzNFlML29tMzRsU0srRzY4NUd5TVorRnJjUlJlM3Z3MzJjTHRWNHJF?=
 =?utf-8?B?SWo1aUlFRGorZHRrNGhtSlZ3bGxiNGhvbTNab09sRDdudEJ3LzVJQXM5UXJP?=
 =?utf-8?B?VHRRd3U3WHZ5YXNXWHlDREJWbVkwdXhVUnlUWEhkakMwaEpMY3lKL0crRjFE?=
 =?utf-8?B?ZW1zS291RVBDQVd6RXp6VTg4T1NmTi9YeFdGOStLS3lwZUtKemI2cUN2OFE1?=
 =?utf-8?B?L3FKUm53ZER0S1RwWGczV0lDbWNtWjdVTGdMemMyaXZ1ZGlkb3BxMFMwbGli?=
 =?utf-8?B?OXpYNEFoSlN2TGVhK1JDWkdycW5MWDVwbndBL1BVNExmbE5RSEM2RDQxOGMx?=
 =?utf-8?B?U2NzQWt5U21rbTV2T0RDWWdtd3NaS2dlYmVxVUhlTVFIbHVOd202WkgxKzJD?=
 =?utf-8?B?M3lkb09vdWpzLzN4QlJSbkRheGplaW1Lak1DalJ6NEY5b0xkWHhsb1diRmw0?=
 =?utf-8?B?alRLL0UxZ09vdjUxWWRKMERJY25yZG1tcXVMaFhUT29tVGVIem9oWTRHZGtI?=
 =?utf-8?B?T1N1OEtXRThyUklzLyt2enVVam5kMUNSaGFpNFNheS82bEozOUtTRllpcjdo?=
 =?utf-8?B?N3dUMS9Ec2MxcEpkNXVxalRCS2F1dmVQWm82R0VrODg1UXRwdWNtK3hDZzJs?=
 =?utf-8?B?ZkhmVkF5cHMwQWlXbkhSd1ZVS2doR0EyMUFqRDlTLzBDVWtVNlZCdk9GZXZs?=
 =?utf-8?B?N282UjFKbC9pQVg3T1dVU3NlT280MFJHbHJOZjYybzF1dVZ4NnBMNFJjem8v?=
 =?utf-8?B?Z1cxZXVqSXFZOVJjQW5mcFhnemJlRjNVZ1J3c1NnWHZGUWRFZ3BQTXlhakVj?=
 =?utf-8?B?TWZQdmRaRFRLMnlabjQ0YUJISVJNYVZiUFI2Vlp6MytYZ1lCYi9DYXM5clY3?=
 =?utf-8?B?aE1IN3ZueklQNUZOOFdZSi9BU3VjU2ZWWUpWRjgxcVV6NFdDMEN6eG1QWnNP?=
 =?utf-8?B?NS8raWR0d0pEQWpQcU1rWDFzc0p5V0swbWNJZTBuazYrblBGV0tyUHpFT0xm?=
 =?utf-8?B?ZkFFZVRqcDJpRldqcmlzblU3VGxVOUVncFVGR0l3S3ZMMkYvaG5YOEYrS0JO?=
 =?utf-8?B?N2pPRFRVb2R6ck5qUXZhL1FFVTk0YnhYWWpmbHhrUzJHeWl3S0tUUVBaNERm?=
 =?utf-8?B?ZWtneFJlcG9lMjdZMjN5YklhQlB6VHVmcWZQVzVQSjVjR2pkZ1k1ek56Z0Fs?=
 =?utf-8?B?bElnWUZCNnpBR01KbDdWQ1FST3Rydmt6VVdMNmNxc0ZHTWlDVndNcS9RZTVO?=
 =?utf-8?B?eDd2anZXcXhJdG5iZlhKVFRSZUVTVU9pVlZYWjZYbVNrSmVrbUs3UmJPSWh2?=
 =?utf-8?B?SHFUR1lQUXdBdVl4bEovRkhBUEgvM1A0b0kzRXFlVlFhOU9BQ1NMckd6Z05j?=
 =?utf-8?B?aDlBcENIYVJYVVN1L2VFZVdNYkJveEpaeDB0SmxFZ013MFZaN2YwYjlpWDVa?=
 =?utf-8?B?WElkdGpwZmpvMU1CdFN6cDJBR1ZiZHVVMU1XNUVZNHY2WURGcUkxdlVsVE9R?=
 =?utf-8?B?N2MvY0JxQTlFTzVMdkhNbHo2Uzl1eWFxUWdOR0JrRS9UV0pzVE1jeUtPSU81?=
 =?utf-8?B?MEFHeG5kSmFqSm54VzBGTTR6Y243WWpaZ2Y3dnZXMjN0S0FkekNBRk9Nbysw?=
 =?utf-8?B?dGZtbXdrMCtvZHNnOGdUaG9oVEQ2VTE3VmVPczFTV3RJbVpSQVNIVVMxS1ZJ?=
 =?utf-8?B?Q3V0Zi9VYzgyUlBkWHY0cThUMG1PbXVCRERzR3B4WVFjQzYzcGtnNjhkTDU5?=
 =?utf-8?B?UFN1MHVwcHlzZDM0cCt4bDBvU3BGN2ErKzhWQWsrUU5tVzJxNUNDeS9LM0JL?=
 =?utf-8?B?NmpHb3RKeDZRYVQySHlBcVQzNVBSNk5sZlMyQ1ZwL0xXUkNKdXd1N2dXeWsx?=
 =?utf-8?B?b3h1amlJVWFUWXp0aEgvYlJNenVsRlhJaCtwVnZaNWVmZEgzNURxeUIzQW92?=
 =?utf-8?B?SEQxYWJCLzIxTFJ1VW02REtwbUdnRFlzb3RIdXAzQzhPeUROT2FGQkZEQnEr?=
 =?utf-8?B?aXpzenF4OTc2OXlvN2gxRlcvL2UwQUFJeFhPa1EzVnRHSHZGTlR6cElXbjdp?=
 =?utf-8?Q?M+Lwq7JZ3ap3Xykw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce0f9f9-efc0-49dc-6aa0-08de7387900b
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 09:32:01.0935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MPNS5YiwuKxl8VsrvdIYib3kqx3DIXCe1YWstoDPfwM83OqYBVjq3RscpJT+tq+VqWMc4OvW9GewFEq0dU2Ebg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5920
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ursulin.net,kde.org,amd.com,bootlin.com,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.r.murthy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: D8B8A184A57
X-Rspamd-Action: no action

On 24-02-2026 14:58, Jani Nikula wrote:
> On Tue, 24 Feb 2026, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
>> Although I kinda doubt its actual usefulness to drive useful
>> fallback logic because often the restrictions might be a combination
>> of many things, and the kernel can only realistically report one of
>> those things.
> Yeah, this is my main concern as well. The drivers will have to bail out
> on the first issue they hit, whatever it is. The drivers may choose to
> do the checks in different orders, resulting in different failure modes
> for different drivers. And finally, accidentally making the order of the
> checks part of the ABI contract is a scary prospect. Imagine user space
> depending on certain checks happening first in order for the fallback
> logic to work properly. Is it a kernel regression to change the order of
> the checks then?
We are just reporting the 1st error that we see in the KMD and return 
from there.

Thanks and Regards,
Arun R Murthy
-------------------
> BR,
> Jani.
>
>
