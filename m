Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9FA95D378
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 18:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844E010EC76;
	Fri, 23 Aug 2024 16:31:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FzMn1uA0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D38610EC73;
 Fri, 23 Aug 2024 16:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724430702; x=1755966702;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LQMHyKVEk5Sd65kgPIny1LTWyfVrYiYHslf4MDHVTKk=;
 b=FzMn1uA0Dg0xMVJaVyh0Jzu0mc70EbBZ+9AF/ccDwwVF3VkJVRsae/IP
 WZ+XWwstMs77rQKMSUA6l3V8OyauVa7w+2dUN5DW85CUECb5IiIdHfN6r
 A8VEl2C2BUs9YUItCijXfGGcyqmnCdh9rGhwXo27lC8AJsMmWIjepdjJE
 HgcxYKRC/fhwEKCh7lnqnRCOP/LQwDXPxzbTUjZmrV7TbiiUtFTLByhwV
 hf/vlcqK73AOFPJ9bfTOx2pq4eUBGBcmOPAkrSM+pZf/PEMjr068ZVIb2
 15UbDw484bqw0z7k9xhQuIYAZ3S9Bb6gzltlzCbVDYLf7HodVKZM4Y7Z8 A==;
X-CSE-ConnectionGUID: T1iH1dZcRYCU0Or6krE4KQ==
X-CSE-MsgGUID: 9jG0nlAtS7W75wCPKGr/hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33529906"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="33529906"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 09:31:41 -0700
X-CSE-ConnectionGUID: D1uJMW4OTySh3gMFICLeYw==
X-CSE-MsgGUID: 8DGR6+mMQrOrDeNkplTB0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="62556585"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Aug 2024 09:31:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 09:31:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 09:31:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 09:31:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 09:31:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXRF4XKXV2rhzs0V3JjB4TWUVbPbEsQiSLcPVPTLtMmJg6FGb2CpuAUfyeLZ4O4QOPPP3lDP/Z80NbxvNHcq9upc65aKLPxQ1M9aloNprt4XhJwIAnP7eJEjbALTeROJgwcnV7SwEqFRozj61vLOKswNkz6blA9Yq1Vlf9dWcyaC92/hTsjdBHG2zWR4eXEjAvlTAxhgnRzAqC5sntmgAvKLbFQoeBE1kYeD/C/xtIT8hTODkDkrCetPOKZ6c20vH/ZfT+v/S+fXcgfxkNSDcoYFtbYJfiQoGNsqrPNnYAmcirSCTnU+Y1EHtP+jpIecljs3BiH57dkSr1Wk1nThOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1GFpx2pDW5hR/tY9q1DIIzoFf5cZGjGy54QPf5P2lbw=;
 b=cZTVtC75qbVP4+en8HFUFijCAit20yD/ReSHKQLg9Yd1F7Ep4UF37RVvQmmYqNLlMF05J9KkfNeRzNuOc9j7e7SShNUVhM+VI3uejzZzEx09kvxrtkbZDMC0Mpf7jeFMTF4WWpuxSyyg14XLUbBBfdLmRuXMMbWdDkK7rnivs6NEdnt4G4N6qD5gWGbldUaROIwf+jll2LEhjk/cC/1m6S95b67HMsCoMNVEzohjWgTVNAAikYFiBL+29scJQ3RSzpa8hqkTU2vWTgi33ojei/LEsoljFJLeFgESqvWllSo4aQyUrGFqkC4QsZ1V5Lhl11TrVUeRdKgLTKpvPjHxkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 BL1PR11MB6026.namprd11.prod.outlook.com (2603:10b6:208:391::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.19; Fri, 23 Aug 2024 16:31:35 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%4]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 16:31:35 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Simon Ser
 <contact@emersion.fr>, Matthew Wilcox <willy@infradead.org>, Oded Gabbay
 <ogabbay@kernel.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, James Zhu <James.Zhu@amd.com>, Pekka Paalanen
 <pekka.paalanen@collabora.com>, Emil Velikov <emil.l.velikov@gmail.com>, Alex
 Deucher <alexdeucher@gmail.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v7 1/3] drm: Use XArray instead of IDR for minors
Date: Fri, 23 Aug 2024 18:30:46 +0200
Message-ID: <20240823163048.2676257-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240823163048.2676257-1-michal.winiarski@intel.com>
References: <20240823163048.2676257-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0044.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|BL1PR11MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: 266334bd-516e-44b5-277a-08dcc3910e1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1E3eVRqcS9ra0Jwc2FJeEZZL0Q5bnpXRjREYmo5WER1Z043UlBFVVlveXhP?=
 =?utf-8?B?RnplMFdxYVMwMnYzUjVSQ1FtcktMUktQTHdOWXgybXdSdWRISHNqNXJhelpy?=
 =?utf-8?B?dUxqbml1M1k1RWY2UU9GaGFHY1ZBUERnMjUwS1pIQ3VrREo4ZmVuR1RRSTgz?=
 =?utf-8?B?eXRCVVFpNThwOEgxTWoweTl3Q0k3SlpiWnJWUWx6bUdqZ0NESUF0SjlZOXhi?=
 =?utf-8?B?NTVpblRiVUtXdmFyQ0k1dEpTalNFQ04xWUtrNGpRa0s0bTYzdmZ6VjRRS0VF?=
 =?utf-8?B?UW5DRDNxV096ZEh0d3N3TlFtYWdtME9sZ0ZNVHRmOVBjbHlQTURSWE9Ia2hO?=
 =?utf-8?B?b3VsM3NLZWNoZ1kvaXdSck5mVFdiSU1wYjc3dVMwckt5RmoxOXlITDVidDht?=
 =?utf-8?B?QjEzakV0K3RhVE91NjhTeUJuT3ljRjdHODRaZmhuN0pnVVRwR09HMm01bDJL?=
 =?utf-8?B?WWVBbks5Q2RaWnBlN2l3dE1uZmd3bENIM2FIS2g1WWkvV3B5ekYxcXV5L3lU?=
 =?utf-8?B?S0Z0Y3RHeHVvTmhUWWVjRW84Q3VoUGVZMnFzSnQ4amFWTEhEK2ErRElpVXJx?=
 =?utf-8?B?Umxqd1N0NEFCbE05RzI1YmRobnh2TittZ2ErNHlZWDh6RmhETGIxcGsxRXJx?=
 =?utf-8?B?TTVNVGN1eUJTN0p0LzZ0Y3FkaWE1Myt3OGpLQk9NUGw1QmN6VW9CTjBUTmN5?=
 =?utf-8?B?NVBkckxHQnlBN2pqeUtaUjhNdHllRkxWYXRRWTlrSEZOeVBMcmFLdVlvR1k5?=
 =?utf-8?B?VUJkUDBSbHovVXNiaE14VE9DbUVWY1VTWUtxUHFvZ2p2Vk9IdkE3RHVRck0w?=
 =?utf-8?B?SDk0L3JsN1VPeVIyK2FNT3VvKzhlbTVGZ1BqLzZMRnhFblRWMnBqY0pWSFZt?=
 =?utf-8?B?dkNpeGM0R3dCSEdRemlZMERuaml1L3R0TVBKSjNNYkVlRVdPNDdIN3MwN01v?=
 =?utf-8?B?ZEluQTM3a0I5Zzk5YmowVDNxbnpud0UvN0xrMkFKSlNPWVBNQWhsY3d5YmRo?=
 =?utf-8?B?RXBVYW40bjdUbmc4aUIvZkI3dVc3N0VtRW1WbzhhaWx0eDZONDlPMWlEMnRL?=
 =?utf-8?B?SEZ1WTRKajRLVTJyd1BOb3F6c2hiMWlMYlFSUjd1RzFOUE1LOHZJSFE3bWd1?=
 =?utf-8?B?dEx0KzVDVHBuZU1BaEJkQVkzMHlHZkpSK1V1Um9acHdKUUpqdjBaN1FyTXRk?=
 =?utf-8?B?dnJXN0crRnFKNHpwZkI4VlZoTDdlOTFJTndhbjZDMHh5RTcyTzZaRDFqY1U2?=
 =?utf-8?B?L1QxUXNvTnJTYk9ITjkwWlFEc2cwR0NKMXZXOUN4cjh1aHZpbnNhK3M5WHpM?=
 =?utf-8?B?WE1LaEVXOGxOcTgvY3ZRZnJ4SWdMZzFkeGEzVG1vSm9PLzBXbmlBY0lrTGJN?=
 =?utf-8?B?UEdQZlZhUENUR0FmZlBFeGg2Y1M4QUs3TWtlUnBkNVZvcGJPRzJYRnAvNnFG?=
 =?utf-8?B?SEhmSVZGK3ZseXNGamhvdWFGUTFxV2hRTG1KQS9rMkh5R1k1QSt3eVQ3OFNJ?=
 =?utf-8?B?UkR3QVpaNXRyZFFOSm9UeVZ6VmlSRFZ2Q05qdC9OS1gxQ3JHNGxyTnRLUmh3?=
 =?utf-8?B?VFhHejlXalJLRk9wclhMSjZpNmc5Vk5hekxRSUJNR1gyWGRGV1c0SnlvR3lu?=
 =?utf-8?B?M0U4T3hqR0dJVExHNXJvREdxMWpDeXpjaHd2d2RFYXlvQk5zTTFwVXdPQlV1?=
 =?utf-8?B?NUo1NWlKdW9UVDFuTFIwdnE1TEFuTWM5YlU1Qlp1VFJwSWlyLzhYTFVHN2ZZ?=
 =?utf-8?B?QS90SDVGdjl0V0FQR3BKM2l5ZmwvWGp4YlVvYnFZc2t5RXRWMUc2N1BXMFpN?=
 =?utf-8?B?MEVOaHIyQmNPTzBHWklXZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlNJbDl0YmNqU1NxQWpMMzFmYW9hMXQ4OXdsak5VMUdCVFZPSkQyc05JZXdn?=
 =?utf-8?B?QVhHZURRYVFaT2RPZTM3dXltc2Q5T0EwWDFJMWlyZzVwa2FQL2xlY290YUcx?=
 =?utf-8?B?ZU14cndob3RBaFNOelZiN2FIQ1Zrd1dqTEd1a28rV0J1UzVXMXlnVFhjRlFq?=
 =?utf-8?B?REhCU2tVSXZIQkgybHNVUUZpSDErQzErdkt5Tm1hcEJuME4zRWZkK0piQWZo?=
 =?utf-8?B?S2g0UzB1UjgyMyt0WG9TN0RoY05GWmdHNlgzME5TdFBQdFBIaHRLT1Z0L1hQ?=
 =?utf-8?B?MzNrNjVHcjVJOFlEZERwRzNTY1BOODJVajZvdUFTL01JV3ZGTTNCdDl6eEw1?=
 =?utf-8?B?eWVDaThGMHNJY0dBei9uNlkrRHlrSTNoTWhNbkhNVGJ2WVp6MWRGVnZnakRo?=
 =?utf-8?B?RlltM3hiUTZaWlNVcnVRUGd3YTVkOWNaV0VxRTJUNHZ3T0tsNC9HNDB5OEY5?=
 =?utf-8?B?aDYxbVRKYTF6c3did1FXNjVWVWF4YjhHbFgxcitUdDR1L2lvTG5VMGJva3hq?=
 =?utf-8?B?NGJBc2FmcVd0NEZRc2dkQVdzZUdxcmpYZU1YYkJLZDZBcmlFNFNheWthd3BW?=
 =?utf-8?B?UjB2UG54c2IybkRkc1N1TkxPMnRPZXNLdkJ6aEdiZC9HaGJlRWFtUEVnU2dl?=
 =?utf-8?B?SURnNzZRa3N5ZDk0cDRMS2J0a0pRRlRYajhsbGNRcmYzcGdibmkwVTU0ZWdt?=
 =?utf-8?B?cHNMQ28xczJXeTV4bm1hRzY1S3JzWFlLOGFBaXlpT2RxTlhxc1pOQ1ZGem5Y?=
 =?utf-8?B?bXRGTE1lRUY3TkF6UW43U0FvYUxONkVOVUcxUnVMTGNwN3RBUnpKRHN3b2Z1?=
 =?utf-8?B?MWF2czhwVXhRWHdlUmw4NnhSN0UrWWNDLytMN1ZDOGFXdHJUcWNSR3doekJj?=
 =?utf-8?B?dXNBT3B4L3JTUStINm81Q1JmU0tLRmtuWng1Q2FOSEI0eXc4R1RPWGJ3R21N?=
 =?utf-8?B?TkdiamhhUzJmZTM1UDd2WlZyMllmZzZyRTVUUlY0T1dtZDgvckZOVVJRL3Uw?=
 =?utf-8?B?aUM3M2ZGUVRUeVR4TlBqYTQzNDhYRzVxUFRYZHZQZHJtelBXbzJjc1d4TlBU?=
 =?utf-8?B?SHQzZ3FYT1BtMXNINlVzeDRabmpuTTBIM3RqdDQvQzlCc2QrMThXWTRaaFUx?=
 =?utf-8?B?NWVyU0FIc0pLVlhFdlh3NWJYMGpPbzl1Z3BlM1pMRjdNREFCVENVZU1JL3NN?=
 =?utf-8?B?c3lXaTlwNURYQzk1NjY4ZU1jbGFIVlhlMG10S0VFTFZmSW85YkVFWWYrRGli?=
 =?utf-8?B?RHFkK25LUGg2bDF4NDI2aFlINU40THZEaUNEZURreGZtVDh5ODJ4TDFreGhJ?=
 =?utf-8?B?VFB0RGdKVXY3Yi8yNlgvNkFadi9wczdsc0xRQjlvMUVMaWxmcnRUL0JWRWFE?=
 =?utf-8?B?cWNtRndvL25HMXJhMS9OSzNtMkpDeXYrSXZaL00zLzBNV2RYZzk4RURqM3BM?=
 =?utf-8?B?YzdZM0p6STIwd2ZUMmFqTXFPWVpBdHR0andpQ2MrQW5uRnlseU4wYXRrcnNK?=
 =?utf-8?B?TGdIeUpkcFVTZEkraFJoYlJEZ0svZDJZdWttbGxyLzVCTzJVOFU4OVhsbDFq?=
 =?utf-8?B?QmxseW0yZmhCK1Z0OTRwUXNORERJblA4N2F2TXlxbVhQblplUitXeDNlZ1Vx?=
 =?utf-8?B?WW9zN1VZZVV5VFlNbDg0UVIwekcvOEtZcXhTNmtCdkkva2lsTHA4dmc5OGkr?=
 =?utf-8?B?bTcyUytBTGZHRXRvbFdLdjJ4ZC91dmpXZmJ1L3ZHTmlGWWc1WXMyaVFWc1JI?=
 =?utf-8?B?b0psWjFCMzkrNlZTVWZLUHYydE1sV0ZWOGo0N0ZHY21NakN3VFJBWVJWMDAr?=
 =?utf-8?B?MUVzVFV6WS8yb0h4YzBRQkVRTGwyYmtEUlV4ZWdYU1czL1ptSmhURmJRdlM3?=
 =?utf-8?B?Rm9RVFo4WWdwMTRUeXdtV0ZMUTdvS2htV2VYclVXa29hckZ4Z1FCeHFUZXk1?=
 =?utf-8?B?VDlnRnAvMFo5NHN1TGdsUWNBTWl6bUZtY3ZRQWpMblZhWDFnUkZHS05PanlV?=
 =?utf-8?B?UWlyRG1DOG5IUG9BRDRmZVpReEwyM1Q5akl0dkIrY09HVWZDMzhyZzZhdVl4?=
 =?utf-8?B?c084Ky8yVHNjQm5PQmQ0S2pvWVZKWGNOOENvdWpWS1JFZmI2U2M4NzJkc0J6?=
 =?utf-8?B?UmI5MEJMaTE2cFNqYjdTVmJKdFdCOEhpS2NVTnBuMWxDQWZxQWVxaG90UTE5?=
 =?utf-8?B?ZFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 266334bd-516e-44b5-277a-08dcc3910e1d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 16:31:35.5510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wwzDsNgzmco0SBGXjM1tjct8QpbzCzMnYzMquFgjuH8GMwhPUC2I5ZWGkVhz4Z1S/0p0b7wKSJ5AHAnE3BDNS9rdqJPrc+xPiS9qI1fIFyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6026
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

IDR is deprecated, and since XArray manages its own state with internal
locking, it simplifies the locking on DRM side.
Additionally, don't use the IRQ-safe variant, since operating on drm
minor is not done in IRQ context.

Suggested-by: Matthew Wilcox <willy@infradead.org>
Acked-by: James Zhu <James.Zhu@amd.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/drm_drv.c | 63 ++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 93543071a5008..ae675a588a1df 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -34,6 +34,7 @@
 #include <linux/pseudo_fs.h>
 #include <linux/slab.h>
 #include <linux/srcu.h>
+#include <linux/xarray.h>
 
 #include <drm/drm_accel.h>
 #include <drm/drm_cache.h>
@@ -54,8 +55,7 @@ MODULE_AUTHOR("Gareth Hughes, Leif Delgass, José Fonseca, Jon Smirl");
 MODULE_DESCRIPTION("DRM shared core routines");
 MODULE_LICENSE("GPL and additional rights");
 
-static DEFINE_SPINLOCK(drm_minor_lock);
-static struct idr drm_minors_idr;
+static DEFINE_XARRAY_ALLOC(drm_minors_xa);
 
 /*
  * If the drm core fails to init for whatever reason,
@@ -101,26 +101,23 @@ static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
 static void drm_minor_alloc_release(struct drm_device *dev, void *data)
 {
 	struct drm_minor *minor = data;
-	unsigned long flags;
 
 	WARN_ON(dev != minor->dev);
 
 	put_device(minor->kdev);
 
-	if (minor->type == DRM_MINOR_ACCEL) {
+	if (minor->type == DRM_MINOR_ACCEL)
 		accel_minor_remove(minor->index);
-	} else {
-		spin_lock_irqsave(&drm_minor_lock, flags);
-		idr_remove(&drm_minors_idr, minor->index);
-		spin_unlock_irqrestore(&drm_minor_lock, flags);
-	}
+	else
+		xa_erase(&drm_minors_xa, minor->index);
 }
 
+#define DRM_MINOR_LIMIT(t) ({ typeof(t) _t = (t); XA_LIMIT(64 * _t, 64 * _t + 63); })
+
 static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
-	int r;
+	int index, r;
 
 	minor = drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
 	if (!minor)
@@ -129,24 +126,17 @@ static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
 	minor->type = type;
 	minor->dev = dev;
 
-	idr_preload(GFP_KERNEL);
 	if (type == DRM_MINOR_ACCEL) {
 		r = accel_minor_alloc();
+		index = r;
 	} else {
-		spin_lock_irqsave(&drm_minor_lock, flags);
-		r = idr_alloc(&drm_minors_idr,
-			NULL,
-			64 * type,
-			64 * (type + 1),
-			GFP_NOWAIT);
-		spin_unlock_irqrestore(&drm_minor_lock, flags);
+		r = xa_alloc(&drm_minors_xa, &index, NULL, DRM_MINOR_LIMIT(type), GFP_KERNEL);
 	}
-	idr_preload_end();
 
 	if (r < 0)
 		return r;
 
-	minor->index = r;
+	minor->index = index;
 
 	r = drmm_add_action_or_reset(dev, drm_minor_alloc_release, minor);
 	if (r)
@@ -163,7 +153,7 @@ static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
 static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
+	void *entry;
 	int ret;
 
 	DRM_DEBUG("\n");
@@ -189,9 +179,12 @@ static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
 	if (minor->type == DRM_MINOR_ACCEL) {
 		accel_minor_replace(minor, minor->index);
 	} else {
-		spin_lock_irqsave(&drm_minor_lock, flags);
-		idr_replace(&drm_minors_idr, minor, minor->index);
-		spin_unlock_irqrestore(&drm_minor_lock, flags);
+		entry = xa_store(&drm_minors_xa, minor->index, minor, GFP_KERNEL);
+		if (xa_is_err(entry)) {
+			ret = xa_err(entry);
+			goto err_debugfs;
+		}
+		WARN_ON(entry);
 	}
 
 	DRM_DEBUG("new minor registered %d\n", minor->index);
@@ -205,20 +198,16 @@ static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
 static void drm_minor_unregister(struct drm_device *dev, enum drm_minor_type type)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
 
 	minor = *drm_minor_get_slot(dev, type);
 	if (!minor || !device_is_registered(minor->kdev))
 		return;
 
 	/* replace @minor with NULL so lookups will fail from now on */
-	if (minor->type == DRM_MINOR_ACCEL) {
+	if (minor->type == DRM_MINOR_ACCEL)
 		accel_minor_replace(NULL, minor->index);
-	} else {
-		spin_lock_irqsave(&drm_minor_lock, flags);
-		idr_replace(&drm_minors_idr, NULL, minor->index);
-		spin_unlock_irqrestore(&drm_minor_lock, flags);
-	}
+	else
+		xa_store(&drm_minors_xa, minor->index, NULL, GFP_KERNEL);
 
 	device_del(minor->kdev);
 	dev_set_drvdata(minor->kdev, NULL); /* safety belt */
@@ -237,13 +226,12 @@ static void drm_minor_unregister(struct drm_device *dev, enum drm_minor_type typ
 struct drm_minor *drm_minor_acquire(unsigned int minor_id)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
 
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	minor = idr_find(&drm_minors_idr, minor_id);
+	xa_lock(&drm_minors_xa);
+	minor = xa_load(&drm_minors_xa, minor_id);
 	if (minor)
 		drm_dev_get(minor->dev);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	xa_unlock(&drm_minors_xa);
 
 	if (!minor) {
 		return ERR_PTR(-ENODEV);
@@ -1071,7 +1059,7 @@ static void drm_core_exit(void)
 	unregister_chrdev(DRM_MAJOR, "drm");
 	debugfs_remove(drm_debugfs_root);
 	drm_sysfs_destroy();
-	idr_destroy(&drm_minors_idr);
+	WARN_ON(!xa_empty(&drm_minors_xa));
 	drm_connector_ida_destroy();
 }
 
@@ -1080,7 +1068,6 @@ static int __init drm_core_init(void)
 	int ret;
 
 	drm_connector_ida_init();
-	idr_init(&drm_minors_idr);
 	drm_memcpy_init_early();
 
 	ret = drm_sysfs_init();
-- 
2.46.0

