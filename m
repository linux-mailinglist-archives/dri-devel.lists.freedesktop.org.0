Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMJwNNxSgGla6QIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 08:31:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41137C92A9
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 08:31:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CADCB10E24A;
	Mon,  2 Feb 2026 07:31:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dLn/dwsi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7219310E24A;
 Mon,  2 Feb 2026 07:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770017496; x=1801553496;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aGzvNA7fG148vWC275AVeZP2pHsXDtfrUwigmRUXCK4=;
 b=dLn/dwsia3Q5LFtfw/3xWowdTqPD/H1ZZRQTl1rF373ENqH5NTZXksyN
 Etog5/gnPX5Hqb/teZFP3TzdHs8H1gwi2ouWLDvfVsq5tKUdTj4jkeRK3
 6f0wUY2iPMBCBPJR5sy1XNx/LyuHPX0oM2amNwrOE0QB8nTOMpDI1r51q
 wQnnNWv9fJt/0Dr0M7lZn8nMbrQFJs4rkWGz10jR416HCOam2om45fLrP
 kh6c6XJBw3WpxFRsPJlRj9UaHXEatKxp51FNSalxe/7J7s2a/JbKPFAQO
 SwPMRFwE6gt0HKgM0/lxRdwSIueFp7hgGc8rcyHMjLkZCBSg7DZ6Y4Qy6 g==;
X-CSE-ConnectionGUID: bWD715WVSpCmj0CfbUJIQQ==
X-CSE-MsgGUID: t3nYt7HXS9OKY2kcxJEUuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="70189048"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="70189048"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 23:31:35 -0800
X-CSE-ConnectionGUID: wBkY5rY/SqCmBNNFK1Xz7Q==
X-CSE-MsgGUID: +tQs8AZcSbuH6vYdoWzhMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="209307136"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 23:31:35 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 1 Feb 2026 23:31:34 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 1 Feb 2026 23:31:34 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 1 Feb 2026 23:31:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y36MMAlAi4Ny4DfQ6b3vzH8Z7GHDfEjBHFQ4gcjRUtROEE0MEiXHiqRau0jaao3I6BRfHp/nOdpfynCKCSbi6p6ChDhU06MoBOfSWYIHGsJGto3kxPejKMU1UTnscD9F519ivqgCPGXT7UDvolnM1QcGdXUYJl+zPpvhhU9f1mF2WiQ86V/Fuj9NifxOFF0+Q44FCsG28M5AyERMYJv5C/ZJZFXHqjUXXvpXvZEwFg3pG5FbIc0U9PPsgo8l7D1zf7rExI4Dbf5z4JeizRR8zbyWhrhXI35+rr+FyKGwvzQ60c0kduQ2ryue+DovWQ4OoONTzYEblboCp4hitdXT2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9E2XRY7qKAH4UmlUqXpoK/tcyVdpqdL8Eo9a48h584=;
 b=Iy7teB69IZNsZofsjb5LRZ4bV1TVAJD/aeukHqaxtWVeOOQKTMfrcMBUCaXNroyrHxYOS0G8rep4qBPEJTH1NTEyG91jLXJPz46OLI1dcWPF2PAunNAx01mou6c1igR/r7gFOEIGI68KH8ltDtKI5KYXlxPNAvoekNatllytA/H9Qb7ZLf5KC1g5OeqASp1LMb+u5HrYTTv6csd56X1w4YU4HsITV9Ya5cfgTkICauZiub0CLMTVHKxByH3rtbAuYaQ9fnE6LS2cbdbygl8mfaYbMf50auqVgyfLXqJcJmpm7rkKPX5BhfbOoxf8yCW3FpYBO7dmylKZ8EUodbbMOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by BL3PR11MB6532.namprd11.prod.outlook.com (2603:10b6:208:38f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 07:31:32 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 07:31:31 +0000
Date: Mon, 2 Feb 2026 07:31:22 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 "Andi Shyti" <andi.shyti@linux.intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH v4] drm/i915/selftests: Defer signalling the request fence
Message-ID: <kusqnu2hh4ejugc4j6wxrsoiqzjv53dzmjixl2qinxcs34eh4z@sjhk6nrnzk3z>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260130184507.45233-2-krzysztof.niemiec@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260130184507.45233-2-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: LO4P123CA0581.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::11) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|BL3PR11MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: cf1edfee-3e0a-4bba-c76e-08de622d161e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGtqcUY4RXM4Rk9FTTRNMzBrZXRjaEtrbG00NE4wQXVvdDNvVVc2RmpYSHk2?=
 =?utf-8?B?SzhTeStkSFlBd2dkR0VoT1JDdlkva3o4NkxMWk45ak5oV2hUencvSHQ2RDVo?=
 =?utf-8?B?OW4ySVhUWmJzaHBCakZ0akRwUXZQUmdvVHAyN2RWdjhyMkdwMHBaZGxMQVFi?=
 =?utf-8?B?SVREcEZNcEh3UXpQVjM5M2JKVlc4NVNPVTFmaTF0SklDSCtDdzhjRFc5ZHJK?=
 =?utf-8?B?eG5JLzRvRGExV3hCREhCRHlyU0xUVWVXS2VXbjlyTFB0a3J3SEN1c0JWVWo0?=
 =?utf-8?B?dXdWTG10UHNXeWZtTEFBRWFPVHlIcE54VWJRcjQrbXpHalJLNHhHTFI3Uk9m?=
 =?utf-8?B?bGpMMFlTdWU3KytlWENKMFQrTUU1SkUxUzhOdEUvNGlsbXJzMHlTWDB4R0xK?=
 =?utf-8?B?RXpQRkJ0djlLSCtpMTRhcUhKcW9JVWtxZ0w5OE9pL251S2dYcnBabHc4UFp4?=
 =?utf-8?B?VFM1TEZlWC9JNGo4NXpqOW4rRUJMU1M4R1lWS0tROURuZWYvQzQyVHozQUgz?=
 =?utf-8?B?T1p0c1hML3dxMUFrTEhGQVlXQjlVT2p1RlFQdFMyMUlrSythekNjT296ZFRj?=
 =?utf-8?B?cFdraGEwNGpvM1JMaGI4SXlJbHpWcWJBWTBxZnZsN1hjd0dTeVVQeUozR2RD?=
 =?utf-8?B?VnJTY0FVMnZ1T3Q3MmV6YlF0RnpVK3pmNDh4bTJXUkRCdlJkTjZ0SlhaZ1B0?=
 =?utf-8?B?ZnM0eUF4dk5jTnROR1V1c1lmbkhrbFpRTCtpV01MaUpudFVETUY2cmttaDVp?=
 =?utf-8?B?b1BOY0RHdVl1eHZjbnJvVHVmL3pOQ2htWDZCTmdnN0loNEczc1RyUm1KQUE2?=
 =?utf-8?B?dmd0OFVQQzV1YksxWFQrM1dqeFhuejN1eVNwcnJ3WWRmYllBQ2dzcCtldC9S?=
 =?utf-8?B?OUlvaGp6My9KNzNhNEp0SGtrK0loWDBDVXd6dVNFVjhSenZvVUFNY3F5b21l?=
 =?utf-8?B?d0NDdWRhV3V1Q2hVMGt3N3NEaUJBaXhzVjE5ZllPeG9hbFZXVHBIQllnWEk4?=
 =?utf-8?B?c3I3TWJIRHNOeStvM0xhK2pFZ2UrUXYwZDB0dk5iUkJLWXo0RWVrWFBJUXNP?=
 =?utf-8?B?cU56TzlpYVVkRzk5WlJFRmRuU1NoWmdBTFZCdzcvVXZZck9MYUpHSDF2MHI5?=
 =?utf-8?B?bDhPcXRpL0IrSXgwVzBtMTlUc1RTSUpBaURneHQ1WVV6MURwcUx6bGkvNHUv?=
 =?utf-8?B?MVE0U1ROVjRkdGJZMXREcjZyVWtPaGZHT3YwZFh2YzZQcmNkUlhJdlpjRGhI?=
 =?utf-8?B?SnA5NTVXaW8rR0FjVTRuTXFiQWY5NGdFVWQ2RStROE55NEFlRmlTZzIxTW94?=
 =?utf-8?B?VEZiVk5JeWZpbWlUMHJjVUUydGYxN1VvMnhZRXZDSjc1MUw3eGdTWnhEQzg4?=
 =?utf-8?B?M1NrVGdmU1NURE1VWWp2UVZIaTVjYWdSYlhyekQ2OW9ySEdpdE5wM1JaRUE2?=
 =?utf-8?B?dmZaR2RrR0ptYlljNWNEaUc4NHRmcHhaVlMzWHpqazVBY1hzV01PSVp5WEJt?=
 =?utf-8?B?akFxdDBSOUJDdXVIL1NPV0RFZEtENU5VNHFRall1ZG5ic0U4bHNORDV4OEtC?=
 =?utf-8?B?T1NMU2p6MGp1VFJsVWlDeUE4TGRmaUp0dWlnazhMTDhPay9QNy95ZXFRN253?=
 =?utf-8?B?SldUQ1NIOXZlRi91UmdlYm82YXNmRTA1cUF6UFZvamF5WGlBV2d2YjIvTnJr?=
 =?utf-8?B?RHB0TUJUVTJvMkpTY2NFZEsraFg3Wklsa0tGcUVic1lQampDaTZFbXJ0dlJP?=
 =?utf-8?B?VVpMLzJNYklOankrT2hpNVRrMlFVdE0rUktCOFA5Wm11UTM3N09QTi9WZFQ3?=
 =?utf-8?B?TXNoR251Sm9HU2k3SUs4RE9hZ3VZNjVTZWZlU3hLM2JNN3c2bVNsVkNRRHNW?=
 =?utf-8?B?TXB3WE5UYWlCdHNMN1FHcDVTVEtTMWQxclY5WDQ0NlRLVDI3Ty9SZXBDSjgx?=
 =?utf-8?B?SmJRQVV4b3ZCVzNBbFVZblpQa3RhMEJJbDFVQTlRRnRPNVJBYTBSNlRlOU1q?=
 =?utf-8?B?bU9JZXVSa0VBU2ZDYXBZa0dPRHk1R002MHlSWklwNTBOSHBkUldJaXZmenJV?=
 =?utf-8?B?dC9TNlVFMTN2bkJDMVErc0NXS1p4dkJCU3NwdlR6b0JpdjRJR3NZRlVHTGpX?=
 =?utf-8?Q?cGYY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDhxYldEK0d0ZTdxcSs0U2FaUTEvUGJvcERubW5CWkJIa0lLcVF0WjJRejFk?=
 =?utf-8?B?Sy8relUwbDhoc2h4cmJoSjVWaGhQeGdFaGFVYU9OWDM5YXd5NUtXQ1owUnpN?=
 =?utf-8?B?bS9zYXplaEVES1JvVVo3SlBVMndMVE5Td3RnODdwOTVTS1FuN2RTNE9Ga1Nj?=
 =?utf-8?B?cnBYczdWVzd1c3YveHNSK1NkTjE0b1F2WXBhUzkrSFJjZW9TRjQ1b0F1TFBx?=
 =?utf-8?B?OEQ2Y0VrbjUxdm9EZDNGQXpuYXhPUUh0elNzSk9tbnQ1VmZIdGVWenRISGN1?=
 =?utf-8?B?aW1GY25rQXBNckZpSVpGWFZBaytVY1hEcUhpdjd4RDA2dFI1TmZNYzFoVk9T?=
 =?utf-8?B?bENMdnRXV2FTUnQzdVI0VHhCNmJKcDkzbCtxdDR1VG5jK0JzeFpURzdhVGh0?=
 =?utf-8?B?RXVHMytiK3IrYTNxbDNtemUzM1RoZXQ2QlVNS3ZrRW9weVhkdzRCb1ZsRU1O?=
 =?utf-8?B?MDE0RnZpM2RtYStKSWxBbm01RzBNTEJ4QldQSkFla3BtM0FUMWRIYjRDNzli?=
 =?utf-8?B?cW1MMzgvMHZ6ZUlNVGJVS1d6b2ljUEVCcHVIMW1WYkp4WWIwY2lrY09OTjBY?=
 =?utf-8?B?bWZFS0I0aU1NanhtOGh3TFNrOXZvT1drMmVzK05mNit4SjNnczcxNlk0Zm1r?=
 =?utf-8?B?L2dsZVZWTmNsWSsyWFdJVGJtVzZ0QnhESHErWWYvV2YxMVEvNkJTRGxaQlRG?=
 =?utf-8?B?Uk4xRzIxUVFJcGFJamxoMExRdExIODIxNkgzVDlrbGx5R2ZWOWtQV1ExOUJj?=
 =?utf-8?B?clViNVhLMXhWZ0g2ZVFac1dIOEFCU0hlU1dxVnJTaU5EVGpnTVZTek56blRz?=
 =?utf-8?B?WkdQZlV5NkQrSFIyRGp2VUhqblRNTEdPam5IKzVuaERNUDhzenVZcVBha211?=
 =?utf-8?B?YWpDSW1UZVI1ZkZjc3NsQ0Y3dlFSOXJJSUpHYlZ4ZllKbTBDVVVHL0FJMjd5?=
 =?utf-8?B?RU8vTlF1Z2hqLzF0NytEN0tvVXNuVGFqVE9XRVdWLy9LOVczZTh6NDhZUFZK?=
 =?utf-8?B?N1h6K09RZTl3WXF0czZWdVIrUDBrZEFaOG02MmFGeWxxT01hRjR5L2xNNUwy?=
 =?utf-8?B?R0p5K090WHk2T0tqRW4zRW5peDNwR0Y5Skh0RjNtak92Y1dKak5kQ1NOL3NX?=
 =?utf-8?B?MGpTZHRQdmdNUG9oSVpmdHpWcHhDc2FxVEs2Ky8zdEt3cnlGYmd3ZDFHYVRj?=
 =?utf-8?B?R0ttWEIvTFQxTGE3dWFDMFRTVHowM0FuYlRTTU1OSkJLK2s4UUFrTWczT29D?=
 =?utf-8?B?Z0pHeHcySVFvK0dsQjNiczlKZ1hBd0tBNEtKVEIzN3JaZmhVaTBvYXNMVlN2?=
 =?utf-8?B?VFdlMERUVlI4YVRXeVNvMEY1TDlDYmUvQWVVek9tdk9pMkJYMzR4Z2pWNWJH?=
 =?utf-8?B?R2c4d1o0SUJFbkNiWEpUZy9QV2FqNWNPc0ErMktZSktOYS9lSDFaTEpTa1VN?=
 =?utf-8?B?ZDh3aW55UzRTU3A3eGFMczdlNjBJZ2ExV0VlbkR0M1NmZlphMVY0clR6Y0tn?=
 =?utf-8?B?akZRVW05Kzc3c0NkOWNwbll3aWh1Mk9rTE9Yc1NUdFoxbjZPL3BtVWprMFJG?=
 =?utf-8?B?YmFTT1Axd24xUEc1dHFOQ1R0bWdRYytiMFVFVkhaNGNDMTNkRzlhZ3ZjR2E5?=
 =?utf-8?B?MEVGdG8ycThFVlNER29KcTVTQ1lDVFZoS2xSUDR5Ymoycm1zcjAvc0NIMDBS?=
 =?utf-8?B?NlVwaXJVa0tKTTVHajlhZjdYcGFyNm45eVlDNC9GLzdLM1VmS3AvanZpMjNu?=
 =?utf-8?B?RDkrY0FsNThrdzNJNGtUSFp3eXZiOC9LWUY4anhROGZlK01EREN6WVJiOHh5?=
 =?utf-8?B?U3Q3aWhnM2s0K1Z2YUJXeExoYkxYUVJWQXVVZ1I2T2xCd2VJOE56ZkZQbmxZ?=
 =?utf-8?B?QTYrZnpoM2o3MEN1NmxxdlNxV2hZeENZWWF4RkwrM0tQbHlGQTNRcml6emZ5?=
 =?utf-8?B?aEhsOUphdDc4U3VCMkxHWlNyOXJjOFplQlRsQTB3dmhleW5EZE1HNFhHVzc2?=
 =?utf-8?B?Q2NNZ0VuVW1vUlpNbzV4Z2UwL2xub0dmOE5QN0tOOFBPa2pzbXZOamg2cXVC?=
 =?utf-8?B?cis5cTI5WGNPdjVoU0RrM2gxaGE0K2draTk3Z1NLbHlrZUNGaXpwNXJ4REht?=
 =?utf-8?B?MUc0K2orNHdKeFUvejkrOVBVZkNvV0hiV1hscmt6RnFnZlRiSVgvKy9ZLzUr?=
 =?utf-8?B?c3drQ0hGVFBnUDdwUEJTdml3K1Jsb05SUjQzR0dDZnBvN0JjSW5OUm0yQXhE?=
 =?utf-8?B?N0cxYjJidFU2T0ZuLy9HbFJqcTlTQms0NU5Eb0gxdW5UMWxnTXhaNlZCcFA2?=
 =?utf-8?B?NnhpaUU5ZGlnRVNMUjdRb0NBbGh4MVR0V3ZMVktlTVJFQml6QXoyek5mRWNK?=
 =?utf-8?Q?PLiG+BZg75sYWcec=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf1edfee-3e0a-4bba-c76e-08de622d161e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 07:31:31.8670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yCRnBLGsCdnzfzD3NNl+Fnb9g480ea5P67Dh2fICDM4qgQ1wyywcQ6r4CxiEqNSIIB6PIHfz9h4iFSU6oNY/T+4hB8tJjq5CjmlFSoEXsZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6532
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
X-Spamd-Result: default: False [0.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.karas@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 41137C92A9
X-Rspamd-Action: no action

Hi Krzysztof,

[...]

> +__live_work_confirm_finished(struct drm_i915_private *i915,
> +			     struct live_active *active)
> +{
> +	int err = 0;
> +
> +	if (!active->work_finished) {
> +		struct drm_printer p = drm_err_printer(&i915->drm, __func__);
> +
> +		drm_printf(&p, "active->work hasn't finished, something went\
> +				terribly wrong\n");
I think "something went terribly wrong" is superfluous, when you
are not sure what the "something" was, so you could skip
printing that part. This is a non-blocking suggestion, include
it if you plan to prepare a v5 of this patch.

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
