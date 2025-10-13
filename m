Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19881BD2C61
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 13:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB85E10E1EC;
	Mon, 13 Oct 2025 11:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jj2NlcPA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF4C10E42E;
 Mon, 13 Oct 2025 11:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760354892; x=1791890892;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uEkAt8m4OupwgliA3dZTl1qS+YJ0nGrzEjUilTXvNJc=;
 b=Jj2NlcPAEXhVwlt5MKwCAfUDltQHjfB2710wfPW4xx6gKVwiez5s/ghf
 OJM0b58qqoFPnewvv4KtPe9m4/CYvDwto2af4n8XyKQmXow751E8OnjUR
 QLlKICFEjp5EIxOr46YQrVB3IF3GBuQQ6Rtsw7aGzG+tXb77/Q6JWEymB
 Cacqnq5X0SU/wc9da+1xS4ijN8EwVAskuiufV6EAogZAhpxVQcLrjxMo0
 nfB41+i2WAqMhopieX7pBq8puBbJ7IAGXQ1GwA5YMiEY4I00xfvhUPsr/
 WUYbyd7nHuQcLgx0EknzYd7LgNzE8bNShTlfC/VSwFYzgBBgWdbclB74i A==;
X-CSE-ConnectionGUID: KgJp9R6UReaSBggOVPHdeg==
X-CSE-MsgGUID: 2w4ZQ3ZqSNOThigY4gy7cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="72749031"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="72749031"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 04:28:11 -0700
X-CSE-ConnectionGUID: 0Rw7zF1RRu+A1Bfq19sU/A==
X-CSE-MsgGUID: KWoiZpyJQs2VdbTusisi7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="218688797"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 04:28:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 04:28:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 04:28:10 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 04:28:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqBWQmeauoxkSArkgK8JEYdrSqHGdSlbZ4+Hgq0PrueOrTLsZhbW98+ZWUU8AAE3HgrzaLvdEJBq052gyU4lRPIet88zBVz0sw1ygX8F2rNrZ7NxmPpML3Drtd3ShWSBMiMeEnF/0PE1dDDQ5F9ygAe+S21QB8Qy1cT0KrzDDHqq1shqj+DH7rW8t+wdLu/bf78iG2U/5/TCsmBd+JMn36j9/kCyAroJwbi0F+BFrdBm7Je3YJ0QQ2CK8NLzNx1dmLxpJXVrElUqRRxo8wZvfdFznCpQ7KRGlTbYcJCnOK5tqegcX4vZdTX5tNj1UvIje7UVuWfRZmF97kJjC4sdqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLTOFl8xGkM+WAz6RmfqJPiUymSJRaXdftginWtzCDo=;
 b=qD2x6/I0Igq6Jdu32AMbRXTnw6AN66JskmrAzP+ut9tQQXMCOJG0Z+V2x7JE8BS8tayux4WFI3uK+B/MTs4V8ZymXmI78DUXWBIUXDgGHv1MFz0JOj+2p+iLxf3imlAIVW+C5WGT80mWJe4kwTzCSGxCwWY3qlXO/tmg5K3taMvNEZKzA0/LBX+u2o8H9t/EORJpkQDqLBL5IUeO49Hi0zk8muMqzvSr2h1muaEhmppRIHuo3EJzx80fVZha9J1wk5/RPBuqZbzPi4jSQLYgH5gW9nS1B/Nc3qbvn5Pu/xD8VzcZyZGjbih8sizzJ2rObkT43J5e6E09zgYj6WxzQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ2PR11MB8323.namprd11.prod.outlook.com (2603:10b6:a03:53f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 11:28:02 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 11:28:02 +0000
Message-ID: <208353be-f7ad-445b-9015-4f4da61cd046@intel.com>
Date: Mon, 13 Oct 2025 13:27:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/26] drm/xe/pf: Increase PF GuC Buffer Cache size and
 use it for VF migration
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-13-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251011193847.1836454-13-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0127.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::25) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ2PR11MB8323:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f3dbfd1-bf32-4c5b-5ad5-08de0a4b91f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUVWYU9mbHRDLzFlWFlEY0RiU2xRWm5kSTRNTVg5b2xIMDRnUkprTUk1TXdp?=
 =?utf-8?B?MnI1SWhFdGRqOVFXekFrM1dxWkY4RFk1WUpQZHIyTHVGNXNsSHNYVmxzSDRS?=
 =?utf-8?B?YnZQVHpaTUU5SjAxOWV0cW5MaUdKOTRGZFZWL3NLR29IeWdvWW1vWkV4YTFX?=
 =?utf-8?B?Y3I0R1E2eFk3QzE3d21CQkFBa2lKUncvWGNJb1dVS2RqanBMTzlTTzVzck9s?=
 =?utf-8?B?ZXV0YVYxaFF2RXhuZzJ0M1UvSThtUFZGaDhVKzB2bno5RHVRTGh5RXdQOXNv?=
 =?utf-8?B?dnh0a0ZBOVpNeWQ4eElMMEVHZ1NJdmZ5cTljL3V5bVlXeWpwbWpNMURDZmF0?=
 =?utf-8?B?WG9VM2RuZEU4dXdrR2c0cmlLOGxiejJuVEV0aURqS2pNdmtYZ1JsUjNNQmlQ?=
 =?utf-8?B?T2dqRTZ3QzJMWUcyaUVGUTUyaFNkREpyU3NJdm9oenZMUVlLNnpZdWhnemVw?=
 =?utf-8?B?Qkg5VzhZcndqdlRBMThGN01SM3RZMUVma3Q0UldKTWVtZjIrSXlPcGVOV3Vj?=
 =?utf-8?B?RVJKdThzVE1lUStDNXgzLzNjU1hJaVhBMHVGVHR1RWpYTFVVakYxaDZlcDA5?=
 =?utf-8?B?SnptQ01VdWdzU2FzVTc5b3hHZytzRmRzTW9ORERVY014bUNEUEZ3OXJad1cz?=
 =?utf-8?B?anBHY3diWWJEdS9wQlVOaFVCTXl3eTFPK3pUMEJBYThvT2pqNklXYVQzWEE0?=
 =?utf-8?B?YU5CQnZaWFRYeE9oUDM1ZUhtK0F1QnhuWCtWdFc1N09PTEszbmdVTVhieGlL?=
 =?utf-8?B?eUMrdkV1emVBSG9zOHArRHN3WUhHTjY0ZzdDMTJQdU5Salo3MkZiVTJkTjdG?=
 =?utf-8?B?TkdnazBrajlkbkVTWlNjRFc4MGpmcDNHTEU0SFZTODZibUpUajV4WHZneDF2?=
 =?utf-8?B?eC93TlkwT3Y3eWw1d2M0SzgyTUpEZ3pJR2t2UytqMmRZZ01RamxLYlNNQ0JD?=
 =?utf-8?B?aXNvUGl3QUp2c0RnU3dJS1BwODgvSG93dGpSeXE3MXdhWks5OGFkRUZmelQ3?=
 =?utf-8?B?TFEwdUFOcElVekhUb1lMc3lYYS81ZGJwcXE2RkdYMDRqY1duZWFzSWZtcnJs?=
 =?utf-8?B?STlFczAvZmlEakdrbXJPSmY2NGJBY3JvaDJCc2M0bU1sWUttZmVpQnlSSll2?=
 =?utf-8?B?eVVoSEgxU09INFpNNTNPaFJtdktRNVg0d1ZHYnAzTUozdmdoY3BRSThUUEV3?=
 =?utf-8?B?MHE1aU1iYTVzeWlmekVLb29CZG5QTndiaEFHUlcrN2tTZ0k4U2RkMkMxQ2dh?=
 =?utf-8?B?elUvUFZScWlubVVEeTVWdndGOGgxMzhaSDV6N0hwWm94dFRUM2k0MHh6bFB1?=
 =?utf-8?B?QSs1SERwZmsyZjIwQmhFM1JCeUJabjVHd1lkZTMvVFJyMjJZeDJiNG43WU5l?=
 =?utf-8?B?MWU4RVBiZHpET3diQWZFRmxpNE1iZndyanlCOHFwb2NCZC9BdS9jMldqRGZz?=
 =?utf-8?B?YWpVRzNpdmF1TGU3emtBczA2bjl5OUR2YXlNbEFidTgvSmY3K0h1NXJycStE?=
 =?utf-8?B?dGMweGwwcFhpMHIzaVRrRFRJY1VzS25aK0ZLSUVUbExqbXZsVDlXYXZiL0sx?=
 =?utf-8?B?N2R6Z1h0RUIvNDRCVjNwaVJLK1JZeVF3dCtBTyszS1E2TGxvTmNjZVpLeGNK?=
 =?utf-8?B?RFZKcVZFVDFuaUw2TEFrNE1kM3dTdVIzTktrd2F5ZnhWTGkzWld2Yms1UjE5?=
 =?utf-8?B?YlJxVmhsTE1sM0JqN3J6NVQrZ2xVNEo1eThWd2ZOSExaVW5iTVBWUGlybGsy?=
 =?utf-8?B?NVFZWWlDY0o4UUVKQi9XQjVTYmVnUHZtQVE3dFhQNy9mY2VYbW13RFlON3J1?=
 =?utf-8?B?cXRocGtnV25YOVJLY2I5UkU3cGRwS2NBSC9SdlF3OFBwemtZTWVjWDdsUGJw?=
 =?utf-8?B?ejdWMTdiRWhWcENNSzZmWXd6U0Y0cENTQjgzQldTZWFaS3lUNkJhR2tWVUdi?=
 =?utf-8?B?WDFzbkdOblVqendSbmV1TUgrSnN5NHZpWjlwREJUNmxMbmVSdVg5SlBtSXFi?=
 =?utf-8?Q?7E77F3uVqUq/I/0ZTBNC4OQ9dRNdKc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDBaOUc3ZWRhLzROaXpNUEVWU2FMc2F2U1JGaGgyTXFZZWlENFUzL2d0aTZk?=
 =?utf-8?B?enI2djZZUnpVWEE4dEFSenZCMC9ESlM5eHhJcDhYRFVYQytBeWlxNEw4MHZ3?=
 =?utf-8?B?L01UaDVpajkxR2MwR1loS3lTNFNNYzBRblZiRCt1UC9wckd5M0JrcmNVNFh2?=
 =?utf-8?B?S3YrbmdpY1p5L3dJU1gwUWQxdzdmUTRyUUxicVNKcVVRVkdtdkxnVkg1VDZD?=
 =?utf-8?B?RFlSK2tCOGhPR2hSYTU2NWY3NjRIVGF0Ti9VL1NHVjdBTEJ6YUNTMUswSGJo?=
 =?utf-8?B?eTFjNWhiNk02WnJUOEVCNE5MMUNITVVsRGlDdkRnejQwaVlmM1A4UlJRYnRh?=
 =?utf-8?B?TmxRWXRoeXQ4dHljVHZQUERmeDNMZG5QYThvbkQrVzB3VmFCVjB3NHczTmh2?=
 =?utf-8?B?aG5RRWhXUHZNZHkxTTQ3YllrK0x3Q0NLbmc5VkUvb1Y4N2tnUnhHVFBmVUxQ?=
 =?utf-8?B?WVpoUnhVc2lHTjBhblRNSkl4amZBN0ZLUzRtaU5IcENuaTlHR3VDb1NVWWpE?=
 =?utf-8?B?a0RxeWFiWGhrOWdmQnZKYU96djgrV0tWZllGUDhsbm52Ym1qV3h2a0JpSjhh?=
 =?utf-8?B?ZzhFQWh5WjNKL2swbVNzREM1MklTYXhrc3FMa0pXK0xFd1A2b0NRQk94MU9O?=
 =?utf-8?B?WnFudmhnaFFCZktod09rVE8xd0sxZWtGd0F6R3RHandVbEtRVmVBdUVoRWJV?=
 =?utf-8?B?cVFUN2kvZ3JMTTZlYzN2ZXBqeThWNXBQUnMvQWVEdFo5YXhLVi95VWJCNGRq?=
 =?utf-8?B?VjZXZ1NGSE0wcGw5dUZ6S3Z5TzBJZE9mTHlKQWMyazZ0NG1mN3o1a3Q1akRF?=
 =?utf-8?B?bTBlUkxicHZubS82eTJXMlpob0RzVkRwd1RtK0pRaHFtdUYzZFh6TWtGT3cx?=
 =?utf-8?B?eHJ2SkFoZkpmWDhNUGdEeWhZL0MyL0psaExjZGc0TTIxRjJZYlhWV0lpdWY0?=
 =?utf-8?B?eitCVElqUEw1M3pGelNRcWllbVQyMVo0TSt4SitqWkJVWUp1YmVXMFgvNzZh?=
 =?utf-8?B?Z21IRTNMOGZvVDFEUTFINzduS2lCRnZkSDlzM2FkSnNtTGtrbGFvVG5mRTlm?=
 =?utf-8?B?Uk82MmJib3ZOeENqaUluaXQzZzVJVktrQWc5V3UyU2FldC9zbmQ1SnZ1UmJv?=
 =?utf-8?B?aFgvOGlMWUNTeU44MVZWaDBlTTBHaHNweTRaN1FqTzN1bXl1RUVKV1NXOE9n?=
 =?utf-8?B?c09KMzZQV0pLK0VjSVFxVU1WUTkrZXg4a09NQkJTOUlnMWgyOUswbkJnbDVh?=
 =?utf-8?B?TGM4UDVaSThkYVlrRk1PVXBCakJ2SVNoamVkc1FxNDRiTEJYUWYvd1N3citE?=
 =?utf-8?B?VVlVZEtUNEkxQzJoc09Jb0toMUF2Mkd0TGZEWDFLV1dEenFNQ2JzOUV0RU81?=
 =?utf-8?B?RmdFKzljNExZNERLTEZ2WXlLajB6NFc5NGcxbnI5eHRzbkpEa09rcng3Zk1s?=
 =?utf-8?B?bGhMbnc3UzVhaEZWMFdIMGMxVjhuSzNPMlliYytOdHJEOTh5Uzh0bHRqNHYr?=
 =?utf-8?B?WlByZDFEblZSbzNTUjhWcDYydlZnaVlNckZ1ZXh0aUhCdjF3YXRuUkdLVDls?=
 =?utf-8?B?cUZTc1p2WEphbDZUSk9JRERzOFFhMjBIZitUYU5jYy9FTXlwV3l2a3dERUJI?=
 =?utf-8?B?ZERldm1vei96M2swZHM1V0xaSXIvV1NwcWVkcC83RlhxQjUwVUxRWVk1Wmkx?=
 =?utf-8?B?RUJlVmVRbm5hTUtISTFXS0hGVU9EL1FOd3pDUmNyZDYyRmlaeEJpUjg2MWpu?=
 =?utf-8?B?NlRhMGVOTEx6a1pJditQLzdDaVhQd28xck9XNXBjWlg2d0FUUHBURDUzWGtQ?=
 =?utf-8?B?ZFhOdGU1Q3dMY1VvMGg0VUZZNFVmR2RWZzlKQWM2SW9SYThEaTdVNDNZTjV6?=
 =?utf-8?B?NEFwRE9xMDM2UlpOdWoyWUxLYmM1L0pFUldxT2NyR0VDQVVqRm83WFNJU2ts?=
 =?utf-8?B?blBjazFyUWpHbEV5K2o5RlI5VlhRNUdZZTRLRHBRUUhsK2NIZ3lyVEhyTkE5?=
 =?utf-8?B?dlY1WmRlRWhLaXhZUmhjNnNnRGZMajBKMFZVRFY2NmRJQzBrVmRmQm5tU2Vn?=
 =?utf-8?B?dkJ4TWFRZk9FUFYzSTNoSklveFk2Q0o2YjhCZ0ZlcHhTUHhVWEc3bUdHYUxu?=
 =?utf-8?B?SG9XWUdEa2ZDamlCczliTDJMZmNpQnBBM3JIdVJVcjRPQnkwaUNxWUNtUGIy?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f3dbfd1-bf32-4c5b-5ad5-08de0a4b91f5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 11:28:02.2212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WGUFYbmc8cFMiiMozqX5PhGF1v/gdhL4Rhw38EBW0IYdqLndBDekmTxxhyJt92oXlHiSnTxWohXdmogR5TQUBDwEctkoz0B8MehxXTYNey0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8323
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



On 10/11/2025 9:38 PM, Michał Winiarski wrote:
> Contiguous PF GGTT VMAs can be scarce after creating VFs.
> Increase the GuC buffer cache size to 8M for PF so that we can fit GuC
> migration data (which currently maxes out at just over 4M) and use the
> cache instead of allocating fresh BOs.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 54 +++++++------------
>  drivers/gpu/drm/xe/xe_guc.c                   |  2 +-
>  2 files changed, 20 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index 50f09994e2854..8b96eff8df93b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -11,7 +11,7 @@
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_migration.h"
>  #include "xe_gt_sriov_printk.h"
> -#include "xe_guc.h"
> +#include "xe_guc_buf.h"
>  #include "xe_guc_ct.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf_migration.h"
> @@ -57,73 +57,57 @@ static int pf_send_guc_query_vf_state_size(struct xe_gt *gt, unsigned int vfid)
>  
>  /* Return: number of state dwords saved or a negative error code on failure */
>  static int pf_send_guc_save_vf_state(struct xe_gt *gt, unsigned int vfid,
> -				     void *buff, size_t size)
> +				     void *dst, size_t size)
>  {
>  	const int ndwords = size / sizeof(u32);
> -	struct xe_tile *tile = gt_to_tile(gt);
> -	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_guc *guc = &gt->uc.guc;
> -	struct xe_bo *bo;
> +	CLASS(xe_guc_buf, buf)(&guc->buf, ndwords);
>  	int ret;
>  
>  	xe_gt_assert(gt, size % sizeof(u32) == 0);
>  	xe_gt_assert(gt, size == ndwords * sizeof(u32));
>  
> -	bo = xe_bo_create_pin_map_novm(xe, tile,
> -				       ALIGN(size, PAGE_SIZE),
> -				       ttm_bo_type_kernel,
> -				       XE_BO_FLAG_SYSTEM |
> -				       XE_BO_FLAG_GGTT |
> -				       XE_BO_FLAG_GGTT_INVALIDATE, false);
> -	if (IS_ERR(bo))
> -		return PTR_ERR(bo);
> +	if (!xe_guc_buf_is_valid(buf))
> +		return -ENOBUFS;
> +
> +	memset(xe_guc_buf_cpu_ptr(buf), 0, size);

is that necessary? GuC will overwrite that anyway

>  
>  	ret = guc_action_vf_save_restore(guc, vfid, GUC_PF_OPCODE_VF_SAVE,
> -					 xe_bo_ggtt_addr(bo), ndwords);
> -	if (!ret)
> +					 xe_guc_buf_flush(buf), ndwords);
> +	if (!ret) {
>  		ret = -ENODATA;
> -	else if (ret > ndwords)
> +	} else if (ret > ndwords) {
>  		ret = -EPROTO;
> -	else if (ret > 0)
> -		xe_map_memcpy_from(xe, buff, &bo->vmap, 0, ret * sizeof(u32));
> +	} else if (ret > 0) {
> +		xe_guc_buf_sync(buf);
> +		memcpy(dst, xe_guc_buf_cpu_ptr(buf), ret * sizeof(u32));

with a small change suggested earlier, this could be just:

		memcpy(dst, xe_guc_buf_sync(buf), ret * sizeof(u32));

> +	}
>  
> -	xe_bo_unpin_map_no_vm(bo);
>  	return ret;
>  }
>  
>  /* Return: number of state dwords restored or a negative error code on failure */
>  static int pf_send_guc_restore_vf_state(struct xe_gt *gt, unsigned int vfid,
> -					const void *buff, size_t size)
> +					const void *src, size_t size)
>  {
>  	const int ndwords = size / sizeof(u32);
> -	struct xe_tile *tile = gt_to_tile(gt);
> -	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_guc *guc = &gt->uc.guc;
> -	struct xe_bo *bo;
> +	CLASS(xe_guc_buf_from_data, buf)(&guc->buf, src, size);
>  	int ret;
>  
>  	xe_gt_assert(gt, size % sizeof(u32) == 0);
>  	xe_gt_assert(gt, size == ndwords * sizeof(u32));
>  
> -	bo = xe_bo_create_pin_map_novm(xe, tile,
> -				       ALIGN(size, PAGE_SIZE),
> -				       ttm_bo_type_kernel,
> -				       XE_BO_FLAG_SYSTEM |
> -				       XE_BO_FLAG_GGTT |
> -				       XE_BO_FLAG_GGTT_INVALIDATE, false);
> -	if (IS_ERR(bo))
> -		return PTR_ERR(bo);
> -
> -	xe_map_memcpy_to(xe, &bo->vmap, 0, buff, size);
> +	if (!xe_guc_buf_is_valid(buf))
> +		return -ENOBUFS;
>  
>  	ret = guc_action_vf_save_restore(guc, vfid, GUC_PF_OPCODE_VF_RESTORE,
> -					 xe_bo_ggtt_addr(bo), ndwords);
> +					 xe_guc_buf_flush(buf), ndwords);
>  	if (!ret)
>  		ret = -ENODATA;
>  	else if (ret > ndwords)
>  		ret = -EPROTO;
>  
> -	xe_bo_unpin_map_no_vm(bo);
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index ccc7c60ae9b77..71ca06d1af62b 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -857,7 +857,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>  	if (ret)
>  		return ret;
>  
> -	ret = xe_guc_buf_cache_init(&guc->buf, SZ_8K);
> +	ret = xe_guc_buf_cache_init(&guc->buf, IS_SRIOV_PF(guc_to_xe(guc)) ? SZ_8M : SZ_8K);

shouldn't we also check for xe_sriov_pf_migration_supported() ?

also, shouldn't we get this SZ_8M somewhere from the PF code?
and maybe PF could (one day) query that somehow from the GuC?


>  	if (ret)
>  		return ret;
>  

