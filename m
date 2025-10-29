Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E09DC18595
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 06:48:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2BB810E14E;
	Wed, 29 Oct 2025 05:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zelr4Fhz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5207E10E14E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 05:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761716876; x=1793252876;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P9SLW4dDfwiU3o9OOZmkv2lItlywGxz6GID/MY0IPWo=;
 b=Zelr4FhzHzs/8NeS+p9vZ4Aif3MguUsBgNfBzjzpC0z/wgaEl5k2Vzfu
 MgBvti5qa5caCIZ8+QiWHdJQwQ26kI+JG7lawscOiOGEvXsaDs4vbav0h
 cL1Rav7oQqA46OwU+jL5NjlDLBS9fmcj5x5P+zBrqNRyb4SlIHg1DjzEE
 az+Y6Nsam8JqEF+dy4xFTrXvw6knkV0EQmZvO2WP0uauAEAVGFsHZDPW/
 ioBeFP3K8zgJwWFtOHTFGMvrFYvRKf+68lV/tI7TyUGWEQMut9sglYpyD
 pA9yNrpcklP+imntfppuRBZssU3I1wdslnXc6tJXLxSAfC95bRL8NkB5t g==;
X-CSE-ConnectionGUID: 1rlghUoRQ1qRIDPZE7j9SA==
X-CSE-MsgGUID: fKpkh+6uRym5oQRiZC2buw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62856536"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="62856536"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 22:47:56 -0700
X-CSE-ConnectionGUID: +zcIo1J4SZWsS6qP9KgeVw==
X-CSE-MsgGUID: j5GCwAThSDOB7OamFdaEqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="185636956"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 22:47:55 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 22:47:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 22:47:55 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 22:47:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Me65hFVoqQ0OHmNTpfcXHNxhUjiSe5SfoW7Vj0qXeVISCrUKlrYhBvxOygvjxd/0v+oDiKJe0YRKV/CxiMg8rg21Mo3CF/Be4/fnAI3zNkqZJ5I02GzZ46wNN92knVAS8d4XIqL+LQHbu4uBncYuwAxFRgGdrf6eX/k4uZRP5W8yW6FZlpy+GD9GHHLThlYpWpSKVayELCE9WItyEJ0Sawp0eI/jEkckp+K8iQoUk50ctFnCRP5ZqhOoUNJ8c22VMLmEXmP2Ty3Ct5cri9659hefBGHz13tBFRRHQ8IuEXDl8W08kcF9oW8tkUZmgBiWkfCCQDXyMqJaJrprXK1WwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9SLW4dDfwiU3o9OOZmkv2lItlywGxz6GID/MY0IPWo=;
 b=oUUwfhMooyS6lngUBmXb0SAw55KJMs07kuly+HvH6KFt/iRsfRQkJdE6OhcAP7gnbQLcZllMI3gLMiJGNBN1oowXElrpR5a8lGK/iR9bx3v7QJY9R+grPVllvw7qO7JbLHEwQE2LQ6opfnAM7ITZYsAg1FZ3RMkCej1TGeItZG0KnBaqfudcyguyxXK4ocJPt2lpn2BxUJcHKF+suhRKqFWh7grPLyOYZ0K/SwPU4HRqRV0xULf0q5MiwJvCO+EeYUafXbjFQSvXi2PmWm9jIf4T7fyUqMANKBdJDKxbqxoefXiLpASbwi0VanRa1xVr/o7g00Kzg4Ld6t1Wzbdmbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by LV3PR11MB8460.namprd11.prod.outlook.com (2603:10b6:408:1b4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 05:47:53 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 05:47:46 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, "gurchetansingh@chromium.org"
 <gurchetansingh@chromium.org>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>
Subject: RE: [PATCH v4] drm/virtgpu: Make vblank event dependent on the
 external sync
Thread-Topic: [PATCH v4] drm/virtgpu: Make vblank event dependent on the
 external sync
Thread-Index: AQHcRyfvcpYOJVPbTkGCrlhdg7m/dLTXuRYAgADddcA=
Date: Wed, 29 Oct 2025 05:47:45 +0000
Message-ID: <IA0PR11MB718584C85B844B3ED6115858F8FAA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20251027095550.110562-1-tzimmermann@suse.de>
 <1e4a29e7-bf98-4193-962a-66fd251e2c72@collabora.com>
In-Reply-To: <1e4a29e7-bf98-4193-962a-66fd251e2c72@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|LV3PR11MB8460:EE_
x-ms-office365-filtering-correlation-id: f755a653-3542-4dd9-bdf0-08de16aeafb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SlpubzFOdkxtaVJTYXNFSkVESHJpN3BNTGp0eTN3RFBvUFljckVPRXl4R2RZ?=
 =?utf-8?B?ZStQNGZCL2habGlFRitNNXdFNEFTQ3JzcU9pMld0VGkyNW5ES0drODVLUzBO?=
 =?utf-8?B?eDI2cEhXMzUvZlV6S2VWTTIwV203Sy9zbVhUNFhhZmpJUXl1WTRkaHh3azg2?=
 =?utf-8?B?bk5OaEU1MVNYSXhKYXV0V0lXYlNOQWZvenpBSDRPRGN2VEgra0lLc3BwTm5S?=
 =?utf-8?B?L3dFbHpEaVFPbEpIeFNuVmZ6K01ZY0dJVWNQMGZFZEt4ZExZejMydWlZdlBY?=
 =?utf-8?B?cXUwWGZUbjFCaGlxYzNlRS9FVVBSS3QvVVp0MUhBemltODRYZVJKdUxSM3Fx?=
 =?utf-8?B?VE1ZMC9pcmlUeThtT2txdXJUU0lFa21uSHBlVWFxemZNSGsvbitNbUlyRC94?=
 =?utf-8?B?ajEwL05pR1FyckNFbEdOYVJGS2RETkFSKzdwR3g3QzZ5WXlEcjVoRlNBZjBa?=
 =?utf-8?B?OTBqN0lUKzVDRG82c3JOcTA3ZXF1REZ4bWxRTUk5aXVlaTlISFNrYTM2NVJB?=
 =?utf-8?B?b3dSRGZoT2ZCTzJaaXZZblBJcnowVnpZMmowc0szVlp4QlplQmZxWWt0R0Rl?=
 =?utf-8?B?b0FsNVF1Q2w4Y0lHeFJWOGpkTUtjUTFtR0h2bXF5cnZxM1ppZXdlV3E4aVZq?=
 =?utf-8?B?UmdqRnBOM2tYRU56M1hJbXVheFJMbDdoU200aStIcEYwWjdtOGJvYStYYkti?=
 =?utf-8?B?Mi9PanVSUlZiRjBhdWREanpsWnczRmhoUnRSaWthaExOWGNtcW9SK01pTFFX?=
 =?utf-8?B?MzZTNTBZT2k5QXhPZU5QMWxMQnJtME15VlNML3IwbW5qQzNMMFkrYjc2MkZi?=
 =?utf-8?B?SWZlV2czdjJRdVFQd2Ewb29NQkVQaUsxUHc1cWozcVNMVmlKUGVqa3E2NWhG?=
 =?utf-8?B?ZENOTEJUWEdhbmhFVnJ3VFVVc1B6NCtOcW01T010SlRNOEVDaHUwQWoxRmxz?=
 =?utf-8?B?dFhlVjZkY2VtVTU3RkxGdXY2VE1xanJjQnZ3UW1DTXFFTUZXSlpMRUJPQzJi?=
 =?utf-8?B?dVhPQXJLYWd4NDBXSEVyRGRDUEl0QVZ1WEJPc24xK2FydmJJaHBJRTRrZ1Vs?=
 =?utf-8?B?elRiT3pvQ0FhSjlqYkdKbmduRUJCcDhuclZTQSt4VlVwWkpvUzNuRURlcVVl?=
 =?utf-8?B?bG9YZnFBalhpTS9LVlBoYWRTczcwZ3hCYVg4elJBTlZqVG1iV085NDhLWFVO?=
 =?utf-8?B?cW5GMmU5bkpUZC9nZGc1SkRZZnNGMFJMTVNqcXZhUHVKOWthQ3hzME1XVm0v?=
 =?utf-8?B?NzZwNFBSQWFTZWpndkc2RWFSSE1kVDNiRnJudSs3ekhiWmM0cmNwMHpUZmVq?=
 =?utf-8?B?UXk2TTN5MERXc00rTlY1VE5NTWFTTGFoSnBEbXpIb3RzT2pxbmUydGxPcEFQ?=
 =?utf-8?B?YmJ0NnE0L250eFRoQTRJQVZTbEI1b0x4dnd5aVE3TkRlRlpkV3pDVHdSYS9R?=
 =?utf-8?B?VjNnTDR6dVFrMU0xeEI4MmRiY3kzalppOC9qaThyVk40RE9NWXQ3TFl0WThZ?=
 =?utf-8?B?TkNneFM2RFFTbEF4citHWmlVRDlmemh5Q2dOS213NXBzT1plYnRMcytnZ2ly?=
 =?utf-8?B?TE9PU01OUmRERzJCVVA1a2QzcEZtd09sd0tRV1ovaUxjSzdyUUh3N2wwQjJT?=
 =?utf-8?B?VzlqSGRyNXZ4Q2ZBM21OVTFrTVVWekxBQ1lmK1phenJVTGU0QzhDREJ5RUpZ?=
 =?utf-8?B?MzIzYXRsQ0xaNHFTNzR6MnlHZzhDdlpGYVBOcndWSTE2d1ZzTGk3V0hOa3pM?=
 =?utf-8?B?Mk0yaStmNERncU5UZVRDVVFXTStzbk9QNmRoUWx0ckVUT0NDUTg3Q0JGWlBD?=
 =?utf-8?B?N0dXRmlHNmNtYUhBam9pTDh0Skh6aTVnZGZBUlM2a2tZZThvWi94MllITXhG?=
 =?utf-8?B?Z0o4L3gwd0VqS1dwK3VnVloyUkpqNUFxOGE3WjIvZ2VhdkFuMjZJeWZBYUVt?=
 =?utf-8?B?ZEFQNXcvWW13T1RyTloyNk05dnUrVFFuT0l6eEQ2aXc1R2VZZ0puWXZqWk51?=
 =?utf-8?B?M1Exc244Ry91VFhobHd1aTJYZVlzL0crZ0hKR1lDamErdzFSZEc1RTNIVVp6?=
 =?utf-8?Q?EWGbkE?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzRUYmFLS1pNYnE2TXI2NlYrZmVaT1g3NkxoaWZnamVXTDRJbHlhbVVTMjNL?=
 =?utf-8?B?ZUkrb2pxTXNSOUkrQzBpRUpFeVJtOWNoMk5UblhqaEIrWDJIeDN6UW5NY21u?=
 =?utf-8?B?eXJ3MWFXeHE3RmhEaWM4Y1lYaGRaZ01qSkFRbVlrZmI3TWNjbEVhYmtQNlZL?=
 =?utf-8?B?Zm5RWDQ1UFlSTjh6eDJXTGNXTlVlczhsOC9qUHUwKzBmOHNPUi9ncmVvS3Yx?=
 =?utf-8?B?aDdiSmVjUy9FQ29RSVA3Z2laUjZRSnJPVUlmZ2d3OENXdStZakY2OGFYUFhD?=
 =?utf-8?B?aXZvMmtXaEFUcndPcEh1dXR3WDVjckphK01DYVpuU1RTVmNaR05Zc1lVVnQx?=
 =?utf-8?B?eE4zMU5aVTNUR2hCckpjcmJqK2JDS050UTFMVHpSdCtRS0RMN0U1MkRYVEJr?=
 =?utf-8?B?SExFM2JoZDhNV09wSTZaMk82WVQ3TjhLaXdYVzJta011aXVCdHFNOS9CMnhu?=
 =?utf-8?B?bkxPTnlValA3ejBjUy9aaWppS1FjR2JUSU9lZzRYQnhWWm1kR3ZPYTg3eStZ?=
 =?utf-8?B?dmFWRFZyQmdDNGhlbnUxMEg3RGFCMmtaTTk4THhTSzhtay9ESXpYdDV0eEdr?=
 =?utf-8?B?L0hYVldXbUE3V1M1b0VqMmkxaW9jNytPMS9BOWNaLzRScCtyME4yeGpGaldk?=
 =?utf-8?B?UkRvWjdPWXo5RGhoZjhXY1lwT0JmbEsvdC9sd0M4UUk0S2dVWVdzYitkaUV1?=
 =?utf-8?B?RUhmK1ZsMUtOT0pXUWRqcFd1ZDV3NUNzS0t2UTgybktFRmJuYTNVeHJCVnRS?=
 =?utf-8?B?VCtlcGZZRGdoN2laQXZ5QVJFZVpuLzRLcnFhdzVHMnpMdElzeWN6N2M2ZVpj?=
 =?utf-8?B?SFFSNHpWU0FQeEpEWExQeUpYY29ZbWZCK2RwSlRWdkFFNUdoTEhtbXpWMmd0?=
 =?utf-8?B?QXJ3azNQTk1QKzZzVlNBY0x3RSswZ3hUcjZXdUVIQi90ejcwd0JscS9lRjl3?=
 =?utf-8?B?M3FLeFp4VUM4RWQ0aGdhZlR6RjZUQ0QyWVhsMEFDUnROQVlZVDFCYTU5WHR0?=
 =?utf-8?B?Vmd0QzlpZTAyMjU0azZOa3lRNTZLQ21Ed3ZEMU5JZ3pqNDd3QWFMM0hLUytj?=
 =?utf-8?B?SktyQ3g1THJIa20vYVEveHVPU0hyNVJkVXBRRWZlR2VQTzkrWi9mak54SVBj?=
 =?utf-8?B?NGdBbFJiZ29RbVBQKzdJWTVlVkpJVFQ3dkhYbFo3TTJSK3JZOEttSEpIbVF6?=
 =?utf-8?B?ZTNKRnZjV1F5b0pwTTBIa3BWdkJUWW5Na0FiR1hNSG1NTldGelhaZzBzMmtp?=
 =?utf-8?B?dDVxdVNqQXViVExpUldnaUw4RlhlU1lBZC9QZG55S3lxQjdILzZpb09MeGky?=
 =?utf-8?B?dGpjVlIvYjhoU3FMYzNkR0RVbjhVeHdVSEZpRE41Z05KNVB1d2d4aFhZRGxr?=
 =?utf-8?B?MXFqb1dRaTk3WDRJb0RlZ0t6WVFLUzBVZDk4THVZSGJaOXBManR2eFd1VVJZ?=
 =?utf-8?B?QXkxSU1jc01kdGRrN0pETktGSkhucmpBZlZuMUZlYktaVkdweSsyRTU3Zmt0?=
 =?utf-8?B?cHhOWjdSUDRhUUxRQ3ZhbGN1MDc4QXJubWxwMEdOWkk4dTVXMEpiYUxPRWdh?=
 =?utf-8?B?RnRDb1FWZEdoeWY5V0RUZUN5OWNPdDR3YXBqeWYraTRBTG5yRkdTK0VxOWpt?=
 =?utf-8?B?dDVLcHRQOWxIWU56a1p1S3loNk1lTzVEdTN5UFlPUUtLR2hDNWt1ZnAyUTYr?=
 =?utf-8?B?R2RZRjIzcWY4ZGQ5eXJTUTRoYXY0dG5Cb3FTeGpySExtdzBJTVRaeEl6N0Ns?=
 =?utf-8?B?NG1OYko0dVJtV3RRTGU2MlNhZHRHVXVWMXFoZWJQUlBCK2txTlFEejdLQUwy?=
 =?utf-8?B?MWp1Lzh0SFozSDJOVWw4eXo4bDNDWDRwb0FZMHZqZ1hDNkYwTHhmc0wzUnVP?=
 =?utf-8?B?M0NDMlVkV1JrVE0vK3drZUdEcEFVbWhJUFJRRlk5Q0kxbVZ2V2dtbVNlUy8y?=
 =?utf-8?B?ZHV1WVVGdFZGaEVBWEp6ak9vOUhkVnpNS1NNNlZRVVpsV2tFdGxKWEoyMk5r?=
 =?utf-8?B?ZTFOK3RsaDZiQUNYUER1SUpuQ1Q5YVU5TzdSZFNGZ1lvdHJlNHBUcHowcU8r?=
 =?utf-8?B?VVVCYk1uL2RTM0JNYW5VUjZvemlabUpOQXZyZUhHNzI3dDdleWw0K0xWcjEy?=
 =?utf-8?Q?7U0fir64s7up0gG2Fru155svA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f755a653-3542-4dd9-bdf0-08de16aeafb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2025 05:47:46.0415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A+Ld8kcj7yHkIuzjv/H3DlvxC1/mPqUE7Nwh1MFRDdJe5LhMLdXRIMSGphOad6F4iHTL60JLpM6utks3pGjDr13ujbNFiYYVpXSl3Sqcfy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8460
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

SGkgVGhvbWFzLCBEbWl0cnksDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NF0gZHJtL3ZpcnRn
cHU6IE1ha2UgdmJsYW5rIGV2ZW50IGRlcGVuZGVudCBvbiB0aGUNCj4gZXh0ZXJuYWwgc3luYw0K
PiANCj4gT24gMTAvMjcvMjUgMTI6NTIsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPiA+IEZv
ciBlYWNoIHBsYW5lLCBzdG9yZSB0aGUgYnVmZmVyIG9iamVjdCdzIHN5bmMgc3RhdHVzIGluIHRo
ZSBzdGF0ZQ0KPiA+IG9mIHRoZSBwbGFuZSdzIHJlc3BlY3RpdmUgQ1JUQy4gRHVyaW5nIHRoZSBD
UlRDJ3MgYXRvbWljIGZsdXNoLA0KPiA+IGlnbm9yZSB0aGUgdmJsYW5rIHRpbWVyIGlmIGFueSBv
ZiB0aGUgQ1JUQydzIHBsYW5lJ3MgYnVmZmVyIG9iamVjdA0KPiA+IGlzIHN5bmNocm9uaXplZCB0
byBhbiBleHRlcm5hbCBzb3VyY2UuIEluc3RlYWQgc2VuZCB0aGUgdmJsYW5rIGV2ZW50DQo+ID4g
aW1tZWRpYXRlbHkuIEF2b2lkcyBjb3JuZXIgY2FzZXMgd2hlcmUgYSB2YmxhbmsgZXZlbnQgaGFw
cGVucyB0b28NCj4gPiBsYXRlIGZvciB0aGUgbmV4dCBmcmFtZSB0byBiZSBwYWdlIGZsaXBwZWQg
aW4gdGltZS4NCj4gPg0KPiA+IEV4cG9ydGVycyBvZiBHRU0gb2JqZWN0cyBzb21ldGltZXMgaW50
ZXJmZXJlIHdpdGggdGhlIHZibGFuayB0aW1lcjsNCj4gPiByZXN1bHRpbmcgaW4gZnJhbWVyYXRl
IGRyb3BzLiBIZW5jZSBkZXRlY3QgdGhpcyBjYXNlIGFuZCBoYW5kbGUgaXQNCj4gPiBhcyBvdXRs
aW5lZCBhYm92ZS4NCj4gPg0KPiA+IFRoZSB2YmxhbmsgdGltZXIgaXMgc3RpbGwgYWN0aXZlIGFu
ZCBmaXJlcyBpbiByZWd1bGFyIGludGVydmFscw0KPiA+IGFjY29yZGluZyB0byB0aGUgZ3Vlc3Qg
ZGlzcGxheSByZWZyZXNoLiBUaGlzIHJhdGUgbGltaXRzIGNsaWVudHMNCj4gPiB0aGF0IG9ubHkg
d2FpdCBmb3IgdGhlIG5leHQgdmJsYW5rIHRvIG9jY3VyLCBzdWNoIGFzIGZiY29uLiBUaGVzZQ0K
PiA+IGNsaWVudHMgd291bGQgb3RoZXJ3aXNlIHByb2R1Y2UgYSB2ZXJ5IGhpZ2ggbnVtYmVyIG9m
IGZyYW1lcyBwZXINCj4gPiBzZWNvbmQuDQo+ID4NCj4gPiB2NDoNCj4gPiAtIG9ubHkgaGFuZGxl
IGltcG9ydGVkIEdFTSBidWZmZXIgb2JqZWN0cyAoRG1pdHJpLCBWaXZlaykNCj4gPiAtIGZpeCB0
ZXN0IGZvciBwbGFuZSB2aXNpYmlsaXR5IChWaXZlaykNCj4gPiAtIGFsd2F5cyBlbmFibGUgdmJs
YW5rIHRpbWVyIHRvIG1ha2Ugd2FpdGluZyBjbGllbnRzIGhhcHB5DQo+ID4gdjM6DQo+ID4gLSBk
aXNhYmxlIHZibGFuayB1bmNvbmRpdGlvbmFsbHkNCj4gPiAtIGNvbXB1dGUgc3RhdHVzIG9uIGVh
Y2ggY29tbWl0DQo+ID4gdjI6DQo+ID4gLSBlbmFibGUvZGlzYWJsZSB2YmxhbmsgdGltZXIgYWNj
b3JkaW5nIHRvIGJ1ZmZlciBzZXR1cA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFpp
bW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+ID4gLS0tDQo+ID4gVGhpcyBwYXRjaCB3
YXMgcHJldmlvdXNseSBjYWxsZWQgImRybS92aXJ0Z3B1OiBNYWtlIHZibGFuayBldmVudA0KPiA+
IGRlcGVuZGVudCBvbiB0aGUgaG9zdCByZXNvdXJjZSIuIEVhcmxpZXIgdmVyc2lvbnMgd2hlcmUg
bWVhbnQgZm9yDQo+ID4gdGVzdGluZywgcmF0aGVyIHRoYW4gYmVpbmcgbWVyZ2VkLiBTZWUgWzFd
IGZvciBhIGRpc2N1c3Npb24gb2Ygd2hlbg0KPiA+IHRoZSBmaXhlZCBwcm9ibGVtIGhhcHBlbnMu
DQo+ID4NCj4gPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsLzIwMjUxMDE2
MTQ1MjMwLjc5MjcwLTEtDQo+ID4gdHppbW1lcm1hbm5Ac3VzZS5kZS8NCj4gPiAtLS0NCj4gPiAg
ZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rpc3BsYXkuYyB8IDY3ICsrKysrKysrKysr
KysrKysrKysrKystLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2Lmgg
ICAgIHwgMTUgKysrKysrDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wbGFu
ZS5jICAgfCAyOCArKysrKysrKystDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTA0IGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBObyBwcm9ibGVtcyBzcG90dGVkLiBJJ2Qgb25s
eSBleHRlbmRlZCBjb21tZW50IGluIHRoZSBjb2RlIGV4cGxpY2l0bHkNCj4gc3RhdGluZyB0aGF0
IGRybV9nZW1faXNfaW1wb3J0ZWQoKSBpcyB0aGUgd29ya2Fyb3VuZCwgbWlnaHQgZWRpdCBpdCBv
bg0KPiBhcHBseWluZy4gV2lsbCB3YWl0IGZvciBWaXZlaydzIGZlZWRiYWNrLiBUaGFua3MuDQpJ
IGFwcGxpZWQgdGhpcyBwYXRjaCBhbmQgdGVzdGVkIDMgZGlmZmVyZW50IHNjZW5hcmlvczoNCjEp
IGJsb2I9dHJ1ZSArIGltcG9ydGVkIGJ1ZmZlcnMNCnJvb3RAbG9jYWxob3N0Ondlc3Rvbl91cHN0
cmVhbS93ZXN0b24jIC4vYnVpbGQvY2xpZW50cy93ZXN0b24tc2ltcGxlLWVnbCAtbyAmDQpVc2lu
ZyBjb25maWc6IHI4ZzhiOGEwDQpoYXMgRUdMX0VYVF9idWZmZXJfYWdlIGFuZCBFR0xfRVhUX3N3
YXBfYnVmZmVyc193aXRoX2RhbWFnZQ0KaGFzIEVHTF9FWFRfc3VyZmFjZV9jb21wcmVzc2lvbg0K
MjQ1IGZyYW1lcyBpbiA1IHNlY29uZHM6IDQ5LjAwMDAwMCBmcHMNCjIzNiBmcmFtZXMgaW4gNSBz
ZWNvbmRzOiA0Ny4yMDAwMDEgZnBzDQoyNzkgZnJhbWVzIGluIDUgc2Vjb25kczogNTUuNzk5OTk5
IGZwcw0KMjQwIGZyYW1lcyBpbiA1IHNlY29uZHM6IDQ4LjAwMDAwMCBmcHMNCjI0NCBmcmFtZXMg
aW4gNSBzZWNvbmRzOiA0OC43OTk5OTkgZnBzDQoyODMgZnJhbWVzIGluIDUgc2Vjb25kczogNTYu
NTk5OTk4IGZwcw0KMjc0IGZyYW1lcyBpbiA1IHNlY29uZHM6IDU0Ljc5OTk5OSBmcHMNCg0KMikg
YmxvYj10cnVlDQpyb290QGxvY2FsaG9zdDovd2VzdG9uX3Vwc3RyZWFtL3dlc3RvbiMgLi9idWls
ZC9jbGllbnRzL3dlc3Rvbi1zaW1wbGUtZWdsIC1vICYNClVzaW5nIGNvbmZpZzogcjhnOGI4YTAN
CmhhcyBFR0xfRVhUX2J1ZmZlcl9hZ2UgYW5kIEVHTF9FWFRfc3dhcF9idWZmZXJzX3dpdGhfZGFt
YWdlDQpoYXMgRUdMX0VYVF9zdXJmYWNlX2NvbXByZXNzaW9uDQoxNjcgZnJhbWVzIGluIDUgc2Vj
b25kczogMzMuNDAwMDAyIGZwcw0KMjA4IGZyYW1lcyBpbiA1IHNlY29uZHM6IDQxLjU5OTk5OCBm
cHMNCjIwMyBmcmFtZXMgaW4gNSBzZWNvbmRzOiA0MC41OTk5OTggZnBzDQoyNTIgZnJhbWVzIGlu
IDUgc2Vjb25kczogNTAuNDAwMDAyIGZwcw0KMTgwIGZyYW1lcyBpbiA1IHNlY29uZHM6IDM2LjAw
MDAwMCBmcHMNCjIxOSBmcmFtZXMgaW4gNSBzZWNvbmRzOiA0My43OTk5OTkgZnBzDQoxNzYgZnJh
bWVzIGluIDUgc2Vjb25kczogMzUuMjAwMDAxIGZwcw0KMjIwIGZyYW1lcyBpbiA1IHNlY29uZHM6
IDQ0LjAwMDAwMCBmcHMNCg0KMykgYmxvYj1mYWxzZQ0Kcm9vdEBsb2NhbGhvc3Q6L3dlc3Rvbl91
cHN0cmVhbS93ZXN0b24jIC4vYnVpbGQvY2xpZW50cy93ZXN0b24tc2ltcGxlLWVnbCAtbyAmDQpb
MV0gMTEzNw0KVXNpbmcgY29uZmlnOiByOGc4YjhhMA0KaGFzIEVHTF9FWFRfYnVmZmVyX2FnZSBh
bmQgRUdMX0VYVF9zd2FwX2J1ZmZlcnNfd2l0aF9kYW1hZ2UNCmhhcyBFR0xfRVhUX3N1cmZhY2Vf
Y29tcHJlc3Npb24NCjI4NSBmcmFtZXMgaW4gNSBzZWNvbmRzOiA1Ny4wMDAwMDAgZnBzDQoyOTEg
ZnJhbWVzIGluIDUgc2Vjb25kczogNTguMjAwMDAxIGZwcw0KMjkwIGZyYW1lcyBpbiA1IHNlY29u
ZHM6IDU4LjAwMDAwMCBmcHMNCjI5NyBmcmFtZXMgaW4gNSBzZWNvbmRzOiA1OS40MDAwMDIgZnBz
DQoyOTEgZnJhbWVzIGluIDUgc2Vjb25kczogNTguMjAwMDAxIGZwcw0KMjkyIGZyYW1lcyBpbiA1
IHNlY29uZHM6IDU4LjQwMDAwMiBmcHMNCg0KVGhlIHByb2JsZW0gaW4gdGhlIGZpcnN0IDIgY2Fz
ZXMgYWJvdmUgaXMgdGhhdCBhcyBsb25nIGFzIGJsb2I9dHJ1ZSwgdGhlIHZibGFuayB0aW1lcg0K
aXMgbm90IGhlbHBmdWwgYXMgd2Ugd291bGQgYmUgb3Zlci1zeW5jaHJvbml6aW5nLiBOb3RlIHRo
YXQgZXZlbiBpbiB0aGUgc2Vjb25kDQpjYXNlLCBpZiBibG9iPXRydWUsIHRoZW4gZXZlbiBkdW1i
IEJPcyB3b3VsZCBzYXRpc2Z5IGJvLT5ndWVzdF9ibG9iIGNvbmRpdGlvbi4NCg0KU28sIEkgYWRk
ZWQgdGhlIGZvbGxvd2luZyBjaGFuZ2VzIHRvIFRob21hcycgcGF0Y2ggYW5kIGNhbiBub3cgYWNo
aWV2ZSBGUFMgPj0gNTgNCmluIGFsbCAzIGNhc2VzIGFib3ZlOg0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmly
dGlvL3ZpcnRncHVfZGlzcGxheS5jDQppbmRleCBhNGZhOTQ4MDIzZGEuLjEwYzRhMTZhMzkwOCAx
MDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kaXNwbGF5LmMNCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kaXNwbGF5LmMNCkBAIC0xNTksNyAr
MTU5LDEwIEBAIHN0YXRpYyB2b2lkIHZpcnRpb19ncHVfY3J0Y19tb2RlX3NldF9ub2ZiKHN0cnVj
dCBkcm1fY3J0YyAqY3J0YykNCiBzdGF0aWMgdm9pZCB2aXJ0aW9fZ3B1X2NydGNfYXRvbWljX2Vu
YWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpDQogew0KLSAgICAg
ICBkcm1fY3J0Y192Ymxhbmtfb24oY3J0Yyk7DQorICAgICAgIHN0cnVjdCB2aXJ0aW9fZ3B1X2Ny
dGNfc3RhdGUgKnZnY3J0Y19zdGF0ZSA9IHRvX3ZpcnRpb19ncHVfY3J0Y19zdGF0ZShjcnRjLT5z
dGF0ZSk7DQorDQorICAgICAgIGlmICghdmlydGlvX2dwdV9jcnRjX3N0YXRlX3NlbmRfZXZlbnRf
b25fZmx1c2godmdjcnRjX3N0YXRlKSkNCisgICAgICAgICAgICAgICBkcm1fY3J0Y192Ymxhbmtf
b24oY3J0Yyk7DQogfQ0KDQogc3RhdGljIHZvaWQgdmlydGlvX2dwdV9jcnRjX2F0b21pY19kaXNh
YmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dmlydGlvL3ZpcnRncHVfcGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9w
bGFuZS5jDQppbmRleCA2MzRlMWE5MzA3ODMuLjgzODE4OTJlNmQ0ZSAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wbGFuZS5jDQorKysgYi9kcml2ZXJzL2dwdS9k
cm0vdmlydGlvL3ZpcnRncHVfcGxhbmUuYw0KQEAgLTk5LDYgKzk5LDggQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBkcm1fcGxhbmVfZnVuY3MgdmlydGlvX2dwdV9wbGFuZV9mdW5jcyA9IHsNCiBzdGF0
aWMgaW50IHZpcnRpb19ncHVfcGxhbmVfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fcGxhbmUgKnBs
YW5lLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJt
X2F0b21pY19zdGF0ZSAqc3RhdGUpDQogew0KKyAgICAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
ID0gcGxhbmUtPmRldjsNCisgICAgICAgc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldiA9
IGRldi0+ZGV2X3ByaXZhdGU7DQogICAgICAgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm5ld19w
bGFuZV9zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X25ld19wbGFuZV9zdGF0ZShzdGF0ZSwNCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBsYW5lKTsNCiAgICAgICAgc3RydWN0IGRybV9wbGFuZV9zdGF0
ZSAqb2xkX3BsYW5lX3N0YXRlID0gZHJtX2F0b21pY19nZXRfb2xkX3BsYW5lX3N0YXRlKHN0YXRl
LA0KQEAgLTEzOCwxMyArMTQwLDE0IEBAIHN0YXRpYyBpbnQgdmlydGlvX2dwdV9wbGFuZV9hdG9t
aWNfY2hlY2soc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsDQoNCiAgICAgICAgZm9yIChpID0gMDsg
aSA8IG5ld19wbGFuZV9zdGF0ZS0+ZmItPmZvcm1hdC0+bnVtX3BsYW5lczsgKytpKSB7DQogICAg
ICAgICAgICAgICAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmogPSBkcm1fZ2VtX2ZiX2dldF9v
YmoobmV3X3BsYW5lX3N0YXRlLT5mYiwgaSk7DQorICAgICAgICAgICAgICAgc3RydWN0IHZpcnRp
b19ncHVfb2JqZWN0ICpibyA9IGdlbV90b192aXJ0aW9fZ3B1X29iaihvYmopOw0KDQogICAgICAg
ICAgICAgICAgLyoNCiAgICAgICAgICAgICAgICAgKiBFeHBvcnRlcnMgb2YgR0VNIGJ1ZmZlciBv
YmplY3RzIHNvbWV0aW1lcyBpbnRlcmZlcmUgd2l0aCB0aGUNCiAgICAgICAgICAgICAgICAgKiB2
YmxhbmsgdGltZXIuIE1hcmsgdGhlIHBsYW5lIGFzIGV4dGVybmFsbHkgc3luY2hyb25pemVkIGlm
IHdlDQogICAgICAgICAgICAgICAgICogZmluZCBhbiBpbXBvcnRlZCBHRU0gYnVmZmVyIG9iamVj
dC4NCiAgICAgICAgICAgICAgICAgKi8NCi0gICAgICAgICAgICAgICBpZiAoZHJtX2dlbV9pc19p
bXBvcnRlZChvYmopKSB7DQorICAgICAgICAgICAgICAgaWYgKGJvLT5ndWVzdF9ibG9iICYmICF2
Z2Rldi0+aGFzX3ZpcmdsXzNkKSB7DQogICAgICAgICAgICAgICAgICAgICAgICB2Z2NydGNfc3Rh
dGUtPnBsYW5lX3N5bmNlZF90b19leHQgfD0gZHJtX3BsYW5lX21hc2socGxhbmUpOw0KICAgICAg
ICAgICAgICAgICAgICAgICAgYnJlYWs7IC8qIG9ubHkgbmVlZCB0byBmaW5kIG9uZSAqLw0KDQpG
b3IgdGVzdGluZyB0aGUgMyBjYXNlcywgSSByYW4gR25vbWUgV2F5bGFuZCBsaWtlIHRoaXM6DQpY
REdfU0VTU0lPTl9UWVBFPXdheWxhbmQgZGJ1cy1ydW4tc2Vzc2lvbiAtLSAuL2Jpbi9nbm9tZS1z
aGVsbCAtLXdheWxhbmQgLS1uby14MTEgJg0KDQphbmQgaGVyZSBhcmUgdGhlIHJlbGV2YW50IG9w
dGlvbnMgZm9yIFFlbXUgY21kIGxpbmUgSSB0ZXN0ZWQgd2l0aDoNCi4vcWVtdS1zeXN0ZW0teDg2
XzY0IC1tIDQwOTZtIA0KIC1kZXZpY2UgdmlydGlvLWdwdSxtYXhfb3V0cHV0cz0xLHhyZXM9MTky
MCx5cmVzPTEwODAsYmxvYj10cnVlDQotZGlzcGxheSBndGssZ2w9b24NCi1vYmplY3QgbWVtb3J5
LWJhY2tlbmQtbWVtZmQsaWQ9bWVtMSxzaXplPTQwOTZNDQotbWFjaGluZSBxMzUsYWNjZWw9a3Zt
LG1lbW9yeS1iYWNrZW5kPW1lbTEgLXVzYiAtZGV2aWNlIHVzYi10YWJsZXQgLXNlcmlhbCBzdGRp
bw0KDQpUaGFua3MsDQpWaXZlaw0KDQo+IA0KPiBSZXZpZXdlZC1ieTogRG1pdHJ5IE9zaXBlbmtv
IDxkbWl0cnkub3NpcGVua29AY29sbGFib3JhLmNvbT4NCj4gVGVzdGVkLWJ5OiBEbWl0cnkgT3Np
cGVua28gPGRtaXRyeS5vc2lwZW5rb0Bjb2xsYWJvcmEuY29tPg0KPiANCj4gLS0NCj4gQmVzdCBy
ZWdhcmRzLA0KPiBEbWl0cnkNCg==
