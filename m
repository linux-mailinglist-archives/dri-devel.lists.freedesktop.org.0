Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE73A9D90B3
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 04:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BAB10E76B;
	Tue, 26 Nov 2024 03:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WnhwEG+P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC42610E76B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 03:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732590984; x=1764126984;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lORgBgZT/F8R+uW050vYkciAFSxmlLwHr+dAX85vpRI=;
 b=WnhwEG+PZu7h8wpVJQQbuMvwFs3UotwSwcOVE/z0eZEO413U8XWBL1mb
 FfJ+0d4o2sdmN3bd3YwVtk+ECW/KXVHBsyYwOWIMtIc4EKr3UPMJgxtO6
 ud+snSx++RcRp/6KInt3xPBkc6xHm/8UskcJGK8NSw6x2HAP4J5umYLRJ
 qro2hZAnAMyCAk0wnF5pC3dIaj+4raEvnlpwwUxjvEG7eGrIVUMzjZKI1
 rn44vUdwf0rmgFJ8EzJAb6HdmQopKQk0OmcccLp53WxVXgTZTgSdZaI9n
 xkOaa0n04xa9AkP++pTxLPu/iZP8HyRLaUtfKfIPj5FWYm0ImorVqzlSM g==;
X-CSE-ConnectionGUID: 5Gv0XynBTfqagODBiy/0lQ==
X-CSE-MsgGUID: IyLMetJATGCYQb5IObyqng==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="50137652"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; d="scan'208";a="50137652"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 19:16:24 -0800
X-CSE-ConnectionGUID: wwYY6NYRRrmn7s4rIwW6UA==
X-CSE-MsgGUID: D61f6cNwQwOheAOpmUu6Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; d="scan'208";a="91417903"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 19:16:23 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 19:16:22 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 19:16:22 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 19:16:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3MiiZmGCJN1BomFQ0VQlThfSQ+5UCZpcxy2wdG9zHFgY41kfdVp84qp6ApZnbxXrAXifgOmqI/9DFeD2xzXQ0nryac4ZPSh6YYeg0oyosapptdcRruLEj3p59EEBx8Kg6ufthJmjc58YfPc3lqniACmc4hXkONyGb3reGqhyLDqHMX9TUdFFKg47hJv6MxU608v3gR//j773SjkN3QUpnfXnek4j+LtQcQFVrI/D016AcCb1UqblMeh2l5ydz5ZN8xv8n6FSCPRv7p71cyz3qeudvSXdwZi8jfXNm0Z5FzJjqe4YfdzMaDrrgVN84U0FisUUmQBmUNxhRJ/baWDtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lORgBgZT/F8R+uW050vYkciAFSxmlLwHr+dAX85vpRI=;
 b=Kqgjkv2HybXQoaHrIW3VDxHND5WfA80lsOvHJWUHzXNQKeYTuegpOuD2TaKrGOvixRRcN40M/SA8l+WnEsIpmIX/kpq1x2ffubNxLYyjwGcAAv0hJeypmSqdJ3yiD2ZMRVeOi/fYQYyKbawOExBgX2JDxxe1nEy7c2yDb1SGsn9z7BprKmYNyoCAtBdIh7jQ/g5BLDseddVFvBhZIK/PqIklCtjSDuJR6Q/cplmasv32GVJtyjjatTjk3vHJ7O6gk0Z4dAnx1pzHKWDAFcvdbtZymeWg/rihttuVW3IcasnJZRVKT/g1h9YP//lZ7p186nX1+3J8MqgjUZFyTgiEcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SJ1PR11MB6251.namprd11.prod.outlook.com (2603:10b6:a03:458::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 03:16:20 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 03:16:20 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
Subject: RE: [PATCH v4 2/5] drm/virtio: Add a helper to map and note the dma
 addrs and lengths
Thread-Topic: [PATCH v4 2/5] drm/virtio: Add a helper to map and note the dma
 addrs and lengths
Thread-Index: AQHbPw9/P9uH01LpvkqBXy8zZg5fNLLH39gAgADRzNA=
Date: Tue, 26 Nov 2024 03:16:20 +0000
Message-ID: <IA0PR11MB7185AD723F92BAECA4D56E2CF82F2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20241125073313.3361612-1-vivek.kasireddy@intel.com>
 <20241125073313.3361612-3-vivek.kasireddy@intel.com>
 <a10f9b16-9cbf-4e51-a4ce-a408f792cafc@collabora.com>
In-Reply-To: <a10f9b16-9cbf-4e51-a4ce-a408f792cafc@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SJ1PR11MB6251:EE_
x-ms-office365-filtering-correlation-id: 4ffe2aa4-4595-4a10-c80e-08dd0dc8b301
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VWFVVE84SmI2aUZJa25lYmZGTnhXcUQzcE1LWlo4REVlTlNFQ0w5NWxOTWNy?=
 =?utf-8?B?NU42MDhadThiSklMVDd3VytRNHREa2xxMFpEVllHN2w5czhtNi9BbjR3cUxG?=
 =?utf-8?B?b0dEOWI1eXZ0MVBNbXNtQ2FkeEd3aFAzUTEyT3FsakY4c2xWQXluNlA2dnZM?=
 =?utf-8?B?V2RJUDExbE0zWXB0eENWYkkyZ2tIYjRVRC80bnVmcC8rVUxveGUzclRTYTVY?=
 =?utf-8?B?cysrMy85V2k5Qmo1bTFXOTZmc09yUS82b3psTk5SUURPMDVka0haQndwSG9v?=
 =?utf-8?B?Z3FDS0hPY25JNE1KZ2FIYkZzNmNnVEZiR3hEQi95Q0VuT3k4elNsektyN2V3?=
 =?utf-8?B?YXB3SUxWU0h4L09tUWxaNUhlNUtvKzhWRWRqRnc1Uk1rMjNrdUF0MmNNbUFD?=
 =?utf-8?B?YSswcFhQT21PSVB6UWNTU2pobWc2RVoyNGNPUGM2b1g0RGVoK2Y3eHJoT2Nr?=
 =?utf-8?B?QWNhVGk2TCt2UUp2NUFab1orZldqL0RuRFcxdHVVSlhGeGE4c1hWZUtjaWc4?=
 =?utf-8?B?SDhmT0ZhSUVVMWQzd2M0NldNY1FEbmN6VW9lRjY5NlVkejlvYXNvWEJHa0lP?=
 =?utf-8?B?VnQ0YnRJcTNkYmlKNlhnc0hIdHNWNTBRYWhoSnBiNVNOWnFSNXlVdXI0aGdz?=
 =?utf-8?B?VFQrZTZrK2wyMFdQNVloQ3c1TGxsYlVuTG9oZE9zWmFEWjUwQUVuOFBwUDZP?=
 =?utf-8?B?K0ovdldsdG5rYXVQRDNKRmJ1SHIxclFkZjNNMkd6bTk2ek1rRU5hREp2eUdu?=
 =?utf-8?B?YlBQVTZ2ZTNPSG9WZmwrWjYyd2JGV1NZcTRiNEFDUGVKWlY1NUEyQStCL2tS?=
 =?utf-8?B?ZDc2anU4ZXlzUEVwNnR5cnI5YVBpZm1uS1BTVVBSY1RObHhOS1NRdnVVVVlU?=
 =?utf-8?B?Qm45dGlram52VHV6dHhLZHJiVHdMSFNIQ3VINDY5dzM2UG1jTzBDQmxkZllk?=
 =?utf-8?B?dEl4VWE0S2ZhSGNWNG1ENWhzN3FBcHltNDQ0dzZsNVNReEkzRHU1RHVYdXlo?=
 =?utf-8?B?WlpZM0NnbEpHRnN4RW44UFFTVk53N2dPV3FUdnpMTVpEOCs5ZVRSaUkwcmZL?=
 =?utf-8?B?SEI4dUdXN3BCZlJLVkxLTHE2eHVGS0lMSk5XbEljeUc1ZWQyMUgzSUlIVWQx?=
 =?utf-8?B?ZGZiZDVNbHRZbjJwRDlML3dGNlZVWXFJRVBXTTJnMVp5WDZwK2ovT1pTMVJV?=
 =?utf-8?B?NDVtVzMxYURXajJjL0VqOU1BNTBHaHVEMEVaQzM0cVg0Vy9rYnpJZUlYNDZY?=
 =?utf-8?B?azlkVjQxSWhXTkE5K0ZrRTljNVBkN2xiR2s2K2JLQmppMEloZkdaMTExUDhn?=
 =?utf-8?B?UzlTYktWVVNjZDRqNDNETnY3K0dDaWQ2T2Z3Z0dDejU4SDdvN0ROT0p2SUxR?=
 =?utf-8?B?angwVi9jZWlDV0UxSnQwUDJSazNzVDZrREpic0lTWndxV1hCaWpsZUg0bENN?=
 =?utf-8?B?ZERnNFdPUWQ4Mkp2M1ZjaE5jOGIydnpDYmZwODA2QmFDVk5ZTExsSDRzbVJZ?=
 =?utf-8?B?Z2tRaUtUdE9yZlV6ZWczdkxvOVI0OEM3SzYyaW90MERGNzZ0S1hUbTc2cmJX?=
 =?utf-8?B?bEN5VXlvajJkbTRLQzFHS3BaZzZ0U3V4WkhacVkrVC9vTDM0UmEyZFhldFhr?=
 =?utf-8?B?L2JjTXBZQjNiQUFOaTRpYnBrZ3hKNWc2b1ZQWjJPS2x2SFV2Z1NqZXExWlRK?=
 =?utf-8?B?RDJRUXY3YUFtbU96TEZ4TS9WWm5KTWRIKzhBRkVnLzh3QW9xdmo4MzM0Z3pM?=
 =?utf-8?B?cmZHc214aE11YjRta2o3Ymc3UFpRQ0RFeXBZMCtNeWJHMXQvek11NENML1Zr?=
 =?utf-8?B?K0tYL2kraVpiV0Z1aHFJdmQxWVFIQTlwRFB3WUJvNEFTTng2ZlNGa2dUN1ha?=
 =?utf-8?B?ektqWW44U3RxbCtNSDNYUVgzazlhRlpQR01WQk1VUldlMXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUlxSGFlUDVOVk5QRm1VUGV0UXJlQVplS012TlJUNi8valBZeUhzV1NsaWpM?=
 =?utf-8?B?L2RwSXV6M29iNzNDb0ZoZTFxelNQUHUxL3VnTGNUcUZJRGVxbW9jZ1ZMTlNu?=
 =?utf-8?B?TDhMeEgrbXFmL0w1QS9uNk9nMUR1WTRBR1ZCWHF5cjQzU1U5OGJrOTlQOHlY?=
 =?utf-8?B?NlhZQnJTV0p1S1V6N1RQRElZSnF3N0tXRVBWcEhqb1NjcFNiNkRRMG41Q3hE?=
 =?utf-8?B?dWlKaFhHZkc3dWphd3VPWjlWdWxwa01xRnJrbXBSRVBQTEQ3NVlacmdoZjMv?=
 =?utf-8?B?dnYrMXljc2psZkxkL2dHTFhlL2FJbkpBNXBxdDl5Y2xhVEE2UXZUZm55bkgx?=
 =?utf-8?B?b2xMU1BSb2FBM2dYZXdwRlJab3I4R08wMnVDUHBVeENUK3RyYUxhejJEczJj?=
 =?utf-8?B?RGVkdUFnWDltejJRQWgxcGFGT1Y5WGI3TzJrTG9lbmhqc2RFb2xxckZZdmph?=
 =?utf-8?B?a2trUC92VHJ6VHU2WFc4Sm5ISzNKTGNPcXBLTllNcWJmbFhWVWhRcUNHNWx6?=
 =?utf-8?B?T3ZBeWRNOGNxVFZDengyanVrVFdZVWFWWk1EKzJNMi91dXVzYjU2eGxmcW5O?=
 =?utf-8?B?bW5XQnVubksxYWVkWUVaT3R0a0h6SkZHN1RuTSsvUHd5bHRvMVJ4R29uSFNN?=
 =?utf-8?B?bzc4L1o4N1lLSmNmdTRqR0g0SXNrVjRQb01FQkNyZmw3cWlQdU1qZ3ptdWlr?=
 =?utf-8?B?M0daWHlLM282TnU0WkVmS01KTmZQSkVXc2RaL2tSZDVmUzBLdS9jam12R29P?=
 =?utf-8?B?RHZiQTNFd2xnbDZ2RkFWMHpxQnZUY2htWHRVZW5ub2pneEovVXI2QjVRMjlB?=
 =?utf-8?B?Ty9HTUJJcVk1SEoyREhUNEpXK3RkQ0pVNnVQaHl1aStKY01lN2ZDejlsN01J?=
 =?utf-8?B?bnRFYWpkbjluaGw3bmRTVy9xSGhWN3h0Qml6bVU0ZWZmUkJ3UkZoajFzbWVj?=
 =?utf-8?B?TDhaUWZBekN6TzlDeHRtcHdEcUxZV09XVEVIU0l0aFVmMlBpYTlOL1ZHOGNj?=
 =?utf-8?B?YldaWXpmRU1tVjFxYkRGSXhUZDdwN0JGL0Qva0hrcDl4K01IZG9CNDUvdU5F?=
 =?utf-8?B?WlJCODRlQ2tYZlpGMys5K2JrSExZVGJVSEZKandIb1M5SGFjTlh6ckdWRjRp?=
 =?utf-8?B?OUhqRVF3QThaMmpqQmI2M2RQSmhlK1hpZno3NjVGYnNLUmllaTRHd0dIbVkw?=
 =?utf-8?B?M20rVE1mM1c0RVZKRUM1SzRUMXhTcnJjbitibFZTZ0lwTmsyZ3JSM2hyWlB3?=
 =?utf-8?B?dGpKQ1JpZkxsckJ4OEpocFNJdjc5bUx3SjJPWjg2dHBvaUNXSzdaam1zTGFj?=
 =?utf-8?B?NXh4KysyRVVLL2I0dmUraUlBdFJvTzNYREY3VUVxSXJTbUFESUhJTmU5STVH?=
 =?utf-8?B?Y3BnWFBkT0hZMmd6S1ZuMXlFYUswZjhkS1ZzVm52OUpHcDZQQlNDK2RFalc4?=
 =?utf-8?B?dVJpeHVwa3lta1JrcEJHQ0hQWDhWWXllcUlBM0N1aWhnV1hYWnpIM1o5TXh1?=
 =?utf-8?B?cnR6Sy84MitXUVplQTA3ZXVBZGZNMkJNYURiZ054Z3VFbTIydHVHWG4zRGlv?=
 =?utf-8?B?dy9Ic0dieGpoV0s1a3laS0NodkNKWUU3MmMzRERYSmIwTFRvcStBZUlvYi80?=
 =?utf-8?B?MzJFK2NYSEloRXJvSldhWk1jcWJQRGgwRWg1WnR2UWpQb3JuenBHNjFJWTJV?=
 =?utf-8?B?NHNrd3BwRmtYL2J2N3JkQjJSR3pVZCsrQjB6Tzh4blVoQ1JGUmttb1l4NWd5?=
 =?utf-8?B?TVJIbStPdTQ3S2dTQWRLbDdjbTJtUE45TnFpT0xLdkwzTy8raHpBbkdmU3Zv?=
 =?utf-8?B?T09tYm82U2w5Uk15Ynk0Z01qZ1Nqbm01RXlhUVpzbXNyVUl2Um9XVDJIQ0JI?=
 =?utf-8?B?RmR6TC9CdDIzQW16eEpHd0FCdVZLbVdoMkM1YnJYUXVVcWZiQnRSRGtMSThE?=
 =?utf-8?B?UTlPQytrRUk5ejR5UFlOWC9OTXhSYjVWRm5HbWRuSjd2czQ0ZHJOelNlTXhq?=
 =?utf-8?B?YjhvK3hzTVQ3ZDA3UDR4dHNrZGszYy9PYVR1QzFkcGxaRFFvcnhLTWNuQVg0?=
 =?utf-8?B?YWk4dStLVFY0eDVhcWpBZkxyaFRiYjl3dzc4MnYxNWhETVNnZ041TlhwUFVF?=
 =?utf-8?Q?9Oau8HElxwzgRv8J5KbtSfIao?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ffe2aa4-4595-4a10-c80e-08dd0dc8b301
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 03:16:20.3970 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AK0DqStoC55tmvD6i625uE+ef+r5ao4mV8URRQ/Mac93tEU+yPzP6EvGb3uBG/cu2msbIFjJ6o88MYO74wifhoOQ7izqNRMJuvdK5jw8f1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6251
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

SGkgRG1pdHJ5LA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMi81XSBkcm0vdmlydGlvOiBB
ZGQgYSBoZWxwZXIgdG8gbWFwIGFuZCBub3RlIHRoZQ0KPiBkbWEgYWRkcnMgYW5kIGxlbmd0aHMN
Cj4gDQo+ID4gK2ludCB2aXJ0Z3B1X2RtYV9idWZfaW1wb3J0X3NndChzdHJ1Y3QgdmlydGlvX2dw
dV9tZW1fZW50cnkgKiplbnRzLA0KPiA+ICsJCQkgICAgICAgdW5zaWduZWQgaW50ICpuZW50cywN
Cj4gPiArCQkJICAgICAgIHN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqYm8sDQo+ID4gKwkJCSAg
ICAgICBzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gpDQo+ID4gK3sNCj4gPiArCXN0
cnVjdCBzY2F0dGVybGlzdCAqc2w7DQo+ID4gKwlzdHJ1Y3Qgc2dfdGFibGUgKnNndDsNCj4gPiAr
CWxvbmcgaSwgcmV0Ow0KPiA+ICsNCj4gPiArCWRtYV9yZXN2X2Fzc2VydF9oZWxkKGF0dGFjaC0+
ZG1hYnVmLT5yZXN2KTsNCj4gPiArDQo+ID4gKwlyZXQgPSBkbWFfcmVzdl93YWl0X3RpbWVvdXQo
YXR0YWNoLT5kbWFidWYtPnJlc3YsDQo+ID4gKwkJCQkgICAgRE1BX1JFU1ZfVVNBR0VfS0VSTkVM
LA0KPiA+ICsJCQkJICAgIGZhbHNlLCBNQVhfU0NIRURVTEVfVElNRU9VVCk7DQo+ID4gKwlpZiAo
cmV0IDw9IDApDQo+ID4gKwkJcmV0dXJuIHJldCA8IDAgPyByZXQgOiAtRVRJTUVET1VUOw0KPiA+
ICsNCj4gPiArCXNndCA9IGRtYV9idWZfbWFwX2F0dGFjaG1lbnQoYXR0YWNoLCBETUFfQklESVJF
Q1RJT05BTCk7DQo+ID4gKwlpZiAoSVNfRVJSKHNndCkpDQo+ID4gKwkJcmV0dXJuIFBUUl9FUlIo
c2d0KTsNCj4gPiArDQo+ID4gKwkqZW50cyA9IGt2bWFsbG9jX2FycmF5KHNndC0+bmVudHMsDQo+
ID4gKwkJCSAgICAgICBzaXplb2Yoc3RydWN0IHZpcnRpb19ncHVfbWVtX2VudHJ5KSwNCj4gPiAr
CQkJICAgICAgIEdGUF9LRVJORUwpOw0KPiA+ICsJaWYgKCEoKmVudHMpKSB7DQo+ID4gKwkJZG1h
X2J1Zl91bm1hcF9hdHRhY2htZW50KGF0dGFjaCwgc2d0LA0KPiBETUFfQklESVJFQ1RJT05BTCk7
DQo+ID4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJKm5lbnRzID0g
c2d0LT5uZW50czsNCj4gPiArCWZvcl9lYWNoX3NndGFibGVfZG1hX3NnKHNndCwgc2wsIGkpIHsN
Cj4gPiArCQkoKmVudHMpW2ldLmFkZHIgPSBjcHVfdG9fbGU2NChzZ19kbWFfYWRkcmVzcyhzbCkp
Ow0KPiA+ICsJCSgqZW50cylbaV0ubGVuZ3RoID0gY3B1X3RvX2xlMzIoc2dfZG1hX2xlbihzbCkp
Ow0KPiA+ICsJCSgqZW50cylbaV0ucGFkZGluZyA9IDA7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJ
Ym8tPnNndCA9IHNndDsNCj4gPiArCWJvLT5kZXRhY2hlZCA9IGZhbHNlOw0KPiANCj4gVGhpcyBi
by0+ZGV0YWNoZWQ9ZmFsc2Ugd2FzIG1pc3NpbmcgaW4gdjMgYW5kIGl0IGZpeGVzIHRoZSBmbGlj
a2VyaW5nDQo+IHByb2JsZW0sIGFzIGV4cGVjdGVkLiBcby8NCj4gDQo+IFRoZSBERzIrdmlydGlv
LWdwdSBzdGlsbCBkb24ndCB3b3JrIGZvciBtZSBpbiBndWVzdCB1c2luZyBib3RoIGk5MTUgYW5k
DQo+IFhlIGRyaXZlcnMgbGlrZSBiZWZvcmU6DQo+IA0KPiBJbnZhbGlkIHJlYWQgYXQgYWRkciAw
eDcyMDAwMDUwMTQsIHNpemUgMSwgcmVnaW9uICcobnVsbCknLCByZWFzb246IHJlamVjdGVkDQo+
IEludmFsaWQgd3JpdGUgYXQgYWRkciAweDcyMDAwMDUwMTQsIHNpemUgMSwgcmVnaW9uICcobnVs
bCknLCByZWFzb246DQo+IHJlamVjdGVkDQo+IEludmFsaWQgd3JpdGUgYXQgYWRkciAweDcyMDAw
MDUwMDAsIHNpemUgNCwgcmVnaW9uICcobnVsbCknLCByZWFzb246DQo+IHJlamVjdGVkDQo+IElu
dmFsaWQgcmVhZCBhdCBhZGRyIDB4NzIwMDAwNTAwNCwgc2l6ZSA0LCByZWdpb24gJyhudWxsKScs
IHJlYXNvbjogcmVqZWN0ZWQNCj4gSW52YWxpZCB3cml0ZSBhdCBhZGRyIDB4NzIwMDAwNTAwMCwg
c2l6ZSA0LCByZWdpb24gJyhudWxsKScsIHJlYXNvbjoNCj4gcmVqZWN0ZWQNCj4gSW52YWxpZCBy
ZWFkIGF0IGFkZHIgMHg3MjAwMDA1MDA0LCBzaXplIDQsIHJlZ2lvbiAnKG51bGwpJywgcmVhc29u
OiByZWplY3RlZA0KPiBbICAgIDAuODc2MTg5XSB2aXJ0aW9fZ3B1IHZpcnRpbzE6IHZpcnRpbzog
ZGV2aWNlIHVzZXMgbW9kZXJuIGludGVyZmFjZQ0KPiBidXQgZG9lcyBub3QgaGF2ZSBWSVJUSU9f
Rl9WRVJTSU9OXzENCj4gSW52YWxpZCByZWFkIGF0IGFkZHIgMHg3MjAwMDA1MDE0LCBzaXplIDEs
IHJlZ2lvbiAnKG51bGwpJywgcmVhc29uOiByZWplY3RlZA0KPiBJbnZhbGlkIHdyaXRlIGF0IGFk
ZHIgMHg3MjAwMDA1MDE0LCBzaXplIDEsIHJlZ2lvbiAnKG51bGwpJywgcmVhc29uOg0KPiByZWpl
Y3RlZA0KPiBbICAgIDAuODc2NTk3XSB2aXJ0aW9fZ3B1IHZpcnRpbzE6IHByb2JlIHdpdGggZHJp
dmVyIHZpcnRpb19ncHUgZmFpbGVkDQo+IHdpdGggZXJyb3IgLTIyDQo+IA0KPiBXb25kZXJpbmcg
aWYgaXQgY291bGQgYmUgYSBwcm9ibGVtIHdpdGggbXkgZ3Vlc3Qga2VybmVsIGNvbmZpZy4gSQ0K
PiBhdHRhY2hlZCBteSBjb25maWcgdG8gdGhlIGVtYWlsLCBwbGVhc2UgdHJ5IHRvIGJvb3QgZ3Vl
c3Qgd2l0aCBteSBjb25maWcNCj4gaWYgeW91J2xsIGhhdmUgdGltZS4NClN1cmUsIGxldCBtZSB0
cnkgdG8gdGVzdCB3aXRoIHlvdXIgY29uZmlnLiBDb3VsZCB5b3UgYWxzbyBwbGVhc2Ugc2hhcmUg
eW91cg0KUWVtdSBsYXVuY2ggcGFyYW1ldGVycz8NCg0KPiANCj4gSSdtIGFsbW9zdCByZWFkeSB0
byBhcHBseSB0aGUgcGF0Y2hlcyBhZnRlciBhIHNtYWxsIGNvZGUgaW1wcm92ZW1lbnQuDQo+IExl
dCdzIG1vdmUgYm8tPmRldGFjaGVkPWZhbHNlIGludG8gdmlydGlvX2dwdV9vYmplY3RfYXR0YWNo
KCkgYW5kDQo+IHJlcGxhY2UgYm8tPmRldGFjaGVkIHdpdGggYm8tPmF0dGFjaGVkLiBJIGNhbiBh
cHBseSB0aGlzIGNoYW5nZSB3aGlsZQ0KPiBtZXJnaW5nIHBhdGNoZXMsIG90aGVyd2lzZSBwbGVh
c2UgbWFrZSB2NSBpZiB5b3UgYWdyZWUgd2l0aCB0aGUgc3VnZ2VzdGlvbjoNCkkgZGVmaW5pdGVs
eSBhZ3JlZSB3aXRoIHlvdXIgc3VnZ2VzdGlvbjsgYXR0YWNoZWQgaXMgbXVjaCBtb3JlIGludHVp
dGl2ZSB0aGFuDQpkZXRhY2hlZC4gSSdsbCBpbmNsdWRlIHRoZSBmb2xsb3dpbmcgY2hhbmdlcyAo
YWxvbmcgd2l0aCB5b3VyIG90aGVyIHN1Z2dlc3Rpb25zKSBpbiB2NS4NCg0KVGhhbmtzLA0KVml2
ZWsNCg0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9k
cnYuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaA0KPiBpbmRleCBh
ZDY5NjBhYTQ2NGUuLjgzMjgxMDdlZGY3OCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X2Rydi5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmly
dGdwdV9kcnYuaA0KPiBAQCAtOTMsNyArOTMsNyBAQCBzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3Qg
ew0KPiAgCXVpbnQzMl90IGh3X3Jlc19oYW5kbGU7DQo+ICAJYm9vbCBkdW1iOw0KPiAgCWJvb2wg
Y3JlYXRlZDsNCj4gLQlib29sIGRldGFjaGVkOw0KPiArCWJvb2wgYXR0YWNoZWQ7DQo+ICAJYm9v
bCBob3N0M2RfYmxvYiwgZ3Vlc3RfYmxvYjsNCj4gIAl1aW50MzJfdCBibG9iX21lbSwgYmxvYl9m
bGFnczsNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVf
b2JqZWN0LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfb2JqZWN0LmMNCj4g
aW5kZXggMmIxOWJiOGM2ZWMzLi41NTE3Y2ZmODcxNWMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS92aXJ0aW8vdmlydGdwdV9vYmplY3QuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
dmlydGlvL3ZpcnRncHVfb2JqZWN0LmMNCj4gQEAgLTEwNSw3ICsxMDUsNyBAQCBpbnQgdmlydGlv
X2dwdV9kZXRhY2hfb2JqZWN0X2ZlbmNlZChzdHJ1Y3QNCj4gdmlydGlvX2dwdV9vYmplY3QgKmJv
KQ0KPiAgCXN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYgPSBiby0+YmFzZS5iYXNlLmRl
di0+ZGV2X3ByaXZhdGU7DQo+ICAJc3RydWN0IHZpcnRpb19ncHVfZmVuY2UgKmZlbmNlOw0KPiAN
Cj4gLQlpZiAoYm8tPmRldGFjaGVkKQ0KPiArCWlmICghYm8tPmF0dGFjaGVkKQ0KPiAgCQlyZXR1
cm4gMDsNCj4gDQo+ICAJZmVuY2UgPSB2aXJ0aW9fZ3B1X2ZlbmNlX2FsbG9jKHZnZGV2LCB2Z2Rl
di0+ZmVuY2VfZHJ2LmNvbnRleHQsIDApOw0KPiBAQCAtMTE4LDggKzExOCw2IEBAIGludCB2aXJ0
aW9fZ3B1X2RldGFjaF9vYmplY3RfZmVuY2VkKHN0cnVjdA0KPiB2aXJ0aW9fZ3B1X29iamVjdCAq
Ym8pDQo+ICAJZG1hX2ZlbmNlX3dhaXQoJmZlbmNlLT5mLCBmYWxzZSk7DQo+ICAJZG1hX2ZlbmNl
X3B1dCgmZmVuY2UtPmYpOw0KPiANCj4gLQliby0+ZGV0YWNoZWQgPSB0cnVlOw0KPiAtDQo+ICAJ
cmV0dXJuIDA7DQo+ICB9DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRp
by92aXJ0Z3B1X3ByaW1lLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcHJp
bWUuYw0KPiBpbmRleCA1MDMxYjgwMGM1MjEuLjNjNGVhNTkyZTIzYyAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ByaW1lLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ByaW1lLmMNCj4gQEAgLTE4MSw3ICsxODEsNiBAQCBpbnQg
dmlydGdwdV9kbWFfYnVmX2ltcG9ydF9zZ3Qoc3RydWN0DQo+IHZpcnRpb19ncHVfbWVtX2VudHJ5
ICoqZW50cywNCj4gIAl9DQo+IA0KPiAgCWJvLT5zZ3QgPSBzZ3Q7DQo+IC0JYm8tPmRldGFjaGVk
ID0gZmFsc2U7DQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlv
L3ZpcnRncHVfdnEuYw0KPiBpbmRleCBiOGIyOTZiOTEyYTEuLmFkOTE2MjRkZjQyZCAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMNCj4gQEAgLTExMjAsMTYgKzExMjAsMjYg
QEAgdm9pZCB2aXJ0aW9fZ3B1X29iamVjdF9hdHRhY2goc3RydWN0DQo+IHZpcnRpb19ncHVfZGV2
aWNlICp2Z2RldiwNCj4gIAkJCSAgICAgIHN0cnVjdCB2aXJ0aW9fZ3B1X21lbV9lbnRyeSAqZW50
cywNCj4gIAkJCSAgICAgIHVuc2lnbmVkIGludCBuZW50cykNCj4gIHsNCj4gKwlpZiAob2JqLT5h
dHRhY2hlZCkNCj4gKwkJcmV0dXJuOw0KPiArDQo+ICAJdmlydGlvX2dwdV9jbWRfcmVzb3VyY2Vf
YXR0YWNoX2JhY2tpbmcodmdkZXYsIG9iai0NCj4gPmh3X3Jlc19oYW5kbGUsDQo+ICAJCQkJCSAg
ICAgICBlbnRzLCBuZW50cywgTlVMTCk7DQo+ICsNCj4gKwlvYmotPmF0dGFjaGVkID0gdHJ1ZTsN
Cj4gIH0NCj4gDQo+ICB2b2lkIHZpcnRpb19ncHVfb2JqZWN0X2RldGFjaChzdHJ1Y3QgdmlydGlv
X2dwdV9kZXZpY2UgKnZnZGV2LA0KPiAgCQkJICAgICAgc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0
ICpvYmosDQo+ICAJCQkgICAgICBzdHJ1Y3QgdmlydGlvX2dwdV9mZW5jZSAqZmVuY2UpDQo+ICB7
DQo+ICsJaWYgKCFvYmotPmF0dGFjaGVkKQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gIAl2aXJ0aW9f
Z3B1X2NtZF9yZXNvdXJjZV9kZXRhY2hfYmFja2luZyh2Z2Rldiwgb2JqLQ0KPiA+aHdfcmVzX2hh
bmRsZSwNCj4gIAkJCQkJICAgICAgIGZlbmNlKTsNCj4gKw0KPiArCW9iai0+YXR0YWNoZWQgPSBm
YWxzZTsNCj4gIH0NCj4gDQo+ICB2b2lkIHZpcnRpb19ncHVfY3Vyc29yX3Bpbmcoc3RydWN0IHZp
cnRpb19ncHVfZGV2aWNlICp2Z2RldiwNCj4gDQo+IA0KPiANCj4gLS0NCj4gQmVzdCByZWdhcmRz
LA0KPiBEbWl0cnkNCg==
