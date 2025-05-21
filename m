Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC3DABEB0F
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 06:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD8A10E5F5;
	Wed, 21 May 2025 04:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N2W6wy9w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD28810E5B9;
 Wed, 21 May 2025 04:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747803212; x=1779339212;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Z1wKPzkO2pBNdUM5/Gr9GQD0/JEzbKLzeXlDQibK0qc=;
 b=N2W6wy9wlceAzCdkpYouHBwgsJjjgdUtPaC5+x2XL6n3ZxgFpGV4HKp8
 SU1xz1JmHHB2qEnQQoY9y52VtItYicKjCfXz3IpjmYrd97nZEiN/bYS4v
 97RffTyPM6KAsKO5Kc5oNCq21HLxyRkzfvE/+pFl61HJKPwVloGXlKe8s
 5bGKbmrViwiaCWCeqGPfsl6YtdpZ9PLjocq8ZoZh/05/douUzsGc4VmxU
 TjNPD8QqkKGt4z7PWqem67KI5HSIFddpKQn4D/emaNYzkWV37eY8ewDYL
 SquWVZzmvTRgLJO7w9/4dozSL90z2Th9i0PbeTs5Fvj9zTAhH3wKvn2y+ g==;
X-CSE-ConnectionGUID: 3H5rg7TNRm6rUaRGqhI0dw==
X-CSE-MsgGUID: tT+ryrujTYW3IRduDfKp9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="72282844"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="72282844"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 21:53:31 -0700
X-CSE-ConnectionGUID: VpHDIAeITmO1Fd+KvHnRmg==
X-CSE-MsgGUID: uL+7ZI7JQmu7lRnO6TJAIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="170783864"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 21:53:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 21:53:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 21:53:30 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 21:53:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Td+OAjDThJTBz+GI/GZg6sAa7vni9ZCTfDlJfd7ps6qeMApxHPpIZyJba9A2ljEo9kOGEY7keCBFhGqEEfUwUPJ27SuuYEbAy1fc96c+7Nu4Qesfq/16mnBe5srR/PKt4+gIdfts91e1vgK9CQHMXzBvrUu6LkQMpFKIKLp67IzAmUII63ho3RFppgkKCRz4IorQopCfjUFsJAgDjuiYhUI9T57J0Shak8IKulsoRjFRkSfLZkMXaMbee3w4aGeT/muAKYLh1BNlGZaMyrhej4o6YSOalB3Dtj683beQG2y3UEbNRxFzy2WgQ9i41tIuiM5hUnw7uQ78C+sBgiq7SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLMlIVCImtvYW9skKJVfopklp1LhH4zRcZJ1gQ3LzSo=;
 b=VUJsUQqadGIQamcC3aSAthECQrj9lb9cQ6bEFqOvkYdl4pesZ70Oq8uzplaLDCUCo1vyymI4huHzT2yMhcffcLFBxOXp20MUvEV0Z6ZGx8gFkMaVNZA93CD/XAJHhu568DNL1cSz2pnFHZiim48xaa4nRFDJ4Ciijq8qeh/16qajiBa4+B3WYJeBr/Bc0DiNXPekoYbZZy/hSu7QqMFIFPnlgTqNWgt5H8txCXtP0H/m2eiq8lw8kUyf/pEA4iUsrgq8jFlgEWOH1Viml9vlsLCg0OgHuOUZZ4jTp2Oz0P5kMfGmt+9XrvnfpFcmGDCoOkblcloGw01cBGWfwzRnOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SN7PR11MB7511.namprd11.prod.outlook.com (2603:10b6:806:347::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 04:52:47 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%3]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 04:52:47 +0000
Message-ID: <015019f0-1a5a-4b4d-b5da-9570892af4b9@intel.com>
Date: Wed, 21 May 2025 10:22:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] drm/i915/psr: Read all Panel Replay capability
 registers from DPCD
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <20250520165326.1631330-1-jouni.hogander@intel.com>
 <20250520165326.1631330-4-jouni.hogander@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250520165326.1631330-4-jouni.hogander@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::6) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SN7PR11MB7511:EE_
X-MS-Office365-Filtering-Correlation-Id: d8907916-3221-4cab-4c74-08dd982354f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlhwYnp0eTZMT0hSdU4vN3ZQV2JIOGJuZkp3OXFqOTlEaUg5dmQ5VU9FTk5X?=
 =?utf-8?B?K1BWM3JsVmdua2tQRXRIY2IzcDhucnYzdDhzZUtjWUZDODhKUjM2SUphc0l2?=
 =?utf-8?B?SzBHWUtOZ2J2ZUFCdTJ4MnRwbyttdmF4ek9DUk54aTYxV0RER0ZEcnBZdFp2?=
 =?utf-8?B?YU5ZdVkwWXFwTUF6RHhsYUxLc1d0QzVvc2YzWkdWSVFLQlBvTHpJUytIaVFl?=
 =?utf-8?B?WDY3RWtvNzJqaFl3Z3lYUDNzbEZ3NFlldXBYK0cyQ0U0K2s0emk3L1B6T2U0?=
 =?utf-8?B?bnZKOHNVWnNkWFFDZjFHczU3WUFnMlJjRWFFQWZXYkwwazZHeUhKbXdoZ2dF?=
 =?utf-8?B?QllYeXIzYVRKQWd2bldwODNyTHZCYVVQaFhKY0pZVjRMcGJybFJaVUtYV1VP?=
 =?utf-8?B?MmFNdDZBY3ZWdjJoa1hZQk9lZHlwVTFGb0picXZkZWRFdGExeTYranpVWUda?=
 =?utf-8?B?KzhueEgzYWVyOVB2YlZXRWlLdi9pQ0tCMHVESlN5eGhHd2d0cDRPc3NjRVdl?=
 =?utf-8?B?dDVkcnlQc2tBeVNOUmt0WlhFckxHMXNDUzVjMU5MN3k3c2xqcmIxM1pTOEY3?=
 =?utf-8?B?aXNQVUYzanBNZ09sSFNTRHM0VWxJK0cvNkZUNVlFM3J3R0NSYlc2OHkxcHJE?=
 =?utf-8?B?ZFFqcXhKQVVGVVhhemY5OGw3eU9VbkpJWTdpQ2YrYUlpNlh6Q0lrdnZScG1o?=
 =?utf-8?B?RVdJbEJsbG5SRjlKQ2J1R0JpUWVpNWpSaGo2aWtKdTlWWjFubGk5eTBWQWcr?=
 =?utf-8?B?UVc3V3Y5bXdaQVRtNXh2K2tOdkZyc1d3L0xFeTAxQlJlekdWUEo3Wm1wNlNh?=
 =?utf-8?B?aDNkR2tiS2tTbDlMWnBaTUVhSkVJb0daN1JKYjAvSlpCcFpybnJVL2E5Mkw5?=
 =?utf-8?B?c1NjT3A0VWtpdTNySzZMUXpuWUNTaldUY1JRRmUxZVpTQjYyZ0srWG5WeWVz?=
 =?utf-8?B?OFE5eC9JakdyRXoyWGxnTzVkcjhYcjZvMmhXQ2RFaVNKWE53YUFaTTBNMkg0?=
 =?utf-8?B?R0wrV3FNWlprQWNhSHg0OEE0OERGdnZNK3hNSkI5aW9CY0hDaXh4SFVmNXd2?=
 =?utf-8?B?dzBNclozWXJmY2FLTE8wZnNUQlRIODZDTS9zaXMycFRFV08wamJhWi9DQTNZ?=
 =?utf-8?B?b0ZjYUlBOWRiYXAwTjlVemhmbUM1QWc4RXQvdDZteERmeWh4SXlCWVZIU2VJ?=
 =?utf-8?B?MXNjYmI1bDZodUNnY01LQjU5c2NVMFREbFZVbXZwcFBoc3RjY0JiRktpZGQ2?=
 =?utf-8?B?cGdjblZIRTVqRUFpVzZNU2wrQlZNNUdWdVFMTGt5cjVHKzFKS2dVaTdTcitP?=
 =?utf-8?B?dlJOcGxPVk0xWDN6UVY3OVkzbmhxeFd1bnFXUlY1N2VrdDE3OTlIcG1YdVRa?=
 =?utf-8?B?QlI2MmJmQTJMd2NHNjVwVXp3TEpmSm1odENNNnYrSFdOYWhvZVVla2pVRmxS?=
 =?utf-8?B?dFZBbFVqenVqQThvdHN5d0hGeXlOSCtEM0N1ZTFjTlM1dFRyTzc0eE83TUpZ?=
 =?utf-8?B?ZUc3VHFvZENuL3RhRTJKQWZSYmtkanpHSUNack5FMytkVml4cUlBdTRxTkdN?=
 =?utf-8?B?UEdWZG1rbUdIdDkwTm9kTUdxOVl4YkFFY1ZoaGJ2K2g5N3dJamtLUkJxQUx4?=
 =?utf-8?B?S3g3bURCSzNuZjV1MlpVekszL2dtODBBcTU1WStSbVE2YlFyTHd4RC8zK1Jl?=
 =?utf-8?B?YmYvUGhiQUNWSlVINVdrSjYyV2FDNXRiVUg2aytycVJ6eE10aU9PUDg2c3N3?=
 =?utf-8?B?cXdRSHVOUHJMUVdrQ1Bxa2tWQTV4c25CeG9DQ2p3MXRVVjlVdm9jRjBVcnA5?=
 =?utf-8?B?ZTRLdm5tRmI5UDFoOUVKV2ZtY2VreW41cVBadlB5VmZ0cEFtYzh3WUk5a2Zs?=
 =?utf-8?B?SUhHbG41TEJCVmVnMkVvcXI1V1pFQkVnZVNmbjU5UFFwVGdjQVNBQ2Nla3dp?=
 =?utf-8?Q?dAfbVaSTQQ0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1FZVmhmWVptTGQ3WGZDbEVSOFN4NVdNU0tzRmd2WHNNeGl3cTZCT05vYjBK?=
 =?utf-8?B?WHBUY0VYSUpiN0lJckdCTnBTQWxBWmpHQWtUK1EyK1RwYWErNks4SkU1eXJr?=
 =?utf-8?B?MFhHWTdXYlpQcGNYRVh6ZDQ3Q2M5ZzJPWFo4QmVvN0xDdmlmSGZkRUIyM2Jz?=
 =?utf-8?B?alFRcU1rQ2FhcXlSekFXd1RyVDA3WEtpOVJZb0pkTWNmZE5rQXl0RjBydEp2?=
 =?utf-8?B?QlV3NzYwMzN5Q1k4dlRyZUIyTjdDYzdtZWtVR3B5MG5RVUU2YW8vTlNVY2JQ?=
 =?utf-8?B?cVcwWVJBanRtSjUvWGJzK3pIY256c3RIY2gwS2d6b3B4OVRDTjZONDN5N3pM?=
 =?utf-8?B?ZjVHOU1GOUZ2ZFlaaDRjKzB6eXFibFU5QzdJa2xiRnZON2FxcHhWUDVCYzdH?=
 =?utf-8?B?Mk9xNDRHT2h5RW1FamJHZUhJQTZiUnVqdmxqaHZkS1hCdmthU1h5SWlONFZS?=
 =?utf-8?B?dWt6aUJtdkFEODg4ZXdJYUsveHZoYm0ra25JMGw0UnQxaTNmODc4VVZGMWFD?=
 =?utf-8?B?N2xqYmFVUzI2dWpGcElBOHFsbXlrNXhzYVdLck5oVTh6TXhkR1dPTkd2ZUVl?=
 =?utf-8?B?dERUbzQ0QkZIQk9WQlp3bjB6V0xyNTY2NXladnVEZldtRTJ3Wk8rQktXMENj?=
 =?utf-8?B?U0RhWVRlZUJTT1F5bG1mdmhaQ29nTkR2bldLbUVKUUswdGpnTU95NnphUmx2?=
 =?utf-8?B?RjEvQVFyZlJydmUzdVlOeG94UmEwbTRmV0ZSQlVXWUFNYitnMGxPZ2dPQkNi?=
 =?utf-8?B?eDhWc1RyYkV0bUlQQlNCb0Z0MG55ODl4ZStkclFYWCs4ODluV3pYNTREZXoz?=
 =?utf-8?B?SnpsWUdiRWZTOFlmUFlROFYwSGZuZEdHQzZPdUxYcFJIY1V4YW5oU1hVZDQ1?=
 =?utf-8?B?T09TdmV6R1Rid1N1V3BsNld6TnZqQ1BPekh4YkFJWVJnbjR3SmtVa3FJRW13?=
 =?utf-8?B?VVBsN2xsenpsdUxtaWhsWFVlSWZHQ3ZoZlgyQS9QOFFiTHhJaFNHL3F6cjZP?=
 =?utf-8?B?YVdJdG1WenNNZnBLQyt3RU5ZYlIwSzhlMWVWVGRyZVduZmhDVmp6dy9NcjIz?=
 =?utf-8?B?UTZFVFQ2OUdYOHZSR2dadUhiWnZZbHRvcElNMDE3OHl4TkJhai9Kei9BUDZl?=
 =?utf-8?B?c2pWSURvci93UmJOS3ZKUktidjF0QlQ2b3VwdVNKNmI2T0UyRStEbXVWUkhC?=
 =?utf-8?B?TlI2blRnMU53TnI2am5vc0owaUFLYldxMXFKektYa2lRNjE1K3hqV2hiaFpN?=
 =?utf-8?B?a2VtcTVNYkxxWE51ZkczT3JjSDNrSDJoa25EL280Y21kY1YxS0pFenRGYlVY?=
 =?utf-8?B?WjI3M2t3TUxKSXBRSzk5eUxMaVdzTWxuOFBLSmVHdWVDQk1LcE5HdTVMU21T?=
 =?utf-8?B?cEEyTEhTbXI4Rm9vaDJWbmtoT2ptN3BIY2pLM0doemJQbnhTSHQraisxY2Nq?=
 =?utf-8?B?QjRHVUZKRmlDQm9hN0s2N05YRWEyb1hIRk5FRGdpVXQ1cWJTRUgvUzZlZFl3?=
 =?utf-8?B?MStQY1hoOEFZVW0zdXlpY2FHQVFxV1kzSW5ZdTRhRkxCQi9QZFBnVWRYeDQ4?=
 =?utf-8?B?M3VJa0lIWVBrcDZXUG1vUVRGc09zazlMeWlOK3ZDaGFCYUM1enQ0VTZocDRY?=
 =?utf-8?B?UTAyK0tyMkZUZ3VWQlI3UlFNV1F4Y1VrbnlDRFA1MkJjUjkvbUhHcGoxQnB6?=
 =?utf-8?B?RzdRK3ZIVGlCc3l2ZkxCVytja3IyMTRFMU56eml0SWpmU1ZrYjhXT2FPYVpH?=
 =?utf-8?B?ck8xOG53QzNWc3AxSi9hOXEzcW1aVG9qZGE3aWNLRTJyVit6UU96WXVybUha?=
 =?utf-8?B?ZWJKdXNZUEE5dzFiSVZaQk8wa2VsOGE0OWlGT2oyaCtDL2ZLUFBuSmJqQ3NN?=
 =?utf-8?B?d3U5VCt5MHZISmVRUEtoSkppRDVoRzNOemVaQmVNTGpvZnh0UWFwVk5USWZJ?=
 =?utf-8?B?Z1NXM0VxKzNlcG5NZnVFOEt3YlQrelBndGE1WkxZSVJMNG5TT2l6WkZpWHNY?=
 =?utf-8?B?WXFPbkRUS09nU2NTRTNsUldGUEhMb2dGQTkreURyRWR3Wk5WTG5kK2ZqSUVV?=
 =?utf-8?B?SFBVeVUvSE5wa2d6WFJYTVE2WThCbWtNWnhWVkt1cVRrT2JVKzNodG12NGt0?=
 =?utf-8?B?NG4wYk12dStleTlqTVRHZDBGc3B3T1UxSHJTcnpQYXdnNGZYOUVINjZ2R3ZL?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8907916-3221-4cab-4c74-08dd982354f9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 04:52:47.7357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VP3C/AyKudGG5OOD6FaTq7e1/TqbY9nPSJeyAhTxscKK3V1NWd6Xuv7LIEZvjREiEbv2v+XyHtUnDjJc8sE3yCMyYzehKRtVvh0cpFvYYDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7511
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


On 5/20/2025 10:23 PM, Jouni Högander wrote:
> There are several Panel Replay capability register in DPCD. Read them
> all for later use.
>
> v2:
>    - avoid using hardcoded indices
>    - read all Panel Replay capability registers
>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   .../drm/i915/display/intel_display_types.h    |  4 +++-
>   drivers/gpu/drm/i915/display/intel_psr.c      | 20 ++++++++++++-------
>   2 files changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index b8836d29a721..9334fcd77072 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1669,7 +1669,9 @@ struct intel_dp {
>   	bool use_max_params;
>   	u8 dpcd[DP_RECEIVER_CAP_SIZE];
>   	u8 psr_dpcd[EDP_PSR_RECEIVER_CAP_SIZE];
> -	u8 pr_dpcd;
> +	u8 pr_dpcd[DP_PANEL_REPLAY_CAP_SIZE];
> +#define INTEL_PR_DPCD_INDEX(pr_dpcd_register)	((pr_dpcd_register) - DP_PANEL_REPLAY_CAP_SUPPORT)
> +
>   	u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
>   	u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
>   	u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE];
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
> index 0cfdeff268f9..1072549649cd 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -608,7 +608,8 @@ static void _panel_replay_init_dpcd(struct intel_dp *intel_dp)
>   			return;
>   		}
>   
> -		if (!(intel_dp->pr_dpcd & DP_PANEL_REPLAY_EARLY_TRANSPORT_SUPPORT)) {
> +		if (!(intel_dp->pr_dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_SUPPORT)] &
> +		      DP_PANEL_REPLAY_EARLY_TRANSPORT_SUPPORT)) {
>   			drm_dbg_kms(display->drm,
>   				    "Panel doesn't support early transport, eDP Panel Replay not possible\n");
>   			return;
> @@ -617,7 +618,8 @@ static void _panel_replay_init_dpcd(struct intel_dp *intel_dp)
>   
>   	intel_dp->psr.sink_panel_replay_support = true;
>   
> -	if (intel_dp->pr_dpcd & DP_PANEL_REPLAY_SU_SUPPORT)
> +	if (intel_dp->pr_dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_SUPPORT)] &
> +	    DP_PANEL_REPLAY_SU_SUPPORT)
>   		intel_dp->psr.sink_panel_replay_su_support = true;
>   
>   	drm_dbg_kms(display->drm,
> @@ -676,10 +678,12 @@ void intel_psr_init_dpcd(struct intel_dp *intel_dp)
>   {
>   	drm_dp_dpcd_read(&intel_dp->aux, DP_PSR_SUPPORT, intel_dp->psr_dpcd,
>   			 sizeof(intel_dp->psr_dpcd));
> -	drm_dp_dpcd_readb(&intel_dp->aux, DP_PANEL_REPLAY_CAP_SUPPORT,
> -			  &intel_dp->pr_dpcd);
>   
> -	if (intel_dp->pr_dpcd & DP_PANEL_REPLAY_SUPPORT)
> +	drm_dp_dpcd_read(&intel_dp->aux, DP_PANEL_REPLAY_CAP_SUPPORT,
> +			 &intel_dp->pr_dpcd, sizeof(intel_dp->pr_dpcd));
> +
> +	if (intel_dp->pr_dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_SUPPORT)] &
> +	    DP_PANEL_REPLAY_SUPPORT)
>   		_panel_replay_init_dpcd(intel_dp);
>   
>   	if (intel_dp->psr_dpcd[0])
> @@ -736,7 +740,8 @@ static bool psr2_su_region_et_valid(struct intel_dp *intel_dp, bool panel_replay
>   		return false;
>   
>   	return panel_replay ?
> -		intel_dp->pr_dpcd & DP_PANEL_REPLAY_EARLY_TRANSPORT_SUPPORT :
> +		intel_dp->pr_dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_SUPPORT)] &
> +		DP_PANEL_REPLAY_EARLY_TRANSPORT_SUPPORT :
>   		intel_dp->psr_dpcd[0] == DP_PSR2_WITH_Y_COORD_ET_SUPPORTED &&
>   		psr2_su_region_et_global_enabled(intel_dp);
>   }
> @@ -3916,7 +3921,8 @@ static void intel_psr_sink_capability(struct intel_dp *intel_dp,
>   	seq_printf(m, ", Panel Replay = %s", str_yes_no(psr->sink_panel_replay_support));
>   	seq_printf(m, ", Panel Replay Selective Update = %s",
>   		   str_yes_no(psr->sink_panel_replay_su_support));
> -	if (intel_dp->pr_dpcd & DP_PANEL_REPLAY_EARLY_TRANSPORT_SUPPORT)
> +	if (intel_dp->pr_dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_SUPPORT)] &
> +	    DP_PANEL_REPLAY_EARLY_TRANSPORT_SUPPORT)
>   		seq_printf(m, " (Early Transport)");
>   	seq_printf(m, "\n");
>   }
