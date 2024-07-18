Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFD99351DC
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 20:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A33D10E191;
	Thu, 18 Jul 2024 18:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eT13ymzk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E659E10EAB9;
 Thu, 18 Jul 2024 18:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721328320; x=1752864320;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=bgLFaRr69TzdMRehjQt7fInWa7msRGnlj2Nl/oxON4w=;
 b=eT13ymzk9cQbLiDqhwq7GD5L7x3CtWMbiNfGuMNdcH/s8P1U6MK7J78R
 +gyB8s5yNo5sbHtaMXQ9mYWr5iIJl1QQCm4uhZOTAG3cH0jDMw8OylG1h
 AF2LTPuVkPdM20eFzRvJuvbOBw7kuoU8bdzXKNv3VNV2rEH0y0qdRFY/q
 eFdFfrjbiJ3Azmi5kdJyTzlSSDrOI2WF7PH2Sxb4peTEPD6VZte7g375e
 qA4ltfFhFmFm+2tA7QbBHb/ABOSmTSa4JMdne/SKnXGVvo+aLBrv/oXB9
 DOGBYayHDIKpcqyOhyzje/8GyHcDnkdrgh4SZAUtoY5euHI+Co8RhueBf w==;
X-CSE-ConnectionGUID: /TYNqKv9TlGrkB52XLdv6w==
X-CSE-MsgGUID: Dj+yn+3tSsKk5eIg09oghg==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="29525980"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208,217";a="29525980"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 11:45:19 -0700
X-CSE-ConnectionGUID: zPbeQvUPQw2MvEBxbEjHYQ==
X-CSE-MsgGUID: TgjDPSauQl+P4seUQjmN7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208,217";a="56018786"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 11:45:19 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 11:45:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 11:45:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 11:45:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 11:45:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+uI/MN0wa6Sj71kE0aJ2bTkTUIMyXkNzgvCzW/R0aUfu1IpiNpPaM1y+SzHe7ck0Fw6aUwMYZu2VMrfRJfctj/BtPyvNU7jZHF1VP7yGslXX/9fxHe7+MjUvM32guq/5r2NwRhRvlUkSrmeucGkZkwIce3CaM/YVOpQyNafcS5c9MA59cuY4S5v4wS8I7DhJQ3u6fMui09phdIBgCbXIpasITj8PQJWLdS0FNQC2MDIZDQ5zIZgzEfRCLXZbmRahQ7zie9e9ab6RTLs096+7d76T2W0eATXIzGas2vLQZGmgA+5ViPPUS+fUcFApWlg45z7/2DXi1l+pK+R7EAH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSYHarHzviU8Gr+w5okhlOR0YeYHBHu1ZxQRxT4R6KY=;
 b=trOrLp3rUWHAZxyjW43Mpn4/RP0CYz2tj0p1GjkCspwWescYQQsuWIf2ExL5VkiMn3VT/uxRAXga7ql7JBSZgc1ydiPIO7ee6CRJ0XF1kMncNG43B7DAuOlNRVAnvmIG844iOkskuCPxo0YpbSpum3VqAlmORlW4MMij61tPA5Db9n42oJ/vBmrI/zhbGtLFQUIR8O7HviOgK77Suw3mCU2/fET0iBHrfIhPXmz4Yq4bg0gT19K8teFx+rwQWzR+kqv49rp8nnxBJvdVnY3kU5bEw55mvfQy//93sDY0JNw2yGchGJfjR5qo8iLwPI3qF2OblH9MUOdqp7Kjog7vIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SJ0PR11MB5024.namprd11.prod.outlook.com (2603:10b6:a03:2dd::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 18 Jul
 2024 18:45:14 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7784.015; Thu, 18 Jul 2024
 18:45:14 +0000
Content-Type: multipart/alternative;
 boundary="------------1QUW480Vwy7olren6x9uouLJ"
Message-ID: <0a5cdda6-d275-45b7-97e6-82a7405d6a0c@intel.com>
Date: Thu, 18 Jul 2024 20:45:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] drm/xe/lnl: Offload system clear page activity to
 GPU
To: Matthew Auld <matthew.auld@intel.com>, <dri-devel@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20240704081841.30212-1-nirmoy.das@intel.com>
 <20240704081841.30212-4-nirmoy.das@intel.com>
 <005ede82-0d72-4ad5-87a4-9a8bfdb81d2a@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <005ede82-0d72-4ad5-87a4-9a8bfdb81d2a@intel.com>
X-ClientProxiedBy: DUZPR01CA0324.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::29) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SJ0PR11MB5024:EE_
X-MS-Office365-Filtering-Correlation-Id: 4611411c-1a58-4b03-80e4-08dca759c2c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUhMR0VaQ0s5K2RzeUNVaS9WNUZoOE5ZT3JlVUF4ZEhWSVVaeFRDd2JEN0ZH?=
 =?utf-8?B?aEVxRGcwWURubUpwdjRGUzdiVU5BSzV3K3JIak4rdTJCaTBQemVacjhPQWlL?=
 =?utf-8?B?NUpLbVBHNW5vMFJHT251TGJBZmVndHg3N1JHdEtjSzdUSTcyYnVpT3dUMlhr?=
 =?utf-8?B?N1FjWmtKRUdvaFZ1QjB4WlpZbkU2MXRqVUhKVCsrY3IvVTNrN0c1dG1YVVMr?=
 =?utf-8?B?RzlNMTQ3c0JPakNuc2Z0QjR6SUFiSDhyMks3cW1hZnBSWEZoNVg5VGZoN3dN?=
 =?utf-8?B?eWJyY09xeVJEMHN0TUY5bkxYODRhYjVDaUtoUmdOelBNRXQ5ZkVoQjRWNDZH?=
 =?utf-8?B?cnB3aFRsRUNReDRYdTlRM2xZWUJjbVhyVzVnNHFhMjRBdXpWVFpMZG9IbVVv?=
 =?utf-8?B?a3AvblhIeGNnNTcxQm9jcnFSMU9XN0xYSC9rRFNISUp4c3RBeTFFd3BodVR4?=
 =?utf-8?B?N1hLQis2ZHZ4ZllUQUVuM1h5eXp6RUd5MWk1WWZTcGFuVWRMTkU0K0lFWmhn?=
 =?utf-8?B?VzZuOUdLUm5tc1pkQ3FGT0pva0NHOXdjTWRQS2hUWnk4bDNxdHlXYVNDRlI2?=
 =?utf-8?B?cmdsQjVRMzczekpONmhyZ1pnRjNtMkpRVnAxVWVRakQwOUMxcVNieVp5OEFF?=
 =?utf-8?B?V2VVMnRtWHNTQzM1aXBySEdpMER6NDB4MC9oN0h4c29nejRTTU4zTnN5T2M2?=
 =?utf-8?B?Zy92TW85azFBSkNYaEIvQzlCZzhocGtJVW5CMG9GN21pSTIwN1V1d1M1VTBk?=
 =?utf-8?B?aFFoSnBBNnhJQkoybGFVWDk0L2MwWVhMVDZ2enk5ZDh3emcyZjI3K3NzUU5C?=
 =?utf-8?B?SDgzY0JWM1ZLY0V1SS9qNnE2TlcwYUdCOStqd2pHR0J0QlhlRG5IQUFwVkJ3?=
 =?utf-8?B?YXR4WnY5KzZLRWs3Z1NYTC9BV1QzWEg0QTVNdjVndFdlRE1LZlBjSUVUeGVM?=
 =?utf-8?B?MThuUWNWNjc4MkdOazFMek9WMGQwOVZobU83WlVWTWNPYVFUR0lTK1h1NzNE?=
 =?utf-8?B?R0hZOXdyTmVFbFpzSFo2T1QwODRIUTVHdmdrQ3BOOVczNUpJcjAzMmlvTEJM?=
 =?utf-8?B?ZnpWalMwQ2QvWWhYU3YxNWQ1TjNxMFA4bk9zYnRhaWZHWEhJaFNybDBwaTdY?=
 =?utf-8?B?WTZJMVFtMXZJSzV4NGJUcnk2dERLdE42djcvM0RoL01EczhETG1MNUtHVVB4?=
 =?utf-8?B?ODQvOERUUzVRVjRtUmhBQ2xIWGR5ZllXVDJ6aFBKazdBeEVxMGRBdENoSUtC?=
 =?utf-8?B?QlR4Uy8yeWh4eDJkTzlhbzZvLzMyWFNlN1lyblpMYmJkNjFES3I2cVVFZDVI?=
 =?utf-8?B?UGhSdVIvSlNrRXVtZVk1a1E3QUZXSld5ZVpaQWx3YWVmdEJWQUVHbzhXZUg0?=
 =?utf-8?B?TEhuWFM0VDlTRVFzSXN0VkYrV1Rsdis4YUpmVGt2ZW5zZHFUSGhqWmRMNzBu?=
 =?utf-8?B?eHU1YUxjWmNwckIzMmNlTWJETGhNWDVhRllTdXVFNGhRSjNwYmhyZ1lFS1FY?=
 =?utf-8?B?OGVJSE9DTkZpbU9TQWx3NGl3YlRWeFVLelRqOHI2MGZJSEREMG1RUXFKaWhV?=
 =?utf-8?B?L0dCU0FuR0RtSnJnNjZtbFQxaW9BdEJwRlFHbUk3RG9LejhyLzVNdXNLelpa?=
 =?utf-8?B?UHBSQ21KNTBEYUpLUHVxdlFFdnd3aGZVRXRsclpxcm5XSFhmWk5WL241Wmsw?=
 =?utf-8?B?andxQjRWVUNZQlVCWVFkS0N6dUhONzRQRTdybWJHL0E5eWN5VEU3T3ROVFBk?=
 =?utf-8?B?VXNBZURjLzlHOXdsZ01nZXhkZlY5VDdVdE0wQXpCYjNybGRkbmRUemlBRWtI?=
 =?utf-8?B?VEszZVJTcy9rakRzWEhnQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1pqd3gyMFdPcGVnQlNBS3FPdlU1M3RYTUtROWduMVJLRkxKb2tPcUZIVUhh?=
 =?utf-8?B?WjZoUXRBRVhZUE9KNm1OZkFPRVlNMXdvSjVZbHpQZ2xxU0d5dTJPdkNUQnVx?=
 =?utf-8?B?OGxUN00wK3YxQ2Q0eHdpOWhVYmc0eklnODEyRnBZb3lVV2pkWDcrZDQya25k?=
 =?utf-8?B?T3N4d25lVlZEd2p1dHRHcmEyT2FSd3p3S0ZPTUo1YlY4bzUvU2ZWUnBacGlN?=
 =?utf-8?B?T0N3MTU0WGRQMW56emVvK0FMOTRuZkFDZmQ3c0dOWXpDSFFSWG1UVU55cDJR?=
 =?utf-8?B?Tjl6RHBCZjV1YlJ0anJnbk5zL1BwQWxyZVRZUWFTZ01vUi9lZ0g4SGRJN3Rq?=
 =?utf-8?B?ZGR5K2thSlJDZ1pBanRWUXNCaURvVWxCMjNJS2VBbnhrb0I0eU5oYktrSG0z?=
 =?utf-8?B?aldmYzR6b01mbUpEd1pPSjF5WWhJOVBXN05MNUNveVpxMTBXNUtoOVlsZmZj?=
 =?utf-8?B?cjJYT2tuSnJ0ZDA0cm1NS25uaWR0MEdaS1ZsQ2VFVVJXVUl6R1VoblJWUEQ4?=
 =?utf-8?B?ZnV2WlBTYzFjK2NNeEw5KzhDbVNybjVZOHdnK2tRbmhmSkE5Yno5RjZmQ1hy?=
 =?utf-8?B?akRISld3ei9qUmdDcU9WMTU4UHhtbzh6RmN3Zk1ZZDRZc3dUbDBxcUg0cDFQ?=
 =?utf-8?B?R1lKVGJlekxZdHYvaHNXaG91bU9aYVM1eEpuMHF3aEkvWVFPdnd3bkdPbUtX?=
 =?utf-8?B?REhVcUlmMjA0ckxjVnVXNklIVXVNR2llUHdyRFFDTUNyejlldTJzb0tJTHdT?=
 =?utf-8?B?UDdQM2pUV2hLNU5kbm5jOEEybXRuNkMwOXV3RGVmV0kzL040SDhWMExpWWVv?=
 =?utf-8?B?dFdzbit2MHgyMnkrZVkzeWlnakJ1UTBJSENmbUplaG9OeDdVRUIzR0ZyUnBN?=
 =?utf-8?B?MUhmaEdGckNIbm51bE05R24zUDB5Q29zYzZ3akVyNHJibnpNd3EvcGx3Znow?=
 =?utf-8?B?ZXJOaE9Cc1crUXBTVStBaVpFYmhjWi9vUU4xNUpGc2JIRStrK3JmQ1dPOENy?=
 =?utf-8?B?UElzVDZaMTZoUUw3QjFydGdESEZkNjhvL0FyMHBKQWlzZ3hoalBpMCtlVzFl?=
 =?utf-8?B?cm9KZ2N6TzBxTEpTQjJpOXR6RzVZbGV2SDl0eEZYQ3JDbnU3R2tRTGptK0V1?=
 =?utf-8?B?QnZVYUd3QWQvSTN6MmY2dVV6bDhabTl0bFFCYmg3ZEVPVWNsUzI2OGNaK2pu?=
 =?utf-8?B?a3VDZGgvSmFZMTdsTi8xZVAwRUNnanJ6MUlOOUxvWEphYTRDRHMySnB0Kzk1?=
 =?utf-8?B?a0t4Lzc0UGFBQWY4aFMvN2xOYjZOcThwVXF3SEVvZ2d0aTlRL1V4b2JWS2pj?=
 =?utf-8?B?UytrTXd2WUxQN0RDSFJVdVRYTTRZd3BjcEpaMEdqbDFhZmE3eFJmUzJzRjBR?=
 =?utf-8?B?eFVBZVZpSHo4OE5NOTBhYW02WXJ4T2xiamxreXZVcGROL2cwYnpWUnJITXFM?=
 =?utf-8?B?ZnFBY3VoMFZRVEg0M3J3eFR5cmxjaXQyWEk1UVdaWUFYNktQTmNMNWJxR2lu?=
 =?utf-8?B?SUs4VTZZYi8xVjJwWkd4UVp0WUQ3dEhRVkVlTHM5b0FLSndSakw5UW03UHAr?=
 =?utf-8?B?MnlVSGhxaDYrT0t1NWJsTEZMQ1MwZlVKbDJZV2JSbE9lV0pxNmpYMlRBSjVH?=
 =?utf-8?B?TC9pbHRVT01lQWZnc3c0S0J3ckcxaEVTUnJ3SUdHNWFtTlcwb3hPaG1rNUJ2?=
 =?utf-8?B?YlRkWFlSR3lldGtBM2FzZDR1RnB6NFQxdjZSaVdnQllwazVTOVYyRXBIYjJz?=
 =?utf-8?B?Z2dhUHJsMDduZEZxUS9zbjMvbnJpQ0VrdVNTeWljTFlzQmpWZEdTMTN1eWZ1?=
 =?utf-8?B?OFBSYkFvaCtjLzh6UTNKcFNSTnhQU0pTMUEyWHdJYjlScnVma2djaHorWm5V?=
 =?utf-8?B?L3Q4SkdzdFFzMU96ZzVTV3llb2tCeW5ibVZaVmN6a2RuMFlhUkxiTVF0clUy?=
 =?utf-8?B?NnJXRzNNS2J4ODVmZUFXMkJmdk95MWV4ZFd3NFBtOTVPT0N4ZHVTUS9lZDQ1?=
 =?utf-8?B?ZXNiTGMvakUyVWFkZTBGS1hmTFFVSU42SFNmMEcwRVcvemE1S0FyZjg3eWNr?=
 =?utf-8?B?SjVDT1lJZ0FYUHNxdm8yS2xjRGYzODAyR094dW1wNVU0S21aWk5kTUQ3Qll2?=
 =?utf-8?Q?y+rwN5XGUj2Zt983CS/YxDajh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4611411c-1a58-4b03-80e4-08dca759c2c1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 18:45:14.3511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2f7m3VuSKAQDBOiRLdZLIcsdiHmo8Bi5LekI3dOIxtedfbVvqgd48NwJ0LCyRb6NGNP7HasO+8foPykXrrjjVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5024
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

--------------1QUW480Vwy7olren6x9uouLJ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 7/18/2024 6:27 PM, Matthew Auld wrote:
> On 04/07/2024 09:18, Nirmoy Das wrote:
>> On LNL because of flat CCS, driver creates a migrate job to clear
>> CCS meta data. Extend that to also clear system pages using GPU.
>> Inform TTM to allocate pages without __GFP_ZERO to avoid double page
>> clearing by clearing out TTM_TT_FLAG_ZERO_ALLOC flag and set
>> TTM_TT_FLAG_CLEARED_ON_FREE while freeing to skip ttm pool's
>> clearn-on-free as XE now takes care of clearing pages. If a bo
>> is in system placement and there is a cpu map then for such BO gpu
>> clear will be avoided as there is no dma mapping for such BO.
>>
>> To test the patch, created a small test that tries to submit a job
>> after binding various sizes of buffer which shows good gains for larger
>> buffer. For lower buffer sizes, the result is not very reliable as the
>> results vary a lot.
>>
>> With the patch
>> sudo  ~/igt-gpu-tools/build/tests/xe_exec_store --run
>> basic-store-benchmark
>> IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.10.0-rc2-xe+ x86_64)
>> Using IGT_SRANDOM=1719237905 for randomisation
>> Opened device: /dev/dri/card0
>> Starting subtest: basic-store-benchmark
>> Starting dynamic subtest: WC
>> Dynamic subtest WC: SUCCESS (0.000s)
>> Time taken for size SZ_4K: 9493 us
>> Time taken for size SZ_2M: 5503 us
>> Time taken for size SZ_64M: 13016 us
>> Time taken for size SZ_128M: 29464 us
>> Time taken for size SZ_256M: 38408 us
>> Time taken for size SZ_1G: 148758 us
>> Starting dynamic subtest: WB
>> Dynamic subtest WB: SUCCESS (0.000s)
>> Time taken for size SZ_4K: 3889 us
>> Time taken for size SZ_2M: 6091 us
>> Time taken for size SZ_64M: 20920 us
>> Time taken for size SZ_128M: 32394 us
>> Time taken for size SZ_256M: 61710 us
>> Time taken for size SZ_1G: 215437 us
>> Subtest basic-store-benchmark: SUCCESS (0.589s)
>>
>> With the patch:
>> sudo  ~/igt-gpu-tools/build/tests/xe_exec_store --run
>> basic-store-benchmark
>> IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.10.0-rc2-xe+ x86_64)
>> Using IGT_SRANDOM=1719238062 for randomisation
>> Opened device: /dev/dri/card0
>> Starting subtest: basic-store-benchmark
>> Starting dynamic subtest: WC
>> Dynamic subtest WC: SUCCESS (0.000s)
>> Time taken for size SZ_4K: 11803 us
>> Time taken for size SZ_2M: 4237 us
>> Time taken for size SZ_64M: 8649 us
>> Time taken for size SZ_128M: 14682 us
>> Time taken for size SZ_256M: 22156 us
>> Time taken for size SZ_1G: 74457 us
>> Starting dynamic subtest: WB
>> Dynamic subtest WB: SUCCESS (0.000s)
>> Time taken for size SZ_4K: 5129 us
>> Time taken for size SZ_2M: 12563 us
>> Time taken for size SZ_64M: 14860 us
>> Time taken for size SZ_128M: 26064 us
>> Time taken for size SZ_256M: 47167 us
>> Time taken for size SZ_1G: 170304 us
>> Subtest basic-store-benchmark: SUCCESS (0.417s)
>>
>> With the patch and init_on_alloc=0
>> sudo  ~/igt-gpu-tools/build/tests/xe_exec_store --run
>> basic-store-benchmark
>> IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.10.0-rc2-xe+ x86_64)
>> Using IGT_SRANDOM=1719238219 for randomisation
>> Opened device: /dev/dri/card0
>> Starting subtest: basic-store-benchmark
>> Starting dynamic subtest: WC
>> Dynamic subtest WC: SUCCESS (0.000s)
>> Time taken for size SZ_4K: 4803 us
>> Time taken for size SZ_2M: 9212 us
>> Time taken for size SZ_64M: 9643 us
>> Time taken for size SZ_128M: 13479 us
>> Time taken for size SZ_256M: 22429 us
>> Time taken for size SZ_1G: 83110 us
>> Starting dynamic subtest: WB
>> Dynamic subtest WB: SUCCESS (0.000s)
>> Time taken for size SZ_4K: 4003 us
>> Time taken for size SZ_2M: 4443 us
>> Time taken for size SZ_64M: 12960 us
>> Time taken for size SZ_128M: 13741 us
>> Time taken for size SZ_256M: 26841 us
>> Time taken for size SZ_1G: 84746 us
>> Subtest basic-store-benchmark: SUCCESS (0.290s)
>>
>> v2: Handle regression on dgfx(Himal)
>>      Update commit message as no ttm API changes needed.
>> v3: Fix Kunit test.
>> v4: handle data leak on cpu mmap(Thomas)
>>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c           | 25 ++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_device.c       |  7 +++++++
>>   drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>>   3 files changed, 33 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 4d6315d2ae9a..b76a44fcf3b1 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -387,6 +387,13 @@ static struct ttm_tt *xe_ttm_tt_create(struct 
>> ttm_buffer_object *ttm_bo,
>>           caching = ttm_uncached;
>>       }
>>   +    /* If the device can support gpu clear pages then set proper ttm
>
> Nit: for multi-line block comment style is usually:
>
> /*
>  * If the device
>
>> +     * flag. Zeroed pages are only required for ttm_bo_type_device so
>> +     * unwanted data is leaked to userspace.
>
> not leaked?


Yes, should be not leaked.

>
>> +     */
>> +    if (ttm_bo->type == ttm_bo_type_device && xe->mem.gpu_page_clear)
>> +        page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
>> +
>>       err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, 
>> extra_pages);
>>       if (err) {
>>           kfree(tt);
>> @@ -408,6 +415,10 @@ static int xe_ttm_tt_populate(struct ttm_device 
>> *ttm_dev, struct ttm_tt *tt,
>>       if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
>>           return 0;
>>   +    /* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear pages */
>> +    if (tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE)
>> +        tt->page_flags &= ~TTM_TT_FLAG_ZERO_ALLOC;
>> +
>>       err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
>>       if (err)
>>           return err;
>> @@ -653,6 +664,14 @@ static int xe_bo_move(struct ttm_buffer_object 
>> *ttm_bo, bool evict,
>>         int ret = 0;
>>   +    /*
>> +     * Clear TTM_TT_FLAG_CLEARED_ON_FREE on bo creation path when
>> +     * moving to system as the bo doesn't dma_mapping.
>> +     */
>
> Ok, so I guess with deferred allocation you always get CPU clear, 

Yes


> but there is no funny business in the fault hander.

There is sort of  one, so we have 3 cases:

1 DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING + CPU mmap --> CPU clear always

2 Not DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING + CPU mmap --> GPU clear

I wasn't sure if this was correct but Thomas confirmed that this is fine 
as  "cpu fault handler already waits for the kernel fence that the 
xe_migrate_clear() attaches"

3 Not DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING + exec_buf/GPU access  --> 
GPU clear


>
>> +    if (!old_mem && ttm && !ttm_tt_is_populated(ttm)) {
>> +        ttm->page_flags &= ~TTM_TT_FLAG_CLEARED_ON_FREE;
>> +    }
>
> Nit: Can drop the {}

+1


>
>> +
>>       /* Bo creation path, moving to system or TT. */
>>       if ((!old_mem && ttm) && !handle_system_ccs) {
>>           if (new_mem->mem_type == XE_PL_TT)
>> @@ -676,7 +695,8 @@ static int xe_bo_move(struct ttm_buffer_object 
>> *ttm_bo, bool evict,
>>                           (!mem_type_is_vram(old_mem_type) && 
>> !tt_has_data);
>>         needs_clear = (ttm && ttm->page_flags & 
>> TTM_TT_FLAG_ZERO_ALLOC) ||
>> -        (!ttm && ttm_bo->type == ttm_bo_type_device);
>> +        (!ttm && ttm_bo->type == ttm_bo_type_device) ||
>> +        (ttm && ttm->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE);
>>         if (new_mem->mem_type == XE_PL_TT) {
>>           ret = xe_tt_map_sg(ttm);
>> @@ -790,6 +810,9 @@ static int xe_bo_move(struct ttm_buffer_object 
>> *ttm_bo, bool evict,
>>                        handle_system_ccs;
>>               bool clear_bo_data = mem_type_is_vram(new_mem->mem_type);
>>   +            if (ttm && (ttm->page_flags & 
>> TTM_TT_FLAG_CLEARED_ON_FREE))
>> +                clear_bo_data |= true;
>> +
>>               fence = xe_migrate_clear(migrate, bo, new_mem,
>>                            clear_bo_data, clear_ccs);
>>           }
>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>> b/drivers/gpu/drm/xe/xe_device.c
>> index 03492fbcb8fb..7c682a53f06e 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -636,6 +636,13 @@ int xe_device_probe(struct xe_device *xe)
>>       if (err)
>>           goto err;
>>   +    /**
>
> Nit: can drop the extra * since this is not actual kernel-doc.

+1


>
>> +     * On iGFX device with flat CCS, we clear CCS metadata, let's 
>> extend that
>> +     * and use GPU to clear pages as well.
>> +     */
>> +    if (xe_device_has_flat_ccs(xe) && !IS_DGFX(xe))
>> +        xe->mem.gpu_page_clear = true;
>
> Could potentially move this into xe_ttm_sys_mgr_init() ?


Yes, good idea.

>
>> +
>>       err = xe_vram_probe(xe);
>>       if (err)
>>           goto err;
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index 3bca6d344744..28eaf2ab1f25 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -325,6 +325,8 @@ struct xe_device {
>>           struct xe_mem_region vram;
>>           /** @mem.sys_mgr: system TTM manager */
>>           struct ttm_resource_manager sys_mgr;
>> +        /** @gpu_page_clear: clear pages offloaded to GPU */
>
> @mem.gpu_page_clear?
>
> Should we maybe also rename this to gpu_page_clear_sys or similar? 
> Since we technically already "clear pages offloaded to GPU" for vram.


Yes, gpu_page_clear_sys  should make it more clear.


Thanks,

Nirmoy

>
>> +        bool gpu_page_clear;
>>       } mem;
>>         /** @sriov: device level virtualization data */
--------------1QUW480Vwy7olren6x9uouLJ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/18/2024 6:27 PM, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:005ede82-0d72-4ad5-87a4-9a8bfdb81d2a@intel.com">On
      04/07/2024 09:18, Nirmoy Das wrote:
      <br>
      <blockquote type="cite">On LNL because of flat CCS, driver creates
        a migrate job to clear
        <br>
        CCS meta data. Extend that to also clear system pages using GPU.
        <br>
        Inform TTM to allocate pages without __GFP_ZERO to avoid double
        page
        <br>
        clearing by clearing out TTM_TT_FLAG_ZERO_ALLOC flag and set
        <br>
        TTM_TT_FLAG_CLEARED_ON_FREE while freeing to skip ttm pool's
        <br>
        clearn-on-free as XE now takes care of clearing pages. If a bo
        <br>
        is in system placement and there is a cpu map then for such BO
        gpu
        <br>
        clear will be avoided as there is no dma mapping for such BO.
        <br>
        <br>
        To test the patch, created a small test that tries to submit a
        job
        <br>
        after binding various sizes of buffer which shows good gains for
        larger
        <br>
        buffer. For lower buffer sizes, the result is not very reliable
        as the
        <br>
        results vary a lot.
        <br>
        <br>
        With the patch
        <br>
        sudo&nbsp; ~/igt-gpu-tools/build/tests/xe_exec_store --run
        <br>
        basic-store-benchmark
        <br>
        IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.10.0-rc2-xe+
        x86_64)
        <br>
        Using IGT_SRANDOM=1719237905 for randomisation
        <br>
        Opened device: /dev/dri/card0
        <br>
        Starting subtest: basic-store-benchmark
        <br>
        Starting dynamic subtest: WC
        <br>
        Dynamic subtest WC: SUCCESS (0.000s)
        <br>
        Time taken for size SZ_4K: 9493 us
        <br>
        Time taken for size SZ_2M: 5503 us
        <br>
        Time taken for size SZ_64M: 13016 us
        <br>
        Time taken for size SZ_128M: 29464 us
        <br>
        Time taken for size SZ_256M: 38408 us
        <br>
        Time taken for size SZ_1G: 148758 us
        <br>
        Starting dynamic subtest: WB
        <br>
        Dynamic subtest WB: SUCCESS (0.000s)
        <br>
        Time taken for size SZ_4K: 3889 us
        <br>
        Time taken for size SZ_2M: 6091 us
        <br>
        Time taken for size SZ_64M: 20920 us
        <br>
        Time taken for size SZ_128M: 32394 us
        <br>
        Time taken for size SZ_256M: 61710 us
        <br>
        Time taken for size SZ_1G: 215437 us
        <br>
        Subtest basic-store-benchmark: SUCCESS (0.589s)
        <br>
        <br>
        With the patch:
        <br>
        sudo&nbsp; ~/igt-gpu-tools/build/tests/xe_exec_store --run
        <br>
        basic-store-benchmark
        <br>
        IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.10.0-rc2-xe+
        x86_64)
        <br>
        Using IGT_SRANDOM=1719238062 for randomisation
        <br>
        Opened device: /dev/dri/card0
        <br>
        Starting subtest: basic-store-benchmark
        <br>
        Starting dynamic subtest: WC
        <br>
        Dynamic subtest WC: SUCCESS (0.000s)
        <br>
        Time taken for size SZ_4K: 11803 us
        <br>
        Time taken for size SZ_2M: 4237 us
        <br>
        Time taken for size SZ_64M: 8649 us
        <br>
        Time taken for size SZ_128M: 14682 us
        <br>
        Time taken for size SZ_256M: 22156 us
        <br>
        Time taken for size SZ_1G: 74457 us
        <br>
        Starting dynamic subtest: WB
        <br>
        Dynamic subtest WB: SUCCESS (0.000s)
        <br>
        Time taken for size SZ_4K: 5129 us
        <br>
        Time taken for size SZ_2M: 12563 us
        <br>
        Time taken for size SZ_64M: 14860 us
        <br>
        Time taken for size SZ_128M: 26064 us
        <br>
        Time taken for size SZ_256M: 47167 us
        <br>
        Time taken for size SZ_1G: 170304 us
        <br>
        Subtest basic-store-benchmark: SUCCESS (0.417s)
        <br>
        <br>
        With the patch and init_on_alloc=0
        <br>
        sudo&nbsp; ~/igt-gpu-tools/build/tests/xe_exec_store --run
        <br>
        basic-store-benchmark
        <br>
        IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.10.0-rc2-xe+
        x86_64)
        <br>
        Using IGT_SRANDOM=1719238219 for randomisation
        <br>
        Opened device: /dev/dri/card0
        <br>
        Starting subtest: basic-store-benchmark
        <br>
        Starting dynamic subtest: WC
        <br>
        Dynamic subtest WC: SUCCESS (0.000s)
        <br>
        Time taken for size SZ_4K: 4803 us
        <br>
        Time taken for size SZ_2M: 9212 us
        <br>
        Time taken for size SZ_64M: 9643 us
        <br>
        Time taken for size SZ_128M: 13479 us
        <br>
        Time taken for size SZ_256M: 22429 us
        <br>
        Time taken for size SZ_1G: 83110 us
        <br>
        Starting dynamic subtest: WB
        <br>
        Dynamic subtest WB: SUCCESS (0.000s)
        <br>
        Time taken for size SZ_4K: 4003 us
        <br>
        Time taken for size SZ_2M: 4443 us
        <br>
        Time taken for size SZ_64M: 12960 us
        <br>
        Time taken for size SZ_128M: 13741 us
        <br>
        Time taken for size SZ_256M: 26841 us
        <br>
        Time taken for size SZ_1G: 84746 us
        <br>
        Subtest basic-store-benchmark: SUCCESS (0.290s)
        <br>
        <br>
        v2: Handle regression on dgfx(Himal)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Update commit message as no ttm API changes needed.
        <br>
        v3: Fix Kunit test.
        <br>
        v4: handle data leak on cpu mmap(Thomas)
        <br>
        <br>
        Cc: Himal Prasad Ghimiray
        <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
        <br>
        Cc: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
        <br>
        Cc: &quot;Thomas Hellström&quot; <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
        <br>
        Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_bo.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 25
        ++++++++++++++++++++++++-
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_device.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 7 +++++++
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_device_types.h |&nbsp; 2 ++
        <br>
        &nbsp; 3 files changed, 33 insertions(+), 1 deletion(-)
        <br>
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_bo.c
        b/drivers/gpu/drm/xe/xe_bo.c
        <br>
        index 4d6315d2ae9a..b76a44fcf3b1 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_bo.c
        <br>
        +++ b/drivers/gpu/drm/xe/xe_bo.c
        <br>
        @@ -387,6 +387,13 @@ static struct ttm_tt
        *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; caching = ttm_uncached;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp; +&nbsp;&nbsp;&nbsp; /* If the device can support gpu clear pages then set
        proper ttm
        <br>
      </blockquote>
      <br>
      Nit: for multi-line block comment style is usually:
      <br>
      <br>
      /*
      <br>
      &nbsp;* If the device
      <br>
      <br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp;&nbsp; * flag. Zeroed pages are only
        required for ttm_bo_type_device so
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; * unwanted data is leaked to userspace.
        <br>
      </blockquote>
      <br>
      not leaked?
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>Yes, should be not leaked.<br>
    </p>
    <blockquote type="cite" cite="mid:005ede82-0d72-4ad5-87a4-9a8bfdb81d2a@intel.com">
      <br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp;&nbsp; */
        <br>
        +&nbsp;&nbsp;&nbsp; if (ttm_bo-&gt;type == ttm_bo_type_device &amp;&amp;
        xe-&gt;mem.gpu_page_clear)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
        <br>
        +
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err = ttm_tt_init(&amp;tt-&gt;ttm, &amp;bo-&gt;ttm,
        page_flags, caching, extra_pages);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err) {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(tt);
        <br>
        @@ -408,6 +415,10 @@ static int xe_ttm_tt_populate(struct
        ttm_device *ttm_dev, struct ttm_tt *tt,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (tt-&gt;page_flags &amp; TTM_TT_FLAG_EXTERNAL)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
        <br>
        &nbsp; +&nbsp;&nbsp;&nbsp; /* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear
        pages */
        <br>
        +&nbsp;&nbsp;&nbsp; if (tt-&gt;page_flags &amp; TTM_TT_FLAG_CLEARED_ON_FREE)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tt-&gt;page_flags &amp;= ~TTM_TT_FLAG_ZERO_ALLOC;
        <br>
        +
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err = ttm_pool_alloc(&amp;ttm_dev-&gt;pool, tt, ctx);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;
        <br>
        @@ -653,6 +664,14 @@ static int xe_bo_move(struct
        ttm_buffer_object *ttm_bo, bool evict,
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret = 0;
        <br>
        &nbsp; +&nbsp;&nbsp;&nbsp; /*
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; * Clear TTM_TT_FLAG_CLEARED_ON_FREE on bo creation path
        when
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; * moving to system as the bo doesn't dma_mapping.
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; */
        <br>
      </blockquote>
      <br>
      Ok, so I guess with deferred allocation you always get CPU clear,
    </blockquote>
    <p>Yes</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:005ede82-0d72-4ad5-87a4-9a8bfdb81d2a@intel.com">but
      there is no funny business in the fault hander.
      <br>
    </blockquote>
    <p>There is sort of&nbsp; one, so we have 3 cases:&nbsp; <br>
    </p>
    <p><span><span class="ui-provider a b c d e f g h i j k l m n o p q r s t u v w x y z ab ac ae af ag ah ai aj ak" dir="ltr">
          <p> 1 DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING + CPU mmap --&gt;
            CPU clear always<br>
          </p>
          <p><span><span class="ui-provider a b c d e f g h i j k l m n o p q r s t u v w x y z ab ac ae af ag ah ai aj ak" dir="ltr">2 Not DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING +
                CPU mmap --&gt; GPU clear</span></span></p>
          <p><span><span class="ui-provider a b c d e f g h i j k l m n o p q r s t u v w x y z ab ac ae af ag ah ai aj ak" dir="ltr">I wasn't sure if this was correct but Thomas
                confirmed that this is fine as&nbsp; &quot;</span></span><span><span class="ui-provider a b c d e f g h i j k l m n o p q r s t u v w x y z ab ac ae af ag ah ai aj ak" dir="ltr">cpu fault handler already waits for the kernel
                fence that the xe_migrate_clear() attache</span></span><span><span class="ui-provider a b c d e f g h i j k l m n o p q r s t u v w x y z ab ac ae af ag ah ai aj ak" dir="ltr">s&quot;</span></span></p>
          <p><span><span class="ui-provider a b c d e f g h i j k l m n o p q r s t u v w x y z ab ac ae af ag ah ai aj ak" dir="ltr">3 Not DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING +
                exec_buf/GPU access&nbsp; --&gt; GPU clear<br>
              </span></span></p>
        </span></span></p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:005ede82-0d72-4ad5-87a4-9a8bfdb81d2a@intel.com">
      <br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp; if (!old_mem &amp;&amp; ttm
        &amp;&amp; !ttm_tt_is_populated(ttm)) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;page_flags &amp;= ~TTM_TT_FLAG_CLEARED_ON_FREE;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
      </blockquote>
      <br>
      Nit: Can drop the {}
      <br>
    </blockquote>
    <p>+1</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:005ede82-0d72-4ad5-87a4-9a8bfdb81d2a@intel.com">
      <br>
      <blockquote type="cite">+
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Bo creation path, moving to system or TT. */
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((!old_mem &amp;&amp; ttm) &amp;&amp;
        !handle_system_ccs) {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (new_mem-&gt;mem_type == XE_PL_TT)
        <br>
        @@ -676,7 +695,8 @@ static int xe_bo_move(struct
        ttm_buffer_object *ttm_bo, bool evict,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (!mem_type_is_vram(old_mem_type)
        &amp;&amp; !tt_has_data);
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; needs_clear = (ttm &amp;&amp; ttm-&gt;page_flags &amp;
        TTM_TT_FLAG_ZERO_ALLOC) ||
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (!ttm &amp;&amp; ttm_bo-&gt;type ==
        ttm_bo_type_device);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (!ttm &amp;&amp; ttm_bo-&gt;type == ttm_bo_type_device)
        ||
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (ttm &amp;&amp; ttm-&gt;page_flags &amp;
        TTM_TT_FLAG_CLEARED_ON_FREE);
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (new_mem-&gt;mem_type == XE_PL_TT) {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = xe_tt_map_sg(ttm);
        <br>
        @@ -790,6 +810,9 @@ static int xe_bo_move(struct
        ttm_buffer_object *ttm_bo, bool evict,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handle_system_ccs;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool clear_bo_data =
        mem_type_is_vram(new_mem-&gt;mem_type);
        <br>
        &nbsp; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ttm &amp;&amp; (ttm-&gt;page_flags &amp;
        TTM_TT_FLAG_CLEARED_ON_FREE))
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clear_bo_data |= true;
        <br>
        +
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fence = xe_migrate_clear(migrate, bo, new_mem,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clear_bo_data, clear_ccs);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_device.c
        b/drivers/gpu/drm/xe/xe_device.c
        <br>
        index 03492fbcb8fb..7c682a53f06e 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_device.c
        <br>
        +++ b/drivers/gpu/drm/xe/xe_device.c
        <br>
        @@ -636,6 +636,13 @@ int xe_device_probe(struct xe_device *xe)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto err;
        <br>
        &nbsp; +&nbsp;&nbsp;&nbsp; /**
        <br>
      </blockquote>
      <br>
      Nit: can drop the extra * since this is not actual kernel-doc.
      <br>
    </blockquote>
    <p>+1</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:005ede82-0d72-4ad5-87a4-9a8bfdb81d2a@intel.com">
      <br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp;&nbsp; * On iGFX device with flat CCS, we
        clear CCS metadata, let's extend that
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; * and use GPU to clear pages as well.
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; */
        <br>
        +&nbsp;&nbsp;&nbsp; if (xe_device_has_flat_ccs(xe) &amp;&amp; !IS_DGFX(xe))
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe-&gt;mem.gpu_page_clear = true;
        <br>
      </blockquote>
      <br>
      Could potentially move this into xe_ttm_sys_mgr_init() ?
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>Yes, good idea.</p>
    <blockquote type="cite" cite="mid:005ede82-0d72-4ad5-87a4-9a8bfdb81d2a@intel.com">
      <br>
      <blockquote type="cite">+
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err = xe_vram_probe(xe);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto err;
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_device_types.h
        b/drivers/gpu/drm/xe/xe_device_types.h
        <br>
        index 3bca6d344744..28eaf2ab1f25 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_device_types.h
        <br>
        +++ b/drivers/gpu/drm/xe/xe_device_types.h
        <br>
        @@ -325,6 +325,8 @@ struct xe_device {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_mem_region vram;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @mem.sys_mgr: system TTM manager */
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct ttm_resource_manager sys_mgr;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @gpu_page_clear: clear pages offloaded to GPU */
        <br>
      </blockquote>
      <br>
      @mem.gpu_page_clear?
      <br>
      <br>
      Should we maybe also rename this to gpu_page_clear_sys or similar?
      Since we technically already &quot;clear pages offloaded to GPU&quot; for
      vram.
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>Yes, gpu_page_clear_sys&nbsp; should make it more clear.</p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>Nirmoy<br>
    </p>
    <blockquote type="cite" cite="mid:005ede82-0d72-4ad5-87a4-9a8bfdb81d2a@intel.com">
      <br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool gpu_page_clear;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } mem;
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @sriov: device level virtualization data */
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------1QUW480Vwy7olren6x9uouLJ--
