Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IL3EOiQSimk0GgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 17:58:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2448112C66
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 17:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A9B10E436;
	Mon,  9 Feb 2026 16:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K8g+7dVg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8F510E366;
 Mon,  9 Feb 2026 16:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770656286; x=1802192286;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=E1Aa5nf+G93uRVa8MnIRrfgEJ/1BkYzMkdmnULBuMR0=;
 b=K8g+7dVgFawXIXdWrabS4WwwwwYobzv6o9M7yGUNBOLs9v3URy5wj6pA
 JK6eVXyLgKYIgT8oK0KEPXwE1mJ2x6ukKz4ESJb9rLxXClSc6Ad+9Cq8b
 sdewcppLTn1Nhn0bfKvHkNGB5x+8SXWYB9rjO58s5HWS7otRBqeHCxEa5
 udI9lDD3Azld5/fRk0apvOez031cd9S54JINniAZydNHLexsUnav45ydF
 eOpRe5T86ggoxSm37wW6r9xKQrUUwQzyC1DctX6Vo7e/C4iFlHugjsPDG
 vmjxB1LqlYe5kJUIS6fNMCyL4UOhC95oiygeBxbGVzMkW+Erl/QyG/X65 A==;
X-CSE-ConnectionGUID: OYmx+wirQ0yZJP5u5rxj1g==
X-CSE-MsgGUID: p4vjwAB7TL2yaGuRCnSH1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="75397180"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="75397180"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 08:58:06 -0800
X-CSE-ConnectionGUID: 91B0qCvgTCudeBZIiyi/NQ==
X-CSE-MsgGUID: e/0GXESRTCmB8sUTlY/h9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="216162402"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 08:58:07 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 08:58:06 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 08:58:06 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 08:58:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vue+MreXZaIfwiH297gnwUh1bg3mTxtj2dCwzr1RBkH3GDrjAh1Vdj+6YY1licYc5KpSGjkrR67guc4sle+j9XRo5tbKm4A+CWYEedUGIftoazZrE4U0VN691Z2BzN2/k1eEv6zxwsQUFwjAV8dtHj8pGcZtPFa4mwXBixbmwTe8nXrMg5tuBkhbBETdUe2vuzsG5hCqe314oToXCd7797eJPKHcd6W2MfygSu161GV33wvkgTfoAHxzpMIfLP02LsxFpvIsWy6R23IfUbeWUFQBqSAkDVW/l+k+3VTM5mnkJhVZdDnOq+FIZIoHonCFnpzAZ1DKBiy0ct/n1HunNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2uRlsnjXjGTDvCWuwq5CbsaUe62l5mo+pMHTUzhIC8=;
 b=Vw8v8OI+zfi1LJnC4os/wNRHB8pJelNUaiDXLEuI7L74H3K3Tw4tK97r/0fnPSY9bNAeaSWuNkvjLk82BChpObwecsID92z4OqKS9upnJRIDq1v8iJL+nW4w9QvmFyMQHXbJGPh+/t3fvHekA5Vg9g/o1J2J4XdIC9TOnbh8SkcFWC+/V9LuiV1yLUxlYsSCAfWgvzlHYziTHhEcf54XfCq2lQ0a988Kz+/ByjLcYWZr6U+bnNVciQR685J0jCxZgzf0i7fDw1LGzW+rAG3Wc1oKXWEc5YKElNu7sQswWZValS4M/jd8exH1pNEAIPXWg+LyyiF75dexQoBDuSU++Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4530.namprd11.prod.outlook.com (2603:10b6:5:2a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 16:58:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 16:58:03 +0000
Date: Mon, 9 Feb 2026 08:58:00 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <leonro@nvidia.com>, <jgg@ziepe.ca>, <francois.dugast@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v4 3/4] drm/pagemap: Split drm_pagemap_migrate_map_pages
 into device / system
Message-ID: <aYoSGL5EXaXSD1/6@lstrano-desk.jf.intel.com>
References: <20260205041921.3781292-1-matthew.brost@intel.com>
 <20260205041921.3781292-4-matthew.brost@intel.com>
 <93d2a45fd5a8af50b23bd15cd45c21300f804768.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93d2a45fd5a8af50b23bd15cd45c21300f804768.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0328.namprd04.prod.outlook.com
 (2603:10b6:303:82::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4530:EE_
X-MS-Office365-Filtering-Correlation-Id: e742f393-9e9d-4301-82cc-08de67fc63b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?JPCruLkIk4NW3FhsT0duVOSRb7qKYUEcFUn47kqJixKMJE0mkhVOCmZm1P?=
 =?iso-8859-1?Q?HMtiFrLZCLmiYOsBToJX3Nekln2WvgDYOI/ly7L1i3EONa3pUADdoI+FM4?=
 =?iso-8859-1?Q?Pwyc2DrzvO2MjPqRkcGbCH+n8ySE1TeWc6RJkvjW3YnNAmxysQm2MjNpyS?=
 =?iso-8859-1?Q?pdQqKVZ3AtcTT2JUufY2HJ0p4ROMHP3h+5Stmr9MadsMT0kyUm74Cp0A7G?=
 =?iso-8859-1?Q?iIDfArtNfE8XBNOgGFa4PhyECMoT0+nFmyn60hGv+yhdeV/TMEKS7C93Nb?=
 =?iso-8859-1?Q?WRvW+bQbyXGUf4BQ5bX1mFZEzFzNU/+Kw/TEO7gpQe4jgJ8ThU34F2ckpR?=
 =?iso-8859-1?Q?DaO3A/LmqQrIK6SEIMsywPZrKzYyuKkqMAsEy+RpwCZfTflYcsFrEJEXUR?=
 =?iso-8859-1?Q?m/3pdwNzDhQCCCQmdfE9ZU19QKnkOGBJVQYhaQ07Ixw2bhPol1QJ2VEKog?=
 =?iso-8859-1?Q?vTkCrHCYRHdSrJoQpn1AGuFABmzApd0iRqaqawL/BXX7JC8IK7wTEJpng/?=
 =?iso-8859-1?Q?ZQrt14+8rsINxWaWRHl+raHGwZ1OBgPlxd9ZaIoNu8apNrmgiFvkzz3w0e?=
 =?iso-8859-1?Q?n/AJ1MkfF2pyxDz84IMmElc5zwW+L6ZhNdUlZodrYeTUrPDAinNbOg+4QW?=
 =?iso-8859-1?Q?qthLoQYuO4h9qD7ApfuXlENofRnHjhyea9TVJRXxvzyeg4nd+kgI3wvcKr?=
 =?iso-8859-1?Q?gaxkLbXwkS4LKm209DpPgu7GuvwxRIVw+ZUitbgjwfCkYVIzZtTEgC/etz?=
 =?iso-8859-1?Q?Nhl1djgk65pk9I/HgAyJ7UvA+QccOZygUh3dgCR1YB+1dMZTTd7FbEP3K8?=
 =?iso-8859-1?Q?4AuGOoVQxQlKlcReFIcjT5UDe97s8jroISY041JdClgG/UGoGBAlC3ENxM?=
 =?iso-8859-1?Q?RXmzQdgZr/dM+UqkYQStH3EnmAUSKSjxMIYa3CBsgLdxA4i+OHOJF79nRP?=
 =?iso-8859-1?Q?EOvpl9nBh2jqxCdBfIDo1vWu86xKDzV0bIb6NhVWid2/A64dSSYmTQ51j4?=
 =?iso-8859-1?Q?F7e4pgnHZMSBs7kx4g4OC1ekBL+aNtPzg+HUVZRMB//s8Mux2yZ6psgE5v?=
 =?iso-8859-1?Q?wNS+Mahol5RoVTVL8XODC8OuLgpDUZYM/BxX7D0Zezs9hOrYTq4JzKxQxn?=
 =?iso-8859-1?Q?KVZrhwy0sCWYlkfqxQh2/3KYFH9nlPJ9HSQXOm0EzvDUD7ssF+/G7Uwq+T?=
 =?iso-8859-1?Q?Cbu1yPkrt/eHAuNjd4DjDGrb8V4JPchwLW1bsnqmcUiUDL143/mVuCDkm4?=
 =?iso-8859-1?Q?ZDGTvBeMbOdH34Wh90d9uFApOA8s4yMUBMmAX5NH7gw6nHrI9QRuyb5GB/?=
 =?iso-8859-1?Q?dk59mcv+NZWDF8JYYBFKS9SGs1XYiv6iRgRd9DmBC20IExWjxGXkprxWjq?=
 =?iso-8859-1?Q?+NqWJzBoi3siqKeof0NVeGXeZuGPOjOVzRTLbyjxk+rzrsF6dB97TaF+uM?=
 =?iso-8859-1?Q?04qflgY3gKI0B1bhA/bbbkrqVDYLdC1c4kMiMjTpyMYKByP302efluDpeT?=
 =?iso-8859-1?Q?qnwI6n62Rej5aJAyauP3ngcYLcoixIQ7DRxZmfbB06taFtCjnwVf65HFeT?=
 =?iso-8859-1?Q?M6so1yneuJBErhHdjpLSI+ed49ir/c92UkDApxM8Z4nOKvI8GWKcuN9JTf?=
 =?iso-8859-1?Q?+BFN6zTM1lSHY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UQJ4zqok6ZAp5OYT+yr9GIGlc8VxZw1CHYkcjU3ql5ssMeCQsoeoXuToVV?=
 =?iso-8859-1?Q?tBFeVTobTysq96CYRGhnmocNksMIfWr+CQ150FDb8/Qba+BYvqWJ4WXFZk?=
 =?iso-8859-1?Q?zJ9foxuTpuKdJ6QXQLzA2zRRy2tBjKb40fnosair8hx8K5xsikgwHoeZrt?=
 =?iso-8859-1?Q?joktrlOPzVYOB3rBKrpUy0Ri11uhjXAmcFIax1+oSP1yjpEqfGwazm+8lS?=
 =?iso-8859-1?Q?tJrJdc17pALuR2tHJ0y4KZTgZy0bpLix426p47OFFdkAMjUwHNBayMqh3z?=
 =?iso-8859-1?Q?u+4KgV3IiHRrOp+KQD5kgFjc1cV6W17SlLJGOcPGWW6Sy2tuo5xPL66Km8?=
 =?iso-8859-1?Q?W8aL9aKji6alrqIkDyLLqxfZmWnW3AYhZDmSBucUf7yiHF2WM6lhaHNEEf?=
 =?iso-8859-1?Q?6RCagGdgtsCDzdBC3Z4ZqI0kCdmR8YM4DmWihlSMagtI2oCkmkIFI574YG?=
 =?iso-8859-1?Q?nPe0cLmWAcIMaPH4E1osEEhngtEaQiJDb1MiDrDS0KRHJC4yWZMAKKbvmH?=
 =?iso-8859-1?Q?oFtkj8XLAEIxvT+U1w0PiQO8RPqzqKZw2h7B4uTzyjeFsFvn6XjFEkYOx6?=
 =?iso-8859-1?Q?KsnFZc++c9kJ+mchbEd+iLZZ3DCkDV6TyZUwpRQ8GONKojOsb+hc9eP3Pr?=
 =?iso-8859-1?Q?LCc3k5fkQM1TYu4xKyXvGM+oOkCWh9Q1CDo4L/P3RWayuxaoaeiGKAAi5E?=
 =?iso-8859-1?Q?QEleur1Lrw16vnJpyLHWA6UhMS3SMFoOrxS6WkJQZx8PBpJ0zXl01b0fqT?=
 =?iso-8859-1?Q?37ho97zFRCMJgteJfItA9TAEw6dpYTn1ZTiOBqlKSTHQ+h9QgZYni+wpYa?=
 =?iso-8859-1?Q?t870Kz4gJ75Y6BRDl5TrErU+sEz2QjuSYLZa2UTC9fFGyOvYVo/5SZu3uA?=
 =?iso-8859-1?Q?/XyPUoy8qNnLxUXm7vu0/JL/M5MRYgY2fACmjdi0b78Jhst/trQZNOAFLN?=
 =?iso-8859-1?Q?TejN2Vh/n49rGMyPn/+2a0IWkKb7r00T3G42VCPuKTDAaXjhktun3RdeF1?=
 =?iso-8859-1?Q?vSMuIpGph/YpJ50D8aoniwg219WiLO0uPMUkbMXyAmnp6/dZ3I2laGmakB?=
 =?iso-8859-1?Q?tgnHVkEyclOMG27iCg1JtgklNQYaQd9bO8QtrTrarNCGPk1IEASIJ3Rzxc?=
 =?iso-8859-1?Q?1UjCVxWaIx5kIuf3l5wnNQqS5xvZ8D2hlpVkoy4D5nkCFrNPFaVNyJh3CZ?=
 =?iso-8859-1?Q?uAjFvt3jJd07S+tfffvCTNTrTlG4bMPrhZGnmYlw92YAHcxGYn4Ozk3t0h?=
 =?iso-8859-1?Q?Yjy8GnXgZRm2Vp2z1HPzaZQpTPoMQxvyzs6+KC7VziScExglOZSU6OkJu6?=
 =?iso-8859-1?Q?qP8oOB14cYhOWvCYg8sBuQHT0/bd/1r09aI5IXDeI7IoHVYS3dExPNnTXC?=
 =?iso-8859-1?Q?vPqtQN0LuUAJqF8dO3VIUMfd55OCUhH+TttPw6q3HX6GrL5K1CleApsOoi?=
 =?iso-8859-1?Q?yx4s8bDaXTo4JlfJ2kvmCaMsJOZwHk1bJxkFmaFqchcjYduKsQuzQkbSvJ?=
 =?iso-8859-1?Q?DoWpe6t97Br+ic/UYCBVWc+FQ17xUb1IKTjy/USqBIJYHhxiNt6E5lnyUq?=
 =?iso-8859-1?Q?RkhJwjW7U9aktCMA6JrBheXmAVwDBAtdKSuF7NjafSdJGtc47jeBgTPgV3?=
 =?iso-8859-1?Q?pt/RTTklel4nRXoPOnAfuj7Jno97pn7iBcKk3x10i3yMWBKY/IOgv+ZOOL?=
 =?iso-8859-1?Q?3XSJiqi1mpghMHnCM3WWNMySg9cT2AGMp40hn4lkW1+pmP3VhpZa67u5F7?=
 =?iso-8859-1?Q?Mc290PGJvNc4wYo5TfsmHa9TGTsjiAsBap0cT/pvfpgaG9GJJAT62RvPCi?=
 =?iso-8859-1?Q?ojqZX2MedWE2bNtvz2v2AsDMgAHm60k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e742f393-9e9d-4301-82cc-08de67fc63b8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 16:58:03.7055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G4bOYbokBAmMvXxOL5PZRSQjc81mBlu0ZK29Hpk2Le1w73RZsGpoEGlo7xZKcibkDhu6yUpyMXsET9KGurdfmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4530
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim,lstrano-desk.jf.intel.com:mid];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: A2448112C66
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 04:49:03PM +0100, Thomas Hellström wrote:
> On Wed, 2026-02-04 at 20:19 -0800, Matthew Brost wrote:
> > Split drm_pagemap_migrate_map_pages into device / system helpers
> > clearly
> > seperating these operations. Will help with upcoming changes to split
> > IOVA allocation steps.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/drm_pagemap.c | 146 ++++++++++++++++++++++----------
> > --
> >  1 file changed, 96 insertions(+), 50 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_pagemap.c
> > b/drivers/gpu/drm/drm_pagemap.c
> > index fbd69f383457..29677b19bb69 100644
> > --- a/drivers/gpu/drm/drm_pagemap.c
> > +++ b/drivers/gpu/drm/drm_pagemap.c
> > @@ -205,7 +205,7 @@ static void drm_pagemap_get_devmem_page(struct
> > page *page,
> >  }
> >  
> >  /**
> > - * drm_pagemap_migrate_map_pages() - Map migration pages for GPU SVM
> > migration
> > + * drm_pagemap_migrate_map_device_pages() - Map device migration
> > pages for GPU SVM migration
> >   * @dev: The device performing the migration.
> >   * @local_dpagemap: The drm_pagemap local to the migrating device.
> >   * @pagemap_addr: Array to store DMA information corresponding to
> > mapped pages.
> > @@ -221,19 +221,22 @@ static void drm_pagemap_get_devmem_page(struct
> > page *page,
> >   *
> >   * Returns: 0 on success, -EFAULT if an error occurs during mapping.
> >   */
> > -static int drm_pagemap_migrate_map_pages(struct device *dev,
> > -					 struct drm_pagemap
> > *local_dpagemap,
> > -					 struct drm_pagemap_addr
> > *pagemap_addr,
> > -					 unsigned long *migrate_pfn,
> > -					 unsigned long npages,
> > -					 enum dma_data_direction
> > dir,
> > -					 const struct
> > drm_pagemap_migrate_details *mdetails)
> > +static int
> > +drm_pagemap_migrate_map_device_pages(struct device *dev,
> > +				     struct drm_pagemap
> > *local_dpagemap,
> > +				     struct drm_pagemap_addr
> > *pagemap_addr,
> > +				     unsigned long *migrate_pfn,
> > +				     unsigned long npages,
> > +				     enum dma_data_direction dir,
> > +				     const struct
> > drm_pagemap_migrate_details *mdetails)
> 
> We might want to call this device_private pages. Device coherent pages
> are treated like system pages here, but I figure those are known to the
> dma subsystem and can be handled by the map_system_pages callback.
> 

Yes.

Eventually we will have figure out we'd want to handle Device coherent
pages with a high speed fabric though.

> >  {
> >  	unsigned long num_peer_pages = 0, num_local_pages = 0, i;
> >  
> >  	for (i = 0; i < npages;) {
> >  		struct page *page =
> > migrate_pfn_to_page(migrate_pfn[i]);
> > -		dma_addr_t dma_addr;
> > +		struct drm_pagemap_zdd *zdd;
> > +		struct drm_pagemap *dpagemap;
> > +		struct drm_pagemap_addr addr;
> >  		struct folio *folio;
> >  		unsigned int order = 0;
> >  
> > @@ -243,36 +246,26 @@ static int drm_pagemap_migrate_map_pages(struct
> > device *dev,
> >  		folio = page_folio(page);
> >  		order = folio_order(folio);
> >  
> > -		if (is_device_private_page(page)) {
> > -			struct drm_pagemap_zdd *zdd =
> > drm_pagemap_page_zone_device_data(page);
> > -			struct drm_pagemap *dpagemap = zdd-
> > >dpagemap;
> > -			struct drm_pagemap_addr addr;
> > -
> > -			if (dpagemap == local_dpagemap) {
> > -				if (!mdetails-
> > >can_migrate_same_pagemap)
> > -					goto next;
> > +		WARN_ON_ONCE(!is_device_private_page(page));
> >  
> > -				num_local_pages += NR_PAGES(order);
> > -			} else {
> > -				num_peer_pages += NR_PAGES(order);
> > -			}
> > +		zdd = drm_pagemap_page_zone_device_data(page);
> > +		dpagemap = zdd->dpagemap;
> >  
> > -			addr = dpagemap->ops->device_map(dpagemap,
> > dev, page, order, dir);
> > -			if (dma_mapping_error(dev, addr.addr))
> > -				return -EFAULT;
> > +		if (dpagemap == local_dpagemap) {
> > +			if (!mdetails->can_migrate_same_pagemap)
> > +				goto next;
> >  
> > -			pagemap_addr[i] = addr;
> > +			num_local_pages += NR_PAGES(order);
> >  		} else {
> > -			dma_addr = dma_map_page(dev, page, 0,
> > page_size(page), dir);
> > -			if (dma_mapping_error(dev, dma_addr))
> > -				return -EFAULT;
> > -
> > -			pagemap_addr[i] =
> > -				drm_pagemap_addr_encode(dma_addr,
> > -
> > 							DRM_INTERCONNECT_SYSTEM,
> > -							order, dir);
> > +			num_peer_pages += NR_PAGES(order);
> >  		}
> >  
> > +		addr = dpagemap->ops->device_map(dpagemap, dev,
> > page, order, dir);
> > +		if (dma_mapping_error(dev, addr.addr))
> > +			return -EFAULT;
> > +
> > +		pagemap_addr[i] = addr;
> > +
> >  next:
> >  		i += NR_PAGES(order);
> >  	}
> > @@ -287,6 +280,59 @@ static int drm_pagemap_migrate_map_pages(struct
> > device *dev,
> >  	return 0;
> >  }
> >  
> > +/**
> > + * drm_pagemap_migrate_map_system_pages() - Map system migration
> > pages for GPU SVM migration
> > + * @dev: The device performing the migration.
> > + * @pagemap_addr: Array to store DMA information corresponding to
> > mapped pages.
> > + * @migrate_pfn: Array of page frame numbers of system pages or peer
> > pages to map.
> 
> system pages or device coherent pages? "Peer" pages would typically be
> device-private pages with the same owner.
> 
> > + * @npages: Number of system pages or peer pages to map.
> 
> Same here.

Yes, copy paste error.

> 
> > + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > + *
> > + * This function maps pages of memory for migration usage in GPU
> > SVM. It
> > + * iterates over each page frame number provided in @migrate_pfn,
> > maps the
> > + * corresponding page, and stores the DMA address in the provided
> > @dma_addr
> > + * array.
> > + *
> > + * Returns: 0 on success, -EFAULT if an error occurs during mapping.
> > + */
> > +static int
> > +drm_pagemap_migrate_map_system_pages(struct device *dev,
> > +				     struct drm_pagemap_addr
> > *pagemap_addr,
> > +				     unsigned long *migrate_pfn,
> > +				     unsigned long npages,
> > +				     enum dma_data_direction dir)
> > +{
> > +	unsigned long i;
> > +
> > +	for (i = 0; i < npages;) {
> > +		struct page *page =
> > migrate_pfn_to_page(migrate_pfn[i]);
> > +		dma_addr_t dma_addr;
> > +		struct folio *folio;
> > +		unsigned int order = 0;
> > +
> > +		if (!page)
> > +			goto next;
> > +
> > +		WARN_ON_ONCE(is_device_private_page(page));
> > +		folio = page_folio(page);
> > +		order = folio_order(folio);
> > +
> > +		dma_addr = dma_map_page(dev, page, 0,
> > page_size(page), dir);
> > +		if (dma_mapping_error(dev, dma_addr))
> > +			return -EFAULT;
> > +
> > +		pagemap_addr[i] =
> > +			drm_pagemap_addr_encode(dma_addr,
> > +						DRM_INTERCONNECT_SYS
> > TEM,
> > +						order, dir);
> > +
> > +next:
> > +		i += NR_PAGES(order);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * drm_pagemap_migrate_unmap_pages() - Unmap pages previously mapped
> > for GPU SVM migration
> >   * @dev: The device for which the pages were mapped
> > @@ -347,9 +393,11 @@ drm_pagemap_migrate_remote_to_local(struct
> > drm_pagemap_devmem *devmem,
> >  				    const struct
> > drm_pagemap_migrate_details *mdetails)
> >  
> >  {
> > -	int err = drm_pagemap_migrate_map_pages(remote_device,
> > remote_dpagemap,
> > -						pagemap_addr,
> > local_pfns,
> > -						npages,
> > DMA_FROM_DEVICE, mdetails);
> > +	int err =
> > drm_pagemap_migrate_map_device_pages(remote_device,
> > +						      
> > remote_dpagemap,
> > +						       pagemap_addr,
> > local_pfns,
> > +						       npages,
> > DMA_FROM_DEVICE,
> > +						       mdetails);
> >  
> >  	if (err)
> >  		goto out;
> > @@ -368,12 +416,11 @@ drm_pagemap_migrate_sys_to_dev(struct
> > drm_pagemap_devmem *devmem,
> >  			       struct page *local_pages[],
> >  			       struct drm_pagemap_addr
> > pagemap_addr[],
> >  			       unsigned long npages,
> > -			       const struct drm_pagemap_devmem_ops
> > *ops,
> > -			       const struct
> > drm_pagemap_migrate_details *mdetails)
> > +			       const struct drm_pagemap_devmem_ops
> > *ops)
> >  {
> > -	int err = drm_pagemap_migrate_map_pages(devmem->dev, devmem-
> > >dpagemap,
> > -						pagemap_addr,
> > sys_pfns, npages,
> > -						DMA_TO_DEVICE,
> > mdetails);
> > +	int err = drm_pagemap_migrate_map_system_pages(devmem->dev,
> > +						       pagemap_addr,
> > sys_pfns,
> > +						       npages,
> > DMA_TO_DEVICE);
> 
> 
> Unfortunately it's a bit more complicated than this. If the destination
> gpu migrates, the range to migrate could be a mix of system pages,
> device coherent pages and also device private pages, and previously
> drm_pagemap_migrate_map_pages() took care of that and did the correct
> thing on a per-page basis. 
> 
> You can exercise this by setting mdetails::source_peer_migrates to
> false on xe. That typically "works" but might generate some errors in
> the atomic multi-device tests AFAICT because reading from the BAR does
> not flush the L2 caches on BMG. But should be sufficient to exercise
> this path.

Ah, yes I see I missed this - this patch isn't strickly required I just
didn't want drm_pagemap_migrate_map_pages to have massive cascading if
statements... I can remove for now if that is preferred or should be
just remove source_peer_migrates and assume a value of '1'.

I suggest the later because looking forward source_peer_migrates == 0
would bb difficult to support a high speed fabric, which requires a IOVA
(think UAL with virtual NAs at the target device), plus multiple
different devices being found in the migration pages. Also, with p2p,
isn't source_peer_migrates == '1' (write over p2p) faster than
source_peer_migrates == '0' (read over p2p)?

Matt

> 
> /Thomas
