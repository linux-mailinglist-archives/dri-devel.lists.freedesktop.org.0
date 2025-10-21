Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB1ABF919C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 00:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABD010E664;
	Tue, 21 Oct 2025 22:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LTVFlpv9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362DF10E663;
 Tue, 21 Oct 2025 22:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086674; x=1792622674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hi/CJKUTLkLM0LObRwI6n0WFm4zxr7PwmdMtTQR8Mgg=;
 b=LTVFlpv9AVEUwzV5H5/aCP1x7cA/rnWKSIzVXVAm5wCe5i/2ddCkvO5+
 Yp5KqAfXGt0HJmOtxKWS579YinuUm+VKBYpjL+GbpwXSYjWsA7RW35Vuo
 6vFo/JyuZEd1YVlvgf84HHwioX2VOflKd55tNjPGql9mMfT4DykeP6ISf
 XWrdb4kg9UEVkJw4tzzStfyYSVXOMSYHoeDkVYjT0VMMZR7mbbxw6x9oz
 XfuI2gQait6oUPV7INCciA+tZPOX84q0K6q1uda7qkkA/jm0stphEKdjR
 r4P5WXWhv3vSCxJLjjo7aOBvITHUBPAiwhT8Nr6ThYg9IMaPj4iMq7iin A==;
X-CSE-ConnectionGUID: SCG8H5rOSXGtJekuNUqI3A==
X-CSE-MsgGUID: kkJ23jYFTwG7ZXoRFtn//Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74344510"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="74344510"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:44:34 -0700
X-CSE-ConnectionGUID: Oz662L+fTcqHTPEFvF1d9g==
X-CSE-MsgGUID: zbZ90+qzSJqPYK9YcsLOjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="183410472"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:44:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:44:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 15:44:33 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:44:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/YkjdA/x7XNMMFBPGQ+rHtv6oBXD76OgLTVLodkSU6RGbX9zVn9ZeF5l1JjFJETJW0Xe0h0rp08t5Yi+3DU6SxL4HLDdLD1+M4/IRu5rjAPVG/Hz/Tw0xBbHrJdZ79/ISOz+U0Fc4fuH//PQoYspu3nTJ3Vmfc1REanQe9UxzmLTJsAkIyNw/V45Qh3tLnj0iGFvpJ21v5YyCHrKQgFpRzRYKcAYXH0V/Js9vvAjhpCacTCerF9sZP9KLTl+oneqAnmt8M7zpql3hmYwL+X1nFc0udAi+iNHLJuTwBAmGaXuTHQSVCs64D6/YP8KDHZDdKtMLyoX+vSeojuLWLZhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMEDbKZcqzbL87dAxLN0IdWLK3HRmS7RLOS0wSlhJ8g=;
 b=AJ7a/I3R+o5egAmDFsPGEq9CxWICmK6E/f1sYTwSL/B3W0b+7G4NNTlLeg8hQ8gnmebAe6bIumZEzn1bbuEmWJU51j44vXGz67HiVEG6n7Pr+QNOEGAOsLRRPudq4uDKoh+WmMSazrqID94nHeiOGfnPPk2whK+vh8C4sXkWB4C+zfA/4cPkitHEuWewBNpoMahIzhe8gGTw2yy3xjNH9K8aKN/pTVREJcAxSdycO7PfYb7rC9BBiHAfMMPyn7ZRuCQ5PjG7suXirSDwCIQ4STGfcG79EFZC6t2rDGE3WXsRocosT7NynDCZrusbFi37GMm8O1BW4QcmrwZJdlwYOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPFF28037229.namprd11.prod.outlook.com (2603:10b6:f:fc00::f5f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 22:44:30 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 22:44:30 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v2 24/26] drm/xe/pf: Enable SR-IOV VF migration for PTL and BMG
Date: Wed, 22 Oct 2025 00:41:31 +0200
Message-ID: <20251021224133.577765-25-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021224133.577765-1-michal.winiarski@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0301.eurprd07.prod.outlook.com
 (2603:10a6:800:130::29) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPFF28037229:EE_
X-MS-Office365-Filtering-Correlation-Id: 17bd288e-847e-4ddf-4db1-08de10f365ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjQzRWdiUlZ2dk5EWDZ2QldjWS9qenZmQnRZa0RnZ3ZjSE85enJaQUUydFJh?=
 =?utf-8?B?c0hmWDZwT2tncllwQlg3U0RMTmw0dEhoVkdvQ1d3OWN6d1FFbG9qandrcmtN?=
 =?utf-8?B?UFIrbWtwUnFZNzV4YVdmWlhRQXFhendhV3JubjZTVlUvMWk2VDJadjRxc2Jk?=
 =?utf-8?B?eU5qOFN1ZXhuYzZGUUhDeVpFdW5hL0VueGMzTEk3Y1IvTXRqSW93WVMzdEQ0?=
 =?utf-8?B?QXRWRWVDU2ZKcThNOW5iSWJJMmNLSloyYUh0ZWloQUlDb3ZGWkQycEtJOWhv?=
 =?utf-8?B?ZFZZc3RNU08vN2FhMWZJU0VaVXgwVGVZV0RZcXZGbXZsU3hUZG1NK2lvbm9O?=
 =?utf-8?B?RGE1VUpDOXYrWDRjQUpmMVRzdDh2MTUwOTBzZW11MkFZSkpUNGZBYW9UTDBU?=
 =?utf-8?B?MEpneitZa0dWcEMvVG50MTNFUXl3MHFBVDZnSUIwanJaVGxWQUxSRXJ6VUhD?=
 =?utf-8?B?dVd6THRlc05NbnhBUm42SGpzOTNqQkRFZk4vNXRKWnFIVHlqa2ZHY0U4Qk1s?=
 =?utf-8?B?VnY2ZXVPekV1M3BnZE1tUnhPZTlPNmZKZGYzN0pZRHE2dUhuVDJVUlkyT1Mv?=
 =?utf-8?B?ejNFUktJUHNWS1VSeVVRQWNha3A0TXhJQVNlZnlHY1QxazJteVQ3NlZ6SkJi?=
 =?utf-8?B?WjQ1eTY2RGs1UTJGUm5Yd2NYVXArd0dBdnZMa1U0My9ONGViWE9td1VRMlIr?=
 =?utf-8?B?RkQxSjk3dzlsTVArNCtkRnpIMFdyd2RUa1hiTGhmUUpDTVZib0F4VG10V2pS?=
 =?utf-8?B?Ym12ZVVvdTdwTW5tUDFsZzI5dzlwS2REM3VTTUVPM0pQcCs3ZWVXTG9ab0tW?=
 =?utf-8?B?QnR6ejdLSUVBdEs3cWRkaHk0eHdBZkNEQ0pMYlNOR3VTUzBSM3V3L01zc3My?=
 =?utf-8?B?Z1Q2UFdsMEI4SWRMdW5UNW1KZHZRbWF1bzdtSFNRamY3VUpMeFlzT0ZsNUsx?=
 =?utf-8?B?MVEzajdGWWFkTjU2RVJCcWFPZmhrKzJzdkJKNVhpNXh4RGE4d3BsTENQbUhW?=
 =?utf-8?B?Y3M1OUJPQlpNd2tYd3E2L2FoTFlyQ3BuT2dnei9BdWJtZnM0cVd0Kzg5cDRn?=
 =?utf-8?B?ZUdpeFNpdHpZYndOU0swbTdJbng2VERrZTZLYncrQlExR2N2b0tSaWZXU0FI?=
 =?utf-8?B?b3JnOGZVNklQaE9NTVZ1NzZ4bmlaZGxPOGw0ZmRPYndkUzloQUFMY2pwMTk2?=
 =?utf-8?B?NDdKTXI4czQ5MkMyL0VUZ3g4c1dzTTRnbTNsSjVqK2x5L2Vhc1FyYWsrdEZr?=
 =?utf-8?B?clRud0hWaHBoRmc5T1lva0VCZWhMN0kwQnloc0RYTGhjLzYwbGxmS0JXM2l3?=
 =?utf-8?B?dFVuRHpOazR4c29HcElTaFZmaEk2YVJqUnNocHJLenRJdWJKaGZaUnYwVzlV?=
 =?utf-8?B?Ukg4WFErWHlaVSs0WDNRQ0ZSeUxpQWx5cWV5WnBJZWlIYkxHMGhaQnNyZjFy?=
 =?utf-8?B?bTZEZmFoVldRSmluSEVaakd4REwvTFE2c2tETkZuS1dSNTV4ZlA2dGdmSTFw?=
 =?utf-8?B?OVVPWGZOTUNCRnczOWUvWXJkM2FjZk83eC9pZmNCeU52LzQvVDRnbVhtaHJw?=
 =?utf-8?B?VVFoRjQyQVVtRXlQNkZyUUJqQVJyWEI3bUt1MVJxdU4yZkdXSUNpTG0xUlUz?=
 =?utf-8?B?aTVCWjZQQlZJZjN2WHVaY2VrVklsWENLc2wrd0NuaW1ya3lqbEI1SFlQdHk0?=
 =?utf-8?B?c1BMMTZZQzIwaXloeStPQkd5Rmc2c3ZxMnlBbjJwZWZrOHZHTExrUUhnd3Jt?=
 =?utf-8?B?U25PdkhFZHJadVM3K29Mb2hPZDIySTlkZm1jWkRSMWpRSTdJWEgrcC9EZGpj?=
 =?utf-8?B?cWRqWmt0eVd6bFdYOS9GOG1pT2kxR1RURk1pRFBDRERYTkdnNTJuQUwxYWRQ?=
 =?utf-8?B?WlpOeUsySUR3ZVQxcS9CVkY1U2JWaEpRQjVqd1pMcEhnQTc0SnBYZ2I1Nk03?=
 =?utf-8?B?dS8wQ3gxUmZPR081MDN5UVduUmFKVFhKakdkK1pSNFRocDVCUnB6b3c0QjN4?=
 =?utf-8?Q?0XJ3BL0T69ZQCIdx9YuxlwjTQ4FYWY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWRPdkxhRjdqQkxPWFZaME9LcmVBZ2taZ0VLcWEzcjdNUnJhQjlLcERKOVJD?=
 =?utf-8?B?dUVMdnRmVE9HWllCK3VBcHFlK2NkQnQ5TGNLbU9uMXhvMncwMXQ5SUJmVW5D?=
 =?utf-8?B?LzQ1UGpDMGRta3JvV3FiRWNEQlJrZFRNb0dJYWc2RHlQRW0ybFVyeHVUSXNy?=
 =?utf-8?B?dFAxWDQ3OS9TclM2RGh4U3FheTNERmoydUpDd2VVMkJIRmhSeWlOTG5UVWF5?=
 =?utf-8?B?bi9aZ2FZeWhFdVh0L2lJRHFaL09OTDZ4K1N2alkxdlpTUXplL2RwZ2pieGhP?=
 =?utf-8?B?QzBUYzBNU0NnWjFqU2xTREMwbDNrdVVqWTcrdWdMYzRDeTJKUDRibVljR0xr?=
 =?utf-8?B?QkxWQnJ3Z2RXWTZORHgzRi96bWQ5bVFCL1VzY2pId0YzMThJSW0yMmNkNjJL?=
 =?utf-8?B?cHdMWDE3KzZaakJvSFJvbVpsNGNzWkp6VUgvQ2ZUSDBDdXR1UElMZkxySDcz?=
 =?utf-8?B?Tnk1ZlBZZUd5R3JRR21DMjVOK1M5M1h2bXNqK05XaXJGN25GQmRrdiszR0V0?=
 =?utf-8?B?bmZOZVJZUWttUnErY3VTOTZjMUgvVGtWNzJmRFdOcjJNQXN2cXkwNVNGWVJF?=
 =?utf-8?B?ZFJUOGZKYkYzeE9nZHNZUklLQkFuMXNnSDBDRVJFNUlUaGV6ZGJGR2hyMFds?=
 =?utf-8?B?Z3JJWWRBUUZOS2JEc1ZFVGhBTlg4ZFROanF2VkhZV29sdnZZRW83dW9YbVVO?=
 =?utf-8?B?UjNwdmxzTkRWdktYNlhUSlIyQXdXN1I0N1o1eXhlT2NuSHJJZk0rQWV5L3ZE?=
 =?utf-8?B?em5MWUk1M3lwdlIvandkK1BoMHRTR1JncUdTOGNqUklMc2pIc2dXa0hZUmxo?=
 =?utf-8?B?OEtJdk0zanBsdzNuaGZMUVJkaHNEZEpZS1NJeDkvd21OdlN5c28weFJKdlFC?=
 =?utf-8?B?NFhjQ2hvaE9Udlo4WmxpNlZkVnFjMVN5cHZrZ0xDT2hEV0kvM3dKQ0JwQy94?=
 =?utf-8?B?MG1kdHh2Sk44Uk8vT0QxZkovTXN3S1l6SDlkR0hDRGs1L0dLdVUrakY3elJS?=
 =?utf-8?B?RkJEeDlhZHJTazZ3NWl5RnFIREQ5THh5YTN2dit5VUlnZGxIZEhwNFhldmph?=
 =?utf-8?B?T2ZhcFRNMHZUWjMzRUJQcmQ2WjBIV2JlcDJQN1RNSEt0aWJzb0NPd3YvdThj?=
 =?utf-8?B?Z05PQUcveDdCbFJteDQzM1ErRkYwUjdQSzNzNFF0MjVieHcxSml5aHRrbWlD?=
 =?utf-8?B?OGZUckc4OEtVbElKS3RUTHd5bmEzN2R0TUlDdVFFci81M3dBa0Rkb1hOQzVm?=
 =?utf-8?B?eTV3c0tOT2FpUlI1YlBTdlk5VnlMTWQrME9wSkpFUXdBWEJ3TlNpTHpNS2hv?=
 =?utf-8?B?dVRLU1FKaFRBQUdoeEFkY1hMV2t4MUJhWDlKQlFXYjBSUmlTd3lFb05CT0Ur?=
 =?utf-8?B?eU9PTkQ2blBXU2k5Ukh3QUxLbEVnMjlMa3NWZVVJRjZtcFdXVWlETlFrRHZE?=
 =?utf-8?B?NFVtQXhEWko5NUNiL2tqSGxuYkE3Vysvd0JxUU5PUk5QUm1mVGlwQzFFeHFC?=
 =?utf-8?B?YkpoVzVUeGdWZUd1S2gvT0xFSGRTbkZjQXdSNm1JL3JFeUdVZkQrTXFFMWo2?=
 =?utf-8?B?bGZJdHJaWW9veW9CM3cxUUxycG1yV0J6cEM2RWFXVTQ2Y1hrdkt5L1lmWS96?=
 =?utf-8?B?WGtrMlQrQmVRZncvdjQxakRGdWpXQVA2SDFVeVRnZTFQOXVod0ttUEhPZndB?=
 =?utf-8?B?ank3bUlVV3E5T20wWi9CZ2gyWTgrdU45cmZTRDBEM3crS0FPa0tVOVdnOWpu?=
 =?utf-8?B?N3BFalZhTnpMK0hYdmRBOEdkaUFyaTFMRy8vaW5SYVZmaGx1Z2xzd2JmYW9O?=
 =?utf-8?B?ZU5wM01yZkpSSDRvdGp3TmdGamRodDdHYU5WbUJwb1J2cGptQWtYNm51ZDQx?=
 =?utf-8?B?SWJjL2F3c0dHSFUwRituQUQzY0VSdWdDdHJqVkx4Rmd0TWJBRGNlYlJ1M0hh?=
 =?utf-8?B?TDRxUHZUZ3FGVXRnOVFkdllud0hEVHFBL1lUcGZXZmdTb2VKL1ZDNnV6OUVL?=
 =?utf-8?B?UzRBcXpNRHlOeDE5Mm1UM2k4OTc2M1NybzVJZjVMWGMrUjFCM205RTh5Nkkv?=
 =?utf-8?B?ME5lakdDQllRNWtUZHpmLytSeXJIZDhyaktmSk45RG1YQmZPbFJqSjlyR2w3?=
 =?utf-8?B?bjhISTc1VUNaTk11Kzk2ZVhGSk9Md0JZcXJUMGI3cU1nNDBjb2VGZDhHbk9C?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17bd288e-847e-4ddf-4db1-08de10f365ca
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 22:44:30.6665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +PyScBYnmX74f4qt3Kp3x1ZIyfc3fcTixo0re2FJXd4V+pCBuLgPyDrf4kMzWc7nIEFRK5Pg606bFxESrwETTKh3nDySJUUHy4jKLQk+/wc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF28037229
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

All of the necessary building blocks are now in place for PTL and BMG to
support SR-IOV VF migration.
Enable the feature without the need to pass feature enabling debug flags
for those platforms.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h             | 5 +++++
 drivers/gpu/drm/xe/xe_device_types.h       | 2 ++
 drivers/gpu/drm/xe/xe_pci.c                | 8 ++++++--
 drivers/gpu/drm/xe/xe_pci_types.h          | 1 +
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c | 4 +++-
 5 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 32cc6323b7f64..0c4404c78227c 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -152,6 +152,11 @@ static inline bool xe_device_has_sriov(struct xe_device *xe)
 	return xe->info.has_sriov;
 }
 
+static inline bool xe_device_has_sriov_vf_migration(struct xe_device *xe)
+{
+	return xe->info.has_sriov_vf_migration;
+}
+
 static inline bool xe_device_has_msix(struct xe_device *xe)
 {
 	return xe->irq.msix.nvec > 0;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 02c04ad7296e4..8973e17b9a359 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -311,6 +311,8 @@ struct xe_device {
 		u8 has_range_tlb_inval:1;
 		/** @info.has_sriov: Supports SR-IOV */
 		u8 has_sriov:1;
+		/** @info.has_sriov_vf_migration: Supports SR-IOV VF migration */
+		u8 has_sriov_vf_migration:1;
 		/** @info.has_usm: Device has unified shared memory support */
 		u8 has_usm:1;
 		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index c3136141a9536..d4f9ee9d020b2 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -362,6 +362,7 @@ static const struct xe_device_desc bmg_desc = {
 	.has_heci_cscfi = 1,
 	.has_late_bind = true,
 	.has_sriov = true,
+	.has_sriov_vf_migration = true,
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
@@ -378,6 +379,7 @@ static const struct xe_device_desc ptl_desc = {
 	.has_display = true,
 	.has_flat_ccs = 1,
 	.has_sriov = true,
+	.has_sriov_vf_migration = true,
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
 	.needs_shared_vf_gt_wq = true,
@@ -657,6 +659,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_pxp = desc->has_pxp;
 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
 		desc->has_sriov;
+	xe->info.has_sriov_vf_migration = desc->has_sriov_vf_migration;
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_mtcfg = desc->skip_mtcfg;
 	xe->info.skip_pcode = desc->skip_pcode;
@@ -1020,9 +1023,10 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		xe_step_name(xe->info.step.media),
 		xe_step_name(xe->info.step.basedie));
 
-	drm_dbg(&xe->drm, "SR-IOV support: %s (mode: %s)\n",
+	drm_dbg(&xe->drm, "SR-IOV support: %s (mode: %s) (VF migration: %s)\n",
 		str_yes_no(xe_device_has_sriov(xe)),
-		xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
+		xe_sriov_mode_to_string(xe_device_sriov_mode(xe)),
+		str_yes_no(xe_device_has_sriov_vf_migration(xe)));
 
 	err = xe_pm_init_early(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index a4451bdc79fb3..40f158b3ac890 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -48,6 +48,7 @@ struct xe_device_desc {
 	u8 has_mbx_power_limits:1;
 	u8 has_pxp:1;
 	u8 has_sriov:1;
+	u8 has_sriov_vf_migration:1;
 	u8 needs_scratch:1;
 	u8 skip_guc_pc:1;
 	u8 skip_mtcfg:1;
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index 88babec9c893e..a6cf3b57edba1 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -50,7 +50,9 @@ bool xe_sriov_pf_migration_supported(struct xe_device *xe)
 
 static bool pf_check_migration_support(struct xe_device *xe)
 {
-	/* XXX: for now this is for feature enabling only */
+	if (xe_device_has_sriov_vf_migration(xe))
+		return true;
+
 	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
 }
 
-- 
2.50.1

