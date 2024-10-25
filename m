Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA319B11E8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 23:51:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E8410EB97;
	Fri, 25 Oct 2024 21:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mtN/C0u8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE6010EB8E;
 Fri, 25 Oct 2024 21:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729893095; x=1761429095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wV/lB3RvOsZOu3vDULszMLNgmlK9960n/gBi+PSlrKE=;
 b=mtN/C0u88n7fls8sZl14u8mQePWdFNs48HeRWSDYEFFgzmXujo7NVuNR
 h8MHzjgZLhg/lJiuC6URkWIKnJk0ZwFENqBmQBTGScoCz9NMAixccjwXf
 FTF2Z0dO7nFRU9H5+jHNXANScLS4/Tmxz/P5EwM47xgwy7Kgx0Nuw5X4A
 OgnahhLyFxZLqQEwi44UX+SyF2wDGhMmaX/kn+zR4VVz+QxzsLuBjNXiI
 OLGVAD3aetN2eGyzF0xGQZzkzFzESVHRIoQ5iXW7LhShvefvhqu4780mU
 IvW/bnk0Qcy4R9y/tkC8/sKbrIqVM4Rbkaq6Pwr/1tVUIXx+AloeadT5/ Q==;
X-CSE-ConnectionGUID: U/sNaBQPSzeWGC4cHnCL+A==
X-CSE-MsgGUID: yWztMW3cRWOkg6GsCHQGTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29750671"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29750671"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 14:51:34 -0700
X-CSE-ConnectionGUID: bF8FtKR1SYa0C23rCnraUQ==
X-CSE-MsgGUID: iRTtAwq/SseoUQScyMBfGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="85816278"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 14:51:34 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 14:51:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 14:51:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 14:51:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVfGQhUM0duLzY9RXbPECPTozg0n02qOx/cjvozrLi7yaItfV6cx8BM2azZ/QDpdGDrRXeMrGyGT+K/PNRP/XzPWRpHwMexq/OPp6NACdarhWV9tE1dtBHLdjMWi7+igVNIi58U3hm+Q3NN6PbrQfGDFAG8sDJWYjwnaNBjiOAZ1reQsmvB2H5bXdNyVbLqkViKv4Zc/5/cHQM9iabL0eV4cqOlE9Dpq3KNdxFmn9wwJ0cTwk8J7KSWJqAIHZ1nhvmjNrgSCDWFtdtX7NUxPOFeNZgpktnfrPv3e4OP6YnAq0FIT8m30JdyXRs12yLBEoU8lGX1aSeB1t8VR9ecICw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwNmh+itC+Ul8yFEj6hh3gv/yry98BeOohAwro8BFBU=;
 b=eaSMxNx8RYOFBSApdcTCuN7gjk8b+VYmva8IEdrceCUO0ATisa4gtL4Av/dpyUDv00P6xir9xG7in072pX1PFly83B4hWUkZkOP8Ye2osu+yfnLNLwsaSQAHdm8H7l4gWtIrMJh2PBKsdBuidtc3hg2YzIoTqdQaCBciTEPleMEHo3LYLnakMGH0Owy5dYVYdOzHVyt3fbslepYieGH3f/LaQPoXMPhJjHHZXZlksx8sdDs22XVvvgYFCIQk1ZnbEgFcXvxWeawXnng6u2ZcQK3VOEou/rk3Df2P3k5z1/vX/bSWQfZhg9L6jnnA8fy5H0D5vfGQki5evL05a4TW0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY8PR11MB7745.namprd11.prod.outlook.com (2603:10b6:930:90::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.16; Fri, 25 Oct 2024 21:51:29 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 21:51:29 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v4 7/7] drm/xe/pf: Set VF LMEM BAR size
Date: Fri, 25 Oct 2024 23:50:38 +0200
Message-ID: <20241025215038.3125626-8-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025215038.3125626-1-michal.winiarski@intel.com>
References: <20241025215038.3125626-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::23) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY8PR11MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bd2660d-564f-476c-8417-08dcf53f2e97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlltMEg0Mkhsb2wyVHlwd01CZ21hOTdQcDRaMDNUUFA0RVJibm05MVp2QzZw?=
 =?utf-8?B?dTFtbGgrK3EyRWZaMm8xUncxR1Bta1BmNC9WWVVKM2oyZHBBeElqNDRtM3g0?=
 =?utf-8?B?MEt4U1FySkxtaTIxQ1Z2dFVWRDQ3QytZSVMrckc5M3VDWTh6WUhEc01DT0Jj?=
 =?utf-8?B?N2RaNlFkS0VyR1VyMmJGQ1VWTmZjZWRjYWdjeDdSVzlTY3ROR3UwbWxoOHc2?=
 =?utf-8?B?UDE1Y0RWbW9hR0tQeElHUWRCWXBaakpnZEw0VTZ6c1NkTTBmRytGNmNJdWhW?=
 =?utf-8?B?RlAyR1N6NW9rWVZaNEVmczhrWTgydWlOdGRKYkN6b1RGMWtQVE0zVDVoUTdJ?=
 =?utf-8?B?N1BKdGxSOFd5ajdWNnFMUi9OTldoL0p0SFNpeDBjUzEwQ3hvZFJHRE5tcFpz?=
 =?utf-8?B?L2VINzVVN2FTbVloak1pTHNpSFFGTzNvSldCYkNmVG5TNFlBOHYzaGZCaWth?=
 =?utf-8?B?N1h3VE1UVmtzZG9pdlNqSUtGZkFRcDdUbWtxWVlWc0ErZVExSE5aSnc1ZXFu?=
 =?utf-8?B?OGxkbndvTStObWlYSllZRlBPZXRocDh2bDk5SnFhQ2hRSEUyNmQxT1QxV1hu?=
 =?utf-8?B?Ymc2WFdOdkVIdG9NMDl4b25IL2RGTFZFdjZDd295aXMzQnpMYUpJQ0NOT1dy?=
 =?utf-8?B?VTN0ZE9kTnN5ZWRzbjlOUTRSVCsyWHUwSEtoU2RrYlNkSjBsR3dUbEpFQWFL?=
 =?utf-8?B?UHBSS1pObDduVHFCaEszRWtRYm94aXRVSnFWVGxoalRSQ1F1ckEvSXZHdmpT?=
 =?utf-8?B?czRFV3pxMFF1RmpjOUx5cSs4NVNabjNxSGVWZE5VZDBiczZ6a2tEcmdwMXdw?=
 =?utf-8?B?T0dkNGVYM0l6TUVqRXIweHlhVW1xaGRiRks5UFhvMWJtRmU5S29aeTlpQ2Vn?=
 =?utf-8?B?WDE4NS82cnN2SFBiSGNvUXVETlFuTUI5blc1N1l1ZnR4dUlJaFhCNmFQaU1I?=
 =?utf-8?B?TEJGbGJXdFJsczZtaTVabndkbHdJR3Y1bmwwMnRZa0pvWXdTQ29sWUVFUXdE?=
 =?utf-8?B?N2t4QTFQeXZHWGVPZ1krQ2hrWXdZRFMwQkNHalZMVHRwYVl4dU1IZEdodUIz?=
 =?utf-8?B?dmZKblNPYW05ditycFcvQmt4Vm5MRTVOL1RyaEtiMzdvaHBhTC9zVXVsRG5t?=
 =?utf-8?B?M0VYeTE0QXVLZFRWazFJY0hJV2s4U1Znd1M3SFJham1INXdKQ1BVQkdpQmd5?=
 =?utf-8?B?Q1J2WEN5RnBBZkV0OThPcmhpeU1yaTFvVFRnUldENm9WcmtydlNSRVdCbjZq?=
 =?utf-8?B?RmRtN3dDc1l3alBJZG1HWTlJbW12ZWVISVluUXRaeTA3b216R2xVaHIxRWEr?=
 =?utf-8?B?aExJSTh4SHBZbkNCL2VmSGV0NEM1TmJvNVdqZ05TT3NpZHR6N1hxTnZ1aUxv?=
 =?utf-8?B?MTE2TkVzYTY5bE5IOXJ2L21Fa0l2dThVWVVjTHAzY050a2RCYVVqY1BvS3dn?=
 =?utf-8?B?K0NQZVFhb2hhYzNraGd3ZlRYSW03UXRrQkZvclZjZlBIWW1CNi8rVDJ0N3Z5?=
 =?utf-8?B?c0tWMktMejZlcjVNejJ2dDdUdVRyaitJcEdEM0tDZFVZd0VxelFFYkFtM2Rm?=
 =?utf-8?B?dkRDaTdDMnZDZnljZ3FTYnNHTGtpcVovVzhMNTdCVVNuUUJ4aGt3eHp5THAx?=
 =?utf-8?B?V2o0cUtLV0orczJWRS9sdHVpRk55Nk1YUEFkV2VjUGQ4NzAycndsMC9MbFVx?=
 =?utf-8?B?ZzNTd1g5aDNVaWRDVWZma2V5UWVxaUNGTW9uN2RqV0JDSG9CK2l1UjNRMHZn?=
 =?utf-8?Q?XuTaPaueb7lu1/hQE6+ezIGmcJRVdBPoYj4lgH7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDFka1lDSWJlY2N1NUhYV3RNY1dQK2NHRTFOVlErRjF6QWw3c2VjbkV2QWlY?=
 =?utf-8?B?Y0Z0YWkvMDJha3RpMk5qM0F1YUFnN1lhdVh1bzREWWhLOUt0dVg5S0pxWVkr?=
 =?utf-8?B?N3NWMU4wdHZRclkrVXh6YjFmTC9aT3dtRVMwRU8xeFF6TWxVUk0yM1R1OHAw?=
 =?utf-8?B?MXZHTDhRdWRTb1JuNTdVM2V0RkhIMHAvM21KQUErc1BpMGlLb3piNDZSWlEv?=
 =?utf-8?B?SVYzcnkrZHI3U1dqQkhtaFVFZStnQmJTOEM5VzNDT2tDem00U2IraG91SGR6?=
 =?utf-8?B?TnZtMnNkUjJ6bC9IbW9JeFR2c01FTWpzQWtFSlhJbXBabWJRRFJpUy9TZDdQ?=
 =?utf-8?B?cG1ITlVJNGhld2VFck8xTnhwcWNRQk5iQTlVVU5xVFJ3STJodmJiWEVDNGU2?=
 =?utf-8?B?cFNndFM4Q0tUR0l5Qy9jdDJUNDV3R1lVZ2JndkRLZHRTY0tjV0hySmE1TDV1?=
 =?utf-8?B?S2FLcWxDbmtvUzhnYVhDNCtnbnlVMndFcUd0cVNzOGlPMWFuZXlmMi9rTi8v?=
 =?utf-8?B?Qm90YnNIYUhxL0NLZkZremJmNGt2RnYvTDV5M2pzb3ZiVXI0dUI3R0NIZEVH?=
 =?utf-8?B?d1F0MmRMclZhU1l4MVN2UGdRQU9GUEhTRVBvdDNrZjNNVytMelVMd2kvVmxJ?=
 =?utf-8?B?aXZBTHBBc01QSWpTZ1dlWVQvdVkrKzhqWUx0Y0RtdGpWN2ZvV2c3b3BRbG1w?=
 =?utf-8?B?RlBzV3B0dGVDYlV6ZW5WYTBJY1pKQmtZUW5MbVRrQzhpZXBweGo1ci91ZENn?=
 =?utf-8?B?MTJTWERzSk4vUlNWT1VCVFViL2x5NU1EZjBOZW8xRDdrdWtMK0JNZXB1UEVi?=
 =?utf-8?B?ZmZKZkxzWEFYVWxKMWY2WnNRVmJHdXNXbVNuNGRYd2VEYXpaSkM3NDkxVG9S?=
 =?utf-8?B?T3lxMHV4WitPMkkyQmR0QmJOY1RhQkZNaTJ1VzZ3ell4NTN3N3RCWUtqRVNl?=
 =?utf-8?B?aWZ2ckVuRTVpVWp1N3A1T1hPelNjM2JNczEwUjZ5SWUrQ3Nra290TmZsNXZG?=
 =?utf-8?B?SzBjOXFUUWpRN08wYi9OZUJobm5laG84VXdiUVJQNFdZWS96YW15aGdDcWJz?=
 =?utf-8?B?UFM2Z0dOWHhvSTJsc1YwTnd1M21TYldVVWFjbkF5NkdRRDZURVF2UE1CejFM?=
 =?utf-8?B?Q0gwcEZuVDJJK3c2QTVCWTg5RHdwT3prZk1zTUVXWXhRd3oyQ0liYm10TmFF?=
 =?utf-8?B?bzJIcW1NQmZVYTJZcGdCRmQ1TzJiYXdlS21aY0Zxb2tuT3pYSEo0aTdGUXlS?=
 =?utf-8?B?T3NXVzlqekNHK2p6VDdHbGpJVm15RkJEYkVPMjZvUktMZnBkalRqN2lodUNx?=
 =?utf-8?B?YUQ0S2NOS2FxVUFHMzdpMk90VjFOYkRieHNSRU5qSG1pbzIyYWE5Q25iUVAv?=
 =?utf-8?B?QW1oYkVDMHB3Mk9rWWxGeWkzVXV6bWNoQ00xOHhjWTkvYjVmbElUdUM5cHV5?=
 =?utf-8?B?UWhncjdaYWNMNU5GMGpLT2NFblYxWkw4ZzJoR1FSZHphOG1ha0JUelJ2aWRT?=
 =?utf-8?B?aGhXcFZIME9WODIvNHFaL3F0bXJHL2VCL3R0UGlhdEQ1bHRJb3IzZjdycVZo?=
 =?utf-8?B?Zkt3U3ppSkhUWk1GSXcwZG9MUmdqc0VRMGpyREVhdXJCVXpTTlVxc3FjRUtw?=
 =?utf-8?B?QkpIWG56QVpDZjJ0a1ZLYzJHQ1VGSm5xcTQwSmpXNTZRZ1hXYVhxUGhCRGg5?=
 =?utf-8?B?ZGJleG04L0VvUXR3SnlVQWdRRE9oU0hEcXBLQ01wUXNNVm5kZnJpYWZvOVNL?=
 =?utf-8?B?c3JSQjg5eDRuc0VUYkxQSGNMQ1ZCYTMrTGZzUUxlMzBZRlRsSTY5M010WWNh?=
 =?utf-8?B?dnVwOEk0bVpYWFhFOGZyMGRuRjFkbCtsVUVJMGhuSE9YaXhtMFVNcWhpaU1j?=
 =?utf-8?B?WUFsN05kL1VpdHlMYUs1QThNT0UzWFRmd0tFejl0VDNsREhkNi9LLzhHYjM3?=
 =?utf-8?B?eFJKeVBKOXpYUHBJTERDYVh4Z0RpcnR0VXo3U0NzT05WM1M1cW83R0Q4MFBk?=
 =?utf-8?B?eG5qZHFpZG1DM214VFR4a29XR1FWNXc0SFVSUXlsZVNVY2lUdlowZnl4S1Ey?=
 =?utf-8?B?QkRKdzdwQjdIRWREdVhWeUg1dStHbExCQ0ZUQkVtOGZ5c0Z2TEhudVdrQ0xU?=
 =?utf-8?B?MGp1SGdnUlluVkhzazlycTc3WXBQd3hMU2grQzlBT01zUWFvcTZpZ09DWkc2?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd2660d-564f-476c-8417-08dcf53f2e97
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 21:51:29.4417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3w3Doj34VXuKQocdxUmMW4BEd9xbChY6yNytKjsKl0K+tLWVS1zE6MTurV47t9JQC7OsuKQ5GcORp6oTvw/lT29EpUVWWuMiRnl8jKsFifY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7745
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

LMEM is partitioned between multiple VFs and we expect that the more
VFs we have, the less LMEM is assigned to each VF.
This means that we can achieve full LMEM BAR access without the need to
attempt full VF LMEM BAR resize via pci_resize_resource().

Always set the largest possible BAR size that allows to fit the number
of enabled VFs.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_bars.h |  1 +
 drivers/gpu/drm/xe/xe_pci_sriov.c | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_bars.h b/drivers/gpu/drm/xe/regs/xe_bars.h
index ce05b6ae832f1..880140d6ccdca 100644
--- a/drivers/gpu/drm/xe/regs/xe_bars.h
+++ b/drivers/gpu/drm/xe/regs/xe_bars.h
@@ -7,5 +7,6 @@
 
 #define GTTMMADR_BAR			0 /* MMIO + GTT */
 #define LMEM_BAR			2 /* VRAM */
+#define VF_LMEM_BAR			9 /* VF VRAM */
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index aaceee748287e..57cdeb41ef1d9 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -3,6 +3,10 @@
  * Copyright © 2023-2024 Intel Corporation
  */
 
+#include <linux/bitops.h>
+#include <linux/pci.h>
+
+#include "regs/xe_bars.h"
 #include "xe_assert.h"
 #include "xe_device.h"
 #include "xe_gt_sriov_pf_config.h"
@@ -62,6 +66,18 @@ static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
 			xe_gt_sriov_pf_control_trigger_flr(gt, n);
 }
 
+static int resize_vf_vram_bar(struct xe_device *xe, int num_vfs)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	u32 sizes;
+
+	sizes = pci_iov_vf_bar_get_sizes(pdev, VF_LMEM_BAR, num_vfs);
+	if (!sizes)
+		return 0;
+
+	return pci_iov_vf_bar_set_size(pdev, VF_LMEM_BAR, __fls(sizes));
+}
+
 static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -88,6 +104,12 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	if (err < 0)
 		goto failed;
 
+	if (IS_DGFX(xe)) {
+		err = resize_vf_vram_bar(xe, num_vfs);
+		if (err)
+			xe_sriov_info(xe, "Failed to set VF LMEM BAR size: %d\n", err);
+	}
+
 	err = pci_enable_sriov(pdev, num_vfs);
 	if (err < 0)
 		goto failed;
-- 
2.47.0

