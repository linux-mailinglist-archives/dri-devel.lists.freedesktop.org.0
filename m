Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7F69B424F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 07:18:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A504910E1A0;
	Tue, 29 Oct 2024 06:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nBoKRVvB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6231810E1A0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 06:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730182720; x=1761718720;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cT67UowbjBuAVe4Rff5duy0ctkE2injMBzQ0ajyEkmM=;
 b=nBoKRVvBQ6kvFTesKRyYrjjZ1vd8KHhyXlXBCRL0YQyys2D4CUlCmiml
 WUi/DwNw/afu/8bHYSfmSmCnGMKh0+WsXme4/KLh9zpi4OwVKvCy+4nfI
 DMTAOCSK/on/hDmVLHFPxT209rI1rfwUeMqj5AFLomPHdppB17pfAzp0w
 l4aztzQx+jktoBgGXZY6fPq015uFAy0FUNHhT3v2EeOe/XQmin2dhxnkh
 vqKxwGiHHE8nsdAughDJqyrzjHz27qcslrZbjEhV+q7D2nqzj24I6Hrn0
 DU6pIa/MFC0T35kNJKXs+jAvBhK77QKbh8gT2uHxikaFfyheOoHnUWvQ4 A==;
X-CSE-ConnectionGUID: 6D9irgzuSR+XtTBMHdA3iQ==
X-CSE-MsgGUID: bv7W2a3cSZeEC8Pd6bzAkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="30017920"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="30017920"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 23:18:39 -0700
X-CSE-ConnectionGUID: kFPTZK0vQ1miG5arLJ4S/w==
X-CSE-MsgGUID: Y1aEDtzXR3uQ3IZKx4uIfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="119312739"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Oct 2024 23:18:39 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 23:18:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 23:18:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 23:18:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZuhJ9UzJPbD08tXG5Q6XvfmF85KhEZ9Pm6iKQi5VuKlqvJU3cqf33I2UxPIBduIR7rxNJNr/WEQzP4IyUILpp2MMgdAbYBOSVzi6RB9k45FQ74yGsEH7nftSHA6boFg34SSy1Bu2NMtJGvktUfKjq8eyXn4vlJcNqYWPF971r8oMLP78HbiSHW//yTs2+D/GL4s1dkHp9IaPpgocn/LtCkkpZo208HS1xu3tN3mNx7LEosQe9ALjmCs1LRm4BBGboojW/IvlmXwIE8IZ7jRObwP44TlE9MRHYiVAy0U2nSbN6H0RzT7ZegGZzSP/JeZrqmHlDnDrI8nDc528LCGP3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cT67UowbjBuAVe4Rff5duy0ctkE2injMBzQ0ajyEkmM=;
 b=NSvyIvin9g5cRYqi239MNgp9Ic2rlUZMu5a7ECgKo2SGqKhCHC5paYDXAY5r6PggjeHS8q1LR5yu2HC+399kkTbFlYECQOF2gRF1syKr9jtwTAJliCO4FXdF70imX0yBHzm8l7vs34PAybC26stm1cc2T4uChbJyxToAzLyPkM55Q/yD9mQAMjmFXYgEYSfaunl+QN/rdkAu4CBYSmeI6TxDdZAy6IipKDp9x4mfkCPfxTV+nNOXdRaBPwH888wZz9R1bKSJExMykwXY+QOny1155PDeFYGsZbeWZcug8Z/tejXVY6eGy97hAWL7mSCpgRUzJZ3kc2di8jR33ngG4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CH0PR11MB5265.namprd11.prod.outlook.com (2603:10b6:610:e0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Tue, 29 Oct
 2024 06:18:19 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%5]) with mapi id 15.20.8093.025; Tue, 29 Oct 2024
 06:18:19 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
Subject: RE: [PATCH v2 2/5] drm/virtio: Add a helper to map and note the dma
 addrs and lengths
Thread-Topic: [PATCH v2 2/5] drm/virtio: Add a helper to map and note the dma
 addrs and lengths
Thread-Index: AQHa7TgPrcbKIkB680CVAbY2s3+7ybKQ+qcAgAEiG4CAAgTjAIABpIUwgAK8GwCABQI3cA==
Date: Tue, 29 Oct 2024 06:18:19 +0000
Message-ID: <IA0PR11MB7185C176AF07732D39AA4F86F84B2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240813035509.3360760-1-vivek.kasireddy@intel.com>
 <20240813035509.3360760-3-vivek.kasireddy@intel.com>
 <45fbbd65-7e97-41c3-898a-49b6fa65e27e@collabora.com>
 <IA0PR11MB7185625CF2B9E7635A0CF164F84C2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <071a239f-50fd-44f3-9283-3dc928edb389@collabora.com>
 <IA0PR11MB718548F4F8971C91FCA456CCF84E2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <4feda09d-7a5e-4db4-83f8-f75eb0566b4a@collabora.com>
In-Reply-To: <4feda09d-7a5e-4db4-83f8-f75eb0566b4a@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CH0PR11MB5265:EE_
x-ms-office365-filtering-correlation-id: 1014e3db-0176-4fab-9559-08dcf7e17b7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Y2M0aHQvdkRiUEd3Kzc4R2NWM05rTU15aHdwVGpRd1N6OXcvTW80WEFEL2ho?=
 =?utf-8?B?M21FbXN2VTVqbGtaREo1NXBNcVZ5bnpuOFFFaGRFdWY0OVdNUWgwVCs3VDgv?=
 =?utf-8?B?aGlBL1VhWmxhWXFZVlIxb1U0a3o0ZXl5b0tybEtlQ1BCVjFwQVNXS2FtR1NX?=
 =?utf-8?B?R0gyWDliQ2l2VHQxUjFrS0hISllOOVVqdVljamlQNUpDK21nR3AySEppRWM2?=
 =?utf-8?B?aHg3MjM5SGtueDRhRzlsZ01RY3FuU0k2SE1NZmRqd1FES2RJaW05U2pCVUth?=
 =?utf-8?B?QlhkemJHQ21hQW50MGo0bnlwZGYvRmJLc2RkeFF4VUk2cG9Eb01CazJwVStB?=
 =?utf-8?B?b2hHUGVNaVl6bWljLzMyMEtsLzdjcXJQcGN1M2hsbzhlcituSWFPTzc5ZkRp?=
 =?utf-8?B?OHUyNy9EL1BQRlE5TVdtNzdiRi8ydExqSVdFK1JvNEY2cTJJT2lNYldwTDJW?=
 =?utf-8?B?TVlvWTZmelVKWHF2M09PY2VGMmhLd3R5b0F3ZjZsc1BjZ0lYVWFGTndFcHZq?=
 =?utf-8?B?VXJKNEhLNGd3SHVicEluNGY1ekErOWRkS2VzeGZBYzRYVDV0UUNsYTdnS1hM?=
 =?utf-8?B?NXBVV0cveEdvTGJtaGQ3THNsSWJESTFkUzBDS2ZmWGlBb0hqekIySU9oWEJQ?=
 =?utf-8?B?NkZnUXVySy9DTXYwWDV0ZHN0NGJqL0lKSDViU01RK3lOQlVOdnhDMkhoV2c2?=
 =?utf-8?B?UFRkQ21mb2RKL0RzWkV0YzQyczF2VEkyNTROZ1JHVklhdGVnZUd2RjFXeFFa?=
 =?utf-8?B?RHJ3bXdldnlxTDR1a0Vya3pEZVE4cXNuSWZOZmZjbHVYbDZxRVdSWmNPejRh?=
 =?utf-8?B?UjZ3Q1RFVGd1dkRkaHMyb3FiUnhkcFRLa00zMlBjZ0dWM1hwRUFmL3RqZVFs?=
 =?utf-8?B?eGxSNEhndCtuM2I1QWkxdHZqa0U0Rjhia2JvZjdQMWhBQUtiUEl1T0ozcnZG?=
 =?utf-8?B?R0tmZzVYa0FpeHlva3dqb05xRXZESU5jZEh0ai84TFhGNDdXMHVDbHA5SStN?=
 =?utf-8?B?ZnljM2NHU043WUtWTGdKMHVNZ0RHaUNuamErc1lJQ0srUkdmMWdZTTdqMFJp?=
 =?utf-8?B?MEV1OVAyTG5kNmdYak9HNk0wQUl1WmloMEdxVVI0RUFETnFQQ1hjQnFybzJ3?=
 =?utf-8?B?ajB1T2tJYnlzc2hrSStBSXYyR2wwMmlMYWhMTVhqbUxSckdKdFFxUVFBWkxr?=
 =?utf-8?B?R2NlaEgrZy9PRVRMYTY4OTZLcmE2eWFsNng2UEE5L1hydUxPQW4vcjIwTWth?=
 =?utf-8?B?cXh1T2VRSm5KdlBTTEl4Q0EwTmxuUUg1OFV2TlNnSVM0U1VkMEtya2t4OTl5?=
 =?utf-8?B?V1d0Zk5IeWJYWEhsWnQ5NStTVHNIcFJUMnAwOFcyeHVHVlFCeWlIR1NKTnM1?=
 =?utf-8?B?Nk4yRGh3bEdqQWxQbUtQY1BrMnZqRU4xamFBS1NJTnVZckI1RnNJekNYd21V?=
 =?utf-8?B?M0FLYnhRSFQ2dFpSZklrMkcwcVJWY3ZRS1hyNVd6V2lCeEk2TXkyajVxYTg0?=
 =?utf-8?B?eERIdHQ5ZkFTSTV1LzNVRy9LLy9vTjRmVDNOZHVKWEJPUTh2STh2ZS9rRTUx?=
 =?utf-8?B?dlpSM2JuTkNJZzVQUTRpZ1c3aXdsUnd3TmVvY2IwSkVPdndqa0tuR1hWa2cx?=
 =?utf-8?B?ZWVpWlRoYVN0dTJJVGt4b3ZEcHBTejA4T3RacksweUZZYjNsMkYra0tEMXZB?=
 =?utf-8?B?YXp6aVpOeFpQWS9MSlhVdzhRSkFkNXJ3aFJOK0dCYkV5aTBVbTkyRTVFY3Rh?=
 =?utf-8?B?aFpkdGZKNDg4MVRveWZWdjd1UUk1UjFJVmpGbHdYamM5UnQwOUNQbmJWckQ0?=
 =?utf-8?Q?VT5diqF5vkwqAICWJHS/5BOqqKPcykEn+/u+U=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmFRNFMxWU9BczAxWkM0R05Rc3BnU256eCs0Q0NtdlgrcjBTaUFkNGNZaW4y?=
 =?utf-8?B?bVhUa0FMcmkxOUNGNHBoOU84VTRLVjdvUE5ndVZDSGNtUmhuNVRjdXYwWGdy?=
 =?utf-8?B?bWZYbzZrRFhuOVNTRSt5akNaaDhLOWJpU3RoK3FqL1dmWGlMYzFwWUlrSE5u?=
 =?utf-8?B?MlUyRnA0TmlvaFFLd3JhaTVqdWsrZ0VGR00vWk1YNXMwekd1eTA1Mm15R2tT?=
 =?utf-8?B?Wk9RY3cyblVCT25idGJnZHVNbUlrVHhaekdwcit0QitFYnlESUFJRUlqWURi?=
 =?utf-8?B?clVVdDhhQk9WUkhpSUJQUTc2MjRhWXhGWUdtLzdSdklwejVUN1NVelpvdVc3?=
 =?utf-8?B?aDhuRCtXNVRzekFxZ3c0Z2d3QVVYd3Z5R1NsREN5bHlnYSt1OVFhc0xHeVdX?=
 =?utf-8?B?blBJdEZoMHRtdG51dHF0MTJiQUxLSndLZ004eEFnZzRneFZuNFFWN0dhVUVX?=
 =?utf-8?B?N29oOTYvQWFsdklSU2RZNnhaeGdhQzNEK1I5U2lyRFNOcmxNdVdoMWkrbzNs?=
 =?utf-8?B?bThPcXpqU25MUGlMTVBOUVdXRnRXYkZNRFJvOE5uL2lmV0prSFYvZ3JiamM1?=
 =?utf-8?B?TW9CTC9CQUdwQWxZbWtMbDNrZ1ZsZ3c4Z2tTcWFNR3dlb29vcXF2WjJveVo2?=
 =?utf-8?B?aWRHeWJTbjRybzE2YjNsRzAwY1ozRTVORWFoRnJUeFpTNHRUY0cwOFBJUVU0?=
 =?utf-8?B?TXZQMzg2QWd4Q202QzNzNnpzM3cydUw3Z1QyZzZtckZPTGdwczNtS0s3U2ZZ?=
 =?utf-8?B?RXhMb2F6aTI2ZG1XSTQwa0JvT0ErUUpmcVpLZk01Sjh3aDkySEwyYit0b0FB?=
 =?utf-8?B?ak52TGdDRFVFRjNCV0pKa2o3QjJuUncxQ3lvVG1YZGtZL0tjbjAyendyMzd2?=
 =?utf-8?B?OEkvMzI0dDUxZFh1WEFsN1lPRDhHSkhWeGxQS0d4SWZYVkZVcUo1bEhGYjNl?=
 =?utf-8?B?bzJ1MUJJVjJ6U2ladTRaUXRSN0dGa1lqWGIrZTBBNW1XZHZpdnhmVXpwbVdH?=
 =?utf-8?B?R1FaS3pMTXlyR2luQTF5c0VBa3ljRVR4bGgyRWg5cEhiSXFSMDJxalhGTVpr?=
 =?utf-8?B?cTIyMU12cUVrTGdLV21vWVFSQmNxck5NbldlcmxQQVIwY0VtbnlRNkxaUFBN?=
 =?utf-8?B?MC9lSTZUR1k3TU1wMTBGZlRjRVdCWGhGV3Ryb0tURkFaWEVzeE50K01TSk4z?=
 =?utf-8?B?K1BxMUVGSTJEWTEvVFFHNVYrY21OSHFWSlZxSnFTWk5OckNGQklPd013U214?=
 =?utf-8?B?dnhZTFE5MjJRaVJiODRaSnZLeDRJWWxyMmlFaU90Q2lYVVJiWEVzQWZQVzhO?=
 =?utf-8?B?cXhwWFVOeU5LVlF0OVVEOE5pbzNPbkdxeS9QN0RMcXJpc1NnMmhTYmUwMlhU?=
 =?utf-8?B?T3JaYkk5NjdWS0ZQaWppZkhyUkp6RnRqVWE2SU8rVVo4dmlSV1dpUHJBZUN6?=
 =?utf-8?B?QnY2Z3lxcGlta1JrLzNKN0dObUVBMmYyM0NqcnVkQ3VxT01CNk9uNXkzUHVP?=
 =?utf-8?B?dzk2UjFBcFZZc0x5SWxsYjViS2dDNUQvZjJWYlAwMkpISzg3Unhaa1owQkp1?=
 =?utf-8?B?aXlqVEdhc1hJMldzYWwzRmh5bTFkOHA2K1hoOUViTnhvOVVzMFhGb2d5SG9K?=
 =?utf-8?B?Uk5uR1BCVi9rR0hrRndTRlEzajdVSG1HVnB4ZVg0QUQ5WnVwa0lBT3FCWG8w?=
 =?utf-8?B?R1ZhN1BmYldrZTZXYjh4TUgxZXY2bmo2M2FycEZNY1dpUE9YdzNYNHVoN1ZM?=
 =?utf-8?B?QWlib2dUREVTcDROSGszN2VNaklQU3Z5RjkwVXJXTGU2VnhFNVJLRExudFYw?=
 =?utf-8?B?S0lxT1NONDFWSVJQOFNTSythL0VOUDREVFMzWFdleDNvM3JCT3RKZHM0b1pO?=
 =?utf-8?B?UTlRWlV3UlFuYWEvaGg3SGVuVXhacFBiQzlLTjJQSXFKbkhFUnd2VFFwV0hF?=
 =?utf-8?B?NmQrRTlqM2o5K1NGTFdmUzlRS2xneGE1TjFjWmEra21DMkxzK1cxWGtLV0Mw?=
 =?utf-8?B?dHhHZHQ3eksyZVFCWlZxb0x0L095V0p4Ykkzb1ozdlYreEdUd2dWSW5MVUVz?=
 =?utf-8?B?OHRIbFJYYy9yV0sxNTJ5d2hwQ1hGb2xTRXJtWko0Mm9EUm4vdXhPM2huYTNm?=
 =?utf-8?Q?0SAsCdL3LTHT2UTQq1pHPkW8m?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1014e3db-0176-4fab-9559-08dcf7e17b7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 06:18:19.0750 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vElDNCgQB5f9EariLGwoP1/LIBbVVtuKJTH7twRk5fR5jfXWS7eGKGho2TDeDzA5ibQ1QaFsuAMIEdDoiI+JPZtClE/aMQKXykTBvRhyYMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5265
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

SGkgRG1pdHJ5LA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi81XSBkcm0vdmlydGlvOiBB
ZGQgYSBoZWxwZXIgdG8gbWFwIGFuZCBub3RlIHRoZQ0KPiBkbWEgYWRkcnMgYW5kIGxlbmd0aHMN
Cj4gPj4+Pj4gK2xvbmcgdmlydGdwdV9kbWFfYnVmX2ltcG9ydF9zZ3Qoc3RydWN0IHZpcnRpb19n
cHVfbWVtX2VudHJ5DQo+ID4+ICoqZW50cywNCj4gPj4+Pj4gKwkJCQl1bnNpZ25lZCBpbnQgKm5l
bnRzLA0KPiA+Pj4+PiArCQkJCXN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqYm8sDQo+ID4+Pj4+
ICsJCQkJc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoKQ0KPiA+Pj4+PiArew0KPiA+
Pj4+PiArCXN0cnVjdCBzY2F0dGVybGlzdCAqc2w7DQo+ID4+Pj4+ICsJc3RydWN0IHNnX3RhYmxl
ICpzZ3Q7DQo+ID4+Pj4+ICsJbG9uZyBpLCByZXQ7DQo+ID4+Pj4+ICsNCj4gPj4+Pj4gKwlkbWFf
cmVzdl9hc3NlcnRfaGVsZChhdHRhY2gtPmRtYWJ1Zi0+cmVzdik7DQo+ID4+Pj4+ICsNCj4gPj4+
Pj4gKwlyZXQgPSBkbWFfcmVzdl93YWl0X3RpbWVvdXQoYXR0YWNoLT5kbWFidWYtPnJlc3YsDQo+
ID4+Pj4+ICsJCQkJICAgIERNQV9SRVNWX1VTQUdFX0tFUk5FTCwNCj4gPj4+Pj4gKwkJCQkgICAg
ZmFsc2UsIE1BWF9TQ0hFRFVMRV9USU1FT1VUKTsNCj4gPj4+Pg0KPiA+Pj4+IFdoeSB0aGlzIHdh
aXQgaXMgbmVlZGVkPw0KPiA+Pj4gVGhlIGludGVudGlvbiB3YXMgdG8gd2FpdCBmb3IgYW55IHBl
bmRpbmcgb3BlcmF0aW9ucyBvbiB0aGUgYmFja2luZw0KPiBvYmplY3QNCj4gPj4+IHRvIGZpbmlz
aCBhbmQgbGV0IGl0IGJlY29tZSBpZGxlIGJlZm9yZSBtYXBwaW5nIGFuZCBhY2Nlc3NpbmcgdGhl
DQo+ID4+IHVuZGVybHlpbmcNCj4gPj4+IG1lbW9yeS4gQnV0IEkgc3VzcGVjdCB0aGlzIHdhaXQg
bWF5IG5vdCBiZSBuZWNlc3NhcnkgZ2l2ZW4gdGhhdCB3ZQ0KPiB3b3VsZA0KPiA+Pj4gaGF2ZSBh
bHJlYWR5IGNhbGxlZCBkbWFfYnVmX3BpbigpIGF0IHRoaXMgcG9pbnQsIHdoaWNoIHdvdWxkIGhh
dmUgaGFkDQo+IHRoZQ0KPiA+Pj4gZGVzaXJlZCBlZmZlY3Q/DQo+ID4+DQo+ID4+IExvb2tpbmcg
YXQgdGhlIGRtYV9idWZfbWFwX2F0dGFjaG1lbnQoKSBjb2RlLCBJIHNlZSB0aGF0IGl0IGRvZXMg
Ym90aA0KPiBvZg0KPiA+PiBwaW5uaW5nIGFuZCB3YWl0aW5nIGZvciB0aGUgZmVuY2UgYnkgaXRz
ZWxmLiBIZW5jZSBzaG91bGQgYmUgc2FmZSB0bw0KPiA+PiBkcm9wIGJvdGggZG1hX2J1Zl9waW4o
KSBhbmQgZG1hX3Jlc3Zfd2FpdF90aW1lb3V0KCksIHBsZWFzZSB0ZXN0Lg0KPiA+IFN1cmUsIEkn
bGwgcmV0ZXN0IGFnYWluIGJ1dCBpdCBsb29rcyBsaWtlIGRtYV9idWZfbWFwX2F0dGFjaG1lbnQo
KSBwaW5zIGFuZA0KPiA+IG9yIHdhaXRzIGZvciBmZW5jZSBvbmx5IGluIHNwZWNpZmljIHNpdHVh
dGlvbnMuIFRoYXQgaXMsIGl0IHBpbnMgb25seSBpZiB0aGUNCj4gZXhwb3J0ZXINCj4gPiBpcyBu
b24tZHluYW1pYyBhbmQgaWYgQ09ORklHX0RNQUJVRl9NT1ZFX05PVElGWSBpcyBub3QgZW5hYmxl
ZC4NCj4gQW5kLA0KPiA+IGl0IHdhaXRzIGZvciB0aGUgZmVuY2Ugb25seSBpZiB0aGUgaW1wb3J0
ZXIgaXMgbm9uLWR5bmFtaWMuIFNpbmNlIEkgaGF2ZSBvbmx5DQo+IHRlc3RlZA0KPiA+IHdpdGgg
YSBkeW5hbWljIGV4cG9ydGVyIChYZSBkcml2ZXIpLCBJIGRpZCBub3QgZW5jb3VudGVyIGFueSBp
c3N1ZXMgYnV0IGl0DQo+IG1ha2VzDQo+ID4gc2Vuc2UgdG8gYXVnbWVudCB0aGUgY29kZSB0byBh
Y2NvdW50IGZvciBub24tZHluYW1pYyBleHBvcnRlcnMgYXMgd2VsbC4NCj4gDQo+IElmIGV4cG9y
dGVyIG9yIGltcG9ydGVyIGlzIG5vdCBkeW5hbWljLCB0aGVuIGRtYS1idWYgY29yZSBwaW5zIGJ1
ZmZlciBhdA0KPiB0aGUgYnVmZmVyIGltcG9ydGluZyB0aW1lLCBzZWUgZG1hX2J1Zl9hdHRhY2go
KS4gSGVuY2UsIEkgZXhwZWN0IHRoYXQNCj4gZXZlcnl0aGluZyBzaG91bGQgd29yayBmaW5lLg0K
R2l2ZW4gdGhhdCB2aXJ0aW8tZ3B1IHdvdWxkIGFsd2F5cyBiZSBhIGR5bmFtaWMgaW1wb3J0ZXIg
KGluIG90aGVyIHdvcmRzLA0KZG1hX2J1Zl9hdHRhY2htZW50X2lzX2R5bmFtaWMoKSBpcyB0cnVl
KSBhcyBwcm9wb3NlZCBpbiB0aGlzIHNlcmllcywgdGhlDQpxdWVzdGlvbiByZWFsbHkgaXMgYWJv
dXQgd2hldGhlciB0aGUgZXhwb3J0ZXIgaXMgZHluYW1pYyBvciBub3QuDQpJIHRlc3RlZCB3aXRo
IGJvdGggWGUgZHJpdmVyIChkeW5hbWljIGV4cG9ydGVyKSBhbmQgaTkxNSAobm9uLWR5bmFtaWMp
DQphbmQgbm90ZWQgdGhlIGZvbGxvd2luZzoNCg0KRm9yIFhlIChkbWFfYnVmX2lzX2R5bmFtaWMo
KSBpcyB0cnVlKToNCi0gZG1hLWJ1ZiBjb3JlIGNhbGxzIHBpbiBvbmx5IGlmIENPTkZJR19ETUFC
VUZfTU9WRV9OT1RJRlkgaXMgbm90DQogIGVuYWJsZWQsIGFuZCBleHRyYWN0cyB0aGUgc2d0IGFz
IHBhcnQgb2YgZG1hX2J1Zl9tYXBfYXR0YWNobWVudCgpDQotIEl0IGRvZXMgbm90IHdhaXQgZm9y
IHRoZSBmZW5jZXMgYXMgcGFydCBvZiBtYXANCg0KRm9yIGk5MTUgKGRtYV9idWZfaXNfZHluYW1p
YygpIGlzIGZhbHNlKToNCi0gZG1hLWJ1ZiBjb3JlIGRvZXMgbm90IGNhbGwgcGluIGFueXdoZXJl
IGFzIGl0IGlzIGEgbm8tb3AgZm9yIG5vbi1keW5hbWljDQogIGV4cG9ydGVycywgYnV0IG1hcHMv
ZXh0cmFjdHMgdGhlIHNndCBhcyBwYXJ0IG9mIGRtYV9idWZfZHluYW1pY19hdHRhY2goKQ0KLSBJ
dCBkb2VzIG5vdCB3YWl0IGZvciBmZW5jZXMgYW55d2hlcmUNCg0KQW5kLCB0aGUgZG9jcyBtZW50
aW9uIHRoZSBmb2xsb3dpbmcgcnVsZXMgZm9yIGR5bmFtaWMgaW1wb3J0ZXJzOg0KIkRZTkFNSUMg
SU1QT1JURVIgUlVMRVM6DQoNCkR5bmFtaWMgaW1wb3J0ZXJzLCBzZWUgZG1hX2J1Zl9hdHRhY2ht
ZW50X2lzX2R5bmFtaWMoKSwgaGF2ZSBhZGRpdGlvbmFsDQpjb25zdHJhaW50cyBvbiBob3cgdGhl
eSBzZXQgdXAgZmVuY2VzOg0KDQpEeW5hbWljIGltcG9ydGVycyBtdXN0IG9iZXkgdGhlIHdyaXRl
IGZlbmNlcyBhbmQgd2FpdCBmb3IgdGhlbSB0byBzaWduYWwNCmJlZm9yZSBhbGxvd2luZyBhY2Nl
c3MgdG8gdGhlIGJ1ZmZlcuKAmXMgdW5kZXJseWluZyBzdG9yYWdlIHRocm91Z2ggdGhlIGRldmlj
ZS4NCg0KRHluYW1pYyBpbXBvcnRlcnMgc2hvdWxkIHNldCBmZW5jZXMgZm9yIGFueSBhY2Nlc3Mg
dGhhdCB0aGV5IGNhbuKAmXQgZGlzYWJsZQ0KaW1tZWRpYXRlbHkgZnJvbSB0aGVpciBkbWFfYnVm
X2F0dGFjaF9vcHMubW92ZV9ub3RpZnkgY2FsbGJhY2suIg0KDQpTbywgSSBiZWxpZXZlIHdlIG5l
ZWQgdG8gY2FsbCBwaW4gYW5kIG9yIGRtYV9yZXN2X3dhaXRfdGltZW91dChyZXN2LA0KRE1BX1JF
U1ZfVVNBR0VfV1JJVEUsLi4uLikgYXQgc29tZSBwb2ludCwgYXMgcGFydCBvZiBpbXBvcnQsIGdp
dmVuDQp0aGVzZSBydWxlcy4NCg0KPiANCj4gPj4gQlRXLCBpcyBhbnkgREcyIEdQVSBzdWl0YWJs
ZSBmb3IgdGVzdGluZyBvZiB0aGlzIHBhdGNoc2V0PyBXaWxsIEkgYmUNCj4gPj4gYWJsZSB0byB0
ZXN0IGl0IHVzaW5nIGEgcmVndWxhciBjb25zdW1lciBBNzUwIGNhcmQ/DQo+ID4gWWVzLCB5b3Ug
Y2FuIHRlc3Qgd2l0aCBhbnkgREcyIGRHUFUgYXMgbG9uZyBhcyB5b3UgY2FuIHBhc3N0aHJvdWdo
IGl0IHRvDQo+IHRoZQ0KPiA+IEd1ZXN0IFZNLiBBbmQsIGlmIHRoZXJlIGlzIGFuIGlHUFUgYXZh
aWxhYmxlIG9uIHRoZSBIb3N0LCB5b3UgY2FuIHVzZQ0KPiBHVEsvU0RMIFVJDQo+ID4gZm9yIGxv
Y2FsIGRpc3BsYXkgb3IgU3BpY2UgVUkgZm9yIHJlbW90ZSBkaXNwbGF5IGlmIHRoZXJlIGlzIG5v
IGlHUFUgb24gdGhlDQo+IEhvc3QuDQo+ID4gVGhpcyBpcyBleGFjdGx5IGhvdyBJIHN0YXJ0ZWQg
dGVzdGluZyB0aGlzIHBhdGNoIHNlcmllcyBidXQgSSBhbSBub3cNCj4gcHJlZG9taW5hbnRseQ0K
PiA+IHRlc3RpbmcgdGhpcyBzZXJpZXMgd2l0aCBTUklPViBlbmFibGVkIGlHUFVzIGFuZCBkR1BV
cy4NCj4gDQo+IFdhcyBob3BpbmcgdG8gdHJ5IG91dCBTUi1JT1Ygb24gQTc1MCBpZiBpdCdzIGV2
ZW4gcG9zc2libGUgYXQgYWxsLg0KQUZBSUssIFNSSU9WIGlzIG5vdCBzdXBwb3J0ZWQgb24gYW55
IHZlcnNpb25zIG9mIERHMiBpbmNsdWRpbmcgQTc1MC4NCg0KVGhhbmtzLA0KVml2ZWsNCg0KPiBC
dXQgcGFzc3Rocm91Z2ggaW5kZWVkIGlzIGFub3RoZXIgYW4gb3B0aW9uLCB3aWxsIHRyeSB3aXRo
IHBhc3N0aHJvdWdoLCB0aGFua3MuDQo+IA0KPiAtLQ0KPiBCZXN0IHJlZ2FyZHMsDQo+IERtaXRy
eQ0K
