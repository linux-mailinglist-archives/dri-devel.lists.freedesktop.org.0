Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AA5C4A37C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:07:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B2D10E4E0;
	Tue, 11 Nov 2025 01:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d2KaHXUS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1989710E4DA;
 Tue, 11 Nov 2025 01:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762823226; x=1794359226;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+1Iz2wxyHqplPx0rmuaN2mp1NjORyK54lCFj6hS7hTw=;
 b=d2KaHXUSCBYSmh7Anf/8gYkwLDEq1MOcGX18I2J0C0bKaPWN2SV3Bj1e
 +tkkFoZfJPaSD8MBKEVnstHgVbXgHyDIjNZL8mvFMMWtpR/Jm6mwHJpMZ
 iWXJ8M7ORrJqfhblugooo5rpgNZ3ZF/TlUyBxTbxSIYm8DtbcWFHz36HO
 +e6ddq+vdqRvB1iU0zqQVVUc0Ufbcf3OMxC1Dw6+P8ascOHallBMN0YfA
 IMi3vA3h3c0fZ3CCHX+L6+Yup7FvMwfLoDTr2J6O6TSfK+CO7z+aUlQYI
 nTsSwHUK1J8XHMF43j5KEVfXSWbvsmamnPZlw/V0L4A/gwkGm6Pc1ctlh g==;
X-CSE-ConnectionGUID: w8u1OkHTSqap8DA/eU1fKA==
X-CSE-MsgGUID: kA6Pi+NyRdmpZpSystvw5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="68739893"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="68739893"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:07:05 -0800
X-CSE-ConnectionGUID: nxoayOUoSKW9YBdlKumxuw==
X-CSE-MsgGUID: TzA5OBT8RpK2M7/Ji2a7rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188657383"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 17:07:05 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:07:05 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 17:07:05 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 17:07:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=II6alGX+B8FvHqy3l7bW43T4hjL/edQU/Z7nEKmErBgrHugUDK87Hwy8Ok6qllYHp4loBuHTmcS+XA/2i7GGHwtzWLMvrHroqScdRTFXy9J8zlAtl/+tUna9xDuKtuc/Yymcewh5qf6tyk4gI1e0F7L9FCCU2z9ifNiJa9B9+koI10O8QqndpTZk+hhD/JAxLkxC1RbB06fsfM2av6fucQ6Hjq5s8WDcjFRpzMCNzeOGeC3rFLQe4c/2FsGcBkT6gkaybCS6LFwUUrSFgIyrlX6mhgao9Z7DFv6CN5VlbUZbMgR76dd02CUSAPeT25JGnRO1UM4oqtptmsUQSEAGzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jd+Q6VSqNlSvS0oiE6yEjwASjNyVu9ADK9LKMNZDDug=;
 b=YwiMgDNWNmJxswqxUTYGEaQT4zTWkTbMdAfnue7t5IdiuMrlOLdeNO7i75zK5XzIBape2PQA/gGFB+meVCdHsa45i+MrdlECNcfv4HGaoEqgDBog+/P/qVbpz8Cu5IvOuFjKwIGbPD9twj95r0qboX8G7cWjIR4BO7L5YMzIUOnpXdwDd0F6XDcuaMaf7pUGpxO3L3kiX1Q4MTtGx1OGK5M5LphhYopCbYdN+rXP+lbYV7LPpNVRgoRW8DHArfWQ4Izke7QIoDwNY4grV6fIYoFreTgdTCZvQoLxpahgbAdBwN5ygMYB65kB6EPtcmasFq7Y9at1EQXXRHGbYQ0vAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CO1PR11MB4931.namprd11.prod.outlook.com (2603:10b6:303:9d::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Tue, 11 Nov 2025 01:07:03 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:07:03 +0000
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
Subject: [PATCH v5 28/28] vfio/xe: Add device specific vfio_pci driver variant
 for Intel graphics
Date: Tue, 11 Nov 2025 02:04:39 +0100
Message-ID: <20251111010439.347045-29-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111010439.347045-1-michal.winiarski@intel.com>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0047.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::16) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CO1PR11MB4931:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b01d81d-760a-49e1-9295-08de20be9fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFQ1d0NObzlLaDFoQmc3OU8wVVlyaXNjR3ZqYmVvM2w2MmI2UVhtbko0eXZm?=
 =?utf-8?B?MUlIbVd0cVByaGZKelFyODMvU1ZHUHRKeUkyZldrZGpQU09VeFpES0EzQjNO?=
 =?utf-8?B?aHVSU0JTQTR5cUFndU5vVGlSSzhuZ2szV2ppSVk4c3p6WmwvTjJxcml1LzRk?=
 =?utf-8?B?NzRRVTVMTkZyM2hCVkJQeWZ0dFJDY2Y1RVRHWTIra2hSUExOaWF0SDlXenpj?=
 =?utf-8?B?RWFhZERvcTZPUGVPTHd2c2p0QndHRzY1c29CZDRQNU5NaWt4SCtJcmJSZ0xa?=
 =?utf-8?B?c3EvcWNFM0ZETG9kayt1MTJ3VjZqalovckNNeUtRT0trQnlTVHlRQmlNSWVH?=
 =?utf-8?B?RXVUeUFrWkxaWkJMNFRSV2FKSytPS3hwUlphc21xK3Yvcm42OFQvdWJkdHBz?=
 =?utf-8?B?YnFkNUZHL3FsUmFKNEdNMVNYNDNUaVpneVBGU3k2Sm5jRzhURG1aWXpWdUky?=
 =?utf-8?B?U0JrS0ZSeFdobEJDS2lMdlNUR3FNckVYcDJyUTU2SisrT3d3MERpZ1NRbDJF?=
 =?utf-8?B?MXJJK0tmdTlidmE0SnB5YS9RS0ZPR2lHcWZpUVd0emQyR3hJbnBsSDY4TFJC?=
 =?utf-8?B?UVJ5L0RBNXFXTmU4Qm5IYTdsUEtLNnJjdEdpNlNqYVZrZkVMdlU4TWk3bEUw?=
 =?utf-8?B?MHF6UENCbk1ad21zQ1ZVcE84djEwMkxZRzl3bXVBcmlSM2FCaTNYcjJkd25s?=
 =?utf-8?B?ZTF5SVArUVVxTm8vV1VTdU9JRUIzOUYxSDRhbElCdVZ4aDl6ZHEwR2tkUTVF?=
 =?utf-8?B?d0tBMDVlbTdIVzhIR1JsbE9URFNDOFo3STZRdi95Y2twbnQ2ZWdvR1BYREMx?=
 =?utf-8?B?UTkySWVETFNmamFNNzZMU0pzcXRkalE1VzlpQ2tJaERLcytSbzJ4R2phOFpO?=
 =?utf-8?B?RFZDTFZMWU91SGd6YzhNbnl1aGhRZ1F3MU1ORDM2ZW03NlNtT1VDSkRuVy9r?=
 =?utf-8?B?RXY1bS9Tb09rK0ovU0xyY3REQ1dQVnczbFlJajZLeGhHNUl5eDNvM1ZNSkpT?=
 =?utf-8?B?NkpKQkpXWTFpVVNqOUlsL1hGdysraktLRWdpUkwxTVlDR3B5VXIrR2VrR3cv?=
 =?utf-8?B?Ulc0YVdLQ3NvSzVnNFdObFd6K0tMWk12YW9VME9pR1hUZHlMZHh0bHI4WE5I?=
 =?utf-8?B?aCs0V1JOUTVFRWlkWWRYOCsxdm5VR3c0TlZGYjZhVGtLR0Exekpwd3BhOFJ4?=
 =?utf-8?B?L0srRks5VFpOd1h3dzFyU2ZuejAzbVpUbU5KOVNCVGFwSyt2aVFjMnNrNFJC?=
 =?utf-8?B?NE04b2JKOVNLU1FYa2xsMWs4MjBlcklUMUN6ZlZTemFNRGdKdVk0ampTdG5W?=
 =?utf-8?B?N2xyOTdKa2gzaXFZM0RCOWJtTEFPOEtqdThpWEJOWW9aUnNYYTZ6TjEwZllC?=
 =?utf-8?B?ak1neXhZZTk4dEdSOFNzdTBOS1ZCRVVPbkpZQnZMMEljTWpjejdzaURKL2kz?=
 =?utf-8?B?a1g0aHdCbDI1R1NOS3diYldKd2dqNjZrV21yWVR2QjVYUVJPVGFJT3V6OHRw?=
 =?utf-8?B?bEFzUjlHZkQ0T1lVa3A4TUp5a3lNYkpyNnUxSit4M1VlL2RuNllQc2hZRlBp?=
 =?utf-8?B?aktFWEhidFBhbFE4YXMyNFUza3Frc040aUVwQlhuS3YrL2t6VHJ3ZnRqM3pT?=
 =?utf-8?B?aHZmdTN2c1ljb29kdjJQU0dhMENlMTg2b1VFbHFoMUo4anZuZjEwL0p2WU52?=
 =?utf-8?B?SVF2VnRKaDl0RjY0SDhVZ0dCTXAwcndOdFN3SDVuYXpiZG82MkptZmNuRzA4?=
 =?utf-8?B?VTVBNkN6VVZuckxCVWJlblIwb1h0dXRQWjJsdEV5SXMveVA5QzZ4bFUvWVhB?=
 =?utf-8?B?TXpXbWZPQmcweFY1VHZOTU0rRTEvMmhOT0xLbGwvSU9IRnV2dmlzd2NTdnNo?=
 =?utf-8?B?Q2wzV0ZrbGkveTdEZ0JEZDdWc2ErRmNXZW5tMkJMZTltVVZPSW5Fa0cvcXNv?=
 =?utf-8?B?TWRIZ3VKTVpWaE02cE0xZll1eVdEdmFwVTNrQXN0T0pYZW9vb09HNkttQmJ4?=
 =?utf-8?Q?hJ53KRZqcdki9OgF3gTXXihIGTYv+o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTE4UHhVQzBvR1p4YjBRenlhRjdtSCtyUU5ETEw0ZWQwbWNYd28yVUhZblJp?=
 =?utf-8?B?a1FOR3N0T1E5NEtGUHpvM04zWE8vdG53cU5lNXpLMllJaGtSa2tBL2RNZmdX?=
 =?utf-8?B?UnlsNXEvblJGRzlrRm9RRmFrdWxPZ0FHYkc0QzZudUNzZnBzQVpJNXYwNzRP?=
 =?utf-8?B?SHBsb3ZkcW5WOFd0dEk3anhQNEtmaFducDN1UTFLZUt1ZmgwUTd0SXVGU09a?=
 =?utf-8?B?WDhJOFo5Y0tJbXFCMTA0SlJCOUdmdHhSckl5d2tNVnQ3NDU1MnBZTFZvWStW?=
 =?utf-8?B?NFFvbTFZUG5ZTThTbzdOL1B1czdLVk5LZWVRZDk4TVFkbkxMNDRaSW5QUGpZ?=
 =?utf-8?B?ZGZCcFQrVnVXVFFPTk8rcnE3ckFqNmpXTzVYTGU3UWxreUtsV21nbjVvYU0x?=
 =?utf-8?B?RHFmelNvNGdXdFYyNWI0bDVEcXA4cUNLRUkzSjhYYVhBZFBOeTVxN3ExVVh5?=
 =?utf-8?B?WnNlZ09NVnhqYnpRd3hRTkZ6OG9sT252cjY3aGdWbElEdC9iaDFDM1QxSmU5?=
 =?utf-8?B?bzVJZXFIOTkyYnlmcXZlNXdzWUphUlBIU2lFWTRwWjVHMnVHbFZraVA5aTds?=
 =?utf-8?B?YmhWQ2h6TWtEbFBGbmlOS1o1N0dJbTMyVW1mNFpVaEtuOEVqd0E0UzBmdWVR?=
 =?utf-8?B?Q1NSMkx0SmJWVGgxWVVrMStlZWZnNHFlSlN1SnNkM1VIOWE5R0JWVC9td0Mz?=
 =?utf-8?B?YlcweHJmRlNlY25EVnlLdVo0RGh4SkxnbUJJRzU4azhqOFpxLzhzbGNNVDVG?=
 =?utf-8?B?ZkE3YXdEU2djamE2UG9PdEpVN0pqRmtsVjJ4Q2tNb0hDTVp6QnJmZndHVUpQ?=
 =?utf-8?B?dHVzdjNuR0NZdHUzdzBWREdEampFMTJoRkd3Mkc5dzVWVzJtWU5HY0JubUJv?=
 =?utf-8?B?T3hvRTA1NCtuZEFXNkZaaUZMeWs2Wi9ZclVReDJCckZkS0dNS05TY0tZQ1Bs?=
 =?utf-8?B?M2puNXhEK2xxczEyVmI3VjNsRXhHKy9IRUQzaTlNRTA3NFJHbjVyOUlmQU9a?=
 =?utf-8?B?VHM5K1N4SHllUW1VbVdUNThOcDE1RUZQLzdYYlU0U2hDY04rRjB0WDAxREsz?=
 =?utf-8?B?eE5nT0dJNFpQcGZhVGZoSm5yV2YxLzF4RGFJTk1ZeWw4QTVPbUlkd0RKclYx?=
 =?utf-8?B?bGN3WUpERnFMc1FIcTVGT0dIM1JWNjRHRHNrMTRBUXkyNW5wZ1c4TndFd2Q5?=
 =?utf-8?B?UWRoNFRJYTljVjR1QUs5eThHMkdWR1VUVDFFT2hyN0JPWm9HUUxHZ0p3TVFL?=
 =?utf-8?B?cFFkczdtRXZpcGJSZHREL2JWeXRQQXdhV2h1VW9xaHg4anlpbVJHTGdNMjlP?=
 =?utf-8?B?SjMwekdWVUVZelBBM2M4QlpTMkNiQnQyM0FtMHhqS3BHSWEyOElVejN5ajYx?=
 =?utf-8?B?bnh5cWpqa3FWYnBFUm56Z0NQWGxzQlJDT1NGQ1lYNm1Md3NZT1A2RjdrZmda?=
 =?utf-8?B?L3lsbEthT1RiVVAxZTg1dDhxSDE2c21jV2dzekhCZUtCNU51UVdUY2loeEhQ?=
 =?utf-8?B?NFkxdUxBRTExNkhnUDhJb1d0cUhoQlByd01PVmp1Qm9FaWR3TmZWcXNYaE1Y?=
 =?utf-8?B?aDRwUER3OUc3K3lQOWgyb0ZETlFPNnd1K3dqSGpXblJBOExja0wrU0lxTWdo?=
 =?utf-8?B?Wi95VjlpZHg1VGhMQm9zTFU3TGczSlA4K0RWczF1NHRNdlgvN3JZTzh0OG05?=
 =?utf-8?B?Y3U2eEt5dTBEVXRsNUw2K0lLZ3VucS9DZHI5emdjSGF1RU8vS1BIR3E1Sm50?=
 =?utf-8?B?M2V5Q1JXVUplWndOa2Z4RlJpYjlYamJibS9KM0NFQVY3RWpYbFBWOXNuUzZS?=
 =?utf-8?B?d1ZuUHp2WnMzOVM3cHV4U1V2L0N6QkhFVTFzRjhFVEhOUUsxdVZxc0RGaVZO?=
 =?utf-8?B?TXhjWWNHaXErTFpzZnBhR2VkbnVXMWlxRjFBRTVhOFR5cGxlRjd5clI5UU9i?=
 =?utf-8?B?U0tqYWxzY2VvakxKUmlXeFAxY2pHbm1TdjloY2xJbEtNRVpmOWdLYTEyTkNU?=
 =?utf-8?B?N0ZGbFJCZitEQWhMNGlpR0c2bnpyb25FeEhWcS8vWkhLRWlJRkZ6Y21hQ0Jt?=
 =?utf-8?B?OHk1ekNLWVAwRHdlYWFVenZiS283am85NXFOalpHTHo3WnprZ2wwSExpanVp?=
 =?utf-8?B?aXNZYmV6am8xZUFHNUpKZXQ3YjVqbXpvRjZybURzK3Y4SldUelpOWXM0bWtJ?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b01d81d-760a-49e1-9295-08de20be9fc2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:07:03.1957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k5LmZKBzV8VgEjzTxvMeUhvP135MFLY/Sd1rSgKpLt6R9fLHlRSvh795GUa3P4kN1078YthlTsPcw+OU9oG0XHgQKFR5g/WhHko4dqrpVQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4931
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

In addition to generic VFIO PCI functionality, the driver implements
VFIO migration uAPI, allowing userspace to enable migration for Intel
Graphics SR-IOV Virtual Functions.
The driver binds to VF device and uses API exposed by Xe driver to
transfer the VF migration data under the control of PF device.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 MAINTAINERS                  |   7 +
 drivers/vfio/pci/Kconfig     |   2 +
 drivers/vfio/pci/Makefile    |   2 +
 drivers/vfio/pci/xe/Kconfig  |  12 +
 drivers/vfio/pci/xe/Makefile |   3 +
 drivers/vfio/pci/xe/main.c   | 568 +++++++++++++++++++++++++++++++++++
 6 files changed, 594 insertions(+)
 create mode 100644 drivers/vfio/pci/xe/Kconfig
 create mode 100644 drivers/vfio/pci/xe/Makefile
 create mode 100644 drivers/vfio/pci/xe/main.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3e3373fb59100..72486df08b9f7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27012,6 +27012,13 @@ L:	virtualization@lists.linux.dev
 S:	Maintained
 F:	drivers/vfio/pci/virtio
 
+VFIO XE PCI DRIVER
+M:	Michał Winiarski <michal.winiarski@intel.com>
+L:	kvm@vger.kernel.org
+L:	intel-xe@lists.freedesktop.org
+S:	Supported
+F:	drivers/vfio/pci/xe
+
 VGA_SWITCHEROO
 R:	Lukas Wunner <lukas@wunner.de>
 S:	Maintained
diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
index 2b0172f546652..c100f0ab87f2d 100644
--- a/drivers/vfio/pci/Kconfig
+++ b/drivers/vfio/pci/Kconfig
@@ -67,4 +67,6 @@ source "drivers/vfio/pci/nvgrace-gpu/Kconfig"
 
 source "drivers/vfio/pci/qat/Kconfig"
 
+source "drivers/vfio/pci/xe/Kconfig"
+
 endmenu
diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
index cf00c0a7e55c8..f5d46aa9347b9 100644
--- a/drivers/vfio/pci/Makefile
+++ b/drivers/vfio/pci/Makefile
@@ -19,3 +19,5 @@ obj-$(CONFIG_VIRTIO_VFIO_PCI) += virtio/
 obj-$(CONFIG_NVGRACE_GPU_VFIO_PCI) += nvgrace-gpu/
 
 obj-$(CONFIG_QAT_VFIO_PCI) += qat/
+
+obj-$(CONFIG_XE_VFIO_PCI) += xe/
diff --git a/drivers/vfio/pci/xe/Kconfig b/drivers/vfio/pci/xe/Kconfig
new file mode 100644
index 0000000000000..4253f2a86ca1f
--- /dev/null
+++ b/drivers/vfio/pci/xe/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config XE_VFIO_PCI
+	tristate "VFIO support for Intel Graphics"
+	depends on DRM_XE
+	select VFIO_PCI_CORE
+	help
+	  This option enables device specific VFIO driver variant for Intel Graphics.
+	  In addition to generic VFIO PCI functionality, it implements VFIO
+	  migration uAPI allowing userspace to enable migration for
+	  Intel Graphics SR-IOV Virtual Functions supported by the Xe driver.
+
+	  If you don't know what to do here, say N.
diff --git a/drivers/vfio/pci/xe/Makefile b/drivers/vfio/pci/xe/Makefile
new file mode 100644
index 0000000000000..13aa0fd192cd4
--- /dev/null
+++ b/drivers/vfio/pci/xe/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_XE_VFIO_PCI) += xe-vfio-pci.o
+xe-vfio-pci-y := main.o
diff --git a/drivers/vfio/pci/xe/main.c b/drivers/vfio/pci/xe/main.c
new file mode 100644
index 0000000000000..ce0ed82ee4d31
--- /dev/null
+++ b/drivers/vfio/pci/xe/main.c
@@ -0,0 +1,568 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/anon_inodes.h>
+#include <linux/delay.h>
+#include <linux/file.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/sizes.h>
+#include <linux/types.h>
+#include <linux/vfio.h>
+#include <linux/vfio_pci_core.h>
+
+#include <drm/intel/xe_sriov_vfio.h>
+#include <drm/intel/pciids.h>
+
+struct xe_vfio_pci_migration_file {
+	struct file *filp;
+	/* serializes accesses to migration data */
+	struct mutex lock;
+	bool disabled;
+	struct xe_vfio_pci_core_device *xe_vdev;
+};
+
+struct xe_vfio_pci_core_device {
+	struct vfio_pci_core_device core_device;
+	struct xe_device *xe;
+	/* PF internal control uses vfid index starting from 1 */
+	unsigned int vfid;
+	u8 migrate_cap:1;
+	u8 deferred_reset:1;
+	/* protects migration state */
+	struct mutex state_mutex;
+	enum vfio_device_mig_state mig_state;
+	/* protects the reset_done flow */
+	spinlock_t reset_lock;
+	struct xe_vfio_pci_migration_file *migf;
+};
+
+#define xe_vdev_to_dev(xe_vdev) (&(xe_vdev)->core_device.pdev->dev)
+
+static void xe_vfio_pci_disable_file(struct xe_vfio_pci_migration_file *migf)
+{
+	mutex_lock(&migf->lock);
+	migf->disabled = true;
+	mutex_unlock(&migf->lock);
+}
+
+static void xe_vfio_pci_put_file(struct xe_vfio_pci_core_device *xe_vdev)
+{
+	xe_vfio_pci_disable_file(xe_vdev->migf);
+	fput(xe_vdev->migf->filp);
+	xe_vdev->migf = NULL;
+}
+
+static void xe_vfio_pci_reset(struct xe_vfio_pci_core_device *xe_vdev)
+{
+	if (xe_vdev->migf)
+		xe_vfio_pci_put_file(xe_vdev);
+
+	xe_vdev->mig_state = VFIO_DEVICE_STATE_RUNNING;
+}
+
+static void xe_vfio_pci_state_mutex_lock(struct xe_vfio_pci_core_device *xe_vdev)
+{
+	mutex_lock(&xe_vdev->state_mutex);
+}
+
+/*
+ * This function is called in all state_mutex unlock cases to
+ * handle a 'deferred_reset' if exists.
+ */
+static void xe_vfio_pci_state_mutex_unlock(struct xe_vfio_pci_core_device *xe_vdev)
+{
+again:
+	spin_lock(&xe_vdev->reset_lock);
+	if (xe_vdev->deferred_reset) {
+		xe_vdev->deferred_reset = false;
+		spin_unlock(&xe_vdev->reset_lock);
+		xe_vfio_pci_reset(xe_vdev);
+		goto again;
+	}
+	mutex_unlock(&xe_vdev->state_mutex);
+	spin_unlock(&xe_vdev->reset_lock);
+}
+
+static void xe_vfio_pci_reset_done(struct pci_dev *pdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev = pci_get_drvdata(pdev);
+	int ret;
+
+	if (!xe_vdev->vfid)
+		return;
+
+	/*
+	 * VF FLR requires additional processing done by PF driver.
+	 * The processing is done after FLR is already finished from PCIe
+	 * perspective.
+	 * In order to avoid a scenario where VF is used while PF processing
+	 * is still in progress, additional synchronization point is needed.
+	 */
+	ret = xe_sriov_vfio_wait_flr_done(xe_vdev->xe, xe_vdev->vfid);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to wait for FLR: %d\n", ret);
+
+	if (!xe_vdev->migrate_cap)
+		return;
+
+	/*
+	 * As the higher VFIO layers are holding locks across reset and using
+	 * those same locks with the mm_lock we need to prevent ABBA deadlock
+	 * with the state_mutex and mm_lock.
+	 * In case the state_mutex was taken already we defer the cleanup work
+	 * to the unlock flow of the other running context.
+	 */
+	spin_lock(&xe_vdev->reset_lock);
+	xe_vdev->deferred_reset = true;
+	if (!mutex_trylock(&xe_vdev->state_mutex)) {
+		spin_unlock(&xe_vdev->reset_lock);
+		return;
+	}
+	spin_unlock(&xe_vdev->reset_lock);
+	xe_vfio_pci_state_mutex_unlock(xe_vdev);
+
+	xe_vfio_pci_reset(xe_vdev);
+}
+
+static const struct pci_error_handlers xe_vfio_pci_err_handlers = {
+	.reset_done = xe_vfio_pci_reset_done,
+	.error_detected = vfio_pci_core_aer_err_detected,
+};
+
+static int xe_vfio_pci_open_device(struct vfio_device *core_vdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+	struct vfio_pci_core_device *vdev = &xe_vdev->core_device;
+	int ret;
+
+	ret = vfio_pci_core_enable(vdev);
+	if (ret)
+		return ret;
+
+	vfio_pci_core_finish_enable(vdev);
+
+	return 0;
+}
+
+static int xe_vfio_pci_release_file(struct inode *inode, struct file *filp)
+{
+	struct xe_vfio_pci_migration_file *migf = filp->private_data;
+
+	xe_vfio_pci_disable_file(migf);
+	mutex_destroy(&migf->lock);
+	kfree(migf);
+
+	return 0;
+}
+
+static ssize_t xe_vfio_pci_save_read(struct file *filp, char __user *buf, size_t len, loff_t *pos)
+{
+	struct xe_vfio_pci_migration_file *migf = filp->private_data;
+	ssize_t ret;
+
+	if (pos)
+		return -ESPIPE;
+
+	mutex_lock(&migf->lock);
+	if (migf->disabled) {
+		mutex_unlock(&migf->lock);
+		return -ENODEV;
+	}
+
+	ret = xe_sriov_vfio_data_read(migf->xe_vdev->xe, migf->xe_vdev->vfid, buf, len);
+	mutex_unlock(&migf->lock);
+
+	return ret;
+}
+
+static const struct file_operations xe_vfio_pci_save_fops = {
+	.owner = THIS_MODULE,
+	.read = xe_vfio_pci_save_read,
+	.release = xe_vfio_pci_release_file,
+	.llseek = noop_llseek,
+};
+
+static ssize_t xe_vfio_pci_resume_write(struct file *filp, const char __user *buf,
+					size_t len, loff_t *pos)
+{
+	struct xe_vfio_pci_migration_file *migf = filp->private_data;
+	ssize_t ret;
+
+	if (pos)
+		return -ESPIPE;
+
+	mutex_lock(&migf->lock);
+	if (migf->disabled) {
+		mutex_unlock(&migf->lock);
+		return -ENODEV;
+	}
+
+	ret = xe_sriov_vfio_data_write(migf->xe_vdev->xe, migf->xe_vdev->vfid, buf, len);
+	mutex_unlock(&migf->lock);
+
+	return ret;
+}
+
+static const struct file_operations xe_vfio_pci_resume_fops = {
+	.owner = THIS_MODULE,
+	.write = xe_vfio_pci_resume_write,
+	.release = xe_vfio_pci_release_file,
+	.llseek = noop_llseek,
+};
+
+static const char *vfio_dev_state_str(u32 state)
+{
+	switch (state) {
+	case VFIO_DEVICE_STATE_RUNNING: return "running";
+	case VFIO_DEVICE_STATE_RUNNING_P2P: return "running_p2p";
+	case VFIO_DEVICE_STATE_STOP_COPY: return "stopcopy";
+	case VFIO_DEVICE_STATE_STOP: return "stop";
+	case VFIO_DEVICE_STATE_RESUMING: return "resuming";
+	case VFIO_DEVICE_STATE_ERROR: return "error";
+	default: return "";
+	}
+}
+
+enum xe_vfio_pci_file_type {
+	XE_VFIO_FILE_SAVE = 0,
+	XE_VFIO_FILE_RESUME,
+};
+
+static struct xe_vfio_pci_migration_file *
+xe_vfio_pci_alloc_file(struct xe_vfio_pci_core_device *xe_vdev,
+		       enum xe_vfio_pci_file_type type)
+{
+	struct xe_vfio_pci_migration_file *migf;
+	const struct file_operations *fops;
+	int flags;
+
+	migf = kzalloc(sizeof(*migf), GFP_KERNEL);
+	if (!migf)
+		return ERR_PTR(-ENOMEM);
+
+	fops = type == XE_VFIO_FILE_SAVE ? &xe_vfio_pci_save_fops : &xe_vfio_pci_resume_fops;
+	flags = type == XE_VFIO_FILE_SAVE ? O_RDONLY : O_WRONLY;
+	migf->filp = anon_inode_getfile("xe_vfio_mig", fops, migf, flags);
+	if (IS_ERR(migf->filp)) {
+		kfree(migf);
+		return ERR_CAST(migf->filp);
+	}
+
+	mutex_init(&migf->lock);
+	migf->xe_vdev = xe_vdev;
+	xe_vdev->migf = migf;
+
+	stream_open(migf->filp->f_inode, migf->filp);
+
+	return migf;
+}
+
+static struct file *
+xe_vfio_set_state(struct xe_vfio_pci_core_device *xe_vdev, u32 new)
+{
+	u32 cur = xe_vdev->mig_state;
+	int ret;
+
+	dev_dbg(xe_vdev_to_dev(xe_vdev),
+		"state: %s->%s\n", vfio_dev_state_str(cur), vfio_dev_state_str(new));
+
+	/*
+	 * "STOP" handling is reused for "RUNNING_P2P", as the device doesn't
+	 * have the capability to selectively block outgoing p2p DMA transfers.
+	 * While the device is allowing BAR accesses when the VF is stopped, it
+	 * is not processing any new workload requests, effectively stopping
+	 * any outgoing DMA transfers (not just p2p).
+	 * Any VRAM / MMIO accesses occurring during "RUNNING_P2P" are kept and
+	 * will be migrated to target VF during stop-copy.
+	 */
+	if (cur == VFIO_DEVICE_STATE_RUNNING && new == VFIO_DEVICE_STATE_RUNNING_P2P) {
+		ret = xe_sriov_vfio_suspend_device(xe_vdev->xe, xe_vdev->vfid);
+		if (ret)
+			goto err;
+
+		return NULL;
+	}
+
+	if ((cur == VFIO_DEVICE_STATE_RUNNING_P2P && new == VFIO_DEVICE_STATE_STOP) ||
+	    (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_RUNNING_P2P))
+		return NULL;
+
+	if (cur == VFIO_DEVICE_STATE_RUNNING_P2P && new == VFIO_DEVICE_STATE_RUNNING) {
+		ret = xe_sriov_vfio_resume_device(xe_vdev->xe, xe_vdev->vfid);
+		if (ret)
+			goto err;
+
+		return NULL;
+	}
+
+	if (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_STOP_COPY) {
+		struct xe_vfio_pci_migration_file *migf;
+
+		migf = xe_vfio_pci_alloc_file(xe_vdev, XE_VFIO_FILE_SAVE);
+		if (IS_ERR(migf)) {
+			ret = PTR_ERR(migf);
+			goto err;
+		}
+		get_file(migf->filp);
+
+		ret = xe_sriov_vfio_stop_copy_enter(xe_vdev->xe, xe_vdev->vfid);
+		if (ret) {
+			fput(migf->filp);
+			goto err;
+		}
+
+		return migf->filp;
+	}
+
+	if (cur == VFIO_DEVICE_STATE_STOP_COPY && new == VFIO_DEVICE_STATE_STOP) {
+		if (xe_vdev->migf)
+			xe_vfio_pci_put_file(xe_vdev);
+
+		ret = xe_sriov_vfio_stop_copy_exit(xe_vdev->xe, xe_vdev->vfid);
+		if (ret)
+			goto err;
+
+		return NULL;
+	}
+
+	if (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_RESUMING) {
+		struct xe_vfio_pci_migration_file *migf;
+
+		migf = xe_vfio_pci_alloc_file(xe_vdev, XE_VFIO_FILE_RESUME);
+		if (IS_ERR(migf)) {
+			ret = PTR_ERR(migf);
+			goto err;
+		}
+		get_file(migf->filp);
+
+		ret = xe_sriov_vfio_resume_data_enter(xe_vdev->xe, xe_vdev->vfid);
+		if (ret) {
+			fput(migf->filp);
+			goto err;
+		}
+
+		return migf->filp;
+	}
+
+	if (cur == VFIO_DEVICE_STATE_RESUMING && new == VFIO_DEVICE_STATE_STOP) {
+		if (xe_vdev->migf)
+			xe_vfio_pci_put_file(xe_vdev);
+
+		ret = xe_sriov_vfio_resume_data_exit(xe_vdev->xe, xe_vdev->vfid);
+		if (ret)
+			goto err;
+
+		return NULL;
+	}
+
+	WARN(true, "Unknown state transition %d->%d", cur, new);
+	return ERR_PTR(-EINVAL);
+
+err:
+	dev_dbg(xe_vdev_to_dev(xe_vdev),
+		"Failed to transition state: %s->%s err=%d\n",
+		vfio_dev_state_str(cur), vfio_dev_state_str(new), ret);
+	return ERR_PTR(ret);
+}
+
+static struct file *
+xe_vfio_pci_set_device_state(struct vfio_device *core_vdev,
+			     enum vfio_device_mig_state new_state)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+	enum vfio_device_mig_state next_state;
+	struct file *f = NULL;
+	int ret;
+
+	xe_vfio_pci_state_mutex_lock(xe_vdev);
+	while (new_state != xe_vdev->mig_state) {
+		ret = vfio_mig_get_next_state(core_vdev, xe_vdev->mig_state,
+					      new_state, &next_state);
+		if (ret) {
+			xe_sriov_vfio_error(xe_vdev->xe, xe_vdev->vfid);
+			f = ERR_PTR(ret);
+			break;
+		}
+		f = xe_vfio_set_state(xe_vdev, next_state);
+		if (IS_ERR(f))
+			break;
+
+		xe_vdev->mig_state = next_state;
+
+		/* Multiple state transitions with non-NULL file in the middle */
+		if (f && new_state != xe_vdev->mig_state) {
+			fput(f);
+			f = ERR_PTR(-EINVAL);
+			break;
+		}
+	}
+	xe_vfio_pci_state_mutex_unlock(xe_vdev);
+
+	return f;
+}
+
+static int xe_vfio_pci_get_device_state(struct vfio_device *core_vdev,
+					enum vfio_device_mig_state *curr_state)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+
+	xe_vfio_pci_state_mutex_lock(xe_vdev);
+	*curr_state = xe_vdev->mig_state;
+	xe_vfio_pci_state_mutex_unlock(xe_vdev);
+
+	return 0;
+}
+
+static int xe_vfio_pci_get_data_size(struct vfio_device *vdev,
+				     unsigned long *stop_copy_length)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+
+	xe_vfio_pci_state_mutex_lock(xe_vdev);
+	*stop_copy_length = xe_sriov_vfio_stop_copy_size(xe_vdev->xe, xe_vdev->vfid);
+	xe_vfio_pci_state_mutex_unlock(xe_vdev);
+
+	return 0;
+}
+
+static const struct vfio_migration_ops xe_vfio_pci_migration_ops = {
+	.migration_set_state = xe_vfio_pci_set_device_state,
+	.migration_get_state = xe_vfio_pci_get_device_state,
+	.migration_get_data_size = xe_vfio_pci_get_data_size,
+};
+
+static void xe_vfio_pci_migration_init(struct xe_vfio_pci_core_device *xe_vdev)
+{
+	struct vfio_device *core_vdev = &xe_vdev->core_device.vdev;
+	struct pci_dev *pdev = to_pci_dev(core_vdev->dev);
+	struct xe_device *xe = xe_sriov_vfio_get_pf(pdev);
+	int ret;
+
+	if (!xe)
+		return;
+	if (!xe_sriov_vfio_migration_supported(xe))
+		return;
+
+	ret = pci_iov_vf_id(pdev);
+	if (ret < 0)
+		return;
+
+	mutex_init(&xe_vdev->state_mutex);
+	spin_lock_init(&xe_vdev->reset_lock);
+
+	/* PF internal control uses vfid index starting from 1 */
+	xe_vdev->vfid = ret + 1;
+	xe_vdev->xe = xe;
+	xe_vdev->migrate_cap = true;
+
+	core_vdev->migration_flags = VFIO_MIGRATION_STOP_COPY | VFIO_MIGRATION_P2P;
+	core_vdev->mig_ops = &xe_vfio_pci_migration_ops;
+}
+
+static void xe_vfio_pci_migration_fini(struct xe_vfio_pci_core_device *xe_vdev)
+{
+	if (!xe_vdev->migrate_cap)
+		return;
+
+	mutex_destroy(&xe_vdev->state_mutex);
+}
+
+static int xe_vfio_pci_init_dev(struct vfio_device *core_vdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+
+	xe_vfio_pci_migration_init(xe_vdev);
+
+	return vfio_pci_core_init_dev(core_vdev);
+}
+
+static void xe_vfio_pci_release_dev(struct vfio_device *core_vdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+
+	xe_vfio_pci_migration_fini(xe_vdev);
+}
+
+static const struct vfio_device_ops xe_vfio_pci_ops = {
+	.name = "xe-vfio-pci",
+	.init = xe_vfio_pci_init_dev,
+	.release = xe_vfio_pci_release_dev,
+	.open_device = xe_vfio_pci_open_device,
+	.close_device = vfio_pci_core_close_device,
+	.ioctl = vfio_pci_core_ioctl,
+	.device_feature = vfio_pci_core_ioctl_feature,
+	.read = vfio_pci_core_read,
+	.write = vfio_pci_core_write,
+	.mmap = vfio_pci_core_mmap,
+	.request = vfio_pci_core_request,
+	.match = vfio_pci_core_match,
+	.match_token_uuid = vfio_pci_core_match_token_uuid,
+	.bind_iommufd = vfio_iommufd_physical_bind,
+	.unbind_iommufd = vfio_iommufd_physical_unbind,
+	.attach_ioas = vfio_iommufd_physical_attach_ioas,
+	.detach_ioas = vfio_iommufd_physical_detach_ioas,
+};
+
+static int xe_vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	struct xe_vfio_pci_core_device *xe_vdev;
+	int ret;
+
+	xe_vdev = vfio_alloc_device(xe_vfio_pci_core_device, core_device.vdev, &pdev->dev,
+				    &xe_vfio_pci_ops);
+	if (IS_ERR(xe_vdev))
+		return PTR_ERR(xe_vdev);
+
+	dev_set_drvdata(&pdev->dev, &xe_vdev->core_device);
+
+	ret = vfio_pci_core_register_device(&xe_vdev->core_device);
+	if (ret) {
+		vfio_put_device(&xe_vdev->core_device.vdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void xe_vfio_pci_remove(struct pci_dev *pdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev = pci_get_drvdata(pdev);
+
+	vfio_pci_core_unregister_device(&xe_vdev->core_device);
+	vfio_put_device(&xe_vdev->core_device.vdev);
+}
+
+#define INTEL_PCI_VFIO_DEVICE(_id) { \
+	PCI_DRIVER_OVERRIDE_DEVICE_VFIO(PCI_VENDOR_ID_INTEL, (_id)) \
+}
+
+static const struct pci_device_id xe_vfio_pci_table[] = {
+	INTEL_PTL_IDS(INTEL_PCI_VFIO_DEVICE),
+	INTEL_WCL_IDS(INTEL_PCI_VFIO_DEVICE),
+	INTEL_BMG_IDS(INTEL_PCI_VFIO_DEVICE),
+	{}
+};
+MODULE_DEVICE_TABLE(pci, xe_vfio_pci_table);
+
+static struct pci_driver xe_vfio_pci_driver = {
+	.name = "xe-vfio-pci",
+	.id_table = xe_vfio_pci_table,
+	.probe = xe_vfio_pci_probe,
+	.remove = xe_vfio_pci_remove,
+	.err_handler = &xe_vfio_pci_err_handlers,
+	.driver_managed_dma = true,
+};
+module_pci_driver(xe_vfio_pci_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Michał Winiarski <michal.winiarski@intel.com>");
+MODULE_DESCRIPTION("VFIO PCI driver with migration support for Intel Graphics");
-- 
2.51.2

