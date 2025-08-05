Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E60A4B1B265
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 13:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D1E10E653;
	Tue,  5 Aug 2025 11:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QC2WK8R2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAC310E653;
 Tue,  5 Aug 2025 11:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754391803; x=1785927803;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uBFPkhJIKpARk9sVX/n5A0zdn+aF61PeXo/m7KU9U34=;
 b=QC2WK8R2dscaFD2CPLPAG3sfM/6G3PIViJXSLurY2Ii0SAg3aIEojKXa
 hwfjHpzjEM47LN+ms4/3Y76oakmh0CI9ZaxwU/IR8aDvPWrJnr/2F0PKR
 uvEaxCG8cjRCNbsWk2iZfidYGLDctj0HR9M0dUhoi9bC6m6T9E7bxUB8/
 OKM3RfZRzfOGfKmWpnJzNc/jVBR8ZoUIY5HkjFk4RGHVsr72gBbfZCkvU
 8a0B+OC6XGK2FgPPNRDp4NyFdLnsg3MMq2IUcSjF4JhbnwKtC96c7KWWJ
 EWfBRmGLlU3CV0AYbtbkuJ2J9toz9P2dOtSO/uQK6b72jahJKUQJeGyJE w==;
X-CSE-ConnectionGUID: dhq2U9EwSymqemf/sLfNMQ==
X-CSE-MsgGUID: SdAu4cBwT0i8Pt/rAGAf6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="60513866"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="60513866"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 04:03:23 -0700
X-CSE-ConnectionGUID: PCG6A1AgTNmsolq9O6Kk+A==
X-CSE-MsgGUID: XBe5CPRYQr2zx8vbWV2fyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="168645601"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 04:03:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 04:03:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 04:03:22 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 04:03:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqxKwiYw3LiJU8Kke1MDNI5E7kWkuX6UVHykKWW9skyP+z69dUG2FLXG559N9cXihI7yUqYK0chCvjXmmsC7kUvcHf5JrH7LgV/Y1eJpi0yO60Al9YjzenfYt3RJo4CyC7tM9L2rxhz3Km1wA2mlwjri87RrKdTuclTXCRf7TmL7p74kXSLnyuLKgP0JQuLtTHK4F6swnqaCJ3F40qHWYxfLH+3x0pLKUDfx6zA+3nGovMYRDQtZtoNX/nL7ddR8iY/x7arb+Mkla2H8aR63BCFc7N+i7f9SUmdK+TVgOmp+WEBUBNNmP/qaTNbXbxq7g3Tel6G16Fjb0dhjJ+PYPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvNWYCCNpgyvrQSCVEHaIzhPRxeO4DkyrhmfzMZbSz4=;
 b=iIDgfJh6uv1KxPfgEns92TfBSlejWa5WIPINGioCkMMTGUQYdJ/nyUy0aYsOgHsIj29qVxkdVaFzW4GqXd+kL8cuK9lritvE/FdSNrRrgklZPzdbZPvZmRL+y5KQlaIlns7Rtvf5EaASGvGKl5m/0vChMzKDymOx+iLUTEvD23EfVg2p3yKhzjp/RzVOXnmoUGcsovm8V5K75o99F+ONyGYVbvy9JlcaKgt3XO8sEHoeX5WN34Eg06lhyec8qkrrCrX9Y+/8WoFVnI98+Gz+BrXXrwx/fHT5bUOuPVztSblTdf6uu7IEhQ9M5LI2MCBbdGJVn5rBXcniDkiY63g80g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CH3PR11MB8344.namprd11.prod.outlook.com
 (2603:10b6:610:17f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Tue, 5 Aug
 2025 11:03:06 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e%7]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 11:03:06 +0000
Message-ID: <bad6813b-bcc0-4e8f-857c-ced6a515925b@intel.com>
Date: Tue, 5 Aug 2025 16:32:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/25] drm/gpuvm: Pass map arguments through a struct
To: Danilo Krummrich <dakr@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Boris Brezillon" <boris.brezillon@collabora.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Caterina Shablia <caterina.shablia@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, <dri-devel@lists.freedesktop.org>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
 <20250730130050.1001648-2-himal.prasad.ghimiray@intel.com>
 <5c67e4eb-9e27-44fa-b027-cd08c10d986a@kernel.org>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <5c67e4eb-9e27-44fa-b027-cd08c10d986a@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::17) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CH3PR11MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: 31d2b817-cb3b-4dc9-7cf0-08ddd40fa787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGZrU3VuZkZzMlBRZFNDbHVXNnIyQklES0pxbWRXWDZVYmkyTjJyODEwU2Zi?=
 =?utf-8?B?bzZJdTN0cnlLMmZuVTAyYkhQVzhPcFJDL21lZm1TSGNMMUcvQTVwMDdCdXVG?=
 =?utf-8?B?ZDQzRzNmSERWUXpLWXJSK3IxMUk4UWtUUUN0QWE5ODRVUXdGRVZ6RjgvRHR1?=
 =?utf-8?B?QklucjdEcTAwc0dEcFJaUXB0TjFTZWJLVll1U1B0TnVlMjhKRlBWNm96MG5O?=
 =?utf-8?B?cnR3Q0g3NVdRdWVwL3gxTWZ6MXdrenV4bk9KSHoyUlhJMWllemFJdDA5ak5Y?=
 =?utf-8?B?cEhDTVpNR1BGblVFVXJMRDBDZ1hSbkJTSE9VQXU3TjdDTi9kUmd0MzJmZ21l?=
 =?utf-8?B?K0ZScFlDZGhDTHZYWFcwbmpORDJqSkp5cU5tTFhZNm5rdTZkUFVNaDNkTW5F?=
 =?utf-8?B?MUh4ZllOZy9HY0gxdTBKK2cvdFdsUHNaRG5UMkdaYkFqSzRoRzhIcDVwVk1X?=
 =?utf-8?B?ZVZLVEtPYm1lZVN3SFZZQWJDWlFueEpvcVQ3S1hvb2xsRDlxTnVJcWdDMDNC?=
 =?utf-8?B?ajRwZHpVTGRBNnpCS0QvbjR4TnYvRCtnN3lwNUZGMko5OEs2MFVXUTFCeklR?=
 =?utf-8?B?ajE2b1BCYzN0SGpqSk5vUGZKWHFzUmFRdWlGMEZUTzNBdmdWa3JvWEFvSEN6?=
 =?utf-8?B?ZVo4Ymk0Z1ZxTDZjRHZ4NnpYVUlOc29uWWlHNTNZYzArMW9QTDlxR1cyK0FQ?=
 =?utf-8?B?ZEpaeFNHbk10SkZtVEdKTXdBZmwwRW9jUWdCSDRhRnpCTVBsWGpkTEIzbWRF?=
 =?utf-8?B?YnRaWC9FSmFvTW1sSm9jRXU0YkpBcmFya0pidDNPaTZJcHB2alhtVXdJQnFR?=
 =?utf-8?B?WjloenZVZmxFRU5KcWNmc3hSVTRrTERDOUw2ZUJVbDZJcHBZVi9ycDdoUlE2?=
 =?utf-8?B?ZHNsMFFRdGdRbDlnM3dQZEJiWmJtNDBWOXpQWjJXNnN5VlU0UGtsUGw3WW5W?=
 =?utf-8?B?UWVVNDZTV1JMbDFTd1VPZ2VWMTVoRW9LRTNKc2dsUXUrZ1FyQlN3ODZTdDAx?=
 =?utf-8?B?UUIrK1ljRlYxN2RtR25rUzN2cndEVk9kVFRma09VcmNBSmIzaEY5TkJKM3dQ?=
 =?utf-8?B?Zk1WVmdJdHExbllZNk9rSTJHWFVKTHBaR1BrK0k5NEVqbnBYeUtOUWRRTkpi?=
 =?utf-8?B?SHk4bUcveG5xOUJIai91SGxGbFZ6a3dwc2cveTJmNkQ1VUxEeUJGNisrWHl1?=
 =?utf-8?B?UFVUVDRQSCtBZ0o3aFhPTzU2WUZNdzR4bFZpY3RsMklvN2FiWThPVCs3OEI3?=
 =?utf-8?B?cURuVXNjOXZaMXBuc00wQ1BVdjZTTWtxRjZYUGJEQTZ5TGZQZXkrM2I2b3F0?=
 =?utf-8?B?WlpRRE5vOVphZm1wbzQ2QnRNY2xGNkUraXB1ZVpib2hTcHZIaW1Cc090Q0VS?=
 =?utf-8?B?VEZSQnpaUmhBU1cxNFFHSkcwUjFNR3V2dk5NOWY4YkE0TytMc3lGQUF3bUVE?=
 =?utf-8?B?aUttYkJ1d2R5NUFodm1MYzNoM3R5UllZb21UcEYvUlQxRDRRTEp2VW4xL3la?=
 =?utf-8?B?TGNVZ2g3WlYwcWNjOE1OMllBRjNPSkdVcnAyVUFHNFBhTjBpaUFma1VqanI1?=
 =?utf-8?B?MWpuc0FoSWxoT3hsYm1LcmFSbG8yNVFWVVJrWTFGYlpvcHNJTWtVT1JyeEU3?=
 =?utf-8?B?QXZFQkZBQ1dVV2tEc0R3Zk96bDI2SXhlOW8wVGtCbGhBcTNJMFVVWVpLWFpB?=
 =?utf-8?B?amRzTjRjTVR2SFZJNldFMHp1TisyVTh2NlZEclNTT0RzOGZ5R3Y1Zi95WTND?=
 =?utf-8?B?b1luaVN1TG81K1VrLy9RcDZ2QUdIZWpGcEM1Q1VUYS9uOFBEOFgwaE1MTU9R?=
 =?utf-8?B?dXY3Z016TUduRkVQTHdEZWtha3pNdExta0crRm1od1AxbHFpQjE2cTUwVGsw?=
 =?utf-8?B?T3ZweGxrRUtTMzlwUWFtbmxYNkI5VnNNUUdPRHVrTnFXclJZdm5NYldGbHM1?=
 =?utf-8?Q?YteXL5TOwrk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHhEUVZrYzhKN0VqMk9RVFc4Wkk1Ykd5SW9xeVZybVZGSkE0a2tuL0lYYmx3?=
 =?utf-8?B?eWdZWlVNcE0xa3ZUdUZaamx6TWhMUm1ya1ZTRTlGbVdnQmNSRTd1VFg4Y0pi?=
 =?utf-8?B?cS9mUDVzT1VaSzFFN3VYZ2txY2FRRFArYkdvQVlTdTlrYVkzb1FIWXVlUHFi?=
 =?utf-8?B?MVVyOWhGWG9OVmI3cExRdk96SnQwTEZVTkpVK1BvSU5SOXdjMGlWZFNBMGRj?=
 =?utf-8?B?MTlIMENIWm5TSjE1eHd6c09NUXd1Sm5kYTJ2UHV1VWpIMCs3dkxZeWR3ODZw?=
 =?utf-8?B?b2tabENyR0F0ZzU2QTdWQ2ZxOWVDTndtUkxjL0ZXYmp2Z2VtZnc2VWlHNTVG?=
 =?utf-8?B?TzZibW54Sld6bTVKd3JNcG9EdmlNL3dKTWl4UnBINk5DV3p6SVpXYmtCVkZi?=
 =?utf-8?B?SXRMLy92UDlNTnlVWXVaWVQwb0h1cDZYNnd1eThGQ3cvZ3lQZ295T1kzZ3Bz?=
 =?utf-8?B?VG9XT3ljeDZGVmU4aDhmbWUxSVh2YTJ2c2ljUEorS0h4TG5pR0Rta1NVTWRm?=
 =?utf-8?B?b2hNanJ1WE5SZVFaNVlpSWsvOStoSmRQUDNkSFc0Qm1Hd1pQQ2t1RWtTQ1hy?=
 =?utf-8?B?YnhXYVZFTU5TQ0RuelVhUlN5MVZyYTBjZHI0Q1pIa2gwSm9UWUV6RjlBcENE?=
 =?utf-8?B?aXZ0R3lzUjU1SGtXZXlOU0xRTVNVUFZHMlhwc1g2K04vK1pnR0RUMVI3bkI0?=
 =?utf-8?B?MTNrTXNac2FoMnZGVmJ2Q1EvLzE0RGZyRndWbHVEMGpoQTEwTnRzRDhiTGJ1?=
 =?utf-8?B?VDA5NS83T1NOdjAvRng3Y2ExTjNqTWJKSTRiSzlZdC9yL1grNE9zS3hLRWJQ?=
 =?utf-8?B?eHluWXQzcmkxYmU3ZkdoQXJjVEdqeGFLMnY4TFN2Uzl1TlA2UmUrYS8rOSs0?=
 =?utf-8?B?dXpLbGIzTXk1Y0xHeFAwNldNSUhkZURrRzJlTGpUWlhaaStqRGIrSkJmM09n?=
 =?utf-8?B?QlNXTGJXOFRUZUt3Vno4UmI5dUtXaEFtdFZ1ZTR3M2xrN3ZLbDRDbHVXVW5h?=
 =?utf-8?B?RlY4Qld1d2RSYWt1OFNsOXpadnVJYitwemRuU1BDRjliWjF5N1JLcldOYUJJ?=
 =?utf-8?B?ZFVWVGFaUEJvK1h5eFo2Y3c2NFlmTTg1Vndva0lDVElQaXFkTitYZWd6UTl6?=
 =?utf-8?B?RVJWUGE5Z0ZUSUYxYlh1c0RnQzczMWpORmlSa1Q1T1FGTGJ2N1VSQWdiVU1l?=
 =?utf-8?B?OVd6WElNbW05bjZnYmZoS1Z0Y0svenUyM29WK25SWUl1RVM3bTVQV29pU1BC?=
 =?utf-8?B?WmFTN255ME4wR0xuKy9vSXo1dUlhYWE4RUluOFhSdXFQRFlYbjRKT0lTVW5Y?=
 =?utf-8?B?V1ZDamVsT2p1MTZ6K1hxNlo4WDhUd0k4MCtVcEtzcVp4WURlTHNWT3dGbis1?=
 =?utf-8?B?b0RZeDUyNkdJdXFMSHEyRlNCQmlYY0d3cDB0L0xzSTFRQ2g4Z0JaWjNSWWgz?=
 =?utf-8?B?V2lrMnRGd1I0bnFQeHZ2Sytmb25KYXhFZHRuc21yUXdIc2Q5OGIrZzV3T0tv?=
 =?utf-8?B?c25VM3YyUFBHa2tjZkVrVjNsMnZyWTVySnNmNytpbDBDWitXM3pvRXMzU2p2?=
 =?utf-8?B?VnJWRTZUNEl2eFBocFl4Z3h4N3A2VWhja2cyTC9yVTlGV0o1WjVtUGZZVlNF?=
 =?utf-8?B?RHcybGZCN0dScDZNSmM1QkNFZDVQdkNsZVZhZVlldEYrYXNLNlROREdhMVNk?=
 =?utf-8?B?Ulo4THRVS2J0dWFFL0dYRWZ3cWV0cWJRT01nVlJGbnI1RUlEYTc0TVo3L3JN?=
 =?utf-8?B?V2pUdUh6OVUzQTJUUXNmc2NRMjl3dytXNGIzcHlJa1A4ejhBVktmYVkwU2NT?=
 =?utf-8?B?aC9GanhkcjVNNmhYL3drekFzWU41aHRud1J6TzFwdU90NUlQYjVpMVB4N1Bt?=
 =?utf-8?B?dWZ1VFUyNm9xeEZzckJBZUIwYkU4RFEvYkpySVRub3JBL3JPdzJNelZ4bVdB?=
 =?utf-8?B?SkVibkxUcDA3S2hMSW0vbWN4N3czMmRxQVd2ZGZnZWlhbDl0QTBzQXdoSi80?=
 =?utf-8?B?YmRvTzdyMklsU2h3N1ZpYlFDRXgweWtGRE5rZWEzL041TFFCSFQyU3pEekQr?=
 =?utf-8?B?QnVpNmYvUWt0LzAxWXJwYmtLZGJsUzExN2c0T21jZEZYZk1xREJna0U1MU1w?=
 =?utf-8?B?M3hzY0ZVWVVidFVPcUY0YkpnZmx5QW50aEFhSTBURnBSU0ltZFhKanI3b3RN?=
 =?utf-8?Q?Dg+4pvk43RdqtIc/74WFNCc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31d2b817-cb3b-4dc9-7cf0-08ddd40fa787
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 11:03:06.0773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LKXmHzNgSP1RQLWJF/WA0bPSMw4HPYfmwp3IO2HqmleHU4XEtVkCLdw+g5O6VBoNQm8zHKXSnVQBMtfqXa2MSs8Nq+IBpUNEPcLB+e7/sjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8344
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



On 05-08-2025 15:10, Danilo Krummrich wrote:
> This series is a bit of a mess on my end, can you please Cc me on all GPUVM
> patches with my kernel.org address? Currently, some patches go to my Red 
> Hat one, some to kernel.org and some to both.

Sure.

