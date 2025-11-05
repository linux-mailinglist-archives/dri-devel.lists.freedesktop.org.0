Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A2CC36409
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:12:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4646410E79A;
	Wed,  5 Nov 2025 15:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LlnZQYn1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949C010E799;
 Wed,  5 Nov 2025 15:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762355565; x=1793891565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=18pknen1RYf/KUJKw9WUis/RoD+Ugu3TM7+x2/TCERU=;
 b=LlnZQYn1lk8aL/jRZkqtIDkvtjmm8UoyhNcydohFm7D/b2qqi9LvpDMC
 Oc6DquRTsVPDPm3LZdKeWK0BnDL2iPtbv03J3EAdtDxyPYohVsD+zZM47
 veyu9E04JDKiLSf/XWhQj68OCVKJK12RCPTR1tl/MdpAaf2hBfcIWKnh8
 Rdwy8lLtQqBEZFRBxRQWMreyiUXXcuP6NFs0tHuCgY3NC+AID7GtxJbSk
 mRo7TVtOMoiFx+hfMypQaD3PRImFBsd0jlT25o8pLC5HjWVBV+3IGXUzr
 h/XGydIYqdByOHPXbpopMRgxg+J6sjBFOKdeOXbwI2DX3ltyIjlDvsHnE w==;
X-CSE-ConnectionGUID: ZNj8VO12T+uw5+IXmXDUtA==
X-CSE-MsgGUID: YfYZl2XdSu67/tpNvnNZhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75587286"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="75587286"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:12:44 -0800
X-CSE-ConnectionGUID: xT0/CuFQSQm5LHbMSJ4E2Q==
X-CSE-MsgGUID: ER1IyhhGQ8u/7/be5p2LQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="187426870"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:12:44 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:12:43 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 07:12:43 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.58) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:12:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=evzEN2RPzQ9GusY/nqS3NJF8EfMcvIEC3KdjjRKgH6YfUOXEcQ/qws2lGsz//ayGkoXZH8h7Scidn5lBcRkA03Ak6BOJkhbDPEsMfDQM6yVm4RMY2ynOgVK5HbdCcr97MOHDsemIenjAiwMwXfDXGLD5wHgWp7dGFBp4WijYWoZXpZHcMcpjKVQDlv3XXctggbgJyneKgiV7vBW5a6QYseYRwKJVF3FPsW/DZ6CmkuIx6WPP0L0QPFnH647tn+SZDe7hGir2RGxFWKQJwXdF+OsRcF5HFKEl1vBxZ0GYB1fBDZOdxzbIrv3I7N/04xBX3+vB6c8dsni3f+Kpsi7uRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSzTB+8RBE+pAk1gSEchtvGxqSZebYUH16E/6skUi+c=;
 b=JVqqYjzAm/wqID08lqidu+/oww9WIp3lUqaQ2PT0rHCx6UNcgXBdp3OUdxcexCCa7OyZm3oTs6z7gCHOW7KnWMHLeh5grfjEP4wU3HMD4XwiuoBhTp/Yu3GZ/k5iqo7nu3BbYZXH/vWBCjzc8LXmOEqEVzYSJTOUWdETFKJfXsiY+3JK/H7c67jBh22FSZUYqyiNq/qT4jlHhAbgr35T5SaFHFwQIo3wE2DvTlrBnWtBBPRFQTfurmAvOc9Cp/7hrKiEs2valsLRJud6zG92pR43MknhS7MF9jfxT7GwbntUmpbCpJkXRFVR8BK6q5Cph/maowJkH3kbDwVDiKyBWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB8226.namprd11.prod.outlook.com (2603:10b6:8:182::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.9; Wed, 5 Nov 2025 15:12:41 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 15:12:41 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v4 22/28] drm/xe/pf: Handle VRAM migration data as part of PF
 control
Date: Wed, 5 Nov 2025 16:10:20 +0100
Message-ID: <20251105151027.540712-23-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105151027.540712-1-michal.winiarski@intel.com>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0312.eurprd07.prod.outlook.com
 (2603:10a6:800:130::40) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 723e2f95-cc85-44e3-da04-08de1c7dc389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHE3U2xFcEU3OHhvSUM4cHM5ZDVETytGbjNsUUdCOTZhN3dnZCtYTCs4WFpF?=
 =?utf-8?B?NXl0WTJ4dFdFcFZBUU0zMjdpSWtjQ0pSWkdoaVE5K3dqOVhnbmJZS2FaYUkv?=
 =?utf-8?B?WDR0U0cxNVg1NVd4dmxBaVlCTmxBS2h0QmNveEtab2thSGp4YXBNUjA4cjdu?=
 =?utf-8?B?OVJCQXdtU2VLNWxlYS9HN1U4RS9VM2tOd1Vxd2d1ak1iVkJSQTQ5dUlwQW1B?=
 =?utf-8?B?cGJwTTFBSnl0MUpIOGdPeDk3eFh2dDdGWUx1TnVXeDFjL2JIeSs4amRieFht?=
 =?utf-8?B?eStZN21wTDhJM242TWMxZEovY3RrU1N3TlYrL3BKTkpaQWN1UHVZdGZ4aGFT?=
 =?utf-8?B?Q0kxK2RhZmdKbGp2alF3cUNuMGZUOVYyT3JhLzR2aFM2cEIwbVhzLzNBcGpK?=
 =?utf-8?B?bXZvdHMyUUFSTXFCeW5uV1JuWVJWWER6bmlkRjVXd2hTdkt3SXVVVkhiNndT?=
 =?utf-8?B?U3paSkNrcmRBVHNqcmltMkhJd0ZpbmpQcEpBS3dRRnB0T1VLT244dDl0U2p2?=
 =?utf-8?B?VXpxbHJQWjlwZUlYY3IvcVlyQWVMWURYSytCaElBVVFpVEU5QlhTb3o4T0xI?=
 =?utf-8?B?T0J1RTUrS3daWDFueE5JYWMzYXptck9yZVpZMFNoYUVlMzBsMEVwL21uL1pG?=
 =?utf-8?B?bHo0L1ZIcWRES2tLelNoWWFFb3RsZnRMU0syZUZjcncxaS9Qc0pCVk5tdHVU?=
 =?utf-8?B?cVZoc1NYWUIrZURIOUJyeSszb1pYMTE2N1pZQ0pQbUxPd3lhNHlnZi9SMFo2?=
 =?utf-8?B?UiszNWJEcVR4SUFEVExCSDRMNi9tQVZlcFBuOWpjUG9Xam1JV3ZhSWFyQTZh?=
 =?utf-8?B?bUtEYkdOMUpkWmJwT2c3WEt4UkZ6bUZXZjU5elV0dlhBL1BjUmtZTjZ2QU0r?=
 =?utf-8?B?VUtEUEVoQjBwZWRQdC9RK0gvNkl4V1FNM0dJbGozVENnV25taDhuOW9GMElj?=
 =?utf-8?B?cWtMMElNYmRpLzRpeXNvZ1JhMXRVa0gzWDBDakFuSjBXVzJnbFNBQXVKN2lD?=
 =?utf-8?B?Tnd6K3RRZnU3NDNIWG5lWGdTZFJNMElTanUwWHFmOThBWnJVbU9NTm9QaEow?=
 =?utf-8?B?eC9BOWtJMUQxN1hrYVRmRHg2WFlvVVA2aktNSFU3RWQ4U1E5U1dFTERnSW9r?=
 =?utf-8?B?VkJwVGJxcithcTQ4eE5PcnJjWG1NaER3RHJRa2dLWGhpdkdrb2dWRHpheHJN?=
 =?utf-8?B?MDVOdmFadGM4OVhzdExYZHVCSnh2MzR5N1NhZjJOUmU3c1hlQ0pLbW9mQWpI?=
 =?utf-8?B?b0k1YXE4RWYwWk5rNCtndVUwVlVDcGd2NjZLaGdXTjdmbEdKeWhOVzM4TWRJ?=
 =?utf-8?B?VmVSbU82NHRVazF4TUJlMWRrTUZ6cldycVNKMGlKRGRLYWMwU0FNUzlNNitn?=
 =?utf-8?B?cTBpTmV3ZnplL3Q2Q2NjazM3QkZJRDMxNXM2RTBBYVlTd2RRUTJIaDJyWWg0?=
 =?utf-8?B?cGVkd0JvSjdGeitGcDVZckQ5MTNrek1YY3Qwd1I5dmtSeUR0Rm54WGYyTHh3?=
 =?utf-8?B?cmkvNHoyS0tKaGxTeG96dWUwT3FXVlRVeFl2ek5HcWoremlnTHlJRGd3eTRY?=
 =?utf-8?B?dk5McGRITWozeiswZ1lVaVZRbUpvQUFCbFh3RVZRdHpDVUVQb2QwYWNQK1VZ?=
 =?utf-8?B?YWJDbS9JL3NpdTVRNVByR2VFS0lvM1JBQ29PR2RrNXlObjR3TjdJVkNqUGlV?=
 =?utf-8?B?bmlCN3Rvb3BOVDhDbWdmT2txM2Rya1h2b1ZKdGJFU2tzWHhEQmQwb1lPa0Vj?=
 =?utf-8?B?byt6bXRiaXBuY2NnMk10MTdDb1U1bnBvcndoZjA3MVh5c3NQNDcvRTNPdTh0?=
 =?utf-8?B?ZmZnVHZwSlA4WDJmZEt6VENTYm1ObHNWMjVrMnpRL2pNU0pRNEVZTk1EcXlQ?=
 =?utf-8?B?WXVaNzhGejA1ZjJiRFZKTTd1ZGM0UUc4TUJEa3ZTY0YxNmhESzFGSmkxa29t?=
 =?utf-8?B?ZWZuUzBtYlJDMlVvcUwwS1VPY01TVitEY2RaclJweDB2VnE1VnBvdHU4RFJr?=
 =?utf-8?Q?DMN5balVmPILHFiJLbEOLVWm1TTxN4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDF6RmxkcGkxVzlCcE1qdVNCZFlkRXMyTVhsbmhYZ0d4bUtZUHY3cU4xNlVE?=
 =?utf-8?B?VTRtZWdNZFZUVlZ6TGc0allOcHdOZGxCYVQ3S09oVG8vOU9GbzFSN21NYUJL?=
 =?utf-8?B?S0xBaFFkYTVDNWhoMUJ5bGkwd1gxRjFpZno5bm9Eb2owQWF2SUtsaWdVNXJY?=
 =?utf-8?B?RG04SDZnZVlWRzQxajMwUlBsOVdJcysyNHU3S1p1dHpyT3JNK2JPWUpySzFX?=
 =?utf-8?B?OW1Rc3FhL1dOL3JqYUJ2T1pGdWNmRHdIai9YcWRydExUOXRoeUVjY1REeFBP?=
 =?utf-8?B?T2h0RVl1bjRDSnRxM0VhbHlTTlFyY3hta0wvM1lrQS9FRVh5ZDkrYXVDMndQ?=
 =?utf-8?B?RFpON1BsZnA1NStsTWhPQ3hCN3ZIcXVmZVl4TG82dk1ubFFvMGg3YmRwYi90?=
 =?utf-8?B?N2N0TktoY0pkeWpJMWNoVWRYeDQ5V0k5ZVluMjFhcWs5UktDRVRCK3l3Z2ht?=
 =?utf-8?B?dk1aV2tuaWsrRFJwdzVHVGZZNzZ0MThab1ZHaVoyOEUwOWJ3a0k3ZW9nNUo0?=
 =?utf-8?B?bERudUl2ZTJoL2FySTFuMFU2UmN5c3NqbUNubVBzcitmTUl0TFNRUWFVbU1l?=
 =?utf-8?B?ZEY2NGplRGJTZkJYRExncGtzZlVxVndKREx5bExkTlZNZ0R1Z001eUV3UVJn?=
 =?utf-8?B?ejFzaHI1V0NESUFuNFVsaWYwN0FzQ3I5cWtuQm9FTUt3WkhycFVqcDlhc1NJ?=
 =?utf-8?B?aUlTVDVKTDF4b2FSUXJaVHNGVlpZcTZNRkphZUJUZ3AxYnhzclc2MGlrOVhL?=
 =?utf-8?B?TzhPSldQOTNkemQ4VU9FNzAySHpSNFZmeENHZXdUMHRzQ1B2Nks2RWVxVVZl?=
 =?utf-8?B?aGlGZmFXeVd6cUx1eTNhdmZoOHVGaGp5cjhESThvZGQxSmRaSFppWnBUMGtz?=
 =?utf-8?B?TTY1YnJzUUQraEhRdE83UE5STml4VHhFU0tZRnM0elZhLzBDODkzSlNkbTB1?=
 =?utf-8?B?WjFITm9TNXJWVXRPbVhXMFQyZllINlYwVmxxQzJVMUlzaU9qY2pHdkVOczRQ?=
 =?utf-8?B?TUppeWd4Wjk2akdadm1LL2M2WDdobHJZazN4RHJadjZzUkJkOG5rcGpXMFhG?=
 =?utf-8?B?VUJHTDhRSkEwaWsrcm1MYkdheFFqMVV3UVoxbFA4RGZ5R29TbTBoQjBvakU3?=
 =?utf-8?B?dDFTbnorbmZycW1SNVpFY0FoR1VKZUdJNTBOWCs5Rjl2MGZveGRsLzRSeXdF?=
 =?utf-8?B?elhxZ1B1QzVhdnhWeFRPNXBoOVJLSzZYQnJtTWlNdFluRkhMMkh0WjJEQkNr?=
 =?utf-8?B?dlhVMGRFYWFoRy90dUVWZkwvVy9aaEhIMzltVTM2bDdMNStMYUFiZk5ITlIr?=
 =?utf-8?B?QmJ6RE5UWURCZHJYNm04TzUwWVo2M1JZM3UwVitBRXpIaUIvRi95bUxFQWZl?=
 =?utf-8?B?VnJGVFlKQzJYWmNVdFlWK3VwL0liMzZ6VlNzUGJ4VlJ1TnJOdVlhN04rdUFO?=
 =?utf-8?B?bTNKYVRWZERSMm1GZE4rblBsdHlqWjQyQzNPOVRwNjNIdThVVHkrM08rZkdM?=
 =?utf-8?B?M1FsN3dZU3NCRzNXOXdJaUZDbEdhN0htcG1XbDE0S2Fmb0Zkd044aWxocHRS?=
 =?utf-8?B?bjNBNkRuMXkyUHVnWEVBL3JIUWRmakhRK2VxZlVzR3VXNUExVm82L0xzMFNz?=
 =?utf-8?B?NWpOQWYvclE5Qm54aDk4N0lQUkZiUTNPSmV2OFRkbEkwQU11SGduMjNRTFZC?=
 =?utf-8?B?STRNRlllNmNGY2gvZjdXbTE5Q1RBbFQ5OG5UN1NwRkdoRmdKdW8vcHBWVU96?=
 =?utf-8?B?NzNrbm82bzU3NFF6TjRPNTBYQnRqYlhvdjlWbnJyN2w3bnhlRUd0Mjg2M01m?=
 =?utf-8?B?RXB5NUNzdCszTzFUWElXL3VSVXREbTFDQkR4RlhDZ0dlR3BTZFpaRUdmblox?=
 =?utf-8?B?RE9SdVl4clo4b2QzbDR0TjR4VFd2cFNzNHlITXozai80UmtmK0I4Y2szZHNK?=
 =?utf-8?B?RXRRVlhmMVJtcHF4VG5RQU1UOFIxOHBqY2YwU2J4a052cGs2TFJYSEdSNi9E?=
 =?utf-8?B?bU1DdFE3UGNmNnRYOWg1UlJQdmFoRkFScnB0MitkVHJWSTVLTmFlQmdNTXFR?=
 =?utf-8?B?OW04QkVONDdONkxwbzBKVzVHcWt5SnpkUmh1MTNyU0Jjbyt3UU44cWpROG1Q?=
 =?utf-8?B?MzBwRExlT2ZiTEpwNlRpUngwdTdFNXNxL1IvakJmOFhEN2EvNlVxUWhqK1h5?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 723e2f95-cc85-44e3-da04-08de1c7dc389
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:12:41.3133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7E9L8VS/d2Cp6ue+UUPYhz7ilFQcZAWYa8RnwUOMSljKObNgznmuWSC26ZKmzecss41pPXwyNJONgfApdYcQ86iLR+6afgcsjo5c95ljZ7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8226
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

Connect the helpers to allow save and restore of VRAM migration data in
stop_copy / resume device state.

Co-developed-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  17 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 211 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   3 +
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |   2 +
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      |   3 +
 5 files changed, 236 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index abc2bd09288ea..aae0c98657408 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -891,6 +891,20 @@ static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
 		return -EAGAIN;
 	}
 
+	if (xe_gt_sriov_pf_migration_save_data_pending(gt, vfid,
+						       XE_SRIOV_PACKET_TYPE_VRAM)) {
+		ret = xe_gt_sriov_pf_migration_vram_save(gt, vfid);
+		if (ret == -EAGAIN)
+			return -EAGAIN;
+		else if (ret)
+			return ret;
+
+		xe_gt_sriov_pf_migration_save_data_complete(gt, vfid,
+							    XE_SRIOV_PACKET_TYPE_VRAM);
+
+		return -EAGAIN;
+	}
+
 	return 0;
 }
 
@@ -1129,6 +1143,9 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
 	case XE_SRIOV_PACKET_TYPE_GUC:
 		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
 		break;
+	case XE_SRIOV_PACKET_TYPE_VRAM:
+		ret = xe_gt_sriov_pf_migration_vram_restore(gt, vfid, data);
+		break;
 	default:
 		xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
 		break;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 22f471f269cfa..c62bb67c20a6b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -19,6 +19,7 @@
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc_buf.h"
 #include "xe_guc_ct.h"
+#include "xe_migrate.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_sriov_packet.h"
@@ -501,6 +502,205 @@ int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
 	return pf_restore_vf_mmio_mig_data(gt, vfid, data);
 }
 
+static ssize_t pf_migration_vram_size(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!xe_gt_is_main_type(gt))
+		return 0;
+
+	return xe_gt_sriov_pf_config_get_lmem(gt, vfid);
+}
+
+static struct dma_fence *__pf_save_restore_vram(struct xe_gt *gt, unsigned int vfid,
+						struct xe_bo *vram, u64 vram_offset,
+						struct xe_bo *sysmem, u64 sysmem_offset,
+						size_t size, bool save)
+{
+	struct dma_fence *ret = NULL;
+	struct drm_exec exec;
+	int err;
+
+	drm_exec_init(&exec, 0, 0);
+	drm_exec_until_all_locked(&exec) {
+		err = drm_exec_lock_obj(&exec, &vram->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+		if (err) {
+			ret = ERR_PTR(err);
+			goto err;
+		}
+
+		err = drm_exec_lock_obj(&exec, &sysmem->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+		if (err) {
+			ret = ERR_PTR(err);
+			goto err;
+		}
+	}
+
+	ret = xe_migrate_vram_copy_chunk(vram, vram_offset, sysmem, sysmem_offset, size,
+					 save ? XE_MIGRATE_COPY_TO_SRAM : XE_MIGRATE_COPY_TO_VRAM);
+
+err:
+	drm_exec_fini(&exec);
+
+	return ret;
+}
+
+#define PF_VRAM_SAVE_RESTORE_TIMEOUT (5 * HZ)
+static int pf_save_vram_chunk(struct xe_gt *gt, unsigned int vfid,
+			      struct xe_bo *src_vram, u64 src_vram_offset,
+			      size_t size)
+{
+	struct xe_sriov_packet *data;
+	struct dma_fence *fence;
+	int ret;
+
+	data = xe_sriov_packet_alloc(gt_to_xe(gt));
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_packet_init(data, gt->tile->id, gt->info.id,
+				   XE_SRIOV_PACKET_TYPE_VRAM, src_vram_offset,
+				   size);
+	if (ret)
+		goto fail;
+
+	fence = __pf_save_restore_vram(gt, vfid,
+				       src_vram, src_vram_offset,
+				       data->bo, 0, size, true);
+
+	ret = dma_fence_wait_timeout(fence, false, PF_VRAM_SAVE_RESTORE_TIMEOUT);
+	dma_fence_put(fence);
+	if (!ret) {
+		ret = -ETIME;
+		goto fail;
+	}
+
+	pf_dump_mig_data(gt, vfid, data, "VRAM data save");
+
+	ret = xe_gt_sriov_pf_migration_save_produce(gt, vfid, data);
+	if (ret)
+		goto fail;
+
+	return 0;
+
+fail:
+	xe_sriov_packet_free(data);
+	return ret;
+}
+
+#define VF_VRAM_STATE_CHUNK_MAX_SIZE SZ_512M
+static int pf_save_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
+	loff_t *offset = &migration->save.vram_offset;
+	struct xe_bo *vram;
+	size_t vram_size, chunk_size;
+	int ret;
+
+	vram = xe_gt_sriov_pf_config_get_lmem_obj(gt, vfid);
+	if (!vram)
+		return -ENXIO;
+
+	vram_size = xe_bo_size(vram);
+
+	xe_gt_assert(gt, *offset < vram_size);
+
+	chunk_size = min(vram_size - *offset, VF_VRAM_STATE_CHUNK_MAX_SIZE);
+
+	ret = pf_save_vram_chunk(gt, vfid, vram, *offset, chunk_size);
+	if (ret)
+		goto fail;
+
+	*offset += chunk_size;
+
+	xe_bo_put(vram);
+
+	if (*offset < vram_size)
+		return -EAGAIN;
+
+	return 0;
+
+fail:
+	xe_bo_put(vram);
+	xe_gt_sriov_err(gt, "Failed to save VF%u VRAM data (%pe)\n", vfid, ERR_PTR(ret));
+	return ret;
+}
+
+static int pf_restore_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid,
+				       struct xe_sriov_packet *data)
+{
+	u64 end = data->hdr.offset + data->hdr.size;
+	struct dma_fence *fence;
+	struct xe_bo *vram;
+	size_t size;
+	int ret = 0;
+
+	vram = xe_gt_sriov_pf_config_get_lmem_obj(gt, vfid);
+	if (!vram)
+		return -ENXIO;
+
+	size = xe_bo_size(vram);
+
+	if (end > size || end < data->hdr.size) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	pf_dump_mig_data(gt, vfid, data, "VRAM data restore");
+
+	fence = __pf_save_restore_vram(gt, vfid, vram, data->hdr.offset,
+				       data->bo, 0, data->hdr.size, false);
+	ret = dma_fence_wait_timeout(fence, false, PF_VRAM_SAVE_RESTORE_TIMEOUT);
+	dma_fence_put(fence);
+	if (!ret) {
+		ret = -ETIME;
+		goto err;
+	}
+
+	return 0;
+err:
+	xe_bo_put(vram);
+	xe_gt_sriov_err(gt, "Failed to restore VF%u VRAM data (%pe)\n", vfid, ERR_PTR(ret));
+	return ret;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_vram_save() - Save VF VRAM migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_vram_save(struct xe_gt *gt, unsigned int vfid)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_save_vf_vram_mig_data(gt, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_vram_restore() - Restore VF VRAM migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_vram_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_packet *data)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_restore_vf_vram_mig_data(gt, vfid, data);
+}
+
 /**
  * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT.
  * @gt: the &xe_gt
@@ -540,6 +740,13 @@ ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
 		size += sizeof(struct xe_sriov_pf_migration_hdr);
 	total += size;
 
+	size = pf_migration_vram_size(gt, vfid);
+	if (size < 0)
+		return size;
+	if (size > 0)
+		size += sizeof(struct xe_sriov_pf_migration_hdr);
+	total += size;
+
 	return total;
 }
 
@@ -602,6 +809,7 @@ void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
 	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
 
 	migration->save.data_remaining = 0;
+	migration->save.vram_offset = 0;
 
 	xe_gt_assert(gt, pf_migration_guc_size(gt, vfid) > 0);
 	pf_migration_save_data_todo(gt, vfid, XE_SRIOV_PACKET_TYPE_GUC);
@@ -611,6 +819,9 @@ void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
 
 	xe_gt_assert(gt, pf_migration_mmio_size(gt, vfid) > 0);
 	pf_migration_save_data_todo(gt, vfid, XE_SRIOV_PACKET_TYPE_MMIO);
+
+	if (pf_migration_vram_size(gt, vfid) > 0)
+		pf_migration_save_data_todo(gt, vfid, XE_SRIOV_PACKET_TYPE_VRAM);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 04b3ed0d2aa23..181207a637b93 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -25,6 +25,9 @@ int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
 int xe_gt_sriov_pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
 					  struct xe_sriov_packet *data);
+int xe_gt_sriov_pf_migration_vram_save(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_vram_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_packet *data);
 
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
index 9f24878690d9c..f50c64241e9c0 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
@@ -20,6 +20,8 @@ struct xe_gt_sriov_migration_data {
 	struct {
 		/** @save.data_remaining: bitmap of migration types that need to be saved */
 		unsigned long data_remaining;
+		/** @save.vram_offset: last saved offset within VRAM, used for chunked VRAM save */
+		loff_t vram_offset;
 	} save;
 };
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
index 87205f0505ad0..eec218c710278 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -5,6 +5,7 @@
 
 #include "xe_device.h"
 #include "xe_gt_sriov_pf_control.h"
+#include "xe_gt_sriov_pf_migration.h"
 #include "xe_sriov_packet.h"
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_printk.h"
@@ -171,6 +172,8 @@ int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid)
 		return ret;
 
 	for_each_gt(gt, xe, id) {
+		xe_gt_sriov_pf_migration_save_init(gt, vfid);
+
 		ret = xe_gt_sriov_pf_control_trigger_save_vf(gt, vfid);
 		if (ret)
 			return ret;
-- 
2.51.2

