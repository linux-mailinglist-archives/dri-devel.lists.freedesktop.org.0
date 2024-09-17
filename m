Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8875E97AC8C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 10:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692F210E42B;
	Tue, 17 Sep 2024 08:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUcpfySP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFCF710E1FE;
 Tue, 17 Sep 2024 08:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726560245; x=1758096245;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3iGWoth0wbWfeCP04ZJqnpZdAxuXK+56l853d73Z1jU=;
 b=PUcpfySPM9nuIaB1pyfW5qln7JAK/eMuGl6JYLKjffOgUyc0xetEbIXI
 xjAHdtTbdKkTQDhUyFJrHARmW0MxZfPNOTVvVBlK1qv+fiqvK0p3WmyAk
 l3nMLuzPYNFPR+vSeXeWtyBphiGH6MM8Rg5ifkKBpPcNAlvf+0ojvdFRY
 XTSFkjXlYGqLOEpUFajqDt13a/Z3PmmFqcy6ppKVnQ7rwW6zvyfkYSFuO
 oFoxVLPbJaVc41H0pmI1/4fRiGz6hHXF0p/++eUnx83U7FXeQWjjaWG3p
 DS8Q1fnchfNgXAHxewo98OBfDw7J69njh+2W8wh65mYijdj28WwsoHIAv g==;
X-CSE-ConnectionGUID: 5cn/SfjjS6WHFo13QAGSrA==
X-CSE-MsgGUID: bxg1mWJ3R2aCvxVzjtWJRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25529232"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="25529232"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 01:04:05 -0700
X-CSE-ConnectionGUID: aarMhc7qQXKwYpc/1C935g==
X-CSE-MsgGUID: AnpcfsCXRemY/tVAud0DoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="99796492"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Sep 2024 01:04:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 17 Sep 2024 01:04:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 17 Sep 2024 01:04:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 17 Sep 2024 01:04:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 17 Sep 2024 01:04:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGRN3pEBqd4pUO5rh4YOvSjEMF6J/vmVQY7ELqh1k/9yGYS2sn7/kVig9mDrCdiN5eM8LXZWhv9/zcuSKIcLhUOj7p9P+wCpfiVhaK3BT/DoF73hLiy/WC1s8GIGdLrKjxies6YwUk9DHnJA2m0YBtceF/RsclK9oP3WWFa57lo5G6Tx0X9IplBvahQyBRc4CHbIjreC/bRN/yxm/NC15sv+5x+x1vldatBglEF+l7w78f/jjWkNZQyg1xTcPGPu3uOYM07oCY7ME+1YZMtUzIQ7gMEOYPprleZ8BwMuXRLLfSDKfFQ5fmMLK20KJRlw4K9CVdHmgkRpGSD95txe8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXwcDyBI+zkjUuvFpmHJRBcrvEQnl5guYG0fq6WsKxw=;
 b=gTGFvw/J62n2ZomBEk1+HR77ivvFxQkWxGAK93OQQNMRyiZrPDg5ueDxCW4oQ14CFwvp0UbIZX7VODtDGOugaSQYpd6IMYBm0UzFKmx5n29YoPOZTbwJLs8qs/hFOk3ITXWgrupzzTkNz6k1YxbOi2vXUxHcqM4zcA26VYhSmChCD8iHZXw4Wf0oWZHMGa6yY56u5VHDrXsSPrjn3s35Gpp+25Knmb8xmMeSKAHL95qULx26Dt/9RAt4oFXMrrJ6q5ZUEMPh0jEcZcRQoGzR9xKJkLfPWEq9Uc44jbs+qgBlv25BsL+dNsOsz29Y3qmXoMo2MpFY01SbbYgpfBFgoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA2PR11MB4921.namprd11.prod.outlook.com (2603:10b6:806:115::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Tue, 17 Sep
 2024 08:03:55 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 08:03:55 +0000
Message-ID: <97077405-333d-4940-94e1-7e6a5d9c38b5@intel.com>
Date: Tue, 17 Sep 2024 13:33:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] drm/xe: Use device wedged event
To: Raag Jadav <raag.jadav@intel.com>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <lucas.demarchi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tursulin@ursulin.net>, <lina@asahilina.net>,
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <francois.dugast@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <andi.shyti@linux.intel.com>, <andriy.shevchenko@linux.intel.com>,
 <matthew.d.roper@intel.com>
References: <20240917040235.197019-1-raag.jadav@intel.com>
 <20240917040235.197019-4-raag.jadav@intel.com>
 <86908889-2628-44b8-a2e3-af700217df50@intel.com>
 <Zukj9y2oZve73NLy@black.fi.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <Zukj9y2oZve73NLy@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::27) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA2PR11MB4921:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e3e4fed-56c3-4653-d6e5-08dcd6ef46a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nzd5bXBGOE1tNFhHN084Zk4xZ2F1TXBsK09pRHdJUDdKdjI3cVJVV3o0a2hD?=
 =?utf-8?B?VVROODM1bnBNd2NwdWlTclp6bFFWQkpxcmJGWWwzZTdSYisxYUVkcXAyOGJU?=
 =?utf-8?B?L2pSRFpwMDd2ZGxpNzNhRnlPTExIbkY2aTY2blRMRHg5VTQ4ZHB5c2ZQQUh3?=
 =?utf-8?B?NC91VkpnTWo0bXQvd2NXcVkyaTVpb3R4bXlodGNXd1VBRkdTNVUzNGl0NzFo?=
 =?utf-8?B?VGZQRnFhaVpuR0tYeXRXaGNrUDNvaktHcHBEd2VUUHNTVEp2Zkx3QXEyc0s1?=
 =?utf-8?B?Um1rNkw5VjNrbjhUcUEvcnBXZmdzb0E5YnBIYUlLSStJZVFuKy9RWUtlMjQr?=
 =?utf-8?B?aWJhY3VYVEZzT1lFMGxzV1FJeWFrVTFFUFc3QWJZaTRGbzBqdkNJa3o5dGov?=
 =?utf-8?B?NlJnYWUwWDhBQWdmeFlMMGhWOUVMUUZWNjB3cFdMTFZTNjk2QmYzeHNGdmtB?=
 =?utf-8?B?SGEweS81SnQ5dlVLbGpFTVVWVmlObVhLb2l1TnJjczJsMkR3VnAySldxR1lj?=
 =?utf-8?B?SlU2dzZyZWJWTmtMVkMvaXhOdDl1ekRoejF3MmdmUm5BNHNkSVlnYnBFbTA1?=
 =?utf-8?B?YXhhcEVFclFvazZpaTlaaUM2cWQyVkc3eVhXcnJjL0RvRlBuZmpYZ2JuUElu?=
 =?utf-8?B?Y29VMXkvRWY1bEVmVHJBTEJXRWw1clJWNTUrSlQ3VEhFcjZBbWdMSUJTUXIv?=
 =?utf-8?B?eXBjQ05URytTclFPTC8xRytGVlVYRUFLMk9Bb2M3NTV1UUpRMkEzWXhCN2xF?=
 =?utf-8?B?eDdBMGVzZmJzUFQyeG8ranJqVDRrTkxFc0VlZ1BKNy9TSmRrV0hQU1Q5dnpY?=
 =?utf-8?B?Ry9QVkZ0d3d3TFloUkcvTnNXKzMyOS9tNjBBMENGUGs0MVJoZ0orR2d5S1ND?=
 =?utf-8?B?VEtRY0ZyQXZiZE8ybTVvL2l0WTAyV0pjZStuM2tqYWNHdGRDMUJPMkEwTWxB?=
 =?utf-8?B?N3ZuRE5vbVgzczZka2ljYXZ5a1R6d1VzQ05zMGJvRnRBYWwxTElmNHB3UFF0?=
 =?utf-8?B?dnRvSFZSdzg1UVhTZHFIRGsvaXgyWjdHZ3J1dWY4aDEyb3VlMGtEMmlaZ2Qz?=
 =?utf-8?B?ckcwdjZraGxmL2N6aERXT294dGpCMWpQZmlhZ0JJa2hGcU1NL3ZJL3dQL0Jz?=
 =?utf-8?B?T3IwZUc4aDNwRjVmRTVoU2xhM2h4V2o4QlpYMVdMeDNkV2FNQ2dvMVNhOVgx?=
 =?utf-8?B?TE5JTFVVWFozOHRnK1Y0eGhvWWdablZ3eUxuMEY5L0ZDaE9Gays0anNJOE5n?=
 =?utf-8?B?RkloRXpITDdOUWxKQ3VWUU4vZ1NhYzVtd2s5aFFLSDAxLzNwMmNTMVJuWTRz?=
 =?utf-8?B?RVI2SW1oblVZT01FcFJFTUxBY2REMkoxUFdzOEdCMkl3alEySngxZDhVRW1i?=
 =?utf-8?B?V1ZIaXBRa3c4ZXRDVjlYbm1sM0lYY051Q0JFQ1dMemNPZjdpaW1PV0crN3Bx?=
 =?utf-8?B?YkdDa3RBZ1N3ZGFPSktZamxhUDR3L3drN0MrVkVnaFlDT01HZGJNM0dyMG5O?=
 =?utf-8?B?aFo3MGc1cS9CZmZMNkRHQmRJeXZRbVg1S3haWE54R1lmc2JVVTBQU3dxZ3BE?=
 =?utf-8?B?VzBHOUw2OGluT2F1NnlxMjJqdDduZFk5eVFSYlVDT1RDdjVkNXIyYVJtbFdE?=
 =?utf-8?B?eE0vSTBtMERlMnZtVDFkbTZ3VzRaVzJNN2l2Z21VWEhwaDQyR3dEdEFuVFlG?=
 =?utf-8?B?amkzQm5wUG51TVM5TVI5a1pnS3dLK2RsNXR4Nm1Rc1RhZDlkVk1nbm0wWm5U?=
 =?utf-8?Q?teA7FJznHC0jSgYt+k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0orVXRJdVllSnhOd1ptMTJLWEppK1NpeEx2OXRDd3d3SHd0T3NxanRYcHFK?=
 =?utf-8?B?K0JPSGFvR053VmRnRjQ4aFFHOXVtY0FKZS9qTFIyKzlCcnBYVDZrUVRTUkNF?=
 =?utf-8?B?VDZLU2JIUzBjZHlGRkR1MG93U1NMcFlnVnZ1TTJQUDNkU0h3RjB5TU4ydW9L?=
 =?utf-8?B?VVdJem8zb3JTaGJBM3cwNDk4Y3RnRWEza3VHSndEeml3dzAwY29WRnV6YXBW?=
 =?utf-8?B?angxQkxaZkY4R3p1dHkzQmxoUTE4NkNEUVBaZlVRZVkvZS9IUVFESFF3ckpD?=
 =?utf-8?B?OThDeVVGV2RGOGFTcWpma1dWY0xkdi85d3FYbk5acmNhM3psK3VxeVhSTXBo?=
 =?utf-8?B?WnNnWndacjE0Q2xKeGVhaXVwRlNLR2R2TitIMzk3b2JRSHZqUmo3YXlscXpz?=
 =?utf-8?B?NTdYZTBCTFlhdjYzYjh3SVVaNHdEdEs3SkpWMk9Nb0xhcDhjN1RLcFRsdGlJ?=
 =?utf-8?B?TzhtZUM5RVREazZXOVN6dzlUODFxOXpXb1JjMFVaYTkxaitSVXJ4aC9pdER0?=
 =?utf-8?B?K3BBbEUvM2Y3N3Rzb0RJNWNwM1h3TGxIME5TZ3JOY3lzcHRpS29lTFRESlk5?=
 =?utf-8?B?cnVLTE11emx2OHpndHZiZjNOVEJyYWl4RkMwTGthOTRiYjNqTmsrbmRsbmZu?=
 =?utf-8?B?dnZCcjhxVGJFMHBhTnBHZGlKL2t2dUF4M1g0TEdKV2RNaWZ4Qi8xU05kZ3gx?=
 =?utf-8?B?WFA4VW9CTi9kaEZoblZaZUdmcmVzT2lyRU04clpSZk1ET29uNXR6MVFSTjFN?=
 =?utf-8?B?a3VMODFsOFJZYVdKQnJTREo4aGZTUGRvS1Q1VjZJd2FXTTVia0xKWHVERHN0?=
 =?utf-8?B?RnFZWjJPZzNDSVdRciswZmpZWGY2UFZGMkxGekZ6Skd4NlZnRkloWDJQaE0r?=
 =?utf-8?B?dHgvS0ZaWHFwVVV1ZUQyaVJsQUVTd0FsSWhnaWp5c0Rjb2tSaGwreTFINjhj?=
 =?utf-8?B?ZmpDb3VGQ010MUhTSk90T3NOSHQ5R05wVUpVZ2RUaDdiRDg2VHlCMENtcXdw?=
 =?utf-8?B?ZTF2TEM5ZnRaSVFmRUFZWVNOUndwR2YzNFhudkNlQ2oyVmh0NUt2U3ZpcW02?=
 =?utf-8?B?QkpjVnRHTzV0aFA0c3ZuQmZUa3c1Y2lEZDVHTDVYaEo5Q2g2RXdtTWtxRHpY?=
 =?utf-8?B?NDVCL1BtSVBJV1Flc3BGb0s5VkhLNjB3T1BXOGFYRzVMTkJMOFNtM0pWQVR1?=
 =?utf-8?B?OEQvN293NlZWL3J2UjBKK1JyZ3plc1dsbUJJcXhvVmFXTWNLNUFyWWx5V1pi?=
 =?utf-8?B?Wk1vbnpCTDlrVzh4MEkrNHBqbmJVY3M5dEtpZHh3TEs3NkF3Zk4xMXdOSzNo?=
 =?utf-8?B?QlgvejNrVDJncGtzamk4VTdyK1hzZml3VUlZMnFnRVdUTHNIemFYejVURHFw?=
 =?utf-8?B?TFlaQkg0Ti9LK01BckpBK0RDMGtzbDNnUkhHWGUybHNQVERQbzJUL0hmalpY?=
 =?utf-8?B?WGJXZlhKZmp1d1RBcmgzQXB2Wk96b3p4RkdyQU9IQ01xQ3Z5WmoxM0taNEIr?=
 =?utf-8?B?N3J0MG5sY1NIMkFYdDBJcTQwaW02bzJ0RWlHZDlJU0V2dUpiRVBjVHVwR3F2?=
 =?utf-8?B?VGcvT2JOQjBzTzdKeUhLUm0rVzh6anRTRDJLc2RGa3V5dkh5MVY5VU5CNEFi?=
 =?utf-8?B?ZThDTkFjSE9kbzM3Y1BRZmlKdGx1Ulc1Q0VEaDFYQ1NIK2dNbVVaMjdWNG95?=
 =?utf-8?B?V2h6Q1M4cU9YU2xIRUxsWFRFV1hOYVZJMG9PQW9xb0tKMjhqaGs5eElEYk9X?=
 =?utf-8?B?Qnd5ZTE4TUovY1ZtZzVtWHFOMm1McjFpRmgxajFENi9sbE0vUUI2eHExZlhv?=
 =?utf-8?B?cnZqMGdBaEdmZUtFQVJkbXB6Vm1XbVlEMjkvUVRQUnB4ZGlEOEEzUWFCbVBa?=
 =?utf-8?B?d25MQmhzSmZIYkY3RXdrdXE3U1JLRE1XM0tTVzJqWmVHcjdCRkFZSHA0Nm9K?=
 =?utf-8?B?RDh1ZGpRVWlCODJreVVhenJHdnJiVTdQbFlUNkw4QnEzdTM3WFBsNVBhZ2RM?=
 =?utf-8?B?a0NHZGdEMDR6VStOeDluVU5zWFFWcng1Mmg5aEhUN2M2REhjRFNxTkUzbjBm?=
 =?utf-8?B?TDhMdFo4NTV6T0ZjMUZwOXBFYzE1dUVQSVorRXNIa2Fsb1M0NnRVVXVGUjJm?=
 =?utf-8?B?S2lncGtUQTNhei9sT3ZXSVJEQ0xadFp4UjAvM0ZNZ2N3Z0lQTXJCRmJTM0Zr?=
 =?utf-8?Q?6y5Qgr6PlSjsGEpE31ew8Ko=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e3e4fed-56c3-4653-d6e5-08dcd6ef46a9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 08:03:55.4126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nWPM5NCMzDvI0TR1Fxaq4leeFtuLSzByQEEaK3OldzbIOlIEe57JOgVQpkhVst2cPSKtH8Ohr10lW12HHtWsZbJBhKtCECHMbEj6g+yiPLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4921
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



On 17-09-2024 12:08, Raag Jadav wrote:
> On Tue, Sep 17, 2024 at 10:11:05AM +0530, Ghimiray, Himal Prasad wrote:
>> On 17-09-2024 09:32, Raag Jadav wrote:
>>> This was previously attempted as xe specific reset uevent but dropped
>>> in commit 77a0d4d1cea2 ("drm/xe/uapi: Remove reset uevent for now")
>>> as part of refactoring.
>>>
>>> Now that we have device wedged event supported by DRM core, make use
>>> of it. With this in place userspace will be notified of wedged device,
>>> on the basis of which, userspace may take respective action to recover
>>> the device.
>>
>>
>> As per earlier discussions, the UAPI was also supposed to provide the reason
>> for wedging( which is supposedly used by L0). IS that requirement nomore in
>> place ?
> 
> Wondering how does that contribute to the usecase?


ZES_EVENT_TYPE_FLAG_DEVICE_RESET_REQUIRED uses zesDeviceGetState

"Get information about the state of the device - if a reset is required, 
reasons for the reset and if the device has been repaired. "

https://spec.oneapi.io/level-zero/latest/sysman/api.html#zes__api_8h_1aec73230b938f08ad632d0b7817b66183

> 
> Raag
