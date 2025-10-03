Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE93BB7F24
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 20:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C94B10E962;
	Fri,  3 Oct 2025 18:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GnMg4hQA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6633710E962
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 18:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759517969; x=1791053969;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wiD839ccaS7u3Ptn3g74vn3m1OU3YjV8zNIqM0NPjwc=;
 b=GnMg4hQAycq0EqccHN2ZyagqaCUQuE4Z+/qB0Izzx0IGlisixHZio2Nv
 hFOJBJ0K5deWiu5So0IZXHnMOVsiiqmkc/7hqjBmisAcFhhLyNQu0Xpjf
 jTHCalJsl5ML7AYQTQiZbYJt6+w9bYYR3YStCz7MzlwPlPlw0vSFlQa/E
 bouf4d6QcaJ/fl16tgZZJLCdy5NdxpPCrXVmDEcKSMW2EdG5qXpHUZc6N
 Z8tr5p0EQlWe9xoIT2krNwFzq4o8xjst/Zgm7Cr9xmcGbhEO6LJDJaL1m
 QIr4vwL04XmUTONoxoni2cotiRuoyOLWSiJTUSs6tovE1pDVdmk42i2FO w==;
X-CSE-ConnectionGUID: LcOCc69oSNSV7npgA+yj0A==
X-CSE-MsgGUID: bc6oWb4USTS0oprSivQhUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="61714184"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="61714184"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 11:59:29 -0700
X-CSE-ConnectionGUID: L4d0Aol5QyiMQ7XELcpBVQ==
X-CSE-MsgGUID: sedTdXjUSVGfnhWNEZ0QFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="183369972"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 11:59:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 11:59:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 11:59:28 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.19) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 11:59:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WjnAfp8Pd47L85nZxJvWGgozvh+WCCh++U7Yc6ixqTcL+ajZj+vklPvZ6CAfd1Hku9SWLCOlF1JievHwJzcG+BEKK4oJ0KpCmiawQsAdVuXo7ZowgqMEBsMXhCCBE4THWnJBMv5gJ74G4+CptOsDQql9xXS4e47Xb9Gj0GN6EWYanKKqUYd7qHvnHBCxREp3grBIOJpS0rkZvmqokvCXEIdLPFCsJGnNtz1K3IwhcZLlD2CcvXkvQmXwJT5cTtIgItYQv2TWEaAf+Yd4T+FreC0ljsrA5L52RDpsaZURFY5BPCQnf1yBMyD/D/FsdluUDrJEx61LnXyfTDTLEmp27Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wiD839ccaS7u3Ptn3g74vn3m1OU3YjV8zNIqM0NPjwc=;
 b=WEbRbXPVzamtLmqjolA7D3DhOrnjxiAHlmYMvar4R2qGHg1q2AT8+ehhYWJHMTBhNDV8BDSR2EyiHBEmlofVn+HCnm4Zdx4t2zgPlLEQRmcqsVqotAo+CCZ/E6497JUlTrEkDE6nltMC77ZZnv84/UtVZNH00PH5ZSgktpz4DfkCF9cMD5IcVhWXeYjIzYPMgup79l9qKHWdv0yVqPjvbxil2W3QTApK8jRtnJ2jCUcleIegk0YYtynx2wwD5AUtz75I+DgDYNq6z3hijekm6ndAMoJUAcRiW0p9LHNJZjcYQ1lfLLmNXiJnbW2JM86WVRIeGJczx1WxSTFEAlN66g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5112.namprd11.prod.outlook.com (2603:10b6:510:3b::18)
 by BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 18:59:21 +0000
Received: from PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773]) by PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773%6]) with mapi id 15.20.9160.018; Fri, 3 Oct 2025
 18:59:21 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "nirmoyd@nvidia.com" <nirmoyd@nvidia.com>
Subject: RE: [PATCH v5 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
Thread-Topic: [PATCH v5 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
Thread-Index: AQHcNHWvB6idhqOgWU+kU1kBCRCfnbSwoivwgAAU/QCAAAVTMA==
Date: Fri, 3 Oct 2025 18:59:21 +0000
Message-ID: <PH0PR11MB5112BF73084A79F3F0E785F6FAE4A@PH0PR11MB5112.namprd11.prod.outlook.com>
References: <20251003053402.732218-1-dongwon.kim@intel.com>
 <20251003053402.732218-3-dongwon.kim@intel.com>
 <059d3074-dc1f-47cf-9bdd-ca582e150511@collabora.com>
 <PH0PR11MB51125B8A88CBFAE48E7BDC62FAE4A@PH0PR11MB5112.namprd11.prod.outlook.com>
 <ef77d1e3-adea-4120-a23f-b2925ca23b38@collabora.com>
In-Reply-To: <ef77d1e3-adea-4120-a23f-b2925ca23b38@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5112:EE_|BL1PR11MB6025:EE_
x-ms-office365-filtering-correlation-id: 19765b8d-c2f6-4e65-6e66-08de02aef63b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bHhiakF4Nk1jTFU5TlU1czhEMGQxY3RQaHJtQnJsVXM0eFRIVXhNWnJjWFlZ?=
 =?utf-8?B?OW44c0VOZVNrdHljRVMwQTZiWUVrYzY3ZlArL0ZHeml5bGZwdGNldENRUXJz?=
 =?utf-8?B?eWFmT00xeUdaOHhiKzZYampoQm5uMi9mU20rRmNTeFJ2bmtlY0x4elJvUGdC?=
 =?utf-8?B?Tk1FUTFYV3Z3S2xYRmFPSm9IZ2IyMnkyTVFBTi9OY29CQ1lpNXo2WUZjMTd1?=
 =?utf-8?B?dlpCQlVacHFhaXRSMWMwWjBsY3YyOXpwenR3dGJlbGIrV2hiNTgySFBiWnZs?=
 =?utf-8?B?N1JUN0VhTTlOczhqVUtOVDlLU3c5NlZVRENURGJFd0hSeTFWQjlWMTE2WXov?=
 =?utf-8?B?Z1dYVzgya2NMT2tqd2MveDNab3RoNGpxTk51d0VReVp0UWxVZXFLTWlHRy9y?=
 =?utf-8?B?bXNQS1lLUWorN3BSUEZrSVVmSnUwSWo4NWt1eVhpbVp5S2EvU2k3WkZxNzJp?=
 =?utf-8?B?WDhqWmJwY2FEYzFqTjNCUFM4WTNRa3MyaHNTdTB3ZlFNaXp3NExTaFp1YzY4?=
 =?utf-8?B?MGZ1MHVUb0NDUUdwbkpJZnBraVBJZGIwUXljNm8wc05EaGNtMUpKY25yWnQ2?=
 =?utf-8?B?MkZDNW1yUlNRUWNPcERrWHN3eExKeHM3MmJuczY3OE1YdWduTVhyWGJYVFAr?=
 =?utf-8?B?elZtRU5DcGFMSDFSY0Z2RjVUdlZTNWQzMWIrTkhHa0Q1OW9jZzNtUlpxWG1K?=
 =?utf-8?B?WmZObE0wMGNWRGZtQVRmODRYSlhpVkhwVUloV0lrRjhuT2hsUERlMlJSalY4?=
 =?utf-8?B?WkJFOVdTVmtuK1VkN2RPZE5CeC9BbjhuOXkvQ1BwUlN2YVk2ZGo1N000d3V5?=
 =?utf-8?B?WngvZ0hjNVR6cGtjOE9aYVd6ayt6VHZUckFvSXd4L1R5dWJTNktUYTlUcmhC?=
 =?utf-8?B?c3kwWis1Q2I2WjY4MDFKcGJjQTA1R0dqK1dXTmQvdGR4cEY0b01uQzhXSUU1?=
 =?utf-8?B?M1pKWkxQRHczMllCYkM2QmJrR1k4N015NEhVS2hNZ0hvSDFNSWtNaWZ4dGRn?=
 =?utf-8?B?ZjBIZmdMdVhDbGNiQVQ2T1RiMjVvbHdNYkdUaVV6TFlDTWw4b3lzRHNmSUFH?=
 =?utf-8?B?WlRPOE9vMWowZXB0ai95RzAxaHp6b0NYdVR1bzV5VmlWVktseW9HbVJNV1VZ?=
 =?utf-8?B?dXhYdlRnbGtLQzhUN1pxbFhSMnRxZHdCeEdyR0tpaEVNc094eE16L3FFdUc1?=
 =?utf-8?B?V0FOY2NjME5IUXdTM3VlTjluY2ZxZkU5UnVBeUhtc3A3YXIrYW1sWUNoM1Mv?=
 =?utf-8?B?dUpXT3FVamMrMjFHcnI0ZDdMTzNOR1NoN0FpVG1RcnNaUjVYNWZDbWV5K0Fs?=
 =?utf-8?B?YjNIenVyRTRjeG1PTld0d3RhdFkxZlgyRTdSUTdEam1JODVDQ3o3M0J4Q0VN?=
 =?utf-8?B?Vm5Sb2RacldBa2U4NUNka1VkaHJVSlN5N2pRcFNVcXErNklyVU5GSytueEVW?=
 =?utf-8?B?VGpMV25qaXJnYXF6U2IvdUYvUXgvQ2ljd2x2TStzTzF0K3QwTHBkbXpSTlpm?=
 =?utf-8?B?UWZIVzhVZUs0dWZxbTdRcWVSOWNyWGJKZlhPRm82cTFHS0F4Mjh4VjlKTmtE?=
 =?utf-8?B?Tk8rSUdDekdKZFY2WVlaaGxqQ2dKK1pvQVdqM2V0TWVwTS9RbkhKMDRuSHZo?=
 =?utf-8?B?bmh1bHBxQkgzYVJIWHd1Zlk1RVZNSExTMVJRWUt3d29ONE9ZUXQrNGxXVGJp?=
 =?utf-8?B?T2o1czU4TytJQUdOWmNmRnFFNTI5TFdaTHpTU2FXR1M5cXc5bHN4SGtaUXpU?=
 =?utf-8?B?ellpSnZSdXNsVTBKQnN6UEtqb2RuYjFOY3hiMThCNmRHMmVaVk5zS0hIbFdi?=
 =?utf-8?B?OXpoa3VNVkhSc25hTjFQeVdoK2dZa3hXb2lZKzNqeSsyWE5CZlh4SVNUREl5?=
 =?utf-8?B?S0VoR3RkNjFjTUR3elpjMzNFTDRmZGFMeU8yNURZQ3JHdERGelFJUUFMOXVp?=
 =?utf-8?B?dG5RY2I2NkRBUnFLL0ZuNFlmeXF4eFlHcFFvQ2Y1MkdNbllha2dxUEJ5dU9w?=
 =?utf-8?B?ZEQvcm5ZWVBKSEtwbGlRNUhCV1J0SW1sSFVPVWZZQU5ZVGZQQmJ5Tk53Q2xW?=
 =?utf-8?Q?dxbWty?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5112.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjJhNlNXNWhNaUxzZkYxS2tVeGtXbFAxbE1ZdGVwZ05KdW4xbTZYRFFxbnlz?=
 =?utf-8?B?ZGs5dHh2eDFIRlExSUZ3NUxCYTh3REpqZGk0Y2RUc3V2QWpQOUxYT1NWUzYz?=
 =?utf-8?B?OG5XRDZZSlVFSnlvM0NSVlRIUHBERzFJVU1wYTlZTTkvelNncVJVNXdpTm90?=
 =?utf-8?B?ODQrNURMQkdCQ3NCSzRkandpNUc3Vm9tVkNpWkpmTXhpdzJqaTBQVDhCVmQ2?=
 =?utf-8?B?UlVhd3VPTlhDK2RMV1FFc2YzSEVxTTdYZUZOVXB3dG43ZFVlaCt2ZGs4ZmRO?=
 =?utf-8?B?cFVpK3ZoZCtoUVVNWXR2cUJWZUs2aW1KRm43Ylk5WmpWa0JRN21KbnVoS1Vu?=
 =?utf-8?B?UUZTOUYxVFVVRUpEcEx1dnRUNlJwcG1JRW5waFAyOUplZm9FZWFkV1h5cUNa?=
 =?utf-8?B?YjlMblpZTHlqZWh1Uk5HUjU2VW00dFVubDJnS1RwVlRWTThwK3Q4bk5OUlpS?=
 =?utf-8?B?bGxNRXZvOEtaZUZCR28wcTQybi9JUi9HMVU2SkJ2NzVma0g5enROeEJCQlBT?=
 =?utf-8?B?cGkwUWRRNktVTXNQckhDR210WHI5RjBrN3loZStJeEI2QkF1V0pkM0tXT2pm?=
 =?utf-8?B?Rm1aYlZ0NnU3TWlhRTFSTzFmRmNFYTB4eVRsNE5DamxwZGU4SlJ0MW5wNnN4?=
 =?utf-8?B?ZHhVZUhEcC9TU3lPcWRIeFlocld2Q1hBdDQ5SStjN01rWWhFN0VqRVlvMC9U?=
 =?utf-8?B?R08zZktvRThsbTRJUFd4WmFNUTYxTUhHQng4ckNHMEEzK3NlNkhiZUN6VzJW?=
 =?utf-8?B?b2pkd283WEM3VUh0dllLbGNQZllCbjVpbEdpbVhNeENROWZmT0RZOGxWVXBG?=
 =?utf-8?B?bnowQ3dGelBvUDQxK3VxOE4vTVZYZ3hlcEw3VG15eDlnWFdVdDRWb1JQSTh4?=
 =?utf-8?B?T2QwUGRZNDNtbGI0NWsvSHNyYzZtOU1HcEdudlExczVlSXFFdC92TUtVcmRL?=
 =?utf-8?B?dGpzRFZEUEM3VjlIazZGWTk3L2Zpd1hkekRKa3I0VzkzWGJOeFpqYktuQ1Jm?=
 =?utf-8?B?UnlZRXlDd1VmbDVpM2lXb1JFRXFnbmJvNjE4Z0NsUmNsQUJxZ05QK2ZPY2Ns?=
 =?utf-8?B?OUJLTVpzYnBTZFZxSHN5ODFCcm14QjVlaTBFTVEzTkJXYXVOWnR1Q1FDUlVC?=
 =?utf-8?B?ZHNnSThFS3BQSEhWK1ZUMXloM2wyWFZtWVVRUlF5WStNd20yakoyVUV0ODhO?=
 =?utf-8?B?ZXVtaUxHUWZSQXA4ZTV1WjRQZHBjMjYzc29pU3RaRVhEWTZ1Sm9JNkpxTHpy?=
 =?utf-8?B?aERkMXJQRWdqaE1tUW5oS1Y2dkZxellyem50MTZMbDZBNnJHQ1FUVFcwNXl1?=
 =?utf-8?B?VHhTbExIaVdZb1Z1UDFQMklzWFJ2ejV4QUErZzRGVkYwN3h2Y0JuQjM5NzZp?=
 =?utf-8?B?eVZzT0RCQzdxOU8ybHZkeTcwVnBUSCtDV2RoK2d4ckYxZFJ4NW5ubnc5WmQ1?=
 =?utf-8?B?ZUkrajVsWlNRNHF6Tko1SGdhMU1HdTJTbkVJNjBkdEhUaVkyTzBXVHRrMGRQ?=
 =?utf-8?B?ZWtmL0xDTFhCL3Fkb0RoNUxBUXQyUmZ1SStKK2VGZ1VSWlI4R3VMdTAvakFi?=
 =?utf-8?B?WnQ2TDYzblZ1K2RGKzdxZENya2ZleHZFVnBDTVRoWkI0SjNldlR1RFBJbnhh?=
 =?utf-8?B?T0xTZGdTZkVKT2hsZ041Rlh3QmpDTVJXWFJYQkxsc1dzZzFmd1VxT2xXUS9Z?=
 =?utf-8?B?elRkeUJnZTFxbnRRTVdERjBiN01aUnllWnBtdjFkUkVIUTRBRGtobC9PdWlR?=
 =?utf-8?B?dkk0eEpRdWNPaVdLd2cwaUU3d0NiZDFjMjVoK1c3NFo0V0hMVTNvUmRLMEp4?=
 =?utf-8?B?R0h0VjE1Y2xOdUFZTldUbzkxTnBDV0YwRWJUYmJxNE41WUo0TDNRTll5Tm5I?=
 =?utf-8?B?bi9tNE9aelZYNlI1TUFEY3A5azhPaEV2OW9VSURZNndmeVhNZVVRaEQrUjRq?=
 =?utf-8?B?R1c0TnlPVW5GQ0dnTVdrckZiak4zUk9QVjVCUEFlWUpHcVBLS0RnOVV2dkJa?=
 =?utf-8?B?Y2VxcFZqdEhIK0liNzc3YWNINWg3MzF1em1NT0dReGpOUzdqekJrK25sVXpT?=
 =?utf-8?B?RnJxckg4VnF2Zkx4ZTZpTk1yUGRaRUZlSmxQZHZKOFBrck1Ib2JXZVhtK3lv?=
 =?utf-8?Q?zIP7IDCNJWeshXv8CZpvupvOk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5112.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19765b8d-c2f6-4e65-6e66-08de02aef63b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2025 18:59:21.1545 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9DyurD0n733pamCXI0dPiSzjn0fNTgfdRSALjbZVagFAjyyZJyvFo73K/z5ju0qyW50Uwwz2w4QtgmpRepLLAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
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

SGkgRG1pdHJ5LA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMi8zXSBkcm0vdmlydGlvOiBB
ZGQgc3VwcG9ydCBmb3Igc2F2aW5nIGFuZCByZXN0b3JpbmcNCj4gdmlydGlvX2dwdV9vYmplY3Rz
DQo+IA0KPiBPbiAxMC8zLzI1IDIwOjAxLCBLaW0sIERvbmd3b24gd3JvdGU6DQo+ID4gSGkgRG1p
dHJ5LA0KPiA+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMi8zXSBkcm0vdmlydGlvOiBB
ZGQgc3VwcG9ydCBmb3Igc2F2aW5nIGFuZA0KPiA+PiByZXN0b3JpbmcgdmlydGlvX2dwdV9vYmpl
Y3RzDQo+ID4+DQo+ID4+IE9uIDEwLzMvMjUgMDg6MzQsIGRvbmd3b24ua2ltQGludGVsLmNvbSB3
cm90ZToNCj4gPj4+ICtpbnQgdmlydGlvX2dwdV9vYmplY3RfcmVzdG9yZV9hbGwoc3RydWN0IHZp
cnRpb19ncHVfZGV2aWNlICp2Z2Rldikgew0KPiA+Pj4gKwlzdHJ1Y3QgdmlydGlvX2dwdV9vYmpl
Y3QgKmJvLCAqdG1wOw0KPiA+Pj4gKwlzdHJ1Y3QgdmlydGlvX2dwdV9tZW1fZW50cnkgKmVudHM7
DQo+ID4+PiArCXVuc2lnbmVkIGludCBuZW50czsNCj4gPj4+ICsJaW50IHJldCA9IDA7DQo+ID4+
PiArDQo+ID4+PiArCXNwaW5fbG9jaygmdmdkZXYtPm9ial9yZXN0b3JlX2xvY2spOw0KPiA+Pj4g
KwlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoYm8sIHRtcCwgJnZnZGV2LT5vYmpfcmVzdG9yZV9s
aXN0LCBsaXN0KSB7DQo+ID4+PiArCQlyZXQgPSB2aXJ0aW9fZ3B1X29iamVjdF9zaG1lbV9pbml0
KHZnZGV2LCBibywgJmVudHMsICZuZW50cyk7DQo+ID4+PiArCQlpZiAocmV0KQ0KPiA+Pj4gKwkJ
CWJyZWFrOw0KPiA+Pj4gKw0KPiA+Pj4gKwkJaWYgKGJvLT5wYXJhbXMuYmxvYikgew0KPiA+Pj4g
KwkJCXZpcnRpb19ncHVfY21kX3Jlc291cmNlX2NyZWF0ZV9ibG9iKHZnZGV2LCBibywgJmJvLQ0K
PiA+Pj4gcGFyYW1zLA0KPiA+Pj4gKwkJCQkJCQkgICAgZW50cywgbmVudHMpOw0KPiA+Pj4gKwkJ
fSBlbHNlIGlmIChiby0+cGFyYW1zLnZpcmdsKSB7DQo+ID4+PiArCQkJdmlydGlvX2dwdV9jbWRf
cmVzb3VyY2VfY3JlYXRlXzNkKHZnZGV2LCBibywgJmJvLQ0KPiA+Pj4gcGFyYW1zLA0KPiA+Pj4g
KwkJCQkJCQkgIE5VTEwsIE5VTEwpOw0KPiA+Pj4gKw0KPiA+Pj4gKwkJCWlmIChiby0+YXR0YWNo
ZWQpIHsNCj4gPj4+ICsJCQkJYm8tPmF0dGFjaGVkID0gZmFsc2U7DQo+ID4+PiArCQkJCXZpcnRp
b19ncHVfb2JqZWN0X2F0dGFjaCh2Z2RldiwgYm8sIGVudHMsDQo+ID4+IG5lbnRzKTsNCj4gPj4+
ICsJCQl9DQo+ID4+PiArCQl9IGVsc2Ugew0KPiA+Pg0KPiA+PiBObyBuZWVkIHRvIHJlc3RvcmUg
YmxvYiBhbmQgM2QgcmVzb3VyY2VzIHRoYXQgd2UgZG9uJ3Qgc3VwcG9ydA0KPiA+PiByZXN0b3Jl
IG9mIGFuZCB0aGF0IHdvbid0IGJlIGluIHRoZSBvYmpfcmVzdG9yZV9saXN0IHNpbmNlIG9ubHkg
c2htZW0NCj4gPj4gb2JqcyBhcmUgYWRkZWQgdG8gdGhlIGxpc3QuDQo+ID4+DQo+ID4NCj4gPiBX
ZSBhcmUgdmVyeSBpbnRlcmVzdGVkIGluIHJlc3RvcmF0aW9uIG9mIGJsb2IgYXMgd2VsbC4gSXQg
aXMgYWN0dWFsbHkNCj4gPiB0aGUgcHJpbWFyeSB0eXBlIG9mIHJlc291cmNlIHdlIHdhbnQgdG8g
cmVjb3ZlciBiZWNhdXNlIHRob3NlIGFyZSB1c2VkDQo+ID4gYXMgZ3Vlc3QgZnJhbWUgYnVmZmVy
IHdlIHJlbmRlciBpbiBRRU1VLiAgQ2FuIHlvdSB0ZWxsIG1lIHdoeSBpdA0KPiA+IHNob3VsZCBi
ZSBleGNsdWRlZD8gV291bGQgaXQgYmUgYmVjYXVzZSBvZiBhbWJpZ3VpdHkgb2YgdGhlIGxvY2F0
aW9uIG9mDQo+IGJhY2tpbmcgcGFnZXMgZm9yIGl0IChlLmcuIFZSQU0pPw0KPiA+DQo+ID4gQW5k
IDNEIGlzIG5vdCBvdXIgcHJpbWFyeSBpbnRlcmVzdCBzbyBJIGRvbid0IGhhdmUgYW55IGlzc3Vl
IGV4Y2x1ZGluZw0KPiA+IGl0IGJ1dCBpdCB3b3VsZCBiZSBncmVhdCBpZiB5b3UgY2FuIGV4cGxh
aW4gdGhlIHJlYXNvbiBmb3IgaXQgYXMgd2VsbC4NCj4gPg0KPiA+IFRoYW5rcyENCj4gDQo+IEdv
b2QgcG9pbnQsIG9ubHkgaG9zdCBibG9icyBzaG91bGQgYmUgZXhjbHVkZWQuIFdlIGNhbid0IHJl
c3RvcmUgVlJBTSBvbg0KPiByZXN1bWUgYXMgaG9zdG1lbSBpcyBsb3N0IG9uIGhvc3Qgc2lkZSBh
ZnRlciBlbnRlcmluZyBTNC4NCj4gDQo+IEFjdHVhbGx5LCBub3cgSSBkb24ndCBzZWUgd2hlcmUg
aW1wb3J0ZWQgZG1hYnVmIGd1ZXN0IGJsb2IgYWRkZWQgdG8gdGhlDQo+IHJlc3RvcmVfbGlzdCBp
biB2aXJ0Z3B1X2RtYV9idWZfaW5pdF9vYmooKS4gUGxlYXNlIG1ha2Ugc3VyZSByZXN0b3Jpbmcg
Z3Vlc3QNCj4gYmxvYnMgdGVzdGVkIHByb3Blcmx5Lg0KDQpSaWdodCwgeW91IGdvdCBzb21lIGNy
aXRpY2FsIHBvaW50IHRoZXJlLi4gSSBmb3Jnb3QgYWJvdXQgdGhpcyBvYmplY3Qgd2l0aCBpbXBv
cnRlZCBkbWFidWYuDQpXZSB3aWxsIGhhdmUgdG8gc3RvcmUgdGhlIGNhc2UgdmlydGlvX2dwdV9v
YmplY3RzIGJhY2tlZCBieSBpbXBvcnRlZCBkbWFidWYgYXMgd2VsbA0KaW4gY2FzZSB0aGUgYmFj
a2luZyBzdG9yYWdlIGlzIHN0aWxsIHZhbGlkLiBCeSB0aGUgd2F5LCBzbyBmYXIgd2UgYXJlIG5v
dCB1c2luZyBpbXBvcnRlZA0KYnVmZmVyIGFzIGEgZ3Vlc3QgZnJhbWVidWZmZXIuIEFsbCBzY2Fu
b3V0cyBhcmUgb3JpZ2luYXRlZCBmcm9tIHZpcnRpb19ncHUgaXRzZWxmLCB3aGljaCB3b3VsZA0K
YmUgdGhlIHJlYXNvbiBpdCBoYXMgd29ya2VkIHNvIGZhci4NCg0KQW55aG93LCBubyBtYXR0ZXIg
d2hldGhlciBpdCdzIGltcG9ydGVkIG9yIGNyZWF0ZWQgYnkgdmlydGlvLWdwdSBkcml2ZXIsIEkg
Z3Vlc3Mgc3RvcmluZw0Kb25seSBibG9icyB3aXRoIGJvLT5hdHRhY2hlZD10cnVlIHdvdWxkIGJl
IGVub3VnaCBhc3N1bWluZyBob3N0IGJsb2IgZG9lc24ndCBoYXZlIGFueQ0KYmFja2luZyBwYWdl
cy4gV2hhdCBkbyB5b3UgdGhpbms/DQooSSB3aWxsIGFsc28gbW9kaWZ5IHRoZSBjb2RlIHRvIHN0
b3JlIG9iamVjdHMgYmFja2VkIGJ5IGltcG9ydGVkIGRtYWJ1Zi4pICAgDQoNCj4gDQo+IC0tDQo+
IEJlc3QgcmVnYXJkcywNCj4gRG1pdHJ5DQo=
