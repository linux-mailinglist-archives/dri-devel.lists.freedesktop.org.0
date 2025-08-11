Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66683B1FFA0
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 08:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68ACA10E2EE;
	Mon, 11 Aug 2025 06:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S2MaiG7C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3A210E2EC;
 Mon, 11 Aug 2025 06:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754895142; x=1786431142;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aimJn1IU+Y2eLG/gE9bLK67JOZSnuh0+CKe4fNJZaXI=;
 b=S2MaiG7C1N3NiPCzHSGA+fJVDEqALY4zsSboFqKEygFfV4uLMY2XWus4
 3mySjXj2dAoSgxpG0JfY6vgm2b46marUq3nr0eS4D6kI3ZwCFdb+V7R91
 L9aT68zJ9FbO3u2GmlCePiSE9EaAJxLM5GmOJ6hdMJibepkKc9Z6Pa2QF
 x7B4CM/sk8KH8Dr4wonntkOCDznhJXq84m5eASs5jSr4QIpWYqYIVPVRC
 3u6cHA+J9jg1OSDsPd4GCoA0+avOZIZ/ZBlClPDDc42OHbC0fmkBAGrk6
 1JHqW9+tcGLgn61ZmKTNQ6OxsOjK19qjMfftz2kaXRoVWb7AVp0PxlBoS g==;
X-CSE-ConnectionGUID: 2fW6oM40QP+HI4+FXKddog==
X-CSE-MsgGUID: M2NO+MRXR9qL9iO5/i3eYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="79709384"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="79709384"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2025 23:52:22 -0700
X-CSE-ConnectionGUID: 5L370K+aR6WoLwWluA6zlA==
X-CSE-MsgGUID: PYwBcU12RumUsLtIfJhU5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="196670018"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2025 23:52:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 10 Aug 2025 23:52:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sun, 10 Aug 2025 23:52:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.84) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 10 Aug 2025 23:52:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBz6poODYtIHYJXZKC1BgPHm1EYq7jDSdL8PTkpZQkpgqzwkMrtiDgqNaZYbPO0L35wuImNTuKC1GAfZA5TXrWrICSuw1+WZCaKQImifH5gaz6Q/LraNGA8DRACadfWwR5zijahrjq5I6nOmVNI1PdRo8VUqhiLhibCRgTruZeHxbgaLAux4r6sMXGJvQ9+peVKuUchNgEb1HLBi3nM3YH2tllxRkYLCPZdn4PInHzCYGjpsOcKvKvgT8TcpBHAFWNPwGBQdc2GpiaflND2CEcbmcsJKIeRVb9Ro9Tgguhxs5cTJFk0N11WUL85xCTZkaMkQtj0X1kvNNacv7eiMdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybTsF8x/4iB2ipdJuITxMucqAIB1f2ZrMREaynPce/E=;
 b=oHPJ49ENJ/FC7sMs96f4aXjYZ8SGlPK+qUm6PA5W0d0ziHhV04CjL4A5bn0TlTfFWUgNw+wfWPLcMxWTejHCbAZN6y23S4DMxP8VA0GPiV6L/w5eJdSQEEH59W2I8O5HJE0uMesZDP3wH1f57IPIkrbxmQoiN9YN9DJ+ksz7btw/VMRy5w19g395rePoD/+RKmuX+PSvnxYtzKYYAwmSM4ROrjiNJqPd6h+Y+Dxr4KsRAVPG/jwSdMizR5GY7rUv4GI/zMUyLRU1Zcmxi3ijgpx+WTzJ+JM8koWWU4xrvh1df1VUEhiA3Z3v6AWufh6ALNcaxN5l/duTQdDP4/Jl6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DS0PR11MB6472.namprd11.prod.outlook.com
 (2603:10b6:8:c0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 06:52:18 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e%7]) with mapi id 15.20.9009.013; Mon, 11 Aug 2025
 06:52:18 +0000
Message-ID: <f5d6e986-abc7-476c-b27b-ba22e5d114a2@intel.com>
Date: Mon, 11 Aug 2025 12:22:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/26] drm/gpuvm: Introduce
 DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE flag
To: Danilo Krummrich <dakr@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Boris
 Brezillon" <bbrezillon@kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
 <20250807164338.1832254-5-himal.prasad.ghimiray@intel.com>
 <DBXXHBNTM105.2DTBKIO95D5UI@kernel.org>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <DBXXHBNTM105.2DTBKIO95D5UI@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::11) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DS0PR11MB6472:EE_
X-MS-Office365-Filtering-Correlation-Id: 13405a9d-0faa-4061-eaa3-08ddd8a39d26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDQ0YnBReGpRSjBVK2V1c3lNaVFnZnczeS9uTTlvd3h2Q1pXTUtmbkUrRm8x?=
 =?utf-8?B?cHpLTVY4SzhLb3VvN3hFQURxc281TDdLNXYvOGlKUE1xQVl6YkVwak5wOVhJ?=
 =?utf-8?B?UnZKNWhOR1E1eFgzVU1kVVQyUlhtQThtU0FUUjlLekRqcE5rdkRHQ1RkOEZS?=
 =?utf-8?B?NUdQTDduU0I4bUY2UVhJNTdDcEEwYVdUeE5pT1Q1Q3ZQWWhYeFV3NjFIYklF?=
 =?utf-8?B?aTFodnJQL0VzRkNibWVJUEkrV1VnTW50MVhnSmtHNmw4dUdUa1YvN0ZRTFln?=
 =?utf-8?B?dk9jdnNXV1B1c3pHdlI3c24vUVBjUnBta0NSay9wUmpYZm9wOW5RamwzaE45?=
 =?utf-8?B?WnZ0VENzRXdQUGxUOFZDbWtITldwak9PVjlicmloaTk5Z1NiM2txVXVzVTJz?=
 =?utf-8?B?UkJtbEp1KzRiTUxVcHZqRGIrR1prRUlmU1A2YnRvdGdUcmlSVzRDTENmbTZB?=
 =?utf-8?B?KzVZb2plUnF3SzZ2THpxUFlGVWFkVEJ2ZFZJdXRIdFVzTHQzYTBSNmd0VkZy?=
 =?utf-8?B?aUpySU9nTWs4WnJ0ZndMVU5pZmxlbURQRStVcFNaR2UwazN3cHVSUEluRU1N?=
 =?utf-8?B?SDNnOU0zeGVBZHA4Q01XSWlOOWNmWDRURXJBYm5BRDc4cFJtcVI3UkZKd21u?=
 =?utf-8?B?WGM1VFRNV2diem1NZUEzSWlqdm5YS3RQSjU4bmk0OEkzaWpKdktWS1YxYU00?=
 =?utf-8?B?alY1UnVLajNUTmo1cGF2Z0tWblo0SUZXV3JDOWE3cFo0K085dy85TnE5OHlx?=
 =?utf-8?B?Ym84MG03TE5KZ3VicWNvUDl5QmQ1bVJGeHVKdndPc0pCM3dYZmpBc2R1NnhO?=
 =?utf-8?B?c1hOVS9laDdiTkF6RlBiTHRMS0Fkd3dOeTR0V1F4c2xSSEF3dVRNc0RkUTZK?=
 =?utf-8?B?MnlSRUxlTDN2V2l5b1ZSRXdTc0xiTERLTjdCUDlXUnRhSzJTOUhHcjFYV0xh?=
 =?utf-8?B?NFZXWHljRzl3ZU5YVVRLaFEybUUyMVpIZG9rNmVtdUlEeGdEbk1PTndRQWp4?=
 =?utf-8?B?dHlIM2N1ci9jMXVNVnNLTmxKNGloU01YZFZQNSt6Zm9kdzhQa2dwWGEwYit5?=
 =?utf-8?B?RE5kWkpha09GRlRsZklwcm1DSS9CTnZDdzdYNnZhMEprQ3kyc3Y1SVM1QmxG?=
 =?utf-8?B?b1JEWGFCdnRPWGFmUlNkV3R4Lyt2V0I5dWZieU1kV09JYllKK3dDSkw3OFMv?=
 =?utf-8?B?MExySjgyalFTTjFZczFIY3FtVnFUTFN0RjlCYVdReXIwRlhqT2FxcU83ZlBi?=
 =?utf-8?B?LzFBNElvcXlhQ3diN3BiR3c3V204Z3RZY2tYTFdWZmxmbzFCNTN5N3pxRjQy?=
 =?utf-8?B?Tld5Y1llakRkNnpjYVN6ZjFIc21yWWtNOW5EYndZdm9pN1pHajJ4WUJ3VUlr?=
 =?utf-8?B?V0JqMGRxeXBRNXNydEZ0RHFwcloxc0hWaW0vcTRLWUExVFRQTmU0ZHgvV3Jy?=
 =?utf-8?B?OWhwb0xzb2hlQ1RzaUlzN2pWSncrVTMwdmdUQkdwNGwrMS9WczEzTVljYzY4?=
 =?utf-8?B?ZkpNcE1JMmxRbENYQnlVY2FyM2dtZlplaVk1YzM3SEliaWpyc2dhM3dtUWp5?=
 =?utf-8?B?TjZ6WWo5aTdySXUvMWFKQ1pZcGF0bWRXL2I5cDhaOWpXeThRYnl6ZE1BcGpI?=
 =?utf-8?B?RXF6bi9wdlpzUisxekpLTGUxWUFETHM4cC9kbWtpVURXOTVOckRpUEt6aXBr?=
 =?utf-8?B?ckhCVjRXSDlieGxhc0plcEoyRUltb1dHQVMwKzdOaHExVC9YYzRpVWVTWXN3?=
 =?utf-8?B?T1FreGlRYXlOUUhIMGpsVnpsOTVsQlcweW04QXpLN0dFYS9mbDdKVHlBOERy?=
 =?utf-8?B?YitBZTh3ODFnZUY5eGdYYXdEaExnYW5mVmRnaVFmQ3lhVzFrYXFBbitYQUNO?=
 =?utf-8?B?djkrang3cTROSndhNGRxZEYzbk94YU1XSTN1WkNIZi9QS3NFNURaM0dYVnpv?=
 =?utf-8?Q?tApz8A+1Mco=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHJpMm0wQmdDTTczMVNmZm5XL0c2aEJZNzRHRlh2S2o0NHBXa2pQcWpNRFJU?=
 =?utf-8?B?ZUxzYlZpVjBmNzJ6N014cTBDSW9xMVh6bENKRWlER25WajBjZEthZ1dKeUlH?=
 =?utf-8?B?U2V1TTNxQXYvcFdsZkNOZGV3OXdSRjFIbTI3SHp3SWFuUTkxb2RpZnNoY1Rm?=
 =?utf-8?B?aEFqYi9MQndQZGVqVnVrY1dvdEUwS3F1OHRiMmxjSXF5Q09KNCt5WWhZb2VL?=
 =?utf-8?B?SmlaZDJ2WTBlVFM0c0ZRbG9DZmU1emJDbXU4cldrVVBjSG5UU0Zsa2xoYzBp?=
 =?utf-8?B?NXlic3R2YmVNN2RFbFVuc3pNVDArcUl2elZwNGNxUmQzVXdtbUpydU5lUHFo?=
 =?utf-8?B?NVltaFVMRkhWZGs0NksvQXBhenBJLzRremNwQjFTNUUxNGNjMWk1cllPaW5r?=
 =?utf-8?B?bXBGQmVqeXAyVzZjdGszdzZscWtyY0cwYzZ5akVkai9haEh6aWhLQ1RtUXN5?=
 =?utf-8?B?ZitYMDBPZnM4NitXMVhGeHlGcThjYiswR1FVeEkyVlRvL1p5U2RxbHN2bXJM?=
 =?utf-8?B?Q3ZyRVhqWGM3ZFFld1VwR3Y3eVZzSmJrd2czbHlWRzd5aFk5TVBFZVd5L0JK?=
 =?utf-8?B?dS85aE1KZG5jQkt3MHdicisyK0ZIaXRjMDdwM0Y3SjRDVk41QnpmWWdla3oy?=
 =?utf-8?B?Z0dXdVFoSEFYcEUxdlBOSmxaU2lJanFNcjV4ZVBwb3JrOTJFOUczVVhrdlpR?=
 =?utf-8?B?T1AyNmtZaDhPQWFqS3JJZkQ2TDFzeUNmZUpPQmhzY2tUOFh3bWlENFQwcDJJ?=
 =?utf-8?B?aWV4Vk1Ibk55TEl2ZTYwbU5GekxydVZPTStmZkZraHpmdGhpQVhyaUwzbCtF?=
 =?utf-8?B?eUYvRmZMZnFrWEJCMmVjcW82RXNoK2syTUwwdlNXaXlqb0RKZktvK3lvWitm?=
 =?utf-8?B?N1VwRjJxV2NoNVR6cnRuNmIxWUJZUHRkNkR5enUxQkthbUt1b3dtVkppT3py?=
 =?utf-8?B?ZTN6QlF5USt4MEg1SDkxcm53YXdNMGNaSG1aWG5IeXh3U1Jqck1NRGt3QXRv?=
 =?utf-8?B?aFlVRHYxejBuK0xJaVRURUI5TUgwa3E5bGNIT1cxN3ZsZUIzbGlCdTU1TlFw?=
 =?utf-8?B?UDkxMlZHTG5mb3JaSHF4TGlSU3F1cGlqYUJNYW9KdzlGN0RjbWpDLzVoVURt?=
 =?utf-8?B?TmFFQXBsV3lkMlZzY01vKzJPSEh1dDFvWTkyZ2F4bUVhM1ppcDRFVGYxR0Nx?=
 =?utf-8?B?Rmttanl5cm00bXVEMjRJNS9uR2EyOTBpNENwWjMxbDZ3ZlVTN3Vsalc4T1du?=
 =?utf-8?B?eFBBWjY4dlN2L21tNFhGM1JJNXg2endVb3Z4MVdtc0pBNHVobDZpNVZJQnBW?=
 =?utf-8?B?UnorQUpPYU1ydkJsd3MrTEMzMG8wVDNDcG9pVDgzbkdOK2N2eWVqbGoxZzJ5?=
 =?utf-8?B?RHplT0Y0cDBPMDdlWWZvUmJkbGVDdnhpQ3RYRHZQUk1DUnFJWEduL21ZZXdl?=
 =?utf-8?B?VlIvYnh1d24xT0EwcmhkOG5zTXpKUkNJV0hBVzBDcEZmMDlvcnFnYXZaS0tP?=
 =?utf-8?B?MjRubERjdFBmSlhSNHQrVGlTb0c3RmNubGRLblNEQUk3THRxaVA2dnVJZ2ph?=
 =?utf-8?B?ZFl3UlJjblpSVGF1WGhyazk5bEI0UGFva0ZWS2l6NWRTTkhzNTdQcXlWMnJU?=
 =?utf-8?B?d1JsUnlzVkNaWU9rc0NtZTJzRE1NNEFMYjFXNno4b01IL2dzQ0gySHdJUHRS?=
 =?utf-8?B?a1I4Ylc5a0ZBMmltcFNsSldmbEp3elJKbVFYdGRiTXBCaXVjU0UrdjViSTlF?=
 =?utf-8?B?Wm81MDRCVUxSb3FYT0dTelVIS0ZoZGg3b2tMNm5wNEJRVGxhZDVrWFFGT2cv?=
 =?utf-8?B?WkN3aVk4SGZNREhWVGlLWEZYRVlRSUpNUDg3S0dWQVRxN1NqR2lMUkZhL0tj?=
 =?utf-8?B?THZLSk1uYUFNd3l0bEdZV29pNXZFN0lpRUhDalEzOE1TWTBhV3haNVVvTno3?=
 =?utf-8?B?VDJ3S05BdCsxaHhhNXRDcUlnMXloelg3eWRQQkwrUWdYWWhaR3pNTmFLcWxq?=
 =?utf-8?B?VVdJRklqaFp1eUF4ZThjcFZGQzdhVngzaWk4SEZBYkpqRzRwblh5TG5IMHQv?=
 =?utf-8?B?WHM2dVphVzM1TFRkbUd5U0kySzg4U1BndmF4T2lNQ29tQVg3OUJjTUpkaXBu?=
 =?utf-8?B?WjFlSVRLZjVLNitZV0dudDZKcU5kTEZueC9tRk5hOFg4N3RKWU91S2k1K3dX?=
 =?utf-8?Q?BrBNdWAPt+3mVKdxWVmeMeg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13405a9d-0faa-4061-eaa3-08ddd8a39d26
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 06:52:18.7794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vu+/iUg/ObyoOQCujhMTTYsy3D88270y9rpoDnBq3BW0o/5QZMchN5xfBttjFHIkoFsjY66oR7hjYPw+FgzjtngEL/VeyMnTS4wWxNwvv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6472
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



On 09-08-2025 18:53, Danilo Krummrich wrote:
> On Thu Aug 7, 2025 at 6:43 PM CEST, Himal Prasad Ghimiray wrote:
>> - DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE: This flag is used by
>>    drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
>> user-provided range and split the existing non-GEM object VMA if the
> 
> What do you mean with non-GEM object VMA? I assume you just mean sparse
> mappings?

True>
>> start or end of the input range lies within it. The operations can
>> create up to 2 REMAPS and 2 MAPs.
> 
> Wait -- that doesn't make sense with what I thought how this works.
> 
> In the RFC you gave the following example:
> 
> 	Example:
> 	Input Range: 0x00007f0a54000000 to 0x00007f0a54400000
> 	GPU VMA: 0x0000000000000000 to 0x0000800000000000
> 	Operations Result:
> 	- REMAP:UNMAP: addr=0x0000000000000000, range=0x0000800000000000
> 	- REMAP:PREV: addr=0x0000000000000000, range=0x00007f0a54000000
> 	- REMAP:NEXT: addr=0x00007f0a54400000, range=0x000000f5abc00000
> 	- MAP: addr=0x00007f0a54000000, range=0x0000000000400000
> 
> That's exactly the same what the existing logic does. So in which case do you
> have *two* MAP operations?

Possible scenarios for ops functionality based on input start and end 
address from user:

a) User-provided range is a subset of an existing drm_gpuva
Expected Result: Same behavior as the default sm_map logic.
Reference: Case 1 from [1].

b) Either start or end (but not both) is not aligned with a drm_gpuva 
boundary
Expected Result: One REMAP and one MAP operation.
Reference: Case 3 from [1].

Existing GPUVMAs:

          drm_gpuva1                        drm_gpuva2
	[a----------------------------b-1][b-------------------c-1]

User Input to ops:
   start = inside drm_gpuva1
   end   = exactly at c-1 (end of drm_gpuva2)

Resulting Mapping:
	drm_gpuva1:pre       drm_gpuva:New map     drm_gpuva2
	[a---------start-1][start------- b-1] [b------------c-1]

Ops Created:
   REMAP:UNMAP drm_gpuva1 a to b
   REMAP:PREV a to start - 1
   MAP: start to b-1

Note: No unmap of drm_gpuvma2 and no merging of New map and drm_gpuva2.

c) Both start and end are not aligned with drm_gpuva boundaries, and 
they fall within different drm_gpuva regions
Expected Result: Two REMAP operations and two MAP operations.
Reference: Case 2 from [1].


d) User-provided range does not overlap with any existing drm_gpuva
Expected Result: No operations.
start and end exactly match the boundaries of one or more existing 
drm_gpuva regions

e) This includes cases where start is at the beginning of drm_gpuva1 and 
end is at the end of drm_gpuva2 (drm_gpuva1 and drm_gpuva2 can be same 
or different).
Expected Result: No operations

[1] 
https://lore.kernel.org/intel-xe/4203f450-4b49-401d-81a8-cdcca02035f9@intel.com/ 


> 
> For completeness, the other example you gave was:
> 
> 	Example:
> 	Input Range: 0x00007fc898800000 to 0x00007fc899000000
> 	GPU VMAs:
> 	- 0x0000000000000000 to 0x00007fc898800000
> 	- 0x00007fc898800000 to 0x00007fc898a00000
> 	- 0x00007fc898a00000 to 0x00007fc898c00000
> 	- 0x00007fc898c00000 to 0x00007fc899000000
> 	- 0x00007fc899000000 to 0x00007fc899200000
> 	Operations Result: None
> 
> This just means, if things are split already, at the defined edges, just don't
> do anything, which is also conform with the existing logic except for the "no
> merge" part, which is obviously fine given that it's explicitly for splitting
> things.
> 
> Can you please provide some additional *simple* examples, like the documentation
> of GPUVM does today for the normal split/merge stuff? I.e. please don't use
> complex real addresses, that makes it hard to parse.
> 
> Also, can you please provide some information on what this whole thing does
> *semantically*? I thought I understood it, but now I'm not so sure anymore.
> 

I’ve tried to explain the behavior/usecase with madvise and expected 
outcomes of the ops logic in detail in [1]. Could you please take a 
moment to review that and let me know if the explanation is sufficient 
or if any part needs further clarification?

>> The purpose of this operation is to be
>> used by the Xe driver to assign attributes to GPUVMA's within the
>> user-defined range.
> 
> Well, hopefully it's useful to other drivers as well. :)

It should be. :)

> 
>> Unlike drm_gpuvm_sm_map_ops_flags in default mode,
>> the operation with this flag will never have UNMAPs and
>> merges, and can be without any final operations.
> 
> I really think this is significant enough of a feature to add some proper
> documentation about it.
> 
> Please add a separate section about madvise operations to the documentation at
> the beginning of the drivers/gpu/drm/drm_gpuvm.c file.

Sure will do that.

> 
>>
>> v2
>> - use drm_gpuvm_sm_map_ops_create with flags instead of defining new
>>    ops_create (Danilo)
> 
> If this turns out not to be what I thought semantically and we still agree it's
> the correct approach, I think I have to take this back and it should indeed be
> an entirely separate code path. But let's wait for your answers above.
> 
> Again, I really think this needs some proper documentation like in the
> "DOC: Split and Merge" documentation section.

Sure


