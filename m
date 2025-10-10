Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BB0BCC503
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 11:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5B210EB95;
	Fri, 10 Oct 2025 09:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HekbfCwY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C58F10EB93;
 Fri, 10 Oct 2025 09:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760088064; x=1791624064;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=glhVvLudnw+UCGGp9r59djGClZiz1tI43Mol3lVnqWc=;
 b=HekbfCwY25b6Jg9RGwwYUyJFy45ckawqK1W6cXVMHDuZec5ZZuBjrRWO
 Y6qOxmT4D9O3y+xCA01Etppez2dIoQuQLq4C6r8EDB/evAeBVtLw00ePQ
 QuCM8lp7tEnod2VaIAEPlK+okPd//Tu5KZFjy0hEg6cGzqErwooxymgbj
 0njB+5EZ7oaNWu3vuIW8HTT8sJhtkpfbdw2CNO85y7XapnmDHbjTR9CU1
 6ZJADmp68NuZy6wGIgYQB5A1X5+SO5kIn+yrmc5HNI3lijAGycbbyEELQ
 gas9cLDeBzKlG7lGsCxyBN8i3kbKHW3eAJNWZFStRFKmfpSvhYUkw51Nw w==;
X-CSE-ConnectionGUID: EiWPK3D3ToWXpwCXYsTaIA==
X-CSE-MsgGUID: a4sTIxnzSQyrEgASvPD4mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="66161207"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="66161207"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 02:21:04 -0700
X-CSE-ConnectionGUID: lgRr1EvjRhmGU1V3KPsVdA==
X-CSE-MsgGUID: xOpu+JMbQ5ymYrFAvZStbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="180883884"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 02:21:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 02:21:03 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 02:21:03 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 02:21:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ejPMrKagOYP1LBvhNXeUK+GLVWvaZ/o0sOiSg3jVaBvJ+2dKmhFOI5SXGf6ECZO+hXZSU1XIKVsW44lZWCDIZWvW8CPAEUMTWxkQKa1bzifZXHrx4TLYWszNZGI+Th9/9yYZRxZOUXmP9NFrNd5OzKL/sdL7HHaAT2XzWMotNhHRoY49vSB0wzVygDbVXKXWkqLg0/zLSmkNxR3KeSS1rtrj/grBBzqQec8k8kV5H7qzZGPyvdM2eKVY8ZGmSw8foRBhxs4vKwYV8EWtO6ynQdb0YMIee0LYzxO8scpFL94+mrDkuOD4lN3ng84Ju6gw1I08r/VttpwYQXiwi2P0PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2s59+zmjoeHpXUmn4Aqdr3bPF8Qh5apm66Y77994nk=;
 b=qNXW5p6pRuHsBrOPfss1qzfGJm7gCtUVk2fJIVqQVE77P0x2PjfZc9+OnPOdgaeC23jgoA7rTvPaFu2PUn7pjkyB4usTEuPnJHumz+WfJT+3JEawr/ZLXUhLiRuxX2LqeNcq5KqJqL9uy3+hTPJAAZbvZIM1mDL9AXcvA4ml/Es6vp/o54hwcxhx7bKEbuHvBEwy391I2LDffIgWRKykpH0optcGIDAWmox5syeycQbSob+2o6Vh/YsvCNuA1iZx/RLzchap/tPvBKw8XC+8TnJYI4eX82SPpPwUcA0RgXLqHbjpy7N4aWyDigShM0ZpA9Jqa1wAZzzFfiRlYy6+PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by PH8PR11MB8105.namprd11.prod.outlook.com (2603:10b6:510:254::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 09:20:56 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%5]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 09:20:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 10 Oct 2025 09:20:51 +0000
Message-ID: <DDEJ549W1SKI.2P9MUWII6LGM0@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH 2/3] drm/i915: Wait longer for threads in migrate
 selftest on CHV/BXT+VTD
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
X-Mailer: aerc 0.18.2-107-g4f7f5d40b602
References: <20251008161258.3568573-5-janusz.krzysztofik@linux.intel.com>
 <20251008161258.3568573-7-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20251008161258.3568573-7-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: WA0P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::19) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|PH8PR11MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d96a20e-fadb-49b8-e38e-08de07de511d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTJ3eUdvVVJyT1pFNHpSRytUcmsrY3dNUmpJenRSNlplU3hYRW9mM0NaZlgx?=
 =?utf-8?B?WVoySVRaSkJCa0RZc2JOazh6Q1Q0OHF3K2p2N1NBSlVRR3QvaHBmQWZHTC9Q?=
 =?utf-8?B?NGN4ZTkwN3d6Y0ZkeHVKZXV6eGF6ZGRhUVgxTi9ENm5iNGt0SEdORjN5M0xs?=
 =?utf-8?B?VWpZR0hTd2sxRHMrUUE2YUoraTlxeXJHdGdaNFArTWg1RVl0QXA1ZWdycmda?=
 =?utf-8?B?SWYrTzhGamNZU2FRdFRSc0V1VnZZQ05NcXFRanRqTEN6UjFaYi9hVEZHRUF5?=
 =?utf-8?B?Y1R4bGZ0ZjlTTlJTeE50SkllOXkrN2NRMTd6TldmVHZCU1NiNnNZOWM3ZWZQ?=
 =?utf-8?B?bDhCc2x2SnozZVc4QXV5aklXV3hwRXQ1b0JMMlhrSHQ4ZllDd0Z6QXlONnpp?=
 =?utf-8?B?YlBmdmFJUGhTSDdXcGJRdzQyWU9ZbW41c3BvbCt1ejZ6KzBVQzh6MWdJc1Ir?=
 =?utf-8?B?ZVFidlpoblVaMnlySzRGSit1c0FZbEhJOGcwcHZoSEMyby8zQllqQytubjdt?=
 =?utf-8?B?QUV6RDVsbHNEYUM5RldwMnVkTnZuZyt4YldXOTJPWXFuaGJUcVZUN2RjdjJR?=
 =?utf-8?B?dUhZeWdrRmY1SG9ENzVpQjFLVng2WTVFVXBpYXZwdnNtSDBvY1dUNC9FSG0r?=
 =?utf-8?B?YVFFU0RvMm5ib3NyTnpvWDAyVUp6dUFqRW5TL2RtTUR1c2FSVWVCaDRHbkdB?=
 =?utf-8?B?NnV1aG8wNDdSa2UycGdTb2ZrYkZnR1ZIU2VFenE5UTFZNkZtSTh5MzdCN2R4?=
 =?utf-8?B?ZEJlUVJ5VXh3STFxUlRqQnNFbmdNUUdPMGZhaFhsRWJZVlI3QzV0WWwveXRS?=
 =?utf-8?B?clZTU1B0ckwzRkdRMDNaSno3Tnp2aFJUUS8zQXhZclltaXhnVnJMMmZZa2M2?=
 =?utf-8?B?dk5DN00xT1lUc1B3SDFFOVNpMXU2QzRyNkM1VnRKUzEwcG9rWkVMaGRIOE5U?=
 =?utf-8?B?WHBvL3N0aXorcy81cmY4Tlh3RWpOTkxabUFnVVJ6Y3gxMEFjcU5TbTR3WGNp?=
 =?utf-8?B?allzSm1uK3U2L0ZaTG9Zek5JcGU5SlRRM3Exc0dKRWZHUzJCTWt5Q3VrcjZJ?=
 =?utf-8?B?Y1BJTTd3K2IvMmEwSTNaOVI1ZnhEeE5yWkpISmhpblJ1cFRLRXA3cFlyMVJl?=
 =?utf-8?B?dU9ycDhiR3pkWmlmbjM0dkJnb1RCK3hQRFlPWFFFTWtTODdhUDZSV0J5NVQ3?=
 =?utf-8?B?ZEVOYUhUUHcwOTRGZmFlR3lwRnM2Q2dtRVdoT0U0R0tHZWdlL2IweE5VcGpa?=
 =?utf-8?B?eUpyK2p3WWZlZEE4d2dEblJxNjZ1NG9GQlpxUkJPTFFwRTE3a09lZjNFUkNQ?=
 =?utf-8?B?SnZNV2pJODNmZWpnY2NCTFBBSlh2ZTlNTXhQTit2TnRwSkFSbXJ4cGs4UmU5?=
 =?utf-8?B?YnVJUHoyNW4ydEhuSlRZQUQrNFZBd1ZXV0NFbkxnZitOUHRpNTdJWm5PaEow?=
 =?utf-8?B?VUw1T2xXL1hkQkRwdEJFcjR5dksxM2hQMkUxVFhsZVViZVV3blpvU3YwMHU5?=
 =?utf-8?B?WlFaNlNpdmlDOEJ6Mno1NTM0b2N5TUhMM3MrYUZ4aWNZd2QyZXNQZ0VPdWt5?=
 =?utf-8?B?cVZyQ1NhcDlkYmJyVHJaaVBXMkttc0Z4dlFseDd2dE90cnI4bDNPbE55WHhG?=
 =?utf-8?B?aFBvQXJqNHFVRVQyKzNqOFJTOEVVdXFBOGt6dHJSZkdBTWdnVkRZUUhNSlBO?=
 =?utf-8?B?RVJBLzVmQXV0Q1FhT1NqKzlHRFhNamlwUkpSQ3J4aGxZcW9KQ1BIY0lRdVhJ?=
 =?utf-8?B?VG5TZ0xmbWFNL1h5TEFhVTFra093RXZHeFpZNGNlbjZBQWxjZVBQcGYvOTlG?=
 =?utf-8?B?Z3dSOXNLWWZLZSsyY2tJLzlYcFVDanBmdy9HT3FnaWlILzllcCtKQThiZXJB?=
 =?utf-8?B?OXhaMlg1SFVGdzBBTHJVRTZUdnlqb2xPL0JiQ25sT00rQWprVStTSnFYcWlY?=
 =?utf-8?Q?FT7bCPfUVUVGsKp3jxb7ltr/6fJPXLhA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmczMzlEUVZZc0diaDRtZmxMNEladkl3NHkvdE54UXJXUmJIekp2WTZKVWM4?=
 =?utf-8?B?S3ZRajVaWG80aUxOemJ3K1dKakVXV1BLTlcyYkRZYzZWcXZkUEVRMS9GNWJ5?=
 =?utf-8?B?bmpWVTFtbEVHOUFKb1kyeXdvZ0pIclJxZW9OYUE1V05oQjlxK2VFdkpETFA3?=
 =?utf-8?B?MTB1SGRmZWovR21BNG0rUzk2MTFTSGRUeVlYY2FXN1VTRjZydlFIZmljblhz?=
 =?utf-8?B?U0xCazA3cnFVVWZxb0FQR2YvRmRvTUhtdXo1TkJlS0dEV2pCOFFHR3hHbzBI?=
 =?utf-8?B?Y2E5bmNhaU0xKzRBdVNLZGdJSW5wb3FHZ0NSUk14bHNOekUwNG5GM1VKWkpT?=
 =?utf-8?B?UUQxWnFXbVplcVJqcDQwdm8xTmI1OHROeDgyOTNjbm91WGRodU9ud09rV3RE?=
 =?utf-8?B?THJoOVA0cG9PR0JiVGFTcElDRFJzWnM2V1VSREpDRTRodmgvVkFuVERhbE1N?=
 =?utf-8?B?Y2lsYUNYR3B5M0txZ0Nnbk9MUVNBV2ZYMWllWXpxT3U0b3BNNEllTVJyaTRa?=
 =?utf-8?B?MUdZZDF0U1BhRWM5dWo5Ynh1d0hncGl5UHRiTURLNEpMMis1R3d4endCdGJm?=
 =?utf-8?B?MGkvSWZPWExPdE1GNkRCSUJVbEdxalNOZ0hJVkhwdU1manp0MWJlaWJiemJu?=
 =?utf-8?B?Q1NLQVdtUDJnRFVnNXJKREtWaXZON0V3MlpVbTlKU3Biem9PSk93eVJQcjhU?=
 =?utf-8?B?OEtRU3VCTkdXZ0E4Sm02aDFBQ2VSbkpiclJOTytMRmFsc1dML2NabVFxWlNS?=
 =?utf-8?B?ZVpzYWpjYzg0WlkzSkRCN0VhUndld3ZEejB2U1lMSS85Znpncmc1enhNWmNq?=
 =?utf-8?B?MG9hanlybHFqYzE2dW5Idyt1YitFaFhWcTBLSk85SlVoUVgvSTB3NktGV0dQ?=
 =?utf-8?B?cWZkU3VHZjVxNzBPN0sraThpanNDQUJUSlJSSXlhTlV0NDlKcmxlNGJnUXl2?=
 =?utf-8?B?TU1SdDNXaXg5dExXalQ1a2hLMm9LL2dhS21DWUR4ZnI2WmVFKzlDOFhWVEN4?=
 =?utf-8?B?cmlwV0swY3BxL0dSWGJTVUU5SEFyK1dTQTV5SmVTaWVsUFZtZGtQTkl2M0xS?=
 =?utf-8?B?Yy81MU5YODlwUUNCT0FJU3dlZkhJRXRUSGVJMzhqNTg5STg0bUh0TUd6a3Rz?=
 =?utf-8?B?Y3daUE0zUjRxSVJDWHFyL1lUQ0VFQVluck90UjllNkdUb2kyMG4ybzduRXpV?=
 =?utf-8?B?WHczbEpjUGl3ZjJjZ2ZmalZFZzZpcGs5ZngvYVlQWTRDVTZIM0w1N0NQaVZr?=
 =?utf-8?B?cW9nekxISGx0eXZsWG1PandMSTdNRUFNK21aS1A0YXpyQldOUVpjeGV1ci9Z?=
 =?utf-8?B?NjhDV3N3TVB6MmZ6ZGFETEExalJMUWUzVm55VE9sWkx0ZXlwYjNESEZXTnpy?=
 =?utf-8?B?MVMxek5Pb2dqaGxYcWo1RnVOZWVldW5uV2ZlRjhBV0JVZW1DOWJ3SGtUelVy?=
 =?utf-8?B?Z09DYlh2bk1iRGFKMmVrOG9CUk5FY2JHbk10dEthT29Hd1VjMjNBdGYxakJL?=
 =?utf-8?B?MlNpQWkycjd1RjZuenh2L0tvWXNFVXdoK01aai92dngwcTBIV3J5WXk2N2I2?=
 =?utf-8?B?a0RLcUM3eXZOYjZPa29XUTlSQm9KWUw0ZXNlaUE2Z2dRdTd1NU9jVS9YMElD?=
 =?utf-8?B?YTJLM3NodGJiQ3lNMk5nL2FycUZ4cWlKUldlQ3IvN0hnNjY1QmFnQVJteFpW?=
 =?utf-8?B?ZW40aFBsUzhDaFhNOGh1eVk3QnM2OW9Pb2lUNmNWUndiRXZqQmxTTDNsYjZD?=
 =?utf-8?B?WXlGU09CMHdDdDFLSnVzb3VQdURnK2tZNHFtQlIvM2ZiaDE2VysxaGNzbWtG?=
 =?utf-8?B?cm1RZFpUc29LVFNhWlZZekFnV2NjVXNsSlFBTkx6MkFyVTVod29hU3phVXZ1?=
 =?utf-8?B?bGN1ZHlmYTEvZ2hHYmRRU1p1aDQvQVM5VXR3K3dQaVZEY0FvOGo0MkFKcHl1?=
 =?utf-8?B?UUVaUUg5WlR2VW9COWlrVGlTQ3A1VkVlYXJwcEkzYlNwMi91ZGgvajRDTVJN?=
 =?utf-8?B?ZGtpcGUyVCt2YmtQTEc0M1RHcGhrbEFHNGFWQmorT2ZacEpBUzlmeUYzUHZB?=
 =?utf-8?B?RUJpSStjVXBLYzZ1R3FhMGhEdjFleDhMMDNTSzE4RUFqM3VJL0hCT1BrNmw1?=
 =?utf-8?B?YWljV2FzMWpEY1N6QWFaNzdSNVJsMGJmajQ0SGRTVWlHWnpLM1pCQStzWXJF?=
 =?utf-8?Q?OMZ4AA0U7AOYOl335OhwGl8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d96a20e-fadb-49b8-e38e-08de07de511d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 09:20:55.9470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PS3zkDVIZiKkEJZh8i4bJP7Ovks22lepvXk3sBpxyKoQEYMdmGDcXxa7Xc3HE/WBgUTwWAUyNsog9DYTZP5WVCyEU7lEqu/69GGuq/fb5/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8105
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

Hi Janusz

On Wed Oct 8, 2025 at 4:12 PM UTC, Janusz Krzysztofik wrote:
> When running on a Cherryview, or on a Broxton with VTD enabled, pinning o=
f
> a VMA to GGTT is now committed asynchronously.  That may defer further
> processing of resources that depend on that VMA.  As a consequence, a 10m=
s
> delay in a multithreaded migrate test case may occur too short and still
> incomplete threads may be interrupted, and the test case may fail with
> -ERESTARTSYS or -EINTR error code returned by any of those threads.
>
> Extend the delay to empiricaly determined 100ms on affected platforms.
s/empiricaly/empirically=20
>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
--=20
Best regards,
Sebastian

