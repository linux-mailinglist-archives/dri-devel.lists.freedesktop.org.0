Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91538C68585
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF0C10E44F;
	Tue, 18 Nov 2025 08:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OeahYBCb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC5B10E45E;
 Tue, 18 Nov 2025 08:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763456126; x=1794992126;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RaCo84Ucsmx3NzNkwPgmT/4Z+WYkXRaPx7jVdT3bJLg=;
 b=OeahYBCb1iM0oVCPysoewvhOyu5vN20r5DxsM65Ykqpq4rfbc71D83WU
 BjEvMjJub9elGXcHlFSwhFKQbn3uxThJw2bo3ZPwEmM+rPO5d3S7aIqmR
 sCl9drmyAC7JqvBE4jxRMfq3Fjq7ELPVdvP4P8CBN7+NgABlcW2r78kNp
 d8zqI9ckwt+3L2jjS+g7t1mt8qp2DC+3oT07vnSnUsR+91DQOdadZTKXD
 tLanvm9TgwV6U/LKMb+j4jJIy5fGlMhGQ6fJ652V+11SHov7lCO8KNqvs
 IsnV8IIOXwt1xiiHDz8oKhXwNHajITdQtaBENGpLOWNGED8YfzvDCPgsv w==;
X-CSE-ConnectionGUID: 4fw/jeSeTi+Vb9ED0fu+fQ==
X-CSE-MsgGUID: 0zaNclDdS5OkGafkD9hsnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65410088"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65410088"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:55:25 -0800
X-CSE-ConnectionGUID: w+hTb9xcQtyJK/mD6aWwXg==
X-CSE-MsgGUID: sp8EWUbFSNWk2GryU5/BtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="191141504"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:55:25 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 00:55:24 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 00:55:24 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 00:55:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZcUfnQGps3/0TGw58sYQEiqMjIVfjcU51XjBftbjQypZj2rP6G4pPTP18QH7WUHnA4YWbsKqzzGb0vh6v8TPdgXSHMJTT0aVp8LEJjYeiKhKcoTikhgET4Ojn/b21kDtSsCoOnMAg6gazM9ymQDN61Df7fAmFimOgHKXrq5svm7/8mAUrrMQj+yKvgD/LS2aF/euxGZIgOtr2KNvXRctYOWWdKyC75iQphNgS9b69oo0TD6gisvo7dXewaG5vOjC5ODYTITWfVmTWjextN/MGH9fVeb5pUo1O18bPcZ6YDQpxWw2L+nqZ8rRdqi/cOI2rsy11Yd4JvnaH5BK/mBvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RaCo84Ucsmx3NzNkwPgmT/4Z+WYkXRaPx7jVdT3bJLg=;
 b=jA2oqdCa+nANgof3F11YsgP2f1TDZwWGU9g29LhREz44In3A3stjWFouUe/SQeAbsBOj11WYoZiR7roGC9nIKDUM176ZasPLZ9OZhL1T6RhpY+iocx2tmZ9Ki7Yw+U99dngit1E79/AIO28ReCcKT1F7tUit4s/36SeTr6JmTjouyx4YygKj2xf4lUJXWq/TDdy/6WBclDYQhUqdj9paaT5vGP/C/B54l8p5I9K6wKqHDtRmZFHDFjebqhTBCbMu/FN1AM0tC0Vke82C8XqTHUWQ3S7sIccJpLQIGdvi7ceTB1V0zszGp3FJWLUk9z8g1d5suuNmSigFwz4npNjUUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH7PR11MB7987.namprd11.prod.outlook.com
 (2603:10b6:510:242::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 08:55:20 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 08:55:20 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, "Shankar, Uma"
 <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: RE: [v6 06/16] drm/i915/color: Add framework to program CSC
Thread-Topic: [v6 06/16] drm/i915/color: Add framework to program CSC
Thread-Index: AQHcTk7zt2LShTN6DESGhXZNTT/UabT4K1XAgAAJgICAAAA9gA==
Date: Tue, 18 Nov 2025 08:55:20 +0000
Message-ID: <DM3PPF208195D8D05CE4660C60C0ABA4129E3D6A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251105123413.2671075-1-uma.shankar@intel.com>
 <20251105123413.2671075-7-uma.shankar@intel.com>
 <DM3PPF208195D8DD135EB18FD08B152D983E3D6A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <4c7a4163-9df8-4cb7-af9b-1a7f97bd9690@intel.com>
In-Reply-To: <4c7a4163-9df8-4cb7-af9b-1a7f97bd9690@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH7PR11MB7987:EE_
x-ms-office365-filtering-correlation-id: 2b9abbfa-0530-4de5-e347-08de26803445
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?dU40S1BCREVDdEtHTHd0L1NyKzhQQVIreTNFWmFqaDNaQnA5VUpSZE1Kd1BQ?=
 =?utf-8?B?RTdNNjJKU1ducFB5M28wdWNkMUJvSE9sUkhxZGZvQ0syMEVlbVhhWnl4NW1J?=
 =?utf-8?B?TTdvTEhXUW5mOCtGVG90WDQzYk9jSFptNnc4aWN3bHJnb05zS2w5SXBiZlZG?=
 =?utf-8?B?MklHRmhPT2FMSE1YWXIzNUxjcldSWHVOazVqTkhxU2FCamd0Z2FxYmR0Z3FX?=
 =?utf-8?B?U2ZldVpURzRVSWFUZTVXYkU5aVJTaEx1S3ZaT1VveUlMS1hTSTlwL0dLQVlq?=
 =?utf-8?B?Vlg3V25wVGpEK1NydnZDRmdwTlYxa3RZd242ZmNPcU5aeWs4RW15SS9JcnUz?=
 =?utf-8?B?ZjEzcDl1bWRTanBzODFESGZSYjVaQ1hLbVBkNUNQNEpYZjkzYWpCczBaUUlR?=
 =?utf-8?B?SW5VNEY1d2cxTm1BNWh1UWVjUHlGalIxRkI3d1RXTDI0eS9ML0FCdnBBNjMz?=
 =?utf-8?B?MEwwNjJUYmpuS1NieDRCMWpWQWNicGZYa0VqZFVvNHdGUDlKOUQ0UWxZb1Fv?=
 =?utf-8?B?dGpHd3lySGUrblB5MHJFSHVwNnZTbEVvVktmMWROeXU2NUtPYTZvM21qdGpl?=
 =?utf-8?B?eVpqZU9ObUpNRytKMnhBekFUdjVwSDZMZnlFRExaakpkZ3lQdm5pSTVJNkZG?=
 =?utf-8?B?ckZtRy9oN0ZuNlBVVU5tNktEbUx5UDcvUlNQSGRvOHc3YXlVWVNYaVVuNWp2?=
 =?utf-8?B?YTBTVDI1SlZpRWlHRmZmaytTREFyNHB4OTNjd1hSbVZOU0hra1FnNlAyVWhN?=
 =?utf-8?B?RWtqWlVqdk9iQjlhK3JUSGVaTlBuWmZtUGlqd0hxSTBOL1R4SmFRbDRLNWw5?=
 =?utf-8?B?ZUdFNDF1ZmVwY0JoNFBacFFjZHNTQW1sV2RGZFZmZnE2cTQrd09aR1hSSkhz?=
 =?utf-8?B?SUxsUU5CTkhhME9qQk4xbnp4bEo2TUdCNnF3R3B1clNZM1lOSDFyTElsTFJz?=
 =?utf-8?B?akxJRG5OR1VsUXd1Ymt4TVIrd3VXWWRzWW5hM0NaOW1SZkoyUFlnbkJ2WktK?=
 =?utf-8?B?TDYyaDdha1lkQ0p4VHNUT0xXWFRhbmEvUHJEQktpbXdQbkdDWlBzRUZxT2dm?=
 =?utf-8?B?ZnRxOGJIZ1RMWURhcVlUWVB1cDRka3Y1Um1DRjNpQ24wbVlmcnlOUGhYbmRs?=
 =?utf-8?B?ZmNUdGNzbzFyYUMvWE02eXlsN2dDeDdRUTRBK3ZmTjlVOFhsd3pJVXgxT3l2?=
 =?utf-8?B?Q1ZiU0J4bXdnK05jTHRaY1NIeTRTblJWa05sWTlYWTZUSGxqczBvd3UwU2xj?=
 =?utf-8?B?cEJhTi9BcDNGdVl4MHVtRUVMd0psc1JGUm1ZNGJsN1VtclNGemYyRWVJQkpB?=
 =?utf-8?B?cyttV1piNmZNWTZWYllETEZRcU5vandmeG9OOWxyWjFiOWJuM3NEbUJObG5I?=
 =?utf-8?B?R253cVRsZnRrcGdRWU9IKy9mVkZEWHpqZWNMRmx3ZEdaOHB2NGRsQU1TSnpk?=
 =?utf-8?B?d2RQWXpadkdjY3VYSjI2c2dnK1JZR3JKSUQyQXZPb0x4U1hPUUYzcTR3aEJI?=
 =?utf-8?B?T0d2ZXUvN21RaXFCVDM0TFNONE9hRmVveUZaTFhjY0JjcjRsMFJBN2RZa3V1?=
 =?utf-8?B?WG5UNjBEUDRGYW5uOElFclBlVFRWMUZxZWIvbFlxdUgwYjQrYW8yMGkyVVpV?=
 =?utf-8?B?LzlYeXkvY2N2am05QzlEOG5hbDhOTCtscjkyUkRQQnZkVCs5ZGE3WVlQZmNF?=
 =?utf-8?B?S2h4OUt6Q0QrTGRKM242cnhlRGdnSDRMRmpLWUxFNG9Bckkrc3ovczE4bmM4?=
 =?utf-8?B?Q0xVMkNMK21qVXB4K2VIalRUaUxUZDhSU3E2NzlIU2ZkUHdGM0ZlSHM3blVI?=
 =?utf-8?B?Ukc0Tk54WlpuZ3lRUGp6bk9vWTVmdGVIRU8yRFBTejVTYm4yOGR1Mkt1Umlv?=
 =?utf-8?B?OXJ1bjFIWk5FSDFiZWZrdG1ad2pRM1BiSUFYVHA0T09TUUdRL3FQUnM1M0s5?=
 =?utf-8?B?a1hKNkxWMzZWdkZaeUhxWFVNaUk3ZDlOSTRDUjRxUjRMOFdWVmhLVjlCQnpI?=
 =?utf-8?B?QmJDWkRlMVNFVjhiSWJqSFVtNTBwdnhkTnhmeDN3YUxIRysvYTFTNW1lVHA5?=
 =?utf-8?Q?GLVool?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NnVJMWRDbzE1UGFpeG96clViRWRneDhydHNKMjlRTVZYdXJZSDRZVXozUkNE?=
 =?utf-8?B?cEdJV2VyajMxeFBRR3ZEbmtPLzhUVFcvU0Z2d3psaWNxb01XWjBWZ0tsWmRV?=
 =?utf-8?B?TG93YzBYRWkrdWhyVW5jWFFpM3k4cVBsdDI3WGwwbWpGazQ3Z1k5VktBOHJa?=
 =?utf-8?B?MnIybWNFbmlSSEF5Y2VaMEhrS1N6cTJxaGRIOTdxdFp4K25VbG9rbGhHQm9H?=
 =?utf-8?B?b004STFiOW5hNFYyWEIyZFp5TGwrRE1VVGZ3WjlPUFplbXg2NTRlbkhFY1R0?=
 =?utf-8?B?OU1xRkdCRzdiY0RGd3VnVnE1QWh2NFlWUmgrZCtHU2F3QkZqYjA4a2F2ZHJO?=
 =?utf-8?B?RmY5ZmdXb21TY05leXRYTjgxL3hzTklqNzRlSXlrZkQzYkQwUWhpbTFHcUJX?=
 =?utf-8?B?c0FjbEE4S2l4c1ZDN2ZwYUtPbzA1WCthMExDNGZtWW5GL1BYSnNGdDVWV3Y1?=
 =?utf-8?B?a1FsQjNyOHlQd2NadVpCaTB1VHY2Sm5RMXR0emRGdUQ4OFFYN2MwdWF5ZzVG?=
 =?utf-8?B?ZFpsNGo2Tjh2VTlQeHZSUC93VHFaaktZY1BJaDVkeEpMOVdxT2psdmJWb3dV?=
 =?utf-8?B?dFYzYlVaUTd2YWRyS2JMYk85KzRoaDJIMGloZHpYL3lkVDZRZy9YWk1ncCsr?=
 =?utf-8?B?R0dXeGs5NnRDMjNxdE51UmMvZEVKaWdhRmhzdmZka1lqa2NwK251bHBnRDg0?=
 =?utf-8?B?blRGZWE2bWJyZ2txOENxcklXTW5iMU9SZXlIbW43VjlJcFgwQWZ4bnVlWExH?=
 =?utf-8?B?bVZFaDcvR2x5czRuZFJvTlBkMHRtbnlPV2JKYnl6bzJiZ3RPZk9SQ2tWRzhD?=
 =?utf-8?B?R0JhM1JwTGJxUys3aXo1cW15WlhBVG1QaWU1QWd2MTNyUUF6dGdMSHNOaExm?=
 =?utf-8?B?NU5ORUlmTWhOTnI0bzZ3b1NWSnRsSE1vTFA3bWJrMjV6TVBQV1pOOGFRQnJY?=
 =?utf-8?B?RmFCZWJPZk5ibFF1NkZMTUpBaUZGcG1MQ0NyL09LOEpoME1UbWhaNGFMenZE?=
 =?utf-8?B?dHlVR25PeThHcXZNalVpU3Y2OTYvUXZGRW84bE91N0tDcWpSc0JLblY0bjlo?=
 =?utf-8?B?cFZ1LzRIRjByMnFUa2V6NUVwWTBBek85UkhSaUo4NkxwWXppTlRvS0VaOTdn?=
 =?utf-8?B?eEhpK3A5SzBmUUJ4Tzlna21jV2VtL2xwNFpxdTg4d3RUYnI4aEc2c3REdDAr?=
 =?utf-8?B?bkFJUllPTlhUU0VEZFdJOXVUTHNMUE5aK2VnSm1VbWg3ZFRaS2lNWkx2NjJn?=
 =?utf-8?B?QUh4VkFLSnp6U0JIU3Vma1hsVC91aHdFZVNYUEcxdi94MHBQOUJHbHREVmFk?=
 =?utf-8?B?ajZBN244VWo2NVhyd2lUcEEwR3JIamM3a3lWOWV5QzN5TWtIRFdLV1VkME1C?=
 =?utf-8?B?U1Z4TUpqcGNkdWxxQ24yUm9Nam9iTm5BZ1l2citxNlpzTmhUekVZdW1UUHVt?=
 =?utf-8?B?MDMrb1BjVzFDU1A3aFZZdzdYbURaQ1R2L3BLSmQwT1hmVVk4ZHpjMWUvVUQ2?=
 =?utf-8?B?OEV5bXBncDFvQ3J4WWljYzFZU1NPVlpHQjJ6ekNWNjQ1M3QwT3NpYTdrWXJ5?=
 =?utf-8?B?aENxbUtNMzVlbnViQnhqOTU3Vm5qQzNTSm5qN3pQRFpBTGJLRmowWDdMVm5B?=
 =?utf-8?B?SWwwWEs3RllEVFJjMWx5c3hPT2VyNlFyN3NSTVhkK2k5c0I0ZTByQ2Z2S1VF?=
 =?utf-8?B?cnFCWUxLQnBYODc5Q1p2R1AxVHArV0JVajc3VXFSWVIrbGwyeHpBQVEzdTVM?=
 =?utf-8?B?ck91U0pGWWpFVjNYemZId09jTThHSXBZbHJndlhHdkRxdXBKdU5BTFpCenFG?=
 =?utf-8?B?K2NXVCthS1o0UkJWUS9ZMDFCbHRqblB0L3RXcStlRkRWR2xIaDN0bVdBTnpx?=
 =?utf-8?B?MEZmT21aUjcrQ09QQ0N0dDUxTlFOT0UySm9RUVpLN2xMSjBObDRod0ZzbFdx?=
 =?utf-8?B?NUhyd1c4Wk5MUmhuOWFuSzRsTm5nVjE4T25SeVhuVlJZTmhjNXRHYUp5LzVT?=
 =?utf-8?B?UzVyU3ppNmhDUzBLUGltZTVQNlNGNU9QVXBTL2lwTW03UzNpSUxuTnNLSWtj?=
 =?utf-8?B?YjUzZWhVM0ZPeWUya1VKeU9hY1dkZzB2V0tadnQzbWl0R3E5L2hMVU1pOUZs?=
 =?utf-8?Q?nISpsg7oNnFbjmO9Pff0171bS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9abbfa-0530-4de5-e347-08de26803445
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 08:55:20.7573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OWOdoy7ZZRVwdy1+qcQk8U6AtymTE+SMmCEwAsVlSBRxkJX9b/KORXb+BNt425iZ/A/Es5VdjcNOcV8VR0u3vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7987
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQm9yYWgsIENoYWl0YW55
YSBLdW1hciA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT4NCj4gU2VudDogVHVlc2Rh
eSwgTm92ZW1iZXIgMTgsIDIwMjUgMjoyMyBQTQ0KPiBUbzogS2FuZHBhbCwgU3VyYWogPHN1cmFq
LmthbmRwYWxAaW50ZWwuY29tPjsgU2hhbmthciwgVW1hDQo+IDx1bWEuc2hhbmthckBpbnRlbC5j
b20+OyBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC0NCj4geGVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiB2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbTsgcGVra2EucGFhbGFuZW5AY29sbGFib3JhLmNv
bTsNCj4gY29udGFjdEBlbWVyc2lvbi5mcjsgaGFycnkud2VudGxhbmRAYW1kLmNvbTsgbXdlbkBp
Z2FsaWEuY29tOw0KPiBqYWRhaGxAcmVkaGF0LmNvbTsgc2ViYXN0aWFuLndpY2tAcmVkaGF0LmNv
bTsNCj4gc2hhc2hhbmsuc2hhcm1hQGFtZC5jb207IFNoYXJtYSwgU3dhdGkyIDxzd2F0aTIuc2hh
cm1hQGludGVsLmNvbT47DQo+IGFsZXguaHVuZ0BhbWQuY29tOyBOaWt1bGEsIEphbmkgPGphbmku
bmlrdWxhQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFt2NiAwNi8xNl0gZHJtL2k5MTUvY29s
b3I6IEFkZCBmcmFtZXdvcmsgdG8gcHJvZ3JhbSBDU0MNCj4gDQo+IA0KPiANCj4gT24gMTEvMTgv
MjAyNSAxOjU0IFBNLCBLYW5kcGFsLCBTdXJhaiB3cm90ZToNCj4gPj4gU3ViamVjdDogW3Y2IDA2
LzE2XSBkcm0vaTkxNS9jb2xvcjogQWRkIGZyYW1ld29yayB0byBwcm9ncmFtIENTQw0KPiA+Pg0K
PiA+PiBGcm9tOiBDaGFpdGFueWEgS3VtYXIgQm9yYWggPGNoYWl0YW55YS5rdW1hci5ib3JhaEBp
bnRlbC5jb20+DQo+ID4+DQo+ID4+IEFkZCBmcmFtZXdvcmsgdG8gcHJvZ3JhbSBDU0MuIEl0IGVu
YWJsZXMgY29weWluZyBvZiBtYXRyaXggZnJvbSB1YXBpDQo+ID4+IHRvIGludGVsDQo+ID4NCj4g
PiAqVUFQSQ0KPiA+DQo+ID4+IHBsYW5lIHN0YXRlLiBBbHNvIGFkZGluZyBoZWxwZXIgZnVuY3Rp
b25zIHdoaWNoIHdpbGwgZXZlbnR1YWxseQ0KPiA+PiBwcm9ncmFtIHZhbHVlcw0KPiA+DQo+ID4g
KmFkZA0KPiA+DQo+IA0KPiBBY2suDQo+IA0KPiA+PiB0byBoYXJkd2FyZS4NCj4gPj4NCj4gPj4g
QWRkIGEgY3J0YyBzdGF0ZSB2YXJpYWJsZSB0byB0cmFjayBwbGFuZSBjb2xvciBjaGFuZ2UuDQo+
ID4+DQo+ID4+IHYyOg0KPiA+PiAtIEFkZCBjcnRjX3N0YXRlLT5wbGFuZV9jb2xvcl9jaGFuZ2Vk
DQo+ID4+IC0gSW1wcm92ZSBjb21tZW50cyAoU3VyYWopDQo+ID4+IC0gcy9pbnRlbF9wbGFuZV8q
X2NvbG9yL2ludGVsX3BsYW5lX2NvbG9yXyogKFN1cmFqKQ0KPiA+Pg0KPiA+PiBTaWduZWQtb2Zm
LWJ5OiBDaGFpdGFueWEgS3VtYXIgQm9yYWgNCj4gPj4gPGNoYWl0YW55YS5rdW1hci5ib3JhaEBp
bnRlbC5jb20+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IFVtYSBTaGFua2FyIDx1bWEuc2hhbmthckBp
bnRlbC5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfY29sb3IuYyAgICB8IDIxICsrKysrKysrDQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9jb2xvci5oICAgIHwgIDQgKy0NCj4gPj4gICAuLi4vZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmggICAgfCAgNCArKw0KPiA+PiAgIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcGxhbmUuYyAgICB8IDQ5DQo+ICsrKysrKysrKysr
KysrKysrKysNCj4gPj4gICA0IGZpbGVzIGNoYW5nZWQsIDc3IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfY29sb3IuYw0KPiA+PiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfY29sb3IuYw0KPiA+PiBpbmRleCAxZTk3MDIwZTczMDQuLmE0NWQzNDhjOTg1MSAxMDA2
NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvci5j
DQo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29sb3IuYw0K
PiA+PiBAQCAtODcsNiArODcsMTAgQEAgc3RydWN0IGludGVsX2NvbG9yX2Z1bmNzIHsNCj4gPj4g
ICAJICogUmVhZCBjb25maWcgb3RoZXIgdGhhbiBMVVRzIGFuZCBDU0NzLCBiZWZvcmUgdGhlbS4g
T3B0aW9uYWwuDQo+ID4+ICAgCSAqLw0KPiA+PiAgIAl2b2lkICgqZ2V0X2NvbmZpZykoc3RydWN0
IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpOw0KPiA+PiArDQo+ID4+ICsJLyogUGxhbmUg
Q1NDKi8NCj4gPj4gKwl2b2lkICgqbG9hZF9wbGFuZV9jc2NfbWF0cml4KShzdHJ1Y3QgaW50ZWxf
ZHNiICpkc2IsDQo+ID4+ICsJCQkJICAgICAgY29uc3Qgc3RydWN0IGludGVsX3BsYW5lX3N0YXRl
DQo+ID4+ICpwbGFuZV9zdGF0ZSk7DQo+ID4+ICAgfTsNCj4gPj4NCj4gPj4gICAjZGVmaW5lIENU
TV9DT0VGRl9TSUdOCSgxVUxMIDw8IDYzKQ0KPiA+PiBAQCAtMzk2Miw2ICszOTY2LDIzIEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgaW50ZWxfY29sb3JfZnVuY3MNCj4gPj4gaWxrX2NvbG9yX2Z1bmNz
ID0gew0KPiA+PiAgIAkuZ2V0X2NvbmZpZyA9IGlsa19nZXRfY29uZmlnLA0KPiA+PiAgIH07DQo+
ID4+DQo+ID4+ICtzdGF0aWMgdm9pZA0KPiA+PiAraW50ZWxfY29sb3JfbG9hZF9wbGFuZV9jc2Nf
bWF0cml4KHN0cnVjdCBpbnRlbF9kc2IgKmRzYiwNCj4gPj4gKwkJCQkgIGNvbnN0IHN0cnVjdCBp
bnRlbF9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUpDQo+ID4+IHsNCj4gPj4gKwlzdHJ1Y3QgaW50
ZWxfZGlzcGxheSAqZGlzcGxheSA9IHRvX2ludGVsX2Rpc3BsYXkocGxhbmVfc3RhdGUpOw0KPiA+
PiArDQo+ID4+ICsJaWYgKGRpc3BsYXktPmZ1bmNzLmNvbG9yLT5sb2FkX3BsYW5lX2NzY19tYXRy
aXgpDQo+ID4+ICsJCWRpc3BsYXktPmZ1bmNzLmNvbG9yLT5sb2FkX3BsYW5lX2NzY19tYXRyaXgo
ZHNiLA0KPiA+PiBwbGFuZV9zdGF0ZSk7IH0NCj4gPj4gKw0KPiA+PiArdm9pZCBpbnRlbF9jb2xv
cl9wbGFuZV9wcm9ncmFtX3BpcGVsaW5lKHN0cnVjdCBpbnRlbF9kc2IgKmRzYiwNCj4gPj4gKwkJ
CQkJY29uc3Qgc3RydWN0IGludGVsX3BsYW5lX3N0YXRlDQo+ID4+ICpwbGFuZV9zdGF0ZSkgew0K
PiA+PiArCWlmIChwbGFuZV9zdGF0ZS0+aHcuY3RtKQ0KPiA+PiArCQlpbnRlbF9jb2xvcl9sb2Fk
X3BsYW5lX2NzY19tYXRyaXgoZHNiLCBwbGFuZV9zdGF0ZSk7IH0NCj4gPj4gKw0KPiA+PiAgIHZv
aWQgaW50ZWxfY29sb3JfY3J0Y19pbml0KHN0cnVjdCBpbnRlbF9jcnRjICpjcnRjKSAgew0KPiA+
PiAgIAlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9IHRvX2ludGVsX2Rpc3BsYXkoY3J0
Yyk7IGRpZmYgLS1naXQNCj4gPj4gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2NvbG9yLmgNCj4gPj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9y
LmgNCj4gPj4gaW5kZXggYmY3YTEyY2U5ZGYwLi44MDUxYzgyN2ExZDggMTAwNjQ0DQo+ID4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29sb3IuaA0KPiA+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yLmgNCj4gPj4gQEAgLTEz
LDYgKzEzLDcgQEAgc3RydWN0IGludGVsX2NydGNfc3RhdGU7ICBzdHJ1Y3QgaW50ZWxfY3J0YzsN
Cj4gPj4gc3RydWN0IGludGVsX2Rpc3BsYXk7ICBzdHJ1Y3QgaW50ZWxfZHNiOw0KPiA+PiArc3Ry
dWN0IGludGVsX3BsYW5lX3N0YXRlOw0KPiA+PiAgIHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYjsN
Cj4gPj4NCj4gPj4gICB2b2lkIGludGVsX2NvbG9yX2luaXRfaG9va3Moc3RydWN0IGludGVsX2Rp
c3BsYXkgKmRpc3BsYXkpOyBAQA0KPiA+PiAtNDAsNSArNDEsNiBAQCBib29sIGludGVsX2NvbG9y
X2x1dF9lcXVhbChjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZQ0KPiAqY3J0Y19zdGF0ZSwN
Cj4gPj4gICAJCQkgICBjb25zdCBzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmJsb2IyLA0KPiA+
PiAgIAkJCSAgIGJvb2wgaXNfcHJlX2NzY19sdXQpOw0KPiA+PiAgIHZvaWQgaW50ZWxfY29sb3Jf
YXNzZXJ0X2x1dHMoY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUNCj4gPj4gKmNydGNfc3Rh
dGUpOw0KPiA+PiAtDQo+ID4+ICt2b2lkIGludGVsX2NvbG9yX3BsYW5lX3Byb2dyYW1fcGlwZWxp
bmUoc3RydWN0IGludGVsX2RzYiAqZHNiLA0KPiA+PiArCQkJCQljb25zdCBzdHJ1Y3QgaW50ZWxf
cGxhbmVfc3RhdGUNCj4gPj4gKnBsYW5lX3N0YXRlKTsNCj4gPj4gICAjZW5kaWYgLyogX19JTlRF
TF9DT0xPUl9IX18gKi8NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5oDQo+ID4+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmgNCj4gPj4gaW5kZXggZmEzOWYzMjM2NTk3Li5k
MjVmOTBkZWQ3MWYgMTAwNjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZGlzcGxheV90eXBlcy5oDQo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5oDQo+ID4+IEBAIC02NDYsNiArNjQ2LDcgQEAg
c3RydWN0IGludGVsX3BsYW5lX3N0YXRlIHsNCj4gPj4gICAJCWVudW0gZHJtX2NvbG9yX2VuY29k
aW5nIGNvbG9yX2VuY29kaW5nOw0KPiA+PiAgIAkJZW51bSBkcm1fY29sb3JfcmFuZ2UgY29sb3Jf
cmFuZ2U7DQo+ID4+ICAgCQllbnVtIGRybV9zY2FsaW5nX2ZpbHRlciBzY2FsaW5nX2ZpbHRlcjsN
Cj4gPj4gKwkJc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpjdG07DQo+ID4+ICAgCX0gaHc7DQo+
ID4+DQo+ID4+ICAgCXN0cnVjdCBpOTE1X3ZtYSAqZ2d0dF92bWE7DQo+ID4+IEBAIC0xMzkyLDYg
KzEzOTMsOSBAQCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSB7DQo+ID4+ICAgCQl1OCBzaWxlbmNl
X3BlcmlvZF9zeW1fY2xvY2tzOw0KPiA+PiAgIAkJdTggbGZwc19oYWxmX2N5Y2xlX251bV9vZl9z
eW1zOw0KPiA+PiAgIAl9IGFscG1fc3RhdGU7DQo+ID4+ICsNCj4gPj4gKwkvKiB0byB0cmFjayBj
aGFuZ2VzIGluIHBsYW5lIGNvbG9yIGJsb2NrcyAqLw0KPiA+PiArCWJvb2wgcGxhbmVfY29sb3Jf
Y2hhbmdlZDsNCj4gPj4gICB9Ow0KPiA+Pg0KPiA+PiAgIGVudW0gaW50ZWxfcGlwZV9jcmNfc291
cmNlIHsNCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfcGxhbmUuYw0KPiA+PiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcGxh
bmUuYw0KPiA+PiBpbmRleCA1MDVjNzc2YzA1ODUuLmE1ZDBmOTVhNmYxMCAxMDA2NDQNCj4gPj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wbGFuZS5jDQo+ID4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcGxhbmUuYw0KPiA+PiBAQCAt
NDksNiArNDksNyBAQA0KPiA+PiAgICNpbmNsdWRlICJpOXh4X3BsYW5lX3JlZ3MuaCINCj4gPj4g
ICAjaW5jbHVkZSAiaW50ZWxfY2RjbGsuaCINCj4gPj4gICAjaW5jbHVkZSAiaW50ZWxfY3Vyc29y
LmgiDQo+ID4+ICsjaW5jbHVkZSAiaW50ZWxfY29sb3JvcC5oIg0KPiA+PiAgICNpbmNsdWRlICJp
bnRlbF9kaXNwbGF5X3Jwcy5oIg0KPiA+PiAgICNpbmNsdWRlICJpbnRlbF9kaXNwbGF5X3RyYWNl
LmgiDQo+ID4+ICAgI2luY2x1ZGUgImludGVsX2Rpc3BsYXlfdHlwZXMuaCINCj4gPj4gQEAgLTMz
Niw2ICszMzcsNTIgQEAgaW50ZWxfcGxhbmVfY29weV91YXBpX3BsYW5lX2RhbWFnZShzdHJ1Y3QN
Cj4gPj4gaW50ZWxfcGxhbmVfc3RhdGUgKm5ld19wbGFuZV9zdGF0ZSwNCj4gPj4gICAJCSpkYW1h
Z2UgPSBkcm1fcGxhbmVfc3RhdGVfc3JjKCZuZXdfdWFwaV9wbGFuZV9zdGF0ZS0NCj4gPj4+IHVh
cGkpOw0KPiA+PiAgIH0NCj4gPj4NCj4gPj4gK3N0YXRpYyBib29sDQo+ID4+ICtpbnRlbF9wbGFu
ZV9jb2xvcm9wX3JlcGxhY2VfYmxvYihzdHJ1Y3QgaW50ZWxfcGxhbmVfc3RhdGUgKnBsYW5lX3N0
YXRlLA0KPiA+PiArCQkJCSBzdHJ1Y3QgaW50ZWxfY29sb3JvcCAqaW50ZWxfY29sb3JvcCwNCj4g
Pj4gKwkJCQkgc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpibG9iKSB7DQo+ID4+ICsJaWYgKGlu
dGVsX2NvbG9yb3AtPmlkID09IElOVEVMX1BMQU5FX0NCX0NTQykNCj4gPj4gKwkJcmV0dXJuIGRy
bV9wcm9wZXJ0eV9yZXBsYWNlX2Jsb2IoJnBsYW5lX3N0YXRlLT5ody5jdG0sDQo+ID4+IGJsb2Ip
Ow0KPiA+PiArDQo+ID4+ICsJcmV0dXJuIGZhbHNlOw0KPiA+PiArfQ0KPiA+PiArDQo+ID4+ICtz
dGF0aWMgdm9pZA0KPiA+PiAraW50ZWxfcGxhbmVfY29sb3JfY29weV91YXBpX3RvX2h3X3N0YXRl
KHN0cnVjdCBpbnRlbF9wbGFuZV9zdGF0ZQ0KPiA+PiAqcGxhbmVfc3RhdGUsDQo+ID4+ICsJCQkJ
CWNvbnN0IHN0cnVjdCBpbnRlbF9wbGFuZV9zdGF0ZQ0KPiA+PiAqZnJvbV9wbGFuZV9zdGF0ZSwN
Cj4gPj4gKwkJCQkJc3RydWN0IGludGVsX2NydGMgKmNydGMpDQo+ID4+ICt7DQo+ID4+ICsJc3Ry
dWN0IGRybV9jb2xvcm9wICppdGVyX2NvbG9yb3AsICpjb2xvcm9wOw0KPiA+PiArCXN0cnVjdCBk
cm1fY29sb3JvcF9zdGF0ZSAqbmV3X2NvbG9yb3Bfc3RhdGU7DQo+ID4+ICsJc3RydWN0IGRybV9h
dG9taWNfc3RhdGUgKnN0YXRlID0gcGxhbmVfc3RhdGUtPnVhcGkuc3RhdGU7DQo+ID4+ICsJc3Ry
dWN0IGludGVsX2NvbG9yb3AgKmludGVsX2NvbG9yb3A7DQo+ID4+ICsJc3RydWN0IGRybV9wcm9w
ZXJ0eV9ibG9iICpibG9iOw0KPiA+PiArCWludCBpID0gMDsNCj4gPj4gKwlzdHJ1Y3QgaW50ZWxf
YXRvbWljX3N0YXRlICppbnRlbF9hdG9taWNfc3RhdGUgPQ0KPiA+PiB0b19pbnRlbF9hdG9taWNf
c3RhdGUoc3RhdGUpOw0KPiA+PiArCXN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpuZXdfY3J0Y19z
dGF0ZSA9IGludGVsX2F0b21pY19zdGF0ZSA/DQo+ID4+ICsJCWludGVsX2F0b21pY19nZXRfbmV3
X2NydGNfc3RhdGUoaW50ZWxfYXRvbWljX3N0YXRlLCBjcnRjKSA6DQo+ID4+IE5VTEw7DQo+ID4+
ICsJYm9vbCBjaGFuZ2VkID0gZmFsc2U7DQo+ID4+ICsNCj4gPj4gKwlpdGVyX2NvbG9yb3AgPSBw
bGFuZV9zdGF0ZS0+dWFwaS5jb2xvcl9waXBlbGluZTsNCj4gPj4gKw0KPiA+PiArCXdoaWxlIChp
dGVyX2NvbG9yb3ApIHsNCj4gPj4gKwkJZm9yX2VhY2hfbmV3X2NvbG9yb3BfaW5fc3RhdGUoc3Rh
dGUsIGNvbG9yb3AsDQo+ID4+IG5ld19jb2xvcm9wX3N0YXRlLCBpKSB7DQo+ID4+ICsJCQlpZiAo
bmV3X2NvbG9yb3Bfc3RhdGUtPmNvbG9yb3AgPT0gaXRlcl9jb2xvcm9wKSB7DQo+ID4+ICsJCQkJ
YmxvYiA9IG5ld19jb2xvcm9wX3N0YXRlLT5ieXBhc3MgPyBOVUxMIDoNCj4gPj4gbmV3X2NvbG9y
b3Bfc3RhdGUtPmRhdGE7DQo+ID4+ICsJCQkJaW50ZWxfY29sb3JvcCA9IHRvX2ludGVsX2NvbG9y
b3AoY29sb3JvcCk7DQo+ID4+ICsJCQkJY2hhbmdlZCB8PQ0KPiA+PiBpbnRlbF9wbGFuZV9jb2xv
cm9wX3JlcGxhY2VfYmxvYihwbGFuZV9zdGF0ZSwNCj4gPj4gKw0KPiA+PiBpbnRlbF9jb2xvcm9w
LA0KPiA+PiArCQkJCQkJCQkgYmxvYik7DQo+ID4NCj4gPiBUaGVzZSBwYXJhbXMgbmVlZCB0byBi
ZSBhbGlnbmVkIHdpdGggb3BlbiBicmFjZXMuDQo+IA0KPiBBY2suDQo+IA0KPiA+IEFsc28gSSBu
b3RpY2VkIGEgbG90IG9mIGNoZWNrcGF0Y2ggZXJyb3JzIHRoYXQgY2FuIGJlIHJlc29sdmVkIHBs
ZWFzZQ0KPiA+IHJ1biBjaGVja3BhdGNoIC0tc3RyaWN0IFJlc29sdmUgYWxsIG9mIHRoZW0gdGhl
biBzZW5kIHRoZSBwYXRjaGVzIHVubGVzcyB0aGUNCj4gd2FybmluZyBvciBjaGVjayBpcyBqdXN0
IHVuYXZvaWRhYmxlLg0KPiA+DQo+IA0KPiBBbnl0aGluZyB5b3UgYXJlIHBhcnRpY3VsYXJseSBy
ZWZlcnJpbmcgdG8gaW4gdGhpcyBwYXRjaD8NCj4gTW9zdCBvZiB0aGUgd2FybmluZ3MgYXJlIGZy
b20gdGhlIHNxdWFzaGVkIHBhdGNoLg0KPiBBbmQgdGhlbiB0aGVyZSBhcmUgdGhlIHJlZ2lzdGVy
IGFkZGl0aW9uIHBhdGNoZXMgZnJvbSB3aGVyZSB3ZSBzaG91bGQgYmUNCj4gYWJsZSB0byBmaXgg
dGhlIGxlYWRpbmcgc3BhY2VzIG9uZXMuIFdpbGwgZml4IHRoZW0gaW4gdGhlIG5leHQgdmVyc2lv
bi4NCg0KTm8gbm90IHRoaXMgcGF0Y2ggYnV0IG9uZXMgd2l0aCB5b3VyIHJlZ2lzdGVyIGRlZmlu
aXRpb25zIEkgZ2V0IHNvbWUgbWFjcm9zIGNhbm5vdCBiZSByZXNvbHZlZCB3aXRob3V0IGJyZWFr
aW5nDQpPdGhlciBjb21wbGlhbmNlcyBidXQgd2UgbmVlZCB0byBtYWtlIHN1cmUgbm90IGNoZWNr
cGF0Y2ggZXJyb3JzIGFyZSBjb21pbmcgdXAgc3BlY2lhbGx5IHRoZSB0cmFpbGluZyBhbmQgbGVh
ZGluZyBzcGFjZXMNCg0KUmVnYXJkcywNClN1cmFqIEthbmRwYWwNCg0KPiANCj4gPT0NCj4gQ2hh
aXRhbnlhDQo+IA0KPiA+IFJlZ2FyZHMsDQo+ID4gU3VyYWogS2FuZHBhbA0KPiA+DQo+ID4+ICsJ
CQl9DQo+ID4+ICsJCX0NCj4gPj4gKwkJaXRlcl9jb2xvcm9wID0gaXRlcl9jb2xvcm9wLT5uZXh0
Ow0KPiA+PiArCX0NCj4gPj4gKw0KPiA+PiArCWlmIChuZXdfY3J0Y19zdGF0ZSAmJiBjaGFuZ2Vk
KQ0KPiA+PiArCQluZXdfY3J0Y19zdGF0ZS0+cGxhbmVfY29sb3JfY2hhbmdlZCA9IHRydWU7IH0N
Cj4gPj4gKw0KPiA+PiAgIHZvaWQgaW50ZWxfcGxhbmVfY29weV91YXBpX3RvX2h3X3N0YXRlKHN0
cnVjdCBpbnRlbF9wbGFuZV9zdGF0ZQ0KPiA+PiAqcGxhbmVfc3RhdGUsDQo+ID4+ICAgCQkJCSAg
ICAgICBjb25zdCBzdHJ1Y3QgaW50ZWxfcGxhbmVfc3RhdGUNCj4gKmZyb21fcGxhbmVfc3RhdGUs
DQo+ID4+ICAgCQkJCSAgICAgICBzdHJ1Y3QgaW50ZWxfY3J0YyAqY3J0YykgQEAgLTM2NCw2ICs0
MTEsOA0KPiBAQCB2b2lkDQo+ID4+IGludGVsX3BsYW5lX2NvcHlfdWFwaV90b19od19zdGF0ZShz
dHJ1Y3QNCj4gPj4gaW50ZWxfcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlLA0KPiA+Pg0KPiA+PiAg
IAlwbGFuZV9zdGF0ZS0+dWFwaS5zcmMgPSBkcm1fcGxhbmVfc3RhdGVfc3JjKCZmcm9tX3BsYW5l
X3N0YXRlLQ0KPiA+Pj4gdWFwaSk7DQo+ID4+ICAgCXBsYW5lX3N0YXRlLT51YXBpLmRzdCA9IGRy
bV9wbGFuZV9zdGF0ZV9kZXN0KCZmcm9tX3BsYW5lX3N0YXRlLQ0KPiA+Pj4gdWFwaSk7DQo+ID4+
ICsNCj4gPj4gKwlpbnRlbF9wbGFuZV9jb2xvcl9jb3B5X3VhcGlfdG9faHdfc3RhdGUocGxhbmVf
c3RhdGUsDQo+ID4+IGZyb21fcGxhbmVfc3RhdGUsDQo+ID4+ICtjcnRjKTsNCj4gPj4gICB9DQo+
ID4+DQo+ID4+ICAgdm9pZCBpbnRlbF9wbGFuZV9jb3B5X2h3X3N0YXRlKHN0cnVjdCBpbnRlbF9w
bGFuZV9zdGF0ZQ0KPiA+PiAqcGxhbmVfc3RhdGUsDQo+ID4+IC0tDQo+ID4+IDIuNTAuMQ0KPiA+
DQoNCg==
