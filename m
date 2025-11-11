Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0467BC4A313
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:06:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546BC10E4AC;
	Tue, 11 Nov 2025 01:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WPCKEHnE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D30810E4BC;
 Tue, 11 Nov 2025 01:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823174; x=1794359174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=b8U4pK1jWWoBOTqkbglL9y9auvkRgwGRDM322IO4bwY=;
 b=WPCKEHnEuFqoMZLN9ro/iaXOTWLJI+hPPnuqccftToMinCx0qBoxDVPW
 xzOJEmFnYABoMRgw21Gdgm/puRgOXF1lvVi4GRK5KGGZppvKeDiweFOT0
 egGAyQ2x24vsQMU95I9CfFUt6M4yOVs8J1M2i1Kza+YXB/tBa9xlIDQb6
 iqdw2QO+fwNGscnXlzYLJDR0LuBtycGM4zAp7lXwfc04RortKedRTLssv
 FWdU/mtU4qu9MXn0cHH5Zoc1EAitqkP4PUjcRxi1m67BPtZxZBKquAGny
 c1gBcyVfqi1n9EFEvdkIIEcuKFuJTKdFif4sbxFBEXjVY8R2hqenK02ww A==;
X-CSE-ConnectionGUID: aTRp9fRRTU2PE8aBtFoxnA==
X-CSE-MsgGUID: U4g5IADeQ+6wqcWO3HODIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64915513"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="64915513"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:13 -0800
X-CSE-ConnectionGUID: NoW8yluxSLitUFf9ldCe/A==
X-CSE-MsgGUID: wTdE+qh1SHqnR4+oaN4WUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188081904"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:06:13 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:12 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:06:12 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:06:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4ZECGbccXmOflCbx0I3jSZFxc6vqRoxBiaTAMYEfxLfoe81+H/f3IJpDqARxHsE+TFctVwN9Cd0PvEdesymKi/k2mCq8ealYJr1RWwrj5qWrhkH9HKmdjpLy38jt0HcjFkz8xfKuDiC4uXs7yW5qnTYdLPLq06m3yxmtLIaYOsX6+qqDF59DAEVo0yEPX3pg6RSDr9n5tA4Oe4BnDth0YMi70J5QFUsrMCvc5uUNpKyVFXLeaP1oo+ZB2LcGK/hgxylztnH6zbYD1o2ZQAyAosS0wvcdLXaQCOKHCEiZXcvhP1G9DEL4cj88nwqmP7M4sw7lAPAjR7nYPyTsoEmNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duSVDixJqZRaOqR4EEdEVK++V0deOpKTfzkDfz4ZyuU=;
 b=Du/0qqlBp+X9jR28Ns8eJ/YI83ET7fwIEQ7CcTo5cz1qzVGsSuwaQcuyaaj1PQg5CNo6bgrvJiKxbuH+GOiUKSDXQiip7o96FZELkNnQQ5iaUJ6kRPzEJGZ7qRr3Q243a76hcAxN64YTXoUnpC8l3AD2rZp78u0G7JoqobCA9cfg8zBs088z8vaIy+4e7sKmpt1p/tIqmj9arVrbND6pvzPdmpCiVL6js1qyiwT83kbkhc/Ukl4rROfVEuRzEI64k8olAEsBj9im6FjQx+Bm/NdzkI6e/ZIAmmBkfQNMqrz5U1b0z7+Y9sX/I4d13hoaeCM1AwyH7OV3EAmioW2gRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN0PR11MB6279.namprd11.prod.outlook.com (2603:10b6:208:3c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:06:10 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:06:10 +0000
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
Subject: [PATCH v5 15/28] drm/xe/pf: Switch VF migration GuC save/restore to
 struct migration data
Date: Tue, 11 Nov 2025 02:04:26 +0100
Message-ID: <20251111010439.347045-16-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0228.eurprd08.prod.outlook.com
 (2603:10a6:802:15::37) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MN0PR11MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: be49cbd2-2832-4651-0f05-08de20be8024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3JQc2V1aUMyUVhSMmVNVmE4STM0NzJGdTY3OThkWDBpTDdzOXZiaDcvb3V2?=
 =?utf-8?B?OEc3Y2hqOGhLREwvZ054L2hNdTdTdDdRcjg0emlLTHVMYS94Uk82R2EvUDR2?=
 =?utf-8?B?RS9tK1Mwb3JuVjBYVzg5MjZmRzdkMEtMT25RQURTbGdaNnYyN0ltbWJFRkVz?=
 =?utf-8?B?UmNYZENTRllHSEM5aWJTc2hJRWZNZDJFSlRVaXA3ek1UdlhLS1dFbkxvV2RZ?=
 =?utf-8?B?MWxmNSs5QW55Z1Z5NmZ6OE5VQ2NBWWpJYUhyWkVFZDhzVjRMN2Zna1ErOHBB?=
 =?utf-8?B?NHU4bnM0QitoVzk1alBxbTU3WEtmckZpMUphNElLZWVuaHU2c3ozUzlWbjNl?=
 =?utf-8?B?dkpoQWV2ZmU0SGJVbjFtR2tiZlFoWjFKK3VnMXloUUlVYk1xb25rUE9LN2p0?=
 =?utf-8?B?RVFyYUpBTWpOS2ZvdFluRk1PZm9DeGh0Q0NnQkNyS0FHWDdaUmJmZkJLc3I4?=
 =?utf-8?B?bXFhdDl4RkYyamlsaUV4UjRqKzEyZ2piT1R3cVhvWmMySkdOTVBFQk41ZlNS?=
 =?utf-8?B?N0YvT1BVRkxXSVJkZW9YQ3VRcUtNK1pyQWZ2blZkbDZlNS9ZRDRQS2lmVmky?=
 =?utf-8?B?QkhtKzlKRXJxL0E4WWZST2Exako2NXI2VkZuNFRnQThwbHYwcmdiUWxRMSta?=
 =?utf-8?B?SmV2VGZzU2MrZGV5aFp4ZjhPZkI0ajk0Um9mM21nczVCamlQRlZPZkRNWkpS?=
 =?utf-8?B?M1pJMjJFdk10cEZjL01NMWt5anNXSURHYnVMZGIyTjQ0ZWtEalFTV090OTJl?=
 =?utf-8?B?NWRTRjdOeUcvNXNtWmlscm0rYW90ZHZQdFkvVjJKTUxvN28wWXcraktGNllo?=
 =?utf-8?B?dEZ2TG0vRndsVi85cUM1Q0tCQkxOejNHRnhHUlNjOG5NM1plZGlkQmdUajY1?=
 =?utf-8?B?YXJTM1JBRkIzcnlpSkFvczZJU0k5R2xST1N6L0c0L3EybWU1RHFKNk5TTXNM?=
 =?utf-8?B?REttSmN0RDVSN0xQbUVpUDUxelY3aVdVdTVjelZMOVlVcm1KRWQ2Q0ZsVlBB?=
 =?utf-8?B?WXdBK0Y4Szh1Z1NpSUVkN1g2TWNmb0NLdklSZXQ5bS8zaVBaSFBXNXM3VXc0?=
 =?utf-8?B?czF4S3FuZ3dvZ3dDaWxlU2R3QkpLQUlZNmdzeXgyZUR3ODNOTDFUMllBb3Jx?=
 =?utf-8?B?bnc2SnNtVHBaV0M1V291RmZVZG9sSkVyVFpEZ2lVKzNyeU81U29LU2ZnazZB?=
 =?utf-8?B?aHI5S0NHcGtyUGdBMEVOdTFBajNhT0hJVVZOdFBFWXRnZmRjR1JXZlRsTHZw?=
 =?utf-8?B?Z2NPWmsrQmVxMEhTMWdMMnBUMk0zSmQ3b3Q3S1VQV3RCWmJOemxydU5oK0d0?=
 =?utf-8?B?VGlTdTVDTzBpZk1YNUVYNFEveTlBTmxIQzdhdlhOWHFNWXZ0ZklaQndvSDRI?=
 =?utf-8?B?dHRjeWhjVlZkK2puWkl1VW11OWRZMjRGd0lCdE5YY2hOMHlSRkc5NytPdGxI?=
 =?utf-8?B?RFlpQW9TR1JYSW9HMGNxeXU2NTB5Z1h2NVVod0RBZ1BacjJvYWtWWDlqR2pp?=
 =?utf-8?B?VGY2cEwxNWN5UGZWTHhrZDcrTE1VNXlSdkJ1R200N2tSUUpMNjlSKzg5cC85?=
 =?utf-8?B?Y1h1RGFubnRXS3p0ci9Sb2xEZ3lhaXBGMXZvZVRhMmhBTFJRUWlyaGpLak5F?=
 =?utf-8?B?VE43eVphK3kxUk1iY2lzUDFpQStqS3pnVW9xSER6cjBSdUhFbGc4MDFaQkRv?=
 =?utf-8?B?cnJaVC9WKzRHTGQ1K0hzN29hcVRGQjVDNVJkV014TWZjeHhRYVJQQ0VpWHp4?=
 =?utf-8?B?RmtkTFBINUJDNkIwbEFpb1lYYUxyZzM1MEYwVG5XblJnZHVGMkdlVjdsTmxs?=
 =?utf-8?B?cVRhSlhSOEpnZDcyN1JRWmswckticm9UcnZRZGNFL1JnbUlsQTgrcmpYZWV6?=
 =?utf-8?B?VUZLenhTMCtLK3drQkVOVFp1ZGpJZ2lHcVo5MUxkRDd3bUV6enZzT2ZQVlpR?=
 =?utf-8?B?b1EzRzlnU3RHOUpPUkhSKzUzMXVjaHJadmc5MTJ1TlJWb3p6RXRYUkFzMFZE?=
 =?utf-8?Q?bjJxiX9HMqroytv/4oNKzig9rrdFbc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REJwTHl4NG1kdXdFWHErbjI5WmRjOEtmZE14RUhDSnMydnFTQnkzMmF1V3N0?=
 =?utf-8?B?MklaTVBSOFlVYklPTGN4bzNFQUhkbXVMQ1QybFBXZ3NROWlrTjNhZVN5bVBT?=
 =?utf-8?B?ZkszUFBmSlpqanI3RlRwT2VGeVIxNnZOTndqV2dsTHZEVTk2REdJZUd2eFRn?=
 =?utf-8?B?eWxKdmFRbHlQQVpFM00xQTRQUlhneGhRdlUzV2J5VTFMVVF5cG9FMjNmSnFw?=
 =?utf-8?B?MEtIdzE2dC8xcHpHaE4yQ1pMM055TGxmeURuTjBZMm44SEhjQ3RYd0RZSHBI?=
 =?utf-8?B?OHdJcjdWYmhSb3B4TUdFMkVKU0xaWUNZNFMxemF3T2NtdXJMSzZsbWw1SHd5?=
 =?utf-8?B?MjkzYnNFN1M2SExyVjR5TUV6NG0zcUR0cGhGTVAwMlhhSzZIL01OcHYyQjFR?=
 =?utf-8?B?T25DMnhna2h4M2hpQktXejRJcVJaU3lreFZYWWI3U3lLUnNKSW56RTF5d3VD?=
 =?utf-8?B?WGlqai85SjRXd0VhZDZtQ2UwbHhUQWdZZWo5TnBuUTlrNUhQQm1tNVF1bVBN?=
 =?utf-8?B?TmpNSkdLR25PS3pNaFZXS3BkcTllaVlFRFlxM0c1VTNWaXBGMCtDTXptYjJX?=
 =?utf-8?B?M0xaN3NPSm5IMWxmd2ErOEZ5N0VCQXJmT2pmaG96UDRoOGgrUjd1ZG8xQjJ4?=
 =?utf-8?B?WUhwa05xMG5DeGpmdUxoamg0SW1ZbDVJNVB5K3lsK0FLOFVhV09kK0U4b01C?=
 =?utf-8?B?SkVmajZVL2VQMjVJQlNCTEFraDdPUUJQOHRIQU51dm9BazZPV3h6ai9pQ0NT?=
 =?utf-8?B?RVoxWFRxaW9lYjNpRFQxZzNuN3padzBzNzh1WDF3aGpML0x2VG11elZxcys2?=
 =?utf-8?B?dUVjTEwwSUtkbWNBZ3FORGtsUER3YkRlcm11cGRicm1IRUdkczRud2UrZEhh?=
 =?utf-8?B?T2MyOU4rc0E1cG1nS0w3cGhvVGJTVk0rMHBMZDc1SkE5M1dOYkt0VXhha3hR?=
 =?utf-8?B?QU1VUGU3NTdkM0xQUXc3dDhmZHp5RTVWbDhkVVNaOFQrM3d4WkQvWmw0TkVJ?=
 =?utf-8?B?Y3BCV3JpU1Fsa2RnWExRZzJ3QVFkZ3ZvdC9hL0FrQ1hjQnRLcFdoUkpCeWR2?=
 =?utf-8?B?OE9xcU5keDdHamN6eVp4emJKZWcxUFlCWWEzVmtQb2NsME5KT2ZOOTRDTFNW?=
 =?utf-8?B?MU1sb1Z2NENaUis3NWxxWXM4cW51YTRmeHhaT3lCb2R4NHREWHlvT2ZRSTAx?=
 =?utf-8?B?YTVqTTI3QTE4M0lmVVZZdWtJd2phNTFrcStyMWRVWlMrNlBOVVo2S29VRTM0?=
 =?utf-8?B?SVRtZzdxcHk4cStyVzdESm1QUVkxM1pNbjJQZjJUcmpDWTlsVHFQcTFNSVMx?=
 =?utf-8?B?TlFOMlF3QUs3aWRrTTZOdHdqRWJIWXFuQmVBTjQ3eXEyWW5tNkk2aytiNC9Q?=
 =?utf-8?B?aCtucGJ1VGpvcHN0SDlUR2syTm5EUGF1TUNnTHRnYVRSeGV6V3NVTmx0VUhw?=
 =?utf-8?B?dmNqdFY1aVhGN1BVSGRFd25UZS84dEJBS1llL1I2ODhPZHcvUmRzR0hNUzZk?=
 =?utf-8?B?RE9RUXlwVEMyMHYwWHpPTzJXNkNZeTl2UmxXNC9CZE0zbVlES2p2dEdWSU1z?=
 =?utf-8?B?TkwyMkdqL0dNUGw1cnZGUlRlWW5icVQ1M2RmMDVSYktNSUtPZ0lNbU5VRHFK?=
 =?utf-8?B?cjJXdzdTQktadGRFai9iQ0RmWmVROWh0MHlsdzd1cXpzT200bkxWTHQ0N2hD?=
 =?utf-8?B?L2Z1VEZzeisrOVNQc0FjOXNNcU1JNnRqalJSL0M0VFBPSTgwNFhRU2ZEUzVU?=
 =?utf-8?B?Z1BMcm5DVTEvMEdqc0NVdit2ZmlnUDNFTDRkNjd1dWZWaFRTWjl1aE56eHlj?=
 =?utf-8?B?YWpCM2twRStGeEpoMFZNbzRVL1E0emRWYldMOTArbGh2YmhJMWhjbFlVT0xy?=
 =?utf-8?B?SU1DQ2pkNXA5MVE1WjV3VXdXczd1NmF0akpjWVhHeEFGTlY0QURXZmN6a3Z4?=
 =?utf-8?B?WXhLWUNRYzZTKzVwcXhVRkhJS1lSd0ZPaGVMYUt2N2ZINVFqWElFM2FvNjR2?=
 =?utf-8?B?VkFtT0ZSK0NTMVJPRDhZTThQclRwU0ZOa1dGU1BQWit4cklGUzR6Y0dRV3B6?=
 =?utf-8?B?ckJOVlB2VHNaNGN0MG5zM01UZmZiK2J5UENvMFJFY2p2SkdQb3htUXJoa1Rl?=
 =?utf-8?B?WjBBamJrYUVsQWl5bllGb2l3VDRCR0V2U2RkeTg5YW42eTVoZmpReVBjc05E?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be49cbd2-2832-4651-0f05-08de20be8024
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:06:10.1361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aZsE42sODNRUq2Ja4cjwBDOD/FOU5N5281CE59aSXsFW4T26qDBDL7qDGwVjnFvnHAkCX8HwOnVRlGLFzRL5oWq8KCi1hnn3p67tAr4zlG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6279
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

In upcoming changes, the GuC VF migration data will be handled as part
of separate SAVE/RESTORE states in VF control state machine.
Now that the data is decoupled from both guc_state debugfs and PAUSE
state, we can safely remove the struct xe_gt_sriov_state_snapshot and
modify the GuC save/restore functions to operate on struct
xe_sriov_migration_data.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 265 +++++-------------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  13 +-
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  27 --
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   4 -
 4 files changed, 79 insertions(+), 230 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 7b5338be15065..5954c1a705f28 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -29,6 +29,19 @@ static struct xe_gt_sriov_migration_data *pf_pick_gt_migration(struct xe_gt *gt,
 	return &gt->sriov.pf.vfs[vfid].migration;
 }
 
+static void pf_dump_mig_data(struct xe_gt *gt, unsigned int vfid,
+			     struct xe_sriov_packet *data,
+			     const char *what)
+{
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
+		struct drm_printer p = xe_gt_dbg_printer(gt);
+
+		drm_printf(&p, "VF%u %s (%llu bytes)\n", vfid, what, data->hdr.size);
+		drm_print_hex_dump(&p, "mig_hdr:  ", (void *)&data->hdr, sizeof(data->hdr));
+		drm_print_hex_dump(&p, "mig_data: ", data->vaddr, min(SZ_64, data->hdr.size));
+	}
+}
+
 /* Return: number of dwords saved/restored/required or a negative error code on failure */
 static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
 				      u64 addr, u32 ndwords)
@@ -48,7 +61,7 @@ static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
 }
 
 /* Return: size of the state in dwords or a negative error code on failure */
-static int pf_send_guc_query_vf_state_size(struct xe_gt *gt, unsigned int vfid)
+static int pf_send_guc_query_vf_mig_data_size(struct xe_gt *gt, unsigned int vfid)
 {
 	int ret;
 
@@ -57,8 +70,8 @@ static int pf_send_guc_query_vf_state_size(struct xe_gt *gt, unsigned int vfid)
 }
 
 /* Return: number of state dwords saved or a negative error code on failure */
-static int pf_send_guc_save_vf_state(struct xe_gt *gt, unsigned int vfid,
-				     void *dst, size_t size)
+static int pf_send_guc_save_vf_mig_data(struct xe_gt *gt, unsigned int vfid,
+					void *dst, size_t size)
 {
 	const int ndwords = size / sizeof(u32);
 	struct xe_guc *guc = &gt->uc.guc;
@@ -87,8 +100,8 @@ static int pf_send_guc_save_vf_state(struct xe_gt *gt, unsigned int vfid,
 }
 
 /* Return: number of state dwords restored or a negative error code on failure */
-static int pf_send_guc_restore_vf_state(struct xe_gt *gt, unsigned int vfid,
-					const void *src, size_t size)
+static int pf_send_guc_restore_vf_mig_data(struct xe_gt *gt, unsigned int vfid,
+					   const void *src, size_t size)
 {
 	const int ndwords = size / sizeof(u32);
 	struct xe_guc *guc = &gt->uc.guc;
@@ -116,120 +129,66 @@ static bool pf_migration_supported(struct xe_gt *gt)
 	return xe_sriov_pf_migration_supported(gt_to_xe(gt));
 }
 
-static struct mutex *pf_migration_mutex(struct xe_gt *gt)
+static int pf_save_vf_guc_mig_data(struct xe_gt *gt, unsigned int vfid)
 {
-	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	return &gt->sriov.pf.migration.snapshot_lock;
-}
-
-static struct xe_gt_sriov_state_snapshot *pf_pick_vf_snapshot(struct xe_gt *gt,
-							      unsigned int vfid)
-{
-	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
-	lockdep_assert_held(pf_migration_mutex(gt));
-
-	return &gt->sriov.pf.vfs[vfid].snapshot;
-}
-
-static unsigned int pf_snapshot_index(struct xe_gt *gt, struct xe_gt_sriov_state_snapshot *snapshot)
-{
-	return container_of(snapshot, struct xe_gt_sriov_metadata, snapshot) - gt->sriov.pf.vfs;
-}
-
-static void pf_free_guc_state(struct xe_gt *gt, struct xe_gt_sriov_state_snapshot *snapshot)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-
-	drmm_kfree(&xe->drm, snapshot->guc.buff);
-	snapshot->guc.buff = NULL;
-	snapshot->guc.size = 0;
-}
-
-static int pf_alloc_guc_state(struct xe_gt *gt,
-			      struct xe_gt_sriov_state_snapshot *snapshot,
-			      size_t size)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-	void *p;
-
-	pf_free_guc_state(gt, snapshot);
-
-	if (!size)
-		return -ENODATA;
-
-	if (size % sizeof(u32))
-		return -EINVAL;
-
-	if (size > SZ_2M)
-		return -EFBIG;
-
-	p = drmm_kzalloc(&xe->drm, size, GFP_KERNEL);
-	if (!p)
-		return -ENOMEM;
-
-	snapshot->guc.buff = p;
-	snapshot->guc.size = size;
-	return 0;
-}
-
-static void pf_dump_guc_state(struct xe_gt *gt, struct xe_gt_sriov_state_snapshot *snapshot)
-{
-	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
-		unsigned int vfid __maybe_unused = pf_snapshot_index(gt, snapshot);
-
-		xe_gt_sriov_dbg_verbose(gt, "VF%u GuC state is %zu dwords:\n",
-					vfid, snapshot->guc.size / sizeof(u32));
-		print_hex_dump_bytes("state: ", DUMP_PREFIX_OFFSET,
-				     snapshot->guc.buff, min(SZ_64, snapshot->guc.size));
-	}
-}
-
-static int pf_save_vf_guc_state(struct xe_gt *gt, unsigned int vfid)
-{
-	struct xe_gt_sriov_state_snapshot *snapshot = pf_pick_vf_snapshot(gt, vfid);
+	struct xe_sriov_packet *data;
 	size_t size;
 	int ret;
 
-	ret = pf_send_guc_query_vf_state_size(gt, vfid);
+	ret = pf_send_guc_query_vf_mig_data_size(gt, vfid);
 	if (ret < 0)
 		goto fail;
+
 	size = ret * sizeof(u32);
-	xe_gt_sriov_dbg_verbose(gt, "VF%u state size is %d dwords (%zu bytes)\n", vfid, ret, size);
 
-	ret = pf_alloc_guc_state(gt, snapshot, size);
-	if (ret < 0)
+	data = xe_sriov_packet_alloc(gt_to_xe(gt));
+	if (!data) {
+		ret = -ENOMEM;
 		goto fail;
+	}
+
+	ret = xe_sriov_packet_init(data, gt->tile->id, gt->info.id,
+				   XE_SRIOV_PACKET_TYPE_GUC, 0, size);
+	if (ret)
+		goto fail_free;
 
-	ret = pf_send_guc_save_vf_state(gt, vfid, snapshot->guc.buff, size);
+	ret = pf_send_guc_save_vf_mig_data(gt, vfid, data->vaddr, size);
 	if (ret < 0)
-		goto fail;
+		goto fail_free;
 	size = ret * sizeof(u32);
 	xe_gt_assert(gt, size);
-	xe_gt_assert(gt, size <= snapshot->guc.size);
-	snapshot->guc.size = size;
+	xe_gt_assert(gt, size <= data->hdr.size);
+	data->hdr.size = size;
+	data->remaining = size;
+
+	pf_dump_mig_data(gt, vfid, data, "GuC data save");
+
+	ret = xe_gt_sriov_pf_migration_save_produce(gt, vfid, data);
+	if (ret)
+		goto fail_free;
 
-	pf_dump_guc_state(gt, snapshot);
 	return 0;
 
+fail_free:
+	xe_sriov_packet_free(data);
 fail:
-	xe_gt_sriov_dbg(gt, "Unable to save VF%u state (%pe)\n", vfid, ERR_PTR(ret));
-	pf_free_guc_state(gt, snapshot);
+	xe_gt_sriov_err(gt, "Failed to save VF%u GuC data (%pe)\n",
+			vfid, ERR_PTR(ret));
 	return ret;
 }
 
 /**
- * xe_gt_sriov_pf_migration_save_guc_state() - Take a GuC VF state snapshot.
+ * xe_gt_sriov_pf_migration_guc_size() - Get the size of VF GuC migration data.
  * @gt: the &xe_gt
  * @vfid: the VF identifier
  *
  * This function is for PF only.
  *
- * Return: 0 on success or a negative error code on failure.
+ * Return: size in bytes or a negative error code on failure.
  */
-int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid)
+ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid)
 {
-	int err;
+	ssize_t size;
 
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	xe_gt_assert(gt, vfid != PFID);
@@ -238,37 +197,15 @@ int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid)
 	if (!pf_migration_supported(gt))
 		return -ENOPKG;
 
-	mutex_lock(pf_migration_mutex(gt));
-	err = pf_save_vf_guc_state(gt, vfid);
-	mutex_unlock(pf_migration_mutex(gt));
+	size = pf_send_guc_query_vf_mig_data_size(gt, vfid);
+	if (size >= 0)
+		size *= sizeof(u32);
 
-	return err;
-}
-
-static int pf_restore_vf_guc_state(struct xe_gt *gt, unsigned int vfid)
-{
-	struct xe_gt_sriov_state_snapshot *snapshot = pf_pick_vf_snapshot(gt, vfid);
-	int ret;
-
-	if (!snapshot->guc.size)
-		return -ENODATA;
-
-	xe_gt_sriov_dbg_verbose(gt, "restoring %zu dwords of VF%u GuC state\n",
-				snapshot->guc.size / sizeof(u32), vfid);
-	ret = pf_send_guc_restore_vf_state(gt, vfid, snapshot->guc.buff, snapshot->guc.size);
-	if (ret < 0)
-		goto fail;
-
-	xe_gt_sriov_dbg_verbose(gt, "restored %d dwords of VF%u GuC state\n", ret, vfid);
-	return 0;
-
-fail:
-	xe_gt_sriov_dbg(gt, "Failed to restore VF%u GuC state (%pe)\n", vfid, ERR_PTR(ret));
-	return ret;
+	return size;
 }
 
 /**
- * xe_gt_sriov_pf_migration_restore_guc_state() - Restore a GuC VF state.
+ * xe_gt_sriov_pf_migration_guc_save() - Save VF GuC migration data.
  * @gt: the &xe_gt
  * @vfid: the VF identifier
  *
@@ -276,10 +213,8 @@ static int pf_restore_vf_guc_state(struct xe_gt *gt, unsigned int vfid)
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid)
+int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid)
 {
-	int ret;
-
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	xe_gt_assert(gt, vfid != PFID);
 	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
@@ -287,75 +222,42 @@ int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vf
 	if (!pf_migration_supported(gt))
 		return -ENOPKG;
 
-	mutex_lock(pf_migration_mutex(gt));
-	ret = pf_restore_vf_guc_state(gt, vfid);
-	mutex_unlock(pf_migration_mutex(gt));
-
-	return ret;
+	return pf_save_vf_guc_mig_data(gt, vfid);
 }
 
-#ifdef CONFIG_DEBUG_FS
-/**
- * xe_gt_sriov_pf_migration_read_guc_state() - Read a GuC VF state.
- * @gt: the &xe_gt
- * @vfid: the VF identifier
- * @buf: the user space buffer to read to
- * @count: the maximum number of bytes to read
- * @pos: the current position in the buffer
- *
- * This function is for PF only.
- *
- * This function reads up to @count bytes from the saved VF GuC state buffer
- * at offset @pos into the user space address starting at @buf.
- *
- * Return: the number of bytes read or a negative error code on failure.
- */
-ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
-						char __user *buf, size_t count, loff_t *pos)
+static int pf_restore_vf_guc_state(struct xe_gt *gt, unsigned int vfid,
+				   struct xe_sriov_packet *data)
 {
-	struct xe_gt_sriov_state_snapshot *snapshot;
-	ssize_t ret;
+	int ret;
 
-	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-	xe_gt_assert(gt, vfid != PFID);
-	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+	xe_gt_assert(gt, data->hdr.size);
 
-	if (!pf_migration_supported(gt))
-		return -ENOPKG;
+	pf_dump_mig_data(gt, vfid, data, "GuC data restore");
 
-	mutex_lock(pf_migration_mutex(gt));
-	snapshot = pf_pick_vf_snapshot(gt, vfid);
-	if (snapshot->guc.size)
-		ret = simple_read_from_buffer(buf, count, pos, snapshot->guc.buff,
-					      snapshot->guc.size);
-	else
-		ret = -ENODATA;
-	mutex_unlock(pf_migration_mutex(gt));
+	ret = pf_send_guc_restore_vf_mig_data(gt, vfid, data->vaddr, data->hdr.size);
+	if (ret < 0)
+		goto fail;
+
+	return 0;
 
+fail:
+	xe_gt_sriov_err(gt, "Failed to restore VF%u GuC data (%pe)\n",
+			vfid, ERR_PTR(ret));
 	return ret;
 }
 
 /**
- * xe_gt_sriov_pf_migration_write_guc_state() - Write a GuC VF state.
+ * xe_gt_sriov_pf_migration_guc_restore() - Restore VF GuC migration data.
  * @gt: the &xe_gt
  * @vfid: the VF identifier
- * @buf: the user space buffer with GuC VF state
- * @size: the size of GuC VF state (in bytes)
  *
  * This function is for PF only.
  *
- * This function reads @size bytes of the VF GuC state stored at user space
- * address @buf and writes it into a internal VF state buffer.
- *
- * Return: the number of bytes used or a negative error code on failure.
+ * Return: 0 on success or a negative error code on failure.
  */
-ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int vfid,
-						 const char __user *buf, size_t size)
+int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
+					 struct xe_sriov_packet *data)
 {
-	struct xe_gt_sriov_state_snapshot *snapshot;
-	loff_t pos = 0;
-	ssize_t ret;
-
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	xe_gt_assert(gt, vfid != PFID);
 	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
@@ -363,21 +265,8 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 	if (!pf_migration_supported(gt))
 		return -ENOPKG;
 
-	mutex_lock(pf_migration_mutex(gt));
-	snapshot = pf_pick_vf_snapshot(gt, vfid);
-	ret = pf_alloc_guc_state(gt, snapshot, size);
-	if (!ret) {
-		ret = simple_write_to_buffer(snapshot->guc.buff, size, &pos, buf, size);
-		if (ret < 0)
-			pf_free_guc_state(gt, snapshot);
-		else
-			pf_dump_guc_state(gt, snapshot);
-	}
-	mutex_unlock(pf_migration_mutex(gt));
-
-	return ret;
+	return pf_restore_vf_guc_state(gt, vfid, data);
 }
-#endif /* CONFIG_DEBUG_FS */
 
 /**
  * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT.
@@ -619,10 +508,6 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
 	if (!pf_migration_supported(gt))
 		return 0;
 
-	err = drmm_mutex_init(&xe->drm, &gt->sriov.pf.migration.snapshot_lock);
-	if (err)
-		return err;
-
 	totalvfs = xe_sriov_pf_get_totalvfs(xe);
 	for (n = 1; n <= totalvfs; n++) {
 		struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, n);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 148ee07dd23a9..fd81942bfd7a2 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -15,8 +15,10 @@ struct xe_sriov_packet;
 #define XE_GT_SRIOV_PF_MIGRATION_GUC_DATA_MAX_SIZE SZ_8M
 
 int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
-int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
-int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
+ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
+					 struct xe_sriov_packet *data);
 
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
 
@@ -34,11 +36,4 @@ int xe_gt_sriov_pf_migration_restore_produce(struct xe_gt *gt, unsigned int vfid
 struct xe_sriov_packet *
 xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid);
 
-#ifdef CONFIG_DEBUG_FS
-ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
-						char __user *buf, size_t count, loff_t *pos);
-ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int vfid,
-						 const char __user *buf, size_t count);
-#endif
-
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
index 84be6fac16c8b..75d8b94cbbefb 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
@@ -6,24 +6,7 @@
 #ifndef _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
 #define _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
 
-#include <linux/mutex.h>
 #include <linux/ptr_ring.h>
-#include <linux/types.h>
-
-/**
- * struct xe_gt_sriov_state_snapshot - GT-level per-VF state snapshot data.
- *
- * Used by the PF driver to maintain per-VF migration data.
- */
-struct xe_gt_sriov_state_snapshot {
-	/** @guc: GuC VF state snapshot */
-	struct {
-		/** @guc.buff: buffer with the VF state */
-		u32 *buff;
-		/** @guc.size: size of the buffer (must be dwords aligned) */
-		u32 size;
-	} guc;
-};
 
 /**
  * struct xe_gt_sriov_migration_data - GT-level per-VF migration data.
@@ -35,14 +18,4 @@ struct xe_gt_sriov_migration_data {
 	struct ptr_ring ring;
 };
 
-/**
- * struct xe_gt_sriov_pf_migration - GT-level data.
- *
- * Used by the PF driver to maintain non-VF specific per-GT data.
- */
-struct xe_gt_sriov_pf_migration {
-	/** @snapshot_lock: protects all VFs snapshots */
-	struct mutex snapshot_lock;
-};
-
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
index 812e74d3f8f80..667b8310478d4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
@@ -31,9 +31,6 @@ struct xe_gt_sriov_metadata {
 	/** @version: negotiated VF/PF ABI version */
 	struct xe_gt_sriov_pf_service_version version;
 
-	/** @snapshot: snapshot of the VF state data */
-	struct xe_gt_sriov_state_snapshot snapshot;
-
 	/** @migration: per-VF migration data. */
 	struct xe_gt_sriov_migration_data migration;
 };
@@ -61,7 +58,6 @@ struct xe_gt_sriov_pf {
 	struct xe_gt_sriov_pf_service service;
 	struct xe_gt_sriov_pf_control control;
 	struct xe_gt_sriov_pf_policy policy;
-	struct xe_gt_sriov_pf_migration migration;
 	struct xe_gt_sriov_spare_config spare;
 	struct xe_gt_sriov_metadata *vfs;
 };
-- 
2.51.2

