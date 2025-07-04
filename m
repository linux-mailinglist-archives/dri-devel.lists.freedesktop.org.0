Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15676AF91CE
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 13:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC0710EA01;
	Fri,  4 Jul 2025 11:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OZHi4toy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E4810E07B;
 Fri,  4 Jul 2025 11:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751629738; x=1783165738;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SLmB9hQ57QT5AnsRLdf2FDUubT9wp01J0r4Zu+mJGV8=;
 b=OZHi4toyx4HKQg5RmqAT18g4YWvdIzbIYKwB4s0x0YeYwNEamqKDMEl/
 E6Kq82SX44jC+65KFp+zRLxrNNOidz7xrszMk7tn2cJRO8bVsw7MiowFn
 5gEiWHSfCgJigI8aOwONs8Fck3Abit/9KUy+BL6yjceguagR7oJUj5zmu
 srUJck8Ezo0qnX8yEXAoPC5yPeGeh29XWtzfSu5Vrsme3/G6nfVEEj/HO
 01CJN9Pz1zntTXjBw6dwtK3i4LuPwen/d8UEihaU5s7ntnq0pIFCD3RVP
 9zH/XaSsM0/ULHToibBaVemfMy3+7Sq3t7jvsbij8lcmK2wXaxQWJx/q9 g==;
X-CSE-ConnectionGUID: AKLr/lDfS32eBGadTx8Eiw==
X-CSE-MsgGUID: jQyV7tIlSciNqtRYmyZSgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="65416471"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="65416471"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 04:48:57 -0700
X-CSE-ConnectionGUID: 7T+Ru43jTOC35X8Eh2S1BA==
X-CSE-MsgGUID: 8FMTdnDMQVWWkpO/K08T2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="160141306"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 04:48:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 04:48:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 4 Jul 2025 04:48:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.59)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 04:48:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OBmZH06XT0y8R3ytVtC3M3j23pKOjwuSrPrWf4CJgba+zu5WBHSyRqu3gM1L8tR6GPyhwAsGsldoGooLxF66BGo39c76mqlhv6RzWnSOw7UHDzi3KYcdsrr1JKIBJDOJ3P7odREe2yBLZR2JB73vTwz+9jOduAjalSUabkGtnty36CpK2b9j+Aqndq/ITZYMiXk8Cxq3z1SxoN/qLNsoi5giYaejLW89ZaBEDuzVCfSVnIXVBpWjqtnbSuE2Fe2j6by6FzyvrPk2hZe5bulajgUnLOpD7OTJJU8SLcOde05d/By+FL7hQtT/fJN+gbeqAiIsRAycjXBS5clq1AgW2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvxAXFmLTrVBEBooYwwKqGyNpFEp7BlEj1CydaPiGT8=;
 b=KlGYLXohtYbjSe/pmjLJaRX0Jqlu5x2QEA1hx0v3h0J+TN+rvlRlt3jdkkE+My6RkQi02G9wq2gEZM6TEAiHzyCm7GXzwr+3+Ki0WAGIjLtSSrDJ/0KOs7r3nN+hN4AzBOPXtsC4Bgx2xpvMpckcTbDsM0i6TrsuYErjBgMwwxTt8m9i2dAZjMstr/WTdXM97PeFvu183GtiUxK1QQhnLmlFnNfQlMWiymoCXbtgpHcb6+qAKcfnof5NB/tO2cfGdfOLLTZCe2Pr+QGzizWQuIrMLJGToCRAkFifmVIhJ4fh2HfRMzmMO9HTqCiSH3UhpwVxDr3otpwAGRo+4PkI+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA1PR11MB8788.namprd11.prod.outlook.com (2603:10b6:208:597::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 11:48:54 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.8880.030; Fri, 4 Jul 2025
 11:48:53 +0000
Message-ID: <fe774af5-76fb-4056-9eae-e2ccb0e0f078@intel.com>
Date: Fri, 4 Jul 2025 17:18:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/10] mei: late_bind: add late binding component driver
To: Greg KH <gregkh@linuxfoundation.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <alexander.usyskin@intel.com>,
 <daniele.ceraolospurio@intel.com>
References: <20250703193106.954536-1-badal.nilawar@intel.com>
 <20250703193106.954536-3-badal.nilawar@intel.com>
 <2025070421-cattishly-buffed-d992@gregkh>
 <0b40eadc-c763-4cbc-910d-cbeb03b432d4@intel.com>
 <2025070452-rendering-passover-9f8c@gregkh>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <2025070452-rendering-passover-9f8c@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::13) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA1PR11MB8788:EE_
X-MS-Office365-Filtering-Correlation-Id: b0273d60-d135-442e-0547-08ddbaf0c018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUd5Y1ZTOFJUQStiT3l0cSs4eEZSTEVkY2JwR0dsTktxclNwL3U0KzMxN3JL?=
 =?utf-8?B?b2FaUFJ6eDg0d1Z4YWtONmR5N0Q5MExybU1OSkt6Vk12bHNzaHR1Q29ESUJJ?=
 =?utf-8?B?empGcGlHUlFmSThCRGVIZzBGdnFyVHMxSi9Gdk9aQnMySTgrTjJEd255WEkw?=
 =?utf-8?B?ZURyRnV1Q1BCL0xOYjBSUVRYQkRKVWovWHZyaSt3dlp1ZXpDZ25qQTVFeUNk?=
 =?utf-8?B?Slh0dnV0VzRZbjFZSHNwQjFlRzdONWwyVzc1ZE84MUQyckxrZ1hYalZNcFFN?=
 =?utf-8?B?UlY5VXJhcFVGT2xOQks2V3ByWVFyS0xvcW1SbEU2cTdrcEhDQ1orNDdGdHVY?=
 =?utf-8?B?MSs1Vnpob1hmV1c3N25mUElPQU9TNkhIa1d2bzBpd3Z0ZERLQ2NYVm9IT0w5?=
 =?utf-8?B?VkhHYS9VTGpzeng4alo4RWllRlRsNk1vSHhxN1VvRDZMVzZnYmNLQkZCcUl6?=
 =?utf-8?B?cTNtVGNwUTdMaklwVXFkYk9sSkpuK0kvRmN0aUlLSE1rWE8wbEpFNGpiOFRW?=
 =?utf-8?B?NE42czVpbzlDK2dZVHJSNHp0S0J5UnlsVVRFMGs4ZHNiOXQ4WWZJb3lsQXZ0?=
 =?utf-8?B?Nis2RU5sQWVzQWlJT3ZMTVFCYWJOTndKd0RQVUFvVGxXSUd0ZTJRVDFNNlpX?=
 =?utf-8?B?VWRmcEZTbVFvRDJ4b1BSWkdmaEhjK2tUKzFaVGZVOVp2c2tyOHBSOTZQZXNE?=
 =?utf-8?B?c3NtbkFBZ0NCNS9vaU5sU1FjTFpjTlFRNkZwakVycm5wd3NraTdWSzFjN05Q?=
 =?utf-8?B?dFI4VHN2VWh6WTBycWhQQWRVa0lBQmdrYTJjMCtLS3B5djl5SWQ1N2pzdnJD?=
 =?utf-8?B?TjdlbkpWcXpERVpYV29ZVUZ3d245aEtDZkF6UnI3MEhpbXVSZ0FQRC9aazFs?=
 =?utf-8?B?UzM0ZjJCZUZ2bitEVGdjZStsQ3JjTEQxV055T1g0dy9pd1lzYVlFT1g5OXpB?=
 =?utf-8?B?aHhCaFVzTkVvVXdiUjJJVU1nRUFoV2Rta2c4cUhZeURMbTVsYlgwc2FaL3or?=
 =?utf-8?B?LzhYQ1J0RkNlNGU0aVpMYk02d3oyejFqMGZXRllvYW5HYmFjandnWmtsN1RU?=
 =?utf-8?B?Wm9lTEJ2RUdqeFQ2dXFwczErTkNPdGhCS0ZHeFc5MkNMZGZvV1J3Rm9Dbi9t?=
 =?utf-8?B?S080N25teFNqckttSzR3QVBlVmZZbE0xSXdWdU1jTTNKejFYN0VOOFQ3S01B?=
 =?utf-8?B?Rjd5V0JtZXNlR3BMODRxZ1FEREtRK3p5WGlBeWN1NTd0VDhJTnVzL0plMGJ1?=
 =?utf-8?B?S0lTdmtFa3ZGTUZWeUlwb0sxcnl0VW9sOTRxTW1OTzdFbU9WUU4xVUZWS2xL?=
 =?utf-8?B?cGVCVlVFNVBCRTJ6V2k1dml0RmJVZG4vUWF4eThURUkwczZhREEwUWYweGtU?=
 =?utf-8?B?R1Y1T0Yvd0VudjZwbzVvZWFEREl4ZjRuMUVlUER0YUJrU3NocUI5UHNsNjhU?=
 =?utf-8?B?Mk1SY1J6TWEwTkVuRXI5M1IzbVVvbEhNRlI2UzVJbFR5ZVdDTHZDRUIzN3ZZ?=
 =?utf-8?B?UDAwMVl6ZUR1djVtZXY3Zzl0MTRNYjQydzVkdUtQMjlLdDdDaVBXZk0wSnQv?=
 =?utf-8?B?OFAxN3Y4OEtnM3BOVnlIOXU1dnkxSU5ZVVVYSlF2eHhkNkh4OEdhNXRiRU5W?=
 =?utf-8?B?UmtvOHIwaTBYVE51bG91azUrNFBSeW5iaDRmT2VvZU9MbVhmQjZzRlRyV0lV?=
 =?utf-8?B?UTlGWjNQOUZ5Yi9XakhRYWFXTndLbUlzNVVzSmtVSmRwNzBUN203eDNRamNJ?=
 =?utf-8?B?Yk42cW1VTkFRZzhqWlVkdmVOMTIxOGt0ajVadnBCOUtBajZHWklYTTFML3JN?=
 =?utf-8?B?NnNmQkZjK1RZMDBZRmtyTC8rbEMwU2hqbFA3OXo1ZlpLLzNsckVMUklsd3Ji?=
 =?utf-8?B?S09TVGJpZmZTUEJUbU1QWU45SnErNkhIRXZXQkovUkliRUluZWNydFB1Ny9S?=
 =?utf-8?Q?HI+daYKFDsE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFFMUWdWVnpUd2pCb2xWUmlhc0RDSWFWL2tNOGpWUUsvQ0ZZdkpZK3lnbjU2?=
 =?utf-8?B?SnYyK1hHZXZUYW16NzZzcVp6M3V0OHMxOWZXTkkyTU5YRjBOcnRaQUJXczdI?=
 =?utf-8?B?eWpCeGhxM1l1anFvSm9aKzE4S2VUa09xczJqd01TbmI1RFBaaE53dEFoMVRq?=
 =?utf-8?B?cmZFTXMvZjQ0aFpzRHlCbzdrMjBOekk2VGxiTnR1Sm16YXVJYU5oamY4anlv?=
 =?utf-8?B?ajhqU20zSnRqMVJGRk55WFRvUG1vQ1NuN3VjY0VLZzlJTEJ1Q1NwdkhmWCt3?=
 =?utf-8?B?SlNFNGJtYTJ0eURlcllDMXp0bm0vaUxMSENTbHpqK0lxWkhzUkJmQms4SHBI?=
 =?utf-8?B?TUNubjRTZXVValBNV1NaZkM2dThQNENUZVZQT3U3b2Q2bUc5cDB2TTh4dUkv?=
 =?utf-8?B?eXNPU2FiU2hyQlZqWlpibUxxaE5telpUU1lxcGY4Z09OYW1XUVpsQVd2cWll?=
 =?utf-8?B?M3FwSXRHa2FlMEc1cTVhWG1XajA2WUcrQVJoTnd2Uk5DQ1ZYeEpia0N1S2xx?=
 =?utf-8?B?SmdWUlBTMkVQVXFkbG5KQjJ2cnVyclpPVDhKa085bGpRUTA4OTA0MllIZDNU?=
 =?utf-8?B?c0R1UkludGppYk5BTEo1MUJHaVhJNmU1QzNhaHZ1dms0YTRVNnI4NWh1bU1S?=
 =?utf-8?B?NlFVZDNSMjc0YXdxNzUwZkI3NHJqU2RIekYzNHoraVdpMGtqeFVqM0ZCekJu?=
 =?utf-8?B?Y3h1NVIvU3hRTTRxcE5TVm01NUwvakpLRkRpN0ovSE5iaW9qVjEweDJKYUR3?=
 =?utf-8?B?b1lCWGNFbU1WUEZhbFpYNlI4M1pKOXlTaThaTEZXY1pFKy9LYU0yVjd1MU05?=
 =?utf-8?B?VHE3am5oR2xTVWhmaGhBMnpjczJ6L2MzZFpKS0dIQVJrb1dmTTNyWkNiVnly?=
 =?utf-8?B?aXUycndvSzh0Q1Eyb2FUTGVnTUFSTnhnRDNmSGJEdFdNUm5VWWF6UEpzVHJ3?=
 =?utf-8?B?WGgxdjNqbWI4TVlaQTJ4SThzLzhoeFQ4R3FVNDNnTFNXVm43b3pIK2FxSFpp?=
 =?utf-8?B?NDJSeURPS09YRWFoajJxS2FxUzNNeVpIb1pVYnZqVWlPd0FuZkZ3K1BlOEMz?=
 =?utf-8?B?QWhUUHMyV2dWUnpteDlNRXZUTEFtaW9XVmVBK0tCNVlsWDUwVllXY0ptY3Fu?=
 =?utf-8?B?SEVHOUUxT24ra3pINFpYTnFGeTlUY24yTzlIT1VtZTA4dWMwK29hK1YydHgx?=
 =?utf-8?B?cHR4TkNDbE5IcDRKMUI3bHE2djJRU1g4MmRBUzJESldaL2Z2djVUQzMzOTF6?=
 =?utf-8?B?dHNsY3Z2bC9pR2hSalpDallCUWR5dzluTG9OYlhybnlKVGdmcVArblo4T01y?=
 =?utf-8?B?Ykg4bjdzcXNKVmQxUG0zWk5EbmhuOEVXREtOWWNYNmY3YWh6eHVHSEZqWU9n?=
 =?utf-8?B?eStGaU1FKzkxa1Joc3FUSDk2SnF2V3ZObSs2Vncwek5Mc0x4ODhCMSs4ZnNE?=
 =?utf-8?B?bG9yQ1F0UlJqaHJPUzdVN1FnT2ZRb3FkNlM2Qm9oQ3Rzb0lOb3hqRlNrWVZG?=
 =?utf-8?B?UDc0RFBKOFJqbUhtaEp2UnRyWnl2anVNc0s0ZG5sOVlVdHh3RGM0anRXQ2lx?=
 =?utf-8?B?d1Y2UGlHUVBuOHN0MFhjS1pDUkphSjNydHZ4VFE4aVA4R2ZsNDJCcXNqdGVJ?=
 =?utf-8?B?V0tPRVlleUIxQTF4b2xjQVhkUlcrRzgvTDdqTjF1MUJDSlJoU2xTb1l5OU5I?=
 =?utf-8?B?ektCU2lHOW9Nc0grOFZXV3VvL3hrODNzNVphdkhNRFY0MzlwWk9yeGxqWTR2?=
 =?utf-8?B?dmliSzVzTU1VdUgxZ2VNQmFoKzl6VEplMCtLMmlWNndyb2NiUlMwd1VTMTZ2?=
 =?utf-8?B?QkpPM0paN0M5cFNEV0JIeGZyL2lRb210N0VNSzI3RHpObmNXZFFZYUNKai94?=
 =?utf-8?B?QkdPdDZuOFRTTVBVOUNTcnpxWnVTNjl1YjZQbmUzdklrbDNFeWR6dEt0UkQv?=
 =?utf-8?B?bFlWN0VUZkpPM1QxZUNVblh6d2tOZ0YzZkgvSTc3ZjBSMUkvTkpaaW04a2k4?=
 =?utf-8?B?bEZtV1AxVnIwZTY3a2duSVliUUZKcUcxTENxeFFRV3IxbmpUMmsxOWRINmVj?=
 =?utf-8?B?dnpHSkx2M3R0OUVnc3V2SHBlbUhxTkdvRzM3OFJYeXdETkpkcmEyNUpnWlZH?=
 =?utf-8?B?bVRzTzRZZFByM1hiNC9XVGhQaFYrTGN3Njd2bzJvbGxyYythUzhZMTRBSnpD?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0273d60-d135-442e-0547-08ddbaf0c018
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 11:48:53.7261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tk8MSOWZ0fe1i21+HsUeVO9MqwjSbA3W0MyqUcyOyNY+nXZCZm0jqoCXVnP7PCQLpdcbAoAGCGmGym4fM3wRKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8788
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


On 04-07-2025 16:04, Greg KH wrote:
> On Fri, Jul 04, 2025 at 03:59:40PM +0530, Nilawar, Badal wrote:
>> On 04-07-2025 10:44, Greg KH wrote:
>>> On Fri, Jul 04, 2025 at 01:00:58AM +0530, Badal Nilawar wrote:
>>>> From: Alexander Usyskin <alexander.usyskin@intel.com>
>>>>
>>>> Add late binding component driver.
>>>> It allows pushing the late binding configuration from, for example,
>>>> the Xe graphics driver to the Intel discrete graphics card's CSE device.
>>>>
>>>> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
>>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>>> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>>>> ---
>>>>    drivers/misc/mei/Kconfig                    |   1 +
>>>>    drivers/misc/mei/Makefile                   |   1 +
>>>>    drivers/misc/mei/late_bind/Kconfig          |  13 +
>>>>    drivers/misc/mei/late_bind/Makefile         |   9 +
>>>>    drivers/misc/mei/late_bind/mei_late_bind.c  | 272 ++++++++++++++++++++
>>> Why do you have a whole subdir for a single .c file?  What's wrong with
>>> just keepign it in drivers/misc/mei/ ?
>> There is separate subdir for each component used by i915/xe, so one was
>> created for late_bind as well. Should we still drop late_bind subdir?
>>
>> cd drivers/misc/mei/
>>        gsc_proxy/ hdcp/      late_bind/ pxp/
> For "modules" that are just a single file, yeah, that's silly, don't do
> that.
Another reason to maintain the sub_dir is to accommodate additional 
files for future platforms. If you still insist, I'll remove the sub_dir.
>
>>>> +/**
>>>> + * struct csc_heci_late_bind_req - late binding request
>>>> + * @header: @ref mkhi_msg_hdr
>>>> + * @type: type of the late binding payload
>>>> + * @flags: flags to be passed to the firmware
>>>> + * @reserved: reserved field
>>> Reserved for what?  Set to what?
>> Reserved by firmware for future use, default value set to 0, I will update
>> above doc.
>>
>>>> + * @payload_size: size of the payload data in bytes
>>>> + * @payload: data to be sent to the firmware
>>>> + */
>>>> +struct csc_heci_late_bind_req {
>>>> +	struct mkhi_msg_hdr header;
>>>> +	u32 type;
>>>> +	u32 flags;
>>>> +	u32 reserved[2];
>>>> +	u32 payload_size;
>>> As these cross the kernel boundry, they should be the correct type
>>> (__u32), but really, please define the endiness of them (__le32) and use
>>> the proper macros for that.
>> If we go with __le32 then while populating elements of structure
>> csc_heci_late_bind_req  I will be using cpu_to_le32().
>>
>> When mapping the response buffer from the firmware with struct
>> csc_heci_late_bind_rsp, there's no need to use le32_to_cpu() since the
>> response will already be in little-endian format.
> How do you know?  Where is that defined?  Where did the conversion
> happen?

Sorry, I got confused. Conversion is needed when assigning the response 
structure elements.

e.g ret = (int)(le32_to_cpu)rsp.status;

>
>> Are you fine with this?
> Please be explicit.
>
>>>> +	ret = (int)rsp.status;
>>>> +end:
>>>> +	mei_cldev_disable(cldev);
>>>> +	kfree(req);
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static const struct late_bind_component_ops mei_late_bind_ops = {
>>>> +	.owner = THIS_MODULE,
>>> I thought you were going to drop the .owner stuff?
>>>
>>> Or if not, please implement it properly (i.e. by NOT forcing people to
>>> manually set it here.)
>> Somehow I missed this. I will drop it.
> And from the structure definition please.

Sure.

Thanks,
Badal

>
> thanks,
>
> greg k-h
