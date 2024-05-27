Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7F08CFDA0
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 11:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C726B10E497;
	Mon, 27 May 2024 09:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TS3Z14qv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 363EC10E3EA;
 Mon, 27 May 2024 09:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716803967; x=1748339967;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=CGbhrPfskb8o2gWF+aZRjVvSAf9aWyQzxwILAE20wsU=;
 b=TS3Z14qvDXF5BhW43ixTQAWLaV2nOGagYIYr8vP7w9vQQBJ5iH3+KnjL
 abXxPg5ZEJacb7oYUYMrCITjRpilb3sjL63CCZJoCqbT12tyFmtasdfNE
 yCkeRKMufK1j7OvpdNVHiBaVaH8j7xSDkbezFmwjrikDr8s2Q46FJHbUu
 zKGCLmANrIA1yXhPnzTmhMmUfyhZl+ugoIIz0sXMFTV2urBdJcXExuJ4J
 KHqBWrRqukjRKhQ784yv/jhUItKI/gde7hLLES6tKa/upOEzg6NOT7zJ9
 LH37B4aRq1Xcdq3jC+EuMgU7hSbu0TVbNN7IP4PCm3ZBXndBuzt6kojeH Q==;
X-CSE-ConnectionGUID: jGgdKVjGRGKFcsZqsATtKA==
X-CSE-MsgGUID: qV+upjIBRfm6GbqyIcQzHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="23679320"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="23679320"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 02:59:26 -0700
X-CSE-ConnectionGUID: Y7RpWcyJSlOd7T9x18wbGg==
X-CSE-MsgGUID: HGQX98MJR3ef7C9V+4q98g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="65935114"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 May 2024 02:59:26 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 27 May 2024 02:59:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 27 May 2024 02:59:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 27 May 2024 02:59:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbj7IzhI4JmAMSJAgNMRSJO4O6WuWbXwi8vJ7oPvP+r6CzWL3xyqDeYUhsIFzfHLZwfJsldubpCrzfm8XIVzgV6Elo/6PONzaxgs12pq4Gj+AVRJg5Zu33a8sH54zQ/Q3aHZvmbfsS3IsI/wCG0qbOfuZ390E/Tq6YsKTiLOTepyOCZeeTAhTrihb4KYc87ZTSBnIdv1PdPTlTZw8iUYRIkpQ0by79w3XspM9VWww5NIY1Fdp9GrdvHn73RpDGd/TgS0JrQTIIqk4Y5rk1M8MShmXf+kpYkLXbXFlAQR3Xg3Mn0kWsl2LVv+mWAvADQSzzOadnrSVnA0Uo/+QUfFnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGbhrPfskb8o2gWF+aZRjVvSAf9aWyQzxwILAE20wsU=;
 b=mLiGtXXnIOc61tuFOMZpNq7WAsAJtrjg8Zk0nBpJ7VjPkJi0My3Z4OcD2RT3Hqu1PbQxvqdES8ONcOdrT2hqVViodgpsZzb23anw3nUUeVjxSl0qsoLCOWJHH0hJcJ2ebbcYlHSL7nhLeZMO63H4XklRS7ENegaJe3abgDZqz9CnTwjRqqKc+ihIurxPPXZfmHdK9iIt9hiZ+Uho9nMcnj185xsG/vWf+NUtKe8r21HOrbLidOyLMc8is5h/zuY/s01jxN6ipjLqG2T4Rurcvpe9Xq637g2x/tJM9b7WBMWDwJbpXXHVhdaJGcMozKOJ4Cp2XMVdQl6v/iDovOTsBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 MW3PR11MB4666.namprd11.prod.outlook.com (2603:10b6:303:56::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.22; Mon, 27 May 2024 09:59:23 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.7611.025; Mon, 27 May 2024
 09:59:23 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Manna, Animesh" <animesh.manna@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: Re: [PATCH v6 0/6] Link off between frames for edp
Thread-Topic: [PATCH v6 0/6] Link off between frames for edp
Thread-Index: AQHasBHhIuezUbYuSEyFR+VpfVUNzbGq2PQA
Date: Mon, 27 May 2024 09:59:23 +0000
Message-ID: <709e66334c10d8ce0b8c036058b91cbd8791a4ea.camel@intel.com>
References: <20240527082636.1519057-1-animesh.manna@intel.com>
In-Reply-To: <20240527082636.1519057-1-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|MW3PR11MB4666:EE_
x-ms-office365-filtering-correlation-id: 23b32a83-49dc-4856-b413-08dc7e33af88
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?WTRucnQxZU4ycldQVmNsL3I0QjM4amxWaWJWci85RDd5WHo2T29QcEpwdlJY?=
 =?utf-8?B?cDBXYUxmaDVLdCtBRmZaUmtCVTdJaEdrRmVJQUM1R3l3YXJzUi9iOXh5MVFW?=
 =?utf-8?B?N1VNMDY5L09rM21jME5qVzIyUnhaRUcxbW1rdkRmb0ZoSFJtSzZSeS9kQ21C?=
 =?utf-8?B?K1Q3a3NWY3VPWmN4M2l2bmJOb1Z2VW5PaCtBQjRrU010c0ZsQVdqYjBKSWZW?=
 =?utf-8?B?QW1XREp1ZmhoN1FZN0JuTjVNQjIzT2cwaWs1Y21wVDZBRVhQR0oyRFNZQjV6?=
 =?utf-8?B?ZmtjeDFiZGhCNzlKQWhmQWcxd2NGR2V2dnlCTDI2RitlelkyMzd2cWFSQ2gr?=
 =?utf-8?B?Sk9LWnBHWnU1OXhnbFJ2bUdrQ2NwT0Z5Y3JhRXA2MG03TW9rM2gwNGc5RDdY?=
 =?utf-8?B?Yjhwc3AwTUpUZnRXclROL243ZStjOHVLYTRKZlN4T09KdHpTZ3M5b2pCRzJi?=
 =?utf-8?B?bDIxcVBiaGRDWjdSM3ZocTRBaGJYSVBpRk9KTFRjdTZJeXY3WHRJRWJ6bUZN?=
 =?utf-8?B?UkkvNDFpVjYxMkJoMys5U0d2NVdiV25TQ0VOUXhoelBSbU1wUzlZSGErQnZO?=
 =?utf-8?B?eGllWUR1WmlFNEYvNE9ERXVaMWZ2OXhORkxEUmtDaFNuTHlqN2NWcksvOXBK?=
 =?utf-8?B?cDFRT2JXRXpZNW16bHcrREllbjV3RTVnRnlLVm0yYk51bmJJWXhqMGVUbHlH?=
 =?utf-8?B?S1dVUnB2K2UvYXVucDFsMGdxanpvNVc4SHdsbktZNjdpcXlkdUtIRE0wYk9U?=
 =?utf-8?B?VVVxNXh6RGRZekgvWmdlekh0elRxZ2xhOUwwRnI0bHd6UWxidGNXMUpBWSsy?=
 =?utf-8?B?R0ppT3ZGeHozWW4rWE4zb0xxdTB1KzVZVHJSdXVLRUNHb25yY0RTUy9PU0VN?=
 =?utf-8?B?dzZ1c1BuTUFYMTFyOThHaUEzeUdBalZhTzRpeGY2ZTQxbTR1NEFjSUFNZ0NI?=
 =?utf-8?B?NEtVY1R3cUR3aHBBb3lOc2o1dEowb204OFMzclVVRGVLM3hpMFU1SitiWXps?=
 =?utf-8?B?UGRUM2xQdEJ4RzVIRFF0Z3k2V2ZDdjkzam5zZS93a2ZNQ3lnZjNCcWpLZU5N?=
 =?utf-8?B?NXdta1JDRjBKZmpoRmxuK2NrR3NmcTdCck1BeUkxd3VIdjh6QS9WVXFFZ0Fy?=
 =?utf-8?B?NFNBczFvR0xWelR2VVl5R2RmUTVEYmdORlBzZzg1bFJWdzdSQVNPajhYWGVa?=
 =?utf-8?B?OXl1VkNTdnhGNkF2and5U2xaaUxWQlJKNmwyV1BBYjNlT0p6TmptZVg4UlNi?=
 =?utf-8?B?VjdUdkdIQ0VSM0VoTUJHRVZpUkdxdEUzclQ5ditCUkdSd2tvNnUrbFlVTHNL?=
 =?utf-8?B?OVplT3RjN3J5Y1Uvc0s1Z3o3SElvNnR1T2FybkdYeDl5cjJyNXhOZ1NHUDkv?=
 =?utf-8?B?TGRwcE0waHZ6QVJvVWg1eFVKTDRRZVJ4UjJuLzJGYjcyZDdsaitMU0EyS1Az?=
 =?utf-8?B?UjU3WHUxalErS1FnaHNsT0ZJY0poOUNxaFA2K1U1WHhVRC91bFUrbkVRb3JX?=
 =?utf-8?B?U0dxWUxuU0FIeElONEx6Q1JEMzlVNFpWTEVTcmpFTjh5OEtjeERSR0NJM0Ny?=
 =?utf-8?B?bWpLWjFBMkRNK1VYNC9ITzFQZWs4S25KekJtVHRYYkYvNStmMzZLVUplUUxR?=
 =?utf-8?B?Zm5TZW9uTTdDREk5QXU4aXdBWUxHMnduT094Q1QwcFp5dGZFOExYNU9UN2Qw?=
 =?utf-8?B?ZG8rNVB4SFB2RTZ2QnlsL3VtQWxQNEhZcjQ0eU14eEQ2bWdnak5hdmNYcVg0?=
 =?utf-8?B?M21IN0FCdVMvTG0yRzZpcUVGL3dlWTBxZlF1b1FnQXFpT2ZDSGhjcWtkMVVT?=
 =?utf-8?B?ZkpHMXMzQm1kbWM1blRaQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M240dldCVlI2RE0rNmVCcTJMcW1QMnZ3Y1ZGVFltUEs2NGt1TTVLWGNWRGZO?=
 =?utf-8?B?TzBET3c1YzVXMjlLWmFRclBrR0grZUx2OTN3U3NHV0hqZzBUNlYyOWdQN2pO?=
 =?utf-8?B?eWx6aUc5SnRrNU12K3czenE1S2ZLNjROVmdNNFFHaXA2c0JESC9IWnBwb2xk?=
 =?utf-8?B?a0lKQ3Qwd1YxZU04VEpXYnB3RG5MVnRzeTNGSGlkYVAvSnRuT2piRHhMUlBS?=
 =?utf-8?B?aUhmMW1IeC9UZnAxOEN1N0ZuM1dONytacWpGWjlXNnh4aFFaVS9kQVRVY2w0?=
 =?utf-8?B?QlM2M2VoUjVBdEFvYVEyMlB6MG1nbXIrSldqREtiNWI4WU5OUThhVUdWOCtz?=
 =?utf-8?B?SGdqWHVubk1yYTVpdzBvNFg1SUEwSkIrMnQvODEySWFvTFl0YjV3RSttQVVG?=
 =?utf-8?B?V0VpQzYzYU9NeHVnQThNZlphNTcxVkh4V2M4VHRNcXdKYk1hZWJ3RnhuRDlD?=
 =?utf-8?B?OTUxK1NnQ0xnNjNWemlmY3JZL1ExUzVuWUw4cUFqaDJmb0lxNU5sRTVlL1V0?=
 =?utf-8?B?SUFHWXU2c0NSaUtPQU9kdHUxWXBoWFFRbEVwL3V1d2s4UUlhZHY4b2hKQ0FK?=
 =?utf-8?B?TXd2SVNyUzV6OEUveG45VVpPMjJtWWVGaUJOdVo1SGJmWnlaVGxwU0dQdDFM?=
 =?utf-8?B?UE5QaUxRNVBMaG11bS9SV093UngxcU9FSmlMSkRBUkJKUEVOeUZQSXVSazJl?=
 =?utf-8?B?Vlk1ZGpHYlhxNmFIQUJnaUpmWVJMdGdhWmpiS2VVUmYveUlmc3RXMG85bXF5?=
 =?utf-8?B?Nml3b2tOYmNQL0J6amk3MHJ5aFRHVk5kS0tuL21FMnlZWlJvZDBUNmFKOGRu?=
 =?utf-8?B?dm5oMUhLNnNsZWVReXVhRjkyS0hBL1lzL2x2cDkwSituWThIMVhKVWdBWWZ6?=
 =?utf-8?B?b2JzdUttS3NGdUN6UWR5S1h5WEUxc3YvUzFUdlNTQUJpVmg1cmlidStwT1Nt?=
 =?utf-8?B?MnFpVWtETEVpZm9wdTN3YjNaTkFyYTJIbG53cUY3c3Y5a2tlNHI1QkJ4RmZD?=
 =?utf-8?B?bzdYMzltM1V6VWlmSy93cS9UQnk2VE15dTdDUkNaYXFDTmd3TlhtQ3VFTjh2?=
 =?utf-8?B?Ykxod2duRlUzY3VDc1o4OXR3VEpweU9FSEpDdzBFREF4QW9hbVlXdTdENE9F?=
 =?utf-8?B?emJwN3dHUk1kTFBMOENnK1kzaXJ5enJBcmpVUEJ1eHVQQkQ4aVNHR2ZVVUhL?=
 =?utf-8?B?Qm53Zjc2RS9UQjJCQWdYQXF0eUlLUi9scklWM2Zibno2QWxvempoeGJqWnRq?=
 =?utf-8?B?SytmSWg2SkowZ25kL3BmYlJXaStuTXBJeVhzSEZkRDZoQS9nbVU2RUJJQzBw?=
 =?utf-8?B?dmhuTnIrbERKVzU4U1RycGdHdTJxenl5dG81VVBrM21td2o0VnhIanVMTDVw?=
 =?utf-8?B?a1BIWkpQVTBleUFwUDVWYXZWaXRZYW1ZT2tGUEtPdEhTY0doR0hNeWxsMGhS?=
 =?utf-8?B?elg5anBnTHhVMlcvd1FDVzBYOXQ3RWdCZXJnSHlUUCtYYU8wWmFMUHZLKy9l?=
 =?utf-8?B?RCs4ZEVpVlZRdmhJbWRSekhDRGRvcSt1T2E0Rmh2a3NXY3ZYUnNmYW9qRVJN?=
 =?utf-8?B?QzI3cjVrV0JWaEExbU5MOU5EL09BSUc0ME9DRjZhT0dOSGdMWWRqWHAyMnFQ?=
 =?utf-8?B?MDRYMTFWYmV4NlhWMGpIN2VMb1VyQkpRUFV1ejVDREpXanJqajlSeTkyRytV?=
 =?utf-8?B?MXRYVnptQnZLaS94c2xMeXpoS0NtZ0hlb1dNNWRVVW5ubEh6Z3ZwS1cxUGts?=
 =?utf-8?B?cGJudURRTzNod1pBbjFVOE9FRWdWTkJ4Zm54NFhNQWllZTVkWTlVbkRIc0Nu?=
 =?utf-8?B?N3JYbjZDZ2t1SDFidEdCUEJ3eHhpVlF4MlBZN0xibzQ4ZSttMlZOZ2p4MjZP?=
 =?utf-8?B?TzFvemZlcXFPZDQ5TmV0Sjk0dkdyckJ6Sm14UUJqU2diQ0pWc1ZvcCtidEtB?=
 =?utf-8?B?UGVvbHdpbDBTbmxsc3hIaW9Oa1R5c3AzajJHTjJ4dmhUS2FQUDhxcDBEN1VF?=
 =?utf-8?B?U0hpYXBuYUIra200QzdQWWpVNzBjSTVaMzBJMnZ5SGJPUTRzMG10MnR3L2Vs?=
 =?utf-8?B?VHhLTk8vYTZodHRFK1NpVTRNZmZLVTNOYm16a0J3bndhcUloZm01SUZZQ2lK?=
 =?utf-8?B?eXpCNW1lbGZqcUYyc3ptQ1oxM3ZJRzFWZmRVZXNTcG5iOUFYVlJPTTQ4Slhu?=
 =?utf-8?B?cmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <066F7714E50DCF44A8FE4995C861357B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b32a83-49dc-4856-b413-08dc7e33af88
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2024 09:59:23.2830 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ofxR0is5DoddKbKkhYrgbCjcDh2rB3D1Ule9oyzHLlF+LiZPKXVVVAXtPbn/+gmw+/lBKfW5eQZXEApZqJlUKrqKeTO6FoAk/3mGAuguxyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4666
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

T24gTW9uLCAyMDI0LTA1LTI3IGF0IDEzOjU2ICswNTMwLCBBbmltZXNoIE1hbm5hIHdyb3RlOg0K
PiBMaW5rIE9mZiBCZXR3ZWVuIEFjdGl2ZSBGcmFtZXMgKExPQkYpIGFsbG93cyBhbiBlRFAgbGlu
ayB0byBiZSB0dXJuZWQNCj4gT2ZmIGFuZCBPbg0KPiBkdXJuaW5nIGxvbmcgVkJMQU5LIGR1cmF0
aW9ucyB3aXRob3V0IGVuYWJsaW5nIGFueSBvZiB0aGUgUFNSL1BTUjIvUFINCj4gbW9kZXMgb2Yg
b3BlcmF0aW9uLg0KPiANCj4gQnNwZWM6IDcxNDc3DQo+IA0KPiBOb3RlOiBMb2JmIG5lZWQgdG8g
YmUgZW5hYmxlZCBhZGFwdGl2ZSBzeW5jIGZpeGVkIHJlZnJlc2ggbW9kZQ0KPiB3aGVyZSB2bWlu
ID0gdm1heCA9IGZsaXBsaW5lLCB3aGljaCB3aWxsIGFyaXNlIGFmdGVyIGNtbXIgZmVhdHVyZQ0K
PiBlbmFibGVtZW50LiBDdXJyZW50bHkgZXhpc3RpbmcgY29kZSByZWZhY3RvcmVkIGFuZCBtYWtl
IGNvbXB1dGUtDQo+IGNvbmZpZygpDQo+IGFuZCBlbmFibGluZyBmdW5jdGlvbiByZWFkeS4gV2ls
bCBhZGQgZW5hYmxpbmcgc2VxdWVuY2UgaW4gYSBzZXBhcmF0ZQ0KPiBwYXRjaC4NCg0KRm9yIHRo
ZSB3aG9sZSBzZXQ6DQoNClJldmlld2VkLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2Fu
ZGVyQGludGVsLmNvbT4NCg0KQ291cGxlIG9mIHBvaW50cyB0aGF0IG5lZWRzIHNvbWUgYXR0ZW50
aW9uIGxhdGVyOg0KDQpQU1IgY29kZSBzaG91bGQgbW92ZSB0byB1c2UgaW50ZWxfYWxwbV9hdXhf
d2FrZV9zdXBwb3J0ZWQgYW5kDQppbnRlbF9hbHBtX2F1eF9sZXNzX3dha2Vfc3VwcG9ydGVkIHJh
dGhlciB0aGFuIHJlYWQNCkRQX1JFQ0VJVkVSX0FMUE1fQ0FQIGFnYWluLiBJIHdpbGwgcHJvYmFi
bHkgdGFrZSBjYXJlIG9mIHRoaXMgaW4gbXkNClBhbmVsIFJlcGxheSBlRFAgcGF0Y2ggc2V0Lg0K
DQpXZSBjb3VsZCBoYXZlIGNvbW1vbiBpbnRlbF9hbHBtX2NvbXB1dGVfY29uZmlnIHdoaWNoIHdv
dWxkIGNhbGN1bGF0ZQ0KYWxwbV9wYXJhbXMuIFRoZW4gY29tbW9uIGludGVsX2FscG1fY29uZmln
dXJlIGNhbGwgZm9yIGJvdGggUFNSIGFuZA0KTE9CRiB3aGljaCB3b3VsZCB3cml0ZSB3aGF0IGlz
IGNvbXB1dGVkIGluIGludGVsX2FscG1fY29tcHV0ZV9jb25maWcsDQppbnRlbF9hbHBtX2xvYmZf
Y29tcHV0ZV9jb25maWcgYW5kIGludGVsX3Bzcl9jb21wdXRlX2NvbmZpZy4NCg0KQlIsDQoNCkpv
dW5pIEjDtmdhbmRlcg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmltZXNoIE1hbm5hIDxhbmlt
ZXNoLm1hbm5hQGludGVsLmNvbT4NCj4gDQo+IEFuaW1lc2ggTWFubmEgKDUpOg0KPiDCoCBkcm0v
aTkxNS9hbHBtOiBNb3ZlIGFscG0gcGFyYW1ldGVycyBmcm9tIGludGVsX3Bzcg0KPiDCoCBkcm0v
aTkxNS9hbHBtOiBNb3ZlIGFscG0gcmVsYXRlZCBjb2RlIHRvIGEgbmV3IGZpbGUNCj4gwqAgZHJt
L2k5MTUvYWxwbTogQWRkIGNvbXB1dGUgY29uZmlnIGZvciBsb2JmDQo+IMKgIGRybS9pOTE1L2Fs
cG06IEVuYWJsZSBsb2JmIGZyb20gc291cmNlIGluIEFMUE1fQ1RMDQo+IMKgIGRybS9pOTE1L2Fs
cG06IEFkZCBkZWJ1Z2ZzIGZvciBMT0JGDQo+IA0KPiBKb3VuaSBIw7ZnYW5kZXIgKDEpOg0KPiDC
oCBkcm0vZGlzcGxheTogQWRkIG1pc3NpbmcgYXV4IGxlc3MgYWxwbSB3YWtlIHJlbGF0ZWQgYml0
cw0KPiANCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfYWxwbS5jwqDCoMKgwqAgfCA0MTENCj4gKysrKysrKysrKysrKysrKysrDQo+IMKg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmjCoMKgwqDCoCB8wqAgMjUg
KysNCj4gwqAuLi4vZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RlYnVnZnMuY8KgIHzC
oMKgIDIgKw0KPiDCoC4uLi9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaMKg
wqDCoCB8wqAgMjYgKy0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rw
LmPCoMKgwqDCoMKgwqAgfMKgwqAgNCArDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9wc3IuY8KgwqDCoMKgwqAgfCAzMDMgKy0tLS0tLS0tLS0tLQ0KPiDCoGRyaXZlcnMv
Z3B1L2RybS94ZS9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqDCoCAxICsNCj4gwqBpbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5owqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA1ICstDQo+IMKgOSBmaWxlcyBjaGFuZ2VkLCA0NzUg
aW5zZXJ0aW9ucygrKSwgMzAzIGRlbGV0aW9ucygtKQ0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiDCoGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uaA0KPiANCg0K
