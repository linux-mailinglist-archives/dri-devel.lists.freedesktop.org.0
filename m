Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 745E8C963AB
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 09:45:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23A410E35B;
	Mon,  1 Dec 2025 08:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AiEw9BxY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2E510E335
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 08:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764578697; x=1796114697;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YYq3Ks8oAEUx2Odsmllu4ARGY32TtsbfEIjKx5R7mrA=;
 b=AiEw9BxYH4315g/4/lysqYBkJRQBx1nth6Ba9eysDnQG3Uwh1HkaVf8Y
 RPHCJBhduS6JWHYJIE4OKbpasgXABkEm4QenjyyeVszgrLNEoCVKdp8kS
 PdQ2S1z+up7cq0mM0okyc1+dfHV/0w4cHC9yeTQknzKUnWGUrQMHwBekO
 VLrGQ/v1B9Xy/aMUmJY6hyEY+goinyyxOGDS84Zmam3b0clX+jDs2CTEr
 pi/o4PJ+xr9R7f5K+9rf2GFD/q44YotRO1nY6rEgtoiO0TFppv7obqBGH
 EbMly7rPLHRYKXmoiGWix83LruYaXE3s2tm6h36h7q6nyYswmlMIY9/Ib A==;
X-CSE-ConnectionGUID: olU+Rdm6R7WZROadAfHJxA==
X-CSE-MsgGUID: K9wCA82LRDCYRA398yuLKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66225135"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66225135"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 00:44:56 -0800
X-CSE-ConnectionGUID: pRjXlLnLTCKXRAQh6+9erA==
X-CSE-MsgGUID: kaOTMfFuRHOlmUV0dBoITg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="194006301"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 00:44:56 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 00:44:55 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 00:44:55 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 00:44:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i/9Wuh0vSI8B4R6Zb0EF5t5nTBmCJR7yUrMmcDT/hVcJRRogNvhYdHx66UMG6nH46qqXZ6wC8p+BonhjWy6uoc9HLC0MhXd4QjFx/ngm1qbq7IwedZBsBkXK4ISAAjn9U7CZB8BcHV/Zw6bEkbvsvobdIuFlF9dmWru3+2NwGt3/gmNx6Ttp7Ee1qm1lO3cvZ1avZQt7AZgwxOeGbbLQL+XuB6s7EgDDTRoMdeHNvts4vz5e2vDRLSCpUUdjtIcUD3jbrpY2NRkDg/TIuhiEtEoOmk5wU/tjTOWM9iUBhCyOVEJKttK7FssHCmQT6rUqA+6MnSy4UqSRZ62oD6jGtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZRs9vNYR4iQkCdJXPqdGF/brHzijIPrIgSOVNXnW/M=;
 b=igyYmU6SBC2jDRumtDvylCjto0vOnINfNRShjhMZNmJpDPQOGrjJw2ojbXZGQzHF/kN41BRX83NHhCmTvx3SuyGjIdqxVYjbl6ObHCTF0POeteyMN13//0l0F4ktniKbrveceT2DIVGfoD8P1gXko65eZ+QLX39Jpml2JfJvIFsL+TAdfeHQ4nSUji2H2M6eb7TD6czEWMwa81wBCwgeVhG/UxWRULYa8RsIQwWlx8FA1s49qYqvH3YkgOzBTFKOQWSPKd8nSedDHHnrOlD5uemtQhgGli4xxZn0sQs1/H1Fhco36dBOU74XhSqnj4ez/rPz0iHm1lzwKHPStzlbCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PR11MB8683.namprd11.prod.outlook.com (2603:10b6:8:1ac::21)
 by DM3PR11MB8682.namprd11.prod.outlook.com (2603:10b6:8:1ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 08:44:53 +0000
Received: from DM3PR11MB8683.namprd11.prod.outlook.com
 ([fe80::2946:4b79:e608:58d3]) by DM3PR11MB8683.namprd11.prod.outlook.com
 ([fe80::2946:4b79:e608:58d3%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 08:44:53 +0000
Message-ID: <d60b442c-94e6-4255-8988-199eccf884ae@intel.com>
Date: Mon, 1 Dec 2025 10:44:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [git pull] accel/habanalabs: Gaudi3 support and updates for v6.19
 [withdraw]
To: Dave Airlie <airlied@gmail.com>
CC: Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, "Elbaz, Koby" <koby.elbaz@intel.com>
References: <a878e155-4a20-4a6e-8a9d-783117d4fe8c@intel.com>
 <CAPM=9tx4ASiN8VB6OUvOEzwOPaXO0tM4-q4ZaQRKmtdoTTRF3Q@mail.gmail.com>
Content-Language: en-US
From: "Sinyuk, Konstantin" <konstantin.sinyuk@intel.com>
In-Reply-To: <CAPM=9tx4ASiN8VB6OUvOEzwOPaXO0tM4-q4ZaQRKmtdoTTRF3Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL0P290CA0009.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::6)
 To DM3PR11MB8683.namprd11.prod.outlook.com
 (2603:10b6:8:1ac::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR11MB8683:EE_|DM3PR11MB8682:EE_
X-MS-Office365-Filtering-Correlation-Id: 1df0eadf-6a4d-41c0-e5ea-08de30b5e5c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFNjYkp3ZHBlNFRiMDdBWEhBQ1RmaFJyUGhNTTliUkJVcW1BLzI2SEYvQWwy?=
 =?utf-8?B?czZxNkN2SEN3OEhGQnl3eUtjU3UrdE16cjM3Q01WSEhGT1AwaVF2NktiU1k5?=
 =?utf-8?B?cTA4T1ZRL29hMVQ4VGNObGlOZUR5VHcvdnV6dHlIT0hQMXZHRjFEaVZIMlZD?=
 =?utf-8?B?WStIUkFWQmZrUDh0OVBwZ0xEOUlCaExIZEFFcFJoUmdBNW8zYUV5TmUralQ4?=
 =?utf-8?B?U2w2TXVCallKa1B5LzdZelVsNkxJTXpCSXZVTXRKY2VDMWZWbCtSODc2ZWcv?=
 =?utf-8?B?R09aVHRnUi9mT2Ixb0pnKzl1TXJxeXpPcldvODFKaWxXajgzNnE4YjRWcHg0?=
 =?utf-8?B?d0RYYVBjMjVwV0Y3azFCTVh2bFJyckFhZFVpWTY3TkxVbmZ0ZzUxRTVrUG5C?=
 =?utf-8?B?MEtrVUtPS053c3lwUmVMdkp3SklOUVdIYjJEK1dwSDdiMCtJajF1QVMvOHlj?=
 =?utf-8?B?RnBJd2JoaEZrdy80eStxNUltV2MxOVA5NGtCbWFRM2s0ditta3dyWi9rZnlS?=
 =?utf-8?B?UjNVVm5mbXJ4cnlKU3hvSEVRdjdNbVFQYWNqeklBcmZZUGJ1YVR5bWF5QU41?=
 =?utf-8?B?dVVxTHJEVk10RCtpTXNMUFNQVHpMemFLVUV3NHJxRFNnQVQ2ODlhUGE4RDBt?=
 =?utf-8?B?bUtpRlNlZDBiWktFQUFvSG9ZeStaSGxKUWdvbldFWTE3Z1Rld2U2UDNrUXVo?=
 =?utf-8?B?TllxcWpmT0ROa0c2YkxINjZGRUZ4Y28zc2JEeGpQTG9GeUJ1ZXVJYnNXdUxB?=
 =?utf-8?B?Vjk5MGdxMjRmejJHbUwxYkFnQnJBMGVqWGFRSFNRM1JNWUpIYXRzNHB5czRy?=
 =?utf-8?B?TTBuVktYT1RGVFVQU3Awd0oyTmdIWEFsei91djBqdnV0dDhrUWN6UGJ1QnRz?=
 =?utf-8?B?UFlpakJJYWVyV2Rtc2xqU202MytvQmZONDl4L0h2aUNLTXBDZ2xVcnAzSmZk?=
 =?utf-8?B?UlZLMjZLaXRKK1c4YjhPQWRnamo3K2o1ZjlOaXlicDlTVWgySEhCaUZYMTZO?=
 =?utf-8?B?SVFOa1B0TVBjb0IvMXVrYW1SQUpsOWpIVTBMSXhuS3Q4cE9Dakg3QmtkdUh2?=
 =?utf-8?B?VGREZUw2ZEd2NlplUFpCTlgrdEFpU3U3bjYrNHovMVJYVk43VlVsMk1uWlJJ?=
 =?utf-8?B?NGR2TURIemtKNUQ5MDl3TmN2ZzVSc0Yzc2c2RDBSV3FJaDEra01YekpZVnJF?=
 =?utf-8?B?ZHc5cUYwWjVrZjNCV0toSmJkNzJZRWlzQUZnNnpianl3VzlMWmtuTzRZdk5G?=
 =?utf-8?B?R1RucEV1VC9Pb2NzZGw1K0tBUTBWTkxOb0NEN3Y0ZG9Vb3VreUFPM0VlTnFi?=
 =?utf-8?B?K0FiQ3REeW91eFRlbHIrcTBxMDhQZWxYNUVHY2gxTzZncDhFR0RmcXhlbXV5?=
 =?utf-8?B?WjdsaUZvVVViMXozUllsVENBYjRWQmh2M0Y5bFRoYnVxQWVmakFDc1BucFov?=
 =?utf-8?B?c1MydnlldVlXK2JZRzlackROZVRCN3FGYnVkUjliVytVMXJVWmljaThteVNi?=
 =?utf-8?B?VUtBM3FKbnR0Qmt6SW11cXk4c1FsRmdHTVNtNkorMG1kWHd5dmJaMzU0R2dn?=
 =?utf-8?B?cFYxZDFsdXRzbWZCZ08yeDlmakx3eTg2akJoOWtiTHF6LzZwZlRyQjZHd3Yy?=
 =?utf-8?B?Q3VqMnpzUkkvZDY5c1hoYkdVRjZUQWZoOFlJTWt3QktxUk5vdXd0dEJYZnZM?=
 =?utf-8?B?czAzK0UxNzNGRlptTDVLMHFSZXB1TnE2V2hqeTNSNUVFSU5MbHZoWGFkMWpU?=
 =?utf-8?B?bkRPdml5NE1JcHVoWXBiYitldVZtS2Z2NWs2TVVyOXNKOFp0TGVGcEhsdVN2?=
 =?utf-8?B?ayt2dkRzQ1UyOXRtYUJYcklwbnphT0tNMlE5RE9tZWdPeHFTbHExa2RCeFZ4?=
 =?utf-8?B?cDAyQ09qenNHSFN0TGY0MlhyWVNzcW11VnBnV2dVT21sV2NGbnhmVkRXdWtT?=
 =?utf-8?B?Q2JsZkRvNzlSMXpZcDliNVYxRnVrczZueHNtQlA3OUwvM2t4SUhLSDE1ZVBu?=
 =?utf-8?B?Z3QzUFczT1pRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR11MB8683.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U09KZGlYR3FtLzhMbjFWR2tKelAxS3RLQ1R6OExOZ0FOdVUvK3RsU0hrNjU0?=
 =?utf-8?B?SWpGTUJJeTdpV0l0ZCs1WmlrSVZkY1k5dDIxL0ZsaDUzWWtJNFhTdEczbk9R?=
 =?utf-8?B?WmpnZVgrRzQ1M0pXME40YWt6MXg5OE9XZTJ3MXhTZTJaYk9iQXJtejVGQ2ht?=
 =?utf-8?B?M3BBZUxWR0VHbWNmUVNhdVlwTnNXVS9idDZZc1dPd3RZUXFyOVRtTVZzYjNK?=
 =?utf-8?B?R2liYThGRlI5ZGxROUhoS09HaFM0TDhhWEhIcGtEVEorSFZKVjY1ZUM4SXZ6?=
 =?utf-8?B?ZjBtVkVndDRsRkR3aTNPakMyZmdUMkVkZE1GS0dWMWxRN2I5N3FHbVh3ZUlY?=
 =?utf-8?B?T3VMTlZ3YUpINVNYcUZvcExETWc1NmphUEhVcWtDa1hoakU1NlEzVFJJMng4?=
 =?utf-8?B?L3hUbzNPZHd4Z1RpVFFJZmdRc2F1WWo0Q1FnRU1RSTJ1ZWlJdE5VN3ozRUdF?=
 =?utf-8?B?V1QwMGs1dnlLV2FqWCtlbDNxL2R3clNNcG1BRUhubDdaVmkrN3N0UTNnYTNz?=
 =?utf-8?B?elRTeXMyRktFd1g1TnpiNndhUDNSVnV2VzdyZlVGTzRzM1JKN2RKVU5VVXYz?=
 =?utf-8?B?WG52RkxLZUh1MXJtM2g4aTcwZ2gvNWNXWC80UjBjMnN2RFFTdlhwcW5XeEUz?=
 =?utf-8?B?QW5Tbm9xdU1Iem9UK25lc1I5cmhlY3Zac0YzSTIrZUdod2NqUVA3aGhSZUdq?=
 =?utf-8?B?c0VYb05ydjArVGk2UWM1OHZmdjV4UEJQR2k5R0crdkFXYlp0bDFqZkM2S202?=
 =?utf-8?B?dDA3QW1aYW9tcktiLzd2ZW1PQVl5VFFQRmozUUdtSGc3S0Vxc0JuYXFMcXZ5?=
 =?utf-8?B?NlBKNndxTmppV2RtYk9uM1lkSHZjR21KbStZYzlMcC9IaklMS0tGdTd4d0dE?=
 =?utf-8?B?eTIxNlM2VjZRU2Q2WHg5QnhJbTVmeld6NWNQMWp3UHQyTVB2QzkzUG5NVnJO?=
 =?utf-8?B?aU5TR3o4SzYwMkNYL2dENkFiR3ExbGs1VGdBMmNPd292bC9wa3Nad3JEMmpo?=
 =?utf-8?B?ZUlQYk5PRlRDM29UTm1yWFh4TzdoMnFOcXhvNWMrcnp0dzBWUGJUVWhOZ2gy?=
 =?utf-8?B?SEtZWXJ3MDRDcjBhTW55RG1DaTlTc3pDYXR6Y25wUDFSNVhYYklBWnRXK3Rm?=
 =?utf-8?B?ckZ5b1NKTVBPR3BPTFhockdJelNzZ0tEQTZqMjZWZ1A4UFZabmtWSXhBVzA5?=
 =?utf-8?B?Rk5kdmZ2cVptK29xTlpuMjhVQzVySDlqSlp4OGdOWjM4cWhzOFl6S2NSakd3?=
 =?utf-8?B?am5PWDJLN29qSmxmREFBVEFyeDVSeTFlMVZ5SHhwSy9SMm5vekNlR0QvTFBN?=
 =?utf-8?B?ZEpxV295dmVQeUZaWFJ2TktXNGR2K2k4N3U3TE54MWIydjM0N1diZzBENW12?=
 =?utf-8?B?TVUxMkJza0V6V3BaUTNvOTNCcUFJRk9SOXA3UnF0VlowMkwxUFdvVlJRUkIr?=
 =?utf-8?B?akx3dVErdS9lcTM2MCtoc0d1QXNVWHI0UGxFSThCV3cycC96MzNuYmtpK3dY?=
 =?utf-8?B?YWQrQmRHZ2R4UjdMYWRJckg3UytFVXd2UHBuTVRNbGY4dmtzVVpvR2JRTnRm?=
 =?utf-8?B?YkM0OFdQUy9ZVzdwN1NFdzFLSnMya1A0a2VaY1oweEtoQTJWR0l3Ulptclgw?=
 =?utf-8?B?eXR4eXB1K2I1ZFBqNUhNQTdvNDlzSVArOW54RWZwWVRlZXNLbUpHOWtyenda?=
 =?utf-8?B?eU1xQ0IvWnFqakVhcnNuNGFuLzdqa2tGU2huOGZscUxSZHVleGdMVWZQc1dy?=
 =?utf-8?B?NWEwbGNVb0tCYkZXdDVrQWlKMjBucTV5a0tiTktZOUN3U3VFZDY0ZWdqYThY?=
 =?utf-8?B?MXYyVEpMMG5YOVBGaGhrSk1VeGtPemRBS290dVZQZWtnY1JCbk9UNFFOcDZa?=
 =?utf-8?B?eEhIZ0hRN1UzbVc2aisrWkkwUmthbEVxQnB2cGpJVS81VCtKNDJLNElZN1A1?=
 =?utf-8?B?T0YwUDFaQ1lRZ2JOV2ZhVDdTUmEwU0JkOS9hZ0ZET0wzdU5ZMWlFVnlIdzg0?=
 =?utf-8?B?RE1iR1JhdU1OcWtGR05WdTJpZUErT1FEdmhHenhWdGlDWWFWUHNqUG80ZEhN?=
 =?utf-8?B?UGRLSGlQaHlRMGRZV3dJWTRrdVU0VWl6Tmw2UFc4VXJBa010c2RPWHFlbkRX?=
 =?utf-8?B?VUdPZ3hpQ0NUQjYxRUhGQ1hveGk0NGM4Zk5CZXVwcXQwV2huSnQwNkZRUkdX?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df0eadf-6a4d-41c0-e5ea-08de30b5e5c4
X-MS-Exchange-CrossTenant-AuthSource: DM3PR11MB8683.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 08:44:53.8005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6O9OHxkwFfhdR7yNau7KH0/47l9wrq8hH3WufwKWtfqQNBDPwq7L2TLDzkrUbLvYOsbEMCISP6bwgysiHBXgoUxJfBwD7zlbuZzGCjj6D/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8682
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

On 12/1/2025 5:51 AM, Dave Airlie wrote:
> On Mon, 1 Dec 2025 at 11:04, Sinyuk, Konstantin
> <konstantin.sinyuk@intel.com> wrote:
>>
>> Hi Dave, Sima,
>>
>> We are excited to continue the upstreaming of the accel/habanalabs driver.
>> While maintaining the momentum with Gaudi2 fixes, we now introduce Gaudi3 support,
>> covering the development work done during the 2021-2024 period.
>>
>> This tag contains habanalabs driver changes for v6.19, continuing the previous
>> upstream work from tags/drm-habanalabs-next-2025-05-25. It includes improvements
>> in debug and visibility, general code cleanups, and the finalization of Gaudi3
>> support, closing remaining gaps relative to Gaudi2. This is backed by
>> foundational features such as the MMU v3 architecture, ODP (On-Demand Paging),
>> and enhanced security infrastructure.
> 
> As per https://www.kernel.org/doc/html/latest/gpu/introduction.html
> 
> "All feature work must be in the linux-next tree by the -rc6 release
> of the current release cycle, otherwise they must be postponed and
> can’t reach the next merge window. All patches must have landed in the
> drm-next tree by latest -rc7, but if your branch is not in linux-next
> then this must have happened by -rc6 already."
> 
> This is new hardware support so I was seeing how nice I was feeling,
> but there were a few messy bits on initial review, so probably will
> have to wait for 6.20.
> 
>>  .clang-format                                      |    179 +-
> 
> I've no idea who owns .clang-format, but changes to it should not be
> happening via here, it looks like it regresses and changes a bunch of
> stuff unrelated to this.
> 
> diff --git a/drivers/accel/habanalabs/Makefile
> b/drivers/accel/habanalabs/Makefile
> index 98510cdd5066..58c51f03858d 100644
> --- a/drivers/accel/habanalabs/Makefile
> +++ b/drivers/accel/habanalabs/Makefile
> @@ -3,11 +3,16 @@
>  # Makefile for HabanaLabs AI accelerators driver
> index 98510cdd5066..58c51f03858d 100644
> --- a/drivers/accel/habanalabs/Makefile
> +++ b/drivers/accel/habanalabs/Makefile
> @@ -3,11 +3,16 @@
>  # Makefile for HabanaLabs AI accelerators driver
>  #
> 
> +CONFIG_DRM_ACCEL_HABANALABS := m
> 
> that seems suspect at best?
> 
> +ifdef OFED_PATH
> +KBUILD_EXTRA_SYMBOLS := $(OFED_PATH)/Module.symvers
> +endif
> ???
> 
>         timeout = flags & HL_CS_FLAGS_CUSTOM_TIMEOUT
> -                       ? secs_to_jiffies(args->in.timeout)
> +                       ? msecs_to_jiffies(args->in.timeout * 1000)
>                         : hpriv->hdev->timeout_jiffies;
> 
> There appears to be a bunch of reverts of upstream developed patches,
> 
> 78cf56f8832a932ade20b8340a029ace14ac0e98
> Author: Easwar Hariharan <easwar.hariharan@linux.microsoft.com>
> Date:   Tue Feb 25 20:17:17 2025 +0000
> 
>     accel/habanalabs: convert timeouts to secs_to_jiffies()
> 
> Please re-review this and make sure you aren't rewinding upstream work
> that never made it to your internal development tree.
> 
> Dave.

Hi Dave,

Thank you for the detailed prompt review and for catching these issues early.

I am formally withdrawing this pull request to carefully rework the changes
and retarget for v6.20.

Corrective actions:

1. Remove all out-of-tree artifacts:
   - Revert .clang-format changes
   - Remove CONFIG_DRM_ACCEL_HABANALABS := m from Makefile
   - Remove OFED_PATH dependencies
2. Properly rebase the Gaudi3 internal work:
   - Ensure the ~6000+ internal commits are rebased in a way that preserves
     upstream history and avoids undoing v6.13+ changes
   - Make sure no upstream fixes are silently reverted by the Gaudi3 series
3. Preserve all upstream contributions, specifically:
   - secs_to_jiffies() conversions (78cf56f8832a, c2cd5986ebcd)
   - Any other v6.13+ changes that touched habanalabs
4. Audit all files for similar unintended reversions
5. Clean the commit history of internal development artifacts
6. Test thoroughly against current drm-next
7. Resubmit for v6.20 with proper timing (well before -rc6)

The Gaudi3 support represents ~300K lines, but that's no excuse for not
properly synchronizing with upstream. We'll get this right for v6.20.

Thank you for your patience.

Thanks,
Konstantin.
