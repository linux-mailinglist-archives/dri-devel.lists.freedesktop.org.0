Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DC5B1B9B2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 19:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A67510E288;
	Tue,  5 Aug 2025 17:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YMQzHV2c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D06910E233;
 Tue,  5 Aug 2025 17:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754416684; x=1785952684;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Ipop5ExmbvgZHmJJ7QxJBEYAsy+vYLchEvIh0Fc+2gA=;
 b=YMQzHV2cycD7OJ+N1J5hMbNgbz4/75qy4EF+MTfTxmXHhVQljDwfp7MY
 ZVbUTDfXcQ6uTlwbD6vlEuYoFpX2jgVNCXBw11doCReOu+lVpJe6oMZcX
 zQrogIWIgOIItMPg8jNedJRmDj44Bvr/cuO6PtPHwwG4QDM+jHWtLb+jA
 RJ2/PYS4YInKv2vN5x/kKQvIFdR3FAva41HhnvYJ5Z+mPdBmcUePVqzUB
 W7GafBokqqR76LkGJdNyd+njV1vnYp2AI/DC3T7QPnfpFBeLYSCilUiUV
 x8nXFZQ24wUxmW843R4ASgZ0wX07/dphm5cri4jZd+m6W1GzmEkiFGgxH A==;
X-CSE-ConnectionGUID: /bAGrgnbSyWvHPEuO1mkXg==
X-CSE-MsgGUID: duPNk/ojQ/WWoWYJLKeTjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="67315677"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="67315677"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 10:58:03 -0700
X-CSE-ConnectionGUID: zHLO8vnzTGWPgzZEZ7RLIA==
X-CSE-MsgGUID: /KhtUCNbRSmvMBB5N3AdgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="168805833"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 10:58:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 10:58:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 10:58:02 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.85) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 10:58:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hH1QpufO5vtOGxp9k+a7X0/7t8ruUlgD35y+FD1lGhhtVUKC7jnC2XvdzLXVuoV/ZCUbHLxOoEmvZmDsqXArTOrlaRQP/zJBHZhab1VuaYqxp1aj+l3SJIjpMdN7+8x20yypFFHk5R5G/2d286TVQrB386e6EPTTYru/+k1Sl3sIl3RLrrVeKTxnjEQPeH4CwWtP5tR/SgMi2h5WGMBtiFBwR+EioMw+DGl0HIxJealcbkcqkIyecTSfwte+hWMw2jgnpCQaRDv+8ntXr1dEpWDGFgUgf9xabQCvDeCbYiDzqlhYPK1if4yDOJhV0UNi5GMvPkL3eZxpij5uxQepQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zQ7kFyyb/tPRViYIZu+C63FaRyRk0jGLP5crXANvM0=;
 b=ARHsYuX2CKJB45n/lkaLP9R3Qxc9MdY40rpLjgkErtrQiK/fX7JLsxwT4o6ZEaCuh1/D0QKSwJasPTSGnHI9D1fa36KzfrZgSuFZOrvAbEkSk4AC7oRLtRlXDh6Fx+mD1aKmLkyBVtk/GEjnSBplApL807t1BWRuYHVc2Mr8aZKu7UsqMakdXOO/Uv1kpO3NPcCj+Es+lpTegRK93sSxfvDQ5ZZaMueARh1IIzXKMTb8ZOkfCEH0bCeyz8GWq31+z4vU+8PnQ+yMmPAVUZiX6dUxqkKBxf5corM+dnHATa37GA8y3IcUJCyBR8OKgjRG9xjy95mnUk9EgkXsdbOMkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by DS7PR11MB6152.namprd11.prod.outlook.com (2603:10b6:8:9b::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.18; Tue, 5 Aug 2025 17:57:59 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.9009.013; Tue, 5 Aug 2025
 17:57:59 +0000
From: Imre Deak <imre.deak@intel.com>
To: <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Lyude Paul <lyude@redhat.com>, "Danilo
 Krummrich" <dakr@kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 "James Jones" <jajones@nvidia.com>, Naresh Kamboju
 <naresh.kamboju@linaro.org>, "David Airlie" <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>
Subject: [PATCH v2 0/3] drm: Fix initializing format info in drm_framebuffer
Date: Tue, 5 Aug 2025 20:57:49 +0300
Message-ID: <20250805175752.690504-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0330.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::35) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|DS7PR11MB6152:EE_
X-MS-Office365-Filtering-Correlation-Id: df8900fe-cb7f-4b16-5d1b-08ddd4499d6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0VBR3NFMnRYTEFTOTdCZnVVZjFZRVB3M05Ld1RoNmJ4SDB6amRGK09YcTBa?=
 =?utf-8?B?bWJXdERyaTA5bFZoMVRvcy8rcFlYT0pDU1Rac0JhWnBKYlVWdDJ0YU1aRDF1?=
 =?utf-8?B?VlFZc2dXcmIvbEhiWnhBWEVrMnBUa3BXSTNBd0N5K0J2Z2VGQ1A4Rjk4UEdU?=
 =?utf-8?B?NDAxSDJzbk5tN0oxMFZ1TXkzMm5SY3E0SGxadW5MZVd2SllRRUs3NWdzd3dG?=
 =?utf-8?B?dGZncVBNellMYU8rbEs2dWJ0bEtYUFAydnZ5S25OYUsyNzZyNFFYSlJ1d0Vs?=
 =?utf-8?B?SUlxb0FMa2VQMDhyR0NTWm9CS2U0WVU1TG0wcXcvOGsxOXQxdmJGdDkvbk9U?=
 =?utf-8?B?bCtIRFQzNXExZlVuOC9PdW8zQXRhSkRFV2ZqbEx3QVBVM1k5R1ZpMjB1U2t0?=
 =?utf-8?B?U0x1NzVCbGxhMWwzclp6Zk4ralhITW9rbVZLM1oyQ0h4OWlXT3FSNjR3Z2NY?=
 =?utf-8?B?MFl5aEFYMTlnTU8zQVRmelpyR1prRndhZ3VIM1VhU3dtL3JtZFplZ25qV3po?=
 =?utf-8?B?M2djbEZxd3hwci80MjJFVi9HM2k3UStGZTRpTk5ja2FSZjZUZld6TUpkNjBq?=
 =?utf-8?B?OVBJQWhlRVBrMUZqZVcwUDR1VHZtRDgva01udnBhM0tHbXhkdVJ5MjVGbWpU?=
 =?utf-8?B?WFZFQk5rUHh1WmdjaGtBbXVoamVlVEUyd0NtOU5sU0xWLy9lTkJGUmJQSnVJ?=
 =?utf-8?B?Yk1IcEpMaTliYjl6S3BpUWhUcGZvb25PM2VBTWdaeldqeFBxd01TK3VzZzI2?=
 =?utf-8?B?YXlBc3QraXRmUElVYytIU2pGQXZNdXhqK25MNkYxcGRjNmlpeUtpMVlkUHIy?=
 =?utf-8?B?YytOSFlLV3lVYTN0aHN4L1dsTEdHbUNaR0k3Y1d3ZThWUGxjaVA2SGx5WTcr?=
 =?utf-8?B?ZHFTZVZ0NFdUNXd6MzZwcUhrb3l3L2MyWEhDOVNSdUVlVkNuRnNuMkltdjBQ?=
 =?utf-8?B?SXQzZ09WcjhVY1VxQTNOUE1FT0lqQnJyRXRuNGZwWnZwOUFNckI5N2ZDbkZx?=
 =?utf-8?B?SHRlams1dGpiUHBlb2E5UFZlTzAwQU9GNHVodHdja09RaUNlbEZiQk1DNTd3?=
 =?utf-8?B?ZmJZdytnbnE1WWhYQlN4ZnIva0ljbnZaS1BqWW9PQVM4UWY5NlFxT09jbjc2?=
 =?utf-8?B?WFlESGV2QzFIR1VJdTIvUGRhMUkvT1poZTRpS0lLUDczOHN5dDJ5UUNFNDZZ?=
 =?utf-8?B?Y0xhMmZtSnViSTRnLzZIRnEwelVMLzk0d2QxVXRvUzkrYWF1ZTJqNGcyY1pZ?=
 =?utf-8?B?QXh4MVZJUmQ0M0c2cWxZVGczTFQ3eVJ0ZExRR21ESDV2RnRZZ0Q0dVJGeHNo?=
 =?utf-8?B?Ui9sZyttR2lyWnB0UmphbldpNFprWVUwWW16amFqTEVIMm5UcEpHL05VSU5B?=
 =?utf-8?B?Wlk4WXBCd1JDYzFEK3JnZDlxcTBWTUhnb0NQdm1mVUlIb01TNXlPRGJBM1d4?=
 =?utf-8?B?N3pYaXdROWZuN0svVzRLQXpQNFFla1VhR3lnRHJjVUtBaFgvVStUdS82S3A5?=
 =?utf-8?B?WmFaNWFMaG8yK1NzMUIrUWpGdUZVcWxsMkl0QzFBSXprQWJIMW42UGFXR0Ew?=
 =?utf-8?B?TFVxckt1UWtZV1ZTcGdZbWxJNGJNbXF5L3pXbkhyV0N1eTZrV3NLOGc1emFC?=
 =?utf-8?B?UFpHOW11VldoZVB1TnQ5R2xod0dxYnlJZ0hpbVh6TVNaMFo3akExZDRqRUxk?=
 =?utf-8?B?dmNKZGUzZEZGLzhKQWxycmJienA5NlM2MGhsRmNZNlFMTmRTNjA3eDZwMTd0?=
 =?utf-8?B?ZXluU3hmKzJvSnRZUS9hWGJPNHh2WHdRYmxvQzlWRG1ocWd5NEZtZmJDTkV4?=
 =?utf-8?B?MzIxVGZ6WWEvT3JrOTdpSTRTUWpkY3lscE0xS21PYVJ2cTY1TWJaMDBtd2dH?=
 =?utf-8?B?WVArOGlwdGVaQTZld1NTTFFOMXVLVlE5djlwaHJQMzVxcUVOeUdWOTVkYWNq?=
 =?utf-8?Q?+924MZxmLdU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlBFWUdhZW5KU0dHQm5zbGpXOWYwZVRTU3M3YUExV1RRbEpxVzU4S0JqTDZq?=
 =?utf-8?B?VVJCTnROZStKWmpXK0p3TmtPdlA3ZjBybkxHZmp6Mmo0V1E2NDZ6MDRvWS9n?=
 =?utf-8?B?UlZlZjROUVJ5bTRxOE1rckQxTjNaS25MTXd4d1g4bTFLUGhveTFsNG5HREgy?=
 =?utf-8?B?anptTlJsQW9GWVVaUXg0azhhRWxTRkYwUjEzanRQUnZpaXZhSXhiTlMwYTg2?=
 =?utf-8?B?VEJUNVY3ZUpEVjg1elVXNE9PUFlKL2Z4Z3krQnp6M0pQcWUrb24wRlN5aTJB?=
 =?utf-8?B?ZDFhdHZ1VXdMWitDbEdpYmsxbnU0c05yeGNOVmE1UkYrL0xqYlJwbzlwL1hi?=
 =?utf-8?B?L1FBeXFWblpFSlRMWjlGSXpQb0toUGlzUW8rY1pWQnJWSllnZ0w2QmZ5K0Rz?=
 =?utf-8?B?UGFwRVRSdTRpOUZZblhDSmFwQStUMXFPS1dUOUtoZ3ZFVEd1TWFJMm1ZSmZC?=
 =?utf-8?B?UVZydlcxUXVoQWs2Y0hMbmdDOU53K3pBYzRvY1J6eEtURnR0NHlrTE9xUDBQ?=
 =?utf-8?B?UDFGZkIwV0Mrem12UGcrOEx0TzF3cGY1RXhYVnJvbjFtbzRUdzBhZHcrUUM5?=
 =?utf-8?B?N0RCRG53WXlMYXpuMllySitwc0VSR3BSVkFnU2FyZ3dHYTVOVFZGQVJLZEdh?=
 =?utf-8?B?ZDk0QkE0ZVJ6YWtaOVI5OHNSM0M0TzZvUXg5WHJkeDFYYkV2Q0FSbFowSkFx?=
 =?utf-8?B?M2tUQ0t0eUQ2cVdvSy9hM3g4cnJVa0lhc1dVeHRBUG9FNE4yTDY2V1paZFUy?=
 =?utf-8?B?ME9YNWI2R0JhMmMySmZLODVaYUFJRjdaVnNwSm1iL2J0SHU0NlVVYVptelFB?=
 =?utf-8?B?bk5PQzJVQWR3VTh0Y3cxclBPRmhZYk1tU1JSbXl3WTQvWHNIejVwRE0yRE1H?=
 =?utf-8?B?L3JXdHJucVFVY3hWaGJFSWhNVlJUNUpWOFVUSU1UZFRiVTl3YlFBRkZuOXZx?=
 =?utf-8?B?eEhPYVJqWWRQdVRkYXVmYUlFUnFYREwwRTRMTVlidnJIV2VQOXZKaDVycEV5?=
 =?utf-8?B?MEllOWU2c01KbitRd25pQWtGU1hQTXpHMkhSOHVNcElzelM1U2E3aUpDWE8y?=
 =?utf-8?B?ZFUwMGhFb2c5cmUycnRMc0lmTDNPeFZCbXllMVliRWY3WGpzNEVlZUxidFpG?=
 =?utf-8?B?a2FOdXBQdzhtRzk0SXJvOGl5VkVrRkhZYkxnOHJBZVdoL01PQW1xckJaelYw?=
 =?utf-8?B?amRsRjFWaVBscEM5OGNSY0hCdkV1alNtMGpoSU9TNkVmSWIyLzhkdk4raDNy?=
 =?utf-8?B?M1MzNUEwcXFEWklKdDdZUVlUREZVMnE0RVJTSW9qS0lPN3hRSnhKdEhscVBR?=
 =?utf-8?B?c1ZYRTR5ZkVYam1aU20rYzlhRXVuL0JKYUhqSjlaZjcyTU5yelNwTmk0ZmJM?=
 =?utf-8?B?TFIzM1orLzRVS0w1Y0hFNm1KTHpEQTZ6bTFWWlRYNVJIUUVnNEZqRnVpNkJn?=
 =?utf-8?B?OXg0UmlMTjlTays0UWZVWTdMdmFuRkJ2V0N4VVVnbFZvWVR3RUx0M1E3NVM1?=
 =?utf-8?B?RTZNTHZHakhKa1dNSWhWL0JUUE0vaVczd29XQ1BaVjgzS1ZVeUFmcis1Ykh2?=
 =?utf-8?B?L3JodWxWdHRjTEl2WjRVZDJnOEJIYnFtYmZjYWl3Y0JjNEFiNHJkY0dQVFlF?=
 =?utf-8?B?cmZSalRNR3NjRFllaWcvTnZlVkdwakxqOXNaVlF4TEtqMVJ6Mit2YTI0OFln?=
 =?utf-8?B?L1J1VFl2RUR6WlhtbkFsQTh0UHEvQmFUblZZeUtSbng0U2JDQitrOVByUEcr?=
 =?utf-8?B?MXQ2cmJDcjl2dm5RVHhRQ0JlUTN6WmlvN2txZENmbHcyOXU2Q25TeHpvUVdk?=
 =?utf-8?B?T3g1ek9MVFJITjJOMzZvNVlKVFdQb3Y2SWlickgwL1RvTVJrUjdzR2VaTDNV?=
 =?utf-8?B?anpobjdYZjJIQ1ozZGtLSXA4ZmJZaUxtYWZRbi9GWklSRDFoUFp0NGZLcUJY?=
 =?utf-8?B?cE4xUGpzbkh0ekgzMXNYZWs0VU1VSkhpUXI1SWF5QUQrQ281NFFjZjA1bVFl?=
 =?utf-8?B?NUJMR1ByVmIzWUx4ZUV2UkMxL082SHIycUZIam5UTUE2b3NwMldIVEk2K2h0?=
 =?utf-8?B?U2t3eXNYQzA2M1NsMFN3QXFkUUdMMml1dEdqODlkejBuRmFyeWMwSVBpSWZS?=
 =?utf-8?B?RHEybXl5VVN4SnJaRHhnSWp5SlpTQTNBdkdpeE1yU0VTUEgrbndtaUFDdXJK?=
 =?utf-8?Q?N7YRWOYsdlwHP2iqnIVrAcktqqZjUIbXR6/T+GJDEg2S?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df8900fe-cb7f-4b16-5d1b-08ddd4499d6b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 17:57:59.6838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4BYsPHw0jWmh62uLa7YJ/7eR8nGX6lnqX57gOsoqDTud17g/bhwnxwjxcg7aLv0toQ+WwoRYUtg7+7XF3PL+2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6152
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

This is v2 of [1], describing in the patch logs the functional issue the
patchset fixes based on Tomi's feedback and adding the T-b/A-b/R-b
tags.

I would like this patchset to be included in the v6.17-rc1 release, if
this is still possible. One way is to merge it to drm-misc-next-fixes,
if there won't be pull request from that branch any more, could the
maintainers suggest a better way?

Thanks,
Imre

[1] https://lore.kernel.org/all/20250728101603.243788-1-imre.deak@intel.com

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: James Jones <jajones@nvidia.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Christian König <christian.koenig@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org

Imre Deak (3):
  drm/omap: Pass along the format info from .fb_create() to
    drm_helper_mode_fill_fb_struct()
  drm/nouveau: Pass along the format info from .fb_create() to
    drm_helper_mode_fill_fb_struct()
  drm/radeon: Pass along the format info from .fb_create() to
    drm_helper_mode_fill_fb_struct()

 drivers/gpu/drm/nouveau/nouveau_display.c |  9 +++------
 drivers/gpu/drm/nouveau/nouveau_display.h |  3 +++
 drivers/gpu/drm/omapdrm/omap_fb.c         | 23 ++++++++++-------------
 drivers/gpu/drm/omapdrm/omap_fb.h         |  2 ++
 drivers/gpu/drm/omapdrm/omap_fbdev.c      |  5 ++++-
 drivers/gpu/drm/radeon/radeon_display.c   |  5 +++--
 drivers/gpu/drm/radeon/radeon_fbdev.c     | 11 ++++++-----
 drivers/gpu/drm/radeon/radeon_mode.h      |  2 ++
 8 files changed, 33 insertions(+), 27 deletions(-)

-- 
2.49.1

