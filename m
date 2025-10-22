Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DE4BFB17A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 11:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A3B10E716;
	Wed, 22 Oct 2025 09:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DzuI16Oh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4056510E70D;
 Wed, 22 Oct 2025 09:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761124332; x=1792660332;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GvHEL9dOsb/bil0GEa5vNV9+N2K5wUn0ozPeZg9TX7I=;
 b=DzuI16Oh1/yPW7diI642zkMxh8sLNmFXTOCK/B8IviutVQB71Ssrk197
 15rcPgur2z9CwtxPi42B3b+poXvm+V4rng3VpiY+fVkljb24NzgWKiP+5
 9ULxve0M527vI7zzD7scnNy6g2I1iw33o5kZOBOWQEAAsmjOn94IK8vsF
 M2wv5XIBNelH5d+/MbAS1M3BBD9M0CSf8nHIcKhpiiGxULq+pBmLhHmuP
 hZVudkGkoTfYGbZduwCjBuNvLyB0IwXbDEXSLO3ocbYHYnw0jcLdvcZCA
 dVeOhkb/leFiRkbiwUxBI/yep9okmQR8aGTLQem1QusEcP9zWQjxIGKMt Q==;
X-CSE-ConnectionGUID: SAExeTpxQHK0Ifh/A0EIhQ==
X-CSE-MsgGUID: JTyzrEdqSmGQp2onQqDk9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50839900"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="50839900"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 02:12:12 -0700
X-CSE-ConnectionGUID: sIvmJxl6Sia8+b3Vv4WfAw==
X-CSE-MsgGUID: cFUDREx8QlmicLp/Vm8L7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="221014400"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 02:12:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 02:12:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 02:12:11 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.14) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 02:12:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4BhozxXTt8sLvCJfx1jPltRMfpdYBY8gg/ybXptMzF6zNdkK2J8Vlb9Gb9XJzsMrdFNmyDpbukVuUCxV3+gVAWCh+P83sbp1eE9JwtJb4qzv34LyXr4Sj2BOYYtxALHevUk6H1dTOp2WiVi9FsdJtyjUWdtcWb6zjuOXBqQB5sdMxPGwptRJIOdks8Hoh8LKEPu4KXLDoTm+hhfL+x5j+EmxNiOkPmHAetwZ/M1ID8hxYRBHXrt/GjaYNjEKEKw3Nn2ZgjP+Jk6ifh8gsUzbVkn2LDI/ozxZIRAt1tVEQlICyabQSrSX2TgHHeTRRID/sb3+B4f63He+GzJjgSmkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32NxJ7X2IrAnkoswSc9KmMYl+osS0+7PGA/uSxC4srg=;
 b=HYsJJdneMMBDwoyNvIPyzdCgMqA+jewHSz6EWSXMM4yDQo2MNBJzpekJ6DJNIrK955bw+ZEl0cVEzpGHxY/4S1kFx5SssbYALeTVipk4cwIiqJdXcss3AKSyomWiuMQ46amkOCUEAkZYG1hPw9GUfFaamEmXoGX4uyfxTK0L/cQ1AC1noCa3GJ3hxyFIbJaz7e2jnwPp/tb4XH1kyGqt3QH7A9x/Ip37mjLvZcL6clVtM9OERbukoZCkOmC3bUo0WbU0tFOUS/rf89Lxserwsv/h9IgvNM+5t59RboRZ1/RWXVZg8hRMCqlfmqnTsbtXM8fK+se29VCqMEBhZRo+pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 IA1PR11MB8100.namprd11.prod.outlook.com (2603:10b6:208:445::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 09:12:09 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 09:12:09 +0000
Date: Wed, 22 Oct 2025 11:12:05 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Christoph Hellwig <hch@infradead.org>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH v2 26/26] vfio/xe: Add vendor-specific vfio_pci driver
 for Intel graphics
Message-ID: <4e6ctwhyax2v65mgj3pud5z3vz75yputis6oufju45iptzaypq@zaxo42l23o2r>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-27-michal.winiarski@intel.com>
 <aPiDwUn-D2_oyx2T@infradead.org>
 <ilv4dmjtei7llmoamwdjb3eb32rowzg6lwpjhdtilouoi6hyop@xnpkhbezzbcv>
 <aPib0tHn1yK9qx2x@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPib0tHn1yK9qx2x@infradead.org>
X-ClientProxiedBy: VI1PR06CA0175.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::32) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|IA1PR11MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: 26c7fc48-d0da-4631-0d1e-08de114b13fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWNhdnRWbE5TOWp6ZStPMzNwRzBxTGZzYVRKL0NWM0krbDlGc3llNks4ZldW?=
 =?utf-8?B?YW1lSWM5eis0cXVTT1UyU0pmUlRINjFGTjBKWW0rNFF6RkE5UHZjRFZiclJP?=
 =?utf-8?B?UjdnRHl5OUNBK3BSVjJlNFNLMU5pZmp4MU8xS1dFYjFGcGl5NG13UDk5bzhM?=
 =?utf-8?B?dmk3NUlRNlEzTjI3dCtoREtIVXUyL2xUemZidU1iRW5QSitkdVg4ZFpjZFY1?=
 =?utf-8?B?aTllbUh0MHlJd25nS3NhMWU3dWxacDkwL1Q1ZDBxSGlkbUpWWk5LR3NTVU12?=
 =?utf-8?B?NDY3VXcvelBpK3NrNTZKeEdvcjBhcVN4UTdkOHorQ25DRFFZa05vUXJlb2sx?=
 =?utf-8?B?bjF1QjFpb2NJaXl4VXQwTVBHVm9JdGRCK2UvaWhRL2RyRnlDcjFTcGhWazJh?=
 =?utf-8?B?dEZjdHFFQUoycjhQRy93b0MzQWpLRVJqdXZqQlAxeml2K1MvZ2IyR0VneXRs?=
 =?utf-8?B?Q0VqNEF1UTdvM1BqUThlMngvWndGa3JIQ1pyVG95ZmFLWFhXeklzWndLT0dF?=
 =?utf-8?B?R0lZbE5GeWpHU05ndWhDRG1jZ0VsSGNmdktja0dnL051ODFaeERuc2NDcUZR?=
 =?utf-8?B?aStjZzVmZFE4bzV5eWlkWTdFenJuUUE0dThtNFdwMEo1Z0IxTlNtc1hreXRr?=
 =?utf-8?B?K2pUbXNaNUJoS2IrT054RFBkSDdmY0lNY2FndjN4NVFyM0ZBeUdoT21vR09j?=
 =?utf-8?B?OVRRdC9vaS9qd2U0Z1J1cHE4dUdtaHNWMmJGYWlBU2FIWHh1MVRvYVRvNmVj?=
 =?utf-8?B?NEsxelN2Zkd6K2Y0U0ZpL3FVVW96UFIvY00yV1hyTE0vaFQ2S0pBZHBhdzdP?=
 =?utf-8?B?WUNGbDZsc2xmYjJqKzNYQ1BLZjJKRkhJY1dRNDdqUUF2R1ZNbjNQK3lLeVRp?=
 =?utf-8?B?TnpPMUl6VnI2Ujg2YlhNdUhmQ1RLNTZmZE82SGlEbmZrNXZNUFJ5S2ovREM3?=
 =?utf-8?B?WStUT2NwSExQN3BLQllsaHlyS0VRaTdtOWlZUzBlTFZKWDZKQVRoWFNuMGhV?=
 =?utf-8?B?VDFnQVVhb0Y4QlI3V0xqZ1Zydk1EaUFja2xxMk9WV3FBMGpNanhxY3ZYVG5W?=
 =?utf-8?B?QUFmeVI5b0VBM3FxclhxTkU5R0VlYktlbVRNa1pyc3kwL2s3MmdyQUZRZ0Ry?=
 =?utf-8?B?TmJXR0ZRNFZXY2JhT1JXK0l6ckRiTmRad21OMG5lRHVYY3RHZnBzMEo5M2dH?=
 =?utf-8?B?aXI1cWEwck1BbU5TV1YzM3ZNZ3F1QXlnTmh1MmFtMlMzT2lyRy9vVTljcTlL?=
 =?utf-8?B?TytqVmlmUVE3L0RONk5lK1JxQlhPTFE0SXBkSTZWM05vNXRUUktGd2JFRW9C?=
 =?utf-8?B?NDEycy90TlVNN1V0dkMybkxvekRCQTJGZmMrZXN0K2dQV2FoNmRjZWwxL2h3?=
 =?utf-8?B?aVhFbHNiRE1tQURYTVVsSjRPbDE5aldEWHAyNXcvRzA1c1h2cTJTN1IxejA5?=
 =?utf-8?B?bVhic01KalVTYlR5b3gzejBFcnBteGRPSVdjQWgvTEZaZUw1NzNlREQ2SXEx?=
 =?utf-8?B?TFZnOVdPSWM1NUk0OHorS1dBU2dYd1AwMW1pWEZ6SEJKd3FtUE5qUFIrMUZt?=
 =?utf-8?B?QjlYdFZQRHdpelkrQkhhdzVXWlpVSWlROHhuYWpFTWN1N3lTMjU2WUlQbkhL?=
 =?utf-8?B?SnFZY3Z1SjZlTkx0MWN6bjBIREJOdmdXaUdyTUhxOGN5SW5PL1E0TS9Eb0ND?=
 =?utf-8?B?TVhVOHc1QnBQcm1VMnVmZlh5SlRZRE1mNVNXZU9GU1FYL01lcklFQXNoYmVB?=
 =?utf-8?B?SlZEY3FyYkh3T2x2cXVGZDNPUlhSQnZvdFpVb1R3RjJwa25mVkp5WkFUcUc4?=
 =?utf-8?B?Tjl4NlZicGdvcG92eS9OOElhVGJuWnRBT1Z3c1RncEpXSXB4bnB3WEdnRXNU?=
 =?utf-8?B?Nm95UGpKVXhMRDFQQ29TOEJWaUQ1TXltbDFzaGNQaGg3dXNjN29QMXBuckdm?=
 =?utf-8?Q?UD28GMw36MSmXPASs8g0mN1ZoKBA8dOy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2ZmVDRFNnZ6SjlzWUh1cDJRakpCcGxkRW1paEhkTWZkUktscERJT0dCUFNI?=
 =?utf-8?B?RGRDZSt4VUVVWFJRdzlLNWhFR0h2QVNsazJvOTRlcmdTREtNdm4xTldvUy83?=
 =?utf-8?B?aHNUbWFOeGJuS0wvUHNoSUU2SnordmxHOFpCYXhsY3RSMjdTSnB6endkdERu?=
 =?utf-8?B?OWlGeGF0aENqL2RsZnJzbVhYSW5MblFPZVYyMXVhSHkydWhNS2xtMXRwQVR4?=
 =?utf-8?B?MG9NdEFPL0czU29BUDZqZWVVcUJGSUVwb1k1YlF4M1R2YU9TQm9ZNkRYV3VV?=
 =?utf-8?B?UnluZS8zVEVEOEw2NkhtVUlZSFhrbXBBdUZNcU9ndTZMeDFDbDU3eE1CS1pw?=
 =?utf-8?B?d3NtMWorcHhrK2k0SUtzeTVmKzhHblk0cEp3Y2tnai9yTnExY0w0bnFuU2Fo?=
 =?utf-8?B?a3FZWWkyZjlJWWJBaVZBRjNROWRzZVVsN0dkSDZWc052RFZTZHE2em42UUw0?=
 =?utf-8?B?ZnVMV25Td1NPNnM1bFVlY2hkQVBkWHBCNDZ2aXJLOFVINjAwS29RSFFCZCto?=
 =?utf-8?B?ZXZKNi9wWnJNc2QrTitqV080eGEwQ2F5VFppQVN6VnpIWFZwbUd4b2RTTGhT?=
 =?utf-8?B?c0Jlc1Q0SDg4UzZ4aUQwVkZ5UXB2UXlNUzZKTkZEWWlYT3dnL2o0TlpWdnhM?=
 =?utf-8?B?d0pHS3BrNzBzZXZ0ZzVjc3cxTjZUeHhtOXpNKzZ0aFh5ZVRrMmVwR0hGOVNU?=
 =?utf-8?B?VEhXWFU1Ky9jOVNDeWloNUVKdTRRQTlJQ0JjaWdrbWh1dGZ2NkduaWxqRWtw?=
 =?utf-8?B?L3RSUmUzM3JxZjhGNmxqZGNpU2grRTlFc2lBVEtTTHJMQmxwS2NkOHZMMnFq?=
 =?utf-8?B?RTgwSWtNcmNZcjFoeGFCeHZ1eHpnODZtc2ExN254ZW9HUjNvNFBaZDErNDgx?=
 =?utf-8?B?bjBueDdkMjFLSU4yY2RpL2RHdG8xNkN2L1hkNnlycTQ1WXczQjFVczlnSEhx?=
 =?utf-8?B?NUljTVh6SUFyT0k3eUNYV0JtWVBzWlljN3NRekZaQTNuZ2ZnVkxxUWVwQUoz?=
 =?utf-8?B?NDJONDJsbUJIcXg0RGpMcWVqQ0dybUg4WGYyRlZUYXRrYXRKR3Yrb2FYWGJa?=
 =?utf-8?B?VHd4N1RaZHN3WHhsNG9QL2Y0dStZcFRHZjR4eWpyU2RMd05xYmszQVdFRXdr?=
 =?utf-8?B?WVVHbUI3cFczdzZWSGRyaTBQZmNwQ2VXdjNpZE1yWmZoWHNmY05kQmRya1Zs?=
 =?utf-8?B?a1NvTnJmRTRhaFd6akpJNUs1Q1ZBUEFwSjdjT0lQd2JLWTBkU3p5YzM4OURa?=
 =?utf-8?B?SkJVa0NTUFpORStUQytqU0tKbnk4U1dUellFaWJzOG8xUU1LU0xUdHlYY29q?=
 =?utf-8?B?SXlZd1VXY2VoVFpYaWkvMTJYRk9IeTE0OGVPM2xCNEw5Zjg1bXZRR0dLNTY5?=
 =?utf-8?B?a00vL2JERFJTSzBZWFByNEJNTHZiKzQ0cGlTNGN4VmRNUWNDajZEREtQamtF?=
 =?utf-8?B?dWR6S1A4dnYvamVQZ0tJSUJ5YndOYk1nb01ERVNiQ25Mb1VJcEJnTk1UaEc5?=
 =?utf-8?B?MnFmdlpETEJ1M1VIMlo5VGJIaVEybEp1RWxlb2k4bGQ1Q2JURDF6Q0VZZC9a?=
 =?utf-8?B?aVRWdkcwQndpNW93TUhtSktYZlZSUXZVN3QxSjRWSVJOaWZKdllqZHo5UVgr?=
 =?utf-8?B?eSsyZ1EvQW95U1BNMVlTR0ZsRzFFNGZvZEt5ZjB5eVlJaWkxeFdsRERzVkgv?=
 =?utf-8?B?Um03MXlDQUdXdENtakhLdllLRzhaQ1l6MUNPQWdZWmttWmdVcCtYV3JoYVBK?=
 =?utf-8?B?RXZOSUZQK0FhWUdoZmFBdEdVNXQrNThYNVl4RVFFYWh6SGpMSFN5aE1xQUc0?=
 =?utf-8?B?alppQUhnQTRWMFJJQ2NxMVBTUDBpRVhGQ29RSFdWZEtVcFNmUkhQSXBXcGtq?=
 =?utf-8?B?bVNDaS8zdGlmaE0vVGR0MjMvMWtiS09GT2pLcnNXR0FCRE5lbGVLSFdXYlpi?=
 =?utf-8?B?QWx4bGVzR1FyM0t2ODRwQ1RSREMzdlVRZnVHRVRwaWVkTW55UGZzVTlpb25L?=
 =?utf-8?B?M2ZCRnhLeGlSM3pEUTNlRVJ6c0lKbG50NnNFeU5NNFJFbS9nYnZUZzErbzY1?=
 =?utf-8?B?cHBKR1lpcW1yK2w2UG1id0o4b3dibS9DcTZ3K0tBMmlEZDg2VC9MUkF5NXBW?=
 =?utf-8?B?V1BnU3RDOXVOUFhpWTNOTmFuekRWaUVadHZqLzZycGR0NUx3UTVJZzMxc0dl?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c7fc48-d0da-4631-0d1e-08de114b13fa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 09:12:08.9860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DdBMqnNz3bgBwBnMS/MZY0MSIeRgu1n+9dDPF8/vIPLpHpnK+twT9BdxjK5hGkXuRq99QO1rhBVMsj3/klnFo82WiWF9G4eZKZxsB91rXFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8100
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

On Wed, Oct 22, 2025 at 01:54:42AM -0700, Christoph Hellwig wrote:
> On Wed, Oct 22, 2025 at 10:52:34AM +0200, Michał Winiarski wrote:
> > On Wed, Oct 22, 2025 at 12:12:01AM -0700, Christoph Hellwig wrote:
> > > There is absolutely nothing vendor-specific here, it is a device variant
> > > driver.  In fact in Linux basically nothing is ever vendor specific,
> > > because vendor is not a concept that does matter in any practical sense
> > > except for tiny details like the vendor ID as one of the IDs to match
> > > on in device probing.
> > > 
> > > I have no idea why people keep trying to inject this term again and
> > > again.
> > 
> > Hi,
> > 
> > The reasoning was that in this case we're matching vendor ID + class
> > combination to match all Intel GPUs, and not just selected device ID,
> > but I get your point.
> 
> Which sounds like a really bad idea.  Is this going to work on i810
> devices?  Or the odd parts povervr based parts?

It's using .override_only = PCI_ID_F_VFIO_DRIVER_OVERRIDE, so it only
matters if the user was already planning to override the regular driver
with VFIO one (using driver_override sysfs).
So if it worked on i810 or other odd parts using regular vfio-pci, it
would work with xe-vfio-pci, as both are using the same underlying
functions provided by vfio-pci-core.

-Michał
