Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12016A6E98D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 07:23:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BE410E0A7;
	Tue, 25 Mar 2025 06:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NBBGtyDm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45EC10E0A7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 06:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742883815; x=1774419815;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qLisEm1ChRt3RsoqHYpV+iR6O19gTGhhZvHxHiPKIPA=;
 b=NBBGtyDm2F3Bu/F+iNjDAn3lfAMZsdV8I2Buv9hN1BC/39e7gb9/rFKw
 3NrQeuky+T7JcnMPb5pDOBg2RVv7wXgLUTJOVpecGfhNllYcvkQE1u0Q8
 donvzMuqzVKIXXgCqV/GsbBkzVjvbYIRqPTfLu2Bq012LaQatpexDMfyK
 uJgIcqeeU++2Ali2kOSBN8QqX4PkwjWhwvYNihy0da2H3/bV0led9ghIf
 X5Q1E2XAUxGBfl2UIPLdsL1lxyNDJ0JTaLpaQvIZiyKE2/5s6fhjYR/Zk
 zXVyPGcYf6D3cS2wu7ZhvdWEQ8DPkRgAcKGzCtwwjDEoQbh2pfADz0tPQ w==;
X-CSE-ConnectionGUID: DDT46ByTSWGpWzM1fcjv6A==
X-CSE-MsgGUID: GbWmPURRTxawqnATvKiA0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43991375"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="43991375"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 23:23:34 -0700
X-CSE-ConnectionGUID: GNjKK8LmTeenHlAuT9IEIQ==
X-CSE-MsgGUID: JIE1vbhOR/qD5SA0rvVvEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124233463"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 23:23:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Mar 2025 23:23:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Mar 2025 23:23:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Mar 2025 23:23:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pdrkEI8iiZtemMCkfPbA1JezQ7b5Mh6ZUwL5w9hyvRKLjI5GsWx3rJas3167+4vIgFQleE0dKz3k/9vptxAxx0vGPQkTWzQ4lTsEkVZvlJIlZQ/JFHqcRxm+V6Et5OX2Uzv3USD+i2Bl6x8hW8EPP6SBkt2aN/z7IdsAgVenCjyKe3ruI+5nrk7tPf9rue20Wflp6zHNb1B1Kfsk7wsVS5OiBvfDAkUsTnHFTF3Bva+trI0tD9MixOPUYldRaXfVqsiY2iZILlC9qTgfPpq4e+L0wbfndIs72//LG8YFk1fxMsKmCOO4f/E6L8xKgKeoFS8YSDJ2Cb1yR5vxc8hXeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLisEm1ChRt3RsoqHYpV+iR6O19gTGhhZvHxHiPKIPA=;
 b=ynwxZOIsJ5fKUGbQu0/l52zlPT1mgLaW2UTHF3TwvlmUp8ELGvnxBZrnaEcYViUOF3jOxibh1Z+scy8cwDDgePsRflsuJ9RPdvu7AnOxiuKJclK+2L7S1NThtwmarbg2Nl3yPvxdfXu/H1xw/XoAt4gsoUMCWOWuvVzcm+LTo7U4X1sFNGuY4ovD8geeXGE+GF7F/h9UJGpyO5evH+F5N1kwAAyb5r6depIaG+/Mldi/vEWS/sKQcLT9yDgVsVEtDdAIwGm/1VcLpeU8b/rMXc+UyCRcgI2GrDIeZU2z4hQzYRW3rytNAfVAgr2nq6WGKrKVs0Bd/lA396QGlqGNyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.42; Tue, 25 Mar 2025 06:23:25 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 06:23:25 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 Xiaogang.Chen <xiaogang.chen@amd.com>, "kraxel@redhat.com"
 <kraxel@redhat.com>, "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
Subject: RE: [PATCH] udmabuf: fix a buf size overflow issue during udmabuf
 creation
Thread-Topic: [PATCH] udmabuf: fix a buf size overflow issue during udmabuf
 creation
Thread-Index: AQHbmn/fUd4ZT7YUtUKBH62R28NelbOCMOiAgAEp1qA=
Date: Tue, 25 Mar 2025 06:23:25 +0000
Message-ID: <IA0PR11MB718563F5C571E07F1314F152F8A72@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250321164126.329638-1-xiaogang.chen@amd.com>
 <555feb70-5d80-4a36-818f-f00fbc3dff23@amd.com>
In-Reply-To: <555feb70-5d80-4a36-818f-f00fbc3dff23@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DS7PR11MB5966:EE_
x-ms-office365-filtering-correlation-id: c6e9429f-f87a-4b75-8b64-08dd6b658cb4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SnhraitBVnMvZHBmWlNhNUxxd2E0YVNreFkyTXk3akhFZkZFUzlvdGUwazgz?=
 =?utf-8?B?Uzk5R3hhOGh5TzRzMVRPOGtuUmNxZC94cW1Ha09nazRvS0g3U0Jwa2N0ZjBV?=
 =?utf-8?B?cHluRkRDUWFRaWg5ajd5YUZ0WU9qZ0dtZGxSamtaQ1NNYytrWVcyVFZPS3I1?=
 =?utf-8?B?M1JzMFVqam41NmdqbGd4Z1pMUFpFZUNiOU55ZkRlNXBNUXpaTklOYXpGSVdE?=
 =?utf-8?B?QnYzdU1LVDErUzFxWTNsQW5lb3VXM1FkUTJWdkF2dUoxNnBheDFDMk5pOTdR?=
 =?utf-8?B?dkk0bWVKZ1ZWM25tZzRQVE4wN0Rncm1jTjJKblc1aVQ1NlRkdC81UFF4UWpt?=
 =?utf-8?B?eUtBM2kyQS9nbmVlQTlpeStJQ2NEU0pBL0svYUpickR5cUFpcVZUdXlnWTha?=
 =?utf-8?B?UzA4aTF5OXJZZDR0OWF4ZWZjQ0NnZlJzQ0JIblBOUWkzUWU4aHFHWkF3MEwr?=
 =?utf-8?B?Y0xrY05jQ1YvTTYzQzd4dWtyeTQ1U3psZ1V5NEl0UkY0bFlCalVQYk5YZXgr?=
 =?utf-8?B?bmx0dU9iUmVGdGtoVGJpUDd2cEtiMDV1bkRWUS9xV2NzdHRGZ0hBNWtTU3ha?=
 =?utf-8?B?ZXRNUlVpK2VNVVU1aHVnOW8rVEhnd3RhSG10SUJ6bDJXVGZJRHpBM1hEYXlq?=
 =?utf-8?B?VTdaWDFRdUNCZlFueHNXcWRlRGtiTWExdE94VGlxazd0TnJSQ2NhV2cxTVdv?=
 =?utf-8?B?bkRtdENkWnZRZit0U0F2dGdHRTZaKy9MSWZERkx1cDhSN2dxYXJ2SDltT0FK?=
 =?utf-8?B?allzZm5KNnA2UE9XdWtvNnJGTnRaZDd5NTg3WEtsc240TFRtVmRtT2FGN2Np?=
 =?utf-8?B?ejZNOXVVYkg1Qmw3eEhUYlZVcTVyV2RGelRhdnZHVFRHb2N5aFZnRUJ6K3dM?=
 =?utf-8?B?Nm54RnhlcUdYZEJFdHVDVytTbVdXNG13WWVSYjdBclBQb0wwTE1vRDJjc3JB?=
 =?utf-8?B?ZEpWaDhpOFcyQW9YSU5pVU11QjBOaEw3Skw3SEhDMW4rV2kyUTlFRng5ZDBS?=
 =?utf-8?B?RjdWWkgvSVR5a0xkYk9kek1aMmlxa0RKb1p4ay9CSXJnZy9ZcHZIa1p1d0pR?=
 =?utf-8?B?ZmpXbHFYOVc1VlVCRThiUlg2ekExdnVwRGpvd252MjNVclUyMjMxajA0QkVx?=
 =?utf-8?B?Ylp2MkwvRzJuN1dwbHY2aTJGd2xnU0NVbjdHRGtGU0d6bGIwbFJXdlRja2Zt?=
 =?utf-8?B?Wk4yUFFobysyNXBpRG1MN0hNZHlwa3YxRHJacVdJMnc0L2Y0eWZIcGkzZWZt?=
 =?utf-8?B?U3BTa2h5RmF6MExYVTdQTHpJcTVHeWtPYVVBcnFSVmxPZXBLd0xoYkhPR1o4?=
 =?utf-8?B?V29mNmswNmlGb2JETVNVRVFVcnNNZjRFNENzK2VqOWlaWVA0WGh0VmU0YnBF?=
 =?utf-8?B?MTZ5b09abnhsNVNjb1M3eTdOeXU5YzQrZVpoZVp0NUJVRktBdUdKWGtJYnNv?=
 =?utf-8?B?RkFldTQ2clRnUTI1Y1pSdWthZS9EbXZ2T0FSVC9jOGRPWnFNTTFuek1NRHpQ?=
 =?utf-8?B?N3huSVozMmtud01KazdkUjUzZXRHVGxTM2FMQVdLZFgvTmtsbEd6SnlsVGI0?=
 =?utf-8?B?ek40bGhQeDFkZkVnNnc5L3JNVjlnWU11T0Z5OWRqR1RWK1lOTXhKU1ppNmpI?=
 =?utf-8?B?UmxKcytuODVlS1RCSkt1N3lFcUVGdDFGQnpKUlV0aGhPSWVXaGk3Y2Ixc1Rj?=
 =?utf-8?B?aU5UaEJ0b1FPZUJISTN5Z0lBdXk3cERabGNYQU1WTFFuRXNDTENjSlVFZFZ6?=
 =?utf-8?B?VTRBNVJJS3VCdHd4aDhCZUl6QWZqa2hsNGtsQkNGdEliK01JaXNKb3Jad1p6?=
 =?utf-8?B?WitxbGFMNHY4VDFTZmN2MEl4dnJyd2ZOQkFVZUt3eU15WDI2VEZtakVmNTdX?=
 =?utf-8?B?SkRiWXViSzdPemFybmViZmpXWHorV2p5MFVhNHBsUHMyZEdqblZpSTlQUElo?=
 =?utf-8?Q?cjgakXWH3nQHc7tlW/JFiIsa2afaYKUF?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nzh0TGpRc1BNM2tvV3JDV2MxdHRTN0Vwa3lQVlNZK3pYd2YybFBRbERTSXhE?=
 =?utf-8?B?dXFidXEzV2dmR1ZxNWl1VGZGY210YXB2UXB5dnRTQlpMcTZiYjJvWGg1bUlj?=
 =?utf-8?B?MEl2OGsvbDV5eHVCRVpnZHZNNUJ3M3VrVVM0bTgxdTNUVXpKNk9taHo0QjZt?=
 =?utf-8?B?YTBXN2F3RlQrZW94cllXZG5hZ0V1MmovcTFpU0ltL3FqMlBZR3AveGx4TmF4?=
 =?utf-8?B?b1lTOFNyZ1VuS042bWFsd1ZlZGRGVjNocE5BOUFlS3dRWTBSWERNLzNTTlJu?=
 =?utf-8?B?MTZWelo2SjNvSlo3UDIyQk85TXI0RVdlYWlBYXU0ZnhNczUvK1RNWU56dHJP?=
 =?utf-8?B?MXhhY2dKeXdaMVlrbnRkSFMzdkZJTjFxNWN6eTJVdndJZXRMYVhjRVpmTUVw?=
 =?utf-8?B?blRCa0tVYVlHckZxd1FxV2NCOGd0SktZaE5vTVZyNm56OEQ5RVQrcG54YzI4?=
 =?utf-8?B?YWg3S3NoWFlyRXJMdkhoWkowZEZqczg5YjI0aXJxWkpGV2puS1dhUVlsc1hI?=
 =?utf-8?B?QmxWcXc5b1g3SlNuaWdkTUJDV3R4eG5wNGRIK2VhWERDZnQvbVgxSzZqWG8y?=
 =?utf-8?B?SGsrWklsa3FmRTdqWGkzOFR5cUpWN0NPZjJxRmhTVHM4S0dYc3dXY2lLQjZ6?=
 =?utf-8?B?WUUwMHc2bUxGck11Y0R5bTgrOWUzUks2VUU2RTBzbzNOaXRCZ00xWFVMQ2h4?=
 =?utf-8?B?amtnTEluWUk3bEpoT3AwekpsS1RGOG1sTGx5NGY1djFNM2tnR3R0N2thM2I2?=
 =?utf-8?B?cC9sZElFRVZHR3VOam5yWXVyVE1ndmNqUVdmbUNuSXhwNyt6eno4ditHbS8z?=
 =?utf-8?B?cjExTFljVFB5U0JIM3gzYTJRYzdFYVQxcjNEcW5tZ21LV2I3MWd5c2VnRXFu?=
 =?utf-8?B?ZERtcmU3UE5HUldOcHZOYWpPdmFMUFVqTkxWK3B5RlRwL0lsZGhWaG43N0dh?=
 =?utf-8?B?OGFLMjdVRW5PQWZrTVdNQ1N2MmpUa0lDbXQ0VnBqRlIrSXRzL25MaGhjaHVr?=
 =?utf-8?B?RHNycUpSUkFsUmxQUFhzUFU5Uk1HVG9kVmVKdndSN3B6SmFGaVJ4MXpPY056?=
 =?utf-8?B?N3UvcksvRC9OR29aL0UxODVaMmYyTHE1NjdnZDQzWUw1M3pXYTg3dTVRODl5?=
 =?utf-8?B?anZyR202VUZMU2tWa0RDdzExaTR0NTZGNnRpSks4ZWRsbi9LMXJXK1pVUWhR?=
 =?utf-8?B?ZENqMEtSY05ldVRQVE4yd1RKYjNGVHM1WHErd1l3NzJaaWIrbGIzRS9hRlN2?=
 =?utf-8?B?QnQ3SlR0RXhxOVY1d1NTQTIySVB0VzdmbHk5Undic0gvek9WZ2I2ZWNqWVE2?=
 =?utf-8?B?dldJZVJOV3k0MW5vdFBNMFVjc1h0Ny9FcGJnS0tVYURJc3p5VGFudkYvV0FU?=
 =?utf-8?B?TDgzR05mTWlZbGZjZlloVDZUR0JqMHc1RGNXdWZmeE50WmxTWEg2TGJnRG1Q?=
 =?utf-8?B?R0ZOeVZjT0NQTUdWZnFVa3g3SmE1VnBvRk54bTByZjZvbHA3dGVxNDUwUG41?=
 =?utf-8?B?T091YTBDQnZ1amdlRndoSHRpVWtSNDVhOHVIUEUwK25rMHZ3RU0wdzNLdFpH?=
 =?utf-8?B?UDVaV3J0Z2RZenZoYVgwUDZ6a2IvYlVSNlZpUmdnRGptbmhNbXRwcmpQZnpW?=
 =?utf-8?B?Y2RFVVY0RDFtM3FOWGNxVkE3RXZqNnk2R1RidGduUlh1YjA2U3RvWW1Kem9l?=
 =?utf-8?B?SFdOMFl6cFBJUFJGZ3hYVjlTMFV3czJNMloyS0N5YlUwb01zNFc3RVJkKzN3?=
 =?utf-8?B?Y1dNSEhhS1VFcE1RekdmM2dhL0VIbWZudGRjTU1ISUtHdHZhRXArNnBrbjEv?=
 =?utf-8?B?b1Z2QUhkdVo3LzFFQ1MvNXJkVWpUcGdpeDZOT0o5aitUTFh2YlN1Si92NnlU?=
 =?utf-8?B?YnQwWWhycFFPNUJ2K092YTZBYVZMK2hyMXRLbkszVUFBTGdBcDFwd01kQkhJ?=
 =?utf-8?B?eDROdzhiVEU1eXBuQkdsYVNsUmhSSHNzL3lEcWtXc0NUaFJzUzc0aDhGN3di?=
 =?utf-8?B?OU4zeDNGZVF5bkNBY2NnZ1JXSVVHb1dOY2x1VEdTN0xvR1FSWUZyOHgxellP?=
 =?utf-8?B?RlJxaS9IN2lRWGVqKzhZdUN6aEZha3NtSEVvKytib1k1Z3JqTmJoV1o3cGcv?=
 =?utf-8?Q?XCtlPnMsNjVvXsroNlec2vda8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e9429f-f87a-4b75-8b64-08dd6b658cb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 06:23:25.2801 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QzcT7b1ebkSNLCZEkSB/bo5Ej3Mdc7FJcX3e6X9DR6RLNGgqlQhf+ceXAC7VTbnBLEF79UlqgDSKZSW1Yj4dx//fAjKw2Z55ETiBRa7OHv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5966
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

SGkgQ2hyaXN0aWFuLA0KDQo+IEFtIDIxLjAzLjI1IHVtIDE3OjQxIHNjaHJpZWIgWGlhb2dhbmcu
Q2hlbjoNCj4gPiBGcm9tOiBYaWFvZ2FuZyBDaGVuIDx4aWFvZ2FuZy5jaGVuQGFtZC5jb20+DQo+
ID4NCj4gPiBieSBjYXN0aW5nIHNpemVfbGltaXRfbWIgdG8gdTY0ICB3aGVuIGNhbGN1bGF0ZSBw
Z2xpbWl0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWGlhb2dhbmcgQ2hlbjxYaWFvZ2FuZy5D
aGVuQGFtZC5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiANCj4gSWYgbm9ib2R5IG9iamVjdHMgSSdtIGdvaW5nIHRv
IHB1c2ggdGhhdCB0byBkcm0tbWlzYy1maXhlcy4NCk5vIG9iamVjdGlvbiBidXQgSSB3aXNoIHRo
ZSBhdXRob3Igd291bGQgaGF2ZSBhZGRlZCBtb3JlIGRldGFpbHMgaW4gdGhlIGNvbW1pdA0KbWVz
c2FnZSBwYXJ0aWN1bGFybHkgdGhlIHZhbHVlIHRoZXkgaGF2ZSB1c2VkIHRvIHRyaWdnZXIgdGhl
IG92ZXJmbG93LiBJIGd1ZXNzDQpYaWFvZ2FuZyBjYW4gc3RpbGwgY29tbWVudCBoZXJlIGFuZCBi
cmllZmx5IGRlc2NyaWJlIHRoZSBleGFjdCB1c2UtY2FzZS90ZXN0LWNhc2UNCnRoZXkgYXJlIHJ1
bm5pbmcgd2hlcmUgdGhleSBlbmNvdW50ZXJlZCB0aGlzIGlzc3VlLg0KDQpUaGFua3MsDQpWaXZl
aw0KDQo+IA0KPiBSZWdhcmRzLA0KPiBDaHJpc3RpYW4uDQo+IA0KPiA+IC0tLQ0KPiA+ICBkcml2
ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jIHwgMiArLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Rt
YS1idWYvdWRtYWJ1Zi5jIGIvZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYw0KPiA+IGluZGV4IDhj
ZTFmMDc0YzJkMy4uZTk5ZTNhNjVhNDcwIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1
Zi91ZG1hYnVmLmMNCj4gPiArKysgYi9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jDQo+ID4gQEAg
LTM5OCw3ICszOTgsNyBAQCBzdGF0aWMgbG9uZyB1ZG1hYnVmX2NyZWF0ZShzdHJ1Y3QgbWlzY2Rl
dmljZQ0KPiAqZGV2aWNlLA0KPiA+ICAJaWYgKCF1YnVmKQ0KPiA+ICAJCXJldHVybiAtRU5PTUVN
Ow0KPiA+DQo+ID4gLQlwZ2xpbWl0ID0gKHNpemVfbGltaXRfbWIgKiAxMDI0ICogMTAyNCkgPj4g
UEFHRV9TSElGVDsNCj4gPiArCXBnbGltaXQgPSAoKHU2NClzaXplX2xpbWl0X21iICogMTAyNCAq
IDEwMjQpID4+IFBBR0VfU0hJRlQ7DQo+ID4gIAlmb3IgKGkgPSAwOyBpIDwgaGVhZC0+Y291bnQ7
IGkrKykgew0KPiA+ICAJCXBnb2ZmX3Qgc3VicGdjbnQ7DQo+ID4NCg0K
