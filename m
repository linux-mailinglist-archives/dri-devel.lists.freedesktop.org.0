Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 547A5C16BEA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 21:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74D410E034;
	Tue, 28 Oct 2025 20:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KjNDlF7t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8EF10E034;
 Tue, 28 Oct 2025 20:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761682612; x=1793218612;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AXF0dZuWcTc3glJBbk49SJjk5tDjq16s0w85a2Ohzcs=;
 b=KjNDlF7tOmpNIZ1ao5n5PyRoyEsqcxDNRmXQozaprKLx24NShr2gkcLG
 M+yt+qqoe4+u2lGr34isOLMkHwsVCMCeQyhlbKHUyJLkYDivwCpl/YcTP
 735SpZjLL9Spr9mz3yoBffIh9ALDoFPCYILZ+XHtX6sXga6BdGKKO0gLq
 cf4Z+BGHw4JydgO9mbWVIRYJqfia0qy4F7U1HUc5jwe1l9L4SEHz553Ti
 YRGiRJJzTqL0W9AAjZyABUZKDDNTRLxnOojH9VrkmkNWxG4kjk0b995At
 yTf59swSfnD7n8MraWomrrikSkWD7O4T8cpAddSePT+PpghqFgF3+SMWZ Q==;
X-CSE-ConnectionGUID: P9zFSLXLSVOWmBKfKPzZ3g==
X-CSE-MsgGUID: mra6WNp9QGuP1mfN29nggg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74085444"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="74085444"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:16:51 -0700
X-CSE-ConnectionGUID: W8g1wTbEQt+J/3+gEKmEZg==
X-CSE-MsgGUID: bpSX399UQTG7VY6HK5SRXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="222670246"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:16:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 13:16:50 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 13:16:50 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 13:16:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHg6PBk6p6VG8xJDEHxx+557TJgsGDWRGI1ZZBSEwOnmNOLNorjACKxkM47f66ZWdUGsirXVrLQUbo4gpgRQe/zOTUkUeHFkRXSmlVsIBxI4JPhg1B4eXPR+7NEk0rNj2YtKcLAdtcCjsk+5m6xOQRKjktdzpiar8fMZoW0Sx7Oo03pLVFSkjAiwnnmpdnIrTrtGI7cjJ1XLnE0TG2hui6yzYPOFem1s3l1WyZ+4Zs4Ey3tWrzOFZojWk20gZV9SoaZMvk3EkiVNyKjFu/n/LbvJpK+NYycQu3WB0VRPk3LuOPWY6r1cT9bUxPbr8DHfINTRSe1NE0ZM8QbrzEaU9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZA6+mZENvLD3p/tUjHbhNlxrPr+g4k27e7/+3BlXao=;
 b=rnRgol8TRXPwK/pjG7/kCnnzS4adVoT8usERuic8QaMbF1ipQh3WcEYLZbCToMHiUXASjcVKYeDVdpoxUfPLjG901AwOY5xv5Ydt1hG/1AqsNpZjXf58xi6MKHdf8M+brmTBU5m+zKrw12z5Nl/asGekn4UpHVcL05krD2LWUKo/X+9cUhkKe4pU6rh+mwojhU3JaXciHM2aIVcneiG27XFgKEgMSwxDbc/OVA4JAEdHoUSP73UzXMB9SnLPIHQjzFttYFKsNRuP/320ABhr9KrLWpuo9OYOAS5znVfa/4aLAIlpr5vxuaknzFurCzODBQ2DBrX2GDm2sZ3syZOlCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8421.namprd11.prod.outlook.com (2603:10b6:a03:549::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 20:16:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 20:16:45 +0000
Date: Tue, 28 Oct 2025 13:16:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <jiangshanlai@gmail.com>, <tj@kernel.org>,
 <simona.vetter@ffwll.ch>, <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [RFC PATCH 1/3] workqueue: Add an interface to taint workqueue
 lockdep with reclaim
Message-ID: <aQEkq7DYy5/AaJ4R@lstrano-desk.jf.intel.com>
References: <20251021213952.746900-1-matthew.brost@intel.com>
 <20251021213952.746900-2-matthew.brost@intel.com>
 <2e1e9d6f-4f9e-49f7-90f0-6759c260701f@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e1e9d6f-4f9e-49f7-90f0-6759c260701f@amd.com>
X-ClientProxiedBy: BY5PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: 730fecd4-6640-46f5-0b06-08de165eea8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVg1MFBrZllKUXhscW5mZ0VzL3FNNkNVV28yQkpRd0VIaGVlMTNTQW4vQ0dN?=
 =?utf-8?B?N2ZNTkVyM1lBTGNvWWRNRGU2bEJNekVPTkRXZ0ZBOFZoVDk3NmFDNFA1dkND?=
 =?utf-8?B?cDZzbUhGSFR6MFNqMi9sUFRtTWdUczZOZjdTaXBPRWhpby9yNzN2eU0yYUJG?=
 =?utf-8?B?aEcra2hvczlvZkhuQTRMc29SN1hmRUR4d1ZXeUhLS0lHdGV1UTMvQitYTVhB?=
 =?utf-8?B?NDdsNGNsNU50V0FZOGpBejhMTkxZbWFHdExqbDVwTmt5eTlJQldqZk9acXlN?=
 =?utf-8?B?emMvQUdGSDMxSjI1aXpoUFJiYVRuVmhCbytXTjVlVFZRcXJsYzdqTmR4K05D?=
 =?utf-8?B?a1cvdHFqRWI3YStnRlh0VnJ6L2R2eE9EL0Y3V0Q5SnhIRi9FdHJxc21sVTZ2?=
 =?utf-8?B?Vkdzd2ZYRDRqV2x2QWhxOGp5RU5uTUlxaXpWNUUrQjVEUDlJazZBbVlvek1Q?=
 =?utf-8?B?Ujg4Z2Z3cTdkeWVRYi8ybk1oN2ZTNnliRFRPby84S2t6ZkFTV0dTZUhTVUdU?=
 =?utf-8?B?Y0pTNmFBSzdDaXR4R0lOU0xUbHR1K0FLSDlYY2ovZkdidU14ZlRDNVNPUjdQ?=
 =?utf-8?B?ZGN5RUxta0lick0zUFVHeDAvSjFzRy9GejllV3lqWFNVMFdhU1ZpZzVPb3c3?=
 =?utf-8?B?NTdxVjlrSFh6VDR3R2pqQXExVk1XVXRncitxc09UZUpIbldZbnZXLzJ2UzB6?=
 =?utf-8?B?V1g2YWsxWHlVUXJMbG9oaUdnZm9jQ1h3MGZ6NG92NzlkN3ZaNkpycVF6Zmty?=
 =?utf-8?B?d1BQQmMyeWVXOFNsaGc1dnp1N1RzdnpEMWdhUzVPNWZ6RjJMNURBRUFCT0FE?=
 =?utf-8?B?MFpVRjB5UTZVTDdxdkJVV3RsMk4wRDZzbi9GTHlqT1BEaEREOUdocmxZU3k3?=
 =?utf-8?B?YWl6YmNWcGRBVG1IWGEzcmphMEN3R3ZaamMxdXZ2WlRuV205QVc0Z2twQ3NH?=
 =?utf-8?B?Njg5bHc5RUd5T2FuVDRPM3g4VW9BSnpseHM3U2xQNE9MbnFKQWtGbWtUM1dI?=
 =?utf-8?B?azNwSjVjd0Z3Nnp4OHNyS252Q2UzWVV4aDZiWWJ0eHVmWGZSZjA3QXhONy9w?=
 =?utf-8?B?a3EvNml4eTBUbUwwK0pCUUFEWkFTMjZoWjZnUjIvQW9KZFNWcW1lWUJFenhG?=
 =?utf-8?B?U2ZpcU96NllzdFV3b0VweGl5SXFCTHNCLzB5MGhYb1BWWlowSlZqN3ppaUxo?=
 =?utf-8?B?TGorTnRMYUVyRi9sQUpXbVZUVk5POHpuTUFqckdIRXh5cE1PNk9STW1nK0pv?=
 =?utf-8?B?dk9BUE9KSTI2UGxXQkNEblV3aUVmS0pUQzJmSGxLQWcxUXhuTWp3SURlNlJR?=
 =?utf-8?B?ZHg1cTltM1h1OGNjd1YzVGZkdTFWcXN2enZHbG1lN0xRaTlnQ2p6cTdZZ1BU?=
 =?utf-8?B?c3VYTUxMeTFpOGxuRS90YlBzZE5oUndNS0tMRzhScSt5SkFVcUhwcGUwMVli?=
 =?utf-8?B?eENsVEwvMFlMdDB6eVUweGI1ZlJyTVB1bmsvMkZzNDBzYklXOGlKbGhNVkhY?=
 =?utf-8?B?WW1BSEJxWk4rb1h5Y0JyTC81M1BwZUVrdkxIeSttbmdQaGN4eEhJUDFaTU9W?=
 =?utf-8?B?bkxuN3lkenRjZHhlN3NzY1cvczY1UUdhRjRFcXRBVGZOUVZjMTdqWUZIcktz?=
 =?utf-8?B?dWJCSHU5Z21oT0ozejhKTHBBemxqbHpwOE1CbnVCeHppZUp3b3U1QURQdkNJ?=
 =?utf-8?B?dGo0RDZPbGJjWWRIYktJbGxGMEhZblNEWGxLazlQbC8vRnhISThpSStya0du?=
 =?utf-8?B?azByYWN1eU5YMEN5enI3NC9pZHRUTXozei95bDBsRkdzQ3BTcHJOTlQ1aGFN?=
 =?utf-8?B?d0pUb0xvZkUwOU5zQ2d2MzVaVUxRQmh3WjM0OS9sVWRqMHkvMW9CNmtNQk55?=
 =?utf-8?B?SkdrRFAvellXK1U0OXo1UlVaeTNYZmVtNHFSaXVUaERaWkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXMvUlFUaGNZUXNoeTFhNUY1MWFFYk1aenVDd016dDlsK1JwckcvNWgxTVM4?=
 =?utf-8?B?ek13R1JWRUFvV2QwbWY3UkJjYi92NXorN1ljaDdkQ1UwYitMVTBLaXh2YUdZ?=
 =?utf-8?B?ZFU2M1YxZURKbXhYbDJiWi8vdGdJMTd3V0M1VjRvSTdhRmt3SS9vcE1rMW5i?=
 =?utf-8?B?em5vR3AzTmNGNTN1dXdxcUxLeXk3Nlh1c1NXVzF4ZDd2c1E5TTZCOHd6dUpJ?=
 =?utf-8?B?VjY5eEk4TERoYmw4UGtPQ2l3VTRGSHVFQ2ZJQzZMQjlPQlV1THdiVnVXTmlB?=
 =?utf-8?B?c0hXUlR0aDljKzZqQmV1eXhIWitzd2UwSlJORnBxbEp3TUI1UWZlNkllK29p?=
 =?utf-8?B?RTFuTzdSUWx1Mlh5WVhpTE5OVWdCSU10RVhoLzJLa0RaR25HWnQ0QzZBUTdj?=
 =?utf-8?B?ME9xYWdLc2JrcWIzeTAwQmh3Z3QrMHBDWGQ4RTEwdWN5NjdQVUNqb3krc0pP?=
 =?utf-8?B?aHhxOEpFb2dmS0NlUGUzalZtaVRRQ0UzTCt3a2EwR2xvQzJTV1k3VkJXcU9W?=
 =?utf-8?B?VVJUS0lQUUpIdnk2SERDNXgzemVOMGNjRHJLK1pTUmwzM3hJOWk3dVpjK0xV?=
 =?utf-8?B?SE1xU1hDbzdrVWpId2tRbWRER1VQV0FGSk1aaHR6RE92dDYzYW1yTW9zRnZI?=
 =?utf-8?B?SXdqNmhVbWZzM1ZsWEhnZDUyUVBYV2NDK2MwSlhsNW05dkRhaFNVazRPOHRC?=
 =?utf-8?B?RUhDZWZHRFpreUZHWDgyeUZXM2tocFZlcnJ1MTh4RUxRQ3FGaUxPenArNnFV?=
 =?utf-8?B?SjIwQmVYRXBoZmJPanVJQ0kxRXJBZjAwTWQ5clBRUVI0MEJlNUcxRHBBRVox?=
 =?utf-8?B?WVpOSFltaXhWOUFGODJBeitzRHA5QXcxbmhmYSszVk9NWUhjR0I1MUwwR2xW?=
 =?utf-8?B?SFZTdCtZTVdFV3BSUmNPL256WDJGNldMMEJPR1plcXh5V3lJYkJ1Y3BXYVhN?=
 =?utf-8?B?SU5QTXpCVzY3b29tNW8wbnBrcEJXYkN4M0dzTWhPeE9mSzdRSmUxTmhFQjJn?=
 =?utf-8?B?eGUreEFiR0RaL1A0NXR1RTRXc0h6eXAvU0xjZ0RDZXZBdW9tTnJ3VVpCRzFl?=
 =?utf-8?B?VEliVHJ2R3FyaFRxemUyR0lOMHZ2R25kMGhHWGh0WkdJQ2lsQXFBVFM3TFJp?=
 =?utf-8?B?VERVU2dta2lTK2NKeldLS0VFT3I4d0ZiazM2OEZ6Q1FZaHVFS2xmekJ5SVpC?=
 =?utf-8?B?azJ0N0lOVGFvZFE2ZHhOUllaRmtVZVExN2o4TlZVOGZwaCsrSzc5V3htM29G?=
 =?utf-8?B?VjZvMWcyZ3p3V2JRNHVVY25YaVpMYm5pMGpxa0JQV3NCQUxyd3hpZkNCVFgv?=
 =?utf-8?B?WFZrdVNqS1JTYUs2QUxNVVpqVFZ2dUUzNiszOWdKaUJocFhQZk42Nml5czJq?=
 =?utf-8?B?bnBLdFBGdEp1MEVXSlA2TXZDdXV1cXFIWHdoUTFFR3R6d2hIYy96WHlCS3dN?=
 =?utf-8?B?UGpJUEt1NGlYRjJqWU9IWEFnOHJkaG5xV0hZMHpkL2gyMGdPMnViaUxidnVO?=
 =?utf-8?B?K1BzQm1mVGtKaENCelp4YTFNY1ZsTi8zZ2pEWkFlNkVBK1hLMFpvRFJUK01T?=
 =?utf-8?B?WjNRZmdRTnF4aFk0Tk54dkZuNVNNNDVhTHVYZG5Jb1VHcUZyMVczNGZJdFdk?=
 =?utf-8?B?dEZqY2RKdUNDRnZDcVNTUFgrcUtqMmwwTDhXdlR0emZtRTFmQ2R1QXR3MWZ3?=
 =?utf-8?B?T2YrRm5wKy9GVVN0a2cvR1UwUnBlaEJhZmJmR25sMDVxZStsSW5pRkI3Z3BJ?=
 =?utf-8?B?dGgvVVVmb0NTUzRpOVZMVzR4ampLeUpUY3E0MlF1eU56Q3JCcDE5WDJkUGVK?=
 =?utf-8?B?c2JyUXhKT0lXa2VwU0tDVnR5U0s3Q0dxRjNtd1JtUWpjNXhudUU5dG1rRmw4?=
 =?utf-8?B?L2NPblYvaFBuRzNrMjd3YllLQ0J0ZjFZMXdRNlFhSXVrWHd6ZGJnM0RsOEF1?=
 =?utf-8?B?aWtyWUY5UjJ5UytTOFUyRXR4d1FJeFh0UThqSTVhY0RaL1BQb2l3dEJieWFs?=
 =?utf-8?B?ZDVuQStobjZ0Z1o5b1Y1YXByNWdSLzBBd3BUTHZYZ1NXekJua0ZYWU9Dc0F2?=
 =?utf-8?B?WVBOQWMrUXdCeWV0elVncERyTFl5Tm5CUlFWcjRVYUhTRVdWTjh2cW5aRUsr?=
 =?utf-8?B?bWtzeExBT2hxbDR0bkUvWE5Zays2SkNMQ2N2Zm45OHh0VGppQm1GSitST0Rm?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 730fecd4-6640-46f5-0b06-08de165eea8a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 20:16:45.2972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kMk+rf/qznG+fGShuD1YTh4/cBKIt7t9JxUrPidjoQcPdDSXGyBervwkhrGKJ8vHHmErteNUEmRYNke3OP0mvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8421
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

On Tue, Oct 28, 2025 at 10:32:54AM +0100, Christian König wrote:
> On 10/21/25 23:39, Matthew Brost wrote:
> > Drivers often use workqueues that are in the reclaim path (e.g., DRM
> > scheduler workqueues). It is useful to teach lockdep that memory cannot
> > be allocated on these workqueues. Add an interface to taint workqueue
> > lockdep with reclaim.
> 
> Oh that is so wonderfully evil. I'm absolutely in favor of doing this.
> 
> But can't we check for the existing WQ_MEM_RECLAIM flag in the workqueue handling instead?
> 

Tejun suggested tying the lockdep annotation to WQ_MEM_RECLAIM, but the
entire kernel explodes because many workqueues throughout Linux don’t
adhere to this rule. Here's a link to my latest reply to Tejun [1].

[1] https://patchwork.freedesktop.org/patch/682494/?series=156284&rev=1#comment_1255380 

> Additional to that we should also make sure that the same wq is used for timeout and free and that this wq is single threaded *and* has the WQ_MEM_RECLAIM flag set.
> 

Currently, free runs on the same work queue as run_job. We could look
into moving it to a separate queue, but that’s a separate issue.

IIRC the workqueue_struct is private and so we can't fish that out in
the DRM scheduler without adding helpers to workqueue layer. Ofc we
could do that too if you think this would be helpful.

> Otherwise we run into the same lifetime issue with the job and memory reclaim during device reset as well.
> 

My patches in this series taint the submit_wq and timeout_wq in the DRM
scheduler [2]. I have a solid understanding of reclaim rules, and this
change helped uncover some convoluted cases in Xe—specifically in our
device reset code involving power management and reclaim [3]. So I can
confirm this has been quite helpful.

Matt

[2] https://patchwork.freedesktop.org/patch/682496/?series=156284&rev=1
[3] https://patchwork.freedesktop.org/series/156292/

> Regards,
> Christian.
> 
> > 
> > Cc: Tejun Heo <tj@kernel.org>
> > Cc: Lai Jiangshan <jiangshanlai@gmail.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  include/linux/workqueue.h | 19 +++++++++++++++++++
> >  kernel/workqueue.c        |  9 +++++++++
> >  2 files changed, 28 insertions(+)
> > 
> > diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
> > index dabc351cc127..954c7eb7e225 100644
> > --- a/include/linux/workqueue.h
> > +++ b/include/linux/workqueue.h
> > @@ -553,6 +553,25 @@ alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags, int max_active,
> >  						1, lockdep_map, ##args))
> >  #endif
> >  
> > +
> > +#ifdef CONFIG_LOCKDEP
> > +/**
> > + * taint_reclaim_workqueue - taint workqueue lockdep map with reclaim
> > + * @wq: workqueue to taint with reclaim
> > + * gfp: gfp taint
> > + *
> > + * Drivers often use workqueues that are in the reclaim path (e.g., DRM
> > + * scheduler workqueues). It is useful to teach lockdep that memory cannot be
> > + * allocated on these workqueues.
> > + */
> > +extern void taint_reclaim_workqueue(struct workqueue_struct *wq, gfp_t gfp);
> > +#else
> > +static inline void taint_reclaim_workqueue(struct workqueue_struct *wq,
> > +					   gfp_t gfp)
> > +{
> > +}
> > +#endif
> > +
> >  /**
> >   * alloc_ordered_workqueue - allocate an ordered workqueue
> >   * @fmt: printf format for the name of the workqueue
> > diff --git a/kernel/workqueue.c b/kernel/workqueue.c
> > index 45320e27a16c..fea410c20b71 100644
> > --- a/kernel/workqueue.c
> > +++ b/kernel/workqueue.c
> > @@ -5846,6 +5846,15 @@ alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags,
> >  	return wq;
> >  }
> >  EXPORT_SYMBOL_GPL(alloc_workqueue_lockdep_map);
> > +
> > +void taint_reclaim_workqueue(struct workqueue_struct *wq, gfp_t gfp)
> > +{
> > +	fs_reclaim_acquire(gfp);
> > +	lock_map_acquire(wq->lockdep_map);
> > +	lock_map_release(wq->lockdep_map);
> > +	fs_reclaim_release(gfp);
> > +}
> > +EXPORT_SYMBOL_GPL(taint_reclaim_workqueue);
> >  #endif
> >  
> >  static bool pwq_busy(struct pool_workqueue *pwq)
> 
