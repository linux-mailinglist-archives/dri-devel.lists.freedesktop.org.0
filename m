Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE2DA191FD
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 14:03:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F9A10E03C;
	Wed, 22 Jan 2025 13:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gQS1oXfP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84E210E03C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 13:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737550994; x=1769086994;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=iJJj0DZRoVI61VrhzoaxQxJ76cm3u7A9gjK5XDfiGTI=;
 b=gQS1oXfPRkV4xV7Zy1T7WilUOr9/4AIoBdR4Lb7KR553AC589wEiNwKO
 B7V8ay532mUq/9Tw57gAVST3dn5lGHkWEbSzxY89UhHn44JbmlNC5ASX0
 QYSQ74gcGjronbqK0Oh31o2ukV51FI+lZ4G+sligapUS/VrJ6pmcGfho5
 MWQfoNxsAzAzvaRaLhKj0cqfEEgnRIH68CwOhSOG9FaYENq4f8HvKgesd
 aQlYprkY/uO+Zpp6mu9PoRzOtOqmoF0I0mpo5cc6lT3BpoHpvkK8zr2zJ
 yGpBZo3S4/EtIeEGBwdlphY9Sp1iFFtNDqgyGnouNmEsSPrq7jCc0de1l Q==;
X-CSE-ConnectionGUID: GKaj6tzISxqg7QFcpzsbeA==
X-CSE-MsgGUID: 3FioawRmRc+99aBdV1QgYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="63357558"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="63357558"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 05:03:13 -0800
X-CSE-ConnectionGUID: SsY8DDCTRa+q+5tWQ9p+gw==
X-CSE-MsgGUID: QPRmHcFxQ/qHjXxc8TKlWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107005378"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 05:03:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 05:03:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 05:03:12 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 05:03:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLcWelVYZUEmZfJ/Ieo2x7YITRa2mraxAgrcc4/NuQrGrnBCnNmUleammD9jGrJOPcOsS5QbKZIzPf1ZS8MGxtliQUF4sXCZxWc0MK8bHFyzZjyI6Qz9aNPJ653yM535TRWHAlh/yaEPULdRTWu3CbKxWcCWp4XJK+/IjSB6QDLuvVzUjcWOBV7gBrwcClGVGt4ddwXkFL2nZcDjz0xq0VhJnw2/R+uX9DRonJ6KdIsHunEqxAIa3c0CZGHyl9XNP8indR9AliS/sjM5rv+jYgWFCmJxyScw3AjD/0OtkZomDZBJkVfmAlhuukLjCe3H1+6L+PF+Fwo97zVWlxVanA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kh4lvTvA3Vb7Nkjy6emzXsPh7k4jczMphIVRUwinqoQ=;
 b=KdxOaN2zi55aYWMa70AOjF4CTkqOGkPqsefbYbiUrZqjDBFQgSCisX5vQQlhy4xSNsySwB1va7QDOC8E+lucNj6M62exuE6yVMiWPk9d1kMxylJw9ZuSdqXhEO+yHP6nAw0C/m1AXT/xILwwt4/Rpc3z8PLUzGhBXRpAY8lAHsvs6UVWAd4Nen2W+LJjeGYjcL66qkRzQgLSug0pfqKUIg1jvRY8OOHyrlqOB0Ao/4Zs0KfSVxzBP4AbhAsnH5Rg6TdHuJy+1XBja2s0tqBFh8hKeMXycxVOjYGBYIyHfg9421hJt+SUr0+sPT9qAJGQ7yw4Ei6UO9Lh3lHIGm2qGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ0PR11MB6791.namprd11.prod.outlook.com (2603:10b6:a03:484::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 22 Jan
 2025 13:02:56 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%5]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 13:02:55 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Z5DSeQjrUKym5Dzb@phenom.ffwll.local>
References: <20250121210935.84357-1-gustavo.sousa@intel.com>
 <Z5DSeQjrUKym5Dzb@phenom.ffwll.local>
Subject: Re: [PATCH] drm/print: Include drm_device.h
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <dri-devel@lists.freedesktop.org>
To: Simona Vetter <simona.vetter@ffwll.ch>
Date: Wed, 22 Jan 2025 10:02:51 -0300
Message-ID: <173755097154.5500.15568058785162208000@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR04CA0128.namprd04.prod.outlook.com
 (2603:10b6:303:84::13) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ0PR11MB6791:EE_
X-MS-Office365-Filtering-Correlation-Id: d7a59051-79f3-4c0c-34d2-08dd3ae51678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cURmeEI2TWtnZlovY3lHWlNlYXFaTkN3cDZYLzgwTExKRkJEUWFRTFd2WVFl?=
 =?utf-8?B?cnp1MjEzTjlkb29aUCtpMS81VGZGaHVaOUhLbTZuREhIMDFFZm1Jb015QTho?=
 =?utf-8?B?cFJleU1NbEVuR2dmYk9wbVZiS1NUUDduTi9hdHJIWVR4VERaVFJNWTVMalRr?=
 =?utf-8?B?NmFsWHE1OTM3YklZL3FvYVBUc291N0ppd1M0LzdZT3NRd3FIQTA3aDBHQitu?=
 =?utf-8?B?SnB0SVBYOHE5ditMUEdiN3RNUVVNUGxVejJZbGZQRW1Hb0NrUmhtTEhRenM2?=
 =?utf-8?B?WExGK0JXaTQvZkNyUWZHU0thQXlOM1RzM2pCRk9DcUVJSCtXbWVjbXd6L0w5?=
 =?utf-8?B?aW1EM2toL1d3cjBic1RkazRUQTYvbUZpRXI0UDR1UTNLK1FKbWwyZ0Z5MjB1?=
 =?utf-8?B?WGVCTFZiL2Z6Uk5pV0NvRi9Eb29UZndoOWx1R2QzVXhaWmJ0QXRjcFVQdEpa?=
 =?utf-8?B?OXJQeVloVGt5UEFPU3NtZUdncDFBeng3VkNxY0FvSG8vT3p0L2pUTzYyMThr?=
 =?utf-8?B?M2V5aE5MK29DZVdoTzJvTWxIQXJsQzhPUG9rOWQ4MlV2YnNDZHJJUjhHZmNX?=
 =?utf-8?B?ekNhRi9vNUhGL2o2MmZxOVQwT1hqemlEclFSbDdoaUwxZGFJQ0dnaXh2enZT?=
 =?utf-8?B?alFZMHpRZElEc0pKL0FQTFJSRHZWK3NWVnErSjVFczJWTmJQaUFiMzJGVDNV?=
 =?utf-8?B?dU81b3ZUY0JDRjJGODlLNWdsQnd0TGRnNHNWTFM4TDBTbVhEUS9mZXZJckNM?=
 =?utf-8?B?N1lOY09YMmlXdjBaakJscXB3bzhsS29DbjdzS1ZLMzJISk9DV091SFg3dTJx?=
 =?utf-8?B?NTBCRXZFOGp3Sk5NN0R4MURWNFNLUGhwZDV6NEVsbXIrL2FnOS80UC8rcWxM?=
 =?utf-8?B?eG50UGJIVkdrRjZJalFzb1dNd21ZMEI2TmdveHpDeVhQdzJHWTQvZGoxZzZB?=
 =?utf-8?B?RHJ4ZnNPOXNEM3Q5Nk05QytLY2hta25PbWpkajViU2RBVXRwTVJUODB6WUFG?=
 =?utf-8?B?a3ZvSkljZVBhYTVqOWF2L3h4RkdBMlNrWlFaTUFPc2hGcnFobFFENmNuM2JC?=
 =?utf-8?B?dktoSlZzQ25jU2RlL282dkh2NHd4MkhhNjZHb0EydC94dGd5RCtqV1hYQmU5?=
 =?utf-8?B?U0R6dmVDZ0UzZGRodzRsd1ZsbXRDbU9kRXNFWUwwWVBzWkFNRUVUOThoNHBV?=
 =?utf-8?B?WkdzckwrdmhIa3QxVW1KMGtGQ1VBS0RnaWtkTzBzSmJFREJKK3V2eXpGUVpO?=
 =?utf-8?B?T294YlFRUllTbWhHbEZIazE5S3J6cFpsY3R0OGh4dWVjenhFWFdOdTlLdXh3?=
 =?utf-8?B?WVE2OGV3T0QzcEVMSUNwZ0xINGUrOWd1TmFEQmNxdks2Z0c4TGdydWZPdWh1?=
 =?utf-8?B?WXVHc2pSMFU5Mld0cE5DTmk4d3FDbDRSRzNsa2FlUEV2SWUvcVZWeUdNNWNW?=
 =?utf-8?B?dk85cUZHWmhHZEpkT2RaMmtIaDV0aS9Cc3pZZ1JBM0hKQ3pnNDkwRW1ELzd0?=
 =?utf-8?B?M3NoZHJIQTVwTUNMNy9kRk5kMDZuemFxSmFNaHc5RUhGb3Ewek9LUVdnM1JX?=
 =?utf-8?B?NXJ4d2owOW1CV2lvNFhKL203NTJJUmFrcE9RYUNnYW03T29CME9nL0xYMFZl?=
 =?utf-8?B?aXIzMnQ5Mk16NmhHb0M1UHdnRWFMNnc3U21ONk10ZzVyU1EwSDg5OGJXQjNa?=
 =?utf-8?B?OUIrdlhqWmRKekc1dmNPZi9QTWo1amhxTWdUZU9SUkpFWlB1ODBqeWJwcXNz?=
 =?utf-8?Q?ZaK0NJ6CqGhKwCSfW/HwOGQYEL7jEHdnE5aLYFM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0EzdHpxYTMwWnlHVjVxNWdPc0Ruc0tobG9saXpXZHY4THNjWFZ0TlRhWnVL?=
 =?utf-8?B?dm92WC9xYjNjc2FZNzFVVXR5TXFCemhFQ2NqaGVwRkZ0dTFtOE9YUC9KZmJC?=
 =?utf-8?B?SHRJTGVkeHplMFlMcUxsWGdYc21pOGVwakRQSXE4d0R5ckFWc3FNeXdxWW1p?=
 =?utf-8?B?YWdua21ybFFsZ1dPRVlSL3pMZ3JwL2FqUGlnT25LZzUxUk15dVhudWFxd1FI?=
 =?utf-8?B?Y3RERzBOa1MyZ0RDdGNxMEJ0V0JNNE5ZMEZZNVl5bDFiSUpkNWhCWkRQOGNx?=
 =?utf-8?B?QysyRVNYdlFjU0xycWRZdWxMdllmYVA5SjFTTlhWdkRwcmdHUDZidGRDazlN?=
 =?utf-8?B?OVhPNS9RYzFVbDQzVnBtNURyQnFBZzhlaVN5dGJocmpVaHR6TWYrWExvMytI?=
 =?utf-8?B?dGtINHpkOWJ5OWxtQnlOOVhpVUYvK2RCVTJkTDRBS3o0Mk8wNFpybEhmRnQw?=
 =?utf-8?B?VEVWcmFYY1Z6RGp6SnlRQTBWbGNOcTlRWTNZYjFtSGFDTFI2MmM1TXQxN2pV?=
 =?utf-8?B?TFB3d2hkZUFJallnTmtCeFRqRjdTeUh2bDNvREIyVSs3bVZkVmxZZGdLc3dW?=
 =?utf-8?B?MWJvZ3V0K3JKR21UcFlOdVNIV1hSWUdMT3VNa3p0REpielh2ZlpuY0VYUmdH?=
 =?utf-8?B?YUlFTFNKcC9MdWtXeFNETE5UbVBOT21FZDc5MVJjWTVxY0t2RXFNTjN2dG43?=
 =?utf-8?B?eXZIK3EzNXZJOHhJdXhkYStzenNuaDRrR0hUbDdSN2srTkxGS0J2YlM5aFRq?=
 =?utf-8?B?eERYMGwxNE5zQXlaSk8rKzJRU3pQaXp0NmNoczNkMnJzV2JqMUhFczV5SFFa?=
 =?utf-8?B?Y3Arb3M3RUNDNFNLOFlSUk04R3NNY3c1blZiU20yVW02NzZBMjZUL2VaZjly?=
 =?utf-8?B?UzFNbW9Ta1YrWUI4YWtBbjBQcmJaOXFJckUyWmh0M2tzdGk0YWpyZUQwSTY3?=
 =?utf-8?B?eUt5dWhxd0V1dzVrUVlWc0R5NGEwc1pkVHJ0QWtwOEh3Q3U3Vnh1MXRLUms4?=
 =?utf-8?B?STd1UGk3amcyTEFaL0dNeGNYNWpQcnBsczRGcVdRWFZEcjNjR2t2ZVIvNmFj?=
 =?utf-8?B?OEIxVlY5WTdIRjczZVArK3BabVdqbkMyRGlPVmZWZ3RBZDNNSmxSUk1vbCto?=
 =?utf-8?B?MUNwM29veVVINHlMSHd4WFFpUlk3VWV3ZzJvSE1FMSt5Zm1IaWRqcUtIVkxF?=
 =?utf-8?B?MUhUVG9icUtoc1dQUGlLWnkxaE9OalBWaHBEbmVobEZraHlUZG81Um51bXUx?=
 =?utf-8?B?WlIyOHJUSmtWczc5a1RHWnFRY3hGYldrUGY3eHp4eEVBS2psWm5GRVdRK2Vj?=
 =?utf-8?B?czQ0bVIzTmhGVVVGaFB6WXlHMzdubWl2T21PZGExUE91eWdMM0ZQenBjQk1s?=
 =?utf-8?B?eFZDbWtQTmV1T1lQdDNxTWRNNEVibGkzUnlSOGVRYm9CY0QxTkZMdW05WDlu?=
 =?utf-8?B?OC9oS2tjVnQ4MmwrbnVINHYybVM1QWlSSkZhc0g2bm91TTRGdkc5WnZDYndS?=
 =?utf-8?B?MEo0K01LZXBoeE5qTlZJMnBsZnlPc0Z1Z0sySDdiUDFkZEhuMUF4UUt5MnFB?=
 =?utf-8?B?RHNDa2E5NlNmM0FFbnYrQnZYS1BwZ0lxZVI3bmNMU0FNNU1SVEIxOHliTEUx?=
 =?utf-8?B?UzZaWXZYTTk3UG1MTnRzR3VYaFdudFgvaUgrekJXOVA2NlhKZE0yQnpmT29U?=
 =?utf-8?B?NklyTVVoaUhFcnlCYXZ5TjNDQ3Q5SGFiWCtqZG9rYWxldEZDd1BnNlliRTBK?=
 =?utf-8?B?N2VHcVZZcGdNaVlxMHlDeGhDQ2Y5TnZCaHFOOStmUW84akt1dGNCZm1SSldl?=
 =?utf-8?B?Zk1TTkRnTWl6cXJEb1N4amVQOURUU2E3SXlOdTRJQ0hhcHd0OTByQnkrYnlI?=
 =?utf-8?B?RVl2UlpsdEdYTzROYURPbnpsYXQ5Wk9MZWxwS2s3MzRld0tEaWE4V2NzVW5h?=
 =?utf-8?B?azJGUFBDdFFsL0JqWHdlSGpwcXNlVWluWUJkNmRMWVBlbnJ1V3VJN204MWNS?=
 =?utf-8?B?S1paUi8vdmVJU3h0cDIxa0dheWY0ZThqQThqdVk4VWJHRGgxaHRXTU5lN1JF?=
 =?utf-8?B?M1pKV01JUmZVL05teTBkYW91MDNMTGxyZWNXMW5uakM1bjB6ZFA2L0NTSURR?=
 =?utf-8?B?cG9rOGZhSlI1b1FBV0NOUXFpeXY4emtaR3JwQmFMTmYzWXhWd0FWdU9KbjFG?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a59051-79f3-4c0c-34d2-08dd3ae51678
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 13:02:55.6301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smAqC4UN1j3n0ud7myN2sYDAKfUzKtW8XwI3iyNoyBuaECf+Fr20arLqo6d8MlRoremptoj1Jp/nulqRpackVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6791
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

Quoting Simona Vetter (2025-01-22 08:11:53-03:00)
>On Tue, Jan 21, 2025 at 06:09:25PM -0300, Gustavo Sousa wrote:
>> The header drm_print.h uses members of struct drm_device pointers, as
>> such, it should include drm_device.h to let the compiler know the full
>> type definition.
>>=20
>> Without such include, users of drm_print.h that don't explicitly need
>> drm_device.h would bump into build errors and be forced to include the
>> latter.
>>=20
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  include/drm/drm_print.h | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
>> index f77fe1531cf8..9732f514566d 100644
>> --- a/include/drm/drm_print.h
>> +++ b/include/drm/drm_print.h
>> @@ -32,6 +32,7 @@
>>  #include <linux/dynamic_debug.h>
>> =20
>>  #include <drm/drm.h>
>> +#include <drm/drm_device.h>
>
>We much prefer just a struct device forward decl to avoid monster headers.
>Is that not doable here?

I don't think so. This header explicitly uses members of struct
drm_device, so the compiler needs to know the full type definition. As
an example see the definition of drm_WARN(), it uses (drm)->dev.

--
Gustavo Sousa

> Worst case I'd convert the drm_info_printer()
>static inline to a macro, not sure about the exact rules here if you
>never deref a pointer.
>-Sima
>
>> =20
>>  struct debugfs_regset32;
>>  struct drm_device;
>> --=20
>> 2.48.1
>>=20
>
>--=20
>Simona Vetter
>Software Engineer, Intel Corporation
>http://blog.ffwll.ch
