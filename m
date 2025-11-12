Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E517C5275C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:24:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C880710E732;
	Wed, 12 Nov 2025 13:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F2D9e7Bv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB1910E737;
 Wed, 12 Nov 2025 13:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762953849; x=1794489849;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=pLwtkeTnOPtc9GU27/V1LdyJSavQjA0np2TbxS7a8vs=;
 b=F2D9e7BvlNUbmx8oMSxiIfnLmfpIfS6Wn9MFzYqhey0Orx3RNNREORsT
 lv7PoVNo2E6NKz/vGtSQ5rvHNCJ/YqmjqsDQqSM+OaUhyV0Z9odFWY5HL
 0qSi+CTDapXuY9EJuphROoXvgqa0f+zKpQ2CP3xIr2UHQsfqWYa7AVA+8
 SS404JvIClYN3A6O/YosnET0xF2B/Ze1sDxsufWISPy639214hmdRSxOR
 SZ6p34flguHT9idI9TgpB8l1KUPzVKdXYc6SKE7qPBUgSwIH7l2ek+e/d
 yxBqB/7bWOnEPnUxroowUO3TEWbea6gEcQM0ZmYpII+UMm+ill+ZpF3RA Q==;
X-CSE-ConnectionGUID: u80DpIt+QL2DymCkCEfOGw==
X-CSE-MsgGUID: /xRXyd6MQpq+IoCx/yaobQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="76363942"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="76363942"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:24:08 -0800
X-CSE-ConnectionGUID: qycwqY1LQCW/s7zBSp24Ow==
X-CSE-MsgGUID: HIlr6P3zTcKBNfHsaUPNfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="189069141"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:24:08 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:24:08 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:24:07 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.63) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:24:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjplzVxN5XRnbHNUGygxRI2tLDDHHXWsMQraOHMEL2DISCK/4lD1KklHLerCLGFlb6bJ+DhXuGujzaFcZ4Yd6NZW2aMx/4RTN3D2Fn9HQIV8H0vs6d38dHq/Iq4WbQJ/QGvxVl1tBrXMFX0sbhZADzh453xsJfyulD6fJPSxg9KvYy4bkvSBHEcukgzRAFI1cnzTYsi3ZBITBr7vQ/M3A/23lXZyvtZakcOmGD2+NN6zXe7RgkBVU6w8Iz+CpmSjlFFG+CYTDhSaONCx16nxGD4heJIRNiMfSEvlYvyUCPXsJMCZj8b+84YJ4jYIys4EkxKJ05MXN3+gf1ND6nN6KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eweTK4j2vCsM5uel1Cb1l0IiJwHqQyhAKAUrsmDRGvg=;
 b=SM/tBahhfLDWPF88eexWu4y1yLm7KlJxcRAb538HWUq0wFtDotqzgWUieiRFpyKCIw5QYYfWpa4tCkht43nrphpl7oZ98m/uQ3vk/d6RkaMJ/3pmD8Ojxr5UjfgyzCWAynMHDAeVDhXIFAhopjrYuRPzY6iSbNpuJpxWzg4x/iEICq63CTILjBmNFfwZ2JbxpqraXOMJEYwmyn+5dYz97mgkTljLiR6CWV9IzClEJnYQs/fqvARjF+U9JHxdYFZkt+Bn6dxTcTqR4sX83mhtzk2qERAd75CqyxRbrFSM/qo4npdt25VrTWCrc/tXZ2HJeknahxE5RklmHwxmMSZvdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY5PR11MB6534.namprd11.prod.outlook.com (2603:10b6:930:42::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Wed, 12 Nov 2025 13:24:05 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:24:05 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 18/24] drm/xe/pf: Handle GGTT migration data as part of PF
 control
Date: Wed, 12 Nov 2025 14:22:14 +0100
Message-ID: <20251112132220.516975-19-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112132220.516975-1-michal.winiarski@intel.com>
References: <20251112132220.516975-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0038.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::8) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY5PR11MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bd10e03-ed78-4d64-4c33-08de21eec0eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGh3QmM3eTYzMS9NTDVTL3FYTDRXem1UYWRTZTh6RkNRd1IxZjJ6WnpqYUlO?=
 =?utf-8?B?YTJja1lHV2h2eDdDT0ttTWVrNnRxYkRzSytvaDFUT0lTMFZ2NHBSN1paUUoz?=
 =?utf-8?B?SGhaTWxBNXNKRVZrV3lFQ1ZYWWNUK0s2RWFrMmdqemVKMjFzRE42V1RzWlhZ?=
 =?utf-8?B?aTBPWDV3dWh1S1M3bFlxL1Y5Wjd0TTNxaUdYOWowN05vZmNDRDhEVWpqVUxm?=
 =?utf-8?B?LzhNc2VtOXdZSEpjdHVzbGJKMUE1bkFkbmVTVW5zaFNOdTNrTStyUnVUUHBh?=
 =?utf-8?B?aXJ5SHI4VzhGSXV4bXg3OTFheG5lTWIzVmM2VkExaW0rTGZMYmJoUU9zMWVk?=
 =?utf-8?B?YkxzVXg1dFBjbUtIODJ0diszVUJzRldOd2VNUlE0VU5jZFlTVWwwNGx3WEIz?=
 =?utf-8?B?bVU2OEE2bG1jU1JaUzNoVjJUSXU1T2FDUjZmN0xScUd0THFsdGQvU0ljU0h3?=
 =?utf-8?B?RmJzeFpvb1BSRkZYaW9ZNUoreTdZT040RWNERDljVlNGazNpdmljZTlBbTdk?=
 =?utf-8?B?cGFRb2pNMVpmeDF3MXJPbjlsc1dnRXB2d0pJcTlIbDZnWHRSVUYvNmtSYWNp?=
 =?utf-8?B?VmN4azVweis2OHRoQklWMlVmd1B0WTlsRHMvY04vZFJxL0RPK05xYVRmWEdI?=
 =?utf-8?B?cEpobllHTGNWMWR6dkVmZ3Bidi8zWndrUnNOWjJpeElteGlvZGJrMmc5cS9G?=
 =?utf-8?B?dHp1eDViNkI4QXVwcmpnVXRkbnRmNXhIa3F1L2JkNDZlUTlUQ0NPQXVMQXZE?=
 =?utf-8?B?RWFkQ1k3Z2FJTmxOWVRsRnR0aW42VnVRTEM0YzExNFZSeStYWDFmQXpCSXRi?=
 =?utf-8?B?SnNYL1Z0ZHoyZ2wzTnZsSnhBWm0yMU5ObEhVUFZqT1pacGc4V0tHdGNCR3Bt?=
 =?utf-8?B?OWd2Zi9rdDc2Tk56ZHZET1RjQVZXYnhzQXRmSW1mQnZXWkNGbkw5aDYyeU1w?=
 =?utf-8?B?ajZNM1NRc0N3U0tkU0p2bEJoeDFOQS84YWhRRXROdzUzejNvNnNYcS8yRElZ?=
 =?utf-8?B?Q2dEWFpLMXJZSmFaTVR3Wld2b3ZLL0RUTXdKelRJWUdLUGxwRys4c3lUbUM0?=
 =?utf-8?B?b1lwUFRVYlZ4emg2NWZsdEZjL1pxREs3ZlFpckkwNGkydENoWDd1b2RMblNv?=
 =?utf-8?B?YWRDWUxmZ0ZZcHUyWmgvREtKVE1McHJGUE03R0pGZU1UcFVxSExzQ1kydFgv?=
 =?utf-8?B?QUVOYTdTOWQ3MktiSHV5RFRRSExzTW9YVURDYUN5MkFDUlJoelFjT24vNGM3?=
 =?utf-8?B?S0RrZWlYK3pNYlladG9xWlA0MDNtcW45aSs5aDJJNjZtQk0zV2MrNXZxdisx?=
 =?utf-8?B?YjdNWkdVRnJ3UFFlWHVoOWpsQXl0VUVqRUxUR09Wd1ZmdW9UelhZRitMYUZE?=
 =?utf-8?B?SkV3emxuQ2l6eXloOG1la2U1Z0JjSUtGZFVaMmVDYk1HbjFaOG5JRkc4RkdS?=
 =?utf-8?B?em1QVEZJWHNKUHQ5QytNV1RQV0JqekVjMWhVOXZwZ2dLNm5jOUp0UkRVR1J2?=
 =?utf-8?B?Y2NwL3cvakFLN2k5L2dqVnB5SitvSE56dGlVeXlZc3ZXK0tEZzhUSFM2a09p?=
 =?utf-8?B?ZFZnMWNNcXh5ZythVncrL0RLdGVPSlJORVNKYk5iN2VmTGNGRkpoOTRmQ29L?=
 =?utf-8?B?ZnZvd2F2UlBNZjlKOHkrSHNvUzVDOG82SnJhUGZhanE2TUpPeTg5aGJuSGRz?=
 =?utf-8?B?eFVkSUJJWmltemlIaFVjc1kxQ2tSZWNpSjdXbnloRGVkZjJUdnNQQ0lldU9P?=
 =?utf-8?B?Z1IxaGZQRGtYK3ZSZG1XNE1pcmZUVGVzem1FNThmN1NUWlFTVVJzY09Vd3pk?=
 =?utf-8?B?a094eUNjWnhMRlloVnR5RXE0bitNQ1Z4ejlVYWJ3VjIvZm5HdWJEWXNjYytB?=
 =?utf-8?B?Snlybk9hMFlsdlpaZWdmUEppMlRzeDl1ZHVqNXdTQUdhbEw5MnNmTWt4QktG?=
 =?utf-8?Q?mXz1R5Jq+sfjLSTkjrEOlBe2jRVUK65C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTJSWkRnV3lLT1h3SS9qWEtMVDhFWG1DK082WFhDRDAxaTRleDM2cWJnM2NB?=
 =?utf-8?B?STZuYVAvVWFRekRTSGl5U2FjVkxpM2diNHFtSzV1WTF1eUx6Q0wrcnVpVENY?=
 =?utf-8?B?QWZObys3ejM0czFXSnY1SXg4N2tnbTlTdmNiY21TeG9QTzZObk5hU2dNNjA4?=
 =?utf-8?B?YXFqbXV2TXhqMU4ybkNob1REZjV4cUZvaW9UczlwcGgwd29SL1ZXR3d1aWhy?=
 =?utf-8?B?ZU1VV2dOZHhrSnZTcEVtakJYZHVGWFRUVjAwSW11bFJzeFlKWHNrNFE0QWt6?=
 =?utf-8?B?Mzk1NGhCZ2V3dzhJMThZVmtkdjE3MmFNb3U5R0lZZTNRSWVHbVJ5Z050VExT?=
 =?utf-8?B?bkpyZkFXKzFnTVR3MlQ5RVdXZ3ZXUEQ2dXpZcTIreU5zb1ZXbmZjQlpxZ0dn?=
 =?utf-8?B?SDhwUzhZS1VqdmJweFVuRmd4dk5qUmVOelZ0YnBjM1M3MTJ3bFA0Z3MwNVJ4?=
 =?utf-8?B?U3c0RGtpQkQzNTcrWUNiZTBBRTRiRlJsSUdKYVpSUkFGY2RIK3pLMllpbkk3?=
 =?utf-8?B?QVdXbWU4bXhEN2JPTmlhWUF6eEtmNHdDZVdTMHBDMUhQZUZvMWlHdlZKWlo3?=
 =?utf-8?B?SG1zNVBCRjRMeGdiaG5FcFI4bEpMWjExZUJTOHVVblFjQkxRMVlxbHA0SmJ6?=
 =?utf-8?B?VUxlbUpPK0syUEFRS1NDSHdBSElWdzZqcVg4ZUliUEpRb2ZPdFlFc3dSRmR5?=
 =?utf-8?B?TU9iVVgzODA3TVFWNHdGVDJCdG9IWkVvdGoxVmcya0srSVhYYmZxZUVkRHdG?=
 =?utf-8?B?bCsreXEzOCtZOUY3aDVHMXFDbDZuc09GQVNDYVFveVJPZWJ1ZUJWM3hHVzVD?=
 =?utf-8?B?VWwzVzkwZmdXcDFvZ1krWHVFbTdnWXBwb29lblk2cGcxQzdtaFRTYS9LZ3Fa?=
 =?utf-8?B?ZUhMQTkrcWdVQVBVbldvQ3BEcWFRTk91YUtPQ0NweTFZU2kxT3A5SHFKTkdG?=
 =?utf-8?B?dnR3K2YxVzdtZTBxZDIrYkZ1Sno5dk1VTThnU3F3TXUrdU1hM3QxREpWNkVi?=
 =?utf-8?B?U240YXR2NThWUGJoYVpXczZuQ2xiT0hrY3k1WmtBTjhpQnlGdC9BTlJRTitI?=
 =?utf-8?B?NU1Dc0REMW85Tmx5U1ZyaEVJVXNyYXNNT2F5aTU2UUtnbURCUHRnN09JMURm?=
 =?utf-8?B?T2tVWVdWTEFMbEl3eWdrYU1ZejRTaittVllwRWVkTm5tbHk0UjN2MFd0VlFp?=
 =?utf-8?B?dTdkcVNoeXlKb3VFTERSbFZvQ0loazlmb1hEMG40T0wwNTU4U2kvYUNJWHlH?=
 =?utf-8?B?aFFxZDUwY1FVWERpUGMwVW5oMExaV2R5akwrWnFiZFRBdkwyeHhQU2IxRUkr?=
 =?utf-8?B?cnA2NEp5SEgzK2JNRXFnTGVlNTZYU3hYUDB0TXVmTWNPNmd3bW1oa3FUdWlJ?=
 =?utf-8?B?UmlWZm1oNFBUMnRLNUluU203d3RPNkZFV1lrYWtMYThtcVlOdzVYcytvejBw?=
 =?utf-8?B?YnMvckVGTlB5Rm5VQWVXRTNqTzVxMEFPL2JUWjlMS1pzODkrL0RQMVZoWndQ?=
 =?utf-8?B?c2xLeWZYWFNaaUl3T0VqVDNKaFN4TW8wc3hVTjZRbEZ6ZHppNjhMaGwwbm5w?=
 =?utf-8?B?R1BKNWJ6QWE5cjFwQVllS2JVeE1la0MwemN3ZlRUL00zMnYxRk9aOTV6ZHhm?=
 =?utf-8?B?eUpIdDNkTUU5OXV0VG9aQmhjTy9SZU02c2NPRUFXTDRKUStMcWZ3S3lqL0ZC?=
 =?utf-8?B?NVJFS1hXMHVWeDBPVUZjYjEyRVp5SFdBR3FPRlQ2a3FyaEMxRjFycTRTUWNz?=
 =?utf-8?B?T2NaR2dnNm9Oa3Q0UGZ4UmlETm03czlOYWJ2WERsQm1sZXhiQjhkdVFobm5j?=
 =?utf-8?B?MDVFOFZSUEptUmRObVFxR2IyMzdGZGVyZUQ5OTRXZE9aNnhGZytVNG1jZ3NQ?=
 =?utf-8?B?R1A2WDlyL2VWNXhKaU5WVk5OU1FlS1ZIckZJUjgzZjBYYml3REJKckY3WDM5?=
 =?utf-8?B?TnpSMXJ0TnZydHZzaU8yWjh0WnZRZ3FYMGFCay9ESk40RnZvRmc4QnA2RXRU?=
 =?utf-8?B?MER2RVpzNkx3QzhiZUpsZkxVV2llbHluaWV1a2QzblZuNWZkUjA5bWtWZ2FC?=
 =?utf-8?B?WEM3aUNROHU0NFppQVV6VVpOaFBETUxGUnhpWWp1UWRnSXJHMDFKa01xdUd2?=
 =?utf-8?B?Zkp2L0hFMWNHUlR3TyttcnVWNkFIWXdOK1ovUHBHdzFoL1VWeTZVcDVxaVcw?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd10e03-ed78-4d64-4c33-08de21eec0eb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:24:05.6997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51Wp8U/WBM6MslXmgcC8GlhmrIiPipm//MxvVQCtto8/bUbQOtVYR0mQlKy7SRtduJVczNMw2mLOy5BWMqwSIlR2WJyJaO6VGBEy8jcEiT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6534
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

Connect the helpers to allow save and restore of GGTT migration data in
stop_copy / resume device state.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  15 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 112 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   3 +
 3 files changed, 130 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 7527aed8c7c57..16524bc18b1b2 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -868,6 +868,18 @@ static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
 		return -EAGAIN;
 	}
 
+	if (xe_gt_sriov_pf_migration_save_data_pending(gt, vfid,
+						       XE_SRIOV_PACKET_TYPE_GGTT)) {
+		ret = xe_gt_sriov_pf_migration_ggtt_save(gt, vfid);
+		if (ret)
+			return ret;
+
+		xe_gt_sriov_pf_migration_save_data_complete(gt, vfid,
+							    XE_SRIOV_PACKET_TYPE_GGTT);
+
+		return -EAGAIN;
+	}
+
 	return 0;
 }
 
@@ -1097,6 +1109,9 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
 	int ret = 0;
 
 	switch (data->hdr.type) {
+	case XE_SRIOV_PACKET_TYPE_GGTT:
+		ret = xe_gt_sriov_pf_migration_ggtt_restore(gt, vfid, data);
+		break;
 	case XE_SRIOV_PACKET_TYPE_GUC:
 		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
 		break;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index e3d4423df4237..9143ab328e5bb 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -7,6 +7,9 @@
 
 #include "abi/guc_actions_sriov_abi.h"
 #include "xe_bo.h"
+#include "xe_ggtt.h"
+#include "xe_gt.h"
+#include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_migration.h"
@@ -42,6 +45,105 @@ static void pf_dump_mig_data(struct xe_gt *gt, unsigned int vfid,
 	}
 }
 
+static ssize_t pf_migration_ggtt_size(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!xe_gt_is_main_type(gt))
+		return 0;
+
+	return xe_gt_sriov_pf_config_ggtt_save(gt, vfid, NULL, 0);
+}
+
+static int pf_save_vf_ggtt_mig_data(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_sriov_packet *data;
+	size_t size;
+	int ret;
+
+	size = pf_migration_ggtt_size(gt, vfid);
+	xe_gt_assert(gt, size);
+
+	data = xe_sriov_packet_alloc(gt_to_xe(gt));
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_packet_init(data, gt->tile->id, gt->info.id,
+				   XE_SRIOV_PACKET_TYPE_GGTT, 0, size);
+	if (ret)
+		goto fail;
+
+	ret = xe_gt_sriov_pf_config_ggtt_save(gt, vfid, data->vaddr, size);
+	if (ret)
+		goto fail;
+
+	pf_dump_mig_data(gt, vfid, data, "GGTT data save");
+
+	ret = xe_gt_sriov_pf_migration_save_produce(gt, vfid, data);
+	if (ret)
+		goto fail;
+
+	return 0;
+
+fail:
+	xe_sriov_packet_free(data);
+	xe_gt_sriov_err(gt, "Failed to save VF%u GGTT data (%pe)\n", vfid, ERR_PTR(ret));
+	return ret;
+}
+
+static int pf_restore_vf_ggtt_mig_data(struct xe_gt *gt, unsigned int vfid,
+				       struct xe_sriov_packet *data)
+{
+	int ret;
+
+	pf_dump_mig_data(gt, vfid, data, "GGTT data restore");
+
+	ret = xe_gt_sriov_pf_config_ggtt_restore(gt, vfid, data->vaddr, data->hdr.size);
+	if (ret) {
+		xe_gt_sriov_err(gt, "Failed to restore VF%u GGTT data (%pe)\n",
+				vfid, ERR_PTR(ret));
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_ggtt_save() - Save VF GGTT migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_ggtt_save(struct xe_gt *gt, unsigned int vfid)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_save_vf_ggtt_mig_data(gt, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_ggtt_restore() - Restore VF GGTT migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ * @data: the &xe_sriov_packet containing migration data
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_packet *data)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_restore_vf_ggtt_mig_data(gt, vfid, data);
+}
+
 /* Return: number of dwords saved/restored/required or a negative error code on failure */
 static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
 				      u64 addr, u32 ndwords)
@@ -281,6 +383,13 @@ ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
 		size += sizeof(struct xe_sriov_packet_hdr);
 	total += size;
 
+	size = pf_migration_ggtt_size(gt, vfid);
+	if (size < 0)
+		return size;
+	if (size > 0)
+		size += sizeof(struct xe_sriov_packet_hdr);
+	total += size;
+
 	return total;
 }
 
@@ -346,6 +455,9 @@ void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
 
 	xe_gt_assert(gt, pf_migration_guc_size(gt, vfid) > 0);
 	pf_migration_save_data_todo(gt, vfid, XE_SRIOV_PACKET_TYPE_GUC);
+
+	if (pf_migration_ggtt_size(gt, vfid) > 0)
+		pf_migration_save_data_todo(gt, vfid, XE_SRIOV_PACKET_TYPE_GGTT);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 1cba651b521fe..2d221b6409b33 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -19,6 +19,9 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
 int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
 					 struct xe_sriov_packet *data);
+int xe_gt_sriov_pf_migration_ggtt_save(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_packet *data);
 
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
 
-- 
2.51.2

