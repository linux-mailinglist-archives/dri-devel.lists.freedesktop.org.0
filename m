Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 902B7A97387
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 19:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E60310E32E;
	Tue, 22 Apr 2025 17:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BHxDrIIC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C2110E2DF;
 Tue, 22 Apr 2025 17:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745342543; x=1776878543;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w0/F6KFjay1KwxJj5Cl01GJH6AWjGUMSlORl+Q8l7vg=;
 b=BHxDrIICfjnSlvZQGCgPFjPm6LTIMo0S9wuFasL0lKjdXWh0qetXurMn
 GBnvvAaSebR/c2zlKjDZAfVI3fYGLl1m4uun8Ecv1WbUDCx+cPXuDG5dU
 B16rX4ThV9i2eZzYej03KVL7VhJWg6gYyvDqS+fR2QGHcNFShNDnJm8xz
 WaQypuEf0ejFm5eaP1tvotA3EW2kIb2YOlF0JJiA/7cyyl1F40UMCsIzE
 j0MvWsKZaugdjYnuY6czueuYqoz8ILgb/A0/tJayCwCACL12qToZU85Sb
 rMulcy5qfl+K7ewJrhGQpE3hxg4XiROMGITQZaG3dYiYoWCK3hRpkLwBE w==;
X-CSE-ConnectionGUID: BfmbW4rmSE2XvDYdCHF4YA==
X-CSE-MsgGUID: jpUTMST3Q9On76I+L4+keQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="64442599"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="64442599"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 10:22:23 -0700
X-CSE-ConnectionGUID: ZAW4ocDfRoKC6H6cirwiiA==
X-CSE-MsgGUID: jCjYHtgaTxyO2AYl34IQUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="136862655"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 10:22:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 10:22:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 10:22:21 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 10:22:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wHVvhxTvc0RekbHhwGMbxPsF+WhUMLRe2k+V5UqMY/49owu1YyEWJw4VxVvBa8lBtY9+u+z5R2TXNJd26+5IgIUzsxIdqHK6lmhPpuVxQNW/pWL4tWodnMhqxt4VV96ixdfxvFUaXWzOphfglESwS8HsygGldWfP1Z2m/kUKEYjhFv3HPm5+jnrrPf1xo2u2SU9+TOvrK+fuzS70ZUSq/k7Hy0z8dHyKdCAQn860uzyUfhIDO6SZgmC4ZfQgIdkWJkO+4t1LnPfLqbGNHdQrOb2A7zA/LoOQEd+d3+I0KjEggrNl8vqEQYcFItSv0vyhbZPFCH93+pb+TT0dz0MDNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pI2FNbak+HDMHvDUMf4HhjLHwY1AxBpMCPU2lvZSq38=;
 b=cQiP5ad9r8cJRgwMe+fMIv3j5QM47Rsnutu0N9UJeK4nMgYeX3eskPFM+XepKUVP44ttIypnamoLQqTifEi+Iv1+IgQtS9m5YlMq2cRPMK2zzrn/jIC+8VyxNMi4x/xUoxBfxFu3YFGbu3QhZ+ZYxcoiGJoD/d7cN88nM4HqmQ5cp3qxI/dGgl1zFID+/+nXs/wGqzeaS54IRZEOnGkcEoynPEzCY+mdrwlVRC7lIASusY1Op3vkrr2pbEPdW9Ap1T9fvWJg4rvbXUMFY2JWZb1PjrINtzsp9Z5QADFYzhWYKTVGRYAONYalHFwYtTiUVcgimb5OTP3Dpder8mCKJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ0PR11MB8271.namprd11.prod.outlook.com (2603:10b6:a03:47a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 17:22:01 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 17:22:01 +0000
Message-ID: <5eab3a5e-361e-4192-9858-70f2fd56a055@intel.com>
Date: Tue, 22 Apr 2025 22:51:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] drm/xe: Strict migration policy for atomic SVM
 faults
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250422170415.584662-1-matthew.brost@intel.com>
 <20250422170415.584662-3-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250422170415.584662-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::15) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ0PR11MB8271:EE_
X-MS-Office365-Filtering-Correlation-Id: 2718c62d-8bcf-4be8-bb3e-08dd81c231ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWxLN2ZTeUJ1cWYrZ1dwaUJEd2xWTlk3OENVYXVkQ0pZR1RjaUxPODhmV0k2?=
 =?utf-8?B?dWdoYktLRkl3LzF4Q2VUdE9aRXYrNHQybUh5NTdlM290cGJ6VUJPWGVLbkxx?=
 =?utf-8?B?d3R6ZmdPc0ZibWNWZCsyWGQrVDVpUUM0a2k3Tjcxam5GZU81aGE0c2tCNWxD?=
 =?utf-8?B?b0tHRFE5My9yZkw4eklkYnp3V3IzM1pUZWxBY3dyUEhhTy9YQ1krY2wzdStp?=
 =?utf-8?B?WDRhWGVDcUU0RjBrb2xHZmg0SHhsSFI2eXFrQmgzWHBoamdTckVaQldVb1pE?=
 =?utf-8?B?V1FpcDd4QTlRcURFdW9qdGpUdkREdThtdnU5Vng3TGpCNUUxb21GNjljV0M2?=
 =?utf-8?B?TEw4YklJSys1WW9JM3dDaG10SmhTd0xoUFpjMDRXZlVzVVMwNk81UlNCRnp4?=
 =?utf-8?B?WU1zcmUrdFExSHNxU0dvN25aT0tvaWtMeDZSbmoza2ptVFY5ZUpQUDF2TFM5?=
 =?utf-8?B?NCszU1dDd0M1ekkxb0R2ZGNaanYwS1VQTkVpQmhTSXgxYmdOMkVRd3VIOXZH?=
 =?utf-8?B?ZkcveThLTDVVTm5zdGF4d2g5TksxdHp6VGxIWUJ4QXQ4MjFtUURTcXZQWlB0?=
 =?utf-8?B?Q3BTMnZuQkk0d2o1VkJUTFRncFhLd1habG1kV1NOOGlqTkVuY0szL2svK3Iw?=
 =?utf-8?B?VFc5Q2w1dENaWnRqTUIyVUxTRTU4UHlDanBzTkVDcUNUTXl5dWFaVGg3WVFC?=
 =?utf-8?B?YjUyRG1WTjlnVWkrZndzN01ibjFDUDdjb0xMYUdHbjhZMks1cmt6aUZGTCtI?=
 =?utf-8?B?YVRBcmt3eGViMDNIUlMrRkp2SVBaL0VUcGFMR2U0OWJtR2h1NG5xWjJhREhN?=
 =?utf-8?B?MVAwek5IY2pXSENHaGlJbU1oVXdTRUlXQ3hhSkxzdE9JbHZUVEYvZ3lQcy9D?=
 =?utf-8?B?OEVWUjZaT09OL3FROUQwbFZ0NEhZelJJZHZkWWlKYzRlYkxlNzE3VjNiVDBC?=
 =?utf-8?B?NXpjVS9oWWlBbEZoOThqeDRib2xWamgxdWUzeE9oSUNDL1hzTmVneThtcmoy?=
 =?utf-8?B?eUZtRmI2aDNSVks0MmkyUkRoT2RWcVIyaDkxZWpVeE9oR2tkZCtveUhGc0xL?=
 =?utf-8?B?N20walFWOWtoN0lGcVU0MG96V0JobVpvdGNHN2tZeWpmYis0MTFudDkySHdW?=
 =?utf-8?B?RndTYTdJbGJXaHhyd1Q5UXE5b2ZaMUFsNmhLcmluSUVzeHlsbzE3YlBBcXdK?=
 =?utf-8?B?R1NFQjlDY2FxZ01wdmt2SCs1ZkFScHVkZk11VXlQclZXc1hyeFlsc2w0cDRX?=
 =?utf-8?B?L2V2Y2dXM3JTRWMxWlZhN1B3cXJMaVJ3V1RNNTJ0Y0hYNlRveHRld0RNSjZP?=
 =?utf-8?B?RklrV0hNMXQya0ZRelJyOG8vOVBKWUZwTDcyTFpidVEzWi9jN01LRldQcGpT?=
 =?utf-8?B?RXBaSHY0LzYrb3lmWVlwaUtqbVFkL0lNSmlOckdNRC8rbjc2RDV4by9nc1N1?=
 =?utf-8?B?aDhiRVhYUHJ3YzVxZ24raGVqRE1RNG9iWTQvSjU4MitMQVdYME5DN3M1VGNQ?=
 =?utf-8?B?RDdZS3lXeTF2RnlqVnppb3ZqTFJNeUZHSVVta3Z0VnZwUDFmL0lRS3BNVnlv?=
 =?utf-8?B?YnpNdllobFJMTi91K0VWNEtFOVNXU0VrM0lxelpXUXJVV3Qxd3NyVWQwZnU4?=
 =?utf-8?B?WlhFWXRHZ3FMNDYzbkphTndOUTJKZXlZV2xEWFlqV1JNRHdJVjY3aXNOYVV0?=
 =?utf-8?B?OFZFR0Exc2kyQzE0bmhxN3N3dWYrbW5NQUNONlhldUJ1OUpadTlZUkEyb1Q0?=
 =?utf-8?B?SmJaOVlSdWppc2xwSGhLdnNiYVpmeDZLU1V5dWU4Q244VzBqSXlmS2t3eHVx?=
 =?utf-8?B?Z09tcWJXM0VxbHBvYmYzT1paYlBtdWhoMkJmOThPNDJlT2xCeVZ1UjYyTGgw?=
 =?utf-8?B?Z211VnZzanlnd3MwT0VKSnpUa3ZKcGdDb2JacHpWMXQwWURKbnUwRmtQS0ta?=
 =?utf-8?Q?6xKY3JKA0Js=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEQyeDlMb2FrclRwTkhpRWVDaXNsVHNYVGhxY0xuWm1mYVhKeWhCK0FEOEUr?=
 =?utf-8?B?clVpZk5kNWF6STVicCtieHVRTkhHRkRRQ0JKcUtGQlJkMG1yTTdXVjFJVCtP?=
 =?utf-8?B?NGtDdThQaUgvakh3R2sxZGZFWGFXMjBOUW9VUXRmeWpaMGlvamtzSjlqTlNz?=
 =?utf-8?B?d1RxL2RiZ1J5T250SEljYzYrS3VOSjFoTWhMWFlMaXRTUlowUC8zeCtIbytI?=
 =?utf-8?B?TG5ldy9pNzQvUklMZk1TT2xCRm9IbkZ6eXVRMWxPVFlMbFNiQ0lMRGRhRXly?=
 =?utf-8?B?ZmFQQit2MFc3V010dEk2cWdRWFpvSkRiMkVSUGdyTzcrSDNnS0RIRVU5dUwx?=
 =?utf-8?B?NzQzbE1pcWtrS3pPZlRsQW1zd3QydWFZWUxUQW5ITk5aTFhFemJCVUd1Mm5B?=
 =?utf-8?B?cnpTZDJnNWNvb09JN082OUk1b1BjaTMySStmQVRDM1F6RGI4MjZmM0Z3V251?=
 =?utf-8?B?NVBGdE81YlVPNVkwUm8xcnBLNDlLM3J0eTVLTWVOUlFTNkJud0xVTWR6SkUz?=
 =?utf-8?B?cW1OWVlzUmYxekJOak9nYys2dlFQdVdQTTZZaVVkSVpWbVRuR2VReTdVT1pu?=
 =?utf-8?B?RTF0TzlWcXhaUC9BelVsWTdZWHgxZS9vTHR4SDhHVmFwUGh2MjNzRVcxTHhk?=
 =?utf-8?B?TVZTaXdoSFZuNVZXMnlVQWwwOUlLMVdHaUxFNmQ1VGp4MzZkNWc0UnV2Wi9j?=
 =?utf-8?B?a2ZEa0ZXRTFEb1QwNzFLY3BSSUQ5T3hBRzIwMjVQNUZFT3V6ZEU3b0tSQWVj?=
 =?utf-8?B?SUJqREdNWVpwTE90YVdOVkJwVWxZTmxhcDhSU0huTDZXd1A3V2IxZWVIbFNv?=
 =?utf-8?B?Y3pCZ0FGL3pXUE15YmdpbTZ5cUpIcnpWa2IyTlk4RVNmV3d1RWNMTW1BTkpM?=
 =?utf-8?B?V1NjV1FoaEF0MG9CdVdTOFZTR0ZwNjh4a3o1b283eWZlUUI1aDhzZHFCSTN5?=
 =?utf-8?B?UEN0UG1XMUZCV0hBVytwV28vemNTWGE2VkNyZTJ1YlB1VzdBOEZ3UG5xQnFJ?=
 =?utf-8?B?OFZIRGc3dXp6b0thSitzMEJNaVpqVUZKSlJZclZEa3hXNkFJWklXVXpSSUlY?=
 =?utf-8?B?T0QrdXUxc0xEVTZtY0ZZcStYaGJScmd5THI2Y0h0WTNTNnVNZXlFb3JCQWt1?=
 =?utf-8?B?eE9ud1ZEeFhnaXd4OHhOREdZWU1sMXlkWEh3cHNZSWhwRzFlRUxES2ZTM0Qv?=
 =?utf-8?B?R0h5KzhjZ2lzdCtuQzhZZ0d0R0dVc3hXeXhONytQc3c3bjVtUG9OY0pHU3Fz?=
 =?utf-8?B?NURHam1SV25nRXhGTCtwZzYvUHBUdXdiS3FYMFRlV25lTnF2eXJhcW9BQk9L?=
 =?utf-8?B?SUZ0dlBIcHZhNnZLTDZ3VUIwcG9TckhqZ1BKbnJHUWFMWkFvSDJmU2szTWo1?=
 =?utf-8?B?OXN6VnR2NUdFSHZHNTJrZXJlcjQ3UmVxSUt1T3pJMkE0TzY4N2dMa2ZDaDZl?=
 =?utf-8?B?WEVSTEoxaDNwNmxaOTFKYUI2c2MrN3FKRmY3ajJjRzBkQkkzQko1L1Fnd3Bw?=
 =?utf-8?B?TUR5RnZMYXVCNElXcVdVNnRSbno0NU1GVHBSNXdnWUJmM3pFMWE1enJqSVpp?=
 =?utf-8?B?NjJBZjlaUjJWZy9jcEZLQ3ZWWXg5UHF3by9HRlIxYWFkdmk3NkhQNXJaamxN?=
 =?utf-8?B?ZW5LeG1lRXA4QWhWOGIwSHFGSDZ6dWNhMzJLdlZMejBWZmZGc0VEK01naDJy?=
 =?utf-8?B?QzNyaTMyYlZHVGxiRUtTOW01Ukw1OTB5MU1hRlNSTlQzcFVnNDJVbGpacGxO?=
 =?utf-8?B?aUpWTEV4aWlqVXdzZlp6RGp4K0UvREdqbk1kcFdRMjJybTc4R1ZTbm9peFU0?=
 =?utf-8?B?dlZQMWVIbWxtZThwY05KV21Na0RacEQwWG84N1VOQnkvT1k1Qk9Ja3hMaHZ4?=
 =?utf-8?B?WW53YWtwSDZHWEFhQVNJRmR1QVJyQnRDWHFIam9VeUhRQkRJQWJ4c0FCZGdt?=
 =?utf-8?B?ODdmc0F2YWR6M2RjSll0QXpZSUpUUStLei9zYWhPb3lJZmZZYWZhT09rSktz?=
 =?utf-8?B?OTVpRmFqbFA5c2RTb292VzJibDJUeDAwckpwWEJwZURpWjlWTVZRSkZYUGls?=
 =?utf-8?B?OUVydjNBVVFsak55WFBaVnBhMStLNkVGa1hEMVUwS2J3Nm9KRmlESWVtZUFN?=
 =?utf-8?B?SklzdXZLaGJDNVdUOXp2SVJvZkJBd0NTbVdmOHg2YW4wSzNZQ3ZVZ3hUTFJ2?=
 =?utf-8?Q?zGqwMEkeZkY/ScglQdMaa9U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2718c62d-8bcf-4be8-bb3e-08dd81c231ae
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 17:22:01.5192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aNH2zaI2P1RclyevslDGaJXkxVv1ok5mBuv5GDk1hywq3HgR8ujyxBjOMbjsIVR9WlFTFIb/lycBIt4KMlmDP38gXxaLdROrLx60Em5FiW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8271
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



On 22-04-2025 22:34, Matthew Brost wrote:
> Mixing GPU and CPU atomics does not work unless a strict migration
> policy of GPU atomics must be device memory. Enforce a policy of must be
> in VRAM with a retry loop of 2 attempts, if retry loop fails abort
> fault.

retry loop of 3 attempts not 2. with that addressed, Patch looks good to 
me. Since both of us collaborated on this , it has my ack and need 
someone else also to review it.

Acked-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> 
> v2:
>   - Only retry migration on atomics
>   - Drop alway migrate modparam
> v3:
>   - Only set vram_only on DGFX (Himal)
>   - Bail on get_pages failure if vram_only and retry count exceeded (Himal)
>   - s/vram_only/devmem_only
>   - Update xe_svm_range_is_valid to accept devmem_only argument
> v4:
>   - Fix logic bug get_pages failure
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_module.c |  3 --
>   drivers/gpu/drm/xe/xe_module.h |  1 -
>   drivers/gpu/drm/xe/xe_svm.c    | 89 +++++++++++++++++++++++++---------
>   drivers/gpu/drm/xe/xe_svm.h    |  5 --
>   4 files changed, 65 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 05c7d0ae6d83..1c4dfafbcd0b 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -33,9 +33,6 @@ struct xe_modparam xe_modparam = {
>   module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600);
>   MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in MiB), must be power of 2");
>   
> -module_param_named(always_migrate_to_vram, xe_modparam.always_migrate_to_vram, bool, 0444);
> -MODULE_PARM_DESC(always_migrate_to_vram, "Always migrate to VRAM on GPU fault");
> -
>   module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
>   MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
>   
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 84339e509c80..5a3bfea8b7b4 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -12,7 +12,6 @@
>   struct xe_modparam {
>   	bool force_execlist;
>   	bool probe_display;
> -	bool always_migrate_to_vram;
>   	u32 force_vram_bar_size;
>   	int guc_log_level;
>   	char *guc_firmware_path;
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 890f6b2f40e9..f749ae367a8f 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -650,9 +650,11 @@ void xe_svm_fini(struct xe_vm *vm)
>   }
>   
>   static bool xe_svm_range_is_valid(struct xe_svm_range *range,
> -				  struct xe_tile *tile)
> +				  struct xe_tile *tile,
> +				  bool devmem_only)
>   {
> -	return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
> +	return ((range->tile_present & ~range->tile_invalidated) & BIT(tile->id))
> +		&& (!devmem_only || range->base.flags.migrate_devmem);
>   }
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> @@ -726,6 +728,35 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>   }
>   #endif
>   
> +static bool supports_4K_migration(struct xe_device *xe)
> +{
> +	if (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
> +		return false;
> +
> +	return true;
> +}
> +
> +static bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range,
> +					       struct xe_vma *vma)
> +{
> +	struct xe_vm *vm = range_to_vm(&range->base);
> +	u64 range_size = xe_svm_range_size(range);
> +
> +	if (!range->base.flags.migrate_devmem)
> +		return false;
> +
> +	if (xe_svm_range_in_vram(range)) {
> +		drm_dbg(&vm->xe->drm, "Range is already in VRAM\n");
> +		return false;
> +	}
> +
> +	if (range_size <= SZ_64K && !supports_4K_migration(vm->xe)) {
> +		drm_dbg(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
>   
>   /**
>    * xe_svm_handle_pagefault() - SVM handle page fault
> @@ -750,12 +781,15 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
>   		.check_pages_threshold = IS_DGFX(vm->xe) &&
>   			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
> +		.devmem_only = atomic && IS_DGFX(vm->xe) &&
> +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
>   	};
>   	struct xe_svm_range *range;
>   	struct drm_gpusvm_range *r;
>   	struct drm_exec exec;
>   	struct dma_fence *fence;
>   	struct xe_tile *tile = gt_to_tile(gt);
> +	int migrate_try_count = ctx.devmem_only ? 3 : 1;
>   	ktime_t end = 0;
>   	int err;
>   
> @@ -777,23 +811,26 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   		return PTR_ERR(r);
>   
>   	range = to_xe_range(r);
> -	if (xe_svm_range_is_valid(range, tile))
> +	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only))
>   		return 0;
>   
>   	range_debug(range, "PAGE FAULT");
>   
> -	/* XXX: Add migration policy, for now migrate range once */
> -	if (!range->skip_migrate && range->base.flags.migrate_devmem &&
> -	    xe_svm_range_size(range) >= SZ_64K) {
> -		range->skip_migrate = true;
> -
> +	if (--migrate_try_count >= 0 &&
> +	    xe_svm_range_needs_migrate_to_vram(range, vma)) {
>   		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
>   		if (err) {
> -			drm_dbg(&vm->xe->drm,
> -				"VRAM allocation failed, falling back to "
> -				"retrying fault, asid=%u, errno=%pe\n",
> -				vm->usm.asid, ERR_PTR(err));
> -			goto retry;
> +			if (migrate_try_count || !ctx.devmem_only) {
> +				drm_dbg(&vm->xe->drm,
> +					"VRAM allocation failed, falling back to retrying fault, asid=%u, errno=%pe\n",
> +					vm->usm.asid, ERR_PTR(err));
> +				goto retry;
> +			} else {
> +				drm_err(&vm->xe->drm,
> +					"VRAM allocation failed, retry count exceeded, asid=%u, errno=%pe\n",
> +					vm->usm.asid, ERR_PTR(err));
> +				return err;
> +			}
>   		}
>   	}
>   
> @@ -801,15 +838,22 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
>   	/* Corner where CPU mappings have changed */
>   	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
> -		if (err == -EOPNOTSUPP) {
> -			range_debug(range, "PAGE FAULT - EVICT PAGES");
> -			drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
> +		if (migrate_try_count > 0 || !ctx.devmem_only) {
> +			if (err == -EOPNOTSUPP) {
> +				range_debug(range, "PAGE FAULT - EVICT PAGES");
> +				drm_gpusvm_range_evict(&vm->svm.gpusvm,
> +						       &range->base);
> +			}
> +			drm_dbg(&vm->xe->drm,
> +				"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
> +				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> +			range_debug(range, "PAGE FAULT - RETRY PAGES");
> +			goto retry;
> +		} else {
> +			drm_err(&vm->xe->drm,
> +				"Get pages failed, retry count exceeded, asid=%u, gpusvm=%p, errno=%pe\n",
> +				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
>   		}
> -		drm_dbg(&vm->xe->drm,
> -			"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
> -			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> -		range_debug(range, "PAGE FAULT - RETRY PAGES");
> -		goto retry;
>   	}
>   	if (err) {
>   		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
> @@ -843,9 +887,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   	}
>   	drm_exec_fini(&exec);
>   
> -	if (xe_modparam.always_migrate_to_vram)
> -		range->skip_migrate = false;
> -
>   	dma_fence_wait(fence, false);
>   	dma_fence_put(fence);
>   
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 3d441eb1f7ea..0e1f376a7471 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -39,11 +39,6 @@ struct xe_svm_range {
>   	 * range. Protected by GPU SVM notifier lock.
>   	 */
>   	u8 tile_invalidated;
> -	/**
> -	 * @skip_migrate: Skip migration to VRAM, protected by GPU fault handler
> -	 * locking.
> -	 */
> -	u8 skip_migrate	:1;
>   };
>   
>   /**

