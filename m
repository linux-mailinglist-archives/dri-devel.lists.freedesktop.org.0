Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F2ABC25AF
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 20:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C703310E702;
	Tue,  7 Oct 2025 18:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aAB+KDEf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E4210E6FE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 18:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759860977; x=1791396977;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YLfNMDm42GbWErzpXXFVrDIi0HXFk7n3yyF8UL3wBHw=;
 b=aAB+KDEfNwuE7FvypWz/btbU3yw55zWg8Da4hTjTb4fbggokw/kkOpI+
 UKjg0zeI9yhT4Q1Q/aSn2MWP3cKpc6q8isi3Jx76LcRDmEo3t83bg0FjZ
 kcJybu1xirjL5pWhkY8wypgIBVqIFQW+Qgila5d0iuVSRs/YWqFxlSkwM
 1EKH8mUf+4bSzpk5IefGnpjtZM0/mLL3qpCnu7qb9ix5XF8BzRUYR4MNO
 nPN8ryojd3sbSubPUW3BPPgjqCfsNNh7JLKn9k3YG0ZInZnMD1uGcBKdD
 NK7fUKjyNvoJFAHBYJJlcJ+6pmVmSjKQ6ycSBreipBRFSpEpFXZHx+XYp Q==;
X-CSE-ConnectionGUID: +9GrmqvaSoy/60+yj+Ydwg==
X-CSE-MsgGUID: xrgYOMsqQhG0bFiTjPJUcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="61758660"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="61758660"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 11:16:17 -0700
X-CSE-ConnectionGUID: t7yMesLYTXq+E8Xr08OHxw==
X-CSE-MsgGUID: pjGLPzUzSlO/z0QlLgx0ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180263603"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 11:16:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 11:16:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 11:16:07 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 11:16:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEKRLeEZzq+TfzEejh4tJRwZOsJ+Rbq2+tiaMhUGWUuIhZwpr2s/V5DUniIYzhADr6hyjxIYoiPo6au0QGsIbvQpb8UlnlOLY+8uIVF7UJ60f62O8oE2NR6tW6QY0VeJM2GMl619dSddz5IO1wc5IoFxFuTLZFDTRDis2RmPCpfSePimWocWTpN7TzQjq3QUoK5aLyQpxhabnu0sgrtHcfuzOjzimkbZP6tWbA9sF2NYbeEU7ZZ60hbduntn7d3X9F6InUnaSF+X6lbqGM/AHL3BGcVaDfCnJzfns+sW5How2o4pT+iUZ3lcywHZYrlQ0tke8Mf64+1XN0+B7LlSiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLfNMDm42GbWErzpXXFVrDIi0HXFk7n3yyF8UL3wBHw=;
 b=Qgpt8iQiwCk+WQu9vo78grDo6wmeq7gnNeXgTGocgUjcYhagYW+SvSndFAHb/WWWhcyQwE438VpiC3xd0MnPTJiHyWuAKxoNv2PrqbaG9jBU2HchSS5JBFIczkKsQILbUTQU1ypJOTNBqv5CxCFdgWWlYCi8oSjvHQAtnbXFEy7MUyDRY/eQNDzKBg+0SBM+v29RHd/+D7vYRyUvNA5dYjQP2sSu0yg+SU7eal/aHwRDFOy0vE+mXxuDiFSCjJ7mUdAqm5i7gfyKwtCTQ+Yz6Ts5+nrV33DjjifuGh7jk7RdeuN+KIfwOxypYrC0Ldu0KR73kNMllqm6g+1eyqp7fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5112.namprd11.prod.outlook.com (2603:10b6:510:3b::18)
 by LV2PR11MB6072.namprd11.prod.outlook.com (2603:10b6:408:176::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 18:16:01 +0000
Received: from PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773]) by PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773%6]) with mapi id 15.20.9203.007; Tue, 7 Oct 2025
 18:16:01 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "nirmoyd@nvidia.com" <nirmoyd@nvidia.com>
Subject: RE: [PATCH v5 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
Thread-Topic: [PATCH v5 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
Thread-Index: AQHcNHWvB6idhqOgWU+kU1kBCRCfnbSwoivwgAAU/QCAAAVTMIAEdXYAgAA/3bCAADp1AIABSHoAgAAOGDA=
Date: Tue, 7 Oct 2025 18:16:00 +0000
Message-ID: <PH0PR11MB5112550E12DAE19930A5ECC5FAE0A@PH0PR11MB5112.namprd11.prod.outlook.com>
References: <20251003053402.732218-1-dongwon.kim@intel.com>
 <20251003053402.732218-3-dongwon.kim@intel.com>
 <059d3074-dc1f-47cf-9bdd-ca582e150511@collabora.com>
 <PH0PR11MB51125B8A88CBFAE48E7BDC62FAE4A@PH0PR11MB5112.namprd11.prod.outlook.com>
 <ef77d1e3-adea-4120-a23f-b2925ca23b38@collabora.com>
 <PH0PR11MB5112BF73084A79F3F0E785F6FAE4A@PH0PR11MB5112.namprd11.prod.outlook.com>
 <0fef25c6-c423-4d00-bbca-1744c2305afb@collabora.com>
 <PH0PR11MB511295459D829356E4416957FAE3A@PH0PR11MB5112.namprd11.prod.outlook.com>
 <11358030-ec48-4e07-b056-d5be29a38707@collabora.com>
 <da75f737-4593-4ddb-9a51-5a22b2bd635c@collabora.com>
In-Reply-To: <da75f737-4593-4ddb-9a51-5a22b2bd635c@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5112:EE_|LV2PR11MB6072:EE_
x-ms-office365-filtering-correlation-id: fd95ad0c-87f3-4d6d-1fb6-08de05cd921d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bnNQcS84K0hMNjMveDkrTWZNQjZ0c1dYNUxMcUg2NVlRcGw1VkI5cURLVSs0?=
 =?utf-8?B?L1F5eUJXaHYrOHRzQU9aSGpDWVRiYUxwWitvOWp5dm1IakZxV0hCKzNwR2Ur?=
 =?utf-8?B?MjlNbXNwVXI4Z3p2OERxVmJYZjh3aWFqWE1zZjl2SVQ5cVh1K2VYQTB6OWk2?=
 =?utf-8?B?bTFBb3JSNUd6Mm5Mc0EwUFhxaFBFZXU1L3VWVWNzSERxN3JESUJFU09BMzkr?=
 =?utf-8?B?M0h6aFVXby9UQ0U1YVdJckF5QjNwMkFHL1NPb0sxeTlsZ2V6bmNvMDdsRG1n?=
 =?utf-8?B?ald2dXR5aTRHZXNXeXVSSTRaczc1bWN0MGMvdFJ4MzBNL3R1ZXZnRXAzRFly?=
 =?utf-8?B?WXQ2bDFZNGk0aGxvVjl2c1g4b1dFOFVrM3NpVXEyL1N1dGp4dGcvTnFMTG5a?=
 =?utf-8?B?WWcrY1AyVXUvZjlReEltbVFhbGcrQ1oyQTJqejhCWUFSNWlsbXN6NXBZdm1j?=
 =?utf-8?B?Ym1KQktrNlNONlBWdFptcGNOUzQ1MDljUW9hUTNKWGZXaTJsOGpjZlN6S0Jp?=
 =?utf-8?B?eEtqWlU0T2crWlRIcU85ZklSckJ1cm1nWFRvNnZpdCsvQzVveGxjN2RrNnVa?=
 =?utf-8?B?MU1sS3BXQU53dWkwOWZyV3FZbXMwVThZWit3RDNJYlJhb3pONkluZ050VWVk?=
 =?utf-8?B?QXNHTXBhblJZS0p2VHM3aVZIeUY5VHUvN1FjVUtKMUFzaDRvVmF1cDZUUjFW?=
 =?utf-8?B?UVZ0OEFIc1A2SjM3amFRN0VUWEJyRU95czl1TWdnZmtvdUVOOGpnVG9Zb2Rq?=
 =?utf-8?B?cEhRQjR6V2REeWh4Sk5RZnpYblFQNFh3dFoxTDZhODJzOERWNXR6ZjlhbWVM?=
 =?utf-8?B?bVluYWFLRG9JcXgzNU9LQ2hVUW44TW9oVlcwVWNDVndyNmJhbXd3cW1BNFZk?=
 =?utf-8?B?TWIvZzJXMkpnVDhlZy85RUpQVFpTSEk5cEorNStSSUsxdGlmdFFZdWlmNHBz?=
 =?utf-8?B?Q1Z0dGd1M1ZON3VIcWE4NkdDalNBWnpDY1lHbTFySW12L1JWelVobE5EL0ZL?=
 =?utf-8?B?RzRyc2o0cUIxS1pTWVp3RzBmSkYxSVhtakV3QkFGMkV3YzBVUVRqeEZydFBE?=
 =?utf-8?B?MjRwaDlneUxvOFMwdi9hMGdwd2VJcVdPb2tmd3dtdmtXNnJ6M1VGVjUxcDVZ?=
 =?utf-8?B?U2xkbXd2bVBiVmNrUFFlcmVpMTF3MnVLWURuN0F5a1Z5czRrSXVnQjNCNDJK?=
 =?utf-8?B?UzFZQW11MFRxZXExSzcxSElMQ09rajBTQlU3QUdIQ0VYNVgzRjlzZHVYRmlk?=
 =?utf-8?B?eXBxdStROWFhTE5FRzJHUEdUY0RLcG93UklzQm1BOWwrU0xIdmhBMUpNTmlM?=
 =?utf-8?B?S3hickV2eVlHTFpGU1F2NE42WUJPZkNjbFpQVDZvSFdPdmtRUVhjMGVxeEZL?=
 =?utf-8?B?alVXbENWalNGVytpQnBYVFZra1N6QTVlVUE4UU9ZemZnRjByNTNNckdkWlpy?=
 =?utf-8?B?bnV3NVBHdU9TdllCMU4xTWpRdzkrVFk5UnlUN0V2NmFkM2xwaktQRzloUkU5?=
 =?utf-8?B?My81cG1nTWtRVVhiZU1sTWpDWC85TVE2MTh5d3J0UXNiYllqYjF2YktuVFhz?=
 =?utf-8?B?MXI4eUE0WGx0ZUdnZkpzNGFkdHhrd2M3QnF1QURmQVFLc1llcWwwTG5PSU5V?=
 =?utf-8?B?Rzg5VExZYTNKaDlScGdNQTZUcWxwWExZSzRmcFhYdjhHWVY5UXN4a213WWRl?=
 =?utf-8?B?Q2tUNU1ZaFM4VldBVmdGTmJJeVpFa0xqZ2V4RnF6RTd0NnZWN2NFUWpzWDl5?=
 =?utf-8?B?NFA4Z05Gdzc4bktmbGdwcTZxbjRnQ2xXMmN4QnpGUTdwZGZHWnFPdWNhSThq?=
 =?utf-8?B?bDlCbytjQ25vczQxVWRXSlladXM2UGhhek5URXdFWllOa0QvNjZMNzgrUVQ3?=
 =?utf-8?B?azhEdElOZ2IxemRSdVg5dVBNMGgySlRPZm5JZWZTQnd2RVMxUm9XeHVVc0xp?=
 =?utf-8?B?MDFEWkJqRWhvYTlhRlpJWEQzUmtnSlV2d2M5N01BZms3cmxoQi9RdERFY0ll?=
 =?utf-8?B?Q3Q1RytFa2VkK1lsVU01WEFYc0xSYlZLckZUUmxLY3czcUVMQlZNeGl5UDZi?=
 =?utf-8?Q?fel3ln?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5112.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VU5qWk5kelJ5MWdsc1pEYTBVaUpUU1dMbkxzOHAvQ285YVR4bU9jclNRenVv?=
 =?utf-8?B?cDRlSjB0QmkyQlF4VFl2VzZRcGtPYW5sQlZVMHdudjNUV1RPdE5NKzhjbUI4?=
 =?utf-8?B?d1A2cVpYckFVRW9Id3VyeHNTOHQ2NDQwWDNnYjBQQ0thOVlQdGZQei9nYk9h?=
 =?utf-8?B?UzlEM2dTME14Q1dCVGlXOEVzeGJPdEI2NS9MR1pPdmEwMDNyQzBaYkRtOEVP?=
 =?utf-8?B?c1pPL0JWTXpLWENCc0xZZUIvZi9vUlJ2LzFyN1JuUnMra0tQM3RpYko5SDlq?=
 =?utf-8?B?ZnVvQnc1L3hYeDdVYVhzVEJnUWlYaVY5bnNXSmVCU1phcHlwQWJhSm5Cc0pH?=
 =?utf-8?B?WHc0Rk5yL2RldUdxZGNBSEhPVlRoZ1JqU1lrbFhGWER0OTlTYlhUTXpUN29K?=
 =?utf-8?B?TFlqODFBNDF2bzM0b0QvRDZCV0ppUXNiaERNdVp1dGVPUFJoRkJtbldQNmVj?=
 =?utf-8?B?Zk1HSVU1WlltLzh1bmRXdjBlK3p5V1dRY2ZLaWxSUVZ6YmJ3QStjQnB0amNr?=
 =?utf-8?B?Tm9iSUxKekpiV3ZkcW9YblJDNFc0S0c4Si9TZE14L0wzZU5XaUZ5WW5jMm5E?=
 =?utf-8?B?dldmeUlISjFxckx0dWpKdmFzTVk0VkY5K1l4dElzR0JrTUd3dm5jMXoyR01B?=
 =?utf-8?B?eG1MUnZzaUY1MGdOZEwzanRKKzRxakZOeHppTkdoQ1I4OWk5MEVRUGo2aHdK?=
 =?utf-8?B?N0tBbjR2TFVhQ3hJUEQ1NXQySXlOS204dW9LL1c4VEROa25oOVVjUmM1ZlZj?=
 =?utf-8?B?dTVWVlZSTmgrSGkxaTllSzZmNS9XTXBUK2lZcGFzbHFvL1p5SStRcldOSVdY?=
 =?utf-8?B?QURGajM0am94UFhBS1J6cCt4a1RoT1NRVmhMdWxYMThyTXhCTzBlMUZaaFlI?=
 =?utf-8?B?TjMvQWordWVKbXFXNDBEWTdJVE9IdytwYzhWZFFPL0d2bTlqaU9SaTJJS0t0?=
 =?utf-8?B?Vi9Oa2svSUhKN1czaFUxclFFKzN5ZEtaQTRldlJaR1NTRWhOcnlFYlNENDls?=
 =?utf-8?B?Z3pNeC9Icy9qS1lUTGpWTkZpRVFRZnl6aFhFV2NHOW5Sd1RxeWtybnl5eXpD?=
 =?utf-8?B?T1FMSlE5a3lNZ3Buc0tSWGFKL25pYnFGSTErMnpqcGlsOUljeXJZM05kbTla?=
 =?utf-8?B?WWtPNW5MTEQ5dGF0ZDEwRGtCOG9QVkU1K0VvSC8wc0dueUtKL2FlRTJ1N2lG?=
 =?utf-8?B?b1V3aldvTWF5dElPRzZ2dUwvZWpjZ3pzOVRNOEFnYmN0MzZMNVZ2Q0Zld0cz?=
 =?utf-8?B?V1U3UUowZU1EZU44VDJvSlFwQS9XNmF5cllTUHlmdE5jRThUWWhwMnJkUXhj?=
 =?utf-8?B?a0pyOTEwcUNBa0J1R3lNZUl4VGp5NmM2OHBsMFI1VTJuQWFkTjZpdXFLb0pr?=
 =?utf-8?B?K0xGRGFITkoxQ2dUUGN3MWdFSzhXRDltRm82dzk1dlB2Vk4wazljK0U4aEZX?=
 =?utf-8?B?a1dsV1l0N3BZbmt6TFQ1eWJiQ2FqRW1mdFExLzNzejFMRmZqTElSTHp2ajZy?=
 =?utf-8?B?eUtMRlZBelFRV0Y4VENKWGlGNmk4aFZPMG5zb0xmclpXMFNTeUJqY2tEcktp?=
 =?utf-8?B?RlBzUjM3UXZuMkd0SUFCT1lPWFVzUW1XdVBiZ3BRV01BbFJjMEViNnJPcHBz?=
 =?utf-8?B?dFlZY2Vlb0JoL1ZvcExPNnIxbCtOVjcxbEU5UlZSM1pLNitiQWp4SHk1WktB?=
 =?utf-8?B?U2dqMWpURG0yb3JJRE1aaC9QaVVPL0lrd0hrSlp2QkVPTFQrNVc3TlkwYXg1?=
 =?utf-8?B?ZmFEbXU0Q0pOWDFUVmhOaThzNUx5RmNWN3ZJeDV1aERpMTIwY1FybWx0b3Fa?=
 =?utf-8?B?S2tBSEF0OVBub0dNUlg2QlA3QnF5Y213UklpVTM0ekxaSkE5aFFFc2NPVCta?=
 =?utf-8?B?Q1dNZi9JZkM4dmxnU3lTUDkrdStUSjFTUkFWMHJqTjhuYmdlWWxydEFPNFdV?=
 =?utf-8?B?Q2ZYUm45dlVhS0I0NTBWakI0NTlrNk5XV09TdUtZTEp2L21xQyt3aDBMck95?=
 =?utf-8?B?aWh5RzVmbHM2c0FpTnpUbnlkKzFyY0hoa0YzWEc4U1R6WFBTbTlZU253azBJ?=
 =?utf-8?B?ZEswZzREdXZvZjB6Y0hXVXZhekhQbytLQlN3djdtV1VuN0tHNzRCQ0pmTlB2?=
 =?utf-8?Q?0CPr+XrgQqYzACbmPvSNXlDN5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5112.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd95ad0c-87f3-4d6d-1fb6-08de05cd921d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2025 18:16:01.0729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PSmrKksaa+yjwKRipi84i6xmTIpC3bb8TRiDkRwVx+/paNef0IhSkNMUDHPHOckxDjvECrpEBpqOTf9EIEY8Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6072
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

SGkgRG1pdHJ5LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IERtaXRy
eSBPc2lwZW5rbyA8ZG1pdHJ5Lm9zaXBlbmtvQGNvbGxhYm9yYS5jb20+DQo+IFNlbnQ6IFR1ZXNk
YXksIE9jdG9iZXIgNywgMjAyNSAxMDoyMiBBTQ0KPiBUbzogS2ltLCBEb25nd29uIDxkb25nd29u
LmtpbUBpbnRlbC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBu
aXJtb3lkQG52aWRpYS5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAyLzNdIGRybS92aXJ0
aW86IEFkZCBzdXBwb3J0IGZvciBzYXZpbmcgYW5kIHJlc3RvcmluZw0KPiB2aXJ0aW9fZ3B1X29i
amVjdHMNCj4gDQo+IE9uIDEwLzcvMjUgMDA6NDUsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToNCj4g
PiBBbHNvLCByZWplY3QgaGliZXJuYXRpb24gb24gUE1fSElCRVJOQVRJT05fUFJFUEFSRSB3aXRo
IGEgZXJyb3IgbXNnIGlmDQo+ID4gdmlyZ2wgaXMgZW5hYmxlZC4NCj4gDQo+IGZhaWwgaGliZXJu
YXRpb24gaWYgaG9zdG1lbSBpcyBlbmFibGVkIGluIGFkZGl0aW9uIHRvIHZpcmdsIHNpbmNlIGJv
dGggY2FuJ3QgYmUNCj4gcmVzdG9yZWQNCg0KWWVzLCBJIHVuZGVyc3RhbmQgaXQgYW5kIGFtIHdv
cmtpbmcgb24gY2hhbmdlcy4gQnV0IHdoYXQgZG8geW91IHRoaW5rIHNob3VsZCBiZSBkb25lDQpJ
ZiB3ZSByZWFsbHkgd2FudCB0byByZWNvdmVyIG9iamVjdHMgYmFja2VkIGJ5IGhvc3QgcGFnZXMg
YWZ0ZXIgaGliZXJuYXRpb24uIElzIGl0IGp1c3QgYW4NCmltcG9zc2libGUgdGFzayBJbiBjdXJy
ZW50IGRlc2lnbiBvciBpdCB3b3VsZCBiZSB0b28gY29tcGxpY2F0ZWQ/IA0KDQo+IA0KPiAtLQ0K
PiBCZXN0IHJlZ2FyZHMsDQo+IERtaXRyeQ0K
