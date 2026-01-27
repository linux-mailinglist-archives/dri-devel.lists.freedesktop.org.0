Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIypI41UeGn2pQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 07:00:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4435190351
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 07:00:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCAD10E4BF;
	Tue, 27 Jan 2026 06:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mmDD/F3p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D5C10E4BC;
 Tue, 27 Jan 2026 06:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769493640; x=1801029640;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U3hs8cj0T3RRtW4yEWaQ8yCQrbuyFAcMkq30cbM81Ig=;
 b=mmDD/F3pzlD25eLb1QfogXHqax4CBDPMGdLddKCEgmbwKYFVjg61bUjJ
 Vx0grb6BCaF6jLr0Kj5aasK3TfIFoo0vdWRkTZcyroo0LSFXQRql7xX9C
 zkixwVPE0ml7i82+YKshrOjExjHZOHZ+VSWqgtU6t5AKzKf5Dr4GWNg18
 a+TxvRDlxnLgBJfeCBKkHo43NJkMNI4M0zVcaNlvQmY4fBuwmJV0tZXXk
 +wdPa8TjF5CEP9iYWs0/vpSofh1xcabNaGCEofLyXO/eU7Gy+7EOUpIt9
 KWV8tuW2/8+07YkuTOKSMw4UgdiBW3lBV9dKI9HtQIoHqbNCVAkZhijp4 Q==;
X-CSE-ConnectionGUID: ptUcqunTQV2mGZdK6W/1LA==
X-CSE-MsgGUID: S60vbU/lQn2W97MY2KnVKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70581856"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="70581856"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 22:00:39 -0800
X-CSE-ConnectionGUID: 55++s5kOQtCdr31XUnBFwg==
X-CSE-MsgGUID: c9w4l2f4T6qstG3P4YdBzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="207118709"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 22:00:38 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 22:00:37 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 26 Jan 2026 22:00:37 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 22:00:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y37h8Nj7mAqQWepmfqSzDe+J5H/YEBNZ7GhUkAd95lCacL6is7CkjANxgECRvpu16TyUU6yAYcM88J9Lsnz1Lyv06dJy0J6yLOB5tlfF0U9GIKhcWsjQZrVyL1Tixh9p+wGNxCYL/uW/ls2Wn9vxQYeSW8bmkQdyLJNgVPHzvCaeun5z06h4gXfrXbisb1rZSIMCusjpAHgpkDBE+/JDVwb9Ge+LakO6m+d9bFR5HV6gpM0BVZFkyQPKpQ2qw5VqKpDMv0EoLoo8fKg1Rk3z6fLgFF00z574zBcvJCNL3Y1dh5PQvrXoOfTI9Cl2VrZO22e6MjwvZpXd5f9RYDI1BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsUvcXULiNwsDsTDpikN4rNQYw9304HCQFje+l98dhM=;
 b=CwbdB+Kj+PiTce17ObH9Ol7b+quegJYIm1gfS7Kw2cQpyr3PS/aMbHqwproleEX2XDP3dMiigBMUJtlRmDInlLKzJ71zNo6re88dHhQrjz6ks24coL+FZ7JoBRsSgx/TUhDPTwOzdmOpOEkZBEkPR4+vSj/E8ejZFBHm1mLY4a03A1WGJP7kzSZvm7H3w7GOXCCkpe1hyhKbOrSEX5l9/m0nFDxTA71+/b3ChW4uArumKalXoUklFjsMA6WPzUs4XYFlDgvr7qpw0ZIVAmMsJ/uv963uJUOYGjMGgdee70l6XPMHJ5KdmtsngCCP/i73poF2Vocyk2+qlOYuwDij+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SJ0PR11MB5117.namprd11.prod.outlook.com (2603:10b6:a03:2d0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 06:00:34 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 06:00:34 +0000
Message-ID: <085fa02c-793c-48a1-a971-f9cdd26e02c7@intel.com>
Date: Tue, 27 Jan 2026 11:30:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/13] drm: Color pipeline teardown and follow-up
 fixes/improvements
Content-Language: en-GB
To: Maarten Lankhorst <dev@lankhorst.se>, Jani Nikula
 <jani.nikula@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
CC: <harry.wentland@amd.com>, <louis.chauvet@bootlin.com>, <mwen@igalia.com>, 
 <contact@emersion.fr>, <alex.hung@amd.com>, <daniels@collabora.com>,
 <uma.shankar@intel.com>, <suraj.kandpal@intel.com>,
 <nfraprado@collabora.com>, <ville.syrjala@linux.intel.com>,
 <matthew.d.roper@intel.com>
References: <20260113102303.724205-1-chaitanya.kumar.borah@intel.com>
 <513db214e2adcad6a70cea2461b7bfc26c2884db@intel.com>
 <6cfc4132-0a64-4dfc-85e5-122651202269@lankhorst.se>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <6cfc4132-0a64-4dfc-85e5-122651202269@lankhorst.se>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0147.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::9) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|SJ0PR11MB5117:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f41b48b-c18e-4b90-3b91-08de5d6962bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1l6bDA2RHV2UGZBTjZMTWEvTUdzUnoyT05mZkFBWXhkUlAvNWVmbG96WFRX?=
 =?utf-8?B?SjR6eTl1QTYwcGhDM0RYa1BHcU9KQkU1WWJnUE92VjR2eUI4Nk9LbGVpNTc0?=
 =?utf-8?B?S1ZRL0s0dUVrMHVtT2U4ejFaR2FpM0NIZWNCV2RCem1ERXplRS8rNnVrSnJZ?=
 =?utf-8?B?emhodWhUUlBMQTFLTCs3N3ZwVWtrQVJvQmk0UEpFQU5wcFBwNktlWmUzMURp?=
 =?utf-8?B?aXBwc3hMQ2xjWWhUQ1FzTkhFUWR1Y1RWR2xEQUFFcWZHVW1OQkErd1hRTHdM?=
 =?utf-8?B?czUxVTVWNkw0WEIvTUpQUlNTWGRveUdYSVA5YnRFazZGTTNsWDdneFdiVzR1?=
 =?utf-8?B?NVRsMm9nK0IySU9zZkRzM1VYTzl3QVFLRUtSVmw1V0pINnRrbEwva3k2NWRh?=
 =?utf-8?B?eXFrQnNYdmQ0RStyeFlTaFFoclJuTXJ4YXdhQmZrcFlDbEhlSTJyNnFWc1Y1?=
 =?utf-8?B?VWo3anZXZXBiMktaRWVCVlFESXZMUHVCZDZqcXEyb3BIcmt0ck5oNWwycXE5?=
 =?utf-8?B?M3k1OU8zK2dSa3ZqR28wTlFLM00xZC9ZVk1ZS3VMeGpnZTlhMUlac3R6MElD?=
 =?utf-8?B?bUZRYXlBMUdzNGRuV0I1eXJORzZUOUNvbEhNZ2E3MGhhSkFENW5LdEcxcVBp?=
 =?utf-8?B?QkRaaERCRXZEb2lwSUozenNaMERrK25pcllhNFVBYXZYRUMxaWE5RFpNbURu?=
 =?utf-8?B?dVpjU1g0Y09xRS80NVdGaXBXTVhkRkVCcFhTTjVRRytTRnkyWlJDZk9RQ1pj?=
 =?utf-8?B?d3lnem5INUJjc3Z1amdSczgyRkZyMXlmNEp5eDk1Q3JDeXJXQjZHK3EzUERZ?=
 =?utf-8?B?d2dKMzlKUlVPbkVkVzlkOGk4MDBZaUtzWTI4VDlPek9yR29taFg4VnQrT0lp?=
 =?utf-8?B?VDhZS20zVDFRZkoxSjQyZlRBbnVVVTZpQ0IydEczTkljSU1najVRVVlXbTZv?=
 =?utf-8?B?Wjh3bUlyWEo2ZGNIaU9Kb1A1TEhBOWtMdEZpMXBURWdPTUxoLzRlbEtNcm5z?=
 =?utf-8?B?andtOTlWTW1QbkNHb2xVUlJqWE9HZFRWRHUyQVJaVXNmR2loMWlzNjNWT00x?=
 =?utf-8?B?NiswTTZIYXIwRk5mQkUvQ1RFc2NzVk1XNXFSaGw4QkxJK3hYSTJsTG5tL1BS?=
 =?utf-8?B?bEltZmxOWHZkNncrZDdUWVhEeGtHUGg5cGl5c2NTVWdjcGxoTUVkU21YZjRi?=
 =?utf-8?B?bGp1MjRHV0Z3S01HUHcvTCtRR0JLb25SQjFNbHRib0NyMndua01iKzB5NmIy?=
 =?utf-8?B?amxtZENWVTJnVmdOcXk3UCtuWTlNcm5JK0RsYXNCaE1YOStlbjlDVGV5QlBH?=
 =?utf-8?B?V0hYOFpKcnNwQ0oyTWtwcGxjd1ZWdzBHeU1sWXBEdzZEOHZxWkdRdXFVdVZX?=
 =?utf-8?B?YStIU1RoaTJvSmRQYlR1WldSeFFSdnQvR2hvVUs4TzdFK2M0SjJjcGdmSFZJ?=
 =?utf-8?B?SzdHOW5STUcyQ3JGaFhJcHJqM2o1MXZldDRrYzJaUUFmNTVQWXJ3OVZWR2Zs?=
 =?utf-8?B?SVo0MGRoTmtudUc0ZldpRVRUa3JHUEloSXVldHdab04vbG9Db0RNZzhKN2RI?=
 =?utf-8?B?QzM5UjNWVVZCeDIyYXd1YlZzNTlEVVlyQ214R2tNS3NFeFgzdXJqdUp4MG4x?=
 =?utf-8?B?SnNaSHZoeXQzRjB3cVROaUtrV1Y4ZTlLQ3hxZWRybE1XN2dKL1RNbStqaGRX?=
 =?utf-8?B?M0QvKy83eEZPNmh0ZmhBS0NKRWhuS1Jab1RYYmpoejRWSVJiQ0w4U0E2Uktl?=
 =?utf-8?B?bmErQkdqSnFnWXM4T0RLZVlJRUtwVi9OZE9IckVSN0ROTHRvTnVZd3BLck5J?=
 =?utf-8?B?VW12dEgxamMwc0dzTVpkbmRhNkwvY1J5RFlCckpicnB1b3l5NTB3UHVPbmEx?=
 =?utf-8?B?ZEpzUXM1S29pbUl5VFhPb2s5aXNjZnRyT0xacHR3TDl2UDg1QXEzZm9jeUpN?=
 =?utf-8?B?VnAyeExmeGplNHV1bk1lbG9sYUlIWnFNYTVtLzRJVy9aUnYzcGczUXRzdEJP?=
 =?utf-8?B?MWtwZlJScVB0WFZkUHVxVW4xdGNlaWJ1Z0pxQzNFZTMyeGVLRVBlSnV2dm1v?=
 =?utf-8?B?TWxERTd0ZDh0SnlCb1oxb0E2V2trSmN0Z1VaU3hnVnBjUmVVaWE5NEQ0UWNj?=
 =?utf-8?Q?RX+M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3RwSUZ0RVZPclZ6ZHA1b2xmR1Q1b04wMkhCVGNacmJ4dS9YWVIzcm1McFFI?=
 =?utf-8?B?WjF2d2xDaVN2Vk05b21YVEV6S2ZZZDIxQ2IvK24xcEJlNVZrNU9LR1ZXWUMz?=
 =?utf-8?B?bFFCZHlaeTRyNnU2eU8zelRGRHc5NnQ4U0IxdW9nem9sNm5yTUhQQ2YxaHVZ?=
 =?utf-8?B?TldFcFF3UXJzMWlOQkkxc1VnWmlBL0xZckRxR3Arb0traUVBYzFrM05aaU9s?=
 =?utf-8?B?TzFyZFlHZUptLy9nVDk1SFk3MnJlSDFwSFJYRWMzUHhrc2xOK3RjeUYzOXRR?=
 =?utf-8?B?cGdJaXM0VkxmVjVTcTFOUWQ0N01KTnI2dTZkSEd1KzF0R1FLZVhYcURiL3F3?=
 =?utf-8?B?ZWhhUGtqZk1TaHM4cjc5QnBoQkpiR3NTRU9zMlp1NU5vVEFFaDYrc0FSSFlG?=
 =?utf-8?B?SzBjSVpoKzB3c1I1MWp6UGdlNXFIelhSSzdVT0h3aGdLdkZuK1IzWXBMejhu?=
 =?utf-8?B?akp3ekJtNng0MHhvUFVpUDNQYWo2R0I4VUxIelh6cThKejdjMjdhaUZEV01Y?=
 =?utf-8?B?a3QvQ21QYWl4UktNOENFSDMzNEVkVTNqWm0wVXdENEMrY3dKV2s2Vis2YkZV?=
 =?utf-8?B?RHlIMzZibU1FaHVubnBZZmgvbzNubE9JQjh4MzdlckpiTE1xSnFva2dxQUlw?=
 =?utf-8?B?N21udFNiUldOZ0NYdEhTQldhVkJTTEF2dDFTS2RjTUNBY29wQzVlSUVWV1dN?=
 =?utf-8?B?L05sMWJZMlhjM0xsb3J1dXF1ZFhDL0hHcDQyaUtvNnVseC9ERW1xK1VveEF4?=
 =?utf-8?B?T3l4SFVTZmt1Vm1NY2lHRFdhSEFVbU9uUFVtbVpIbnNWcnNyM1gycnRJd1Zr?=
 =?utf-8?B?c1BSNWRaWWFkVFR0QnlKdmlnblQ2cW4rUEpjam9ZSTJ2TmtucU96eTVqVGU2?=
 =?utf-8?B?alpQUk5aRnBRd1ZwL0FjR0Q3dEtPWjFoT1NIMXpJVU1oY2RhOEI4RGdCTzhz?=
 =?utf-8?B?bUR1ZWZQRkxwRmZTNDVQZFZRMmdCMmVYOTFQVnJHU3FrZEVZbVFyano5K3E5?=
 =?utf-8?B?L2NaS3lORU8xT25jQ0JRdFNkaDJVZVhNbUg2dVF4NFhGMlhuUS95aFBtMk03?=
 =?utf-8?B?VngycDV2ZjBXTDcvOXNQeWtiQ1Q0TXFMeElrMWNnMGhNMGYzS2NDdG1mdytK?=
 =?utf-8?B?MDVjM3hpMStIcnpZeEpUb3RwdXFuaXRNZ0I4Z1ZKVUhaT3lteEMwM2FYempN?=
 =?utf-8?B?QnNaUHczMmRzYjRpSlI4a1BWV0QzSkpEWElSbDhPQXc0MXdsaXdMNmF3WWtE?=
 =?utf-8?B?ZlRDNG95dFZtVEdLSmNweWVVRkdBSCs0Z1dkNnBwT2hVTCs5MGNxcUg0Wkhr?=
 =?utf-8?B?QnBKLzRGZ1dTVTc2WmwyYkhpS3FNQWxDdHRxcDVIYmVMNk92eFVodTIyZUtU?=
 =?utf-8?B?em55TDdwdy8xNDR2ZG5CS3BTT3FtdGtaL3dXT0t6ZCtFdWdFaHNBMjlGa1RS?=
 =?utf-8?B?SEtZcWNBOHZEZGN2TTlhOE9qYkQ5UmNQdHUyL1FEbVpNMFhvSTAwRnA1cDZM?=
 =?utf-8?B?RVptZ3ZZSnF6Mk1FRUUyWG5MWVc3c2VsSTEzM0dBOXBqTE1idHFaVEpFL3ZH?=
 =?utf-8?B?Y0gyREx5YVh0WWJiMDJwdlVpb3dvZ1JxczFSN2dTU2FwU3NzQk1MOWZhc21j?=
 =?utf-8?B?WUIxUnZERXJQeHh6a05iMnJhcFgzM0JLZDdQL3BJSktFc0tqL0lxblhmYW1Z?=
 =?utf-8?B?a2YrdDFIaStVbUtEdnlIMnloMERBYmZtMFdQbFgwYVlXbmtUZU5GckFFajlC?=
 =?utf-8?B?UzMyUlN2MEdoN1lWTFZNdXBGeDJXa0oza0dWMGtRUkNMeUJsV1h3dWJxWFVD?=
 =?utf-8?B?aVZRQW51VEpUWUtndG5XdThRYWlhTEg1NGJUN082Q0M0RENIbVJEV09zMXBn?=
 =?utf-8?B?SzRhZXBjQXZWMU9YL3BXREpMWFlPNFhYZER2T0gzT0trdS9ZKzk4VTZkWkQ1?=
 =?utf-8?B?RkQ2SzRtU1M4UkJPTHRaRmk1MW43T2JLOHh0Mzl6NWI5K3FqN0UyWGtXVXRr?=
 =?utf-8?B?NkRsamxwSS9HOTNtd1BGSDhuTWR1YmJ6T0w4ejVwWmsrZzlpcDI2YnU2NU9z?=
 =?utf-8?B?TjJxOFh2M0ZXMjVheFJSNkovUitDa2ZEbGxtK29xd29vR2ErQTk1bTlVaDFn?=
 =?utf-8?B?Z3VocWNLQ04zdHdzYXFtQ0NKYzhsZGJKdTR0cDY1TStZVWN6ZGZPTHhTTHRP?=
 =?utf-8?B?RXNOdXFvcG5EVVNhWit0SDhjanhpL3VQT2d3bUNRa2FVSlJ0bnFOMUF1VW0x?=
 =?utf-8?B?MFBCbHpBbnBSSklmN3JzRnBjcnJBdkFWY21sVUlxRnZtZUlCeW0rcUlhR1ZJ?=
 =?utf-8?B?SUU4RFhlNWt1SGhkRWpXbFRPdjkrMHlWM1l2d2lrYkEwU2JBYU1mM2c3RmZ5?=
 =?utf-8?Q?vRHMOptDkRhgXHps=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f41b48b-c18e-4b90-3b91-08de5d6962bc
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 06:00:34.5948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A7EHEPb9U9dhnS25gvYZSirv9zBBOkD55G4P727C8QRk2e6OXQiwSGr5zhLkNw0l/geYCFnGDoa9rL/2N/qhJNhUEW5tzw/LvOf0cEQLYwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5117
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[chaitanya.kumar.borah@intel.com,dri-devel-bounces@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 4435190351
X-Rspamd-Action: no action



On 1/22/2026 3:27 PM, Maarten Lankhorst wrote:
> Hey,
> 
> Den 2026-01-21 kl. 14:51, skrev Jani Nikula:
>> On Tue, 13 Jan 2026, Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com> wrote:
>>> This series contains follow-up fixes and improvements for the DRM color
>>> pipeline infrastructure that was introduced in v6.19.[1][2]
>>>
>>> The central handling of clean up of colorop from the mode_config list
>>> is missing. While vkms calls drm_colorop_pipeline_destroy() in vkms_destroy(),
>>> amd driver calls it only during failure of the init path and i915/xe driver
>>> does not call it at all. This means amd and intel leaks these objects on
>>> driver removal.
>>>
>>> This series adds the teardown of mode_config.colorop_list in drm_mode_config_cleanup().
>>> Since, i915/xe sub-classes the drm_colorop within intel_colorop it was not enough
>>> to just use drm_colorop_pipeline_destroy(). Therefore, this series
>>>
>>> - Introduces driver-managed destruction for drm_colorop objects and
>>>    updates core helpers to use driver-provided destroy callbacks.
>>> - Ensures all colorop objects are correctly torn down during
>>>    mode_config cleanup and driver removal.
>>>
>>> In addition to that following changes are made in the series
>>> - Fixes enum name lifetime leaks in color pipeline init in i915, amdgpu_dm, and vkms
>>> - Corrects the ordering of the 3D LUT block in the i915 plane color pipeline
>>> - Refactors i915 plane color pipeline initialization to reliably clean
>>>    up partially constructed pipelines on failure.
>>>
>>> Thanks for taking a look. Feedback is welcome.
>>
>> I did not do detailed review, but
>>
>> Acked-by: Jani Nikula <jani.nikula@intel.com>
>>
>> for merging via drm-misc.
>>
>> Please coordinate with drm and drm-misc maintainers on which branch
>> these should merged through. IIUC there are memory leak fixes for
>> changes heading to v6.19, which speaks for drm-misc-fixes. But is it too
>> much at this stage? Up to drm and drm-misc maintainers I think.
> 
> I pushed the first 4 patches from this series as they have to be
> addressed most urgently. It's a leak affecting each system and
> incorrect UAPI being presented for intel/display colorops.
> 
> We need to discuss on how to merge patches 5-13. Should we put
> it in a topic branch or push it to drm-misc-next-fixes?
> 

Thank you very much, Maarten, for merging the patches.

In case the "Fixes" tag is mandatory to push through 
drm-misc-next-fixes/drm-misc-fixes, the best approach I see would be to 
add the following tags on the drm core patches. (i.e the first patches 
that added colorop for respective drivers)

Fixes: ef105316819d ("drm/i915/color: Create a transfer function color 
pipeline")
Fixes: c1e578bd08da ("drm/vkms: Add enumerated 1D curve colorop")
Fixes: 9ba25915efba ("drm/amd/display: Add support for sRGB EOTF in 
DEGAM block")

and then add the corresponding Fixes tag to the indivisual 
driver-specific patches.

This won't be totally accurate for vkms as it was already cleaning up 
the colorops but the patches are too intertwined to isolate it.

Please let me know if this sounds reasonable.

Thanks also to Jani for the ack.

==
Chaitanya

> Kind regards,
> ~Maarten Lankhorst

